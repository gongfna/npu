// -------------------------------------------------------------------------
//
//   Copyright (c) 2005 Synopsys, Inc. This IP and the associated
//   documentation are confidential and proprietary to Synopsys, Inc. Your
//   use or disclosure of this IP is subject to the terms and conditions of
//   a written license agreement between you, or your company,
//   and Synopsys, Inc.
// 
//   The entire notice above must be reproduced on all authorized copies.
//
// -------------------------------------------------------------------------
// Author: Christian Graber
// -------------------------------------------------------------------------
  
`timescale 1 ns / 1 ns

`define DW_VIP_AXI_INSKEW                    -1
`define DW_VIP_AXI_OUTSKEW                    1
`define DW_VIP_AXI_XTIME                      1
`define DW_VIP_AXI_ARID_PORT_WIDTH           32
`define DW_VIP_AXI_AWID_PORT_WIDTH           32
`define DW_VIP_AXI_WID_PORT_WIDTH            32
`define DW_VIP_AXI_BID_PORT_WIDTH            32
`define DW_VIP_AXI_RID_PORT_WIDTH            32

`define SIM_ACLK_PERIOD 10
`define SIM_GCLK_PERIOD 10

`define GS_AXI_CACHE 4'h0
`define GS_AXI_PROT 3'h2

`include "../../src/DW_axi_gs_constants.v"
`include "../../src/DW_axi_gs_cc_constants.v"

`define __USE_AXI_MONITOR__
  
`define MAX_DW 512
`define MAX_WW 64
`define MAX_ID 16
`define MAX_AW 64
`define MAX_BW 8
  
module test_DW_axi_gs;

  // Master 0
  wire                                         arvalid_m0;
  wire [65:0]                                  araddr_m0;
  wire [9:0]                                   arlen_m0;
  wire [2:0]                                   arsize_m0;
  wire [1:0]                                   arburst_m0;
  wire [1:0]                                   arlock_m0;
  wire [3:0]                                   arcache_m0;
  wire [2:0]                                   arprot_m0;
  wire [`DW_VIP_AXI_ARID_PORT_WIDTH-1:0]       arid_m0__vip;
  wire                                         arready_m0;
  wire                                         awvalid_m0;
  wire [65:0]                                  awaddr_m0;
  wire [9:0]                                   awlen_m0;
  wire [2:0]                                   awsize_m0;
  wire [1:0]                                   awburst_m0;
  wire [1:0]                                   awlock_m0;
  wire [3:0]                                   awcache_m0;
  wire [2:0]                                   awprot_m0;
  wire [`DW_VIP_AXI_AWID_PORT_WIDTH-1:0]       awid_m0__vip;
  wire                                         awready_m0;
  wire                                         rvalid_m0;
  wire                                         rlast_m0;
  wire [1023:0]                                rdata_m0;
  wire [1:0]                                   rresp_m0;
  wire [`GS_ID-1:0]                 rid_m0;
  wire [`DW_VIP_AXI_RID_PORT_WIDTH-1:0]        rid_m0__vip;
  wire                                         rready_m0;
  wire                                         wvalid_m0;
  wire                                         wlast_m0;
  wire [1023:0]                                wdata_m0;
  wire [127:0]                                 wstrb_m0;
  wire [`DW_VIP_AXI_WID_PORT_WIDTH-1:0]        wid_m0__vip;
  wire                                         wready_m0;
  wire                                         bvalid_m0;
  wire [1:0]                                   bresp_m0;
  wire [`GS_ID-1:0]                 bid_m0;
  wire [`DW_VIP_AXI_BID_PORT_WIDTH-1:0]        bid_m0__vip;
  wire                                         bready_m0;
  wire                                         cactive_m0;
  wire                                         csysreq_m0;
  wire                                         csysack_m0;

  // GENERIC SLAVE INTERFACE
  // Request Channel
  wire [63:0] maddr;
  wire mread;
  wire mwrite;
  wire [2:0] msize;
  wire [1:0] mburst;
  wire [`GS_BW-1:0] mlen;
  wire [`MAX_BW:0] mlen_max;
  wire mlast;
  wire [`MAX_DW-1:0] mdata;
  wire [`MAX_WW-1:0] mwstrb;
  wire saccept;
  // Response Channel
  wire svalid;
  wire [`MAX_DW-1:0] sdata;
  wire [1:0] sresp;
  wire mready;
`ifdef GS_HAS_LOWPWR_HS_IF
  wire                                         shutdown_m0;
  wire                                         clocklevel;
  wire                                         cvrgen;
  reg                                          shutdown;
  reg                                          shutdown_negedge;
`endif
  reg                                          aclk_m0;


  // Testbench
  wire                aresetn;
  wire                aclk;
  wire                gclk;
  wire                gclken;
  wire                TestDone; 

  reg                 aresetn_delay1ns;
  
  always@(aresetn)
    aresetn_delay1ns <= #1 aresetn;
    

  // clocks, clok enables
  Clocks #(`SIM_ACLK_PERIOD, `SIM_GCLK_PERIOD)
    clocks (aclk, aresetn, gclk, gclken); 

`ifdef GS_HAS_LOWPWR_HS_IF
/* 
  always@(posedge aclk)
    begin
      #1 shutdown <= shutdown_m0;
    end
  
  always@(aclk or shutdown)
    begin
      if(shutdown)
        aclk_m0 = 1'b1;
      else
        aclk_m0 = aclk;
    end
*/
  always@(shutdown_m0)
    begin
      shutdown = shutdown_m0;
    end
  
  always@(negedge aclk)
    begin
      #1 shutdown_negedge <= shutdown_m0;
    end

  always@(aclk or shutdown or shutdown_negedge or clocklevel)
    begin
      if(shutdown && clocklevel)
        aclk_m0 = 1'b1;
      else
      begin
        if(shutdown_negedge && ~clocklevel)
	  aclk_m0 = 1'b0;
	else
          aclk_m0 = aclk;
      end
    end
 
`else

  always@(aclk)
    aclk_m0 = aclk;  
  
`endif  

   

   test_DW_axi_gs_shell vshell(
  //GIF Slave
    .GifSlaveInterface_gclk(gclk),
    .GifSlaveInterface_maddr(maddr),
    .GifSlaveInterface_mread(mread),
    .GifSlaveInterface_mwrite(mwrite),
    .GifSlaveInterface_mlen(mlen_max[`MAX_BW-1:0]),
    .GifSlaveInterface_msize(msize),
    .GifSlaveInterface_mburst(mburst),
    .GifSlaveInterface_mlast(mlast),
    .GifSlaveInterface_mdata(mdata),
    .GifSlaveInterface_mwstrb(mwstrb),
    .GifSlaveInterface_saccept(saccept),
    .GifSlaveInterface_svalid(svalid),
    .GifSlaveInterface_sdata(sdata),
    .GifSlaveInterface_sresp(sresp),
    .GifSlaveInterface_mready(mready),                            
`ifdef __USE_AXI_MONITOR__
    .AxiMonitorInterface_aclk (aclk),
    .AxiMonitorInterface_aresetn (aresetn),
    .AxiMonitorInterface_arvalid_m0 (arvalid_m0),
    .AxiMonitorInterface_araddr_m0 (araddr_m0[63:0]),
    .AxiMonitorInterface_arlen_m0 (arlen_m0),
    .AxiMonitorInterface_arsize_m0 (arsize_m0),
    .AxiMonitorInterface_arburst_m0 (arburst_m0),
    .AxiMonitorInterface_arlock_m0 (arlock_m0),
    .AxiMonitorInterface_arcache_m0 (arcache_m0),
    .AxiMonitorInterface_arprot_m0 (arprot_m0),
    .AxiMonitorInterface_arid_m0 (arid_m0__vip),
    .AxiMonitorInterface_arready_m0 (arready_m0),
    .AxiMonitorInterface_awvalid_m0 (awvalid_m0),
    .AxiMonitorInterface_awaddr_m0 (awaddr_m0[63:0]),
    .AxiMonitorInterface_awlen_m0 (awlen_m0),
    .AxiMonitorInterface_awsize_m0 (awsize_m0),
    .AxiMonitorInterface_awlock_m0 (awlock_m0),
    .AxiMonitorInterface_awburst_m0 (awburst_m0),
    .AxiMonitorInterface_awcache_m0 (awcache_m0),
    .AxiMonitorInterface_awprot_m0 (awprot_m0),
    .AxiMonitorInterface_awid_m0 (awid_m0__vip),
    .AxiMonitorInterface_awready_m0 (awready_m0),
    .AxiMonitorInterface_rvalid_m0 (rvalid_m0),
    .AxiMonitorInterface_rlast_m0 (rlast_m0),
    .AxiMonitorInterface_rdata_m0 (rdata_m0),
    .AxiMonitorInterface_rresp_m0 (rresp_m0),
    .AxiMonitorInterface_rid_m0 (rid_m0__vip),                  
    .AxiMonitorInterface_rready_m0 (rready_m0),
    .AxiMonitorInterface_wvalid_m0 (wvalid_m0),
    .AxiMonitorInterface_wlast_m0 (wlast_m0),
    .AxiMonitorInterface_wdata_m0 (wdata_m0),
    .AxiMonitorInterface_wstrb_m0 (wstrb_m0),
    .AxiMonitorInterface_wid_m0 (wid_m0__vip),
    .AxiMonitorInterface_wready_m0 (wready_m0),
    .AxiMonitorInterface_bvalid_m0 (bvalid_m0),
    .AxiMonitorInterface_bresp_m0 (bresp_m0),
    .AxiMonitorInterface_bid_m0 (bid_m0__vip),
    .AxiMonitorInterface_bready_m0 (bready_m0),
    .AxiMonitorInterface_cactive_m0 (cactive_m0),
    .AxiMonitorInterface_csysreq_m0 (csysreq_m0),
    .AxiMonitorInterface_csysack_m0 (csysack_m0),
`endif
                            
//Master
    .AxiMasterInterface_aclk (aclk),
    .AxiMasterInterface_aresetn (aresetn),
    .AxiMasterInterface_arvalid (arvalid_m0),
    .AxiMasterInterface_araddr (araddr_m0[63:0]),
    .AxiMasterInterface_arlen (arlen_m0),
    .AxiMasterInterface_arsize (arsize_m0),
    .AxiMasterInterface_arburst (arburst_m0),
    .AxiMasterInterface_arlock (arlock_m0),
    .AxiMasterInterface_arid (arid_m0__vip),
    .AxiMasterInterface_arready (arready_m0),
    .AxiMasterInterface_arcache (arcache_m0),
    .AxiMasterInterface_arprot (arprot_m0),                          
    .AxiMasterInterface_awvalid (awvalid_m0),
    .AxiMasterInterface_awaddr (awaddr_m0[63:0]),
    .AxiMasterInterface_awlen (awlen_m0),
    .AxiMasterInterface_awsize (awsize_m0),
    .AxiMasterInterface_awlock (awlock_m0),
    .AxiMasterInterface_awburst (awburst_m0),
    .AxiMasterInterface_awid (awid_m0__vip),
    .AxiMasterInterface_awready (awready_m0),
    .AxiMasterInterface_awcache (awcache_m0),
    .AxiMasterInterface_awprot (awprot_m0),                               
    .AxiMasterInterface_rvalid (rvalid_m0),
    .AxiMasterInterface_rlast (rlast_m0),
    .AxiMasterInterface_rdata (rdata_m0),
    .AxiMasterInterface_rresp (rresp_m0),
    .AxiMasterInterface_rid (rid_m0__vip),                  
    .AxiMasterInterface_rready (rready_m0),
    .AxiMasterInterface_wvalid (wvalid_m0),
    .AxiMasterInterface_wlast (wlast_m0),
    .AxiMasterInterface_wdata (wdata_m0),
    .AxiMasterInterface_wstrb (wstrb_m0),
    .AxiMasterInterface_wid (wid_m0__vip),
    .AxiMasterInterface_wready (wready_m0),
    .AxiMasterInterface_bvalid (bvalid_m0),
    .AxiMasterInterface_bresp (bresp_m0),
    .AxiMasterInterface_bid (bid_m0__vip),
    .AxiMasterInterface_bready (bready_m0),
//    .AxiMasterInterface_cactive (cactive_m0),
//    .AxiMasterInterface_csysreq (csysreq_m0),
//    .AxiMasterInterface_csysack (csysack_m0),
    .LowPowerInterface_aclk(aclk),
    .LowPowerInterface_csysreq(csysreq_m0),
    .LowPowerInterface_cactive(cactive_m0),
    .LowPowerInterface_csysack(csysack_m0),
    .LowPowerInterface_aresetn(aresetn),
    .LowPowerInterface_shutdown(shutdown_m0),                           
    .LowPowerInterface_clocklevel(clocklevel),                      
    .LowPowerInterface_cvrgen(cvrgen)                      
    );

  // Need to pad w/ zeros for the AXI monitor
  //assign araddr_m0[65:`GS_AW] = {(65-`GS_AW){1'b0}};
  assign awaddr_m0[65:`GS_AW] = {(65-`GS_AW){1'b0}};
  assign rdata_m0[1023:`GS_DW] = {(1024-`GS_DW){1'b0}};
  assign wdata_m0[1023:`GS_DW] = {(1024-`GS_DW){1'b0}};
  assign wstrb_m0[127:`GS_WW] = {(128-`GS_WW){1'b0}};
  assign bid_m0__vip[`DW_VIP_AXI_BID_PORT_WIDTH-1:`GS_ID] = 0;
  assign bid_m0__vip[`GS_ID-1:0] = bid_m0;
  assign rid_m0__vip[`DW_VIP_AXI_RID_PORT_WIDTH-1:`GS_ID] = 0;
  assign rid_m0__vip[`GS_ID-1:0] = rid_m0;
  assign mlen_max = {{(`MAX_BW+1-`GS_BW){1'b0}},mlen};
  
wire  [`GS_ID-1:0] awid_skew;
wire  [63:0] awaddr_skew;
wire  [9:0] awlen_skew;
wire  [2:0] awsize_skew;
wire  [1:0] awburst_skew;
wire  [1:0] awlock_skew;
wire  [3:0] awcache_skew;
wire  [2:0] awprot_skew;
wire  awvalid_skew;
wire  [`GS_ID-1:0] wid_skew;
wire  [`MAX_DW-1:0] wdata_skew;
wire  [`MAX_WW-1:0] wstrb_skew;
wire  wlast_skew;  
wire  wvalid_skew;
wire  bready_skew;
wire  [`GS_ID-1:0] arid_skew;
wire  [63:0] araddr_skew;
wire  [9:0] arlen_skew;
wire  [2:0] arsize_skew;
wire  [1:0] arburst_skew;
wire  [1:0] arlock_skew;
wire  [3:0] arcache_skew;
wire  [2:0] arprot_skew;
wire  arvalid_skew;
wire  rready_skew;
wire  csysreq_skew;
wire  gclken_skew;
wire  saccept_skew;
wire  svalid_skew;
wire  [`MAX_DW-1:0] sdata_skew;
wire  [1:0] sresp_skew;

  
assign  #1  awid_skew =      awid_m0__vip[`GS_ID-1:0];    
assign  #1  awaddr_skew =    awaddr_m0;  
assign  #1  awlen_skew =     awlen_m0;   
assign  #1  awsize_skew =    awsize_m0;  
assign  #1  awburst_skew =   awburst_m0; 
assign  #1  awlock_skew =    awlock_m0;
 // To test exclusive access monitor.
 // Force to exclusive access.
 //  assign #1 awlock_skew = 2'b01;
assign  #1  awcache_skew =   awcache_m0; 
assign  #1  awprot_skew =    awprot_m0;  
assign  #1  awvalid_skew =   awvalid_m0; 
assign  #1  wid_skew =       wid_m0__vip[`GS_ID-1:0];     
assign  #1  wdata_skew =     wdata_m0;   
assign  #1  wstrb_skew =     wstrb_m0;   
assign  #1  wlast_skew =     wlast_m0;   
assign  #1  wvalid_skew =    wvalid_m0;  
assign  #1  bready_skew =    bready_m0;  
assign  #1  arid_skew =      arid_m0__vip[`GS_ID-1:0];    
assign  #1  araddr_skew =    araddr_m0;  
assign  #1  arlen_skew =     arlen_m0;   
assign  #1  arsize_skew =    arsize_m0;  
assign  #1  arburst_skew =   arburst_m0; 
assign  #1  arlock_skew =    arlock_m0;  
assign  #1  arcache_skew =   arcache_m0; 
assign  #1  arprot_skew =    arprot_m0;  
assign  #1  arvalid_skew =   arvalid_m0; 
assign  #1  rready_skew =    rready_m0;  
assign  #1  csysreq_skew =   csysreq_m0;
  
assign  #1  saccept_skew =   saccept; 
assign  #1  svalid_skew =    svalid;  
assign  #1  sdata_skew =     sdata;   
assign  #1  sresp_skew =     sresp;   

 
// DUT Instantiation
  g32_DW_axi_gs dut(
    .aclk(aclk_m0),
    .aresetn(aresetn_delay1ns),
        
    .awvalid(awvalid_skew),
    .awaddr(awaddr_skew[`GS_AW-1:0]),
    .awlen(awlen_skew[`GS_BW-1:0]),
    .awsize(awsize_skew),
    .awburst(awburst_skew),
    .awlock(awlock_skew),
    .awcache(awcache_skew),
    .awprot(awprot_skew),
    .awid(awid_skew),
    .awready(awready_m0),
    
    .arvalid(arvalid_skew),
    .araddr(araddr_skew[`GS_AW-1:0]),
    .arlen(arlen_skew[`GS_BW-1:0]),
    .arsize(arsize_skew),
    .arburst(arburst_skew),
    .arlock(arlock_skew),
    .arcache(arcache_skew),
    .arprot(arprot_skew),
    .arid(arid_skew),
    .arready(arready_m0),
    
    .rvalid(rvalid_m0),
    .rlast(rlast_m0),
    .rdata(rdata_m0[`GS_DW-1:0]),
    .rresp(rresp_m0),
    .rid(rid_m0),
    .rready(rready_skew),

    .wid(wid_skew),
    .wvalid(wvalid_skew),
    .wdata(wdata_skew[`GS_DW-1:0]),
    .wstrb(wstrb_skew[`GS_DW/8-1:0]),
    .wlast(wlast_skew),
    .wready(wready_m0),
     
    .bvalid(bvalid_m0),
    .bresp(bresp_m0),
    .bid(bid_m0),
    .bready(bready_skew),

`ifdef GS_HAS_LOWPWR_HS_IF
    .csysreq(csysreq_skew),
    .csysack(csysack_m0),
    .cactive(cactive_m0),
`endif
    
    // GENERIC SLAVE INTERFACE
    // Global
    .gclken(gclken),
    // Request
    .maddr(maddr[`GS_AW-1:0]),
    .mread(mread), 
    .mwrite(mwrite),
    .msize(msize), 
    .mburst(mburst), 
    .mlen(mlen), 
    .mlast(mlast),
    .mdata(mdata[`GS_DW-1:0]),
    .mwstrb(mwstrb[`GS_DW/8-1:0]),
    .saccept(saccept_skew),
    // Response
    .svalid(svalid_skew),
    .sdata(sdata_skew[`GS_DW-1:0]),
    .sresp(sresp_skew),
    .mready(mready)
    
    );

`ifdef GS_HAS_LOWPWR_HS_IF
`ifndef GS_HAS_LOWPWR_LEGACY_IF

  // Delay low power signals to the checker, due to race
  // conditions in gtech sims.
  wire int_csysack, int_cactive;
  assign #1 int_csysack = csysack_m0;
  assign #1 int_cactive = cactive_m0;

tb_check_lp 

  #( 1,`GS_LOWPWR_NOPX_CNT,0,0,0,0)

  check_lp(
    .clk(aclk),                                  
    .clklp(aclk_m0),                                   
    .resetn(aresetn_delay1ns),                               
    .cvrgen(cvrgen),                                    

    .awvalid_m_bus(awvalid_skew),
    .awready_m_bus(awready_m0),
    .arvalid_m_bus(arvalid_skew),
    .arready_m_bus(arready_m0),
    .wready_m_bus(wready_m0),
    .bvalid_m_bus(bvalid_m0),
    .bready_m_bus(bready_skew),
    .rvalid_m_bus(rvalid_m0),
    .rready_m_bus(rready_skew),
    .rlast_m_bus(rlast_m0),

    .csysreq(csysreq_skew),
    .csysack(int_csysack),
    .cactive(int_cactive)
   );

`endif
`endif
  
// ----------------------------------------
// dump control
// ----------------------------------------
`ifdef DUMP_DEPTH
   initial begin
      `ifdef VCS
         $vcdpluson(`DUMP_DEPTH, test_DW_axi_gs);
      `else
         `ifdef DUMP_FILE
         `else
         `define DUMP_FILE "test.vcd"
         `endif
         $dumpfile(`DUMP_FILE);
         $dumpvars(`DUMP_DEPTH, test_DW_axi_gs);
      `endif
   end
`endif

// ----------------------------------------
// sdf simulations
// ----------------------------------------
`ifdef SDF_FILE
   initial begin
      $display("About to sdf-annotate the design from %s",`SDF_FILE);
      $sdf_annotate(`SDF_FILE, dut, , , `SDF_LEVEL);
   end
`endif

endmodule                     
