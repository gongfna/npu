//------------------------------------------------------------------------
//--
//--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
//--                            ALL RIGHTS RESERVED
//--
//--  This software and the associated documentation are confidential and
//--  proprietary to Synopsys, Inc.  Your use or disclosure of this
//--  software is subject to the terms and conditions of a written
//--  license agreement between you, or your company, and Synopsys, Inc.
//--
//--  The entire notice above must be reproduced on all authorized copies.

`timescale 1 ns / 1 ns

`include "DW_axi_x2x_cc_constants.v"
`include "DW_axi_x2x_constants.v"

// Include System Verilog files
`ifdef X2X_SVA_ENABLE
`include "sva_fcov_x2x.sv"
`endif

// Port Defines
`define VIP_SIDE_PORT_WIDTH          64

`define VIP_ADDR_PORT_WIDTH           64
`define VIP_ALEN_PORT_WIDTH           10
`define VIP_ASIZE_PORT_WIDTH           3
`define VIP_ABURST_PORT_WIDTH          2
`define VIP_ALOCK_PORT_WIDTH           2
`define VIP_ACACHE_PORT_WIDTH          4
`define VIP_APROT_PORT_WIDTH           3
`define VIP_AID_PORT_WIDTH            32
`define VIP_AVALID_PORT_WIDTH          1
`define VIP_AREADY_PORT_WIDTH          1

`define VIP_RDATA_PORT_WIDTH        1024
`define VIP_RRESP_PORT_WIDTH           2
`define VIP_RID_PORT_WIDTH            32
`define VIP_WDATA_PORT_WIDTH        1024
`define VIP_WSTRB_PORT_WIDTH         128
`define VIP_WID_PORT_WIDTH            32
`define VIP_BRESP_PORT_WIDTH           2
`define VIP_BID_PORT_WIDTH            32
`define VIP_RVALID_PORT_WIDTH          1
`define VIP_RLAST_PORT_WIDTH           1
`define VIP_RREADY_PORT_WIDTH          1
`define VIP_WVALID_PORT_WIDTH          1
`define VIP_WLAST_PORT_WIDTH           1
`define VIP_WREADY_PORT_WIDTH          1
`define VIP_BVALID_PORT_WIDTH          1
`define VIP_BREADY_PORT_WIDTH          1
`define VIP_ACLK_PORT_WIDTH            1
`define VIP_ARESETN_PORT_WIDTH         1

`define VIP_CACTIVE_PORT_WIDTH         1
`define VIP_CSYSREQ_PORT_WIDTH         1
`define VIP_CSYSACK_PORT_WIDTH         1

module test_DW_axi_x2x;

  reg                        r_aclk_m;    // Clock driven by TB
  wire                       r_aclk_m_lp;    // r_aclk_m, inactive during low power mode.
  reg                        r_aclk_s;    // Clock driven by TB
  wire                       w_aresetn_m; // Reset is driven by vera
  wire                       w_aresetn_s; // Reset is driven by vera

  wire                       w_csysreq_m;
  wire                       w_csysack_m;
  wire                       w_cactive_m;
  wire [8:0]                 w_csysreq_s;
  wire [8:0]                 w_csysack_s;
  wire [8:0]                 w_cactive_s;

  wire                       tz_secure_m;
  wire                       tz_secure_s;

  wire                       lp_clk_remove;
  wire                       sim_in_prog;
  reg                        inactive_clk_val;


  // Debug signals
  wire [`X2X_NUM_W_PORTS-1:0] dbg_b_bus_chf_push_req_n_o;

  // AW channel fifo debug signals.
  wire dbg_aw_chf_push_req_n_o;
  wire dbg_aw_chf_pop_req_n_o;
  wire dbg_aw_chf_full_o;
  wire dbg_aw_chf_empty_o;

  // W channel fifo debug signals.
  wire [`X2X_NUM_W_PORTS-1:0] dbg_bus_w_chf_push_req_n_o;
  wire [`X2X_NUM_W_PORTS-1:0] dbg_bus_w_chf_pop_req_n_o;
  wire [`X2X_NUM_W_PORTS-1:0] dbg_bus_w_chf_full_o;
  wire [`X2X_NUM_W_PORTS-1:0] dbg_bus_w_chf_empty_o;

  // B channel fifo debug signals.
  wire dbg_b_chf_push_req_n_o;
  wire dbg_b_chf_pop_req_n_o;
  wire dbg_b_chf_full_o;
  wire dbg_b_chf_empty_o;

  // AR channel fifo debug signals.
  wire dbg_ar_chf_push_req_n_o;
  wire dbg_ar_chf_pop_req_n_o;
  wire dbg_ar_chf_full_o;
  wire dbg_ar_chf_empty_o;

  // R channel fifo debug signal.
  wire dbg_r_chf_push_req_n_o;
  wire dbg_r_chf_pop_req_n_o;
  wire dbg_r_chf_full_o;
  wire dbg_r_chf_empty_o;

  // MP Write Address Channel
  wire                       awvalid_m;
  wire   [`X2X_MP_AW-1:0]    awaddr_m;
  wire   [`X2X_MP_IDW-1:0]   awid_m;
  wire   [`X2X_MP_BLW-1:0]   awlen_m;
  wire   [`X2X_BSW-1:0]      awsize_m;
  wire   [`X2X_BTW-1:0]      awburst_m;
  wire   [`X2X_LTW-1:0]      awlock_m;
  wire   [`X2X_CTW-1:0]      awcache_m;
  wire   [`X2X_PTW-1:0]      awprot_m;
  wire   [`X2X_AW_SBW-1:0]   awsideband_m;
  wire                       awready_m;

  // MP Write Data Channel from Master
  wire                       wvalid_m;
  wire   [`X2X_MP_IDW-1:0]   wid_m;
  wire   [`X2X_MP_DW-1:0]    wdata_m;
  wire   [`X2X_MP_SW-1:0]    wstrb_m;
  wire                       wlast_m;
  wire   [`X2X_W_SBW-1:0]    wsideband_m;
  wire                       wready_m;

  // MP Write Response Channel from Master
  wire                       bvalid_m;
  wire [`X2X_MP_IDW-1:0]     bid_m;
  wire [`X2X_BRW-1:0]        bresp_m;
  wire [`X2X_B_SBW-1:0]      bsideband_m;
  wire                       bready_m;

  // MP Read Address Channel from Master
  wire                       arvalid_m;
  wire   [`X2X_MP_IDW-1:0]   arid_m;
  wire   [`X2X_MP_AW-1:0]    araddr_m;
  wire   [`X2X_MP_BLW-1:0]   arlen_m;
  wire   [`X2X_BSW-1:0]      arsize_m;
  wire   [`X2X_BTW-1:0]      arburst_m;
  wire   [`X2X_LTW-1:0]      arlock_m;
  wire   [`X2X_CTW-1:0]      arcache_m;
  wire   [`X2X_PTW-1:0]      arprot_m;
  wire   [`X2X_AR_SBW-1:0]   arsideband_m;
  wire                       arready_m;

  // MP Read Data Channel from Master
  wire                       rvalid_m;
  wire [`X2X_MP_IDW-1:0]     rid_m;
  wire [`X2X_MP_DW-1:0]      rdata_m;
  wire                       rlast_m;
  wire [`X2X_RRW-1:0]        rresp_m;
  wire [`X2X_R_SBW-1:0]      rsideband_m;
  wire                       rready_m;

  // Write Address Channel 1
  wire                       awvalid_s1;
  wire [`X2X_SP_AW-1:0]      awaddr_s1;
  wire [`X2X_SP_IDW-1:0]     awid_s1;
  wire [`X2X_SP_BLW-1:0]     awlen_s1;
  wire [`X2X_BSW-1:0]        awsize_s1;
  wire [`X2X_BTW-1:0]        awburst_s1;
  wire [`X2X_LTW-1:0]        awlock_s1;
  wire [`X2X_CTW-1:0]        awcache_s1;
  wire [`X2X_PTW-1:0]        awprot_s1;
  wire [`X2X_AW_SBW-1:0]     awsideband_s1;
  wire                       awready_s1;

  // Write Data Channel 1
  wire                       wvalid_s1;
  wire [`X2X_SP_IDW-1:0]     wid_s1;
  wire [`X2X_SP_DW-1:0]      wdata_s1;
  wire [`X2X_SP_SW-1:0]      wstrb_s1;
  wire                       wlast_s1;
  wire [`X2X_W_SBW-1:0]      wsideband_s1;
  wire                       wready_s1;

  // Write Response Channel 1
  wire                       bvalid_s1;
  wire   [`X2X_SP_IDW-1:0]   bid_s1;
  wire   [`X2X_BRW-1:0]      bresp_s1;
  wire   [`X2X_B_SBW-1:0]    bsideband_s1;
  wire                       bready_s1;

 // Write Address Channel 2
  wire                       awvalid_s2;
  wire [`X2X_SP_AW-1:0]      awaddr_s2;
  wire [`X2X_SP_IDW-1:0]     awid_s2;
  wire [`X2X_SP_BLW-1:0]     awlen_s2;
  wire [`X2X_BSW-1:0]        awsize_s2;
  wire [`X2X_BTW-1:0]        awburst_s2;
  wire [`X2X_LTW-1:0]        awlock_s2;
  wire [`X2X_CTW-1:0]        awcache_s2;
  wire [`X2X_PTW-1:0]        awprot_s2;
  wire [`X2X_AW_SBW-1:0]     awsideband_s2;
  wire                       awready_s2;

  // Write Data Channel 2
  wire                       wvalid_s2;
  wire [`X2X_SP_IDW-1:0]     wid_s2;
  wire [`X2X_SP_DW-1:0]      wdata_s2;
  wire [`X2X_SP_SW-1:0]      wstrb_s2;
  wire                       wlast_s2;
  wire [`X2X_W_SBW-1:0]      wsideband_s2;
  wire                       wready_s2;

  // Write Response Channel 2
  wire                       bvalid_s2;
  wire   [`X2X_SP_IDW-1:0]   bid_s2;
  wire   [`X2X_BRW-1:0]      bresp_s2;
  wire   [`X2X_B_SBW-1:0]    bsideband_s2;
  wire                       bready_s2;

 // Write Address Channel 3
  wire                       awvalid_s3;
  wire [`X2X_SP_AW-1:0]      awaddr_s3;
  wire [`X2X_SP_IDW-1:0]     awid_s3;
  wire [`X2X_SP_BLW-1:0]     awlen_s3;
  wire [`X2X_BSW-1:0]        awsize_s3;
  wire [`X2X_BTW-1:0]        awburst_s3;
  wire [`X2X_LTW-1:0]        awlock_s3;
  wire [`X2X_CTW-1:0]        awcache_s3;
  wire [`X2X_PTW-1:0]        awprot_s3;
  wire [`X2X_AW_SBW-1:0]     awsideband_s3;
  wire                       awready_s3;

  // Write Data Channel 3
  wire                       wvalid_s3;
  wire [`X2X_SP_IDW-1:0]     wid_s3;
  wire [`X2X_SP_DW-1:0]      wdata_s3;
  wire [`X2X_SP_SW-1:0]      wstrb_s3;
  wire                       wlast_s3;
  wire [`X2X_W_SBW-1:0]      wsideband_s3;
  wire                       wready_s3;

  // Write Response Channel 3
  wire                       bvalid_s3;
  wire   [`X2X_SP_IDW-1:0]   bid_s3;
  wire   [`X2X_BRW-1:0]      bresp_s3;
  wire   [`X2X_B_SBW-1:0]    bsideband_s3;
  wire                       bready_s3;

 // Write Address Channel 4
  wire                       awvalid_s4;
  wire [`X2X_SP_AW-1:0]      awaddr_s4;
  wire [`X2X_SP_IDW-1:0]     awid_s4;
  wire [`X2X_SP_BLW-1:0]     awlen_s4;
  wire [`X2X_BSW-1:0]        awsize_s4;
  wire [`X2X_BTW-1:0]        awburst_s4;
  wire [`X2X_LTW-1:0]        awlock_s4;
  wire [`X2X_CTW-1:0]        awcache_s4;
  wire [`X2X_PTW-1:0]        awprot_s4;
  wire [`X2X_AW_SBW-1:0]     awsideband_s4;
  wire                       awready_s4;

  // Write Data Channel 4
  wire                       wvalid_s4;
  wire [`X2X_SP_IDW-1:0]     wid_s4;
  wire [`X2X_SP_DW-1:0]      wdata_s4;
  wire [`X2X_SP_SW-1:0]      wstrb_s4;
  wire                       wlast_s4;
  wire [`X2X_W_SBW-1:0]      wsideband_s4;
  wire                       wready_s4;

  // Write Response Channel 4
  wire                       bvalid_s4;
  wire   [`X2X_SP_IDW-1:0]   bid_s4;
  wire   [`X2X_BRW-1:0]      bresp_s4;
  wire   [`X2X_B_SBW-1:0]    bsideband_s4;
  wire                       bready_s4;

 // Write Address Channel 5
  wire                       awvalid_s5;
  wire [`X2X_SP_AW-1:0]      awaddr_s5;
  wire [`X2X_SP_IDW-1:0]     awid_s5;
  wire [`X2X_SP_BLW-1:0]     awlen_s5;
  wire [`X2X_BSW-1:0]        awsize_s5;
  wire [`X2X_BTW-1:0]        awburst_s5;
  wire [`X2X_LTW-1:0]        awlock_s5;
  wire [`X2X_CTW-1:0]        awcache_s5;
  wire [`X2X_PTW-1:0]        awprot_s5;
  wire [`X2X_AW_SBW-1:0]     awsideband_s5;
  wire                       awready_s5;

  // Write Data Channel 5
  wire                       wvalid_s5;
  wire [`X2X_SP_IDW-1:0]     wid_s5;
  wire [`X2X_SP_DW-1:0]      wdata_s5;
  wire [`X2X_SP_SW-1:0]      wstrb_s5;
  wire                       wlast_s5;
  wire [`X2X_W_SBW-1:0]      wsideband_s5;
  wire                       wready_s5;

  // Write Response Channel 5
  wire                       bvalid_s5;
  wire   [`X2X_SP_IDW-1:0]   bid_s5;
  wire   [`X2X_BRW-1:0]      bresp_s5;
  wire   [`X2X_B_SBW-1:0]    bsideband_s5;
  wire                       bready_s5;

 // Write Address Channel 6
  wire                       awvalid_s6;
  wire [`X2X_SP_AW-1:0]      awaddr_s6;
  wire [`X2X_SP_IDW-1:0]     awid_s6;
  wire [`X2X_SP_BLW-1:0]     awlen_s6;
  wire [`X2X_BSW-1:0]        awsize_s6;
  wire [`X2X_BTW-1:0]        awburst_s6;
  wire [`X2X_LTW-1:0]        awlock_s6;
  wire [`X2X_CTW-1:0]        awcache_s6;
  wire [`X2X_PTW-1:0]        awprot_s6;
  wire [`X2X_AW_SBW-1:0]     awsideband_s6;
  wire                       awready_s6;

  // Write Data Channel 6
  wire                       wvalid_s6;
  wire [`X2X_SP_IDW-1:0]     wid_s6;
  wire [`X2X_SP_DW-1:0]      wdata_s6;
  wire [`X2X_SP_SW-1:0]      wstrb_s6;
  wire                       wlast_s6;
  wire [`X2X_W_SBW-1:0]      wsideband_s6;
  wire                       wready_s6;

  // Write Response Channel 6
  wire                       bvalid_s6;
  wire   [`X2X_SP_IDW-1:0]   bid_s6;
  wire   [`X2X_BRW-1:0]      bresp_s6;
  wire   [`X2X_B_SBW-1:0]    bsideband_s6;
  wire                       bready_s6;

 // Write Address Channel 7
  wire                       awvalid_s7;
  wire [`X2X_SP_AW-1:0]      awaddr_s7;
  wire [`X2X_SP_IDW-1:0]     awid_s7;
  wire [`X2X_SP_BLW-1:0]     awlen_s7;
  wire [`X2X_BSW-1:0]        awsize_s7;
  wire [`X2X_BTW-1:0]        awburst_s7;
  wire [`X2X_LTW-1:0]        awlock_s7;
  wire [`X2X_CTW-1:0]        awcache_s7;
  wire [`X2X_PTW-1:0]        awprot_s7;
  wire [`X2X_AW_SBW-1:0]     awsideband_s7;
  wire                       awready_s7;

  // Write Data Channel 7
  wire                       wvalid_s7;
  wire [`X2X_SP_IDW-1:0]     wid_s7;
  wire [`X2X_SP_DW-1:0]      wdata_s7;
  wire [`X2X_SP_SW-1:0]      wstrb_s7;
  wire                       wlast_s7;
  wire [`X2X_W_SBW-1:0]      wsideband_s7;
  wire                       wready_s7;

  // Write Response Channel 7
  wire                       bvalid_s7;
  wire   [`X2X_SP_IDW-1:0]   bid_s7;
  wire   [`X2X_BRW-1:0]      bresp_s7;
  wire   [`X2X_B_SBW-1:0]    bsideband_s7;
  wire                       bready_s7;

 // Write Address Channel 8
  wire                       awvalid_s8;
  wire [`X2X_SP_AW-1:0]      awaddr_s8;
  wire [`X2X_SP_IDW-1:0]     awid_s8;
  wire [`X2X_SP_BLW-1:0]     awlen_s8;
  wire [`X2X_BSW-1:0]        awsize_s8;
  wire [`X2X_BTW-1:0]        awburst_s8;
  wire [`X2X_LTW-1:0]        awlock_s8;
  wire [`X2X_CTW-1:0]        awcache_s8;
  wire [`X2X_PTW-1:0]        awprot_s8;
  wire [`X2X_AW_SBW-1:0]     awsideband_s8;
  wire                       awready_s8;

  // Write Data Channel 8
  wire                       wvalid_s8;
  wire [`X2X_SP_IDW-1:0]     wid_s8;
  wire [`X2X_SP_DW-1:0]      wdata_s8;
  wire [`X2X_SP_SW-1:0]      wstrb_s8;
  wire                       wlast_s8;
  wire [`X2X_W_SBW-1:0]      wsideband_s8;
  wire                       wready_s8;

  // Write Response Channel 8
  wire                       bvalid_s8;
  wire   [`X2X_SP_IDW-1:0]   bid_s8;
  wire   [`X2X_BRW-1:0]      bresp_s8;
  wire   [`X2X_B_SBW-1:0]    bsideband_s8;
  wire                       bready_s8;

  // Read Address Channel
  wire                       arvalid_s;
  wire [`X2X_SP_IDW-1:0]     arid_s;
  wire [`X2X_SP_AW-1:0]      araddr_s;
  wire [`X2X_SP_BLW-1:0]     arlen_s;
  wire [`X2X_BSW-1:0]        arsize_s;
  wire [`X2X_BTW-1:0]        arburst_s;
  wire [`X2X_LTW-1:0]        arlock_s;
  wire [`X2X_CTW-1:0]        arcache_s;
  wire [`X2X_PTW-1:0]        arprot_s;
  wire [`X2X_AR_SBW-1:0]     arsideband_s;
  wire                       arready_s;

  // Read Data Channel
  wire                       rvalid_s;
  wire   [`X2X_SP_IDW-1:0]   rid_s;
  wire   [`X2X_SP_DW-1:0]    rdata_s;
  wire                       rlast_s;
  wire   [`X2X_RRW-1:0]      rresp_s;
  wire   [`X2X_R_SBW-1:0]    rsideband_s;
  wire                       rready_s;

  wire                       csysreq;
  wire                       csysack;
  wire                       cactive;

  wire                       int_awvalid_m;
  wire                       int_awready_m;
  wire                       int_arvalid_m;
  wire                       int_arready_m;
  wire                       int_wready_m;
  wire                       int_bvalid_m;
  wire                       int_bready_m;
  wire                       int_rvalid_m;
  wire                       int_rready_m;
  wire                       int_rlast_m;

  wire                       int_csysreq;
  wire                       int_csysack;
  wire                       int_cactive;

  assign #1  int_csysreq   = csysreq;
  assign #1  int_csysack   = csysack;
  assign #1  int_cactive   = cactive;
  assign #1  int_awvalid_m = awvalid_m;
  assign #1  int_awready_m = awready_m;
  assign #1  int_arvalid_m = arvalid_m;
  assign #1  int_arready_m = arready_m;
  assign #1  int_wready_m  = wready_m;
  assign #1  int_bvalid_m  = bvalid_m;
  assign #1  int_bready_m  = bready_m;
  assign #1  int_rvalid_m  = rvalid_m;
  assign #1  int_rready_m  = rready_m;
  assign #1  int_rlast_m   = rlast_m;

  assign 		     w_csysreq_m = 1'b1;
  assign 		     w_csysreq_s = 9'h1ff;

  // -------------------------------------------
  // Instantiate the VERA Shell
  // The connections to the VERA Shell are
  // done with hdl_nodes in the Vera interface
  // -------------------------------------------
  test_DW_axi_x2x_shell U_vshell(
                             .DW_axi_x2x_mp_if_aclk_m     (r_aclk_m)    // input signal
              ,.DW_axi_x2x_mp_if_aresetn_m (w_aresetn_m) // output signal
                             ,.DW_axi_x2x_sp_if_aclk_s    (r_aclk_s)    // input signal
              ,.DW_axi_x2x_sp_if_aresetn_s (w_aresetn_s) // output signal
             );

  // ----------------------------------------
  // Instantiate the AXI X2X Bridge
  // ----------------------------------------
  DW_axi_x2x U_axi_x2x(
                 .aclk_m        (r_aclk_m_lp)
                ,.aresetn_m     (w_aresetn_m)

  `ifdef X2X_DUAL_CLK
                ,.aclk_s        (r_aclk_s)
                ,.aresetn_s     (w_aresetn_s)
  `endif
  `ifdef X2X_TZ_SUPPORT
                ,.tz_secure_m   (tz_secure_m)
  `endif

  `ifdef X2X_HAS_LOWPWR_HS_IF
                ,.csysreq       (csysreq)
                ,.csysack       (csysack)
                ,.cactive       (cactive)
  `endif

                ,.awvalid_m     (awvalid_m)
                ,.awaddr_m      (awaddr_m)
                ,.awid_m        (awid_m)
                ,.awlen_m       (awlen_m)
                ,.awsize_m      (awsize_m)
                ,.awburst_m     (awburst_m)
                ,.awlock_m      (awlock_m)
                ,.awcache_m     (awcache_m)
                ,.awprot_m      (awprot_m)
  `ifdef X2X_AWSB
                ,.awsideband_m  (awsideband_m)
  `endif
                ,.awready_m     (awready_m)

                ,.wvalid_m      (wvalid_m)
                ,.wid_m         (wid_m)
                ,.wdata_m       (wdata_m)
                ,.wstrb_m       (wstrb_m)
                ,.wlast_m       (wlast_m)
  `ifdef X2X_WSB
                ,.wsideband_m   (wsideband_m)
  `endif
                ,.wready_m      (wready_m)

                ,.bvalid_m      (bvalid_m)
                ,.bid_m         (bid_m)
                ,.bresp_m       (bresp_m)
  `ifdef X2X_BSB
                ,.bsideband_m   (bsideband_m)
  `endif
                ,.bready_m      (bready_m)

`ifdef X2X_RD_CHANNELS
                ,.arvalid_m     (arvalid_m)
                ,.arid_m        (arid_m)
                ,.araddr_m      (araddr_m)
                ,.arlen_m       (arlen_m)
                ,.arsize_m      (arsize_m)
                ,.arburst_m     (arburst_m)
                ,.arlock_m      (arlock_m)
                ,.arcache_m     (arcache_m)
                ,.arprot_m      (arprot_m)
  `ifdef X2X_ARSB
                ,.arsideband_m  (arsideband_m)
  `endif
                ,.arready_m     (arready_m)

                ,.rvalid_m      (rvalid_m)
                ,.rid_m         (rid_m)
                ,.rdata_m       (rdata_m)
                ,.rresp_m       (rresp_m)
                ,.rlast_m       (rlast_m)
  `ifdef X2X_RSB
                ,.rsideband_m   (rsideband_m)
  `endif
                ,.rready_m      (rready_m)
`endif

  `ifdef X2X_TZ_SUPPORT
                ,.tz_secure_s   (tz_secure_s)
  `endif
  `ifdef X2X_INC_DEBUG_LOGIC
                ,.dbg_b_bus_chf_push_req_n_o (dbg_b_bus_chf_push_req_n_o)

      ,.dbg_aw_chf_push_req_n_o    (dbg_aw_chf_push_req_n_o)
      ,.dbg_aw_chf_pop_req_n_o     (dbg_aw_chf_pop_req_n_o)
      ,.dbg_aw_chf_full_o          (dbg_aw_chf_full_o)
      ,.dbg_aw_chf_empty_o         (dbg_aw_chf_empty_o)

      ,.dbg_bus_w_chf_push_req_n_o (dbg_bus_w_chf_push_req_n_o)
      ,.dbg_bus_w_chf_pop_req_n_o  (dbg_bus_w_chf_pop_req_n_o)
      ,.dbg_bus_w_chf_full_o       (dbg_bus_w_chf_full_o)
      ,.dbg_bus_w_chf_empty_o      (dbg_bus_w_chf_empty_o)

      ,.dbg_ar_chf_push_req_n_o    (dbg_ar_chf_push_req_n_o)
      ,.dbg_ar_chf_pop_req_n_o     (dbg_ar_chf_pop_req_n_o)
      ,.dbg_ar_chf_full_o          (dbg_ar_chf_full_o)
      ,.dbg_ar_chf_empty_o         (dbg_ar_chf_empty_o)

      ,.dbg_b_chf_push_req_n_o     (dbg_b_chf_push_req_n_o)
      ,.dbg_b_chf_pop_req_n_o      (dbg_b_chf_pop_req_n_o)
      ,.dbg_b_chf_full_o           (dbg_b_chf_full_o)
      ,.dbg_b_chf_empty_o          (dbg_b_chf_empty_o)

      ,.dbg_r_chf_push_req_n_o     (dbg_r_chf_push_req_n_o)
      ,.dbg_r_chf_pop_req_n_o      (dbg_r_chf_pop_req_n_o)
      ,.dbg_r_chf_full_o           (dbg_r_chf_full_o)
      ,.dbg_r_chf_empty_o          (dbg_r_chf_empty_o)
  `endif
                ,.awvalid_s1    (awvalid_s1)
                ,.awaddr_s1     (awaddr_s1)
                ,.awid_s1       (awid_s1)
                ,.awlen_s1      (awlen_s1)
                ,.awsize_s1     (awsize_s1)
                ,.awburst_s1    (awburst_s1)
                ,.awlock_s1     (awlock_s1)
                ,.awcache_s1    (awcache_s1)
                ,.awprot_s1     (awprot_s1)
  `ifdef X2X_AWSB
                ,.awsideband_s1 (awsideband_s1)
  `endif
                ,.awready_s1    (awready_s1)

                ,.wvalid_s1     (wvalid_s1)
                ,.wid_s1        (wid_s1)
                ,.wdata_s1      (wdata_s1)
                ,.wstrb_s1      (wstrb_s1)
                ,.wlast_s1      (wlast_s1)
  `ifdef X2X_WSB
                ,.wsideband_s1  (wsideband_s1)
  `endif
                ,.wready_s1     (wready_s1)

                ,.bvalid_s1     (bvalid_s1)
                ,.bid_s1        (bid_s1)
                ,.bresp_s1      (bresp_s1)
  `ifdef X2X_BSB
                ,.bsideband_s1  (bsideband_s1)
  `endif
                ,.bready_s1     (bready_s1)

`ifdef X2X_SP2
                ,.awvalid_s2    (awvalid_s2)
                ,.awaddr_s2     (awaddr_s2)
                ,.awid_s2       (awid_s2)
                ,.awlen_s2      (awlen_s2)
                ,.awsize_s2     (awsize_s2)
                ,.awburst_s2    (awburst_s2)
                ,.awlock_s2     (awlock_s2)
                ,.awcache_s2    (awcache_s2)
                ,.awprot_s2     (awprot_s2)
  `ifdef X2X_AWSB
                ,.awsideband_s2 (awsideband_s2)
  `endif
                ,.awready_s2    (awready_s2)

                ,.wvalid_s2     (wvalid_s2)
                ,.wid_s2        (wid_s2)
                ,.wdata_s2      (wdata_s2)
                ,.wstrb_s2      (wstrb_s2)
                ,.wlast_s2      (wlast_s2)
  `ifdef X2X_WSB
                ,.wsideband_s2  (wsideband_s2)
  `endif
                ,.wready_s2     (wready_s2)

                ,.bvalid_s2     (bvalid_s2)
                ,.bid_s2        (bid_s2)
                ,.bresp_s2      (bresp_s2)
  `ifdef X2X_BSB
                ,.bsideband_s2  (bsideband_s2)
  `endif
                ,.bready_s2     (bready_s2)
`endif

`ifdef X2X_SP3
                ,.awvalid_s3    (awvalid_s3)
                ,.awaddr_s3     (awaddr_s3)
                ,.awid_s3       (awid_s3)
                ,.awlen_s3      (awlen_s3)
                ,.awsize_s3     (awsize_s3)
                ,.awburst_s3    (awburst_s3)
                ,.awlock_s3     (awlock_s3)
                ,.awcache_s3    (awcache_s3)
                ,.awprot_s3     (awprot_s3)
  `ifdef X2X_AWSB
                ,.awsideband_s3 (awsideband_s3)
  `endif
                ,.awready_s3    (awready_s3)

                ,.wvalid_s3     (wvalid_s3)
                ,.wid_s3        (wid_s3)
                ,.wdata_s3      (wdata_s3)
                ,.wstrb_s3      (wstrb_s3)
                ,.wlast_s3      (wlast_s3)
  `ifdef X2X_WSB
                ,.wsideband_s3  (wsideband_s3)
  `endif
                ,.wready_s3     (wready_s3)

                ,.bvalid_s3     (bvalid_s3)
                ,.bid_s3        (bid_s3)
                ,.bresp_s3      (bresp_s3)
  `ifdef X2X_BSB
                ,.bsideband_s3  (bsideband_s3)
  `endif
                ,.bready_s3     (bready_s3)
`endif

`ifdef X2X_SP4
                ,.awvalid_s4    (awvalid_s4)
                ,.awaddr_s4     (awaddr_s4)
                ,.awid_s4       (awid_s4)
                ,.awlen_s4      (awlen_s4)
                ,.awsize_s4     (awsize_s4)
                ,.awburst_s4    (awburst_s4)
                ,.awlock_s4     (awlock_s4)
                ,.awcache_s4    (awcache_s4)
                ,.awprot_s4     (awprot_s4)
  `ifdef X2X_AWSB
                ,.awsideband_s4 (awsideband_s4)
  `endif
                ,.awready_s4    (awready_s4)

                ,.wvalid_s4     (wvalid_s4)
                ,.wid_s4        (wid_s4)
                ,.wdata_s4      (wdata_s4)
                ,.wstrb_s4      (wstrb_s4)
                ,.wlast_s4      (wlast_s4)
  `ifdef X2X_WSB
                ,.wsideband_s4  (wsideband_s4)
  `endif
                ,.wready_s4     (wready_s4)

                ,.bvalid_s4     (bvalid_s4)
                ,.bid_s4        (bid_s4)
                ,.bresp_s4      (bresp_s4)
  `ifdef X2X_BSB
                ,.bsideband_s4  (bsideband_s4)
  `endif
                ,.bready_s4     (bready_s4)
`endif

`ifdef X2X_SP5
                ,.awvalid_s5    (awvalid_s5)
                ,.awaddr_s5     (awaddr_s5)
                ,.awid_s5       (awid_s5)
                ,.awlen_s5      (awlen_s5)
                ,.awsize_s5     (awsize_s5)
                ,.awburst_s5    (awburst_s5)
                ,.awlock_s5     (awlock_s5)
                ,.awcache_s5    (awcache_s5)
                ,.awprot_s5     (awprot_s5)
  `ifdef X2X_AWSB
                ,.awsideband_s5 (awsideband_s5)
  `endif
                ,.awready_s5    (awready_s5)

                ,.wvalid_s5     (wvalid_s5)
                ,.wid_s5        (wid_s5)
                ,.wdata_s5      (wdata_s5)
                ,.wstrb_s5      (wstrb_s5)
                ,.wlast_s5      (wlast_s5)
  `ifdef X2X_WSB
                ,.wsideband_s5  (wsideband_s5)
  `endif
                ,.wready_s5     (wready_s5)

                ,.bvalid_s5     (bvalid_s5)
                ,.bid_s5        (bid_s5)
                ,.bresp_s5      (bresp_s5)
  `ifdef X2X_BSB
                ,.bsideband_s5  (bsideband_s5)
  `endif
                ,.bready_s5     (bready_s5)
`endif

`ifdef X2X_SP6
                ,.awvalid_s6    (awvalid_s6)
                ,.awaddr_s6     (awaddr_s6)
                ,.awid_s6       (awid_s6)
                ,.awlen_s6      (awlen_s6)
                ,.awsize_s6     (awsize_s6)
                ,.awburst_s6    (awburst_s6)
                ,.awlock_s6     (awlock_s6)
                ,.awcache_s6    (awcache_s6)
                ,.awprot_s6     (awprot_s6)
  `ifdef X2X_AWSB
                ,.awsideband_s6 (awsideband_s6)
  `endif
                ,.awready_s6    (awready_s6)

                ,.wvalid_s6     (wvalid_s6)
                ,.wid_s6        (wid_s6)
                ,.wdata_s6      (wdata_s6)
                ,.wstrb_s6      (wstrb_s6)
                ,.wlast_s6      (wlast_s6)
  `ifdef X2X_WSB
                ,.wsideband_s6  (wsideband_s6)
  `endif
                ,.wready_s6     (wready_s6)

                ,.bvalid_s6     (bvalid_s6)
                ,.bid_s6        (bid_s6)
                ,.bresp_s6      (bresp_s6)
  `ifdef X2X_BSB
                ,.bsideband_s6  (bsideband_s6)
  `endif
                ,.bready_s6     (bready_s6)
`endif

`ifdef X2X_SP7
                ,.awvalid_s7    (awvalid_s7)
                ,.awaddr_s7     (awaddr_s7)
                ,.awid_s7       (awid_s7)
                ,.awlen_s7      (awlen_s7)
                ,.awsize_s7     (awsize_s7)
                ,.awburst_s7    (awburst_s7)
                ,.awlock_s7     (awlock_s7)
                ,.awcache_s7    (awcache_s7)
                ,.awprot_s7     (awprot_s7)
  `ifdef X2X_AWSB
                ,.awsideband_s7 (awsideband_s7)
  `endif
                ,.awready_s7    (awready_s7)

                ,.wvalid_s7     (wvalid_s7)
                ,.wid_s7        (wid_s7)
                ,.wdata_s7      (wdata_s7)
                ,.wstrb_s7      (wstrb_s7)
                ,.wlast_s7      (wlast_s7)
  `ifdef X2X_WSB
                ,.wsideband_s7  (wsideband_s7)
  `endif
                ,.wready_s7     (wready_s7)

                ,.bvalid_s7     (bvalid_s7)
                ,.bid_s7        (bid_s7)
                ,.bresp_s7      (bresp_s7)
  `ifdef X2X_BSB
                ,.bsideband_s7  (bsideband_s7)
  `endif
                ,.bready_s7     (bready_s7)
`endif

`ifdef X2X_SP8
                ,.awvalid_s8    (awvalid_s8)
                ,.awaddr_s8     (awaddr_s8)
                ,.awid_s8       (awid_s8)
                ,.awlen_s8      (awlen_s8)
                ,.awsize_s8     (awsize_s8)
                ,.awburst_s8    (awburst_s8)
                ,.awlock_s8     (awlock_s8)
                ,.awcache_s8    (awcache_s8)
                ,.awprot_s8     (awprot_s8)
  `ifdef X2X_AWSB
                ,.awsideband_s8 (awsideband_s8)
  `endif
                ,.awready_s8    (awready_s8)

                ,.wvalid_s8     (wvalid_s8)
                ,.wid_s8        (wid_s8)
                ,.wdata_s8      (wdata_s8)
                ,.wstrb_s8      (wstrb_s8)
                ,.wlast_s8      (wlast_s8)
  `ifdef X2X_WSB
                ,.wsideband_s8  (wsideband_s8)
  `endif
                ,.wready_s8     (wready_s8)

                ,.bvalid_s8     (bvalid_s8)
                ,.bid_s8        (bid_s8)
                ,.bresp_s8      (bresp_s8)
  `ifdef X2X_BSB
                ,.bsideband_s8  (bsideband_s8)
  `endif
                ,.bready_s8     (bready_s8)
`endif

`ifdef X2X_RD_CHANNELS
                ,.arvalid_s     (arvalid_s)
                ,.arid_s        (arid_s)
                ,.araddr_s      (araddr_s)
                ,.arlen_s       (arlen_s)
                ,.arsize_s      (arsize_s)
                ,.arburst_s     (arburst_s)
                ,.arlock_s      (arlock_s)
                ,.arcache_s     (arcache_s)
                ,.arprot_s      (arprot_s)
  `ifdef X2X_ARSB
                ,.arsideband_s  (arsideband_s)
  `endif
                ,.arready_s     (arready_s)

                ,.rvalid_s      (rvalid_s)
                ,.rid_s         (rid_s)
                ,.rdata_s       (rdata_s)
                ,.rresp_s       (rresp_s)
                ,.rlast_s       (rlast_s)
  `ifdef X2X_RSB
                ,.rsideband_s   (rsideband_s)
  `endif
                ,.rready_s      (rready_s)
`endif

);

  assign 		     int_aclk_s    = (`X2X_CLK_MODE) ? r_aclk_s    : r_aclk_m;
  assign 		     int_aresetn_s = (`X2X_CLK_MODE) ? w_aresetn_s : w_aresetn_m;

  // --------------------------------------------
  // Instantiate the Low Power Interface checker
  // --------------------------------------------
  `ifdef X2X_HAS_LOWPWR_HS_IF
    tb_check_lp #(
       .NMST        (1),                    // 1 master.
       .NOPX        (`X2X_LOWPWR_NOPX_CNT), // Post completion to CACTIVE delay count.
       .PCPL        (0),                    // Post completion latency.
       .AR_HAS_BUFF (1),
       .AW_HAS_BUFF (1),
       .W_HAS_BUFF  (1)
    )
    U_check_lp (
     .clk            (r_aclk_m),
     .clklp          (r_aclk_m_lp),
     .resetn         (w_aresetn_m),
     .cvrgen         (~sim_in_prog),

     .awvalid_m_bus  (int_awvalid_m),
     .awready_m_bus  (int_awready_m),
     .arvalid_m_bus  (int_arvalid_m),
     .arready_m_bus  (int_arready_m),
     .wready_m_bus   (int_wready_m),
     .bvalid_m_bus   (int_bvalid_m),
     .bready_m_bus   (int_bready_m),
     .rvalid_m_bus   (int_rvalid_m),
     .rready_m_bus   (int_rready_m),
     .rlast_m_bus    (int_rlast_m),

     .csysreq        (int_csysreq),
     .csysack        (int_csysack),
     .cactive        (int_cactive)
    );
  `endif

  // ----------------------------------------
  // Instantiate the AXI X2X Bridge Wrapper
  // ----------------------------------------
  x2x_wrapper U_x2x_wrapper(
      .aclk_s     (int_aclk_s)
                ,.aresetn_s (int_aresetn_s)

                ,.wrap_tz_secure_m  (tz_secure_m)
                ,.wrap_tz_secure_s (tz_secure_s)

      ,.wrap_csysreq  (csysreq)
      ,.wrap_csysack  (csysack)
      ,.wrap_cactive  (cactive)

                ,.awvalid_mp    (awvalid_m)
                ,.awaddr_mp     (awaddr_m)
                ,.awid_mp       (awid_m)
                ,.awlen_mp      (awlen_m)
                ,.awsize_mp     (awsize_m)
                ,.awburst_mp    (awburst_m)
                ,.awlock_mp     (awlock_m)
                ,.awcache_mp    (awcache_m)
                ,.awprot_mp     (awprot_m)
  `ifdef X2X_AWSB
                ,.awsideband_mp (awsideband_m)
  `endif
                ,.awready_mp    (awready_m)

                ,.wvalid_mp     (wvalid_m)
                ,.wid_mp        (wid_m)
                ,.wdata_mp      (wdata_m)
                ,.wstrb_mp      (wstrb_m)
                ,.wlast_mp      (wlast_m)
  `ifdef X2X_WSB
                ,.wsideband_mp  (wsideband_m)
  `endif
                ,.wready_mp     (wready_m)

                ,.bvalid_mp     (bvalid_m)
                ,.bid_mp        (bid_m)
                ,.bresp_mp      (bresp_m)
  `ifdef X2X_BSB
                ,.bsideband_mp  (bsideband_m)
  `endif
                ,.bready_mp     (bready_m)

`ifdef X2X_RD_CHANNELS
                ,.arvalid_mp    (arvalid_m)
                ,.arid_mp       (arid_m)
                ,.araddr_mp     (araddr_m)
                ,.arlen_mp      (arlen_m)
                ,.arsize_mp     (arsize_m)
                ,.arburst_mp    (arburst_m)
                ,.arlock_mp     (arlock_m)
                ,.arcache_mp    (arcache_m)
                ,.arprot_mp     (arprot_m)
  `ifdef X2X_ARSB
                ,.arsideband_mp (arsideband_m)
  `endif
                ,.arready_mp    (arready_m)

                ,.rvalid_mp     (rvalid_m)
                ,.rid_mp        (rid_m)
                ,.rdata_mp      (rdata_m)
                ,.rresp_mp      (rresp_m)
                ,.rlast_mp      (rlast_m)
  `ifdef X2X_RSB
                ,.rsideband_mp  (rsideband_m)
  `endif
                ,.rready_mp     (rready_m)
`endif


                ,.awvalid_s1    (awvalid_s1)
                ,.awaddr_s1     (awaddr_s1)
                ,.awid_s1       (awid_s1)
                ,.awlen_s1      (awlen_s1)
                ,.awsize_s1     (awsize_s1)
                ,.awburst_s1    (awburst_s1)
                ,.awlock_s1     (awlock_s1)
                ,.awcache_s1    (awcache_s1)
                ,.awprot_s1     (awprot_s1)
  `ifdef X2X_AWSB
                ,.awsideband_s1 (awsideband_s1)
  `endif
                ,.awready_s1    (awready_s1)

                ,.wvalid_s1     (wvalid_s1)
                ,.wid_s1        (wid_s1)
                ,.wdata_s1      (wdata_s1)
                ,.wstrb_s1      (wstrb_s1)
                ,.wlast_s1      (wlast_s1)
  `ifdef X2X_WSB
                ,.wsideband_s1  (wsideband_s1)
  `endif
                ,.wready_s1     (wready_s1)

                ,.bvalid_s1     (bvalid_s1)
                ,.bid_s1        (bid_s1)
                ,.bresp_s1      (bresp_s1)
  `ifdef X2X_BSB
                ,.bsideband_s1  (bsideband_s1)
  `endif
                ,.bready_s1     (bready_s1)

`ifdef X2X_SP2
                ,.awvalid_s2    (awvalid_s2)
                ,.awaddr_s2     (awaddr_s2)
                ,.awid_s2       (awid_s2)
                ,.awlen_s2      (awlen_s2)
                ,.awsize_s2     (awsize_s2)
                ,.awburst_s2    (awburst_s2)
                ,.awlock_s2     (awlock_s2)
                ,.awcache_s2    (awcache_s2)
                ,.awprot_s2     (awprot_s2)
  `ifdef X2X_AWSB
                ,.awsideband_s2 (awsideband_s2)
  `endif
                ,.awready_s2    (awready_s2)

                ,.wvalid_s2     (wvalid_s2)
                ,.wid_s2        (wid_s2)
                ,.wdata_s2      (wdata_s2)
                ,.wstrb_s2      (wstrb_s2)
                ,.wlast_s2      (wlast_s2)
  `ifdef X2X_WSB
                ,.wsideband_s2  (wsideband_s2)
  `endif
                ,.wready_s2     (wready_s2)

                ,.bvalid_s2     (bvalid_s2)
                ,.bid_s2        (bid_s2)
                ,.bresp_s2      (bresp_s2)
  `ifdef X2X_BSB
                ,.bsideband_s2  (bsideband_s2)
  `endif
                ,.bready_s2     (bready_s2)
`endif

`ifdef X2X_SP3
                ,.awvalid_s3    (awvalid_s3)
                ,.awaddr_s3     (awaddr_s3)
                ,.awid_s3       (awid_s3)
                ,.awlen_s3      (awlen_s3)
                ,.awsize_s3     (awsize_s3)
                ,.awburst_s3    (awburst_s3)
                ,.awlock_s3     (awlock_s3)
                ,.awcache_s3    (awcache_s3)
                ,.awprot_s3     (awprot_s3)
  `ifdef X2X_AWSB
                ,.awsideband_s3 (awsideband_s3)
  `endif
                ,.awready_s3    (awready_s3)

                ,.wvalid_s3     (wvalid_s3)
                ,.wid_s3        (wid_s3)
                ,.wdata_s3      (wdata_s3)
                ,.wstrb_s3      (wstrb_s3)
                ,.wlast_s3      (wlast_s3)
  `ifdef X2X_WSB
                ,.wsideband_s3  (wsideband_s3)
  `endif
                ,.wready_s3     (wready_s3)

                ,.bvalid_s3     (bvalid_s3)
                ,.bid_s3        (bid_s3)
                ,.bresp_s3      (bresp_s3)
  `ifdef X2X_BSB
                ,.bsideband_s3  (bsideband_s3)
  `endif
                ,.bready_s3     (bready_s3)
`endif

`ifdef X2X_SP4
                ,.awvalid_s4    (awvalid_s4)
                ,.awaddr_s4     (awaddr_s4)
                ,.awid_s4       (awid_s4)
                ,.awlen_s4      (awlen_s4)
                ,.awsize_s4     (awsize_s4)
                ,.awburst_s4    (awburst_s4)
                ,.awlock_s4     (awlock_s4)
                ,.awcache_s4    (awcache_s4)
                ,.awprot_s4     (awprot_s4)
  `ifdef X2X_AWSB
                ,.awsideband_s4 (awsideband_s4)
  `endif
                ,.awready_s4    (awready_s4)

                ,.wvalid_s4     (wvalid_s4)
                ,.wid_s4        (wid_s4)
                ,.wdata_s4      (wdata_s4)
                ,.wstrb_s4      (wstrb_s4)
                ,.wlast_s4      (wlast_s4)
  `ifdef X2X_WSB
                ,.wsideband_s4  (wsideband_s4)
  `endif
                ,.wready_s4     (wready_s4)

                ,.bvalid_s4     (bvalid_s4)
                ,.bid_s4        (bid_s4)
                ,.bresp_s4      (bresp_s4)
  `ifdef X2X_BSB
                ,.bsideband_s4  (bsideband_s4)
  `endif
                ,.bready_s4     (bready_s4)
`endif

`ifdef X2X_SP5
                ,.awvalid_s5    (awvalid_s5)
                ,.awaddr_s5     (awaddr_s5)
                ,.awid_s5       (awid_s5)
                ,.awlen_s5      (awlen_s5)
                ,.awsize_s5     (awsize_s5)
                ,.awburst_s5    (awburst_s5)
                ,.awlock_s5     (awlock_s5)
                ,.awcache_s5    (awcache_s5)
                ,.awprot_s5     (awprot_s5)
  `ifdef X2X_AWSB
                ,.awsideband_s5 (awsideband_s5)
  `endif
                ,.awready_s5    (awready_s5)

                ,.wvalid_s5     (wvalid_s5)
                ,.wid_s5        (wid_s5)
                ,.wdata_s5      (wdata_s5)
                ,.wstrb_s5      (wstrb_s5)
                ,.wlast_s5      (wlast_s5)
  `ifdef X2X_WSB
                ,.wsideband_s5  (wsideband_s5)
  `endif
                ,.wready_s5     (wready_s5)

                ,.bvalid_s5     (bvalid_s5)
                ,.bid_s5        (bid_s5)
                ,.bresp_s5      (bresp_s5)
  `ifdef X2X_BSB
                ,.bsideband_s5  (bsideband_s5)
  `endif
                ,.bready_s5     (bready_s5)
`endif

`ifdef X2X_SP6
                ,.awvalid_s6    (awvalid_s6)
                ,.awaddr_s6     (awaddr_s6)
                ,.awid_s6       (awid_s6)
                ,.awlen_s6      (awlen_s6)
                ,.awsize_s6     (awsize_s6)
                ,.awburst_s6    (awburst_s6)
                ,.awlock_s6     (awlock_s6)
                ,.awcache_s6    (awcache_s6)
                ,.awprot_s6     (awprot_s6)
  `ifdef X2X_AWSB
                ,.awsideband_s6 (awsideband_s6)
  `endif
                ,.awready_s6    (awready_s6)

                ,.wvalid_s6     (wvalid_s6)
                ,.wid_s6        (wid_s6)
                ,.wdata_s6      (wdata_s6)
                ,.wstrb_s6      (wstrb_s6)
                ,.wlast_s6      (wlast_s6)
  `ifdef X2X_WSB
                ,.wsideband_s6  (wsideband_s6)
  `endif
                ,.wready_s6     (wready_s6)

                ,.bvalid_s6     (bvalid_s6)
                ,.bid_s6        (bid_s6)
                ,.bresp_s6      (bresp_s6)
  `ifdef X2X_BSB
                ,.bsideband_s6  (bsideband_s6)
  `endif
                ,.bready_s6     (bready_s6)
`endif

`ifdef X2X_SP7
                ,.awvalid_s7    (awvalid_s7)
                ,.awaddr_s7     (awaddr_s7)
                ,.awid_s7       (awid_s7)
                ,.awlen_s7      (awlen_s7)
                ,.awsize_s7     (awsize_s7)
                ,.awburst_s7    (awburst_s7)
                ,.awlock_s7     (awlock_s7)
                ,.awcache_s7    (awcache_s7)
                ,.awprot_s7     (awprot_s7)
  `ifdef X2X_AWSB
                ,.awsideband_s7 (awsideband_s7)
  `endif
                ,.awready_s7    (awready_s7)

                ,.wvalid_s7     (wvalid_s7)
                ,.wid_s7        (wid_s7)
                ,.wdata_s7      (wdata_s7)
                ,.wstrb_s7      (wstrb_s7)
                ,.wlast_s7      (wlast_s7)
  `ifdef X2X_WSB
                ,.wsideband_s7  (wsideband_s7)
  `endif
                ,.wready_s7     (wready_s7)

                ,.bvalid_s7     (bvalid_s7)
                ,.bid_s7        (bid_s7)
                ,.bresp_s7      (bresp_s7)
  `ifdef X2X_BSB
                ,.bsideband_s7  (bsideband_s7)
  `endif
                ,.bready_s7     (bready_s7)
`endif

`ifdef X2X_SP8
                ,.awvalid_s8    (awvalid_s8)
                ,.awaddr_s8     (awaddr_s8)
                ,.awid_s8       (awid_s8)
                ,.awlen_s8      (awlen_s8)
                ,.awsize_s8     (awsize_s8)
                ,.awburst_s8    (awburst_s8)
                ,.awlock_s8     (awlock_s8)
                ,.awcache_s8    (awcache_s8)
                ,.awprot_s8     (awprot_s8)
  `ifdef X2X_AWSB
                ,.awsideband_s8 (awsideband_s8)
  `endif
                ,.awready_s8    (awready_s8)

                ,.wvalid_s8     (wvalid_s8)
                ,.wid_s8        (wid_s8)
                ,.wdata_s8      (wdata_s8)
                ,.wstrb_s8      (wstrb_s8)
                ,.wlast_s8      (wlast_s8)
  `ifdef X2X_WSB
                ,.wsideband_s8  (wsideband_s8)
  `endif
                ,.wready_s8     (wready_s8)

                ,.bvalid_s8     (bvalid_s8)
                ,.bid_s8        (bid_s8)
                ,.bresp_s8      (bresp_s8)
  `ifdef X2X_BSB
                ,.bsideband_s8  (bsideband_s8)
  `endif
                ,.bready_s8     (bready_s8)
`endif

`ifdef X2X_RD_CHANNELS
                ,.arvalid_s     (arvalid_s)
                ,.arid_s        (arid_s)
                ,.araddr_s      (araddr_s)
                ,.arlen_s       (arlen_s)
                ,.arsize_s      (arsize_s)
                ,.arburst_s     (arburst_s)
                ,.arlock_s      (arlock_s)
                ,.arcache_s     (arcache_s)
                ,.arprot_s      (arprot_s)
  `ifdef X2X_ARSB
                ,.arsideband_s  (arsideband_s)
  `endif
                ,.arready_s     (arready_s)

                ,.rvalid_s      (rvalid_s)
                ,.rid_s         (rid_s)
                ,.rdata_s       (rdata_s)
                ,.rresp_s       (rresp_s)
                ,.rlast_s       (rlast_s)
  `ifdef X2X_RSB
                ,.rsideband_s   (rsideband_s)
  `endif
                ,.rready_s      (rready_s)
`endif

);

  // ----------------------------------------
  // Instantiate System Verilog module
  // ----------------------------------------
`ifdef X2X_SVA_ENABLE
   sva_fcov_x2x U_sva_x2x(
           .aclk_m        (r_aclk_m)
           ,.aresetn_m    (w_aresetn_m)
           ,.aclk_s       (int_aclk_s)
           ,.aresetn_s    (int_aresetn_s)
           ,.awvalid_m    (awvalid_m)
           ,.awready_m    (awready_m)
           ,.awid_m       (awid_m)
           ,.awaddr_m     (awaddr_m)
           ,.awlen_m      (awlen_m)
           ,.awsize_m     (awsize_m)
           ,.awburst_m    (awburst_m)
           ,.awlock_m     (awlock_m)
           ,.awsideband_m (awsideband_m)
           ,.arvalid_m    (arvalid_m)
           ,.arready_m    (arready_m)
           ,.arid_m       (arid_m)
           ,.araddr_m     (araddr_m)
           ,.arlen_m      (arlen_m)
           ,.arsize_m     (arsize_m)
           ,.arburst_m    (arburst_m)
           ,.arlock_m     (arlock_m)
           ,.arsideband_m (arsideband_m)
           ,.wvalid_m     (wvalid_m)
           ,.wready_m     (wready_m)
           ,.wsideband_m  (wsideband_m)
           ,.awvalid_s1   (awvalid_s1)
           ,.awready_s1   (awready_s1)
           ,.awid_s1      (awid_s1)
           ,.awlen_s1     (awlen_s1)
           ,.awsize_s1    (awsize_s1)
           ,.arvalid_s1   (arvalid_s)
           ,.arready_s1   (arready_s)
           ,.arid_s1      (arid_s)
           ,.arlen_s1     (arlen_s)
           ,.arsize_s1    (arsize_s)
           ,.wvalid_s1    (wvalid_s1)
           ,.wready_s1    (wready_s1)
           ,.wid_s1       (wid_s1)
           ,.bvalid_s1    (bvalid_s1)
           ,.bready_s1    (bready_s1)
           ,.bid_s1       (bid_s1)
           ,.bresp_s1     (bresp_s1)
           ,.bsideband_s1 (bsideband_s1)
           ,.rvalid_s1    (rvalid_s)
           ,.rready_s1    (rready_s)
           ,.rid_s1       (rid_s)
           ,.rresp_s1     (rresp_s)
           ,.rlast_s1     (rlast_s)
           ,.rsideband_s1 (rsideband_s)
           ,.awvalid_s2   (awvalid_s2)
           ,.awready_s2   (awready_s2)
           ,.awlen_s2     (awlen_s2)
           ,.awsize_s2    (awsize_s2)
           ,.awvalid_s3   (awvalid_s3)
           ,.awready_s3   (awready_s3)
           ,.awlen_s3     (awlen_s3)
           ,.awsize_s3    (awsize_s3)
           ,.awvalid_s4   (awvalid_s4)
           ,.awready_s4   (awready_s4)
           ,.awlen_s4     (awlen_s4)
           ,.awsize_s4    (awsize_s4)
           ,.awvalid_s5   (awvalid_s5)
           ,.awready_s5   (awready_s5)
           ,.awlen_s5     (awlen_s5)
           ,.awsize_s5    (awsize_s5)
           ,.awvalid_s6   (awvalid_s6)
           ,.awready_s6   (awready_s6)
           ,.awlen_s6     (awlen_s6)
           ,.awsize_s6    (awsize_s6)
           ,.awvalid_s7   (awvalid_s7)
           ,.awready_s7   (awready_s7)
           ,.awlen_s7     (awlen_s7)
           ,.awsize_s7    (awsize_s7)
           ,.awvalid_s8   (awvalid_s8)
           ,.awready_s8   (awready_s8)
           ,.awlen_s8     (awlen_s8)
           ,.awsize_s8    (awsize_s8)
           ,.aw_chf_full  (dbg_aw_chf_full_o)
                          ,.aw_chf_push  (dbg_aw_chf_push_req_n_o)
           ,.ar_chf_full  (dbg_ar_chf_full_o)
           ,.ar_chf_push  (dbg_ar_chf_push_req_n_o)
           ,.w_chf_full   (dbg_bus_w_chf_full_o[0])
           ,.w_chf_push   (dbg_bus_w_chf_push_req_n_o[0])
           ,.b_chf_full   (dbg_b_chf_full_o)
           ,.b_chf_push   (dbg_b_chf_push_req_n_o)
           ,.r_chf_full   (dbg_r_chf_full_o)
           ,.r_chf_push   (dbg_r_chf_push_req_n_o)
           );

`endif

  // ----------------------------------------
  // X2X Clock Generator
  // ----------------------------------------
  initial
    begin
      r_aclk_m =1;
      forever begin
        r_aclk_m = #(`PERIOD_M/2) ~r_aclk_m;
      end
    end


  // Remove clock to the DUT when instructed to by the TB (low power mode).
  // Inactive clock can be both 1 or 0.
  initial begin
    inactive_clk_val = 0;
  end

  // To avoid getting an unexpected positive edge, register lp_clk_remove
  // here and use to return clock cleanly.
  // lp_clk_remove from DW_axi_x2x_env.vr changes value a hash delay
  // after a posedge of the free running clock, if the inactive clock
  // value was 0, this can cause a hash delayed posedge to hit the DUT
  // which can cause csysreq to be registered on the same edge it
  // asserts on.
  reg lp_clk_remove_r;
  always @(posedge r_aclk_m or negedge w_aresetn_m) begin
    if(~w_aresetn_m) begin
      lp_clk_remove_r <= 1'b0;
    end else begin
      lp_clk_remove_r <= lp_clk_remove;
    end
  end

  // Randomise inactive clock value.
  always @(posedge lp_clk_remove) begin
    #1;
    inactive_clk_val = $random() % 2;
  end

  // Clock gating during low power.
  assign r_aclk_m_lp = (lp_clk_remove === 1'b1 | ((lp_clk_remove_r==1'b1) & ~inactive_clk_val))
                       ? inactive_clk_val : r_aclk_m;


  initial
    begin
      r_aclk_s =1;
      forever begin
        r_aclk_s = #(`PERIOD_S/2) ~r_aclk_s;
      end
    end

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
      $dumpvars(`DUMP_DEPTH);
    `endif
    end
  `endif

  // ----------------------------------------
  // sdf simulations
  // ----------------------------------------
  `ifdef SDF_FILE
    initial
      begin
        $display("About to sdf-annotate the design from %s",`SDF_FILE);
        $sdf_annotate(`SDF_FILE, U_axi_x2x, , , `SDF_LEVEL);
      end
  `endif

  `ifdef VCS

  `ifdef CODE_COVERAGE
    initial
      begin
        $set_toggle_mode(1);
        $start_toggle("U_axi_x2x");
      end
  `endif

  `endif

endmodule

