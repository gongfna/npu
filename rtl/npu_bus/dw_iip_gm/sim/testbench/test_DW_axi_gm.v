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

`include "../../src/DW_axi_gm_cc_constants.v"

`define __USE_AXI_MONITOR__
`define __USE_AXI_INTERCONNECT__

`define DW_VIP_AXI_ARID_PORT_WIDTH           32
`define DW_VIP_AXI_AWID_PORT_WIDTH           32
`define DW_VIP_AXI_RID_PORT_WIDTH            32
`define DW_VIP_AXI_BID_PORT_WIDTH            32
`define DW_VIP_AXI_WID_PORT_WIDTH            32

`define MAX_DW 512
`define MAX_WW 64
`define MAX_ID 12
`define MAX_AW 64
`define MAX_BW 8
`define MAX_BL 256

// Assertions for outstanding t/x control when low
// power interface is included.
`include "./tb_assert_max_tx_masking_binds.sva"

module test_DW_axi_gm;

  // AXI Slave 0
  wire                                         arvalid_s0;
  wire [63:0]                                  araddr_s0;
  wire [9:0]                                   arlen_s0;
  wire [2:0]                                   arsize_s0;
  wire [1:0]                                   arburst_s0;
  wire [1:0]                                   arlock_s0;
  wire [3:0]                                   arcache_s0;
  wire [2:0]                                   arprot_s0;
  wire [`DW_VIP_AXI_ARID_PORT_WIDTH-1:0]       arid_s0__vip;
  wire                                         arready_s0;
  wire                                         awvalid_s0;
  wire [63:0]                                  awaddr_s0;
  wire [9:0]                                   awlen_s0;
  wire [2:0]                                   awsize_s0;
  wire [1:0]                                   awburst_s0;
  wire [1:0]                                   awlock_s0;
  wire [3:0]                                   awcache_s0;
  wire [2:0]                                   awprot_s0;
  wire [`DW_VIP_AXI_AWID_PORT_WIDTH-1:0]       awid_s0__vip;
  wire                                         awready_s0;
  wire                                         rvalid_s0;
  wire                                         rlast_s0;
  wire [1023:0]                                rdata_s0;
  wire [1:0]                                   rresp_s0;
  wire [`DW_VIP_AXI_RID_PORT_WIDTH-1:0]        rid_s0__vip;
  wire                                         rready_s0;
  wire                                         wvalid_s0;
  wire                                         wlast_s0;
  wire [1023:0]                                wdata_s0;
  wire [127:0]                                 wstrb_s0;
  wire [`DW_VIP_AXI_WID_PORT_WIDTH-1:0]        wid_s0__vip;
  wire                                         wready_s0;
  wire                                         bvalid_s0;
  wire [1:0]                                   bresp_s0;
  wire [`DW_VIP_AXI_BID_PORT_WIDTH-1:0]        bid_s0__vip;
  wire                                         bready_s0;
  wire                                         cactive_s0;
  wire                                         csysreq_s0;
  wire                                         csysack_s0;

  wire                                         arvalid_m0;
  wire [65:0]                                  araddr_m0;
  wire [9:0]                                   arlen_m0;
  wire [2:0]                                   arsize_m0;
  wire [1:0]                                   arburst_m0;
  wire [1:0]                                   arlock_m0;
  wire [3:0]                                   arcache_m0;
  wire [2:0]                                   arprot_m0;
  wire [`GM_ID-1:0]                 arid_m0;
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
  wire [`GM_ID-1:0]                 awid_m0;
  wire [`DW_VIP_AXI_AWID_PORT_WIDTH-1:0]       awid_m0__vip;
  wire                                         awready_m0;
  wire                                         rvalid_m0;
  wire                                         rlast_m0;
  wire [1023:0]                                rdata_m0;
  wire [1:0]                                   rresp_m0;
  wire [`GM_ID-1:0]                 rid_m0;
  wire [`DW_VIP_AXI_RID_PORT_WIDTH-1:0]        rid_m0__vip;
  wire                                         rready_m0;
  wire                                         wvalid_m0;
  wire                                         wlast_m0;
  wire [1023:0]                                wdata_m0;
  wire [127:0]                                 wstrb_m0;
  wire [`GM_ID-1:0]                 wid_m0;
  wire [`DW_VIP_AXI_WID_PORT_WIDTH-1:0]        wid_m0__vip;
  wire                                         wready_m0;
  wire                                         bvalid_m0;
  wire [1:0]                                   bresp_m0;
  wire [`GM_ID-1:0]                 bid_m0;
  wire [`DW_VIP_AXI_BID_PORT_WIDTH-1:0]        bid_m0__vip;
  wire                                         bready_m0;
  wire                                         cactive_m0;
  wire                                         csysreq_m0;
  wire                                         csysack_m0;
  
  
  // GIF
  wire                                         saccept_s;
  wire                                         svalid_s;
  wire                                         slast_s;
  wire                                         mready_s;
  wire [2:0]                                   sresp_s;
  wire [63:0]                                  maddr_s;
  wire [11:0]                                  mid_s;
  wire                                         mread_s;
  wire                                         mwrite_s;
  wire                                         mlock_s;
  wire [7:0]                                   mlen_s;
  wire [2:0]                                   msize_s;
  wire [1:0]                                   mburst_s;
  wire [3:0]                                   mcache_s;
  wire [2:0]                                   mprot_s;
  wire [`MAX_DW-1:0]                           mdata_s;
  wire [`MAX_WW-1:0]                           mwstrb_s;
  wire [`MAX_DW-1:0]                           sdata_s;
  wire [12:0]                                  sid_s;

  wire                                         clocklevel;
  wire                                         cvrgen;
  wire                                         cactive_s;
  wire                                         csysreq_s;
  wire                                         csysack_s;  
  wire                                         shutdown_s;
  reg                                          shutdown;
  reg                                          shutdown_negedge;
  reg                                          aclk_s;
  
  // Testbench
  wire                                         aresetn;
  wire                                         aclk;
  wire                                         gclk;
  wire                                         gclken;
  
  reg                                          aresetn_delay1ns;
  
  always@(aclk)
    aresetn_delay1ns <= #1 aresetn;
  
  parameter aclk_period = `SIM_ACLK_PERIOD;
  parameter gclk_period = `SIM_GCLK_PERIOD;

  // clocks, clok enables and time ticks
  Clocks #(aclk_period, gclk_period)
    clocks (
            .aclk(aclk), 
            .aresetn(aresetn),
            .gclk(gclk), 
            .gclken(gclken),
            .equal(equal)
            ); 

`ifdef GM_HAS_LOWPWR_HS_IF
/*
  always@(posedge aclk)
    begin
      #1 shutdown <= shutdown_s;
    end
*/  
  always@(shutdown_s)
    begin
      shutdown = shutdown_s;
    end
  
  always@(negedge aclk)
    begin
      #1 shutdown_negedge <= shutdown_s;
    end

  always@(/*AUTOSENSE*/aclk or shutdown or shutdown_negedge or clocklevel)
    begin
      if(shutdown && clocklevel)
        aclk_s = 1'b1;
      else
      begin
        if(shutdown_negedge && ~clocklevel)
	  aclk_s = 1'b0;
	else
          aclk_s = aclk;
      end
    end
 
`else

  always@(aclk)
    aclk_s = aclk;  
  
`endif  
  
  test_DW_axi_gm_shell vshell(
         //Gif Master
        .GifMasterInterface_gclk(gclk),
        .GifMasterInterface_gresetn(aresetn_delay1ns),
         //
        .GifMasterInterface_mid(mid_s),
        .GifMasterInterface_maddr(maddr_s),
        .GifMasterInterface_mread(mread_s),
        .GifMasterInterface_mwrite(mwrite_s),
        .GifMasterInterface_mlock(mlock_s),
        .GifMasterInterface_mlen(mlen_s),
        .GifMasterInterface_msize(msize_s),
        .GifMasterInterface_mburst(mburst_s),
        .GifMasterInterface_mcache(mcache_s),
        .GifMasterInterface_mprot(mprot_s),
        .GifMasterInterface_mdata(mdata_s),
        .GifMasterInterface_mwstrb(mwstrb_s),
        .GifMasterInterface_saccept(saccept_s),
        .GifMasterInterface_svalid(svalid_s),
        .GifMasterInterface_slast(slast_s),
        .GifMasterInterface_sdata(sdata_s),
        .GifMasterInterface_sresp(sresp_s),
        .GifMasterInterface_mready(mready_s),
        .GifMasterInterface_cactive(cactive_s), // added by jduarte on 20100626
`ifdef __USE_AXI_MONITOR__
        // Monitor               
        .AxiMonitorInterface_aclk(aclk),
        .AxiMonitorInterface_aresetn(aresetn),
        // Monitor connections for M0
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
        //
        .AxiMonitorInterface_arvalid_s0 (arvalid_s0),
        .AxiMonitorInterface_araddr_s0 (araddr_s0),
        .AxiMonitorInterface_arlen_s0 (arlen_s0),
        .AxiMonitorInterface_arsize_s0 (arsize_s0),
        .AxiMonitorInterface_arburst_s0 (arburst_s0),
        .AxiMonitorInterface_arlock_s0 (arlock_s0),
        .AxiMonitorInterface_arcache_s0 (arcache_s0),
        .AxiMonitorInterface_arprot_s0 (arprot_s0),
        .AxiMonitorInterface_arid_s0 (arid_s0__vip),
        .AxiMonitorInterface_arready_s0 (arready_s0),
        .AxiMonitorInterface_awvalid_s0 (awvalid_s0),
        .AxiMonitorInterface_awaddr_s0 (awaddr_s0),
        .AxiMonitorInterface_awlen_s0 (awlen_s0),
        .AxiMonitorInterface_awsize_s0 (awsize_s0),
        .AxiMonitorInterface_awlock_s0 (awlock_s0),
        .AxiMonitorInterface_awburst_s0 (awburst_s0),
        .AxiMonitorInterface_awcache_s0 (awcache_s0),
        .AxiMonitorInterface_awprot_s0 (awprot_s0),
        .AxiMonitorInterface_awid_s0 (awid_s0__vip),
        .AxiMonitorInterface_awready_s0 (awready_s0),
        .AxiMonitorInterface_rvalid_s0 (rvalid_s0),
        .AxiMonitorInterface_rlast_s0 (rlast_s0),
        .AxiMonitorInterface_rdata_s0 (rdata_s0),
        .AxiMonitorInterface_rresp_s0 (rresp_s0),
        .AxiMonitorInterface_rid_s0 (rid_s0__vip),     
        .AxiMonitorInterface_rready_s0 (rready_s0),
        .AxiMonitorInterface_wvalid_s0 (wvalid_s0),
        .AxiMonitorInterface_wlast_s0 (wlast_s0),
        .AxiMonitorInterface_wdata_s0 (wdata_s0),
        .AxiMonitorInterface_wstrb_s0 (wstrb_s0),
        .AxiMonitorInterface_wid_s0 (wid_s0__vip),
        .AxiMonitorInterface_wready_s0 (wready_s0),
        .AxiMonitorInterface_bvalid_s0 (bvalid_s0),
        .AxiMonitorInterface_bresp_s0 (bresp_s0),
        .AxiMonitorInterface_bid_s0 (bid_s0__vip),
        .AxiMonitorInterface_bready_s0 (bready_s0),
        .AxiMonitorInterface_cactive_s0 (cactive_s0),
        .AxiMonitorInterface_csysreq_s0 (csysreq_s0),
        .AxiMonitorInterface_csysack_s0 (csysack_s0),
`endif
        //Slave
        .AxiSlaveInterface_aclk (aclk),
        .AxiSlaveInterface_aresetn (aresetn),
        //
        .AxiSlaveInterface_awvalid (awvalid_s0),
        .AxiSlaveInterface_awaddr (awaddr_s0),
        .AxiSlaveInterface_awlen (awlen_s0),
        .AxiSlaveInterface_awsize (awsize_s0),
        .AxiSlaveInterface_awburst (awburst_s0),
        .AxiSlaveInterface_awlock (awlock_s0),
        .AxiSlaveInterface_awcache (awcache_s0),
        .AxiSlaveInterface_awprot (awprot_s0),
        .AxiSlaveInterface_awid (awid_s0__vip),
        .AxiSlaveInterface_awready (awready_s0),
        .AxiSlaveInterface_arvalid (arvalid_s0),
        .AxiSlaveInterface_araddr (araddr_s0),
        .AxiSlaveInterface_arlen (arlen_s0),
        .AxiSlaveInterface_arsize (arsize_s0),
        .AxiSlaveInterface_arburst (arburst_s0),
        .AxiSlaveInterface_arlock (arlock_s0),
        .AxiSlaveInterface_arcache (arcache_s0),
        .AxiSlaveInterface_arprot (arprot_s0),
        .AxiSlaveInterface_arid (arid_s0__vip),
        .AxiSlaveInterface_arready (arready_s0),
        .AxiSlaveInterface_rvalid (rvalid_s0),
        .AxiSlaveInterface_rlast (rlast_s0),
        .AxiSlaveInterface_rdata (rdata_s0),
        .AxiSlaveInterface_rresp (rresp_s0),
        .AxiSlaveInterface_rid (rid_s0__vip),
        .AxiSlaveInterface_rready (rready_s0),
        .AxiSlaveInterface_wvalid (wvalid_s0),
        .AxiSlaveInterface_wlast (wlast_s0),
        .AxiSlaveInterface_wdata (wdata_s0),
        .AxiSlaveInterface_wstrb (wstrb_s0),
        .AxiSlaveInterface_wid (wid_s0__vip),
        .AxiSlaveInterface_wready (wready_s0),
        .AxiSlaveInterface_bvalid (bvalid_s0),
        .AxiSlaveInterface_bresp (bresp_s0),
        .AxiSlaveInterface_bid (bid_s0__vip),
        .AxiSlaveInterface_bready (bready_s0),
        .AxiSlaveInterface_csysreq (csysreq_s0),
        .AxiSlaveInterface_csysack (csysack_s0),
        .AxiSlaveInterface_cactive (cactive_s0),
        .AxiSlaveInterface_awvalid_alias0 (),
        .AxiSlaveInterface_awvalid_alias1 (),
        .AxiSlaveInterface_awvalid_alias2 (),
        .AxiSlaveInterface_arvalid_alias0 (),
        .AxiSlaveInterface_arvalid_alias1 (),
        .AxiSlaveInterface_arvalid_alias2 (),
        .AxiSlaveInterface_wvalid_alias0 (),
        .AxiSlaveInterface_wvalid_alias1 (),
        .AxiSlaveInterface_wvalid_alias2 (),
        .AxiSlaveInterface_rvalid_alias0 (),
        .AxiSlaveInterface_rvalid_alias1 (),
        .AxiSlaveInterface_rvalid_alias2 (),
        .AxiSlaveInterface_bvalid_alias0 (),
        .AxiSlaveInterface_bvalid_alias1 (),
        .AxiSlaveInterface_bvalid_alias2 (),
`ifdef __USE_AXI_INTERCONNECT__
        // Interconnect connections
        .AxiInterconnectInterface_aclk (aclk),
        .AxiInterconnectInterface_aresetn (aresetn),
        // Interconnect connections for M0
        .AxiInterconnectInterface_arvalid_m0 (arvalid_m0),
        .AxiInterconnectInterface_araddr_m0 (araddr_m0[63:0]),
        .AxiInterconnectInterface_arlen_m0 (arlen_m0),
        .AxiInterconnectInterface_arsize_m0 (arsize_m0),
        .AxiInterconnectInterface_arburst_m0 (arburst_m0),
        .AxiInterconnectInterface_arlock_m0 (arlock_m0),
        .AxiInterconnectInterface_arcache_m0 (arcache_m0),
        .AxiInterconnectInterface_arprot_m0 (arprot_m0),
        .AxiInterconnectInterface_arid_m0 (arid_m0__vip),
        .AxiInterconnectInterface_arready_m0 (arready_m0),
        .AxiInterconnectInterface_awvalid_m0 (awvalid_m0),
        .AxiInterconnectInterface_awaddr_m0 (awaddr_m0[63:0]),
        .AxiInterconnectInterface_awlen_m0 (awlen_m0),
        .AxiInterconnectInterface_awsize_m0 (awsize_m0),
        .AxiInterconnectInterface_awlock_m0 (awlock_m0),
        .AxiInterconnectInterface_awburst_m0 (awburst_m0),
        .AxiInterconnectInterface_awcache_m0 (awcache_m0),
        .AxiInterconnectInterface_awprot_m0 (awprot_m0),
        .AxiInterconnectInterface_awid_m0 (awid_m0__vip),
        .AxiInterconnectInterface_awready_m0 (awready_m0),
        .AxiInterconnectInterface_rvalid_m0 (rvalid_m0),
        .AxiInterconnectInterface_rlast_m0 (rlast_m0),
        .AxiInterconnectInterface_rdata_m0 (rdata_m0),
        .AxiInterconnectInterface_rresp_m0 (rresp_m0),
        .AxiInterconnectInterface_rid_m0 (rid_m0__vip),                  
        .AxiInterconnectInterface_rready_m0 (rready_m0),
        .AxiInterconnectInterface_wvalid_m0 (wvalid_m0),
        .AxiInterconnectInterface_wlast_m0 (wlast_m0),
        .AxiInterconnectInterface_wdata_m0 (wdata_m0),
        .AxiInterconnectInterface_wstrb_m0 (wstrb_m0),
        .AxiInterconnectInterface_wid_m0 (wid_m0__vip),
        .AxiInterconnectInterface_wready_m0 (wready_m0),
        .AxiInterconnectInterface_bvalid_m0 (bvalid_m0),
        .AxiInterconnectInterface_bresp_m0 (bresp_m0),
        .AxiInterconnectInterface_bid_m0 (bid_m0__vip),
        .AxiInterconnectInterface_bready_m0 (bready_m0),
        // Interconnect connections for S0
        .AxiInterconnectInterface_arvalid_s0 (arvalid_s0),
        .AxiInterconnectInterface_araddr_s0 (araddr_s0),
        .AxiInterconnectInterface_arlen_s0 (arlen_s0),
        .AxiInterconnectInterface_arsize_s0 (arsize_s0),
        .AxiInterconnectInterface_arburst_s0 (arburst_s0),
        .AxiInterconnectInterface_arlock_s0 (arlock_s0),
        .AxiInterconnectInterface_arcache_s0 (arcache_s0),
        .AxiInterconnectInterface_arprot_s0 (arprot_s0),
        .AxiInterconnectInterface_arid_s0 (arid_s0__vip),
        .AxiInterconnectInterface_arready_s0 (arready_s0),
        .AxiInterconnectInterface_awvalid_s0 (awvalid_s0),
        .AxiInterconnectInterface_awaddr_s0 (awaddr_s0),
        .AxiInterconnectInterface_awlen_s0 (awlen_s0),
        .AxiInterconnectInterface_awsize_s0 (awsize_s0),
        .AxiInterconnectInterface_awlock_s0 (awlock_s0),
        .AxiInterconnectInterface_awburst_s0 (awburst_s0),
        .AxiInterconnectInterface_awcache_s0 (awcache_s0),
        .AxiInterconnectInterface_awprot_s0 (awprot_s0),
        .AxiInterconnectInterface_awid_s0 (awid_s0__vip),
        .AxiInterconnectInterface_awready_s0 (awready_s0),
        .AxiInterconnectInterface_rvalid_s0 (rvalid_s0),
        .AxiInterconnectInterface_rlast_s0 (rlast_s0),
        .AxiInterconnectInterface_rdata_s0 (rdata_s0),
        .AxiInterconnectInterface_rresp_s0 (rresp_s0),
        .AxiInterconnectInterface_rid_s0 (rid_s0__vip),                  
        .AxiInterconnectInterface_rready_s0 (rready_s0),
        .AxiInterconnectInterface_wvalid_s0 (wvalid_s0),
        .AxiInterconnectInterface_wlast_s0 (wlast_s0),
        .AxiInterconnectInterface_wdata_s0 (wdata_s0),
        .AxiInterconnectInterface_wstrb_s0 (wstrb_s0),
        .AxiInterconnectInterface_wid_s0 (wid_s0__vip),
        .AxiInterconnectInterface_wready_s0 (wready_s0),
        .AxiInterconnectInterface_bvalid_s0 (bvalid_s0),
        .AxiInterconnectInterface_bresp_s0 (bresp_s0),
        .AxiInterconnectInterface_bid_s0 (bid_s0__vip),
        .AxiInterconnectInterface_bready_s0 (bready_s0),
`endif
         // Low Power Interface
        .LowPowerInterface_aclk(aclk),
         //
        .LowPowerInterface_csysreq(csysreq_s),
        .LowPowerInterface_cactive(cactive_s),
        .LowPowerInterface_csysack(csysack_s),
        .LowPowerInterface_aresetn(aresetn),
        .LowPowerInterface_shutdown(shutdown_s),
	.LowPowerInterface_clocklevel(clocklevel),                      
	.LowPowerInterface_cvrgen(cvrgen)                      
    );

`ifndef __USE_AXI_INTERCONNECT__
  assign arvalid_s0 =  arvalid_m0;
  assign araddr_s0 = araddr_m0;
  assign arlen_s0 = arlen_m0;
  assign arsize_s0 = arsize_m0;
  assign arburst_s0 = arburst_m0;
  assign arlock_s0 = arlock_m0;
  assign arcache_s0 = arcache_m0;
  assign arprot_s0 = arprot_m0;
  assign arid_s0__vip =arid_m0__vip;
  assign arready_m0 = arready_s0;
  assign awvalid_s0 = awvalid_m0;
  assign awaddr_s0 = awaddr_m0;
  assign awlen_s0 = awlen_m0;
  assign awsize_s0 = awsize_m0;
  assign awburst_s0 = awburst_m0;
  assign awlock_s0 = awlock_m0;
  assign awcache_s0 = awcache_m0;
  assign awprot_s0 = awprot_m0;
  assign awid_s0__vip = awid_m0__vip;
  assign awready_m0 = awready_s0;
  assign rvalid_m0 = rvalid_s0;
  assign rlast_m0 = rlast_s0;
  assign rdata_m0 = rdata_s0;
  assign rresp_m0 = rresp_s0;
  assign rid_m0__vip = rid_s0__vip;
  assign rready_s0 = rready_m0;
  assign wvalid_s0 = wvalid_m0;
  assign wlast_s0 = wlast_m0;
  assign wdata_s0 = wdata_m0;
  assign wstrb_s0 = wstrb_m0;
  assign wid_s0__vip = wid_m0__vip;
  assign wready_m0 = wready_s0;
  assign bvalid_m0 = bvalid_s0;
  assign bresp_m0 = bresp_s0;
  assign bid_m0__vip = bid_s0__vip;
  assign bready_s0 = bready_m0;
  assign cactive_s0 = cactive_m0; 
  assign csysreq_s0 = csysreq_m0;
  assign csysack_s0 = csysack_m0;
`endif
  

  // Map from VIP extended width to 13 bit
  assign rid_m0 = rid_m0__vip[`GM_ID-1:0];
  assign bid_m0 = bid_m0__vip[`GM_ID-1:0];
  
  
  // Need to pad w/ zeros for the AXI monitor
  assign araddr_m0[65:`GM_AW] = {(65-`GM_AW){1'b0}};
  assign awaddr_m0[65:`GM_AW] = {(65-`GM_AW){1'b0}};
  assign rdata_m0[1023:`GM_DW] = {(1024-`GM_DW){1'b0}};
  assign wdata_m0[1023:`GM_DW] = {(1024-`GM_DW){1'b0}};
  assign wstrb_m0[127:`GM_WW] = {(128-`GM_WW){1'b0}};
  assign awid_m0__vip = {{(`DW_VIP_AXI_AWID_PORT_WIDTH-`GM_ID){1'b0}},awid_m0};
  assign wid_m0__vip = {{(`DW_VIP_AXI_ARID_PORT_WIDTH-`GM_ID){1'b0}},wid_m0};
  assign arid_m0__vip = {{(`DW_VIP_AXI_ARID_PORT_WIDTH-`GM_ID){1'b0}},arid_m0};
  assign arlen_m0[9:`GM_BW] = 0;
  assign awlen_m0[9:`GM_BW] = 0;
  

  wire                           arready_m0_skew;
  wire                           awready_m0_skew;
  wire                           wready_m0_skew;
  
  wire                           rvalid_m0_skew;
  wire                           rlast_m0_skew;
  wire [1023:0]                  rdata_m0_skew;
  wire [1:0]                     rresp_m0_skew;
  wire [`GM_ID-1:0]              rid_m0_skew;
  
  wire                           bvalid_m0_skew;
  wire [1:0]                     bresp_m0_skew;
  wire [`GM_ID-1:0]              bid_m0_skew;
  
  wire                           svalid_s_skew;
  wire                           slast_s_skew;
  wire [`MAX_DW-1:0]             sdata_s_skew;  
  wire [2:0]                     sresp_s_skew;
  
  wire [12:0]                    mid_s_skew;
  wire [63:0]                    maddr_s_skew;
  wire                           mread_s_skew;
  wire                           mwrite_s_skew;
  wire                           mlock_s_skew;
  wire [7:0]                     mlen_s_skew;
  wire [2:0]                     msize_s_skew;
  wire [1:0]                     mburst_s_skew;
  wire [3:0]                     mcache_s_skew;
  wire [2:0]                     mprot_s_skew;
  wire [`MAX_DW-1:0]             mdata_s_skew;
  wire [`MAX_WW-1:0]             mwstrb_s_skew;
  
  wire                           csysreq_s_skew;
  
  assign #1                      arready_m0_skew =   arready_m0;
  assign #1                      awready_m0_skew =   awready_m0;
  assign #1                      wready_m0_skew =    wready_m0;
  
  assign #1                      rvalid_m0_skew =    rvalid_m0;
  assign #1                      rlast_m0_skew =     rlast_m0; 
  assign #1                      rdata_m0_skew =     rdata_m0; 
  assign #1                      rresp_m0_skew =     rresp_m0; 
  assign #1                      rid_m0_skew =       rid_m0;   
  
  assign #1                      bvalid_m0_skew =    bvalid_m0;
  assign #1                      bresp_m0_skew =     bresp_m0; 
  assign #1                      bid_m0_skew =       bid_m0;   
  
  assign #1                      mready_s_skew =     mready_s; 
  
  assign #1                      mid_s_skew =        mid_s;
  assign #1                      maddr_s_skew =      maddr_s;  
  assign #1                      mread_s_skew =      mread_s;  
  assign #1                      mwrite_s_skew =     mwrite_s; 
  assign #1                      mlock_s_skew =      mlock_s;  
  assign #1                      mlen_s_skew =       mlen_s;   
  assign #1                      msize_s_skew =      msize_s;  
  assign #1                      mburst_s_skew =     mburst_s;
  assign #1                      mcache_s_skew =     mcache_s;
  assign #1                      mprot_s_skew =      mprot_s;
  
  assign #1                      mdata_s_skew =      mdata_s;  
  assign #1                      mwstrb_s_skew =     mwstrb_s; 
  
  assign #1                      csysreq_s_skew =    csysreq_s;
  
// DUT Instantiation
  DW_axi_gm dut(
    .aclk(aclk_s),
    .aresetn(aresetn_delay1ns),
    .gclken(gclken),
  
    .mid(mid_s_skew[`GM_ID-1:0]),   
    .maddr(maddr_s_skew[`GM_AW-1:0]),
    .mread(mread_s_skew),
    .mwrite(mwrite_s_skew),
    .mlock(mlock_s_skew),
    .mlen(mlen_s_skew[`GM_BW-1:0]),
    .msize(msize_s_skew),
    .mburst(mburst_s_skew),
    .mcache(mcache_s_skew),
    .mprot(mprot_s_skew),
    .mdata(mdata_s_skew[`GM_DW-1:0]),
    .mwstrb(mwstrb_s_skew[`GM_WW-1:0]),
    .saccept(saccept_s),
    .sid(sid_s[`GM_ID-1:0]),
    .svalid(svalid_s),
    .slast(slast_s),
    .sdata(sdata_s[`GM_DW-1:0]),
    .sresp(sresp_s),
    .mready(mready_s_skew),

    .awid(awid_m0),
    .awvalid(awvalid_m0),
    .awaddr(awaddr_m0[`GM_AW-1:0]),
    .awlen(awlen_m0[`GM_BW-1:0]),
    .awsize(awsize_m0),
    .awburst(awburst_m0),
    .awlock(awlock_m0),
    .awcache(awcache_m0),
    .awprot(awprot_m0),
    .awready(awready_m0_skew),

    .arid(arid_m0),
    .arvalid(arvalid_m0),
    .araddr(araddr_m0[`GM_AW-1:0]),
    .arlen(arlen_m0[`GM_BW-1:0]),
    .arsize(arsize_m0),
    .arburst(arburst_m0),
    .arlock(arlock_m0),
    .arcache(arcache_m0),
    .arprot(arprot_m0),
    .arready(arready_m0_skew),

    .rid(rid_m0_skew),
    .rvalid(rvalid_m0_skew),
    .rlast(rlast_m0_skew),
    .rdata(rdata_m0_skew[`GM_DW-1:0]),
    .rresp(rresp_m0_skew),
    .rready(rready_m0),

    .wid(wid_m0[`GM_ID-1:0]),
    .wvalid(wvalid_m0),
    .wlast(wlast_m0),
    .wdata(wdata_m0[`GM_DW-1:0]),
    .wstrb(wstrb_m0[`GM_WW-1:0]),
    .wready(wready_m0_skew),

    .bid(bid_m0_skew),
    .bvalid(bvalid_m0_skew),
    .bresp(bresp_m0_skew),
    .bready(bready_m0)

`ifdef GM_HAS_LOWPWR_HS_IF
   ,.csysreq(csysreq_s),
    .csysack(csysack_s),
    .cactive(cactive_s)
`endif
    );

`ifndef GM_HAS_LOWPWR_HS_IF
  assign csysack_s = 1'b1;
  assign cactive_s = 1'b1;
`endif

`ifdef GM_HAS_LOWPWR_HS_IF
`ifndef GM_HAS_LOWPWR_LEGACY_IF

reg [7:0] beat_cnt;

always@(posedge aclk_s or negedge aresetn)
  if(~aresetn)
    beat_cnt <= 0;
  else
  begin
    if(gclken)
    begin
      if(mlen_s>0)
      begin
        if(saccept_s && mwrite_s_skew)
        begin
          if(beat_cnt>=mlen_s)
            beat_cnt <= 0;
          else
            beat_cnt <= beat_cnt + 1;
        end
      end
      else
        beat_cnt <= 0;
    end
  end


 // Delay low power signals to the checker, due to race
 // conditions in gtech sims.
 wire int_csysreq, int_csysack, int_cactive;
 assign #1 int_csysreq = csysreq_s;
 assign #1 int_csysack = csysack_s;
 assign #1 int_cactive = cactive_s;

tb_check_lp 

  #( 1,`GM_LOWPWR_NOPX_CNT,0,0,0,0)

  check_lp(
    .clk(aclk),                                  
    .clklp(aclk_s),                                   
    .resetn(aresetn_delay1ns),                               
    .cvrgen(cvrgen),                                    

    .awvalid_m_bus(mwrite_s_skew && (beat_cnt==0)),
    .awready_m_bus(saccept_s && mwrite_s_skew && gclken),
    .arvalid_m_bus(mread_s_skew),
    .arready_m_bus(saccept_s && mread_s_skew && gclken),
    .wready_m_bus(saccept_s && mwrite_s_skew && gclken),
    .bvalid_m_bus(1'b0),
    .bready_m_bus(1'b0),
    .rvalid_m_bus(svalid_s && gclken),
    .rready_m_bus(mready_s_skew && gclken),
    .rlast_m_bus(slast_s && gclken),

    .csysreq(int_csysreq),
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
         $vcdpluson(`DUMP_DEPTH);
      `else
         `ifdef DUMP_FILE
         `else
         `define DUMP_FILE "test.vcd"
         `endif
         $dumpfile(`DUMP_FILE);
         $dumpvars(`DUMP_DEPTH, test_DW_axi_gm);
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
