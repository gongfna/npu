`ifdef AXI_HAS_M1
`ifdef AXI_M1_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(`AXI_IS_ICM_M1,
  `AXI_RI_LIMIT_M1,
  1 // Master number
 )
U_tb_ri_limit_checker_m1 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m1),
  .ready_i   (U_DW_axi.rready_m1),
  .last_i    (U_DW_axi.rlast_m1),
  .id_i      (U_DW_axi.rid_m1)
);
`endif
`endif

`ifdef AXI_HAS_M2
`ifdef AXI_M2_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(`AXI_IS_ICM_M2,
  `AXI_RI_LIMIT_M2,
  2 // Master number
 )
U_tb_ri_limit_checker_m2 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m2),
  .ready_i   (U_DW_axi.rready_m2),
  .last_i    (U_DW_axi.rlast_m2),
  .id_i      (U_DW_axi.rid_m2)
);
`endif
`endif

`ifdef AXI_HAS_M3
`ifdef AXI_M3_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(`AXI_IS_ICM_M3,
  `AXI_RI_LIMIT_M3,
  3 // Master number
 )
U_tb_ri_limit_checker_m3 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m3),
  .ready_i   (U_DW_axi.rready_m3),
  .last_i    (U_DW_axi.rlast_m3),
  .id_i      (U_DW_axi.rid_m3)
);
`endif
`endif

`ifdef AXI_HAS_M4
`ifdef AXI_M4_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(`AXI_IS_ICM_M4,
  `AXI_RI_LIMIT_M4,
  4 // Master number
 )
U_tb_ri_limit_checker_m4 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m4),
  .ready_i   (U_DW_axi.rready_m4),
  .last_i    (U_DW_axi.rlast_m4),
  .id_i      (U_DW_axi.rid_m4)
);
`endif
`endif

`ifdef AXI_HAS_M5
`ifdef AXI_M5_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0, // Is ICM ?
  `AXI_RI_LIMIT_M5,
  5  // Master number.
 )
U_tb_ri_limit_checker_m5 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m5),
  .ready_i   (U_DW_axi.rready_m5),
  .last_i    (U_DW_axi.rlast_m5),
  .id_i      (U_DW_axi.rid_m5)
);
`endif
`endif

`ifdef AXI_HAS_M6
`ifdef AXI_M6_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0, // Is ICM ?
  `AXI_RI_LIMIT_M6,
  6  // Master number.
 )
U_tb_ri_limit_checker_m6 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m6),
  .ready_i   (U_DW_axi.rready_m6),
  .last_i    (U_DW_axi.rlast_m6),
  .id_i      (U_DW_axi.rid_m6)
);
`endif
`endif

`ifdef AXI_HAS_M7
`ifdef AXI_M7_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0, // Is ICM ?
  `AXI_RI_LIMIT_M7,
  7  // Master number.
 )
U_tb_ri_limit_checker_m7 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m7),
  .ready_i   (U_DW_axi.rready_m7),
  .last_i    (U_DW_axi.rlast_m7),
  .id_i      (U_DW_axi.rid_m7)
);
`endif
`endif

`ifdef AXI_HAS_M8
`ifdef AXI_M8_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0, // Is ICM ?
  `AXI_RI_LIMIT_M8,
  8  // Master number.
 )
U_tb_ri_limit_checker_m8 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m8),
  .ready_i   (U_DW_axi.rready_m8),
  .last_i    (U_DW_axi.rlast_m8),
  .id_i      (U_DW_axi.rid_m8)
);
`endif
`endif

`ifdef AXI_HAS_M9
`ifdef AXI_M9_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0, // Is ICM ?
  `AXI_RI_LIMIT_M9,
  9  // Master number.
 )
U_tb_ri_limit_checker_m9 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m9),
  .ready_i   (U_DW_axi.rready_m9),
  .last_i    (U_DW_axi.rlast_m9),
  .id_i      (U_DW_axi.rid_m9)
);
`endif
`endif

`ifdef AXI_HAS_M10
`ifdef AXI_M10_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0,  // Is ICM ?
  `AXI_RI_LIMIT_M10,
  10  // Master number.
 )
U_tb_ri_limit_checker_m10 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m10),
  .ready_i   (U_DW_axi.rready_m10),
  .last_i    (U_DW_axi.rlast_m10),
  .id_i      (U_DW_axi.rid_m10)
);
`endif
`endif

`ifdef AXI_HAS_M11
`ifdef AXI_M11_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0,  // Is ICM ?
  `AXI_RI_LIMIT_M11,
  11  // Master number.
 )
U_tb_ri_limit_checker_m11 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m11),
  .ready_i   (U_DW_axi.rready_m11),
  .last_i    (U_DW_axi.rlast_m11),
  .id_i      (U_DW_axi.rid_m11)
);
`endif
`endif

`ifdef AXI_HAS_M12
`ifdef AXI_M12_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0,  // Is ICM ?
  `AXI_RI_LIMIT_M12,
  12  // Master number.
 )
U_tb_ri_limit_checker_m12 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m12),
  .ready_i   (U_DW_axi.rready_m12),
  .last_i    (U_DW_axi.rlast_m12),
  .id_i      (U_DW_axi.rid_m12)
);
`endif
`endif

`ifdef AXI_HAS_M13
`ifdef AXI_M13_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0,  // Is ICM ?
  `AXI_RI_LIMIT_M13,
  13  // Master number.
 )
U_tb_ri_limit_checker_m13 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m13),
  .ready_i   (U_DW_axi.rready_m13),
  .last_i    (U_DW_axi.rlast_m13),
  .id_i      (U_DW_axi.rid_m13)
);
`endif
`endif

`ifdef AXI_HAS_M14
`ifdef AXI_M14_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0,  // Is ICM ?
  `AXI_RI_LIMIT_M14,
  14  // Master number.
 )
U_tb_ri_limit_checker_m14 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m14),
  .ready_i   (U_DW_axi.rready_m14),
  .last_i    (U_DW_axi.rlast_m14),
  .id_i      (U_DW_axi.rid_m14)
);
`endif
`endif

`ifdef AXI_HAS_M15
`ifdef AXI_M15_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0,  // Is ICM ?
  `AXI_RI_LIMIT_M15,
  15  // Master number.
 )
U_tb_ri_limit_checker_m15 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m15),
  .ready_i   (U_DW_axi.rready_m15),
  .last_i    (U_DW_axi.rlast_m15),
  .id_i      (U_DW_axi.rid_m15)
);
`endif
`endif

`ifdef AXI_HAS_M16
`ifdef AXI_M16_ON_R_SHARED
  // Read interleave limiting is not supported on the shared read data
  // channel.
`else
tb_ri_limit_checker
#(0,  // Is ICM ?
  `AXI_RI_LIMIT_M16,
  16  // Master number.
 )
U_tb_ri_limit_checker_m16 (
  // Inputs - System.
  .aclk_i    (aclk),
  .aresetn_i (aresetn),
      
  // Inputs 
  .valid_i   (U_DW_axi.rvalid_m16),
  .ready_i   (U_DW_axi.rready_m16),
  .last_i    (U_DW_axi.rlast_m16),
  .id_i      (U_DW_axi.rid_m16)
);
`endif
`endif
