
// Fair Among Equals Arbiter checker for AR, slave 1.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S1 == 2) & (`AXI_NMV_S1 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 1)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S1 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S1_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S1_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S1),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S1),
       .SNUM    (1),
       .M1_VIS   (`AXI_NV_S1_BY_M1 | `AXI_BV_S1_BY_M1),
       .M2_VIS   (`AXI_NV_S1_BY_M2 | `AXI_BV_S1_BY_M2),
       .M3_VIS   (`AXI_NV_S1_BY_M3 | `AXI_BV_S1_BY_M3),
       .M4_VIS   (`AXI_NV_S1_BY_M4 | `AXI_BV_S1_BY_M4),
       .M5_VIS   (`AXI_NV_S1_BY_M5 | `AXI_BV_S1_BY_M5),
       .M6_VIS   (`AXI_NV_S1_BY_M6 | `AXI_BV_S1_BY_M6),
       .M7_VIS   (`AXI_NV_S1_BY_M7 | `AXI_BV_S1_BY_M7),
       .M8_VIS   (`AXI_NV_S1_BY_M8 | `AXI_BV_S1_BY_M8),
       .M9_VIS   (`AXI_NV_S1_BY_M9 | `AXI_BV_S1_BY_M9),
       .M10_VIS   (`AXI_NV_S1_BY_M10 | `AXI_BV_S1_BY_M10),
       .M11_VIS   (`AXI_NV_S1_BY_M11 | `AXI_BV_S1_BY_M11),
       .M12_VIS   (`AXI_NV_S1_BY_M12 | `AXI_BV_S1_BY_M12),
       .M13_VIS   (`AXI_NV_S1_BY_M13 | `AXI_BV_S1_BY_M13),
       .M14_VIS   (`AXI_NV_S1_BY_M14 | `AXI_BV_S1_BY_M14),
       .M15_VIS   (`AXI_NV_S1_BY_M15 | `AXI_BV_S1_BY_M15),
       .M16_VIS   (`AXI_NV_S1_BY_M16 | `AXI_BV_S1_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S1 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s1),
      .ready_i       (U_DW_axi.arready_s1),
      .id_i          (U_DW_axi.arid_s1)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 1.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S1 == 2) & (`AXI_NMV_S1 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 1)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S1 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S1_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S1_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S1),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S1),
       .SNUM    (1),
       .M1_VIS   (`AXI_NV_S1_BY_M1 | `AXI_BV_S1_BY_M1),
       .M2_VIS   (`AXI_NV_S1_BY_M2 | `AXI_BV_S1_BY_M2),
       .M3_VIS   (`AXI_NV_S1_BY_M3 | `AXI_BV_S1_BY_M3),
       .M4_VIS   (`AXI_NV_S1_BY_M4 | `AXI_BV_S1_BY_M4),
       .M5_VIS   (`AXI_NV_S1_BY_M5 | `AXI_BV_S1_BY_M5),
       .M6_VIS   (`AXI_NV_S1_BY_M6 | `AXI_BV_S1_BY_M6),
       .M7_VIS   (`AXI_NV_S1_BY_M7 | `AXI_BV_S1_BY_M7),
       .M8_VIS   (`AXI_NV_S1_BY_M8 | `AXI_BV_S1_BY_M8),
       .M9_VIS   (`AXI_NV_S1_BY_M9 | `AXI_BV_S1_BY_M9),
       .M10_VIS   (`AXI_NV_S1_BY_M10 | `AXI_BV_S1_BY_M10),
       .M11_VIS   (`AXI_NV_S1_BY_M11 | `AXI_BV_S1_BY_M11),
       .M12_VIS   (`AXI_NV_S1_BY_M12 | `AXI_BV_S1_BY_M12),
       .M13_VIS   (`AXI_NV_S1_BY_M13 | `AXI_BV_S1_BY_M13),
       .M14_VIS   (`AXI_NV_S1_BY_M14 | `AXI_BV_S1_BY_M14),
       .M15_VIS   (`AXI_NV_S1_BY_M15 | `AXI_BV_S1_BY_M15),
       .M16_VIS   (`AXI_NV_S1_BY_M16 | `AXI_BV_S1_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S1 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s1),
      .ready_i       (U_DW_axi.awready_s1),
      .id_i          (U_DW_axi.awid_s1)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 2.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S2 == 2) & (`AXI_NMV_S2 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 2)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S2 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S2_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S2_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S2),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S2),
       .SNUM    (2),
       .M1_VIS   (`AXI_NV_S2_BY_M1 | `AXI_BV_S2_BY_M1),
       .M2_VIS   (`AXI_NV_S2_BY_M2 | `AXI_BV_S2_BY_M2),
       .M3_VIS   (`AXI_NV_S2_BY_M3 | `AXI_BV_S2_BY_M3),
       .M4_VIS   (`AXI_NV_S2_BY_M4 | `AXI_BV_S2_BY_M4),
       .M5_VIS   (`AXI_NV_S2_BY_M5 | `AXI_BV_S2_BY_M5),
       .M6_VIS   (`AXI_NV_S2_BY_M6 | `AXI_BV_S2_BY_M6),
       .M7_VIS   (`AXI_NV_S2_BY_M7 | `AXI_BV_S2_BY_M7),
       .M8_VIS   (`AXI_NV_S2_BY_M8 | `AXI_BV_S2_BY_M8),
       .M9_VIS   (`AXI_NV_S2_BY_M9 | `AXI_BV_S2_BY_M9),
       .M10_VIS   (`AXI_NV_S2_BY_M10 | `AXI_BV_S2_BY_M10),
       .M11_VIS   (`AXI_NV_S2_BY_M11 | `AXI_BV_S2_BY_M11),
       .M12_VIS   (`AXI_NV_S2_BY_M12 | `AXI_BV_S2_BY_M12),
       .M13_VIS   (`AXI_NV_S2_BY_M13 | `AXI_BV_S2_BY_M13),
       .M14_VIS   (`AXI_NV_S2_BY_M14 | `AXI_BV_S2_BY_M14),
       .M15_VIS   (`AXI_NV_S2_BY_M15 | `AXI_BV_S2_BY_M15),
       .M16_VIS   (`AXI_NV_S2_BY_M16 | `AXI_BV_S2_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S2 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s2),
      .ready_i       (U_DW_axi.arready_s2),
      .id_i          (U_DW_axi.arid_s2)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 2.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S2 == 2) & (`AXI_NMV_S2 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 2)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S2 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S2_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S2_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S2),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S2),
       .SNUM    (2),
       .M1_VIS   (`AXI_NV_S2_BY_M1 | `AXI_BV_S2_BY_M1),
       .M2_VIS   (`AXI_NV_S2_BY_M2 | `AXI_BV_S2_BY_M2),
       .M3_VIS   (`AXI_NV_S2_BY_M3 | `AXI_BV_S2_BY_M3),
       .M4_VIS   (`AXI_NV_S2_BY_M4 | `AXI_BV_S2_BY_M4),
       .M5_VIS   (`AXI_NV_S2_BY_M5 | `AXI_BV_S2_BY_M5),
       .M6_VIS   (`AXI_NV_S2_BY_M6 | `AXI_BV_S2_BY_M6),
       .M7_VIS   (`AXI_NV_S2_BY_M7 | `AXI_BV_S2_BY_M7),
       .M8_VIS   (`AXI_NV_S2_BY_M8 | `AXI_BV_S2_BY_M8),
       .M9_VIS   (`AXI_NV_S2_BY_M9 | `AXI_BV_S2_BY_M9),
       .M10_VIS   (`AXI_NV_S2_BY_M10 | `AXI_BV_S2_BY_M10),
       .M11_VIS   (`AXI_NV_S2_BY_M11 | `AXI_BV_S2_BY_M11),
       .M12_VIS   (`AXI_NV_S2_BY_M12 | `AXI_BV_S2_BY_M12),
       .M13_VIS   (`AXI_NV_S2_BY_M13 | `AXI_BV_S2_BY_M13),
       .M14_VIS   (`AXI_NV_S2_BY_M14 | `AXI_BV_S2_BY_M14),
       .M15_VIS   (`AXI_NV_S2_BY_M15 | `AXI_BV_S2_BY_M15),
       .M16_VIS   (`AXI_NV_S2_BY_M16 | `AXI_BV_S2_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S2 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s2),
      .ready_i       (U_DW_axi.awready_s2),
      .id_i          (U_DW_axi.awid_s2)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 3.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S3 == 2) & (`AXI_NMV_S3 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 3)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S3 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S3_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S3_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S3),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S3),
       .SNUM    (3),
       .M1_VIS   (`AXI_NV_S3_BY_M1 | `AXI_BV_S3_BY_M1),
       .M2_VIS   (`AXI_NV_S3_BY_M2 | `AXI_BV_S3_BY_M2),
       .M3_VIS   (`AXI_NV_S3_BY_M3 | `AXI_BV_S3_BY_M3),
       .M4_VIS   (`AXI_NV_S3_BY_M4 | `AXI_BV_S3_BY_M4),
       .M5_VIS   (`AXI_NV_S3_BY_M5 | `AXI_BV_S3_BY_M5),
       .M6_VIS   (`AXI_NV_S3_BY_M6 | `AXI_BV_S3_BY_M6),
       .M7_VIS   (`AXI_NV_S3_BY_M7 | `AXI_BV_S3_BY_M7),
       .M8_VIS   (`AXI_NV_S3_BY_M8 | `AXI_BV_S3_BY_M8),
       .M9_VIS   (`AXI_NV_S3_BY_M9 | `AXI_BV_S3_BY_M9),
       .M10_VIS   (`AXI_NV_S3_BY_M10 | `AXI_BV_S3_BY_M10),
       .M11_VIS   (`AXI_NV_S3_BY_M11 | `AXI_BV_S3_BY_M11),
       .M12_VIS   (`AXI_NV_S3_BY_M12 | `AXI_BV_S3_BY_M12),
       .M13_VIS   (`AXI_NV_S3_BY_M13 | `AXI_BV_S3_BY_M13),
       .M14_VIS   (`AXI_NV_S3_BY_M14 | `AXI_BV_S3_BY_M14),
       .M15_VIS   (`AXI_NV_S3_BY_M15 | `AXI_BV_S3_BY_M15),
       .M16_VIS   (`AXI_NV_S3_BY_M16 | `AXI_BV_S3_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S3 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s3),
      .ready_i       (U_DW_axi.arready_s3),
      .id_i          (U_DW_axi.arid_s3)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 3.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S3 == 2) & (`AXI_NMV_S3 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 3)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S3 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S3_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S3_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S3),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S3),
       .SNUM    (3),
       .M1_VIS   (`AXI_NV_S3_BY_M1 | `AXI_BV_S3_BY_M1),
       .M2_VIS   (`AXI_NV_S3_BY_M2 | `AXI_BV_S3_BY_M2),
       .M3_VIS   (`AXI_NV_S3_BY_M3 | `AXI_BV_S3_BY_M3),
       .M4_VIS   (`AXI_NV_S3_BY_M4 | `AXI_BV_S3_BY_M4),
       .M5_VIS   (`AXI_NV_S3_BY_M5 | `AXI_BV_S3_BY_M5),
       .M6_VIS   (`AXI_NV_S3_BY_M6 | `AXI_BV_S3_BY_M6),
       .M7_VIS   (`AXI_NV_S3_BY_M7 | `AXI_BV_S3_BY_M7),
       .M8_VIS   (`AXI_NV_S3_BY_M8 | `AXI_BV_S3_BY_M8),
       .M9_VIS   (`AXI_NV_S3_BY_M9 | `AXI_BV_S3_BY_M9),
       .M10_VIS   (`AXI_NV_S3_BY_M10 | `AXI_BV_S3_BY_M10),
       .M11_VIS   (`AXI_NV_S3_BY_M11 | `AXI_BV_S3_BY_M11),
       .M12_VIS   (`AXI_NV_S3_BY_M12 | `AXI_BV_S3_BY_M12),
       .M13_VIS   (`AXI_NV_S3_BY_M13 | `AXI_BV_S3_BY_M13),
       .M14_VIS   (`AXI_NV_S3_BY_M14 | `AXI_BV_S3_BY_M14),
       .M15_VIS   (`AXI_NV_S3_BY_M15 | `AXI_BV_S3_BY_M15),
       .M16_VIS   (`AXI_NV_S3_BY_M16 | `AXI_BV_S3_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S3 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s3),
      .ready_i       (U_DW_axi.awready_s3),
      .id_i          (U_DW_axi.awid_s3)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 4.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S4 == 2) & (`AXI_NMV_S4 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 4)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S4 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S4_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S4_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S4),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S4),
       .SNUM    (4),
       .M1_VIS   (`AXI_NV_S4_BY_M1 | `AXI_BV_S4_BY_M1),
       .M2_VIS   (`AXI_NV_S4_BY_M2 | `AXI_BV_S4_BY_M2),
       .M3_VIS   (`AXI_NV_S4_BY_M3 | `AXI_BV_S4_BY_M3),
       .M4_VIS   (`AXI_NV_S4_BY_M4 | `AXI_BV_S4_BY_M4),
       .M5_VIS   (`AXI_NV_S4_BY_M5 | `AXI_BV_S4_BY_M5),
       .M6_VIS   (`AXI_NV_S4_BY_M6 | `AXI_BV_S4_BY_M6),
       .M7_VIS   (`AXI_NV_S4_BY_M7 | `AXI_BV_S4_BY_M7),
       .M8_VIS   (`AXI_NV_S4_BY_M8 | `AXI_BV_S4_BY_M8),
       .M9_VIS   (`AXI_NV_S4_BY_M9 | `AXI_BV_S4_BY_M9),
       .M10_VIS   (`AXI_NV_S4_BY_M10 | `AXI_BV_S4_BY_M10),
       .M11_VIS   (`AXI_NV_S4_BY_M11 | `AXI_BV_S4_BY_M11),
       .M12_VIS   (`AXI_NV_S4_BY_M12 | `AXI_BV_S4_BY_M12),
       .M13_VIS   (`AXI_NV_S4_BY_M13 | `AXI_BV_S4_BY_M13),
       .M14_VIS   (`AXI_NV_S4_BY_M14 | `AXI_BV_S4_BY_M14),
       .M15_VIS   (`AXI_NV_S4_BY_M15 | `AXI_BV_S4_BY_M15),
       .M16_VIS   (`AXI_NV_S4_BY_M16 | `AXI_BV_S4_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S4 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s4),
      .ready_i       (U_DW_axi.arready_s4),
      .id_i          (U_DW_axi.arid_s4)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 4.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S4 == 2) & (`AXI_NMV_S4 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 4)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S4 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S4_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S4_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S4),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S4),
       .SNUM    (4),
       .M1_VIS   (`AXI_NV_S4_BY_M1 | `AXI_BV_S4_BY_M1),
       .M2_VIS   (`AXI_NV_S4_BY_M2 | `AXI_BV_S4_BY_M2),
       .M3_VIS   (`AXI_NV_S4_BY_M3 | `AXI_BV_S4_BY_M3),
       .M4_VIS   (`AXI_NV_S4_BY_M4 | `AXI_BV_S4_BY_M4),
       .M5_VIS   (`AXI_NV_S4_BY_M5 | `AXI_BV_S4_BY_M5),
       .M6_VIS   (`AXI_NV_S4_BY_M6 | `AXI_BV_S4_BY_M6),
       .M7_VIS   (`AXI_NV_S4_BY_M7 | `AXI_BV_S4_BY_M7),
       .M8_VIS   (`AXI_NV_S4_BY_M8 | `AXI_BV_S4_BY_M8),
       .M9_VIS   (`AXI_NV_S4_BY_M9 | `AXI_BV_S4_BY_M9),
       .M10_VIS   (`AXI_NV_S4_BY_M10 | `AXI_BV_S4_BY_M10),
       .M11_VIS   (`AXI_NV_S4_BY_M11 | `AXI_BV_S4_BY_M11),
       .M12_VIS   (`AXI_NV_S4_BY_M12 | `AXI_BV_S4_BY_M12),
       .M13_VIS   (`AXI_NV_S4_BY_M13 | `AXI_BV_S4_BY_M13),
       .M14_VIS   (`AXI_NV_S4_BY_M14 | `AXI_BV_S4_BY_M14),
       .M15_VIS   (`AXI_NV_S4_BY_M15 | `AXI_BV_S4_BY_M15),
       .M16_VIS   (`AXI_NV_S4_BY_M16 | `AXI_BV_S4_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S4 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s4),
      .ready_i       (U_DW_axi.awready_s4),
      .id_i          (U_DW_axi.awid_s4)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 5.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S5 == 2) & (`AXI_NMV_S5 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 5)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S5 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S5_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S5_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S5),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S5),
       .SNUM    (5),
       .M1_VIS   (`AXI_NV_S5_BY_M1 | `AXI_BV_S5_BY_M1),
       .M2_VIS   (`AXI_NV_S5_BY_M2 | `AXI_BV_S5_BY_M2),
       .M3_VIS   (`AXI_NV_S5_BY_M3 | `AXI_BV_S5_BY_M3),
       .M4_VIS   (`AXI_NV_S5_BY_M4 | `AXI_BV_S5_BY_M4),
       .M5_VIS   (`AXI_NV_S5_BY_M5 | `AXI_BV_S5_BY_M5),
       .M6_VIS   (`AXI_NV_S5_BY_M6 | `AXI_BV_S5_BY_M6),
       .M7_VIS   (`AXI_NV_S5_BY_M7 | `AXI_BV_S5_BY_M7),
       .M8_VIS   (`AXI_NV_S5_BY_M8 | `AXI_BV_S5_BY_M8),
       .M9_VIS   (`AXI_NV_S5_BY_M9 | `AXI_BV_S5_BY_M9),
       .M10_VIS   (`AXI_NV_S5_BY_M10 | `AXI_BV_S5_BY_M10),
       .M11_VIS   (`AXI_NV_S5_BY_M11 | `AXI_BV_S5_BY_M11),
       .M12_VIS   (`AXI_NV_S5_BY_M12 | `AXI_BV_S5_BY_M12),
       .M13_VIS   (`AXI_NV_S5_BY_M13 | `AXI_BV_S5_BY_M13),
       .M14_VIS   (`AXI_NV_S5_BY_M14 | `AXI_BV_S5_BY_M14),
       .M15_VIS   (`AXI_NV_S5_BY_M15 | `AXI_BV_S5_BY_M15),
       .M16_VIS   (`AXI_NV_S5_BY_M16 | `AXI_BV_S5_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S5 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s5),
      .ready_i       (U_DW_axi.arready_s5),
      .id_i          (U_DW_axi.arid_s5)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 5.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S5 == 2) & (`AXI_NMV_S5 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 5)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S5 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S5_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S5_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S5),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S5),
       .SNUM    (5),
       .M1_VIS   (`AXI_NV_S5_BY_M1 | `AXI_BV_S5_BY_M1),
       .M2_VIS   (`AXI_NV_S5_BY_M2 | `AXI_BV_S5_BY_M2),
       .M3_VIS   (`AXI_NV_S5_BY_M3 | `AXI_BV_S5_BY_M3),
       .M4_VIS   (`AXI_NV_S5_BY_M4 | `AXI_BV_S5_BY_M4),
       .M5_VIS   (`AXI_NV_S5_BY_M5 | `AXI_BV_S5_BY_M5),
       .M6_VIS   (`AXI_NV_S5_BY_M6 | `AXI_BV_S5_BY_M6),
       .M7_VIS   (`AXI_NV_S5_BY_M7 | `AXI_BV_S5_BY_M7),
       .M8_VIS   (`AXI_NV_S5_BY_M8 | `AXI_BV_S5_BY_M8),
       .M9_VIS   (`AXI_NV_S5_BY_M9 | `AXI_BV_S5_BY_M9),
       .M10_VIS   (`AXI_NV_S5_BY_M10 | `AXI_BV_S5_BY_M10),
       .M11_VIS   (`AXI_NV_S5_BY_M11 | `AXI_BV_S5_BY_M11),
       .M12_VIS   (`AXI_NV_S5_BY_M12 | `AXI_BV_S5_BY_M12),
       .M13_VIS   (`AXI_NV_S5_BY_M13 | `AXI_BV_S5_BY_M13),
       .M14_VIS   (`AXI_NV_S5_BY_M14 | `AXI_BV_S5_BY_M14),
       .M15_VIS   (`AXI_NV_S5_BY_M15 | `AXI_BV_S5_BY_M15),
       .M16_VIS   (`AXI_NV_S5_BY_M16 | `AXI_BV_S5_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S5 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s5),
      .ready_i       (U_DW_axi.awready_s5),
      .id_i          (U_DW_axi.awid_s5)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 6.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S6 == 2) & (`AXI_NMV_S6 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 6)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S6 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S6_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S6_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S6),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S6),
       .SNUM    (6),
       .M1_VIS   (`AXI_NV_S6_BY_M1 | `AXI_BV_S6_BY_M1),
       .M2_VIS   (`AXI_NV_S6_BY_M2 | `AXI_BV_S6_BY_M2),
       .M3_VIS   (`AXI_NV_S6_BY_M3 | `AXI_BV_S6_BY_M3),
       .M4_VIS   (`AXI_NV_S6_BY_M4 | `AXI_BV_S6_BY_M4),
       .M5_VIS   (`AXI_NV_S6_BY_M5 | `AXI_BV_S6_BY_M5),
       .M6_VIS   (`AXI_NV_S6_BY_M6 | `AXI_BV_S6_BY_M6),
       .M7_VIS   (`AXI_NV_S6_BY_M7 | `AXI_BV_S6_BY_M7),
       .M8_VIS   (`AXI_NV_S6_BY_M8 | `AXI_BV_S6_BY_M8),
       .M9_VIS   (`AXI_NV_S6_BY_M9 | `AXI_BV_S6_BY_M9),
       .M10_VIS   (`AXI_NV_S6_BY_M10 | `AXI_BV_S6_BY_M10),
       .M11_VIS   (`AXI_NV_S6_BY_M11 | `AXI_BV_S6_BY_M11),
       .M12_VIS   (`AXI_NV_S6_BY_M12 | `AXI_BV_S6_BY_M12),
       .M13_VIS   (`AXI_NV_S6_BY_M13 | `AXI_BV_S6_BY_M13),
       .M14_VIS   (`AXI_NV_S6_BY_M14 | `AXI_BV_S6_BY_M14),
       .M15_VIS   (`AXI_NV_S6_BY_M15 | `AXI_BV_S6_BY_M15),
       .M16_VIS   (`AXI_NV_S6_BY_M16 | `AXI_BV_S6_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S6 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s6),
      .ready_i       (U_DW_axi.arready_s6),
      .id_i          (U_DW_axi.arid_s6)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 6.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S6 == 2) & (`AXI_NMV_S6 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 6)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S6 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S6_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S6_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S6),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S6),
       .SNUM    (6),
       .M1_VIS   (`AXI_NV_S6_BY_M1 | `AXI_BV_S6_BY_M1),
       .M2_VIS   (`AXI_NV_S6_BY_M2 | `AXI_BV_S6_BY_M2),
       .M3_VIS   (`AXI_NV_S6_BY_M3 | `AXI_BV_S6_BY_M3),
       .M4_VIS   (`AXI_NV_S6_BY_M4 | `AXI_BV_S6_BY_M4),
       .M5_VIS   (`AXI_NV_S6_BY_M5 | `AXI_BV_S6_BY_M5),
       .M6_VIS   (`AXI_NV_S6_BY_M6 | `AXI_BV_S6_BY_M6),
       .M7_VIS   (`AXI_NV_S6_BY_M7 | `AXI_BV_S6_BY_M7),
       .M8_VIS   (`AXI_NV_S6_BY_M8 | `AXI_BV_S6_BY_M8),
       .M9_VIS   (`AXI_NV_S6_BY_M9 | `AXI_BV_S6_BY_M9),
       .M10_VIS   (`AXI_NV_S6_BY_M10 | `AXI_BV_S6_BY_M10),
       .M11_VIS   (`AXI_NV_S6_BY_M11 | `AXI_BV_S6_BY_M11),
       .M12_VIS   (`AXI_NV_S6_BY_M12 | `AXI_BV_S6_BY_M12),
       .M13_VIS   (`AXI_NV_S6_BY_M13 | `AXI_BV_S6_BY_M13),
       .M14_VIS   (`AXI_NV_S6_BY_M14 | `AXI_BV_S6_BY_M14),
       .M15_VIS   (`AXI_NV_S6_BY_M15 | `AXI_BV_S6_BY_M15),
       .M16_VIS   (`AXI_NV_S6_BY_M16 | `AXI_BV_S6_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S6 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s6),
      .ready_i       (U_DW_axi.awready_s6),
      .id_i          (U_DW_axi.awid_s6)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 7.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S7 == 2) & (`AXI_NMV_S7 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 7)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S7 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S7_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S7_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S7),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S7),
       .SNUM    (7),
       .M1_VIS   (`AXI_NV_S7_BY_M1 | `AXI_BV_S7_BY_M1),
       .M2_VIS   (`AXI_NV_S7_BY_M2 | `AXI_BV_S7_BY_M2),
       .M3_VIS   (`AXI_NV_S7_BY_M3 | `AXI_BV_S7_BY_M3),
       .M4_VIS   (`AXI_NV_S7_BY_M4 | `AXI_BV_S7_BY_M4),
       .M5_VIS   (`AXI_NV_S7_BY_M5 | `AXI_BV_S7_BY_M5),
       .M6_VIS   (`AXI_NV_S7_BY_M6 | `AXI_BV_S7_BY_M6),
       .M7_VIS   (`AXI_NV_S7_BY_M7 | `AXI_BV_S7_BY_M7),
       .M8_VIS   (`AXI_NV_S7_BY_M8 | `AXI_BV_S7_BY_M8),
       .M9_VIS   (`AXI_NV_S7_BY_M9 | `AXI_BV_S7_BY_M9),
       .M10_VIS   (`AXI_NV_S7_BY_M10 | `AXI_BV_S7_BY_M10),
       .M11_VIS   (`AXI_NV_S7_BY_M11 | `AXI_BV_S7_BY_M11),
       .M12_VIS   (`AXI_NV_S7_BY_M12 | `AXI_BV_S7_BY_M12),
       .M13_VIS   (`AXI_NV_S7_BY_M13 | `AXI_BV_S7_BY_M13),
       .M14_VIS   (`AXI_NV_S7_BY_M14 | `AXI_BV_S7_BY_M14),
       .M15_VIS   (`AXI_NV_S7_BY_M15 | `AXI_BV_S7_BY_M15),
       .M16_VIS   (`AXI_NV_S7_BY_M16 | `AXI_BV_S7_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S7 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s7),
      .ready_i       (U_DW_axi.arready_s7),
      .id_i          (U_DW_axi.arid_s7)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 7.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S7 == 2) & (`AXI_NMV_S7 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 7)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S7 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S7_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S7_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S7),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S7),
       .SNUM    (7),
       .M1_VIS   (`AXI_NV_S7_BY_M1 | `AXI_BV_S7_BY_M1),
       .M2_VIS   (`AXI_NV_S7_BY_M2 | `AXI_BV_S7_BY_M2),
       .M3_VIS   (`AXI_NV_S7_BY_M3 | `AXI_BV_S7_BY_M3),
       .M4_VIS   (`AXI_NV_S7_BY_M4 | `AXI_BV_S7_BY_M4),
       .M5_VIS   (`AXI_NV_S7_BY_M5 | `AXI_BV_S7_BY_M5),
       .M6_VIS   (`AXI_NV_S7_BY_M6 | `AXI_BV_S7_BY_M6),
       .M7_VIS   (`AXI_NV_S7_BY_M7 | `AXI_BV_S7_BY_M7),
       .M8_VIS   (`AXI_NV_S7_BY_M8 | `AXI_BV_S7_BY_M8),
       .M9_VIS   (`AXI_NV_S7_BY_M9 | `AXI_BV_S7_BY_M9),
       .M10_VIS   (`AXI_NV_S7_BY_M10 | `AXI_BV_S7_BY_M10),
       .M11_VIS   (`AXI_NV_S7_BY_M11 | `AXI_BV_S7_BY_M11),
       .M12_VIS   (`AXI_NV_S7_BY_M12 | `AXI_BV_S7_BY_M12),
       .M13_VIS   (`AXI_NV_S7_BY_M13 | `AXI_BV_S7_BY_M13),
       .M14_VIS   (`AXI_NV_S7_BY_M14 | `AXI_BV_S7_BY_M14),
       .M15_VIS   (`AXI_NV_S7_BY_M15 | `AXI_BV_S7_BY_M15),
       .M16_VIS   (`AXI_NV_S7_BY_M16 | `AXI_BV_S7_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S7 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s7),
      .ready_i       (U_DW_axi.awready_s7),
      .id_i          (U_DW_axi.awid_s7)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 8.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S8 == 2) & (`AXI_NMV_S8 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 8)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S8 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S8_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S8_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S8),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S8),
       .SNUM    (8),
       .M1_VIS   (`AXI_NV_S8_BY_M1 | `AXI_BV_S8_BY_M1),
       .M2_VIS   (`AXI_NV_S8_BY_M2 | `AXI_BV_S8_BY_M2),
       .M3_VIS   (`AXI_NV_S8_BY_M3 | `AXI_BV_S8_BY_M3),
       .M4_VIS   (`AXI_NV_S8_BY_M4 | `AXI_BV_S8_BY_M4),
       .M5_VIS   (`AXI_NV_S8_BY_M5 | `AXI_BV_S8_BY_M5),
       .M6_VIS   (`AXI_NV_S8_BY_M6 | `AXI_BV_S8_BY_M6),
       .M7_VIS   (`AXI_NV_S8_BY_M7 | `AXI_BV_S8_BY_M7),
       .M8_VIS   (`AXI_NV_S8_BY_M8 | `AXI_BV_S8_BY_M8),
       .M9_VIS   (`AXI_NV_S8_BY_M9 | `AXI_BV_S8_BY_M9),
       .M10_VIS   (`AXI_NV_S8_BY_M10 | `AXI_BV_S8_BY_M10),
       .M11_VIS   (`AXI_NV_S8_BY_M11 | `AXI_BV_S8_BY_M11),
       .M12_VIS   (`AXI_NV_S8_BY_M12 | `AXI_BV_S8_BY_M12),
       .M13_VIS   (`AXI_NV_S8_BY_M13 | `AXI_BV_S8_BY_M13),
       .M14_VIS   (`AXI_NV_S8_BY_M14 | `AXI_BV_S8_BY_M14),
       .M15_VIS   (`AXI_NV_S8_BY_M15 | `AXI_BV_S8_BY_M15),
       .M16_VIS   (`AXI_NV_S8_BY_M16 | `AXI_BV_S8_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S8 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s8),
      .ready_i       (U_DW_axi.arready_s8),
      .id_i          (U_DW_axi.arid_s8)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 8.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S8 == 2) & (`AXI_NMV_S8 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 8)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S8 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S8_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S8_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S8),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S8),
       .SNUM    (8),
       .M1_VIS   (`AXI_NV_S8_BY_M1 | `AXI_BV_S8_BY_M1),
       .M2_VIS   (`AXI_NV_S8_BY_M2 | `AXI_BV_S8_BY_M2),
       .M3_VIS   (`AXI_NV_S8_BY_M3 | `AXI_BV_S8_BY_M3),
       .M4_VIS   (`AXI_NV_S8_BY_M4 | `AXI_BV_S8_BY_M4),
       .M5_VIS   (`AXI_NV_S8_BY_M5 | `AXI_BV_S8_BY_M5),
       .M6_VIS   (`AXI_NV_S8_BY_M6 | `AXI_BV_S8_BY_M6),
       .M7_VIS   (`AXI_NV_S8_BY_M7 | `AXI_BV_S8_BY_M7),
       .M8_VIS   (`AXI_NV_S8_BY_M8 | `AXI_BV_S8_BY_M8),
       .M9_VIS   (`AXI_NV_S8_BY_M9 | `AXI_BV_S8_BY_M9),
       .M10_VIS   (`AXI_NV_S8_BY_M10 | `AXI_BV_S8_BY_M10),
       .M11_VIS   (`AXI_NV_S8_BY_M11 | `AXI_BV_S8_BY_M11),
       .M12_VIS   (`AXI_NV_S8_BY_M12 | `AXI_BV_S8_BY_M12),
       .M13_VIS   (`AXI_NV_S8_BY_M13 | `AXI_BV_S8_BY_M13),
       .M14_VIS   (`AXI_NV_S8_BY_M14 | `AXI_BV_S8_BY_M14),
       .M15_VIS   (`AXI_NV_S8_BY_M15 | `AXI_BV_S8_BY_M15),
       .M16_VIS   (`AXI_NV_S8_BY_M16 | `AXI_BV_S8_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S8 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s8),
      .ready_i       (U_DW_axi.awready_s8),
      .id_i          (U_DW_axi.awid_s8)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 9.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S9 == 2) & (`AXI_NMV_S9 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 9)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S9 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S9_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S9_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S9),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S9),
       .SNUM    (9),
       .M1_VIS   (`AXI_NV_S9_BY_M1 | `AXI_BV_S9_BY_M1),
       .M2_VIS   (`AXI_NV_S9_BY_M2 | `AXI_BV_S9_BY_M2),
       .M3_VIS   (`AXI_NV_S9_BY_M3 | `AXI_BV_S9_BY_M3),
       .M4_VIS   (`AXI_NV_S9_BY_M4 | `AXI_BV_S9_BY_M4),
       .M5_VIS   (`AXI_NV_S9_BY_M5 | `AXI_BV_S9_BY_M5),
       .M6_VIS   (`AXI_NV_S9_BY_M6 | `AXI_BV_S9_BY_M6),
       .M7_VIS   (`AXI_NV_S9_BY_M7 | `AXI_BV_S9_BY_M7),
       .M8_VIS   (`AXI_NV_S9_BY_M8 | `AXI_BV_S9_BY_M8),
       .M9_VIS   (`AXI_NV_S9_BY_M9 | `AXI_BV_S9_BY_M9),
       .M10_VIS   (`AXI_NV_S9_BY_M10 | `AXI_BV_S9_BY_M10),
       .M11_VIS   (`AXI_NV_S9_BY_M11 | `AXI_BV_S9_BY_M11),
       .M12_VIS   (`AXI_NV_S9_BY_M12 | `AXI_BV_S9_BY_M12),
       .M13_VIS   (`AXI_NV_S9_BY_M13 | `AXI_BV_S9_BY_M13),
       .M14_VIS   (`AXI_NV_S9_BY_M14 | `AXI_BV_S9_BY_M14),
       .M15_VIS   (`AXI_NV_S9_BY_M15 | `AXI_BV_S9_BY_M15),
       .M16_VIS   (`AXI_NV_S9_BY_M16 | `AXI_BV_S9_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S9 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s9),
      .ready_i       (U_DW_axi.arready_s9),
      .id_i          (U_DW_axi.arid_s9)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 9.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S9 == 2) & (`AXI_NMV_S9 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 9)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S9 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S9_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S9_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S9),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S9),
       .SNUM    (9),
       .M1_VIS   (`AXI_NV_S9_BY_M1 | `AXI_BV_S9_BY_M1),
       .M2_VIS   (`AXI_NV_S9_BY_M2 | `AXI_BV_S9_BY_M2),
       .M3_VIS   (`AXI_NV_S9_BY_M3 | `AXI_BV_S9_BY_M3),
       .M4_VIS   (`AXI_NV_S9_BY_M4 | `AXI_BV_S9_BY_M4),
       .M5_VIS   (`AXI_NV_S9_BY_M5 | `AXI_BV_S9_BY_M5),
       .M6_VIS   (`AXI_NV_S9_BY_M6 | `AXI_BV_S9_BY_M6),
       .M7_VIS   (`AXI_NV_S9_BY_M7 | `AXI_BV_S9_BY_M7),
       .M8_VIS   (`AXI_NV_S9_BY_M8 | `AXI_BV_S9_BY_M8),
       .M9_VIS   (`AXI_NV_S9_BY_M9 | `AXI_BV_S9_BY_M9),
       .M10_VIS   (`AXI_NV_S9_BY_M10 | `AXI_BV_S9_BY_M10),
       .M11_VIS   (`AXI_NV_S9_BY_M11 | `AXI_BV_S9_BY_M11),
       .M12_VIS   (`AXI_NV_S9_BY_M12 | `AXI_BV_S9_BY_M12),
       .M13_VIS   (`AXI_NV_S9_BY_M13 | `AXI_BV_S9_BY_M13),
       .M14_VIS   (`AXI_NV_S9_BY_M14 | `AXI_BV_S9_BY_M14),
       .M15_VIS   (`AXI_NV_S9_BY_M15 | `AXI_BV_S9_BY_M15),
       .M16_VIS   (`AXI_NV_S9_BY_M16 | `AXI_BV_S9_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S9 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s9),
      .ready_i       (U_DW_axi.awready_s9),
      .id_i          (U_DW_axi.awid_s9)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 10.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S10 == 2) & (`AXI_NMV_S10 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 10)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S10 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S10_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S10_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S10),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S10),
       .SNUM    (10),
       .M1_VIS   (`AXI_NV_S10_BY_M1 | `AXI_BV_S10_BY_M1),
       .M2_VIS   (`AXI_NV_S10_BY_M2 | `AXI_BV_S10_BY_M2),
       .M3_VIS   (`AXI_NV_S10_BY_M3 | `AXI_BV_S10_BY_M3),
       .M4_VIS   (`AXI_NV_S10_BY_M4 | `AXI_BV_S10_BY_M4),
       .M5_VIS   (`AXI_NV_S10_BY_M5 | `AXI_BV_S10_BY_M5),
       .M6_VIS   (`AXI_NV_S10_BY_M6 | `AXI_BV_S10_BY_M6),
       .M7_VIS   (`AXI_NV_S10_BY_M7 | `AXI_BV_S10_BY_M7),
       .M8_VIS   (`AXI_NV_S10_BY_M8 | `AXI_BV_S10_BY_M8),
       .M9_VIS   (`AXI_NV_S10_BY_M9 | `AXI_BV_S10_BY_M9),
       .M10_VIS   (`AXI_NV_S10_BY_M10 | `AXI_BV_S10_BY_M10),
       .M11_VIS   (`AXI_NV_S10_BY_M11 | `AXI_BV_S10_BY_M11),
       .M12_VIS   (`AXI_NV_S10_BY_M12 | `AXI_BV_S10_BY_M12),
       .M13_VIS   (`AXI_NV_S10_BY_M13 | `AXI_BV_S10_BY_M13),
       .M14_VIS   (`AXI_NV_S10_BY_M14 | `AXI_BV_S10_BY_M14),
       .M15_VIS   (`AXI_NV_S10_BY_M15 | `AXI_BV_S10_BY_M15),
       .M16_VIS   (`AXI_NV_S10_BY_M16 | `AXI_BV_S10_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S10 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s10),
      .ready_i       (U_DW_axi.arready_s10),
      .id_i          (U_DW_axi.arid_s10)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 10.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S10 == 2) & (`AXI_NMV_S10 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 10)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S10 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S10_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S10_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S10),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S10),
       .SNUM    (10),
       .M1_VIS   (`AXI_NV_S10_BY_M1 | `AXI_BV_S10_BY_M1),
       .M2_VIS   (`AXI_NV_S10_BY_M2 | `AXI_BV_S10_BY_M2),
       .M3_VIS   (`AXI_NV_S10_BY_M3 | `AXI_BV_S10_BY_M3),
       .M4_VIS   (`AXI_NV_S10_BY_M4 | `AXI_BV_S10_BY_M4),
       .M5_VIS   (`AXI_NV_S10_BY_M5 | `AXI_BV_S10_BY_M5),
       .M6_VIS   (`AXI_NV_S10_BY_M6 | `AXI_BV_S10_BY_M6),
       .M7_VIS   (`AXI_NV_S10_BY_M7 | `AXI_BV_S10_BY_M7),
       .M8_VIS   (`AXI_NV_S10_BY_M8 | `AXI_BV_S10_BY_M8),
       .M9_VIS   (`AXI_NV_S10_BY_M9 | `AXI_BV_S10_BY_M9),
       .M10_VIS   (`AXI_NV_S10_BY_M10 | `AXI_BV_S10_BY_M10),
       .M11_VIS   (`AXI_NV_S10_BY_M11 | `AXI_BV_S10_BY_M11),
       .M12_VIS   (`AXI_NV_S10_BY_M12 | `AXI_BV_S10_BY_M12),
       .M13_VIS   (`AXI_NV_S10_BY_M13 | `AXI_BV_S10_BY_M13),
       .M14_VIS   (`AXI_NV_S10_BY_M14 | `AXI_BV_S10_BY_M14),
       .M15_VIS   (`AXI_NV_S10_BY_M15 | `AXI_BV_S10_BY_M15),
       .M16_VIS   (`AXI_NV_S10_BY_M16 | `AXI_BV_S10_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S10 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s10),
      .ready_i       (U_DW_axi.awready_s10),
      .id_i          (U_DW_axi.awid_s10)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 11.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S11 == 2) & (`AXI_NMV_S11 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 11)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S11 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S11_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S11_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S11),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S11),
       .SNUM    (11),
       .M1_VIS   (`AXI_NV_S11_BY_M1 | `AXI_BV_S11_BY_M1),
       .M2_VIS   (`AXI_NV_S11_BY_M2 | `AXI_BV_S11_BY_M2),
       .M3_VIS   (`AXI_NV_S11_BY_M3 | `AXI_BV_S11_BY_M3),
       .M4_VIS   (`AXI_NV_S11_BY_M4 | `AXI_BV_S11_BY_M4),
       .M5_VIS   (`AXI_NV_S11_BY_M5 | `AXI_BV_S11_BY_M5),
       .M6_VIS   (`AXI_NV_S11_BY_M6 | `AXI_BV_S11_BY_M6),
       .M7_VIS   (`AXI_NV_S11_BY_M7 | `AXI_BV_S11_BY_M7),
       .M8_VIS   (`AXI_NV_S11_BY_M8 | `AXI_BV_S11_BY_M8),
       .M9_VIS   (`AXI_NV_S11_BY_M9 | `AXI_BV_S11_BY_M9),
       .M10_VIS   (`AXI_NV_S11_BY_M10 | `AXI_BV_S11_BY_M10),
       .M11_VIS   (`AXI_NV_S11_BY_M11 | `AXI_BV_S11_BY_M11),
       .M12_VIS   (`AXI_NV_S11_BY_M12 | `AXI_BV_S11_BY_M12),
       .M13_VIS   (`AXI_NV_S11_BY_M13 | `AXI_BV_S11_BY_M13),
       .M14_VIS   (`AXI_NV_S11_BY_M14 | `AXI_BV_S11_BY_M14),
       .M15_VIS   (`AXI_NV_S11_BY_M15 | `AXI_BV_S11_BY_M15),
       .M16_VIS   (`AXI_NV_S11_BY_M16 | `AXI_BV_S11_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S11 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s11),
      .ready_i       (U_DW_axi.arready_s11),
      .id_i          (U_DW_axi.arid_s11)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 11.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S11 == 2) & (`AXI_NMV_S11 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 11)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S11 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S11_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S11_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S11),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S11),
       .SNUM    (11),
       .M1_VIS   (`AXI_NV_S11_BY_M1 | `AXI_BV_S11_BY_M1),
       .M2_VIS   (`AXI_NV_S11_BY_M2 | `AXI_BV_S11_BY_M2),
       .M3_VIS   (`AXI_NV_S11_BY_M3 | `AXI_BV_S11_BY_M3),
       .M4_VIS   (`AXI_NV_S11_BY_M4 | `AXI_BV_S11_BY_M4),
       .M5_VIS   (`AXI_NV_S11_BY_M5 | `AXI_BV_S11_BY_M5),
       .M6_VIS   (`AXI_NV_S11_BY_M6 | `AXI_BV_S11_BY_M6),
       .M7_VIS   (`AXI_NV_S11_BY_M7 | `AXI_BV_S11_BY_M7),
       .M8_VIS   (`AXI_NV_S11_BY_M8 | `AXI_BV_S11_BY_M8),
       .M9_VIS   (`AXI_NV_S11_BY_M9 | `AXI_BV_S11_BY_M9),
       .M10_VIS   (`AXI_NV_S11_BY_M10 | `AXI_BV_S11_BY_M10),
       .M11_VIS   (`AXI_NV_S11_BY_M11 | `AXI_BV_S11_BY_M11),
       .M12_VIS   (`AXI_NV_S11_BY_M12 | `AXI_BV_S11_BY_M12),
       .M13_VIS   (`AXI_NV_S11_BY_M13 | `AXI_BV_S11_BY_M13),
       .M14_VIS   (`AXI_NV_S11_BY_M14 | `AXI_BV_S11_BY_M14),
       .M15_VIS   (`AXI_NV_S11_BY_M15 | `AXI_BV_S11_BY_M15),
       .M16_VIS   (`AXI_NV_S11_BY_M16 | `AXI_BV_S11_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S11 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s11),
      .ready_i       (U_DW_axi.awready_s11),
      .id_i          (U_DW_axi.awid_s11)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 12.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S12 == 2) & (`AXI_NMV_S12 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 12)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S12 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S12_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S12_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S12),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S12),
       .SNUM    (12),
       .M1_VIS   (`AXI_NV_S12_BY_M1 | `AXI_BV_S12_BY_M1),
       .M2_VIS   (`AXI_NV_S12_BY_M2 | `AXI_BV_S12_BY_M2),
       .M3_VIS   (`AXI_NV_S12_BY_M3 | `AXI_BV_S12_BY_M3),
       .M4_VIS   (`AXI_NV_S12_BY_M4 | `AXI_BV_S12_BY_M4),
       .M5_VIS   (`AXI_NV_S12_BY_M5 | `AXI_BV_S12_BY_M5),
       .M6_VIS   (`AXI_NV_S12_BY_M6 | `AXI_BV_S12_BY_M6),
       .M7_VIS   (`AXI_NV_S12_BY_M7 | `AXI_BV_S12_BY_M7),
       .M8_VIS   (`AXI_NV_S12_BY_M8 | `AXI_BV_S12_BY_M8),
       .M9_VIS   (`AXI_NV_S12_BY_M9 | `AXI_BV_S12_BY_M9),
       .M10_VIS   (`AXI_NV_S12_BY_M10 | `AXI_BV_S12_BY_M10),
       .M11_VIS   (`AXI_NV_S12_BY_M11 | `AXI_BV_S12_BY_M11),
       .M12_VIS   (`AXI_NV_S12_BY_M12 | `AXI_BV_S12_BY_M12),
       .M13_VIS   (`AXI_NV_S12_BY_M13 | `AXI_BV_S12_BY_M13),
       .M14_VIS   (`AXI_NV_S12_BY_M14 | `AXI_BV_S12_BY_M14),
       .M15_VIS   (`AXI_NV_S12_BY_M15 | `AXI_BV_S12_BY_M15),
       .M16_VIS   (`AXI_NV_S12_BY_M16 | `AXI_BV_S12_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S12 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s12),
      .ready_i       (U_DW_axi.arready_s12),
      .id_i          (U_DW_axi.arid_s12)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 12.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S12 == 2) & (`AXI_NMV_S12 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 12)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S12 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S12_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S12_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S12),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S12),
       .SNUM    (12),
       .M1_VIS   (`AXI_NV_S12_BY_M1 | `AXI_BV_S12_BY_M1),
       .M2_VIS   (`AXI_NV_S12_BY_M2 | `AXI_BV_S12_BY_M2),
       .M3_VIS   (`AXI_NV_S12_BY_M3 | `AXI_BV_S12_BY_M3),
       .M4_VIS   (`AXI_NV_S12_BY_M4 | `AXI_BV_S12_BY_M4),
       .M5_VIS   (`AXI_NV_S12_BY_M5 | `AXI_BV_S12_BY_M5),
       .M6_VIS   (`AXI_NV_S12_BY_M6 | `AXI_BV_S12_BY_M6),
       .M7_VIS   (`AXI_NV_S12_BY_M7 | `AXI_BV_S12_BY_M7),
       .M8_VIS   (`AXI_NV_S12_BY_M8 | `AXI_BV_S12_BY_M8),
       .M9_VIS   (`AXI_NV_S12_BY_M9 | `AXI_BV_S12_BY_M9),
       .M10_VIS   (`AXI_NV_S12_BY_M10 | `AXI_BV_S12_BY_M10),
       .M11_VIS   (`AXI_NV_S12_BY_M11 | `AXI_BV_S12_BY_M11),
       .M12_VIS   (`AXI_NV_S12_BY_M12 | `AXI_BV_S12_BY_M12),
       .M13_VIS   (`AXI_NV_S12_BY_M13 | `AXI_BV_S12_BY_M13),
       .M14_VIS   (`AXI_NV_S12_BY_M14 | `AXI_BV_S12_BY_M14),
       .M15_VIS   (`AXI_NV_S12_BY_M15 | `AXI_BV_S12_BY_M15),
       .M16_VIS   (`AXI_NV_S12_BY_M16 | `AXI_BV_S12_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S12 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s12),
      .ready_i       (U_DW_axi.awready_s12),
      .id_i          (U_DW_axi.awid_s12)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 13.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S13 == 2) & (`AXI_NMV_S13 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 13)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S13 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S13_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S13_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S13),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S13),
       .SNUM    (13),
       .M1_VIS   (`AXI_NV_S13_BY_M1 | `AXI_BV_S13_BY_M1),
       .M2_VIS   (`AXI_NV_S13_BY_M2 | `AXI_BV_S13_BY_M2),
       .M3_VIS   (`AXI_NV_S13_BY_M3 | `AXI_BV_S13_BY_M3),
       .M4_VIS   (`AXI_NV_S13_BY_M4 | `AXI_BV_S13_BY_M4),
       .M5_VIS   (`AXI_NV_S13_BY_M5 | `AXI_BV_S13_BY_M5),
       .M6_VIS   (`AXI_NV_S13_BY_M6 | `AXI_BV_S13_BY_M6),
       .M7_VIS   (`AXI_NV_S13_BY_M7 | `AXI_BV_S13_BY_M7),
       .M8_VIS   (`AXI_NV_S13_BY_M8 | `AXI_BV_S13_BY_M8),
       .M9_VIS   (`AXI_NV_S13_BY_M9 | `AXI_BV_S13_BY_M9),
       .M10_VIS   (`AXI_NV_S13_BY_M10 | `AXI_BV_S13_BY_M10),
       .M11_VIS   (`AXI_NV_S13_BY_M11 | `AXI_BV_S13_BY_M11),
       .M12_VIS   (`AXI_NV_S13_BY_M12 | `AXI_BV_S13_BY_M12),
       .M13_VIS   (`AXI_NV_S13_BY_M13 | `AXI_BV_S13_BY_M13),
       .M14_VIS   (`AXI_NV_S13_BY_M14 | `AXI_BV_S13_BY_M14),
       .M15_VIS   (`AXI_NV_S13_BY_M15 | `AXI_BV_S13_BY_M15),
       .M16_VIS   (`AXI_NV_S13_BY_M16 | `AXI_BV_S13_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S13 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s13),
      .ready_i       (U_DW_axi.arready_s13),
      .id_i          (U_DW_axi.arid_s13)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 13.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S13 == 2) & (`AXI_NMV_S13 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 13)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S13 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S13_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S13_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S13),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S13),
       .SNUM    (13),
       .M1_VIS   (`AXI_NV_S13_BY_M1 | `AXI_BV_S13_BY_M1),
       .M2_VIS   (`AXI_NV_S13_BY_M2 | `AXI_BV_S13_BY_M2),
       .M3_VIS   (`AXI_NV_S13_BY_M3 | `AXI_BV_S13_BY_M3),
       .M4_VIS   (`AXI_NV_S13_BY_M4 | `AXI_BV_S13_BY_M4),
       .M5_VIS   (`AXI_NV_S13_BY_M5 | `AXI_BV_S13_BY_M5),
       .M6_VIS   (`AXI_NV_S13_BY_M6 | `AXI_BV_S13_BY_M6),
       .M7_VIS   (`AXI_NV_S13_BY_M7 | `AXI_BV_S13_BY_M7),
       .M8_VIS   (`AXI_NV_S13_BY_M8 | `AXI_BV_S13_BY_M8),
       .M9_VIS   (`AXI_NV_S13_BY_M9 | `AXI_BV_S13_BY_M9),
       .M10_VIS   (`AXI_NV_S13_BY_M10 | `AXI_BV_S13_BY_M10),
       .M11_VIS   (`AXI_NV_S13_BY_M11 | `AXI_BV_S13_BY_M11),
       .M12_VIS   (`AXI_NV_S13_BY_M12 | `AXI_BV_S13_BY_M12),
       .M13_VIS   (`AXI_NV_S13_BY_M13 | `AXI_BV_S13_BY_M13),
       .M14_VIS   (`AXI_NV_S13_BY_M14 | `AXI_BV_S13_BY_M14),
       .M15_VIS   (`AXI_NV_S13_BY_M15 | `AXI_BV_S13_BY_M15),
       .M16_VIS   (`AXI_NV_S13_BY_M16 | `AXI_BV_S13_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S13 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s13),
      .ready_i       (U_DW_axi.awready_s13),
      .id_i          (U_DW_axi.awid_s13)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 14.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S14 == 2) & (`AXI_NMV_S14 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 14)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S14 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S14_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S14_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S14),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S14),
       .SNUM    (14),
       .M1_VIS   (`AXI_NV_S14_BY_M1 | `AXI_BV_S14_BY_M1),
       .M2_VIS   (`AXI_NV_S14_BY_M2 | `AXI_BV_S14_BY_M2),
       .M3_VIS   (`AXI_NV_S14_BY_M3 | `AXI_BV_S14_BY_M3),
       .M4_VIS   (`AXI_NV_S14_BY_M4 | `AXI_BV_S14_BY_M4),
       .M5_VIS   (`AXI_NV_S14_BY_M5 | `AXI_BV_S14_BY_M5),
       .M6_VIS   (`AXI_NV_S14_BY_M6 | `AXI_BV_S14_BY_M6),
       .M7_VIS   (`AXI_NV_S14_BY_M7 | `AXI_BV_S14_BY_M7),
       .M8_VIS   (`AXI_NV_S14_BY_M8 | `AXI_BV_S14_BY_M8),
       .M9_VIS   (`AXI_NV_S14_BY_M9 | `AXI_BV_S14_BY_M9),
       .M10_VIS   (`AXI_NV_S14_BY_M10 | `AXI_BV_S14_BY_M10),
       .M11_VIS   (`AXI_NV_S14_BY_M11 | `AXI_BV_S14_BY_M11),
       .M12_VIS   (`AXI_NV_S14_BY_M12 | `AXI_BV_S14_BY_M12),
       .M13_VIS   (`AXI_NV_S14_BY_M13 | `AXI_BV_S14_BY_M13),
       .M14_VIS   (`AXI_NV_S14_BY_M14 | `AXI_BV_S14_BY_M14),
       .M15_VIS   (`AXI_NV_S14_BY_M15 | `AXI_BV_S14_BY_M15),
       .M16_VIS   (`AXI_NV_S14_BY_M16 | `AXI_BV_S14_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S14 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s14),
      .ready_i       (U_DW_axi.arready_s14),
      .id_i          (U_DW_axi.arid_s14)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 14.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S14 == 2) & (`AXI_NMV_S14 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 14)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S14 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S14_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S14_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S14),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S14),
       .SNUM    (14),
       .M1_VIS   (`AXI_NV_S14_BY_M1 | `AXI_BV_S14_BY_M1),
       .M2_VIS   (`AXI_NV_S14_BY_M2 | `AXI_BV_S14_BY_M2),
       .M3_VIS   (`AXI_NV_S14_BY_M3 | `AXI_BV_S14_BY_M3),
       .M4_VIS   (`AXI_NV_S14_BY_M4 | `AXI_BV_S14_BY_M4),
       .M5_VIS   (`AXI_NV_S14_BY_M5 | `AXI_BV_S14_BY_M5),
       .M6_VIS   (`AXI_NV_S14_BY_M6 | `AXI_BV_S14_BY_M6),
       .M7_VIS   (`AXI_NV_S14_BY_M7 | `AXI_BV_S14_BY_M7),
       .M8_VIS   (`AXI_NV_S14_BY_M8 | `AXI_BV_S14_BY_M8),
       .M9_VIS   (`AXI_NV_S14_BY_M9 | `AXI_BV_S14_BY_M9),
       .M10_VIS   (`AXI_NV_S14_BY_M10 | `AXI_BV_S14_BY_M10),
       .M11_VIS   (`AXI_NV_S14_BY_M11 | `AXI_BV_S14_BY_M11),
       .M12_VIS   (`AXI_NV_S14_BY_M12 | `AXI_BV_S14_BY_M12),
       .M13_VIS   (`AXI_NV_S14_BY_M13 | `AXI_BV_S14_BY_M13),
       .M14_VIS   (`AXI_NV_S14_BY_M14 | `AXI_BV_S14_BY_M14),
       .M15_VIS   (`AXI_NV_S14_BY_M15 | `AXI_BV_S14_BY_M15),
       .M16_VIS   (`AXI_NV_S14_BY_M16 | `AXI_BV_S14_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S14 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s14),
      .ready_i       (U_DW_axi.awready_s14),
      .id_i          (U_DW_axi.awid_s14)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 15.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S15 == 2) & (`AXI_NMV_S15 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 15)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S15 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S15_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S15_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S15),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S15),
       .SNUM    (15),
       .M1_VIS   (`AXI_NV_S15_BY_M1 | `AXI_BV_S15_BY_M1),
       .M2_VIS   (`AXI_NV_S15_BY_M2 | `AXI_BV_S15_BY_M2),
       .M3_VIS   (`AXI_NV_S15_BY_M3 | `AXI_BV_S15_BY_M3),
       .M4_VIS   (`AXI_NV_S15_BY_M4 | `AXI_BV_S15_BY_M4),
       .M5_VIS   (`AXI_NV_S15_BY_M5 | `AXI_BV_S15_BY_M5),
       .M6_VIS   (`AXI_NV_S15_BY_M6 | `AXI_BV_S15_BY_M6),
       .M7_VIS   (`AXI_NV_S15_BY_M7 | `AXI_BV_S15_BY_M7),
       .M8_VIS   (`AXI_NV_S15_BY_M8 | `AXI_BV_S15_BY_M8),
       .M9_VIS   (`AXI_NV_S15_BY_M9 | `AXI_BV_S15_BY_M9),
       .M10_VIS   (`AXI_NV_S15_BY_M10 | `AXI_BV_S15_BY_M10),
       .M11_VIS   (`AXI_NV_S15_BY_M11 | `AXI_BV_S15_BY_M11),
       .M12_VIS   (`AXI_NV_S15_BY_M12 | `AXI_BV_S15_BY_M12),
       .M13_VIS   (`AXI_NV_S15_BY_M13 | `AXI_BV_S15_BY_M13),
       .M14_VIS   (`AXI_NV_S15_BY_M14 | `AXI_BV_S15_BY_M14),
       .M15_VIS   (`AXI_NV_S15_BY_M15 | `AXI_BV_S15_BY_M15),
       .M16_VIS   (`AXI_NV_S15_BY_M16 | `AXI_BV_S15_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S15 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s15),
      .ready_i       (U_DW_axi.arready_s15),
      .id_i          (U_DW_axi.arid_s15)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 15.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S15 == 2) & (`AXI_NMV_S15 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 15)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S15 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S15_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S15_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S15),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S15),
       .SNUM    (15),
       .M1_VIS   (`AXI_NV_S15_BY_M1 | `AXI_BV_S15_BY_M1),
       .M2_VIS   (`AXI_NV_S15_BY_M2 | `AXI_BV_S15_BY_M2),
       .M3_VIS   (`AXI_NV_S15_BY_M3 | `AXI_BV_S15_BY_M3),
       .M4_VIS   (`AXI_NV_S15_BY_M4 | `AXI_BV_S15_BY_M4),
       .M5_VIS   (`AXI_NV_S15_BY_M5 | `AXI_BV_S15_BY_M5),
       .M6_VIS   (`AXI_NV_S15_BY_M6 | `AXI_BV_S15_BY_M6),
       .M7_VIS   (`AXI_NV_S15_BY_M7 | `AXI_BV_S15_BY_M7),
       .M8_VIS   (`AXI_NV_S15_BY_M8 | `AXI_BV_S15_BY_M8),
       .M9_VIS   (`AXI_NV_S15_BY_M9 | `AXI_BV_S15_BY_M9),
       .M10_VIS   (`AXI_NV_S15_BY_M10 | `AXI_BV_S15_BY_M10),
       .M11_VIS   (`AXI_NV_S15_BY_M11 | `AXI_BV_S15_BY_M11),
       .M12_VIS   (`AXI_NV_S15_BY_M12 | `AXI_BV_S15_BY_M12),
       .M13_VIS   (`AXI_NV_S15_BY_M13 | `AXI_BV_S15_BY_M13),
       .M14_VIS   (`AXI_NV_S15_BY_M14 | `AXI_BV_S15_BY_M14),
       .M15_VIS   (`AXI_NV_S15_BY_M15 | `AXI_BV_S15_BY_M15),
       .M16_VIS   (`AXI_NV_S15_BY_M16 | `AXI_BV_S15_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S15 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s15),
      .ready_i       (U_DW_axi.awready_s15),
      .id_i          (U_DW_axi.awid_s15)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AR, slave 16.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AR_ARB_TYPE_S16 == 2) & (`AXI_NMV_S16 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 16)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AR_MCA_EN_S16 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S16_ON_AR_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AR_S16_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S16),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S16),
       .SNUM    (16),
       .M1_VIS   (`AXI_NV_S16_BY_M1 | `AXI_BV_S16_BY_M1),
       .M2_VIS   (`AXI_NV_S16_BY_M2 | `AXI_BV_S16_BY_M2),
       .M3_VIS   (`AXI_NV_S16_BY_M3 | `AXI_BV_S16_BY_M3),
       .M4_VIS   (`AXI_NV_S16_BY_M4 | `AXI_BV_S16_BY_M4),
       .M5_VIS   (`AXI_NV_S16_BY_M5 | `AXI_BV_S16_BY_M5),
       .M6_VIS   (`AXI_NV_S16_BY_M6 | `AXI_BV_S16_BY_M6),
       .M7_VIS   (`AXI_NV_S16_BY_M7 | `AXI_BV_S16_BY_M7),
       .M8_VIS   (`AXI_NV_S16_BY_M8 | `AXI_BV_S16_BY_M8),
       .M9_VIS   (`AXI_NV_S16_BY_M9 | `AXI_BV_S16_BY_M9),
       .M10_VIS   (`AXI_NV_S16_BY_M10 | `AXI_BV_S16_BY_M10),
       .M11_VIS   (`AXI_NV_S16_BY_M11 | `AXI_BV_S16_BY_M11),
       .M12_VIS   (`AXI_NV_S16_BY_M12 | `AXI_BV_S16_BY_M12),
       .M13_VIS   (`AXI_NV_S16_BY_M13 | `AXI_BV_S16_BY_M13),
       .M14_VIS   (`AXI_NV_S16_BY_M14 | `AXI_BV_S16_BY_M14),
       .M15_VIS   (`AXI_NV_S16_BY_M15 | `AXI_BV_S16_BY_M15),
       .M16_VIS   (`AXI_NV_S16_BY_M16 | `AXI_BV_S16_BY_M16),
       .WCH     (0)
    )
    U_tb_fae_arb_mon_AR_S16 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.arvalid_s16),
      .ready_i       (U_DW_axi.arready_s16),
      .id_i          (U_DW_axi.arid_s16)
    );
  end
endgenerate


// Fair Among Equals Arbiter checker for AW, slave 16.
generate 
  if(  // Instantiate the checker only if a fair among equals arbiter exists
       // at this arbitration point.
       (`AXI_AW_ARB_TYPE_S16 == 2) & (`AXI_NMV_S16 > 1)
       // This slave must exist.      
       & (`AXI_NUM_SLAVES >= 16)
       // Checker does not support multi cycle arbitration.
       & (`AXI_AW_MCA_EN_S16 == 0)      
       // The dedicated layer for this slave must exist.
       & (`AXI_S16_ON_AW_SHARED_ONLY_VAL == 0) 
       // The dedicated layer must not have a link with the shared layer.
       & (`AXI_AW_S16_HAS_SHRD_DDCTD_LNK_VAL == 0)
       // This checker does not support locking.
       & (`AXI_HAS_LOCKING == 0)
  ) 
  begin
    tb_fae_arb_mon 
    #( .N       (`AXI_NMV_S16),
       .PRIOR_W (`AXI_MST_PRIORITY_W),
       .INDEX_W (`AXI_LOG2_NMV_S16),
       .SNUM    (16),
       .M1_VIS   (`AXI_NV_S16_BY_M1 | `AXI_BV_S16_BY_M1),
       .M2_VIS   (`AXI_NV_S16_BY_M2 | `AXI_BV_S16_BY_M2),
       .M3_VIS   (`AXI_NV_S16_BY_M3 | `AXI_BV_S16_BY_M3),
       .M4_VIS   (`AXI_NV_S16_BY_M4 | `AXI_BV_S16_BY_M4),
       .M5_VIS   (`AXI_NV_S16_BY_M5 | `AXI_BV_S16_BY_M5),
       .M6_VIS   (`AXI_NV_S16_BY_M6 | `AXI_BV_S16_BY_M6),
       .M7_VIS   (`AXI_NV_S16_BY_M7 | `AXI_BV_S16_BY_M7),
       .M8_VIS   (`AXI_NV_S16_BY_M8 | `AXI_BV_S16_BY_M8),
       .M9_VIS   (`AXI_NV_S16_BY_M9 | `AXI_BV_S16_BY_M9),
       .M10_VIS   (`AXI_NV_S16_BY_M10 | `AXI_BV_S16_BY_M10),
       .M11_VIS   (`AXI_NV_S16_BY_M11 | `AXI_BV_S16_BY_M11),
       .M12_VIS   (`AXI_NV_S16_BY_M12 | `AXI_BV_S16_BY_M12),
       .M13_VIS   (`AXI_NV_S16_BY_M13 | `AXI_BV_S16_BY_M13),
       .M14_VIS   (`AXI_NV_S16_BY_M14 | `AXI_BV_S16_BY_M14),
       .M15_VIS   (`AXI_NV_S16_BY_M15 | `AXI_BV_S16_BY_M15),
       .M16_VIS   (`AXI_NV_S16_BY_M16 | `AXI_BV_S16_BY_M16),
       .WCH     (1)
    )
    U_tb_fae_arb_mon_AW_S16 (
      .aclk          (aclklp),
      .aresetn       (aresetn),

      .req_i         (U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.request),
      .ext_priors_i  (U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.prior),
      .enable_i      (U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.gen_arb_type_2t.U_DW_axi_arbiter_fae.enable),

      .valid_i       (U_DW_axi.awvalid_s16),
      .ready_i       (U_DW_axi.awready_s16),
      .id_i          (U_DW_axi.awid_s16)
    );
  end
endgenerate

