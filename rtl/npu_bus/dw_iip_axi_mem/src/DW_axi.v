/*
------------------------------------------------------------------------
--
--                    (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
--                           ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this
--  software is subject to the terms and conditions of a written
--  license agreement between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
--
-- File     : DW_axi.v
-- Version  : $Revision: #92 $ 
-- Abstract : Top Level File for DW_axi
--
------------------------------------------------------------------------
*/


module DW_axi (


  aclk
               ,aresetn
               // Write Address Channel from Master1
               ,awvalid_m1
               ,awaddr_m1
               ,awid_m1
               ,awlen_m1
               ,awsize_m1
               ,awburst_m1
               ,awlock_m1
               ,awcache_m1
               ,awprot_m1
               ,awready_m1
               // Write Data Channel from Master1
               ,wvalid_m1
               ,wid_m1
               ,wdata_m1
               ,wstrb_m1
               ,wlast_m1
               ,wready_m1
               // Write Response Channel from Master1
               ,bvalid_m1
               ,bid_m1
               ,bresp_m1
               ,bready_m1
               // Read Address Channel from Master1
               ,arvalid_m1
               ,arid_m1
               ,araddr_m1
               ,arlen_m1
               ,arsize_m1
               ,arburst_m1
               ,arlock_m1
               ,arcache_m1
               ,arprot_m1
               ,arready_m1
               // Read Data Channel from Master1
               ,rvalid_m1
               ,rid_m1
               ,rdata_m1
               ,rresp_m1
               ,rlast_m1
               ,rready_m1
               // Write Address Channel from Slave1
               ,awvalid_s1
               ,awaddr_s1
               ,awid_s1
               ,awlen_s1
               ,awsize_s1
               ,awburst_s1
               ,awlock_s1
               ,awcache_s1
               ,awprot_s1
               ,awready_s1
               // Write Data Channel from Slave1
               ,wvalid_s1
               ,wid_s1
               ,wdata_s1
               ,wstrb_s1
               ,wlast_s1
               ,wready_s1
               // Write Response Channel from Slave1
               ,bvalid_s1
               ,bid_s1
               ,bresp_s1
               ,bready_s1
               // Read Address Channel from Slave1
               ,arvalid_s1
               ,arid_s1
               ,araddr_s1
               ,arlen_s1
               ,arsize_s1
               ,arburst_s1
               ,arlock_s1
               ,arcache_s1
               ,arprot_s1
               ,arready_s1
               // Read Data Channel from Slave1
               ,rvalid_s1
               ,rid_s1
               ,rdata_s1
               ,rresp_s1
               ,rlast_s1
               ,rready_s1
               // Write Address Channel from Slave2
               ,awvalid_s2
               ,awaddr_s2
               ,awid_s2
               ,awlen_s2
               ,awsize_s2
               ,awburst_s2
               ,awlock_s2
               ,awcache_s2
               ,awprot_s2
               ,awready_s2
               // Write Data Channel from Slave2
               ,wvalid_s2
               ,wid_s2
               ,wdata_s2
               ,wstrb_s2
               ,wlast_s2
               ,wready_s2
               // Write Response Channel from Slave2
               ,bvalid_s2
               ,bid_s2
               ,bresp_s2
               ,bready_s2
               // Read Address Channel from Slave2
               ,arvalid_s2
               ,arid_s2
               ,araddr_s2
               ,arlen_s2
               ,arsize_s2
               ,arburst_s2
               ,arlock_s2
               ,arcache_s2
               ,arprot_s2
               ,arready_s2
               // Read Data Channel from Slave2
               ,rvalid_s2
               ,rid_s2
               ,rdata_s2
               ,rresp_s2
               ,rlast_s2
               ,rready_s2
               // Write Address Channel from Slave3
               ,awvalid_s3
               ,awaddr_s3
               ,awid_s3
               ,awlen_s3
               ,awsize_s3
               ,awburst_s3
               ,awlock_s3
               ,awcache_s3
               ,awprot_s3
               ,awready_s3
               // Write Data Channel from Slave3
               ,wvalid_s3
               ,wid_s3
               ,wdata_s3
               ,wstrb_s3
               ,wlast_s3
               ,wready_s3
               // Write Response Channel from Slave3
               ,bvalid_s3
               ,bid_s3
               ,bresp_s3
               ,bready_s3
               // Read Address Channel from Slave3
               ,arvalid_s3
               ,arid_s3
               ,araddr_s3
               ,arlen_s3
               ,arsize_s3
               ,arburst_s3
               ,arlock_s3
               ,arcache_s3
               ,arprot_s3
               ,arready_s3
               // Read Data Channel from Slave3
               ,rvalid_s3
               ,rid_s3
               ,rdata_s3
               ,rresp_s3
               ,rlast_s3
               ,rready_s3
               // Write Address Channel from Slave4
               ,awvalid_s4
               ,awaddr_s4
               ,awid_s4
               ,awlen_s4
               ,awsize_s4
               ,awburst_s4
               ,awlock_s4
               ,awcache_s4
               ,awprot_s4
               ,awready_s4
               // Write Data Channel from Slave4
               ,wvalid_s4
               ,wid_s4
               ,wdata_s4
               ,wstrb_s4
               ,wlast_s4
               ,wready_s4
               // Write Response Channel from Slave4
               ,bvalid_s4
               ,bid_s4
               ,bresp_s4
               ,bready_s4
               // Read Address Channel from Slave4
               ,arvalid_s4
               ,arid_s4
               ,araddr_s4
               ,arlen_s4
               ,arsize_s4
               ,arburst_s4
               ,arlock_s4
               ,arcache_s4
               ,arprot_s4
               ,arready_s4
               // Read Data Channel from Slave4
               ,rvalid_s4
               ,rid_s4
               ,rdata_s4
               ,rresp_s4
               ,rlast_s4
               ,rready_s4
               // Write Address Channel from Slave5
               ,awvalid_s5
               ,awaddr_s5
               ,awid_s5
               ,awlen_s5
               ,awsize_s5
               ,awburst_s5
               ,awlock_s5
               ,awcache_s5
               ,awprot_s5
               ,awready_s5
               // Write Data Channel from Slave5
               ,wvalid_s5
               ,wid_s5
               ,wdata_s5
               ,wstrb_s5
               ,wlast_s5
               ,wready_s5
               // Write Response Channel from Slave5
               ,bvalid_s5
               ,bid_s5
               ,bresp_s5
               ,bready_s5
               // Read Address Channel from Slave5
               ,arvalid_s5
               ,arid_s5
               ,araddr_s5
               ,arlen_s5
               ,arsize_s5
               ,arburst_s5
               ,arlock_s5
               ,arcache_s5
               ,arprot_s5
               ,arready_s5
               // Read Data Channel from Slave5
               ,rvalid_s5
               ,rid_s5
               ,rdata_s5
               ,rresp_s5
               ,rlast_s5
               ,rready_s5
               // Write Address Channel from Slave6
               ,awvalid_s6
               ,awaddr_s6
               ,awid_s6
               ,awlen_s6
               ,awsize_s6
               ,awburst_s6
               ,awlock_s6
               ,awcache_s6
               ,awprot_s6
               ,awready_s6
               // Write Data Channel from Slave6
               ,wvalid_s6
               ,wid_s6
               ,wdata_s6
               ,wstrb_s6
               ,wlast_s6
               ,wready_s6
               // Write Response Channel from Slave6
               ,bvalid_s6
               ,bid_s6
               ,bresp_s6
               ,bready_s6
               // Read Address Channel from Slave6
               ,arvalid_s6
               ,arid_s6
               ,araddr_s6
               ,arlen_s6
               ,arsize_s6
               ,arburst_s6
               ,arlock_s6
               ,arcache_s6
               ,arprot_s6
               ,arready_s6
               // Read Data Channel from Slave6
               ,rvalid_s6
               ,rid_s6
               ,rdata_s6
               ,rresp_s6
               ,rlast_s6
               ,rready_s6
               // Write Address Channel from Slave7
               ,awvalid_s7
               ,awaddr_s7
               ,awid_s7
               ,awlen_s7
               ,awsize_s7
               ,awburst_s7
               ,awlock_s7
               ,awcache_s7
               ,awprot_s7
               ,awready_s7
               // Write Data Channel from Slave7
               ,wvalid_s7
               ,wid_s7
               ,wdata_s7
               ,wstrb_s7
               ,wlast_s7
               ,wready_s7
               // Write Response Channel from Slave7
               ,bvalid_s7
               ,bid_s7
               ,bresp_s7
               ,bready_s7
               // Read Address Channel from Slave7
               ,arvalid_s7
               ,arid_s7
               ,araddr_s7
               ,arlen_s7
               ,arsize_s7
               ,arburst_s7
               ,arlock_s7
               ,arcache_s7
               ,arprot_s7
               ,arready_s7
               // Read Data Channel from Slave7
               ,rvalid_s7
               ,rid_s7
               ,rdata_s7
               ,rresp_s7
               ,rlast_s7
               ,rready_s7
               // Write Address Channel from Slave8
               ,awvalid_s8
               ,awaddr_s8
               ,awid_s8
               ,awlen_s8
               ,awsize_s8
               ,awburst_s8
               ,awlock_s8
               ,awcache_s8
               ,awprot_s8
               ,awready_s8
               // Write Data Channel from Slave8
               ,wvalid_s8
               ,wid_s8
               ,wdata_s8
               ,wstrb_s8
               ,wlast_s8
               ,wready_s8
               // Write Response Channel from Slave8
               ,bvalid_s8
               ,bid_s8
               ,bresp_s8
               ,bready_s8
               // Read Address Channel from Slave8
               ,arvalid_s8
               ,arid_s8
               ,araddr_s8
               ,arlen_s8
               ,arsize_s8
               ,arburst_s8
               ,arlock_s8
               ,arcache_s8
               ,arprot_s8
               ,arready_s8
               // Read Data Channel from Slave8
               ,rvalid_s8
               ,rid_s8
               ,rdata_s8
               ,rresp_s8
               ,rlast_s8
               ,rready_s8
               ,// Default Slave Port Signals
               // Default slave write address channel
               dbg_awid_s0
               ,dbg_awaddr_s0
               ,dbg_awlen_s0
               ,dbg_awsize_s0
               ,dbg_awburst_s0
               ,dbg_awlock_s0
               ,dbg_awcache_s0
               ,dbg_awprot_s0
               ,dbg_awvalid_s0
               ,dbg_awready_s0
               ,// Default slave write data channel
               dbg_wid_s0
               ,dbg_wdata_s0
               ,dbg_wstrb_s0
               ,dbg_wlast_s0
               ,dbg_wvalid_s0
               ,dbg_wready_s0
               ,// Default slave write burst response channel
               dbg_bid_s0
               ,dbg_bresp_s0
               ,dbg_bvalid_s0
               ,dbg_bready_s0
               ,// Default slave read address channel
               dbg_arid_s0
               ,dbg_araddr_s0
               ,dbg_arlen_s0
               ,dbg_arsize_s0
               ,dbg_arburst_s0
               ,dbg_arlock_s0
               ,dbg_arcache_s0
               ,dbg_arprot_s0
               ,dbg_arvalid_s0
               ,dbg_arready_s0
               ,// Default slave read data channel
               dbg_rid_s0
               ,dbg_rdata_s0
               ,dbg_rresp_s0
               ,dbg_rvalid_s0
               ,dbg_rlast_s0
               ,dbg_rready_s0
               ,remap_n
               );


  input                       aclk;
  input                       aresetn;




  

// Write Address Channel from Master1
  input                       awvalid_m1;
  input  [`AXI_AW-1:0]        awaddr_m1;

          input  [`AXI_IDW_M1-1:0]     awid_m1;

  input  [`AXI_BLW-1:0]       awlen_m1;
  input  [`AXI_BSW-1:0]       awsize_m1;
  input  [`AXI_BTW-1:0]       awburst_m1;
  input  [`AXI_LTW-1:0]       awlock_m1;
  input  [`AXI_CTW-1:0]       awcache_m1;
  input  [`AXI_PTW-1:0]       awprot_m1;
  output                      awready_m1;
// Write Data Channel from Master1
  input                       wvalid_m1;

          input  [`AXI_IDW_M1-1:0]     wid_m1;

  input  [`AXI_DW-1:0]        wdata_m1;
  input  [`AXI_SW-1:0]        wstrb_m1;
  input                       wlast_m1;
  output                      wready_m1;
// Write Response Channel from Master1
  output                      bvalid_m1;

          output [`AXI_IDW_M1-1:0]     bid_m1;

  output [`AXI_BRW-1:0]       bresp_m1;
  input                       bready_m1;
// Read Address Channel from Master1
  input                       arvalid_m1;

          input  [`AXI_IDW_M1-1:0]     arid_m1;

  input  [`AXI_AW-1:0]        araddr_m1;
  input  [`AXI_BLW-1:0]       arlen_m1;
  input  [`AXI_BSW-1:0]       arsize_m1;
  input  [`AXI_BTW-1:0]       arburst_m1;
  input  [`AXI_LTW-1:0]       arlock_m1;
  input  [`AXI_CTW-1:0]       arcache_m1;
  input  [`AXI_PTW-1:0]       arprot_m1;
  output                      arready_m1;
// Read Data Channel from Master1
  output                      rvalid_m1;

          output [`AXI_IDW_M1-1:0]     rid_m1;

  output [`AXI_DW-1:0]        rdata_m1;
  output                      rlast_m1;
  output [`AXI_RRW-1:0]       rresp_m1;
  input                       rready_m1;


  













  













  













  













  













  













  













  













  













  













  













  













  













  













  













   

   

// Write Address Channel from Slave1
  output                      awvalid_s1;
  output [`AXI_AW-1:0]        awaddr_s1;

  output [`AXI_SIDW-1:0]     awid_s1;

  output [`AXI_BLW-1:0]       awlen_s1;
  output [`AXI_BSW-1:0]       awsize_s1;
  output [`AXI_BTW-1:0]       awburst_s1;
  output [`AXI_LTW-1:0]       awlock_s1;
  output [`AXI_CTW-1:0]       awcache_s1;
  output [`AXI_PTW-1:0]       awprot_s1;
  input                       awready_s1;
// Write Data Channel from Slave1
  output                      wvalid_s1;

  output [`AXI_SIDW-1:0]     wid_s1;

  output [`AXI_DW-1:0]        wdata_s1;
  output [`AXI_SW-1:0]        wstrb_s1;
  output                      wlast_s1;
  input                       wready_s1;
// Write Response Channel from Slave1
  input                       bvalid_s1;

  input  [`AXI_SIDW-1:0]     bid_s1;

  input  [`AXI_BRW-1:0]       bresp_s1;
  output                      bready_s1;
// Read Address Channel from Slave1
  output                      arvalid_s1;

  output [`AXI_SIDW-1:0]     arid_s1;

  output [`AXI_AW-1:0]        araddr_s1;
  output [`AXI_BLW-1:0]       arlen_s1;
  output [`AXI_BSW-1:0]       arsize_s1;
  output [`AXI_BTW-1:0]       arburst_s1;
  output [`AXI_LTW-1:0]       arlock_s1;
  output [`AXI_CTW-1:0]       arcache_s1;
  output [`AXI_PTW-1:0]       arprot_s1;
  input                       arready_s1;
// Read Data Channel from Slave1
  input                       rvalid_s1;

  input  [`AXI_SIDW-1:0]     rid_s1;

  input  [`AXI_DW-1:0]        rdata_s1;
  input                       rlast_s1;
  input  [`AXI_RRW-1:0]       rresp_s1;
  output                      rready_s1;


// Write Address Channel from Slave2
  output                      awvalid_s2;
  output [`AXI_AW-1:0]        awaddr_s2;

  output [`AXI_SIDW-1:0]     awid_s2;

  output [`AXI_BLW-1:0]       awlen_s2;
  output [`AXI_BSW-1:0]       awsize_s2;
  output [`AXI_BTW-1:0]       awburst_s2;
  output [`AXI_LTW-1:0]       awlock_s2;
  output [`AXI_CTW-1:0]       awcache_s2;
  output [`AXI_PTW-1:0]       awprot_s2;
  input                       awready_s2;
// Write Data Channel from Slave2
  output                      wvalid_s2;

  output [`AXI_SIDW-1:0]     wid_s2;

  output [`AXI_DW-1:0]        wdata_s2;
  output [`AXI_SW-1:0]        wstrb_s2;
  output                      wlast_s2;
  input                       wready_s2;
// Write Response Channel from Slave2
  input                       bvalid_s2;

  input  [`AXI_SIDW-1:0]     bid_s2;

  input  [`AXI_BRW-1:0]       bresp_s2;
  output                      bready_s2;
// Read Address Channel from Slave2
  output                      arvalid_s2;

  output [`AXI_SIDW-1:0]     arid_s2;

  output [`AXI_AW-1:0]        araddr_s2;
  output [`AXI_BLW-1:0]       arlen_s2;
  output [`AXI_BSW-1:0]       arsize_s2;
  output [`AXI_BTW-1:0]       arburst_s2;
  output [`AXI_LTW-1:0]       arlock_s2;
  output [`AXI_CTW-1:0]       arcache_s2;
  output [`AXI_PTW-1:0]       arprot_s2;
  input                       arready_s2;
// Read Data Channel from Slave2
  input                       rvalid_s2;

  input  [`AXI_SIDW-1:0]     rid_s2;

  input  [`AXI_DW-1:0]        rdata_s2;
  input                       rlast_s2;
  input  [`AXI_RRW-1:0]       rresp_s2;
  output                      rready_s2;


// Write Address Channel from Slave3
  output                      awvalid_s3;
  output [`AXI_AW-1:0]        awaddr_s3;

  output [`AXI_SIDW-1:0]     awid_s3;

  output [`AXI_BLW-1:0]       awlen_s3;
  output [`AXI_BSW-1:0]       awsize_s3;
  output [`AXI_BTW-1:0]       awburst_s3;
  output [`AXI_LTW-1:0]       awlock_s3;
  output [`AXI_CTW-1:0]       awcache_s3;
  output [`AXI_PTW-1:0]       awprot_s3;
  input                       awready_s3;
// Write Data Channel from Slave3
  output                      wvalid_s3;

  output [`AXI_SIDW-1:0]     wid_s3;

  output [`AXI_DW-1:0]        wdata_s3;
  output [`AXI_SW-1:0]        wstrb_s3;
  output                      wlast_s3;
  input                       wready_s3;
// Write Response Channel from Slave3
  input                       bvalid_s3;

  input  [`AXI_SIDW-1:0]     bid_s3;

  input  [`AXI_BRW-1:0]       bresp_s3;
  output                      bready_s3;
// Read Address Channel from Slave3
  output                      arvalid_s3;

  output [`AXI_SIDW-1:0]     arid_s3;

  output [`AXI_AW-1:0]        araddr_s3;
  output [`AXI_BLW-1:0]       arlen_s3;
  output [`AXI_BSW-1:0]       arsize_s3;
  output [`AXI_BTW-1:0]       arburst_s3;
  output [`AXI_LTW-1:0]       arlock_s3;
  output [`AXI_CTW-1:0]       arcache_s3;
  output [`AXI_PTW-1:0]       arprot_s3;
  input                       arready_s3;
// Read Data Channel from Slave3
  input                       rvalid_s3;

  input  [`AXI_SIDW-1:0]     rid_s3;

  input  [`AXI_DW-1:0]        rdata_s3;
  input                       rlast_s3;
  input  [`AXI_RRW-1:0]       rresp_s3;
  output                      rready_s3;


// Write Address Channel from Slave4
  output                      awvalid_s4;
  output [`AXI_AW-1:0]        awaddr_s4;

  output [`AXI_SIDW-1:0]     awid_s4;

  output [`AXI_BLW-1:0]       awlen_s4;
  output [`AXI_BSW-1:0]       awsize_s4;
  output [`AXI_BTW-1:0]       awburst_s4;
  output [`AXI_LTW-1:0]       awlock_s4;
  output [`AXI_CTW-1:0]       awcache_s4;
  output [`AXI_PTW-1:0]       awprot_s4;
  input                       awready_s4;
// Write Data Channel from Slave4
  output                      wvalid_s4;

  output [`AXI_SIDW-1:0]     wid_s4;

  output [`AXI_DW-1:0]        wdata_s4;
  output [`AXI_SW-1:0]        wstrb_s4;
  output                      wlast_s4;
  input                       wready_s4;
// Write Response Channel from Slave4
  input                       bvalid_s4;

  input  [`AXI_SIDW-1:0]     bid_s4;

  input  [`AXI_BRW-1:0]       bresp_s4;
  output                      bready_s4;
// Read Address Channel from Slave4
  output                      arvalid_s4;

  output [`AXI_SIDW-1:0]     arid_s4;

  output [`AXI_AW-1:0]        araddr_s4;
  output [`AXI_BLW-1:0]       arlen_s4;
  output [`AXI_BSW-1:0]       arsize_s4;
  output [`AXI_BTW-1:0]       arburst_s4;
  output [`AXI_LTW-1:0]       arlock_s4;
  output [`AXI_CTW-1:0]       arcache_s4;
  output [`AXI_PTW-1:0]       arprot_s4;
  input                       arready_s4;
// Read Data Channel from Slave4
  input                       rvalid_s4;

  input  [`AXI_SIDW-1:0]     rid_s4;

  input  [`AXI_DW-1:0]        rdata_s4;
  input                       rlast_s4;
  input  [`AXI_RRW-1:0]       rresp_s4;
  output                      rready_s4;


// Write Address Channel from Slave5
  output                      awvalid_s5;
  output [`AXI_AW-1:0]        awaddr_s5;

  output [`AXI_SIDW-1:0]     awid_s5;

  output [`AXI_BLW-1:0]       awlen_s5;
  output [`AXI_BSW-1:0]       awsize_s5;
  output [`AXI_BTW-1:0]       awburst_s5;
  output [`AXI_LTW-1:0]       awlock_s5;
  output [`AXI_CTW-1:0]       awcache_s5;
  output [`AXI_PTW-1:0]       awprot_s5;
  input                       awready_s5;
// Write Data Channel from Slave5
  output                      wvalid_s5;

  output [`AXI_SIDW-1:0]     wid_s5;

  output [`AXI_DW-1:0]        wdata_s5;
  output [`AXI_SW-1:0]        wstrb_s5;
  output                      wlast_s5;
  input                       wready_s5;
// Write Response Channel from Slave5
  input                       bvalid_s5;

  input  [`AXI_SIDW-1:0]     bid_s5;

  input  [`AXI_BRW-1:0]       bresp_s5;
  output                      bready_s5;
// Read Address Channel from Slave5
  output                      arvalid_s5;

  output [`AXI_SIDW-1:0]     arid_s5;

  output [`AXI_AW-1:0]        araddr_s5;
  output [`AXI_BLW-1:0]       arlen_s5;
  output [`AXI_BSW-1:0]       arsize_s5;
  output [`AXI_BTW-1:0]       arburst_s5;
  output [`AXI_LTW-1:0]       arlock_s5;
  output [`AXI_CTW-1:0]       arcache_s5;
  output [`AXI_PTW-1:0]       arprot_s5;
  input                       arready_s5;
// Read Data Channel from Slave5
  input                       rvalid_s5;

  input  [`AXI_SIDW-1:0]     rid_s5;

  input  [`AXI_DW-1:0]        rdata_s5;
  input                       rlast_s5;
  input  [`AXI_RRW-1:0]       rresp_s5;
  output                      rready_s5;


// Write Address Channel from Slave6
  output                      awvalid_s6;
  output [`AXI_AW-1:0]        awaddr_s6;

  output [`AXI_SIDW-1:0]     awid_s6;

  output [`AXI_BLW-1:0]       awlen_s6;
  output [`AXI_BSW-1:0]       awsize_s6;
  output [`AXI_BTW-1:0]       awburst_s6;
  output [`AXI_LTW-1:0]       awlock_s6;
  output [`AXI_CTW-1:0]       awcache_s6;
  output [`AXI_PTW-1:0]       awprot_s6;
  input                       awready_s6;
// Write Data Channel from Slave6
  output                      wvalid_s6;

  output [`AXI_SIDW-1:0]     wid_s6;

  output [`AXI_DW-1:0]        wdata_s6;
  output [`AXI_SW-1:0]        wstrb_s6;
  output                      wlast_s6;
  input                       wready_s6;
// Write Response Channel from Slave6
  input                       bvalid_s6;

  input  [`AXI_SIDW-1:0]     bid_s6;

  input  [`AXI_BRW-1:0]       bresp_s6;
  output                      bready_s6;
// Read Address Channel from Slave6
  output                      arvalid_s6;

  output [`AXI_SIDW-1:0]     arid_s6;

  output [`AXI_AW-1:0]        araddr_s6;
  output [`AXI_BLW-1:0]       arlen_s6;
  output [`AXI_BSW-1:0]       arsize_s6;
  output [`AXI_BTW-1:0]       arburst_s6;
  output [`AXI_LTW-1:0]       arlock_s6;
  output [`AXI_CTW-1:0]       arcache_s6;
  output [`AXI_PTW-1:0]       arprot_s6;
  input                       arready_s6;
// Read Data Channel from Slave6
  input                       rvalid_s6;

  input  [`AXI_SIDW-1:0]     rid_s6;

  input  [`AXI_DW-1:0]        rdata_s6;
  input                       rlast_s6;
  input  [`AXI_RRW-1:0]       rresp_s6;
  output                      rready_s6;


// Write Address Channel from Slave7
  output                      awvalid_s7;
  output [`AXI_AW-1:0]        awaddr_s7;

  output [`AXI_SIDW-1:0]     awid_s7;

  output [`AXI_BLW-1:0]       awlen_s7;
  output [`AXI_BSW-1:0]       awsize_s7;
  output [`AXI_BTW-1:0]       awburst_s7;
  output [`AXI_LTW-1:0]       awlock_s7;
  output [`AXI_CTW-1:0]       awcache_s7;
  output [`AXI_PTW-1:0]       awprot_s7;
  input                       awready_s7;
// Write Data Channel from Slave7
  output                      wvalid_s7;

  output [`AXI_SIDW-1:0]     wid_s7;

  output [`AXI_DW-1:0]        wdata_s7;
  output [`AXI_SW-1:0]        wstrb_s7;
  output                      wlast_s7;
  input                       wready_s7;
// Write Response Channel from Slave7
  input                       bvalid_s7;

  input  [`AXI_SIDW-1:0]     bid_s7;

  input  [`AXI_BRW-1:0]       bresp_s7;
  output                      bready_s7;
// Read Address Channel from Slave7
  output                      arvalid_s7;

  output [`AXI_SIDW-1:0]     arid_s7;

  output [`AXI_AW-1:0]        araddr_s7;
  output [`AXI_BLW-1:0]       arlen_s7;
  output [`AXI_BSW-1:0]       arsize_s7;
  output [`AXI_BTW-1:0]       arburst_s7;
  output [`AXI_LTW-1:0]       arlock_s7;
  output [`AXI_CTW-1:0]       arcache_s7;
  output [`AXI_PTW-1:0]       arprot_s7;
  input                       arready_s7;
// Read Data Channel from Slave7
  input                       rvalid_s7;

  input  [`AXI_SIDW-1:0]     rid_s7;

  input  [`AXI_DW-1:0]        rdata_s7;
  input                       rlast_s7;
  input  [`AXI_RRW-1:0]       rresp_s7;
  output                      rready_s7;


// Write Address Channel from Slave8
  output                      awvalid_s8;
  output [`AXI_AW-1:0]        awaddr_s8;

  output [`AXI_SIDW-1:0]     awid_s8;

  output [`AXI_BLW-1:0]       awlen_s8;
  output [`AXI_BSW-1:0]       awsize_s8;
  output [`AXI_BTW-1:0]       awburst_s8;
  output [`AXI_LTW-1:0]       awlock_s8;
  output [`AXI_CTW-1:0]       awcache_s8;
  output [`AXI_PTW-1:0]       awprot_s8;
  input                       awready_s8;
// Write Data Channel from Slave8
  output                      wvalid_s8;

  output [`AXI_SIDW-1:0]     wid_s8;

  output [`AXI_DW-1:0]        wdata_s8;
  output [`AXI_SW-1:0]        wstrb_s8;
  output                      wlast_s8;
  input                       wready_s8;
// Write Response Channel from Slave8
  input                       bvalid_s8;

  input  [`AXI_SIDW-1:0]     bid_s8;

  input  [`AXI_BRW-1:0]       bresp_s8;
  output                      bready_s8;
// Read Address Channel from Slave8
  output                      arvalid_s8;

  output [`AXI_SIDW-1:0]     arid_s8;

  output [`AXI_AW-1:0]        araddr_s8;
  output [`AXI_BLW-1:0]       arlen_s8;
  output [`AXI_BSW-1:0]       arsize_s8;
  output [`AXI_BTW-1:0]       arburst_s8;
  output [`AXI_LTW-1:0]       arlock_s8;
  output [`AXI_CTW-1:0]       arcache_s8;
  output [`AXI_PTW-1:0]       arprot_s8;
  input                       arready_s8;
// Read Data Channel from Slave8
  input                       rvalid_s8;

  input  [`AXI_SIDW-1:0]     rid_s8;

  input  [`AXI_DW-1:0]        rdata_s8;
  input                       rlast_s8;
  input  [`AXI_RRW-1:0]       rresp_s8;
  output                      rready_s8;

































































































  input                       remap_n;

  // Default Slave Port Signals

  // Default slave write address channel

  output [`AXI_SIDW-1:0] dbg_awid_s0;
  output [`AXI_AW-1:0]   dbg_awaddr_s0;
  output [`AXI_BLW-1:0]  dbg_awlen_s0;
  output [`AXI_BSW-1:0]	dbg_awsize_s0;
  output [`AXI_BTW-1:0]	dbg_awburst_s0;
  output [`AXI_LTW-1:0]	dbg_awlock_s0;
  output [`AXI_CTW-1:0] 	dbg_awcache_s0;
  output [`AXI_PTW-1:0]	dbg_awprot_s0;
  output                  dbg_awvalid_s0;
  output                  dbg_awready_s0;

  // Default slave write data channel

  output [`AXI_SIDW-1:0]   dbg_wid_s0;
  output [`AXI_DW-1:0]     dbg_wdata_s0;
  output [`AXI_SW-1:0]     dbg_wstrb_s0;
  output                    dbg_wlast_s0;
  output                    dbg_wvalid_s0;
  output                    dbg_wready_s0;

  // Default Slave write burst response channel

  output [`AXI_SIDW-1:0]   dbg_bid_s0;
  output [`AXI_BRW-1:0]    dbg_bresp_s0;
  output                    dbg_bvalid_s0;
  output                    dbg_bready_s0;

  // Default slave read address channel

  output [`AXI_SIDW-1:0] dbg_arid_s0;
  output [`AXI_AW-1:0]   dbg_araddr_s0;
  output [`AXI_BLW-1:0]  dbg_arlen_s0;
  output [`AXI_BSW-1:0]  dbg_arsize_s0;
  output [`AXI_BTW-1:0]  dbg_arburst_s0;
  output [`AXI_LTW-1:0]  dbg_arlock_s0;
  output [`AXI_CTW-1:0]  dbg_arcache_s0;
  output [`AXI_PTW-1:0]  dbg_arprot_s0;
  output                  dbg_arvalid_s0;
  output                  dbg_arready_s0;

  // Default slave read data channel
  output [`AXI_SIDW-1:0] dbg_rid_s0;
  output [`AXI_DW-1:0]   dbg_rdata_s0;
  output [`AXI_RRW-1:0]  dbg_rresp_s0;
  output                  dbg_rvalid_s0;
  output                  dbg_rlast_s0;
  output                  dbg_rready_s0;

  
  wire                                      arready_s0;
  wire                                      arvalid_s0;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s0;
  wire [`AXI_AR_S0_NMV-1:0]                    bus_arvalid_s0;
  wire [(`AXI_AR_S0_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s0;
  wire [`AXI_AR_S0_NMV-1:0]               bus_sp_arready_s0;
  wire                                       rcpl_tx_s0;
 
  wire                                      rvalid_s0;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s0;
  wire                                      rready_s0;
  wire [`AXI_NMV_S0-1:0]                    bus_rready_s0;
  wire [`AXI_NMV_S0-1:0]                    sp_rvalid_s0;
  wire                                            r_shrd_ch_req_s0;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s0;
 
  wire                                      awready_s0;
  wire                                      awvalid_s0;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s0;
  wire [`AXI_AW_S0_NMV-1:0]                    bus_awvalid_s0;
  wire [(`AXI_AW_S0_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s0;
  wire [`AXI_AW_S0_NMV-1:0]               bus_sp_awready_s0;
  wire                                                aw_shrd_lyr_granted_s0;
 
  wire                                      wready_s0;
  wire                                      wvalid_s0;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s0;
  wire [`AXI_W_S0_NMV-1:0]                    bus_wvalid_s0;
  wire [(`AXI_W_S0_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s0;
  wire [`AXI_W_S0_NMV-1:0]               bus_sp_wready_s0;
 
  wire                                      bvalid_s0;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s0;
  wire                                      bready_s0;
  wire [`AXI_NMV_S0-1:0]                    bus_bready_s0;
  wire [`AXI_NMV_S0-1:0]                    sp_bvalid_s0;
  wire                                            b_shrd_ch_req_s0;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s0;
  wire                                       wcpl_tx_s0;
  wire                                      arready_s1;
  wire                                      arvalid_s1;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s1;
  wire [`AXI_AR_S1_NMV-1:0]                    bus_arvalid_s1;
  wire [(`AXI_AR_S1_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s1;
  wire [`AXI_AR_S1_NMV-1:0]               bus_sp_arready_s1;
  wire                                       rcpl_tx_s1;
 
  wire                                      rvalid_s1;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s1;
  wire                                      rready_s1;
  wire [`AXI_NMV_S1-1:0]                    bus_rready_s1;
  wire [`AXI_NMV_S1-1:0]                    sp_rvalid_s1;
  wire                                            r_shrd_ch_req_s1;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s1;
 
  wire                                      awready_s1;
  wire                                      awvalid_s1;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s1;
  wire [`AXI_AW_S1_NMV-1:0]                    bus_awvalid_s1;
  wire [(`AXI_AW_S1_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s1;
  wire [`AXI_AW_S1_NMV-1:0]               bus_sp_awready_s1;
  wire                                                aw_shrd_lyr_granted_s1;
 
  wire                                      wready_s1;
  wire                                      wvalid_s1;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s1;
  wire [`AXI_W_S1_NMV-1:0]                    bus_wvalid_s1;
  wire [(`AXI_W_S1_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s1;
  wire [`AXI_W_S1_NMV-1:0]               bus_sp_wready_s1;
 
  wire                                      bvalid_s1;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s1;
  wire                                      bready_s1;
  wire [`AXI_NMV_S1-1:0]                    bus_bready_s1;
  wire [`AXI_NMV_S1-1:0]                    sp_bvalid_s1;
  wire                                            b_shrd_ch_req_s1;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s1;
  wire                                       wcpl_tx_s1;
  wire                                      arready_s2;
  wire                                      arvalid_s2;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s2;
  wire [`AXI_AR_S2_NMV-1:0]                    bus_arvalid_s2;
  wire [(`AXI_AR_S2_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s2;
  wire [`AXI_AR_S2_NMV-1:0]               bus_sp_arready_s2;
  wire                                       rcpl_tx_s2;
 
  wire                                      rvalid_s2;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s2;
  wire                                      rready_s2;
  wire [`AXI_NMV_S2-1:0]                    bus_rready_s2;
  wire [`AXI_NMV_S2-1:0]                    sp_rvalid_s2;
  wire                                            r_shrd_ch_req_s2;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s2;
 
  wire                                      awready_s2;
  wire                                      awvalid_s2;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s2;
  wire [`AXI_AW_S2_NMV-1:0]                    bus_awvalid_s2;
  wire [(`AXI_AW_S2_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s2;
  wire [`AXI_AW_S2_NMV-1:0]               bus_sp_awready_s2;
  wire                                                aw_shrd_lyr_granted_s2;
 
  wire                                      wready_s2;
  wire                                      wvalid_s2;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s2;
  wire [`AXI_W_S2_NMV-1:0]                    bus_wvalid_s2;
  wire [(`AXI_W_S2_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s2;
  wire [`AXI_W_S2_NMV-1:0]               bus_sp_wready_s2;
 
  wire                                      bvalid_s2;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s2;
  wire                                      bready_s2;
  wire [`AXI_NMV_S2-1:0]                    bus_bready_s2;
  wire [`AXI_NMV_S2-1:0]                    sp_bvalid_s2;
  wire                                            b_shrd_ch_req_s2;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s2;
  wire                                       wcpl_tx_s2;
  wire                                      arready_s3;
  wire                                      arvalid_s3;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s3;
  wire [`AXI_AR_S3_NMV-1:0]                    bus_arvalid_s3;
  wire [(`AXI_AR_S3_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s3;
  wire [`AXI_AR_S3_NMV-1:0]               bus_sp_arready_s3;
  wire                                       rcpl_tx_s3;
 
  wire                                      rvalid_s3;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s3;
  wire                                      rready_s3;
  wire [`AXI_NMV_S3-1:0]                    bus_rready_s3;
  wire [`AXI_NMV_S3-1:0]                    sp_rvalid_s3;
  wire                                            r_shrd_ch_req_s3;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s3;
 
  wire                                      awready_s3;
  wire                                      awvalid_s3;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s3;
  wire [`AXI_AW_S3_NMV-1:0]                    bus_awvalid_s3;
  wire [(`AXI_AW_S3_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s3;
  wire [`AXI_AW_S3_NMV-1:0]               bus_sp_awready_s3;
  wire                                                aw_shrd_lyr_granted_s3;
 
  wire                                      wready_s3;
  wire                                      wvalid_s3;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s3;
  wire [`AXI_W_S3_NMV-1:0]                    bus_wvalid_s3;
  wire [(`AXI_W_S3_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s3;
  wire [`AXI_W_S3_NMV-1:0]               bus_sp_wready_s3;
 
  wire                                      bvalid_s3;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s3;
  wire                                      bready_s3;
  wire [`AXI_NMV_S3-1:0]                    bus_bready_s3;
  wire [`AXI_NMV_S3-1:0]                    sp_bvalid_s3;
  wire                                            b_shrd_ch_req_s3;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s3;
  wire                                       wcpl_tx_s3;
  wire                                      arready_s4;
  wire                                      arvalid_s4;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s4;
  wire [`AXI_AR_S4_NMV-1:0]                    bus_arvalid_s4;
  wire [(`AXI_AR_S4_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s4;
  wire [`AXI_AR_S4_NMV-1:0]               bus_sp_arready_s4;
  wire                                       rcpl_tx_s4;
 
  wire                                      rvalid_s4;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s4;
  wire                                      rready_s4;
  wire [`AXI_NMV_S4-1:0]                    bus_rready_s4;
  wire [`AXI_NMV_S4-1:0]                    sp_rvalid_s4;
  wire                                            r_shrd_ch_req_s4;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s4;
 
  wire                                      awready_s4;
  wire                                      awvalid_s4;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s4;
  wire [`AXI_AW_S4_NMV-1:0]                    bus_awvalid_s4;
  wire [(`AXI_AW_S4_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s4;
  wire [`AXI_AW_S4_NMV-1:0]               bus_sp_awready_s4;
  wire                                                aw_shrd_lyr_granted_s4;
 
  wire                                      wready_s4;
  wire                                      wvalid_s4;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s4;
  wire [`AXI_W_S4_NMV-1:0]                    bus_wvalid_s4;
  wire [(`AXI_W_S4_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s4;
  wire [`AXI_W_S4_NMV-1:0]               bus_sp_wready_s4;
 
  wire                                      bvalid_s4;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s4;
  wire                                      bready_s4;
  wire [`AXI_NMV_S4-1:0]                    bus_bready_s4;
  wire [`AXI_NMV_S4-1:0]                    sp_bvalid_s4;
  wire                                            b_shrd_ch_req_s4;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s4;
  wire                                       wcpl_tx_s4;
  wire                                      arready_s5;
  wire                                      arvalid_s5;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s5;
  wire [`AXI_AR_S5_NMV-1:0]                    bus_arvalid_s5;
  wire [(`AXI_AR_S5_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s5;
  wire [`AXI_AR_S5_NMV-1:0]               bus_sp_arready_s5;
  wire                                       rcpl_tx_s5;
 
  wire                                      rvalid_s5;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s5;
  wire                                      rready_s5;
  wire [`AXI_NMV_S5-1:0]                    bus_rready_s5;
  wire [`AXI_NMV_S5-1:0]                    sp_rvalid_s5;
  wire                                            r_shrd_ch_req_s5;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s5;
 
  wire                                      awready_s5;
  wire                                      awvalid_s5;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s5;
  wire [`AXI_AW_S5_NMV-1:0]                    bus_awvalid_s5;
  wire [(`AXI_AW_S5_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s5;
  wire [`AXI_AW_S5_NMV-1:0]               bus_sp_awready_s5;
  wire                                                aw_shrd_lyr_granted_s5;
 
  wire                                      wready_s5;
  wire                                      wvalid_s5;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s5;
  wire [`AXI_W_S5_NMV-1:0]                    bus_wvalid_s5;
  wire [(`AXI_W_S5_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s5;
  wire [`AXI_W_S5_NMV-1:0]               bus_sp_wready_s5;
 
  wire                                      bvalid_s5;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s5;
  wire                                      bready_s5;
  wire [`AXI_NMV_S5-1:0]                    bus_bready_s5;
  wire [`AXI_NMV_S5-1:0]                    sp_bvalid_s5;
  wire                                            b_shrd_ch_req_s5;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s5;
  wire                                       wcpl_tx_s5;
  wire                                      arready_s6;
  wire                                      arvalid_s6;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s6;
  wire [`AXI_AR_S6_NMV-1:0]                    bus_arvalid_s6;
  wire [(`AXI_AR_S6_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s6;
  wire [`AXI_AR_S6_NMV-1:0]               bus_sp_arready_s6;
  wire                                       rcpl_tx_s6;
 
  wire                                      rvalid_s6;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s6;
  wire                                      rready_s6;
  wire [`AXI_NMV_S6-1:0]                    bus_rready_s6;
  wire [`AXI_NMV_S6-1:0]                    sp_rvalid_s6;
  wire                                            r_shrd_ch_req_s6;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s6;
 
  wire                                      awready_s6;
  wire                                      awvalid_s6;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s6;
  wire [`AXI_AW_S6_NMV-1:0]                    bus_awvalid_s6;
  wire [(`AXI_AW_S6_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s6;
  wire [`AXI_AW_S6_NMV-1:0]               bus_sp_awready_s6;
  wire                                                aw_shrd_lyr_granted_s6;
 
  wire                                      wready_s6;
  wire                                      wvalid_s6;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s6;
  wire [`AXI_W_S6_NMV-1:0]                    bus_wvalid_s6;
  wire [(`AXI_W_S6_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s6;
  wire [`AXI_W_S6_NMV-1:0]               bus_sp_wready_s6;
 
  wire                                      bvalid_s6;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s6;
  wire                                      bready_s6;
  wire [`AXI_NMV_S6-1:0]                    bus_bready_s6;
  wire [`AXI_NMV_S6-1:0]                    sp_bvalid_s6;
  wire                                            b_shrd_ch_req_s6;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s6;
  wire                                       wcpl_tx_s6;
  wire                                      arready_s7;
  wire                                      arvalid_s7;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s7;
  wire [`AXI_AR_S7_NMV-1:0]                    bus_arvalid_s7;
  wire [(`AXI_AR_S7_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s7;
  wire [`AXI_AR_S7_NMV-1:0]               bus_sp_arready_s7;
  wire                                       rcpl_tx_s7;
 
  wire                                      rvalid_s7;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s7;
  wire                                      rready_s7;
  wire [`AXI_NMV_S7-1:0]                    bus_rready_s7;
  wire [`AXI_NMV_S7-1:0]                    sp_rvalid_s7;
  wire                                            r_shrd_ch_req_s7;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s7;
 
  wire                                      awready_s7;
  wire                                      awvalid_s7;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s7;
  wire [`AXI_AW_S7_NMV-1:0]                    bus_awvalid_s7;
  wire [(`AXI_AW_S7_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s7;
  wire [`AXI_AW_S7_NMV-1:0]               bus_sp_awready_s7;
  wire                                                aw_shrd_lyr_granted_s7;
 
  wire                                      wready_s7;
  wire                                      wvalid_s7;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s7;
  wire [`AXI_W_S7_NMV-1:0]                    bus_wvalid_s7;
  wire [(`AXI_W_S7_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s7;
  wire [`AXI_W_S7_NMV-1:0]               bus_sp_wready_s7;
 
  wire                                      bvalid_s7;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s7;
  wire                                      bready_s7;
  wire [`AXI_NMV_S7-1:0]                    bus_bready_s7;
  wire [`AXI_NMV_S7-1:0]                    sp_bvalid_s7;
  wire                                            b_shrd_ch_req_s7;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s7;
  wire                                       wcpl_tx_s7;
  wire                                      arready_s8;
  wire                                      arvalid_s8;
  wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s8;
  wire [`AXI_AR_S8_NMV-1:0]                    bus_arvalid_s8;
  wire [(`AXI_AR_S8_NMV*`AXI_AR_PYLD_S_W)-1:0] bus_arpayload_s8;
  wire [`AXI_AR_S8_NMV-1:0]               bus_sp_arready_s8;
  wire                                       rcpl_tx_s8;
 
  wire                                      rvalid_s8;
  wire [`AXI_R_PYLD_S_W-1:0]                rpayload_s8;
  wire                                      rready_s8;
  wire [`AXI_NMV_S8-1:0]                    bus_rready_s8;
  wire [`AXI_NMV_S8-1:0]                    sp_rvalid_s8;
  wire                                            r_shrd_ch_req_s8;
  wire [`AXI_R_PYLD_M_W-1:0]                sp_rpayload_s8;
 
  wire                                      awready_s8;
  wire                                      awvalid_s8;
  wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s8;
  wire [`AXI_AW_S8_NMV-1:0]                    bus_awvalid_s8;
  wire [(`AXI_AW_S8_NMV*`AXI_AW_PYLD_S_W)-1:0] bus_awpayload_s8;
  wire [`AXI_AW_S8_NMV-1:0]               bus_sp_awready_s8;
  wire                                                aw_shrd_lyr_granted_s8;
 
  wire                                      wready_s8;
  wire                                      wvalid_s8;
  wire [`AXI_W_PYLD_S_W-1:0]                wpayload_s8;
  wire [`AXI_W_S8_NMV-1:0]                    bus_wvalid_s8;
  wire [(`AXI_W_S8_NMV*`AXI_W_PYLD_S_W)-1:0]  bus_wpayload_s8;
  wire [`AXI_W_S8_NMV-1:0]               bus_sp_wready_s8;
 
  wire                                      bvalid_s8;
  wire [`AXI_B_PYLD_S_W-1:0]               bpayload_s8;
  wire                                      bready_s8;
  wire [`AXI_NMV_S8-1:0]                    bus_bready_s8;
  wire [`AXI_NMV_S8-1:0]                    sp_bvalid_s8;
  wire                                            b_shrd_ch_req_s8;
  wire [`AXI_B_PYLD_M_W-1:0]                sp_bpayload_s8;
  wire                                       wcpl_tx_s8;
  wire                                      arvalid_m1;
  wire [`AXI_AR_PYLD_M_W-1:0]               arpayload_m1;
  wire                                      arready_m1;
  wire [`AXI_NSP1V_M1-1:0]                           bus_arready_m1;
  wire [`AXI_NSP1V_M1-1:0]                    mp_arvalid_m1;
  wire                                              ar_shrd_ch_req_m1;
  wire [`AXI_AR_PYLD_S_W-1:0]                   mp_arpayload_m1;
 
  wire                                      rready_m1;
  wire                                      rvalid_m1;
  wire [`AXI_R_PYLD_M_W-1:0]               rpayload_m1;
  wire [`AXI_R_M1_NSV-1:0]                    bus_rvalid_m1;
  wire [(`AXI_R_M1_NSV*`AXI_R_PYLD_M_W)-1:0]    bus_rpayload_m1;
  wire [`AXI_R_M1_NSV-1:0]            bus_mp_rready_m1;
 
  wire                                      awvalid_m1;
  wire [`AXI_AW_PYLD_M_W-1:0]               awpayload_m1;
  wire                                      awready_m1;
  wire [`AXI_NSP1V_M1-1:0]                    bus_awready_m1;
  wire [`AXI_NSP1V_M1-1:0]                    aw_shrd_lyr_granted_m1_s_bus;
  wire [`AXI_NSP1V_M1-1:0]                    issued_wtx_shrd_sys_m1_s_bus;
  wire [`AXI_NSP1V_M1-1:0]                    mp_awvalid_m1;
  wire                                              aw_shrd_ch_req_m1;
  wire [(`AXI_AW_PYLD_S_W)-1:0]             mp_awpayload_m1;
 
  wire                                      wvalid_m1;
  wire [`AXI_W_PYLD_M_W-1:0]               wpayload_m1;
  wire                                      wready_m1;
  wire [`AXI_NSP1V_M1-1:0]                    bus_wready_m1;
  wire [`AXI_NSP1V_M1-1:0]                    mp_wvalid_m1;
  wire                                              w_shrd_ch_req_m1;
  wire [(`AXI_W_PYLD_S_W)-1:0]              mp_wpayload_m1;
 
  wire                                      bready_m1;
  wire                                      bvalid_m1;
  wire [`AXI_B_PYLD_M_W-1:0]               bpayload_m1;
  wire [`AXI_B_M1_NSV-1:0]                    bus_bvalid_m1;
  wire [(`AXI_B_M1_NSV*`AXI_B_PYLD_M_W)-1:0]    bus_bpayload_m1;
  wire [`AXI_B_M1_NSV-1:0]            bus_mp_bready_m1;
 wire                                       has_ar_pending_trans_m1;
 wire                                       has_aw_pending_trans_m1;
 wire                                       has_ar_pending_trans_m2;
 wire                                       has_aw_pending_trans_m2;
 wire                                       has_ar_pending_trans_m3;
 wire                                       has_aw_pending_trans_m3;
 wire                                       has_ar_pending_trans_m4;
 wire                                       has_aw_pending_trans_m4;
 wire                                       has_ar_pending_trans_m5;
 wire                                       has_aw_pending_trans_m5;
 wire                                       has_ar_pending_trans_m6;
 wire                                       has_aw_pending_trans_m6;
 wire                                       has_ar_pending_trans_m7;
 wire                                       has_aw_pending_trans_m7;
 wire                                       has_ar_pending_trans_m8;
 wire                                       has_aw_pending_trans_m8;
 wire                                       has_ar_pending_trans_m9;
 wire                                       has_aw_pending_trans_m9;
 wire                                        has_ar_pending_trans_m10;
 wire                                        has_aw_pending_trans_m10;
 wire                                        has_ar_pending_trans_m11;
 wire                                        has_aw_pending_trans_m11;
 wire                                        has_ar_pending_trans_m12;
 wire                                        has_aw_pending_trans_m12;
 wire                                        has_ar_pending_trans_m13;
 wire                                        has_aw_pending_trans_m13;
 wire                                        has_ar_pending_trans_m14;
 wire                                        has_aw_pending_trans_m14;
 wire                                        has_ar_pending_trans_m15;
 wire                                        has_aw_pending_trans_m15;
 wire                                        has_ar_pending_trans_m16;
 wire                                        has_aw_pending_trans_m16;


  // Wire declarations for default slave.  
  // Only need to declare signals which make up the payload
  // signals for each channel i.e. all except ready and valid.

  // Read address channel.
  wire  [`AXI_SIDW-1:0]     arid_s0;
  wire  [`AXI_AW-1:0]       araddr_s0;
  wire  [`AXI_BLW-1:0]      arlen_s0;
  wire  [`AXI_BSW-1:0]      arsize_s0;
  wire  [`AXI_BTW-1:0]      arburst_s0;
  wire  [`AXI_LTW-1:0]      arlock_s0;
  wire  [`AXI_CTW-1:0]      arcache_s0;  
  wire  [`AXI_PTW-1:0]      arprot_s0;

  // Read data channel.
  wire [`AXI_SIDW-1:0]     rid_s0;
  wire [`AXI_DW-1:0]       rdata_s0;
  wire                      rlast_s0;
  wire [`AXI_RRW-1:0]      rresp_s0;

  // Write address channel.
  wire  [`AXI_SIDW-1:0]     awid_s0;
  wire  [`AXI_AW-1:0]       awaddr_s0;
  wire  [`AXI_BLW-1:0]      awlen_s0;
  wire  [`AXI_BSW-1:0]      awsize_s0;
  wire  [`AXI_BTW-1:0]      awburst_s0;
  wire  [`AXI_LTW-1:0]      awlock_s0;
  wire  [`AXI_CTW-1:0]      awcache_s0;  
  wire  [`AXI_PTW-1:0]      awprot_s0;

  // Write data channel.
  wire [`AXI_SIDW-1:0]     wid_s0;
  wire [`AXI_DW-1:0]       wdata_s0;
  wire [`AXI_SW-1:0]       wstrb_s0;
  wire                      wlast_s0;

  // Burst response channel.
  wire [`AXI_SIDW-1:0]     bid_s0;
  wire [`AXI_BRW-1:0]      bresp_s0;


  wire [`AXI_NSP1V_M1-1:0] bus_tz_secure_m1;
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each slaves dedicated slave port back to the shared
// slave port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
 
// Ready signals from each masters dedicated master port back to the shared
// master port (i.e. shared to dedicated link).
 
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s0_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s0_m1;
    wire                                      arready_s0_m1;
    wire                                      arvalid_s0_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s0_m1;
    wire                                      rvalid_s0_m1;
    wire                                      rready_s0_m1;
    wire                                      awready_s0_m1;
    wire                                      awvalid_s0_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s0_m1;
    wire                                      wready_s0_m1;
    wire                                      wvalid_s0_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s0_m1;
    wire                                      bvalid_s0_m1;
    wire                                      bready_s0_m1;
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s1_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s1_m1;
    wire                                      arready_s1_m1;
    wire                                      arvalid_s1_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s1_m1;
    wire                                      rvalid_s1_m1;
    wire                                      rready_s1_m1;
    wire                                      awready_s1_m1;
    wire                                      awvalid_s1_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s1_m1;
    wire                                      wready_s1_m1;
    wire                                      wvalid_s1_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s1_m1;
    wire                                      bvalid_s1_m1;
    wire                                      bready_s1_m1;
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s2_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s2_m1;
    wire                                      arready_s2_m1;
    wire                                      arvalid_s2_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s2_m1;
    wire                                      rvalid_s2_m1;
    wire                                      rready_s2_m1;
    wire                                      awready_s2_m1;
    wire                                      awvalid_s2_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s2_m1;
    wire                                      wready_s2_m1;
    wire                                      wvalid_s2_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s2_m1;
    wire                                      bvalid_s2_m1;
    wire                                      bready_s2_m1;
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s3_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s3_m1;
    wire                                      arready_s3_m1;
    wire                                      arvalid_s3_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s3_m1;
    wire                                      rvalid_s3_m1;
    wire                                      rready_s3_m1;
    wire                                      awready_s3_m1;
    wire                                      awvalid_s3_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s3_m1;
    wire                                      wready_s3_m1;
    wire                                      wvalid_s3_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s3_m1;
    wire                                      bvalid_s3_m1;
    wire                                      bready_s3_m1;
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s4_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s4_m1;
    wire                                      arready_s4_m1;
    wire                                      arvalid_s4_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s4_m1;
    wire                                      rvalid_s4_m1;
    wire                                      rready_s4_m1;
    wire                                      awready_s4_m1;
    wire                                      awvalid_s4_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s4_m1;
    wire                                      wready_s4_m1;
    wire                                      wvalid_s4_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s4_m1;
    wire                                      bvalid_s4_m1;
    wire                                      bready_s4_m1;
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s5_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s5_m1;
    wire                                      arready_s5_m1;
    wire                                      arvalid_s5_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s5_m1;
    wire                                      rvalid_s5_m1;
    wire                                      rready_s5_m1;
    wire                                      awready_s5_m1;
    wire                                      awvalid_s5_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s5_m1;
    wire                                      wready_s5_m1;
    wire                                      wvalid_s5_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s5_m1;
    wire                                      bvalid_s5_m1;
    wire                                      bready_s5_m1;
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s6_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s6_m1;
    wire                                      arready_s6_m1;
    wire                                      arvalid_s6_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s6_m1;
    wire                                      rvalid_s6_m1;
    wire                                      rready_s6_m1;
    wire                                      awready_s6_m1;
    wire                                      awvalid_s6_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s6_m1;
    wire                                      wready_s6_m1;
    wire                                      wvalid_s6_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s6_m1;
    wire                                      bvalid_s6_m1;
    wire                                      bready_s6_m1;
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s7_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s7_m1;
    wire                                      arready_s7_m1;
    wire                                      arvalid_s7_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s7_m1;
    wire                                      rvalid_s7_m1;
    wire                                      rready_s7_m1;
    wire                                      awready_s7_m1;
    wire                                      awvalid_s7_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s7_m1;
    wire                                      wready_s7_m1;
    wire                                      wvalid_s7_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s7_m1;
    wire                                      bvalid_s7_m1;
    wire                                      bready_s7_m1;
    wire [`AXI_R_PYLD_M_W-1:0]               rpayload_s8_m1;
    wire [`AXI_B_PYLD_M_W-1:0]               bpayload_s8_m1;
    wire                                      arready_s8_m1;
    wire                                      arvalid_s8_m1;
    wire [`AXI_AR_PYLD_S_W-1:0]               arpayload_s8_m1;
    wire                                      rvalid_s8_m1;
    wire                                      rready_s8_m1;
    wire                                      awready_s8_m1;
    wire                                      awvalid_s8_m1;
    wire [`AXI_AW_PYLD_S_W-1:0]               awpayload_s8_m1;
    wire                                      wready_s8_m1;
    wire                                      wvalid_s8_m1;
    wire [`AXI_W_PYLD_S_W-1:0]               wpayload_s8_m1;
    wire                                      bvalid_s8_m1;
    wire                                      bready_s8_m1;
    wire                                  blank_arready_s0;
    wire                                  blank_arvalid_s0;
    wire                                  blank_arpayload_s0;
    wire                                  blank_rvalid_s0;
    wire                                  blank_rpayload_s0;
    wire                                  blank_rready_s0;
    wire                                  blank_awready_s0;
    wire                                  blank_awvalid_s0;
    wire                                  blank_awpayload_s0;
    wire                                  blank_wready_s0;
    wire                                  blank_wvalid_s0;
    wire                                  blank_wpayload_s0;
    wire                                  blank_bvalid_s0;
    wire                                  blank_bpayload_s0;
    wire                                  blank_bready_s0;
    wire                                  blank_arlocktx_s0;
    wire                                  blank_awlocktx_s0;
    wire                                  blank_arready_s1;
    wire                                  blank_arvalid_s1;
    wire                                  blank_arpayload_s1;
    wire                                  blank_rvalid_s1;
    wire                                  blank_rpayload_s1;
    wire                                  blank_rready_s1;
    wire                                  blank_awready_s1;
    wire                                  blank_awvalid_s1;
    wire                                  blank_awpayload_s1;
    wire                                  blank_wready_s1;
    wire                                  blank_wvalid_s1;
    wire                                  blank_wpayload_s1;
    wire                                  blank_bvalid_s1;
    wire                                  blank_bpayload_s1;
    wire                                  blank_bready_s1;
    wire                                  blank_arlocktx_s1;
    wire                                  blank_awlocktx_s1;
    wire                                  blank_arready_s2;
    wire                                  blank_arvalid_s2;
    wire                                  blank_arpayload_s2;
    wire                                  blank_rvalid_s2;
    wire                                  blank_rpayload_s2;
    wire                                  blank_rready_s2;
    wire                                  blank_awready_s2;
    wire                                  blank_awvalid_s2;
    wire                                  blank_awpayload_s2;
    wire                                  blank_wready_s2;
    wire                                  blank_wvalid_s2;
    wire                                  blank_wpayload_s2;
    wire                                  blank_bvalid_s2;
    wire                                  blank_bpayload_s2;
    wire                                  blank_bready_s2;
    wire                                  blank_arlocktx_s2;
    wire                                  blank_awlocktx_s2;
    wire                                  blank_arready_s3;
    wire                                  blank_arvalid_s3;
    wire                                  blank_arpayload_s3;
    wire                                  blank_rvalid_s3;
    wire                                  blank_rpayload_s3;
    wire                                  blank_rready_s3;
    wire                                  blank_awready_s3;
    wire                                  blank_awvalid_s3;
    wire                                  blank_awpayload_s3;
    wire                                  blank_wready_s3;
    wire                                  blank_wvalid_s3;
    wire                                  blank_wpayload_s3;
    wire                                  blank_bvalid_s3;
    wire                                  blank_bpayload_s3;
    wire                                  blank_bready_s3;
    wire                                  blank_arlocktx_s3;
    wire                                  blank_awlocktx_s3;
    wire                                  blank_arready_s4;
    wire                                  blank_arvalid_s4;
    wire                                  blank_arpayload_s4;
    wire                                  blank_rvalid_s4;
    wire                                  blank_rpayload_s4;
    wire                                  blank_rready_s4;
    wire                                  blank_awready_s4;
    wire                                  blank_awvalid_s4;
    wire                                  blank_awpayload_s4;
    wire                                  blank_wready_s4;
    wire                                  blank_wvalid_s4;
    wire                                  blank_wpayload_s4;
    wire                                  blank_bvalid_s4;
    wire                                  blank_bpayload_s4;
    wire                                  blank_bready_s4;
    wire                                  blank_arlocktx_s4;
    wire                                  blank_awlocktx_s4;
    wire                                  blank_arready_s5;
    wire                                  blank_arvalid_s5;
    wire                                  blank_arpayload_s5;
    wire                                  blank_rvalid_s5;
    wire                                  blank_rpayload_s5;
    wire                                  blank_rready_s5;
    wire                                  blank_awready_s5;
    wire                                  blank_awvalid_s5;
    wire                                  blank_awpayload_s5;
    wire                                  blank_wready_s5;
    wire                                  blank_wvalid_s5;
    wire                                  blank_wpayload_s5;
    wire                                  blank_bvalid_s5;
    wire                                  blank_bpayload_s5;
    wire                                  blank_bready_s5;
    wire                                  blank_arlocktx_s5;
    wire                                  blank_awlocktx_s5;
    wire                                  blank_arready_s6;
    wire                                  blank_arvalid_s6;
    wire                                  blank_arpayload_s6;
    wire                                  blank_rvalid_s6;
    wire                                  blank_rpayload_s6;
    wire                                  blank_rready_s6;
    wire                                  blank_awready_s6;
    wire                                  blank_awvalid_s6;
    wire                                  blank_awpayload_s6;
    wire                                  blank_wready_s6;
    wire                                  blank_wvalid_s6;
    wire                                  blank_wpayload_s6;
    wire                                  blank_bvalid_s6;
    wire                                  blank_bpayload_s6;
    wire                                  blank_bready_s6;
    wire                                  blank_arlocktx_s6;
    wire                                  blank_awlocktx_s6;
    wire                                  blank_arready_s7;
    wire                                  blank_arvalid_s7;
    wire                                  blank_arpayload_s7;
    wire                                  blank_rvalid_s7;
    wire                                  blank_rpayload_s7;
    wire                                  blank_rready_s7;
    wire                                  blank_awready_s7;
    wire                                  blank_awvalid_s7;
    wire                                  blank_awpayload_s7;
    wire                                  blank_wready_s7;
    wire                                  blank_wvalid_s7;
    wire                                  blank_wpayload_s7;
    wire                                  blank_bvalid_s7;
    wire                                  blank_bpayload_s7;
    wire                                  blank_bready_s7;
    wire                                  blank_arlocktx_s7;
    wire                                  blank_awlocktx_s7;
    wire                                  blank_arready_s8;
    wire                                  blank_arvalid_s8;
    wire                                  blank_arpayload_s8;
    wire                                  blank_rvalid_s8;
    wire                                  blank_rpayload_s8;
    wire                                  blank_rready_s8;
    wire                                  blank_awready_s8;
    wire                                  blank_awvalid_s8;
    wire                                  blank_awpayload_s8;
    wire                                  blank_wready_s8;
    wire                                  blank_wvalid_s8;
    wire                                  blank_wpayload_s8;
    wire                                  blank_bvalid_s8;
    wire                                  blank_bpayload_s8;
    wire                                  blank_bready_s8;
    wire                                  blank_arlocktx_s8;
    wire                                  blank_awlocktx_s8;
    wire                                  blank_arvalid_m1;
    wire                                  blank_arready_m1;
    wire                                  blank_arpayload_m1;
    wire                                  blank_rvalid_m1;
    wire                                  blank_rpayload_m1;
    wire                                  blank_rready_m1;
    wire                                  blank_awvalid_m1;
    wire                                  blank_awready_m1;
    wire                                  blank_awpayload_m1;
    wire                                  blank_wvalid_m1;
    wire                                  blank_wpayload_m1;
    wire                                  blank_bvalid_m1;
    wire                                  blank_bpayload_m1;
    wire                                  blank_bready_m1;


  // AR CHANNEL SHARED LAYER SIGNALS

  // Bus of of signals from each master containing a valid signal for each
  // slave connected to the shared AR channel. 
  // Note : the *eb signals contain a dummy extra bit, which makes assignments easier later.
  // The dummy bit is eventually removed in the assignment to the corresponding signal of
  // the correct length.
  // Signals will always be declared but will only be used/synthesised when required.
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m1_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m1_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m2_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m2_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m3_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m3_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m4_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m4_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m5_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m5_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m6_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m6_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m7_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m7_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m8_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m8_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m9_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m9_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m10_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m10_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m11_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m11_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m12_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m12_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m13_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m13_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m14_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m14_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m15_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m15_bus;
    
  
  wire [`AXI_AR_SHARED_LAYER_NS:0] arvalid_s_shrd_m16_bus_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] arvalid_s_shrd_m16_bus;
    

  // *_eb signals contain redundant bits which make configurable assigns easier.
  // Redundant bits removed before connection with destination signals.
  wire [(`AXI_AR_SHARED_LAYER_NS*`AXI_AR_SHARED_LAYER_NM):0] bus_arvalid_sp_shrd_eb;
  wire [(`AXI_AR_SHARED_LAYER_NS*`AXI_AR_SHARED_LAYER_NM)-1:0] bus_arvalid_sp_shrd;
  wire [`AXI_AR_SHARED_LAYER_NM:0] bus_ar_shrd_ch_req_eb;
  wire [`AXI_AR_SHARED_LAYER_NM-1:0] bus_ar_shrd_ch_req;
  wire [(`AXI_AR_PYLD_S_W*`AXI_AR_SHARED_LAYER_NM):0] bus_arpayload_shrd_eb;
  wire [(`AXI_AR_PYLD_S_W*`AXI_AR_SHARED_LAYER_NM)-1:0] bus_arpayload_shrd;
  wire [`AXI_AR_SHARED_LAYER_NM:0] bus_arlocktx_shrd_sp_eb;
  wire [`AXI_AR_SHARED_LAYER_NM-1:0] bus_arlocktx_shrd_sp;
  wire [`AXI_AR_SHARED_LAYER_NM-1:0] bus_arready_shrd_sp_o;

    wire [`AXI_AR_SHARED_LAYER_NS:0] bus_rcpl_tx_shrd_eb;
    wire [`AXI_AR_SHARED_LAYER_NS-1:0] bus_rcpl_tx_shrd;
    

  wire [`AXI_MST_PRIORITY_W*`AXI_AR_SHARED_LAYER_NM:0] ar_shrd_bus_mst_priorities_eb;
  wire [`AXI_MST_PRIORITY_W*`AXI_AR_SHARED_LAYER_NM-1:0] ar_shrd_bus_mst_priorities;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] bus_arvalid_shrd;
  wire [`AXI_AR_SHARED_LAYER_NS:0] bus_arready_shrd_sp_i_eb;
  wire [`AXI_AR_SHARED_LAYER_NS-1:0] bus_arready_shrd_sp_i;
  wire [`AXI_AR_PYLD_S_W-1:0] arpayload_shrd;
  
  wire arvalid_shrd_s0; 
  wire arvalid_shrd_s1; 
  wire arvalid_shrd_s2; 
  wire arvalid_shrd_s3; 
  wire arvalid_shrd_s4; 
  wire arvalid_shrd_s5; 
  wire arvalid_shrd_s6; 
  wire arvalid_shrd_s7; 
  wire arvalid_shrd_s8; 
  wire arvalid_shrd_s9; 
  wire arvalid_shrd_s10; 
  wire arvalid_shrd_s11; 
  wire arvalid_shrd_s12; 
  wire arvalid_shrd_s13; 
  wire arvalid_shrd_s14; 
  wire arvalid_shrd_s15; 
  wire arvalid_shrd_s16; 
  wire arvalid_shrd_sdummy; // Redundant bit, not synthesised.
  
  wire arvalid_ddctd_s0; 
  wire arvalid_ddctd_s1; 
  wire arvalid_ddctd_s2; 
  wire arvalid_ddctd_s3; 
  wire arvalid_ddctd_s4; 
  wire arvalid_ddctd_s5; 
  wire arvalid_ddctd_s6; 
  wire arvalid_ddctd_s7; 
  wire arvalid_ddctd_s8; 
  wire arvalid_ddctd_s9; 
  wire arvalid_ddctd_s10; 
  wire arvalid_ddctd_s11; 
  wire arvalid_ddctd_s12; 
  wire arvalid_ddctd_s13; 
  wire arvalid_ddctd_s14; 
  wire arvalid_ddctd_s15; 
  wire arvalid_ddctd_s16; 

  // Arready signals from shared SP layer to master ports.
  wire arready_shrd_sp_dummy; // Redundant bit, not synthesised.
  wire arready_shrd_sp_m1; 
  wire arready_shrd_sp_m2; 
  wire arready_shrd_sp_m3; 
  wire arready_shrd_sp_m4; 
  wire arready_shrd_sp_m5; 
  wire arready_shrd_sp_m6; 
  wire arready_shrd_sp_m7; 
  wire arready_shrd_sp_m8; 
  wire arready_shrd_sp_m9; 
  wire arready_shrd_sp_m10; 
  wire arready_shrd_sp_m11; 
  wire arready_shrd_sp_m12; 
  wire arready_shrd_sp_m13; 
  wire arready_shrd_sp_m14; 
  wire arready_shrd_sp_m15; 
  wire arready_shrd_sp_m16; 


  // AW CHANNEL SHARED LAYER SIGNALS

  // Bus of of signals from each master containing a valid signal for each
  // slave connected to the shared AW channel. 
  // Note : the *eb signals contain a dummy extra bit, which makes assignments easier later.
  // The dummy bit is eventually removed in the assignment to the corresponding signal of
  // the correct length.
  // Signals will always be declared but will only be used/synthesised when required.
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m1_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m1_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m2_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m2_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m3_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m3_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m4_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m4_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m5_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m5_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m6_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m6_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m7_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m7_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m8_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m8_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m9_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m9_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m10_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m10_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m11_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m11_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m12_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m12_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m13_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m13_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m14_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m14_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m15_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m15_bus;
    
  
  wire [`AXI_AW_SHARED_LAYER_NS:0] awvalid_s_shrd_m16_bus_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] awvalid_s_shrd_m16_bus;
    

  // *_eb signals contain redundant bits which make configurable assigns easier.
  // Redundant bits removed before connection with destination signals.
  wire [(`AXI_AW_SHARED_LAYER_NS*`AXI_AW_SHARED_LAYER_NM):0] bus_awvalid_sp_shrd_eb;
  wire [(`AXI_AW_SHARED_LAYER_NS*`AXI_AW_SHARED_LAYER_NM)-1:0] bus_awvalid_sp_shrd;
  wire [`AXI_AW_SHARED_LAYER_NM:0] bus_aw_shrd_ch_req_eb;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] bus_aw_shrd_ch_req;
  wire [(`AXI_AW_PYLD_S_W*`AXI_AW_SHARED_LAYER_NM):0] bus_awpayload_shrd_eb;
  wire [(`AXI_AW_PYLD_S_W*`AXI_AW_SHARED_LAYER_NM)-1:0] bus_awpayload_shrd;
  wire [`AXI_AW_SHARED_LAYER_NM:0] bus_awlocktx_shrd_sp_eb;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] bus_awlocktx_shrd_sp;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] bus_awready_shrd_sp_o;

    wire [`AXI_AW_SHARED_LAYER_NS:0] bus_wcpl_tx_shrd_eb;
    wire [`AXI_AW_SHARED_LAYER_NS-1:0] bus_wcpl_tx_shrd;

    // Signals to take t/x issued information from the shared AW channel
    // and connect to dedicated W channels.
    // Note the rewiring necessary to go from a one hot master bus of 
    // shared AW visibility, to a one hot master bus of dedicated
    // per slave visibility.
    wire [`AXI_AW_SHARED_LAYER_NS-1:0] issued_wtx_shrd_bus;
    wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh;
    
  wire issued_wtx_shrd_sys_m1_s0;
  wire issued_wtx_shrd_sys_m2_s0;
  wire issued_wtx_shrd_sys_m3_s0;
  wire issued_wtx_shrd_sys_m4_s0;
  wire issued_wtx_shrd_sys_m5_s0;
  wire issued_wtx_shrd_sys_m6_s0;
  wire issued_wtx_shrd_sys_m7_s0;
  wire issued_wtx_shrd_sys_m8_s0;
  wire issued_wtx_shrd_sys_m9_s0;
  wire issued_wtx_shrd_sys_m10_s0;
  wire issued_wtx_shrd_sys_m11_s0;
  wire issued_wtx_shrd_sys_m12_s0;
  wire issued_wtx_shrd_sys_m13_s0;
  wire issued_wtx_shrd_sys_m14_s0;
  wire issued_wtx_shrd_sys_m15_s0;
  wire issued_wtx_shrd_sys_m16_s0;
  wire issued_wtx_shrd_sys_m_dummy_s0;
  wire issued_wtx_shrd_sys_m1_s1;
  wire issued_wtx_shrd_sys_m2_s1;
  wire issued_wtx_shrd_sys_m3_s1;
  wire issued_wtx_shrd_sys_m4_s1;
  wire issued_wtx_shrd_sys_m5_s1;
  wire issued_wtx_shrd_sys_m6_s1;
  wire issued_wtx_shrd_sys_m7_s1;
  wire issued_wtx_shrd_sys_m8_s1;
  wire issued_wtx_shrd_sys_m9_s1;
  wire issued_wtx_shrd_sys_m10_s1;
  wire issued_wtx_shrd_sys_m11_s1;
  wire issued_wtx_shrd_sys_m12_s1;
  wire issued_wtx_shrd_sys_m13_s1;
  wire issued_wtx_shrd_sys_m14_s1;
  wire issued_wtx_shrd_sys_m15_s1;
  wire issued_wtx_shrd_sys_m16_s1;
  wire issued_wtx_shrd_sys_m_dummy_s1;
  wire issued_wtx_shrd_sys_m1_s2;
  wire issued_wtx_shrd_sys_m2_s2;
  wire issued_wtx_shrd_sys_m3_s2;
  wire issued_wtx_shrd_sys_m4_s2;
  wire issued_wtx_shrd_sys_m5_s2;
  wire issued_wtx_shrd_sys_m6_s2;
  wire issued_wtx_shrd_sys_m7_s2;
  wire issued_wtx_shrd_sys_m8_s2;
  wire issued_wtx_shrd_sys_m9_s2;
  wire issued_wtx_shrd_sys_m10_s2;
  wire issued_wtx_shrd_sys_m11_s2;
  wire issued_wtx_shrd_sys_m12_s2;
  wire issued_wtx_shrd_sys_m13_s2;
  wire issued_wtx_shrd_sys_m14_s2;
  wire issued_wtx_shrd_sys_m15_s2;
  wire issued_wtx_shrd_sys_m16_s2;
  wire issued_wtx_shrd_sys_m_dummy_s2;
  wire issued_wtx_shrd_sys_m1_s3;
  wire issued_wtx_shrd_sys_m2_s3;
  wire issued_wtx_shrd_sys_m3_s3;
  wire issued_wtx_shrd_sys_m4_s3;
  wire issued_wtx_shrd_sys_m5_s3;
  wire issued_wtx_shrd_sys_m6_s3;
  wire issued_wtx_shrd_sys_m7_s3;
  wire issued_wtx_shrd_sys_m8_s3;
  wire issued_wtx_shrd_sys_m9_s3;
  wire issued_wtx_shrd_sys_m10_s3;
  wire issued_wtx_shrd_sys_m11_s3;
  wire issued_wtx_shrd_sys_m12_s3;
  wire issued_wtx_shrd_sys_m13_s3;
  wire issued_wtx_shrd_sys_m14_s3;
  wire issued_wtx_shrd_sys_m15_s3;
  wire issued_wtx_shrd_sys_m16_s3;
  wire issued_wtx_shrd_sys_m_dummy_s3;
  wire issued_wtx_shrd_sys_m1_s4;
  wire issued_wtx_shrd_sys_m2_s4;
  wire issued_wtx_shrd_sys_m3_s4;
  wire issued_wtx_shrd_sys_m4_s4;
  wire issued_wtx_shrd_sys_m5_s4;
  wire issued_wtx_shrd_sys_m6_s4;
  wire issued_wtx_shrd_sys_m7_s4;
  wire issued_wtx_shrd_sys_m8_s4;
  wire issued_wtx_shrd_sys_m9_s4;
  wire issued_wtx_shrd_sys_m10_s4;
  wire issued_wtx_shrd_sys_m11_s4;
  wire issued_wtx_shrd_sys_m12_s4;
  wire issued_wtx_shrd_sys_m13_s4;
  wire issued_wtx_shrd_sys_m14_s4;
  wire issued_wtx_shrd_sys_m15_s4;
  wire issued_wtx_shrd_sys_m16_s4;
  wire issued_wtx_shrd_sys_m_dummy_s4;
  wire issued_wtx_shrd_sys_m1_s5;
  wire issued_wtx_shrd_sys_m2_s5;
  wire issued_wtx_shrd_sys_m3_s5;
  wire issued_wtx_shrd_sys_m4_s5;
  wire issued_wtx_shrd_sys_m5_s5;
  wire issued_wtx_shrd_sys_m6_s5;
  wire issued_wtx_shrd_sys_m7_s5;
  wire issued_wtx_shrd_sys_m8_s5;
  wire issued_wtx_shrd_sys_m9_s5;
  wire issued_wtx_shrd_sys_m10_s5;
  wire issued_wtx_shrd_sys_m11_s5;
  wire issued_wtx_shrd_sys_m12_s5;
  wire issued_wtx_shrd_sys_m13_s5;
  wire issued_wtx_shrd_sys_m14_s5;
  wire issued_wtx_shrd_sys_m15_s5;
  wire issued_wtx_shrd_sys_m16_s5;
  wire issued_wtx_shrd_sys_m_dummy_s5;
  wire issued_wtx_shrd_sys_m1_s6;
  wire issued_wtx_shrd_sys_m2_s6;
  wire issued_wtx_shrd_sys_m3_s6;
  wire issued_wtx_shrd_sys_m4_s6;
  wire issued_wtx_shrd_sys_m5_s6;
  wire issued_wtx_shrd_sys_m6_s6;
  wire issued_wtx_shrd_sys_m7_s6;
  wire issued_wtx_shrd_sys_m8_s6;
  wire issued_wtx_shrd_sys_m9_s6;
  wire issued_wtx_shrd_sys_m10_s6;
  wire issued_wtx_shrd_sys_m11_s6;
  wire issued_wtx_shrd_sys_m12_s6;
  wire issued_wtx_shrd_sys_m13_s6;
  wire issued_wtx_shrd_sys_m14_s6;
  wire issued_wtx_shrd_sys_m15_s6;
  wire issued_wtx_shrd_sys_m16_s6;
  wire issued_wtx_shrd_sys_m_dummy_s6;
  wire issued_wtx_shrd_sys_m1_s7;
  wire issued_wtx_shrd_sys_m2_s7;
  wire issued_wtx_shrd_sys_m3_s7;
  wire issued_wtx_shrd_sys_m4_s7;
  wire issued_wtx_shrd_sys_m5_s7;
  wire issued_wtx_shrd_sys_m6_s7;
  wire issued_wtx_shrd_sys_m7_s7;
  wire issued_wtx_shrd_sys_m8_s7;
  wire issued_wtx_shrd_sys_m9_s7;
  wire issued_wtx_shrd_sys_m10_s7;
  wire issued_wtx_shrd_sys_m11_s7;
  wire issued_wtx_shrd_sys_m12_s7;
  wire issued_wtx_shrd_sys_m13_s7;
  wire issued_wtx_shrd_sys_m14_s7;
  wire issued_wtx_shrd_sys_m15_s7;
  wire issued_wtx_shrd_sys_m16_s7;
  wire issued_wtx_shrd_sys_m_dummy_s7;
  wire issued_wtx_shrd_sys_m1_s8;
  wire issued_wtx_shrd_sys_m2_s8;
  wire issued_wtx_shrd_sys_m3_s8;
  wire issued_wtx_shrd_sys_m4_s8;
  wire issued_wtx_shrd_sys_m5_s8;
  wire issued_wtx_shrd_sys_m6_s8;
  wire issued_wtx_shrd_sys_m7_s8;
  wire issued_wtx_shrd_sys_m8_s8;
  wire issued_wtx_shrd_sys_m9_s8;
  wire issued_wtx_shrd_sys_m10_s8;
  wire issued_wtx_shrd_sys_m11_s8;
  wire issued_wtx_shrd_sys_m12_s8;
  wire issued_wtx_shrd_sys_m13_s8;
  wire issued_wtx_shrd_sys_m14_s8;
  wire issued_wtx_shrd_sys_m15_s8;
  wire issued_wtx_shrd_sys_m16_s8;
  wire issued_wtx_shrd_sys_m_dummy_s8;
  wire issued_wtx_shrd_sys_m1_s9;
  wire issued_wtx_shrd_sys_m2_s9;
  wire issued_wtx_shrd_sys_m3_s9;
  wire issued_wtx_shrd_sys_m4_s9;
  wire issued_wtx_shrd_sys_m5_s9;
  wire issued_wtx_shrd_sys_m6_s9;
  wire issued_wtx_shrd_sys_m7_s9;
  wire issued_wtx_shrd_sys_m8_s9;
  wire issued_wtx_shrd_sys_m9_s9;
  wire issued_wtx_shrd_sys_m10_s9;
  wire issued_wtx_shrd_sys_m11_s9;
  wire issued_wtx_shrd_sys_m12_s9;
  wire issued_wtx_shrd_sys_m13_s9;
  wire issued_wtx_shrd_sys_m14_s9;
  wire issued_wtx_shrd_sys_m15_s9;
  wire issued_wtx_shrd_sys_m16_s9;
  wire issued_wtx_shrd_sys_m_dummy_s9;
  wire issued_wtx_shrd_sys_m1_s10;
  wire issued_wtx_shrd_sys_m2_s10;
  wire issued_wtx_shrd_sys_m3_s10;
  wire issued_wtx_shrd_sys_m4_s10;
  wire issued_wtx_shrd_sys_m5_s10;
  wire issued_wtx_shrd_sys_m6_s10;
  wire issued_wtx_shrd_sys_m7_s10;
  wire issued_wtx_shrd_sys_m8_s10;
  wire issued_wtx_shrd_sys_m9_s10;
  wire issued_wtx_shrd_sys_m10_s10;
  wire issued_wtx_shrd_sys_m11_s10;
  wire issued_wtx_shrd_sys_m12_s10;
  wire issued_wtx_shrd_sys_m13_s10;
  wire issued_wtx_shrd_sys_m14_s10;
  wire issued_wtx_shrd_sys_m15_s10;
  wire issued_wtx_shrd_sys_m16_s10;
  wire issued_wtx_shrd_sys_m_dummy_s10;
  wire issued_wtx_shrd_sys_m1_s11;
  wire issued_wtx_shrd_sys_m2_s11;
  wire issued_wtx_shrd_sys_m3_s11;
  wire issued_wtx_shrd_sys_m4_s11;
  wire issued_wtx_shrd_sys_m5_s11;
  wire issued_wtx_shrd_sys_m6_s11;
  wire issued_wtx_shrd_sys_m7_s11;
  wire issued_wtx_shrd_sys_m8_s11;
  wire issued_wtx_shrd_sys_m9_s11;
  wire issued_wtx_shrd_sys_m10_s11;
  wire issued_wtx_shrd_sys_m11_s11;
  wire issued_wtx_shrd_sys_m12_s11;
  wire issued_wtx_shrd_sys_m13_s11;
  wire issued_wtx_shrd_sys_m14_s11;
  wire issued_wtx_shrd_sys_m15_s11;
  wire issued_wtx_shrd_sys_m16_s11;
  wire issued_wtx_shrd_sys_m_dummy_s11;
  wire issued_wtx_shrd_sys_m1_s12;
  wire issued_wtx_shrd_sys_m2_s12;
  wire issued_wtx_shrd_sys_m3_s12;
  wire issued_wtx_shrd_sys_m4_s12;
  wire issued_wtx_shrd_sys_m5_s12;
  wire issued_wtx_shrd_sys_m6_s12;
  wire issued_wtx_shrd_sys_m7_s12;
  wire issued_wtx_shrd_sys_m8_s12;
  wire issued_wtx_shrd_sys_m9_s12;
  wire issued_wtx_shrd_sys_m10_s12;
  wire issued_wtx_shrd_sys_m11_s12;
  wire issued_wtx_shrd_sys_m12_s12;
  wire issued_wtx_shrd_sys_m13_s12;
  wire issued_wtx_shrd_sys_m14_s12;
  wire issued_wtx_shrd_sys_m15_s12;
  wire issued_wtx_shrd_sys_m16_s12;
  wire issued_wtx_shrd_sys_m_dummy_s12;
  wire issued_wtx_shrd_sys_m1_s13;
  wire issued_wtx_shrd_sys_m2_s13;
  wire issued_wtx_shrd_sys_m3_s13;
  wire issued_wtx_shrd_sys_m4_s13;
  wire issued_wtx_shrd_sys_m5_s13;
  wire issued_wtx_shrd_sys_m6_s13;
  wire issued_wtx_shrd_sys_m7_s13;
  wire issued_wtx_shrd_sys_m8_s13;
  wire issued_wtx_shrd_sys_m9_s13;
  wire issued_wtx_shrd_sys_m10_s13;
  wire issued_wtx_shrd_sys_m11_s13;
  wire issued_wtx_shrd_sys_m12_s13;
  wire issued_wtx_shrd_sys_m13_s13;
  wire issued_wtx_shrd_sys_m14_s13;
  wire issued_wtx_shrd_sys_m15_s13;
  wire issued_wtx_shrd_sys_m16_s13;
  wire issued_wtx_shrd_sys_m_dummy_s13;
  wire issued_wtx_shrd_sys_m1_s14;
  wire issued_wtx_shrd_sys_m2_s14;
  wire issued_wtx_shrd_sys_m3_s14;
  wire issued_wtx_shrd_sys_m4_s14;
  wire issued_wtx_shrd_sys_m5_s14;
  wire issued_wtx_shrd_sys_m6_s14;
  wire issued_wtx_shrd_sys_m7_s14;
  wire issued_wtx_shrd_sys_m8_s14;
  wire issued_wtx_shrd_sys_m9_s14;
  wire issued_wtx_shrd_sys_m10_s14;
  wire issued_wtx_shrd_sys_m11_s14;
  wire issued_wtx_shrd_sys_m12_s14;
  wire issued_wtx_shrd_sys_m13_s14;
  wire issued_wtx_shrd_sys_m14_s14;
  wire issued_wtx_shrd_sys_m15_s14;
  wire issued_wtx_shrd_sys_m16_s14;
  wire issued_wtx_shrd_sys_m_dummy_s14;
  wire issued_wtx_shrd_sys_m1_s15;
  wire issued_wtx_shrd_sys_m2_s15;
  wire issued_wtx_shrd_sys_m3_s15;
  wire issued_wtx_shrd_sys_m4_s15;
  wire issued_wtx_shrd_sys_m5_s15;
  wire issued_wtx_shrd_sys_m6_s15;
  wire issued_wtx_shrd_sys_m7_s15;
  wire issued_wtx_shrd_sys_m8_s15;
  wire issued_wtx_shrd_sys_m9_s15;
  wire issued_wtx_shrd_sys_m10_s15;
  wire issued_wtx_shrd_sys_m11_s15;
  wire issued_wtx_shrd_sys_m12_s15;
  wire issued_wtx_shrd_sys_m13_s15;
  wire issued_wtx_shrd_sys_m14_s15;
  wire issued_wtx_shrd_sys_m15_s15;
  wire issued_wtx_shrd_sys_m16_s15;
  wire issued_wtx_shrd_sys_m_dummy_s15;
  wire issued_wtx_shrd_sys_m1_s16;
  wire issued_wtx_shrd_sys_m2_s16;
  wire issued_wtx_shrd_sys_m3_s16;
  wire issued_wtx_shrd_sys_m4_s16;
  wire issued_wtx_shrd_sys_m5_s16;
  wire issued_wtx_shrd_sys_m6_s16;
  wire issued_wtx_shrd_sys_m7_s16;
  wire issued_wtx_shrd_sys_m8_s16;
  wire issued_wtx_shrd_sys_m9_s16;
  wire issued_wtx_shrd_sys_m10_s16;
  wire issued_wtx_shrd_sys_m11_s16;
  wire issued_wtx_shrd_sys_m12_s16;
  wire issued_wtx_shrd_sys_m13_s16;
  wire issued_wtx_shrd_sys_m14_s16;
  wire issued_wtx_shrd_sys_m15_s16;
  wire issued_wtx_shrd_sys_m16_s16;
  wire issued_wtx_shrd_sys_m_dummy_s16;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s0;
  wire [`AXI_NMV_S0:0] issued_wtx_shrd_mst_oh_s0_eb;
  wire [`AXI_NMV_S0-1:0] issued_wtx_shrd_mst_oh_s0;
  wire issued_wtx_shrd_sys_s0;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s1;
  wire [`AXI_NMV_S1:0] issued_wtx_shrd_mst_oh_s1_eb;
  wire [`AXI_NMV_S1-1:0] issued_wtx_shrd_mst_oh_s1;
  wire issued_wtx_shrd_sys_s1;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s2;
  wire [`AXI_NMV_S2:0] issued_wtx_shrd_mst_oh_s2_eb;
  wire [`AXI_NMV_S2-1:0] issued_wtx_shrd_mst_oh_s2;
  wire issued_wtx_shrd_sys_s2;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s3;
  wire [`AXI_NMV_S3:0] issued_wtx_shrd_mst_oh_s3_eb;
  wire [`AXI_NMV_S3-1:0] issued_wtx_shrd_mst_oh_s3;
  wire issued_wtx_shrd_sys_s3;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s4;
  wire [`AXI_NMV_S4:0] issued_wtx_shrd_mst_oh_s4_eb;
  wire [`AXI_NMV_S4-1:0] issued_wtx_shrd_mst_oh_s4;
  wire issued_wtx_shrd_sys_s4;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s5;
  wire [`AXI_NMV_S5:0] issued_wtx_shrd_mst_oh_s5_eb;
  wire [`AXI_NMV_S5-1:0] issued_wtx_shrd_mst_oh_s5;
  wire issued_wtx_shrd_sys_s5;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s6;
  wire [`AXI_NMV_S6:0] issued_wtx_shrd_mst_oh_s6_eb;
  wire [`AXI_NMV_S6-1:0] issued_wtx_shrd_mst_oh_s6;
  wire issued_wtx_shrd_sys_s6;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s7;
  wire [`AXI_NMV_S7:0] issued_wtx_shrd_mst_oh_s7_eb;
  wire [`AXI_NMV_S7-1:0] issued_wtx_shrd_mst_oh_s7;
  wire issued_wtx_shrd_sys_s7;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s8;
  wire [`AXI_NMV_S8:0] issued_wtx_shrd_mst_oh_s8_eb;
  wire [`AXI_NMV_S8-1:0] issued_wtx_shrd_mst_oh_s8;
  wire issued_wtx_shrd_sys_s8;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s9;
  wire [`AXI_NMV_S9:0] issued_wtx_shrd_mst_oh_s9_eb;
  wire [`AXI_NMV_S9-1:0] issued_wtx_shrd_mst_oh_s9;
  wire issued_wtx_shrd_sys_s9;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s10;
  wire [`AXI_NMV_S10:0] issued_wtx_shrd_mst_oh_s10_eb;
  wire [`AXI_NMV_S10-1:0] issued_wtx_shrd_mst_oh_s10;
  wire issued_wtx_shrd_sys_s10;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s11;
  wire [`AXI_NMV_S11:0] issued_wtx_shrd_mst_oh_s11_eb;
  wire [`AXI_NMV_S11-1:0] issued_wtx_shrd_mst_oh_s11;
  wire issued_wtx_shrd_sys_s11;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s12;
  wire [`AXI_NMV_S12:0] issued_wtx_shrd_mst_oh_s12_eb;
  wire [`AXI_NMV_S12-1:0] issued_wtx_shrd_mst_oh_s12;
  wire issued_wtx_shrd_sys_s12;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s13;
  wire [`AXI_NMV_S13:0] issued_wtx_shrd_mst_oh_s13_eb;
  wire [`AXI_NMV_S13-1:0] issued_wtx_shrd_mst_oh_s13;
  wire issued_wtx_shrd_sys_s13;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s14;
  wire [`AXI_NMV_S14:0] issued_wtx_shrd_mst_oh_s14_eb;
  wire [`AXI_NMV_S14-1:0] issued_wtx_shrd_mst_oh_s14;
  wire issued_wtx_shrd_sys_s14;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s15;
  wire [`AXI_NMV_S15:0] issued_wtx_shrd_mst_oh_s15_eb;
  wire [`AXI_NMV_S15-1:0] issued_wtx_shrd_mst_oh_s15;
  wire issued_wtx_shrd_sys_s15;
  wire [`AXI_AW_SHARED_LAYER_NM-1:0] issued_wtx_shrd_mst_oh_irs_apl_s16;
  wire [`AXI_NMV_S16:0] issued_wtx_shrd_mst_oh_s16_eb;
  wire [`AXI_NMV_S16-1:0] issued_wtx_shrd_mst_oh_s16;
  wire issued_wtx_shrd_sys_s16;
  wire issued_wtx_shrd_sys_s_dummy;

  wire [`AXI_MST_PRIORITY_W*`AXI_AW_SHARED_LAYER_NM:0] aw_shrd_bus_mst_priorities_eb;
  wire [`AXI_MST_PRIORITY_W*`AXI_AW_SHARED_LAYER_NM-1:0] aw_shrd_bus_mst_priorities;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] bus_awvalid_shrd;
  wire [`AXI_AW_SHARED_LAYER_NS:0] bus_awready_shrd_sp_i_eb;
  wire [`AXI_AW_SHARED_LAYER_NS-1:0] bus_awready_shrd_sp_i;
  wire [`AXI_AW_PYLD_S_W-1:0] awpayload_shrd;
  
  wire awvalid_shrd_s0; 
  wire awvalid_shrd_s1; 
  wire awvalid_shrd_s2; 
  wire awvalid_shrd_s3; 
  wire awvalid_shrd_s4; 
  wire awvalid_shrd_s5; 
  wire awvalid_shrd_s6; 
  wire awvalid_shrd_s7; 
  wire awvalid_shrd_s8; 
  wire awvalid_shrd_s9; 
  wire awvalid_shrd_s10; 
  wire awvalid_shrd_s11; 
  wire awvalid_shrd_s12; 
  wire awvalid_shrd_s13; 
  wire awvalid_shrd_s14; 
  wire awvalid_shrd_s15; 
  wire awvalid_shrd_s16; 
  wire awvalid_shrd_sdummy; // Redundant bit, not synthesised.
  
  wire awvalid_ddctd_s0; 
  wire awvalid_ddctd_s1; 
  wire awvalid_ddctd_s2; 
  wire awvalid_ddctd_s3; 
  wire awvalid_ddctd_s4; 
  wire awvalid_ddctd_s5; 
  wire awvalid_ddctd_s6; 
  wire awvalid_ddctd_s7; 
  wire awvalid_ddctd_s8; 
  wire awvalid_ddctd_s9; 
  wire awvalid_ddctd_s10; 
  wire awvalid_ddctd_s11; 
  wire awvalid_ddctd_s12; 
  wire awvalid_ddctd_s13; 
  wire awvalid_ddctd_s14; 
  wire awvalid_ddctd_s15; 
  wire awvalid_ddctd_s16; 

  // Arready signals from shared SP layer to master ports.
  wire awready_shrd_sp_dummy; // Redundant bit, not synthesised.
  wire awready_shrd_sp_m1; 
  wire awready_shrd_sp_m2; 
  wire awready_shrd_sp_m3; 
  wire awready_shrd_sp_m4; 
  wire awready_shrd_sp_m5; 
  wire awready_shrd_sp_m6; 
  wire awready_shrd_sp_m7; 
  wire awready_shrd_sp_m8; 
  wire awready_shrd_sp_m9; 
  wire awready_shrd_sp_m10; 
  wire awready_shrd_sp_m11; 
  wire awready_shrd_sp_m12; 
  wire awready_shrd_sp_m13; 
  wire awready_shrd_sp_m14; 
  wire awready_shrd_sp_m15; 
  wire awready_shrd_sp_m16; 


  // W CHANNEL SHARED LAYER SIGNALS

  // Bus of of signals from each master containing a valid signal for each
  // slave connected to the shared W channel. 
  // Note : the *eb signals contain a dummy extra bit, which makes assignments easier later.
  // The dummy bit is eventually removed in the assignment to the corresponding signal of
  // the correct length.
  // Signals will always be declared but will only be used/synthesised when required.
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m1_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m1_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m2_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m2_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m3_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m3_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m4_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m4_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m5_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m5_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m6_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m6_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m7_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m7_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m8_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m8_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m9_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m9_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m10_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m10_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m11_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m11_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m12_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m12_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m13_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m13_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m14_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m14_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m15_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m15_bus;
    
  
  wire [`AXI_W_SHARED_LAYER_NS:0] wvalid_s_shrd_m16_bus_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] wvalid_s_shrd_m16_bus;
    

  // *_eb signals contain redundant bits which make configurable assigns easier.
  // Redundant bits removed before connection with destination signals.
  wire [(`AXI_W_SHARED_LAYER_NS*`AXI_W_SHARED_LAYER_NM):0] bus_wvalid_sp_shrd_eb;
  wire [(`AXI_W_SHARED_LAYER_NS*`AXI_W_SHARED_LAYER_NM)-1:0] bus_wvalid_sp_shrd;
  wire [`AXI_W_SHARED_LAYER_NM:0] bus_w_shrd_ch_req_eb;
  wire [`AXI_W_SHARED_LAYER_NM-1:0] bus_w_shrd_ch_req;
  wire [(`AXI_W_PYLD_S_W*`AXI_W_SHARED_LAYER_NM):0] bus_wpayload_shrd_eb;
  wire [(`AXI_W_PYLD_S_W*`AXI_W_SHARED_LAYER_NM)-1:0] bus_wpayload_shrd;
  wire [`AXI_W_SHARED_LAYER_NM:0] bus_wlocktx_shrd_sp_eb;
  wire [`AXI_W_SHARED_LAYER_NM-1:0] bus_wlocktx_shrd_sp;
  wire [`AXI_W_SHARED_LAYER_NM-1:0] bus_wready_shrd_sp_o;

  wire [`AXI_MST_PRIORITY_W*`AXI_W_SHARED_LAYER_NM:0] w_shrd_bus_mst_priorities_eb;
  wire [`AXI_MST_PRIORITY_W*`AXI_W_SHARED_LAYER_NM-1:0] w_shrd_bus_mst_priorities;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] bus_wvalid_shrd;
  wire [`AXI_W_SHARED_LAYER_NS:0] bus_wready_shrd_sp_i_eb;
  wire [`AXI_W_SHARED_LAYER_NS-1:0] bus_wready_shrd_sp_i;
  wire [`AXI_W_PYLD_S_W-1:0] wpayload_shrd;
  
  wire wvalid_shrd_s0; 
  wire wvalid_shrd_s1; 
  wire wvalid_shrd_s2; 
  wire wvalid_shrd_s3; 
  wire wvalid_shrd_s4; 
  wire wvalid_shrd_s5; 
  wire wvalid_shrd_s6; 
  wire wvalid_shrd_s7; 
  wire wvalid_shrd_s8; 
  wire wvalid_shrd_s9; 
  wire wvalid_shrd_s10; 
  wire wvalid_shrd_s11; 
  wire wvalid_shrd_s12; 
  wire wvalid_shrd_s13; 
  wire wvalid_shrd_s14; 
  wire wvalid_shrd_s15; 
  wire wvalid_shrd_s16; 
  wire wvalid_shrd_sdummy; // Redundant bit, not synthesised.
  
  wire wvalid_ddctd_s0; 
  wire wvalid_ddctd_s1; 
  wire wvalid_ddctd_s2; 
  wire wvalid_ddctd_s3; 
  wire wvalid_ddctd_s4; 
  wire wvalid_ddctd_s5; 
  wire wvalid_ddctd_s6; 
  wire wvalid_ddctd_s7; 
  wire wvalid_ddctd_s8; 
  wire wvalid_ddctd_s9; 
  wire wvalid_ddctd_s10; 
  wire wvalid_ddctd_s11; 
  wire wvalid_ddctd_s12; 
  wire wvalid_ddctd_s13; 
  wire wvalid_ddctd_s14; 
  wire wvalid_ddctd_s15; 
  wire wvalid_ddctd_s16; 

  // Arready signals from shared SP layer to master ports.
  wire wready_shrd_sp_dummy; // Redundant bit, not synthesised.
  wire wready_shrd_sp_m1; 
  wire wready_shrd_sp_m2; 
  wire wready_shrd_sp_m3; 
  wire wready_shrd_sp_m4; 
  wire wready_shrd_sp_m5; 
  wire wready_shrd_sp_m6; 
  wire wready_shrd_sp_m7; 
  wire wready_shrd_sp_m8; 
  wire wready_shrd_sp_m9; 
  wire wready_shrd_sp_m10; 
  wire wready_shrd_sp_m11; 
  wire wready_shrd_sp_m12; 
  wire wready_shrd_sp_m13; 
  wire wready_shrd_sp_m14; 
  wire wready_shrd_sp_m15; 
  wire wready_shrd_sp_m16; 
// When the shared to dedicated link exists on the AW channel, it
// is necessary to map the one hot master granted bus from the
// dedicated AW, which will reflect only the masters connected
// to the dedicated (with shared masters represented by a
// single grant bit (msb), to a value that is representative
// of all masters visible to that slave.
// This decoding requires ifdefs and as such is done at the
// top level and sent back to the relevant slave port.
  wire [`AXI_AW_S0_NMV-1:0] issued_wtx_mst_oh_o_s0; 
  wire [`AXI_NMV_S0-1:0] issued_wtx_mst_oh_i_s0; 
  wire [`AXI_NMV_S0:0] issued_wtx_mst_oh_i_eb_s0; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s0; 
  wire issued_wtx_mst_oh_dummy1_s0; 
  wire [`AXI_AW_S1_NMV-1:0] issued_wtx_mst_oh_o_s1; 
  wire [`AXI_NMV_S1-1:0] issued_wtx_mst_oh_i_s1; 
  wire [`AXI_NMV_S1:0] issued_wtx_mst_oh_i_eb_s1; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s1; 
  wire issued_wtx_mst_oh_dummy1_s1; 
  wire [`AXI_AW_S2_NMV-1:0] issued_wtx_mst_oh_o_s2; 
  wire [`AXI_NMV_S2-1:0] issued_wtx_mst_oh_i_s2; 
  wire [`AXI_NMV_S2:0] issued_wtx_mst_oh_i_eb_s2; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s2; 
  wire issued_wtx_mst_oh_dummy1_s2; 
  wire [`AXI_AW_S3_NMV-1:0] issued_wtx_mst_oh_o_s3; 
  wire [`AXI_NMV_S3-1:0] issued_wtx_mst_oh_i_s3; 
  wire [`AXI_NMV_S3:0] issued_wtx_mst_oh_i_eb_s3; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s3; 
  wire issued_wtx_mst_oh_dummy1_s3; 
  wire [`AXI_AW_S4_NMV-1:0] issued_wtx_mst_oh_o_s4; 
  wire [`AXI_NMV_S4-1:0] issued_wtx_mst_oh_i_s4; 
  wire [`AXI_NMV_S4:0] issued_wtx_mst_oh_i_eb_s4; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s4; 
  wire issued_wtx_mst_oh_dummy1_s4; 
  wire [`AXI_AW_S5_NMV-1:0] issued_wtx_mst_oh_o_s5; 
  wire [`AXI_NMV_S5-1:0] issued_wtx_mst_oh_i_s5; 
  wire [`AXI_NMV_S5:0] issued_wtx_mst_oh_i_eb_s5; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s5; 
  wire issued_wtx_mst_oh_dummy1_s5; 
  wire [`AXI_AW_S6_NMV-1:0] issued_wtx_mst_oh_o_s6; 
  wire [`AXI_NMV_S6-1:0] issued_wtx_mst_oh_i_s6; 
  wire [`AXI_NMV_S6:0] issued_wtx_mst_oh_i_eb_s6; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s6; 
  wire issued_wtx_mst_oh_dummy1_s6; 
  wire [`AXI_AW_S7_NMV-1:0] issued_wtx_mst_oh_o_s7; 
  wire [`AXI_NMV_S7-1:0] issued_wtx_mst_oh_i_s7; 
  wire [`AXI_NMV_S7:0] issued_wtx_mst_oh_i_eb_s7; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s7; 
  wire issued_wtx_mst_oh_dummy1_s7; 
  wire [`AXI_AW_S8_NMV-1:0] issued_wtx_mst_oh_o_s8; 
  wire [`AXI_NMV_S8-1:0] issued_wtx_mst_oh_i_s8; 
  wire [`AXI_NMV_S8:0] issued_wtx_mst_oh_i_eb_s8; 
 
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_mst_sys_oh_s8; 
  wire issued_wtx_mst_oh_dummy1_s8; 

  // R CHANNEL SHARED LAYER SIGNALS

  // Bus of of signals from each slave containing a valid signal for each
  // slave connected to the shared R channel. 
  // Note : the *eb signals contain a dummy extra bit, which makes assignments easier later.
  // The dummy bit is eventually removed in the assignment to the corresponding signal of
  // the correct length.
  // Signals will always be declared but will only be used/synthesised when required.
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s0_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s0_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s1_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s1_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s2_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s2_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s3_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s3_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s4_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s4_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s5_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s5_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s6_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s6_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s7_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s7_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s8_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s8_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s9_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s9_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s10_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s10_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s11_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s11_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s12_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s12_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s13_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s13_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s14_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s14_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s15_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s15_bus;
    
  
  wire [`AXI_R_SHARED_LAYER_NM:0] rvalid_m_shrd_s16_bus_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rvalid_m_shrd_s16_bus;
    

  // *_eb signals contain redundant bits which make configurable assigns easier.
  // Redundant bits removed before connection with destination signals.
  wire [(`AXI_R_SHARED_LAYER_NS*`AXI_R_SHARED_LAYER_NM):0] bus_rvalid_mp_shrd_eb;
  wire [(`AXI_R_SHARED_LAYER_NS*`AXI_R_SHARED_LAYER_NM)-1:0] bus_rvalid_mp_shrd;
  wire [`AXI_R_SHARED_LAYER_NS:0] bus_r_shrd_ch_req_eb;
  wire [`AXI_R_SHARED_LAYER_NS-1:0] bus_r_shrd_ch_req;
  wire [(`AXI_R_PYLD_M_W*`AXI_R_SHARED_LAYER_NS):0] bus_rpayload_shrd_eb;
  wire [(`AXI_R_PYLD_M_W*`AXI_R_SHARED_LAYER_NS)-1:0] bus_rpayload_shrd;
  wire [`AXI_R_SHARED_LAYER_NS-1:0] bus_rready_shrd_mp_o;

  // 
  wire [`AXI_R_SHARED_LAYER_NM-1:0] rcpl_tx_shrd_bus;
  wire [`AXI_MIDW-1:0] rcpl_id_shrd;

  // Signals to take t/x completed information from the shared R channel
  // and connect to dedicated address channels.
  // Note the rewiring necessary to go from a one hot master bus of 
  // shared R visibility, to a one hot master bus of dedicated
  // per master visibility.
  
  wire rcpl_tx_shrd_sys_m1;
  wire rcpl_tx_shrd_sys_m2;
  wire rcpl_tx_shrd_sys_m3;
  wire rcpl_tx_shrd_sys_m4;
  wire rcpl_tx_shrd_sys_m5;
  wire rcpl_tx_shrd_sys_m6;
  wire rcpl_tx_shrd_sys_m7;
  wire rcpl_tx_shrd_sys_m8;
  wire rcpl_tx_shrd_sys_m9;
  wire rcpl_tx_shrd_sys_m10;
  wire rcpl_tx_shrd_sys_m11;
  wire rcpl_tx_shrd_sys_m12;
  wire rcpl_tx_shrd_sys_m13;
  wire rcpl_tx_shrd_sys_m14;
  wire rcpl_tx_shrd_sys_m15;
  wire rcpl_tx_shrd_sys_m16;
  wire rcpl_tx_shrd_sys_dummy;

  wire [`AXI_SLV_PRIORITY_W*`AXI_R_SHARED_LAYER_NS:0] r_shrd_bus_slv_priorities_eb;
  wire [`AXI_SLV_PRIORITY_W*`AXI_R_SHARED_LAYER_NS-1:0] r_shrd_bus_slv_priorities;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] bus_rvalid_shrd;
  wire [`AXI_R_SHARED_LAYER_NM:0] bus_rready_shrd_mp_i_eb;
  wire [`AXI_R_SHARED_LAYER_NM-1:0] bus_rready_shrd_mp_i;
  wire [`AXI_R_PYLD_M_W-1:0] rpayload_shrd;
  // Same width as rpayload_shrd if there is no bi-directional
  // command support, this signal is not used in that case.
  wire [`AXI_R_PYLD_M_W-1:0] rpayload_icm_shrd;
  
  wire rvalid_shrd_m1; 
  wire rvalid_shrd_m2; 
  wire rvalid_shrd_m3; 
  wire rvalid_shrd_m4; 
  wire rvalid_shrd_m5; 
  wire rvalid_shrd_m6; 
  wire rvalid_shrd_m7; 
  wire rvalid_shrd_m8; 
  wire rvalid_shrd_m9; 
  wire rvalid_shrd_m10; 
  wire rvalid_shrd_m11; 
  wire rvalid_shrd_m12; 
  wire rvalid_shrd_m13; 
  wire rvalid_shrd_m14; 
  wire rvalid_shrd_m15; 
  wire rvalid_shrd_m16; 
  wire rvalid_shrd_mdummy; // Redundant bit, not synthesised.
  
  wire rvalid_ddctd_m1; 
  wire rvalid_ddctd_m2; 
  wire rvalid_ddctd_m3; 
  wire rvalid_ddctd_m4; 
  wire rvalid_ddctd_m5; 
  wire rvalid_ddctd_m6; 
  wire rvalid_ddctd_m7; 
  wire rvalid_ddctd_m8; 
  wire rvalid_ddctd_m9; 
  wire rvalid_ddctd_m10; 
  wire rvalid_ddctd_m11; 
  wire rvalid_ddctd_m12; 
  wire rvalid_ddctd_m13; 
  wire rvalid_ddctd_m14; 
  wire rvalid_ddctd_m15; 
  wire rvalid_ddctd_m16; 

  // Arready signals from shared MP layer to slave ports.
  wire rready_shrd_mp_dummy; // Redundant bit, not synthesised.
  wire rready_shrd_mp_s0; 
  wire rready_shrd_mp_s1; 
  wire rready_shrd_mp_s2; 
  wire rready_shrd_mp_s3; 
  wire rready_shrd_mp_s4; 
  wire rready_shrd_mp_s5; 
  wire rready_shrd_mp_s6; 
  wire rready_shrd_mp_s7; 
  wire rready_shrd_mp_s8; 
  wire rready_shrd_mp_s9; 
  wire rready_shrd_mp_s10; 
  wire rready_shrd_mp_s11; 
  wire rready_shrd_mp_s12; 
  wire rready_shrd_mp_s13; 
  wire rready_shrd_mp_s14; 
  wire rready_shrd_mp_s15; 
  wire rready_shrd_mp_s16; 

  // B CHANNEL SHARED LAYER SIGNALS

  // Bus of of signals from each slave containing a valid signal for each
  // slave connected to the shared B channel. 
  // Note : the *eb signals contain a dummy extra bit, which makes assignments easier later.
  // The dummy bit is eventually removed in the assignment to the corresponding signal of
  // the correct length.
  // Signals will always be declared but will only be used/synthesised when required.
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s0_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s0_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s1_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s1_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s2_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s2_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s3_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s3_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s4_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s4_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s5_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s5_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s6_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s6_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s7_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s7_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s8_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s8_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s9_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s9_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s10_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s10_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s11_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s11_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s12_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s12_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s13_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s13_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s14_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s14_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s15_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s15_bus;
    
  
  wire [`AXI_B_SHARED_LAYER_NM:0] bvalid_m_shrd_s16_bus_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bvalid_m_shrd_s16_bus;
    

  // *_eb signals contain redundant bits which make configurable assigns easier.
  // Redundant bits removed before connection with destination signals.
  wire [(`AXI_B_SHARED_LAYER_NS*`AXI_B_SHARED_LAYER_NM):0] bus_bvalid_mp_shrd_eb;
  wire [(`AXI_B_SHARED_LAYER_NS*`AXI_B_SHARED_LAYER_NM)-1:0] bus_bvalid_mp_shrd;
  wire [`AXI_B_SHARED_LAYER_NS:0] bus_b_shrd_ch_req_eb;
  wire [`AXI_B_SHARED_LAYER_NS-1:0] bus_b_shrd_ch_req;
  wire [(`AXI_B_PYLD_M_W*`AXI_B_SHARED_LAYER_NS):0] bus_bpayload_shrd_eb;
  wire [(`AXI_B_PYLD_M_W*`AXI_B_SHARED_LAYER_NS)-1:0] bus_bpayload_shrd;
  wire [`AXI_B_SHARED_LAYER_NS-1:0] bus_bready_shrd_mp_o;

  // 
  wire [`AXI_B_SHARED_LAYER_NM-1:0] wcpl_tx_shrd_bus;
  wire [`AXI_MIDW-1:0] wcpl_id_shrd;

  // Signals to take t/x completed information from the shared B channel
  // and connect to dedicated address channels.
  // Note the rewiring necessary to go from a one hot master bus of 
  // shared B visibility, to a one hot master bus of dedicated
  // per master visibility.
  
  wire wcpl_tx_shrd_sys_m1;
  wire wcpl_tx_shrd_sys_m2;
  wire wcpl_tx_shrd_sys_m3;
  wire wcpl_tx_shrd_sys_m4;
  wire wcpl_tx_shrd_sys_m5;
  wire wcpl_tx_shrd_sys_m6;
  wire wcpl_tx_shrd_sys_m7;
  wire wcpl_tx_shrd_sys_m8;
  wire wcpl_tx_shrd_sys_m9;
  wire wcpl_tx_shrd_sys_m10;
  wire wcpl_tx_shrd_sys_m11;
  wire wcpl_tx_shrd_sys_m12;
  wire wcpl_tx_shrd_sys_m13;
  wire wcpl_tx_shrd_sys_m14;
  wire wcpl_tx_shrd_sys_m15;
  wire wcpl_tx_shrd_sys_m16;
  wire wcpl_tx_shrd_sys_dummy;

  wire [`AXI_SLV_PRIORITY_W*`AXI_B_SHARED_LAYER_NS:0] b_shrd_bus_slv_priorities_eb;
  wire [`AXI_SLV_PRIORITY_W*`AXI_B_SHARED_LAYER_NS-1:0] b_shrd_bus_slv_priorities;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bus_bvalid_shrd;
  wire [`AXI_B_SHARED_LAYER_NM:0] bus_bready_shrd_mp_i_eb;
  wire [`AXI_B_SHARED_LAYER_NM-1:0] bus_bready_shrd_mp_i;
  wire [`AXI_B_PYLD_M_W-1:0] bpayload_shrd;
  // Same width as bpayload_shrd if there is no bi-directional
  // command support, this signal is not used in that case.
  wire [`AXI_B_PYLD_M_W-1:0] bpayload_icm_shrd;
  
  wire bvalid_shrd_m1; 
  wire bvalid_shrd_m2; 
  wire bvalid_shrd_m3; 
  wire bvalid_shrd_m4; 
  wire bvalid_shrd_m5; 
  wire bvalid_shrd_m6; 
  wire bvalid_shrd_m7; 
  wire bvalid_shrd_m8; 
  wire bvalid_shrd_m9; 
  wire bvalid_shrd_m10; 
  wire bvalid_shrd_m11; 
  wire bvalid_shrd_m12; 
  wire bvalid_shrd_m13; 
  wire bvalid_shrd_m14; 
  wire bvalid_shrd_m15; 
  wire bvalid_shrd_m16; 
  wire bvalid_shrd_mdummy; // Redundant bit, not synthesised.
  
  wire bvalid_ddctd_m1; 
  wire bvalid_ddctd_m2; 
  wire bvalid_ddctd_m3; 
  wire bvalid_ddctd_m4; 
  wire bvalid_ddctd_m5; 
  wire bvalid_ddctd_m6; 
  wire bvalid_ddctd_m7; 
  wire bvalid_ddctd_m8; 
  wire bvalid_ddctd_m9; 
  wire bvalid_ddctd_m10; 
  wire bvalid_ddctd_m11; 
  wire bvalid_ddctd_m12; 
  wire bvalid_ddctd_m13; 
  wire bvalid_ddctd_m14; 
  wire bvalid_ddctd_m15; 
  wire bvalid_ddctd_m16; 

  // Arready signals from shared MP layer to slave ports.
  wire bready_shrd_mp_dummy; // Redundant bit, not synthesised.
  wire bready_shrd_mp_s0; 
  wire bready_shrd_mp_s1; 
  wire bready_shrd_mp_s2; 
  wire bready_shrd_mp_s3; 
  wire bready_shrd_mp_s4; 
  wire bready_shrd_mp_s5; 
  wire bready_shrd_mp_s6; 
  wire bready_shrd_mp_s7; 
  wire bready_shrd_mp_s8; 
  wire bready_shrd_mp_s9; 
  wire bready_shrd_mp_s10; 
  wire bready_shrd_mp_s11; 
  wire bready_shrd_mp_s12; 
  wire bready_shrd_mp_s13; 
  wire bready_shrd_mp_s14; 
  wire bready_shrd_mp_s15; 
  wire bready_shrd_mp_s16; 
// Wires for the U_DW_axi_irs_arbpl_aw_shrd_ddctd_sx modules.

// --------------------------------------------------  
// Connect slave port wires to per master port wires.  
wire blank_aw_shrd_lyr_granted_m1_s_bus;
  assign {blank_aw_shrd_lyr_granted_m1_s_bus, aw_shrd_lyr_granted_m1_s_bus} = {1'b0
  , aw_shrd_lyr_granted_s8
  , aw_shrd_lyr_granted_s7
  , aw_shrd_lyr_granted_s6
  , aw_shrd_lyr_granted_s5
  , aw_shrd_lyr_granted_s4
  , aw_shrd_lyr_granted_s3
  , aw_shrd_lyr_granted_s2
  , aw_shrd_lyr_granted_s1
  , aw_shrd_lyr_granted_s0
};

// --------------------------------------------------  
// Create a bus for each master, which contains the 
// issued_wtx_shrd_sys_mx_sy bits for that master from 
// all slaves.
wire blank_issued_wtx_shrd_sys_m1_s_bus;
  assign {blank_issued_wtx_shrd_sys_m1_s_bus, issued_wtx_shrd_sys_m1_s_bus} = {1'b0
  , (`AXI_S8_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s8 : 1'b0)
  , (`AXI_S7_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s7 : 1'b0)
  , (`AXI_S6_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s6 : 1'b0)
  , (`AXI_S5_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s5 : 1'b0)
  , (`AXI_S4_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s4 : 1'b0)
  , (`AXI_S3_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s3 : 1'b0)
  , (`AXI_S2_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s2 : 1'b0)
  , (`AXI_S1_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s1 : 1'b0)
  , (`AXI_S0_ON_AW_SHARED_VAL ? issued_wtx_shrd_sys_m1_s0 : 1'b0)
};





// --------------------------------------------------  
// Connect slave port wires to per master port wires.  
  assign {blank_rvalid_m1, bus_rvalid_m1} = {1'b0
      ,rvalid_s8_m1
      ,rvalid_s7_m1
      ,rvalid_s6_m1
      ,rvalid_s5_m1
      ,rvalid_s4_m1
      ,rvalid_s3_m1
      ,rvalid_s2_m1
      ,rvalid_s1_m1
      ,rvalid_s0_m1
};

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s0 
  , rvalid_s0_m1
 } = {1'b0, sp_rvalid_s0}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s1 
  , rvalid_s1_m1
 } = {1'b0, sp_rvalid_s1}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s2 
  , rvalid_s2_m1
 } = {1'b0, sp_rvalid_s2}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s3 
  , rvalid_s3_m1
 } = {1'b0, sp_rvalid_s3}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s4 
  , rvalid_s4_m1
 } = {1'b0, sp_rvalid_s4}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s5 
  , rvalid_s5_m1
 } = {1'b0, sp_rvalid_s5}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s6 
  , rvalid_s6_m1
 } = {1'b0, sp_rvalid_s6}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s7 
  , rvalid_s7_m1
 } = {1'b0, sp_rvalid_s7}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rvalid_s8 
  , rvalid_s8_m1
 } = {1'b0, sp_rvalid_s8}; 

// --------------------------------------------------  
// Connect slave port wires to per master port wires.  
  assign {blank_bvalid_m1, bus_bvalid_m1} = {1'b0
      ,bvalid_s8_m1
      ,bvalid_s7_m1
      ,bvalid_s6_m1
      ,bvalid_s5_m1
      ,bvalid_s4_m1
      ,bvalid_s3_m1
      ,bvalid_s2_m1
      ,bvalid_s1_m1
      ,bvalid_s0_m1
};

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s0 
  , bvalid_s0_m1
 } = {1'b0, sp_bvalid_s0}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s1 
  , bvalid_s1_m1
 } = {1'b0, sp_bvalid_s1}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s2 
  , bvalid_s2_m1
 } = {1'b0, sp_bvalid_s2}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s3 
  , bvalid_s3_m1
 } = {1'b0, sp_bvalid_s3}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s4 
  , bvalid_s4_m1
 } = {1'b0, sp_bvalid_s4}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s5 
  , bvalid_s5_m1
 } = {1'b0, sp_bvalid_s5}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s6 
  , bvalid_s6_m1
 } = {1'b0, sp_bvalid_s6}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s7 
  , bvalid_s7_m1
 } = {1'b0, sp_bvalid_s7}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bvalid_s8 
  , bvalid_s8_m1
 } = {1'b0, sp_bvalid_s8}; 

// --------------------------------------------------  
// Connect slave port wires to per master port wires.  
  assign {blank_arready_m1, bus_arready_m1} = {1'b0
      ,(`AXI_AR_LAYER_S8_M1 ? arready_shrd_sp_m1 : arready_s8_m1)
      ,(`AXI_AR_LAYER_S7_M1 ? arready_shrd_sp_m1 : arready_s7_m1)
      ,(`AXI_AR_LAYER_S6_M1 ? arready_shrd_sp_m1 : arready_s6_m1)
      ,(`AXI_AR_LAYER_S5_M1 ? arready_shrd_sp_m1 : arready_s5_m1)
      ,(`AXI_AR_LAYER_S4_M1 ? arready_shrd_sp_m1 : arready_s4_m1)
      ,(`AXI_AR_LAYER_S3_M1 ? arready_shrd_sp_m1 : arready_s3_m1)
      ,(`AXI_AR_LAYER_S2_M1 ? arready_shrd_sp_m1 : arready_s2_m1)
      ,(`AXI_AR_LAYER_S1_M1 ? arready_shrd_sp_m1 : arready_s1_m1)
      ,(`AXI_AR_LAYER_S0_M1 ? arready_shrd_sp_m1 : arready_s0_m1)
};

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s0 
    , arready_s0_m1
 } = {1'b0, bus_sp_arready_s0}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s1 
    , arready_s1_m1
 } = {1'b0, bus_sp_arready_s1}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s2 
    , arready_s2_m1
 } = {1'b0, bus_sp_arready_s2}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s3 
    , arready_s3_m1
 } = {1'b0, bus_sp_arready_s3}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s4 
    , arready_s4_m1
 } = {1'b0, bus_sp_arready_s4}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s5 
    , arready_s5_m1
 } = {1'b0, bus_sp_arready_s5}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s6 
    , arready_s6_m1
 } = {1'b0, bus_sp_arready_s6}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s7 
    , arready_s7_m1
 } = {1'b0, bus_sp_arready_s7}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_arready_s8 
    , arready_s8_m1
 } = {1'b0, bus_sp_arready_s8}; 

// --------------------------------------------------  
// Connect slave port wires to per master port wires.  
  assign {blank_awready_m1, bus_awready_m1} = {1'b0
      ,(`AXI_AW_LAYER_S8_M1 ? awready_shrd_sp_m1 : awready_s8_m1)
      ,(`AXI_AW_LAYER_S7_M1 ? awready_shrd_sp_m1 : awready_s7_m1)
      ,(`AXI_AW_LAYER_S6_M1 ? awready_shrd_sp_m1 : awready_s6_m1)
      ,(`AXI_AW_LAYER_S5_M1 ? awready_shrd_sp_m1 : awready_s5_m1)
      ,(`AXI_AW_LAYER_S4_M1 ? awready_shrd_sp_m1 : awready_s4_m1)
      ,(`AXI_AW_LAYER_S3_M1 ? awready_shrd_sp_m1 : awready_s3_m1)
      ,(`AXI_AW_LAYER_S2_M1 ? awready_shrd_sp_m1 : awready_s2_m1)
      ,(`AXI_AW_LAYER_S1_M1 ? awready_shrd_sp_m1 : awready_s1_m1)
      ,(`AXI_AW_LAYER_S0_M1 ? awready_shrd_sp_m1 : awready_s0_m1)
};

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s0 
    , awready_s0_m1
 } = {1'b0, bus_sp_awready_s0}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s1 
    , awready_s1_m1
 } = {1'b0, bus_sp_awready_s1}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s2 
    , awready_s2_m1
 } = {1'b0, bus_sp_awready_s2}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s3 
    , awready_s3_m1
 } = {1'b0, bus_sp_awready_s3}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s4 
    , awready_s4_m1
 } = {1'b0, bus_sp_awready_s4}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s5 
    , awready_s5_m1
 } = {1'b0, bus_sp_awready_s5}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s6 
    , awready_s6_m1
 } = {1'b0, bus_sp_awready_s6}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s7 
    , awready_s7_m1
 } = {1'b0, bus_sp_awready_s7}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_awready_s8 
    , awready_s8_m1
 } = {1'b0, bus_sp_awready_s8}; 

// --------------------------------------------------  
// Connect slave port wires to per master port wires.  
  assign {blank_wready_m1, bus_wready_m1} = {1'b0
      ,(`AXI_W_LAYER_S8_M1 ? wready_shrd_sp_m1 : wready_s8_m1)
      ,(`AXI_W_LAYER_S7_M1 ? wready_shrd_sp_m1 : wready_s7_m1)
      ,(`AXI_W_LAYER_S6_M1 ? wready_shrd_sp_m1 : wready_s6_m1)
      ,(`AXI_W_LAYER_S5_M1 ? wready_shrd_sp_m1 : wready_s5_m1)
      ,(`AXI_W_LAYER_S4_M1 ? wready_shrd_sp_m1 : wready_s4_m1)
      ,(`AXI_W_LAYER_S3_M1 ? wready_shrd_sp_m1 : wready_s3_m1)
      ,(`AXI_W_LAYER_S2_M1 ? wready_shrd_sp_m1 : wready_s2_m1)
      ,(`AXI_W_LAYER_S1_M1 ? wready_shrd_sp_m1 : wready_s1_m1)
      ,(`AXI_W_LAYER_S0_M1 ? wready_shrd_sp_m1 : wready_s0_m1)
};

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s0 
    , wready_s0_m1
 } = {1'b0, bus_sp_wready_s0}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s1 
    , wready_s1_m1
 } = {1'b0, bus_sp_wready_s1}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s2 
    , wready_s2_m1
 } = {1'b0, bus_sp_wready_s2}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s3 
    , wready_s3_m1
 } = {1'b0, bus_sp_wready_s3}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s4 
    , wready_s4_m1
 } = {1'b0, bus_sp_wready_s4}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s5 
    , wready_s5_m1
 } = {1'b0, bus_sp_wready_s5}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s6 
    , wready_s6_m1
 } = {1'b0, bus_sp_wready_s6}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s7 
    , wready_s7_m1
 } = {1'b0, bus_sp_wready_s7}; 

// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_wready_s8 
    , wready_s8_m1
 } = {1'b0, bus_sp_wready_s8}; 
 
// --------------------------------------------------  
// Connect slave port wires to per master port wires.  
// Shared layer always connects as most significant numbered slave.  
// If BIDI is enabled, pass icm with payload to all dedicated master  
// ports, they will strip off extra bits as required.
  wire dummy_bus_rpayload_m1;
  assign {dummy_bus_rpayload_m1, bus_rpayload_m1} = { 1'b0
    , rpayload_s8_m1
    , rpayload_s7_m1
    , rpayload_s6_m1
    , rpayload_s5_m1
    , rpayload_s4_m1
    , rpayload_s3_m1
    , rpayload_s2_m1
    , rpayload_s1_m1
    , rpayload_s0_m1
 };
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s0 
    , rpayload_s0_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s0}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s1 
    , rpayload_s1_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s1}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s2 
    , rpayload_s2_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s2}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s3 
    , rpayload_s3_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s3}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s4 
    , rpayload_s4_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s4}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s5 
    , rpayload_s5_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s5}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s6 
    , rpayload_s6_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s6}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s7 
    , rpayload_s7_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s7}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_rpayload_s8 
    , rpayload_s8_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_rpayload_s8}}}; 
 
// --------------------------------------------------  
// Connect slave port wires to per master port wires.  
// Shared layer always connects as most significant numbered slave.  
// If BIDI is enabled, pass icm with payload to all dedicated master  
// ports, they will strip off extra bits as required.
  wire dummy_bus_bpayload_m1;
  assign {dummy_bus_bpayload_m1, bus_bpayload_m1} = { 1'b0
    , bpayload_s8_m1
    , bpayload_s7_m1
    , bpayload_s6_m1
    , bpayload_s5_m1
    , bpayload_s4_m1
    , bpayload_s3_m1
    , bpayload_s2_m1
    , bpayload_s1_m1
    , bpayload_s0_m1
 };
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s0 
    , bpayload_s0_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s0}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s1 
    , bpayload_s1_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s1}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s2 
    , bpayload_s2_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s2}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s3 
    , bpayload_s3_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s3}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s4 
    , bpayload_s4_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s4}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s5 
    , bpayload_s5_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s5}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s6 
    , bpayload_s6_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s6}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s7 
    , bpayload_s7_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s7}}}; 
// --------------------------------------------------  
// Connect slave port output signals, to individual    
// per master port signals.                            
  assign {blank_bpayload_s8 
    , bpayload_s8_m1
 } = {1'b0, {`AXI_NUM_MASTERS{sp_bpayload_s8}}}; 


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s0, bus_arvalid_s0} = {
     1'b0
      , arvalid_s0_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s1, bus_arvalid_s1} = {
     1'b0
      , arvalid_s1_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s2, bus_arvalid_s2} = {
     1'b0
      , arvalid_s2_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s3, bus_arvalid_s3} = {
     1'b0
      , arvalid_s3_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s4, bus_arvalid_s4} = {
     1'b0
      , arvalid_s4_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s5, bus_arvalid_s5} = {
     1'b0
      , arvalid_s5_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s6, bus_arvalid_s6} = {
     1'b0
      , arvalid_s6_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s7, bus_arvalid_s7} = {
     1'b0
      , arvalid_s7_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arvalid_s8, bus_arvalid_s8} = {
     1'b0
      , arvalid_s8_m1
};









// --------------------------------------------------  
// Connect master port output signals, to individual   
// per slave port signals.                             
  assign { blank_arvalid_m1
  , arvalid_s8_m1
  , arvalid_s7_m1
  , arvalid_s6_m1
  , arvalid_s5_m1
  , arvalid_s4_m1
  , arvalid_s3_m1
  , arvalid_s2_m1
  , arvalid_s1_m1
  , arvalid_s0_m1
  } = {1'b0, {`AXI_NSP1V_M1{mp_arvalid_m1}}};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s0, bus_arpayload_s0} = {
     1'b0
      , arpayload_s0_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s1, bus_arpayload_s1} = {
     1'b0
      , arpayload_s1_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s2, bus_arpayload_s2} = {
     1'b0
      , arpayload_s2_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s3, bus_arpayload_s3} = {
     1'b0
      , arpayload_s3_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s4, bus_arpayload_s4} = {
     1'b0
      , arpayload_s4_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s5, bus_arpayload_s5} = {
     1'b0
      , arpayload_s5_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s6, bus_arpayload_s6} = {
     1'b0
      , arpayload_s6_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s7, bus_arpayload_s7} = {
     1'b0
      , arpayload_s7_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_arpayload_s8, bus_arpayload_s8} = {
     1'b0
      , arpayload_s8_m1
};









// --------------------------------------------------  
// Connect master port output signals, to individual   
// per slave port signals.                             
  assign { blank_arpayload_m1
  , arpayload_s8_m1
  , arpayload_s7_m1
  , arpayload_s6_m1
  , arpayload_s5_m1
  , arpayload_s4_m1
  , arpayload_s3_m1
  , arpayload_s2_m1
  , arpayload_s1_m1
  , arpayload_s0_m1
  } = {1'b0, {`AXI_NSP1V_M1{mp_arpayload_m1}}};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s0, bus_rready_s0} = {
     1'b0
      , (`AXI_R_LAYER_M1_S0 ? rready_shrd_mp_s0 : rready_s0_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s1, bus_rready_s1} = {
     1'b0
      , (`AXI_R_LAYER_M1_S1 ? rready_shrd_mp_s1 : rready_s1_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s2, bus_rready_s2} = {
     1'b0
      , (`AXI_R_LAYER_M1_S2 ? rready_shrd_mp_s2 : rready_s2_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s3, bus_rready_s3} = {
     1'b0
      , (`AXI_R_LAYER_M1_S3 ? rready_shrd_mp_s3 : rready_s3_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s4, bus_rready_s4} = {
     1'b0
      , (`AXI_R_LAYER_M1_S4 ? rready_shrd_mp_s4 : rready_s4_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s5, bus_rready_s5} = {
     1'b0
      , (`AXI_R_LAYER_M1_S5 ? rready_shrd_mp_s5 : rready_s5_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s6, bus_rready_s6} = {
     1'b0
      , (`AXI_R_LAYER_M1_S6 ? rready_shrd_mp_s6 : rready_s6_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s7, bus_rready_s7} = {
     1'b0
      , (`AXI_R_LAYER_M1_S7 ? rready_shrd_mp_s7 : rready_s7_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_rready_s8, bus_rready_s8} = {
     1'b0
      , (`AXI_R_LAYER_M1_S8 ? rready_shrd_mp_s8 : rready_s8_m1)
};









// --------------------------------------------------  
// Connect master port output signals, to individual   
// per slave port signals.                             
  assign { blank_rready_m1
    , rready_s8_m1
    , rready_s7_m1
    , rready_s6_m1
    , rready_s5_m1
    , rready_s4_m1
    , rready_s3_m1
    , rready_s2_m1
    , rready_s1_m1
    , rready_s0_m1
  } = {1'b0, {bus_mp_rready_m1}};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s0, bus_awvalid_s0} = {
     1'b0
      , awvalid_s0_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s1, bus_awvalid_s1} = {
     1'b0
      , awvalid_s1_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s2, bus_awvalid_s2} = {
     1'b0
      , awvalid_s2_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s3, bus_awvalid_s3} = {
     1'b0
      , awvalid_s3_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s4, bus_awvalid_s4} = {
     1'b0
      , awvalid_s4_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s5, bus_awvalid_s5} = {
     1'b0
      , awvalid_s5_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s6, bus_awvalid_s6} = {
     1'b0
      , awvalid_s6_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s7, bus_awvalid_s7} = {
     1'b0
      , awvalid_s7_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awvalid_s8, bus_awvalid_s8} = {
     1'b0
      , awvalid_s8_m1
};









// --------------------------------------------------  
// Connect master port output signals, to individual   
// per slave port signals.                             
  assign { blank_awvalid_m1
  , awvalid_s8_m1
  , awvalid_s7_m1
  , awvalid_s6_m1
  , awvalid_s5_m1
  , awvalid_s4_m1
  , awvalid_s3_m1
  , awvalid_s2_m1
  , awvalid_s1_m1
  , awvalid_s0_m1
  } = {1'b0, {`AXI_NSP1V_M1{mp_awvalid_m1}}};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s0, bus_awpayload_s0} = {
     1'b0
      , awpayload_s0_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s1, bus_awpayload_s1} = {
     1'b0
      , awpayload_s1_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s2, bus_awpayload_s2} = {
     1'b0
      , awpayload_s2_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s3, bus_awpayload_s3} = {
     1'b0
      , awpayload_s3_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s4, bus_awpayload_s4} = {
     1'b0
      , awpayload_s4_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s5, bus_awpayload_s5} = {
     1'b0
      , awpayload_s5_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s6, bus_awpayload_s6} = {
     1'b0
      , awpayload_s6_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s7, bus_awpayload_s7} = {
     1'b0
      , awpayload_s7_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_awpayload_s8, bus_awpayload_s8} = {
     1'b0
      , awpayload_s8_m1
};









// --------------------------------------------------  
// Connect master port output signals, to individual   
// per slave port signals.                             
  assign { blank_awpayload_m1
  , awpayload_s8_m1
  , awpayload_s7_m1
  , awpayload_s6_m1
  , awpayload_s5_m1
  , awpayload_s4_m1
  , awpayload_s3_m1
  , awpayload_s2_m1
  , awpayload_s1_m1
  , awpayload_s0_m1
  } = {1'b0, {`AXI_NSP1V_M1{mp_awpayload_m1}}};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s0, bus_wvalid_s0} = {
     1'b0
      , wvalid_s0_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s1, bus_wvalid_s1} = {
     1'b0
      , wvalid_s1_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s2, bus_wvalid_s2} = {
     1'b0
      , wvalid_s2_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s3, bus_wvalid_s3} = {
     1'b0
      , wvalid_s3_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s4, bus_wvalid_s4} = {
     1'b0
      , wvalid_s4_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s5, bus_wvalid_s5} = {
     1'b0
      , wvalid_s5_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s6, bus_wvalid_s6} = {
     1'b0
      , wvalid_s6_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s7, bus_wvalid_s7} = {
     1'b0
      , wvalid_s7_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wvalid_s8, bus_wvalid_s8} = {
     1'b0
      , wvalid_s8_m1
};









// --------------------------------------------------  
// Connect master port output signals, to individual   
// per slave port signals.                             
  assign { blank_wvalid_m1
  , wvalid_s8_m1
  , wvalid_s7_m1
  , wvalid_s6_m1
  , wvalid_s5_m1
  , wvalid_s4_m1
  , wvalid_s3_m1
  , wvalid_s2_m1
  , wvalid_s1_m1
  , wvalid_s0_m1
  } = {1'b0, {`AXI_NSP1V_M1{mp_wvalid_m1}}};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s0, bus_wpayload_s0} = {
     1'b0
      , wpayload_s0_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s1, bus_wpayload_s1} = {
     1'b0
      , wpayload_s1_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s2, bus_wpayload_s2} = {
     1'b0
      , wpayload_s2_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s3, bus_wpayload_s3} = {
     1'b0
      , wpayload_s3_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s4, bus_wpayload_s4} = {
     1'b0
      , wpayload_s4_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s5, bus_wpayload_s5} = {
     1'b0
      , wpayload_s5_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s6, bus_wpayload_s6} = {
     1'b0
      , wpayload_s6_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s7, bus_wpayload_s7} = {
     1'b0
      , wpayload_s7_m1
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_wpayload_s8, bus_wpayload_s8} = {
     1'b0
      , wpayload_s8_m1
};









// --------------------------------------------------  
// Connect master port output signals, to individual   
// per slave port signals.                             
  assign { blank_wpayload_m1
  , wpayload_s8_m1
  , wpayload_s7_m1
  , wpayload_s6_m1
  , wpayload_s5_m1
  , wpayload_s4_m1
  , wpayload_s3_m1
  , wpayload_s2_m1
  , wpayload_s1_m1
  , wpayload_s0_m1
  } = {1'b0, {`AXI_NSP1V_M1{mp_wpayload_m1}}};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s0, bus_bready_s0} = {
     1'b0
      , (`AXI_B_LAYER_M1_S0 ? bready_shrd_mp_s0 : bready_s0_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s1, bus_bready_s1} = {
     1'b0
      , (`AXI_B_LAYER_M1_S1 ? bready_shrd_mp_s1 : bready_s1_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s2, bus_bready_s2} = {
     1'b0
      , (`AXI_B_LAYER_M1_S2 ? bready_shrd_mp_s2 : bready_s2_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s3, bus_bready_s3} = {
     1'b0
      , (`AXI_B_LAYER_M1_S3 ? bready_shrd_mp_s3 : bready_s3_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s4, bus_bready_s4} = {
     1'b0
      , (`AXI_B_LAYER_M1_S4 ? bready_shrd_mp_s4 : bready_s4_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s5, bus_bready_s5} = {
     1'b0
      , (`AXI_B_LAYER_M1_S5 ? bready_shrd_mp_s5 : bready_s5_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s6, bus_bready_s6} = {
     1'b0
      , (`AXI_B_LAYER_M1_S6 ? bready_shrd_mp_s6 : bready_s6_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s7, bus_bready_s7} = {
     1'b0
      , (`AXI_B_LAYER_M1_S7 ? bready_shrd_mp_s7 : bready_s7_m1)
};


// --------------------------------------------------  
// Connect master port wires to per slave port wires.  
  assign {blank_bready_s8, bus_bready_s8} = {
     1'b0
      , (`AXI_B_LAYER_M1_S8 ? bready_shrd_mp_s8 : bready_s8_m1)
};









// --------------------------------------------------  
// Connect master port output signals, to individual   
// per slave port signals.                             
  assign { blank_bready_m1
    , bready_s8_m1
    , bready_s7_m1
    , bready_s6_m1
    , bready_s5_m1
    , bready_s4_m1
    , bready_s3_m1
    , bready_s2_m1
    , bready_s1_m1
    , bready_s0_m1
  } = {1'b0, {bus_mp_bready_m1}};

 
       // Default Slave 
     
 DW_axi_dfltslv
  #(`AXI_SIDW) U_DW_axi_dfltslv (
    // Inputs - System
    .aclk_i               (aclk),                  
    .aresetn_i            (aresetn),               
    
    // Inputs - Read address channel signals
    .arvalid_i            (arvalid_s0),               
    .arid_i               (arid_s0),
    .arlen_i              (arlen_s0),
    .araddr_i             (araddr_s0),
    .arsize_i             (arsize_s0),
    .arlock_i             (arlock_s0),
    .arburst_i            (arburst_s0),
    .arcache_i            (arcache_s0),
    .arprot_i             (arprot_s0),

    // Outputs - Read address channel signals
    .arready_o            (arready_s0),

    // Inputs - Read data channel signals
    .rready_i             (rready_s0),
      
    // Outputs - Read data channel signals
    .rvalid_o             (rvalid_s0),
    .rid_o                (rid_s0),
    .rresp_o              (rresp_s0),
    .rlast_o              (rlast_s0),
    .rdata_o              (rdata_s0),

    // Inputs - Write address channel signals
    .awvalid_i            (awvalid_s0),
    .awid_i               (awid_s0),
    .awlen_i              (awlen_s0),
    .awaddr_i             (awaddr_s0),
    .awsize_i             (arsize_s0),
    .awlock_i             (awlock_s0),
    .awburst_i            (awburst_s0),
    .awcache_i            (awcache_s0),
    .awprot_i             (awprot_s0),


    // Outputs - Write address channel signals
    .awready_o            (awready_s0),
      
    // Inputs - Write data channel signals
    .wvalid_i             (wvalid_s0),
    .wlast_i              (wlast_s0),
    .wid_i                (wid_s0),
    .wdata_i              (wdata_s0),
    .wstrb_i              (wstrb_s0),
    
    // outputs - Write data channel signals
    .wready_o             (wready_s0),

    // Inputs - write response channel signals
    .bready_i             (bready_s0),

    // Outputs - write response channel signals
    .bvalid_o             (bvalid_s0),
    .bid_o                (bid_s0),
    .bresp_o              (bresp_s0)
   );

// Dummy wires for default slave sideband signals.
   


  // Assign Default slave write address channel
  assign dbg_awid_s0     = awid_s0;
  assign dbg_awaddr_s0   = awaddr_s0;
  assign dbg_awlen_s0    = awlen_s0;
  assign dbg_awsize_s0   = awsize_s0;
  assign dbg_awburst_s0  = awburst_s0;
  assign dbg_awlock_s0   = awlock_s0;
  assign dbg_awcache_s0  = awcache_s0;
  assign dbg_awprot_s0   = awprot_s0;
  assign dbg_awvalid_s0  = awvalid_s0;
  assign dbg_awready_s0  = awready_s0;
  
  // Assign Default slave write data channel
  assign dbg_wid_s0      = wid_s0;
  assign dbg_wdata_s0    = wdata_s0;
  assign dbg_wstrb_s0    = wstrb_s0;
  assign dbg_wlast_s0    = wlast_s0;
  assign dbg_wvalid_s0   = wvalid_s0;
  assign dbg_wready_s0   = wready_s0;

  // Assign Default slave write burst response channel
  assign dbg_bid_s0       = bid_s0;
  assign dbg_bresp_s0     = bresp_s0;
  assign dbg_bvalid_s0    = bvalid_s0;
  assign dbg_bready_s0    = bready_s0;

  // Assign Default slave read address channel
  assign dbg_arid_s0     = arid_s0;
  assign dbg_araddr_s0   = araddr_s0; 
  assign dbg_arlen_s0    = arlen_s0;
  assign dbg_arsize_s0   = arsize_s0;
  assign dbg_arburst_s0  = arburst_s0;
  assign dbg_arlock_s0   = arlock_s0;
  assign dbg_arcache_s0  = arcache_s0;
  assign dbg_arprot_s0   = arprot_s0;
  assign dbg_arvalid_s0  = arvalid_s0;
  assign dbg_arready_s0  = arready_s0;

  // Assign Default slave read data channel
  assign dbg_rid_s0       = rid_s0;
  assign dbg_rdata_s0     = rdata_s0;
  assign dbg_rresp_s0     = rresp_s0;
  assign dbg_rvalid_s0    = rvalid_s0;
  assign dbg_rlast_s0     = rlast_s0;
  assign dbg_rready_s0    = rready_s0;

  
  assign arpayload_m1 = {
    arid_m1,    araddr_m1,    arlen_m1,    arsize_m1,    arburst_m1,    arlock_m1,    arcache_m1,    arprot_m1 };
  assign awpayload_m1 = {
    awid_m1,    awaddr_m1,    awlen_m1,    awsize_m1,    awburst_m1,    awlock_m1,    awcache_m1,    awprot_m1 };
  assign wpayload_m1 = {
    wid_m1,    wdata_m1,    wstrb_m1,    wlast_m1 };
  assign {
    rid_m1,    rdata_m1,    rresp_m1,    rlast_m1 }  = `AXI_M1_ON_R_SHARED_ONLY_VAL ? (`AXI_IS_ICM_M1 ? rpayload_icm_shrd : rpayload_shrd) : rpayload_m1;
  assign {
    bid_m1,    bresp_m1 }  = `AXI_M1_ON_B_SHARED_ONLY_VAL ? (`AXI_IS_ICM_M1 ? bpayload_icm_shrd : bpayload_shrd) : bpayload_m1;

  assign {
    arid_s0,    araddr_s0,    arlen_s0,    arsize_s0,    arburst_s0,    arlock_s0,    arcache_s0,    arprot_s0 }  = `AXI_S0_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s0;

  assign {
    awid_s0,    awaddr_s0,    awlen_s0,    awsize_s0,    awburst_s0,    awlock_s0,    awcache_s0,    awprot_s0 }  = `AXI_S0_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s0;

  assign {
    wid_s0,    wdata_s0,    wstrb_s0,    wlast_s0 }  = `AXI_S0_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s0;

  assign rpayload_s0 = {
    rid_s0,    rdata_s0,    rresp_s0,    rlast_s0 };

  assign bpayload_s0 = {
    bid_s0,    bresp_s0 };

  assign {
    arid_s1,    araddr_s1,    arlen_s1,    arsize_s1,    arburst_s1,    arlock_s1,    arcache_s1,    arprot_s1 }  = `AXI_S1_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s1;

  assign {
    awid_s1,    awaddr_s1,    awlen_s1,    awsize_s1,    awburst_s1,    awlock_s1,    awcache_s1,    awprot_s1 }  = `AXI_S1_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s1;

  assign {
    wid_s1,    wdata_s1,    wstrb_s1,    wlast_s1 }  = `AXI_S1_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s1;

  assign rpayload_s1 = {
    rid_s1,    rdata_s1,    rresp_s1,    rlast_s1 };

  assign bpayload_s1 = {
    bid_s1,    bresp_s1 };

  assign {
    arid_s2,    araddr_s2,    arlen_s2,    arsize_s2,    arburst_s2,    arlock_s2,    arcache_s2,    arprot_s2 }  = `AXI_S2_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s2;

  assign {
    awid_s2,    awaddr_s2,    awlen_s2,    awsize_s2,    awburst_s2,    awlock_s2,    awcache_s2,    awprot_s2 }  = `AXI_S2_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s2;

  assign {
    wid_s2,    wdata_s2,    wstrb_s2,    wlast_s2 }  = `AXI_S2_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s2;

  assign rpayload_s2 = {
    rid_s2,    rdata_s2,    rresp_s2,    rlast_s2 };

  assign bpayload_s2 = {
    bid_s2,    bresp_s2 };

  assign {
    arid_s3,    araddr_s3,    arlen_s3,    arsize_s3,    arburst_s3,    arlock_s3,    arcache_s3,    arprot_s3 }  = `AXI_S3_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s3;

  assign {
    awid_s3,    awaddr_s3,    awlen_s3,    awsize_s3,    awburst_s3,    awlock_s3,    awcache_s3,    awprot_s3 }  = `AXI_S3_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s3;

  assign {
    wid_s3,    wdata_s3,    wstrb_s3,    wlast_s3 }  = `AXI_S3_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s3;

  assign rpayload_s3 = {
    rid_s3,    rdata_s3,    rresp_s3,    rlast_s3 };

  assign bpayload_s3 = {
    bid_s3,    bresp_s3 };

  assign {
    arid_s4,    araddr_s4,    arlen_s4,    arsize_s4,    arburst_s4,    arlock_s4,    arcache_s4,    arprot_s4 }  = `AXI_S4_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s4;

  assign {
    awid_s4,    awaddr_s4,    awlen_s4,    awsize_s4,    awburst_s4,    awlock_s4,    awcache_s4,    awprot_s4 }  = `AXI_S4_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s4;

  assign {
    wid_s4,    wdata_s4,    wstrb_s4,    wlast_s4 }  = `AXI_S4_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s4;

  assign rpayload_s4 = {
    rid_s4,    rdata_s4,    rresp_s4,    rlast_s4 };

  assign bpayload_s4 = {
    bid_s4,    bresp_s4 };

  assign {
    arid_s5,    araddr_s5,    arlen_s5,    arsize_s5,    arburst_s5,    arlock_s5,    arcache_s5,    arprot_s5 }  = `AXI_S5_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s5;

  assign {
    awid_s5,    awaddr_s5,    awlen_s5,    awsize_s5,    awburst_s5,    awlock_s5,    awcache_s5,    awprot_s5 }  = `AXI_S5_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s5;

  assign {
    wid_s5,    wdata_s5,    wstrb_s5,    wlast_s5 }  = `AXI_S5_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s5;

  assign rpayload_s5 = {
    rid_s5,    rdata_s5,    rresp_s5,    rlast_s5 };

  assign bpayload_s5 = {
    bid_s5,    bresp_s5 };

  assign {
    arid_s6,    araddr_s6,    arlen_s6,    arsize_s6,    arburst_s6,    arlock_s6,    arcache_s6,    arprot_s6 }  = `AXI_S6_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s6;

  assign {
    awid_s6,    awaddr_s6,    awlen_s6,    awsize_s6,    awburst_s6,    awlock_s6,    awcache_s6,    awprot_s6 }  = `AXI_S6_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s6;

  assign {
    wid_s6,    wdata_s6,    wstrb_s6,    wlast_s6 }  = `AXI_S6_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s6;

  assign rpayload_s6 = {
    rid_s6,    rdata_s6,    rresp_s6,    rlast_s6 };

  assign bpayload_s6 = {
    bid_s6,    bresp_s6 };

  assign {
    arid_s7,    araddr_s7,    arlen_s7,    arsize_s7,    arburst_s7,    arlock_s7,    arcache_s7,    arprot_s7 }  = `AXI_S7_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s7;

  assign {
    awid_s7,    awaddr_s7,    awlen_s7,    awsize_s7,    awburst_s7,    awlock_s7,    awcache_s7,    awprot_s7 }  = `AXI_S7_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s7;

  assign {
    wid_s7,    wdata_s7,    wstrb_s7,    wlast_s7 }  = `AXI_S7_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s7;

  assign rpayload_s7 = {
    rid_s7,    rdata_s7,    rresp_s7,    rlast_s7 };

  assign bpayload_s7 = {
    bid_s7,    bresp_s7 };

  assign {
    arid_s8,    araddr_s8,    arlen_s8,    arsize_s8,    arburst_s8,    arlock_s8,    arcache_s8,    arprot_s8 }  = `AXI_S8_ON_AR_SHARED_ONLY_VAL ? arpayload_shrd : arpayload_s8;

  assign {
    awid_s8,    awaddr_s8,    awlen_s8,    awsize_s8,    awburst_s8,    awlock_s8,    awcache_s8,    awprot_s8 }  = `AXI_S8_ON_AW_SHARED_ONLY_VAL ? awpayload_shrd : awpayload_s8;

  assign {
    wid_s8,    wdata_s8,    wstrb_s8,    wlast_s8 }  = `AXI_S8_ON_W_SHARED_ONLY_VAL ? wpayload_shrd : wpayload_s8;

  assign rpayload_s8 = {
    rid_s8,    rdata_s8,    rresp_s8,    rlast_s8 };

  assign bpayload_s8 = {
    bid_s8,    bresp_s8 };
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s0;
    assign priority_s0 = 0;
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s1;
   assign priority_s1 = `AXI_PRIORITY_S1;
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s2;
   assign priority_s2 = `AXI_PRIORITY_S2;
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s3;
   assign priority_s3 = `AXI_PRIORITY_S3;
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s4;
   assign priority_s4 = `AXI_PRIORITY_S4;
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s5;
   assign priority_s5 = `AXI_PRIORITY_S5;
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s6;
   assign priority_s6 = `AXI_PRIORITY_S6;
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s7;
   assign priority_s7 = `AXI_PRIORITY_S7;
    wire [`AXI_SLV_PRIORITY_W-1:0] priority_s8;
   assign priority_s8 = `AXI_PRIORITY_S8;

    wire [`AXI_MST_PRIORITY_W-1:0] priority_m1;
   assign priority_m1 = `AXI_PRIORITY_M1;

 
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S0_NMV)-1:0] ar_bus_mst_priorities_s0;
  wire ar_blank_priority_s0;
  assign {ar_blank_priority_s0, ar_bus_mst_priorities_s0} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S1_NMV)-1:0] ar_bus_mst_priorities_s1;
  wire ar_blank_priority_s1;
  assign {ar_blank_priority_s1, ar_bus_mst_priorities_s1} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S2_NMV)-1:0] ar_bus_mst_priorities_s2;
  wire ar_blank_priority_s2;
  assign {ar_blank_priority_s2, ar_bus_mst_priorities_s2} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S3_NMV)-1:0] ar_bus_mst_priorities_s3;
  wire ar_blank_priority_s3;
  assign {ar_blank_priority_s3, ar_bus_mst_priorities_s3} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S4_NMV)-1:0] ar_bus_mst_priorities_s4;
  wire ar_blank_priority_s4;
  assign {ar_blank_priority_s4, ar_bus_mst_priorities_s4} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S5_NMV)-1:0] ar_bus_mst_priorities_s5;
  wire ar_blank_priority_s5;
  assign {ar_blank_priority_s5, ar_bus_mst_priorities_s5} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S6_NMV)-1:0] ar_bus_mst_priorities_s6;
  wire ar_blank_priority_s6;
  assign {ar_blank_priority_s6, ar_bus_mst_priorities_s6} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S7_NMV)-1:0] ar_bus_mst_priorities_s7;
  wire ar_blank_priority_s7;
  assign {ar_blank_priority_s7, ar_bus_mst_priorities_s7} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AR_S8_NMV)-1:0] ar_bus_mst_priorities_s8;
  wire ar_blank_priority_s8;
  assign {ar_blank_priority_s8, ar_bus_mst_priorities_s8} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S0_NMV)-1:0] aw_bus_mst_priorities_s0;
  wire aw_blank_priority_s0;
  assign {aw_blank_priority_s0, aw_bus_mst_priorities_s0} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S1_NMV)-1:0] aw_bus_mst_priorities_s1;
  wire aw_blank_priority_s1;
  assign {aw_blank_priority_s1, aw_bus_mst_priorities_s1} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S2_NMV)-1:0] aw_bus_mst_priorities_s2;
  wire aw_blank_priority_s2;
  assign {aw_blank_priority_s2, aw_bus_mst_priorities_s2} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S3_NMV)-1:0] aw_bus_mst_priorities_s3;
  wire aw_blank_priority_s3;
  assign {aw_blank_priority_s3, aw_bus_mst_priorities_s3} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S4_NMV)-1:0] aw_bus_mst_priorities_s4;
  wire aw_blank_priority_s4;
  assign {aw_blank_priority_s4, aw_bus_mst_priorities_s4} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S5_NMV)-1:0] aw_bus_mst_priorities_s5;
  wire aw_blank_priority_s5;
  assign {aw_blank_priority_s5, aw_bus_mst_priorities_s5} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S6_NMV)-1:0] aw_bus_mst_priorities_s6;
  wire aw_blank_priority_s6;
  assign {aw_blank_priority_s6, aw_bus_mst_priorities_s6} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S7_NMV)-1:0] aw_bus_mst_priorities_s7;
  wire aw_blank_priority_s7;
  assign {aw_blank_priority_s7, aw_bus_mst_priorities_s7} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_AW_S8_NMV)-1:0] aw_bus_mst_priorities_s8;
  wire aw_blank_priority_s8;
  assign {aw_blank_priority_s8, aw_bus_mst_priorities_s8} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S0_NMV)-1:0] w_bus_mst_priorities_s0;
  wire w_blank_priority_s0;
  assign {w_blank_priority_s0, w_bus_mst_priorities_s0} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S1_NMV)-1:0] w_bus_mst_priorities_s1;
  wire w_blank_priority_s1;
  assign {w_blank_priority_s1, w_bus_mst_priorities_s1} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S2_NMV)-1:0] w_bus_mst_priorities_s2;
  wire w_blank_priority_s2;
  assign {w_blank_priority_s2, w_bus_mst_priorities_s2} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S3_NMV)-1:0] w_bus_mst_priorities_s3;
  wire w_blank_priority_s3;
  assign {w_blank_priority_s3, w_bus_mst_priorities_s3} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S4_NMV)-1:0] w_bus_mst_priorities_s4;
  wire w_blank_priority_s4;
  assign {w_blank_priority_s4, w_bus_mst_priorities_s4} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S5_NMV)-1:0] w_bus_mst_priorities_s5;
  wire w_blank_priority_s5;
  assign {w_blank_priority_s5, w_bus_mst_priorities_s5} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S6_NMV)-1:0] w_bus_mst_priorities_s6;
  wire w_blank_priority_s6;
  assign {w_blank_priority_s6, w_bus_mst_priorities_s6} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S7_NMV)-1:0] w_bus_mst_priorities_s7;
  wire w_blank_priority_s7;
  assign {w_blank_priority_s7, w_bus_mst_priorities_s7} = {1'b0
      , priority_m1
  };
  wire [(`AXI_MST_PRIORITY_W*`AXI_W_S8_NMV)-1:0] w_bus_mst_priorities_s8;
  wire w_blank_priority_s8;
  assign {w_blank_priority_s8, w_bus_mst_priorities_s8} = {1'b0
      , priority_m1
  };
  wire [(`AXI_SLV_PRIORITY_W*`AXI_R_M1_NSV)-1:0] r_bus_slv_priorities_m1;
  wire r_blank_priority_m1;
  assign r_bus_slv_priorities_m1 = {1'b0
        , priority_s8
        , priority_s7
        , priority_s6
        , priority_s5
        , priority_s4
        , priority_s3
        , priority_s2
        , priority_s1
        , priority_s0
 };
  wire [(`AXI_SLV_PRIORITY_W*`AXI_B_M1_NSV)-1:0] b_bus_slv_priorities_m1;
  wire b_blank_priority_m1;
  assign b_bus_slv_priorities_m1 = {1'b0
        , priority_s8
        , priority_s7
        , priority_s6
        , priority_s5
        , priority_s4
        , priority_s3
        , priority_s2
        , priority_s1
        , priority_s0
 };

/*----------------------------------------------------------------------
 * SHARED SP WIRE CONNECTIONS
 * Create connections to/from the shared SP block.
 * Code will be removed if shared layers are not configured.
*/


  // Select between shared and dedicated channel valid signals for
  // each slave.
       assign arvalid_s8 = `AXI_S8_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s8 
                                 : arvalid_ddctd_s8;
       assign arvalid_s7 = `AXI_S7_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s7 
                                 : arvalid_ddctd_s7;
       assign arvalid_s6 = `AXI_S6_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s6 
                                 : arvalid_ddctd_s6;
       assign arvalid_s5 = `AXI_S5_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s5 
                                 : arvalid_ddctd_s5;
       assign arvalid_s4 = `AXI_S4_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s4 
                                 : arvalid_ddctd_s4;
       assign arvalid_s3 = `AXI_S3_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s3 
                                 : arvalid_ddctd_s3;
       assign arvalid_s2 = `AXI_S2_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s2 
                                 : arvalid_ddctd_s2;
       assign arvalid_s1 = `AXI_S1_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s1 
                                 : arvalid_ddctd_s1;
       assign arvalid_s0 = `AXI_S0_ON_AR_SHARED_ONLY_VAL
                                 ? arvalid_shrd_s0 
                                 : arvalid_ddctd_s0;

  // Select between shared and dedicated channel valid signals for
  // each slave.
       assign awvalid_s8 = `AXI_S8_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s8 
                                 : awvalid_ddctd_s8;
       assign awvalid_s7 = `AXI_S7_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s7 
                                 : awvalid_ddctd_s7;
       assign awvalid_s6 = `AXI_S6_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s6 
                                 : awvalid_ddctd_s6;
       assign awvalid_s5 = `AXI_S5_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s5 
                                 : awvalid_ddctd_s5;
       assign awvalid_s4 = `AXI_S4_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s4 
                                 : awvalid_ddctd_s4;
       assign awvalid_s3 = `AXI_S3_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s3 
                                 : awvalid_ddctd_s3;
       assign awvalid_s2 = `AXI_S2_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s2 
                                 : awvalid_ddctd_s2;
       assign awvalid_s1 = `AXI_S1_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s1 
                                 : awvalid_ddctd_s1;
       assign awvalid_s0 = `AXI_S0_ON_AW_SHARED_ONLY_VAL
                                 ? awvalid_shrd_s0 
                                 : awvalid_ddctd_s0;

  // Select between shared and dedicated channel valid signals for
  // each slave.
       assign wvalid_s8 = `AXI_S8_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s8 
                                 : wvalid_ddctd_s8;
       assign wvalid_s7 = `AXI_S7_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s7 
                                 : wvalid_ddctd_s7;
       assign wvalid_s6 = `AXI_S6_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s6 
                                 : wvalid_ddctd_s6;
       assign wvalid_s5 = `AXI_S5_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s5 
                                 : wvalid_ddctd_s5;
       assign wvalid_s4 = `AXI_S4_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s4 
                                 : wvalid_ddctd_s4;
       assign wvalid_s3 = `AXI_S3_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s3 
                                 : wvalid_ddctd_s3;
       assign wvalid_s2 = `AXI_S2_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s2 
                                 : wvalid_ddctd_s2;
       assign wvalid_s1 = `AXI_S1_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s1 
                                 : wvalid_ddctd_s1;
       assign wvalid_s0 = `AXI_S0_ON_W_SHARED_ONLY_VAL
                                 ? wvalid_shrd_s0 
                                 : wvalid_ddctd_s0;
 
// When the shared to dedicated link exists on the AW channel, it
// is necessary to map the one hot master granted bus from the
// dedicated AW, which will reflect only the masters connected
// to the dedicated (with shared masters represented by a
// single grant bit (msb), to a value that is representative
// of all masters visible to that slave.
// This decoding requires ifdefs and as such is done at the
// top level and sent back to the relevant slave port.
 
  // Translate issued_wtx_mst_oh_o_s0 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s0
    , issued_wtx_mst_sys_oh_s0[0]
 } = issued_wtx_mst_oh_o_s0;
 
  // Translate issued_wtx_mst_oh_o_s1 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s1
    , issued_wtx_mst_sys_oh_s1[0]
 } = issued_wtx_mst_oh_o_s1;
 
  // Translate issued_wtx_mst_oh_o_s2 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s2
    , issued_wtx_mst_sys_oh_s2[0]
 } = issued_wtx_mst_oh_o_s2;
 
  // Translate issued_wtx_mst_oh_o_s3 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s3
    , issued_wtx_mst_sys_oh_s3[0]
 } = issued_wtx_mst_oh_o_s3;
 
  // Translate issued_wtx_mst_oh_o_s4 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s4
    , issued_wtx_mst_sys_oh_s4[0]
 } = issued_wtx_mst_oh_o_s4;
 
  // Translate issued_wtx_mst_oh_o_s5 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s5
    , issued_wtx_mst_sys_oh_s5[0]
 } = issued_wtx_mst_oh_o_s5;
 
  // Translate issued_wtx_mst_oh_o_s6 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s6
    , issued_wtx_mst_sys_oh_s6[0]
 } = issued_wtx_mst_oh_o_s6;
 
  // Translate issued_wtx_mst_oh_o_s7 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s7
    , issued_wtx_mst_sys_oh_s7[0]
 } = issued_wtx_mst_oh_o_s7;
 
  // Translate issued_wtx_mst_oh_o_s8 to a bit per
  // system master bus. This signal decodes when dedicated
  // masters issue a t/x to the slave.
  assign {issued_wtx_mst_oh_dummy1_s8
    , issued_wtx_mst_sys_oh_s8[0]
 } = issued_wtx_mst_oh_o_s8;
 
  // Translate issued_wtx_mst_sys_oh_s0 to a bit per
  // master visible to slave 0 value.
  assign issued_wtx_mst_oh_i_eb_s0 = { 1'b0
    , issued_wtx_mst_sys_oh_s0[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s0 
  = issued_wtx_mst_oh_i_eb_s0[`AXI_NMV_S0-1:0];
   
  // Translate issued_wtx_mst_sys_oh_s1 to a bit per
  // master visible to slave 1 value.
  assign issued_wtx_mst_oh_i_eb_s1 = { 1'b0
    , issued_wtx_mst_sys_oh_s1[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s1 
  = issued_wtx_mst_oh_i_eb_s1[`AXI_NMV_S1-1:0];
   
  // Translate issued_wtx_mst_sys_oh_s2 to a bit per
  // master visible to slave 2 value.
  assign issued_wtx_mst_oh_i_eb_s2 = { 1'b0
    , issued_wtx_mst_sys_oh_s2[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s2 
  = issued_wtx_mst_oh_i_eb_s2[`AXI_NMV_S2-1:0];
   
  // Translate issued_wtx_mst_sys_oh_s3 to a bit per
  // master visible to slave 3 value.
  assign issued_wtx_mst_oh_i_eb_s3 = { 1'b0
    , issued_wtx_mst_sys_oh_s3[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s3 
  = issued_wtx_mst_oh_i_eb_s3[`AXI_NMV_S3-1:0];
   
  // Translate issued_wtx_mst_sys_oh_s4 to a bit per
  // master visible to slave 4 value.
  assign issued_wtx_mst_oh_i_eb_s4 = { 1'b0
    , issued_wtx_mst_sys_oh_s4[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s4 
  = issued_wtx_mst_oh_i_eb_s4[`AXI_NMV_S4-1:0];
   
  // Translate issued_wtx_mst_sys_oh_s5 to a bit per
  // master visible to slave 5 value.
  assign issued_wtx_mst_oh_i_eb_s5 = { 1'b0
    , issued_wtx_mst_sys_oh_s5[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s5 
  = issued_wtx_mst_oh_i_eb_s5[`AXI_NMV_S5-1:0];
   
  // Translate issued_wtx_mst_sys_oh_s6 to a bit per
  // master visible to slave 6 value.
  assign issued_wtx_mst_oh_i_eb_s6 = { 1'b0
    , issued_wtx_mst_sys_oh_s6[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s6 
  = issued_wtx_mst_oh_i_eb_s6[`AXI_NMV_S6-1:0];
   
  // Translate issued_wtx_mst_sys_oh_s7 to a bit per
  // master visible to slave 7 value.
  assign issued_wtx_mst_oh_i_eb_s7 = { 1'b0
    , issued_wtx_mst_sys_oh_s7[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s7 
  = issued_wtx_mst_oh_i_eb_s7[`AXI_NMV_S7-1:0];
   
  // Translate issued_wtx_mst_sys_oh_s8 to a bit per
  // master visible to slave 8 value.
  assign issued_wtx_mst_oh_i_eb_s8 = { 1'b0
    , issued_wtx_mst_sys_oh_s8[0]
  };
  // Remove extra bit. 
  assign issued_wtx_mst_oh_i_s8 
  = issued_wtx_mst_oh_i_eb_s8[`AXI_NMV_S8-1:0];
   
 // Collect all shrd_w_nxt_fb_pend_s* signals into a bus
 // with a bit for each slave on the shared W channel.
  assign { shrd_w_nxt_fb_pend_bus_dummy, shrd_w_nxt_fb_pend_bus} = { 1'b0
  };  

/*----------------------------------------------------------------------
 * SHARED MP WIRE CONNECTIONS
 * Create connections to/from the shared MP block.
 * Code will be removed if shared layers are not configured.
*/


  // Select between shared and dedicated channel valid signals for
  // each master.
       assign rvalid_m1 = `AXI_M1_ON_R_SHARED_ONLY_VAL
                                 ? rvalid_shrd_m1 
                                 : rvalid_ddctd_m1;

  // Select between shared and dedicated channel valid signals for
  // each master.
       assign bvalid_m1 = `AXI_M1_ON_B_SHARED_ONLY_VAL
                                 ? bvalid_shrd_m1 
                                 : bvalid_ddctd_m1;

  DW_axi_sp
   #(`AXI_NMV_S0, 
`AXI_LOG2_LCL_NM, `AXI_AR_S0_NMV, `AXI_AR_S0_NMV_LOG2, `AXI_AR_S0_NMV_P1_LOG2, `AXI_AW_S0_NMV, `AXI_AW_S0_NMV_LOG2, `AXI_AW_S0_NMV_P1_LOG2, `AXI_W_S0_NMV, `AXI_W_S0_NMV_LOG2, `AXI_W_S0_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S0, `AXI_AW_ARB_TYPE_S0, `AXI_W_ARB_TYPE_S0, `AXI_AR_MCA_EN_S0, `AXI_AW_MCA_EN_S0, `AXI_W_MCA_EN_S0, `AXI_AR_MCA_NC_S0, `AXI_AW_MCA_NC_S0, `AXI_W_MCA_NC_S0, `AXI_AR_MCA_NC_W_S0, `AXI_AW_MCA_NC_W_S0, `AXI_W_MCA_NC_W_S0, `AXI_VV_S0_BY_M1, `AXI_VV_S0_BY_M2, `AXI_VV_S0_BY_M3, `AXI_VV_S0_BY_M4, `AXI_VV_S0_BY_M5, `AXI_VV_S0_BY_M6, `AXI_VV_S0_BY_M7, `AXI_VV_S0_BY_M8, `AXI_VV_S0_BY_M9, `AXI_VV_S0_BY_M10, `AXI_VV_S0_BY_M11, `AXI_VV_S0_BY_M12, `AXI_VV_S0_BY_M13, `AXI_VV_S0_BY_M14, `AXI_VV_S0_BY_M15, `AXI_VV_S0_BY_M16, 1, 1, 1, `AXI_MAX_FARC_S0, `AXI_LOG2_MAX_FARC_P1_S0, `AXI_MAX_FAWC_S0, `AXI_LOG2_MAX_FAWC_S0, `AXI_LOG2_MAX_FAWC_P1_S0, `AXI_NOREQ_LOCKING,`AXI_AW_LAYER_S0_M1 ,`AXI_AW_LAYER_S0_M2 ,`AXI_AW_LAYER_S0_M3 ,`AXI_AW_LAYER_S0_M4 ,`AXI_AW_LAYER_S0_M5 ,`AXI_AW_LAYER_S0_M6 ,`AXI_AW_LAYER_S0_M7 ,`AXI_AW_LAYER_S0_M8 ,`AXI_AW_LAYER_S0_M9 ,`AXI_AW_LAYER_S0_M10 ,`AXI_AW_LAYER_S0_M11 ,`AXI_AW_LAYER_S0_M12 ,`AXI_AW_LAYER_S0_M13 ,`AXI_AW_LAYER_S0_M14 ,`AXI_AW_LAYER_S0_M15 ,`AXI_AW_LAYER_S0_M16 ,`AXI_AR_LAYER_S0_M1 ,`AXI_AR_LAYER_S0_M2 ,`AXI_AR_LAYER_S0_M3 ,`AXI_AR_LAYER_S0_M4 ,`AXI_AR_LAYER_S0_M5 ,`AXI_AR_LAYER_S0_M6 ,`AXI_AR_LAYER_S0_M7 ,`AXI_AR_LAYER_S0_M8 ,`AXI_AR_LAYER_S0_M9 ,`AXI_AR_LAYER_S0_M10 ,`AXI_AR_LAYER_S0_M11 ,`AXI_AR_LAYER_S0_M12 ,`AXI_AR_LAYER_S0_M13 ,`AXI_AR_LAYER_S0_M14 ,`AXI_AR_LAYER_S0_M15 ,`AXI_AR_LAYER_S0_M16 ,`AXI_W_LAYER_S0_M1 ,`AXI_W_LAYER_S0_M2 ,`AXI_W_LAYER_S0_M3 ,`AXI_W_LAYER_S0_M4 ,`AXI_W_LAYER_S0_M5 ,`AXI_W_LAYER_S0_M6 ,`AXI_W_LAYER_S0_M7 ,`AXI_W_LAYER_S0_M8 ,`AXI_W_LAYER_S0_M9 ,`AXI_W_LAYER_S0_M10 ,`AXI_W_LAYER_S0_M11 ,`AXI_W_LAYER_S0_M12 ,`AXI_W_LAYER_S0_M13 ,`AXI_W_LAYER_S0_M14 ,`AXI_W_LAYER_S0_M15 ,`AXI_W_LAYER_S0_M16 ,`AXI_R_LAYER_M1_S0 ,`AXI_R_LAYER_M2_S0 ,`AXI_R_LAYER_M3_S0 ,`AXI_R_LAYER_M4_S0 ,`AXI_R_LAYER_M5_S0 ,`AXI_R_LAYER_M6_S0 ,`AXI_R_LAYER_M7_S0 ,`AXI_R_LAYER_M8_S0 ,`AXI_R_LAYER_M9_S0 ,`AXI_R_LAYER_M10_S0 ,`AXI_R_LAYER_M11_S0 ,`AXI_R_LAYER_M12_S0 ,`AXI_R_LAYER_M13_S0 ,`AXI_R_LAYER_M14_S0 ,`AXI_R_LAYER_M15_S0 ,`AXI_R_LAYER_M16_S0 ,`AXI_B_LAYER_M1_S0 ,`AXI_B_LAYER_M2_S0 ,`AXI_B_LAYER_M3_S0 ,`AXI_B_LAYER_M4_S0 ,`AXI_B_LAYER_M5_S0 ,`AXI_B_LAYER_M6_S0 ,`AXI_B_LAYER_M7_S0 ,`AXI_B_LAYER_M8_S0 ,`AXI_B_LAYER_M9_S0 ,`AXI_B_LAYER_M10_S0 ,`AXI_B_LAYER_M11_S0 ,`AXI_B_LAYER_M12_S0 ,`AXI_B_LAYER_M13_S0 ,`AXI_B_LAYER_M14_S0 ,`AXI_B_LAYER_M15_S0 ,`AXI_B_LAYER_M16_S0 , `AXI_AW_S0_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S0_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S0_ON_AR_SHARED_ONLY_VAL, `AXI_S0_ON_AW_SHARED_ONLY_VAL, `AXI_S0_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s0 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s0),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s0),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s0),

// Read Address Channel
    .arready_i                (arready_s0),
    .arvalid_o                (arvalid_ddctd_s0),
    .arpayload_o              (arpayload_s0),
    .bus_arvalid_i            (bus_arvalid_s0),
    .bus_arpayload_i          (bus_arpayload_s0),
    .bus_arready_o            (bus_sp_arready_s0),
    .rcpl_tx_shrd_o           (rcpl_tx_s0),
// Read Data Channel
    .rvalid_i                 (rvalid_s0),
    .rpayload_i               (rpayload_s0),
    .rready_o                 (rready_s0),
    .bus_rready_i             (bus_rready_s0),
    .bus_rvalid_o             (sp_rvalid_s0),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s0),
    .rpayload_o               (sp_rpayload_s0),
// Write Address Channel
    .awready_i                (awready_s0),
    .awvalid_o                (awvalid_ddctd_s0),
    .awpayload_o              (awpayload_s0),
    .bus_awvalid_i            (bus_awvalid_s0),
    .bus_awpayload_i          (bus_awpayload_s0),
    .bus_awready_o            (bus_sp_awready_s0),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s0),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s0),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s0),
// Write Data Channel
    .wready_i                 (wready_s0),
    .wvalid_o                 (wvalid_ddctd_s0),
    .wpayload_o               (wpayload_s0),
    .bus_wvalid_i             (bus_wvalid_s0),
    .bus_wpayload_i           (bus_wpayload_s0),
    .bus_wready_o             (bus_sp_wready_s0),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s0),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s0),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s0),
//Burst Response Channel
    .bvalid_i                 (bvalid_s0),
    .bpayload_i               (bpayload_s0),
    .bready_o                 (bready_s0),
    .bus_bready_i             (bus_bready_s0),
    .bus_bvalid_o             (sp_bvalid_s0),
    .bpayload_o               (sp_bpayload_s0),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s0),
    .wcpl_tx_shrd_o           (wcpl_tx_s0)
  );


  DW_axi_sp
   #(`AXI_NMV_S1, 
`AXI_LOG2_NMV_S1, `AXI_AR_S1_NMV, `AXI_AR_S1_NMV_LOG2, `AXI_AR_S1_NMV_P1_LOG2, `AXI_AW_S1_NMV, `AXI_AW_S1_NMV_LOG2, `AXI_AW_S1_NMV_P1_LOG2, `AXI_W_S1_NMV, `AXI_W_S1_NMV_LOG2, `AXI_W_S1_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S1, `AXI_AW_ARB_TYPE_S1, `AXI_W_ARB_TYPE_S1, `AXI_AR_MCA_EN_S1, `AXI_AW_MCA_EN_S1, `AXI_W_MCA_EN_S1, `AXI_AR_MCA_NC_S1, `AXI_AW_MCA_NC_S1, `AXI_W_MCA_NC_S1, `AXI_AR_MCA_NC_W_S1, `AXI_AW_MCA_NC_W_S1, `AXI_W_MCA_NC_W_S1, `AXI_VV_S1_BY_M1, `AXI_VV_S1_BY_M2, `AXI_VV_S1_BY_M3, `AXI_VV_S1_BY_M4, `AXI_VV_S1_BY_M5, `AXI_VV_S1_BY_M6, `AXI_VV_S1_BY_M7, `AXI_VV_S1_BY_M8, `AXI_VV_S1_BY_M9, `AXI_VV_S1_BY_M10, `AXI_VV_S1_BY_M11, `AXI_VV_S1_BY_M12, `AXI_VV_S1_BY_M13, `AXI_VV_S1_BY_M14, `AXI_VV_S1_BY_M15, `AXI_VV_S1_BY_M16, `AXI_WID_S1, `AXI_LOG2_WID_S1, `AXI_LOG2_WID_P1_S1, `AXI_MAX_FARC_S1, `AXI_LOG2_MAX_FARC_P1_S1, `AXI_MAX_FAWC_S1, `AXI_LOG2_MAX_FAWC_S1, `AXI_LOG2_MAX_FAWC_P1_S1, `AXI_HAS_LOCKING,`AXI_AW_LAYER_S1_M1 ,`AXI_AW_LAYER_S1_M2 ,`AXI_AW_LAYER_S1_M3 ,`AXI_AW_LAYER_S1_M4 ,`AXI_AW_LAYER_S1_M5 ,`AXI_AW_LAYER_S1_M6 ,`AXI_AW_LAYER_S1_M7 ,`AXI_AW_LAYER_S1_M8 ,`AXI_AW_LAYER_S1_M9 ,`AXI_AW_LAYER_S1_M10 ,`AXI_AW_LAYER_S1_M11 ,`AXI_AW_LAYER_S1_M12 ,`AXI_AW_LAYER_S1_M13 ,`AXI_AW_LAYER_S1_M14 ,`AXI_AW_LAYER_S1_M15 ,`AXI_AW_LAYER_S1_M16 ,`AXI_AR_LAYER_S1_M1 ,`AXI_AR_LAYER_S1_M2 ,`AXI_AR_LAYER_S1_M3 ,`AXI_AR_LAYER_S1_M4 ,`AXI_AR_LAYER_S1_M5 ,`AXI_AR_LAYER_S1_M6 ,`AXI_AR_LAYER_S1_M7 ,`AXI_AR_LAYER_S1_M8 ,`AXI_AR_LAYER_S1_M9 ,`AXI_AR_LAYER_S1_M10 ,`AXI_AR_LAYER_S1_M11 ,`AXI_AR_LAYER_S1_M12 ,`AXI_AR_LAYER_S1_M13 ,`AXI_AR_LAYER_S1_M14 ,`AXI_AR_LAYER_S1_M15 ,`AXI_AR_LAYER_S1_M16 ,`AXI_W_LAYER_S1_M1 ,`AXI_W_LAYER_S1_M2 ,`AXI_W_LAYER_S1_M3 ,`AXI_W_LAYER_S1_M4 ,`AXI_W_LAYER_S1_M5 ,`AXI_W_LAYER_S1_M6 ,`AXI_W_LAYER_S1_M7 ,`AXI_W_LAYER_S1_M8 ,`AXI_W_LAYER_S1_M9 ,`AXI_W_LAYER_S1_M10 ,`AXI_W_LAYER_S1_M11 ,`AXI_W_LAYER_S1_M12 ,`AXI_W_LAYER_S1_M13 ,`AXI_W_LAYER_S1_M14 ,`AXI_W_LAYER_S1_M15 ,`AXI_W_LAYER_S1_M16 ,`AXI_R_LAYER_M1_S1 ,`AXI_R_LAYER_M2_S1 ,`AXI_R_LAYER_M3_S1 ,`AXI_R_LAYER_M4_S1 ,`AXI_R_LAYER_M5_S1 ,`AXI_R_LAYER_M6_S1 ,`AXI_R_LAYER_M7_S1 ,`AXI_R_LAYER_M8_S1 ,`AXI_R_LAYER_M9_S1 ,`AXI_R_LAYER_M10_S1 ,`AXI_R_LAYER_M11_S1 ,`AXI_R_LAYER_M12_S1 ,`AXI_R_LAYER_M13_S1 ,`AXI_R_LAYER_M14_S1 ,`AXI_R_LAYER_M15_S1 ,`AXI_R_LAYER_M16_S1 ,`AXI_B_LAYER_M1_S1 ,`AXI_B_LAYER_M2_S1 ,`AXI_B_LAYER_M3_S1 ,`AXI_B_LAYER_M4_S1 ,`AXI_B_LAYER_M5_S1 ,`AXI_B_LAYER_M6_S1 ,`AXI_B_LAYER_M7_S1 ,`AXI_B_LAYER_M8_S1 ,`AXI_B_LAYER_M9_S1 ,`AXI_B_LAYER_M10_S1 ,`AXI_B_LAYER_M11_S1 ,`AXI_B_LAYER_M12_S1 ,`AXI_B_LAYER_M13_S1 ,`AXI_B_LAYER_M14_S1 ,`AXI_B_LAYER_M15_S1 ,`AXI_B_LAYER_M16_S1 , `AXI_AW_S1_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S1_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S1_ON_AR_SHARED_ONLY_VAL, `AXI_S1_ON_AW_SHARED_ONLY_VAL, `AXI_S1_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s1 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s1),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s1),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s1),

// Read Address Channel
    .arready_i                (arready_s1),
    .arvalid_o                (arvalid_ddctd_s1),
    .arpayload_o              (arpayload_s1),
    .bus_arvalid_i            (bus_arvalid_s1),
    .bus_arpayload_i          (bus_arpayload_s1),
    .bus_arready_o            (bus_sp_arready_s1),
    .rcpl_tx_shrd_o           (rcpl_tx_s1),
// Read Data Channel
    .rvalid_i                 (rvalid_s1),
    .rpayload_i               (rpayload_s1),
    .rready_o                 (rready_s1),
    .bus_rready_i             (bus_rready_s1),
    .bus_rvalid_o             (sp_rvalid_s1),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s1),
    .rpayload_o               (sp_rpayload_s1),
// Write Address Channel
    .awready_i                (awready_s1),
    .awvalid_o                (awvalid_ddctd_s1),
    .awpayload_o              (awpayload_s1),
    .bus_awvalid_i            (bus_awvalid_s1),
    .bus_awpayload_i          (bus_awpayload_s1),
    .bus_awready_o            (bus_sp_awready_s1),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s1),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s1),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s1),
// Write Data Channel
    .wready_i                 (wready_s1),
    .wvalid_o                 (wvalid_ddctd_s1),
    .wpayload_o               (wpayload_s1),
    .bus_wvalid_i             (bus_wvalid_s1),
    .bus_wpayload_i           (bus_wpayload_s1),
    .bus_wready_o             (bus_sp_wready_s1),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s1),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s1),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s1),
//Burst Response Channel
    .bvalid_i                 (bvalid_s1),
    .bpayload_i               (bpayload_s1),
    .bready_o                 (bready_s1),
    .bus_bready_i             (bus_bready_s1),
    .bus_bvalid_o             (sp_bvalid_s1),
    .bpayload_o               (sp_bpayload_s1),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s1),
    .wcpl_tx_shrd_o           (wcpl_tx_s1)
  );


  DW_axi_sp
   #(`AXI_NMV_S2, 
`AXI_LOG2_NMV_S2, `AXI_AR_S2_NMV, `AXI_AR_S2_NMV_LOG2, `AXI_AR_S2_NMV_P1_LOG2, `AXI_AW_S2_NMV, `AXI_AW_S2_NMV_LOG2, `AXI_AW_S2_NMV_P1_LOG2, `AXI_W_S2_NMV, `AXI_W_S2_NMV_LOG2, `AXI_W_S2_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S2, `AXI_AW_ARB_TYPE_S2, `AXI_W_ARB_TYPE_S2, `AXI_AR_MCA_EN_S2, `AXI_AW_MCA_EN_S2, `AXI_W_MCA_EN_S2, `AXI_AR_MCA_NC_S2, `AXI_AW_MCA_NC_S2, `AXI_W_MCA_NC_S2, `AXI_AR_MCA_NC_W_S2, `AXI_AW_MCA_NC_W_S2, `AXI_W_MCA_NC_W_S2, `AXI_VV_S2_BY_M1, `AXI_VV_S2_BY_M2, `AXI_VV_S2_BY_M3, `AXI_VV_S2_BY_M4, `AXI_VV_S2_BY_M5, `AXI_VV_S2_BY_M6, `AXI_VV_S2_BY_M7, `AXI_VV_S2_BY_M8, `AXI_VV_S2_BY_M9, `AXI_VV_S2_BY_M10, `AXI_VV_S2_BY_M11, `AXI_VV_S2_BY_M12, `AXI_VV_S2_BY_M13, `AXI_VV_S2_BY_M14, `AXI_VV_S2_BY_M15, `AXI_VV_S2_BY_M16, `AXI_WID_S2, `AXI_LOG2_WID_S2, `AXI_LOG2_WID_P1_S2, `AXI_MAX_FARC_S2, `AXI_LOG2_MAX_FARC_P1_S2, `AXI_MAX_FAWC_S2, `AXI_LOG2_MAX_FAWC_S2, `AXI_LOG2_MAX_FAWC_P1_S2, `AXI_HAS_LOCKING,`AXI_AW_LAYER_S2_M1 ,`AXI_AW_LAYER_S2_M2 ,`AXI_AW_LAYER_S2_M3 ,`AXI_AW_LAYER_S2_M4 ,`AXI_AW_LAYER_S2_M5 ,`AXI_AW_LAYER_S2_M6 ,`AXI_AW_LAYER_S2_M7 ,`AXI_AW_LAYER_S2_M8 ,`AXI_AW_LAYER_S2_M9 ,`AXI_AW_LAYER_S2_M10 ,`AXI_AW_LAYER_S2_M11 ,`AXI_AW_LAYER_S2_M12 ,`AXI_AW_LAYER_S2_M13 ,`AXI_AW_LAYER_S2_M14 ,`AXI_AW_LAYER_S2_M15 ,`AXI_AW_LAYER_S2_M16 ,`AXI_AR_LAYER_S2_M1 ,`AXI_AR_LAYER_S2_M2 ,`AXI_AR_LAYER_S2_M3 ,`AXI_AR_LAYER_S2_M4 ,`AXI_AR_LAYER_S2_M5 ,`AXI_AR_LAYER_S2_M6 ,`AXI_AR_LAYER_S2_M7 ,`AXI_AR_LAYER_S2_M8 ,`AXI_AR_LAYER_S2_M9 ,`AXI_AR_LAYER_S2_M10 ,`AXI_AR_LAYER_S2_M11 ,`AXI_AR_LAYER_S2_M12 ,`AXI_AR_LAYER_S2_M13 ,`AXI_AR_LAYER_S2_M14 ,`AXI_AR_LAYER_S2_M15 ,`AXI_AR_LAYER_S2_M16 ,`AXI_W_LAYER_S2_M1 ,`AXI_W_LAYER_S2_M2 ,`AXI_W_LAYER_S2_M3 ,`AXI_W_LAYER_S2_M4 ,`AXI_W_LAYER_S2_M5 ,`AXI_W_LAYER_S2_M6 ,`AXI_W_LAYER_S2_M7 ,`AXI_W_LAYER_S2_M8 ,`AXI_W_LAYER_S2_M9 ,`AXI_W_LAYER_S2_M10 ,`AXI_W_LAYER_S2_M11 ,`AXI_W_LAYER_S2_M12 ,`AXI_W_LAYER_S2_M13 ,`AXI_W_LAYER_S2_M14 ,`AXI_W_LAYER_S2_M15 ,`AXI_W_LAYER_S2_M16 ,`AXI_R_LAYER_M1_S2 ,`AXI_R_LAYER_M2_S2 ,`AXI_R_LAYER_M3_S2 ,`AXI_R_LAYER_M4_S2 ,`AXI_R_LAYER_M5_S2 ,`AXI_R_LAYER_M6_S2 ,`AXI_R_LAYER_M7_S2 ,`AXI_R_LAYER_M8_S2 ,`AXI_R_LAYER_M9_S2 ,`AXI_R_LAYER_M10_S2 ,`AXI_R_LAYER_M11_S2 ,`AXI_R_LAYER_M12_S2 ,`AXI_R_LAYER_M13_S2 ,`AXI_R_LAYER_M14_S2 ,`AXI_R_LAYER_M15_S2 ,`AXI_R_LAYER_M16_S2 ,`AXI_B_LAYER_M1_S2 ,`AXI_B_LAYER_M2_S2 ,`AXI_B_LAYER_M3_S2 ,`AXI_B_LAYER_M4_S2 ,`AXI_B_LAYER_M5_S2 ,`AXI_B_LAYER_M6_S2 ,`AXI_B_LAYER_M7_S2 ,`AXI_B_LAYER_M8_S2 ,`AXI_B_LAYER_M9_S2 ,`AXI_B_LAYER_M10_S2 ,`AXI_B_LAYER_M11_S2 ,`AXI_B_LAYER_M12_S2 ,`AXI_B_LAYER_M13_S2 ,`AXI_B_LAYER_M14_S2 ,`AXI_B_LAYER_M15_S2 ,`AXI_B_LAYER_M16_S2 , `AXI_AW_S2_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S2_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S2_ON_AR_SHARED_ONLY_VAL, `AXI_S2_ON_AW_SHARED_ONLY_VAL, `AXI_S2_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s2 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s2),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s2),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s2),

// Read Address Channel
    .arready_i                (arready_s2),
    .arvalid_o                (arvalid_ddctd_s2),
    .arpayload_o              (arpayload_s2),
    .bus_arvalid_i            (bus_arvalid_s2),
    .bus_arpayload_i          (bus_arpayload_s2),
    .bus_arready_o            (bus_sp_arready_s2),
    .rcpl_tx_shrd_o           (rcpl_tx_s2),
// Read Data Channel
    .rvalid_i                 (rvalid_s2),
    .rpayload_i               (rpayload_s2),
    .rready_o                 (rready_s2),
    .bus_rready_i             (bus_rready_s2),
    .bus_rvalid_o             (sp_rvalid_s2),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s2),
    .rpayload_o               (sp_rpayload_s2),
// Write Address Channel
    .awready_i                (awready_s2),
    .awvalid_o                (awvalid_ddctd_s2),
    .awpayload_o              (awpayload_s2),
    .bus_awvalid_i            (bus_awvalid_s2),
    .bus_awpayload_i          (bus_awpayload_s2),
    .bus_awready_o            (bus_sp_awready_s2),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s2),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s2),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s2),
// Write Data Channel
    .wready_i                 (wready_s2),
    .wvalid_o                 (wvalid_ddctd_s2),
    .wpayload_o               (wpayload_s2),
    .bus_wvalid_i             (bus_wvalid_s2),
    .bus_wpayload_i           (bus_wpayload_s2),
    .bus_wready_o             (bus_sp_wready_s2),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s2),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s2),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s2),
//Burst Response Channel
    .bvalid_i                 (bvalid_s2),
    .bpayload_i               (bpayload_s2),
    .bready_o                 (bready_s2),
    .bus_bready_i             (bus_bready_s2),
    .bus_bvalid_o             (sp_bvalid_s2),
    .bpayload_o               (sp_bpayload_s2),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s2),
    .wcpl_tx_shrd_o           (wcpl_tx_s2)
  );


  DW_axi_sp
   #(`AXI_NMV_S3, 
`AXI_LOG2_NMV_S3, `AXI_AR_S3_NMV, `AXI_AR_S3_NMV_LOG2, `AXI_AR_S3_NMV_P1_LOG2, `AXI_AW_S3_NMV, `AXI_AW_S3_NMV_LOG2, `AXI_AW_S3_NMV_P1_LOG2, `AXI_W_S3_NMV, `AXI_W_S3_NMV_LOG2, `AXI_W_S3_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S3, `AXI_AW_ARB_TYPE_S3, `AXI_W_ARB_TYPE_S3, `AXI_AR_MCA_EN_S3, `AXI_AW_MCA_EN_S3, `AXI_W_MCA_EN_S3, `AXI_AR_MCA_NC_S3, `AXI_AW_MCA_NC_S3, `AXI_W_MCA_NC_S3, `AXI_AR_MCA_NC_W_S3, `AXI_AW_MCA_NC_W_S3, `AXI_W_MCA_NC_W_S3, `AXI_VV_S3_BY_M1, `AXI_VV_S3_BY_M2, `AXI_VV_S3_BY_M3, `AXI_VV_S3_BY_M4, `AXI_VV_S3_BY_M5, `AXI_VV_S3_BY_M6, `AXI_VV_S3_BY_M7, `AXI_VV_S3_BY_M8, `AXI_VV_S3_BY_M9, `AXI_VV_S3_BY_M10, `AXI_VV_S3_BY_M11, `AXI_VV_S3_BY_M12, `AXI_VV_S3_BY_M13, `AXI_VV_S3_BY_M14, `AXI_VV_S3_BY_M15, `AXI_VV_S3_BY_M16, `AXI_WID_S3, `AXI_LOG2_WID_S3, `AXI_LOG2_WID_P1_S3, `AXI_MAX_FARC_S3, `AXI_LOG2_MAX_FARC_P1_S3, `AXI_MAX_FAWC_S3, `AXI_LOG2_MAX_FAWC_S3, `AXI_LOG2_MAX_FAWC_P1_S3, `AXI_HAS_LOCKING,`AXI_AW_LAYER_S3_M1 ,`AXI_AW_LAYER_S3_M2 ,`AXI_AW_LAYER_S3_M3 ,`AXI_AW_LAYER_S3_M4 ,`AXI_AW_LAYER_S3_M5 ,`AXI_AW_LAYER_S3_M6 ,`AXI_AW_LAYER_S3_M7 ,`AXI_AW_LAYER_S3_M8 ,`AXI_AW_LAYER_S3_M9 ,`AXI_AW_LAYER_S3_M10 ,`AXI_AW_LAYER_S3_M11 ,`AXI_AW_LAYER_S3_M12 ,`AXI_AW_LAYER_S3_M13 ,`AXI_AW_LAYER_S3_M14 ,`AXI_AW_LAYER_S3_M15 ,`AXI_AW_LAYER_S3_M16 ,`AXI_AR_LAYER_S3_M1 ,`AXI_AR_LAYER_S3_M2 ,`AXI_AR_LAYER_S3_M3 ,`AXI_AR_LAYER_S3_M4 ,`AXI_AR_LAYER_S3_M5 ,`AXI_AR_LAYER_S3_M6 ,`AXI_AR_LAYER_S3_M7 ,`AXI_AR_LAYER_S3_M8 ,`AXI_AR_LAYER_S3_M9 ,`AXI_AR_LAYER_S3_M10 ,`AXI_AR_LAYER_S3_M11 ,`AXI_AR_LAYER_S3_M12 ,`AXI_AR_LAYER_S3_M13 ,`AXI_AR_LAYER_S3_M14 ,`AXI_AR_LAYER_S3_M15 ,`AXI_AR_LAYER_S3_M16 ,`AXI_W_LAYER_S3_M1 ,`AXI_W_LAYER_S3_M2 ,`AXI_W_LAYER_S3_M3 ,`AXI_W_LAYER_S3_M4 ,`AXI_W_LAYER_S3_M5 ,`AXI_W_LAYER_S3_M6 ,`AXI_W_LAYER_S3_M7 ,`AXI_W_LAYER_S3_M8 ,`AXI_W_LAYER_S3_M9 ,`AXI_W_LAYER_S3_M10 ,`AXI_W_LAYER_S3_M11 ,`AXI_W_LAYER_S3_M12 ,`AXI_W_LAYER_S3_M13 ,`AXI_W_LAYER_S3_M14 ,`AXI_W_LAYER_S3_M15 ,`AXI_W_LAYER_S3_M16 ,`AXI_R_LAYER_M1_S3 ,`AXI_R_LAYER_M2_S3 ,`AXI_R_LAYER_M3_S3 ,`AXI_R_LAYER_M4_S3 ,`AXI_R_LAYER_M5_S3 ,`AXI_R_LAYER_M6_S3 ,`AXI_R_LAYER_M7_S3 ,`AXI_R_LAYER_M8_S3 ,`AXI_R_LAYER_M9_S3 ,`AXI_R_LAYER_M10_S3 ,`AXI_R_LAYER_M11_S3 ,`AXI_R_LAYER_M12_S3 ,`AXI_R_LAYER_M13_S3 ,`AXI_R_LAYER_M14_S3 ,`AXI_R_LAYER_M15_S3 ,`AXI_R_LAYER_M16_S3 ,`AXI_B_LAYER_M1_S3 ,`AXI_B_LAYER_M2_S3 ,`AXI_B_LAYER_M3_S3 ,`AXI_B_LAYER_M4_S3 ,`AXI_B_LAYER_M5_S3 ,`AXI_B_LAYER_M6_S3 ,`AXI_B_LAYER_M7_S3 ,`AXI_B_LAYER_M8_S3 ,`AXI_B_LAYER_M9_S3 ,`AXI_B_LAYER_M10_S3 ,`AXI_B_LAYER_M11_S3 ,`AXI_B_LAYER_M12_S3 ,`AXI_B_LAYER_M13_S3 ,`AXI_B_LAYER_M14_S3 ,`AXI_B_LAYER_M15_S3 ,`AXI_B_LAYER_M16_S3 , `AXI_AW_S3_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S3_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S3_ON_AR_SHARED_ONLY_VAL, `AXI_S3_ON_AW_SHARED_ONLY_VAL, `AXI_S3_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s3 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s3),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s3),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s3),

// Read Address Channel
    .arready_i                (arready_s3),
    .arvalid_o                (arvalid_ddctd_s3),
    .arpayload_o              (arpayload_s3),
    .bus_arvalid_i            (bus_arvalid_s3),
    .bus_arpayload_i          (bus_arpayload_s3),
    .bus_arready_o            (bus_sp_arready_s3),
    .rcpl_tx_shrd_o           (rcpl_tx_s3),
// Read Data Channel
    .rvalid_i                 (rvalid_s3),
    .rpayload_i               (rpayload_s3),
    .rready_o                 (rready_s3),
    .bus_rready_i             (bus_rready_s3),
    .bus_rvalid_o             (sp_rvalid_s3),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s3),
    .rpayload_o               (sp_rpayload_s3),
// Write Address Channel
    .awready_i                (awready_s3),
    .awvalid_o                (awvalid_ddctd_s3),
    .awpayload_o              (awpayload_s3),
    .bus_awvalid_i            (bus_awvalid_s3),
    .bus_awpayload_i          (bus_awpayload_s3),
    .bus_awready_o            (bus_sp_awready_s3),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s3),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s3),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s3),
// Write Data Channel
    .wready_i                 (wready_s3),
    .wvalid_o                 (wvalid_ddctd_s3),
    .wpayload_o               (wpayload_s3),
    .bus_wvalid_i             (bus_wvalid_s3),
    .bus_wpayload_i           (bus_wpayload_s3),
    .bus_wready_o             (bus_sp_wready_s3),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s3),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s3),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s3),
//Burst Response Channel
    .bvalid_i                 (bvalid_s3),
    .bpayload_i               (bpayload_s3),
    .bready_o                 (bready_s3),
    .bus_bready_i             (bus_bready_s3),
    .bus_bvalid_o             (sp_bvalid_s3),
    .bpayload_o               (sp_bpayload_s3),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s3),
    .wcpl_tx_shrd_o           (wcpl_tx_s3)
  );


  DW_axi_sp
   #(`AXI_NMV_S4, 
`AXI_LOG2_NMV_S4, `AXI_AR_S4_NMV, `AXI_AR_S4_NMV_LOG2, `AXI_AR_S4_NMV_P1_LOG2, `AXI_AW_S4_NMV, `AXI_AW_S4_NMV_LOG2, `AXI_AW_S4_NMV_P1_LOG2, `AXI_W_S4_NMV, `AXI_W_S4_NMV_LOG2, `AXI_W_S4_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S4, `AXI_AW_ARB_TYPE_S4, `AXI_W_ARB_TYPE_S4, `AXI_AR_MCA_EN_S4, `AXI_AW_MCA_EN_S4, `AXI_W_MCA_EN_S4, `AXI_AR_MCA_NC_S4, `AXI_AW_MCA_NC_S4, `AXI_W_MCA_NC_S4, `AXI_AR_MCA_NC_W_S4, `AXI_AW_MCA_NC_W_S4, `AXI_W_MCA_NC_W_S4, `AXI_VV_S4_BY_M1, `AXI_VV_S4_BY_M2, `AXI_VV_S4_BY_M3, `AXI_VV_S4_BY_M4, `AXI_VV_S4_BY_M5, `AXI_VV_S4_BY_M6, `AXI_VV_S4_BY_M7, `AXI_VV_S4_BY_M8, `AXI_VV_S4_BY_M9, `AXI_VV_S4_BY_M10, `AXI_VV_S4_BY_M11, `AXI_VV_S4_BY_M12, `AXI_VV_S4_BY_M13, `AXI_VV_S4_BY_M14, `AXI_VV_S4_BY_M15, `AXI_VV_S4_BY_M16, `AXI_WID_S4, `AXI_LOG2_WID_S4, `AXI_LOG2_WID_P1_S4, `AXI_MAX_FARC_S4, `AXI_LOG2_MAX_FARC_P1_S4, `AXI_MAX_FAWC_S4, `AXI_LOG2_MAX_FAWC_S4, `AXI_LOG2_MAX_FAWC_P1_S4, `AXI_HAS_LOCKING,`AXI_AW_LAYER_S4_M1 ,`AXI_AW_LAYER_S4_M2 ,`AXI_AW_LAYER_S4_M3 ,`AXI_AW_LAYER_S4_M4 ,`AXI_AW_LAYER_S4_M5 ,`AXI_AW_LAYER_S4_M6 ,`AXI_AW_LAYER_S4_M7 ,`AXI_AW_LAYER_S4_M8 ,`AXI_AW_LAYER_S4_M9 ,`AXI_AW_LAYER_S4_M10 ,`AXI_AW_LAYER_S4_M11 ,`AXI_AW_LAYER_S4_M12 ,`AXI_AW_LAYER_S4_M13 ,`AXI_AW_LAYER_S4_M14 ,`AXI_AW_LAYER_S4_M15 ,`AXI_AW_LAYER_S4_M16 ,`AXI_AR_LAYER_S4_M1 ,`AXI_AR_LAYER_S4_M2 ,`AXI_AR_LAYER_S4_M3 ,`AXI_AR_LAYER_S4_M4 ,`AXI_AR_LAYER_S4_M5 ,`AXI_AR_LAYER_S4_M6 ,`AXI_AR_LAYER_S4_M7 ,`AXI_AR_LAYER_S4_M8 ,`AXI_AR_LAYER_S4_M9 ,`AXI_AR_LAYER_S4_M10 ,`AXI_AR_LAYER_S4_M11 ,`AXI_AR_LAYER_S4_M12 ,`AXI_AR_LAYER_S4_M13 ,`AXI_AR_LAYER_S4_M14 ,`AXI_AR_LAYER_S4_M15 ,`AXI_AR_LAYER_S4_M16 ,`AXI_W_LAYER_S4_M1 ,`AXI_W_LAYER_S4_M2 ,`AXI_W_LAYER_S4_M3 ,`AXI_W_LAYER_S4_M4 ,`AXI_W_LAYER_S4_M5 ,`AXI_W_LAYER_S4_M6 ,`AXI_W_LAYER_S4_M7 ,`AXI_W_LAYER_S4_M8 ,`AXI_W_LAYER_S4_M9 ,`AXI_W_LAYER_S4_M10 ,`AXI_W_LAYER_S4_M11 ,`AXI_W_LAYER_S4_M12 ,`AXI_W_LAYER_S4_M13 ,`AXI_W_LAYER_S4_M14 ,`AXI_W_LAYER_S4_M15 ,`AXI_W_LAYER_S4_M16 ,`AXI_R_LAYER_M1_S4 ,`AXI_R_LAYER_M2_S4 ,`AXI_R_LAYER_M3_S4 ,`AXI_R_LAYER_M4_S4 ,`AXI_R_LAYER_M5_S4 ,`AXI_R_LAYER_M6_S4 ,`AXI_R_LAYER_M7_S4 ,`AXI_R_LAYER_M8_S4 ,`AXI_R_LAYER_M9_S4 ,`AXI_R_LAYER_M10_S4 ,`AXI_R_LAYER_M11_S4 ,`AXI_R_LAYER_M12_S4 ,`AXI_R_LAYER_M13_S4 ,`AXI_R_LAYER_M14_S4 ,`AXI_R_LAYER_M15_S4 ,`AXI_R_LAYER_M16_S4 ,`AXI_B_LAYER_M1_S4 ,`AXI_B_LAYER_M2_S4 ,`AXI_B_LAYER_M3_S4 ,`AXI_B_LAYER_M4_S4 ,`AXI_B_LAYER_M5_S4 ,`AXI_B_LAYER_M6_S4 ,`AXI_B_LAYER_M7_S4 ,`AXI_B_LAYER_M8_S4 ,`AXI_B_LAYER_M9_S4 ,`AXI_B_LAYER_M10_S4 ,`AXI_B_LAYER_M11_S4 ,`AXI_B_LAYER_M12_S4 ,`AXI_B_LAYER_M13_S4 ,`AXI_B_LAYER_M14_S4 ,`AXI_B_LAYER_M15_S4 ,`AXI_B_LAYER_M16_S4 , `AXI_AW_S4_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S4_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S4_ON_AR_SHARED_ONLY_VAL, `AXI_S4_ON_AW_SHARED_ONLY_VAL, `AXI_S4_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s4 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s4),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s4),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s4),

// Read Address Channel
    .arready_i                (arready_s4),
    .arvalid_o                (arvalid_ddctd_s4),
    .arpayload_o              (arpayload_s4),
    .bus_arvalid_i            (bus_arvalid_s4),
    .bus_arpayload_i          (bus_arpayload_s4),
    .bus_arready_o            (bus_sp_arready_s4),
    .rcpl_tx_shrd_o           (rcpl_tx_s4),
// Read Data Channel
    .rvalid_i                 (rvalid_s4),
    .rpayload_i               (rpayload_s4),
    .rready_o                 (rready_s4),
    .bus_rready_i             (bus_rready_s4),
    .bus_rvalid_o             (sp_rvalid_s4),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s4),
    .rpayload_o               (sp_rpayload_s4),
// Write Address Channel
    .awready_i                (awready_s4),
    .awvalid_o                (awvalid_ddctd_s4),
    .awpayload_o              (awpayload_s4),
    .bus_awvalid_i            (bus_awvalid_s4),
    .bus_awpayload_i          (bus_awpayload_s4),
    .bus_awready_o            (bus_sp_awready_s4),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s4),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s4),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s4),
// Write Data Channel
    .wready_i                 (wready_s4),
    .wvalid_o                 (wvalid_ddctd_s4),
    .wpayload_o               (wpayload_s4),
    .bus_wvalid_i             (bus_wvalid_s4),
    .bus_wpayload_i           (bus_wpayload_s4),
    .bus_wready_o             (bus_sp_wready_s4),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s4),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s4),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s4),
//Burst Response Channel
    .bvalid_i                 (bvalid_s4),
    .bpayload_i               (bpayload_s4),
    .bready_o                 (bready_s4),
    .bus_bready_i             (bus_bready_s4),
    .bus_bvalid_o             (sp_bvalid_s4),
    .bpayload_o               (sp_bpayload_s4),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s4),
    .wcpl_tx_shrd_o           (wcpl_tx_s4)
  );


  DW_axi_sp
   #(`AXI_NMV_S5, 
`AXI_LOG2_NMV_S5, `AXI_AR_S5_NMV, `AXI_AR_S5_NMV_LOG2, `AXI_AR_S5_NMV_P1_LOG2, `AXI_AW_S5_NMV, `AXI_AW_S5_NMV_LOG2, `AXI_AW_S5_NMV_P1_LOG2, `AXI_W_S5_NMV, `AXI_W_S5_NMV_LOG2, `AXI_W_S5_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S5, `AXI_AW_ARB_TYPE_S5, `AXI_W_ARB_TYPE_S5, `AXI_AR_MCA_EN_S5, `AXI_AW_MCA_EN_S5, `AXI_W_MCA_EN_S5, `AXI_AR_MCA_NC_S5, `AXI_AW_MCA_NC_S5, `AXI_W_MCA_NC_S5, `AXI_AR_MCA_NC_W_S5, `AXI_AW_MCA_NC_W_S5, `AXI_W_MCA_NC_W_S5, `AXI_VV_S5_BY_M1, `AXI_VV_S5_BY_M2, `AXI_VV_S5_BY_M3, `AXI_VV_S5_BY_M4, `AXI_VV_S5_BY_M5, `AXI_VV_S5_BY_M6, `AXI_VV_S5_BY_M7, `AXI_VV_S5_BY_M8, `AXI_VV_S5_BY_M9, `AXI_VV_S5_BY_M10, `AXI_VV_S5_BY_M11, `AXI_VV_S5_BY_M12, `AXI_VV_S5_BY_M13, `AXI_VV_S5_BY_M14, `AXI_VV_S5_BY_M15, `AXI_VV_S5_BY_M16, `AXI_WID_S5, `AXI_LOG2_WID_S5, `AXI_LOG2_WID_P1_S5, `AXI_MAX_FARC_S5, `AXI_LOG2_MAX_FARC_P1_S5, `AXI_MAX_FAWC_S5, `AXI_LOG2_MAX_FAWC_S5, `AXI_LOG2_MAX_FAWC_P1_S5, `AXI_HAS_LOCKING,`AXI_AW_LAYER_S5_M1 ,`AXI_AW_LAYER_S5_M2 ,`AXI_AW_LAYER_S5_M3 ,`AXI_AW_LAYER_S5_M4 ,`AXI_AW_LAYER_S5_M5 ,`AXI_AW_LAYER_S5_M6 ,`AXI_AW_LAYER_S5_M7 ,`AXI_AW_LAYER_S5_M8 ,`AXI_AW_LAYER_S5_M9 ,`AXI_AW_LAYER_S5_M10 ,`AXI_AW_LAYER_S5_M11 ,`AXI_AW_LAYER_S5_M12 ,`AXI_AW_LAYER_S5_M13 ,`AXI_AW_LAYER_S5_M14 ,`AXI_AW_LAYER_S5_M15 ,`AXI_AW_LAYER_S5_M16 ,`AXI_AR_LAYER_S5_M1 ,`AXI_AR_LAYER_S5_M2 ,`AXI_AR_LAYER_S5_M3 ,`AXI_AR_LAYER_S5_M4 ,`AXI_AR_LAYER_S5_M5 ,`AXI_AR_LAYER_S5_M6 ,`AXI_AR_LAYER_S5_M7 ,`AXI_AR_LAYER_S5_M8 ,`AXI_AR_LAYER_S5_M9 ,`AXI_AR_LAYER_S5_M10 ,`AXI_AR_LAYER_S5_M11 ,`AXI_AR_LAYER_S5_M12 ,`AXI_AR_LAYER_S5_M13 ,`AXI_AR_LAYER_S5_M14 ,`AXI_AR_LAYER_S5_M15 ,`AXI_AR_LAYER_S5_M16 ,`AXI_W_LAYER_S5_M1 ,`AXI_W_LAYER_S5_M2 ,`AXI_W_LAYER_S5_M3 ,`AXI_W_LAYER_S5_M4 ,`AXI_W_LAYER_S5_M5 ,`AXI_W_LAYER_S5_M6 ,`AXI_W_LAYER_S5_M7 ,`AXI_W_LAYER_S5_M8 ,`AXI_W_LAYER_S5_M9 ,`AXI_W_LAYER_S5_M10 ,`AXI_W_LAYER_S5_M11 ,`AXI_W_LAYER_S5_M12 ,`AXI_W_LAYER_S5_M13 ,`AXI_W_LAYER_S5_M14 ,`AXI_W_LAYER_S5_M15 ,`AXI_W_LAYER_S5_M16 ,`AXI_R_LAYER_M1_S5 ,`AXI_R_LAYER_M2_S5 ,`AXI_R_LAYER_M3_S5 ,`AXI_R_LAYER_M4_S5 ,`AXI_R_LAYER_M5_S5 ,`AXI_R_LAYER_M6_S5 ,`AXI_R_LAYER_M7_S5 ,`AXI_R_LAYER_M8_S5 ,`AXI_R_LAYER_M9_S5 ,`AXI_R_LAYER_M10_S5 ,`AXI_R_LAYER_M11_S5 ,`AXI_R_LAYER_M12_S5 ,`AXI_R_LAYER_M13_S5 ,`AXI_R_LAYER_M14_S5 ,`AXI_R_LAYER_M15_S5 ,`AXI_R_LAYER_M16_S5 ,`AXI_B_LAYER_M1_S5 ,`AXI_B_LAYER_M2_S5 ,`AXI_B_LAYER_M3_S5 ,`AXI_B_LAYER_M4_S5 ,`AXI_B_LAYER_M5_S5 ,`AXI_B_LAYER_M6_S5 ,`AXI_B_LAYER_M7_S5 ,`AXI_B_LAYER_M8_S5 ,`AXI_B_LAYER_M9_S5 ,`AXI_B_LAYER_M10_S5 ,`AXI_B_LAYER_M11_S5 ,`AXI_B_LAYER_M12_S5 ,`AXI_B_LAYER_M13_S5 ,`AXI_B_LAYER_M14_S5 ,`AXI_B_LAYER_M15_S5 ,`AXI_B_LAYER_M16_S5 , `AXI_AW_S5_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S5_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S5_ON_AR_SHARED_ONLY_VAL, `AXI_S5_ON_AW_SHARED_ONLY_VAL, `AXI_S5_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s5 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s5),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s5),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s5),

// Read Address Channel
    .arready_i                (arready_s5),
    .arvalid_o                (arvalid_ddctd_s5),
    .arpayload_o              (arpayload_s5),
    .bus_arvalid_i            (bus_arvalid_s5),
    .bus_arpayload_i          (bus_arpayload_s5),
    .bus_arready_o            (bus_sp_arready_s5),
    .rcpl_tx_shrd_o           (rcpl_tx_s5),
// Read Data Channel
    .rvalid_i                 (rvalid_s5),
    .rpayload_i               (rpayload_s5),
    .rready_o                 (rready_s5),
    .bus_rready_i             (bus_rready_s5),
    .bus_rvalid_o             (sp_rvalid_s5),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s5),
    .rpayload_o               (sp_rpayload_s5),
// Write Address Channel
    .awready_i                (awready_s5),
    .awvalid_o                (awvalid_ddctd_s5),
    .awpayload_o              (awpayload_s5),
    .bus_awvalid_i            (bus_awvalid_s5),
    .bus_awpayload_i          (bus_awpayload_s5),
    .bus_awready_o            (bus_sp_awready_s5),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s5),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s5),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s5),
// Write Data Channel
    .wready_i                 (wready_s5),
    .wvalid_o                 (wvalid_ddctd_s5),
    .wpayload_o               (wpayload_s5),
    .bus_wvalid_i             (bus_wvalid_s5),
    .bus_wpayload_i           (bus_wpayload_s5),
    .bus_wready_o             (bus_sp_wready_s5),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s5),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s5),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s5),
//Burst Response Channel
    .bvalid_i                 (bvalid_s5),
    .bpayload_i               (bpayload_s5),
    .bready_o                 (bready_s5),
    .bus_bready_i             (bus_bready_s5),
    .bus_bvalid_o             (sp_bvalid_s5),
    .bpayload_o               (sp_bpayload_s5),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s5),
    .wcpl_tx_shrd_o           (wcpl_tx_s5)
  );


  DW_axi_sp
   #(`AXI_NMV_S6, 
`AXI_LOG2_NMV_S6, `AXI_AR_S6_NMV, `AXI_AR_S6_NMV_LOG2, `AXI_AR_S6_NMV_P1_LOG2, `AXI_AW_S6_NMV, `AXI_AW_S6_NMV_LOG2, `AXI_AW_S6_NMV_P1_LOG2, `AXI_W_S6_NMV, `AXI_W_S6_NMV_LOG2, `AXI_W_S6_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S6, `AXI_AW_ARB_TYPE_S6, `AXI_W_ARB_TYPE_S6, `AXI_AR_MCA_EN_S6, `AXI_AW_MCA_EN_S6, `AXI_W_MCA_EN_S6, `AXI_AR_MCA_NC_S6, `AXI_AW_MCA_NC_S6, `AXI_W_MCA_NC_S6, `AXI_AR_MCA_NC_W_S6, `AXI_AW_MCA_NC_W_S6, `AXI_W_MCA_NC_W_S6, `AXI_VV_S6_BY_M1, `AXI_VV_S6_BY_M2, `AXI_VV_S6_BY_M3, `AXI_VV_S6_BY_M4, `AXI_VV_S6_BY_M5, `AXI_VV_S6_BY_M6, `AXI_VV_S6_BY_M7, `AXI_VV_S6_BY_M8, `AXI_VV_S6_BY_M9, `AXI_VV_S6_BY_M10, `AXI_VV_S6_BY_M11, `AXI_VV_S6_BY_M12, `AXI_VV_S6_BY_M13, `AXI_VV_S6_BY_M14, `AXI_VV_S6_BY_M15, `AXI_VV_S6_BY_M16, `AXI_WID_S6, `AXI_LOG2_WID_S6, `AXI_LOG2_WID_P1_S6, `AXI_MAX_FARC_S6, `AXI_LOG2_MAX_FARC_P1_S6, `AXI_MAX_FAWC_S6, `AXI_LOG2_MAX_FAWC_S6, `AXI_LOG2_MAX_FAWC_P1_S6, `AXI_HAS_LOCKING,`AXI_AW_LAYER_S6_M1 ,`AXI_AW_LAYER_S6_M2 ,`AXI_AW_LAYER_S6_M3 ,`AXI_AW_LAYER_S6_M4 ,`AXI_AW_LAYER_S6_M5 ,`AXI_AW_LAYER_S6_M6 ,`AXI_AW_LAYER_S6_M7 ,`AXI_AW_LAYER_S6_M8 ,`AXI_AW_LAYER_S6_M9 ,`AXI_AW_LAYER_S6_M10 ,`AXI_AW_LAYER_S6_M11 ,`AXI_AW_LAYER_S6_M12 ,`AXI_AW_LAYER_S6_M13 ,`AXI_AW_LAYER_S6_M14 ,`AXI_AW_LAYER_S6_M15 ,`AXI_AW_LAYER_S6_M16 ,`AXI_AR_LAYER_S6_M1 ,`AXI_AR_LAYER_S6_M2 ,`AXI_AR_LAYER_S6_M3 ,`AXI_AR_LAYER_S6_M4 ,`AXI_AR_LAYER_S6_M5 ,`AXI_AR_LAYER_S6_M6 ,`AXI_AR_LAYER_S6_M7 ,`AXI_AR_LAYER_S6_M8 ,`AXI_AR_LAYER_S6_M9 ,`AXI_AR_LAYER_S6_M10 ,`AXI_AR_LAYER_S6_M11 ,`AXI_AR_LAYER_S6_M12 ,`AXI_AR_LAYER_S6_M13 ,`AXI_AR_LAYER_S6_M14 ,`AXI_AR_LAYER_S6_M15 ,`AXI_AR_LAYER_S6_M16 ,`AXI_W_LAYER_S6_M1 ,`AXI_W_LAYER_S6_M2 ,`AXI_W_LAYER_S6_M3 ,`AXI_W_LAYER_S6_M4 ,`AXI_W_LAYER_S6_M5 ,`AXI_W_LAYER_S6_M6 ,`AXI_W_LAYER_S6_M7 ,`AXI_W_LAYER_S6_M8 ,`AXI_W_LAYER_S6_M9 ,`AXI_W_LAYER_S6_M10 ,`AXI_W_LAYER_S6_M11 ,`AXI_W_LAYER_S6_M12 ,`AXI_W_LAYER_S6_M13 ,`AXI_W_LAYER_S6_M14 ,`AXI_W_LAYER_S6_M15 ,`AXI_W_LAYER_S6_M16 ,`AXI_R_LAYER_M1_S6 ,`AXI_R_LAYER_M2_S6 ,`AXI_R_LAYER_M3_S6 ,`AXI_R_LAYER_M4_S6 ,`AXI_R_LAYER_M5_S6 ,`AXI_R_LAYER_M6_S6 ,`AXI_R_LAYER_M7_S6 ,`AXI_R_LAYER_M8_S6 ,`AXI_R_LAYER_M9_S6 ,`AXI_R_LAYER_M10_S6 ,`AXI_R_LAYER_M11_S6 ,`AXI_R_LAYER_M12_S6 ,`AXI_R_LAYER_M13_S6 ,`AXI_R_LAYER_M14_S6 ,`AXI_R_LAYER_M15_S6 ,`AXI_R_LAYER_M16_S6 ,`AXI_B_LAYER_M1_S6 ,`AXI_B_LAYER_M2_S6 ,`AXI_B_LAYER_M3_S6 ,`AXI_B_LAYER_M4_S6 ,`AXI_B_LAYER_M5_S6 ,`AXI_B_LAYER_M6_S6 ,`AXI_B_LAYER_M7_S6 ,`AXI_B_LAYER_M8_S6 ,`AXI_B_LAYER_M9_S6 ,`AXI_B_LAYER_M10_S6 ,`AXI_B_LAYER_M11_S6 ,`AXI_B_LAYER_M12_S6 ,`AXI_B_LAYER_M13_S6 ,`AXI_B_LAYER_M14_S6 ,`AXI_B_LAYER_M15_S6 ,`AXI_B_LAYER_M16_S6 , `AXI_AW_S6_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S6_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S6_ON_AR_SHARED_ONLY_VAL, `AXI_S6_ON_AW_SHARED_ONLY_VAL, `AXI_S6_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s6 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s6),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s6),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s6),

// Read Address Channel
    .arready_i                (arready_s6),
    .arvalid_o                (arvalid_ddctd_s6),
    .arpayload_o              (arpayload_s6),
    .bus_arvalid_i            (bus_arvalid_s6),
    .bus_arpayload_i          (bus_arpayload_s6),
    .bus_arready_o            (bus_sp_arready_s6),
    .rcpl_tx_shrd_o           (rcpl_tx_s6),
// Read Data Channel
    .rvalid_i                 (rvalid_s6),
    .rpayload_i               (rpayload_s6),
    .rready_o                 (rready_s6),
    .bus_rready_i             (bus_rready_s6),
    .bus_rvalid_o             (sp_rvalid_s6),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s6),
    .rpayload_o               (sp_rpayload_s6),
// Write Address Channel
    .awready_i                (awready_s6),
    .awvalid_o                (awvalid_ddctd_s6),
    .awpayload_o              (awpayload_s6),
    .bus_awvalid_i            (bus_awvalid_s6),
    .bus_awpayload_i          (bus_awpayload_s6),
    .bus_awready_o            (bus_sp_awready_s6),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s6),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s6),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s6),
// Write Data Channel
    .wready_i                 (wready_s6),
    .wvalid_o                 (wvalid_ddctd_s6),
    .wpayload_o               (wpayload_s6),
    .bus_wvalid_i             (bus_wvalid_s6),
    .bus_wpayload_i           (bus_wpayload_s6),
    .bus_wready_o             (bus_sp_wready_s6),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s6),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s6),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s6),
//Burst Response Channel
    .bvalid_i                 (bvalid_s6),
    .bpayload_i               (bpayload_s6),
    .bready_o                 (bready_s6),
    .bus_bready_i             (bus_bready_s6),
    .bus_bvalid_o             (sp_bvalid_s6),
    .bpayload_o               (sp_bpayload_s6),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s6),
    .wcpl_tx_shrd_o           (wcpl_tx_s6)
  );


  DW_axi_sp
   #(`AXI_NMV_S7, 
`AXI_LOG2_NMV_S7, `AXI_AR_S7_NMV, `AXI_AR_S7_NMV_LOG2, `AXI_AR_S7_NMV_P1_LOG2, `AXI_AW_S7_NMV, `AXI_AW_S7_NMV_LOG2, `AXI_AW_S7_NMV_P1_LOG2, `AXI_W_S7_NMV, `AXI_W_S7_NMV_LOG2, `AXI_W_S7_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S7, `AXI_AW_ARB_TYPE_S7, `AXI_W_ARB_TYPE_S7, `AXI_AR_MCA_EN_S7, `AXI_AW_MCA_EN_S7, `AXI_W_MCA_EN_S7, `AXI_AR_MCA_NC_S7, `AXI_AW_MCA_NC_S7, `AXI_W_MCA_NC_S7, `AXI_AR_MCA_NC_W_S7, `AXI_AW_MCA_NC_W_S7, `AXI_W_MCA_NC_W_S7, `AXI_VV_S7_BY_M1, `AXI_VV_S7_BY_M2, `AXI_VV_S7_BY_M3, `AXI_VV_S7_BY_M4, `AXI_VV_S7_BY_M5, `AXI_VV_S7_BY_M6, `AXI_VV_S7_BY_M7, `AXI_VV_S7_BY_M8, `AXI_VV_S7_BY_M9, `AXI_VV_S7_BY_M10, `AXI_VV_S7_BY_M11, `AXI_VV_S7_BY_M12, `AXI_VV_S7_BY_M13, `AXI_VV_S7_BY_M14, `AXI_VV_S7_BY_M15, `AXI_VV_S7_BY_M16, `AXI_WID_S7, `AXI_LOG2_WID_S7, `AXI_LOG2_WID_P1_S7, `AXI_MAX_FARC_S7, `AXI_LOG2_MAX_FARC_P1_S7, `AXI_MAX_FAWC_S7, `AXI_LOG2_MAX_FAWC_S7, `AXI_LOG2_MAX_FAWC_P1_S7, `AXI_HAS_LOCKING,`AXI_AW_LAYER_S7_M1 ,`AXI_AW_LAYER_S7_M2 ,`AXI_AW_LAYER_S7_M3 ,`AXI_AW_LAYER_S7_M4 ,`AXI_AW_LAYER_S7_M5 ,`AXI_AW_LAYER_S7_M6 ,`AXI_AW_LAYER_S7_M7 ,`AXI_AW_LAYER_S7_M8 ,`AXI_AW_LAYER_S7_M9 ,`AXI_AW_LAYER_S7_M10 ,`AXI_AW_LAYER_S7_M11 ,`AXI_AW_LAYER_S7_M12 ,`AXI_AW_LAYER_S7_M13 ,`AXI_AW_LAYER_S7_M14 ,`AXI_AW_LAYER_S7_M15 ,`AXI_AW_LAYER_S7_M16 ,`AXI_AR_LAYER_S7_M1 ,`AXI_AR_LAYER_S7_M2 ,`AXI_AR_LAYER_S7_M3 ,`AXI_AR_LAYER_S7_M4 ,`AXI_AR_LAYER_S7_M5 ,`AXI_AR_LAYER_S7_M6 ,`AXI_AR_LAYER_S7_M7 ,`AXI_AR_LAYER_S7_M8 ,`AXI_AR_LAYER_S7_M9 ,`AXI_AR_LAYER_S7_M10 ,`AXI_AR_LAYER_S7_M11 ,`AXI_AR_LAYER_S7_M12 ,`AXI_AR_LAYER_S7_M13 ,`AXI_AR_LAYER_S7_M14 ,`AXI_AR_LAYER_S7_M15 ,`AXI_AR_LAYER_S7_M16 ,`AXI_W_LAYER_S7_M1 ,`AXI_W_LAYER_S7_M2 ,`AXI_W_LAYER_S7_M3 ,`AXI_W_LAYER_S7_M4 ,`AXI_W_LAYER_S7_M5 ,`AXI_W_LAYER_S7_M6 ,`AXI_W_LAYER_S7_M7 ,`AXI_W_LAYER_S7_M8 ,`AXI_W_LAYER_S7_M9 ,`AXI_W_LAYER_S7_M10 ,`AXI_W_LAYER_S7_M11 ,`AXI_W_LAYER_S7_M12 ,`AXI_W_LAYER_S7_M13 ,`AXI_W_LAYER_S7_M14 ,`AXI_W_LAYER_S7_M15 ,`AXI_W_LAYER_S7_M16 ,`AXI_R_LAYER_M1_S7 ,`AXI_R_LAYER_M2_S7 ,`AXI_R_LAYER_M3_S7 ,`AXI_R_LAYER_M4_S7 ,`AXI_R_LAYER_M5_S7 ,`AXI_R_LAYER_M6_S7 ,`AXI_R_LAYER_M7_S7 ,`AXI_R_LAYER_M8_S7 ,`AXI_R_LAYER_M9_S7 ,`AXI_R_LAYER_M10_S7 ,`AXI_R_LAYER_M11_S7 ,`AXI_R_LAYER_M12_S7 ,`AXI_R_LAYER_M13_S7 ,`AXI_R_LAYER_M14_S7 ,`AXI_R_LAYER_M15_S7 ,`AXI_R_LAYER_M16_S7 ,`AXI_B_LAYER_M1_S7 ,`AXI_B_LAYER_M2_S7 ,`AXI_B_LAYER_M3_S7 ,`AXI_B_LAYER_M4_S7 ,`AXI_B_LAYER_M5_S7 ,`AXI_B_LAYER_M6_S7 ,`AXI_B_LAYER_M7_S7 ,`AXI_B_LAYER_M8_S7 ,`AXI_B_LAYER_M9_S7 ,`AXI_B_LAYER_M10_S7 ,`AXI_B_LAYER_M11_S7 ,`AXI_B_LAYER_M12_S7 ,`AXI_B_LAYER_M13_S7 ,`AXI_B_LAYER_M14_S7 ,`AXI_B_LAYER_M15_S7 ,`AXI_B_LAYER_M16_S7 , `AXI_AW_S7_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S7_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S7_ON_AR_SHARED_ONLY_VAL, `AXI_S7_ON_AW_SHARED_ONLY_VAL, `AXI_S7_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s7 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s7),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s7),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s7),

// Read Address Channel
    .arready_i                (arready_s7),
    .arvalid_o                (arvalid_ddctd_s7),
    .arpayload_o              (arpayload_s7),
    .bus_arvalid_i            (bus_arvalid_s7),
    .bus_arpayload_i          (bus_arpayload_s7),
    .bus_arready_o            (bus_sp_arready_s7),
    .rcpl_tx_shrd_o           (rcpl_tx_s7),
// Read Data Channel
    .rvalid_i                 (rvalid_s7),
    .rpayload_i               (rpayload_s7),
    .rready_o                 (rready_s7),
    .bus_rready_i             (bus_rready_s7),
    .bus_rvalid_o             (sp_rvalid_s7),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s7),
    .rpayload_o               (sp_rpayload_s7),
// Write Address Channel
    .awready_i                (awready_s7),
    .awvalid_o                (awvalid_ddctd_s7),
    .awpayload_o              (awpayload_s7),
    .bus_awvalid_i            (bus_awvalid_s7),
    .bus_awpayload_i          (bus_awpayload_s7),
    .bus_awready_o            (bus_sp_awready_s7),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s7),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s7),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s7),
// Write Data Channel
    .wready_i                 (wready_s7),
    .wvalid_o                 (wvalid_ddctd_s7),
    .wpayload_o               (wpayload_s7),
    .bus_wvalid_i             (bus_wvalid_s7),
    .bus_wpayload_i           (bus_wpayload_s7),
    .bus_wready_o             (bus_sp_wready_s7),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s7),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s7),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s7),
//Burst Response Channel
    .bvalid_i                 (bvalid_s7),
    .bpayload_i               (bpayload_s7),
    .bready_o                 (bready_s7),
    .bus_bready_i             (bus_bready_s7),
    .bus_bvalid_o             (sp_bvalid_s7),
    .bpayload_o               (sp_bpayload_s7),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s7),
    .wcpl_tx_shrd_o           (wcpl_tx_s7)
  );


  DW_axi_sp
   #(`AXI_NMV_S8, 
`AXI_LOG2_NMV_S8, `AXI_AR_S8_NMV, `AXI_AR_S8_NMV_LOG2, `AXI_AR_S8_NMV_P1_LOG2, `AXI_AW_S8_NMV, `AXI_AW_S8_NMV_LOG2, `AXI_AW_S8_NMV_P1_LOG2, `AXI_W_S8_NMV, `AXI_W_S8_NMV_LOG2, `AXI_W_S8_NMV_P1_LOG2, `AXI_AR_ARB_TYPE_S8, `AXI_AW_ARB_TYPE_S8, `AXI_W_ARB_TYPE_S8, `AXI_AR_MCA_EN_S8, `AXI_AW_MCA_EN_S8, `AXI_W_MCA_EN_S8, `AXI_AR_MCA_NC_S8, `AXI_AW_MCA_NC_S8, `AXI_W_MCA_NC_S8, `AXI_AR_MCA_NC_W_S8, `AXI_AW_MCA_NC_W_S8, `AXI_W_MCA_NC_W_S8, `AXI_VV_S8_BY_M1, `AXI_VV_S8_BY_M2, `AXI_VV_S8_BY_M3, `AXI_VV_S8_BY_M4, `AXI_VV_S8_BY_M5, `AXI_VV_S8_BY_M6, `AXI_VV_S8_BY_M7, `AXI_VV_S8_BY_M8, `AXI_VV_S8_BY_M9, `AXI_VV_S8_BY_M10, `AXI_VV_S8_BY_M11, `AXI_VV_S8_BY_M12, `AXI_VV_S8_BY_M13, `AXI_VV_S8_BY_M14, `AXI_VV_S8_BY_M15, `AXI_VV_S8_BY_M16, `AXI_WID_S8, `AXI_LOG2_WID_S8, `AXI_LOG2_WID_P1_S8, `AXI_MAX_FARC_S8, `AXI_LOG2_MAX_FARC_P1_S8, `AXI_MAX_FAWC_S8, `AXI_LOG2_MAX_FAWC_S8, `AXI_LOG2_MAX_FAWC_P1_S8, `AXI_HAS_LOCKING,`AXI_AW_LAYER_S8_M1 ,`AXI_AW_LAYER_S8_M2 ,`AXI_AW_LAYER_S8_M3 ,`AXI_AW_LAYER_S8_M4 ,`AXI_AW_LAYER_S8_M5 ,`AXI_AW_LAYER_S8_M6 ,`AXI_AW_LAYER_S8_M7 ,`AXI_AW_LAYER_S8_M8 ,`AXI_AW_LAYER_S8_M9 ,`AXI_AW_LAYER_S8_M10 ,`AXI_AW_LAYER_S8_M11 ,`AXI_AW_LAYER_S8_M12 ,`AXI_AW_LAYER_S8_M13 ,`AXI_AW_LAYER_S8_M14 ,`AXI_AW_LAYER_S8_M15 ,`AXI_AW_LAYER_S8_M16 ,`AXI_AR_LAYER_S8_M1 ,`AXI_AR_LAYER_S8_M2 ,`AXI_AR_LAYER_S8_M3 ,`AXI_AR_LAYER_S8_M4 ,`AXI_AR_LAYER_S8_M5 ,`AXI_AR_LAYER_S8_M6 ,`AXI_AR_LAYER_S8_M7 ,`AXI_AR_LAYER_S8_M8 ,`AXI_AR_LAYER_S8_M9 ,`AXI_AR_LAYER_S8_M10 ,`AXI_AR_LAYER_S8_M11 ,`AXI_AR_LAYER_S8_M12 ,`AXI_AR_LAYER_S8_M13 ,`AXI_AR_LAYER_S8_M14 ,`AXI_AR_LAYER_S8_M15 ,`AXI_AR_LAYER_S8_M16 ,`AXI_W_LAYER_S8_M1 ,`AXI_W_LAYER_S8_M2 ,`AXI_W_LAYER_S8_M3 ,`AXI_W_LAYER_S8_M4 ,`AXI_W_LAYER_S8_M5 ,`AXI_W_LAYER_S8_M6 ,`AXI_W_LAYER_S8_M7 ,`AXI_W_LAYER_S8_M8 ,`AXI_W_LAYER_S8_M9 ,`AXI_W_LAYER_S8_M10 ,`AXI_W_LAYER_S8_M11 ,`AXI_W_LAYER_S8_M12 ,`AXI_W_LAYER_S8_M13 ,`AXI_W_LAYER_S8_M14 ,`AXI_W_LAYER_S8_M15 ,`AXI_W_LAYER_S8_M16 ,`AXI_R_LAYER_M1_S8 ,`AXI_R_LAYER_M2_S8 ,`AXI_R_LAYER_M3_S8 ,`AXI_R_LAYER_M4_S8 ,`AXI_R_LAYER_M5_S8 ,`AXI_R_LAYER_M6_S8 ,`AXI_R_LAYER_M7_S8 ,`AXI_R_LAYER_M8_S8 ,`AXI_R_LAYER_M9_S8 ,`AXI_R_LAYER_M10_S8 ,`AXI_R_LAYER_M11_S8 ,`AXI_R_LAYER_M12_S8 ,`AXI_R_LAYER_M13_S8 ,`AXI_R_LAYER_M14_S8 ,`AXI_R_LAYER_M15_S8 ,`AXI_R_LAYER_M16_S8 ,`AXI_B_LAYER_M1_S8 ,`AXI_B_LAYER_M2_S8 ,`AXI_B_LAYER_M3_S8 ,`AXI_B_LAYER_M4_S8 ,`AXI_B_LAYER_M5_S8 ,`AXI_B_LAYER_M6_S8 ,`AXI_B_LAYER_M7_S8 ,`AXI_B_LAYER_M8_S8 ,`AXI_B_LAYER_M9_S8 ,`AXI_B_LAYER_M10_S8 ,`AXI_B_LAYER_M11_S8 ,`AXI_B_LAYER_M12_S8 ,`AXI_B_LAYER_M13_S8 ,`AXI_B_LAYER_M14_S8 ,`AXI_B_LAYER_M15_S8 ,`AXI_B_LAYER_M16_S8 , `AXI_AW_S8_HAS_SHRD_DDCTD_LNK_VAL, `AXI_W_S8_HAS_SHRD_DDCTD_LNK_VAL, `AXI_S8_ON_AR_SHARED_ONLY_VAL, `AXI_S8_ON_AW_SHARED_ONLY_VAL, `AXI_S8_ON_W_SHARED_ONLY_VAL
  )
  U_DW_axi_sp_s8 (
    .aclk_i                   (aclk),
    .aresetn_i                (aresetn),
    .ar_bus_mst_priorities_i  (ar_bus_mst_priorities_s8),
    .aw_bus_mst_priorities_i  (aw_bus_mst_priorities_s8),
    .w_bus_mst_priorities_i   (w_bus_mst_priorities_s8),

// Read Address Channel
    .arready_i                (arready_s8),
    .arvalid_o                (arvalid_ddctd_s8),
    .arpayload_o              (arpayload_s8),
    .bus_arvalid_i            (bus_arvalid_s8),
    .bus_arpayload_i          (bus_arpayload_s8),
    .bus_arready_o            (bus_sp_arready_s8),
    .rcpl_tx_shrd_o           (rcpl_tx_s8),
// Read Data Channel
    .rvalid_i                 (rvalid_s8),
    .rpayload_i               (rpayload_s8),
    .rready_o                 (rready_s8),
    .bus_rready_i             (bus_rready_s8),
    .bus_rvalid_o             (sp_rvalid_s8),
    .r_shrd_ch_req_o          (r_shrd_ch_req_s8),
    .rpayload_o               (sp_rpayload_s8),
// Write Address Channel
    .awready_i                (awready_s8),
    .awvalid_o                (awvalid_ddctd_s8),
    .awpayload_o              (awpayload_s8),
    .bus_awvalid_i            (bus_awvalid_s8),
    .bus_awpayload_i          (bus_awpayload_s8),
    .bus_awready_o            (bus_sp_awready_s8),
    .aw_shrd_lyr_granted_o    (aw_shrd_lyr_granted_s8),
    .issued_wtx_mst_oh_o      (issued_wtx_mst_oh_o_s8),
    .issued_wtx_mst_oh_i      (issued_wtx_mst_oh_i_s8),
// Write Data Channel
    .wready_i                 (wready_s8),
    .wvalid_o                 (wvalid_ddctd_s8),
    .wpayload_o               (wpayload_s8),
    .bus_wvalid_i             (bus_wvalid_s8),
    .bus_wpayload_i           (bus_wpayload_s8),
    .bus_wready_o             (bus_sp_wready_s8),
    .issued_tx_shrd_i         (issued_wtx_shrd_sys_s8),
    .issued_tx_shrd_mst_oh_i  (issued_wtx_shrd_mst_oh_s8),
    .shrd_w_nxt_fb_pend_o     (shrd_w_nxt_fb_pend_s8),
//Burst Response Channel
    .bvalid_i                 (bvalid_s8),
    .bpayload_i               (bpayload_s8),
    .bready_o                 (bready_s8),
    .bus_bready_i             (bus_bready_s8),
    .bus_bvalid_o             (sp_bvalid_s8),
    .bpayload_o               (sp_bpayload_s8),
    .b_shrd_ch_req_o          (b_shrd_ch_req_s8),
    .wcpl_tx_shrd_o           (wcpl_tx_s8)
  );


















  DW_axi_mp
   #(`AXI_SYS_NUM_FOR_M1 - 1, `AXI_IS_ICM_M1, `AXI_NSP1V_M1, `AXI_LOG2_NSP1V_M1, `AXI_R_M1_NSV, `AXI_R_M1_NSV_LOG2, `AXI_R_M1_NSV_P1_LOG2, `AXI_B_M1_NSV, `AXI_B_M1_NSV_LOG2, `AXI_B_M1_NSV_P1_LOG2, `AXI_R_ARB_TYPE_M1, `AXI_B_ARB_TYPE_M1, `AXI_R_MCA_EN_M1, `AXI_B_MCA_EN_M1, `AXI_R_MCA_NC_M1, `AXI_B_MCA_NC_M1, `AXI_R_MCA_NC_W_M1, `AXI_B_MCA_NC_W_M1, 1,  /* Default slave always visible in normal mode. */ `AXI_NV_S1_BY_M1, `AXI_NV_S2_BY_M1, `AXI_NV_S3_BY_M1, `AXI_NV_S4_BY_M1, `AXI_NV_S5_BY_M1, `AXI_NV_S6_BY_M1, `AXI_NV_S7_BY_M1, `AXI_NV_S8_BY_M1, `AXI_NV_S9_BY_M1, `AXI_NV_S10_BY_M1, `AXI_NV_S11_BY_M1, `AXI_NV_S12_BY_M1, `AXI_NV_S13_BY_M1, `AXI_NV_S14_BY_M1, `AXI_NV_S15_BY_M1, `AXI_NV_S16_BY_M1, 1,  /* Default slave always visible in boot mode. */ `AXI_BV_S1_BY_M1, `AXI_BV_S2_BY_M1, `AXI_BV_S3_BY_M1, `AXI_BV_S4_BY_M1, `AXI_BV_S5_BY_M1, `AXI_BV_S6_BY_M1, `AXI_BV_S7_BY_M1, `AXI_BV_S8_BY_M1, `AXI_BV_S9_BY_M1, `AXI_BV_S10_BY_M1, `AXI_BV_S11_BY_M1, `AXI_BV_S12_BY_M1, `AXI_BV_S13_BY_M1, `AXI_BV_S14_BY_M1, `AXI_BV_S15_BY_M1, `AXI_BV_S16_BY_M1, `AXI_MAX_RCA_ID_M1, `AXI_MAX_WCA_ID_M1, `AXI_MAX_URIDA_M1, `AXI_MAX_UWIDA_M1, `AXI_LOG2_MAX_RCA_ID_P1_M1, `AXI_LOG2_MAX_WCA_ID_P1_M1, `AXI_LOG2_MAX_URIDA_M1, `AXI_LOG2_MAX_UWIDA_M1, `AXI_RI_LIMIT_M1
,`AXI_AR_LAYER_S0_M1 ,`AXI_AR_LAYER_S1_M1 ,`AXI_AR_LAYER_S2_M1 ,`AXI_AR_LAYER_S3_M1 ,`AXI_AR_LAYER_S4_M1 ,`AXI_AR_LAYER_S5_M1 ,`AXI_AR_LAYER_S6_M1 ,`AXI_AR_LAYER_S7_M1 ,`AXI_AR_LAYER_S8_M1 ,`AXI_AR_LAYER_S9_M1 ,`AXI_AR_LAYER_S10_M1 ,`AXI_AR_LAYER_S11_M1 ,`AXI_AR_LAYER_S12_M1 ,`AXI_AR_LAYER_S13_M1 ,`AXI_AR_LAYER_S14_M1 ,`AXI_AR_LAYER_S15_M1 ,`AXI_AR_LAYER_S16_M1 ,`AXI_AW_LAYER_S0_M1 ,`AXI_AW_LAYER_S1_M1 ,`AXI_AW_LAYER_S2_M1 ,`AXI_AW_LAYER_S3_M1 ,`AXI_AW_LAYER_S4_M1 ,`AXI_AW_LAYER_S5_M1 ,`AXI_AW_LAYER_S6_M1 ,`AXI_AW_LAYER_S7_M1 ,`AXI_AW_LAYER_S8_M1 ,`AXI_AW_LAYER_S9_M1 ,`AXI_AW_LAYER_S10_M1 ,`AXI_AW_LAYER_S11_M1 ,`AXI_AW_LAYER_S12_M1 ,`AXI_AW_LAYER_S13_M1 ,`AXI_AW_LAYER_S14_M1 ,`AXI_AW_LAYER_S15_M1 ,`AXI_AW_LAYER_S16_M1 ,`AXI_W_LAYER_S0_M1 ,`AXI_W_LAYER_S1_M1 ,`AXI_W_LAYER_S2_M1 ,`AXI_W_LAYER_S3_M1 ,`AXI_W_LAYER_S4_M1 ,`AXI_W_LAYER_S5_M1 ,`AXI_W_LAYER_S6_M1 ,`AXI_W_LAYER_S7_M1 ,`AXI_W_LAYER_S8_M1 ,`AXI_W_LAYER_S9_M1 ,`AXI_W_LAYER_S10_M1 ,`AXI_W_LAYER_S11_M1 ,`AXI_W_LAYER_S12_M1 ,`AXI_W_LAYER_S13_M1 ,`AXI_W_LAYER_S14_M1 ,`AXI_W_LAYER_S15_M1 ,`AXI_W_LAYER_S16_M1 ,`AXI_AW_S0_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S1_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S2_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S3_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S4_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S5_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S6_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S7_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S8_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S9_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S10_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S11_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S12_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S13_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S14_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S15_HAS_SHRD_DDCTD_LNK_VAL ,`AXI_AW_S16_HAS_SHRD_DDCTD_LNK_VAL , `AXI_M1_ON_R_SHARED_ONLY_VAL, `AXI_M1_ON_B_SHARED_ONLY_VAL
  )
  U_DW_axi_mp_m1 (
    .aclk_i                      (aclk),
    .aresetn_i                   (aresetn),
    .remap_n_i                   (remap_n),
    .r_bus_slv_priorities_i      (r_bus_slv_priorities_m1),
    .b_bus_slv_priorities_i      (b_bus_slv_priorities_m1),

// Read Address Channel
    .arvalid_i                   (arvalid_m1),
    .arpayload_i                 (arpayload_m1),
    .arready_o                   (arready_m1),
    .bus_arready_i               (bus_arready_m1),
    .bus_arvalid_o               (mp_arvalid_m1),
    .ar_shrd_ch_req_o            (ar_shrd_ch_req_m1),
    .arpayload_o                 (mp_arpayload_m1),
// Read Data Channel
    .rready_i                    (rready_m1),
    .rvalid_o                    (rvalid_ddctd_m1),
    .rpayload_o                  (rpayload_m1),
    .bus_rvalid_i                (bus_rvalid_m1),
    .bus_rpayload_i              (bus_rpayload_m1),
    .bus_rready_o                (bus_mp_rready_m1),
    .rcpl_tx_shrd_i              (rcpl_tx_shrd_sys_m1),
    .rcpl_id_shrd_i              (rcpl_id_shrd[`AXI_MIDW-1:0]),
// Write Address Channel
    .awvalid_i                   (awvalid_m1),
    .awpayload_i                 (awpayload_m1),
    .awready_o                   (awready_m1),
    .bus_awready_i               (bus_awready_m1),
    .aw_shrd_lyr_granted_s_bus_i (aw_shrd_lyr_granted_m1_s_bus),
    .issued_wtx_shrd_sys_s_bus_i (issued_wtx_shrd_sys_m1_s_bus),
    .bus_awvalid_o               (mp_awvalid_m1),
    .aw_shrd_ch_req_o            (aw_shrd_ch_req_m1),
    .awpayload_o                 (mp_awpayload_m1),
// Write Data Channel
    .wvalid_i                    (wvalid_m1),
    .wpayload_i                  (wpayload_m1),
    .wready_o                    (wready_m1),
    .bus_wready_i                (bus_wready_m1),
    .bus_wvalid_o                (mp_wvalid_m1),
    .w_shrd_ch_req_o             (w_shrd_ch_req_m1),
    .wpayload_o                  (mp_wpayload_m1),
//Burst Response Channel
    .bready_i                    (bready_m1),
    .bvalid_o                    (bvalid_ddctd_m1),
    .bpayload_o                  (bpayload_m1),
    .bus_bvalid_i                (bus_bvalid_m1),
    .bus_bpayload_i              (bus_bpayload_m1),
    .bus_bready_o                (bus_mp_bready_m1),
    .wcpl_tx_shrd_i              (wcpl_tx_shrd_sys_m1),
    .wcpl_id_shrd_i              (wcpl_id_shrd[`AXI_MIDW-1:0])
  );



































// ---------------------------------------------------------------------
// To avoid a deadlock condition with shared to dedicated links on the 
// AW channel, when the shared layer is pipelened and also the AW 
// channel has the arbiter pipeline stage enabled, the arb pl internal
// register slice that sits between the shared AW layer and any
// connected dedicatd layers must be unique to each shared to dedicated
// link, as opposed to a common pipeline stage for all shared to
// dedicated links. This prevents a situation where a t/x is accepted
// into the shared layer pipeline, but is blocked from reaching its
// destination by a t/x to a shared to dedicated link. This situation
// introduces the possibility of deadlock on the AW channel, and needs
//  to be prevented.


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  


  `undef AXI_REMAP
  `undef AXI_HAS_S0
  `undef AXI_HAS_S1
  `undef AXI_HAS_S2
  `undef AXI_HAS_S3
  `undef AXI_HAS_S4
  `undef AXI_HAS_S5
  `undef AXI_HAS_S6
  `undef AXI_HAS_S7
  `undef AXI_HAS_S8
  `undef AXI_HAS_M1
  `undef AXI_V_S0_BY_M1
  `undef AXI_V_S1_BY_M1
  `undef AXI_V_S2_BY_M1
  `undef AXI_V_S3_BY_M1
  `undef AXI_V_S4_BY_M1
  `undef AXI_V_S5_BY_M1
  `undef AXI_V_S6_BY_M1
  `undef AXI_V_S7_BY_M1
  `undef AXI_V_S8_BY_M1
endmodule 
