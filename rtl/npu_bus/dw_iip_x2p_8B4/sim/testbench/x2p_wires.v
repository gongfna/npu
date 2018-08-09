/*
 ------------------------------------------------------------------------
--
--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
--                            ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this
--  software is subject to the terms and conditions of a written
--  license agreement between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
*/

// tb wires to connect axi master 0 in system A

  // axi bus widths
  parameter aaaw = `X2P_AXI_AW;        // width of X2P_AXI AWADDR and ARADDR
  parameter awdw = `X2P_AXI_DW;        // width 0f X2P_AXI WDATA
  parameter ardw = `X2P_AXI_DW;        // width of X2P_AXI RDATA
  parameter aidw = `X2P_AXI_SIDW;      // Width of ID for all X2P_AXI busses
  parameter alenw = `LEN_WIDTH;    // Width of the LEN field
  parameter sbw  = 64;             // max width for all the sidebands

  // axi master 0
  wire a_hclk;
  wire a_hresetn;

  wire            a_aclk_m0 = a_hclk;
  wire            a_aresetn_m0;

  wire            a_awvalid_m0, awvaild_x2p;
  wire [aaaw-1:0] a_awaddr_m0, awaddr_x2p;
  wire [alenw-1:0] a_awlen_m0, awlen_x2p;
  wire      [2:0] a_awsize_m0, awsize_x2p;
  wire      [1:0] a_awburst_m0, awburst_x2p;
  wire      [1:0] a_awlock_m0, awlock_x2p;
  wire      [3:0] a_awcache_m0, awcache_x2p;
  wire      [2:0] a_awprot_m0, awprot_x2p;
  wire [aidw-1:0] a_awid_m0, awid_x2p;
  wire            a_awready_m0, awready_x2p;

  wire            a_arvalid_m0, arvalid_x2p;
  wire [aaaw-1:0] a_araddr_m0, araddr_x2p;
  wire [alenw-1:0] a_arlen_m0, arlen_x2p;
  wire      [2:0] a_arsize_m0, arsize_x2p;
  wire      [1:0] a_arburst_m0, arburst_x2p;
  wire      [1:0] a_arlock_m0, arlock_x2p;
  wire      [3:0] a_arcache_m0, arcache_x2p;
  wire      [2:0] a_arprot_m0, arprot_x2p;
  wire [aidw-1:0] a_arid_m0, arid_x2p;
  wire            a_arready_m0, arready_x2p;

  wire            a_rvalid_m0, rvalid_x2p;
  wire            a_rlast_m0, rlast_x2p;
  wire [ardw-1:0] a_rdata_m0, rdata_x2p;
  wire      [1:0] a_rresp_m0, rresp_x2p;
  wire [aidw-1:0] a_rid_m0, rid_x2p;
  wire            a_rready_m0, rready_x2p;

  wire            a_wvalid_m0, wvaild_x2p;
  wire            a_wlast_m0, wlast_x2p;
  wire [awdw-1:0] a_wdata_m0, wdata_x2p;
  wire    [127:0] a_wstrb_m0, wstrb_x2p;
  wire [aidw-1:0] a_wid_m0, wid_x2p;
  wire            a_wready_m0, wready_x2p;
  wire            a_bvalid_m0, bvalid_x2p;
  wire      [1:0] a_bresp_m0, bresp_x2p;
  wire [aidw-1:0] a_bid_m0, bid_x2p;
  wire            a_bready_m0, bready_x2p;

  wire            a_csysreq_m0;
  wire            a_csysack_m0;

// added the sidebands for 3.54
  wire [sbw-1:0] a_awsideband_m0;
  wire [sbw-1:0] a_arsideband_m0;
  wire [sbw-1:0] a_rsideband_m0;
  wire [sbw-1:0] a_wsideband_m0;
  wire [sbw-1:0] a_bsideband_m0;


  // these are connected to the AXI Monitor unused ports
  // The monitor will egnore these pins values and default to inactive

  wire            awvalid_nu;
  wire [aaaw-1:0] awaddr_nu;
  wire[alenw-1:0] awlen_nu;
  wire      [2:0] awsize_nu;
  wire      [1:0] awburst_nu;
  wire      [1:0] awlock_nu;
  wire      [3:0] awcache_nu;
  wire      [2:0] awprot_nu;
  wire [aidw-1:0] awid_nu;
  wire            awready_nu;

  wire            arvalid_nu;
  wire [aaaw-1:0] araddr_nu;
  wire [alenw-1:0] arlen_nu;
  wire      [2:0] arsize_nu;
  wire      [1:0] arburst_nu;
  wire      [1:0] arlock_nu;
  wire      [3:0] arcache_nu;
  wire      [2:0] arprot_nu;
  wire [aidw-1:0] arid_nu;
  wire            arready_nu;

  wire            rvalid_nu;
  wire            rlast_nu;
  wire [ardw-1:0] rdata_nu;
  wire      [1:0] rresp_nu;
  wire [aidw-1:0] rid_nu;
  wire            rready_nu;

  wire            wvalid_nu;
  wire            wlast_nu;
  wire [awdw-1:0] wdata_nu;
  wire    [127:0] wstrb_nu;
  wire [aidw-1:0] wid_nu;
  wire            wready_nu;
  wire            bvalid_nu;
  wire      [1:0] bresp_nu;
  wire [aidw-1:0] bid_nu;
  wire            bready_nu;

  wire            csysreq_nu;
  wire            csysack_nu;
  wire            cactive_nu;


  // Low Power signals
  wire            clklp;
  wire            csysreq;
  wire            csysack;
  wire            cactive;

 // axi-apb bridge
  wire            b_hclk;
  wire b_presetn;
       // ahb Inputs  delay to assure sync with testbench
  wire [`X2P_APB_DATA_WIDTH-1:0] b_pwdata;
  wire [`X2P_APB_ADDR_WIDTH-1:0] b_paddr;
  wire [`X2P_NUM_APB_SLAVES-1:0] b_psel;
  wire 			         b_penable;
  wire                           b_pwrite;
  // used to tie off unused slaves
  wire [`X2P_APB_DATA_WIDTH-1:0] pwdata_nu = 0;
  wire [`X2P_APB_ADDR_WIDTH-1:0] paddr_nu = 0;
  wire                           psel_nu = 0;
  wire 			         penable_nu = 0;
  wire                           pwrite_nu = 0;

  wire                           pready_nu;
  wire [`X2P_APB_DATA_WIDTH-1:0] prdata_nu;
  wire                           pslverr_nu;


       // ahb Outputs
   wire  [`X2P_APB_DATA_WIDTH-1:0] b_prdata;
   wire 			   b_pready;
   wire 			   b_pslverr;
    wire        pready_s0 ;
    wire        pready_s1 ;
    wire        pready_s2 ;
    wire        pready_s3 ;
    wire        pready_s4 ;
    wire        pready_s5 ;
    wire        pready_s6 ;
    wire        pready_s7 ;
    wire        pready_s8 ;
    wire        pready_s9 ;
    wire        pready_s10 ;
    wire        pready_s11 ;
    wire        pready_s12 ;
    wire        pready_s13 ;
    wire        pready_s14 ;
    wire        pready_s15 ;

    wire [31:0] prdata_s0 ;
    wire [31:0] prdata_s1 ;
    wire [31:0] prdata_s2 ;
    wire [31:0] prdata_s3 ;
    wire [31:0] prdata_s4 ;
    wire [31:0] prdata_s5 ;
    wire [31:0] prdata_s6 ;
    wire [31:0] prdata_s7 ;
    wire [31:0] prdata_s8 ;
    wire [31:0] prdata_s9 ;
    wire [31:0] prdata_s10 ;
    wire [31:0] prdata_s11 ;
    wire [31:0] prdata_s12 ;
    wire [31:0] prdata_s13 ;
    wire [31:0] prdata_s14 ;
    wire [31:0] prdata_s15 ;

    wire        pslverr_s0 ;
    wire        pslverr_s1 ;
    wire        pslverr_s2 ;
    wire        pslverr_s3 ;
    wire        pslverr_s4 ;
    wire        pslverr_s5 ;
    wire        pslverr_s6 ;
    wire        pslverr_s7 ;
    wire        pslverr_s8 ;
    wire        pslverr_s9 ;
    wire        pslverr_s10 ;
    wire        pslverr_s11 ;
    wire        pslverr_s12 ;
    wire        pslverr_s13 ;
    wire        pslverr_s14 ;
    wire        pslverr_s15 ;


// added the sidebands for 3.54
  wire [sbw-1:0] awsideband_nu;
  wire [sbw-1:0] arsideband_nu;
  wire [sbw-1:0] rsideband_nu;
  wire [sbw-1:0] wsideband_nu;
  wire [sbw-1:0] bsideband_nu;


























