// -------------------------------------------------------------------------
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
// ABSTRACT:  AXI to Generic Interface (GIF) Gasket Top-level
//
// The Generic Slave Gasket design consists of three parts:
//   - a state machine that controls the data flow (sm),
//   - a datapath module that handles AXI to GIF requests (req),
//   - and a datapath module that handles GIF to AXI responses (resp).
//
//
// State machine (sm):
//                                |----|                           mread
// AXI Low-Power -----------------| sm |---------------------- GIF mwrite
//  Channel                       |____|                           mlast
//                                   |                             saccept
//                   <to/from req and resp data path>
//
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
//                                         ____|_____
// Response datapath (resp):              |          |
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
// Design Hierarchy
// ------------------------------------------------------
// - gsx                  Top-level
//    - sm                State machine
//    - lpfsm             Low power state machine
//    - req               Request channels (AXI to GIF)
//       - exclusive      Exclusive access monitor
//       - fifo_addr      Request buffer (writes and reads)
//       - fifo_wdata     Write Data buffer
//    - resp              Response channels (GIF to AXI)
//       - fifo_bid       Saves {id, exokay, exfail} of posted writes
//       - fifo_rid       Saves {id, len, exokay, exfail} of posted reads
//       - fifo_resp      Response buffer
//
// Internal signal naming conventions:
//
// Name           Meaning
// ----------------------------
// rd             Read
// wr             Write
// start          Start transaction
// advance        Advance beat (individual data transfer)
// f<signal>      Parsed data output of FIFO
// next_<signal>  DFF input
//
//-----------------------------------------------------------------------------
// Please refer to the databook for full details on the signals.
//
// These are found in the "Signal Description" section of the "Signals" chapter.
// There are details on the following
//   % Input Delays
//   % Output Delays
//   Any False Paths
//   Any Multicycle Paths
//   Any Asynchronous Signals
//
module g512_DW_axi_gs(/*AUTOARG*/
  // Outputs
  awready, 
                 wready, 
                 bid, 
                 bresp, 
                 bvalid, 
                 arready, 
                 rid, 
                 rdata, 
                 rresp, 
                 rlast, 
                 rvalid, 
                 maddr, 
                 mread, 
                 mwrite, 
                 msize, 
                 mburst, 
                 mlen, 
                 mlast, 
                 mdata, 
                 mwstrb, 
                 mready, 
                 // Inputs
                 aclk, 
                 aresetn, 
                 awid, 
                 awaddr, 
                 awlen, 
                 awsize, 
                 awburst, 
                 awlock, 
                 awcache, 
                 awprot, 
                 awvalid, 
                 wid, 
                 wdata, 
                 wstrb, 
                 wlast, 
                 wvalid, 
                 bready, 
                 arid, 
                 araddr, 
                 arlen, 
                 arsize, 
                 arburst, 
                 arlock, 
                 arcache, 
                 arprot, 
                 arvalid, 
                 rready, 
                 gclken, 
                 saccept, 
                 svalid, 
                 sdata, 
                 sresp
                 );


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
input  [3:0] awcache;
input  [2:0] awprot;
input  awvalid;
output awready;
// Write data channel
input  [`GS_ID-1:0] wid;
input  [`GS_DW-1:0] wdata;
input  [`GS_DW/8-1:0] wstrb;
input  wlast;  
input  wvalid;
output wready;
// Write response channel
output [`GS_ID-1:0] bid;
output [1:0] bresp;
output bvalid;
input  bready;
// Read address channel
input  [`GS_ID-1:0] arid;
input  [`GS_AW-1:0] araddr;
input  [`GS_BW-1:0] arlen;
input  [2:0] arsize;
input  [1:0] arburst;
input  [1:0] arlock;
input  [3:0] arcache;
input  [2:0] arprot;
input  arvalid;
output arready;
// Read data channel
output [`GS_ID-1:0] rid;
output [`GS_DW-1:0] rdata;
output [1:0] rresp;
output rlast;
output rvalid;
input  rready;
// Low-power Channel

// GENERIC SLAVE INTERFACE
// Global
input  gclken;
// Request Channel
output [`GS_AW-1:0] maddr;
output mread;
output mwrite;
output [2:0] msize;
output [1:0] mburst;
output [`GS_BW-1:0] mlen;
output mlast;
output [`GS_DW-1:0] mdata;
output [`GS_DW/8-1:0] mwstrb;
input  saccept;
// Response Channel
input  svalid;
input  [`GS_DW-1:0] sdata;
input  [1:0] sresp;
output mready;


// --------------------------------------------------------------------
// INTERNAL SIGNALS
// --------------------------------------------------------------------

// req module valid signals (req to sm)
wire start_wr_valid, start_rd_valid, advance_wr_valid;

// resp module ready signals (resp to sm)
wire start_wr_ready, start_rd_ready, advance_rd_ready;
wire resp_cactive;

// sm module control signals (sm to req/resp)
wire start_wr, start_rd, advance_wr, advance_rd;
wire auto_sresp;
wire auto_svalid;
wire req_last_accepted;
wire sm_high_pwr;

// data signals (req to resp)
wire [`GS_ID-1:0] fid;
wire [`GS_BW-1:0] flen;
wire fexokay, fexfail;


// --------------------------------------------------------------------
// DESIGN
// --------------------------------------------------------------------

/*
// Instantiate state machine
DW_axi_gs_sm
  sm (
  // AXI INTERFACE
  // Global
  .aclk(aclk), .aresetn(aresetn),
  // Low-power Channel
  .csysreq(csysreq), .csysack(csysack), .cactive(cactive),

  // GENERIC SLAVE INTERFACE
  // Global
  .gclken(gclken),
  // Request
  .mread(mread), .mwrite(mwrite),
  .mlast(mlast),
  .saccept(saccept),

  // INTERNAL CONNECTIONS
  // Inputs from req
  .start_wr_valid(start_wr_valid),
  .start_rd_valid(start_rd_valid),
  .advance_wr_valid(advance_wr_valid),
  //.exfail(fexfail),
  // Inputs from resp
  .start_wr_ready(start_wr_ready),
  .start_rd_ready(start_rd_ready),
  .advance_rd_ready(advance_rd_ready),
  .resp_cactive(resp_cactive),
  // Outputs to req/resp
  .start_wr(start_wr), .start_rd(start_rd),
  .advance_wr(advance_wr), .advance_rd(advance_rd),
  .auto_sresp(auto_sresp), .auto_svalid(auto_svalid),
  .req_last_accepted(req_last_accepted),
  .sm_high_pwr(sm_high_pwr)
);
*/


wire csysack_dummy;
wire cactive_dummy;

// Instantiate state machine
g512_DW_axi_gs_sm

  sm (
  // AXI INTERFACE
  // Global
  .aclk(aclk), .aresetn(aresetn),
  // Low-power Channel
  .csysreq(1'b1), .csysack(csysack_dummy), .cactive(cactive_dummy),

  // GENERIC SLAVE INTERFACE
  // Global
  .gclken(gclken),
  // Request
  .mread(mread), .mwrite(mwrite),
  .mlast(mlast),
  .saccept(saccept),

  // INTERNAL CONNECTIONS
  // Inputs from req
  .start_wr_valid(start_wr_valid),
  .start_rd_valid(start_rd_valid),
  .advance_wr_valid(advance_wr_valid),
  //.exfail(fexfail),
  // Inputs from resp
  .start_wr_ready(start_wr_ready),
  .start_rd_ready(start_rd_ready),
  .advance_rd_ready(advance_rd_ready),
  .resp_cactive(resp_cactive),
  // Outputs to req/resp
  .start_wr(start_wr), .start_rd(start_rd),
  .advance_wr(advance_wr), .advance_rd(advance_rd),
  .auto_sresp(auto_sresp), .auto_svalid(auto_svalid),
  .req_last_accepted(req_last_accepted),
  .sm_high_pwr(sm_high_pwr)
);



// Instantiate request module
g512_DW_axi_gs_req

  req (
  // AXI INTERFACE
  // Global
  .aclk(aclk), .aresetn(aresetn),
  // Write Address Channel
  .awid(awid), .awaddr(awaddr), .awlen(awlen), .awsize(awsize),
  .awburst(awburst), .awlock(awlock),
  .awvalid(awvalid), .awready(awready),
  // Write Data Channel
  .wdata(wdata), .wstrb(wstrb),
  .wvalid(wvalid), .wready(wready),
  // Read Address Channel
  .arid(arid), .araddr(araddr), .arlen(arlen), .arsize(arsize),
  .arburst(arburst), .arlock(arlock),
  .arvalid(arvalid), .arready(arready),

  // GENERIC SLAVE INTERFACE
  // Global
  .gclken(gclken),
  // Request
  .maddr(maddr),
  .msize(msize), .mburst(mburst), .mlen(mlen), .mlast(mlast),
  .mdata(mdata), .mwstrb(mwstrb),

  // INTERNAL CONNECTIONS
  // Inputs from sm
  //cg .start_wr(start_wr), .start_rd(start_rd),
  .advance_wr(advance_wr), .advance_rd(advance_rd),
  .req_last_accepted(req_last_accepted),
  .sm_high_pwr(sm_high_pwr),
  // Outputs to sm
  .start_wr_valid(start_wr_valid),
  .start_rd_valid(start_rd_valid),
  .advance_wr_valid(advance_wr_valid),
  // Outputs to resp
  .fid(fid), .flen(flen), .fexokay(fexokay), .fexfail(fexfail)
  );


// Instantiate response module
g512_DW_axi_gs_resp

  resp (
  // AXI INTERFACE
  // Global
  .aclk(aclk), .aresetn(aresetn),
  // Write Response Channel
  .bid(bid), .bresp(bresp),
  .bvalid(bvalid), .bready(bready),
  // Read Data Channel
  .rid(rid), .rdata(rdata), .rresp(rresp), .rlast(rlast),
  .rvalid(rvalid), .rready(rready),

  // GENERIC SLAVE INTERFACE
  // Global
  .gclken(gclken),
  // Response Channel
  .svalid(svalid), .sdata(sdata), .sresp(sresp),
  .mready(mready),
  
  // INTERNAL CONNECTIONS
  // Inputs from sm
  .start_wr(start_wr), .start_rd(start_rd), .advance_rd(advance_rd),
  .auto_sresp(auto_sresp), .auto_svalid(auto_svalid),
  // Inputs from req
  .id(fid), .len(flen), .exokay(fexokay), .exfail(fexfail),
  // Outputs to sm
  .start_wr_ready(start_wr_ready),
  .start_rd_ready(start_rd_ready),
  .advance_rd_ready(advance_rd_ready),
  .resp_cactive(resp_cactive)
  );
  

endmodule
