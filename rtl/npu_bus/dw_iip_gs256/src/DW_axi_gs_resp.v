// ---------------------------------------------------------------------
//
//                   (C) COPYRIGHT 2005-2011 SYNOPSYS INC.
//                             ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys Inc.  Your use or disclosure of this software
//  is subject to the terms and conditions of a written license agreement
//  between you or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// -------------------------------------------------------------------------
//
// AUTHOR:    James Feagans      2/24/2005
//
// VERSION:   DW_axi_gs_resp Verilog Synthesis Model
//
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
// ABSTRACT:  AXI to GIF Response Module
//
// This module handles the GIF to AXI transaction responses for RD and WR.
//
// Response datapath (resp):         <from req data path>
//                                        |          |
//                                   |--------| |--------|
//                                   |fifo_bid| |fifo_rid|
//                                   |--------| |--------|
//                                        |__________|
//                                             |                   mready
// AXI BRESP -\                    |---------| | /-----\           svalid
//  Channel    \___________________|fifo_resp|---|logic|------ GIF sdata
//             /                   |_________|   \-----/           sresp
// AXI RDATA -/
//  Channel
//
//
//-----------------------------------------------------------------------------
module g256_DW_axi_gs_resp(
  // AXI INTERFACE
  // Global
  aclk, aresetn,
  // Write Response Channel
  bid, bresp, bvalid, bready,
  // Read Data Channel
  rid, rdata, rresp, rlast, rvalid, rready,

  // GENERIC SLAVE INTERFACE
  // Global
  gclken,
  // Response Channel
  svalid, sdata, sresp,
  mready,
  
  // INTERNAL CONNECTIONS
  // Inputs from sm
  start_wr, start_rd, advance_rd,
  auto_sresp, auto_svalid,
  // Inputs from req
  id, len, exokay, exfail,
  // Outputs to sm
  start_wr_ready, start_rd_ready, advance_rd_ready,
  // Output to low_pwr
  resp_cactive
  );
 
  
// ----------------------------------------------------------------------------
// PARAMETERS
// ----------------------------------------------------------------------------

parameter fbid_width  = `GS_ID+1+1;
parameter frid_width  = `GS_ID+`GS_BW+1+1;
parameter fresp_width = `GS_DW+`GS_ID+2+1+1+1;


// ----------------------------------------------------------------------------
// PORTS
// ----------------------------------------------------------------------------

// AXI INTERFACE
// Global
input  aclk;
input  aresetn;
// Write response channel
output [`GS_ID-1:0] bid;
output [1:0] bresp;
output bvalid;
input  bready;
// Read data channel
output [`GS_ID-1:0] rid;
output [`GS_DW-1:0] rdata;
output [1:0] rresp;
output rlast;
output rvalid;
input  rready;

// GENERIC SLAVE INTERFACE
// Global
input  gclken;
// Response Channel
input  svalid;
input  [`GS_DW-1:0] sdata;
input  [1:0] sresp;
output mready;

// INTERNAL CONNECTIONS
// Inputs from sm
input  start_wr;
input  start_rd;
input  advance_rd;
input  auto_sresp;
input  auto_svalid;
// Inputs from req
input  [`GS_ID-1:0] id;
input  [`GS_BW-1:0] len;
input  exokay;
input  exfail;
// Outputs to sm
output start_wr_ready;
output start_rd_ready;
output advance_rd_ready;
// Outputs to low_pwr
output resp_cactive;


// ----------------------------------------------------------------------------
// INTERNAL SIGNALS
// ----------------------------------------------------------------------------

// fifo_bid
wire fbid_src_rdy, fbid_dst_vld;
wire [fbid_width-1:0] fbid_src_data, fbid_dst_data;
wire [`GS_ID-1:0] fbid;
wire fbexfail, fbexokay;

// fifo_rid
wire frid_src_rdy, frid_dst_vld;
wire [frid_width-1:0] frid_src_data, frid_dst_data;
wire [`GS_BW-1:0] frlen;
wire [`GS_ID-1:0] frid;
wire frexfail, frexokay;

// fifo_resp
wire [fresp_width-1:0] fresp_src_data, fresp_dst_data;
wire fresp_src_rdy, fresp_dst_rdy, fresp_dst_vld;
wire [`GS_ID-1:0] muxed_id;

// indicates read response, write response, and last read response
wire rd_resp, wr_resp, last_rd_resp;

// read response counter
reg  [`GS_BW-1:0] rd_resp_ctr;
wire [`GS_BW-1:0] next_rd_resp_ctr;

// internally or externally driven depending on `GS_GIF_SRESP
wire [1:0] sresp_int;
wire svalid_int;

// registers used for storing next automatic response
reg  sresp_reg;
reg  svalid_reg;

// multiplexed output of exfail and exokay signals of frid and fbid
wire dout_exfail, dout_exokay;

// AXI format of sresp_int for input into fifo_bresp or fifo_rdata
reg  [1:0] axi_sresp_int;

wire sresp_int_ok;

// These counters are used in GIF Lite mode to guarantee that all outstanding
// GIF responses will be accepted by the gasket. This means that the gasket may
// only issue as many response-generating requests as it has available response
// buffer space. The token counter is initialized to the depth of fresp. It
// is decremented upon a new GIF (rd/wr) request and incremented upon AXI
// accepting a (rd/wr) response. If the counter reaches zero, new requests are
// stalled.
reg  [2:0] token, next_token;
wire [1:0] token_select;

wire rw_resp;
wire start_rd_gc;
wire start_wr_gc;
wire wr_resp_rdy;
  

// ----------------------------------------------------------------------------
// DESIGN
// ----------------------------------------------------------------------------

// indicate to sm whether ready to advance the beat of a read transaction
assign advance_rd_ready = (`GS_GIF_LITE) ?
  ((token != 0) | (`GS_DIRECT_AXI_READY ? fresp_dst_rdy : 0)) : 1;

// indicate to sm whether ready to begin a new write transaction
assign start_wr_ready = fbid_src_rdy & advance_rd_ready;

// indicate to sm whether ready to begin a new read transaction
assign start_rd_ready = frid_src_rdy & advance_rd_ready;

// indicate the clock is required
assign resp_cactive = fbid_dst_vld | frid_dst_vld | fresp_dst_vld;

// If in GIF Lite mode, use internally driven sresp/svalid and drive mready = 1.
// Otherwise, use the port connections and fifo ready signal.
assign mready     = (`GS_GIF_LITE) ? 1          : fresp_src_rdy;
assign sresp_int  = (`GS_GIF_LITE) ? {1'b0, sresp_reg}  : sresp;
assign svalid_int = (`GS_GIF_LITE) ? svalid_reg : svalid;
  
// Response type identification
// Controls rid, bid, rdata, and bresp FIFOs
assign rd_resp = gclken & svalid_int & ~sresp_int[0];
assign wr_resp = gclken & svalid_int & sresp_int[0];
assign rw_resp = (mready & (rd_resp | wr_resp));
assign last_rd_resp = rd_resp & (rd_resp_ctr == frlen) & mready;


// ----------------------------------------------------------------------------
// FIFO instantiations
// ----------------------------------------------------------------------------

// fifo_bid
assign fbid_src_data = {id, exokay, exfail};
assign start_wr_gc =  start_wr & gclken;
assign wr_resp_rdy = wr_resp & mready;
  //leda W287 off
  //turn off check for unconnected port
  g256_DW_axi_gs_fifo
   #(fbid_width, `GS_BID_BUFFER, 0, 0)
  fifo_bid (.clk(aclk),
            .clk_en(),
            .rst_n(aresetn),      
            .src_data(fbid_src_data),
            .src_vld(start_wr_gc), 
            .src_rdy(fbid_src_rdy),   
            .dst_data(fbid_dst_data),
            .dst_vld(fbid_dst_vld), 
            .dst_rdy(wr_resp_rdy)
            );
  //leda W287 on

assign fbid     = fbid_dst_data[`GS_ID+1:2];
assign fbexokay = fbid_dst_data[1];
assign fbexfail = fbid_dst_data[0];


// fifo_rid
assign frid_src_data = {id, len, exokay, exfail};
assign start_rd_gc = start_rd & gclken;
  //leda W287 off
  //turn off check for unconnected port
  g256_DW_axi_gs_fifo
   #(frid_width, `GS_RID_BUFFER, 0, 0)
  fifo_rid (.clk(aclk),
            .clk_en(),
            .rst_n(aresetn),      
            .src_data(frid_src_data),
            .src_vld(start_rd_gc), 
            .src_rdy(frid_src_rdy),   
            .dst_data(frid_dst_data),
            .dst_vld(frid_dst_vld),
            .dst_rdy(last_rd_resp)
            );
  //leda W287 on

assign frid     = frid_dst_data[`GS_ID+`GS_BW+1:`GS_BW+2];
assign frlen    = frid_dst_data[`GS_BW+1:2];
assign frexokay = frid_dst_data[1];
assign frexfail = frid_dst_data[0];


// fifo_resp
assign muxed_id = (rd_resp) ? frid: fbid;
assign fresp_src_data = {sdata, muxed_id, axi_sresp_int, last_rd_resp,
  rd_resp, wr_resp};
assign fresp_dst_rdy = (rvalid & rready) | (bvalid & bready);
  //leda W287 off
  //turn off check for unconnected port
  g256_DW_axi_gs_fifo
   #(fresp_width, `GS_RESP_BUFFER, 0, `GS_DIRECT_AXI_READY)
  fifo_resp (.clk(aclk),
             .clk_en(),
             .rst_n(aresetn),      
             .src_data(fresp_src_data),
             .src_vld(rw_resp), 
             .src_rdy(fresp_src_rdy),   
             .dst_data(fresp_dst_data),
             .dst_vld(fresp_dst_vld), 
             .dst_rdy(fresp_dst_rdy)
             );
  //leda W287 on

// Output assignments for AXI RDATA and BRESP channels
assign rdata  = fresp_dst_data[fresp_width-1:5+`GS_ID];
assign rid    = fresp_dst_data[4+`GS_ID:5];
assign rresp  = fresp_dst_data[4:3];
assign rlast  = fresp_dst_data[2];
assign rvalid = fresp_dst_vld & fresp_dst_data[1];
assign bvalid = fresp_dst_vld & fresp_dst_data[0];
assign bid    = rid;
assign bresp  = rresp;


// ----------------------------------------------------------------------------
// sresp_int to axi_sresp_int conversion
// ----------------------------------------------------------------------------

assign sresp_int_ok = (sresp_int == `GS_SRESP_OK_R) |
  (sresp_int == `GS_SRESP_OK_W);
assign dout_exokay = (rd_resp) ? frexokay: fbexokay;
assign dout_exfail = (rd_resp) ? frexfail: fbexfail;

always @(dout_exokay or dout_exfail or sresp_int_ok)
begin : gen_axi_resp
  case ({dout_exfail, dout_exokay})
    // exclusive access table check succeeded
    2'b01:
      begin
        if(sresp_int_ok)
          axi_sresp_int = `GS_AXI_EXOKAY;
        else
          axi_sresp_int = `GS_AXI_SLVERR;
      end
    // normal access
    default:
      begin
        if(sresp_int_ok)
          axi_sresp_int = `GS_AXI_OKAY;
        else
          axi_sresp_int = `GS_AXI_SLVERR;
      end
  endcase
end // gen_axi_resp

assign next_rd_resp_ctr = (last_rd_resp) ? 0 : ((rd_resp & mready) ? rd_resp_ctr + 1'b1 : rd_resp_ctr);  


// ----------------------------------------------------------------------------
// Stall request if necessary
// ----------------------------------------------------------------------------
assign token_select = 
    {(bvalid & bready) | (rvalid & rready), gclken & (start_wr | advance_rd)};

always @(token_select or token)
begin : token_inc_dec_mux
  case (token_select)
    2'b01: next_token = token - 1'b1;
    2'b10: next_token = token + 1'b1;
    default: next_token = token;
  endcase
end // token_inc_dec_mux


// ----------------------------------------------------------------------------
// Flip flops
// ----------------------------------------------------------------------------

always @(posedge aclk or negedge aresetn)
begin : dff
  if (!aresetn) begin
    sresp_reg   <= 0;
    svalid_reg  <= 0;
    rd_resp_ctr <= 0;
    token       <= `GS_RESP_BUFFER;
  end
  else begin
    if (gclken) begin
      sresp_reg   <= auto_sresp;
      svalid_reg  <= auto_svalid;
      rd_resp_ctr <= next_rd_resp_ctr;
      token       <= next_token;
    end
    else begin
      sresp_reg   <= sresp_reg;
      svalid_reg  <= svalid_reg;
      rd_resp_ctr <= rd_resp_ctr;
      token       <= next_token;
    end
  end
end // dff

endmodule
