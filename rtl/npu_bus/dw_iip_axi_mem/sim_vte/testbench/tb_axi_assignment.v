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

`ifdef AXI_HAS_S1 
   assign num_vis_mst[1]  = (remap_n) ? `AXI_NNMV_S1 : `AXI_BNMV_S1;
 `endif
`ifdef AXI_HAS_S2 
   assign num_vis_mst[2]  = (remap_n) ? `AXI_NNMV_S2 : `AXI_BNMV_S2;
 `endif
`ifdef AXI_HAS_S3 
   assign num_vis_mst[3]  = (remap_n) ? `AXI_NNMV_S3 : `AXI_BNMV_S3;
 `endif
`ifdef AXI_HAS_S4 
   assign num_vis_mst[4]  = (remap_n) ? `AXI_NNMV_S4 : `AXI_BNMV_S4;
 `endif
`ifdef AXI_HAS_S5 
   assign num_vis_mst[5]  = (remap_n) ? `AXI_NNMV_S5 : `AXI_BNMV_S5;
 `endif
`ifdef AXI_HAS_S6 
   assign num_vis_mst[6]  = (remap_n) ? `AXI_NNMV_S6 : `AXI_BNMV_S6;
 `endif
`ifdef AXI_HAS_S7 
   assign num_vis_mst[7]  = (remap_n) ? `AXI_NNMV_S7 : `AXI_BNMV_S7;
 `endif
`ifdef AXI_HAS_S8 
   assign num_vis_mst[8]  = (remap_n) ? `AXI_NNMV_S8 : `AXI_BNMV_S8;
 `endif
`ifdef AXI_HAS_S9 
   assign num_vis_mst[9]  = (remap_n) ? `AXI_NNMV_S9 : `AXI_BNMV_S9;
 `endif
`ifdef AXI_HAS_S10 
   assign num_vis_mst[10]  = (remap_n) ? `AXI_NNMV_S10 : `AXI_BNMV_S10;
 `endif
`ifdef AXI_HAS_S11 
   assign num_vis_mst[11]  = (remap_n) ? `AXI_NNMV_S11 : `AXI_BNMV_S11;
 `endif
`ifdef AXI_HAS_S12 
   assign num_vis_mst[12]  = (remap_n) ? `AXI_NNMV_S12 : `AXI_BNMV_S12;
 `endif
`ifdef AXI_HAS_S13 
   assign num_vis_mst[13]  = (remap_n) ? `AXI_NNMV_S13 : `AXI_BNMV_S13;
 `endif
`ifdef AXI_HAS_S14 
   assign num_vis_mst[14]  = (remap_n) ? `AXI_NNMV_S14 : `AXI_BNMV_S14;
 `endif
`ifdef AXI_HAS_S15 
   assign num_vis_mst[15]  = (remap_n) ? `AXI_NNMV_S15 : `AXI_BNMV_S15;
 `endif
`ifdef AXI_HAS_S16 
   assign num_vis_mst[16]  = (remap_n) ? `AXI_NNMV_S16 : `AXI_BNMV_S16;
 `endif

`ifdef AXI_BICMD_SUPPORT
   assign axi_pnum_for_snum[1]  = `AXI_PNUM_FOR_SYS_NUM_M1;
   assign axi_pnum_for_snum[2]  = `AXI_PNUM_FOR_SYS_NUM_M2;
   assign axi_pnum_for_snum[3]  = `AXI_PNUM_FOR_SYS_NUM_M3;
   assign axi_pnum_for_snum[4]  = `AXI_PNUM_FOR_SYS_NUM_M4;
   assign axi_pnum_for_snum[5]  = `AXI_PNUM_FOR_SYS_NUM_M5;
   assign axi_pnum_for_snum[6]  = `AXI_PNUM_FOR_SYS_NUM_M6;
   assign axi_pnum_for_snum[7]  = `AXI_PNUM_FOR_SYS_NUM_M7;
   assign axi_pnum_for_snum[8]  = `AXI_PNUM_FOR_SYS_NUM_M8;
   assign axi_pnum_for_snum[9]  = `AXI_PNUM_FOR_SYS_NUM_M9;
   assign axi_pnum_for_snum[10]  = `AXI_PNUM_FOR_SYS_NUM_M10;
   assign axi_pnum_for_snum[11]  = `AXI_PNUM_FOR_SYS_NUM_M11;
   assign axi_pnum_for_snum[12]  = `AXI_PNUM_FOR_SYS_NUM_M12;
   assign axi_pnum_for_snum[13]  = `AXI_PNUM_FOR_SYS_NUM_M13;
   assign axi_pnum_for_snum[14]  = `AXI_PNUM_FOR_SYS_NUM_M14;
   assign axi_pnum_for_snum[15]  = `AXI_PNUM_FOR_SYS_NUM_M15;
   assign axi_pnum_for_snum[16]  = `AXI_PNUM_FOR_SYS_NUM_M16;
   assign axi_pnum_for_snum[17]  = `AXI_PNUM_FOR_SYS_NUM_M17;
   assign axi_pnum_for_snum[18]  = `AXI_PNUM_FOR_SYS_NUM_M18;
   assign axi_pnum_for_snum[19]  = `AXI_PNUM_FOR_SYS_NUM_M19;
   assign axi_pnum_for_snum[20]  = `AXI_PNUM_FOR_SYS_NUM_M20;
   assign axi_pnum_for_snum[21]  = `AXI_PNUM_FOR_SYS_NUM_M21;
   assign axi_pnum_for_snum[22]  = `AXI_PNUM_FOR_SYS_NUM_M22;
   assign axi_pnum_for_snum[23]  = `AXI_PNUM_FOR_SYS_NUM_M23;
   assign axi_pnum_for_snum[24]  = `AXI_PNUM_FOR_SYS_NUM_M24;
   assign axi_pnum_for_snum[25]  = `AXI_PNUM_FOR_SYS_NUM_M25;
   assign axi_pnum_for_snum[26]  = `AXI_PNUM_FOR_SYS_NUM_M26;
   assign axi_pnum_for_snum[27]  = `AXI_PNUM_FOR_SYS_NUM_M27;
   assign axi_pnum_for_snum[28]  = `AXI_PNUM_FOR_SYS_NUM_M28;
   assign axi_pnum_for_snum[29]  = `AXI_PNUM_FOR_SYS_NUM_M29;
   assign axi_pnum_for_snum[30]  = `AXI_PNUM_FOR_SYS_NUM_M30;
   assign axi_pnum_for_snum[31]  = `AXI_PNUM_FOR_SYS_NUM_M31;
   assign axi_pnum_for_snum[32]  = `AXI_PNUM_FOR_SYS_NUM_M32;
   assign axi_pnum_for_snum[33]  = `AXI_PNUM_FOR_SYS_NUM_M33;
   assign axi_pnum_for_snum[34]  = `AXI_PNUM_FOR_SYS_NUM_M34;
   assign axi_pnum_for_snum[35]  = `AXI_PNUM_FOR_SYS_NUM_M35;
   assign axi_pnum_for_snum[36]  = `AXI_PNUM_FOR_SYS_NUM_M36;
   assign axi_pnum_for_snum[37]  = `AXI_PNUM_FOR_SYS_NUM_M37;
   assign axi_pnum_for_snum[38]  = `AXI_PNUM_FOR_SYS_NUM_M38;
   assign axi_pnum_for_snum[39]  = `AXI_PNUM_FOR_SYS_NUM_M39;
   assign axi_pnum_for_snum[40]  = `AXI_PNUM_FOR_SYS_NUM_M40;
   assign axi_pnum_for_snum[41]  = `AXI_PNUM_FOR_SYS_NUM_M41;
   assign axi_pnum_for_snum[42]  = `AXI_PNUM_FOR_SYS_NUM_M42;
   assign axi_pnum_for_snum[43]  = `AXI_PNUM_FOR_SYS_NUM_M43;
   assign axi_pnum_for_snum[44]  = `AXI_PNUM_FOR_SYS_NUM_M44;
   assign axi_pnum_for_snum[45]  = `AXI_PNUM_FOR_SYS_NUM_M45;
   assign axi_pnum_for_snum[46]  = `AXI_PNUM_FOR_SYS_NUM_M46;
   assign axi_pnum_for_snum[47]  = `AXI_PNUM_FOR_SYS_NUM_M47;
   assign axi_pnum_for_snum[48]  = `AXI_PNUM_FOR_SYS_NUM_M48;
   assign axi_pnum_for_snum[49]  = `AXI_PNUM_FOR_SYS_NUM_M49;
   assign axi_pnum_for_snum[50]  = `AXI_PNUM_FOR_SYS_NUM_M50;
   assign axi_pnum_for_snum[51]  = `AXI_PNUM_FOR_SYS_NUM_M51;
   assign axi_pnum_for_snum[52]  = `AXI_PNUM_FOR_SYS_NUM_M52;
   assign axi_pnum_for_snum[53]  = `AXI_PNUM_FOR_SYS_NUM_M53;
   assign axi_pnum_for_snum[54]  = `AXI_PNUM_FOR_SYS_NUM_M54;
   assign axi_pnum_for_snum[55]  = `AXI_PNUM_FOR_SYS_NUM_M55;
   assign axi_pnum_for_snum[56]  = `AXI_PNUM_FOR_SYS_NUM_M56;
   assign axi_pnum_for_snum[57]  = `AXI_PNUM_FOR_SYS_NUM_M57;
   assign axi_pnum_for_snum[58]  = `AXI_PNUM_FOR_SYS_NUM_M58;
   assign axi_pnum_for_snum[59]  = `AXI_PNUM_FOR_SYS_NUM_M59;
   assign axi_pnum_for_snum[60]  = `AXI_PNUM_FOR_SYS_NUM_M60;
   assign axi_pnum_for_snum[61]  = `AXI_PNUM_FOR_SYS_NUM_M61;
   assign axi_pnum_for_snum[62]  = `AXI_PNUM_FOR_SYS_NUM_M62;
   assign axi_pnum_for_snum[63]  = `AXI_PNUM_FOR_SYS_NUM_M63;
   assign axi_pnum_for_snum[64]  = `AXI_PNUM_FOR_SYS_NUM_M64;
`endif

   assign num_valid_icm_master[1]  = `AXI_NUM_MST_THRU_ICM1;
   assign num_valid_icm_master[2]  = `AXI_NUM_MST_THRU_ICM2;
   assign num_valid_icm_master[3]  = `AXI_NUM_MST_THRU_ICM3;
   assign num_valid_icm_master[4]  = `AXI_NUM_MST_THRU_ICM4;

   assign valid_icm_master[1][1] = `AXI_ALLOW_MST1_ICM1;
   assign valid_icm_master[1][2] = `AXI_ALLOW_MST2_ICM1;
   assign valid_icm_master[1][3] = `AXI_ALLOW_MST3_ICM1;
   assign valid_icm_master[1][4] = `AXI_ALLOW_MST4_ICM1;
   assign valid_icm_master[1][5] = `AXI_ALLOW_MST5_ICM1;
   assign valid_icm_master[1][6] = `AXI_ALLOW_MST6_ICM1;
   assign valid_icm_master[1][7] = `AXI_ALLOW_MST7_ICM1;
   assign valid_icm_master[1][8] = `AXI_ALLOW_MST8_ICM1;
   assign valid_icm_master[2][1] = `AXI_ALLOW_MST1_ICM2;
   assign valid_icm_master[2][2] = `AXI_ALLOW_MST2_ICM2;
   assign valid_icm_master[2][3] = `AXI_ALLOW_MST3_ICM2;
   assign valid_icm_master[2][4] = `AXI_ALLOW_MST4_ICM2;
   assign valid_icm_master[2][5] = `AXI_ALLOW_MST5_ICM2;
   assign valid_icm_master[2][6] = `AXI_ALLOW_MST6_ICM2;
   assign valid_icm_master[2][7] = `AXI_ALLOW_MST7_ICM2;
   assign valid_icm_master[2][8] = `AXI_ALLOW_MST8_ICM2;
   assign valid_icm_master[3][1] = `AXI_ALLOW_MST1_ICM3;
   assign valid_icm_master[3][2] = `AXI_ALLOW_MST2_ICM3;
   assign valid_icm_master[3][3] = `AXI_ALLOW_MST3_ICM3;
   assign valid_icm_master[3][4] = `AXI_ALLOW_MST4_ICM3;
   assign valid_icm_master[3][5] = `AXI_ALLOW_MST5_ICM3;
   assign valid_icm_master[3][6] = `AXI_ALLOW_MST6_ICM3;
   assign valid_icm_master[3][7] = `AXI_ALLOW_MST7_ICM3;
   assign valid_icm_master[3][8] = `AXI_ALLOW_MST8_ICM3;
   assign valid_icm_master[4][1] = `AXI_ALLOW_MST1_ICM4;
   assign valid_icm_master[4][2] = `AXI_ALLOW_MST2_ICM4;
   assign valid_icm_master[4][3] = `AXI_ALLOW_MST3_ICM4;
   assign valid_icm_master[4][4] = `AXI_ALLOW_MST4_ICM4;
   assign valid_icm_master[4][5] = `AXI_ALLOW_MST5_ICM4;
   assign valid_icm_master[4][6] = `AXI_ALLOW_MST6_ICM4;
   assign valid_icm_master[4][7] = `AXI_ALLOW_MST7_ICM4;
   assign valid_icm_master[4][8] = `AXI_ALLOW_MST8_ICM4;

`ifdef AXI_HAS_M1 
`ifdef AXI_HAS_S1 
   assign visible_slaves[1][1]  = (remap_n) ? `AXI_NV_S1_BY_M1 : `AXI_BV_S1_BY_M1;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[1][2]  = (remap_n) ? `AXI_NV_S2_BY_M1 : `AXI_BV_S2_BY_M1;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[1][3]  = (remap_n) ? `AXI_NV_S3_BY_M1 : `AXI_BV_S3_BY_M1;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[1][4]  = (remap_n) ? `AXI_NV_S4_BY_M1 : `AXI_BV_S4_BY_M1;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[1][5]  = (remap_n) ? `AXI_NV_S5_BY_M1 : `AXI_BV_S5_BY_M1;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[1][6]  = (remap_n) ? `AXI_NV_S6_BY_M1 : `AXI_BV_S6_BY_M1;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[1][7]  = (remap_n) ? `AXI_NV_S7_BY_M1 : `AXI_BV_S7_BY_M1;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[1][8]  = (remap_n) ? `AXI_NV_S8_BY_M1 : `AXI_BV_S8_BY_M1;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[1][9]  = (remap_n) ? `AXI_NV_S9_BY_M1 : `AXI_BV_S9_BY_M1;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[1][10]  = (remap_n) ? `AXI_NV_S10_BY_M1 : `AXI_BV_S10_BY_M1;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[1][11]  = (remap_n) ? `AXI_NV_S11_BY_M1 : `AXI_BV_S11_BY_M1;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[1][12]  = (remap_n) ? `AXI_NV_S12_BY_M1 : `AXI_BV_S12_BY_M1;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[1][13]  = (remap_n) ? `AXI_NV_S13_BY_M1 : `AXI_BV_S13_BY_M1;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[1][14]  = (remap_n) ? `AXI_NV_S14_BY_M1 : `AXI_BV_S14_BY_M1;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[1][15]  = (remap_n) ? `AXI_NV_S15_BY_M1 : `AXI_BV_S15_BY_M1;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[1][16]  = (remap_n) ? `AXI_NV_S16_BY_M1 : `AXI_BV_S16_BY_M1;
 `endif
`endif 
`ifdef AXI_HAS_M2 
`ifdef AXI_HAS_S1 
   assign visible_slaves[2][1]  = (remap_n) ? `AXI_NV_S1_BY_M2 : `AXI_BV_S1_BY_M2;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[2][2]  = (remap_n) ? `AXI_NV_S2_BY_M2 : `AXI_BV_S2_BY_M2;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[2][3]  = (remap_n) ? `AXI_NV_S3_BY_M2 : `AXI_BV_S3_BY_M2;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[2][4]  = (remap_n) ? `AXI_NV_S4_BY_M2 : `AXI_BV_S4_BY_M2;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[2][5]  = (remap_n) ? `AXI_NV_S5_BY_M2 : `AXI_BV_S5_BY_M2;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[2][6]  = (remap_n) ? `AXI_NV_S6_BY_M2 : `AXI_BV_S6_BY_M2;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[2][7]  = (remap_n) ? `AXI_NV_S7_BY_M2 : `AXI_BV_S7_BY_M2;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[2][8]  = (remap_n) ? `AXI_NV_S8_BY_M2 : `AXI_BV_S8_BY_M2;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[2][9]  = (remap_n) ? `AXI_NV_S9_BY_M2 : `AXI_BV_S9_BY_M2;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[2][10]  = (remap_n) ? `AXI_NV_S10_BY_M2 : `AXI_BV_S10_BY_M2;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[2][11]  = (remap_n) ? `AXI_NV_S11_BY_M2 : `AXI_BV_S11_BY_M2;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[2][12]  = (remap_n) ? `AXI_NV_S12_BY_M2 : `AXI_BV_S12_BY_M2;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[2][13]  = (remap_n) ? `AXI_NV_S13_BY_M2 : `AXI_BV_S13_BY_M2;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[2][14]  = (remap_n) ? `AXI_NV_S14_BY_M2 : `AXI_BV_S14_BY_M2;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[2][15]  = (remap_n) ? `AXI_NV_S15_BY_M2 : `AXI_BV_S15_BY_M2;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[2][16]  = (remap_n) ? `AXI_NV_S16_BY_M2 : `AXI_BV_S16_BY_M2;
 `endif
`endif 
`ifdef AXI_HAS_M3 
`ifdef AXI_HAS_S1 
   assign visible_slaves[3][1]  = (remap_n) ? `AXI_NV_S1_BY_M3 : `AXI_BV_S1_BY_M3;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[3][2]  = (remap_n) ? `AXI_NV_S2_BY_M3 : `AXI_BV_S2_BY_M3;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[3][3]  = (remap_n) ? `AXI_NV_S3_BY_M3 : `AXI_BV_S3_BY_M3;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[3][4]  = (remap_n) ? `AXI_NV_S4_BY_M3 : `AXI_BV_S4_BY_M3;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[3][5]  = (remap_n) ? `AXI_NV_S5_BY_M3 : `AXI_BV_S5_BY_M3;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[3][6]  = (remap_n) ? `AXI_NV_S6_BY_M3 : `AXI_BV_S6_BY_M3;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[3][7]  = (remap_n) ? `AXI_NV_S7_BY_M3 : `AXI_BV_S7_BY_M3;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[3][8]  = (remap_n) ? `AXI_NV_S8_BY_M3 : `AXI_BV_S8_BY_M3;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[3][9]  = (remap_n) ? `AXI_NV_S9_BY_M3 : `AXI_BV_S9_BY_M3;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[3][10]  = (remap_n) ? `AXI_NV_S10_BY_M3 : `AXI_BV_S10_BY_M3;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[3][11]  = (remap_n) ? `AXI_NV_S11_BY_M3 : `AXI_BV_S11_BY_M3;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[3][12]  = (remap_n) ? `AXI_NV_S12_BY_M3 : `AXI_BV_S12_BY_M3;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[3][13]  = (remap_n) ? `AXI_NV_S13_BY_M3 : `AXI_BV_S13_BY_M3;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[3][14]  = (remap_n) ? `AXI_NV_S14_BY_M3 : `AXI_BV_S14_BY_M3;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[3][15]  = (remap_n) ? `AXI_NV_S15_BY_M3 : `AXI_BV_S15_BY_M3;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[3][16]  = (remap_n) ? `AXI_NV_S16_BY_M3 : `AXI_BV_S16_BY_M3;
 `endif
`endif 
`ifdef AXI_HAS_M4 
`ifdef AXI_HAS_S1 
   assign visible_slaves[4][1]  = (remap_n) ? `AXI_NV_S1_BY_M4 : `AXI_BV_S1_BY_M4;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[4][2]  = (remap_n) ? `AXI_NV_S2_BY_M4 : `AXI_BV_S2_BY_M4;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[4][3]  = (remap_n) ? `AXI_NV_S3_BY_M4 : `AXI_BV_S3_BY_M4;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[4][4]  = (remap_n) ? `AXI_NV_S4_BY_M4 : `AXI_BV_S4_BY_M4;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[4][5]  = (remap_n) ? `AXI_NV_S5_BY_M4 : `AXI_BV_S5_BY_M4;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[4][6]  = (remap_n) ? `AXI_NV_S6_BY_M4 : `AXI_BV_S6_BY_M4;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[4][7]  = (remap_n) ? `AXI_NV_S7_BY_M4 : `AXI_BV_S7_BY_M4;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[4][8]  = (remap_n) ? `AXI_NV_S8_BY_M4 : `AXI_BV_S8_BY_M4;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[4][9]  = (remap_n) ? `AXI_NV_S9_BY_M4 : `AXI_BV_S9_BY_M4;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[4][10]  = (remap_n) ? `AXI_NV_S10_BY_M4 : `AXI_BV_S10_BY_M4;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[4][11]  = (remap_n) ? `AXI_NV_S11_BY_M4 : `AXI_BV_S11_BY_M4;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[4][12]  = (remap_n) ? `AXI_NV_S12_BY_M4 : `AXI_BV_S12_BY_M4;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[4][13]  = (remap_n) ? `AXI_NV_S13_BY_M4 : `AXI_BV_S13_BY_M4;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[4][14]  = (remap_n) ? `AXI_NV_S14_BY_M4 : `AXI_BV_S14_BY_M4;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[4][15]  = (remap_n) ? `AXI_NV_S15_BY_M4 : `AXI_BV_S15_BY_M4;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[4][16]  = (remap_n) ? `AXI_NV_S16_BY_M4 : `AXI_BV_S16_BY_M4;
 `endif
`endif 
`ifdef AXI_HAS_M5 
`ifdef AXI_HAS_S1 
   assign visible_slaves[5][1]  = (remap_n) ? `AXI_NV_S1_BY_M5 : `AXI_BV_S1_BY_M5;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[5][2]  = (remap_n) ? `AXI_NV_S2_BY_M5 : `AXI_BV_S2_BY_M5;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[5][3]  = (remap_n) ? `AXI_NV_S3_BY_M5 : `AXI_BV_S3_BY_M5;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[5][4]  = (remap_n) ? `AXI_NV_S4_BY_M5 : `AXI_BV_S4_BY_M5;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[5][5]  = (remap_n) ? `AXI_NV_S5_BY_M5 : `AXI_BV_S5_BY_M5;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[5][6]  = (remap_n) ? `AXI_NV_S6_BY_M5 : `AXI_BV_S6_BY_M5;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[5][7]  = (remap_n) ? `AXI_NV_S7_BY_M5 : `AXI_BV_S7_BY_M5;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[5][8]  = (remap_n) ? `AXI_NV_S8_BY_M5 : `AXI_BV_S8_BY_M5;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[5][9]  = (remap_n) ? `AXI_NV_S9_BY_M5 : `AXI_BV_S9_BY_M5;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[5][10]  = (remap_n) ? `AXI_NV_S10_BY_M5 : `AXI_BV_S10_BY_M5;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[5][11]  = (remap_n) ? `AXI_NV_S11_BY_M5 : `AXI_BV_S11_BY_M5;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[5][12]  = (remap_n) ? `AXI_NV_S12_BY_M5 : `AXI_BV_S12_BY_M5;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[5][13]  = (remap_n) ? `AXI_NV_S13_BY_M5 : `AXI_BV_S13_BY_M5;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[5][14]  = (remap_n) ? `AXI_NV_S14_BY_M5 : `AXI_BV_S14_BY_M5;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[5][15]  = (remap_n) ? `AXI_NV_S15_BY_M5 : `AXI_BV_S15_BY_M5;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[5][16]  = (remap_n) ? `AXI_NV_S16_BY_M5 : `AXI_BV_S16_BY_M5;
 `endif
`endif 
`ifdef AXI_HAS_M6 
`ifdef AXI_HAS_S1 
   assign visible_slaves[6][1]  = (remap_n) ? `AXI_NV_S1_BY_M6 : `AXI_BV_S1_BY_M6;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[6][2]  = (remap_n) ? `AXI_NV_S2_BY_M6 : `AXI_BV_S2_BY_M6;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[6][3]  = (remap_n) ? `AXI_NV_S3_BY_M6 : `AXI_BV_S3_BY_M6;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[6][4]  = (remap_n) ? `AXI_NV_S4_BY_M6 : `AXI_BV_S4_BY_M6;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[6][5]  = (remap_n) ? `AXI_NV_S5_BY_M6 : `AXI_BV_S5_BY_M6;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[6][6]  = (remap_n) ? `AXI_NV_S6_BY_M6 : `AXI_BV_S6_BY_M6;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[6][7]  = (remap_n) ? `AXI_NV_S7_BY_M6 : `AXI_BV_S7_BY_M6;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[6][8]  = (remap_n) ? `AXI_NV_S8_BY_M6 : `AXI_BV_S8_BY_M6;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[6][9]  = (remap_n) ? `AXI_NV_S9_BY_M6 : `AXI_BV_S9_BY_M6;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[6][10]  = (remap_n) ? `AXI_NV_S10_BY_M6 : `AXI_BV_S10_BY_M6;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[6][11]  = (remap_n) ? `AXI_NV_S11_BY_M6 : `AXI_BV_S11_BY_M6;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[6][12]  = (remap_n) ? `AXI_NV_S12_BY_M6 : `AXI_BV_S12_BY_M6;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[6][13]  = (remap_n) ? `AXI_NV_S13_BY_M6 : `AXI_BV_S13_BY_M6;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[6][14]  = (remap_n) ? `AXI_NV_S14_BY_M6 : `AXI_BV_S14_BY_M6;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[6][15]  = (remap_n) ? `AXI_NV_S15_BY_M6 : `AXI_BV_S15_BY_M6;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[6][16]  = (remap_n) ? `AXI_NV_S16_BY_M6 : `AXI_BV_S16_BY_M6;
 `endif
`endif 
`ifdef AXI_HAS_M7 
`ifdef AXI_HAS_S1 
   assign visible_slaves[7][1]  = (remap_n) ? `AXI_NV_S1_BY_M7 : `AXI_BV_S1_BY_M7;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[7][2]  = (remap_n) ? `AXI_NV_S2_BY_M7 : `AXI_BV_S2_BY_M7;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[7][3]  = (remap_n) ? `AXI_NV_S3_BY_M7 : `AXI_BV_S3_BY_M7;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[7][4]  = (remap_n) ? `AXI_NV_S4_BY_M7 : `AXI_BV_S4_BY_M7;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[7][5]  = (remap_n) ? `AXI_NV_S5_BY_M7 : `AXI_BV_S5_BY_M7;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[7][6]  = (remap_n) ? `AXI_NV_S6_BY_M7 : `AXI_BV_S6_BY_M7;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[7][7]  = (remap_n) ? `AXI_NV_S7_BY_M7 : `AXI_BV_S7_BY_M7;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[7][8]  = (remap_n) ? `AXI_NV_S8_BY_M7 : `AXI_BV_S8_BY_M7;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[7][9]  = (remap_n) ? `AXI_NV_S9_BY_M7 : `AXI_BV_S9_BY_M7;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[7][10]  = (remap_n) ? `AXI_NV_S10_BY_M7 : `AXI_BV_S10_BY_M7;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[7][11]  = (remap_n) ? `AXI_NV_S11_BY_M7 : `AXI_BV_S11_BY_M7;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[7][12]  = (remap_n) ? `AXI_NV_S12_BY_M7 : `AXI_BV_S12_BY_M7;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[7][13]  = (remap_n) ? `AXI_NV_S13_BY_M7 : `AXI_BV_S13_BY_M7;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[7][14]  = (remap_n) ? `AXI_NV_S14_BY_M7 : `AXI_BV_S14_BY_M7;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[7][15]  = (remap_n) ? `AXI_NV_S15_BY_M7 : `AXI_BV_S15_BY_M7;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[7][16]  = (remap_n) ? `AXI_NV_S16_BY_M7 : `AXI_BV_S16_BY_M7;
 `endif
`endif 
`ifdef AXI_HAS_M8 
`ifdef AXI_HAS_S1 
   assign visible_slaves[8][1]  = (remap_n) ? `AXI_NV_S1_BY_M8 : `AXI_BV_S1_BY_M8;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[8][2]  = (remap_n) ? `AXI_NV_S2_BY_M8 : `AXI_BV_S2_BY_M8;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[8][3]  = (remap_n) ? `AXI_NV_S3_BY_M8 : `AXI_BV_S3_BY_M8;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[8][4]  = (remap_n) ? `AXI_NV_S4_BY_M8 : `AXI_BV_S4_BY_M8;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[8][5]  = (remap_n) ? `AXI_NV_S5_BY_M8 : `AXI_BV_S5_BY_M8;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[8][6]  = (remap_n) ? `AXI_NV_S6_BY_M8 : `AXI_BV_S6_BY_M8;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[8][7]  = (remap_n) ? `AXI_NV_S7_BY_M8 : `AXI_BV_S7_BY_M8;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[8][8]  = (remap_n) ? `AXI_NV_S8_BY_M8 : `AXI_BV_S8_BY_M8;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[8][9]  = (remap_n) ? `AXI_NV_S9_BY_M8 : `AXI_BV_S9_BY_M8;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[8][10]  = (remap_n) ? `AXI_NV_S10_BY_M8 : `AXI_BV_S10_BY_M8;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[8][11]  = (remap_n) ? `AXI_NV_S11_BY_M8 : `AXI_BV_S11_BY_M8;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[8][12]  = (remap_n) ? `AXI_NV_S12_BY_M8 : `AXI_BV_S12_BY_M8;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[8][13]  = (remap_n) ? `AXI_NV_S13_BY_M8 : `AXI_BV_S13_BY_M8;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[8][14]  = (remap_n) ? `AXI_NV_S14_BY_M8 : `AXI_BV_S14_BY_M8;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[8][15]  = (remap_n) ? `AXI_NV_S15_BY_M8 : `AXI_BV_S15_BY_M8;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[8][16]  = (remap_n) ? `AXI_NV_S16_BY_M8 : `AXI_BV_S16_BY_M8;
 `endif
`endif 
`ifdef AXI_HAS_M9 
`ifdef AXI_HAS_S1 
   assign visible_slaves[9][1]  = (remap_n) ? `AXI_NV_S1_BY_M9 : `AXI_BV_S1_BY_M9;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[9][2]  = (remap_n) ? `AXI_NV_S2_BY_M9 : `AXI_BV_S2_BY_M9;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[9][3]  = (remap_n) ? `AXI_NV_S3_BY_M9 : `AXI_BV_S3_BY_M9;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[9][4]  = (remap_n) ? `AXI_NV_S4_BY_M9 : `AXI_BV_S4_BY_M9;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[9][5]  = (remap_n) ? `AXI_NV_S5_BY_M9 : `AXI_BV_S5_BY_M9;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[9][6]  = (remap_n) ? `AXI_NV_S6_BY_M9 : `AXI_BV_S6_BY_M9;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[9][7]  = (remap_n) ? `AXI_NV_S7_BY_M9 : `AXI_BV_S7_BY_M9;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[9][8]  = (remap_n) ? `AXI_NV_S8_BY_M9 : `AXI_BV_S8_BY_M9;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[9][9]  = (remap_n) ? `AXI_NV_S9_BY_M9 : `AXI_BV_S9_BY_M9;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[9][10]  = (remap_n) ? `AXI_NV_S10_BY_M9 : `AXI_BV_S10_BY_M9;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[9][11]  = (remap_n) ? `AXI_NV_S11_BY_M9 : `AXI_BV_S11_BY_M9;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[9][12]  = (remap_n) ? `AXI_NV_S12_BY_M9 : `AXI_BV_S12_BY_M9;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[9][13]  = (remap_n) ? `AXI_NV_S13_BY_M9 : `AXI_BV_S13_BY_M9;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[9][14]  = (remap_n) ? `AXI_NV_S14_BY_M9 : `AXI_BV_S14_BY_M9;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[9][15]  = (remap_n) ? `AXI_NV_S15_BY_M9 : `AXI_BV_S15_BY_M9;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[9][16]  = (remap_n) ? `AXI_NV_S16_BY_M9 : `AXI_BV_S16_BY_M9;
 `endif
`endif 
`ifdef AXI_HAS_M10 
`ifdef AXI_HAS_S1 
   assign visible_slaves[10][1]  = (remap_n) ? `AXI_NV_S1_BY_M10 : `AXI_BV_S1_BY_M10;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[10][2]  = (remap_n) ? `AXI_NV_S2_BY_M10 : `AXI_BV_S2_BY_M10;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[10][3]  = (remap_n) ? `AXI_NV_S3_BY_M10 : `AXI_BV_S3_BY_M10;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[10][4]  = (remap_n) ? `AXI_NV_S4_BY_M10 : `AXI_BV_S4_BY_M10;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[10][5]  = (remap_n) ? `AXI_NV_S5_BY_M10 : `AXI_BV_S5_BY_M10;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[10][6]  = (remap_n) ? `AXI_NV_S6_BY_M10 : `AXI_BV_S6_BY_M10;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[10][7]  = (remap_n) ? `AXI_NV_S7_BY_M10 : `AXI_BV_S7_BY_M10;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[10][8]  = (remap_n) ? `AXI_NV_S8_BY_M10 : `AXI_BV_S8_BY_M10;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[10][9]  = (remap_n) ? `AXI_NV_S9_BY_M10 : `AXI_BV_S9_BY_M10;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[10][10]  = (remap_n) ? `AXI_NV_S10_BY_M10 : `AXI_BV_S10_BY_M10;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[10][11]  = (remap_n) ? `AXI_NV_S11_BY_M10 : `AXI_BV_S11_BY_M10;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[10][12]  = (remap_n) ? `AXI_NV_S12_BY_M10 : `AXI_BV_S12_BY_M10;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[10][13]  = (remap_n) ? `AXI_NV_S13_BY_M10 : `AXI_BV_S13_BY_M10;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[10][14]  = (remap_n) ? `AXI_NV_S14_BY_M10 : `AXI_BV_S14_BY_M10;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[10][15]  = (remap_n) ? `AXI_NV_S15_BY_M10 : `AXI_BV_S15_BY_M10;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[10][16]  = (remap_n) ? `AXI_NV_S16_BY_M10 : `AXI_BV_S16_BY_M10;
 `endif
`endif 
`ifdef AXI_HAS_M11 
`ifdef AXI_HAS_S1 
   assign visible_slaves[11][1]  = (remap_n) ? `AXI_NV_S1_BY_M11 : `AXI_BV_S1_BY_M11;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[11][2]  = (remap_n) ? `AXI_NV_S2_BY_M11 : `AXI_BV_S2_BY_M11;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[11][3]  = (remap_n) ? `AXI_NV_S3_BY_M11 : `AXI_BV_S3_BY_M11;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[11][4]  = (remap_n) ? `AXI_NV_S4_BY_M11 : `AXI_BV_S4_BY_M11;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[11][5]  = (remap_n) ? `AXI_NV_S5_BY_M11 : `AXI_BV_S5_BY_M11;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[11][6]  = (remap_n) ? `AXI_NV_S6_BY_M11 : `AXI_BV_S6_BY_M11;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[11][7]  = (remap_n) ? `AXI_NV_S7_BY_M11 : `AXI_BV_S7_BY_M11;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[11][8]  = (remap_n) ? `AXI_NV_S8_BY_M11 : `AXI_BV_S8_BY_M11;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[11][9]  = (remap_n) ? `AXI_NV_S9_BY_M11 : `AXI_BV_S9_BY_M11;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[11][10]  = (remap_n) ? `AXI_NV_S10_BY_M11 : `AXI_BV_S10_BY_M11;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[11][11]  = (remap_n) ? `AXI_NV_S11_BY_M11 : `AXI_BV_S11_BY_M11;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[11][12]  = (remap_n) ? `AXI_NV_S12_BY_M11 : `AXI_BV_S12_BY_M11;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[11][13]  = (remap_n) ? `AXI_NV_S13_BY_M11 : `AXI_BV_S13_BY_M11;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[11][14]  = (remap_n) ? `AXI_NV_S14_BY_M11 : `AXI_BV_S14_BY_M11;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[11][15]  = (remap_n) ? `AXI_NV_S15_BY_M11 : `AXI_BV_S15_BY_M11;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[11][16]  = (remap_n) ? `AXI_NV_S16_BY_M11 : `AXI_BV_S16_BY_M11;
 `endif
`endif 
`ifdef AXI_HAS_M12 
`ifdef AXI_HAS_S1 
   assign visible_slaves[12][1]  = (remap_n) ? `AXI_NV_S1_BY_M12 : `AXI_BV_S1_BY_M12;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[12][2]  = (remap_n) ? `AXI_NV_S2_BY_M12 : `AXI_BV_S2_BY_M12;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[12][3]  = (remap_n) ? `AXI_NV_S3_BY_M12 : `AXI_BV_S3_BY_M12;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[12][4]  = (remap_n) ? `AXI_NV_S4_BY_M12 : `AXI_BV_S4_BY_M12;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[12][5]  = (remap_n) ? `AXI_NV_S5_BY_M12 : `AXI_BV_S5_BY_M12;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[12][6]  = (remap_n) ? `AXI_NV_S6_BY_M12 : `AXI_BV_S6_BY_M12;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[12][7]  = (remap_n) ? `AXI_NV_S7_BY_M12 : `AXI_BV_S7_BY_M12;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[12][8]  = (remap_n) ? `AXI_NV_S8_BY_M12 : `AXI_BV_S8_BY_M12;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[12][9]  = (remap_n) ? `AXI_NV_S9_BY_M12 : `AXI_BV_S9_BY_M12;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[12][10]  = (remap_n) ? `AXI_NV_S10_BY_M12 : `AXI_BV_S10_BY_M12;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[12][11]  = (remap_n) ? `AXI_NV_S11_BY_M12 : `AXI_BV_S11_BY_M12;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[12][12]  = (remap_n) ? `AXI_NV_S12_BY_M12 : `AXI_BV_S12_BY_M12;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[12][13]  = (remap_n) ? `AXI_NV_S13_BY_M12 : `AXI_BV_S13_BY_M12;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[12][14]  = (remap_n) ? `AXI_NV_S14_BY_M12 : `AXI_BV_S14_BY_M12;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[12][15]  = (remap_n) ? `AXI_NV_S15_BY_M12 : `AXI_BV_S15_BY_M12;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[12][16]  = (remap_n) ? `AXI_NV_S16_BY_M12 : `AXI_BV_S16_BY_M12;
 `endif
`endif 
`ifdef AXI_HAS_M13 
`ifdef AXI_HAS_S1 
   assign visible_slaves[13][1]  = (remap_n) ? `AXI_NV_S1_BY_M13 : `AXI_BV_S1_BY_M13;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[13][2]  = (remap_n) ? `AXI_NV_S2_BY_M13 : `AXI_BV_S2_BY_M13;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[13][3]  = (remap_n) ? `AXI_NV_S3_BY_M13 : `AXI_BV_S3_BY_M13;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[13][4]  = (remap_n) ? `AXI_NV_S4_BY_M13 : `AXI_BV_S4_BY_M13;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[13][5]  = (remap_n) ? `AXI_NV_S5_BY_M13 : `AXI_BV_S5_BY_M13;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[13][6]  = (remap_n) ? `AXI_NV_S6_BY_M13 : `AXI_BV_S6_BY_M13;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[13][7]  = (remap_n) ? `AXI_NV_S7_BY_M13 : `AXI_BV_S7_BY_M13;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[13][8]  = (remap_n) ? `AXI_NV_S8_BY_M13 : `AXI_BV_S8_BY_M13;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[13][9]  = (remap_n) ? `AXI_NV_S9_BY_M13 : `AXI_BV_S9_BY_M13;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[13][10]  = (remap_n) ? `AXI_NV_S10_BY_M13 : `AXI_BV_S10_BY_M13;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[13][11]  = (remap_n) ? `AXI_NV_S11_BY_M13 : `AXI_BV_S11_BY_M13;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[13][12]  = (remap_n) ? `AXI_NV_S12_BY_M13 : `AXI_BV_S12_BY_M13;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[13][13]  = (remap_n) ? `AXI_NV_S13_BY_M13 : `AXI_BV_S13_BY_M13;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[13][14]  = (remap_n) ? `AXI_NV_S14_BY_M13 : `AXI_BV_S14_BY_M13;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[13][15]  = (remap_n) ? `AXI_NV_S15_BY_M13 : `AXI_BV_S15_BY_M13;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[13][16]  = (remap_n) ? `AXI_NV_S16_BY_M13 : `AXI_BV_S16_BY_M13;
 `endif
`endif 
`ifdef AXI_HAS_M14 
`ifdef AXI_HAS_S1 
   assign visible_slaves[14][1]  = (remap_n) ? `AXI_NV_S1_BY_M14 : `AXI_BV_S1_BY_M14;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[14][2]  = (remap_n) ? `AXI_NV_S2_BY_M14 : `AXI_BV_S2_BY_M14;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[14][3]  = (remap_n) ? `AXI_NV_S3_BY_M14 : `AXI_BV_S3_BY_M14;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[14][4]  = (remap_n) ? `AXI_NV_S4_BY_M14 : `AXI_BV_S4_BY_M14;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[14][5]  = (remap_n) ? `AXI_NV_S5_BY_M14 : `AXI_BV_S5_BY_M14;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[14][6]  = (remap_n) ? `AXI_NV_S6_BY_M14 : `AXI_BV_S6_BY_M14;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[14][7]  = (remap_n) ? `AXI_NV_S7_BY_M14 : `AXI_BV_S7_BY_M14;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[14][8]  = (remap_n) ? `AXI_NV_S8_BY_M14 : `AXI_BV_S8_BY_M14;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[14][9]  = (remap_n) ? `AXI_NV_S9_BY_M14 : `AXI_BV_S9_BY_M14;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[14][10]  = (remap_n) ? `AXI_NV_S10_BY_M14 : `AXI_BV_S10_BY_M14;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[14][11]  = (remap_n) ? `AXI_NV_S11_BY_M14 : `AXI_BV_S11_BY_M14;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[14][12]  = (remap_n) ? `AXI_NV_S12_BY_M14 : `AXI_BV_S12_BY_M14;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[14][13]  = (remap_n) ? `AXI_NV_S13_BY_M14 : `AXI_BV_S13_BY_M14;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[14][14]  = (remap_n) ? `AXI_NV_S14_BY_M14 : `AXI_BV_S14_BY_M14;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[14][15]  = (remap_n) ? `AXI_NV_S15_BY_M14 : `AXI_BV_S15_BY_M14;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[14][16]  = (remap_n) ? `AXI_NV_S16_BY_M14 : `AXI_BV_S16_BY_M14;
 `endif
`endif 
`ifdef AXI_HAS_M15 
`ifdef AXI_HAS_S1 
   assign visible_slaves[15][1]  = (remap_n) ? `AXI_NV_S1_BY_M15 : `AXI_BV_S1_BY_M15;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[15][2]  = (remap_n) ? `AXI_NV_S2_BY_M15 : `AXI_BV_S2_BY_M15;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[15][3]  = (remap_n) ? `AXI_NV_S3_BY_M15 : `AXI_BV_S3_BY_M15;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[15][4]  = (remap_n) ? `AXI_NV_S4_BY_M15 : `AXI_BV_S4_BY_M15;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[15][5]  = (remap_n) ? `AXI_NV_S5_BY_M15 : `AXI_BV_S5_BY_M15;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[15][6]  = (remap_n) ? `AXI_NV_S6_BY_M15 : `AXI_BV_S6_BY_M15;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[15][7]  = (remap_n) ? `AXI_NV_S7_BY_M15 : `AXI_BV_S7_BY_M15;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[15][8]  = (remap_n) ? `AXI_NV_S8_BY_M15 : `AXI_BV_S8_BY_M15;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[15][9]  = (remap_n) ? `AXI_NV_S9_BY_M15 : `AXI_BV_S9_BY_M15;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[15][10]  = (remap_n) ? `AXI_NV_S10_BY_M15 : `AXI_BV_S10_BY_M15;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[15][11]  = (remap_n) ? `AXI_NV_S11_BY_M15 : `AXI_BV_S11_BY_M15;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[15][12]  = (remap_n) ? `AXI_NV_S12_BY_M15 : `AXI_BV_S12_BY_M15;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[15][13]  = (remap_n) ? `AXI_NV_S13_BY_M15 : `AXI_BV_S13_BY_M15;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[15][14]  = (remap_n) ? `AXI_NV_S14_BY_M15 : `AXI_BV_S14_BY_M15;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[15][15]  = (remap_n) ? `AXI_NV_S15_BY_M15 : `AXI_BV_S15_BY_M15;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[15][16]  = (remap_n) ? `AXI_NV_S16_BY_M15 : `AXI_BV_S16_BY_M15;
 `endif
`endif 
`ifdef AXI_HAS_M16 
`ifdef AXI_HAS_S1 
   assign visible_slaves[16][1]  = (remap_n) ? `AXI_NV_S1_BY_M16 : `AXI_BV_S1_BY_M16;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves[16][2]  = (remap_n) ? `AXI_NV_S2_BY_M16 : `AXI_BV_S2_BY_M16;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves[16][3]  = (remap_n) ? `AXI_NV_S3_BY_M16 : `AXI_BV_S3_BY_M16;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves[16][4]  = (remap_n) ? `AXI_NV_S4_BY_M16 : `AXI_BV_S4_BY_M16;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves[16][5]  = (remap_n) ? `AXI_NV_S5_BY_M16 : `AXI_BV_S5_BY_M16;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves[16][6]  = (remap_n) ? `AXI_NV_S6_BY_M16 : `AXI_BV_S6_BY_M16;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves[16][7]  = (remap_n) ? `AXI_NV_S7_BY_M16 : `AXI_BV_S7_BY_M16;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves[16][8]  = (remap_n) ? `AXI_NV_S8_BY_M16 : `AXI_BV_S8_BY_M16;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves[16][9]  = (remap_n) ? `AXI_NV_S9_BY_M16 : `AXI_BV_S9_BY_M16;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves[16][10]  = (remap_n) ? `AXI_NV_S10_BY_M16 : `AXI_BV_S10_BY_M16;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves[16][11]  = (remap_n) ? `AXI_NV_S11_BY_M16 : `AXI_BV_S11_BY_M16;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves[16][12]  = (remap_n) ? `AXI_NV_S12_BY_M16 : `AXI_BV_S12_BY_M16;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves[16][13]  = (remap_n) ? `AXI_NV_S13_BY_M16 : `AXI_BV_S13_BY_M16;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves[16][14]  = (remap_n) ? `AXI_NV_S14_BY_M16 : `AXI_BV_S14_BY_M16;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves[16][15]  = (remap_n) ? `AXI_NV_S15_BY_M16 : `AXI_BV_S15_BY_M16;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves[16][16]  = (remap_n) ? `AXI_NV_S16_BY_M16 : `AXI_BV_S16_BY_M16;
 `endif
`endif 

`ifdef AXI_HAS_M1 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[1][1]  = (~remap_n) ? `AXI_NV_S1_BY_M1 : `AXI_BV_S1_BY_M1;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[1][2]  = (~remap_n) ? `AXI_NV_S2_BY_M1 : `AXI_BV_S2_BY_M1;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[1][3]  = (~remap_n) ? `AXI_NV_S3_BY_M1 : `AXI_BV_S3_BY_M1;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[1][4]  = (~remap_n) ? `AXI_NV_S4_BY_M1 : `AXI_BV_S4_BY_M1;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[1][5]  = (~remap_n) ? `AXI_NV_S5_BY_M1 : `AXI_BV_S5_BY_M1;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[1][6]  = (~remap_n) ? `AXI_NV_S6_BY_M1 : `AXI_BV_S6_BY_M1;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[1][7]  = (~remap_n) ? `AXI_NV_S7_BY_M1 : `AXI_BV_S7_BY_M1;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[1][8]  = (~remap_n) ? `AXI_NV_S8_BY_M1 : `AXI_BV_S8_BY_M1;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[1][9]  = (~remap_n) ? `AXI_NV_S9_BY_M1 : `AXI_BV_S9_BY_M1;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[1][10]  = (~remap_n) ? `AXI_NV_S10_BY_M1 : `AXI_BV_S10_BY_M1;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[1][11]  = (~remap_n) ? `AXI_NV_S11_BY_M1 : `AXI_BV_S11_BY_M1;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[1][12]  = (~remap_n) ? `AXI_NV_S12_BY_M1 : `AXI_BV_S12_BY_M1;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[1][13]  = (~remap_n) ? `AXI_NV_S13_BY_M1 : `AXI_BV_S13_BY_M1;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[1][14]  = (~remap_n) ? `AXI_NV_S14_BY_M1 : `AXI_BV_S14_BY_M1;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[1][15]  = (~remap_n) ? `AXI_NV_S15_BY_M1 : `AXI_BV_S15_BY_M1;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[1][16]  = (~remap_n) ? `AXI_NV_S16_BY_M1 : `AXI_BV_S16_BY_M1;
 `endif
`endif 
`ifdef AXI_HAS_M2 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[2][1]  = (~remap_n) ? `AXI_NV_S1_BY_M2 : `AXI_BV_S1_BY_M2;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[2][2]  = (~remap_n) ? `AXI_NV_S2_BY_M2 : `AXI_BV_S2_BY_M2;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[2][3]  = (~remap_n) ? `AXI_NV_S3_BY_M2 : `AXI_BV_S3_BY_M2;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[2][4]  = (~remap_n) ? `AXI_NV_S4_BY_M2 : `AXI_BV_S4_BY_M2;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[2][5]  = (~remap_n) ? `AXI_NV_S5_BY_M2 : `AXI_BV_S5_BY_M2;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[2][6]  = (~remap_n) ? `AXI_NV_S6_BY_M2 : `AXI_BV_S6_BY_M2;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[2][7]  = (~remap_n) ? `AXI_NV_S7_BY_M2 : `AXI_BV_S7_BY_M2;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[2][8]  = (~remap_n) ? `AXI_NV_S8_BY_M2 : `AXI_BV_S8_BY_M2;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[2][9]  = (~remap_n) ? `AXI_NV_S9_BY_M2 : `AXI_BV_S9_BY_M2;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[2][10]  = (~remap_n) ? `AXI_NV_S10_BY_M2 : `AXI_BV_S10_BY_M2;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[2][11]  = (~remap_n) ? `AXI_NV_S11_BY_M2 : `AXI_BV_S11_BY_M2;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[2][12]  = (~remap_n) ? `AXI_NV_S12_BY_M2 : `AXI_BV_S12_BY_M2;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[2][13]  = (~remap_n) ? `AXI_NV_S13_BY_M2 : `AXI_BV_S13_BY_M2;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[2][14]  = (~remap_n) ? `AXI_NV_S14_BY_M2 : `AXI_BV_S14_BY_M2;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[2][15]  = (~remap_n) ? `AXI_NV_S15_BY_M2 : `AXI_BV_S15_BY_M2;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[2][16]  = (~remap_n) ? `AXI_NV_S16_BY_M2 : `AXI_BV_S16_BY_M2;
 `endif
`endif 
`ifdef AXI_HAS_M3 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[3][1]  = (~remap_n) ? `AXI_NV_S1_BY_M3 : `AXI_BV_S1_BY_M3;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[3][2]  = (~remap_n) ? `AXI_NV_S2_BY_M3 : `AXI_BV_S2_BY_M3;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[3][3]  = (~remap_n) ? `AXI_NV_S3_BY_M3 : `AXI_BV_S3_BY_M3;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[3][4]  = (~remap_n) ? `AXI_NV_S4_BY_M3 : `AXI_BV_S4_BY_M3;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[3][5]  = (~remap_n) ? `AXI_NV_S5_BY_M3 : `AXI_BV_S5_BY_M3;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[3][6]  = (~remap_n) ? `AXI_NV_S6_BY_M3 : `AXI_BV_S6_BY_M3;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[3][7]  = (~remap_n) ? `AXI_NV_S7_BY_M3 : `AXI_BV_S7_BY_M3;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[3][8]  = (~remap_n) ? `AXI_NV_S8_BY_M3 : `AXI_BV_S8_BY_M3;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[3][9]  = (~remap_n) ? `AXI_NV_S9_BY_M3 : `AXI_BV_S9_BY_M3;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[3][10]  = (~remap_n) ? `AXI_NV_S10_BY_M3 : `AXI_BV_S10_BY_M3;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[3][11]  = (~remap_n) ? `AXI_NV_S11_BY_M3 : `AXI_BV_S11_BY_M3;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[3][12]  = (~remap_n) ? `AXI_NV_S12_BY_M3 : `AXI_BV_S12_BY_M3;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[3][13]  = (~remap_n) ? `AXI_NV_S13_BY_M3 : `AXI_BV_S13_BY_M3;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[3][14]  = (~remap_n) ? `AXI_NV_S14_BY_M3 : `AXI_BV_S14_BY_M3;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[3][15]  = (~remap_n) ? `AXI_NV_S15_BY_M3 : `AXI_BV_S15_BY_M3;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[3][16]  = (~remap_n) ? `AXI_NV_S16_BY_M3 : `AXI_BV_S16_BY_M3;
 `endif
`endif 
`ifdef AXI_HAS_M4 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[4][1]  = (~remap_n) ? `AXI_NV_S1_BY_M4 : `AXI_BV_S1_BY_M4;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[4][2]  = (~remap_n) ? `AXI_NV_S2_BY_M4 : `AXI_BV_S2_BY_M4;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[4][3]  = (~remap_n) ? `AXI_NV_S3_BY_M4 : `AXI_BV_S3_BY_M4;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[4][4]  = (~remap_n) ? `AXI_NV_S4_BY_M4 : `AXI_BV_S4_BY_M4;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[4][5]  = (~remap_n) ? `AXI_NV_S5_BY_M4 : `AXI_BV_S5_BY_M4;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[4][6]  = (~remap_n) ? `AXI_NV_S6_BY_M4 : `AXI_BV_S6_BY_M4;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[4][7]  = (~remap_n) ? `AXI_NV_S7_BY_M4 : `AXI_BV_S7_BY_M4;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[4][8]  = (~remap_n) ? `AXI_NV_S8_BY_M4 : `AXI_BV_S8_BY_M4;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[4][9]  = (~remap_n) ? `AXI_NV_S9_BY_M4 : `AXI_BV_S9_BY_M4;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[4][10]  = (~remap_n) ? `AXI_NV_S10_BY_M4 : `AXI_BV_S10_BY_M4;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[4][11]  = (~remap_n) ? `AXI_NV_S11_BY_M4 : `AXI_BV_S11_BY_M4;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[4][12]  = (~remap_n) ? `AXI_NV_S12_BY_M4 : `AXI_BV_S12_BY_M4;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[4][13]  = (~remap_n) ? `AXI_NV_S13_BY_M4 : `AXI_BV_S13_BY_M4;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[4][14]  = (~remap_n) ? `AXI_NV_S14_BY_M4 : `AXI_BV_S14_BY_M4;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[4][15]  = (~remap_n) ? `AXI_NV_S15_BY_M4 : `AXI_BV_S15_BY_M4;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[4][16]  = (~remap_n) ? `AXI_NV_S16_BY_M4 : `AXI_BV_S16_BY_M4;
 `endif
`endif 
`ifdef AXI_HAS_M5 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[5][1]  = (~remap_n) ? `AXI_NV_S1_BY_M5 : `AXI_BV_S1_BY_M5;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[5][2]  = (~remap_n) ? `AXI_NV_S2_BY_M5 : `AXI_BV_S2_BY_M5;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[5][3]  = (~remap_n) ? `AXI_NV_S3_BY_M5 : `AXI_BV_S3_BY_M5;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[5][4]  = (~remap_n) ? `AXI_NV_S4_BY_M5 : `AXI_BV_S4_BY_M5;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[5][5]  = (~remap_n) ? `AXI_NV_S5_BY_M5 : `AXI_BV_S5_BY_M5;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[5][6]  = (~remap_n) ? `AXI_NV_S6_BY_M5 : `AXI_BV_S6_BY_M5;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[5][7]  = (~remap_n) ? `AXI_NV_S7_BY_M5 : `AXI_BV_S7_BY_M5;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[5][8]  = (~remap_n) ? `AXI_NV_S8_BY_M5 : `AXI_BV_S8_BY_M5;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[5][9]  = (~remap_n) ? `AXI_NV_S9_BY_M5 : `AXI_BV_S9_BY_M5;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[5][10]  = (~remap_n) ? `AXI_NV_S10_BY_M5 : `AXI_BV_S10_BY_M5;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[5][11]  = (~remap_n) ? `AXI_NV_S11_BY_M5 : `AXI_BV_S11_BY_M5;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[5][12]  = (~remap_n) ? `AXI_NV_S12_BY_M5 : `AXI_BV_S12_BY_M5;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[5][13]  = (~remap_n) ? `AXI_NV_S13_BY_M5 : `AXI_BV_S13_BY_M5;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[5][14]  = (~remap_n) ? `AXI_NV_S14_BY_M5 : `AXI_BV_S14_BY_M5;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[5][15]  = (~remap_n) ? `AXI_NV_S15_BY_M5 : `AXI_BV_S15_BY_M5;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[5][16]  = (~remap_n) ? `AXI_NV_S16_BY_M5 : `AXI_BV_S16_BY_M5;
 `endif
`endif 
`ifdef AXI_HAS_M6 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[6][1]  = (~remap_n) ? `AXI_NV_S1_BY_M6 : `AXI_BV_S1_BY_M6;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[6][2]  = (~remap_n) ? `AXI_NV_S2_BY_M6 : `AXI_BV_S2_BY_M6;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[6][3]  = (~remap_n) ? `AXI_NV_S3_BY_M6 : `AXI_BV_S3_BY_M6;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[6][4]  = (~remap_n) ? `AXI_NV_S4_BY_M6 : `AXI_BV_S4_BY_M6;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[6][5]  = (~remap_n) ? `AXI_NV_S5_BY_M6 : `AXI_BV_S5_BY_M6;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[6][6]  = (~remap_n) ? `AXI_NV_S6_BY_M6 : `AXI_BV_S6_BY_M6;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[6][7]  = (~remap_n) ? `AXI_NV_S7_BY_M6 : `AXI_BV_S7_BY_M6;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[6][8]  = (~remap_n) ? `AXI_NV_S8_BY_M6 : `AXI_BV_S8_BY_M6;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[6][9]  = (~remap_n) ? `AXI_NV_S9_BY_M6 : `AXI_BV_S9_BY_M6;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[6][10]  = (~remap_n) ? `AXI_NV_S10_BY_M6 : `AXI_BV_S10_BY_M6;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[6][11]  = (~remap_n) ? `AXI_NV_S11_BY_M6 : `AXI_BV_S11_BY_M6;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[6][12]  = (~remap_n) ? `AXI_NV_S12_BY_M6 : `AXI_BV_S12_BY_M6;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[6][13]  = (~remap_n) ? `AXI_NV_S13_BY_M6 : `AXI_BV_S13_BY_M6;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[6][14]  = (~remap_n) ? `AXI_NV_S14_BY_M6 : `AXI_BV_S14_BY_M6;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[6][15]  = (~remap_n) ? `AXI_NV_S15_BY_M6 : `AXI_BV_S15_BY_M6;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[6][16]  = (~remap_n) ? `AXI_NV_S16_BY_M6 : `AXI_BV_S16_BY_M6;
 `endif
`endif 
`ifdef AXI_HAS_M7 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[7][1]  = (~remap_n) ? `AXI_NV_S1_BY_M7 : `AXI_BV_S1_BY_M7;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[7][2]  = (~remap_n) ? `AXI_NV_S2_BY_M7 : `AXI_BV_S2_BY_M7;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[7][3]  = (~remap_n) ? `AXI_NV_S3_BY_M7 : `AXI_BV_S3_BY_M7;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[7][4]  = (~remap_n) ? `AXI_NV_S4_BY_M7 : `AXI_BV_S4_BY_M7;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[7][5]  = (~remap_n) ? `AXI_NV_S5_BY_M7 : `AXI_BV_S5_BY_M7;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[7][6]  = (~remap_n) ? `AXI_NV_S6_BY_M7 : `AXI_BV_S6_BY_M7;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[7][7]  = (~remap_n) ? `AXI_NV_S7_BY_M7 : `AXI_BV_S7_BY_M7;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[7][8]  = (~remap_n) ? `AXI_NV_S8_BY_M7 : `AXI_BV_S8_BY_M7;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[7][9]  = (~remap_n) ? `AXI_NV_S9_BY_M7 : `AXI_BV_S9_BY_M7;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[7][10]  = (~remap_n) ? `AXI_NV_S10_BY_M7 : `AXI_BV_S10_BY_M7;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[7][11]  = (~remap_n) ? `AXI_NV_S11_BY_M7 : `AXI_BV_S11_BY_M7;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[7][12]  = (~remap_n) ? `AXI_NV_S12_BY_M7 : `AXI_BV_S12_BY_M7;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[7][13]  = (~remap_n) ? `AXI_NV_S13_BY_M7 : `AXI_BV_S13_BY_M7;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[7][14]  = (~remap_n) ? `AXI_NV_S14_BY_M7 : `AXI_BV_S14_BY_M7;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[7][15]  = (~remap_n) ? `AXI_NV_S15_BY_M7 : `AXI_BV_S15_BY_M7;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[7][16]  = (~remap_n) ? `AXI_NV_S16_BY_M7 : `AXI_BV_S16_BY_M7;
 `endif
`endif 
`ifdef AXI_HAS_M8 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[8][1]  = (~remap_n) ? `AXI_NV_S1_BY_M8 : `AXI_BV_S1_BY_M8;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[8][2]  = (~remap_n) ? `AXI_NV_S2_BY_M8 : `AXI_BV_S2_BY_M8;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[8][3]  = (~remap_n) ? `AXI_NV_S3_BY_M8 : `AXI_BV_S3_BY_M8;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[8][4]  = (~remap_n) ? `AXI_NV_S4_BY_M8 : `AXI_BV_S4_BY_M8;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[8][5]  = (~remap_n) ? `AXI_NV_S5_BY_M8 : `AXI_BV_S5_BY_M8;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[8][6]  = (~remap_n) ? `AXI_NV_S6_BY_M8 : `AXI_BV_S6_BY_M8;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[8][7]  = (~remap_n) ? `AXI_NV_S7_BY_M8 : `AXI_BV_S7_BY_M8;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[8][8]  = (~remap_n) ? `AXI_NV_S8_BY_M8 : `AXI_BV_S8_BY_M8;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[8][9]  = (~remap_n) ? `AXI_NV_S9_BY_M8 : `AXI_BV_S9_BY_M8;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[8][10]  = (~remap_n) ? `AXI_NV_S10_BY_M8 : `AXI_BV_S10_BY_M8;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[8][11]  = (~remap_n) ? `AXI_NV_S11_BY_M8 : `AXI_BV_S11_BY_M8;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[8][12]  = (~remap_n) ? `AXI_NV_S12_BY_M8 : `AXI_BV_S12_BY_M8;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[8][13]  = (~remap_n) ? `AXI_NV_S13_BY_M8 : `AXI_BV_S13_BY_M8;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[8][14]  = (~remap_n) ? `AXI_NV_S14_BY_M8 : `AXI_BV_S14_BY_M8;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[8][15]  = (~remap_n) ? `AXI_NV_S15_BY_M8 : `AXI_BV_S15_BY_M8;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[8][16]  = (~remap_n) ? `AXI_NV_S16_BY_M8 : `AXI_BV_S16_BY_M8;
 `endif
`endif 
`ifdef AXI_HAS_M9 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[9][1]  = (~remap_n) ? `AXI_NV_S1_BY_M9 : `AXI_BV_S1_BY_M9;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[9][2]  = (~remap_n) ? `AXI_NV_S2_BY_M9 : `AXI_BV_S2_BY_M9;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[9][3]  = (~remap_n) ? `AXI_NV_S3_BY_M9 : `AXI_BV_S3_BY_M9;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[9][4]  = (~remap_n) ? `AXI_NV_S4_BY_M9 : `AXI_BV_S4_BY_M9;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[9][5]  = (~remap_n) ? `AXI_NV_S5_BY_M9 : `AXI_BV_S5_BY_M9;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[9][6]  = (~remap_n) ? `AXI_NV_S6_BY_M9 : `AXI_BV_S6_BY_M9;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[9][7]  = (~remap_n) ? `AXI_NV_S7_BY_M9 : `AXI_BV_S7_BY_M9;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[9][8]  = (~remap_n) ? `AXI_NV_S8_BY_M9 : `AXI_BV_S8_BY_M9;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[9][9]  = (~remap_n) ? `AXI_NV_S9_BY_M9 : `AXI_BV_S9_BY_M9;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[9][10]  = (~remap_n) ? `AXI_NV_S10_BY_M9 : `AXI_BV_S10_BY_M9;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[9][11]  = (~remap_n) ? `AXI_NV_S11_BY_M9 : `AXI_BV_S11_BY_M9;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[9][12]  = (~remap_n) ? `AXI_NV_S12_BY_M9 : `AXI_BV_S12_BY_M9;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[9][13]  = (~remap_n) ? `AXI_NV_S13_BY_M9 : `AXI_BV_S13_BY_M9;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[9][14]  = (~remap_n) ? `AXI_NV_S14_BY_M9 : `AXI_BV_S14_BY_M9;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[9][15]  = (~remap_n) ? `AXI_NV_S15_BY_M9 : `AXI_BV_S15_BY_M9;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[9][16]  = (~remap_n) ? `AXI_NV_S16_BY_M9 : `AXI_BV_S16_BY_M9;
 `endif
`endif 
`ifdef AXI_HAS_M10 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[10][1]  = (~remap_n) ? `AXI_NV_S1_BY_M10 : `AXI_BV_S1_BY_M10;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[10][2]  = (~remap_n) ? `AXI_NV_S2_BY_M10 : `AXI_BV_S2_BY_M10;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[10][3]  = (~remap_n) ? `AXI_NV_S3_BY_M10 : `AXI_BV_S3_BY_M10;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[10][4]  = (~remap_n) ? `AXI_NV_S4_BY_M10 : `AXI_BV_S4_BY_M10;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[10][5]  = (~remap_n) ? `AXI_NV_S5_BY_M10 : `AXI_BV_S5_BY_M10;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[10][6]  = (~remap_n) ? `AXI_NV_S6_BY_M10 : `AXI_BV_S6_BY_M10;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[10][7]  = (~remap_n) ? `AXI_NV_S7_BY_M10 : `AXI_BV_S7_BY_M10;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[10][8]  = (~remap_n) ? `AXI_NV_S8_BY_M10 : `AXI_BV_S8_BY_M10;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[10][9]  = (~remap_n) ? `AXI_NV_S9_BY_M10 : `AXI_BV_S9_BY_M10;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[10][10]  = (~remap_n) ? `AXI_NV_S10_BY_M10 : `AXI_BV_S10_BY_M10;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[10][11]  = (~remap_n) ? `AXI_NV_S11_BY_M10 : `AXI_BV_S11_BY_M10;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[10][12]  = (~remap_n) ? `AXI_NV_S12_BY_M10 : `AXI_BV_S12_BY_M10;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[10][13]  = (~remap_n) ? `AXI_NV_S13_BY_M10 : `AXI_BV_S13_BY_M10;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[10][14]  = (~remap_n) ? `AXI_NV_S14_BY_M10 : `AXI_BV_S14_BY_M10;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[10][15]  = (~remap_n) ? `AXI_NV_S15_BY_M10 : `AXI_BV_S15_BY_M10;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[10][16]  = (~remap_n) ? `AXI_NV_S16_BY_M10 : `AXI_BV_S16_BY_M10;
 `endif
`endif 
`ifdef AXI_HAS_M11 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[11][1]  = (~remap_n) ? `AXI_NV_S1_BY_M11 : `AXI_BV_S1_BY_M11;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[11][2]  = (~remap_n) ? `AXI_NV_S2_BY_M11 : `AXI_BV_S2_BY_M11;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[11][3]  = (~remap_n) ? `AXI_NV_S3_BY_M11 : `AXI_BV_S3_BY_M11;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[11][4]  = (~remap_n) ? `AXI_NV_S4_BY_M11 : `AXI_BV_S4_BY_M11;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[11][5]  = (~remap_n) ? `AXI_NV_S5_BY_M11 : `AXI_BV_S5_BY_M11;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[11][6]  = (~remap_n) ? `AXI_NV_S6_BY_M11 : `AXI_BV_S6_BY_M11;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[11][7]  = (~remap_n) ? `AXI_NV_S7_BY_M11 : `AXI_BV_S7_BY_M11;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[11][8]  = (~remap_n) ? `AXI_NV_S8_BY_M11 : `AXI_BV_S8_BY_M11;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[11][9]  = (~remap_n) ? `AXI_NV_S9_BY_M11 : `AXI_BV_S9_BY_M11;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[11][10]  = (~remap_n) ? `AXI_NV_S10_BY_M11 : `AXI_BV_S10_BY_M11;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[11][11]  = (~remap_n) ? `AXI_NV_S11_BY_M11 : `AXI_BV_S11_BY_M11;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[11][12]  = (~remap_n) ? `AXI_NV_S12_BY_M11 : `AXI_BV_S12_BY_M11;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[11][13]  = (~remap_n) ? `AXI_NV_S13_BY_M11 : `AXI_BV_S13_BY_M11;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[11][14]  = (~remap_n) ? `AXI_NV_S14_BY_M11 : `AXI_BV_S14_BY_M11;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[11][15]  = (~remap_n) ? `AXI_NV_S15_BY_M11 : `AXI_BV_S15_BY_M11;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[11][16]  = (~remap_n) ? `AXI_NV_S16_BY_M11 : `AXI_BV_S16_BY_M11;
 `endif
`endif 
`ifdef AXI_HAS_M12 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[12][1]  = (~remap_n) ? `AXI_NV_S1_BY_M12 : `AXI_BV_S1_BY_M12;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[12][2]  = (~remap_n) ? `AXI_NV_S2_BY_M12 : `AXI_BV_S2_BY_M12;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[12][3]  = (~remap_n) ? `AXI_NV_S3_BY_M12 : `AXI_BV_S3_BY_M12;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[12][4]  = (~remap_n) ? `AXI_NV_S4_BY_M12 : `AXI_BV_S4_BY_M12;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[12][5]  = (~remap_n) ? `AXI_NV_S5_BY_M12 : `AXI_BV_S5_BY_M12;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[12][6]  = (~remap_n) ? `AXI_NV_S6_BY_M12 : `AXI_BV_S6_BY_M12;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[12][7]  = (~remap_n) ? `AXI_NV_S7_BY_M12 : `AXI_BV_S7_BY_M12;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[12][8]  = (~remap_n) ? `AXI_NV_S8_BY_M12 : `AXI_BV_S8_BY_M12;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[12][9]  = (~remap_n) ? `AXI_NV_S9_BY_M12 : `AXI_BV_S9_BY_M12;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[12][10]  = (~remap_n) ? `AXI_NV_S10_BY_M12 : `AXI_BV_S10_BY_M12;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[12][11]  = (~remap_n) ? `AXI_NV_S11_BY_M12 : `AXI_BV_S11_BY_M12;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[12][12]  = (~remap_n) ? `AXI_NV_S12_BY_M12 : `AXI_BV_S12_BY_M12;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[12][13]  = (~remap_n) ? `AXI_NV_S13_BY_M12 : `AXI_BV_S13_BY_M12;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[12][14]  = (~remap_n) ? `AXI_NV_S14_BY_M12 : `AXI_BV_S14_BY_M12;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[12][15]  = (~remap_n) ? `AXI_NV_S15_BY_M12 : `AXI_BV_S15_BY_M12;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[12][16]  = (~remap_n) ? `AXI_NV_S16_BY_M12 : `AXI_BV_S16_BY_M12;
 `endif
`endif 
`ifdef AXI_HAS_M13 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[13][1]  = (~remap_n) ? `AXI_NV_S1_BY_M13 : `AXI_BV_S1_BY_M13;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[13][2]  = (~remap_n) ? `AXI_NV_S2_BY_M13 : `AXI_BV_S2_BY_M13;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[13][3]  = (~remap_n) ? `AXI_NV_S3_BY_M13 : `AXI_BV_S3_BY_M13;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[13][4]  = (~remap_n) ? `AXI_NV_S4_BY_M13 : `AXI_BV_S4_BY_M13;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[13][5]  = (~remap_n) ? `AXI_NV_S5_BY_M13 : `AXI_BV_S5_BY_M13;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[13][6]  = (~remap_n) ? `AXI_NV_S6_BY_M13 : `AXI_BV_S6_BY_M13;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[13][7]  = (~remap_n) ? `AXI_NV_S7_BY_M13 : `AXI_BV_S7_BY_M13;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[13][8]  = (~remap_n) ? `AXI_NV_S8_BY_M13 : `AXI_BV_S8_BY_M13;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[13][9]  = (~remap_n) ? `AXI_NV_S9_BY_M13 : `AXI_BV_S9_BY_M13;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[13][10]  = (~remap_n) ? `AXI_NV_S10_BY_M13 : `AXI_BV_S10_BY_M13;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[13][11]  = (~remap_n) ? `AXI_NV_S11_BY_M13 : `AXI_BV_S11_BY_M13;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[13][12]  = (~remap_n) ? `AXI_NV_S12_BY_M13 : `AXI_BV_S12_BY_M13;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[13][13]  = (~remap_n) ? `AXI_NV_S13_BY_M13 : `AXI_BV_S13_BY_M13;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[13][14]  = (~remap_n) ? `AXI_NV_S14_BY_M13 : `AXI_BV_S14_BY_M13;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[13][15]  = (~remap_n) ? `AXI_NV_S15_BY_M13 : `AXI_BV_S15_BY_M13;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[13][16]  = (~remap_n) ? `AXI_NV_S16_BY_M13 : `AXI_BV_S16_BY_M13;
 `endif
`endif 
`ifdef AXI_HAS_M14 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[14][1]  = (~remap_n) ? `AXI_NV_S1_BY_M14 : `AXI_BV_S1_BY_M14;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[14][2]  = (~remap_n) ? `AXI_NV_S2_BY_M14 : `AXI_BV_S2_BY_M14;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[14][3]  = (~remap_n) ? `AXI_NV_S3_BY_M14 : `AXI_BV_S3_BY_M14;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[14][4]  = (~remap_n) ? `AXI_NV_S4_BY_M14 : `AXI_BV_S4_BY_M14;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[14][5]  = (~remap_n) ? `AXI_NV_S5_BY_M14 : `AXI_BV_S5_BY_M14;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[14][6]  = (~remap_n) ? `AXI_NV_S6_BY_M14 : `AXI_BV_S6_BY_M14;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[14][7]  = (~remap_n) ? `AXI_NV_S7_BY_M14 : `AXI_BV_S7_BY_M14;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[14][8]  = (~remap_n) ? `AXI_NV_S8_BY_M14 : `AXI_BV_S8_BY_M14;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[14][9]  = (~remap_n) ? `AXI_NV_S9_BY_M14 : `AXI_BV_S9_BY_M14;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[14][10]  = (~remap_n) ? `AXI_NV_S10_BY_M14 : `AXI_BV_S10_BY_M14;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[14][11]  = (~remap_n) ? `AXI_NV_S11_BY_M14 : `AXI_BV_S11_BY_M14;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[14][12]  = (~remap_n) ? `AXI_NV_S12_BY_M14 : `AXI_BV_S12_BY_M14;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[14][13]  = (~remap_n) ? `AXI_NV_S13_BY_M14 : `AXI_BV_S13_BY_M14;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[14][14]  = (~remap_n) ? `AXI_NV_S14_BY_M14 : `AXI_BV_S14_BY_M14;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[14][15]  = (~remap_n) ? `AXI_NV_S15_BY_M14 : `AXI_BV_S15_BY_M14;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[14][16]  = (~remap_n) ? `AXI_NV_S16_BY_M14 : `AXI_BV_S16_BY_M14;
 `endif
`endif 
`ifdef AXI_HAS_M15 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[15][1]  = (~remap_n) ? `AXI_NV_S1_BY_M15 : `AXI_BV_S1_BY_M15;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[15][2]  = (~remap_n) ? `AXI_NV_S2_BY_M15 : `AXI_BV_S2_BY_M15;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[15][3]  = (~remap_n) ? `AXI_NV_S3_BY_M15 : `AXI_BV_S3_BY_M15;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[15][4]  = (~remap_n) ? `AXI_NV_S4_BY_M15 : `AXI_BV_S4_BY_M15;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[15][5]  = (~remap_n) ? `AXI_NV_S5_BY_M15 : `AXI_BV_S5_BY_M15;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[15][6]  = (~remap_n) ? `AXI_NV_S6_BY_M15 : `AXI_BV_S6_BY_M15;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[15][7]  = (~remap_n) ? `AXI_NV_S7_BY_M15 : `AXI_BV_S7_BY_M15;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[15][8]  = (~remap_n) ? `AXI_NV_S8_BY_M15 : `AXI_BV_S8_BY_M15;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[15][9]  = (~remap_n) ? `AXI_NV_S9_BY_M15 : `AXI_BV_S9_BY_M15;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[15][10]  = (~remap_n) ? `AXI_NV_S10_BY_M15 : `AXI_BV_S10_BY_M15;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[15][11]  = (~remap_n) ? `AXI_NV_S11_BY_M15 : `AXI_BV_S11_BY_M15;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[15][12]  = (~remap_n) ? `AXI_NV_S12_BY_M15 : `AXI_BV_S12_BY_M15;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[15][13]  = (~remap_n) ? `AXI_NV_S13_BY_M15 : `AXI_BV_S13_BY_M15;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[15][14]  = (~remap_n) ? `AXI_NV_S14_BY_M15 : `AXI_BV_S14_BY_M15;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[15][15]  = (~remap_n) ? `AXI_NV_S15_BY_M15 : `AXI_BV_S15_BY_M15;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[15][16]  = (~remap_n) ? `AXI_NV_S16_BY_M15 : `AXI_BV_S16_BY_M15;
 `endif
`endif 
`ifdef AXI_HAS_M16 
`ifdef AXI_HAS_S1 
   assign visible_slaves_other_mode[16][1]  = (~remap_n) ? `AXI_NV_S1_BY_M16 : `AXI_BV_S1_BY_M16;
 `endif
`ifdef AXI_HAS_S2 
   assign visible_slaves_other_mode[16][2]  = (~remap_n) ? `AXI_NV_S2_BY_M16 : `AXI_BV_S2_BY_M16;
 `endif
`ifdef AXI_HAS_S3 
   assign visible_slaves_other_mode[16][3]  = (~remap_n) ? `AXI_NV_S3_BY_M16 : `AXI_BV_S3_BY_M16;
 `endif
`ifdef AXI_HAS_S4 
   assign visible_slaves_other_mode[16][4]  = (~remap_n) ? `AXI_NV_S4_BY_M16 : `AXI_BV_S4_BY_M16;
 `endif
`ifdef AXI_HAS_S5 
   assign visible_slaves_other_mode[16][5]  = (~remap_n) ? `AXI_NV_S5_BY_M16 : `AXI_BV_S5_BY_M16;
 `endif
`ifdef AXI_HAS_S6 
   assign visible_slaves_other_mode[16][6]  = (~remap_n) ? `AXI_NV_S6_BY_M16 : `AXI_BV_S6_BY_M16;
 `endif
`ifdef AXI_HAS_S7 
   assign visible_slaves_other_mode[16][7]  = (~remap_n) ? `AXI_NV_S7_BY_M16 : `AXI_BV_S7_BY_M16;
 `endif
`ifdef AXI_HAS_S8 
   assign visible_slaves_other_mode[16][8]  = (~remap_n) ? `AXI_NV_S8_BY_M16 : `AXI_BV_S8_BY_M16;
 `endif
`ifdef AXI_HAS_S9 
   assign visible_slaves_other_mode[16][9]  = (~remap_n) ? `AXI_NV_S9_BY_M16 : `AXI_BV_S9_BY_M16;
 `endif
`ifdef AXI_HAS_S10 
   assign visible_slaves_other_mode[16][10]  = (~remap_n) ? `AXI_NV_S10_BY_M16 : `AXI_BV_S10_BY_M16;
 `endif
`ifdef AXI_HAS_S11 
   assign visible_slaves_other_mode[16][11]  = (~remap_n) ? `AXI_NV_S11_BY_M16 : `AXI_BV_S11_BY_M16;
 `endif
`ifdef AXI_HAS_S12 
   assign visible_slaves_other_mode[16][12]  = (~remap_n) ? `AXI_NV_S12_BY_M16 : `AXI_BV_S12_BY_M16;
 `endif
`ifdef AXI_HAS_S13 
   assign visible_slaves_other_mode[16][13]  = (~remap_n) ? `AXI_NV_S13_BY_M16 : `AXI_BV_S13_BY_M16;
 `endif
`ifdef AXI_HAS_S14 
   assign visible_slaves_other_mode[16][14]  = (~remap_n) ? `AXI_NV_S14_BY_M16 : `AXI_BV_S14_BY_M16;
 `endif
`ifdef AXI_HAS_S15 
   assign visible_slaves_other_mode[16][15]  = (~remap_n) ? `AXI_NV_S15_BY_M16 : `AXI_BV_S15_BY_M16;
 `endif
`ifdef AXI_HAS_S16 
   assign visible_slaves_other_mode[16][16]  = (~remap_n) ? `AXI_NV_S16_BY_M16 : `AXI_BV_S16_BY_M16;
 `endif
`endif 


`ifdef AXI_HAS_S1
   assign slv_wid_array[0]  = 1;
`endif
`ifdef AXI_HAS_S1
   assign slv_wid_array[1]  = (num_vis_mst[1] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S1;
`endif
`ifdef AXI_HAS_S2
   assign slv_wid_array[2]  = (num_vis_mst[2] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S2;
`endif
`ifdef AXI_HAS_S3
   assign slv_wid_array[3]  = (num_vis_mst[3] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S3;
`endif
`ifdef AXI_HAS_S4
   assign slv_wid_array[4]  = (num_vis_mst[4] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S4;
`endif
`ifdef AXI_HAS_S5
   assign slv_wid_array[5]  = (num_vis_mst[5] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S5;
`endif
`ifdef AXI_HAS_S6
   assign slv_wid_array[6]  = (num_vis_mst[6] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S6;
`endif
`ifdef AXI_HAS_S7
   assign slv_wid_array[7]  = (num_vis_mst[7] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S7;
`endif
`ifdef AXI_HAS_S8
   assign slv_wid_array[8]  = (num_vis_mst[8] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S8;
`endif
`ifdef AXI_HAS_S9
   assign slv_wid_array[9]  = (num_vis_mst[9] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S9;
`endif
`ifdef AXI_HAS_S10
   assign slv_wid_array[10]  = (num_vis_mst[10] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S10;
`endif
`ifdef AXI_HAS_S11
   assign slv_wid_array[11]  = (num_vis_mst[11] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S11;
`endif
`ifdef AXI_HAS_S12
   assign slv_wid_array[12]  = (num_vis_mst[12] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S12;
`endif
`ifdef AXI_HAS_S13
   assign slv_wid_array[13]  = (num_vis_mst[13] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S13;
`endif
`ifdef AXI_HAS_S14
   assign slv_wid_array[14]  = (num_vis_mst[14] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S14;
`endif
`ifdef AXI_HAS_S15
   assign slv_wid_array[15]  = (num_vis_mst[15] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S15;
`endif
`ifdef AXI_HAS_S16
   assign slv_wid_array[16]  = (num_vis_mst[16] == 1) ? ((`AXI_MIDW <= 4) ? ({`AXI_MIDW{1'b1}} + 1) : 16) : `AXI_WID_S16;
`endif

 `ifdef AXI_HAS_S1
   assign slv_num_regions[0]  = 1;
 `endif
 `ifdef AXI_HAS_S1 
   assign slv_num_regions[1]  = (remap_n) ? `AXI_NUM_RN_S1 : `AXI_NUM_RB_S1;
 `endif
 `ifdef AXI_HAS_S2 
   assign slv_num_regions[2]  = (remap_n) ? `AXI_NUM_RN_S2 : `AXI_NUM_RB_S2;
 `endif
 `ifdef AXI_HAS_S3 
   assign slv_num_regions[3]  = (remap_n) ? `AXI_NUM_RN_S3 : `AXI_NUM_RB_S3;
 `endif
 `ifdef AXI_HAS_S4 
   assign slv_num_regions[4]  = (remap_n) ? `AXI_NUM_RN_S4 : `AXI_NUM_RB_S4;
 `endif
 `ifdef AXI_HAS_S5 
   assign slv_num_regions[5]  = (remap_n) ? `AXI_NUM_RN_S5 : `AXI_NUM_RB_S5;
 `endif
 `ifdef AXI_HAS_S6 
   assign slv_num_regions[6]  = (remap_n) ? `AXI_NUM_RN_S6 : `AXI_NUM_RB_S6;
 `endif
 `ifdef AXI_HAS_S7 
   assign slv_num_regions[7]  = (remap_n) ? `AXI_NUM_RN_S7 : `AXI_NUM_RB_S7;
 `endif
 `ifdef AXI_HAS_S8 
   assign slv_num_regions[8]  = (remap_n) ? `AXI_NUM_RN_S8 : `AXI_NUM_RB_S8;
 `endif
 `ifdef AXI_HAS_S9 
   assign slv_num_regions[9]  = (remap_n) ? `AXI_NUM_RN_S9 : `AXI_NUM_RB_S9;
 `endif
 `ifdef AXI_HAS_S10 
   assign slv_num_regions[10]  = (remap_n) ? `AXI_NUM_RN_S10 : `AXI_NUM_RB_S10;
 `endif
 `ifdef AXI_HAS_S11 
   assign slv_num_regions[11]  = (remap_n) ? `AXI_NUM_RN_S11 : `AXI_NUM_RB_S11;
 `endif
 `ifdef AXI_HAS_S12 
   assign slv_num_regions[12]  = (remap_n) ? `AXI_NUM_RN_S12 : `AXI_NUM_RB_S12;
 `endif
 `ifdef AXI_HAS_S13 
   assign slv_num_regions[13]  = (remap_n) ? `AXI_NUM_RN_S13 : `AXI_NUM_RB_S13;
 `endif
 `ifdef AXI_HAS_S14 
   assign slv_num_regions[14]  = (remap_n) ? `AXI_NUM_RN_S14 : `AXI_NUM_RB_S14;
 `endif
 `ifdef AXI_HAS_S15 
   assign slv_num_regions[15]  = (remap_n) ? `AXI_NUM_RN_S15 : `AXI_NUM_RB_S15;
 `endif
 `ifdef AXI_HAS_S16 
   assign slv_num_regions[16]  = (remap_n) ? `AXI_NUM_RN_S16 : `AXI_NUM_RB_S16;
 `endif

 `ifdef AXI_HAS_S1 
   assign  slv_region_start_array[1][0] = (remap_n) ? `AXI_R1_NSA_S1 : `AXI_R1_BSA_S1;
   assign  slv_region_start_array[1][1] = (remap_n) ? `AXI_R2_NSA_S1 : `AXI_R2_BSA_S1;
   assign  slv_region_start_array[1][2] = (remap_n) ? `AXI_R3_NSA_S1 : `AXI_R3_BSA_S1;
   assign  slv_region_start_array[1][3] = (remap_n) ? `AXI_R4_NSA_S1 : `AXI_R4_BSA_S1;
   assign  slv_region_start_array[1][4] = (remap_n) ? `AXI_R5_NSA_S1 : `AXI_R5_BSA_S1;
   assign  slv_region_start_array[1][5] = (remap_n) ? `AXI_R6_NSA_S1 : `AXI_R6_BSA_S1;
   assign  slv_region_start_array[1][6] = (remap_n) ? `AXI_R7_NSA_S1 : `AXI_R7_BSA_S1;
   assign  slv_region_start_array[1][7] = (remap_n) ? `AXI_R8_NSA_S1 : `AXI_R8_BSA_S1;
      
   assign  slv_region_end_array[1][0] = (remap_n) ? `AXI_R1_NEA_S1 : `AXI_R1_BEA_S1;
   assign  slv_region_end_array[1][1] = (remap_n) ? `AXI_R2_NEA_S1 : `AXI_R2_BEA_S1;
   assign  slv_region_end_array[1][2] = (remap_n) ? `AXI_R3_NEA_S1 : `AXI_R3_BEA_S1;
   assign  slv_region_end_array[1][3] = (remap_n) ? `AXI_R4_NEA_S1 : `AXI_R4_BEA_S1;
   assign  slv_region_end_array[1][4] = (remap_n) ? `AXI_R5_NEA_S1 : `AXI_R5_BEA_S1;
   assign  slv_region_end_array[1][5] = (remap_n) ? `AXI_R6_NEA_S1 : `AXI_R6_BEA_S1;
   assign  slv_region_end_array[1][6] = (remap_n) ? `AXI_R7_NEA_S1 : `AXI_R7_BEA_S1;
   assign  slv_region_end_array[1][7] = (remap_n) ? `AXI_R8_NEA_S1 : `AXI_R8_BEA_S1;
 `endif
   
 `ifdef AXI_HAS_S2 
   assign  slv_region_start_array[2][0] = (remap_n) ? `AXI_R1_NSA_S2 : `AXI_R1_BSA_S2;
   assign  slv_region_start_array[2][1] = (remap_n) ? `AXI_R2_NSA_S2 : `AXI_R2_BSA_S2;
   assign  slv_region_start_array[2][2] = (remap_n) ? `AXI_R3_NSA_S2 : `AXI_R3_BSA_S2;
   assign  slv_region_start_array[2][3] = (remap_n) ? `AXI_R4_NSA_S2 : `AXI_R4_BSA_S2;
   assign  slv_region_start_array[2][4] = (remap_n) ? `AXI_R5_NSA_S2 : `AXI_R5_BSA_S2;
   assign  slv_region_start_array[2][5] = (remap_n) ? `AXI_R6_NSA_S2 : `AXI_R6_BSA_S2;
   assign  slv_region_start_array[2][6] = (remap_n) ? `AXI_R7_NSA_S2 : `AXI_R7_BSA_S2;
   assign  slv_region_start_array[2][7] = (remap_n) ? `AXI_R8_NSA_S2 : `AXI_R8_BSA_S2;
      
   assign  slv_region_end_array[2][0] = (remap_n) ? `AXI_R1_NEA_S2 : `AXI_R1_BEA_S2;
   assign  slv_region_end_array[2][1] = (remap_n) ? `AXI_R2_NEA_S2 : `AXI_R2_BEA_S2;
   assign  slv_region_end_array[2][2] = (remap_n) ? `AXI_R3_NEA_S2 : `AXI_R3_BEA_S2;
   assign  slv_region_end_array[2][3] = (remap_n) ? `AXI_R4_NEA_S2 : `AXI_R4_BEA_S2;
   assign  slv_region_end_array[2][4] = (remap_n) ? `AXI_R5_NEA_S2 : `AXI_R5_BEA_S2;
   assign  slv_region_end_array[2][5] = (remap_n) ? `AXI_R6_NEA_S2 : `AXI_R6_BEA_S2;
   assign  slv_region_end_array[2][6] = (remap_n) ? `AXI_R7_NEA_S2 : `AXI_R7_BEA_S2;
   assign  slv_region_end_array[2][7] = (remap_n) ? `AXI_R8_NEA_S2 : `AXI_R8_BEA_S2;
 `endif
   
 `ifdef AXI_HAS_S3 
   assign  slv_region_start_array[3][0] = (remap_n) ? `AXI_R1_NSA_S3 : `AXI_R1_BSA_S3;
   assign  slv_region_start_array[3][1] = (remap_n) ? `AXI_R2_NSA_S3 : `AXI_R2_BSA_S3;
   assign  slv_region_start_array[3][2] = (remap_n) ? `AXI_R3_NSA_S3 : `AXI_R3_BSA_S3;
   assign  slv_region_start_array[3][3] = (remap_n) ? `AXI_R4_NSA_S3 : `AXI_R4_BSA_S3;
   assign  slv_region_start_array[3][4] = (remap_n) ? `AXI_R5_NSA_S3 : `AXI_R5_BSA_S3;
   assign  slv_region_start_array[3][5] = (remap_n) ? `AXI_R6_NSA_S3 : `AXI_R6_BSA_S3;
   assign  slv_region_start_array[3][6] = (remap_n) ? `AXI_R7_NSA_S3 : `AXI_R7_BSA_S3;
   assign  slv_region_start_array[3][7] = (remap_n) ? `AXI_R8_NSA_S3 : `AXI_R8_BSA_S3;
      
   assign  slv_region_end_array[3][0] = (remap_n) ? `AXI_R1_NEA_S3 : `AXI_R1_BEA_S3;
   assign  slv_region_end_array[3][1] = (remap_n) ? `AXI_R2_NEA_S3 : `AXI_R2_BEA_S3;
   assign  slv_region_end_array[3][2] = (remap_n) ? `AXI_R3_NEA_S3 : `AXI_R3_BEA_S3;
   assign  slv_region_end_array[3][3] = (remap_n) ? `AXI_R4_NEA_S3 : `AXI_R4_BEA_S3;
   assign  slv_region_end_array[3][4] = (remap_n) ? `AXI_R5_NEA_S3 : `AXI_R5_BEA_S3;
   assign  slv_region_end_array[3][5] = (remap_n) ? `AXI_R6_NEA_S3 : `AXI_R6_BEA_S3;
   assign  slv_region_end_array[3][6] = (remap_n) ? `AXI_R7_NEA_S3 : `AXI_R7_BEA_S3;
   assign  slv_region_end_array[3][7] = (remap_n) ? `AXI_R8_NEA_S3 : `AXI_R8_BEA_S3;
 `endif
   
 `ifdef AXI_HAS_S4 
   assign  slv_region_start_array[4][0] = (remap_n) ? `AXI_R1_NSA_S4 : `AXI_R1_BSA_S4;
   assign  slv_region_start_array[4][1] = (remap_n) ? `AXI_R2_NSA_S4 : `AXI_R2_BSA_S4;
   assign  slv_region_start_array[4][2] = (remap_n) ? `AXI_R3_NSA_S4 : `AXI_R3_BSA_S4;
   assign  slv_region_start_array[4][3] = (remap_n) ? `AXI_R4_NSA_S4 : `AXI_R4_BSA_S4;
   assign  slv_region_start_array[4][4] = (remap_n) ? `AXI_R5_NSA_S4 : `AXI_R5_BSA_S4;
   assign  slv_region_start_array[4][5] = (remap_n) ? `AXI_R6_NSA_S4 : `AXI_R6_BSA_S4;
   assign  slv_region_start_array[4][6] = (remap_n) ? `AXI_R7_NSA_S4 : `AXI_R7_BSA_S4;
   assign  slv_region_start_array[4][7] = (remap_n) ? `AXI_R8_NSA_S4 : `AXI_R8_BSA_S4;
      
   assign  slv_region_end_array[4][0] = (remap_n) ? `AXI_R1_NEA_S4 : `AXI_R1_BEA_S4;
   assign  slv_region_end_array[4][1] = (remap_n) ? `AXI_R2_NEA_S4 : `AXI_R2_BEA_S4;
   assign  slv_region_end_array[4][2] = (remap_n) ? `AXI_R3_NEA_S4 : `AXI_R3_BEA_S4;
   assign  slv_region_end_array[4][3] = (remap_n) ? `AXI_R4_NEA_S4 : `AXI_R4_BEA_S4;
   assign  slv_region_end_array[4][4] = (remap_n) ? `AXI_R5_NEA_S4 : `AXI_R5_BEA_S4;
   assign  slv_region_end_array[4][5] = (remap_n) ? `AXI_R6_NEA_S4 : `AXI_R6_BEA_S4;
   assign  slv_region_end_array[4][6] = (remap_n) ? `AXI_R7_NEA_S4 : `AXI_R7_BEA_S4;
   assign  slv_region_end_array[4][7] = (remap_n) ? `AXI_R8_NEA_S4 : `AXI_R8_BEA_S4;
 `endif
   
 `ifdef AXI_HAS_S5 
   assign  slv_region_start_array[5][0] = (remap_n) ? `AXI_R1_NSA_S5 : `AXI_R1_BSA_S5;
   assign  slv_region_start_array[5][1] = (remap_n) ? `AXI_R2_NSA_S5 : `AXI_R2_BSA_S5;
   assign  slv_region_start_array[5][2] = (remap_n) ? `AXI_R3_NSA_S5 : `AXI_R3_BSA_S5;
   assign  slv_region_start_array[5][3] = (remap_n) ? `AXI_R4_NSA_S5 : `AXI_R4_BSA_S5;
   assign  slv_region_start_array[5][4] = (remap_n) ? `AXI_R5_NSA_S5 : `AXI_R5_BSA_S5;
   assign  slv_region_start_array[5][5] = (remap_n) ? `AXI_R6_NSA_S5 : `AXI_R6_BSA_S5;
   assign  slv_region_start_array[5][6] = (remap_n) ? `AXI_R7_NSA_S5 : `AXI_R7_BSA_S5;
   assign  slv_region_start_array[5][7] = (remap_n) ? `AXI_R8_NSA_S5 : `AXI_R8_BSA_S5;
      
   assign  slv_region_end_array[5][0] = (remap_n) ? `AXI_R1_NEA_S5 : `AXI_R1_BEA_S5;
   assign  slv_region_end_array[5][1] = (remap_n) ? `AXI_R2_NEA_S5 : `AXI_R2_BEA_S5;
   assign  slv_region_end_array[5][2] = (remap_n) ? `AXI_R3_NEA_S5 : `AXI_R3_BEA_S5;
   assign  slv_region_end_array[5][3] = (remap_n) ? `AXI_R4_NEA_S5 : `AXI_R4_BEA_S5;
   assign  slv_region_end_array[5][4] = (remap_n) ? `AXI_R5_NEA_S5 : `AXI_R5_BEA_S5;
   assign  slv_region_end_array[5][5] = (remap_n) ? `AXI_R6_NEA_S5 : `AXI_R6_BEA_S5;
   assign  slv_region_end_array[5][6] = (remap_n) ? `AXI_R7_NEA_S5 : `AXI_R7_BEA_S5;
   assign  slv_region_end_array[5][7] = (remap_n) ? `AXI_R8_NEA_S5 : `AXI_R8_BEA_S5;
 `endif
   
 `ifdef AXI_HAS_S6 
   assign  slv_region_start_array[6][0] = (remap_n) ? `AXI_R1_NSA_S6 : `AXI_R1_BSA_S6;
   assign  slv_region_start_array[6][1] = (remap_n) ? `AXI_R2_NSA_S6 : `AXI_R2_BSA_S6;
   assign  slv_region_start_array[6][2] = (remap_n) ? `AXI_R3_NSA_S6 : `AXI_R3_BSA_S6;
   assign  slv_region_start_array[6][3] = (remap_n) ? `AXI_R4_NSA_S6 : `AXI_R4_BSA_S6;
   assign  slv_region_start_array[6][4] = (remap_n) ? `AXI_R5_NSA_S6 : `AXI_R5_BSA_S6;
   assign  slv_region_start_array[6][5] = (remap_n) ? `AXI_R6_NSA_S6 : `AXI_R6_BSA_S6;
   assign  slv_region_start_array[6][6] = (remap_n) ? `AXI_R7_NSA_S6 : `AXI_R7_BSA_S6;
   assign  slv_region_start_array[6][7] = (remap_n) ? `AXI_R8_NSA_S6 : `AXI_R8_BSA_S6;
      
   assign  slv_region_end_array[6][0] = (remap_n) ? `AXI_R1_NEA_S6 : `AXI_R1_BEA_S6;
   assign  slv_region_end_array[6][1] = (remap_n) ? `AXI_R2_NEA_S6 : `AXI_R2_BEA_S6;
   assign  slv_region_end_array[6][2] = (remap_n) ? `AXI_R3_NEA_S6 : `AXI_R3_BEA_S6;
   assign  slv_region_end_array[6][3] = (remap_n) ? `AXI_R4_NEA_S6 : `AXI_R4_BEA_S6;
   assign  slv_region_end_array[6][4] = (remap_n) ? `AXI_R5_NEA_S6 : `AXI_R5_BEA_S6;
   assign  slv_region_end_array[6][5] = (remap_n) ? `AXI_R6_NEA_S6 : `AXI_R6_BEA_S6;
   assign  slv_region_end_array[6][6] = (remap_n) ? `AXI_R7_NEA_S6 : `AXI_R7_BEA_S6;
   assign  slv_region_end_array[6][7] = (remap_n) ? `AXI_R8_NEA_S6 : `AXI_R8_BEA_S6;
 `endif
   
 `ifdef AXI_HAS_S7 
   assign  slv_region_start_array[7][0] = (remap_n) ? `AXI_R1_NSA_S7 : `AXI_R1_BSA_S7;
   assign  slv_region_start_array[7][1] = (remap_n) ? `AXI_R2_NSA_S7 : `AXI_R2_BSA_S7;
   assign  slv_region_start_array[7][2] = (remap_n) ? `AXI_R3_NSA_S7 : `AXI_R3_BSA_S7;
   assign  slv_region_start_array[7][3] = (remap_n) ? `AXI_R4_NSA_S7 : `AXI_R4_BSA_S7;
   assign  slv_region_start_array[7][4] = (remap_n) ? `AXI_R5_NSA_S7 : `AXI_R5_BSA_S7;
   assign  slv_region_start_array[7][5] = (remap_n) ? `AXI_R6_NSA_S7 : `AXI_R6_BSA_S7;
   assign  slv_region_start_array[7][6] = (remap_n) ? `AXI_R7_NSA_S7 : `AXI_R7_BSA_S7;
   assign  slv_region_start_array[7][7] = (remap_n) ? `AXI_R8_NSA_S7 : `AXI_R8_BSA_S7;
      
   assign  slv_region_end_array[7][0] = (remap_n) ? `AXI_R1_NEA_S7 : `AXI_R1_BEA_S7;
   assign  slv_region_end_array[7][1] = (remap_n) ? `AXI_R2_NEA_S7 : `AXI_R2_BEA_S7;
   assign  slv_region_end_array[7][2] = (remap_n) ? `AXI_R3_NEA_S7 : `AXI_R3_BEA_S7;
   assign  slv_region_end_array[7][3] = (remap_n) ? `AXI_R4_NEA_S7 : `AXI_R4_BEA_S7;
   assign  slv_region_end_array[7][4] = (remap_n) ? `AXI_R5_NEA_S7 : `AXI_R5_BEA_S7;
   assign  slv_region_end_array[7][5] = (remap_n) ? `AXI_R6_NEA_S7 : `AXI_R6_BEA_S7;
   assign  slv_region_end_array[7][6] = (remap_n) ? `AXI_R7_NEA_S7 : `AXI_R7_BEA_S7;
   assign  slv_region_end_array[7][7] = (remap_n) ? `AXI_R8_NEA_S7 : `AXI_R8_BEA_S7;
 `endif
   
 `ifdef AXI_HAS_S8 
   assign  slv_region_start_array[8][0] = (remap_n) ? `AXI_R1_NSA_S8 : `AXI_R1_BSA_S8;
   assign  slv_region_start_array[8][1] = (remap_n) ? `AXI_R2_NSA_S8 : `AXI_R2_BSA_S8;
   assign  slv_region_start_array[8][2] = (remap_n) ? `AXI_R3_NSA_S8 : `AXI_R3_BSA_S8;
   assign  slv_region_start_array[8][3] = (remap_n) ? `AXI_R4_NSA_S8 : `AXI_R4_BSA_S8;
   assign  slv_region_start_array[8][4] = (remap_n) ? `AXI_R5_NSA_S8 : `AXI_R5_BSA_S8;
   assign  slv_region_start_array[8][5] = (remap_n) ? `AXI_R6_NSA_S8 : `AXI_R6_BSA_S8;
   assign  slv_region_start_array[8][6] = (remap_n) ? `AXI_R7_NSA_S8 : `AXI_R7_BSA_S8;
   assign  slv_region_start_array[8][7] = (remap_n) ? `AXI_R8_NSA_S8 : `AXI_R8_BSA_S8;
      
   assign  slv_region_end_array[8][0] = (remap_n) ? `AXI_R1_NEA_S8 : `AXI_R1_BEA_S8;
   assign  slv_region_end_array[8][1] = (remap_n) ? `AXI_R2_NEA_S8 : `AXI_R2_BEA_S8;
   assign  slv_region_end_array[8][2] = (remap_n) ? `AXI_R3_NEA_S8 : `AXI_R3_BEA_S8;
   assign  slv_region_end_array[8][3] = (remap_n) ? `AXI_R4_NEA_S8 : `AXI_R4_BEA_S8;
   assign  slv_region_end_array[8][4] = (remap_n) ? `AXI_R5_NEA_S8 : `AXI_R5_BEA_S8;
   assign  slv_region_end_array[8][5] = (remap_n) ? `AXI_R6_NEA_S8 : `AXI_R6_BEA_S8;
   assign  slv_region_end_array[8][6] = (remap_n) ? `AXI_R7_NEA_S8 : `AXI_R7_BEA_S8;
   assign  slv_region_end_array[8][7] = (remap_n) ? `AXI_R8_NEA_S8 : `AXI_R8_BEA_S8;
 `endif
   
 `ifdef AXI_HAS_S9 
   assign  slv_region_start_array[9][0] = (remap_n) ? `AXI_R1_NSA_S9 : `AXI_R1_BSA_S9;
   assign  slv_region_start_array[9][1] = (remap_n) ? `AXI_R2_NSA_S9 : `AXI_R2_BSA_S9;
   assign  slv_region_start_array[9][2] = (remap_n) ? `AXI_R3_NSA_S9 : `AXI_R3_BSA_S9;
   assign  slv_region_start_array[9][3] = (remap_n) ? `AXI_R4_NSA_S9 : `AXI_R4_BSA_S9;
   assign  slv_region_start_array[9][4] = (remap_n) ? `AXI_R5_NSA_S9 : `AXI_R5_BSA_S9;
   assign  slv_region_start_array[9][5] = (remap_n) ? `AXI_R6_NSA_S9 : `AXI_R6_BSA_S9;
   assign  slv_region_start_array[9][6] = (remap_n) ? `AXI_R7_NSA_S9 : `AXI_R7_BSA_S9;
   assign  slv_region_start_array[9][7] = (remap_n) ? `AXI_R8_NSA_S9 : `AXI_R8_BSA_S9;
      
   assign  slv_region_end_array[9][0] = (remap_n) ? `AXI_R1_NEA_S9 : `AXI_R1_BEA_S9;
   assign  slv_region_end_array[9][1] = (remap_n) ? `AXI_R2_NEA_S9 : `AXI_R2_BEA_S9;
   assign  slv_region_end_array[9][2] = (remap_n) ? `AXI_R3_NEA_S9 : `AXI_R3_BEA_S9;
   assign  slv_region_end_array[9][3] = (remap_n) ? `AXI_R4_NEA_S9 : `AXI_R4_BEA_S9;
   assign  slv_region_end_array[9][4] = (remap_n) ? `AXI_R5_NEA_S9 : `AXI_R5_BEA_S9;
   assign  slv_region_end_array[9][5] = (remap_n) ? `AXI_R6_NEA_S9 : `AXI_R6_BEA_S9;
   assign  slv_region_end_array[9][6] = (remap_n) ? `AXI_R7_NEA_S9 : `AXI_R7_BEA_S9;
   assign  slv_region_end_array[9][7] = (remap_n) ? `AXI_R8_NEA_S9 : `AXI_R8_BEA_S9;
 `endif
   
 `ifdef AXI_HAS_S10 
   assign  slv_region_start_array[10][0] = (remap_n) ? `AXI_R1_NSA_S10 : `AXI_R1_BSA_S10;
   assign  slv_region_start_array[10][1] = (remap_n) ? `AXI_R2_NSA_S10 : `AXI_R2_BSA_S10;
   assign  slv_region_start_array[10][2] = (remap_n) ? `AXI_R3_NSA_S10 : `AXI_R3_BSA_S10;
   assign  slv_region_start_array[10][3] = (remap_n) ? `AXI_R4_NSA_S10 : `AXI_R4_BSA_S10;
   assign  slv_region_start_array[10][4] = (remap_n) ? `AXI_R5_NSA_S10 : `AXI_R5_BSA_S10;
   assign  slv_region_start_array[10][5] = (remap_n) ? `AXI_R6_NSA_S10 : `AXI_R6_BSA_S10;
   assign  slv_region_start_array[10][6] = (remap_n) ? `AXI_R7_NSA_S10 : `AXI_R7_BSA_S10;
   assign  slv_region_start_array[10][7] = (remap_n) ? `AXI_R8_NSA_S10 : `AXI_R8_BSA_S10;
      
   assign  slv_region_end_array[10][0] = (remap_n) ? `AXI_R1_NEA_S10 : `AXI_R1_BEA_S10;
   assign  slv_region_end_array[10][1] = (remap_n) ? `AXI_R2_NEA_S10 : `AXI_R2_BEA_S10;
   assign  slv_region_end_array[10][2] = (remap_n) ? `AXI_R3_NEA_S10 : `AXI_R3_BEA_S10;
   assign  slv_region_end_array[10][3] = (remap_n) ? `AXI_R4_NEA_S10 : `AXI_R4_BEA_S10;
   assign  slv_region_end_array[10][4] = (remap_n) ? `AXI_R5_NEA_S10 : `AXI_R5_BEA_S10;
   assign  slv_region_end_array[10][5] = (remap_n) ? `AXI_R6_NEA_S10 : `AXI_R6_BEA_S10;
   assign  slv_region_end_array[10][6] = (remap_n) ? `AXI_R7_NEA_S10 : `AXI_R7_BEA_S10;
   assign  slv_region_end_array[10][7] = (remap_n) ? `AXI_R8_NEA_S10 : `AXI_R8_BEA_S10;
 `endif
   
 `ifdef AXI_HAS_S11 
   assign  slv_region_start_array[11][0] = (remap_n) ? `AXI_R1_NSA_S11 : `AXI_R1_BSA_S11;
   assign  slv_region_start_array[11][1] = (remap_n) ? `AXI_R2_NSA_S11 : `AXI_R2_BSA_S11;
   assign  slv_region_start_array[11][2] = (remap_n) ? `AXI_R3_NSA_S11 : `AXI_R3_BSA_S11;
   assign  slv_region_start_array[11][3] = (remap_n) ? `AXI_R4_NSA_S11 : `AXI_R4_BSA_S11;
   assign  slv_region_start_array[11][4] = (remap_n) ? `AXI_R5_NSA_S11 : `AXI_R5_BSA_S11;
   assign  slv_region_start_array[11][5] = (remap_n) ? `AXI_R6_NSA_S11 : `AXI_R6_BSA_S11;
   assign  slv_region_start_array[11][6] = (remap_n) ? `AXI_R7_NSA_S11 : `AXI_R7_BSA_S11;
   assign  slv_region_start_array[11][7] = (remap_n) ? `AXI_R8_NSA_S11 : `AXI_R8_BSA_S11;
      
   assign  slv_region_end_array[11][0] = (remap_n) ? `AXI_R1_NEA_S11 : `AXI_R1_BEA_S11;
   assign  slv_region_end_array[11][1] = (remap_n) ? `AXI_R2_NEA_S11 : `AXI_R2_BEA_S11;
   assign  slv_region_end_array[11][2] = (remap_n) ? `AXI_R3_NEA_S11 : `AXI_R3_BEA_S11;
   assign  slv_region_end_array[11][3] = (remap_n) ? `AXI_R4_NEA_S11 : `AXI_R4_BEA_S11;
   assign  slv_region_end_array[11][4] = (remap_n) ? `AXI_R5_NEA_S11 : `AXI_R5_BEA_S11;
   assign  slv_region_end_array[11][5] = (remap_n) ? `AXI_R6_NEA_S11 : `AXI_R6_BEA_S11;
   assign  slv_region_end_array[11][6] = (remap_n) ? `AXI_R7_NEA_S11 : `AXI_R7_BEA_S11;
   assign  slv_region_end_array[11][7] = (remap_n) ? `AXI_R8_NEA_S11 : `AXI_R8_BEA_S11;
 `endif
   
 `ifdef AXI_HAS_S12 
   assign  slv_region_start_array[12][0] = (remap_n) ? `AXI_R1_NSA_S12 : `AXI_R1_BSA_S12;
   assign  slv_region_start_array[12][1] = (remap_n) ? `AXI_R2_NSA_S12 : `AXI_R2_BSA_S12;
   assign  slv_region_start_array[12][2] = (remap_n) ? `AXI_R3_NSA_S12 : `AXI_R3_BSA_S12;
   assign  slv_region_start_array[12][3] = (remap_n) ? `AXI_R4_NSA_S12 : `AXI_R4_BSA_S12;
   assign  slv_region_start_array[12][4] = (remap_n) ? `AXI_R5_NSA_S12 : `AXI_R5_BSA_S12;
   assign  slv_region_start_array[12][5] = (remap_n) ? `AXI_R6_NSA_S12 : `AXI_R6_BSA_S12;
   assign  slv_region_start_array[12][6] = (remap_n) ? `AXI_R7_NSA_S12 : `AXI_R7_BSA_S12;
   assign  slv_region_start_array[12][7] = (remap_n) ? `AXI_R8_NSA_S12 : `AXI_R8_BSA_S12;
      
   assign  slv_region_end_array[12][0] = (remap_n) ? `AXI_R1_NEA_S12 : `AXI_R1_BEA_S12;
   assign  slv_region_end_array[12][1] = (remap_n) ? `AXI_R2_NEA_S12 : `AXI_R2_BEA_S12;
   assign  slv_region_end_array[12][2] = (remap_n) ? `AXI_R3_NEA_S12 : `AXI_R3_BEA_S12;
   assign  slv_region_end_array[12][3] = (remap_n) ? `AXI_R4_NEA_S12 : `AXI_R4_BEA_S12;
   assign  slv_region_end_array[12][4] = (remap_n) ? `AXI_R5_NEA_S12 : `AXI_R5_BEA_S12;
   assign  slv_region_end_array[12][5] = (remap_n) ? `AXI_R6_NEA_S12 : `AXI_R6_BEA_S12;
   assign  slv_region_end_array[12][6] = (remap_n) ? `AXI_R7_NEA_S12 : `AXI_R7_BEA_S12;
   assign  slv_region_end_array[12][7] = (remap_n) ? `AXI_R8_NEA_S12 : `AXI_R8_BEA_S12;
 `endif
   
 `ifdef AXI_HAS_S13 
   assign  slv_region_start_array[13][0] = (remap_n) ? `AXI_R1_NSA_S13 : `AXI_R1_BSA_S13;
   assign  slv_region_start_array[13][1] = (remap_n) ? `AXI_R2_NSA_S13 : `AXI_R2_BSA_S13;
   assign  slv_region_start_array[13][2] = (remap_n) ? `AXI_R3_NSA_S13 : `AXI_R3_BSA_S13;
   assign  slv_region_start_array[13][3] = (remap_n) ? `AXI_R4_NSA_S13 : `AXI_R4_BSA_S13;
   assign  slv_region_start_array[13][4] = (remap_n) ? `AXI_R5_NSA_S13 : `AXI_R5_BSA_S13;
   assign  slv_region_start_array[13][5] = (remap_n) ? `AXI_R6_NSA_S13 : `AXI_R6_BSA_S13;
   assign  slv_region_start_array[13][6] = (remap_n) ? `AXI_R7_NSA_S13 : `AXI_R7_BSA_S13;
   assign  slv_region_start_array[13][7] = (remap_n) ? `AXI_R8_NSA_S13 : `AXI_R8_BSA_S13;
      
   assign  slv_region_end_array[13][0] = (remap_n) ? `AXI_R1_NEA_S13 : `AXI_R1_BEA_S13;
   assign  slv_region_end_array[13][1] = (remap_n) ? `AXI_R2_NEA_S13 : `AXI_R2_BEA_S13;
   assign  slv_region_end_array[13][2] = (remap_n) ? `AXI_R3_NEA_S13 : `AXI_R3_BEA_S13;
   assign  slv_region_end_array[13][3] = (remap_n) ? `AXI_R4_NEA_S13 : `AXI_R4_BEA_S13;
   assign  slv_region_end_array[13][4] = (remap_n) ? `AXI_R5_NEA_S13 : `AXI_R5_BEA_S13;
   assign  slv_region_end_array[13][5] = (remap_n) ? `AXI_R6_NEA_S13 : `AXI_R6_BEA_S13;
   assign  slv_region_end_array[13][6] = (remap_n) ? `AXI_R7_NEA_S13 : `AXI_R7_BEA_S13;
   assign  slv_region_end_array[13][7] = (remap_n) ? `AXI_R8_NEA_S13 : `AXI_R8_BEA_S13;
 `endif
   
 `ifdef AXI_HAS_S14 
   assign  slv_region_start_array[14][0] = (remap_n) ? `AXI_R1_NSA_S14 : `AXI_R1_BSA_S14;
   assign  slv_region_start_array[14][1] = (remap_n) ? `AXI_R2_NSA_S14 : `AXI_R2_BSA_S14;
   assign  slv_region_start_array[14][2] = (remap_n) ? `AXI_R3_NSA_S14 : `AXI_R3_BSA_S14;
   assign  slv_region_start_array[14][3] = (remap_n) ? `AXI_R4_NSA_S14 : `AXI_R4_BSA_S14;
   assign  slv_region_start_array[14][4] = (remap_n) ? `AXI_R5_NSA_S14 : `AXI_R5_BSA_S14;
   assign  slv_region_start_array[14][5] = (remap_n) ? `AXI_R6_NSA_S14 : `AXI_R6_BSA_S14;
   assign  slv_region_start_array[14][6] = (remap_n) ? `AXI_R7_NSA_S14 : `AXI_R7_BSA_S14;
   assign  slv_region_start_array[14][7] = (remap_n) ? `AXI_R8_NSA_S14 : `AXI_R8_BSA_S14;
      
   assign  slv_region_end_array[14][0] = (remap_n) ? `AXI_R1_NEA_S14 : `AXI_R1_BEA_S14;
   assign  slv_region_end_array[14][1] = (remap_n) ? `AXI_R2_NEA_S14 : `AXI_R2_BEA_S14;
   assign  slv_region_end_array[14][2] = (remap_n) ? `AXI_R3_NEA_S14 : `AXI_R3_BEA_S14;
   assign  slv_region_end_array[14][3] = (remap_n) ? `AXI_R4_NEA_S14 : `AXI_R4_BEA_S14;
   assign  slv_region_end_array[14][4] = (remap_n) ? `AXI_R5_NEA_S14 : `AXI_R5_BEA_S14;
   assign  slv_region_end_array[14][5] = (remap_n) ? `AXI_R6_NEA_S14 : `AXI_R6_BEA_S14;
   assign  slv_region_end_array[14][6] = (remap_n) ? `AXI_R7_NEA_S14 : `AXI_R7_BEA_S14;
   assign  slv_region_end_array[14][7] = (remap_n) ? `AXI_R8_NEA_S14 : `AXI_R8_BEA_S14;
 `endif
   
 `ifdef AXI_HAS_S15 
   assign  slv_region_start_array[15][0] = (remap_n) ? `AXI_R1_NSA_S15 : `AXI_R1_BSA_S15;
   assign  slv_region_start_array[15][1] = (remap_n) ? `AXI_R2_NSA_S15 : `AXI_R2_BSA_S15;
   assign  slv_region_start_array[15][2] = (remap_n) ? `AXI_R3_NSA_S15 : `AXI_R3_BSA_S15;
   assign  slv_region_start_array[15][3] = (remap_n) ? `AXI_R4_NSA_S15 : `AXI_R4_BSA_S15;
   assign  slv_region_start_array[15][4] = (remap_n) ? `AXI_R5_NSA_S15 : `AXI_R5_BSA_S15;
   assign  slv_region_start_array[15][5] = (remap_n) ? `AXI_R6_NSA_S15 : `AXI_R6_BSA_S15;
   assign  slv_region_start_array[15][6] = (remap_n) ? `AXI_R7_NSA_S15 : `AXI_R7_BSA_S15;
   assign  slv_region_start_array[15][7] = (remap_n) ? `AXI_R8_NSA_S15 : `AXI_R8_BSA_S15;
      
   assign  slv_region_end_array[15][0] = (remap_n) ? `AXI_R1_NEA_S15 : `AXI_R1_BEA_S15;
   assign  slv_region_end_array[15][1] = (remap_n) ? `AXI_R2_NEA_S15 : `AXI_R2_BEA_S15;
   assign  slv_region_end_array[15][2] = (remap_n) ? `AXI_R3_NEA_S15 : `AXI_R3_BEA_S15;
   assign  slv_region_end_array[15][3] = (remap_n) ? `AXI_R4_NEA_S15 : `AXI_R4_BEA_S15;
   assign  slv_region_end_array[15][4] = (remap_n) ? `AXI_R5_NEA_S15 : `AXI_R5_BEA_S15;
   assign  slv_region_end_array[15][5] = (remap_n) ? `AXI_R6_NEA_S15 : `AXI_R6_BEA_S15;
   assign  slv_region_end_array[15][6] = (remap_n) ? `AXI_R7_NEA_S15 : `AXI_R7_BEA_S15;
   assign  slv_region_end_array[15][7] = (remap_n) ? `AXI_R8_NEA_S15 : `AXI_R8_BEA_S15;
 `endif
   
 `ifdef AXI_HAS_S16 
   assign  slv_region_start_array[16][0] = (remap_n) ? `AXI_R1_NSA_S16 : `AXI_R1_BSA_S16;
   assign  slv_region_start_array[16][1] = (remap_n) ? `AXI_R2_NSA_S16 : `AXI_R2_BSA_S16;
   assign  slv_region_start_array[16][2] = (remap_n) ? `AXI_R3_NSA_S16 : `AXI_R3_BSA_S16;
   assign  slv_region_start_array[16][3] = (remap_n) ? `AXI_R4_NSA_S16 : `AXI_R4_BSA_S16;
   assign  slv_region_start_array[16][4] = (remap_n) ? `AXI_R5_NSA_S16 : `AXI_R5_BSA_S16;
   assign  slv_region_start_array[16][5] = (remap_n) ? `AXI_R6_NSA_S16 : `AXI_R6_BSA_S16;
   assign  slv_region_start_array[16][6] = (remap_n) ? `AXI_R7_NSA_S16 : `AXI_R7_BSA_S16;
   assign  slv_region_start_array[16][7] = (remap_n) ? `AXI_R8_NSA_S16 : `AXI_R8_BSA_S16;
      
   assign  slv_region_end_array[16][0] = (remap_n) ? `AXI_R1_NEA_S16 : `AXI_R1_BEA_S16;
   assign  slv_region_end_array[16][1] = (remap_n) ? `AXI_R2_NEA_S16 : `AXI_R2_BEA_S16;
   assign  slv_region_end_array[16][2] = (remap_n) ? `AXI_R3_NEA_S16 : `AXI_R3_BEA_S16;
   assign  slv_region_end_array[16][3] = (remap_n) ? `AXI_R4_NEA_S16 : `AXI_R4_BEA_S16;
   assign  slv_region_end_array[16][4] = (remap_n) ? `AXI_R5_NEA_S16 : `AXI_R5_BEA_S16;
   assign  slv_region_end_array[16][5] = (remap_n) ? `AXI_R6_NEA_S16 : `AXI_R6_BEA_S16;
   assign  slv_region_end_array[16][6] = (remap_n) ? `AXI_R7_NEA_S16 : `AXI_R7_BEA_S16;
   assign  slv_region_end_array[16][7] = (remap_n) ? `AXI_R8_NEA_S16 : `AXI_R8_BEA_S16;
 `endif
   
 `ifdef AXI_HAS_S1
   assign slv_region_size_array[1][0]  = slv_region_end_array[1][0] - slv_region_start_array[1][0];
   assign slv_region_size_array[1][1]  = slv_region_end_array[1][1] - slv_region_start_array[1][1];
   assign slv_region_size_array[1][2]  = slv_region_end_array[1][2] - slv_region_start_array[1][2];
   assign slv_region_size_array[1][3]  = slv_region_end_array[1][3] - slv_region_start_array[1][3];
   assign slv_region_size_array[1][4]  = slv_region_end_array[1][4] - slv_region_start_array[1][4];
   assign slv_region_size_array[1][5]  = slv_region_end_array[1][5] - slv_region_start_array[1][5];
   assign slv_region_size_array[1][6]  = slv_region_end_array[1][6] - slv_region_start_array[1][6];
   assign slv_region_size_array[1][7]  = slv_region_end_array[1][7] - slv_region_start_array[1][7];
 `endif
 `ifdef AXI_HAS_S2
   assign slv_region_size_array[2][0]  = slv_region_end_array[2][0] - slv_region_start_array[2][0];
   assign slv_region_size_array[2][1]  = slv_region_end_array[2][1] - slv_region_start_array[2][1];
   assign slv_region_size_array[2][2]  = slv_region_end_array[2][2] - slv_region_start_array[2][2];
   assign slv_region_size_array[2][3]  = slv_region_end_array[2][3] - slv_region_start_array[2][3];
   assign slv_region_size_array[2][4]  = slv_region_end_array[2][4] - slv_region_start_array[2][4];
   assign slv_region_size_array[2][5]  = slv_region_end_array[2][5] - slv_region_start_array[2][5];
   assign slv_region_size_array[2][6]  = slv_region_end_array[2][6] - slv_region_start_array[2][6];
   assign slv_region_size_array[2][7]  = slv_region_end_array[2][7] - slv_region_start_array[2][7];
 `endif
 `ifdef AXI_HAS_S3
   assign slv_region_size_array[3][0]  = slv_region_end_array[3][0] - slv_region_start_array[3][0];
   assign slv_region_size_array[3][1]  = slv_region_end_array[3][1] - slv_region_start_array[3][1];
   assign slv_region_size_array[3][2]  = slv_region_end_array[3][2] - slv_region_start_array[3][2];
   assign slv_region_size_array[3][3]  = slv_region_end_array[3][3] - slv_region_start_array[3][3];
   assign slv_region_size_array[3][4]  = slv_region_end_array[3][4] - slv_region_start_array[3][4];
   assign slv_region_size_array[3][5]  = slv_region_end_array[3][5] - slv_region_start_array[3][5];
   assign slv_region_size_array[3][6]  = slv_region_end_array[3][6] - slv_region_start_array[3][6];
   assign slv_region_size_array[3][7]  = slv_region_end_array[3][7] - slv_region_start_array[3][7];
 `endif
 `ifdef AXI_HAS_S4
   assign slv_region_size_array[4][0]  = slv_region_end_array[4][0] - slv_region_start_array[4][0];
   assign slv_region_size_array[4][1]  = slv_region_end_array[4][1] - slv_region_start_array[4][1];
   assign slv_region_size_array[4][2]  = slv_region_end_array[4][2] - slv_region_start_array[4][2];
   assign slv_region_size_array[4][3]  = slv_region_end_array[4][3] - slv_region_start_array[4][3];
   assign slv_region_size_array[4][4]  = slv_region_end_array[4][4] - slv_region_start_array[4][4];
   assign slv_region_size_array[4][5]  = slv_region_end_array[4][5] - slv_region_start_array[4][5];
   assign slv_region_size_array[4][6]  = slv_region_end_array[4][6] - slv_region_start_array[4][6];
   assign slv_region_size_array[4][7]  = slv_region_end_array[4][7] - slv_region_start_array[4][7];
 `endif
 `ifdef AXI_HAS_S5
   assign slv_region_size_array[5][0]  = slv_region_end_array[5][0] - slv_region_start_array[5][0];
   assign slv_region_size_array[5][1]  = slv_region_end_array[5][1] - slv_region_start_array[5][1];
   assign slv_region_size_array[5][2]  = slv_region_end_array[5][2] - slv_region_start_array[5][2];
   assign slv_region_size_array[5][3]  = slv_region_end_array[5][3] - slv_region_start_array[5][3];
   assign slv_region_size_array[5][4]  = slv_region_end_array[5][4] - slv_region_start_array[5][4];
   assign slv_region_size_array[5][5]  = slv_region_end_array[5][5] - slv_region_start_array[5][5];
   assign slv_region_size_array[5][6]  = slv_region_end_array[5][6] - slv_region_start_array[5][6];
   assign slv_region_size_array[5][7]  = slv_region_end_array[5][7] - slv_region_start_array[5][7];
 `endif
 `ifdef AXI_HAS_S6
   assign slv_region_size_array[6][0]  = slv_region_end_array[6][0] - slv_region_start_array[6][0];
   assign slv_region_size_array[6][1]  = slv_region_end_array[6][1] - slv_region_start_array[6][1];
   assign slv_region_size_array[6][2]  = slv_region_end_array[6][2] - slv_region_start_array[6][2];
   assign slv_region_size_array[6][3]  = slv_region_end_array[6][3] - slv_region_start_array[6][3];
   assign slv_region_size_array[6][4]  = slv_region_end_array[6][4] - slv_region_start_array[6][4];
   assign slv_region_size_array[6][5]  = slv_region_end_array[6][5] - slv_region_start_array[6][5];
   assign slv_region_size_array[6][6]  = slv_region_end_array[6][6] - slv_region_start_array[6][6];
   assign slv_region_size_array[6][7]  = slv_region_end_array[6][7] - slv_region_start_array[6][7];
 `endif
 `ifdef AXI_HAS_S7
   assign slv_region_size_array[7][0]  = slv_region_end_array[7][0] - slv_region_start_array[7][0];
   assign slv_region_size_array[7][1]  = slv_region_end_array[7][1] - slv_region_start_array[7][1];
   assign slv_region_size_array[7][2]  = slv_region_end_array[7][2] - slv_region_start_array[7][2];
   assign slv_region_size_array[7][3]  = slv_region_end_array[7][3] - slv_region_start_array[7][3];
   assign slv_region_size_array[7][4]  = slv_region_end_array[7][4] - slv_region_start_array[7][4];
   assign slv_region_size_array[7][5]  = slv_region_end_array[7][5] - slv_region_start_array[7][5];
   assign slv_region_size_array[7][6]  = slv_region_end_array[7][6] - slv_region_start_array[7][6];
   assign slv_region_size_array[7][7]  = slv_region_end_array[7][7] - slv_region_start_array[7][7];
 `endif
 `ifdef AXI_HAS_S8
   assign slv_region_size_array[8][0]  = slv_region_end_array[8][0] - slv_region_start_array[8][0];
   assign slv_region_size_array[8][1]  = slv_region_end_array[8][1] - slv_region_start_array[8][1];
   assign slv_region_size_array[8][2]  = slv_region_end_array[8][2] - slv_region_start_array[8][2];
   assign slv_region_size_array[8][3]  = slv_region_end_array[8][3] - slv_region_start_array[8][3];
   assign slv_region_size_array[8][4]  = slv_region_end_array[8][4] - slv_region_start_array[8][4];
   assign slv_region_size_array[8][5]  = slv_region_end_array[8][5] - slv_region_start_array[8][5];
   assign slv_region_size_array[8][6]  = slv_region_end_array[8][6] - slv_region_start_array[8][6];
   assign slv_region_size_array[8][7]  = slv_region_end_array[8][7] - slv_region_start_array[8][7];
 `endif
 `ifdef AXI_HAS_S9
   assign slv_region_size_array[9][0]  = slv_region_end_array[9][0] - slv_region_start_array[9][0];
   assign slv_region_size_array[9][1]  = slv_region_end_array[9][1] - slv_region_start_array[9][1];
   assign slv_region_size_array[9][2]  = slv_region_end_array[9][2] - slv_region_start_array[9][2];
   assign slv_region_size_array[9][3]  = slv_region_end_array[9][3] - slv_region_start_array[9][3];
   assign slv_region_size_array[9][4]  = slv_region_end_array[9][4] - slv_region_start_array[9][4];
   assign slv_region_size_array[9][5]  = slv_region_end_array[9][5] - slv_region_start_array[9][5];
   assign slv_region_size_array[9][6]  = slv_region_end_array[9][6] - slv_region_start_array[9][6];
   assign slv_region_size_array[9][7]  = slv_region_end_array[9][7] - slv_region_start_array[9][7];
 `endif
 `ifdef AXI_HAS_S10
   assign slv_region_size_array[10][0]  = slv_region_end_array[10][0] - slv_region_start_array[10][0];
   assign slv_region_size_array[10][1]  = slv_region_end_array[10][1] - slv_region_start_array[10][1];
   assign slv_region_size_array[10][2]  = slv_region_end_array[10][2] - slv_region_start_array[10][2];
   assign slv_region_size_array[10][3]  = slv_region_end_array[10][3] - slv_region_start_array[10][3];
   assign slv_region_size_array[10][4]  = slv_region_end_array[10][4] - slv_region_start_array[10][4];
   assign slv_region_size_array[10][5]  = slv_region_end_array[10][5] - slv_region_start_array[10][5];
   assign slv_region_size_array[10][6]  = slv_region_end_array[10][6] - slv_region_start_array[10][6];
   assign slv_region_size_array[10][7]  = slv_region_end_array[10][7] - slv_region_start_array[10][7];
 `endif
 `ifdef AXI_HAS_S11
   assign slv_region_size_array[11][0]  = slv_region_end_array[11][0] - slv_region_start_array[11][0];
   assign slv_region_size_array[11][1]  = slv_region_end_array[11][1] - slv_region_start_array[11][1];
   assign slv_region_size_array[11][2]  = slv_region_end_array[11][2] - slv_region_start_array[11][2];
   assign slv_region_size_array[11][3]  = slv_region_end_array[11][3] - slv_region_start_array[11][3];
   assign slv_region_size_array[11][4]  = slv_region_end_array[11][4] - slv_region_start_array[11][4];
   assign slv_region_size_array[11][5]  = slv_region_end_array[11][5] - slv_region_start_array[11][5];
   assign slv_region_size_array[11][6]  = slv_region_end_array[11][6] - slv_region_start_array[11][6];
   assign slv_region_size_array[11][7]  = slv_region_end_array[11][7] - slv_region_start_array[11][7];
 `endif
 `ifdef AXI_HAS_S12
   assign slv_region_size_array[12][0]  = slv_region_end_array[12][0] - slv_region_start_array[12][0];
   assign slv_region_size_array[12][1]  = slv_region_end_array[12][1] - slv_region_start_array[12][1];
   assign slv_region_size_array[12][2]  = slv_region_end_array[12][2] - slv_region_start_array[12][2];
   assign slv_region_size_array[12][3]  = slv_region_end_array[12][3] - slv_region_start_array[12][3];
   assign slv_region_size_array[12][4]  = slv_region_end_array[12][4] - slv_region_start_array[12][4];
   assign slv_region_size_array[12][5]  = slv_region_end_array[12][5] - slv_region_start_array[12][5];
   assign slv_region_size_array[12][6]  = slv_region_end_array[12][6] - slv_region_start_array[12][6];
   assign slv_region_size_array[12][7]  = slv_region_end_array[12][7] - slv_region_start_array[12][7];
 `endif
 `ifdef AXI_HAS_S13
   assign slv_region_size_array[13][0]  = slv_region_end_array[13][0] - slv_region_start_array[13][0];
   assign slv_region_size_array[13][1]  = slv_region_end_array[13][1] - slv_region_start_array[13][1];
   assign slv_region_size_array[13][2]  = slv_region_end_array[13][2] - slv_region_start_array[13][2];
   assign slv_region_size_array[13][3]  = slv_region_end_array[13][3] - slv_region_start_array[13][3];
   assign slv_region_size_array[13][4]  = slv_region_end_array[13][4] - slv_region_start_array[13][4];
   assign slv_region_size_array[13][5]  = slv_region_end_array[13][5] - slv_region_start_array[13][5];
   assign slv_region_size_array[13][6]  = slv_region_end_array[13][6] - slv_region_start_array[13][6];
   assign slv_region_size_array[13][7]  = slv_region_end_array[13][7] - slv_region_start_array[13][7];
 `endif
 `ifdef AXI_HAS_S14
   assign slv_region_size_array[14][0]  = slv_region_end_array[14][0] - slv_region_start_array[14][0];
   assign slv_region_size_array[14][1]  = slv_region_end_array[14][1] - slv_region_start_array[14][1];
   assign slv_region_size_array[14][2]  = slv_region_end_array[14][2] - slv_region_start_array[14][2];
   assign slv_region_size_array[14][3]  = slv_region_end_array[14][3] - slv_region_start_array[14][3];
   assign slv_region_size_array[14][4]  = slv_region_end_array[14][4] - slv_region_start_array[14][4];
   assign slv_region_size_array[14][5]  = slv_region_end_array[14][5] - slv_region_start_array[14][5];
   assign slv_region_size_array[14][6]  = slv_region_end_array[14][6] - slv_region_start_array[14][6];
   assign slv_region_size_array[14][7]  = slv_region_end_array[14][7] - slv_region_start_array[14][7];
 `endif
 `ifdef AXI_HAS_S15
   assign slv_region_size_array[15][0]  = slv_region_end_array[15][0] - slv_region_start_array[15][0];
   assign slv_region_size_array[15][1]  = slv_region_end_array[15][1] - slv_region_start_array[15][1];
   assign slv_region_size_array[15][2]  = slv_region_end_array[15][2] - slv_region_start_array[15][2];
   assign slv_region_size_array[15][3]  = slv_region_end_array[15][3] - slv_region_start_array[15][3];
   assign slv_region_size_array[15][4]  = slv_region_end_array[15][4] - slv_region_start_array[15][4];
   assign slv_region_size_array[15][5]  = slv_region_end_array[15][5] - slv_region_start_array[15][5];
   assign slv_region_size_array[15][6]  = slv_region_end_array[15][6] - slv_region_start_array[15][6];
   assign slv_region_size_array[15][7]  = slv_region_end_array[15][7] - slv_region_start_array[15][7];
 `endif
 `ifdef AXI_HAS_S16
   assign slv_region_size_array[16][0]  = slv_region_end_array[16][0] - slv_region_start_array[16][0];
   assign slv_region_size_array[16][1]  = slv_region_end_array[16][1] - slv_region_start_array[16][1];
   assign slv_region_size_array[16][2]  = slv_region_end_array[16][2] - slv_region_start_array[16][2];
   assign slv_region_size_array[16][3]  = slv_region_end_array[16][3] - slv_region_start_array[16][3];
   assign slv_region_size_array[16][4]  = slv_region_end_array[16][4] - slv_region_start_array[16][4];
   assign slv_region_size_array[16][5]  = slv_region_end_array[16][5] - slv_region_start_array[16][5];
   assign slv_region_size_array[16][6]  = slv_region_end_array[16][6] - slv_region_start_array[16][6];
   assign slv_region_size_array[16][7]  = slv_region_end_array[16][7] - slv_region_start_array[16][7];
 `endif
 `ifdef AXI_HAS_S1 
   assign slv_max_rd_transaction[1] =  (num_vis_mst[1] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S1;
   assign slv_max_wr_transaction[1] =  (num_vis_mst[1] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S1;
   assign slv_max_transaction[1]    =  slv_max_wr_transaction[1] + slv_max_rd_transaction[1];
 `endif
 `ifdef AXI_HAS_S2 
   assign slv_max_rd_transaction[2] =  (num_vis_mst[2] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S2;
   assign slv_max_wr_transaction[2] =  (num_vis_mst[2] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S2;
   assign slv_max_transaction[2]    =  slv_max_wr_transaction[2] + slv_max_rd_transaction[2];
 `endif
 `ifdef AXI_HAS_S3 
   assign slv_max_rd_transaction[3] =  (num_vis_mst[3] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S3;
   assign slv_max_wr_transaction[3] =  (num_vis_mst[3] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S3;
   assign slv_max_transaction[3]    =  slv_max_wr_transaction[3] + slv_max_rd_transaction[3];
 `endif
 `ifdef AXI_HAS_S4 
   assign slv_max_rd_transaction[4] =  (num_vis_mst[4] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S4;
   assign slv_max_wr_transaction[4] =  (num_vis_mst[4] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S4;
   assign slv_max_transaction[4]    =  slv_max_wr_transaction[4] + slv_max_rd_transaction[4];
 `endif
 `ifdef AXI_HAS_S5 
   assign slv_max_rd_transaction[5] =  (num_vis_mst[5] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S5;
   assign slv_max_wr_transaction[5] =  (num_vis_mst[5] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S5;
   assign slv_max_transaction[5]    =  slv_max_wr_transaction[5] + slv_max_rd_transaction[5];
 `endif
 `ifdef AXI_HAS_S6 
   assign slv_max_rd_transaction[6] =  (num_vis_mst[6] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S6;
   assign slv_max_wr_transaction[6] =  (num_vis_mst[6] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S6;
   assign slv_max_transaction[6]    =  slv_max_wr_transaction[6] + slv_max_rd_transaction[6];
 `endif
 `ifdef AXI_HAS_S7 
   assign slv_max_rd_transaction[7] =  (num_vis_mst[7] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S7;
   assign slv_max_wr_transaction[7] =  (num_vis_mst[7] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S7;
   assign slv_max_transaction[7]    =  slv_max_wr_transaction[7] + slv_max_rd_transaction[7];
 `endif
 `ifdef AXI_HAS_S8 
   assign slv_max_rd_transaction[8] =  (num_vis_mst[8] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S8;
   assign slv_max_wr_transaction[8] =  (num_vis_mst[8] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S8;
   assign slv_max_transaction[8]    =  slv_max_wr_transaction[8] + slv_max_rd_transaction[8];
 `endif
 `ifdef AXI_HAS_S9 
   assign slv_max_rd_transaction[9] =  (num_vis_mst[9] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S9;
   assign slv_max_wr_transaction[9] =  (num_vis_mst[9] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S9;
   assign slv_max_transaction[9]    =  slv_max_wr_transaction[9] + slv_max_rd_transaction[9];
 `endif
 `ifdef AXI_HAS_S10 
   assign slv_max_rd_transaction[10] =  (num_vis_mst[10] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S10;
   assign slv_max_wr_transaction[10] =  (num_vis_mst[10] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S10;
   assign slv_max_transaction[10]    =  slv_max_wr_transaction[10] + slv_max_rd_transaction[10];
 `endif
 `ifdef AXI_HAS_S11 
   assign slv_max_rd_transaction[11] =  (num_vis_mst[11] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S11;
   assign slv_max_wr_transaction[11] =  (num_vis_mst[11] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S11;
   assign slv_max_transaction[11]    =  slv_max_wr_transaction[11] + slv_max_rd_transaction[11];
 `endif
 `ifdef AXI_HAS_S12 
   assign slv_max_rd_transaction[12] =  (num_vis_mst[12] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S12;
   assign slv_max_wr_transaction[12] =  (num_vis_mst[12] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S12;
   assign slv_max_transaction[12]    =  slv_max_wr_transaction[12] + slv_max_rd_transaction[12];
 `endif
 `ifdef AXI_HAS_S13 
   assign slv_max_rd_transaction[13] =  (num_vis_mst[13] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S13;
   assign slv_max_wr_transaction[13] =  (num_vis_mst[13] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S13;
   assign slv_max_transaction[13]    =  slv_max_wr_transaction[13] + slv_max_rd_transaction[13];
 `endif
 `ifdef AXI_HAS_S14 
   assign slv_max_rd_transaction[14] =  (num_vis_mst[14] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S14;
   assign slv_max_wr_transaction[14] =  (num_vis_mst[14] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S14;
   assign slv_max_transaction[14]    =  slv_max_wr_transaction[14] + slv_max_rd_transaction[14];
 `endif
 `ifdef AXI_HAS_S15 
   assign slv_max_rd_transaction[15] =  (num_vis_mst[15] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S15;
   assign slv_max_wr_transaction[15] =  (num_vis_mst[15] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S15;
   assign slv_max_transaction[15]    =  slv_max_wr_transaction[15] + slv_max_rd_transaction[15];
 `endif
 `ifdef AXI_HAS_S16 
   assign slv_max_rd_transaction[16] =  (num_vis_mst[16] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FARC_S16;
   assign slv_max_wr_transaction[16] =  (num_vis_mst[16] == 1) ? ({`AXI_MIDW{1'b1}} + 1)*16 : `AXI_MAX_FAWC_S16;
   assign slv_max_transaction[16]    =  slv_max_wr_transaction[16] + slv_max_rd_transaction[16];
 `endif
 `ifdef AXI_HAS_M1 
   assign mst_max_rd_uid_transaction[1] = `AXI_MAX_URIDA_M1;
   assign mst_max_rd_cmd_transaction[1] = `AXI_MAX_RCA_ID_M1;
   assign mst_max_wr_uid_transaction[1] = `AXI_MAX_UWIDA_M1;
   assign mst_max_wr_cmd_transaction[1] = `AXI_MAX_WCA_ID_M1;
   assign mst_max_transaction[1] = (`AXI_MAX_URIDA_M1 * `AXI_MAX_RCA_ID_M1) + (`AXI_MAX_UWIDA_M1 * `AXI_MAX_WCA_ID_M1);
 `endif
 `ifdef AXI_HAS_M2 
   assign mst_max_rd_uid_transaction[2] = `AXI_MAX_URIDA_M2;
   assign mst_max_rd_cmd_transaction[2] = `AXI_MAX_RCA_ID_M2;
   assign mst_max_wr_uid_transaction[2] = `AXI_MAX_UWIDA_M2;
   assign mst_max_wr_cmd_transaction[2] = `AXI_MAX_WCA_ID_M2;
   assign mst_max_transaction[2] = (`AXI_MAX_URIDA_M2 * `AXI_MAX_RCA_ID_M2) + (`AXI_MAX_UWIDA_M2 * `AXI_MAX_WCA_ID_M2);
 `endif
 `ifdef AXI_HAS_M3 
   assign mst_max_rd_uid_transaction[3] = `AXI_MAX_URIDA_M3;
   assign mst_max_rd_cmd_transaction[3] = `AXI_MAX_RCA_ID_M3;
   assign mst_max_wr_uid_transaction[3] = `AXI_MAX_UWIDA_M3;
   assign mst_max_wr_cmd_transaction[3] = `AXI_MAX_WCA_ID_M3;
   assign mst_max_transaction[3] = (`AXI_MAX_URIDA_M3 * `AXI_MAX_RCA_ID_M3) + (`AXI_MAX_UWIDA_M3 * `AXI_MAX_WCA_ID_M3);
 `endif
 `ifdef AXI_HAS_M4 
   assign mst_max_rd_uid_transaction[4] = `AXI_MAX_URIDA_M4;
   assign mst_max_rd_cmd_transaction[4] = `AXI_MAX_RCA_ID_M4;
   assign mst_max_wr_uid_transaction[4] = `AXI_MAX_UWIDA_M4;
   assign mst_max_wr_cmd_transaction[4] = `AXI_MAX_WCA_ID_M4;
   assign mst_max_transaction[4] = (`AXI_MAX_URIDA_M4 * `AXI_MAX_RCA_ID_M4) + (`AXI_MAX_UWIDA_M4 * `AXI_MAX_WCA_ID_M4);
 `endif
 `ifdef AXI_HAS_M5 
   assign mst_max_rd_uid_transaction[5] = `AXI_MAX_URIDA_M5;
   assign mst_max_rd_cmd_transaction[5] = `AXI_MAX_RCA_ID_M5;
   assign mst_max_wr_uid_transaction[5] = `AXI_MAX_UWIDA_M5;
   assign mst_max_wr_cmd_transaction[5] = `AXI_MAX_WCA_ID_M5;
   assign mst_max_transaction[5] = (`AXI_MAX_URIDA_M5 * `AXI_MAX_RCA_ID_M5) + (`AXI_MAX_UWIDA_M5 * `AXI_MAX_WCA_ID_M5);
 `endif
 `ifdef AXI_HAS_M6 
   assign mst_max_rd_uid_transaction[6] = `AXI_MAX_URIDA_M6;
   assign mst_max_rd_cmd_transaction[6] = `AXI_MAX_RCA_ID_M6;
   assign mst_max_wr_uid_transaction[6] = `AXI_MAX_UWIDA_M6;
   assign mst_max_wr_cmd_transaction[6] = `AXI_MAX_WCA_ID_M6;
   assign mst_max_transaction[6] = (`AXI_MAX_URIDA_M6 * `AXI_MAX_RCA_ID_M6) + (`AXI_MAX_UWIDA_M6 * `AXI_MAX_WCA_ID_M6);
 `endif
 `ifdef AXI_HAS_M7 
   assign mst_max_rd_uid_transaction[7] = `AXI_MAX_URIDA_M7;
   assign mst_max_rd_cmd_transaction[7] = `AXI_MAX_RCA_ID_M7;
   assign mst_max_wr_uid_transaction[7] = `AXI_MAX_UWIDA_M7;
   assign mst_max_wr_cmd_transaction[7] = `AXI_MAX_WCA_ID_M7;
   assign mst_max_transaction[7] = (`AXI_MAX_URIDA_M7 * `AXI_MAX_RCA_ID_M7) + (`AXI_MAX_UWIDA_M7 * `AXI_MAX_WCA_ID_M7);
 `endif
 `ifdef AXI_HAS_M8 
   assign mst_max_rd_uid_transaction[8] = `AXI_MAX_URIDA_M8;
   assign mst_max_rd_cmd_transaction[8] = `AXI_MAX_RCA_ID_M8;
   assign mst_max_wr_uid_transaction[8] = `AXI_MAX_UWIDA_M8;
   assign mst_max_wr_cmd_transaction[8] = `AXI_MAX_WCA_ID_M8;
   assign mst_max_transaction[8] = (`AXI_MAX_URIDA_M8 * `AXI_MAX_RCA_ID_M8) + (`AXI_MAX_UWIDA_M8 * `AXI_MAX_WCA_ID_M8);
 `endif
 `ifdef AXI_HAS_M9 
   assign mst_max_rd_uid_transaction[9] = `AXI_MAX_URIDA_M9;
   assign mst_max_rd_cmd_transaction[9] = `AXI_MAX_RCA_ID_M9;
   assign mst_max_wr_uid_transaction[9] = `AXI_MAX_UWIDA_M9;
   assign mst_max_wr_cmd_transaction[9] = `AXI_MAX_WCA_ID_M9;
   assign mst_max_transaction[9] = (`AXI_MAX_URIDA_M9 * `AXI_MAX_RCA_ID_M9) + (`AXI_MAX_UWIDA_M9 * `AXI_MAX_WCA_ID_M9);
 `endif
 `ifdef AXI_HAS_M10 
   assign mst_max_rd_uid_transaction[10] = `AXI_MAX_URIDA_M10;
   assign mst_max_rd_cmd_transaction[10] = `AXI_MAX_RCA_ID_M10;
   assign mst_max_wr_uid_transaction[10] = `AXI_MAX_UWIDA_M10;
   assign mst_max_wr_cmd_transaction[10] = `AXI_MAX_WCA_ID_M10;
   assign mst_max_transaction[10] = (`AXI_MAX_URIDA_M10 * `AXI_MAX_RCA_ID_M10) + (`AXI_MAX_UWIDA_M10 * `AXI_MAX_WCA_ID_M10);
 `endif
 `ifdef AXI_HAS_M11 
   assign mst_max_rd_uid_transaction[11] = `AXI_MAX_URIDA_M11;
   assign mst_max_rd_cmd_transaction[11] = `AXI_MAX_RCA_ID_M11;
   assign mst_max_wr_uid_transaction[11] = `AXI_MAX_UWIDA_M11;
   assign mst_max_wr_cmd_transaction[11] = `AXI_MAX_WCA_ID_M11;
   assign mst_max_transaction[11] = (`AXI_MAX_URIDA_M11 * `AXI_MAX_RCA_ID_M11) + (`AXI_MAX_UWIDA_M11 * `AXI_MAX_WCA_ID_M11);
 `endif
 `ifdef AXI_HAS_M12 
   assign mst_max_rd_uid_transaction[12] = `AXI_MAX_URIDA_M12;
   assign mst_max_rd_cmd_transaction[12] = `AXI_MAX_RCA_ID_M12;
   assign mst_max_wr_uid_transaction[12] = `AXI_MAX_UWIDA_M12;
   assign mst_max_wr_cmd_transaction[12] = `AXI_MAX_WCA_ID_M12;
   assign mst_max_transaction[12] = (`AXI_MAX_URIDA_M12 * `AXI_MAX_RCA_ID_M12) + (`AXI_MAX_UWIDA_M12 * `AXI_MAX_WCA_ID_M12);
 `endif
 `ifdef AXI_HAS_M13 
   assign mst_max_rd_uid_transaction[13] = `AXI_MAX_URIDA_M13;
   assign mst_max_rd_cmd_transaction[13] = `AXI_MAX_RCA_ID_M13;
   assign mst_max_wr_uid_transaction[13] = `AXI_MAX_UWIDA_M13;
   assign mst_max_wr_cmd_transaction[13] = `AXI_MAX_WCA_ID_M13;
   assign mst_max_transaction[13] = (`AXI_MAX_URIDA_M13 * `AXI_MAX_RCA_ID_M13) + (`AXI_MAX_UWIDA_M13 * `AXI_MAX_WCA_ID_M13);
 `endif
 `ifdef AXI_HAS_M14 
   assign mst_max_rd_uid_transaction[14] = `AXI_MAX_URIDA_M14;
   assign mst_max_rd_cmd_transaction[14] = `AXI_MAX_RCA_ID_M14;
   assign mst_max_wr_uid_transaction[14] = `AXI_MAX_UWIDA_M14;
   assign mst_max_wr_cmd_transaction[14] = `AXI_MAX_WCA_ID_M14;
   assign mst_max_transaction[14] = (`AXI_MAX_URIDA_M14 * `AXI_MAX_RCA_ID_M14) + (`AXI_MAX_UWIDA_M14 * `AXI_MAX_WCA_ID_M14);
 `endif
 `ifdef AXI_HAS_M15 
   assign mst_max_rd_uid_transaction[15] = `AXI_MAX_URIDA_M15;
   assign mst_max_rd_cmd_transaction[15] = `AXI_MAX_RCA_ID_M15;
   assign mst_max_wr_uid_transaction[15] = `AXI_MAX_UWIDA_M15;
   assign mst_max_wr_cmd_transaction[15] = `AXI_MAX_WCA_ID_M15;
   assign mst_max_transaction[15] = (`AXI_MAX_URIDA_M15 * `AXI_MAX_RCA_ID_M15) + (`AXI_MAX_UWIDA_M15 * `AXI_MAX_WCA_ID_M15);
 `endif
 `ifdef AXI_HAS_M16 
   assign mst_max_rd_uid_transaction[16] = `AXI_MAX_URIDA_M16;
   assign mst_max_rd_cmd_transaction[16] = `AXI_MAX_RCA_ID_M16;
   assign mst_max_wr_uid_transaction[16] = `AXI_MAX_UWIDA_M16;
   assign mst_max_wr_cmd_transaction[16] = `AXI_MAX_WCA_ID_M16;
   assign mst_max_transaction[16] = (`AXI_MAX_URIDA_M16 * `AXI_MAX_RCA_ID_M16) + (`AXI_MAX_UWIDA_M16 * `AXI_MAX_WCA_ID_M16);
 `endif
`ifdef AXI_EXT_PRIORITY
 `ifdef AXI_HAS_M1 
   assign axi_master_priority[1] = set_master_priority[1];
 `endif
 `ifdef AXI_HAS_M2 
   assign axi_master_priority[2] = set_master_priority[2];
 `endif
 `ifdef AXI_HAS_M3 
   assign axi_master_priority[3] = set_master_priority[3];
 `endif
 `ifdef AXI_HAS_M4 
   assign axi_master_priority[4] = set_master_priority[4];
 `endif
 `ifdef AXI_HAS_M5 
   assign axi_master_priority[5] = set_master_priority[5];
 `endif
 `ifdef AXI_HAS_M6 
   assign axi_master_priority[6] = set_master_priority[6];
 `endif
 `ifdef AXI_HAS_M7 
   assign axi_master_priority[7] = set_master_priority[7];
 `endif
 `ifdef AXI_HAS_M8 
   assign axi_master_priority[8] = set_master_priority[8];
 `endif
 `ifdef AXI_HAS_M9 
   assign axi_master_priority[9] = set_master_priority[9];
 `endif
 `ifdef AXI_HAS_M10 
   assign axi_master_priority[10] = set_master_priority[10];
 `endif
 `ifdef AXI_HAS_M11 
   assign axi_master_priority[11] = set_master_priority[11];
 `endif
 `ifdef AXI_HAS_M12 
   assign axi_master_priority[12] = set_master_priority[12];
 `endif
 `ifdef AXI_HAS_M13 
   assign axi_master_priority[13] = set_master_priority[13];
 `endif
 `ifdef AXI_HAS_M14 
   assign axi_master_priority[14] = set_master_priority[14];
 `endif
 `ifdef AXI_HAS_M15 
   assign axi_master_priority[15] = set_master_priority[15];
 `endif
 `ifdef AXI_HAS_M16 
   assign axi_master_priority[16] = set_master_priority[16];
 `endif
 `ifdef AXI_HAS_S1 
   assign axi_slave_priority[1] = set_slave_priority[1];
 `endif
 `ifdef AXI_HAS_S2 
   assign axi_slave_priority[2] = set_slave_priority[2];
 `endif
 `ifdef AXI_HAS_S3 
   assign axi_slave_priority[3] = set_slave_priority[3];
 `endif
 `ifdef AXI_HAS_S4 
   assign axi_slave_priority[4] = set_slave_priority[4];
 `endif
 `ifdef AXI_HAS_S5 
   assign axi_slave_priority[5] = set_slave_priority[5];
 `endif
 `ifdef AXI_HAS_S6 
   assign axi_slave_priority[6] = set_slave_priority[6];
 `endif
 `ifdef AXI_HAS_S7 
   assign axi_slave_priority[7] = set_slave_priority[7];
 `endif
 `ifdef AXI_HAS_S8 
   assign axi_slave_priority[8] = set_slave_priority[8];
 `endif
 `ifdef AXI_HAS_S9 
   assign axi_slave_priority[9] = set_slave_priority[9];
 `endif
 `ifdef AXI_HAS_S10 
   assign axi_slave_priority[10] = set_slave_priority[10];
 `endif
 `ifdef AXI_HAS_S11 
   assign axi_slave_priority[11] = set_slave_priority[11];
 `endif
 `ifdef AXI_HAS_S12 
   assign axi_slave_priority[12] = set_slave_priority[12];
 `endif
 `ifdef AXI_HAS_S13 
   assign axi_slave_priority[13] = set_slave_priority[13];
 `endif
 `ifdef AXI_HAS_S14 
   assign axi_slave_priority[14] = set_slave_priority[14];
 `endif
 `ifdef AXI_HAS_S15 
   assign axi_slave_priority[15] = set_slave_priority[15];
 `endif
 `ifdef AXI_HAS_S16 
   assign axi_slave_priority[16] = set_slave_priority[16];
 `endif
`else
 `ifdef AXI_HAS_M1 
   assign axi_master_priority[1] = `AXI_PRIORITY_M1;
 `endif
 `ifdef AXI_HAS_M2 
   assign axi_master_priority[2] = `AXI_PRIORITY_M2;
 `endif
 `ifdef AXI_HAS_M3 
   assign axi_master_priority[3] = `AXI_PRIORITY_M3;
 `endif
 `ifdef AXI_HAS_M4 
   assign axi_master_priority[4] = `AXI_PRIORITY_M4;
 `endif
 `ifdef AXI_HAS_M5 
   assign axi_master_priority[5] = `AXI_PRIORITY_M5;
 `endif
 `ifdef AXI_HAS_M6 
   assign axi_master_priority[6] = `AXI_PRIORITY_M6;
 `endif
 `ifdef AXI_HAS_M7 
   assign axi_master_priority[7] = `AXI_PRIORITY_M7;
 `endif
 `ifdef AXI_HAS_M8 
   assign axi_master_priority[8] = `AXI_PRIORITY_M8;
 `endif
 `ifdef AXI_HAS_M9 
   assign axi_master_priority[9] = `AXI_PRIORITY_M9;
 `endif
 `ifdef AXI_HAS_M10 
   assign axi_master_priority[10] = `AXI_PRIORITY_M10;
 `endif
 `ifdef AXI_HAS_M11 
   assign axi_master_priority[11] = `AXI_PRIORITY_M11;
 `endif
 `ifdef AXI_HAS_M12 
   assign axi_master_priority[12] = `AXI_PRIORITY_M12;
 `endif
 `ifdef AXI_HAS_M13 
   assign axi_master_priority[13] = `AXI_PRIORITY_M13;
 `endif
 `ifdef AXI_HAS_M14 
   assign axi_master_priority[14] = `AXI_PRIORITY_M14;
 `endif
 `ifdef AXI_HAS_M15 
   assign axi_master_priority[15] = `AXI_PRIORITY_M15;
 `endif
 `ifdef AXI_HAS_M16 
   assign axi_master_priority[16] = `AXI_PRIORITY_M16;
 `endif
 `ifdef AXI_HAS_S1 
   assign axi_slave_priority[1] = `AXI_PRIORITY_S1;
 `endif
 `ifdef AXI_HAS_S2 
   assign axi_slave_priority[2] = `AXI_PRIORITY_S2;
 `endif
 `ifdef AXI_HAS_S3 
   assign axi_slave_priority[3] = `AXI_PRIORITY_S3;
 `endif
 `ifdef AXI_HAS_S4 
   assign axi_slave_priority[4] = `AXI_PRIORITY_S4;
 `endif
 `ifdef AXI_HAS_S5 
   assign axi_slave_priority[5] = `AXI_PRIORITY_S5;
 `endif
 `ifdef AXI_HAS_S6 
   assign axi_slave_priority[6] = `AXI_PRIORITY_S6;
 `endif
 `ifdef AXI_HAS_S7 
   assign axi_slave_priority[7] = `AXI_PRIORITY_S7;
 `endif
 `ifdef AXI_HAS_S8 
   assign axi_slave_priority[8] = `AXI_PRIORITY_S8;
 `endif
 `ifdef AXI_HAS_S9 
   assign axi_slave_priority[9] = `AXI_PRIORITY_S9;
 `endif
 `ifdef AXI_HAS_S10 
   assign axi_slave_priority[10] = `AXI_PRIORITY_S10;
 `endif
 `ifdef AXI_HAS_S11 
   assign axi_slave_priority[11] = `AXI_PRIORITY_S11;
 `endif
 `ifdef AXI_HAS_S12 
   assign axi_slave_priority[12] = `AXI_PRIORITY_S12;
 `endif
 `ifdef AXI_HAS_S13 
   assign axi_slave_priority[13] = `AXI_PRIORITY_S13;
 `endif
 `ifdef AXI_HAS_S14 
   assign axi_slave_priority[14] = `AXI_PRIORITY_S14;
 `endif
 `ifdef AXI_HAS_S15 
   assign axi_slave_priority[15] = `AXI_PRIORITY_S15;
 `endif
 `ifdef AXI_HAS_S16 
   assign axi_slave_priority[16] = `AXI_PRIORITY_S16;
 `endif
 `endif

 `ifdef AXI_HAS_M1
   assign ri_limit_m[0] = `AXI_RI_LIMIT_M1;
 `endif
 `ifdef AXI_HAS_M2
   assign ri_limit_m[1] = `AXI_RI_LIMIT_M2;
 `endif
 `ifdef AXI_HAS_M3
   assign ri_limit_m[2] = `AXI_RI_LIMIT_M3;
 `endif
 `ifdef AXI_HAS_M4
   assign ri_limit_m[3] = `AXI_RI_LIMIT_M4;
 `endif
 `ifdef AXI_HAS_M5
   assign ri_limit_m[4] = `AXI_RI_LIMIT_M5;
 `endif
 `ifdef AXI_HAS_M6
   assign ri_limit_m[5] = `AXI_RI_LIMIT_M6;
 `endif
 `ifdef AXI_HAS_M7
   assign ri_limit_m[6] = `AXI_RI_LIMIT_M7;
 `endif
 `ifdef AXI_HAS_M8
   assign ri_limit_m[7] = `AXI_RI_LIMIT_M8;
 `endif
 `ifdef AXI_HAS_M9
   assign ri_limit_m[8] = `AXI_RI_LIMIT_M9;
 `endif
 `ifdef AXI_HAS_M10
   assign ri_limit_m[9] = `AXI_RI_LIMIT_M10;
 `endif
 `ifdef AXI_HAS_M11
   assign ri_limit_m[10] = `AXI_RI_LIMIT_M11;
 `endif
 `ifdef AXI_HAS_M12
   assign ri_limit_m[11] = `AXI_RI_LIMIT_M12;
 `endif
 `ifdef AXI_HAS_M13
   assign ri_limit_m[12] = `AXI_RI_LIMIT_M13;
 `endif
 `ifdef AXI_HAS_M14
   assign ri_limit_m[13] = `AXI_RI_LIMIT_M14;
 `endif
 `ifdef AXI_HAS_M15
   assign ri_limit_m[14] = `AXI_RI_LIMIT_M15;
 `endif
 `ifdef AXI_HAS_M16
   assign ri_limit_m[15] = `AXI_RI_LIMIT_M16;
 `endif
