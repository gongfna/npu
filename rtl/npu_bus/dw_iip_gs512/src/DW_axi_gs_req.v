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
// VERSION:   DW_axi_gs_req Verilog Synthesis Model
//
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
// ABSTRACT:  AXI to GIF Request Module
//
// This module handles the AXI to GIF transaction requests for RD and WR.
//
// Request datapath (req):
//
//                                |----------|
// AXI WDATA ---------------------|fifo_wdata|---------------- GIF mdata
//  Channel                       |__________|                     mwstrb
//
//                                                                 maddr
// AXI AWADDR -|\   |-----------|  |---------|   /-----\           msize
//  Channel    | |__|exc_acc_mon|--|fifo_addr|---|logic|------ GIF mburst
//             | |  |___________|  |_________| | \-----/           mlen
// AXI ARADDR -|/                              |              
//  Channel                                    |
//                                             |
//                                    <to resp data path>
//
//-----------------------------------------------------------------------------
module g512_DW_axi_gs_req(/*AUTOARG*/
  // Outputs
  awready, wready, arready, maddr, msize, mburst, mlen, mlast, mdata, 
  mwstrb, start_wr_valid, start_rd_valid, advance_wr_valid, fid, 
  flen, fexokay, fexfail, 
  // Inputs
  aclk, aresetn, awid, awaddr, awlen, awsize, awburst, awlock, 
  awvalid, wdata, wstrb, wvalid, arid, araddr, arlen, arsize, 
  arburst, arlock, arvalid, gclken, advance_wr, advance_rd, 
  req_last_accepted, sm_high_pwr
  );


// ----------------------------------------------------------------------------
// PARAMETERS
// ----------------------------------------------------------------------------

parameter faddr_width = (`GS_AW+`GS_ID+2+`GS_BW+3+2+2);
parameter fwdata_width = (`GS_DW+`GS_DW/8);

// Exclusive access address granularity of 128 bytes (2^7).
parameter ex_addr_precision = 7;
parameter ex_addr_width = `GS_AW - ex_addr_precision;

// ----------------------------------------------------------------------------
// MACROS
// ----------------------------------------------------------------------------
  `define GS_BW_MAX 8


// ----------------------------------------------------------------------------
// PORTS
// ----------------------------------------------------------------------------

// AXI INTERFACE
// Global
input  aclk;
input  aresetn;
// Write address channel
input  [`GS_ID-1:0] awid;
input  [`GS_AW-1:0] awaddr;
input  [`GS_BW-1:0] awlen;
input  [2:0] awsize;
input  [1:0] awburst;
input  [1:0] awlock;
input  awvalid;
output awready;
// Write data channel
input  [`GS_DW-1:0] wdata;
input  [`GS_DW/8-1:0] wstrb;
input  wvalid;
output wready;
// Read address channel
input  [`GS_ID-1:0] arid;
input  [`GS_AW-1:0] araddr;
input  [`GS_BW-1:0] arlen;
input  [2:0] arsize;
input  [1:0] arburst;
input  [1:0] arlock;
input  arvalid;
output arready;

// GENERIC SLAVE INTERFACE
// Global
input  gclken;
// Request
output [`GS_AW-1:0] maddr;
output [2:0] msize;
output [1:0] mburst;
output [`GS_BW-1:0] mlen;
output mlast;
output [`GS_DW-1:0] mdata;
output [`GS_DW/8-1:0] mwstrb;

// INTERNAL CONNECTIONS
// Inputs
//input  start_wr;
//input  start_rd;
input  advance_wr;
input  advance_rd;
input  req_last_accepted;
input  sm_high_pwr;
// Outputs to sm
output start_wr_valid;
output start_rd_valid;
output advance_wr_valid;
// Outputs to resp
output [`GS_ID-1:0] fid;
output [`GS_BW-1:0] flen;
output fexokay;
output fexfail;


// ----------------------------------------------------------------------------
// INTERNAL SIGNALS
// ----------------------------------------------------------------------------

// axaddr MUX
reg  awready;
reg  arready;
reg  aselect;
reg  [faddr_width-3:0] axaddr;

// exclusive access
reg  exc_acc;
wire [`GS_ID-1:0] exid;
wire [ex_addr_width-1:0] exaddr;
wire exokay, exfail;

// faddr
wire [faddr_width-1:0] faddr_src_data, faddr_dst_data;
reg  faddr_src_vld;
wire faddr_src_rdy;
wire [`GS_AW-1:0] faddr;
wire [1:0] fcmd;
wire [2:0] fsize;
wire [1:0] fburst;
wire faddr_dst_vld;

// fwdata
wire [fwdata_width-1:0] fwdata_src_data, fwdata_dst_data;
wire [`GS_DW-1:0] fwdata;
wire [`GS_DW/8-1:0] fwstrb;

// address computation
reg  [`GS_BW-1:0] beat_n;
reg  beat_n_zero;
wire [11:0] adder_in, adder_out;
reg  [11:0] mask, next_maddr_lo, maddr_lo;


// Max length version of mlen.
wire [`GS_BW_MAX-1:0] mlen_max_w;


// ----------------------------------------------------------------------------
// DESIGN
// ----------------------------------------------------------------------------

// GIF outputs

// For the first beat of a transaction (i.e., beat_n_zero = 1), maddr is
// assigned the output of fifo_addr. For subsequent beats of a burst
// transaction, maddr is assigned the output of the address adder.
assign maddr  = {faddr[`GS_AW-1:12],
                (beat_n_zero) ? faddr[11:0]: maddr_lo };
// Other GIF control signals msize, mburst, and mlen are feed-throughs of
// fifo_addr.
assign msize  = fsize;
assign mburst = fburst;
assign mlen   = flen;
assign mlast  = (beat_n == flen);

assign mdata  = fwdata;
//cg assign mwstrb = fwstrb;
assign mwstrb = (fexfail) ? 0 : fwstrb;


// determine if a write request can be performed
// if fifo_addr has at least one entry and the top entry is a write command and
// the fifo_wdata has at least one beat of write data, then inform the state
// machine that the request data path is ready to start a GIF write transaction.
assign start_wr_valid = faddr_dst_vld & fcmd[0] & advance_wr_valid;

// determine if a read request can be performed
// if fifo_addr has at least one entry and the top entry is a read command,
// then inform the state machine that the request data path is ready to start a
// GIF read transaction.
assign start_rd_valid = faddr_dst_vld & fcmd[1];


// ----------------------------------------------------------------------------
// AXI Address Channel MUX
// ----------------------------------------------------------------------------
// This muxes the AWADDR and ARADDR busses into the fifo_addr.
always @(araddr or arburst or arid or arlen or arlock or arsize
         or arvalid or aselect or awaddr or awburst or awid or awlen
         or awlock or awsize or awvalid or faddr_src_rdy or gclken
         or sm_high_pwr)
begin : axaddr_mux
  if (~aselect) begin
    axaddr        = {awaddr, awid, 1'b0, awvalid, awlen, awsize, awburst};
    exc_acc       = (awlock == 2'b01);
    faddr_src_vld = awvalid & sm_high_pwr;
    arready       = 0;
    awready       = faddr_src_rdy & gclken & sm_high_pwr;
  end
  else begin
    axaddr        = {araddr, arid, arvalid, 1'b0, arlen, arsize, arburst};
    exc_acc       = (arlock == 2'b01);
    faddr_src_vld = arvalid & sm_high_pwr;
    arready       = faddr_src_rdy & gclken & sm_high_pwr;
    awready       = 0;
  end
end // axaddr_mux

// If ARADDR and AWADDR are valid, select each bus alternately each clock
// cycle. Otherwise, select whichever bus is active (default is AWADDR).
always@(posedge aclk or negedge aresetn)
begin : aselect_ff
  if(!aresetn)     aselect <= 1'b0;
  //else if (gclken) aselect <= (arvalid & awvalid) ? ~aselect: awvalid;
  else if(gclken)
    begin
      if(arvalid & awvalid)
        aselect <= ~aselect;
      else if(arvalid)
        aselect <= 1'b1;
      else if(awvalid)
        aselect <= 1'b0;
    end
end // aselect_ff


// ----------------------------------------------------------------------------
// Exclusive Access Monitor
// ----------------------------------------------------------------------------
// Before pushing the fifo_addr, run the id and addr through the exclusive
// access table to check for failing accesses and update the table as
// necessary.

assign exid   = axaddr[10+`GS_ID:11];
assign exaddr = axaddr[10+`GS_ID+`GS_AW:
                          11+`GS_ID+ex_addr_precision];

// Remove the exclusive access block if not required, and drive related 
// exclusive access signals.
generate
  if(`GS_AXI_EX_ACCESS > 0) begin
    g512_DW_axi_gs_exclusive
     #(`GS_AXI_EX_ACCESS, `GS_ID, ex_addr_width)
      exc_acc_mon (
      .clk(aclk), .clk_en(gclken), .reset_n(aresetn),
      .read(arvalid & arready), .write(awvalid & awready),
      .exclusive(exc_acc), .id(exid), .addr(exaddr),
      .exokay(exokay), .exfail(exfail)
    );
  end else begin
    assign exokay = 1'b0; 
    assign exfail = exc_acc; 
  end
endgenerate


// ----------------------------------------------------------------------------
// Address FIFO
// ----------------------------------------------------------------------------
// Push the ARADDR or AWADDR bus along with the exokay and exfail bits into
// fifo_addr.
assign faddr_src_data = {axaddr, exokay, exfail};

  //leda W287 off
  // turn off check for unconnected port
  g512_DW_axi_gs_fifo
   #(faddr_width, `GS_REQ_BUFFER, 0, `GS_DIRECT_GIF_READY)
  fifo_addr(.clk(aclk),
            .clk_en(),
            .rst_n(aresetn),      
            .src_data(faddr_src_data),
            .src_vld(faddr_src_vld & gclken), 
            .src_rdy(faddr_src_rdy),   
            .dst_data(faddr_dst_data),
            .dst_vld(faddr_dst_vld), 
            .dst_rdy(req_last_accepted & gclken)
            );
  //leda W287 on

assign faddr   = faddr_dst_data[`GS_BW+8+`GS_ID+`GS_AW:
                            `GS_BW+9+`GS_ID];
assign fid     = faddr_dst_data[`GS_BW+8+`GS_ID:`GS_BW+9];
assign fcmd    = faddr_dst_data[`GS_BW+8:`GS_BW+7];
assign flen    = faddr_dst_data[`GS_BW+6:7];
assign fsize   = faddr_dst_data[6:4];
assign fburst  = faddr_dst_data[3:2];
assign fexokay = faddr_dst_data[1];
assign fexfail = faddr_dst_data[0];


// ----------------------------------------------------------------------------
// Write Data FIFO
// ----------------------------------------------------------------------------
assign fwdata_src_data = {wdata, wstrb};
assign fwdata = fwdata_dst_data[fwdata_width-1:`GS_DW/8];
assign fwstrb   = fwdata_dst_data[`GS_DW/8-1:0];

wire wready_int;
assign wready = wready_int & gclken & sm_high_pwr;

  //leda W287 off
  // turn off check for unconnected port
  g512_DW_axi_gs_fifo
   #(fwdata_width, `GS_WDATA_BUFFER, 0, `GS_DIRECT_GIF_READY)
  fifo_wdata(.clk(aclk),
             .clk_en(),
             .rst_n(aresetn),      
             .src_data(fwdata_src_data),
             .src_vld(wvalid & sm_high_pwr & gclken), 
             .src_rdy(wready_int),   
             .dst_data(fwdata_dst_data),
             .dst_vld(advance_wr_valid), 
             .dst_rdy(advance_wr & gclken)
             );
  //leda W287 on

// ----------------------------------------------------------------------------
// Address Incrementing Logic
// ----------------------------------------------------------------------------

// For INCR bursts, adder_in is maddr with the (msize) lower-order bits
// assigned to zero. This is achieved with the shift right followed by shift
// left operation.
assign adder_in = (mburst == `GS_BURST_INCR) ?
  (maddr[11:0] >> msize) << msize: maddr[11:0];

// len_sh is used for WRAP bursts. It identifies the contribution of the length
// to the number of bits to shift to generate the address mask.
reg [2:0] len_sh;
// jstokes,  use max width wire here to avoid leda errors.
assign mlen_max_w = mlen;
always @(mlen_max_w)
begin : num_addr_bits_to_shift
  case (mlen_max_w)
    8'd1:    len_sh = 3'd1;
    8'd3:    len_sh = 3'd2;
    8'd7:    len_sh = 3'd3;
    8'd15:   len_sh = 3'd4;
    default: len_sh = 3'd0;
  endcase
end // num_addr_bits_to_shift

assign adder_out = adder_in + (12'b1 << msize);

// Construct the mask to apply to the address to get FIXED, INCR, or WRAP.
always @(mburst or msize or len_sh)
begin : construct_addr_mask
  case (mburst)
    `GS_BURST_FIXED: mask = {12{1'b1}};
    `GS_BURST_INCR:  mask = {12{1'b0}};
    `GS_BURST_WRAP:  mask = ({12{1'b1}} << msize) << len_sh;
    default: mask = {12{1'b0}};
  endcase
end // construct_addr_mask

always @(mask or adder_out or maddr)
begin : apply_addr_mask
  integer i;
  for (i=0; i<12; i=i+1)
    next_maddr_lo[i] = (mask[i]) ? maddr[i]: adder_out[i];
end // apply_addr_mask

always@(posedge aclk or negedge aresetn)
begin : maddr_lo_ff
  if (!aresetn)                                 
    maddr_lo <= {12{1'b0}};
  else if (gclken & (advance_rd | advance_wr))  
    maddr_lo <= next_maddr_lo;
  else                                          
    maddr_lo <= maddr_lo;
end // maddr_lo_ff

always @(posedge aclk or negedge aresetn)
begin : beat_n_ff
  if (!aresetn) begin
    beat_n      <= 0;
    beat_n_zero <= 1'b1;
  end
  else begin
    if (gclken & req_last_accepted) begin
      beat_n      <= 0;
      beat_n_zero <= 1'b1;
    end
    else begin
      if (gclken & (advance_rd | advance_wr)) begin
	beat_n      <= beat_n + 1;
	beat_n_zero <= 1'b0;
      end
      else begin
	beat_n      <= beat_n;
	beat_n_zero <= (beat_n == 4'b0);
      end
    end
  end
end // beat_n_ff

endmodule
