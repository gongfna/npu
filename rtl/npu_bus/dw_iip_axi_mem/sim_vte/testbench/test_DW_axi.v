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

`include "DW_axi_constants.v"
`include "DW_axi_cc_constants.v"
`include "VmtDefines.inc"
`include "AxiCommonDefines.inc"
`include "AxiMasterDefines.inc"
`include "AxiSlaveDefines.inc"
`include "AxiMonitorDefines.inc"
`include "AxiMonitorPortDefines.inc"
`include "AxiMessages.inc"

`define SIM_WAVE_DEBUG

// Port Defines
`define DW_VIP_AXI_INSKEW                    -1
`define DW_VIP_AXI_OUTSKEW                    1
`define DW_VIP_AXI_XTIME                      1

`define DW_VIP_AXI_ADDR_PORT_WIDTH           64
`define DW_VIP_AXI_ALEN_PORT_WIDTH           10
`define DW_VIP_AXI_ASIZE_PORT_WIDTH           3
`define DW_VIP_AXI_ABURST_PORT_WIDTH          2
`define DW_VIP_AXI_ALOCK_PORT_WIDTH           2
`define DW_VIP_AXI_ACACHE_PORT_WIDTH          4
`define DW_VIP_AXI_APROT_PORT_WIDTH           3
`define DW_VIP_AXI_AID_PORT_WIDTH            32
`define DW_VIP_AXI_AVALID_PORT_WIDTH          1
`define DW_VIP_AXI_AREADY_PORT_WIDTH          1

`define DW_VIP_AXI_ARADDR_PORT_WIDTH         64
`define DW_VIP_AXI_ARLEN_PORT_WIDTH          10
`define DW_VIP_AXI_ARSIZE_PORT_WIDTH          3
`define DW_VIP_AXI_ARBURST_PORT_WIDTH         2
`define DW_VIP_AXI_ARLOCK_PORT_WIDTH          2
`define DW_VIP_AXI_ARCACHE_PORT_WIDTH         4
`define DW_VIP_AXI_ARPROT_PORT_WIDTH          3
`define DW_VIP_AXI_ARID_PORT_WIDTH           32
`define DW_VIP_AXI_ARVALID_PORT_WIDTH         1
`define DW_VIP_AXI_ARREADY_PORT_WIDTH         1

`define DW_VIP_AXI_AWADDR_PORT_WIDTH         64
`define DW_VIP_AXI_AWLEN_PORT_WIDTH          10
`define DW_VIP_AXI_AWSIZE_PORT_WIDTH          3
`define DW_VIP_AXI_AWBURST_PORT_WIDTH         2
`define DW_VIP_AXI_AWLOCK_PORT_WIDTH          2
`define DW_VIP_AXI_AWCACHE_PORT_WIDTH         4
`define DW_VIP_AXI_AWPROT_PORT_WIDTH          3
`define DW_VIP_AXI_AWID_PORT_WIDTH           32
`define DW_VIP_AXI_AWVALID_PORT_WIDTH         1
`define DW_VIP_AXI_AWREADY_PORT_WIDTH         1

`define DW_VIP_AXI_RDATA_PORT_WIDTH        1024
`define DW_VIP_AXI_RRESP_PORT_WIDTH           2
`define DW_VIP_AXI_RID_PORT_WIDTH            32
`define DW_VIP_AXI_WDATA_PORT_WIDTH        1024
`define DW_VIP_AXI_WSTRB_PORT_WIDTH         128
`define DW_VIP_AXI_WID_PORT_WIDTH            32
`define DW_VIP_AXI_BRESP_PORT_WIDTH           2
`define DW_VIP_AXI_BID_PORT_WIDTH            32
`define DW_VIP_AXI_RVALID_PORT_WIDTH          1
`define DW_VIP_AXI_RLAST_PORT_WIDTH           1
`define DW_VIP_AXI_RREADY_PORT_WIDTH          1
`define DW_VIP_AXI_WVALID_PORT_WIDTH          1
`define DW_VIP_AXI_WLAST_PORT_WIDTH           1
`define DW_VIP_AXI_WREADY_PORT_WIDTH          1
`define DW_VIP_AXI_BVALID_PORT_WIDTH          1
`define DW_VIP_AXI_BREADY_PORT_WIDTH          1
`define DW_VIP_AXI_ACLK_PORT_WIDTH            1
`define DW_VIP_AXI_ARESETN_PORT_WIDTH         1

`define DW_VIP_AXI_CACTIVE_PORT_WIDTH         1
`define DW_VIP_AXI_CSYSREQ_PORT_WIDTH         1
`define DW_VIP_AXI_CSYSACK_PORT_WIDTH         1

`define DW_VIP_AXI_MAX_PORT_SIZE           1024

`define AXI_MAX_SYS_MASTERS                  32

// Used by testbench for Default Slave
`define SIM_SLVERR                            4
`define SIM_SLVERR_RND                        1
`define SIM_NOSLVERR                          0

`define AXI_HAS_S0
`define SIM_NEW_BURST                         2'h1
`define SIM_FIRST_BEAT                        2'h0
`define SIM_BURST                             2'h2
`define SIM_LAST                              3

`define SIM_SINGLE_BURST                      1
`define SIM_MULTIPLE_BURST                    0
`define SIM_BURST_RND                         2
`define SIM_BURST_INCR_16                     3

`define SIM_WRITE                             1
`define SIM_READ                              0
`define SIM_RW_RND                            2

`define SIM_SECURE                            0
`define SIM_UNSECURE                          1
`define SIM_SECURE_RND                        2

`define SIM_EXCLUSIVE                         1
`define SIM_LOCK                              2
`define SIM_UNLOCK                            0
`define SIM_LOCK_RND                          4

`define SIM_XACT_BUFF                        41
`define SIM_PENDING                        7'b0

`define SIM_ADDR_PENDING                  2'b00
`define SIM_ADDR_ACTIVE                   2'b01
`define SIM_ADDR_HS_START                 2'b10
`define SIM_ADDR_HS_COMPLETE              2'b11

`define SIM_DATA_PENDING                  2'b00
`define SIM_DATA_ACTIVE                   2'b01
`define SIM_DATA_FB_START                 2'b01
`define SIM_DATA_FB_COMPLETE              2'b10

`define SIM_BRESP_PENDING                 1'b1
`define SIM_BRESP_COMPLETE                1'b1

`define SIM_MAX_PEND 16*8
`define AXI_DECERR 2'b11

`define SIM_MAX_NUM_SLV_REGIONS              8

module test_DW_axi;

   parameter simulation_cycle = 100;

   // Low-Power test parameters
   parameter  FullPower   = 1'b0;
   parameter  LowPower    = 1'b1;
   localparam AR_HAS_BUFF = (`AXI_AR_TMO != 0) & (`AXI_AR_PL_ARB);
   localparam AW_HAS_BUFF = (`AXI_AW_TMO != 0) & (`AXI_AW_PL_ARB);
   localparam W_HAS_BUFF  = (`AXI_W_TMO != 0)  & (`AXI_W_PL_ARB );


   wire [31:0]  slv_max_transaction[`AXI_NUM_SLAVES:0];
   wire [31:0]  slv_max_wr_transaction[`AXI_NUM_SLAVES:0];
   wire [31:0]  slv_max_rd_transaction[`AXI_NUM_SLAVES:0];

   wire [31:0]  mst_max_transaction[`AXI_NUM_MASTERS:0];
   wire [31:0]  mst_max_wr_uid_transaction[`AXI_NUM_MASTERS:0];
   wire [31:0]  mst_max_wr_cmd_transaction[`AXI_NUM_MASTERS:0];
   wire [31:0]  mst_max_rd_uid_transaction[`AXI_NUM_MASTERS:0];
   wire [31:0]  mst_max_rd_cmd_transaction[`AXI_NUM_MASTERS:0];

   wire [31:0]  slv_wid_array [`AXI_NUM_SLAVES:0];
   wire [31:0]  slv_num_regions [`AXI_NUM_SLAVES:0];
   wire [31:0]  region_num;

   wire [`AXI_AW-1:0] slv_region_start_array [`AXI_NUM_SLAVES:0][7:0];
   wire [`AXI_AW-1:0] slv_region_end_array [`AXI_NUM_SLAVES:0][7:0];
   wire [`AXI_AW-1:0] slv_region_size_array [`AXI_NUM_SLAVES:0][7:0];

   // Visibility settings for the active address mode.
   wire visible_slaves[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0];
   // Visibility settings for the inactive address mode.
   wire visible_slaves_other_mode[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0];
   wire [31:0] num_vis_mst[`AXI_NUM_SLAVES:0];

   wire [`AXI_NUM_MASTERS-1:0] ri_limit_m;

   wire [31:0] num_valid_icm_master[4:0];
   wire [31:0] valid_icm_master[4:0][8:0];

   wire                 arvalid_m_array[`AXI_NUM_MASTERS:0];
   wire                 arready_m_array[`AXI_NUM_MASTERS:0];
   wire [`AXI_AW-1:0]   araddr_m_array[`AXI_NUM_MASTERS:0];
   wire                 arvalid_s_array[`AXI_NUM_SLAVES:0];
   wire [`AXI_SIDW-1:0] arid_s_array[`AXI_NUM_SLAVES:0];

   // Used in check_multitile_dlock_masking.
   reg [31:0] tb_bus_mst_w_nlcl_pend_cnt [`AXI_NUM_MASTERS-1:0];
   reg [`AXI_NUM_SLAVES-1:0] tb_bus_mst_w_nlcl_pend_slv [`AXI_NUM_MASTERS-1:0];
   reg [`AXI_NUM_MASTERS-1:0] tb_mst_wlast_b4_awr;

   // Used in lock arbitration test.
   reg tb_lock_arb_test_on;

  // Used in verilog checkers.
  reg found_error = 0;
  reg check_shared_report_parallel = 0;

 `ifdef AXI_EXT_PRIORITY

 `ifdef AXI_SHARED_LAYER_SLAVE_PRIORITY_EN
  reg [`AXI_LOG2_NS-1:0] slv_priority_shared;
 `endif
 `ifdef AXI_SHARED_LAYER_MASTER_PRIORITY_EN
  reg [`AXI_LOG2_LCL_NM-1:0] mst_priority_shared;
 `endif

   reg [`AXI_LOG2_NSP1-1:0] set_slave_priority[`AXI_NUM_SLAVES:0];
   reg [`AXI_LOG2_LCL_NM-1:0] set_master_priority[`AXI_NUM_MASTERS:0];
 `endif

 `ifdef AXI_BICMD_SUPPORT
   wire [31:0] axi_pnum_for_snum[64:0];
 `endif

   wire [`AXI_LOG2_NSP1-1:0] axi_slave_priority[`AXI_NUM_SLAVES:0];
   wire [`AXI_LOG2_NM-1:0] axi_master_priority[`AXI_NUM_MASTERS:0];

   reg       system_clk;
   reg       test_failed;
   reg       test_complete;
   reg       remap_n;
   wire [`AXI_NUM_SLAVES:1] nv_by_m;
   wire [`AXI_NUM_SLAVES:1] bv_by_m;

   reg       aresetn;

   integer clk_count;
	 integer lp_if_tst_num_tx;

   integer   master_num;
   integer   slave_num;
   integer   region_count;
   integer   seed;

   integer   sim_error;
   integer   arb_error;
   integer   id_error;
   integer   df_error;
   integer   max_xact1;
   integer   max_xact2;
   integer   test_debug;
   integer   write_debug;
   integer   sim_in_progress;
   integer   mst_cnt, xact_cnt;
   integer   i;

   // Low-Power test signals
   reg      csysreq;
   wire     cactive;
   wire     csysack;
   reg      low_power_mode;


   integer  idle_time;
   integer  num_trans;


   reg [31:0] slv_rd_xact_cnt[`AXI_NUM_SLAVES:0];
   reg [31:0] slv_rd_xact_cnt_mstid[`AXI_NUM_SLAVES:0];
   reg [31:0] slv_wr_xact_cnt[`AXI_NUM_SLAVES:0];
   reg [31:0] slv_wr_xact_cnt_mstid[`AXI_NUM_SLAVES:0];

   reg [31:0] mst_rd_xact_cnt[`AXI_NUM_MASTERS:0];
   reg [31:0] mst_rd_pend_ptr[`AXI_NUM_MASTERS:0];
   reg [`SIM_XACT_BUFF-1:0] mst_rd_xact_buff[`AXI_NUM_MASTERS:0][`SIM_MAX_PEND:0];
   reg [31:0] mst_rd_pend_cnt[`AXI_NUM_MASTERS:0];
   reg [(`SIM_MAX_PEND*32)-1:0] mst_rd_pend_buff[`AXI_NUM_MASTERS:0];

   reg [31:0] mst_wr_xact_cnt[`AXI_NUM_MASTERS:0];
   reg [31:0] mst_wr_pend_ptr[`AXI_NUM_MASTERS:0];
   reg [`SIM_XACT_BUFF-1:0] mst_wr_xact_buff[`AXI_NUM_MASTERS:0][`SIM_MAX_PEND:0];
   reg [31:0] mst_wr_pend_cnt[`AXI_NUM_MASTERS:0];
   reg [(`SIM_MAX_PEND*32)-1:0] mst_wr_pend_buff[`AXI_NUM_MASTERS:0];

   reg [31:0] mst_rd_xact_cnt_uid[`AXI_NUM_MASTERS:0][9:0];

   reg [31:0] mst_wr_xact_cnt_uid[`AXI_NUM_MASTERS:0][9:0];

   reg  [31:0]         slv_ar_queue_cnt[`AXI_NUM_SLAVES:0];
   reg  [31:0]         slv_aw_queue_cnt[`AXI_NUM_SLAVES:0];

   integer check_rsb, check_wsb;
   integer check_nv;

   reg [31:0] rd_mst_cnt;
   reg [31:0] wr_slv_cnt;

   reg [31:0] mst_bresp_ptr[`AXI_NUM_MASTERS:0];
   reg [33:0] mst_bresp_buff[`AXI_NUM_MASTERS:0][`SIM_MAX_PEND:0];

   reg [`AXI_LOG2_NS-1:0] slv_buffer_0[31:0];

   reg  [`AXI_MIDW-1:0]mst_aid_tracker[`AXI_NUM_MASTERS:0][1:0][32:0];
   reg  [31:0]         mst_aid_tracker_slv[`AXI_NUM_MASTERS:0][1:0][32:0];
   reg  [31:0]         mst_aid_tracker_cnt[`AXI_NUM_MASTERS:0][1:0][32:0];

// Multi cycle arbitration check variables.
   reg chk_mca_done;
   reg chk_mca_failed;

// Wire Declarations for Master Vip to Interconnect Connections (Long Vector format)

   wire [(`AXI_NUM_MASTERS)-1:0]                		arvalid_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_ARADDR_PORT_WIDTH)-1:0]  araddr_m_bus;
   wire [(`AXI_NUM_MASTERS*`AXI_LOG2_NSP1)-1:0]                 xdcdr_slv_num_rd_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_ARLEN_PORT_WIDTH)-1:0]   arlen_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_ARSIZE_PORT_WIDTH)-1:0]  arsize_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:0] arburst_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_ARLOCK_PORT_WIDTH)-1:0]  arlock_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:0] arcache_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_ARPROT_PORT_WIDTH)-1:0]  arprot_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_ARID_PORT_WIDTH)-1:0]    arid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                arready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                awvalid_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_AWADDR_PORT_WIDTH)-1:0]  awaddr_m_bus;
   wire [(`AXI_NUM_MASTERS*`AXI_LOG2_NSP1)-1:0]                 xdcdr_slv_num_wr_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_AWLEN_PORT_WIDTH)-1:0]   awlen_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_AWSIZE_PORT_WIDTH)-1:0]  awsize_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:0] awburst_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_AWLOCK_PORT_WIDTH)-1:0]  awlock_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:0] awcache_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_AWPROT_PORT_WIDTH)-1:0]  awprot_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_AWID_PORT_WIDTH)-1:0]    awid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                awready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                rvalid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                rlast_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_RDATA_PORT_WIDTH)-1:0]   rdata_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_RRESP_PORT_WIDTH)-1:0]   rresp_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_RID_PORT_WIDTH)-1:0]     rid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                rready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                wvalid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                wlast_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_WDATA_PORT_WIDTH)-1:0]   wdata_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:0]   wstrb_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_WID_PORT_WIDTH)-1:0]     wid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                wready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                bvalid_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_BRESP_PORT_WIDTH)-1:0]   bresp_m_bus;
   wire [(`AXI_NUM_MASTERS*`DW_VIP_AXI_BID_PORT_WIDTH)-1:0]     bid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                bready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                cactive_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                csysreq_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                                csysack_m_bus;

   wire [(`AXI_NUM_MASTERS*`AXI_AW_SBW)-1:0]                    awsideband_m_bus;
   wire [(`AXI_NUM_MASTERS*`AXI_W_SBW)-1:0]                     wsideband_m_bus;
   wire [(`AXI_NUM_MASTERS*`AXI_AR_SBW)-1:0]                    arsideband_m_bus;
   wire [(`AXI_NUM_MASTERS*`AXI_B_SBW)-1:0]                     bsideband_m_bus;
   wire [(`AXI_NUM_MASTERS*`AXI_R_SBW)-1:0]                     rsideband_m_bus;

// Wire Declarations for Master Vip to Interconnect Connections (Array format)

   wire [`AXI_NUM_MASTERS:1]                    arvalid_m;
   wire [`AXI_MAX_SYS_MASTERS:1]                arvalid_m_sys;
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0]     araddr_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0]      arlen_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH-1:0]       arid_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_NUM_MASTERS:1]                    arready_m;
   wire [`AXI_NUM_MASTERS:1]                    awvalid_m;
   wire [`AXI_MAX_SYS_MASTERS:1]                awvalid_m_sys;
   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0]     awaddr_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0]      awlen_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH-1:0]       awid_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_NUM_MASTERS:1]                    awready_m;
   wire [`AXI_NUM_MASTERS:1]                    rvalid_m;
   wire [`AXI_MAX_SYS_MASTERS:1]                rvalid_m_sys;
   wire [`AXI_NUM_MASTERS:1]                    rlast_m;
   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0]      rdata_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH-1:0]      rresp_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_RID_PORT_WIDTH-1:0]        rid_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_NUM_MASTERS:1]                    rready_m;
   wire [`AXI_NUM_MASTERS:1]                    wvalid_m;
   wire [`AXI_MAX_SYS_MASTERS:1]                wvalid_m_sys;
   wire [`AXI_NUM_MASTERS:1]                    wlast_m;
   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0]      wdata_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0]      wstrb_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_WID_PORT_WIDTH-1:0]        wid_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_NUM_MASTERS:1]                    wready_m;
   wire [`AXI_NUM_MASTERS:1]                    bvalid_m;
   wire [`AXI_MAX_SYS_MASTERS:1]                bvalid_m_sys;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH-1:0]      bresp_m[`AXI_NUM_MASTERS:1];
   wire [`DW_VIP_AXI_BID_PORT_WIDTH-1:0]        bid_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_NUM_MASTERS:1]                    bready_m;

   wire [`AXI_AW_SBW-1:0]                       awsideband_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_W_SBW-1:0]                        wsideband_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_AR_SBW-1:0]                       arsideband_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_B_SBW-1:0]                        bsideband_m[`AXI_NUM_MASTERS:1];
   wire [`AXI_R_SBW-1:0]                        rsideband_m[`AXI_NUM_MASTERS:1];

// Wire Declarations for Interconnect to Slave Vip Connections (Long Vector format)

   wire [((`AXI_NUM_SLAVES))-1:0]                		 arvalid_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_ARADDR_PORT_WIDTH)-1:0]  araddr_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_ARLEN_PORT_WIDTH)-1:0]   arlen_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_ARSIZE_PORT_WIDTH)-1:0]  arsize_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:0] arburst_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_ARLOCK_PORT_WIDTH)-1:0]  arlock_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:0] arcache_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_ARPROT_PORT_WIDTH)-1:0]  arprot_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_ARID_PORT_WIDTH)-1:0]    arid_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                arready_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                awvalid_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_AWADDR_PORT_WIDTH)-1:0]  awaddr_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_AWLEN_PORT_WIDTH)-1:0]   awlen_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_AWSIZE_PORT_WIDTH)-1:0]  awsize_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:0] awburst_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_AWLOCK_PORT_WIDTH)-1:0]  awlock_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:0] awcache_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_AWPROT_PORT_WIDTH)-1:0]  awprot_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_AWID_PORT_WIDTH)-1:0]    awid_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                awready_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                rvalid_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                rlast_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_RDATA_PORT_WIDTH)-1:0]   rdata_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_RRESP_PORT_WIDTH)-1:0]   rresp_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_RID_PORT_WIDTH)-1:0]     rid_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                rready_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                wvalid_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                wlast_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_WDATA_PORT_WIDTH)-1:0]   wdata_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:0]   wstrb_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_WID_PORT_WIDTH)-1:0]     wid_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                wready_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                bvalid_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_BRESP_PORT_WIDTH)-1:0]   bresp_s_bus;
   wire [((`AXI_NUM_SLAVES)*`DW_VIP_AXI_BID_PORT_WIDTH)-1:0]     bid_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                bready_s_bus;
   wire [((`AXI_NUM_SLAVES)):0]                                  cactive_s_bus_ext;
   wire [((`AXI_NUM_SLAVES)):0]                                  csysreq_s_bus_ext;
   wire [((`AXI_NUM_SLAVES)):0]                                  csysack_s_bus_ext;
   wire [((`AXI_NUM_SLAVES))-1:0]                                cactive_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                csysreq_s_bus;
   wire [((`AXI_NUM_SLAVES))-1:0]                                csysack_s_bus;

   wire [((`AXI_NUM_SLAVES))-1:0]  			         tz_secure_s_bus;
   wire [((`AXI_NUM_SLAVES)*`AXI_AW_SBW)-1:0]                    awsideband_s_bus;
   wire [((`AXI_NUM_SLAVES)*`AXI_W_SBW)-1:0]                     wsideband_s_bus;
   wire [((`AXI_NUM_SLAVES)*`AXI_AR_SBW)-1:0]                    arsideband_s_bus;
   wire [((`AXI_NUM_SLAVES)*`AXI_B_SBW)-1:0]                     bsideband_s_bus;
   wire [((`AXI_NUM_SLAVES)*`AXI_R_SBW)-1:0]                     rsideband_s_bus;

// Wire Declarations for Interconnect to Slave Vip Connections (Array format)

   wire [`AXI_NUM_SLAVES:0]                     arvalid_s;
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s0;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s0;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s0;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s0;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s0;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s0;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s0;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s0;
   wire [`AXI_NUM_SLAVES:0]                     arready_s;
   wire [`AXI_NUM_SLAVES:0]                     awvalid_s;
   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s0;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s0;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s0;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s0;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s0;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s0;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s0;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s0;
   wire [`AXI_NUM_SLAVES:0]                     awready_s;
   wire [`AXI_NUM_SLAVES:0]                     rvalid_s;
   wire [`AXI_NUM_SLAVES:0]                     rlast_s;
   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s0;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH-1:0]      rresp_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH-1:0]      rresp_s0;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s0;
   wire [`AXI_NUM_SLAVES:0]                     rready_s;
   wire [`AXI_NUM_SLAVES:0]                     wvalid_s;
   wire [`AXI_NUM_SLAVES:0]                     wlast_s;
   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s0;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s0;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s0;
   wire [`AXI_NUM_SLAVES:0]                     wready_s;
   wire [`AXI_NUM_SLAVES:0]                     bvalid_s;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH-1:0]      bresp_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH-1:0]      bresp_s0;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s[`AXI_NUM_SLAVES:0];
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s0;
   wire [`AXI_NUM_SLAVES:0]                     bready_s;

   wire [`AXI_NUM_SLAVES:0]                     awvalid_alias0_s;
   wire [`AXI_NUM_SLAVES:0]                     awvalid_alias1_s;
   wire [`AXI_NUM_SLAVES:0]                     awvalid_alias2_s;
   wire [`AXI_NUM_SLAVES:0]                     arvalid_alias0_s;
   wire [`AXI_NUM_SLAVES:0]                     arvalid_alias1_s;
   wire [`AXI_NUM_SLAVES:0]                     arvalid_alias2_s;
   wire [`AXI_NUM_SLAVES:0]                     wvalid_alias0_s;
   wire [`AXI_NUM_SLAVES:0]                     wvalid_alias1_s;
   wire [`AXI_NUM_SLAVES:0]                     wvalid_alias2_s;
   wire [`AXI_NUM_SLAVES:0]                     rvalid_alias0_s;
   wire [`AXI_NUM_SLAVES:0]                     rvalid_alias1_s;
   wire [`AXI_NUM_SLAVES:0]                     rvalid_alias2_s;
   wire [`AXI_NUM_SLAVES:0]                     bvalid_alias0_s;
   wire [`AXI_NUM_SLAVES:0]                     bvalid_alias1_s;
   wire [`AXI_NUM_SLAVES:0]                     bvalid_alias2_s;

   reg  [`AXI_NUM_SLAVES:0]                     tz_secure_s;
   wire [`AXI_AW_SBW-1:0]                       awsideband_s[`AXI_NUM_SLAVES:0];
   wire [`AXI_W_SBW-1:0]                        wsideband_s[`AXI_NUM_SLAVES:0];
   wire [`AXI_AR_SBW-1:0]                       arsideband_s[`AXI_NUM_SLAVES:0];
   wire [`AXI_B_SBW-1:0]                        bsideband_s[`AXI_NUM_SLAVES:0];
   wire [`AXI_R_SBW-1:0]                        rsideband_s[`AXI_NUM_SLAVES:0];


   wire [(`AXI_NUM_MASTERS)-1:0]                int_awvalid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_awready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_arvalid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_arready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_wready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_bvalid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_bready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_rvalid_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_rready_m_bus;
   wire [(`AXI_NUM_MASTERS)-1:0]                int_rlast_m_bus;
   wire                                         int_csysreq;
   wire                                         int_csysack;
   wire                                         int_cactive;

   assign #1 int_awvalid_m_bus = awvalid_m_bus;
   assign #1 int_awready_m_bus = awready_m_bus;
   assign #1 int_arvalid_m_bus = arvalid_m_bus;
   assign #1 int_arready_m_bus = arready_m_bus;
   assign #1 int_wready_m_bus  = wready_m_bus;
   assign #1 int_bvalid_m_bus  = bvalid_m_bus;
   assign #1 int_bready_m_bus  = bready_m_bus;
   assign #1 int_rvalid_m_bus  = rvalid_m_bus;
   assign #1 int_rready_m_bus  = rready_m_bus;
   assign #1 int_rlast_m_bus   = rlast_m_bus;
   assign #1 int_csysreq       = csysreq;
   assign #1 int_csysack       = csysack;
   assign #1 int_cactive       = cactive;


   assign cactive_s_bus_ext = {cactive_s_bus, 1'b0 };
   assign csysack_s_bus_ext = {csysack_s_bus, 1'b0 };
   assign csysreq_s_bus = csysreq_s_bus_ext[`AXI_NUM_SLAVES:1];

 `ifdef AXI_HAS_DLOCK_NOTIFY


   integer aw_outstanding        [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer ar_outstanding        [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer aw_deadlocked         [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer ar_deadlocked         [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer aw_tx_count           [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer aw_tx_slvs            [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer aw_tx_ids             [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer ar_tx_count           [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer ar_tx_slvs            [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   integer ar_tx_ids             [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   
   reg     aw_issued_slot_num_oh [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   reg     ar_issued_slot_num_oh [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   reg     aw_cpl_slot_num_oh    [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];
   reg     ar_cpl_slot_num_oh    [`AXI_NUM_MASTERS:1][`AXI_POW2_MIDW-1:0];

   reg [`AXI_LOG2_NSP1-1:0]  aw_tx_issued_slv [`AXI_NUM_MASTERS:1];
   reg [`AXI_LOG2_NSP1-1:0]  ar_tx_issued_slv [`AXI_NUM_MASTERS:1];

   // Using slave ID width so there are enough bits for bi-di mode.
   reg [`AXI_SIDW-1:0]  aw_tx_issued_id [`AXI_NUM_MASTERS:1];
   reg [`AXI_SIDW-1:0]  ar_tx_issued_id [`AXI_NUM_MASTERS:1];
   
   reg [`AXI_NUM_MASTERS:1] aw_tx_issued;
   reg [`AXI_NUM_MASTERS:1] ar_tx_issued;
   reg [`AXI_NUM_MASTERS:1] aw_cpl_tx_i;
   reg [`AXI_NUM_MASTERS:1] ar_cpl_tx_i;
   
   reg     check_dlock_irq;
   reg     check_dlock_wr;

   integer check_dlock_mst;
   integer check_dlock_slv;
   integer check_dlock_id;
  
   wire  [`AXI_LOG2_LCL_NM-1:0] dlock_mst;
   wire  [`AXI_LOG2_NSP1-1:0]   dlock_slv;
   wire  [`AXI_MIDW-1:0]        dlock_id;
   wire                         dlock_wr;
   wire                         dlock_irq;

 `endif


`ifdef AXI_HAS_S1
   assign nv_by_m[1] = `AXI_NV_S1_BY_ANY_M;
   assign bv_by_m[1] = `AXI_BV_S1_BY_ANY_M;
`endif
`ifdef AXI_HAS_S2
   assign nv_by_m[2] = `AXI_NV_S2_BY_ANY_M;
   assign bv_by_m[2] = `AXI_BV_S2_BY_ANY_M;
`endif
`ifdef AXI_HAS_S3
   assign nv_by_m[3] = `AXI_NV_S3_BY_ANY_M;
   assign bv_by_m[3] = `AXI_BV_S3_BY_ANY_M;
`endif
`ifdef AXI_HAS_S4
   assign nv_by_m[4] = `AXI_NV_S4_BY_ANY_M;
   assign bv_by_m[4] = `AXI_BV_S4_BY_ANY_M;
`endif
`ifdef AXI_HAS_S5
   assign nv_by_m[5] = `AXI_NV_S5_BY_ANY_M;
   assign bv_by_m[5] = `AXI_BV_S5_BY_ANY_M;
`endif
`ifdef AXI_HAS_S6
   assign nv_by_m[6] = `AXI_NV_S6_BY_ANY_M;
   assign bv_by_m[6] = `AXI_BV_S6_BY_ANY_M;
`endif
`ifdef AXI_HAS_S7
   assign nv_by_m[7] = `AXI_NV_S7_BY_ANY_M;
   assign bv_by_m[7] = `AXI_BV_S7_BY_ANY_M;
`endif
`ifdef AXI_HAS_S8
   assign nv_by_m[8] = `AXI_NV_S8_BY_ANY_M;
   assign bv_by_m[8] = `AXI_BV_S8_BY_ANY_M;
`endif
`ifdef AXI_HAS_S9
   assign nv_by_m[9] = `AXI_NV_S9_BY_ANY_M;
   assign bv_by_m[9] = `AXI_BV_S9_BY_ANY_M;
`endif
`ifdef AXI_HAS_S10
   assign nv_by_m[10] = `AXI_NV_S10_BY_ANY_M;
   assign bv_by_m[10] = `AXI_BV_S10_BY_ANY_M;
`endif
`ifdef AXI_HAS_S11
   assign nv_by_m[11] = `AXI_NV_S11_BY_ANY_M;
   assign bv_by_m[11] = `AXI_BV_S11_BY_ANY_M;
`endif
`ifdef AXI_HAS_S12
   assign nv_by_m[12] = `AXI_NV_S12_BY_ANY_M;
   assign bv_by_m[12] = `AXI_BV_S12_BY_ANY_M;
`endif
`ifdef AXI_HAS_S13
   assign nv_by_m[13] = `AXI_NV_S13_BY_ANY_M;
   assign bv_by_m[13] = `AXI_BV_S13_BY_ANY_M;
`endif
`ifdef AXI_HAS_S14
   assign nv_by_m[14] = `AXI_NV_S14_BY_ANY_M;
   assign bv_by_m[14] = `AXI_BV_S14_BY_ANY_M;
`endif
`ifdef AXI_HAS_S15
   assign nv_by_m[15] = `AXI_NV_S15_BY_ANY_M;
   assign bv_by_m[15] = `AXI_BV_S15_BY_ANY_M;
`endif
`ifdef AXI_HAS_S16
   assign nv_by_m[16] = `AXI_NV_S16_BY_ANY_M;
   assign bv_by_m[16] = `AXI_BV_S16_BY_ANY_M;
`endif

`ifdef AXI_HAS_M1
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m1;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m1;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m1;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m1;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m1;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m1;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m1;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m1;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m1;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m1;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m1;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m1;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m1;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m1;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m1;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m1;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m1;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m1;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m1;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m1;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m1;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m1;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m1;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m1;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m1;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m1;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m1;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m1;

   assign xdcdr_slv_num_wr_m[1] = xdcdr_slv_num_wr_m1;
   assign xdcdr_slv_num_rd_m[1] = xdcdr_slv_num_rd_m1;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m1;
   assign arsideband_m[1] = arsideband_m1;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m1;
   assign awsideband_m[1] = awsideband_m1;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m1;
   assign rsideband_m[1] = rsideband_m1;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m1;
   assign wsideband_m[1] = wsideband_m1;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m1;
   assign bsideband_m[1] = bsideband_m1;
 `endif

   assign araddr_m[1]  = araddr_m1;
   assign arid_m[1]    = arid_m1;
   assign arlen_m[1]   = arlen_m1;
   assign arsize_m[1]  = arsize_m1;
   assign arburst_m[1] = arburst_m1;
   assign arlock_m[1]  = arlock_m1;
   assign arprot_m[1]  = arprot_m1;
   assign arcache_m[1] = arcache_m1;

   assign awaddr_m[1]  = awaddr_m1;
   assign awid_m[1]    = awid_m1;
   assign awlen_m[1]   = awlen_m1;
   assign awsize_m[1]  = awsize_m1;
   assign awburst_m[1] = awburst_m1;
   assign awlock_m[1]  = awlock_m1;
   assign awprot_m[1]  = awprot_m1;
   assign awcache_m[1] = awcache_m1;

   assign wdata_m[1] = wdata_m1;
   assign wid_m[1]   = wid_m1;
   assign wstrb_m[1] = wstrb_m1;

   assign rdata_m[1] = rdata_m1;
   assign rid_m[1]   = rid_m1;
`ifdef AXI_HAS_ICM1
   assign rid_mon_m1 = {32'b0, rid_m1[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m1 = {32'b0, rid_m1[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[1] = rresp_m1;

`ifdef AXI_HAS_ICM1
   assign bid_mon_m1 = {32'b0, bid_m1[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m1 = {32'b0, bid_m1[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[1] = bresp_m1;

   assign arvalid_m[1] = arvalid_m_bus[0];
   assign araddr_m1    = araddr_m_bus[ ((0 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(0*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m1 = xdcdr_slv_num_rd_m_bus[ ((0 + 1) * `AXI_LOG2_NSP1) -1:(0*`AXI_LOG2_NSP1)];
   assign arlen_m1     = arlen_m_bus[  ((0 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(0*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m1    = arsize_m_bus[ ((0 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(0*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m1   = arburst_m_bus[((0 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(0*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m1    = arlock_m_bus[ ((0 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(0*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m1   = arcache_m_bus[((0 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(0*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m1    = arprot_m_bus[ ((0 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(0*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m1      = arid_m_bus[ ((0 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[0] = arready_m[1];

   assign awvalid_m[1] = awvalid_m_bus[0];
   assign awaddr_m1    = awaddr_m_bus[ ((0 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(0*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m1 = xdcdr_slv_num_wr_m_bus[ ((0 + 1) * `AXI_LOG2_NSP1) -1:(0*`AXI_LOG2_NSP1)];
   assign awlen_m1     = awlen_m_bus[  ((0 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(0*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m1    = awsize_m_bus[ ((0 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(0*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m1   = awburst_m_bus[((0 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(0*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m1    = awlock_m_bus[ ((0 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(0*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m1   = awcache_m_bus[((0 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(0*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m1    = awprot_m_bus[ ((0 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(0*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m1      = awid_m_bus[ ((0 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[0] = awready_m[1];

   assign rvalid_m_bus[0] = rvalid_m[1];
   assign rlast_m_bus[0] = rlast_m[1];
   assign rdata_m_bus[((0 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m1;
   assign rresp_m_bus[((0 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m1;
   assign rid_m_bus[((0 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m1;
   assign rready_m[1] = rready_m_bus[0];

   assign wvalid_m[1] = wvalid_m_bus[0];
   assign wlast_m[1]  = wlast_m_bus[0];
   assign wdata_m1    = wdata_m_bus[((0 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(0*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m1    = wstrb_m_bus[((0 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(0*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m1      = wid_m_bus[((0 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[0] = wready_m[1];

	 // jstokes, 4.11.2010, add hash delay to wready_m[1] in assignment 
	 // to delayed_wready_m1. test_one_write is checking to see if this
 	 // signal asserts at a certain clock edge, and different simulators
	 // will detect it at different times if the hash delay is not present.
	 reg delayed_wready_m1;
	 always @(*) begin
	   delayed_wready_m1 = #1 wready_m[1];
	 end

   assign bvalid_m_bus[0] = bvalid_m[1];
   assign bresp_m_bus[((0 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m1;
   assign bid_m_bus[((0 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m1;
   assign bready_m[1] = bready_m_bus[0];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m1 = {2{awaddr_m_bus[(0*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(0*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m1 = {8{wdata_m_bus[(0*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(0*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m1 = {2{araddr_m_bus[(0*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(0*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M2
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m2;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m2;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m2;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m2;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m2;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m2;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m2;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m2;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m2;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m2;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m2;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m2;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m2;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m2;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m2;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m2;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m2;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m2;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m2;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m2;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m2;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m2;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m2;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m2;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m2;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m2;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m2;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m2;

   assign xdcdr_slv_num_wr_m[2] = xdcdr_slv_num_wr_m2;
   assign xdcdr_slv_num_rd_m[2] = xdcdr_slv_num_rd_m2;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m2;
   assign arsideband_m[2] = arsideband_m2;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m2;
   assign awsideband_m[2] = awsideband_m2;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m2;
   assign rsideband_m[2] = rsideband_m2;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m2;
   assign wsideband_m[2] = wsideband_m2;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m2;
   assign bsideband_m[2] = bsideband_m2;
 `endif

   assign araddr_m[2]  = araddr_m2;
   assign arid_m[2]    = arid_m2;
   assign arlen_m[2]   = arlen_m2;
   assign arsize_m[2]  = arsize_m2;
   assign arburst_m[2] = arburst_m2;
   assign arlock_m[2]  = arlock_m2;
   assign arprot_m[2]  = arprot_m2;
   assign arcache_m[2] = arcache_m2;

   assign awaddr_m[2]  = awaddr_m2;
   assign awid_m[2]    = awid_m2;
   assign awlen_m[2]   = awlen_m2;
   assign awsize_m[2]  = awsize_m2;
   assign awburst_m[2] = awburst_m2;
   assign awlock_m[2]  = awlock_m2;
   assign awprot_m[2]  = awprot_m2;
   assign awcache_m[2] = awcache_m2;

   assign wdata_m[2] = wdata_m2;
   assign wid_m[2]   = wid_m2;
   assign wstrb_m[2] = wstrb_m2;

   assign rdata_m[2] = rdata_m2;
   assign rid_m[2]   = rid_m2;
`ifdef AXI_HAS_ICM2
   assign rid_mon_m2 = {32'b0, rid_m2[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m2 = {32'b0, rid_m2[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[2] = rresp_m2;

`ifdef AXI_HAS_ICM2
   assign bid_mon_m2 = {32'b0, bid_m2[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m2 = {32'b0, bid_m2[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[2] = bresp_m2;

   assign arvalid_m[2] = arvalid_m_bus[1];
   assign araddr_m2    = araddr_m_bus[ ((1 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(1*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m2 = xdcdr_slv_num_rd_m_bus[ ((1 + 1) * `AXI_LOG2_NSP1) -1:(1*`AXI_LOG2_NSP1)];
   assign arlen_m2     = arlen_m_bus[  ((1 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(1*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m2    = arsize_m_bus[ ((1 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(1*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m2   = arburst_m_bus[((1 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(1*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m2    = arlock_m_bus[ ((1 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(1*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m2   = arcache_m_bus[((1 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(1*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m2    = arprot_m_bus[ ((1 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(1*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m2      = arid_m_bus[ ((1 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[1] = arready_m[2];

   assign awvalid_m[2] = awvalid_m_bus[1];
   assign awaddr_m2    = awaddr_m_bus[ ((1 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(1*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m2 = xdcdr_slv_num_wr_m_bus[ ((1 + 1) * `AXI_LOG2_NSP1) -1:(1*`AXI_LOG2_NSP1)];
   assign awlen_m2     = awlen_m_bus[  ((1 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(1*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m2    = awsize_m_bus[ ((1 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(1*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m2   = awburst_m_bus[((1 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(1*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m2    = awlock_m_bus[ ((1 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(1*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m2   = awcache_m_bus[((1 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(1*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m2    = awprot_m_bus[ ((1 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(1*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m2      = awid_m_bus[ ((1 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[1] = awready_m[2];

   assign rvalid_m_bus[1] = rvalid_m[2];
   assign rlast_m_bus[1] = rlast_m[2];
   assign rdata_m_bus[((1 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m2;
   assign rresp_m_bus[((1 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m2;
   assign rid_m_bus[((1 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m2;
   assign rready_m[2] = rready_m_bus[1];

   assign wvalid_m[2] = wvalid_m_bus[1];
   assign wlast_m[2]  = wlast_m_bus[1];
   assign wdata_m2    = wdata_m_bus[((1 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(1*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m2    = wstrb_m_bus[((1 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(1*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m2      = wid_m_bus[((1 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[1] = wready_m[2];

   assign bvalid_m_bus[1] = bvalid_m[2];
   assign bresp_m_bus[((1 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m2;
   assign bid_m_bus[((1 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m2;
   assign bready_m[2] = bready_m_bus[1];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m2 = {2{awaddr_m_bus[(1*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(1*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m2 = {8{wdata_m_bus[(1*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(1*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m2 = {2{araddr_m_bus[(1*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(1*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M3
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m3;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m3;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m3;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m3;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m3;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m3;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m3;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m3;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m3;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m3;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m3;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m3;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m3;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m3;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m3;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m3;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m3;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m3;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m3;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m3;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m3;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m3;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m3;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m3;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m3;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m3;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m3;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m3;

   assign xdcdr_slv_num_wr_m[3] = xdcdr_slv_num_wr_m3;
   assign xdcdr_slv_num_rd_m[3] = xdcdr_slv_num_rd_m3;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m3;
   assign arsideband_m[3] = arsideband_m3;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m3;
   assign awsideband_m[3] = awsideband_m3;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m3;
   assign rsideband_m[3] = rsideband_m3;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m3;
   assign wsideband_m[3] = wsideband_m3;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m3;
   assign bsideband_m[3] = bsideband_m3;
 `endif

   assign araddr_m[3]  = araddr_m3;
   assign arid_m[3]    = arid_m3;
   assign arlen_m[3]   = arlen_m3;
   assign arsize_m[3]  = arsize_m3;
   assign arburst_m[3] = arburst_m3;
   assign arlock_m[3]  = arlock_m3;
   assign arprot_m[3]  = arprot_m3;
   assign arcache_m[3] = arcache_m3;

   assign awaddr_m[3]  = awaddr_m3;
   assign awid_m[3]    = awid_m3;
   assign awlen_m[3]   = awlen_m3;
   assign awsize_m[3]  = awsize_m3;
   assign awburst_m[3] = awburst_m3;
   assign awlock_m[3]  = awlock_m3;
   assign awprot_m[3]  = awprot_m3;
   assign awcache_m[3] = awcache_m3;

   assign wdata_m[3] = wdata_m3;
   assign wid_m[3]   = wid_m3;
   assign wstrb_m[3] = wstrb_m3;

   assign rdata_m[3] = rdata_m3;
   assign rid_m[3]   = rid_m3;
`ifdef AXI_HAS_ICM3
   assign rid_mon_m3 = {32'b0, rid_m3[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m3 = {32'b0, rid_m3[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[3] = rresp_m3;

`ifdef AXI_HAS_ICM3
   assign bid_mon_m3 = {32'b0, bid_m3[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m3 = {32'b0, bid_m3[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[3] = bresp_m3;

   assign arvalid_m[3] = arvalid_m_bus[2];
   assign araddr_m3    = araddr_m_bus[ ((2 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(2*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m3 = xdcdr_slv_num_rd_m_bus[ ((2 + 1) * `AXI_LOG2_NSP1) -1:(2*`AXI_LOG2_NSP1)];
   assign arlen_m3     = arlen_m_bus[  ((2 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(2*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m3    = arsize_m_bus[ ((2 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(2*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m3   = arburst_m_bus[((2 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(2*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m3    = arlock_m_bus[ ((2 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(2*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m3   = arcache_m_bus[((2 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(2*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m3    = arprot_m_bus[ ((2 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(2*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m3      = arid_m_bus[ ((2 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[2] = arready_m[3];

   assign awvalid_m[3] = awvalid_m_bus[2];
   assign awaddr_m3    = awaddr_m_bus[ ((2 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(2*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m3 = xdcdr_slv_num_wr_m_bus[ ((2 + 1) * `AXI_LOG2_NSP1) -1:(2*`AXI_LOG2_NSP1)];
   assign awlen_m3     = awlen_m_bus[  ((2 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(2*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m3    = awsize_m_bus[ ((2 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(2*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m3   = awburst_m_bus[((2 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(2*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m3    = awlock_m_bus[ ((2 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(2*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m3   = awcache_m_bus[((2 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(2*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m3    = awprot_m_bus[ ((2 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(2*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m3      = awid_m_bus[ ((2 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[2] = awready_m[3];

   assign rvalid_m_bus[2] = rvalid_m[3];
   assign rlast_m_bus[2] = rlast_m[3];
   assign rdata_m_bus[((2 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m3;
   assign rresp_m_bus[((2 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m3;
   assign rid_m_bus[((2 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m3;
   assign rready_m[3] = rready_m_bus[2];

   assign wvalid_m[3] = wvalid_m_bus[2];
   assign wlast_m[3]  = wlast_m_bus[2];
   assign wdata_m3    = wdata_m_bus[((2 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(2*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m3    = wstrb_m_bus[((2 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(2*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m3      = wid_m_bus[((2 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[2] = wready_m[3];

   assign bvalid_m_bus[2] = bvalid_m[3];
   assign bresp_m_bus[((2 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m3;
   assign bid_m_bus[((2 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m3;
   assign bready_m[3] = bready_m_bus[2];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m3 = {2{awaddr_m_bus[(2*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(2*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m3 = {8{wdata_m_bus[(2*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(2*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m3 = {2{araddr_m_bus[(2*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(2*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M4
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m4;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m4;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m4;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m4;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m4;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m4;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m4;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m4;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m4;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m4;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m4;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m4;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m4;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m4;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m4;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m4;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m4;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m4;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m4;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m4;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m4;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m4;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m4;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m4;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m4;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m4;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m4;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m4;

   assign xdcdr_slv_num_wr_m[4] = xdcdr_slv_num_wr_m4;
   assign xdcdr_slv_num_rd_m[4] = xdcdr_slv_num_rd_m4;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m4;
   assign arsideband_m[4] = arsideband_m4;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m4;
   assign awsideband_m[4] = awsideband_m4;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m4;
   assign rsideband_m[4] = rsideband_m4;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m4;
   assign wsideband_m[4] = wsideband_m4;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m4;
   assign bsideband_m[4] = bsideband_m4;
 `endif

   assign araddr_m[4]  = araddr_m4;
   assign arid_m[4]    = arid_m4;
   assign arlen_m[4]   = arlen_m4;
   assign arsize_m[4]  = arsize_m4;
   assign arburst_m[4] = arburst_m4;
   assign arlock_m[4]  = arlock_m4;
   assign arprot_m[4]  = arprot_m4;
   assign arcache_m[4] = arcache_m4;

   assign awaddr_m[4]  = awaddr_m4;
   assign awid_m[4]    = awid_m4;
   assign awlen_m[4]   = awlen_m4;
   assign awsize_m[4]  = awsize_m4;
   assign awburst_m[4] = awburst_m4;
   assign awlock_m[4]  = awlock_m4;
   assign awprot_m[4]  = awprot_m4;
   assign awcache_m[4] = awcache_m4;

   assign wdata_m[4] = wdata_m4;
   assign wid_m[4]   = wid_m4;
   assign wstrb_m[4] = wstrb_m4;

   assign rdata_m[4] = rdata_m4;
   assign rid_m[4]   = rid_m4;
`ifdef AXI_HAS_ICM4
   assign rid_mon_m4 = {32'b0, rid_m4[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m4 = {32'b0, rid_m4[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[4] = rresp_m4;

`ifdef AXI_HAS_ICM4
   assign bid_mon_m4 = {32'b0, bid_m4[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m4 = {32'b0, bid_m4[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[4] = bresp_m4;

   assign arvalid_m[4] = arvalid_m_bus[3];
   assign araddr_m4    = araddr_m_bus[ ((3 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(3*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m4 = xdcdr_slv_num_rd_m_bus[ ((3 + 1) * `AXI_LOG2_NSP1) -1:(3*`AXI_LOG2_NSP1)];
   assign arlen_m4     = arlen_m_bus[  ((3 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(3*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m4    = arsize_m_bus[ ((3 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(3*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m4   = arburst_m_bus[((3 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(3*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m4    = arlock_m_bus[ ((3 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(3*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m4   = arcache_m_bus[((3 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(3*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m4    = arprot_m_bus[ ((3 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(3*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m4      = arid_m_bus[ ((3 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[3] = arready_m[4];

   assign awvalid_m[4] = awvalid_m_bus[3];
   assign awaddr_m4    = awaddr_m_bus[ ((3 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(3*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m4 = xdcdr_slv_num_wr_m_bus[ ((3 + 1) * `AXI_LOG2_NSP1) -1:(3*`AXI_LOG2_NSP1)];
   assign awlen_m4     = awlen_m_bus[  ((3 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(3*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m4    = awsize_m_bus[ ((3 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(3*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m4   = awburst_m_bus[((3 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(3*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m4    = awlock_m_bus[ ((3 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(3*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m4   = awcache_m_bus[((3 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(3*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m4    = awprot_m_bus[ ((3 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(3*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m4      = awid_m_bus[ ((3 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[3] = awready_m[4];

   assign rvalid_m_bus[3] = rvalid_m[4];
   assign rlast_m_bus[3] = rlast_m[4];
   assign rdata_m_bus[((3 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m4;
   assign rresp_m_bus[((3 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m4;
   assign rid_m_bus[((3 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m4;
   assign rready_m[4] = rready_m_bus[3];

   assign wvalid_m[4] = wvalid_m_bus[3];
   assign wlast_m[4]  = wlast_m_bus[3];
   assign wdata_m4    = wdata_m_bus[((3 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(3*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m4    = wstrb_m_bus[((3 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(3*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m4      = wid_m_bus[((3 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[3] = wready_m[4];

   assign bvalid_m_bus[3] = bvalid_m[4];
   assign bresp_m_bus[((3 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m4;
   assign bid_m_bus[((3 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m4;
   assign bready_m[4] = bready_m_bus[3];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m4 = {2{awaddr_m_bus[(3*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(3*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m4 = {8{wdata_m_bus[(3*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(3*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m4 = {2{araddr_m_bus[(3*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(3*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M5
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m5;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m5;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m5;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m5;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m5;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m5;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m5;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m5;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m5;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m5;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m5;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m5;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m5;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m5;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m5;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m5;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m5;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m5;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m5;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m5;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m5;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m5;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m5;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m5;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m5;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m5;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m5;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m5;

   assign xdcdr_slv_num_wr_m[5] = xdcdr_slv_num_wr_m5;
   assign xdcdr_slv_num_rd_m[5] = xdcdr_slv_num_rd_m5;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m5;
   assign arsideband_m[5] = arsideband_m5;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m5;
   assign awsideband_m[5] = awsideband_m5;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m5;
   assign rsideband_m[5] = rsideband_m5;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m5;
   assign wsideband_m[5] = wsideband_m5;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m5;
   assign bsideband_m[5] = bsideband_m5;
 `endif

   assign araddr_m[5]  = araddr_m5;
   assign arid_m[5]    = arid_m5;
   assign arlen_m[5]   = arlen_m5;
   assign arsize_m[5]  = arsize_m5;
   assign arburst_m[5] = arburst_m5;
   assign arlock_m[5]  = arlock_m5;
   assign arprot_m[5]  = arprot_m5;
   assign arcache_m[5] = arcache_m5;

   assign awaddr_m[5]  = awaddr_m5;
   assign awid_m[5]    = awid_m5;
   assign awlen_m[5]   = awlen_m5;
   assign awsize_m[5]  = awsize_m5;
   assign awburst_m[5] = awburst_m5;
   assign awlock_m[5]  = awlock_m5;
   assign awprot_m[5]  = awprot_m5;
   assign awcache_m[5] = awcache_m5;

   assign wdata_m[5] = wdata_m5;
   assign wid_m[5]   = wid_m5;
   assign wstrb_m[5] = wstrb_m5;

   assign rdata_m[5] = rdata_m5;
   assign rid_m[5]   = rid_m5;
`ifdef AXI_HAS_ICM5
   assign rid_mon_m5 = {32'b0, rid_m5[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m5 = {32'b0, rid_m5[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[5] = rresp_m5;

`ifdef AXI_HAS_ICM5
   assign bid_mon_m5 = {32'b0, bid_m5[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m5 = {32'b0, bid_m5[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[5] = bresp_m5;

   assign arvalid_m[5] = arvalid_m_bus[4];
   assign araddr_m5    = araddr_m_bus[ ((4 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(4*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m5 = xdcdr_slv_num_rd_m_bus[ ((4 + 1) * `AXI_LOG2_NSP1) -1:(4*`AXI_LOG2_NSP1)];
   assign arlen_m5     = arlen_m_bus[  ((4 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(4*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m5    = arsize_m_bus[ ((4 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(4*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m5   = arburst_m_bus[((4 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(4*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m5    = arlock_m_bus[ ((4 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(4*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m5   = arcache_m_bus[((4 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(4*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m5    = arprot_m_bus[ ((4 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(4*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m5      = arid_m_bus[ ((4 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[4] = arready_m[5];

   assign awvalid_m[5] = awvalid_m_bus[4];
   assign awaddr_m5    = awaddr_m_bus[ ((4 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(4*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m5 = xdcdr_slv_num_wr_m_bus[ ((4 + 1) * `AXI_LOG2_NSP1) -1:(4*`AXI_LOG2_NSP1)];
   assign awlen_m5     = awlen_m_bus[  ((4 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(4*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m5    = awsize_m_bus[ ((4 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(4*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m5   = awburst_m_bus[((4 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(4*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m5    = awlock_m_bus[ ((4 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(4*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m5   = awcache_m_bus[((4 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(4*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m5    = awprot_m_bus[ ((4 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(4*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m5      = awid_m_bus[ ((4 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[4] = awready_m[5];

   assign rvalid_m_bus[4] = rvalid_m[5];
   assign rlast_m_bus[4] = rlast_m[5];
   assign rdata_m_bus[((4 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m5;
   assign rresp_m_bus[((4 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m5;
   assign rid_m_bus[((4 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m5;
   assign rready_m[5] = rready_m_bus[4];

   assign wvalid_m[5] = wvalid_m_bus[4];
   assign wlast_m[5]  = wlast_m_bus[4];
   assign wdata_m5    = wdata_m_bus[((4 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(4*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m5    = wstrb_m_bus[((4 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(4*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m5      = wid_m_bus[((4 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[4] = wready_m[5];

   assign bvalid_m_bus[4] = bvalid_m[5];
   assign bresp_m_bus[((4 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m5;
   assign bid_m_bus[((4 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m5;
   assign bready_m[5] = bready_m_bus[4];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m5 = {2{awaddr_m_bus[(4*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(4*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m5 = {8{wdata_m_bus[(4*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(4*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m5 = {2{araddr_m_bus[(4*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(4*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M6
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m6;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m6;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m6;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m6;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m6;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m6;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m6;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m6;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m6;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m6;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m6;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m6;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m6;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m6;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m6;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m6;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m6;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m6;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m6;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m6;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m6;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m6;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m6;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m6;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m6;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m6;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m6;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m6;

   assign xdcdr_slv_num_wr_m[6] = xdcdr_slv_num_wr_m6;
   assign xdcdr_slv_num_rd_m[6] = xdcdr_slv_num_rd_m6;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m6;
   assign arsideband_m[6] = arsideband_m6;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m6;
   assign awsideband_m[6] = awsideband_m6;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m6;
   assign rsideband_m[6] = rsideband_m6;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m6;
   assign wsideband_m[6] = wsideband_m6;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m6;
   assign bsideband_m[6] = bsideband_m6;
 `endif

   assign araddr_m[6]  = araddr_m6;
   assign arid_m[6]    = arid_m6;
   assign arlen_m[6]   = arlen_m6;
   assign arsize_m[6]  = arsize_m6;
   assign arburst_m[6] = arburst_m6;
   assign arlock_m[6]  = arlock_m6;
   assign arprot_m[6]  = arprot_m6;
   assign arcache_m[6] = arcache_m6;

   assign awaddr_m[6]  = awaddr_m6;
   assign awid_m[6]    = awid_m6;
   assign awlen_m[6]   = awlen_m6;
   assign awsize_m[6]  = awsize_m6;
   assign awburst_m[6] = awburst_m6;
   assign awlock_m[6]  = awlock_m6;
   assign awprot_m[6]  = awprot_m6;
   assign awcache_m[6] = awcache_m6;

   assign wdata_m[6] = wdata_m6;
   assign wid_m[6]   = wid_m6;
   assign wstrb_m[6] = wstrb_m6;

   assign rdata_m[6] = rdata_m6;
   assign rid_m[6]   = rid_m6;
`ifdef AXI_HAS_ICM6
   assign rid_mon_m6 = {32'b0, rid_m6[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m6 = {32'b0, rid_m6[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[6] = rresp_m6;

`ifdef AXI_HAS_ICM6
   assign bid_mon_m6 = {32'b0, bid_m6[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m6 = {32'b0, bid_m6[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[6] = bresp_m6;

   assign arvalid_m[6] = arvalid_m_bus[5];
   assign araddr_m6    = araddr_m_bus[ ((5 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(5*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m6 = xdcdr_slv_num_rd_m_bus[ ((5 + 1) * `AXI_LOG2_NSP1) -1:(5*`AXI_LOG2_NSP1)];
   assign arlen_m6     = arlen_m_bus[  ((5 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(5*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m6    = arsize_m_bus[ ((5 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(5*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m6   = arburst_m_bus[((5 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(5*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m6    = arlock_m_bus[ ((5 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(5*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m6   = arcache_m_bus[((5 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(5*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m6    = arprot_m_bus[ ((5 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(5*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m6      = arid_m_bus[ ((5 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[5] = arready_m[6];

   assign awvalid_m[6] = awvalid_m_bus[5];
   assign awaddr_m6    = awaddr_m_bus[ ((5 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(5*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m6 = xdcdr_slv_num_wr_m_bus[ ((5 + 1) * `AXI_LOG2_NSP1) -1:(5*`AXI_LOG2_NSP1)];
   assign awlen_m6     = awlen_m_bus[  ((5 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(5*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m6    = awsize_m_bus[ ((5 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(5*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m6   = awburst_m_bus[((5 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(5*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m6    = awlock_m_bus[ ((5 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(5*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m6   = awcache_m_bus[((5 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(5*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m6    = awprot_m_bus[ ((5 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(5*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m6      = awid_m_bus[ ((5 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[5] = awready_m[6];

   assign rvalid_m_bus[5] = rvalid_m[6];
   assign rlast_m_bus[5] = rlast_m[6];
   assign rdata_m_bus[((5 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m6;
   assign rresp_m_bus[((5 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m6;
   assign rid_m_bus[((5 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m6;
   assign rready_m[6] = rready_m_bus[5];

   assign wvalid_m[6] = wvalid_m_bus[5];
   assign wlast_m[6]  = wlast_m_bus[5];
   assign wdata_m6    = wdata_m_bus[((5 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(5*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m6    = wstrb_m_bus[((5 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(5*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m6      = wid_m_bus[((5 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[5] = wready_m[6];

   assign bvalid_m_bus[5] = bvalid_m[6];
   assign bresp_m_bus[((5 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m6;
   assign bid_m_bus[((5 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m6;
   assign bready_m[6] = bready_m_bus[5];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m6 = {2{awaddr_m_bus[(5*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(5*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m6 = {8{wdata_m_bus[(5*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(5*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m6 = {2{araddr_m_bus[(5*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(5*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M7
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m7;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m7;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m7;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m7;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m7;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m7;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m7;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m7;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m7;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m7;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m7;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m7;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m7;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m7;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m7;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m7;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m7;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m7;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m7;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m7;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m7;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m7;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m7;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m7;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m7;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m7;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m7;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m7;

   assign xdcdr_slv_num_wr_m[7] = xdcdr_slv_num_wr_m7;
   assign xdcdr_slv_num_rd_m[7] = xdcdr_slv_num_rd_m7;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m7;
   assign arsideband_m[7] = arsideband_m7;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m7;
   assign awsideband_m[7] = awsideband_m7;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m7;
   assign rsideband_m[7] = rsideband_m7;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m7;
   assign wsideband_m[7] = wsideband_m7;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m7;
   assign bsideband_m[7] = bsideband_m7;
 `endif

   assign araddr_m[7]  = araddr_m7;
   assign arid_m[7]    = arid_m7;
   assign arlen_m[7]   = arlen_m7;
   assign arsize_m[7]  = arsize_m7;
   assign arburst_m[7] = arburst_m7;
   assign arlock_m[7]  = arlock_m7;
   assign arprot_m[7]  = arprot_m7;
   assign arcache_m[7] = arcache_m7;

   assign awaddr_m[7]  = awaddr_m7;
   assign awid_m[7]    = awid_m7;
   assign awlen_m[7]   = awlen_m7;
   assign awsize_m[7]  = awsize_m7;
   assign awburst_m[7] = awburst_m7;
   assign awlock_m[7]  = awlock_m7;
   assign awprot_m[7]  = awprot_m7;
   assign awcache_m[7] = awcache_m7;

   assign wdata_m[7] = wdata_m7;
   assign wid_m[7]   = wid_m7;
   assign wstrb_m[7] = wstrb_m7;

   assign rdata_m[7] = rdata_m7;
   assign rid_m[7]   = rid_m7;
`ifdef AXI_HAS_ICM7
   assign rid_mon_m7 = {32'b0, rid_m7[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m7 = {32'b0, rid_m7[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[7] = rresp_m7;

`ifdef AXI_HAS_ICM7
   assign bid_mon_m7 = {32'b0, bid_m7[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m7 = {32'b0, bid_m7[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[7] = bresp_m7;

   assign arvalid_m[7] = arvalid_m_bus[6];
   assign araddr_m7    = araddr_m_bus[ ((6 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(6*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m7 = xdcdr_slv_num_rd_m_bus[ ((6 + 1) * `AXI_LOG2_NSP1) -1:(6*`AXI_LOG2_NSP1)];
   assign arlen_m7     = arlen_m_bus[  ((6 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(6*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m7    = arsize_m_bus[ ((6 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(6*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m7   = arburst_m_bus[((6 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(6*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m7    = arlock_m_bus[ ((6 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(6*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m7   = arcache_m_bus[((6 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(6*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m7    = arprot_m_bus[ ((6 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(6*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m7      = arid_m_bus[ ((6 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[6] = arready_m[7];

   assign awvalid_m[7] = awvalid_m_bus[6];
   assign awaddr_m7    = awaddr_m_bus[ ((6 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(6*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m7 = xdcdr_slv_num_wr_m_bus[ ((6 + 1) * `AXI_LOG2_NSP1) -1:(6*`AXI_LOG2_NSP1)];
   assign awlen_m7     = awlen_m_bus[  ((6 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(6*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m7    = awsize_m_bus[ ((6 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(6*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m7   = awburst_m_bus[((6 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(6*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m7    = awlock_m_bus[ ((6 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(6*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m7   = awcache_m_bus[((6 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(6*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m7    = awprot_m_bus[ ((6 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(6*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m7      = awid_m_bus[ ((6 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[6] = awready_m[7];

   assign rvalid_m_bus[6] = rvalid_m[7];
   assign rlast_m_bus[6] = rlast_m[7];
   assign rdata_m_bus[((6 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m7;
   assign rresp_m_bus[((6 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m7;
   assign rid_m_bus[((6 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m7;
   assign rready_m[7] = rready_m_bus[6];

   assign wvalid_m[7] = wvalid_m_bus[6];
   assign wlast_m[7]  = wlast_m_bus[6];
   assign wdata_m7    = wdata_m_bus[((6 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(6*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m7    = wstrb_m_bus[((6 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(6*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m7      = wid_m_bus[((6 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[6] = wready_m[7];

   assign bvalid_m_bus[6] = bvalid_m[7];
   assign bresp_m_bus[((6 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m7;
   assign bid_m_bus[((6 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m7;
   assign bready_m[7] = bready_m_bus[6];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m7 = {2{awaddr_m_bus[(6*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(6*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m7 = {8{wdata_m_bus[(6*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(6*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m7 = {2{araddr_m_bus[(6*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(6*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M8
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m8;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m8;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m8;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m8;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m8;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m8;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m8;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m8;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m8;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m8;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m8;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m8;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m8;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m8;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m8;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m8;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m8;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m8;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m8;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m8;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m8;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m8;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m8;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m8;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m8;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m8;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m8;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m8;

   assign xdcdr_slv_num_wr_m[8] = xdcdr_slv_num_wr_m8;
   assign xdcdr_slv_num_rd_m[8] = xdcdr_slv_num_rd_m8;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m8;
   assign arsideband_m[8] = arsideband_m8;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m8;
   assign awsideband_m[8] = awsideband_m8;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m8;
   assign rsideband_m[8] = rsideband_m8;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m8;
   assign wsideband_m[8] = wsideband_m8;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m8;
   assign bsideband_m[8] = bsideband_m8;
 `endif

   assign araddr_m[8]  = araddr_m8;
   assign arid_m[8]    = arid_m8;
   assign arlen_m[8]   = arlen_m8;
   assign arsize_m[8]  = arsize_m8;
   assign arburst_m[8] = arburst_m8;
   assign arlock_m[8]  = arlock_m8;
   assign arprot_m[8]  = arprot_m8;
   assign arcache_m[8] = arcache_m8;

   assign awaddr_m[8]  = awaddr_m8;
   assign awid_m[8]    = awid_m8;
   assign awlen_m[8]   = awlen_m8;
   assign awsize_m[8]  = awsize_m8;
   assign awburst_m[8] = awburst_m8;
   assign awlock_m[8]  = awlock_m8;
   assign awprot_m[8]  = awprot_m8;
   assign awcache_m[8] = awcache_m8;

   assign wdata_m[8] = wdata_m8;
   assign wid_m[8]   = wid_m8;
   assign wstrb_m[8] = wstrb_m8;

   assign rdata_m[8] = rdata_m8;
   assign rid_m[8]   = rid_m8;
`ifdef AXI_HAS_ICM8
   assign rid_mon_m8 = {32'b0, rid_m8[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m8 = {32'b0, rid_m8[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[8] = rresp_m8;

`ifdef AXI_HAS_ICM8
   assign bid_mon_m8 = {32'b0, bid_m8[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m8 = {32'b0, bid_m8[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[8] = bresp_m8;

   assign arvalid_m[8] = arvalid_m_bus[7];
   assign araddr_m8    = araddr_m_bus[ ((7 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(7*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m8 = xdcdr_slv_num_rd_m_bus[ ((7 + 1) * `AXI_LOG2_NSP1) -1:(7*`AXI_LOG2_NSP1)];
   assign arlen_m8     = arlen_m_bus[  ((7 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(7*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m8    = arsize_m_bus[ ((7 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(7*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m8   = arburst_m_bus[((7 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(7*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m8    = arlock_m_bus[ ((7 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(7*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m8   = arcache_m_bus[((7 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(7*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m8    = arprot_m_bus[ ((7 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(7*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m8      = arid_m_bus[ ((7 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[7] = arready_m[8];

   assign awvalid_m[8] = awvalid_m_bus[7];
   assign awaddr_m8    = awaddr_m_bus[ ((7 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(7*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m8 = xdcdr_slv_num_wr_m_bus[ ((7 + 1) * `AXI_LOG2_NSP1) -1:(7*`AXI_LOG2_NSP1)];
   assign awlen_m8     = awlen_m_bus[  ((7 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(7*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m8    = awsize_m_bus[ ((7 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(7*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m8   = awburst_m_bus[((7 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(7*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m8    = awlock_m_bus[ ((7 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(7*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m8   = awcache_m_bus[((7 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(7*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m8    = awprot_m_bus[ ((7 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(7*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m8      = awid_m_bus[ ((7 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[7] = awready_m[8];

   assign rvalid_m_bus[7] = rvalid_m[8];
   assign rlast_m_bus[7] = rlast_m[8];
   assign rdata_m_bus[((7 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m8;
   assign rresp_m_bus[((7 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m8;
   assign rid_m_bus[((7 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m8;
   assign rready_m[8] = rready_m_bus[7];

   assign wvalid_m[8] = wvalid_m_bus[7];
   assign wlast_m[8]  = wlast_m_bus[7];
   assign wdata_m8    = wdata_m_bus[((7 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(7*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m8    = wstrb_m_bus[((7 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(7*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m8      = wid_m_bus[((7 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[7] = wready_m[8];

   assign bvalid_m_bus[7] = bvalid_m[8];
   assign bresp_m_bus[((7 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m8;
   assign bid_m_bus[((7 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m8;
   assign bready_m[8] = bready_m_bus[7];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m8 = {2{awaddr_m_bus[(7*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(7*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m8 = {8{wdata_m_bus[(7*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(7*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m8 = {2{araddr_m_bus[(7*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(7*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M9
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m9;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m9;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m9;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m9;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m9;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m9;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m9;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m9;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m9;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m9;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m9;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m9;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m9;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m9;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m9;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m9;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m9;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m9;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m9;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m9;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m9;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m9;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m9;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m9;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m9;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m9;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m9;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m9;

   assign xdcdr_slv_num_wr_m[9] = xdcdr_slv_num_wr_m9;
   assign xdcdr_slv_num_rd_m[9] = xdcdr_slv_num_rd_m9;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m9;
   assign arsideband_m[9] = arsideband_m9;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m9;
   assign awsideband_m[9] = awsideband_m9;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m9;
   assign rsideband_m[9] = rsideband_m9;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m9;
   assign wsideband_m[9] = wsideband_m9;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m9;
   assign bsideband_m[9] = bsideband_m9;
 `endif

   assign araddr_m[9]  = araddr_m9;
   assign arid_m[9]    = arid_m9;
   assign arlen_m[9]   = arlen_m9;
   assign arsize_m[9]  = arsize_m9;
   assign arburst_m[9] = arburst_m9;
   assign arlock_m[9]  = arlock_m9;
   assign arprot_m[9]  = arprot_m9;
   assign arcache_m[9] = arcache_m9;

   assign awaddr_m[9]  = awaddr_m9;
   assign awid_m[9]    = awid_m9;
   assign awlen_m[9]   = awlen_m9;
   assign awsize_m[9]  = awsize_m9;
   assign awburst_m[9] = awburst_m9;
   assign awlock_m[9]  = awlock_m9;
   assign awprot_m[9]  = awprot_m9;
   assign awcache_m[9] = awcache_m9;

   assign wdata_m[9] = wdata_m9;
   assign wid_m[9]   = wid_m9;
   assign wstrb_m[9] = wstrb_m9;

   assign rdata_m[9] = rdata_m9;
   assign rid_m[9]   = rid_m9;
`ifdef AXI_HAS_ICM9
   assign rid_mon_m9 = {32'b0, rid_m9[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m9 = {32'b0, rid_m9[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[9] = rresp_m9;

`ifdef AXI_HAS_ICM9
   assign bid_mon_m9 = {32'b0, bid_m9[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m9 = {32'b0, bid_m9[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[9] = bresp_m9;

   assign arvalid_m[9] = arvalid_m_bus[8];
   assign araddr_m9    = araddr_m_bus[ ((8 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(8*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m9 = xdcdr_slv_num_rd_m_bus[ ((8 + 1) * `AXI_LOG2_NSP1) -1:(8*`AXI_LOG2_NSP1)];
   assign arlen_m9     = arlen_m_bus[  ((8 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(8*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m9    = arsize_m_bus[ ((8 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(8*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m9   = arburst_m_bus[((8 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(8*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m9    = arlock_m_bus[ ((8 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(8*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m9   = arcache_m_bus[((8 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(8*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m9    = arprot_m_bus[ ((8 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(8*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m9      = arid_m_bus[ ((8 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[8] = arready_m[9];

   assign awvalid_m[9] = awvalid_m_bus[8];
   assign awaddr_m9    = awaddr_m_bus[ ((8 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(8*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m9 = xdcdr_slv_num_wr_m_bus[ ((8 + 1) * `AXI_LOG2_NSP1) -1:(8*`AXI_LOG2_NSP1)];
   assign awlen_m9     = awlen_m_bus[  ((8 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(8*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m9    = awsize_m_bus[ ((8 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(8*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m9   = awburst_m_bus[((8 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(8*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m9    = awlock_m_bus[ ((8 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(8*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m9   = awcache_m_bus[((8 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(8*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m9    = awprot_m_bus[ ((8 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(8*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m9      = awid_m_bus[ ((8 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[8] = awready_m[9];

   assign rvalid_m_bus[8] = rvalid_m[9];
   assign rlast_m_bus[8] = rlast_m[9];
   assign rdata_m_bus[((8 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m9;
   assign rresp_m_bus[((8 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m9;
   assign rid_m_bus[((8 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m9;
   assign rready_m[9] = rready_m_bus[8];

   assign wvalid_m[9] = wvalid_m_bus[8];
   assign wlast_m[9]  = wlast_m_bus[8];
   assign wdata_m9    = wdata_m_bus[((8 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(8*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m9    = wstrb_m_bus[((8 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(8*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m9      = wid_m_bus[((8 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[8] = wready_m[9];

   assign bvalid_m_bus[8] = bvalid_m[9];
   assign bresp_m_bus[((8 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m9;
   assign bid_m_bus[((8 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m9;
   assign bready_m[9] = bready_m_bus[8];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m9 = {2{awaddr_m_bus[(8*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(8*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m9 = {8{wdata_m_bus[(8*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(8*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m9 = {2{araddr_m_bus[(8*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(8*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M10
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m10;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m10;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m10;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m10;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m10;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m10;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m10;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m10;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m10;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m10;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m10;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m10;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m10;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m10;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m10;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m10;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m10;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m10;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m10;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m10;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m10;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m10;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m10;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m10;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m10;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m10;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m10;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m10;

   assign xdcdr_slv_num_wr_m[10] = xdcdr_slv_num_wr_m10;
   assign xdcdr_slv_num_rd_m[10] = xdcdr_slv_num_rd_m10;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m10;
   assign arsideband_m[10] = arsideband_m10;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m10;
   assign awsideband_m[10] = awsideband_m10;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m10;
   assign rsideband_m[10] = rsideband_m10;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m10;
   assign wsideband_m[10] = wsideband_m10;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m10;
   assign bsideband_m[10] = bsideband_m10;
 `endif

   assign araddr_m[10]  = araddr_m10;
   assign arid_m[10]    = arid_m10;
   assign arlen_m[10]   = arlen_m10;
   assign arsize_m[10]  = arsize_m10;
   assign arburst_m[10] = arburst_m10;
   assign arlock_m[10]  = arlock_m10;
   assign arprot_m[10]  = arprot_m10;
   assign arcache_m[10] = arcache_m10;

   assign awaddr_m[10]  = awaddr_m10;
   assign awid_m[10]    = awid_m10;
   assign awlen_m[10]   = awlen_m10;
   assign awsize_m[10]  = awsize_m10;
   assign awburst_m[10] = awburst_m10;
   assign awlock_m[10]  = awlock_m10;
   assign awprot_m[10]  = awprot_m10;
   assign awcache_m[10] = awcache_m10;

   assign wdata_m[10] = wdata_m10;
   assign wid_m[10]   = wid_m10;
   assign wstrb_m[10] = wstrb_m10;

   assign rdata_m[10] = rdata_m10;
   assign rid_m[10]   = rid_m10;
`ifdef AXI_HAS_ICM10
   assign rid_mon_m10 = {32'b0, rid_m10[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m10 = {32'b0, rid_m10[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[10] = rresp_m10;

`ifdef AXI_HAS_ICM10
   assign bid_mon_m10 = {32'b0, bid_m10[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m10 = {32'b0, bid_m10[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[10] = bresp_m10;

   assign arvalid_m[10] = arvalid_m_bus[9];
   assign araddr_m10    = araddr_m_bus[ ((9 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(9*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m10 = xdcdr_slv_num_rd_m_bus[ ((9 + 1) * `AXI_LOG2_NSP1) -1:(9*`AXI_LOG2_NSP1)];
   assign arlen_m10     = arlen_m_bus[  ((9 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(9*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m10    = arsize_m_bus[ ((9 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(9*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m10   = arburst_m_bus[((9 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(9*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m10    = arlock_m_bus[ ((9 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(9*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m10   = arcache_m_bus[((9 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(9*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m10    = arprot_m_bus[ ((9 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(9*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m10      = arid_m_bus[ ((9 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[9] = arready_m[10];

   assign awvalid_m[10] = awvalid_m_bus[9];
   assign awaddr_m10    = awaddr_m_bus[ ((9 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(9*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m10 = xdcdr_slv_num_wr_m_bus[ ((9 + 1) * `AXI_LOG2_NSP1) -1:(9*`AXI_LOG2_NSP1)];
   assign awlen_m10     = awlen_m_bus[  ((9 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(9*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m10    = awsize_m_bus[ ((9 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(9*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m10   = awburst_m_bus[((9 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(9*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m10    = awlock_m_bus[ ((9 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(9*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m10   = awcache_m_bus[((9 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(9*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m10    = awprot_m_bus[ ((9 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(9*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m10      = awid_m_bus[ ((9 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[9] = awready_m[10];

   assign rvalid_m_bus[9] = rvalid_m[10];
   assign rlast_m_bus[9] = rlast_m[10];
   assign rdata_m_bus[((9 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m10;
   assign rresp_m_bus[((9 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m10;
   assign rid_m_bus[((9 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m10;
   assign rready_m[10] = rready_m_bus[9];

   assign wvalid_m[10] = wvalid_m_bus[9];
   assign wlast_m[10]  = wlast_m_bus[9];
   assign wdata_m10    = wdata_m_bus[((9 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(9*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m10    = wstrb_m_bus[((9 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(9*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m10      = wid_m_bus[((9 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[9] = wready_m[10];

   assign bvalid_m_bus[9] = bvalid_m[10];
   assign bresp_m_bus[((9 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m10;
   assign bid_m_bus[((9 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m10;
   assign bready_m[10] = bready_m_bus[9];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m10 = {2{awaddr_m_bus[(9*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(9*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m10 = {8{wdata_m_bus[(9*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(9*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m10 = {2{araddr_m_bus[(9*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(9*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M11
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m11;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m11;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m11;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m11;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m11;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m11;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m11;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m11;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m11;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m11;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m11;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m11;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m11;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m11;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m11;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m11;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m11;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m11;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m11;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m11;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m11;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m11;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m11;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m11;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m11;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m11;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m11;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m11;

   assign xdcdr_slv_num_wr_m[11] = xdcdr_slv_num_wr_m11;
   assign xdcdr_slv_num_rd_m[11] = xdcdr_slv_num_rd_m11;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m11;
   assign arsideband_m[11] = arsideband_m11;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m11;
   assign awsideband_m[11] = awsideband_m11;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m11;
   assign rsideband_m[11] = rsideband_m11;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m11;
   assign wsideband_m[11] = wsideband_m11;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m11;
   assign bsideband_m[11] = bsideband_m11;
 `endif

   assign araddr_m[11]  = araddr_m11;
   assign arid_m[11]    = arid_m11;
   assign arlen_m[11]   = arlen_m11;
   assign arsize_m[11]  = arsize_m11;
   assign arburst_m[11] = arburst_m11;
   assign arlock_m[11]  = arlock_m11;
   assign arprot_m[11]  = arprot_m11;
   assign arcache_m[11] = arcache_m11;

   assign awaddr_m[11]  = awaddr_m11;
   assign awid_m[11]    = awid_m11;
   assign awlen_m[11]   = awlen_m11;
   assign awsize_m[11]  = awsize_m11;
   assign awburst_m[11] = awburst_m11;
   assign awlock_m[11]  = awlock_m11;
   assign awprot_m[11]  = awprot_m11;
   assign awcache_m[11] = awcache_m11;

   assign wdata_m[11] = wdata_m11;
   assign wid_m[11]   = wid_m11;
   assign wstrb_m[11] = wstrb_m11;

   assign rdata_m[11] = rdata_m11;
   assign rid_m[11]   = rid_m11;
`ifdef AXI_HAS_ICM11
   assign rid_mon_m11 = {32'b0, rid_m11[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m11 = {32'b0, rid_m11[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[11] = rresp_m11;

`ifdef AXI_HAS_ICM11
   assign bid_mon_m11 = {32'b0, bid_m11[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m11 = {32'b0, bid_m11[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[11] = bresp_m11;

   assign arvalid_m[11] = arvalid_m_bus[10];
   assign araddr_m11    = araddr_m_bus[ ((10 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(10*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m11 = xdcdr_slv_num_rd_m_bus[ ((10 + 1) * `AXI_LOG2_NSP1) -1:(10*`AXI_LOG2_NSP1)];
   assign arlen_m11     = arlen_m_bus[  ((10 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(10*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m11    = arsize_m_bus[ ((10 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(10*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m11   = arburst_m_bus[((10 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(10*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m11    = arlock_m_bus[ ((10 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(10*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m11   = arcache_m_bus[((10 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(10*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m11    = arprot_m_bus[ ((10 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(10*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m11      = arid_m_bus[ ((10 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[10] = arready_m[11];

   assign awvalid_m[11] = awvalid_m_bus[10];
   assign awaddr_m11    = awaddr_m_bus[ ((10 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(10*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m11 = xdcdr_slv_num_wr_m_bus[ ((10 + 1) * `AXI_LOG2_NSP1) -1:(10*`AXI_LOG2_NSP1)];
   assign awlen_m11     = awlen_m_bus[  ((10 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(10*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m11    = awsize_m_bus[ ((10 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(10*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m11   = awburst_m_bus[((10 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(10*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m11    = awlock_m_bus[ ((10 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(10*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m11   = awcache_m_bus[((10 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(10*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m11    = awprot_m_bus[ ((10 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(10*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m11      = awid_m_bus[ ((10 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[10] = awready_m[11];

   assign rvalid_m_bus[10] = rvalid_m[11];
   assign rlast_m_bus[10] = rlast_m[11];
   assign rdata_m_bus[((10 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m11;
   assign rresp_m_bus[((10 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m11;
   assign rid_m_bus[((10 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m11;
   assign rready_m[11] = rready_m_bus[10];

   assign wvalid_m[11] = wvalid_m_bus[10];
   assign wlast_m[11]  = wlast_m_bus[10];
   assign wdata_m11    = wdata_m_bus[((10 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(10*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m11    = wstrb_m_bus[((10 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(10*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m11      = wid_m_bus[((10 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[10] = wready_m[11];

   assign bvalid_m_bus[10] = bvalid_m[11];
   assign bresp_m_bus[((10 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m11;
   assign bid_m_bus[((10 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m11;
   assign bready_m[11] = bready_m_bus[10];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m11 = {2{awaddr_m_bus[(10*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(10*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m11 = {8{wdata_m_bus[(10*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(10*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m11 = {2{araddr_m_bus[(10*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(10*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M12
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m12;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m12;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m12;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m12;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m12;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m12;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m12;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m12;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m12;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m12;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m12;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m12;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m12;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m12;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m12;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m12;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m12;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m12;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m12;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m12;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m12;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m12;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m12;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m12;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m12;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m12;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m12;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m12;

   assign xdcdr_slv_num_wr_m[12] = xdcdr_slv_num_wr_m12;
   assign xdcdr_slv_num_rd_m[12] = xdcdr_slv_num_rd_m12;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m12;
   assign arsideband_m[12] = arsideband_m12;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m12;
   assign awsideband_m[12] = awsideband_m12;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m12;
   assign rsideband_m[12] = rsideband_m12;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m12;
   assign wsideband_m[12] = wsideband_m12;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m12;
   assign bsideband_m[12] = bsideband_m12;
 `endif

   assign araddr_m[12]  = araddr_m12;
   assign arid_m[12]    = arid_m12;
   assign arlen_m[12]   = arlen_m12;
   assign arsize_m[12]  = arsize_m12;
   assign arburst_m[12] = arburst_m12;
   assign arlock_m[12]  = arlock_m12;
   assign arprot_m[12]  = arprot_m12;
   assign arcache_m[12] = arcache_m12;

   assign awaddr_m[12]  = awaddr_m12;
   assign awid_m[12]    = awid_m12;
   assign awlen_m[12]   = awlen_m12;
   assign awsize_m[12]  = awsize_m12;
   assign awburst_m[12] = awburst_m12;
   assign awlock_m[12]  = awlock_m12;
   assign awprot_m[12]  = awprot_m12;
   assign awcache_m[12] = awcache_m12;

   assign wdata_m[12] = wdata_m12;
   assign wid_m[12]   = wid_m12;
   assign wstrb_m[12] = wstrb_m12;

   assign rdata_m[12] = rdata_m12;
   assign rid_m[12]   = rid_m12;
`ifdef AXI_HAS_ICM12
   assign rid_mon_m12 = {32'b0, rid_m12[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m12 = {32'b0, rid_m12[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[12] = rresp_m12;

`ifdef AXI_HAS_ICM12
   assign bid_mon_m12 = {32'b0, bid_m12[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m12 = {32'b0, bid_m12[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[12] = bresp_m12;

   assign arvalid_m[12] = arvalid_m_bus[11];
   assign araddr_m12    = araddr_m_bus[ ((11 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(11*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m12 = xdcdr_slv_num_rd_m_bus[ ((11 + 1) * `AXI_LOG2_NSP1) -1:(11*`AXI_LOG2_NSP1)];
   assign arlen_m12     = arlen_m_bus[  ((11 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(11*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m12    = arsize_m_bus[ ((11 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(11*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m12   = arburst_m_bus[((11 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(11*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m12    = arlock_m_bus[ ((11 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(11*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m12   = arcache_m_bus[((11 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(11*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m12    = arprot_m_bus[ ((11 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(11*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m12      = arid_m_bus[ ((11 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[11] = arready_m[12];

   assign awvalid_m[12] = awvalid_m_bus[11];
   assign awaddr_m12    = awaddr_m_bus[ ((11 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(11*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m12 = xdcdr_slv_num_wr_m_bus[ ((11 + 1) * `AXI_LOG2_NSP1) -1:(11*`AXI_LOG2_NSP1)];
   assign awlen_m12     = awlen_m_bus[  ((11 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(11*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m12    = awsize_m_bus[ ((11 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(11*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m12   = awburst_m_bus[((11 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(11*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m12    = awlock_m_bus[ ((11 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(11*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m12   = awcache_m_bus[((11 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(11*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m12    = awprot_m_bus[ ((11 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(11*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m12      = awid_m_bus[ ((11 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[11] = awready_m[12];

   assign rvalid_m_bus[11] = rvalid_m[12];
   assign rlast_m_bus[11] = rlast_m[12];
   assign rdata_m_bus[((11 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m12;
   assign rresp_m_bus[((11 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m12;
   assign rid_m_bus[((11 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m12;
   assign rready_m[12] = rready_m_bus[11];

   assign wvalid_m[12] = wvalid_m_bus[11];
   assign wlast_m[12]  = wlast_m_bus[11];
   assign wdata_m12    = wdata_m_bus[((11 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(11*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m12    = wstrb_m_bus[((11 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(11*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m12      = wid_m_bus[((11 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[11] = wready_m[12];

   assign bvalid_m_bus[11] = bvalid_m[12];
   assign bresp_m_bus[((11 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m12;
   assign bid_m_bus[((11 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m12;
   assign bready_m[12] = bready_m_bus[11];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m12 = {2{awaddr_m_bus[(11*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(11*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m12 = {8{wdata_m_bus[(11*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(11*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m12 = {2{araddr_m_bus[(11*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(11*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M13
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m13;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m13;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m13;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m13;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m13;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m13;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m13;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m13;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m13;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m13;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m13;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m13;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m13;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m13;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m13;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m13;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m13;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m13;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m13;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m13;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m13;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m13;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m13;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m13;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m13;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m13;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m13;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m13;

   assign xdcdr_slv_num_wr_m[13] = xdcdr_slv_num_wr_m13;
   assign xdcdr_slv_num_rd_m[13] = xdcdr_slv_num_rd_m13;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m13;
   assign arsideband_m[13] = arsideband_m13;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m13;
   assign awsideband_m[13] = awsideband_m13;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m13;
   assign rsideband_m[13] = rsideband_m13;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m13;
   assign wsideband_m[13] = wsideband_m13;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m13;
   assign bsideband_m[13] = bsideband_m13;
 `endif

   assign araddr_m[13]  = araddr_m13;
   assign arid_m[13]    = arid_m13;
   assign arlen_m[13]   = arlen_m13;
   assign arsize_m[13]  = arsize_m13;
   assign arburst_m[13] = arburst_m13;
   assign arlock_m[13]  = arlock_m13;
   assign arprot_m[13]  = arprot_m13;
   assign arcache_m[13] = arcache_m13;

   assign awaddr_m[13]  = awaddr_m13;
   assign awid_m[13]    = awid_m13;
   assign awlen_m[13]   = awlen_m13;
   assign awsize_m[13]  = awsize_m13;
   assign awburst_m[13] = awburst_m13;
   assign awlock_m[13]  = awlock_m13;
   assign awprot_m[13]  = awprot_m13;
   assign awcache_m[13] = awcache_m13;

   assign wdata_m[13] = wdata_m13;
   assign wid_m[13]   = wid_m13;
   assign wstrb_m[13] = wstrb_m13;

   assign rdata_m[13] = rdata_m13;
   assign rid_m[13]   = rid_m13;
`ifdef AXI_HAS_ICM13
   assign rid_mon_m13 = {32'b0, rid_m13[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m13 = {32'b0, rid_m13[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[13] = rresp_m13;

`ifdef AXI_HAS_ICM13
   assign bid_mon_m13 = {32'b0, bid_m13[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m13 = {32'b0, bid_m13[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[13] = bresp_m13;

   assign arvalid_m[13] = arvalid_m_bus[12];
   assign araddr_m13    = araddr_m_bus[ ((12 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(12*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m13 = xdcdr_slv_num_rd_m_bus[ ((12 + 1) * `AXI_LOG2_NSP1) -1:(12*`AXI_LOG2_NSP1)];
   assign arlen_m13     = arlen_m_bus[  ((12 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(12*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m13    = arsize_m_bus[ ((12 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(12*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m13   = arburst_m_bus[((12 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(12*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m13    = arlock_m_bus[ ((12 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(12*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m13   = arcache_m_bus[((12 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(12*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m13    = arprot_m_bus[ ((12 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(12*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m13      = arid_m_bus[ ((12 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[12] = arready_m[13];

   assign awvalid_m[13] = awvalid_m_bus[12];
   assign awaddr_m13    = awaddr_m_bus[ ((12 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(12*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m13 = xdcdr_slv_num_wr_m_bus[ ((12 + 1) * `AXI_LOG2_NSP1) -1:(12*`AXI_LOG2_NSP1)];
   assign awlen_m13     = awlen_m_bus[  ((12 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(12*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m13    = awsize_m_bus[ ((12 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(12*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m13   = awburst_m_bus[((12 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(12*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m13    = awlock_m_bus[ ((12 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(12*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m13   = awcache_m_bus[((12 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(12*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m13    = awprot_m_bus[ ((12 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(12*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m13      = awid_m_bus[ ((12 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[12] = awready_m[13];

   assign rvalid_m_bus[12] = rvalid_m[13];
   assign rlast_m_bus[12] = rlast_m[13];
   assign rdata_m_bus[((12 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m13;
   assign rresp_m_bus[((12 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m13;
   assign rid_m_bus[((12 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m13;
   assign rready_m[13] = rready_m_bus[12];

   assign wvalid_m[13] = wvalid_m_bus[12];
   assign wlast_m[13]  = wlast_m_bus[12];
   assign wdata_m13    = wdata_m_bus[((12 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(12*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m13    = wstrb_m_bus[((12 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(12*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m13      = wid_m_bus[((12 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[12] = wready_m[13];

   assign bvalid_m_bus[12] = bvalid_m[13];
   assign bresp_m_bus[((12 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m13;
   assign bid_m_bus[((12 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m13;
   assign bready_m[13] = bready_m_bus[12];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m13 = {2{awaddr_m_bus[(12*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(12*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m13 = {8{wdata_m_bus[(12*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(12*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m13 = {2{araddr_m_bus[(12*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(12*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M14
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m14;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m14;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m14;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m14;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m14;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m14;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m14;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m14;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m14;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m14;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m14;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m14;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m14;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m14;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m14;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m14;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m14;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m14;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m14;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m14;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m14;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m14;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m14;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m14;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m14;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m14;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m14;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m14;

   assign xdcdr_slv_num_wr_m[14] = xdcdr_slv_num_wr_m14;
   assign xdcdr_slv_num_rd_m[14] = xdcdr_slv_num_rd_m14;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m14;
   assign arsideband_m[14] = arsideband_m14;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m14;
   assign awsideband_m[14] = awsideband_m14;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m14;
   assign rsideband_m[14] = rsideband_m14;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m14;
   assign wsideband_m[14] = wsideband_m14;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m14;
   assign bsideband_m[14] = bsideband_m14;
 `endif

   assign araddr_m[14]  = araddr_m14;
   assign arid_m[14]    = arid_m14;
   assign arlen_m[14]   = arlen_m14;
   assign arsize_m[14]  = arsize_m14;
   assign arburst_m[14] = arburst_m14;
   assign arlock_m[14]  = arlock_m14;
   assign arprot_m[14]  = arprot_m14;
   assign arcache_m[14] = arcache_m14;

   assign awaddr_m[14]  = awaddr_m14;
   assign awid_m[14]    = awid_m14;
   assign awlen_m[14]   = awlen_m14;
   assign awsize_m[14]  = awsize_m14;
   assign awburst_m[14] = awburst_m14;
   assign awlock_m[14]  = awlock_m14;
   assign awprot_m[14]  = awprot_m14;
   assign awcache_m[14] = awcache_m14;

   assign wdata_m[14] = wdata_m14;
   assign wid_m[14]   = wid_m14;
   assign wstrb_m[14] = wstrb_m14;

   assign rdata_m[14] = rdata_m14;
   assign rid_m[14]   = rid_m14;
`ifdef AXI_HAS_ICM14
   assign rid_mon_m14 = {32'b0, rid_m14[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m14 = {32'b0, rid_m14[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[14] = rresp_m14;

`ifdef AXI_HAS_ICM14
   assign bid_mon_m14 = {32'b0, bid_m14[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m14 = {32'b0, bid_m14[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[14] = bresp_m14;

   assign arvalid_m[14] = arvalid_m_bus[13];
   assign araddr_m14    = araddr_m_bus[ ((13 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(13*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m14 = xdcdr_slv_num_rd_m_bus[ ((13 + 1) * `AXI_LOG2_NSP1) -1:(13*`AXI_LOG2_NSP1)];
   assign arlen_m14     = arlen_m_bus[  ((13 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(13*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m14    = arsize_m_bus[ ((13 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(13*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m14   = arburst_m_bus[((13 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(13*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m14    = arlock_m_bus[ ((13 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(13*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m14   = arcache_m_bus[((13 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(13*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m14    = arprot_m_bus[ ((13 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(13*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m14      = arid_m_bus[ ((13 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[13] = arready_m[14];

   assign awvalid_m[14] = awvalid_m_bus[13];
   assign awaddr_m14    = awaddr_m_bus[ ((13 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(13*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m14 = xdcdr_slv_num_wr_m_bus[ ((13 + 1) * `AXI_LOG2_NSP1) -1:(13*`AXI_LOG2_NSP1)];
   assign awlen_m14     = awlen_m_bus[  ((13 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(13*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m14    = awsize_m_bus[ ((13 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(13*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m14   = awburst_m_bus[((13 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(13*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m14    = awlock_m_bus[ ((13 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(13*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m14   = awcache_m_bus[((13 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(13*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m14    = awprot_m_bus[ ((13 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(13*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m14      = awid_m_bus[ ((13 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[13] = awready_m[14];

   assign rvalid_m_bus[13] = rvalid_m[14];
   assign rlast_m_bus[13] = rlast_m[14];
   assign rdata_m_bus[((13 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m14;
   assign rresp_m_bus[((13 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m14;
   assign rid_m_bus[((13 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m14;
   assign rready_m[14] = rready_m_bus[13];

   assign wvalid_m[14] = wvalid_m_bus[13];
   assign wlast_m[14]  = wlast_m_bus[13];
   assign wdata_m14    = wdata_m_bus[((13 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(13*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m14    = wstrb_m_bus[((13 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(13*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m14      = wid_m_bus[((13 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[13] = wready_m[14];

   assign bvalid_m_bus[13] = bvalid_m[14];
   assign bresp_m_bus[((13 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m14;
   assign bid_m_bus[((13 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m14;
   assign bready_m[14] = bready_m_bus[13];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m14 = {2{awaddr_m_bus[(13*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(13*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m14 = {8{wdata_m_bus[(13*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(13*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m14 = {2{araddr_m_bus[(13*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(13*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M15
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m15;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m15;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m15;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m15;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m15;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m15;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m15;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m15;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m15;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m15;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m15;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m15;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m15;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m15;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m15;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m15;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m15;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m15;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m15;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m15;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m15;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m15;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m15;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m15;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m15;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m15;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m15;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m15;

   assign xdcdr_slv_num_wr_m[15] = xdcdr_slv_num_wr_m15;
   assign xdcdr_slv_num_rd_m[15] = xdcdr_slv_num_rd_m15;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m15;
   assign arsideband_m[15] = arsideband_m15;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m15;
   assign awsideband_m[15] = awsideband_m15;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m15;
   assign rsideband_m[15] = rsideband_m15;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m15;
   assign wsideband_m[15] = wsideband_m15;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m15;
   assign bsideband_m[15] = bsideband_m15;
 `endif

   assign araddr_m[15]  = araddr_m15;
   assign arid_m[15]    = arid_m15;
   assign arlen_m[15]   = arlen_m15;
   assign arsize_m[15]  = arsize_m15;
   assign arburst_m[15] = arburst_m15;
   assign arlock_m[15]  = arlock_m15;
   assign arprot_m[15]  = arprot_m15;
   assign arcache_m[15] = arcache_m15;

   assign awaddr_m[15]  = awaddr_m15;
   assign awid_m[15]    = awid_m15;
   assign awlen_m[15]   = awlen_m15;
   assign awsize_m[15]  = awsize_m15;
   assign awburst_m[15] = awburst_m15;
   assign awlock_m[15]  = awlock_m15;
   assign awprot_m[15]  = awprot_m15;
   assign awcache_m[15] = awcache_m15;

   assign wdata_m[15] = wdata_m15;
   assign wid_m[15]   = wid_m15;
   assign wstrb_m[15] = wstrb_m15;

   assign rdata_m[15] = rdata_m15;
   assign rid_m[15]   = rid_m15;
`ifdef AXI_HAS_ICM15
   assign rid_mon_m15 = {32'b0, rid_m15[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m15 = {32'b0, rid_m15[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[15] = rresp_m15;

`ifdef AXI_HAS_ICM15
   assign bid_mon_m15 = {32'b0, bid_m15[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m15 = {32'b0, bid_m15[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[15] = bresp_m15;

   assign arvalid_m[15] = arvalid_m_bus[14];
   assign araddr_m15    = araddr_m_bus[ ((14 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(14*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m15 = xdcdr_slv_num_rd_m_bus[ ((14 + 1) * `AXI_LOG2_NSP1) -1:(14*`AXI_LOG2_NSP1)];
   assign arlen_m15     = arlen_m_bus[  ((14 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(14*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m15    = arsize_m_bus[ ((14 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(14*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m15   = arburst_m_bus[((14 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(14*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m15    = arlock_m_bus[ ((14 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(14*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m15   = arcache_m_bus[((14 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(14*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m15    = arprot_m_bus[ ((14 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(14*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m15      = arid_m_bus[ ((14 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[14] = arready_m[15];

   assign awvalid_m[15] = awvalid_m_bus[14];
   assign awaddr_m15    = awaddr_m_bus[ ((14 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(14*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m15 = xdcdr_slv_num_wr_m_bus[ ((14 + 1) * `AXI_LOG2_NSP1) -1:(14*`AXI_LOG2_NSP1)];
   assign awlen_m15     = awlen_m_bus[  ((14 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(14*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m15    = awsize_m_bus[ ((14 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(14*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m15   = awburst_m_bus[((14 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(14*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m15    = awlock_m_bus[ ((14 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(14*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m15   = awcache_m_bus[((14 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(14*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m15    = awprot_m_bus[ ((14 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(14*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m15      = awid_m_bus[ ((14 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[14] = awready_m[15];

   assign rvalid_m_bus[14] = rvalid_m[15];
   assign rlast_m_bus[14] = rlast_m[15];
   assign rdata_m_bus[((14 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m15;
   assign rresp_m_bus[((14 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m15;
   assign rid_m_bus[((14 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m15;
   assign rready_m[15] = rready_m_bus[14];

   assign wvalid_m[15] = wvalid_m_bus[14];
   assign wlast_m[15]  = wlast_m_bus[14];
   assign wdata_m15    = wdata_m_bus[((14 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(14*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m15    = wstrb_m_bus[((14 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(14*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m15      = wid_m_bus[((14 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[14] = wready_m[15];

   assign bvalid_m_bus[14] = bvalid_m[15];
   assign bresp_m_bus[((14 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m15;
   assign bid_m_bus[((14 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m15;
   assign bready_m[15] = bready_m_bus[14];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m15 = {2{awaddr_m_bus[(14*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(14*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m15 = {8{wdata_m_bus[(14*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(14*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m15 = {2{araddr_m_bus[(14*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(14*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_M16
   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_m16;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_m16;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_m16;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_m16;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_m16;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_m16;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_m16;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_m16;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_m16;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_m16;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_m16;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_m16;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_m16;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_m16;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_m16;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_m16;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_m16;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_m16;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_m16;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_m16;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_m16;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_mon_m16;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_m16;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_m16;
   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_mon_m16;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_m16;

   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_wr_m16;
   wire [`AXI_LOG2_NSP1-1:0]                    xdcdr_slv_num_rd_m16;

   assign xdcdr_slv_num_wr_m[16] = xdcdr_slv_num_wr_m16;
   assign xdcdr_slv_num_rd_m[16] = xdcdr_slv_num_rd_m16;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_m16;
   assign arsideband_m[16] = arsideband_m16;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_m16;
   assign awsideband_m[16] = awsideband_m16;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_m16;
   assign rsideband_m[16] = rsideband_m16;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_m16;
   assign wsideband_m[16] = wsideband_m16;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_m16;
   assign bsideband_m[16] = bsideband_m16;
 `endif

   assign araddr_m[16]  = araddr_m16;
   assign arid_m[16]    = arid_m16;
   assign arlen_m[16]   = arlen_m16;
   assign arsize_m[16]  = arsize_m16;
   assign arburst_m[16] = arburst_m16;
   assign arlock_m[16]  = arlock_m16;
   assign arprot_m[16]  = arprot_m16;
   assign arcache_m[16] = arcache_m16;

   assign awaddr_m[16]  = awaddr_m16;
   assign awid_m[16]    = awid_m16;
   assign awlen_m[16]   = awlen_m16;
   assign awsize_m[16]  = awsize_m16;
   assign awburst_m[16] = awburst_m16;
   assign awlock_m[16]  = awlock_m16;
   assign awprot_m[16]  = awprot_m16;
   assign awcache_m[16] = awcache_m16;

   assign wdata_m[16] = wdata_m16;
   assign wid_m[16]   = wid_m16;
   assign wstrb_m[16] = wstrb_m16;

   assign rdata_m[16] = rdata_m16;
   assign rid_m[16]   = rid_m16;
`ifdef AXI_HAS_ICM16
   assign rid_mon_m16 = {32'b0, rid_m16[`AXI_SIDW-1:0]};
`else
   assign rid_mon_m16 = {32'b0, rid_m16[`AXI_MIDW-1:0]};
`endif
   assign rresp_m[16] = rresp_m16;

`ifdef AXI_HAS_ICM16
   assign bid_mon_m16 = {32'b0, bid_m16[`AXI_SIDW-1:0]};
`else
   assign bid_mon_m16 = {32'b0, bid_m16[`AXI_MIDW-1:0]};
`endif
   assign bresp_m[16] = bresp_m16;

   assign arvalid_m[16] = arvalid_m_bus[15];
   assign araddr_m16    = araddr_m_bus[ ((15 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(15*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_rd_m16 = xdcdr_slv_num_rd_m_bus[ ((15 + 1) * `AXI_LOG2_NSP1) -1:(15*`AXI_LOG2_NSP1)];
   assign arlen_m16     = arlen_m_bus[  ((15 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(15*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )];
   assign arsize_m16    = arsize_m_bus[ ((15 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(15*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )];
   assign arburst_m16   = arburst_m_bus[((15 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(15*`DW_VIP_AXI_ARBURST_PORT_WIDTH )];
   assign arlock_m16    = arlock_m_bus[ ((15 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(15*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )];
   assign arcache_m16   = arcache_m_bus[((15 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(15*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )];
   assign arprot_m16    = arprot_m_bus[ ((15 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(15*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )];
   assign arid_m16      = arid_m_bus[ ((15 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_ARID_PORT_WIDTH)];
   assign arready_m_bus[15] = arready_m[16];

   assign awvalid_m[16] = awvalid_m_bus[15];
   assign awaddr_m16    = awaddr_m_bus[ ((15 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(15*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )];
   assign xdcdr_slv_num_wr_m16 = xdcdr_slv_num_wr_m_bus[ ((15 + 1) * `AXI_LOG2_NSP1) -1:(15*`AXI_LOG2_NSP1)];
   assign awlen_m16     = awlen_m_bus[  ((15 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(15*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )];
   assign awsize_m16    = awsize_m_bus[ ((15 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(15*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )];
   assign awburst_m16   = awburst_m_bus[((15 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(15*`DW_VIP_AXI_AWBURST_PORT_WIDTH )];
   assign awlock_m16    = awlock_m_bus[ ((15 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(15*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )];
   assign awcache_m16   = awcache_m_bus[((15 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(15*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )];
   assign awprot_m16    = awprot_m_bus[ ((15 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(15*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )];
   assign awid_m16      = awid_m_bus[ ((15 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_AWID_PORT_WIDTH)];
   assign awready_m_bus[15] = awready_m[16];

   assign rvalid_m_bus[15] = rvalid_m[16];
   assign rlast_m_bus[15] = rlast_m[16];
   assign rdata_m_bus[((15 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RDATA_PORT_WIDTH)] = rdata_m16;
   assign rresp_m_bus[((15 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = rresp_m16;
   assign rid_m_bus[((15 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RID_PORT_WIDTH)] = rid_m16;
   assign rready_m[16] = rready_m_bus[15];

   assign wvalid_m[16] = wvalid_m_bus[15];
   assign wlast_m[16]  = wlast_m_bus[15];
   assign wdata_m16    = wdata_m_bus[((15 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(15*`DW_VIP_AXI_WDATA_PORT_WIDTH)];
   assign wstrb_m16    = wstrb_m_bus[((15 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(15*`DW_VIP_AXI_WSTRB_PORT_WIDTH)];
   assign wid_m16      = wid_m_bus[((15 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign wready_m_bus[15] = wready_m[16];

   assign bvalid_m_bus[15] = bvalid_m[16];
   assign bresp_m_bus[((15 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RRESP_PORT_WIDTH)] = bresp_m16;
   assign bid_m_bus[((15 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RID_PORT_WIDTH)] = bid_m16;
   assign bready_m[16] = bready_m_bus[15];
 `ifdef AXI_HAS_AWSB
   assign awsideband_m16 = {2{awaddr_m_bus[(15*`DW_VIP_AXI_AWADDR_PORT_WIDTH) + `AXI_AW-1:(15*`DW_VIP_AXI_AWADDR_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_WSB
   assign wsideband_m16 = {8{wdata_m_bus[(15*`DW_VIP_AXI_WDATA_PORT_WIDTH) + `AXI_DW-1:(15*`DW_VIP_AXI_WDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_ARSB
   assign arsideband_m16 = {2{araddr_m_bus[(15*`DW_VIP_AXI_ARADDR_PORT_WIDTH) + `AXI_AW-1:(15*`DW_VIP_AXI_ARADDR_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S1

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s1;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s1;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s1;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s1;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s1;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s1;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s1;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s1;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s1;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s1;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s1;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s1;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s1;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s1;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s1;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s1;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s1;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s1;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s1;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s1;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s1;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s1;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s1;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s1;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s1;
   assign arsideband_s[1] = arsideband_s1;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s1;
   assign awsideband_s[1] = awsideband_s1;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s1;
   assign rsideband_s[1] = rsideband_s1;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s1;
   assign wsideband_s[1] = wsideband_s1;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s1;
   assign bsideband_s[1] = bsideband_s1;
 `endif

   assign araddr_s[1]  = araddr_s1;
   assign arid_s[1]    = arid_s1;
   assign arlen_s[1]   = arlen_s1;
   assign arsize_s[1]  = arsize_s1;
   assign arburst_s[1] = arburst_s1;
   assign arlock_s[1]  = arlock_s1;
   assign arprot_s[1]  = arprot_s1;
   assign arcache_s[1] = arcache_s1;

   assign awaddr_s[1]  = awaddr_s1;
   assign awid_s[1]    = awid_s1;
   assign awlen_s[1]   = awlen_s1;
   assign awsize_s[1]  = awsize_s1;
   assign awburst_s[1] = awburst_s1;
   assign awlock_s[1]  = awlock_s1;
   assign awprot_s[1]  = awprot_s1;
   assign awcache_s[1] = awcache_s1;

   assign wdata_s[1] = wdata_s1;
   assign wid_s[1]   = wid_s1;
   assign wstrb_s[1] = wstrb_s1;

   assign rdata_s[1] = rdata_s1;
   assign rid_s[1]   = rid_s1;
   assign rresp_s[1] = rresp_s1;

   assign bid_s[1]   = bid_s1;
   assign bresp_s[1] = bresp_s1;

   assign arvalid_s_bus[0] = arvalid_s[1];
   assign araddr_s_bus[ ((0 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(0*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s1;
   assign arlen_s_bus[  ((0 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(0*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s1;
   assign arsize_s_bus[ ((0 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(0*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s1;
   assign arburst_s_bus[((0 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(0*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s1;
   assign arlock_s_bus[ ((0 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(0*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s1;
   assign arcache_s_bus[((0 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(0*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s1;
   assign arprot_s_bus[ ((0 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(0*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s1;
   assign arid_s_bus[ ((0 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s1;
   assign arready_s[1] = arready_s_bus[0];

   assign awvalid_s_bus[0] = awvalid_s[1];
   assign awaddr_s_bus[ ((0 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(0*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s1;
   assign awlen_s_bus[  ((0 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(0*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s1;
   assign awsize_s_bus[ ((0 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(0*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s1;
   assign awburst_s_bus[((0 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(0*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s1;
   assign awlock_s_bus[ ((0 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(0*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s1;
   assign awcache_s_bus[((0 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(0*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s1;
   assign awprot_s_bus[ ((0 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(0*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s1;
   assign awid_s_bus[ ((0 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s1;
   assign awready_s[1] =  awready_s_bus[0];

   assign rvalid_s[1]= rvalid_s_bus[0];
   assign rlast_s[1] = rlast_s_bus[0];
   assign rdata_s1 = rdata_s_bus[((0 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s1 = rresp_s_bus[((0 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s1   = rid_s_bus[((0 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[0] = rready_s[1];

   assign wvalid_s_bus[0] = wvalid_s[1];
   assign wlast_s_bus[0]  = wlast_s[1];
   assign wdata_s_bus[((0 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(0*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s1;
   assign wstrb_s_bus[((0 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(0*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s1;
   assign wid_s_bus[((0 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s1;
   assign wready_s[1] =  wready_s_bus[0];

   assign bvalid_s[1]=  bvalid_s_bus[0];
   assign bresp_s1 = bresp_s_bus[((0 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s1   = bid_s_bus[((0 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(0*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[0] = bready_s[1];

 `ifdef AXI_HAS_RSB
   assign rsideband_s1 = {8{rdata_s_bus[(0*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(0*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s1 = {64{bid_s_bus[(0*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(0*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S2

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s2;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s2;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s2;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s2;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s2;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s2;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s2;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s2;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s2;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s2;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s2;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s2;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s2;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s2;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s2;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s2;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s2;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s2;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s2;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s2;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s2;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s2;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s2;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s2;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s2;
   assign arsideband_s[2] = arsideband_s2;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s2;
   assign awsideband_s[2] = awsideband_s2;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s2;
   assign rsideband_s[2] = rsideband_s2;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s2;
   assign wsideband_s[2] = wsideband_s2;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s2;
   assign bsideband_s[2] = bsideband_s2;
 `endif

   assign araddr_s[2]  = araddr_s2;
   assign arid_s[2]    = arid_s2;
   assign arlen_s[2]   = arlen_s2;
   assign arsize_s[2]  = arsize_s2;
   assign arburst_s[2] = arburst_s2;
   assign arlock_s[2]  = arlock_s2;
   assign arprot_s[2]  = arprot_s2;
   assign arcache_s[2] = arcache_s2;

   assign awaddr_s[2]  = awaddr_s2;
   assign awid_s[2]    = awid_s2;
   assign awlen_s[2]   = awlen_s2;
   assign awsize_s[2]  = awsize_s2;
   assign awburst_s[2] = awburst_s2;
   assign awlock_s[2]  = awlock_s2;
   assign awprot_s[2]  = awprot_s2;
   assign awcache_s[2] = awcache_s2;

   assign wdata_s[2] = wdata_s2;
   assign wid_s[2]   = wid_s2;
   assign wstrb_s[2] = wstrb_s2;

   assign rdata_s[2] = rdata_s2;
   assign rid_s[2]   = rid_s2;
   assign rresp_s[2] = rresp_s2;

   assign bid_s[2]   = bid_s2;
   assign bresp_s[2] = bresp_s2;

   assign arvalid_s_bus[1] = arvalid_s[2];
   assign araddr_s_bus[ ((1 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(1*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s2;
   assign arlen_s_bus[  ((1 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(1*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s2;
   assign arsize_s_bus[ ((1 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(1*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s2;
   assign arburst_s_bus[((1 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(1*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s2;
   assign arlock_s_bus[ ((1 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(1*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s2;
   assign arcache_s_bus[((1 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(1*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s2;
   assign arprot_s_bus[ ((1 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(1*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s2;
   assign arid_s_bus[ ((1 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s2;
   assign arready_s[2] = arready_s_bus[1];

   assign awvalid_s_bus[1] = awvalid_s[2];
   assign awaddr_s_bus[ ((1 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(1*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s2;
   assign awlen_s_bus[  ((1 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(1*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s2;
   assign awsize_s_bus[ ((1 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(1*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s2;
   assign awburst_s_bus[((1 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(1*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s2;
   assign awlock_s_bus[ ((1 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(1*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s2;
   assign awcache_s_bus[((1 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(1*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s2;
   assign awprot_s_bus[ ((1 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(1*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s2;
   assign awid_s_bus[ ((1 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s2;
   assign awready_s[2] =  awready_s_bus[1];

   assign rvalid_s[2]= rvalid_s_bus[1];
   assign rlast_s[2] = rlast_s_bus[1];
   assign rdata_s2 = rdata_s_bus[((1 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s2 = rresp_s_bus[((1 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s2   = rid_s_bus[((1 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[1] = rready_s[2];

   assign wvalid_s_bus[1] = wvalid_s[2];
   assign wlast_s_bus[1]  = wlast_s[2];
   assign wdata_s_bus[((1 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(1*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s2;
   assign wstrb_s_bus[((1 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(1*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s2;
   assign wid_s_bus[((1 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s2;
   assign wready_s[2] =  wready_s_bus[1];

   assign bvalid_s[2]=  bvalid_s_bus[1];
   assign bresp_s2 = bresp_s_bus[((1 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s2   = bid_s_bus[((1 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(1*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[1] = bready_s[2];

 `ifdef AXI_HAS_RSB
   assign rsideband_s2 = {8{rdata_s_bus[(1*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(1*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s2 = {64{bid_s_bus[(1*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(1*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S3

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s3;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s3;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s3;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s3;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s3;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s3;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s3;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s3;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s3;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s3;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s3;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s3;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s3;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s3;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s3;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s3;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s3;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s3;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s3;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s3;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s3;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s3;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s3;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s3;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s3;
   assign arsideband_s[3] = arsideband_s3;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s3;
   assign awsideband_s[3] = awsideband_s3;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s3;
   assign rsideband_s[3] = rsideband_s3;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s3;
   assign wsideband_s[3] = wsideband_s3;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s3;
   assign bsideband_s[3] = bsideband_s3;
 `endif

   assign araddr_s[3]  = araddr_s3;
   assign arid_s[3]    = arid_s3;
   assign arlen_s[3]   = arlen_s3;
   assign arsize_s[3]  = arsize_s3;
   assign arburst_s[3] = arburst_s3;
   assign arlock_s[3]  = arlock_s3;
   assign arprot_s[3]  = arprot_s3;
   assign arcache_s[3] = arcache_s3;

   assign awaddr_s[3]  = awaddr_s3;
   assign awid_s[3]    = awid_s3;
   assign awlen_s[3]   = awlen_s3;
   assign awsize_s[3]  = awsize_s3;
   assign awburst_s[3] = awburst_s3;
   assign awlock_s[3]  = awlock_s3;
   assign awprot_s[3]  = awprot_s3;
   assign awcache_s[3] = awcache_s3;

   assign wdata_s[3] = wdata_s3;
   assign wid_s[3]   = wid_s3;
   assign wstrb_s[3] = wstrb_s3;

   assign rdata_s[3] = rdata_s3;
   assign rid_s[3]   = rid_s3;
   assign rresp_s[3] = rresp_s3;

   assign bid_s[3]   = bid_s3;
   assign bresp_s[3] = bresp_s3;

   assign arvalid_s_bus[2] = arvalid_s[3];
   assign araddr_s_bus[ ((2 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(2*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s3;
   assign arlen_s_bus[  ((2 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(2*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s3;
   assign arsize_s_bus[ ((2 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(2*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s3;
   assign arburst_s_bus[((2 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(2*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s3;
   assign arlock_s_bus[ ((2 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(2*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s3;
   assign arcache_s_bus[((2 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(2*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s3;
   assign arprot_s_bus[ ((2 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(2*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s3;
   assign arid_s_bus[ ((2 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s3;
   assign arready_s[3] = arready_s_bus[2];

   assign awvalid_s_bus[2] = awvalid_s[3];
   assign awaddr_s_bus[ ((2 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(2*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s3;
   assign awlen_s_bus[  ((2 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(2*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s3;
   assign awsize_s_bus[ ((2 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(2*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s3;
   assign awburst_s_bus[((2 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(2*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s3;
   assign awlock_s_bus[ ((2 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(2*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s3;
   assign awcache_s_bus[((2 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(2*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s3;
   assign awprot_s_bus[ ((2 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(2*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s3;
   assign awid_s_bus[ ((2 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s3;
   assign awready_s[3] =  awready_s_bus[2];

   assign rvalid_s[3]= rvalid_s_bus[2];
   assign rlast_s[3] = rlast_s_bus[2];
   assign rdata_s3 = rdata_s_bus[((2 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s3 = rresp_s_bus[((2 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s3   = rid_s_bus[((2 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[2] = rready_s[3];

   assign wvalid_s_bus[2] = wvalid_s[3];
   assign wlast_s_bus[2]  = wlast_s[3];
   assign wdata_s_bus[((2 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(2*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s3;
   assign wstrb_s_bus[((2 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(2*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s3;
   assign wid_s_bus[((2 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s3;
   assign wready_s[3] =  wready_s_bus[2];

   assign bvalid_s[3]=  bvalid_s_bus[2];
   assign bresp_s3 = bresp_s_bus[((2 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s3   = bid_s_bus[((2 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(2*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[2] = bready_s[3];

 `ifdef AXI_HAS_RSB
   assign rsideband_s3 = {8{rdata_s_bus[(2*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(2*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s3 = {64{bid_s_bus[(2*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(2*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S4

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s4;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s4;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s4;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s4;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s4;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s4;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s4;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s4;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s4;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s4;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s4;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s4;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s4;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s4;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s4;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s4;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s4;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s4;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s4;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s4;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s4;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s4;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s4;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s4;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s4;
   assign arsideband_s[4] = arsideband_s4;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s4;
   assign awsideband_s[4] = awsideband_s4;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s4;
   assign rsideband_s[4] = rsideband_s4;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s4;
   assign wsideband_s[4] = wsideband_s4;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s4;
   assign bsideband_s[4] = bsideband_s4;
 `endif

   assign araddr_s[4]  = araddr_s4;
   assign arid_s[4]    = arid_s4;
   assign arlen_s[4]   = arlen_s4;
   assign arsize_s[4]  = arsize_s4;
   assign arburst_s[4] = arburst_s4;
   assign arlock_s[4]  = arlock_s4;
   assign arprot_s[4]  = arprot_s4;
   assign arcache_s[4] = arcache_s4;

   assign awaddr_s[4]  = awaddr_s4;
   assign awid_s[4]    = awid_s4;
   assign awlen_s[4]   = awlen_s4;
   assign awsize_s[4]  = awsize_s4;
   assign awburst_s[4] = awburst_s4;
   assign awlock_s[4]  = awlock_s4;
   assign awprot_s[4]  = awprot_s4;
   assign awcache_s[4] = awcache_s4;

   assign wdata_s[4] = wdata_s4;
   assign wid_s[4]   = wid_s4;
   assign wstrb_s[4] = wstrb_s4;

   assign rdata_s[4] = rdata_s4;
   assign rid_s[4]   = rid_s4;
   assign rresp_s[4] = rresp_s4;

   assign bid_s[4]   = bid_s4;
   assign bresp_s[4] = bresp_s4;

   assign arvalid_s_bus[3] = arvalid_s[4];
   assign araddr_s_bus[ ((3 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(3*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s4;
   assign arlen_s_bus[  ((3 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(3*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s4;
   assign arsize_s_bus[ ((3 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(3*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s4;
   assign arburst_s_bus[((3 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(3*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s4;
   assign arlock_s_bus[ ((3 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(3*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s4;
   assign arcache_s_bus[((3 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(3*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s4;
   assign arprot_s_bus[ ((3 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(3*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s4;
   assign arid_s_bus[ ((3 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s4;
   assign arready_s[4] = arready_s_bus[3];

   assign awvalid_s_bus[3] = awvalid_s[4];
   assign awaddr_s_bus[ ((3 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(3*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s4;
   assign awlen_s_bus[  ((3 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(3*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s4;
   assign awsize_s_bus[ ((3 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(3*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s4;
   assign awburst_s_bus[((3 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(3*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s4;
   assign awlock_s_bus[ ((3 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(3*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s4;
   assign awcache_s_bus[((3 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(3*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s4;
   assign awprot_s_bus[ ((3 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(3*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s4;
   assign awid_s_bus[ ((3 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s4;
   assign awready_s[4] =  awready_s_bus[3];

   assign rvalid_s[4]= rvalid_s_bus[3];
   assign rlast_s[4] = rlast_s_bus[3];
   assign rdata_s4 = rdata_s_bus[((3 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s4 = rresp_s_bus[((3 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s4   = rid_s_bus[((3 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[3] = rready_s[4];

   assign wvalid_s_bus[3] = wvalid_s[4];
   assign wlast_s_bus[3]  = wlast_s[4];
   assign wdata_s_bus[((3 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(3*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s4;
   assign wstrb_s_bus[((3 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(3*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s4;
   assign wid_s_bus[((3 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s4;
   assign wready_s[4] =  wready_s_bus[3];

   assign bvalid_s[4]=  bvalid_s_bus[3];
   assign bresp_s4 = bresp_s_bus[((3 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s4   = bid_s_bus[((3 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(3*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[3] = bready_s[4];

 `ifdef AXI_HAS_RSB
   assign rsideband_s4 = {8{rdata_s_bus[(3*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(3*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s4 = {64{bid_s_bus[(3*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(3*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S5

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s5;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s5;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s5;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s5;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s5;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s5;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s5;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s5;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s5;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s5;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s5;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s5;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s5;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s5;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s5;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s5;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s5;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s5;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s5;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s5;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s5;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s5;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s5;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s5;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s5;
   assign arsideband_s[5] = arsideband_s5;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s5;
   assign awsideband_s[5] = awsideband_s5;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s5;
   assign rsideband_s[5] = rsideband_s5;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s5;
   assign wsideband_s[5] = wsideband_s5;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s5;
   assign bsideband_s[5] = bsideband_s5;
 `endif

   assign araddr_s[5]  = araddr_s5;
   assign arid_s[5]    = arid_s5;
   assign arlen_s[5]   = arlen_s5;
   assign arsize_s[5]  = arsize_s5;
   assign arburst_s[5] = arburst_s5;
   assign arlock_s[5]  = arlock_s5;
   assign arprot_s[5]  = arprot_s5;
   assign arcache_s[5] = arcache_s5;

   assign awaddr_s[5]  = awaddr_s5;
   assign awid_s[5]    = awid_s5;
   assign awlen_s[5]   = awlen_s5;
   assign awsize_s[5]  = awsize_s5;
   assign awburst_s[5] = awburst_s5;
   assign awlock_s[5]  = awlock_s5;
   assign awprot_s[5]  = awprot_s5;
   assign awcache_s[5] = awcache_s5;

   assign wdata_s[5] = wdata_s5;
   assign wid_s[5]   = wid_s5;
   assign wstrb_s[5] = wstrb_s5;

   assign rdata_s[5] = rdata_s5;
   assign rid_s[5]   = rid_s5;
   assign rresp_s[5] = rresp_s5;

   assign bid_s[5]   = bid_s5;
   assign bresp_s[5] = bresp_s5;

   assign arvalid_s_bus[4] = arvalid_s[5];
   assign araddr_s_bus[ ((4 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(4*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s5;
   assign arlen_s_bus[  ((4 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(4*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s5;
   assign arsize_s_bus[ ((4 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(4*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s5;
   assign arburst_s_bus[((4 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(4*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s5;
   assign arlock_s_bus[ ((4 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(4*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s5;
   assign arcache_s_bus[((4 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(4*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s5;
   assign arprot_s_bus[ ((4 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(4*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s5;
   assign arid_s_bus[ ((4 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s5;
   assign arready_s[5] = arready_s_bus[4];

   assign awvalid_s_bus[4] = awvalid_s[5];
   assign awaddr_s_bus[ ((4 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(4*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s5;
   assign awlen_s_bus[  ((4 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(4*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s5;
   assign awsize_s_bus[ ((4 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(4*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s5;
   assign awburst_s_bus[((4 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(4*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s5;
   assign awlock_s_bus[ ((4 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(4*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s5;
   assign awcache_s_bus[((4 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(4*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s5;
   assign awprot_s_bus[ ((4 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(4*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s5;
   assign awid_s_bus[ ((4 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s5;
   assign awready_s[5] =  awready_s_bus[4];

   assign rvalid_s[5]= rvalid_s_bus[4];
   assign rlast_s[5] = rlast_s_bus[4];
   assign rdata_s5 = rdata_s_bus[((4 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s5 = rresp_s_bus[((4 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s5   = rid_s_bus[((4 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[4] = rready_s[5];

   assign wvalid_s_bus[4] = wvalid_s[5];
   assign wlast_s_bus[4]  = wlast_s[5];
   assign wdata_s_bus[((4 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(4*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s5;
   assign wstrb_s_bus[((4 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(4*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s5;
   assign wid_s_bus[((4 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s5;
   assign wready_s[5] =  wready_s_bus[4];

   assign bvalid_s[5]=  bvalid_s_bus[4];
   assign bresp_s5 = bresp_s_bus[((4 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s5   = bid_s_bus[((4 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(4*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[4] = bready_s[5];

 `ifdef AXI_HAS_RSB
   assign rsideband_s5 = {8{rdata_s_bus[(4*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(4*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s5 = {64{bid_s_bus[(4*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(4*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S6

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s6;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s6;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s6;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s6;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s6;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s6;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s6;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s6;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s6;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s6;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s6;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s6;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s6;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s6;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s6;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s6;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s6;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s6;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s6;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s6;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s6;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s6;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s6;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s6;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s6;
   assign arsideband_s[6] = arsideband_s6;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s6;
   assign awsideband_s[6] = awsideband_s6;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s6;
   assign rsideband_s[6] = rsideband_s6;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s6;
   assign wsideband_s[6] = wsideband_s6;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s6;
   assign bsideband_s[6] = bsideband_s6;
 `endif

   assign araddr_s[6]  = araddr_s6;
   assign arid_s[6]    = arid_s6;
   assign arlen_s[6]   = arlen_s6;
   assign arsize_s[6]  = arsize_s6;
   assign arburst_s[6] = arburst_s6;
   assign arlock_s[6]  = arlock_s6;
   assign arprot_s[6]  = arprot_s6;
   assign arcache_s[6] = arcache_s6;

   assign awaddr_s[6]  = awaddr_s6;
   assign awid_s[6]    = awid_s6;
   assign awlen_s[6]   = awlen_s6;
   assign awsize_s[6]  = awsize_s6;
   assign awburst_s[6] = awburst_s6;
   assign awlock_s[6]  = awlock_s6;
   assign awprot_s[6]  = awprot_s6;
   assign awcache_s[6] = awcache_s6;

   assign wdata_s[6] = wdata_s6;
   assign wid_s[6]   = wid_s6;
   assign wstrb_s[6] = wstrb_s6;

   assign rdata_s[6] = rdata_s6;
   assign rid_s[6]   = rid_s6;
   assign rresp_s[6] = rresp_s6;

   assign bid_s[6]   = bid_s6;
   assign bresp_s[6] = bresp_s6;

   assign arvalid_s_bus[5] = arvalid_s[6];
   assign araddr_s_bus[ ((5 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(5*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s6;
   assign arlen_s_bus[  ((5 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(5*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s6;
   assign arsize_s_bus[ ((5 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(5*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s6;
   assign arburst_s_bus[((5 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(5*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s6;
   assign arlock_s_bus[ ((5 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(5*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s6;
   assign arcache_s_bus[((5 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(5*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s6;
   assign arprot_s_bus[ ((5 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(5*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s6;
   assign arid_s_bus[ ((5 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s6;
   assign arready_s[6] = arready_s_bus[5];

   assign awvalid_s_bus[5] = awvalid_s[6];
   assign awaddr_s_bus[ ((5 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(5*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s6;
   assign awlen_s_bus[  ((5 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(5*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s6;
   assign awsize_s_bus[ ((5 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(5*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s6;
   assign awburst_s_bus[((5 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(5*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s6;
   assign awlock_s_bus[ ((5 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(5*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s6;
   assign awcache_s_bus[((5 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(5*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s6;
   assign awprot_s_bus[ ((5 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(5*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s6;
   assign awid_s_bus[ ((5 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s6;
   assign awready_s[6] =  awready_s_bus[5];

   assign rvalid_s[6]= rvalid_s_bus[5];
   assign rlast_s[6] = rlast_s_bus[5];
   assign rdata_s6 = rdata_s_bus[((5 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s6 = rresp_s_bus[((5 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s6   = rid_s_bus[((5 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[5] = rready_s[6];

   assign wvalid_s_bus[5] = wvalid_s[6];
   assign wlast_s_bus[5]  = wlast_s[6];
   assign wdata_s_bus[((5 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(5*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s6;
   assign wstrb_s_bus[((5 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(5*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s6;
   assign wid_s_bus[((5 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s6;
   assign wready_s[6] =  wready_s_bus[5];

   assign bvalid_s[6]=  bvalid_s_bus[5];
   assign bresp_s6 = bresp_s_bus[((5 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s6   = bid_s_bus[((5 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(5*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[5] = bready_s[6];

 `ifdef AXI_HAS_RSB
   assign rsideband_s6 = {8{rdata_s_bus[(5*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(5*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s6 = {64{bid_s_bus[(5*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(5*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S7

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s7;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s7;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s7;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s7;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s7;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s7;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s7;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s7;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s7;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s7;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s7;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s7;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s7;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s7;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s7;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s7;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s7;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s7;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s7;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s7;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s7;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s7;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s7;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s7;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s7;
   assign arsideband_s[7] = arsideband_s7;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s7;
   assign awsideband_s[7] = awsideband_s7;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s7;
   assign rsideband_s[7] = rsideband_s7;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s7;
   assign wsideband_s[7] = wsideband_s7;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s7;
   assign bsideband_s[7] = bsideband_s7;
 `endif

   assign araddr_s[7]  = araddr_s7;
   assign arid_s[7]    = arid_s7;
   assign arlen_s[7]   = arlen_s7;
   assign arsize_s[7]  = arsize_s7;
   assign arburst_s[7] = arburst_s7;
   assign arlock_s[7]  = arlock_s7;
   assign arprot_s[7]  = arprot_s7;
   assign arcache_s[7] = arcache_s7;

   assign awaddr_s[7]  = awaddr_s7;
   assign awid_s[7]    = awid_s7;
   assign awlen_s[7]   = awlen_s7;
   assign awsize_s[7]  = awsize_s7;
   assign awburst_s[7] = awburst_s7;
   assign awlock_s[7]  = awlock_s7;
   assign awprot_s[7]  = awprot_s7;
   assign awcache_s[7] = awcache_s7;

   assign wdata_s[7] = wdata_s7;
   assign wid_s[7]   = wid_s7;
   assign wstrb_s[7] = wstrb_s7;

   assign rdata_s[7] = rdata_s7;
   assign rid_s[7]   = rid_s7;
   assign rresp_s[7] = rresp_s7;

   assign bid_s[7]   = bid_s7;
   assign bresp_s[7] = bresp_s7;

   assign arvalid_s_bus[6] = arvalid_s[7];
   assign araddr_s_bus[ ((6 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(6*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s7;
   assign arlen_s_bus[  ((6 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(6*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s7;
   assign arsize_s_bus[ ((6 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(6*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s7;
   assign arburst_s_bus[((6 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(6*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s7;
   assign arlock_s_bus[ ((6 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(6*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s7;
   assign arcache_s_bus[((6 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(6*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s7;
   assign arprot_s_bus[ ((6 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(6*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s7;
   assign arid_s_bus[ ((6 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s7;
   assign arready_s[7] = arready_s_bus[6];

   assign awvalid_s_bus[6] = awvalid_s[7];
   assign awaddr_s_bus[ ((6 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(6*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s7;
   assign awlen_s_bus[  ((6 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(6*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s7;
   assign awsize_s_bus[ ((6 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(6*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s7;
   assign awburst_s_bus[((6 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(6*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s7;
   assign awlock_s_bus[ ((6 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(6*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s7;
   assign awcache_s_bus[((6 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(6*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s7;
   assign awprot_s_bus[ ((6 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(6*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s7;
   assign awid_s_bus[ ((6 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s7;
   assign awready_s[7] =  awready_s_bus[6];

   assign rvalid_s[7]= rvalid_s_bus[6];
   assign rlast_s[7] = rlast_s_bus[6];
   assign rdata_s7 = rdata_s_bus[((6 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s7 = rresp_s_bus[((6 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s7   = rid_s_bus[((6 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[6] = rready_s[7];

   assign wvalid_s_bus[6] = wvalid_s[7];
   assign wlast_s_bus[6]  = wlast_s[7];
   assign wdata_s_bus[((6 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(6*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s7;
   assign wstrb_s_bus[((6 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(6*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s7;
   assign wid_s_bus[((6 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s7;
   assign wready_s[7] =  wready_s_bus[6];

   assign bvalid_s[7]=  bvalid_s_bus[6];
   assign bresp_s7 = bresp_s_bus[((6 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s7   = bid_s_bus[((6 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(6*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[6] = bready_s[7];

 `ifdef AXI_HAS_RSB
   assign rsideband_s7 = {8{rdata_s_bus[(6*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(6*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s7 = {64{bid_s_bus[(6*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(6*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S8

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s8;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s8;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s8;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s8;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s8;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s8;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s8;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s8;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s8;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s8;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s8;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s8;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s8;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s8;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s8;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s8;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s8;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s8;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s8;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s8;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s8;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s8;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s8;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s8;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s8;
   assign arsideband_s[8] = arsideband_s8;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s8;
   assign awsideband_s[8] = awsideband_s8;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s8;
   assign rsideband_s[8] = rsideband_s8;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s8;
   assign wsideband_s[8] = wsideband_s8;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s8;
   assign bsideband_s[8] = bsideband_s8;
 `endif

   assign araddr_s[8]  = araddr_s8;
   assign arid_s[8]    = arid_s8;
   assign arlen_s[8]   = arlen_s8;
   assign arsize_s[8]  = arsize_s8;
   assign arburst_s[8] = arburst_s8;
   assign arlock_s[8]  = arlock_s8;
   assign arprot_s[8]  = arprot_s8;
   assign arcache_s[8] = arcache_s8;

   assign awaddr_s[8]  = awaddr_s8;
   assign awid_s[8]    = awid_s8;
   assign awlen_s[8]   = awlen_s8;
   assign awsize_s[8]  = awsize_s8;
   assign awburst_s[8] = awburst_s8;
   assign awlock_s[8]  = awlock_s8;
   assign awprot_s[8]  = awprot_s8;
   assign awcache_s[8] = awcache_s8;

   assign wdata_s[8] = wdata_s8;
   assign wid_s[8]   = wid_s8;
   assign wstrb_s[8] = wstrb_s8;

   assign rdata_s[8] = rdata_s8;
   assign rid_s[8]   = rid_s8;
   assign rresp_s[8] = rresp_s8;

   assign bid_s[8]   = bid_s8;
   assign bresp_s[8] = bresp_s8;

   assign arvalid_s_bus[7] = arvalid_s[8];
   assign araddr_s_bus[ ((7 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(7*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s8;
   assign arlen_s_bus[  ((7 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(7*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s8;
   assign arsize_s_bus[ ((7 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(7*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s8;
   assign arburst_s_bus[((7 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(7*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s8;
   assign arlock_s_bus[ ((7 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(7*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s8;
   assign arcache_s_bus[((7 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(7*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s8;
   assign arprot_s_bus[ ((7 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(7*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s8;
   assign arid_s_bus[ ((7 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s8;
   assign arready_s[8] = arready_s_bus[7];

   assign awvalid_s_bus[7] = awvalid_s[8];
   assign awaddr_s_bus[ ((7 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(7*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s8;
   assign awlen_s_bus[  ((7 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(7*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s8;
   assign awsize_s_bus[ ((7 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(7*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s8;
   assign awburst_s_bus[((7 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(7*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s8;
   assign awlock_s_bus[ ((7 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(7*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s8;
   assign awcache_s_bus[((7 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(7*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s8;
   assign awprot_s_bus[ ((7 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(7*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s8;
   assign awid_s_bus[ ((7 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s8;
   assign awready_s[8] =  awready_s_bus[7];

   assign rvalid_s[8]= rvalid_s_bus[7];
   assign rlast_s[8] = rlast_s_bus[7];
   assign rdata_s8 = rdata_s_bus[((7 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s8 = rresp_s_bus[((7 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s8   = rid_s_bus[((7 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[7] = rready_s[8];

   assign wvalid_s_bus[7] = wvalid_s[8];
   assign wlast_s_bus[7]  = wlast_s[8];
   assign wdata_s_bus[((7 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(7*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s8;
   assign wstrb_s_bus[((7 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(7*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s8;
   assign wid_s_bus[((7 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s8;
   assign wready_s[8] =  wready_s_bus[7];

   assign bvalid_s[8]=  bvalid_s_bus[7];
   assign bresp_s8 = bresp_s_bus[((7 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s8   = bid_s_bus[((7 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(7*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[7] = bready_s[8];

 `ifdef AXI_HAS_RSB
   assign rsideband_s8 = {8{rdata_s_bus[(7*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(7*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s8 = {64{bid_s_bus[(7*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(7*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S9

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s9;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s9;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s9;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s9;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s9;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s9;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s9;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s9;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s9;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s9;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s9;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s9;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s9;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s9;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s9;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s9;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s9;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s9;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s9;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s9;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s9;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s9;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s9;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s9;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s9;
   assign arsideband_s[9] = arsideband_s9;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s9;
   assign awsideband_s[9] = awsideband_s9;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s9;
   assign rsideband_s[9] = rsideband_s9;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s9;
   assign wsideband_s[9] = wsideband_s9;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s9;
   assign bsideband_s[9] = bsideband_s9;
 `endif

   assign araddr_s[9]  = araddr_s9;
   assign arid_s[9]    = arid_s9;
   assign arlen_s[9]   = arlen_s9;
   assign arsize_s[9]  = arsize_s9;
   assign arburst_s[9] = arburst_s9;
   assign arlock_s[9]  = arlock_s9;
   assign arprot_s[9]  = arprot_s9;
   assign arcache_s[9] = arcache_s9;

   assign awaddr_s[9]  = awaddr_s9;
   assign awid_s[9]    = awid_s9;
   assign awlen_s[9]   = awlen_s9;
   assign awsize_s[9]  = awsize_s9;
   assign awburst_s[9] = awburst_s9;
   assign awlock_s[9]  = awlock_s9;
   assign awprot_s[9]  = awprot_s9;
   assign awcache_s[9] = awcache_s9;

   assign wdata_s[9] = wdata_s9;
   assign wid_s[9]   = wid_s9;
   assign wstrb_s[9] = wstrb_s9;

   assign rdata_s[9] = rdata_s9;
   assign rid_s[9]   = rid_s9;
   assign rresp_s[9] = rresp_s9;

   assign bid_s[9]   = bid_s9;
   assign bresp_s[9] = bresp_s9;

   assign arvalid_s_bus[8] = arvalid_s[9];
   assign araddr_s_bus[ ((8 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(8*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s9;
   assign arlen_s_bus[  ((8 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(8*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s9;
   assign arsize_s_bus[ ((8 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(8*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s9;
   assign arburst_s_bus[((8 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(8*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s9;
   assign arlock_s_bus[ ((8 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(8*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s9;
   assign arcache_s_bus[((8 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(8*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s9;
   assign arprot_s_bus[ ((8 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(8*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s9;
   assign arid_s_bus[ ((8 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s9;
   assign arready_s[9] = arready_s_bus[8];

   assign awvalid_s_bus[8] = awvalid_s[9];
   assign awaddr_s_bus[ ((8 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(8*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s9;
   assign awlen_s_bus[  ((8 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(8*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s9;
   assign awsize_s_bus[ ((8 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(8*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s9;
   assign awburst_s_bus[((8 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(8*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s9;
   assign awlock_s_bus[ ((8 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(8*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s9;
   assign awcache_s_bus[((8 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(8*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s9;
   assign awprot_s_bus[ ((8 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(8*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s9;
   assign awid_s_bus[ ((8 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s9;
   assign awready_s[9] =  awready_s_bus[8];

   assign rvalid_s[9]= rvalid_s_bus[8];
   assign rlast_s[9] = rlast_s_bus[8];
   assign rdata_s9 = rdata_s_bus[((8 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s9 = rresp_s_bus[((8 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s9   = rid_s_bus[((8 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[8] = rready_s[9];

   assign wvalid_s_bus[8] = wvalid_s[9];
   assign wlast_s_bus[8]  = wlast_s[9];
   assign wdata_s_bus[((8 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(8*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s9;
   assign wstrb_s_bus[((8 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(8*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s9;
   assign wid_s_bus[((8 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s9;
   assign wready_s[9] =  wready_s_bus[8];

   assign bvalid_s[9]=  bvalid_s_bus[8];
   assign bresp_s9 = bresp_s_bus[((8 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s9   = bid_s_bus[((8 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(8*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[8] = bready_s[9];

 `ifdef AXI_HAS_RSB
   assign rsideband_s9 = {8{rdata_s_bus[(8*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(8*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s9 = {64{bid_s_bus[(8*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(8*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S10

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s10;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s10;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s10;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s10;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s10;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s10;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s10;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s10;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s10;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s10;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s10;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s10;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s10;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s10;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s10;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s10;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s10;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s10;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s10;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s10;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s10;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s10;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s10;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s10;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s10;
   assign arsideband_s[10] = arsideband_s10;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s10;
   assign awsideband_s[10] = awsideband_s10;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s10;
   assign rsideband_s[10] = rsideband_s10;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s10;
   assign wsideband_s[10] = wsideband_s10;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s10;
   assign bsideband_s[10] = bsideband_s10;
 `endif

   assign araddr_s[10]  = araddr_s10;
   assign arid_s[10]    = arid_s10;
   assign arlen_s[10]   = arlen_s10;
   assign arsize_s[10]  = arsize_s10;
   assign arburst_s[10] = arburst_s10;
   assign arlock_s[10]  = arlock_s10;
   assign arprot_s[10]  = arprot_s10;
   assign arcache_s[10] = arcache_s10;

   assign awaddr_s[10]  = awaddr_s10;
   assign awid_s[10]    = awid_s10;
   assign awlen_s[10]   = awlen_s10;
   assign awsize_s[10]  = awsize_s10;
   assign awburst_s[10] = awburst_s10;
   assign awlock_s[10]  = awlock_s10;
   assign awprot_s[10]  = awprot_s10;
   assign awcache_s[10] = awcache_s10;

   assign wdata_s[10] = wdata_s10;
   assign wid_s[10]   = wid_s10;
   assign wstrb_s[10] = wstrb_s10;

   assign rdata_s[10] = rdata_s10;
   assign rid_s[10]   = rid_s10;
   assign rresp_s[10] = rresp_s10;

   assign bid_s[10]   = bid_s10;
   assign bresp_s[10] = bresp_s10;

   assign arvalid_s_bus[9] = arvalid_s[10];
   assign araddr_s_bus[ ((9 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(9*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s10;
   assign arlen_s_bus[  ((9 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(9*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s10;
   assign arsize_s_bus[ ((9 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(9*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s10;
   assign arburst_s_bus[((9 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(9*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s10;
   assign arlock_s_bus[ ((9 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(9*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s10;
   assign arcache_s_bus[((9 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(9*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s10;
   assign arprot_s_bus[ ((9 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(9*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s10;
   assign arid_s_bus[ ((9 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s10;
   assign arready_s[10] = arready_s_bus[9];

   assign awvalid_s_bus[9] = awvalid_s[10];
   assign awaddr_s_bus[ ((9 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(9*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s10;
   assign awlen_s_bus[  ((9 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(9*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s10;
   assign awsize_s_bus[ ((9 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(9*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s10;
   assign awburst_s_bus[((9 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(9*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s10;
   assign awlock_s_bus[ ((9 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(9*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s10;
   assign awcache_s_bus[((9 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(9*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s10;
   assign awprot_s_bus[ ((9 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(9*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s10;
   assign awid_s_bus[ ((9 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s10;
   assign awready_s[10] =  awready_s_bus[9];

   assign rvalid_s[10]= rvalid_s_bus[9];
   assign rlast_s[10] = rlast_s_bus[9];
   assign rdata_s10 = rdata_s_bus[((9 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s10 = rresp_s_bus[((9 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s10   = rid_s_bus[((9 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[9] = rready_s[10];

   assign wvalid_s_bus[9] = wvalid_s[10];
   assign wlast_s_bus[9]  = wlast_s[10];
   assign wdata_s_bus[((9 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(9*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s10;
   assign wstrb_s_bus[((9 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(9*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s10;
   assign wid_s_bus[((9 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s10;
   assign wready_s[10] =  wready_s_bus[9];

   assign bvalid_s[10]=  bvalid_s_bus[9];
   assign bresp_s10 = bresp_s_bus[((9 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s10   = bid_s_bus[((9 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(9*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[9] = bready_s[10];

 `ifdef AXI_HAS_RSB
   assign rsideband_s10 = {8{rdata_s_bus[(9*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(9*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s10 = {64{bid_s_bus[(9*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(9*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S11

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s11;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s11;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s11;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s11;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s11;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s11;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s11;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s11;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s11;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s11;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s11;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s11;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s11;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s11;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s11;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s11;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s11;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s11;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s11;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s11;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s11;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s11;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s11;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s11;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s11;
   assign arsideband_s[11] = arsideband_s11;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s11;
   assign awsideband_s[11] = awsideband_s11;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s11;
   assign rsideband_s[11] = rsideband_s11;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s11;
   assign wsideband_s[11] = wsideband_s11;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s11;
   assign bsideband_s[11] = bsideband_s11;
 `endif

   assign araddr_s[11]  = araddr_s11;
   assign arid_s[11]    = arid_s11;
   assign arlen_s[11]   = arlen_s11;
   assign arsize_s[11]  = arsize_s11;
   assign arburst_s[11] = arburst_s11;
   assign arlock_s[11]  = arlock_s11;
   assign arprot_s[11]  = arprot_s11;
   assign arcache_s[11] = arcache_s11;

   assign awaddr_s[11]  = awaddr_s11;
   assign awid_s[11]    = awid_s11;
   assign awlen_s[11]   = awlen_s11;
   assign awsize_s[11]  = awsize_s11;
   assign awburst_s[11] = awburst_s11;
   assign awlock_s[11]  = awlock_s11;
   assign awprot_s[11]  = awprot_s11;
   assign awcache_s[11] = awcache_s11;

   assign wdata_s[11] = wdata_s11;
   assign wid_s[11]   = wid_s11;
   assign wstrb_s[11] = wstrb_s11;

   assign rdata_s[11] = rdata_s11;
   assign rid_s[11]   = rid_s11;
   assign rresp_s[11] = rresp_s11;

   assign bid_s[11]   = bid_s11;
   assign bresp_s[11] = bresp_s11;

   assign arvalid_s_bus[10] = arvalid_s[11];
   assign araddr_s_bus[ ((10 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(10*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s11;
   assign arlen_s_bus[  ((10 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(10*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s11;
   assign arsize_s_bus[ ((10 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(10*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s11;
   assign arburst_s_bus[((10 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(10*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s11;
   assign arlock_s_bus[ ((10 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(10*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s11;
   assign arcache_s_bus[((10 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(10*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s11;
   assign arprot_s_bus[ ((10 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(10*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s11;
   assign arid_s_bus[ ((10 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s11;
   assign arready_s[11] = arready_s_bus[10];

   assign awvalid_s_bus[10] = awvalid_s[11];
   assign awaddr_s_bus[ ((10 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(10*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s11;
   assign awlen_s_bus[  ((10 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(10*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s11;
   assign awsize_s_bus[ ((10 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(10*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s11;
   assign awburst_s_bus[((10 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(10*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s11;
   assign awlock_s_bus[ ((10 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(10*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s11;
   assign awcache_s_bus[((10 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(10*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s11;
   assign awprot_s_bus[ ((10 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(10*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s11;
   assign awid_s_bus[ ((10 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s11;
   assign awready_s[11] =  awready_s_bus[10];

   assign rvalid_s[11]= rvalid_s_bus[10];
   assign rlast_s[11] = rlast_s_bus[10];
   assign rdata_s11 = rdata_s_bus[((10 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s11 = rresp_s_bus[((10 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s11   = rid_s_bus[((10 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[10] = rready_s[11];

   assign wvalid_s_bus[10] = wvalid_s[11];
   assign wlast_s_bus[10]  = wlast_s[11];
   assign wdata_s_bus[((10 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(10*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s11;
   assign wstrb_s_bus[((10 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(10*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s11;
   assign wid_s_bus[((10 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s11;
   assign wready_s[11] =  wready_s_bus[10];

   assign bvalid_s[11]=  bvalid_s_bus[10];
   assign bresp_s11 = bresp_s_bus[((10 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s11   = bid_s_bus[((10 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(10*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[10] = bready_s[11];

 `ifdef AXI_HAS_RSB
   assign rsideband_s11 = {8{rdata_s_bus[(10*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(10*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s11 = {64{bid_s_bus[(10*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(10*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S12

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s12;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s12;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s12;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s12;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s12;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s12;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s12;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s12;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s12;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s12;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s12;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s12;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s12;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s12;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s12;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s12;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s12;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s12;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s12;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s12;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s12;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s12;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s12;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s12;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s12;
   assign arsideband_s[12] = arsideband_s12;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s12;
   assign awsideband_s[12] = awsideband_s12;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s12;
   assign rsideband_s[12] = rsideband_s12;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s12;
   assign wsideband_s[12] = wsideband_s12;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s12;
   assign bsideband_s[12] = bsideband_s12;
 `endif

   assign araddr_s[12]  = araddr_s12;
   assign arid_s[12]    = arid_s12;
   assign arlen_s[12]   = arlen_s12;
   assign arsize_s[12]  = arsize_s12;
   assign arburst_s[12] = arburst_s12;
   assign arlock_s[12]  = arlock_s12;
   assign arprot_s[12]  = arprot_s12;
   assign arcache_s[12] = arcache_s12;

   assign awaddr_s[12]  = awaddr_s12;
   assign awid_s[12]    = awid_s12;
   assign awlen_s[12]   = awlen_s12;
   assign awsize_s[12]  = awsize_s12;
   assign awburst_s[12] = awburst_s12;
   assign awlock_s[12]  = awlock_s12;
   assign awprot_s[12]  = awprot_s12;
   assign awcache_s[12] = awcache_s12;

   assign wdata_s[12] = wdata_s12;
   assign wid_s[12]   = wid_s12;
   assign wstrb_s[12] = wstrb_s12;

   assign rdata_s[12] = rdata_s12;
   assign rid_s[12]   = rid_s12;
   assign rresp_s[12] = rresp_s12;

   assign bid_s[12]   = bid_s12;
   assign bresp_s[12] = bresp_s12;

   assign arvalid_s_bus[11] = arvalid_s[12];
   assign araddr_s_bus[ ((11 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(11*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s12;
   assign arlen_s_bus[  ((11 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(11*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s12;
   assign arsize_s_bus[ ((11 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(11*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s12;
   assign arburst_s_bus[((11 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(11*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s12;
   assign arlock_s_bus[ ((11 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(11*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s12;
   assign arcache_s_bus[((11 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(11*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s12;
   assign arprot_s_bus[ ((11 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(11*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s12;
   assign arid_s_bus[ ((11 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s12;
   assign arready_s[12] = arready_s_bus[11];

   assign awvalid_s_bus[11] = awvalid_s[12];
   assign awaddr_s_bus[ ((11 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(11*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s12;
   assign awlen_s_bus[  ((11 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(11*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s12;
   assign awsize_s_bus[ ((11 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(11*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s12;
   assign awburst_s_bus[((11 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(11*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s12;
   assign awlock_s_bus[ ((11 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(11*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s12;
   assign awcache_s_bus[((11 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(11*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s12;
   assign awprot_s_bus[ ((11 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(11*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s12;
   assign awid_s_bus[ ((11 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s12;
   assign awready_s[12] =  awready_s_bus[11];

   assign rvalid_s[12]= rvalid_s_bus[11];
   assign rlast_s[12] = rlast_s_bus[11];
   assign rdata_s12 = rdata_s_bus[((11 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s12 = rresp_s_bus[((11 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s12   = rid_s_bus[((11 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[11] = rready_s[12];

   assign wvalid_s_bus[11] = wvalid_s[12];
   assign wlast_s_bus[11]  = wlast_s[12];
   assign wdata_s_bus[((11 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(11*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s12;
   assign wstrb_s_bus[((11 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(11*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s12;
   assign wid_s_bus[((11 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s12;
   assign wready_s[12] =  wready_s_bus[11];

   assign bvalid_s[12]=  bvalid_s_bus[11];
   assign bresp_s12 = bresp_s_bus[((11 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s12   = bid_s_bus[((11 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(11*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[11] = bready_s[12];

 `ifdef AXI_HAS_RSB
   assign rsideband_s12 = {8{rdata_s_bus[(11*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(11*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s12 = {64{bid_s_bus[(11*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(11*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S13

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s13;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s13;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s13;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s13;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s13;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s13;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s13;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s13;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s13;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s13;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s13;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s13;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s13;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s13;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s13;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s13;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s13;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s13;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s13;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s13;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s13;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s13;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s13;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s13;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s13;
   assign arsideband_s[13] = arsideband_s13;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s13;
   assign awsideband_s[13] = awsideband_s13;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s13;
   assign rsideband_s[13] = rsideband_s13;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s13;
   assign wsideband_s[13] = wsideband_s13;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s13;
   assign bsideband_s[13] = bsideband_s13;
 `endif

   assign araddr_s[13]  = araddr_s13;
   assign arid_s[13]    = arid_s13;
   assign arlen_s[13]   = arlen_s13;
   assign arsize_s[13]  = arsize_s13;
   assign arburst_s[13] = arburst_s13;
   assign arlock_s[13]  = arlock_s13;
   assign arprot_s[13]  = arprot_s13;
   assign arcache_s[13] = arcache_s13;

   assign awaddr_s[13]  = awaddr_s13;
   assign awid_s[13]    = awid_s13;
   assign awlen_s[13]   = awlen_s13;
   assign awsize_s[13]  = awsize_s13;
   assign awburst_s[13] = awburst_s13;
   assign awlock_s[13]  = awlock_s13;
   assign awprot_s[13]  = awprot_s13;
   assign awcache_s[13] = awcache_s13;

   assign wdata_s[13] = wdata_s13;
   assign wid_s[13]   = wid_s13;
   assign wstrb_s[13] = wstrb_s13;

   assign rdata_s[13] = rdata_s13;
   assign rid_s[13]   = rid_s13;
   assign rresp_s[13] = rresp_s13;

   assign bid_s[13]   = bid_s13;
   assign bresp_s[13] = bresp_s13;

   assign arvalid_s_bus[12] = arvalid_s[13];
   assign araddr_s_bus[ ((12 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(12*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s13;
   assign arlen_s_bus[  ((12 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(12*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s13;
   assign arsize_s_bus[ ((12 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(12*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s13;
   assign arburst_s_bus[((12 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(12*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s13;
   assign arlock_s_bus[ ((12 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(12*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s13;
   assign arcache_s_bus[((12 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(12*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s13;
   assign arprot_s_bus[ ((12 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(12*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s13;
   assign arid_s_bus[ ((12 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s13;
   assign arready_s[13] = arready_s_bus[12];

   assign awvalid_s_bus[12] = awvalid_s[13];
   assign awaddr_s_bus[ ((12 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(12*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s13;
   assign awlen_s_bus[  ((12 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(12*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s13;
   assign awsize_s_bus[ ((12 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(12*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s13;
   assign awburst_s_bus[((12 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(12*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s13;
   assign awlock_s_bus[ ((12 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(12*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s13;
   assign awcache_s_bus[((12 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(12*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s13;
   assign awprot_s_bus[ ((12 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(12*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s13;
   assign awid_s_bus[ ((12 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s13;
   assign awready_s[13] =  awready_s_bus[12];

   assign rvalid_s[13]= rvalid_s_bus[12];
   assign rlast_s[13] = rlast_s_bus[12];
   assign rdata_s13 = rdata_s_bus[((12 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s13 = rresp_s_bus[((12 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s13   = rid_s_bus[((12 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[12] = rready_s[13];

   assign wvalid_s_bus[12] = wvalid_s[13];
   assign wlast_s_bus[12]  = wlast_s[13];
   assign wdata_s_bus[((12 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(12*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s13;
   assign wstrb_s_bus[((12 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(12*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s13;
   assign wid_s_bus[((12 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s13;
   assign wready_s[13] =  wready_s_bus[12];

   assign bvalid_s[13]=  bvalid_s_bus[12];
   assign bresp_s13 = bresp_s_bus[((12 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s13   = bid_s_bus[((12 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(12*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[12] = bready_s[13];

 `ifdef AXI_HAS_RSB
   assign rsideband_s13 = {8{rdata_s_bus[(12*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(12*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s13 = {64{bid_s_bus[(12*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(12*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S14

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s14;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s14;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s14;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s14;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s14;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s14;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s14;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s14;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s14;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s14;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s14;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s14;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s14;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s14;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s14;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s14;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s14;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s14;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s14;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s14;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s14;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s14;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s14;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s14;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s14;
   assign arsideband_s[14] = arsideband_s14;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s14;
   assign awsideband_s[14] = awsideband_s14;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s14;
   assign rsideband_s[14] = rsideband_s14;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s14;
   assign wsideband_s[14] = wsideband_s14;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s14;
   assign bsideband_s[14] = bsideband_s14;
 `endif

   assign araddr_s[14]  = araddr_s14;
   assign arid_s[14]    = arid_s14;
   assign arlen_s[14]   = arlen_s14;
   assign arsize_s[14]  = arsize_s14;
   assign arburst_s[14] = arburst_s14;
   assign arlock_s[14]  = arlock_s14;
   assign arprot_s[14]  = arprot_s14;
   assign arcache_s[14] = arcache_s14;

   assign awaddr_s[14]  = awaddr_s14;
   assign awid_s[14]    = awid_s14;
   assign awlen_s[14]   = awlen_s14;
   assign awsize_s[14]  = awsize_s14;
   assign awburst_s[14] = awburst_s14;
   assign awlock_s[14]  = awlock_s14;
   assign awprot_s[14]  = awprot_s14;
   assign awcache_s[14] = awcache_s14;

   assign wdata_s[14] = wdata_s14;
   assign wid_s[14]   = wid_s14;
   assign wstrb_s[14] = wstrb_s14;

   assign rdata_s[14] = rdata_s14;
   assign rid_s[14]   = rid_s14;
   assign rresp_s[14] = rresp_s14;

   assign bid_s[14]   = bid_s14;
   assign bresp_s[14] = bresp_s14;

   assign arvalid_s_bus[13] = arvalid_s[14];
   assign araddr_s_bus[ ((13 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(13*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s14;
   assign arlen_s_bus[  ((13 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(13*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s14;
   assign arsize_s_bus[ ((13 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(13*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s14;
   assign arburst_s_bus[((13 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(13*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s14;
   assign arlock_s_bus[ ((13 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(13*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s14;
   assign arcache_s_bus[((13 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(13*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s14;
   assign arprot_s_bus[ ((13 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(13*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s14;
   assign arid_s_bus[ ((13 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s14;
   assign arready_s[14] = arready_s_bus[13];

   assign awvalid_s_bus[13] = awvalid_s[14];
   assign awaddr_s_bus[ ((13 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(13*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s14;
   assign awlen_s_bus[  ((13 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(13*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s14;
   assign awsize_s_bus[ ((13 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(13*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s14;
   assign awburst_s_bus[((13 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(13*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s14;
   assign awlock_s_bus[ ((13 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(13*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s14;
   assign awcache_s_bus[((13 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(13*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s14;
   assign awprot_s_bus[ ((13 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(13*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s14;
   assign awid_s_bus[ ((13 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s14;
   assign awready_s[14] =  awready_s_bus[13];

   assign rvalid_s[14]= rvalid_s_bus[13];
   assign rlast_s[14] = rlast_s_bus[13];
   assign rdata_s14 = rdata_s_bus[((13 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s14 = rresp_s_bus[((13 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s14   = rid_s_bus[((13 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[13] = rready_s[14];

   assign wvalid_s_bus[13] = wvalid_s[14];
   assign wlast_s_bus[13]  = wlast_s[14];
   assign wdata_s_bus[((13 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(13*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s14;
   assign wstrb_s_bus[((13 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(13*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s14;
   assign wid_s_bus[((13 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s14;
   assign wready_s[14] =  wready_s_bus[13];

   assign bvalid_s[14]=  bvalid_s_bus[13];
   assign bresp_s14 = bresp_s_bus[((13 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s14   = bid_s_bus[((13 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(13*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[13] = bready_s[14];

 `ifdef AXI_HAS_RSB
   assign rsideband_s14 = {8{rdata_s_bus[(13*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(13*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s14 = {64{bid_s_bus[(13*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(13*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S15

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s15;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s15;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s15;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s15;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s15;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s15;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s15;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s15;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s15;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s15;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s15;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s15;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s15;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s15;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s15;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s15;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s15;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s15;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s15;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s15;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s15;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s15;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s15;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s15;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s15;
   assign arsideband_s[15] = arsideband_s15;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s15;
   assign awsideband_s[15] = awsideband_s15;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s15;
   assign rsideband_s[15] = rsideband_s15;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s15;
   assign wsideband_s[15] = wsideband_s15;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s15;
   assign bsideband_s[15] = bsideband_s15;
 `endif

   assign araddr_s[15]  = araddr_s15;
   assign arid_s[15]    = arid_s15;
   assign arlen_s[15]   = arlen_s15;
   assign arsize_s[15]  = arsize_s15;
   assign arburst_s[15] = arburst_s15;
   assign arlock_s[15]  = arlock_s15;
   assign arprot_s[15]  = arprot_s15;
   assign arcache_s[15] = arcache_s15;

   assign awaddr_s[15]  = awaddr_s15;
   assign awid_s[15]    = awid_s15;
   assign awlen_s[15]   = awlen_s15;
   assign awsize_s[15]  = awsize_s15;
   assign awburst_s[15] = awburst_s15;
   assign awlock_s[15]  = awlock_s15;
   assign awprot_s[15]  = awprot_s15;
   assign awcache_s[15] = awcache_s15;

   assign wdata_s[15] = wdata_s15;
   assign wid_s[15]   = wid_s15;
   assign wstrb_s[15] = wstrb_s15;

   assign rdata_s[15] = rdata_s15;
   assign rid_s[15]   = rid_s15;
   assign rresp_s[15] = rresp_s15;

   assign bid_s[15]   = bid_s15;
   assign bresp_s[15] = bresp_s15;

   assign arvalid_s_bus[14] = arvalid_s[15];
   assign araddr_s_bus[ ((14 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(14*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s15;
   assign arlen_s_bus[  ((14 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(14*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s15;
   assign arsize_s_bus[ ((14 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(14*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s15;
   assign arburst_s_bus[((14 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(14*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s15;
   assign arlock_s_bus[ ((14 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(14*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s15;
   assign arcache_s_bus[((14 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(14*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s15;
   assign arprot_s_bus[ ((14 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(14*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s15;
   assign arid_s_bus[ ((14 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s15;
   assign arready_s[15] = arready_s_bus[14];

   assign awvalid_s_bus[14] = awvalid_s[15];
   assign awaddr_s_bus[ ((14 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(14*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s15;
   assign awlen_s_bus[  ((14 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(14*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s15;
   assign awsize_s_bus[ ((14 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(14*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s15;
   assign awburst_s_bus[((14 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(14*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s15;
   assign awlock_s_bus[ ((14 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(14*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s15;
   assign awcache_s_bus[((14 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(14*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s15;
   assign awprot_s_bus[ ((14 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(14*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s15;
   assign awid_s_bus[ ((14 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s15;
   assign awready_s[15] =  awready_s_bus[14];

   assign rvalid_s[15]= rvalid_s_bus[14];
   assign rlast_s[15] = rlast_s_bus[14];
   assign rdata_s15 = rdata_s_bus[((14 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s15 = rresp_s_bus[((14 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s15   = rid_s_bus[((14 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[14] = rready_s[15];

   assign wvalid_s_bus[14] = wvalid_s[15];
   assign wlast_s_bus[14]  = wlast_s[15];
   assign wdata_s_bus[((14 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(14*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s15;
   assign wstrb_s_bus[((14 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(14*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s15;
   assign wid_s_bus[((14 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s15;
   assign wready_s[15] =  wready_s_bus[14];

   assign bvalid_s[15]=  bvalid_s_bus[14];
   assign bresp_s15 = bresp_s_bus[((14 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s15   = bid_s_bus[((14 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(14*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[14] = bready_s[15];

 `ifdef AXI_HAS_RSB
   assign rsideband_s15 = {8{rdata_s_bus[(14*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(14*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s15 = {64{bid_s_bus[(14*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(14*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S16

   wire [`DW_VIP_AXI_ARADDR_PORT_WIDTH:0]       araddr_s16;
   wire [`DW_VIP_AXI_ARID_PORT_WIDTH:0]         arid_s16;
   wire [`DW_VIP_AXI_ARLEN_PORT_WIDTH:0]        arlen_s16;
   wire [`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0]     arsize_s16;
   wire [`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0]    arburst_s16;
   wire [`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0]     arlock_s16;
   wire [`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0]     arprot_s16;
   wire [`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0]    arcache_s16;

   wire [`DW_VIP_AXI_AWADDR_PORT_WIDTH:0]       awaddr_s16;
   wire [`DW_VIP_AXI_AWID_PORT_WIDTH:0]         awid_s16;
   wire [`DW_VIP_AXI_AWLEN_PORT_WIDTH:0]        awlen_s16;
   wire [`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0]     awsize_s16;
   wire [`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0]    awburst_s16;
   wire [`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0]     awlock_s16;
   wire [`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0]     awprot_s16;
   wire [`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0]    awcache_s16;

   wire [`DW_VIP_AXI_WDATA_PORT_WIDTH:0]        wdata_s16;
   wire [`DW_VIP_AXI_WID_PORT_WIDTH:0]          wid_s16;
   wire [`DW_VIP_AXI_WSTRB_PORT_WIDTH:0]        wstrb_s16;

   wire [`DW_VIP_AXI_RDATA_PORT_WIDTH:0]        rdata_s16;
   wire [`DW_VIP_AXI_RID_PORT_WIDTH:0]          rid_s16;
   wire [`DW_VIP_AXI_RRESP_PORT_WIDTH:0]        rresp_s16;

   wire [`DW_VIP_AXI_BID_PORT_WIDTH:0]          bid_s16;
   wire [`DW_VIP_AXI_BRESP_PORT_WIDTH:0]        bresp_s16;

 `ifdef AXI_HAS_ARSB
   wire [`AXI_AR_SBW-1:0] arsideband_s16;
   assign arsideband_s[16] = arsideband_s16;
 `endif
 `ifdef AXI_HAS_AWSB
   wire [`AXI_AW_SBW-1:0] awsideband_s16;
   assign awsideband_s[16] = awsideband_s16;
 `endif
 `ifdef AXI_HAS_RSB
   wire [`AXI_R_SBW-1:0] rsideband_s16;
   assign rsideband_s[16] = rsideband_s16;
 `endif
 `ifdef AXI_HAS_WSB
   wire [`AXI_W_SBW-1:0] wsideband_s16;
   assign wsideband_s[16] = wsideband_s16;
 `endif
 `ifdef AXI_HAS_BSB
   wire [`AXI_B_SBW-1:0] bsideband_s16;
   assign bsideband_s[16] = bsideband_s16;
 `endif

   assign araddr_s[16]  = araddr_s16;
   assign arid_s[16]    = arid_s16;
   assign arlen_s[16]   = arlen_s16;
   assign arsize_s[16]  = arsize_s16;
   assign arburst_s[16] = arburst_s16;
   assign arlock_s[16]  = arlock_s16;
   assign arprot_s[16]  = arprot_s16;
   assign arcache_s[16] = arcache_s16;

   assign awaddr_s[16]  = awaddr_s16;
   assign awid_s[16]    = awid_s16;
   assign awlen_s[16]   = awlen_s16;
   assign awsize_s[16]  = awsize_s16;
   assign awburst_s[16] = awburst_s16;
   assign awlock_s[16]  = awlock_s16;
   assign awprot_s[16]  = awprot_s16;
   assign awcache_s[16] = awcache_s16;

   assign wdata_s[16] = wdata_s16;
   assign wid_s[16]   = wid_s16;
   assign wstrb_s[16] = wstrb_s16;

   assign rdata_s[16] = rdata_s16;
   assign rid_s[16]   = rid_s16;
   assign rresp_s[16] = rresp_s16;

   assign bid_s[16]   = bid_s16;
   assign bresp_s[16] = bresp_s16;

   assign arvalid_s_bus[15] = arvalid_s[16];
   assign araddr_s_bus[ ((15 + 1) * `DW_VIP_AXI_ARADDR_PORT_WIDTH) -1:(15*`DW_VIP_AXI_ARADDR_PORT_WIDTH  )] = araddr_s16;
   assign arlen_s_bus[  ((15 + 1) * `DW_VIP_AXI_ARLEN_PORT_WIDTH)  -1:(15*`DW_VIP_AXI_ARLEN_PORT_WIDTH   )] = arlen_s16;
   assign arsize_s_bus[ ((15 + 1) * `DW_VIP_AXI_ARSIZE_PORT_WIDTH) -1:(15*`DW_VIP_AXI_ARSIZE_PORT_WIDTH  )] = arsize_s16;
   assign arburst_s_bus[((15 + 1) * `DW_VIP_AXI_ARBURST_PORT_WIDTH)-1:(15*`DW_VIP_AXI_ARBURST_PORT_WIDTH )] = arburst_s16;
   assign arlock_s_bus[ ((15 + 1) * `DW_VIP_AXI_ARLOCK_PORT_WIDTH) -1:(15*`DW_VIP_AXI_ARLOCK_PORT_WIDTH  )] = arlock_s16;
   assign arcache_s_bus[((15 + 1) * `DW_VIP_AXI_ARCACHE_PORT_WIDTH)-1:(15*`DW_VIP_AXI_ARCACHE_PORT_WIDTH )] = arcache_s16;
   assign arprot_s_bus[ ((15 + 1) * `DW_VIP_AXI_ARPROT_PORT_WIDTH) -1:(15*`DW_VIP_AXI_ARPROT_PORT_WIDTH  )] = arprot_s16;
   assign arid_s_bus[ ((15 + 1) * `DW_VIP_AXI_ARID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_ARID_PORT_WIDTH)] = arid_s16;
   assign arready_s[16] = arready_s_bus[15];

   assign awvalid_s_bus[15] = awvalid_s[16];
   assign awaddr_s_bus[ ((15 + 1) * `DW_VIP_AXI_AWADDR_PORT_WIDTH) -1:(15*`DW_VIP_AXI_AWADDR_PORT_WIDTH  )] = awaddr_s16;
   assign awlen_s_bus[  ((15 + 1) * `DW_VIP_AXI_AWLEN_PORT_WIDTH)  -1:(15*`DW_VIP_AXI_AWLEN_PORT_WIDTH   )] = awlen_s16;
   assign awsize_s_bus[ ((15 + 1) * `DW_VIP_AXI_AWSIZE_PORT_WIDTH) -1:(15*`DW_VIP_AXI_AWSIZE_PORT_WIDTH  )] = awsize_s16;
   assign awburst_s_bus[((15 + 1) * `DW_VIP_AXI_AWBURST_PORT_WIDTH)-1:(15*`DW_VIP_AXI_AWBURST_PORT_WIDTH )] = awburst_s16;
   assign awlock_s_bus[ ((15 + 1) * `DW_VIP_AXI_AWLOCK_PORT_WIDTH) -1:(15*`DW_VIP_AXI_AWLOCK_PORT_WIDTH  )] = awlock_s16;
   assign awcache_s_bus[((15 + 1) * `DW_VIP_AXI_AWCACHE_PORT_WIDTH)-1:(15*`DW_VIP_AXI_AWCACHE_PORT_WIDTH )] = awcache_s16;
   assign awprot_s_bus[ ((15 + 1) * `DW_VIP_AXI_AWPROT_PORT_WIDTH) -1:(15*`DW_VIP_AXI_AWPROT_PORT_WIDTH  )] = awprot_s16;
   assign awid_s_bus[ ((15 + 1) * `DW_VIP_AXI_AWID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_AWID_PORT_WIDTH)] =  awid_s16;
   assign awready_s[16] =  awready_s_bus[15];

   assign rvalid_s[16]= rvalid_s_bus[15];
   assign rlast_s[16] = rlast_s_bus[15];
   assign rdata_s16 = rdata_s_bus[((15 + 1) * `DW_VIP_AXI_RDATA_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RDATA_PORT_WIDTH)];
   assign rresp_s16 = rresp_s_bus[((15 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign rid_s16   = rid_s_bus[((15 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign rready_s_bus[15] = rready_s[16];

   assign wvalid_s_bus[15] = wvalid_s[16];
   assign wlast_s_bus[15]  = wlast_s[16];
   assign wdata_s_bus[((15 + 1) * `DW_VIP_AXI_WDATA_PORT_WIDTH)-1:(15*`DW_VIP_AXI_WDATA_PORT_WIDTH)] = wdata_s16;
   assign wstrb_s_bus[((15 + 1) * `DW_VIP_AXI_WSTRB_PORT_WIDTH)-1:(15*`DW_VIP_AXI_WSTRB_PORT_WIDTH)] = wstrb_s16;
   assign wid_s_bus[((15 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RID_PORT_WIDTH)] = wid_s16;
   assign wready_s[16] =  wready_s_bus[15];

   assign bvalid_s[16]=  bvalid_s_bus[15];
   assign bresp_s16 = bresp_s_bus[((15 + 1) * `DW_VIP_AXI_RRESP_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RRESP_PORT_WIDTH)];
   assign bid_s16   = bid_s_bus[((15 + 1) * `DW_VIP_AXI_RID_PORT_WIDTH)-1:(15*`DW_VIP_AXI_RID_PORT_WIDTH)];
   assign bready_s_bus[15] = bready_s[16];

 `ifdef AXI_HAS_RSB
   assign rsideband_s16 = {8{rdata_s_bus[(15*`DW_VIP_AXI_RDATA_PORT_WIDTH) + `AXI_DW-1:(15*`DW_VIP_AXI_RDATA_PORT_WIDTH)]}};
 `endif
 `ifdef AXI_HAS_BSB
   assign bsideband_s16 = {64{bid_s_bus[(15*`DW_VIP_AXI_BID_PORT_WIDTH) + `AXI_MIDW-1:(15*`DW_VIP_AXI_BID_PORT_WIDTH)]}};
 `endif
`endif

`ifdef AXI_HAS_S0
  assign  araddr_s0[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s0[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s0[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s0[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s0[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s0[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s0[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s0[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s0[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s0[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s0[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s0[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S1
  assign  araddr_s1[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s1[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s1[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s1[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s1[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s1[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s1[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s1[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s1[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s1[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s1[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s1[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S2
  assign  araddr_s2[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s2[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s2[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s2[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s2[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s2[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s2[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s2[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s2[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s2[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s2[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s2[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S3
  assign  araddr_s3[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s3[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s3[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s3[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s3[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s3[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s3[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s3[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s3[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s3[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s3[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s3[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S4
  assign  araddr_s4[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s4[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s4[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s4[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s4[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s4[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s4[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s4[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s4[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s4[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s4[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s4[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S5
  assign  araddr_s5[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s5[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s5[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s5[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s5[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s5[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s5[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s5[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s5[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s5[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s5[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s5[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S6
  assign  araddr_s6[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s6[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s6[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s6[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s6[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s6[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s6[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s6[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s6[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s6[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s6[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s6[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S7
  assign  araddr_s7[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s7[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s7[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s7[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s7[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s7[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s7[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s7[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s7[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s7[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s7[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s7[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S8
  assign  araddr_s8[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s8[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s8[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s8[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s8[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s8[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s8[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s8[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s8[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s8[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s8[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s8[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S9
  assign  araddr_s9[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s9[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s9[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s9[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s9[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s9[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s9[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s9[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s9[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s9[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s9[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s9[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S10
  assign  araddr_s10[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s10[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s10[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s10[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s10[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s10[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s10[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s10[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s10[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s10[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s10[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s10[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S11
  assign  araddr_s11[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s11[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s11[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s11[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s11[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s11[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s11[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s11[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s11[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s11[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s11[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s11[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S12
  assign  araddr_s12[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s12[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s12[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s12[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s12[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s12[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s12[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s12[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s12[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s12[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s12[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s12[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S13
  assign  araddr_s13[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s13[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s13[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s13[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s13[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s13[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s13[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s13[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s13[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s13[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s13[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s13[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S14
  assign  araddr_s14[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s14[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s14[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s14[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s14[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s14[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s14[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s14[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s14[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s14[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s14[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s14[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S15
  assign  araddr_s15[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s15[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s15[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s15[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s15[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s15[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s15[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s15[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s15[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s15[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s15[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s15[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S16
  assign  araddr_s16[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s16[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s16[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s16[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s16[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s16[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s16[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s16[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s16[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s16[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s16[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s16[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S17
  assign  araddr_s17[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s17[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s17[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s17[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s17[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s17[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s17[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s17[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s17[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s17[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s17[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s17[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S18
  assign  araddr_s18[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s18[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s18[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s18[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s18[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s18[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s18[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s18[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s18[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s18[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s18[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s18[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S19
  assign  araddr_s19[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s19[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s19[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s19[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s19[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s19[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s19[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s19[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s19[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s19[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s19[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s19[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S20
  assign  araddr_s20[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s20[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s20[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s20[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s20[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s20[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s20[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s20[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s20[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s20[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s20[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s20[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S21
  assign  araddr_s21[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s21[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s21[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s21[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s21[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s21[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s21[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s21[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s21[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s21[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s21[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s21[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S22
  assign  araddr_s22[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s22[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s22[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s22[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s22[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s22[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s22[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s22[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s22[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s22[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s22[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s22[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S23
  assign  araddr_s23[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s23[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s23[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s23[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s23[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s23[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s23[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s23[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s23[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s23[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s23[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s23[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S24
  assign  araddr_s24[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s24[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s24[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s24[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s24[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s24[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s24[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s24[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s24[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s24[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s24[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s24[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S25
  assign  araddr_s25[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s25[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s25[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s25[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s25[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s25[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s25[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s25[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s25[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s25[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s25[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s25[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S26
  assign  araddr_s26[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s26[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s26[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s26[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s26[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s26[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s26[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s26[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s26[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s26[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s26[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s26[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S27
  assign  araddr_s27[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s27[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s27[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s27[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s27[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s27[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s27[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s27[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s27[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s27[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s27[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s27[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S28
  assign  araddr_s28[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s28[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s28[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s28[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s28[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s28[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s28[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s28[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s28[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s28[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s28[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s28[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S29
  assign  araddr_s29[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s29[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s29[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s29[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s29[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s29[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s29[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s29[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s29[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s29[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s29[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s29[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S30
  assign  araddr_s30[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s30[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s30[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s30[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s30[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s30[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s30[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s30[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s30[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s30[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s30[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s30[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif
`ifdef AXI_HAS_S31
  assign  araddr_s31[`DW_VIP_AXI_ARADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  awaddr_s31[`DW_VIP_AXI_AWADDR_PORT_WIDTH:`AXI_AW] = 0;
  assign  arid_s31[`DW_VIP_AXI_ARID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  awid_s31[`DW_VIP_AXI_AWID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  arlen_s31[`DW_VIP_AXI_ARLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  awlen_s31[`DW_VIP_AXI_AWLEN_PORT_WIDTH:`AXI_BLW] = 0;
  assign  wstrb_s31[`DW_VIP_AXI_WSTRB_PORT_WIDTH:`AXI_SW] = 0;
  assign  rid_s31[`DW_VIP_AXI_RID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  bid_s31[`DW_VIP_AXI_BID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  wid_s31[`DW_VIP_AXI_WID_PORT_WIDTH:`AXI_SIDW] = 0;
  assign  rdata_s31[`DW_VIP_AXI_RDATA_PORT_WIDTH:`AXI_DW] = 0;
  assign  wdata_s31[`DW_VIP_AXI_WDATA_PORT_WIDTH:`AXI_DW] = 0;
`endif

// Instantiates AXI Monitor VIP
   axi_monitor_vmt axi_monitor (
                                .aclk (aclk)
                                ,.aresetn (aresetn)

// 18/2/2008
// *valid inputs to the monitor are always connected. Required because
// for bi-directional command flow (multi interconnect) testing we tell the
// monitor that there are more masters than exist in the config we are
// testing. The monitor will fail with an error if non binary values are
// connected to the monitor ports of these "extra" masters.
                                ,.arvalid_m0 (arvalid_m_sys[1])
                                ,.awvalid_m0 (awvalid_m_sys[1])
                                ,.wvalid_m0  (wvalid_m_sys[1])
                                ,.rvalid_m0  (rvalid_m_sys[1])
                                ,.bvalid_m0  (bvalid_m_sys[1])

                                ,.arvalid_m1 (arvalid_m_sys[2])
                                ,.awvalid_m1 (awvalid_m_sys[2])
                                ,.wvalid_m1  (wvalid_m_sys[2])
                                ,.rvalid_m1  (rvalid_m_sys[2])
                                ,.bvalid_m1  (bvalid_m_sys[2])

                                ,.arvalid_m2 (arvalid_m_sys[3])
                                ,.awvalid_m2 (awvalid_m_sys[3])
                                ,.wvalid_m2  (wvalid_m_sys[3])
                                ,.rvalid_m2  (rvalid_m_sys[3])
                                ,.bvalid_m2  (bvalid_m_sys[3])

                                ,.arvalid_m3 (arvalid_m_sys[4])
                                ,.awvalid_m3 (awvalid_m_sys[4])
                                ,.wvalid_m3  (wvalid_m_sys[4])
                                ,.rvalid_m3  (rvalid_m_sys[4])
                                ,.bvalid_m3  (bvalid_m_sys[4])

                                ,.arvalid_m4 (arvalid_m_sys[5])
                                ,.awvalid_m4 (awvalid_m_sys[5])
                                ,.wvalid_m4  (wvalid_m_sys[5])
                                ,.rvalid_m4  (rvalid_m_sys[5])
                                ,.bvalid_m4  (bvalid_m_sys[5])

                                ,.arvalid_m5 (arvalid_m_sys[6])
                                ,.awvalid_m5 (awvalid_m_sys[6])
                                ,.wvalid_m5  (wvalid_m_sys[6])
                                ,.rvalid_m5  (rvalid_m_sys[6])
                                ,.bvalid_m5  (bvalid_m_sys[6])

                                ,.arvalid_m6 (arvalid_m_sys[7])
                                ,.awvalid_m6 (awvalid_m_sys[7])
                                ,.wvalid_m6  (wvalid_m_sys[7])
                                ,.rvalid_m6  (rvalid_m_sys[7])
                                ,.bvalid_m6  (bvalid_m_sys[7])

                                ,.arvalid_m7 (arvalid_m_sys[8])
                                ,.awvalid_m7 (awvalid_m_sys[8])
                                ,.wvalid_m7  (wvalid_m_sys[8])
                                ,.rvalid_m7  (rvalid_m_sys[8])
                                ,.bvalid_m7  (bvalid_m_sys[8])

                                ,.arvalid_m8 (arvalid_m_sys[9])
                                ,.awvalid_m8 (awvalid_m_sys[9])
                                ,.wvalid_m8  (wvalid_m_sys[9])
                                ,.rvalid_m8  (rvalid_m_sys[9])
                                ,.bvalid_m8  (bvalid_m_sys[9])

                                ,.arvalid_m9 (arvalid_m_sys[10])
                                ,.awvalid_m9 (awvalid_m_sys[10])
                                ,.wvalid_m9  (wvalid_m_sys[10])
                                ,.rvalid_m9  (rvalid_m_sys[10])
                                ,.bvalid_m9  (bvalid_m_sys[10])

                                ,.arvalid_m10 (arvalid_m_sys[11])
                                ,.awvalid_m10 (awvalid_m_sys[11])
                                ,.wvalid_m10  (wvalid_m_sys[11])
                                ,.rvalid_m10  (rvalid_m_sys[11])
                                ,.bvalid_m10  (bvalid_m_sys[11])

                                ,.arvalid_m11 (arvalid_m_sys[12])
                                ,.awvalid_m11 (awvalid_m_sys[12])
                                ,.wvalid_m11  (wvalid_m_sys[12])
                                ,.rvalid_m11  (rvalid_m_sys[12])
                                ,.bvalid_m11  (bvalid_m_sys[12])

                                ,.arvalid_m12 (arvalid_m_sys[13])
                                ,.awvalid_m12 (awvalid_m_sys[13])
                                ,.wvalid_m12  (wvalid_m_sys[13])
                                ,.rvalid_m12  (rvalid_m_sys[13])
                                ,.bvalid_m12  (bvalid_m_sys[13])

                                ,.arvalid_m13 (arvalid_m_sys[14])
                                ,.awvalid_m13 (awvalid_m_sys[14])
                                ,.wvalid_m13  (wvalid_m_sys[14])
                                ,.rvalid_m13  (rvalid_m_sys[14])
                                ,.bvalid_m13  (bvalid_m_sys[14])

                                ,.arvalid_m14 (arvalid_m_sys[15])
                                ,.awvalid_m14 (awvalid_m_sys[15])
                                ,.wvalid_m14  (wvalid_m_sys[15])
                                ,.rvalid_m14  (rvalid_m_sys[15])
                                ,.bvalid_m14  (bvalid_m_sys[15])

                                ,.arvalid_m15 (arvalid_m_sys[16])
                                ,.awvalid_m15 (awvalid_m_sys[16])
                                ,.wvalid_m15  (wvalid_m_sys[16])
                                ,.rvalid_m15  (rvalid_m_sys[16])
                                ,.bvalid_m15  (bvalid_m_sys[16])

                                ,.arvalid_m16 (arvalid_m_sys[17])
                                ,.awvalid_m16 (awvalid_m_sys[17])
                                ,.wvalid_m16  (wvalid_m_sys[17])
                                ,.rvalid_m16  (rvalid_m_sys[17])
                                ,.bvalid_m16  (bvalid_m_sys[17])

                                ,.arvalid_m17 (arvalid_m_sys[18])
                                ,.awvalid_m17 (awvalid_m_sys[18])
                                ,.wvalid_m17  (wvalid_m_sys[18])
                                ,.rvalid_m17  (rvalid_m_sys[18])
                                ,.bvalid_m17  (bvalid_m_sys[18])

                                ,.arvalid_m18 (arvalid_m_sys[19])
                                ,.awvalid_m18 (awvalid_m_sys[19])
                                ,.wvalid_m18  (wvalid_m_sys[19])
                                ,.rvalid_m18  (rvalid_m_sys[19])
                                ,.bvalid_m18  (bvalid_m_sys[19])

                                ,.arvalid_m19 (arvalid_m_sys[20])
                                ,.awvalid_m19 (awvalid_m_sys[20])
                                ,.wvalid_m19  (wvalid_m_sys[20])
                                ,.rvalid_m19  (rvalid_m_sys[20])
                                ,.bvalid_m19  (bvalid_m_sys[20])

                                ,.arvalid_m20 (arvalid_m_sys[21])
                                ,.awvalid_m20 (awvalid_m_sys[21])
                                ,.wvalid_m20  (wvalid_m_sys[21])
                                ,.rvalid_m20  (rvalid_m_sys[21])
                                ,.bvalid_m20  (bvalid_m_sys[21])

                                ,.arvalid_m21 (arvalid_m_sys[22])
                                ,.awvalid_m21 (awvalid_m_sys[22])
                                ,.wvalid_m21  (wvalid_m_sys[22])
                                ,.rvalid_m21  (rvalid_m_sys[22])
                                ,.bvalid_m21  (bvalid_m_sys[22])

                                ,.arvalid_m22 (arvalid_m_sys[23])
                                ,.awvalid_m22 (awvalid_m_sys[23])
                                ,.wvalid_m22  (wvalid_m_sys[23])
                                ,.rvalid_m22  (rvalid_m_sys[23])
                                ,.bvalid_m22  (bvalid_m_sys[23])

                                ,.arvalid_m23 (arvalid_m_sys[24])
                                ,.awvalid_m23 (awvalid_m_sys[24])
                                ,.wvalid_m23  (wvalid_m_sys[24])
                                ,.rvalid_m23  (rvalid_m_sys[24])
                                ,.bvalid_m23  (bvalid_m_sys[24])

                                ,.arvalid_m24 (arvalid_m_sys[25])
                                ,.awvalid_m24 (awvalid_m_sys[25])
                                ,.wvalid_m24  (wvalid_m_sys[25])
                                ,.rvalid_m24  (rvalid_m_sys[25])
                                ,.bvalid_m24  (bvalid_m_sys[25])

                                ,.arvalid_m25 (arvalid_m_sys[26])
                                ,.awvalid_m25 (awvalid_m_sys[26])
                                ,.wvalid_m25  (wvalid_m_sys[26])
                                ,.rvalid_m25  (rvalid_m_sys[26])
                                ,.bvalid_m25  (bvalid_m_sys[26])

                                ,.arvalid_m26 (arvalid_m_sys[27])
                                ,.awvalid_m26 (awvalid_m_sys[27])
                                ,.wvalid_m26  (wvalid_m_sys[27])
                                ,.rvalid_m26  (rvalid_m_sys[27])
                                ,.bvalid_m26  (bvalid_m_sys[27])

                                ,.arvalid_m27 (arvalid_m_sys[28])
                                ,.awvalid_m27 (awvalid_m_sys[28])
                                ,.wvalid_m27  (wvalid_m_sys[28])
                                ,.rvalid_m27  (rvalid_m_sys[28])
                                ,.bvalid_m27  (bvalid_m_sys[28])

                                ,.arvalid_m28 (arvalid_m_sys[29])
                                ,.awvalid_m28 (awvalid_m_sys[29])
                                ,.wvalid_m28  (wvalid_m_sys[29])
                                ,.rvalid_m28  (rvalid_m_sys[29])
                                ,.bvalid_m28  (bvalid_m_sys[29])

                                ,.arvalid_m29 (arvalid_m_sys[30])
                                ,.awvalid_m29 (awvalid_m_sys[30])
                                ,.wvalid_m29  (wvalid_m_sys[30])
                                ,.rvalid_m29  (rvalid_m_sys[30])
                                ,.bvalid_m29  (bvalid_m_sys[30])

                                ,.arvalid_m30 (arvalid_m_sys[31])
                                ,.awvalid_m30 (awvalid_m_sys[31])
                                ,.wvalid_m30  (wvalid_m_sys[31])
                                ,.rvalid_m30  (rvalid_m_sys[31])
                                ,.bvalid_m30  (bvalid_m_sys[31])

                                ,.arvalid_m31 (arvalid_m_sys[32])
                                ,.awvalid_m31 (awvalid_m_sys[32])
                                ,.wvalid_m31  (wvalid_m_sys[32])
                                ,.rvalid_m31  (rvalid_m_sys[32])
                                ,.bvalid_m31  (bvalid_m_sys[32])

`ifdef AXI_HAS_M1
                                ,.araddr_m0 (araddr_m1)
                                ,.arlen_m0 (arlen_m1)
                                ,.arsize_m0 (arsize_m1)
                                ,.arburst_m0 (arburst_m1)
                                ,.arlock_m0 (arlock_m1)
                                ,.arcache_m0 (arcache_m1)
                                ,.arprot_m0 (arprot_m1)
                                ,.arid_m0 (arid_m1)
                                ,.arready_m0 (arready_m[1])
                                ,.awaddr_m0 (awaddr_m1)
                                ,.awlen_m0 (awlen_m1)
                                ,.awsize_m0 (awsize_m1)
                                ,.awlock_m0 (awlock_m1)
                                ,.awburst_m0 (awburst_m1)
                                ,.awcache_m0 (awcache_m1)
                                ,.awprot_m0 (awprot_m1)
                                ,.awid_m0 (awid_m1)
                                ,.awready_m0 (awready_m[1])
                                ,.rlast_m0 (rlast_m[1])
                                ,.rdata_m0 (rdata_m1)
                                ,.rresp_m0 (rresp_m1)
                                ,.rid_m0 (rid_mon_m1)
                                ,.rready_m0 (rready_m[1])
                                ,.wlast_m0 (wlast_m[1])
                                ,.wdata_m0 (wdata_m1)
                                ,.wstrb_m0 (wstrb_m1)
                                ,.wid_m0 (wid_m1)
                                ,.wready_m0 (wready_m[1])
                                ,.bresp_m0 (bresp_m1)
                                ,.bid_m0 (bid_mon_m1)
                                ,.bready_m0 (bready_m[1])
                                ,.cactive_m0 (cactive_m_bus[0])
                                ,.csysreq_m0 (csysreq_m_bus[0])
                                ,.csysack_m0 (csysack_m_bus[0])
`endif
`ifdef AXI_HAS_M2
                                ,.araddr_m1 (araddr_m2)
                                ,.arlen_m1 (arlen_m2)
                                ,.arsize_m1 (arsize_m2)
                                ,.arburst_m1 (arburst_m2)
                                ,.arlock_m1 (arlock_m2)
                                ,.arcache_m1 (arcache_m2)
                                ,.arprot_m1 (arprot_m2)
                                ,.arid_m1 (arid_m2)
                                ,.arready_m1 (arready_m[2])
                                ,.awaddr_m1 (awaddr_m2)
                                ,.awlen_m1 (awlen_m2)
                                ,.awsize_m1 (awsize_m2)
                                ,.awlock_m1 (awlock_m2)
                                ,.awburst_m1 (awburst_m2)
                                ,.awcache_m1 (awcache_m2)
                                ,.awprot_m1 (awprot_m2)
                                ,.awid_m1 (awid_m2)
                                ,.awready_m1 (awready_m[2])
                                ,.rlast_m1 (rlast_m[2])
                                ,.rdata_m1 (rdata_m2)
                                ,.rresp_m1 (rresp_m2)
                                ,.rid_m1 (rid_mon_m2)
                                ,.rready_m1 (rready_m[2])
                                ,.wlast_m1 (wlast_m[2])
                                ,.wdata_m1 (wdata_m2)
                                ,.wstrb_m1 (wstrb_m2)
                                ,.wid_m1 (wid_m2)
                                ,.wready_m1 (wready_m[2])
                                ,.bresp_m1 (bresp_m2)
                                ,.bid_m1 (bid_mon_m2)
                                ,.bready_m1 (bready_m[2])
                                ,.cactive_m1 (cactive_m_bus[1])
                                ,.csysreq_m1 (csysreq_m_bus[1])
                                ,.csysack_m1 (csysack_m_bus[1])
`endif
`ifdef AXI_HAS_M3
                                ,.araddr_m2 (araddr_m3)
                                ,.arlen_m2 (arlen_m3)
                                ,.arsize_m2 (arsize_m3)
                                ,.arburst_m2 (arburst_m3)
                                ,.arlock_m2 (arlock_m3)
                                ,.arcache_m2 (arcache_m3)
                                ,.arprot_m2 (arprot_m3)
                                ,.arid_m2 (arid_m3)
                                ,.arready_m2 (arready_m[3])
                                ,.awaddr_m2 (awaddr_m3)
                                ,.awlen_m2 (awlen_m3)
                                ,.awsize_m2 (awsize_m3)
                                ,.awlock_m2 (awlock_m3)
                                ,.awburst_m2 (awburst_m3)
                                ,.awcache_m2 (awcache_m3)
                                ,.awprot_m2 (awprot_m3)
                                ,.awid_m2 (awid_m3)
                                ,.awready_m2 (awready_m[3])
                                ,.rlast_m2 (rlast_m[3])
                                ,.rdata_m2 (rdata_m3)
                                ,.rresp_m2 (rresp_m3)
                                ,.rid_m2 (rid_mon_m3)
                                ,.rready_m2 (rready_m[3])
                                ,.wlast_m2 (wlast_m[3])
                                ,.wdata_m2 (wdata_m3)
                                ,.wstrb_m2 (wstrb_m3)
                                ,.wid_m2 (wid_m3)
                                ,.wready_m2 (wready_m[3])
                                ,.bresp_m2 (bresp_m3)
                                ,.bid_m2 (bid_mon_m3)
                                ,.bready_m2 (bready_m[3])
                                ,.cactive_m2 (cactive_m_bus[2])
                                ,.csysreq_m2 (csysreq_m_bus[2])
                                ,.csysack_m2 (csysack_m_bus[2])
`endif
`ifdef AXI_HAS_M4
                                ,.araddr_m3 (araddr_m4)
                                ,.arlen_m3 (arlen_m4)
                                ,.arsize_m3 (arsize_m4)
                                ,.arburst_m3 (arburst_m4)
                                ,.arlock_m3 (arlock_m4)
                                ,.arcache_m3 (arcache_m4)
                                ,.arprot_m3 (arprot_m4)
                                ,.arid_m3 (arid_m4)
                                ,.arready_m3 (arready_m[4])
                                ,.awaddr_m3 (awaddr_m4)
                                ,.awlen_m3 (awlen_m4)
                                ,.awsize_m3 (awsize_m4)
                                ,.awlock_m3 (awlock_m4)
                                ,.awburst_m3 (awburst_m4)
                                ,.awcache_m3 (awcache_m4)
                                ,.awprot_m3 (awprot_m4)
                                ,.awid_m3 (awid_m4)
                                ,.awready_m3 (awready_m[4])
                                ,.rlast_m3 (rlast_m[4])
                                ,.rdata_m3 (rdata_m4)
                                ,.rresp_m3 (rresp_m4)
                                ,.rid_m3 (rid_mon_m4)
                                ,.rready_m3 (rready_m[4])
                                ,.wlast_m3 (wlast_m[4])
                                ,.wdata_m3 (wdata_m4)
                                ,.wstrb_m3 (wstrb_m4)
                                ,.wid_m3 (wid_m4)
                                ,.wready_m3 (wready_m[4])
                                ,.bresp_m3 (bresp_m4)
                                ,.bid_m3 (bid_mon_m4)
                                ,.bready_m3 (bready_m[4])
                                ,.cactive_m3 (cactive_m_bus[3])
                                ,.csysreq_m3 (csysreq_m_bus[3])
                                ,.csysack_m3 (csysack_m_bus[3])
`endif
`ifdef AXI_HAS_M5
                                ,.araddr_m4 (araddr_m5)
                                ,.arlen_m4 (arlen_m5)
                                ,.arsize_m4 (arsize_m5)
                                ,.arburst_m4 (arburst_m5)
                                ,.arlock_m4 (arlock_m5)
                                ,.arcache_m4 (arcache_m5)
                                ,.arprot_m4 (arprot_m5)
                                ,.arid_m4 (arid_m5)
                                ,.arready_m4 (arready_m[5])
                                ,.awaddr_m4 (awaddr_m5)
                                ,.awlen_m4 (awlen_m5)
                                ,.awsize_m4 (awsize_m5)
                                ,.awlock_m4 (awlock_m5)
                                ,.awburst_m4 (awburst_m5)
                                ,.awcache_m4 (awcache_m5)
                                ,.awprot_m4 (awprot_m5)
                                ,.awid_m4 (awid_m5)
                                ,.awready_m4 (awready_m[5])
                                ,.rlast_m4 (rlast_m[5])
                                ,.rdata_m4 (rdata_m5)
                                ,.rresp_m4 (rresp_m5)
                                ,.rid_m4 (rid_mon_m5)
                                ,.rready_m4 (rready_m[5])
                                ,.wlast_m4 (wlast_m[5])
                                ,.wdata_m4 (wdata_m5)
                                ,.wstrb_m4 (wstrb_m5)
                                ,.wid_m4 (wid_m5)
                                ,.wready_m4 (wready_m[5])
                                ,.bresp_m4 (bresp_m5)
                                ,.bid_m4 (bid_mon_m5)
                                ,.bready_m4 (bready_m[5])
                                ,.cactive_m4 (cactive_m_bus[4])
                                ,.csysreq_m4 (csysreq_m_bus[4])
                                ,.csysack_m4 (csysack_m_bus[4])
`endif
`ifdef AXI_HAS_M6
                                ,.araddr_m5 (araddr_m6)
                                ,.arlen_m5 (arlen_m6)
                                ,.arsize_m5 (arsize_m6)
                                ,.arburst_m5 (arburst_m6)
                                ,.arlock_m5 (arlock_m6)
                                ,.arcache_m5 (arcache_m6)
                                ,.arprot_m5 (arprot_m6)
                                ,.arid_m5 (arid_m6)
                                ,.arready_m5 (arready_m[6])
                                ,.awaddr_m5 (awaddr_m6)
                                ,.awlen_m5 (awlen_m6)
                                ,.awsize_m5 (awsize_m6)
                                ,.awlock_m5 (awlock_m6)
                                ,.awburst_m5 (awburst_m6)
                                ,.awcache_m5 (awcache_m6)
                                ,.awprot_m5 (awprot_m6)
                                ,.awid_m5 (awid_m6)
                                ,.awready_m5 (awready_m[6])
                                ,.rlast_m5 (rlast_m[6])
                                ,.rdata_m5 (rdata_m6)
                                ,.rresp_m5 (rresp_m6)
                                ,.rid_m5 (rid_mon_m6)
                                ,.rready_m5 (rready_m[6])
                                ,.wlast_m5 (wlast_m[6])
                                ,.wdata_m5 (wdata_m6)
                                ,.wstrb_m5 (wstrb_m6)
                                ,.wid_m5 (wid_m6)
                                ,.wready_m5 (wready_m[6])
                                ,.bresp_m5 (bresp_m6)
                                ,.bid_m5 (bid_mon_m6)
                                ,.bready_m5 (bready_m[6])
                                ,.cactive_m5 (cactive_m_bus[5])
                                ,.csysreq_m5 (csysreq_m_bus[5])
                                ,.csysack_m5 (csysack_m_bus[5])
`endif
`ifdef AXI_HAS_M7
                                ,.araddr_m6 (araddr_m7)
                                ,.arlen_m6 (arlen_m7)
                                ,.arsize_m6 (arsize_m7)
                                ,.arburst_m6 (arburst_m7)
                                ,.arlock_m6 (arlock_m7)
                                ,.arcache_m6 (arcache_m7)
                                ,.arprot_m6 (arprot_m7)
                                ,.arid_m6 (arid_m7)
                                ,.arready_m6 (arready_m[7])
                                ,.awaddr_m6 (awaddr_m7)
                                ,.awlen_m6 (awlen_m7)
                                ,.awsize_m6 (awsize_m7)
                                ,.awlock_m6 (awlock_m7)
                                ,.awburst_m6 (awburst_m7)
                                ,.awcache_m6 (awcache_m7)
                                ,.awprot_m6 (awprot_m7)
                                ,.awid_m6 (awid_m7)
                                ,.awready_m6 (awready_m[7])
                                ,.rlast_m6 (rlast_m[7])
                                ,.rdata_m6 (rdata_m7)
                                ,.rresp_m6 (rresp_m7)
                                ,.rid_m6 (rid_mon_m7)
                                ,.rready_m6 (rready_m[7])
                                ,.wlast_m6 (wlast_m[7])
                                ,.wdata_m6 (wdata_m7)
                                ,.wstrb_m6 (wstrb_m7)
                                ,.wid_m6 (wid_m7)
                                ,.wready_m6 (wready_m[7])
                                ,.bresp_m6 (bresp_m7)
                                ,.bid_m6 (bid_mon_m7)
                                ,.bready_m6 (bready_m[7])
                                ,.cactive_m6 (cactive_m_bus[6])
                                ,.csysreq_m6 (csysreq_m_bus[6])
                                ,.csysack_m6 (csysack_m_bus[6])
`endif
`ifdef AXI_HAS_M8
                                ,.araddr_m7 (araddr_m8)
                                ,.arlen_m7 (arlen_m8)
                                ,.arsize_m7 (arsize_m8)
                                ,.arburst_m7 (arburst_m8)
                                ,.arlock_m7 (arlock_m8)
                                ,.arcache_m7 (arcache_m8)
                                ,.arprot_m7 (arprot_m8)
                                ,.arid_m7 (arid_m8)
                                ,.arready_m7 (arready_m[8])
                                ,.awaddr_m7 (awaddr_m8)
                                ,.awlen_m7 (awlen_m8)
                                ,.awsize_m7 (awsize_m8)
                                ,.awlock_m7 (awlock_m8)
                                ,.awburst_m7 (awburst_m8)
                                ,.awcache_m7 (awcache_m8)
                                ,.awprot_m7 (awprot_m8)
                                ,.awid_m7 (awid_m8)
                                ,.awready_m7 (awready_m[8])
                                ,.rlast_m7 (rlast_m[8])
                                ,.rdata_m7 (rdata_m8)
                                ,.rresp_m7 (rresp_m8)
                                ,.rid_m7 (rid_mon_m8)
                                ,.rready_m7 (rready_m[8])
                                ,.wlast_m7 (wlast_m[8])
                                ,.wdata_m7 (wdata_m8)
                                ,.wstrb_m7 (wstrb_m8)
                                ,.wid_m7 (wid_m8)
                                ,.wready_m7 (wready_m[8])
                                ,.bresp_m7 (bresp_m8)
                                ,.bid_m7 (bid_mon_m8)
                                ,.bready_m7 (bready_m[8])
                                ,.cactive_m7 (cactive_m_bus[7])
                                ,.csysreq_m7 (csysreq_m_bus[7])
                                ,.csysack_m7 (csysack_m_bus[7])
`endif
`ifdef AXI_HAS_M9
                                ,.araddr_m8 (araddr_m9)
                                ,.arlen_m8 (arlen_m9)
                                ,.arsize_m8 (arsize_m9)
                                ,.arburst_m8 (arburst_m9)
                                ,.arlock_m8 (arlock_m9)
                                ,.arcache_m8 (arcache_m9)
                                ,.arprot_m8 (arprot_m9)
                                ,.arid_m8 (arid_m9)
                                ,.arready_m8 (arready_m[9])
                                ,.awaddr_m8 (awaddr_m9)
                                ,.awlen_m8 (awlen_m9)
                                ,.awsize_m8 (awsize_m9)
                                ,.awlock_m8 (awlock_m9)
                                ,.awburst_m8 (awburst_m9)
                                ,.awcache_m8 (awcache_m9)
                                ,.awprot_m8 (awprot_m9)
                                ,.awid_m8 (awid_m9)
                                ,.awready_m8 (awready_m[9])
                                ,.rlast_m8 (rlast_m[9])
                                ,.rdata_m8 (rdata_m9)
                                ,.rresp_m8 (rresp_m9)
                                ,.rid_m8 (rid_mon_m9)
                                ,.rready_m8 (rready_m[9])
                                ,.wlast_m8 (wlast_m[9])
                                ,.wdata_m8 (wdata_m9)
                                ,.wstrb_m8 (wstrb_m9)
                                ,.wid_m8 (wid_m9)
                                ,.wready_m8 (wready_m[9])
                                ,.bresp_m8 (bresp_m9)
                                ,.bid_m8 (bid_mon_m9)
                                ,.bready_m8 (bready_m[9])
                                ,.cactive_m8 (cactive_m_bus[8])
                                ,.csysreq_m8 (csysreq_m_bus[8])
                                ,.csysack_m8 (csysack_m_bus[8])
`endif
`ifdef AXI_HAS_M10
                                ,.araddr_m9 (araddr_m10)
                                ,.arlen_m9 (arlen_m10)
                                ,.arsize_m9 (arsize_m10)
                                ,.arburst_m9 (arburst_m10)
                                ,.arlock_m9 (arlock_m10)
                                ,.arcache_m9 (arcache_m10)
                                ,.arprot_m9 (arprot_m10)
                                ,.arid_m9 (arid_m10)
                                ,.arready_m9 (arready_m[10])
                                ,.awaddr_m9 (awaddr_m10)
                                ,.awlen_m9 (awlen_m10)
                                ,.awsize_m9 (awsize_m10)
                                ,.awlock_m9 (awlock_m10)
                                ,.awburst_m9 (awburst_m10)
                                ,.awcache_m9 (awcache_m10)
                                ,.awprot_m9 (awprot_m10)
                                ,.awid_m9 (awid_m10)
                                ,.awready_m9 (awready_m[10])
                                ,.rlast_m9 (rlast_m[10])
                                ,.rdata_m9 (rdata_m10)
                                ,.rresp_m9 (rresp_m10)
                                ,.rid_m9 (rid_mon_m10)
                                ,.rready_m9 (rready_m[10])
                                ,.wlast_m9 (wlast_m[10])
                                ,.wdata_m9 (wdata_m10)
                                ,.wstrb_m9 (wstrb_m10)
                                ,.wid_m9 (wid_m10)
                                ,.wready_m9 (wready_m[10])
                                ,.bresp_m9 (bresp_m10)
                                ,.bid_m9 (bid_mon_m10)
                                ,.bready_m9 (bready_m[10])
                                ,.cactive_m9 (cactive_m_bus[9])
                                ,.csysreq_m9 (csysreq_m_bus[9])
                                ,.csysack_m9 (csysack_m_bus[9])
`endif
`ifdef AXI_HAS_M11
                                ,.araddr_m10 (araddr_m11)
                                ,.arlen_m10 (arlen_m11)
                                ,.arsize_m10 (arsize_m11)
                                ,.arburst_m10 (arburst_m11)
                                ,.arlock_m10 (arlock_m11)
                                ,.arcache_m10 (arcache_m11)
                                ,.arprot_m10 (arprot_m11)
                                ,.arid_m10 (arid_m11)
                                ,.arready_m10 (arready_m[11])
                                ,.awaddr_m10 (awaddr_m11)
                                ,.awlen_m10 (awlen_m11)
                                ,.awsize_m10 (awsize_m11)
                                ,.awlock_m10 (awlock_m11)
                                ,.awburst_m10 (awburst_m11)
                                ,.awcache_m10 (awcache_m11)
                                ,.awprot_m10 (awprot_m11)
                                ,.awid_m10 (awid_m11)
                                ,.awready_m10 (awready_m[11])
                                ,.rlast_m10 (rlast_m[11])
                                ,.rdata_m10 (rdata_m11)
                                ,.rresp_m10 (rresp_m11)
                                ,.rid_m10 (rid_mon_m11)
                                ,.rready_m10 (rready_m[11])
                                ,.wlast_m10 (wlast_m[11])
                                ,.wdata_m10 (wdata_m11)
                                ,.wstrb_m10 (wstrb_m11)
                                ,.wid_m10 (wid_m11)
                                ,.wready_m10 (wready_m[11])
                                ,.bresp_m10 (bresp_m11)
                                ,.bid_m10 (bid_mon_m11)
                                ,.bready_m10 (bready_m[11])
                                ,.cactive_m10 (cactive_m_bus[10])
                                ,.csysreq_m10 (csysreq_m_bus[10])
                                ,.csysack_m10 (csysack_m_bus[10])
`endif
`ifdef AXI_HAS_M12
                                ,.araddr_m11 (araddr_m12)
                                ,.arlen_m11 (arlen_m12)
                                ,.arsize_m11 (arsize_m12)
                                ,.arburst_m11 (arburst_m12)
                                ,.arlock_m11 (arlock_m12)
                                ,.arcache_m11 (arcache_m12)
                                ,.arprot_m11 (arprot_m12)
                                ,.arid_m11 (arid_m12)
                                ,.arready_m11 (arready_m[12])
                                ,.awaddr_m11 (awaddr_m12)
                                ,.awlen_m11 (awlen_m12)
                                ,.awsize_m11 (awsize_m12)
                                ,.awlock_m11 (awlock_m12)
                                ,.awburst_m11 (awburst_m12)
                                ,.awcache_m11 (awcache_m12)
                                ,.awprot_m11 (awprot_m12)
                                ,.awid_m11 (awid_m12)
                                ,.awready_m11 (awready_m[12])
                                ,.rlast_m11 (rlast_m[12])
                                ,.rdata_m11 (rdata_m12)
                                ,.rresp_m11 (rresp_m12)
                                ,.rid_m11 (rid_mon_m12)
                                ,.rready_m11 (rready_m[12])
                                ,.wlast_m11 (wlast_m[12])
                                ,.wdata_m11 (wdata_m12)
                                ,.wstrb_m11 (wstrb_m12)
                                ,.wid_m11 (wid_m12)
                                ,.wready_m11 (wready_m[12])
                                ,.bresp_m11 (bresp_m12)
                                ,.bid_m11 (bid_mon_m12)
                                ,.bready_m11 (bready_m[12])
                                ,.cactive_m11 (cactive_m_bus[11])
                                ,.csysreq_m11 (csysreq_m_bus[11])
                                ,.csysack_m11 (csysack_m_bus[11])
`endif
`ifdef AXI_HAS_M13
                                ,.araddr_m12 (araddr_m13)
                                ,.arlen_m12 (arlen_m13)
                                ,.arsize_m12 (arsize_m13)
                                ,.arburst_m12 (arburst_m13)
                                ,.arlock_m12 (arlock_m13)
                                ,.arcache_m12 (arcache_m13)
                                ,.arprot_m12 (arprot_m13)
                                ,.arid_m12 (arid_m13)
                                ,.arready_m12 (arready_m[13])
                                ,.awaddr_m12 (awaddr_m13)
                                ,.awlen_m12 (awlen_m13)
                                ,.awsize_m12 (awsize_m13)
                                ,.awlock_m12 (awlock_m13)
                                ,.awburst_m12 (awburst_m13)
                                ,.awcache_m12 (awcache_m13)
                                ,.awprot_m12 (awprot_m13)
                                ,.awid_m12 (awid_m13)
                                ,.awready_m12 (awready_m[13])
                                ,.rlast_m12 (rlast_m[13])
                                ,.rdata_m12 (rdata_m13)
                                ,.rresp_m12 (rresp_m13)
                                ,.rid_m12 (rid_mon_m13)
                                ,.rready_m12 (rready_m[13])
                                ,.wlast_m12 (wlast_m[13])
                                ,.wdata_m12 (wdata_m13)
                                ,.wstrb_m12 (wstrb_m13)
                                ,.wid_m12 (wid_m13)
                                ,.wready_m12 (wready_m[13])
                                ,.bresp_m12 (bresp_m13)
                                ,.bid_m12 (bid_mon_m13)
                                ,.bready_m12 (bready_m[13])
                                ,.cactive_m12 (cactive_m_bus[12])
                                ,.csysreq_m12 (csysreq_m_bus[12])
                                ,.csysack_m12 (csysack_m_bus[12])
`endif
`ifdef AXI_HAS_M14
                                ,.araddr_m13 (araddr_m14)
                                ,.arlen_m13 (arlen_m14)
                                ,.arsize_m13 (arsize_m14)
                                ,.arburst_m13 (arburst_m14)
                                ,.arlock_m13 (arlock_m14)
                                ,.arcache_m13 (arcache_m14)
                                ,.arprot_m13 (arprot_m14)
                                ,.arid_m13 (arid_m14)
                                ,.arready_m13 (arready_m[14])
                                ,.awaddr_m13 (awaddr_m14)
                                ,.awlen_m13 (awlen_m14)
                                ,.awsize_m13 (awsize_m14)
                                ,.awlock_m13 (awlock_m14)
                                ,.awburst_m13 (awburst_m14)
                                ,.awcache_m13 (awcache_m14)
                                ,.awprot_m13 (awprot_m14)
                                ,.awid_m13 (awid_m14)
                                ,.awready_m13 (awready_m[14])
                                ,.rlast_m13 (rlast_m[14])
                                ,.rdata_m13 (rdata_m14)
                                ,.rresp_m13 (rresp_m14)
                                ,.rid_m13 (rid_mon_m14)
                                ,.rready_m13 (rready_m[14])
                                ,.wlast_m13 (wlast_m[14])
                                ,.wdata_m13 (wdata_m14)
                                ,.wstrb_m13 (wstrb_m14)
                                ,.wid_m13 (wid_m14)
                                ,.wready_m13 (wready_m[14])
                                ,.bresp_m13 (bresp_m14)
                                ,.bid_m13 (bid_mon_m14)
                                ,.bready_m13 (bready_m[14])
                                ,.cactive_m13 (cactive_m_bus[13])
                                ,.csysreq_m13 (csysreq_m_bus[13])
                                ,.csysack_m13 (csysack_m_bus[13])
`endif
`ifdef AXI_HAS_M15
                                ,.araddr_m14 (araddr_m15)
                                ,.arlen_m14 (arlen_m15)
                                ,.arsize_m14 (arsize_m15)
                                ,.arburst_m14 (arburst_m15)
                                ,.arlock_m14 (arlock_m15)
                                ,.arcache_m14 (arcache_m15)
                                ,.arprot_m14 (arprot_m15)
                                ,.arid_m14 (arid_m15)
                                ,.arready_m14 (arready_m[15])
                                ,.awaddr_m14 (awaddr_m15)
                                ,.awlen_m14 (awlen_m15)
                                ,.awsize_m14 (awsize_m15)
                                ,.awlock_m14 (awlock_m15)
                                ,.awburst_m14 (awburst_m15)
                                ,.awcache_m14 (awcache_m15)
                                ,.awprot_m14 (awprot_m15)
                                ,.awid_m14 (awid_m15)
                                ,.awready_m14 (awready_m[15])
                                ,.rlast_m14 (rlast_m[15])
                                ,.rdata_m14 (rdata_m15)
                                ,.rresp_m14 (rresp_m15)
                                ,.rid_m14 (rid_mon_m15)
                                ,.rready_m14 (rready_m[15])
                                ,.wlast_m14 (wlast_m[15])
                                ,.wdata_m14 (wdata_m15)
                                ,.wstrb_m14 (wstrb_m15)
                                ,.wid_m14 (wid_m15)
                                ,.wready_m14 (wready_m[15])
                                ,.bresp_m14 (bresp_m15)
                                ,.bid_m14 (bid_mon_m15)
                                ,.bready_m14 (bready_m[15])
                                ,.cactive_m14 (cactive_m_bus[14])
                                ,.csysreq_m14 (csysreq_m_bus[14])
                                ,.csysack_m14 (csysack_m_bus[14])
`endif
`ifdef AXI_HAS_M16
                                ,.araddr_m15 (araddr_m16)
                                ,.arlen_m15 (arlen_m16)
                                ,.arsize_m15 (arsize_m16)
                                ,.arburst_m15 (arburst_m16)
                                ,.arlock_m15 (arlock_m16)
                                ,.arcache_m15 (arcache_m16)
                                ,.arprot_m15 (arprot_m16)
                                ,.arid_m15 (arid_m16)
                                ,.arready_m15 (arready_m[16])
                                ,.awaddr_m15 (awaddr_m16)
                                ,.awlen_m15 (awlen_m16)
                                ,.awsize_m15 (awsize_m16)
                                ,.awlock_m15 (awlock_m16)
                                ,.awburst_m15 (awburst_m16)
                                ,.awcache_m15 (awcache_m16)
                                ,.awprot_m15 (awprot_m16)
                                ,.awid_m15 (awid_m16)
                                ,.awready_m15 (awready_m[16])
                                ,.rlast_m15 (rlast_m[16])
                                ,.rdata_m15 (rdata_m16)
                                ,.rresp_m15 (rresp_m16)
                                ,.rid_m15 (rid_mon_m16)
                                ,.rready_m15 (rready_m[16])
                                ,.wlast_m15 (wlast_m[16])
                                ,.wdata_m15 (wdata_m16)
                                ,.wstrb_m15 (wstrb_m16)
                                ,.wid_m15 (wid_m16)
                                ,.wready_m15 (wready_m[16])
                                ,.bresp_m15 (bresp_m16)
                                ,.bid_m15 (bid_mon_m16)
                                ,.bready_m15 (bready_m[16])
                                ,.cactive_m15 (cactive_m_bus[15])
                                ,.csysreq_m15 (csysreq_m_bus[15])
                                ,.csysack_m15 (csysack_m_bus[15])
`endif
`ifdef AXI_HAS_M17
                                ,.araddr_m16 (araddr_m17)
                                ,.arlen_m16 (arlen_m17)
                                ,.arsize_m16 (arsize_m17)
                                ,.arburst_m16 (arburst_m17)
                                ,.arlock_m16 (arlock_m17)
                                ,.arcache_m16 (arcache_m17)
                                ,.arprot_m16 (arprot_m17)
                                ,.arid_m16 (arid_m17)
                                ,.arready_m16 (arready_m[17])
                                ,.awaddr_m16 (awaddr_m17)
                                ,.awlen_m16 (awlen_m17)
                                ,.awsize_m16 (awsize_m17)
                                ,.awlock_m16 (awlock_m17)
                                ,.awburst_m16 (awburst_m17)
                                ,.awcache_m16 (awcache_m17)
                                ,.awprot_m16 (awprot_m17)
                                ,.awid_m16 (awid_m17)
                                ,.awready_m16 (awready_m[17])
                                ,.rlast_m16 (rlast_m[17])
                                ,.rdata_m16 (rdata_m17)
                                ,.rresp_m16 (rresp_m17)
                                ,.rid_m16 (rid_mon_m17)
                                ,.rready_m16 (rready_m[17])
                                ,.wlast_m16 (wlast_m[17])
                                ,.wdata_m16 (wdata_m17)
                                ,.wstrb_m16 (wstrb_m17)
                                ,.wid_m16 (wid_m17)
                                ,.wready_m16 (wready_m[17])
                                ,.bresp_m16 (bresp_m17)
                                ,.bid_m16 (bid_mon_m17)
                                ,.bready_m16 (bready_m[17])
                                ,.cactive_m16 (cactive_m_bus[16])
                                ,.csysreq_m16 (csysreq_m_bus[16])
                                ,.csysack_m16 (csysack_m_bus[16])
`endif
`ifdef AXI_HAS_M18
                                ,.araddr_m17 (araddr_m18)
                                ,.arlen_m17 (arlen_m18)
                                ,.arsize_m17 (arsize_m18)
                                ,.arburst_m17 (arburst_m18)
                                ,.arlock_m17 (arlock_m18)
                                ,.arcache_m17 (arcache_m18)
                                ,.arprot_m17 (arprot_m18)
                                ,.arid_m17 (arid_m18)
                                ,.arready_m17 (arready_m[18])
                                ,.awaddr_m17 (awaddr_m18)
                                ,.awlen_m17 (awlen_m18)
                                ,.awsize_m17 (awsize_m18)
                                ,.awlock_m17 (awlock_m18)
                                ,.awburst_m17 (awburst_m18)
                                ,.awcache_m17 (awcache_m18)
                                ,.awprot_m17 (awprot_m18)
                                ,.awid_m17 (awid_m18)
                                ,.awready_m17 (awready_m[18])
                                ,.rlast_m17 (rlast_m[18])
                                ,.rdata_m17 (rdata_m18)
                                ,.rresp_m17 (rresp_m18)
                                ,.rid_m17 (rid_mon_m18)
                                ,.rready_m17 (rready_m[18])
                                ,.wlast_m17 (wlast_m[18])
                                ,.wdata_m17 (wdata_m18)
                                ,.wstrb_m17 (wstrb_m18)
                                ,.wid_m17 (wid_m18)
                                ,.wready_m17 (wready_m[18])
                                ,.bresp_m17 (bresp_m18)
                                ,.bid_m17 (bid_mon_m18)
                                ,.bready_m17 (bready_m[18])
                                ,.cactive_m17 (cactive_m_bus[17])
                                ,.csysreq_m17 (csysreq_m_bus[17])
                                ,.csysack_m17 (csysack_m_bus[17])
`endif
`ifdef AXI_HAS_M19
                                ,.araddr_m18 (araddr_m19)
                                ,.arlen_m18 (arlen_m19)
                                ,.arsize_m18 (arsize_m19)
                                ,.arburst_m18 (arburst_m19)
                                ,.arlock_m18 (arlock_m19)
                                ,.arcache_m18 (arcache_m19)
                                ,.arprot_m18 (arprot_m19)
                                ,.arid_m18 (arid_m19)
                                ,.arready_m18 (arready_m[19])
                                ,.awaddr_m18 (awaddr_m19)
                                ,.awlen_m18 (awlen_m19)
                                ,.awsize_m18 (awsize_m19)
                                ,.awlock_m18 (awlock_m19)
                                ,.awburst_m18 (awburst_m19)
                                ,.awcache_m18 (awcache_m19)
                                ,.awprot_m18 (awprot_m19)
                                ,.awid_m18 (awid_m19)
                                ,.awready_m18 (awready_m[19])
                                ,.rlast_m18 (rlast_m[19])
                                ,.rdata_m18 (rdata_m19)
                                ,.rresp_m18 (rresp_m19)
                                ,.rid_m18 (rid_mon_m19)
                                ,.rready_m18 (rready_m[19])
                                ,.wlast_m18 (wlast_m[19])
                                ,.wdata_m18 (wdata_m19)
                                ,.wstrb_m18 (wstrb_m19)
                                ,.wid_m18 (wid_m19)
                                ,.wready_m18 (wready_m[19])
                                ,.bresp_m18 (bresp_m19)
                                ,.bid_m18 (bid_mon_m19)
                                ,.bready_m18 (bready_m[19])
                                ,.cactive_m18 (cactive_m_bus[18])
                                ,.csysreq_m18 (csysreq_m_bus[18])
                                ,.csysack_m18 (csysack_m_bus[18])
`endif
`ifdef AXI_HAS_M20
                                ,.araddr_m19 (araddr_m20)
                                ,.arlen_m19 (arlen_m20)
                                ,.arsize_m19 (arsize_m20)
                                ,.arburst_m19 (arburst_m20)
                                ,.arlock_m19 (arlock_m20)
                                ,.arcache_m19 (arcache_m20)
                                ,.arprot_m19 (arprot_m20)
                                ,.arid_m19 (arid_m20)
                                ,.arready_m19 (arready_m[20])
                                ,.awaddr_m19 (awaddr_m20)
                                ,.awlen_m19 (awlen_m20)
                                ,.awsize_m19 (awsize_m20)
                                ,.awlock_m19 (awlock_m20)
                                ,.awburst_m19 (awburst_m20)
                                ,.awcache_m19 (awcache_m20)
                                ,.awprot_m19 (awprot_m20)
                                ,.awid_m19 (awid_m20)
                                ,.awready_m19 (awready_m[20])
                                ,.rlast_m19 (rlast_m[20])
                                ,.rdata_m19 (rdata_m20)
                                ,.rresp_m19 (rresp_m20)
                                ,.rid_m19 (rid_mon_m20)
                                ,.rready_m19 (rready_m[20])
                                ,.wlast_m19 (wlast_m[20])
                                ,.wdata_m19 (wdata_m20)
                                ,.wstrb_m19 (wstrb_m20)
                                ,.wid_m19 (wid_m20)
                                ,.wready_m19 (wready_m[20])
                                ,.bresp_m19 (bresp_m20)
                                ,.bid_m19 (bid_mon_m20)
                                ,.bready_m19 (bready_m[20])
                                ,.cactive_m19 (cactive_m_bus[19])
                                ,.csysreq_m19 (csysreq_m_bus[19])
                                ,.csysack_m19 (csysack_m_bus[19])
`endif
`ifdef AXI_HAS_M21
                                ,.araddr_m20 (araddr_m21)
                                ,.arlen_m20 (arlen_m21)
                                ,.arsize_m20 (arsize_m21)
                                ,.arburst_m20 (arburst_m21)
                                ,.arlock_m20 (arlock_m21)
                                ,.arcache_m20 (arcache_m21)
                                ,.arprot_m20 (arprot_m21)
                                ,.arid_m20 (arid_m21)
                                ,.arready_m20 (arready_m[21])
                                ,.awaddr_m20 (awaddr_m21)
                                ,.awlen_m20 (awlen_m21)
                                ,.awsize_m20 (awsize_m21)
                                ,.awlock_m20 (awlock_m21)
                                ,.awburst_m20 (awburst_m21)
                                ,.awcache_m20 (awcache_m21)
                                ,.awprot_m20 (awprot_m21)
                                ,.awid_m20 (awid_m21)
                                ,.awready_m20 (awready_m[21])
                                ,.rlast_m20 (rlast_m[21])
                                ,.rdata_m20 (rdata_m21)
                                ,.rresp_m20 (rresp_m21)
                                ,.rid_m20 (rid_mon_m21)
                                ,.rready_m20 (rready_m[21])
                                ,.wlast_m20 (wlast_m[21])
                                ,.wdata_m20 (wdata_m21)
                                ,.wstrb_m20 (wstrb_m21)
                                ,.wid_m20 (wid_m21)
                                ,.wready_m20 (wready_m[21])
                                ,.bresp_m20 (bresp_m21)
                                ,.bid_m20 (bid_mon_m21)
                                ,.bready_m20 (bready_m[21])
                                ,.cactive_m20 (cactive_m_bus[20])
                                ,.csysreq_m20 (csysreq_m_bus[20])
                                ,.csysack_m20 (csysack_m_bus[20])
`endif
`ifdef AXI_HAS_M22
                                ,.araddr_m21 (araddr_m22)
                                ,.arlen_m21 (arlen_m22)
                                ,.arsize_m21 (arsize_m22)
                                ,.arburst_m21 (arburst_m22)
                                ,.arlock_m21 (arlock_m22)
                                ,.arcache_m21 (arcache_m22)
                                ,.arprot_m21 (arprot_m22)
                                ,.arid_m21 (arid_m22)
                                ,.arready_m21 (arready_m[22])
                                ,.awaddr_m21 (awaddr_m22)
                                ,.awlen_m21 (awlen_m22)
                                ,.awsize_m21 (awsize_m22)
                                ,.awlock_m21 (awlock_m22)
                                ,.awburst_m21 (awburst_m22)
                                ,.awcache_m21 (awcache_m22)
                                ,.awprot_m21 (awprot_m22)
                                ,.awid_m21 (awid_m22)
                                ,.awready_m21 (awready_m[22])
                                ,.rlast_m21 (rlast_m[22])
                                ,.rdata_m21 (rdata_m22)
                                ,.rresp_m21 (rresp_m22)
                                ,.rid_m21 (rid_mon_m22)
                                ,.rready_m21 (rready_m[22])
                                ,.wlast_m21 (wlast_m[22])
                                ,.wdata_m21 (wdata_m22)
                                ,.wstrb_m21 (wstrb_m22)
                                ,.wid_m21 (wid_m22)
                                ,.wready_m21 (wready_m[22])
                                ,.bresp_m21 (bresp_m22)
                                ,.bid_m21 (bid_mon_m22)
                                ,.bready_m21 (bready_m[22])
                                ,.cactive_m21 (cactive_m_bus[21])
                                ,.csysreq_m21 (csysreq_m_bus[21])
                                ,.csysack_m21 (csysack_m_bus[21])
`endif
`ifdef AXI_HAS_M23
                                ,.araddr_m22 (araddr_m23)
                                ,.arlen_m22 (arlen_m23)
                                ,.arsize_m22 (arsize_m23)
                                ,.arburst_m22 (arburst_m23)
                                ,.arlock_m22 (arlock_m23)
                                ,.arcache_m22 (arcache_m23)
                                ,.arprot_m22 (arprot_m23)
                                ,.arid_m22 (arid_m23)
                                ,.arready_m22 (arready_m[23])
                                ,.awaddr_m22 (awaddr_m23)
                                ,.awlen_m22 (awlen_m23)
                                ,.awsize_m22 (awsize_m23)
                                ,.awlock_m22 (awlock_m23)
                                ,.awburst_m22 (awburst_m23)
                                ,.awcache_m22 (awcache_m23)
                                ,.awprot_m22 (awprot_m23)
                                ,.awid_m22 (awid_m23)
                                ,.awready_m22 (awready_m[23])
                                ,.rlast_m22 (rlast_m[23])
                                ,.rdata_m22 (rdata_m23)
                                ,.rresp_m22 (rresp_m23)
                                ,.rid_m22 (rid_mon_m23)
                                ,.rready_m22 (rready_m[23])
                                ,.wlast_m22 (wlast_m[23])
                                ,.wdata_m22 (wdata_m23)
                                ,.wstrb_m22 (wstrb_m23)
                                ,.wid_m22 (wid_m23)
                                ,.wready_m22 (wready_m[23])
                                ,.bresp_m22 (bresp_m23)
                                ,.bid_m22 (bid_mon_m23)
                                ,.bready_m22 (bready_m[23])
                                ,.cactive_m22 (cactive_m_bus[22])
                                ,.csysreq_m22 (csysreq_m_bus[22])
                                ,.csysack_m22 (csysack_m_bus[22])
`endif
`ifdef AXI_HAS_M24
                                ,.araddr_m23 (araddr_m24)
                                ,.arlen_m23 (arlen_m24)
                                ,.arsize_m23 (arsize_m24)
                                ,.arburst_m23 (arburst_m24)
                                ,.arlock_m23 (arlock_m24)
                                ,.arcache_m23 (arcache_m24)
                                ,.arprot_m23 (arprot_m24)
                                ,.arid_m23 (arid_m24)
                                ,.arready_m23 (arready_m[24])
                                ,.awaddr_m23 (awaddr_m24)
                                ,.awlen_m23 (awlen_m24)
                                ,.awsize_m23 (awsize_m24)
                                ,.awlock_m23 (awlock_m24)
                                ,.awburst_m23 (awburst_m24)
                                ,.awcache_m23 (awcache_m24)
                                ,.awprot_m23 (awprot_m24)
                                ,.awid_m23 (awid_m24)
                                ,.awready_m23 (awready_m[24])
                                ,.rlast_m23 (rlast_m[24])
                                ,.rdata_m23 (rdata_m24)
                                ,.rresp_m23 (rresp_m24)
                                ,.rid_m23 (rid_mon_m24)
                                ,.rready_m23 (rready_m[24])
                                ,.wlast_m23 (wlast_m[24])
                                ,.wdata_m23 (wdata_m24)
                                ,.wstrb_m23 (wstrb_m24)
                                ,.wid_m23 (wid_m24)
                                ,.wready_m23 (wready_m[24])
                                ,.bresp_m23 (bresp_m24)
                                ,.bid_m23 (bid_mon_m24)
                                ,.bready_m23 (bready_m[24])
                                ,.cactive_m23 (cactive_m_bus[23])
                                ,.csysreq_m23 (csysreq_m_bus[23])
                                ,.csysack_m23 (csysack_m_bus[23])
`endif
`ifdef AXI_HAS_M25
                                ,.araddr_m24 (araddr_m25)
                                ,.arlen_m24 (arlen_m25)
                                ,.arsize_m24 (arsize_m25)
                                ,.arburst_m24 (arburst_m25)
                                ,.arlock_m24 (arlock_m25)
                                ,.arcache_m24 (arcache_m25)
                                ,.arprot_m24 (arprot_m25)
                                ,.arid_m24 (arid_m25)
                                ,.arready_m24 (arready_m[25])
                                ,.awaddr_m24 (awaddr_m25)
                                ,.awlen_m24 (awlen_m25)
                                ,.awsize_m24 (awsize_m25)
                                ,.awlock_m24 (awlock_m25)
                                ,.awburst_m24 (awburst_m25)
                                ,.awcache_m24 (awcache_m25)
                                ,.awprot_m24 (awprot_m25)
                                ,.awid_m24 (awid_m25)
                                ,.awready_m24 (awready_m[25])
                                ,.rlast_m24 (rlast_m[25])
                                ,.rdata_m24 (rdata_m25)
                                ,.rresp_m24 (rresp_m25)
                                ,.rid_m24 (rid_mon_m25)
                                ,.rready_m24 (rready_m[25])
                                ,.wlast_m24 (wlast_m[25])
                                ,.wdata_m24 (wdata_m25)
                                ,.wstrb_m24 (wstrb_m25)
                                ,.wid_m24 (wid_m25)
                                ,.wready_m24 (wready_m[25])
                                ,.bresp_m24 (bresp_m25)
                                ,.bid_m24 (bid_mon_m25)
                                ,.bready_m24 (bready_m[25])
                                ,.cactive_m24 (cactive_m_bus[24])
                                ,.csysreq_m24 (csysreq_m_bus[24])
                                ,.csysack_m24 (csysack_m_bus[24])
`endif
`ifdef AXI_HAS_M26
                                ,.araddr_m25 (araddr_m26)
                                ,.arlen_m25 (arlen_m26)
                                ,.arsize_m25 (arsize_m26)
                                ,.arburst_m25 (arburst_m26)
                                ,.arlock_m25 (arlock_m26)
                                ,.arcache_m25 (arcache_m26)
                                ,.arprot_m25 (arprot_m26)
                                ,.arid_m25 (arid_m26)
                                ,.arready_m25 (arready_m[26])
                                ,.awaddr_m25 (awaddr_m26)
                                ,.awlen_m25 (awlen_m26)
                                ,.awsize_m25 (awsize_m26)
                                ,.awlock_m25 (awlock_m26)
                                ,.awburst_m25 (awburst_m26)
                                ,.awcache_m25 (awcache_m26)
                                ,.awprot_m25 (awprot_m26)
                                ,.awid_m25 (awid_m26)
                                ,.awready_m25 (awready_m[26])
                                ,.rlast_m25 (rlast_m[26])
                                ,.rdata_m25 (rdata_m26)
                                ,.rresp_m25 (rresp_m26)
                                ,.rid_m25 (rid_mon_m26)
                                ,.rready_m25 (rready_m[26])
                                ,.wlast_m25 (wlast_m[26])
                                ,.wdata_m25 (wdata_m26)
                                ,.wstrb_m25 (wstrb_m26)
                                ,.wid_m25 (wid_m26)
                                ,.wready_m25 (wready_m[26])
                                ,.bresp_m25 (bresp_m26)
                                ,.bid_m25 (bid_mon_m26)
                                ,.bready_m25 (bready_m[26])
                                ,.cactive_m25 (cactive_m_bus[25])
                                ,.csysreq_m25 (csysreq_m_bus[25])
                                ,.csysack_m25 (csysack_m_bus[25])
`endif
`ifdef AXI_HAS_M27
                                ,.araddr_m26 (araddr_m27)
                                ,.arlen_m26 (arlen_m27)
                                ,.arsize_m26 (arsize_m27)
                                ,.arburst_m26 (arburst_m27)
                                ,.arlock_m26 (arlock_m27)
                                ,.arcache_m26 (arcache_m27)
                                ,.arprot_m26 (arprot_m27)
                                ,.arid_m26 (arid_m27)
                                ,.arready_m26 (arready_m[27])
                                ,.awaddr_m26 (awaddr_m27)
                                ,.awlen_m26 (awlen_m27)
                                ,.awsize_m26 (awsize_m27)
                                ,.awlock_m26 (awlock_m27)
                                ,.awburst_m26 (awburst_m27)
                                ,.awcache_m26 (awcache_m27)
                                ,.awprot_m26 (awprot_m27)
                                ,.awid_m26 (awid_m27)
                                ,.awready_m26 (awready_m[27])
                                ,.rlast_m26 (rlast_m[27])
                                ,.rdata_m26 (rdata_m27)
                                ,.rresp_m26 (rresp_m27)
                                ,.rid_m26 (rid_mon_m27)
                                ,.rready_m26 (rready_m[27])
                                ,.wlast_m26 (wlast_m[27])
                                ,.wdata_m26 (wdata_m27)
                                ,.wstrb_m26 (wstrb_m27)
                                ,.wid_m26 (wid_m27)
                                ,.wready_m26 (wready_m[27])
                                ,.bresp_m26 (bresp_m27)
                                ,.bid_m26 (bid_mon_m27)
                                ,.bready_m26 (bready_m[27])
                                ,.cactive_m26 (cactive_m_bus[26])
                                ,.csysreq_m26 (csysreq_m_bus[26])
                                ,.csysack_m26 (csysack_m_bus[26])
`endif
`ifdef AXI_HAS_M28
                                ,.araddr_m27 (araddr_m28)
                                ,.arlen_m27 (arlen_m28)
                                ,.arsize_m27 (arsize_m28)
                                ,.arburst_m27 (arburst_m28)
                                ,.arlock_m27 (arlock_m28)
                                ,.arcache_m27 (arcache_m28)
                                ,.arprot_m27 (arprot_m28)
                                ,.arid_m27 (arid_m28)
                                ,.arready_m27 (arready_m[28])
                                ,.awaddr_m27 (awaddr_m28)
                                ,.awlen_m27 (awlen_m28)
                                ,.awsize_m27 (awsize_m28)
                                ,.awlock_m27 (awlock_m28)
                                ,.awburst_m27 (awburst_m28)
                                ,.awcache_m27 (awcache_m28)
                                ,.awprot_m27 (awprot_m28)
                                ,.awid_m27 (awid_m28)
                                ,.awready_m27 (awready_m[28])
                                ,.rlast_m27 (rlast_m[28])
                                ,.rdata_m27 (rdata_m28)
                                ,.rresp_m27 (rresp_m28)
                                ,.rid_m27 (rid_mon_m28)
                                ,.rready_m27 (rready_m[28])
                                ,.wlast_m27 (wlast_m[28])
                                ,.wdata_m27 (wdata_m28)
                                ,.wstrb_m27 (wstrb_m28)
                                ,.wid_m27 (wid_m28)
                                ,.wready_m27 (wready_m[28])
                                ,.bresp_m27 (bresp_m28)
                                ,.bid_m27 (bid_mon_m28)
                                ,.bready_m27 (bready_m[28])
                                ,.cactive_m27 (cactive_m_bus[27])
                                ,.csysreq_m27 (csysreq_m_bus[27])
                                ,.csysack_m27 (csysack_m_bus[27])
`endif
`ifdef AXI_HAS_M29
                                ,.araddr_m28 (araddr_m29)
                                ,.arlen_m28 (arlen_m29)
                                ,.arsize_m28 (arsize_m29)
                                ,.arburst_m28 (arburst_m29)
                                ,.arlock_m28 (arlock_m29)
                                ,.arcache_m28 (arcache_m29)
                                ,.arprot_m28 (arprot_m29)
                                ,.arid_m28 (arid_m29)
                                ,.arready_m28 (arready_m[29])
                                ,.awaddr_m28 (awaddr_m29)
                                ,.awlen_m28 (awlen_m29)
                                ,.awsize_m28 (awsize_m29)
                                ,.awlock_m28 (awlock_m29)
                                ,.awburst_m28 (awburst_m29)
                                ,.awcache_m28 (awcache_m29)
                                ,.awprot_m28 (awprot_m29)
                                ,.awid_m28 (awid_m29)
                                ,.awready_m28 (awready_m[29])
                                ,.rlast_m28 (rlast_m[29])
                                ,.rdata_m28 (rdata_m29)
                                ,.rresp_m28 (rresp_m29)
                                ,.rid_m28 (rid_mon_m29)
                                ,.rready_m28 (rready_m[29])
                                ,.wlast_m28 (wlast_m[29])
                                ,.wdata_m28 (wdata_m29)
                                ,.wstrb_m28 (wstrb_m29)
                                ,.wid_m28 (wid_m29)
                                ,.wready_m28 (wready_m[29])
                                ,.bresp_m28 (bresp_m29)
                                ,.bid_m28 (bid_mon_m29)
                                ,.bready_m28 (bready_m[29])
                                ,.cactive_m28 (cactive_m_bus[28])
                                ,.csysreq_m28 (csysreq_m_bus[28])
                                ,.csysack_m28 (csysack_m_bus[28])
`endif
`ifdef AXI_HAS_M30
                                ,.araddr_m29 (araddr_m30)
                                ,.arlen_m29 (arlen_m30)
                                ,.arsize_m29 (arsize_m30)
                                ,.arburst_m29 (arburst_m30)
                                ,.arlock_m29 (arlock_m30)
                                ,.arcache_m29 (arcache_m30)
                                ,.arprot_m29 (arprot_m30)
                                ,.arid_m29 (arid_m30)
                                ,.arready_m29 (arready_m[30])
                                ,.awaddr_m29 (awaddr_m30)
                                ,.awlen_m29 (awlen_m30)
                                ,.awsize_m29 (awsize_m30)
                                ,.awlock_m29 (awlock_m30)
                                ,.awburst_m29 (awburst_m30)
                                ,.awcache_m29 (awcache_m30)
                                ,.awprot_m29 (awprot_m30)
                                ,.awid_m29 (awid_m30)
                                ,.awready_m29 (awready_m[30])
                                ,.rlast_m29 (rlast_m[30])
                                ,.rdata_m29 (rdata_m30)
                                ,.rresp_m29 (rresp_m30)
                                ,.rid_m29 (rid_mon_m30)
                                ,.rready_m29 (rready_m[30])
                                ,.wlast_m29 (wlast_m[30])
                                ,.wdata_m29 (wdata_m30)
                                ,.wstrb_m29 (wstrb_m30)
                                ,.wid_m29 (wid_m30)
                                ,.wready_m29 (wready_m[30])
                                ,.bresp_m29 (bresp_m30)
                                ,.bid_m29 (bid_mon_m30)
                                ,.bready_m29 (bready_m[30])
                                ,.cactive_m29 (cactive_m_bus[29])
                                ,.csysreq_m29 (csysreq_m_bus[29])
                                ,.csysack_m29 (csysack_m_bus[29])
`endif
`ifdef AXI_HAS_M31
                                ,.araddr_m30 (araddr_m31)
                                ,.arlen_m30 (arlen_m31)
                                ,.arsize_m30 (arsize_m31)
                                ,.arburst_m30 (arburst_m31)
                                ,.arlock_m30 (arlock_m31)
                                ,.arcache_m30 (arcache_m31)
                                ,.arprot_m30 (arprot_m31)
                                ,.arid_m30 (arid_m31)
                                ,.arready_m30 (arready_m[31])
                                ,.awaddr_m30 (awaddr_m31)
                                ,.awlen_m30 (awlen_m31)
                                ,.awsize_m30 (awsize_m31)
                                ,.awlock_m30 (awlock_m31)
                                ,.awburst_m30 (awburst_m31)
                                ,.awcache_m30 (awcache_m31)
                                ,.awprot_m30 (awprot_m31)
                                ,.awid_m30 (awid_m31)
                                ,.awready_m30 (awready_m[31])
                                ,.rlast_m30 (rlast_m[31])
                                ,.rdata_m30 (rdata_m31)
                                ,.rresp_m30 (rresp_m31)
                                ,.rid_m30 (rid_mon_m31)
                                ,.rready_m30 (rready_m[31])
                                ,.wlast_m30 (wlast_m[31])
                                ,.wdata_m30 (wdata_m31)
                                ,.wstrb_m30 (wstrb_m31)
                                ,.wid_m30 (wid_m31)
                                ,.wready_m30 (wready_m[31])
                                ,.bresp_m30 (bresp_m31)
                                ,.bid_m30 (bid_mon_m31)
                                ,.bready_m30 (bready_m[31])
                                ,.cactive_m30 (cactive_m_bus[30])
                                ,.csysreq_m30 (csysreq_m_bus[30])
                                ,.csysack_m30 (csysack_m_bus[30])
`endif
`ifdef AXI_HAS_M32
                                ,.araddr_m31 (araddr_m32)
                                ,.arlen_m31 (arlen_m32)
                                ,.arsize_m31 (arsize_m32)
                                ,.arburst_m31 (arburst_m32)
                                ,.arlock_m31 (arlock_m32)
                                ,.arcache_m31 (arcache_m32)
                                ,.arprot_m31 (arprot_m32)
                                ,.arid_m31 (arid_m32)
                                ,.arready_m31 (arready_m[32])
                                ,.awaddr_m31 (awaddr_m32)
                                ,.awlen_m31 (awlen_m32)
                                ,.awsize_m31 (awsize_m32)
                                ,.awlock_m31 (awlock_m32)
                                ,.awburst_m31 (awburst_m32)
                                ,.awcache_m31 (awcache_m32)
                                ,.awprot_m31 (awprot_m32)
                                ,.awid_m31 (awid_m32)
                                ,.awready_m31 (awready_m[32])
                                ,.rlast_m31 (rlast_m[32])
                                ,.rdata_m31 (rdata_m32)
                                ,.rresp_m31 (rresp_m32)
                                ,.rid_m31 (rid_mon_m32)
                                ,.rready_m31 (rready_m[32])
                                ,.wlast_m31 (wlast_m[32])
                                ,.wdata_m31 (wdata_m32)
                                ,.wstrb_m31 (wstrb_m32)
                                ,.wid_m31 (wid_m32)
                                ,.wready_m31 (wready_m[32])
                                ,.bresp_m31 (bresp_m32)
                                ,.bid_m31 (bid_mon_m32)
                                ,.bready_m31 (bready_m[32])
                                ,.cactive_m31 (cactive_m_bus[31])
                                ,.csysreq_m31 (csysreq_m_bus[31])
                                ,.csysack_m31 (csysack_m_bus[31])
`endif
`ifdef AXI_HAS_S0
                                ,.arvalid_s0 (arvalid_s[0])
                                ,.araddr_s0 (araddr_s0[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s0 (arlen_s0[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s0 (arsize_s0[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s0 (arburst_s0[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s0 (arlock_s0[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s0 (arcache_s0[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s0 (arprot_s0[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s0 (arid_s0[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s0 (arready_s[0])
                                ,.awvalid_s0 (awvalid_s[0])
                                ,.awaddr_s0 (awaddr_s0[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s0 (awlen_s0[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s0 (awsize_s0[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s0 (awburst_s0[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s0 (awlock_s0[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s0 (awcache_s0[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s0 (awprot_s0[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s0 (awid_s0[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s0 (awready_s[0])
                                ,.rvalid_s0 (rvalid_s[0])
                                ,.rlast_s0 (rlast_s[0])
                                ,.rdata_s0 (rdata_s0[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s0 (rresp_s0)
                                ,.rid_s0 (rid_s0[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s0 (rready_s[0])
                                ,.wvalid_s0 (wvalid_s[0])
                                ,.wlast_s0 (wlast_s[0])
                                ,.wdata_s0 (wdata_s0[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s0 (wstrb_s0[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s0 (wid_s0[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s0 (wready_s[0])
                                ,.bvalid_s0 (bvalid_s[0])
                                ,.bresp_s0 (bresp_s0)
                                ,.bid_s0 (bid_s0[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s0 (bready_s[0])
                                ,.cactive_s0 (cactive_s_bus_ext[0])
                                ,.csysreq_s0 (csysreq_s_bus_ext[0])
                                ,.csysack_s0 (csysack_s_bus_ext[0])
`endif
`ifdef AXI_HAS_S1
                                ,.arvalid_s1 (arvalid_s[1])
                                ,.araddr_s1 (araddr_s1[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s1 (arlen_s1[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s1 (arsize_s1[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s1 (arburst_s1[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s1 (arlock_s1[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s1 (arcache_s1[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s1 (arprot_s1[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s1 (arid_s1[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s1 (arready_s[1])
                                ,.awvalid_s1 (awvalid_s[1])
                                ,.awaddr_s1 (awaddr_s1[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s1 (awlen_s1[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s1 (awsize_s1[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s1 (awburst_s1[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s1 (awlock_s1[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s1 (awcache_s1[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s1 (awprot_s1[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s1 (awid_s1[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s1 (awready_s[1])
                                ,.rvalid_s1 (rvalid_s[1])
                                ,.rlast_s1 (rlast_s[1])
                                ,.rdata_s1 (rdata_s1[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s1 (rresp_s1)
                                ,.rid_s1 (rid_s1[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s1 (rready_s[1])
                                ,.wvalid_s1 (wvalid_s[1])
                                ,.wlast_s1 (wlast_s[1])
                                ,.wdata_s1 (wdata_s1[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s1 (wstrb_s1[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s1 (wid_s1[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s1 (wready_s[1])
                                ,.bvalid_s1 (bvalid_s[1])
                                ,.bresp_s1 (bresp_s1)
                                ,.bid_s1 (bid_s1[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s1 (bready_s[1])
                                ,.cactive_s1 (cactive_s_bus_ext[1])
                                ,.csysreq_s1 (csysreq_s_bus_ext[1])
                                ,.csysack_s1 (csysack_s_bus_ext[1])
`endif
`ifdef AXI_HAS_S2
                                ,.arvalid_s2 (arvalid_s[2])
                                ,.araddr_s2 (araddr_s2[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s2 (arlen_s2[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s2 (arsize_s2[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s2 (arburst_s2[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s2 (arlock_s2[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s2 (arcache_s2[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s2 (arprot_s2[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s2 (arid_s2[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s2 (arready_s[2])
                                ,.awvalid_s2 (awvalid_s[2])
                                ,.awaddr_s2 (awaddr_s2[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s2 (awlen_s2[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s2 (awsize_s2[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s2 (awburst_s2[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s2 (awlock_s2[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s2 (awcache_s2[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s2 (awprot_s2[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s2 (awid_s2[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s2 (awready_s[2])
                                ,.rvalid_s2 (rvalid_s[2])
                                ,.rlast_s2 (rlast_s[2])
                                ,.rdata_s2 (rdata_s2[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s2 (rresp_s2)
                                ,.rid_s2 (rid_s2[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s2 (rready_s[2])
                                ,.wvalid_s2 (wvalid_s[2])
                                ,.wlast_s2 (wlast_s[2])
                                ,.wdata_s2 (wdata_s2[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s2 (wstrb_s2[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s2 (wid_s2[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s2 (wready_s[2])
                                ,.bvalid_s2 (bvalid_s[2])
                                ,.bresp_s2 (bresp_s2)
                                ,.bid_s2 (bid_s2[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s2 (bready_s[2])
                                ,.cactive_s2 (cactive_s_bus_ext[2])
                                ,.csysreq_s2 (csysreq_s_bus_ext[2])
                                ,.csysack_s2 (csysack_s_bus_ext[2])
`endif
`ifdef AXI_HAS_S3
                                ,.arvalid_s3 (arvalid_s[3])
                                ,.araddr_s3 (araddr_s3[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s3 (arlen_s3[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s3 (arsize_s3[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s3 (arburst_s3[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s3 (arlock_s3[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s3 (arcache_s3[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s3 (arprot_s3[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s3 (arid_s3[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s3 (arready_s[3])
                                ,.awvalid_s3 (awvalid_s[3])
                                ,.awaddr_s3 (awaddr_s3[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s3 (awlen_s3[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s3 (awsize_s3[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s3 (awburst_s3[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s3 (awlock_s3[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s3 (awcache_s3[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s3 (awprot_s3[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s3 (awid_s3[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s3 (awready_s[3])
                                ,.rvalid_s3 (rvalid_s[3])
                                ,.rlast_s3 (rlast_s[3])
                                ,.rdata_s3 (rdata_s3[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s3 (rresp_s3)
                                ,.rid_s3 (rid_s3[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s3 (rready_s[3])
                                ,.wvalid_s3 (wvalid_s[3])
                                ,.wlast_s3 (wlast_s[3])
                                ,.wdata_s3 (wdata_s3[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s3 (wstrb_s3[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s3 (wid_s3[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s3 (wready_s[3])
                                ,.bvalid_s3 (bvalid_s[3])
                                ,.bresp_s3 (bresp_s3)
                                ,.bid_s3 (bid_s3[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s3 (bready_s[3])
                                ,.cactive_s3 (cactive_s_bus_ext[3])
                                ,.csysreq_s3 (csysreq_s_bus_ext[3])
                                ,.csysack_s3 (csysack_s_bus_ext[3])
`endif
`ifdef AXI_HAS_S4
                                ,.arvalid_s4 (arvalid_s[4])
                                ,.araddr_s4 (araddr_s4[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s4 (arlen_s4[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s4 (arsize_s4[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s4 (arburst_s4[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s4 (arlock_s4[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s4 (arcache_s4[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s4 (arprot_s4[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s4 (arid_s4[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s4 (arready_s[4])
                                ,.awvalid_s4 (awvalid_s[4])
                                ,.awaddr_s4 (awaddr_s4[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s4 (awlen_s4[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s4 (awsize_s4[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s4 (awburst_s4[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s4 (awlock_s4[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s4 (awcache_s4[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s4 (awprot_s4[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s4 (awid_s4[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s4 (awready_s[4])
                                ,.rvalid_s4 (rvalid_s[4])
                                ,.rlast_s4 (rlast_s[4])
                                ,.rdata_s4 (rdata_s4[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s4 (rresp_s4)
                                ,.rid_s4 (rid_s4[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s4 (rready_s[4])
                                ,.wvalid_s4 (wvalid_s[4])
                                ,.wlast_s4 (wlast_s[4])
                                ,.wdata_s4 (wdata_s4[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s4 (wstrb_s4[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s4 (wid_s4[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s4 (wready_s[4])
                                ,.bvalid_s4 (bvalid_s[4])
                                ,.bresp_s4 (bresp_s4)
                                ,.bid_s4 (bid_s4[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s4 (bready_s[4])
                                ,.cactive_s4 (cactive_s_bus_ext[4])
                                ,.csysreq_s4 (csysreq_s_bus_ext[4])
                                ,.csysack_s4 (csysack_s_bus_ext[4])
`endif
`ifdef AXI_HAS_S5
                                ,.arvalid_s5 (arvalid_s[5])
                                ,.araddr_s5 (araddr_s5[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s5 (arlen_s5[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s5 (arsize_s5[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s5 (arburst_s5[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s5 (arlock_s5[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s5 (arcache_s5[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s5 (arprot_s5[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s5 (arid_s5[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s5 (arready_s[5])
                                ,.awvalid_s5 (awvalid_s[5])
                                ,.awaddr_s5 (awaddr_s5[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s5 (awlen_s5[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s5 (awsize_s5[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s5 (awburst_s5[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s5 (awlock_s5[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s5 (awcache_s5[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s5 (awprot_s5[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s5 (awid_s5[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s5 (awready_s[5])
                                ,.rvalid_s5 (rvalid_s[5])
                                ,.rlast_s5 (rlast_s[5])
                                ,.rdata_s5 (rdata_s5[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s5 (rresp_s5)
                                ,.rid_s5 (rid_s5[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s5 (rready_s[5])
                                ,.wvalid_s5 (wvalid_s[5])
                                ,.wlast_s5 (wlast_s[5])
                                ,.wdata_s5 (wdata_s5[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s5 (wstrb_s5[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s5 (wid_s5[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s5 (wready_s[5])
                                ,.bvalid_s5 (bvalid_s[5])
                                ,.bresp_s5 (bresp_s5)
                                ,.bid_s5 (bid_s5[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s5 (bready_s[5])
                                ,.cactive_s5 (cactive_s_bus_ext[5])
                                ,.csysreq_s5 (csysreq_s_bus_ext[5])
                                ,.csysack_s5 (csysack_s_bus_ext[5])
`endif
`ifdef AXI_HAS_S6
                                ,.arvalid_s6 (arvalid_s[6])
                                ,.araddr_s6 (araddr_s6[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s6 (arlen_s6[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s6 (arsize_s6[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s6 (arburst_s6[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s6 (arlock_s6[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s6 (arcache_s6[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s6 (arprot_s6[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s6 (arid_s6[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s6 (arready_s[6])
                                ,.awvalid_s6 (awvalid_s[6])
                                ,.awaddr_s6 (awaddr_s6[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s6 (awlen_s6[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s6 (awsize_s6[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s6 (awburst_s6[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s6 (awlock_s6[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s6 (awcache_s6[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s6 (awprot_s6[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s6 (awid_s6[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s6 (awready_s[6])
                                ,.rvalid_s6 (rvalid_s[6])
                                ,.rlast_s6 (rlast_s[6])
                                ,.rdata_s6 (rdata_s6[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s6 (rresp_s6)
                                ,.rid_s6 (rid_s6[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s6 (rready_s[6])
                                ,.wvalid_s6 (wvalid_s[6])
                                ,.wlast_s6 (wlast_s[6])
                                ,.wdata_s6 (wdata_s6[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s6 (wstrb_s6[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s6 (wid_s6[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s6 (wready_s[6])
                                ,.bvalid_s6 (bvalid_s[6])
                                ,.bresp_s6 (bresp_s6)
                                ,.bid_s6 (bid_s6[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s6 (bready_s[6])
                                ,.cactive_s6 (cactive_s_bus_ext[6])
                                ,.csysreq_s6 (csysreq_s_bus_ext[6])
                                ,.csysack_s6 (csysack_s_bus_ext[6])
`endif
`ifdef AXI_HAS_S7
                                ,.arvalid_s7 (arvalid_s[7])
                                ,.araddr_s7 (araddr_s7[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s7 (arlen_s7[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s7 (arsize_s7[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s7 (arburst_s7[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s7 (arlock_s7[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s7 (arcache_s7[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s7 (arprot_s7[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s7 (arid_s7[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s7 (arready_s[7])
                                ,.awvalid_s7 (awvalid_s[7])
                                ,.awaddr_s7 (awaddr_s7[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s7 (awlen_s7[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s7 (awsize_s7[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s7 (awburst_s7[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s7 (awlock_s7[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s7 (awcache_s7[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s7 (awprot_s7[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s7 (awid_s7[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s7 (awready_s[7])
                                ,.rvalid_s7 (rvalid_s[7])
                                ,.rlast_s7 (rlast_s[7])
                                ,.rdata_s7 (rdata_s7[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s7 (rresp_s7)
                                ,.rid_s7 (rid_s7[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s7 (rready_s[7])
                                ,.wvalid_s7 (wvalid_s[7])
                                ,.wlast_s7 (wlast_s[7])
                                ,.wdata_s7 (wdata_s7[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s7 (wstrb_s7[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s7 (wid_s7[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s7 (wready_s[7])
                                ,.bvalid_s7 (bvalid_s[7])
                                ,.bresp_s7 (bresp_s7)
                                ,.bid_s7 (bid_s7[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s7 (bready_s[7])
                                ,.cactive_s7 (cactive_s_bus_ext[7])
                                ,.csysreq_s7 (csysreq_s_bus_ext[7])
                                ,.csysack_s7 (csysack_s_bus_ext[7])
`endif
`ifdef AXI_HAS_S8
                                ,.arvalid_s8 (arvalid_s[8])
                                ,.araddr_s8 (araddr_s8[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s8 (arlen_s8[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s8 (arsize_s8[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s8 (arburst_s8[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s8 (arlock_s8[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s8 (arcache_s8[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s8 (arprot_s8[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s8 (arid_s8[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s8 (arready_s[8])
                                ,.awvalid_s8 (awvalid_s[8])
                                ,.awaddr_s8 (awaddr_s8[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s8 (awlen_s8[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s8 (awsize_s8[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s8 (awburst_s8[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s8 (awlock_s8[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s8 (awcache_s8[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s8 (awprot_s8[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s8 (awid_s8[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s8 (awready_s[8])
                                ,.rvalid_s8 (rvalid_s[8])
                                ,.rlast_s8 (rlast_s[8])
                                ,.rdata_s8 (rdata_s8[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s8 (rresp_s8)
                                ,.rid_s8 (rid_s8[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s8 (rready_s[8])
                                ,.wvalid_s8 (wvalid_s[8])
                                ,.wlast_s8 (wlast_s[8])
                                ,.wdata_s8 (wdata_s8[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s8 (wstrb_s8[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s8 (wid_s8[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s8 (wready_s[8])
                                ,.bvalid_s8 (bvalid_s[8])
                                ,.bresp_s8 (bresp_s8)
                                ,.bid_s8 (bid_s8[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s8 (bready_s[8])
                                ,.cactive_s8 (cactive_s_bus_ext[8])
                                ,.csysreq_s8 (csysreq_s_bus_ext[8])
                                ,.csysack_s8 (csysack_s_bus_ext[8])
`endif
`ifdef AXI_HAS_S9
                                ,.arvalid_s9 (arvalid_s[9])
                                ,.araddr_s9 (araddr_s9[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s9 (arlen_s9[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s9 (arsize_s9[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s9 (arburst_s9[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s9 (arlock_s9[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s9 (arcache_s9[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s9 (arprot_s9[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s9 (arid_s9[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s9 (arready_s[9])
                                ,.awvalid_s9 (awvalid_s[9])
                                ,.awaddr_s9 (awaddr_s9[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s9 (awlen_s9[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s9 (awsize_s9[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s9 (awburst_s9[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s9 (awlock_s9[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s9 (awcache_s9[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s9 (awprot_s9[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s9 (awid_s9[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s9 (awready_s[9])
                                ,.rvalid_s9 (rvalid_s[9])
                                ,.rlast_s9 (rlast_s[9])
                                ,.rdata_s9 (rdata_s9[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s9 (rresp_s9)
                                ,.rid_s9 (rid_s9[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s9 (rready_s[9])
                                ,.wvalid_s9 (wvalid_s[9])
                                ,.wlast_s9 (wlast_s[9])
                                ,.wdata_s9 (wdata_s9[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s9 (wstrb_s9[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s9 (wid_s9[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s9 (wready_s[9])
                                ,.bvalid_s9 (bvalid_s[9])
                                ,.bresp_s9 (bresp_s9)
                                ,.bid_s9 (bid_s9[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s9 (bready_s[9])
                                ,.cactive_s9 (cactive_s_bus_ext[9])
                                ,.csysreq_s9 (csysreq_s_bus_ext[9])
                                ,.csysack_s9 (csysack_s_bus_ext[9])
`endif
`ifdef AXI_HAS_S10
                                ,.arvalid_s10 (arvalid_s[10])
                                ,.araddr_s10 (araddr_s10[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s10 (arlen_s10[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s10 (arsize_s10[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s10 (arburst_s10[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s10 (arlock_s10[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s10 (arcache_s10[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s10 (arprot_s10[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s10 (arid_s10[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s10 (arready_s[10])
                                ,.awvalid_s10 (awvalid_s[10])
                                ,.awaddr_s10 (awaddr_s10[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s10 (awlen_s10[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s10 (awsize_s10[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s10 (awburst_s10[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s10 (awlock_s10[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s10 (awcache_s10[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s10 (awprot_s10[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s10 (awid_s10[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s10 (awready_s[10])
                                ,.rvalid_s10 (rvalid_s[10])
                                ,.rlast_s10 (rlast_s[10])
                                ,.rdata_s10 (rdata_s10[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s10 (rresp_s10)
                                ,.rid_s10 (rid_s10[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s10 (rready_s[10])
                                ,.wvalid_s10 (wvalid_s[10])
                                ,.wlast_s10 (wlast_s[10])
                                ,.wdata_s10 (wdata_s10[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s10 (wstrb_s10[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s10 (wid_s10[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s10 (wready_s[10])
                                ,.bvalid_s10 (bvalid_s[10])
                                ,.bresp_s10 (bresp_s10)
                                ,.bid_s10 (bid_s10[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s10 (bready_s[10])
                                ,.cactive_s10 (cactive_s_bus_ext[10])
                                ,.csysreq_s10 (csysreq_s_bus_ext[10])
                                ,.csysack_s10 (csysack_s_bus_ext[10])
`endif
`ifdef AXI_HAS_S11
                                ,.arvalid_s11 (arvalid_s[11])
                                ,.araddr_s11 (araddr_s11[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s11 (arlen_s11[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s11 (arsize_s11[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s11 (arburst_s11[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s11 (arlock_s11[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s11 (arcache_s11[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s11 (arprot_s11[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s11 (arid_s11[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s11 (arready_s[11])
                                ,.awvalid_s11 (awvalid_s[11])
                                ,.awaddr_s11 (awaddr_s11[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s11 (awlen_s11[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s11 (awsize_s11[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s11 (awburst_s11[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s11 (awlock_s11[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s11 (awcache_s11[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s11 (awprot_s11[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s11 (awid_s11[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s11 (awready_s[11])
                                ,.rvalid_s11 (rvalid_s[11])
                                ,.rlast_s11 (rlast_s[11])
                                ,.rdata_s11 (rdata_s11[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s11 (rresp_s11)
                                ,.rid_s11 (rid_s11[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s11 (rready_s[11])
                                ,.wvalid_s11 (wvalid_s[11])
                                ,.wlast_s11 (wlast_s[11])
                                ,.wdata_s11 (wdata_s11[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s11 (wstrb_s11[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s11 (wid_s11[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s11 (wready_s[11])
                                ,.bvalid_s11 (bvalid_s[11])
                                ,.bresp_s11 (bresp_s11)
                                ,.bid_s11 (bid_s11[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s11 (bready_s[11])
                                ,.cactive_s11 (cactive_s_bus_ext[11])
                                ,.csysreq_s11 (csysreq_s_bus_ext[11])
                                ,.csysack_s11 (csysack_s_bus_ext[11])
`endif
`ifdef AXI_HAS_S12
                                ,.arvalid_s12 (arvalid_s[12])
                                ,.araddr_s12 (araddr_s12[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s12 (arlen_s12[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s12 (arsize_s12[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s12 (arburst_s12[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s12 (arlock_s12[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s12 (arcache_s12[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s12 (arprot_s12[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s12 (arid_s12[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s12 (arready_s[12])
                                ,.awvalid_s12 (awvalid_s[12])
                                ,.awaddr_s12 (awaddr_s12[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s12 (awlen_s12[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s12 (awsize_s12[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s12 (awburst_s12[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s12 (awlock_s12[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s12 (awcache_s12[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s12 (awprot_s12[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s12 (awid_s12[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s12 (awready_s[12])
                                ,.rvalid_s12 (rvalid_s[12])
                                ,.rlast_s12 (rlast_s[12])
                                ,.rdata_s12 (rdata_s12[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s12 (rresp_s12)
                                ,.rid_s12 (rid_s12[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s12 (rready_s[12])
                                ,.wvalid_s12 (wvalid_s[12])
                                ,.wlast_s12 (wlast_s[12])
                                ,.wdata_s12 (wdata_s12[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s12 (wstrb_s12[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s12 (wid_s12[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s12 (wready_s[12])
                                ,.bvalid_s12 (bvalid_s[12])
                                ,.bresp_s12 (bresp_s12)
                                ,.bid_s12 (bid_s12[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s12 (bready_s[12])
                                ,.cactive_s12 (cactive_s_bus_ext[12])
                                ,.csysreq_s12 (csysreq_s_bus_ext[12])
                                ,.csysack_s12 (csysack_s_bus_ext[12])
`endif
`ifdef AXI_HAS_S13
                                ,.arvalid_s13 (arvalid_s[13])
                                ,.araddr_s13 (araddr_s13[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s13 (arlen_s13[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s13 (arsize_s13[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s13 (arburst_s13[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s13 (arlock_s13[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s13 (arcache_s13[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s13 (arprot_s13[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s13 (arid_s13[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s13 (arready_s[13])
                                ,.awvalid_s13 (awvalid_s[13])
                                ,.awaddr_s13 (awaddr_s13[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s13 (awlen_s13[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s13 (awsize_s13[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s13 (awburst_s13[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s13 (awlock_s13[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s13 (awcache_s13[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s13 (awprot_s13[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s13 (awid_s13[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s13 (awready_s[13])
                                ,.rvalid_s13 (rvalid_s[13])
                                ,.rlast_s13 (rlast_s[13])
                                ,.rdata_s13 (rdata_s13[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s13 (rresp_s13)
                                ,.rid_s13 (rid_s13[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s13 (rready_s[13])
                                ,.wvalid_s13 (wvalid_s[13])
                                ,.wlast_s13 (wlast_s[13])
                                ,.wdata_s13 (wdata_s13[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s13 (wstrb_s13[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s13 (wid_s13[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s13 (wready_s[13])
                                ,.bvalid_s13 (bvalid_s[13])
                                ,.bresp_s13 (bresp_s13)
                                ,.bid_s13 (bid_s13[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s13 (bready_s[13])
                                ,.cactive_s13 (cactive_s_bus_ext[13])
                                ,.csysreq_s13 (csysreq_s_bus_ext[13])
                                ,.csysack_s13 (csysack_s_bus_ext[13])
`endif
`ifdef AXI_HAS_S14
                                ,.arvalid_s14 (arvalid_s[14])
                                ,.araddr_s14 (araddr_s14[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s14 (arlen_s14[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s14 (arsize_s14[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s14 (arburst_s14[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s14 (arlock_s14[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s14 (arcache_s14[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s14 (arprot_s14[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s14 (arid_s14[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s14 (arready_s[14])
                                ,.awvalid_s14 (awvalid_s[14])
                                ,.awaddr_s14 (awaddr_s14[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s14 (awlen_s14[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s14 (awsize_s14[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s14 (awburst_s14[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s14 (awlock_s14[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s14 (awcache_s14[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s14 (awprot_s14[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s14 (awid_s14[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s14 (awready_s[14])
                                ,.rvalid_s14 (rvalid_s[14])
                                ,.rlast_s14 (rlast_s[14])
                                ,.rdata_s14 (rdata_s14[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s14 (rresp_s14)
                                ,.rid_s14 (rid_s14[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s14 (rready_s[14])
                                ,.wvalid_s14 (wvalid_s[14])
                                ,.wlast_s14 (wlast_s[14])
                                ,.wdata_s14 (wdata_s14[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s14 (wstrb_s14[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s14 (wid_s14[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s14 (wready_s[14])
                                ,.bvalid_s14 (bvalid_s[14])
                                ,.bresp_s14 (bresp_s14)
                                ,.bid_s14 (bid_s14[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s14 (bready_s[14])
                                ,.cactive_s14 (cactive_s_bus_ext[14])
                                ,.csysreq_s14 (csysreq_s_bus_ext[14])
                                ,.csysack_s14 (csysack_s_bus_ext[14])
`endif
`ifdef AXI_HAS_S15
                                ,.arvalid_s15 (arvalid_s[15])
                                ,.araddr_s15 (araddr_s15[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s15 (arlen_s15[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s15 (arsize_s15[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s15 (arburst_s15[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s15 (arlock_s15[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s15 (arcache_s15[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s15 (arprot_s15[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s15 (arid_s15[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s15 (arready_s[15])
                                ,.awvalid_s15 (awvalid_s[15])
                                ,.awaddr_s15 (awaddr_s15[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s15 (awlen_s15[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s15 (awsize_s15[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s15 (awburst_s15[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s15 (awlock_s15[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s15 (awcache_s15[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s15 (awprot_s15[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s15 (awid_s15[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s15 (awready_s[15])
                                ,.rvalid_s15 (rvalid_s[15])
                                ,.rlast_s15 (rlast_s[15])
                                ,.rdata_s15 (rdata_s15[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s15 (rresp_s15)
                                ,.rid_s15 (rid_s15[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s15 (rready_s[15])
                                ,.wvalid_s15 (wvalid_s[15])
                                ,.wlast_s15 (wlast_s[15])
                                ,.wdata_s15 (wdata_s15[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s15 (wstrb_s15[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s15 (wid_s15[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s15 (wready_s[15])
                                ,.bvalid_s15 (bvalid_s[15])
                                ,.bresp_s15 (bresp_s15)
                                ,.bid_s15 (bid_s15[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s15 (bready_s[15])
                                ,.cactive_s15 (cactive_s_bus_ext[15])
                                ,.csysreq_s15 (csysreq_s_bus_ext[15])
                                ,.csysack_s15 (csysack_s_bus_ext[15])
`endif
`ifdef AXI_HAS_S16
                                ,.arvalid_s16 (arvalid_s[16])
                                ,.araddr_s16 (araddr_s16[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s16 (arlen_s16[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s16 (arsize_s16[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s16 (arburst_s16[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s16 (arlock_s16[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s16 (arcache_s16[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s16 (arprot_s16[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s16 (arid_s16[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s16 (arready_s[16])
                                ,.awvalid_s16 (awvalid_s[16])
                                ,.awaddr_s16 (awaddr_s16[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s16 (awlen_s16[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s16 (awsize_s16[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s16 (awburst_s16[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s16 (awlock_s16[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s16 (awcache_s16[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s16 (awprot_s16[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s16 (awid_s16[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s16 (awready_s[16])
                                ,.rvalid_s16 (rvalid_s[16])
                                ,.rlast_s16 (rlast_s[16])
                                ,.rdata_s16 (rdata_s16[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s16 (rresp_s16)
                                ,.rid_s16 (rid_s16[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s16 (rready_s[16])
                                ,.wvalid_s16 (wvalid_s[16])
                                ,.wlast_s16 (wlast_s[16])
                                ,.wdata_s16 (wdata_s16[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s16 (wstrb_s16[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s16 (wid_s16[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s16 (wready_s[16])
                                ,.bvalid_s16 (bvalid_s[16])
                                ,.bresp_s16 (bresp_s16)
                                ,.bid_s16 (bid_s16[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s16 (bready_s[16])
                                ,.cactive_s16 (cactive_s_bus_ext[16])
                                ,.csysreq_s16 (csysreq_s_bus_ext[16])
                                ,.csysack_s16 (csysack_s_bus_ext[16])
`endif
`ifdef AXI_HAS_S17
                                ,.arvalid_s17 (arvalid_s[17])
                                ,.araddr_s17 (araddr_s17[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s17 (arlen_s17[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s17 (arsize_s17[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s17 (arburst_s17[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s17 (arlock_s17[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s17 (arcache_s17[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s17 (arprot_s17[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s17 (arid_s17[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s17 (arready_s[17])
                                ,.awvalid_s17 (awvalid_s[17])
                                ,.awaddr_s17 (awaddr_s17[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s17 (awlen_s17[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s17 (awsize_s17[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s17 (awburst_s17[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s17 (awlock_s17[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s17 (awcache_s17[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s17 (awprot_s17[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s17 (awid_s17[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s17 (awready_s[17])
                                ,.rvalid_s17 (rvalid_s[17])
                                ,.rlast_s17 (rlast_s[17])
                                ,.rdata_s17 (rdata_s17[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s17 (rresp_s17)
                                ,.rid_s17 (rid_s17[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s17 (rready_s[17])
                                ,.wvalid_s17 (wvalid_s[17])
                                ,.wlast_s17 (wlast_s[17])
                                ,.wdata_s17 (wdata_s17[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s17 (wstrb_s17[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s17 (wid_s17[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s17 (wready_s[17])
                                ,.bvalid_s17 (bvalid_s[17])
                                ,.bresp_s17 (bresp_s17)
                                ,.bid_s17 (bid_s17[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s17 (bready_s[17])
                                ,.cactive_s17 (cactive_s_bus_ext[17])
                                ,.csysreq_s17 (csysreq_s_bus_ext[17])
                                ,.csysack_s17 (csysack_s_bus_ext[17])
`endif
`ifdef AXI_HAS_S18
                                ,.arvalid_s18 (arvalid_s[18])
                                ,.araddr_s18 (araddr_s18[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s18 (arlen_s18[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s18 (arsize_s18[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s18 (arburst_s18[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s18 (arlock_s18[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s18 (arcache_s18[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s18 (arprot_s18[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s18 (arid_s18[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s18 (arready_s[18])
                                ,.awvalid_s18 (awvalid_s[18])
                                ,.awaddr_s18 (awaddr_s18[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s18 (awlen_s18[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s18 (awsize_s18[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s18 (awburst_s18[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s18 (awlock_s18[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s18 (awcache_s18[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s18 (awprot_s18[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s18 (awid_s18[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s18 (awready_s[18])
                                ,.rvalid_s18 (rvalid_s[18])
                                ,.rlast_s18 (rlast_s[18])
                                ,.rdata_s18 (rdata_s18[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s18 (rresp_s18)
                                ,.rid_s18 (rid_s18[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s18 (rready_s[18])
                                ,.wvalid_s18 (wvalid_s[18])
                                ,.wlast_s18 (wlast_s[18])
                                ,.wdata_s18 (wdata_s18[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s18 (wstrb_s18[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s18 (wid_s18[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s18 (wready_s[18])
                                ,.bvalid_s18 (bvalid_s[18])
                                ,.bresp_s18 (bresp_s18)
                                ,.bid_s18 (bid_s18[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s18 (bready_s[18])
                                ,.cactive_s18 (cactive_s_bus_ext[18])
                                ,.csysreq_s18 (csysreq_s_bus_ext[18])
                                ,.csysack_s18 (csysack_s_bus_ext[18])
`endif
`ifdef AXI_HAS_S19
                                ,.arvalid_s19 (arvalid_s[19])
                                ,.araddr_s19 (araddr_s19[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s19 (arlen_s19[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s19 (arsize_s19[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s19 (arburst_s19[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s19 (arlock_s19[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s19 (arcache_s19[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s19 (arprot_s19[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s19 (arid_s19[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s19 (arready_s[19])
                                ,.awvalid_s19 (awvalid_s[19])
                                ,.awaddr_s19 (awaddr_s19[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s19 (awlen_s19[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s19 (awsize_s19[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s19 (awburst_s19[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s19 (awlock_s19[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s19 (awcache_s19[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s19 (awprot_s19[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s19 (awid_s19[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s19 (awready_s[19])
                                ,.rvalid_s19 (rvalid_s[19])
                                ,.rlast_s19 (rlast_s[19])
                                ,.rdata_s19 (rdata_s19[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s19 (rresp_s19)
                                ,.rid_s19 (rid_s19[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s19 (rready_s[19])
                                ,.wvalid_s19 (wvalid_s[19])
                                ,.wlast_s19 (wlast_s[19])
                                ,.wdata_s19 (wdata_s19[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s19 (wstrb_s19[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s19 (wid_s19[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s19 (wready_s[19])
                                ,.bvalid_s19 (bvalid_s[19])
                                ,.bresp_s19 (bresp_s19)
                                ,.bid_s19 (bid_s19[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s19 (bready_s[19])
                                ,.cactive_s19 (cactive_s_bus_ext[19])
                                ,.csysreq_s19 (csysreq_s_bus_ext[19])
                                ,.csysack_s19 (csysack_s_bus_ext[19])
`endif
`ifdef AXI_HAS_S20
                                ,.arvalid_s20 (arvalid_s[20])
                                ,.araddr_s20 (araddr_s20[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s20 (arlen_s20[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s20 (arsize_s20[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s20 (arburst_s20[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s20 (arlock_s20[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s20 (arcache_s20[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s20 (arprot_s20[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s20 (arid_s20[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s20 (arready_s[20])
                                ,.awvalid_s20 (awvalid_s[20])
                                ,.awaddr_s20 (awaddr_s20[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s20 (awlen_s20[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s20 (awsize_s20[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s20 (awburst_s20[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s20 (awlock_s20[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s20 (awcache_s20[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s20 (awprot_s20[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s20 (awid_s20[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s20 (awready_s[20])
                                ,.rvalid_s20 (rvalid_s[20])
                                ,.rlast_s20 (rlast_s[20])
                                ,.
          rdata_s20 (rdata_s20[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s20 (rresp_s20)
                                ,.rid_s20 (rid_s20[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s20 (rready_s[20])
                                ,.wvalid_s20 (wvalid_s[20])
                                ,.wlast_s20 (wlast_s[20])
                                ,.wdata_s20 (wdata_s20[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s20 (wstrb_s20[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s20 (wid_s20[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s20 (wready_s[20])
                                ,.bvalid_s20 (bvalid_s[20])
                                ,.bresp_s20 (bresp_s20)
                                ,.bid_s20 (bid_s20[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s20 (bready_s[20])
                                ,.cactive_s20 (cactive_s_bus_ext[20])
                                ,.csysreq_s20 (csysreq_s_bus_ext[20])
                                ,.csysack_s20 (csysack_s_bus_ext[20])
`endif
`ifdef AXI_HAS_S21
                                ,.arvalid_s21 (arvalid_s[21])
                                ,.araddr_s21 (araddr_s21[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s21 (arlen_s21[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s21 (arsize_s21[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s21 (arburst_s21[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s21 (arlock_s21[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s21 (arcache_s21[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s21 (arprot_s21[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s21 (arid_s21[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s21 (arready_s[21])
                                ,.awvalid_s21 (awvalid_s[21])
                                ,.awaddr_s21 (awaddr_s21[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s21 (awlen_s21[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s21 (awsize_s21[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s21 (awburst_s21[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s21 (awlock_s21[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s21 (awcache_s21[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s21 (awprot_s21[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s21 (awid_s21[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s21 (awready_s[21])
                                ,.rvalid_s21 (rvalid_s[21])
                                ,.rlast_s21 (rlast_s[21])
                                ,.rdata_s21 (rdata_s21[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s21 (rresp_s21)
                                ,.rid_s21 (rid_s21[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s21 (rready_s[21])
                                ,.wvalid_s21 (wvalid_s[21])
                                ,.wlast_s21 (wlast_s[21])
                                ,.wdata_s21 (wdata_s21[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s21 (wstrb_s21[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s21 (wid_s21[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s21 (wready_s[21])
                                ,.bvalid_s21 (bvalid_s[21])
                                ,.bresp_s21 (bresp_s21)
                                ,.bid_s21 (bid_s21[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s21 (bready_s[21])
                                ,.cactive_s21 (cactive_s_bus_ext[21])
                                ,.csysreq_s21 (csysreq_s_bus_ext[21])
                                ,.csysack_s21 (csysack_s_bus_ext[21])
`endif
`ifdef AXI_HAS_S22
                                ,.arvalid_s22 (arvalid_s[22])
                                ,.araddr_s22 (araddr_s22[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s22 (arlen_s22[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s22 (arsize_s22[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s22 (arburst_s22[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s22 (arlock_s22[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s22 (arcache_s22[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s22 (arprot_s22[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s22 (arid_s22[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s22 (arready_s[22])
                                ,.awvalid_s22 (awvalid_s[22])
                                ,.awaddr_s22 (awaddr_s22[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s22 (awlen_s22[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s22 (awsize_s22[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s22 (awburst_s22[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s22 (awlock_s22[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s22 (awcache_s22[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s22 (awprot_s22[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s22 (awid_s22[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s22 (awready_s[22])
                                ,.rvalid_s22 (rvalid_s[22])
                                ,.rlast_s22 (rlast_s[22])
                                ,.rdata_s22 (rdata_s22[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s22 (rresp_s22)
                                ,.rid_s22 (rid_s22[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s22 (rready_s[22])
                                ,.wvalid_s22 (wvalid_s[22])
                                ,.wlast_s22 (wlast_s[22])
                                ,.wdata_s22 (wdata_s22[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s22 (wstrb_s22[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s22 (wid_s22[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s22 (wready_s[22])
                                ,.bvalid_s22 (bvalid_s[22])
                                ,.bresp_s22 (bresp_s22)
                                ,.bid_s22 (bid_s22[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s22 (bready_s[22])
                                ,.cactive_s22 (cactive_s_bus_ext[22])
                                ,.csysreq_s22 (csysreq_s_bus_ext[22])
                                ,.csysack_s22 (csysack_s_bus_ext[22])
`endif
`ifdef AXI_HAS_S23
                                ,.arvalid_s23 (arvalid_s[23])
                                ,.araddr_s23 (araddr_s23[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s23 (arlen_s23[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s23 (arsize_s23[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s23 (arburst_s23[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s23 (arlock_s23[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s23 (arcache_s23[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s23 (arprot_s23[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s23 (arid_s23[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s23 (arready_s[23])
                                ,.awvalid_s23 (awvalid_s[23])
                                ,.awaddr_s23 (awaddr_s23[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s23 (awlen_s23[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s23 (awsize_s23[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s23 (awburst_s23[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s23 (awlock_s23[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s23 (awcache_s23[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s23 (awprot_s23[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s23 (awid_s23[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s23 (awready_s[23])
                                ,.rvalid_s23 (rvalid_s[23])
                                ,.rlast_s23 (rlast_s[23])
                                ,.rdata_s23 (rdata_s23[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s23 (rresp_s23)
                                ,.rid_s23 (rid_s23[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s23 (rready_s[23])
                                ,.wvalid_s23 (wvalid_s[23])
                                ,.wlast_s23 (wlast_s[23])
                                ,.wdata_s23 (wdata_s23[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s23 (wstrb_s23[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s23 (wid_s23[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s23 (wready_s[23])
                                ,.bvalid_s23 (bvalid_s[23])
                                ,.bresp_s23 (bresp_s23)
                                ,.bid_s23 (bid_s23[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s23 (bready_s[23])
                                ,.cactive_s23 (cactive_s_bus_ext[23])
                                ,.csysreq_s23 (csysreq_s_bus_ext[23])
                                ,.csysack_s23 (csysack_s_bus_ext[23])
`endif
`ifdef AXI_HAS_S24
                                ,.arvalid_s24 (arvalid_s[24])
                                ,.araddr_s24 (araddr_s24[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s24 (arlen_s24[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s24 (arsize_s24[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s24 (arburst_s24[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s24 (arlock_s24[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s24 (arcache_s24[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s24 (arprot_s24[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s24 (arid_s24[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s24 (arready_s[24])
                                ,.awvalid_s24 (awvalid_s[24])
                                ,.awaddr_s24 (awaddr_s24[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s24 (awlen_s24[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s24 (awsize_s24[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s24 (awburst_s24[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s24 (awlock_s24[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s24 (awcache_s24[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s24 (awprot_s24[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s24 (awid_s24[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s24 (awready_s[24])
                                ,.rvalid_s24 (rvalid_s[24])
                                ,.rlast_s24 (rlast_s[24])
                                ,.rdata_s24 (rdata_s24[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s24 (rresp_s24)
                                ,.rid_s24 (rid_s24[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s24 (rready_s[24])
                                ,.wvalid_s24 (wvalid_s[24])
                                ,.wlast_s24 (wlast_s[24])
                                ,.wdata_s24 (wdata_s24[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s24 (wstrb_s24[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s24 (wid_s24[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s24 (wready_s[24])
                                ,.bvalid_s24 (bvalid_s[24])
                                ,.bresp_s24 (bresp_s24)
                                ,.bid_s24 (bid_s24[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s24 (bready_s[24])
                                ,.cactive_s24 (cactive_s_bus_ext[24])
                                ,.csysreq_s24 (csysreq_s_bus_ext[24])
                                ,.csysack_s24 (csysack_s_bus_ext[24])
`endif
`ifdef AXI_HAS_S25
                                ,.arvalid_s25 (arvalid_s[25])
                                ,.araddr_s25 (araddr_s25[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s25 (arlen_s25[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s25 (arsize_s25[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s25 (arburst_s25[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s25 (arlock_s25[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s25 (arcache_s25[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s25 (arprot_s25[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s25 (arid_s25[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s25 (arready_s[25])
                                ,.awvalid_s25 (awvalid_s[25])
                                ,.awaddr_s25 (awaddr_s25[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s25 (awlen_s25[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s25 (awsize_s25[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s25 (awburst_s25[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s25 (awlock_s25[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s25 (awcache_s25[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s25 (awprot_s25[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s25 (awid_s25[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s25 (awready_s[25])
                                ,.rvalid_s25 (rvalid_s[25])
                                ,.rlast_s25 (rlast_s[25])
                                ,.rdata_s25 (rdata_s25[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s25 (rresp_s25)
                                ,.rid_s25 (rid_s25[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s25 (rready_s[25])
                                ,.wvalid_s25 (wvalid_s[25])
                                ,.wlast_s25 (wlast_s[25])
                                ,.wdata_s25 (wdata_s25[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s25 (wstrb_s25[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s25 (wid_s25[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s25 (wready_s[25])
                                ,.bvalid_s25 (bvalid_s[25])
                                ,.bresp_s25 (bresp_s25)
                                ,.bid_s25 (bid_s25[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s25 (bready_s[25])
                                ,.cactive_s25 (cactive_s_bus_ext[25])
                                ,.csysreq_s25 (csysreq_s_bus_ext[25])
                                ,.csysack_s25 (csysack_s_bus_ext[25])
`endif
`ifdef AXI_HAS_S26
                                ,.arvalid_s26 (arvalid_s[26])
                                ,.araddr_s26 (araddr_s26[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s26 (arlen_s26[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s26 (arsize_s26[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s26 (arburst_s26[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s26 (arlock_s26[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s26 (arcache_s26[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s26 (arprot_s26[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s26 (arid_s26[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s26 (arready_s[26])
                                ,.awvalid_s26 (awvalid_s[26])
                                ,.awaddr_s26 (awaddr_s26[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s26 (awlen_s26[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s26 (awsize_s26[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s26 (awburst_s26[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s26 (awlock_s26[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s26 (awcache_s26[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s26 (awprot_s26[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s26 (awid_s26[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s26 (awready_s[26])
                                ,.rvalid_s26 (rvalid_s[26])
                                ,.rlast_s26 (rlast_s[26])
                                ,.rdata_s26 (rdata_s26[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s26 (rresp_s26)
                                ,.rid_s26 (rid_s26[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s26 (rready_s[26])
                                ,.wvalid_s26 (wvalid_s[26])
                                ,.wlast_s26 (wlast_s[26])
                                ,.wdata_s26 (wdata_s26[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s26 (wstrb_s26[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s26 (wid_s26[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s26 (wready_s[26])
                                ,.bvalid_s26 (bvalid_s[26])
                                ,.bresp_s26 (bresp_s26)
                                ,.bid_s26 (bid_s26[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s26 (bready_s[26])
                                ,.cactive_s26 (cactive_s_bus_ext[26])
                                ,.csysreq_s26 (csysreq_s_bus_ext[26])
                                ,.csysack_s26 (csysack_s_bus_ext[26])
`endif
`ifdef AXI_HAS_S27
                                ,.arvalid_s27 (arvalid_s[27])
                                ,.araddr_s27 (araddr_s27[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s27 (arlen_s27[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s27 (arsize_s27[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s27 (arburst_s27[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s27 (arlock_s27[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s27 (arcache_s27[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s27 (arprot_s27[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s27 (arid_s27[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s27 (arready_s[27])
                                ,.awvalid_s27 (awvalid_s[27])
                                ,.awaddr_s27 (awaddr_s27[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s27 (awlen_s27[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s27 (awsize_s27[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s27 (awburst_s27[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s27 (awlock_s27[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s27 (awcache_s27[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s27 (awprot_s27[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s27 (awid_s27[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s27 (awready_s[27])
                                ,.rvalid_s27 (rvalid_s[27])
                                ,.rlast_s27 (rlast_s[27])
                                ,.rdata_s27 (rdata_s27[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s27 (rresp_s27)
                                ,.rid_s27 (rid_s27[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s27 (rready_s[27])
                                ,.wvalid_s27 (wvalid_s[27])
                                ,.wlast_s27 (wlast_s[27])
                                ,.wdata_s27 (wdata_s27[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s27 (wstrb_s27[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s27 (wid_s27[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s27 (wready_s[27])
                                ,.bvalid_s27 (bvalid_s[27])
                                ,.bresp_s27 (bresp_s27)
                                ,.bid_s27 (bid_s27[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s27 (bready_s[27])
                                ,.cactive_s27 (cactive_s_bus_ext[27])
                                ,.csysreq_s27 (csysreq_s_bus_ext[27])
                                ,.csysack_s27 (csysack_s_bus_ext[27])
`endif
`ifdef AXI_HAS_S28
                                ,.arvalid_s28 (arvalid_s[28])
                                ,.araddr_s28 (araddr_s28[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s28 (arlen_s28[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s28 (arsize_s28[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s28 (arburst_s28[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s28 (arlock_s28[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s28 (arcache_s28[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s28 (arprot_s28[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s28 (arid_s28[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s28 (arready_s[28])
                                ,.awvalid_s28 (awvalid_s[28])
                                ,.awaddr_s28 (awaddr_s28[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s28 (awlen_s28[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s28 (awsize_s28[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s28 (awburst_s28[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s28 (awlock_s28[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s28 (awcache_s28[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s28 (awprot_s28[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s28 (awid_s28[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s28 (awready_s[28])
                                ,.rvalid_s28 (rvalid_s[28])
                                ,.rlast_s28 (rlast_s[28])
                                ,.rdata_s28 (rdata_s28[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s28 (rresp_s28)
                                ,.rid_s28 (rid_s28[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s28 (rready_s[28])
                                ,.wvalid_s28 (wvalid_s[28])
                                ,.wlast_s28 (wlast_s[28])
                                ,.wdata_s28 (wdata_s28[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s28 (wstrb_s28[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s28 (wid_s28[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s28 (wready_s[28])
                                ,.bvalid_s28 (bvalid_s[28])
                                ,.bresp_s28 (bresp_s28)
                                ,.bid_s28 (bid_s28[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s28 (bready_s[28])
                                ,.cactive_s28 (cactive_s_bus_ext[28])
                                ,.csysreq_s28 (csysreq_s_bus_ext[28])
                                ,.csysack_s28 (csysack_s_bus_ext[28])
`endif
`ifdef AXI_HAS_S29
                                ,.arvalid_s29 (arvalid_s[29])
                                ,.araddr_s29 (araddr_s29[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s29 (arlen_s29[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s29 (arsize_s29[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s29 (arburst_s29[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s29 (arlock_s29[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s29 (arcache_s29[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s29 (arprot_s29[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s29 (arid_s29[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s29 (arready_s[29])
                                ,.awvalid_s29 (awvalid_s[29])
                                ,.awaddr_s29 (awaddr_s29[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s29 (awlen_s29[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s29 (awsize_s29[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s29 (awburst_s29[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s29 (awlock_s29[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s29 (awcache_s29[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s29 (awprot_s29[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s29 (awid_s29[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s29 (awready_s[29])
                                ,.rvalid_s29 (rvalid_s[29])
                                ,.rlast_s29 (rlast_s[29])
                                ,.rdata_s29 (rdata_s29[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s29 (rresp_s29)
                                ,.rid_s29 (rid_s29[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s29 (rready_s[29])
                                ,.wvalid_s29 (wvalid_s[29])
                                ,.wlast_s29 (wlast_s[29])
                                ,.wdata_s29 (wdata_s29[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s29 (wstrb_s29[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s29 (wid_s29[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s29 (wready_s[29])
                                ,.bvalid_s29 (bvalid_s[29])
                                ,.bresp_s29 (bresp_s29)
                                ,.bid_s29 (bid_s29[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s29 (bready_s[29])
                                ,.cactive_s29 (cactive_s_bus_ext[29])
                                ,.csysreq_s29 (csysreq_s_bus_ext[29])
                                ,.csysack_s29 (csysack_s_bus_ext[29])
`endif
`ifdef AXI_HAS_S30
                                ,.arvalid_s30 (arvalid_s[30])
                                ,.araddr_s30 (araddr_s30[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s30 (arlen_s30[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s30 (arsize_s30[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s30 (arburst_s30[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s30 (arlock_s30[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s30 (arcache_s30[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s30 (arprot_s30[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s30 (arid_s30[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s30 (arready_s[30])
                                ,.awvalid_s30 (awvalid_s[30])
                                ,.awaddr_s30 (awaddr_s30[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s30 (awlen_s30[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s30 (awsize_s30[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s30 (awburst_s30[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s30 (awlock_s30[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s30 (awcache_s30[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s30 (awprot_s30[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s30 (awid_s30[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s30 (awready_s[30])
                                ,.rvalid_s30 (rvalid_s[30])
                                ,.rlast_s30 (rlast_s[30])
                                ,.rdata_s30 (rdata_s30[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s30 (rresp_s30)
                                ,.rid_s30 (rid_s30[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s30 (rready_s[30])
                                ,.wvalid_s30 (wvalid_s[30])
                                ,.wlast_s30 (wlast_s[30])
                                ,.wdata_s30 (wdata_s30[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s30 (wstrb_s30[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s30 (wid_s30[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s30 (wready_s[30])
                                ,.bvalid_s30 (bvalid_s[30])
                                ,.bresp_s30 (bresp_s30)
                                ,.bid_s30 (bid_s30[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s30 (bready_s[30])
                                ,.cactive_s30 (cactive_s_bus_ext[30])
                                ,.csysreq_s30 (csysreq_s_bus_ext[30])
                                ,.csysack_s30 (csysack_s_bus_ext[30])
`endif
`ifdef AXI_HAS_S31
                                ,.arvalid_s31 (arvalid_s[31])
                                ,.araddr_s31 (araddr_s31[`DW_VIP_AXI_ARADDR_PORT_WIDTH-1:0])
                                ,.arlen_s31 (arlen_s31[`DW_VIP_AXI_ARLEN_PORT_WIDTH-1:0])
                                ,.arsize_s31 (arsize_s31[`DW_VIP_AXI_ARSIZE_PORT_WIDTH-1:0])
                                ,.arburst_s31 (arburst_s31[`DW_VIP_AXI_ARBURST_PORT_WIDTH-1:0])
                                ,.arlock_s31 (arlock_s31[`DW_VIP_AXI_ARLOCK_PORT_WIDTH-1:0])
                                ,.arcache_s31 (arcache_s31[`DW_VIP_AXI_ARCACHE_PORT_WIDTH-1:0])
                                ,.arprot_s31 (arprot_s31[`DW_VIP_AXI_ARPROT_PORT_WIDTH-1:0])
                                ,.arid_s31 (arid_s31[`DW_VIP_AXI_ARID_PORT_WIDTH-1:0])
                                ,.arready_s31 (arready_s[31])
                                ,.awvalid_s31 (awvalid_s[31])
                                ,.awaddr_s31 (awaddr_s31[`DW_VIP_AXI_AWADDR_PORT_WIDTH-1:0])
                                ,.awlen_s31 (awlen_s31[`DW_VIP_AXI_AWLEN_PORT_WIDTH-1:0])
                                ,.awsize_s31 (awsize_s31[`DW_VIP_AXI_AWSIZE_PORT_WIDTH-1:0])
                                ,.awburst_s31 (awburst_s31[`DW_VIP_AXI_AWBURST_PORT_WIDTH-1:0])
                                ,.awlock_s31 (awlock_s31[`DW_VIP_AXI_AWLOCK_PORT_WIDTH-1:0])
                                ,.awcache_s31 (awcache_s31[`DW_VIP_AXI_AWCACHE_PORT_WIDTH-1:0])
                                ,.awprot_s31 (awprot_s31[`DW_VIP_AXI_AWPROT_PORT_WIDTH-1:0])
                                ,.awid_s31 (awid_s31[`DW_VIP_AXI_AWID_PORT_WIDTH-1:0])
                                ,.awready_s31 (awready_s[31])
                                ,.rvalid_s31 (rvalid_s[31])
                                ,.rlast_s31 (rlast_s[31])
                                ,.rdata_s31 (rdata_s31[`DW_VIP_AXI_RDATA_PORT_WIDTH-1:0])
                                ,.rresp_s31 (rresp_s31)
                                ,.rid_s31 (rid_s31[`DW_VIP_AXI_RID_PORT_WIDTH-1:0])
                                ,.rready_s31 (rready_s[31])
                                ,.wvalid_s31 (wvalid_s[31])
                                ,.wlast_s31 (wlast_s[31])
                                ,.wdata_s31 (wdata_s31[`DW_VIP_AXI_WDATA_PORT_WIDTH-1:0])
                                ,.wstrb_s31 (wstrb_s31[`DW_VIP_AXI_WSTRB_PORT_WIDTH-1:0])
                                ,.wid_s31 (wid_s31[`DW_VIP_AXI_WID_PORT_WIDTH-1:0])
                                ,.wready_s31 (wready_s[31])
                                ,.bvalid_s31 (bvalid_s[31])
                                ,.bresp_s31 (bresp_s31)
                                ,.bid_s31 (bid_s31[`DW_VIP_AXI_BID_PORT_WIDTH-1:0])
                                ,.bready_s31 (bready_s[31])
                                ,.cactive_s31 (cactive_s_bus_ext[31])
                                ,.csysreq_s31 (csysreq_s_bus_ext[31])
                                ,.csysack_s31 (csysack_s_bus_ext[31])
`endif
);


  // Set all master priorities to equal during lock arbitration test.
  // So we can generate failure condition.
  `ifdef AXI_EXT_PRIORITY
  always @(tb_lock_arb_test_on) begin
    for(master_num = 1; master_num <= `AXI_NUM_MASTERS; master_num = master_num + 1) begin
      set_master_priority[master_num] = tb_lock_arb_test_on ? 0 : $random(seed);
    end
  end
  `endif



// DEBUG, 4k boundary broken checker.
/*
always @(*) begin : boundary_4k_check_PROC
  reg [31:0] asize_bytes;
  reg [31:0] tx_bytes;
  reg [31:0] hex_4k;
  reg [31:0] hex_4k_mask;
  reg [31:0] end_addr;

  hex_4k = 32'h00001000;
  hex_4k_mask = 32'hfffff000;
  asize_bytes = 1'b1 << awsize_m1;
  tx_bytes = asize_bytes * (awlen_m1+1);
  end_addr = awaddr_m1 + tx_bytes;

  if((end_addr > ((awaddr_m1 + hex_4k) & hex_4k_mask)) & (awburst_m1 == 2'b01)) begin
    $display("--------------");
    $display("DEBUG, %t, 4K BOUNDARY BROKEN AT M1 AW", $time);
    $display("DEBUG,  start_addr %0h, end_addr %0h", awaddr_m1, end_addr);
    $display("DEBUG,  size %0h, asize_bytes %0d", awsize_m1, asize_bytes);
    $display("DEBUG,  len %0h, tx_bytes %0d", awlen_m1, tx_bytes);
    $display("DEBUG,  4k boundary %0h", ((awaddr_m1 + hex_4k) & hex_4k_mask));
    $display("--------------");
  end

end // boundary_4k_check_PROC
*/


// DUT Instantiation
  DW_axi U_DW_axi(
                                .aclk (aclklp)
                                //.aclk (aclk)
                                ,.aresetn (aresetn)
   `ifdef AXI_REMAP
                                ,.remap_n (remap_n)
   `endif

   `ifdef AXI_EXT_PRIORITY
   `ifdef AXI_SHARED_LAYER_MASTER_PRIORITY_EN
                               ,.mst_priority_shared (mst_priority_shared)
   `endif
   `ifdef AXI_SHARED_LAYER_SLAVE_PRIORITY_EN
                               ,.slv_priority_shared (slv_priority_shared)
   `endif
   `endif

`ifdef AXI_HAS_M1
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m1 (xdcdr_slv_num_rd_m1)
                                ,.xdcdr_slv_num_wr_m1 (xdcdr_slv_num_wr_m1)
   `endif
                                ,.awid_m1    (awid_m1)
                                ,.awaddr_m1  (awaddr_m1)
                                ,.awlen_m1   (awlen_m1)
                                ,.awsize_m1  (awsize_m1)
                                ,.awburst_m1 (awburst_m1)
                                ,.awlock_m1  (awlock_m1)
                                ,.awcache_m1 (awcache_m1)
                                ,.awprot_m1  (awprot_m1)
                                ,.awvalid_m1 (awvalid_m[1])
                                ,.awready_m1 (awready_m[1])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m1 (awsideband_m1)
   `endif
                                ,.wid_m1    (wid_m1)
                                ,.wdata_m1  (wdata_m1)
                                ,.wstrb_m1  (wstrb_m1)
                                ,.wlast_m1  (wlast_m[1])
                                ,.wvalid_m1 (wvalid_m[1])
                                ,.wready_m1 (wready_m[1])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m1 (wsideband_m1)
   `endif
                                ,.bid_m1    (bid_m1)
                                ,.bresp_m1  (bresp_m1)
                                ,.bvalid_m1 (bvalid_m[1])
                                ,.bready_m1 (bready_m[1])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m1 (bsideband_m1)
   `endif
                                ,.arid_m1    (arid_m1)
                                ,.araddr_m1  (araddr_m1)
                                ,.arlen_m1   (arlen_m1)
                                ,.arsize_m1  (arsize_m1)
                                ,.arburst_m1 (arburst_m1)
                                ,.arlock_m1  (arlock_m1)
                                ,.arcache_m1 (arcache_m1)
                                ,.arprot_m1  (arprot_m1)
                                ,.arvalid_m1 (arvalid_m[1])
                                ,.arready_m1 (arready_m[1])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m1 (arsideband_m1)
   `endif
                                ,.rid_m1    (rid_m1)
                                ,.rdata_m1  (rdata_m1)
                                ,.rresp_m1  (rresp_m1)
                                ,.rlast_m1  (rlast_m[1])
                                ,.rvalid_m1 (rvalid_m[1])
                                ,.rready_m1 (rready_m[1])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m1 (rsideband_m1)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m1(axi_master_priority[1])
   `endif
`endif
`ifdef AXI_HAS_M2
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m2 (xdcdr_slv_num_rd_m2)
                                ,.xdcdr_slv_num_wr_m2 (xdcdr_slv_num_wr_m2)
   `endif
                                ,.awid_m2    (awid_m2)
                                ,.awaddr_m2  (awaddr_m2)
                                ,.awlen_m2   (awlen_m2)
                                ,.awsize_m2  (awsize_m2)
                                ,.awburst_m2 (awburst_m2)
                                ,.awlock_m2  (awlock_m2)
                                ,.awcache_m2 (awcache_m2)
                                ,.awprot_m2  (awprot_m2)
                                ,.awvalid_m2 (awvalid_m[2])
                                ,.awready_m2 (awready_m[2])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m2 (awsideband_m2)
   `endif
                                ,.wid_m2    (wid_m2)
                                ,.wdata_m2  (wdata_m2)
                                ,.wstrb_m2  (wstrb_m2)
                                ,.wlast_m2  (wlast_m[2])
                                ,.wvalid_m2 (wvalid_m[2])
                                ,.wready_m2 (wready_m[2])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m2 (wsideband_m2)
   `endif
                                ,.bid_m2    (bid_m2)
                                ,.bresp_m2  (bresp_m2)
                                ,.bvalid_m2 (bvalid_m[2])
                                ,.bready_m2 (bready_m[2])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m2 (bsideband_m2)
   `endif
                                ,.arid_m2    (arid_m2)
                                ,.araddr_m2  (araddr_m2)
                                ,.arlen_m2   (arlen_m2)
                                ,.arsize_m2  (arsize_m2)
                                ,.arburst_m2 (arburst_m2)
                                ,.arlock_m2  (arlock_m2)
                                ,.arcache_m2 (arcache_m2)
                                ,.arprot_m2  (arprot_m2)
                                ,.arvalid_m2 (arvalid_m[2])
                                ,.arready_m2 (arready_m[2])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m2 (arsideband_m2)
   `endif
                                ,.rid_m2    (rid_m2)
                                ,.rdata_m2  (rdata_m2)
                                ,.rresp_m2  (rresp_m2)
                                ,.rlast_m2  (rlast_m[2])
                                ,.rvalid_m2 (rvalid_m[2])
                                ,.rready_m2 (rready_m[2])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m2 (rsideband_m2)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m2(axi_master_priority[2])
   `endif
`endif
`ifdef AXI_HAS_M3
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m3 (xdcdr_slv_num_rd_m3)
                                ,.xdcdr_slv_num_wr_m3 (xdcdr_slv_num_wr_m3)
   `endif
                                ,.awid_m3    (awid_m3)
                                ,.awaddr_m3  (awaddr_m3)
                                ,.awlen_m3   (awlen_m3)
                                ,.awsize_m3  (awsize_m3)
                                ,.awburst_m3 (awburst_m3)
                                ,.awlock_m3  (awlock_m3)
                                ,.awcache_m3 (awcache_m3)
                                ,.awprot_m3  (awprot_m3)
                                ,.awvalid_m3 (awvalid_m[3])
                                ,.awready_m3 (awready_m[3])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m3 (awsideband_m3)
   `endif
                                ,.wid_m3    (wid_m3)
                                ,.wdata_m3  (wdata_m3)
                                ,.wstrb_m3  (wstrb_m3)
                                ,.wlast_m3  (wlast_m[3])
                                ,.wvalid_m3 (wvalid_m[3])
                                ,.wready_m3 (wready_m[3])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m3 (wsideband_m3)
   `endif
                                ,.bid_m3    (bid_m3)
                                ,.bresp_m3  (bresp_m3)
                                ,.bvalid_m3 (bvalid_m[3])
                                ,.bready_m3 (bready_m[3])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m3 (bsideband_m3)
   `endif
                                ,.arid_m3    (arid_m3)
                                ,.araddr_m3  (araddr_m3)
                                ,.arlen_m3   (arlen_m3)
                                ,.arsize_m3  (arsize_m3)
                                ,.arburst_m3 (arburst_m3)
                                ,.arlock_m3  (arlock_m3)
                                ,.arcache_m3 (arcache_m3)
                                ,.arprot_m3  (arprot_m3)
                                ,.arvalid_m3 (arvalid_m[3])
                                ,.arready_m3 (arready_m[3])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m3 (arsideband_m3)
   `endif
                                ,.rid_m3    (rid_m3)
                                ,.rdata_m3  (rdata_m3)
                                ,.rresp_m3  (rresp_m3)
                                ,.rlast_m3  (rlast_m[3])
                                ,.rvalid_m3 (rvalid_m[3])
                                ,.rready_m3 (rready_m[3])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m3 (rsideband_m3)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m3(axi_master_priority[3])
   `endif
`endif
`ifdef AXI_HAS_M4
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m4 (xdcdr_slv_num_rd_m4)
                                ,.xdcdr_slv_num_wr_m4 (xdcdr_slv_num_wr_m4)
   `endif
                                ,.awid_m4    (awid_m4)
                                ,.awaddr_m4  (awaddr_m4)
                                ,.awlen_m4   (awlen_m4)
                                ,.awsize_m4  (awsize_m4)
                                ,.awburst_m4 (awburst_m4)
                                ,.awlock_m4  (awlock_m4)
                                ,.awcache_m4 (awcache_m4)
                                ,.awprot_m4  (awprot_m4)
                                ,.awvalid_m4 (awvalid_m[4])
                                ,.awready_m4 (awready_m[4])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m4 (awsideband_m4)
   `endif
                                ,.wid_m4    (wid_m4)
                                ,.wdata_m4  (wdata_m4)
                                ,.wstrb_m4  (wstrb_m4)
                                ,.wlast_m4  (wlast_m[4])
                                ,.wvalid_m4 (wvalid_m[4])
                                ,.wready_m4 (wready_m[4])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m4 (wsideband_m4)
   `endif
                                ,.bid_m4    (bid_m4)
                                ,.bresp_m4  (bresp_m4)
                                ,.bvalid_m4 (bvalid_m[4])
                                ,.bready_m4 (bready_m[4])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m4 (bsideband_m4)
   `endif
                                ,.arid_m4    (arid_m4)
                                ,.araddr_m4  (araddr_m4)
                                ,.arlen_m4   (arlen_m4)
                                ,.arsize_m4  (arsize_m4)
                                ,.arburst_m4 (arburst_m4)
                                ,.arlock_m4  (arlock_m4)
                                ,.arcache_m4 (arcache_m4)
                                ,.arprot_m4  (arprot_m4)
                                ,.arvalid_m4 (arvalid_m[4])
                                ,.arready_m4 (arready_m[4])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m4 (arsideband_m4)
   `endif
                                ,.rid_m4    (rid_m4)
                                ,.rdata_m4  (rdata_m4)
                                ,.rresp_m4  (rresp_m4)
                                ,.rlast_m4  (rlast_m[4])
                                ,.rvalid_m4 (rvalid_m[4])
                                ,.rready_m4 (rready_m[4])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m4 (rsideband_m4)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m4(axi_master_priority[4])
   `endif
`endif
`ifdef AXI_HAS_M5
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m5 (xdcdr_slv_num_rd_m5)
                                ,.xdcdr_slv_num_wr_m5 (xdcdr_slv_num_wr_m5)
   `endif
                                ,.awid_m5    (awid_m5)
                                ,.awaddr_m5  (awaddr_m5)
                                ,.awlen_m5   (awlen_m5)
                                ,.awsize_m5  (awsize_m5)
                                ,.awburst_m5 (awburst_m5)
                                ,.awlock_m5  (awlock_m5)
                                ,.awcache_m5 (awcache_m5)
                                ,.awprot_m5  (awprot_m5)
                                ,.awvalid_m5 (awvalid_m[5])
                                ,.awready_m5 (awready_m[5])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m5 (awsideband_m5)
   `endif
                                ,.wid_m5    (wid_m5)
                                ,.wdata_m5  (wdata_m5)
                                ,.wstrb_m5  (wstrb_m5)
                                ,.wlast_m5  (wlast_m[5])
                                ,.wvalid_m5 (wvalid_m[5])
                                ,.wready_m5 (wready_m[5])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m5 (wsideband_m5)
   `endif
                                ,.bid_m5    (bid_m5)
                                ,.bresp_m5  (bresp_m5)
                                ,.bvalid_m5 (bvalid_m[5])
                                ,.bready_m5 (bready_m[5])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m5 (bsideband_m5)
   `endif
                                ,.arid_m5    (arid_m5)
                                ,.araddr_m5  (araddr_m5)
                                ,.arlen_m5   (arlen_m5)
                                ,.arsize_m5  (arsize_m5)
                                ,.arburst_m5 (arburst_m5)
                                ,.arlock_m5  (arlock_m5)
                                ,.arcache_m5 (arcache_m5)
                                ,.arprot_m5  (arprot_m5)
                                ,.arvalid_m5 (arvalid_m[5])
                                ,.arready_m5 (arready_m[5])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m5 (arsideband_m5)
   `endif
                                ,.rid_m5    (rid_m5)
                                ,.rdata_m5  (rdata_m5)
                                ,.rresp_m5  (rresp_m5)
                                ,.rlast_m5  (rlast_m[5])
                                ,.rvalid_m5 (rvalid_m[5])
                                ,.rready_m5 (rready_m[5])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m5 (rsideband_m5)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m5(axi_master_priority[5])
   `endif
`endif
`ifdef AXI_HAS_M6
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m6 (xdcdr_slv_num_rd_m6)
                                ,.xdcdr_slv_num_wr_m6 (xdcdr_slv_num_wr_m6)
   `endif
                                ,.awid_m6    (awid_m6)
                                ,.awaddr_m6  (awaddr_m6)
                                ,.awlen_m6   (awlen_m6)
                                ,.awsize_m6  (awsize_m6)
                                ,.awburst_m6 (awburst_m6)
                                ,.awlock_m6  (awlock_m6)
                                ,.awcache_m6 (awcache_m6)
                                ,.awprot_m6  (awprot_m6)
                                ,.awvalid_m6 (awvalid_m[6])
                                ,.awready_m6 (awready_m[6])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m6 (awsideband_m6)
   `endif
                                ,.wid_m6    (wid_m6)
                                ,.wdata_m6  (wdata_m6)
                                ,.wstrb_m6  (wstrb_m6)
                                ,.wlast_m6  (wlast_m[6])
                                ,.wvalid_m6 (wvalid_m[6])
                                ,.wready_m6 (wready_m[6])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m6 (wsideband_m6)
   `endif
                                ,.bid_m6    (bid_m6)
                                ,.bresp_m6  (bresp_m6)
                                ,.bvalid_m6 (bvalid_m[6])
                                ,.bready_m6 (bready_m[6])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m6 (bsideband_m6)
   `endif
                                ,.arid_m6    (arid_m6)
                                ,.araddr_m6  (araddr_m6)
                                ,.arlen_m6   (arlen_m6)
                                ,.arsize_m6  (arsize_m6)
                                ,.arburst_m6 (arburst_m6)
                                ,.arlock_m6  (arlock_m6)
                                ,.arcache_m6 (arcache_m6)
                                ,.arprot_m6  (arprot_m6)
                                ,.arvalid_m6 (arvalid_m[6])
                                ,.arready_m6 (arready_m[6])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m6 (arsideband_m6)
   `endif
                                ,.rid_m6    (rid_m6)
                                ,.rdata_m6  (rdata_m6)
                                ,.rresp_m6  (rresp_m6)
                                ,.rlast_m6  (rlast_m[6])
                                ,.rvalid_m6 (rvalid_m[6])
                                ,.rready_m6 (rready_m[6])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m6 (rsideband_m6)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m6(axi_master_priority[6])
   `endif
`endif
`ifdef AXI_HAS_M7
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m7 (xdcdr_slv_num_rd_m7)
                                ,.xdcdr_slv_num_wr_m7 (xdcdr_slv_num_wr_m7)
   `endif
                                ,.awid_m7    (awid_m7)
                                ,.awaddr_m7  (awaddr_m7)
                                ,.awlen_m7   (awlen_m7)
                                ,.awsize_m7  (awsize_m7)
                                ,.awburst_m7 (awburst_m7)
                                ,.awlock_m7  (awlock_m7)
                                ,.awcache_m7 (awcache_m7)
                                ,.awprot_m7  (awprot_m7)
                                ,.awvalid_m7 (awvalid_m[7])
                                ,.awready_m7 (awready_m[7])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m7 (awsideband_m7)
   `endif
                                ,.wid_m7    (wid_m7)
                                ,.wdata_m7  (wdata_m7)
                                ,.wstrb_m7  (wstrb_m7)
                                ,.wlast_m7  (wlast_m[7])
                                ,.wvalid_m7 (wvalid_m[7])
                                ,.wready_m7 (wready_m[7])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m7 (wsideband_m7)
   `endif
                                ,.bid_m7    (bid_m7)
                                ,.bresp_m7  (bresp_m7)
                                ,.bvalid_m7 (bvalid_m[7])
                                ,.bready_m7 (bready_m[7])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m7 (bsideband_m7)
   `endif
                                ,.arid_m7    (arid_m7)
                                ,.araddr_m7  (araddr_m7)
                                ,.arlen_m7   (arlen_m7)
                                ,.arsize_m7  (arsize_m7)
                                ,.arburst_m7 (arburst_m7)
                                ,.arlock_m7  (arlock_m7)
                                ,.arcache_m7 (arcache_m7)
                                ,.arprot_m7  (arprot_m7)
                                ,.arvalid_m7 (arvalid_m[7])
                                ,.arready_m7 (arready_m[7])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m7 (arsideband_m7)
   `endif
                                ,.rid_m7    (rid_m7)
                                ,.rdata_m7  (rdata_m7)
                                ,.rresp_m7  (rresp_m7)
                                ,.rlast_m7  (rlast_m[7])
                                ,.rvalid_m7 (rvalid_m[7])
                                ,.rready_m7 (rready_m[7])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m7 (rsideband_m7)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m7(axi_master_priority[7])
   `endif
`endif
`ifdef AXI_HAS_M8
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m8 (xdcdr_slv_num_rd_m8)
                                ,.xdcdr_slv_num_wr_m8 (xdcdr_slv_num_wr_m8)
   `endif
                                ,.awid_m8    (awid_m8)
                                ,.awaddr_m8  (awaddr_m8)
                                ,.awlen_m8   (awlen_m8)
                                ,.awsize_m8  (awsize_m8)
                                ,.awburst_m8 (awburst_m8)
                                ,.awlock_m8  (awlock_m8)
                                ,.awcache_m8 (awcache_m8)
                                ,.awprot_m8  (awprot_m8)
                                ,.awvalid_m8 (awvalid_m[8])
                                ,.awready_m8 (awready_m[8])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m8 (awsideband_m8)
   `endif
                                ,.wid_m8    (wid_m8)
                                ,.wdata_m8  (wdata_m8)
                                ,.wstrb_m8  (wstrb_m8)
                                ,.wlast_m8  (wlast_m[8])
                                ,.wvalid_m8 (wvalid_m[8])
                                ,.wready_m8 (wready_m[8])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m8 (wsideband_m8)
   `endif
                                ,.bid_m8    (bid_m8)
                                ,.bresp_m8  (bresp_m8)
                                ,.bvalid_m8 (bvalid_m[8])
                                ,.bready_m8 (bready_m[8])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m8 (bsideband_m8)
   `endif
                                ,.arid_m8    (arid_m8)
                                ,.araddr_m8  (araddr_m8)
                                ,.arlen_m8   (arlen_m8)
                                ,.arsize_m8  (arsize_m8)
                                ,.arburst_m8 (arburst_m8)
                                ,.arlock_m8  (arlock_m8)
                                ,.arcache_m8 (arcache_m8)
                                ,.arprot_m8  (arprot_m8)
                                ,.arvalid_m8 (arvalid_m[8])
                                ,.arready_m8 (arready_m[8])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m8 (arsideband_m8)
   `endif
                                ,.rid_m8    (rid_m8)
                                ,.rdata_m8  (rdata_m8)
                                ,.rresp_m8  (rresp_m8)
                                ,.rlast_m8  (rlast_m[8])
                                ,.rvalid_m8 (rvalid_m[8])
                                ,.rready_m8 (rready_m[8])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m8 (rsideband_m8)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m8(axi_master_priority[8])
   `endif
`endif
`ifdef AXI_HAS_M9
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m9 (xdcdr_slv_num_rd_m9)
                                ,.xdcdr_slv_num_wr_m9 (xdcdr_slv_num_wr_m9)
   `endif
                                ,.awid_m9    (awid_m9)
                                ,.awaddr_m9  (awaddr_m9)
                                ,.awlen_m9   (awlen_m9)
                                ,.awsize_m9  (awsize_m9)
                                ,.awburst_m9 (awburst_m9)
                                ,.awlock_m9  (awlock_m9)
                                ,.awcache_m9 (awcache_m9)
                                ,.awprot_m9  (awprot_m9)
                                ,.awvalid_m9 (awvalid_m[9])
                                ,.awready_m9 (awready_m[9])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m9 (awsideband_m9)
   `endif
                                ,.wid_m9    (wid_m9)
                                ,.wdata_m9  (wdata_m9)
                                ,.wstrb_m9  (wstrb_m9)
                                ,.wlast_m9  (wlast_m[9])
                                ,.wvalid_m9 (wvalid_m[9])
                                ,.wready_m9 (wready_m[9])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m9 (wsideband_m9)
   `endif
                                ,.bid_m9    (bid_m9)
                                ,.bresp_m9  (bresp_m9)
                                ,.bvalid_m9 (bvalid_m[9])
                                ,.bready_m9 (bready_m[9])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m9 (bsideband_m9)
   `endif
                                ,.arid_m9    (arid_m9)
                                ,.araddr_m9  (araddr_m9)
                                ,.arlen_m9   (arlen_m9)
                                ,.arsize_m9  (arsize_m9)
                                ,.arburst_m9 (arburst_m9)
                                ,.arlock_m9  (arlock_m9)
                                ,.arcache_m9 (arcache_m9)
                                ,.arprot_m9  (arprot_m9)
                                ,.arvalid_m9 (arvalid_m[9])
                                ,.arready_m9 (arready_m[9])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m9 (arsideband_m9)
   `endif
                                ,.rid_m9    (rid_m9)
                                ,.rdata_m9  (rdata_m9)
                                ,.rresp_m9  (rresp_m9)
                                ,.rlast_m9  (rlast_m[9])
                                ,.rvalid_m9 (rvalid_m[9])
                                ,.rready_m9 (rready_m[9])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m9 (rsideband_m9)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m9(axi_master_priority[9])
   `endif
`endif
`ifdef AXI_HAS_M10
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m10 (xdcdr_slv_num_rd_m10)
                                ,.xdcdr_slv_num_wr_m10 (xdcdr_slv_num_wr_m10)
   `endif
                                ,.awid_m10    (awid_m10)
                                ,.awaddr_m10  (awaddr_m10)
                                ,.awlen_m10   (awlen_m10)
                                ,.awsize_m10  (awsize_m10)
                                ,.awburst_m10 (awburst_m10)
                                ,.awlock_m10  (awlock_m10)
                                ,.awcache_m10 (awcache_m10)
                                ,.awprot_m10  (awprot_m10)
                                ,.awvalid_m10 (awvalid_m[10])
                                ,.awready_m10 (awready_m[10])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m10 (awsideband_m10)
   `endif
                                ,.wid_m10    (wid_m10)
                                ,.wdata_m10  (wdata_m10)
                                ,.wstrb_m10  (wstrb_m10)
                                ,.wlast_m10  (wlast_m[10])
                                ,.wvalid_m10 (wvalid_m[10])
                                ,.wready_m10 (wready_m[10])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m10 (wsideband_m10)
   `endif
                                ,.bid_m10    (bid_m10)
                                ,.bresp_m10  (bresp_m10)
                                ,.bvalid_m10 (bvalid_m[10])
                                ,.bready_m10 (bready_m[10])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m10 (bsideband_m10)
   `endif
                                ,.arid_m10    (arid_m10)
                                ,.araddr_m10  (araddr_m10)
                                ,.arlen_m10   (arlen_m10)
                                ,.arsize_m10  (arsize_m10)
                                ,.arburst_m10 (arburst_m10)
                                ,.arlock_m10  (arlock_m10)
                                ,.arcache_m10 (arcache_m10)
                                ,.arprot_m10  (arprot_m10)
                                ,.arvalid_m10 (arvalid_m[10])
                                ,.arready_m10 (arready_m[10])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m10 (arsideband_m10)
   `endif
                                ,.rid_m10    (rid_m10)
                                ,.rdata_m10  (rdata_m10)
                                ,.rresp_m10  (rresp_m10)
                                ,.rlast_m10  (rlast_m[10])
                                ,.rvalid_m10 (rvalid_m[10])
                                ,.rready_m10 (rready_m[10])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m10 (rsideband_m10)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m10(axi_master_priority[10])
   `endif
`endif
`ifdef AXI_HAS_M11
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m11 (xdcdr_slv_num_rd_m11)
                                ,.xdcdr_slv_num_wr_m11 (xdcdr_slv_num_wr_m11)
   `endif
                                ,.awid_m11    (awid_m11)
                                ,.awaddr_m11  (awaddr_m11)
                                ,.awlen_m11   (awlen_m11)
                                ,.awsize_m11  (awsize_m11)
                                ,.awburst_m11 (awburst_m11)
                                ,.awlock_m11  (awlock_m11)
                                ,.awcache_m11 (awcache_m11)
                                ,.awprot_m11  (awprot_m11)
                                ,.awvalid_m11 (awvalid_m[11])
                                ,.awready_m11 (awready_m[11])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m11 (awsideband_m11)
   `endif
                                ,.wid_m11    (wid_m11)
                                ,.wdata_m11  (wdata_m11)
                                ,.wstrb_m11  (wstrb_m11)
                                ,.wlast_m11  (wlast_m[11])
                                ,.wvalid_m11 (wvalid_m[11])
                                ,.wready_m11 (wready_m[11])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m11 (wsideband_m11)
   `endif
                                ,.bid_m11    (bid_m11)
                                ,.bresp_m11  (bresp_m11)
                                ,.bvalid_m11 (bvalid_m[11])
                                ,.bready_m11 (bready_m[11])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m11 (bsideband_m11)
   `endif
                                ,.arid_m11    (arid_m11)
                                ,.araddr_m11  (araddr_m11)
                                ,.arlen_m11   (arlen_m11)
                                ,.arsize_m11  (arsize_m11)
                                ,.arburst_m11 (arburst_m11)
                                ,.arlock_m11  (arlock_m11)
                                ,.arcache_m11 (arcache_m11)
                                ,.arprot_m11  (arprot_m11)
                                ,.arvalid_m11 (arvalid_m[11])
                                ,.arready_m11 (arready_m[11])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m11 (arsideband_m11)
   `endif
                                ,.rid_m11    (rid_m11)
                                ,.rdata_m11  (rdata_m11)
                                ,.rresp_m11  (rresp_m11)
                                ,.rlast_m11  (rlast_m[11])
                                ,.rvalid_m11 (rvalid_m[11])
                                ,.rready_m11 (rready_m[11])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m11 (rsideband_m11)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m11(axi_master_priority[11])
   `endif
`endif
`ifdef AXI_HAS_M12
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m12 (xdcdr_slv_num_rd_m12)
                                ,.xdcdr_slv_num_wr_m12 (xdcdr_slv_num_wr_m12)
   `endif
                                ,.awid_m12    (awid_m12)
                                ,.awaddr_m12  (awaddr_m12)
                                ,.awlen_m12   (awlen_m12)
                                ,.awsize_m12  (awsize_m12)
                                ,.awburst_m12 (awburst_m12)
                                ,.awlock_m12  (awlock_m12)
                                ,.awcache_m12 (awcache_m12)
                                ,.awprot_m12  (awprot_m12)
                                ,.awvalid_m12 (awvalid_m[12])
                                ,.awready_m12 (awready_m[12])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m12 (awsideband_m12)
   `endif
                                ,.wid_m12    (wid_m12)
                                ,.wdata_m12  (wdata_m12)
                                ,.wstrb_m12  (wstrb_m12)
                                ,.wlast_m12  (wlast_m[12])
                                ,.wvalid_m12 (wvalid_m[12])
                                ,.wready_m12 (wready_m[12])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m12 (wsideband_m12)
   `endif
                                ,.bid_m12    (bid_m12)
                                ,.bresp_m12  (bresp_m12)
                                ,.bvalid_m12 (bvalid_m[12])
                                ,.bready_m12 (bready_m[12])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m12 (bsideband_m12)
   `endif
                                ,.arid_m12    (arid_m12)
                                ,.araddr_m12  (araddr_m12)
                                ,.arlen_m12   (arlen_m12)
                                ,.arsize_m12  (arsize_m12)
                                ,.arburst_m12 (arburst_m12)
                                ,.arlock_m12  (arlock_m12)
                                ,.arcache_m12 (arcache_m12)
                                ,.arprot_m12  (arprot_m12)
                                ,.arvalid_m12 (arvalid_m[12])
                                ,.arready_m12 (arready_m[12])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m12 (arsideband_m12)
   `endif
                                ,.rid_m12    (rid_m12)
                                ,.rdata_m12  (rdata_m12)
                                ,.rresp_m12  (rresp_m12)
                                ,.rlast_m12  (rlast_m[12])
                                ,.rvalid_m12 (rvalid_m[12])
                                ,.rready_m12 (rready_m[12])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m12 (rsideband_m12)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m12(axi_master_priority[12])
   `endif
`endif
`ifdef AXI_HAS_M13
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m13 (xdcdr_slv_num_rd_m13)
                                ,.xdcdr_slv_num_wr_m13 (xdcdr_slv_num_wr_m13)
   `endif
                                ,.awid_m13    (awid_m13)
                                ,.awaddr_m13  (awaddr_m13)
                                ,.awlen_m13   (awlen_m13)
                                ,.awsize_m13  (awsize_m13)
                                ,.awburst_m13 (awburst_m13)
                                ,.awlock_m13  (awlock_m13)
                                ,.awcache_m13 (awcache_m13)
                                ,.awprot_m13  (awprot_m13)
                                ,.awvalid_m13 (awvalid_m[13])
                                ,.awready_m13 (awready_m[13])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m13 (awsideband_m13)
   `endif
                                ,.wid_m13    (wid_m13)
                                ,.wdata_m13  (wdata_m13)
                                ,.wstrb_m13  (wstrb_m13)
                                ,.wlast_m13  (wlast_m[13])
                                ,.wvalid_m13 (wvalid_m[13])
                                ,.wready_m13 (wready_m[13])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m13 (wsideband_m13)
   `endif
                                ,.bid_m13    (bid_m13)
                                ,.bresp_m13  (bresp_m13)
                                ,.bvalid_m13 (bvalid_m[13])
                                ,.bready_m13 (bready_m[13])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m13 (bsideband_m13)
   `endif
                                ,.arid_m13    (arid_m13)
                                ,.araddr_m13  (araddr_m13)
                                ,.arlen_m13   (arlen_m13)
                                ,.arsize_m13  (arsize_m13)
                                ,.arburst_m13 (arburst_m13)
                                ,.arlock_m13  (arlock_m13)
                                ,.arcache_m13 (arcache_m13)
                                ,.arprot_m13  (arprot_m13)
                                ,.arvalid_m13 (arvalid_m[13])
                                ,.arready_m13 (arready_m[13])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m13 (arsideband_m13)
   `endif
                                ,.rid_m13    (rid_m13)
                                ,.rdata_m13  (rdata_m13)
                                ,.rresp_m13  (rresp_m13)
                                ,.rlast_m13  (rlast_m[13])
                                ,.rvalid_m13 (rvalid_m[13])
                                ,.rready_m13 (rready_m[13])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m13 (rsideband_m13)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m13(axi_master_priority[13])
   `endif
`endif
`ifdef AXI_HAS_M14
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m14 (xdcdr_slv_num_rd_m14)
                                ,.xdcdr_slv_num_wr_m14 (xdcdr_slv_num_wr_m14)
   `endif
                                ,.awid_m14    (awid_m14)
                                ,.awaddr_m14  (awaddr_m14)
                                ,.awlen_m14   (awlen_m14)
                                ,.awsize_m14  (awsize_m14)
                                ,.awburst_m14 (awburst_m14)
                                ,.awlock_m14  (awlock_m14)
                                ,.awcache_m14 (awcache_m14)
                                ,.awprot_m14  (awprot_m14)
                                ,.awvalid_m14 (awvalid_m[14])
                                ,.awready_m14 (awready_m[14])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m14 (awsideband_m14)
   `endif
                                ,.wid_m14    (wid_m14)
                                ,.wdata_m14  (wdata_m14)
                                ,.wstrb_m14  (wstrb_m14)
                                ,.wlast_m14  (wlast_m[14])
                                ,.wvalid_m14 (wvalid_m[14])
                                ,.wready_m14 (wready_m[14])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m14 (wsideband_m14)
   `endif
                                ,.bid_m14    (bid_m14)
                                ,.bresp_m14  (bresp_m14)
                                ,.bvalid_m14 (bvalid_m[14])
                                ,.bready_m14 (bready_m[14])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m14 (bsideband_m14)
   `endif
                                ,.arid_m14    (arid_m14)
                                ,.araddr_m14  (araddr_m14)
                                ,.arlen_m14   (arlen_m14)
                                ,.arsize_m14  (arsize_m14)
                                ,.arburst_m14 (arburst_m14)
                                ,.arlock_m14  (arlock_m14)
                                ,.arcache_m14 (arcache_m14)
                                ,.arprot_m14  (arprot_m14)
                                ,.arvalid_m14 (arvalid_m[14])
                                ,.arready_m14 (arready_m[14])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m14 (arsideband_m14)
   `endif
                                ,.rid_m14    (rid_m14)
                                ,.rdata_m14  (rdata_m14)
                                ,.rresp_m14  (rresp_m14)
                                ,.rlast_m14  (rlast_m[14])
                                ,.rvalid_m14 (rvalid_m[14])
                                ,.rready_m14 (rready_m[14])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m14 (rsideband_m14)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m14(axi_master_priority[14])
   `endif
`endif
`ifdef AXI_HAS_M15
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m15 (xdcdr_slv_num_rd_m15)
                                ,.xdcdr_slv_num_wr_m15 (xdcdr_slv_num_wr_m15)
   `endif
                                ,.awid_m15    (awid_m15)
                                ,.awaddr_m15  (awaddr_m15)
                                ,.awlen_m15   (awlen_m15)
                                ,.awsize_m15  (awsize_m15)
                                ,.awburst_m15 (awburst_m15)
                                ,.awlock_m15  (awlock_m15)
                                ,.awcache_m15 (awcache_m15)
                                ,.awprot_m15  (awprot_m15)
                                ,.awvalid_m15 (awvalid_m[15])
                                ,.awready_m15 (awready_m[15])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m15 (awsideband_m15)
   `endif
                                ,.wid_m15    (wid_m15)
                                ,.wdata_m15  (wdata_m15)
                                ,.wstrb_m15  (wstrb_m15)
                                ,.wlast_m15  (wlast_m[15])
                                ,.wvalid_m15 (wvalid_m[15])
                                ,.wready_m15 (wready_m[15])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m15 (wsideband_m15)
   `endif
                                ,.bid_m15    (bid_m15)
                                ,.bresp_m15  (bresp_m15)
                                ,.bvalid_m15 (bvalid_m[15])
                                ,.bready_m15 (bready_m[15])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m15 (bsideband_m15)
   `endif
                                ,.arid_m15    (arid_m15)
                                ,.araddr_m15  (araddr_m15)
                                ,.arlen_m15   (arlen_m15)
                                ,.arsize_m15  (arsize_m15)
                                ,.arburst_m15 (arburst_m15)
                                ,.arlock_m15  (arlock_m15)
                                ,.arcache_m15 (arcache_m15)
                                ,.arprot_m15  (arprot_m15)
                                ,.arvalid_m15 (arvalid_m[15])
                                ,.arready_m15 (arready_m[15])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m15 (arsideband_m15)
   `endif
                                ,.rid_m15    (rid_m15)
                                ,.rdata_m15  (rdata_m15)
                                ,.rresp_m15  (rresp_m15)
                                ,.rlast_m15  (rlast_m[15])
                                ,.rvalid_m15 (rvalid_m[15])
                                ,.rready_m15 (rready_m[15])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m15 (rsideband_m15)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m15(axi_master_priority[15])
   `endif
`endif
`ifdef AXI_HAS_M16
   `ifdef AXI_XDCDR
                                ,.xdcdr_slv_num_rd_m16 (xdcdr_slv_num_rd_m16)
                                ,.xdcdr_slv_num_wr_m16 (xdcdr_slv_num_wr_m16)
   `endif
                                ,.awid_m16    (awid_m16)
                                ,.awaddr_m16  (awaddr_m16)
                                ,.awlen_m16   (awlen_m16)
                                ,.awsize_m16  (awsize_m16)
                                ,.awburst_m16 (awburst_m16)
                                ,.awlock_m16  (awlock_m16)
                                ,.awcache_m16 (awcache_m16)
                                ,.awprot_m16  (awprot_m16)
                                ,.awvalid_m16 (awvalid_m[16])
                                ,.awready_m16 (awready_m[16])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_m16 (awsideband_m16)
   `endif
                                ,.wid_m16    (wid_m16)
                                ,.wdata_m16  (wdata_m16)
                                ,.wstrb_m16  (wstrb_m16)
                                ,.wlast_m16  (wlast_m[16])
                                ,.wvalid_m16 (wvalid_m[16])
                                ,.wready_m16 (wready_m[16])
   `ifdef AXI_INC_WSB
                                ,.wsideband_m16 (wsideband_m16)
   `endif
                                ,.bid_m16    (bid_m16)
                                ,.bresp_m16  (bresp_m16)
                                ,.bvalid_m16 (bvalid_m[16])
                                ,.bready_m16 (bready_m[16])
   `ifdef AXI_INC_BSB
                                ,.bsideband_m16 (bsideband_m16)
   `endif
                                ,.arid_m16    (arid_m16)
                                ,.araddr_m16  (araddr_m16)
                                ,.arlen_m16   (arlen_m16)
                                ,.arsize_m16  (arsize_m16)
                                ,.arburst_m16 (arburst_m16)
                                ,.arlock_m16  (arlock_m16)
                                ,.arcache_m16 (arcache_m16)
                                ,.arprot_m16  (arprot_m16)
                                ,.arvalid_m16 (arvalid_m[16])
                                ,.arready_m16 (arready_m[16])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_m16 (arsideband_m16)
   `endif
                                ,.rid_m16    (rid_m16)
                                ,.rdata_m16  (rdata_m16)
                                ,.rresp_m16  (rresp_m16)
                                ,.rlast_m16  (rlast_m[16])
                                ,.rvalid_m16 (rvalid_m[16])
                                ,.rready_m16 (rready_m[16])
   `ifdef AXI_INC_RSB
                                ,.rsideband_m16 (rsideband_m16)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.mst_priority_m16(axi_master_priority[16])
   `endif
`endif

`ifdef AXI_HAS_S1
            ,.awid_s1    (awid_s1)
                                ,.awaddr_s1  (awaddr_s1)
                                ,.awlen_s1   (awlen_s1)
                                ,.awsize_s1  (awsize_s1)
                                ,.awburst_s1 (awburst_s1)
                                ,.awlock_s1  (awlock_s1)
                                ,.awcache_s1 (awcache_s1)
                                ,.awprot_s1  (awprot_s1)
                                ,.awvalid_s1 (awvalid_s[1])
                                ,.awready_s1 (awready_s[1])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s1 (awsideband_s1)
   `endif
                                ,.wid_s1    (wid_s1)
                                ,.wdata_s1  (wdata_s1)
                                ,.wstrb_s1  (wstrb_s1)
                                ,.wlast_s1  (wlast_s[1])
                                ,.wvalid_s1 (wvalid_s[1])
                                ,.wready_s1 (wready_s[1])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s1 (wsideband_s1)
   `endif
                                ,.bid_s1    (bid_s1)
                                ,.bresp_s1  (bresp_s1)
                                ,.bvalid_s1 (bvalid_s[1])
                                ,.bready_s1 (bready_s[1])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s1 (bsideband_s1)
   `endif
                                ,.arid_s1    (arid_s1)
                                ,.araddr_s1  (araddr_s1)
                                ,.arlen_s1   (arlen_s1)
                                ,.arsize_s1  (arsize_s1)
                                ,.arburst_s1 (arburst_s1)
                                ,.arlock_s1  (arlock_s1)
                                ,.arcache_s1 (arcache_s1)
                                ,.arprot_s1  (arprot_s1)
                                ,.arvalid_s1 (arvalid_s[1])
                                ,.arready_s1 (arready_s[1])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s1 (arsideband_s1)
   `endif
                                ,.rid_s1    (rid_s1)
                                ,.rdata_s1  (rdata_s1)
                                ,.rresp_s1  (rresp_s1)
                                ,.rvalid_s1 (rvalid_s[1])
                                ,.rlast_s1  (rlast_s[1])
                                ,.rready_s1 (rready_s[1])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s1 (rsideband_s1)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s1(axi_slave_priority[1])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s1 (tz_secure_s[1])
   `endif
`endif


`ifdef AXI_HAS_S2
            ,.awid_s2    (awid_s2)
                                ,.awaddr_s2  (awaddr_s2)
                                ,.awlen_s2   (awlen_s2)
                                ,.awsize_s2  (awsize_s2)
                                ,.awburst_s2 (awburst_s2)
                                ,.awlock_s2  (awlock_s2)
                                ,.awcache_s2 (awcache_s2)
                                ,.awprot_s2  (awprot_s2)
                                ,.awvalid_s2 (awvalid_s[2])
                                ,.awready_s2 (awready_s[2])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s2 (awsideband_s2)
   `endif
                                ,.wid_s2    (wid_s2)
                                ,.wdata_s2  (wdata_s2)
                                ,.wstrb_s2  (wstrb_s2)
                                ,.wlast_s2  (wlast_s[2])
                                ,.wvalid_s2 (wvalid_s[2])
                                ,.wready_s2 (wready_s[2])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s2 (wsideband_s2)
   `endif
                                ,.bid_s2    (bid_s2)
                                ,.bresp_s2  (bresp_s2)
                                ,.bvalid_s2 (bvalid_s[2])
                                ,.bready_s2 (bready_s[2])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s2 (bsideband_s2)
   `endif
                                ,.arid_s2    (arid_s2)
                                ,.araddr_s2  (araddr_s2)
                                ,.arlen_s2   (arlen_s2)
                                ,.arsize_s2  (arsize_s2)
                                ,.arburst_s2 (arburst_s2)
                                ,.arlock_s2  (arlock_s2)
                                ,.arcache_s2 (arcache_s2)
                                ,.arprot_s2  (arprot_s2)
                                ,.arvalid_s2 (arvalid_s[2])
                                ,.arready_s2 (arready_s[2])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s2 (arsideband_s2)
   `endif
                                ,.rid_s2    (rid_s2)
                                ,.rdata_s2  (rdata_s2)
                                ,.rresp_s2  (rresp_s2)
                                ,.rvalid_s2 (rvalid_s[2])
                                ,.rlast_s2  (rlast_s[2])
                                ,.rready_s2 (rready_s[2])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s2 (rsideband_s2)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s2(axi_slave_priority[2])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s2 (tz_secure_s[2])
   `endif
`endif


`ifdef AXI_HAS_S3
            ,.awid_s3    (awid_s3)
                                ,.awaddr_s3  (awaddr_s3)
                                ,.awlen_s3   (awlen_s3)
                                ,.awsize_s3  (awsize_s3)
                                ,.awburst_s3 (awburst_s3)
                                ,.awlock_s3  (awlock_s3)
                                ,.awcache_s3 (awcache_s3)
                                ,.awprot_s3  (awprot_s3)
                                ,.awvalid_s3 (awvalid_s[3])
                                ,.awready_s3 (awready_s[3])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s3 (awsideband_s3)
   `endif
                                ,.wid_s3    (wid_s3)
                                ,.wdata_s3  (wdata_s3)
                                ,.wstrb_s3  (wstrb_s3)
                                ,.wlast_s3  (wlast_s[3])
                                ,.wvalid_s3 (wvalid_s[3])
                                ,.wready_s3 (wready_s[3])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s3 (wsideband_s3)
   `endif
                                ,.bid_s3    (bid_s3)
                                ,.bresp_s3  (bresp_s3)
                                ,.bvalid_s3 (bvalid_s[3])
                                ,.bready_s3 (bready_s[3])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s3 (bsideband_s3)
   `endif
                                ,.arid_s3    (arid_s3)
                                ,.araddr_s3  (araddr_s3)
                                ,.arlen_s3   (arlen_s3)
                                ,.arsize_s3  (arsize_s3)
                                ,.arburst_s3 (arburst_s3)
                                ,.arlock_s3  (arlock_s3)
                                ,.arcache_s3 (arcache_s3)
                                ,.arprot_s3  (arprot_s3)
                                ,.arvalid_s3 (arvalid_s[3])
                                ,.arready_s3 (arready_s[3])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s3 (arsideband_s3)
   `endif
                                ,.rid_s3    (rid_s3)
                                ,.rdata_s3  (rdata_s3)
                                ,.rresp_s3  (rresp_s3)
                                ,.rvalid_s3 (rvalid_s[3])
                                ,.rlast_s3  (rlast_s[3])
                                ,.rready_s3 (rready_s[3])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s3 (rsideband_s3)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s3(axi_slave_priority[3])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s3 (tz_secure_s[3])
   `endif
`endif


`ifdef AXI_HAS_S4
            ,.awid_s4    (awid_s4)
                                ,.awaddr_s4  (awaddr_s4)
                                ,.awlen_s4   (awlen_s4)
                                ,.awsize_s4  (awsize_s4)
                                ,.awburst_s4 (awburst_s4)
                                ,.awlock_s4  (awlock_s4)
                                ,.awcache_s4 (awcache_s4)
                                ,.awprot_s4  (awprot_s4)
                                ,.awvalid_s4 (awvalid_s[4])
                                ,.awready_s4 (awready_s[4])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s4 (awsideband_s4)
   `endif
                                ,.wid_s4    (wid_s4)
                                ,.wdata_s4  (wdata_s4)
                                ,.wstrb_s4  (wstrb_s4)
                                ,.wlast_s4  (wlast_s[4])
                                ,.wvalid_s4 (wvalid_s[4])
                                ,.wready_s4 (wready_s[4])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s4 (wsideband_s4)
   `endif
                                ,.bid_s4    (bid_s4)
                                ,.bresp_s4  (bresp_s4)
                                ,.bvalid_s4 (bvalid_s[4])
                                ,.bready_s4 (bready_s[4])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s4 (bsideband_s4)
   `endif
                                ,.arid_s4    (arid_s4)
                                ,.araddr_s4  (araddr_s4)
                                ,.arlen_s4   (arlen_s4)
                                ,.arsize_s4  (arsize_s4)
                                ,.arburst_s4 (arburst_s4)
                                ,.arlock_s4  (arlock_s4)
                                ,.arcache_s4 (arcache_s4)
                                ,.arprot_s4  (arprot_s4)
                                ,.arvalid_s4 (arvalid_s[4])
                                ,.arready_s4 (arready_s[4])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s4 (arsideband_s4)
   `endif
                                ,.rid_s4    (rid_s4)
                                ,.rdata_s4  (rdata_s4)
                                ,.rresp_s4  (rresp_s4)
                                ,.rvalid_s4 (rvalid_s[4])
                                ,.rlast_s4  (rlast_s[4])
                                ,.rready_s4 (rready_s[4])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s4 (rsideband_s4)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s4(axi_slave_priority[4])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s4 (tz_secure_s[4])
   `endif
`endif


`ifdef AXI_HAS_S5
            ,.awid_s5    (awid_s5)
                                ,.awaddr_s5  (awaddr_s5)
                                ,.awlen_s5   (awlen_s5)
                                ,.awsize_s5  (awsize_s5)
                                ,.awburst_s5 (awburst_s5)
                                ,.awlock_s5  (awlock_s5)
                                ,.awcache_s5 (awcache_s5)
                                ,.awprot_s5  (awprot_s5)
                                ,.awvalid_s5 (awvalid_s[5])
                                ,.awready_s5 (awready_s[5])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s5 (awsideband_s5)
   `endif
                                ,.wid_s5    (wid_s5)
                                ,.wdata_s5  (wdata_s5)
                                ,.wstrb_s5  (wstrb_s5)
                                ,.wlast_s5  (wlast_s[5])
                                ,.wvalid_s5 (wvalid_s[5])
                                ,.wready_s5 (wready_s[5])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s5 (wsideband_s5)
   `endif
                                ,.bid_s5    (bid_s5)
                                ,.bresp_s5  (bresp_s5)
                                ,.bvalid_s5 (bvalid_s[5])
                                ,.bready_s5 (bready_s[5])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s5 (bsideband_s5)
   `endif
                                ,.arid_s5    (arid_s5)
                                ,.araddr_s5  (araddr_s5)
                                ,.arlen_s5   (arlen_s5)
                                ,.arsize_s5  (arsize_s5)
                                ,.arburst_s5 (arburst_s5)
                                ,.arlock_s5  (arlock_s5)
                                ,.arcache_s5 (arcache_s5)
                                ,.arprot_s5  (arprot_s5)
                                ,.arvalid_s5 (arvalid_s[5])
                                ,.arready_s5 (arready_s[5])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s5 (arsideband_s5)
   `endif
                                ,.rid_s5    (rid_s5)
                                ,.rdata_s5  (rdata_s5)
                                ,.rresp_s5  (rresp_s5)
                                ,.rvalid_s5 (rvalid_s[5])
                                ,.rlast_s5  (rlast_s[5])
                                ,.rready_s5 (rready_s[5])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s5 (rsideband_s5)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s5(axi_slave_priority[5])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s5 (tz_secure_s[5])
   `endif
`endif


`ifdef AXI_HAS_S6
            ,.awid_s6    (awid_s6)
                                ,.awaddr_s6  (awaddr_s6)
                                ,.awlen_s6   (awlen_s6)
                                ,.awsize_s6  (awsize_s6)
                                ,.awburst_s6 (awburst_s6)
                                ,.awlock_s6  (awlock_s6)
                                ,.awcache_s6 (awcache_s6)
                                ,.awprot_s6  (awprot_s6)
                                ,.awvalid_s6 (awvalid_s[6])
                                ,.awready_s6 (awready_s[6])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s6 (awsideband_s6)
   `endif
                                ,.wid_s6    (wid_s6)
                                ,.wdata_s6  (wdata_s6)
                                ,.wstrb_s6  (wstrb_s6)
                                ,.wlast_s6  (wlast_s[6])
                                ,.wvalid_s6 (wvalid_s[6])
                                ,.wready_s6 (wready_s[6])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s6 (wsideband_s6)
   `endif
                                ,.bid_s6    (bid_s6)
                                ,.bresp_s6  (bresp_s6)
                                ,.bvalid_s6 (bvalid_s[6])
                                ,.bready_s6 (bready_s[6])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s6 (bsideband_s6)
   `endif
                                ,.arid_s6    (arid_s6)
                                ,.araddr_s6  (araddr_s6)
                                ,.arlen_s6   (arlen_s6)
                                ,.arsize_s6  (arsize_s6)
                                ,.arburst_s6 (arburst_s6)
                                ,.arlock_s6  (arlock_s6)
                                ,.arcache_s6 (arcache_s6)
                                ,.arprot_s6  (arprot_s6)
                                ,.arvalid_s6 (arvalid_s[6])
                                ,.arready_s6 (arready_s[6])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s6 (arsideband_s6)
   `endif
                                ,.rid_s6    (rid_s6)
                                ,.rdata_s6  (rdata_s6)
                                ,.rresp_s6  (rresp_s6)
                                ,.rvalid_s6 (rvalid_s[6])
                                ,.rlast_s6  (rlast_s[6])
                                ,.rready_s6 (rready_s[6])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s6 (rsideband_s6)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s6(axi_slave_priority[6])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s6 (tz_secure_s[6])
   `endif
`endif


`ifdef AXI_HAS_S7
            ,.awid_s7    (awid_s7)
                                ,.awaddr_s7  (awaddr_s7)
                                ,.awlen_s7   (awlen_s7)
                                ,.awsize_s7  (awsize_s7)
                                ,.awburst_s7 (awburst_s7)
                                ,.awlock_s7  (awlock_s7)
                                ,.awcache_s7 (awcache_s7)
                                ,.awprot_s7  (awprot_s7)
                                ,.awvalid_s7 (awvalid_s[7])
                                ,.awready_s7 (awready_s[7])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s7 (awsideband_s7)
   `endif
                                ,.wid_s7    (wid_s7)
                                ,.wdata_s7  (wdata_s7)
                                ,.wstrb_s7  (wstrb_s7)
                                ,.wlast_s7  (wlast_s[7])
                                ,.wvalid_s7 (wvalid_s[7])
                                ,.wready_s7 (wready_s[7])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s7 (wsideband_s7)
   `endif
                                ,.bid_s7    (bid_s7)
                                ,.bresp_s7  (bresp_s7)
                                ,.bvalid_s7 (bvalid_s[7])
                                ,.bready_s7 (bready_s[7])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s7 (bsideband_s7)
   `endif
                                ,.arid_s7    (arid_s7)
                                ,.araddr_s7  (araddr_s7)
                                ,.arlen_s7   (arlen_s7)
                                ,.arsize_s7  (arsize_s7)
                                ,.arburst_s7 (arburst_s7)
                                ,.arlock_s7  (arlock_s7)
                                ,.arcache_s7 (arcache_s7)
                                ,.arprot_s7  (arprot_s7)
                                ,.arvalid_s7 (arvalid_s[7])
                                ,.arready_s7 (arready_s[7])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s7 (arsideband_s7)
   `endif
                                ,.rid_s7    (rid_s7)
                                ,.rdata_s7  (rdata_s7)
                                ,.rresp_s7  (rresp_s7)
                                ,.rvalid_s7 (rvalid_s[7])
                                ,.rlast_s7  (rlast_s[7])
                                ,.rready_s7 (rready_s[7])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s7 (rsideband_s7)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s7(axi_slave_priority[7])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s7 (tz_secure_s[7])
   `endif
`endif


`ifdef AXI_HAS_S8
            ,.awid_s8    (awid_s8)
                                ,.awaddr_s8  (awaddr_s8)
                                ,.awlen_s8   (awlen_s8)
                                ,.awsize_s8  (awsize_s8)
                                ,.awburst_s8 (awburst_s8)
                                ,.awlock_s8  (awlock_s8)
                                ,.awcache_s8 (awcache_s8)
                                ,.awprot_s8  (awprot_s8)
                                ,.awvalid_s8 (awvalid_s[8])
                                ,.awready_s8 (awready_s[8])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s8 (awsideband_s8)
   `endif
                                ,.wid_s8    (wid_s8)
                                ,.wdata_s8  (wdata_s8)
                                ,.wstrb_s8  (wstrb_s8)
                                ,.wlast_s8  (wlast_s[8])
                                ,.wvalid_s8 (wvalid_s[8])
                                ,.wready_s8 (wready_s[8])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s8 (wsideband_s8)
   `endif
                                ,.bid_s8    (bid_s8)
                                ,.bresp_s8  (bresp_s8)
                                ,.bvalid_s8 (bvalid_s[8])
                                ,.bready_s8 (bready_s[8])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s8 (bsideband_s8)
   `endif
                                ,.arid_s8    (arid_s8)
                                ,.araddr_s8  (araddr_s8)
                                ,.arlen_s8   (arlen_s8)
                                ,.arsize_s8  (arsize_s8)
                                ,.arburst_s8 (arburst_s8)
                                ,.arlock_s8  (arlock_s8)
                                ,.arcache_s8 (arcache_s8)
                                ,.arprot_s8  (arprot_s8)
                                ,.arvalid_s8 (arvalid_s[8])
                                ,.arready_s8 (arready_s[8])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s8 (arsideband_s8)
   `endif
                                ,.rid_s8    (rid_s8)
                                ,.rdata_s8  (rdata_s8)
                                ,.rresp_s8  (rresp_s8)
                                ,.rvalid_s8 (rvalid_s[8])
                                ,.rlast_s8  (rlast_s[8])
                                ,.rready_s8 (rready_s[8])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s8 (rsideband_s8)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s8(axi_slave_priority[8])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s8 (tz_secure_s[8])
   `endif
`endif


`ifdef AXI_HAS_S9
            ,.awid_s9    (awid_s9)
                                ,.awaddr_s9  (awaddr_s9)
                                ,.awlen_s9   (awlen_s9)
                                ,.awsize_s9  (awsize_s9)
                                ,.awburst_s9 (awburst_s9)
                                ,.awlock_s9  (awlock_s9)
                                ,.awcache_s9 (awcache_s9)
                                ,.awprot_s9  (awprot_s9)
                                ,.awvalid_s9 (awvalid_s[9])
                                ,.awready_s9 (awready_s[9])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s9 (awsideband_s9)
   `endif
                                ,.wid_s9    (wid_s9)
                                ,.wdata_s9  (wdata_s9)
                                ,.wstrb_s9  (wstrb_s9)
                                ,.wlast_s9  (wlast_s[9])
                                ,.wvalid_s9 (wvalid_s[9])
                                ,.wready_s9 (wready_s[9])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s9 (wsideband_s9)
   `endif
                                ,.bid_s9    (bid_s9)
                                ,.bresp_s9  (bresp_s9)
                                ,.bvalid_s9 (bvalid_s[9])
                                ,.bready_s9 (bready_s[9])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s9 (bsideband_s9)
   `endif
                                ,.arid_s9    (arid_s9)
                                ,.araddr_s9  (araddr_s9)
                                ,.arlen_s9   (arlen_s9)
                                ,.arsize_s9  (arsize_s9)
                                ,.arburst_s9 (arburst_s9)
                                ,.arlock_s9  (arlock_s9)
                                ,.arcache_s9 (arcache_s9)
                                ,.arprot_s9  (arprot_s9)
                                ,.arvalid_s9 (arvalid_s[9])
                                ,.arready_s9 (arready_s[9])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s9 (arsideband_s9)
   `endif
                                ,.rid_s9    (rid_s9)
                                ,.rdata_s9  (rdata_s9)
                                ,.rresp_s9  (rresp_s9)
                                ,.rvalid_s9 (rvalid_s[9])
                                ,.rlast_s9  (rlast_s[9])
                                ,.rready_s9 (rready_s[9])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s9 (rsideband_s9)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s9(axi_slave_priority[9])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s9 (tz_secure_s[9])
   `endif
`endif


`ifdef AXI_HAS_S10
            ,.awid_s10    (awid_s10)
                                ,.awaddr_s10  (awaddr_s10)
                                ,.awlen_s10   (awlen_s10)
                                ,.awsize_s10  (awsize_s10)
                                ,.awburst_s10 (awburst_s10)
                                ,.awlock_s10  (awlock_s10)
                                ,.awcache_s10 (awcache_s10)
                                ,.awprot_s10  (awprot_s10)
                                ,.awvalid_s10 (awvalid_s[10])
                                ,.awready_s10 (awready_s[10])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s10 (awsideband_s10)
   `endif
                                ,.wid_s10    (wid_s10)
                                ,.wdata_s10  (wdata_s10)
                                ,.wstrb_s10  (wstrb_s10)
                                ,.wlast_s10  (wlast_s[10])
                                ,.wvalid_s10 (wvalid_s[10])
                                ,.wready_s10 (wready_s[10])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s10 (wsideband_s10)
   `endif
                                ,.bid_s10    (bid_s10)
                                ,.bresp_s10  (bresp_s10)
                                ,.bvalid_s10 (bvalid_s[10])
                                ,.bready_s10 (bready_s[10])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s10 (bsideband_s10)
   `endif
                                ,.arid_s10    (arid_s10)
                                ,.araddr_s10  (araddr_s10)
                                ,.arlen_s10   (arlen_s10)
                                ,.arsize_s10  (arsize_s10)
                                ,.arburst_s10 (arburst_s10)
                                ,.arlock_s10  (arlock_s10)
                                ,.arcache_s10 (arcache_s10)
                                ,.arprot_s10  (arprot_s10)
                                ,.arvalid_s10 (arvalid_s[10])
                                ,.arready_s10 (arready_s[10])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s10 (arsideband_s10)
   `endif
                                ,.rid_s10    (rid_s10)
                                ,.rdata_s10  (rdata_s10)
                                ,.rresp_s10  (rresp_s10)
                                ,.rvalid_s10 (rvalid_s[10])
                                ,.rlast_s10  (rlast_s[10])
                                ,.rready_s10 (rready_s[10])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s10 (rsideband_s10)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s10(axi_slave_priority[10])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s10 (tz_secure_s[10])
   `endif
`endif


`ifdef AXI_HAS_S11
            ,.awid_s11    (awid_s11)
                                ,.awaddr_s11  (awaddr_s11)
                                ,.awlen_s11   (awlen_s11)
                                ,.awsize_s11  (awsize_s11)
                                ,.awburst_s11 (awburst_s11)
                                ,.awlock_s11  (awlock_s11)
                                ,.awcache_s11 (awcache_s11)
                                ,.awprot_s11  (awprot_s11)
                                ,.awvalid_s11 (awvalid_s[11])
                                ,.awready_s11 (awready_s[11])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s11 (awsideband_s11)
   `endif
                                ,.wid_s11    (wid_s11)
                                ,.wdata_s11  (wdata_s11)
                                ,.wstrb_s11  (wstrb_s11)
                                ,.wlast_s11  (wlast_s[11])
                                ,.wvalid_s11 (wvalid_s[11])
                                ,.wready_s11 (wready_s[11])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s11 (wsideband_s11)
   `endif
                                ,.bid_s11    (bid_s11)
                                ,.bresp_s11  (bresp_s11)
                                ,.bvalid_s11 (bvalid_s[11])
                                ,.bready_s11 (bready_s[11])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s11 (bsideband_s11)
   `endif
                                ,.arid_s11    (arid_s11)
                                ,.araddr_s11  (araddr_s11)
                                ,.arlen_s11   (arlen_s11)
                                ,.arsize_s11  (arsize_s11)
                                ,.arburst_s11 (arburst_s11)
                                ,.arlock_s11  (arlock_s11)
                                ,.arcache_s11 (arcache_s11)
                                ,.arprot_s11  (arprot_s11)
                                ,.arvalid_s11 (arvalid_s[11])
                                ,.arready_s11 (arready_s[11])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s11 (arsideband_s11)
   `endif
                                ,.rid_s11    (rid_s11)
                                ,.rdata_s11  (rdata_s11)
                                ,.rresp_s11  (rresp_s11)
                                ,.rvalid_s11 (rvalid_s[11])
                                ,.rlast_s11  (rlast_s[11])
                                ,.rready_s11 (rready_s[11])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s11 (rsideband_s11)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s11(axi_slave_priority[11])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s11 (tz_secure_s[11])
   `endif
`endif


`ifdef AXI_HAS_S12
            ,.awid_s12    (awid_s12)
                                ,.awaddr_s12  (awaddr_s12)
                                ,.awlen_s12   (awlen_s12)
                                ,.awsize_s12  (awsize_s12)
                                ,.awburst_s12 (awburst_s12)
                                ,.awlock_s12  (awlock_s12)
                                ,.awcache_s12 (awcache_s12)
                                ,.awprot_s12  (awprot_s12)
                                ,.awvalid_s12 (awvalid_s[12])
                                ,.awready_s12 (awready_s[12])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s12 (awsideband_s12)
   `endif
                                ,.wid_s12    (wid_s12)
                                ,.wdata_s12  (wdata_s12)
                                ,.wstrb_s12  (wstrb_s12)
                                ,.wlast_s12  (wlast_s[12])
                                ,.wvalid_s12 (wvalid_s[12])
                                ,.wready_s12 (wready_s[12])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s12 (wsideband_s12)
   `endif
                                ,.bid_s12    (bid_s12)
                                ,.bresp_s12  (bresp_s12)
                                ,.bvalid_s12 (bvalid_s[12])
                                ,.bready_s12 (bready_s[12])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s12 (bsideband_s12)
   `endif
                                ,.arid_s12    (arid_s12)
                                ,.araddr_s12  (araddr_s12)
                                ,.arlen_s12   (arlen_s12)
                                ,.arsize_s12  (arsize_s12)
                                ,.arburst_s12 (arburst_s12)
                                ,.arlock_s12  (arlock_s12)
                                ,.arcache_s12 (arcache_s12)
                                ,.arprot_s12  (arprot_s12)
                                ,.arvalid_s12 (arvalid_s[12])
                                ,.arready_s12 (arready_s[12])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s12 (arsideband_s12)
   `endif
                                ,.rid_s12    (rid_s12)
                                ,.rdata_s12  (rdata_s12)
                                ,.rresp_s12  (rresp_s12)
                                ,.rvalid_s12 (rvalid_s[12])
                                ,.rlast_s12  (rlast_s[12])
                                ,.rready_s12 (rready_s[12])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s12 (rsideband_s12)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s12(axi_slave_priority[12])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s12 (tz_secure_s[12])
   `endif
`endif


`ifdef AXI_HAS_S13
            ,.awid_s13    (awid_s13)
                                ,.awaddr_s13  (awaddr_s13)
                                ,.awlen_s13   (awlen_s13)
                                ,.awsize_s13  (awsize_s13)
                                ,.awburst_s13 (awburst_s13)
                                ,.awlock_s13  (awlock_s13)
                                ,.awcache_s13 (awcache_s13)
                                ,.awprot_s13  (awprot_s13)
                                ,.awvalid_s13 (awvalid_s[13])
                                ,.awready_s13 (awready_s[13])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s13 (awsideband_s13)
   `endif
                                ,.wid_s13    (wid_s13)
                                ,.wdata_s13  (wdata_s13)
                                ,.wstrb_s13  (wstrb_s13)
                                ,.wlast_s13  (wlast_s[13])
                                ,.wvalid_s13 (wvalid_s[13])
                                ,.wready_s13 (wready_s[13])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s13 (wsideband_s13)
   `endif
                                ,.bid_s13    (bid_s13)
                                ,.bresp_s13  (bresp_s13)
                                ,.bvalid_s13 (bvalid_s[13])
                                ,.bready_s13 (bready_s[13])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s13 (bsideband_s13)
   `endif
                                ,.arid_s13    (arid_s13)
                                ,.araddr_s13  (araddr_s13)
                                ,.arlen_s13   (arlen_s13)
                                ,.arsize_s13  (arsize_s13)
                                ,.arburst_s13 (arburst_s13)
                                ,.arlock_s13  (arlock_s13)
                                ,.arcache_s13 (arcache_s13)
                                ,.arprot_s13  (arprot_s13)
                                ,.arvalid_s13 (arvalid_s[13])
                                ,.arready_s13 (arready_s[13])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s13 (arsideband_s13)
   `endif
                                ,.rid_s13    (rid_s13)
                                ,.rdata_s13  (rdata_s13)
                                ,.rresp_s13  (rresp_s13)
                                ,.rvalid_s13 (rvalid_s[13])
                                ,.rlast_s13  (rlast_s[13])
                                ,.rready_s13 (rready_s[13])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s13 (rsideband_s13)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s13(axi_slave_priority[13])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s13 (tz_secure_s[13])
   `endif
`endif


`ifdef AXI_HAS_S14
            ,.awid_s14    (awid_s14)
                                ,.awaddr_s14  (awaddr_s14)
                                ,.awlen_s14   (awlen_s14)
                                ,.awsize_s14  (awsize_s14)
                                ,.awburst_s14 (awburst_s14)
                                ,.awlock_s14  (awlock_s14)
                                ,.awcache_s14 (awcache_s14)
                                ,.awprot_s14  (awprot_s14)
                                ,.awvalid_s14 (awvalid_s[14])
                                ,.awready_s14 (awready_s[14])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s14 (awsideband_s14)
   `endif
                                ,.wid_s14    (wid_s14)
                                ,.wdata_s14  (wdata_s14)
                                ,.wstrb_s14  (wstrb_s14)
                                ,.wlast_s14  (wlast_s[14])
                                ,.wvalid_s14 (wvalid_s[14])
                                ,.wready_s14 (wready_s[14])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s14 (wsideband_s14)
   `endif
                                ,.bid_s14    (bid_s14)
                                ,.bresp_s14  (bresp_s14)
                                ,.bvalid_s14 (bvalid_s[14])
                                ,.bready_s14 (bready_s[14])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s14 (bsideband_s14)
   `endif
                                ,.arid_s14    (arid_s14)
                                ,.araddr_s14  (araddr_s14)
                                ,.arlen_s14   (arlen_s14)
                                ,.arsize_s14  (arsize_s14)
                                ,.arburst_s14 (arburst_s14)
                                ,.arlock_s14  (arlock_s14)
                                ,.arcache_s14 (arcache_s14)
                                ,.arprot_s14  (arprot_s14)
                                ,.arvalid_s14 (arvalid_s[14])
                                ,.arready_s14 (arready_s[14])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s14 (arsideband_s14)
   `endif
                                ,.rid_s14    (rid_s14)
                                ,.rdata_s14  (rdata_s14)
                                ,.rresp_s14  (rresp_s14)
                                ,.rvalid_s14 (rvalid_s[14])
                                ,.rlast_s14  (rlast_s[14])
                                ,.rready_s14 (rready_s[14])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s14 (rsideband_s14)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s14(axi_slave_priority[14])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s14 (tz_secure_s[14])
   `endif
`endif


`ifdef AXI_HAS_S15
            ,.awid_s15    (awid_s15)
                                ,.awaddr_s15  (awaddr_s15)
                                ,.awlen_s15   (awlen_s15)
                                ,.awsize_s15  (awsize_s15)
                                ,.awburst_s15 (awburst_s15)
                                ,.awlock_s15  (awlock_s15)
                                ,.awcache_s15 (awcache_s15)
                                ,.awprot_s15  (awprot_s15)
                                ,.awvalid_s15 (awvalid_s[15])
                                ,.awready_s15 (awready_s[15])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s15 (awsideband_s15)
   `endif
                                ,.wid_s15    (wid_s15)
                                ,.wdata_s15  (wdata_s15)
                                ,.wstrb_s15  (wstrb_s15)
                                ,.wlast_s15  (wlast_s[15])
                                ,.wvalid_s15 (wvalid_s[15])
                                ,.wready_s15 (wready_s[15])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s15 (wsideband_s15)
   `endif
                                ,.bid_s15    (bid_s15)
                                ,.bresp_s15  (bresp_s15)
                                ,.bvalid_s15 (bvalid_s[15])
                                ,.bready_s15 (bready_s[15])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s15 (bsideband_s15)
   `endif
                                ,.arid_s15    (arid_s15)
                                ,.araddr_s15  (araddr_s15)
                                ,.arlen_s15   (arlen_s15)
                                ,.arsize_s15  (arsize_s15)
                                ,.arburst_s15 (arburst_s15)
                                ,.arlock_s15  (arlock_s15)
                                ,.arcache_s15 (arcache_s15)
                                ,.arprot_s15  (arprot_s15)
                                ,.arvalid_s15 (arvalid_s[15])
                                ,.arready_s15 (arready_s[15])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s15 (arsideband_s15)
   `endif
                                ,.rid_s15    (rid_s15)
                                ,.rdata_s15  (rdata_s15)
                                ,.rresp_s15  (rresp_s15)
                                ,.rvalid_s15 (rvalid_s[15])
                                ,.rlast_s15  (rlast_s[15])
                                ,.rready_s15 (rready_s[15])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s15 (rsideband_s15)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s15(axi_slave_priority[15])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s15 (tz_secure_s[15])
   `endif
`endif


`ifdef AXI_HAS_S16
            ,.awid_s16    (awid_s16)
                                ,.awaddr_s16  (awaddr_s16)
                                ,.awlen_s16   (awlen_s16)
                                ,.awsize_s16  (awsize_s16)
                                ,.awburst_s16 (awburst_s16)
                                ,.awlock_s16  (awlock_s16)
                                ,.awcache_s16 (awcache_s16)
                                ,.awprot_s16  (awprot_s16)
                                ,.awvalid_s16 (awvalid_s[16])
                                ,.awready_s16 (awready_s[16])
   `ifdef AXI_INC_AWSB
                                ,.awsideband_s16 (awsideband_s16)
   `endif
                                ,.wid_s16    (wid_s16)
                                ,.wdata_s16  (wdata_s16)
                                ,.wstrb_s16  (wstrb_s16)
                                ,.wlast_s16  (wlast_s[16])
                                ,.wvalid_s16 (wvalid_s[16])
                                ,.wready_s16 (wready_s[16])
   `ifdef AXI_INC_WSB
                                ,.wsideband_s16 (wsideband_s16)
   `endif
                                ,.bid_s16    (bid_s16)
                                ,.bresp_s16  (bresp_s16)
                                ,.bvalid_s16 (bvalid_s[16])
                                ,.bready_s16 (bready_s[16])
   `ifdef AXI_INC_BSB
                                ,.bsideband_s16 (bsideband_s16)
   `endif
                                ,.arid_s16    (arid_s16)
                                ,.araddr_s16  (araddr_s16)
                                ,.arlen_s16   (arlen_s16)
                                ,.arsize_s16  (arsize_s16)
                                ,.arburst_s16 (arburst_s16)
                                ,.arlock_s16  (arlock_s16)
                                ,.arcache_s16 (arcache_s16)
                                ,.arprot_s16  (arprot_s16)
                                ,.arvalid_s16 (arvalid_s[16])
                                ,.arready_s16 (arready_s[16])
   `ifdef AXI_INC_ARSB
                                ,.arsideband_s16 (arsideband_s16)
   `endif
                                ,.rid_s16    (rid_s16)
                                ,.rdata_s16  (rdata_s16)
                                ,.rresp_s16  (rresp_s16)
                                ,.rvalid_s16 (rvalid_s[16])
                                ,.rlast_s16  (rlast_s[16])
                                ,.rready_s16 (rready_s[16])
   `ifdef AXI_INC_RSB
                                ,.rsideband_s16 (rsideband_s16)
   `endif
   `ifdef AXI_EXT_PRIORITY
                                ,.slv_priority_s16(axi_slave_priority[16])
   `endif
   `ifdef AXI_TZ_SUPPORT
                                ,.tz_secure_s16 (tz_secure_s[16])
   `endif
`endif

`ifdef AXI_HAS_LOWPWR_HS_IF
                                ,.csysreq        (csysreq)
                                ,.csysack        (csysack)
                                ,.cactive        (cactive)
`endif

`ifdef AXI_HAS_DLOCK_NOTIFY
                                ,.dlock_mst      (dlock_mst)
                                ,.dlock_slv      (dlock_slv)
                                ,.dlock_id       (dlock_id)
                                ,.dlock_wr       (dlock_wr)
                                ,.dlock_irq      (dlock_irq)
`endif

                                ,.dbg_awid_s0    (awid_s0)
                                ,.dbg_awaddr_s0  (awaddr_s0)
                                ,.dbg_awlen_s0   (awlen_s0)
                                ,.dbg_awsize_s0  (awsize_s0)
                                ,.dbg_awburst_s0 (awburst_s0)
                                ,.dbg_awlock_s0  (awlock_s0)
                                ,.dbg_awcache_s0 (awcache_s0)
                                ,.dbg_awprot_s0  (awprot_s0)
                                ,.dbg_awvalid_s0 (awvalid_s[0])
                                ,.dbg_awready_s0 (awready_s[0])
                                ,.dbg_wid_s0    (wid_s0)
                                ,.dbg_wdata_s0  (wdata_s0)
                                ,.dbg_wstrb_s0  (wstrb_s0)
                                ,.dbg_wlast_s0  (wlast_s[0])
                                ,.dbg_wvalid_s0 (wvalid_s[0])
                                ,.dbg_wready_s0 (wready_s[0])
                                ,.dbg_bid_s0    (bid_s0)
                                ,.dbg_bresp_s0  (bresp_s0)
                                ,.dbg_bvalid_s0 (bvalid_s[0])
                                ,.dbg_bready_s0 (bready_s[0])
                                ,.dbg_arid_s0    (arid_s0)
                                ,.dbg_araddr_s0  (araddr_s0)
                                ,.dbg_arlen_s0   (arlen_s0)
                                ,.dbg_arsize_s0  (arsize_s0)
                                ,.dbg_arburst_s0 (arburst_s0)
                                ,.dbg_arlock_s0  (arlock_s0)
                                ,.dbg_arcache_s0 (arcache_s0)
                                ,.dbg_arprot_s0  (arprot_s0)
                                ,.dbg_arvalid_s0 (arvalid_s[0])
                                ,.dbg_arready_s0 (arready_s[0])
                                ,.dbg_rid_s0    (rid_s0)
                                ,.dbg_rdata_s0  (rdata_s0)
                                ,.dbg_rresp_s0  (rresp_s0)
                                ,.dbg_rvalid_s0 (rvalid_s[0])
                                ,.dbg_rlast_s0  (rlast_s[0])
                                ,.dbg_rready_s0 (rready_s[0])
               );

`ifdef AXI_XDCDR
`ifdef AXI_HAS_M1
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M1, `AXI_LOG2_NSP1V_M1, 1
               ,`AXI_NV_S1_BY_M1
               ,`AXI_NV_S2_BY_M1
               ,`AXI_NV_S3_BY_M1
               ,`AXI_NV_S4_BY_M1
               ,`AXI_NV_S5_BY_M1
               ,`AXI_NV_S6_BY_M1
               ,`AXI_NV_S7_BY_M1
               ,`AXI_NV_S8_BY_M1
               ,`AXI_NV_S9_BY_M1
               ,`AXI_NV_S10_BY_M1
               ,`AXI_NV_S11_BY_M1
               ,`AXI_NV_S12_BY_M1
               ,`AXI_NV_S13_BY_M1
               ,`AXI_NV_S14_BY_M1
               ,`AXI_NV_S15_BY_M1
               ,`AXI_NV_S16_BY_M1
               , 1
               ,`AXI_BV_S1_BY_M1
               ,`AXI_BV_S2_BY_M1
               ,`AXI_BV_S3_BY_M1
               ,`AXI_BV_S4_BY_M1
               ,`AXI_BV_S5_BY_M1
               ,`AXI_BV_S6_BY_M1
               ,`AXI_BV_S7_BY_M1
               ,`AXI_BV_S8_BY_M1
               ,`AXI_BV_S9_BY_M1
               ,`AXI_BV_S10_BY_M1
               ,`AXI_BV_S11_BY_M1
               ,`AXI_BV_S12_BY_M1
               ,`AXI_BV_S13_BY_M1
               ,`AXI_BV_S14_BY_M1
               ,`AXI_BV_S15_BY_M1
               ,`AXI_BV_S16_BY_M1
             )
             U_ardcdr_m1(
                  .addr_i  (araddr_m1),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m1)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M1, `AXI_LOG2_NSP1V_M1, 1
               ,`AXI_NV_S1_BY_M1
               ,`AXI_NV_S2_BY_M1
               ,`AXI_NV_S3_BY_M1
               ,`AXI_NV_S4_BY_M1
               ,`AXI_NV_S5_BY_M1
               ,`AXI_NV_S6_BY_M1
               ,`AXI_NV_S7_BY_M1
               ,`AXI_NV_S8_BY_M1
               ,`AXI_NV_S9_BY_M1
               ,`AXI_NV_S10_BY_M1
               ,`AXI_NV_S11_BY_M1
               ,`AXI_NV_S12_BY_M1
               ,`AXI_NV_S13_BY_M1
               ,`AXI_NV_S14_BY_M1
               ,`AXI_NV_S15_BY_M1
               ,`AXI_NV_S16_BY_M1
               , 1
               ,`AXI_BV_S1_BY_M1
               ,`AXI_BV_S2_BY_M1
               ,`AXI_BV_S3_BY_M1
               ,`AXI_BV_S4_BY_M1
               ,`AXI_BV_S5_BY_M1
               ,`AXI_BV_S6_BY_M1
               ,`AXI_BV_S7_BY_M1
               ,`AXI_BV_S8_BY_M1
               ,`AXI_BV_S9_BY_M1
               ,`AXI_BV_S10_BY_M1
               ,`AXI_BV_S11_BY_M1
               ,`AXI_BV_S12_BY_M1
               ,`AXI_BV_S13_BY_M1
               ,`AXI_BV_S14_BY_M1
               ,`AXI_BV_S15_BY_M1
               ,`AXI_BV_S16_BY_M1
             )
       U_awdcdr_m1(
                  .addr_i  (awaddr_m1),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m1)
                 );
`endif
`ifdef AXI_HAS_M2
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M2, `AXI_LOG2_NSP1V_M2, 1
               ,`AXI_NV_S1_BY_M2
               ,`AXI_NV_S2_BY_M2
               ,`AXI_NV_S3_BY_M2
               ,`AXI_NV_S4_BY_M2
               ,`AXI_NV_S5_BY_M2
               ,`AXI_NV_S6_BY_M2
               ,`AXI_NV_S7_BY_M2
               ,`AXI_NV_S8_BY_M2
               ,`AXI_NV_S9_BY_M2
               ,`AXI_NV_S10_BY_M2
               ,`AXI_NV_S11_BY_M2
               ,`AXI_NV_S12_BY_M2
               ,`AXI_NV_S13_BY_M2
               ,`AXI_NV_S14_BY_M2
               ,`AXI_NV_S15_BY_M2
               ,`AXI_NV_S16_BY_M2
               , 1
               ,`AXI_BV_S1_BY_M2
               ,`AXI_BV_S2_BY_M2
               ,`AXI_BV_S3_BY_M2
               ,`AXI_BV_S4_BY_M2
               ,`AXI_BV_S5_BY_M2
               ,`AXI_BV_S6_BY_M2
               ,`AXI_BV_S7_BY_M2
               ,`AXI_BV_S8_BY_M2
               ,`AXI_BV_S9_BY_M2
               ,`AXI_BV_S10_BY_M2
               ,`AXI_BV_S11_BY_M2
               ,`AXI_BV_S12_BY_M2
               ,`AXI_BV_S13_BY_M2
               ,`AXI_BV_S14_BY_M2
               ,`AXI_BV_S15_BY_M2
               ,`AXI_BV_S16_BY_M2
             )
             U_ardcdr_m2(
                  .addr_i  (araddr_m2),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m2)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M2, `AXI_LOG2_NSP1V_M2, 1
               ,`AXI_NV_S1_BY_M2
               ,`AXI_NV_S2_BY_M2
               ,`AXI_NV_S3_BY_M2
               ,`AXI_NV_S4_BY_M2
               ,`AXI_NV_S5_BY_M2
               ,`AXI_NV_S6_BY_M2
               ,`AXI_NV_S7_BY_M2
               ,`AXI_NV_S8_BY_M2
               ,`AXI_NV_S9_BY_M2
               ,`AXI_NV_S10_BY_M2
               ,`AXI_NV_S11_BY_M2
               ,`AXI_NV_S12_BY_M2
               ,`AXI_NV_S13_BY_M2
               ,`AXI_NV_S14_BY_M2
               ,`AXI_NV_S15_BY_M2
               ,`AXI_NV_S16_BY_M2
               , 1
               ,`AXI_BV_S1_BY_M2
               ,`AXI_BV_S2_BY_M2
               ,`AXI_BV_S3_BY_M2
               ,`AXI_BV_S4_BY_M2
               ,`AXI_BV_S5_BY_M2
               ,`AXI_BV_S6_BY_M2
               ,`AXI_BV_S7_BY_M2
               ,`AXI_BV_S8_BY_M2
               ,`AXI_BV_S9_BY_M2
               ,`AXI_BV_S10_BY_M2
               ,`AXI_BV_S11_BY_M2
               ,`AXI_BV_S12_BY_M2
               ,`AXI_BV_S13_BY_M2
               ,`AXI_BV_S14_BY_M2
               ,`AXI_BV_S15_BY_M2
               ,`AXI_BV_S16_BY_M2
             )
       U_awdcdr_m2(
                  .addr_i  (awaddr_m2),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m2)
                 );
`endif
`ifdef AXI_HAS_M3
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M3, `AXI_LOG2_NSP1V_M3, 1
               ,`AXI_NV_S1_BY_M3
               ,`AXI_NV_S2_BY_M3
               ,`AXI_NV_S3_BY_M3
               ,`AXI_NV_S4_BY_M3
               ,`AXI_NV_S5_BY_M3
               ,`AXI_NV_S6_BY_M3
               ,`AXI_NV_S7_BY_M3
               ,`AXI_NV_S8_BY_M3
               ,`AXI_NV_S9_BY_M3
               ,`AXI_NV_S10_BY_M3
               ,`AXI_NV_S11_BY_M3
               ,`AXI_NV_S12_BY_M3
               ,`AXI_NV_S13_BY_M3
               ,`AXI_NV_S14_BY_M3
               ,`AXI_NV_S15_BY_M3
               ,`AXI_NV_S16_BY_M3
               , 1
               ,`AXI_BV_S1_BY_M3
               ,`AXI_BV_S2_BY_M3
               ,`AXI_BV_S3_BY_M3
               ,`AXI_BV_S4_BY_M3
               ,`AXI_BV_S5_BY_M3
               ,`AXI_BV_S6_BY_M3
               ,`AXI_BV_S7_BY_M3
               ,`AXI_BV_S8_BY_M3
               ,`AXI_BV_S9_BY_M3
               ,`AXI_BV_S10_BY_M3
               ,`AXI_BV_S11_BY_M3
               ,`AXI_BV_S12_BY_M3
               ,`AXI_BV_S13_BY_M3
               ,`AXI_BV_S14_BY_M3
               ,`AXI_BV_S15_BY_M3
               ,`AXI_BV_S16_BY_M3
             )
             U_ardcdr_m3(
                  .addr_i  (araddr_m3),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m3)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M3, `AXI_LOG2_NSP1V_M3, 1
               ,`AXI_NV_S1_BY_M3
               ,`AXI_NV_S2_BY_M3
               ,`AXI_NV_S3_BY_M3
               ,`AXI_NV_S4_BY_M3
               ,`AXI_NV_S5_BY_M3
               ,`AXI_NV_S6_BY_M3
               ,`AXI_NV_S7_BY_M3
               ,`AXI_NV_S8_BY_M3
               ,`AXI_NV_S9_BY_M3
               ,`AXI_NV_S10_BY_M3
               ,`AXI_NV_S11_BY_M3
               ,`AXI_NV_S12_BY_M3
               ,`AXI_NV_S13_BY_M3
               ,`AXI_NV_S14_BY_M3
               ,`AXI_NV_S15_BY_M3
               ,`AXI_NV_S16_BY_M3
               , 1
               ,`AXI_BV_S1_BY_M3
               ,`AXI_BV_S2_BY_M3
               ,`AXI_BV_S3_BY_M3
               ,`AXI_BV_S4_BY_M3
               ,`AXI_BV_S5_BY_M3
               ,`AXI_BV_S6_BY_M3
               ,`AXI_BV_S7_BY_M3
               ,`AXI_BV_S8_BY_M3
               ,`AXI_BV_S9_BY_M3
               ,`AXI_BV_S10_BY_M3
               ,`AXI_BV_S11_BY_M3
               ,`AXI_BV_S12_BY_M3
               ,`AXI_BV_S13_BY_M3
               ,`AXI_BV_S14_BY_M3
               ,`AXI_BV_S15_BY_M3
               ,`AXI_BV_S16_BY_M3
             )
       U_awdcdr_m3(
                  .addr_i  (awaddr_m3),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m3)
                 );
`endif
`ifdef AXI_HAS_M4
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M4, `AXI_LOG2_NSP1V_M4, 1
               ,`AXI_NV_S1_BY_M4
               ,`AXI_NV_S2_BY_M4
               ,`AXI_NV_S3_BY_M4
               ,`AXI_NV_S4_BY_M4
               ,`AXI_NV_S5_BY_M4
               ,`AXI_NV_S6_BY_M4
               ,`AXI_NV_S7_BY_M4
               ,`AXI_NV_S8_BY_M4
               ,`AXI_NV_S9_BY_M4
               ,`AXI_NV_S10_BY_M4
               ,`AXI_NV_S11_BY_M4
               ,`AXI_NV_S12_BY_M4
               ,`AXI_NV_S13_BY_M4
               ,`AXI_NV_S14_BY_M4
               ,`AXI_NV_S15_BY_M4
               ,`AXI_NV_S16_BY_M4
               , 1
               ,`AXI_BV_S1_BY_M4
               ,`AXI_BV_S2_BY_M4
               ,`AXI_BV_S3_BY_M4
               ,`AXI_BV_S4_BY_M4
               ,`AXI_BV_S5_BY_M4
               ,`AXI_BV_S6_BY_M4
               ,`AXI_BV_S7_BY_M4
               ,`AXI_BV_S8_BY_M4
               ,`AXI_BV_S9_BY_M4
               ,`AXI_BV_S10_BY_M4
               ,`AXI_BV_S11_BY_M4
               ,`AXI_BV_S12_BY_M4
               ,`AXI_BV_S13_BY_M4
               ,`AXI_BV_S14_BY_M4
               ,`AXI_BV_S15_BY_M4
               ,`AXI_BV_S16_BY_M4
             )
             U_ardcdr_m4(
                  .addr_i  (araddr_m4),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m4)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M4, `AXI_LOG2_NSP1V_M4, 1
               ,`AXI_NV_S1_BY_M4
               ,`AXI_NV_S2_BY_M4
               ,`AXI_NV_S3_BY_M4
               ,`AXI_NV_S4_BY_M4
               ,`AXI_NV_S5_BY_M4
               ,`AXI_NV_S6_BY_M4
               ,`AXI_NV_S7_BY_M4
               ,`AXI_NV_S8_BY_M4
               ,`AXI_NV_S9_BY_M4
               ,`AXI_NV_S10_BY_M4
               ,`AXI_NV_S11_BY_M4
               ,`AXI_NV_S12_BY_M4
               ,`AXI_NV_S13_BY_M4
               ,`AXI_NV_S14_BY_M4
               ,`AXI_NV_S15_BY_M4
               ,`AXI_NV_S16_BY_M4
               , 1
               ,`AXI_BV_S1_BY_M4
               ,`AXI_BV_S2_BY_M4
               ,`AXI_BV_S3_BY_M4
               ,`AXI_BV_S4_BY_M4
               ,`AXI_BV_S5_BY_M4
               ,`AXI_BV_S6_BY_M4
               ,`AXI_BV_S7_BY_M4
               ,`AXI_BV_S8_BY_M4
               ,`AXI_BV_S9_BY_M4
               ,`AXI_BV_S10_BY_M4
               ,`AXI_BV_S11_BY_M4
               ,`AXI_BV_S12_BY_M4
               ,`AXI_BV_S13_BY_M4
               ,`AXI_BV_S14_BY_M4
               ,`AXI_BV_S15_BY_M4
               ,`AXI_BV_S16_BY_M4
             )
       U_awdcdr_m4(
                  .addr_i  (awaddr_m4),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m4)
                 );
`endif
`ifdef AXI_HAS_M5
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M5, `AXI_LOG2_NSP1V_M5, 1
               ,`AXI_NV_S1_BY_M5
               ,`AXI_NV_S2_BY_M5
               ,`AXI_NV_S3_BY_M5
               ,`AXI_NV_S4_BY_M5
               ,`AXI_NV_S5_BY_M5
               ,`AXI_NV_S6_BY_M5
               ,`AXI_NV_S7_BY_M5
               ,`AXI_NV_S8_BY_M5
               ,`AXI_NV_S9_BY_M5
               ,`AXI_NV_S10_BY_M5
               ,`AXI_NV_S11_BY_M5
               ,`AXI_NV_S12_BY_M5
               ,`AXI_NV_S13_BY_M5
               ,`AXI_NV_S14_BY_M5
               ,`AXI_NV_S15_BY_M5
               ,`AXI_NV_S16_BY_M5
               , 1
               ,`AXI_BV_S1_BY_M5
               ,`AXI_BV_S2_BY_M5
               ,`AXI_BV_S3_BY_M5
               ,`AXI_BV_S4_BY_M5
               ,`AXI_BV_S5_BY_M5
               ,`AXI_BV_S6_BY_M5
               ,`AXI_BV_S7_BY_M5
               ,`AXI_BV_S8_BY_M5
               ,`AXI_BV_S9_BY_M5
               ,`AXI_BV_S10_BY_M5
               ,`AXI_BV_S11_BY_M5
               ,`AXI_BV_S12_BY_M5
               ,`AXI_BV_S13_BY_M5
               ,`AXI_BV_S14_BY_M5
               ,`AXI_BV_S15_BY_M5
               ,`AXI_BV_S16_BY_M5
             )
             U_ardcdr_m5(
                  .addr_i  (araddr_m5),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m5)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M5, `AXI_LOG2_NSP1V_M5, 1
               ,`AXI_NV_S1_BY_M5
               ,`AXI_NV_S2_BY_M5
               ,`AXI_NV_S3_BY_M5
               ,`AXI_NV_S4_BY_M5
               ,`AXI_NV_S5_BY_M5
               ,`AXI_NV_S6_BY_M5
               ,`AXI_NV_S7_BY_M5
               ,`AXI_NV_S8_BY_M5
               ,`AXI_NV_S9_BY_M5
               ,`AXI_NV_S10_BY_M5
               ,`AXI_NV_S11_BY_M5
               ,`AXI_NV_S12_BY_M5
               ,`AXI_NV_S13_BY_M5
               ,`AXI_NV_S14_BY_M5
               ,`AXI_NV_S15_BY_M5
               ,`AXI_NV_S16_BY_M5
               , 1
               ,`AXI_BV_S1_BY_M5
               ,`AXI_BV_S2_BY_M5
               ,`AXI_BV_S3_BY_M5
               ,`AXI_BV_S4_BY_M5
               ,`AXI_BV_S5_BY_M5
               ,`AXI_BV_S6_BY_M5
               ,`AXI_BV_S7_BY_M5
               ,`AXI_BV_S8_BY_M5
               ,`AXI_BV_S9_BY_M5
               ,`AXI_BV_S10_BY_M5
               ,`AXI_BV_S11_BY_M5
               ,`AXI_BV_S12_BY_M5
               ,`AXI_BV_S13_BY_M5
               ,`AXI_BV_S14_BY_M5
               ,`AXI_BV_S15_BY_M5
               ,`AXI_BV_S16_BY_M5
             )
       U_awdcdr_m5(
                  .addr_i  (awaddr_m5),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m5)
                 );
`endif
`ifdef AXI_HAS_M6
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M6, `AXI_LOG2_NSP1V_M6, 1
               ,`AXI_NV_S1_BY_M6
               ,`AXI_NV_S2_BY_M6
               ,`AXI_NV_S3_BY_M6
               ,`AXI_NV_S4_BY_M6
               ,`AXI_NV_S5_BY_M6
               ,`AXI_NV_S6_BY_M6
               ,`AXI_NV_S7_BY_M6
               ,`AXI_NV_S8_BY_M6
               ,`AXI_NV_S9_BY_M6
               ,`AXI_NV_S10_BY_M6
               ,`AXI_NV_S11_BY_M6
               ,`AXI_NV_S12_BY_M6
               ,`AXI_NV_S13_BY_M6
               ,`AXI_NV_S14_BY_M6
               ,`AXI_NV_S15_BY_M6
               ,`AXI_NV_S16_BY_M6
               , 1
               ,`AXI_BV_S1_BY_M6
               ,`AXI_BV_S2_BY_M6
               ,`AXI_BV_S3_BY_M6
               ,`AXI_BV_S4_BY_M6
               ,`AXI_BV_S5_BY_M6
               ,`AXI_BV_S6_BY_M6
               ,`AXI_BV_S7_BY_M6
               ,`AXI_BV_S8_BY_M6
               ,`AXI_BV_S9_BY_M6
               ,`AXI_BV_S10_BY_M6
               ,`AXI_BV_S11_BY_M6
               ,`AXI_BV_S12_BY_M6
               ,`AXI_BV_S13_BY_M6
               ,`AXI_BV_S14_BY_M6
               ,`AXI_BV_S15_BY_M6
               ,`AXI_BV_S16_BY_M6
             )
             U_ardcdr_m6(
                  .addr_i  (araddr_m6),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m6)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M6, `AXI_LOG2_NSP1V_M6, 1
               ,`AXI_NV_S1_BY_M6
               ,`AXI_NV_S2_BY_M6
               ,`AXI_NV_S3_BY_M6
               ,`AXI_NV_S4_BY_M6
               ,`AXI_NV_S5_BY_M6
               ,`AXI_NV_S6_BY_M6
               ,`AXI_NV_S7_BY_M6
               ,`AXI_NV_S8_BY_M6
               ,`AXI_NV_S9_BY_M6
               ,`AXI_NV_S10_BY_M6
               ,`AXI_NV_S11_BY_M6
               ,`AXI_NV_S12_BY_M6
               ,`AXI_NV_S13_BY_M6
               ,`AXI_NV_S14_BY_M6
               ,`AXI_NV_S15_BY_M6
               ,`AXI_NV_S16_BY_M6
               , 1
               ,`AXI_BV_S1_BY_M6
               ,`AXI_BV_S2_BY_M6
               ,`AXI_BV_S3_BY_M6
               ,`AXI_BV_S4_BY_M6
               ,`AXI_BV_S5_BY_M6
               ,`AXI_BV_S6_BY_M6
               ,`AXI_BV_S7_BY_M6
               ,`AXI_BV_S8_BY_M6
               ,`AXI_BV_S9_BY_M6
               ,`AXI_BV_S10_BY_M6
               ,`AXI_BV_S11_BY_M6
               ,`AXI_BV_S12_BY_M6
               ,`AXI_BV_S13_BY_M6
               ,`AXI_BV_S14_BY_M6
               ,`AXI_BV_S15_BY_M6
               ,`AXI_BV_S16_BY_M6
             )
       U_awdcdr_m6(
                  .addr_i  (awaddr_m6),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m6)
                 );
`endif
`ifdef AXI_HAS_M7
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M7, `AXI_LOG2_NSP1V_M7, 1
               ,`AXI_NV_S1_BY_M7
               ,`AXI_NV_S2_BY_M7
               ,`AXI_NV_S3_BY_M7
               ,`AXI_NV_S4_BY_M7
               ,`AXI_NV_S5_BY_M7
               ,`AXI_NV_S6_BY_M7
               ,`AXI_NV_S7_BY_M7
               ,`AXI_NV_S8_BY_M7
               ,`AXI_NV_S9_BY_M7
               ,`AXI_NV_S10_BY_M7
               ,`AXI_NV_S11_BY_M7
               ,`AXI_NV_S12_BY_M7
               ,`AXI_NV_S13_BY_M7
               ,`AXI_NV_S14_BY_M7
               ,`AXI_NV_S15_BY_M7
               ,`AXI_NV_S16_BY_M7
               , 1
               ,`AXI_BV_S1_BY_M7
               ,`AXI_BV_S2_BY_M7
               ,`AXI_BV_S3_BY_M7
               ,`AXI_BV_S4_BY_M7
               ,`AXI_BV_S5_BY_M7
               ,`AXI_BV_S6_BY_M7
               ,`AXI_BV_S7_BY_M7
               ,`AXI_BV_S8_BY_M7
               ,`AXI_BV_S9_BY_M7
               ,`AXI_BV_S10_BY_M7
               ,`AXI_BV_S11_BY_M7
               ,`AXI_BV_S12_BY_M7
               ,`AXI_BV_S13_BY_M7
               ,`AXI_BV_S14_BY_M7
               ,`AXI_BV_S15_BY_M7
               ,`AXI_BV_S16_BY_M7
             )
             U_ardcdr_m7(
                  .addr_i  (araddr_m7),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m7)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M7, `AXI_LOG2_NSP1V_M7, 1
               ,`AXI_NV_S1_BY_M7
               ,`AXI_NV_S2_BY_M7
               ,`AXI_NV_S3_BY_M7
               ,`AXI_NV_S4_BY_M7
               ,`AXI_NV_S5_BY_M7
               ,`AXI_NV_S6_BY_M7
               ,`AXI_NV_S7_BY_M7
               ,`AXI_NV_S8_BY_M7
               ,`AXI_NV_S9_BY_M7
               ,`AXI_NV_S10_BY_M7
               ,`AXI_NV_S11_BY_M7
               ,`AXI_NV_S12_BY_M7
               ,`AXI_NV_S13_BY_M7
               ,`AXI_NV_S14_BY_M7
               ,`AXI_NV_S15_BY_M7
               ,`AXI_NV_S16_BY_M7
               , 1
               ,`AXI_BV_S1_BY_M7
               ,`AXI_BV_S2_BY_M7
               ,`AXI_BV_S3_BY_M7
               ,`AXI_BV_S4_BY_M7
               ,`AXI_BV_S5_BY_M7
               ,`AXI_BV_S6_BY_M7
               ,`AXI_BV_S7_BY_M7
               ,`AXI_BV_S8_BY_M7
               ,`AXI_BV_S9_BY_M7
               ,`AXI_BV_S10_BY_M7
               ,`AXI_BV_S11_BY_M7
               ,`AXI_BV_S12_BY_M7
               ,`AXI_BV_S13_BY_M7
               ,`AXI_BV_S14_BY_M7
               ,`AXI_BV_S15_BY_M7
               ,`AXI_BV_S16_BY_M7
             )
       U_awdcdr_m7(
                  .addr_i  (awaddr_m7),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m7)
                 );
`endif
`ifdef AXI_HAS_M8
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M8, `AXI_LOG2_NSP1V_M8, 1
               ,`AXI_NV_S1_BY_M8
               ,`AXI_NV_S2_BY_M8
               ,`AXI_NV_S3_BY_M8
               ,`AXI_NV_S4_BY_M8
               ,`AXI_NV_S5_BY_M8
               ,`AXI_NV_S6_BY_M8
               ,`AXI_NV_S7_BY_M8
               ,`AXI_NV_S8_BY_M8
               ,`AXI_NV_S9_BY_M8
               ,`AXI_NV_S10_BY_M8
               ,`AXI_NV_S11_BY_M8
               ,`AXI_NV_S12_BY_M8
               ,`AXI_NV_S13_BY_M8
               ,`AXI_NV_S14_BY_M8
               ,`AXI_NV_S15_BY_M8
               ,`AXI_NV_S16_BY_M8
               , 1
               ,`AXI_BV_S1_BY_M8
               ,`AXI_BV_S2_BY_M8
               ,`AXI_BV_S3_BY_M8
               ,`AXI_BV_S4_BY_M8
               ,`AXI_BV_S5_BY_M8
               ,`AXI_BV_S6_BY_M8
               ,`AXI_BV_S7_BY_M8
               ,`AXI_BV_S8_BY_M8
               ,`AXI_BV_S9_BY_M8
               ,`AXI_BV_S10_BY_M8
               ,`AXI_BV_S11_BY_M8
               ,`AXI_BV_S12_BY_M8
               ,`AXI_BV_S13_BY_M8
               ,`AXI_BV_S14_BY_M8
               ,`AXI_BV_S15_BY_M8
               ,`AXI_BV_S16_BY_M8
             )
             U_ardcdr_m8(
                  .addr_i  (araddr_m8),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m8)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M8, `AXI_LOG2_NSP1V_M8, 1
               ,`AXI_NV_S1_BY_M8
               ,`AXI_NV_S2_BY_M8
               ,`AXI_NV_S3_BY_M8
               ,`AXI_NV_S4_BY_M8
               ,`AXI_NV_S5_BY_M8
               ,`AXI_NV_S6_BY_M8
               ,`AXI_NV_S7_BY_M8
               ,`AXI_NV_S8_BY_M8
               ,`AXI_NV_S9_BY_M8
               ,`AXI_NV_S10_BY_M8
               ,`AXI_NV_S11_BY_M8
               ,`AXI_NV_S12_BY_M8
               ,`AXI_NV_S13_BY_M8
               ,`AXI_NV_S14_BY_M8
               ,`AXI_NV_S15_BY_M8
               ,`AXI_NV_S16_BY_M8
               , 1
               ,`AXI_BV_S1_BY_M8
               ,`AXI_BV_S2_BY_M8
               ,`AXI_BV_S3_BY_M8
               ,`AXI_BV_S4_BY_M8
               ,`AXI_BV_S5_BY_M8
               ,`AXI_BV_S6_BY_M8
               ,`AXI_BV_S7_BY_M8
               ,`AXI_BV_S8_BY_M8
               ,`AXI_BV_S9_BY_M8
               ,`AXI_BV_S10_BY_M8
               ,`AXI_BV_S11_BY_M8
               ,`AXI_BV_S12_BY_M8
               ,`AXI_BV_S13_BY_M8
               ,`AXI_BV_S14_BY_M8
               ,`AXI_BV_S15_BY_M8
               ,`AXI_BV_S16_BY_M8
             )
       U_awdcdr_m8(
                  .addr_i  (awaddr_m8),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m8)
                 );
`endif
`ifdef AXI_HAS_M9
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M9, `AXI_LOG2_NSP1V_M9, 1
               ,`AXI_NV_S1_BY_M9
               ,`AXI_NV_S2_BY_M9
               ,`AXI_NV_S3_BY_M9
               ,`AXI_NV_S4_BY_M9
               ,`AXI_NV_S5_BY_M9
               ,`AXI_NV_S6_BY_M9
               ,`AXI_NV_S7_BY_M9
               ,`AXI_NV_S8_BY_M9
               ,`AXI_NV_S9_BY_M9
               ,`AXI_NV_S10_BY_M9
               ,`AXI_NV_S11_BY_M9
               ,`AXI_NV_S12_BY_M9
               ,`AXI_NV_S13_BY_M9
               ,`AXI_NV_S14_BY_M9
               ,`AXI_NV_S15_BY_M9
               ,`AXI_NV_S16_BY_M9
               , 1
               ,`AXI_BV_S1_BY_M9
               ,`AXI_BV_S2_BY_M9
               ,`AXI_BV_S3_BY_M9
               ,`AXI_BV_S4_BY_M9
               ,`AXI_BV_S5_BY_M9
               ,`AXI_BV_S6_BY_M9
               ,`AXI_BV_S7_BY_M9
               ,`AXI_BV_S8_BY_M9
               ,`AXI_BV_S9_BY_M9
               ,`AXI_BV_S10_BY_M9
               ,`AXI_BV_S11_BY_M9
               ,`AXI_BV_S12_BY_M9
               ,`AXI_BV_S13_BY_M9
               ,`AXI_BV_S14_BY_M9
               ,`AXI_BV_S15_BY_M9
               ,`AXI_BV_S16_BY_M9
             )
             U_ardcdr_m9(
                  .addr_i  (araddr_m9),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m9)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M9, `AXI_LOG2_NSP1V_M9, 1
               ,`AXI_NV_S1_BY_M9
               ,`AXI_NV_S2_BY_M9
               ,`AXI_NV_S3_BY_M9
               ,`AXI_NV_S4_BY_M9
               ,`AXI_NV_S5_BY_M9
               ,`AXI_NV_S6_BY_M9
               ,`AXI_NV_S7_BY_M9
               ,`AXI_NV_S8_BY_M9
               ,`AXI_NV_S9_BY_M9
               ,`AXI_NV_S10_BY_M9
               ,`AXI_NV_S11_BY_M9
               ,`AXI_NV_S12_BY_M9
               ,`AXI_NV_S13_BY_M9
               ,`AXI_NV_S14_BY_M9
               ,`AXI_NV_S15_BY_M9
               ,`AXI_NV_S16_BY_M9
               , 1
               ,`AXI_BV_S1_BY_M9
               ,`AXI_BV_S2_BY_M9
               ,`AXI_BV_S3_BY_M9
               ,`AXI_BV_S4_BY_M9
               ,`AXI_BV_S5_BY_M9
               ,`AXI_BV_S6_BY_M9
               ,`AXI_BV_S7_BY_M9
               ,`AXI_BV_S8_BY_M9
               ,`AXI_BV_S9_BY_M9
               ,`AXI_BV_S10_BY_M9
               ,`AXI_BV_S11_BY_M9
               ,`AXI_BV_S12_BY_M9
               ,`AXI_BV_S13_BY_M9
               ,`AXI_BV_S14_BY_M9
               ,`AXI_BV_S15_BY_M9
               ,`AXI_BV_S16_BY_M9
             )
       U_awdcdr_m9(
                  .addr_i  (awaddr_m9),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m9)
                 );
`endif
`ifdef AXI_HAS_M10
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M10, `AXI_LOG2_NSP1V_M10, 1
               ,`AXI_NV_S1_BY_M10
               ,`AXI_NV_S2_BY_M10
               ,`AXI_NV_S3_BY_M10
               ,`AXI_NV_S4_BY_M10
               ,`AXI_NV_S5_BY_M10
               ,`AXI_NV_S6_BY_M10
               ,`AXI_NV_S7_BY_M10
               ,`AXI_NV_S8_BY_M10
               ,`AXI_NV_S9_BY_M10
               ,`AXI_NV_S10_BY_M10
               ,`AXI_NV_S11_BY_M10
               ,`AXI_NV_S12_BY_M10
               ,`AXI_NV_S13_BY_M10
               ,`AXI_NV_S14_BY_M10
               ,`AXI_NV_S15_BY_M10
               ,`AXI_NV_S16_BY_M10
               , 1
               ,`AXI_BV_S1_BY_M10
               ,`AXI_BV_S2_BY_M10
               ,`AXI_BV_S3_BY_M10
               ,`AXI_BV_S4_BY_M10
               ,`AXI_BV_S5_BY_M10
               ,`AXI_BV_S6_BY_M10
               ,`AXI_BV_S7_BY_M10
               ,`AXI_BV_S8_BY_M10
               ,`AXI_BV_S9_BY_M10
               ,`AXI_BV_S10_BY_M10
               ,`AXI_BV_S11_BY_M10
               ,`AXI_BV_S12_BY_M10
               ,`AXI_BV_S13_BY_M10
               ,`AXI_BV_S14_BY_M10
               ,`AXI_BV_S15_BY_M10
               ,`AXI_BV_S16_BY_M10
             )
             U_ardcdr_m10(
                  .addr_i  (araddr_m10),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m10)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M10, `AXI_LOG2_NSP1V_M10, 1
               ,`AXI_NV_S1_BY_M10
               ,`AXI_NV_S2_BY_M10
               ,`AXI_NV_S3_BY_M10
               ,`AXI_NV_S4_BY_M10
               ,`AXI_NV_S5_BY_M10
               ,`AXI_NV_S6_BY_M10
               ,`AXI_NV_S7_BY_M10
               ,`AXI_NV_S8_BY_M10
               ,`AXI_NV_S9_BY_M10
               ,`AXI_NV_S10_BY_M10
               ,`AXI_NV_S11_BY_M10
               ,`AXI_NV_S12_BY_M10
               ,`AXI_NV_S13_BY_M10
               ,`AXI_NV_S14_BY_M10
               ,`AXI_NV_S15_BY_M10
               ,`AXI_NV_S16_BY_M10
               , 1
               ,`AXI_BV_S1_BY_M10
               ,`AXI_BV_S2_BY_M10
               ,`AXI_BV_S3_BY_M10
               ,`AXI_BV_S4_BY_M10
               ,`AXI_BV_S5_BY_M10
               ,`AXI_BV_S6_BY_M10
               ,`AXI_BV_S7_BY_M10
               ,`AXI_BV_S8_BY_M10
               ,`AXI_BV_S9_BY_M10
               ,`AXI_BV_S10_BY_M10
               ,`AXI_BV_S11_BY_M10
               ,`AXI_BV_S12_BY_M10
               ,`AXI_BV_S13_BY_M10
               ,`AXI_BV_S14_BY_M10
               ,`AXI_BV_S15_BY_M10
               ,`AXI_BV_S16_BY_M10
             )
       U_awdcdr_m10(
                  .addr_i  (awaddr_m10),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m10)
                 );
`endif
`ifdef AXI_HAS_M11
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M11, `AXI_LOG2_NSP1V_M11, 1
               ,`AXI_NV_S1_BY_M11
               ,`AXI_NV_S2_BY_M11
               ,`AXI_NV_S3_BY_M11
               ,`AXI_NV_S4_BY_M11
               ,`AXI_NV_S5_BY_M11
               ,`AXI_NV_S6_BY_M11
               ,`AXI_NV_S7_BY_M11
               ,`AXI_NV_S8_BY_M11
               ,`AXI_NV_S9_BY_M11
               ,`AXI_NV_S10_BY_M11
               ,`AXI_NV_S11_BY_M11
               ,`AXI_NV_S12_BY_M11
               ,`AXI_NV_S13_BY_M11
               ,`AXI_NV_S14_BY_M11
               ,`AXI_NV_S15_BY_M11
               ,`AXI_NV_S16_BY_M11
               , 1
               ,`AXI_BV_S1_BY_M11
               ,`AXI_BV_S2_BY_M11
               ,`AXI_BV_S3_BY_M11
               ,`AXI_BV_S4_BY_M11
               ,`AXI_BV_S5_BY_M11
               ,`AXI_BV_S6_BY_M11
               ,`AXI_BV_S7_BY_M11
               ,`AXI_BV_S8_BY_M11
               ,`AXI_BV_S9_BY_M11
               ,`AXI_BV_S10_BY_M11
               ,`AXI_BV_S11_BY_M11
               ,`AXI_BV_S12_BY_M11
               ,`AXI_BV_S13_BY_M11
               ,`AXI_BV_S14_BY_M11
               ,`AXI_BV_S15_BY_M11
               ,`AXI_BV_S16_BY_M11
             )
             U_ardcdr_m11(
                  .addr_i  (araddr_m11),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m11)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M11, `AXI_LOG2_NSP1V_M11, 1
               ,`AXI_NV_S1_BY_M11
               ,`AXI_NV_S2_BY_M11
               ,`AXI_NV_S3_BY_M11
               ,`AXI_NV_S4_BY_M11
               ,`AXI_NV_S5_BY_M11
               ,`AXI_NV_S6_BY_M11
               ,`AXI_NV_S7_BY_M11
               ,`AXI_NV_S8_BY_M11
               ,`AXI_NV_S9_BY_M11
               ,`AXI_NV_S10_BY_M11
               ,`AXI_NV_S11_BY_M11
               ,`AXI_NV_S12_BY_M11
               ,`AXI_NV_S13_BY_M11
               ,`AXI_NV_S14_BY_M11
               ,`AXI_NV_S15_BY_M11
               ,`AXI_NV_S16_BY_M11
               , 1
               ,`AXI_BV_S1_BY_M11
               ,`AXI_BV_S2_BY_M11
               ,`AXI_BV_S3_BY_M11
               ,`AXI_BV_S4_BY_M11
               ,`AXI_BV_S5_BY_M11
               ,`AXI_BV_S6_BY_M11
               ,`AXI_BV_S7_BY_M11
               ,`AXI_BV_S8_BY_M11
               ,`AXI_BV_S9_BY_M11
               ,`AXI_BV_S10_BY_M11
               ,`AXI_BV_S11_BY_M11
               ,`AXI_BV_S12_BY_M11
               ,`AXI_BV_S13_BY_M11
               ,`AXI_BV_S14_BY_M11
               ,`AXI_BV_S15_BY_M11
               ,`AXI_BV_S16_BY_M11
             )
       U_awdcdr_m11(
                  .addr_i  (awaddr_m11),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m11)
                 );
`endif
`ifdef AXI_HAS_M12
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M12, `AXI_LOG2_NSP1V_M12, 1
               ,`AXI_NV_S1_BY_M12
               ,`AXI_NV_S2_BY_M12
               ,`AXI_NV_S3_BY_M12
               ,`AXI_NV_S4_BY_M12
               ,`AXI_NV_S5_BY_M12
               ,`AXI_NV_S6_BY_M12
               ,`AXI_NV_S7_BY_M12
               ,`AXI_NV_S8_BY_M12
               ,`AXI_NV_S9_BY_M12
               ,`AXI_NV_S10_BY_M12
               ,`AXI_NV_S11_BY_M12
               ,`AXI_NV_S12_BY_M12
               ,`AXI_NV_S13_BY_M12
               ,`AXI_NV_S14_BY_M12
               ,`AXI_NV_S15_BY_M12
               ,`AXI_NV_S16_BY_M12
               , 1
               ,`AXI_BV_S1_BY_M12
               ,`AXI_BV_S2_BY_M12
               ,`AXI_BV_S3_BY_M12
               ,`AXI_BV_S4_BY_M12
               ,`AXI_BV_S5_BY_M12
               ,`AXI_BV_S6_BY_M12
               ,`AXI_BV_S7_BY_M12
               ,`AXI_BV_S8_BY_M12
               ,`AXI_BV_S9_BY_M12
               ,`AXI_BV_S10_BY_M12
               ,`AXI_BV_S11_BY_M12
               ,`AXI_BV_S12_BY_M12
               ,`AXI_BV_S13_BY_M12
               ,`AXI_BV_S14_BY_M12
               ,`AXI_BV_S15_BY_M12
               ,`AXI_BV_S16_BY_M12
             )
             U_ardcdr_m12(
                  .addr_i  (araddr_m12),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m12)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M12, `AXI_LOG2_NSP1V_M12, 1
               ,`AXI_NV_S1_BY_M12
               ,`AXI_NV_S2_BY_M12
               ,`AXI_NV_S3_BY_M12
               ,`AXI_NV_S4_BY_M12
               ,`AXI_NV_S5_BY_M12
               ,`AXI_NV_S6_BY_M12
               ,`AXI_NV_S7_BY_M12
               ,`AXI_NV_S8_BY_M12
               ,`AXI_NV_S9_BY_M12
               ,`AXI_NV_S10_BY_M12
               ,`AXI_NV_S11_BY_M12
               ,`AXI_NV_S12_BY_M12
               ,`AXI_NV_S13_BY_M12
               ,`AXI_NV_S14_BY_M12
               ,`AXI_NV_S15_BY_M12
               ,`AXI_NV_S16_BY_M12
               , 1
               ,`AXI_BV_S1_BY_M12
               ,`AXI_BV_S2_BY_M12
               ,`AXI_BV_S3_BY_M12
               ,`AXI_BV_S4_BY_M12
               ,`AXI_BV_S5_BY_M12
               ,`AXI_BV_S6_BY_M12
               ,`AXI_BV_S7_BY_M12
               ,`AXI_BV_S8_BY_M12
               ,`AXI_BV_S9_BY_M12
               ,`AXI_BV_S10_BY_M12
               ,`AXI_BV_S11_BY_M12
               ,`AXI_BV_S12_BY_M12
               ,`AXI_BV_S13_BY_M12
               ,`AXI_BV_S14_BY_M12
               ,`AXI_BV_S15_BY_M12
               ,`AXI_BV_S16_BY_M12
             )
       U_awdcdr_m12(
                  .addr_i  (awaddr_m12),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m12)
                 );
`endif
`ifdef AXI_HAS_M13
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M13, `AXI_LOG2_NSP1V_M13, 1
               ,`AXI_NV_S1_BY_M13
               ,`AXI_NV_S2_BY_M13
               ,`AXI_NV_S3_BY_M13
               ,`AXI_NV_S4_BY_M13
               ,`AXI_NV_S5_BY_M13
               ,`AXI_NV_S6_BY_M13
               ,`AXI_NV_S7_BY_M13
               ,`AXI_NV_S8_BY_M13
               ,`AXI_NV_S9_BY_M13
               ,`AXI_NV_S10_BY_M13
               ,`AXI_NV_S11_BY_M13
               ,`AXI_NV_S12_BY_M13
               ,`AXI_NV_S13_BY_M13
               ,`AXI_NV_S14_BY_M13
               ,`AXI_NV_S15_BY_M13
               ,`AXI_NV_S16_BY_M13
               , 1
               ,`AXI_BV_S1_BY_M13
               ,`AXI_BV_S2_BY_M13
               ,`AXI_BV_S3_BY_M13
               ,`AXI_BV_S4_BY_M13
               ,`AXI_BV_S5_BY_M13
               ,`AXI_BV_S6_BY_M13
               ,`AXI_BV_S7_BY_M13
               ,`AXI_BV_S8_BY_M13
               ,`AXI_BV_S9_BY_M13
               ,`AXI_BV_S10_BY_M13
               ,`AXI_BV_S11_BY_M13
               ,`AXI_BV_S12_BY_M13
               ,`AXI_BV_S13_BY_M13
               ,`AXI_BV_S14_BY_M13
               ,`AXI_BV_S15_BY_M13
               ,`AXI_BV_S16_BY_M13
             )
             U_ardcdr_m13(
                  .addr_i  (araddr_m13),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m13)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M13, `AXI_LOG2_NSP1V_M13, 1
               ,`AXI_NV_S1_BY_M13
               ,`AXI_NV_S2_BY_M13
               ,`AXI_NV_S3_BY_M13
               ,`AXI_NV_S4_BY_M13
               ,`AXI_NV_S5_BY_M13
               ,`AXI_NV_S6_BY_M13
               ,`AXI_NV_S7_BY_M13
               ,`AXI_NV_S8_BY_M13
               ,`AXI_NV_S9_BY_M13
               ,`AXI_NV_S10_BY_M13
               ,`AXI_NV_S11_BY_M13
               ,`AXI_NV_S12_BY_M13
               ,`AXI_NV_S13_BY_M13
               ,`AXI_NV_S14_BY_M13
               ,`AXI_NV_S15_BY_M13
               ,`AXI_NV_S16_BY_M13
               , 1
               ,`AXI_BV_S1_BY_M13
               ,`AXI_BV_S2_BY_M13
               ,`AXI_BV_S3_BY_M13
               ,`AXI_BV_S4_BY_M13
               ,`AXI_BV_S5_BY_M13
               ,`AXI_BV_S6_BY_M13
               ,`AXI_BV_S7_BY_M13
               ,`AXI_BV_S8_BY_M13
               ,`AXI_BV_S9_BY_M13
               ,`AXI_BV_S10_BY_M13
               ,`AXI_BV_S11_BY_M13
               ,`AXI_BV_S12_BY_M13
               ,`AXI_BV_S13_BY_M13
               ,`AXI_BV_S14_BY_M13
               ,`AXI_BV_S15_BY_M13
               ,`AXI_BV_S16_BY_M13
             )
       U_awdcdr_m13(
                  .addr_i  (awaddr_m13),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m13)
                 );
`endif
`ifdef AXI_HAS_M14
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M14, `AXI_LOG2_NSP1V_M14, 1
               ,`AXI_NV_S1_BY_M14
               ,`AXI_NV_S2_BY_M14
               ,`AXI_NV_S3_BY_M14
               ,`AXI_NV_S4_BY_M14
               ,`AXI_NV_S5_BY_M14
               ,`AXI_NV_S6_BY_M14
               ,`AXI_NV_S7_BY_M14
               ,`AXI_NV_S8_BY_M14
               ,`AXI_NV_S9_BY_M14
               ,`AXI_NV_S10_BY_M14
               ,`AXI_NV_S11_BY_M14
               ,`AXI_NV_S12_BY_M14
               ,`AXI_NV_S13_BY_M14
               ,`AXI_NV_S14_BY_M14
               ,`AXI_NV_S15_BY_M14
               ,`AXI_NV_S16_BY_M14
               , 1
               ,`AXI_BV_S1_BY_M14
               ,`AXI_BV_S2_BY_M14
               ,`AXI_BV_S3_BY_M14
               ,`AXI_BV_S4_BY_M14
               ,`AXI_BV_S5_BY_M14
               ,`AXI_BV_S6_BY_M14
               ,`AXI_BV_S7_BY_M14
               ,`AXI_BV_S8_BY_M14
               ,`AXI_BV_S9_BY_M14
               ,`AXI_BV_S10_BY_M14
               ,`AXI_BV_S11_BY_M14
               ,`AXI_BV_S12_BY_M14
               ,`AXI_BV_S13_BY_M14
               ,`AXI_BV_S14_BY_M14
               ,`AXI_BV_S15_BY_M14
               ,`AXI_BV_S16_BY_M14
             )
             U_ardcdr_m14(
                  .addr_i  (araddr_m14),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m14)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M14, `AXI_LOG2_NSP1V_M14, 1
               ,`AXI_NV_S1_BY_M14
               ,`AXI_NV_S2_BY_M14
               ,`AXI_NV_S3_BY_M14
               ,`AXI_NV_S4_BY_M14
               ,`AXI_NV_S5_BY_M14
               ,`AXI_NV_S6_BY_M14
               ,`AXI_NV_S7_BY_M14
               ,`AXI_NV_S8_BY_M14
               ,`AXI_NV_S9_BY_M14
               ,`AXI_NV_S10_BY_M14
               ,`AXI_NV_S11_BY_M14
               ,`AXI_NV_S12_BY_M14
               ,`AXI_NV_S13_BY_M14
               ,`AXI_NV_S14_BY_M14
               ,`AXI_NV_S15_BY_M14
               ,`AXI_NV_S16_BY_M14
               , 1
               ,`AXI_BV_S1_BY_M14
               ,`AXI_BV_S2_BY_M14
               ,`AXI_BV_S3_BY_M14
               ,`AXI_BV_S4_BY_M14
               ,`AXI_BV_S5_BY_M14
               ,`AXI_BV_S6_BY_M14
               ,`AXI_BV_S7_BY_M14
               ,`AXI_BV_S8_BY_M14
               ,`AXI_BV_S9_BY_M14
               ,`AXI_BV_S10_BY_M14
               ,`AXI_BV_S11_BY_M14
               ,`AXI_BV_S12_BY_M14
               ,`AXI_BV_S13_BY_M14
               ,`AXI_BV_S14_BY_M14
               ,`AXI_BV_S15_BY_M14
               ,`AXI_BV_S16_BY_M14
             )
       U_awdcdr_m14(
                  .addr_i  (awaddr_m14),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m14)
                 );
`endif
`ifdef AXI_HAS_M15
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M15, `AXI_LOG2_NSP1V_M15, 1
               ,`AXI_NV_S1_BY_M15
               ,`AXI_NV_S2_BY_M15
               ,`AXI_NV_S3_BY_M15
               ,`AXI_NV_S4_BY_M15
               ,`AXI_NV_S5_BY_M15
               ,`AXI_NV_S6_BY_M15
               ,`AXI_NV_S7_BY_M15
               ,`AXI_NV_S8_BY_M15
               ,`AXI_NV_S9_BY_M15
               ,`AXI_NV_S10_BY_M15
               ,`AXI_NV_S11_BY_M15
               ,`AXI_NV_S12_BY_M15
               ,`AXI_NV_S13_BY_M15
               ,`AXI_NV_S14_BY_M15
               ,`AXI_NV_S15_BY_M15
               ,`AXI_NV_S16_BY_M15
               , 1
               ,`AXI_BV_S1_BY_M15
               ,`AXI_BV_S2_BY_M15
               ,`AXI_BV_S3_BY_M15
               ,`AXI_BV_S4_BY_M15
               ,`AXI_BV_S5_BY_M15
               ,`AXI_BV_S6_BY_M15
               ,`AXI_BV_S7_BY_M15
               ,`AXI_BV_S8_BY_M15
               ,`AXI_BV_S9_BY_M15
               ,`AXI_BV_S10_BY_M15
               ,`AXI_BV_S11_BY_M15
               ,`AXI_BV_S12_BY_M15
               ,`AXI_BV_S13_BY_M15
               ,`AXI_BV_S14_BY_M15
               ,`AXI_BV_S15_BY_M15
               ,`AXI_BV_S16_BY_M15
             )
             U_ardcdr_m15(
                  .addr_i  (araddr_m15),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m15)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M15, `AXI_LOG2_NSP1V_M15, 1
               ,`AXI_NV_S1_BY_M15
               ,`AXI_NV_S2_BY_M15
               ,`AXI_NV_S3_BY_M15
               ,`AXI_NV_S4_BY_M15
               ,`AXI_NV_S5_BY_M15
               ,`AXI_NV_S6_BY_M15
               ,`AXI_NV_S7_BY_M15
               ,`AXI_NV_S8_BY_M15
               ,`AXI_NV_S9_BY_M15
               ,`AXI_NV_S10_BY_M15
               ,`AXI_NV_S11_BY_M15
               ,`AXI_NV_S12_BY_M15
               ,`AXI_NV_S13_BY_M15
               ,`AXI_NV_S14_BY_M15
               ,`AXI_NV_S15_BY_M15
               ,`AXI_NV_S16_BY_M15
               , 1
               ,`AXI_BV_S1_BY_M15
               ,`AXI_BV_S2_BY_M15
               ,`AXI_BV_S3_BY_M15
               ,`AXI_BV_S4_BY_M15
               ,`AXI_BV_S5_BY_M15
               ,`AXI_BV_S6_BY_M15
               ,`AXI_BV_S7_BY_M15
               ,`AXI_BV_S8_BY_M15
               ,`AXI_BV_S9_BY_M15
               ,`AXI_BV_S10_BY_M15
               ,`AXI_BV_S11_BY_M15
               ,`AXI_BV_S12_BY_M15
               ,`AXI_BV_S13_BY_M15
               ,`AXI_BV_S14_BY_M15
               ,`AXI_BV_S15_BY_M15
               ,`AXI_BV_S16_BY_M15
             )
       U_awdcdr_m15(
                  .addr_i  (awaddr_m15),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m15)
                 );
`endif
`ifdef AXI_HAS_M16
// External Read Address Decoders Instantiation

  tb_dcdr
   #(`AXI_NSP1V_M16, `AXI_LOG2_NSP1V_M16, 1
               ,`AXI_NV_S1_BY_M16
               ,`AXI_NV_S2_BY_M16
               ,`AXI_NV_S3_BY_M16
               ,`AXI_NV_S4_BY_M16
               ,`AXI_NV_S5_BY_M16
               ,`AXI_NV_S6_BY_M16
               ,`AXI_NV_S7_BY_M16
               ,`AXI_NV_S8_BY_M16
               ,`AXI_NV_S9_BY_M16
               ,`AXI_NV_S10_BY_M16
               ,`AXI_NV_S11_BY_M16
               ,`AXI_NV_S12_BY_M16
               ,`AXI_NV_S13_BY_M16
               ,`AXI_NV_S14_BY_M16
               ,`AXI_NV_S15_BY_M16
               ,`AXI_NV_S16_BY_M16
               , 1
               ,`AXI_BV_S1_BY_M16
               ,`AXI_BV_S2_BY_M16
               ,`AXI_BV_S3_BY_M16
               ,`AXI_BV_S4_BY_M16
               ,`AXI_BV_S5_BY_M16
               ,`AXI_BV_S6_BY_M16
               ,`AXI_BV_S7_BY_M16
               ,`AXI_BV_S8_BY_M16
               ,`AXI_BV_S9_BY_M16
               ,`AXI_BV_S10_BY_M16
               ,`AXI_BV_S11_BY_M16
               ,`AXI_BV_S12_BY_M16
               ,`AXI_BV_S13_BY_M16
               ,`AXI_BV_S14_BY_M16
               ,`AXI_BV_S15_BY_M16
               ,`AXI_BV_S16_BY_M16
             )
             U_ardcdr_m16(
                  .addr_i  (araddr_m16),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_rd_m16)
                 );

// External Write Address Decoders Instantiation

tb_dcdr
  #(`AXI_NSP1V_M16, `AXI_LOG2_NSP1V_M16, 1
               ,`AXI_NV_S1_BY_M16
               ,`AXI_NV_S2_BY_M16
               ,`AXI_NV_S3_BY_M16
               ,`AXI_NV_S4_BY_M16
               ,`AXI_NV_S5_BY_M16
               ,`AXI_NV_S6_BY_M16
               ,`AXI_NV_S7_BY_M16
               ,`AXI_NV_S8_BY_M16
               ,`AXI_NV_S9_BY_M16
               ,`AXI_NV_S10_BY_M16
               ,`AXI_NV_S11_BY_M16
               ,`AXI_NV_S12_BY_M16
               ,`AXI_NV_S13_BY_M16
               ,`AXI_NV_S14_BY_M16
               ,`AXI_NV_S15_BY_M16
               ,`AXI_NV_S16_BY_M16
               , 1
               ,`AXI_BV_S1_BY_M16
               ,`AXI_BV_S2_BY_M16
               ,`AXI_BV_S3_BY_M16
               ,`AXI_BV_S4_BY_M16
               ,`AXI_BV_S5_BY_M16
               ,`AXI_BV_S6_BY_M16
               ,`AXI_BV_S7_BY_M16
               ,`AXI_BV_S8_BY_M16
               ,`AXI_BV_S9_BY_M16
               ,`AXI_BV_S10_BY_M16
               ,`AXI_BV_S11_BY_M16
               ,`AXI_BV_S12_BY_M16
               ,`AXI_BV_S13_BY_M16
               ,`AXI_BV_S14_BY_M16
               ,`AXI_BV_S15_BY_M16
               ,`AXI_BV_S16_BY_M16
             )
       U_awdcdr_m16(
                  .addr_i  (awaddr_m16),
                `ifdef AXI_REMAP
                  .remap_n_i(remap_n),
                `endif

                  .local_slv_o(),
                  .sys_slv_o(xdcdr_slv_num_wr_m16)
                 );
`endif
`endif


   // 18/2/2008
   // Create bus of valid signals sized for AXI_NUM_SYS_MASTERS, with
   // non local master port indexes tied to 0.
   // Explained in more detail at the *valid connections in the monitor
   // instantiation.
   `ifdef AXI_BICMD_SUPPORT
     wire [(`AXI_MAX_SYS_MASTERS-`AXI_NUM_MASTERS)-1:0] zero_extend;
     assign zero_extend = 'b0;

     assign arvalid_m_sys = {zero_extend,arvalid_m};
     assign awvalid_m_sys = {zero_extend,awvalid_m};
     assign wvalid_m_sys =  {zero_extend,wvalid_m};
     assign bvalid_m_sys =  {zero_extend,bvalid_m};
     assign rvalid_m_sys =  {zero_extend,rvalid_m};
   `else
     assign arvalid_m_sys = arvalid_m;
     assign awvalid_m_sys = awvalid_m;
     assign wvalid_m_sys = wvalid_m;
     assign bvalid_m_sys = bvalid_m;
     assign rvalid_m_sys = rvalid_m;
   `endif


   // Instanstiates `AXI_NUM_MASTERS Master Models
   axi_master_vmt axi_master[`AXI_NUM_MASTERS:1](
                             .aclk (aclk),
                             .aresetn (aresetn),
                             .arvalid (arvalid_m_bus),
                             .araddr (araddr_m_bus),
                             .arlen (arlen_m_bus),
                             .arsize (arsize_m_bus),
                             .arburst (arburst_m_bus),
                             .arlock (arlock_m_bus),
                             .arcache (arcache_m_bus),
                             .arprot (arprot_m_bus),
                             .arid (arid_m_bus),
                             .arready (arready_m_bus),
                             .awvalid (awvalid_m_bus),
                             .awaddr (awaddr_m_bus),
                             .awlen (awlen_m_bus),
                             .awsize (awsize_m_bus),
                             .awlock (awlock_m_bus),
                             .awburst (awburst_m_bus),
                             .awcache (awcache_m_bus),
                             .awprot (awprot_m_bus),
                             .awid (awid_m_bus),
                             .awready (awready_m_bus),
                             .rvalid (rvalid_m_bus),
                             .rlast (rlast_m_bus),
                             .rdata (rdata_m_bus),
                             .rresp (rresp_m_bus),
                             .rid (rid_m_bus),
                             .rready (rready_m_bus),
                             .wvalid (wvalid_m_bus),
                             .wlast (wlast_m_bus),
                             .wdata (wdata_m_bus),
                             .wstrb (wstrb_m_bus),
                             .wid (wid_m_bus),
                             .wready (wready_m_bus),
                             .bvalid (bvalid_m_bus),
                             .bresp (bresp_m_bus),
                             .bid (bid_m_bus),
                             .bready (bready_m_bus),
                             .cactive (cactive_m_bus),
                             .csysreq (csysreq_m_bus),
                             .csysack (csysack_m_bus)
                             );

  //Instanstiates `AXI_NUM_SLAVES Slave Models
  axi_slave_vmt axi_slave [`AXI_NUM_SLAVES:1](
                            .aclk (aclk),
                            .aresetn (aresetn),
                            .awvalid (awvalid_s_bus),
                            .awaddr (awaddr_s_bus),
                            .awlen (awlen_s_bus),
                            .awsize (awsize_s_bus),
                            .awburst (awburst_s_bus),
                            .awlock (awlock_s_bus),
                            .awcache (awcache_s_bus),
                            .awprot (awprot_s_bus),
                            .awid (awid_s_bus),
                            .awready (awready_s_bus),
                            .arvalid (arvalid_s_bus),
                            .araddr (araddr_s_bus),
                            .arlen (arlen_s_bus),
                            .arsize (arsize_s_bus),
                            .arburst (arburst_s_bus),
                            .arlock (arlock_s_bus),
                            .arcache (arcache_s_bus),
                            .arprot (arprot_s_bus),
                            .arid (arid_s_bus),
                            .arready (arready_s_bus),
                            .rvalid (rvalid_s_bus),
                            .rlast (rlast_s_bus),
                            .rdata (rdata_s_bus),
                            .rresp (rresp_s_bus),
                            .rid (rid_s_bus),
                            .rready (rready_s_bus),
                            .wvalid (wvalid_s_bus),
                            .wlast (wlast_s_bus),
                            .wdata (wdata_s_bus),
                            .wstrb (wstrb_s_bus),
                            .wid (wid_s_bus),
                            .wready (wready_s_bus),
                            .bvalid (bvalid_s_bus),
                            .bresp (bresp_s_bus),
                            .bid (bid_s_bus),
                            .bready (bready_s_bus),
                            .csysreq (csysreq_s_bus),
                            .csysack (csysack_s_bus),
                            .cactive (cactive_s_bus),
                            .awvalid_alias0 (awvalid_alias0_s_bus),
                            .awvalid_alias1 (awvalid_alias1_s_bus),
                            .awvalid_alias2 (awvalid_alias2_s_bus),
                            .arvalid_alias0 (arvalid_alias0_s_bus),
                            .arvalid_alias1 (arvalid_alias1_s_bus),
                            .arvalid_alias2 (arvalid_alias2_s_bus),
                            .wvalid_alias0 (wvalid_alias0_s_bus),
                            .wvalid_alias1 (wvalid_alias1_s_bus),
                            .wvalid_alias2 (wvalid_alias2_s_bus),
                            .rvalid_alias0 (rvalid_alias0_s_bus),
                            .rvalid_alias1 (rvalid_alias1_s_bus),
                            .rvalid_alias2 (rvalid_alias2_s_bus),
                            .bvalid_alias0 (bvalid_alias0_s_bus),
                            .bvalid_alias1 (bvalid_alias1_s_bus),
                            .bvalid_alias2 (bvalid_alias2_s_bus)
                            );

  // jstokes, 26.10.10
  // Instantiate port monitors. For configurations with overlapping
  // addresses, the bus monitor is turned off.
  axi_port_monitor_vmt axi_port_mon [`AXI_NUM_SLAVES:1](
                            .aclk (aclk),
                            .aresetn (aresetn),
                            .awvalid (awvalid_s_bus),
                            .awaddr (awaddr_s_bus),
                            .awlen (awlen_s_bus),
                            .awsize (awsize_s_bus),
                            .awburst (awburst_s_bus),
                            .awlock (awlock_s_bus),
                            .awcache (awcache_s_bus),
                            .awprot (awprot_s_bus),
                            .awid (awid_s_bus),
                            .awready (awready_s_bus),
                            .arvalid (arvalid_s_bus),
                            .araddr (araddr_s_bus),
                            .arlen (arlen_s_bus),
                            .arsize (arsize_s_bus),
                            .arburst (arburst_s_bus),
                            .arlock (arlock_s_bus),
                            .arcache (arcache_s_bus),
                            .arprot (arprot_s_bus),
                            .arid (arid_s_bus),
                            .arready (arready_s_bus),
                            .rvalid (rvalid_s_bus),
                            .rlast (rlast_s_bus),
                            .rdata (rdata_s_bus),
                            .rresp (rresp_s_bus),
                            .rid (rid_s_bus),
                            .rready (rready_s_bus),
                            .wvalid (wvalid_s_bus),
                            .wlast (wlast_s_bus),
                            .wdata (wdata_s_bus),
                            .wstrb (wstrb_s_bus),
                            .wid (wid_s_bus),
                            .wready (wready_s_bus),
                            .bvalid (bvalid_s_bus),
                            .bresp (bresp_s_bus),
                            .bid (bid_s_bus),
                            .bready (bready_s_bus),
                            .csysreq (1'b1),
                            .csysack (1'b1),
                            .cactive (1'b1)
                            );

// Make optional sideband signals a function of either addr/data/resp signals
// Simplifies data integrity checker


assign aclk = system_clk;

reg pstate;
reg next_pstate;

always @(*) begin
   next_pstate = pstate;
   case (pstate)
      FullPower: begin
         low_power_mode = 0;
         if (!csysreq && !cactive && !csysack) begin
            next_pstate = LowPower;
         end
      end

      LowPower: begin
         low_power_mode = 1;
         if (csysreq | cactive) begin
            next_pstate = FullPower;
         end
      end
   endcase
end


always@(posedge aclk or negedge aresetn) begin
   if(~aresetn) begin
       pstate <= FullPower;
   end
   else begin
       pstate <= next_pstate;
   end
end

reg lp_clk_val;
always @(low_power_mode) begin
   lp_clk_val = {$random(seed)} % 2;
end

assign aclklp = (low_power_mode) ? lp_clk_val : system_clk;


//indicate MP write data and SP read data error when they are x
 always @( wvalid_m or wready_m or rvalid_s or rready_s
        `ifdef AXI_HAS_M1
          or wdata_m1
        `endif
        `ifdef AXI_HAS_M2
          or wdata_m2
        `endif
        `ifdef AXI_HAS_M3
          or wdata_m3
        `endif
        `ifdef AXI_HAS_M4
          or wdata_m4
        `endif
        `ifdef AXI_HAS_M5
          or wdata_m5
        `endif
        `ifdef AXI_HAS_M6
          or wdata_m6
        `endif
        `ifdef AXI_HAS_M7
          or wdata_m7
        `endif
        `ifdef AXI_HAS_M8
          or wdata_m8
        `endif
        `ifdef AXI_HAS_M9
          or wdata_m9
        `endif
        `ifdef AXI_HAS_M10
          or wdata_m10
        `endif
        `ifdef AXI_HAS_M11
          or wdata_m11
        `endif
        `ifdef AXI_HAS_M12
          or wdata_m12
        `endif
        `ifdef AXI_HAS_M13
          or wdata_m13
        `endif
        `ifdef AXI_HAS_M14
          or wdata_m14
        `endif
        `ifdef AXI_HAS_M15
          or wdata_m15
        `endif
        `ifdef AXI_HAS_M16
          or wdata_m16
        `endif
        `ifdef AXI_HAS_M17
          or wdata_m17
        `endif
        `ifdef AXI_HAS_M18
          or wdata_m18
        `endif
        `ifdef AXI_HAS_M19
          or wdata_m19
        `endif
        `ifdef AXI_HAS_M20
          or wdata_m20
        `endif
        `ifdef AXI_HAS_M21
          or wdata_m21
        `endif
        `ifdef AXI_HAS_M22
          or wdata_m22
        `endif
        `ifdef AXI_HAS_M23
          or wdata_m23
        `endif
        `ifdef AXI_HAS_M24
          or wdata_m24
        `endif
        `ifdef AXI_HAS_M25
          or wdata_m25
        `endif
        `ifdef AXI_HAS_M26
          or wdata_m26
        `endif
        `ifdef AXI_HAS_M27
          or wdata_m27
        `endif
        `ifdef AXI_HAS_M28
          or wdata_m28
        `endif
        `ifdef AXI_HAS_M29
          or wdata_m29
        `endif
        `ifdef AXI_HAS_M30
          or wdata_m30
        `endif
        `ifdef AXI_HAS_M31
          or wdata_m31
        `endif
        `ifdef AXI_HAS_M32
          or wdata_m32
        `endif
        `ifdef AXI_HAS_S0
          or rdata_s0
        `endif
        `ifdef AXI_HAS_S1
          or rdata_s1
        `endif
        `ifdef AXI_HAS_S2
          or rdata_s2
        `endif
        `ifdef AXI_HAS_S3
          or rdata_s3
        `endif
        `ifdef AXI_HAS_S4
          or rdata_s4
        `endif
        `ifdef AXI_HAS_S5
          or rdata_s5
        `endif
        `ifdef AXI_HAS_S6
          or rdata_s6
        `endif
        `ifdef AXI_HAS_S7
          or rdata_s7
        `endif
        `ifdef AXI_HAS_S8
          or rdata_s8
        `endif
        `ifdef AXI_HAS_S9
          or rdata_s9
        `endif
        `ifdef AXI_HAS_S10
          or rdata_s10
        `endif
        `ifdef AXI_HAS_S11
          or rdata_s11
        `endif
        `ifdef AXI_HAS_S12
          or rdata_s12
        `endif
        `ifdef AXI_HAS_S13
          or rdata_s13
        `endif
        `ifdef AXI_HAS_S14
          or rdata_s14
        `endif
        `ifdef AXI_HAS_S15
          or rdata_s15
        `endif
        `ifdef AXI_HAS_S16
          or rdata_s16
        `endif
        `ifdef AXI_HAS_S17
          or rdata_s17
        `endif
        `ifdef AXI_HAS_S18
          or rdata_s18
        `endif
        `ifdef AXI_HAS_S19
          or rdata_s19
        `endif
        `ifdef AXI_HAS_S20
          or rdata_s20
        `endif
        `ifdef AXI_HAS_S21
          or rdata_s21
        `endif
        `ifdef AXI_HAS_S22
          or rdata_s22
        `endif
        `ifdef AXI_HAS_S23
          or rdata_s23
        `endif
        `ifdef AXI_HAS_S24
          or rdata_s24
        `endif
        `ifdef AXI_HAS_S25
          or rdata_s25
        `endif
        `ifdef AXI_HAS_S26
          or rdata_s26
        `endif
        `ifdef AXI_HAS_S27
          or rdata_s27
        `endif
        `ifdef AXI_HAS_S28
          or rdata_s28
        `endif
        `ifdef AXI_HAS_S29
          or rdata_s29
        `endif
        `ifdef AXI_HAS_S30
          or rdata_s30
        `endif
        `ifdef AXI_HAS_S31
          or rdata_s31
        `endif
         ) begin
    //write data check
    `ifdef AXI_HAS_M1
      axi_mon_check_x_data( 1, wvalid_m[1], wready_m[1], ^wdata_m1 );
    `endif
    `ifdef AXI_HAS_M2
      axi_mon_check_x_data( 2, wvalid_m[2], wready_m[2], ^wdata_m2 );
    `endif
    `ifdef AXI_HAS_M3
      axi_mon_check_x_data( 3, wvalid_m[3], wready_m[3], ^wdata_m3 );
    `endif
    `ifdef AXI_HAS_M4
      axi_mon_check_x_data( 4, wvalid_m[4], wready_m[4], ^wdata_m4 );
    `endif
    `ifdef AXI_HAS_M5
      axi_mon_check_x_data( 5, wvalid_m[5], wready_m[5], ^wdata_m5 );
    `endif
    `ifdef AXI_HAS_M6
      axi_mon_check_x_data( 6, wvalid_m[6], wready_m[6], ^wdata_m6 );
    `endif
    `ifdef AXI_HAS_M7
      axi_mon_check_x_data( 7, wvalid_m[7], wready_m[7], ^wdata_m7 );
    `endif
    `ifdef AXI_HAS_M8
      axi_mon_check_x_data( 8, wvalid_m[8], wready_m[8], ^wdata_m8 );
    `endif
    `ifdef AXI_HAS_M9
      axi_mon_check_x_data( 9, wvalid_m[9], wready_m[9], ^wdata_m9 );
    `endif
    `ifdef AXI_HAS_M10
      axi_mon_check_x_data( 10, wvalid_m[10], wready_m[10], ^wdata_m10 );
    `endif
    `ifdef AXI_HAS_M11
      axi_mon_check_x_data( 11, wvalid_m[11], wready_m[11], ^wdata_m11 );
    `endif
    `ifdef AXI_HAS_M12
      axi_mon_check_x_data( 12, wvalid_m[12], wready_m[12], ^wdata_m12 );
    `endif
    `ifdef AXI_HAS_M13
      axi_mon_check_x_data( 13, wvalid_m[13], wready_m[13], ^wdata_m13 );
    `endif
    `ifdef AXI_HAS_M14
      axi_mon_check_x_data( 14, wvalid_m[14], wready_m[14], ^wdata_m14 );
    `endif
    `ifdef AXI_HAS_M15
      axi_mon_check_x_data( 15, wvalid_m[15], wready_m[15], ^wdata_m15 );
    `endif
    `ifdef AXI_HAS_M16
      axi_mon_check_x_data( 16, wvalid_m[16], wready_m[16], ^wdata_m16 );
    `endif
    `ifdef AXI_HAS_M17
      axi_mon_check_x_data( 17, wvalid_m[17], wready_m[17], ^wdata_m17 );
    `endif
    `ifdef AXI_HAS_M18
      axi_mon_check_x_data( 18, wvalid_m[18], wready_m[18], ^wdata_m18 );
    `endif
    `ifdef AXI_HAS_M19
      axi_mon_check_x_data( 19, wvalid_m[19], wready_m[19], ^wdata_m19 );
    `endif
    `ifdef AXI_HAS_M20
      axi_mon_check_x_data( 20, wvalid_m[20], wready_m[20], ^wdata_m20 );
    `endif
    `ifdef AXI_HAS_M21
      axi_mon_check_x_data( 21, wvalid_m[21], wready_m[21], ^wdata_m21 );
    `endif
    `ifdef AXI_HAS_M22
      axi_mon_check_x_data( 22, wvalid_m[22], wready_m[22], ^wdata_m22 );
    `endif
    `ifdef AXI_HAS_M23
      axi_mon_check_x_data( 23, wvalid_m[23], wready_m[23], ^wdata_m23 );
    `endif
    `ifdef AXI_HAS_M24
      axi_mon_check_x_data( 24, wvalid_m[24], wready_m[24], ^wdata_m24 );
    `endif
    `ifdef AXI_HAS_M25
      axi_mon_check_x_data( 25, wvalid_m[25], wready_m[25], ^wdata_m25 );
    `endif
    `ifdef AXI_HAS_M26
      axi_mon_check_x_data( 26, wvalid_m[26], wready_m[26], ^wdata_m26 );
    `endif
    `ifdef AXI_HAS_M27
      axi_mon_check_x_data( 27, wvalid_m[27], wready_m[27], ^wdata_m27 );
    `endif
    `ifdef AXI_HAS_M28
      axi_mon_check_x_data( 28, wvalid_m[28], wready_m[28], ^wdata_m28 );
    `endif
    `ifdef AXI_HAS_M29
      axi_mon_check_x_data( 29, wvalid_m[29], wready_m[29], ^wdata_m29 );
    `endif
    `ifdef AXI_HAS_M30
      axi_mon_check_x_data( 30, wvalid_m[30], wready_m[30], ^wdata_m30 );
    `endif
    `ifdef AXI_HAS_M31
      axi_mon_check_x_data( 31, wvalid_m[31], wready_m[31], ^wdata_m31 );
    `endif
    `ifdef AXI_HAS_M32
      axi_mon_check_x_data( 32, wvalid_m[32], wready_m[32], ^wdata_m32 );
    `endif

    //read data check
    `ifdef AXI_HAS_S0
      axi_mon_check_x_data( 0, rvalid_s[0], rready_s[0], ^rdata_s0 );
    `endif
    `ifdef AXI_HAS_S1
      axi_mon_check_x_data( 1, rvalid_s[1], rready_s[1], ^rdata_s1 );
    `endif
    `ifdef AXI_HAS_S2
      axi_mon_check_x_data( 2, rvalid_s[2], rready_s[2], ^rdata_s2 );
    `endif
    `ifdef AXI_HAS_S3
      axi_mon_check_x_data( 3, rvalid_s[3], rready_s[3], ^rdata_s3 );
    `endif
    `ifdef AXI_HAS_S4
      axi_mon_check_x_data( 4, rvalid_s[4], rready_s[4], ^rdata_s4 );
    `endif
    `ifdef AXI_HAS_S5
      axi_mon_check_x_data( 5, rvalid_s[5], rready_s[5], ^rdata_s5 );
    `endif
    `ifdef AXI_HAS_S6
      axi_mon_check_x_data( 6, rvalid_s[6], rready_s[6], ^rdata_s6 );
    `endif
    `ifdef AXI_HAS_S7
      axi_mon_check_x_data( 7, rvalid_s[7], rready_s[7], ^rdata_s7 );
    `endif
    `ifdef AXI_HAS_S8
      axi_mon_check_x_data( 8, rvalid_s[8], rready_s[8], ^rdata_s8 );
    `endif
    `ifdef AXI_HAS_S9
      axi_mon_check_x_data( 9, rvalid_s[9], rready_s[9], ^rdata_s9 );
    `endif
    `ifdef AXI_HAS_S10
      axi_mon_check_x_data( 10, rvalid_s[10], rready_s[10], ^rdata_s10 );
    `endif
    `ifdef AXI_HAS_S11
      axi_mon_check_x_data( 11, rvalid_s[11], rready_s[11], ^rdata_s11 );
    `endif
    `ifdef AXI_HAS_S12
      axi_mon_check_x_data( 12, rvalid_s[12], rready_s[12], ^rdata_s12 );
    `endif
    `ifdef AXI_HAS_S13
      axi_mon_check_x_data( 13, rvalid_s[13], rready_s[13], ^rdata_s13 );
    `endif
    `ifdef AXI_HAS_S14
      axi_mon_check_x_data( 14, rvalid_s[14], rready_s[14], ^rdata_s14 );
    `endif
    `ifdef AXI_HAS_S15
      axi_mon_check_x_data( 15, rvalid_s[15], rready_s[15], ^rdata_s15 );
    `endif
    `ifdef AXI_HAS_S16
      axi_mon_check_x_data( 16, rvalid_s[16], rready_s[16], ^rdata_s16 );
    `endif
    `ifdef AXI_HAS_S17
      axi_mon_check_x_data( 17, rvalid_s[17], rready_s[17], ^rdata_s17 );
    `endif
    `ifdef AXI_HAS_S18
      axi_mon_check_x_data( 18, rvalid_s[18], rready_s[18], ^rdata_s18 );
    `endif
    `ifdef AXI_HAS_S19
      axi_mon_check_x_data( 19, rvalid_s[19], rready_s[19], ^rdata_s19 );
    `endif
    `ifdef AXI_HAS_S20
      axi_mon_check_x_data( 20, rvalid_s[20], rready_s[20], ^rdata_s20 );
    `endif
    `ifdef AXI_HAS_S21
      axi_mon_check_x_data( 21, rvalid_s[21], rready_s[21], ^rdata_s21 );
    `endif
    `ifdef AXI_HAS_S22
      axi_mon_check_x_data( 22, rvalid_s[22], rready_s[22], ^rdata_s22 );
    `endif
    `ifdef AXI_HAS_S23
      axi_mon_check_x_data( 23, rvalid_s[23], rready_s[23], ^rdata_s23 );
    `endif
    `ifdef AXI_HAS_S24
      axi_mon_check_x_data( 24, rvalid_s[24], rready_s[24], ^rdata_s24 );
    `endif
    `ifdef AXI_HAS_S25
      axi_mon_check_x_data( 25, rvalid_s[25], rready_s[25], ^rdata_s25 );
    `endif
    `ifdef AXI_HAS_S26
      axi_mon_check_x_data( 26, rvalid_s[26], rready_s[26], ^rdata_s26 );
    `endif
    `ifdef AXI_HAS_S27
      axi_mon_check_x_data( 27, rvalid_s[27], rready_s[27], ^rdata_s27 );
    `endif
    `ifdef AXI_HAS_S28
      axi_mon_check_x_data( 28, rvalid_s[28], rready_s[28], ^rdata_s28 );
    `endif
    `ifdef AXI_HAS_S29
      axi_mon_check_x_data( 29, rvalid_s[29], rready_s[29], ^rdata_s29 );
    `endif
    `ifdef AXI_HAS_S30
      axi_mon_check_x_data( 30, rvalid_s[30], rready_s[30], ^rdata_s30 );
    `endif
    `ifdef AXI_HAS_S31
      axi_mon_check_x_data( 31, rvalid_s[31], rready_s[31], ^rdata_s31 );
    `endif
 end

 // Initialise multi tile write deadlock avoidance variables.
 initial begin : dlock_mask_check_var_init_PROC
   integer mst;
   integer slv;
   for(mst=0;mst<=`AXI_NUM_MASTERS;mst=mst+1) begin
     tb_bus_mst_w_nlcl_pend_cnt[mst] = 'b0;
     tb_bus_mst_w_nlcl_pend_slv[mst] = 'b0;
   end
   for(mst=0;mst<=`AXI_NUM_MASTERS;mst=mst+1) begin
     tb_mst_wlast_b4_awr[mst] = 1'b0;
   end
   tb_lock_arb_test_on = 0;
 end



// ----------------------------------------
// sdf simulations
// ----------------------------------------
`ifdef SDF_FILE
  initial
    begin
      $display("About to sdf-annotate the design from %s",`SDF_FILE);
      $sdf_annotate(`SDF_FILE, U_DW_axi, , , `SDF_LEVEL);
    end
 `endif

// dump control
`ifdef DUMP_DEPTH
 initial begin
  `ifdef VCS
   $vcdpluson(`DUMP_DEPTH, test_DW_axi);
  `else
    `ifdef DUMP_FILE
    `else
      `define DUMP_FILE "test.vpd"
    `endif
   $dumpfile(`DUMP_FILE);
   //$dumpvars(`DUMP_DEPTH, test_DW_axi.U_DW_axi);
   $dumpvars(`DUMP_DEPTH, test_DW_axi);
  `endif
 end
`endif

  initial begin
    system_clk = 0;
    forever begin
      #(simulation_cycle/2)
      system_clk = !system_clk;
    end
  end

  /*
  initial begin : clock_count_PROC
    clk_count = 0;
    forever begin
      @(posedge aclk);
      clk_count = clk_count + 1;
      $display("DEBUG, clk_count %0d", clk_count);
    end
  end
  */


// Simulation Timeout
  initial begin
     repeat(2000000) @(posedge aclk);
     $display("-------------------------------");
     $display("Error: VTE Simulation Timed Out");
     $display("-------------------------------");
     $finish;
  end

// Initial Reset Signal Generation
 initial begin
   aresetn = 1'b1;
   #(simulation_cycle * 2)
   aresetn = 1'b0;
   #(simulation_cycle * 3)
   aresetn = 1'b1;
 end

// Set multi cycle arbitration check variable defaults.
 initial begin
   chk_mca_done = 0;
   chk_mca_failed = 0;
 end

// Initial csysreq generation
 initial begin
   csysreq  = 1;
 end


///////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////

 initial begin
     test_failed = 0;

     // Shared layer priorities.
     `ifdef AXI_EXT_PRIORITY
     `ifdef AXI_SHARED_LAYER_SLAVE_PRIORITY_EN
      slv_priority_shared = {$random(seed)};
     `endif
     `ifdef AXI_SHARED_LAYER_MASTER_PRIORITY_EN
      mst_priority_shared = {$random(seed)};
     `endif
     `endif

     for(master_num = 1; master_num <= `AXI_NUM_MASTERS; master_num = master_num + 1) begin
             mst_wr_pend_ptr[master_num] = 'd0;
             mst_rd_pend_ptr[master_num] = 'd0;
             mst_wr_xact_cnt[master_num] = 'd0;
             mst_rd_xact_cnt[master_num] = 'd0;
             mst_wr_pend_cnt[master_num] = 'd0;
             mst_rd_pend_cnt[master_num] = 'd0;
             mst_wr_pend_buff[master_num] = 'd0;
             mst_rd_pend_buff[master_num] = 'd0;
             mst_bresp_ptr[master_num] = 'd1;

             for(xact_cnt = 0; xact_cnt <= 32; xact_cnt = xact_cnt + 1) begin
               mst_aid_tracker[master_num][0][xact_cnt] = 'd0;
               mst_aid_tracker[master_num][1][xact_cnt] = 'd0;
               mst_aid_tracker_cnt[master_num][0][xact_cnt] = 'd0;
               mst_aid_tracker_cnt[master_num][1][xact_cnt] = 'd0;
             end

             `ifdef AXI_EXT_PRIORITY
                set_master_priority[master_num] = {$random(seed)};
             `endif
     end

     for(slave_num = 0; slave_num <= `AXI_NUM_SLAVES; slave_num = slave_num + 1) begin
             slv_ar_queue_cnt[slave_num] = 'd1;
             slv_aw_queue_cnt[slave_num] = 'd1;
             slv_wr_xact_cnt[slave_num] = 'd0;
             slv_rd_xact_cnt[slave_num] = 'd0;

             `ifdef AXI_EXT_PRIORITY
                set_slave_priority[slave_num] = {$random(seed)};
             `endif
     end

     seed = `AXI_SEED;


     // DEBUG MODE (Default OFF)
     // Turns on/off debug mode - Increased message verbosity and VIP monitor log file generation
     // DEBUG
     // DEBUG
     test_debug = 0;
     //test_debug = 1;

     // Used to determine the max timeout limit and the max number of xacts to preload Masters with
     // in random system test
     max_xact1 = 50;
     max_xact2 = 130;

     sim_in_progress = 1;

     $display("----------------------");
     $display("VTE Environment Loaded");
     $display("----------------------");

     remap_n = 1;
     `ifdef AXI_REMAP
        remap_n = {$random(seed)} % 2;
     `endif

     @(posedge aclk);
     @(posedge aclk);
     @(posedge aclk);

     $display("-----------------");
     $display("VTE Configuration");
     $display("-----------------");

     for(master_num = 1; master_num <= `AXI_NUM_MASTERS; master_num = master_num + 1) begin
       axi_mst_configure(master_num);
     end
     $display("\tTestbench : All Masters - Configured for DUT\n");

     for(slave_num = 1; slave_num <= `AXI_NUM_SLAVES; slave_num = slave_num + 1) begin
       axi_slv_configure(slave_num);
     end

     $display("\tTestbench : All Slaves - Configured for DUT\n");

     axi_mon_start;
     axi_mst_all_start;
     axi_slv_all_start;

     for(slave_num = 1; slave_num <= `AXI_NUM_SLAVES; slave_num = slave_num + 1) begin
       for(region_count = 0; region_count < slv_num_regions[slave_num]; region_count = region_count + 1) begin
          axi_slv_region_resp(slave_num, region_count, `SIM_SLVERR_RND, {$random(seed)} % 5, {$random(seed)} % 5, {$random(seed)} % 5, {$random(seed)} % 5, {$random(seed)} % 5,   slv_buffer_0[region_count]);
       end
     end

     $display("\tTestbench : All Slaves - Region responses configured");


     $display("--------------");
     $display("VTE Simulation");
     $display("--------------");

     axi_check_nonvisible(1);
     axi_check_write_sidebands(1);
     axi_check_read_sidebands(1);

     fork
       // Can't use the monitor if legal address overlapping exists.
      `ifdef AXI_HAS_LEGAL_ADDR_OVRLP
      `else
      begin
       axi_mon_xact;
      end
      `endif

      // jstokes, 26.10.10, port monitors added for configurations with
      // legally overlapping addresses.
      // Start port monitors.
      begin
        axi_port_mon_start;
      end

      begin
       `ifdef AXI_TZ_SUPPORT
         tz_secure_s = {$random(seed)} % {(`AXI_NUM_SLAVES + 1){1'b1}};
         tz_secure_s[0] = 0;
       `endif

       test_one_write(1);
       test_exclusive;
       test_decode(0);
       test_decode(1);
       test_decode(2);

       // DEBUG
       // Investigate TB errors with this code.
       // ? Need to load memory map in Monitor every time remap is changed
       // ?
       /*
       `ifdef AXI_REMAP
           // Re run decode tests with remap bit flipped.
          remap_n = ~remap_n;
          test_decode(0);
          test_decode(1);
          test_decode(2);
           // Randomise again for rest of sim.
          remap_n = {$random(seed)} % 2;
       `endif
       */

       test_mst_rw_id(0);
       test_mst_rw_id(1);
       test_sys_rw(max_xact2);

       `ifdef AXI_HAS_LOWPWR_HS_IF
       fork
          begin: test_sys_rw_PROC
						 // jstokes, 5.11.10, reducing number of transactions for 
						 // configurations with more masters and slaves.
						 lp_if_tst_num_tx = 20 - (`AXI_NUM_MASTERS/2);

             for(i=0;i<20;i=i+1) begin
               num_trans = ({$random(seed)} % lp_if_tst_num_tx)+1;
               test_sys_rw(num_trans);
               idle_time = {$random(seed)} % 500;
               repeat (idle_time) @(posedge aclk);
             end

             disable low_power_PROC;

          end
          begin: low_power_PROC
             while (1) begin
                repeat ({$random(seed)} % 1000) @(posedge aclk);
                   #(1) csysreq = 0;

                repeat ({$random(seed)} % 100) @(posedge aclk);
                   #(1) csysreq = 1;
             end
          end
       join
       `endif

       test_tarb_disable(max_xact1);
       test_lock_arb;
       test_mca_fcfs_arb;
       if (`AXI_HAS_LEGAL_ADDR_OVRLP_VAL == 1) test_ovrlp_slv_addr;
       test_lock_crm_9000403280;
       test_fae_arb_lock_deadlock_crm_9000423090;

       /*
        * Corner case testbench bug found during regressions for 2007.02a release
        * Disabling arbitration tests for 2007.02a release
        * test_arb_addr(0);
        * test_arb_addr(1);
        * test_arb_rd_data;
        * test_arb_wr_data;
        */

       /* These tests are a duplication of test_mst_rw_id(*) and were
        * commented out by the original TB writer.
        * test_mst_id(0);
        * test_mst_id(1);
        * test_mst_id(2);
        * test_mst_id(3);
        */

       sim_in_progress = 0;
       repeat (10) @(posedge aclk);

       if (chk_mca_done & ~chk_mca_failed) begin
         $display("\nMulti Cycle Arbitration Check - PASSED.\n");
       end

       // Tell tb_check_shared modules to report any dedicated master slave
       // paths that have not had parallel access during the sim.
       check_shared_report_parallel = 1;
       @(posedge aclk);
       check_shared_report_parallel = 0;


       $display("-------------------------");
       $display("VTE Simulation Completed");
       $display("-------------------------");
       $display("User test stimulus has completed");

       $finish;
      end
    join

 end

 `include "../testbench/tb_axi_assignment.v"
 `include "../testbench/tb_axi_vmt_wrap.v"
 `include "../testbench/tb_axi_tasks_mst.v"
 `include "../testbench/tb_axi_tasks_slv.v"
 `include "../testbench/tb_axi_tasks_mon.v"
 `include "../testbench/tb_axi_tests.v"
 `include "../testbench/tb_axi_mon_xact.v"
 `include "../testbench/tb_axi_check_id.v"
 `include "../testbench/tb_axi_check_df.v"










 `ifdef AXI_HAS_LOWPWR_HS_IF
    tb_check_lp #(
       `AXI_NUM_MASTERS,
       `AXI_LOWPWR_NOPX_CNT,
       1,
       AR_HAS_BUFF,
       AW_HAS_BUFF,
       W_HAS_BUFF
    )
    U_check_lp (
     .clk            (aclk),
     .clklp          (aclklp),
     .resetn         (aresetn),
     .cvrgen         (~sim_in_progress),

     .awvalid_m_bus  (int_awvalid_m_bus),
     .awready_m_bus  (int_awready_m_bus),
     .arvalid_m_bus  (int_arvalid_m_bus),
     .arready_m_bus  (int_arready_m_bus),
     .wready_m_bus   (int_wready_m_bus),
     .bvalid_m_bus   (int_bvalid_m_bus),
     .bready_m_bus   (int_bready_m_bus),
     .rvalid_m_bus   (int_rvalid_m_bus),
     .rready_m_bus   (int_rready_m_bus),
     .rlast_m_bus    (int_rlast_m_bus),

     .csysreq        (int_csysreq),
     .csysack        (int_csysack),
     .cactive        (int_cactive)
    );
 `endif


 /* --------------------------------------------------------------------
  * HYBRID ARCHITECTURE CHECKERS
  */

 `ifdef AXI_BICMD_SUPPORT
  // Hybrid architecture checks not run if BICMD is enabled. This is
  // is due to the additional difficulty in using the t/x ID field to
  // figure out which source the t/x came from. The BIDI feature
  // has no effect on the hybrid architecture.
 `else


 // Don't run if there is only 1 master, no possibily of parallel valid
 // signals, so no chance of failure.
 `ifdef AXI_NUM_MASTERS_1
 `else

 `ifdef AXI_AW_SHARED_LAYER
 // AW channel.
 tb_check_shared
 #(`AXI_NUM_MASTERS, // Number of channel sources.
   `AXI_NSP1,        // Number of channel sinks.
   `AXI_AW_SHARED_LAYER_NS, // Number of shared sinks.
   `AXI_LOG2_NM,     // Id width at sink.
   0,                // Encoded channel number.
   0                 // Debug, 0 off, 1 on.
  )
 U_AW_check_shared (
   .clk             (aclk),
   .resetn          (aresetn),
   .report_parallel (check_shared_report_parallel),

   .valid_0       (awvalid_s[0]),
   .idmst_snk_0   (awid_s0[`AXI_SIDW-1:`AXI_MIDW]),

   `ifdef AXI_HAS_S1
     .valid_1       (awvalid_s[1]),
     .idmst_snk_1   (awid_s1[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_1       (1'b0),
     .idmst_snk_1   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S2
     .valid_2       (awvalid_s[2]),
     .idmst_snk_2   (awid_s2[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_2       (1'b0),
     .idmst_snk_2   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S3
     .valid_3       (awvalid_s[3]),
     .idmst_snk_3   (awid_s3[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_3       (1'b0),
     .idmst_snk_3   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S4
     .valid_4       (awvalid_s[4]),
     .idmst_snk_4   (awid_s4[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_4       (1'b0),
     .idmst_snk_4   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S5
     .valid_5       (awvalid_s[5]),
     .idmst_snk_5   (awid_s5[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_5       (1'b0),
     .idmst_snk_5   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S6
     .valid_6       (awvalid_s[6]),
     .idmst_snk_6   (awid_s6[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_6       (1'b0),
     .idmst_snk_6   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S7
     .valid_7       (awvalid_s[7]),
     .idmst_snk_7   (awid_s7[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_7       (1'b0),
     .idmst_snk_7   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S8
     .valid_8       (awvalid_s[8]),
     .idmst_snk_8   (awid_s8[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_8       (1'b0),
     .idmst_snk_8   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S9
     .valid_9       (awvalid_s[9]),
     .idmst_snk_9   (awid_s9[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_9       (1'b0),
     .idmst_snk_9   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S10
     .valid_10      (awvalid_s[10]),
     .idmst_snk_10  (awid_s10[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_10      (1'b0),
     .idmst_snk_10  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S11
     .valid_11      (awvalid_s[11]),
     .idmst_snk_11  (awid_s11[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_11      (1'b0),
     .idmst_snk_11  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S12
     .valid_12      (awvalid_s[12]),
     .idmst_snk_12  (awid_s12[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_12      (1'b0),
     .idmst_snk_12  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S13
     .valid_13      (awvalid_s[13]),
     .idmst_snk_13  (awid_s13[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_13      (1'b0),
     .idmst_snk_13  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S14
     .valid_14      (awvalid_s[14]),
     .idmst_snk_14  (awid_s14[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_14      (1'b0),
     .idmst_snk_14  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S15
     .valid_15      (awvalid_s[15]),
     .idmst_snk_15  (awid_s15[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_15      (1'b0),
     .idmst_snk_15  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S16
     .valid_16      (awvalid_s[16]),
     .idmst_snk_16  (awid_s16[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_16      (1'b0),
     .idmst_snk_16  ({`AXI_MIDW{1'b0}}),
   `endif

   .dummy_input     (1'b0)
 );
 `endif

 `ifdef AXI_AR_SHARED_LAYER
 // AR channel.
 tb_check_shared
 #(`AXI_NUM_MASTERS, // Number of channel sources.
   `AXI_NSP1,        // Number of channel sinks.
   `AXI_AR_SHARED_LAYER_NS, // Number of shared sinks.
   `AXI_LOG2_NM,     // Id width at sink.
   3,                // Encoded channel number.
   0                 // Debug, 0 off, 1 on.
  )
 U_AR_check_shared (
   .clk             (aclk),
   .resetn          (aresetn),
   .report_parallel (check_shared_report_parallel),

   .valid_0       (arvalid_s[0]),
   .idmst_snk_0   (arid_s0[`AXI_SIDW-1:`AXI_MIDW]),

   `ifdef AXI_HAS_S1
     .valid_1       (arvalid_s[1]),
     .idmst_snk_1   (arid_s1[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_1       (1'b0),
     .idmst_snk_1   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S2
     .valid_2       (arvalid_s[2]),
     .idmst_snk_2   (arid_s2[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_2       (1'b0),
     .idmst_snk_2   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S3
     .valid_3       (arvalid_s[3]),
     .idmst_snk_3   (arid_s3[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_3       (1'b0),
     .idmst_snk_3   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S4
     .valid_4       (arvalid_s[4]),
     .idmst_snk_4   (arid_s4[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_4       (1'b0),
     .idmst_snk_4   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S5
     .valid_5       (arvalid_s[5]),
     .idmst_snk_5   (arid_s5[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_5       (1'b0),
     .idmst_snk_5   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S6
     .valid_6       (arvalid_s[6]),
     .idmst_snk_6   (arid_s6[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_6       (1'b0),
     .idmst_snk_6   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S7
     .valid_7       (arvalid_s[7]),
     .idmst_snk_7   (arid_s7[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_7       (1'b0),
     .idmst_snk_7   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S8
     .valid_8       (arvalid_s[8]),
     .idmst_snk_8   (arid_s8[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_8       (1'b0),
     .idmst_snk_8   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S9
     .valid_9       (arvalid_s[9]),
     .idmst_snk_9   (arid_s9[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_9       (1'b0),
     .idmst_snk_9   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S10
     .valid_10      (arvalid_s[10]),
     .idmst_snk_10  (arid_s10[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_10      (1'b0),
     .idmst_snk_10  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S11
     .valid_11      (arvalid_s[11]),
     .idmst_snk_11  (arid_s11[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_11      (1'b0),
     .idmst_snk_11  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S12
     .valid_12      (arvalid_s[12]),
     .idmst_snk_12  (arid_s12[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_12      (1'b0),
     .idmst_snk_12  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S13
     .valid_13      (arvalid_s[13]),
     .idmst_snk_13  (arid_s13[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_13      (1'b0),
     .idmst_snk_13  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S14
     .valid_14      (arvalid_s[14]),
     .idmst_snk_14  (arid_s14[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_14      (1'b0),
     .idmst_snk_14  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S15
     .valid_15      (arvalid_s[15]),
     .idmst_snk_15  (arid_s15[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_15      (1'b0),
     .idmst_snk_15  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S16
     .valid_16      (arvalid_s[16]),
     .idmst_snk_16  (arid_s16[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_16      (1'b0),
     .idmst_snk_16  ({`AXI_MIDW{1'b0}}),
   `endif

   .dummy_input     (1'b0)
 );
 `endif


 `ifdef AXI_W_SHARED_LAYER
 // W channel.
 tb_check_shared
 #(`AXI_NUM_MASTERS, // Number of channel sources.
   `AXI_NSP1,        // Number of channel sinks.
   `AXI_W_SHARED_LAYER_NS, // Number of shared sinks.
   `AXI_LOG2_NM,     // Id width at sink.
   1,                // Encoded channel number.
   0                 // Debug, 0 off, 1 on.
  )
 U_W_check_shared (
   .clk             (aclk),
   .resetn          (aresetn),
   .report_parallel (check_shared_report_parallel),

   .valid_0       (wvalid_s[0]),
   .idmst_snk_0   (wid_s0[`AXI_SIDW-1:`AXI_MIDW]),

   `ifdef AXI_HAS_S1
     .valid_1       (wvalid_s[1]),
     .idmst_snk_1   (wid_s1[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_1       (1'b0),
     .idmst_snk_1   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S2
     .valid_2       (wvalid_s[2]),
     .idmst_snk_2   (wid_s2[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_2       (1'b0),
     .idmst_snk_2   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S3
     .valid_3       (wvalid_s[3]),
     .idmst_snk_3   (wid_s3[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_3       (1'b0),
     .idmst_snk_3   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S4
     .valid_4       (wvalid_s[4]),
     .idmst_snk_4   (wid_s4[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_4       (1'b0),
     .idmst_snk_4   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S5
     .valid_5       (wvalid_s[5]),
     .idmst_snk_5   (wid_s5[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_5       (1'b0),
     .idmst_snk_5   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S6
     .valid_6       (wvalid_s[6]),
     .idmst_snk_6   (wid_s6[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_6       (1'b0),
     .idmst_snk_6   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S7
     .valid_7       (wvalid_s[7]),
     .idmst_snk_7   (wid_s7[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_7       (1'b0),
     .idmst_snk_7   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S8
     .valid_8       (wvalid_s[8]),
     .idmst_snk_8   (wid_s8[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_8       (1'b0),
     .idmst_snk_8   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S9
     .valid_9       (wvalid_s[9]),
     .idmst_snk_9   (wid_s9[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_9       (1'b0),
     .idmst_snk_9   ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S10
     .valid_10      (wvalid_s[10]),
     .idmst_snk_10  (wid_s10[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_10      (1'b0),
     .idmst_snk_10  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S11
     .valid_11      (wvalid_s[11]),
     .idmst_snk_11  (wid_s11[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_11      (1'b0),
     .idmst_snk_11  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S12
     .valid_12      (wvalid_s[12]),
     .idmst_snk_12  (wid_s12[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_12      (1'b0),
     .idmst_snk_12  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S13
     .valid_13      (wvalid_s[13]),
     .idmst_snk_13  (wid_s13[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_13      (1'b0),
     .idmst_snk_13  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S14
     .valid_14      (wvalid_s[14]),
     .idmst_snk_14  (wid_s14[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_14      (1'b0),
     .idmst_snk_14  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S15
     .valid_15      (wvalid_s[15]),
     .idmst_snk_15  (wid_s15[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_15      (1'b0),
     .idmst_snk_15  ({`AXI_MIDW{1'b0}}),
   `endif

   `ifdef AXI_HAS_S16
     .valid_16      (wvalid_s[16]),
     .idmst_snk_16  (wid_s16[`AXI_SIDW-1:`AXI_MIDW]),
   `else
     .valid_16      (1'b0),
     .idmst_snk_16  ({`AXI_MIDW{1'b0}}),
   `endif

   .dummy_input     (1'b0)
 );
 `endif

 `endif // AXI_NUM_MASTERS_1

 // Since we need to probe into RTL for the R and B channel checks,
 // only run on unencrypted rtl, with VCS.

 `ifdef RTL

 `ifdef VCS

 `ifdef AXI_ENCRYPT
 `else
 // R channel.
 `ifdef AXI_R_SHARED_LAYER
 tb_check_shared
 #(`AXI_NSP1,        // Number of channel sources.
   `AXI_NUM_MASTERS, // Number of channel sinks.
   `AXI_R_SHARED_LAYER_NM, // Number of shared sinks.
   `AXI_MIDW,        // Id width at sink.
   4,                // Encoded channel number.
   0                 // Debug, 0 off, 1 on.
  )
 U_R_check_shared (
   .clk             (aclk),
   .resetn          (aresetn),
   .report_parallel (check_shared_report_parallel),

   .valid_0       (rvalid_m[1]),
   .idmst_snk_0   (rid_m1),
   .act_ids_m1    (U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
   .act_snums_m1  (U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
   .act_counts_m1 (U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),

   `ifdef AXI_HAS_M2
     .valid_1       (rvalid_m[2]),
     .idmst_snk_1   (rid_m2),
     .act_ids_m2    (U_DW_axi.U_DW_axi_mp_m2.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m2  (U_DW_axi.U_DW_axi_mp_m2.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m2 (U_DW_axi.U_DW_axi_mp_m2.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_1       (1'b0),
     .idmst_snk_1   ('b0),
     .act_ids_m2    ('b0),
     .act_snums_m2  ('b0),
     .act_counts_m2 ('b0),
   `endif

   `ifdef AXI_HAS_M3
     .valid_2       (rvalid_m[3]),
     .idmst_snk_2   (rid_m3),
     .act_ids_m3    (U_DW_axi.U_DW_axi_mp_m3.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m3  (U_DW_axi.U_DW_axi_mp_m3.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m3 (U_DW_axi.U_DW_axi_mp_m3.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_2       (1'b0),
     .idmst_snk_2   ('b0),
     .act_ids_m3    ('b0),
     .act_snums_m3  ('b0),
     .act_counts_m3 ('b0),
   `endif

   `ifdef AXI_HAS_M4
     .valid_3       (rvalid_m[4]),
     .idmst_snk_3   (rid_m4),
     .act_ids_m4    (U_DW_axi.U_DW_axi_mp_m4.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m4  (U_DW_axi.U_DW_axi_mp_m4.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m4 (U_DW_axi.U_DW_axi_mp_m4.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_3       (1'b0),
     .idmst_snk_3   ('b0),
     .act_ids_m4    ('b0),
     .act_snums_m4  ('b0),
     .act_counts_m4 ('b0),
   `endif

   `ifdef AXI_HAS_M5
     .valid_4       (rvalid_m[5]),
     .idmst_snk_4   (rid_m5),
     .act_ids_m5    (U_DW_axi.U_DW_axi_mp_m5.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m5  (U_DW_axi.U_DW_axi_mp_m5.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m5 (U_DW_axi.U_DW_axi_mp_m5.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_4       (1'b0),
     .idmst_snk_4   ('b0),
     .act_ids_m5    ('b0),
     .act_snums_m5  ('b0),
     .act_counts_m5 ('b0),
   `endif

   `ifdef AXI_HAS_M6
     .valid_5       (rvalid_m[6]),
     .idmst_snk_5   (rid_m6),
     .act_ids_m6    (U_DW_axi.U_DW_axi_mp_m6.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m6  (U_DW_axi.U_DW_axi_mp_m6.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m6 (U_DW_axi.U_DW_axi_mp_m6.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_5       (1'b0),
     .idmst_snk_5   ('b0),
     .act_ids_m6    ('b0),
     .act_snums_m6  ('b0),
     .act_counts_m6 ('b0),
   `endif

   `ifdef AXI_HAS_M7
     .valid_6       (rvalid_m[7]),
     .idmst_snk_6   (rid_m7),
     .act_ids_m7    (U_DW_axi.U_DW_axi_mp_m7.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m7  (U_DW_axi.U_DW_axi_mp_m7.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m7 (U_DW_axi.U_DW_axi_mp_m7.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_6       (1'b0),
     .idmst_snk_6   ('b0),
     .act_ids_m7    ('b0),
     .act_snums_m7  ('b0),
     .act_counts_m7 ('b0),
   `endif

   `ifdef AXI_HAS_M8
     .valid_7       (rvalid_m[8]),
     .idmst_snk_7   (rid_m8),
     .act_ids_m8    (U_DW_axi.U_DW_axi_mp_m8.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m8  (U_DW_axi.U_DW_axi_mp_m8.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m8 (U_DW_axi.U_DW_axi_mp_m8.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_7       (1'b0),
     .idmst_snk_7   ('b0),
     .act_ids_m8    ('b0),
     .act_snums_m8  ('b0),
     .act_counts_m8 ('b0),
   `endif

   `ifdef AXI_HAS_M9
     .valid_8       (rvalid_m[9]),
     .idmst_snk_8   (rid_m9),
     .act_ids_m9    (U_DW_axi.U_DW_axi_mp_m9.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m9  (U_DW_axi.U_DW_axi_mp_m9.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m9 (U_DW_axi.U_DW_axi_mp_m9.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_8       (1'b0),
     .idmst_snk_8   ('b0),
     .act_ids_m9    ('b0),
     .act_snums_m9  ('b0),
     .act_counts_m9 ('b0),
   `endif

   `ifdef AXI_HAS_M10
     .valid_9        (rvalid_m[10]),
     .idmst_snk_9    (rid_m10),
     .act_ids_m10    (U_DW_axi.U_DW_axi_mp_m10.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m10  (U_DW_axi.U_DW_axi_mp_m10.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m10 (U_DW_axi.U_DW_axi_mp_m10.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_9        (1'b0),
     .idmst_snk_9    ('b0),
     .act_ids_m10    ('b0),
     .act_snums_m10  ('b0),
     .act_counts_m10 ('b0),
   `endif

   `ifdef AXI_HAS_M12
     .valid_11       (rvalid_m[12]),
     .idmst_snk_11   (rid_m12),
     .act_ids_m12    (U_DW_axi.U_DW_axi_mp_m12.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m12  (U_DW_axi.U_DW_axi_mp_m12.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m12 (U_DW_axi.U_DW_axi_mp_m12.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_11       (1'b0),
     .idmst_snk_11   ('b0),
     .act_ids_m12    ('b0),
     .act_snums_m12  ('b0),
     .act_counts_m12 ('b0),
   `endif

   `ifdef AXI_HAS_M13
     .valid_12       (rvalid_m[13]),
     .idmst_snk_12   (rid_m13),
     .act_ids_m13    (U_DW_axi.U_DW_axi_mp_m13.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m13  (U_DW_axi.U_DW_axi_mp_m13.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m13 (U_DW_axi.U_DW_axi_mp_m13.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_12       (1'b0),
     .idmst_snk_12   ('b0),
     .act_ids_m13    ('b0),
     .act_snums_m13  ('b0),
     .act_counts_m13 ('b0),
   `endif

   `ifdef AXI_HAS_M14
     .valid_13       (rvalid_m[14]),
     .idmst_snk_13   (rid_m14),
     .act_ids_m14    (U_DW_axi.U_DW_axi_mp_m14.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m14  (U_DW_axi.U_DW_axi_mp_m14.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m14 (U_DW_axi.U_DW_axi_mp_m14.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_13       (1'b0),
     .idmst_snk_13   ('b0),
     .act_ids_m14    ('b0),
     .act_snums_m14  ('b0),
     .act_counts_m14 ('b0),
   `endif

   `ifdef AXI_HAS_M15
     .valid_14       (rvalid_m[15]),
     .idmst_snk_14   (rid_m15),
     .act_ids_m15    (U_DW_axi.U_DW_axi_mp_m15.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m15  (U_DW_axi.U_DW_axi_mp_m15.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m15 (U_DW_axi.U_DW_axi_mp_m15.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_14       (1'b0),
     .idmst_snk_14   ('b0),
     .act_ids_m15    ('b0),
     .act_snums_m15  ('b0),
     .act_counts_m15 ('b0),
   `endif

   `ifdef AXI_HAS_M16
     .valid_15       (rvalid_m[16]),
     .idmst_snk_15   (rid_m16),
     .act_ids_m16    (U_DW_axi.U_DW_axi_mp_m16.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m16  (U_DW_axi.U_DW_axi_mp_m16.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m16 (U_DW_axi.U_DW_axi_mp_m16.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_15       (1'b0),
     .idmst_snk_15   ('b0),
     .act_ids_m16    ('b0),
     .act_snums_m16  ('b0),
     .act_counts_m16 ('b0),
   `endif

   .dummy_input     (1'b0)
 );
 `endif

 `ifdef AXI_B_SHARED_LAYER
 tb_check_shared
 #(`AXI_NSP1,        // Number of channel sources.
   `AXI_NUM_MASTERS, // Number of channel sinks.
   `AXI_B_SHARED_LAYER_NM, // Number of shared sinks.
   `AXI_MIDW,        // Id width at sink.
   2,                // Encoded channel number.
   0                 // Debug, 0 off, 1 on.
  )
 U_B_check_shared (
   .clk             (aclk),
   .resetn          (aresetn),
   .report_parallel (check_shared_report_parallel),

   .valid_0       (bvalid_m[1]),
   .idmst_snk_0   (bid_m1),
   .act_ids_m1    (U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
   .act_snums_m1  (U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
   .act_counts_m1 (U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),

   `ifdef AXI_HAS_M2
     .valid_1       (bvalid_m[2]),
     .idmst_snk_1   (bid_m2),
     .act_ids_m2    (U_DW_axi.U_DW_axi_mp_m2.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m2  (U_DW_axi.U_DW_axi_mp_m2.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m2 (U_DW_axi.U_DW_axi_mp_m2.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_1       (1'b0),
     .idmst_snk_1   ('b0),
     .act_ids_m2    ('b0),
     .act_snums_m2  ('b0),
     .act_counts_m2 ('b0),
   `endif

   `ifdef AXI_HAS_M3
     .valid_2       (bvalid_m[3]),
     .idmst_snk_2   (bid_m3),
     .act_ids_m3    (U_DW_axi.U_DW_axi_mp_m3.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m3  (U_DW_axi.U_DW_axi_mp_m3.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m3 (U_DW_axi.U_DW_axi_mp_m3.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_2       (1'b0),
     .idmst_snk_2   ('b0),
     .act_ids_m3    ('b0),
     .act_snums_m3  ('b0),
     .act_counts_m3 ('b0),
   `endif

   `ifdef AXI_HAS_M4
     .valid_3       (bvalid_m[4]),
     .idmst_snk_3   (bid_m4),
     .act_ids_m4    (U_DW_axi.U_DW_axi_mp_m4.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m4  (U_DW_axi.U_DW_axi_mp_m4.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m4 (U_DW_axi.U_DW_axi_mp_m4.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_3       (1'b0),
     .idmst_snk_3   ('b0),
     .act_ids_m4    ('b0),
     .act_snums_m4  ('b0),
     .act_counts_m4 ('b0),
   `endif

   `ifdef AXI_HAS_M5
     .valid_4       (bvalid_m[5]),
     .idmst_snk_4   (bid_m5),
     .act_ids_m5    (U_DW_axi.U_DW_axi_mp_m5.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m5  (U_DW_axi.U_DW_axi_mp_m5.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m5 (U_DW_axi.U_DW_axi_mp_m5.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_4       (1'b0),
     .idmst_snk_4   ('b0),
     .act_ids_m5    ('b0),
     .act_snums_m5  ('b0),
     .act_counts_m5 ('b0),
   `endif

   `ifdef AXI_HAS_M6
     .valid_5       (bvalid_m[6]),
     .idmst_snk_5   (bid_m6),
     .act_ids_m6    (U_DW_axi.U_DW_axi_mp_m6.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m6  (U_DW_axi.U_DW_axi_mp_m6.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m6 (U_DW_axi.U_DW_axi_mp_m6.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_5       (1'b0),
     .idmst_snk_5   ('b0),
     .act_ids_m6    ('b0),
     .act_snums_m6  ('b0),
     .act_counts_m6 ('b0),
   `endif

   `ifdef AXI_HAS_M7
     .valid_6       (bvalid_m[7]),
     .idmst_snk_6   (bid_m7),
     .act_ids_m7    (U_DW_axi.U_DW_axi_mp_m7.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m7  (U_DW_axi.U_DW_axi_mp_m7.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m7 (U_DW_axi.U_DW_axi_mp_m7.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_6       (1'b0),
     .idmst_snk_6   ('b0),
     .act_ids_m7    ('b0),
     .act_snums_m7  ('b0),
     .act_counts_m7 ('b0),
   `endif

   `ifdef AXI_HAS_M8
     .valid_7       (bvalid_m[8]),
     .idmst_snk_7   (bid_m8),
     .act_ids_m8    (U_DW_axi.U_DW_axi_mp_m8.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m8  (U_DW_axi.U_DW_axi_mp_m8.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m8 (U_DW_axi.U_DW_axi_mp_m8.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_7       (1'b0),
     .idmst_snk_7   ('b0),
     .act_ids_m8    ('b0),
     .act_snums_m8  ('b0),
     .act_counts_m8 ('b0),
   `endif

   `ifdef AXI_HAS_M9
     .valid_8       (bvalid_m[9]),
     .idmst_snk_8   (bid_m9),
     .act_ids_m9    (U_DW_axi.U_DW_axi_mp_m9.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m9  (U_DW_axi.U_DW_axi_mp_m9.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m9 (U_DW_axi.U_DW_axi_mp_m9.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_8       (1'b0),
     .idmst_snk_8   ('b0),
     .act_ids_m9    ('b0),
     .act_snums_m9  ('b0),
     .act_counts_m9 ('b0),
   `endif

   `ifdef AXI_HAS_M10
     .valid_9        (bvalid_m[10]),
     .idmst_snk_9    (bid_m10),
     .act_ids_m10    (U_DW_axi.U_DW_axi_mp_m10.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m10  (U_DW_axi.U_DW_axi_mp_m10.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m10 (U_DW_axi.U_DW_axi_mp_m10.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_9        (1'b0),
     .idmst_snk_9    ('b0),
     .act_ids_m10    ('b0),
     .act_snums_m10  ('b0),
     .act_counts_m10 ('b0),
   `endif

   `ifdef AXI_HAS_M12
     .valid_11       (bvalid_m[12]),
     .idmst_snk_11   (bid_m12),
     .act_ids_m12    (U_DW_axi.U_DW_axi_mp_m12.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m12  (U_DW_axi.U_DW_axi_mp_m12.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m12 (U_DW_axi.U_DW_axi_mp_m12.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_11       (1'b0),
     .idmst_snk_11   ('b0),
     .act_ids_m12    ('b0),
     .act_snums_m12  ('b0),
     .act_counts_m12 ('b0),
   `endif

   `ifdef AXI_HAS_M13
     .valid_12       (bvalid_m[13]),
     .idmst_snk_12   (bid_m13),
     .act_ids_m13    (U_DW_axi.U_DW_axi_mp_m13.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m13  (U_DW_axi.U_DW_axi_mp_m13.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m13 (U_DW_axi.U_DW_axi_mp_m13.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_12       (1'b0),
     .idmst_snk_12   ('b0),
     .act_ids_m13    ('b0),
     .act_snums_m13  ('b0),
     .act_counts_m13 ('b0),
   `endif

   `ifdef AXI_HAS_M14
     .valid_13       (bvalid_m[14]),
     .idmst_snk_13   (bid_m14),
     .act_ids_m14    (U_DW_axi.U_DW_axi_mp_m14.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m14  (U_DW_axi.U_DW_axi_mp_m14.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m14 (U_DW_axi.U_DW_axi_mp_m14.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_13       (1'b0),
     .idmst_snk_13   ('b0),
     .act_ids_m14    ('b0),
     .act_snums_m14  ('b0),
     .act_counts_m14 ('b0),
   `endif

   `ifdef AXI_HAS_M15
     .valid_14       (bvalid_m[15]),
     .idmst_snk_14   (bid_m15),
     .act_ids_m15    (U_DW_axi.U_DW_axi_mp_m15.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m15  (U_DW_axi.U_DW_axi_mp_m15.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m15 (U_DW_axi.U_DW_axi_mp_m15.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_14       (1'b0),
     .idmst_snk_14   ('b0),
     .act_ids_m15    ('b0),
     .act_snums_m15  ('b0),
     .act_counts_m15 ('b0),
   `endif

   `ifdef AXI_HAS_M16
     .valid_15       (bvalid_m[16]),
     .idmst_snk_15   (bid_m16),
     .act_ids_m16    (U_DW_axi.U_DW_axi_mp_m16.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_ids_r),
     .act_snums_m16  (U_DW_axi.U_DW_axi_mp_m16.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_snums_r),
     .act_counts_m16 (U_DW_axi.U_DW_axi_mp_m16.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.act_counts_r),
   `else
     .valid_15       (1'b0),
     .idmst_snk_15   ('b0),
     .act_ids_m16    ('b0),
     .act_snums_m16  ('b0),
     .act_counts_m16 ('b0),
   `endif

   .dummy_input     (1'b0)
 );
 `endif

 `endif

 `endif

 `endif

 `endif

 // Don't run arb checks for gatelevel sims.
 `ifdef RTL

 // Only run arb type parameter check if src code is unencrypted.
 // Only run for vcs.
 `ifdef VCS

 `ifdef AXI_ENCRYPT
 `else
   `include "../testbench/tb_check_arb_type_params.v"
   `include "../testbench/tb_check_arb_scheme.v"
   `include "../testbench/tb_inst_check_mca_arb.v"
   `include "../testbench/tb_inst_ri_limit_checker.v"
   `include "../testbench/tb_check_tarb_enable.v"
   `include "../testbench/tb_inst_fae_arb_monitor.v"

   // Deadlock notification checkers use hierarchical paths.
   `ifdef AXI_HAS_DLOCK_NOTIFY
   `include "../testbench/tb_axi_tasks_deadlock.v"

   always@(posedge aclk or negedge aresetn)
   begin
     if(!aresetn)
       tb_axi_initialize_deadlock;
     else
       #2;
       tb_axi_check_deadlock;
   end
   `endif

 `endif

 `endif

 `endif


 `ifdef AXI_LOCKING
  // Locking sequence arbitration checkers.
  tb_lock_arb_test_s
  #(.SNUM     (1),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S1)
  )
  U_tb_lock_arb_test_s1
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[1])
   ,.awready_i         (awready_s[1])
   ,.awlock_i          (awlock_s1)
   ,.awid_i            (awid_s1)
   ,.arvalid_i         (arvalid_s[1])
   ,.arready_i         (arready_s[1])
   ,.arlock_i          (arlock_s1)
   ,.arid_i            (arid_s1)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );

  `ifdef AXI_HAS_S2
  tb_lock_arb_test_s
  #(.SNUM     (2),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S2)
  )
  U_tb_lock_arb_test_s2
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[2])
   ,.awready_i         (awready_s[2])
   ,.awlock_i          (awlock_s2)
   ,.awid_i            (awid_s2)
   ,.arvalid_i         (arvalid_s[2])
   ,.arready_i         (arready_s[2])
   ,.arlock_i          (arlock_s2)
   ,.arid_i            (arid_s2)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S3
  tb_lock_arb_test_s
  #(.SNUM     (3),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S3)
  )
  U_tb_lock_arb_test_s3
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[3])
   ,.awready_i         (awready_s[3])
   ,.awlock_i          (awlock_s3)
   ,.awid_i            (awid_s3)
   ,.arvalid_i         (arvalid_s[3])
   ,.arready_i         (arready_s[3])
   ,.arlock_i          (arlock_s3)
   ,.arid_i            (arid_s3)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S4
  tb_lock_arb_test_s
  #(.SNUM     (4),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S4)
  )
  U_tb_lock_arb_test_s4
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[4])
   ,.awready_i         (awready_s[4])
   ,.awlock_i          (awlock_s4)
   ,.awid_i            (awid_s4)
   ,.arvalid_i         (arvalid_s[4])
   ,.arready_i         (arready_s[4])
   ,.arlock_i          (arlock_s4)
   ,.arid_i            (arid_s4)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S5
  tb_lock_arb_test_s
  #(.SNUM     (5),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S5)
  )
  U_tb_lock_arb_test_s5
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[5])
   ,.awready_i         (awready_s[5])
   ,.awlock_i          (awlock_s5)
   ,.awid_i            (awid_s5)
   ,.arvalid_i         (arvalid_s[5])
   ,.arready_i         (arready_s[5])
   ,.arlock_i          (arlock_s5)
   ,.arid_i            (arid_s5)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S6
  tb_lock_arb_test_s
  #(.SNUM     (6),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S6)
  )
  U_tb_lock_arb_test_s6
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[6])
   ,.awready_i         (awready_s[6])
   ,.awlock_i          (awlock_s6)
   ,.awid_i            (awid_s6)
   ,.arvalid_i         (arvalid_s[6])
   ,.arready_i         (arready_s[6])
   ,.arlock_i          (arlock_s6)
   ,.arid_i            (arid_s6)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S7
  tb_lock_arb_test_s
  #(.SNUM     (7),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S7)
  )
  U_tb_lock_arb_test_s7
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[7])
   ,.awready_i         (awready_s[7])
   ,.awlock_i          (awlock_s7)
   ,.awid_i            (awid_s7)
   ,.arvalid_i         (arvalid_s[7])
   ,.arready_i         (arready_s[7])
   ,.arlock_i          (arlock_s7)
   ,.arid_i            (arid_s7)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S8
  tb_lock_arb_test_s
  #(.SNUM     (8),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S8)
  )
  U_tb_lock_arb_test_s8
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[8])
   ,.awready_i         (awready_s[8])
   ,.awlock_i          (awlock_s8)
   ,.awid_i            (awid_s8)
   ,.arvalid_i         (arvalid_s[8])
   ,.arready_i         (arready_s[8])
   ,.arlock_i          (arlock_s8)
   ,.arid_i            (arid_s8)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S9
  tb_lock_arb_test_s
  #(.SNUM     (9),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S9)
  )
  U_tb_lock_arb_test_s9
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[9])
   ,.awready_i         (awready_s[9])
   ,.awlock_i          (awlock_s9)
   ,.awid_i            (awid_s9)
   ,.arvalid_i         (arvalid_s[9])
   ,.arready_i         (arready_s[9])
   ,.arlock_i          (arlock_s9)
   ,.arid_i            (arid_s9)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S10
  tb_lock_arb_test_s
  #(.SNUM     (10),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S10)
  )
  U_tb_lock_arb_test_s10
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[10])
   ,.awready_i         (awready_s[10])
   ,.awlock_i          (awlock_s10)
   ,.awid_i            (awid_s10)
   ,.arvalid_i         (arvalid_s[10])
   ,.arready_i         (arready_s[10])
   ,.arlock_i          (arlock_s10)
   ,.arid_i            (arid_s10)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S11
  tb_lock_arb_test_s
  #(.SNUM     (11),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S11)
  )
  U_tb_lock_arb_test_s11
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[11])
   ,.awready_i         (awready_s[11])
   ,.awlock_i          (awlock_s11)
   ,.awid_i            (awid_s11)
   ,.arvalid_i         (arvalid_s[11])
   ,.arready_i         (arready_s[11])
   ,.arlock_i          (arlock_s11)
   ,.arid_i            (arid_s11)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S12
  tb_lock_arb_test_s
  #(.SNUM     (12),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S12)
  )
  U_tb_lock_arb_test_s12
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[12])
   ,.awready_i         (awready_s[12])
   ,.awlock_i          (awlock_s12)
   ,.awid_i            (awid_s12)
   ,.arvalid_i         (arvalid_s[12])
   ,.arready_i         (arready_s[12])
   ,.arlock_i          (arlock_s12)
   ,.arid_i            (arid_s12)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif


  `ifdef AXI_HAS_S13
  tb_lock_arb_test_s
  #(.SNUM     (13),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S13)
  )
  U_tb_lock_arb_test_s13
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[13])
   ,.awready_i         (awready_s[13])
   ,.awlock_i          (awlock_s13)
   ,.awid_i            (awid_s13)
   ,.arvalid_i         (arvalid_s[13])
   ,.arready_i         (arready_s[13])
   ,.arlock_i          (arlock_s13)
   ,.arid_i            (arid_s13)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S14
  tb_lock_arb_test_s
  #(.SNUM     (14),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S14)
  )
  U_tb_lock_arb_test_s14
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[14])
   ,.awready_i         (awready_s[14])
   ,.awlock_i          (awlock_s14)
   ,.awid_i            (awid_s14)
   ,.arvalid_i         (arvalid_s[14])
   ,.arready_i         (arready_s[14])
   ,.arlock_i          (arlock_s14)
   ,.arid_i            (arid_s14)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S15
  tb_lock_arb_test_s
  #(.SNUM     (15),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S15)
  )
  U_tb_lock_arb_test_s15
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[15])
   ,.awready_i         (awready_s[15])
   ,.awlock_i          (awlock_s15)
   ,.awid_i            (awid_s15)
   ,.arvalid_i         (arvalid_s[15])
   ,.arready_i         (arready_s[15])
   ,.arlock_i          (arlock_s15)
   ,.arid_i            (arid_s15)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif

  `ifdef AXI_HAS_S16
  tb_lock_arb_test_s
  #(.SNUM     (16),
    .ARB_TYPE (`AXI_AW_ARB_TYPE_S16)
  )
  U_tb_lock_arb_test_s16
  (
    .aclk              (aclk)
   ,.aresetn           (aresetn)
   ,.awvalid_i         (awvalid_s[16])
   ,.awready_i         (awready_s[16])
   ,.awlock_i          (awlock_s16)
   ,.awid_i            (awid_s16)
   ,.arvalid_i         (arvalid_s[16])
   ,.arready_i         (arready_s[16])
   ,.arlock_i          (arlock_s16)
   ,.arid_i            (arid_s16)
   ,.bus_awvalid_m     (awvalid_m[`AXI_NUM_MASTERS:1])
   ,.bus_arvalid_m     (arvalid_m[`AXI_NUM_MASTERS:1])
   ,.lock_arb_test_on  (tb_lock_arb_test_on)
  );
  `endif


  `endif


endmodule
