 `ifdef AXI_HAS_S0 

`ifdef AXI_S0_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S0_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S0_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S0, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S0, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S0, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S0
)

U_AR_S0_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.dbg_arvalid_s0),
  .ready_i        (U_DW_axi.dbg_arready_s0),
  .resp_valid_i   (U_DW_axi.dbg_rvalid_s0),
  .resp_ready_i   (U_DW_axi.dbg_rready_s0),
.resp_last_i   (U_DW_axi.dbg_rlast_s0),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s0.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s0.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s0.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s0.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s0.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd0),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S0_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S0_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S0_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S0, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S0, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S0, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S0
)

U_AW_S0_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.dbg_awvalid_s0),
  .ready_i        (U_DW_axi.dbg_awready_s0),
  .resp_valid_i   (U_DW_axi.dbg_bvalid_s0),
  .resp_ready_i   (U_DW_axi.dbg_bready_s0),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s0.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s0.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s0.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s0.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s0.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd0),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S0_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
1,
1,

  `AXI_W_MCA_EN_S0, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S0, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S0, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S0_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.dbg_wvalid_s0),
  .ready_i        (U_DW_axi.dbg_wready_s0),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s0.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s0.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s0.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s0.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s0.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd0),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S1 

`ifdef AXI_S1_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S1_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S1_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S1, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S1, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S1, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S1
)

U_AR_S1_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s1),
  .ready_i        (U_DW_axi.arready_s1),
  .resp_valid_i   (U_DW_axi.rvalid_s1),
  .resp_ready_i   (U_DW_axi.rready_s1),
.resp_last_i   (U_DW_axi.rlast_s1),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd1),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S1_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S1_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S1_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S1, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S1, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S1, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S1
)

U_AW_S1_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s1),
  .ready_i        (U_DW_axi.awready_s1),
  .resp_valid_i   (U_DW_axi.bvalid_s1),
  .resp_ready_i   (U_DW_axi.bready_s1),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd1),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S1_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S1, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S1, // Grant index width.

  `AXI_W_MCA_EN_S1, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S1, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S1, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S1_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s1),
  .ready_i        (U_DW_axi.wready_s1),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s1.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s1.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s1.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s1.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s1.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd1),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S2 

`ifdef AXI_S2_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S2_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S2_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S2, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S2, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S2, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S2
)

U_AR_S2_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s2),
  .ready_i        (U_DW_axi.arready_s2),
  .resp_valid_i   (U_DW_axi.rvalid_s2),
  .resp_ready_i   (U_DW_axi.rready_s2),
.resp_last_i   (U_DW_axi.rlast_s2),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd2),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S2_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S2_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S2_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S2, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S2, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S2, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S2
)

U_AW_S2_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s2),
  .ready_i        (U_DW_axi.awready_s2),
  .resp_valid_i   (U_DW_axi.bvalid_s2),
  .resp_ready_i   (U_DW_axi.bready_s2),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd2),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S2_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S2, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S2, // Grant index width.

  `AXI_W_MCA_EN_S2, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S2, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S2, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S2_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s2),
  .ready_i        (U_DW_axi.wready_s2),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s2.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s2.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s2.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s2.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s2.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd2),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S3 

`ifdef AXI_S3_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S3_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S3_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S3, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S3, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S3, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S3
)

U_AR_S3_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s3),
  .ready_i        (U_DW_axi.arready_s3),
  .resp_valid_i   (U_DW_axi.rvalid_s3),
  .resp_ready_i   (U_DW_axi.rready_s3),
.resp_last_i   (U_DW_axi.rlast_s3),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd3),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S3_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S3_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S3_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S3, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S3, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S3, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S3
)

U_AW_S3_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s3),
  .ready_i        (U_DW_axi.awready_s3),
  .resp_valid_i   (U_DW_axi.bvalid_s3),
  .resp_ready_i   (U_DW_axi.bready_s3),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd3),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S3_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S3, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S3, // Grant index width.

  `AXI_W_MCA_EN_S3, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S3, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S3, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S3_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s3),
  .ready_i        (U_DW_axi.wready_s3),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s3.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s3.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s3.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s3.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s3.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd3),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S4 

`ifdef AXI_S4_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S4_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S4_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S4, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S4, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S4, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S4
)

U_AR_S4_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s4),
  .ready_i        (U_DW_axi.arready_s4),
  .resp_valid_i   (U_DW_axi.rvalid_s4),
  .resp_ready_i   (U_DW_axi.rready_s4),
.resp_last_i   (U_DW_axi.rlast_s4),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd4),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S4_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S4_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S4_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S4, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S4, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S4, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S4
)

U_AW_S4_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s4),
  .ready_i        (U_DW_axi.awready_s4),
  .resp_valid_i   (U_DW_axi.bvalid_s4),
  .resp_ready_i   (U_DW_axi.bready_s4),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd4),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S4_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S4, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S4, // Grant index width.

  `AXI_W_MCA_EN_S4, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S4, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S4, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S4_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s4),
  .ready_i        (U_DW_axi.wready_s4),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s4.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s4.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s4.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s4.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s4.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd4),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S5 

`ifdef AXI_S5_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S5_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S5_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S5, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S5, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S5, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S5
)

U_AR_S5_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s5),
  .ready_i        (U_DW_axi.arready_s5),
  .resp_valid_i   (U_DW_axi.rvalid_s5),
  .resp_ready_i   (U_DW_axi.rready_s5),
.resp_last_i   (U_DW_axi.rlast_s5),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd5),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S5_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S5_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S5_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S5, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S5, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S5, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S5
)

U_AW_S5_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s5),
  .ready_i        (U_DW_axi.awready_s5),
  .resp_valid_i   (U_DW_axi.bvalid_s5),
  .resp_ready_i   (U_DW_axi.bready_s5),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd5),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S5_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S5, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S5, // Grant index width.

  `AXI_W_MCA_EN_S5, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S5, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S5, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S5_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s5),
  .ready_i        (U_DW_axi.wready_s5),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s5.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s5.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s5.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s5.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s5.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd5),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S6 

`ifdef AXI_S6_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S6_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S6_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S6, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S6, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S6, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S6
)

U_AR_S6_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s6),
  .ready_i        (U_DW_axi.arready_s6),
  .resp_valid_i   (U_DW_axi.rvalid_s6),
  .resp_ready_i   (U_DW_axi.rready_s6),
.resp_last_i   (U_DW_axi.rlast_s6),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd6),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S6_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S6_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S6_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S6, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S6, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S6, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S6
)

U_AW_S6_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s6),
  .ready_i        (U_DW_axi.awready_s6),
  .resp_valid_i   (U_DW_axi.bvalid_s6),
  .resp_ready_i   (U_DW_axi.bready_s6),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd6),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S6_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S6, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S6, // Grant index width.

  `AXI_W_MCA_EN_S6, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S6, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S6, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S6_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s6),
  .ready_i        (U_DW_axi.wready_s6),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s6.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s6.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s6.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s6.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s6.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd6),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S7 

`ifdef AXI_S7_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S7_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S7_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S7, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S7, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S7, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S7
)

U_AR_S7_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s7),
  .ready_i        (U_DW_axi.arready_s7),
  .resp_valid_i   (U_DW_axi.rvalid_s7),
  .resp_ready_i   (U_DW_axi.rready_s7),
.resp_last_i   (U_DW_axi.rlast_s7),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd7),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S7_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S7_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S7_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S7, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S7, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S7, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S7
)

U_AW_S7_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s7),
  .ready_i        (U_DW_axi.awready_s7),
  .resp_valid_i   (U_DW_axi.bvalid_s7),
  .resp_ready_i   (U_DW_axi.bready_s7),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd7),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S7_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S7, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S7, // Grant index width.

  `AXI_W_MCA_EN_S7, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S7, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S7, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S7_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s7),
  .ready_i        (U_DW_axi.wready_s7),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s7.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s7.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s7.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s7.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s7.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd7),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S8 

`ifdef AXI_S8_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S8_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S8_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S8, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S8, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S8, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S8
)

U_AR_S8_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s8),
  .ready_i        (U_DW_axi.arready_s8),
  .resp_valid_i   (U_DW_axi.rvalid_s8),
  .resp_ready_i   (U_DW_axi.rready_s8),
.resp_last_i   (U_DW_axi.rlast_s8),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd8),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S8_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S8_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S8_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S8, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S8, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S8, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S8
)

U_AW_S8_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s8),
  .ready_i        (U_DW_axi.awready_s8),
  .resp_valid_i   (U_DW_axi.bvalid_s8),
  .resp_ready_i   (U_DW_axi.bready_s8),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd8),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S8_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S8, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S8, // Grant index width.

  `AXI_W_MCA_EN_S8, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S8, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S8, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S8_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s8),
  .ready_i        (U_DW_axi.wready_s8),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s8.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s8.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s8.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s8.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s8.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd8),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S9 

`ifdef AXI_S9_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S9_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S9_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S9, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S9, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S9, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S9
)

U_AR_S9_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s9),
  .ready_i        (U_DW_axi.arready_s9),
  .resp_valid_i   (U_DW_axi.rvalid_s9),
  .resp_ready_i   (U_DW_axi.rready_s9),
.resp_last_i   (U_DW_axi.rlast_s9),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd9),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S9_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S9_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S9_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S9, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S9, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S9, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S9
)

U_AW_S9_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s9),
  .ready_i        (U_DW_axi.awready_s9),
  .resp_valid_i   (U_DW_axi.bvalid_s9),
  .resp_ready_i   (U_DW_axi.bready_s9),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd9),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S9_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S9, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S9, // Grant index width.

  `AXI_W_MCA_EN_S9, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S9, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S9, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S9_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s9),
  .ready_i        (U_DW_axi.wready_s9),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s9.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s9.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s9.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s9.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s9.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd9),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S10 

`ifdef AXI_S10_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S10_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S10_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S10, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S10, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S10, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S10
)

U_AR_S10_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s10),
  .ready_i        (U_DW_axi.arready_s10),
  .resp_valid_i   (U_DW_axi.rvalid_s10),
  .resp_ready_i   (U_DW_axi.rready_s10),
.resp_last_i   (U_DW_axi.rlast_s10),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd10),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S10_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S10_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S10_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S10, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S10, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S10, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S10
)

U_AW_S10_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s10),
  .ready_i        (U_DW_axi.awready_s10),
  .resp_valid_i   (U_DW_axi.bvalid_s10),
  .resp_ready_i   (U_DW_axi.bready_s10),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd10),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S10_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S10, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S10, // Grant index width.

  `AXI_W_MCA_EN_S10, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S10, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S10, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S10_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s10),
  .ready_i        (U_DW_axi.wready_s10),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s10.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s10.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s10.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s10.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s10.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd10),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S11 

`ifdef AXI_S11_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S11_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S11_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S11, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S11, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S11, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S11
)

U_AR_S11_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s11),
  .ready_i        (U_DW_axi.arready_s11),
  .resp_valid_i   (U_DW_axi.rvalid_s11),
  .resp_ready_i   (U_DW_axi.rready_s11),
.resp_last_i   (U_DW_axi.rlast_s11),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd11),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S11_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S11_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S11_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S11, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S11, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S11, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S11
)

U_AW_S11_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s11),
  .ready_i        (U_DW_axi.awready_s11),
  .resp_valid_i   (U_DW_axi.bvalid_s11),
  .resp_ready_i   (U_DW_axi.bready_s11),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd11),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S11_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S11, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S11, // Grant index width.

  `AXI_W_MCA_EN_S11, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S11, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S11, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S11_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s11),
  .ready_i        (U_DW_axi.wready_s11),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s11.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s11.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s11.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s11.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s11.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd11),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S12 

`ifdef AXI_S12_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S12_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S12_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S12, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S12, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S12, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S12
)

U_AR_S12_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s12),
  .ready_i        (U_DW_axi.arready_s12),
  .resp_valid_i   (U_DW_axi.rvalid_s12),
  .resp_ready_i   (U_DW_axi.rready_s12),
.resp_last_i   (U_DW_axi.rlast_s12),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd12),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S12_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S12_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S12_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S12, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S12, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S12, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S12
)

U_AW_S12_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s12),
  .ready_i        (U_DW_axi.awready_s12),
  .resp_valid_i   (U_DW_axi.bvalid_s12),
  .resp_ready_i   (U_DW_axi.bready_s12),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd12),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S12_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S12, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S12, // Grant index width.

  `AXI_W_MCA_EN_S12, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S12, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S12, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S12_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s12),
  .ready_i        (U_DW_axi.wready_s12),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s12.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s12.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s12.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s12.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s12.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd12),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S13 

`ifdef AXI_S13_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S13_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S13_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S13, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S13, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S13, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S13
)

U_AR_S13_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s13),
  .ready_i        (U_DW_axi.arready_s13),
  .resp_valid_i   (U_DW_axi.rvalid_s13),
  .resp_ready_i   (U_DW_axi.rready_s13),
.resp_last_i   (U_DW_axi.rlast_s13),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd13),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S13_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S13_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S13_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S13, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S13, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S13, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S13
)

U_AW_S13_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s13),
  .ready_i        (U_DW_axi.awready_s13),
  .resp_valid_i   (U_DW_axi.bvalid_s13),
  .resp_ready_i   (U_DW_axi.bready_s13),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd13),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S13_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S13, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S13, // Grant index width.

  `AXI_W_MCA_EN_S13, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S13, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S13, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S13_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s13),
  .ready_i        (U_DW_axi.wready_s13),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s13.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s13.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s13.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s13.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s13.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd13),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S14 

`ifdef AXI_S14_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S14_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S14_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S14, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S14, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S14, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S14
)

U_AR_S14_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s14),
  .ready_i        (U_DW_axi.arready_s14),
  .resp_valid_i   (U_DW_axi.rvalid_s14),
  .resp_ready_i   (U_DW_axi.rready_s14),
.resp_last_i   (U_DW_axi.rlast_s14),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd14),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S14_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S14_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S14_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S14, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S14, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S14, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S14
)

U_AW_S14_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s14),
  .ready_i        (U_DW_axi.awready_s14),
  .resp_valid_i   (U_DW_axi.bvalid_s14),
  .resp_ready_i   (U_DW_axi.bready_s14),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd14),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S14_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S14, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S14, // Grant index width.

  `AXI_W_MCA_EN_S14, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S14, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S14, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S14_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s14),
  .ready_i        (U_DW_axi.wready_s14),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s14.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s14.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s14.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s14.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s14.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd14),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S15 

`ifdef AXI_S15_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S15_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S15_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S15, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S15, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S15, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S15
)

U_AR_S15_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s15),
  .ready_i        (U_DW_axi.arready_s15),
  .resp_valid_i   (U_DW_axi.rvalid_s15),
  .resp_ready_i   (U_DW_axi.rready_s15),
.resp_last_i   (U_DW_axi.rlast_s15),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd15),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S15_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S15_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S15_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S15, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S15, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S15, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S15
)

U_AW_S15_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s15),
  .ready_i        (U_DW_axi.awready_s15),
  .resp_valid_i   (U_DW_axi.bvalid_s15),
  .resp_ready_i   (U_DW_axi.bready_s15),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd15),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S15_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S15, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S15, // Grant index width.

  `AXI_W_MCA_EN_S15, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S15, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S15, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S15_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s15),
  .ready_i        (U_DW_axi.wready_s15),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s15.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s15.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s15.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s15.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s15.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd15),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_S16 

`ifdef AXI_S16_ON_AR_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AR_S16_NMV, // Bus (one hot) grant index width.
  `AXI_AR_S16_NMV_LOG2, // Grant index width.
  `AXI_AR_MCA_EN_S16, // Enable multi cycle arbitration.
  `AXI_AR_MCA_NC_S16, // Number of arb. cycles in multi cycle arb.
  `AXI_AR_MCA_NC_W_S16, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FARC_S16
)

U_AR_S16_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.arvalid_s16),
  .ready_i        (U_DW_axi.arready_s16),
  .resp_valid_i   (U_DW_axi.rvalid_s16),
  .resp_ready_i   (U_DW_axi.rready_s16),
.resp_last_i   (U_DW_axi.rlast_s16),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd16),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S16_ON_AW_SHARED_ONLY
`else 

tb_mca_checker #(
  `AXI_AW_S16_NMV, // Bus (one hot) grant index width.
  `AXI_AW_S16_NMV_LOG2, // Grant index width.
  `AXI_AW_MCA_EN_S16, // Enable multi cycle arbitration.
  `AXI_AW_MCA_NC_S16, // Number of arb. cycles in multi cycle arb.
  `AXI_AW_MCA_NC_W_S16, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  `AXI_MAX_FAWC_S16
)

U_AW_S16_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.awvalid_s16),
  .ready_i        (U_DW_axi.awready_s16),
  .resp_valid_i   (U_DW_axi.bvalid_s16),
  .resp_ready_i   (U_DW_axi.bready_s16),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd16),
  .shared_i       (1'b0)
);
`endif

`ifdef AXI_S16_ON_W_SHARED_ONLY
`else
tb_mca_checker #(
`AXI_WID_S16, // Bus (one hot) grant index width.
`AXI_LOG2_WID_S16, // Grant index width.

  `AXI_W_MCA_EN_S16, // Enable multi cycle arbitration.
  `AXI_W_MCA_NC_S16, // Number of arb. cycles in multi cycle arb.
  `AXI_W_MCA_NC_W_S16, // Log base 2 of MCA_NC.
  5, // Port input width.
  0, // RI_LIMIT, not used here.
  0  // Num act t/x's, don't care here.
)

U_W_S16_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs 

  .valid_i        (U_DW_axi.wvalid_s16),
  .ready_i        (U_DW_axi.wready_s16),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_s16.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_s16.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_s16.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_s16.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_s16.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'd16),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M1 

`ifdef AXI_M1_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M1_NSV, // Bus (one hot) grant index width.
  `AXI_R_M1_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M1, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M1, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M1, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M1, 

  0  // Num act t/x's, don't care here.
)
U_R_M1_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m1),
  .ready_i        (U_DW_axi.rready_m1),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd1),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M1_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M1_NSV, // Bus (one hot) grant index width.
  `AXI_B_M1_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M1, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M1, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M1, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M1_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m1),
  .ready_i        (U_DW_axi.bready_m1),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m1.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m1.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m1.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m1.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m1.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd1),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M2 

`ifdef AXI_M2_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M2_NSV, // Bus (one hot) grant index width.
  `AXI_R_M2_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M2, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M2, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M2, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M2, 

  0  // Num act t/x's, don't care here.
)
U_R_M2_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m2),
  .ready_i        (U_DW_axi.rready_m2),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m2.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m2.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m2.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m2.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m2.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m2.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd2),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M2_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M2_NSV, // Bus (one hot) grant index width.
  `AXI_B_M2_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M2, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M2, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M2, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M2_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m2),
  .ready_i        (U_DW_axi.bready_m2),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m2.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m2.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m2.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m2.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m2.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd2),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M3 

`ifdef AXI_M3_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M3_NSV, // Bus (one hot) grant index width.
  `AXI_R_M3_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M3, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M3, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M3, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M3, 

  0  // Num act t/x's, don't care here.
)
U_R_M3_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m3),
  .ready_i        (U_DW_axi.rready_m3),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m3.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m3.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m3.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m3.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m3.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m3.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd3),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M3_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M3_NSV, // Bus (one hot) grant index width.
  `AXI_B_M3_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M3, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M3, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M3, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M3_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m3),
  .ready_i        (U_DW_axi.bready_m3),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m3.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m3.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m3.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m3.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m3.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd3),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M4 

`ifdef AXI_M4_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M4_NSV, // Bus (one hot) grant index width.
  `AXI_R_M4_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M4, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M4, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M4, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M4, 

  0  // Num act t/x's, don't care here.
)
U_R_M4_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m4),
  .ready_i        (U_DW_axi.rready_m4),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m4.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m4.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m4.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m4.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m4.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m4.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd4),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M4_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M4_NSV, // Bus (one hot) grant index width.
  `AXI_B_M4_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M4, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M4, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M4, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M4_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m4),
  .ready_i        (U_DW_axi.bready_m4),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m4.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m4.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m4.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m4.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m4.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd4),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M5 

`ifdef AXI_M5_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M5_NSV, // Bus (one hot) grant index width.
  `AXI_R_M5_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M5, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M5, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M5, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M5, 

  0  // Num act t/x's, don't care here.
)
U_R_M5_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m5),
  .ready_i        (U_DW_axi.rready_m5),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m5.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m5.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m5.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m5.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m5.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m5.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd5),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M5_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M5_NSV, // Bus (one hot) grant index width.
  `AXI_B_M5_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M5, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M5, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M5, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M5_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m5),
  .ready_i        (U_DW_axi.bready_m5),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m5.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m5.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m5.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m5.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m5.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd5),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M6 

`ifdef AXI_M6_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M6_NSV, // Bus (one hot) grant index width.
  `AXI_R_M6_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M6, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M6, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M6, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M6, 

  0  // Num act t/x's, don't care here.
)
U_R_M6_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m6),
  .ready_i        (U_DW_axi.rready_m6),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m6.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m6.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m6.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m6.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m6.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m6.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd6),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M6_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M6_NSV, // Bus (one hot) grant index width.
  `AXI_B_M6_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M6, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M6, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M6, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M6_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m6),
  .ready_i        (U_DW_axi.bready_m6),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m6.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m6.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m6.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m6.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m6.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd6),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M7 

`ifdef AXI_M7_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M7_NSV, // Bus (one hot) grant index width.
  `AXI_R_M7_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M7, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M7, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M7, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M7, 

  0  // Num act t/x's, don't care here.
)
U_R_M7_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m7),
  .ready_i        (U_DW_axi.rready_m7),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m7.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m7.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m7.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m7.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m7.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m7.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd7),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M7_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M7_NSV, // Bus (one hot) grant index width.
  `AXI_B_M7_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M7, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M7, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M7, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M7_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m7),
  .ready_i        (U_DW_axi.bready_m7),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m7.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m7.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m7.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m7.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m7.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd7),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M8 

`ifdef AXI_M8_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M8_NSV, // Bus (one hot) grant index width.
  `AXI_R_M8_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M8, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M8, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M8, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M8, 

  0  // Num act t/x's, don't care here.
)
U_R_M8_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m8),
  .ready_i        (U_DW_axi.rready_m8),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m8.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m8.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m8.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m8.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m8.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m8.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd8),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M8_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M8_NSV, // Bus (one hot) grant index width.
  `AXI_B_M8_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M8, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M8, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M8, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M8_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m8),
  .ready_i        (U_DW_axi.bready_m8),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m8.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m8.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m8.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m8.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m8.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd8),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M9 

`ifdef AXI_M9_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M9_NSV, // Bus (one hot) grant index width.
  `AXI_R_M9_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M9, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M9, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M9, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M9, 

  0  // Num act t/x's, don't care here.
)
U_R_M9_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m9),
  .ready_i        (U_DW_axi.rready_m9),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m9.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m9.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m9.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m9.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m9.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m9.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd9),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M9_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M9_NSV, // Bus (one hot) grant index width.
  `AXI_B_M9_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M9, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M9, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M9, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M9_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m9),
  .ready_i        (U_DW_axi.bready_m9),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m9.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m9.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m9.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m9.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m9.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd9),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M10 

`ifdef AXI_M10_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M10_NSV, // Bus (one hot) grant index width.
  `AXI_R_M10_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M10, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M10, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M10, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M10, 

  0  // Num act t/x's, don't care here.
)
U_R_M10_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m10),
  .ready_i        (U_DW_axi.rready_m10),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m10.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m10.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m10.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m10.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m10.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m10.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd10),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M10_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M10_NSV, // Bus (one hot) grant index width.
  `AXI_B_M10_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M10, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M10, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M10, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M10_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m10),
  .ready_i        (U_DW_axi.bready_m10),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m10.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m10.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m10.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m10.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m10.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd10),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M11 

`ifdef AXI_M11_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M11_NSV, // Bus (one hot) grant index width.
  `AXI_R_M11_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M11, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M11, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M11, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M11, 

  0  // Num act t/x's, don't care here.
)
U_R_M11_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m11),
  .ready_i        (U_DW_axi.rready_m11),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m11.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m11.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m11.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m11.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m11.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m11.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd11),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M11_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M11_NSV, // Bus (one hot) grant index width.
  `AXI_B_M11_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M11, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M11, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M11, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M11_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m11),
  .ready_i        (U_DW_axi.bready_m11),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m11.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m11.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m11.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m11.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m11.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd11),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M12 

`ifdef AXI_M12_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M12_NSV, // Bus (one hot) grant index width.
  `AXI_R_M12_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M12, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M12, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M12, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M12, 

  0  // Num act t/x's, don't care here.
)
U_R_M12_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m12),
  .ready_i        (U_DW_axi.rready_m12),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m12.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m12.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m12.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m12.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m12.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m12.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd12),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M12_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M12_NSV, // Bus (one hot) grant index width.
  `AXI_B_M12_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M12, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M12, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M12, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M12_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m12),
  .ready_i        (U_DW_axi.bready_m12),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m12.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m12.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m12.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m12.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m12.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd12),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M13 

`ifdef AXI_M13_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M13_NSV, // Bus (one hot) grant index width.
  `AXI_R_M13_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M13, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M13, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M13, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M13, 

  0  // Num act t/x's, don't care here.
)
U_R_M13_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m13),
  .ready_i        (U_DW_axi.rready_m13),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m13.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m13.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m13.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m13.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m13.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m13.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd13),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M13_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M13_NSV, // Bus (one hot) grant index width.
  `AXI_B_M13_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M13, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M13, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M13, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M13_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m13),
  .ready_i        (U_DW_axi.bready_m13),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m13.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m13.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m13.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m13.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m13.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd13),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M14 

`ifdef AXI_M14_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M14_NSV, // Bus (one hot) grant index width.
  `AXI_R_M14_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M14, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M14, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M14, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M14, 

  0  // Num act t/x's, don't care here.
)
U_R_M14_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m14),
  .ready_i        (U_DW_axi.rready_m14),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m14.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m14.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m14.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m14.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m14.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m14.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd14),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M14_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M14_NSV, // Bus (one hot) grant index width.
  `AXI_B_M14_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M14, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M14, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M14, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M14_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m14),
  .ready_i        (U_DW_axi.bready_m14),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m14.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m14.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m14.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m14.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m14.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd14),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M15 

`ifdef AXI_M15_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M15_NSV, // Bus (one hot) grant index width.
  `AXI_R_M15_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M15, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M15, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M15, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M15, 

  0  // Num act t/x's, don't care here.
)
U_R_M15_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m15),
  .ready_i        (U_DW_axi.rready_m15),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m15.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m15.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m15.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m15.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m15.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m15.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd15),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M15_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M15_NSV, // Bus (one hot) grant index width.
  `AXI_B_M15_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M15, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M15, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M15, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M15_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m15),
  .ready_i        (U_DW_axi.bready_m15),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m15.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m15.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m15.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m15.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m15.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd15),
  .shared_i       (1'b0)
);
`endif

 `endif

 `ifdef AXI_HAS_M16 

`ifdef AXI_M16_ON_R_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_R_M16_NSV, // Bus (one hot) grant index width.
  `AXI_R_M16_NSV_LOG2, // Grant index width.
  `AXI_R_MCA_EN_M16, // Enable multi cycle arbitration.
  `AXI_R_MCA_NC_M16, // Number of arb. cycles in multi cycle arb.
  `AXI_R_MCA_NC_W_M16, // Log base 2 of MCA_NC.
  5, // Port input width.  
  `AXI_RI_LIMIT_M16, 

  0  // Num act t/x's, don't care here.
)
U_R_M16_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.rvalid_m16),
  .ready_i        (U_DW_axi.rready_m16),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m16.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m16.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m16.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m16.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m16.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (U_DW_axi.U_DW_axi_mp_m16.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.burst_tx_not_cpl_r),
  .channel_i      (3'b011),
  .port_i         (5'd16),
  .shared_i       (1'b0)
);
`endif


`ifdef AXI_M16_ON_B_SHARED_ONLY
`else
tb_mca_checker #(
  `AXI_B_M16_NSV, // Bus (one hot) grant index width.
  `AXI_B_M16_NSV_LOG2, // Grant index width.
  `AXI_B_MCA_EN_M16, // Enable multi cycle arbitration.
  `AXI_B_MCA_NC_M16, // Number of arb. cycles in multi cycle arb.
  `AXI_B_MCA_NC_W_M16, // Log base 2 of MCA_NC.
  5, // Port input width.  
  0,  // RI_LIMIT, not used here.

  0  // Num act t/x's, don't care here.
)
U_B_M16_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (U_DW_axi.bvalid_m16),
  .ready_i        (U_DW_axi.bready_m16),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_m16.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_m16.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_m16.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_m16.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_m16.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  .channel_i      (3'b100),
  .port_i         (5'd16),
  .shared_i       (1'b0)
);
`endif

 `endif


`ifdef AXI_AR_SHARED_LAYER
  tb_mca_checker #(
    `AXI_AR_SHARED_LAYER_NM,      // Bus (one hot) grant index width.
    `AXI_LOG2_AR_SHARED_LAYER_NM, // Grant index width.
    `AXI_AR_SHARED_MCA_EN,        // Enable multi cycle arbitration.
    `AXI_AR_SHARED_MCA_NC,        // Number of arb. cycles in multi cycle arb.
    `AXI_AR_SHARED_MCA_NC_W,      // Log base 2 of MCA_NC.
    5,                                // Port input width, don't care here, 5 to compile clean.
    0,                                // RI_LIMIT, not used here.
    0                                 // Num act t/x's, don't care here.
  )
  U_AR_shared_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (|(U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.bus_valid_shrd_masked)),
  .ready_i        (U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.ready_irs),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b000),
  .port_i         (5'd0), // Not used here.
  .shared_i       (1'b1)
  );

  `endif

`ifdef AXI_AW_SHARED_LAYER
  tb_mca_checker #(
    `AXI_AW_SHARED_LAYER_NM,      // Bus (one hot) grant index width.
    `AXI_LOG2_AW_SHARED_LAYER_NM, // Grant index width.
    `AXI_AW_SHARED_MCA_EN,        // Enable multi cycle arbitration.
    `AXI_AW_SHARED_MCA_NC,        // Number of arb. cycles in multi cycle arb.
    `AXI_AW_SHARED_MCA_NC_W,      // Log base 2 of MCA_NC.
    5,                                // Port input width, don't care here, 5 to compile clean.
    0,                                // RI_LIMIT, not used here.
    0                                 // Num act t/x's, don't care here.
  )
  U_AW_shared_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (|(U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.bus_valid_shrd_masked)),
  .ready_i        (U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.ready_irs),

  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b001),
  .port_i         (5'd0), // Not used here.
  .shared_i       (1'b1)
  );

  `endif

`ifdef AXI_W_SHARED_LAYER
  tb_mca_checker #(
    `AXI_W_SHARED_LAYER_NM,      // Bus (one hot) grant index width.
    `AXI_LOG2_W_SHARED_LAYER_NM, // Grant index width.
    `AXI_W_SHARED_MCA_EN,        // Enable multi cycle arbitration.
    `AXI_W_SHARED_MCA_NC,        // Number of arb. cycles in multi cycle arb.
    `AXI_W_SHARED_MCA_NC_W,      // Log base 2 of MCA_NC.
    5,                            // Port input width, don't care here, 5 to compile clean.
    0,                            // RI_LIMIT, not used here.
    0                             // Num act t/x's, don't care here.
  )
  U_W_shared_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (|(U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.bus_valid_shrd_masked)),
  .ready_i        (U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.ready_irs),


  .arb_enable_i   (U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.

  .channel_i      (3'b010),
  .port_i         (5'b0), // Not used here.
  .shared_i       (1'b1)
);

`endif


`ifdef AXI_R_SHARED_LAYER
  tb_mca_checker #(
    `AXI_R_SHARED_LAYER_NS,      // Bus (one hot) grant index width.
    `AXI_LOG2_R_SHARED_LAYER_NS, // Grant index width.
    `AXI_R_SHARED_MCA_EN,        // Enable multi cycle arbitration.
    `AXI_R_SHARED_MCA_NC,        // Number of arb. cycles in multi cycle arb.
    `AXI_R_SHARED_MCA_NC_W,      // Log base 2 of MCA_NC.
    5,                                // Port input width, don't care here, 5 to compile clean.
    0,                                // RI_LIMIT, not used here.
    0                                 // Num act t/x's, don't care here.
  )
  U_R_shared_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (|(U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.bus_valid_shrd_grnt)),
  .ready_i        (U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.ready_irs),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b011),
  .port_i         (5'd0), // Not used here.
  .shared_i       (1'b1)
  );
`endif
  

`ifdef AXI_B_SHARED_LAYER
  tb_mca_checker #(
    `AXI_B_SHARED_LAYER_NS,      // Bus (one hot) grant index width.
    `AXI_LOG2_B_SHARED_LAYER_NS, // Grant index width.
    `AXI_B_SHARED_MCA_EN,        // Enable multi cycle arbitration.
    `AXI_B_SHARED_MCA_NC,        // Number of arb. cycles in multi cycle arb.
    `AXI_B_SHARED_MCA_NC_W,      // Log base 2 of MCA_NC.
    5,                                // Port input width, don't care here, 5 to compile clean.
    0,                                // RI_LIMIT, not used here.
    0                                 // Num act t/x's, don't care here.
  )
  U_B_shared_tb_mca_checker (
  // Inputs - System.
  .aclk_i         (aclklp),
  .aresetn_i      (aresetn),

  // Inputs
  .valid_i        (|(U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.bus_valid_shrd_grnt)),
  .ready_i        (U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.ready_irs),

  .arb_enable_i   (U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable),
  .grant_i        (U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_o),
  .grant_arb_i    (U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_arb_o),
  .bus_grant_i    (U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.U_DW_axi_arb.bus_grant_o),
  .grant_index_i  (U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.U_DW_axi_arb.grant_p_local_o),
  .burst_tx_not_cpl_r_i (1'b0), // Not used here.
  
  .channel_i      (3'b100),
  .port_i         (5'd0), // Not used here.
  .shared_i       (1'b1)
  );
`endif
  
