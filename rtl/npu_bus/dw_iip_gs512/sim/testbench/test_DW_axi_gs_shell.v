// SYNOPSYS_VERA_SHELL

module test_DW_axi_gs_shell(
        AxiMasterInterface_aclk,
        AxiMasterInterface_aresetn,
        AxiMasterInterface_awvalid,
        AxiMasterInterface_awaddr,
        AxiMasterInterface_awlen,
        AxiMasterInterface_awsize,
        AxiMasterInterface_awburst,
        AxiMasterInterface_awlock,
        AxiMasterInterface_awcache,
        AxiMasterInterface_awprot,
        AxiMasterInterface_awid,
        AxiMasterInterface_awsideband,
        AxiMasterInterface_awready,
        AxiMasterInterface_arvalid,
        AxiMasterInterface_araddr,
        AxiMasterInterface_arlen,
        AxiMasterInterface_arsize,
        AxiMasterInterface_arburst,
        AxiMasterInterface_arlock,
        AxiMasterInterface_arcache,
        AxiMasterInterface_arprot,
        AxiMasterInterface_arid,
        AxiMasterInterface_arsideband,
        AxiMasterInterface_arready,
        AxiMasterInterface_rvalid,
        AxiMasterInterface_rlast,
        AxiMasterInterface_rdata,
        AxiMasterInterface_rresp,
        AxiMasterInterface_rid,
        AxiMasterInterface_rsideband,
        AxiMasterInterface_rready,
        AxiMasterInterface_wvalid,
        AxiMasterInterface_wlast,
        AxiMasterInterface_wdata,
        AxiMasterInterface_wstrb,
        AxiMasterInterface_wid,
        AxiMasterInterface_wsideband,
        AxiMasterInterface_wready,
        AxiMasterInterface_bvalid,
        AxiMasterInterface_bresp,
        AxiMasterInterface_bid,
        AxiMasterInterface_bsideband,
        AxiMasterInterface_bready,
        AxiMasterInterface_csysreq,
        AxiMasterInterface_csysack,
        AxiMasterInterface_cactive,
        AxiMonitorInterface_aclk,
        AxiMonitorInterface_aresetn,
        AxiMonitorInterface_arvalid_m0,
        AxiMonitorInterface_arvalid_m1,
        AxiMonitorInterface_arvalid_m2,
        AxiMonitorInterface_arvalid_m3,
        AxiMonitorInterface_arvalid_m4,
        AxiMonitorInterface_arvalid_m5,
        AxiMonitorInterface_arvalid_m6,
        AxiMonitorInterface_arvalid_m7,
        AxiMonitorInterface_arvalid_m8,
        AxiMonitorInterface_arvalid_m9,
        AxiMonitorInterface_arvalid_m10,
        AxiMonitorInterface_arvalid_m11,
        AxiMonitorInterface_arvalid_m12,
        AxiMonitorInterface_arvalid_m13,
        AxiMonitorInterface_arvalid_m14,
        AxiMonitorInterface_arvalid_m15,
        AxiMonitorInterface_arvalid_m16,
        AxiMonitorInterface_arvalid_m17,
        AxiMonitorInterface_arvalid_m18,
        AxiMonitorInterface_arvalid_m19,
        AxiMonitorInterface_arvalid_m20,
        AxiMonitorInterface_arvalid_m21,
        AxiMonitorInterface_arvalid_m22,
        AxiMonitorInterface_arvalid_m23,
        AxiMonitorInterface_arvalid_m24,
        AxiMonitorInterface_arvalid_m25,
        AxiMonitorInterface_arvalid_m26,
        AxiMonitorInterface_arvalid_m27,
        AxiMonitorInterface_arvalid_m28,
        AxiMonitorInterface_arvalid_m29,
        AxiMonitorInterface_arvalid_m30,
        AxiMonitorInterface_arvalid_m31,
        AxiMonitorInterface_araddr_m0,
        AxiMonitorInterface_araddr_m1,
        AxiMonitorInterface_araddr_m2,
        AxiMonitorInterface_araddr_m3,
        AxiMonitorInterface_araddr_m4,
        AxiMonitorInterface_araddr_m5,
        AxiMonitorInterface_araddr_m6,
        AxiMonitorInterface_araddr_m7,
        AxiMonitorInterface_araddr_m8,
        AxiMonitorInterface_araddr_m9,
        AxiMonitorInterface_araddr_m10,
        AxiMonitorInterface_araddr_m11,
        AxiMonitorInterface_araddr_m12,
        AxiMonitorInterface_araddr_m13,
        AxiMonitorInterface_araddr_m14,
        AxiMonitorInterface_araddr_m15,
        AxiMonitorInterface_araddr_m16,
        AxiMonitorInterface_araddr_m17,
        AxiMonitorInterface_araddr_m18,
        AxiMonitorInterface_araddr_m19,
        AxiMonitorInterface_araddr_m20,
        AxiMonitorInterface_araddr_m21,
        AxiMonitorInterface_araddr_m22,
        AxiMonitorInterface_araddr_m23,
        AxiMonitorInterface_araddr_m24,
        AxiMonitorInterface_araddr_m25,
        AxiMonitorInterface_araddr_m26,
        AxiMonitorInterface_araddr_m27,
        AxiMonitorInterface_araddr_m28,
        AxiMonitorInterface_araddr_m29,
        AxiMonitorInterface_araddr_m30,
        AxiMonitorInterface_araddr_m31,
        AxiMonitorInterface_arlen_m0,
        AxiMonitorInterface_arlen_m1,
        AxiMonitorInterface_arlen_m2,
        AxiMonitorInterface_arlen_m3,
        AxiMonitorInterface_arlen_m4,
        AxiMonitorInterface_arlen_m5,
        AxiMonitorInterface_arlen_m6,
        AxiMonitorInterface_arlen_m7,
        AxiMonitorInterface_arlen_m8,
        AxiMonitorInterface_arlen_m9,
        AxiMonitorInterface_arlen_m10,
        AxiMonitorInterface_arlen_m11,
        AxiMonitorInterface_arlen_m12,
        AxiMonitorInterface_arlen_m13,
        AxiMonitorInterface_arlen_m14,
        AxiMonitorInterface_arlen_m15,
        AxiMonitorInterface_arlen_m16,
        AxiMonitorInterface_arlen_m17,
        AxiMonitorInterface_arlen_m18,
        AxiMonitorInterface_arlen_m19,
        AxiMonitorInterface_arlen_m20,
        AxiMonitorInterface_arlen_m21,
        AxiMonitorInterface_arlen_m22,
        AxiMonitorInterface_arlen_m23,
        AxiMonitorInterface_arlen_m24,
        AxiMonitorInterface_arlen_m25,
        AxiMonitorInterface_arlen_m26,
        AxiMonitorInterface_arlen_m27,
        AxiMonitorInterface_arlen_m28,
        AxiMonitorInterface_arlen_m29,
        AxiMonitorInterface_arlen_m30,
        AxiMonitorInterface_arlen_m31,
        AxiMonitorInterface_arsize_m0,
        AxiMonitorInterface_arsize_m1,
        AxiMonitorInterface_arsize_m2,
        AxiMonitorInterface_arsize_m3,
        AxiMonitorInterface_arsize_m4,
        AxiMonitorInterface_arsize_m5,
        AxiMonitorInterface_arsize_m6,
        AxiMonitorInterface_arsize_m7,
        AxiMonitorInterface_arsize_m8,
        AxiMonitorInterface_arsize_m9,
        AxiMonitorInterface_arsize_m10,
        AxiMonitorInterface_arsize_m11,
        AxiMonitorInterface_arsize_m12,
        AxiMonitorInterface_arsize_m13,
        AxiMonitorInterface_arsize_m14,
        AxiMonitorInterface_arsize_m15,
        AxiMonitorInterface_arsize_m16,
        AxiMonitorInterface_arsize_m17,
        AxiMonitorInterface_arsize_m18,
        AxiMonitorInterface_arsize_m19,
        AxiMonitorInterface_arsize_m20,
        AxiMonitorInterface_arsize_m21,
        AxiMonitorInterface_arsize_m22,
        AxiMonitorInterface_arsize_m23,
        AxiMonitorInterface_arsize_m24,
        AxiMonitorInterface_arsize_m25,
        AxiMonitorInterface_arsize_m26,
        AxiMonitorInterface_arsize_m27,
        AxiMonitorInterface_arsize_m28,
        AxiMonitorInterface_arsize_m29,
        AxiMonitorInterface_arsize_m30,
        AxiMonitorInterface_arsize_m31,
        AxiMonitorInterface_arburst_m0,
        AxiMonitorInterface_arburst_m1,
        AxiMonitorInterface_arburst_m2,
        AxiMonitorInterface_arburst_m3,
        AxiMonitorInterface_arburst_m4,
        AxiMonitorInterface_arburst_m5,
        AxiMonitorInterface_arburst_m6,
        AxiMonitorInterface_arburst_m7,
        AxiMonitorInterface_arburst_m8,
        AxiMonitorInterface_arburst_m9,
        AxiMonitorInterface_arburst_m10,
        AxiMonitorInterface_arburst_m11,
        AxiMonitorInterface_arburst_m12,
        AxiMonitorInterface_arburst_m13,
        AxiMonitorInterface_arburst_m14,
        AxiMonitorInterface_arburst_m15,
        AxiMonitorInterface_arburst_m16,
        AxiMonitorInterface_arburst_m17,
        AxiMonitorInterface_arburst_m18,
        AxiMonitorInterface_arburst_m19,
        AxiMonitorInterface_arburst_m20,
        AxiMonitorInterface_arburst_m21,
        AxiMonitorInterface_arburst_m22,
        AxiMonitorInterface_arburst_m23,
        AxiMonitorInterface_arburst_m24,
        AxiMonitorInterface_arburst_m25,
        AxiMonitorInterface_arburst_m26,
        AxiMonitorInterface_arburst_m27,
        AxiMonitorInterface_arburst_m28,
        AxiMonitorInterface_arburst_m29,
        AxiMonitorInterface_arburst_m30,
        AxiMonitorInterface_arburst_m31,
        AxiMonitorInterface_arlock_m0,
        AxiMonitorInterface_arlock_m1,
        AxiMonitorInterface_arlock_m2,
        AxiMonitorInterface_arlock_m3,
        AxiMonitorInterface_arlock_m4,
        AxiMonitorInterface_arlock_m5,
        AxiMonitorInterface_arlock_m6,
        AxiMonitorInterface_arlock_m7,
        AxiMonitorInterface_arlock_m8,
        AxiMonitorInterface_arlock_m9,
        AxiMonitorInterface_arlock_m10,
        AxiMonitorInterface_arlock_m11,
        AxiMonitorInterface_arlock_m12,
        AxiMonitorInterface_arlock_m13,
        AxiMonitorInterface_arlock_m14,
        AxiMonitorInterface_arlock_m15,
        AxiMonitorInterface_arlock_m16,
        AxiMonitorInterface_arlock_m17,
        AxiMonitorInterface_arlock_m18,
        AxiMonitorInterface_arlock_m19,
        AxiMonitorInterface_arlock_m20,
        AxiMonitorInterface_arlock_m21,
        AxiMonitorInterface_arlock_m22,
        AxiMonitorInterface_arlock_m23,
        AxiMonitorInterface_arlock_m24,
        AxiMonitorInterface_arlock_m25,
        AxiMonitorInterface_arlock_m26,
        AxiMonitorInterface_arlock_m27,
        AxiMonitorInterface_arlock_m28,
        AxiMonitorInterface_arlock_m29,
        AxiMonitorInterface_arlock_m30,
        AxiMonitorInterface_arlock_m31,
        AxiMonitorInterface_arcache_m0,
        AxiMonitorInterface_arcache_m1,
        AxiMonitorInterface_arcache_m2,
        AxiMonitorInterface_arcache_m3,
        AxiMonitorInterface_arcache_m4,
        AxiMonitorInterface_arcache_m5,
        AxiMonitorInterface_arcache_m6,
        AxiMonitorInterface_arcache_m7,
        AxiMonitorInterface_arcache_m8,
        AxiMonitorInterface_arcache_m9,
        AxiMonitorInterface_arcache_m10,
        AxiMonitorInterface_arcache_m11,
        AxiMonitorInterface_arcache_m12,
        AxiMonitorInterface_arcache_m13,
        AxiMonitorInterface_arcache_m14,
        AxiMonitorInterface_arcache_m15,
        AxiMonitorInterface_arcache_m16,
        AxiMonitorInterface_arcache_m17,
        AxiMonitorInterface_arcache_m18,
        AxiMonitorInterface_arcache_m19,
        AxiMonitorInterface_arcache_m20,
        AxiMonitorInterface_arcache_m21,
        AxiMonitorInterface_arcache_m22,
        AxiMonitorInterface_arcache_m23,
        AxiMonitorInterface_arcache_m24,
        AxiMonitorInterface_arcache_m25,
        AxiMonitorInterface_arcache_m26,
        AxiMonitorInterface_arcache_m27,
        AxiMonitorInterface_arcache_m28,
        AxiMonitorInterface_arcache_m29,
        AxiMonitorInterface_arcache_m30,
        AxiMonitorInterface_arcache_m31,
        AxiMonitorInterface_arprot_m0,
        AxiMonitorInterface_arprot_m1,
        AxiMonitorInterface_arprot_m2,
        AxiMonitorInterface_arprot_m3,
        AxiMonitorInterface_arprot_m4,
        AxiMonitorInterface_arprot_m5,
        AxiMonitorInterface_arprot_m6,
        AxiMonitorInterface_arprot_m7,
        AxiMonitorInterface_arprot_m8,
        AxiMonitorInterface_arprot_m9,
        AxiMonitorInterface_arprot_m10,
        AxiMonitorInterface_arprot_m11,
        AxiMonitorInterface_arprot_m12,
        AxiMonitorInterface_arprot_m13,
        AxiMonitorInterface_arprot_m14,
        AxiMonitorInterface_arprot_m15,
        AxiMonitorInterface_arprot_m16,
        AxiMonitorInterface_arprot_m17,
        AxiMonitorInterface_arprot_m18,
        AxiMonitorInterface_arprot_m19,
        AxiMonitorInterface_arprot_m20,
        AxiMonitorInterface_arprot_m21,
        AxiMonitorInterface_arprot_m22,
        AxiMonitorInterface_arprot_m23,
        AxiMonitorInterface_arprot_m24,
        AxiMonitorInterface_arprot_m25,
        AxiMonitorInterface_arprot_m26,
        AxiMonitorInterface_arprot_m27,
        AxiMonitorInterface_arprot_m28,
        AxiMonitorInterface_arprot_m29,
        AxiMonitorInterface_arprot_m30,
        AxiMonitorInterface_arprot_m31,
        AxiMonitorInterface_arid_m0,
        AxiMonitorInterface_arid_m1,
        AxiMonitorInterface_arid_m2,
        AxiMonitorInterface_arid_m3,
        AxiMonitorInterface_arid_m4,
        AxiMonitorInterface_arid_m5,
        AxiMonitorInterface_arid_m6,
        AxiMonitorInterface_arid_m7,
        AxiMonitorInterface_arid_m8,
        AxiMonitorInterface_arid_m9,
        AxiMonitorInterface_arid_m10,
        AxiMonitorInterface_arid_m11,
        AxiMonitorInterface_arid_m12,
        AxiMonitorInterface_arid_m13,
        AxiMonitorInterface_arid_m14,
        AxiMonitorInterface_arid_m15,
        AxiMonitorInterface_arid_m16,
        AxiMonitorInterface_arid_m17,
        AxiMonitorInterface_arid_m18,
        AxiMonitorInterface_arid_m19,
        AxiMonitorInterface_arid_m20,
        AxiMonitorInterface_arid_m21,
        AxiMonitorInterface_arid_m22,
        AxiMonitorInterface_arid_m23,
        AxiMonitorInterface_arid_m24,
        AxiMonitorInterface_arid_m25,
        AxiMonitorInterface_arid_m26,
        AxiMonitorInterface_arid_m27,
        AxiMonitorInterface_arid_m28,
        AxiMonitorInterface_arid_m29,
        AxiMonitorInterface_arid_m30,
        AxiMonitorInterface_arid_m31,
        AxiMonitorInterface_arready_m0,
        AxiMonitorInterface_arready_m1,
        AxiMonitorInterface_arready_m2,
        AxiMonitorInterface_arready_m3,
        AxiMonitorInterface_arready_m4,
        AxiMonitorInterface_arready_m5,
        AxiMonitorInterface_arready_m6,
        AxiMonitorInterface_arready_m7,
        AxiMonitorInterface_arready_m8,
        AxiMonitorInterface_arready_m9,
        AxiMonitorInterface_arready_m10,
        AxiMonitorInterface_arready_m11,
        AxiMonitorInterface_arready_m12,
        AxiMonitorInterface_arready_m13,
        AxiMonitorInterface_arready_m14,
        AxiMonitorInterface_arready_m15,
        AxiMonitorInterface_arready_m16,
        AxiMonitorInterface_arready_m17,
        AxiMonitorInterface_arready_m18,
        AxiMonitorInterface_arready_m19,
        AxiMonitorInterface_arready_m20,
        AxiMonitorInterface_arready_m21,
        AxiMonitorInterface_arready_m22,
        AxiMonitorInterface_arready_m23,
        AxiMonitorInterface_arready_m24,
        AxiMonitorInterface_arready_m25,
        AxiMonitorInterface_arready_m26,
        AxiMonitorInterface_arready_m27,
        AxiMonitorInterface_arready_m28,
        AxiMonitorInterface_arready_m29,
        AxiMonitorInterface_arready_m30,
        AxiMonitorInterface_arready_m31,
        AxiMonitorInterface_arsideband_m0,
        AxiMonitorInterface_arsideband_m1,
        AxiMonitorInterface_arsideband_m2,
        AxiMonitorInterface_arsideband_m3,
        AxiMonitorInterface_arsideband_m4,
        AxiMonitorInterface_arsideband_m5,
        AxiMonitorInterface_arsideband_m6,
        AxiMonitorInterface_arsideband_m7,
        AxiMonitorInterface_arsideband_m8,
        AxiMonitorInterface_arsideband_m9,
        AxiMonitorInterface_arsideband_m10,
        AxiMonitorInterface_arsideband_m11,
        AxiMonitorInterface_arsideband_m12,
        AxiMonitorInterface_arsideband_m13,
        AxiMonitorInterface_arsideband_m14,
        AxiMonitorInterface_arsideband_m15,
        AxiMonitorInterface_arsideband_m16,
        AxiMonitorInterface_arsideband_m17,
        AxiMonitorInterface_arsideband_m18,
        AxiMonitorInterface_arsideband_m19,
        AxiMonitorInterface_arsideband_m20,
        AxiMonitorInterface_arsideband_m21,
        AxiMonitorInterface_arsideband_m22,
        AxiMonitorInterface_arsideband_m23,
        AxiMonitorInterface_arsideband_m24,
        AxiMonitorInterface_arsideband_m25,
        AxiMonitorInterface_arsideband_m26,
        AxiMonitorInterface_arsideband_m27,
        AxiMonitorInterface_arsideband_m28,
        AxiMonitorInterface_arsideband_m29,
        AxiMonitorInterface_arsideband_m30,
        AxiMonitorInterface_arsideband_m31,
        AxiMonitorInterface_awvalid_m0,
        AxiMonitorInterface_awvalid_m1,
        AxiMonitorInterface_awvalid_m2,
        AxiMonitorInterface_awvalid_m3,
        AxiMonitorInterface_awvalid_m4,
        AxiMonitorInterface_awvalid_m5,
        AxiMonitorInterface_awvalid_m6,
        AxiMonitorInterface_awvalid_m7,
        AxiMonitorInterface_awvalid_m8,
        AxiMonitorInterface_awvalid_m9,
        AxiMonitorInterface_awvalid_m10,
        AxiMonitorInterface_awvalid_m11,
        AxiMonitorInterface_awvalid_m12,
        AxiMonitorInterface_awvalid_m13,
        AxiMonitorInterface_awvalid_m14,
        AxiMonitorInterface_awvalid_m15,
        AxiMonitorInterface_awvalid_m16,
        AxiMonitorInterface_awvalid_m17,
        AxiMonitorInterface_awvalid_m18,
        AxiMonitorInterface_awvalid_m19,
        AxiMonitorInterface_awvalid_m20,
        AxiMonitorInterface_awvalid_m21,
        AxiMonitorInterface_awvalid_m22,
        AxiMonitorInterface_awvalid_m23,
        AxiMonitorInterface_awvalid_m24,
        AxiMonitorInterface_awvalid_m25,
        AxiMonitorInterface_awvalid_m26,
        AxiMonitorInterface_awvalid_m27,
        AxiMonitorInterface_awvalid_m28,
        AxiMonitorInterface_awvalid_m29,
        AxiMonitorInterface_awvalid_m30,
        AxiMonitorInterface_awvalid_m31,
        AxiMonitorInterface_awaddr_m0,
        AxiMonitorInterface_awaddr_m1,
        AxiMonitorInterface_awaddr_m2,
        AxiMonitorInterface_awaddr_m3,
        AxiMonitorInterface_awaddr_m4,
        AxiMonitorInterface_awaddr_m5,
        AxiMonitorInterface_awaddr_m6,
        AxiMonitorInterface_awaddr_m7,
        AxiMonitorInterface_awaddr_m8,
        AxiMonitorInterface_awaddr_m9,
        AxiMonitorInterface_awaddr_m10,
        AxiMonitorInterface_awaddr_m11,
        AxiMonitorInterface_awaddr_m12,
        AxiMonitorInterface_awaddr_m13,
        AxiMonitorInterface_awaddr_m14,
        AxiMonitorInterface_awaddr_m15,
        AxiMonitorInterface_awaddr_m16,
        AxiMonitorInterface_awaddr_m17,
        AxiMonitorInterface_awaddr_m18,
        AxiMonitorInterface_awaddr_m19,
        AxiMonitorInterface_awaddr_m20,
        AxiMonitorInterface_awaddr_m21,
        AxiMonitorInterface_awaddr_m22,
        AxiMonitorInterface_awaddr_m23,
        AxiMonitorInterface_awaddr_m24,
        AxiMonitorInterface_awaddr_m25,
        AxiMonitorInterface_awaddr_m26,
        AxiMonitorInterface_awaddr_m27,
        AxiMonitorInterface_awaddr_m28,
        AxiMonitorInterface_awaddr_m29,
        AxiMonitorInterface_awaddr_m30,
        AxiMonitorInterface_awaddr_m31,
        AxiMonitorInterface_awlen_m0,
        AxiMonitorInterface_awlen_m1,
        AxiMonitorInterface_awlen_m2,
        AxiMonitorInterface_awlen_m3,
        AxiMonitorInterface_awlen_m4,
        AxiMonitorInterface_awlen_m5,
        AxiMonitorInterface_awlen_m6,
        AxiMonitorInterface_awlen_m7,
        AxiMonitorInterface_awlen_m8,
        AxiMonitorInterface_awlen_m9,
        AxiMonitorInterface_awlen_m10,
        AxiMonitorInterface_awlen_m11,
        AxiMonitorInterface_awlen_m12,
        AxiMonitorInterface_awlen_m13,
        AxiMonitorInterface_awlen_m14,
        AxiMonitorInterface_awlen_m15,
        AxiMonitorInterface_awlen_m16,
        AxiMonitorInterface_awlen_m17,
        AxiMonitorInterface_awlen_m18,
        AxiMonitorInterface_awlen_m19,
        AxiMonitorInterface_awlen_m20,
        AxiMonitorInterface_awlen_m21,
        AxiMonitorInterface_awlen_m22,
        AxiMonitorInterface_awlen_m23,
        AxiMonitorInterface_awlen_m24,
        AxiMonitorInterface_awlen_m25,
        AxiMonitorInterface_awlen_m26,
        AxiMonitorInterface_awlen_m27,
        AxiMonitorInterface_awlen_m28,
        AxiMonitorInterface_awlen_m29,
        AxiMonitorInterface_awlen_m30,
        AxiMonitorInterface_awlen_m31,
        AxiMonitorInterface_awsize_m0,
        AxiMonitorInterface_awsize_m1,
        AxiMonitorInterface_awsize_m2,
        AxiMonitorInterface_awsize_m3,
        AxiMonitorInterface_awsize_m4,
        AxiMonitorInterface_awsize_m5,
        AxiMonitorInterface_awsize_m6,
        AxiMonitorInterface_awsize_m7,
        AxiMonitorInterface_awsize_m8,
        AxiMonitorInterface_awsize_m9,
        AxiMonitorInterface_awsize_m10,
        AxiMonitorInterface_awsize_m11,
        AxiMonitorInterface_awsize_m12,
        AxiMonitorInterface_awsize_m13,
        AxiMonitorInterface_awsize_m14,
        AxiMonitorInterface_awsize_m15,
        AxiMonitorInterface_awsize_m16,
        AxiMonitorInterface_awsize_m17,
        AxiMonitorInterface_awsize_m18,
        AxiMonitorInterface_awsize_m19,
        AxiMonitorInterface_awsize_m20,
        AxiMonitorInterface_awsize_m21,
        AxiMonitorInterface_awsize_m22,
        AxiMonitorInterface_awsize_m23,
        AxiMonitorInterface_awsize_m24,
        AxiMonitorInterface_awsize_m25,
        AxiMonitorInterface_awsize_m26,
        AxiMonitorInterface_awsize_m27,
        AxiMonitorInterface_awsize_m28,
        AxiMonitorInterface_awsize_m29,
        AxiMonitorInterface_awsize_m30,
        AxiMonitorInterface_awsize_m31,
        AxiMonitorInterface_awburst_m0,
        AxiMonitorInterface_awburst_m1,
        AxiMonitorInterface_awburst_m2,
        AxiMonitorInterface_awburst_m3,
        AxiMonitorInterface_awburst_m4,
        AxiMonitorInterface_awburst_m5,
        AxiMonitorInterface_awburst_m6,
        AxiMonitorInterface_awburst_m7,
        AxiMonitorInterface_awburst_m8,
        AxiMonitorInterface_awburst_m9,
        AxiMonitorInterface_awburst_m10,
        AxiMonitorInterface_awburst_m11,
        AxiMonitorInterface_awburst_m12,
        AxiMonitorInterface_awburst_m13,
        AxiMonitorInterface_awburst_m14,
        AxiMonitorInterface_awburst_m15,
        AxiMonitorInterface_awburst_m16,
        AxiMonitorInterface_awburst_m17,
        AxiMonitorInterface_awburst_m18,
        AxiMonitorInterface_awburst_m19,
        AxiMonitorInterface_awburst_m20,
        AxiMonitorInterface_awburst_m21,
        AxiMonitorInterface_awburst_m22,
        AxiMonitorInterface_awburst_m23,
        AxiMonitorInterface_awburst_m24,
        AxiMonitorInterface_awburst_m25,
        AxiMonitorInterface_awburst_m26,
        AxiMonitorInterface_awburst_m27,
        AxiMonitorInterface_awburst_m28,
        AxiMonitorInterface_awburst_m29,
        AxiMonitorInterface_awburst_m30,
        AxiMonitorInterface_awburst_m31,
        AxiMonitorInterface_awlock_m0,
        AxiMonitorInterface_awlock_m1,
        AxiMonitorInterface_awlock_m2,
        AxiMonitorInterface_awlock_m3,
        AxiMonitorInterface_awlock_m4,
        AxiMonitorInterface_awlock_m5,
        AxiMonitorInterface_awlock_m6,
        AxiMonitorInterface_awlock_m7,
        AxiMonitorInterface_awlock_m8,
        AxiMonitorInterface_awlock_m9,
        AxiMonitorInterface_awlock_m10,
        AxiMonitorInterface_awlock_m11,
        AxiMonitorInterface_awlock_m12,
        AxiMonitorInterface_awlock_m13,
        AxiMonitorInterface_awlock_m14,
        AxiMonitorInterface_awlock_m15,
        AxiMonitorInterface_awlock_m16,
        AxiMonitorInterface_awlock_m17,
        AxiMonitorInterface_awlock_m18,
        AxiMonitorInterface_awlock_m19,
        AxiMonitorInterface_awlock_m20,
        AxiMonitorInterface_awlock_m21,
        AxiMonitorInterface_awlock_m22,
        AxiMonitorInterface_awlock_m23,
        AxiMonitorInterface_awlock_m24,
        AxiMonitorInterface_awlock_m25,
        AxiMonitorInterface_awlock_m26,
        AxiMonitorInterface_awlock_m27,
        AxiMonitorInterface_awlock_m28,
        AxiMonitorInterface_awlock_m29,
        AxiMonitorInterface_awlock_m30,
        AxiMonitorInterface_awlock_m31,
        AxiMonitorInterface_awcache_m0,
        AxiMonitorInterface_awcache_m1,
        AxiMonitorInterface_awcache_m2,
        AxiMonitorInterface_awcache_m3,
        AxiMonitorInterface_awcache_m4,
        AxiMonitorInterface_awcache_m5,
        AxiMonitorInterface_awcache_m6,
        AxiMonitorInterface_awcache_m7,
        AxiMonitorInterface_awcache_m8,
        AxiMonitorInterface_awcache_m9,
        AxiMonitorInterface_awcache_m10,
        AxiMonitorInterface_awcache_m11,
        AxiMonitorInterface_awcache_m12,
        AxiMonitorInterface_awcache_m13,
        AxiMonitorInterface_awcache_m14,
        AxiMonitorInterface_awcache_m15,
        AxiMonitorInterface_awcache_m16,
        AxiMonitorInterface_awcache_m17,
        AxiMonitorInterface_awcache_m18,
        AxiMonitorInterface_awcache_m19,
        AxiMonitorInterface_awcache_m20,
        AxiMonitorInterface_awcache_m21,
        AxiMonitorInterface_awcache_m22,
        AxiMonitorInterface_awcache_m23,
        AxiMonitorInterface_awcache_m24,
        AxiMonitorInterface_awcache_m25,
        AxiMonitorInterface_awcache_m26,
        AxiMonitorInterface_awcache_m27,
        AxiMonitorInterface_awcache_m28,
        AxiMonitorInterface_awcache_m29,
        AxiMonitorInterface_awcache_m30,
        AxiMonitorInterface_awcache_m31,
        AxiMonitorInterface_awprot_m0,
        AxiMonitorInterface_awprot_m1,
        AxiMonitorInterface_awprot_m2,
        AxiMonitorInterface_awprot_m3,
        AxiMonitorInterface_awprot_m4,
        AxiMonitorInterface_awprot_m5,
        AxiMonitorInterface_awprot_m6,
        AxiMonitorInterface_awprot_m7,
        AxiMonitorInterface_awprot_m8,
        AxiMonitorInterface_awprot_m9,
        AxiMonitorInterface_awprot_m10,
        AxiMonitorInterface_awprot_m11,
        AxiMonitorInterface_awprot_m12,
        AxiMonitorInterface_awprot_m13,
        AxiMonitorInterface_awprot_m14,
        AxiMonitorInterface_awprot_m15,
        AxiMonitorInterface_awprot_m16,
        AxiMonitorInterface_awprot_m17,
        AxiMonitorInterface_awprot_m18,
        AxiMonitorInterface_awprot_m19,
        AxiMonitorInterface_awprot_m20,
        AxiMonitorInterface_awprot_m21,
        AxiMonitorInterface_awprot_m22,
        AxiMonitorInterface_awprot_m23,
        AxiMonitorInterface_awprot_m24,
        AxiMonitorInterface_awprot_m25,
        AxiMonitorInterface_awprot_m26,
        AxiMonitorInterface_awprot_m27,
        AxiMonitorInterface_awprot_m28,
        AxiMonitorInterface_awprot_m29,
        AxiMonitorInterface_awprot_m30,
        AxiMonitorInterface_awprot_m31,
        AxiMonitorInterface_awid_m0,
        AxiMonitorInterface_awid_m1,
        AxiMonitorInterface_awid_m2,
        AxiMonitorInterface_awid_m3,
        AxiMonitorInterface_awid_m4,
        AxiMonitorInterface_awid_m5,
        AxiMonitorInterface_awid_m6,
        AxiMonitorInterface_awid_m7,
        AxiMonitorInterface_awid_m8,
        AxiMonitorInterface_awid_m9,
        AxiMonitorInterface_awid_m10,
        AxiMonitorInterface_awid_m11,
        AxiMonitorInterface_awid_m12,
        AxiMonitorInterface_awid_m13,
        AxiMonitorInterface_awid_m14,
        AxiMonitorInterface_awid_m15,
        AxiMonitorInterface_awid_m16,
        AxiMonitorInterface_awid_m17,
        AxiMonitorInterface_awid_m18,
        AxiMonitorInterface_awid_m19,
        AxiMonitorInterface_awid_m20,
        AxiMonitorInterface_awid_m21,
        AxiMonitorInterface_awid_m22,
        AxiMonitorInterface_awid_m23,
        AxiMonitorInterface_awid_m24,
        AxiMonitorInterface_awid_m25,
        AxiMonitorInterface_awid_m26,
        AxiMonitorInterface_awid_m27,
        AxiMonitorInterface_awid_m28,
        AxiMonitorInterface_awid_m29,
        AxiMonitorInterface_awid_m30,
        AxiMonitorInterface_awid_m31,
        AxiMonitorInterface_awready_m0,
        AxiMonitorInterface_awready_m1,
        AxiMonitorInterface_awready_m2,
        AxiMonitorInterface_awready_m3,
        AxiMonitorInterface_awready_m4,
        AxiMonitorInterface_awready_m5,
        AxiMonitorInterface_awready_m6,
        AxiMonitorInterface_awready_m7,
        AxiMonitorInterface_awready_m8,
        AxiMonitorInterface_awready_m9,
        AxiMonitorInterface_awready_m10,
        AxiMonitorInterface_awready_m11,
        AxiMonitorInterface_awready_m12,
        AxiMonitorInterface_awready_m13,
        AxiMonitorInterface_awready_m14,
        AxiMonitorInterface_awready_m15,
        AxiMonitorInterface_awready_m16,
        AxiMonitorInterface_awready_m17,
        AxiMonitorInterface_awready_m18,
        AxiMonitorInterface_awready_m19,
        AxiMonitorInterface_awready_m20,
        AxiMonitorInterface_awready_m21,
        AxiMonitorInterface_awready_m22,
        AxiMonitorInterface_awready_m23,
        AxiMonitorInterface_awready_m24,
        AxiMonitorInterface_awready_m25,
        AxiMonitorInterface_awready_m26,
        AxiMonitorInterface_awready_m27,
        AxiMonitorInterface_awready_m28,
        AxiMonitorInterface_awready_m29,
        AxiMonitorInterface_awready_m30,
        AxiMonitorInterface_awready_m31,
        AxiMonitorInterface_awsideband_m0,
        AxiMonitorInterface_awsideband_m1,
        AxiMonitorInterface_awsideband_m2,
        AxiMonitorInterface_awsideband_m3,
        AxiMonitorInterface_awsideband_m4,
        AxiMonitorInterface_awsideband_m5,
        AxiMonitorInterface_awsideband_m6,
        AxiMonitorInterface_awsideband_m7,
        AxiMonitorInterface_awsideband_m8,
        AxiMonitorInterface_awsideband_m9,
        AxiMonitorInterface_awsideband_m10,
        AxiMonitorInterface_awsideband_m11,
        AxiMonitorInterface_awsideband_m12,
        AxiMonitorInterface_awsideband_m13,
        AxiMonitorInterface_awsideband_m14,
        AxiMonitorInterface_awsideband_m15,
        AxiMonitorInterface_awsideband_m16,
        AxiMonitorInterface_awsideband_m17,
        AxiMonitorInterface_awsideband_m18,
        AxiMonitorInterface_awsideband_m19,
        AxiMonitorInterface_awsideband_m20,
        AxiMonitorInterface_awsideband_m21,
        AxiMonitorInterface_awsideband_m22,
        AxiMonitorInterface_awsideband_m23,
        AxiMonitorInterface_awsideband_m24,
        AxiMonitorInterface_awsideband_m25,
        AxiMonitorInterface_awsideband_m26,
        AxiMonitorInterface_awsideband_m27,
        AxiMonitorInterface_awsideband_m28,
        AxiMonitorInterface_awsideband_m29,
        AxiMonitorInterface_awsideband_m30,
        AxiMonitorInterface_awsideband_m31,
        AxiMonitorInterface_rvalid_m0,
        AxiMonitorInterface_rvalid_m1,
        AxiMonitorInterface_rvalid_m2,
        AxiMonitorInterface_rvalid_m3,
        AxiMonitorInterface_rvalid_m4,
        AxiMonitorInterface_rvalid_m5,
        AxiMonitorInterface_rvalid_m6,
        AxiMonitorInterface_rvalid_m7,
        AxiMonitorInterface_rvalid_m8,
        AxiMonitorInterface_rvalid_m9,
        AxiMonitorInterface_rvalid_m10,
        AxiMonitorInterface_rvalid_m11,
        AxiMonitorInterface_rvalid_m12,
        AxiMonitorInterface_rvalid_m13,
        AxiMonitorInterface_rvalid_m14,
        AxiMonitorInterface_rvalid_m15,
        AxiMonitorInterface_rvalid_m16,
        AxiMonitorInterface_rvalid_m17,
        AxiMonitorInterface_rvalid_m18,
        AxiMonitorInterface_rvalid_m19,
        AxiMonitorInterface_rvalid_m20,
        AxiMonitorInterface_rvalid_m21,
        AxiMonitorInterface_rvalid_m22,
        AxiMonitorInterface_rvalid_m23,
        AxiMonitorInterface_rvalid_m24,
        AxiMonitorInterface_rvalid_m25,
        AxiMonitorInterface_rvalid_m26,
        AxiMonitorInterface_rvalid_m27,
        AxiMonitorInterface_rvalid_m28,
        AxiMonitorInterface_rvalid_m29,
        AxiMonitorInterface_rvalid_m30,
        AxiMonitorInterface_rvalid_m31,
        AxiMonitorInterface_rlast_m0,
        AxiMonitorInterface_rlast_m1,
        AxiMonitorInterface_rlast_m2,
        AxiMonitorInterface_rlast_m3,
        AxiMonitorInterface_rlast_m4,
        AxiMonitorInterface_rlast_m5,
        AxiMonitorInterface_rlast_m6,
        AxiMonitorInterface_rlast_m7,
        AxiMonitorInterface_rlast_m8,
        AxiMonitorInterface_rlast_m9,
        AxiMonitorInterface_rlast_m10,
        AxiMonitorInterface_rlast_m11,
        AxiMonitorInterface_rlast_m12,
        AxiMonitorInterface_rlast_m13,
        AxiMonitorInterface_rlast_m14,
        AxiMonitorInterface_rlast_m15,
        AxiMonitorInterface_rlast_m16,
        AxiMonitorInterface_rlast_m17,
        AxiMonitorInterface_rlast_m18,
        AxiMonitorInterface_rlast_m19,
        AxiMonitorInterface_rlast_m20,
        AxiMonitorInterface_rlast_m21,
        AxiMonitorInterface_rlast_m22,
        AxiMonitorInterface_rlast_m23,
        AxiMonitorInterface_rlast_m24,
        AxiMonitorInterface_rlast_m25,
        AxiMonitorInterface_rlast_m26,
        AxiMonitorInterface_rlast_m27,
        AxiMonitorInterface_rlast_m28,
        AxiMonitorInterface_rlast_m29,
        AxiMonitorInterface_rlast_m30,
        AxiMonitorInterface_rlast_m31,
        AxiMonitorInterface_rdata_m0,
        AxiMonitorInterface_rdata_m1,
        AxiMonitorInterface_rdata_m2,
        AxiMonitorInterface_rdata_m3,
        AxiMonitorInterface_rdata_m4,
        AxiMonitorInterface_rdata_m5,
        AxiMonitorInterface_rdata_m6,
        AxiMonitorInterface_rdata_m7,
        AxiMonitorInterface_rdata_m8,
        AxiMonitorInterface_rdata_m9,
        AxiMonitorInterface_rdata_m10,
        AxiMonitorInterface_rdata_m11,
        AxiMonitorInterface_rdata_m12,
        AxiMonitorInterface_rdata_m13,
        AxiMonitorInterface_rdata_m14,
        AxiMonitorInterface_rdata_m15,
        AxiMonitorInterface_rdata_m16,
        AxiMonitorInterface_rdata_m17,
        AxiMonitorInterface_rdata_m18,
        AxiMonitorInterface_rdata_m19,
        AxiMonitorInterface_rdata_m20,
        AxiMonitorInterface_rdata_m21,
        AxiMonitorInterface_rdata_m22,
        AxiMonitorInterface_rdata_m23,
        AxiMonitorInterface_rdata_m24,
        AxiMonitorInterface_rdata_m25,
        AxiMonitorInterface_rdata_m26,
        AxiMonitorInterface_rdata_m27,
        AxiMonitorInterface_rdata_m28,
        AxiMonitorInterface_rdata_m29,
        AxiMonitorInterface_rdata_m30,
        AxiMonitorInterface_rdata_m31,
        AxiMonitorInterface_rresp_m0,
        AxiMonitorInterface_rresp_m1,
        AxiMonitorInterface_rresp_m2,
        AxiMonitorInterface_rresp_m3,
        AxiMonitorInterface_rresp_m4,
        AxiMonitorInterface_rresp_m5,
        AxiMonitorInterface_rresp_m6,
        AxiMonitorInterface_rresp_m7,
        AxiMonitorInterface_rresp_m8,
        AxiMonitorInterface_rresp_m9,
        AxiMonitorInterface_rresp_m10,
        AxiMonitorInterface_rresp_m11,
        AxiMonitorInterface_rresp_m12,
        AxiMonitorInterface_rresp_m13,
        AxiMonitorInterface_rresp_m14,
        AxiMonitorInterface_rresp_m15,
        AxiMonitorInterface_rresp_m16,
        AxiMonitorInterface_rresp_m17,
        AxiMonitorInterface_rresp_m18,
        AxiMonitorInterface_rresp_m19,
        AxiMonitorInterface_rresp_m20,
        AxiMonitorInterface_rresp_m21,
        AxiMonitorInterface_rresp_m22,
        AxiMonitorInterface_rresp_m23,
        AxiMonitorInterface_rresp_m24,
        AxiMonitorInterface_rresp_m25,
        AxiMonitorInterface_rresp_m26,
        AxiMonitorInterface_rresp_m27,
        AxiMonitorInterface_rresp_m28,
        AxiMonitorInterface_rresp_m29,
        AxiMonitorInterface_rresp_m30,
        AxiMonitorInterface_rresp_m31,
        AxiMonitorInterface_rid_m0,
        AxiMonitorInterface_rid_m1,
        AxiMonitorInterface_rid_m2,
        AxiMonitorInterface_rid_m3,
        AxiMonitorInterface_rid_m4,
        AxiMonitorInterface_rid_m5,
        AxiMonitorInterface_rid_m6,
        AxiMonitorInterface_rid_m7,
        AxiMonitorInterface_rid_m8,
        AxiMonitorInterface_rid_m9,
        AxiMonitorInterface_rid_m10,
        AxiMonitorInterface_rid_m11,
        AxiMonitorInterface_rid_m12,
        AxiMonitorInterface_rid_m13,
        AxiMonitorInterface_rid_m14,
        AxiMonitorInterface_rid_m15,
        AxiMonitorInterface_rid_m16,
        AxiMonitorInterface_rid_m17,
        AxiMonitorInterface_rid_m18,
        AxiMonitorInterface_rid_m19,
        AxiMonitorInterface_rid_m20,
        AxiMonitorInterface_rid_m21,
        AxiMonitorInterface_rid_m22,
        AxiMonitorInterface_rid_m23,
        AxiMonitorInterface_rid_m24,
        AxiMonitorInterface_rid_m25,
        AxiMonitorInterface_rid_m26,
        AxiMonitorInterface_rid_m27,
        AxiMonitorInterface_rid_m28,
        AxiMonitorInterface_rid_m29,
        AxiMonitorInterface_rid_m30,
        AxiMonitorInterface_rid_m31,
        AxiMonitorInterface_rready_m0,
        AxiMonitorInterface_rready_m1,
        AxiMonitorInterface_rready_m2,
        AxiMonitorInterface_rready_m3,
        AxiMonitorInterface_rready_m4,
        AxiMonitorInterface_rready_m5,
        AxiMonitorInterface_rready_m6,
        AxiMonitorInterface_rready_m7,
        AxiMonitorInterface_rready_m8,
        AxiMonitorInterface_rready_m9,
        AxiMonitorInterface_rready_m10,
        AxiMonitorInterface_rready_m11,
        AxiMonitorInterface_rready_m12,
        AxiMonitorInterface_rready_m13,
        AxiMonitorInterface_rready_m14,
        AxiMonitorInterface_rready_m15,
        AxiMonitorInterface_rready_m16,
        AxiMonitorInterface_rready_m17,
        AxiMonitorInterface_rready_m18,
        AxiMonitorInterface_rready_m19,
        AxiMonitorInterface_rready_m20,
        AxiMonitorInterface_rready_m21,
        AxiMonitorInterface_rready_m22,
        AxiMonitorInterface_rready_m23,
        AxiMonitorInterface_rready_m24,
        AxiMonitorInterface_rready_m25,
        AxiMonitorInterface_rready_m26,
        AxiMonitorInterface_rready_m27,
        AxiMonitorInterface_rready_m28,
        AxiMonitorInterface_rready_m29,
        AxiMonitorInterface_rready_m30,
        AxiMonitorInterface_rready_m31,
        AxiMonitorInterface_rsideband_m0,
        AxiMonitorInterface_rsideband_m1,
        AxiMonitorInterface_rsideband_m2,
        AxiMonitorInterface_rsideband_m3,
        AxiMonitorInterface_rsideband_m4,
        AxiMonitorInterface_rsideband_m5,
        AxiMonitorInterface_rsideband_m6,
        AxiMonitorInterface_rsideband_m7,
        AxiMonitorInterface_rsideband_m8,
        AxiMonitorInterface_rsideband_m9,
        AxiMonitorInterface_rsideband_m10,
        AxiMonitorInterface_rsideband_m11,
        AxiMonitorInterface_rsideband_m12,
        AxiMonitorInterface_rsideband_m13,
        AxiMonitorInterface_rsideband_m14,
        AxiMonitorInterface_rsideband_m15,
        AxiMonitorInterface_rsideband_m16,
        AxiMonitorInterface_rsideband_m17,
        AxiMonitorInterface_rsideband_m18,
        AxiMonitorInterface_rsideband_m19,
        AxiMonitorInterface_rsideband_m20,
        AxiMonitorInterface_rsideband_m21,
        AxiMonitorInterface_rsideband_m22,
        AxiMonitorInterface_rsideband_m23,
        AxiMonitorInterface_rsideband_m24,
        AxiMonitorInterface_rsideband_m25,
        AxiMonitorInterface_rsideband_m26,
        AxiMonitorInterface_rsideband_m27,
        AxiMonitorInterface_rsideband_m28,
        AxiMonitorInterface_rsideband_m29,
        AxiMonitorInterface_rsideband_m30,
        AxiMonitorInterface_rsideband_m31,
        AxiMonitorInterface_wvalid_m0,
        AxiMonitorInterface_wvalid_m1,
        AxiMonitorInterface_wvalid_m2,
        AxiMonitorInterface_wvalid_m3,
        AxiMonitorInterface_wvalid_m4,
        AxiMonitorInterface_wvalid_m5,
        AxiMonitorInterface_wvalid_m6,
        AxiMonitorInterface_wvalid_m7,
        AxiMonitorInterface_wvalid_m8,
        AxiMonitorInterface_wvalid_m9,
        AxiMonitorInterface_wvalid_m10,
        AxiMonitorInterface_wvalid_m11,
        AxiMonitorInterface_wvalid_m12,
        AxiMonitorInterface_wvalid_m13,
        AxiMonitorInterface_wvalid_m14,
        AxiMonitorInterface_wvalid_m15,
        AxiMonitorInterface_wvalid_m16,
        AxiMonitorInterface_wvalid_m17,
        AxiMonitorInterface_wvalid_m18,
        AxiMonitorInterface_wvalid_m19,
        AxiMonitorInterface_wvalid_m20,
        AxiMonitorInterface_wvalid_m21,
        AxiMonitorInterface_wvalid_m22,
        AxiMonitorInterface_wvalid_m23,
        AxiMonitorInterface_wvalid_m24,
        AxiMonitorInterface_wvalid_m25,
        AxiMonitorInterface_wvalid_m26,
        AxiMonitorInterface_wvalid_m27,
        AxiMonitorInterface_wvalid_m28,
        AxiMonitorInterface_wvalid_m29,
        AxiMonitorInterface_wvalid_m30,
        AxiMonitorInterface_wvalid_m31,
        AxiMonitorInterface_wlast_m0,
        AxiMonitorInterface_wlast_m1,
        AxiMonitorInterface_wlast_m2,
        AxiMonitorInterface_wlast_m3,
        AxiMonitorInterface_wlast_m4,
        AxiMonitorInterface_wlast_m5,
        AxiMonitorInterface_wlast_m6,
        AxiMonitorInterface_wlast_m7,
        AxiMonitorInterface_wlast_m8,
        AxiMonitorInterface_wlast_m9,
        AxiMonitorInterface_wlast_m10,
        AxiMonitorInterface_wlast_m11,
        AxiMonitorInterface_wlast_m12,
        AxiMonitorInterface_wlast_m13,
        AxiMonitorInterface_wlast_m14,
        AxiMonitorInterface_wlast_m15,
        AxiMonitorInterface_wlast_m16,
        AxiMonitorInterface_wlast_m17,
        AxiMonitorInterface_wlast_m18,
        AxiMonitorInterface_wlast_m19,
        AxiMonitorInterface_wlast_m20,
        AxiMonitorInterface_wlast_m21,
        AxiMonitorInterface_wlast_m22,
        AxiMonitorInterface_wlast_m23,
        AxiMonitorInterface_wlast_m24,
        AxiMonitorInterface_wlast_m25,
        AxiMonitorInterface_wlast_m26,
        AxiMonitorInterface_wlast_m27,
        AxiMonitorInterface_wlast_m28,
        AxiMonitorInterface_wlast_m29,
        AxiMonitorInterface_wlast_m30,
        AxiMonitorInterface_wlast_m31,
        AxiMonitorInterface_wdata_m0,
        AxiMonitorInterface_wdata_m1,
        AxiMonitorInterface_wdata_m2,
        AxiMonitorInterface_wdata_m3,
        AxiMonitorInterface_wdata_m4,
        AxiMonitorInterface_wdata_m5,
        AxiMonitorInterface_wdata_m6,
        AxiMonitorInterface_wdata_m7,
        AxiMonitorInterface_wdata_m8,
        AxiMonitorInterface_wdata_m9,
        AxiMonitorInterface_wdata_m10,
        AxiMonitorInterface_wdata_m11,
        AxiMonitorInterface_wdata_m12,
        AxiMonitorInterface_wdata_m13,
        AxiMonitorInterface_wdata_m14,
        AxiMonitorInterface_wdata_m15,
        AxiMonitorInterface_wdata_m16,
        AxiMonitorInterface_wdata_m17,
        AxiMonitorInterface_wdata_m18,
        AxiMonitorInterface_wdata_m19,
        AxiMonitorInterface_wdata_m20,
        AxiMonitorInterface_wdata_m21,
        AxiMonitorInterface_wdata_m22,
        AxiMonitorInterface_wdata_m23,
        AxiMonitorInterface_wdata_m24,
        AxiMonitorInterface_wdata_m25,
        AxiMonitorInterface_wdata_m26,
        AxiMonitorInterface_wdata_m27,
        AxiMonitorInterface_wdata_m28,
        AxiMonitorInterface_wdata_m29,
        AxiMonitorInterface_wdata_m30,
        AxiMonitorInterface_wdata_m31,
        AxiMonitorInterface_wstrb_m0,
        AxiMonitorInterface_wstrb_m1,
        AxiMonitorInterface_wstrb_m2,
        AxiMonitorInterface_wstrb_m3,
        AxiMonitorInterface_wstrb_m4,
        AxiMonitorInterface_wstrb_m5,
        AxiMonitorInterface_wstrb_m6,
        AxiMonitorInterface_wstrb_m7,
        AxiMonitorInterface_wstrb_m8,
        AxiMonitorInterface_wstrb_m9,
        AxiMonitorInterface_wstrb_m10,
        AxiMonitorInterface_wstrb_m11,
        AxiMonitorInterface_wstrb_m12,
        AxiMonitorInterface_wstrb_m13,
        AxiMonitorInterface_wstrb_m14,
        AxiMonitorInterface_wstrb_m15,
        AxiMonitorInterface_wstrb_m16,
        AxiMonitorInterface_wstrb_m17,
        AxiMonitorInterface_wstrb_m18,
        AxiMonitorInterface_wstrb_m19,
        AxiMonitorInterface_wstrb_m20,
        AxiMonitorInterface_wstrb_m21,
        AxiMonitorInterface_wstrb_m22,
        AxiMonitorInterface_wstrb_m23,
        AxiMonitorInterface_wstrb_m24,
        AxiMonitorInterface_wstrb_m25,
        AxiMonitorInterface_wstrb_m26,
        AxiMonitorInterface_wstrb_m27,
        AxiMonitorInterface_wstrb_m28,
        AxiMonitorInterface_wstrb_m29,
        AxiMonitorInterface_wstrb_m30,
        AxiMonitorInterface_wstrb_m31,
        AxiMonitorInterface_wid_m0,
        AxiMonitorInterface_wid_m1,
        AxiMonitorInterface_wid_m2,
        AxiMonitorInterface_wid_m3,
        AxiMonitorInterface_wid_m4,
        AxiMonitorInterface_wid_m5,
        AxiMonitorInterface_wid_m6,
        AxiMonitorInterface_wid_m7,
        AxiMonitorInterface_wid_m8,
        AxiMonitorInterface_wid_m9,
        AxiMonitorInterface_wid_m10,
        AxiMonitorInterface_wid_m11,
        AxiMonitorInterface_wid_m12,
        AxiMonitorInterface_wid_m13,
        AxiMonitorInterface_wid_m14,
        AxiMonitorInterface_wid_m15,
        AxiMonitorInterface_wid_m16,
        AxiMonitorInterface_wid_m17,
        AxiMonitorInterface_wid_m18,
        AxiMonitorInterface_wid_m19,
        AxiMonitorInterface_wid_m20,
        AxiMonitorInterface_wid_m21,
        AxiMonitorInterface_wid_m22,
        AxiMonitorInterface_wid_m23,
        AxiMonitorInterface_wid_m24,
        AxiMonitorInterface_wid_m25,
        AxiMonitorInterface_wid_m26,
        AxiMonitorInterface_wid_m27,
        AxiMonitorInterface_wid_m28,
        AxiMonitorInterface_wid_m29,
        AxiMonitorInterface_wid_m30,
        AxiMonitorInterface_wid_m31,
        AxiMonitorInterface_wready_m0,
        AxiMonitorInterface_wready_m1,
        AxiMonitorInterface_wready_m2,
        AxiMonitorInterface_wready_m3,
        AxiMonitorInterface_wready_m4,
        AxiMonitorInterface_wready_m5,
        AxiMonitorInterface_wready_m6,
        AxiMonitorInterface_wready_m7,
        AxiMonitorInterface_wready_m8,
        AxiMonitorInterface_wready_m9,
        AxiMonitorInterface_wready_m10,
        AxiMonitorInterface_wready_m11,
        AxiMonitorInterface_wready_m12,
        AxiMonitorInterface_wready_m13,
        AxiMonitorInterface_wready_m14,
        AxiMonitorInterface_wready_m15,
        AxiMonitorInterface_wready_m16,
        AxiMonitorInterface_wready_m17,
        AxiMonitorInterface_wready_m18,
        AxiMonitorInterface_wready_m19,
        AxiMonitorInterface_wready_m20,
        AxiMonitorInterface_wready_m21,
        AxiMonitorInterface_wready_m22,
        AxiMonitorInterface_wready_m23,
        AxiMonitorInterface_wready_m24,
        AxiMonitorInterface_wready_m25,
        AxiMonitorInterface_wready_m26,
        AxiMonitorInterface_wready_m27,
        AxiMonitorInterface_wready_m28,
        AxiMonitorInterface_wready_m29,
        AxiMonitorInterface_wready_m30,
        AxiMonitorInterface_wready_m31,
        AxiMonitorInterface_wsideband_m0,
        AxiMonitorInterface_wsideband_m1,
        AxiMonitorInterface_wsideband_m2,
        AxiMonitorInterface_wsideband_m3,
        AxiMonitorInterface_wsideband_m4,
        AxiMonitorInterface_wsideband_m5,
        AxiMonitorInterface_wsideband_m6,
        AxiMonitorInterface_wsideband_m7,
        AxiMonitorInterface_wsideband_m8,
        AxiMonitorInterface_wsideband_m9,
        AxiMonitorInterface_wsideband_m10,
        AxiMonitorInterface_wsideband_m11,
        AxiMonitorInterface_wsideband_m12,
        AxiMonitorInterface_wsideband_m13,
        AxiMonitorInterface_wsideband_m14,
        AxiMonitorInterface_wsideband_m15,
        AxiMonitorInterface_wsideband_m16,
        AxiMonitorInterface_wsideband_m17,
        AxiMonitorInterface_wsideband_m18,
        AxiMonitorInterface_wsideband_m19,
        AxiMonitorInterface_wsideband_m20,
        AxiMonitorInterface_wsideband_m21,
        AxiMonitorInterface_wsideband_m22,
        AxiMonitorInterface_wsideband_m23,
        AxiMonitorInterface_wsideband_m24,
        AxiMonitorInterface_wsideband_m25,
        AxiMonitorInterface_wsideband_m26,
        AxiMonitorInterface_wsideband_m27,
        AxiMonitorInterface_wsideband_m28,
        AxiMonitorInterface_wsideband_m29,
        AxiMonitorInterface_wsideband_m30,
        AxiMonitorInterface_wsideband_m31,
        AxiMonitorInterface_bvalid_m0,
        AxiMonitorInterface_bvalid_m1,
        AxiMonitorInterface_bvalid_m2,
        AxiMonitorInterface_bvalid_m3,
        AxiMonitorInterface_bvalid_m4,
        AxiMonitorInterface_bvalid_m5,
        AxiMonitorInterface_bvalid_m6,
        AxiMonitorInterface_bvalid_m7,
        AxiMonitorInterface_bvalid_m8,
        AxiMonitorInterface_bvalid_m9,
        AxiMonitorInterface_bvalid_m10,
        AxiMonitorInterface_bvalid_m11,
        AxiMonitorInterface_bvalid_m12,
        AxiMonitorInterface_bvalid_m13,
        AxiMonitorInterface_bvalid_m14,
        AxiMonitorInterface_bvalid_m15,
        AxiMonitorInterface_bvalid_m16,
        AxiMonitorInterface_bvalid_m17,
        AxiMonitorInterface_bvalid_m18,
        AxiMonitorInterface_bvalid_m19,
        AxiMonitorInterface_bvalid_m20,
        AxiMonitorInterface_bvalid_m21,
        AxiMonitorInterface_bvalid_m22,
        AxiMonitorInterface_bvalid_m23,
        AxiMonitorInterface_bvalid_m24,
        AxiMonitorInterface_bvalid_m25,
        AxiMonitorInterface_bvalid_m26,
        AxiMonitorInterface_bvalid_m27,
        AxiMonitorInterface_bvalid_m28,
        AxiMonitorInterface_bvalid_m29,
        AxiMonitorInterface_bvalid_m30,
        AxiMonitorInterface_bvalid_m31,
        AxiMonitorInterface_bresp_m0,
        AxiMonitorInterface_bresp_m1,
        AxiMonitorInterface_bresp_m2,
        AxiMonitorInterface_bresp_m3,
        AxiMonitorInterface_bresp_m4,
        AxiMonitorInterface_bresp_m5,
        AxiMonitorInterface_bresp_m6,
        AxiMonitorInterface_bresp_m7,
        AxiMonitorInterface_bresp_m8,
        AxiMonitorInterface_bresp_m9,
        AxiMonitorInterface_bresp_m10,
        AxiMonitorInterface_bresp_m11,
        AxiMonitorInterface_bresp_m12,
        AxiMonitorInterface_bresp_m13,
        AxiMonitorInterface_bresp_m14,
        AxiMonitorInterface_bresp_m15,
        AxiMonitorInterface_bresp_m16,
        AxiMonitorInterface_bresp_m17,
        AxiMonitorInterface_bresp_m18,
        AxiMonitorInterface_bresp_m19,
        AxiMonitorInterface_bresp_m20,
        AxiMonitorInterface_bresp_m21,
        AxiMonitorInterface_bresp_m22,
        AxiMonitorInterface_bresp_m23,
        AxiMonitorInterface_bresp_m24,
        AxiMonitorInterface_bresp_m25,
        AxiMonitorInterface_bresp_m26,
        AxiMonitorInterface_bresp_m27,
        AxiMonitorInterface_bresp_m28,
        AxiMonitorInterface_bresp_m29,
        AxiMonitorInterface_bresp_m30,
        AxiMonitorInterface_bresp_m31,
        AxiMonitorInterface_bid_m0,
        AxiMonitorInterface_bid_m1,
        AxiMonitorInterface_bid_m2,
        AxiMonitorInterface_bid_m3,
        AxiMonitorInterface_bid_m4,
        AxiMonitorInterface_bid_m5,
        AxiMonitorInterface_bid_m6,
        AxiMonitorInterface_bid_m7,
        AxiMonitorInterface_bid_m8,
        AxiMonitorInterface_bid_m9,
        AxiMonitorInterface_bid_m10,
        AxiMonitorInterface_bid_m11,
        AxiMonitorInterface_bid_m12,
        AxiMonitorInterface_bid_m13,
        AxiMonitorInterface_bid_m14,
        AxiMonitorInterface_bid_m15,
        AxiMonitorInterface_bid_m16,
        AxiMonitorInterface_bid_m17,
        AxiMonitorInterface_bid_m18,
        AxiMonitorInterface_bid_m19,
        AxiMonitorInterface_bid_m20,
        AxiMonitorInterface_bid_m21,
        AxiMonitorInterface_bid_m22,
        AxiMonitorInterface_bid_m23,
        AxiMonitorInterface_bid_m24,
        AxiMonitorInterface_bid_m25,
        AxiMonitorInterface_bid_m26,
        AxiMonitorInterface_bid_m27,
        AxiMonitorInterface_bid_m28,
        AxiMonitorInterface_bid_m29,
        AxiMonitorInterface_bid_m30,
        AxiMonitorInterface_bid_m31,
        AxiMonitorInterface_bready_m0,
        AxiMonitorInterface_bready_m1,
        AxiMonitorInterface_bready_m2,
        AxiMonitorInterface_bready_m3,
        AxiMonitorInterface_bready_m4,
        AxiMonitorInterface_bready_m5,
        AxiMonitorInterface_bready_m6,
        AxiMonitorInterface_bready_m7,
        AxiMonitorInterface_bready_m8,
        AxiMonitorInterface_bready_m9,
        AxiMonitorInterface_bready_m10,
        AxiMonitorInterface_bready_m11,
        AxiMonitorInterface_bready_m12,
        AxiMonitorInterface_bready_m13,
        AxiMonitorInterface_bready_m14,
        AxiMonitorInterface_bready_m15,
        AxiMonitorInterface_bready_m16,
        AxiMonitorInterface_bready_m17,
        AxiMonitorInterface_bready_m18,
        AxiMonitorInterface_bready_m19,
        AxiMonitorInterface_bready_m20,
        AxiMonitorInterface_bready_m21,
        AxiMonitorInterface_bready_m22,
        AxiMonitorInterface_bready_m23,
        AxiMonitorInterface_bready_m24,
        AxiMonitorInterface_bready_m25,
        AxiMonitorInterface_bready_m26,
        AxiMonitorInterface_bready_m27,
        AxiMonitorInterface_bready_m28,
        AxiMonitorInterface_bready_m29,
        AxiMonitorInterface_bready_m30,
        AxiMonitorInterface_bready_m31,
        AxiMonitorInterface_bsideband_m0,
        AxiMonitorInterface_bsideband_m1,
        AxiMonitorInterface_bsideband_m2,
        AxiMonitorInterface_bsideband_m3,
        AxiMonitorInterface_bsideband_m4,
        AxiMonitorInterface_bsideband_m5,
        AxiMonitorInterface_bsideband_m6,
        AxiMonitorInterface_bsideband_m7,
        AxiMonitorInterface_bsideband_m8,
        AxiMonitorInterface_bsideband_m9,
        AxiMonitorInterface_bsideband_m10,
        AxiMonitorInterface_bsideband_m11,
        AxiMonitorInterface_bsideband_m12,
        AxiMonitorInterface_bsideband_m13,
        AxiMonitorInterface_bsideband_m14,
        AxiMonitorInterface_bsideband_m15,
        AxiMonitorInterface_bsideband_m16,
        AxiMonitorInterface_bsideband_m17,
        AxiMonitorInterface_bsideband_m18,
        AxiMonitorInterface_bsideband_m19,
        AxiMonitorInterface_bsideband_m20,
        AxiMonitorInterface_bsideband_m21,
        AxiMonitorInterface_bsideband_m22,
        AxiMonitorInterface_bsideband_m23,
        AxiMonitorInterface_bsideband_m24,
        AxiMonitorInterface_bsideband_m25,
        AxiMonitorInterface_bsideband_m26,
        AxiMonitorInterface_bsideband_m27,
        AxiMonitorInterface_bsideband_m28,
        AxiMonitorInterface_bsideband_m29,
        AxiMonitorInterface_bsideband_m30,
        AxiMonitorInterface_bsideband_m31,
        AxiMonitorInterface_cactive_m0,
        AxiMonitorInterface_cactive_m1,
        AxiMonitorInterface_cactive_m2,
        AxiMonitorInterface_cactive_m3,
        AxiMonitorInterface_cactive_m4,
        AxiMonitorInterface_cactive_m5,
        AxiMonitorInterface_cactive_m6,
        AxiMonitorInterface_cactive_m7,
        AxiMonitorInterface_cactive_m8,
        AxiMonitorInterface_cactive_m9,
        AxiMonitorInterface_cactive_m10,
        AxiMonitorInterface_cactive_m11,
        AxiMonitorInterface_cactive_m12,
        AxiMonitorInterface_cactive_m13,
        AxiMonitorInterface_cactive_m14,
        AxiMonitorInterface_cactive_m15,
        AxiMonitorInterface_cactive_m16,
        AxiMonitorInterface_cactive_m17,
        AxiMonitorInterface_cactive_m18,
        AxiMonitorInterface_cactive_m19,
        AxiMonitorInterface_cactive_m20,
        AxiMonitorInterface_cactive_m21,
        AxiMonitorInterface_cactive_m22,
        AxiMonitorInterface_cactive_m23,
        AxiMonitorInterface_cactive_m24,
        AxiMonitorInterface_cactive_m25,
        AxiMonitorInterface_cactive_m26,
        AxiMonitorInterface_cactive_m27,
        AxiMonitorInterface_cactive_m28,
        AxiMonitorInterface_cactive_m29,
        AxiMonitorInterface_cactive_m30,
        AxiMonitorInterface_cactive_m31,
        AxiMonitorInterface_csysreq_m0,
        AxiMonitorInterface_csysreq_m1,
        AxiMonitorInterface_csysreq_m2,
        AxiMonitorInterface_csysreq_m3,
        AxiMonitorInterface_csysreq_m4,
        AxiMonitorInterface_csysreq_m5,
        AxiMonitorInterface_csysreq_m6,
        AxiMonitorInterface_csysreq_m7,
        AxiMonitorInterface_csysreq_m8,
        AxiMonitorInterface_csysreq_m9,
        AxiMonitorInterface_csysreq_m10,
        AxiMonitorInterface_csysreq_m11,
        AxiMonitorInterface_csysreq_m12,
        AxiMonitorInterface_csysreq_m13,
        AxiMonitorInterface_csysreq_m14,
        AxiMonitorInterface_csysreq_m15,
        AxiMonitorInterface_csysreq_m16,
        AxiMonitorInterface_csysreq_m17,
        AxiMonitorInterface_csysreq_m18,
        AxiMonitorInterface_csysreq_m19,
        AxiMonitorInterface_csysreq_m20,
        AxiMonitorInterface_csysreq_m21,
        AxiMonitorInterface_csysreq_m22,
        AxiMonitorInterface_csysreq_m23,
        AxiMonitorInterface_csysreq_m24,
        AxiMonitorInterface_csysreq_m25,
        AxiMonitorInterface_csysreq_m26,
        AxiMonitorInterface_csysreq_m27,
        AxiMonitorInterface_csysreq_m28,
        AxiMonitorInterface_csysreq_m29,
        AxiMonitorInterface_csysreq_m30,
        AxiMonitorInterface_csysreq_m31,
        AxiMonitorInterface_csysack_m0,
        AxiMonitorInterface_csysack_m1,
        AxiMonitorInterface_csysack_m2,
        AxiMonitorInterface_csysack_m3,
        AxiMonitorInterface_csysack_m4,
        AxiMonitorInterface_csysack_m5,
        AxiMonitorInterface_csysack_m6,
        AxiMonitorInterface_csysack_m7,
        AxiMonitorInterface_csysack_m8,
        AxiMonitorInterface_csysack_m9,
        AxiMonitorInterface_csysack_m10,
        AxiMonitorInterface_csysack_m11,
        AxiMonitorInterface_csysack_m12,
        AxiMonitorInterface_csysack_m13,
        AxiMonitorInterface_csysack_m14,
        AxiMonitorInterface_csysack_m15,
        AxiMonitorInterface_csysack_m16,
        AxiMonitorInterface_csysack_m17,
        AxiMonitorInterface_csysack_m18,
        AxiMonitorInterface_csysack_m19,
        AxiMonitorInterface_csysack_m20,
        AxiMonitorInterface_csysack_m21,
        AxiMonitorInterface_csysack_m22,
        AxiMonitorInterface_csysack_m23,
        AxiMonitorInterface_csysack_m24,
        AxiMonitorInterface_csysack_m25,
        AxiMonitorInterface_csysack_m26,
        AxiMonitorInterface_csysack_m27,
        AxiMonitorInterface_csysack_m28,
        AxiMonitorInterface_csysack_m29,
        AxiMonitorInterface_csysack_m30,
        AxiMonitorInterface_csysack_m31,
        AxiMonitorInterface_arvalid_s0,
        AxiMonitorInterface_arvalid_s1,
        AxiMonitorInterface_arvalid_s2,
        AxiMonitorInterface_arvalid_s3,
        AxiMonitorInterface_arvalid_s4,
        AxiMonitorInterface_arvalid_s5,
        AxiMonitorInterface_arvalid_s6,
        AxiMonitorInterface_arvalid_s7,
        AxiMonitorInterface_arvalid_s8,
        AxiMonitorInterface_arvalid_s9,
        AxiMonitorInterface_arvalid_s10,
        AxiMonitorInterface_arvalid_s11,
        AxiMonitorInterface_arvalid_s12,
        AxiMonitorInterface_arvalid_s13,
        AxiMonitorInterface_arvalid_s14,
        AxiMonitorInterface_arvalid_s15,
        AxiMonitorInterface_arvalid_s16,
        AxiMonitorInterface_arvalid_s17,
        AxiMonitorInterface_arvalid_s18,
        AxiMonitorInterface_arvalid_s19,
        AxiMonitorInterface_arvalid_s20,
        AxiMonitorInterface_arvalid_s21,
        AxiMonitorInterface_arvalid_s22,
        AxiMonitorInterface_arvalid_s23,
        AxiMonitorInterface_arvalid_s24,
        AxiMonitorInterface_arvalid_s25,
        AxiMonitorInterface_arvalid_s26,
        AxiMonitorInterface_arvalid_s27,
        AxiMonitorInterface_arvalid_s28,
        AxiMonitorInterface_arvalid_s29,
        AxiMonitorInterface_arvalid_s30,
        AxiMonitorInterface_arvalid_s31,
        AxiMonitorInterface_araddr_s0,
        AxiMonitorInterface_araddr_s1,
        AxiMonitorInterface_araddr_s2,
        AxiMonitorInterface_araddr_s3,
        AxiMonitorInterface_araddr_s4,
        AxiMonitorInterface_araddr_s5,
        AxiMonitorInterface_araddr_s6,
        AxiMonitorInterface_araddr_s7,
        AxiMonitorInterface_araddr_s8,
        AxiMonitorInterface_araddr_s9,
        AxiMonitorInterface_araddr_s10,
        AxiMonitorInterface_araddr_s11,
        AxiMonitorInterface_araddr_s12,
        AxiMonitorInterface_araddr_s13,
        AxiMonitorInterface_araddr_s14,
        AxiMonitorInterface_araddr_s15,
        AxiMonitorInterface_araddr_s16,
        AxiMonitorInterface_araddr_s17,
        AxiMonitorInterface_araddr_s18,
        AxiMonitorInterface_araddr_s19,
        AxiMonitorInterface_araddr_s20,
        AxiMonitorInterface_araddr_s21,
        AxiMonitorInterface_araddr_s22,
        AxiMonitorInterface_araddr_s23,
        AxiMonitorInterface_araddr_s24,
        AxiMonitorInterface_araddr_s25,
        AxiMonitorInterface_araddr_s26,
        AxiMonitorInterface_araddr_s27,
        AxiMonitorInterface_araddr_s28,
        AxiMonitorInterface_araddr_s29,
        AxiMonitorInterface_araddr_s30,
        AxiMonitorInterface_araddr_s31,
        AxiMonitorInterface_arlen_s0,
        AxiMonitorInterface_arlen_s1,
        AxiMonitorInterface_arlen_s2,
        AxiMonitorInterface_arlen_s3,
        AxiMonitorInterface_arlen_s4,
        AxiMonitorInterface_arlen_s5,
        AxiMonitorInterface_arlen_s6,
        AxiMonitorInterface_arlen_s7,
        AxiMonitorInterface_arlen_s8,
        AxiMonitorInterface_arlen_s9,
        AxiMonitorInterface_arlen_s10,
        AxiMonitorInterface_arlen_s11,
        AxiMonitorInterface_arlen_s12,
        AxiMonitorInterface_arlen_s13,
        AxiMonitorInterface_arlen_s14,
        AxiMonitorInterface_arlen_s15,
        AxiMonitorInterface_arlen_s16,
        AxiMonitorInterface_arlen_s17,
        AxiMonitorInterface_arlen_s18,
        AxiMonitorInterface_arlen_s19,
        AxiMonitorInterface_arlen_s20,
        AxiMonitorInterface_arlen_s21,
        AxiMonitorInterface_arlen_s22,
        AxiMonitorInterface_arlen_s23,
        AxiMonitorInterface_arlen_s24,
        AxiMonitorInterface_arlen_s25,
        AxiMonitorInterface_arlen_s26,
        AxiMonitorInterface_arlen_s27,
        AxiMonitorInterface_arlen_s28,
        AxiMonitorInterface_arlen_s29,
        AxiMonitorInterface_arlen_s30,
        AxiMonitorInterface_arlen_s31,
        AxiMonitorInterface_arsize_s0,
        AxiMonitorInterface_arsize_s1,
        AxiMonitorInterface_arsize_s2,
        AxiMonitorInterface_arsize_s3,
        AxiMonitorInterface_arsize_s4,
        AxiMonitorInterface_arsize_s5,
        AxiMonitorInterface_arsize_s6,
        AxiMonitorInterface_arsize_s7,
        AxiMonitorInterface_arsize_s8,
        AxiMonitorInterface_arsize_s9,
        AxiMonitorInterface_arsize_s10,
        AxiMonitorInterface_arsize_s11,
        AxiMonitorInterface_arsize_s12,
        AxiMonitorInterface_arsize_s13,
        AxiMonitorInterface_arsize_s14,
        AxiMonitorInterface_arsize_s15,
        AxiMonitorInterface_arsize_s16,
        AxiMonitorInterface_arsize_s17,
        AxiMonitorInterface_arsize_s18,
        AxiMonitorInterface_arsize_s19,
        AxiMonitorInterface_arsize_s20,
        AxiMonitorInterface_arsize_s21,
        AxiMonitorInterface_arsize_s22,
        AxiMonitorInterface_arsize_s23,
        AxiMonitorInterface_arsize_s24,
        AxiMonitorInterface_arsize_s25,
        AxiMonitorInterface_arsize_s26,
        AxiMonitorInterface_arsize_s27,
        AxiMonitorInterface_arsize_s28,
        AxiMonitorInterface_arsize_s29,
        AxiMonitorInterface_arsize_s30,
        AxiMonitorInterface_arsize_s31,
        AxiMonitorInterface_arburst_s0,
        AxiMonitorInterface_arburst_s1,
        AxiMonitorInterface_arburst_s2,
        AxiMonitorInterface_arburst_s3,
        AxiMonitorInterface_arburst_s4,
        AxiMonitorInterface_arburst_s5,
        AxiMonitorInterface_arburst_s6,
        AxiMonitorInterface_arburst_s7,
        AxiMonitorInterface_arburst_s8,
        AxiMonitorInterface_arburst_s9,
        AxiMonitorInterface_arburst_s10,
        AxiMonitorInterface_arburst_s11,
        AxiMonitorInterface_arburst_s12,
        AxiMonitorInterface_arburst_s13,
        AxiMonitorInterface_arburst_s14,
        AxiMonitorInterface_arburst_s15,
        AxiMonitorInterface_arburst_s16,
        AxiMonitorInterface_arburst_s17,
        AxiMonitorInterface_arburst_s18,
        AxiMonitorInterface_arburst_s19,
        AxiMonitorInterface_arburst_s20,
        AxiMonitorInterface_arburst_s21,
        AxiMonitorInterface_arburst_s22,
        AxiMonitorInterface_arburst_s23,
        AxiMonitorInterface_arburst_s24,
        AxiMonitorInterface_arburst_s25,
        AxiMonitorInterface_arburst_s26,
        AxiMonitorInterface_arburst_s27,
        AxiMonitorInterface_arburst_s28,
        AxiMonitorInterface_arburst_s29,
        AxiMonitorInterface_arburst_s30,
        AxiMonitorInterface_arburst_s31,
        AxiMonitorInterface_arlock_s0,
        AxiMonitorInterface_arlock_s1,
        AxiMonitorInterface_arlock_s2,
        AxiMonitorInterface_arlock_s3,
        AxiMonitorInterface_arlock_s4,
        AxiMonitorInterface_arlock_s5,
        AxiMonitorInterface_arlock_s6,
        AxiMonitorInterface_arlock_s7,
        AxiMonitorInterface_arlock_s8,
        AxiMonitorInterface_arlock_s9,
        AxiMonitorInterface_arlock_s10,
        AxiMonitorInterface_arlock_s11,
        AxiMonitorInterface_arlock_s12,
        AxiMonitorInterface_arlock_s13,
        AxiMonitorInterface_arlock_s14,
        AxiMonitorInterface_arlock_s15,
        AxiMonitorInterface_arlock_s16,
        AxiMonitorInterface_arlock_s17,
        AxiMonitorInterface_arlock_s18,
        AxiMonitorInterface_arlock_s19,
        AxiMonitorInterface_arlock_s20,
        AxiMonitorInterface_arlock_s21,
        AxiMonitorInterface_arlock_s22,
        AxiMonitorInterface_arlock_s23,
        AxiMonitorInterface_arlock_s24,
        AxiMonitorInterface_arlock_s25,
        AxiMonitorInterface_arlock_s26,
        AxiMonitorInterface_arlock_s27,
        AxiMonitorInterface_arlock_s28,
        AxiMonitorInterface_arlock_s29,
        AxiMonitorInterface_arlock_s30,
        AxiMonitorInterface_arlock_s31,
        AxiMonitorInterface_arcache_s0,
        AxiMonitorInterface_arcache_s1,
        AxiMonitorInterface_arcache_s2,
        AxiMonitorInterface_arcache_s3,
        AxiMonitorInterface_arcache_s4,
        AxiMonitorInterface_arcache_s5,
        AxiMonitorInterface_arcache_s6,
        AxiMonitorInterface_arcache_s7,
        AxiMonitorInterface_arcache_s8,
        AxiMonitorInterface_arcache_s9,
        AxiMonitorInterface_arcache_s10,
        AxiMonitorInterface_arcache_s11,
        AxiMonitorInterface_arcache_s12,
        AxiMonitorInterface_arcache_s13,
        AxiMonitorInterface_arcache_s14,
        AxiMonitorInterface_arcache_s15,
        AxiMonitorInterface_arcache_s16,
        AxiMonitorInterface_arcache_s17,
        AxiMonitorInterface_arcache_s18,
        AxiMonitorInterface_arcache_s19,
        AxiMonitorInterface_arcache_s20,
        AxiMonitorInterface_arcache_s21,
        AxiMonitorInterface_arcache_s22,
        AxiMonitorInterface_arcache_s23,
        AxiMonitorInterface_arcache_s24,
        AxiMonitorInterface_arcache_s25,
        AxiMonitorInterface_arcache_s26,
        AxiMonitorInterface_arcache_s27,
        AxiMonitorInterface_arcache_s28,
        AxiMonitorInterface_arcache_s29,
        AxiMonitorInterface_arcache_s30,
        AxiMonitorInterface_arcache_s31,
        AxiMonitorInterface_arprot_s0,
        AxiMonitorInterface_arprot_s1,
        AxiMonitorInterface_arprot_s2,
        AxiMonitorInterface_arprot_s3,
        AxiMonitorInterface_arprot_s4,
        AxiMonitorInterface_arprot_s5,
        AxiMonitorInterface_arprot_s6,
        AxiMonitorInterface_arprot_s7,
        AxiMonitorInterface_arprot_s8,
        AxiMonitorInterface_arprot_s9,
        AxiMonitorInterface_arprot_s10,
        AxiMonitorInterface_arprot_s11,
        AxiMonitorInterface_arprot_s12,
        AxiMonitorInterface_arprot_s13,
        AxiMonitorInterface_arprot_s14,
        AxiMonitorInterface_arprot_s15,
        AxiMonitorInterface_arprot_s16,
        AxiMonitorInterface_arprot_s17,
        AxiMonitorInterface_arprot_s18,
        AxiMonitorInterface_arprot_s19,
        AxiMonitorInterface_arprot_s20,
        AxiMonitorInterface_arprot_s21,
        AxiMonitorInterface_arprot_s22,
        AxiMonitorInterface_arprot_s23,
        AxiMonitorInterface_arprot_s24,
        AxiMonitorInterface_arprot_s25,
        AxiMonitorInterface_arprot_s26,
        AxiMonitorInterface_arprot_s27,
        AxiMonitorInterface_arprot_s28,
        AxiMonitorInterface_arprot_s29,
        AxiMonitorInterface_arprot_s30,
        AxiMonitorInterface_arprot_s31,
        AxiMonitorInterface_arid_s0,
        AxiMonitorInterface_arid_s1,
        AxiMonitorInterface_arid_s2,
        AxiMonitorInterface_arid_s3,
        AxiMonitorInterface_arid_s4,
        AxiMonitorInterface_arid_s5,
        AxiMonitorInterface_arid_s6,
        AxiMonitorInterface_arid_s7,
        AxiMonitorInterface_arid_s8,
        AxiMonitorInterface_arid_s9,
        AxiMonitorInterface_arid_s10,
        AxiMonitorInterface_arid_s11,
        AxiMonitorInterface_arid_s12,
        AxiMonitorInterface_arid_s13,
        AxiMonitorInterface_arid_s14,
        AxiMonitorInterface_arid_s15,
        AxiMonitorInterface_arid_s16,
        AxiMonitorInterface_arid_s17,
        AxiMonitorInterface_arid_s18,
        AxiMonitorInterface_arid_s19,
        AxiMonitorInterface_arid_s20,
        AxiMonitorInterface_arid_s21,
        AxiMonitorInterface_arid_s22,
        AxiMonitorInterface_arid_s23,
        AxiMonitorInterface_arid_s24,
        AxiMonitorInterface_arid_s25,
        AxiMonitorInterface_arid_s26,
        AxiMonitorInterface_arid_s27,
        AxiMonitorInterface_arid_s28,
        AxiMonitorInterface_arid_s29,
        AxiMonitorInterface_arid_s30,
        AxiMonitorInterface_arid_s31,
        AxiMonitorInterface_arready_s0,
        AxiMonitorInterface_arready_s1,
        AxiMonitorInterface_arready_s2,
        AxiMonitorInterface_arready_s3,
        AxiMonitorInterface_arready_s4,
        AxiMonitorInterface_arready_s5,
        AxiMonitorInterface_arready_s6,
        AxiMonitorInterface_arready_s7,
        AxiMonitorInterface_arready_s8,
        AxiMonitorInterface_arready_s9,
        AxiMonitorInterface_arready_s10,
        AxiMonitorInterface_arready_s11,
        AxiMonitorInterface_arready_s12,
        AxiMonitorInterface_arready_s13,
        AxiMonitorInterface_arready_s14,
        AxiMonitorInterface_arready_s15,
        AxiMonitorInterface_arready_s16,
        AxiMonitorInterface_arready_s17,
        AxiMonitorInterface_arready_s18,
        AxiMonitorInterface_arready_s19,
        AxiMonitorInterface_arready_s20,
        AxiMonitorInterface_arready_s21,
        AxiMonitorInterface_arready_s22,
        AxiMonitorInterface_arready_s23,
        AxiMonitorInterface_arready_s24,
        AxiMonitorInterface_arready_s25,
        AxiMonitorInterface_arready_s26,
        AxiMonitorInterface_arready_s27,
        AxiMonitorInterface_arready_s28,
        AxiMonitorInterface_arready_s29,
        AxiMonitorInterface_arready_s30,
        AxiMonitorInterface_arready_s31,
        AxiMonitorInterface_arsideband_s0,
        AxiMonitorInterface_arsideband_s1,
        AxiMonitorInterface_arsideband_s2,
        AxiMonitorInterface_arsideband_s3,
        AxiMonitorInterface_arsideband_s4,
        AxiMonitorInterface_arsideband_s5,
        AxiMonitorInterface_arsideband_s6,
        AxiMonitorInterface_arsideband_s7,
        AxiMonitorInterface_arsideband_s8,
        AxiMonitorInterface_arsideband_s9,
        AxiMonitorInterface_arsideband_s10,
        AxiMonitorInterface_arsideband_s11,
        AxiMonitorInterface_arsideband_s12,
        AxiMonitorInterface_arsideband_s13,
        AxiMonitorInterface_arsideband_s14,
        AxiMonitorInterface_arsideband_s15,
        AxiMonitorInterface_arsideband_s16,
        AxiMonitorInterface_arsideband_s17,
        AxiMonitorInterface_arsideband_s18,
        AxiMonitorInterface_arsideband_s19,
        AxiMonitorInterface_arsideband_s20,
        AxiMonitorInterface_arsideband_s21,
        AxiMonitorInterface_arsideband_s22,
        AxiMonitorInterface_arsideband_s23,
        AxiMonitorInterface_arsideband_s24,
        AxiMonitorInterface_arsideband_s25,
        AxiMonitorInterface_arsideband_s26,
        AxiMonitorInterface_arsideband_s27,
        AxiMonitorInterface_arsideband_s28,
        AxiMonitorInterface_arsideband_s29,
        AxiMonitorInterface_arsideband_s30,
        AxiMonitorInterface_arsideband_s31,
        AxiMonitorInterface_awvalid_s0,
        AxiMonitorInterface_awvalid_s1,
        AxiMonitorInterface_awvalid_s2,
        AxiMonitorInterface_awvalid_s3,
        AxiMonitorInterface_awvalid_s4,
        AxiMonitorInterface_awvalid_s5,
        AxiMonitorInterface_awvalid_s6,
        AxiMonitorInterface_awvalid_s7,
        AxiMonitorInterface_awvalid_s8,
        AxiMonitorInterface_awvalid_s9,
        AxiMonitorInterface_awvalid_s10,
        AxiMonitorInterface_awvalid_s11,
        AxiMonitorInterface_awvalid_s12,
        AxiMonitorInterface_awvalid_s13,
        AxiMonitorInterface_awvalid_s14,
        AxiMonitorInterface_awvalid_s15,
        AxiMonitorInterface_awvalid_s16,
        AxiMonitorInterface_awvalid_s17,
        AxiMonitorInterface_awvalid_s18,
        AxiMonitorInterface_awvalid_s19,
        AxiMonitorInterface_awvalid_s20,
        AxiMonitorInterface_awvalid_s21,
        AxiMonitorInterface_awvalid_s22,
        AxiMonitorInterface_awvalid_s23,
        AxiMonitorInterface_awvalid_s24,
        AxiMonitorInterface_awvalid_s25,
        AxiMonitorInterface_awvalid_s26,
        AxiMonitorInterface_awvalid_s27,
        AxiMonitorInterface_awvalid_s28,
        AxiMonitorInterface_awvalid_s29,
        AxiMonitorInterface_awvalid_s30,
        AxiMonitorInterface_awvalid_s31,
        AxiMonitorInterface_awaddr_s0,
        AxiMonitorInterface_awaddr_s1,
        AxiMonitorInterface_awaddr_s2,
        AxiMonitorInterface_awaddr_s3,
        AxiMonitorInterface_awaddr_s4,
        AxiMonitorInterface_awaddr_s5,
        AxiMonitorInterface_awaddr_s6,
        AxiMonitorInterface_awaddr_s7,
        AxiMonitorInterface_awaddr_s8,
        AxiMonitorInterface_awaddr_s9,
        AxiMonitorInterface_awaddr_s10,
        AxiMonitorInterface_awaddr_s11,
        AxiMonitorInterface_awaddr_s12,
        AxiMonitorInterface_awaddr_s13,
        AxiMonitorInterface_awaddr_s14,
        AxiMonitorInterface_awaddr_s15,
        AxiMonitorInterface_awaddr_s16,
        AxiMonitorInterface_awaddr_s17,
        AxiMonitorInterface_awaddr_s18,
        AxiMonitorInterface_awaddr_s19,
        AxiMonitorInterface_awaddr_s20,
        AxiMonitorInterface_awaddr_s21,
        AxiMonitorInterface_awaddr_s22,
        AxiMonitorInterface_awaddr_s23,
        AxiMonitorInterface_awaddr_s24,
        AxiMonitorInterface_awaddr_s25,
        AxiMonitorInterface_awaddr_s26,
        AxiMonitorInterface_awaddr_s27,
        AxiMonitorInterface_awaddr_s28,
        AxiMonitorInterface_awaddr_s29,
        AxiMonitorInterface_awaddr_s30,
        AxiMonitorInterface_awaddr_s31,
        AxiMonitorInterface_awlen_s0,
        AxiMonitorInterface_awlen_s1,
        AxiMonitorInterface_awlen_s2,
        AxiMonitorInterface_awlen_s3,
        AxiMonitorInterface_awlen_s4,
        AxiMonitorInterface_awlen_s5,
        AxiMonitorInterface_awlen_s6,
        AxiMonitorInterface_awlen_s7,
        AxiMonitorInterface_awlen_s8,
        AxiMonitorInterface_awlen_s9,
        AxiMonitorInterface_awlen_s10,
        AxiMonitorInterface_awlen_s11,
        AxiMonitorInterface_awlen_s12,
        AxiMonitorInterface_awlen_s13,
        AxiMonitorInterface_awlen_s14,
        AxiMonitorInterface_awlen_s15,
        AxiMonitorInterface_awlen_s16,
        AxiMonitorInterface_awlen_s17,
        AxiMonitorInterface_awlen_s18,
        AxiMonitorInterface_awlen_s19,
        AxiMonitorInterface_awlen_s20,
        AxiMonitorInterface_awlen_s21,
        AxiMonitorInterface_awlen_s22,
        AxiMonitorInterface_awlen_s23,
        AxiMonitorInterface_awlen_s24,
        AxiMonitorInterface_awlen_s25,
        AxiMonitorInterface_awlen_s26,
        AxiMonitorInterface_awlen_s27,
        AxiMonitorInterface_awlen_s28,
        AxiMonitorInterface_awlen_s29,
        AxiMonitorInterface_awlen_s30,
        AxiMonitorInterface_awlen_s31,
        AxiMonitorInterface_awsize_s0,
        AxiMonitorInterface_awsize_s1,
        AxiMonitorInterface_awsize_s2,
        AxiMonitorInterface_awsize_s3,
        AxiMonitorInterface_awsize_s4,
        AxiMonitorInterface_awsize_s5,
        AxiMonitorInterface_awsize_s6,
        AxiMonitorInterface_awsize_s7,
        AxiMonitorInterface_awsize_s8,
        AxiMonitorInterface_awsize_s9,
        AxiMonitorInterface_awsize_s10,
        AxiMonitorInterface_awsize_s11,
        AxiMonitorInterface_awsize_s12,
        AxiMonitorInterface_awsize_s13,
        AxiMonitorInterface_awsize_s14,
        AxiMonitorInterface_awsize_s15,
        AxiMonitorInterface_awsize_s16,
        AxiMonitorInterface_awsize_s17,
        AxiMonitorInterface_awsize_s18,
        AxiMonitorInterface_awsize_s19,
        AxiMonitorInterface_awsize_s20,
        AxiMonitorInterface_awsize_s21,
        AxiMonitorInterface_awsize_s22,
        AxiMonitorInterface_awsize_s23,
        AxiMonitorInterface_awsize_s24,
        AxiMonitorInterface_awsize_s25,
        AxiMonitorInterface_awsize_s26,
        AxiMonitorInterface_awsize_s27,
        AxiMonitorInterface_awsize_s28,
        AxiMonitorInterface_awsize_s29,
        AxiMonitorInterface_awsize_s30,
        AxiMonitorInterface_awsize_s31,
        AxiMonitorInterface_awburst_s0,
        AxiMonitorInterface_awburst_s1,
        AxiMonitorInterface_awburst_s2,
        AxiMonitorInterface_awburst_s3,
        AxiMonitorInterface_awburst_s4,
        AxiMonitorInterface_awburst_s5,
        AxiMonitorInterface_awburst_s6,
        AxiMonitorInterface_awburst_s7,
        AxiMonitorInterface_awburst_s8,
        AxiMonitorInterface_awburst_s9,
        AxiMonitorInterface_awburst_s10,
        AxiMonitorInterface_awburst_s11,
        AxiMonitorInterface_awburst_s12,
        AxiMonitorInterface_awburst_s13,
        AxiMonitorInterface_awburst_s14,
        AxiMonitorInterface_awburst_s15,
        AxiMonitorInterface_awburst_s16,
        AxiMonitorInterface_awburst_s17,
        AxiMonitorInterface_awburst_s18,
        AxiMonitorInterface_awburst_s19,
        AxiMonitorInterface_awburst_s20,
        AxiMonitorInterface_awburst_s21,
        AxiMonitorInterface_awburst_s22,
        AxiMonitorInterface_awburst_s23,
        AxiMonitorInterface_awburst_s24,
        AxiMonitorInterface_awburst_s25,
        AxiMonitorInterface_awburst_s26,
        AxiMonitorInterface_awburst_s27,
        AxiMonitorInterface_awburst_s28,
        AxiMonitorInterface_awburst_s29,
        AxiMonitorInterface_awburst_s30,
        AxiMonitorInterface_awburst_s31,
        AxiMonitorInterface_awlock_s0,
        AxiMonitorInterface_awlock_s1,
        AxiMonitorInterface_awlock_s2,
        AxiMonitorInterface_awlock_s3,
        AxiMonitorInterface_awlock_s4,
        AxiMonitorInterface_awlock_s5,
        AxiMonitorInterface_awlock_s6,
        AxiMonitorInterface_awlock_s7,
        AxiMonitorInterface_awlock_s8,
        AxiMonitorInterface_awlock_s9,
        AxiMonitorInterface_awlock_s10,
        AxiMonitorInterface_awlock_s11,
        AxiMonitorInterface_awlock_s12,
        AxiMonitorInterface_awlock_s13,
        AxiMonitorInterface_awlock_s14,
        AxiMonitorInterface_awlock_s15,
        AxiMonitorInterface_awlock_s16,
        AxiMonitorInterface_awlock_s17,
        AxiMonitorInterface_awlock_s18,
        AxiMonitorInterface_awlock_s19,
        AxiMonitorInterface_awlock_s20,
        AxiMonitorInterface_awlock_s21,
        AxiMonitorInterface_awlock_s22,
        AxiMonitorInterface_awlock_s23,
        AxiMonitorInterface_awlock_s24,
        AxiMonitorInterface_awlock_s25,
        AxiMonitorInterface_awlock_s26,
        AxiMonitorInterface_awlock_s27,
        AxiMonitorInterface_awlock_s28,
        AxiMonitorInterface_awlock_s29,
        AxiMonitorInterface_awlock_s30,
        AxiMonitorInterface_awlock_s31,
        AxiMonitorInterface_awcache_s0,
        AxiMonitorInterface_awcache_s1,
        AxiMonitorInterface_awcache_s2,
        AxiMonitorInterface_awcache_s3,
        AxiMonitorInterface_awcache_s4,
        AxiMonitorInterface_awcache_s5,
        AxiMonitorInterface_awcache_s6,
        AxiMonitorInterface_awcache_s7,
        AxiMonitorInterface_awcache_s8,
        AxiMonitorInterface_awcache_s9,
        AxiMonitorInterface_awcache_s10,
        AxiMonitorInterface_awcache_s11,
        AxiMonitorInterface_awcache_s12,
        AxiMonitorInterface_awcache_s13,
        AxiMonitorInterface_awcache_s14,
        AxiMonitorInterface_awcache_s15,
        AxiMonitorInterface_awcache_s16,
        AxiMonitorInterface_awcache_s17,
        AxiMonitorInterface_awcache_s18,
        AxiMonitorInterface_awcache_s19,
        AxiMonitorInterface_awcache_s20,
        AxiMonitorInterface_awcache_s21,
        AxiMonitorInterface_awcache_s22,
        AxiMonitorInterface_awcache_s23,
        AxiMonitorInterface_awcache_s24,
        AxiMonitorInterface_awcache_s25,
        AxiMonitorInterface_awcache_s26,
        AxiMonitorInterface_awcache_s27,
        AxiMonitorInterface_awcache_s28,
        AxiMonitorInterface_awcache_s29,
        AxiMonitorInterface_awcache_s30,
        AxiMonitorInterface_awcache_s31,
        AxiMonitorInterface_awprot_s0,
        AxiMonitorInterface_awprot_s1,
        AxiMonitorInterface_awprot_s2,
        AxiMonitorInterface_awprot_s3,
        AxiMonitorInterface_awprot_s4,
        AxiMonitorInterface_awprot_s5,
        AxiMonitorInterface_awprot_s6,
        AxiMonitorInterface_awprot_s7,
        AxiMonitorInterface_awprot_s8,
        AxiMonitorInterface_awprot_s9,
        AxiMonitorInterface_awprot_s10,
        AxiMonitorInterface_awprot_s11,
        AxiMonitorInterface_awprot_s12,
        AxiMonitorInterface_awprot_s13,
        AxiMonitorInterface_awprot_s14,
        AxiMonitorInterface_awprot_s15,
        AxiMonitorInterface_awprot_s16,
        AxiMonitorInterface_awprot_s17,
        AxiMonitorInterface_awprot_s18,
        AxiMonitorInterface_awprot_s19,
        AxiMonitorInterface_awprot_s20,
        AxiMonitorInterface_awprot_s21,
        AxiMonitorInterface_awprot_s22,
        AxiMonitorInterface_awprot_s23,
        AxiMonitorInterface_awprot_s24,
        AxiMonitorInterface_awprot_s25,
        AxiMonitorInterface_awprot_s26,
        AxiMonitorInterface_awprot_s27,
        AxiMonitorInterface_awprot_s28,
        AxiMonitorInterface_awprot_s29,
        AxiMonitorInterface_awprot_s30,
        AxiMonitorInterface_awprot_s31,
        AxiMonitorInterface_awid_s0,
        AxiMonitorInterface_awid_s1,
        AxiMonitorInterface_awid_s2,
        AxiMonitorInterface_awid_s3,
        AxiMonitorInterface_awid_s4,
        AxiMonitorInterface_awid_s5,
        AxiMonitorInterface_awid_s6,
        AxiMonitorInterface_awid_s7,
        AxiMonitorInterface_awid_s8,
        AxiMonitorInterface_awid_s9,
        AxiMonitorInterface_awid_s10,
        AxiMonitorInterface_awid_s11,
        AxiMonitorInterface_awid_s12,
        AxiMonitorInterface_awid_s13,
        AxiMonitorInterface_awid_s14,
        AxiMonitorInterface_awid_s15,
        AxiMonitorInterface_awid_s16,
        AxiMonitorInterface_awid_s17,
        AxiMonitorInterface_awid_s18,
        AxiMonitorInterface_awid_s19,
        AxiMonitorInterface_awid_s20,
        AxiMonitorInterface_awid_s21,
        AxiMonitorInterface_awid_s22,
        AxiMonitorInterface_awid_s23,
        AxiMonitorInterface_awid_s24,
        AxiMonitorInterface_awid_s25,
        AxiMonitorInterface_awid_s26,
        AxiMonitorInterface_awid_s27,
        AxiMonitorInterface_awid_s28,
        AxiMonitorInterface_awid_s29,
        AxiMonitorInterface_awid_s30,
        AxiMonitorInterface_awid_s31,
        AxiMonitorInterface_awready_s0,
        AxiMonitorInterface_awready_s1,
        AxiMonitorInterface_awready_s2,
        AxiMonitorInterface_awready_s3,
        AxiMonitorInterface_awready_s4,
        AxiMonitorInterface_awready_s5,
        AxiMonitorInterface_awready_s6,
        AxiMonitorInterface_awready_s7,
        AxiMonitorInterface_awready_s8,
        AxiMonitorInterface_awready_s9,
        AxiMonitorInterface_awready_s10,
        AxiMonitorInterface_awready_s11,
        AxiMonitorInterface_awready_s12,
        AxiMonitorInterface_awready_s13,
        AxiMonitorInterface_awready_s14,
        AxiMonitorInterface_awready_s15,
        AxiMonitorInterface_awready_s16,
        AxiMonitorInterface_awready_s17,
        AxiMonitorInterface_awready_s18,
        AxiMonitorInterface_awready_s19,
        AxiMonitorInterface_awready_s20,
        AxiMonitorInterface_awready_s21,
        AxiMonitorInterface_awready_s22,
        AxiMonitorInterface_awready_s23,
        AxiMonitorInterface_awready_s24,
        AxiMonitorInterface_awready_s25,
        AxiMonitorInterface_awready_s26,
        AxiMonitorInterface_awready_s27,
        AxiMonitorInterface_awready_s28,
        AxiMonitorInterface_awready_s29,
        AxiMonitorInterface_awready_s30,
        AxiMonitorInterface_awready_s31,
        AxiMonitorInterface_awsideband_s0,
        AxiMonitorInterface_awsideband_s1,
        AxiMonitorInterface_awsideband_s2,
        AxiMonitorInterface_awsideband_s3,
        AxiMonitorInterface_awsideband_s4,
        AxiMonitorInterface_awsideband_s5,
        AxiMonitorInterface_awsideband_s6,
        AxiMonitorInterface_awsideband_s7,
        AxiMonitorInterface_awsideband_s8,
        AxiMonitorInterface_awsideband_s9,
        AxiMonitorInterface_awsideband_s10,
        AxiMonitorInterface_awsideband_s11,
        AxiMonitorInterface_awsideband_s12,
        AxiMonitorInterface_awsideband_s13,
        AxiMonitorInterface_awsideband_s14,
        AxiMonitorInterface_awsideband_s15,
        AxiMonitorInterface_awsideband_s16,
        AxiMonitorInterface_awsideband_s17,
        AxiMonitorInterface_awsideband_s18,
        AxiMonitorInterface_awsideband_s19,
        AxiMonitorInterface_awsideband_s20,
        AxiMonitorInterface_awsideband_s21,
        AxiMonitorInterface_awsideband_s22,
        AxiMonitorInterface_awsideband_s23,
        AxiMonitorInterface_awsideband_s24,
        AxiMonitorInterface_awsideband_s25,
        AxiMonitorInterface_awsideband_s26,
        AxiMonitorInterface_awsideband_s27,
        AxiMonitorInterface_awsideband_s28,
        AxiMonitorInterface_awsideband_s29,
        AxiMonitorInterface_awsideband_s30,
        AxiMonitorInterface_awsideband_s31,
        AxiMonitorInterface_rvalid_s0,
        AxiMonitorInterface_rvalid_s1,
        AxiMonitorInterface_rvalid_s2,
        AxiMonitorInterface_rvalid_s3,
        AxiMonitorInterface_rvalid_s4,
        AxiMonitorInterface_rvalid_s5,
        AxiMonitorInterface_rvalid_s6,
        AxiMonitorInterface_rvalid_s7,
        AxiMonitorInterface_rvalid_s8,
        AxiMonitorInterface_rvalid_s9,
        AxiMonitorInterface_rvalid_s10,
        AxiMonitorInterface_rvalid_s11,
        AxiMonitorInterface_rvalid_s12,
        AxiMonitorInterface_rvalid_s13,
        AxiMonitorInterface_rvalid_s14,
        AxiMonitorInterface_rvalid_s15,
        AxiMonitorInterface_rvalid_s16,
        AxiMonitorInterface_rvalid_s17,
        AxiMonitorInterface_rvalid_s18,
        AxiMonitorInterface_rvalid_s19,
        AxiMonitorInterface_rvalid_s20,
        AxiMonitorInterface_rvalid_s21,
        AxiMonitorInterface_rvalid_s22,
        AxiMonitorInterface_rvalid_s23,
        AxiMonitorInterface_rvalid_s24,
        AxiMonitorInterface_rvalid_s25,
        AxiMonitorInterface_rvalid_s26,
        AxiMonitorInterface_rvalid_s27,
        AxiMonitorInterface_rvalid_s28,
        AxiMonitorInterface_rvalid_s29,
        AxiMonitorInterface_rvalid_s30,
        AxiMonitorInterface_rvalid_s31,
        AxiMonitorInterface_rlast_s0,
        AxiMonitorInterface_rlast_s1,
        AxiMonitorInterface_rlast_s2,
        AxiMonitorInterface_rlast_s3,
        AxiMonitorInterface_rlast_s4,
        AxiMonitorInterface_rlast_s5,
        AxiMonitorInterface_rlast_s6,
        AxiMonitorInterface_rlast_s7,
        AxiMonitorInterface_rlast_s8,
        AxiMonitorInterface_rlast_s9,
        AxiMonitorInterface_rlast_s10,
        AxiMonitorInterface_rlast_s11,
        AxiMonitorInterface_rlast_s12,
        AxiMonitorInterface_rlast_s13,
        AxiMonitorInterface_rlast_s14,
        AxiMonitorInterface_rlast_s15,
        AxiMonitorInterface_rlast_s16,
        AxiMonitorInterface_rlast_s17,
        AxiMonitorInterface_rlast_s18,
        AxiMonitorInterface_rlast_s19,
        AxiMonitorInterface_rlast_s20,
        AxiMonitorInterface_rlast_s21,
        AxiMonitorInterface_rlast_s22,
        AxiMonitorInterface_rlast_s23,
        AxiMonitorInterface_rlast_s24,
        AxiMonitorInterface_rlast_s25,
        AxiMonitorInterface_rlast_s26,
        AxiMonitorInterface_rlast_s27,
        AxiMonitorInterface_rlast_s28,
        AxiMonitorInterface_rlast_s29,
        AxiMonitorInterface_rlast_s30,
        AxiMonitorInterface_rlast_s31,
        AxiMonitorInterface_rdata_s0,
        AxiMonitorInterface_rdata_s1,
        AxiMonitorInterface_rdata_s2,
        AxiMonitorInterface_rdata_s3,
        AxiMonitorInterface_rdata_s4,
        AxiMonitorInterface_rdata_s5,
        AxiMonitorInterface_rdata_s6,
        AxiMonitorInterface_rdata_s7,
        AxiMonitorInterface_rdata_s8,
        AxiMonitorInterface_rdata_s9,
        AxiMonitorInterface_rdata_s10,
        AxiMonitorInterface_rdata_s11,
        AxiMonitorInterface_rdata_s12,
        AxiMonitorInterface_rdata_s13,
        AxiMonitorInterface_rdata_s14,
        AxiMonitorInterface_rdata_s15,
        AxiMonitorInterface_rdata_s16,
        AxiMonitorInterface_rdata_s17,
        AxiMonitorInterface_rdata_s18,
        AxiMonitorInterface_rdata_s19,
        AxiMonitorInterface_rdata_s20,
        AxiMonitorInterface_rdata_s21,
        AxiMonitorInterface_rdata_s22,
        AxiMonitorInterface_rdata_s23,
        AxiMonitorInterface_rdata_s24,
        AxiMonitorInterface_rdata_s25,
        AxiMonitorInterface_rdata_s26,
        AxiMonitorInterface_rdata_s27,
        AxiMonitorInterface_rdata_s28,
        AxiMonitorInterface_rdata_s29,
        AxiMonitorInterface_rdata_s30,
        AxiMonitorInterface_rdata_s31,
        AxiMonitorInterface_rresp_s0,
        AxiMonitorInterface_rresp_s1,
        AxiMonitorInterface_rresp_s2,
        AxiMonitorInterface_rresp_s3,
        AxiMonitorInterface_rresp_s4,
        AxiMonitorInterface_rresp_s5,
        AxiMonitorInterface_rresp_s6,
        AxiMonitorInterface_rresp_s7,
        AxiMonitorInterface_rresp_s8,
        AxiMonitorInterface_rresp_s9,
        AxiMonitorInterface_rresp_s10,
        AxiMonitorInterface_rresp_s11,
        AxiMonitorInterface_rresp_s12,
        AxiMonitorInterface_rresp_s13,
        AxiMonitorInterface_rresp_s14,
        AxiMonitorInterface_rresp_s15,
        AxiMonitorInterface_rresp_s16,
        AxiMonitorInterface_rresp_s17,
        AxiMonitorInterface_rresp_s18,
        AxiMonitorInterface_rresp_s19,
        AxiMonitorInterface_rresp_s20,
        AxiMonitorInterface_rresp_s21,
        AxiMonitorInterface_rresp_s22,
        AxiMonitorInterface_rresp_s23,
        AxiMonitorInterface_rresp_s24,
        AxiMonitorInterface_rresp_s25,
        AxiMonitorInterface_rresp_s26,
        AxiMonitorInterface_rresp_s27,
        AxiMonitorInterface_rresp_s28,
        AxiMonitorInterface_rresp_s29,
        AxiMonitorInterface_rresp_s30,
        AxiMonitorInterface_rresp_s31,
        AxiMonitorInterface_rid_s0,
        AxiMonitorInterface_rid_s1,
        AxiMonitorInterface_rid_s2,
        AxiMonitorInterface_rid_s3,
        AxiMonitorInterface_rid_s4,
        AxiMonitorInterface_rid_s5,
        AxiMonitorInterface_rid_s6,
        AxiMonitorInterface_rid_s7,
        AxiMonitorInterface_rid_s8,
        AxiMonitorInterface_rid_s9,
        AxiMonitorInterface_rid_s10,
        AxiMonitorInterface_rid_s11,
        AxiMonitorInterface_rid_s12,
        AxiMonitorInterface_rid_s13,
        AxiMonitorInterface_rid_s14,
        AxiMonitorInterface_rid_s15,
        AxiMonitorInterface_rid_s16,
        AxiMonitorInterface_rid_s17,
        AxiMonitorInterface_rid_s18,
        AxiMonitorInterface_rid_s19,
        AxiMonitorInterface_rid_s20,
        AxiMonitorInterface_rid_s21,
        AxiMonitorInterface_rid_s22,
        AxiMonitorInterface_rid_s23,
        AxiMonitorInterface_rid_s24,
        AxiMonitorInterface_rid_s25,
        AxiMonitorInterface_rid_s26,
        AxiMonitorInterface_rid_s27,
        AxiMonitorInterface_rid_s28,
        AxiMonitorInterface_rid_s29,
        AxiMonitorInterface_rid_s30,
        AxiMonitorInterface_rid_s31,
        AxiMonitorInterface_rready_s0,
        AxiMonitorInterface_rready_s1,
        AxiMonitorInterface_rready_s2,
        AxiMonitorInterface_rready_s3,
        AxiMonitorInterface_rready_s4,
        AxiMonitorInterface_rready_s5,
        AxiMonitorInterface_rready_s6,
        AxiMonitorInterface_rready_s7,
        AxiMonitorInterface_rready_s8,
        AxiMonitorInterface_rready_s9,
        AxiMonitorInterface_rready_s10,
        AxiMonitorInterface_rready_s11,
        AxiMonitorInterface_rready_s12,
        AxiMonitorInterface_rready_s13,
        AxiMonitorInterface_rready_s14,
        AxiMonitorInterface_rready_s15,
        AxiMonitorInterface_rready_s16,
        AxiMonitorInterface_rready_s17,
        AxiMonitorInterface_rready_s18,
        AxiMonitorInterface_rready_s19,
        AxiMonitorInterface_rready_s20,
        AxiMonitorInterface_rready_s21,
        AxiMonitorInterface_rready_s22,
        AxiMonitorInterface_rready_s23,
        AxiMonitorInterface_rready_s24,
        AxiMonitorInterface_rready_s25,
        AxiMonitorInterface_rready_s26,
        AxiMonitorInterface_rready_s27,
        AxiMonitorInterface_rready_s28,
        AxiMonitorInterface_rready_s29,
        AxiMonitorInterface_rready_s30,
        AxiMonitorInterface_rready_s31,
        AxiMonitorInterface_rsideband_s0,
        AxiMonitorInterface_rsideband_s1,
        AxiMonitorInterface_rsideband_s2,
        AxiMonitorInterface_rsideband_s3,
        AxiMonitorInterface_rsideband_s4,
        AxiMonitorInterface_rsideband_s5,
        AxiMonitorInterface_rsideband_s6,
        AxiMonitorInterface_rsideband_s7,
        AxiMonitorInterface_rsideband_s8,
        AxiMonitorInterface_rsideband_s9,
        AxiMonitorInterface_rsideband_s10,
        AxiMonitorInterface_rsideband_s11,
        AxiMonitorInterface_rsideband_s12,
        AxiMonitorInterface_rsideband_s13,
        AxiMonitorInterface_rsideband_s14,
        AxiMonitorInterface_rsideband_s15,
        AxiMonitorInterface_rsideband_s16,
        AxiMonitorInterface_rsideband_s17,
        AxiMonitorInterface_rsideband_s18,
        AxiMonitorInterface_rsideband_s19,
        AxiMonitorInterface_rsideband_s20,
        AxiMonitorInterface_rsideband_s21,
        AxiMonitorInterface_rsideband_s22,
        AxiMonitorInterface_rsideband_s23,
        AxiMonitorInterface_rsideband_s24,
        AxiMonitorInterface_rsideband_s25,
        AxiMonitorInterface_rsideband_s26,
        AxiMonitorInterface_rsideband_s27,
        AxiMonitorInterface_rsideband_s28,
        AxiMonitorInterface_rsideband_s29,
        AxiMonitorInterface_rsideband_s30,
        AxiMonitorInterface_rsideband_s31,
        AxiMonitorInterface_wvalid_s0,
        AxiMonitorInterface_wvalid_s1,
        AxiMonitorInterface_wvalid_s2,
        AxiMonitorInterface_wvalid_s3,
        AxiMonitorInterface_wvalid_s4,
        AxiMonitorInterface_wvalid_s5,
        AxiMonitorInterface_wvalid_s6,
        AxiMonitorInterface_wvalid_s7,
        AxiMonitorInterface_wvalid_s8,
        AxiMonitorInterface_wvalid_s9,
        AxiMonitorInterface_wvalid_s10,
        AxiMonitorInterface_wvalid_s11,
        AxiMonitorInterface_wvalid_s12,
        AxiMonitorInterface_wvalid_s13,
        AxiMonitorInterface_wvalid_s14,
        AxiMonitorInterface_wvalid_s15,
        AxiMonitorInterface_wvalid_s16,
        AxiMonitorInterface_wvalid_s17,
        AxiMonitorInterface_wvalid_s18,
        AxiMonitorInterface_wvalid_s19,
        AxiMonitorInterface_wvalid_s20,
        AxiMonitorInterface_wvalid_s21,
        AxiMonitorInterface_wvalid_s22,
        AxiMonitorInterface_wvalid_s23,
        AxiMonitorInterface_wvalid_s24,
        AxiMonitorInterface_wvalid_s25,
        AxiMonitorInterface_wvalid_s26,
        AxiMonitorInterface_wvalid_s27,
        AxiMonitorInterface_wvalid_s28,
        AxiMonitorInterface_wvalid_s29,
        AxiMonitorInterface_wvalid_s30,
        AxiMonitorInterface_wvalid_s31,
        AxiMonitorInterface_wlast_s0,
        AxiMonitorInterface_wlast_s1,
        AxiMonitorInterface_wlast_s2,
        AxiMonitorInterface_wlast_s3,
        AxiMonitorInterface_wlast_s4,
        AxiMonitorInterface_wlast_s5,
        AxiMonitorInterface_wlast_s6,
        AxiMonitorInterface_wlast_s7,
        AxiMonitorInterface_wlast_s8,
        AxiMonitorInterface_wlast_s9,
        AxiMonitorInterface_wlast_s10,
        AxiMonitorInterface_wlast_s11,
        AxiMonitorInterface_wlast_s12,
        AxiMonitorInterface_wlast_s13,
        AxiMonitorInterface_wlast_s14,
        AxiMonitorInterface_wlast_s15,
        AxiMonitorInterface_wlast_s16,
        AxiMonitorInterface_wlast_s17,
        AxiMonitorInterface_wlast_s18,
        AxiMonitorInterface_wlast_s19,
        AxiMonitorInterface_wlast_s20,
        AxiMonitorInterface_wlast_s21,
        AxiMonitorInterface_wlast_s22,
        AxiMonitorInterface_wlast_s23,
        AxiMonitorInterface_wlast_s24,
        AxiMonitorInterface_wlast_s25,
        AxiMonitorInterface_wlast_s26,
        AxiMonitorInterface_wlast_s27,
        AxiMonitorInterface_wlast_s28,
        AxiMonitorInterface_wlast_s29,
        AxiMonitorInterface_wlast_s30,
        AxiMonitorInterface_wlast_s31,
        AxiMonitorInterface_wdata_s0,
        AxiMonitorInterface_wdata_s1,
        AxiMonitorInterface_wdata_s2,
        AxiMonitorInterface_wdata_s3,
        AxiMonitorInterface_wdata_s4,
        AxiMonitorInterface_wdata_s5,
        AxiMonitorInterface_wdata_s6,
        AxiMonitorInterface_wdata_s7,
        AxiMonitorInterface_wdata_s8,
        AxiMonitorInterface_wdata_s9,
        AxiMonitorInterface_wdata_s10,
        AxiMonitorInterface_wdata_s11,
        AxiMonitorInterface_wdata_s12,
        AxiMonitorInterface_wdata_s13,
        AxiMonitorInterface_wdata_s14,
        AxiMonitorInterface_wdata_s15,
        AxiMonitorInterface_wdata_s16,
        AxiMonitorInterface_wdata_s17,
        AxiMonitorInterface_wdata_s18,
        AxiMonitorInterface_wdata_s19,
        AxiMonitorInterface_wdata_s20,
        AxiMonitorInterface_wdata_s21,
        AxiMonitorInterface_wdata_s22,
        AxiMonitorInterface_wdata_s23,
        AxiMonitorInterface_wdata_s24,
        AxiMonitorInterface_wdata_s25,
        AxiMonitorInterface_wdata_s26,
        AxiMonitorInterface_wdata_s27,
        AxiMonitorInterface_wdata_s28,
        AxiMonitorInterface_wdata_s29,
        AxiMonitorInterface_wdata_s30,
        AxiMonitorInterface_wdata_s31,
        AxiMonitorInterface_wstrb_s0,
        AxiMonitorInterface_wstrb_s1,
        AxiMonitorInterface_wstrb_s2,
        AxiMonitorInterface_wstrb_s3,
        AxiMonitorInterface_wstrb_s4,
        AxiMonitorInterface_wstrb_s5,
        AxiMonitorInterface_wstrb_s6,
        AxiMonitorInterface_wstrb_s7,
        AxiMonitorInterface_wstrb_s8,
        AxiMonitorInterface_wstrb_s9,
        AxiMonitorInterface_wstrb_s10,
        AxiMonitorInterface_wstrb_s11,
        AxiMonitorInterface_wstrb_s12,
        AxiMonitorInterface_wstrb_s13,
        AxiMonitorInterface_wstrb_s14,
        AxiMonitorInterface_wstrb_s15,
        AxiMonitorInterface_wstrb_s16,
        AxiMonitorInterface_wstrb_s17,
        AxiMonitorInterface_wstrb_s18,
        AxiMonitorInterface_wstrb_s19,
        AxiMonitorInterface_wstrb_s20,
        AxiMonitorInterface_wstrb_s21,
        AxiMonitorInterface_wstrb_s22,
        AxiMonitorInterface_wstrb_s23,
        AxiMonitorInterface_wstrb_s24,
        AxiMonitorInterface_wstrb_s25,
        AxiMonitorInterface_wstrb_s26,
        AxiMonitorInterface_wstrb_s27,
        AxiMonitorInterface_wstrb_s28,
        AxiMonitorInterface_wstrb_s29,
        AxiMonitorInterface_wstrb_s30,
        AxiMonitorInterface_wstrb_s31,
        AxiMonitorInterface_wid_s0,
        AxiMonitorInterface_wid_s1,
        AxiMonitorInterface_wid_s2,
        AxiMonitorInterface_wid_s3,
        AxiMonitorInterface_wid_s4,
        AxiMonitorInterface_wid_s5,
        AxiMonitorInterface_wid_s6,
        AxiMonitorInterface_wid_s7,
        AxiMonitorInterface_wid_s8,
        AxiMonitorInterface_wid_s9,
        AxiMonitorInterface_wid_s10,
        AxiMonitorInterface_wid_s11,
        AxiMonitorInterface_wid_s12,
        AxiMonitorInterface_wid_s13,
        AxiMonitorInterface_wid_s14,
        AxiMonitorInterface_wid_s15,
        AxiMonitorInterface_wid_s16,
        AxiMonitorInterface_wid_s17,
        AxiMonitorInterface_wid_s18,
        AxiMonitorInterface_wid_s19,
        AxiMonitorInterface_wid_s20,
        AxiMonitorInterface_wid_s21,
        AxiMonitorInterface_wid_s22,
        AxiMonitorInterface_wid_s23,
        AxiMonitorInterface_wid_s24,
        AxiMonitorInterface_wid_s25,
        AxiMonitorInterface_wid_s26,
        AxiMonitorInterface_wid_s27,
        AxiMonitorInterface_wid_s28,
        AxiMonitorInterface_wid_s29,
        AxiMonitorInterface_wid_s30,
        AxiMonitorInterface_wid_s31,
        AxiMonitorInterface_wready_s0,
        AxiMonitorInterface_wready_s1,
        AxiMonitorInterface_wready_s2,
        AxiMonitorInterface_wready_s3,
        AxiMonitorInterface_wready_s4,
        AxiMonitorInterface_wready_s5,
        AxiMonitorInterface_wready_s6,
        AxiMonitorInterface_wready_s7,
        AxiMonitorInterface_wready_s8,
        AxiMonitorInterface_wready_s9,
        AxiMonitorInterface_wready_s10,
        AxiMonitorInterface_wready_s11,
        AxiMonitorInterface_wready_s12,
        AxiMonitorInterface_wready_s13,
        AxiMonitorInterface_wready_s14,
        AxiMonitorInterface_wready_s15,
        AxiMonitorInterface_wready_s16,
        AxiMonitorInterface_wready_s17,
        AxiMonitorInterface_wready_s18,
        AxiMonitorInterface_wready_s19,
        AxiMonitorInterface_wready_s20,
        AxiMonitorInterface_wready_s21,
        AxiMonitorInterface_wready_s22,
        AxiMonitorInterface_wready_s23,
        AxiMonitorInterface_wready_s24,
        AxiMonitorInterface_wready_s25,
        AxiMonitorInterface_wready_s26,
        AxiMonitorInterface_wready_s27,
        AxiMonitorInterface_wready_s28,
        AxiMonitorInterface_wready_s29,
        AxiMonitorInterface_wready_s30,
        AxiMonitorInterface_wready_s31,
        AxiMonitorInterface_wsideband_s0,
        AxiMonitorInterface_wsideband_s1,
        AxiMonitorInterface_wsideband_s2,
        AxiMonitorInterface_wsideband_s3,
        AxiMonitorInterface_wsideband_s4,
        AxiMonitorInterface_wsideband_s5,
        AxiMonitorInterface_wsideband_s6,
        AxiMonitorInterface_wsideband_s7,
        AxiMonitorInterface_wsideband_s8,
        AxiMonitorInterface_wsideband_s9,
        AxiMonitorInterface_wsideband_s10,
        AxiMonitorInterface_wsideband_s11,
        AxiMonitorInterface_wsideband_s12,
        AxiMonitorInterface_wsideband_s13,
        AxiMonitorInterface_wsideband_s14,
        AxiMonitorInterface_wsideband_s15,
        AxiMonitorInterface_wsideband_s16,
        AxiMonitorInterface_wsideband_s17,
        AxiMonitorInterface_wsideband_s18,
        AxiMonitorInterface_wsideband_s19,
        AxiMonitorInterface_wsideband_s20,
        AxiMonitorInterface_wsideband_s21,
        AxiMonitorInterface_wsideband_s22,
        AxiMonitorInterface_wsideband_s23,
        AxiMonitorInterface_wsideband_s24,
        AxiMonitorInterface_wsideband_s25,
        AxiMonitorInterface_wsideband_s26,
        AxiMonitorInterface_wsideband_s27,
        AxiMonitorInterface_wsideband_s28,
        AxiMonitorInterface_wsideband_s29,
        AxiMonitorInterface_wsideband_s30,
        AxiMonitorInterface_wsideband_s31,
        AxiMonitorInterface_bvalid_s0,
        AxiMonitorInterface_bvalid_s1,
        AxiMonitorInterface_bvalid_s2,
        AxiMonitorInterface_bvalid_s3,
        AxiMonitorInterface_bvalid_s4,
        AxiMonitorInterface_bvalid_s5,
        AxiMonitorInterface_bvalid_s6,
        AxiMonitorInterface_bvalid_s7,
        AxiMonitorInterface_bvalid_s8,
        AxiMonitorInterface_bvalid_s9,
        AxiMonitorInterface_bvalid_s10,
        AxiMonitorInterface_bvalid_s11,
        AxiMonitorInterface_bvalid_s12,
        AxiMonitorInterface_bvalid_s13,
        AxiMonitorInterface_bvalid_s14,
        AxiMonitorInterface_bvalid_s15,
        AxiMonitorInterface_bvalid_s16,
        AxiMonitorInterface_bvalid_s17,
        AxiMonitorInterface_bvalid_s18,
        AxiMonitorInterface_bvalid_s19,
        AxiMonitorInterface_bvalid_s20,
        AxiMonitorInterface_bvalid_s21,
        AxiMonitorInterface_bvalid_s22,
        AxiMonitorInterface_bvalid_s23,
        AxiMonitorInterface_bvalid_s24,
        AxiMonitorInterface_bvalid_s25,
        AxiMonitorInterface_bvalid_s26,
        AxiMonitorInterface_bvalid_s27,
        AxiMonitorInterface_bvalid_s28,
        AxiMonitorInterface_bvalid_s29,
        AxiMonitorInterface_bvalid_s30,
        AxiMonitorInterface_bvalid_s31,
        AxiMonitorInterface_bresp_s0,
        AxiMonitorInterface_bresp_s1,
        AxiMonitorInterface_bresp_s2,
        AxiMonitorInterface_bresp_s3,
        AxiMonitorInterface_bresp_s4,
        AxiMonitorInterface_bresp_s5,
        AxiMonitorInterface_bresp_s6,
        AxiMonitorInterface_bresp_s7,
        AxiMonitorInterface_bresp_s8,
        AxiMonitorInterface_bresp_s9,
        AxiMonitorInterface_bresp_s10,
        AxiMonitorInterface_bresp_s11,
        AxiMonitorInterface_bresp_s12,
        AxiMonitorInterface_bresp_s13,
        AxiMonitorInterface_bresp_s14,
        AxiMonitorInterface_bresp_s15,
        AxiMonitorInterface_bresp_s16,
        AxiMonitorInterface_bresp_s17,
        AxiMonitorInterface_bresp_s18,
        AxiMonitorInterface_bresp_s19,
        AxiMonitorInterface_bresp_s20,
        AxiMonitorInterface_bresp_s21,
        AxiMonitorInterface_bresp_s22,
        AxiMonitorInterface_bresp_s23,
        AxiMonitorInterface_bresp_s24,
        AxiMonitorInterface_bresp_s25,
        AxiMonitorInterface_bresp_s26,
        AxiMonitorInterface_bresp_s27,
        AxiMonitorInterface_bresp_s28,
        AxiMonitorInterface_bresp_s29,
        AxiMonitorInterface_bresp_s30,
        AxiMonitorInterface_bresp_s31,
        AxiMonitorInterface_bid_s0,
        AxiMonitorInterface_bid_s1,
        AxiMonitorInterface_bid_s2,
        AxiMonitorInterface_bid_s3,
        AxiMonitorInterface_bid_s4,
        AxiMonitorInterface_bid_s5,
        AxiMonitorInterface_bid_s6,
        AxiMonitorInterface_bid_s7,
        AxiMonitorInterface_bid_s8,
        AxiMonitorInterface_bid_s9,
        AxiMonitorInterface_bid_s10,
        AxiMonitorInterface_bid_s11,
        AxiMonitorInterface_bid_s12,
        AxiMonitorInterface_bid_s13,
        AxiMonitorInterface_bid_s14,
        AxiMonitorInterface_bid_s15,
        AxiMonitorInterface_bid_s16,
        AxiMonitorInterface_bid_s17,
        AxiMonitorInterface_bid_s18,
        AxiMonitorInterface_bid_s19,
        AxiMonitorInterface_bid_s20,
        AxiMonitorInterface_bid_s21,
        AxiMonitorInterface_bid_s22,
        AxiMonitorInterface_bid_s23,
        AxiMonitorInterface_bid_s24,
        AxiMonitorInterface_bid_s25,
        AxiMonitorInterface_bid_s26,
        AxiMonitorInterface_bid_s27,
        AxiMonitorInterface_bid_s28,
        AxiMonitorInterface_bid_s29,
        AxiMonitorInterface_bid_s30,
        AxiMonitorInterface_bid_s31,
        AxiMonitorInterface_bready_s0,
        AxiMonitorInterface_bready_s1,
        AxiMonitorInterface_bready_s2,
        AxiMonitorInterface_bready_s3,
        AxiMonitorInterface_bready_s4,
        AxiMonitorInterface_bready_s5,
        AxiMonitorInterface_bready_s6,
        AxiMonitorInterface_bready_s7,
        AxiMonitorInterface_bready_s8,
        AxiMonitorInterface_bready_s9,
        AxiMonitorInterface_bready_s10,
        AxiMonitorInterface_bready_s11,
        AxiMonitorInterface_bready_s12,
        AxiMonitorInterface_bready_s13,
        AxiMonitorInterface_bready_s14,
        AxiMonitorInterface_bready_s15,
        AxiMonitorInterface_bready_s16,
        AxiMonitorInterface_bready_s17,
        AxiMonitorInterface_bready_s18,
        AxiMonitorInterface_bready_s19,
        AxiMonitorInterface_bready_s20,
        AxiMonitorInterface_bready_s21,
        AxiMonitorInterface_bready_s22,
        AxiMonitorInterface_bready_s23,
        AxiMonitorInterface_bready_s24,
        AxiMonitorInterface_bready_s25,
        AxiMonitorInterface_bready_s26,
        AxiMonitorInterface_bready_s27,
        AxiMonitorInterface_bready_s28,
        AxiMonitorInterface_bready_s29,
        AxiMonitorInterface_bready_s30,
        AxiMonitorInterface_bready_s31,
        AxiMonitorInterface_bsideband_s0,
        AxiMonitorInterface_bsideband_s1,
        AxiMonitorInterface_bsideband_s2,
        AxiMonitorInterface_bsideband_s3,
        AxiMonitorInterface_bsideband_s4,
        AxiMonitorInterface_bsideband_s5,
        AxiMonitorInterface_bsideband_s6,
        AxiMonitorInterface_bsideband_s7,
        AxiMonitorInterface_bsideband_s8,
        AxiMonitorInterface_bsideband_s9,
        AxiMonitorInterface_bsideband_s10,
        AxiMonitorInterface_bsideband_s11,
        AxiMonitorInterface_bsideband_s12,
        AxiMonitorInterface_bsideband_s13,
        AxiMonitorInterface_bsideband_s14,
        AxiMonitorInterface_bsideband_s15,
        AxiMonitorInterface_bsideband_s16,
        AxiMonitorInterface_bsideband_s17,
        AxiMonitorInterface_bsideband_s18,
        AxiMonitorInterface_bsideband_s19,
        AxiMonitorInterface_bsideband_s20,
        AxiMonitorInterface_bsideband_s21,
        AxiMonitorInterface_bsideband_s22,
        AxiMonitorInterface_bsideband_s23,
        AxiMonitorInterface_bsideband_s24,
        AxiMonitorInterface_bsideband_s25,
        AxiMonitorInterface_bsideband_s26,
        AxiMonitorInterface_bsideband_s27,
        AxiMonitorInterface_bsideband_s28,
        AxiMonitorInterface_bsideband_s29,
        AxiMonitorInterface_bsideband_s30,
        AxiMonitorInterface_bsideband_s31,
        AxiMonitorInterface_cactive_s0,
        AxiMonitorInterface_cactive_s1,
        AxiMonitorInterface_cactive_s2,
        AxiMonitorInterface_cactive_s3,
        AxiMonitorInterface_cactive_s4,
        AxiMonitorInterface_cactive_s5,
        AxiMonitorInterface_cactive_s6,
        AxiMonitorInterface_cactive_s7,
        AxiMonitorInterface_cactive_s8,
        AxiMonitorInterface_cactive_s9,
        AxiMonitorInterface_cactive_s10,
        AxiMonitorInterface_cactive_s11,
        AxiMonitorInterface_cactive_s12,
        AxiMonitorInterface_cactive_s13,
        AxiMonitorInterface_cactive_s14,
        AxiMonitorInterface_cactive_s15,
        AxiMonitorInterface_cactive_s16,
        AxiMonitorInterface_cactive_s17,
        AxiMonitorInterface_cactive_s18,
        AxiMonitorInterface_cactive_s19,
        AxiMonitorInterface_cactive_s20,
        AxiMonitorInterface_cactive_s21,
        AxiMonitorInterface_cactive_s22,
        AxiMonitorInterface_cactive_s23,
        AxiMonitorInterface_cactive_s24,
        AxiMonitorInterface_cactive_s25,
        AxiMonitorInterface_cactive_s26,
        AxiMonitorInterface_cactive_s27,
        AxiMonitorInterface_cactive_s28,
        AxiMonitorInterface_cactive_s29,
        AxiMonitorInterface_cactive_s30,
        AxiMonitorInterface_cactive_s31,
        AxiMonitorInterface_csysreq_s0,
        AxiMonitorInterface_csysreq_s1,
        AxiMonitorInterface_csysreq_s2,
        AxiMonitorInterface_csysreq_s3,
        AxiMonitorInterface_csysreq_s4,
        AxiMonitorInterface_csysreq_s5,
        AxiMonitorInterface_csysreq_s6,
        AxiMonitorInterface_csysreq_s7,
        AxiMonitorInterface_csysreq_s8,
        AxiMonitorInterface_csysreq_s9,
        AxiMonitorInterface_csysreq_s10,
        AxiMonitorInterface_csysreq_s11,
        AxiMonitorInterface_csysreq_s12,
        AxiMonitorInterface_csysreq_s13,
        AxiMonitorInterface_csysreq_s14,
        AxiMonitorInterface_csysreq_s15,
        AxiMonitorInterface_csysreq_s16,
        AxiMonitorInterface_csysreq_s17,
        AxiMonitorInterface_csysreq_s18,
        AxiMonitorInterface_csysreq_s19,
        AxiMonitorInterface_csysreq_s20,
        AxiMonitorInterface_csysreq_s21,
        AxiMonitorInterface_csysreq_s22,
        AxiMonitorInterface_csysreq_s23,
        AxiMonitorInterface_csysreq_s24,
        AxiMonitorInterface_csysreq_s25,
        AxiMonitorInterface_csysreq_s26,
        AxiMonitorInterface_csysreq_s27,
        AxiMonitorInterface_csysreq_s28,
        AxiMonitorInterface_csysreq_s29,
        AxiMonitorInterface_csysreq_s30,
        AxiMonitorInterface_csysreq_s31,
        AxiMonitorInterface_csysack_s0,
        AxiMonitorInterface_csysack_s1,
        AxiMonitorInterface_csysack_s2,
        AxiMonitorInterface_csysack_s3,
        AxiMonitorInterface_csysack_s4,
        AxiMonitorInterface_csysack_s5,
        AxiMonitorInterface_csysack_s6,
        AxiMonitorInterface_csysack_s7,
        AxiMonitorInterface_csysack_s8,
        AxiMonitorInterface_csysack_s9,
        AxiMonitorInterface_csysack_s10,
        AxiMonitorInterface_csysack_s11,
        AxiMonitorInterface_csysack_s12,
        AxiMonitorInterface_csysack_s13,
        AxiMonitorInterface_csysack_s14,
        AxiMonitorInterface_csysack_s15,
        AxiMonitorInterface_csysack_s16,
        AxiMonitorInterface_csysack_s17,
        AxiMonitorInterface_csysack_s18,
        AxiMonitorInterface_csysack_s19,
        AxiMonitorInterface_csysack_s20,
        AxiMonitorInterface_csysack_s21,
        AxiMonitorInterface_csysack_s22,
        AxiMonitorInterface_csysack_s23,
        AxiMonitorInterface_csysack_s24,
        AxiMonitorInterface_csysack_s25,
        AxiMonitorInterface_csysack_s26,
        AxiMonitorInterface_csysack_s27,
        AxiMonitorInterface_csysack_s28,
        AxiMonitorInterface_csysack_s29,
        AxiMonitorInterface_csysack_s30,
        AxiMonitorInterface_csysack_s31,
        GifSlaveInterface_gclk,
        GifSlaveInterface_maddr,
        GifSlaveInterface_mread,
        GifSlaveInterface_mwrite,
        GifSlaveInterface_mlen,
        GifSlaveInterface_msize,
        GifSlaveInterface_mburst,
        GifSlaveInterface_mlast,
        GifSlaveInterface_mdata,
        GifSlaveInterface_mwstrb,
        GifSlaveInterface_saccept,
        GifSlaveInterface_svalid,
        GifSlaveInterface_sdata,
        GifSlaveInterface_sresp,
        GifSlaveInterface_mready,
        LowPowerInterface_aclk,
        LowPowerInterface_aresetn,
        LowPowerInterface_csysreq,
        LowPowerInterface_cactive,
        LowPowerInterface_csysack,
        LowPowerInterface_shutdown,
        LowPowerInterface_clocklevel,
        LowPowerInterface_cvrgen
);
input AxiMasterInterface_aclk;
input AxiMasterInterface_aresetn;
output AxiMasterInterface_awvalid;
output [63:0] AxiMasterInterface_awaddr;
output [9:0] AxiMasterInterface_awlen;
output [2:0] AxiMasterInterface_awsize;
output [1:0] AxiMasterInterface_awburst;
output [1:0] AxiMasterInterface_awlock;
output [3:0] AxiMasterInterface_awcache;
output [2:0] AxiMasterInterface_awprot;
output [31:0] AxiMasterInterface_awid;
output [63:0] AxiMasterInterface_awsideband;
input AxiMasterInterface_awready;
output AxiMasterInterface_arvalid;
output [63:0] AxiMasterInterface_araddr;
output [9:0] AxiMasterInterface_arlen;
output [2:0] AxiMasterInterface_arsize;
output [1:0] AxiMasterInterface_arburst;
output [1:0] AxiMasterInterface_arlock;
output [3:0] AxiMasterInterface_arcache;
output [2:0] AxiMasterInterface_arprot;
output [31:0] AxiMasterInterface_arid;
output [63:0] AxiMasterInterface_arsideband;
input AxiMasterInterface_arready;
input AxiMasterInterface_rvalid;
input AxiMasterInterface_rlast;
input [1023:0] AxiMasterInterface_rdata;
input [1:0] AxiMasterInterface_rresp;
input [31:0] AxiMasterInterface_rid;
input [63:0] AxiMasterInterface_rsideband;
output AxiMasterInterface_rready;
output AxiMasterInterface_wvalid;
output AxiMasterInterface_wlast;
output [1023:0] AxiMasterInterface_wdata;
output [127:0] AxiMasterInterface_wstrb;
output [31:0] AxiMasterInterface_wid;
output [63:0] AxiMasterInterface_wsideband;
input AxiMasterInterface_wready;
input AxiMasterInterface_bvalid;
input [1:0] AxiMasterInterface_bresp;
input [31:0] AxiMasterInterface_bid;
input [63:0] AxiMasterInterface_bsideband;
output AxiMasterInterface_bready;
input AxiMasterInterface_csysreq;
output AxiMasterInterface_csysack;
output AxiMasterInterface_cactive;
input AxiMonitorInterface_aclk;
input AxiMonitorInterface_aresetn;
input AxiMonitorInterface_arvalid_m0;
input AxiMonitorInterface_arvalid_m1;
input AxiMonitorInterface_arvalid_m2;
input AxiMonitorInterface_arvalid_m3;
input AxiMonitorInterface_arvalid_m4;
input AxiMonitorInterface_arvalid_m5;
input AxiMonitorInterface_arvalid_m6;
input AxiMonitorInterface_arvalid_m7;
input AxiMonitorInterface_arvalid_m8;
input AxiMonitorInterface_arvalid_m9;
input AxiMonitorInterface_arvalid_m10;
input AxiMonitorInterface_arvalid_m11;
input AxiMonitorInterface_arvalid_m12;
input AxiMonitorInterface_arvalid_m13;
input AxiMonitorInterface_arvalid_m14;
input AxiMonitorInterface_arvalid_m15;
input AxiMonitorInterface_arvalid_m16;
input AxiMonitorInterface_arvalid_m17;
input AxiMonitorInterface_arvalid_m18;
input AxiMonitorInterface_arvalid_m19;
input AxiMonitorInterface_arvalid_m20;
input AxiMonitorInterface_arvalid_m21;
input AxiMonitorInterface_arvalid_m22;
input AxiMonitorInterface_arvalid_m23;
input AxiMonitorInterface_arvalid_m24;
input AxiMonitorInterface_arvalid_m25;
input AxiMonitorInterface_arvalid_m26;
input AxiMonitorInterface_arvalid_m27;
input AxiMonitorInterface_arvalid_m28;
input AxiMonitorInterface_arvalid_m29;
input AxiMonitorInterface_arvalid_m30;
input AxiMonitorInterface_arvalid_m31;
input [63:0] AxiMonitorInterface_araddr_m0;
input [63:0] AxiMonitorInterface_araddr_m1;
input [63:0] AxiMonitorInterface_araddr_m2;
input [63:0] AxiMonitorInterface_araddr_m3;
input [63:0] AxiMonitorInterface_araddr_m4;
input [63:0] AxiMonitorInterface_araddr_m5;
input [63:0] AxiMonitorInterface_araddr_m6;
input [63:0] AxiMonitorInterface_araddr_m7;
input [63:0] AxiMonitorInterface_araddr_m8;
input [63:0] AxiMonitorInterface_araddr_m9;
input [63:0] AxiMonitorInterface_araddr_m10;
input [63:0] AxiMonitorInterface_araddr_m11;
input [63:0] AxiMonitorInterface_araddr_m12;
input [63:0] AxiMonitorInterface_araddr_m13;
input [63:0] AxiMonitorInterface_araddr_m14;
input [63:0] AxiMonitorInterface_araddr_m15;
input [63:0] AxiMonitorInterface_araddr_m16;
input [63:0] AxiMonitorInterface_araddr_m17;
input [63:0] AxiMonitorInterface_araddr_m18;
input [63:0] AxiMonitorInterface_araddr_m19;
input [63:0] AxiMonitorInterface_araddr_m20;
input [63:0] AxiMonitorInterface_araddr_m21;
input [63:0] AxiMonitorInterface_araddr_m22;
input [63:0] AxiMonitorInterface_araddr_m23;
input [63:0] AxiMonitorInterface_araddr_m24;
input [63:0] AxiMonitorInterface_araddr_m25;
input [63:0] AxiMonitorInterface_araddr_m26;
input [63:0] AxiMonitorInterface_araddr_m27;
input [63:0] AxiMonitorInterface_araddr_m28;
input [63:0] AxiMonitorInterface_araddr_m29;
input [63:0] AxiMonitorInterface_araddr_m30;
input [63:0] AxiMonitorInterface_araddr_m31;
input [9:0] AxiMonitorInterface_arlen_m0;
input [9:0] AxiMonitorInterface_arlen_m1;
input [9:0] AxiMonitorInterface_arlen_m2;
input [9:0] AxiMonitorInterface_arlen_m3;
input [9:0] AxiMonitorInterface_arlen_m4;
input [9:0] AxiMonitorInterface_arlen_m5;
input [9:0] AxiMonitorInterface_arlen_m6;
input [9:0] AxiMonitorInterface_arlen_m7;
input [9:0] AxiMonitorInterface_arlen_m8;
input [9:0] AxiMonitorInterface_arlen_m9;
input [9:0] AxiMonitorInterface_arlen_m10;
input [9:0] AxiMonitorInterface_arlen_m11;
input [9:0] AxiMonitorInterface_arlen_m12;
input [9:0] AxiMonitorInterface_arlen_m13;
input [9:0] AxiMonitorInterface_arlen_m14;
input [9:0] AxiMonitorInterface_arlen_m15;
input [9:0] AxiMonitorInterface_arlen_m16;
input [9:0] AxiMonitorInterface_arlen_m17;
input [9:0] AxiMonitorInterface_arlen_m18;
input [9:0] AxiMonitorInterface_arlen_m19;
input [9:0] AxiMonitorInterface_arlen_m20;
input [9:0] AxiMonitorInterface_arlen_m21;
input [9:0] AxiMonitorInterface_arlen_m22;
input [9:0] AxiMonitorInterface_arlen_m23;
input [9:0] AxiMonitorInterface_arlen_m24;
input [9:0] AxiMonitorInterface_arlen_m25;
input [9:0] AxiMonitorInterface_arlen_m26;
input [9:0] AxiMonitorInterface_arlen_m27;
input [9:0] AxiMonitorInterface_arlen_m28;
input [9:0] AxiMonitorInterface_arlen_m29;
input [9:0] AxiMonitorInterface_arlen_m30;
input [9:0] AxiMonitorInterface_arlen_m31;
input [2:0] AxiMonitorInterface_arsize_m0;
input [2:0] AxiMonitorInterface_arsize_m1;
input [2:0] AxiMonitorInterface_arsize_m2;
input [2:0] AxiMonitorInterface_arsize_m3;
input [2:0] AxiMonitorInterface_arsize_m4;
input [2:0] AxiMonitorInterface_arsize_m5;
input [2:0] AxiMonitorInterface_arsize_m6;
input [2:0] AxiMonitorInterface_arsize_m7;
input [2:0] AxiMonitorInterface_arsize_m8;
input [2:0] AxiMonitorInterface_arsize_m9;
input [2:0] AxiMonitorInterface_arsize_m10;
input [2:0] AxiMonitorInterface_arsize_m11;
input [2:0] AxiMonitorInterface_arsize_m12;
input [2:0] AxiMonitorInterface_arsize_m13;
input [2:0] AxiMonitorInterface_arsize_m14;
input [2:0] AxiMonitorInterface_arsize_m15;
input [2:0] AxiMonitorInterface_arsize_m16;
input [2:0] AxiMonitorInterface_arsize_m17;
input [2:0] AxiMonitorInterface_arsize_m18;
input [2:0] AxiMonitorInterface_arsize_m19;
input [2:0] AxiMonitorInterface_arsize_m20;
input [2:0] AxiMonitorInterface_arsize_m21;
input [2:0] AxiMonitorInterface_arsize_m22;
input [2:0] AxiMonitorInterface_arsize_m23;
input [2:0] AxiMonitorInterface_arsize_m24;
input [2:0] AxiMonitorInterface_arsize_m25;
input [2:0] AxiMonitorInterface_arsize_m26;
input [2:0] AxiMonitorInterface_arsize_m27;
input [2:0] AxiMonitorInterface_arsize_m28;
input [2:0] AxiMonitorInterface_arsize_m29;
input [2:0] AxiMonitorInterface_arsize_m30;
input [2:0] AxiMonitorInterface_arsize_m31;
input [1:0] AxiMonitorInterface_arburst_m0;
input [1:0] AxiMonitorInterface_arburst_m1;
input [1:0] AxiMonitorInterface_arburst_m2;
input [1:0] AxiMonitorInterface_arburst_m3;
input [1:0] AxiMonitorInterface_arburst_m4;
input [1:0] AxiMonitorInterface_arburst_m5;
input [1:0] AxiMonitorInterface_arburst_m6;
input [1:0] AxiMonitorInterface_arburst_m7;
input [1:0] AxiMonitorInterface_arburst_m8;
input [1:0] AxiMonitorInterface_arburst_m9;
input [1:0] AxiMonitorInterface_arburst_m10;
input [1:0] AxiMonitorInterface_arburst_m11;
input [1:0] AxiMonitorInterface_arburst_m12;
input [1:0] AxiMonitorInterface_arburst_m13;
input [1:0] AxiMonitorInterface_arburst_m14;
input [1:0] AxiMonitorInterface_arburst_m15;
input [1:0] AxiMonitorInterface_arburst_m16;
input [1:0] AxiMonitorInterface_arburst_m17;
input [1:0] AxiMonitorInterface_arburst_m18;
input [1:0] AxiMonitorInterface_arburst_m19;
input [1:0] AxiMonitorInterface_arburst_m20;
input [1:0] AxiMonitorInterface_arburst_m21;
input [1:0] AxiMonitorInterface_arburst_m22;
input [1:0] AxiMonitorInterface_arburst_m23;
input [1:0] AxiMonitorInterface_arburst_m24;
input [1:0] AxiMonitorInterface_arburst_m25;
input [1:0] AxiMonitorInterface_arburst_m26;
input [1:0] AxiMonitorInterface_arburst_m27;
input [1:0] AxiMonitorInterface_arburst_m28;
input [1:0] AxiMonitorInterface_arburst_m29;
input [1:0] AxiMonitorInterface_arburst_m30;
input [1:0] AxiMonitorInterface_arburst_m31;
input [1:0] AxiMonitorInterface_arlock_m0;
input [1:0] AxiMonitorInterface_arlock_m1;
input [1:0] AxiMonitorInterface_arlock_m2;
input [1:0] AxiMonitorInterface_arlock_m3;
input [1:0] AxiMonitorInterface_arlock_m4;
input [1:0] AxiMonitorInterface_arlock_m5;
input [1:0] AxiMonitorInterface_arlock_m6;
input [1:0] AxiMonitorInterface_arlock_m7;
input [1:0] AxiMonitorInterface_arlock_m8;
input [1:0] AxiMonitorInterface_arlock_m9;
input [1:0] AxiMonitorInterface_arlock_m10;
input [1:0] AxiMonitorInterface_arlock_m11;
input [1:0] AxiMonitorInterface_arlock_m12;
input [1:0] AxiMonitorInterface_arlock_m13;
input [1:0] AxiMonitorInterface_arlock_m14;
input [1:0] AxiMonitorInterface_arlock_m15;
input [1:0] AxiMonitorInterface_arlock_m16;
input [1:0] AxiMonitorInterface_arlock_m17;
input [1:0] AxiMonitorInterface_arlock_m18;
input [1:0] AxiMonitorInterface_arlock_m19;
input [1:0] AxiMonitorInterface_arlock_m20;
input [1:0] AxiMonitorInterface_arlock_m21;
input [1:0] AxiMonitorInterface_arlock_m22;
input [1:0] AxiMonitorInterface_arlock_m23;
input [1:0] AxiMonitorInterface_arlock_m24;
input [1:0] AxiMonitorInterface_arlock_m25;
input [1:0] AxiMonitorInterface_arlock_m26;
input [1:0] AxiMonitorInterface_arlock_m27;
input [1:0] AxiMonitorInterface_arlock_m28;
input [1:0] AxiMonitorInterface_arlock_m29;
input [1:0] AxiMonitorInterface_arlock_m30;
input [1:0] AxiMonitorInterface_arlock_m31;
input [3:0] AxiMonitorInterface_arcache_m0;
input [3:0] AxiMonitorInterface_arcache_m1;
input [3:0] AxiMonitorInterface_arcache_m2;
input [3:0] AxiMonitorInterface_arcache_m3;
input [3:0] AxiMonitorInterface_arcache_m4;
input [3:0] AxiMonitorInterface_arcache_m5;
input [3:0] AxiMonitorInterface_arcache_m6;
input [3:0] AxiMonitorInterface_arcache_m7;
input [3:0] AxiMonitorInterface_arcache_m8;
input [3:0] AxiMonitorInterface_arcache_m9;
input [3:0] AxiMonitorInterface_arcache_m10;
input [3:0] AxiMonitorInterface_arcache_m11;
input [3:0] AxiMonitorInterface_arcache_m12;
input [3:0] AxiMonitorInterface_arcache_m13;
input [3:0] AxiMonitorInterface_arcache_m14;
input [3:0] AxiMonitorInterface_arcache_m15;
input [3:0] AxiMonitorInterface_arcache_m16;
input [3:0] AxiMonitorInterface_arcache_m17;
input [3:0] AxiMonitorInterface_arcache_m18;
input [3:0] AxiMonitorInterface_arcache_m19;
input [3:0] AxiMonitorInterface_arcache_m20;
input [3:0] AxiMonitorInterface_arcache_m21;
input [3:0] AxiMonitorInterface_arcache_m22;
input [3:0] AxiMonitorInterface_arcache_m23;
input [3:0] AxiMonitorInterface_arcache_m24;
input [3:0] AxiMonitorInterface_arcache_m25;
input [3:0] AxiMonitorInterface_arcache_m26;
input [3:0] AxiMonitorInterface_arcache_m27;
input [3:0] AxiMonitorInterface_arcache_m28;
input [3:0] AxiMonitorInterface_arcache_m29;
input [3:0] AxiMonitorInterface_arcache_m30;
input [3:0] AxiMonitorInterface_arcache_m31;
input [2:0] AxiMonitorInterface_arprot_m0;
input [2:0] AxiMonitorInterface_arprot_m1;
input [2:0] AxiMonitorInterface_arprot_m2;
input [2:0] AxiMonitorInterface_arprot_m3;
input [2:0] AxiMonitorInterface_arprot_m4;
input [2:0] AxiMonitorInterface_arprot_m5;
input [2:0] AxiMonitorInterface_arprot_m6;
input [2:0] AxiMonitorInterface_arprot_m7;
input [2:0] AxiMonitorInterface_arprot_m8;
input [2:0] AxiMonitorInterface_arprot_m9;
input [2:0] AxiMonitorInterface_arprot_m10;
input [2:0] AxiMonitorInterface_arprot_m11;
input [2:0] AxiMonitorInterface_arprot_m12;
input [2:0] AxiMonitorInterface_arprot_m13;
input [2:0] AxiMonitorInterface_arprot_m14;
input [2:0] AxiMonitorInterface_arprot_m15;
input [2:0] AxiMonitorInterface_arprot_m16;
input [2:0] AxiMonitorInterface_arprot_m17;
input [2:0] AxiMonitorInterface_arprot_m18;
input [2:0] AxiMonitorInterface_arprot_m19;
input [2:0] AxiMonitorInterface_arprot_m20;
input [2:0] AxiMonitorInterface_arprot_m21;
input [2:0] AxiMonitorInterface_arprot_m22;
input [2:0] AxiMonitorInterface_arprot_m23;
input [2:0] AxiMonitorInterface_arprot_m24;
input [2:0] AxiMonitorInterface_arprot_m25;
input [2:0] AxiMonitorInterface_arprot_m26;
input [2:0] AxiMonitorInterface_arprot_m27;
input [2:0] AxiMonitorInterface_arprot_m28;
input [2:0] AxiMonitorInterface_arprot_m29;
input [2:0] AxiMonitorInterface_arprot_m30;
input [2:0] AxiMonitorInterface_arprot_m31;
input [31:0] AxiMonitorInterface_arid_m0;
input [31:0] AxiMonitorInterface_arid_m1;
input [31:0] AxiMonitorInterface_arid_m2;
input [31:0] AxiMonitorInterface_arid_m3;
input [31:0] AxiMonitorInterface_arid_m4;
input [31:0] AxiMonitorInterface_arid_m5;
input [31:0] AxiMonitorInterface_arid_m6;
input [31:0] AxiMonitorInterface_arid_m7;
input [31:0] AxiMonitorInterface_arid_m8;
input [31:0] AxiMonitorInterface_arid_m9;
input [31:0] AxiMonitorInterface_arid_m10;
input [31:0] AxiMonitorInterface_arid_m11;
input [31:0] AxiMonitorInterface_arid_m12;
input [31:0] AxiMonitorInterface_arid_m13;
input [31:0] AxiMonitorInterface_arid_m14;
input [31:0] AxiMonitorInterface_arid_m15;
input [31:0] AxiMonitorInterface_arid_m16;
input [31:0] AxiMonitorInterface_arid_m17;
input [31:0] AxiMonitorInterface_arid_m18;
input [31:0] AxiMonitorInterface_arid_m19;
input [31:0] AxiMonitorInterface_arid_m20;
input [31:0] AxiMonitorInterface_arid_m21;
input [31:0] AxiMonitorInterface_arid_m22;
input [31:0] AxiMonitorInterface_arid_m23;
input [31:0] AxiMonitorInterface_arid_m24;
input [31:0] AxiMonitorInterface_arid_m25;
input [31:0] AxiMonitorInterface_arid_m26;
input [31:0] AxiMonitorInterface_arid_m27;
input [31:0] AxiMonitorInterface_arid_m28;
input [31:0] AxiMonitorInterface_arid_m29;
input [31:0] AxiMonitorInterface_arid_m30;
input [31:0] AxiMonitorInterface_arid_m31;
input AxiMonitorInterface_arready_m0;
input AxiMonitorInterface_arready_m1;
input AxiMonitorInterface_arready_m2;
input AxiMonitorInterface_arready_m3;
input AxiMonitorInterface_arready_m4;
input AxiMonitorInterface_arready_m5;
input AxiMonitorInterface_arready_m6;
input AxiMonitorInterface_arready_m7;
input AxiMonitorInterface_arready_m8;
input AxiMonitorInterface_arready_m9;
input AxiMonitorInterface_arready_m10;
input AxiMonitorInterface_arready_m11;
input AxiMonitorInterface_arready_m12;
input AxiMonitorInterface_arready_m13;
input AxiMonitorInterface_arready_m14;
input AxiMonitorInterface_arready_m15;
input AxiMonitorInterface_arready_m16;
input AxiMonitorInterface_arready_m17;
input AxiMonitorInterface_arready_m18;
input AxiMonitorInterface_arready_m19;
input AxiMonitorInterface_arready_m20;
input AxiMonitorInterface_arready_m21;
input AxiMonitorInterface_arready_m22;
input AxiMonitorInterface_arready_m23;
input AxiMonitorInterface_arready_m24;
input AxiMonitorInterface_arready_m25;
input AxiMonitorInterface_arready_m26;
input AxiMonitorInterface_arready_m27;
input AxiMonitorInterface_arready_m28;
input AxiMonitorInterface_arready_m29;
input AxiMonitorInterface_arready_m30;
input AxiMonitorInterface_arready_m31;
input [63:0] AxiMonitorInterface_arsideband_m0;
input [63:0] AxiMonitorInterface_arsideband_m1;
input [63:0] AxiMonitorInterface_arsideband_m2;
input [63:0] AxiMonitorInterface_arsideband_m3;
input [63:0] AxiMonitorInterface_arsideband_m4;
input [63:0] AxiMonitorInterface_arsideband_m5;
input [63:0] AxiMonitorInterface_arsideband_m6;
input [63:0] AxiMonitorInterface_arsideband_m7;
input [63:0] AxiMonitorInterface_arsideband_m8;
input [63:0] AxiMonitorInterface_arsideband_m9;
input [63:0] AxiMonitorInterface_arsideband_m10;
input [63:0] AxiMonitorInterface_arsideband_m11;
input [63:0] AxiMonitorInterface_arsideband_m12;
input [63:0] AxiMonitorInterface_arsideband_m13;
input [63:0] AxiMonitorInterface_arsideband_m14;
input [63:0] AxiMonitorInterface_arsideband_m15;
input [63:0] AxiMonitorInterface_arsideband_m16;
input [63:0] AxiMonitorInterface_arsideband_m17;
input [63:0] AxiMonitorInterface_arsideband_m18;
input [63:0] AxiMonitorInterface_arsideband_m19;
input [63:0] AxiMonitorInterface_arsideband_m20;
input [63:0] AxiMonitorInterface_arsideband_m21;
input [63:0] AxiMonitorInterface_arsideband_m22;
input [63:0] AxiMonitorInterface_arsideband_m23;
input [63:0] AxiMonitorInterface_arsideband_m24;
input [63:0] AxiMonitorInterface_arsideband_m25;
input [63:0] AxiMonitorInterface_arsideband_m26;
input [63:0] AxiMonitorInterface_arsideband_m27;
input [63:0] AxiMonitorInterface_arsideband_m28;
input [63:0] AxiMonitorInterface_arsideband_m29;
input [63:0] AxiMonitorInterface_arsideband_m30;
input [63:0] AxiMonitorInterface_arsideband_m31;
input AxiMonitorInterface_awvalid_m0;
input AxiMonitorInterface_awvalid_m1;
input AxiMonitorInterface_awvalid_m2;
input AxiMonitorInterface_awvalid_m3;
input AxiMonitorInterface_awvalid_m4;
input AxiMonitorInterface_awvalid_m5;
input AxiMonitorInterface_awvalid_m6;
input AxiMonitorInterface_awvalid_m7;
input AxiMonitorInterface_awvalid_m8;
input AxiMonitorInterface_awvalid_m9;
input AxiMonitorInterface_awvalid_m10;
input AxiMonitorInterface_awvalid_m11;
input AxiMonitorInterface_awvalid_m12;
input AxiMonitorInterface_awvalid_m13;
input AxiMonitorInterface_awvalid_m14;
input AxiMonitorInterface_awvalid_m15;
input AxiMonitorInterface_awvalid_m16;
input AxiMonitorInterface_awvalid_m17;
input AxiMonitorInterface_awvalid_m18;
input AxiMonitorInterface_awvalid_m19;
input AxiMonitorInterface_awvalid_m20;
input AxiMonitorInterface_awvalid_m21;
input AxiMonitorInterface_awvalid_m22;
input AxiMonitorInterface_awvalid_m23;
input AxiMonitorInterface_awvalid_m24;
input AxiMonitorInterface_awvalid_m25;
input AxiMonitorInterface_awvalid_m26;
input AxiMonitorInterface_awvalid_m27;
input AxiMonitorInterface_awvalid_m28;
input AxiMonitorInterface_awvalid_m29;
input AxiMonitorInterface_awvalid_m30;
input AxiMonitorInterface_awvalid_m31;
input [63:0] AxiMonitorInterface_awaddr_m0;
input [63:0] AxiMonitorInterface_awaddr_m1;
input [63:0] AxiMonitorInterface_awaddr_m2;
input [63:0] AxiMonitorInterface_awaddr_m3;
input [63:0] AxiMonitorInterface_awaddr_m4;
input [63:0] AxiMonitorInterface_awaddr_m5;
input [63:0] AxiMonitorInterface_awaddr_m6;
input [63:0] AxiMonitorInterface_awaddr_m7;
input [63:0] AxiMonitorInterface_awaddr_m8;
input [63:0] AxiMonitorInterface_awaddr_m9;
input [63:0] AxiMonitorInterface_awaddr_m10;
input [63:0] AxiMonitorInterface_awaddr_m11;
input [63:0] AxiMonitorInterface_awaddr_m12;
input [63:0] AxiMonitorInterface_awaddr_m13;
input [63:0] AxiMonitorInterface_awaddr_m14;
input [63:0] AxiMonitorInterface_awaddr_m15;
input [63:0] AxiMonitorInterface_awaddr_m16;
input [63:0] AxiMonitorInterface_awaddr_m17;
input [63:0] AxiMonitorInterface_awaddr_m18;
input [63:0] AxiMonitorInterface_awaddr_m19;
input [63:0] AxiMonitorInterface_awaddr_m20;
input [63:0] AxiMonitorInterface_awaddr_m21;
input [63:0] AxiMonitorInterface_awaddr_m22;
input [63:0] AxiMonitorInterface_awaddr_m23;
input [63:0] AxiMonitorInterface_awaddr_m24;
input [63:0] AxiMonitorInterface_awaddr_m25;
input [63:0] AxiMonitorInterface_awaddr_m26;
input [63:0] AxiMonitorInterface_awaddr_m27;
input [63:0] AxiMonitorInterface_awaddr_m28;
input [63:0] AxiMonitorInterface_awaddr_m29;
input [63:0] AxiMonitorInterface_awaddr_m30;
input [63:0] AxiMonitorInterface_awaddr_m31;
input [9:0] AxiMonitorInterface_awlen_m0;
input [9:0] AxiMonitorInterface_awlen_m1;
input [9:0] AxiMonitorInterface_awlen_m2;
input [9:0] AxiMonitorInterface_awlen_m3;
input [9:0] AxiMonitorInterface_awlen_m4;
input [9:0] AxiMonitorInterface_awlen_m5;
input [9:0] AxiMonitorInterface_awlen_m6;
input [9:0] AxiMonitorInterface_awlen_m7;
input [9:0] AxiMonitorInterface_awlen_m8;
input [9:0] AxiMonitorInterface_awlen_m9;
input [9:0] AxiMonitorInterface_awlen_m10;
input [9:0] AxiMonitorInterface_awlen_m11;
input [9:0] AxiMonitorInterface_awlen_m12;
input [9:0] AxiMonitorInterface_awlen_m13;
input [9:0] AxiMonitorInterface_awlen_m14;
input [9:0] AxiMonitorInterface_awlen_m15;
input [9:0] AxiMonitorInterface_awlen_m16;
input [9:0] AxiMonitorInterface_awlen_m17;
input [9:0] AxiMonitorInterface_awlen_m18;
input [9:0] AxiMonitorInterface_awlen_m19;
input [9:0] AxiMonitorInterface_awlen_m20;
input [9:0] AxiMonitorInterface_awlen_m21;
input [9:0] AxiMonitorInterface_awlen_m22;
input [9:0] AxiMonitorInterface_awlen_m23;
input [9:0] AxiMonitorInterface_awlen_m24;
input [9:0] AxiMonitorInterface_awlen_m25;
input [9:0] AxiMonitorInterface_awlen_m26;
input [9:0] AxiMonitorInterface_awlen_m27;
input [9:0] AxiMonitorInterface_awlen_m28;
input [9:0] AxiMonitorInterface_awlen_m29;
input [9:0] AxiMonitorInterface_awlen_m30;
input [9:0] AxiMonitorInterface_awlen_m31;
input [2:0] AxiMonitorInterface_awsize_m0;
input [2:0] AxiMonitorInterface_awsize_m1;
input [2:0] AxiMonitorInterface_awsize_m2;
input [2:0] AxiMonitorInterface_awsize_m3;
input [2:0] AxiMonitorInterface_awsize_m4;
input [2:0] AxiMonitorInterface_awsize_m5;
input [2:0] AxiMonitorInterface_awsize_m6;
input [2:0] AxiMonitorInterface_awsize_m7;
input [2:0] AxiMonitorInterface_awsize_m8;
input [2:0] AxiMonitorInterface_awsize_m9;
input [2:0] AxiMonitorInterface_awsize_m10;
input [2:0] AxiMonitorInterface_awsize_m11;
input [2:0] AxiMonitorInterface_awsize_m12;
input [2:0] AxiMonitorInterface_awsize_m13;
input [2:0] AxiMonitorInterface_awsize_m14;
input [2:0] AxiMonitorInterface_awsize_m15;
input [2:0] AxiMonitorInterface_awsize_m16;
input [2:0] AxiMonitorInterface_awsize_m17;
input [2:0] AxiMonitorInterface_awsize_m18;
input [2:0] AxiMonitorInterface_awsize_m19;
input [2:0] AxiMonitorInterface_awsize_m20;
input [2:0] AxiMonitorInterface_awsize_m21;
input [2:0] AxiMonitorInterface_awsize_m22;
input [2:0] AxiMonitorInterface_awsize_m23;
input [2:0] AxiMonitorInterface_awsize_m24;
input [2:0] AxiMonitorInterface_awsize_m25;
input [2:0] AxiMonitorInterface_awsize_m26;
input [2:0] AxiMonitorInterface_awsize_m27;
input [2:0] AxiMonitorInterface_awsize_m28;
input [2:0] AxiMonitorInterface_awsize_m29;
input [2:0] AxiMonitorInterface_awsize_m30;
input [2:0] AxiMonitorInterface_awsize_m31;
input [1:0] AxiMonitorInterface_awburst_m0;
input [1:0] AxiMonitorInterface_awburst_m1;
input [1:0] AxiMonitorInterface_awburst_m2;
input [1:0] AxiMonitorInterface_awburst_m3;
input [1:0] AxiMonitorInterface_awburst_m4;
input [1:0] AxiMonitorInterface_awburst_m5;
input [1:0] AxiMonitorInterface_awburst_m6;
input [1:0] AxiMonitorInterface_awburst_m7;
input [1:0] AxiMonitorInterface_awburst_m8;
input [1:0] AxiMonitorInterface_awburst_m9;
input [1:0] AxiMonitorInterface_awburst_m10;
input [1:0] AxiMonitorInterface_awburst_m11;
input [1:0] AxiMonitorInterface_awburst_m12;
input [1:0] AxiMonitorInterface_awburst_m13;
input [1:0] AxiMonitorInterface_awburst_m14;
input [1:0] AxiMonitorInterface_awburst_m15;
input [1:0] AxiMonitorInterface_awburst_m16;
input [1:0] AxiMonitorInterface_awburst_m17;
input [1:0] AxiMonitorInterface_awburst_m18;
input [1:0] AxiMonitorInterface_awburst_m19;
input [1:0] AxiMonitorInterface_awburst_m20;
input [1:0] AxiMonitorInterface_awburst_m21;
input [1:0] AxiMonitorInterface_awburst_m22;
input [1:0] AxiMonitorInterface_awburst_m23;
input [1:0] AxiMonitorInterface_awburst_m24;
input [1:0] AxiMonitorInterface_awburst_m25;
input [1:0] AxiMonitorInterface_awburst_m26;
input [1:0] AxiMonitorInterface_awburst_m27;
input [1:0] AxiMonitorInterface_awburst_m28;
input [1:0] AxiMonitorInterface_awburst_m29;
input [1:0] AxiMonitorInterface_awburst_m30;
input [1:0] AxiMonitorInterface_awburst_m31;
input [1:0] AxiMonitorInterface_awlock_m0;
input [1:0] AxiMonitorInterface_awlock_m1;
input [1:0] AxiMonitorInterface_awlock_m2;
input [1:0] AxiMonitorInterface_awlock_m3;
input [1:0] AxiMonitorInterface_awlock_m4;
input [1:0] AxiMonitorInterface_awlock_m5;
input [1:0] AxiMonitorInterface_awlock_m6;
input [1:0] AxiMonitorInterface_awlock_m7;
input [1:0] AxiMonitorInterface_awlock_m8;
input [1:0] AxiMonitorInterface_awlock_m9;
input [1:0] AxiMonitorInterface_awlock_m10;
input [1:0] AxiMonitorInterface_awlock_m11;
input [1:0] AxiMonitorInterface_awlock_m12;
input [1:0] AxiMonitorInterface_awlock_m13;
input [1:0] AxiMonitorInterface_awlock_m14;
input [1:0] AxiMonitorInterface_awlock_m15;
input [1:0] AxiMonitorInterface_awlock_m16;
input [1:0] AxiMonitorInterface_awlock_m17;
input [1:0] AxiMonitorInterface_awlock_m18;
input [1:0] AxiMonitorInterface_awlock_m19;
input [1:0] AxiMonitorInterface_awlock_m20;
input [1:0] AxiMonitorInterface_awlock_m21;
input [1:0] AxiMonitorInterface_awlock_m22;
input [1:0] AxiMonitorInterface_awlock_m23;
input [1:0] AxiMonitorInterface_awlock_m24;
input [1:0] AxiMonitorInterface_awlock_m25;
input [1:0] AxiMonitorInterface_awlock_m26;
input [1:0] AxiMonitorInterface_awlock_m27;
input [1:0] AxiMonitorInterface_awlock_m28;
input [1:0] AxiMonitorInterface_awlock_m29;
input [1:0] AxiMonitorInterface_awlock_m30;
input [1:0] AxiMonitorInterface_awlock_m31;
input [3:0] AxiMonitorInterface_awcache_m0;
input [3:0] AxiMonitorInterface_awcache_m1;
input [3:0] AxiMonitorInterface_awcache_m2;
input [3:0] AxiMonitorInterface_awcache_m3;
input [3:0] AxiMonitorInterface_awcache_m4;
input [3:0] AxiMonitorInterface_awcache_m5;
input [3:0] AxiMonitorInterface_awcache_m6;
input [3:0] AxiMonitorInterface_awcache_m7;
input [3:0] AxiMonitorInterface_awcache_m8;
input [3:0] AxiMonitorInterface_awcache_m9;
input [3:0] AxiMonitorInterface_awcache_m10;
input [3:0] AxiMonitorInterface_awcache_m11;
input [3:0] AxiMonitorInterface_awcache_m12;
input [3:0] AxiMonitorInterface_awcache_m13;
input [3:0] AxiMonitorInterface_awcache_m14;
input [3:0] AxiMonitorInterface_awcache_m15;
input [3:0] AxiMonitorInterface_awcache_m16;
input [3:0] AxiMonitorInterface_awcache_m17;
input [3:0] AxiMonitorInterface_awcache_m18;
input [3:0] AxiMonitorInterface_awcache_m19;
input [3:0] AxiMonitorInterface_awcache_m20;
input [3:0] AxiMonitorInterface_awcache_m21;
input [3:0] AxiMonitorInterface_awcache_m22;
input [3:0] AxiMonitorInterface_awcache_m23;
input [3:0] AxiMonitorInterface_awcache_m24;
input [3:0] AxiMonitorInterface_awcache_m25;
input [3:0] AxiMonitorInterface_awcache_m26;
input [3:0] AxiMonitorInterface_awcache_m27;
input [3:0] AxiMonitorInterface_awcache_m28;
input [3:0] AxiMonitorInterface_awcache_m29;
input [3:0] AxiMonitorInterface_awcache_m30;
input [3:0] AxiMonitorInterface_awcache_m31;
input [2:0] AxiMonitorInterface_awprot_m0;
input [2:0] AxiMonitorInterface_awprot_m1;
input [2:0] AxiMonitorInterface_awprot_m2;
input [2:0] AxiMonitorInterface_awprot_m3;
input [2:0] AxiMonitorInterface_awprot_m4;
input [2:0] AxiMonitorInterface_awprot_m5;
input [2:0] AxiMonitorInterface_awprot_m6;
input [2:0] AxiMonitorInterface_awprot_m7;
input [2:0] AxiMonitorInterface_awprot_m8;
input [2:0] AxiMonitorInterface_awprot_m9;
input [2:0] AxiMonitorInterface_awprot_m10;
input [2:0] AxiMonitorInterface_awprot_m11;
input [2:0] AxiMonitorInterface_awprot_m12;
input [2:0] AxiMonitorInterface_awprot_m13;
input [2:0] AxiMonitorInterface_awprot_m14;
input [2:0] AxiMonitorInterface_awprot_m15;
input [2:0] AxiMonitorInterface_awprot_m16;
input [2:0] AxiMonitorInterface_awprot_m17;
input [2:0] AxiMonitorInterface_awprot_m18;
input [2:0] AxiMonitorInterface_awprot_m19;
input [2:0] AxiMonitorInterface_awprot_m20;
input [2:0] AxiMonitorInterface_awprot_m21;
input [2:0] AxiMonitorInterface_awprot_m22;
input [2:0] AxiMonitorInterface_awprot_m23;
input [2:0] AxiMonitorInterface_awprot_m24;
input [2:0] AxiMonitorInterface_awprot_m25;
input [2:0] AxiMonitorInterface_awprot_m26;
input [2:0] AxiMonitorInterface_awprot_m27;
input [2:0] AxiMonitorInterface_awprot_m28;
input [2:0] AxiMonitorInterface_awprot_m29;
input [2:0] AxiMonitorInterface_awprot_m30;
input [2:0] AxiMonitorInterface_awprot_m31;
input [31:0] AxiMonitorInterface_awid_m0;
input [31:0] AxiMonitorInterface_awid_m1;
input [31:0] AxiMonitorInterface_awid_m2;
input [31:0] AxiMonitorInterface_awid_m3;
input [31:0] AxiMonitorInterface_awid_m4;
input [31:0] AxiMonitorInterface_awid_m5;
input [31:0] AxiMonitorInterface_awid_m6;
input [31:0] AxiMonitorInterface_awid_m7;
input [31:0] AxiMonitorInterface_awid_m8;
input [31:0] AxiMonitorInterface_awid_m9;
input [31:0] AxiMonitorInterface_awid_m10;
input [31:0] AxiMonitorInterface_awid_m11;
input [31:0] AxiMonitorInterface_awid_m12;
input [31:0] AxiMonitorInterface_awid_m13;
input [31:0] AxiMonitorInterface_awid_m14;
input [31:0] AxiMonitorInterface_awid_m15;
input [31:0] AxiMonitorInterface_awid_m16;
input [31:0] AxiMonitorInterface_awid_m17;
input [31:0] AxiMonitorInterface_awid_m18;
input [31:0] AxiMonitorInterface_awid_m19;
input [31:0] AxiMonitorInterface_awid_m20;
input [31:0] AxiMonitorInterface_awid_m21;
input [31:0] AxiMonitorInterface_awid_m22;
input [31:0] AxiMonitorInterface_awid_m23;
input [31:0] AxiMonitorInterface_awid_m24;
input [31:0] AxiMonitorInterface_awid_m25;
input [31:0] AxiMonitorInterface_awid_m26;
input [31:0] AxiMonitorInterface_awid_m27;
input [31:0] AxiMonitorInterface_awid_m28;
input [31:0] AxiMonitorInterface_awid_m29;
input [31:0] AxiMonitorInterface_awid_m30;
input [31:0] AxiMonitorInterface_awid_m31;
input AxiMonitorInterface_awready_m0;
input AxiMonitorInterface_awready_m1;
input AxiMonitorInterface_awready_m2;
input AxiMonitorInterface_awready_m3;
input AxiMonitorInterface_awready_m4;
input AxiMonitorInterface_awready_m5;
input AxiMonitorInterface_awready_m6;
input AxiMonitorInterface_awready_m7;
input AxiMonitorInterface_awready_m8;
input AxiMonitorInterface_awready_m9;
input AxiMonitorInterface_awready_m10;
input AxiMonitorInterface_awready_m11;
input AxiMonitorInterface_awready_m12;
input AxiMonitorInterface_awready_m13;
input AxiMonitorInterface_awready_m14;
input AxiMonitorInterface_awready_m15;
input AxiMonitorInterface_awready_m16;
input AxiMonitorInterface_awready_m17;
input AxiMonitorInterface_awready_m18;
input AxiMonitorInterface_awready_m19;
input AxiMonitorInterface_awready_m20;
input AxiMonitorInterface_awready_m21;
input AxiMonitorInterface_awready_m22;
input AxiMonitorInterface_awready_m23;
input AxiMonitorInterface_awready_m24;
input AxiMonitorInterface_awready_m25;
input AxiMonitorInterface_awready_m26;
input AxiMonitorInterface_awready_m27;
input AxiMonitorInterface_awready_m28;
input AxiMonitorInterface_awready_m29;
input AxiMonitorInterface_awready_m30;
input AxiMonitorInterface_awready_m31;
input [63:0] AxiMonitorInterface_awsideband_m0;
input [63:0] AxiMonitorInterface_awsideband_m1;
input [63:0] AxiMonitorInterface_awsideband_m2;
input [63:0] AxiMonitorInterface_awsideband_m3;
input [63:0] AxiMonitorInterface_awsideband_m4;
input [63:0] AxiMonitorInterface_awsideband_m5;
input [63:0] AxiMonitorInterface_awsideband_m6;
input [63:0] AxiMonitorInterface_awsideband_m7;
input [63:0] AxiMonitorInterface_awsideband_m8;
input [63:0] AxiMonitorInterface_awsideband_m9;
input [63:0] AxiMonitorInterface_awsideband_m10;
input [63:0] AxiMonitorInterface_awsideband_m11;
input [63:0] AxiMonitorInterface_awsideband_m12;
input [63:0] AxiMonitorInterface_awsideband_m13;
input [63:0] AxiMonitorInterface_awsideband_m14;
input [63:0] AxiMonitorInterface_awsideband_m15;
input [63:0] AxiMonitorInterface_awsideband_m16;
input [63:0] AxiMonitorInterface_awsideband_m17;
input [63:0] AxiMonitorInterface_awsideband_m18;
input [63:0] AxiMonitorInterface_awsideband_m19;
input [63:0] AxiMonitorInterface_awsideband_m20;
input [63:0] AxiMonitorInterface_awsideband_m21;
input [63:0] AxiMonitorInterface_awsideband_m22;
input [63:0] AxiMonitorInterface_awsideband_m23;
input [63:0] AxiMonitorInterface_awsideband_m24;
input [63:0] AxiMonitorInterface_awsideband_m25;
input [63:0] AxiMonitorInterface_awsideband_m26;
input [63:0] AxiMonitorInterface_awsideband_m27;
input [63:0] AxiMonitorInterface_awsideband_m28;
input [63:0] AxiMonitorInterface_awsideband_m29;
input [63:0] AxiMonitorInterface_awsideband_m30;
input [63:0] AxiMonitorInterface_awsideband_m31;
input AxiMonitorInterface_rvalid_m0;
input AxiMonitorInterface_rvalid_m1;
input AxiMonitorInterface_rvalid_m2;
input AxiMonitorInterface_rvalid_m3;
input AxiMonitorInterface_rvalid_m4;
input AxiMonitorInterface_rvalid_m5;
input AxiMonitorInterface_rvalid_m6;
input AxiMonitorInterface_rvalid_m7;
input AxiMonitorInterface_rvalid_m8;
input AxiMonitorInterface_rvalid_m9;
input AxiMonitorInterface_rvalid_m10;
input AxiMonitorInterface_rvalid_m11;
input AxiMonitorInterface_rvalid_m12;
input AxiMonitorInterface_rvalid_m13;
input AxiMonitorInterface_rvalid_m14;
input AxiMonitorInterface_rvalid_m15;
input AxiMonitorInterface_rvalid_m16;
input AxiMonitorInterface_rvalid_m17;
input AxiMonitorInterface_rvalid_m18;
input AxiMonitorInterface_rvalid_m19;
input AxiMonitorInterface_rvalid_m20;
input AxiMonitorInterface_rvalid_m21;
input AxiMonitorInterface_rvalid_m22;
input AxiMonitorInterface_rvalid_m23;
input AxiMonitorInterface_rvalid_m24;
input AxiMonitorInterface_rvalid_m25;
input AxiMonitorInterface_rvalid_m26;
input AxiMonitorInterface_rvalid_m27;
input AxiMonitorInterface_rvalid_m28;
input AxiMonitorInterface_rvalid_m29;
input AxiMonitorInterface_rvalid_m30;
input AxiMonitorInterface_rvalid_m31;
input AxiMonitorInterface_rlast_m0;
input AxiMonitorInterface_rlast_m1;
input AxiMonitorInterface_rlast_m2;
input AxiMonitorInterface_rlast_m3;
input AxiMonitorInterface_rlast_m4;
input AxiMonitorInterface_rlast_m5;
input AxiMonitorInterface_rlast_m6;
input AxiMonitorInterface_rlast_m7;
input AxiMonitorInterface_rlast_m8;
input AxiMonitorInterface_rlast_m9;
input AxiMonitorInterface_rlast_m10;
input AxiMonitorInterface_rlast_m11;
input AxiMonitorInterface_rlast_m12;
input AxiMonitorInterface_rlast_m13;
input AxiMonitorInterface_rlast_m14;
input AxiMonitorInterface_rlast_m15;
input AxiMonitorInterface_rlast_m16;
input AxiMonitorInterface_rlast_m17;
input AxiMonitorInterface_rlast_m18;
input AxiMonitorInterface_rlast_m19;
input AxiMonitorInterface_rlast_m20;
input AxiMonitorInterface_rlast_m21;
input AxiMonitorInterface_rlast_m22;
input AxiMonitorInterface_rlast_m23;
input AxiMonitorInterface_rlast_m24;
input AxiMonitorInterface_rlast_m25;
input AxiMonitorInterface_rlast_m26;
input AxiMonitorInterface_rlast_m27;
input AxiMonitorInterface_rlast_m28;
input AxiMonitorInterface_rlast_m29;
input AxiMonitorInterface_rlast_m30;
input AxiMonitorInterface_rlast_m31;
input [1023:0] AxiMonitorInterface_rdata_m0;
input [1023:0] AxiMonitorInterface_rdata_m1;
input [1023:0] AxiMonitorInterface_rdata_m2;
input [1023:0] AxiMonitorInterface_rdata_m3;
input [1023:0] AxiMonitorInterface_rdata_m4;
input [1023:0] AxiMonitorInterface_rdata_m5;
input [1023:0] AxiMonitorInterface_rdata_m6;
input [1023:0] AxiMonitorInterface_rdata_m7;
input [1023:0] AxiMonitorInterface_rdata_m8;
input [1023:0] AxiMonitorInterface_rdata_m9;
input [1023:0] AxiMonitorInterface_rdata_m10;
input [1023:0] AxiMonitorInterface_rdata_m11;
input [1023:0] AxiMonitorInterface_rdata_m12;
input [1023:0] AxiMonitorInterface_rdata_m13;
input [1023:0] AxiMonitorInterface_rdata_m14;
input [1023:0] AxiMonitorInterface_rdata_m15;
input [1023:0] AxiMonitorInterface_rdata_m16;
input [1023:0] AxiMonitorInterface_rdata_m17;
input [1023:0] AxiMonitorInterface_rdata_m18;
input [1023:0] AxiMonitorInterface_rdata_m19;
input [1023:0] AxiMonitorInterface_rdata_m20;
input [1023:0] AxiMonitorInterface_rdata_m21;
input [1023:0] AxiMonitorInterface_rdata_m22;
input [1023:0] AxiMonitorInterface_rdata_m23;
input [1023:0] AxiMonitorInterface_rdata_m24;
input [1023:0] AxiMonitorInterface_rdata_m25;
input [1023:0] AxiMonitorInterface_rdata_m26;
input [1023:0] AxiMonitorInterface_rdata_m27;
input [1023:0] AxiMonitorInterface_rdata_m28;
input [1023:0] AxiMonitorInterface_rdata_m29;
input [1023:0] AxiMonitorInterface_rdata_m30;
input [1023:0] AxiMonitorInterface_rdata_m31;
input [1:0] AxiMonitorInterface_rresp_m0;
input [1:0] AxiMonitorInterface_rresp_m1;
input [1:0] AxiMonitorInterface_rresp_m2;
input [1:0] AxiMonitorInterface_rresp_m3;
input [1:0] AxiMonitorInterface_rresp_m4;
input [1:0] AxiMonitorInterface_rresp_m5;
input [1:0] AxiMonitorInterface_rresp_m6;
input [1:0] AxiMonitorInterface_rresp_m7;
input [1:0] AxiMonitorInterface_rresp_m8;
input [1:0] AxiMonitorInterface_rresp_m9;
input [1:0] AxiMonitorInterface_rresp_m10;
input [1:0] AxiMonitorInterface_rresp_m11;
input [1:0] AxiMonitorInterface_rresp_m12;
input [1:0] AxiMonitorInterface_rresp_m13;
input [1:0] AxiMonitorInterface_rresp_m14;
input [1:0] AxiMonitorInterface_rresp_m15;
input [1:0] AxiMonitorInterface_rresp_m16;
input [1:0] AxiMonitorInterface_rresp_m17;
input [1:0] AxiMonitorInterface_rresp_m18;
input [1:0] AxiMonitorInterface_rresp_m19;
input [1:0] AxiMonitorInterface_rresp_m20;
input [1:0] AxiMonitorInterface_rresp_m21;
input [1:0] AxiMonitorInterface_rresp_m22;
input [1:0] AxiMonitorInterface_rresp_m23;
input [1:0] AxiMonitorInterface_rresp_m24;
input [1:0] AxiMonitorInterface_rresp_m25;
input [1:0] AxiMonitorInterface_rresp_m26;
input [1:0] AxiMonitorInterface_rresp_m27;
input [1:0] AxiMonitorInterface_rresp_m28;
input [1:0] AxiMonitorInterface_rresp_m29;
input [1:0] AxiMonitorInterface_rresp_m30;
input [1:0] AxiMonitorInterface_rresp_m31;
input [31:0] AxiMonitorInterface_rid_m0;
input [31:0] AxiMonitorInterface_rid_m1;
input [31:0] AxiMonitorInterface_rid_m2;
input [31:0] AxiMonitorInterface_rid_m3;
input [31:0] AxiMonitorInterface_rid_m4;
input [31:0] AxiMonitorInterface_rid_m5;
input [31:0] AxiMonitorInterface_rid_m6;
input [31:0] AxiMonitorInterface_rid_m7;
input [31:0] AxiMonitorInterface_rid_m8;
input [31:0] AxiMonitorInterface_rid_m9;
input [31:0] AxiMonitorInterface_rid_m10;
input [31:0] AxiMonitorInterface_rid_m11;
input [31:0] AxiMonitorInterface_rid_m12;
input [31:0] AxiMonitorInterface_rid_m13;
input [31:0] AxiMonitorInterface_rid_m14;
input [31:0] AxiMonitorInterface_rid_m15;
input [31:0] AxiMonitorInterface_rid_m16;
input [31:0] AxiMonitorInterface_rid_m17;
input [31:0] AxiMonitorInterface_rid_m18;
input [31:0] AxiMonitorInterface_rid_m19;
input [31:0] AxiMonitorInterface_rid_m20;
input [31:0] AxiMonitorInterface_rid_m21;
input [31:0] AxiMonitorInterface_rid_m22;
input [31:0] AxiMonitorInterface_rid_m23;
input [31:0] AxiMonitorInterface_rid_m24;
input [31:0] AxiMonitorInterface_rid_m25;
input [31:0] AxiMonitorInterface_rid_m26;
input [31:0] AxiMonitorInterface_rid_m27;
input [31:0] AxiMonitorInterface_rid_m28;
input [31:0] AxiMonitorInterface_rid_m29;
input [31:0] AxiMonitorInterface_rid_m30;
input [31:0] AxiMonitorInterface_rid_m31;
input AxiMonitorInterface_rready_m0;
input AxiMonitorInterface_rready_m1;
input AxiMonitorInterface_rready_m2;
input AxiMonitorInterface_rready_m3;
input AxiMonitorInterface_rready_m4;
input AxiMonitorInterface_rready_m5;
input AxiMonitorInterface_rready_m6;
input AxiMonitorInterface_rready_m7;
input AxiMonitorInterface_rready_m8;
input AxiMonitorInterface_rready_m9;
input AxiMonitorInterface_rready_m10;
input AxiMonitorInterface_rready_m11;
input AxiMonitorInterface_rready_m12;
input AxiMonitorInterface_rready_m13;
input AxiMonitorInterface_rready_m14;
input AxiMonitorInterface_rready_m15;
input AxiMonitorInterface_rready_m16;
input AxiMonitorInterface_rready_m17;
input AxiMonitorInterface_rready_m18;
input AxiMonitorInterface_rready_m19;
input AxiMonitorInterface_rready_m20;
input AxiMonitorInterface_rready_m21;
input AxiMonitorInterface_rready_m22;
input AxiMonitorInterface_rready_m23;
input AxiMonitorInterface_rready_m24;
input AxiMonitorInterface_rready_m25;
input AxiMonitorInterface_rready_m26;
input AxiMonitorInterface_rready_m27;
input AxiMonitorInterface_rready_m28;
input AxiMonitorInterface_rready_m29;
input AxiMonitorInterface_rready_m30;
input AxiMonitorInterface_rready_m31;
input [63:0] AxiMonitorInterface_rsideband_m0;
input [63:0] AxiMonitorInterface_rsideband_m1;
input [63:0] AxiMonitorInterface_rsideband_m2;
input [63:0] AxiMonitorInterface_rsideband_m3;
input [63:0] AxiMonitorInterface_rsideband_m4;
input [63:0] AxiMonitorInterface_rsideband_m5;
input [63:0] AxiMonitorInterface_rsideband_m6;
input [63:0] AxiMonitorInterface_rsideband_m7;
input [63:0] AxiMonitorInterface_rsideband_m8;
input [63:0] AxiMonitorInterface_rsideband_m9;
input [63:0] AxiMonitorInterface_rsideband_m10;
input [63:0] AxiMonitorInterface_rsideband_m11;
input [63:0] AxiMonitorInterface_rsideband_m12;
input [63:0] AxiMonitorInterface_rsideband_m13;
input [63:0] AxiMonitorInterface_rsideband_m14;
input [63:0] AxiMonitorInterface_rsideband_m15;
input [63:0] AxiMonitorInterface_rsideband_m16;
input [63:0] AxiMonitorInterface_rsideband_m17;
input [63:0] AxiMonitorInterface_rsideband_m18;
input [63:0] AxiMonitorInterface_rsideband_m19;
input [63:0] AxiMonitorInterface_rsideband_m20;
input [63:0] AxiMonitorInterface_rsideband_m21;
input [63:0] AxiMonitorInterface_rsideband_m22;
input [63:0] AxiMonitorInterface_rsideband_m23;
input [63:0] AxiMonitorInterface_rsideband_m24;
input [63:0] AxiMonitorInterface_rsideband_m25;
input [63:0] AxiMonitorInterface_rsideband_m26;
input [63:0] AxiMonitorInterface_rsideband_m27;
input [63:0] AxiMonitorInterface_rsideband_m28;
input [63:0] AxiMonitorInterface_rsideband_m29;
input [63:0] AxiMonitorInterface_rsideband_m30;
input [63:0] AxiMonitorInterface_rsideband_m31;
input AxiMonitorInterface_wvalid_m0;
input AxiMonitorInterface_wvalid_m1;
input AxiMonitorInterface_wvalid_m2;
input AxiMonitorInterface_wvalid_m3;
input AxiMonitorInterface_wvalid_m4;
input AxiMonitorInterface_wvalid_m5;
input AxiMonitorInterface_wvalid_m6;
input AxiMonitorInterface_wvalid_m7;
input AxiMonitorInterface_wvalid_m8;
input AxiMonitorInterface_wvalid_m9;
input AxiMonitorInterface_wvalid_m10;
input AxiMonitorInterface_wvalid_m11;
input AxiMonitorInterface_wvalid_m12;
input AxiMonitorInterface_wvalid_m13;
input AxiMonitorInterface_wvalid_m14;
input AxiMonitorInterface_wvalid_m15;
input AxiMonitorInterface_wvalid_m16;
input AxiMonitorInterface_wvalid_m17;
input AxiMonitorInterface_wvalid_m18;
input AxiMonitorInterface_wvalid_m19;
input AxiMonitorInterface_wvalid_m20;
input AxiMonitorInterface_wvalid_m21;
input AxiMonitorInterface_wvalid_m22;
input AxiMonitorInterface_wvalid_m23;
input AxiMonitorInterface_wvalid_m24;
input AxiMonitorInterface_wvalid_m25;
input AxiMonitorInterface_wvalid_m26;
input AxiMonitorInterface_wvalid_m27;
input AxiMonitorInterface_wvalid_m28;
input AxiMonitorInterface_wvalid_m29;
input AxiMonitorInterface_wvalid_m30;
input AxiMonitorInterface_wvalid_m31;
input AxiMonitorInterface_wlast_m0;
input AxiMonitorInterface_wlast_m1;
input AxiMonitorInterface_wlast_m2;
input AxiMonitorInterface_wlast_m3;
input AxiMonitorInterface_wlast_m4;
input AxiMonitorInterface_wlast_m5;
input AxiMonitorInterface_wlast_m6;
input AxiMonitorInterface_wlast_m7;
input AxiMonitorInterface_wlast_m8;
input AxiMonitorInterface_wlast_m9;
input AxiMonitorInterface_wlast_m10;
input AxiMonitorInterface_wlast_m11;
input AxiMonitorInterface_wlast_m12;
input AxiMonitorInterface_wlast_m13;
input AxiMonitorInterface_wlast_m14;
input AxiMonitorInterface_wlast_m15;
input AxiMonitorInterface_wlast_m16;
input AxiMonitorInterface_wlast_m17;
input AxiMonitorInterface_wlast_m18;
input AxiMonitorInterface_wlast_m19;
input AxiMonitorInterface_wlast_m20;
input AxiMonitorInterface_wlast_m21;
input AxiMonitorInterface_wlast_m22;
input AxiMonitorInterface_wlast_m23;
input AxiMonitorInterface_wlast_m24;
input AxiMonitorInterface_wlast_m25;
input AxiMonitorInterface_wlast_m26;
input AxiMonitorInterface_wlast_m27;
input AxiMonitorInterface_wlast_m28;
input AxiMonitorInterface_wlast_m29;
input AxiMonitorInterface_wlast_m30;
input AxiMonitorInterface_wlast_m31;
input [1023:0] AxiMonitorInterface_wdata_m0;
input [1023:0] AxiMonitorInterface_wdata_m1;
input [1023:0] AxiMonitorInterface_wdata_m2;
input [1023:0] AxiMonitorInterface_wdata_m3;
input [1023:0] AxiMonitorInterface_wdata_m4;
input [1023:0] AxiMonitorInterface_wdata_m5;
input [1023:0] AxiMonitorInterface_wdata_m6;
input [1023:0] AxiMonitorInterface_wdata_m7;
input [1023:0] AxiMonitorInterface_wdata_m8;
input [1023:0] AxiMonitorInterface_wdata_m9;
input [1023:0] AxiMonitorInterface_wdata_m10;
input [1023:0] AxiMonitorInterface_wdata_m11;
input [1023:0] AxiMonitorInterface_wdata_m12;
input [1023:0] AxiMonitorInterface_wdata_m13;
input [1023:0] AxiMonitorInterface_wdata_m14;
input [1023:0] AxiMonitorInterface_wdata_m15;
input [1023:0] AxiMonitorInterface_wdata_m16;
input [1023:0] AxiMonitorInterface_wdata_m17;
input [1023:0] AxiMonitorInterface_wdata_m18;
input [1023:0] AxiMonitorInterface_wdata_m19;
input [1023:0] AxiMonitorInterface_wdata_m20;
input [1023:0] AxiMonitorInterface_wdata_m21;
input [1023:0] AxiMonitorInterface_wdata_m22;
input [1023:0] AxiMonitorInterface_wdata_m23;
input [1023:0] AxiMonitorInterface_wdata_m24;
input [1023:0] AxiMonitorInterface_wdata_m25;
input [1023:0] AxiMonitorInterface_wdata_m26;
input [1023:0] AxiMonitorInterface_wdata_m27;
input [1023:0] AxiMonitorInterface_wdata_m28;
input [1023:0] AxiMonitorInterface_wdata_m29;
input [1023:0] AxiMonitorInterface_wdata_m30;
input [1023:0] AxiMonitorInterface_wdata_m31;
input [127:0] AxiMonitorInterface_wstrb_m0;
input [127:0] AxiMonitorInterface_wstrb_m1;
input [127:0] AxiMonitorInterface_wstrb_m2;
input [127:0] AxiMonitorInterface_wstrb_m3;
input [127:0] AxiMonitorInterface_wstrb_m4;
input [127:0] AxiMonitorInterface_wstrb_m5;
input [127:0] AxiMonitorInterface_wstrb_m6;
input [127:0] AxiMonitorInterface_wstrb_m7;
input [127:0] AxiMonitorInterface_wstrb_m8;
input [127:0] AxiMonitorInterface_wstrb_m9;
input [127:0] AxiMonitorInterface_wstrb_m10;
input [127:0] AxiMonitorInterface_wstrb_m11;
input [127:0] AxiMonitorInterface_wstrb_m12;
input [127:0] AxiMonitorInterface_wstrb_m13;
input [127:0] AxiMonitorInterface_wstrb_m14;
input [127:0] AxiMonitorInterface_wstrb_m15;
input [127:0] AxiMonitorInterface_wstrb_m16;
input [127:0] AxiMonitorInterface_wstrb_m17;
input [127:0] AxiMonitorInterface_wstrb_m18;
input [127:0] AxiMonitorInterface_wstrb_m19;
input [127:0] AxiMonitorInterface_wstrb_m20;
input [127:0] AxiMonitorInterface_wstrb_m21;
input [127:0] AxiMonitorInterface_wstrb_m22;
input [127:0] AxiMonitorInterface_wstrb_m23;
input [127:0] AxiMonitorInterface_wstrb_m24;
input [127:0] AxiMonitorInterface_wstrb_m25;
input [127:0] AxiMonitorInterface_wstrb_m26;
input [127:0] AxiMonitorInterface_wstrb_m27;
input [127:0] AxiMonitorInterface_wstrb_m28;
input [127:0] AxiMonitorInterface_wstrb_m29;
input [127:0] AxiMonitorInterface_wstrb_m30;
input [127:0] AxiMonitorInterface_wstrb_m31;
input [31:0] AxiMonitorInterface_wid_m0;
input [31:0] AxiMonitorInterface_wid_m1;
input [31:0] AxiMonitorInterface_wid_m2;
input [31:0] AxiMonitorInterface_wid_m3;
input [31:0] AxiMonitorInterface_wid_m4;
input [31:0] AxiMonitorInterface_wid_m5;
input [31:0] AxiMonitorInterface_wid_m6;
input [31:0] AxiMonitorInterface_wid_m7;
input [31:0] AxiMonitorInterface_wid_m8;
input [31:0] AxiMonitorInterface_wid_m9;
input [31:0] AxiMonitorInterface_wid_m10;
input [31:0] AxiMonitorInterface_wid_m11;
input [31:0] AxiMonitorInterface_wid_m12;
input [31:0] AxiMonitorInterface_wid_m13;
input [31:0] AxiMonitorInterface_wid_m14;
input [31:0] AxiMonitorInterface_wid_m15;
input [31:0] AxiMonitorInterface_wid_m16;
input [31:0] AxiMonitorInterface_wid_m17;
input [31:0] AxiMonitorInterface_wid_m18;
input [31:0] AxiMonitorInterface_wid_m19;
input [31:0] AxiMonitorInterface_wid_m20;
input [31:0] AxiMonitorInterface_wid_m21;
input [31:0] AxiMonitorInterface_wid_m22;
input [31:0] AxiMonitorInterface_wid_m23;
input [31:0] AxiMonitorInterface_wid_m24;
input [31:0] AxiMonitorInterface_wid_m25;
input [31:0] AxiMonitorInterface_wid_m26;
input [31:0] AxiMonitorInterface_wid_m27;
input [31:0] AxiMonitorInterface_wid_m28;
input [31:0] AxiMonitorInterface_wid_m29;
input [31:0] AxiMonitorInterface_wid_m30;
input [31:0] AxiMonitorInterface_wid_m31;
input AxiMonitorInterface_wready_m0;
input AxiMonitorInterface_wready_m1;
input AxiMonitorInterface_wready_m2;
input AxiMonitorInterface_wready_m3;
input AxiMonitorInterface_wready_m4;
input AxiMonitorInterface_wready_m5;
input AxiMonitorInterface_wready_m6;
input AxiMonitorInterface_wready_m7;
input AxiMonitorInterface_wready_m8;
input AxiMonitorInterface_wready_m9;
input AxiMonitorInterface_wready_m10;
input AxiMonitorInterface_wready_m11;
input AxiMonitorInterface_wready_m12;
input AxiMonitorInterface_wready_m13;
input AxiMonitorInterface_wready_m14;
input AxiMonitorInterface_wready_m15;
input AxiMonitorInterface_wready_m16;
input AxiMonitorInterface_wready_m17;
input AxiMonitorInterface_wready_m18;
input AxiMonitorInterface_wready_m19;
input AxiMonitorInterface_wready_m20;
input AxiMonitorInterface_wready_m21;
input AxiMonitorInterface_wready_m22;
input AxiMonitorInterface_wready_m23;
input AxiMonitorInterface_wready_m24;
input AxiMonitorInterface_wready_m25;
input AxiMonitorInterface_wready_m26;
input AxiMonitorInterface_wready_m27;
input AxiMonitorInterface_wready_m28;
input AxiMonitorInterface_wready_m29;
input AxiMonitorInterface_wready_m30;
input AxiMonitorInterface_wready_m31;
input [63:0] AxiMonitorInterface_wsideband_m0;
input [63:0] AxiMonitorInterface_wsideband_m1;
input [63:0] AxiMonitorInterface_wsideband_m2;
input [63:0] AxiMonitorInterface_wsideband_m3;
input [63:0] AxiMonitorInterface_wsideband_m4;
input [63:0] AxiMonitorInterface_wsideband_m5;
input [63:0] AxiMonitorInterface_wsideband_m6;
input [63:0] AxiMonitorInterface_wsideband_m7;
input [63:0] AxiMonitorInterface_wsideband_m8;
input [63:0] AxiMonitorInterface_wsideband_m9;
input [63:0] AxiMonitorInterface_wsideband_m10;
input [63:0] AxiMonitorInterface_wsideband_m11;
input [63:0] AxiMonitorInterface_wsideband_m12;
input [63:0] AxiMonitorInterface_wsideband_m13;
input [63:0] AxiMonitorInterface_wsideband_m14;
input [63:0] AxiMonitorInterface_wsideband_m15;
input [63:0] AxiMonitorInterface_wsideband_m16;
input [63:0] AxiMonitorInterface_wsideband_m17;
input [63:0] AxiMonitorInterface_wsideband_m18;
input [63:0] AxiMonitorInterface_wsideband_m19;
input [63:0] AxiMonitorInterface_wsideband_m20;
input [63:0] AxiMonitorInterface_wsideband_m21;
input [63:0] AxiMonitorInterface_wsideband_m22;
input [63:0] AxiMonitorInterface_wsideband_m23;
input [63:0] AxiMonitorInterface_wsideband_m24;
input [63:0] AxiMonitorInterface_wsideband_m25;
input [63:0] AxiMonitorInterface_wsideband_m26;
input [63:0] AxiMonitorInterface_wsideband_m27;
input [63:0] AxiMonitorInterface_wsideband_m28;
input [63:0] AxiMonitorInterface_wsideband_m29;
input [63:0] AxiMonitorInterface_wsideband_m30;
input [63:0] AxiMonitorInterface_wsideband_m31;
input AxiMonitorInterface_bvalid_m0;
input AxiMonitorInterface_bvalid_m1;
input AxiMonitorInterface_bvalid_m2;
input AxiMonitorInterface_bvalid_m3;
input AxiMonitorInterface_bvalid_m4;
input AxiMonitorInterface_bvalid_m5;
input AxiMonitorInterface_bvalid_m6;
input AxiMonitorInterface_bvalid_m7;
input AxiMonitorInterface_bvalid_m8;
input AxiMonitorInterface_bvalid_m9;
input AxiMonitorInterface_bvalid_m10;
input AxiMonitorInterface_bvalid_m11;
input AxiMonitorInterface_bvalid_m12;
input AxiMonitorInterface_bvalid_m13;
input AxiMonitorInterface_bvalid_m14;
input AxiMonitorInterface_bvalid_m15;
input AxiMonitorInterface_bvalid_m16;
input AxiMonitorInterface_bvalid_m17;
input AxiMonitorInterface_bvalid_m18;
input AxiMonitorInterface_bvalid_m19;
input AxiMonitorInterface_bvalid_m20;
input AxiMonitorInterface_bvalid_m21;
input AxiMonitorInterface_bvalid_m22;
input AxiMonitorInterface_bvalid_m23;
input AxiMonitorInterface_bvalid_m24;
input AxiMonitorInterface_bvalid_m25;
input AxiMonitorInterface_bvalid_m26;
input AxiMonitorInterface_bvalid_m27;
input AxiMonitorInterface_bvalid_m28;
input AxiMonitorInterface_bvalid_m29;
input AxiMonitorInterface_bvalid_m30;
input AxiMonitorInterface_bvalid_m31;
input [1:0] AxiMonitorInterface_bresp_m0;
input [1:0] AxiMonitorInterface_bresp_m1;
input [1:0] AxiMonitorInterface_bresp_m2;
input [1:0] AxiMonitorInterface_bresp_m3;
input [1:0] AxiMonitorInterface_bresp_m4;
input [1:0] AxiMonitorInterface_bresp_m5;
input [1:0] AxiMonitorInterface_bresp_m6;
input [1:0] AxiMonitorInterface_bresp_m7;
input [1:0] AxiMonitorInterface_bresp_m8;
input [1:0] AxiMonitorInterface_bresp_m9;
input [1:0] AxiMonitorInterface_bresp_m10;
input [1:0] AxiMonitorInterface_bresp_m11;
input [1:0] AxiMonitorInterface_bresp_m12;
input [1:0] AxiMonitorInterface_bresp_m13;
input [1:0] AxiMonitorInterface_bresp_m14;
input [1:0] AxiMonitorInterface_bresp_m15;
input [1:0] AxiMonitorInterface_bresp_m16;
input [1:0] AxiMonitorInterface_bresp_m17;
input [1:0] AxiMonitorInterface_bresp_m18;
input [1:0] AxiMonitorInterface_bresp_m19;
input [1:0] AxiMonitorInterface_bresp_m20;
input [1:0] AxiMonitorInterface_bresp_m21;
input [1:0] AxiMonitorInterface_bresp_m22;
input [1:0] AxiMonitorInterface_bresp_m23;
input [1:0] AxiMonitorInterface_bresp_m24;
input [1:0] AxiMonitorInterface_bresp_m25;
input [1:0] AxiMonitorInterface_bresp_m26;
input [1:0] AxiMonitorInterface_bresp_m27;
input [1:0] AxiMonitorInterface_bresp_m28;
input [1:0] AxiMonitorInterface_bresp_m29;
input [1:0] AxiMonitorInterface_bresp_m30;
input [1:0] AxiMonitorInterface_bresp_m31;
input [31:0] AxiMonitorInterface_bid_m0;
input [31:0] AxiMonitorInterface_bid_m1;
input [31:0] AxiMonitorInterface_bid_m2;
input [31:0] AxiMonitorInterface_bid_m3;
input [31:0] AxiMonitorInterface_bid_m4;
input [31:0] AxiMonitorInterface_bid_m5;
input [31:0] AxiMonitorInterface_bid_m6;
input [31:0] AxiMonitorInterface_bid_m7;
input [31:0] AxiMonitorInterface_bid_m8;
input [31:0] AxiMonitorInterface_bid_m9;
input [31:0] AxiMonitorInterface_bid_m10;
input [31:0] AxiMonitorInterface_bid_m11;
input [31:0] AxiMonitorInterface_bid_m12;
input [31:0] AxiMonitorInterface_bid_m13;
input [31:0] AxiMonitorInterface_bid_m14;
input [31:0] AxiMonitorInterface_bid_m15;
input [31:0] AxiMonitorInterface_bid_m16;
input [31:0] AxiMonitorInterface_bid_m17;
input [31:0] AxiMonitorInterface_bid_m18;
input [31:0] AxiMonitorInterface_bid_m19;
input [31:0] AxiMonitorInterface_bid_m20;
input [31:0] AxiMonitorInterface_bid_m21;
input [31:0] AxiMonitorInterface_bid_m22;
input [31:0] AxiMonitorInterface_bid_m23;
input [31:0] AxiMonitorInterface_bid_m24;
input [31:0] AxiMonitorInterface_bid_m25;
input [31:0] AxiMonitorInterface_bid_m26;
input [31:0] AxiMonitorInterface_bid_m27;
input [31:0] AxiMonitorInterface_bid_m28;
input [31:0] AxiMonitorInterface_bid_m29;
input [31:0] AxiMonitorInterface_bid_m30;
input [31:0] AxiMonitorInterface_bid_m31;
input AxiMonitorInterface_bready_m0;
input AxiMonitorInterface_bready_m1;
input AxiMonitorInterface_bready_m2;
input AxiMonitorInterface_bready_m3;
input AxiMonitorInterface_bready_m4;
input AxiMonitorInterface_bready_m5;
input AxiMonitorInterface_bready_m6;
input AxiMonitorInterface_bready_m7;
input AxiMonitorInterface_bready_m8;
input AxiMonitorInterface_bready_m9;
input AxiMonitorInterface_bready_m10;
input AxiMonitorInterface_bready_m11;
input AxiMonitorInterface_bready_m12;
input AxiMonitorInterface_bready_m13;
input AxiMonitorInterface_bready_m14;
input AxiMonitorInterface_bready_m15;
input AxiMonitorInterface_bready_m16;
input AxiMonitorInterface_bready_m17;
input AxiMonitorInterface_bready_m18;
input AxiMonitorInterface_bready_m19;
input AxiMonitorInterface_bready_m20;
input AxiMonitorInterface_bready_m21;
input AxiMonitorInterface_bready_m22;
input AxiMonitorInterface_bready_m23;
input AxiMonitorInterface_bready_m24;
input AxiMonitorInterface_bready_m25;
input AxiMonitorInterface_bready_m26;
input AxiMonitorInterface_bready_m27;
input AxiMonitorInterface_bready_m28;
input AxiMonitorInterface_bready_m29;
input AxiMonitorInterface_bready_m30;
input AxiMonitorInterface_bready_m31;
input [63:0] AxiMonitorInterface_bsideband_m0;
input [63:0] AxiMonitorInterface_bsideband_m1;
input [63:0] AxiMonitorInterface_bsideband_m2;
input [63:0] AxiMonitorInterface_bsideband_m3;
input [63:0] AxiMonitorInterface_bsideband_m4;
input [63:0] AxiMonitorInterface_bsideband_m5;
input [63:0] AxiMonitorInterface_bsideband_m6;
input [63:0] AxiMonitorInterface_bsideband_m7;
input [63:0] AxiMonitorInterface_bsideband_m8;
input [63:0] AxiMonitorInterface_bsideband_m9;
input [63:0] AxiMonitorInterface_bsideband_m10;
input [63:0] AxiMonitorInterface_bsideband_m11;
input [63:0] AxiMonitorInterface_bsideband_m12;
input [63:0] AxiMonitorInterface_bsideband_m13;
input [63:0] AxiMonitorInterface_bsideband_m14;
input [63:0] AxiMonitorInterface_bsideband_m15;
input [63:0] AxiMonitorInterface_bsideband_m16;
input [63:0] AxiMonitorInterface_bsideband_m17;
input [63:0] AxiMonitorInterface_bsideband_m18;
input [63:0] AxiMonitorInterface_bsideband_m19;
input [63:0] AxiMonitorInterface_bsideband_m20;
input [63:0] AxiMonitorInterface_bsideband_m21;
input [63:0] AxiMonitorInterface_bsideband_m22;
input [63:0] AxiMonitorInterface_bsideband_m23;
input [63:0] AxiMonitorInterface_bsideband_m24;
input [63:0] AxiMonitorInterface_bsideband_m25;
input [63:0] AxiMonitorInterface_bsideband_m26;
input [63:0] AxiMonitorInterface_bsideband_m27;
input [63:0] AxiMonitorInterface_bsideband_m28;
input [63:0] AxiMonitorInterface_bsideband_m29;
input [63:0] AxiMonitorInterface_bsideband_m30;
input [63:0] AxiMonitorInterface_bsideband_m31;
input AxiMonitorInterface_cactive_m0;
input AxiMonitorInterface_cactive_m1;
input AxiMonitorInterface_cactive_m2;
input AxiMonitorInterface_cactive_m3;
input AxiMonitorInterface_cactive_m4;
input AxiMonitorInterface_cactive_m5;
input AxiMonitorInterface_cactive_m6;
input AxiMonitorInterface_cactive_m7;
input AxiMonitorInterface_cactive_m8;
input AxiMonitorInterface_cactive_m9;
input AxiMonitorInterface_cactive_m10;
input AxiMonitorInterface_cactive_m11;
input AxiMonitorInterface_cactive_m12;
input AxiMonitorInterface_cactive_m13;
input AxiMonitorInterface_cactive_m14;
input AxiMonitorInterface_cactive_m15;
input AxiMonitorInterface_cactive_m16;
input AxiMonitorInterface_cactive_m17;
input AxiMonitorInterface_cactive_m18;
input AxiMonitorInterface_cactive_m19;
input AxiMonitorInterface_cactive_m20;
input AxiMonitorInterface_cactive_m21;
input AxiMonitorInterface_cactive_m22;
input AxiMonitorInterface_cactive_m23;
input AxiMonitorInterface_cactive_m24;
input AxiMonitorInterface_cactive_m25;
input AxiMonitorInterface_cactive_m26;
input AxiMonitorInterface_cactive_m27;
input AxiMonitorInterface_cactive_m28;
input AxiMonitorInterface_cactive_m29;
input AxiMonitorInterface_cactive_m30;
input AxiMonitorInterface_cactive_m31;
input AxiMonitorInterface_csysreq_m0;
input AxiMonitorInterface_csysreq_m1;
input AxiMonitorInterface_csysreq_m2;
input AxiMonitorInterface_csysreq_m3;
input AxiMonitorInterface_csysreq_m4;
input AxiMonitorInterface_csysreq_m5;
input AxiMonitorInterface_csysreq_m6;
input AxiMonitorInterface_csysreq_m7;
input AxiMonitorInterface_csysreq_m8;
input AxiMonitorInterface_csysreq_m9;
input AxiMonitorInterface_csysreq_m10;
input AxiMonitorInterface_csysreq_m11;
input AxiMonitorInterface_csysreq_m12;
input AxiMonitorInterface_csysreq_m13;
input AxiMonitorInterface_csysreq_m14;
input AxiMonitorInterface_csysreq_m15;
input AxiMonitorInterface_csysreq_m16;
input AxiMonitorInterface_csysreq_m17;
input AxiMonitorInterface_csysreq_m18;
input AxiMonitorInterface_csysreq_m19;
input AxiMonitorInterface_csysreq_m20;
input AxiMonitorInterface_csysreq_m21;
input AxiMonitorInterface_csysreq_m22;
input AxiMonitorInterface_csysreq_m23;
input AxiMonitorInterface_csysreq_m24;
input AxiMonitorInterface_csysreq_m25;
input AxiMonitorInterface_csysreq_m26;
input AxiMonitorInterface_csysreq_m27;
input AxiMonitorInterface_csysreq_m28;
input AxiMonitorInterface_csysreq_m29;
input AxiMonitorInterface_csysreq_m30;
input AxiMonitorInterface_csysreq_m31;
input AxiMonitorInterface_csysack_m0;
input AxiMonitorInterface_csysack_m1;
input AxiMonitorInterface_csysack_m2;
input AxiMonitorInterface_csysack_m3;
input AxiMonitorInterface_csysack_m4;
input AxiMonitorInterface_csysack_m5;
input AxiMonitorInterface_csysack_m6;
input AxiMonitorInterface_csysack_m7;
input AxiMonitorInterface_csysack_m8;
input AxiMonitorInterface_csysack_m9;
input AxiMonitorInterface_csysack_m10;
input AxiMonitorInterface_csysack_m11;
input AxiMonitorInterface_csysack_m12;
input AxiMonitorInterface_csysack_m13;
input AxiMonitorInterface_csysack_m14;
input AxiMonitorInterface_csysack_m15;
input AxiMonitorInterface_csysack_m16;
input AxiMonitorInterface_csysack_m17;
input AxiMonitorInterface_csysack_m18;
input AxiMonitorInterface_csysack_m19;
input AxiMonitorInterface_csysack_m20;
input AxiMonitorInterface_csysack_m21;
input AxiMonitorInterface_csysack_m22;
input AxiMonitorInterface_csysack_m23;
input AxiMonitorInterface_csysack_m24;
input AxiMonitorInterface_csysack_m25;
input AxiMonitorInterface_csysack_m26;
input AxiMonitorInterface_csysack_m27;
input AxiMonitorInterface_csysack_m28;
input AxiMonitorInterface_csysack_m29;
input AxiMonitorInterface_csysack_m30;
input AxiMonitorInterface_csysack_m31;
input AxiMonitorInterface_arvalid_s0;
input AxiMonitorInterface_arvalid_s1;
input AxiMonitorInterface_arvalid_s2;
input AxiMonitorInterface_arvalid_s3;
input AxiMonitorInterface_arvalid_s4;
input AxiMonitorInterface_arvalid_s5;
input AxiMonitorInterface_arvalid_s6;
input AxiMonitorInterface_arvalid_s7;
input AxiMonitorInterface_arvalid_s8;
input AxiMonitorInterface_arvalid_s9;
input AxiMonitorInterface_arvalid_s10;
input AxiMonitorInterface_arvalid_s11;
input AxiMonitorInterface_arvalid_s12;
input AxiMonitorInterface_arvalid_s13;
input AxiMonitorInterface_arvalid_s14;
input AxiMonitorInterface_arvalid_s15;
input AxiMonitorInterface_arvalid_s16;
input AxiMonitorInterface_arvalid_s17;
input AxiMonitorInterface_arvalid_s18;
input AxiMonitorInterface_arvalid_s19;
input AxiMonitorInterface_arvalid_s20;
input AxiMonitorInterface_arvalid_s21;
input AxiMonitorInterface_arvalid_s22;
input AxiMonitorInterface_arvalid_s23;
input AxiMonitorInterface_arvalid_s24;
input AxiMonitorInterface_arvalid_s25;
input AxiMonitorInterface_arvalid_s26;
input AxiMonitorInterface_arvalid_s27;
input AxiMonitorInterface_arvalid_s28;
input AxiMonitorInterface_arvalid_s29;
input AxiMonitorInterface_arvalid_s30;
input AxiMonitorInterface_arvalid_s31;
input [63:0] AxiMonitorInterface_araddr_s0;
input [63:0] AxiMonitorInterface_araddr_s1;
input [63:0] AxiMonitorInterface_araddr_s2;
input [63:0] AxiMonitorInterface_araddr_s3;
input [63:0] AxiMonitorInterface_araddr_s4;
input [63:0] AxiMonitorInterface_araddr_s5;
input [63:0] AxiMonitorInterface_araddr_s6;
input [63:0] AxiMonitorInterface_araddr_s7;
input [63:0] AxiMonitorInterface_araddr_s8;
input [63:0] AxiMonitorInterface_araddr_s9;
input [63:0] AxiMonitorInterface_araddr_s10;
input [63:0] AxiMonitorInterface_araddr_s11;
input [63:0] AxiMonitorInterface_araddr_s12;
input [63:0] AxiMonitorInterface_araddr_s13;
input [63:0] AxiMonitorInterface_araddr_s14;
input [63:0] AxiMonitorInterface_araddr_s15;
input [63:0] AxiMonitorInterface_araddr_s16;
input [63:0] AxiMonitorInterface_araddr_s17;
input [63:0] AxiMonitorInterface_araddr_s18;
input [63:0] AxiMonitorInterface_araddr_s19;
input [63:0] AxiMonitorInterface_araddr_s20;
input [63:0] AxiMonitorInterface_araddr_s21;
input [63:0] AxiMonitorInterface_araddr_s22;
input [63:0] AxiMonitorInterface_araddr_s23;
input [63:0] AxiMonitorInterface_araddr_s24;
input [63:0] AxiMonitorInterface_araddr_s25;
input [63:0] AxiMonitorInterface_araddr_s26;
input [63:0] AxiMonitorInterface_araddr_s27;
input [63:0] AxiMonitorInterface_araddr_s28;
input [63:0] AxiMonitorInterface_araddr_s29;
input [63:0] AxiMonitorInterface_araddr_s30;
input [63:0] AxiMonitorInterface_araddr_s31;
input [9:0] AxiMonitorInterface_arlen_s0;
input [9:0] AxiMonitorInterface_arlen_s1;
input [9:0] AxiMonitorInterface_arlen_s2;
input [9:0] AxiMonitorInterface_arlen_s3;
input [9:0] AxiMonitorInterface_arlen_s4;
input [9:0] AxiMonitorInterface_arlen_s5;
input [9:0] AxiMonitorInterface_arlen_s6;
input [9:0] AxiMonitorInterface_arlen_s7;
input [9:0] AxiMonitorInterface_arlen_s8;
input [9:0] AxiMonitorInterface_arlen_s9;
input [9:0] AxiMonitorInterface_arlen_s10;
input [9:0] AxiMonitorInterface_arlen_s11;
input [9:0] AxiMonitorInterface_arlen_s12;
input [9:0] AxiMonitorInterface_arlen_s13;
input [9:0] AxiMonitorInterface_arlen_s14;
input [9:0] AxiMonitorInterface_arlen_s15;
input [9:0] AxiMonitorInterface_arlen_s16;
input [9:0] AxiMonitorInterface_arlen_s17;
input [9:0] AxiMonitorInterface_arlen_s18;
input [9:0] AxiMonitorInterface_arlen_s19;
input [9:0] AxiMonitorInterface_arlen_s20;
input [9:0] AxiMonitorInterface_arlen_s21;
input [9:0] AxiMonitorInterface_arlen_s22;
input [9:0] AxiMonitorInterface_arlen_s23;
input [9:0] AxiMonitorInterface_arlen_s24;
input [9:0] AxiMonitorInterface_arlen_s25;
input [9:0] AxiMonitorInterface_arlen_s26;
input [9:0] AxiMonitorInterface_arlen_s27;
input [9:0] AxiMonitorInterface_arlen_s28;
input [9:0] AxiMonitorInterface_arlen_s29;
input [9:0] AxiMonitorInterface_arlen_s30;
input [9:0] AxiMonitorInterface_arlen_s31;
input [2:0] AxiMonitorInterface_arsize_s0;
input [2:0] AxiMonitorInterface_arsize_s1;
input [2:0] AxiMonitorInterface_arsize_s2;
input [2:0] AxiMonitorInterface_arsize_s3;
input [2:0] AxiMonitorInterface_arsize_s4;
input [2:0] AxiMonitorInterface_arsize_s5;
input [2:0] AxiMonitorInterface_arsize_s6;
input [2:0] AxiMonitorInterface_arsize_s7;
input [2:0] AxiMonitorInterface_arsize_s8;
input [2:0] AxiMonitorInterface_arsize_s9;
input [2:0] AxiMonitorInterface_arsize_s10;
input [2:0] AxiMonitorInterface_arsize_s11;
input [2:0] AxiMonitorInterface_arsize_s12;
input [2:0] AxiMonitorInterface_arsize_s13;
input [2:0] AxiMonitorInterface_arsize_s14;
input [2:0] AxiMonitorInterface_arsize_s15;
input [2:0] AxiMonitorInterface_arsize_s16;
input [2:0] AxiMonitorInterface_arsize_s17;
input [2:0] AxiMonitorInterface_arsize_s18;
input [2:0] AxiMonitorInterface_arsize_s19;
input [2:0] AxiMonitorInterface_arsize_s20;
input [2:0] AxiMonitorInterface_arsize_s21;
input [2:0] AxiMonitorInterface_arsize_s22;
input [2:0] AxiMonitorInterface_arsize_s23;
input [2:0] AxiMonitorInterface_arsize_s24;
input [2:0] AxiMonitorInterface_arsize_s25;
input [2:0] AxiMonitorInterface_arsize_s26;
input [2:0] AxiMonitorInterface_arsize_s27;
input [2:0] AxiMonitorInterface_arsize_s28;
input [2:0] AxiMonitorInterface_arsize_s29;
input [2:0] AxiMonitorInterface_arsize_s30;
input [2:0] AxiMonitorInterface_arsize_s31;
input [1:0] AxiMonitorInterface_arburst_s0;
input [1:0] AxiMonitorInterface_arburst_s1;
input [1:0] AxiMonitorInterface_arburst_s2;
input [1:0] AxiMonitorInterface_arburst_s3;
input [1:0] AxiMonitorInterface_arburst_s4;
input [1:0] AxiMonitorInterface_arburst_s5;
input [1:0] AxiMonitorInterface_arburst_s6;
input [1:0] AxiMonitorInterface_arburst_s7;
input [1:0] AxiMonitorInterface_arburst_s8;
input [1:0] AxiMonitorInterface_arburst_s9;
input [1:0] AxiMonitorInterface_arburst_s10;
input [1:0] AxiMonitorInterface_arburst_s11;
input [1:0] AxiMonitorInterface_arburst_s12;
input [1:0] AxiMonitorInterface_arburst_s13;
input [1:0] AxiMonitorInterface_arburst_s14;
input [1:0] AxiMonitorInterface_arburst_s15;
input [1:0] AxiMonitorInterface_arburst_s16;
input [1:0] AxiMonitorInterface_arburst_s17;
input [1:0] AxiMonitorInterface_arburst_s18;
input [1:0] AxiMonitorInterface_arburst_s19;
input [1:0] AxiMonitorInterface_arburst_s20;
input [1:0] AxiMonitorInterface_arburst_s21;
input [1:0] AxiMonitorInterface_arburst_s22;
input [1:0] AxiMonitorInterface_arburst_s23;
input [1:0] AxiMonitorInterface_arburst_s24;
input [1:0] AxiMonitorInterface_arburst_s25;
input [1:0] AxiMonitorInterface_arburst_s26;
input [1:0] AxiMonitorInterface_arburst_s27;
input [1:0] AxiMonitorInterface_arburst_s28;
input [1:0] AxiMonitorInterface_arburst_s29;
input [1:0] AxiMonitorInterface_arburst_s30;
input [1:0] AxiMonitorInterface_arburst_s31;
input [1:0] AxiMonitorInterface_arlock_s0;
input [1:0] AxiMonitorInterface_arlock_s1;
input [1:0] AxiMonitorInterface_arlock_s2;
input [1:0] AxiMonitorInterface_arlock_s3;
input [1:0] AxiMonitorInterface_arlock_s4;
input [1:0] AxiMonitorInterface_arlock_s5;
input [1:0] AxiMonitorInterface_arlock_s6;
input [1:0] AxiMonitorInterface_arlock_s7;
input [1:0] AxiMonitorInterface_arlock_s8;
input [1:0] AxiMonitorInterface_arlock_s9;
input [1:0] AxiMonitorInterface_arlock_s10;
input [1:0] AxiMonitorInterface_arlock_s11;
input [1:0] AxiMonitorInterface_arlock_s12;
input [1:0] AxiMonitorInterface_arlock_s13;
input [1:0] AxiMonitorInterface_arlock_s14;
input [1:0] AxiMonitorInterface_arlock_s15;
input [1:0] AxiMonitorInterface_arlock_s16;
input [1:0] AxiMonitorInterface_arlock_s17;
input [1:0] AxiMonitorInterface_arlock_s18;
input [1:0] AxiMonitorInterface_arlock_s19;
input [1:0] AxiMonitorInterface_arlock_s20;
input [1:0] AxiMonitorInterface_arlock_s21;
input [1:0] AxiMonitorInterface_arlock_s22;
input [1:0] AxiMonitorInterface_arlock_s23;
input [1:0] AxiMonitorInterface_arlock_s24;
input [1:0] AxiMonitorInterface_arlock_s25;
input [1:0] AxiMonitorInterface_arlock_s26;
input [1:0] AxiMonitorInterface_arlock_s27;
input [1:0] AxiMonitorInterface_arlock_s28;
input [1:0] AxiMonitorInterface_arlock_s29;
input [1:0] AxiMonitorInterface_arlock_s30;
input [1:0] AxiMonitorInterface_arlock_s31;
input [3:0] AxiMonitorInterface_arcache_s0;
input [3:0] AxiMonitorInterface_arcache_s1;
input [3:0] AxiMonitorInterface_arcache_s2;
input [3:0] AxiMonitorInterface_arcache_s3;
input [3:0] AxiMonitorInterface_arcache_s4;
input [3:0] AxiMonitorInterface_arcache_s5;
input [3:0] AxiMonitorInterface_arcache_s6;
input [3:0] AxiMonitorInterface_arcache_s7;
input [3:0] AxiMonitorInterface_arcache_s8;
input [3:0] AxiMonitorInterface_arcache_s9;
input [3:0] AxiMonitorInterface_arcache_s10;
input [3:0] AxiMonitorInterface_arcache_s11;
input [3:0] AxiMonitorInterface_arcache_s12;
input [3:0] AxiMonitorInterface_arcache_s13;
input [3:0] AxiMonitorInterface_arcache_s14;
input [3:0] AxiMonitorInterface_arcache_s15;
input [3:0] AxiMonitorInterface_arcache_s16;
input [3:0] AxiMonitorInterface_arcache_s17;
input [3:0] AxiMonitorInterface_arcache_s18;
input [3:0] AxiMonitorInterface_arcache_s19;
input [3:0] AxiMonitorInterface_arcache_s20;
input [3:0] AxiMonitorInterface_arcache_s21;
input [3:0] AxiMonitorInterface_arcache_s22;
input [3:0] AxiMonitorInterface_arcache_s23;
input [3:0] AxiMonitorInterface_arcache_s24;
input [3:0] AxiMonitorInterface_arcache_s25;
input [3:0] AxiMonitorInterface_arcache_s26;
input [3:0] AxiMonitorInterface_arcache_s27;
input [3:0] AxiMonitorInterface_arcache_s28;
input [3:0] AxiMonitorInterface_arcache_s29;
input [3:0] AxiMonitorInterface_arcache_s30;
input [3:0] AxiMonitorInterface_arcache_s31;
input [2:0] AxiMonitorInterface_arprot_s0;
input [2:0] AxiMonitorInterface_arprot_s1;
input [2:0] AxiMonitorInterface_arprot_s2;
input [2:0] AxiMonitorInterface_arprot_s3;
input [2:0] AxiMonitorInterface_arprot_s4;
input [2:0] AxiMonitorInterface_arprot_s5;
input [2:0] AxiMonitorInterface_arprot_s6;
input [2:0] AxiMonitorInterface_arprot_s7;
input [2:0] AxiMonitorInterface_arprot_s8;
input [2:0] AxiMonitorInterface_arprot_s9;
input [2:0] AxiMonitorInterface_arprot_s10;
input [2:0] AxiMonitorInterface_arprot_s11;
input [2:0] AxiMonitorInterface_arprot_s12;
input [2:0] AxiMonitorInterface_arprot_s13;
input [2:0] AxiMonitorInterface_arprot_s14;
input [2:0] AxiMonitorInterface_arprot_s15;
input [2:0] AxiMonitorInterface_arprot_s16;
input [2:0] AxiMonitorInterface_arprot_s17;
input [2:0] AxiMonitorInterface_arprot_s18;
input [2:0] AxiMonitorInterface_arprot_s19;
input [2:0] AxiMonitorInterface_arprot_s20;
input [2:0] AxiMonitorInterface_arprot_s21;
input [2:0] AxiMonitorInterface_arprot_s22;
input [2:0] AxiMonitorInterface_arprot_s23;
input [2:0] AxiMonitorInterface_arprot_s24;
input [2:0] AxiMonitorInterface_arprot_s25;
input [2:0] AxiMonitorInterface_arprot_s26;
input [2:0] AxiMonitorInterface_arprot_s27;
input [2:0] AxiMonitorInterface_arprot_s28;
input [2:0] AxiMonitorInterface_arprot_s29;
input [2:0] AxiMonitorInterface_arprot_s30;
input [2:0] AxiMonitorInterface_arprot_s31;
input [31:0] AxiMonitorInterface_arid_s0;
input [31:0] AxiMonitorInterface_arid_s1;
input [31:0] AxiMonitorInterface_arid_s2;
input [31:0] AxiMonitorInterface_arid_s3;
input [31:0] AxiMonitorInterface_arid_s4;
input [31:0] AxiMonitorInterface_arid_s5;
input [31:0] AxiMonitorInterface_arid_s6;
input [31:0] AxiMonitorInterface_arid_s7;
input [31:0] AxiMonitorInterface_arid_s8;
input [31:0] AxiMonitorInterface_arid_s9;
input [31:0] AxiMonitorInterface_arid_s10;
input [31:0] AxiMonitorInterface_arid_s11;
input [31:0] AxiMonitorInterface_arid_s12;
input [31:0] AxiMonitorInterface_arid_s13;
input [31:0] AxiMonitorInterface_arid_s14;
input [31:0] AxiMonitorInterface_arid_s15;
input [31:0] AxiMonitorInterface_arid_s16;
input [31:0] AxiMonitorInterface_arid_s17;
input [31:0] AxiMonitorInterface_arid_s18;
input [31:0] AxiMonitorInterface_arid_s19;
input [31:0] AxiMonitorInterface_arid_s20;
input [31:0] AxiMonitorInterface_arid_s21;
input [31:0] AxiMonitorInterface_arid_s22;
input [31:0] AxiMonitorInterface_arid_s23;
input [31:0] AxiMonitorInterface_arid_s24;
input [31:0] AxiMonitorInterface_arid_s25;
input [31:0] AxiMonitorInterface_arid_s26;
input [31:0] AxiMonitorInterface_arid_s27;
input [31:0] AxiMonitorInterface_arid_s28;
input [31:0] AxiMonitorInterface_arid_s29;
input [31:0] AxiMonitorInterface_arid_s30;
input [31:0] AxiMonitorInterface_arid_s31;
input AxiMonitorInterface_arready_s0;
input AxiMonitorInterface_arready_s1;
input AxiMonitorInterface_arready_s2;
input AxiMonitorInterface_arready_s3;
input AxiMonitorInterface_arready_s4;
input AxiMonitorInterface_arready_s5;
input AxiMonitorInterface_arready_s6;
input AxiMonitorInterface_arready_s7;
input AxiMonitorInterface_arready_s8;
input AxiMonitorInterface_arready_s9;
input AxiMonitorInterface_arready_s10;
input AxiMonitorInterface_arready_s11;
input AxiMonitorInterface_arready_s12;
input AxiMonitorInterface_arready_s13;
input AxiMonitorInterface_arready_s14;
input AxiMonitorInterface_arready_s15;
input AxiMonitorInterface_arready_s16;
input AxiMonitorInterface_arready_s17;
input AxiMonitorInterface_arready_s18;
input AxiMonitorInterface_arready_s19;
input AxiMonitorInterface_arready_s20;
input AxiMonitorInterface_arready_s21;
input AxiMonitorInterface_arready_s22;
input AxiMonitorInterface_arready_s23;
input AxiMonitorInterface_arready_s24;
input AxiMonitorInterface_arready_s25;
input AxiMonitorInterface_arready_s26;
input AxiMonitorInterface_arready_s27;
input AxiMonitorInterface_arready_s28;
input AxiMonitorInterface_arready_s29;
input AxiMonitorInterface_arready_s30;
input AxiMonitorInterface_arready_s31;
input [63:0] AxiMonitorInterface_arsideband_s0;
input [63:0] AxiMonitorInterface_arsideband_s1;
input [63:0] AxiMonitorInterface_arsideband_s2;
input [63:0] AxiMonitorInterface_arsideband_s3;
input [63:0] AxiMonitorInterface_arsideband_s4;
input [63:0] AxiMonitorInterface_arsideband_s5;
input [63:0] AxiMonitorInterface_arsideband_s6;
input [63:0] AxiMonitorInterface_arsideband_s7;
input [63:0] AxiMonitorInterface_arsideband_s8;
input [63:0] AxiMonitorInterface_arsideband_s9;
input [63:0] AxiMonitorInterface_arsideband_s10;
input [63:0] AxiMonitorInterface_arsideband_s11;
input [63:0] AxiMonitorInterface_arsideband_s12;
input [63:0] AxiMonitorInterface_arsideband_s13;
input [63:0] AxiMonitorInterface_arsideband_s14;
input [63:0] AxiMonitorInterface_arsideband_s15;
input [63:0] AxiMonitorInterface_arsideband_s16;
input [63:0] AxiMonitorInterface_arsideband_s17;
input [63:0] AxiMonitorInterface_arsideband_s18;
input [63:0] AxiMonitorInterface_arsideband_s19;
input [63:0] AxiMonitorInterface_arsideband_s20;
input [63:0] AxiMonitorInterface_arsideband_s21;
input [63:0] AxiMonitorInterface_arsideband_s22;
input [63:0] AxiMonitorInterface_arsideband_s23;
input [63:0] AxiMonitorInterface_arsideband_s24;
input [63:0] AxiMonitorInterface_arsideband_s25;
input [63:0] AxiMonitorInterface_arsideband_s26;
input [63:0] AxiMonitorInterface_arsideband_s27;
input [63:0] AxiMonitorInterface_arsideband_s28;
input [63:0] AxiMonitorInterface_arsideband_s29;
input [63:0] AxiMonitorInterface_arsideband_s30;
input [63:0] AxiMonitorInterface_arsideband_s31;
input AxiMonitorInterface_awvalid_s0;
input AxiMonitorInterface_awvalid_s1;
input AxiMonitorInterface_awvalid_s2;
input AxiMonitorInterface_awvalid_s3;
input AxiMonitorInterface_awvalid_s4;
input AxiMonitorInterface_awvalid_s5;
input AxiMonitorInterface_awvalid_s6;
input AxiMonitorInterface_awvalid_s7;
input AxiMonitorInterface_awvalid_s8;
input AxiMonitorInterface_awvalid_s9;
input AxiMonitorInterface_awvalid_s10;
input AxiMonitorInterface_awvalid_s11;
input AxiMonitorInterface_awvalid_s12;
input AxiMonitorInterface_awvalid_s13;
input AxiMonitorInterface_awvalid_s14;
input AxiMonitorInterface_awvalid_s15;
input AxiMonitorInterface_awvalid_s16;
input AxiMonitorInterface_awvalid_s17;
input AxiMonitorInterface_awvalid_s18;
input AxiMonitorInterface_awvalid_s19;
input AxiMonitorInterface_awvalid_s20;
input AxiMonitorInterface_awvalid_s21;
input AxiMonitorInterface_awvalid_s22;
input AxiMonitorInterface_awvalid_s23;
input AxiMonitorInterface_awvalid_s24;
input AxiMonitorInterface_awvalid_s25;
input AxiMonitorInterface_awvalid_s26;
input AxiMonitorInterface_awvalid_s27;
input AxiMonitorInterface_awvalid_s28;
input AxiMonitorInterface_awvalid_s29;
input AxiMonitorInterface_awvalid_s30;
input AxiMonitorInterface_awvalid_s31;
input [63:0] AxiMonitorInterface_awaddr_s0;
input [63:0] AxiMonitorInterface_awaddr_s1;
input [63:0] AxiMonitorInterface_awaddr_s2;
input [63:0] AxiMonitorInterface_awaddr_s3;
input [63:0] AxiMonitorInterface_awaddr_s4;
input [63:0] AxiMonitorInterface_awaddr_s5;
input [63:0] AxiMonitorInterface_awaddr_s6;
input [63:0] AxiMonitorInterface_awaddr_s7;
input [63:0] AxiMonitorInterface_awaddr_s8;
input [63:0] AxiMonitorInterface_awaddr_s9;
input [63:0] AxiMonitorInterface_awaddr_s10;
input [63:0] AxiMonitorInterface_awaddr_s11;
input [63:0] AxiMonitorInterface_awaddr_s12;
input [63:0] AxiMonitorInterface_awaddr_s13;
input [63:0] AxiMonitorInterface_awaddr_s14;
input [63:0] AxiMonitorInterface_awaddr_s15;
input [63:0] AxiMonitorInterface_awaddr_s16;
input [63:0] AxiMonitorInterface_awaddr_s17;
input [63:0] AxiMonitorInterface_awaddr_s18;
input [63:0] AxiMonitorInterface_awaddr_s19;
input [63:0] AxiMonitorInterface_awaddr_s20;
input [63:0] AxiMonitorInterface_awaddr_s21;
input [63:0] AxiMonitorInterface_awaddr_s22;
input [63:0] AxiMonitorInterface_awaddr_s23;
input [63:0] AxiMonitorInterface_awaddr_s24;
input [63:0] AxiMonitorInterface_awaddr_s25;
input [63:0] AxiMonitorInterface_awaddr_s26;
input [63:0] AxiMonitorInterface_awaddr_s27;
input [63:0] AxiMonitorInterface_awaddr_s28;
input [63:0] AxiMonitorInterface_awaddr_s29;
input [63:0] AxiMonitorInterface_awaddr_s30;
input [63:0] AxiMonitorInterface_awaddr_s31;
input [9:0] AxiMonitorInterface_awlen_s0;
input [9:0] AxiMonitorInterface_awlen_s1;
input [9:0] AxiMonitorInterface_awlen_s2;
input [9:0] AxiMonitorInterface_awlen_s3;
input [9:0] AxiMonitorInterface_awlen_s4;
input [9:0] AxiMonitorInterface_awlen_s5;
input [9:0] AxiMonitorInterface_awlen_s6;
input [9:0] AxiMonitorInterface_awlen_s7;
input [9:0] AxiMonitorInterface_awlen_s8;
input [9:0] AxiMonitorInterface_awlen_s9;
input [9:0] AxiMonitorInterface_awlen_s10;
input [9:0] AxiMonitorInterface_awlen_s11;
input [9:0] AxiMonitorInterface_awlen_s12;
input [9:0] AxiMonitorInterface_awlen_s13;
input [9:0] AxiMonitorInterface_awlen_s14;
input [9:0] AxiMonitorInterface_awlen_s15;
input [9:0] AxiMonitorInterface_awlen_s16;
input [9:0] AxiMonitorInterface_awlen_s17;
input [9:0] AxiMonitorInterface_awlen_s18;
input [9:0] AxiMonitorInterface_awlen_s19;
input [9:0] AxiMonitorInterface_awlen_s20;
input [9:0] AxiMonitorInterface_awlen_s21;
input [9:0] AxiMonitorInterface_awlen_s22;
input [9:0] AxiMonitorInterface_awlen_s23;
input [9:0] AxiMonitorInterface_awlen_s24;
input [9:0] AxiMonitorInterface_awlen_s25;
input [9:0] AxiMonitorInterface_awlen_s26;
input [9:0] AxiMonitorInterface_awlen_s27;
input [9:0] AxiMonitorInterface_awlen_s28;
input [9:0] AxiMonitorInterface_awlen_s29;
input [9:0] AxiMonitorInterface_awlen_s30;
input [9:0] AxiMonitorInterface_awlen_s31;
input [2:0] AxiMonitorInterface_awsize_s0;
input [2:0] AxiMonitorInterface_awsize_s1;
input [2:0] AxiMonitorInterface_awsize_s2;
input [2:0] AxiMonitorInterface_awsize_s3;
input [2:0] AxiMonitorInterface_awsize_s4;
input [2:0] AxiMonitorInterface_awsize_s5;
input [2:0] AxiMonitorInterface_awsize_s6;
input [2:0] AxiMonitorInterface_awsize_s7;
input [2:0] AxiMonitorInterface_awsize_s8;
input [2:0] AxiMonitorInterface_awsize_s9;
input [2:0] AxiMonitorInterface_awsize_s10;
input [2:0] AxiMonitorInterface_awsize_s11;
input [2:0] AxiMonitorInterface_awsize_s12;
input [2:0] AxiMonitorInterface_awsize_s13;
input [2:0] AxiMonitorInterface_awsize_s14;
input [2:0] AxiMonitorInterface_awsize_s15;
input [2:0] AxiMonitorInterface_awsize_s16;
input [2:0] AxiMonitorInterface_awsize_s17;
input [2:0] AxiMonitorInterface_awsize_s18;
input [2:0] AxiMonitorInterface_awsize_s19;
input [2:0] AxiMonitorInterface_awsize_s20;
input [2:0] AxiMonitorInterface_awsize_s21;
input [2:0] AxiMonitorInterface_awsize_s22;
input [2:0] AxiMonitorInterface_awsize_s23;
input [2:0] AxiMonitorInterface_awsize_s24;
input [2:0] AxiMonitorInterface_awsize_s25;
input [2:0] AxiMonitorInterface_awsize_s26;
input [2:0] AxiMonitorInterface_awsize_s27;
input [2:0] AxiMonitorInterface_awsize_s28;
input [2:0] AxiMonitorInterface_awsize_s29;
input [2:0] AxiMonitorInterface_awsize_s30;
input [2:0] AxiMonitorInterface_awsize_s31;
input [1:0] AxiMonitorInterface_awburst_s0;
input [1:0] AxiMonitorInterface_awburst_s1;
input [1:0] AxiMonitorInterface_awburst_s2;
input [1:0] AxiMonitorInterface_awburst_s3;
input [1:0] AxiMonitorInterface_awburst_s4;
input [1:0] AxiMonitorInterface_awburst_s5;
input [1:0] AxiMonitorInterface_awburst_s6;
input [1:0] AxiMonitorInterface_awburst_s7;
input [1:0] AxiMonitorInterface_awburst_s8;
input [1:0] AxiMonitorInterface_awburst_s9;
input [1:0] AxiMonitorInterface_awburst_s10;
input [1:0] AxiMonitorInterface_awburst_s11;
input [1:0] AxiMonitorInterface_awburst_s12;
input [1:0] AxiMonitorInterface_awburst_s13;
input [1:0] AxiMonitorInterface_awburst_s14;
input [1:0] AxiMonitorInterface_awburst_s15;
input [1:0] AxiMonitorInterface_awburst_s16;
input [1:0] AxiMonitorInterface_awburst_s17;
input [1:0] AxiMonitorInterface_awburst_s18;
input [1:0] AxiMonitorInterface_awburst_s19;
input [1:0] AxiMonitorInterface_awburst_s20;
input [1:0] AxiMonitorInterface_awburst_s21;
input [1:0] AxiMonitorInterface_awburst_s22;
input [1:0] AxiMonitorInterface_awburst_s23;
input [1:0] AxiMonitorInterface_awburst_s24;
input [1:0] AxiMonitorInterface_awburst_s25;
input [1:0] AxiMonitorInterface_awburst_s26;
input [1:0] AxiMonitorInterface_awburst_s27;
input [1:0] AxiMonitorInterface_awburst_s28;
input [1:0] AxiMonitorInterface_awburst_s29;
input [1:0] AxiMonitorInterface_awburst_s30;
input [1:0] AxiMonitorInterface_awburst_s31;
input [1:0] AxiMonitorInterface_awlock_s0;
input [1:0] AxiMonitorInterface_awlock_s1;
input [1:0] AxiMonitorInterface_awlock_s2;
input [1:0] AxiMonitorInterface_awlock_s3;
input [1:0] AxiMonitorInterface_awlock_s4;
input [1:0] AxiMonitorInterface_awlock_s5;
input [1:0] AxiMonitorInterface_awlock_s6;
input [1:0] AxiMonitorInterface_awlock_s7;
input [1:0] AxiMonitorInterface_awlock_s8;
input [1:0] AxiMonitorInterface_awlock_s9;
input [1:0] AxiMonitorInterface_awlock_s10;
input [1:0] AxiMonitorInterface_awlock_s11;
input [1:0] AxiMonitorInterface_awlock_s12;
input [1:0] AxiMonitorInterface_awlock_s13;
input [1:0] AxiMonitorInterface_awlock_s14;
input [1:0] AxiMonitorInterface_awlock_s15;
input [1:0] AxiMonitorInterface_awlock_s16;
input [1:0] AxiMonitorInterface_awlock_s17;
input [1:0] AxiMonitorInterface_awlock_s18;
input [1:0] AxiMonitorInterface_awlock_s19;
input [1:0] AxiMonitorInterface_awlock_s20;
input [1:0] AxiMonitorInterface_awlock_s21;
input [1:0] AxiMonitorInterface_awlock_s22;
input [1:0] AxiMonitorInterface_awlock_s23;
input [1:0] AxiMonitorInterface_awlock_s24;
input [1:0] AxiMonitorInterface_awlock_s25;
input [1:0] AxiMonitorInterface_awlock_s26;
input [1:0] AxiMonitorInterface_awlock_s27;
input [1:0] AxiMonitorInterface_awlock_s28;
input [1:0] AxiMonitorInterface_awlock_s29;
input [1:0] AxiMonitorInterface_awlock_s30;
input [1:0] AxiMonitorInterface_awlock_s31;
input [3:0] AxiMonitorInterface_awcache_s0;
input [3:0] AxiMonitorInterface_awcache_s1;
input [3:0] AxiMonitorInterface_awcache_s2;
input [3:0] AxiMonitorInterface_awcache_s3;
input [3:0] AxiMonitorInterface_awcache_s4;
input [3:0] AxiMonitorInterface_awcache_s5;
input [3:0] AxiMonitorInterface_awcache_s6;
input [3:0] AxiMonitorInterface_awcache_s7;
input [3:0] AxiMonitorInterface_awcache_s8;
input [3:0] AxiMonitorInterface_awcache_s9;
input [3:0] AxiMonitorInterface_awcache_s10;
input [3:0] AxiMonitorInterface_awcache_s11;
input [3:0] AxiMonitorInterface_awcache_s12;
input [3:0] AxiMonitorInterface_awcache_s13;
input [3:0] AxiMonitorInterface_awcache_s14;
input [3:0] AxiMonitorInterface_awcache_s15;
input [3:0] AxiMonitorInterface_awcache_s16;
input [3:0] AxiMonitorInterface_awcache_s17;
input [3:0] AxiMonitorInterface_awcache_s18;
input [3:0] AxiMonitorInterface_awcache_s19;
input [3:0] AxiMonitorInterface_awcache_s20;
input [3:0] AxiMonitorInterface_awcache_s21;
input [3:0] AxiMonitorInterface_awcache_s22;
input [3:0] AxiMonitorInterface_awcache_s23;
input [3:0] AxiMonitorInterface_awcache_s24;
input [3:0] AxiMonitorInterface_awcache_s25;
input [3:0] AxiMonitorInterface_awcache_s26;
input [3:0] AxiMonitorInterface_awcache_s27;
input [3:0] AxiMonitorInterface_awcache_s28;
input [3:0] AxiMonitorInterface_awcache_s29;
input [3:0] AxiMonitorInterface_awcache_s30;
input [3:0] AxiMonitorInterface_awcache_s31;
input [2:0] AxiMonitorInterface_awprot_s0;
input [2:0] AxiMonitorInterface_awprot_s1;
input [2:0] AxiMonitorInterface_awprot_s2;
input [2:0] AxiMonitorInterface_awprot_s3;
input [2:0] AxiMonitorInterface_awprot_s4;
input [2:0] AxiMonitorInterface_awprot_s5;
input [2:0] AxiMonitorInterface_awprot_s6;
input [2:0] AxiMonitorInterface_awprot_s7;
input [2:0] AxiMonitorInterface_awprot_s8;
input [2:0] AxiMonitorInterface_awprot_s9;
input [2:0] AxiMonitorInterface_awprot_s10;
input [2:0] AxiMonitorInterface_awprot_s11;
input [2:0] AxiMonitorInterface_awprot_s12;
input [2:0] AxiMonitorInterface_awprot_s13;
input [2:0] AxiMonitorInterface_awprot_s14;
input [2:0] AxiMonitorInterface_awprot_s15;
input [2:0] AxiMonitorInterface_awprot_s16;
input [2:0] AxiMonitorInterface_awprot_s17;
input [2:0] AxiMonitorInterface_awprot_s18;
input [2:0] AxiMonitorInterface_awprot_s19;
input [2:0] AxiMonitorInterface_awprot_s20;
input [2:0] AxiMonitorInterface_awprot_s21;
input [2:0] AxiMonitorInterface_awprot_s22;
input [2:0] AxiMonitorInterface_awprot_s23;
input [2:0] AxiMonitorInterface_awprot_s24;
input [2:0] AxiMonitorInterface_awprot_s25;
input [2:0] AxiMonitorInterface_awprot_s26;
input [2:0] AxiMonitorInterface_awprot_s27;
input [2:0] AxiMonitorInterface_awprot_s28;
input [2:0] AxiMonitorInterface_awprot_s29;
input [2:0] AxiMonitorInterface_awprot_s30;
input [2:0] AxiMonitorInterface_awprot_s31;
input [31:0] AxiMonitorInterface_awid_s0;
input [31:0] AxiMonitorInterface_awid_s1;
input [31:0] AxiMonitorInterface_awid_s2;
input [31:0] AxiMonitorInterface_awid_s3;
input [31:0] AxiMonitorInterface_awid_s4;
input [31:0] AxiMonitorInterface_awid_s5;
input [31:0] AxiMonitorInterface_awid_s6;
input [31:0] AxiMonitorInterface_awid_s7;
input [31:0] AxiMonitorInterface_awid_s8;
input [31:0] AxiMonitorInterface_awid_s9;
input [31:0] AxiMonitorInterface_awid_s10;
input [31:0] AxiMonitorInterface_awid_s11;
input [31:0] AxiMonitorInterface_awid_s12;
input [31:0] AxiMonitorInterface_awid_s13;
input [31:0] AxiMonitorInterface_awid_s14;
input [31:0] AxiMonitorInterface_awid_s15;
input [31:0] AxiMonitorInterface_awid_s16;
input [31:0] AxiMonitorInterface_awid_s17;
input [31:0] AxiMonitorInterface_awid_s18;
input [31:0] AxiMonitorInterface_awid_s19;
input [31:0] AxiMonitorInterface_awid_s20;
input [31:0] AxiMonitorInterface_awid_s21;
input [31:0] AxiMonitorInterface_awid_s22;
input [31:0] AxiMonitorInterface_awid_s23;
input [31:0] AxiMonitorInterface_awid_s24;
input [31:0] AxiMonitorInterface_awid_s25;
input [31:0] AxiMonitorInterface_awid_s26;
input [31:0] AxiMonitorInterface_awid_s27;
input [31:0] AxiMonitorInterface_awid_s28;
input [31:0] AxiMonitorInterface_awid_s29;
input [31:0] AxiMonitorInterface_awid_s30;
input [31:0] AxiMonitorInterface_awid_s31;
input AxiMonitorInterface_awready_s0;
input AxiMonitorInterface_awready_s1;
input AxiMonitorInterface_awready_s2;
input AxiMonitorInterface_awready_s3;
input AxiMonitorInterface_awready_s4;
input AxiMonitorInterface_awready_s5;
input AxiMonitorInterface_awready_s6;
input AxiMonitorInterface_awready_s7;
input AxiMonitorInterface_awready_s8;
input AxiMonitorInterface_awready_s9;
input AxiMonitorInterface_awready_s10;
input AxiMonitorInterface_awready_s11;
input AxiMonitorInterface_awready_s12;
input AxiMonitorInterface_awready_s13;
input AxiMonitorInterface_awready_s14;
input AxiMonitorInterface_awready_s15;
input AxiMonitorInterface_awready_s16;
input AxiMonitorInterface_awready_s17;
input AxiMonitorInterface_awready_s18;
input AxiMonitorInterface_awready_s19;
input AxiMonitorInterface_awready_s20;
input AxiMonitorInterface_awready_s21;
input AxiMonitorInterface_awready_s22;
input AxiMonitorInterface_awready_s23;
input AxiMonitorInterface_awready_s24;
input AxiMonitorInterface_awready_s25;
input AxiMonitorInterface_awready_s26;
input AxiMonitorInterface_awready_s27;
input AxiMonitorInterface_awready_s28;
input AxiMonitorInterface_awready_s29;
input AxiMonitorInterface_awready_s30;
input AxiMonitorInterface_awready_s31;
input [63:0] AxiMonitorInterface_awsideband_s0;
input [63:0] AxiMonitorInterface_awsideband_s1;
input [63:0] AxiMonitorInterface_awsideband_s2;
input [63:0] AxiMonitorInterface_awsideband_s3;
input [63:0] AxiMonitorInterface_awsideband_s4;
input [63:0] AxiMonitorInterface_awsideband_s5;
input [63:0] AxiMonitorInterface_awsideband_s6;
input [63:0] AxiMonitorInterface_awsideband_s7;
input [63:0] AxiMonitorInterface_awsideband_s8;
input [63:0] AxiMonitorInterface_awsideband_s9;
input [63:0] AxiMonitorInterface_awsideband_s10;
input [63:0] AxiMonitorInterface_awsideband_s11;
input [63:0] AxiMonitorInterface_awsideband_s12;
input [63:0] AxiMonitorInterface_awsideband_s13;
input [63:0] AxiMonitorInterface_awsideband_s14;
input [63:0] AxiMonitorInterface_awsideband_s15;
input [63:0] AxiMonitorInterface_awsideband_s16;
input [63:0] AxiMonitorInterface_awsideband_s17;
input [63:0] AxiMonitorInterface_awsideband_s18;
input [63:0] AxiMonitorInterface_awsideband_s19;
input [63:0] AxiMonitorInterface_awsideband_s20;
input [63:0] AxiMonitorInterface_awsideband_s21;
input [63:0] AxiMonitorInterface_awsideband_s22;
input [63:0] AxiMonitorInterface_awsideband_s23;
input [63:0] AxiMonitorInterface_awsideband_s24;
input [63:0] AxiMonitorInterface_awsideband_s25;
input [63:0] AxiMonitorInterface_awsideband_s26;
input [63:0] AxiMonitorInterface_awsideband_s27;
input [63:0] AxiMonitorInterface_awsideband_s28;
input [63:0] AxiMonitorInterface_awsideband_s29;
input [63:0] AxiMonitorInterface_awsideband_s30;
input [63:0] AxiMonitorInterface_awsideband_s31;
input AxiMonitorInterface_rvalid_s0;
input AxiMonitorInterface_rvalid_s1;
input AxiMonitorInterface_rvalid_s2;
input AxiMonitorInterface_rvalid_s3;
input AxiMonitorInterface_rvalid_s4;
input AxiMonitorInterface_rvalid_s5;
input AxiMonitorInterface_rvalid_s6;
input AxiMonitorInterface_rvalid_s7;
input AxiMonitorInterface_rvalid_s8;
input AxiMonitorInterface_rvalid_s9;
input AxiMonitorInterface_rvalid_s10;
input AxiMonitorInterface_rvalid_s11;
input AxiMonitorInterface_rvalid_s12;
input AxiMonitorInterface_rvalid_s13;
input AxiMonitorInterface_rvalid_s14;
input AxiMonitorInterface_rvalid_s15;
input AxiMonitorInterface_rvalid_s16;
input AxiMonitorInterface_rvalid_s17;
input AxiMonitorInterface_rvalid_s18;
input AxiMonitorInterface_rvalid_s19;
input AxiMonitorInterface_rvalid_s20;
input AxiMonitorInterface_rvalid_s21;
input AxiMonitorInterface_rvalid_s22;
input AxiMonitorInterface_rvalid_s23;
input AxiMonitorInterface_rvalid_s24;
input AxiMonitorInterface_rvalid_s25;
input AxiMonitorInterface_rvalid_s26;
input AxiMonitorInterface_rvalid_s27;
input AxiMonitorInterface_rvalid_s28;
input AxiMonitorInterface_rvalid_s29;
input AxiMonitorInterface_rvalid_s30;
input AxiMonitorInterface_rvalid_s31;
input AxiMonitorInterface_rlast_s0;
input AxiMonitorInterface_rlast_s1;
input AxiMonitorInterface_rlast_s2;
input AxiMonitorInterface_rlast_s3;
input AxiMonitorInterface_rlast_s4;
input AxiMonitorInterface_rlast_s5;
input AxiMonitorInterface_rlast_s6;
input AxiMonitorInterface_rlast_s7;
input AxiMonitorInterface_rlast_s8;
input AxiMonitorInterface_rlast_s9;
input AxiMonitorInterface_rlast_s10;
input AxiMonitorInterface_rlast_s11;
input AxiMonitorInterface_rlast_s12;
input AxiMonitorInterface_rlast_s13;
input AxiMonitorInterface_rlast_s14;
input AxiMonitorInterface_rlast_s15;
input AxiMonitorInterface_rlast_s16;
input AxiMonitorInterface_rlast_s17;
input AxiMonitorInterface_rlast_s18;
input AxiMonitorInterface_rlast_s19;
input AxiMonitorInterface_rlast_s20;
input AxiMonitorInterface_rlast_s21;
input AxiMonitorInterface_rlast_s22;
input AxiMonitorInterface_rlast_s23;
input AxiMonitorInterface_rlast_s24;
input AxiMonitorInterface_rlast_s25;
input AxiMonitorInterface_rlast_s26;
input AxiMonitorInterface_rlast_s27;
input AxiMonitorInterface_rlast_s28;
input AxiMonitorInterface_rlast_s29;
input AxiMonitorInterface_rlast_s30;
input AxiMonitorInterface_rlast_s31;
input [1023:0] AxiMonitorInterface_rdata_s0;
input [1023:0] AxiMonitorInterface_rdata_s1;
input [1023:0] AxiMonitorInterface_rdata_s2;
input [1023:0] AxiMonitorInterface_rdata_s3;
input [1023:0] AxiMonitorInterface_rdata_s4;
input [1023:0] AxiMonitorInterface_rdata_s5;
input [1023:0] AxiMonitorInterface_rdata_s6;
input [1023:0] AxiMonitorInterface_rdata_s7;
input [1023:0] AxiMonitorInterface_rdata_s8;
input [1023:0] AxiMonitorInterface_rdata_s9;
input [1023:0] AxiMonitorInterface_rdata_s10;
input [1023:0] AxiMonitorInterface_rdata_s11;
input [1023:0] AxiMonitorInterface_rdata_s12;
input [1023:0] AxiMonitorInterface_rdata_s13;
input [1023:0] AxiMonitorInterface_rdata_s14;
input [1023:0] AxiMonitorInterface_rdata_s15;
input [1023:0] AxiMonitorInterface_rdata_s16;
input [1023:0] AxiMonitorInterface_rdata_s17;
input [1023:0] AxiMonitorInterface_rdata_s18;
input [1023:0] AxiMonitorInterface_rdata_s19;
input [1023:0] AxiMonitorInterface_rdata_s20;
input [1023:0] AxiMonitorInterface_rdata_s21;
input [1023:0] AxiMonitorInterface_rdata_s22;
input [1023:0] AxiMonitorInterface_rdata_s23;
input [1023:0] AxiMonitorInterface_rdata_s24;
input [1023:0] AxiMonitorInterface_rdata_s25;
input [1023:0] AxiMonitorInterface_rdata_s26;
input [1023:0] AxiMonitorInterface_rdata_s27;
input [1023:0] AxiMonitorInterface_rdata_s28;
input [1023:0] AxiMonitorInterface_rdata_s29;
input [1023:0] AxiMonitorInterface_rdata_s30;
input [1023:0] AxiMonitorInterface_rdata_s31;
input [1:0] AxiMonitorInterface_rresp_s0;
input [1:0] AxiMonitorInterface_rresp_s1;
input [1:0] AxiMonitorInterface_rresp_s2;
input [1:0] AxiMonitorInterface_rresp_s3;
input [1:0] AxiMonitorInterface_rresp_s4;
input [1:0] AxiMonitorInterface_rresp_s5;
input [1:0] AxiMonitorInterface_rresp_s6;
input [1:0] AxiMonitorInterface_rresp_s7;
input [1:0] AxiMonitorInterface_rresp_s8;
input [1:0] AxiMonitorInterface_rresp_s9;
input [1:0] AxiMonitorInterface_rresp_s10;
input [1:0] AxiMonitorInterface_rresp_s11;
input [1:0] AxiMonitorInterface_rresp_s12;
input [1:0] AxiMonitorInterface_rresp_s13;
input [1:0] AxiMonitorInterface_rresp_s14;
input [1:0] AxiMonitorInterface_rresp_s15;
input [1:0] AxiMonitorInterface_rresp_s16;
input [1:0] AxiMonitorInterface_rresp_s17;
input [1:0] AxiMonitorInterface_rresp_s18;
input [1:0] AxiMonitorInterface_rresp_s19;
input [1:0] AxiMonitorInterface_rresp_s20;
input [1:0] AxiMonitorInterface_rresp_s21;
input [1:0] AxiMonitorInterface_rresp_s22;
input [1:0] AxiMonitorInterface_rresp_s23;
input [1:0] AxiMonitorInterface_rresp_s24;
input [1:0] AxiMonitorInterface_rresp_s25;
input [1:0] AxiMonitorInterface_rresp_s26;
input [1:0] AxiMonitorInterface_rresp_s27;
input [1:0] AxiMonitorInterface_rresp_s28;
input [1:0] AxiMonitorInterface_rresp_s29;
input [1:0] AxiMonitorInterface_rresp_s30;
input [1:0] AxiMonitorInterface_rresp_s31;
input [31:0] AxiMonitorInterface_rid_s0;
input [31:0] AxiMonitorInterface_rid_s1;
input [31:0] AxiMonitorInterface_rid_s2;
input [31:0] AxiMonitorInterface_rid_s3;
input [31:0] AxiMonitorInterface_rid_s4;
input [31:0] AxiMonitorInterface_rid_s5;
input [31:0] AxiMonitorInterface_rid_s6;
input [31:0] AxiMonitorInterface_rid_s7;
input [31:0] AxiMonitorInterface_rid_s8;
input [31:0] AxiMonitorInterface_rid_s9;
input [31:0] AxiMonitorInterface_rid_s10;
input [31:0] AxiMonitorInterface_rid_s11;
input [31:0] AxiMonitorInterface_rid_s12;
input [31:0] AxiMonitorInterface_rid_s13;
input [31:0] AxiMonitorInterface_rid_s14;
input [31:0] AxiMonitorInterface_rid_s15;
input [31:0] AxiMonitorInterface_rid_s16;
input [31:0] AxiMonitorInterface_rid_s17;
input [31:0] AxiMonitorInterface_rid_s18;
input [31:0] AxiMonitorInterface_rid_s19;
input [31:0] AxiMonitorInterface_rid_s20;
input [31:0] AxiMonitorInterface_rid_s21;
input [31:0] AxiMonitorInterface_rid_s22;
input [31:0] AxiMonitorInterface_rid_s23;
input [31:0] AxiMonitorInterface_rid_s24;
input [31:0] AxiMonitorInterface_rid_s25;
input [31:0] AxiMonitorInterface_rid_s26;
input [31:0] AxiMonitorInterface_rid_s27;
input [31:0] AxiMonitorInterface_rid_s28;
input [31:0] AxiMonitorInterface_rid_s29;
input [31:0] AxiMonitorInterface_rid_s30;
input [31:0] AxiMonitorInterface_rid_s31;
input AxiMonitorInterface_rready_s0;
input AxiMonitorInterface_rready_s1;
input AxiMonitorInterface_rready_s2;
input AxiMonitorInterface_rready_s3;
input AxiMonitorInterface_rready_s4;
input AxiMonitorInterface_rready_s5;
input AxiMonitorInterface_rready_s6;
input AxiMonitorInterface_rready_s7;
input AxiMonitorInterface_rready_s8;
input AxiMonitorInterface_rready_s9;
input AxiMonitorInterface_rready_s10;
input AxiMonitorInterface_rready_s11;
input AxiMonitorInterface_rready_s12;
input AxiMonitorInterface_rready_s13;
input AxiMonitorInterface_rready_s14;
input AxiMonitorInterface_rready_s15;
input AxiMonitorInterface_rready_s16;
input AxiMonitorInterface_rready_s17;
input AxiMonitorInterface_rready_s18;
input AxiMonitorInterface_rready_s19;
input AxiMonitorInterface_rready_s20;
input AxiMonitorInterface_rready_s21;
input AxiMonitorInterface_rready_s22;
input AxiMonitorInterface_rready_s23;
input AxiMonitorInterface_rready_s24;
input AxiMonitorInterface_rready_s25;
input AxiMonitorInterface_rready_s26;
input AxiMonitorInterface_rready_s27;
input AxiMonitorInterface_rready_s28;
input AxiMonitorInterface_rready_s29;
input AxiMonitorInterface_rready_s30;
input AxiMonitorInterface_rready_s31;
input [63:0] AxiMonitorInterface_rsideband_s0;
input [63:0] AxiMonitorInterface_rsideband_s1;
input [63:0] AxiMonitorInterface_rsideband_s2;
input [63:0] AxiMonitorInterface_rsideband_s3;
input [63:0] AxiMonitorInterface_rsideband_s4;
input [63:0] AxiMonitorInterface_rsideband_s5;
input [63:0] AxiMonitorInterface_rsideband_s6;
input [63:0] AxiMonitorInterface_rsideband_s7;
input [63:0] AxiMonitorInterface_rsideband_s8;
input [63:0] AxiMonitorInterface_rsideband_s9;
input [63:0] AxiMonitorInterface_rsideband_s10;
input [63:0] AxiMonitorInterface_rsideband_s11;
input [63:0] AxiMonitorInterface_rsideband_s12;
input [63:0] AxiMonitorInterface_rsideband_s13;
input [63:0] AxiMonitorInterface_rsideband_s14;
input [63:0] AxiMonitorInterface_rsideband_s15;
input [63:0] AxiMonitorInterface_rsideband_s16;
input [63:0] AxiMonitorInterface_rsideband_s17;
input [63:0] AxiMonitorInterface_rsideband_s18;
input [63:0] AxiMonitorInterface_rsideband_s19;
input [63:0] AxiMonitorInterface_rsideband_s20;
input [63:0] AxiMonitorInterface_rsideband_s21;
input [63:0] AxiMonitorInterface_rsideband_s22;
input [63:0] AxiMonitorInterface_rsideband_s23;
input [63:0] AxiMonitorInterface_rsideband_s24;
input [63:0] AxiMonitorInterface_rsideband_s25;
input [63:0] AxiMonitorInterface_rsideband_s26;
input [63:0] AxiMonitorInterface_rsideband_s27;
input [63:0] AxiMonitorInterface_rsideband_s28;
input [63:0] AxiMonitorInterface_rsideband_s29;
input [63:0] AxiMonitorInterface_rsideband_s30;
input [63:0] AxiMonitorInterface_rsideband_s31;
input AxiMonitorInterface_wvalid_s0;
input AxiMonitorInterface_wvalid_s1;
input AxiMonitorInterface_wvalid_s2;
input AxiMonitorInterface_wvalid_s3;
input AxiMonitorInterface_wvalid_s4;
input AxiMonitorInterface_wvalid_s5;
input AxiMonitorInterface_wvalid_s6;
input AxiMonitorInterface_wvalid_s7;
input AxiMonitorInterface_wvalid_s8;
input AxiMonitorInterface_wvalid_s9;
input AxiMonitorInterface_wvalid_s10;
input AxiMonitorInterface_wvalid_s11;
input AxiMonitorInterface_wvalid_s12;
input AxiMonitorInterface_wvalid_s13;
input AxiMonitorInterface_wvalid_s14;
input AxiMonitorInterface_wvalid_s15;
input AxiMonitorInterface_wvalid_s16;
input AxiMonitorInterface_wvalid_s17;
input AxiMonitorInterface_wvalid_s18;
input AxiMonitorInterface_wvalid_s19;
input AxiMonitorInterface_wvalid_s20;
input AxiMonitorInterface_wvalid_s21;
input AxiMonitorInterface_wvalid_s22;
input AxiMonitorInterface_wvalid_s23;
input AxiMonitorInterface_wvalid_s24;
input AxiMonitorInterface_wvalid_s25;
input AxiMonitorInterface_wvalid_s26;
input AxiMonitorInterface_wvalid_s27;
input AxiMonitorInterface_wvalid_s28;
input AxiMonitorInterface_wvalid_s29;
input AxiMonitorInterface_wvalid_s30;
input AxiMonitorInterface_wvalid_s31;
input AxiMonitorInterface_wlast_s0;
input AxiMonitorInterface_wlast_s1;
input AxiMonitorInterface_wlast_s2;
input AxiMonitorInterface_wlast_s3;
input AxiMonitorInterface_wlast_s4;
input AxiMonitorInterface_wlast_s5;
input AxiMonitorInterface_wlast_s6;
input AxiMonitorInterface_wlast_s7;
input AxiMonitorInterface_wlast_s8;
input AxiMonitorInterface_wlast_s9;
input AxiMonitorInterface_wlast_s10;
input AxiMonitorInterface_wlast_s11;
input AxiMonitorInterface_wlast_s12;
input AxiMonitorInterface_wlast_s13;
input AxiMonitorInterface_wlast_s14;
input AxiMonitorInterface_wlast_s15;
input AxiMonitorInterface_wlast_s16;
input AxiMonitorInterface_wlast_s17;
input AxiMonitorInterface_wlast_s18;
input AxiMonitorInterface_wlast_s19;
input AxiMonitorInterface_wlast_s20;
input AxiMonitorInterface_wlast_s21;
input AxiMonitorInterface_wlast_s22;
input AxiMonitorInterface_wlast_s23;
input AxiMonitorInterface_wlast_s24;
input AxiMonitorInterface_wlast_s25;
input AxiMonitorInterface_wlast_s26;
input AxiMonitorInterface_wlast_s27;
input AxiMonitorInterface_wlast_s28;
input AxiMonitorInterface_wlast_s29;
input AxiMonitorInterface_wlast_s30;
input AxiMonitorInterface_wlast_s31;
input [1023:0] AxiMonitorInterface_wdata_s0;
input [1023:0] AxiMonitorInterface_wdata_s1;
input [1023:0] AxiMonitorInterface_wdata_s2;
input [1023:0] AxiMonitorInterface_wdata_s3;
input [1023:0] AxiMonitorInterface_wdata_s4;
input [1023:0] AxiMonitorInterface_wdata_s5;
input [1023:0] AxiMonitorInterface_wdata_s6;
input [1023:0] AxiMonitorInterface_wdata_s7;
input [1023:0] AxiMonitorInterface_wdata_s8;
input [1023:0] AxiMonitorInterface_wdata_s9;
input [1023:0] AxiMonitorInterface_wdata_s10;
input [1023:0] AxiMonitorInterface_wdata_s11;
input [1023:0] AxiMonitorInterface_wdata_s12;
input [1023:0] AxiMonitorInterface_wdata_s13;
input [1023:0] AxiMonitorInterface_wdata_s14;
input [1023:0] AxiMonitorInterface_wdata_s15;
input [1023:0] AxiMonitorInterface_wdata_s16;
input [1023:0] AxiMonitorInterface_wdata_s17;
input [1023:0] AxiMonitorInterface_wdata_s18;
input [1023:0] AxiMonitorInterface_wdata_s19;
input [1023:0] AxiMonitorInterface_wdata_s20;
input [1023:0] AxiMonitorInterface_wdata_s21;
input [1023:0] AxiMonitorInterface_wdata_s22;
input [1023:0] AxiMonitorInterface_wdata_s23;
input [1023:0] AxiMonitorInterface_wdata_s24;
input [1023:0] AxiMonitorInterface_wdata_s25;
input [1023:0] AxiMonitorInterface_wdata_s26;
input [1023:0] AxiMonitorInterface_wdata_s27;
input [1023:0] AxiMonitorInterface_wdata_s28;
input [1023:0] AxiMonitorInterface_wdata_s29;
input [1023:0] AxiMonitorInterface_wdata_s30;
input [1023:0] AxiMonitorInterface_wdata_s31;
input [127:0] AxiMonitorInterface_wstrb_s0;
input [127:0] AxiMonitorInterface_wstrb_s1;
input [127:0] AxiMonitorInterface_wstrb_s2;
input [127:0] AxiMonitorInterface_wstrb_s3;
input [127:0] AxiMonitorInterface_wstrb_s4;
input [127:0] AxiMonitorInterface_wstrb_s5;
input [127:0] AxiMonitorInterface_wstrb_s6;
input [127:0] AxiMonitorInterface_wstrb_s7;
input [127:0] AxiMonitorInterface_wstrb_s8;
input [127:0] AxiMonitorInterface_wstrb_s9;
input [127:0] AxiMonitorInterface_wstrb_s10;
input [127:0] AxiMonitorInterface_wstrb_s11;
input [127:0] AxiMonitorInterface_wstrb_s12;
input [127:0] AxiMonitorInterface_wstrb_s13;
input [127:0] AxiMonitorInterface_wstrb_s14;
input [127:0] AxiMonitorInterface_wstrb_s15;
input [127:0] AxiMonitorInterface_wstrb_s16;
input [127:0] AxiMonitorInterface_wstrb_s17;
input [127:0] AxiMonitorInterface_wstrb_s18;
input [127:0] AxiMonitorInterface_wstrb_s19;
input [127:0] AxiMonitorInterface_wstrb_s20;
input [127:0] AxiMonitorInterface_wstrb_s21;
input [127:0] AxiMonitorInterface_wstrb_s22;
input [127:0] AxiMonitorInterface_wstrb_s23;
input [127:0] AxiMonitorInterface_wstrb_s24;
input [127:0] AxiMonitorInterface_wstrb_s25;
input [127:0] AxiMonitorInterface_wstrb_s26;
input [127:0] AxiMonitorInterface_wstrb_s27;
input [127:0] AxiMonitorInterface_wstrb_s28;
input [127:0] AxiMonitorInterface_wstrb_s29;
input [127:0] AxiMonitorInterface_wstrb_s30;
input [127:0] AxiMonitorInterface_wstrb_s31;
input [31:0] AxiMonitorInterface_wid_s0;
input [31:0] AxiMonitorInterface_wid_s1;
input [31:0] AxiMonitorInterface_wid_s2;
input [31:0] AxiMonitorInterface_wid_s3;
input [31:0] AxiMonitorInterface_wid_s4;
input [31:0] AxiMonitorInterface_wid_s5;
input [31:0] AxiMonitorInterface_wid_s6;
input [31:0] AxiMonitorInterface_wid_s7;
input [31:0] AxiMonitorInterface_wid_s8;
input [31:0] AxiMonitorInterface_wid_s9;
input [31:0] AxiMonitorInterface_wid_s10;
input [31:0] AxiMonitorInterface_wid_s11;
input [31:0] AxiMonitorInterface_wid_s12;
input [31:0] AxiMonitorInterface_wid_s13;
input [31:0] AxiMonitorInterface_wid_s14;
input [31:0] AxiMonitorInterface_wid_s15;
input [31:0] AxiMonitorInterface_wid_s16;
input [31:0] AxiMonitorInterface_wid_s17;
input [31:0] AxiMonitorInterface_wid_s18;
input [31:0] AxiMonitorInterface_wid_s19;
input [31:0] AxiMonitorInterface_wid_s20;
input [31:0] AxiMonitorInterface_wid_s21;
input [31:0] AxiMonitorInterface_wid_s22;
input [31:0] AxiMonitorInterface_wid_s23;
input [31:0] AxiMonitorInterface_wid_s24;
input [31:0] AxiMonitorInterface_wid_s25;
input [31:0] AxiMonitorInterface_wid_s26;
input [31:0] AxiMonitorInterface_wid_s27;
input [31:0] AxiMonitorInterface_wid_s28;
input [31:0] AxiMonitorInterface_wid_s29;
input [31:0] AxiMonitorInterface_wid_s30;
input [31:0] AxiMonitorInterface_wid_s31;
input AxiMonitorInterface_wready_s0;
input AxiMonitorInterface_wready_s1;
input AxiMonitorInterface_wready_s2;
input AxiMonitorInterface_wready_s3;
input AxiMonitorInterface_wready_s4;
input AxiMonitorInterface_wready_s5;
input AxiMonitorInterface_wready_s6;
input AxiMonitorInterface_wready_s7;
input AxiMonitorInterface_wready_s8;
input AxiMonitorInterface_wready_s9;
input AxiMonitorInterface_wready_s10;
input AxiMonitorInterface_wready_s11;
input AxiMonitorInterface_wready_s12;
input AxiMonitorInterface_wready_s13;
input AxiMonitorInterface_wready_s14;
input AxiMonitorInterface_wready_s15;
input AxiMonitorInterface_wready_s16;
input AxiMonitorInterface_wready_s17;
input AxiMonitorInterface_wready_s18;
input AxiMonitorInterface_wready_s19;
input AxiMonitorInterface_wready_s20;
input AxiMonitorInterface_wready_s21;
input AxiMonitorInterface_wready_s22;
input AxiMonitorInterface_wready_s23;
input AxiMonitorInterface_wready_s24;
input AxiMonitorInterface_wready_s25;
input AxiMonitorInterface_wready_s26;
input AxiMonitorInterface_wready_s27;
input AxiMonitorInterface_wready_s28;
input AxiMonitorInterface_wready_s29;
input AxiMonitorInterface_wready_s30;
input AxiMonitorInterface_wready_s31;
input [63:0] AxiMonitorInterface_wsideband_s0;
input [63:0] AxiMonitorInterface_wsideband_s1;
input [63:0] AxiMonitorInterface_wsideband_s2;
input [63:0] AxiMonitorInterface_wsideband_s3;
input [63:0] AxiMonitorInterface_wsideband_s4;
input [63:0] AxiMonitorInterface_wsideband_s5;
input [63:0] AxiMonitorInterface_wsideband_s6;
input [63:0] AxiMonitorInterface_wsideband_s7;
input [63:0] AxiMonitorInterface_wsideband_s8;
input [63:0] AxiMonitorInterface_wsideband_s9;
input [63:0] AxiMonitorInterface_wsideband_s10;
input [63:0] AxiMonitorInterface_wsideband_s11;
input [63:0] AxiMonitorInterface_wsideband_s12;
input [63:0] AxiMonitorInterface_wsideband_s13;
input [63:0] AxiMonitorInterface_wsideband_s14;
input [63:0] AxiMonitorInterface_wsideband_s15;
input [63:0] AxiMonitorInterface_wsideband_s16;
input [63:0] AxiMonitorInterface_wsideband_s17;
input [63:0] AxiMonitorInterface_wsideband_s18;
input [63:0] AxiMonitorInterface_wsideband_s19;
input [63:0] AxiMonitorInterface_wsideband_s20;
input [63:0] AxiMonitorInterface_wsideband_s21;
input [63:0] AxiMonitorInterface_wsideband_s22;
input [63:0] AxiMonitorInterface_wsideband_s23;
input [63:0] AxiMonitorInterface_wsideband_s24;
input [63:0] AxiMonitorInterface_wsideband_s25;
input [63:0] AxiMonitorInterface_wsideband_s26;
input [63:0] AxiMonitorInterface_wsideband_s27;
input [63:0] AxiMonitorInterface_wsideband_s28;
input [63:0] AxiMonitorInterface_wsideband_s29;
input [63:0] AxiMonitorInterface_wsideband_s30;
input [63:0] AxiMonitorInterface_wsideband_s31;
input AxiMonitorInterface_bvalid_s0;
input AxiMonitorInterface_bvalid_s1;
input AxiMonitorInterface_bvalid_s2;
input AxiMonitorInterface_bvalid_s3;
input AxiMonitorInterface_bvalid_s4;
input AxiMonitorInterface_bvalid_s5;
input AxiMonitorInterface_bvalid_s6;
input AxiMonitorInterface_bvalid_s7;
input AxiMonitorInterface_bvalid_s8;
input AxiMonitorInterface_bvalid_s9;
input AxiMonitorInterface_bvalid_s10;
input AxiMonitorInterface_bvalid_s11;
input AxiMonitorInterface_bvalid_s12;
input AxiMonitorInterface_bvalid_s13;
input AxiMonitorInterface_bvalid_s14;
input AxiMonitorInterface_bvalid_s15;
input AxiMonitorInterface_bvalid_s16;
input AxiMonitorInterface_bvalid_s17;
input AxiMonitorInterface_bvalid_s18;
input AxiMonitorInterface_bvalid_s19;
input AxiMonitorInterface_bvalid_s20;
input AxiMonitorInterface_bvalid_s21;
input AxiMonitorInterface_bvalid_s22;
input AxiMonitorInterface_bvalid_s23;
input AxiMonitorInterface_bvalid_s24;
input AxiMonitorInterface_bvalid_s25;
input AxiMonitorInterface_bvalid_s26;
input AxiMonitorInterface_bvalid_s27;
input AxiMonitorInterface_bvalid_s28;
input AxiMonitorInterface_bvalid_s29;
input AxiMonitorInterface_bvalid_s30;
input AxiMonitorInterface_bvalid_s31;
input [1:0] AxiMonitorInterface_bresp_s0;
input [1:0] AxiMonitorInterface_bresp_s1;
input [1:0] AxiMonitorInterface_bresp_s2;
input [1:0] AxiMonitorInterface_bresp_s3;
input [1:0] AxiMonitorInterface_bresp_s4;
input [1:0] AxiMonitorInterface_bresp_s5;
input [1:0] AxiMonitorInterface_bresp_s6;
input [1:0] AxiMonitorInterface_bresp_s7;
input [1:0] AxiMonitorInterface_bresp_s8;
input [1:0] AxiMonitorInterface_bresp_s9;
input [1:0] AxiMonitorInterface_bresp_s10;
input [1:0] AxiMonitorInterface_bresp_s11;
input [1:0] AxiMonitorInterface_bresp_s12;
input [1:0] AxiMonitorInterface_bresp_s13;
input [1:0] AxiMonitorInterface_bresp_s14;
input [1:0] AxiMonitorInterface_bresp_s15;
input [1:0] AxiMonitorInterface_bresp_s16;
input [1:0] AxiMonitorInterface_bresp_s17;
input [1:0] AxiMonitorInterface_bresp_s18;
input [1:0] AxiMonitorInterface_bresp_s19;
input [1:0] AxiMonitorInterface_bresp_s20;
input [1:0] AxiMonitorInterface_bresp_s21;
input [1:0] AxiMonitorInterface_bresp_s22;
input [1:0] AxiMonitorInterface_bresp_s23;
input [1:0] AxiMonitorInterface_bresp_s24;
input [1:0] AxiMonitorInterface_bresp_s25;
input [1:0] AxiMonitorInterface_bresp_s26;
input [1:0] AxiMonitorInterface_bresp_s27;
input [1:0] AxiMonitorInterface_bresp_s28;
input [1:0] AxiMonitorInterface_bresp_s29;
input [1:0] AxiMonitorInterface_bresp_s30;
input [1:0] AxiMonitorInterface_bresp_s31;
input [31:0] AxiMonitorInterface_bid_s0;
input [31:0] AxiMonitorInterface_bid_s1;
input [31:0] AxiMonitorInterface_bid_s2;
input [31:0] AxiMonitorInterface_bid_s3;
input [31:0] AxiMonitorInterface_bid_s4;
input [31:0] AxiMonitorInterface_bid_s5;
input [31:0] AxiMonitorInterface_bid_s6;
input [31:0] AxiMonitorInterface_bid_s7;
input [31:0] AxiMonitorInterface_bid_s8;
input [31:0] AxiMonitorInterface_bid_s9;
input [31:0] AxiMonitorInterface_bid_s10;
input [31:0] AxiMonitorInterface_bid_s11;
input [31:0] AxiMonitorInterface_bid_s12;
input [31:0] AxiMonitorInterface_bid_s13;
input [31:0] AxiMonitorInterface_bid_s14;
input [31:0] AxiMonitorInterface_bid_s15;
input [31:0] AxiMonitorInterface_bid_s16;
input [31:0] AxiMonitorInterface_bid_s17;
input [31:0] AxiMonitorInterface_bid_s18;
input [31:0] AxiMonitorInterface_bid_s19;
input [31:0] AxiMonitorInterface_bid_s20;
input [31:0] AxiMonitorInterface_bid_s21;
input [31:0] AxiMonitorInterface_bid_s22;
input [31:0] AxiMonitorInterface_bid_s23;
input [31:0] AxiMonitorInterface_bid_s24;
input [31:0] AxiMonitorInterface_bid_s25;
input [31:0] AxiMonitorInterface_bid_s26;
input [31:0] AxiMonitorInterface_bid_s27;
input [31:0] AxiMonitorInterface_bid_s28;
input [31:0] AxiMonitorInterface_bid_s29;
input [31:0] AxiMonitorInterface_bid_s30;
input [31:0] AxiMonitorInterface_bid_s31;
input AxiMonitorInterface_bready_s0;
input AxiMonitorInterface_bready_s1;
input AxiMonitorInterface_bready_s2;
input AxiMonitorInterface_bready_s3;
input AxiMonitorInterface_bready_s4;
input AxiMonitorInterface_bready_s5;
input AxiMonitorInterface_bready_s6;
input AxiMonitorInterface_bready_s7;
input AxiMonitorInterface_bready_s8;
input AxiMonitorInterface_bready_s9;
input AxiMonitorInterface_bready_s10;
input AxiMonitorInterface_bready_s11;
input AxiMonitorInterface_bready_s12;
input AxiMonitorInterface_bready_s13;
input AxiMonitorInterface_bready_s14;
input AxiMonitorInterface_bready_s15;
input AxiMonitorInterface_bready_s16;
input AxiMonitorInterface_bready_s17;
input AxiMonitorInterface_bready_s18;
input AxiMonitorInterface_bready_s19;
input AxiMonitorInterface_bready_s20;
input AxiMonitorInterface_bready_s21;
input AxiMonitorInterface_bready_s22;
input AxiMonitorInterface_bready_s23;
input AxiMonitorInterface_bready_s24;
input AxiMonitorInterface_bready_s25;
input AxiMonitorInterface_bready_s26;
input AxiMonitorInterface_bready_s27;
input AxiMonitorInterface_bready_s28;
input AxiMonitorInterface_bready_s29;
input AxiMonitorInterface_bready_s30;
input AxiMonitorInterface_bready_s31;
input [63:0] AxiMonitorInterface_bsideband_s0;
input [63:0] AxiMonitorInterface_bsideband_s1;
input [63:0] AxiMonitorInterface_bsideband_s2;
input [63:0] AxiMonitorInterface_bsideband_s3;
input [63:0] AxiMonitorInterface_bsideband_s4;
input [63:0] AxiMonitorInterface_bsideband_s5;
input [63:0] AxiMonitorInterface_bsideband_s6;
input [63:0] AxiMonitorInterface_bsideband_s7;
input [63:0] AxiMonitorInterface_bsideband_s8;
input [63:0] AxiMonitorInterface_bsideband_s9;
input [63:0] AxiMonitorInterface_bsideband_s10;
input [63:0] AxiMonitorInterface_bsideband_s11;
input [63:0] AxiMonitorInterface_bsideband_s12;
input [63:0] AxiMonitorInterface_bsideband_s13;
input [63:0] AxiMonitorInterface_bsideband_s14;
input [63:0] AxiMonitorInterface_bsideband_s15;
input [63:0] AxiMonitorInterface_bsideband_s16;
input [63:0] AxiMonitorInterface_bsideband_s17;
input [63:0] AxiMonitorInterface_bsideband_s18;
input [63:0] AxiMonitorInterface_bsideband_s19;
input [63:0] AxiMonitorInterface_bsideband_s20;
input [63:0] AxiMonitorInterface_bsideband_s21;
input [63:0] AxiMonitorInterface_bsideband_s22;
input [63:0] AxiMonitorInterface_bsideband_s23;
input [63:0] AxiMonitorInterface_bsideband_s24;
input [63:0] AxiMonitorInterface_bsideband_s25;
input [63:0] AxiMonitorInterface_bsideband_s26;
input [63:0] AxiMonitorInterface_bsideband_s27;
input [63:0] AxiMonitorInterface_bsideband_s28;
input [63:0] AxiMonitorInterface_bsideband_s29;
input [63:0] AxiMonitorInterface_bsideband_s30;
input [63:0] AxiMonitorInterface_bsideband_s31;
input AxiMonitorInterface_cactive_s0;
input AxiMonitorInterface_cactive_s1;
input AxiMonitorInterface_cactive_s2;
input AxiMonitorInterface_cactive_s3;
input AxiMonitorInterface_cactive_s4;
input AxiMonitorInterface_cactive_s5;
input AxiMonitorInterface_cactive_s6;
input AxiMonitorInterface_cactive_s7;
input AxiMonitorInterface_cactive_s8;
input AxiMonitorInterface_cactive_s9;
input AxiMonitorInterface_cactive_s10;
input AxiMonitorInterface_cactive_s11;
input AxiMonitorInterface_cactive_s12;
input AxiMonitorInterface_cactive_s13;
input AxiMonitorInterface_cactive_s14;
input AxiMonitorInterface_cactive_s15;
input AxiMonitorInterface_cactive_s16;
input AxiMonitorInterface_cactive_s17;
input AxiMonitorInterface_cactive_s18;
input AxiMonitorInterface_cactive_s19;
input AxiMonitorInterface_cactive_s20;
input AxiMonitorInterface_cactive_s21;
input AxiMonitorInterface_cactive_s22;
input AxiMonitorInterface_cactive_s23;
input AxiMonitorInterface_cactive_s24;
input AxiMonitorInterface_cactive_s25;
input AxiMonitorInterface_cactive_s26;
input AxiMonitorInterface_cactive_s27;
input AxiMonitorInterface_cactive_s28;
input AxiMonitorInterface_cactive_s29;
input AxiMonitorInterface_cactive_s30;
input AxiMonitorInterface_cactive_s31;
input AxiMonitorInterface_csysreq_s0;
input AxiMonitorInterface_csysreq_s1;
input AxiMonitorInterface_csysreq_s2;
input AxiMonitorInterface_csysreq_s3;
input AxiMonitorInterface_csysreq_s4;
input AxiMonitorInterface_csysreq_s5;
input AxiMonitorInterface_csysreq_s6;
input AxiMonitorInterface_csysreq_s7;
input AxiMonitorInterface_csysreq_s8;
input AxiMonitorInterface_csysreq_s9;
input AxiMonitorInterface_csysreq_s10;
input AxiMonitorInterface_csysreq_s11;
input AxiMonitorInterface_csysreq_s12;
input AxiMonitorInterface_csysreq_s13;
input AxiMonitorInterface_csysreq_s14;
input AxiMonitorInterface_csysreq_s15;
input AxiMonitorInterface_csysreq_s16;
input AxiMonitorInterface_csysreq_s17;
input AxiMonitorInterface_csysreq_s18;
input AxiMonitorInterface_csysreq_s19;
input AxiMonitorInterface_csysreq_s20;
input AxiMonitorInterface_csysreq_s21;
input AxiMonitorInterface_csysreq_s22;
input AxiMonitorInterface_csysreq_s23;
input AxiMonitorInterface_csysreq_s24;
input AxiMonitorInterface_csysreq_s25;
input AxiMonitorInterface_csysreq_s26;
input AxiMonitorInterface_csysreq_s27;
input AxiMonitorInterface_csysreq_s28;
input AxiMonitorInterface_csysreq_s29;
input AxiMonitorInterface_csysreq_s30;
input AxiMonitorInterface_csysreq_s31;
input AxiMonitorInterface_csysack_s0;
input AxiMonitorInterface_csysack_s1;
input AxiMonitorInterface_csysack_s2;
input AxiMonitorInterface_csysack_s3;
input AxiMonitorInterface_csysack_s4;
input AxiMonitorInterface_csysack_s5;
input AxiMonitorInterface_csysack_s6;
input AxiMonitorInterface_csysack_s7;
input AxiMonitorInterface_csysack_s8;
input AxiMonitorInterface_csysack_s9;
input AxiMonitorInterface_csysack_s10;
input AxiMonitorInterface_csysack_s11;
input AxiMonitorInterface_csysack_s12;
input AxiMonitorInterface_csysack_s13;
input AxiMonitorInterface_csysack_s14;
input AxiMonitorInterface_csysack_s15;
input AxiMonitorInterface_csysack_s16;
input AxiMonitorInterface_csysack_s17;
input AxiMonitorInterface_csysack_s18;
input AxiMonitorInterface_csysack_s19;
input AxiMonitorInterface_csysack_s20;
input AxiMonitorInterface_csysack_s21;
input AxiMonitorInterface_csysack_s22;
input AxiMonitorInterface_csysack_s23;
input AxiMonitorInterface_csysack_s24;
input AxiMonitorInterface_csysack_s25;
input AxiMonitorInterface_csysack_s26;
input AxiMonitorInterface_csysack_s27;
input AxiMonitorInterface_csysack_s28;
input AxiMonitorInterface_csysack_s29;
input AxiMonitorInterface_csysack_s30;
input AxiMonitorInterface_csysack_s31;
input GifSlaveInterface_gclk;
input [63:0] GifSlaveInterface_maddr;
input GifSlaveInterface_mread;
input GifSlaveInterface_mwrite;
input [7:0] GifSlaveInterface_mlen;
input [2:0] GifSlaveInterface_msize;
input [1:0] GifSlaveInterface_mburst;
input GifSlaveInterface_mlast;
input [511:0] GifSlaveInterface_mdata;
input [63:0] GifSlaveInterface_mwstrb;
inout GifSlaveInterface_saccept;
inout GifSlaveInterface_svalid;
inout [511:0] GifSlaveInterface_sdata;
inout [1:0] GifSlaveInterface_sresp;
input GifSlaveInterface_mready;
input LowPowerInterface_aclk;
input LowPowerInterface_aresetn;
output LowPowerInterface_csysreq;
input LowPowerInterface_cactive;
input LowPowerInterface_csysack;
output LowPowerInterface_shutdown;
output LowPowerInterface_clocklevel;
output LowPowerInterface_cvrgen;

// parameter decls
parameter vera_load_all = "./test.vrl";
parameter vera_load_AxiMon64Cfg = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMon64Cfg.vro";
parameter vera_load_AxiMonitorCoverage = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorCoverage.vro";
parameter vera_load_AxiMonSysChks = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonSysChks.vro";
parameter vera_load_AxiMonitor64Internal = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitor64Internal.vro";
parameter vera_load_AxiMonitor = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitor.vro";
parameter vera_load_AxiMasterDriver = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterDriver.vro";
parameter vera_load_AxiMasterReceiver = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterReceiver.vro";
parameter vera_load_AxiMstrXmitMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrXmitMgr.vro";
parameter vera_load_AxiMstrTimer = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrTimer.vro";
parameter vera_load_AxiMstrSemaData = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrSemaData.vro";
parameter vera_load_AxiMstrRcvMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrRcvMgr.vro";
parameter vera_load_AxiMstrOutStndngMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrOutStndngMgr.vro";
parameter vera_load_AxiMstrIntlver = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrIntlver.vro";
parameter vera_load_AxiMstrInnerBuffer = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrInnerBuffer.vro";
parameter vera_load_AxiMasterBuffer = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterBuffer.vro";
parameter vera_load_AxiMasterInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterInternal.vro";
parameter vera_load_AxiMasterCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterCommands.vro";
parameter vera_load_AxiMaster = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMaster.vro";
parameter vera_load_AxiTransactionLog = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiTransactionLog.vro";
parameter vera_load_AmbaLog = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AmbaLog.vro";
parameter vera_load_AxiMonitorCommonCoverage = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorCommonCoverage.vro";
parameter vera_load_AxiMonitorCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorCommands.vro";
parameter vera_load_AxiMonitorBuffer = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorBuffer.vro";
parameter vera_load_AxiMonChChks = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonChChks.vro";
parameter vera_load_AxiMonXactChks = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonXactChks.vro";
parameter vera_load_AxiMonChecker = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonChecker.vro";
parameter vera_load_AxiMonXactBuf = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonXactBuf.vro";
parameter vera_load_AxiMonCh = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonCh.vro";
parameter vera_load_AxiMonPort = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonPort.vro";
parameter vera_load_AxiMonCfg = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonCfg.vro";
parameter vera_load_AxiMonitorInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorInternal.vro";
parameter vera_load_AxiBusArchitectureConfiguration_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiBusArchitectureConfiguration_rvm.vro";
parameter vera_load_AxiMonitorExtendedTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorExtendedTransaction_rvm.vro";
parameter vera_load_AxiMonitorTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorTransaction_rvm.vro";
parameter vera_load_AxiSlaveTransactionInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiSlaveTransactionInternal.vro";
parameter vera_load_AxiMasterTransactionInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterTransactionInternal.vro";
parameter vera_load_AxiTransactionInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiTransactionInternal.vro";
parameter vera_load_AxiConfigurationInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiConfigurationInternal.vro";
parameter vera_load_AxiConfiguration_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiConfiguration_rvm.vro";
parameter vera_load_AxiSlaveExtendedTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiSlaveExtendedTransaction_rvm.vro";
parameter vera_load_AxiSlaveTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiSlaveTransaction_rvm.vro";
parameter vera_load_AxiMasterExtendedTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterExtendedTransaction_rvm.vro";
parameter vera_load_AxiMasterTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterTransaction_rvm.vro";
parameter vera_load_AxiTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiTransaction_rvm.vro";
parameter vera_load_AxiMatchObj = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMatchObj.vro";
parameter vera_load_AxiMatchMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMatchMgr.vro";
parameter vera_load_AxiResponseMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiResponseMgr.vro";
parameter vera_load_AxiDriver = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiDriver.vro";
parameter vera_load_AxiReceiver = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiReceiver.vro";
parameter vera_load_AxiRcvMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiRcvMgr.vro";
parameter vera_load_AxiChXfer = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiChXfer.vro";
parameter vera_load_AxiBufferMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiBufferMgr.vro";
parameter vera_load_AxiMdlCfg = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMdlCfg.vro";
parameter vera_load_AxiCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiCommands.vro";
parameter vera_load_AxiModel = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiModel.vro";
parameter vera_load_AxiLib = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiLib.vro";
parameter vera_load_dw_vip_rvm = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/dw_vip_rvm.vro";
parameter vera_load_VmtCoverageCommands = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoverageCommands.vro";
parameter vera_load_VmtCoverageManager = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoverageManager.vro";
parameter vera_load_VmtCoverageGroup = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoverageGroup.vro";
parameter vera_load_VmtCoveragePoint = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoveragePoint.vro";
parameter vera_load_VmtCoverageBase = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoverageBase.vro";
parameter vera_load_VmtTransactionMonitorCommands = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionMonitorCommands.vro";
parameter vera_load_VmtTransactionChoiceMonitor = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionChoiceMonitor.vro";
parameter vera_load_VmtTransactionSequenceMonitor = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionSequenceMonitor.vro";
parameter vera_load_VmtProtocolTransactionMonitor = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtProtocolTransactionMonitor.vro";
parameter vera_load_VmtTransactionMonitor = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionMonitor.vro";
parameter vera_load_VmtPayload = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtPayload.vro";
parameter vera_load_VmtTransactionInfo = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionInfo.vro";
parameter vera_load_VmtTransactionExpression = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionExpression.vro";
parameter vera_load_VmtTransactionCommands = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionCommands.vro";
parameter vera_load_VmtTransactionChoiceGenerator = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionChoiceGenerator.vro";
parameter vera_load_VmtTransactionSequenceGenerator = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionSequenceGenerator.vro";
parameter vera_load_VmtProtocolTransactionGenerator = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtProtocolTransactionGenerator.vro";
parameter vera_load_VmtTransactionGenerator = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionGenerator.vro";
parameter vera_load_VmtTransaction = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransaction.vro";
parameter vera_load_VmtXactBase = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtXactBase.vro";
parameter vera_load_VmtMem = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtMem.vro";
parameter vera_load_VmtCommonCommands = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCommonCommands.vro";
parameter vera_load_VmtCommandManager = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCommandManager.vro";
parameter vera_load_VmtCommandDispatch = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCommandDispatch.vro";
parameter vera_load_VmtBase = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtBase.vro";
parameter vera_load_VmtMessageService = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtMessageService.vro";
parameter vera_udf_VipCommon = "${DESIGNWARE_HOME}/vip/common/latest/C/lib/${VERA_PLATFORM}/VipCommon.dl";
parameter vera_udf_VmtModelManager = "${DESIGNWARE_HOME}/vip/vmt/3.50b/C/lib/${VERA_PLATFORM}/VmtModelManager.dl";
parameter vera_runtime_information = "${VERA_VERSION}:${VERA_VMC}:${VERA_PLATFORM}:${DESIGNWARE_HOME}:";

// Nets which VMC will reference

// System clock: SystemClock
wire SystemClock;
assign SystemClock = AxiMonitorInterface_aclk;

// Interface: AxiMasterInterface Signal: aclk
wire AxiMasterInterface_aclk;

// Interface: AxiMasterInterface Signal: aresetn
wire AxiMasterInterface_aresetn;

// Interface: AxiMasterInterface Signal: awvalid
reg vmc_AxiMasterInterface_awvalid_reg;
assign AxiMasterInterface_awvalid = vmc_AxiMasterInterface_awvalid_reg;

// Interface: AxiMasterInterface Signal: awaddr
reg [63:0] vmc_AxiMasterInterface_awaddr_reg;
assign AxiMasterInterface_awaddr = vmc_AxiMasterInterface_awaddr_reg;

// Interface: AxiMasterInterface Signal: awlen
reg [9:0] vmc_AxiMasterInterface_awlen_reg;
assign AxiMasterInterface_awlen = vmc_AxiMasterInterface_awlen_reg;

// Interface: AxiMasterInterface Signal: awsize
reg [2:0] vmc_AxiMasterInterface_awsize_reg;
assign AxiMasterInterface_awsize = vmc_AxiMasterInterface_awsize_reg;

// Interface: AxiMasterInterface Signal: awburst
reg [1:0] vmc_AxiMasterInterface_awburst_reg;
assign AxiMasterInterface_awburst = vmc_AxiMasterInterface_awburst_reg;

// Interface: AxiMasterInterface Signal: awlock
reg [1:0] vmc_AxiMasterInterface_awlock_reg;
assign AxiMasterInterface_awlock = vmc_AxiMasterInterface_awlock_reg;

// Interface: AxiMasterInterface Signal: awcache
reg [3:0] vmc_AxiMasterInterface_awcache_reg;
assign AxiMasterInterface_awcache = vmc_AxiMasterInterface_awcache_reg;

// Interface: AxiMasterInterface Signal: awprot
reg [2:0] vmc_AxiMasterInterface_awprot_reg;
assign AxiMasterInterface_awprot = vmc_AxiMasterInterface_awprot_reg;

// Interface: AxiMasterInterface Signal: awid
reg [31:0] vmc_AxiMasterInterface_awid_reg;
assign AxiMasterInterface_awid = vmc_AxiMasterInterface_awid_reg;

// Interface: AxiMasterInterface Signal: awsideband
reg [63:0] vmc_AxiMasterInterface_awsideband_reg;
assign AxiMasterInterface_awsideband = vmc_AxiMasterInterface_awsideband_reg;

// Interface: AxiMasterInterface Signal: awready
wire AxiMasterInterface_awready;

// Interface: AxiMasterInterface Signal: arvalid
reg vmc_AxiMasterInterface_arvalid_reg;
assign AxiMasterInterface_arvalid = vmc_AxiMasterInterface_arvalid_reg;

// Interface: AxiMasterInterface Signal: araddr
reg [63:0] vmc_AxiMasterInterface_araddr_reg;
assign AxiMasterInterface_araddr = vmc_AxiMasterInterface_araddr_reg;

// Interface: AxiMasterInterface Signal: arlen
reg [9:0] vmc_AxiMasterInterface_arlen_reg;
assign AxiMasterInterface_arlen = vmc_AxiMasterInterface_arlen_reg;

// Interface: AxiMasterInterface Signal: arsize
reg [2:0] vmc_AxiMasterInterface_arsize_reg;
assign AxiMasterInterface_arsize = vmc_AxiMasterInterface_arsize_reg;

// Interface: AxiMasterInterface Signal: arburst
reg [1:0] vmc_AxiMasterInterface_arburst_reg;
assign AxiMasterInterface_arburst = vmc_AxiMasterInterface_arburst_reg;

// Interface: AxiMasterInterface Signal: arlock
reg [1:0] vmc_AxiMasterInterface_arlock_reg;
assign AxiMasterInterface_arlock = vmc_AxiMasterInterface_arlock_reg;

// Interface: AxiMasterInterface Signal: arcache
reg [3:0] vmc_AxiMasterInterface_arcache_reg;
assign AxiMasterInterface_arcache = vmc_AxiMasterInterface_arcache_reg;

// Interface: AxiMasterInterface Signal: arprot
reg [2:0] vmc_AxiMasterInterface_arprot_reg;
assign AxiMasterInterface_arprot = vmc_AxiMasterInterface_arprot_reg;

// Interface: AxiMasterInterface Signal: arid
reg [31:0] vmc_AxiMasterInterface_arid_reg;
assign AxiMasterInterface_arid = vmc_AxiMasterInterface_arid_reg;

// Interface: AxiMasterInterface Signal: arsideband
reg [63:0] vmc_AxiMasterInterface_arsideband_reg;
assign AxiMasterInterface_arsideband = vmc_AxiMasterInterface_arsideband_reg;

// Interface: AxiMasterInterface Signal: arready
wire AxiMasterInterface_arready;

// Interface: AxiMasterInterface Signal: rvalid
wire AxiMasterInterface_rvalid;

// Interface: AxiMasterInterface Signal: rlast
wire AxiMasterInterface_rlast;

// Interface: AxiMasterInterface Signal: rdata
wire [1023:0] AxiMasterInterface_rdata;

// Interface: AxiMasterInterface Signal: rresp
wire [1:0] AxiMasterInterface_rresp;

// Interface: AxiMasterInterface Signal: rid
wire [31:0] AxiMasterInterface_rid;

// Interface: AxiMasterInterface Signal: rsideband
wire [63:0] AxiMasterInterface_rsideband;

// Interface: AxiMasterInterface Signal: rready
reg vmc_AxiMasterInterface_rready_reg;
assign AxiMasterInterface_rready = vmc_AxiMasterInterface_rready_reg;

// Interface: AxiMasterInterface Signal: wvalid
reg vmc_AxiMasterInterface_wvalid_reg;
assign AxiMasterInterface_wvalid = vmc_AxiMasterInterface_wvalid_reg;

// Interface: AxiMasterInterface Signal: wlast
reg vmc_AxiMasterInterface_wlast_reg;
assign AxiMasterInterface_wlast = vmc_AxiMasterInterface_wlast_reg;

// Interface: AxiMasterInterface Signal: wdata
reg [1023:0] vmc_AxiMasterInterface_wdata_reg;
assign AxiMasterInterface_wdata = vmc_AxiMasterInterface_wdata_reg;

// Interface: AxiMasterInterface Signal: wstrb
reg [127:0] vmc_AxiMasterInterface_wstrb_reg;
assign AxiMasterInterface_wstrb = vmc_AxiMasterInterface_wstrb_reg;

// Interface: AxiMasterInterface Signal: wid
reg [31:0] vmc_AxiMasterInterface_wid_reg;
assign AxiMasterInterface_wid = vmc_AxiMasterInterface_wid_reg;

// Interface: AxiMasterInterface Signal: wsideband
reg [63:0] vmc_AxiMasterInterface_wsideband_reg;
assign AxiMasterInterface_wsideband = vmc_AxiMasterInterface_wsideband_reg;

// Interface: AxiMasterInterface Signal: wready
wire AxiMasterInterface_wready;

// Interface: AxiMasterInterface Signal: bvalid
wire AxiMasterInterface_bvalid;

// Interface: AxiMasterInterface Signal: bresp
wire [1:0] AxiMasterInterface_bresp;

// Interface: AxiMasterInterface Signal: bid
wire [31:0] AxiMasterInterface_bid;

// Interface: AxiMasterInterface Signal: bsideband
wire [63:0] AxiMasterInterface_bsideband;

// Interface: AxiMasterInterface Signal: bready
reg vmc_AxiMasterInterface_bready_reg;
assign AxiMasterInterface_bready = vmc_AxiMasterInterface_bready_reg;

// Interface: AxiMasterInterface Signal: csysreq
wire AxiMasterInterface_csysreq;

// Interface: AxiMasterInterface Signal: csysack
reg vmc_AxiMasterInterface_csysack_reg;
assign AxiMasterInterface_csysack = vmc_AxiMasterInterface_csysack_reg;

// Interface: AxiMasterInterface Signal: cactive
reg vmc_AxiMasterInterface_cactive_reg;
assign AxiMasterInterface_cactive = vmc_AxiMasterInterface_cactive_reg;

// Interface: AxiMonitorInterface Signal: aclk
wire AxiMonitorInterface_aclk;

// Interface: AxiMonitorInterface Signal: aresetn
wire AxiMonitorInterface_aresetn;

// Interface: AxiMonitorInterface Signal: arvalid_m0
wire AxiMonitorInterface_arvalid_m0;

// Interface: AxiMonitorInterface Signal: arvalid_m1
wire AxiMonitorInterface_arvalid_m1;

// Interface: AxiMonitorInterface Signal: arvalid_m2
wire AxiMonitorInterface_arvalid_m2;

// Interface: AxiMonitorInterface Signal: arvalid_m3
wire AxiMonitorInterface_arvalid_m3;

// Interface: AxiMonitorInterface Signal: arvalid_m4
wire AxiMonitorInterface_arvalid_m4;

// Interface: AxiMonitorInterface Signal: arvalid_m5
wire AxiMonitorInterface_arvalid_m5;

// Interface: AxiMonitorInterface Signal: arvalid_m6
wire AxiMonitorInterface_arvalid_m6;

// Interface: AxiMonitorInterface Signal: arvalid_m7
wire AxiMonitorInterface_arvalid_m7;

// Interface: AxiMonitorInterface Signal: arvalid_m8
wire AxiMonitorInterface_arvalid_m8;

// Interface: AxiMonitorInterface Signal: arvalid_m9
wire AxiMonitorInterface_arvalid_m9;

// Interface: AxiMonitorInterface Signal: arvalid_m10
wire AxiMonitorInterface_arvalid_m10;

// Interface: AxiMonitorInterface Signal: arvalid_m11
wire AxiMonitorInterface_arvalid_m11;

// Interface: AxiMonitorInterface Signal: arvalid_m12
wire AxiMonitorInterface_arvalid_m12;

// Interface: AxiMonitorInterface Signal: arvalid_m13
wire AxiMonitorInterface_arvalid_m13;

// Interface: AxiMonitorInterface Signal: arvalid_m14
wire AxiMonitorInterface_arvalid_m14;

// Interface: AxiMonitorInterface Signal: arvalid_m15
wire AxiMonitorInterface_arvalid_m15;

// Interface: AxiMonitorInterface Signal: arvalid_m16
wire AxiMonitorInterface_arvalid_m16;

// Interface: AxiMonitorInterface Signal: arvalid_m17
wire AxiMonitorInterface_arvalid_m17;

// Interface: AxiMonitorInterface Signal: arvalid_m18
wire AxiMonitorInterface_arvalid_m18;

// Interface: AxiMonitorInterface Signal: arvalid_m19
wire AxiMonitorInterface_arvalid_m19;

// Interface: AxiMonitorInterface Signal: arvalid_m20
wire AxiMonitorInterface_arvalid_m20;

// Interface: AxiMonitorInterface Signal: arvalid_m21
wire AxiMonitorInterface_arvalid_m21;

// Interface: AxiMonitorInterface Signal: arvalid_m22
wire AxiMonitorInterface_arvalid_m22;

// Interface: AxiMonitorInterface Signal: arvalid_m23
wire AxiMonitorInterface_arvalid_m23;

// Interface: AxiMonitorInterface Signal: arvalid_m24
wire AxiMonitorInterface_arvalid_m24;

// Interface: AxiMonitorInterface Signal: arvalid_m25
wire AxiMonitorInterface_arvalid_m25;

// Interface: AxiMonitorInterface Signal: arvalid_m26
wire AxiMonitorInterface_arvalid_m26;

// Interface: AxiMonitorInterface Signal: arvalid_m27
wire AxiMonitorInterface_arvalid_m27;

// Interface: AxiMonitorInterface Signal: arvalid_m28
wire AxiMonitorInterface_arvalid_m28;

// Interface: AxiMonitorInterface Signal: arvalid_m29
wire AxiMonitorInterface_arvalid_m29;

// Interface: AxiMonitorInterface Signal: arvalid_m30
wire AxiMonitorInterface_arvalid_m30;

// Interface: AxiMonitorInterface Signal: arvalid_m31
wire AxiMonitorInterface_arvalid_m31;

// Interface: AxiMonitorInterface Signal: araddr_m0
wire [63:0] AxiMonitorInterface_araddr_m0;

// Interface: AxiMonitorInterface Signal: araddr_m1
wire [63:0] AxiMonitorInterface_araddr_m1;

// Interface: AxiMonitorInterface Signal: araddr_m2
wire [63:0] AxiMonitorInterface_araddr_m2;

// Interface: AxiMonitorInterface Signal: araddr_m3
wire [63:0] AxiMonitorInterface_araddr_m3;

// Interface: AxiMonitorInterface Signal: araddr_m4
wire [63:0] AxiMonitorInterface_araddr_m4;

// Interface: AxiMonitorInterface Signal: araddr_m5
wire [63:0] AxiMonitorInterface_araddr_m5;

// Interface: AxiMonitorInterface Signal: araddr_m6
wire [63:0] AxiMonitorInterface_araddr_m6;

// Interface: AxiMonitorInterface Signal: araddr_m7
wire [63:0] AxiMonitorInterface_araddr_m7;

// Interface: AxiMonitorInterface Signal: araddr_m8
wire [63:0] AxiMonitorInterface_araddr_m8;

// Interface: AxiMonitorInterface Signal: araddr_m9
wire [63:0] AxiMonitorInterface_araddr_m9;

// Interface: AxiMonitorInterface Signal: araddr_m10
wire [63:0] AxiMonitorInterface_araddr_m10;

// Interface: AxiMonitorInterface Signal: araddr_m11
wire [63:0] AxiMonitorInterface_araddr_m11;

// Interface: AxiMonitorInterface Signal: araddr_m12
wire [63:0] AxiMonitorInterface_araddr_m12;

// Interface: AxiMonitorInterface Signal: araddr_m13
wire [63:0] AxiMonitorInterface_araddr_m13;

// Interface: AxiMonitorInterface Signal: araddr_m14
wire [63:0] AxiMonitorInterface_araddr_m14;

// Interface: AxiMonitorInterface Signal: araddr_m15
wire [63:0] AxiMonitorInterface_araddr_m15;

// Interface: AxiMonitorInterface Signal: araddr_m16
wire [63:0] AxiMonitorInterface_araddr_m16;

// Interface: AxiMonitorInterface Signal: araddr_m17
wire [63:0] AxiMonitorInterface_araddr_m17;

// Interface: AxiMonitorInterface Signal: araddr_m18
wire [63:0] AxiMonitorInterface_araddr_m18;

// Interface: AxiMonitorInterface Signal: araddr_m19
wire [63:0] AxiMonitorInterface_araddr_m19;

// Interface: AxiMonitorInterface Signal: araddr_m20
wire [63:0] AxiMonitorInterface_araddr_m20;

// Interface: AxiMonitorInterface Signal: araddr_m21
wire [63:0] AxiMonitorInterface_araddr_m21;

// Interface: AxiMonitorInterface Signal: araddr_m22
wire [63:0] AxiMonitorInterface_araddr_m22;

// Interface: AxiMonitorInterface Signal: araddr_m23
wire [63:0] AxiMonitorInterface_araddr_m23;

// Interface: AxiMonitorInterface Signal: araddr_m24
wire [63:0] AxiMonitorInterface_araddr_m24;

// Interface: AxiMonitorInterface Signal: araddr_m25
wire [63:0] AxiMonitorInterface_araddr_m25;

// Interface: AxiMonitorInterface Signal: araddr_m26
wire [63:0] AxiMonitorInterface_araddr_m26;

// Interface: AxiMonitorInterface Signal: araddr_m27
wire [63:0] AxiMonitorInterface_araddr_m27;

// Interface: AxiMonitorInterface Signal: araddr_m28
wire [63:0] AxiMonitorInterface_araddr_m28;

// Interface: AxiMonitorInterface Signal: araddr_m29
wire [63:0] AxiMonitorInterface_araddr_m29;

// Interface: AxiMonitorInterface Signal: araddr_m30
wire [63:0] AxiMonitorInterface_araddr_m30;

// Interface: AxiMonitorInterface Signal: araddr_m31
wire [63:0] AxiMonitorInterface_araddr_m31;

// Interface: AxiMonitorInterface Signal: arlen_m0
wire [9:0] AxiMonitorInterface_arlen_m0;

// Interface: AxiMonitorInterface Signal: arlen_m1
wire [9:0] AxiMonitorInterface_arlen_m1;

// Interface: AxiMonitorInterface Signal: arlen_m2
wire [9:0] AxiMonitorInterface_arlen_m2;

// Interface: AxiMonitorInterface Signal: arlen_m3
wire [9:0] AxiMonitorInterface_arlen_m3;

// Interface: AxiMonitorInterface Signal: arlen_m4
wire [9:0] AxiMonitorInterface_arlen_m4;

// Interface: AxiMonitorInterface Signal: arlen_m5
wire [9:0] AxiMonitorInterface_arlen_m5;

// Interface: AxiMonitorInterface Signal: arlen_m6
wire [9:0] AxiMonitorInterface_arlen_m6;

// Interface: AxiMonitorInterface Signal: arlen_m7
wire [9:0] AxiMonitorInterface_arlen_m7;

// Interface: AxiMonitorInterface Signal: arlen_m8
wire [9:0] AxiMonitorInterface_arlen_m8;

// Interface: AxiMonitorInterface Signal: arlen_m9
wire [9:0] AxiMonitorInterface_arlen_m9;

// Interface: AxiMonitorInterface Signal: arlen_m10
wire [9:0] AxiMonitorInterface_arlen_m10;

// Interface: AxiMonitorInterface Signal: arlen_m11
wire [9:0] AxiMonitorInterface_arlen_m11;

// Interface: AxiMonitorInterface Signal: arlen_m12
wire [9:0] AxiMonitorInterface_arlen_m12;

// Interface: AxiMonitorInterface Signal: arlen_m13
wire [9:0] AxiMonitorInterface_arlen_m13;

// Interface: AxiMonitorInterface Signal: arlen_m14
wire [9:0] AxiMonitorInterface_arlen_m14;

// Interface: AxiMonitorInterface Signal: arlen_m15
wire [9:0] AxiMonitorInterface_arlen_m15;

// Interface: AxiMonitorInterface Signal: arlen_m16
wire [9:0] AxiMonitorInterface_arlen_m16;

// Interface: AxiMonitorInterface Signal: arlen_m17
wire [9:0] AxiMonitorInterface_arlen_m17;

// Interface: AxiMonitorInterface Signal: arlen_m18
wire [9:0] AxiMonitorInterface_arlen_m18;

// Interface: AxiMonitorInterface Signal: arlen_m19
wire [9:0] AxiMonitorInterface_arlen_m19;

// Interface: AxiMonitorInterface Signal: arlen_m20
wire [9:0] AxiMonitorInterface_arlen_m20;

// Interface: AxiMonitorInterface Signal: arlen_m21
wire [9:0] AxiMonitorInterface_arlen_m21;

// Interface: AxiMonitorInterface Signal: arlen_m22
wire [9:0] AxiMonitorInterface_arlen_m22;

// Interface: AxiMonitorInterface Signal: arlen_m23
wire [9:0] AxiMonitorInterface_arlen_m23;

// Interface: AxiMonitorInterface Signal: arlen_m24
wire [9:0] AxiMonitorInterface_arlen_m24;

// Interface: AxiMonitorInterface Signal: arlen_m25
wire [9:0] AxiMonitorInterface_arlen_m25;

// Interface: AxiMonitorInterface Signal: arlen_m26
wire [9:0] AxiMonitorInterface_arlen_m26;

// Interface: AxiMonitorInterface Signal: arlen_m27
wire [9:0] AxiMonitorInterface_arlen_m27;

// Interface: AxiMonitorInterface Signal: arlen_m28
wire [9:0] AxiMonitorInterface_arlen_m28;

// Interface: AxiMonitorInterface Signal: arlen_m29
wire [9:0] AxiMonitorInterface_arlen_m29;

// Interface: AxiMonitorInterface Signal: arlen_m30
wire [9:0] AxiMonitorInterface_arlen_m30;

// Interface: AxiMonitorInterface Signal: arlen_m31
wire [9:0] AxiMonitorInterface_arlen_m31;

// Interface: AxiMonitorInterface Signal: arsize_m0
wire [2:0] AxiMonitorInterface_arsize_m0;

// Interface: AxiMonitorInterface Signal: arsize_m1
wire [2:0] AxiMonitorInterface_arsize_m1;

// Interface: AxiMonitorInterface Signal: arsize_m2
wire [2:0] AxiMonitorInterface_arsize_m2;

// Interface: AxiMonitorInterface Signal: arsize_m3
wire [2:0] AxiMonitorInterface_arsize_m3;

// Interface: AxiMonitorInterface Signal: arsize_m4
wire [2:0] AxiMonitorInterface_arsize_m4;

// Interface: AxiMonitorInterface Signal: arsize_m5
wire [2:0] AxiMonitorInterface_arsize_m5;

// Interface: AxiMonitorInterface Signal: arsize_m6
wire [2:0] AxiMonitorInterface_arsize_m6;

// Interface: AxiMonitorInterface Signal: arsize_m7
wire [2:0] AxiMonitorInterface_arsize_m7;

// Interface: AxiMonitorInterface Signal: arsize_m8
wire [2:0] AxiMonitorInterface_arsize_m8;

// Interface: AxiMonitorInterface Signal: arsize_m9
wire [2:0] AxiMonitorInterface_arsize_m9;

// Interface: AxiMonitorInterface Signal: arsize_m10
wire [2:0] AxiMonitorInterface_arsize_m10;

// Interface: AxiMonitorInterface Signal: arsize_m11
wire [2:0] AxiMonitorInterface_arsize_m11;

// Interface: AxiMonitorInterface Signal: arsize_m12
wire [2:0] AxiMonitorInterface_arsize_m12;

// Interface: AxiMonitorInterface Signal: arsize_m13
wire [2:0] AxiMonitorInterface_arsize_m13;

// Interface: AxiMonitorInterface Signal: arsize_m14
wire [2:0] AxiMonitorInterface_arsize_m14;

// Interface: AxiMonitorInterface Signal: arsize_m15
wire [2:0] AxiMonitorInterface_arsize_m15;

// Interface: AxiMonitorInterface Signal: arsize_m16
wire [2:0] AxiMonitorInterface_arsize_m16;

// Interface: AxiMonitorInterface Signal: arsize_m17
wire [2:0] AxiMonitorInterface_arsize_m17;

// Interface: AxiMonitorInterface Signal: arsize_m18
wire [2:0] AxiMonitorInterface_arsize_m18;

// Interface: AxiMonitorInterface Signal: arsize_m19
wire [2:0] AxiMonitorInterface_arsize_m19;

// Interface: AxiMonitorInterface Signal: arsize_m20
wire [2:0] AxiMonitorInterface_arsize_m20;

// Interface: AxiMonitorInterface Signal: arsize_m21
wire [2:0] AxiMonitorInterface_arsize_m21;

// Interface: AxiMonitorInterface Signal: arsize_m22
wire [2:0] AxiMonitorInterface_arsize_m22;

// Interface: AxiMonitorInterface Signal: arsize_m23
wire [2:0] AxiMonitorInterface_arsize_m23;

// Interface: AxiMonitorInterface Signal: arsize_m24
wire [2:0] AxiMonitorInterface_arsize_m24;

// Interface: AxiMonitorInterface Signal: arsize_m25
wire [2:0] AxiMonitorInterface_arsize_m25;

// Interface: AxiMonitorInterface Signal: arsize_m26
wire [2:0] AxiMonitorInterface_arsize_m26;

// Interface: AxiMonitorInterface Signal: arsize_m27
wire [2:0] AxiMonitorInterface_arsize_m27;

// Interface: AxiMonitorInterface Signal: arsize_m28
wire [2:0] AxiMonitorInterface_arsize_m28;

// Interface: AxiMonitorInterface Signal: arsize_m29
wire [2:0] AxiMonitorInterface_arsize_m29;

// Interface: AxiMonitorInterface Signal: arsize_m30
wire [2:0] AxiMonitorInterface_arsize_m30;

// Interface: AxiMonitorInterface Signal: arsize_m31
wire [2:0] AxiMonitorInterface_arsize_m31;

// Interface: AxiMonitorInterface Signal: arburst_m0
wire [1:0] AxiMonitorInterface_arburst_m0;

// Interface: AxiMonitorInterface Signal: arburst_m1
wire [1:0] AxiMonitorInterface_arburst_m1;

// Interface: AxiMonitorInterface Signal: arburst_m2
wire [1:0] AxiMonitorInterface_arburst_m2;

// Interface: AxiMonitorInterface Signal: arburst_m3
wire [1:0] AxiMonitorInterface_arburst_m3;

// Interface: AxiMonitorInterface Signal: arburst_m4
wire [1:0] AxiMonitorInterface_arburst_m4;

// Interface: AxiMonitorInterface Signal: arburst_m5
wire [1:0] AxiMonitorInterface_arburst_m5;

// Interface: AxiMonitorInterface Signal: arburst_m6
wire [1:0] AxiMonitorInterface_arburst_m6;

// Interface: AxiMonitorInterface Signal: arburst_m7
wire [1:0] AxiMonitorInterface_arburst_m7;

// Interface: AxiMonitorInterface Signal: arburst_m8
wire [1:0] AxiMonitorInterface_arburst_m8;

// Interface: AxiMonitorInterface Signal: arburst_m9
wire [1:0] AxiMonitorInterface_arburst_m9;

// Interface: AxiMonitorInterface Signal: arburst_m10
wire [1:0] AxiMonitorInterface_arburst_m10;

// Interface: AxiMonitorInterface Signal: arburst_m11
wire [1:0] AxiMonitorInterface_arburst_m11;

// Interface: AxiMonitorInterface Signal: arburst_m12
wire [1:0] AxiMonitorInterface_arburst_m12;

// Interface: AxiMonitorInterface Signal: arburst_m13
wire [1:0] AxiMonitorInterface_arburst_m13;

// Interface: AxiMonitorInterface Signal: arburst_m14
wire [1:0] AxiMonitorInterface_arburst_m14;

// Interface: AxiMonitorInterface Signal: arburst_m15
wire [1:0] AxiMonitorInterface_arburst_m15;

// Interface: AxiMonitorInterface Signal: arburst_m16
wire [1:0] AxiMonitorInterface_arburst_m16;

// Interface: AxiMonitorInterface Signal: arburst_m17
wire [1:0] AxiMonitorInterface_arburst_m17;

// Interface: AxiMonitorInterface Signal: arburst_m18
wire [1:0] AxiMonitorInterface_arburst_m18;

// Interface: AxiMonitorInterface Signal: arburst_m19
wire [1:0] AxiMonitorInterface_arburst_m19;

// Interface: AxiMonitorInterface Signal: arburst_m20
wire [1:0] AxiMonitorInterface_arburst_m20;

// Interface: AxiMonitorInterface Signal: arburst_m21
wire [1:0] AxiMonitorInterface_arburst_m21;

// Interface: AxiMonitorInterface Signal: arburst_m22
wire [1:0] AxiMonitorInterface_arburst_m22;

// Interface: AxiMonitorInterface Signal: arburst_m23
wire [1:0] AxiMonitorInterface_arburst_m23;

// Interface: AxiMonitorInterface Signal: arburst_m24
wire [1:0] AxiMonitorInterface_arburst_m24;

// Interface: AxiMonitorInterface Signal: arburst_m25
wire [1:0] AxiMonitorInterface_arburst_m25;

// Interface: AxiMonitorInterface Signal: arburst_m26
wire [1:0] AxiMonitorInterface_arburst_m26;

// Interface: AxiMonitorInterface Signal: arburst_m27
wire [1:0] AxiMonitorInterface_arburst_m27;

// Interface: AxiMonitorInterface Signal: arburst_m28
wire [1:0] AxiMonitorInterface_arburst_m28;

// Interface: AxiMonitorInterface Signal: arburst_m29
wire [1:0] AxiMonitorInterface_arburst_m29;

// Interface: AxiMonitorInterface Signal: arburst_m30
wire [1:0] AxiMonitorInterface_arburst_m30;

// Interface: AxiMonitorInterface Signal: arburst_m31
wire [1:0] AxiMonitorInterface_arburst_m31;

// Interface: AxiMonitorInterface Signal: arlock_m0
wire [1:0] AxiMonitorInterface_arlock_m0;

// Interface: AxiMonitorInterface Signal: arlock_m1
wire [1:0] AxiMonitorInterface_arlock_m1;

// Interface: AxiMonitorInterface Signal: arlock_m2
wire [1:0] AxiMonitorInterface_arlock_m2;

// Interface: AxiMonitorInterface Signal: arlock_m3
wire [1:0] AxiMonitorInterface_arlock_m3;

// Interface: AxiMonitorInterface Signal: arlock_m4
wire [1:0] AxiMonitorInterface_arlock_m4;

// Interface: AxiMonitorInterface Signal: arlock_m5
wire [1:0] AxiMonitorInterface_arlock_m5;

// Interface: AxiMonitorInterface Signal: arlock_m6
wire [1:0] AxiMonitorInterface_arlock_m6;

// Interface: AxiMonitorInterface Signal: arlock_m7
wire [1:0] AxiMonitorInterface_arlock_m7;

// Interface: AxiMonitorInterface Signal: arlock_m8
wire [1:0] AxiMonitorInterface_arlock_m8;

// Interface: AxiMonitorInterface Signal: arlock_m9
wire [1:0] AxiMonitorInterface_arlock_m9;

// Interface: AxiMonitorInterface Signal: arlock_m10
wire [1:0] AxiMonitorInterface_arlock_m10;

// Interface: AxiMonitorInterface Signal: arlock_m11
wire [1:0] AxiMonitorInterface_arlock_m11;

// Interface: AxiMonitorInterface Signal: arlock_m12
wire [1:0] AxiMonitorInterface_arlock_m12;

// Interface: AxiMonitorInterface Signal: arlock_m13
wire [1:0] AxiMonitorInterface_arlock_m13;

// Interface: AxiMonitorInterface Signal: arlock_m14
wire [1:0] AxiMonitorInterface_arlock_m14;

// Interface: AxiMonitorInterface Signal: arlock_m15
wire [1:0] AxiMonitorInterface_arlock_m15;

// Interface: AxiMonitorInterface Signal: arlock_m16
wire [1:0] AxiMonitorInterface_arlock_m16;

// Interface: AxiMonitorInterface Signal: arlock_m17
wire [1:0] AxiMonitorInterface_arlock_m17;

// Interface: AxiMonitorInterface Signal: arlock_m18
wire [1:0] AxiMonitorInterface_arlock_m18;

// Interface: AxiMonitorInterface Signal: arlock_m19
wire [1:0] AxiMonitorInterface_arlock_m19;

// Interface: AxiMonitorInterface Signal: arlock_m20
wire [1:0] AxiMonitorInterface_arlock_m20;

// Interface: AxiMonitorInterface Signal: arlock_m21
wire [1:0] AxiMonitorInterface_arlock_m21;

// Interface: AxiMonitorInterface Signal: arlock_m22
wire [1:0] AxiMonitorInterface_arlock_m22;

// Interface: AxiMonitorInterface Signal: arlock_m23
wire [1:0] AxiMonitorInterface_arlock_m23;

// Interface: AxiMonitorInterface Signal: arlock_m24
wire [1:0] AxiMonitorInterface_arlock_m24;

// Interface: AxiMonitorInterface Signal: arlock_m25
wire [1:0] AxiMonitorInterface_arlock_m25;

// Interface: AxiMonitorInterface Signal: arlock_m26
wire [1:0] AxiMonitorInterface_arlock_m26;

// Interface: AxiMonitorInterface Signal: arlock_m27
wire [1:0] AxiMonitorInterface_arlock_m27;

// Interface: AxiMonitorInterface Signal: arlock_m28
wire [1:0] AxiMonitorInterface_arlock_m28;

// Interface: AxiMonitorInterface Signal: arlock_m29
wire [1:0] AxiMonitorInterface_arlock_m29;

// Interface: AxiMonitorInterface Signal: arlock_m30
wire [1:0] AxiMonitorInterface_arlock_m30;

// Interface: AxiMonitorInterface Signal: arlock_m31
wire [1:0] AxiMonitorInterface_arlock_m31;

// Interface: AxiMonitorInterface Signal: arcache_m0
wire [3:0] AxiMonitorInterface_arcache_m0;

// Interface: AxiMonitorInterface Signal: arcache_m1
wire [3:0] AxiMonitorInterface_arcache_m1;

// Interface: AxiMonitorInterface Signal: arcache_m2
wire [3:0] AxiMonitorInterface_arcache_m2;

// Interface: AxiMonitorInterface Signal: arcache_m3
wire [3:0] AxiMonitorInterface_arcache_m3;

// Interface: AxiMonitorInterface Signal: arcache_m4
wire [3:0] AxiMonitorInterface_arcache_m4;

// Interface: AxiMonitorInterface Signal: arcache_m5
wire [3:0] AxiMonitorInterface_arcache_m5;

// Interface: AxiMonitorInterface Signal: arcache_m6
wire [3:0] AxiMonitorInterface_arcache_m6;

// Interface: AxiMonitorInterface Signal: arcache_m7
wire [3:0] AxiMonitorInterface_arcache_m7;

// Interface: AxiMonitorInterface Signal: arcache_m8
wire [3:0] AxiMonitorInterface_arcache_m8;

// Interface: AxiMonitorInterface Signal: arcache_m9
wire [3:0] AxiMonitorInterface_arcache_m9;

// Interface: AxiMonitorInterface Signal: arcache_m10
wire [3:0] AxiMonitorInterface_arcache_m10;

// Interface: AxiMonitorInterface Signal: arcache_m11
wire [3:0] AxiMonitorInterface_arcache_m11;

// Interface: AxiMonitorInterface Signal: arcache_m12
wire [3:0] AxiMonitorInterface_arcache_m12;

// Interface: AxiMonitorInterface Signal: arcache_m13
wire [3:0] AxiMonitorInterface_arcache_m13;

// Interface: AxiMonitorInterface Signal: arcache_m14
wire [3:0] AxiMonitorInterface_arcache_m14;

// Interface: AxiMonitorInterface Signal: arcache_m15
wire [3:0] AxiMonitorInterface_arcache_m15;

// Interface: AxiMonitorInterface Signal: arcache_m16
wire [3:0] AxiMonitorInterface_arcache_m16;

// Interface: AxiMonitorInterface Signal: arcache_m17
wire [3:0] AxiMonitorInterface_arcache_m17;

// Interface: AxiMonitorInterface Signal: arcache_m18
wire [3:0] AxiMonitorInterface_arcache_m18;

// Interface: AxiMonitorInterface Signal: arcache_m19
wire [3:0] AxiMonitorInterface_arcache_m19;

// Interface: AxiMonitorInterface Signal: arcache_m20
wire [3:0] AxiMonitorInterface_arcache_m20;

// Interface: AxiMonitorInterface Signal: arcache_m21
wire [3:0] AxiMonitorInterface_arcache_m21;

// Interface: AxiMonitorInterface Signal: arcache_m22
wire [3:0] AxiMonitorInterface_arcache_m22;

// Interface: AxiMonitorInterface Signal: arcache_m23
wire [3:0] AxiMonitorInterface_arcache_m23;

// Interface: AxiMonitorInterface Signal: arcache_m24
wire [3:0] AxiMonitorInterface_arcache_m24;

// Interface: AxiMonitorInterface Signal: arcache_m25
wire [3:0] AxiMonitorInterface_arcache_m25;

// Interface: AxiMonitorInterface Signal: arcache_m26
wire [3:0] AxiMonitorInterface_arcache_m26;

// Interface: AxiMonitorInterface Signal: arcache_m27
wire [3:0] AxiMonitorInterface_arcache_m27;

// Interface: AxiMonitorInterface Signal: arcache_m28
wire [3:0] AxiMonitorInterface_arcache_m28;

// Interface: AxiMonitorInterface Signal: arcache_m29
wire [3:0] AxiMonitorInterface_arcache_m29;

// Interface: AxiMonitorInterface Signal: arcache_m30
wire [3:0] AxiMonitorInterface_arcache_m30;

// Interface: AxiMonitorInterface Signal: arcache_m31
wire [3:0] AxiMonitorInterface_arcache_m31;

// Interface: AxiMonitorInterface Signal: arprot_m0
wire [2:0] AxiMonitorInterface_arprot_m0;

// Interface: AxiMonitorInterface Signal: arprot_m1
wire [2:0] AxiMonitorInterface_arprot_m1;

// Interface: AxiMonitorInterface Signal: arprot_m2
wire [2:0] AxiMonitorInterface_arprot_m2;

// Interface: AxiMonitorInterface Signal: arprot_m3
wire [2:0] AxiMonitorInterface_arprot_m3;

// Interface: AxiMonitorInterface Signal: arprot_m4
wire [2:0] AxiMonitorInterface_arprot_m4;

// Interface: AxiMonitorInterface Signal: arprot_m5
wire [2:0] AxiMonitorInterface_arprot_m5;

// Interface: AxiMonitorInterface Signal: arprot_m6
wire [2:0] AxiMonitorInterface_arprot_m6;

// Interface: AxiMonitorInterface Signal: arprot_m7
wire [2:0] AxiMonitorInterface_arprot_m7;

// Interface: AxiMonitorInterface Signal: arprot_m8
wire [2:0] AxiMonitorInterface_arprot_m8;

// Interface: AxiMonitorInterface Signal: arprot_m9
wire [2:0] AxiMonitorInterface_arprot_m9;

// Interface: AxiMonitorInterface Signal: arprot_m10
wire [2:0] AxiMonitorInterface_arprot_m10;

// Interface: AxiMonitorInterface Signal: arprot_m11
wire [2:0] AxiMonitorInterface_arprot_m11;

// Interface: AxiMonitorInterface Signal: arprot_m12
wire [2:0] AxiMonitorInterface_arprot_m12;

// Interface: AxiMonitorInterface Signal: arprot_m13
wire [2:0] AxiMonitorInterface_arprot_m13;

// Interface: AxiMonitorInterface Signal: arprot_m14
wire [2:0] AxiMonitorInterface_arprot_m14;

// Interface: AxiMonitorInterface Signal: arprot_m15
wire [2:0] AxiMonitorInterface_arprot_m15;

// Interface: AxiMonitorInterface Signal: arprot_m16
wire [2:0] AxiMonitorInterface_arprot_m16;

// Interface: AxiMonitorInterface Signal: arprot_m17
wire [2:0] AxiMonitorInterface_arprot_m17;

// Interface: AxiMonitorInterface Signal: arprot_m18
wire [2:0] AxiMonitorInterface_arprot_m18;

// Interface: AxiMonitorInterface Signal: arprot_m19
wire [2:0] AxiMonitorInterface_arprot_m19;

// Interface: AxiMonitorInterface Signal: arprot_m20
wire [2:0] AxiMonitorInterface_arprot_m20;

// Interface: AxiMonitorInterface Signal: arprot_m21
wire [2:0] AxiMonitorInterface_arprot_m21;

// Interface: AxiMonitorInterface Signal: arprot_m22
wire [2:0] AxiMonitorInterface_arprot_m22;

// Interface: AxiMonitorInterface Signal: arprot_m23
wire [2:0] AxiMonitorInterface_arprot_m23;

// Interface: AxiMonitorInterface Signal: arprot_m24
wire [2:0] AxiMonitorInterface_arprot_m24;

// Interface: AxiMonitorInterface Signal: arprot_m25
wire [2:0] AxiMonitorInterface_arprot_m25;

// Interface: AxiMonitorInterface Signal: arprot_m26
wire [2:0] AxiMonitorInterface_arprot_m26;

// Interface: AxiMonitorInterface Signal: arprot_m27
wire [2:0] AxiMonitorInterface_arprot_m27;

// Interface: AxiMonitorInterface Signal: arprot_m28
wire [2:0] AxiMonitorInterface_arprot_m28;

// Interface: AxiMonitorInterface Signal: arprot_m29
wire [2:0] AxiMonitorInterface_arprot_m29;

// Interface: AxiMonitorInterface Signal: arprot_m30
wire [2:0] AxiMonitorInterface_arprot_m30;

// Interface: AxiMonitorInterface Signal: arprot_m31
wire [2:0] AxiMonitorInterface_arprot_m31;

// Interface: AxiMonitorInterface Signal: arid_m0
wire [31:0] AxiMonitorInterface_arid_m0;

// Interface: AxiMonitorInterface Signal: arid_m1
wire [31:0] AxiMonitorInterface_arid_m1;

// Interface: AxiMonitorInterface Signal: arid_m2
wire [31:0] AxiMonitorInterface_arid_m2;

// Interface: AxiMonitorInterface Signal: arid_m3
wire [31:0] AxiMonitorInterface_arid_m3;

// Interface: AxiMonitorInterface Signal: arid_m4
wire [31:0] AxiMonitorInterface_arid_m4;

// Interface: AxiMonitorInterface Signal: arid_m5
wire [31:0] AxiMonitorInterface_arid_m5;

// Interface: AxiMonitorInterface Signal: arid_m6
wire [31:0] AxiMonitorInterface_arid_m6;

// Interface: AxiMonitorInterface Signal: arid_m7
wire [31:0] AxiMonitorInterface_arid_m7;

// Interface: AxiMonitorInterface Signal: arid_m8
wire [31:0] AxiMonitorInterface_arid_m8;

// Interface: AxiMonitorInterface Signal: arid_m9
wire [31:0] AxiMonitorInterface_arid_m9;

// Interface: AxiMonitorInterface Signal: arid_m10
wire [31:0] AxiMonitorInterface_arid_m10;

// Interface: AxiMonitorInterface Signal: arid_m11
wire [31:0] AxiMonitorInterface_arid_m11;

// Interface: AxiMonitorInterface Signal: arid_m12
wire [31:0] AxiMonitorInterface_arid_m12;

// Interface: AxiMonitorInterface Signal: arid_m13
wire [31:0] AxiMonitorInterface_arid_m13;

// Interface: AxiMonitorInterface Signal: arid_m14
wire [31:0] AxiMonitorInterface_arid_m14;

// Interface: AxiMonitorInterface Signal: arid_m15
wire [31:0] AxiMonitorInterface_arid_m15;

// Interface: AxiMonitorInterface Signal: arid_m16
wire [31:0] AxiMonitorInterface_arid_m16;

// Interface: AxiMonitorInterface Signal: arid_m17
wire [31:0] AxiMonitorInterface_arid_m17;

// Interface: AxiMonitorInterface Signal: arid_m18
wire [31:0] AxiMonitorInterface_arid_m18;

// Interface: AxiMonitorInterface Signal: arid_m19
wire [31:0] AxiMonitorInterface_arid_m19;

// Interface: AxiMonitorInterface Signal: arid_m20
wire [31:0] AxiMonitorInterface_arid_m20;

// Interface: AxiMonitorInterface Signal: arid_m21
wire [31:0] AxiMonitorInterface_arid_m21;

// Interface: AxiMonitorInterface Signal: arid_m22
wire [31:0] AxiMonitorInterface_arid_m22;

// Interface: AxiMonitorInterface Signal: arid_m23
wire [31:0] AxiMonitorInterface_arid_m23;

// Interface: AxiMonitorInterface Signal: arid_m24
wire [31:0] AxiMonitorInterface_arid_m24;

// Interface: AxiMonitorInterface Signal: arid_m25
wire [31:0] AxiMonitorInterface_arid_m25;

// Interface: AxiMonitorInterface Signal: arid_m26
wire [31:0] AxiMonitorInterface_arid_m26;

// Interface: AxiMonitorInterface Signal: arid_m27
wire [31:0] AxiMonitorInterface_arid_m27;

// Interface: AxiMonitorInterface Signal: arid_m28
wire [31:0] AxiMonitorInterface_arid_m28;

// Interface: AxiMonitorInterface Signal: arid_m29
wire [31:0] AxiMonitorInterface_arid_m29;

// Interface: AxiMonitorInterface Signal: arid_m30
wire [31:0] AxiMonitorInterface_arid_m30;

// Interface: AxiMonitorInterface Signal: arid_m31
wire [31:0] AxiMonitorInterface_arid_m31;

// Interface: AxiMonitorInterface Signal: arready_m0
wire AxiMonitorInterface_arready_m0;

// Interface: AxiMonitorInterface Signal: arready_m1
wire AxiMonitorInterface_arready_m1;

// Interface: AxiMonitorInterface Signal: arready_m2
wire AxiMonitorInterface_arready_m2;

// Interface: AxiMonitorInterface Signal: arready_m3
wire AxiMonitorInterface_arready_m3;

// Interface: AxiMonitorInterface Signal: arready_m4
wire AxiMonitorInterface_arready_m4;

// Interface: AxiMonitorInterface Signal: arready_m5
wire AxiMonitorInterface_arready_m5;

// Interface: AxiMonitorInterface Signal: arready_m6
wire AxiMonitorInterface_arready_m6;

// Interface: AxiMonitorInterface Signal: arready_m7
wire AxiMonitorInterface_arready_m7;

// Interface: AxiMonitorInterface Signal: arready_m8
wire AxiMonitorInterface_arready_m8;

// Interface: AxiMonitorInterface Signal: arready_m9
wire AxiMonitorInterface_arready_m9;

// Interface: AxiMonitorInterface Signal: arready_m10
wire AxiMonitorInterface_arready_m10;

// Interface: AxiMonitorInterface Signal: arready_m11
wire AxiMonitorInterface_arready_m11;

// Interface: AxiMonitorInterface Signal: arready_m12
wire AxiMonitorInterface_arready_m12;

// Interface: AxiMonitorInterface Signal: arready_m13
wire AxiMonitorInterface_arready_m13;

// Interface: AxiMonitorInterface Signal: arready_m14
wire AxiMonitorInterface_arready_m14;

// Interface: AxiMonitorInterface Signal: arready_m15
wire AxiMonitorInterface_arready_m15;

// Interface: AxiMonitorInterface Signal: arready_m16
wire AxiMonitorInterface_arready_m16;

// Interface: AxiMonitorInterface Signal: arready_m17
wire AxiMonitorInterface_arready_m17;

// Interface: AxiMonitorInterface Signal: arready_m18
wire AxiMonitorInterface_arready_m18;

// Interface: AxiMonitorInterface Signal: arready_m19
wire AxiMonitorInterface_arready_m19;

// Interface: AxiMonitorInterface Signal: arready_m20
wire AxiMonitorInterface_arready_m20;

// Interface: AxiMonitorInterface Signal: arready_m21
wire AxiMonitorInterface_arready_m21;

// Interface: AxiMonitorInterface Signal: arready_m22
wire AxiMonitorInterface_arready_m22;

// Interface: AxiMonitorInterface Signal: arready_m23
wire AxiMonitorInterface_arready_m23;

// Interface: AxiMonitorInterface Signal: arready_m24
wire AxiMonitorInterface_arready_m24;

// Interface: AxiMonitorInterface Signal: arready_m25
wire AxiMonitorInterface_arready_m25;

// Interface: AxiMonitorInterface Signal: arready_m26
wire AxiMonitorInterface_arready_m26;

// Interface: AxiMonitorInterface Signal: arready_m27
wire AxiMonitorInterface_arready_m27;

// Interface: AxiMonitorInterface Signal: arready_m28
wire AxiMonitorInterface_arready_m28;

// Interface: AxiMonitorInterface Signal: arready_m29
wire AxiMonitorInterface_arready_m29;

// Interface: AxiMonitorInterface Signal: arready_m30
wire AxiMonitorInterface_arready_m30;

// Interface: AxiMonitorInterface Signal: arready_m31
wire AxiMonitorInterface_arready_m31;

// Interface: AxiMonitorInterface Signal: arsideband_m0
wire [63:0] AxiMonitorInterface_arsideband_m0;

// Interface: AxiMonitorInterface Signal: arsideband_m1
wire [63:0] AxiMonitorInterface_arsideband_m1;

// Interface: AxiMonitorInterface Signal: arsideband_m2
wire [63:0] AxiMonitorInterface_arsideband_m2;

// Interface: AxiMonitorInterface Signal: arsideband_m3
wire [63:0] AxiMonitorInterface_arsideband_m3;

// Interface: AxiMonitorInterface Signal: arsideband_m4
wire [63:0] AxiMonitorInterface_arsideband_m4;

// Interface: AxiMonitorInterface Signal: arsideband_m5
wire [63:0] AxiMonitorInterface_arsideband_m5;

// Interface: AxiMonitorInterface Signal: arsideband_m6
wire [63:0] AxiMonitorInterface_arsideband_m6;

// Interface: AxiMonitorInterface Signal: arsideband_m7
wire [63:0] AxiMonitorInterface_arsideband_m7;

// Interface: AxiMonitorInterface Signal: arsideband_m8
wire [63:0] AxiMonitorInterface_arsideband_m8;

// Interface: AxiMonitorInterface Signal: arsideband_m9
wire [63:0] AxiMonitorInterface_arsideband_m9;

// Interface: AxiMonitorInterface Signal: arsideband_m10
wire [63:0] AxiMonitorInterface_arsideband_m10;

// Interface: AxiMonitorInterface Signal: arsideband_m11
wire [63:0] AxiMonitorInterface_arsideband_m11;

// Interface: AxiMonitorInterface Signal: arsideband_m12
wire [63:0] AxiMonitorInterface_arsideband_m12;

// Interface: AxiMonitorInterface Signal: arsideband_m13
wire [63:0] AxiMonitorInterface_arsideband_m13;

// Interface: AxiMonitorInterface Signal: arsideband_m14
wire [63:0] AxiMonitorInterface_arsideband_m14;

// Interface: AxiMonitorInterface Signal: arsideband_m15
wire [63:0] AxiMonitorInterface_arsideband_m15;

// Interface: AxiMonitorInterface Signal: arsideband_m16
wire [63:0] AxiMonitorInterface_arsideband_m16;

// Interface: AxiMonitorInterface Signal: arsideband_m17
wire [63:0] AxiMonitorInterface_arsideband_m17;

// Interface: AxiMonitorInterface Signal: arsideband_m18
wire [63:0] AxiMonitorInterface_arsideband_m18;

// Interface: AxiMonitorInterface Signal: arsideband_m19
wire [63:0] AxiMonitorInterface_arsideband_m19;

// Interface: AxiMonitorInterface Signal: arsideband_m20
wire [63:0] AxiMonitorInterface_arsideband_m20;

// Interface: AxiMonitorInterface Signal: arsideband_m21
wire [63:0] AxiMonitorInterface_arsideband_m21;

// Interface: AxiMonitorInterface Signal: arsideband_m22
wire [63:0] AxiMonitorInterface_arsideband_m22;

// Interface: AxiMonitorInterface Signal: arsideband_m23
wire [63:0] AxiMonitorInterface_arsideband_m23;

// Interface: AxiMonitorInterface Signal: arsideband_m24
wire [63:0] AxiMonitorInterface_arsideband_m24;

// Interface: AxiMonitorInterface Signal: arsideband_m25
wire [63:0] AxiMonitorInterface_arsideband_m25;

// Interface: AxiMonitorInterface Signal: arsideband_m26
wire [63:0] AxiMonitorInterface_arsideband_m26;

// Interface: AxiMonitorInterface Signal: arsideband_m27
wire [63:0] AxiMonitorInterface_arsideband_m27;

// Interface: AxiMonitorInterface Signal: arsideband_m28
wire [63:0] AxiMonitorInterface_arsideband_m28;

// Interface: AxiMonitorInterface Signal: arsideband_m29
wire [63:0] AxiMonitorInterface_arsideband_m29;

// Interface: AxiMonitorInterface Signal: arsideband_m30
wire [63:0] AxiMonitorInterface_arsideband_m30;

// Interface: AxiMonitorInterface Signal: arsideband_m31
wire [63:0] AxiMonitorInterface_arsideband_m31;

// Interface: AxiMonitorInterface Signal: awvalid_m0
wire AxiMonitorInterface_awvalid_m0;

// Interface: AxiMonitorInterface Signal: awvalid_m1
wire AxiMonitorInterface_awvalid_m1;

// Interface: AxiMonitorInterface Signal: awvalid_m2
wire AxiMonitorInterface_awvalid_m2;

// Interface: AxiMonitorInterface Signal: awvalid_m3
wire AxiMonitorInterface_awvalid_m3;

// Interface: AxiMonitorInterface Signal: awvalid_m4
wire AxiMonitorInterface_awvalid_m4;

// Interface: AxiMonitorInterface Signal: awvalid_m5
wire AxiMonitorInterface_awvalid_m5;

// Interface: AxiMonitorInterface Signal: awvalid_m6
wire AxiMonitorInterface_awvalid_m6;

// Interface: AxiMonitorInterface Signal: awvalid_m7
wire AxiMonitorInterface_awvalid_m7;

// Interface: AxiMonitorInterface Signal: awvalid_m8
wire AxiMonitorInterface_awvalid_m8;

// Interface: AxiMonitorInterface Signal: awvalid_m9
wire AxiMonitorInterface_awvalid_m9;

// Interface: AxiMonitorInterface Signal: awvalid_m10
wire AxiMonitorInterface_awvalid_m10;

// Interface: AxiMonitorInterface Signal: awvalid_m11
wire AxiMonitorInterface_awvalid_m11;

// Interface: AxiMonitorInterface Signal: awvalid_m12
wire AxiMonitorInterface_awvalid_m12;

// Interface: AxiMonitorInterface Signal: awvalid_m13
wire AxiMonitorInterface_awvalid_m13;

// Interface: AxiMonitorInterface Signal: awvalid_m14
wire AxiMonitorInterface_awvalid_m14;

// Interface: AxiMonitorInterface Signal: awvalid_m15
wire AxiMonitorInterface_awvalid_m15;

// Interface: AxiMonitorInterface Signal: awvalid_m16
wire AxiMonitorInterface_awvalid_m16;

// Interface: AxiMonitorInterface Signal: awvalid_m17
wire AxiMonitorInterface_awvalid_m17;

// Interface: AxiMonitorInterface Signal: awvalid_m18
wire AxiMonitorInterface_awvalid_m18;

// Interface: AxiMonitorInterface Signal: awvalid_m19
wire AxiMonitorInterface_awvalid_m19;

// Interface: AxiMonitorInterface Signal: awvalid_m20
wire AxiMonitorInterface_awvalid_m20;

// Interface: AxiMonitorInterface Signal: awvalid_m21
wire AxiMonitorInterface_awvalid_m21;

// Interface: AxiMonitorInterface Signal: awvalid_m22
wire AxiMonitorInterface_awvalid_m22;

// Interface: AxiMonitorInterface Signal: awvalid_m23
wire AxiMonitorInterface_awvalid_m23;

// Interface: AxiMonitorInterface Signal: awvalid_m24
wire AxiMonitorInterface_awvalid_m24;

// Interface: AxiMonitorInterface Signal: awvalid_m25
wire AxiMonitorInterface_awvalid_m25;

// Interface: AxiMonitorInterface Signal: awvalid_m26
wire AxiMonitorInterface_awvalid_m26;

// Interface: AxiMonitorInterface Signal: awvalid_m27
wire AxiMonitorInterface_awvalid_m27;

// Interface: AxiMonitorInterface Signal: awvalid_m28
wire AxiMonitorInterface_awvalid_m28;

// Interface: AxiMonitorInterface Signal: awvalid_m29
wire AxiMonitorInterface_awvalid_m29;

// Interface: AxiMonitorInterface Signal: awvalid_m30
wire AxiMonitorInterface_awvalid_m30;

// Interface: AxiMonitorInterface Signal: awvalid_m31
wire AxiMonitorInterface_awvalid_m31;

// Interface: AxiMonitorInterface Signal: awaddr_m0
wire [63:0] AxiMonitorInterface_awaddr_m0;

// Interface: AxiMonitorInterface Signal: awaddr_m1
wire [63:0] AxiMonitorInterface_awaddr_m1;

// Interface: AxiMonitorInterface Signal: awaddr_m2
wire [63:0] AxiMonitorInterface_awaddr_m2;

// Interface: AxiMonitorInterface Signal: awaddr_m3
wire [63:0] AxiMonitorInterface_awaddr_m3;

// Interface: AxiMonitorInterface Signal: awaddr_m4
wire [63:0] AxiMonitorInterface_awaddr_m4;

// Interface: AxiMonitorInterface Signal: awaddr_m5
wire [63:0] AxiMonitorInterface_awaddr_m5;

// Interface: AxiMonitorInterface Signal: awaddr_m6
wire [63:0] AxiMonitorInterface_awaddr_m6;

// Interface: AxiMonitorInterface Signal: awaddr_m7
wire [63:0] AxiMonitorInterface_awaddr_m7;

// Interface: AxiMonitorInterface Signal: awaddr_m8
wire [63:0] AxiMonitorInterface_awaddr_m8;

// Interface: AxiMonitorInterface Signal: awaddr_m9
wire [63:0] AxiMonitorInterface_awaddr_m9;

// Interface: AxiMonitorInterface Signal: awaddr_m10
wire [63:0] AxiMonitorInterface_awaddr_m10;

// Interface: AxiMonitorInterface Signal: awaddr_m11
wire [63:0] AxiMonitorInterface_awaddr_m11;

// Interface: AxiMonitorInterface Signal: awaddr_m12
wire [63:0] AxiMonitorInterface_awaddr_m12;

// Interface: AxiMonitorInterface Signal: awaddr_m13
wire [63:0] AxiMonitorInterface_awaddr_m13;

// Interface: AxiMonitorInterface Signal: awaddr_m14
wire [63:0] AxiMonitorInterface_awaddr_m14;

// Interface: AxiMonitorInterface Signal: awaddr_m15
wire [63:0] AxiMonitorInterface_awaddr_m15;

// Interface: AxiMonitorInterface Signal: awaddr_m16
wire [63:0] AxiMonitorInterface_awaddr_m16;

// Interface: AxiMonitorInterface Signal: awaddr_m17
wire [63:0] AxiMonitorInterface_awaddr_m17;

// Interface: AxiMonitorInterface Signal: awaddr_m18
wire [63:0] AxiMonitorInterface_awaddr_m18;

// Interface: AxiMonitorInterface Signal: awaddr_m19
wire [63:0] AxiMonitorInterface_awaddr_m19;

// Interface: AxiMonitorInterface Signal: awaddr_m20
wire [63:0] AxiMonitorInterface_awaddr_m20;

// Interface: AxiMonitorInterface Signal: awaddr_m21
wire [63:0] AxiMonitorInterface_awaddr_m21;

// Interface: AxiMonitorInterface Signal: awaddr_m22
wire [63:0] AxiMonitorInterface_awaddr_m22;

// Interface: AxiMonitorInterface Signal: awaddr_m23
wire [63:0] AxiMonitorInterface_awaddr_m23;

// Interface: AxiMonitorInterface Signal: awaddr_m24
wire [63:0] AxiMonitorInterface_awaddr_m24;

// Interface: AxiMonitorInterface Signal: awaddr_m25
wire [63:0] AxiMonitorInterface_awaddr_m25;

// Interface: AxiMonitorInterface Signal: awaddr_m26
wire [63:0] AxiMonitorInterface_awaddr_m26;

// Interface: AxiMonitorInterface Signal: awaddr_m27
wire [63:0] AxiMonitorInterface_awaddr_m27;

// Interface: AxiMonitorInterface Signal: awaddr_m28
wire [63:0] AxiMonitorInterface_awaddr_m28;

// Interface: AxiMonitorInterface Signal: awaddr_m29
wire [63:0] AxiMonitorInterface_awaddr_m29;

// Interface: AxiMonitorInterface Signal: awaddr_m30
wire [63:0] AxiMonitorInterface_awaddr_m30;

// Interface: AxiMonitorInterface Signal: awaddr_m31
wire [63:0] AxiMonitorInterface_awaddr_m31;

// Interface: AxiMonitorInterface Signal: awlen_m0
wire [9:0] AxiMonitorInterface_awlen_m0;

// Interface: AxiMonitorInterface Signal: awlen_m1
wire [9:0] AxiMonitorInterface_awlen_m1;

// Interface: AxiMonitorInterface Signal: awlen_m2
wire [9:0] AxiMonitorInterface_awlen_m2;

// Interface: AxiMonitorInterface Signal: awlen_m3
wire [9:0] AxiMonitorInterface_awlen_m3;

// Interface: AxiMonitorInterface Signal: awlen_m4
wire [9:0] AxiMonitorInterface_awlen_m4;

// Interface: AxiMonitorInterface Signal: awlen_m5
wire [9:0] AxiMonitorInterface_awlen_m5;

// Interface: AxiMonitorInterface Signal: awlen_m6
wire [9:0] AxiMonitorInterface_awlen_m6;

// Interface: AxiMonitorInterface Signal: awlen_m7
wire [9:0] AxiMonitorInterface_awlen_m7;

// Interface: AxiMonitorInterface Signal: awlen_m8
wire [9:0] AxiMonitorInterface_awlen_m8;

// Interface: AxiMonitorInterface Signal: awlen_m9
wire [9:0] AxiMonitorInterface_awlen_m9;

// Interface: AxiMonitorInterface Signal: awlen_m10
wire [9:0] AxiMonitorInterface_awlen_m10;

// Interface: AxiMonitorInterface Signal: awlen_m11
wire [9:0] AxiMonitorInterface_awlen_m11;

// Interface: AxiMonitorInterface Signal: awlen_m12
wire [9:0] AxiMonitorInterface_awlen_m12;

// Interface: AxiMonitorInterface Signal: awlen_m13
wire [9:0] AxiMonitorInterface_awlen_m13;

// Interface: AxiMonitorInterface Signal: awlen_m14
wire [9:0] AxiMonitorInterface_awlen_m14;

// Interface: AxiMonitorInterface Signal: awlen_m15
wire [9:0] AxiMonitorInterface_awlen_m15;

// Interface: AxiMonitorInterface Signal: awlen_m16
wire [9:0] AxiMonitorInterface_awlen_m16;

// Interface: AxiMonitorInterface Signal: awlen_m17
wire [9:0] AxiMonitorInterface_awlen_m17;

// Interface: AxiMonitorInterface Signal: awlen_m18
wire [9:0] AxiMonitorInterface_awlen_m18;

// Interface: AxiMonitorInterface Signal: awlen_m19
wire [9:0] AxiMonitorInterface_awlen_m19;

// Interface: AxiMonitorInterface Signal: awlen_m20
wire [9:0] AxiMonitorInterface_awlen_m20;

// Interface: AxiMonitorInterface Signal: awlen_m21
wire [9:0] AxiMonitorInterface_awlen_m21;

// Interface: AxiMonitorInterface Signal: awlen_m22
wire [9:0] AxiMonitorInterface_awlen_m22;

// Interface: AxiMonitorInterface Signal: awlen_m23
wire [9:0] AxiMonitorInterface_awlen_m23;

// Interface: AxiMonitorInterface Signal: awlen_m24
wire [9:0] AxiMonitorInterface_awlen_m24;

// Interface: AxiMonitorInterface Signal: awlen_m25
wire [9:0] AxiMonitorInterface_awlen_m25;

// Interface: AxiMonitorInterface Signal: awlen_m26
wire [9:0] AxiMonitorInterface_awlen_m26;

// Interface: AxiMonitorInterface Signal: awlen_m27
wire [9:0] AxiMonitorInterface_awlen_m27;

// Interface: AxiMonitorInterface Signal: awlen_m28
wire [9:0] AxiMonitorInterface_awlen_m28;

// Interface: AxiMonitorInterface Signal: awlen_m29
wire [9:0] AxiMonitorInterface_awlen_m29;

// Interface: AxiMonitorInterface Signal: awlen_m30
wire [9:0] AxiMonitorInterface_awlen_m30;

// Interface: AxiMonitorInterface Signal: awlen_m31
wire [9:0] AxiMonitorInterface_awlen_m31;

// Interface: AxiMonitorInterface Signal: awsize_m0
wire [2:0] AxiMonitorInterface_awsize_m0;

// Interface: AxiMonitorInterface Signal: awsize_m1
wire [2:0] AxiMonitorInterface_awsize_m1;

// Interface: AxiMonitorInterface Signal: awsize_m2
wire [2:0] AxiMonitorInterface_awsize_m2;

// Interface: AxiMonitorInterface Signal: awsize_m3
wire [2:0] AxiMonitorInterface_awsize_m3;

// Interface: AxiMonitorInterface Signal: awsize_m4
wire [2:0] AxiMonitorInterface_awsize_m4;

// Interface: AxiMonitorInterface Signal: awsize_m5
wire [2:0] AxiMonitorInterface_awsize_m5;

// Interface: AxiMonitorInterface Signal: awsize_m6
wire [2:0] AxiMonitorInterface_awsize_m6;

// Interface: AxiMonitorInterface Signal: awsize_m7
wire [2:0] AxiMonitorInterface_awsize_m7;

// Interface: AxiMonitorInterface Signal: awsize_m8
wire [2:0] AxiMonitorInterface_awsize_m8;

// Interface: AxiMonitorInterface Signal: awsize_m9
wire [2:0] AxiMonitorInterface_awsize_m9;

// Interface: AxiMonitorInterface Signal: awsize_m10
wire [2:0] AxiMonitorInterface_awsize_m10;

// Interface: AxiMonitorInterface Signal: awsize_m11
wire [2:0] AxiMonitorInterface_awsize_m11;

// Interface: AxiMonitorInterface Signal: awsize_m12
wire [2:0] AxiMonitorInterface_awsize_m12;

// Interface: AxiMonitorInterface Signal: awsize_m13
wire [2:0] AxiMonitorInterface_awsize_m13;

// Interface: AxiMonitorInterface Signal: awsize_m14
wire [2:0] AxiMonitorInterface_awsize_m14;

// Interface: AxiMonitorInterface Signal: awsize_m15
wire [2:0] AxiMonitorInterface_awsize_m15;

// Interface: AxiMonitorInterface Signal: awsize_m16
wire [2:0] AxiMonitorInterface_awsize_m16;

// Interface: AxiMonitorInterface Signal: awsize_m17
wire [2:0] AxiMonitorInterface_awsize_m17;

// Interface: AxiMonitorInterface Signal: awsize_m18
wire [2:0] AxiMonitorInterface_awsize_m18;

// Interface: AxiMonitorInterface Signal: awsize_m19
wire [2:0] AxiMonitorInterface_awsize_m19;

// Interface: AxiMonitorInterface Signal: awsize_m20
wire [2:0] AxiMonitorInterface_awsize_m20;

// Interface: AxiMonitorInterface Signal: awsize_m21
wire [2:0] AxiMonitorInterface_awsize_m21;

// Interface: AxiMonitorInterface Signal: awsize_m22
wire [2:0] AxiMonitorInterface_awsize_m22;

// Interface: AxiMonitorInterface Signal: awsize_m23
wire [2:0] AxiMonitorInterface_awsize_m23;

// Interface: AxiMonitorInterface Signal: awsize_m24
wire [2:0] AxiMonitorInterface_awsize_m24;

// Interface: AxiMonitorInterface Signal: awsize_m25
wire [2:0] AxiMonitorInterface_awsize_m25;

// Interface: AxiMonitorInterface Signal: awsize_m26
wire [2:0] AxiMonitorInterface_awsize_m26;

// Interface: AxiMonitorInterface Signal: awsize_m27
wire [2:0] AxiMonitorInterface_awsize_m27;

// Interface: AxiMonitorInterface Signal: awsize_m28
wire [2:0] AxiMonitorInterface_awsize_m28;

// Interface: AxiMonitorInterface Signal: awsize_m29
wire [2:0] AxiMonitorInterface_awsize_m29;

// Interface: AxiMonitorInterface Signal: awsize_m30
wire [2:0] AxiMonitorInterface_awsize_m30;

// Interface: AxiMonitorInterface Signal: awsize_m31
wire [2:0] AxiMonitorInterface_awsize_m31;

// Interface: AxiMonitorInterface Signal: awburst_m0
wire [1:0] AxiMonitorInterface_awburst_m0;

// Interface: AxiMonitorInterface Signal: awburst_m1
wire [1:0] AxiMonitorInterface_awburst_m1;

// Interface: AxiMonitorInterface Signal: awburst_m2
wire [1:0] AxiMonitorInterface_awburst_m2;

// Interface: AxiMonitorInterface Signal: awburst_m3
wire [1:0] AxiMonitorInterface_awburst_m3;

// Interface: AxiMonitorInterface Signal: awburst_m4
wire [1:0] AxiMonitorInterface_awburst_m4;

// Interface: AxiMonitorInterface Signal: awburst_m5
wire [1:0] AxiMonitorInterface_awburst_m5;

// Interface: AxiMonitorInterface Signal: awburst_m6
wire [1:0] AxiMonitorInterface_awburst_m6;

// Interface: AxiMonitorInterface Signal: awburst_m7
wire [1:0] AxiMonitorInterface_awburst_m7;

// Interface: AxiMonitorInterface Signal: awburst_m8
wire [1:0] AxiMonitorInterface_awburst_m8;

// Interface: AxiMonitorInterface Signal: awburst_m9
wire [1:0] AxiMonitorInterface_awburst_m9;

// Interface: AxiMonitorInterface Signal: awburst_m10
wire [1:0] AxiMonitorInterface_awburst_m10;

// Interface: AxiMonitorInterface Signal: awburst_m11
wire [1:0] AxiMonitorInterface_awburst_m11;

// Interface: AxiMonitorInterface Signal: awburst_m12
wire [1:0] AxiMonitorInterface_awburst_m12;

// Interface: AxiMonitorInterface Signal: awburst_m13
wire [1:0] AxiMonitorInterface_awburst_m13;

// Interface: AxiMonitorInterface Signal: awburst_m14
wire [1:0] AxiMonitorInterface_awburst_m14;

// Interface: AxiMonitorInterface Signal: awburst_m15
wire [1:0] AxiMonitorInterface_awburst_m15;

// Interface: AxiMonitorInterface Signal: awburst_m16
wire [1:0] AxiMonitorInterface_awburst_m16;

// Interface: AxiMonitorInterface Signal: awburst_m17
wire [1:0] AxiMonitorInterface_awburst_m17;

// Interface: AxiMonitorInterface Signal: awburst_m18
wire [1:0] AxiMonitorInterface_awburst_m18;

// Interface: AxiMonitorInterface Signal: awburst_m19
wire [1:0] AxiMonitorInterface_awburst_m19;

// Interface: AxiMonitorInterface Signal: awburst_m20
wire [1:0] AxiMonitorInterface_awburst_m20;

// Interface: AxiMonitorInterface Signal: awburst_m21
wire [1:0] AxiMonitorInterface_awburst_m21;

// Interface: AxiMonitorInterface Signal: awburst_m22
wire [1:0] AxiMonitorInterface_awburst_m22;

// Interface: AxiMonitorInterface Signal: awburst_m23
wire [1:0] AxiMonitorInterface_awburst_m23;

// Interface: AxiMonitorInterface Signal: awburst_m24
wire [1:0] AxiMonitorInterface_awburst_m24;

// Interface: AxiMonitorInterface Signal: awburst_m25
wire [1:0] AxiMonitorInterface_awburst_m25;

// Interface: AxiMonitorInterface Signal: awburst_m26
wire [1:0] AxiMonitorInterface_awburst_m26;

// Interface: AxiMonitorInterface Signal: awburst_m27
wire [1:0] AxiMonitorInterface_awburst_m27;

// Interface: AxiMonitorInterface Signal: awburst_m28
wire [1:0] AxiMonitorInterface_awburst_m28;

// Interface: AxiMonitorInterface Signal: awburst_m29
wire [1:0] AxiMonitorInterface_awburst_m29;

// Interface: AxiMonitorInterface Signal: awburst_m30
wire [1:0] AxiMonitorInterface_awburst_m30;

// Interface: AxiMonitorInterface Signal: awburst_m31
wire [1:0] AxiMonitorInterface_awburst_m31;

// Interface: AxiMonitorInterface Signal: awlock_m0
wire [1:0] AxiMonitorInterface_awlock_m0;

// Interface: AxiMonitorInterface Signal: awlock_m1
wire [1:0] AxiMonitorInterface_awlock_m1;

// Interface: AxiMonitorInterface Signal: awlock_m2
wire [1:0] AxiMonitorInterface_awlock_m2;

// Interface: AxiMonitorInterface Signal: awlock_m3
wire [1:0] AxiMonitorInterface_awlock_m3;

// Interface: AxiMonitorInterface Signal: awlock_m4
wire [1:0] AxiMonitorInterface_awlock_m4;

// Interface: AxiMonitorInterface Signal: awlock_m5
wire [1:0] AxiMonitorInterface_awlock_m5;

// Interface: AxiMonitorInterface Signal: awlock_m6
wire [1:0] AxiMonitorInterface_awlock_m6;

// Interface: AxiMonitorInterface Signal: awlock_m7
wire [1:0] AxiMonitorInterface_awlock_m7;

// Interface: AxiMonitorInterface Signal: awlock_m8
wire [1:0] AxiMonitorInterface_awlock_m8;

// Interface: AxiMonitorInterface Signal: awlock_m9
wire [1:0] AxiMonitorInterface_awlock_m9;

// Interface: AxiMonitorInterface Signal: awlock_m10
wire [1:0] AxiMonitorInterface_awlock_m10;

// Interface: AxiMonitorInterface Signal: awlock_m11
wire [1:0] AxiMonitorInterface_awlock_m11;

// Interface: AxiMonitorInterface Signal: awlock_m12
wire [1:0] AxiMonitorInterface_awlock_m12;

// Interface: AxiMonitorInterface Signal: awlock_m13
wire [1:0] AxiMonitorInterface_awlock_m13;

// Interface: AxiMonitorInterface Signal: awlock_m14
wire [1:0] AxiMonitorInterface_awlock_m14;

// Interface: AxiMonitorInterface Signal: awlock_m15
wire [1:0] AxiMonitorInterface_awlock_m15;

// Interface: AxiMonitorInterface Signal: awlock_m16
wire [1:0] AxiMonitorInterface_awlock_m16;

// Interface: AxiMonitorInterface Signal: awlock_m17
wire [1:0] AxiMonitorInterface_awlock_m17;

// Interface: AxiMonitorInterface Signal: awlock_m18
wire [1:0] AxiMonitorInterface_awlock_m18;

// Interface: AxiMonitorInterface Signal: awlock_m19
wire [1:0] AxiMonitorInterface_awlock_m19;

// Interface: AxiMonitorInterface Signal: awlock_m20
wire [1:0] AxiMonitorInterface_awlock_m20;

// Interface: AxiMonitorInterface Signal: awlock_m21
wire [1:0] AxiMonitorInterface_awlock_m21;

// Interface: AxiMonitorInterface Signal: awlock_m22
wire [1:0] AxiMonitorInterface_awlock_m22;

// Interface: AxiMonitorInterface Signal: awlock_m23
wire [1:0] AxiMonitorInterface_awlock_m23;

// Interface: AxiMonitorInterface Signal: awlock_m24
wire [1:0] AxiMonitorInterface_awlock_m24;

// Interface: AxiMonitorInterface Signal: awlock_m25
wire [1:0] AxiMonitorInterface_awlock_m25;

// Interface: AxiMonitorInterface Signal: awlock_m26
wire [1:0] AxiMonitorInterface_awlock_m26;

// Interface: AxiMonitorInterface Signal: awlock_m27
wire [1:0] AxiMonitorInterface_awlock_m27;

// Interface: AxiMonitorInterface Signal: awlock_m28
wire [1:0] AxiMonitorInterface_awlock_m28;

// Interface: AxiMonitorInterface Signal: awlock_m29
wire [1:0] AxiMonitorInterface_awlock_m29;

// Interface: AxiMonitorInterface Signal: awlock_m30
wire [1:0] AxiMonitorInterface_awlock_m30;

// Interface: AxiMonitorInterface Signal: awlock_m31
wire [1:0] AxiMonitorInterface_awlock_m31;

// Interface: AxiMonitorInterface Signal: awcache_m0
wire [3:0] AxiMonitorInterface_awcache_m0;

// Interface: AxiMonitorInterface Signal: awcache_m1
wire [3:0] AxiMonitorInterface_awcache_m1;

// Interface: AxiMonitorInterface Signal: awcache_m2
wire [3:0] AxiMonitorInterface_awcache_m2;

// Interface: AxiMonitorInterface Signal: awcache_m3
wire [3:0] AxiMonitorInterface_awcache_m3;

// Interface: AxiMonitorInterface Signal: awcache_m4
wire [3:0] AxiMonitorInterface_awcache_m4;

// Interface: AxiMonitorInterface Signal: awcache_m5
wire [3:0] AxiMonitorInterface_awcache_m5;

// Interface: AxiMonitorInterface Signal: awcache_m6
wire [3:0] AxiMonitorInterface_awcache_m6;

// Interface: AxiMonitorInterface Signal: awcache_m7
wire [3:0] AxiMonitorInterface_awcache_m7;

// Interface: AxiMonitorInterface Signal: awcache_m8
wire [3:0] AxiMonitorInterface_awcache_m8;

// Interface: AxiMonitorInterface Signal: awcache_m9
wire [3:0] AxiMonitorInterface_awcache_m9;

// Interface: AxiMonitorInterface Signal: awcache_m10
wire [3:0] AxiMonitorInterface_awcache_m10;

// Interface: AxiMonitorInterface Signal: awcache_m11
wire [3:0] AxiMonitorInterface_awcache_m11;

// Interface: AxiMonitorInterface Signal: awcache_m12
wire [3:0] AxiMonitorInterface_awcache_m12;

// Interface: AxiMonitorInterface Signal: awcache_m13
wire [3:0] AxiMonitorInterface_awcache_m13;

// Interface: AxiMonitorInterface Signal: awcache_m14
wire [3:0] AxiMonitorInterface_awcache_m14;

// Interface: AxiMonitorInterface Signal: awcache_m15
wire [3:0] AxiMonitorInterface_awcache_m15;

// Interface: AxiMonitorInterface Signal: awcache_m16
wire [3:0] AxiMonitorInterface_awcache_m16;

// Interface: AxiMonitorInterface Signal: awcache_m17
wire [3:0] AxiMonitorInterface_awcache_m17;

// Interface: AxiMonitorInterface Signal: awcache_m18
wire [3:0] AxiMonitorInterface_awcache_m18;

// Interface: AxiMonitorInterface Signal: awcache_m19
wire [3:0] AxiMonitorInterface_awcache_m19;

// Interface: AxiMonitorInterface Signal: awcache_m20
wire [3:0] AxiMonitorInterface_awcache_m20;

// Interface: AxiMonitorInterface Signal: awcache_m21
wire [3:0] AxiMonitorInterface_awcache_m21;

// Interface: AxiMonitorInterface Signal: awcache_m22
wire [3:0] AxiMonitorInterface_awcache_m22;

// Interface: AxiMonitorInterface Signal: awcache_m23
wire [3:0] AxiMonitorInterface_awcache_m23;

// Interface: AxiMonitorInterface Signal: awcache_m24
wire [3:0] AxiMonitorInterface_awcache_m24;

// Interface: AxiMonitorInterface Signal: awcache_m25
wire [3:0] AxiMonitorInterface_awcache_m25;

// Interface: AxiMonitorInterface Signal: awcache_m26
wire [3:0] AxiMonitorInterface_awcache_m26;

// Interface: AxiMonitorInterface Signal: awcache_m27
wire [3:0] AxiMonitorInterface_awcache_m27;

// Interface: AxiMonitorInterface Signal: awcache_m28
wire [3:0] AxiMonitorInterface_awcache_m28;

// Interface: AxiMonitorInterface Signal: awcache_m29
wire [3:0] AxiMonitorInterface_awcache_m29;

// Interface: AxiMonitorInterface Signal: awcache_m30
wire [3:0] AxiMonitorInterface_awcache_m30;

// Interface: AxiMonitorInterface Signal: awcache_m31
wire [3:0] AxiMonitorInterface_awcache_m31;

// Interface: AxiMonitorInterface Signal: awprot_m0
wire [2:0] AxiMonitorInterface_awprot_m0;

// Interface: AxiMonitorInterface Signal: awprot_m1
wire [2:0] AxiMonitorInterface_awprot_m1;

// Interface: AxiMonitorInterface Signal: awprot_m2
wire [2:0] AxiMonitorInterface_awprot_m2;

// Interface: AxiMonitorInterface Signal: awprot_m3
wire [2:0] AxiMonitorInterface_awprot_m3;

// Interface: AxiMonitorInterface Signal: awprot_m4
wire [2:0] AxiMonitorInterface_awprot_m4;

// Interface: AxiMonitorInterface Signal: awprot_m5
wire [2:0] AxiMonitorInterface_awprot_m5;

// Interface: AxiMonitorInterface Signal: awprot_m6
wire [2:0] AxiMonitorInterface_awprot_m6;

// Interface: AxiMonitorInterface Signal: awprot_m7
wire [2:0] AxiMonitorInterface_awprot_m7;

// Interface: AxiMonitorInterface Signal: awprot_m8
wire [2:0] AxiMonitorInterface_awprot_m8;

// Interface: AxiMonitorInterface Signal: awprot_m9
wire [2:0] AxiMonitorInterface_awprot_m9;

// Interface: AxiMonitorInterface Signal: awprot_m10
wire [2:0] AxiMonitorInterface_awprot_m10;

// Interface: AxiMonitorInterface Signal: awprot_m11
wire [2:0] AxiMonitorInterface_awprot_m11;

// Interface: AxiMonitorInterface Signal: awprot_m12
wire [2:0] AxiMonitorInterface_awprot_m12;

// Interface: AxiMonitorInterface Signal: awprot_m13
wire [2:0] AxiMonitorInterface_awprot_m13;

// Interface: AxiMonitorInterface Signal: awprot_m14
wire [2:0] AxiMonitorInterface_awprot_m14;

// Interface: AxiMonitorInterface Signal: awprot_m15
wire [2:0] AxiMonitorInterface_awprot_m15;

// Interface: AxiMonitorInterface Signal: awprot_m16
wire [2:0] AxiMonitorInterface_awprot_m16;

// Interface: AxiMonitorInterface Signal: awprot_m17
wire [2:0] AxiMonitorInterface_awprot_m17;

// Interface: AxiMonitorInterface Signal: awprot_m18
wire [2:0] AxiMonitorInterface_awprot_m18;

// Interface: AxiMonitorInterface Signal: awprot_m19
wire [2:0] AxiMonitorInterface_awprot_m19;

// Interface: AxiMonitorInterface Signal: awprot_m20
wire [2:0] AxiMonitorInterface_awprot_m20;

// Interface: AxiMonitorInterface Signal: awprot_m21
wire [2:0] AxiMonitorInterface_awprot_m21;

// Interface: AxiMonitorInterface Signal: awprot_m22
wire [2:0] AxiMonitorInterface_awprot_m22;

// Interface: AxiMonitorInterface Signal: awprot_m23
wire [2:0] AxiMonitorInterface_awprot_m23;

// Interface: AxiMonitorInterface Signal: awprot_m24
wire [2:0] AxiMonitorInterface_awprot_m24;

// Interface: AxiMonitorInterface Signal: awprot_m25
wire [2:0] AxiMonitorInterface_awprot_m25;

// Interface: AxiMonitorInterface Signal: awprot_m26
wire [2:0] AxiMonitorInterface_awprot_m26;

// Interface: AxiMonitorInterface Signal: awprot_m27
wire [2:0] AxiMonitorInterface_awprot_m27;

// Interface: AxiMonitorInterface Signal: awprot_m28
wire [2:0] AxiMonitorInterface_awprot_m28;

// Interface: AxiMonitorInterface Signal: awprot_m29
wire [2:0] AxiMonitorInterface_awprot_m29;

// Interface: AxiMonitorInterface Signal: awprot_m30
wire [2:0] AxiMonitorInterface_awprot_m30;

// Interface: AxiMonitorInterface Signal: awprot_m31
wire [2:0] AxiMonitorInterface_awprot_m31;

// Interface: AxiMonitorInterface Signal: awid_m0
wire [31:0] AxiMonitorInterface_awid_m0;

// Interface: AxiMonitorInterface Signal: awid_m1
wire [31:0] AxiMonitorInterface_awid_m1;

// Interface: AxiMonitorInterface Signal: awid_m2
wire [31:0] AxiMonitorInterface_awid_m2;

// Interface: AxiMonitorInterface Signal: awid_m3
wire [31:0] AxiMonitorInterface_awid_m3;

// Interface: AxiMonitorInterface Signal: awid_m4
wire [31:0] AxiMonitorInterface_awid_m4;

// Interface: AxiMonitorInterface Signal: awid_m5
wire [31:0] AxiMonitorInterface_awid_m5;

// Interface: AxiMonitorInterface Signal: awid_m6
wire [31:0] AxiMonitorInterface_awid_m6;

// Interface: AxiMonitorInterface Signal: awid_m7
wire [31:0] AxiMonitorInterface_awid_m7;

// Interface: AxiMonitorInterface Signal: awid_m8
wire [31:0] AxiMonitorInterface_awid_m8;

// Interface: AxiMonitorInterface Signal: awid_m9
wire [31:0] AxiMonitorInterface_awid_m9;

// Interface: AxiMonitorInterface Signal: awid_m10
wire [31:0] AxiMonitorInterface_awid_m10;

// Interface: AxiMonitorInterface Signal: awid_m11
wire [31:0] AxiMonitorInterface_awid_m11;

// Interface: AxiMonitorInterface Signal: awid_m12
wire [31:0] AxiMonitorInterface_awid_m12;

// Interface: AxiMonitorInterface Signal: awid_m13
wire [31:0] AxiMonitorInterface_awid_m13;

// Interface: AxiMonitorInterface Signal: awid_m14
wire [31:0] AxiMonitorInterface_awid_m14;

// Interface: AxiMonitorInterface Signal: awid_m15
wire [31:0] AxiMonitorInterface_awid_m15;

// Interface: AxiMonitorInterface Signal: awid_m16
wire [31:0] AxiMonitorInterface_awid_m16;

// Interface: AxiMonitorInterface Signal: awid_m17
wire [31:0] AxiMonitorInterface_awid_m17;

// Interface: AxiMonitorInterface Signal: awid_m18
wire [31:0] AxiMonitorInterface_awid_m18;

// Interface: AxiMonitorInterface Signal: awid_m19
wire [31:0] AxiMonitorInterface_awid_m19;

// Interface: AxiMonitorInterface Signal: awid_m20
wire [31:0] AxiMonitorInterface_awid_m20;

// Interface: AxiMonitorInterface Signal: awid_m21
wire [31:0] AxiMonitorInterface_awid_m21;

// Interface: AxiMonitorInterface Signal: awid_m22
wire [31:0] AxiMonitorInterface_awid_m22;

// Interface: AxiMonitorInterface Signal: awid_m23
wire [31:0] AxiMonitorInterface_awid_m23;

// Interface: AxiMonitorInterface Signal: awid_m24
wire [31:0] AxiMonitorInterface_awid_m24;

// Interface: AxiMonitorInterface Signal: awid_m25
wire [31:0] AxiMonitorInterface_awid_m25;

// Interface: AxiMonitorInterface Signal: awid_m26
wire [31:0] AxiMonitorInterface_awid_m26;

// Interface: AxiMonitorInterface Signal: awid_m27
wire [31:0] AxiMonitorInterface_awid_m27;

// Interface: AxiMonitorInterface Signal: awid_m28
wire [31:0] AxiMonitorInterface_awid_m28;

// Interface: AxiMonitorInterface Signal: awid_m29
wire [31:0] AxiMonitorInterface_awid_m29;

// Interface: AxiMonitorInterface Signal: awid_m30
wire [31:0] AxiMonitorInterface_awid_m30;

// Interface: AxiMonitorInterface Signal: awid_m31
wire [31:0] AxiMonitorInterface_awid_m31;

// Interface: AxiMonitorInterface Signal: awready_m0
wire AxiMonitorInterface_awready_m0;

// Interface: AxiMonitorInterface Signal: awready_m1
wire AxiMonitorInterface_awready_m1;

// Interface: AxiMonitorInterface Signal: awready_m2
wire AxiMonitorInterface_awready_m2;

// Interface: AxiMonitorInterface Signal: awready_m3
wire AxiMonitorInterface_awready_m3;

// Interface: AxiMonitorInterface Signal: awready_m4
wire AxiMonitorInterface_awready_m4;

// Interface: AxiMonitorInterface Signal: awready_m5
wire AxiMonitorInterface_awready_m5;

// Interface: AxiMonitorInterface Signal: awready_m6
wire AxiMonitorInterface_awready_m6;

// Interface: AxiMonitorInterface Signal: awready_m7
wire AxiMonitorInterface_awready_m7;

// Interface: AxiMonitorInterface Signal: awready_m8
wire AxiMonitorInterface_awready_m8;

// Interface: AxiMonitorInterface Signal: awready_m9
wire AxiMonitorInterface_awready_m9;

// Interface: AxiMonitorInterface Signal: awready_m10
wire AxiMonitorInterface_awready_m10;

// Interface: AxiMonitorInterface Signal: awready_m11
wire AxiMonitorInterface_awready_m11;

// Interface: AxiMonitorInterface Signal: awready_m12
wire AxiMonitorInterface_awready_m12;

// Interface: AxiMonitorInterface Signal: awready_m13
wire AxiMonitorInterface_awready_m13;

// Interface: AxiMonitorInterface Signal: awready_m14
wire AxiMonitorInterface_awready_m14;

// Interface: AxiMonitorInterface Signal: awready_m15
wire AxiMonitorInterface_awready_m15;

// Interface: AxiMonitorInterface Signal: awready_m16
wire AxiMonitorInterface_awready_m16;

// Interface: AxiMonitorInterface Signal: awready_m17
wire AxiMonitorInterface_awready_m17;

// Interface: AxiMonitorInterface Signal: awready_m18
wire AxiMonitorInterface_awready_m18;

// Interface: AxiMonitorInterface Signal: awready_m19
wire AxiMonitorInterface_awready_m19;

// Interface: AxiMonitorInterface Signal: awready_m20
wire AxiMonitorInterface_awready_m20;

// Interface: AxiMonitorInterface Signal: awready_m21
wire AxiMonitorInterface_awready_m21;

// Interface: AxiMonitorInterface Signal: awready_m22
wire AxiMonitorInterface_awready_m22;

// Interface: AxiMonitorInterface Signal: awready_m23
wire AxiMonitorInterface_awready_m23;

// Interface: AxiMonitorInterface Signal: awready_m24
wire AxiMonitorInterface_awready_m24;

// Interface: AxiMonitorInterface Signal: awready_m25
wire AxiMonitorInterface_awready_m25;

// Interface: AxiMonitorInterface Signal: awready_m26
wire AxiMonitorInterface_awready_m26;

// Interface: AxiMonitorInterface Signal: awready_m27
wire AxiMonitorInterface_awready_m27;

// Interface: AxiMonitorInterface Signal: awready_m28
wire AxiMonitorInterface_awready_m28;

// Interface: AxiMonitorInterface Signal: awready_m29
wire AxiMonitorInterface_awready_m29;

// Interface: AxiMonitorInterface Signal: awready_m30
wire AxiMonitorInterface_awready_m30;

// Interface: AxiMonitorInterface Signal: awready_m31
wire AxiMonitorInterface_awready_m31;

// Interface: AxiMonitorInterface Signal: awsideband_m0
wire [63:0] AxiMonitorInterface_awsideband_m0;

// Interface: AxiMonitorInterface Signal: awsideband_m1
wire [63:0] AxiMonitorInterface_awsideband_m1;

// Interface: AxiMonitorInterface Signal: awsideband_m2
wire [63:0] AxiMonitorInterface_awsideband_m2;

// Interface: AxiMonitorInterface Signal: awsideband_m3
wire [63:0] AxiMonitorInterface_awsideband_m3;

// Interface: AxiMonitorInterface Signal: awsideband_m4
wire [63:0] AxiMonitorInterface_awsideband_m4;

// Interface: AxiMonitorInterface Signal: awsideband_m5
wire [63:0] AxiMonitorInterface_awsideband_m5;

// Interface: AxiMonitorInterface Signal: awsideband_m6
wire [63:0] AxiMonitorInterface_awsideband_m6;

// Interface: AxiMonitorInterface Signal: awsideband_m7
wire [63:0] AxiMonitorInterface_awsideband_m7;

// Interface: AxiMonitorInterface Signal: awsideband_m8
wire [63:0] AxiMonitorInterface_awsideband_m8;

// Interface: AxiMonitorInterface Signal: awsideband_m9
wire [63:0] AxiMonitorInterface_awsideband_m9;

// Interface: AxiMonitorInterface Signal: awsideband_m10
wire [63:0] AxiMonitorInterface_awsideband_m10;

// Interface: AxiMonitorInterface Signal: awsideband_m11
wire [63:0] AxiMonitorInterface_awsideband_m11;

// Interface: AxiMonitorInterface Signal: awsideband_m12
wire [63:0] AxiMonitorInterface_awsideband_m12;

// Interface: AxiMonitorInterface Signal: awsideband_m13
wire [63:0] AxiMonitorInterface_awsideband_m13;

// Interface: AxiMonitorInterface Signal: awsideband_m14
wire [63:0] AxiMonitorInterface_awsideband_m14;

// Interface: AxiMonitorInterface Signal: awsideband_m15
wire [63:0] AxiMonitorInterface_awsideband_m15;

// Interface: AxiMonitorInterface Signal: awsideband_m16
wire [63:0] AxiMonitorInterface_awsideband_m16;

// Interface: AxiMonitorInterface Signal: awsideband_m17
wire [63:0] AxiMonitorInterface_awsideband_m17;

// Interface: AxiMonitorInterface Signal: awsideband_m18
wire [63:0] AxiMonitorInterface_awsideband_m18;

// Interface: AxiMonitorInterface Signal: awsideband_m19
wire [63:0] AxiMonitorInterface_awsideband_m19;

// Interface: AxiMonitorInterface Signal: awsideband_m20
wire [63:0] AxiMonitorInterface_awsideband_m20;

// Interface: AxiMonitorInterface Signal: awsideband_m21
wire [63:0] AxiMonitorInterface_awsideband_m21;

// Interface: AxiMonitorInterface Signal: awsideband_m22
wire [63:0] AxiMonitorInterface_awsideband_m22;

// Interface: AxiMonitorInterface Signal: awsideband_m23
wire [63:0] AxiMonitorInterface_awsideband_m23;

// Interface: AxiMonitorInterface Signal: awsideband_m24
wire [63:0] AxiMonitorInterface_awsideband_m24;

// Interface: AxiMonitorInterface Signal: awsideband_m25
wire [63:0] AxiMonitorInterface_awsideband_m25;

// Interface: AxiMonitorInterface Signal: awsideband_m26
wire [63:0] AxiMonitorInterface_awsideband_m26;

// Interface: AxiMonitorInterface Signal: awsideband_m27
wire [63:0] AxiMonitorInterface_awsideband_m27;

// Interface: AxiMonitorInterface Signal: awsideband_m28
wire [63:0] AxiMonitorInterface_awsideband_m28;

// Interface: AxiMonitorInterface Signal: awsideband_m29
wire [63:0] AxiMonitorInterface_awsideband_m29;

// Interface: AxiMonitorInterface Signal: awsideband_m30
wire [63:0] AxiMonitorInterface_awsideband_m30;

// Interface: AxiMonitorInterface Signal: awsideband_m31
wire [63:0] AxiMonitorInterface_awsideband_m31;

// Interface: AxiMonitorInterface Signal: rvalid_m0
wire AxiMonitorInterface_rvalid_m0;

// Interface: AxiMonitorInterface Signal: rvalid_m1
wire AxiMonitorInterface_rvalid_m1;

// Interface: AxiMonitorInterface Signal: rvalid_m2
wire AxiMonitorInterface_rvalid_m2;

// Interface: AxiMonitorInterface Signal: rvalid_m3
wire AxiMonitorInterface_rvalid_m3;

// Interface: AxiMonitorInterface Signal: rvalid_m4
wire AxiMonitorInterface_rvalid_m4;

// Interface: AxiMonitorInterface Signal: rvalid_m5
wire AxiMonitorInterface_rvalid_m5;

// Interface: AxiMonitorInterface Signal: rvalid_m6
wire AxiMonitorInterface_rvalid_m6;

// Interface: AxiMonitorInterface Signal: rvalid_m7
wire AxiMonitorInterface_rvalid_m7;

// Interface: AxiMonitorInterface Signal: rvalid_m8
wire AxiMonitorInterface_rvalid_m8;

// Interface: AxiMonitorInterface Signal: rvalid_m9
wire AxiMonitorInterface_rvalid_m9;

// Interface: AxiMonitorInterface Signal: rvalid_m10
wire AxiMonitorInterface_rvalid_m10;

// Interface: AxiMonitorInterface Signal: rvalid_m11
wire AxiMonitorInterface_rvalid_m11;

// Interface: AxiMonitorInterface Signal: rvalid_m12
wire AxiMonitorInterface_rvalid_m12;

// Interface: AxiMonitorInterface Signal: rvalid_m13
wire AxiMonitorInterface_rvalid_m13;

// Interface: AxiMonitorInterface Signal: rvalid_m14
wire AxiMonitorInterface_rvalid_m14;

// Interface: AxiMonitorInterface Signal: rvalid_m15
wire AxiMonitorInterface_rvalid_m15;

// Interface: AxiMonitorInterface Signal: rvalid_m16
wire AxiMonitorInterface_rvalid_m16;

// Interface: AxiMonitorInterface Signal: rvalid_m17
wire AxiMonitorInterface_rvalid_m17;

// Interface: AxiMonitorInterface Signal: rvalid_m18
wire AxiMonitorInterface_rvalid_m18;

// Interface: AxiMonitorInterface Signal: rvalid_m19
wire AxiMonitorInterface_rvalid_m19;

// Interface: AxiMonitorInterface Signal: rvalid_m20
wire AxiMonitorInterface_rvalid_m20;

// Interface: AxiMonitorInterface Signal: rvalid_m21
wire AxiMonitorInterface_rvalid_m21;

// Interface: AxiMonitorInterface Signal: rvalid_m22
wire AxiMonitorInterface_rvalid_m22;

// Interface: AxiMonitorInterface Signal: rvalid_m23
wire AxiMonitorInterface_rvalid_m23;

// Interface: AxiMonitorInterface Signal: rvalid_m24
wire AxiMonitorInterface_rvalid_m24;

// Interface: AxiMonitorInterface Signal: rvalid_m25
wire AxiMonitorInterface_rvalid_m25;

// Interface: AxiMonitorInterface Signal: rvalid_m26
wire AxiMonitorInterface_rvalid_m26;

// Interface: AxiMonitorInterface Signal: rvalid_m27
wire AxiMonitorInterface_rvalid_m27;

// Interface: AxiMonitorInterface Signal: rvalid_m28
wire AxiMonitorInterface_rvalid_m28;

// Interface: AxiMonitorInterface Signal: rvalid_m29
wire AxiMonitorInterface_rvalid_m29;

// Interface: AxiMonitorInterface Signal: rvalid_m30
wire AxiMonitorInterface_rvalid_m30;

// Interface: AxiMonitorInterface Signal: rvalid_m31
wire AxiMonitorInterface_rvalid_m31;

// Interface: AxiMonitorInterface Signal: rlast_m0
wire AxiMonitorInterface_rlast_m0;

// Interface: AxiMonitorInterface Signal: rlast_m1
wire AxiMonitorInterface_rlast_m1;

// Interface: AxiMonitorInterface Signal: rlast_m2
wire AxiMonitorInterface_rlast_m2;

// Interface: AxiMonitorInterface Signal: rlast_m3
wire AxiMonitorInterface_rlast_m3;

// Interface: AxiMonitorInterface Signal: rlast_m4
wire AxiMonitorInterface_rlast_m4;

// Interface: AxiMonitorInterface Signal: rlast_m5
wire AxiMonitorInterface_rlast_m5;

// Interface: AxiMonitorInterface Signal: rlast_m6
wire AxiMonitorInterface_rlast_m6;

// Interface: AxiMonitorInterface Signal: rlast_m7
wire AxiMonitorInterface_rlast_m7;

// Interface: AxiMonitorInterface Signal: rlast_m8
wire AxiMonitorInterface_rlast_m8;

// Interface: AxiMonitorInterface Signal: rlast_m9
wire AxiMonitorInterface_rlast_m9;

// Interface: AxiMonitorInterface Signal: rlast_m10
wire AxiMonitorInterface_rlast_m10;

// Interface: AxiMonitorInterface Signal: rlast_m11
wire AxiMonitorInterface_rlast_m11;

// Interface: AxiMonitorInterface Signal: rlast_m12
wire AxiMonitorInterface_rlast_m12;

// Interface: AxiMonitorInterface Signal: rlast_m13
wire AxiMonitorInterface_rlast_m13;

// Interface: AxiMonitorInterface Signal: rlast_m14
wire AxiMonitorInterface_rlast_m14;

// Interface: AxiMonitorInterface Signal: rlast_m15
wire AxiMonitorInterface_rlast_m15;

// Interface: AxiMonitorInterface Signal: rlast_m16
wire AxiMonitorInterface_rlast_m16;

// Interface: AxiMonitorInterface Signal: rlast_m17
wire AxiMonitorInterface_rlast_m17;

// Interface: AxiMonitorInterface Signal: rlast_m18
wire AxiMonitorInterface_rlast_m18;

// Interface: AxiMonitorInterface Signal: rlast_m19
wire AxiMonitorInterface_rlast_m19;

// Interface: AxiMonitorInterface Signal: rlast_m20
wire AxiMonitorInterface_rlast_m20;

// Interface: AxiMonitorInterface Signal: rlast_m21
wire AxiMonitorInterface_rlast_m21;

// Interface: AxiMonitorInterface Signal: rlast_m22
wire AxiMonitorInterface_rlast_m22;

// Interface: AxiMonitorInterface Signal: rlast_m23
wire AxiMonitorInterface_rlast_m23;

// Interface: AxiMonitorInterface Signal: rlast_m24
wire AxiMonitorInterface_rlast_m24;

// Interface: AxiMonitorInterface Signal: rlast_m25
wire AxiMonitorInterface_rlast_m25;

// Interface: AxiMonitorInterface Signal: rlast_m26
wire AxiMonitorInterface_rlast_m26;

// Interface: AxiMonitorInterface Signal: rlast_m27
wire AxiMonitorInterface_rlast_m27;

// Interface: AxiMonitorInterface Signal: rlast_m28
wire AxiMonitorInterface_rlast_m28;

// Interface: AxiMonitorInterface Signal: rlast_m29
wire AxiMonitorInterface_rlast_m29;

// Interface: AxiMonitorInterface Signal: rlast_m30
wire AxiMonitorInterface_rlast_m30;

// Interface: AxiMonitorInterface Signal: rlast_m31
wire AxiMonitorInterface_rlast_m31;

// Interface: AxiMonitorInterface Signal: rdata_m0
wire [1023:0] AxiMonitorInterface_rdata_m0;

// Interface: AxiMonitorInterface Signal: rdata_m1
wire [1023:0] AxiMonitorInterface_rdata_m1;

// Interface: AxiMonitorInterface Signal: rdata_m2
wire [1023:0] AxiMonitorInterface_rdata_m2;

// Interface: AxiMonitorInterface Signal: rdata_m3
wire [1023:0] AxiMonitorInterface_rdata_m3;

// Interface: AxiMonitorInterface Signal: rdata_m4
wire [1023:0] AxiMonitorInterface_rdata_m4;

// Interface: AxiMonitorInterface Signal: rdata_m5
wire [1023:0] AxiMonitorInterface_rdata_m5;

// Interface: AxiMonitorInterface Signal: rdata_m6
wire [1023:0] AxiMonitorInterface_rdata_m6;

// Interface: AxiMonitorInterface Signal: rdata_m7
wire [1023:0] AxiMonitorInterface_rdata_m7;

// Interface: AxiMonitorInterface Signal: rdata_m8
wire [1023:0] AxiMonitorInterface_rdata_m8;

// Interface: AxiMonitorInterface Signal: rdata_m9
wire [1023:0] AxiMonitorInterface_rdata_m9;

// Interface: AxiMonitorInterface Signal: rdata_m10
wire [1023:0] AxiMonitorInterface_rdata_m10;

// Interface: AxiMonitorInterface Signal: rdata_m11
wire [1023:0] AxiMonitorInterface_rdata_m11;

// Interface: AxiMonitorInterface Signal: rdata_m12
wire [1023:0] AxiMonitorInterface_rdata_m12;

// Interface: AxiMonitorInterface Signal: rdata_m13
wire [1023:0] AxiMonitorInterface_rdata_m13;

// Interface: AxiMonitorInterface Signal: rdata_m14
wire [1023:0] AxiMonitorInterface_rdata_m14;

// Interface: AxiMonitorInterface Signal: rdata_m15
wire [1023:0] AxiMonitorInterface_rdata_m15;

// Interface: AxiMonitorInterface Signal: rdata_m16
wire [1023:0] AxiMonitorInterface_rdata_m16;

// Interface: AxiMonitorInterface Signal: rdata_m17
wire [1023:0] AxiMonitorInterface_rdata_m17;

// Interface: AxiMonitorInterface Signal: rdata_m18
wire [1023:0] AxiMonitorInterface_rdata_m18;

// Interface: AxiMonitorInterface Signal: rdata_m19
wire [1023:0] AxiMonitorInterface_rdata_m19;

// Interface: AxiMonitorInterface Signal: rdata_m20
wire [1023:0] AxiMonitorInterface_rdata_m20;

// Interface: AxiMonitorInterface Signal: rdata_m21
wire [1023:0] AxiMonitorInterface_rdata_m21;

// Interface: AxiMonitorInterface Signal: rdata_m22
wire [1023:0] AxiMonitorInterface_rdata_m22;

// Interface: AxiMonitorInterface Signal: rdata_m23
wire [1023:0] AxiMonitorInterface_rdata_m23;

// Interface: AxiMonitorInterface Signal: rdata_m24
wire [1023:0] AxiMonitorInterface_rdata_m24;

// Interface: AxiMonitorInterface Signal: rdata_m25
wire [1023:0] AxiMonitorInterface_rdata_m25;

// Interface: AxiMonitorInterface Signal: rdata_m26
wire [1023:0] AxiMonitorInterface_rdata_m26;

// Interface: AxiMonitorInterface Signal: rdata_m27
wire [1023:0] AxiMonitorInterface_rdata_m27;

// Interface: AxiMonitorInterface Signal: rdata_m28
wire [1023:0] AxiMonitorInterface_rdata_m28;

// Interface: AxiMonitorInterface Signal: rdata_m29
wire [1023:0] AxiMonitorInterface_rdata_m29;

// Interface: AxiMonitorInterface Signal: rdata_m30
wire [1023:0] AxiMonitorInterface_rdata_m30;

// Interface: AxiMonitorInterface Signal: rdata_m31
wire [1023:0] AxiMonitorInterface_rdata_m31;

// Interface: AxiMonitorInterface Signal: rresp_m0
wire [1:0] AxiMonitorInterface_rresp_m0;

// Interface: AxiMonitorInterface Signal: rresp_m1
wire [1:0] AxiMonitorInterface_rresp_m1;

// Interface: AxiMonitorInterface Signal: rresp_m2
wire [1:0] AxiMonitorInterface_rresp_m2;

// Interface: AxiMonitorInterface Signal: rresp_m3
wire [1:0] AxiMonitorInterface_rresp_m3;

// Interface: AxiMonitorInterface Signal: rresp_m4
wire [1:0] AxiMonitorInterface_rresp_m4;

// Interface: AxiMonitorInterface Signal: rresp_m5
wire [1:0] AxiMonitorInterface_rresp_m5;

// Interface: AxiMonitorInterface Signal: rresp_m6
wire [1:0] AxiMonitorInterface_rresp_m6;

// Interface: AxiMonitorInterface Signal: rresp_m7
wire [1:0] AxiMonitorInterface_rresp_m7;

// Interface: AxiMonitorInterface Signal: rresp_m8
wire [1:0] AxiMonitorInterface_rresp_m8;

// Interface: AxiMonitorInterface Signal: rresp_m9
wire [1:0] AxiMonitorInterface_rresp_m9;

// Interface: AxiMonitorInterface Signal: rresp_m10
wire [1:0] AxiMonitorInterface_rresp_m10;

// Interface: AxiMonitorInterface Signal: rresp_m11
wire [1:0] AxiMonitorInterface_rresp_m11;

// Interface: AxiMonitorInterface Signal: rresp_m12
wire [1:0] AxiMonitorInterface_rresp_m12;

// Interface: AxiMonitorInterface Signal: rresp_m13
wire [1:0] AxiMonitorInterface_rresp_m13;

// Interface: AxiMonitorInterface Signal: rresp_m14
wire [1:0] AxiMonitorInterface_rresp_m14;

// Interface: AxiMonitorInterface Signal: rresp_m15
wire [1:0] AxiMonitorInterface_rresp_m15;

// Interface: AxiMonitorInterface Signal: rresp_m16
wire [1:0] AxiMonitorInterface_rresp_m16;

// Interface: AxiMonitorInterface Signal: rresp_m17
wire [1:0] AxiMonitorInterface_rresp_m17;

// Interface: AxiMonitorInterface Signal: rresp_m18
wire [1:0] AxiMonitorInterface_rresp_m18;

// Interface: AxiMonitorInterface Signal: rresp_m19
wire [1:0] AxiMonitorInterface_rresp_m19;

// Interface: AxiMonitorInterface Signal: rresp_m20
wire [1:0] AxiMonitorInterface_rresp_m20;

// Interface: AxiMonitorInterface Signal: rresp_m21
wire [1:0] AxiMonitorInterface_rresp_m21;

// Interface: AxiMonitorInterface Signal: rresp_m22
wire [1:0] AxiMonitorInterface_rresp_m22;

// Interface: AxiMonitorInterface Signal: rresp_m23
wire [1:0] AxiMonitorInterface_rresp_m23;

// Interface: AxiMonitorInterface Signal: rresp_m24
wire [1:0] AxiMonitorInterface_rresp_m24;

// Interface: AxiMonitorInterface Signal: rresp_m25
wire [1:0] AxiMonitorInterface_rresp_m25;

// Interface: AxiMonitorInterface Signal: rresp_m26
wire [1:0] AxiMonitorInterface_rresp_m26;

// Interface: AxiMonitorInterface Signal: rresp_m27
wire [1:0] AxiMonitorInterface_rresp_m27;

// Interface: AxiMonitorInterface Signal: rresp_m28
wire [1:0] AxiMonitorInterface_rresp_m28;

// Interface: AxiMonitorInterface Signal: rresp_m29
wire [1:0] AxiMonitorInterface_rresp_m29;

// Interface: AxiMonitorInterface Signal: rresp_m30
wire [1:0] AxiMonitorInterface_rresp_m30;

// Interface: AxiMonitorInterface Signal: rresp_m31
wire [1:0] AxiMonitorInterface_rresp_m31;

// Interface: AxiMonitorInterface Signal: rid_m0
wire [31:0] AxiMonitorInterface_rid_m0;

// Interface: AxiMonitorInterface Signal: rid_m1
wire [31:0] AxiMonitorInterface_rid_m1;

// Interface: AxiMonitorInterface Signal: rid_m2
wire [31:0] AxiMonitorInterface_rid_m2;

// Interface: AxiMonitorInterface Signal: rid_m3
wire [31:0] AxiMonitorInterface_rid_m3;

// Interface: AxiMonitorInterface Signal: rid_m4
wire [31:0] AxiMonitorInterface_rid_m4;

// Interface: AxiMonitorInterface Signal: rid_m5
wire [31:0] AxiMonitorInterface_rid_m5;

// Interface: AxiMonitorInterface Signal: rid_m6
wire [31:0] AxiMonitorInterface_rid_m6;

// Interface: AxiMonitorInterface Signal: rid_m7
wire [31:0] AxiMonitorInterface_rid_m7;

// Interface: AxiMonitorInterface Signal: rid_m8
wire [31:0] AxiMonitorInterface_rid_m8;

// Interface: AxiMonitorInterface Signal: rid_m9
wire [31:0] AxiMonitorInterface_rid_m9;

// Interface: AxiMonitorInterface Signal: rid_m10
wire [31:0] AxiMonitorInterface_rid_m10;

// Interface: AxiMonitorInterface Signal: rid_m11
wire [31:0] AxiMonitorInterface_rid_m11;

// Interface: AxiMonitorInterface Signal: rid_m12
wire [31:0] AxiMonitorInterface_rid_m12;

// Interface: AxiMonitorInterface Signal: rid_m13
wire [31:0] AxiMonitorInterface_rid_m13;

// Interface: AxiMonitorInterface Signal: rid_m14
wire [31:0] AxiMonitorInterface_rid_m14;

// Interface: AxiMonitorInterface Signal: rid_m15
wire [31:0] AxiMonitorInterface_rid_m15;

// Interface: AxiMonitorInterface Signal: rid_m16
wire [31:0] AxiMonitorInterface_rid_m16;

// Interface: AxiMonitorInterface Signal: rid_m17
wire [31:0] AxiMonitorInterface_rid_m17;

// Interface: AxiMonitorInterface Signal: rid_m18
wire [31:0] AxiMonitorInterface_rid_m18;

// Interface: AxiMonitorInterface Signal: rid_m19
wire [31:0] AxiMonitorInterface_rid_m19;

// Interface: AxiMonitorInterface Signal: rid_m20
wire [31:0] AxiMonitorInterface_rid_m20;

// Interface: AxiMonitorInterface Signal: rid_m21
wire [31:0] AxiMonitorInterface_rid_m21;

// Interface: AxiMonitorInterface Signal: rid_m22
wire [31:0] AxiMonitorInterface_rid_m22;

// Interface: AxiMonitorInterface Signal: rid_m23
wire [31:0] AxiMonitorInterface_rid_m23;

// Interface: AxiMonitorInterface Signal: rid_m24
wire [31:0] AxiMonitorInterface_rid_m24;

// Interface: AxiMonitorInterface Signal: rid_m25
wire [31:0] AxiMonitorInterface_rid_m25;

// Interface: AxiMonitorInterface Signal: rid_m26
wire [31:0] AxiMonitorInterface_rid_m26;

// Interface: AxiMonitorInterface Signal: rid_m27
wire [31:0] AxiMonitorInterface_rid_m27;

// Interface: AxiMonitorInterface Signal: rid_m28
wire [31:0] AxiMonitorInterface_rid_m28;

// Interface: AxiMonitorInterface Signal: rid_m29
wire [31:0] AxiMonitorInterface_rid_m29;

// Interface: AxiMonitorInterface Signal: rid_m30
wire [31:0] AxiMonitorInterface_rid_m30;

// Interface: AxiMonitorInterface Signal: rid_m31
wire [31:0] AxiMonitorInterface_rid_m31;

// Interface: AxiMonitorInterface Signal: rready_m0
wire AxiMonitorInterface_rready_m0;

// Interface: AxiMonitorInterface Signal: rready_m1
wire AxiMonitorInterface_rready_m1;

// Interface: AxiMonitorInterface Signal: rready_m2
wire AxiMonitorInterface_rready_m2;

// Interface: AxiMonitorInterface Signal: rready_m3
wire AxiMonitorInterface_rready_m3;

// Interface: AxiMonitorInterface Signal: rready_m4
wire AxiMonitorInterface_rready_m4;

// Interface: AxiMonitorInterface Signal: rready_m5
wire AxiMonitorInterface_rready_m5;

// Interface: AxiMonitorInterface Signal: rready_m6
wire AxiMonitorInterface_rready_m6;

// Interface: AxiMonitorInterface Signal: rready_m7
wire AxiMonitorInterface_rready_m7;

// Interface: AxiMonitorInterface Signal: rready_m8
wire AxiMonitorInterface_rready_m8;

// Interface: AxiMonitorInterface Signal: rready_m9
wire AxiMonitorInterface_rready_m9;

// Interface: AxiMonitorInterface Signal: rready_m10
wire AxiMonitorInterface_rready_m10;

// Interface: AxiMonitorInterface Signal: rready_m11
wire AxiMonitorInterface_rready_m11;

// Interface: AxiMonitorInterface Signal: rready_m12
wire AxiMonitorInterface_rready_m12;

// Interface: AxiMonitorInterface Signal: rready_m13
wire AxiMonitorInterface_rready_m13;

// Interface: AxiMonitorInterface Signal: rready_m14
wire AxiMonitorInterface_rready_m14;

// Interface: AxiMonitorInterface Signal: rready_m15
wire AxiMonitorInterface_rready_m15;

// Interface: AxiMonitorInterface Signal: rready_m16
wire AxiMonitorInterface_rready_m16;

// Interface: AxiMonitorInterface Signal: rready_m17
wire AxiMonitorInterface_rready_m17;

// Interface: AxiMonitorInterface Signal: rready_m18
wire AxiMonitorInterface_rready_m18;

// Interface: AxiMonitorInterface Signal: rready_m19
wire AxiMonitorInterface_rready_m19;

// Interface: AxiMonitorInterface Signal: rready_m20
wire AxiMonitorInterface_rready_m20;

// Interface: AxiMonitorInterface Signal: rready_m21
wire AxiMonitorInterface_rready_m21;

// Interface: AxiMonitorInterface Signal: rready_m22
wire AxiMonitorInterface_rready_m22;

// Interface: AxiMonitorInterface Signal: rready_m23
wire AxiMonitorInterface_rready_m23;

// Interface: AxiMonitorInterface Signal: rready_m24
wire AxiMonitorInterface_rready_m24;

// Interface: AxiMonitorInterface Signal: rready_m25
wire AxiMonitorInterface_rready_m25;

// Interface: AxiMonitorInterface Signal: rready_m26
wire AxiMonitorInterface_rready_m26;

// Interface: AxiMonitorInterface Signal: rready_m27
wire AxiMonitorInterface_rready_m27;

// Interface: AxiMonitorInterface Signal: rready_m28
wire AxiMonitorInterface_rready_m28;

// Interface: AxiMonitorInterface Signal: rready_m29
wire AxiMonitorInterface_rready_m29;

// Interface: AxiMonitorInterface Signal: rready_m30
wire AxiMonitorInterface_rready_m30;

// Interface: AxiMonitorInterface Signal: rready_m31
wire AxiMonitorInterface_rready_m31;

// Interface: AxiMonitorInterface Signal: rsideband_m0
wire [63:0] AxiMonitorInterface_rsideband_m0;

// Interface: AxiMonitorInterface Signal: rsideband_m1
wire [63:0] AxiMonitorInterface_rsideband_m1;

// Interface: AxiMonitorInterface Signal: rsideband_m2
wire [63:0] AxiMonitorInterface_rsideband_m2;

// Interface: AxiMonitorInterface Signal: rsideband_m3
wire [63:0] AxiMonitorInterface_rsideband_m3;

// Interface: AxiMonitorInterface Signal: rsideband_m4
wire [63:0] AxiMonitorInterface_rsideband_m4;

// Interface: AxiMonitorInterface Signal: rsideband_m5
wire [63:0] AxiMonitorInterface_rsideband_m5;

// Interface: AxiMonitorInterface Signal: rsideband_m6
wire [63:0] AxiMonitorInterface_rsideband_m6;

// Interface: AxiMonitorInterface Signal: rsideband_m7
wire [63:0] AxiMonitorInterface_rsideband_m7;

// Interface: AxiMonitorInterface Signal: rsideband_m8
wire [63:0] AxiMonitorInterface_rsideband_m8;

// Interface: AxiMonitorInterface Signal: rsideband_m9
wire [63:0] AxiMonitorInterface_rsideband_m9;

// Interface: AxiMonitorInterface Signal: rsideband_m10
wire [63:0] AxiMonitorInterface_rsideband_m10;

// Interface: AxiMonitorInterface Signal: rsideband_m11
wire [63:0] AxiMonitorInterface_rsideband_m11;

// Interface: AxiMonitorInterface Signal: rsideband_m12
wire [63:0] AxiMonitorInterface_rsideband_m12;

// Interface: AxiMonitorInterface Signal: rsideband_m13
wire [63:0] AxiMonitorInterface_rsideband_m13;

// Interface: AxiMonitorInterface Signal: rsideband_m14
wire [63:0] AxiMonitorInterface_rsideband_m14;

// Interface: AxiMonitorInterface Signal: rsideband_m15
wire [63:0] AxiMonitorInterface_rsideband_m15;

// Interface: AxiMonitorInterface Signal: rsideband_m16
wire [63:0] AxiMonitorInterface_rsideband_m16;

// Interface: AxiMonitorInterface Signal: rsideband_m17
wire [63:0] AxiMonitorInterface_rsideband_m17;

// Interface: AxiMonitorInterface Signal: rsideband_m18
wire [63:0] AxiMonitorInterface_rsideband_m18;

// Interface: AxiMonitorInterface Signal: rsideband_m19
wire [63:0] AxiMonitorInterface_rsideband_m19;

// Interface: AxiMonitorInterface Signal: rsideband_m20
wire [63:0] AxiMonitorInterface_rsideband_m20;

// Interface: AxiMonitorInterface Signal: rsideband_m21
wire [63:0] AxiMonitorInterface_rsideband_m21;

// Interface: AxiMonitorInterface Signal: rsideband_m22
wire [63:0] AxiMonitorInterface_rsideband_m22;

// Interface: AxiMonitorInterface Signal: rsideband_m23
wire [63:0] AxiMonitorInterface_rsideband_m23;

// Interface: AxiMonitorInterface Signal: rsideband_m24
wire [63:0] AxiMonitorInterface_rsideband_m24;

// Interface: AxiMonitorInterface Signal: rsideband_m25
wire [63:0] AxiMonitorInterface_rsideband_m25;

// Interface: AxiMonitorInterface Signal: rsideband_m26
wire [63:0] AxiMonitorInterface_rsideband_m26;

// Interface: AxiMonitorInterface Signal: rsideband_m27
wire [63:0] AxiMonitorInterface_rsideband_m27;

// Interface: AxiMonitorInterface Signal: rsideband_m28
wire [63:0] AxiMonitorInterface_rsideband_m28;

// Interface: AxiMonitorInterface Signal: rsideband_m29
wire [63:0] AxiMonitorInterface_rsideband_m29;

// Interface: AxiMonitorInterface Signal: rsideband_m30
wire [63:0] AxiMonitorInterface_rsideband_m30;

// Interface: AxiMonitorInterface Signal: rsideband_m31
wire [63:0] AxiMonitorInterface_rsideband_m31;

// Interface: AxiMonitorInterface Signal: wvalid_m0
wire AxiMonitorInterface_wvalid_m0;

// Interface: AxiMonitorInterface Signal: wvalid_m1
wire AxiMonitorInterface_wvalid_m1;

// Interface: AxiMonitorInterface Signal: wvalid_m2
wire AxiMonitorInterface_wvalid_m2;

// Interface: AxiMonitorInterface Signal: wvalid_m3
wire AxiMonitorInterface_wvalid_m3;

// Interface: AxiMonitorInterface Signal: wvalid_m4
wire AxiMonitorInterface_wvalid_m4;

// Interface: AxiMonitorInterface Signal: wvalid_m5
wire AxiMonitorInterface_wvalid_m5;

// Interface: AxiMonitorInterface Signal: wvalid_m6
wire AxiMonitorInterface_wvalid_m6;

// Interface: AxiMonitorInterface Signal: wvalid_m7
wire AxiMonitorInterface_wvalid_m7;

// Interface: AxiMonitorInterface Signal: wvalid_m8
wire AxiMonitorInterface_wvalid_m8;

// Interface: AxiMonitorInterface Signal: wvalid_m9
wire AxiMonitorInterface_wvalid_m9;

// Interface: AxiMonitorInterface Signal: wvalid_m10
wire AxiMonitorInterface_wvalid_m10;

// Interface: AxiMonitorInterface Signal: wvalid_m11
wire AxiMonitorInterface_wvalid_m11;

// Interface: AxiMonitorInterface Signal: wvalid_m12
wire AxiMonitorInterface_wvalid_m12;

// Interface: AxiMonitorInterface Signal: wvalid_m13
wire AxiMonitorInterface_wvalid_m13;

// Interface: AxiMonitorInterface Signal: wvalid_m14
wire AxiMonitorInterface_wvalid_m14;

// Interface: AxiMonitorInterface Signal: wvalid_m15
wire AxiMonitorInterface_wvalid_m15;

// Interface: AxiMonitorInterface Signal: wvalid_m16
wire AxiMonitorInterface_wvalid_m16;

// Interface: AxiMonitorInterface Signal: wvalid_m17
wire AxiMonitorInterface_wvalid_m17;

// Interface: AxiMonitorInterface Signal: wvalid_m18
wire AxiMonitorInterface_wvalid_m18;

// Interface: AxiMonitorInterface Signal: wvalid_m19
wire AxiMonitorInterface_wvalid_m19;

// Interface: AxiMonitorInterface Signal: wvalid_m20
wire AxiMonitorInterface_wvalid_m20;

// Interface: AxiMonitorInterface Signal: wvalid_m21
wire AxiMonitorInterface_wvalid_m21;

// Interface: AxiMonitorInterface Signal: wvalid_m22
wire AxiMonitorInterface_wvalid_m22;

// Interface: AxiMonitorInterface Signal: wvalid_m23
wire AxiMonitorInterface_wvalid_m23;

// Interface: AxiMonitorInterface Signal: wvalid_m24
wire AxiMonitorInterface_wvalid_m24;

// Interface: AxiMonitorInterface Signal: wvalid_m25
wire AxiMonitorInterface_wvalid_m25;

// Interface: AxiMonitorInterface Signal: wvalid_m26
wire AxiMonitorInterface_wvalid_m26;

// Interface: AxiMonitorInterface Signal: wvalid_m27
wire AxiMonitorInterface_wvalid_m27;

// Interface: AxiMonitorInterface Signal: wvalid_m28
wire AxiMonitorInterface_wvalid_m28;

// Interface: AxiMonitorInterface Signal: wvalid_m29
wire AxiMonitorInterface_wvalid_m29;

// Interface: AxiMonitorInterface Signal: wvalid_m30
wire AxiMonitorInterface_wvalid_m30;

// Interface: AxiMonitorInterface Signal: wvalid_m31
wire AxiMonitorInterface_wvalid_m31;

// Interface: AxiMonitorInterface Signal: wlast_m0
wire AxiMonitorInterface_wlast_m0;

// Interface: AxiMonitorInterface Signal: wlast_m1
wire AxiMonitorInterface_wlast_m1;

// Interface: AxiMonitorInterface Signal: wlast_m2
wire AxiMonitorInterface_wlast_m2;

// Interface: AxiMonitorInterface Signal: wlast_m3
wire AxiMonitorInterface_wlast_m3;

// Interface: AxiMonitorInterface Signal: wlast_m4
wire AxiMonitorInterface_wlast_m4;

// Interface: AxiMonitorInterface Signal: wlast_m5
wire AxiMonitorInterface_wlast_m5;

// Interface: AxiMonitorInterface Signal: wlast_m6
wire AxiMonitorInterface_wlast_m6;

// Interface: AxiMonitorInterface Signal: wlast_m7
wire AxiMonitorInterface_wlast_m7;

// Interface: AxiMonitorInterface Signal: wlast_m8
wire AxiMonitorInterface_wlast_m8;

// Interface: AxiMonitorInterface Signal: wlast_m9
wire AxiMonitorInterface_wlast_m9;

// Interface: AxiMonitorInterface Signal: wlast_m10
wire AxiMonitorInterface_wlast_m10;

// Interface: AxiMonitorInterface Signal: wlast_m11
wire AxiMonitorInterface_wlast_m11;

// Interface: AxiMonitorInterface Signal: wlast_m12
wire AxiMonitorInterface_wlast_m12;

// Interface: AxiMonitorInterface Signal: wlast_m13
wire AxiMonitorInterface_wlast_m13;

// Interface: AxiMonitorInterface Signal: wlast_m14
wire AxiMonitorInterface_wlast_m14;

// Interface: AxiMonitorInterface Signal: wlast_m15
wire AxiMonitorInterface_wlast_m15;

// Interface: AxiMonitorInterface Signal: wlast_m16
wire AxiMonitorInterface_wlast_m16;

// Interface: AxiMonitorInterface Signal: wlast_m17
wire AxiMonitorInterface_wlast_m17;

// Interface: AxiMonitorInterface Signal: wlast_m18
wire AxiMonitorInterface_wlast_m18;

// Interface: AxiMonitorInterface Signal: wlast_m19
wire AxiMonitorInterface_wlast_m19;

// Interface: AxiMonitorInterface Signal: wlast_m20
wire AxiMonitorInterface_wlast_m20;

// Interface: AxiMonitorInterface Signal: wlast_m21
wire AxiMonitorInterface_wlast_m21;

// Interface: AxiMonitorInterface Signal: wlast_m22
wire AxiMonitorInterface_wlast_m22;

// Interface: AxiMonitorInterface Signal: wlast_m23
wire AxiMonitorInterface_wlast_m23;

// Interface: AxiMonitorInterface Signal: wlast_m24
wire AxiMonitorInterface_wlast_m24;

// Interface: AxiMonitorInterface Signal: wlast_m25
wire AxiMonitorInterface_wlast_m25;

// Interface: AxiMonitorInterface Signal: wlast_m26
wire AxiMonitorInterface_wlast_m26;

// Interface: AxiMonitorInterface Signal: wlast_m27
wire AxiMonitorInterface_wlast_m27;

// Interface: AxiMonitorInterface Signal: wlast_m28
wire AxiMonitorInterface_wlast_m28;

// Interface: AxiMonitorInterface Signal: wlast_m29
wire AxiMonitorInterface_wlast_m29;

// Interface: AxiMonitorInterface Signal: wlast_m30
wire AxiMonitorInterface_wlast_m30;

// Interface: AxiMonitorInterface Signal: wlast_m31
wire AxiMonitorInterface_wlast_m31;

// Interface: AxiMonitorInterface Signal: wdata_m0
wire [1023:0] AxiMonitorInterface_wdata_m0;

// Interface: AxiMonitorInterface Signal: wdata_m1
wire [1023:0] AxiMonitorInterface_wdata_m1;

// Interface: AxiMonitorInterface Signal: wdata_m2
wire [1023:0] AxiMonitorInterface_wdata_m2;

// Interface: AxiMonitorInterface Signal: wdata_m3
wire [1023:0] AxiMonitorInterface_wdata_m3;

// Interface: AxiMonitorInterface Signal: wdata_m4
wire [1023:0] AxiMonitorInterface_wdata_m4;

// Interface: AxiMonitorInterface Signal: wdata_m5
wire [1023:0] AxiMonitorInterface_wdata_m5;

// Interface: AxiMonitorInterface Signal: wdata_m6
wire [1023:0] AxiMonitorInterface_wdata_m6;

// Interface: AxiMonitorInterface Signal: wdata_m7
wire [1023:0] AxiMonitorInterface_wdata_m7;

// Interface: AxiMonitorInterface Signal: wdata_m8
wire [1023:0] AxiMonitorInterface_wdata_m8;

// Interface: AxiMonitorInterface Signal: wdata_m9
wire [1023:0] AxiMonitorInterface_wdata_m9;

// Interface: AxiMonitorInterface Signal: wdata_m10
wire [1023:0] AxiMonitorInterface_wdata_m10;

// Interface: AxiMonitorInterface Signal: wdata_m11
wire [1023:0] AxiMonitorInterface_wdata_m11;

// Interface: AxiMonitorInterface Signal: wdata_m12
wire [1023:0] AxiMonitorInterface_wdata_m12;

// Interface: AxiMonitorInterface Signal: wdata_m13
wire [1023:0] AxiMonitorInterface_wdata_m13;

// Interface: AxiMonitorInterface Signal: wdata_m14
wire [1023:0] AxiMonitorInterface_wdata_m14;

// Interface: AxiMonitorInterface Signal: wdata_m15
wire [1023:0] AxiMonitorInterface_wdata_m15;

// Interface: AxiMonitorInterface Signal: wdata_m16
wire [1023:0] AxiMonitorInterface_wdata_m16;

// Interface: AxiMonitorInterface Signal: wdata_m17
wire [1023:0] AxiMonitorInterface_wdata_m17;

// Interface: AxiMonitorInterface Signal: wdata_m18
wire [1023:0] AxiMonitorInterface_wdata_m18;

// Interface: AxiMonitorInterface Signal: wdata_m19
wire [1023:0] AxiMonitorInterface_wdata_m19;

// Interface: AxiMonitorInterface Signal: wdata_m20
wire [1023:0] AxiMonitorInterface_wdata_m20;

// Interface: AxiMonitorInterface Signal: wdata_m21
wire [1023:0] AxiMonitorInterface_wdata_m21;

// Interface: AxiMonitorInterface Signal: wdata_m22
wire [1023:0] AxiMonitorInterface_wdata_m22;

// Interface: AxiMonitorInterface Signal: wdata_m23
wire [1023:0] AxiMonitorInterface_wdata_m23;

// Interface: AxiMonitorInterface Signal: wdata_m24
wire [1023:0] AxiMonitorInterface_wdata_m24;

// Interface: AxiMonitorInterface Signal: wdata_m25
wire [1023:0] AxiMonitorInterface_wdata_m25;

// Interface: AxiMonitorInterface Signal: wdata_m26
wire [1023:0] AxiMonitorInterface_wdata_m26;

// Interface: AxiMonitorInterface Signal: wdata_m27
wire [1023:0] AxiMonitorInterface_wdata_m27;

// Interface: AxiMonitorInterface Signal: wdata_m28
wire [1023:0] AxiMonitorInterface_wdata_m28;

// Interface: AxiMonitorInterface Signal: wdata_m29
wire [1023:0] AxiMonitorInterface_wdata_m29;

// Interface: AxiMonitorInterface Signal: wdata_m30
wire [1023:0] AxiMonitorInterface_wdata_m30;

// Interface: AxiMonitorInterface Signal: wdata_m31
wire [1023:0] AxiMonitorInterface_wdata_m31;

// Interface: AxiMonitorInterface Signal: wstrb_m0
wire [127:0] AxiMonitorInterface_wstrb_m0;

// Interface: AxiMonitorInterface Signal: wstrb_m1
wire [127:0] AxiMonitorInterface_wstrb_m1;

// Interface: AxiMonitorInterface Signal: wstrb_m2
wire [127:0] AxiMonitorInterface_wstrb_m2;

// Interface: AxiMonitorInterface Signal: wstrb_m3
wire [127:0] AxiMonitorInterface_wstrb_m3;

// Interface: AxiMonitorInterface Signal: wstrb_m4
wire [127:0] AxiMonitorInterface_wstrb_m4;

// Interface: AxiMonitorInterface Signal: wstrb_m5
wire [127:0] AxiMonitorInterface_wstrb_m5;

// Interface: AxiMonitorInterface Signal: wstrb_m6
wire [127:0] AxiMonitorInterface_wstrb_m6;

// Interface: AxiMonitorInterface Signal: wstrb_m7
wire [127:0] AxiMonitorInterface_wstrb_m7;

// Interface: AxiMonitorInterface Signal: wstrb_m8
wire [127:0] AxiMonitorInterface_wstrb_m8;

// Interface: AxiMonitorInterface Signal: wstrb_m9
wire [127:0] AxiMonitorInterface_wstrb_m9;

// Interface: AxiMonitorInterface Signal: wstrb_m10
wire [127:0] AxiMonitorInterface_wstrb_m10;

// Interface: AxiMonitorInterface Signal: wstrb_m11
wire [127:0] AxiMonitorInterface_wstrb_m11;

// Interface: AxiMonitorInterface Signal: wstrb_m12
wire [127:0] AxiMonitorInterface_wstrb_m12;

// Interface: AxiMonitorInterface Signal: wstrb_m13
wire [127:0] AxiMonitorInterface_wstrb_m13;

// Interface: AxiMonitorInterface Signal: wstrb_m14
wire [127:0] AxiMonitorInterface_wstrb_m14;

// Interface: AxiMonitorInterface Signal: wstrb_m15
wire [127:0] AxiMonitorInterface_wstrb_m15;

// Interface: AxiMonitorInterface Signal: wstrb_m16
wire [127:0] AxiMonitorInterface_wstrb_m16;

// Interface: AxiMonitorInterface Signal: wstrb_m17
wire [127:0] AxiMonitorInterface_wstrb_m17;

// Interface: AxiMonitorInterface Signal: wstrb_m18
wire [127:0] AxiMonitorInterface_wstrb_m18;

// Interface: AxiMonitorInterface Signal: wstrb_m19
wire [127:0] AxiMonitorInterface_wstrb_m19;

// Interface: AxiMonitorInterface Signal: wstrb_m20
wire [127:0] AxiMonitorInterface_wstrb_m20;

// Interface: AxiMonitorInterface Signal: wstrb_m21
wire [127:0] AxiMonitorInterface_wstrb_m21;

// Interface: AxiMonitorInterface Signal: wstrb_m22
wire [127:0] AxiMonitorInterface_wstrb_m22;

// Interface: AxiMonitorInterface Signal: wstrb_m23
wire [127:0] AxiMonitorInterface_wstrb_m23;

// Interface: AxiMonitorInterface Signal: wstrb_m24
wire [127:0] AxiMonitorInterface_wstrb_m24;

// Interface: AxiMonitorInterface Signal: wstrb_m25
wire [127:0] AxiMonitorInterface_wstrb_m25;

// Interface: AxiMonitorInterface Signal: wstrb_m26
wire [127:0] AxiMonitorInterface_wstrb_m26;

// Interface: AxiMonitorInterface Signal: wstrb_m27
wire [127:0] AxiMonitorInterface_wstrb_m27;

// Interface: AxiMonitorInterface Signal: wstrb_m28
wire [127:0] AxiMonitorInterface_wstrb_m28;

// Interface: AxiMonitorInterface Signal: wstrb_m29
wire [127:0] AxiMonitorInterface_wstrb_m29;

// Interface: AxiMonitorInterface Signal: wstrb_m30
wire [127:0] AxiMonitorInterface_wstrb_m30;

// Interface: AxiMonitorInterface Signal: wstrb_m31
wire [127:0] AxiMonitorInterface_wstrb_m31;

// Interface: AxiMonitorInterface Signal: wid_m0
wire [31:0] AxiMonitorInterface_wid_m0;

// Interface: AxiMonitorInterface Signal: wid_m1
wire [31:0] AxiMonitorInterface_wid_m1;

// Interface: AxiMonitorInterface Signal: wid_m2
wire [31:0] AxiMonitorInterface_wid_m2;

// Interface: AxiMonitorInterface Signal: wid_m3
wire [31:0] AxiMonitorInterface_wid_m3;

// Interface: AxiMonitorInterface Signal: wid_m4
wire [31:0] AxiMonitorInterface_wid_m4;

// Interface: AxiMonitorInterface Signal: wid_m5
wire [31:0] AxiMonitorInterface_wid_m5;

// Interface: AxiMonitorInterface Signal: wid_m6
wire [31:0] AxiMonitorInterface_wid_m6;

// Interface: AxiMonitorInterface Signal: wid_m7
wire [31:0] AxiMonitorInterface_wid_m7;

// Interface: AxiMonitorInterface Signal: wid_m8
wire [31:0] AxiMonitorInterface_wid_m8;

// Interface: AxiMonitorInterface Signal: wid_m9
wire [31:0] AxiMonitorInterface_wid_m9;

// Interface: AxiMonitorInterface Signal: wid_m10
wire [31:0] AxiMonitorInterface_wid_m10;

// Interface: AxiMonitorInterface Signal: wid_m11
wire [31:0] AxiMonitorInterface_wid_m11;

// Interface: AxiMonitorInterface Signal: wid_m12
wire [31:0] AxiMonitorInterface_wid_m12;

// Interface: AxiMonitorInterface Signal: wid_m13
wire [31:0] AxiMonitorInterface_wid_m13;

// Interface: AxiMonitorInterface Signal: wid_m14
wire [31:0] AxiMonitorInterface_wid_m14;

// Interface: AxiMonitorInterface Signal: wid_m15
wire [31:0] AxiMonitorInterface_wid_m15;

// Interface: AxiMonitorInterface Signal: wid_m16
wire [31:0] AxiMonitorInterface_wid_m16;

// Interface: AxiMonitorInterface Signal: wid_m17
wire [31:0] AxiMonitorInterface_wid_m17;

// Interface: AxiMonitorInterface Signal: wid_m18
wire [31:0] AxiMonitorInterface_wid_m18;

// Interface: AxiMonitorInterface Signal: wid_m19
wire [31:0] AxiMonitorInterface_wid_m19;

// Interface: AxiMonitorInterface Signal: wid_m20
wire [31:0] AxiMonitorInterface_wid_m20;

// Interface: AxiMonitorInterface Signal: wid_m21
wire [31:0] AxiMonitorInterface_wid_m21;

// Interface: AxiMonitorInterface Signal: wid_m22
wire [31:0] AxiMonitorInterface_wid_m22;

// Interface: AxiMonitorInterface Signal: wid_m23
wire [31:0] AxiMonitorInterface_wid_m23;

// Interface: AxiMonitorInterface Signal: wid_m24
wire [31:0] AxiMonitorInterface_wid_m24;

// Interface: AxiMonitorInterface Signal: wid_m25
wire [31:0] AxiMonitorInterface_wid_m25;

// Interface: AxiMonitorInterface Signal: wid_m26
wire [31:0] AxiMonitorInterface_wid_m26;

// Interface: AxiMonitorInterface Signal: wid_m27
wire [31:0] AxiMonitorInterface_wid_m27;

// Interface: AxiMonitorInterface Signal: wid_m28
wire [31:0] AxiMonitorInterface_wid_m28;

// Interface: AxiMonitorInterface Signal: wid_m29
wire [31:0] AxiMonitorInterface_wid_m29;

// Interface: AxiMonitorInterface Signal: wid_m30
wire [31:0] AxiMonitorInterface_wid_m30;

// Interface: AxiMonitorInterface Signal: wid_m31
wire [31:0] AxiMonitorInterface_wid_m31;

// Interface: AxiMonitorInterface Signal: wready_m0
wire AxiMonitorInterface_wready_m0;

// Interface: AxiMonitorInterface Signal: wready_m1
wire AxiMonitorInterface_wready_m1;

// Interface: AxiMonitorInterface Signal: wready_m2
wire AxiMonitorInterface_wready_m2;

// Interface: AxiMonitorInterface Signal: wready_m3
wire AxiMonitorInterface_wready_m3;

// Interface: AxiMonitorInterface Signal: wready_m4
wire AxiMonitorInterface_wready_m4;

// Interface: AxiMonitorInterface Signal: wready_m5
wire AxiMonitorInterface_wready_m5;

// Interface: AxiMonitorInterface Signal: wready_m6
wire AxiMonitorInterface_wready_m6;

// Interface: AxiMonitorInterface Signal: wready_m7
wire AxiMonitorInterface_wready_m7;

// Interface: AxiMonitorInterface Signal: wready_m8
wire AxiMonitorInterface_wready_m8;

// Interface: AxiMonitorInterface Signal: wready_m9
wire AxiMonitorInterface_wready_m9;

// Interface: AxiMonitorInterface Signal: wready_m10
wire AxiMonitorInterface_wready_m10;

// Interface: AxiMonitorInterface Signal: wready_m11
wire AxiMonitorInterface_wready_m11;

// Interface: AxiMonitorInterface Signal: wready_m12
wire AxiMonitorInterface_wready_m12;

// Interface: AxiMonitorInterface Signal: wready_m13
wire AxiMonitorInterface_wready_m13;

// Interface: AxiMonitorInterface Signal: wready_m14
wire AxiMonitorInterface_wready_m14;

// Interface: AxiMonitorInterface Signal: wready_m15
wire AxiMonitorInterface_wready_m15;

// Interface: AxiMonitorInterface Signal: wready_m16
wire AxiMonitorInterface_wready_m16;

// Interface: AxiMonitorInterface Signal: wready_m17
wire AxiMonitorInterface_wready_m17;

// Interface: AxiMonitorInterface Signal: wready_m18
wire AxiMonitorInterface_wready_m18;

// Interface: AxiMonitorInterface Signal: wready_m19
wire AxiMonitorInterface_wready_m19;

// Interface: AxiMonitorInterface Signal: wready_m20
wire AxiMonitorInterface_wready_m20;

// Interface: AxiMonitorInterface Signal: wready_m21
wire AxiMonitorInterface_wready_m21;

// Interface: AxiMonitorInterface Signal: wready_m22
wire AxiMonitorInterface_wready_m22;

// Interface: AxiMonitorInterface Signal: wready_m23
wire AxiMonitorInterface_wready_m23;

// Interface: AxiMonitorInterface Signal: wready_m24
wire AxiMonitorInterface_wready_m24;

// Interface: AxiMonitorInterface Signal: wready_m25
wire AxiMonitorInterface_wready_m25;

// Interface: AxiMonitorInterface Signal: wready_m26
wire AxiMonitorInterface_wready_m26;

// Interface: AxiMonitorInterface Signal: wready_m27
wire AxiMonitorInterface_wready_m27;

// Interface: AxiMonitorInterface Signal: wready_m28
wire AxiMonitorInterface_wready_m28;

// Interface: AxiMonitorInterface Signal: wready_m29
wire AxiMonitorInterface_wready_m29;

// Interface: AxiMonitorInterface Signal: wready_m30
wire AxiMonitorInterface_wready_m30;

// Interface: AxiMonitorInterface Signal: wready_m31
wire AxiMonitorInterface_wready_m31;

// Interface: AxiMonitorInterface Signal: wsideband_m0
wire [63:0] AxiMonitorInterface_wsideband_m0;

// Interface: AxiMonitorInterface Signal: wsideband_m1
wire [63:0] AxiMonitorInterface_wsideband_m1;

// Interface: AxiMonitorInterface Signal: wsideband_m2
wire [63:0] AxiMonitorInterface_wsideband_m2;

// Interface: AxiMonitorInterface Signal: wsideband_m3
wire [63:0] AxiMonitorInterface_wsideband_m3;

// Interface: AxiMonitorInterface Signal: wsideband_m4
wire [63:0] AxiMonitorInterface_wsideband_m4;

// Interface: AxiMonitorInterface Signal: wsideband_m5
wire [63:0] AxiMonitorInterface_wsideband_m5;

// Interface: AxiMonitorInterface Signal: wsideband_m6
wire [63:0] AxiMonitorInterface_wsideband_m6;

// Interface: AxiMonitorInterface Signal: wsideband_m7
wire [63:0] AxiMonitorInterface_wsideband_m7;

// Interface: AxiMonitorInterface Signal: wsideband_m8
wire [63:0] AxiMonitorInterface_wsideband_m8;

// Interface: AxiMonitorInterface Signal: wsideband_m9
wire [63:0] AxiMonitorInterface_wsideband_m9;

// Interface: AxiMonitorInterface Signal: wsideband_m10
wire [63:0] AxiMonitorInterface_wsideband_m10;

// Interface: AxiMonitorInterface Signal: wsideband_m11
wire [63:0] AxiMonitorInterface_wsideband_m11;

// Interface: AxiMonitorInterface Signal: wsideband_m12
wire [63:0] AxiMonitorInterface_wsideband_m12;

// Interface: AxiMonitorInterface Signal: wsideband_m13
wire [63:0] AxiMonitorInterface_wsideband_m13;

// Interface: AxiMonitorInterface Signal: wsideband_m14
wire [63:0] AxiMonitorInterface_wsideband_m14;

// Interface: AxiMonitorInterface Signal: wsideband_m15
wire [63:0] AxiMonitorInterface_wsideband_m15;

// Interface: AxiMonitorInterface Signal: wsideband_m16
wire [63:0] AxiMonitorInterface_wsideband_m16;

// Interface: AxiMonitorInterface Signal: wsideband_m17
wire [63:0] AxiMonitorInterface_wsideband_m17;

// Interface: AxiMonitorInterface Signal: wsideband_m18
wire [63:0] AxiMonitorInterface_wsideband_m18;

// Interface: AxiMonitorInterface Signal: wsideband_m19
wire [63:0] AxiMonitorInterface_wsideband_m19;

// Interface: AxiMonitorInterface Signal: wsideband_m20
wire [63:0] AxiMonitorInterface_wsideband_m20;

// Interface: AxiMonitorInterface Signal: wsideband_m21
wire [63:0] AxiMonitorInterface_wsideband_m21;

// Interface: AxiMonitorInterface Signal: wsideband_m22
wire [63:0] AxiMonitorInterface_wsideband_m22;

// Interface: AxiMonitorInterface Signal: wsideband_m23
wire [63:0] AxiMonitorInterface_wsideband_m23;

// Interface: AxiMonitorInterface Signal: wsideband_m24
wire [63:0] AxiMonitorInterface_wsideband_m24;

// Interface: AxiMonitorInterface Signal: wsideband_m25
wire [63:0] AxiMonitorInterface_wsideband_m25;

// Interface: AxiMonitorInterface Signal: wsideband_m26
wire [63:0] AxiMonitorInterface_wsideband_m26;

// Interface: AxiMonitorInterface Signal: wsideband_m27
wire [63:0] AxiMonitorInterface_wsideband_m27;

// Interface: AxiMonitorInterface Signal: wsideband_m28
wire [63:0] AxiMonitorInterface_wsideband_m28;

// Interface: AxiMonitorInterface Signal: wsideband_m29
wire [63:0] AxiMonitorInterface_wsideband_m29;

// Interface: AxiMonitorInterface Signal: wsideband_m30
wire [63:0] AxiMonitorInterface_wsideband_m30;

// Interface: AxiMonitorInterface Signal: wsideband_m31
wire [63:0] AxiMonitorInterface_wsideband_m31;

// Interface: AxiMonitorInterface Signal: bvalid_m0
wire AxiMonitorInterface_bvalid_m0;

// Interface: AxiMonitorInterface Signal: bvalid_m1
wire AxiMonitorInterface_bvalid_m1;

// Interface: AxiMonitorInterface Signal: bvalid_m2
wire AxiMonitorInterface_bvalid_m2;

// Interface: AxiMonitorInterface Signal: bvalid_m3
wire AxiMonitorInterface_bvalid_m3;

// Interface: AxiMonitorInterface Signal: bvalid_m4
wire AxiMonitorInterface_bvalid_m4;

// Interface: AxiMonitorInterface Signal: bvalid_m5
wire AxiMonitorInterface_bvalid_m5;

// Interface: AxiMonitorInterface Signal: bvalid_m6
wire AxiMonitorInterface_bvalid_m6;

// Interface: AxiMonitorInterface Signal: bvalid_m7
wire AxiMonitorInterface_bvalid_m7;

// Interface: AxiMonitorInterface Signal: bvalid_m8
wire AxiMonitorInterface_bvalid_m8;

// Interface: AxiMonitorInterface Signal: bvalid_m9
wire AxiMonitorInterface_bvalid_m9;

// Interface: AxiMonitorInterface Signal: bvalid_m10
wire AxiMonitorInterface_bvalid_m10;

// Interface: AxiMonitorInterface Signal: bvalid_m11
wire AxiMonitorInterface_bvalid_m11;

// Interface: AxiMonitorInterface Signal: bvalid_m12
wire AxiMonitorInterface_bvalid_m12;

// Interface: AxiMonitorInterface Signal: bvalid_m13
wire AxiMonitorInterface_bvalid_m13;

// Interface: AxiMonitorInterface Signal: bvalid_m14
wire AxiMonitorInterface_bvalid_m14;

// Interface: AxiMonitorInterface Signal: bvalid_m15
wire AxiMonitorInterface_bvalid_m15;

// Interface: AxiMonitorInterface Signal: bvalid_m16
wire AxiMonitorInterface_bvalid_m16;

// Interface: AxiMonitorInterface Signal: bvalid_m17
wire AxiMonitorInterface_bvalid_m17;

// Interface: AxiMonitorInterface Signal: bvalid_m18
wire AxiMonitorInterface_bvalid_m18;

// Interface: AxiMonitorInterface Signal: bvalid_m19
wire AxiMonitorInterface_bvalid_m19;

// Interface: AxiMonitorInterface Signal: bvalid_m20
wire AxiMonitorInterface_bvalid_m20;

// Interface: AxiMonitorInterface Signal: bvalid_m21
wire AxiMonitorInterface_bvalid_m21;

// Interface: AxiMonitorInterface Signal: bvalid_m22
wire AxiMonitorInterface_bvalid_m22;

// Interface: AxiMonitorInterface Signal: bvalid_m23
wire AxiMonitorInterface_bvalid_m23;

// Interface: AxiMonitorInterface Signal: bvalid_m24
wire AxiMonitorInterface_bvalid_m24;

// Interface: AxiMonitorInterface Signal: bvalid_m25
wire AxiMonitorInterface_bvalid_m25;

// Interface: AxiMonitorInterface Signal: bvalid_m26
wire AxiMonitorInterface_bvalid_m26;

// Interface: AxiMonitorInterface Signal: bvalid_m27
wire AxiMonitorInterface_bvalid_m27;

// Interface: AxiMonitorInterface Signal: bvalid_m28
wire AxiMonitorInterface_bvalid_m28;

// Interface: AxiMonitorInterface Signal: bvalid_m29
wire AxiMonitorInterface_bvalid_m29;

// Interface: AxiMonitorInterface Signal: bvalid_m30
wire AxiMonitorInterface_bvalid_m30;

// Interface: AxiMonitorInterface Signal: bvalid_m31
wire AxiMonitorInterface_bvalid_m31;

// Interface: AxiMonitorInterface Signal: bresp_m0
wire [1:0] AxiMonitorInterface_bresp_m0;

// Interface: AxiMonitorInterface Signal: bresp_m1
wire [1:0] AxiMonitorInterface_bresp_m1;

// Interface: AxiMonitorInterface Signal: bresp_m2
wire [1:0] AxiMonitorInterface_bresp_m2;

// Interface: AxiMonitorInterface Signal: bresp_m3
wire [1:0] AxiMonitorInterface_bresp_m3;

// Interface: AxiMonitorInterface Signal: bresp_m4
wire [1:0] AxiMonitorInterface_bresp_m4;

// Interface: AxiMonitorInterface Signal: bresp_m5
wire [1:0] AxiMonitorInterface_bresp_m5;

// Interface: AxiMonitorInterface Signal: bresp_m6
wire [1:0] AxiMonitorInterface_bresp_m6;

// Interface: AxiMonitorInterface Signal: bresp_m7
wire [1:0] AxiMonitorInterface_bresp_m7;

// Interface: AxiMonitorInterface Signal: bresp_m8
wire [1:0] AxiMonitorInterface_bresp_m8;

// Interface: AxiMonitorInterface Signal: bresp_m9
wire [1:0] AxiMonitorInterface_bresp_m9;

// Interface: AxiMonitorInterface Signal: bresp_m10
wire [1:0] AxiMonitorInterface_bresp_m10;

// Interface: AxiMonitorInterface Signal: bresp_m11
wire [1:0] AxiMonitorInterface_bresp_m11;

// Interface: AxiMonitorInterface Signal: bresp_m12
wire [1:0] AxiMonitorInterface_bresp_m12;

// Interface: AxiMonitorInterface Signal: bresp_m13
wire [1:0] AxiMonitorInterface_bresp_m13;

// Interface: AxiMonitorInterface Signal: bresp_m14
wire [1:0] AxiMonitorInterface_bresp_m14;

// Interface: AxiMonitorInterface Signal: bresp_m15
wire [1:0] AxiMonitorInterface_bresp_m15;

// Interface: AxiMonitorInterface Signal: bresp_m16
wire [1:0] AxiMonitorInterface_bresp_m16;

// Interface: AxiMonitorInterface Signal: bresp_m17
wire [1:0] AxiMonitorInterface_bresp_m17;

// Interface: AxiMonitorInterface Signal: bresp_m18
wire [1:0] AxiMonitorInterface_bresp_m18;

// Interface: AxiMonitorInterface Signal: bresp_m19
wire [1:0] AxiMonitorInterface_bresp_m19;

// Interface: AxiMonitorInterface Signal: bresp_m20
wire [1:0] AxiMonitorInterface_bresp_m20;

// Interface: AxiMonitorInterface Signal: bresp_m21
wire [1:0] AxiMonitorInterface_bresp_m21;

// Interface: AxiMonitorInterface Signal: bresp_m22
wire [1:0] AxiMonitorInterface_bresp_m22;

// Interface: AxiMonitorInterface Signal: bresp_m23
wire [1:0] AxiMonitorInterface_bresp_m23;

// Interface: AxiMonitorInterface Signal: bresp_m24
wire [1:0] AxiMonitorInterface_bresp_m24;

// Interface: AxiMonitorInterface Signal: bresp_m25
wire [1:0] AxiMonitorInterface_bresp_m25;

// Interface: AxiMonitorInterface Signal: bresp_m26
wire [1:0] AxiMonitorInterface_bresp_m26;

// Interface: AxiMonitorInterface Signal: bresp_m27
wire [1:0] AxiMonitorInterface_bresp_m27;

// Interface: AxiMonitorInterface Signal: bresp_m28
wire [1:0] AxiMonitorInterface_bresp_m28;

// Interface: AxiMonitorInterface Signal: bresp_m29
wire [1:0] AxiMonitorInterface_bresp_m29;

// Interface: AxiMonitorInterface Signal: bresp_m30
wire [1:0] AxiMonitorInterface_bresp_m30;

// Interface: AxiMonitorInterface Signal: bresp_m31
wire [1:0] AxiMonitorInterface_bresp_m31;

// Interface: AxiMonitorInterface Signal: bid_m0
wire [31:0] AxiMonitorInterface_bid_m0;

// Interface: AxiMonitorInterface Signal: bid_m1
wire [31:0] AxiMonitorInterface_bid_m1;

// Interface: AxiMonitorInterface Signal: bid_m2
wire [31:0] AxiMonitorInterface_bid_m2;

// Interface: AxiMonitorInterface Signal: bid_m3
wire [31:0] AxiMonitorInterface_bid_m3;

// Interface: AxiMonitorInterface Signal: bid_m4
wire [31:0] AxiMonitorInterface_bid_m4;

// Interface: AxiMonitorInterface Signal: bid_m5
wire [31:0] AxiMonitorInterface_bid_m5;

// Interface: AxiMonitorInterface Signal: bid_m6
wire [31:0] AxiMonitorInterface_bid_m6;

// Interface: AxiMonitorInterface Signal: bid_m7
wire [31:0] AxiMonitorInterface_bid_m7;

// Interface: AxiMonitorInterface Signal: bid_m8
wire [31:0] AxiMonitorInterface_bid_m8;

// Interface: AxiMonitorInterface Signal: bid_m9
wire [31:0] AxiMonitorInterface_bid_m9;

// Interface: AxiMonitorInterface Signal: bid_m10
wire [31:0] AxiMonitorInterface_bid_m10;

// Interface: AxiMonitorInterface Signal: bid_m11
wire [31:0] AxiMonitorInterface_bid_m11;

// Interface: AxiMonitorInterface Signal: bid_m12
wire [31:0] AxiMonitorInterface_bid_m12;

// Interface: AxiMonitorInterface Signal: bid_m13
wire [31:0] AxiMonitorInterface_bid_m13;

// Interface: AxiMonitorInterface Signal: bid_m14
wire [31:0] AxiMonitorInterface_bid_m14;

// Interface: AxiMonitorInterface Signal: bid_m15
wire [31:0] AxiMonitorInterface_bid_m15;

// Interface: AxiMonitorInterface Signal: bid_m16
wire [31:0] AxiMonitorInterface_bid_m16;

// Interface: AxiMonitorInterface Signal: bid_m17
wire [31:0] AxiMonitorInterface_bid_m17;

// Interface: AxiMonitorInterface Signal: bid_m18
wire [31:0] AxiMonitorInterface_bid_m18;

// Interface: AxiMonitorInterface Signal: bid_m19
wire [31:0] AxiMonitorInterface_bid_m19;

// Interface: AxiMonitorInterface Signal: bid_m20
wire [31:0] AxiMonitorInterface_bid_m20;

// Interface: AxiMonitorInterface Signal: bid_m21
wire [31:0] AxiMonitorInterface_bid_m21;

// Interface: AxiMonitorInterface Signal: bid_m22
wire [31:0] AxiMonitorInterface_bid_m22;

// Interface: AxiMonitorInterface Signal: bid_m23
wire [31:0] AxiMonitorInterface_bid_m23;

// Interface: AxiMonitorInterface Signal: bid_m24
wire [31:0] AxiMonitorInterface_bid_m24;

// Interface: AxiMonitorInterface Signal: bid_m25
wire [31:0] AxiMonitorInterface_bid_m25;

// Interface: AxiMonitorInterface Signal: bid_m26
wire [31:0] AxiMonitorInterface_bid_m26;

// Interface: AxiMonitorInterface Signal: bid_m27
wire [31:0] AxiMonitorInterface_bid_m27;

// Interface: AxiMonitorInterface Signal: bid_m28
wire [31:0] AxiMonitorInterface_bid_m28;

// Interface: AxiMonitorInterface Signal: bid_m29
wire [31:0] AxiMonitorInterface_bid_m29;

// Interface: AxiMonitorInterface Signal: bid_m30
wire [31:0] AxiMonitorInterface_bid_m30;

// Interface: AxiMonitorInterface Signal: bid_m31
wire [31:0] AxiMonitorInterface_bid_m31;

// Interface: AxiMonitorInterface Signal: bready_m0
wire AxiMonitorInterface_bready_m0;

// Interface: AxiMonitorInterface Signal: bready_m1
wire AxiMonitorInterface_bready_m1;

// Interface: AxiMonitorInterface Signal: bready_m2
wire AxiMonitorInterface_bready_m2;

// Interface: AxiMonitorInterface Signal: bready_m3
wire AxiMonitorInterface_bready_m3;

// Interface: AxiMonitorInterface Signal: bready_m4
wire AxiMonitorInterface_bready_m4;

// Interface: AxiMonitorInterface Signal: bready_m5
wire AxiMonitorInterface_bready_m5;

// Interface: AxiMonitorInterface Signal: bready_m6
wire AxiMonitorInterface_bready_m6;

// Interface: AxiMonitorInterface Signal: bready_m7
wire AxiMonitorInterface_bready_m7;

// Interface: AxiMonitorInterface Signal: bready_m8
wire AxiMonitorInterface_bready_m8;

// Interface: AxiMonitorInterface Signal: bready_m9
wire AxiMonitorInterface_bready_m9;

// Interface: AxiMonitorInterface Signal: bready_m10
wire AxiMonitorInterface_bready_m10;

// Interface: AxiMonitorInterface Signal: bready_m11
wire AxiMonitorInterface_bready_m11;

// Interface: AxiMonitorInterface Signal: bready_m12
wire AxiMonitorInterface_bready_m12;

// Interface: AxiMonitorInterface Signal: bready_m13
wire AxiMonitorInterface_bready_m13;

// Interface: AxiMonitorInterface Signal: bready_m14
wire AxiMonitorInterface_bready_m14;

// Interface: AxiMonitorInterface Signal: bready_m15
wire AxiMonitorInterface_bready_m15;

// Interface: AxiMonitorInterface Signal: bready_m16
wire AxiMonitorInterface_bready_m16;

// Interface: AxiMonitorInterface Signal: bready_m17
wire AxiMonitorInterface_bready_m17;

// Interface: AxiMonitorInterface Signal: bready_m18
wire AxiMonitorInterface_bready_m18;

// Interface: AxiMonitorInterface Signal: bready_m19
wire AxiMonitorInterface_bready_m19;

// Interface: AxiMonitorInterface Signal: bready_m20
wire AxiMonitorInterface_bready_m20;

// Interface: AxiMonitorInterface Signal: bready_m21
wire AxiMonitorInterface_bready_m21;

// Interface: AxiMonitorInterface Signal: bready_m22
wire AxiMonitorInterface_bready_m22;

// Interface: AxiMonitorInterface Signal: bready_m23
wire AxiMonitorInterface_bready_m23;

// Interface: AxiMonitorInterface Signal: bready_m24
wire AxiMonitorInterface_bready_m24;

// Interface: AxiMonitorInterface Signal: bready_m25
wire AxiMonitorInterface_bready_m25;

// Interface: AxiMonitorInterface Signal: bready_m26
wire AxiMonitorInterface_bready_m26;

// Interface: AxiMonitorInterface Signal: bready_m27
wire AxiMonitorInterface_bready_m27;

// Interface: AxiMonitorInterface Signal: bready_m28
wire AxiMonitorInterface_bready_m28;

// Interface: AxiMonitorInterface Signal: bready_m29
wire AxiMonitorInterface_bready_m29;

// Interface: AxiMonitorInterface Signal: bready_m30
wire AxiMonitorInterface_bready_m30;

// Interface: AxiMonitorInterface Signal: bready_m31
wire AxiMonitorInterface_bready_m31;

// Interface: AxiMonitorInterface Signal: bsideband_m0
wire [63:0] AxiMonitorInterface_bsideband_m0;

// Interface: AxiMonitorInterface Signal: bsideband_m1
wire [63:0] AxiMonitorInterface_bsideband_m1;

// Interface: AxiMonitorInterface Signal: bsideband_m2
wire [63:0] AxiMonitorInterface_bsideband_m2;

// Interface: AxiMonitorInterface Signal: bsideband_m3
wire [63:0] AxiMonitorInterface_bsideband_m3;

// Interface: AxiMonitorInterface Signal: bsideband_m4
wire [63:0] AxiMonitorInterface_bsideband_m4;

// Interface: AxiMonitorInterface Signal: bsideband_m5
wire [63:0] AxiMonitorInterface_bsideband_m5;

// Interface: AxiMonitorInterface Signal: bsideband_m6
wire [63:0] AxiMonitorInterface_bsideband_m6;

// Interface: AxiMonitorInterface Signal: bsideband_m7
wire [63:0] AxiMonitorInterface_bsideband_m7;

// Interface: AxiMonitorInterface Signal: bsideband_m8
wire [63:0] AxiMonitorInterface_bsideband_m8;

// Interface: AxiMonitorInterface Signal: bsideband_m9
wire [63:0] AxiMonitorInterface_bsideband_m9;

// Interface: AxiMonitorInterface Signal: bsideband_m10
wire [63:0] AxiMonitorInterface_bsideband_m10;

// Interface: AxiMonitorInterface Signal: bsideband_m11
wire [63:0] AxiMonitorInterface_bsideband_m11;

// Interface: AxiMonitorInterface Signal: bsideband_m12
wire [63:0] AxiMonitorInterface_bsideband_m12;

// Interface: AxiMonitorInterface Signal: bsideband_m13
wire [63:0] AxiMonitorInterface_bsideband_m13;

// Interface: AxiMonitorInterface Signal: bsideband_m14
wire [63:0] AxiMonitorInterface_bsideband_m14;

// Interface: AxiMonitorInterface Signal: bsideband_m15
wire [63:0] AxiMonitorInterface_bsideband_m15;

// Interface: AxiMonitorInterface Signal: bsideband_m16
wire [63:0] AxiMonitorInterface_bsideband_m16;

// Interface: AxiMonitorInterface Signal: bsideband_m17
wire [63:0] AxiMonitorInterface_bsideband_m17;

// Interface: AxiMonitorInterface Signal: bsideband_m18
wire [63:0] AxiMonitorInterface_bsideband_m18;

// Interface: AxiMonitorInterface Signal: bsideband_m19
wire [63:0] AxiMonitorInterface_bsideband_m19;

// Interface: AxiMonitorInterface Signal: bsideband_m20
wire [63:0] AxiMonitorInterface_bsideband_m20;

// Interface: AxiMonitorInterface Signal: bsideband_m21
wire [63:0] AxiMonitorInterface_bsideband_m21;

// Interface: AxiMonitorInterface Signal: bsideband_m22
wire [63:0] AxiMonitorInterface_bsideband_m22;

// Interface: AxiMonitorInterface Signal: bsideband_m23
wire [63:0] AxiMonitorInterface_bsideband_m23;

// Interface: AxiMonitorInterface Signal: bsideband_m24
wire [63:0] AxiMonitorInterface_bsideband_m24;

// Interface: AxiMonitorInterface Signal: bsideband_m25
wire [63:0] AxiMonitorInterface_bsideband_m25;

// Interface: AxiMonitorInterface Signal: bsideband_m26
wire [63:0] AxiMonitorInterface_bsideband_m26;

// Interface: AxiMonitorInterface Signal: bsideband_m27
wire [63:0] AxiMonitorInterface_bsideband_m27;

// Interface: AxiMonitorInterface Signal: bsideband_m28
wire [63:0] AxiMonitorInterface_bsideband_m28;

// Interface: AxiMonitorInterface Signal: bsideband_m29
wire [63:0] AxiMonitorInterface_bsideband_m29;

// Interface: AxiMonitorInterface Signal: bsideband_m30
wire [63:0] AxiMonitorInterface_bsideband_m30;

// Interface: AxiMonitorInterface Signal: bsideband_m31
wire [63:0] AxiMonitorInterface_bsideband_m31;

// Interface: AxiMonitorInterface Signal: cactive_m0
wire AxiMonitorInterface_cactive_m0;

// Interface: AxiMonitorInterface Signal: cactive_m1
wire AxiMonitorInterface_cactive_m1;

// Interface: AxiMonitorInterface Signal: cactive_m2
wire AxiMonitorInterface_cactive_m2;

// Interface: AxiMonitorInterface Signal: cactive_m3
wire AxiMonitorInterface_cactive_m3;

// Interface: AxiMonitorInterface Signal: cactive_m4
wire AxiMonitorInterface_cactive_m4;

// Interface: AxiMonitorInterface Signal: cactive_m5
wire AxiMonitorInterface_cactive_m5;

// Interface: AxiMonitorInterface Signal: cactive_m6
wire AxiMonitorInterface_cactive_m6;

// Interface: AxiMonitorInterface Signal: cactive_m7
wire AxiMonitorInterface_cactive_m7;

// Interface: AxiMonitorInterface Signal: cactive_m8
wire AxiMonitorInterface_cactive_m8;

// Interface: AxiMonitorInterface Signal: cactive_m9
wire AxiMonitorInterface_cactive_m9;

// Interface: AxiMonitorInterface Signal: cactive_m10
wire AxiMonitorInterface_cactive_m10;

// Interface: AxiMonitorInterface Signal: cactive_m11
wire AxiMonitorInterface_cactive_m11;

// Interface: AxiMonitorInterface Signal: cactive_m12
wire AxiMonitorInterface_cactive_m12;

// Interface: AxiMonitorInterface Signal: cactive_m13
wire AxiMonitorInterface_cactive_m13;

// Interface: AxiMonitorInterface Signal: cactive_m14
wire AxiMonitorInterface_cactive_m14;

// Interface: AxiMonitorInterface Signal: cactive_m15
wire AxiMonitorInterface_cactive_m15;

// Interface: AxiMonitorInterface Signal: cactive_m16
wire AxiMonitorInterface_cactive_m16;

// Interface: AxiMonitorInterface Signal: cactive_m17
wire AxiMonitorInterface_cactive_m17;

// Interface: AxiMonitorInterface Signal: cactive_m18
wire AxiMonitorInterface_cactive_m18;

// Interface: AxiMonitorInterface Signal: cactive_m19
wire AxiMonitorInterface_cactive_m19;

// Interface: AxiMonitorInterface Signal: cactive_m20
wire AxiMonitorInterface_cactive_m20;

// Interface: AxiMonitorInterface Signal: cactive_m21
wire AxiMonitorInterface_cactive_m21;

// Interface: AxiMonitorInterface Signal: cactive_m22
wire AxiMonitorInterface_cactive_m22;

// Interface: AxiMonitorInterface Signal: cactive_m23
wire AxiMonitorInterface_cactive_m23;

// Interface: AxiMonitorInterface Signal: cactive_m24
wire AxiMonitorInterface_cactive_m24;

// Interface: AxiMonitorInterface Signal: cactive_m25
wire AxiMonitorInterface_cactive_m25;

// Interface: AxiMonitorInterface Signal: cactive_m26
wire AxiMonitorInterface_cactive_m26;

// Interface: AxiMonitorInterface Signal: cactive_m27
wire AxiMonitorInterface_cactive_m27;

// Interface: AxiMonitorInterface Signal: cactive_m28
wire AxiMonitorInterface_cactive_m28;

// Interface: AxiMonitorInterface Signal: cactive_m29
wire AxiMonitorInterface_cactive_m29;

// Interface: AxiMonitorInterface Signal: cactive_m30
wire AxiMonitorInterface_cactive_m30;

// Interface: AxiMonitorInterface Signal: cactive_m31
wire AxiMonitorInterface_cactive_m31;

// Interface: AxiMonitorInterface Signal: csysreq_m0
wire AxiMonitorInterface_csysreq_m0;

// Interface: AxiMonitorInterface Signal: csysreq_m1
wire AxiMonitorInterface_csysreq_m1;

// Interface: AxiMonitorInterface Signal: csysreq_m2
wire AxiMonitorInterface_csysreq_m2;

// Interface: AxiMonitorInterface Signal: csysreq_m3
wire AxiMonitorInterface_csysreq_m3;

// Interface: AxiMonitorInterface Signal: csysreq_m4
wire AxiMonitorInterface_csysreq_m4;

// Interface: AxiMonitorInterface Signal: csysreq_m5
wire AxiMonitorInterface_csysreq_m5;

// Interface: AxiMonitorInterface Signal: csysreq_m6
wire AxiMonitorInterface_csysreq_m6;

// Interface: AxiMonitorInterface Signal: csysreq_m7
wire AxiMonitorInterface_csysreq_m7;

// Interface: AxiMonitorInterface Signal: csysreq_m8
wire AxiMonitorInterface_csysreq_m8;

// Interface: AxiMonitorInterface Signal: csysreq_m9
wire AxiMonitorInterface_csysreq_m9;

// Interface: AxiMonitorInterface Signal: csysreq_m10
wire AxiMonitorInterface_csysreq_m10;

// Interface: AxiMonitorInterface Signal: csysreq_m11
wire AxiMonitorInterface_csysreq_m11;

// Interface: AxiMonitorInterface Signal: csysreq_m12
wire AxiMonitorInterface_csysreq_m12;

// Interface: AxiMonitorInterface Signal: csysreq_m13
wire AxiMonitorInterface_csysreq_m13;

// Interface: AxiMonitorInterface Signal: csysreq_m14
wire AxiMonitorInterface_csysreq_m14;

// Interface: AxiMonitorInterface Signal: csysreq_m15
wire AxiMonitorInterface_csysreq_m15;

// Interface: AxiMonitorInterface Signal: csysreq_m16
wire AxiMonitorInterface_csysreq_m16;

// Interface: AxiMonitorInterface Signal: csysreq_m17
wire AxiMonitorInterface_csysreq_m17;

// Interface: AxiMonitorInterface Signal: csysreq_m18
wire AxiMonitorInterface_csysreq_m18;

// Interface: AxiMonitorInterface Signal: csysreq_m19
wire AxiMonitorInterface_csysreq_m19;

// Interface: AxiMonitorInterface Signal: csysreq_m20
wire AxiMonitorInterface_csysreq_m20;

// Interface: AxiMonitorInterface Signal: csysreq_m21
wire AxiMonitorInterface_csysreq_m21;

// Interface: AxiMonitorInterface Signal: csysreq_m22
wire AxiMonitorInterface_csysreq_m22;

// Interface: AxiMonitorInterface Signal: csysreq_m23
wire AxiMonitorInterface_csysreq_m23;

// Interface: AxiMonitorInterface Signal: csysreq_m24
wire AxiMonitorInterface_csysreq_m24;

// Interface: AxiMonitorInterface Signal: csysreq_m25
wire AxiMonitorInterface_csysreq_m25;

// Interface: AxiMonitorInterface Signal: csysreq_m26
wire AxiMonitorInterface_csysreq_m26;

// Interface: AxiMonitorInterface Signal: csysreq_m27
wire AxiMonitorInterface_csysreq_m27;

// Interface: AxiMonitorInterface Signal: csysreq_m28
wire AxiMonitorInterface_csysreq_m28;

// Interface: AxiMonitorInterface Signal: csysreq_m29
wire AxiMonitorInterface_csysreq_m29;

// Interface: AxiMonitorInterface Signal: csysreq_m30
wire AxiMonitorInterface_csysreq_m30;

// Interface: AxiMonitorInterface Signal: csysreq_m31
wire AxiMonitorInterface_csysreq_m31;

// Interface: AxiMonitorInterface Signal: csysack_m0
wire AxiMonitorInterface_csysack_m0;

// Interface: AxiMonitorInterface Signal: csysack_m1
wire AxiMonitorInterface_csysack_m1;

// Interface: AxiMonitorInterface Signal: csysack_m2
wire AxiMonitorInterface_csysack_m2;

// Interface: AxiMonitorInterface Signal: csysack_m3
wire AxiMonitorInterface_csysack_m3;

// Interface: AxiMonitorInterface Signal: csysack_m4
wire AxiMonitorInterface_csysack_m4;

// Interface: AxiMonitorInterface Signal: csysack_m5
wire AxiMonitorInterface_csysack_m5;

// Interface: AxiMonitorInterface Signal: csysack_m6
wire AxiMonitorInterface_csysack_m6;

// Interface: AxiMonitorInterface Signal: csysack_m7
wire AxiMonitorInterface_csysack_m7;

// Interface: AxiMonitorInterface Signal: csysack_m8
wire AxiMonitorInterface_csysack_m8;

// Interface: AxiMonitorInterface Signal: csysack_m9
wire AxiMonitorInterface_csysack_m9;

// Interface: AxiMonitorInterface Signal: csysack_m10
wire AxiMonitorInterface_csysack_m10;

// Interface: AxiMonitorInterface Signal: csysack_m11
wire AxiMonitorInterface_csysack_m11;

// Interface: AxiMonitorInterface Signal: csysack_m12
wire AxiMonitorInterface_csysack_m12;

// Interface: AxiMonitorInterface Signal: csysack_m13
wire AxiMonitorInterface_csysack_m13;

// Interface: AxiMonitorInterface Signal: csysack_m14
wire AxiMonitorInterface_csysack_m14;

// Interface: AxiMonitorInterface Signal: csysack_m15
wire AxiMonitorInterface_csysack_m15;

// Interface: AxiMonitorInterface Signal: csysack_m16
wire AxiMonitorInterface_csysack_m16;

// Interface: AxiMonitorInterface Signal: csysack_m17
wire AxiMonitorInterface_csysack_m17;

// Interface: AxiMonitorInterface Signal: csysack_m18
wire AxiMonitorInterface_csysack_m18;

// Interface: AxiMonitorInterface Signal: csysack_m19
wire AxiMonitorInterface_csysack_m19;

// Interface: AxiMonitorInterface Signal: csysack_m20
wire AxiMonitorInterface_csysack_m20;

// Interface: AxiMonitorInterface Signal: csysack_m21
wire AxiMonitorInterface_csysack_m21;

// Interface: AxiMonitorInterface Signal: csysack_m22
wire AxiMonitorInterface_csysack_m22;

// Interface: AxiMonitorInterface Signal: csysack_m23
wire AxiMonitorInterface_csysack_m23;

// Interface: AxiMonitorInterface Signal: csysack_m24
wire AxiMonitorInterface_csysack_m24;

// Interface: AxiMonitorInterface Signal: csysack_m25
wire AxiMonitorInterface_csysack_m25;

// Interface: AxiMonitorInterface Signal: csysack_m26
wire AxiMonitorInterface_csysack_m26;

// Interface: AxiMonitorInterface Signal: csysack_m27
wire AxiMonitorInterface_csysack_m27;

// Interface: AxiMonitorInterface Signal: csysack_m28
wire AxiMonitorInterface_csysack_m28;

// Interface: AxiMonitorInterface Signal: csysack_m29
wire AxiMonitorInterface_csysack_m29;

// Interface: AxiMonitorInterface Signal: csysack_m30
wire AxiMonitorInterface_csysack_m30;

// Interface: AxiMonitorInterface Signal: csysack_m31
wire AxiMonitorInterface_csysack_m31;

// Interface: AxiMonitorInterface Signal: arvalid_s0
wire AxiMonitorInterface_arvalid_s0;

// Interface: AxiMonitorInterface Signal: arvalid_s1
wire AxiMonitorInterface_arvalid_s1;

// Interface: AxiMonitorInterface Signal: arvalid_s2
wire AxiMonitorInterface_arvalid_s2;

// Interface: AxiMonitorInterface Signal: arvalid_s3
wire AxiMonitorInterface_arvalid_s3;

// Interface: AxiMonitorInterface Signal: arvalid_s4
wire AxiMonitorInterface_arvalid_s4;

// Interface: AxiMonitorInterface Signal: arvalid_s5
wire AxiMonitorInterface_arvalid_s5;

// Interface: AxiMonitorInterface Signal: arvalid_s6
wire AxiMonitorInterface_arvalid_s6;

// Interface: AxiMonitorInterface Signal: arvalid_s7
wire AxiMonitorInterface_arvalid_s7;

// Interface: AxiMonitorInterface Signal: arvalid_s8
wire AxiMonitorInterface_arvalid_s8;

// Interface: AxiMonitorInterface Signal: arvalid_s9
wire AxiMonitorInterface_arvalid_s9;

// Interface: AxiMonitorInterface Signal: arvalid_s10
wire AxiMonitorInterface_arvalid_s10;

// Interface: AxiMonitorInterface Signal: arvalid_s11
wire AxiMonitorInterface_arvalid_s11;

// Interface: AxiMonitorInterface Signal: arvalid_s12
wire AxiMonitorInterface_arvalid_s12;

// Interface: AxiMonitorInterface Signal: arvalid_s13
wire AxiMonitorInterface_arvalid_s13;

// Interface: AxiMonitorInterface Signal: arvalid_s14
wire AxiMonitorInterface_arvalid_s14;

// Interface: AxiMonitorInterface Signal: arvalid_s15
wire AxiMonitorInterface_arvalid_s15;

// Interface: AxiMonitorInterface Signal: arvalid_s16
wire AxiMonitorInterface_arvalid_s16;

// Interface: AxiMonitorInterface Signal: arvalid_s17
wire AxiMonitorInterface_arvalid_s17;

// Interface: AxiMonitorInterface Signal: arvalid_s18
wire AxiMonitorInterface_arvalid_s18;

// Interface: AxiMonitorInterface Signal: arvalid_s19
wire AxiMonitorInterface_arvalid_s19;

// Interface: AxiMonitorInterface Signal: arvalid_s20
wire AxiMonitorInterface_arvalid_s20;

// Interface: AxiMonitorInterface Signal: arvalid_s21
wire AxiMonitorInterface_arvalid_s21;

// Interface: AxiMonitorInterface Signal: arvalid_s22
wire AxiMonitorInterface_arvalid_s22;

// Interface: AxiMonitorInterface Signal: arvalid_s23
wire AxiMonitorInterface_arvalid_s23;

// Interface: AxiMonitorInterface Signal: arvalid_s24
wire AxiMonitorInterface_arvalid_s24;

// Interface: AxiMonitorInterface Signal: arvalid_s25
wire AxiMonitorInterface_arvalid_s25;

// Interface: AxiMonitorInterface Signal: arvalid_s26
wire AxiMonitorInterface_arvalid_s26;

// Interface: AxiMonitorInterface Signal: arvalid_s27
wire AxiMonitorInterface_arvalid_s27;

// Interface: AxiMonitorInterface Signal: arvalid_s28
wire AxiMonitorInterface_arvalid_s28;

// Interface: AxiMonitorInterface Signal: arvalid_s29
wire AxiMonitorInterface_arvalid_s29;

// Interface: AxiMonitorInterface Signal: arvalid_s30
wire AxiMonitorInterface_arvalid_s30;

// Interface: AxiMonitorInterface Signal: arvalid_s31
wire AxiMonitorInterface_arvalid_s31;

// Interface: AxiMonitorInterface Signal: araddr_s0
wire [63:0] AxiMonitorInterface_araddr_s0;

// Interface: AxiMonitorInterface Signal: araddr_s1
wire [63:0] AxiMonitorInterface_araddr_s1;

// Interface: AxiMonitorInterface Signal: araddr_s2
wire [63:0] AxiMonitorInterface_araddr_s2;

// Interface: AxiMonitorInterface Signal: araddr_s3
wire [63:0] AxiMonitorInterface_araddr_s3;

// Interface: AxiMonitorInterface Signal: araddr_s4
wire [63:0] AxiMonitorInterface_araddr_s4;

// Interface: AxiMonitorInterface Signal: araddr_s5
wire [63:0] AxiMonitorInterface_araddr_s5;

// Interface: AxiMonitorInterface Signal: araddr_s6
wire [63:0] AxiMonitorInterface_araddr_s6;

// Interface: AxiMonitorInterface Signal: araddr_s7
wire [63:0] AxiMonitorInterface_araddr_s7;

// Interface: AxiMonitorInterface Signal: araddr_s8
wire [63:0] AxiMonitorInterface_araddr_s8;

// Interface: AxiMonitorInterface Signal: araddr_s9
wire [63:0] AxiMonitorInterface_araddr_s9;

// Interface: AxiMonitorInterface Signal: araddr_s10
wire [63:0] AxiMonitorInterface_araddr_s10;

// Interface: AxiMonitorInterface Signal: araddr_s11
wire [63:0] AxiMonitorInterface_araddr_s11;

// Interface: AxiMonitorInterface Signal: araddr_s12
wire [63:0] AxiMonitorInterface_araddr_s12;

// Interface: AxiMonitorInterface Signal: araddr_s13
wire [63:0] AxiMonitorInterface_araddr_s13;

// Interface: AxiMonitorInterface Signal: araddr_s14
wire [63:0] AxiMonitorInterface_araddr_s14;

// Interface: AxiMonitorInterface Signal: araddr_s15
wire [63:0] AxiMonitorInterface_araddr_s15;

// Interface: AxiMonitorInterface Signal: araddr_s16
wire [63:0] AxiMonitorInterface_araddr_s16;

// Interface: AxiMonitorInterface Signal: araddr_s17
wire [63:0] AxiMonitorInterface_araddr_s17;

// Interface: AxiMonitorInterface Signal: araddr_s18
wire [63:0] AxiMonitorInterface_araddr_s18;

// Interface: AxiMonitorInterface Signal: araddr_s19
wire [63:0] AxiMonitorInterface_araddr_s19;

// Interface: AxiMonitorInterface Signal: araddr_s20
wire [63:0] AxiMonitorInterface_araddr_s20;

// Interface: AxiMonitorInterface Signal: araddr_s21
wire [63:0] AxiMonitorInterface_araddr_s21;

// Interface: AxiMonitorInterface Signal: araddr_s22
wire [63:0] AxiMonitorInterface_araddr_s22;

// Interface: AxiMonitorInterface Signal: araddr_s23
wire [63:0] AxiMonitorInterface_araddr_s23;

// Interface: AxiMonitorInterface Signal: araddr_s24
wire [63:0] AxiMonitorInterface_araddr_s24;

// Interface: AxiMonitorInterface Signal: araddr_s25
wire [63:0] AxiMonitorInterface_araddr_s25;

// Interface: AxiMonitorInterface Signal: araddr_s26
wire [63:0] AxiMonitorInterface_araddr_s26;

// Interface: AxiMonitorInterface Signal: araddr_s27
wire [63:0] AxiMonitorInterface_araddr_s27;

// Interface: AxiMonitorInterface Signal: araddr_s28
wire [63:0] AxiMonitorInterface_araddr_s28;

// Interface: AxiMonitorInterface Signal: araddr_s29
wire [63:0] AxiMonitorInterface_araddr_s29;

// Interface: AxiMonitorInterface Signal: araddr_s30
wire [63:0] AxiMonitorInterface_araddr_s30;

// Interface: AxiMonitorInterface Signal: araddr_s31
wire [63:0] AxiMonitorInterface_araddr_s31;

// Interface: AxiMonitorInterface Signal: arlen_s0
wire [9:0] AxiMonitorInterface_arlen_s0;

// Interface: AxiMonitorInterface Signal: arlen_s1
wire [9:0] AxiMonitorInterface_arlen_s1;

// Interface: AxiMonitorInterface Signal: arlen_s2
wire [9:0] AxiMonitorInterface_arlen_s2;

// Interface: AxiMonitorInterface Signal: arlen_s3
wire [9:0] AxiMonitorInterface_arlen_s3;

// Interface: AxiMonitorInterface Signal: arlen_s4
wire [9:0] AxiMonitorInterface_arlen_s4;

// Interface: AxiMonitorInterface Signal: arlen_s5
wire [9:0] AxiMonitorInterface_arlen_s5;

// Interface: AxiMonitorInterface Signal: arlen_s6
wire [9:0] AxiMonitorInterface_arlen_s6;

// Interface: AxiMonitorInterface Signal: arlen_s7
wire [9:0] AxiMonitorInterface_arlen_s7;

// Interface: AxiMonitorInterface Signal: arlen_s8
wire [9:0] AxiMonitorInterface_arlen_s8;

// Interface: AxiMonitorInterface Signal: arlen_s9
wire [9:0] AxiMonitorInterface_arlen_s9;

// Interface: AxiMonitorInterface Signal: arlen_s10
wire [9:0] AxiMonitorInterface_arlen_s10;

// Interface: AxiMonitorInterface Signal: arlen_s11
wire [9:0] AxiMonitorInterface_arlen_s11;

// Interface: AxiMonitorInterface Signal: arlen_s12
wire [9:0] AxiMonitorInterface_arlen_s12;

// Interface: AxiMonitorInterface Signal: arlen_s13
wire [9:0] AxiMonitorInterface_arlen_s13;

// Interface: AxiMonitorInterface Signal: arlen_s14
wire [9:0] AxiMonitorInterface_arlen_s14;

// Interface: AxiMonitorInterface Signal: arlen_s15
wire [9:0] AxiMonitorInterface_arlen_s15;

// Interface: AxiMonitorInterface Signal: arlen_s16
wire [9:0] AxiMonitorInterface_arlen_s16;

// Interface: AxiMonitorInterface Signal: arlen_s17
wire [9:0] AxiMonitorInterface_arlen_s17;

// Interface: AxiMonitorInterface Signal: arlen_s18
wire [9:0] AxiMonitorInterface_arlen_s18;

// Interface: AxiMonitorInterface Signal: arlen_s19
wire [9:0] AxiMonitorInterface_arlen_s19;

// Interface: AxiMonitorInterface Signal: arlen_s20
wire [9:0] AxiMonitorInterface_arlen_s20;

// Interface: AxiMonitorInterface Signal: arlen_s21
wire [9:0] AxiMonitorInterface_arlen_s21;

// Interface: AxiMonitorInterface Signal: arlen_s22
wire [9:0] AxiMonitorInterface_arlen_s22;

// Interface: AxiMonitorInterface Signal: arlen_s23
wire [9:0] AxiMonitorInterface_arlen_s23;

// Interface: AxiMonitorInterface Signal: arlen_s24
wire [9:0] AxiMonitorInterface_arlen_s24;

// Interface: AxiMonitorInterface Signal: arlen_s25
wire [9:0] AxiMonitorInterface_arlen_s25;

// Interface: AxiMonitorInterface Signal: arlen_s26
wire [9:0] AxiMonitorInterface_arlen_s26;

// Interface: AxiMonitorInterface Signal: arlen_s27
wire [9:0] AxiMonitorInterface_arlen_s27;

// Interface: AxiMonitorInterface Signal: arlen_s28
wire [9:0] AxiMonitorInterface_arlen_s28;

// Interface: AxiMonitorInterface Signal: arlen_s29
wire [9:0] AxiMonitorInterface_arlen_s29;

// Interface: AxiMonitorInterface Signal: arlen_s30
wire [9:0] AxiMonitorInterface_arlen_s30;

// Interface: AxiMonitorInterface Signal: arlen_s31
wire [9:0] AxiMonitorInterface_arlen_s31;

// Interface: AxiMonitorInterface Signal: arsize_s0
wire [2:0] AxiMonitorInterface_arsize_s0;

// Interface: AxiMonitorInterface Signal: arsize_s1
wire [2:0] AxiMonitorInterface_arsize_s1;

// Interface: AxiMonitorInterface Signal: arsize_s2
wire [2:0] AxiMonitorInterface_arsize_s2;

// Interface: AxiMonitorInterface Signal: arsize_s3
wire [2:0] AxiMonitorInterface_arsize_s3;

// Interface: AxiMonitorInterface Signal: arsize_s4
wire [2:0] AxiMonitorInterface_arsize_s4;

// Interface: AxiMonitorInterface Signal: arsize_s5
wire [2:0] AxiMonitorInterface_arsize_s5;

// Interface: AxiMonitorInterface Signal: arsize_s6
wire [2:0] AxiMonitorInterface_arsize_s6;

// Interface: AxiMonitorInterface Signal: arsize_s7
wire [2:0] AxiMonitorInterface_arsize_s7;

// Interface: AxiMonitorInterface Signal: arsize_s8
wire [2:0] AxiMonitorInterface_arsize_s8;

// Interface: AxiMonitorInterface Signal: arsize_s9
wire [2:0] AxiMonitorInterface_arsize_s9;

// Interface: AxiMonitorInterface Signal: arsize_s10
wire [2:0] AxiMonitorInterface_arsize_s10;

// Interface: AxiMonitorInterface Signal: arsize_s11
wire [2:0] AxiMonitorInterface_arsize_s11;

// Interface: AxiMonitorInterface Signal: arsize_s12
wire [2:0] AxiMonitorInterface_arsize_s12;

// Interface: AxiMonitorInterface Signal: arsize_s13
wire [2:0] AxiMonitorInterface_arsize_s13;

// Interface: AxiMonitorInterface Signal: arsize_s14
wire [2:0] AxiMonitorInterface_arsize_s14;

// Interface: AxiMonitorInterface Signal: arsize_s15
wire [2:0] AxiMonitorInterface_arsize_s15;

// Interface: AxiMonitorInterface Signal: arsize_s16
wire [2:0] AxiMonitorInterface_arsize_s16;

// Interface: AxiMonitorInterface Signal: arsize_s17
wire [2:0] AxiMonitorInterface_arsize_s17;

// Interface: AxiMonitorInterface Signal: arsize_s18
wire [2:0] AxiMonitorInterface_arsize_s18;

// Interface: AxiMonitorInterface Signal: arsize_s19
wire [2:0] AxiMonitorInterface_arsize_s19;

// Interface: AxiMonitorInterface Signal: arsize_s20
wire [2:0] AxiMonitorInterface_arsize_s20;

// Interface: AxiMonitorInterface Signal: arsize_s21
wire [2:0] AxiMonitorInterface_arsize_s21;

// Interface: AxiMonitorInterface Signal: arsize_s22
wire [2:0] AxiMonitorInterface_arsize_s22;

// Interface: AxiMonitorInterface Signal: arsize_s23
wire [2:0] AxiMonitorInterface_arsize_s23;

// Interface: AxiMonitorInterface Signal: arsize_s24
wire [2:0] AxiMonitorInterface_arsize_s24;

// Interface: AxiMonitorInterface Signal: arsize_s25
wire [2:0] AxiMonitorInterface_arsize_s25;

// Interface: AxiMonitorInterface Signal: arsize_s26
wire [2:0] AxiMonitorInterface_arsize_s26;

// Interface: AxiMonitorInterface Signal: arsize_s27
wire [2:0] AxiMonitorInterface_arsize_s27;

// Interface: AxiMonitorInterface Signal: arsize_s28
wire [2:0] AxiMonitorInterface_arsize_s28;

// Interface: AxiMonitorInterface Signal: arsize_s29
wire [2:0] AxiMonitorInterface_arsize_s29;

// Interface: AxiMonitorInterface Signal: arsize_s30
wire [2:0] AxiMonitorInterface_arsize_s30;

// Interface: AxiMonitorInterface Signal: arsize_s31
wire [2:0] AxiMonitorInterface_arsize_s31;

// Interface: AxiMonitorInterface Signal: arburst_s0
wire [1:0] AxiMonitorInterface_arburst_s0;

// Interface: AxiMonitorInterface Signal: arburst_s1
wire [1:0] AxiMonitorInterface_arburst_s1;

// Interface: AxiMonitorInterface Signal: arburst_s2
wire [1:0] AxiMonitorInterface_arburst_s2;

// Interface: AxiMonitorInterface Signal: arburst_s3
wire [1:0] AxiMonitorInterface_arburst_s3;

// Interface: AxiMonitorInterface Signal: arburst_s4
wire [1:0] AxiMonitorInterface_arburst_s4;

// Interface: AxiMonitorInterface Signal: arburst_s5
wire [1:0] AxiMonitorInterface_arburst_s5;

// Interface: AxiMonitorInterface Signal: arburst_s6
wire [1:0] AxiMonitorInterface_arburst_s6;

// Interface: AxiMonitorInterface Signal: arburst_s7
wire [1:0] AxiMonitorInterface_arburst_s7;

// Interface: AxiMonitorInterface Signal: arburst_s8
wire [1:0] AxiMonitorInterface_arburst_s8;

// Interface: AxiMonitorInterface Signal: arburst_s9
wire [1:0] AxiMonitorInterface_arburst_s9;

// Interface: AxiMonitorInterface Signal: arburst_s10
wire [1:0] AxiMonitorInterface_arburst_s10;

// Interface: AxiMonitorInterface Signal: arburst_s11
wire [1:0] AxiMonitorInterface_arburst_s11;

// Interface: AxiMonitorInterface Signal: arburst_s12
wire [1:0] AxiMonitorInterface_arburst_s12;

// Interface: AxiMonitorInterface Signal: arburst_s13
wire [1:0] AxiMonitorInterface_arburst_s13;

// Interface: AxiMonitorInterface Signal: arburst_s14
wire [1:0] AxiMonitorInterface_arburst_s14;

// Interface: AxiMonitorInterface Signal: arburst_s15
wire [1:0] AxiMonitorInterface_arburst_s15;

// Interface: AxiMonitorInterface Signal: arburst_s16
wire [1:0] AxiMonitorInterface_arburst_s16;

// Interface: AxiMonitorInterface Signal: arburst_s17
wire [1:0] AxiMonitorInterface_arburst_s17;

// Interface: AxiMonitorInterface Signal: arburst_s18
wire [1:0] AxiMonitorInterface_arburst_s18;

// Interface: AxiMonitorInterface Signal: arburst_s19
wire [1:0] AxiMonitorInterface_arburst_s19;

// Interface: AxiMonitorInterface Signal: arburst_s20
wire [1:0] AxiMonitorInterface_arburst_s20;

// Interface: AxiMonitorInterface Signal: arburst_s21
wire [1:0] AxiMonitorInterface_arburst_s21;

// Interface: AxiMonitorInterface Signal: arburst_s22
wire [1:0] AxiMonitorInterface_arburst_s22;

// Interface: AxiMonitorInterface Signal: arburst_s23
wire [1:0] AxiMonitorInterface_arburst_s23;

// Interface: AxiMonitorInterface Signal: arburst_s24
wire [1:0] AxiMonitorInterface_arburst_s24;

// Interface: AxiMonitorInterface Signal: arburst_s25
wire [1:0] AxiMonitorInterface_arburst_s25;

// Interface: AxiMonitorInterface Signal: arburst_s26
wire [1:0] AxiMonitorInterface_arburst_s26;

// Interface: AxiMonitorInterface Signal: arburst_s27
wire [1:0] AxiMonitorInterface_arburst_s27;

// Interface: AxiMonitorInterface Signal: arburst_s28
wire [1:0] AxiMonitorInterface_arburst_s28;

// Interface: AxiMonitorInterface Signal: arburst_s29
wire [1:0] AxiMonitorInterface_arburst_s29;

// Interface: AxiMonitorInterface Signal: arburst_s30
wire [1:0] AxiMonitorInterface_arburst_s30;

// Interface: AxiMonitorInterface Signal: arburst_s31
wire [1:0] AxiMonitorInterface_arburst_s31;

// Interface: AxiMonitorInterface Signal: arlock_s0
wire [1:0] AxiMonitorInterface_arlock_s0;

// Interface: AxiMonitorInterface Signal: arlock_s1
wire [1:0] AxiMonitorInterface_arlock_s1;

// Interface: AxiMonitorInterface Signal: arlock_s2
wire [1:0] AxiMonitorInterface_arlock_s2;

// Interface: AxiMonitorInterface Signal: arlock_s3
wire [1:0] AxiMonitorInterface_arlock_s3;

// Interface: AxiMonitorInterface Signal: arlock_s4
wire [1:0] AxiMonitorInterface_arlock_s4;

// Interface: AxiMonitorInterface Signal: arlock_s5
wire [1:0] AxiMonitorInterface_arlock_s5;

// Interface: AxiMonitorInterface Signal: arlock_s6
wire [1:0] AxiMonitorInterface_arlock_s6;

// Interface: AxiMonitorInterface Signal: arlock_s7
wire [1:0] AxiMonitorInterface_arlock_s7;

// Interface: AxiMonitorInterface Signal: arlock_s8
wire [1:0] AxiMonitorInterface_arlock_s8;

// Interface: AxiMonitorInterface Signal: arlock_s9
wire [1:0] AxiMonitorInterface_arlock_s9;

// Interface: AxiMonitorInterface Signal: arlock_s10
wire [1:0] AxiMonitorInterface_arlock_s10;

// Interface: AxiMonitorInterface Signal: arlock_s11
wire [1:0] AxiMonitorInterface_arlock_s11;

// Interface: AxiMonitorInterface Signal: arlock_s12
wire [1:0] AxiMonitorInterface_arlock_s12;

// Interface: AxiMonitorInterface Signal: arlock_s13
wire [1:0] AxiMonitorInterface_arlock_s13;

// Interface: AxiMonitorInterface Signal: arlock_s14
wire [1:0] AxiMonitorInterface_arlock_s14;

// Interface: AxiMonitorInterface Signal: arlock_s15
wire [1:0] AxiMonitorInterface_arlock_s15;

// Interface: AxiMonitorInterface Signal: arlock_s16
wire [1:0] AxiMonitorInterface_arlock_s16;

// Interface: AxiMonitorInterface Signal: arlock_s17
wire [1:0] AxiMonitorInterface_arlock_s17;

// Interface: AxiMonitorInterface Signal: arlock_s18
wire [1:0] AxiMonitorInterface_arlock_s18;

// Interface: AxiMonitorInterface Signal: arlock_s19
wire [1:0] AxiMonitorInterface_arlock_s19;

// Interface: AxiMonitorInterface Signal: arlock_s20
wire [1:0] AxiMonitorInterface_arlock_s20;

// Interface: AxiMonitorInterface Signal: arlock_s21
wire [1:0] AxiMonitorInterface_arlock_s21;

// Interface: AxiMonitorInterface Signal: arlock_s22
wire [1:0] AxiMonitorInterface_arlock_s22;

// Interface: AxiMonitorInterface Signal: arlock_s23
wire [1:0] AxiMonitorInterface_arlock_s23;

// Interface: AxiMonitorInterface Signal: arlock_s24
wire [1:0] AxiMonitorInterface_arlock_s24;

// Interface: AxiMonitorInterface Signal: arlock_s25
wire [1:0] AxiMonitorInterface_arlock_s25;

// Interface: AxiMonitorInterface Signal: arlock_s26
wire [1:0] AxiMonitorInterface_arlock_s26;

// Interface: AxiMonitorInterface Signal: arlock_s27
wire [1:0] AxiMonitorInterface_arlock_s27;

// Interface: AxiMonitorInterface Signal: arlock_s28
wire [1:0] AxiMonitorInterface_arlock_s28;

// Interface: AxiMonitorInterface Signal: arlock_s29
wire [1:0] AxiMonitorInterface_arlock_s29;

// Interface: AxiMonitorInterface Signal: arlock_s30
wire [1:0] AxiMonitorInterface_arlock_s30;

// Interface: AxiMonitorInterface Signal: arlock_s31
wire [1:0] AxiMonitorInterface_arlock_s31;

// Interface: AxiMonitorInterface Signal: arcache_s0
wire [3:0] AxiMonitorInterface_arcache_s0;

// Interface: AxiMonitorInterface Signal: arcache_s1
wire [3:0] AxiMonitorInterface_arcache_s1;

// Interface: AxiMonitorInterface Signal: arcache_s2
wire [3:0] AxiMonitorInterface_arcache_s2;

// Interface: AxiMonitorInterface Signal: arcache_s3
wire [3:0] AxiMonitorInterface_arcache_s3;

// Interface: AxiMonitorInterface Signal: arcache_s4
wire [3:0] AxiMonitorInterface_arcache_s4;

// Interface: AxiMonitorInterface Signal: arcache_s5
wire [3:0] AxiMonitorInterface_arcache_s5;

// Interface: AxiMonitorInterface Signal: arcache_s6
wire [3:0] AxiMonitorInterface_arcache_s6;

// Interface: AxiMonitorInterface Signal: arcache_s7
wire [3:0] AxiMonitorInterface_arcache_s7;

// Interface: AxiMonitorInterface Signal: arcache_s8
wire [3:0] AxiMonitorInterface_arcache_s8;

// Interface: AxiMonitorInterface Signal: arcache_s9
wire [3:0] AxiMonitorInterface_arcache_s9;

// Interface: AxiMonitorInterface Signal: arcache_s10
wire [3:0] AxiMonitorInterface_arcache_s10;

// Interface: AxiMonitorInterface Signal: arcache_s11
wire [3:0] AxiMonitorInterface_arcache_s11;

// Interface: AxiMonitorInterface Signal: arcache_s12
wire [3:0] AxiMonitorInterface_arcache_s12;

// Interface: AxiMonitorInterface Signal: arcache_s13
wire [3:0] AxiMonitorInterface_arcache_s13;

// Interface: AxiMonitorInterface Signal: arcache_s14
wire [3:0] AxiMonitorInterface_arcache_s14;

// Interface: AxiMonitorInterface Signal: arcache_s15
wire [3:0] AxiMonitorInterface_arcache_s15;

// Interface: AxiMonitorInterface Signal: arcache_s16
wire [3:0] AxiMonitorInterface_arcache_s16;

// Interface: AxiMonitorInterface Signal: arcache_s17
wire [3:0] AxiMonitorInterface_arcache_s17;

// Interface: AxiMonitorInterface Signal: arcache_s18
wire [3:0] AxiMonitorInterface_arcache_s18;

// Interface: AxiMonitorInterface Signal: arcache_s19
wire [3:0] AxiMonitorInterface_arcache_s19;

// Interface: AxiMonitorInterface Signal: arcache_s20
wire [3:0] AxiMonitorInterface_arcache_s20;

// Interface: AxiMonitorInterface Signal: arcache_s21
wire [3:0] AxiMonitorInterface_arcache_s21;

// Interface: AxiMonitorInterface Signal: arcache_s22
wire [3:0] AxiMonitorInterface_arcache_s22;

// Interface: AxiMonitorInterface Signal: arcache_s23
wire [3:0] AxiMonitorInterface_arcache_s23;

// Interface: AxiMonitorInterface Signal: arcache_s24
wire [3:0] AxiMonitorInterface_arcache_s24;

// Interface: AxiMonitorInterface Signal: arcache_s25
wire [3:0] AxiMonitorInterface_arcache_s25;

// Interface: AxiMonitorInterface Signal: arcache_s26
wire [3:0] AxiMonitorInterface_arcache_s26;

// Interface: AxiMonitorInterface Signal: arcache_s27
wire [3:0] AxiMonitorInterface_arcache_s27;

// Interface: AxiMonitorInterface Signal: arcache_s28
wire [3:0] AxiMonitorInterface_arcache_s28;

// Interface: AxiMonitorInterface Signal: arcache_s29
wire [3:0] AxiMonitorInterface_arcache_s29;

// Interface: AxiMonitorInterface Signal: arcache_s30
wire [3:0] AxiMonitorInterface_arcache_s30;

// Interface: AxiMonitorInterface Signal: arcache_s31
wire [3:0] AxiMonitorInterface_arcache_s31;

// Interface: AxiMonitorInterface Signal: arprot_s0
wire [2:0] AxiMonitorInterface_arprot_s0;

// Interface: AxiMonitorInterface Signal: arprot_s1
wire [2:0] AxiMonitorInterface_arprot_s1;

// Interface: AxiMonitorInterface Signal: arprot_s2
wire [2:0] AxiMonitorInterface_arprot_s2;

// Interface: AxiMonitorInterface Signal: arprot_s3
wire [2:0] AxiMonitorInterface_arprot_s3;

// Interface: AxiMonitorInterface Signal: arprot_s4
wire [2:0] AxiMonitorInterface_arprot_s4;

// Interface: AxiMonitorInterface Signal: arprot_s5
wire [2:0] AxiMonitorInterface_arprot_s5;

// Interface: AxiMonitorInterface Signal: arprot_s6
wire [2:0] AxiMonitorInterface_arprot_s6;

// Interface: AxiMonitorInterface Signal: arprot_s7
wire [2:0] AxiMonitorInterface_arprot_s7;

// Interface: AxiMonitorInterface Signal: arprot_s8
wire [2:0] AxiMonitorInterface_arprot_s8;

// Interface: AxiMonitorInterface Signal: arprot_s9
wire [2:0] AxiMonitorInterface_arprot_s9;

// Interface: AxiMonitorInterface Signal: arprot_s10
wire [2:0] AxiMonitorInterface_arprot_s10;

// Interface: AxiMonitorInterface Signal: arprot_s11
wire [2:0] AxiMonitorInterface_arprot_s11;

// Interface: AxiMonitorInterface Signal: arprot_s12
wire [2:0] AxiMonitorInterface_arprot_s12;

// Interface: AxiMonitorInterface Signal: arprot_s13
wire [2:0] AxiMonitorInterface_arprot_s13;

// Interface: AxiMonitorInterface Signal: arprot_s14
wire [2:0] AxiMonitorInterface_arprot_s14;

// Interface: AxiMonitorInterface Signal: arprot_s15
wire [2:0] AxiMonitorInterface_arprot_s15;

// Interface: AxiMonitorInterface Signal: arprot_s16
wire [2:0] AxiMonitorInterface_arprot_s16;

// Interface: AxiMonitorInterface Signal: arprot_s17
wire [2:0] AxiMonitorInterface_arprot_s17;

// Interface: AxiMonitorInterface Signal: arprot_s18
wire [2:0] AxiMonitorInterface_arprot_s18;

// Interface: AxiMonitorInterface Signal: arprot_s19
wire [2:0] AxiMonitorInterface_arprot_s19;

// Interface: AxiMonitorInterface Signal: arprot_s20
wire [2:0] AxiMonitorInterface_arprot_s20;

// Interface: AxiMonitorInterface Signal: arprot_s21
wire [2:0] AxiMonitorInterface_arprot_s21;

// Interface: AxiMonitorInterface Signal: arprot_s22
wire [2:0] AxiMonitorInterface_arprot_s22;

// Interface: AxiMonitorInterface Signal: arprot_s23
wire [2:0] AxiMonitorInterface_arprot_s23;

// Interface: AxiMonitorInterface Signal: arprot_s24
wire [2:0] AxiMonitorInterface_arprot_s24;

// Interface: AxiMonitorInterface Signal: arprot_s25
wire [2:0] AxiMonitorInterface_arprot_s25;

// Interface: AxiMonitorInterface Signal: arprot_s26
wire [2:0] AxiMonitorInterface_arprot_s26;

// Interface: AxiMonitorInterface Signal: arprot_s27
wire [2:0] AxiMonitorInterface_arprot_s27;

// Interface: AxiMonitorInterface Signal: arprot_s28
wire [2:0] AxiMonitorInterface_arprot_s28;

// Interface: AxiMonitorInterface Signal: arprot_s29
wire [2:0] AxiMonitorInterface_arprot_s29;

// Interface: AxiMonitorInterface Signal: arprot_s30
wire [2:0] AxiMonitorInterface_arprot_s30;

// Interface: AxiMonitorInterface Signal: arprot_s31
wire [2:0] AxiMonitorInterface_arprot_s31;

// Interface: AxiMonitorInterface Signal: arid_s0
wire [31:0] AxiMonitorInterface_arid_s0;

// Interface: AxiMonitorInterface Signal: arid_s1
wire [31:0] AxiMonitorInterface_arid_s1;

// Interface: AxiMonitorInterface Signal: arid_s2
wire [31:0] AxiMonitorInterface_arid_s2;

// Interface: AxiMonitorInterface Signal: arid_s3
wire [31:0] AxiMonitorInterface_arid_s3;

// Interface: AxiMonitorInterface Signal: arid_s4
wire [31:0] AxiMonitorInterface_arid_s4;

// Interface: AxiMonitorInterface Signal: arid_s5
wire [31:0] AxiMonitorInterface_arid_s5;

// Interface: AxiMonitorInterface Signal: arid_s6
wire [31:0] AxiMonitorInterface_arid_s6;

// Interface: AxiMonitorInterface Signal: arid_s7
wire [31:0] AxiMonitorInterface_arid_s7;

// Interface: AxiMonitorInterface Signal: arid_s8
wire [31:0] AxiMonitorInterface_arid_s8;

// Interface: AxiMonitorInterface Signal: arid_s9
wire [31:0] AxiMonitorInterface_arid_s9;

// Interface: AxiMonitorInterface Signal: arid_s10
wire [31:0] AxiMonitorInterface_arid_s10;

// Interface: AxiMonitorInterface Signal: arid_s11
wire [31:0] AxiMonitorInterface_arid_s11;

// Interface: AxiMonitorInterface Signal: arid_s12
wire [31:0] AxiMonitorInterface_arid_s12;

// Interface: AxiMonitorInterface Signal: arid_s13
wire [31:0] AxiMonitorInterface_arid_s13;

// Interface: AxiMonitorInterface Signal: arid_s14
wire [31:0] AxiMonitorInterface_arid_s14;

// Interface: AxiMonitorInterface Signal: arid_s15
wire [31:0] AxiMonitorInterface_arid_s15;

// Interface: AxiMonitorInterface Signal: arid_s16
wire [31:0] AxiMonitorInterface_arid_s16;

// Interface: AxiMonitorInterface Signal: arid_s17
wire [31:0] AxiMonitorInterface_arid_s17;

// Interface: AxiMonitorInterface Signal: arid_s18
wire [31:0] AxiMonitorInterface_arid_s18;

// Interface: AxiMonitorInterface Signal: arid_s19
wire [31:0] AxiMonitorInterface_arid_s19;

// Interface: AxiMonitorInterface Signal: arid_s20
wire [31:0] AxiMonitorInterface_arid_s20;

// Interface: AxiMonitorInterface Signal: arid_s21
wire [31:0] AxiMonitorInterface_arid_s21;

// Interface: AxiMonitorInterface Signal: arid_s22
wire [31:0] AxiMonitorInterface_arid_s22;

// Interface: AxiMonitorInterface Signal: arid_s23
wire [31:0] AxiMonitorInterface_arid_s23;

// Interface: AxiMonitorInterface Signal: arid_s24
wire [31:0] AxiMonitorInterface_arid_s24;

// Interface: AxiMonitorInterface Signal: arid_s25
wire [31:0] AxiMonitorInterface_arid_s25;

// Interface: AxiMonitorInterface Signal: arid_s26
wire [31:0] AxiMonitorInterface_arid_s26;

// Interface: AxiMonitorInterface Signal: arid_s27
wire [31:0] AxiMonitorInterface_arid_s27;

// Interface: AxiMonitorInterface Signal: arid_s28
wire [31:0] AxiMonitorInterface_arid_s28;

// Interface: AxiMonitorInterface Signal: arid_s29
wire [31:0] AxiMonitorInterface_arid_s29;

// Interface: AxiMonitorInterface Signal: arid_s30
wire [31:0] AxiMonitorInterface_arid_s30;

// Interface: AxiMonitorInterface Signal: arid_s31
wire [31:0] AxiMonitorInterface_arid_s31;

// Interface: AxiMonitorInterface Signal: arready_s0
wire AxiMonitorInterface_arready_s0;

// Interface: AxiMonitorInterface Signal: arready_s1
wire AxiMonitorInterface_arready_s1;

// Interface: AxiMonitorInterface Signal: arready_s2
wire AxiMonitorInterface_arready_s2;

// Interface: AxiMonitorInterface Signal: arready_s3
wire AxiMonitorInterface_arready_s3;

// Interface: AxiMonitorInterface Signal: arready_s4
wire AxiMonitorInterface_arready_s4;

// Interface: AxiMonitorInterface Signal: arready_s5
wire AxiMonitorInterface_arready_s5;

// Interface: AxiMonitorInterface Signal: arready_s6
wire AxiMonitorInterface_arready_s6;

// Interface: AxiMonitorInterface Signal: arready_s7
wire AxiMonitorInterface_arready_s7;

// Interface: AxiMonitorInterface Signal: arready_s8
wire AxiMonitorInterface_arready_s8;

// Interface: AxiMonitorInterface Signal: arready_s9
wire AxiMonitorInterface_arready_s9;

// Interface: AxiMonitorInterface Signal: arready_s10
wire AxiMonitorInterface_arready_s10;

// Interface: AxiMonitorInterface Signal: arready_s11
wire AxiMonitorInterface_arready_s11;

// Interface: AxiMonitorInterface Signal: arready_s12
wire AxiMonitorInterface_arready_s12;

// Interface: AxiMonitorInterface Signal: arready_s13
wire AxiMonitorInterface_arready_s13;

// Interface: AxiMonitorInterface Signal: arready_s14
wire AxiMonitorInterface_arready_s14;

// Interface: AxiMonitorInterface Signal: arready_s15
wire AxiMonitorInterface_arready_s15;

// Interface: AxiMonitorInterface Signal: arready_s16
wire AxiMonitorInterface_arready_s16;

// Interface: AxiMonitorInterface Signal: arready_s17
wire AxiMonitorInterface_arready_s17;

// Interface: AxiMonitorInterface Signal: arready_s18
wire AxiMonitorInterface_arready_s18;

// Interface: AxiMonitorInterface Signal: arready_s19
wire AxiMonitorInterface_arready_s19;

// Interface: AxiMonitorInterface Signal: arready_s20
wire AxiMonitorInterface_arready_s20;

// Interface: AxiMonitorInterface Signal: arready_s21
wire AxiMonitorInterface_arready_s21;

// Interface: AxiMonitorInterface Signal: arready_s22
wire AxiMonitorInterface_arready_s22;

// Interface: AxiMonitorInterface Signal: arready_s23
wire AxiMonitorInterface_arready_s23;

// Interface: AxiMonitorInterface Signal: arready_s24
wire AxiMonitorInterface_arready_s24;

// Interface: AxiMonitorInterface Signal: arready_s25
wire AxiMonitorInterface_arready_s25;

// Interface: AxiMonitorInterface Signal: arready_s26
wire AxiMonitorInterface_arready_s26;

// Interface: AxiMonitorInterface Signal: arready_s27
wire AxiMonitorInterface_arready_s27;

// Interface: AxiMonitorInterface Signal: arready_s28
wire AxiMonitorInterface_arready_s28;

// Interface: AxiMonitorInterface Signal: arready_s29
wire AxiMonitorInterface_arready_s29;

// Interface: AxiMonitorInterface Signal: arready_s30
wire AxiMonitorInterface_arready_s30;

// Interface: AxiMonitorInterface Signal: arready_s31
wire AxiMonitorInterface_arready_s31;

// Interface: AxiMonitorInterface Signal: arsideband_s0
wire [63:0] AxiMonitorInterface_arsideband_s0;

// Interface: AxiMonitorInterface Signal: arsideband_s1
wire [63:0] AxiMonitorInterface_arsideband_s1;

// Interface: AxiMonitorInterface Signal: arsideband_s2
wire [63:0] AxiMonitorInterface_arsideband_s2;

// Interface: AxiMonitorInterface Signal: arsideband_s3
wire [63:0] AxiMonitorInterface_arsideband_s3;

// Interface: AxiMonitorInterface Signal: arsideband_s4
wire [63:0] AxiMonitorInterface_arsideband_s4;

// Interface: AxiMonitorInterface Signal: arsideband_s5
wire [63:0] AxiMonitorInterface_arsideband_s5;

// Interface: AxiMonitorInterface Signal: arsideband_s6
wire [63:0] AxiMonitorInterface_arsideband_s6;

// Interface: AxiMonitorInterface Signal: arsideband_s7
wire [63:0] AxiMonitorInterface_arsideband_s7;

// Interface: AxiMonitorInterface Signal: arsideband_s8
wire [63:0] AxiMonitorInterface_arsideband_s8;

// Interface: AxiMonitorInterface Signal: arsideband_s9
wire [63:0] AxiMonitorInterface_arsideband_s9;

// Interface: AxiMonitorInterface Signal: arsideband_s10
wire [63:0] AxiMonitorInterface_arsideband_s10;

// Interface: AxiMonitorInterface Signal: arsideband_s11
wire [63:0] AxiMonitorInterface_arsideband_s11;

// Interface: AxiMonitorInterface Signal: arsideband_s12
wire [63:0] AxiMonitorInterface_arsideband_s12;

// Interface: AxiMonitorInterface Signal: arsideband_s13
wire [63:0] AxiMonitorInterface_arsideband_s13;

// Interface: AxiMonitorInterface Signal: arsideband_s14
wire [63:0] AxiMonitorInterface_arsideband_s14;

// Interface: AxiMonitorInterface Signal: arsideband_s15
wire [63:0] AxiMonitorInterface_arsideband_s15;

// Interface: AxiMonitorInterface Signal: arsideband_s16
wire [63:0] AxiMonitorInterface_arsideband_s16;

// Interface: AxiMonitorInterface Signal: arsideband_s17
wire [63:0] AxiMonitorInterface_arsideband_s17;

// Interface: AxiMonitorInterface Signal: arsideband_s18
wire [63:0] AxiMonitorInterface_arsideband_s18;

// Interface: AxiMonitorInterface Signal: arsideband_s19
wire [63:0] AxiMonitorInterface_arsideband_s19;

// Interface: AxiMonitorInterface Signal: arsideband_s20
wire [63:0] AxiMonitorInterface_arsideband_s20;

// Interface: AxiMonitorInterface Signal: arsideband_s21
wire [63:0] AxiMonitorInterface_arsideband_s21;

// Interface: AxiMonitorInterface Signal: arsideband_s22
wire [63:0] AxiMonitorInterface_arsideband_s22;

// Interface: AxiMonitorInterface Signal: arsideband_s23
wire [63:0] AxiMonitorInterface_arsideband_s23;

// Interface: AxiMonitorInterface Signal: arsideband_s24
wire [63:0] AxiMonitorInterface_arsideband_s24;

// Interface: AxiMonitorInterface Signal: arsideband_s25
wire [63:0] AxiMonitorInterface_arsideband_s25;

// Interface: AxiMonitorInterface Signal: arsideband_s26
wire [63:0] AxiMonitorInterface_arsideband_s26;

// Interface: AxiMonitorInterface Signal: arsideband_s27
wire [63:0] AxiMonitorInterface_arsideband_s27;

// Interface: AxiMonitorInterface Signal: arsideband_s28
wire [63:0] AxiMonitorInterface_arsideband_s28;

// Interface: AxiMonitorInterface Signal: arsideband_s29
wire [63:0] AxiMonitorInterface_arsideband_s29;

// Interface: AxiMonitorInterface Signal: arsideband_s30
wire [63:0] AxiMonitorInterface_arsideband_s30;

// Interface: AxiMonitorInterface Signal: arsideband_s31
wire [63:0] AxiMonitorInterface_arsideband_s31;

// Interface: AxiMonitorInterface Signal: awvalid_s0
wire AxiMonitorInterface_awvalid_s0;

// Interface: AxiMonitorInterface Signal: awvalid_s1
wire AxiMonitorInterface_awvalid_s1;

// Interface: AxiMonitorInterface Signal: awvalid_s2
wire AxiMonitorInterface_awvalid_s2;

// Interface: AxiMonitorInterface Signal: awvalid_s3
wire AxiMonitorInterface_awvalid_s3;

// Interface: AxiMonitorInterface Signal: awvalid_s4
wire AxiMonitorInterface_awvalid_s4;

// Interface: AxiMonitorInterface Signal: awvalid_s5
wire AxiMonitorInterface_awvalid_s5;

// Interface: AxiMonitorInterface Signal: awvalid_s6
wire AxiMonitorInterface_awvalid_s6;

// Interface: AxiMonitorInterface Signal: awvalid_s7
wire AxiMonitorInterface_awvalid_s7;

// Interface: AxiMonitorInterface Signal: awvalid_s8
wire AxiMonitorInterface_awvalid_s8;

// Interface: AxiMonitorInterface Signal: awvalid_s9
wire AxiMonitorInterface_awvalid_s9;

// Interface: AxiMonitorInterface Signal: awvalid_s10
wire AxiMonitorInterface_awvalid_s10;

// Interface: AxiMonitorInterface Signal: awvalid_s11
wire AxiMonitorInterface_awvalid_s11;

// Interface: AxiMonitorInterface Signal: awvalid_s12
wire AxiMonitorInterface_awvalid_s12;

// Interface: AxiMonitorInterface Signal: awvalid_s13
wire AxiMonitorInterface_awvalid_s13;

// Interface: AxiMonitorInterface Signal: awvalid_s14
wire AxiMonitorInterface_awvalid_s14;

// Interface: AxiMonitorInterface Signal: awvalid_s15
wire AxiMonitorInterface_awvalid_s15;

// Interface: AxiMonitorInterface Signal: awvalid_s16
wire AxiMonitorInterface_awvalid_s16;

// Interface: AxiMonitorInterface Signal: awvalid_s17
wire AxiMonitorInterface_awvalid_s17;

// Interface: AxiMonitorInterface Signal: awvalid_s18
wire AxiMonitorInterface_awvalid_s18;

// Interface: AxiMonitorInterface Signal: awvalid_s19
wire AxiMonitorInterface_awvalid_s19;

// Interface: AxiMonitorInterface Signal: awvalid_s20
wire AxiMonitorInterface_awvalid_s20;

// Interface: AxiMonitorInterface Signal: awvalid_s21
wire AxiMonitorInterface_awvalid_s21;

// Interface: AxiMonitorInterface Signal: awvalid_s22
wire AxiMonitorInterface_awvalid_s22;

// Interface: AxiMonitorInterface Signal: awvalid_s23
wire AxiMonitorInterface_awvalid_s23;

// Interface: AxiMonitorInterface Signal: awvalid_s24
wire AxiMonitorInterface_awvalid_s24;

// Interface: AxiMonitorInterface Signal: awvalid_s25
wire AxiMonitorInterface_awvalid_s25;

// Interface: AxiMonitorInterface Signal: awvalid_s26
wire AxiMonitorInterface_awvalid_s26;

// Interface: AxiMonitorInterface Signal: awvalid_s27
wire AxiMonitorInterface_awvalid_s27;

// Interface: AxiMonitorInterface Signal: awvalid_s28
wire AxiMonitorInterface_awvalid_s28;

// Interface: AxiMonitorInterface Signal: awvalid_s29
wire AxiMonitorInterface_awvalid_s29;

// Interface: AxiMonitorInterface Signal: awvalid_s30
wire AxiMonitorInterface_awvalid_s30;

// Interface: AxiMonitorInterface Signal: awvalid_s31
wire AxiMonitorInterface_awvalid_s31;

// Interface: AxiMonitorInterface Signal: awaddr_s0
wire [63:0] AxiMonitorInterface_awaddr_s0;

// Interface: AxiMonitorInterface Signal: awaddr_s1
wire [63:0] AxiMonitorInterface_awaddr_s1;

// Interface: AxiMonitorInterface Signal: awaddr_s2
wire [63:0] AxiMonitorInterface_awaddr_s2;

// Interface: AxiMonitorInterface Signal: awaddr_s3
wire [63:0] AxiMonitorInterface_awaddr_s3;

// Interface: AxiMonitorInterface Signal: awaddr_s4
wire [63:0] AxiMonitorInterface_awaddr_s4;

// Interface: AxiMonitorInterface Signal: awaddr_s5
wire [63:0] AxiMonitorInterface_awaddr_s5;

// Interface: AxiMonitorInterface Signal: awaddr_s6
wire [63:0] AxiMonitorInterface_awaddr_s6;

// Interface: AxiMonitorInterface Signal: awaddr_s7
wire [63:0] AxiMonitorInterface_awaddr_s7;

// Interface: AxiMonitorInterface Signal: awaddr_s8
wire [63:0] AxiMonitorInterface_awaddr_s8;

// Interface: AxiMonitorInterface Signal: awaddr_s9
wire [63:0] AxiMonitorInterface_awaddr_s9;

// Interface: AxiMonitorInterface Signal: awaddr_s10
wire [63:0] AxiMonitorInterface_awaddr_s10;

// Interface: AxiMonitorInterface Signal: awaddr_s11
wire [63:0] AxiMonitorInterface_awaddr_s11;

// Interface: AxiMonitorInterface Signal: awaddr_s12
wire [63:0] AxiMonitorInterface_awaddr_s12;

// Interface: AxiMonitorInterface Signal: awaddr_s13
wire [63:0] AxiMonitorInterface_awaddr_s13;

// Interface: AxiMonitorInterface Signal: awaddr_s14
wire [63:0] AxiMonitorInterface_awaddr_s14;

// Interface: AxiMonitorInterface Signal: awaddr_s15
wire [63:0] AxiMonitorInterface_awaddr_s15;

// Interface: AxiMonitorInterface Signal: awaddr_s16
wire [63:0] AxiMonitorInterface_awaddr_s16;

// Interface: AxiMonitorInterface Signal: awaddr_s17
wire [63:0] AxiMonitorInterface_awaddr_s17;

// Interface: AxiMonitorInterface Signal: awaddr_s18
wire [63:0] AxiMonitorInterface_awaddr_s18;

// Interface: AxiMonitorInterface Signal: awaddr_s19
wire [63:0] AxiMonitorInterface_awaddr_s19;

// Interface: AxiMonitorInterface Signal: awaddr_s20
wire [63:0] AxiMonitorInterface_awaddr_s20;

// Interface: AxiMonitorInterface Signal: awaddr_s21
wire [63:0] AxiMonitorInterface_awaddr_s21;

// Interface: AxiMonitorInterface Signal: awaddr_s22
wire [63:0] AxiMonitorInterface_awaddr_s22;

// Interface: AxiMonitorInterface Signal: awaddr_s23
wire [63:0] AxiMonitorInterface_awaddr_s23;

// Interface: AxiMonitorInterface Signal: awaddr_s24
wire [63:0] AxiMonitorInterface_awaddr_s24;

// Interface: AxiMonitorInterface Signal: awaddr_s25
wire [63:0] AxiMonitorInterface_awaddr_s25;

// Interface: AxiMonitorInterface Signal: awaddr_s26
wire [63:0] AxiMonitorInterface_awaddr_s26;

// Interface: AxiMonitorInterface Signal: awaddr_s27
wire [63:0] AxiMonitorInterface_awaddr_s27;

// Interface: AxiMonitorInterface Signal: awaddr_s28
wire [63:0] AxiMonitorInterface_awaddr_s28;

// Interface: AxiMonitorInterface Signal: awaddr_s29
wire [63:0] AxiMonitorInterface_awaddr_s29;

// Interface: AxiMonitorInterface Signal: awaddr_s30
wire [63:0] AxiMonitorInterface_awaddr_s30;

// Interface: AxiMonitorInterface Signal: awaddr_s31
wire [63:0] AxiMonitorInterface_awaddr_s31;

// Interface: AxiMonitorInterface Signal: awlen_s0
wire [9:0] AxiMonitorInterface_awlen_s0;

// Interface: AxiMonitorInterface Signal: awlen_s1
wire [9:0] AxiMonitorInterface_awlen_s1;

// Interface: AxiMonitorInterface Signal: awlen_s2
wire [9:0] AxiMonitorInterface_awlen_s2;

// Interface: AxiMonitorInterface Signal: awlen_s3
wire [9:0] AxiMonitorInterface_awlen_s3;

// Interface: AxiMonitorInterface Signal: awlen_s4
wire [9:0] AxiMonitorInterface_awlen_s4;

// Interface: AxiMonitorInterface Signal: awlen_s5
wire [9:0] AxiMonitorInterface_awlen_s5;

// Interface: AxiMonitorInterface Signal: awlen_s6
wire [9:0] AxiMonitorInterface_awlen_s6;

// Interface: AxiMonitorInterface Signal: awlen_s7
wire [9:0] AxiMonitorInterface_awlen_s7;

// Interface: AxiMonitorInterface Signal: awlen_s8
wire [9:0] AxiMonitorInterface_awlen_s8;

// Interface: AxiMonitorInterface Signal: awlen_s9
wire [9:0] AxiMonitorInterface_awlen_s9;

// Interface: AxiMonitorInterface Signal: awlen_s10
wire [9:0] AxiMonitorInterface_awlen_s10;

// Interface: AxiMonitorInterface Signal: awlen_s11
wire [9:0] AxiMonitorInterface_awlen_s11;

// Interface: AxiMonitorInterface Signal: awlen_s12
wire [9:0] AxiMonitorInterface_awlen_s12;

// Interface: AxiMonitorInterface Signal: awlen_s13
wire [9:0] AxiMonitorInterface_awlen_s13;

// Interface: AxiMonitorInterface Signal: awlen_s14
wire [9:0] AxiMonitorInterface_awlen_s14;

// Interface: AxiMonitorInterface Signal: awlen_s15
wire [9:0] AxiMonitorInterface_awlen_s15;

// Interface: AxiMonitorInterface Signal: awlen_s16
wire [9:0] AxiMonitorInterface_awlen_s16;

// Interface: AxiMonitorInterface Signal: awlen_s17
wire [9:0] AxiMonitorInterface_awlen_s17;

// Interface: AxiMonitorInterface Signal: awlen_s18
wire [9:0] AxiMonitorInterface_awlen_s18;

// Interface: AxiMonitorInterface Signal: awlen_s19
wire [9:0] AxiMonitorInterface_awlen_s19;

// Interface: AxiMonitorInterface Signal: awlen_s20
wire [9:0] AxiMonitorInterface_awlen_s20;

// Interface: AxiMonitorInterface Signal: awlen_s21
wire [9:0] AxiMonitorInterface_awlen_s21;

// Interface: AxiMonitorInterface Signal: awlen_s22
wire [9:0] AxiMonitorInterface_awlen_s22;

// Interface: AxiMonitorInterface Signal: awlen_s23
wire [9:0] AxiMonitorInterface_awlen_s23;

// Interface: AxiMonitorInterface Signal: awlen_s24
wire [9:0] AxiMonitorInterface_awlen_s24;

// Interface: AxiMonitorInterface Signal: awlen_s25
wire [9:0] AxiMonitorInterface_awlen_s25;

// Interface: AxiMonitorInterface Signal: awlen_s26
wire [9:0] AxiMonitorInterface_awlen_s26;

// Interface: AxiMonitorInterface Signal: awlen_s27
wire [9:0] AxiMonitorInterface_awlen_s27;

// Interface: AxiMonitorInterface Signal: awlen_s28
wire [9:0] AxiMonitorInterface_awlen_s28;

// Interface: AxiMonitorInterface Signal: awlen_s29
wire [9:0] AxiMonitorInterface_awlen_s29;

// Interface: AxiMonitorInterface Signal: awlen_s30
wire [9:0] AxiMonitorInterface_awlen_s30;

// Interface: AxiMonitorInterface Signal: awlen_s31
wire [9:0] AxiMonitorInterface_awlen_s31;

// Interface: AxiMonitorInterface Signal: awsize_s0
wire [2:0] AxiMonitorInterface_awsize_s0;

// Interface: AxiMonitorInterface Signal: awsize_s1
wire [2:0] AxiMonitorInterface_awsize_s1;

// Interface: AxiMonitorInterface Signal: awsize_s2
wire [2:0] AxiMonitorInterface_awsize_s2;

// Interface: AxiMonitorInterface Signal: awsize_s3
wire [2:0] AxiMonitorInterface_awsize_s3;

// Interface: AxiMonitorInterface Signal: awsize_s4
wire [2:0] AxiMonitorInterface_awsize_s4;

// Interface: AxiMonitorInterface Signal: awsize_s5
wire [2:0] AxiMonitorInterface_awsize_s5;

// Interface: AxiMonitorInterface Signal: awsize_s6
wire [2:0] AxiMonitorInterface_awsize_s6;

// Interface: AxiMonitorInterface Signal: awsize_s7
wire [2:0] AxiMonitorInterface_awsize_s7;

// Interface: AxiMonitorInterface Signal: awsize_s8
wire [2:0] AxiMonitorInterface_awsize_s8;

// Interface: AxiMonitorInterface Signal: awsize_s9
wire [2:0] AxiMonitorInterface_awsize_s9;

// Interface: AxiMonitorInterface Signal: awsize_s10
wire [2:0] AxiMonitorInterface_awsize_s10;

// Interface: AxiMonitorInterface Signal: awsize_s11
wire [2:0] AxiMonitorInterface_awsize_s11;

// Interface: AxiMonitorInterface Signal: awsize_s12
wire [2:0] AxiMonitorInterface_awsize_s12;

// Interface: AxiMonitorInterface Signal: awsize_s13
wire [2:0] AxiMonitorInterface_awsize_s13;

// Interface: AxiMonitorInterface Signal: awsize_s14
wire [2:0] AxiMonitorInterface_awsize_s14;

// Interface: AxiMonitorInterface Signal: awsize_s15
wire [2:0] AxiMonitorInterface_awsize_s15;

// Interface: AxiMonitorInterface Signal: awsize_s16
wire [2:0] AxiMonitorInterface_awsize_s16;

// Interface: AxiMonitorInterface Signal: awsize_s17
wire [2:0] AxiMonitorInterface_awsize_s17;

// Interface: AxiMonitorInterface Signal: awsize_s18
wire [2:0] AxiMonitorInterface_awsize_s18;

// Interface: AxiMonitorInterface Signal: awsize_s19
wire [2:0] AxiMonitorInterface_awsize_s19;

// Interface: AxiMonitorInterface Signal: awsize_s20
wire [2:0] AxiMonitorInterface_awsize_s20;

// Interface: AxiMonitorInterface Signal: awsize_s21
wire [2:0] AxiMonitorInterface_awsize_s21;

// Interface: AxiMonitorInterface Signal: awsize_s22
wire [2:0] AxiMonitorInterface_awsize_s22;

// Interface: AxiMonitorInterface Signal: awsize_s23
wire [2:0] AxiMonitorInterface_awsize_s23;

// Interface: AxiMonitorInterface Signal: awsize_s24
wire [2:0] AxiMonitorInterface_awsize_s24;

// Interface: AxiMonitorInterface Signal: awsize_s25
wire [2:0] AxiMonitorInterface_awsize_s25;

// Interface: AxiMonitorInterface Signal: awsize_s26
wire [2:0] AxiMonitorInterface_awsize_s26;

// Interface: AxiMonitorInterface Signal: awsize_s27
wire [2:0] AxiMonitorInterface_awsize_s27;

// Interface: AxiMonitorInterface Signal: awsize_s28
wire [2:0] AxiMonitorInterface_awsize_s28;

// Interface: AxiMonitorInterface Signal: awsize_s29
wire [2:0] AxiMonitorInterface_awsize_s29;

// Interface: AxiMonitorInterface Signal: awsize_s30
wire [2:0] AxiMonitorInterface_awsize_s30;

// Interface: AxiMonitorInterface Signal: awsize_s31
wire [2:0] AxiMonitorInterface_awsize_s31;

// Interface: AxiMonitorInterface Signal: awburst_s0
wire [1:0] AxiMonitorInterface_awburst_s0;

// Interface: AxiMonitorInterface Signal: awburst_s1
wire [1:0] AxiMonitorInterface_awburst_s1;

// Interface: AxiMonitorInterface Signal: awburst_s2
wire [1:0] AxiMonitorInterface_awburst_s2;

// Interface: AxiMonitorInterface Signal: awburst_s3
wire [1:0] AxiMonitorInterface_awburst_s3;

// Interface: AxiMonitorInterface Signal: awburst_s4
wire [1:0] AxiMonitorInterface_awburst_s4;

// Interface: AxiMonitorInterface Signal: awburst_s5
wire [1:0] AxiMonitorInterface_awburst_s5;

// Interface: AxiMonitorInterface Signal: awburst_s6
wire [1:0] AxiMonitorInterface_awburst_s6;

// Interface: AxiMonitorInterface Signal: awburst_s7
wire [1:0] AxiMonitorInterface_awburst_s7;

// Interface: AxiMonitorInterface Signal: awburst_s8
wire [1:0] AxiMonitorInterface_awburst_s8;

// Interface: AxiMonitorInterface Signal: awburst_s9
wire [1:0] AxiMonitorInterface_awburst_s9;

// Interface: AxiMonitorInterface Signal: awburst_s10
wire [1:0] AxiMonitorInterface_awburst_s10;

// Interface: AxiMonitorInterface Signal: awburst_s11
wire [1:0] AxiMonitorInterface_awburst_s11;

// Interface: AxiMonitorInterface Signal: awburst_s12
wire [1:0] AxiMonitorInterface_awburst_s12;

// Interface: AxiMonitorInterface Signal: awburst_s13
wire [1:0] AxiMonitorInterface_awburst_s13;

// Interface: AxiMonitorInterface Signal: awburst_s14
wire [1:0] AxiMonitorInterface_awburst_s14;

// Interface: AxiMonitorInterface Signal: awburst_s15
wire [1:0] AxiMonitorInterface_awburst_s15;

// Interface: AxiMonitorInterface Signal: awburst_s16
wire [1:0] AxiMonitorInterface_awburst_s16;

// Interface: AxiMonitorInterface Signal: awburst_s17
wire [1:0] AxiMonitorInterface_awburst_s17;

// Interface: AxiMonitorInterface Signal: awburst_s18
wire [1:0] AxiMonitorInterface_awburst_s18;

// Interface: AxiMonitorInterface Signal: awburst_s19
wire [1:0] AxiMonitorInterface_awburst_s19;

// Interface: AxiMonitorInterface Signal: awburst_s20
wire [1:0] AxiMonitorInterface_awburst_s20;

// Interface: AxiMonitorInterface Signal: awburst_s21
wire [1:0] AxiMonitorInterface_awburst_s21;

// Interface: AxiMonitorInterface Signal: awburst_s22
wire [1:0] AxiMonitorInterface_awburst_s22;

// Interface: AxiMonitorInterface Signal: awburst_s23
wire [1:0] AxiMonitorInterface_awburst_s23;

// Interface: AxiMonitorInterface Signal: awburst_s24
wire [1:0] AxiMonitorInterface_awburst_s24;

// Interface: AxiMonitorInterface Signal: awburst_s25
wire [1:0] AxiMonitorInterface_awburst_s25;

// Interface: AxiMonitorInterface Signal: awburst_s26
wire [1:0] AxiMonitorInterface_awburst_s26;

// Interface: AxiMonitorInterface Signal: awburst_s27
wire [1:0] AxiMonitorInterface_awburst_s27;

// Interface: AxiMonitorInterface Signal: awburst_s28
wire [1:0] AxiMonitorInterface_awburst_s28;

// Interface: AxiMonitorInterface Signal: awburst_s29
wire [1:0] AxiMonitorInterface_awburst_s29;

// Interface: AxiMonitorInterface Signal: awburst_s30
wire [1:0] AxiMonitorInterface_awburst_s30;

// Interface: AxiMonitorInterface Signal: awburst_s31
wire [1:0] AxiMonitorInterface_awburst_s31;

// Interface: AxiMonitorInterface Signal: awlock_s0
wire [1:0] AxiMonitorInterface_awlock_s0;

// Interface: AxiMonitorInterface Signal: awlock_s1
wire [1:0] AxiMonitorInterface_awlock_s1;

// Interface: AxiMonitorInterface Signal: awlock_s2
wire [1:0] AxiMonitorInterface_awlock_s2;

// Interface: AxiMonitorInterface Signal: awlock_s3
wire [1:0] AxiMonitorInterface_awlock_s3;

// Interface: AxiMonitorInterface Signal: awlock_s4
wire [1:0] AxiMonitorInterface_awlock_s4;

// Interface: AxiMonitorInterface Signal: awlock_s5
wire [1:0] AxiMonitorInterface_awlock_s5;

// Interface: AxiMonitorInterface Signal: awlock_s6
wire [1:0] AxiMonitorInterface_awlock_s6;

// Interface: AxiMonitorInterface Signal: awlock_s7
wire [1:0] AxiMonitorInterface_awlock_s7;

// Interface: AxiMonitorInterface Signal: awlock_s8
wire [1:0] AxiMonitorInterface_awlock_s8;

// Interface: AxiMonitorInterface Signal: awlock_s9
wire [1:0] AxiMonitorInterface_awlock_s9;

// Interface: AxiMonitorInterface Signal: awlock_s10
wire [1:0] AxiMonitorInterface_awlock_s10;

// Interface: AxiMonitorInterface Signal: awlock_s11
wire [1:0] AxiMonitorInterface_awlock_s11;

// Interface: AxiMonitorInterface Signal: awlock_s12
wire [1:0] AxiMonitorInterface_awlock_s12;

// Interface: AxiMonitorInterface Signal: awlock_s13
wire [1:0] AxiMonitorInterface_awlock_s13;

// Interface: AxiMonitorInterface Signal: awlock_s14
wire [1:0] AxiMonitorInterface_awlock_s14;

// Interface: AxiMonitorInterface Signal: awlock_s15
wire [1:0] AxiMonitorInterface_awlock_s15;

// Interface: AxiMonitorInterface Signal: awlock_s16
wire [1:0] AxiMonitorInterface_awlock_s16;

// Interface: AxiMonitorInterface Signal: awlock_s17
wire [1:0] AxiMonitorInterface_awlock_s17;

// Interface: AxiMonitorInterface Signal: awlock_s18
wire [1:0] AxiMonitorInterface_awlock_s18;

// Interface: AxiMonitorInterface Signal: awlock_s19
wire [1:0] AxiMonitorInterface_awlock_s19;

// Interface: AxiMonitorInterface Signal: awlock_s20
wire [1:0] AxiMonitorInterface_awlock_s20;

// Interface: AxiMonitorInterface Signal: awlock_s21
wire [1:0] AxiMonitorInterface_awlock_s21;

// Interface: AxiMonitorInterface Signal: awlock_s22
wire [1:0] AxiMonitorInterface_awlock_s22;

// Interface: AxiMonitorInterface Signal: awlock_s23
wire [1:0] AxiMonitorInterface_awlock_s23;

// Interface: AxiMonitorInterface Signal: awlock_s24
wire [1:0] AxiMonitorInterface_awlock_s24;

// Interface: AxiMonitorInterface Signal: awlock_s25
wire [1:0] AxiMonitorInterface_awlock_s25;

// Interface: AxiMonitorInterface Signal: awlock_s26
wire [1:0] AxiMonitorInterface_awlock_s26;

// Interface: AxiMonitorInterface Signal: awlock_s27
wire [1:0] AxiMonitorInterface_awlock_s27;

// Interface: AxiMonitorInterface Signal: awlock_s28
wire [1:0] AxiMonitorInterface_awlock_s28;

// Interface: AxiMonitorInterface Signal: awlock_s29
wire [1:0] AxiMonitorInterface_awlock_s29;

// Interface: AxiMonitorInterface Signal: awlock_s30
wire [1:0] AxiMonitorInterface_awlock_s30;

// Interface: AxiMonitorInterface Signal: awlock_s31
wire [1:0] AxiMonitorInterface_awlock_s31;

// Interface: AxiMonitorInterface Signal: awcache_s0
wire [3:0] AxiMonitorInterface_awcache_s0;

// Interface: AxiMonitorInterface Signal: awcache_s1
wire [3:0] AxiMonitorInterface_awcache_s1;

// Interface: AxiMonitorInterface Signal: awcache_s2
wire [3:0] AxiMonitorInterface_awcache_s2;

// Interface: AxiMonitorInterface Signal: awcache_s3
wire [3:0] AxiMonitorInterface_awcache_s3;

// Interface: AxiMonitorInterface Signal: awcache_s4
wire [3:0] AxiMonitorInterface_awcache_s4;

// Interface: AxiMonitorInterface Signal: awcache_s5
wire [3:0] AxiMonitorInterface_awcache_s5;

// Interface: AxiMonitorInterface Signal: awcache_s6
wire [3:0] AxiMonitorInterface_awcache_s6;

// Interface: AxiMonitorInterface Signal: awcache_s7
wire [3:0] AxiMonitorInterface_awcache_s7;

// Interface: AxiMonitorInterface Signal: awcache_s8
wire [3:0] AxiMonitorInterface_awcache_s8;

// Interface: AxiMonitorInterface Signal: awcache_s9
wire [3:0] AxiMonitorInterface_awcache_s9;

// Interface: AxiMonitorInterface Signal: awcache_s10
wire [3:0] AxiMonitorInterface_awcache_s10;

// Interface: AxiMonitorInterface Signal: awcache_s11
wire [3:0] AxiMonitorInterface_awcache_s11;

// Interface: AxiMonitorInterface Signal: awcache_s12
wire [3:0] AxiMonitorInterface_awcache_s12;

// Interface: AxiMonitorInterface Signal: awcache_s13
wire [3:0] AxiMonitorInterface_awcache_s13;

// Interface: AxiMonitorInterface Signal: awcache_s14
wire [3:0] AxiMonitorInterface_awcache_s14;

// Interface: AxiMonitorInterface Signal: awcache_s15
wire [3:0] AxiMonitorInterface_awcache_s15;

// Interface: AxiMonitorInterface Signal: awcache_s16
wire [3:0] AxiMonitorInterface_awcache_s16;

// Interface: AxiMonitorInterface Signal: awcache_s17
wire [3:0] AxiMonitorInterface_awcache_s17;

// Interface: AxiMonitorInterface Signal: awcache_s18
wire [3:0] AxiMonitorInterface_awcache_s18;

// Interface: AxiMonitorInterface Signal: awcache_s19
wire [3:0] AxiMonitorInterface_awcache_s19;

// Interface: AxiMonitorInterface Signal: awcache_s20
wire [3:0] AxiMonitorInterface_awcache_s20;

// Interface: AxiMonitorInterface Signal: awcache_s21
wire [3:0] AxiMonitorInterface_awcache_s21;

// Interface: AxiMonitorInterface Signal: awcache_s22
wire [3:0] AxiMonitorInterface_awcache_s22;

// Interface: AxiMonitorInterface Signal: awcache_s23
wire [3:0] AxiMonitorInterface_awcache_s23;

// Interface: AxiMonitorInterface Signal: awcache_s24
wire [3:0] AxiMonitorInterface_awcache_s24;

// Interface: AxiMonitorInterface Signal: awcache_s25
wire [3:0] AxiMonitorInterface_awcache_s25;

// Interface: AxiMonitorInterface Signal: awcache_s26
wire [3:0] AxiMonitorInterface_awcache_s26;

// Interface: AxiMonitorInterface Signal: awcache_s27
wire [3:0] AxiMonitorInterface_awcache_s27;

// Interface: AxiMonitorInterface Signal: awcache_s28
wire [3:0] AxiMonitorInterface_awcache_s28;

// Interface: AxiMonitorInterface Signal: awcache_s29
wire [3:0] AxiMonitorInterface_awcache_s29;

// Interface: AxiMonitorInterface Signal: awcache_s30
wire [3:0] AxiMonitorInterface_awcache_s30;

// Interface: AxiMonitorInterface Signal: awcache_s31
wire [3:0] AxiMonitorInterface_awcache_s31;

// Interface: AxiMonitorInterface Signal: awprot_s0
wire [2:0] AxiMonitorInterface_awprot_s0;

// Interface: AxiMonitorInterface Signal: awprot_s1
wire [2:0] AxiMonitorInterface_awprot_s1;

// Interface: AxiMonitorInterface Signal: awprot_s2
wire [2:0] AxiMonitorInterface_awprot_s2;

// Interface: AxiMonitorInterface Signal: awprot_s3
wire [2:0] AxiMonitorInterface_awprot_s3;

// Interface: AxiMonitorInterface Signal: awprot_s4
wire [2:0] AxiMonitorInterface_awprot_s4;

// Interface: AxiMonitorInterface Signal: awprot_s5
wire [2:0] AxiMonitorInterface_awprot_s5;

// Interface: AxiMonitorInterface Signal: awprot_s6
wire [2:0] AxiMonitorInterface_awprot_s6;

// Interface: AxiMonitorInterface Signal: awprot_s7
wire [2:0] AxiMonitorInterface_awprot_s7;

// Interface: AxiMonitorInterface Signal: awprot_s8
wire [2:0] AxiMonitorInterface_awprot_s8;

// Interface: AxiMonitorInterface Signal: awprot_s9
wire [2:0] AxiMonitorInterface_awprot_s9;

// Interface: AxiMonitorInterface Signal: awprot_s10
wire [2:0] AxiMonitorInterface_awprot_s10;

// Interface: AxiMonitorInterface Signal: awprot_s11
wire [2:0] AxiMonitorInterface_awprot_s11;

// Interface: AxiMonitorInterface Signal: awprot_s12
wire [2:0] AxiMonitorInterface_awprot_s12;

// Interface: AxiMonitorInterface Signal: awprot_s13
wire [2:0] AxiMonitorInterface_awprot_s13;

// Interface: AxiMonitorInterface Signal: awprot_s14
wire [2:0] AxiMonitorInterface_awprot_s14;

// Interface: AxiMonitorInterface Signal: awprot_s15
wire [2:0] AxiMonitorInterface_awprot_s15;

// Interface: AxiMonitorInterface Signal: awprot_s16
wire [2:0] AxiMonitorInterface_awprot_s16;

// Interface: AxiMonitorInterface Signal: awprot_s17
wire [2:0] AxiMonitorInterface_awprot_s17;

// Interface: AxiMonitorInterface Signal: awprot_s18
wire [2:0] AxiMonitorInterface_awprot_s18;

// Interface: AxiMonitorInterface Signal: awprot_s19
wire [2:0] AxiMonitorInterface_awprot_s19;

// Interface: AxiMonitorInterface Signal: awprot_s20
wire [2:0] AxiMonitorInterface_awprot_s20;

// Interface: AxiMonitorInterface Signal: awprot_s21
wire [2:0] AxiMonitorInterface_awprot_s21;

// Interface: AxiMonitorInterface Signal: awprot_s22
wire [2:0] AxiMonitorInterface_awprot_s22;

// Interface: AxiMonitorInterface Signal: awprot_s23
wire [2:0] AxiMonitorInterface_awprot_s23;

// Interface: AxiMonitorInterface Signal: awprot_s24
wire [2:0] AxiMonitorInterface_awprot_s24;

// Interface: AxiMonitorInterface Signal: awprot_s25
wire [2:0] AxiMonitorInterface_awprot_s25;

// Interface: AxiMonitorInterface Signal: awprot_s26
wire [2:0] AxiMonitorInterface_awprot_s26;

// Interface: AxiMonitorInterface Signal: awprot_s27
wire [2:0] AxiMonitorInterface_awprot_s27;

// Interface: AxiMonitorInterface Signal: awprot_s28
wire [2:0] AxiMonitorInterface_awprot_s28;

// Interface: AxiMonitorInterface Signal: awprot_s29
wire [2:0] AxiMonitorInterface_awprot_s29;

// Interface: AxiMonitorInterface Signal: awprot_s30
wire [2:0] AxiMonitorInterface_awprot_s30;

// Interface: AxiMonitorInterface Signal: awprot_s31
wire [2:0] AxiMonitorInterface_awprot_s31;

// Interface: AxiMonitorInterface Signal: awid_s0
wire [31:0] AxiMonitorInterface_awid_s0;

// Interface: AxiMonitorInterface Signal: awid_s1
wire [31:0] AxiMonitorInterface_awid_s1;

// Interface: AxiMonitorInterface Signal: awid_s2
wire [31:0] AxiMonitorInterface_awid_s2;

// Interface: AxiMonitorInterface Signal: awid_s3
wire [31:0] AxiMonitorInterface_awid_s3;

// Interface: AxiMonitorInterface Signal: awid_s4
wire [31:0] AxiMonitorInterface_awid_s4;

// Interface: AxiMonitorInterface Signal: awid_s5
wire [31:0] AxiMonitorInterface_awid_s5;

// Interface: AxiMonitorInterface Signal: awid_s6
wire [31:0] AxiMonitorInterface_awid_s6;

// Interface: AxiMonitorInterface Signal: awid_s7
wire [31:0] AxiMonitorInterface_awid_s7;

// Interface: AxiMonitorInterface Signal: awid_s8
wire [31:0] AxiMonitorInterface_awid_s8;

// Interface: AxiMonitorInterface Signal: awid_s9
wire [31:0] AxiMonitorInterface_awid_s9;

// Interface: AxiMonitorInterface Signal: awid_s10
wire [31:0] AxiMonitorInterface_awid_s10;

// Interface: AxiMonitorInterface Signal: awid_s11
wire [31:0] AxiMonitorInterface_awid_s11;

// Interface: AxiMonitorInterface Signal: awid_s12
wire [31:0] AxiMonitorInterface_awid_s12;

// Interface: AxiMonitorInterface Signal: awid_s13
wire [31:0] AxiMonitorInterface_awid_s13;

// Interface: AxiMonitorInterface Signal: awid_s14
wire [31:0] AxiMonitorInterface_awid_s14;

// Interface: AxiMonitorInterface Signal: awid_s15
wire [31:0] AxiMonitorInterface_awid_s15;

// Interface: AxiMonitorInterface Signal: awid_s16
wire [31:0] AxiMonitorInterface_awid_s16;

// Interface: AxiMonitorInterface Signal: awid_s17
wire [31:0] AxiMonitorInterface_awid_s17;

// Interface: AxiMonitorInterface Signal: awid_s18
wire [31:0] AxiMonitorInterface_awid_s18;

// Interface: AxiMonitorInterface Signal: awid_s19
wire [31:0] AxiMonitorInterface_awid_s19;

// Interface: AxiMonitorInterface Signal: awid_s20
wire [31:0] AxiMonitorInterface_awid_s20;

// Interface: AxiMonitorInterface Signal: awid_s21
wire [31:0] AxiMonitorInterface_awid_s21;

// Interface: AxiMonitorInterface Signal: awid_s22
wire [31:0] AxiMonitorInterface_awid_s22;

// Interface: AxiMonitorInterface Signal: awid_s23
wire [31:0] AxiMonitorInterface_awid_s23;

// Interface: AxiMonitorInterface Signal: awid_s24
wire [31:0] AxiMonitorInterface_awid_s24;

// Interface: AxiMonitorInterface Signal: awid_s25
wire [31:0] AxiMonitorInterface_awid_s25;

// Interface: AxiMonitorInterface Signal: awid_s26
wire [31:0] AxiMonitorInterface_awid_s26;

// Interface: AxiMonitorInterface Signal: awid_s27
wire [31:0] AxiMonitorInterface_awid_s27;

// Interface: AxiMonitorInterface Signal: awid_s28
wire [31:0] AxiMonitorInterface_awid_s28;

// Interface: AxiMonitorInterface Signal: awid_s29
wire [31:0] AxiMonitorInterface_awid_s29;

// Interface: AxiMonitorInterface Signal: awid_s30
wire [31:0] AxiMonitorInterface_awid_s30;

// Interface: AxiMonitorInterface Signal: awid_s31
wire [31:0] AxiMonitorInterface_awid_s31;

// Interface: AxiMonitorInterface Signal: awready_s0
wire AxiMonitorInterface_awready_s0;

// Interface: AxiMonitorInterface Signal: awready_s1
wire AxiMonitorInterface_awready_s1;

// Interface: AxiMonitorInterface Signal: awready_s2
wire AxiMonitorInterface_awready_s2;

// Interface: AxiMonitorInterface Signal: awready_s3
wire AxiMonitorInterface_awready_s3;

// Interface: AxiMonitorInterface Signal: awready_s4
wire AxiMonitorInterface_awready_s4;

// Interface: AxiMonitorInterface Signal: awready_s5
wire AxiMonitorInterface_awready_s5;

// Interface: AxiMonitorInterface Signal: awready_s6
wire AxiMonitorInterface_awready_s6;

// Interface: AxiMonitorInterface Signal: awready_s7
wire AxiMonitorInterface_awready_s7;

// Interface: AxiMonitorInterface Signal: awready_s8
wire AxiMonitorInterface_awready_s8;

// Interface: AxiMonitorInterface Signal: awready_s9
wire AxiMonitorInterface_awready_s9;

// Interface: AxiMonitorInterface Signal: awready_s10
wire AxiMonitorInterface_awready_s10;

// Interface: AxiMonitorInterface Signal: awready_s11
wire AxiMonitorInterface_awready_s11;

// Interface: AxiMonitorInterface Signal: awready_s12
wire AxiMonitorInterface_awready_s12;

// Interface: AxiMonitorInterface Signal: awready_s13
wire AxiMonitorInterface_awready_s13;

// Interface: AxiMonitorInterface Signal: awready_s14
wire AxiMonitorInterface_awready_s14;

// Interface: AxiMonitorInterface Signal: awready_s15
wire AxiMonitorInterface_awready_s15;

// Interface: AxiMonitorInterface Signal: awready_s16
wire AxiMonitorInterface_awready_s16;

// Interface: AxiMonitorInterface Signal: awready_s17
wire AxiMonitorInterface_awready_s17;

// Interface: AxiMonitorInterface Signal: awready_s18
wire AxiMonitorInterface_awready_s18;

// Interface: AxiMonitorInterface Signal: awready_s19
wire AxiMonitorInterface_awready_s19;

// Interface: AxiMonitorInterface Signal: awready_s20
wire AxiMonitorInterface_awready_s20;

// Interface: AxiMonitorInterface Signal: awready_s21
wire AxiMonitorInterface_awready_s21;

// Interface: AxiMonitorInterface Signal: awready_s22
wire AxiMonitorInterface_awready_s22;

// Interface: AxiMonitorInterface Signal: awready_s23
wire AxiMonitorInterface_awready_s23;

// Interface: AxiMonitorInterface Signal: awready_s24
wire AxiMonitorInterface_awready_s24;

// Interface: AxiMonitorInterface Signal: awready_s25
wire AxiMonitorInterface_awready_s25;

// Interface: AxiMonitorInterface Signal: awready_s26
wire AxiMonitorInterface_awready_s26;

// Interface: AxiMonitorInterface Signal: awready_s27
wire AxiMonitorInterface_awready_s27;

// Interface: AxiMonitorInterface Signal: awready_s28
wire AxiMonitorInterface_awready_s28;

// Interface: AxiMonitorInterface Signal: awready_s29
wire AxiMonitorInterface_awready_s29;

// Interface: AxiMonitorInterface Signal: awready_s30
wire AxiMonitorInterface_awready_s30;

// Interface: AxiMonitorInterface Signal: awready_s31
wire AxiMonitorInterface_awready_s31;

// Interface: AxiMonitorInterface Signal: awsideband_s0
wire [63:0] AxiMonitorInterface_awsideband_s0;

// Interface: AxiMonitorInterface Signal: awsideband_s1
wire [63:0] AxiMonitorInterface_awsideband_s1;

// Interface: AxiMonitorInterface Signal: awsideband_s2
wire [63:0] AxiMonitorInterface_awsideband_s2;

// Interface: AxiMonitorInterface Signal: awsideband_s3
wire [63:0] AxiMonitorInterface_awsideband_s3;

// Interface: AxiMonitorInterface Signal: awsideband_s4
wire [63:0] AxiMonitorInterface_awsideband_s4;

// Interface: AxiMonitorInterface Signal: awsideband_s5
wire [63:0] AxiMonitorInterface_awsideband_s5;

// Interface: AxiMonitorInterface Signal: awsideband_s6
wire [63:0] AxiMonitorInterface_awsideband_s6;

// Interface: AxiMonitorInterface Signal: awsideband_s7
wire [63:0] AxiMonitorInterface_awsideband_s7;

// Interface: AxiMonitorInterface Signal: awsideband_s8
wire [63:0] AxiMonitorInterface_awsideband_s8;

// Interface: AxiMonitorInterface Signal: awsideband_s9
wire [63:0] AxiMonitorInterface_awsideband_s9;

// Interface: AxiMonitorInterface Signal: awsideband_s10
wire [63:0] AxiMonitorInterface_awsideband_s10;

// Interface: AxiMonitorInterface Signal: awsideband_s11
wire [63:0] AxiMonitorInterface_awsideband_s11;

// Interface: AxiMonitorInterface Signal: awsideband_s12
wire [63:0] AxiMonitorInterface_awsideband_s12;

// Interface: AxiMonitorInterface Signal: awsideband_s13
wire [63:0] AxiMonitorInterface_awsideband_s13;

// Interface: AxiMonitorInterface Signal: awsideband_s14
wire [63:0] AxiMonitorInterface_awsideband_s14;

// Interface: AxiMonitorInterface Signal: awsideband_s15
wire [63:0] AxiMonitorInterface_awsideband_s15;

// Interface: AxiMonitorInterface Signal: awsideband_s16
wire [63:0] AxiMonitorInterface_awsideband_s16;

// Interface: AxiMonitorInterface Signal: awsideband_s17
wire [63:0] AxiMonitorInterface_awsideband_s17;

// Interface: AxiMonitorInterface Signal: awsideband_s18
wire [63:0] AxiMonitorInterface_awsideband_s18;

// Interface: AxiMonitorInterface Signal: awsideband_s19
wire [63:0] AxiMonitorInterface_awsideband_s19;

// Interface: AxiMonitorInterface Signal: awsideband_s20
wire [63:0] AxiMonitorInterface_awsideband_s20;

// Interface: AxiMonitorInterface Signal: awsideband_s21
wire [63:0] AxiMonitorInterface_awsideband_s21;

// Interface: AxiMonitorInterface Signal: awsideband_s22
wire [63:0] AxiMonitorInterface_awsideband_s22;

// Interface: AxiMonitorInterface Signal: awsideband_s23
wire [63:0] AxiMonitorInterface_awsideband_s23;

// Interface: AxiMonitorInterface Signal: awsideband_s24
wire [63:0] AxiMonitorInterface_awsideband_s24;

// Interface: AxiMonitorInterface Signal: awsideband_s25
wire [63:0] AxiMonitorInterface_awsideband_s25;

// Interface: AxiMonitorInterface Signal: awsideband_s26
wire [63:0] AxiMonitorInterface_awsideband_s26;

// Interface: AxiMonitorInterface Signal: awsideband_s27
wire [63:0] AxiMonitorInterface_awsideband_s27;

// Interface: AxiMonitorInterface Signal: awsideband_s28
wire [63:0] AxiMonitorInterface_awsideband_s28;

// Interface: AxiMonitorInterface Signal: awsideband_s29
wire [63:0] AxiMonitorInterface_awsideband_s29;

// Interface: AxiMonitorInterface Signal: awsideband_s30
wire [63:0] AxiMonitorInterface_awsideband_s30;

// Interface: AxiMonitorInterface Signal: awsideband_s31
wire [63:0] AxiMonitorInterface_awsideband_s31;

// Interface: AxiMonitorInterface Signal: rvalid_s0
wire AxiMonitorInterface_rvalid_s0;

// Interface: AxiMonitorInterface Signal: rvalid_s1
wire AxiMonitorInterface_rvalid_s1;

// Interface: AxiMonitorInterface Signal: rvalid_s2
wire AxiMonitorInterface_rvalid_s2;

// Interface: AxiMonitorInterface Signal: rvalid_s3
wire AxiMonitorInterface_rvalid_s3;

// Interface: AxiMonitorInterface Signal: rvalid_s4
wire AxiMonitorInterface_rvalid_s4;

// Interface: AxiMonitorInterface Signal: rvalid_s5
wire AxiMonitorInterface_rvalid_s5;

// Interface: AxiMonitorInterface Signal: rvalid_s6
wire AxiMonitorInterface_rvalid_s6;

// Interface: AxiMonitorInterface Signal: rvalid_s7
wire AxiMonitorInterface_rvalid_s7;

// Interface: AxiMonitorInterface Signal: rvalid_s8
wire AxiMonitorInterface_rvalid_s8;

// Interface: AxiMonitorInterface Signal: rvalid_s9
wire AxiMonitorInterface_rvalid_s9;

// Interface: AxiMonitorInterface Signal: rvalid_s10
wire AxiMonitorInterface_rvalid_s10;

// Interface: AxiMonitorInterface Signal: rvalid_s11
wire AxiMonitorInterface_rvalid_s11;

// Interface: AxiMonitorInterface Signal: rvalid_s12
wire AxiMonitorInterface_rvalid_s12;

// Interface: AxiMonitorInterface Signal: rvalid_s13
wire AxiMonitorInterface_rvalid_s13;

// Interface: AxiMonitorInterface Signal: rvalid_s14
wire AxiMonitorInterface_rvalid_s14;

// Interface: AxiMonitorInterface Signal: rvalid_s15
wire AxiMonitorInterface_rvalid_s15;

// Interface: AxiMonitorInterface Signal: rvalid_s16
wire AxiMonitorInterface_rvalid_s16;

// Interface: AxiMonitorInterface Signal: rvalid_s17
wire AxiMonitorInterface_rvalid_s17;

// Interface: AxiMonitorInterface Signal: rvalid_s18
wire AxiMonitorInterface_rvalid_s18;

// Interface: AxiMonitorInterface Signal: rvalid_s19
wire AxiMonitorInterface_rvalid_s19;

// Interface: AxiMonitorInterface Signal: rvalid_s20
wire AxiMonitorInterface_rvalid_s20;

// Interface: AxiMonitorInterface Signal: rvalid_s21
wire AxiMonitorInterface_rvalid_s21;

// Interface: AxiMonitorInterface Signal: rvalid_s22
wire AxiMonitorInterface_rvalid_s22;

// Interface: AxiMonitorInterface Signal: rvalid_s23
wire AxiMonitorInterface_rvalid_s23;

// Interface: AxiMonitorInterface Signal: rvalid_s24
wire AxiMonitorInterface_rvalid_s24;

// Interface: AxiMonitorInterface Signal: rvalid_s25
wire AxiMonitorInterface_rvalid_s25;

// Interface: AxiMonitorInterface Signal: rvalid_s26
wire AxiMonitorInterface_rvalid_s26;

// Interface: AxiMonitorInterface Signal: rvalid_s27
wire AxiMonitorInterface_rvalid_s27;

// Interface: AxiMonitorInterface Signal: rvalid_s28
wire AxiMonitorInterface_rvalid_s28;

// Interface: AxiMonitorInterface Signal: rvalid_s29
wire AxiMonitorInterface_rvalid_s29;

// Interface: AxiMonitorInterface Signal: rvalid_s30
wire AxiMonitorInterface_rvalid_s30;

// Interface: AxiMonitorInterface Signal: rvalid_s31
wire AxiMonitorInterface_rvalid_s31;

// Interface: AxiMonitorInterface Signal: rlast_s0
wire AxiMonitorInterface_rlast_s0;

// Interface: AxiMonitorInterface Signal: rlast_s1
wire AxiMonitorInterface_rlast_s1;

// Interface: AxiMonitorInterface Signal: rlast_s2
wire AxiMonitorInterface_rlast_s2;

// Interface: AxiMonitorInterface Signal: rlast_s3
wire AxiMonitorInterface_rlast_s3;

// Interface: AxiMonitorInterface Signal: rlast_s4
wire AxiMonitorInterface_rlast_s4;

// Interface: AxiMonitorInterface Signal: rlast_s5
wire AxiMonitorInterface_rlast_s5;

// Interface: AxiMonitorInterface Signal: rlast_s6
wire AxiMonitorInterface_rlast_s6;

// Interface: AxiMonitorInterface Signal: rlast_s7
wire AxiMonitorInterface_rlast_s7;

// Interface: AxiMonitorInterface Signal: rlast_s8
wire AxiMonitorInterface_rlast_s8;

// Interface: AxiMonitorInterface Signal: rlast_s9
wire AxiMonitorInterface_rlast_s9;

// Interface: AxiMonitorInterface Signal: rlast_s10
wire AxiMonitorInterface_rlast_s10;

// Interface: AxiMonitorInterface Signal: rlast_s11
wire AxiMonitorInterface_rlast_s11;

// Interface: AxiMonitorInterface Signal: rlast_s12
wire AxiMonitorInterface_rlast_s12;

// Interface: AxiMonitorInterface Signal: rlast_s13
wire AxiMonitorInterface_rlast_s13;

// Interface: AxiMonitorInterface Signal: rlast_s14
wire AxiMonitorInterface_rlast_s14;

// Interface: AxiMonitorInterface Signal: rlast_s15
wire AxiMonitorInterface_rlast_s15;

// Interface: AxiMonitorInterface Signal: rlast_s16
wire AxiMonitorInterface_rlast_s16;

// Interface: AxiMonitorInterface Signal: rlast_s17
wire AxiMonitorInterface_rlast_s17;

// Interface: AxiMonitorInterface Signal: rlast_s18
wire AxiMonitorInterface_rlast_s18;

// Interface: AxiMonitorInterface Signal: rlast_s19
wire AxiMonitorInterface_rlast_s19;

// Interface: AxiMonitorInterface Signal: rlast_s20
wire AxiMonitorInterface_rlast_s20;

// Interface: AxiMonitorInterface Signal: rlast_s21
wire AxiMonitorInterface_rlast_s21;

// Interface: AxiMonitorInterface Signal: rlast_s22
wire AxiMonitorInterface_rlast_s22;

// Interface: AxiMonitorInterface Signal: rlast_s23
wire AxiMonitorInterface_rlast_s23;

// Interface: AxiMonitorInterface Signal: rlast_s24
wire AxiMonitorInterface_rlast_s24;

// Interface: AxiMonitorInterface Signal: rlast_s25
wire AxiMonitorInterface_rlast_s25;

// Interface: AxiMonitorInterface Signal: rlast_s26
wire AxiMonitorInterface_rlast_s26;

// Interface: AxiMonitorInterface Signal: rlast_s27
wire AxiMonitorInterface_rlast_s27;

// Interface: AxiMonitorInterface Signal: rlast_s28
wire AxiMonitorInterface_rlast_s28;

// Interface: AxiMonitorInterface Signal: rlast_s29
wire AxiMonitorInterface_rlast_s29;

// Interface: AxiMonitorInterface Signal: rlast_s30
wire AxiMonitorInterface_rlast_s30;

// Interface: AxiMonitorInterface Signal: rlast_s31
wire AxiMonitorInterface_rlast_s31;

// Interface: AxiMonitorInterface Signal: rdata_s0
wire [1023:0] AxiMonitorInterface_rdata_s0;

// Interface: AxiMonitorInterface Signal: rdata_s1
wire [1023:0] AxiMonitorInterface_rdata_s1;

// Interface: AxiMonitorInterface Signal: rdata_s2
wire [1023:0] AxiMonitorInterface_rdata_s2;

// Interface: AxiMonitorInterface Signal: rdata_s3
wire [1023:0] AxiMonitorInterface_rdata_s3;

// Interface: AxiMonitorInterface Signal: rdata_s4
wire [1023:0] AxiMonitorInterface_rdata_s4;

// Interface: AxiMonitorInterface Signal: rdata_s5
wire [1023:0] AxiMonitorInterface_rdata_s5;

// Interface: AxiMonitorInterface Signal: rdata_s6
wire [1023:0] AxiMonitorInterface_rdata_s6;

// Interface: AxiMonitorInterface Signal: rdata_s7
wire [1023:0] AxiMonitorInterface_rdata_s7;

// Interface: AxiMonitorInterface Signal: rdata_s8
wire [1023:0] AxiMonitorInterface_rdata_s8;

// Interface: AxiMonitorInterface Signal: rdata_s9
wire [1023:0] AxiMonitorInterface_rdata_s9;

// Interface: AxiMonitorInterface Signal: rdata_s10
wire [1023:0] AxiMonitorInterface_rdata_s10;

// Interface: AxiMonitorInterface Signal: rdata_s11
wire [1023:0] AxiMonitorInterface_rdata_s11;

// Interface: AxiMonitorInterface Signal: rdata_s12
wire [1023:0] AxiMonitorInterface_rdata_s12;

// Interface: AxiMonitorInterface Signal: rdata_s13
wire [1023:0] AxiMonitorInterface_rdata_s13;

// Interface: AxiMonitorInterface Signal: rdata_s14
wire [1023:0] AxiMonitorInterface_rdata_s14;

// Interface: AxiMonitorInterface Signal: rdata_s15
wire [1023:0] AxiMonitorInterface_rdata_s15;

// Interface: AxiMonitorInterface Signal: rdata_s16
wire [1023:0] AxiMonitorInterface_rdata_s16;

// Interface: AxiMonitorInterface Signal: rdata_s17
wire [1023:0] AxiMonitorInterface_rdata_s17;

// Interface: AxiMonitorInterface Signal: rdata_s18
wire [1023:0] AxiMonitorInterface_rdata_s18;

// Interface: AxiMonitorInterface Signal: rdata_s19
wire [1023:0] AxiMonitorInterface_rdata_s19;

// Interface: AxiMonitorInterface Signal: rdata_s20
wire [1023:0] AxiMonitorInterface_rdata_s20;

// Interface: AxiMonitorInterface Signal: rdata_s21
wire [1023:0] AxiMonitorInterface_rdata_s21;

// Interface: AxiMonitorInterface Signal: rdata_s22
wire [1023:0] AxiMonitorInterface_rdata_s22;

// Interface: AxiMonitorInterface Signal: rdata_s23
wire [1023:0] AxiMonitorInterface_rdata_s23;

// Interface: AxiMonitorInterface Signal: rdata_s24
wire [1023:0] AxiMonitorInterface_rdata_s24;

// Interface: AxiMonitorInterface Signal: rdata_s25
wire [1023:0] AxiMonitorInterface_rdata_s25;

// Interface: AxiMonitorInterface Signal: rdata_s26
wire [1023:0] AxiMonitorInterface_rdata_s26;

// Interface: AxiMonitorInterface Signal: rdata_s27
wire [1023:0] AxiMonitorInterface_rdata_s27;

// Interface: AxiMonitorInterface Signal: rdata_s28
wire [1023:0] AxiMonitorInterface_rdata_s28;

// Interface: AxiMonitorInterface Signal: rdata_s29
wire [1023:0] AxiMonitorInterface_rdata_s29;

// Interface: AxiMonitorInterface Signal: rdata_s30
wire [1023:0] AxiMonitorInterface_rdata_s30;

// Interface: AxiMonitorInterface Signal: rdata_s31
wire [1023:0] AxiMonitorInterface_rdata_s31;

// Interface: AxiMonitorInterface Signal: rresp_s0
wire [1:0] AxiMonitorInterface_rresp_s0;

// Interface: AxiMonitorInterface Signal: rresp_s1
wire [1:0] AxiMonitorInterface_rresp_s1;

// Interface: AxiMonitorInterface Signal: rresp_s2
wire [1:0] AxiMonitorInterface_rresp_s2;

// Interface: AxiMonitorInterface Signal: rresp_s3
wire [1:0] AxiMonitorInterface_rresp_s3;

// Interface: AxiMonitorInterface Signal: rresp_s4
wire [1:0] AxiMonitorInterface_rresp_s4;

// Interface: AxiMonitorInterface Signal: rresp_s5
wire [1:0] AxiMonitorInterface_rresp_s5;

// Interface: AxiMonitorInterface Signal: rresp_s6
wire [1:0] AxiMonitorInterface_rresp_s6;

// Interface: AxiMonitorInterface Signal: rresp_s7
wire [1:0] AxiMonitorInterface_rresp_s7;

// Interface: AxiMonitorInterface Signal: rresp_s8
wire [1:0] AxiMonitorInterface_rresp_s8;

// Interface: AxiMonitorInterface Signal: rresp_s9
wire [1:0] AxiMonitorInterface_rresp_s9;

// Interface: AxiMonitorInterface Signal: rresp_s10
wire [1:0] AxiMonitorInterface_rresp_s10;

// Interface: AxiMonitorInterface Signal: rresp_s11
wire [1:0] AxiMonitorInterface_rresp_s11;

// Interface: AxiMonitorInterface Signal: rresp_s12
wire [1:0] AxiMonitorInterface_rresp_s12;

// Interface: AxiMonitorInterface Signal: rresp_s13
wire [1:0] AxiMonitorInterface_rresp_s13;

// Interface: AxiMonitorInterface Signal: rresp_s14
wire [1:0] AxiMonitorInterface_rresp_s14;

// Interface: AxiMonitorInterface Signal: rresp_s15
wire [1:0] AxiMonitorInterface_rresp_s15;

// Interface: AxiMonitorInterface Signal: rresp_s16
wire [1:0] AxiMonitorInterface_rresp_s16;

// Interface: AxiMonitorInterface Signal: rresp_s17
wire [1:0] AxiMonitorInterface_rresp_s17;

// Interface: AxiMonitorInterface Signal: rresp_s18
wire [1:0] AxiMonitorInterface_rresp_s18;

// Interface: AxiMonitorInterface Signal: rresp_s19
wire [1:0] AxiMonitorInterface_rresp_s19;

// Interface: AxiMonitorInterface Signal: rresp_s20
wire [1:0] AxiMonitorInterface_rresp_s20;

// Interface: AxiMonitorInterface Signal: rresp_s21
wire [1:0] AxiMonitorInterface_rresp_s21;

// Interface: AxiMonitorInterface Signal: rresp_s22
wire [1:0] AxiMonitorInterface_rresp_s22;

// Interface: AxiMonitorInterface Signal: rresp_s23
wire [1:0] AxiMonitorInterface_rresp_s23;

// Interface: AxiMonitorInterface Signal: rresp_s24
wire [1:0] AxiMonitorInterface_rresp_s24;

// Interface: AxiMonitorInterface Signal: rresp_s25
wire [1:0] AxiMonitorInterface_rresp_s25;

// Interface: AxiMonitorInterface Signal: rresp_s26
wire [1:0] AxiMonitorInterface_rresp_s26;

// Interface: AxiMonitorInterface Signal: rresp_s27
wire [1:0] AxiMonitorInterface_rresp_s27;

// Interface: AxiMonitorInterface Signal: rresp_s28
wire [1:0] AxiMonitorInterface_rresp_s28;

// Interface: AxiMonitorInterface Signal: rresp_s29
wire [1:0] AxiMonitorInterface_rresp_s29;

// Interface: AxiMonitorInterface Signal: rresp_s30
wire [1:0] AxiMonitorInterface_rresp_s30;

// Interface: AxiMonitorInterface Signal: rresp_s31
wire [1:0] AxiMonitorInterface_rresp_s31;

// Interface: AxiMonitorInterface Signal: rid_s0
wire [31:0] AxiMonitorInterface_rid_s0;

// Interface: AxiMonitorInterface Signal: rid_s1
wire [31:0] AxiMonitorInterface_rid_s1;

// Interface: AxiMonitorInterface Signal: rid_s2
wire [31:0] AxiMonitorInterface_rid_s2;

// Interface: AxiMonitorInterface Signal: rid_s3
wire [31:0] AxiMonitorInterface_rid_s3;

// Interface: AxiMonitorInterface Signal: rid_s4
wire [31:0] AxiMonitorInterface_rid_s4;

// Interface: AxiMonitorInterface Signal: rid_s5
wire [31:0] AxiMonitorInterface_rid_s5;

// Interface: AxiMonitorInterface Signal: rid_s6
wire [31:0] AxiMonitorInterface_rid_s6;

// Interface: AxiMonitorInterface Signal: rid_s7
wire [31:0] AxiMonitorInterface_rid_s7;

// Interface: AxiMonitorInterface Signal: rid_s8
wire [31:0] AxiMonitorInterface_rid_s8;

// Interface: AxiMonitorInterface Signal: rid_s9
wire [31:0] AxiMonitorInterface_rid_s9;

// Interface: AxiMonitorInterface Signal: rid_s10
wire [31:0] AxiMonitorInterface_rid_s10;

// Interface: AxiMonitorInterface Signal: rid_s11
wire [31:0] AxiMonitorInterface_rid_s11;

// Interface: AxiMonitorInterface Signal: rid_s12
wire [31:0] AxiMonitorInterface_rid_s12;

// Interface: AxiMonitorInterface Signal: rid_s13
wire [31:0] AxiMonitorInterface_rid_s13;

// Interface: AxiMonitorInterface Signal: rid_s14
wire [31:0] AxiMonitorInterface_rid_s14;

// Interface: AxiMonitorInterface Signal: rid_s15
wire [31:0] AxiMonitorInterface_rid_s15;

// Interface: AxiMonitorInterface Signal: rid_s16
wire [31:0] AxiMonitorInterface_rid_s16;

// Interface: AxiMonitorInterface Signal: rid_s17
wire [31:0] AxiMonitorInterface_rid_s17;

// Interface: AxiMonitorInterface Signal: rid_s18
wire [31:0] AxiMonitorInterface_rid_s18;

// Interface: AxiMonitorInterface Signal: rid_s19
wire [31:0] AxiMonitorInterface_rid_s19;

// Interface: AxiMonitorInterface Signal: rid_s20
wire [31:0] AxiMonitorInterface_rid_s20;

// Interface: AxiMonitorInterface Signal: rid_s21
wire [31:0] AxiMonitorInterface_rid_s21;

// Interface: AxiMonitorInterface Signal: rid_s22
wire [31:0] AxiMonitorInterface_rid_s22;

// Interface: AxiMonitorInterface Signal: rid_s23
wire [31:0] AxiMonitorInterface_rid_s23;

// Interface: AxiMonitorInterface Signal: rid_s24
wire [31:0] AxiMonitorInterface_rid_s24;

// Interface: AxiMonitorInterface Signal: rid_s25
wire [31:0] AxiMonitorInterface_rid_s25;

// Interface: AxiMonitorInterface Signal: rid_s26
wire [31:0] AxiMonitorInterface_rid_s26;

// Interface: AxiMonitorInterface Signal: rid_s27
wire [31:0] AxiMonitorInterface_rid_s27;

// Interface: AxiMonitorInterface Signal: rid_s28
wire [31:0] AxiMonitorInterface_rid_s28;

// Interface: AxiMonitorInterface Signal: rid_s29
wire [31:0] AxiMonitorInterface_rid_s29;

// Interface: AxiMonitorInterface Signal: rid_s30
wire [31:0] AxiMonitorInterface_rid_s30;

// Interface: AxiMonitorInterface Signal: rid_s31
wire [31:0] AxiMonitorInterface_rid_s31;

// Interface: AxiMonitorInterface Signal: rready_s0
wire AxiMonitorInterface_rready_s0;

// Interface: AxiMonitorInterface Signal: rready_s1
wire AxiMonitorInterface_rready_s1;

// Interface: AxiMonitorInterface Signal: rready_s2
wire AxiMonitorInterface_rready_s2;

// Interface: AxiMonitorInterface Signal: rready_s3
wire AxiMonitorInterface_rready_s3;

// Interface: AxiMonitorInterface Signal: rready_s4
wire AxiMonitorInterface_rready_s4;

// Interface: AxiMonitorInterface Signal: rready_s5
wire AxiMonitorInterface_rready_s5;

// Interface: AxiMonitorInterface Signal: rready_s6
wire AxiMonitorInterface_rready_s6;

// Interface: AxiMonitorInterface Signal: rready_s7
wire AxiMonitorInterface_rready_s7;

// Interface: AxiMonitorInterface Signal: rready_s8
wire AxiMonitorInterface_rready_s8;

// Interface: AxiMonitorInterface Signal: rready_s9
wire AxiMonitorInterface_rready_s9;

// Interface: AxiMonitorInterface Signal: rready_s10
wire AxiMonitorInterface_rready_s10;

// Interface: AxiMonitorInterface Signal: rready_s11
wire AxiMonitorInterface_rready_s11;

// Interface: AxiMonitorInterface Signal: rready_s12
wire AxiMonitorInterface_rready_s12;

// Interface: AxiMonitorInterface Signal: rready_s13
wire AxiMonitorInterface_rready_s13;

// Interface: AxiMonitorInterface Signal: rready_s14
wire AxiMonitorInterface_rready_s14;

// Interface: AxiMonitorInterface Signal: rready_s15
wire AxiMonitorInterface_rready_s15;

// Interface: AxiMonitorInterface Signal: rready_s16
wire AxiMonitorInterface_rready_s16;

// Interface: AxiMonitorInterface Signal: rready_s17
wire AxiMonitorInterface_rready_s17;

// Interface: AxiMonitorInterface Signal: rready_s18
wire AxiMonitorInterface_rready_s18;

// Interface: AxiMonitorInterface Signal: rready_s19
wire AxiMonitorInterface_rready_s19;

// Interface: AxiMonitorInterface Signal: rready_s20
wire AxiMonitorInterface_rready_s20;

// Interface: AxiMonitorInterface Signal: rready_s21
wire AxiMonitorInterface_rready_s21;

// Interface: AxiMonitorInterface Signal: rready_s22
wire AxiMonitorInterface_rready_s22;

// Interface: AxiMonitorInterface Signal: rready_s23
wire AxiMonitorInterface_rready_s23;

// Interface: AxiMonitorInterface Signal: rready_s24
wire AxiMonitorInterface_rready_s24;

// Interface: AxiMonitorInterface Signal: rready_s25
wire AxiMonitorInterface_rready_s25;

// Interface: AxiMonitorInterface Signal: rready_s26
wire AxiMonitorInterface_rready_s26;

// Interface: AxiMonitorInterface Signal: rready_s27
wire AxiMonitorInterface_rready_s27;

// Interface: AxiMonitorInterface Signal: rready_s28
wire AxiMonitorInterface_rready_s28;

// Interface: AxiMonitorInterface Signal: rready_s29
wire AxiMonitorInterface_rready_s29;

// Interface: AxiMonitorInterface Signal: rready_s30
wire AxiMonitorInterface_rready_s30;

// Interface: AxiMonitorInterface Signal: rready_s31
wire AxiMonitorInterface_rready_s31;

// Interface: AxiMonitorInterface Signal: rsideband_s0
wire [63:0] AxiMonitorInterface_rsideband_s0;

// Interface: AxiMonitorInterface Signal: rsideband_s1
wire [63:0] AxiMonitorInterface_rsideband_s1;

// Interface: AxiMonitorInterface Signal: rsideband_s2
wire [63:0] AxiMonitorInterface_rsideband_s2;

// Interface: AxiMonitorInterface Signal: rsideband_s3
wire [63:0] AxiMonitorInterface_rsideband_s3;

// Interface: AxiMonitorInterface Signal: rsideband_s4
wire [63:0] AxiMonitorInterface_rsideband_s4;

// Interface: AxiMonitorInterface Signal: rsideband_s5
wire [63:0] AxiMonitorInterface_rsideband_s5;

// Interface: AxiMonitorInterface Signal: rsideband_s6
wire [63:0] AxiMonitorInterface_rsideband_s6;

// Interface: AxiMonitorInterface Signal: rsideband_s7
wire [63:0] AxiMonitorInterface_rsideband_s7;

// Interface: AxiMonitorInterface Signal: rsideband_s8
wire [63:0] AxiMonitorInterface_rsideband_s8;

// Interface: AxiMonitorInterface Signal: rsideband_s9
wire [63:0] AxiMonitorInterface_rsideband_s9;

// Interface: AxiMonitorInterface Signal: rsideband_s10
wire [63:0] AxiMonitorInterface_rsideband_s10;

// Interface: AxiMonitorInterface Signal: rsideband_s11
wire [63:0] AxiMonitorInterface_rsideband_s11;

// Interface: AxiMonitorInterface Signal: rsideband_s12
wire [63:0] AxiMonitorInterface_rsideband_s12;

// Interface: AxiMonitorInterface Signal: rsideband_s13
wire [63:0] AxiMonitorInterface_rsideband_s13;

// Interface: AxiMonitorInterface Signal: rsideband_s14
wire [63:0] AxiMonitorInterface_rsideband_s14;

// Interface: AxiMonitorInterface Signal: rsideband_s15
wire [63:0] AxiMonitorInterface_rsideband_s15;

// Interface: AxiMonitorInterface Signal: rsideband_s16
wire [63:0] AxiMonitorInterface_rsideband_s16;

// Interface: AxiMonitorInterface Signal: rsideband_s17
wire [63:0] AxiMonitorInterface_rsideband_s17;

// Interface: AxiMonitorInterface Signal: rsideband_s18
wire [63:0] AxiMonitorInterface_rsideband_s18;

// Interface: AxiMonitorInterface Signal: rsideband_s19
wire [63:0] AxiMonitorInterface_rsideband_s19;

// Interface: AxiMonitorInterface Signal: rsideband_s20
wire [63:0] AxiMonitorInterface_rsideband_s20;

// Interface: AxiMonitorInterface Signal: rsideband_s21
wire [63:0] AxiMonitorInterface_rsideband_s21;

// Interface: AxiMonitorInterface Signal: rsideband_s22
wire [63:0] AxiMonitorInterface_rsideband_s22;

// Interface: AxiMonitorInterface Signal: rsideband_s23
wire [63:0] AxiMonitorInterface_rsideband_s23;

// Interface: AxiMonitorInterface Signal: rsideband_s24
wire [63:0] AxiMonitorInterface_rsideband_s24;

// Interface: AxiMonitorInterface Signal: rsideband_s25
wire [63:0] AxiMonitorInterface_rsideband_s25;

// Interface: AxiMonitorInterface Signal: rsideband_s26
wire [63:0] AxiMonitorInterface_rsideband_s26;

// Interface: AxiMonitorInterface Signal: rsideband_s27
wire [63:0] AxiMonitorInterface_rsideband_s27;

// Interface: AxiMonitorInterface Signal: rsideband_s28
wire [63:0] AxiMonitorInterface_rsideband_s28;

// Interface: AxiMonitorInterface Signal: rsideband_s29
wire [63:0] AxiMonitorInterface_rsideband_s29;

// Interface: AxiMonitorInterface Signal: rsideband_s30
wire [63:0] AxiMonitorInterface_rsideband_s30;

// Interface: AxiMonitorInterface Signal: rsideband_s31
wire [63:0] AxiMonitorInterface_rsideband_s31;

// Interface: AxiMonitorInterface Signal: wvalid_s0
wire AxiMonitorInterface_wvalid_s0;

// Interface: AxiMonitorInterface Signal: wvalid_s1
wire AxiMonitorInterface_wvalid_s1;

// Interface: AxiMonitorInterface Signal: wvalid_s2
wire AxiMonitorInterface_wvalid_s2;

// Interface: AxiMonitorInterface Signal: wvalid_s3
wire AxiMonitorInterface_wvalid_s3;

// Interface: AxiMonitorInterface Signal: wvalid_s4
wire AxiMonitorInterface_wvalid_s4;

// Interface: AxiMonitorInterface Signal: wvalid_s5
wire AxiMonitorInterface_wvalid_s5;

// Interface: AxiMonitorInterface Signal: wvalid_s6
wire AxiMonitorInterface_wvalid_s6;

// Interface: AxiMonitorInterface Signal: wvalid_s7
wire AxiMonitorInterface_wvalid_s7;

// Interface: AxiMonitorInterface Signal: wvalid_s8
wire AxiMonitorInterface_wvalid_s8;

// Interface: AxiMonitorInterface Signal: wvalid_s9
wire AxiMonitorInterface_wvalid_s9;

// Interface: AxiMonitorInterface Signal: wvalid_s10
wire AxiMonitorInterface_wvalid_s10;

// Interface: AxiMonitorInterface Signal: wvalid_s11
wire AxiMonitorInterface_wvalid_s11;

// Interface: AxiMonitorInterface Signal: wvalid_s12
wire AxiMonitorInterface_wvalid_s12;

// Interface: AxiMonitorInterface Signal: wvalid_s13
wire AxiMonitorInterface_wvalid_s13;

// Interface: AxiMonitorInterface Signal: wvalid_s14
wire AxiMonitorInterface_wvalid_s14;

// Interface: AxiMonitorInterface Signal: wvalid_s15
wire AxiMonitorInterface_wvalid_s15;

// Interface: AxiMonitorInterface Signal: wvalid_s16
wire AxiMonitorInterface_wvalid_s16;

// Interface: AxiMonitorInterface Signal: wvalid_s17
wire AxiMonitorInterface_wvalid_s17;

// Interface: AxiMonitorInterface Signal: wvalid_s18
wire AxiMonitorInterface_wvalid_s18;

// Interface: AxiMonitorInterface Signal: wvalid_s19
wire AxiMonitorInterface_wvalid_s19;

// Interface: AxiMonitorInterface Signal: wvalid_s20
wire AxiMonitorInterface_wvalid_s20;

// Interface: AxiMonitorInterface Signal: wvalid_s21
wire AxiMonitorInterface_wvalid_s21;

// Interface: AxiMonitorInterface Signal: wvalid_s22
wire AxiMonitorInterface_wvalid_s22;

// Interface: AxiMonitorInterface Signal: wvalid_s23
wire AxiMonitorInterface_wvalid_s23;

// Interface: AxiMonitorInterface Signal: wvalid_s24
wire AxiMonitorInterface_wvalid_s24;

// Interface: AxiMonitorInterface Signal: wvalid_s25
wire AxiMonitorInterface_wvalid_s25;

// Interface: AxiMonitorInterface Signal: wvalid_s26
wire AxiMonitorInterface_wvalid_s26;

// Interface: AxiMonitorInterface Signal: wvalid_s27
wire AxiMonitorInterface_wvalid_s27;

// Interface: AxiMonitorInterface Signal: wvalid_s28
wire AxiMonitorInterface_wvalid_s28;

// Interface: AxiMonitorInterface Signal: wvalid_s29
wire AxiMonitorInterface_wvalid_s29;

// Interface: AxiMonitorInterface Signal: wvalid_s30
wire AxiMonitorInterface_wvalid_s30;

// Interface: AxiMonitorInterface Signal: wvalid_s31
wire AxiMonitorInterface_wvalid_s31;

// Interface: AxiMonitorInterface Signal: wlast_s0
wire AxiMonitorInterface_wlast_s0;

// Interface: AxiMonitorInterface Signal: wlast_s1
wire AxiMonitorInterface_wlast_s1;

// Interface: AxiMonitorInterface Signal: wlast_s2
wire AxiMonitorInterface_wlast_s2;

// Interface: AxiMonitorInterface Signal: wlast_s3
wire AxiMonitorInterface_wlast_s3;

// Interface: AxiMonitorInterface Signal: wlast_s4
wire AxiMonitorInterface_wlast_s4;

// Interface: AxiMonitorInterface Signal: wlast_s5
wire AxiMonitorInterface_wlast_s5;

// Interface: AxiMonitorInterface Signal: wlast_s6
wire AxiMonitorInterface_wlast_s6;

// Interface: AxiMonitorInterface Signal: wlast_s7
wire AxiMonitorInterface_wlast_s7;

// Interface: AxiMonitorInterface Signal: wlast_s8
wire AxiMonitorInterface_wlast_s8;

// Interface: AxiMonitorInterface Signal: wlast_s9
wire AxiMonitorInterface_wlast_s9;

// Interface: AxiMonitorInterface Signal: wlast_s10
wire AxiMonitorInterface_wlast_s10;

// Interface: AxiMonitorInterface Signal: wlast_s11
wire AxiMonitorInterface_wlast_s11;

// Interface: AxiMonitorInterface Signal: wlast_s12
wire AxiMonitorInterface_wlast_s12;

// Interface: AxiMonitorInterface Signal: wlast_s13
wire AxiMonitorInterface_wlast_s13;

// Interface: AxiMonitorInterface Signal: wlast_s14
wire AxiMonitorInterface_wlast_s14;

// Interface: AxiMonitorInterface Signal: wlast_s15
wire AxiMonitorInterface_wlast_s15;

// Interface: AxiMonitorInterface Signal: wlast_s16
wire AxiMonitorInterface_wlast_s16;

// Interface: AxiMonitorInterface Signal: wlast_s17
wire AxiMonitorInterface_wlast_s17;

// Interface: AxiMonitorInterface Signal: wlast_s18
wire AxiMonitorInterface_wlast_s18;

// Interface: AxiMonitorInterface Signal: wlast_s19
wire AxiMonitorInterface_wlast_s19;

// Interface: AxiMonitorInterface Signal: wlast_s20
wire AxiMonitorInterface_wlast_s20;

// Interface: AxiMonitorInterface Signal: wlast_s21
wire AxiMonitorInterface_wlast_s21;

// Interface: AxiMonitorInterface Signal: wlast_s22
wire AxiMonitorInterface_wlast_s22;

// Interface: AxiMonitorInterface Signal: wlast_s23
wire AxiMonitorInterface_wlast_s23;

// Interface: AxiMonitorInterface Signal: wlast_s24
wire AxiMonitorInterface_wlast_s24;

// Interface: AxiMonitorInterface Signal: wlast_s25
wire AxiMonitorInterface_wlast_s25;

// Interface: AxiMonitorInterface Signal: wlast_s26
wire AxiMonitorInterface_wlast_s26;

// Interface: AxiMonitorInterface Signal: wlast_s27
wire AxiMonitorInterface_wlast_s27;

// Interface: AxiMonitorInterface Signal: wlast_s28
wire AxiMonitorInterface_wlast_s28;

// Interface: AxiMonitorInterface Signal: wlast_s29
wire AxiMonitorInterface_wlast_s29;

// Interface: AxiMonitorInterface Signal: wlast_s30
wire AxiMonitorInterface_wlast_s30;

// Interface: AxiMonitorInterface Signal: wlast_s31
wire AxiMonitorInterface_wlast_s31;

// Interface: AxiMonitorInterface Signal: wdata_s0
wire [1023:0] AxiMonitorInterface_wdata_s0;

// Interface: AxiMonitorInterface Signal: wdata_s1
wire [1023:0] AxiMonitorInterface_wdata_s1;

// Interface: AxiMonitorInterface Signal: wdata_s2
wire [1023:0] AxiMonitorInterface_wdata_s2;

// Interface: AxiMonitorInterface Signal: wdata_s3
wire [1023:0] AxiMonitorInterface_wdata_s3;

// Interface: AxiMonitorInterface Signal: wdata_s4
wire [1023:0] AxiMonitorInterface_wdata_s4;

// Interface: AxiMonitorInterface Signal: wdata_s5
wire [1023:0] AxiMonitorInterface_wdata_s5;

// Interface: AxiMonitorInterface Signal: wdata_s6
wire [1023:0] AxiMonitorInterface_wdata_s6;

// Interface: AxiMonitorInterface Signal: wdata_s7
wire [1023:0] AxiMonitorInterface_wdata_s7;

// Interface: AxiMonitorInterface Signal: wdata_s8
wire [1023:0] AxiMonitorInterface_wdata_s8;

// Interface: AxiMonitorInterface Signal: wdata_s9
wire [1023:0] AxiMonitorInterface_wdata_s9;

// Interface: AxiMonitorInterface Signal: wdata_s10
wire [1023:0] AxiMonitorInterface_wdata_s10;

// Interface: AxiMonitorInterface Signal: wdata_s11
wire [1023:0] AxiMonitorInterface_wdata_s11;

// Interface: AxiMonitorInterface Signal: wdata_s12
wire [1023:0] AxiMonitorInterface_wdata_s12;

// Interface: AxiMonitorInterface Signal: wdata_s13
wire [1023:0] AxiMonitorInterface_wdata_s13;

// Interface: AxiMonitorInterface Signal: wdata_s14
wire [1023:0] AxiMonitorInterface_wdata_s14;

// Interface: AxiMonitorInterface Signal: wdata_s15
wire [1023:0] AxiMonitorInterface_wdata_s15;

// Interface: AxiMonitorInterface Signal: wdata_s16
wire [1023:0] AxiMonitorInterface_wdata_s16;

// Interface: AxiMonitorInterface Signal: wdata_s17
wire [1023:0] AxiMonitorInterface_wdata_s17;

// Interface: AxiMonitorInterface Signal: wdata_s18
wire [1023:0] AxiMonitorInterface_wdata_s18;

// Interface: AxiMonitorInterface Signal: wdata_s19
wire [1023:0] AxiMonitorInterface_wdata_s19;

// Interface: AxiMonitorInterface Signal: wdata_s20
wire [1023:0] AxiMonitorInterface_wdata_s20;

// Interface: AxiMonitorInterface Signal: wdata_s21
wire [1023:0] AxiMonitorInterface_wdata_s21;

// Interface: AxiMonitorInterface Signal: wdata_s22
wire [1023:0] AxiMonitorInterface_wdata_s22;

// Interface: AxiMonitorInterface Signal: wdata_s23
wire [1023:0] AxiMonitorInterface_wdata_s23;

// Interface: AxiMonitorInterface Signal: wdata_s24
wire [1023:0] AxiMonitorInterface_wdata_s24;

// Interface: AxiMonitorInterface Signal: wdata_s25
wire [1023:0] AxiMonitorInterface_wdata_s25;

// Interface: AxiMonitorInterface Signal: wdata_s26
wire [1023:0] AxiMonitorInterface_wdata_s26;

// Interface: AxiMonitorInterface Signal: wdata_s27
wire [1023:0] AxiMonitorInterface_wdata_s27;

// Interface: AxiMonitorInterface Signal: wdata_s28
wire [1023:0] AxiMonitorInterface_wdata_s28;

// Interface: AxiMonitorInterface Signal: wdata_s29
wire [1023:0] AxiMonitorInterface_wdata_s29;

// Interface: AxiMonitorInterface Signal: wdata_s30
wire [1023:0] AxiMonitorInterface_wdata_s30;

// Interface: AxiMonitorInterface Signal: wdata_s31
wire [1023:0] AxiMonitorInterface_wdata_s31;

// Interface: AxiMonitorInterface Signal: wstrb_s0
wire [127:0] AxiMonitorInterface_wstrb_s0;

// Interface: AxiMonitorInterface Signal: wstrb_s1
wire [127:0] AxiMonitorInterface_wstrb_s1;

// Interface: AxiMonitorInterface Signal: wstrb_s2
wire [127:0] AxiMonitorInterface_wstrb_s2;

// Interface: AxiMonitorInterface Signal: wstrb_s3
wire [127:0] AxiMonitorInterface_wstrb_s3;

// Interface: AxiMonitorInterface Signal: wstrb_s4
wire [127:0] AxiMonitorInterface_wstrb_s4;

// Interface: AxiMonitorInterface Signal: wstrb_s5
wire [127:0] AxiMonitorInterface_wstrb_s5;

// Interface: AxiMonitorInterface Signal: wstrb_s6
wire [127:0] AxiMonitorInterface_wstrb_s6;

// Interface: AxiMonitorInterface Signal: wstrb_s7
wire [127:0] AxiMonitorInterface_wstrb_s7;

// Interface: AxiMonitorInterface Signal: wstrb_s8
wire [127:0] AxiMonitorInterface_wstrb_s8;

// Interface: AxiMonitorInterface Signal: wstrb_s9
wire [127:0] AxiMonitorInterface_wstrb_s9;

// Interface: AxiMonitorInterface Signal: wstrb_s10
wire [127:0] AxiMonitorInterface_wstrb_s10;

// Interface: AxiMonitorInterface Signal: wstrb_s11
wire [127:0] AxiMonitorInterface_wstrb_s11;

// Interface: AxiMonitorInterface Signal: wstrb_s12
wire [127:0] AxiMonitorInterface_wstrb_s12;

// Interface: AxiMonitorInterface Signal: wstrb_s13
wire [127:0] AxiMonitorInterface_wstrb_s13;

// Interface: AxiMonitorInterface Signal: wstrb_s14
wire [127:0] AxiMonitorInterface_wstrb_s14;

// Interface: AxiMonitorInterface Signal: wstrb_s15
wire [127:0] AxiMonitorInterface_wstrb_s15;

// Interface: AxiMonitorInterface Signal: wstrb_s16
wire [127:0] AxiMonitorInterface_wstrb_s16;

// Interface: AxiMonitorInterface Signal: wstrb_s17
wire [127:0] AxiMonitorInterface_wstrb_s17;

// Interface: AxiMonitorInterface Signal: wstrb_s18
wire [127:0] AxiMonitorInterface_wstrb_s18;

// Interface: AxiMonitorInterface Signal: wstrb_s19
wire [127:0] AxiMonitorInterface_wstrb_s19;

// Interface: AxiMonitorInterface Signal: wstrb_s20
wire [127:0] AxiMonitorInterface_wstrb_s20;

// Interface: AxiMonitorInterface Signal: wstrb_s21
wire [127:0] AxiMonitorInterface_wstrb_s21;

// Interface: AxiMonitorInterface Signal: wstrb_s22
wire [127:0] AxiMonitorInterface_wstrb_s22;

// Interface: AxiMonitorInterface Signal: wstrb_s23
wire [127:0] AxiMonitorInterface_wstrb_s23;

// Interface: AxiMonitorInterface Signal: wstrb_s24
wire [127:0] AxiMonitorInterface_wstrb_s24;

// Interface: AxiMonitorInterface Signal: wstrb_s25
wire [127:0] AxiMonitorInterface_wstrb_s25;

// Interface: AxiMonitorInterface Signal: wstrb_s26
wire [127:0] AxiMonitorInterface_wstrb_s26;

// Interface: AxiMonitorInterface Signal: wstrb_s27
wire [127:0] AxiMonitorInterface_wstrb_s27;

// Interface: AxiMonitorInterface Signal: wstrb_s28
wire [127:0] AxiMonitorInterface_wstrb_s28;

// Interface: AxiMonitorInterface Signal: wstrb_s29
wire [127:0] AxiMonitorInterface_wstrb_s29;

// Interface: AxiMonitorInterface Signal: wstrb_s30
wire [127:0] AxiMonitorInterface_wstrb_s30;

// Interface: AxiMonitorInterface Signal: wstrb_s31
wire [127:0] AxiMonitorInterface_wstrb_s31;

// Interface: AxiMonitorInterface Signal: wid_s0
wire [31:0] AxiMonitorInterface_wid_s0;

// Interface: AxiMonitorInterface Signal: wid_s1
wire [31:0] AxiMonitorInterface_wid_s1;

// Interface: AxiMonitorInterface Signal: wid_s2
wire [31:0] AxiMonitorInterface_wid_s2;

// Interface: AxiMonitorInterface Signal: wid_s3
wire [31:0] AxiMonitorInterface_wid_s3;

// Interface: AxiMonitorInterface Signal: wid_s4
wire [31:0] AxiMonitorInterface_wid_s4;

// Interface: AxiMonitorInterface Signal: wid_s5
wire [31:0] AxiMonitorInterface_wid_s5;

// Interface: AxiMonitorInterface Signal: wid_s6
wire [31:0] AxiMonitorInterface_wid_s6;

// Interface: AxiMonitorInterface Signal: wid_s7
wire [31:0] AxiMonitorInterface_wid_s7;

// Interface: AxiMonitorInterface Signal: wid_s8
wire [31:0] AxiMonitorInterface_wid_s8;

// Interface: AxiMonitorInterface Signal: wid_s9
wire [31:0] AxiMonitorInterface_wid_s9;

// Interface: AxiMonitorInterface Signal: wid_s10
wire [31:0] AxiMonitorInterface_wid_s10;

// Interface: AxiMonitorInterface Signal: wid_s11
wire [31:0] AxiMonitorInterface_wid_s11;

// Interface: AxiMonitorInterface Signal: wid_s12
wire [31:0] AxiMonitorInterface_wid_s12;

// Interface: AxiMonitorInterface Signal: wid_s13
wire [31:0] AxiMonitorInterface_wid_s13;

// Interface: AxiMonitorInterface Signal: wid_s14
wire [31:0] AxiMonitorInterface_wid_s14;

// Interface: AxiMonitorInterface Signal: wid_s15
wire [31:0] AxiMonitorInterface_wid_s15;

// Interface: AxiMonitorInterface Signal: wid_s16
wire [31:0] AxiMonitorInterface_wid_s16;

// Interface: AxiMonitorInterface Signal: wid_s17
wire [31:0] AxiMonitorInterface_wid_s17;

// Interface: AxiMonitorInterface Signal: wid_s18
wire [31:0] AxiMonitorInterface_wid_s18;

// Interface: AxiMonitorInterface Signal: wid_s19
wire [31:0] AxiMonitorInterface_wid_s19;

// Interface: AxiMonitorInterface Signal: wid_s20
wire [31:0] AxiMonitorInterface_wid_s20;

// Interface: AxiMonitorInterface Signal: wid_s21
wire [31:0] AxiMonitorInterface_wid_s21;

// Interface: AxiMonitorInterface Signal: wid_s22
wire [31:0] AxiMonitorInterface_wid_s22;

// Interface: AxiMonitorInterface Signal: wid_s23
wire [31:0] AxiMonitorInterface_wid_s23;

// Interface: AxiMonitorInterface Signal: wid_s24
wire [31:0] AxiMonitorInterface_wid_s24;

// Interface: AxiMonitorInterface Signal: wid_s25
wire [31:0] AxiMonitorInterface_wid_s25;

// Interface: AxiMonitorInterface Signal: wid_s26
wire [31:0] AxiMonitorInterface_wid_s26;

// Interface: AxiMonitorInterface Signal: wid_s27
wire [31:0] AxiMonitorInterface_wid_s27;

// Interface: AxiMonitorInterface Signal: wid_s28
wire [31:0] AxiMonitorInterface_wid_s28;

// Interface: AxiMonitorInterface Signal: wid_s29
wire [31:0] AxiMonitorInterface_wid_s29;

// Interface: AxiMonitorInterface Signal: wid_s30
wire [31:0] AxiMonitorInterface_wid_s30;

// Interface: AxiMonitorInterface Signal: wid_s31
wire [31:0] AxiMonitorInterface_wid_s31;

// Interface: AxiMonitorInterface Signal: wready_s0
wire AxiMonitorInterface_wready_s0;

// Interface: AxiMonitorInterface Signal: wready_s1
wire AxiMonitorInterface_wready_s1;

// Interface: AxiMonitorInterface Signal: wready_s2
wire AxiMonitorInterface_wready_s2;

// Interface: AxiMonitorInterface Signal: wready_s3
wire AxiMonitorInterface_wready_s3;

// Interface: AxiMonitorInterface Signal: wready_s4
wire AxiMonitorInterface_wready_s4;

// Interface: AxiMonitorInterface Signal: wready_s5
wire AxiMonitorInterface_wready_s5;

// Interface: AxiMonitorInterface Signal: wready_s6
wire AxiMonitorInterface_wready_s6;

// Interface: AxiMonitorInterface Signal: wready_s7
wire AxiMonitorInterface_wready_s7;

// Interface: AxiMonitorInterface Signal: wready_s8
wire AxiMonitorInterface_wready_s8;

// Interface: AxiMonitorInterface Signal: wready_s9
wire AxiMonitorInterface_wready_s9;

// Interface: AxiMonitorInterface Signal: wready_s10
wire AxiMonitorInterface_wready_s10;

// Interface: AxiMonitorInterface Signal: wready_s11
wire AxiMonitorInterface_wready_s11;

// Interface: AxiMonitorInterface Signal: wready_s12
wire AxiMonitorInterface_wready_s12;

// Interface: AxiMonitorInterface Signal: wready_s13
wire AxiMonitorInterface_wready_s13;

// Interface: AxiMonitorInterface Signal: wready_s14
wire AxiMonitorInterface_wready_s14;

// Interface: AxiMonitorInterface Signal: wready_s15
wire AxiMonitorInterface_wready_s15;

// Interface: AxiMonitorInterface Signal: wready_s16
wire AxiMonitorInterface_wready_s16;

// Interface: AxiMonitorInterface Signal: wready_s17
wire AxiMonitorInterface_wready_s17;

// Interface: AxiMonitorInterface Signal: wready_s18
wire AxiMonitorInterface_wready_s18;

// Interface: AxiMonitorInterface Signal: wready_s19
wire AxiMonitorInterface_wready_s19;

// Interface: AxiMonitorInterface Signal: wready_s20
wire AxiMonitorInterface_wready_s20;

// Interface: AxiMonitorInterface Signal: wready_s21
wire AxiMonitorInterface_wready_s21;

// Interface: AxiMonitorInterface Signal: wready_s22
wire AxiMonitorInterface_wready_s22;

// Interface: AxiMonitorInterface Signal: wready_s23
wire AxiMonitorInterface_wready_s23;

// Interface: AxiMonitorInterface Signal: wready_s24
wire AxiMonitorInterface_wready_s24;

// Interface: AxiMonitorInterface Signal: wready_s25
wire AxiMonitorInterface_wready_s25;

// Interface: AxiMonitorInterface Signal: wready_s26
wire AxiMonitorInterface_wready_s26;

// Interface: AxiMonitorInterface Signal: wready_s27
wire AxiMonitorInterface_wready_s27;

// Interface: AxiMonitorInterface Signal: wready_s28
wire AxiMonitorInterface_wready_s28;

// Interface: AxiMonitorInterface Signal: wready_s29
wire AxiMonitorInterface_wready_s29;

// Interface: AxiMonitorInterface Signal: wready_s30
wire AxiMonitorInterface_wready_s30;

// Interface: AxiMonitorInterface Signal: wready_s31
wire AxiMonitorInterface_wready_s31;

// Interface: AxiMonitorInterface Signal: wsideband_s0
wire [63:0] AxiMonitorInterface_wsideband_s0;

// Interface: AxiMonitorInterface Signal: wsideband_s1
wire [63:0] AxiMonitorInterface_wsideband_s1;

// Interface: AxiMonitorInterface Signal: wsideband_s2
wire [63:0] AxiMonitorInterface_wsideband_s2;

// Interface: AxiMonitorInterface Signal: wsideband_s3
wire [63:0] AxiMonitorInterface_wsideband_s3;

// Interface: AxiMonitorInterface Signal: wsideband_s4
wire [63:0] AxiMonitorInterface_wsideband_s4;

// Interface: AxiMonitorInterface Signal: wsideband_s5
wire [63:0] AxiMonitorInterface_wsideband_s5;

// Interface: AxiMonitorInterface Signal: wsideband_s6
wire [63:0] AxiMonitorInterface_wsideband_s6;

// Interface: AxiMonitorInterface Signal: wsideband_s7
wire [63:0] AxiMonitorInterface_wsideband_s7;

// Interface: AxiMonitorInterface Signal: wsideband_s8
wire [63:0] AxiMonitorInterface_wsideband_s8;

// Interface: AxiMonitorInterface Signal: wsideband_s9
wire [63:0] AxiMonitorInterface_wsideband_s9;

// Interface: AxiMonitorInterface Signal: wsideband_s10
wire [63:0] AxiMonitorInterface_wsideband_s10;

// Interface: AxiMonitorInterface Signal: wsideband_s11
wire [63:0] AxiMonitorInterface_wsideband_s11;

// Interface: AxiMonitorInterface Signal: wsideband_s12
wire [63:0] AxiMonitorInterface_wsideband_s12;

// Interface: AxiMonitorInterface Signal: wsideband_s13
wire [63:0] AxiMonitorInterface_wsideband_s13;

// Interface: AxiMonitorInterface Signal: wsideband_s14
wire [63:0] AxiMonitorInterface_wsideband_s14;

// Interface: AxiMonitorInterface Signal: wsideband_s15
wire [63:0] AxiMonitorInterface_wsideband_s15;

// Interface: AxiMonitorInterface Signal: wsideband_s16
wire [63:0] AxiMonitorInterface_wsideband_s16;

// Interface: AxiMonitorInterface Signal: wsideband_s17
wire [63:0] AxiMonitorInterface_wsideband_s17;

// Interface: AxiMonitorInterface Signal: wsideband_s18
wire [63:0] AxiMonitorInterface_wsideband_s18;

// Interface: AxiMonitorInterface Signal: wsideband_s19
wire [63:0] AxiMonitorInterface_wsideband_s19;

// Interface: AxiMonitorInterface Signal: wsideband_s20
wire [63:0] AxiMonitorInterface_wsideband_s20;

// Interface: AxiMonitorInterface Signal: wsideband_s21
wire [63:0] AxiMonitorInterface_wsideband_s21;

// Interface: AxiMonitorInterface Signal: wsideband_s22
wire [63:0] AxiMonitorInterface_wsideband_s22;

// Interface: AxiMonitorInterface Signal: wsideband_s23
wire [63:0] AxiMonitorInterface_wsideband_s23;

// Interface: AxiMonitorInterface Signal: wsideband_s24
wire [63:0] AxiMonitorInterface_wsideband_s24;

// Interface: AxiMonitorInterface Signal: wsideband_s25
wire [63:0] AxiMonitorInterface_wsideband_s25;

// Interface: AxiMonitorInterface Signal: wsideband_s26
wire [63:0] AxiMonitorInterface_wsideband_s26;

// Interface: AxiMonitorInterface Signal: wsideband_s27
wire [63:0] AxiMonitorInterface_wsideband_s27;

// Interface: AxiMonitorInterface Signal: wsideband_s28
wire [63:0] AxiMonitorInterface_wsideband_s28;

// Interface: AxiMonitorInterface Signal: wsideband_s29
wire [63:0] AxiMonitorInterface_wsideband_s29;

// Interface: AxiMonitorInterface Signal: wsideband_s30
wire [63:0] AxiMonitorInterface_wsideband_s30;

// Interface: AxiMonitorInterface Signal: wsideband_s31
wire [63:0] AxiMonitorInterface_wsideband_s31;

// Interface: AxiMonitorInterface Signal: bvalid_s0
wire AxiMonitorInterface_bvalid_s0;

// Interface: AxiMonitorInterface Signal: bvalid_s1
wire AxiMonitorInterface_bvalid_s1;

// Interface: AxiMonitorInterface Signal: bvalid_s2
wire AxiMonitorInterface_bvalid_s2;

// Interface: AxiMonitorInterface Signal: bvalid_s3
wire AxiMonitorInterface_bvalid_s3;

// Interface: AxiMonitorInterface Signal: bvalid_s4
wire AxiMonitorInterface_bvalid_s4;

// Interface: AxiMonitorInterface Signal: bvalid_s5
wire AxiMonitorInterface_bvalid_s5;

// Interface: AxiMonitorInterface Signal: bvalid_s6
wire AxiMonitorInterface_bvalid_s6;

// Interface: AxiMonitorInterface Signal: bvalid_s7
wire AxiMonitorInterface_bvalid_s7;

// Interface: AxiMonitorInterface Signal: bvalid_s8
wire AxiMonitorInterface_bvalid_s8;

// Interface: AxiMonitorInterface Signal: bvalid_s9
wire AxiMonitorInterface_bvalid_s9;

// Interface: AxiMonitorInterface Signal: bvalid_s10
wire AxiMonitorInterface_bvalid_s10;

// Interface: AxiMonitorInterface Signal: bvalid_s11
wire AxiMonitorInterface_bvalid_s11;

// Interface: AxiMonitorInterface Signal: bvalid_s12
wire AxiMonitorInterface_bvalid_s12;

// Interface: AxiMonitorInterface Signal: bvalid_s13
wire AxiMonitorInterface_bvalid_s13;

// Interface: AxiMonitorInterface Signal: bvalid_s14
wire AxiMonitorInterface_bvalid_s14;

// Interface: AxiMonitorInterface Signal: bvalid_s15
wire AxiMonitorInterface_bvalid_s15;

// Interface: AxiMonitorInterface Signal: bvalid_s16
wire AxiMonitorInterface_bvalid_s16;

// Interface: AxiMonitorInterface Signal: bvalid_s17
wire AxiMonitorInterface_bvalid_s17;

// Interface: AxiMonitorInterface Signal: bvalid_s18
wire AxiMonitorInterface_bvalid_s18;

// Interface: AxiMonitorInterface Signal: bvalid_s19
wire AxiMonitorInterface_bvalid_s19;

// Interface: AxiMonitorInterface Signal: bvalid_s20
wire AxiMonitorInterface_bvalid_s20;

// Interface: AxiMonitorInterface Signal: bvalid_s21
wire AxiMonitorInterface_bvalid_s21;

// Interface: AxiMonitorInterface Signal: bvalid_s22
wire AxiMonitorInterface_bvalid_s22;

// Interface: AxiMonitorInterface Signal: bvalid_s23
wire AxiMonitorInterface_bvalid_s23;

// Interface: AxiMonitorInterface Signal: bvalid_s24
wire AxiMonitorInterface_bvalid_s24;

// Interface: AxiMonitorInterface Signal: bvalid_s25
wire AxiMonitorInterface_bvalid_s25;

// Interface: AxiMonitorInterface Signal: bvalid_s26
wire AxiMonitorInterface_bvalid_s26;

// Interface: AxiMonitorInterface Signal: bvalid_s27
wire AxiMonitorInterface_bvalid_s27;

// Interface: AxiMonitorInterface Signal: bvalid_s28
wire AxiMonitorInterface_bvalid_s28;

// Interface: AxiMonitorInterface Signal: bvalid_s29
wire AxiMonitorInterface_bvalid_s29;

// Interface: AxiMonitorInterface Signal: bvalid_s30
wire AxiMonitorInterface_bvalid_s30;

// Interface: AxiMonitorInterface Signal: bvalid_s31
wire AxiMonitorInterface_bvalid_s31;

// Interface: AxiMonitorInterface Signal: bresp_s0
wire [1:0] AxiMonitorInterface_bresp_s0;

// Interface: AxiMonitorInterface Signal: bresp_s1
wire [1:0] AxiMonitorInterface_bresp_s1;

// Interface: AxiMonitorInterface Signal: bresp_s2
wire [1:0] AxiMonitorInterface_bresp_s2;

// Interface: AxiMonitorInterface Signal: bresp_s3
wire [1:0] AxiMonitorInterface_bresp_s3;

// Interface: AxiMonitorInterface Signal: bresp_s4
wire [1:0] AxiMonitorInterface_bresp_s4;

// Interface: AxiMonitorInterface Signal: bresp_s5
wire [1:0] AxiMonitorInterface_bresp_s5;

// Interface: AxiMonitorInterface Signal: bresp_s6
wire [1:0] AxiMonitorInterface_bresp_s6;

// Interface: AxiMonitorInterface Signal: bresp_s7
wire [1:0] AxiMonitorInterface_bresp_s7;

// Interface: AxiMonitorInterface Signal: bresp_s8
wire [1:0] AxiMonitorInterface_bresp_s8;

// Interface: AxiMonitorInterface Signal: bresp_s9
wire [1:0] AxiMonitorInterface_bresp_s9;

// Interface: AxiMonitorInterface Signal: bresp_s10
wire [1:0] AxiMonitorInterface_bresp_s10;

// Interface: AxiMonitorInterface Signal: bresp_s11
wire [1:0] AxiMonitorInterface_bresp_s11;

// Interface: AxiMonitorInterface Signal: bresp_s12
wire [1:0] AxiMonitorInterface_bresp_s12;

// Interface: AxiMonitorInterface Signal: bresp_s13
wire [1:0] AxiMonitorInterface_bresp_s13;

// Interface: AxiMonitorInterface Signal: bresp_s14
wire [1:0] AxiMonitorInterface_bresp_s14;

// Interface: AxiMonitorInterface Signal: bresp_s15
wire [1:0] AxiMonitorInterface_bresp_s15;

// Interface: AxiMonitorInterface Signal: bresp_s16
wire [1:0] AxiMonitorInterface_bresp_s16;

// Interface: AxiMonitorInterface Signal: bresp_s17
wire [1:0] AxiMonitorInterface_bresp_s17;

// Interface: AxiMonitorInterface Signal: bresp_s18
wire [1:0] AxiMonitorInterface_bresp_s18;

// Interface: AxiMonitorInterface Signal: bresp_s19
wire [1:0] AxiMonitorInterface_bresp_s19;

// Interface: AxiMonitorInterface Signal: bresp_s20
wire [1:0] AxiMonitorInterface_bresp_s20;

// Interface: AxiMonitorInterface Signal: bresp_s21
wire [1:0] AxiMonitorInterface_bresp_s21;

// Interface: AxiMonitorInterface Signal: bresp_s22
wire [1:0] AxiMonitorInterface_bresp_s22;

// Interface: AxiMonitorInterface Signal: bresp_s23
wire [1:0] AxiMonitorInterface_bresp_s23;

// Interface: AxiMonitorInterface Signal: bresp_s24
wire [1:0] AxiMonitorInterface_bresp_s24;

// Interface: AxiMonitorInterface Signal: bresp_s25
wire [1:0] AxiMonitorInterface_bresp_s25;

// Interface: AxiMonitorInterface Signal: bresp_s26
wire [1:0] AxiMonitorInterface_bresp_s26;

// Interface: AxiMonitorInterface Signal: bresp_s27
wire [1:0] AxiMonitorInterface_bresp_s27;

// Interface: AxiMonitorInterface Signal: bresp_s28
wire [1:0] AxiMonitorInterface_bresp_s28;

// Interface: AxiMonitorInterface Signal: bresp_s29
wire [1:0] AxiMonitorInterface_bresp_s29;

// Interface: AxiMonitorInterface Signal: bresp_s30
wire [1:0] AxiMonitorInterface_bresp_s30;

// Interface: AxiMonitorInterface Signal: bresp_s31
wire [1:0] AxiMonitorInterface_bresp_s31;

// Interface: AxiMonitorInterface Signal: bid_s0
wire [31:0] AxiMonitorInterface_bid_s0;

// Interface: AxiMonitorInterface Signal: bid_s1
wire [31:0] AxiMonitorInterface_bid_s1;

// Interface: AxiMonitorInterface Signal: bid_s2
wire [31:0] AxiMonitorInterface_bid_s2;

// Interface: AxiMonitorInterface Signal: bid_s3
wire [31:0] AxiMonitorInterface_bid_s3;

// Interface: AxiMonitorInterface Signal: bid_s4
wire [31:0] AxiMonitorInterface_bid_s4;

// Interface: AxiMonitorInterface Signal: bid_s5
wire [31:0] AxiMonitorInterface_bid_s5;

// Interface: AxiMonitorInterface Signal: bid_s6
wire [31:0] AxiMonitorInterface_bid_s6;

// Interface: AxiMonitorInterface Signal: bid_s7
wire [31:0] AxiMonitorInterface_bid_s7;

// Interface: AxiMonitorInterface Signal: bid_s8
wire [31:0] AxiMonitorInterface_bid_s8;

// Interface: AxiMonitorInterface Signal: bid_s9
wire [31:0] AxiMonitorInterface_bid_s9;

// Interface: AxiMonitorInterface Signal: bid_s10
wire [31:0] AxiMonitorInterface_bid_s10;

// Interface: AxiMonitorInterface Signal: bid_s11
wire [31:0] AxiMonitorInterface_bid_s11;

// Interface: AxiMonitorInterface Signal: bid_s12
wire [31:0] AxiMonitorInterface_bid_s12;

// Interface: AxiMonitorInterface Signal: bid_s13
wire [31:0] AxiMonitorInterface_bid_s13;

// Interface: AxiMonitorInterface Signal: bid_s14
wire [31:0] AxiMonitorInterface_bid_s14;

// Interface: AxiMonitorInterface Signal: bid_s15
wire [31:0] AxiMonitorInterface_bid_s15;

// Interface: AxiMonitorInterface Signal: bid_s16
wire [31:0] AxiMonitorInterface_bid_s16;

// Interface: AxiMonitorInterface Signal: bid_s17
wire [31:0] AxiMonitorInterface_bid_s17;

// Interface: AxiMonitorInterface Signal: bid_s18
wire [31:0] AxiMonitorInterface_bid_s18;

// Interface: AxiMonitorInterface Signal: bid_s19
wire [31:0] AxiMonitorInterface_bid_s19;

// Interface: AxiMonitorInterface Signal: bid_s20
wire [31:0] AxiMonitorInterface_bid_s20;

// Interface: AxiMonitorInterface Signal: bid_s21
wire [31:0] AxiMonitorInterface_bid_s21;

// Interface: AxiMonitorInterface Signal: bid_s22
wire [31:0] AxiMonitorInterface_bid_s22;

// Interface: AxiMonitorInterface Signal: bid_s23
wire [31:0] AxiMonitorInterface_bid_s23;

// Interface: AxiMonitorInterface Signal: bid_s24
wire [31:0] AxiMonitorInterface_bid_s24;

// Interface: AxiMonitorInterface Signal: bid_s25
wire [31:0] AxiMonitorInterface_bid_s25;

// Interface: AxiMonitorInterface Signal: bid_s26
wire [31:0] AxiMonitorInterface_bid_s26;

// Interface: AxiMonitorInterface Signal: bid_s27
wire [31:0] AxiMonitorInterface_bid_s27;

// Interface: AxiMonitorInterface Signal: bid_s28
wire [31:0] AxiMonitorInterface_bid_s28;

// Interface: AxiMonitorInterface Signal: bid_s29
wire [31:0] AxiMonitorInterface_bid_s29;

// Interface: AxiMonitorInterface Signal: bid_s30
wire [31:0] AxiMonitorInterface_bid_s30;

// Interface: AxiMonitorInterface Signal: bid_s31
wire [31:0] AxiMonitorInterface_bid_s31;

// Interface: AxiMonitorInterface Signal: bready_s0
wire AxiMonitorInterface_bready_s0;

// Interface: AxiMonitorInterface Signal: bready_s1
wire AxiMonitorInterface_bready_s1;

// Interface: AxiMonitorInterface Signal: bready_s2
wire AxiMonitorInterface_bready_s2;

// Interface: AxiMonitorInterface Signal: bready_s3
wire AxiMonitorInterface_bready_s3;

// Interface: AxiMonitorInterface Signal: bready_s4
wire AxiMonitorInterface_bready_s4;

// Interface: AxiMonitorInterface Signal: bready_s5
wire AxiMonitorInterface_bready_s5;

// Interface: AxiMonitorInterface Signal: bready_s6
wire AxiMonitorInterface_bready_s6;

// Interface: AxiMonitorInterface Signal: bready_s7
wire AxiMonitorInterface_bready_s7;

// Interface: AxiMonitorInterface Signal: bready_s8
wire AxiMonitorInterface_bready_s8;

// Interface: AxiMonitorInterface Signal: bready_s9
wire AxiMonitorInterface_bready_s9;

// Interface: AxiMonitorInterface Signal: bready_s10
wire AxiMonitorInterface_bready_s10;

// Interface: AxiMonitorInterface Signal: bready_s11
wire AxiMonitorInterface_bready_s11;

// Interface: AxiMonitorInterface Signal: bready_s12
wire AxiMonitorInterface_bready_s12;

// Interface: AxiMonitorInterface Signal: bready_s13
wire AxiMonitorInterface_bready_s13;

// Interface: AxiMonitorInterface Signal: bready_s14
wire AxiMonitorInterface_bready_s14;

// Interface: AxiMonitorInterface Signal: bready_s15
wire AxiMonitorInterface_bready_s15;

// Interface: AxiMonitorInterface Signal: bready_s16
wire AxiMonitorInterface_bready_s16;

// Interface: AxiMonitorInterface Signal: bready_s17
wire AxiMonitorInterface_bready_s17;

// Interface: AxiMonitorInterface Signal: bready_s18
wire AxiMonitorInterface_bready_s18;

// Interface: AxiMonitorInterface Signal: bready_s19
wire AxiMonitorInterface_bready_s19;

// Interface: AxiMonitorInterface Signal: bready_s20
wire AxiMonitorInterface_bready_s20;

// Interface: AxiMonitorInterface Signal: bready_s21
wire AxiMonitorInterface_bready_s21;

// Interface: AxiMonitorInterface Signal: bready_s22
wire AxiMonitorInterface_bready_s22;

// Interface: AxiMonitorInterface Signal: bready_s23
wire AxiMonitorInterface_bready_s23;

// Interface: AxiMonitorInterface Signal: bready_s24
wire AxiMonitorInterface_bready_s24;

// Interface: AxiMonitorInterface Signal: bready_s25
wire AxiMonitorInterface_bready_s25;

// Interface: AxiMonitorInterface Signal: bready_s26
wire AxiMonitorInterface_bready_s26;

// Interface: AxiMonitorInterface Signal: bready_s27
wire AxiMonitorInterface_bready_s27;

// Interface: AxiMonitorInterface Signal: bready_s28
wire AxiMonitorInterface_bready_s28;

// Interface: AxiMonitorInterface Signal: bready_s29
wire AxiMonitorInterface_bready_s29;

// Interface: AxiMonitorInterface Signal: bready_s30
wire AxiMonitorInterface_bready_s30;

// Interface: AxiMonitorInterface Signal: bready_s31
wire AxiMonitorInterface_bready_s31;

// Interface: AxiMonitorInterface Signal: bsideband_s0
wire [63:0] AxiMonitorInterface_bsideband_s0;

// Interface: AxiMonitorInterface Signal: bsideband_s1
wire [63:0] AxiMonitorInterface_bsideband_s1;

// Interface: AxiMonitorInterface Signal: bsideband_s2
wire [63:0] AxiMonitorInterface_bsideband_s2;

// Interface: AxiMonitorInterface Signal: bsideband_s3
wire [63:0] AxiMonitorInterface_bsideband_s3;

// Interface: AxiMonitorInterface Signal: bsideband_s4
wire [63:0] AxiMonitorInterface_bsideband_s4;

// Interface: AxiMonitorInterface Signal: bsideband_s5
wire [63:0] AxiMonitorInterface_bsideband_s5;

// Interface: AxiMonitorInterface Signal: bsideband_s6
wire [63:0] AxiMonitorInterface_bsideband_s6;

// Interface: AxiMonitorInterface Signal: bsideband_s7
wire [63:0] AxiMonitorInterface_bsideband_s7;

// Interface: AxiMonitorInterface Signal: bsideband_s8
wire [63:0] AxiMonitorInterface_bsideband_s8;

// Interface: AxiMonitorInterface Signal: bsideband_s9
wire [63:0] AxiMonitorInterface_bsideband_s9;

// Interface: AxiMonitorInterface Signal: bsideband_s10
wire [63:0] AxiMonitorInterface_bsideband_s10;

// Interface: AxiMonitorInterface Signal: bsideband_s11
wire [63:0] AxiMonitorInterface_bsideband_s11;

// Interface: AxiMonitorInterface Signal: bsideband_s12
wire [63:0] AxiMonitorInterface_bsideband_s12;

// Interface: AxiMonitorInterface Signal: bsideband_s13
wire [63:0] AxiMonitorInterface_bsideband_s13;

// Interface: AxiMonitorInterface Signal: bsideband_s14
wire [63:0] AxiMonitorInterface_bsideband_s14;

// Interface: AxiMonitorInterface Signal: bsideband_s15
wire [63:0] AxiMonitorInterface_bsideband_s15;

// Interface: AxiMonitorInterface Signal: bsideband_s16
wire [63:0] AxiMonitorInterface_bsideband_s16;

// Interface: AxiMonitorInterface Signal: bsideband_s17
wire [63:0] AxiMonitorInterface_bsideband_s17;

// Interface: AxiMonitorInterface Signal: bsideband_s18
wire [63:0] AxiMonitorInterface_bsideband_s18;

// Interface: AxiMonitorInterface Signal: bsideband_s19
wire [63:0] AxiMonitorInterface_bsideband_s19;

// Interface: AxiMonitorInterface Signal: bsideband_s20
wire [63:0] AxiMonitorInterface_bsideband_s20;

// Interface: AxiMonitorInterface Signal: bsideband_s21
wire [63:0] AxiMonitorInterface_bsideband_s21;

// Interface: AxiMonitorInterface Signal: bsideband_s22
wire [63:0] AxiMonitorInterface_bsideband_s22;

// Interface: AxiMonitorInterface Signal: bsideband_s23
wire [63:0] AxiMonitorInterface_bsideband_s23;

// Interface: AxiMonitorInterface Signal: bsideband_s24
wire [63:0] AxiMonitorInterface_bsideband_s24;

// Interface: AxiMonitorInterface Signal: bsideband_s25
wire [63:0] AxiMonitorInterface_bsideband_s25;

// Interface: AxiMonitorInterface Signal: bsideband_s26
wire [63:0] AxiMonitorInterface_bsideband_s26;

// Interface: AxiMonitorInterface Signal: bsideband_s27
wire [63:0] AxiMonitorInterface_bsideband_s27;

// Interface: AxiMonitorInterface Signal: bsideband_s28
wire [63:0] AxiMonitorInterface_bsideband_s28;

// Interface: AxiMonitorInterface Signal: bsideband_s29
wire [63:0] AxiMonitorInterface_bsideband_s29;

// Interface: AxiMonitorInterface Signal: bsideband_s30
wire [63:0] AxiMonitorInterface_bsideband_s30;

// Interface: AxiMonitorInterface Signal: bsideband_s31
wire [63:0] AxiMonitorInterface_bsideband_s31;

// Interface: AxiMonitorInterface Signal: cactive_s0
wire AxiMonitorInterface_cactive_s0;

// Interface: AxiMonitorInterface Signal: cactive_s1
wire AxiMonitorInterface_cactive_s1;

// Interface: AxiMonitorInterface Signal: cactive_s2
wire AxiMonitorInterface_cactive_s2;

// Interface: AxiMonitorInterface Signal: cactive_s3
wire AxiMonitorInterface_cactive_s3;

// Interface: AxiMonitorInterface Signal: cactive_s4
wire AxiMonitorInterface_cactive_s4;

// Interface: AxiMonitorInterface Signal: cactive_s5
wire AxiMonitorInterface_cactive_s5;

// Interface: AxiMonitorInterface Signal: cactive_s6
wire AxiMonitorInterface_cactive_s6;

// Interface: AxiMonitorInterface Signal: cactive_s7
wire AxiMonitorInterface_cactive_s7;

// Interface: AxiMonitorInterface Signal: cactive_s8
wire AxiMonitorInterface_cactive_s8;

// Interface: AxiMonitorInterface Signal: cactive_s9
wire AxiMonitorInterface_cactive_s9;

// Interface: AxiMonitorInterface Signal: cactive_s10
wire AxiMonitorInterface_cactive_s10;

// Interface: AxiMonitorInterface Signal: cactive_s11
wire AxiMonitorInterface_cactive_s11;

// Interface: AxiMonitorInterface Signal: cactive_s12
wire AxiMonitorInterface_cactive_s12;

// Interface: AxiMonitorInterface Signal: cactive_s13
wire AxiMonitorInterface_cactive_s13;

// Interface: AxiMonitorInterface Signal: cactive_s14
wire AxiMonitorInterface_cactive_s14;

// Interface: AxiMonitorInterface Signal: cactive_s15
wire AxiMonitorInterface_cactive_s15;

// Interface: AxiMonitorInterface Signal: cactive_s16
wire AxiMonitorInterface_cactive_s16;

// Interface: AxiMonitorInterface Signal: cactive_s17
wire AxiMonitorInterface_cactive_s17;

// Interface: AxiMonitorInterface Signal: cactive_s18
wire AxiMonitorInterface_cactive_s18;

// Interface: AxiMonitorInterface Signal: cactive_s19
wire AxiMonitorInterface_cactive_s19;

// Interface: AxiMonitorInterface Signal: cactive_s20
wire AxiMonitorInterface_cactive_s20;

// Interface: AxiMonitorInterface Signal: cactive_s21
wire AxiMonitorInterface_cactive_s21;

// Interface: AxiMonitorInterface Signal: cactive_s22
wire AxiMonitorInterface_cactive_s22;

// Interface: AxiMonitorInterface Signal: cactive_s23
wire AxiMonitorInterface_cactive_s23;

// Interface: AxiMonitorInterface Signal: cactive_s24
wire AxiMonitorInterface_cactive_s24;

// Interface: AxiMonitorInterface Signal: cactive_s25
wire AxiMonitorInterface_cactive_s25;

// Interface: AxiMonitorInterface Signal: cactive_s26
wire AxiMonitorInterface_cactive_s26;

// Interface: AxiMonitorInterface Signal: cactive_s27
wire AxiMonitorInterface_cactive_s27;

// Interface: AxiMonitorInterface Signal: cactive_s28
wire AxiMonitorInterface_cactive_s28;

// Interface: AxiMonitorInterface Signal: cactive_s29
wire AxiMonitorInterface_cactive_s29;

// Interface: AxiMonitorInterface Signal: cactive_s30
wire AxiMonitorInterface_cactive_s30;

// Interface: AxiMonitorInterface Signal: cactive_s31
wire AxiMonitorInterface_cactive_s31;

// Interface: AxiMonitorInterface Signal: csysreq_s0
wire AxiMonitorInterface_csysreq_s0;

// Interface: AxiMonitorInterface Signal: csysreq_s1
wire AxiMonitorInterface_csysreq_s1;

// Interface: AxiMonitorInterface Signal: csysreq_s2
wire AxiMonitorInterface_csysreq_s2;

// Interface: AxiMonitorInterface Signal: csysreq_s3
wire AxiMonitorInterface_csysreq_s3;

// Interface: AxiMonitorInterface Signal: csysreq_s4
wire AxiMonitorInterface_csysreq_s4;

// Interface: AxiMonitorInterface Signal: csysreq_s5
wire AxiMonitorInterface_csysreq_s5;

// Interface: AxiMonitorInterface Signal: csysreq_s6
wire AxiMonitorInterface_csysreq_s6;

// Interface: AxiMonitorInterface Signal: csysreq_s7
wire AxiMonitorInterface_csysreq_s7;

// Interface: AxiMonitorInterface Signal: csysreq_s8
wire AxiMonitorInterface_csysreq_s8;

// Interface: AxiMonitorInterface Signal: csysreq_s9
wire AxiMonitorInterface_csysreq_s9;

// Interface: AxiMonitorInterface Signal: csysreq_s10
wire AxiMonitorInterface_csysreq_s10;

// Interface: AxiMonitorInterface Signal: csysreq_s11
wire AxiMonitorInterface_csysreq_s11;

// Interface: AxiMonitorInterface Signal: csysreq_s12
wire AxiMonitorInterface_csysreq_s12;

// Interface: AxiMonitorInterface Signal: csysreq_s13
wire AxiMonitorInterface_csysreq_s13;

// Interface: AxiMonitorInterface Signal: csysreq_s14
wire AxiMonitorInterface_csysreq_s14;

// Interface: AxiMonitorInterface Signal: csysreq_s15
wire AxiMonitorInterface_csysreq_s15;

// Interface: AxiMonitorInterface Signal: csysreq_s16
wire AxiMonitorInterface_csysreq_s16;

// Interface: AxiMonitorInterface Signal: csysreq_s17
wire AxiMonitorInterface_csysreq_s17;

// Interface: AxiMonitorInterface Signal: csysreq_s18
wire AxiMonitorInterface_csysreq_s18;

// Interface: AxiMonitorInterface Signal: csysreq_s19
wire AxiMonitorInterface_csysreq_s19;

// Interface: AxiMonitorInterface Signal: csysreq_s20
wire AxiMonitorInterface_csysreq_s20;

// Interface: AxiMonitorInterface Signal: csysreq_s21
wire AxiMonitorInterface_csysreq_s21;

// Interface: AxiMonitorInterface Signal: csysreq_s22
wire AxiMonitorInterface_csysreq_s22;

// Interface: AxiMonitorInterface Signal: csysreq_s23
wire AxiMonitorInterface_csysreq_s23;

// Interface: AxiMonitorInterface Signal: csysreq_s24
wire AxiMonitorInterface_csysreq_s24;

// Interface: AxiMonitorInterface Signal: csysreq_s25
wire AxiMonitorInterface_csysreq_s25;

// Interface: AxiMonitorInterface Signal: csysreq_s26
wire AxiMonitorInterface_csysreq_s26;

// Interface: AxiMonitorInterface Signal: csysreq_s27
wire AxiMonitorInterface_csysreq_s27;

// Interface: AxiMonitorInterface Signal: csysreq_s28
wire AxiMonitorInterface_csysreq_s28;

// Interface: AxiMonitorInterface Signal: csysreq_s29
wire AxiMonitorInterface_csysreq_s29;

// Interface: AxiMonitorInterface Signal: csysreq_s30
wire AxiMonitorInterface_csysreq_s30;

// Interface: AxiMonitorInterface Signal: csysreq_s31
wire AxiMonitorInterface_csysreq_s31;

// Interface: AxiMonitorInterface Signal: csysack_s0
wire AxiMonitorInterface_csysack_s0;

// Interface: AxiMonitorInterface Signal: csysack_s1
wire AxiMonitorInterface_csysack_s1;

// Interface: AxiMonitorInterface Signal: csysack_s2
wire AxiMonitorInterface_csysack_s2;

// Interface: AxiMonitorInterface Signal: csysack_s3
wire AxiMonitorInterface_csysack_s3;

// Interface: AxiMonitorInterface Signal: csysack_s4
wire AxiMonitorInterface_csysack_s4;

// Interface: AxiMonitorInterface Signal: csysack_s5
wire AxiMonitorInterface_csysack_s5;

// Interface: AxiMonitorInterface Signal: csysack_s6
wire AxiMonitorInterface_csysack_s6;

// Interface: AxiMonitorInterface Signal: csysack_s7
wire AxiMonitorInterface_csysack_s7;

// Interface: AxiMonitorInterface Signal: csysack_s8
wire AxiMonitorInterface_csysack_s8;

// Interface: AxiMonitorInterface Signal: csysack_s9
wire AxiMonitorInterface_csysack_s9;

// Interface: AxiMonitorInterface Signal: csysack_s10
wire AxiMonitorInterface_csysack_s10;

// Interface: AxiMonitorInterface Signal: csysack_s11
wire AxiMonitorInterface_csysack_s11;

// Interface: AxiMonitorInterface Signal: csysack_s12
wire AxiMonitorInterface_csysack_s12;

// Interface: AxiMonitorInterface Signal: csysack_s13
wire AxiMonitorInterface_csysack_s13;

// Interface: AxiMonitorInterface Signal: csysack_s14
wire AxiMonitorInterface_csysack_s14;

// Interface: AxiMonitorInterface Signal: csysack_s15
wire AxiMonitorInterface_csysack_s15;

// Interface: AxiMonitorInterface Signal: csysack_s16
wire AxiMonitorInterface_csysack_s16;

// Interface: AxiMonitorInterface Signal: csysack_s17
wire AxiMonitorInterface_csysack_s17;

// Interface: AxiMonitorInterface Signal: csysack_s18
wire AxiMonitorInterface_csysack_s18;

// Interface: AxiMonitorInterface Signal: csysack_s19
wire AxiMonitorInterface_csysack_s19;

// Interface: AxiMonitorInterface Signal: csysack_s20
wire AxiMonitorInterface_csysack_s20;

// Interface: AxiMonitorInterface Signal: csysack_s21
wire AxiMonitorInterface_csysack_s21;

// Interface: AxiMonitorInterface Signal: csysack_s22
wire AxiMonitorInterface_csysack_s22;

// Interface: AxiMonitorInterface Signal: csysack_s23
wire AxiMonitorInterface_csysack_s23;

// Interface: AxiMonitorInterface Signal: csysack_s24
wire AxiMonitorInterface_csysack_s24;

// Interface: AxiMonitorInterface Signal: csysack_s25
wire AxiMonitorInterface_csysack_s25;

// Interface: AxiMonitorInterface Signal: csysack_s26
wire AxiMonitorInterface_csysack_s26;

// Interface: AxiMonitorInterface Signal: csysack_s27
wire AxiMonitorInterface_csysack_s27;

// Interface: AxiMonitorInterface Signal: csysack_s28
wire AxiMonitorInterface_csysack_s28;

// Interface: AxiMonitorInterface Signal: csysack_s29
wire AxiMonitorInterface_csysack_s29;

// Interface: AxiMonitorInterface Signal: csysack_s30
wire AxiMonitorInterface_csysack_s30;

// Interface: AxiMonitorInterface Signal: csysack_s31
wire AxiMonitorInterface_csysack_s31;

// Interface: GifSlaveInterface Signal: gclk
wire GifSlaveInterface_gclk;

// Interface: GifSlaveInterface Signal: maddr
wire [63:0] GifSlaveInterface_maddr;

// Interface: GifSlaveInterface Signal: mread
wire GifSlaveInterface_mread;

// Interface: GifSlaveInterface Signal: mwrite
wire GifSlaveInterface_mwrite;

// Interface: GifSlaveInterface Signal: mlen
wire [7:0] GifSlaveInterface_mlen;

// Interface: GifSlaveInterface Signal: msize
wire [2:0] GifSlaveInterface_msize;

// Interface: GifSlaveInterface Signal: mburst
wire [1:0] GifSlaveInterface_mburst;

// Interface: GifSlaveInterface Signal: mlast
wire GifSlaveInterface_mlast;

// Interface: GifSlaveInterface Signal: mdata
wire [511:0] GifSlaveInterface_mdata;

// Interface: GifSlaveInterface Signal: mwstrb
wire [63:0] GifSlaveInterface_mwstrb;

// Interface: GifSlaveInterface Signal: saccept
reg vmc_GifSlaveInterface_saccept_reg;
assign GifSlaveInterface_saccept = vmc_GifSlaveInterface_saccept_reg;
wire GifSlaveInterface_saccept;

// Interface: GifSlaveInterface Signal: svalid
reg vmc_GifSlaveInterface_svalid_reg;
assign GifSlaveInterface_svalid = vmc_GifSlaveInterface_svalid_reg;
wire GifSlaveInterface_svalid;

// Interface: GifSlaveInterface Signal: sdata
reg [511:0] vmc_GifSlaveInterface_sdata_reg;
assign GifSlaveInterface_sdata = vmc_GifSlaveInterface_sdata_reg;
wire [511:0] GifSlaveInterface_sdata;

// Interface: GifSlaveInterface Signal: sresp
reg [1:0] vmc_GifSlaveInterface_sresp_reg;
assign GifSlaveInterface_sresp = vmc_GifSlaveInterface_sresp_reg;
wire [1:0] GifSlaveInterface_sresp;

// Interface: GifSlaveInterface Signal: mready
wire GifSlaveInterface_mready;

// Interface: LowPowerInterface Signal: aclk
wire LowPowerInterface_aclk;

// Interface: LowPowerInterface Signal: aresetn
wire LowPowerInterface_aresetn;

// Interface: LowPowerInterface Signal: csysreq
reg vmc_LowPowerInterface_csysreq_reg;
assign LowPowerInterface_csysreq = vmc_LowPowerInterface_csysreq_reg;

// Interface: LowPowerInterface Signal: cactive
wire LowPowerInterface_cactive;

// Interface: LowPowerInterface Signal: csysack
wire LowPowerInterface_csysack;

// Interface: LowPowerInterface Signal: shutdown
reg vmc_LowPowerInterface_shutdown_reg;
assign LowPowerInterface_shutdown = vmc_LowPowerInterface_shutdown_reg;

// Interface: LowPowerInterface Signal: clocklevel
reg vmc_LowPowerInterface_clocklevel_reg;
assign LowPowerInterface_clocklevel = vmc_LowPowerInterface_clocklevel_reg;

// Interface: LowPowerInterface Signal: cvrgen
reg vmc_LowPowerInterface_cvrgen_reg;
assign LowPowerInterface_cvrgen = vmc_LowPowerInterface_cvrgen_reg;


// Misc variables
integer vmcint_prog_id;

// Global Variables at top block


// Initial driver state
initial
begin
  vmc_AxiMasterInterface_awvalid_reg = 1'bz;
  vmc_AxiMasterInterface_awaddr_reg = 64'bz;
  vmc_AxiMasterInterface_awlen_reg = 10'bz;
  vmc_AxiMasterInterface_awsize_reg = 3'bz;
  vmc_AxiMasterInterface_awburst_reg = 2'bz;
  vmc_AxiMasterInterface_awlock_reg = 2'bz;
  vmc_AxiMasterInterface_awcache_reg = 4'bz;
  vmc_AxiMasterInterface_awprot_reg = 3'bz;
  vmc_AxiMasterInterface_awid_reg = 32'bz;
  vmc_AxiMasterInterface_awsideband_reg = 64'bz;
  vmc_AxiMasterInterface_arvalid_reg = 1'bz;
  vmc_AxiMasterInterface_araddr_reg = 64'bz;
  vmc_AxiMasterInterface_arlen_reg = 10'bz;
  vmc_AxiMasterInterface_arsize_reg = 3'bz;
  vmc_AxiMasterInterface_arburst_reg = 2'bz;
  vmc_AxiMasterInterface_arlock_reg = 2'bz;
  vmc_AxiMasterInterface_arcache_reg = 4'bz;
  vmc_AxiMasterInterface_arprot_reg = 3'bz;
  vmc_AxiMasterInterface_arid_reg = 32'bz;
  vmc_AxiMasterInterface_arsideband_reg = 64'bz;
  vmc_AxiMasterInterface_rready_reg = 1'bz;
  vmc_AxiMasterInterface_wvalid_reg = 1'bz;
  vmc_AxiMasterInterface_wlast_reg = 1'bz;
  vmc_AxiMasterInterface_wdata_reg = 1024'bz;
  vmc_AxiMasterInterface_wstrb_reg = 128'bz;
  vmc_AxiMasterInterface_wid_reg = 32'bz;
  vmc_AxiMasterInterface_wsideband_reg = 64'bz;
  vmc_AxiMasterInterface_bready_reg = 1'bz;
  vmc_AxiMasterInterface_csysack_reg = 1'bz;
  vmc_AxiMasterInterface_cactive_reg = 1'bz;
  vmc_GifSlaveInterface_saccept_reg = 1'bz;
  vmc_GifSlaveInterface_svalid_reg = 1'bz;
  vmc_GifSlaveInterface_sdata_reg = 512'bz;
  vmc_GifSlaveInterface_sresp_reg = 2'bz;
  vmc_LowPowerInterface_csysreq_reg = 1'bz;
  vmc_LowPowerInterface_shutdown_reg = 1'bz;
  vmc_LowPowerInterface_clocklevel_reg = 1'bz;
  vmc_LowPowerInterface_cvrgen_reg = 1'bz;
end

initial
begin

    $vmc_init();
    vmcint_prog_id = $vmc_setup_start("test_DW_axi_gs");
    $vera_add_parameter("vera_shell_version", "1.0", 2);

// Interface definition for VMC

    $vmc_system_clock(SystemClock);
    $vmc_add_interface_signal(1, 1, AxiMasterInterface_aclk, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 2, AxiMasterInterface_aresetn, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 3, 0, vmc_AxiMasterInterface_awvalid_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 4, 0, vmc_AxiMasterInterface_awaddr_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 5, 0, vmc_AxiMasterInterface_awlen_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 6, 0, vmc_AxiMasterInterface_awsize_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 7, 0, vmc_AxiMasterInterface_awburst_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 8, 0, vmc_AxiMasterInterface_awlock_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 9, 0, vmc_AxiMasterInterface_awcache_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 10, 0, vmc_AxiMasterInterface_awprot_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 11, 0, vmc_AxiMasterInterface_awid_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 12, 0, vmc_AxiMasterInterface_awsideband_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 13, AxiMasterInterface_awready, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 14, 0, vmc_AxiMasterInterface_arvalid_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 15, 0, vmc_AxiMasterInterface_araddr_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 16, 0, vmc_AxiMasterInterface_arlen_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 17, 0, vmc_AxiMasterInterface_arsize_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 18, 0, vmc_AxiMasterInterface_arburst_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 19, 0, vmc_AxiMasterInterface_arlock_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 20, 0, vmc_AxiMasterInterface_arcache_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 21, 0, vmc_AxiMasterInterface_arprot_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 22, 0, vmc_AxiMasterInterface_arid_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 23, 0, vmc_AxiMasterInterface_arsideband_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 24, AxiMasterInterface_arready, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 25, AxiMasterInterface_rvalid, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 26, AxiMasterInterface_rlast, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 27, AxiMasterInterface_rdata, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 28, AxiMasterInterface_rresp, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 29, AxiMasterInterface_rid, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 30, AxiMasterInterface_rsideband, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 31, 0, vmc_AxiMasterInterface_rready_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 32, 0, vmc_AxiMasterInterface_wvalid_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 33, 0, vmc_AxiMasterInterface_wlast_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 34, 0, vmc_AxiMasterInterface_wdata_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 35, 0, vmc_AxiMasterInterface_wstrb_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 36, 0, vmc_AxiMasterInterface_wid_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 37, 0, vmc_AxiMasterInterface_wsideband_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 38, AxiMasterInterface_wready, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 39, AxiMasterInterface_bvalid, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 40, AxiMasterInterface_bresp, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 41, AxiMasterInterface_bid, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 42, AxiMasterInterface_bsideband, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 43, 0, vmc_AxiMasterInterface_bready_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 44, AxiMasterInterface_csysreq, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 45, 0, vmc_AxiMasterInterface_csysack_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 46, 0, vmc_AxiMasterInterface_cactive_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1, AxiMonitorInterface_aclk, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2, AxiMonitorInterface_aresetn, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 3, AxiMonitorInterface_arvalid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 4, AxiMonitorInterface_arvalid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 5, AxiMonitorInterface_arvalid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 6, AxiMonitorInterface_arvalid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 7, AxiMonitorInterface_arvalid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 8, AxiMonitorInterface_arvalid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 9, AxiMonitorInterface_arvalid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 10, AxiMonitorInterface_arvalid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 11, AxiMonitorInterface_arvalid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 12, AxiMonitorInterface_arvalid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 13, AxiMonitorInterface_arvalid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 14, AxiMonitorInterface_arvalid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 15, AxiMonitorInterface_arvalid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 16, AxiMonitorInterface_arvalid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 17, AxiMonitorInterface_arvalid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 18, AxiMonitorInterface_arvalid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 19, AxiMonitorInterface_arvalid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 20, AxiMonitorInterface_arvalid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 21, AxiMonitorInterface_arvalid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 22, AxiMonitorInterface_arvalid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 23, AxiMonitorInterface_arvalid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 24, AxiMonitorInterface_arvalid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 25, AxiMonitorInterface_arvalid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 26, AxiMonitorInterface_arvalid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 27, AxiMonitorInterface_arvalid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 28, AxiMonitorInterface_arvalid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 29, AxiMonitorInterface_arvalid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 30, AxiMonitorInterface_arvalid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 31, AxiMonitorInterface_arvalid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 32, AxiMonitorInterface_arvalid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 33, AxiMonitorInterface_arvalid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 34, AxiMonitorInterface_arvalid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 35, AxiMonitorInterface_araddr_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 36, AxiMonitorInterface_araddr_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 37, AxiMonitorInterface_araddr_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 38, AxiMonitorInterface_araddr_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 39, AxiMonitorInterface_araddr_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 40, AxiMonitorInterface_araddr_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 41, AxiMonitorInterface_araddr_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 42, AxiMonitorInterface_araddr_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 43, AxiMonitorInterface_araddr_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 44, AxiMonitorInterface_araddr_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 45, AxiMonitorInterface_araddr_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 46, AxiMonitorInterface_araddr_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 47, AxiMonitorInterface_araddr_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 48, AxiMonitorInterface_araddr_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 49, AxiMonitorInterface_araddr_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 50, AxiMonitorInterface_araddr_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 51, AxiMonitorInterface_araddr_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 52, AxiMonitorInterface_araddr_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 53, AxiMonitorInterface_araddr_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 54, AxiMonitorInterface_araddr_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 55, AxiMonitorInterface_araddr_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 56, AxiMonitorInterface_araddr_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 57, AxiMonitorInterface_araddr_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 58, AxiMonitorInterface_araddr_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 59, AxiMonitorInterface_araddr_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 60, AxiMonitorInterface_araddr_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 61, AxiMonitorInterface_araddr_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 62, AxiMonitorInterface_araddr_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 63, AxiMonitorInterface_araddr_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 64, AxiMonitorInterface_araddr_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 65, AxiMonitorInterface_araddr_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 66, AxiMonitorInterface_araddr_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 67, AxiMonitorInterface_arlen_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 68, AxiMonitorInterface_arlen_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 69, AxiMonitorInterface_arlen_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 70, AxiMonitorInterface_arlen_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 71, AxiMonitorInterface_arlen_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 72, AxiMonitorInterface_arlen_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 73, AxiMonitorInterface_arlen_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 74, AxiMonitorInterface_arlen_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 75, AxiMonitorInterface_arlen_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 76, AxiMonitorInterface_arlen_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 77, AxiMonitorInterface_arlen_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 78, AxiMonitorInterface_arlen_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 79, AxiMonitorInterface_arlen_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 80, AxiMonitorInterface_arlen_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 81, AxiMonitorInterface_arlen_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 82, AxiMonitorInterface_arlen_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 83, AxiMonitorInterface_arlen_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 84, AxiMonitorInterface_arlen_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 85, AxiMonitorInterface_arlen_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 86, AxiMonitorInterface_arlen_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 87, AxiMonitorInterface_arlen_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 88, AxiMonitorInterface_arlen_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 89, AxiMonitorInterface_arlen_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 90, AxiMonitorInterface_arlen_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 91, AxiMonitorInterface_arlen_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 92, AxiMonitorInterface_arlen_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 93, AxiMonitorInterface_arlen_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 94, AxiMonitorInterface_arlen_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 95, AxiMonitorInterface_arlen_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 96, AxiMonitorInterface_arlen_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 97, AxiMonitorInterface_arlen_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 98, AxiMonitorInterface_arlen_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 99, AxiMonitorInterface_arsize_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 100, AxiMonitorInterface_arsize_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 101, AxiMonitorInterface_arsize_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 102, AxiMonitorInterface_arsize_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 103, AxiMonitorInterface_arsize_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 104, AxiMonitorInterface_arsize_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 105, AxiMonitorInterface_arsize_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 106, AxiMonitorInterface_arsize_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 107, AxiMonitorInterface_arsize_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 108, AxiMonitorInterface_arsize_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 109, AxiMonitorInterface_arsize_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 110, AxiMonitorInterface_arsize_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 111, AxiMonitorInterface_arsize_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 112, AxiMonitorInterface_arsize_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 113, AxiMonitorInterface_arsize_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 114, AxiMonitorInterface_arsize_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 115, AxiMonitorInterface_arsize_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 116, AxiMonitorInterface_arsize_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 117, AxiMonitorInterface_arsize_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 118, AxiMonitorInterface_arsize_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 119, AxiMonitorInterface_arsize_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 120, AxiMonitorInterface_arsize_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 121, AxiMonitorInterface_arsize_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 122, AxiMonitorInterface_arsize_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 123, AxiMonitorInterface_arsize_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 124, AxiMonitorInterface_arsize_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 125, AxiMonitorInterface_arsize_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 126, AxiMonitorInterface_arsize_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 127, AxiMonitorInterface_arsize_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 128, AxiMonitorInterface_arsize_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 129, AxiMonitorInterface_arsize_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 130, AxiMonitorInterface_arsize_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 131, AxiMonitorInterface_arburst_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 132, AxiMonitorInterface_arburst_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 133, AxiMonitorInterface_arburst_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 134, AxiMonitorInterface_arburst_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 135, AxiMonitorInterface_arburst_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 136, AxiMonitorInterface_arburst_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 137, AxiMonitorInterface_arburst_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 138, AxiMonitorInterface_arburst_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 139, AxiMonitorInterface_arburst_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 140, AxiMonitorInterface_arburst_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 141, AxiMonitorInterface_arburst_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 142, AxiMonitorInterface_arburst_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 143, AxiMonitorInterface_arburst_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 144, AxiMonitorInterface_arburst_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 145, AxiMonitorInterface_arburst_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 146, AxiMonitorInterface_arburst_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 147, AxiMonitorInterface_arburst_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 148, AxiMonitorInterface_arburst_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 149, AxiMonitorInterface_arburst_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 150, AxiMonitorInterface_arburst_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 151, AxiMonitorInterface_arburst_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 152, AxiMonitorInterface_arburst_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 153, AxiMonitorInterface_arburst_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 154, AxiMonitorInterface_arburst_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 155, AxiMonitorInterface_arburst_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 156, AxiMonitorInterface_arburst_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 157, AxiMonitorInterface_arburst_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 158, AxiMonitorInterface_arburst_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 159, AxiMonitorInterface_arburst_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 160, AxiMonitorInterface_arburst_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 161, AxiMonitorInterface_arburst_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 162, AxiMonitorInterface_arburst_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 163, AxiMonitorInterface_arlock_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 164, AxiMonitorInterface_arlock_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 165, AxiMonitorInterface_arlock_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 166, AxiMonitorInterface_arlock_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 167, AxiMonitorInterface_arlock_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 168, AxiMonitorInterface_arlock_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 169, AxiMonitorInterface_arlock_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 170, AxiMonitorInterface_arlock_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 171, AxiMonitorInterface_arlock_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 172, AxiMonitorInterface_arlock_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 173, AxiMonitorInterface_arlock_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 174, AxiMonitorInterface_arlock_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 175, AxiMonitorInterface_arlock_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 176, AxiMonitorInterface_arlock_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 177, AxiMonitorInterface_arlock_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 178, AxiMonitorInterface_arlock_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 179, AxiMonitorInterface_arlock_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 180, AxiMonitorInterface_arlock_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 181, AxiMonitorInterface_arlock_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 182, AxiMonitorInterface_arlock_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 183, AxiMonitorInterface_arlock_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 184, AxiMonitorInterface_arlock_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 185, AxiMonitorInterface_arlock_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 186, AxiMonitorInterface_arlock_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 187, AxiMonitorInterface_arlock_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 188, AxiMonitorInterface_arlock_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 189, AxiMonitorInterface_arlock_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 190, AxiMonitorInterface_arlock_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 191, AxiMonitorInterface_arlock_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 192, AxiMonitorInterface_arlock_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 193, AxiMonitorInterface_arlock_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 194, AxiMonitorInterface_arlock_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 195, AxiMonitorInterface_arcache_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 196, AxiMonitorInterface_arcache_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 197, AxiMonitorInterface_arcache_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 198, AxiMonitorInterface_arcache_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 199, AxiMonitorInterface_arcache_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 200, AxiMonitorInterface_arcache_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 201, AxiMonitorInterface_arcache_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 202, AxiMonitorInterface_arcache_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 203, AxiMonitorInterface_arcache_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 204, AxiMonitorInterface_arcache_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 205, AxiMonitorInterface_arcache_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 206, AxiMonitorInterface_arcache_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 207, AxiMonitorInterface_arcache_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 208, AxiMonitorInterface_arcache_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 209, AxiMonitorInterface_arcache_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 210, AxiMonitorInterface_arcache_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 211, AxiMonitorInterface_arcache_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 212, AxiMonitorInterface_arcache_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 213, AxiMonitorInterface_arcache_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 214, AxiMonitorInterface_arcache_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 215, AxiMonitorInterface_arcache_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 216, AxiMonitorInterface_arcache_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 217, AxiMonitorInterface_arcache_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 218, AxiMonitorInterface_arcache_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 219, AxiMonitorInterface_arcache_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 220, AxiMonitorInterface_arcache_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 221, AxiMonitorInterface_arcache_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 222, AxiMonitorInterface_arcache_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 223, AxiMonitorInterface_arcache_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 224, AxiMonitorInterface_arcache_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 225, AxiMonitorInterface_arcache_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 226, AxiMonitorInterface_arcache_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 227, AxiMonitorInterface_arprot_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 228, AxiMonitorInterface_arprot_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 229, AxiMonitorInterface_arprot_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 230, AxiMonitorInterface_arprot_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 231, AxiMonitorInterface_arprot_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 232, AxiMonitorInterface_arprot_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 233, AxiMonitorInterface_arprot_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 234, AxiMonitorInterface_arprot_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 235, AxiMonitorInterface_arprot_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 236, AxiMonitorInterface_arprot_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 237, AxiMonitorInterface_arprot_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 238, AxiMonitorInterface_arprot_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 239, AxiMonitorInterface_arprot_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 240, AxiMonitorInterface_arprot_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 241, AxiMonitorInterface_arprot_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 242, AxiMonitorInterface_arprot_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 243, AxiMonitorInterface_arprot_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 244, AxiMonitorInterface_arprot_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 245, AxiMonitorInterface_arprot_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 246, AxiMonitorInterface_arprot_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 247, AxiMonitorInterface_arprot_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 248, AxiMonitorInterface_arprot_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 249, AxiMonitorInterface_arprot_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 250, AxiMonitorInterface_arprot_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 251, AxiMonitorInterface_arprot_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 252, AxiMonitorInterface_arprot_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 253, AxiMonitorInterface_arprot_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 254, AxiMonitorInterface_arprot_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 255, AxiMonitorInterface_arprot_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 256, AxiMonitorInterface_arprot_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 257, AxiMonitorInterface_arprot_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 258, AxiMonitorInterface_arprot_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 259, AxiMonitorInterface_arid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 260, AxiMonitorInterface_arid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 261, AxiMonitorInterface_arid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 262, AxiMonitorInterface_arid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 263, AxiMonitorInterface_arid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 264, AxiMonitorInterface_arid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 265, AxiMonitorInterface_arid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 266, AxiMonitorInterface_arid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 267, AxiMonitorInterface_arid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 268, AxiMonitorInterface_arid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 269, AxiMonitorInterface_arid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 270, AxiMonitorInterface_arid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 271, AxiMonitorInterface_arid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 272, AxiMonitorInterface_arid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 273, AxiMonitorInterface_arid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 274, AxiMonitorInterface_arid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 275, AxiMonitorInterface_arid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 276, AxiMonitorInterface_arid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 277, AxiMonitorInterface_arid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 278, AxiMonitorInterface_arid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 279, AxiMonitorInterface_arid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 280, AxiMonitorInterface_arid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 281, AxiMonitorInterface_arid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 282, AxiMonitorInterface_arid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 283, AxiMonitorInterface_arid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 284, AxiMonitorInterface_arid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 285, AxiMonitorInterface_arid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 286, AxiMonitorInterface_arid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 287, AxiMonitorInterface_arid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 288, AxiMonitorInterface_arid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 289, AxiMonitorInterface_arid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 290, AxiMonitorInterface_arid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 291, AxiMonitorInterface_arready_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 292, AxiMonitorInterface_arready_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 293, AxiMonitorInterface_arready_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 294, AxiMonitorInterface_arready_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 295, AxiMonitorInterface_arready_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 296, AxiMonitorInterface_arready_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 297, AxiMonitorInterface_arready_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 298, AxiMonitorInterface_arready_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 299, AxiMonitorInterface_arready_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 300, AxiMonitorInterface_arready_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 301, AxiMonitorInterface_arready_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 302, AxiMonitorInterface_arready_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 303, AxiMonitorInterface_arready_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 304, AxiMonitorInterface_arready_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 305, AxiMonitorInterface_arready_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 306, AxiMonitorInterface_arready_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 307, AxiMonitorInterface_arready_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 308, AxiMonitorInterface_arready_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 309, AxiMonitorInterface_arready_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 310, AxiMonitorInterface_arready_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 311, AxiMonitorInterface_arready_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 312, AxiMonitorInterface_arready_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 313, AxiMonitorInterface_arready_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 314, AxiMonitorInterface_arready_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 315, AxiMonitorInterface_arready_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 316, AxiMonitorInterface_arready_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 317, AxiMonitorInterface_arready_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 318, AxiMonitorInterface_arready_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 319, AxiMonitorInterface_arready_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 320, AxiMonitorInterface_arready_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 321, AxiMonitorInterface_arready_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 322, AxiMonitorInterface_arready_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 323, AxiMonitorInterface_arsideband_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 324, AxiMonitorInterface_arsideband_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 325, AxiMonitorInterface_arsideband_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 326, AxiMonitorInterface_arsideband_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 327, AxiMonitorInterface_arsideband_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 328, AxiMonitorInterface_arsideband_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 329, AxiMonitorInterface_arsideband_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 330, AxiMonitorInterface_arsideband_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 331, AxiMonitorInterface_arsideband_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 332, AxiMonitorInterface_arsideband_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 333, AxiMonitorInterface_arsideband_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 334, AxiMonitorInterface_arsideband_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 335, AxiMonitorInterface_arsideband_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 336, AxiMonitorInterface_arsideband_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 337, AxiMonitorInterface_arsideband_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 338, AxiMonitorInterface_arsideband_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 339, AxiMonitorInterface_arsideband_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 340, AxiMonitorInterface_arsideband_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 341, AxiMonitorInterface_arsideband_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 342, AxiMonitorInterface_arsideband_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 343, AxiMonitorInterface_arsideband_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 344, AxiMonitorInterface_arsideband_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 345, AxiMonitorInterface_arsideband_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 346, AxiMonitorInterface_arsideband_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 347, AxiMonitorInterface_arsideband_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 348, AxiMonitorInterface_arsideband_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 349, AxiMonitorInterface_arsideband_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 350, AxiMonitorInterface_arsideband_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 351, AxiMonitorInterface_arsideband_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 352, AxiMonitorInterface_arsideband_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 353, AxiMonitorInterface_arsideband_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 354, AxiMonitorInterface_arsideband_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 355, AxiMonitorInterface_awvalid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 356, AxiMonitorInterface_awvalid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 357, AxiMonitorInterface_awvalid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 358, AxiMonitorInterface_awvalid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 359, AxiMonitorInterface_awvalid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 360, AxiMonitorInterface_awvalid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 361, AxiMonitorInterface_awvalid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 362, AxiMonitorInterface_awvalid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 363, AxiMonitorInterface_awvalid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 364, AxiMonitorInterface_awvalid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 365, AxiMonitorInterface_awvalid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 366, AxiMonitorInterface_awvalid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 367, AxiMonitorInterface_awvalid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 368, AxiMonitorInterface_awvalid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 369, AxiMonitorInterface_awvalid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 370, AxiMonitorInterface_awvalid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 371, AxiMonitorInterface_awvalid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 372, AxiMonitorInterface_awvalid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 373, AxiMonitorInterface_awvalid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 374, AxiMonitorInterface_awvalid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 375, AxiMonitorInterface_awvalid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 376, AxiMonitorInterface_awvalid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 377, AxiMonitorInterface_awvalid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 378, AxiMonitorInterface_awvalid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 379, AxiMonitorInterface_awvalid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 380, AxiMonitorInterface_awvalid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 381, AxiMonitorInterface_awvalid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 382, AxiMonitorInterface_awvalid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 383, AxiMonitorInterface_awvalid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 384, AxiMonitorInterface_awvalid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 385, AxiMonitorInterface_awvalid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 386, AxiMonitorInterface_awvalid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 387, AxiMonitorInterface_awaddr_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 388, AxiMonitorInterface_awaddr_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 389, AxiMonitorInterface_awaddr_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 390, AxiMonitorInterface_awaddr_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 391, AxiMonitorInterface_awaddr_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 392, AxiMonitorInterface_awaddr_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 393, AxiMonitorInterface_awaddr_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 394, AxiMonitorInterface_awaddr_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 395, AxiMonitorInterface_awaddr_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 396, AxiMonitorInterface_awaddr_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 397, AxiMonitorInterface_awaddr_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 398, AxiMonitorInterface_awaddr_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 399, AxiMonitorInterface_awaddr_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 400, AxiMonitorInterface_awaddr_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 401, AxiMonitorInterface_awaddr_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 402, AxiMonitorInterface_awaddr_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 403, AxiMonitorInterface_awaddr_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 404, AxiMonitorInterface_awaddr_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 405, AxiMonitorInterface_awaddr_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 406, AxiMonitorInterface_awaddr_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 407, AxiMonitorInterface_awaddr_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 408, AxiMonitorInterface_awaddr_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 409, AxiMonitorInterface_awaddr_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 410, AxiMonitorInterface_awaddr_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 411, AxiMonitorInterface_awaddr_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 412, AxiMonitorInterface_awaddr_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 413, AxiMonitorInterface_awaddr_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 414, AxiMonitorInterface_awaddr_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 415, AxiMonitorInterface_awaddr_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 416, AxiMonitorInterface_awaddr_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 417, AxiMonitorInterface_awaddr_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 418, AxiMonitorInterface_awaddr_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 419, AxiMonitorInterface_awlen_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 420, AxiMonitorInterface_awlen_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 421, AxiMonitorInterface_awlen_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 422, AxiMonitorInterface_awlen_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 423, AxiMonitorInterface_awlen_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 424, AxiMonitorInterface_awlen_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 425, AxiMonitorInterface_awlen_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 426, AxiMonitorInterface_awlen_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 427, AxiMonitorInterface_awlen_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 428, AxiMonitorInterface_awlen_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 429, AxiMonitorInterface_awlen_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 430, AxiMonitorInterface_awlen_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 431, AxiMonitorInterface_awlen_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 432, AxiMonitorInterface_awlen_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 433, AxiMonitorInterface_awlen_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 434, AxiMonitorInterface_awlen_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 435, AxiMonitorInterface_awlen_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 436, AxiMonitorInterface_awlen_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 437, AxiMonitorInterface_awlen_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 438, AxiMonitorInterface_awlen_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 439, AxiMonitorInterface_awlen_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 440, AxiMonitorInterface_awlen_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 441, AxiMonitorInterface_awlen_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 442, AxiMonitorInterface_awlen_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 443, AxiMonitorInterface_awlen_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 444, AxiMonitorInterface_awlen_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 445, AxiMonitorInterface_awlen_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 446, AxiMonitorInterface_awlen_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 447, AxiMonitorInterface_awlen_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 448, AxiMonitorInterface_awlen_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 449, AxiMonitorInterface_awlen_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 450, AxiMonitorInterface_awlen_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 451, AxiMonitorInterface_awsize_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 452, AxiMonitorInterface_awsize_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 453, AxiMonitorInterface_awsize_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 454, AxiMonitorInterface_awsize_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 455, AxiMonitorInterface_awsize_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 456, AxiMonitorInterface_awsize_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 457, AxiMonitorInterface_awsize_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 458, AxiMonitorInterface_awsize_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 459, AxiMonitorInterface_awsize_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 460, AxiMonitorInterface_awsize_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 461, AxiMonitorInterface_awsize_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 462, AxiMonitorInterface_awsize_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 463, AxiMonitorInterface_awsize_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 464, AxiMonitorInterface_awsize_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 465, AxiMonitorInterface_awsize_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 466, AxiMonitorInterface_awsize_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 467, AxiMonitorInterface_awsize_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 468, AxiMonitorInterface_awsize_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 469, AxiMonitorInterface_awsize_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 470, AxiMonitorInterface_awsize_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 471, AxiMonitorInterface_awsize_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 472, AxiMonitorInterface_awsize_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 473, AxiMonitorInterface_awsize_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 474, AxiMonitorInterface_awsize_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 475, AxiMonitorInterface_awsize_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 476, AxiMonitorInterface_awsize_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 477, AxiMonitorInterface_awsize_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 478, AxiMonitorInterface_awsize_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 479, AxiMonitorInterface_awsize_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 480, AxiMonitorInterface_awsize_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 481, AxiMonitorInterface_awsize_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 482, AxiMonitorInterface_awsize_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 483, AxiMonitorInterface_awburst_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 484, AxiMonitorInterface_awburst_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 485, AxiMonitorInterface_awburst_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 486, AxiMonitorInterface_awburst_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 487, AxiMonitorInterface_awburst_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 488, AxiMonitorInterface_awburst_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 489, AxiMonitorInterface_awburst_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 490, AxiMonitorInterface_awburst_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 491, AxiMonitorInterface_awburst_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 492, AxiMonitorInterface_awburst_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 493, AxiMonitorInterface_awburst_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 494, AxiMonitorInterface_awburst_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 495, AxiMonitorInterface_awburst_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 496, AxiMonitorInterface_awburst_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 497, AxiMonitorInterface_awburst_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 498, AxiMonitorInterface_awburst_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 499, AxiMonitorInterface_awburst_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 500, AxiMonitorInterface_awburst_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 501, AxiMonitorInterface_awburst_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 502, AxiMonitorInterface_awburst_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 503, AxiMonitorInterface_awburst_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 504, AxiMonitorInterface_awburst_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 505, AxiMonitorInterface_awburst_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 506, AxiMonitorInterface_awburst_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 507, AxiMonitorInterface_awburst_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 508, AxiMonitorInterface_awburst_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 509, AxiMonitorInterface_awburst_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 510, AxiMonitorInterface_awburst_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 511, AxiMonitorInterface_awburst_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 512, AxiMonitorInterface_awburst_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 513, AxiMonitorInterface_awburst_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 514, AxiMonitorInterface_awburst_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 515, AxiMonitorInterface_awlock_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 516, AxiMonitorInterface_awlock_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 517, AxiMonitorInterface_awlock_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 518, AxiMonitorInterface_awlock_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 519, AxiMonitorInterface_awlock_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 520, AxiMonitorInterface_awlock_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 521, AxiMonitorInterface_awlock_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 522, AxiMonitorInterface_awlock_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 523, AxiMonitorInterface_awlock_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 524, AxiMonitorInterface_awlock_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 525, AxiMonitorInterface_awlock_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 526, AxiMonitorInterface_awlock_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 527, AxiMonitorInterface_awlock_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 528, AxiMonitorInterface_awlock_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 529, AxiMonitorInterface_awlock_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 530, AxiMonitorInterface_awlock_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 531, AxiMonitorInterface_awlock_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 532, AxiMonitorInterface_awlock_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 533, AxiMonitorInterface_awlock_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 534, AxiMonitorInterface_awlock_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 535, AxiMonitorInterface_awlock_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 536, AxiMonitorInterface_awlock_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 537, AxiMonitorInterface_awlock_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 538, AxiMonitorInterface_awlock_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 539, AxiMonitorInterface_awlock_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 540, AxiMonitorInterface_awlock_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 541, AxiMonitorInterface_awlock_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 542, AxiMonitorInterface_awlock_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 543, AxiMonitorInterface_awlock_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 544, AxiMonitorInterface_awlock_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 545, AxiMonitorInterface_awlock_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 546, AxiMonitorInterface_awlock_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 547, AxiMonitorInterface_awcache_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 548, AxiMonitorInterface_awcache_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 549, AxiMonitorInterface_awcache_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 550, AxiMonitorInterface_awcache_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 551, AxiMonitorInterface_awcache_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 552, AxiMonitorInterface_awcache_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 553, AxiMonitorInterface_awcache_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 554, AxiMonitorInterface_awcache_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 555, AxiMonitorInterface_awcache_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 556, AxiMonitorInterface_awcache_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 557, AxiMonitorInterface_awcache_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 558, AxiMonitorInterface_awcache_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 559, AxiMonitorInterface_awcache_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 560, AxiMonitorInterface_awcache_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 561, AxiMonitorInterface_awcache_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 562, AxiMonitorInterface_awcache_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 563, AxiMonitorInterface_awcache_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 564, AxiMonitorInterface_awcache_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 565, AxiMonitorInterface_awcache_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 566, AxiMonitorInterface_awcache_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 567, AxiMonitorInterface_awcache_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 568, AxiMonitorInterface_awcache_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 569, AxiMonitorInterface_awcache_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 570, AxiMonitorInterface_awcache_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 571, AxiMonitorInterface_awcache_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 572, AxiMonitorInterface_awcache_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 573, AxiMonitorInterface_awcache_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 574, AxiMonitorInterface_awcache_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 575, AxiMonitorInterface_awcache_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 576, AxiMonitorInterface_awcache_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 577, AxiMonitorInterface_awcache_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 578, AxiMonitorInterface_awcache_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 579, AxiMonitorInterface_awprot_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 580, AxiMonitorInterface_awprot_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 581, AxiMonitorInterface_awprot_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 582, AxiMonitorInterface_awprot_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 583, AxiMonitorInterface_awprot_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 584, AxiMonitorInterface_awprot_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 585, AxiMonitorInterface_awprot_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 586, AxiMonitorInterface_awprot_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 587, AxiMonitorInterface_awprot_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 588, AxiMonitorInterface_awprot_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 589, AxiMonitorInterface_awprot_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 590, AxiMonitorInterface_awprot_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 591, AxiMonitorInterface_awprot_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 592, AxiMonitorInterface_awprot_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 593, AxiMonitorInterface_awprot_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 594, AxiMonitorInterface_awprot_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 595, AxiMonitorInterface_awprot_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 596, AxiMonitorInterface_awprot_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 597, AxiMonitorInterface_awprot_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 598, AxiMonitorInterface_awprot_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 599, AxiMonitorInterface_awprot_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 600, AxiMonitorInterface_awprot_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 601, AxiMonitorInterface_awprot_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 602, AxiMonitorInterface_awprot_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 603, AxiMonitorInterface_awprot_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 604, AxiMonitorInterface_awprot_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 605, AxiMonitorInterface_awprot_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 606, AxiMonitorInterface_awprot_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 607, AxiMonitorInterface_awprot_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 608, AxiMonitorInterface_awprot_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 609, AxiMonitorInterface_awprot_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 610, AxiMonitorInterface_awprot_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 611, AxiMonitorInterface_awid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 612, AxiMonitorInterface_awid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 613, AxiMonitorInterface_awid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 614, AxiMonitorInterface_awid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 615, AxiMonitorInterface_awid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 616, AxiMonitorInterface_awid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 617, AxiMonitorInterface_awid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 618, AxiMonitorInterface_awid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 619, AxiMonitorInterface_awid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 620, AxiMonitorInterface_awid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 621, AxiMonitorInterface_awid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 622, AxiMonitorInterface_awid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 623, AxiMonitorInterface_awid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 624, AxiMonitorInterface_awid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 625, AxiMonitorInterface_awid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 626, AxiMonitorInterface_awid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 627, AxiMonitorInterface_awid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 628, AxiMonitorInterface_awid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 629, AxiMonitorInterface_awid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 630, AxiMonitorInterface_awid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 631, AxiMonitorInterface_awid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 632, AxiMonitorInterface_awid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 633, AxiMonitorInterface_awid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 634, AxiMonitorInterface_awid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 635, AxiMonitorInterface_awid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 636, AxiMonitorInterface_awid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 637, AxiMonitorInterface_awid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 638, AxiMonitorInterface_awid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 639, AxiMonitorInterface_awid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 640, AxiMonitorInterface_awid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 641, AxiMonitorInterface_awid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 642, AxiMonitorInterface_awid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 643, AxiMonitorInterface_awready_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 644, AxiMonitorInterface_awready_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 645, AxiMonitorInterface_awready_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 646, AxiMonitorInterface_awready_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 647, AxiMonitorInterface_awready_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 648, AxiMonitorInterface_awready_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 649, AxiMonitorInterface_awready_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 650, AxiMonitorInterface_awready_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 651, AxiMonitorInterface_awready_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 652, AxiMonitorInterface_awready_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 653, AxiMonitorInterface_awready_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 654, AxiMonitorInterface_awready_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 655, AxiMonitorInterface_awready_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 656, AxiMonitorInterface_awready_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 657, AxiMonitorInterface_awready_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 658, AxiMonitorInterface_awready_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 659, AxiMonitorInterface_awready_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 660, AxiMonitorInterface_awready_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 661, AxiMonitorInterface_awready_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 662, AxiMonitorInterface_awready_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 663, AxiMonitorInterface_awready_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 664, AxiMonitorInterface_awready_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 665, AxiMonitorInterface_awready_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 666, AxiMonitorInterface_awready_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 667, AxiMonitorInterface_awready_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 668, AxiMonitorInterface_awready_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 669, AxiMonitorInterface_awready_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 670, AxiMonitorInterface_awready_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 671, AxiMonitorInterface_awready_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 672, AxiMonitorInterface_awready_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 673, AxiMonitorInterface_awready_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 674, AxiMonitorInterface_awready_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 675, AxiMonitorInterface_awsideband_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 676, AxiMonitorInterface_awsideband_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 677, AxiMonitorInterface_awsideband_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 678, AxiMonitorInterface_awsideband_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 679, AxiMonitorInterface_awsideband_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 680, AxiMonitorInterface_awsideband_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 681, AxiMonitorInterface_awsideband_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 682, AxiMonitorInterface_awsideband_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 683, AxiMonitorInterface_awsideband_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 684, AxiMonitorInterface_awsideband_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 685, AxiMonitorInterface_awsideband_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 686, AxiMonitorInterface_awsideband_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 687, AxiMonitorInterface_awsideband_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 688, AxiMonitorInterface_awsideband_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 689, AxiMonitorInterface_awsideband_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 690, AxiMonitorInterface_awsideband_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 691, AxiMonitorInterface_awsideband_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 692, AxiMonitorInterface_awsideband_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 693, AxiMonitorInterface_awsideband_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 694, AxiMonitorInterface_awsideband_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 695, AxiMonitorInterface_awsideband_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 696, AxiMonitorInterface_awsideband_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 697, AxiMonitorInterface_awsideband_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 698, AxiMonitorInterface_awsideband_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 699, AxiMonitorInterface_awsideband_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 700, AxiMonitorInterface_awsideband_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 701, AxiMonitorInterface_awsideband_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 702, AxiMonitorInterface_awsideband_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 703, AxiMonitorInterface_awsideband_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 704, AxiMonitorInterface_awsideband_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 705, AxiMonitorInterface_awsideband_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 706, AxiMonitorInterface_awsideband_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 707, AxiMonitorInterface_rvalid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 708, AxiMonitorInterface_rvalid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 709, AxiMonitorInterface_rvalid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 710, AxiMonitorInterface_rvalid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 711, AxiMonitorInterface_rvalid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 712, AxiMonitorInterface_rvalid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 713, AxiMonitorInterface_rvalid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 714, AxiMonitorInterface_rvalid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 715, AxiMonitorInterface_rvalid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 716, AxiMonitorInterface_rvalid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 717, AxiMonitorInterface_rvalid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 718, AxiMonitorInterface_rvalid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 719, AxiMonitorInterface_rvalid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 720, AxiMonitorInterface_rvalid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 721, AxiMonitorInterface_rvalid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 722, AxiMonitorInterface_rvalid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 723, AxiMonitorInterface_rvalid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 724, AxiMonitorInterface_rvalid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 725, AxiMonitorInterface_rvalid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 726, AxiMonitorInterface_rvalid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 727, AxiMonitorInterface_rvalid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 728, AxiMonitorInterface_rvalid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 729, AxiMonitorInterface_rvalid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 730, AxiMonitorInterface_rvalid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 731, AxiMonitorInterface_rvalid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 732, AxiMonitorInterface_rvalid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 733, AxiMonitorInterface_rvalid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 734, AxiMonitorInterface_rvalid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 735, AxiMonitorInterface_rvalid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 736, AxiMonitorInterface_rvalid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 737, AxiMonitorInterface_rvalid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 738, AxiMonitorInterface_rvalid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 739, AxiMonitorInterface_rlast_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 740, AxiMonitorInterface_rlast_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 741, AxiMonitorInterface_rlast_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 742, AxiMonitorInterface_rlast_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 743, AxiMonitorInterface_rlast_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 744, AxiMonitorInterface_rlast_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 745, AxiMonitorInterface_rlast_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 746, AxiMonitorInterface_rlast_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 747, AxiMonitorInterface_rlast_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 748, AxiMonitorInterface_rlast_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 749, AxiMonitorInterface_rlast_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 750, AxiMonitorInterface_rlast_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 751, AxiMonitorInterface_rlast_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 752, AxiMonitorInterface_rlast_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 753, AxiMonitorInterface_rlast_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 754, AxiMonitorInterface_rlast_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 755, AxiMonitorInterface_rlast_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 756, AxiMonitorInterface_rlast_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 757, AxiMonitorInterface_rlast_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 758, AxiMonitorInterface_rlast_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 759, AxiMonitorInterface_rlast_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 760, AxiMonitorInterface_rlast_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 761, AxiMonitorInterface_rlast_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 762, AxiMonitorInterface_rlast_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 763, AxiMonitorInterface_rlast_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 764, AxiMonitorInterface_rlast_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 765, AxiMonitorInterface_rlast_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 766, AxiMonitorInterface_rlast_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 767, AxiMonitorInterface_rlast_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 768, AxiMonitorInterface_rlast_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 769, AxiMonitorInterface_rlast_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 770, AxiMonitorInterface_rlast_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 771, AxiMonitorInterface_rdata_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 772, AxiMonitorInterface_rdata_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 773, AxiMonitorInterface_rdata_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 774, AxiMonitorInterface_rdata_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 775, AxiMonitorInterface_rdata_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 776, AxiMonitorInterface_rdata_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 777, AxiMonitorInterface_rdata_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 778, AxiMonitorInterface_rdata_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 779, AxiMonitorInterface_rdata_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 780, AxiMonitorInterface_rdata_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 781, AxiMonitorInterface_rdata_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 782, AxiMonitorInterface_rdata_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 783, AxiMonitorInterface_rdata_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 784, AxiMonitorInterface_rdata_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 785, AxiMonitorInterface_rdata_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 786, AxiMonitorInterface_rdata_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 787, AxiMonitorInterface_rdata_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 788, AxiMonitorInterface_rdata_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 789, AxiMonitorInterface_rdata_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 790, AxiMonitorInterface_rdata_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 791, AxiMonitorInterface_rdata_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 792, AxiMonitorInterface_rdata_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 793, AxiMonitorInterface_rdata_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 794, AxiMonitorInterface_rdata_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 795, AxiMonitorInterface_rdata_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 796, AxiMonitorInterface_rdata_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 797, AxiMonitorInterface_rdata_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 798, AxiMonitorInterface_rdata_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 799, AxiMonitorInterface_rdata_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 800, AxiMonitorInterface_rdata_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 801, AxiMonitorInterface_rdata_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 802, AxiMonitorInterface_rdata_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 803, AxiMonitorInterface_rresp_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 804, AxiMonitorInterface_rresp_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 805, AxiMonitorInterface_rresp_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 806, AxiMonitorInterface_rresp_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 807, AxiMonitorInterface_rresp_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 808, AxiMonitorInterface_rresp_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 809, AxiMonitorInterface_rresp_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 810, AxiMonitorInterface_rresp_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 811, AxiMonitorInterface_rresp_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 812, AxiMonitorInterface_rresp_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 813, AxiMonitorInterface_rresp_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 814, AxiMonitorInterface_rresp_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 815, AxiMonitorInterface_rresp_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 816, AxiMonitorInterface_rresp_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 817, AxiMonitorInterface_rresp_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 818, AxiMonitorInterface_rresp_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 819, AxiMonitorInterface_rresp_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 820, AxiMonitorInterface_rresp_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 821, AxiMonitorInterface_rresp_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 822, AxiMonitorInterface_rresp_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 823, AxiMonitorInterface_rresp_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 824, AxiMonitorInterface_rresp_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 825, AxiMonitorInterface_rresp_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 826, AxiMonitorInterface_rresp_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 827, AxiMonitorInterface_rresp_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 828, AxiMonitorInterface_rresp_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 829, AxiMonitorInterface_rresp_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 830, AxiMonitorInterface_rresp_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 831, AxiMonitorInterface_rresp_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 832, AxiMonitorInterface_rresp_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 833, AxiMonitorInterface_rresp_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 834, AxiMonitorInterface_rresp_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 835, AxiMonitorInterface_rid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 836, AxiMonitorInterface_rid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 837, AxiMonitorInterface_rid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 838, AxiMonitorInterface_rid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 839, AxiMonitorInterface_rid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 840, AxiMonitorInterface_rid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 841, AxiMonitorInterface_rid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 842, AxiMonitorInterface_rid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 843, AxiMonitorInterface_rid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 844, AxiMonitorInterface_rid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 845, AxiMonitorInterface_rid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 846, AxiMonitorInterface_rid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 847, AxiMonitorInterface_rid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 848, AxiMonitorInterface_rid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 849, AxiMonitorInterface_rid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 850, AxiMonitorInterface_rid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 851, AxiMonitorInterface_rid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 852, AxiMonitorInterface_rid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 853, AxiMonitorInterface_rid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 854, AxiMonitorInterface_rid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 855, AxiMonitorInterface_rid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 856, AxiMonitorInterface_rid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 857, AxiMonitorInterface_rid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 858, AxiMonitorInterface_rid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 859, AxiMonitorInterface_rid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 860, AxiMonitorInterface_rid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 861, AxiMonitorInterface_rid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 862, AxiMonitorInterface_rid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 863, AxiMonitorInterface_rid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 864, AxiMonitorInterface_rid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 865, AxiMonitorInterface_rid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 866, AxiMonitorInterface_rid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 867, AxiMonitorInterface_rready_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 868, AxiMonitorInterface_rready_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 869, AxiMonitorInterface_rready_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 870, AxiMonitorInterface_rready_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 871, AxiMonitorInterface_rready_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 872, AxiMonitorInterface_rready_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 873, AxiMonitorInterface_rready_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 874, AxiMonitorInterface_rready_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 875, AxiMonitorInterface_rready_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 876, AxiMonitorInterface_rready_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 877, AxiMonitorInterface_rready_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 878, AxiMonitorInterface_rready_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 879, AxiMonitorInterface_rready_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 880, AxiMonitorInterface_rready_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 881, AxiMonitorInterface_rready_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 882, AxiMonitorInterface_rready_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 883, AxiMonitorInterface_rready_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 884, AxiMonitorInterface_rready_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 885, AxiMonitorInterface_rready_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 886, AxiMonitorInterface_rready_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 887, AxiMonitorInterface_rready_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 888, AxiMonitorInterface_rready_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 889, AxiMonitorInterface_rready_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 890, AxiMonitorInterface_rready_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 891, AxiMonitorInterface_rready_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 892, AxiMonitorInterface_rready_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 893, AxiMonitorInterface_rready_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 894, AxiMonitorInterface_rready_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 895, AxiMonitorInterface_rready_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 896, AxiMonitorInterface_rready_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 897, AxiMonitorInterface_rready_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 898, AxiMonitorInterface_rready_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 899, AxiMonitorInterface_rsideband_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 900, AxiMonitorInterface_rsideband_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 901, AxiMonitorInterface_rsideband_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 902, AxiMonitorInterface_rsideband_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 903, AxiMonitorInterface_rsideband_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 904, AxiMonitorInterface_rsideband_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 905, AxiMonitorInterface_rsideband_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 906, AxiMonitorInterface_rsideband_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 907, AxiMonitorInterface_rsideband_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 908, AxiMonitorInterface_rsideband_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 909, AxiMonitorInterface_rsideband_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 910, AxiMonitorInterface_rsideband_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 911, AxiMonitorInterface_rsideband_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 912, AxiMonitorInterface_rsideband_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 913, AxiMonitorInterface_rsideband_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 914, AxiMonitorInterface_rsideband_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 915, AxiMonitorInterface_rsideband_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 916, AxiMonitorInterface_rsideband_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 917, AxiMonitorInterface_rsideband_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 918, AxiMonitorInterface_rsideband_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 919, AxiMonitorInterface_rsideband_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 920, AxiMonitorInterface_rsideband_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 921, AxiMonitorInterface_rsideband_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 922, AxiMonitorInterface_rsideband_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 923, AxiMonitorInterface_rsideband_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 924, AxiMonitorInterface_rsideband_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 925, AxiMonitorInterface_rsideband_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 926, AxiMonitorInterface_rsideband_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 927, AxiMonitorInterface_rsideband_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 928, AxiMonitorInterface_rsideband_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 929, AxiMonitorInterface_rsideband_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 930, AxiMonitorInterface_rsideband_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 931, AxiMonitorInterface_wvalid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 932, AxiMonitorInterface_wvalid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 933, AxiMonitorInterface_wvalid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 934, AxiMonitorInterface_wvalid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 935, AxiMonitorInterface_wvalid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 936, AxiMonitorInterface_wvalid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 937, AxiMonitorInterface_wvalid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 938, AxiMonitorInterface_wvalid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 939, AxiMonitorInterface_wvalid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 940, AxiMonitorInterface_wvalid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 941, AxiMonitorInterface_wvalid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 942, AxiMonitorInterface_wvalid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 943, AxiMonitorInterface_wvalid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 944, AxiMonitorInterface_wvalid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 945, AxiMonitorInterface_wvalid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 946, AxiMonitorInterface_wvalid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 947, AxiMonitorInterface_wvalid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 948, AxiMonitorInterface_wvalid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 949, AxiMonitorInterface_wvalid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 950, AxiMonitorInterface_wvalid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 951, AxiMonitorInterface_wvalid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 952, AxiMonitorInterface_wvalid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 953, AxiMonitorInterface_wvalid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 954, AxiMonitorInterface_wvalid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 955, AxiMonitorInterface_wvalid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 956, AxiMonitorInterface_wvalid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 957, AxiMonitorInterface_wvalid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 958, AxiMonitorInterface_wvalid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 959, AxiMonitorInterface_wvalid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 960, AxiMonitorInterface_wvalid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 961, AxiMonitorInterface_wvalid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 962, AxiMonitorInterface_wvalid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 963, AxiMonitorInterface_wlast_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 964, AxiMonitorInterface_wlast_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 965, AxiMonitorInterface_wlast_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 966, AxiMonitorInterface_wlast_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 967, AxiMonitorInterface_wlast_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 968, AxiMonitorInterface_wlast_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 969, AxiMonitorInterface_wlast_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 970, AxiMonitorInterface_wlast_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 971, AxiMonitorInterface_wlast_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 972, AxiMonitorInterface_wlast_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 973, AxiMonitorInterface_wlast_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 974, AxiMonitorInterface_wlast_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 975, AxiMonitorInterface_wlast_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 976, AxiMonitorInterface_wlast_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 977, AxiMonitorInterface_wlast_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 978, AxiMonitorInterface_wlast_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 979, AxiMonitorInterface_wlast_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 980, AxiMonitorInterface_wlast_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 981, AxiMonitorInterface_wlast_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 982, AxiMonitorInterface_wlast_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 983, AxiMonitorInterface_wlast_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 984, AxiMonitorInterface_wlast_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 985, AxiMonitorInterface_wlast_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 986, AxiMonitorInterface_wlast_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 987, AxiMonitorInterface_wlast_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 988, AxiMonitorInterface_wlast_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 989, AxiMonitorInterface_wlast_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 990, AxiMonitorInterface_wlast_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 991, AxiMonitorInterface_wlast_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 992, AxiMonitorInterface_wlast_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 993, AxiMonitorInterface_wlast_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 994, AxiMonitorInterface_wlast_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 995, AxiMonitorInterface_wdata_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 996, AxiMonitorInterface_wdata_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 997, AxiMonitorInterface_wdata_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 998, AxiMonitorInterface_wdata_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 999, AxiMonitorInterface_wdata_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1000, AxiMonitorInterface_wdata_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1001, AxiMonitorInterface_wdata_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1002, AxiMonitorInterface_wdata_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1003, AxiMonitorInterface_wdata_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1004, AxiMonitorInterface_wdata_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1005, AxiMonitorInterface_wdata_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1006, AxiMonitorInterface_wdata_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1007, AxiMonitorInterface_wdata_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1008, AxiMonitorInterface_wdata_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1009, AxiMonitorInterface_wdata_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1010, AxiMonitorInterface_wdata_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1011, AxiMonitorInterface_wdata_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1012, AxiMonitorInterface_wdata_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1013, AxiMonitorInterface_wdata_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1014, AxiMonitorInterface_wdata_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1015, AxiMonitorInterface_wdata_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1016, AxiMonitorInterface_wdata_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1017, AxiMonitorInterface_wdata_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1018, AxiMonitorInterface_wdata_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1019, AxiMonitorInterface_wdata_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1020, AxiMonitorInterface_wdata_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1021, AxiMonitorInterface_wdata_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1022, AxiMonitorInterface_wdata_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1023, AxiMonitorInterface_wdata_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1024, AxiMonitorInterface_wdata_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1025, AxiMonitorInterface_wdata_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1026, AxiMonitorInterface_wdata_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1027, AxiMonitorInterface_wstrb_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1028, AxiMonitorInterface_wstrb_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1029, AxiMonitorInterface_wstrb_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1030, AxiMonitorInterface_wstrb_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1031, AxiMonitorInterface_wstrb_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1032, AxiMonitorInterface_wstrb_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1033, AxiMonitorInterface_wstrb_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1034, AxiMonitorInterface_wstrb_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1035, AxiMonitorInterface_wstrb_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1036, AxiMonitorInterface_wstrb_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1037, AxiMonitorInterface_wstrb_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1038, AxiMonitorInterface_wstrb_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1039, AxiMonitorInterface_wstrb_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1040, AxiMonitorInterface_wstrb_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1041, AxiMonitorInterface_wstrb_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1042, AxiMonitorInterface_wstrb_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1043, AxiMonitorInterface_wstrb_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1044, AxiMonitorInterface_wstrb_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1045, AxiMonitorInterface_wstrb_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1046, AxiMonitorInterface_wstrb_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1047, AxiMonitorInterface_wstrb_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1048, AxiMonitorInterface_wstrb_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1049, AxiMonitorInterface_wstrb_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1050, AxiMonitorInterface_wstrb_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1051, AxiMonitorInterface_wstrb_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1052, AxiMonitorInterface_wstrb_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1053, AxiMonitorInterface_wstrb_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1054, AxiMonitorInterface_wstrb_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1055, AxiMonitorInterface_wstrb_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1056, AxiMonitorInterface_wstrb_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1057, AxiMonitorInterface_wstrb_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1058, AxiMonitorInterface_wstrb_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1059, AxiMonitorInterface_wid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1060, AxiMonitorInterface_wid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1061, AxiMonitorInterface_wid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1062, AxiMonitorInterface_wid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1063, AxiMonitorInterface_wid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1064, AxiMonitorInterface_wid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1065, AxiMonitorInterface_wid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1066, AxiMonitorInterface_wid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1067, AxiMonitorInterface_wid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1068, AxiMonitorInterface_wid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1069, AxiMonitorInterface_wid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1070, AxiMonitorInterface_wid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1071, AxiMonitorInterface_wid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1072, AxiMonitorInterface_wid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1073, AxiMonitorInterface_wid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1074, AxiMonitorInterface_wid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1075, AxiMonitorInterface_wid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1076, AxiMonitorInterface_wid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1077, AxiMonitorInterface_wid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1078, AxiMonitorInterface_wid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1079, AxiMonitorInterface_wid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1080, AxiMonitorInterface_wid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1081, AxiMonitorInterface_wid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1082, AxiMonitorInterface_wid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1083, AxiMonitorInterface_wid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1084, AxiMonitorInterface_wid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1085, AxiMonitorInterface_wid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1086, AxiMonitorInterface_wid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1087, AxiMonitorInterface_wid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1088, AxiMonitorInterface_wid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1089, AxiMonitorInterface_wid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1090, AxiMonitorInterface_wid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1091, AxiMonitorInterface_wready_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1092, AxiMonitorInterface_wready_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1093, AxiMonitorInterface_wready_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1094, AxiMonitorInterface_wready_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1095, AxiMonitorInterface_wready_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1096, AxiMonitorInterface_wready_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1097, AxiMonitorInterface_wready_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1098, AxiMonitorInterface_wready_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1099, AxiMonitorInterface_wready_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1100, AxiMonitorInterface_wready_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1101, AxiMonitorInterface_wready_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1102, AxiMonitorInterface_wready_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1103, AxiMonitorInterface_wready_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1104, AxiMonitorInterface_wready_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1105, AxiMonitorInterface_wready_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1106, AxiMonitorInterface_wready_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1107, AxiMonitorInterface_wready_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1108, AxiMonitorInterface_wready_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1109, AxiMonitorInterface_wready_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1110, AxiMonitorInterface_wready_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1111, AxiMonitorInterface_wready_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1112, AxiMonitorInterface_wready_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1113, AxiMonitorInterface_wready_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1114, AxiMonitorInterface_wready_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1115, AxiMonitorInterface_wready_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1116, AxiMonitorInterface_wready_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1117, AxiMonitorInterface_wready_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1118, AxiMonitorInterface_wready_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1119, AxiMonitorInterface_wready_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1120, AxiMonitorInterface_wready_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1121, AxiMonitorInterface_wready_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1122, AxiMonitorInterface_wready_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1123, AxiMonitorInterface_wsideband_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1124, AxiMonitorInterface_wsideband_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1125, AxiMonitorInterface_wsideband_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1126, AxiMonitorInterface_wsideband_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1127, AxiMonitorInterface_wsideband_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1128, AxiMonitorInterface_wsideband_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1129, AxiMonitorInterface_wsideband_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1130, AxiMonitorInterface_wsideband_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1131, AxiMonitorInterface_wsideband_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1132, AxiMonitorInterface_wsideband_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1133, AxiMonitorInterface_wsideband_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1134, AxiMonitorInterface_wsideband_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1135, AxiMonitorInterface_wsideband_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1136, AxiMonitorInterface_wsideband_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1137, AxiMonitorInterface_wsideband_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1138, AxiMonitorInterface_wsideband_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1139, AxiMonitorInterface_wsideband_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1140, AxiMonitorInterface_wsideband_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1141, AxiMonitorInterface_wsideband_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1142, AxiMonitorInterface_wsideband_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1143, AxiMonitorInterface_wsideband_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1144, AxiMonitorInterface_wsideband_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1145, AxiMonitorInterface_wsideband_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1146, AxiMonitorInterface_wsideband_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1147, AxiMonitorInterface_wsideband_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1148, AxiMonitorInterface_wsideband_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1149, AxiMonitorInterface_wsideband_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1150, AxiMonitorInterface_wsideband_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1151, AxiMonitorInterface_wsideband_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1152, AxiMonitorInterface_wsideband_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1153, AxiMonitorInterface_wsideband_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1154, AxiMonitorInterface_wsideband_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1155, AxiMonitorInterface_bvalid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1156, AxiMonitorInterface_bvalid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1157, AxiMonitorInterface_bvalid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1158, AxiMonitorInterface_bvalid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1159, AxiMonitorInterface_bvalid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1160, AxiMonitorInterface_bvalid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1161, AxiMonitorInterface_bvalid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1162, AxiMonitorInterface_bvalid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1163, AxiMonitorInterface_bvalid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1164, AxiMonitorInterface_bvalid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1165, AxiMonitorInterface_bvalid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1166, AxiMonitorInterface_bvalid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1167, AxiMonitorInterface_bvalid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1168, AxiMonitorInterface_bvalid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1169, AxiMonitorInterface_bvalid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1170, AxiMonitorInterface_bvalid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1171, AxiMonitorInterface_bvalid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1172, AxiMonitorInterface_bvalid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1173, AxiMonitorInterface_bvalid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1174, AxiMonitorInterface_bvalid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1175, AxiMonitorInterface_bvalid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1176, AxiMonitorInterface_bvalid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1177, AxiMonitorInterface_bvalid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1178, AxiMonitorInterface_bvalid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1179, AxiMonitorInterface_bvalid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1180, AxiMonitorInterface_bvalid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1181, AxiMonitorInterface_bvalid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1182, AxiMonitorInterface_bvalid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1183, AxiMonitorInterface_bvalid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1184, AxiMonitorInterface_bvalid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1185, AxiMonitorInterface_bvalid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1186, AxiMonitorInterface_bvalid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1187, AxiMonitorInterface_bresp_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1188, AxiMonitorInterface_bresp_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1189, AxiMonitorInterface_bresp_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1190, AxiMonitorInterface_bresp_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1191, AxiMonitorInterface_bresp_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1192, AxiMonitorInterface_bresp_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1193, AxiMonitorInterface_bresp_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1194, AxiMonitorInterface_bresp_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1195, AxiMonitorInterface_bresp_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1196, AxiMonitorInterface_bresp_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1197, AxiMonitorInterface_bresp_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1198, AxiMonitorInterface_bresp_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1199, AxiMonitorInterface_bresp_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1200, AxiMonitorInterface_bresp_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1201, AxiMonitorInterface_bresp_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1202, AxiMonitorInterface_bresp_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1203, AxiMonitorInterface_bresp_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1204, AxiMonitorInterface_bresp_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1205, AxiMonitorInterface_bresp_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1206, AxiMonitorInterface_bresp_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1207, AxiMonitorInterface_bresp_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1208, AxiMonitorInterface_bresp_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1209, AxiMonitorInterface_bresp_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1210, AxiMonitorInterface_bresp_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1211, AxiMonitorInterface_bresp_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1212, AxiMonitorInterface_bresp_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1213, AxiMonitorInterface_bresp_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1214, AxiMonitorInterface_bresp_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1215, AxiMonitorInterface_bresp_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1216, AxiMonitorInterface_bresp_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1217, AxiMonitorInterface_bresp_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1218, AxiMonitorInterface_bresp_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1219, AxiMonitorInterface_bid_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1220, AxiMonitorInterface_bid_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1221, AxiMonitorInterface_bid_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1222, AxiMonitorInterface_bid_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1223, AxiMonitorInterface_bid_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1224, AxiMonitorInterface_bid_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1225, AxiMonitorInterface_bid_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1226, AxiMonitorInterface_bid_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1227, AxiMonitorInterface_bid_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1228, AxiMonitorInterface_bid_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1229, AxiMonitorInterface_bid_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1230, AxiMonitorInterface_bid_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1231, AxiMonitorInterface_bid_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1232, AxiMonitorInterface_bid_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1233, AxiMonitorInterface_bid_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1234, AxiMonitorInterface_bid_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1235, AxiMonitorInterface_bid_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1236, AxiMonitorInterface_bid_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1237, AxiMonitorInterface_bid_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1238, AxiMonitorInterface_bid_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1239, AxiMonitorInterface_bid_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1240, AxiMonitorInterface_bid_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1241, AxiMonitorInterface_bid_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1242, AxiMonitorInterface_bid_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1243, AxiMonitorInterface_bid_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1244, AxiMonitorInterface_bid_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1245, AxiMonitorInterface_bid_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1246, AxiMonitorInterface_bid_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1247, AxiMonitorInterface_bid_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1248, AxiMonitorInterface_bid_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1249, AxiMonitorInterface_bid_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1250, AxiMonitorInterface_bid_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1251, AxiMonitorInterface_bready_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1252, AxiMonitorInterface_bready_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1253, AxiMonitorInterface_bready_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1254, AxiMonitorInterface_bready_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1255, AxiMonitorInterface_bready_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1256, AxiMonitorInterface_bready_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1257, AxiMonitorInterface_bready_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1258, AxiMonitorInterface_bready_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1259, AxiMonitorInterface_bready_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1260, AxiMonitorInterface_bready_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1261, AxiMonitorInterface_bready_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1262, AxiMonitorInterface_bready_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1263, AxiMonitorInterface_bready_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1264, AxiMonitorInterface_bready_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1265, AxiMonitorInterface_bready_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1266, AxiMonitorInterface_bready_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1267, AxiMonitorInterface_bready_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1268, AxiMonitorInterface_bready_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1269, AxiMonitorInterface_bready_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1270, AxiMonitorInterface_bready_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1271, AxiMonitorInterface_bready_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1272, AxiMonitorInterface_bready_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1273, AxiMonitorInterface_bready_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1274, AxiMonitorInterface_bready_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1275, AxiMonitorInterface_bready_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1276, AxiMonitorInterface_bready_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1277, AxiMonitorInterface_bready_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1278, AxiMonitorInterface_bready_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1279, AxiMonitorInterface_bready_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1280, AxiMonitorInterface_bready_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1281, AxiMonitorInterface_bready_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1282, AxiMonitorInterface_bready_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1283, AxiMonitorInterface_bsideband_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1284, AxiMonitorInterface_bsideband_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1285, AxiMonitorInterface_bsideband_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1286, AxiMonitorInterface_bsideband_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1287, AxiMonitorInterface_bsideband_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1288, AxiMonitorInterface_bsideband_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1289, AxiMonitorInterface_bsideband_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1290, AxiMonitorInterface_bsideband_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1291, AxiMonitorInterface_bsideband_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1292, AxiMonitorInterface_bsideband_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1293, AxiMonitorInterface_bsideband_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1294, AxiMonitorInterface_bsideband_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1295, AxiMonitorInterface_bsideband_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1296, AxiMonitorInterface_bsideband_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1297, AxiMonitorInterface_bsideband_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1298, AxiMonitorInterface_bsideband_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1299, AxiMonitorInterface_bsideband_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1300, AxiMonitorInterface_bsideband_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1301, AxiMonitorInterface_bsideband_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1302, AxiMonitorInterface_bsideband_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1303, AxiMonitorInterface_bsideband_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1304, AxiMonitorInterface_bsideband_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1305, AxiMonitorInterface_bsideband_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1306, AxiMonitorInterface_bsideband_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1307, AxiMonitorInterface_bsideband_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1308, AxiMonitorInterface_bsideband_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1309, AxiMonitorInterface_bsideband_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1310, AxiMonitorInterface_bsideband_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1311, AxiMonitorInterface_bsideband_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1312, AxiMonitorInterface_bsideband_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1313, AxiMonitorInterface_bsideband_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1314, AxiMonitorInterface_bsideband_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1315, AxiMonitorInterface_cactive_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1316, AxiMonitorInterface_cactive_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1317, AxiMonitorInterface_cactive_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1318, AxiMonitorInterface_cactive_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1319, AxiMonitorInterface_cactive_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1320, AxiMonitorInterface_cactive_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1321, AxiMonitorInterface_cactive_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1322, AxiMonitorInterface_cactive_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1323, AxiMonitorInterface_cactive_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1324, AxiMonitorInterface_cactive_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1325, AxiMonitorInterface_cactive_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1326, AxiMonitorInterface_cactive_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1327, AxiMonitorInterface_cactive_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1328, AxiMonitorInterface_cactive_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1329, AxiMonitorInterface_cactive_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1330, AxiMonitorInterface_cactive_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1331, AxiMonitorInterface_cactive_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1332, AxiMonitorInterface_cactive_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1333, AxiMonitorInterface_cactive_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1334, AxiMonitorInterface_cactive_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1335, AxiMonitorInterface_cactive_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1336, AxiMonitorInterface_cactive_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1337, AxiMonitorInterface_cactive_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1338, AxiMonitorInterface_cactive_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1339, AxiMonitorInterface_cactive_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1340, AxiMonitorInterface_cactive_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1341, AxiMonitorInterface_cactive_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1342, AxiMonitorInterface_cactive_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1343, AxiMonitorInterface_cactive_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1344, AxiMonitorInterface_cactive_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1345, AxiMonitorInterface_cactive_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1346, AxiMonitorInterface_cactive_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1347, AxiMonitorInterface_csysreq_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1348, AxiMonitorInterface_csysreq_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1349, AxiMonitorInterface_csysreq_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1350, AxiMonitorInterface_csysreq_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1351, AxiMonitorInterface_csysreq_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1352, AxiMonitorInterface_csysreq_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1353, AxiMonitorInterface_csysreq_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1354, AxiMonitorInterface_csysreq_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1355, AxiMonitorInterface_csysreq_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1356, AxiMonitorInterface_csysreq_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1357, AxiMonitorInterface_csysreq_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1358, AxiMonitorInterface_csysreq_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1359, AxiMonitorInterface_csysreq_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1360, AxiMonitorInterface_csysreq_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1361, AxiMonitorInterface_csysreq_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1362, AxiMonitorInterface_csysreq_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1363, AxiMonitorInterface_csysreq_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1364, AxiMonitorInterface_csysreq_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1365, AxiMonitorInterface_csysreq_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1366, AxiMonitorInterface_csysreq_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1367, AxiMonitorInterface_csysreq_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1368, AxiMonitorInterface_csysreq_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1369, AxiMonitorInterface_csysreq_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1370, AxiMonitorInterface_csysreq_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1371, AxiMonitorInterface_csysreq_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1372, AxiMonitorInterface_csysreq_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1373, AxiMonitorInterface_csysreq_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1374, AxiMonitorInterface_csysreq_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1375, AxiMonitorInterface_csysreq_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1376, AxiMonitorInterface_csysreq_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1377, AxiMonitorInterface_csysreq_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1378, AxiMonitorInterface_csysreq_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1379, AxiMonitorInterface_csysack_m0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1380, AxiMonitorInterface_csysack_m1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1381, AxiMonitorInterface_csysack_m2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1382, AxiMonitorInterface_csysack_m3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1383, AxiMonitorInterface_csysack_m4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1384, AxiMonitorInterface_csysack_m5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1385, AxiMonitorInterface_csysack_m6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1386, AxiMonitorInterface_csysack_m7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1387, AxiMonitorInterface_csysack_m8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1388, AxiMonitorInterface_csysack_m9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1389, AxiMonitorInterface_csysack_m10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1390, AxiMonitorInterface_csysack_m11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1391, AxiMonitorInterface_csysack_m12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1392, AxiMonitorInterface_csysack_m13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1393, AxiMonitorInterface_csysack_m14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1394, AxiMonitorInterface_csysack_m15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1395, AxiMonitorInterface_csysack_m16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1396, AxiMonitorInterface_csysack_m17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1397, AxiMonitorInterface_csysack_m18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1398, AxiMonitorInterface_csysack_m19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1399, AxiMonitorInterface_csysack_m20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1400, AxiMonitorInterface_csysack_m21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1401, AxiMonitorInterface_csysack_m22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1402, AxiMonitorInterface_csysack_m23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1403, AxiMonitorInterface_csysack_m24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1404, AxiMonitorInterface_csysack_m25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1405, AxiMonitorInterface_csysack_m26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1406, AxiMonitorInterface_csysack_m27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1407, AxiMonitorInterface_csysack_m28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1408, AxiMonitorInterface_csysack_m29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1409, AxiMonitorInterface_csysack_m30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1410, AxiMonitorInterface_csysack_m31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1411, AxiMonitorInterface_arvalid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1412, AxiMonitorInterface_arvalid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1413, AxiMonitorInterface_arvalid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1414, AxiMonitorInterface_arvalid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1415, AxiMonitorInterface_arvalid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1416, AxiMonitorInterface_arvalid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1417, AxiMonitorInterface_arvalid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1418, AxiMonitorInterface_arvalid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1419, AxiMonitorInterface_arvalid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1420, AxiMonitorInterface_arvalid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1421, AxiMonitorInterface_arvalid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1422, AxiMonitorInterface_arvalid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1423, AxiMonitorInterface_arvalid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1424, AxiMonitorInterface_arvalid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1425, AxiMonitorInterface_arvalid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1426, AxiMonitorInterface_arvalid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1427, AxiMonitorInterface_arvalid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1428, AxiMonitorInterface_arvalid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1429, AxiMonitorInterface_arvalid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1430, AxiMonitorInterface_arvalid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1431, AxiMonitorInterface_arvalid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1432, AxiMonitorInterface_arvalid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1433, AxiMonitorInterface_arvalid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1434, AxiMonitorInterface_arvalid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1435, AxiMonitorInterface_arvalid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1436, AxiMonitorInterface_arvalid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1437, AxiMonitorInterface_arvalid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1438, AxiMonitorInterface_arvalid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1439, AxiMonitorInterface_arvalid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1440, AxiMonitorInterface_arvalid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1441, AxiMonitorInterface_arvalid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1442, AxiMonitorInterface_arvalid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1443, AxiMonitorInterface_araddr_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1444, AxiMonitorInterface_araddr_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1445, AxiMonitorInterface_araddr_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1446, AxiMonitorInterface_araddr_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1447, AxiMonitorInterface_araddr_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1448, AxiMonitorInterface_araddr_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1449, AxiMonitorInterface_araddr_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1450, AxiMonitorInterface_araddr_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1451, AxiMonitorInterface_araddr_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1452, AxiMonitorInterface_araddr_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1453, AxiMonitorInterface_araddr_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1454, AxiMonitorInterface_araddr_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1455, AxiMonitorInterface_araddr_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1456, AxiMonitorInterface_araddr_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1457, AxiMonitorInterface_araddr_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1458, AxiMonitorInterface_araddr_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1459, AxiMonitorInterface_araddr_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1460, AxiMonitorInterface_araddr_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1461, AxiMonitorInterface_araddr_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1462, AxiMonitorInterface_araddr_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1463, AxiMonitorInterface_araddr_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1464, AxiMonitorInterface_araddr_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1465, AxiMonitorInterface_araddr_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1466, AxiMonitorInterface_araddr_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1467, AxiMonitorInterface_araddr_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1468, AxiMonitorInterface_araddr_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1469, AxiMonitorInterface_araddr_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1470, AxiMonitorInterface_araddr_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1471, AxiMonitorInterface_araddr_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1472, AxiMonitorInterface_araddr_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1473, AxiMonitorInterface_araddr_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1474, AxiMonitorInterface_araddr_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1475, AxiMonitorInterface_arlen_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1476, AxiMonitorInterface_arlen_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1477, AxiMonitorInterface_arlen_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1478, AxiMonitorInterface_arlen_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1479, AxiMonitorInterface_arlen_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1480, AxiMonitorInterface_arlen_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1481, AxiMonitorInterface_arlen_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1482, AxiMonitorInterface_arlen_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1483, AxiMonitorInterface_arlen_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1484, AxiMonitorInterface_arlen_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1485, AxiMonitorInterface_arlen_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1486, AxiMonitorInterface_arlen_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1487, AxiMonitorInterface_arlen_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1488, AxiMonitorInterface_arlen_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1489, AxiMonitorInterface_arlen_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1490, AxiMonitorInterface_arlen_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1491, AxiMonitorInterface_arlen_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1492, AxiMonitorInterface_arlen_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1493, AxiMonitorInterface_arlen_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1494, AxiMonitorInterface_arlen_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1495, AxiMonitorInterface_arlen_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1496, AxiMonitorInterface_arlen_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1497, AxiMonitorInterface_arlen_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1498, AxiMonitorInterface_arlen_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1499, AxiMonitorInterface_arlen_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1500, AxiMonitorInterface_arlen_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1501, AxiMonitorInterface_arlen_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1502, AxiMonitorInterface_arlen_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1503, AxiMonitorInterface_arlen_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1504, AxiMonitorInterface_arlen_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1505, AxiMonitorInterface_arlen_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1506, AxiMonitorInterface_arlen_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1507, AxiMonitorInterface_arsize_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1508, AxiMonitorInterface_arsize_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1509, AxiMonitorInterface_arsize_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1510, AxiMonitorInterface_arsize_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1511, AxiMonitorInterface_arsize_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1512, AxiMonitorInterface_arsize_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1513, AxiMonitorInterface_arsize_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1514, AxiMonitorInterface_arsize_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1515, AxiMonitorInterface_arsize_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1516, AxiMonitorInterface_arsize_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1517, AxiMonitorInterface_arsize_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1518, AxiMonitorInterface_arsize_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1519, AxiMonitorInterface_arsize_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1520, AxiMonitorInterface_arsize_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1521, AxiMonitorInterface_arsize_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1522, AxiMonitorInterface_arsize_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1523, AxiMonitorInterface_arsize_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1524, AxiMonitorInterface_arsize_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1525, AxiMonitorInterface_arsize_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1526, AxiMonitorInterface_arsize_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1527, AxiMonitorInterface_arsize_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1528, AxiMonitorInterface_arsize_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1529, AxiMonitorInterface_arsize_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1530, AxiMonitorInterface_arsize_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1531, AxiMonitorInterface_arsize_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1532, AxiMonitorInterface_arsize_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1533, AxiMonitorInterface_arsize_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1534, AxiMonitorInterface_arsize_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1535, AxiMonitorInterface_arsize_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1536, AxiMonitorInterface_arsize_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1537, AxiMonitorInterface_arsize_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1538, AxiMonitorInterface_arsize_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1539, AxiMonitorInterface_arburst_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1540, AxiMonitorInterface_arburst_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1541, AxiMonitorInterface_arburst_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1542, AxiMonitorInterface_arburst_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1543, AxiMonitorInterface_arburst_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1544, AxiMonitorInterface_arburst_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1545, AxiMonitorInterface_arburst_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1546, AxiMonitorInterface_arburst_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1547, AxiMonitorInterface_arburst_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1548, AxiMonitorInterface_arburst_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1549, AxiMonitorInterface_arburst_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1550, AxiMonitorInterface_arburst_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1551, AxiMonitorInterface_arburst_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1552, AxiMonitorInterface_arburst_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1553, AxiMonitorInterface_arburst_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1554, AxiMonitorInterface_arburst_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1555, AxiMonitorInterface_arburst_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1556, AxiMonitorInterface_arburst_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1557, AxiMonitorInterface_arburst_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1558, AxiMonitorInterface_arburst_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1559, AxiMonitorInterface_arburst_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1560, AxiMonitorInterface_arburst_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1561, AxiMonitorInterface_arburst_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1562, AxiMonitorInterface_arburst_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1563, AxiMonitorInterface_arburst_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1564, AxiMonitorInterface_arburst_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1565, AxiMonitorInterface_arburst_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1566, AxiMonitorInterface_arburst_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1567, AxiMonitorInterface_arburst_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1568, AxiMonitorInterface_arburst_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1569, AxiMonitorInterface_arburst_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1570, AxiMonitorInterface_arburst_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1571, AxiMonitorInterface_arlock_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1572, AxiMonitorInterface_arlock_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1573, AxiMonitorInterface_arlock_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1574, AxiMonitorInterface_arlock_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1575, AxiMonitorInterface_arlock_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1576, AxiMonitorInterface_arlock_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1577, AxiMonitorInterface_arlock_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1578, AxiMonitorInterface_arlock_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1579, AxiMonitorInterface_arlock_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1580, AxiMonitorInterface_arlock_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1581, AxiMonitorInterface_arlock_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1582, AxiMonitorInterface_arlock_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1583, AxiMonitorInterface_arlock_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1584, AxiMonitorInterface_arlock_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1585, AxiMonitorInterface_arlock_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1586, AxiMonitorInterface_arlock_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1587, AxiMonitorInterface_arlock_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1588, AxiMonitorInterface_arlock_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1589, AxiMonitorInterface_arlock_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1590, AxiMonitorInterface_arlock_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1591, AxiMonitorInterface_arlock_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1592, AxiMonitorInterface_arlock_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1593, AxiMonitorInterface_arlock_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1594, AxiMonitorInterface_arlock_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1595, AxiMonitorInterface_arlock_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1596, AxiMonitorInterface_arlock_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1597, AxiMonitorInterface_arlock_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1598, AxiMonitorInterface_arlock_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1599, AxiMonitorInterface_arlock_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1600, AxiMonitorInterface_arlock_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1601, AxiMonitorInterface_arlock_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1602, AxiMonitorInterface_arlock_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1603, AxiMonitorInterface_arcache_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1604, AxiMonitorInterface_arcache_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1605, AxiMonitorInterface_arcache_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1606, AxiMonitorInterface_arcache_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1607, AxiMonitorInterface_arcache_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1608, AxiMonitorInterface_arcache_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1609, AxiMonitorInterface_arcache_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1610, AxiMonitorInterface_arcache_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1611, AxiMonitorInterface_arcache_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1612, AxiMonitorInterface_arcache_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1613, AxiMonitorInterface_arcache_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1614, AxiMonitorInterface_arcache_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1615, AxiMonitorInterface_arcache_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1616, AxiMonitorInterface_arcache_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1617, AxiMonitorInterface_arcache_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1618, AxiMonitorInterface_arcache_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1619, AxiMonitorInterface_arcache_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1620, AxiMonitorInterface_arcache_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1621, AxiMonitorInterface_arcache_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1622, AxiMonitorInterface_arcache_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1623, AxiMonitorInterface_arcache_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1624, AxiMonitorInterface_arcache_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1625, AxiMonitorInterface_arcache_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1626, AxiMonitorInterface_arcache_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1627, AxiMonitorInterface_arcache_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1628, AxiMonitorInterface_arcache_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1629, AxiMonitorInterface_arcache_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1630, AxiMonitorInterface_arcache_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1631, AxiMonitorInterface_arcache_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1632, AxiMonitorInterface_arcache_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1633, AxiMonitorInterface_arcache_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1634, AxiMonitorInterface_arcache_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1635, AxiMonitorInterface_arprot_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1636, AxiMonitorInterface_arprot_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1637, AxiMonitorInterface_arprot_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1638, AxiMonitorInterface_arprot_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1639, AxiMonitorInterface_arprot_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1640, AxiMonitorInterface_arprot_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1641, AxiMonitorInterface_arprot_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1642, AxiMonitorInterface_arprot_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1643, AxiMonitorInterface_arprot_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1644, AxiMonitorInterface_arprot_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1645, AxiMonitorInterface_arprot_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1646, AxiMonitorInterface_arprot_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1647, AxiMonitorInterface_arprot_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1648, AxiMonitorInterface_arprot_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1649, AxiMonitorInterface_arprot_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1650, AxiMonitorInterface_arprot_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1651, AxiMonitorInterface_arprot_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1652, AxiMonitorInterface_arprot_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1653, AxiMonitorInterface_arprot_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1654, AxiMonitorInterface_arprot_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1655, AxiMonitorInterface_arprot_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1656, AxiMonitorInterface_arprot_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1657, AxiMonitorInterface_arprot_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1658, AxiMonitorInterface_arprot_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1659, AxiMonitorInterface_arprot_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1660, AxiMonitorInterface_arprot_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1661, AxiMonitorInterface_arprot_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1662, AxiMonitorInterface_arprot_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1663, AxiMonitorInterface_arprot_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1664, AxiMonitorInterface_arprot_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1665, AxiMonitorInterface_arprot_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1666, AxiMonitorInterface_arprot_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1667, AxiMonitorInterface_arid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1668, AxiMonitorInterface_arid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1669, AxiMonitorInterface_arid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1670, AxiMonitorInterface_arid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1671, AxiMonitorInterface_arid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1672, AxiMonitorInterface_arid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1673, AxiMonitorInterface_arid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1674, AxiMonitorInterface_arid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1675, AxiMonitorInterface_arid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1676, AxiMonitorInterface_arid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1677, AxiMonitorInterface_arid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1678, AxiMonitorInterface_arid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1679, AxiMonitorInterface_arid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1680, AxiMonitorInterface_arid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1681, AxiMonitorInterface_arid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1682, AxiMonitorInterface_arid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1683, AxiMonitorInterface_arid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1684, AxiMonitorInterface_arid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1685, AxiMonitorInterface_arid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1686, AxiMonitorInterface_arid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1687, AxiMonitorInterface_arid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1688, AxiMonitorInterface_arid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1689, AxiMonitorInterface_arid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1690, AxiMonitorInterface_arid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1691, AxiMonitorInterface_arid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1692, AxiMonitorInterface_arid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1693, AxiMonitorInterface_arid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1694, AxiMonitorInterface_arid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1695, AxiMonitorInterface_arid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1696, AxiMonitorInterface_arid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1697, AxiMonitorInterface_arid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1698, AxiMonitorInterface_arid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1699, AxiMonitorInterface_arready_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1700, AxiMonitorInterface_arready_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1701, AxiMonitorInterface_arready_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1702, AxiMonitorInterface_arready_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1703, AxiMonitorInterface_arready_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1704, AxiMonitorInterface_arready_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1705, AxiMonitorInterface_arready_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1706, AxiMonitorInterface_arready_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1707, AxiMonitorInterface_arready_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1708, AxiMonitorInterface_arready_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1709, AxiMonitorInterface_arready_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1710, AxiMonitorInterface_arready_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1711, AxiMonitorInterface_arready_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1712, AxiMonitorInterface_arready_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1713, AxiMonitorInterface_arready_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1714, AxiMonitorInterface_arready_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1715, AxiMonitorInterface_arready_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1716, AxiMonitorInterface_arready_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1717, AxiMonitorInterface_arready_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1718, AxiMonitorInterface_arready_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1719, AxiMonitorInterface_arready_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1720, AxiMonitorInterface_arready_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1721, AxiMonitorInterface_arready_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1722, AxiMonitorInterface_arready_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1723, AxiMonitorInterface_arready_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1724, AxiMonitorInterface_arready_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1725, AxiMonitorInterface_arready_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1726, AxiMonitorInterface_arready_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1727, AxiMonitorInterface_arready_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1728, AxiMonitorInterface_arready_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1729, AxiMonitorInterface_arready_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1730, AxiMonitorInterface_arready_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1731, AxiMonitorInterface_arsideband_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1732, AxiMonitorInterface_arsideband_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1733, AxiMonitorInterface_arsideband_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1734, AxiMonitorInterface_arsideband_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1735, AxiMonitorInterface_arsideband_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1736, AxiMonitorInterface_arsideband_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1737, AxiMonitorInterface_arsideband_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1738, AxiMonitorInterface_arsideband_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1739, AxiMonitorInterface_arsideband_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1740, AxiMonitorInterface_arsideband_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1741, AxiMonitorInterface_arsideband_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1742, AxiMonitorInterface_arsideband_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1743, AxiMonitorInterface_arsideband_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1744, AxiMonitorInterface_arsideband_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1745, AxiMonitorInterface_arsideband_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1746, AxiMonitorInterface_arsideband_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1747, AxiMonitorInterface_arsideband_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1748, AxiMonitorInterface_arsideband_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1749, AxiMonitorInterface_arsideband_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1750, AxiMonitorInterface_arsideband_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1751, AxiMonitorInterface_arsideband_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1752, AxiMonitorInterface_arsideband_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1753, AxiMonitorInterface_arsideband_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1754, AxiMonitorInterface_arsideband_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1755, AxiMonitorInterface_arsideband_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1756, AxiMonitorInterface_arsideband_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1757, AxiMonitorInterface_arsideband_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1758, AxiMonitorInterface_arsideband_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1759, AxiMonitorInterface_arsideband_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1760, AxiMonitorInterface_arsideband_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1761, AxiMonitorInterface_arsideband_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1762, AxiMonitorInterface_arsideband_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1763, AxiMonitorInterface_awvalid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1764, AxiMonitorInterface_awvalid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1765, AxiMonitorInterface_awvalid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1766, AxiMonitorInterface_awvalid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1767, AxiMonitorInterface_awvalid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1768, AxiMonitorInterface_awvalid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1769, AxiMonitorInterface_awvalid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1770, AxiMonitorInterface_awvalid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1771, AxiMonitorInterface_awvalid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1772, AxiMonitorInterface_awvalid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1773, AxiMonitorInterface_awvalid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1774, AxiMonitorInterface_awvalid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1775, AxiMonitorInterface_awvalid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1776, AxiMonitorInterface_awvalid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1777, AxiMonitorInterface_awvalid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1778, AxiMonitorInterface_awvalid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1779, AxiMonitorInterface_awvalid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1780, AxiMonitorInterface_awvalid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1781, AxiMonitorInterface_awvalid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1782, AxiMonitorInterface_awvalid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1783, AxiMonitorInterface_awvalid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1784, AxiMonitorInterface_awvalid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1785, AxiMonitorInterface_awvalid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1786, AxiMonitorInterface_awvalid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1787, AxiMonitorInterface_awvalid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1788, AxiMonitorInterface_awvalid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1789, AxiMonitorInterface_awvalid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1790, AxiMonitorInterface_awvalid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1791, AxiMonitorInterface_awvalid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1792, AxiMonitorInterface_awvalid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1793, AxiMonitorInterface_awvalid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1794, AxiMonitorInterface_awvalid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1795, AxiMonitorInterface_awaddr_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1796, AxiMonitorInterface_awaddr_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1797, AxiMonitorInterface_awaddr_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1798, AxiMonitorInterface_awaddr_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1799, AxiMonitorInterface_awaddr_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1800, AxiMonitorInterface_awaddr_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1801, AxiMonitorInterface_awaddr_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1802, AxiMonitorInterface_awaddr_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1803, AxiMonitorInterface_awaddr_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1804, AxiMonitorInterface_awaddr_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1805, AxiMonitorInterface_awaddr_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1806, AxiMonitorInterface_awaddr_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1807, AxiMonitorInterface_awaddr_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1808, AxiMonitorInterface_awaddr_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1809, AxiMonitorInterface_awaddr_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1810, AxiMonitorInterface_awaddr_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1811, AxiMonitorInterface_awaddr_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1812, AxiMonitorInterface_awaddr_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1813, AxiMonitorInterface_awaddr_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1814, AxiMonitorInterface_awaddr_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1815, AxiMonitorInterface_awaddr_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1816, AxiMonitorInterface_awaddr_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1817, AxiMonitorInterface_awaddr_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1818, AxiMonitorInterface_awaddr_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1819, AxiMonitorInterface_awaddr_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1820, AxiMonitorInterface_awaddr_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1821, AxiMonitorInterface_awaddr_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1822, AxiMonitorInterface_awaddr_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1823, AxiMonitorInterface_awaddr_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1824, AxiMonitorInterface_awaddr_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1825, AxiMonitorInterface_awaddr_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1826, AxiMonitorInterface_awaddr_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1827, AxiMonitorInterface_awlen_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1828, AxiMonitorInterface_awlen_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1829, AxiMonitorInterface_awlen_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1830, AxiMonitorInterface_awlen_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1831, AxiMonitorInterface_awlen_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1832, AxiMonitorInterface_awlen_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1833, AxiMonitorInterface_awlen_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1834, AxiMonitorInterface_awlen_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1835, AxiMonitorInterface_awlen_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1836, AxiMonitorInterface_awlen_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1837, AxiMonitorInterface_awlen_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1838, AxiMonitorInterface_awlen_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1839, AxiMonitorInterface_awlen_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1840, AxiMonitorInterface_awlen_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1841, AxiMonitorInterface_awlen_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1842, AxiMonitorInterface_awlen_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1843, AxiMonitorInterface_awlen_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1844, AxiMonitorInterface_awlen_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1845, AxiMonitorInterface_awlen_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1846, AxiMonitorInterface_awlen_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1847, AxiMonitorInterface_awlen_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1848, AxiMonitorInterface_awlen_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1849, AxiMonitorInterface_awlen_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1850, AxiMonitorInterface_awlen_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1851, AxiMonitorInterface_awlen_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1852, AxiMonitorInterface_awlen_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1853, AxiMonitorInterface_awlen_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1854, AxiMonitorInterface_awlen_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1855, AxiMonitorInterface_awlen_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1856, AxiMonitorInterface_awlen_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1857, AxiMonitorInterface_awlen_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1858, AxiMonitorInterface_awlen_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1859, AxiMonitorInterface_awsize_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1860, AxiMonitorInterface_awsize_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1861, AxiMonitorInterface_awsize_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1862, AxiMonitorInterface_awsize_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1863, AxiMonitorInterface_awsize_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1864, AxiMonitorInterface_awsize_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1865, AxiMonitorInterface_awsize_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1866, AxiMonitorInterface_awsize_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1867, AxiMonitorInterface_awsize_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1868, AxiMonitorInterface_awsize_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1869, AxiMonitorInterface_awsize_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1870, AxiMonitorInterface_awsize_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1871, AxiMonitorInterface_awsize_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1872, AxiMonitorInterface_awsize_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1873, AxiMonitorInterface_awsize_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1874, AxiMonitorInterface_awsize_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1875, AxiMonitorInterface_awsize_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1876, AxiMonitorInterface_awsize_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1877, AxiMonitorInterface_awsize_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1878, AxiMonitorInterface_awsize_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1879, AxiMonitorInterface_awsize_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1880, AxiMonitorInterface_awsize_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1881, AxiMonitorInterface_awsize_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1882, AxiMonitorInterface_awsize_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1883, AxiMonitorInterface_awsize_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1884, AxiMonitorInterface_awsize_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1885, AxiMonitorInterface_awsize_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1886, AxiMonitorInterface_awsize_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1887, AxiMonitorInterface_awsize_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1888, AxiMonitorInterface_awsize_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1889, AxiMonitorInterface_awsize_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1890, AxiMonitorInterface_awsize_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1891, AxiMonitorInterface_awburst_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1892, AxiMonitorInterface_awburst_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1893, AxiMonitorInterface_awburst_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1894, AxiMonitorInterface_awburst_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1895, AxiMonitorInterface_awburst_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1896, AxiMonitorInterface_awburst_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1897, AxiMonitorInterface_awburst_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1898, AxiMonitorInterface_awburst_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1899, AxiMonitorInterface_awburst_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1900, AxiMonitorInterface_awburst_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1901, AxiMonitorInterface_awburst_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1902, AxiMonitorInterface_awburst_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1903, AxiMonitorInterface_awburst_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1904, AxiMonitorInterface_awburst_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1905, AxiMonitorInterface_awburst_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1906, AxiMonitorInterface_awburst_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1907, AxiMonitorInterface_awburst_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1908, AxiMonitorInterface_awburst_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1909, AxiMonitorInterface_awburst_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1910, AxiMonitorInterface_awburst_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1911, AxiMonitorInterface_awburst_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1912, AxiMonitorInterface_awburst_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1913, AxiMonitorInterface_awburst_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1914, AxiMonitorInterface_awburst_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1915, AxiMonitorInterface_awburst_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1916, AxiMonitorInterface_awburst_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1917, AxiMonitorInterface_awburst_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1918, AxiMonitorInterface_awburst_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1919, AxiMonitorInterface_awburst_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1920, AxiMonitorInterface_awburst_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1921, AxiMonitorInterface_awburst_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1922, AxiMonitorInterface_awburst_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1923, AxiMonitorInterface_awlock_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1924, AxiMonitorInterface_awlock_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1925, AxiMonitorInterface_awlock_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1926, AxiMonitorInterface_awlock_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1927, AxiMonitorInterface_awlock_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1928, AxiMonitorInterface_awlock_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1929, AxiMonitorInterface_awlock_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1930, AxiMonitorInterface_awlock_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1931, AxiMonitorInterface_awlock_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1932, AxiMonitorInterface_awlock_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1933, AxiMonitorInterface_awlock_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1934, AxiMonitorInterface_awlock_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1935, AxiMonitorInterface_awlock_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1936, AxiMonitorInterface_awlock_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1937, AxiMonitorInterface_awlock_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1938, AxiMonitorInterface_awlock_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1939, AxiMonitorInterface_awlock_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1940, AxiMonitorInterface_awlock_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1941, AxiMonitorInterface_awlock_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1942, AxiMonitorInterface_awlock_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1943, AxiMonitorInterface_awlock_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1944, AxiMonitorInterface_awlock_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1945, AxiMonitorInterface_awlock_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1946, AxiMonitorInterface_awlock_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1947, AxiMonitorInterface_awlock_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1948, AxiMonitorInterface_awlock_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1949, AxiMonitorInterface_awlock_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1950, AxiMonitorInterface_awlock_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1951, AxiMonitorInterface_awlock_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1952, AxiMonitorInterface_awlock_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1953, AxiMonitorInterface_awlock_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1954, AxiMonitorInterface_awlock_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1955, AxiMonitorInterface_awcache_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1956, AxiMonitorInterface_awcache_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1957, AxiMonitorInterface_awcache_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1958, AxiMonitorInterface_awcache_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1959, AxiMonitorInterface_awcache_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1960, AxiMonitorInterface_awcache_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1961, AxiMonitorInterface_awcache_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1962, AxiMonitorInterface_awcache_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1963, AxiMonitorInterface_awcache_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1964, AxiMonitorInterface_awcache_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1965, AxiMonitorInterface_awcache_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1966, AxiMonitorInterface_awcache_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1967, AxiMonitorInterface_awcache_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1968, AxiMonitorInterface_awcache_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1969, AxiMonitorInterface_awcache_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1970, AxiMonitorInterface_awcache_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1971, AxiMonitorInterface_awcache_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1972, AxiMonitorInterface_awcache_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1973, AxiMonitorInterface_awcache_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1974, AxiMonitorInterface_awcache_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1975, AxiMonitorInterface_awcache_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1976, AxiMonitorInterface_awcache_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1977, AxiMonitorInterface_awcache_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1978, AxiMonitorInterface_awcache_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1979, AxiMonitorInterface_awcache_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1980, AxiMonitorInterface_awcache_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1981, AxiMonitorInterface_awcache_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1982, AxiMonitorInterface_awcache_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1983, AxiMonitorInterface_awcache_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1984, AxiMonitorInterface_awcache_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1985, AxiMonitorInterface_awcache_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1986, AxiMonitorInterface_awcache_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1987, AxiMonitorInterface_awprot_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1988, AxiMonitorInterface_awprot_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1989, AxiMonitorInterface_awprot_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1990, AxiMonitorInterface_awprot_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1991, AxiMonitorInterface_awprot_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1992, AxiMonitorInterface_awprot_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1993, AxiMonitorInterface_awprot_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1994, AxiMonitorInterface_awprot_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1995, AxiMonitorInterface_awprot_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1996, AxiMonitorInterface_awprot_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1997, AxiMonitorInterface_awprot_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1998, AxiMonitorInterface_awprot_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1999, AxiMonitorInterface_awprot_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2000, AxiMonitorInterface_awprot_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2001, AxiMonitorInterface_awprot_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2002, AxiMonitorInterface_awprot_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2003, AxiMonitorInterface_awprot_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2004, AxiMonitorInterface_awprot_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2005, AxiMonitorInterface_awprot_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2006, AxiMonitorInterface_awprot_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2007, AxiMonitorInterface_awprot_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2008, AxiMonitorInterface_awprot_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2009, AxiMonitorInterface_awprot_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2010, AxiMonitorInterface_awprot_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2011, AxiMonitorInterface_awprot_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2012, AxiMonitorInterface_awprot_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2013, AxiMonitorInterface_awprot_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2014, AxiMonitorInterface_awprot_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2015, AxiMonitorInterface_awprot_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2016, AxiMonitorInterface_awprot_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2017, AxiMonitorInterface_awprot_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2018, AxiMonitorInterface_awprot_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2019, AxiMonitorInterface_awid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2020, AxiMonitorInterface_awid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2021, AxiMonitorInterface_awid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2022, AxiMonitorInterface_awid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2023, AxiMonitorInterface_awid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2024, AxiMonitorInterface_awid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2025, AxiMonitorInterface_awid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2026, AxiMonitorInterface_awid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2027, AxiMonitorInterface_awid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2028, AxiMonitorInterface_awid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2029, AxiMonitorInterface_awid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2030, AxiMonitorInterface_awid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2031, AxiMonitorInterface_awid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2032, AxiMonitorInterface_awid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2033, AxiMonitorInterface_awid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2034, AxiMonitorInterface_awid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2035, AxiMonitorInterface_awid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2036, AxiMonitorInterface_awid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2037, AxiMonitorInterface_awid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2038, AxiMonitorInterface_awid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2039, AxiMonitorInterface_awid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2040, AxiMonitorInterface_awid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2041, AxiMonitorInterface_awid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2042, AxiMonitorInterface_awid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2043, AxiMonitorInterface_awid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2044, AxiMonitorInterface_awid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2045, AxiMonitorInterface_awid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2046, AxiMonitorInterface_awid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2047, AxiMonitorInterface_awid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2048, AxiMonitorInterface_awid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2049, AxiMonitorInterface_awid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2050, AxiMonitorInterface_awid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2051, AxiMonitorInterface_awready_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2052, AxiMonitorInterface_awready_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2053, AxiMonitorInterface_awready_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2054, AxiMonitorInterface_awready_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2055, AxiMonitorInterface_awready_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2056, AxiMonitorInterface_awready_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2057, AxiMonitorInterface_awready_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2058, AxiMonitorInterface_awready_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2059, AxiMonitorInterface_awready_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2060, AxiMonitorInterface_awready_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2061, AxiMonitorInterface_awready_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2062, AxiMonitorInterface_awready_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2063, AxiMonitorInterface_awready_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2064, AxiMonitorInterface_awready_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2065, AxiMonitorInterface_awready_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2066, AxiMonitorInterface_awready_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2067, AxiMonitorInterface_awready_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2068, AxiMonitorInterface_awready_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2069, AxiMonitorInterface_awready_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2070, AxiMonitorInterface_awready_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2071, AxiMonitorInterface_awready_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2072, AxiMonitorInterface_awready_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2073, AxiMonitorInterface_awready_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2074, AxiMonitorInterface_awready_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2075, AxiMonitorInterface_awready_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2076, AxiMonitorInterface_awready_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2077, AxiMonitorInterface_awready_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2078, AxiMonitorInterface_awready_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2079, AxiMonitorInterface_awready_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2080, AxiMonitorInterface_awready_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2081, AxiMonitorInterface_awready_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2082, AxiMonitorInterface_awready_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2083, AxiMonitorInterface_awsideband_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2084, AxiMonitorInterface_awsideband_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2085, AxiMonitorInterface_awsideband_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2086, AxiMonitorInterface_awsideband_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2087, AxiMonitorInterface_awsideband_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2088, AxiMonitorInterface_awsideband_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2089, AxiMonitorInterface_awsideband_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2090, AxiMonitorInterface_awsideband_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2091, AxiMonitorInterface_awsideband_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2092, AxiMonitorInterface_awsideband_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2093, AxiMonitorInterface_awsideband_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2094, AxiMonitorInterface_awsideband_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2095, AxiMonitorInterface_awsideband_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2096, AxiMonitorInterface_awsideband_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2097, AxiMonitorInterface_awsideband_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2098, AxiMonitorInterface_awsideband_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2099, AxiMonitorInterface_awsideband_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2100, AxiMonitorInterface_awsideband_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2101, AxiMonitorInterface_awsideband_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2102, AxiMonitorInterface_awsideband_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2103, AxiMonitorInterface_awsideband_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2104, AxiMonitorInterface_awsideband_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2105, AxiMonitorInterface_awsideband_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2106, AxiMonitorInterface_awsideband_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2107, AxiMonitorInterface_awsideband_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2108, AxiMonitorInterface_awsideband_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2109, AxiMonitorInterface_awsideband_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2110, AxiMonitorInterface_awsideband_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2111, AxiMonitorInterface_awsideband_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2112, AxiMonitorInterface_awsideband_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2113, AxiMonitorInterface_awsideband_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2114, AxiMonitorInterface_awsideband_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2115, AxiMonitorInterface_rvalid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2116, AxiMonitorInterface_rvalid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2117, AxiMonitorInterface_rvalid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2118, AxiMonitorInterface_rvalid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2119, AxiMonitorInterface_rvalid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2120, AxiMonitorInterface_rvalid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2121, AxiMonitorInterface_rvalid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2122, AxiMonitorInterface_rvalid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2123, AxiMonitorInterface_rvalid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2124, AxiMonitorInterface_rvalid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2125, AxiMonitorInterface_rvalid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2126, AxiMonitorInterface_rvalid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2127, AxiMonitorInterface_rvalid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2128, AxiMonitorInterface_rvalid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2129, AxiMonitorInterface_rvalid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2130, AxiMonitorInterface_rvalid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2131, AxiMonitorInterface_rvalid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2132, AxiMonitorInterface_rvalid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2133, AxiMonitorInterface_rvalid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2134, AxiMonitorInterface_rvalid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2135, AxiMonitorInterface_rvalid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2136, AxiMonitorInterface_rvalid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2137, AxiMonitorInterface_rvalid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2138, AxiMonitorInterface_rvalid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2139, AxiMonitorInterface_rvalid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2140, AxiMonitorInterface_rvalid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2141, AxiMonitorInterface_rvalid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2142, AxiMonitorInterface_rvalid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2143, AxiMonitorInterface_rvalid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2144, AxiMonitorInterface_rvalid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2145, AxiMonitorInterface_rvalid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2146, AxiMonitorInterface_rvalid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2147, AxiMonitorInterface_rlast_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2148, AxiMonitorInterface_rlast_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2149, AxiMonitorInterface_rlast_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2150, AxiMonitorInterface_rlast_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2151, AxiMonitorInterface_rlast_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2152, AxiMonitorInterface_rlast_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2153, AxiMonitorInterface_rlast_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2154, AxiMonitorInterface_rlast_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2155, AxiMonitorInterface_rlast_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2156, AxiMonitorInterface_rlast_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2157, AxiMonitorInterface_rlast_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2158, AxiMonitorInterface_rlast_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2159, AxiMonitorInterface_rlast_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2160, AxiMonitorInterface_rlast_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2161, AxiMonitorInterface_rlast_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2162, AxiMonitorInterface_rlast_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2163, AxiMonitorInterface_rlast_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2164, AxiMonitorInterface_rlast_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2165, AxiMonitorInterface_rlast_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2166, AxiMonitorInterface_rlast_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2167, AxiMonitorInterface_rlast_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2168, AxiMonitorInterface_rlast_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2169, AxiMonitorInterface_rlast_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2170, AxiMonitorInterface_rlast_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2171, AxiMonitorInterface_rlast_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2172, AxiMonitorInterface_rlast_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2173, AxiMonitorInterface_rlast_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2174, AxiMonitorInterface_rlast_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2175, AxiMonitorInterface_rlast_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2176, AxiMonitorInterface_rlast_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2177, AxiMonitorInterface_rlast_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2178, AxiMonitorInterface_rlast_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2179, AxiMonitorInterface_rdata_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2180, AxiMonitorInterface_rdata_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2181, AxiMonitorInterface_rdata_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2182, AxiMonitorInterface_rdata_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2183, AxiMonitorInterface_rdata_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2184, AxiMonitorInterface_rdata_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2185, AxiMonitorInterface_rdata_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2186, AxiMonitorInterface_rdata_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2187, AxiMonitorInterface_rdata_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2188, AxiMonitorInterface_rdata_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2189, AxiMonitorInterface_rdata_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2190, AxiMonitorInterface_rdata_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2191, AxiMonitorInterface_rdata_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2192, AxiMonitorInterface_rdata_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2193, AxiMonitorInterface_rdata_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2194, AxiMonitorInterface_rdata_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2195, AxiMonitorInterface_rdata_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2196, AxiMonitorInterface_rdata_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2197, AxiMonitorInterface_rdata_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2198, AxiMonitorInterface_rdata_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2199, AxiMonitorInterface_rdata_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2200, AxiMonitorInterface_rdata_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2201, AxiMonitorInterface_rdata_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2202, AxiMonitorInterface_rdata_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2203, AxiMonitorInterface_rdata_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2204, AxiMonitorInterface_rdata_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2205, AxiMonitorInterface_rdata_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2206, AxiMonitorInterface_rdata_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2207, AxiMonitorInterface_rdata_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2208, AxiMonitorInterface_rdata_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2209, AxiMonitorInterface_rdata_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2210, AxiMonitorInterface_rdata_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2211, AxiMonitorInterface_rresp_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2212, AxiMonitorInterface_rresp_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2213, AxiMonitorInterface_rresp_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2214, AxiMonitorInterface_rresp_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2215, AxiMonitorInterface_rresp_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2216, AxiMonitorInterface_rresp_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2217, AxiMonitorInterface_rresp_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2218, AxiMonitorInterface_rresp_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2219, AxiMonitorInterface_rresp_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2220, AxiMonitorInterface_rresp_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2221, AxiMonitorInterface_rresp_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2222, AxiMonitorInterface_rresp_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2223, AxiMonitorInterface_rresp_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2224, AxiMonitorInterface_rresp_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2225, AxiMonitorInterface_rresp_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2226, AxiMonitorInterface_rresp_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2227, AxiMonitorInterface_rresp_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2228, AxiMonitorInterface_rresp_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2229, AxiMonitorInterface_rresp_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2230, AxiMonitorInterface_rresp_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2231, AxiMonitorInterface_rresp_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2232, AxiMonitorInterface_rresp_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2233, AxiMonitorInterface_rresp_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2234, AxiMonitorInterface_rresp_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2235, AxiMonitorInterface_rresp_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2236, AxiMonitorInterface_rresp_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2237, AxiMonitorInterface_rresp_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2238, AxiMonitorInterface_rresp_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2239, AxiMonitorInterface_rresp_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2240, AxiMonitorInterface_rresp_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2241, AxiMonitorInterface_rresp_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2242, AxiMonitorInterface_rresp_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2243, AxiMonitorInterface_rid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2244, AxiMonitorInterface_rid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2245, AxiMonitorInterface_rid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2246, AxiMonitorInterface_rid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2247, AxiMonitorInterface_rid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2248, AxiMonitorInterface_rid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2249, AxiMonitorInterface_rid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2250, AxiMonitorInterface_rid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2251, AxiMonitorInterface_rid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2252, AxiMonitorInterface_rid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2253, AxiMonitorInterface_rid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2254, AxiMonitorInterface_rid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2255, AxiMonitorInterface_rid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2256, AxiMonitorInterface_rid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2257, AxiMonitorInterface_rid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2258, AxiMonitorInterface_rid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2259, AxiMonitorInterface_rid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2260, AxiMonitorInterface_rid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2261, AxiMonitorInterface_rid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2262, AxiMonitorInterface_rid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2263, AxiMonitorInterface_rid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2264, AxiMonitorInterface_rid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2265, AxiMonitorInterface_rid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2266, AxiMonitorInterface_rid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2267, AxiMonitorInterface_rid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2268, AxiMonitorInterface_rid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2269, AxiMonitorInterface_rid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2270, AxiMonitorInterface_rid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2271, AxiMonitorInterface_rid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2272, AxiMonitorInterface_rid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2273, AxiMonitorInterface_rid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2274, AxiMonitorInterface_rid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2275, AxiMonitorInterface_rready_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2276, AxiMonitorInterface_rready_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2277, AxiMonitorInterface_rready_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2278, AxiMonitorInterface_rready_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2279, AxiMonitorInterface_rready_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2280, AxiMonitorInterface_rready_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2281, AxiMonitorInterface_rready_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2282, AxiMonitorInterface_rready_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2283, AxiMonitorInterface_rready_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2284, AxiMonitorInterface_rready_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2285, AxiMonitorInterface_rready_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2286, AxiMonitorInterface_rready_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2287, AxiMonitorInterface_rready_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2288, AxiMonitorInterface_rready_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2289, AxiMonitorInterface_rready_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2290, AxiMonitorInterface_rready_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2291, AxiMonitorInterface_rready_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2292, AxiMonitorInterface_rready_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2293, AxiMonitorInterface_rready_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2294, AxiMonitorInterface_rready_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2295, AxiMonitorInterface_rready_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2296, AxiMonitorInterface_rready_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2297, AxiMonitorInterface_rready_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2298, AxiMonitorInterface_rready_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2299, AxiMonitorInterface_rready_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2300, AxiMonitorInterface_rready_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2301, AxiMonitorInterface_rready_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2302, AxiMonitorInterface_rready_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2303, AxiMonitorInterface_rready_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2304, AxiMonitorInterface_rready_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2305, AxiMonitorInterface_rready_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2306, AxiMonitorInterface_rready_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2307, AxiMonitorInterface_rsideband_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2308, AxiMonitorInterface_rsideband_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2309, AxiMonitorInterface_rsideband_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2310, AxiMonitorInterface_rsideband_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2311, AxiMonitorInterface_rsideband_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2312, AxiMonitorInterface_rsideband_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2313, AxiMonitorInterface_rsideband_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2314, AxiMonitorInterface_rsideband_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2315, AxiMonitorInterface_rsideband_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2316, AxiMonitorInterface_rsideband_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2317, AxiMonitorInterface_rsideband_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2318, AxiMonitorInterface_rsideband_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2319, AxiMonitorInterface_rsideband_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2320, AxiMonitorInterface_rsideband_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2321, AxiMonitorInterface_rsideband_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2322, AxiMonitorInterface_rsideband_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2323, AxiMonitorInterface_rsideband_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2324, AxiMonitorInterface_rsideband_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2325, AxiMonitorInterface_rsideband_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2326, AxiMonitorInterface_rsideband_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2327, AxiMonitorInterface_rsideband_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2328, AxiMonitorInterface_rsideband_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2329, AxiMonitorInterface_rsideband_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2330, AxiMonitorInterface_rsideband_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2331, AxiMonitorInterface_rsideband_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2332, AxiMonitorInterface_rsideband_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2333, AxiMonitorInterface_rsideband_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2334, AxiMonitorInterface_rsideband_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2335, AxiMonitorInterface_rsideband_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2336, AxiMonitorInterface_rsideband_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2337, AxiMonitorInterface_rsideband_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2338, AxiMonitorInterface_rsideband_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2339, AxiMonitorInterface_wvalid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2340, AxiMonitorInterface_wvalid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2341, AxiMonitorInterface_wvalid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2342, AxiMonitorInterface_wvalid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2343, AxiMonitorInterface_wvalid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2344, AxiMonitorInterface_wvalid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2345, AxiMonitorInterface_wvalid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2346, AxiMonitorInterface_wvalid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2347, AxiMonitorInterface_wvalid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2348, AxiMonitorInterface_wvalid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2349, AxiMonitorInterface_wvalid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2350, AxiMonitorInterface_wvalid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2351, AxiMonitorInterface_wvalid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2352, AxiMonitorInterface_wvalid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2353, AxiMonitorInterface_wvalid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2354, AxiMonitorInterface_wvalid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2355, AxiMonitorInterface_wvalid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2356, AxiMonitorInterface_wvalid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2357, AxiMonitorInterface_wvalid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2358, AxiMonitorInterface_wvalid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2359, AxiMonitorInterface_wvalid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2360, AxiMonitorInterface_wvalid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2361, AxiMonitorInterface_wvalid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2362, AxiMonitorInterface_wvalid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2363, AxiMonitorInterface_wvalid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2364, AxiMonitorInterface_wvalid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2365, AxiMonitorInterface_wvalid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2366, AxiMonitorInterface_wvalid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2367, AxiMonitorInterface_wvalid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2368, AxiMonitorInterface_wvalid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2369, AxiMonitorInterface_wvalid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2370, AxiMonitorInterface_wvalid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2371, AxiMonitorInterface_wlast_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2372, AxiMonitorInterface_wlast_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2373, AxiMonitorInterface_wlast_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2374, AxiMonitorInterface_wlast_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2375, AxiMonitorInterface_wlast_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2376, AxiMonitorInterface_wlast_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2377, AxiMonitorInterface_wlast_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2378, AxiMonitorInterface_wlast_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2379, AxiMonitorInterface_wlast_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2380, AxiMonitorInterface_wlast_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2381, AxiMonitorInterface_wlast_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2382, AxiMonitorInterface_wlast_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2383, AxiMonitorInterface_wlast_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2384, AxiMonitorInterface_wlast_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2385, AxiMonitorInterface_wlast_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2386, AxiMonitorInterface_wlast_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2387, AxiMonitorInterface_wlast_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2388, AxiMonitorInterface_wlast_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2389, AxiMonitorInterface_wlast_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2390, AxiMonitorInterface_wlast_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2391, AxiMonitorInterface_wlast_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2392, AxiMonitorInterface_wlast_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2393, AxiMonitorInterface_wlast_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2394, AxiMonitorInterface_wlast_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2395, AxiMonitorInterface_wlast_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2396, AxiMonitorInterface_wlast_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2397, AxiMonitorInterface_wlast_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2398, AxiMonitorInterface_wlast_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2399, AxiMonitorInterface_wlast_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2400, AxiMonitorInterface_wlast_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2401, AxiMonitorInterface_wlast_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2402, AxiMonitorInterface_wlast_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2403, AxiMonitorInterface_wdata_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2404, AxiMonitorInterface_wdata_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2405, AxiMonitorInterface_wdata_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2406, AxiMonitorInterface_wdata_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2407, AxiMonitorInterface_wdata_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2408, AxiMonitorInterface_wdata_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2409, AxiMonitorInterface_wdata_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2410, AxiMonitorInterface_wdata_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2411, AxiMonitorInterface_wdata_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2412, AxiMonitorInterface_wdata_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2413, AxiMonitorInterface_wdata_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2414, AxiMonitorInterface_wdata_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2415, AxiMonitorInterface_wdata_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2416, AxiMonitorInterface_wdata_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2417, AxiMonitorInterface_wdata_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2418, AxiMonitorInterface_wdata_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2419, AxiMonitorInterface_wdata_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2420, AxiMonitorInterface_wdata_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2421, AxiMonitorInterface_wdata_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2422, AxiMonitorInterface_wdata_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2423, AxiMonitorInterface_wdata_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2424, AxiMonitorInterface_wdata_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2425, AxiMonitorInterface_wdata_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2426, AxiMonitorInterface_wdata_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2427, AxiMonitorInterface_wdata_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2428, AxiMonitorInterface_wdata_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2429, AxiMonitorInterface_wdata_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2430, AxiMonitorInterface_wdata_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2431, AxiMonitorInterface_wdata_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2432, AxiMonitorInterface_wdata_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2433, AxiMonitorInterface_wdata_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2434, AxiMonitorInterface_wdata_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2435, AxiMonitorInterface_wstrb_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2436, AxiMonitorInterface_wstrb_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2437, AxiMonitorInterface_wstrb_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2438, AxiMonitorInterface_wstrb_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2439, AxiMonitorInterface_wstrb_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2440, AxiMonitorInterface_wstrb_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2441, AxiMonitorInterface_wstrb_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2442, AxiMonitorInterface_wstrb_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2443, AxiMonitorInterface_wstrb_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2444, AxiMonitorInterface_wstrb_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2445, AxiMonitorInterface_wstrb_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2446, AxiMonitorInterface_wstrb_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2447, AxiMonitorInterface_wstrb_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2448, AxiMonitorInterface_wstrb_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2449, AxiMonitorInterface_wstrb_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2450, AxiMonitorInterface_wstrb_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2451, AxiMonitorInterface_wstrb_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2452, AxiMonitorInterface_wstrb_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2453, AxiMonitorInterface_wstrb_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2454, AxiMonitorInterface_wstrb_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2455, AxiMonitorInterface_wstrb_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2456, AxiMonitorInterface_wstrb_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2457, AxiMonitorInterface_wstrb_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2458, AxiMonitorInterface_wstrb_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2459, AxiMonitorInterface_wstrb_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2460, AxiMonitorInterface_wstrb_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2461, AxiMonitorInterface_wstrb_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2462, AxiMonitorInterface_wstrb_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2463, AxiMonitorInterface_wstrb_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2464, AxiMonitorInterface_wstrb_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2465, AxiMonitorInterface_wstrb_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2466, AxiMonitorInterface_wstrb_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2467, AxiMonitorInterface_wid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2468, AxiMonitorInterface_wid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2469, AxiMonitorInterface_wid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2470, AxiMonitorInterface_wid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2471, AxiMonitorInterface_wid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2472, AxiMonitorInterface_wid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2473, AxiMonitorInterface_wid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2474, AxiMonitorInterface_wid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2475, AxiMonitorInterface_wid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2476, AxiMonitorInterface_wid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2477, AxiMonitorInterface_wid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2478, AxiMonitorInterface_wid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2479, AxiMonitorInterface_wid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2480, AxiMonitorInterface_wid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2481, AxiMonitorInterface_wid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2482, AxiMonitorInterface_wid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2483, AxiMonitorInterface_wid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2484, AxiMonitorInterface_wid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2485, AxiMonitorInterface_wid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2486, AxiMonitorInterface_wid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2487, AxiMonitorInterface_wid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2488, AxiMonitorInterface_wid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2489, AxiMonitorInterface_wid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2490, AxiMonitorInterface_wid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2491, AxiMonitorInterface_wid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2492, AxiMonitorInterface_wid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2493, AxiMonitorInterface_wid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2494, AxiMonitorInterface_wid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2495, AxiMonitorInterface_wid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2496, AxiMonitorInterface_wid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2497, AxiMonitorInterface_wid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2498, AxiMonitorInterface_wid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2499, AxiMonitorInterface_wready_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2500, AxiMonitorInterface_wready_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2501, AxiMonitorInterface_wready_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2502, AxiMonitorInterface_wready_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2503, AxiMonitorInterface_wready_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2504, AxiMonitorInterface_wready_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2505, AxiMonitorInterface_wready_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2506, AxiMonitorInterface_wready_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2507, AxiMonitorInterface_wready_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2508, AxiMonitorInterface_wready_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2509, AxiMonitorInterface_wready_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2510, AxiMonitorInterface_wready_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2511, AxiMonitorInterface_wready_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2512, AxiMonitorInterface_wready_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2513, AxiMonitorInterface_wready_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2514, AxiMonitorInterface_wready_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2515, AxiMonitorInterface_wready_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2516, AxiMonitorInterface_wready_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2517, AxiMonitorInterface_wready_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2518, AxiMonitorInterface_wready_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2519, AxiMonitorInterface_wready_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2520, AxiMonitorInterface_wready_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2521, AxiMonitorInterface_wready_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2522, AxiMonitorInterface_wready_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2523, AxiMonitorInterface_wready_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2524, AxiMonitorInterface_wready_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2525, AxiMonitorInterface_wready_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2526, AxiMonitorInterface_wready_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2527, AxiMonitorInterface_wready_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2528, AxiMonitorInterface_wready_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2529, AxiMonitorInterface_wready_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2530, AxiMonitorInterface_wready_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2531, AxiMonitorInterface_wsideband_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2532, AxiMonitorInterface_wsideband_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2533, AxiMonitorInterface_wsideband_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2534, AxiMonitorInterface_wsideband_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2535, AxiMonitorInterface_wsideband_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2536, AxiMonitorInterface_wsideband_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2537, AxiMonitorInterface_wsideband_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2538, AxiMonitorInterface_wsideband_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2539, AxiMonitorInterface_wsideband_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2540, AxiMonitorInterface_wsideband_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2541, AxiMonitorInterface_wsideband_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2542, AxiMonitorInterface_wsideband_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2543, AxiMonitorInterface_wsideband_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2544, AxiMonitorInterface_wsideband_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2545, AxiMonitorInterface_wsideband_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2546, AxiMonitorInterface_wsideband_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2547, AxiMonitorInterface_wsideband_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2548, AxiMonitorInterface_wsideband_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2549, AxiMonitorInterface_wsideband_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2550, AxiMonitorInterface_wsideband_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2551, AxiMonitorInterface_wsideband_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2552, AxiMonitorInterface_wsideband_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2553, AxiMonitorInterface_wsideband_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2554, AxiMonitorInterface_wsideband_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2555, AxiMonitorInterface_wsideband_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2556, AxiMonitorInterface_wsideband_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2557, AxiMonitorInterface_wsideband_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2558, AxiMonitorInterface_wsideband_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2559, AxiMonitorInterface_wsideband_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2560, AxiMonitorInterface_wsideband_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2561, AxiMonitorInterface_wsideband_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2562, AxiMonitorInterface_wsideband_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2563, AxiMonitorInterface_bvalid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2564, AxiMonitorInterface_bvalid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2565, AxiMonitorInterface_bvalid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2566, AxiMonitorInterface_bvalid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2567, AxiMonitorInterface_bvalid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2568, AxiMonitorInterface_bvalid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2569, AxiMonitorInterface_bvalid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2570, AxiMonitorInterface_bvalid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2571, AxiMonitorInterface_bvalid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2572, AxiMonitorInterface_bvalid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2573, AxiMonitorInterface_bvalid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2574, AxiMonitorInterface_bvalid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2575, AxiMonitorInterface_bvalid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2576, AxiMonitorInterface_bvalid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2577, AxiMonitorInterface_bvalid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2578, AxiMonitorInterface_bvalid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2579, AxiMonitorInterface_bvalid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2580, AxiMonitorInterface_bvalid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2581, AxiMonitorInterface_bvalid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2582, AxiMonitorInterface_bvalid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2583, AxiMonitorInterface_bvalid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2584, AxiMonitorInterface_bvalid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2585, AxiMonitorInterface_bvalid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2586, AxiMonitorInterface_bvalid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2587, AxiMonitorInterface_bvalid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2588, AxiMonitorInterface_bvalid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2589, AxiMonitorInterface_bvalid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2590, AxiMonitorInterface_bvalid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2591, AxiMonitorInterface_bvalid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2592, AxiMonitorInterface_bvalid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2593, AxiMonitorInterface_bvalid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2594, AxiMonitorInterface_bvalid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2595, AxiMonitorInterface_bresp_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2596, AxiMonitorInterface_bresp_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2597, AxiMonitorInterface_bresp_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2598, AxiMonitorInterface_bresp_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2599, AxiMonitorInterface_bresp_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2600, AxiMonitorInterface_bresp_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2601, AxiMonitorInterface_bresp_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2602, AxiMonitorInterface_bresp_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2603, AxiMonitorInterface_bresp_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2604, AxiMonitorInterface_bresp_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2605, AxiMonitorInterface_bresp_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2606, AxiMonitorInterface_bresp_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2607, AxiMonitorInterface_bresp_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2608, AxiMonitorInterface_bresp_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2609, AxiMonitorInterface_bresp_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2610, AxiMonitorInterface_bresp_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2611, AxiMonitorInterface_bresp_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2612, AxiMonitorInterface_bresp_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2613, AxiMonitorInterface_bresp_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2614, AxiMonitorInterface_bresp_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2615, AxiMonitorInterface_bresp_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2616, AxiMonitorInterface_bresp_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2617, AxiMonitorInterface_bresp_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2618, AxiMonitorInterface_bresp_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2619, AxiMonitorInterface_bresp_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2620, AxiMonitorInterface_bresp_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2621, AxiMonitorInterface_bresp_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2622, AxiMonitorInterface_bresp_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2623, AxiMonitorInterface_bresp_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2624, AxiMonitorInterface_bresp_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2625, AxiMonitorInterface_bresp_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2626, AxiMonitorInterface_bresp_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2627, AxiMonitorInterface_bid_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2628, AxiMonitorInterface_bid_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2629, AxiMonitorInterface_bid_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2630, AxiMonitorInterface_bid_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2631, AxiMonitorInterface_bid_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2632, AxiMonitorInterface_bid_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2633, AxiMonitorInterface_bid_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2634, AxiMonitorInterface_bid_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2635, AxiMonitorInterface_bid_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2636, AxiMonitorInterface_bid_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2637, AxiMonitorInterface_bid_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2638, AxiMonitorInterface_bid_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2639, AxiMonitorInterface_bid_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2640, AxiMonitorInterface_bid_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2641, AxiMonitorInterface_bid_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2642, AxiMonitorInterface_bid_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2643, AxiMonitorInterface_bid_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2644, AxiMonitorInterface_bid_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2645, AxiMonitorInterface_bid_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2646, AxiMonitorInterface_bid_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2647, AxiMonitorInterface_bid_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2648, AxiMonitorInterface_bid_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2649, AxiMonitorInterface_bid_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2650, AxiMonitorInterface_bid_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2651, AxiMonitorInterface_bid_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2652, AxiMonitorInterface_bid_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2653, AxiMonitorInterface_bid_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2654, AxiMonitorInterface_bid_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2655, AxiMonitorInterface_bid_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2656, AxiMonitorInterface_bid_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2657, AxiMonitorInterface_bid_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2658, AxiMonitorInterface_bid_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2659, AxiMonitorInterface_bready_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2660, AxiMonitorInterface_bready_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2661, AxiMonitorInterface_bready_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2662, AxiMonitorInterface_bready_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2663, AxiMonitorInterface_bready_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2664, AxiMonitorInterface_bready_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2665, AxiMonitorInterface_bready_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2666, AxiMonitorInterface_bready_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2667, AxiMonitorInterface_bready_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2668, AxiMonitorInterface_bready_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2669, AxiMonitorInterface_bready_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2670, AxiMonitorInterface_bready_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2671, AxiMonitorInterface_bready_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2672, AxiMonitorInterface_bready_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2673, AxiMonitorInterface_bready_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2674, AxiMonitorInterface_bready_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2675, AxiMonitorInterface_bready_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2676, AxiMonitorInterface_bready_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2677, AxiMonitorInterface_bready_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2678, AxiMonitorInterface_bready_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2679, AxiMonitorInterface_bready_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2680, AxiMonitorInterface_bready_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2681, AxiMonitorInterface_bready_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2682, AxiMonitorInterface_bready_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2683, AxiMonitorInterface_bready_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2684, AxiMonitorInterface_bready_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2685, AxiMonitorInterface_bready_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2686, AxiMonitorInterface_bready_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2687, AxiMonitorInterface_bready_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2688, AxiMonitorInterface_bready_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2689, AxiMonitorInterface_bready_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2690, AxiMonitorInterface_bready_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2691, AxiMonitorInterface_bsideband_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2692, AxiMonitorInterface_bsideband_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2693, AxiMonitorInterface_bsideband_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2694, AxiMonitorInterface_bsideband_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2695, AxiMonitorInterface_bsideband_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2696, AxiMonitorInterface_bsideband_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2697, AxiMonitorInterface_bsideband_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2698, AxiMonitorInterface_bsideband_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2699, AxiMonitorInterface_bsideband_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2700, AxiMonitorInterface_bsideband_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2701, AxiMonitorInterface_bsideband_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2702, AxiMonitorInterface_bsideband_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2703, AxiMonitorInterface_bsideband_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2704, AxiMonitorInterface_bsideband_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2705, AxiMonitorInterface_bsideband_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2706, AxiMonitorInterface_bsideband_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2707, AxiMonitorInterface_bsideband_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2708, AxiMonitorInterface_bsideband_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2709, AxiMonitorInterface_bsideband_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2710, AxiMonitorInterface_bsideband_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2711, AxiMonitorInterface_bsideband_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2712, AxiMonitorInterface_bsideband_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2713, AxiMonitorInterface_bsideband_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2714, AxiMonitorInterface_bsideband_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2715, AxiMonitorInterface_bsideband_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2716, AxiMonitorInterface_bsideband_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2717, AxiMonitorInterface_bsideband_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2718, AxiMonitorInterface_bsideband_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2719, AxiMonitorInterface_bsideband_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2720, AxiMonitorInterface_bsideband_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2721, AxiMonitorInterface_bsideband_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2722, AxiMonitorInterface_bsideband_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2723, AxiMonitorInterface_cactive_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2724, AxiMonitorInterface_cactive_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2725, AxiMonitorInterface_cactive_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2726, AxiMonitorInterface_cactive_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2727, AxiMonitorInterface_cactive_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2728, AxiMonitorInterface_cactive_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2729, AxiMonitorInterface_cactive_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2730, AxiMonitorInterface_cactive_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2731, AxiMonitorInterface_cactive_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2732, AxiMonitorInterface_cactive_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2733, AxiMonitorInterface_cactive_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2734, AxiMonitorInterface_cactive_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2735, AxiMonitorInterface_cactive_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2736, AxiMonitorInterface_cactive_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2737, AxiMonitorInterface_cactive_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2738, AxiMonitorInterface_cactive_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2739, AxiMonitorInterface_cactive_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2740, AxiMonitorInterface_cactive_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2741, AxiMonitorInterface_cactive_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2742, AxiMonitorInterface_cactive_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2743, AxiMonitorInterface_cactive_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2744, AxiMonitorInterface_cactive_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2745, AxiMonitorInterface_cactive_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2746, AxiMonitorInterface_cactive_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2747, AxiMonitorInterface_cactive_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2748, AxiMonitorInterface_cactive_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2749, AxiMonitorInterface_cactive_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2750, AxiMonitorInterface_cactive_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2751, AxiMonitorInterface_cactive_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2752, AxiMonitorInterface_cactive_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2753, AxiMonitorInterface_cactive_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2754, AxiMonitorInterface_cactive_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2755, AxiMonitorInterface_csysreq_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2756, AxiMonitorInterface_csysreq_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2757, AxiMonitorInterface_csysreq_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2758, AxiMonitorInterface_csysreq_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2759, AxiMonitorInterface_csysreq_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2760, AxiMonitorInterface_csysreq_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2761, AxiMonitorInterface_csysreq_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2762, AxiMonitorInterface_csysreq_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2763, AxiMonitorInterface_csysreq_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2764, AxiMonitorInterface_csysreq_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2765, AxiMonitorInterface_csysreq_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2766, AxiMonitorInterface_csysreq_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2767, AxiMonitorInterface_csysreq_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2768, AxiMonitorInterface_csysreq_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2769, AxiMonitorInterface_csysreq_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2770, AxiMonitorInterface_csysreq_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2771, AxiMonitorInterface_csysreq_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2772, AxiMonitorInterface_csysreq_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2773, AxiMonitorInterface_csysreq_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2774, AxiMonitorInterface_csysreq_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2775, AxiMonitorInterface_csysreq_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2776, AxiMonitorInterface_csysreq_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2777, AxiMonitorInterface_csysreq_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2778, AxiMonitorInterface_csysreq_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2779, AxiMonitorInterface_csysreq_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2780, AxiMonitorInterface_csysreq_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2781, AxiMonitorInterface_csysreq_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2782, AxiMonitorInterface_csysreq_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2783, AxiMonitorInterface_csysreq_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2784, AxiMonitorInterface_csysreq_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2785, AxiMonitorInterface_csysreq_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2786, AxiMonitorInterface_csysreq_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2787, AxiMonitorInterface_csysack_s0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2788, AxiMonitorInterface_csysack_s1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2789, AxiMonitorInterface_csysack_s2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2790, AxiMonitorInterface_csysack_s3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2791, AxiMonitorInterface_csysack_s4, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2792, AxiMonitorInterface_csysack_s5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2793, AxiMonitorInterface_csysack_s6, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2794, AxiMonitorInterface_csysack_s7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2795, AxiMonitorInterface_csysack_s8, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2796, AxiMonitorInterface_csysack_s9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2797, AxiMonitorInterface_csysack_s10, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2798, AxiMonitorInterface_csysack_s11, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2799, AxiMonitorInterface_csysack_s12, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2800, AxiMonitorInterface_csysack_s13, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2801, AxiMonitorInterface_csysack_s14, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2802, AxiMonitorInterface_csysack_s15, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2803, AxiMonitorInterface_csysack_s16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2804, AxiMonitorInterface_csysack_s17, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2805, AxiMonitorInterface_csysack_s18, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2806, AxiMonitorInterface_csysack_s19, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2807, AxiMonitorInterface_csysack_s20, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2808, AxiMonitorInterface_csysack_s21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2809, AxiMonitorInterface_csysack_s22, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2810, AxiMonitorInterface_csysack_s23, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2811, AxiMonitorInterface_csysack_s24, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2812, AxiMonitorInterface_csysack_s25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2813, AxiMonitorInterface_csysack_s26, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2814, AxiMonitorInterface_csysack_s27, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2815, AxiMonitorInterface_csysack_s28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2816, AxiMonitorInterface_csysack_s29, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2817, AxiMonitorInterface_csysack_s30, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2818, AxiMonitorInterface_csysack_s31, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 1, GifSlaveInterface_gclk, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 2, GifSlaveInterface_maddr, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 3, GifSlaveInterface_mread, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 4, GifSlaveInterface_mwrite, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 5, GifSlaveInterface_mlen, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 6, GifSlaveInterface_msize, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 7, GifSlaveInterface_mburst, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 8, GifSlaveInterface_mlast, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 9, GifSlaveInterface_mdata, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 10, GifSlaveInterface_mwstrb, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 11, GifSlaveInterface_saccept, vmc_GifSlaveInterface_saccept_reg, 3, 1, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 12, GifSlaveInterface_svalid, vmc_GifSlaveInterface_svalid_reg, 3, 1, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 13, GifSlaveInterface_sdata, vmc_GifSlaveInterface_sdata_reg, 3, 1, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 14, GifSlaveInterface_sresp, vmc_GifSlaveInterface_sresp_reg, 3, 1, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 15, GifSlaveInterface_mready, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1, LowPowerInterface_aclk, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2, LowPowerInterface_aresetn, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 3, 0, vmc_LowPowerInterface_csysreq_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 4, LowPowerInterface_cactive, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 5, LowPowerInterface_csysack, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 6, 0, vmc_LowPowerInterface_shutdown_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 7, 0, vmc_LowPowerInterface_clocklevel_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 8, 0, vmc_LowPowerInterface_cvrgen_reg, 2, 0, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vera_add_parameter("vera_load_all", vera_load_all, 2);
    $vera_add_parameter("vera_load_AxiMon64Cfg", vera_load_AxiMon64Cfg, 2);
    $vera_add_parameter("vera_load_AxiMonitorCoverage", vera_load_AxiMonitorCoverage, 2);
    $vera_add_parameter("vera_load_AxiMonSysChks", vera_load_AxiMonSysChks, 2);
    $vera_add_parameter("vera_load_AxiMonitor64Internal", vera_load_AxiMonitor64Internal, 2);
    $vera_add_parameter("vera_load_AxiMonitor", vera_load_AxiMonitor, 2);
    $vera_add_parameter("vera_load_AxiMasterDriver", vera_load_AxiMasterDriver, 2);
    $vera_add_parameter("vera_load_AxiMasterReceiver", vera_load_AxiMasterReceiver, 2);
    $vera_add_parameter("vera_load_AxiMstrXmitMgr", vera_load_AxiMstrXmitMgr, 2);
    $vera_add_parameter("vera_load_AxiMstrTimer", vera_load_AxiMstrTimer, 2);
    $vera_add_parameter("vera_load_AxiMstrSemaData", vera_load_AxiMstrSemaData, 2);
    $vera_add_parameter("vera_load_AxiMstrRcvMgr", vera_load_AxiMstrRcvMgr, 2);
    $vera_add_parameter("vera_load_AxiMstrOutStndngMgr", vera_load_AxiMstrOutStndngMgr, 2);
    $vera_add_parameter("vera_load_AxiMstrIntlver", vera_load_AxiMstrIntlver, 2);
    $vera_add_parameter("vera_load_AxiMstrInnerBuffer", vera_load_AxiMstrInnerBuffer, 2);
    $vera_add_parameter("vera_load_AxiMasterBuffer", vera_load_AxiMasterBuffer, 2);
    $vera_add_parameter("vera_load_AxiMasterInternal", vera_load_AxiMasterInternal, 2);
    $vera_add_parameter("vera_load_AxiMasterCommands", vera_load_AxiMasterCommands, 2);
    $vera_add_parameter("vera_load_AxiMaster", vera_load_AxiMaster, 2);
    $vera_add_parameter("vera_load_AxiTransactionLog", vera_load_AxiTransactionLog, 2);
    $vera_add_parameter("vera_load_AmbaLog", vera_load_AmbaLog, 2);
    $vera_add_parameter("vera_load_AxiMonitorCommonCoverage", vera_load_AxiMonitorCommonCoverage, 2);
    $vera_add_parameter("vera_load_AxiMonitorCommands", vera_load_AxiMonitorCommands, 2);
    $vera_add_parameter("vera_load_AxiMonitorBuffer", vera_load_AxiMonitorBuffer, 2);
    $vera_add_parameter("vera_load_AxiMonChChks", vera_load_AxiMonChChks, 2);
    $vera_add_parameter("vera_load_AxiMonXactChks", vera_load_AxiMonXactChks, 2);
    $vera_add_parameter("vera_load_AxiMonChecker", vera_load_AxiMonChecker, 2);
    $vera_add_parameter("vera_load_AxiMonXactBuf", vera_load_AxiMonXactBuf, 2);
    $vera_add_parameter("vera_load_AxiMonCh", vera_load_AxiMonCh, 2);
    $vera_add_parameter("vera_load_AxiMonPort", vera_load_AxiMonPort, 2);
    $vera_add_parameter("vera_load_AxiMonCfg", vera_load_AxiMonCfg, 2);
    $vera_add_parameter("vera_load_AxiMonitorInternal", vera_load_AxiMonitorInternal, 2);
    $vera_add_parameter("vera_load_AxiBusArchitectureConfiguration_rvm", vera_load_AxiBusArchitectureConfiguration_rvm, 2);
    $vera_add_parameter("vera_load_AxiMonitorExtendedTransaction_rvm", vera_load_AxiMonitorExtendedTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiMonitorTransaction_rvm", vera_load_AxiMonitorTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiSlaveTransactionInternal", vera_load_AxiSlaveTransactionInternal, 2);
    $vera_add_parameter("vera_load_AxiMasterTransactionInternal", vera_load_AxiMasterTransactionInternal, 2);
    $vera_add_parameter("vera_load_AxiTransactionInternal", vera_load_AxiTransactionInternal, 2);
    $vera_add_parameter("vera_load_AxiConfigurationInternal", vera_load_AxiConfigurationInternal, 2);
    $vera_add_parameter("vera_load_AxiConfiguration_rvm", vera_load_AxiConfiguration_rvm, 2);
    $vera_add_parameter("vera_load_AxiSlaveExtendedTransaction_rvm", vera_load_AxiSlaveExtendedTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiSlaveTransaction_rvm", vera_load_AxiSlaveTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiMasterExtendedTransaction_rvm", vera_load_AxiMasterExtendedTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiMasterTransaction_rvm", vera_load_AxiMasterTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiTransaction_rvm", vera_load_AxiTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiMatchObj", vera_load_AxiMatchObj, 2);
    $vera_add_parameter("vera_load_AxiMatchMgr", vera_load_AxiMatchMgr, 2);
    $vera_add_parameter("vera_load_AxiResponseMgr", vera_load_AxiResponseMgr, 2);
    $vera_add_parameter("vera_load_AxiDriver", vera_load_AxiDriver, 2);
    $vera_add_parameter("vera_load_AxiReceiver", vera_load_AxiReceiver, 2);
    $vera_add_parameter("vera_load_AxiRcvMgr", vera_load_AxiRcvMgr, 2);
    $vera_add_parameter("vera_load_AxiChXfer", vera_load_AxiChXfer, 2);
    $vera_add_parameter("vera_load_AxiBufferMgr", vera_load_AxiBufferMgr, 2);
    $vera_add_parameter("vera_load_AxiMdlCfg", vera_load_AxiMdlCfg, 2);
    $vera_add_parameter("vera_load_AxiCommands", vera_load_AxiCommands, 2);
    $vera_add_parameter("vera_load_AxiModel", vera_load_AxiModel, 2);
    $vera_add_parameter("vera_load_AxiLib", vera_load_AxiLib, 2);
    $vera_add_parameter("vera_load_dw_vip_rvm", vera_load_dw_vip_rvm, 2);
    $vera_add_parameter("vera_load_VmtCoverageCommands", vera_load_VmtCoverageCommands, 2);
    $vera_add_parameter("vera_load_VmtCoverageManager", vera_load_VmtCoverageManager, 2);
    $vera_add_parameter("vera_load_VmtCoverageGroup", vera_load_VmtCoverageGroup, 2);
    $vera_add_parameter("vera_load_VmtCoveragePoint", vera_load_VmtCoveragePoint, 2);
    $vera_add_parameter("vera_load_VmtCoverageBase", vera_load_VmtCoverageBase, 2);
    $vera_add_parameter("vera_load_VmtTransactionMonitorCommands", vera_load_VmtTransactionMonitorCommands, 2);
    $vera_add_parameter("vera_load_VmtTransactionChoiceMonitor", vera_load_VmtTransactionChoiceMonitor, 2);
    $vera_add_parameter("vera_load_VmtTransactionSequenceMonitor", vera_load_VmtTransactionSequenceMonitor, 2);
    $vera_add_parameter("vera_load_VmtProtocolTransactionMonitor", vera_load_VmtProtocolTransactionMonitor, 2);
    $vera_add_parameter("vera_load_VmtTransactionMonitor", vera_load_VmtTransactionMonitor, 2);
    $vera_add_parameter("vera_load_VmtPayload", vera_load_VmtPayload, 2);
    $vera_add_parameter("vera_load_VmtTransactionInfo", vera_load_VmtTransactionInfo, 2);
    $vera_add_parameter("vera_load_VmtTransactionExpression", vera_load_VmtTransactionExpression, 2);
    $vera_add_parameter("vera_load_VmtTransactionCommands", vera_load_VmtTransactionCommands, 2);
    $vera_add_parameter("vera_load_VmtTransactionChoiceGenerator", vera_load_VmtTransactionChoiceGenerator, 2);
    $vera_add_parameter("vera_load_VmtTransactionSequenceGenerator", vera_load_VmtTransactionSequenceGenerator, 2);
    $vera_add_parameter("vera_load_VmtProtocolTransactionGenerator", vera_load_VmtProtocolTransactionGenerator, 2);
    $vera_add_parameter("vera_load_VmtTransactionGenerator", vera_load_VmtTransactionGenerator, 2);
    $vera_add_parameter("vera_load_VmtTransaction", vera_load_VmtTransaction, 2);
    $vera_add_parameter("vera_load_VmtXactBase", vera_load_VmtXactBase, 2);
    $vera_add_parameter("vera_load_VmtMem", vera_load_VmtMem, 2);
    $vera_add_parameter("vera_load_VmtCommonCommands", vera_load_VmtCommonCommands, 2);
    $vera_add_parameter("vera_load_VmtCommandManager", vera_load_VmtCommandManager, 2);
    $vera_add_parameter("vera_load_VmtCommandDispatch", vera_load_VmtCommandDispatch, 2);
    $vera_add_parameter("vera_load_VmtBase", vera_load_VmtBase, 2);
    $vera_add_parameter("vera_load_VmtMessageService", vera_load_VmtMessageService, 2);
    $vera_add_parameter("vera_udf_VipCommon", vera_udf_VipCommon, 2);
    $vera_add_parameter("vera_udf_VmtModelManager", vera_udf_VmtModelManager, 2);
    $vera_add_parameter("vera_runtime_information", vera_runtime_information, 2);


    $vmc_start_program() ;


end
endmodule
