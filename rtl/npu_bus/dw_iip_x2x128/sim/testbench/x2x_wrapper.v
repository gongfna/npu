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

`include "DW_axi_cc_constants.v"
`include "DW_axi_x2x_cc_constants.v"
`include "DW_axi_x2x_constants.v"

module x2x_wrapper(
  // General Configurable signals
  tz_secure_m,
  wrap_tz_secure_m,
  tz_secure_s,
  wrap_tz_secure_s,
 
  // Low power handshaking interface
  csysreq,
  csysack,
  cactive,
  wrap_csysreq,
  wrap_csysack,
  wrap_cactive,

  // MP Write Address Channel 
  awvalid_m,
  awaddr_m,
  awid_m,
  awlen_m,
  awsize_m,
  awburst_m,
  awlock_m,
  awcache_m,
  awprot_m,
  awsideband_m,
  awready_m,

  // MP Write Data Channel 
  wvalid_m,
  wid_m,
  wdata_m,
  wstrb_m,
  wlast_m,
  wsideband_m,
  wready_m,

  // MP Write Response Channel
  bvalid_m,
  bid_m,
  bresp_m,
  bsideband_m,
  bready_m,

  // MP Read Address Channel
  arvalid_m,
  arid_m,
  araddr_m,
  arlen_m,
  arsize_m,
  arburst_m,
  arlock_m,
  arcache_m,
  arprot_m,
  arsideband_m,
  arready_m,

  // MP Read Data Channel
  rvalid_m,
  rid_m,
  rdata_m,
  rresp_m,
  rlast_m,
  rsideband_m,
  rready_m,

  // WRAPPER TO X2X MASTER PORT I/O

  // MP Write Address Channel 
  awvalid_mp,
  awaddr_mp,
  awid_mp,
  awlen_mp,
  awsize_mp,
  awburst_mp,
  awlock_mp,
  awcache_mp,
  awprot_mp,
  awsideband_mp,
  awready_mp,

  // MP Write Data Channel 
  wvalid_mp,
  wid_mp,
  wdata_mp,
  wstrb_mp,
  wlast_mp,
  wsideband_mp,
  wready_mp,

  // MP Write Response Channel
  bvalid_mp,
  bid_mp,
  bresp_mp,
  bsideband_mp,
  bready_mp,

  // MP Read Address Channel
  arvalid_mp,
  arid_mp,
  araddr_mp,
  arlen_mp,
  arsize_mp,
  arburst_mp,
  arlock_mp,
  arcache_mp,
  arprot_mp,
  arsideband_mp,
  arready_mp,

  // MP Read Data Channel
  rvalid_mp,
  rid_mp,
  rdata_mp,
  rresp_mp,
  rlast_mp,
  rsideband_mp,
  rready_mp,

  // SP Write Address Channel 1
  awvalid_s1,
  awaddr_s1,
  awid_s1,
  awlen_s1,
  awsize_s1,
  awburst_s1,
  awlock_s1,
  awcache_s1,
  awprot_s1,
  awsideband_s1,
  awready_s1,

  // SP Write Data Channel 1
  wvalid_s1,
  wid_s1,
  wdata_s1,
  wstrb_s1,
  wlast_s1,
  wsideband_s1,
  wready_s1,

  // SP Write Response Channel 1
  bvalid_s1,
  bid_s1,
  bresp_s1,
  bsideband_s1,
  bready_s1,

  // SP Write Address Channel 2
  awvalid_s2,
  awaddr_s2,
  awid_s2,
  awlen_s2,
  awsize_s2,
  awburst_s2,
  awlock_s2,
  awcache_s2,
  awprot_s2,
  awsideband_s2,
  awready_s2,

  // SP Write Data Channel 2
  wvalid_s2,
  wid_s2,
  wdata_s2,
  wstrb_s2,
  wlast_s2,
  wsideband_s2,
  wready_s2,

  // SP Write Response Channel 2
  bvalid_s2,
  bid_s2,
  bresp_s2,
  bsideband_s2,
  bready_s2,

  // SP Write Address Channel 3
  awvalid_s3,
  awaddr_s3,
  awid_s3,
  awlen_s3,
  awsize_s3,
  awburst_s3,
  awlock_s3,
  awcache_s3,
  awprot_s3,
  awsideband_s3,
  awready_s3,

  // SP Write Data Channel 3
  wvalid_s3,
  wid_s3,
  wdata_s3,
  wstrb_s3,
  wlast_s3,
  wsideband_s3,
  wready_s3,

  // SP Write Response Channel 3
  bvalid_s3,
  bid_s3,
  bresp_s3,
  bsideband_s3,
  bready_s3,

  // SP Write Address Channel 4
  awvalid_s4,
  awaddr_s4,
  awid_s4,
  awlen_s4,
  awsize_s4,
  awburst_s4,
  awlock_s4,
  awcache_s4,
  awprot_s4,
  awsideband_s4,
  awready_s4,

  // SP Write Data Channel 4
  wvalid_s4,
  wid_s4,
  wdata_s4,
  wstrb_s4,
  wlast_s4,
  wsideband_s4,
  wready_s4,

  // SP Write Response Channel 4
  bvalid_s4,
  bid_s4,
  bresp_s4,
  bsideband_s4,
  bready_s4,

  // SP Write Address Channel 5
  awvalid_s5,
  awaddr_s5,
  awid_s5,
  awlen_s5,
  awsize_s5,
  awburst_s5,
  awlock_s5,
  awcache_s5,
  awprot_s5,
  awsideband_s5,
  awready_s5,

  // SP Write Data Channel 5
  wvalid_s5,
  wid_s5,
  wdata_s5,
  wstrb_s5,
  wlast_s5,
  wsideband_s5,
  wready_s5,

  // SP Write Response Channel 5
  bvalid_s5,
  bid_s5,
  bresp_s5,
  bsideband_s5,
  bready_s5,

  // SP Write Address Channel 6
  awvalid_s6,
  awaddr_s6,
  awid_s6,
  awlen_s6,
  awsize_s6,
  awburst_s6,
  awlock_s6,
  awcache_s6,
  awprot_s6,
  awsideband_s6,
  awready_s6,

  // SP Write Data Channel 6
  wvalid_s6,
  wid_s6,
  wdata_s6,
  wstrb_s6,
  wlast_s6,
  wsideband_s6,
  wready_s6,

  // SP Write Response Channel 6
  bvalid_s6,
  bid_s6,
  bresp_s6,
  bsideband_s6,
  bready_s6,

  // SP Write Address Channel 7
  awvalid_s7,
  awaddr_s7,
  awid_s7,
  awlen_s7,
  awsize_s7,
  awburst_s7,
  awlock_s7,
  awcache_s7,
  awprot_s7,
  awsideband_s7,
  awready_s7,

  // SP Write Data Channel 7
  wvalid_s7,
  wid_s7,
  wdata_s7,
  wstrb_s7,
  wlast_s7,
  wsideband_s7,
  wready_s7,

  // SP Write Response Channel 7
  bvalid_s7,
  bid_s7,
  bresp_s7,
  bsideband_s7,
  bready_s7,

  // SP Write Address Channel 8
  awvalid_s8,
  awaddr_s8,
  awid_s8,
  awlen_s8,
  awsize_s8,
  awburst_s8,
  awlock_s8,
  awcache_s8,
  awprot_s8,
  awsideband_s8,
  awready_s8,

  // SP Write Data Channel 8
  wvalid_s8,
  wid_s8,
  wdata_s8,
  wstrb_s8,
  wlast_s8,
  wsideband_s8,
  wready_s8,

  // SP Write Response Channel 8
  bvalid_s8,
  bid_s8,
  bresp_s8,
  bsideband_s8,
  bready_s8,

  // SP Read Address Channel
  arvalid_s,
  arid_s,
  araddr_s,
  arlen_s,
  arsize_s,
  arburst_s,
  arlock_s,
  arcache_s,
  arprot_s,
  arsideband_s,
  arready_s,

  // SP Read Data Channel
  rvalid_s,
  rid_s,
  rdata_s,
  rresp_s,
  rlast_s,
  rsideband_s,
  rready_s,

  // WRAPPER TO MONITOR SLAVE PORT I/O
  // SP Write Address Channel 1
  mon_sp_awvalid_s1,
  mon_sp_awaddr_s1,
  mon_sp_awid_s1,
  mon_sp_awlen_s1,
  mon_sp_awsize_s1,
  mon_sp_awburst_s1,
  mon_sp_awlock_s1,
  mon_sp_awcache_s1,
  mon_sp_awprot_s1,
  mon_sp_awsideband_s1,
  mon_sp_awready_s1,

  // SP Write Data Channel 1
  mon_sp_wvalid_s1,
  mon_sp_wid_s1,
  mon_sp_wdata_s1,
  mon_sp_wstrb_s1,
  mon_sp_wlast_s1,
  mon_sp_wsideband_s1,
  mon_sp_wready_s1,

  // SP Write Response Channel 1
  mon_sp_bvalid_s1,
  mon_sp_bid_s1,
  mon_sp_bresp_s1,
  mon_sp_bsideband_s1,
  mon_sp_bready_s1,

  // SP Write Address Channel 2
  mon_sp_awvalid_s2,
  mon_sp_awaddr_s2,
  mon_sp_awid_s2,
  mon_sp_awlen_s2,
  mon_sp_awsize_s2,
  mon_sp_awburst_s2,
  mon_sp_awlock_s2,
  mon_sp_awcache_s2,
  mon_sp_awprot_s2,
  mon_sp_awsideband_s2,
  mon_sp_awready_s2,

  // SP Write Data Channel 2
  mon_sp_wvalid_s2,
  mon_sp_wid_s2,
  mon_sp_wdata_s2,
  mon_sp_wstrb_s2,
  mon_sp_wlast_s2,
  mon_sp_wsideband_s2,
  mon_sp_wready_s2,

  // SP Write Response Channel 2
  mon_sp_bvalid_s2,
  mon_sp_bid_s2,
  mon_sp_bresp_s2,
  mon_sp_bsideband_s2,
  mon_sp_bready_s2,

  // SP Write Address Channel 3
  mon_sp_awvalid_s3,
  mon_sp_awaddr_s3,
  mon_sp_awid_s3,
  mon_sp_awlen_s3,
  mon_sp_awsize_s3,
  mon_sp_awburst_s3,
  mon_sp_awlock_s3,
  mon_sp_awcache_s3,
  mon_sp_awprot_s3,
  mon_sp_awsideband_s3,
  mon_sp_awready_s3,

  // SP Write Data Channel 3
  mon_sp_wvalid_s3,
  mon_sp_wid_s3,
  mon_sp_wdata_s3,
  mon_sp_wstrb_s3,
  mon_sp_wlast_s3,
  mon_sp_wsideband_s3,
  mon_sp_wready_s3,

  // SP Write Response Channel 3
  mon_sp_bvalid_s3,
  mon_sp_bid_s3,
  mon_sp_bresp_s3,
  mon_sp_bsideband_s3,
  mon_sp_bready_s3,

  // SP Write Address Channel 4
  mon_sp_awvalid_s4,
  mon_sp_awaddr_s4,
  mon_sp_awid_s4,
  mon_sp_awlen_s4,
  mon_sp_awsize_s4,
  mon_sp_awburst_s4,
  mon_sp_awlock_s4,
  mon_sp_awcache_s4,
  mon_sp_awprot_s4,
  mon_sp_awsideband_s4,
  mon_sp_awready_s4,

  // SP Write Data Channel 4
  mon_sp_wvalid_s4,
  mon_sp_wid_s4,
  mon_sp_wdata_s4,
  mon_sp_wstrb_s4,
  mon_sp_wlast_s4,
  mon_sp_wsideband_s4,
  mon_sp_wready_s4,

  // SP Write Response Channel 4
  mon_sp_bvalid_s4,
  mon_sp_bid_s4,
  mon_sp_bresp_s4,
  mon_sp_bsideband_s4,
  mon_sp_bready_s4,

  // SP Write Address Channel 5
  mon_sp_awvalid_s5,
  mon_sp_awaddr_s5,
  mon_sp_awid_s5,
  mon_sp_awlen_s5,
  mon_sp_awsize_s5,
  mon_sp_awburst_s5,
  mon_sp_awlock_s5,
  mon_sp_awcache_s5,
  mon_sp_awprot_s5,
  mon_sp_awsideband_s5,
  mon_sp_awready_s5,

  // SP Write Data Channel 5
  mon_sp_wvalid_s5,
  mon_sp_wid_s5,
  mon_sp_wdata_s5,
  mon_sp_wstrb_s5,
  mon_sp_wlast_s5,
  mon_sp_wsideband_s5,
  mon_sp_wready_s5,

  // SP Write Response Channel 5
  mon_sp_bvalid_s5,
  mon_sp_bid_s5,
  mon_sp_bresp_s5,
  mon_sp_bsideband_s5,
  mon_sp_bready_s5,

  // SP Write Address Channel 6
  mon_sp_awvalid_s6,
  mon_sp_awaddr_s6,
  mon_sp_awid_s6,
  mon_sp_awlen_s6,
  mon_sp_awsize_s6,
  mon_sp_awburst_s6,
  mon_sp_awlock_s6,
  mon_sp_awcache_s6,
  mon_sp_awprot_s6,
  mon_sp_awsideband_s6,
  mon_sp_awready_s6,

  // SP Write Data Channel 6
  mon_sp_wvalid_s6,
  mon_sp_wid_s6,
  mon_sp_wdata_s6,
  mon_sp_wstrb_s6,
  mon_sp_wlast_s6,
  mon_sp_wsideband_s6,
  mon_sp_wready_s6,

  // SP Write Response Channel 6
  mon_sp_bvalid_s6,
  mon_sp_bid_s6,
  mon_sp_bresp_s6,
  mon_sp_bsideband_s6,
  mon_sp_bready_s6,

  // SP Write Address Channel 7
  mon_sp_awvalid_s7,
  mon_sp_awaddr_s7,
  mon_sp_awid_s7,
  mon_sp_awlen_s7,
  mon_sp_awsize_s7,
  mon_sp_awburst_s7,
  mon_sp_awlock_s7,
  mon_sp_awcache_s7,
  mon_sp_awprot_s7,
  mon_sp_awsideband_s7,
  mon_sp_awready_s7,

  // SP Write Data Channel 7
  mon_sp_wvalid_s7,
  mon_sp_wid_s7,
  mon_sp_wdata_s7,
  mon_sp_wstrb_s7,
  mon_sp_wlast_s7,
  mon_sp_wsideband_s7,
  mon_sp_wready_s7,

  // SP Write Response Channel 7
  mon_sp_bvalid_s7,
  mon_sp_bid_s7,
  mon_sp_bresp_s7,
  mon_sp_bsideband_s7,
  mon_sp_bready_s7,

  // SP Write Address Channel 8
  mon_sp_awvalid_s8,
  mon_sp_awaddr_s8,
  mon_sp_awid_s8,
  mon_sp_awlen_s8,
  mon_sp_awsize_s8,
  mon_sp_awburst_s8,
  mon_sp_awlock_s8,
  mon_sp_awcache_s8,
  mon_sp_awprot_s8,
  mon_sp_awsideband_s8,
  mon_sp_awready_s8,

  // SP Write Data Channel 8
  mon_sp_wvalid_s8,
  mon_sp_wid_s8,
  mon_sp_wdata_s8,
  mon_sp_wstrb_s8,
  mon_sp_wlast_s8,
  mon_sp_wsideband_s8,
  mon_sp_wready_s8,

  // SP Write Response Channel 8
  mon_sp_bvalid_s8,
  mon_sp_bid_s8,
  mon_sp_bresp_s8,
  mon_sp_bsideband_s8,
  mon_sp_bready_s8,

  // SP Read Address Channel
  mon_sp_arvalid_s1,
  mon_sp_arid_s1,
  mon_sp_araddr_s1,
  mon_sp_arlen_s1,
  mon_sp_arsize_s1,
  mon_sp_arburst_s1,
  mon_sp_arlock_s1,
  mon_sp_arcache_s1,
  mon_sp_arprot_s1,
  mon_sp_arsideband_s1,
  mon_sp_arready_s1,

  // SP Read Data Channel
  mon_sp_rvalid_s1,
  mon_sp_rid_s1,
  mon_sp_rdata_s1,
  mon_sp_rresp_s1,
  mon_sp_rlast_s1,
  mon_sp_rsideband_s1,
  mon_sp_rready_s1,

  // WRAPPER TO SLAVE VIP SLAVE PORT I/O
  // SP Write Address Channel 1
  vip_sp_awvalid_s1,
  vip_sp_awaddr_s1,
  vip_sp_awid_s1,
  vip_sp_awlen_s1,
  vip_sp_awsize_s1,
  vip_sp_awburst_s1,
  vip_sp_awlock_s1,
  vip_sp_awcache_s1,
  vip_sp_awprot_s1,
  vip_sp_awsideband_s1,
  vip_sp_awready_s1,

  // SP Write Data Channel 1
  vip_sp_wvalid_s1,
  vip_sp_wid_s1,
  vip_sp_wdata_s1,
  vip_sp_wstrb_s1,
  vip_sp_wlast_s1,
  vip_sp_wsideband_s1,
  vip_sp_wready_s1,

  // SP Write Response Channel 1
  vip_sp_bvalid_s1,
  vip_sp_bid_s1,
  vip_sp_bresp_s1,
  vip_sp_bsideband_s1,
  vip_sp_bready_s1,

  // SP Read Address Channel 1
  vip_sp_arvalid_s1,
  vip_sp_arid_s1,
  vip_sp_araddr_s1,
  vip_sp_arlen_s1,
  vip_sp_arsize_s1,
  vip_sp_arburst_s1,
  vip_sp_arlock_s1,
  vip_sp_arcache_s1,
  vip_sp_arprot_s1,
  vip_sp_arsideband_s1,
  vip_sp_arready_s1,

  // SP Read Data Channel 1
  vip_sp_rvalid_s1,
  vip_sp_rid_s1,
  vip_sp_rdata_s1,
  vip_sp_rresp_s1,
  vip_sp_rlast_s1,
  vip_sp_rsideband_s1,
  vip_sp_rready_s1,
  // SP Write Address Channel 2
  vip_sp_awvalid_s2,
  vip_sp_awaddr_s2,
  vip_sp_awid_s2,
  vip_sp_awlen_s2,
  vip_sp_awsize_s2,
  vip_sp_awburst_s2,
  vip_sp_awlock_s2,
  vip_sp_awcache_s2,
  vip_sp_awprot_s2,
  vip_sp_awsideband_s2,
  vip_sp_awready_s2,

  // SP Write Data Channel 2
  vip_sp_wvalid_s2,
  vip_sp_wid_s2,
  vip_sp_wdata_s2,
  vip_sp_wstrb_s2,
  vip_sp_wlast_s2,
  vip_sp_wsideband_s2,
  vip_sp_wready_s2,

  // SP Write Response Channel 2
  vip_sp_bvalid_s2,
  vip_sp_bid_s2,
  vip_sp_bresp_s2,
  vip_sp_bsideband_s2,
  vip_sp_bready_s2,

  // SP Read Address Channel 2
  vip_sp_arvalid_s2,
  vip_sp_arid_s2,
  vip_sp_araddr_s2,
  vip_sp_arlen_s2,
  vip_sp_arsize_s2,
  vip_sp_arburst_s2,
  vip_sp_arlock_s2,
  vip_sp_arcache_s2,
  vip_sp_arprot_s2,
  vip_sp_arsideband_s2,
  vip_sp_arready_s2,

  // SP Read Data Channel 2
  vip_sp_rvalid_s2,
  vip_sp_rid_s2,
  vip_sp_rdata_s2,
  vip_sp_rresp_s2,
  vip_sp_rlast_s2,
  vip_sp_rsideband_s2,
  vip_sp_rready_s2,
  // SP Write Address Channel 3
  vip_sp_awvalid_s3,
  vip_sp_awaddr_s3,
  vip_sp_awid_s3,
  vip_sp_awlen_s3,
  vip_sp_awsize_s3,
  vip_sp_awburst_s3,
  vip_sp_awlock_s3,
  vip_sp_awcache_s3,
  vip_sp_awprot_s3,
  vip_sp_awsideband_s3,
  vip_sp_awready_s3,

  // SP Write Data Channel 3
  vip_sp_wvalid_s3,
  vip_sp_wid_s3,
  vip_sp_wdata_s3,
  vip_sp_wstrb_s3,
  vip_sp_wlast_s3,
  vip_sp_wsideband_s3,
  vip_sp_wready_s3,

  // SP Write Response Channel 3
  vip_sp_bvalid_s3,
  vip_sp_bid_s3,
  vip_sp_bresp_s3,
  vip_sp_bsideband_s3,
  vip_sp_bready_s3,

  // SP Read Address Channel 3
  vip_sp_arvalid_s3,
  vip_sp_arid_s3,
  vip_sp_araddr_s3,
  vip_sp_arlen_s3,
  vip_sp_arsize_s3,
  vip_sp_arburst_s3,
  vip_sp_arlock_s3,
  vip_sp_arcache_s3,
  vip_sp_arprot_s3,
  vip_sp_arsideband_s3,
  vip_sp_arready_s3,

  // SP Read Data Channel 3
  vip_sp_rvalid_s3,
  vip_sp_rid_s3,
  vip_sp_rdata_s3,
  vip_sp_rresp_s3,
  vip_sp_rlast_s3,
  vip_sp_rsideband_s3,
  vip_sp_rready_s3,
  // SP Write Address Channel 4
  vip_sp_awvalid_s4,
  vip_sp_awaddr_s4,
  vip_sp_awid_s4,
  vip_sp_awlen_s4,
  vip_sp_awsize_s4,
  vip_sp_awburst_s4,
  vip_sp_awlock_s4,
  vip_sp_awcache_s4,
  vip_sp_awprot_s4,
  vip_sp_awsideband_s4,
  vip_sp_awready_s4,

  // SP Write Data Channel 4
  vip_sp_wvalid_s4,
  vip_sp_wid_s4,
  vip_sp_wdata_s4,
  vip_sp_wstrb_s4,
  vip_sp_wlast_s4,
  vip_sp_wsideband_s4,
  vip_sp_wready_s4,

  // SP Write Response Channel 4
  vip_sp_bvalid_s4,
  vip_sp_bid_s4,
  vip_sp_bresp_s4,
  vip_sp_bsideband_s4,
  vip_sp_bready_s4,

  // SP Read Address Channel 4
  vip_sp_arvalid_s4,
  vip_sp_arid_s4,
  vip_sp_araddr_s4,
  vip_sp_arlen_s4,
  vip_sp_arsize_s4,
  vip_sp_arburst_s4,
  vip_sp_arlock_s4,
  vip_sp_arcache_s4,
  vip_sp_arprot_s4,
  vip_sp_arsideband_s4,
  vip_sp_arready_s4,

  // SP Read Data Channel 4
  vip_sp_rvalid_s4,
  vip_sp_rid_s4,
  vip_sp_rdata_s4,
  vip_sp_rresp_s4,
  vip_sp_rlast_s4,
  vip_sp_rsideband_s4,
  vip_sp_rready_s4,
  // SP Write Address Channel 5
  vip_sp_awvalid_s5,
  vip_sp_awaddr_s5,
  vip_sp_awid_s5,
  vip_sp_awlen_s5,
  vip_sp_awsize_s5,
  vip_sp_awburst_s5,
  vip_sp_awlock_s5,
  vip_sp_awcache_s5,
  vip_sp_awprot_s5,
  vip_sp_awsideband_s5,
  vip_sp_awready_s5,

  // SP Write Data Channel 5
  vip_sp_wvalid_s5,
  vip_sp_wid_s5,
  vip_sp_wdata_s5,
  vip_sp_wstrb_s5,
  vip_sp_wlast_s5,
  vip_sp_wsideband_s5,
  vip_sp_wready_s5,

  // SP Write Response Channel 5
  vip_sp_bvalid_s5,
  vip_sp_bid_s5,
  vip_sp_bresp_s5,
  vip_sp_bsideband_s5,
  vip_sp_bready_s5,

  // SP Read Address Channel 5
  vip_sp_arvalid_s5,
  vip_sp_arid_s5,
  vip_sp_araddr_s5,
  vip_sp_arlen_s5,
  vip_sp_arsize_s5,
  vip_sp_arburst_s5,
  vip_sp_arlock_s5,
  vip_sp_arcache_s5,
  vip_sp_arprot_s5,
  vip_sp_arsideband_s5,
  vip_sp_arready_s5,

  // SP Read Data Channel 5
  vip_sp_rvalid_s5,
  vip_sp_rid_s5,
  vip_sp_rdata_s5,
  vip_sp_rresp_s5,
  vip_sp_rlast_s5,
  vip_sp_rsideband_s5,
  vip_sp_rready_s5,
  // SP Write Address Channel 6
  vip_sp_awvalid_s6,
  vip_sp_awaddr_s6,
  vip_sp_awid_s6,
  vip_sp_awlen_s6,
  vip_sp_awsize_s6,
  vip_sp_awburst_s6,
  vip_sp_awlock_s6,
  vip_sp_awcache_s6,
  vip_sp_awprot_s6,
  vip_sp_awsideband_s6,
  vip_sp_awready_s6,

  // SP Write Data Channel 6
  vip_sp_wvalid_s6,
  vip_sp_wid_s6,
  vip_sp_wdata_s6,
  vip_sp_wstrb_s6,
  vip_sp_wlast_s6,
  vip_sp_wsideband_s6,
  vip_sp_wready_s6,

  // SP Write Response Channel 6
  vip_sp_bvalid_s6,
  vip_sp_bid_s6,
  vip_sp_bresp_s6,
  vip_sp_bsideband_s6,
  vip_sp_bready_s6,

  // SP Read Address Channel 6
  vip_sp_arvalid_s6,
  vip_sp_arid_s6,
  vip_sp_araddr_s6,
  vip_sp_arlen_s6,
  vip_sp_arsize_s6,
  vip_sp_arburst_s6,
  vip_sp_arlock_s6,
  vip_sp_arcache_s6,
  vip_sp_arprot_s6,
  vip_sp_arsideband_s6,
  vip_sp_arready_s6,

  // SP Read Data Channel 6
  vip_sp_rvalid_s6,
  vip_sp_rid_s6,
  vip_sp_rdata_s6,
  vip_sp_rresp_s6,
  vip_sp_rlast_s6,
  vip_sp_rsideband_s6,
  vip_sp_rready_s6,
  // SP Write Address Channel 7
  vip_sp_awvalid_s7,
  vip_sp_awaddr_s7,
  vip_sp_awid_s7,
  vip_sp_awlen_s7,
  vip_sp_awsize_s7,
  vip_sp_awburst_s7,
  vip_sp_awlock_s7,
  vip_sp_awcache_s7,
  vip_sp_awprot_s7,
  vip_sp_awsideband_s7,
  vip_sp_awready_s7,

  // SP Write Data Channel 7
  vip_sp_wvalid_s7,
  vip_sp_wid_s7,
  vip_sp_wdata_s7,
  vip_sp_wstrb_s7,
  vip_sp_wlast_s7,
  vip_sp_wsideband_s7,
  vip_sp_wready_s7,

  // SP Write Response Channel 7
  vip_sp_bvalid_s7,
  vip_sp_bid_s7,
  vip_sp_bresp_s7,
  vip_sp_bsideband_s7,
  vip_sp_bready_s7,

  // SP Read Address Channel 7
  vip_sp_arvalid_s7,
  vip_sp_arid_s7,
  vip_sp_araddr_s7,
  vip_sp_arlen_s7,
  vip_sp_arsize_s7,
  vip_sp_arburst_s7,
  vip_sp_arlock_s7,
  vip_sp_arcache_s7,
  vip_sp_arprot_s7,
  vip_sp_arsideband_s7,
  vip_sp_arready_s7,

  // SP Read Data Channel 7
  vip_sp_rvalid_s7,
  vip_sp_rid_s7,
  vip_sp_rdata_s7,
  vip_sp_rresp_s7,
  vip_sp_rlast_s7,
  vip_sp_rsideband_s7,
  vip_sp_rready_s7,
  // SP Write Address Channel 8
  vip_sp_awvalid_s8,
  vip_sp_awaddr_s8,
  vip_sp_awid_s8,
  vip_sp_awlen_s8,
  vip_sp_awsize_s8,
  vip_sp_awburst_s8,
  vip_sp_awlock_s8,
  vip_sp_awcache_s8,
  vip_sp_awprot_s8,
  vip_sp_awsideband_s8,
  vip_sp_awready_s8,

  // SP Write Data Channel 8
  vip_sp_wvalid_s8,
  vip_sp_wid_s8,
  vip_sp_wdata_s8,
  vip_sp_wstrb_s8,
  vip_sp_wlast_s8,
  vip_sp_wsideband_s8,
  vip_sp_wready_s8,

  // SP Write Response Channel 8
  vip_sp_bvalid_s8,
  vip_sp_bid_s8,
  vip_sp_bresp_s8,
  vip_sp_bsideband_s8,
  vip_sp_bready_s8,

  // SP Read Address Channel 8
  vip_sp_arvalid_s8,
  vip_sp_arid_s8,
  vip_sp_araddr_s8,
  vip_sp_arlen_s8,
  vip_sp_arsize_s8,
  vip_sp_arburst_s8,
  vip_sp_arlock_s8,
  vip_sp_arcache_s8,
  vip_sp_arprot_s8,
  vip_sp_arsideband_s8,
  vip_sp_arready_s8,

  // SP Read Data Channel 8
  vip_sp_rvalid_s8,
  vip_sp_rid_s8,
  vip_sp_rdata_s8,
  vip_sp_rresp_s8,
  vip_sp_rlast_s8,
  vip_sp_rsideband_s8,
  vip_sp_rready_s8,

  // VIP TO SLAVE PORT I/O
  aclk_s,
  aresetn_s
  
);

  // General Configurable parameters
  output                                 tz_secure_m;
  input                                  wrap_tz_secure_m;
  input                                  tz_secure_s;
  output                                 wrap_tz_secure_s;
  

  // Low power handshaking interface
  // To/from TB
  input csysreq;
  output csysack;
  output cactive;

  // To/from DUT
  output wrap_csysreq;
  input wrap_csysack;
  input wrap_cactive;

  // MP Write Address Channel 
  input                                  awvalid_m;
  input  [`VIP_ADDR_PORT_WIDTH-1:0]      awaddr_m;
  input  [`VIP_AID_PORT_WIDTH-1:0]       awid_m;
  input  [`VIP_ALEN_PORT_WIDTH-1:0]      awlen_m;
  input  [`VIP_ASIZE_PORT_WIDTH-1:0]     awsize_m;
  input  [`VIP_ABURST_PORT_WIDTH-1:0]    awburst_m;
  input  [`VIP_ALOCK_PORT_WIDTH-1:0]     awlock_m;
  input  [`VIP_ACACHE_PORT_WIDTH-1:0]    awcache_m;
  input  [`VIP_APROT_PORT_WIDTH-1:0]     awprot_m;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      awsideband_m;
  output                                 awready_m;

  // MP Write Data Channel from Master
  input                                  wvalid_m;
  input  [`VIP_WID_PORT_WIDTH-1:0]       wid_m;
  input  [`VIP_WDATA_PORT_WIDTH-1:0]     wdata_m;
  input  [`VIP_WSTRB_PORT_WIDTH-1:0]     wstrb_m;
  input                                  wlast_m;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      wsideband_m;
  output                                 wready_m;

  // MP Write Response Channel from Master
  output                                 bvalid_m;
  output [`VIP_BID_PORT_WIDTH-1:0]       bid_m;
  output [`VIP_BRESP_PORT_WIDTH-1:0]     bresp_m;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      bsideband_m;
  input                                  bready_m;

  // MP Read Address Channel from Master
  input                                  arvalid_m;
  input  [`VIP_ADDR_PORT_WIDTH-1:0]      araddr_m;
  input  [`VIP_AID_PORT_WIDTH-1:0]       arid_m;
  input  [`VIP_ALEN_PORT_WIDTH-1:0]      arlen_m;
  input  [`VIP_ASIZE_PORT_WIDTH-1:0]     arsize_m;
  input  [`VIP_ABURST_PORT_WIDTH-1:0]    arburst_m;
  input  [`VIP_ALOCK_PORT_WIDTH-1:0]     arlock_m;
  input  [`VIP_ACACHE_PORT_WIDTH-1:0]    arcache_m;
  input  [`VIP_APROT_PORT_WIDTH-1:0]     arprot_m;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      arsideband_m;
  output                                 arready_m;

  // MP Read Data Channel from Master
  output                                 rvalid_m;
  output [`VIP_RID_PORT_WIDTH-1:0]       rid_m;
  output [`VIP_RDATA_PORT_WIDTH-1:0]     rdata_m;
  output                                 rlast_m;
  output [`VIP_RRESP_PORT_WIDTH-1:0]     rresp_m;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      rsideband_m;
  input                                  rready_m;
  
  // MP Write Address Channel 
  output                      awvalid_mp;
  output  [`X2X_MP_AW-1:0]    awaddr_mp;
  output  [`X2X_MP_IDW-1:0]   awid_mp;
  output  [`X2X_MP_BLW-1:0]   awlen_mp;
  output  [`X2X_BSW-1:0]      awsize_mp;
  output  [`X2X_BTW-1:0]      awburst_mp;
  output  [`X2X_LTW-1:0]      awlock_mp;
  output  [`X2X_CTW-1:0]      awcache_mp;
  output  [`X2X_PTW-1:0]      awprot_mp;
  output  [`X2X_AW_SBW-1:0]   awsideband_mp;
  input                       awready_mp;

  // MP Write Data Channel from Master
  output                      wvalid_mp;
  output  [`X2X_MP_IDW-1:0]   wid_mp;
  output  [`X2X_MP_DW-1:0]    wdata_mp;
  output  [`X2X_MP_SW-1:0]    wstrb_mp;
  output                      wlast_mp;
  output  [`X2X_W_SBW-1:0]    wsideband_mp;
  input                       wready_mp;

  // MP Write Response Channel from Master
  input                       bvalid_mp;
  input [`X2X_MP_IDW-1:0]     bid_mp;
  input [`X2X_BRW-1:0]        bresp_mp;
  input [`X2X_B_SBW-1:0]      bsideband_mp;
  output                      bready_mp;

  // MP Read Address Channel from Master
  output                      arvalid_mp;
  output  [`X2X_MP_IDW-1:0]   arid_mp;
  output  [`X2X_MP_AW-1:0]    araddr_mp;
  output  [`X2X_MP_BLW-1:0]   arlen_mp;
  output  [`X2X_BSW-1:0]      arsize_mp;
  output  [`X2X_BTW-1:0]      arburst_mp;
  output  [`X2X_LTW-1:0]      arlock_mp;
  output  [`X2X_CTW-1:0]      arcache_mp;
  output  [`X2X_PTW-1:0]      arprot_mp;
  output  [`X2X_AR_SBW-1:0]   arsideband_mp;
  input                       arready_mp;

  // MP Read Data Channel from Master
  input                       rvalid_mp;
  input [`X2X_MP_IDW-1:0]     rid_mp;
  input [`X2X_MP_DW-1:0]      rdata_mp;
  input                       rlast_mp;
  input [`X2X_RRW-1:0]        rresp_mp;
  input [`X2X_R_SBW-1:0]      rsideband_mp;
  output                      rready_mp;

  // SLAVE PORT I/O
  input                       aclk_s;
  input                       aresetn_s;

 // Write Address Channel 1
  input                       awvalid_s1;
  input [`X2X_SP_AW-1:0]      awaddr_s1;
  input [`X2X_SP_IDW-1:0]     awid_s1;
  input [`X2X_SP_BLW-1:0]     awlen_s1;
  input [`X2X_BSW-1:0]        awsize_s1;
  input [`X2X_BTW-1:0]        awburst_s1;
  input [`X2X_LTW-1:0]        awlock_s1;
  input [`X2X_CTW-1:0]        awcache_s1;
  input [`X2X_PTW-1:0]        awprot_s1;
  input [`X2X_AW_SBW-1:0]     awsideband_s1;
  output                      awready_s1;

  // Write Data Channel 1
  input                       wvalid_s1;
  input [`X2X_SP_IDW-1:0]     wid_s1;
  input [`X2X_SP_DW-1:0]      wdata_s1;
  input [`X2X_SP_SW-1:0]      wstrb_s1;
  input                       wlast_s1;
  input [`X2X_W_SBW-1:0]      wsideband_s1;
  output                      wready_s1;

  // Write Response Channel 1
  output                      bvalid_s1;
  output  [`X2X_SP_IDW-1:0]   bid_s1;
  output  [`X2X_BRW-1:0]      bresp_s1;
  output  [`X2X_B_SBW-1:0]    bsideband_s1;
  input                       bready_s1;

 // Write Address Channel 2
  input                       awvalid_s2;
  input [`X2X_SP_AW-1:0]      awaddr_s2;
  input [`X2X_SP_IDW-1:0]     awid_s2;
  input [`X2X_SP_BLW-1:0]     awlen_s2;
  input [`X2X_BSW-1:0]        awsize_s2;
  input [`X2X_BTW-1:0]        awburst_s2;
  input [`X2X_LTW-1:0]        awlock_s2;
  input [`X2X_CTW-1:0]        awcache_s2;
  input [`X2X_PTW-1:0]        awprot_s2;
  input [`X2X_AW_SBW-1:0]     awsideband_s2;
  output                      awready_s2;

  // Write Data Channel 2
  input                       wvalid_s2;
  input [`X2X_SP_IDW-1:0]     wid_s2;
  input [`X2X_SP_DW-1:0]      wdata_s2;
  input [`X2X_SP_SW-1:0]      wstrb_s2;
  input                       wlast_s2;
  input [`X2X_W_SBW-1:0]      wsideband_s2;
  output                      wready_s2;

  // Write Response Channel 2
  output                      bvalid_s2;
  output  [`X2X_SP_IDW-1:0]   bid_s2;
  output  [`X2X_BRW-1:0]      bresp_s2;
  output  [`X2X_B_SBW-1:0]    bsideband_s2;
  input                       bready_s2;

 // Write Address Channel 3
  input                       awvalid_s3;
  input [`X2X_SP_AW-1:0]      awaddr_s3;
  input [`X2X_SP_IDW-1:0]     awid_s3;
  input [`X2X_SP_BLW-1:0]     awlen_s3;
  input [`X2X_BSW-1:0]        awsize_s3;
  input [`X2X_BTW-1:0]        awburst_s3;
  input [`X2X_LTW-1:0]        awlock_s3;
  input [`X2X_CTW-1:0]        awcache_s3;
  input [`X2X_PTW-1:0]        awprot_s3;
  input [`X2X_AW_SBW-1:0]     awsideband_s3;
  output                      awready_s3;

  // Write Data Channel 3
  input                       wvalid_s3;
  input [`X2X_SP_IDW-1:0]     wid_s3;
  input [`X2X_SP_DW-1:0]      wdata_s3;
  input [`X2X_SP_SW-1:0]      wstrb_s3;
  input                       wlast_s3;
  input [`X2X_W_SBW-1:0]      wsideband_s3;
  output                      wready_s3;

  // Write Response Channel 3
  output                      bvalid_s3;
  output  [`X2X_SP_IDW-1:0]   bid_s3;
  output  [`X2X_BRW-1:0]      bresp_s3;
  output  [`X2X_B_SBW-1:0]    bsideband_s3;
  input                       bready_s3;

 // Write Address Channel 4
  input                       awvalid_s4;
  input [`X2X_SP_AW-1:0]      awaddr_s4;
  input [`X2X_SP_IDW-1:0]     awid_s4;
  input [`X2X_SP_BLW-1:0]     awlen_s4;
  input [`X2X_BSW-1:0]        awsize_s4;
  input [`X2X_BTW-1:0]        awburst_s4;
  input [`X2X_LTW-1:0]        awlock_s4;
  input [`X2X_CTW-1:0]        awcache_s4;
  input [`X2X_PTW-1:0]        awprot_s4;
  input [`X2X_AW_SBW-1:0]     awsideband_s4;
  output                      awready_s4;

  // Write Data Channel 4
  input                       wvalid_s4;
  input [`X2X_SP_IDW-1:0]     wid_s4;
  input [`X2X_SP_DW-1:0]      wdata_s4;
  input [`X2X_SP_SW-1:0]      wstrb_s4;
  input                       wlast_s4;
  input [`X2X_W_SBW-1:0]      wsideband_s4;
  output                      wready_s4;

  // Write Response Channel 4
  output                      bvalid_s4;
  output  [`X2X_SP_IDW-1:0]   bid_s4;
  output  [`X2X_BRW-1:0]      bresp_s4;
  output  [`X2X_B_SBW-1:0]    bsideband_s4;
  input                       bready_s4;

 // Write Address Channel 5
  input                       awvalid_s5;
  input [`X2X_SP_AW-1:0]      awaddr_s5;
  input [`X2X_SP_IDW-1:0]     awid_s5;
  input [`X2X_SP_BLW-1:0]     awlen_s5;
  input [`X2X_BSW-1:0]        awsize_s5;
  input [`X2X_BTW-1:0]        awburst_s5;
  input [`X2X_LTW-1:0]        awlock_s5;
  input [`X2X_CTW-1:0]        awcache_s5;
  input [`X2X_PTW-1:0]        awprot_s5;
  input [`X2X_AW_SBW-1:0]     awsideband_s5;
  output                      awready_s5;

  // Write Data Channel 5
  input                       wvalid_s5;
  input [`X2X_SP_IDW-1:0]     wid_s5;
  input [`X2X_SP_DW-1:0]      wdata_s5;
  input [`X2X_SP_SW-1:0]      wstrb_s5;
  input                       wlast_s5;
  input [`X2X_W_SBW-1:0]      wsideband_s5;
  output                      wready_s5;

  // Write Response Channel 5
  output                      bvalid_s5;
  output  [`X2X_SP_IDW-1:0]   bid_s5;
  output  [`X2X_BRW-1:0]      bresp_s5;
  output  [`X2X_B_SBW-1:0]    bsideband_s5;
  input                       bready_s5;

 // Write Address Channel 6
  input                       awvalid_s6;
  input [`X2X_SP_AW-1:0]      awaddr_s6;
  input [`X2X_SP_IDW-1:0]     awid_s6;
  input [`X2X_SP_BLW-1:0]     awlen_s6;
  input [`X2X_BSW-1:0]        awsize_s6;
  input [`X2X_BTW-1:0]        awburst_s6;
  input [`X2X_LTW-1:0]        awlock_s6;
  input [`X2X_CTW-1:0]        awcache_s6;
  input [`X2X_PTW-1:0]        awprot_s6;
  input [`X2X_AW_SBW-1:0]     awsideband_s6;
  output                      awready_s6;

  // Write Data Channel 6
  input                       wvalid_s6;
  input [`X2X_SP_IDW-1:0]     wid_s6;
  input [`X2X_SP_DW-1:0]      wdata_s6;
  input [`X2X_SP_SW-1:0]      wstrb_s6;
  input                       wlast_s6;
  input [`X2X_W_SBW-1:0]      wsideband_s6;
  output                      wready_s6;

  // Write Response Channel 6
  output                      bvalid_s6;
  output  [`X2X_SP_IDW-1:0]   bid_s6;
  output  [`X2X_BRW-1:0]      bresp_s6;
  output  [`X2X_B_SBW-1:0]    bsideband_s6;
  input                       bready_s6;

 // Write Address Channel 7
  input                       awvalid_s7;
  input [`X2X_SP_AW-1:0]      awaddr_s7;
  input [`X2X_SP_IDW-1:0]     awid_s7;
  input [`X2X_SP_BLW-1:0]     awlen_s7;
  input [`X2X_BSW-1:0]        awsize_s7;
  input [`X2X_BTW-1:0]        awburst_s7;
  input [`X2X_LTW-1:0]        awlock_s7;
  input [`X2X_CTW-1:0]        awcache_s7;
  input [`X2X_PTW-1:0]        awprot_s7;
  input [`X2X_AW_SBW-1:0]     awsideband_s7;
  output                      awready_s7;

  // Write Data Channel 7
  input                       wvalid_s7;
  input [`X2X_SP_IDW-1:0]     wid_s7;
  input [`X2X_SP_DW-1:0]      wdata_s7;
  input [`X2X_SP_SW-1:0]      wstrb_s7;
  input                       wlast_s7;
  input [`X2X_W_SBW-1:0]      wsideband_s7;
  output                      wready_s7;

  // Write Response Channel 7
  output                      bvalid_s7;
  output  [`X2X_SP_IDW-1:0]   bid_s7;
  output  [`X2X_BRW-1:0]      bresp_s7;
  output  [`X2X_B_SBW-1:0]    bsideband_s7;
  input                       bready_s7;

 // Write Address Channel 8
  input                       awvalid_s8;
  input [`X2X_SP_AW-1:0]      awaddr_s8;
  input [`X2X_SP_IDW-1:0]     awid_s8;
  input [`X2X_SP_BLW-1:0]     awlen_s8;
  input [`X2X_BSW-1:0]        awsize_s8;
  input [`X2X_BTW-1:0]        awburst_s8;
  input [`X2X_LTW-1:0]        awlock_s8;
  input [`X2X_CTW-1:0]        awcache_s8;
  input [`X2X_PTW-1:0]        awprot_s8;
  input [`X2X_AW_SBW-1:0]     awsideband_s8;
  output                      awready_s8;

  // Write Data Channel 8
  input                       wvalid_s8;
  input [`X2X_SP_IDW-1:0]     wid_s8;
  input [`X2X_SP_DW-1:0]      wdata_s8;
  input [`X2X_SP_SW-1:0]      wstrb_s8;
  input                       wlast_s8;
  input [`X2X_W_SBW-1:0]      wsideband_s8;
  output                      wready_s8;

  // Write Response Channel 8
  output                      bvalid_s8;
  output  [`X2X_SP_IDW-1:0]   bid_s8;
  output  [`X2X_BRW-1:0]      bresp_s8;
  output  [`X2X_B_SBW-1:0]    bsideband_s8;
  input                       bready_s8;

  // Read Address Channel
  input                       arvalid_s;
  input [`X2X_SP_IDW-1:0]     arid_s;
  input [`X2X_SP_AW-1:0]      araddr_s;
  input [`X2X_SP_BLW-1:0]     arlen_s;
  input [`X2X_BSW-1:0]        arsize_s;
  input [`X2X_BTW-1:0]        arburst_s;
  input [`X2X_LTW-1:0]        arlock_s;
  input [`X2X_CTW-1:0]        arcache_s;
  input [`X2X_PTW-1:0]        arprot_s;
  input [`X2X_AR_SBW-1:0]     arsideband_s;
  output                      arready_s;

  // Read Data Channel
  output                      rvalid_s;
  output  [`X2X_SP_IDW-1:0]   rid_s;
  output  [`X2X_SP_DW-1:0]    rdata_s;
  output                      rlast_s;
  output  [`X2X_RRW-1:0]      rresp_s;
  output  [`X2X_R_SBW-1:0]    rsideband_s;
  input                       rready_s;

  // Write Address Channel 1
  output                                 mon_sp_awvalid_s1;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s1;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s1;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s1;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s1;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s1;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s1;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s1;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s1;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s1;
  output                                 mon_sp_awready_s1;

  // Write Data Channel 1
  output                                 mon_sp_wvalid_s1;
  output [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s1;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s1;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s1;
  output                                 mon_sp_wlast_s1;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s1;
  output                                 mon_sp_wready_s1;

  // Write Response Channel 1
  output                                 mon_sp_bvalid_s1;
  output  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s1;
  output  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s1;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s1;
  output                                 mon_sp_bready_s1;
  // Write Address Channel 2
  output                                 mon_sp_awvalid_s2;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s2;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s2;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s2;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s2;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s2;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s2;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s2;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s2;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s2;
  output                                 mon_sp_awready_s2;

  // Write Data Channel 2
  output                                 mon_sp_wvalid_s2;
  output [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s2;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s2;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s2;
  output                                 mon_sp_wlast_s2;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s2;
  output                                 mon_sp_wready_s2;

  // Write Response Channel 2
  output                                 mon_sp_bvalid_s2;
  output  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s2;
  output  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s2;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s2;
  output                                 mon_sp_bready_s2;
  // Write Address Channel 3
  output                                 mon_sp_awvalid_s3;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s3;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s3;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s3;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s3;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s3;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s3;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s3;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s3;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s3;
  output                                 mon_sp_awready_s3;

  // Write Data Channel 3
  output                                 mon_sp_wvalid_s3;
  output [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s3;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s3;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s3;
  output                                 mon_sp_wlast_s3;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s3;
  output                                 mon_sp_wready_s3;

  // Write Response Channel 3
  output                                 mon_sp_bvalid_s3;
  output  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s3;
  output  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s3;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s3;
  output                                 mon_sp_bready_s3;
  // Write Address Channel 4
  output                                 mon_sp_awvalid_s4;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s4;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s4;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s4;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s4;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s4;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s4;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s4;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s4;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s4;
  output                                 mon_sp_awready_s4;

  // Write Data Channel 4
  output                                 mon_sp_wvalid_s4;
  output [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s4;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s4;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s4;
  output                                 mon_sp_wlast_s4;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s4;
  output                                 mon_sp_wready_s4;

  // Write Response Channel 4
  output                                 mon_sp_bvalid_s4;
  output  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s4;
  output  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s4;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s4;
  output                                 mon_sp_bready_s4;
  // Write Address Channel 5
  output                                 mon_sp_awvalid_s5;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s5;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s5;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s5;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s5;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s5;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s5;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s5;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s5;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s5;
  output                                 mon_sp_awready_s5;

  // Write Data Channel 5
  output                                 mon_sp_wvalid_s5;
  output [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s5;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s5;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s5;
  output                                 mon_sp_wlast_s5;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s5;
  output                                 mon_sp_wready_s5;

  // Write Response Channel 5
  output                                 mon_sp_bvalid_s5;
  output  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s5;
  output  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s5;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s5;
  output                                 mon_sp_bready_s5;
  // Write Address Channel 6
  output                                 mon_sp_awvalid_s6;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s6;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s6;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s6;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s6;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s6;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s6;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s6;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s6;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s6;
  output                                 mon_sp_awready_s6;

  // Write Data Channel 6
  output                                 mon_sp_wvalid_s6;
  output [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s6;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s6;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s6;
  output                                 mon_sp_wlast_s6;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s6;
  output                                 mon_sp_wready_s6;

  // Write Response Channel 6
  output                                 mon_sp_bvalid_s6;
  output  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s6;
  output  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s6;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s6;
  output                                 mon_sp_bready_s6;
  // Write Address Channel 7
  output                                 mon_sp_awvalid_s7;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s7;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s7;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s7;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s7;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s7;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s7;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s7;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s7;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s7;
  output                                 mon_sp_awready_s7;

  // Write Data Channel 7
  output                                 mon_sp_wvalid_s7;
  output [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s7;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s7;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s7;
  output                                 mon_sp_wlast_s7;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s7;
  output                                 mon_sp_wready_s7;

  // Write Response Channel 7
  output                                 mon_sp_bvalid_s7;
  output  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s7;
  output  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s7;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s7;
  output                                 mon_sp_bready_s7;
  // Write Address Channel 8
  output                                 mon_sp_awvalid_s8;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s8;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s8;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s8;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s8;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s8;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s8;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s8;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s8;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s8;
  output                                 mon_sp_awready_s8;

  // Write Data Channel 8
  output                                 mon_sp_wvalid_s8;
  output [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s8;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s8;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s8;
  output                                 mon_sp_wlast_s8;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s8;
  output                                 mon_sp_wready_s8;

  // Write Response Channel 8
  output                                 mon_sp_bvalid_s8;
  output  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s8;
  output  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s8;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s8;
  output                                 mon_sp_bready_s8;

  // Read Address Channel 1
  output                                 mon_sp_arvalid_s1;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s1;
  output [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s1;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s1;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s1;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s1;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s1;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s1;
  output [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s1;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s1;
  output                                 mon_sp_arready_s1;

  // Read Data Channel 1
  output                                 mon_sp_rvalid_s1;
  output  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s1;
  output  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s1;
  output                                 mon_sp_rlast_s1;
  output  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s1;
  output  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s1;
  output                                 mon_sp_rready_s1;  

  // Write Address Channel 1
  output                                 vip_sp_awvalid_s1;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s1;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s1;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s1;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s1;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s1;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s1;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s1;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s1;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s1;
  input                                  vip_sp_awready_s1;

  // Write Data Channel 1
  output                                 vip_sp_wvalid_s1;
  output [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s1;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s1;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s1;
  output                                 vip_sp_wlast_s1;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s1;
  input                                  vip_sp_wready_s1;

  // Write Response Channel 1
  input                                  vip_sp_bvalid_s1;
  input  [`VIP_BID_PORT_WIDTH-1:0]       vip_sp_bid_s1;
  input  [`VIP_BRESP_PORT_WIDTH-1:0]     vip_sp_bresp_s1;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_bsideband_s1;
  output                                 vip_sp_bready_s1;

  // Read Address Channel 1
  output                                 vip_sp_arvalid_s1;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s1;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s1;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s1;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s1;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s1;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s1;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s1;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s1;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s1;
  input                                  vip_sp_arready_s1;

  // Read Data Channel 1
  input                                  vip_sp_rvalid_s1;
  input  [`VIP_RID_PORT_WIDTH-1:0]       vip_sp_rid_s1;
  input  [`VIP_RDATA_PORT_WIDTH-1:0]     vip_sp_rdata_s1;
  input                                  vip_sp_rlast_s1;
  input  [`VIP_RRESP_PORT_WIDTH-1:0]     vip_sp_rresp_s1;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_rsideband_s1;
  output                                 vip_sp_rready_s1;  

  // Write Address Channel 2
  output                                 vip_sp_awvalid_s2;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s2;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s2;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s2;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s2;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s2;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s2;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s2;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s2;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s2;
  input                                  vip_sp_awready_s2;

  // Write Data Channel 2
  output                                 vip_sp_wvalid_s2;
  output [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s2;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s2;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s2;
  output                                 vip_sp_wlast_s2;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s2;
  input                                  vip_sp_wready_s2;

  // Write Response Channel 2
  input                                  vip_sp_bvalid_s2;
  input  [`VIP_BID_PORT_WIDTH-1:0]       vip_sp_bid_s2;
  input  [`VIP_BRESP_PORT_WIDTH-1:0]     vip_sp_bresp_s2;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_bsideband_s2;
  output                                 vip_sp_bready_s2;

  // Read Address Channel 2
  output                                 vip_sp_arvalid_s2;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s2;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s2;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s2;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s2;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s2;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s2;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s2;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s2;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s2;
  input                                  vip_sp_arready_s2;

  // Read Data Channel 2
  input                                  vip_sp_rvalid_s2;
  input  [`VIP_RID_PORT_WIDTH-1:0]       vip_sp_rid_s2;
  input  [`VIP_RDATA_PORT_WIDTH-1:0]     vip_sp_rdata_s2;
  input                                  vip_sp_rlast_s2;
  input  [`VIP_RRESP_PORT_WIDTH-1:0]     vip_sp_rresp_s2;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_rsideband_s2;
  output                                 vip_sp_rready_s2;  

  // Write Address Channel 3
  output                                 vip_sp_awvalid_s3;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s3;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s3;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s3;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s3;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s3;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s3;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s3;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s3;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s3;
  input                                  vip_sp_awready_s3;

  // Write Data Channel 3
  output                                 vip_sp_wvalid_s3;
  output [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s3;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s3;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s3;
  output                                 vip_sp_wlast_s3;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s3;
  input                                  vip_sp_wready_s3;

  // Write Response Channel 3
  input                                  vip_sp_bvalid_s3;
  input  [`VIP_BID_PORT_WIDTH-1:0]       vip_sp_bid_s3;
  input  [`VIP_BRESP_PORT_WIDTH-1:0]     vip_sp_bresp_s3;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_bsideband_s3;
  output                                 vip_sp_bready_s3;

  // Read Address Channel 3
  output                                 vip_sp_arvalid_s3;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s3;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s3;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s3;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s3;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s3;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s3;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s3;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s3;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s3;
  input                                  vip_sp_arready_s3;

  // Read Data Channel 3
  input                                  vip_sp_rvalid_s3;
  input  [`VIP_RID_PORT_WIDTH-1:0]       vip_sp_rid_s3;
  input  [`VIP_RDATA_PORT_WIDTH-1:0]     vip_sp_rdata_s3;
  input                                  vip_sp_rlast_s3;
  input  [`VIP_RRESP_PORT_WIDTH-1:0]     vip_sp_rresp_s3;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_rsideband_s3;
  output                                 vip_sp_rready_s3;  

  // Write Address Channel 4
  output                                 vip_sp_awvalid_s4;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s4;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s4;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s4;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s4;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s4;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s4;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s4;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s4;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s4;
  input                                  vip_sp_awready_s4;

  // Write Data Channel 4
  output                                 vip_sp_wvalid_s4;
  output [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s4;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s4;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s4;
  output                                 vip_sp_wlast_s4;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s4;
  input                                  vip_sp_wready_s4;

  // Write Response Channel 4
  input                                  vip_sp_bvalid_s4;
  input  [`VIP_BID_PORT_WIDTH-1:0]       vip_sp_bid_s4;
  input  [`VIP_BRESP_PORT_WIDTH-1:0]     vip_sp_bresp_s4;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_bsideband_s4;
  output                                 vip_sp_bready_s4;

  // Read Address Channel 4
  output                                 vip_sp_arvalid_s4;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s4;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s4;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s4;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s4;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s4;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s4;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s4;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s4;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s4;
  input                                  vip_sp_arready_s4;

  // Read Data Channel 4
  input                                  vip_sp_rvalid_s4;
  input  [`VIP_RID_PORT_WIDTH-1:0]       vip_sp_rid_s4;
  input  [`VIP_RDATA_PORT_WIDTH-1:0]     vip_sp_rdata_s4;
  input                                  vip_sp_rlast_s4;
  input  [`VIP_RRESP_PORT_WIDTH-1:0]     vip_sp_rresp_s4;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_rsideband_s4;
  output                                 vip_sp_rready_s4;  

  // Write Address Channel 5
  output                                 vip_sp_awvalid_s5;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s5;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s5;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s5;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s5;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s5;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s5;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s5;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s5;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s5;
  input                                  vip_sp_awready_s5;

  // Write Data Channel 5
  output                                 vip_sp_wvalid_s5;
  output [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s5;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s5;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s5;
  output                                 vip_sp_wlast_s5;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s5;
  input                                  vip_sp_wready_s5;

  // Write Response Channel 5
  input                                  vip_sp_bvalid_s5;
  input  [`VIP_BID_PORT_WIDTH-1:0]       vip_sp_bid_s5;
  input  [`VIP_BRESP_PORT_WIDTH-1:0]     vip_sp_bresp_s5;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_bsideband_s5;
  output                                 vip_sp_bready_s5;

  // Read Address Channel 5
  output                                 vip_sp_arvalid_s5;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s5;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s5;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s5;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s5;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s5;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s5;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s5;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s5;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s5;
  input                                  vip_sp_arready_s5;

  // Read Data Channel 5
  input                                  vip_sp_rvalid_s5;
  input  [`VIP_RID_PORT_WIDTH-1:0]       vip_sp_rid_s5;
  input  [`VIP_RDATA_PORT_WIDTH-1:0]     vip_sp_rdata_s5;
  input                                  vip_sp_rlast_s5;
  input  [`VIP_RRESP_PORT_WIDTH-1:0]     vip_sp_rresp_s5;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_rsideband_s5;
  output                                 vip_sp_rready_s5;  

  // Write Address Channel 6
  output                                 vip_sp_awvalid_s6;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s6;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s6;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s6;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s6;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s6;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s6;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s6;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s6;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s6;
  input                                  vip_sp_awready_s6;

  // Write Data Channel 6
  output                                 vip_sp_wvalid_s6;
  output [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s6;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s6;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s6;
  output                                 vip_sp_wlast_s6;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s6;
  input                                  vip_sp_wready_s6;

  // Write Response Channel 6
  input                                  vip_sp_bvalid_s6;
  input  [`VIP_BID_PORT_WIDTH-1:0]       vip_sp_bid_s6;
  input  [`VIP_BRESP_PORT_WIDTH-1:0]     vip_sp_bresp_s6;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_bsideband_s6;
  output                                 vip_sp_bready_s6;

  // Read Address Channel 6
  output                                 vip_sp_arvalid_s6;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s6;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s6;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s6;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s6;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s6;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s6;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s6;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s6;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s6;
  input                                  vip_sp_arready_s6;

  // Read Data Channel 6
  input                                  vip_sp_rvalid_s6;
  input  [`VIP_RID_PORT_WIDTH-1:0]       vip_sp_rid_s6;
  input  [`VIP_RDATA_PORT_WIDTH-1:0]     vip_sp_rdata_s6;
  input                                  vip_sp_rlast_s6;
  input  [`VIP_RRESP_PORT_WIDTH-1:0]     vip_sp_rresp_s6;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_rsideband_s6;
  output                                 vip_sp_rready_s6;  

  // Write Address Channel 7
  output                                 vip_sp_awvalid_s7;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s7;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s7;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s7;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s7;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s7;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s7;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s7;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s7;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s7;
  input                                  vip_sp_awready_s7;

  // Write Data Channel 7
  output                                 vip_sp_wvalid_s7;
  output [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s7;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s7;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s7;
  output                                 vip_sp_wlast_s7;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s7;
  input                                  vip_sp_wready_s7;

  // Write Response Channel 7
  input                                  vip_sp_bvalid_s7;
  input  [`VIP_BID_PORT_WIDTH-1:0]       vip_sp_bid_s7;
  input  [`VIP_BRESP_PORT_WIDTH-1:0]     vip_sp_bresp_s7;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_bsideband_s7;
  output                                 vip_sp_bready_s7;

  // Read Address Channel 7
  output                                 vip_sp_arvalid_s7;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s7;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s7;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s7;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s7;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s7;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s7;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s7;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s7;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s7;
  input                                  vip_sp_arready_s7;

  // Read Data Channel 7
  input                                  vip_sp_rvalid_s7;
  input  [`VIP_RID_PORT_WIDTH-1:0]       vip_sp_rid_s7;
  input  [`VIP_RDATA_PORT_WIDTH-1:0]     vip_sp_rdata_s7;
  input                                  vip_sp_rlast_s7;
  input  [`VIP_RRESP_PORT_WIDTH-1:0]     vip_sp_rresp_s7;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_rsideband_s7;
  output                                 vip_sp_rready_s7;  

  // Write Address Channel 8
  output                                 vip_sp_awvalid_s8;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s8;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s8;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s8;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s8;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s8;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s8;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s8;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s8;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s8;
  input                                  vip_sp_awready_s8;

  // Write Data Channel 8
  output                                 vip_sp_wvalid_s8;
  output [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s8;
  output [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s8;
  output [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s8;
  output                                 vip_sp_wlast_s8;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s8;
  input                                  vip_sp_wready_s8;

  // Write Response Channel 8
  input                                  vip_sp_bvalid_s8;
  input  [`VIP_BID_PORT_WIDTH-1:0]       vip_sp_bid_s8;
  input  [`VIP_BRESP_PORT_WIDTH-1:0]     vip_sp_bresp_s8;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_bsideband_s8;
  output                                 vip_sp_bready_s8;

  // Read Address Channel 8
  output                                 vip_sp_arvalid_s8;
  output [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s8;
  output [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s8;
  output [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s8;
  output [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s8;
  output [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s8;
  output [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s8;
  output [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s8;
  output [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s8;
  output [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s8;
  input                                  vip_sp_arready_s8;

  // Read Data Channel 8
  input                                  vip_sp_rvalid_s8;
  input  [`VIP_RID_PORT_WIDTH-1:0]       vip_sp_rid_s8;
  input  [`VIP_RDATA_PORT_WIDTH-1:0]     vip_sp_rdata_s8;
  input                                  vip_sp_rlast_s8;
  input  [`VIP_RRESP_PORT_WIDTH-1:0]     vip_sp_rresp_s8;
  input  [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_rsideband_s8;
  output                                 vip_sp_rready_s8;  

  
  // ----------------------------------------------------------
  
  // General Configurable parameters
  wire                                 tz_secure_m;
  wire                                 wrap_tz_secure_s;
  
  // MP Write Address Channel 
  wire                                 awready_m;

  // MP Write Data Channel from Master
  wire                                 wready_m;

  // MP Write Response Channel from Master
  wire                                 bvalid_m;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      bsideband_m;

  // MP Read Address Channel from Master
  wire                                 arready_m;

  // MP Read Data Channel from Master
  wire                                 rvalid_m;
  wire [`VIP_RID_PORT_WIDTH-1:0]       rid_m;
  wire [`VIP_RDATA_PORT_WIDTH-1:0]     rdata_m;
  wire                                 rlast_m;
  wire [`VIP_RRESP_PORT_WIDTH-1:0]     rresp_m;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      rsideband_m;

  // MP Write Address Channel 
  wire                      awvalid_mp;
  wire  [`X2X_MP_AW-1:0]    awaddr_mp;
  wire  [`X2X_MP_IDW-1:0]   awid_mp;
  wire  [`X2X_MP_BLW-1:0]   awlen_mp;
  wire  [`X2X_BSW-1:0]      awsize_mp;
  wire  [`X2X_BTW-1:0]      awburst_mp;
  wire  [`X2X_LTW-1:0]      awlock_mp;
  wire  [`X2X_CTW-1:0]      awcache_mp;
  wire  [`X2X_PTW-1:0]      awprot_mp;
  wire  [`X2X_AW_SBW-1:0]   awsideband_mp;

  // MP Write Data Channel from Master
  wire                      wvalid_mp;
  wire  [`X2X_MP_IDW-1:0]   wid_mp;
  wire  [`X2X_MP_DW-1:0]    wdata_mp;
  wire  [`X2X_MP_SW-1:0]    wstrb_mp;
  wire                      wlast_mp;
  wire  [`X2X_W_SBW-1:0]    wsideband_mp;

  // MP Write Response Channel from Master
  wire                      bready_mp;

  // MP Read Address Channel from Master
  wire                      arvalid_mp;
  wire  [`X2X_MP_IDW-1:0]   arid_mp;
  wire  [`X2X_MP_AW-1:0]    araddr_mp;
  wire  [`X2X_MP_BLW-1:0]   arlen_mp;
  wire  [`X2X_BSW-1:0]      arsize_mp;
  wire  [`X2X_BTW-1:0]      arburst_mp;
  wire  [`X2X_LTW-1:0]      arlock_mp;
  wire  [`X2X_CTW-1:0]      arcache_mp;
  wire  [`X2X_PTW-1:0]      arprot_mp;
  wire  [`X2X_AR_SBW-1:0]   arsideband_mp;

  // MP Read Data Channel from Master
  wire                      rready_mp;

  // SLAVE PORT I/O

 // Write Address Channel 1
  wire                      awready_s1;

  // Write Data Channel 1
  wire                      wready_s1;

  // Write Response Channel 1
  wire                      bvalid_s1;
  wire  [`X2X_SP_IDW-1:0]   bid_s1;
  wire  [`X2X_BRW-1:0]      bresp_s1;
  wire  [`X2X_B_SBW-1:0]    bsideband_s1;

 // Write Address Channel 2
  wire                      awready_s2;

  // Write Data Channel 2
  wire                      wready_s2;

  // Write Response Channel 2
  wire                      bvalid_s2;
  wire  [`X2X_SP_IDW-1:0]   bid_s2;
  wire  [`X2X_BRW-1:0]      bresp_s2;
  wire  [`X2X_B_SBW-1:0]    bsideband_s2;

 // Write Address Channel 3
  wire                      awready_s3;

  // Write Data Channel 3
  wire                      wready_s3;

  // Write Response Channel 3
  wire                      bvalid_s3;
  wire  [`X2X_SP_IDW-1:0]   bid_s3;
  wire  [`X2X_BRW-1:0]      bresp_s3;
  wire  [`X2X_B_SBW-1:0]    bsideband_s3;

 // Write Address Channel 4
  wire                      awready_s4;

  // Write Data Channel 4
  wire                      wready_s4;

  // Write Response Channel 4
  wire                      bvalid_s4;
  wire  [`X2X_SP_IDW-1:0]   bid_s4;
  wire  [`X2X_BRW-1:0]      bresp_s4;
  wire  [`X2X_B_SBW-1:0]    bsideband_s4;

 // Write Address Channel 5
  wire                      awready_s5;

  // Write Data Channel 5
  wire                      wready_s5;

  // Write Response Channel 5
  wire                      bvalid_s5;
  wire  [`X2X_SP_IDW-1:0]   bid_s5;
  wire  [`X2X_BRW-1:0]      bresp_s5;
  wire  [`X2X_B_SBW-1:0]    bsideband_s5;

 // Write Address Channel 6
  wire                      awready_s6;

  // Write Data Channel 6
  wire                      wready_s6;

  // Write Response Channel 6
  wire                      bvalid_s6;
  wire  [`X2X_SP_IDW-1:0]   bid_s6;
  wire  [`X2X_BRW-1:0]      bresp_s6;
  wire  [`X2X_B_SBW-1:0]    bsideband_s6;

 // Write Address Channel 7
  wire                      awready_s7;

  // Write Data Channel 7
  wire                      wready_s7;

  // Write Response Channel 7
  wire                      bvalid_s7;
  wire  [`X2X_SP_IDW-1:0]   bid_s7;
  wire  [`X2X_BRW-1:0]      bresp_s7;
  wire  [`X2X_B_SBW-1:0]    bsideband_s7;

 // Write Address Channel 8
  wire                      awready_s8;

  // Write Data Channel 8
  wire                      wready_s8;

  // Write Response Channel 8
  wire                      bvalid_s8;
  wire  [`X2X_SP_IDW-1:0]   bid_s8;
  wire  [`X2X_BRW-1:0]      bresp_s8;
  wire  [`X2X_B_SBW-1:0]    bsideband_s8;

  // Read Address Channel
  wire                      arready_s;

  // Read Data Channel
  wire                      rvalid_s;
  wire  [`X2X_SP_IDW-1:0]   rid_s;
  wire  [`X2X_SP_DW-1:0]    rdata_s;
  wire                      rlast_s;
  wire  [`X2X_RRW-1:0]      rresp_s;
  wire  [`X2X_R_SBW-1:0]    rsideband_s;

  // Write Address Channel 1
  wire                                 mon_sp_awvalid_s1;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s1;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s1;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s1;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s1;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s1;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s1;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s1;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s1;
  wire                                 mon_sp_awready_s1;

  // Write Data Channel 1
  wire                                 mon_sp_wvalid_s1;
  wire [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s1;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s1;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s1;
  wire                                 mon_sp_wlast_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s1;
  wire                                 mon_sp_wready_s1;

  // Write Response Channel 1
  wire                                 mon_sp_bvalid_s1;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s1;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s1;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s1;
  wire                                 mon_sp_bready_s1;

  // Read Address Channel 1
  wire                                 mon_sp_arvalid_s1;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s1;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s1;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s1;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s1;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s1;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s1;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s1;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s1;
  wire                                 mon_sp_arready_s1;

  // Read Data Channel 1
  wire                                 mon_sp_rvalid_s1;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s1;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s1;
  wire                                 mon_sp_rlast_s1;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s1;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s1;
  wire                                 mon_sp_rready_s1;  

  // Write Address Channel 2
  wire                                 mon_sp_awvalid_s2;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s2;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s2;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s2;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s2;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s2;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s2;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s2;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s2;
  wire                                 mon_sp_awready_s2;

  // Write Data Channel 2
  wire                                 mon_sp_wvalid_s2;
  wire [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s2;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s2;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s2;
  wire                                 mon_sp_wlast_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s2;
  wire                                 mon_sp_wready_s2;

  // Write Response Channel 2
  wire                                 mon_sp_bvalid_s2;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s2;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s2;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s2;
  wire                                 mon_sp_bready_s2;

  // Read Address Channel 2
  wire                                 mon_sp_arvalid_s2;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s2;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s2;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s2;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s2;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s2;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s2;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s2;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s2;
  wire                                 mon_sp_arready_s2;

  // Read Data Channel 2
  wire                                 mon_sp_rvalid_s2;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s2;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s2;
  wire                                 mon_sp_rlast_s2;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s2;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s2;
  wire                                 mon_sp_rready_s2;  

  // Write Address Channel 3
  wire                                 mon_sp_awvalid_s3;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s3;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s3;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s3;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s3;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s3;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s3;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s3;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s3;
  wire                                 mon_sp_awready_s3;

  // Write Data Channel 3
  wire                                 mon_sp_wvalid_s3;
  wire [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s3;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s3;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s3;
  wire                                 mon_sp_wlast_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s3;
  wire                                 mon_sp_wready_s3;

  // Write Response Channel 3
  wire                                 mon_sp_bvalid_s3;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s3;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s3;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s3;
  wire                                 mon_sp_bready_s3;

  // Read Address Channel 3
  wire                                 mon_sp_arvalid_s3;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s3;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s3;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s3;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s3;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s3;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s3;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s3;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s3;
  wire                                 mon_sp_arready_s3;

  // Read Data Channel 3
  wire                                 mon_sp_rvalid_s3;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s3;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s3;
  wire                                 mon_sp_rlast_s3;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s3;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s3;
  wire                                 mon_sp_rready_s3;  

  // Write Address Channel 4
  wire                                 mon_sp_awvalid_s4;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s4;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s4;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s4;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s4;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s4;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s4;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s4;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s4;
  wire                                 mon_sp_awready_s4;

  // Write Data Channel 4
  wire                                 mon_sp_wvalid_s4;
  wire [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s4;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s4;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s4;
  wire                                 mon_sp_wlast_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s4;
  wire                                 mon_sp_wready_s4;

  // Write Response Channel 4
  wire                                 mon_sp_bvalid_s4;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s4;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s4;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s4;
  wire                                 mon_sp_bready_s4;

  // Read Address Channel 4
  wire                                 mon_sp_arvalid_s4;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s4;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s4;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s4;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s4;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s4;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s4;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s4;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s4;
  wire                                 mon_sp_arready_s4;

  // Read Data Channel 4
  wire                                 mon_sp_rvalid_s4;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s4;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s4;
  wire                                 mon_sp_rlast_s4;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s4;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s4;
  wire                                 mon_sp_rready_s4;  

  // Write Address Channel 5
  wire                                 mon_sp_awvalid_s5;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s5;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s5;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s5;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s5;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s5;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s5;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s5;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s5;
  wire                                 mon_sp_awready_s5;

  // Write Data Channel 5
  wire                                 mon_sp_wvalid_s5;
  wire [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s5;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s5;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s5;
  wire                                 mon_sp_wlast_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s5;
  wire                                 mon_sp_wready_s5;

  // Write Response Channel 5
  wire                                 mon_sp_bvalid_s5;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s5;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s5;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s5;
  wire                                 mon_sp_bready_s5;

  // Read Address Channel 5
  wire                                 mon_sp_arvalid_s5;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s5;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s5;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s5;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s5;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s5;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s5;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s5;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s5;
  wire                                 mon_sp_arready_s5;

  // Read Data Channel 5
  wire                                 mon_sp_rvalid_s5;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s5;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s5;
  wire                                 mon_sp_rlast_s5;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s5;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s5;
  wire                                 mon_sp_rready_s5;  

  // Write Address Channel 6
  wire                                 mon_sp_awvalid_s6;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s6;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s6;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s6;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s6;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s6;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s6;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s6;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s6;
  wire                                 mon_sp_awready_s6;

  // Write Data Channel 6
  wire                                 mon_sp_wvalid_s6;
  wire [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s6;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s6;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s6;
  wire                                 mon_sp_wlast_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s6;
  wire                                 mon_sp_wready_s6;

  // Write Response Channel 6
  wire                                 mon_sp_bvalid_s6;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s6;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s6;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s6;
  wire                                 mon_sp_bready_s6;

  // Read Address Channel 6
  wire                                 mon_sp_arvalid_s6;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s6;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s6;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s6;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s6;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s6;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s6;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s6;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s6;
  wire                                 mon_sp_arready_s6;

  // Read Data Channel 6
  wire                                 mon_sp_rvalid_s6;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s6;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s6;
  wire                                 mon_sp_rlast_s6;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s6;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s6;
  wire                                 mon_sp_rready_s6;  

  // Write Address Channel 7
  wire                                 mon_sp_awvalid_s7;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s7;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s7;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s7;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s7;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s7;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s7;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s7;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s7;
  wire                                 mon_sp_awready_s7;

  // Write Data Channel 7
  wire                                 mon_sp_wvalid_s7;
  wire [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s7;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s7;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s7;
  wire                                 mon_sp_wlast_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s7;
  wire                                 mon_sp_wready_s7;

  // Write Response Channel 7
  wire                                 mon_sp_bvalid_s7;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s7;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s7;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s7;
  wire                                 mon_sp_bready_s7;

  // Read Address Channel 7
  wire                                 mon_sp_arvalid_s7;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s7;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s7;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s7;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s7;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s7;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s7;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s7;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s7;
  wire                                 mon_sp_arready_s7;

  // Read Data Channel 7
  wire                                 mon_sp_rvalid_s7;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s7;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s7;
  wire                                 mon_sp_rlast_s7;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s7;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s7;
  wire                                 mon_sp_rready_s7;  

  // Write Address Channel 8
  wire                                 mon_sp_awvalid_s8;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_awaddr_s8;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_awid_s8;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_awlen_s8;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_awsize_s8;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_awburst_s8;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_awlock_s8;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_awcache_s8;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_awprot_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_awsideband_s8;
  wire                                 mon_sp_awready_s8;

  // Write Data Channel 8
  wire                                 mon_sp_wvalid_s8;
  wire [`VIP_WID_PORT_WIDTH-1:0]       mon_sp_wid_s8;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     mon_sp_wdata_s8;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     mon_sp_wstrb_s8;
  wire                                 mon_sp_wlast_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_wsideband_s8;
  wire                                 mon_sp_wready_s8;

  // Write Response Channel 8
  wire                                 mon_sp_bvalid_s8;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      mon_sp_bid_s8;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    mon_sp_bresp_s8;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_bsideband_s8;
  wire                                 mon_sp_bready_s8;

  // Read Address Channel 8
  wire                                 mon_sp_arvalid_s8;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      mon_sp_araddr_s8;
  wire [`VIP_AID_PORT_WIDTH-1:0]       mon_sp_arid_s8;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      mon_sp_arlen_s8;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     mon_sp_arsize_s8;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    mon_sp_arburst_s8;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     mon_sp_arlock_s8;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    mon_sp_arcache_s8;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     mon_sp_arprot_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      mon_sp_arsideband_s8;
  wire                                 mon_sp_arready_s8;

  // Read Data Channel 8
  wire                                 mon_sp_rvalid_s8;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      mon_sp_rid_s8;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    mon_sp_rdata_s8;
  wire                                 mon_sp_rlast_s8;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    mon_sp_rresp_s8;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     mon_sp_rsideband_s8;
  wire                                 mon_sp_rready_s8;  

  // Write Address Channel 1
  wire                                 vip_sp_awvalid_s1;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s1;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s1;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s1;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s1;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s1;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s1;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s1;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s1;

  // Write Data Channel 1
  wire                                 vip_sp_wvalid_s1;
  wire [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s1;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s1;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s1;
  wire                                 vip_sp_wlast_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s1;

  // Write Response Channel 1
  wire                                 vip_sp_bready_s1;

  // Read Address Channel 1
  wire                                 vip_sp_arvalid_s1;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s1;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s1;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s1;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s1;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s1;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s1;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s1;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s1;

  // Read Data Channel 1
  wire                                 vip_sp_rready_s1;  

  // Write Address Channel 2
  wire                                 vip_sp_awvalid_s2;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s2;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s2;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s2;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s2;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s2;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s2;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s2;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s2;

  // Write Data Channel 2
  wire                                 vip_sp_wvalid_s2;
  wire [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s2;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s2;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s2;
  wire                                 vip_sp_wlast_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s2;

  // Write Response Channel 2
  wire                                 vip_sp_bready_s2;

  // Read Address Channel 2
  wire                                 vip_sp_arvalid_s2;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s2;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s2;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s2;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s2;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s2;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s2;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s2;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s2;

  // Read Data Channel 2
  wire                                 vip_sp_rready_s2;  

  // Write Address Channel 3
  wire                                 vip_sp_awvalid_s3;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s3;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s3;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s3;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s3;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s3;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s3;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s3;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s3;

  // Write Data Channel 3
  wire                                 vip_sp_wvalid_s3;
  wire [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s3;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s3;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s3;
  wire                                 vip_sp_wlast_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s3;

  // Write Response Channel 3
  wire                                 vip_sp_bready_s3;

  // Read Address Channel 3
  wire                                 vip_sp_arvalid_s3;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s3;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s3;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s3;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s3;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s3;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s3;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s3;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s3;

  // Read Data Channel 3
  wire                                 vip_sp_rready_s3;  

  // Write Address Channel 4
  wire                                 vip_sp_awvalid_s4;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s4;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s4;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s4;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s4;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s4;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s4;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s4;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s4;

  // Write Data Channel 4
  wire                                 vip_sp_wvalid_s4;
  wire [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s4;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s4;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s4;
  wire                                 vip_sp_wlast_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s4;

  // Write Response Channel 4
  wire                                 vip_sp_bready_s4;

  // Read Address Channel 4
  wire                                 vip_sp_arvalid_s4;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s4;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s4;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s4;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s4;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s4;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s4;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s4;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s4;

  // Read Data Channel 4
  wire                                 vip_sp_rready_s4;  

  // Write Address Channel 5
  wire                                 vip_sp_awvalid_s5;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s5;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s5;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s5;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s5;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s5;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s5;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s5;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s5;

  // Write Data Channel 5
  wire                                 vip_sp_wvalid_s5;
  wire [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s5;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s5;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s5;
  wire                                 vip_sp_wlast_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s5;

  // Write Response Channel 5
  wire                                 vip_sp_bready_s5;

  // Read Address Channel 5
  wire                                 vip_sp_arvalid_s5;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s5;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s5;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s5;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s5;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s5;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s5;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s5;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s5;

  // Read Data Channel 5
  wire                                 vip_sp_rready_s5;  

  // Write Address Channel 6
  wire                                 vip_sp_awvalid_s6;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s6;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s6;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s6;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s6;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s6;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s6;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s6;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s6;

  // Write Data Channel 6
  wire                                 vip_sp_wvalid_s6;
  wire [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s6;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s6;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s6;
  wire                                 vip_sp_wlast_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s6;

  // Write Response Channel 6
  wire                                 vip_sp_bready_s6;

  // Read Address Channel 6
  wire                                 vip_sp_arvalid_s6;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s6;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s6;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s6;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s6;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s6;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s6;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s6;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s6;

  // Read Data Channel 6
  wire                                 vip_sp_rready_s6;  

  // Write Address Channel 7
  wire                                 vip_sp_awvalid_s7;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s7;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s7;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s7;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s7;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s7;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s7;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s7;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s7;

  // Write Data Channel 7
  wire                                 vip_sp_wvalid_s7;
  wire [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s7;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s7;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s7;
  wire                                 vip_sp_wlast_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s7;

  // Write Response Channel 7
  wire                                 vip_sp_bready_s7;

  // Read Address Channel 7
  wire                                 vip_sp_arvalid_s7;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s7;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s7;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s7;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s7;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s7;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s7;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s7;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s7;

  // Read Data Channel 7
  wire                                 vip_sp_rready_s7;  

  // Write Address Channel 8
  wire                                 vip_sp_awvalid_s8;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_awaddr_s8;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_awid_s8;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_awlen_s8;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_awsize_s8;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_awburst_s8;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_awlock_s8;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_awcache_s8;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_awprot_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_awsideband_s8;

  // Write Data Channel 8
  wire                                 vip_sp_wvalid_s8;
  wire [`VIP_WID_PORT_WIDTH-1:0]       vip_sp_wid_s8;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     vip_sp_wdata_s8;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     vip_sp_wstrb_s8;
  wire                                 vip_sp_wlast_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_wsideband_s8;

  // Write Response Channel 8
  wire                                 vip_sp_bready_s8;

  // Read Address Channel 8
  wire                                 vip_sp_arvalid_s8;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      vip_sp_araddr_s8;
  wire [`VIP_AID_PORT_WIDTH-1:0]       vip_sp_arid_s8;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      vip_sp_arlen_s8;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     vip_sp_arsize_s8;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    vip_sp_arburst_s8;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     vip_sp_arlock_s8;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    vip_sp_arcache_s8;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     vip_sp_arprot_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      vip_sp_arsideband_s8;

  // Read Data Channel 8
  wire                                 vip_sp_rready_s8;  

  // Write Address Channel 1
  wire                                 axi_awvalid_s1;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_awaddr_s1;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_awid_s1;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_awlen_s1;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_awsize_s1;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_awburst_s1;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_awlock_s1;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_awcache_s1;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_awprot_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_awsideband_s1;

  // Write Data Channel 1
  wire                                 axi_wvalid_s1;
  wire [`VIP_WID_PORT_WIDTH-1:0]       axi_wid_s1;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     axi_wdata_s1;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     axi_wstrb_s1;
  wire                                 axi_wlast_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_wsideband_s1;

  // Write Response Channel 1
  wire                                 axi_bready_s1;

  // Read Address Channel 1
  wire                                 axi_arvalid_s1;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_araddr_s1;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_arid_s1;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_arlen_s1;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_arsize_s1;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_arburst_s1;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_arlock_s1;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_arcache_s1;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_arprot_s1;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_arsideband_s1;

  // Read Data Channel 1
  wire                                 axi_rready_s1;  

  // Write Address Channel 1
  wire                                 axi_awready_m1;

  // Write Data Channel 1
  wire                                 axi_wready_m1;

  // Write Response Channel 1
  wire                                 axi_bvalid_m1;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      axi_bid_m1;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    axi_bresp_m1;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_bsideband_m1;

  // Read Address Channel 1
  wire                                 axi_arready_m1;

  // Read Data Channel 1
  wire                                 axi_rvalid_m1;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      axi_rid_m1;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    axi_rdata_m1;
  wire                                 axi_rlast_m1;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    axi_rresp_m1;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_rsideband_m1;
  // Write Address Channel 2
  wire                                 axi_awvalid_s2;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_awaddr_s2;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_awid_s2;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_awlen_s2;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_awsize_s2;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_awburst_s2;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_awlock_s2;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_awcache_s2;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_awprot_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_awsideband_s2;

  // Write Data Channel 2
  wire                                 axi_wvalid_s2;
  wire [`VIP_WID_PORT_WIDTH-1:0]       axi_wid_s2;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     axi_wdata_s2;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     axi_wstrb_s2;
  wire                                 axi_wlast_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_wsideband_s2;

  // Write Response Channel 2
  wire                                 axi_bready_s2;

  // Read Address Channel 2
  wire                                 axi_arvalid_s2;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_araddr_s2;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_arid_s2;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_arlen_s2;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_arsize_s2;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_arburst_s2;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_arlock_s2;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_arcache_s2;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_arprot_s2;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_arsideband_s2;

  // Read Data Channel 2
  wire                                 axi_rready_s2;  

  // Write Address Channel 2
  wire                                 axi_awready_m2;

  // Write Data Channel 2
  wire                                 axi_wready_m2;

  // Write Response Channel 2
  wire                                 axi_bvalid_m2;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      axi_bid_m2;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    axi_bresp_m2;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_bsideband_m2;

  // Read Address Channel 2
  wire                                 axi_arready_m2;

  // Read Data Channel 2
  wire                                 axi_rvalid_m2;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      axi_rid_m2;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    axi_rdata_m2;
  wire                                 axi_rlast_m2;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    axi_rresp_m2;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_rsideband_m2;
  // Write Address Channel 3
  wire                                 axi_awvalid_s3;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_awaddr_s3;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_awid_s3;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_awlen_s3;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_awsize_s3;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_awburst_s3;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_awlock_s3;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_awcache_s3;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_awprot_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_awsideband_s3;

  // Write Data Channel 3
  wire                                 axi_wvalid_s3;
  wire [`VIP_WID_PORT_WIDTH-1:0]       axi_wid_s3;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     axi_wdata_s3;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     axi_wstrb_s3;
  wire                                 axi_wlast_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_wsideband_s3;

  // Write Response Channel 3
  wire                                 axi_bready_s3;

  // Read Address Channel 3
  wire                                 axi_arvalid_s3;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_araddr_s3;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_arid_s3;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_arlen_s3;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_arsize_s3;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_arburst_s3;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_arlock_s3;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_arcache_s3;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_arprot_s3;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_arsideband_s3;

  // Read Data Channel 3
  wire                                 axi_rready_s3;  

  // Write Address Channel 3
  wire                                 axi_awready_m3;

  // Write Data Channel 3
  wire                                 axi_wready_m3;

  // Write Response Channel 3
  wire                                 axi_bvalid_m3;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      axi_bid_m3;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    axi_bresp_m3;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_bsideband_m3;

  // Read Address Channel 3
  wire                                 axi_arready_m3;

  // Read Data Channel 3
  wire                                 axi_rvalid_m3;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      axi_rid_m3;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    axi_rdata_m3;
  wire                                 axi_rlast_m3;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    axi_rresp_m3;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_rsideband_m3;
  // Write Address Channel 4
  wire                                 axi_awvalid_s4;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_awaddr_s4;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_awid_s4;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_awlen_s4;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_awsize_s4;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_awburst_s4;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_awlock_s4;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_awcache_s4;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_awprot_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_awsideband_s4;

  // Write Data Channel 4
  wire                                 axi_wvalid_s4;
  wire [`VIP_WID_PORT_WIDTH-1:0]       axi_wid_s4;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     axi_wdata_s4;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     axi_wstrb_s4;
  wire                                 axi_wlast_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_wsideband_s4;

  // Write Response Channel 4
  wire                                 axi_bready_s4;

  // Read Address Channel 4
  wire                                 axi_arvalid_s4;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_araddr_s4;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_arid_s4;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_arlen_s4;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_arsize_s4;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_arburst_s4;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_arlock_s4;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_arcache_s4;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_arprot_s4;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_arsideband_s4;

  // Read Data Channel 4
  wire                                 axi_rready_s4;  

  // Write Address Channel 4
  wire                                 axi_awready_m4;

  // Write Data Channel 4
  wire                                 axi_wready_m4;

  // Write Response Channel 4
  wire                                 axi_bvalid_m4;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      axi_bid_m4;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    axi_bresp_m4;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_bsideband_m4;

  // Read Address Channel 4
  wire                                 axi_arready_m4;

  // Read Data Channel 4
  wire                                 axi_rvalid_m4;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      axi_rid_m4;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    axi_rdata_m4;
  wire                                 axi_rlast_m4;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    axi_rresp_m4;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_rsideband_m4;
  // Write Address Channel 5
  wire                                 axi_awvalid_s5;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_awaddr_s5;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_awid_s5;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_awlen_s5;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_awsize_s5;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_awburst_s5;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_awlock_s5;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_awcache_s5;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_awprot_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_awsideband_s5;

  // Write Data Channel 5
  wire                                 axi_wvalid_s5;
  wire [`VIP_WID_PORT_WIDTH-1:0]       axi_wid_s5;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     axi_wdata_s5;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     axi_wstrb_s5;
  wire                                 axi_wlast_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_wsideband_s5;

  // Write Response Channel 5
  wire                                 axi_bready_s5;

  // Read Address Channel 5
  wire                                 axi_arvalid_s5;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_araddr_s5;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_arid_s5;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_arlen_s5;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_arsize_s5;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_arburst_s5;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_arlock_s5;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_arcache_s5;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_arprot_s5;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_arsideband_s5;

  // Read Data Channel 5
  wire                                 axi_rready_s5;  

  // Write Address Channel 5
  wire                                 axi_awready_m5;

  // Write Data Channel 5
  wire                                 axi_wready_m5;

  // Write Response Channel 5
  wire                                 axi_bvalid_m5;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      axi_bid_m5;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    axi_bresp_m5;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_bsideband_m5;

  // Read Address Channel 5
  wire                                 axi_arready_m5;

  // Read Data Channel 5
  wire                                 axi_rvalid_m5;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      axi_rid_m5;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    axi_rdata_m5;
  wire                                 axi_rlast_m5;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    axi_rresp_m5;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_rsideband_m5;
  // Write Address Channel 6
  wire                                 axi_awvalid_s6;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_awaddr_s6;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_awid_s6;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_awlen_s6;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_awsize_s6;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_awburst_s6;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_awlock_s6;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_awcache_s6;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_awprot_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_awsideband_s6;

  // Write Data Channel 6
  wire                                 axi_wvalid_s6;
  wire [`VIP_WID_PORT_WIDTH-1:0]       axi_wid_s6;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     axi_wdata_s6;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     axi_wstrb_s6;
  wire                                 axi_wlast_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_wsideband_s6;

  // Write Response Channel 6
  wire                                 axi_bready_s6;

  // Read Address Channel 6
  wire                                 axi_arvalid_s6;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_araddr_s6;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_arid_s6;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_arlen_s6;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_arsize_s6;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_arburst_s6;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_arlock_s6;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_arcache_s6;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_arprot_s6;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_arsideband_s6;

  // Read Data Channel 6
  wire                                 axi_rready_s6;  

  // Write Address Channel 6
  wire                                 axi_awready_m6;

  // Write Data Channel 6
  wire                                 axi_wready_m6;

  // Write Response Channel 6
  wire                                 axi_bvalid_m6;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      axi_bid_m6;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    axi_bresp_m6;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_bsideband_m6;

  // Read Address Channel 6
  wire                                 axi_arready_m6;

  // Read Data Channel 6
  wire                                 axi_rvalid_m6;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      axi_rid_m6;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    axi_rdata_m6;
  wire                                 axi_rlast_m6;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    axi_rresp_m6;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_rsideband_m6;
  // Write Address Channel 7
  wire                                 axi_awvalid_s7;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_awaddr_s7;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_awid_s7;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_awlen_s7;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_awsize_s7;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_awburst_s7;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_awlock_s7;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_awcache_s7;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_awprot_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_awsideband_s7;

  // Write Data Channel 7
  wire                                 axi_wvalid_s7;
  wire [`VIP_WID_PORT_WIDTH-1:0]       axi_wid_s7;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     axi_wdata_s7;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     axi_wstrb_s7;
  wire                                 axi_wlast_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_wsideband_s7;

  // Write Response Channel 7
  wire                                 axi_bready_s7;

  // Read Address Channel 7
  wire                                 axi_arvalid_s7;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_araddr_s7;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_arid_s7;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_arlen_s7;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_arsize_s7;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_arburst_s7;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_arlock_s7;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_arcache_s7;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_arprot_s7;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_arsideband_s7;

  // Read Data Channel 7
  wire                                 axi_rready_s7;  

  // Write Address Channel 7
  wire                                 axi_awready_m7;

  // Write Data Channel 7
  wire                                 axi_wready_m7;

  // Write Response Channel 7
  wire                                 axi_bvalid_m7;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      axi_bid_m7;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    axi_bresp_m7;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_bsideband_m7;

  // Read Address Channel 7
  wire                                 axi_arready_m7;

  // Read Data Channel 7
  wire                                 axi_rvalid_m7;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      axi_rid_m7;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    axi_rdata_m7;
  wire                                 axi_rlast_m7;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    axi_rresp_m7;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_rsideband_m7;
  // Write Address Channel 8
  wire                                 axi_awvalid_s8;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_awaddr_s8;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_awid_s8;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_awlen_s8;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_awsize_s8;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_awburst_s8;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_awlock_s8;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_awcache_s8;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_awprot_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_awsideband_s8;

  // Write Data Channel 8
  wire                                 axi_wvalid_s8;
  wire [`VIP_WID_PORT_WIDTH-1:0]       axi_wid_s8;
  wire [`VIP_WDATA_PORT_WIDTH-1:0]     axi_wdata_s8;
  wire [`VIP_WSTRB_PORT_WIDTH-1:0]     axi_wstrb_s8;
  wire                                 axi_wlast_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_wsideband_s8;

  // Write Response Channel 8
  wire                                 axi_bready_s8;

  // Read Address Channel 8
  wire                                 axi_arvalid_s8;
  wire [`VIP_ADDR_PORT_WIDTH-1:0]      axi_araddr_s8;
  wire [`VIP_AID_PORT_WIDTH-1:0]       axi_arid_s8;
  wire [`VIP_ALEN_PORT_WIDTH-1:0]      axi_arlen_s8;
  wire [`VIP_ASIZE_PORT_WIDTH-1:0]     axi_arsize_s8;
  wire [`VIP_ABURST_PORT_WIDTH-1:0]    axi_arburst_s8;
  wire [`VIP_ALOCK_PORT_WIDTH-1:0]     axi_arlock_s8;
  wire [`VIP_ACACHE_PORT_WIDTH-1:0]    axi_arcache_s8;
  wire [`VIP_APROT_PORT_WIDTH-1:0]     axi_arprot_s8;
  wire [`VIP_SIDE_PORT_WIDTH-1:0]      axi_arsideband_s8;

  // Read Data Channel 8
  wire                                 axi_rready_s8;  

  // Write Address Channel 8
  wire                                 axi_awready_m8;

  // Write Data Channel 8
  wire                                 axi_wready_m8;

  // Write Response Channel 8
  wire                                 axi_bvalid_m8;
  wire  [`VIP_BID_PORT_WIDTH-1:0]      axi_bid_m8;
  wire  [`VIP_BRESP_PORT_WIDTH-1:0]    axi_bresp_m8;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_bsideband_m8;

  // Read Address Channel 8
  wire                                 axi_arready_m8;

  // Read Data Channel 8
  wire                                 axi_rvalid_m8;
  wire  [`VIP_RID_PORT_WIDTH-1:0]      axi_rid_m8;
  wire  [`VIP_RDATA_PORT_WIDTH-1:0]    axi_rdata_m8;
  wire                                 axi_rlast_m8;
  wire  [`VIP_RRESP_PORT_WIDTH-1:0]    axi_rresp_m8;
  wire  [`VIP_SIDE_PORT_WIDTH-1:0]     axi_rsideband_m8;

    // General Configurable parameters
  assign tz_secure_m = (`X2X_HAS_TZ_SUPPORT) ? wrap_tz_secure_m : 0;
  assign wrap_tz_secure_s = (`X2X_HAS_TZ_SUPPORT) ? tz_secure_s : 0;
  
  assign csysack = `X2X_LOWPWR_HS_IF ? wrap_csysack : 1'b1;
  assign cactive = `X2X_LOWPWR_HS_IF ? wrap_cactive : 1'b1;
  assign wrap_csysreq = csysreq;

  // MP Write Address Channel 
  assign awready_m = awready_mp;

  // MP Write Data Channel from Master
  assign wready_m = wready_mp;

  // MP Write Response Channel from Master
  assign bvalid_m    = bvalid_mp;
  assign bid_m       = {{`VIP_BID_PORT_WIDTH{1'b0}}, bid_mp};
  assign bresp_m     = bresp_mp;
  assign bsideband_m = (`X2X_HAS_BSB) ? bsideband_mp : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // MP Read Address Channel from Master
  assign arready_m = (`X2X_CH_SEL == 0) ? arready_mp : 1'b0;

  // MP Read Data Channel from Master
  assign rvalid_m = (`X2X_CH_SEL == 0) ? rvalid_mp : 1'b0;
  assign rid_m    = (`X2X_CH_SEL == 0) ?{{`VIP_RID_PORT_WIDTH{1'b0}}, rid_mp}     : {`VIP_RID_PORT_WIDTH{1'b0}};
  assign rdata_m  = (`X2X_CH_SEL == 0) ?{{`VIP_RDATA_PORT_WIDTH{1'b0}}, rdata_mp} : {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign rlast_m  = (`X2X_CH_SEL == 0) ? rlast_mp : 1'b0;
  assign rresp_m  = (`X2X_CH_SEL == 0) ? rresp_mp : 2'b0;
  assign rsideband_m = (`X2X_CH_SEL == 0 && `X2X_HAS_RSB) ? rsideband_mp : {`VIP_SIDE_PORT_WIDTH{1'b0}};
  
  // MP Write Address Channel 
  assign awvalid_mp    = awvalid_m;
  assign awaddr_mp     = awaddr_m[`X2X_MP_AW-1:0];
  assign awid_mp       = awid_m[`X2X_MP_IDW-1:0];
  assign awlen_mp      = awlen_m[`X2X_MP_BLW-1:0];
  assign awsize_mp     = awsize_m[`X2X_BSW-1:0];
  assign awburst_mp    = awburst_m[`X2X_BTW-1:0];
  assign awlock_mp     = awlock_m[`X2X_LTW-1:0];
  assign awcache_mp    = awcache_m[`X2X_CTW-1:0];
  assign awprot_mp     = awprot_m[`X2X_PTW-1:0];
  assign awsideband_mp = (`X2X_HAS_AWSB) ? awsideband_m[`X2X_AW_SBW-1:0] : {`X2X_AW_SBW{1'b0}};

  // MP Write Data Channel from Master
  assign wvalid_mp     = wvalid_m;
  assign wid_mp        = wid_m[`X2X_MP_IDW-1:0];
  assign wdata_mp      = wdata_m[`X2X_MP_DW-1:0];
  assign wstrb_mp      = wstrb_m[`X2X_MP_SW-1:0];
  assign wlast_mp      = wlast_m;
  assign wsideband_mp  = (`X2X_HAS_WSB) ? wsideband_m[`X2X_W_SBW-1:0] : {`X2X_W_SBW{1'b0}};

  // MP Write Response Channel from Master
  assign bready_mp = bready_m;

  // MP Read Address Channel from Master
  assign arvalid_mp    = (`X2X_CH_SEL == 0) ? arvalid_m : 1'b0;
  assign arid_mp       = (`X2X_CH_SEL == 0) ? arid_m[`X2X_MP_IDW-1:0]  : {`X2X_MP_IDW{1'b0}};
  assign araddr_mp     = (`X2X_CH_SEL == 0) ? araddr_m[`X2X_MP_AW-1:0] : {`X2X_MP_AW{1'b0}};
  assign arlen_mp      = (`X2X_CH_SEL == 0) ? arlen_m[`X2X_MP_BLW-1:0] : {`X2X_MP_BLW{1'b0}};
  assign arsize_mp     = (`X2X_CH_SEL == 0) ? arsize_m[`X2X_BSW-1:0]   : {`X2X_BSW{1'b0}};
  assign arburst_mp    = (`X2X_CH_SEL == 0) ? arburst_m[`X2X_BTW-1:0]  : {`X2X_BTW{1'b0}};
  assign arlock_mp     = (`X2X_CH_SEL == 0) ? arlock_m[`X2X_LTW-1:0]   : {`X2X_LTW{1'b0}};
  assign arcache_mp    = (`X2X_CH_SEL == 0) ? arcache_m[`X2X_CTW-1:0]  : {`X2X_CTW{1'b0}};
  assign arprot_mp     = (`X2X_CH_SEL == 0) ? arprot_m[`X2X_PTW-1:0]   : {`X2X_PTW{1'b0}};
  assign arsideband_mp = (`X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? arsideband_m[`X2X_AR_SBW-1:0] : {`X2X_AR_SBW{1'b0}};

  // MP Read Data Channel from Master
  assign  rready_mp = (`X2X_CH_SEL == 0) ? rready_m : 1'b0;

  // SLAVE PORT I/O

  // Write Address Channel 1
  assign awready_s1 = mon_sp_awready_s1;

  // Write Data Channel 1
  assign wready_s1 = mon_sp_wready_s1;

  // Write Response Channel 1
  assign bvalid_s1    =  mon_sp_bvalid_s1;
  assign bid_s1       =  mon_sp_bid_s1[`X2X_SP_IDW-1:0];
  assign bresp_s1     =  mon_sp_bresp_s1[`X2X_BRW-1:0];
  assign bsideband_s1 = (`X2X_HAS_BSB) ? mon_sp_bsideband_s1[`X2X_B_SBW-1:0] : {`X2X_B_SBW{1'b0}};

  // Write Address Channel 2
  assign awready_s2 = mon_sp_awready_s2;

  // Write Data Channel 2
  assign wready_s2 = mon_sp_wready_s2;

  // Write Response Channel 2
  assign bvalid_s2    =  mon_sp_bvalid_s2;
  assign bid_s2       =  mon_sp_bid_s2[`X2X_SP_IDW-1:0];
  assign bresp_s2     =  mon_sp_bresp_s2[`X2X_BRW-1:0];
  assign bsideband_s2 = (`X2X_HAS_BSB) ? mon_sp_bsideband_s2[`X2X_B_SBW-1:0] : {`X2X_B_SBW{1'b0}};

  // Write Address Channel 3
  assign awready_s3 = mon_sp_awready_s3;

  // Write Data Channel 3
  assign wready_s3 = mon_sp_wready_s3;

  // Write Response Channel 3
  assign bvalid_s3    =  mon_sp_bvalid_s3;
  assign bid_s3       =  mon_sp_bid_s3[`X2X_SP_IDW-1:0];
  assign bresp_s3     =  mon_sp_bresp_s3[`X2X_BRW-1:0];
  assign bsideband_s3 = (`X2X_HAS_BSB) ? mon_sp_bsideband_s3[`X2X_B_SBW-1:0] : {`X2X_B_SBW{1'b0}};

  // Write Address Channel 4
  assign awready_s4 = mon_sp_awready_s4;

  // Write Data Channel 4
  assign wready_s4 = mon_sp_wready_s4;

  // Write Response Channel 4
  assign bvalid_s4    =  mon_sp_bvalid_s4;
  assign bid_s4       =  mon_sp_bid_s4[`X2X_SP_IDW-1:0];
  assign bresp_s4     =  mon_sp_bresp_s4[`X2X_BRW-1:0];
  assign bsideband_s4 = (`X2X_HAS_BSB) ? mon_sp_bsideband_s4[`X2X_B_SBW-1:0] : {`X2X_B_SBW{1'b0}};

  // Write Address Channel 5
  assign awready_s5 = mon_sp_awready_s5;

  // Write Data Channel 5
  assign wready_s5 = mon_sp_wready_s5;

  // Write Response Channel 5
  assign bvalid_s5    =  mon_sp_bvalid_s5;
  assign bid_s5       =  mon_sp_bid_s5[`X2X_SP_IDW-1:0];
  assign bresp_s5     =  mon_sp_bresp_s5[`X2X_BRW-1:0];
  assign bsideband_s5 = (`X2X_HAS_BSB) ? mon_sp_bsideband_s5[`X2X_B_SBW-1:0] : {`X2X_B_SBW{1'b0}};

  // Write Address Channel 6
  assign awready_s6 = mon_sp_awready_s6;

  // Write Data Channel 6
  assign wready_s6 = mon_sp_wready_s6;

  // Write Response Channel 6
  assign bvalid_s6    =  mon_sp_bvalid_s6;
  assign bid_s6       =  mon_sp_bid_s6[`X2X_SP_IDW-1:0];
  assign bresp_s6     =  mon_sp_bresp_s6[`X2X_BRW-1:0];
  assign bsideband_s6 = (`X2X_HAS_BSB) ? mon_sp_bsideband_s6[`X2X_B_SBW-1:0] : {`X2X_B_SBW{1'b0}};

  // Write Address Channel 7
  assign awready_s7 = mon_sp_awready_s7;

  // Write Data Channel 7
  assign wready_s7 = mon_sp_wready_s7;

  // Write Response Channel 7
  assign bvalid_s7    =  mon_sp_bvalid_s7;
  assign bid_s7       =  mon_sp_bid_s7[`X2X_SP_IDW-1:0];
  assign bresp_s7     =  mon_sp_bresp_s7[`X2X_BRW-1:0];
  assign bsideband_s7 = (`X2X_HAS_BSB) ? mon_sp_bsideband_s7[`X2X_B_SBW-1:0] : {`X2X_B_SBW{1'b0}};

  // Write Address Channel 8
  assign awready_s8 = mon_sp_awready_s8;

  // Write Data Channel 8
  assign wready_s8 = mon_sp_wready_s8;

  // Write Response Channel 8
  assign bvalid_s8    =  mon_sp_bvalid_s8;
  assign bid_s8       =  mon_sp_bid_s8[`X2X_SP_IDW-1:0];
  assign bresp_s8     =  mon_sp_bresp_s8[`X2X_BRW-1:0];
  assign bsideband_s8 = (`X2X_HAS_BSB) ? mon_sp_bsideband_s8[`X2X_B_SBW-1:0] : {`X2X_B_SBW{1'b0}};

  // Read Address Channel
  assign arready_s = (`X2X_CH_SEL == 0) ? mon_sp_arready_s1 : 1'b0;

  // Read Data Channel
  assign rvalid_s     = (`X2X_CH_SEL == 0) ? mon_sp_rvalid_s1 : 1'b0;
  assign rid_s        = (`X2X_CH_SEL == 0) ? mon_sp_rid_s1[`X2X_SP_IDW-1:0] : {`X2X_SP_IDW{1'b0}};
  assign rdata_s      = (`X2X_CH_SEL == 0) ? mon_sp_rdata_s1[`X2X_SP_DW-1:0]: {`X2X_SP_DW{1'b0}};
  assign rlast_s      = (`X2X_CH_SEL == 0) ? mon_sp_rlast_s1 : 1'b0;
  assign rresp_s      = (`X2X_CH_SEL == 0) ? mon_sp_rresp_s1[`X2X_RRW-1:0]: {`X2X_RRW{1'b0}};
  assign rsideband_s  = (`X2X_CH_SEL == 0 && `X2X_HAS_RSB) ? mon_sp_rsideband_s1[`X2X_R_SBW-1:0] : {`X2X_R_SBW{1'b0}};

  // Write Address Channel 1
  assign mon_sp_awvalid_s1    = awvalid_s1;
  assign mon_sp_awready_s1    = (`X2X_HAS_WI_FAN_OUT) ? axi_awready_m1 : vip_sp_awready_s1;
  assign mon_sp_awaddr_s1     = {{`VIP_ADDR_PORT_WIDTH{1'b0}}, awaddr_s1};
  assign mon_sp_awid_s1       = {{`VIP_AID_PORT_WIDTH{1'b0}}, awid_s1};
  assign mon_sp_awlen_s1      = {{`VIP_ALEN_PORT_WIDTH{1'b0}}, awlen_s1};
  assign mon_sp_awsize_s1     = {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, awsize_s1};
  assign mon_sp_awburst_s1    = {{`VIP_ABURST_PORT_WIDTH{1'b0}}, awburst_s1};
  assign mon_sp_awlock_s1     = {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, awlock_s1};
  assign mon_sp_awcache_s1    = {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, awcache_s1};
  assign mon_sp_awprot_s1     = {{`VIP_APROT_PORT_WIDTH{1'b0}}, awprot_s1};
  assign mon_sp_awsideband_s1 = (`X2X_HAS_AWSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, awsideband_s1} : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Data Channel 1
  assign mon_sp_wvalid_s1    = wvalid_s1;
  assign mon_sp_wready_s1    = (`X2X_HAS_WI_FAN_OUT) ? axi_wready_m1 : vip_sp_wready_s1;
  assign mon_sp_wid_s1       = {{`VIP_WID_PORT_WIDTH{1'b0}}, wid_s1};
  assign mon_sp_wdata_s1     = {{`VIP_WDATA_PORT_WIDTH{1'b0}}, wdata_s1};
  assign mon_sp_wstrb_s1     = {{`VIP_WSTRB_PORT_WIDTH{1'b0}}, wstrb_s1};
  assign mon_sp_wlast_s1     = wlast_s1;
  assign mon_sp_wsideband_s1 = (`X2X_HAS_WSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, wsideband_s1} : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Response Channel 1
  assign mon_sp_bvalid_s1    = (`X2X_HAS_WI_FAN_OUT) ? axi_bvalid_m1 : vip_sp_bvalid_s1;
  assign mon_sp_bid_s1       = (`X2X_HAS_WI_FAN_OUT) ? axi_bid_m1    : vip_sp_bid_s1;
  assign mon_sp_bresp_s1     = (`X2X_HAS_WI_FAN_OUT) ? axi_bresp_m1  : vip_sp_bresp_s1;
  assign mon_sp_bready_s1    = bready_s1;
  assign mon_sp_bsideband_s1 = (`X2X_HAS_BSB == 0) ? {`VIP_SIDE_PORT_WIDTH{1'b0}}  :
                               (`X2X_HAS_WI_FAN_OUT)   ? axi_bsideband_m1  : vip_sp_bsideband_s1;

  // Read Address Channel 1
  assign mon_sp_arvalid_s1    = (`X2X_CH_SEL == 0) ? arvalid_s : 1'b0;
  assign mon_sp_araddr_s1     = (`X2X_CH_SEL == 0) ? {{`VIP_ADDR_PORT_WIDTH{1'b0}}, araddr_s}   : {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_arid_s1       = (`X2X_CH_SEL == 0) ? {{`VIP_AID_PORT_WIDTH{1'b0}}, arid_s}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_arlen_s1      = (`X2X_CH_SEL == 0) ? {{`VIP_ALEN_PORT_WIDTH{1'b0}}, arlen_s}    : {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_arsize_s1     = (`X2X_CH_SEL == 0) ? {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, arsize_s}  : {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_arburst_s1    = (`X2X_CH_SEL == 0) ? {{`VIP_ABURST_PORT_WIDTH{1'b0}}, arburst_s}: {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_arlock_s1     = (`X2X_CH_SEL == 0) ? {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, arlock_s}  : {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_arcache_s1    = (`X2X_CH_SEL == 0) ? {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, arcache_s}: {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_arprot_s1     = (`X2X_CH_SEL == 0) ? {{`VIP_APROT_PORT_WIDTH{1'b0}}, arprot_s}  : {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_arsideband_s1 = (`X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, arsideband_s} : {`VIP_SIDE_PORT_WIDTH{1'b0}};
  assign mon_sp_arready_s1    = (`X2X_CH_SEL == 0) ? ((`X2X_HAS_WI_FAN_OUT) ? axi_arready_m1 : vip_sp_arready_s1) : 1'b0;

  // Read Data Channel 1
  assign mon_sp_rready_s1    = (`X2X_CH_SEL == 0) ? rready_s : 1'b0;  
  assign mon_sp_rvalid_s1    = (`X2X_CH_SEL == 0) ? ((`X2X_HAS_WI_FAN_OUT) ? axi_rvalid_m1    : vip_sp_rvalid_s1)    : 1'b0;
  assign mon_sp_rid_s1       = (`X2X_CH_SEL == 0) ? ((`X2X_HAS_WI_FAN_OUT) ? axi_rid_m1       : vip_sp_rid_s1)       : {`VIP_RID_PORT_WIDTH{1'b0}};
  assign mon_sp_rdata_s1     = (`X2X_CH_SEL == 0) ? ((`X2X_HAS_WI_FAN_OUT) ? axi_rdata_m1     : vip_sp_rdata_s1)     : {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_rlast_s1     = (`X2X_CH_SEL == 0) ? ((`X2X_HAS_WI_FAN_OUT) ? axi_rlast_m1     : vip_sp_rlast_s1)     : 1'b0;
  assign mon_sp_rresp_s1     = (`X2X_CH_SEL == 0) ? ((`X2X_HAS_WI_FAN_OUT) ? axi_rresp_m1     : vip_sp_rresp_s1)     : {`VIP_RRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_rsideband_s1 = (`X2X_CH_SEL == 0) ? ((`X2X_HAS_WI_FAN_OUT) ? axi_rsideband_m1 : vip_sp_rsideband_s1) : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Address Channel 2
  assign mon_sp_awvalid_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? awvalid_s2 :  1'b0;
  assign mon_sp_awready_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? axi_awready_m2 :  1'b0;
  assign mon_sp_awaddr_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_ADDR_PORT_WIDTH{1'b0}}, awaddr_s2}   : {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_awid_s2       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_AID_PORT_WIDTH{1'b0}}, awid_s2}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_awlen_s2      = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_ALEN_PORT_WIDTH{1'b0}}, awlen_s2}    : {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_awsize_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, awsize_s2}  : {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_awburst_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_ABURST_PORT_WIDTH{1'b0}}, awburst_s2}: {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_awlock_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, awlock_s2}  : {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_awcache_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, awcache_s2}: {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_awprot_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_APROT_PORT_WIDTH{1'b0}}, awprot_s2}  : {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_awsideband_s2 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2 && `X2X_HAS_AWSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, awsideband_s2}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Data Channel 2
  assign mon_sp_wvalid_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? wvalid_s2 :  1'b0;
  assign mon_sp_wready_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2)  ? axi_wready_m2 :  1'b0;
  assign mon_sp_wid_s2       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_WID_PORT_WIDTH{1'b0}}, wid_s2}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_wdata_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_WDATA_PORT_WIDTH{1'b0}}, wdata_s2}  : {`VIP_WDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_wstrb_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? {{`VIP_WSTRB_PORT_WIDTH{1'b0}}, wstrb_s2}  : {`VIP_WSTRB_PORT_WIDTH{1'b0}};
  assign mon_sp_wlast_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? wlast_s2 :  1'b0;
  assign mon_sp_wsideband_s2 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2 && `X2X_HAS_WSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, wsideband_s2}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Response Channel 2
  assign mon_sp_bvalid_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? axi_bvalid_m2 : 1'b0;
  assign mon_sp_bready_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? bready_s2     : 1'b0;
  assign mon_sp_bid_s2       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? axi_bid_m2    : {`VIP_BID_PORT_WIDTH{1'b0}};
  assign mon_sp_bresp_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2) ? axi_bresp_m2  : {`VIP_BRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_bsideband_s2 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 2 && `X2X_HAS_BSB) ? axi_bsideband_m2  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Address Channel 2
  assign mon_sp_arvalid_s2    = 1'b0;
  assign mon_sp_araddr_s2     = {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_arid_s2       = {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_arlen_s2      = {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_arsize_s2     = {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_arburst_s2    = {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_arlock_s2     = {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_arcache_s2    = {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_arprot_s2     = {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_arsideband_s2 = {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Data Channel 2
  assign mon_sp_rready_s2    = 1'b0;  
  assign mon_sp_rvalid_s2    = 1'b0;
  assign mon_sp_rid_s2       = {`VIP_RID_PORT_WIDTH{1'b0}};
  assign mon_sp_rdata_s2     = {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_rlast_s2     = 1'b0;
  assign mon_sp_rresp_s2     = {`VIP_RRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_rsideband_s2 = {`VIP_SIDE_PORT_WIDTH{1'b0}}; 

  // Write Address Channel 3
  assign mon_sp_awvalid_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? awvalid_s3 :  1'b0;
  assign mon_sp_awready_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? axi_awready_m3 :  1'b0;
  assign mon_sp_awaddr_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_ADDR_PORT_WIDTH{1'b0}}, awaddr_s3}   : {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_awid_s3       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_AID_PORT_WIDTH{1'b0}}, awid_s3}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_awlen_s3      = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_ALEN_PORT_WIDTH{1'b0}}, awlen_s3}    : {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_awsize_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, awsize_s3}  : {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_awburst_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_ABURST_PORT_WIDTH{1'b0}}, awburst_s3}: {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_awlock_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, awlock_s3}  : {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_awcache_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, awcache_s3}: {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_awprot_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_APROT_PORT_WIDTH{1'b0}}, awprot_s3}  : {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_awsideband_s3 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3 && `X2X_HAS_AWSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, awsideband_s3}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Data Channel 3
  assign mon_sp_wvalid_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? wvalid_s3 :  1'b0;
  assign mon_sp_wready_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3)  ? axi_wready_m3 :  1'b0;
  assign mon_sp_wid_s3       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_WID_PORT_WIDTH{1'b0}}, wid_s3}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_wdata_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_WDATA_PORT_WIDTH{1'b0}}, wdata_s3}  : {`VIP_WDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_wstrb_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? {{`VIP_WSTRB_PORT_WIDTH{1'b0}}, wstrb_s3}  : {`VIP_WSTRB_PORT_WIDTH{1'b0}};
  assign mon_sp_wlast_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? wlast_s3 :  1'b0;
  assign mon_sp_wsideband_s3 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3 && `X2X_HAS_WSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, wsideband_s3}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Response Channel 3
  assign mon_sp_bvalid_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? axi_bvalid_m3 : 1'b0;
  assign mon_sp_bready_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? bready_s3     : 1'b0;
  assign mon_sp_bid_s3       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? axi_bid_m3    : {`VIP_BID_PORT_WIDTH{1'b0}};
  assign mon_sp_bresp_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3) ? axi_bresp_m3  : {`VIP_BRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_bsideband_s3 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 3 && `X2X_HAS_BSB) ? axi_bsideband_m3  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Address Channel 3
  assign mon_sp_arvalid_s3    = 1'b0;
  assign mon_sp_araddr_s3     = {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_arid_s3       = {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_arlen_s3      = {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_arsize_s3     = {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_arburst_s3    = {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_arlock_s3     = {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_arcache_s3    = {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_arprot_s3     = {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_arsideband_s3 = {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Data Channel 3
  assign mon_sp_rready_s3    = 1'b0;  
  assign mon_sp_rvalid_s3    = 1'b0;
  assign mon_sp_rid_s3       = {`VIP_RID_PORT_WIDTH{1'b0}};
  assign mon_sp_rdata_s3     = {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_rlast_s3     = 1'b0;
  assign mon_sp_rresp_s3     = {`VIP_RRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_rsideband_s3 = {`VIP_SIDE_PORT_WIDTH{1'b0}}; 

  // Write Address Channel 4
  assign mon_sp_awvalid_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? awvalid_s4 :  1'b0;
  assign mon_sp_awready_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? axi_awready_m4 :  1'b0;
  assign mon_sp_awaddr_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_ADDR_PORT_WIDTH{1'b0}}, awaddr_s4}   : {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_awid_s4       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_AID_PORT_WIDTH{1'b0}}, awid_s4}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_awlen_s4      = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_ALEN_PORT_WIDTH{1'b0}}, awlen_s4}    : {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_awsize_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, awsize_s4}  : {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_awburst_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_ABURST_PORT_WIDTH{1'b0}}, awburst_s4}: {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_awlock_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, awlock_s4}  : {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_awcache_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, awcache_s4}: {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_awprot_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_APROT_PORT_WIDTH{1'b0}}, awprot_s4}  : {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_awsideband_s4 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4 && `X2X_HAS_AWSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, awsideband_s4}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Data Channel 4
  assign mon_sp_wvalid_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? wvalid_s4 :  1'b0;
  assign mon_sp_wready_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4)  ? axi_wready_m4 :  1'b0;
  assign mon_sp_wid_s4       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_WID_PORT_WIDTH{1'b0}}, wid_s4}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_wdata_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_WDATA_PORT_WIDTH{1'b0}}, wdata_s4}  : {`VIP_WDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_wstrb_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? {{`VIP_WSTRB_PORT_WIDTH{1'b0}}, wstrb_s4}  : {`VIP_WSTRB_PORT_WIDTH{1'b0}};
  assign mon_sp_wlast_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? wlast_s4 :  1'b0;
  assign mon_sp_wsideband_s4 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4 && `X2X_HAS_WSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, wsideband_s4}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Response Channel 4
  assign mon_sp_bvalid_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? axi_bvalid_m4 : 1'b0;
  assign mon_sp_bready_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? bready_s4     : 1'b0;
  assign mon_sp_bid_s4       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? axi_bid_m4    : {`VIP_BID_PORT_WIDTH{1'b0}};
  assign mon_sp_bresp_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4) ? axi_bresp_m4  : {`VIP_BRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_bsideband_s4 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 4 && `X2X_HAS_BSB) ? axi_bsideband_m4  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Address Channel 4
  assign mon_sp_arvalid_s4    = 1'b0;
  assign mon_sp_araddr_s4     = {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_arid_s4       = {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_arlen_s4      = {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_arsize_s4     = {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_arburst_s4    = {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_arlock_s4     = {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_arcache_s4    = {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_arprot_s4     = {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_arsideband_s4 = {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Data Channel 4
  assign mon_sp_rready_s4    = 1'b0;  
  assign mon_sp_rvalid_s4    = 1'b0;
  assign mon_sp_rid_s4       = {`VIP_RID_PORT_WIDTH{1'b0}};
  assign mon_sp_rdata_s4     = {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_rlast_s4     = 1'b0;
  assign mon_sp_rresp_s4     = {`VIP_RRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_rsideband_s4 = {`VIP_SIDE_PORT_WIDTH{1'b0}}; 

  // Write Address Channel 5
  assign mon_sp_awvalid_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? awvalid_s5 :  1'b0;
  assign mon_sp_awready_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? axi_awready_m5 :  1'b0;
  assign mon_sp_awaddr_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_ADDR_PORT_WIDTH{1'b0}}, awaddr_s5}   : {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_awid_s5       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_AID_PORT_WIDTH{1'b0}}, awid_s5}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_awlen_s5      = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_ALEN_PORT_WIDTH{1'b0}}, awlen_s5}    : {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_awsize_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, awsize_s5}  : {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_awburst_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_ABURST_PORT_WIDTH{1'b0}}, awburst_s5}: {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_awlock_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, awlock_s5}  : {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_awcache_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, awcache_s5}: {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_awprot_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_APROT_PORT_WIDTH{1'b0}}, awprot_s5}  : {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_awsideband_s5 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5 && `X2X_HAS_AWSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, awsideband_s5}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Data Channel 5
  assign mon_sp_wvalid_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? wvalid_s5 :  1'b0;
  assign mon_sp_wready_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5)  ? axi_wready_m5 :  1'b0;
  assign mon_sp_wid_s5       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_WID_PORT_WIDTH{1'b0}}, wid_s5}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_wdata_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_WDATA_PORT_WIDTH{1'b0}}, wdata_s5}  : {`VIP_WDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_wstrb_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? {{`VIP_WSTRB_PORT_WIDTH{1'b0}}, wstrb_s5}  : {`VIP_WSTRB_PORT_WIDTH{1'b0}};
  assign mon_sp_wlast_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? wlast_s5 :  1'b0;
  assign mon_sp_wsideband_s5 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5 && `X2X_HAS_WSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, wsideband_s5}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Response Channel 5
  assign mon_sp_bvalid_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? axi_bvalid_m5 : 1'b0;
  assign mon_sp_bready_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? bready_s5     : 1'b0;
  assign mon_sp_bid_s5       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? axi_bid_m5    : {`VIP_BID_PORT_WIDTH{1'b0}};
  assign mon_sp_bresp_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5) ? axi_bresp_m5  : {`VIP_BRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_bsideband_s5 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 5 && `X2X_HAS_BSB) ? axi_bsideband_m5  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Address Channel 5
  assign mon_sp_arvalid_s5    = 1'b0;
  assign mon_sp_araddr_s5     = {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_arid_s5       = {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_arlen_s5      = {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_arsize_s5     = {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_arburst_s5    = {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_arlock_s5     = {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_arcache_s5    = {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_arprot_s5     = {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_arsideband_s5 = {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Data Channel 5
  assign mon_sp_rready_s5    = 1'b0;  
  assign mon_sp_rvalid_s5    = 1'b0;
  assign mon_sp_rid_s5       = {`VIP_RID_PORT_WIDTH{1'b0}};
  assign mon_sp_rdata_s5     = {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_rlast_s5     = 1'b0;
  assign mon_sp_rresp_s5     = {`VIP_RRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_rsideband_s5 = {`VIP_SIDE_PORT_WIDTH{1'b0}}; 

  // Write Address Channel 6
  assign mon_sp_awvalid_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? awvalid_s6 :  1'b0;
  assign mon_sp_awready_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? axi_awready_m6 :  1'b0;
  assign mon_sp_awaddr_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_ADDR_PORT_WIDTH{1'b0}}, awaddr_s6}   : {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_awid_s6       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_AID_PORT_WIDTH{1'b0}}, awid_s6}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_awlen_s6      = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_ALEN_PORT_WIDTH{1'b0}}, awlen_s6}    : {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_awsize_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, awsize_s6}  : {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_awburst_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_ABURST_PORT_WIDTH{1'b0}}, awburst_s6}: {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_awlock_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, awlock_s6}  : {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_awcache_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, awcache_s6}: {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_awprot_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_APROT_PORT_WIDTH{1'b0}}, awprot_s6}  : {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_awsideband_s6 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6 && `X2X_HAS_AWSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, awsideband_s6}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Data Channel 6
  assign mon_sp_wvalid_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? wvalid_s6 :  1'b0;
  assign mon_sp_wready_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6)  ? axi_wready_m6 :  1'b0;
  assign mon_sp_wid_s6       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_WID_PORT_WIDTH{1'b0}}, wid_s6}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_wdata_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_WDATA_PORT_WIDTH{1'b0}}, wdata_s6}  : {`VIP_WDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_wstrb_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? {{`VIP_WSTRB_PORT_WIDTH{1'b0}}, wstrb_s6}  : {`VIP_WSTRB_PORT_WIDTH{1'b0}};
  assign mon_sp_wlast_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? wlast_s6 :  1'b0;
  assign mon_sp_wsideband_s6 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6 && `X2X_HAS_WSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, wsideband_s6}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Response Channel 6
  assign mon_sp_bvalid_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? axi_bvalid_m6 : 1'b0;
  assign mon_sp_bready_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? bready_s6     : 1'b0;
  assign mon_sp_bid_s6       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? axi_bid_m6    : {`VIP_BID_PORT_WIDTH{1'b0}};
  assign mon_sp_bresp_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6) ? axi_bresp_m6  : {`VIP_BRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_bsideband_s6 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 6 && `X2X_HAS_BSB) ? axi_bsideband_m6  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Address Channel 6
  assign mon_sp_arvalid_s6    = 1'b0;
  assign mon_sp_araddr_s6     = {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_arid_s6       = {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_arlen_s6      = {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_arsize_s6     = {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_arburst_s6    = {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_arlock_s6     = {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_arcache_s6    = {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_arprot_s6     = {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_arsideband_s6 = {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Data Channel 6
  assign mon_sp_rready_s6    = 1'b0;  
  assign mon_sp_rvalid_s6    = 1'b0;
  assign mon_sp_rid_s6       = {`VIP_RID_PORT_WIDTH{1'b0}};
  assign mon_sp_rdata_s6     = {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_rlast_s6     = 1'b0;
  assign mon_sp_rresp_s6     = {`VIP_RRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_rsideband_s6 = {`VIP_SIDE_PORT_WIDTH{1'b0}}; 

  // Write Address Channel 7
  assign mon_sp_awvalid_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? awvalid_s7 :  1'b0;
  assign mon_sp_awready_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? axi_awready_m7 :  1'b0;
  assign mon_sp_awaddr_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_ADDR_PORT_WIDTH{1'b0}}, awaddr_s7}   : {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_awid_s7       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_AID_PORT_WIDTH{1'b0}}, awid_s7}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_awlen_s7      = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_ALEN_PORT_WIDTH{1'b0}}, awlen_s7}    : {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_awsize_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, awsize_s7}  : {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_awburst_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_ABURST_PORT_WIDTH{1'b0}}, awburst_s7}: {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_awlock_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, awlock_s7}  : {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_awcache_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, awcache_s7}: {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_awprot_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_APROT_PORT_WIDTH{1'b0}}, awprot_s7}  : {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_awsideband_s7 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7 && `X2X_HAS_AWSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, awsideband_s7}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Data Channel 7
  assign mon_sp_wvalid_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? wvalid_s7 :  1'b0;
  assign mon_sp_wready_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7)  ? axi_wready_m7 :  1'b0;
  assign mon_sp_wid_s7       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_WID_PORT_WIDTH{1'b0}}, wid_s7}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_wdata_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_WDATA_PORT_WIDTH{1'b0}}, wdata_s7}  : {`VIP_WDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_wstrb_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? {{`VIP_WSTRB_PORT_WIDTH{1'b0}}, wstrb_s7}  : {`VIP_WSTRB_PORT_WIDTH{1'b0}};
  assign mon_sp_wlast_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? wlast_s7 :  1'b0;
  assign mon_sp_wsideband_s7 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7 && `X2X_HAS_WSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, wsideband_s7}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Response Channel 7
  assign mon_sp_bvalid_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? axi_bvalid_m7 : 1'b0;
  assign mon_sp_bready_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? bready_s7     : 1'b0;
  assign mon_sp_bid_s7       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? axi_bid_m7    : {`VIP_BID_PORT_WIDTH{1'b0}};
  assign mon_sp_bresp_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7) ? axi_bresp_m7  : {`VIP_BRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_bsideband_s7 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 7 && `X2X_HAS_BSB) ? axi_bsideband_m7  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Address Channel 7
  assign mon_sp_arvalid_s7    = 1'b0;
  assign mon_sp_araddr_s7     = {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_arid_s7       = {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_arlen_s7      = {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_arsize_s7     = {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_arburst_s7    = {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_arlock_s7     = {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_arcache_s7    = {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_arprot_s7     = {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_arsideband_s7 = {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Data Channel 7
  assign mon_sp_rready_s7    = 1'b0;  
  assign mon_sp_rvalid_s7    = 1'b0;
  assign mon_sp_rid_s7       = {`VIP_RID_PORT_WIDTH{1'b0}};
  assign mon_sp_rdata_s7     = {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_rlast_s7     = 1'b0;
  assign mon_sp_rresp_s7     = {`VIP_RRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_rsideband_s7 = {`VIP_SIDE_PORT_WIDTH{1'b0}}; 

  // Write Address Channel 8
  assign mon_sp_awvalid_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? awvalid_s8 :  1'b0;
  assign mon_sp_awready_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? axi_awready_m8 :  1'b0;
  assign mon_sp_awaddr_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_ADDR_PORT_WIDTH{1'b0}}, awaddr_s8}   : {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_awid_s8       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_AID_PORT_WIDTH{1'b0}}, awid_s8}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_awlen_s8      = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_ALEN_PORT_WIDTH{1'b0}}, awlen_s8}    : {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_awsize_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_ASIZE_PORT_WIDTH{1'b0}}, awsize_s8}  : {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_awburst_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_ABURST_PORT_WIDTH{1'b0}}, awburst_s8}: {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_awlock_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_ALOCK_PORT_WIDTH{1'b0}}, awlock_s8}  : {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_awcache_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_ACACHE_PORT_WIDTH{1'b0}}, awcache_s8}: {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_awprot_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_APROT_PORT_WIDTH{1'b0}}, awprot_s8}  : {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_awsideband_s8 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8 && `X2X_HAS_AWSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, awsideband_s8}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Data Channel 8
  assign mon_sp_wvalid_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? wvalid_s8 :  1'b0;
  assign mon_sp_wready_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8)  ? axi_wready_m8 :  1'b0;
  assign mon_sp_wid_s8       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_WID_PORT_WIDTH{1'b0}}, wid_s8}      : {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_wdata_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_WDATA_PORT_WIDTH{1'b0}}, wdata_s8}  : {`VIP_WDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_wstrb_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? {{`VIP_WSTRB_PORT_WIDTH{1'b0}}, wstrb_s8}  : {`VIP_WSTRB_PORT_WIDTH{1'b0}};
  assign mon_sp_wlast_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? wlast_s8 :  1'b0;
  assign mon_sp_wsideband_s8 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8 && `X2X_HAS_WSB) ? {{`VIP_SIDE_PORT_WIDTH{1'b0}}, wsideband_s8}  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Write Response Channel 8
  assign mon_sp_bvalid_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? axi_bvalid_m8 : 1'b0;
  assign mon_sp_bready_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? bready_s8     : 1'b0;
  assign mon_sp_bid_s8       = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? axi_bid_m8    : {`VIP_BID_PORT_WIDTH{1'b0}};
  assign mon_sp_bresp_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8) ? axi_bresp_m8  : {`VIP_BRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_bsideband_s8 = (`X2X_HAS_WI_FAN_OUT && `X2X_WID >= 8 && `X2X_HAS_BSB) ? axi_bsideband_m8  : {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Address Channel 8
  assign mon_sp_arvalid_s8    = 1'b0;
  assign mon_sp_araddr_s8     = {`VIP_ADDR_PORT_WIDTH{1'b0}};
  assign mon_sp_arid_s8       = {`VIP_AID_PORT_WIDTH{1'b0}};
  assign mon_sp_arlen_s8      = {`VIP_ALEN_PORT_WIDTH{1'b0}};
  assign mon_sp_arsize_s8     = {`VIP_ASIZE_PORT_WIDTH{1'b0}};
  assign mon_sp_arburst_s8    = {`VIP_ABURST_PORT_WIDTH{1'b0}};
  assign mon_sp_arlock_s8     = {`VIP_ALOCK_PORT_WIDTH{1'b0}};
  assign mon_sp_arcache_s8    = {`VIP_ACACHE_PORT_WIDTH{1'b0}};
  assign mon_sp_arprot_s8     = {`VIP_APROT_PORT_WIDTH{1'b0}};
  assign mon_sp_arsideband_s8 = {`VIP_SIDE_PORT_WIDTH{1'b0}};

  // Read Data Channel 8
  assign mon_sp_rready_s8    = 1'b0;  
  assign mon_sp_rvalid_s8    = 1'b0;
  assign mon_sp_rid_s8       = {`VIP_RID_PORT_WIDTH{1'b0}};
  assign mon_sp_rdata_s8     = {`VIP_RDATA_PORT_WIDTH{1'b0}};
  assign mon_sp_rlast_s8     = 1'b0;
  assign mon_sp_rresp_s8     = {`VIP_RRESP_PORT_WIDTH{1'b0}};
  assign mon_sp_rsideband_s8 = {`VIP_SIDE_PORT_WIDTH{1'b0}}; 


  // Write Address Channel 1
  assign vip_sp_awvalid_s1    = (`X2X_HAS_WI_FAN_OUT) ? axi_awvalid_s1    : mon_sp_awvalid_s1;
  assign vip_sp_awaddr_s1     = (`X2X_HAS_WI_FAN_OUT) ? axi_awaddr_s1     : mon_sp_awaddr_s1;
  assign vip_sp_awid_s1       = (`X2X_HAS_WI_FAN_OUT) ? axi_awid_s1       : mon_sp_awid_s1;
  assign vip_sp_awlen_s1      = (`X2X_HAS_WI_FAN_OUT) ? axi_awlen_s1      : mon_sp_awlen_s1;
  assign vip_sp_awsize_s1     = (`X2X_HAS_WI_FAN_OUT) ? axi_awsize_s1     : mon_sp_awsize_s1;
  assign vip_sp_awburst_s1    = (`X2X_HAS_WI_FAN_OUT) ? axi_awburst_s1    : mon_sp_awburst_s1;
  assign vip_sp_awlock_s1     = (`X2X_HAS_WI_FAN_OUT) ? axi_awlock_s1     : mon_sp_awlock_s1;
  assign vip_sp_awcache_s1    = (`X2X_HAS_WI_FAN_OUT) ? axi_awcache_s1    : mon_sp_awcache_s1;
  assign vip_sp_awprot_s1     = (`X2X_HAS_WI_FAN_OUT) ? axi_awprot_s1     : mon_sp_awprot_s1;
  assign vip_sp_awsideband_s1 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_AWSB) ? axi_awsideband_s1 : mon_sp_awsideband_s1;

  // Write Data Channel 1
  assign vip_sp_wvalid_s1    = (`X2X_HAS_WI_FAN_OUT) ? axi_wvalid_s1    : mon_sp_wvalid_s1;
  assign vip_sp_wid_s1       = (`X2X_HAS_WI_FAN_OUT) ? axi_wid_s1       : mon_sp_wid_s1;
  assign vip_sp_wdata_s1     = (`X2X_HAS_WI_FAN_OUT) ? axi_wdata_s1     : mon_sp_wdata_s1;
  assign vip_sp_wstrb_s1     = (`X2X_HAS_WI_FAN_OUT) ? axi_wstrb_s1     : mon_sp_wstrb_s1;
  assign vip_sp_wlast_s1     = (`X2X_HAS_WI_FAN_OUT) ? axi_wlast_s1     : mon_sp_wlast_s1;
  assign vip_sp_wsideband_s1 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_WSB) ? axi_wsideband_s1 : mon_sp_wsideband_s1;

  // Write Response Channel 1
  assign vip_sp_bready_s1    = (`X2X_HAS_WI_FAN_OUT) ? axi_bready_s1    : mon_sp_bready_s1;

  // Read Address Channel 1
  assign vip_sp_arvalid_s1    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arvalid_s1    : mon_sp_arvalid_s1;
  assign vip_sp_araddr_s1     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_araddr_s1     : mon_sp_araddr_s1;
  assign vip_sp_arid_s1       = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arid_s1       : mon_sp_arid_s1;
  assign vip_sp_arlen_s1      = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlen_s1      : mon_sp_arlen_s1;
  assign vip_sp_arsize_s1     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arsize_s1     : mon_sp_arsize_s1;
  assign vip_sp_arburst_s1    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arburst_s1    : mon_sp_arburst_s1;
  assign vip_sp_arlock_s1     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlock_s1     : mon_sp_arlock_s1;
  assign vip_sp_arcache_s1    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arcache_s1    : mon_sp_arcache_s1;
  assign vip_sp_arprot_s1     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arprot_s1     : mon_sp_arprot_s1;
  assign vip_sp_arsideband_s1 = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? axi_arsideband_s1 : mon_sp_arsideband_s1;

  // Read Data Channel 1
  assign  vip_sp_rready_s1    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_rready_s1     : mon_sp_rready_s1;


  // Write Address Channel 2
  assign vip_sp_awvalid_s2    = (`X2X_HAS_WI_FAN_OUT) ? axi_awvalid_s2    : mon_sp_awvalid_s2;
  assign vip_sp_awaddr_s2     = (`X2X_HAS_WI_FAN_OUT) ? axi_awaddr_s2     : mon_sp_awaddr_s2;
  assign vip_sp_awid_s2       = (`X2X_HAS_WI_FAN_OUT) ? axi_awid_s2       : mon_sp_awid_s2;
  assign vip_sp_awlen_s2      = (`X2X_HAS_WI_FAN_OUT) ? axi_awlen_s2      : mon_sp_awlen_s2;
  assign vip_sp_awsize_s2     = (`X2X_HAS_WI_FAN_OUT) ? axi_awsize_s2     : mon_sp_awsize_s2;
  assign vip_sp_awburst_s2    = (`X2X_HAS_WI_FAN_OUT) ? axi_awburst_s2    : mon_sp_awburst_s2;
  assign vip_sp_awlock_s2     = (`X2X_HAS_WI_FAN_OUT) ? axi_awlock_s2     : mon_sp_awlock_s2;
  assign vip_sp_awcache_s2    = (`X2X_HAS_WI_FAN_OUT) ? axi_awcache_s2    : mon_sp_awcache_s2;
  assign vip_sp_awprot_s2     = (`X2X_HAS_WI_FAN_OUT) ? axi_awprot_s2     : mon_sp_awprot_s2;
  assign vip_sp_awsideband_s2 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_AWSB) ? axi_awsideband_s2 : mon_sp_awsideband_s2;

  // Write Data Channel 2
  assign vip_sp_wvalid_s2    = (`X2X_HAS_WI_FAN_OUT) ? axi_wvalid_s2    : mon_sp_wvalid_s2;
  assign vip_sp_wid_s2       = (`X2X_HAS_WI_FAN_OUT) ? axi_wid_s2       : mon_sp_wid_s2;
  assign vip_sp_wdata_s2     = (`X2X_HAS_WI_FAN_OUT) ? axi_wdata_s2     : mon_sp_wdata_s2;
  assign vip_sp_wstrb_s2     = (`X2X_HAS_WI_FAN_OUT) ? axi_wstrb_s2     : mon_sp_wstrb_s2;
  assign vip_sp_wlast_s2     = (`X2X_HAS_WI_FAN_OUT) ? axi_wlast_s2     : mon_sp_wlast_s2;
  assign vip_sp_wsideband_s2 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_WSB) ? axi_wsideband_s2 : mon_sp_wsideband_s2;

  // Write Response Channel 2
  assign vip_sp_bready_s2    = (`X2X_HAS_WI_FAN_OUT) ? axi_bready_s2    : mon_sp_bready_s2;

  // Read Address Channel 2
  assign vip_sp_arvalid_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arvalid_s2    : mon_sp_arvalid_s2;
  assign vip_sp_araddr_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_araddr_s2     : mon_sp_araddr_s2;
  assign vip_sp_arid_s2       = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arid_s2       : mon_sp_arid_s2;
  assign vip_sp_arlen_s2      = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlen_s2      : mon_sp_arlen_s2;
  assign vip_sp_arsize_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arsize_s2     : mon_sp_arsize_s2;
  assign vip_sp_arburst_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arburst_s2    : mon_sp_arburst_s2;
  assign vip_sp_arlock_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlock_s2     : mon_sp_arlock_s2;
  assign vip_sp_arcache_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arcache_s2    : mon_sp_arcache_s2;
  assign vip_sp_arprot_s2     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arprot_s2     : mon_sp_arprot_s2;
  assign vip_sp_arsideband_s2 = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? axi_arsideband_s2 : mon_sp_arsideband_s2;

  // Read Data Channel 2
  assign  vip_sp_rready_s2    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_rready_s2     : mon_sp_rready_s2;


  // Write Address Channel 3
  assign vip_sp_awvalid_s3    = (`X2X_HAS_WI_FAN_OUT) ? axi_awvalid_s3    : mon_sp_awvalid_s3;
  assign vip_sp_awaddr_s3     = (`X2X_HAS_WI_FAN_OUT) ? axi_awaddr_s3     : mon_sp_awaddr_s3;
  assign vip_sp_awid_s3       = (`X2X_HAS_WI_FAN_OUT) ? axi_awid_s3       : mon_sp_awid_s3;
  assign vip_sp_awlen_s3      = (`X2X_HAS_WI_FAN_OUT) ? axi_awlen_s3      : mon_sp_awlen_s3;
  assign vip_sp_awsize_s3     = (`X2X_HAS_WI_FAN_OUT) ? axi_awsize_s3     : mon_sp_awsize_s3;
  assign vip_sp_awburst_s3    = (`X2X_HAS_WI_FAN_OUT) ? axi_awburst_s3    : mon_sp_awburst_s3;
  assign vip_sp_awlock_s3     = (`X2X_HAS_WI_FAN_OUT) ? axi_awlock_s3     : mon_sp_awlock_s3;
  assign vip_sp_awcache_s3    = (`X2X_HAS_WI_FAN_OUT) ? axi_awcache_s3    : mon_sp_awcache_s3;
  assign vip_sp_awprot_s3     = (`X2X_HAS_WI_FAN_OUT) ? axi_awprot_s3     : mon_sp_awprot_s3;
  assign vip_sp_awsideband_s3 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_AWSB) ? axi_awsideband_s3 : mon_sp_awsideband_s3;

  // Write Data Channel 3
  assign vip_sp_wvalid_s3    = (`X2X_HAS_WI_FAN_OUT) ? axi_wvalid_s3    : mon_sp_wvalid_s3;
  assign vip_sp_wid_s3       = (`X2X_HAS_WI_FAN_OUT) ? axi_wid_s3       : mon_sp_wid_s3;
  assign vip_sp_wdata_s3     = (`X2X_HAS_WI_FAN_OUT) ? axi_wdata_s3     : mon_sp_wdata_s3;
  assign vip_sp_wstrb_s3     = (`X2X_HAS_WI_FAN_OUT) ? axi_wstrb_s3     : mon_sp_wstrb_s3;
  assign vip_sp_wlast_s3     = (`X2X_HAS_WI_FAN_OUT) ? axi_wlast_s3     : mon_sp_wlast_s3;
  assign vip_sp_wsideband_s3 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_WSB) ? axi_wsideband_s3 : mon_sp_wsideband_s3;

  // Write Response Channel 3
  assign vip_sp_bready_s3    = (`X2X_HAS_WI_FAN_OUT) ? axi_bready_s3    : mon_sp_bready_s3;

  // Read Address Channel 3
  assign vip_sp_arvalid_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arvalid_s3    : mon_sp_arvalid_s3;
  assign vip_sp_araddr_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_araddr_s3     : mon_sp_araddr_s3;
  assign vip_sp_arid_s3       = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arid_s3       : mon_sp_arid_s3;
  assign vip_sp_arlen_s3      = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlen_s3      : mon_sp_arlen_s3;
  assign vip_sp_arsize_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arsize_s3     : mon_sp_arsize_s3;
  assign vip_sp_arburst_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arburst_s3    : mon_sp_arburst_s3;
  assign vip_sp_arlock_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlock_s3     : mon_sp_arlock_s3;
  assign vip_sp_arcache_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arcache_s3    : mon_sp_arcache_s3;
  assign vip_sp_arprot_s3     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arprot_s3     : mon_sp_arprot_s3;
  assign vip_sp_arsideband_s3 = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? axi_arsideband_s3 : mon_sp_arsideband_s3;

  // Read Data Channel 3
  assign  vip_sp_rready_s3    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_rready_s3     : mon_sp_rready_s3;


  // Write Address Channel 4
  assign vip_sp_awvalid_s4    = (`X2X_HAS_WI_FAN_OUT) ? axi_awvalid_s4    : mon_sp_awvalid_s4;
  assign vip_sp_awaddr_s4     = (`X2X_HAS_WI_FAN_OUT) ? axi_awaddr_s4     : mon_sp_awaddr_s4;
  assign vip_sp_awid_s4       = (`X2X_HAS_WI_FAN_OUT) ? axi_awid_s4       : mon_sp_awid_s4;
  assign vip_sp_awlen_s4      = (`X2X_HAS_WI_FAN_OUT) ? axi_awlen_s4      : mon_sp_awlen_s4;
  assign vip_sp_awsize_s4     = (`X2X_HAS_WI_FAN_OUT) ? axi_awsize_s4     : mon_sp_awsize_s4;
  assign vip_sp_awburst_s4    = (`X2X_HAS_WI_FAN_OUT) ? axi_awburst_s4    : mon_sp_awburst_s4;
  assign vip_sp_awlock_s4     = (`X2X_HAS_WI_FAN_OUT) ? axi_awlock_s4     : mon_sp_awlock_s4;
  assign vip_sp_awcache_s4    = (`X2X_HAS_WI_FAN_OUT) ? axi_awcache_s4    : mon_sp_awcache_s4;
  assign vip_sp_awprot_s4     = (`X2X_HAS_WI_FAN_OUT) ? axi_awprot_s4     : mon_sp_awprot_s4;
  assign vip_sp_awsideband_s4 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_AWSB) ? axi_awsideband_s4 : mon_sp_awsideband_s4;

  // Write Data Channel 4
  assign vip_sp_wvalid_s4    = (`X2X_HAS_WI_FAN_OUT) ? axi_wvalid_s4    : mon_sp_wvalid_s4;
  assign vip_sp_wid_s4       = (`X2X_HAS_WI_FAN_OUT) ? axi_wid_s4       : mon_sp_wid_s4;
  assign vip_sp_wdata_s4     = (`X2X_HAS_WI_FAN_OUT) ? axi_wdata_s4     : mon_sp_wdata_s4;
  assign vip_sp_wstrb_s4     = (`X2X_HAS_WI_FAN_OUT) ? axi_wstrb_s4     : mon_sp_wstrb_s4;
  assign vip_sp_wlast_s4     = (`X2X_HAS_WI_FAN_OUT) ? axi_wlast_s4     : mon_sp_wlast_s4;
  assign vip_sp_wsideband_s4 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_WSB) ? axi_wsideband_s4 : mon_sp_wsideband_s4;

  // Write Response Channel 4
  assign vip_sp_bready_s4    = (`X2X_HAS_WI_FAN_OUT) ? axi_bready_s4    : mon_sp_bready_s4;

  // Read Address Channel 4
  assign vip_sp_arvalid_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arvalid_s4    : mon_sp_arvalid_s4;
  assign vip_sp_araddr_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_araddr_s4     : mon_sp_araddr_s4;
  assign vip_sp_arid_s4       = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arid_s4       : mon_sp_arid_s4;
  assign vip_sp_arlen_s4      = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlen_s4      : mon_sp_arlen_s4;
  assign vip_sp_arsize_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arsize_s4     : mon_sp_arsize_s4;
  assign vip_sp_arburst_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arburst_s4    : mon_sp_arburst_s4;
  assign vip_sp_arlock_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlock_s4     : mon_sp_arlock_s4;
  assign vip_sp_arcache_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arcache_s4    : mon_sp_arcache_s4;
  assign vip_sp_arprot_s4     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arprot_s4     : mon_sp_arprot_s4;
  assign vip_sp_arsideband_s4 = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? axi_arsideband_s4 : mon_sp_arsideband_s4;

  // Read Data Channel 4
  assign  vip_sp_rready_s4    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_rready_s4     : mon_sp_rready_s4;


  // Write Address Channel 5
  assign vip_sp_awvalid_s5    = (`X2X_HAS_WI_FAN_OUT) ? axi_awvalid_s5    : mon_sp_awvalid_s5;
  assign vip_sp_awaddr_s5     = (`X2X_HAS_WI_FAN_OUT) ? axi_awaddr_s5     : mon_sp_awaddr_s5;
  assign vip_sp_awid_s5       = (`X2X_HAS_WI_FAN_OUT) ? axi_awid_s5       : mon_sp_awid_s5;
  assign vip_sp_awlen_s5      = (`X2X_HAS_WI_FAN_OUT) ? axi_awlen_s5      : mon_sp_awlen_s5;
  assign vip_sp_awsize_s5     = (`X2X_HAS_WI_FAN_OUT) ? axi_awsize_s5     : mon_sp_awsize_s5;
  assign vip_sp_awburst_s5    = (`X2X_HAS_WI_FAN_OUT) ? axi_awburst_s5    : mon_sp_awburst_s5;
  assign vip_sp_awlock_s5     = (`X2X_HAS_WI_FAN_OUT) ? axi_awlock_s5     : mon_sp_awlock_s5;
  assign vip_sp_awcache_s5    = (`X2X_HAS_WI_FAN_OUT) ? axi_awcache_s5    : mon_sp_awcache_s5;
  assign vip_sp_awprot_s5     = (`X2X_HAS_WI_FAN_OUT) ? axi_awprot_s5     : mon_sp_awprot_s5;
  assign vip_sp_awsideband_s5 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_AWSB) ? axi_awsideband_s5 : mon_sp_awsideband_s5;

  // Write Data Channel 5
  assign vip_sp_wvalid_s5    = (`X2X_HAS_WI_FAN_OUT) ? axi_wvalid_s5    : mon_sp_wvalid_s5;
  assign vip_sp_wid_s5       = (`X2X_HAS_WI_FAN_OUT) ? axi_wid_s5       : mon_sp_wid_s5;
  assign vip_sp_wdata_s5     = (`X2X_HAS_WI_FAN_OUT) ? axi_wdata_s5     : mon_sp_wdata_s5;
  assign vip_sp_wstrb_s5     = (`X2X_HAS_WI_FAN_OUT) ? axi_wstrb_s5     : mon_sp_wstrb_s5;
  assign vip_sp_wlast_s5     = (`X2X_HAS_WI_FAN_OUT) ? axi_wlast_s5     : mon_sp_wlast_s5;
  assign vip_sp_wsideband_s5 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_WSB) ? axi_wsideband_s5 : mon_sp_wsideband_s5;

  // Write Response Channel 5
  assign vip_sp_bready_s5    = (`X2X_HAS_WI_FAN_OUT) ? axi_bready_s5    : mon_sp_bready_s5;

  // Read Address Channel 5
  assign vip_sp_arvalid_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arvalid_s5    : mon_sp_arvalid_s5;
  assign vip_sp_araddr_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_araddr_s5     : mon_sp_araddr_s5;
  assign vip_sp_arid_s5       = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arid_s5       : mon_sp_arid_s5;
  assign vip_sp_arlen_s5      = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlen_s5      : mon_sp_arlen_s5;
  assign vip_sp_arsize_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arsize_s5     : mon_sp_arsize_s5;
  assign vip_sp_arburst_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arburst_s5    : mon_sp_arburst_s5;
  assign vip_sp_arlock_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlock_s5     : mon_sp_arlock_s5;
  assign vip_sp_arcache_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arcache_s5    : mon_sp_arcache_s5;
  assign vip_sp_arprot_s5     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arprot_s5     : mon_sp_arprot_s5;
  assign vip_sp_arsideband_s5 = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? axi_arsideband_s5 : mon_sp_arsideband_s5;

  // Read Data Channel 5
  assign  vip_sp_rready_s5    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_rready_s5     : mon_sp_rready_s5;


  // Write Address Channel 6
  assign vip_sp_awvalid_s6    = (`X2X_HAS_WI_FAN_OUT) ? axi_awvalid_s6    : mon_sp_awvalid_s6;
  assign vip_sp_awaddr_s6     = (`X2X_HAS_WI_FAN_OUT) ? axi_awaddr_s6     : mon_sp_awaddr_s6;
  assign vip_sp_awid_s6       = (`X2X_HAS_WI_FAN_OUT) ? axi_awid_s6       : mon_sp_awid_s6;
  assign vip_sp_awlen_s6      = (`X2X_HAS_WI_FAN_OUT) ? axi_awlen_s6      : mon_sp_awlen_s6;
  assign vip_sp_awsize_s6     = (`X2X_HAS_WI_FAN_OUT) ? axi_awsize_s6     : mon_sp_awsize_s6;
  assign vip_sp_awburst_s6    = (`X2X_HAS_WI_FAN_OUT) ? axi_awburst_s6    : mon_sp_awburst_s6;
  assign vip_sp_awlock_s6     = (`X2X_HAS_WI_FAN_OUT) ? axi_awlock_s6     : mon_sp_awlock_s6;
  assign vip_sp_awcache_s6    = (`X2X_HAS_WI_FAN_OUT) ? axi_awcache_s6    : mon_sp_awcache_s6;
  assign vip_sp_awprot_s6     = (`X2X_HAS_WI_FAN_OUT) ? axi_awprot_s6     : mon_sp_awprot_s6;
  assign vip_sp_awsideband_s6 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_AWSB) ? axi_awsideband_s6 : mon_sp_awsideband_s6;

  // Write Data Channel 6
  assign vip_sp_wvalid_s6    = (`X2X_HAS_WI_FAN_OUT) ? axi_wvalid_s6    : mon_sp_wvalid_s6;
  assign vip_sp_wid_s6       = (`X2X_HAS_WI_FAN_OUT) ? axi_wid_s6       : mon_sp_wid_s6;
  assign vip_sp_wdata_s6     = (`X2X_HAS_WI_FAN_OUT) ? axi_wdata_s6     : mon_sp_wdata_s6;
  assign vip_sp_wstrb_s6     = (`X2X_HAS_WI_FAN_OUT) ? axi_wstrb_s6     : mon_sp_wstrb_s6;
  assign vip_sp_wlast_s6     = (`X2X_HAS_WI_FAN_OUT) ? axi_wlast_s6     : mon_sp_wlast_s6;
  assign vip_sp_wsideband_s6 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_WSB) ? axi_wsideband_s6 : mon_sp_wsideband_s6;

  // Write Response Channel 6
  assign vip_sp_bready_s6    = (`X2X_HAS_WI_FAN_OUT) ? axi_bready_s6    : mon_sp_bready_s6;

  // Read Address Channel 6
  assign vip_sp_arvalid_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arvalid_s6    : mon_sp_arvalid_s6;
  assign vip_sp_araddr_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_araddr_s6     : mon_sp_araddr_s6;
  assign vip_sp_arid_s6       = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arid_s6       : mon_sp_arid_s6;
  assign vip_sp_arlen_s6      = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlen_s6      : mon_sp_arlen_s6;
  assign vip_sp_arsize_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arsize_s6     : mon_sp_arsize_s6;
  assign vip_sp_arburst_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arburst_s6    : mon_sp_arburst_s6;
  assign vip_sp_arlock_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlock_s6     : mon_sp_arlock_s6;
  assign vip_sp_arcache_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arcache_s6    : mon_sp_arcache_s6;
  assign vip_sp_arprot_s6     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arprot_s6     : mon_sp_arprot_s6;
  assign vip_sp_arsideband_s6 = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? axi_arsideband_s6 : mon_sp_arsideband_s6;

  // Read Data Channel 6
  assign  vip_sp_rready_s6    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_rready_s6     : mon_sp_rready_s6;


  // Write Address Channel 7
  assign vip_sp_awvalid_s7    = (`X2X_HAS_WI_FAN_OUT) ? axi_awvalid_s7    : mon_sp_awvalid_s7;
  assign vip_sp_awaddr_s7     = (`X2X_HAS_WI_FAN_OUT) ? axi_awaddr_s7     : mon_sp_awaddr_s7;
  assign vip_sp_awid_s7       = (`X2X_HAS_WI_FAN_OUT) ? axi_awid_s7       : mon_sp_awid_s7;
  assign vip_sp_awlen_s7      = (`X2X_HAS_WI_FAN_OUT) ? axi_awlen_s7      : mon_sp_awlen_s7;
  assign vip_sp_awsize_s7     = (`X2X_HAS_WI_FAN_OUT) ? axi_awsize_s7     : mon_sp_awsize_s7;
  assign vip_sp_awburst_s7    = (`X2X_HAS_WI_FAN_OUT) ? axi_awburst_s7    : mon_sp_awburst_s7;
  assign vip_sp_awlock_s7     = (`X2X_HAS_WI_FAN_OUT) ? axi_awlock_s7     : mon_sp_awlock_s7;
  assign vip_sp_awcache_s7    = (`X2X_HAS_WI_FAN_OUT) ? axi_awcache_s7    : mon_sp_awcache_s7;
  assign vip_sp_awprot_s7     = (`X2X_HAS_WI_FAN_OUT) ? axi_awprot_s7     : mon_sp_awprot_s7;
  assign vip_sp_awsideband_s7 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_AWSB) ? axi_awsideband_s7 : mon_sp_awsideband_s7;

  // Write Data Channel 7
  assign vip_sp_wvalid_s7    = (`X2X_HAS_WI_FAN_OUT) ? axi_wvalid_s7    : mon_sp_wvalid_s7;
  assign vip_sp_wid_s7       = (`X2X_HAS_WI_FAN_OUT) ? axi_wid_s7       : mon_sp_wid_s7;
  assign vip_sp_wdata_s7     = (`X2X_HAS_WI_FAN_OUT) ? axi_wdata_s7     : mon_sp_wdata_s7;
  assign vip_sp_wstrb_s7     = (`X2X_HAS_WI_FAN_OUT) ? axi_wstrb_s7     : mon_sp_wstrb_s7;
  assign vip_sp_wlast_s7     = (`X2X_HAS_WI_FAN_OUT) ? axi_wlast_s7     : mon_sp_wlast_s7;
  assign vip_sp_wsideband_s7 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_WSB) ? axi_wsideband_s7 : mon_sp_wsideband_s7;

  // Write Response Channel 7
  assign vip_sp_bready_s7    = (`X2X_HAS_WI_FAN_OUT) ? axi_bready_s7    : mon_sp_bready_s7;

  // Read Address Channel 7
  assign vip_sp_arvalid_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arvalid_s7    : mon_sp_arvalid_s7;
  assign vip_sp_araddr_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_araddr_s7     : mon_sp_araddr_s7;
  assign vip_sp_arid_s7       = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arid_s7       : mon_sp_arid_s7;
  assign vip_sp_arlen_s7      = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlen_s7      : mon_sp_arlen_s7;
  assign vip_sp_arsize_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arsize_s7     : mon_sp_arsize_s7;
  assign vip_sp_arburst_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arburst_s7    : mon_sp_arburst_s7;
  assign vip_sp_arlock_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlock_s7     : mon_sp_arlock_s7;
  assign vip_sp_arcache_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arcache_s7    : mon_sp_arcache_s7;
  assign vip_sp_arprot_s7     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arprot_s7     : mon_sp_arprot_s7;
  assign vip_sp_arsideband_s7 = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? axi_arsideband_s7 : mon_sp_arsideband_s7;

  // Read Data Channel 7
  assign  vip_sp_rready_s7    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_rready_s7     : mon_sp_rready_s7;


  // Write Address Channel 8
  assign vip_sp_awvalid_s8    = (`X2X_HAS_WI_FAN_OUT) ? axi_awvalid_s8    : mon_sp_awvalid_s8;
  assign vip_sp_awaddr_s8     = (`X2X_HAS_WI_FAN_OUT) ? axi_awaddr_s8     : mon_sp_awaddr_s8;
  assign vip_sp_awid_s8       = (`X2X_HAS_WI_FAN_OUT) ? axi_awid_s8       : mon_sp_awid_s8;
  assign vip_sp_awlen_s8      = (`X2X_HAS_WI_FAN_OUT) ? axi_awlen_s8      : mon_sp_awlen_s8;
  assign vip_sp_awsize_s8     = (`X2X_HAS_WI_FAN_OUT) ? axi_awsize_s8     : mon_sp_awsize_s8;
  assign vip_sp_awburst_s8    = (`X2X_HAS_WI_FAN_OUT) ? axi_awburst_s8    : mon_sp_awburst_s8;
  assign vip_sp_awlock_s8     = (`X2X_HAS_WI_FAN_OUT) ? axi_awlock_s8     : mon_sp_awlock_s8;
  assign vip_sp_awcache_s8    = (`X2X_HAS_WI_FAN_OUT) ? axi_awcache_s8    : mon_sp_awcache_s8;
  assign vip_sp_awprot_s8     = (`X2X_HAS_WI_FAN_OUT) ? axi_awprot_s8     : mon_sp_awprot_s8;
  assign vip_sp_awsideband_s8 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_AWSB) ? axi_awsideband_s8 : mon_sp_awsideband_s8;

  // Write Data Channel 8
  assign vip_sp_wvalid_s8    = (`X2X_HAS_WI_FAN_OUT) ? axi_wvalid_s8    : mon_sp_wvalid_s8;
  assign vip_sp_wid_s8       = (`X2X_HAS_WI_FAN_OUT) ? axi_wid_s8       : mon_sp_wid_s8;
  assign vip_sp_wdata_s8     = (`X2X_HAS_WI_FAN_OUT) ? axi_wdata_s8     : mon_sp_wdata_s8;
  assign vip_sp_wstrb_s8     = (`X2X_HAS_WI_FAN_OUT) ? axi_wstrb_s8     : mon_sp_wstrb_s8;
  assign vip_sp_wlast_s8     = (`X2X_HAS_WI_FAN_OUT) ? axi_wlast_s8     : mon_sp_wlast_s8;
  assign vip_sp_wsideband_s8 = (`X2X_HAS_WI_FAN_OUT && `X2X_HAS_WSB) ? axi_wsideband_s8 : mon_sp_wsideband_s8;

  // Write Response Channel 8
  assign vip_sp_bready_s8    = (`X2X_HAS_WI_FAN_OUT) ? axi_bready_s8    : mon_sp_bready_s8;

  // Read Address Channel 8
  assign vip_sp_arvalid_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arvalid_s8    : mon_sp_arvalid_s8;
  assign vip_sp_araddr_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_araddr_s8     : mon_sp_araddr_s8;
  assign vip_sp_arid_s8       = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arid_s8       : mon_sp_arid_s8;
  assign vip_sp_arlen_s8      = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlen_s8      : mon_sp_arlen_s8;
  assign vip_sp_arsize_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arsize_s8     : mon_sp_arsize_s8;
  assign vip_sp_arburst_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arburst_s8    : mon_sp_arburst_s8;
  assign vip_sp_arlock_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arlock_s8     : mon_sp_arlock_s8;
  assign vip_sp_arcache_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arcache_s8    : mon_sp_arcache_s8;
  assign vip_sp_arprot_s8     = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_arprot_s8     : mon_sp_arprot_s8;
  assign vip_sp_arsideband_s8 = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0 && `X2X_HAS_ARSB) ? axi_arsideband_s8 : mon_sp_arsideband_s8;

  // Read Data Channel 8
  assign  vip_sp_rready_s8    = (`X2X_HAS_WI_FAN_OUT && `X2X_CH_SEL == 0) ? axi_rready_s8     : mon_sp_rready_s8;

`ifdef X2X_SP2
// AXI IIP Instantiation
DW_axi U_DW_axi(
                                .aclk (aclk_s)
                                ,.aresetn (aresetn_s)
                                ,.awid_m1    (mon_sp_awid_s1[`AXI_MIDW-1:0])
                                ,.awaddr_m1  (mon_sp_awaddr_s1[`AXI_AW-1:0])
                                ,.awlen_m1   (mon_sp_awlen_s1[`AXI_BLW-1:0])
                                ,.awsize_m1  (mon_sp_awsize_s1)
                                ,.awburst_m1 (mon_sp_awburst_s1)
                                ,.awlock_m1  (mon_sp_awlock_s1)
                                ,.awcache_m1 (mon_sp_awcache_s1)
                                ,.awprot_m1  (mon_sp_awprot_s1)
                                ,.awvalid_m1 (mon_sp_awvalid_s1)
                                ,.awready_m1 (axi_awready_m1)

                                ,.awsideband_m1 (mon_sp_awsideband_s1[`AXI_AW_SBW-1:0])

                                ,.wid_m1    (mon_sp_wid_s1[`AXI_MIDW-1:0])
                                ,.wdata_m1  (mon_sp_wdata_s1[`AXI_DW-1:0])
                                ,.wstrb_m1  (mon_sp_wstrb_s1[`AXI_SW-1:0])
                                ,.wlast_m1  (mon_sp_wlast_s1)
                                ,.wvalid_m1 (mon_sp_wvalid_s1)
                                ,.wready_m1 (axi_wready_m1)
                                
                                ,.wsideband_m1 (mon_sp_wsideband_s1[`AXI_W_SBW-1:0])
                                
                                ,.bid_m1    (axi_bid_m1[`AXI_MIDW-1:0])
                                ,.bresp_m1  (axi_bresp_m1)
                                ,.bvalid_m1 (axi_bvalid_m1)
                                ,.bready_m1 (mon_sp_bready_s1)
  
                                ,.bsideband_m1 (axi_bsideband_m1[`AXI_B_SBW-1:0])
 
                                ,.arid_m1    (mon_sp_arid_s1[`AXI_MIDW-1:0])
                                ,.araddr_m1  (mon_sp_araddr_s1[`AXI_AW-1:0])
                                ,.arlen_m1   (mon_sp_arlen_s1[`AXI_BLW-1:0])
                                ,.arsize_m1  (mon_sp_arsize_s1)
                                ,.arburst_m1 (mon_sp_arburst_s1)
                                ,.arlock_m1  (mon_sp_arlock_s1)
                                ,.arcache_m1 (mon_sp_arcache_s1)
                                ,.arprot_m1  (mon_sp_arprot_s1)
                                ,.arvalid_m1 (mon_sp_arvalid_s1)
                                ,.arready_m1 (axi_arready_s1)

                                ,.arsideband_m1 (mon_sp_arsideband_s1[`AXI_AR_SBW-1:0])

                                ,.rid_m1    (axi_rid_m1[`AXI_MIDW-1:0])
                                ,.rdata_m1  (axi_rdata_m1[`AXI_DW-1:0])
                                ,.rresp_m1  (axi_rresp_m1)
                                ,.rlast_m1  (axi_rlast_m1)
                                ,.rvalid_m1 (axi_rvalid_m1)
                                ,.rready_m1 (mon_sp_rready_s1)

                                ,.rsideband_m1 (axi_rsideband_m1[`AXI_R_SBW-1:0])

				,.awid_s1    (axi_awid_s1[`AXI_SIDW-1:0])
                                ,.awaddr_s1  (axi_awaddr_s1[`AXI_AW-1:0])
                                ,.awlen_s1   (axi_awlen_s1[`AXI_BLW-1:0])
                                ,.awsize_s1  (axi_awsize_s1)
                                ,.awburst_s1 (axi_awburst_s1)
                                ,.awlock_s1  (axi_awlock_s1)
                                ,.awcache_s1 (axi_awcache_s1)
                                ,.awprot_s1  (axi_awprot_s1)
                                ,.awvalid_s1 (axi_awvalid_s1)
                                ,.awready_s1 (vip_sp_awready_s1)
  
                                ,.awsideband_s1 (axi_awsideband_s1[`AXI_AW_SBW-1:0])
 
                                ,.wid_s1    (axi_wid_s1[`AXI_SIDW-1:0])
                                ,.wdata_s1  (axi_wdata_s1[`AXI_DW-1:0])
                                ,.wstrb_s1  (axi_wstrb_s1[`AXI_SW-1:0])
                                ,.wlast_s1  (axi_wlast_s1)
                                ,.wvalid_s1 (axi_wvalid_s1)
                                ,.wready_s1 (vip_sp_wready_s1)

                                ,.wsideband_s1 (axi_wsideband_s1[`AXI_W_SBW-1:0])

                                ,.bid_s1    (vip_sp_bid_s1[`AXI_SIDW-1:0])
                                ,.bresp_s1  (vip_sp_bresp_s1)
                                ,.bvalid_s1 (vip_sp_bvalid_s1)
                                ,.bready_s1 (axi_bready_s1)

                                ,.bsideband_s1 (vip_sp_bsideband_s1[`AXI_B_SBW-1:0])

                                ,.arid_s1    (axi_arid_s1[`AXI_SIDW-1:0])
                                ,.araddr_s1  (axi_araddr_s1[`AXI_AW-1:0])
                                ,.arlen_s1   (axi_arlen_s1[`AXI_BLW-1:0])
                                ,.arsize_s1  (axi_arsize_s1)
                                ,.arburst_s1 (axi_arburst_s1)
                                ,.arlock_s1  (axi_arlock_s1)
                                ,.arcache_s1 (axi_arcache_s1)
                                ,.arprot_s1  (axi_arprot_s1)
                                ,.arvalid_s1 (axi_arvalid_s1)
                                ,.arready_s1 (vip_sp_arready_s1)

                                ,.arsideband_s1 (axi_arsideband_s1[`AXI_AR_SBW-1:0])

                                ,.rid_s1    (vip_sp_rid_s1[`AXI_SIDW-1:0])
                                ,.rdata_s1  (vip_sp_rdata_s1[`AXI_DW-1:0])
                                ,.rresp_s1  (vip_sp_rresp_s1)
                                ,.rvalid_s1 (vip_sp_rvalid_s1)
                                ,.rlast_s1  (vip_sp_rlast_s1)
                                ,.rready_s1 (axi_rready_s1)

                                ,.rsideband_s1 (vip_sp_rsideband_s1[`AXI_R_SBW-1:0])
                                ,.awid_m2    (mon_sp_awid_s2[`AXI_MIDW-1:0])
                                ,.awaddr_m2  (mon_sp_awaddr_s2[`AXI_AW-1:0])
                                ,.awlen_m2   (mon_sp_awlen_s2[`AXI_BLW-1:0])
                                ,.awsize_m2  (mon_sp_awsize_s2)
                                ,.awburst_m2 (mon_sp_awburst_s2)
                                ,.awlock_m2  (mon_sp_awlock_s2)
                                ,.awcache_m2 (mon_sp_awcache_s2)
                                ,.awprot_m2  (mon_sp_awprot_s2)
                                ,.awvalid_m2 (mon_sp_awvalid_s2)
                                ,.awready_m2 (axi_awready_m2)

                                ,.awsideband_m2 (mon_sp_awsideband_s2[`AXI_AW_SBW-1:0])

                                ,.wid_m2    (mon_sp_wid_s2[`AXI_MIDW-1:0])
                                ,.wdata_m2  (mon_sp_wdata_s2[`AXI_DW-1:0])
                                ,.wstrb_m2  (mon_sp_wstrb_s2[`AXI_SW-1:0])
                                ,.wlast_m2  (mon_sp_wlast_s2)
                                ,.wvalid_m2 (mon_sp_wvalid_s2)
                                ,.wready_m2 (axi_wready_m2)
                                
                                ,.wsideband_m2 (mon_sp_wsideband_s2[`AXI_W_SBW-1:0])
                                
                                ,.bid_m2    (axi_bid_m2[`AXI_MIDW-1:0])
                                ,.bresp_m2  (axi_bresp_m2)
                                ,.bvalid_m2 (axi_bvalid_m2)
                                ,.bready_m2 (mon_sp_bready_s2)
  
                                ,.bsideband_m2 (axi_bsideband_m2[`AXI_B_SBW-1:0])
 
                                ,.arid_m2    (mon_sp_arid_s2[`AXI_MIDW-1:0])
                                ,.araddr_m2  (mon_sp_araddr_s2[`AXI_AW-1:0])
                                ,.arlen_m2   (mon_sp_arlen_s2[`AXI_BLW-1:0])
                                ,.arsize_m2  (mon_sp_arsize_s2)
                                ,.arburst_m2 (mon_sp_arburst_s2)
                                ,.arlock_m2  (mon_sp_arlock_s2)
                                ,.arcache_m2 (mon_sp_arcache_s2)
                                ,.arprot_m2  (mon_sp_arprot_s2)
                                ,.arvalid_m2 (mon_sp_arvalid_s2)
                                ,.arready_m2 (axi_arready_s2)

                                ,.arsideband_m2 (mon_sp_arsideband_s2[`AXI_AR_SBW-1:0])

                                ,.rid_m2    (axi_rid_m2[`AXI_MIDW-1:0])
                                ,.rdata_m2  (axi_rdata_m2[`AXI_DW-1:0])
                                ,.rresp_m2  (axi_rresp_m2)
                                ,.rlast_m2  (axi_rlast_m2)
                                ,.rvalid_m2 (axi_rvalid_m2)
                                ,.rready_m2 (mon_sp_rready_s2)

                                ,.rsideband_m2 (axi_rsideband_m2[`AXI_R_SBW-1:0])

				,.awid_s2    (axi_awid_s2[`AXI_SIDW-1:0])
                                ,.awaddr_s2  (axi_awaddr_s2[`AXI_AW-1:0])
                                ,.awlen_s2   (axi_awlen_s2[`AXI_BLW-1:0])
                                ,.awsize_s2  (axi_awsize_s2)
                                ,.awburst_s2 (axi_awburst_s2)
                                ,.awlock_s2  (axi_awlock_s2)
                                ,.awcache_s2 (axi_awcache_s2)
                                ,.awprot_s2  (axi_awprot_s2)
                                ,.awvalid_s2 (axi_awvalid_s2)
                                ,.awready_s2 (vip_sp_awready_s2)
  
                                ,.awsideband_s2 (axi_awsideband_s2[`AXI_AW_SBW-1:0])
 
                                ,.wid_s2    (axi_wid_s2[`AXI_SIDW-1:0])
                                ,.wdata_s2  (axi_wdata_s2[`AXI_DW-1:0])
                                ,.wstrb_s2  (axi_wstrb_s2[`AXI_SW-1:0])
                                ,.wlast_s2  (axi_wlast_s2)
                                ,.wvalid_s2 (axi_wvalid_s2)
                                ,.wready_s2 (vip_sp_wready_s2)

                                ,.wsideband_s2 (axi_wsideband_s2[`AXI_W_SBW-1:0])

                                ,.bid_s2    (vip_sp_bid_s2[`AXI_SIDW-1:0])
                                ,.bresp_s2  (vip_sp_bresp_s2)
                                ,.bvalid_s2 (vip_sp_bvalid_s2)
                                ,.bready_s2 (axi_bready_s2)

                                ,.bsideband_s2 (vip_sp_bsideband_s2[`AXI_B_SBW-1:0])

                                ,.arid_s2    (axi_arid_s2[`AXI_SIDW-1:0])
                                ,.araddr_s2  (axi_araddr_s2[`AXI_AW-1:0])
                                ,.arlen_s2   (axi_arlen_s2[`AXI_BLW-1:0])
                                ,.arsize_s2  (axi_arsize_s2)
                                ,.arburst_s2 (axi_arburst_s2)
                                ,.arlock_s2  (axi_arlock_s2)
                                ,.arcache_s2 (axi_arcache_s2)
                                ,.arprot_s2  (axi_arprot_s2)
                                ,.arvalid_s2 (axi_arvalid_s2)
                                ,.arready_s2 (vip_sp_arready_s2)

                                ,.arsideband_s2 (axi_arsideband_s2[`AXI_AR_SBW-1:0])

                                ,.rid_s2    (vip_sp_rid_s2[`AXI_SIDW-1:0])
                                ,.rdata_s2  (vip_sp_rdata_s2[`AXI_DW-1:0])
                                ,.rresp_s2  (vip_sp_rresp_s2)
                                ,.rvalid_s2 (vip_sp_rvalid_s2)
                                ,.rlast_s2  (vip_sp_rlast_s2)
                                ,.rready_s2 (axi_rready_s2)

                                ,.rsideband_s2 (vip_sp_rsideband_s2[`AXI_R_SBW-1:0])
                                ,.awid_m3    (mon_sp_awid_s3[`AXI_MIDW-1:0])
                                ,.awaddr_m3  (mon_sp_awaddr_s3[`AXI_AW-1:0])
                                ,.awlen_m3   (mon_sp_awlen_s3[`AXI_BLW-1:0])
                                ,.awsize_m3  (mon_sp_awsize_s3)
                                ,.awburst_m3 (mon_sp_awburst_s3)
                                ,.awlock_m3  (mon_sp_awlock_s3)
                                ,.awcache_m3 (mon_sp_awcache_s3)
                                ,.awprot_m3  (mon_sp_awprot_s3)
                                ,.awvalid_m3 (mon_sp_awvalid_s3)
                                ,.awready_m3 (axi_awready_m3)

                                ,.awsideband_m3 (mon_sp_awsideband_s3[`AXI_AW_SBW-1:0])

                                ,.wid_m3    (mon_sp_wid_s3[`AXI_MIDW-1:0])
                                ,.wdata_m3  (mon_sp_wdata_s3[`AXI_DW-1:0])
                                ,.wstrb_m3  (mon_sp_wstrb_s3[`AXI_SW-1:0])
                                ,.wlast_m3  (mon_sp_wlast_s3)
                                ,.wvalid_m3 (mon_sp_wvalid_s3)
                                ,.wready_m3 (axi_wready_m3)
                                
                                ,.wsideband_m3 (mon_sp_wsideband_s3[`AXI_W_SBW-1:0])
                                
                                ,.bid_m3    (axi_bid_m3[`AXI_MIDW-1:0])
                                ,.bresp_m3  (axi_bresp_m3)
                                ,.bvalid_m3 (axi_bvalid_m3)
                                ,.bready_m3 (mon_sp_bready_s3)
  
                                ,.bsideband_m3 (axi_bsideband_m3[`AXI_B_SBW-1:0])
 
                                ,.arid_m3    (mon_sp_arid_s3[`AXI_MIDW-1:0])
                                ,.araddr_m3  (mon_sp_araddr_s3[`AXI_AW-1:0])
                                ,.arlen_m3   (mon_sp_arlen_s3[`AXI_BLW-1:0])
                                ,.arsize_m3  (mon_sp_arsize_s3)
                                ,.arburst_m3 (mon_sp_arburst_s3)
                                ,.arlock_m3  (mon_sp_arlock_s3)
                                ,.arcache_m3 (mon_sp_arcache_s3)
                                ,.arprot_m3  (mon_sp_arprot_s3)
                                ,.arvalid_m3 (mon_sp_arvalid_s3)
                                ,.arready_m3 (axi_arready_s3)

                                ,.arsideband_m3 (mon_sp_arsideband_s3[`AXI_AR_SBW-1:0])

                                ,.rid_m3    (axi_rid_m3[`AXI_MIDW-1:0])
                                ,.rdata_m3  (axi_rdata_m3[`AXI_DW-1:0])
                                ,.rresp_m3  (axi_rresp_m3)
                                ,.rlast_m3  (axi_rlast_m3)
                                ,.rvalid_m3 (axi_rvalid_m3)
                                ,.rready_m3 (mon_sp_rready_s3)

                                ,.rsideband_m3 (axi_rsideband_m3[`AXI_R_SBW-1:0])

				,.awid_s3    (axi_awid_s3[`AXI_SIDW-1:0])
                                ,.awaddr_s3  (axi_awaddr_s3[`AXI_AW-1:0])
                                ,.awlen_s3   (axi_awlen_s3[`AXI_BLW-1:0])
                                ,.awsize_s3  (axi_awsize_s3)
                                ,.awburst_s3 (axi_awburst_s3)
                                ,.awlock_s3  (axi_awlock_s3)
                                ,.awcache_s3 (axi_awcache_s3)
                                ,.awprot_s3  (axi_awprot_s3)
                                ,.awvalid_s3 (axi_awvalid_s3)
                                ,.awready_s3 (vip_sp_awready_s3)
  
                                ,.awsideband_s3 (axi_awsideband_s3[`AXI_AW_SBW-1:0])
 
                                ,.wid_s3    (axi_wid_s3[`AXI_SIDW-1:0])
                                ,.wdata_s3  (axi_wdata_s3[`AXI_DW-1:0])
                                ,.wstrb_s3  (axi_wstrb_s3[`AXI_SW-1:0])
                                ,.wlast_s3  (axi_wlast_s3)
                                ,.wvalid_s3 (axi_wvalid_s3)
                                ,.wready_s3 (vip_sp_wready_s3)

                                ,.wsideband_s3 (axi_wsideband_s3[`AXI_W_SBW-1:0])

                                ,.bid_s3    (vip_sp_bid_s3[`AXI_SIDW-1:0])
                                ,.bresp_s3  (vip_sp_bresp_s3)
                                ,.bvalid_s3 (vip_sp_bvalid_s3)
                                ,.bready_s3 (axi_bready_s3)

                                ,.bsideband_s3 (vip_sp_bsideband_s3[`AXI_B_SBW-1:0])

                                ,.arid_s3    (axi_arid_s3[`AXI_SIDW-1:0])
                                ,.araddr_s3  (axi_araddr_s3[`AXI_AW-1:0])
                                ,.arlen_s3   (axi_arlen_s3[`AXI_BLW-1:0])
                                ,.arsize_s3  (axi_arsize_s3)
                                ,.arburst_s3 (axi_arburst_s3)
                                ,.arlock_s3  (axi_arlock_s3)
                                ,.arcache_s3 (axi_arcache_s3)
                                ,.arprot_s3  (axi_arprot_s3)
                                ,.arvalid_s3 (axi_arvalid_s3)
                                ,.arready_s3 (vip_sp_arready_s3)

                                ,.arsideband_s3 (axi_arsideband_s3[`AXI_AR_SBW-1:0])

                                ,.rid_s3    (vip_sp_rid_s3[`AXI_SIDW-1:0])
                                ,.rdata_s3  (vip_sp_rdata_s3[`AXI_DW-1:0])
                                ,.rresp_s3  (vip_sp_rresp_s3)
                                ,.rvalid_s3 (vip_sp_rvalid_s3)
                                ,.rlast_s3  (vip_sp_rlast_s3)
                                ,.rready_s3 (axi_rready_s3)

                                ,.rsideband_s3 (vip_sp_rsideband_s3[`AXI_R_SBW-1:0])
                                ,.awid_m4    (mon_sp_awid_s4[`AXI_MIDW-1:0])
                                ,.awaddr_m4  (mon_sp_awaddr_s4[`AXI_AW-1:0])
                                ,.awlen_m4   (mon_sp_awlen_s4[`AXI_BLW-1:0])
                                ,.awsize_m4  (mon_sp_awsize_s4)
                                ,.awburst_m4 (mon_sp_awburst_s4)
                                ,.awlock_m4  (mon_sp_awlock_s4)
                                ,.awcache_m4 (mon_sp_awcache_s4)
                                ,.awprot_m4  (mon_sp_awprot_s4)
                                ,.awvalid_m4 (mon_sp_awvalid_s4)
                                ,.awready_m4 (axi_awready_m4)

                                ,.awsideband_m4 (mon_sp_awsideband_s4[`AXI_AW_SBW-1:0])

                                ,.wid_m4    (mon_sp_wid_s4[`AXI_MIDW-1:0])
                                ,.wdata_m4  (mon_sp_wdata_s4[`AXI_DW-1:0])
                                ,.wstrb_m4  (mon_sp_wstrb_s4[`AXI_SW-1:0])
                                ,.wlast_m4  (mon_sp_wlast_s4)
                                ,.wvalid_m4 (mon_sp_wvalid_s4)
                                ,.wready_m4 (axi_wready_m4)
                                
                                ,.wsideband_m4 (mon_sp_wsideband_s4[`AXI_W_SBW-1:0])
                                
                                ,.bid_m4    (axi_bid_m4[`AXI_MIDW-1:0])
                                ,.bresp_m4  (axi_bresp_m4)
                                ,.bvalid_m4 (axi_bvalid_m4)
                                ,.bready_m4 (mon_sp_bready_s4)
  
                                ,.bsideband_m4 (axi_bsideband_m4[`AXI_B_SBW-1:0])
 
                                ,.arid_m4    (mon_sp_arid_s4[`AXI_MIDW-1:0])
                                ,.araddr_m4  (mon_sp_araddr_s4[`AXI_AW-1:0])
                                ,.arlen_m4   (mon_sp_arlen_s4[`AXI_BLW-1:0])
                                ,.arsize_m4  (mon_sp_arsize_s4)
                                ,.arburst_m4 (mon_sp_arburst_s4)
                                ,.arlock_m4  (mon_sp_arlock_s4)
                                ,.arcache_m4 (mon_sp_arcache_s4)
                                ,.arprot_m4  (mon_sp_arprot_s4)
                                ,.arvalid_m4 (mon_sp_arvalid_s4)
                                ,.arready_m4 (axi_arready_s4)

                                ,.arsideband_m4 (mon_sp_arsideband_s4[`AXI_AR_SBW-1:0])

                                ,.rid_m4    (axi_rid_m4[`AXI_MIDW-1:0])
                                ,.rdata_m4  (axi_rdata_m4[`AXI_DW-1:0])
                                ,.rresp_m4  (axi_rresp_m4)
                                ,.rlast_m4  (axi_rlast_m4)
                                ,.rvalid_m4 (axi_rvalid_m4)
                                ,.rready_m4 (mon_sp_rready_s4)

                                ,.rsideband_m4 (axi_rsideband_m4[`AXI_R_SBW-1:0])

				,.awid_s4    (axi_awid_s4[`AXI_SIDW-1:0])
                                ,.awaddr_s4  (axi_awaddr_s4[`AXI_AW-1:0])
                                ,.awlen_s4   (axi_awlen_s4[`AXI_BLW-1:0])
                                ,.awsize_s4  (axi_awsize_s4)
                                ,.awburst_s4 (axi_awburst_s4)
                                ,.awlock_s4  (axi_awlock_s4)
                                ,.awcache_s4 (axi_awcache_s4)
                                ,.awprot_s4  (axi_awprot_s4)
                                ,.awvalid_s4 (axi_awvalid_s4)
                                ,.awready_s4 (vip_sp_awready_s4)
  
                                ,.awsideband_s4 (axi_awsideband_s4[`AXI_AW_SBW-1:0])
 
                                ,.wid_s4    (axi_wid_s4[`AXI_SIDW-1:0])
                                ,.wdata_s4  (axi_wdata_s4[`AXI_DW-1:0])
                                ,.wstrb_s4  (axi_wstrb_s4[`AXI_SW-1:0])
                                ,.wlast_s4  (axi_wlast_s4)
                                ,.wvalid_s4 (axi_wvalid_s4)
                                ,.wready_s4 (vip_sp_wready_s4)

                                ,.wsideband_s4 (axi_wsideband_s4[`AXI_W_SBW-1:0])

                                ,.bid_s4    (vip_sp_bid_s4[`AXI_SIDW-1:0])
                                ,.bresp_s4  (vip_sp_bresp_s4)
                                ,.bvalid_s4 (vip_sp_bvalid_s4)
                                ,.bready_s4 (axi_bready_s4)

                                ,.bsideband_s4 (vip_sp_bsideband_s4[`AXI_B_SBW-1:0])

                                ,.arid_s4    (axi_arid_s4[`AXI_SIDW-1:0])
                                ,.araddr_s4  (axi_araddr_s4[`AXI_AW-1:0])
                                ,.arlen_s4   (axi_arlen_s4[`AXI_BLW-1:0])
                                ,.arsize_s4  (axi_arsize_s4)
                                ,.arburst_s4 (axi_arburst_s4)
                                ,.arlock_s4  (axi_arlock_s4)
                                ,.arcache_s4 (axi_arcache_s4)
                                ,.arprot_s4  (axi_arprot_s4)
                                ,.arvalid_s4 (axi_arvalid_s4)
                                ,.arready_s4 (vip_sp_arready_s4)

                                ,.arsideband_s4 (axi_arsideband_s4[`AXI_AR_SBW-1:0])

                                ,.rid_s4    (vip_sp_rid_s4[`AXI_SIDW-1:0])
                                ,.rdata_s4  (vip_sp_rdata_s4[`AXI_DW-1:0])
                                ,.rresp_s4  (vip_sp_rresp_s4)
                                ,.rvalid_s4 (vip_sp_rvalid_s4)
                                ,.rlast_s4  (vip_sp_rlast_s4)
                                ,.rready_s4 (axi_rready_s4)

                                ,.rsideband_s4 (vip_sp_rsideband_s4[`AXI_R_SBW-1:0])
                                ,.awid_m5    (mon_sp_awid_s5[`AXI_MIDW-1:0])
                                ,.awaddr_m5  (mon_sp_awaddr_s5[`AXI_AW-1:0])
                                ,.awlen_m5   (mon_sp_awlen_s5[`AXI_BLW-1:0])
                                ,.awsize_m5  (mon_sp_awsize_s5)
                                ,.awburst_m5 (mon_sp_awburst_s5)
                                ,.awlock_m5  (mon_sp_awlock_s5)
                                ,.awcache_m5 (mon_sp_awcache_s5)
                                ,.awprot_m5  (mon_sp_awprot_s5)
                                ,.awvalid_m5 (mon_sp_awvalid_s5)
                                ,.awready_m5 (axi_awready_m5)

                                ,.awsideband_m5 (mon_sp_awsideband_s5[`AXI_AW_SBW-1:0])

                                ,.wid_m5    (mon_sp_wid_s5[`AXI_MIDW-1:0])
                                ,.wdata_m5  (mon_sp_wdata_s5[`AXI_DW-1:0])
                                ,.wstrb_m5  (mon_sp_wstrb_s5[`AXI_SW-1:0])
                                ,.wlast_m5  (mon_sp_wlast_s5)
                                ,.wvalid_m5 (mon_sp_wvalid_s5)
                                ,.wready_m5 (axi_wready_m5)
                                
                                ,.wsideband_m5 (mon_sp_wsideband_s5[`AXI_W_SBW-1:0])
                                
                                ,.bid_m5    (axi_bid_m5[`AXI_MIDW-1:0])
                                ,.bresp_m5  (axi_bresp_m5)
                                ,.bvalid_m5 (axi_bvalid_m5)
                                ,.bready_m5 (mon_sp_bready_s5)
  
                                ,.bsideband_m5 (axi_bsideband_m5[`AXI_B_SBW-1:0])
 
                                ,.arid_m5    (mon_sp_arid_s5[`AXI_MIDW-1:0])
                                ,.araddr_m5  (mon_sp_araddr_s5[`AXI_AW-1:0])
                                ,.arlen_m5   (mon_sp_arlen_s5[`AXI_BLW-1:0])
                                ,.arsize_m5  (mon_sp_arsize_s5)
                                ,.arburst_m5 (mon_sp_arburst_s5)
                                ,.arlock_m5  (mon_sp_arlock_s5)
                                ,.arcache_m5 (mon_sp_arcache_s5)
                                ,.arprot_m5  (mon_sp_arprot_s5)
                                ,.arvalid_m5 (mon_sp_arvalid_s5)
                                ,.arready_m5 (axi_arready_s5)

                                ,.arsideband_m5 (mon_sp_arsideband_s5[`AXI_AR_SBW-1:0])

                                ,.rid_m5    (axi_rid_m5[`AXI_MIDW-1:0])
                                ,.rdata_m5  (axi_rdata_m5[`AXI_DW-1:0])
                                ,.rresp_m5  (axi_rresp_m5)
                                ,.rlast_m5  (axi_rlast_m5)
                                ,.rvalid_m5 (axi_rvalid_m5)
                                ,.rready_m5 (mon_sp_rready_s5)

                                ,.rsideband_m5 (axi_rsideband_m5[`AXI_R_SBW-1:0])

				,.awid_s5    (axi_awid_s5[`AXI_SIDW-1:0])
                                ,.awaddr_s5  (axi_awaddr_s5[`AXI_AW-1:0])
                                ,.awlen_s5   (axi_awlen_s5[`AXI_BLW-1:0])
                                ,.awsize_s5  (axi_awsize_s5)
                                ,.awburst_s5 (axi_awburst_s5)
                                ,.awlock_s5  (axi_awlock_s5)
                                ,.awcache_s5 (axi_awcache_s5)
                                ,.awprot_s5  (axi_awprot_s5)
                                ,.awvalid_s5 (axi_awvalid_s5)
                                ,.awready_s5 (vip_sp_awready_s5)
  
                                ,.awsideband_s5 (axi_awsideband_s5[`AXI_AW_SBW-1:0])
 
                                ,.wid_s5    (axi_wid_s5[`AXI_SIDW-1:0])
                                ,.wdata_s5  (axi_wdata_s5[`AXI_DW-1:0])
                                ,.wstrb_s5  (axi_wstrb_s5[`AXI_SW-1:0])
                                ,.wlast_s5  (axi_wlast_s5)
                                ,.wvalid_s5 (axi_wvalid_s5)
                                ,.wready_s5 (vip_sp_wready_s5)

                                ,.wsideband_s5 (axi_wsideband_s5[`AXI_W_SBW-1:0])

                                ,.bid_s5    (vip_sp_bid_s5[`AXI_SIDW-1:0])
                                ,.bresp_s5  (vip_sp_bresp_s5)
                                ,.bvalid_s5 (vip_sp_bvalid_s5)
                                ,.bready_s5 (axi_bready_s5)

                                ,.bsideband_s5 (vip_sp_bsideband_s5[`AXI_B_SBW-1:0])

                                ,.arid_s5    (axi_arid_s5[`AXI_SIDW-1:0])
                                ,.araddr_s5  (axi_araddr_s5[`AXI_AW-1:0])
                                ,.arlen_s5   (axi_arlen_s5[`AXI_BLW-1:0])
                                ,.arsize_s5  (axi_arsize_s5)
                                ,.arburst_s5 (axi_arburst_s5)
                                ,.arlock_s5  (axi_arlock_s5)
                                ,.arcache_s5 (axi_arcache_s5)
                                ,.arprot_s5  (axi_arprot_s5)
                                ,.arvalid_s5 (axi_arvalid_s5)
                                ,.arready_s5 (vip_sp_arready_s5)

                                ,.arsideband_s5 (axi_arsideband_s5[`AXI_AR_SBW-1:0])

                                ,.rid_s5    (vip_sp_rid_s5[`AXI_SIDW-1:0])
                                ,.rdata_s5  (vip_sp_rdata_s5[`AXI_DW-1:0])
                                ,.rresp_s5  (vip_sp_rresp_s5)
                                ,.rvalid_s5 (vip_sp_rvalid_s5)
                                ,.rlast_s5  (vip_sp_rlast_s5)
                                ,.rready_s5 (axi_rready_s5)

                                ,.rsideband_s5 (vip_sp_rsideband_s5[`AXI_R_SBW-1:0])
                                ,.awid_m6    (mon_sp_awid_s6[`AXI_MIDW-1:0])
                                ,.awaddr_m6  (mon_sp_awaddr_s6[`AXI_AW-1:0])
                                ,.awlen_m6   (mon_sp_awlen_s6[`AXI_BLW-1:0])
                                ,.awsize_m6  (mon_sp_awsize_s6)
                                ,.awburst_m6 (mon_sp_awburst_s6)
                                ,.awlock_m6  (mon_sp_awlock_s6)
                                ,.awcache_m6 (mon_sp_awcache_s6)
                                ,.awprot_m6  (mon_sp_awprot_s6)
                                ,.awvalid_m6 (mon_sp_awvalid_s6)
                                ,.awready_m6 (axi_awready_m6)

                                ,.awsideband_m6 (mon_sp_awsideband_s6[`AXI_AW_SBW-1:0])

                                ,.wid_m6    (mon_sp_wid_s6[`AXI_MIDW-1:0])
                                ,.wdata_m6  (mon_sp_wdata_s6[`AXI_DW-1:0])
                                ,.wstrb_m6  (mon_sp_wstrb_s6[`AXI_SW-1:0])
                                ,.wlast_m6  (mon_sp_wlast_s6)
                                ,.wvalid_m6 (mon_sp_wvalid_s6)
                                ,.wready_m6 (axi_wready_m6)
                                
                                ,.wsideband_m6 (mon_sp_wsideband_s6[`AXI_W_SBW-1:0])
                                
                                ,.bid_m6    (axi_bid_m6[`AXI_MIDW-1:0])
                                ,.bresp_m6  (axi_bresp_m6)
                                ,.bvalid_m6 (axi_bvalid_m6)
                                ,.bready_m6 (mon_sp_bready_s6)
  
                                ,.bsideband_m6 (axi_bsideband_m6[`AXI_B_SBW-1:0])
 
                                ,.arid_m6    (mon_sp_arid_s6[`AXI_MIDW-1:0])
                                ,.araddr_m6  (mon_sp_araddr_s6[`AXI_AW-1:0])
                                ,.arlen_m6   (mon_sp_arlen_s6[`AXI_BLW-1:0])
                                ,.arsize_m6  (mon_sp_arsize_s6)
                                ,.arburst_m6 (mon_sp_arburst_s6)
                                ,.arlock_m6  (mon_sp_arlock_s6)
                                ,.arcache_m6 (mon_sp_arcache_s6)
                                ,.arprot_m6  (mon_sp_arprot_s6)
                                ,.arvalid_m6 (mon_sp_arvalid_s6)
                                ,.arready_m6 (axi_arready_s6)

                                ,.arsideband_m6 (mon_sp_arsideband_s6[`AXI_AR_SBW-1:0])

                                ,.rid_m6    (axi_rid_m6[`AXI_MIDW-1:0])
                                ,.rdata_m6  (axi_rdata_m6[`AXI_DW-1:0])
                                ,.rresp_m6  (axi_rresp_m6)
                                ,.rlast_m6  (axi_rlast_m6)
                                ,.rvalid_m6 (axi_rvalid_m6)
                                ,.rready_m6 (mon_sp_rready_s6)

                                ,.rsideband_m6 (axi_rsideband_m6[`AXI_R_SBW-1:0])

				,.awid_s6    (axi_awid_s6[`AXI_SIDW-1:0])
                                ,.awaddr_s6  (axi_awaddr_s6[`AXI_AW-1:0])
                                ,.awlen_s6   (axi_awlen_s6[`AXI_BLW-1:0])
                                ,.awsize_s6  (axi_awsize_s6)
                                ,.awburst_s6 (axi_awburst_s6)
                                ,.awlock_s6  (axi_awlock_s6)
                                ,.awcache_s6 (axi_awcache_s6)
                                ,.awprot_s6  (axi_awprot_s6)
                                ,.awvalid_s6 (axi_awvalid_s6)
                                ,.awready_s6 (vip_sp_awready_s6)
  
                                ,.awsideband_s6 (axi_awsideband_s6[`AXI_AW_SBW-1:0])
 
                                ,.wid_s6    (axi_wid_s6[`AXI_SIDW-1:0])
                                ,.wdata_s6  (axi_wdata_s6[`AXI_DW-1:0])
                                ,.wstrb_s6  (axi_wstrb_s6[`AXI_SW-1:0])
                                ,.wlast_s6  (axi_wlast_s6)
                                ,.wvalid_s6 (axi_wvalid_s6)
                                ,.wready_s6 (vip_sp_wready_s6)

                                ,.wsideband_s6 (axi_wsideband_s6[`AXI_W_SBW-1:0])

                                ,.bid_s6    (vip_sp_bid_s6[`AXI_SIDW-1:0])
                                ,.bresp_s6  (vip_sp_bresp_s6)
                                ,.bvalid_s6 (vip_sp_bvalid_s6)
                                ,.bready_s6 (axi_bready_s6)

                                ,.bsideband_s6 (vip_sp_bsideband_s6[`AXI_B_SBW-1:0])

                                ,.arid_s6    (axi_arid_s6[`AXI_SIDW-1:0])
                                ,.araddr_s6  (axi_araddr_s6[`AXI_AW-1:0])
                                ,.arlen_s6   (axi_arlen_s6[`AXI_BLW-1:0])
                                ,.arsize_s6  (axi_arsize_s6)
                                ,.arburst_s6 (axi_arburst_s6)
                                ,.arlock_s6  (axi_arlock_s6)
                                ,.arcache_s6 (axi_arcache_s6)
                                ,.arprot_s6  (axi_arprot_s6)
                                ,.arvalid_s6 (axi_arvalid_s6)
                                ,.arready_s6 (vip_sp_arready_s6)

                                ,.arsideband_s6 (axi_arsideband_s6[`AXI_AR_SBW-1:0])

                                ,.rid_s6    (vip_sp_rid_s6[`AXI_SIDW-1:0])
                                ,.rdata_s6  (vip_sp_rdata_s6[`AXI_DW-1:0])
                                ,.rresp_s6  (vip_sp_rresp_s6)
                                ,.rvalid_s6 (vip_sp_rvalid_s6)
                                ,.rlast_s6  (vip_sp_rlast_s6)
                                ,.rready_s6 (axi_rready_s6)

                                ,.rsideband_s6 (vip_sp_rsideband_s6[`AXI_R_SBW-1:0])
                                ,.awid_m7    (mon_sp_awid_s7[`AXI_MIDW-1:0])
                                ,.awaddr_m7  (mon_sp_awaddr_s7[`AXI_AW-1:0])
                                ,.awlen_m7   (mon_sp_awlen_s7[`AXI_BLW-1:0])
                                ,.awsize_m7  (mon_sp_awsize_s7)
                                ,.awburst_m7 (mon_sp_awburst_s7)
                                ,.awlock_m7  (mon_sp_awlock_s7)
                                ,.awcache_m7 (mon_sp_awcache_s7)
                                ,.awprot_m7  (mon_sp_awprot_s7)
                                ,.awvalid_m7 (mon_sp_awvalid_s7)
                                ,.awready_m7 (axi_awready_m7)

                                ,.awsideband_m7 (mon_sp_awsideband_s7[`AXI_AW_SBW-1:0])

                                ,.wid_m7    (mon_sp_wid_s7[`AXI_MIDW-1:0])
                                ,.wdata_m7  (mon_sp_wdata_s7[`AXI_DW-1:0])
                                ,.wstrb_m7  (mon_sp_wstrb_s7[`AXI_SW-1:0])
                                ,.wlast_m7  (mon_sp_wlast_s7)
                                ,.wvalid_m7 (mon_sp_wvalid_s7)
                                ,.wready_m7 (axi_wready_m7)
                                
                                ,.wsideband_m7 (mon_sp_wsideband_s7[`AXI_W_SBW-1:0])
                                
                                ,.bid_m7    (axi_bid_m7[`AXI_MIDW-1:0])
                                ,.bresp_m7  (axi_bresp_m7)
                                ,.bvalid_m7 (axi_bvalid_m7)
                                ,.bready_m7 (mon_sp_bready_s7)
  
                                ,.bsideband_m7 (axi_bsideband_m7[`AXI_B_SBW-1:0])
 
                                ,.arid_m7    (mon_sp_arid_s7[`AXI_MIDW-1:0])
                                ,.araddr_m7  (mon_sp_araddr_s7[`AXI_AW-1:0])
                                ,.arlen_m7   (mon_sp_arlen_s7[`AXI_BLW-1:0])
                                ,.arsize_m7  (mon_sp_arsize_s7)
                                ,.arburst_m7 (mon_sp_arburst_s7)
                                ,.arlock_m7  (mon_sp_arlock_s7)
                                ,.arcache_m7 (mon_sp_arcache_s7)
                                ,.arprot_m7  (mon_sp_arprot_s7)
                                ,.arvalid_m7 (mon_sp_arvalid_s7)
                                ,.arready_m7 (axi_arready_s7)

                                ,.arsideband_m7 (mon_sp_arsideband_s7[`AXI_AR_SBW-1:0])

                                ,.rid_m7    (axi_rid_m7[`AXI_MIDW-1:0])
                                ,.rdata_m7  (axi_rdata_m7[`AXI_DW-1:0])
                                ,.rresp_m7  (axi_rresp_m7)
                                ,.rlast_m7  (axi_rlast_m7)
                                ,.rvalid_m7 (axi_rvalid_m7)
                                ,.rready_m7 (mon_sp_rready_s7)

                                ,.rsideband_m7 (axi_rsideband_m7[`AXI_R_SBW-1:0])

				,.awid_s7    (axi_awid_s7[`AXI_SIDW-1:0])
                                ,.awaddr_s7  (axi_awaddr_s7[`AXI_AW-1:0])
                                ,.awlen_s7   (axi_awlen_s7[`AXI_BLW-1:0])
                                ,.awsize_s7  (axi_awsize_s7)
                                ,.awburst_s7 (axi_awburst_s7)
                                ,.awlock_s7  (axi_awlock_s7)
                                ,.awcache_s7 (axi_awcache_s7)
                                ,.awprot_s7  (axi_awprot_s7)
                                ,.awvalid_s7 (axi_awvalid_s7)
                                ,.awready_s7 (vip_sp_awready_s7)
  
                                ,.awsideband_s7 (axi_awsideband_s7[`AXI_AW_SBW-1:0])
 
                                ,.wid_s7    (axi_wid_s7[`AXI_SIDW-1:0])
                                ,.wdata_s7  (axi_wdata_s7[`AXI_DW-1:0])
                                ,.wstrb_s7  (axi_wstrb_s7[`AXI_SW-1:0])
                                ,.wlast_s7  (axi_wlast_s7)
                                ,.wvalid_s7 (axi_wvalid_s7)
                                ,.wready_s7 (vip_sp_wready_s7)

                                ,.wsideband_s7 (axi_wsideband_s7[`AXI_W_SBW-1:0])

                                ,.bid_s7    (vip_sp_bid_s7[`AXI_SIDW-1:0])
                                ,.bresp_s7  (vip_sp_bresp_s7)
                                ,.bvalid_s7 (vip_sp_bvalid_s7)
                                ,.bready_s7 (axi_bready_s7)

                                ,.bsideband_s7 (vip_sp_bsideband_s7[`AXI_B_SBW-1:0])

                                ,.arid_s7    (axi_arid_s7[`AXI_SIDW-1:0])
                                ,.araddr_s7  (axi_araddr_s7[`AXI_AW-1:0])
                                ,.arlen_s7   (axi_arlen_s7[`AXI_BLW-1:0])
                                ,.arsize_s7  (axi_arsize_s7)
                                ,.arburst_s7 (axi_arburst_s7)
                                ,.arlock_s7  (axi_arlock_s7)
                                ,.arcache_s7 (axi_arcache_s7)
                                ,.arprot_s7  (axi_arprot_s7)
                                ,.arvalid_s7 (axi_arvalid_s7)
                                ,.arready_s7 (vip_sp_arready_s7)

                                ,.arsideband_s7 (axi_arsideband_s7[`AXI_AR_SBW-1:0])

                                ,.rid_s7    (vip_sp_rid_s7[`AXI_SIDW-1:0])
                                ,.rdata_s7  (vip_sp_rdata_s7[`AXI_DW-1:0])
                                ,.rresp_s7  (vip_sp_rresp_s7)
                                ,.rvalid_s7 (vip_sp_rvalid_s7)
                                ,.rlast_s7  (vip_sp_rlast_s7)
                                ,.rready_s7 (axi_rready_s7)

                                ,.rsideband_s7 (vip_sp_rsideband_s7[`AXI_R_SBW-1:0])
                                ,.awid_m8    (mon_sp_awid_s8[`AXI_MIDW-1:0])
                                ,.awaddr_m8  (mon_sp_awaddr_s8[`AXI_AW-1:0])
                                ,.awlen_m8   (mon_sp_awlen_s8[`AXI_BLW-1:0])
                                ,.awsize_m8  (mon_sp_awsize_s8)
                                ,.awburst_m8 (mon_sp_awburst_s8)
                                ,.awlock_m8  (mon_sp_awlock_s8)
                                ,.awcache_m8 (mon_sp_awcache_s8)
                                ,.awprot_m8  (mon_sp_awprot_s8)
                                ,.awvalid_m8 (mon_sp_awvalid_s8)
                                ,.awready_m8 (axi_awready_m8)

                                ,.awsideband_m8 (mon_sp_awsideband_s8[`AXI_AW_SBW-1:0])

                                ,.wid_m8    (mon_sp_wid_s8[`AXI_MIDW-1:0])
                                ,.wdata_m8  (mon_sp_wdata_s8[`AXI_DW-1:0])
                                ,.wstrb_m8  (mon_sp_wstrb_s8[`AXI_SW-1:0])
                                ,.wlast_m8  (mon_sp_wlast_s8)
                                ,.wvalid_m8 (mon_sp_wvalid_s8)
                                ,.wready_m8 (axi_wready_m8)
                                
                                ,.wsideband_m8 (mon_sp_wsideband_s8[`AXI_W_SBW-1:0])
                                
                                ,.bid_m8    (axi_bid_m8[`AXI_MIDW-1:0])
                                ,.bresp_m8  (axi_bresp_m8)
                                ,.bvalid_m8 (axi_bvalid_m8)
                                ,.bready_m8 (mon_sp_bready_s8)
  
                                ,.bsideband_m8 (axi_bsideband_m8[`AXI_B_SBW-1:0])
 
                                ,.arid_m8    (mon_sp_arid_s8[`AXI_MIDW-1:0])
                                ,.araddr_m8  (mon_sp_araddr_s8[`AXI_AW-1:0])
                                ,.arlen_m8   (mon_sp_arlen_s8[`AXI_BLW-1:0])
                                ,.arsize_m8  (mon_sp_arsize_s8)
                                ,.arburst_m8 (mon_sp_arburst_s8)
                                ,.arlock_m8  (mon_sp_arlock_s8)
                                ,.arcache_m8 (mon_sp_arcache_s8)
                                ,.arprot_m8  (mon_sp_arprot_s8)
                                ,.arvalid_m8 (mon_sp_arvalid_s8)
                                ,.arready_m8 (axi_arready_s8)

                                ,.arsideband_m8 (mon_sp_arsideband_s8[`AXI_AR_SBW-1:0])

                                ,.rid_m8    (axi_rid_m8[`AXI_MIDW-1:0])
                                ,.rdata_m8  (axi_rdata_m8[`AXI_DW-1:0])
                                ,.rresp_m8  (axi_rresp_m8)
                                ,.rlast_m8  (axi_rlast_m8)
                                ,.rvalid_m8 (axi_rvalid_m8)
                                ,.rready_m8 (mon_sp_rready_s8)

                                ,.rsideband_m8 (axi_rsideband_m8[`AXI_R_SBW-1:0])

				,.awid_s8    (axi_awid_s8[`AXI_SIDW-1:0])
                                ,.awaddr_s8  (axi_awaddr_s8[`AXI_AW-1:0])
                                ,.awlen_s8   (axi_awlen_s8[`AXI_BLW-1:0])
                                ,.awsize_s8  (axi_awsize_s8)
                                ,.awburst_s8 (axi_awburst_s8)
                                ,.awlock_s8  (axi_awlock_s8)
                                ,.awcache_s8 (axi_awcache_s8)
                                ,.awprot_s8  (axi_awprot_s8)
                                ,.awvalid_s8 (axi_awvalid_s8)
                                ,.awready_s8 (vip_sp_awready_s8)
  
                                ,.awsideband_s8 (axi_awsideband_s8[`AXI_AW_SBW-1:0])
 
                                ,.wid_s8    (axi_wid_s8[`AXI_SIDW-1:0])
                                ,.wdata_s8  (axi_wdata_s8[`AXI_DW-1:0])
                                ,.wstrb_s8  (axi_wstrb_s8[`AXI_SW-1:0])
                                ,.wlast_s8  (axi_wlast_s8)
                                ,.wvalid_s8 (axi_wvalid_s8)
                                ,.wready_s8 (vip_sp_wready_s8)

                                ,.wsideband_s8 (axi_wsideband_s8[`AXI_W_SBW-1:0])

                                ,.bid_s8    (vip_sp_bid_s8[`AXI_SIDW-1:0])
                                ,.bresp_s8  (vip_sp_bresp_s8)
                                ,.bvalid_s8 (vip_sp_bvalid_s8)
                                ,.bready_s8 (axi_bready_s8)

                                ,.bsideband_s8 (vip_sp_bsideband_s8[`AXI_B_SBW-1:0])

                                ,.arid_s8    (axi_arid_s8[`AXI_SIDW-1:0])
                                ,.araddr_s8  (axi_araddr_s8[`AXI_AW-1:0])
                                ,.arlen_s8   (axi_arlen_s8[`AXI_BLW-1:0])
                                ,.arsize_s8  (axi_arsize_s8)
                                ,.arburst_s8 (axi_arburst_s8)
                                ,.arlock_s8  (axi_arlock_s8)
                                ,.arcache_s8 (axi_arcache_s8)
                                ,.arprot_s8  (axi_arprot_s8)
                                ,.arvalid_s8 (axi_arvalid_s8)
                                ,.arready_s8 (vip_sp_arready_s8)

                                ,.arsideband_s8 (axi_arsideband_s8[`AXI_AR_SBW-1:0])

                                ,.rid_s8    (vip_sp_rid_s8[`AXI_SIDW-1:0])
                                ,.rdata_s8  (vip_sp_rdata_s8[`AXI_DW-1:0])
                                ,.rresp_s8  (vip_sp_rresp_s8)
                                ,.rvalid_s8 (vip_sp_rvalid_s8)
                                ,.rlast_s8  (vip_sp_rlast_s8)
                                ,.rready_s8 (axi_rready_s8)

                                ,.rsideband_s8 (vip_sp_rsideband_s8[`AXI_R_SBW-1:0])
   				);

`endif

endmodule 

