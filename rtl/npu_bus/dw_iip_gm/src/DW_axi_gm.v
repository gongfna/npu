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

module DW_axi_gm (/*AUTOARG*/
  // Outputs
  saccept, 
                  sid, 
                  svalid, 
                  slast, 
                  sdata, 
                  sresp, 
                  awid, 
                  awvalid, 
                  awaddr, 
                  awlen, 
                  awsize, 
                  awburst, 
                  awlock, 
                  awcache, 
                  awprot, 
                  wid, 
                  wvalid, 
                  wlast, 
                  wdata, 
                  wstrb, 
                  bready, 
                  arid, 
                  arvalid, 
                  araddr, 
                  arlen, 
                  arsize, 
                  arburst, 
                  arlock, 
                  arcache, 
                  arprot, 
                  rready,   
                  // Inputs
                  aclk, 
                  aresetn, 
                  gclken, 
                  mid, 
                  maddr, 
                  mread, 
                  mwrite, 
                  mlock, 
                  mlen, 
                  msize, 
                  mburst, 
                  mcache, 
                  mprot, 
                  mdata, 
                  mwstrb, 
                  mready, 
                  awready, 
                  wready, 
                  bid, 
                  bvalid, 
                  bresp, 
                  arready, 
                  rid, 
                  rvalid, 
                  rlast, 
                  rdata, 
                  rresp
                  );

  
  input                                       aclk;
  input                                       aresetn;
  input                                       gclken;

  
  // Generic Interface
  
  // GIF request
  input [`GM_ID-1:0]                          mid;
  input [`GM_AW-1:0]                          maddr;
  input                                       mread;
  input                                       mwrite;
  input                                       mlock;
  input [`GM_BW-1:0]                          mlen;
  input [2:0]                                 msize;
  input [1:0]                                 mburst;
  input [3:0]                                 mcache;
  input [2:0]                                 mprot;
  input [`GM_DW-1:0]                          mdata;
  input [`GM_WW-1:0]                          mwstrb;
  output                                      saccept;

  // GIF response
  output [`GM_ID-1:0]                         sid;
  output                                      svalid;
  output                                      slast;
  output [`GM_DW-1:0]                         sdata;
  output [2:0]                                sresp;
  input                                       mready;

  
  // AXI Master
  
  // AXI write request
  output [`GM_ID-1:0]                         awid;
  output                                      awvalid;
  output [`GM_AW-1:0]                         awaddr;
  output [`GM_BW-1:0]                         awlen;
  output [2:0]                                awsize;
  output [1:0]                                awburst;
  output [1:0]                                awlock;
  output [3:0]                                awcache;
  output [2:0]                                awprot;
  input                                       awready;

  // AXI write data
  output [`GM_ID-1:0]                         wid;
  output                                      wvalid;
  output                                      wlast;
  output [`GM_DW-1:0]                         wdata;
  output [`GM_WW-1:0]                         wstrb;
  input                                       wready;

  // AXI write response
  input [`GM_ID-1:0]                          bid;
  input                                       bvalid;
  input [1:0]                                 bresp;
  output                                      bready;  
  
  // AXI read request
  output [`GM_ID-1:0]                         arid;
  output                                      arvalid;
  output [`GM_AW-1:0]                         araddr;
  output [`GM_BW-1:0]                         arlen;
  output [2:0]                                arsize;
  output [1:0]                                arburst;
  output [1:0]                                arlock;
  output [3:0]                                arcache;
  output [2:0]                                arprot;  
  input                                       arready;

  // AXI read response & read data
  input [`GM_ID-1:0]                          rid;
  input                                       rvalid;
  input                                       rlast;
  input [`GM_DW-1:0]                          rdata;
  input [1:0]                                 rresp;
  output                                      rready;

  // AXI low power

  wire                                       aclk;
  wire                                       aresetn;
  wire                                       gclken;
  wire [`GM_ID-1:0]                          mid;
  wire [`GM_AW-1:0]                          maddr;
  wire                                       mread;
  wire                                       mwrite;
  wire                                       mlock;
  wire [`GM_BW-1:0]                          mlen;
  wire [2:0]                                 msize;
  wire [1:0]                                 mburst;
  wire [`GM_DW-1:0]                          mdata;
  wire [`GM_WW-1:0]                          mwstrb;
  wire                                       mready;
  wire                                       awready;
  wire                                       wready;
  wire                                       bvalid;
  wire [`GM_ID-1:0]                          bid;
  wire [1:0]                                 bresp;
  wire                                       arready;
  wire [`GM_ID-1:0]                          rid;
  wire                                       rvalid;
  wire                                       rlast;
  wire [`GM_DW-1:0]                          rdata;
  wire [1:0]                                 rresp;
  wire                                       csysreq;

  DW_axi_gm_core
  
    core(
         .aclk(aclk),   
         .aresetn(aresetn),
         .gclken(gclken),
         .mid(mid),
         .maddr(maddr),  
         .mread(mread),  
         .mwrite(mwrite), 
         .mlock(mlock),  
         .mlen(mlen),   
         .msize(msize),  
         .mburst(mburst),
         .mcache(mcache),
         .mprot(mprot),
         .mdata(mdata),  
         .mwstrb(mwstrb), 
         .saccept(saccept),
         .svalid(svalid), 
         .slast(slast),
         .sid(sid),
         .sdata(sdata),  
         .sresp(sresp),  
         .mready(mready), 
         .awvalid(awvalid),
         .awid(awid),
         .awaddr(awaddr), 
         .awlen(awlen),  
         .awsize(awsize), 
         .awburst(awburst),
         .awlock(awlock),
         .awcache(awcache),
         .awprot(awprot),
         .awready(awready),
         .wvalid(wvalid), 
         .wlast(wlast),
         .wid(wid),
         .wdata(wdata),  
         .wstrb(wstrb),  
         .wready(wready), 
         .bvalid(bvalid),
         .bid(bid), 
         .bresp(bresp),  
         .bready(bready), 
         .arvalid(arvalid),
         .arid(arid),
         .araddr(araddr), 
         .arlen(arlen),  
         .arsize(arsize), 
         .arburst(arburst),
         .arlock(arlock),
         .arcache(arcache),
         .arprot(arprot), 
         .arready(arready),
         .rvalid(rvalid),
         .rid(rid),
         .rlast(rlast),  
         .rdata(rdata),  
         .rresp(rresp),  
         .rready(rready)        
         );

      
endmodule 


