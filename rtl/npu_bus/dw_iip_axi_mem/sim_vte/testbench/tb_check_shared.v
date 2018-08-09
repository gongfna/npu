/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
**                            ALL RIGHTS RESERVED
**
**  This software and the associated documentation are confidential and
**  proprietary to Synopsys, Inc.  Your use or disclosure of this
**  software is subject to the terms and conditions of a written
**  license agreement between you, or your company, and Synopsys, Inc.
**
**  The entire notice above must be reproduced on all authorized copies.
**
** ---------------------------------------------------------------------
**
** File     : tb_check_shared.v
** Abstract : 2 checks related to the hybrid feature.
**            
**            1. Check shared, checks that source sink paths configured
**               as shared, have been implemented as such.
**
**            2. Check dedicated, checks that source sink paths 
**               configured as dedicated, have been implemented as such.
**
**
** ---------------------------------------------------------------------
*/

`include "DW_axi_constants.v"
`include "DW_axi_cc_constants.v"

module tb_check_shared (
  clk,
  resetn,

  report_parallel,

  valid_0,
  valid_1,
  valid_2,
  valid_3,
  valid_4,
  valid_5,
  valid_6,
  valid_7,
  valid_8,
  valid_9,
  valid_10,
  valid_11,
  valid_12,
  valid_13,
  valid_14,
  valid_15,
  valid_16,

  idmst_snk_0,
  idmst_snk_1,
  idmst_snk_2,
  idmst_snk_3,
  idmst_snk_4,
  idmst_snk_5,
  idmst_snk_6,
  idmst_snk_7,
  idmst_snk_8,
  idmst_snk_9,
  idmst_snk_10,
  idmst_snk_11,
  idmst_snk_12,
  idmst_snk_13,
  idmst_snk_14,
  idmst_snk_15,
  idmst_snk_16,

  act_ids_m1,
  act_ids_m2,
  act_ids_m3,
  act_ids_m4,
  act_ids_m5,
  act_ids_m6,
  act_ids_m7,
  act_ids_m8,
  act_ids_m9,
  act_ids_m10,
  act_ids_m11,
  act_ids_m12,
  act_ids_m13,
  act_ids_m14,
  act_ids_m15,
  act_ids_m16,

  act_snums_m1,
  act_snums_m2,
  act_snums_m3,
  act_snums_m4,
  act_snums_m5,
  act_snums_m6,
  act_snums_m7,
  act_snums_m8,
  act_snums_m9,
  act_snums_m10,
  act_snums_m11,
  act_snums_m12,
  act_snums_m13,
  act_snums_m14,
  act_snums_m15,
  act_snums_m16,

  act_counts_m1,
  act_counts_m2,
  act_counts_m3,
  act_counts_m4,
  act_counts_m5,
  act_counts_m6,
  act_counts_m7,
  act_counts_m8,
  act_counts_m9,
  act_counts_m10,
  act_counts_m11,
  act_counts_m12,
  act_counts_m13,
  act_counts_m14,
  act_counts_m15,
  act_counts_m16,

  dummy_input
);
  // Parameters
  parameter NUM_SRC = 1;
  parameter NUM_SNK = 1;
  parameter NUM_SNK_SHRD = 1;

  parameter IDMST_SNK_W = 1;

  // 0 - AW
  // 1 - W
  // 2 - B
  // 3 - AR
  // 4 - R
  parameter CH = 0;

  parameter DEBUG = 0;

  // Max value of MAX_UIDA_M* parameters.
  `define MAX_UIDA 32

  // Max value of L2_MAX_RCA_ID_P1_M* parameters.
  `define MAX_L2_RCA_ID_P1 5

  // Log2 of max number of slaves.
  `define AXI_LOG2_MAX_NUM_MST_SLVS 5

  // Don't perform dedicated layer parallel access check
  // if number of sources visible to a sink is less than
  // this number. Likelyhood of hitting pass condition
  // is too low.
  `define VIS_CHECK_LIMIT 10
  
  // Don't perform dedicated layer parallel access check
  // if number of dedicated sources visible to a sink is less than
  // this number. Likelyhood of hitting pass condition
  // is too low.
  `define NUM_DDCTD_CHECK_LIMIT 10

  // Don't perform dedicated layer parallel access check
  // if number of sinks on shared layer is less than
  // this number. Likelyhood of hitting pass condition
  // is too low.
  `define NUM_SNK_SHRD_CHECK_LIMIT 10


  // Max unique ID limit for each master.
  localparam MAX_UIDA_M1 = (CH == 4) ? `AXI_MAX_URIDA_M1 : `AXI_MAX_UWIDA_M1;
  localparam MAX_UIDA_M2 = (CH == 4) ? `AXI_MAX_URIDA_M2 : `AXI_MAX_UWIDA_M2;
  localparam MAX_UIDA_M3 = (CH == 4) ? `AXI_MAX_URIDA_M3 : `AXI_MAX_UWIDA_M3;
  localparam MAX_UIDA_M4 = (CH == 4) ? `AXI_MAX_URIDA_M4 : `AXI_MAX_UWIDA_M4;
  localparam MAX_UIDA_M5 = (CH == 4) ? `AXI_MAX_URIDA_M5 : `AXI_MAX_UWIDA_M5;
  localparam MAX_UIDA_M6 = (CH == 4) ? `AXI_MAX_URIDA_M6 : `AXI_MAX_UWIDA_M6;
  localparam MAX_UIDA_M7 = (CH == 4) ? `AXI_MAX_URIDA_M7 : `AXI_MAX_UWIDA_M7;
  localparam MAX_UIDA_M8 = (CH == 4) ? `AXI_MAX_URIDA_M8 : `AXI_MAX_UWIDA_M8;
  localparam MAX_UIDA_M9 = (CH == 4) ? `AXI_MAX_URIDA_M9 : `AXI_MAX_UWIDA_M9;
  localparam MAX_UIDA_M10 = (CH == 4) ? `AXI_MAX_URIDA_M10 : `AXI_MAX_UWIDA_M10;
  localparam MAX_UIDA_M11 = (CH == 4) ? `AXI_MAX_URIDA_M11 : `AXI_MAX_UWIDA_M11;
  localparam MAX_UIDA_M12 = (CH == 4) ? `AXI_MAX_URIDA_M12 : `AXI_MAX_UWIDA_M12;
  localparam MAX_UIDA_M13 = (CH == 4) ? `AXI_MAX_URIDA_M13 : `AXI_MAX_UWIDA_M13;
  localparam MAX_UIDA_M14 = (CH == 4) ? `AXI_MAX_URIDA_M14 : `AXI_MAX_UWIDA_M14;
  localparam MAX_UIDA_M15 = (CH == 4) ? `AXI_MAX_URIDA_M15 : `AXI_MAX_UWIDA_M15;
  localparam MAX_UIDA_M16 = (CH == 4) ? `AXI_MAX_URIDA_M16 : `AXI_MAX_UWIDA_M16;

  // Max unique ID limit for each master.
  localparam L2_MAX_RCA_ID_P1_M1 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M1 : `AXI_LOG2_MAX_WCA_ID_P1_M1;
  localparam L2_MAX_RCA_ID_P1_M2 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M2 : `AXI_LOG2_MAX_WCA_ID_P1_M2;
  localparam L2_MAX_RCA_ID_P1_M3 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M3 : `AXI_LOG2_MAX_WCA_ID_P1_M3;
  localparam L2_MAX_RCA_ID_P1_M4 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M4 : `AXI_LOG2_MAX_WCA_ID_P1_M4;
  localparam L2_MAX_RCA_ID_P1_M5 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M5 : `AXI_LOG2_MAX_WCA_ID_P1_M5;
  localparam L2_MAX_RCA_ID_P1_M6 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M6 : `AXI_LOG2_MAX_WCA_ID_P1_M6;
  localparam L2_MAX_RCA_ID_P1_M7 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M7 : `AXI_LOG2_MAX_WCA_ID_P1_M7;
  localparam L2_MAX_RCA_ID_P1_M8 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M8 : `AXI_LOG2_MAX_WCA_ID_P1_M8;
  localparam L2_MAX_RCA_ID_P1_M9 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M9 : `AXI_LOG2_MAX_WCA_ID_P1_M9;
  localparam L2_MAX_RCA_ID_P1_M10 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M10 : `AXI_LOG2_MAX_WCA_ID_P1_M10;
  localparam L2_MAX_RCA_ID_P1_M11 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M11 : `AXI_LOG2_MAX_WCA_ID_P1_M11;
  localparam L2_MAX_RCA_ID_P1_M12 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M12 : `AXI_LOG2_MAX_WCA_ID_P1_M12;
  localparam L2_MAX_RCA_ID_P1_M13 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M13 : `AXI_LOG2_MAX_WCA_ID_P1_M13;
  localparam L2_MAX_RCA_ID_P1_M14 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M14 : `AXI_LOG2_MAX_WCA_ID_P1_M14;
  localparam L2_MAX_RCA_ID_P1_M15 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M15 : `AXI_LOG2_MAX_WCA_ID_P1_M15;
  localparam L2_MAX_RCA_ID_P1_M16 = (CH == 4) ? `AXI_LOG2_MAX_RCA_ID_P1_M16 : `AXI_LOG2_MAX_WCA_ID_P1_M16;

  // I/O SIGNALS
  input clk;
  input resetn;

  input report_parallel; // Asserted at the end of the sim to report dedicated master slave paths that
                         // have not had parallel access during the sim.

  // Valid signal for each sink.
  input valid_0;
  input valid_1;
  input valid_2;
  input valid_3;
  input valid_4;
  input valid_5;
  input valid_6;
  input valid_7;
  input valid_8;
  input valid_9;
  input valid_10;
  input valid_11;
  input valid_12;
  input valid_13;
  input valid_14;
  input valid_15;
  input valid_16;

  // Source number in the
  input [IDMST_SNK_W-1:0] idmst_snk_0;
  input [IDMST_SNK_W-1:0] idmst_snk_1;
  input [IDMST_SNK_W-1:0] idmst_snk_2;
  input [IDMST_SNK_W-1:0] idmst_snk_3;
  input [IDMST_SNK_W-1:0] idmst_snk_4;
  input [IDMST_SNK_W-1:0] idmst_snk_5;
  input [IDMST_SNK_W-1:0] idmst_snk_6;
  input [IDMST_SNK_W-1:0] idmst_snk_7;
  input [IDMST_SNK_W-1:0] idmst_snk_8;
  input [IDMST_SNK_W-1:0] idmst_snk_9;
  input [IDMST_SNK_W-1:0] idmst_snk_10;
  input [IDMST_SNK_W-1:0] idmst_snk_11;
  input [IDMST_SNK_W-1:0] idmst_snk_12;
  input [IDMST_SNK_W-1:0] idmst_snk_13;
  input [IDMST_SNK_W-1:0] idmst_snk_14;
  input [IDMST_SNK_W-1:0] idmst_snk_15;
  input [IDMST_SNK_W-1:0] idmst_snk_16;

  // Active ID bus from each master, read or write depending
  // on channel being tested here.
  input [MAX_UIDA_M1*`AXI_MIDW-1:0] act_ids_m1;
  input [MAX_UIDA_M2*`AXI_MIDW-1:0] act_ids_m2;
  input [MAX_UIDA_M3*`AXI_MIDW-1:0] act_ids_m3;
  input [MAX_UIDA_M4*`AXI_MIDW-1:0] act_ids_m4;
  input [MAX_UIDA_M5*`AXI_MIDW-1:0] act_ids_m5;
  input [MAX_UIDA_M6*`AXI_MIDW-1:0] act_ids_m6;
  input [MAX_UIDA_M7*`AXI_MIDW-1:0] act_ids_m7;
  input [MAX_UIDA_M8*`AXI_MIDW-1:0] act_ids_m8;
  input [MAX_UIDA_M9*`AXI_MIDW-1:0] act_ids_m9;
  input [MAX_UIDA_M10*`AXI_MIDW-1:0] act_ids_m10;
  input [MAX_UIDA_M11*`AXI_MIDW-1:0] act_ids_m11;
  input [MAX_UIDA_M12*`AXI_MIDW-1:0] act_ids_m12;
  input [MAX_UIDA_M13*`AXI_MIDW-1:0] act_ids_m13;
  input [MAX_UIDA_M14*`AXI_MIDW-1:0] act_ids_m14;
  input [MAX_UIDA_M15*`AXI_MIDW-1:0] act_ids_m15;
  input [MAX_UIDA_M16*`AXI_MIDW-1:0] act_ids_m16;
 
  // Busses of active slave numbers from each master.
  input [MAX_UIDA_M1*`AXI_LOG2_NSP1V_M1-1:0] act_snums_m1;
  input [MAX_UIDA_M2*`AXI_LOG2_NSP1V_M2-1:0] act_snums_m2;
  input [MAX_UIDA_M3*`AXI_LOG2_NSP1V_M3-1:0] act_snums_m3;
  input [MAX_UIDA_M4*`AXI_LOG2_NSP1V_M4-1:0] act_snums_m4;
  input [MAX_UIDA_M5*`AXI_LOG2_NSP1V_M5-1:0] act_snums_m5;
  input [MAX_UIDA_M6*`AXI_LOG2_NSP1V_M6-1:0] act_snums_m6;
  input [MAX_UIDA_M7*`AXI_LOG2_NSP1V_M7-1:0] act_snums_m7;
  input [MAX_UIDA_M8*`AXI_LOG2_NSP1V_M8-1:0] act_snums_m8;
  input [MAX_UIDA_M9*`AXI_LOG2_NSP1V_M9-1:0] act_snums_m9;
  input [MAX_UIDA_M10*`AXI_LOG2_NSP1V_M10-1:0] act_snums_m10;
  input [MAX_UIDA_M11*`AXI_LOG2_NSP1V_M11-1:0] act_snums_m11;
  input [MAX_UIDA_M12*`AXI_LOG2_NSP1V_M12-1:0] act_snums_m12;
  input [MAX_UIDA_M13*`AXI_LOG2_NSP1V_M13-1:0] act_snums_m13;
  input [MAX_UIDA_M14*`AXI_LOG2_NSP1V_M14-1:0] act_snums_m14;
  input [MAX_UIDA_M15*`AXI_LOG2_NSP1V_M15-1:0] act_snums_m15;
  input [MAX_UIDA_M16*`AXI_LOG2_NSP1V_M16-1:0] act_snums_m16;

  // Busses of active transaction counts from each master.
  input [MAX_UIDA_M1*L2_MAX_RCA_ID_P1_M1-1:0] act_counts_m1;
  input [MAX_UIDA_M2*L2_MAX_RCA_ID_P1_M2-1:0] act_counts_m2;
  input [MAX_UIDA_M3*L2_MAX_RCA_ID_P1_M3-1:0] act_counts_m3;
  input [MAX_UIDA_M4*L2_MAX_RCA_ID_P1_M4-1:0] act_counts_m4;
  input [MAX_UIDA_M5*L2_MAX_RCA_ID_P1_M5-1:0] act_counts_m5;
  input [MAX_UIDA_M6*L2_MAX_RCA_ID_P1_M6-1:0] act_counts_m6;
  input [MAX_UIDA_M7*L2_MAX_RCA_ID_P1_M7-1:0] act_counts_m7;
  input [MAX_UIDA_M8*L2_MAX_RCA_ID_P1_M8-1:0] act_counts_m8;
  input [MAX_UIDA_M9*L2_MAX_RCA_ID_P1_M9-1:0] act_counts_m9;
  input [MAX_UIDA_M10*L2_MAX_RCA_ID_P1_M10-1:0] act_counts_m10;
  input [MAX_UIDA_M11*L2_MAX_RCA_ID_P1_M11-1:0] act_counts_m11;
  input [MAX_UIDA_M12*L2_MAX_RCA_ID_P1_M12-1:0] act_counts_m12;
  input [MAX_UIDA_M13*L2_MAX_RCA_ID_P1_M13-1:0] act_counts_m13;
  input [MAX_UIDA_M14*L2_MAX_RCA_ID_P1_M14-1:0] act_counts_m14;
  input [MAX_UIDA_M15*L2_MAX_RCA_ID_P1_M15-1:0] act_counts_m15;
  input [MAX_UIDA_M16*L2_MAX_RCA_ID_P1_M16-1:0] act_counts_m16;


  input dummy_input; // Allows for ifdefs in instantion.


  // INTERNAL SIGNALS
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] valid_bus_max;
  wire [NUM_SNK-1:0]               valid_bus;

  wire [`AXI_MAX_NUM_MST_SLVS*IDMST_SNK_W-1:0] idmst_snk_bus_max;
  wire [NUM_SNK*IDMST_SNK_W-1:0]               idmst_snk_bus;

  // Bus variables to hold the shared layer param settings 
  // all master slave links.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink0_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink1_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink2_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink3_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink4_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink5_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink6_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink7_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink8_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink9_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink10_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink11_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink12_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink13_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink14_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink15_src;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink16_src;

  // Sized for number of configured sources only.
  wire [NUM_SRC-1:0] bus_shrd_sink0_src;
  wire [NUM_SRC-1:0] bus_shrd_sink1_src;
  wire [NUM_SRC-1:0] bus_shrd_sink2_src;
  wire [NUM_SRC-1:0] bus_shrd_sink3_src;
  wire [NUM_SRC-1:0] bus_shrd_sink4_src;
  wire [NUM_SRC-1:0] bus_shrd_sink5_src;
  wire [NUM_SRC-1:0] bus_shrd_sink6_src;
  wire [NUM_SRC-1:0] bus_shrd_sink7_src;
  wire [NUM_SRC-1:0] bus_shrd_sink8_src;
  wire [NUM_SRC-1:0] bus_shrd_sink9_src;
  wire [NUM_SRC-1:0] bus_shrd_sink10_src;
  wire [NUM_SRC-1:0] bus_shrd_sink11_src;
  wire [NUM_SRC-1:0] bus_shrd_sink12_src;
  wire [NUM_SRC-1:0] bus_shrd_sink13_src;
  wire [NUM_SRC-1:0] bus_shrd_sink14_src;
  wire [NUM_SRC-1:0] bus_shrd_sink15_src;
  wire [NUM_SRC-1:0] bus_shrd_sink16_src;
  
  // All bus_shrd_sink*_src signals collected into a single bus.
  wire [NUM_SRC*`AXI_MAX_NUM_MST_SLVS-1:0] bus_max_shrd_sink_src;

  // Sized for num configured sinks only.
  wire [NUM_SRC*NUM_SNK-1:0] bus_shrd_sink_src;

  // Max sized busses for active master ids, slave numbers, and t/x counts.
  reg [`MAX_UIDA*`AXI_MIDW-1:0] act_ids_max;
  reg [`MAX_UIDA*`AXI_LOG2_MAX_NUM_MST_SLVS-1:0] act_snums_max;
  reg [`MAX_UIDA*`MAX_L2_RCA_ID_P1-1:0] act_counts_max;

  // Bus of visibility parameters for each master (bit for each slave).
  // Only required on R & B channels.
  reg [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_this_m;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m1;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m2;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m3;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m4;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m5;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m6;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m7;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m8;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m9;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m10;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m11;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m12;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m13;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m14;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m15;
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus_m16;

  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s0;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s1;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s2;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s3;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s4;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s5;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s6;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s7;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s8;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s9;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s10;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s11;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s12;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s13;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s14;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s15;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_s16;

  // Log when parallel access has been detected on a master/slave link.
  // Grouped as {{mx_sx,mx_s0},{m1_sx,m1_s0}}.
  reg [`AXI_NUM_MASTERS*`AXI_NSP1-1:0] mst_slv_parallel_acc_r;
  //reg [`AXI_NUM_MASTERS*`AXI_NSP1-1:0] mst_slv_parallel_acc;

  // Number of shared valids asserted in each cycle.
  integer num_valids;

  // Visibility signals per master.
  assign vis_bus_m1 = 
    { (`AXI_VV_S16_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M1 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m2 = 
    { (`AXI_VV_S16_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M2 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m3 = 
    { (`AXI_VV_S16_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M3 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m4 = 
    { (`AXI_VV_S16_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M4 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m5 = 
    { (`AXI_VV_S16_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M5 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m6 = 
    { (`AXI_VV_S16_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M6 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m7 = 
    { (`AXI_VV_S16_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M7 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m8 = 
    { (`AXI_VV_S16_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M8 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m9 = 
    { (`AXI_VV_S16_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M9 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m10 = 
    { (`AXI_VV_S16_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M10 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m11 = 
    { (`AXI_VV_S16_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M11 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m12 = 
    { (`AXI_VV_S16_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M12 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m13 = 
    { (`AXI_VV_S16_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M13 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m14 = 
    { (`AXI_VV_S16_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M14 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m15 = 
    { (`AXI_VV_S16_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M15 ? 1'b1 : 1'b0)
    };

  assign vis_bus_m16 = 
    { (`AXI_VV_S16_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M16 ? 1'b1 : 1'b0)
    };

  // Visibility signals per slave.
  assign vis_bus_s0 = 
   {  (`AXI_VV_S0_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S0_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s1 = 
   {  (`AXI_VV_S1_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S1_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s2 = 
   {  (`AXI_VV_S2_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S2_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s3 = 
   {  (`AXI_VV_S3_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S3_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s4 = 
   {  (`AXI_VV_S4_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S4_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s5 = 
   {  (`AXI_VV_S5_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S5_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s6 = 
   {  (`AXI_VV_S6_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S6_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s7 = 
   {  (`AXI_VV_S7_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S7_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s8 = 
   {  (`AXI_VV_S8_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S8_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s9 = 
   {  (`AXI_VV_S9_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S9_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s10 = 
   {  (`AXI_VV_S10_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S10_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s11 = 
   {  (`AXI_VV_S11_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S11_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s12 = 
   {  (`AXI_VV_S12_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S12_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s13 = 
   {  (`AXI_VV_S13_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S13_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s14 = 
   {  (`AXI_VV_S14_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S14_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s15 = 
   {  (`AXI_VV_S15_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S15_BY_M1 ? 1'b1 : 1'b0)
    };

  assign vis_bus_s16 = 
   {  (`AXI_VV_S16_BY_M16 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M15 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M14 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M13 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M12 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M11 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M10 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M9 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M8 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M7 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M6 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M5 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M4 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M3 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M2 ? 1'b1 : 1'b0),
      (`AXI_VV_S16_BY_M1 ? 1'b1 : 1'b0)
    };


  // Create busses containing the shared layer settings for all sources to
  // to all sinks. Individual per sink busses created first, then collected
  // into 1 signal (essentially a 2 dimensional array).
  assign bus_max_shrd_sink0_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M1_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M1_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M16==1) 
               : ( `AXI_R_LAYER_M1_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M15==1) 
               : ( `AXI_R_LAYER_M1_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M14==1) 
               : ( `AXI_R_LAYER_M1_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M13==1) 
               : ( `AXI_R_LAYER_M1_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M12==1) 
               : ( `AXI_R_LAYER_M1_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M11==1) 
               : ( `AXI_R_LAYER_M1_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M10==1) 
               : ( `AXI_R_LAYER_M1_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M9==1) 
               : ( `AXI_R_LAYER_M1_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M8==1) 
               : ( `AXI_R_LAYER_M1_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M7==1) 
               : ( `AXI_R_LAYER_M1_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M6==1) 
               : ( `AXI_R_LAYER_M1_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M5==1) 
               : ( `AXI_R_LAYER_M1_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M4==1) 
               : ( `AXI_R_LAYER_M1_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M3==1) 
               : ( `AXI_R_LAYER_M1_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M2==1) 
               : ( `AXI_R_LAYER_M1_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S0_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S0_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M1_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S0_M1==1) 
               : ( `AXI_R_LAYER_M1_S0==1)
    )
  };
  assign bus_shrd_sink0_src = bus_max_shrd_sink0_src[NUM_SRC-1:0];

  // Sink 1
  assign bus_max_shrd_sink1_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M2_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M2_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M16==1) 
               : ( `AXI_R_LAYER_M2_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M15==1) 
               : ( `AXI_R_LAYER_M2_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M14==1) 
               : ( `AXI_R_LAYER_M2_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M13==1) 
               : ( `AXI_R_LAYER_M2_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M12==1) 
               : ( `AXI_R_LAYER_M2_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M11==1) 
               : ( `AXI_R_LAYER_M2_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M10==1) 
               : ( `AXI_R_LAYER_M2_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M9==1) 
               : ( `AXI_R_LAYER_M2_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M8==1) 
               : ( `AXI_R_LAYER_M2_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M7==1) 
               : ( `AXI_R_LAYER_M2_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M6==1) 
               : ( `AXI_R_LAYER_M2_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M5==1) 
               : ( `AXI_R_LAYER_M2_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M4==1) 
               : ( `AXI_R_LAYER_M2_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M3==1) 
               : ( `AXI_R_LAYER_M2_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M2==1) 
               : ( `AXI_R_LAYER_M2_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S1_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S1_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M2_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S1_M1==1) 
               : ( `AXI_R_LAYER_M2_S0==1)
    )
  };
  assign bus_shrd_sink1_src = bus_max_shrd_sink1_src[NUM_SRC-1:0];


  // Sink 2
  assign bus_max_shrd_sink2_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M3_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M3_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M16==1) 
               : ( `AXI_R_LAYER_M3_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M15==1) 
               : ( `AXI_R_LAYER_M3_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M14==1) 
               : ( `AXI_R_LAYER_M3_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M13==1) 
               : ( `AXI_R_LAYER_M3_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M12==1) 
               : ( `AXI_R_LAYER_M3_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M11==1) 
               : ( `AXI_R_LAYER_M3_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M10==1) 
               : ( `AXI_R_LAYER_M3_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M9==1) 
               : ( `AXI_R_LAYER_M3_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M8==1) 
               : ( `AXI_R_LAYER_M3_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M7==1) 
               : ( `AXI_R_LAYER_M3_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M6==1) 
               : ( `AXI_R_LAYER_M3_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M5==1) 
               : ( `AXI_R_LAYER_M3_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M4==1) 
               : ( `AXI_R_LAYER_M3_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M3==1) 
               : ( `AXI_R_LAYER_M3_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M2==1) 
               : ( `AXI_R_LAYER_M3_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S2_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S2_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M3_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S2_M1==1) 
               : ( `AXI_R_LAYER_M3_S0==1)
    )
  };
  assign bus_shrd_sink2_src = bus_max_shrd_sink2_src[NUM_SRC-1:0];


  // Sink 3
  assign bus_max_shrd_sink3_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M4_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M4_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M16==1) 
               : ( `AXI_R_LAYER_M4_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M15==1) 
               : ( `AXI_R_LAYER_M4_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M14==1) 
               : ( `AXI_R_LAYER_M4_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M13==1) 
               : ( `AXI_R_LAYER_M4_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M12==1) 
               : ( `AXI_R_LAYER_M4_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M11==1) 
               : ( `AXI_R_LAYER_M4_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M10==1) 
               : ( `AXI_R_LAYER_M4_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M9==1) 
               : ( `AXI_R_LAYER_M4_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M8==1) 
               : ( `AXI_R_LAYER_M4_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M7==1) 
               : ( `AXI_R_LAYER_M4_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M6==1) 
               : ( `AXI_R_LAYER_M4_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M5==1) 
               : ( `AXI_R_LAYER_M4_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M4==1) 
               : ( `AXI_R_LAYER_M4_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M3==1) 
               : ( `AXI_R_LAYER_M4_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M2==1) 
               : ( `AXI_R_LAYER_M4_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S3_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S3_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M4_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S3_M1==1) 
               : ( `AXI_R_LAYER_M4_S0==1)
    )
  };
  assign bus_shrd_sink3_src = bus_max_shrd_sink3_src[NUM_SRC-1:0];


  // Sink 4
  assign bus_max_shrd_sink4_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M5_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M5_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M16==1) 
               : ( `AXI_R_LAYER_M5_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M15==1) 
               : ( `AXI_R_LAYER_M5_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M14==1) 
               : ( `AXI_R_LAYER_M5_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M13==1) 
               : ( `AXI_R_LAYER_M5_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M12==1) 
               : ( `AXI_R_LAYER_M5_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M11==1) 
               : ( `AXI_R_LAYER_M5_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M10==1) 
               : ( `AXI_R_LAYER_M5_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M9==1) 
               : ( `AXI_R_LAYER_M5_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M8==1) 
               : ( `AXI_R_LAYER_M5_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M7==1) 
               : ( `AXI_R_LAYER_M5_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M6==1) 
               : ( `AXI_R_LAYER_M5_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M5==1) 
               : ( `AXI_R_LAYER_M5_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M4==1) 
               : ( `AXI_R_LAYER_M5_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M3==1) 
               : ( `AXI_R_LAYER_M5_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M2==1) 
               : ( `AXI_R_LAYER_M5_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S4_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S4_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M5_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S4_M1==1) 
               : ( `AXI_R_LAYER_M5_S0==1)
    )
  };
  assign bus_shrd_sink4_src = bus_max_shrd_sink4_src[NUM_SRC-1:0];

  // Sink 5
  assign bus_max_shrd_sink5_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M6_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M6_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M16==1) 
               : ( `AXI_R_LAYER_M6_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M15==1) 
               : ( `AXI_R_LAYER_M6_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M14==1) 
               : ( `AXI_R_LAYER_M6_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M13==1) 
               : ( `AXI_R_LAYER_M6_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M12==1) 
               : ( `AXI_R_LAYER_M6_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M11==1) 
               : ( `AXI_R_LAYER_M6_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M10==1) 
               : ( `AXI_R_LAYER_M6_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M9==1) 
               : ( `AXI_R_LAYER_M6_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M8==1) 
               : ( `AXI_R_LAYER_M6_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M7==1) 
               : ( `AXI_R_LAYER_M6_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M6==1) 
               : ( `AXI_R_LAYER_M6_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M5==1) 
               : ( `AXI_R_LAYER_M6_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M4==1) 
               : ( `AXI_R_LAYER_M6_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M3==1) 
               : ( `AXI_R_LAYER_M6_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M2==1) 
               : ( `AXI_R_LAYER_M6_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S5_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S5_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M6_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S5_M1==1) 
               : ( `AXI_R_LAYER_M6_S0==1)
    )
  };
  assign bus_shrd_sink5_src = bus_max_shrd_sink5_src[NUM_SRC-1:0];

  // Sink 6
  assign bus_max_shrd_sink6_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M7_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M7_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M16==1) 
               : ( `AXI_R_LAYER_M7_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M15==1) 
               : ( `AXI_R_LAYER_M7_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M14==1) 
               : ( `AXI_R_LAYER_M7_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M13==1) 
               : ( `AXI_R_LAYER_M7_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M12==1) 
               : ( `AXI_R_LAYER_M7_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M11==1) 
               : ( `AXI_R_LAYER_M7_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M10==1) 
               : ( `AXI_R_LAYER_M7_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M9==1) 
               : ( `AXI_R_LAYER_M7_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M8==1) 
               : ( `AXI_R_LAYER_M7_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M7==1) 
               : ( `AXI_R_LAYER_M7_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M6==1) 
               : ( `AXI_R_LAYER_M7_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M5==1) 
               : ( `AXI_R_LAYER_M7_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M4==1) 
               : ( `AXI_R_LAYER_M7_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M3==1) 
               : ( `AXI_R_LAYER_M7_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M2==1) 
               : ( `AXI_R_LAYER_M7_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S6_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S6_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M7_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S6_M1==1) 
               : ( `AXI_R_LAYER_M7_S0==1)
    )
  };
  assign bus_shrd_sink6_src = bus_max_shrd_sink6_src[NUM_SRC-1:0];

  // Sink 7
  assign bus_max_shrd_sink7_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M8_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M8_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M16==1) 
               : ( `AXI_R_LAYER_M8_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M15==1) 
               : ( `AXI_R_LAYER_M8_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M14==1) 
               : ( `AXI_R_LAYER_M8_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M13==1) 
               : ( `AXI_R_LAYER_M8_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M12==1) 
               : ( `AXI_R_LAYER_M8_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M11==1) 
               : ( `AXI_R_LAYER_M8_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M10==1) 
               : ( `AXI_R_LAYER_M8_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M9==1) 
               : ( `AXI_R_LAYER_M8_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M8==1) 
               : ( `AXI_R_LAYER_M8_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M7==1) 
               : ( `AXI_R_LAYER_M8_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M6==1) 
               : ( `AXI_R_LAYER_M8_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M5==1) 
               : ( `AXI_R_LAYER_M8_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M4==1) 
               : ( `AXI_R_LAYER_M8_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M3==1) 
               : ( `AXI_R_LAYER_M8_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M2==1) 
               : ( `AXI_R_LAYER_M8_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S7_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S7_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M8_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S7_M1==1) 
               : ( `AXI_R_LAYER_M8_S0==1)
    )
  };
  assign bus_shrd_sink7_src = bus_max_shrd_sink7_src[NUM_SRC-1:0];

  // Sink 8
  assign bus_max_shrd_sink8_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M9_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M9_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M16==1) 
               : ( `AXI_R_LAYER_M9_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M15==1) 
               : ( `AXI_R_LAYER_M9_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M14==1) 
               : ( `AXI_R_LAYER_M9_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M13==1) 
               : ( `AXI_R_LAYER_M9_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M12==1) 
               : ( `AXI_R_LAYER_M9_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M11==1) 
               : ( `AXI_R_LAYER_M9_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M10==1) 
               : ( `AXI_R_LAYER_M9_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M9==1) 
               : ( `AXI_R_LAYER_M9_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M8==1) 
               : ( `AXI_R_LAYER_M9_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M7==1) 
               : ( `AXI_R_LAYER_M9_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M6==1) 
               : ( `AXI_R_LAYER_M9_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M5==1) 
               : ( `AXI_R_LAYER_M9_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M4==1) 
               : ( `AXI_R_LAYER_M9_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M3==1) 
               : ( `AXI_R_LAYER_M9_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M2==1) 
               : ( `AXI_R_LAYER_M9_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S8_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S8_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M9_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S8_M1==1) 
               : ( `AXI_R_LAYER_M9_S0==1)
    )
  };
  assign bus_shrd_sink8_src = bus_max_shrd_sink8_src[NUM_SRC-1:0];

  // Sink 9
  assign bus_max_shrd_sink9_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M10_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M10_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M16==1) 
               : ( `AXI_R_LAYER_M10_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M15==1) 
               : ( `AXI_R_LAYER_M10_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M14==1) 
               : ( `AXI_R_LAYER_M10_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M13==1) 
               : ( `AXI_R_LAYER_M10_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M12==1) 
               : ( `AXI_R_LAYER_M10_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M11==1) 
               : ( `AXI_R_LAYER_M10_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M10==1) 
               : ( `AXI_R_LAYER_M10_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M9==1) 
               : ( `AXI_R_LAYER_M10_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M8==1) 
               : ( `AXI_R_LAYER_M10_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M7==1) 
               : ( `AXI_R_LAYER_M10_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M6==1) 
               : ( `AXI_R_LAYER_M10_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M5==1) 
               : ( `AXI_R_LAYER_M10_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M4==1) 
               : ( `AXI_R_LAYER_M10_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M3==1) 
               : ( `AXI_R_LAYER_M10_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M2==1) 
               : ( `AXI_R_LAYER_M10_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S9_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S9_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M10_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S9_M1==1) 
               : ( `AXI_R_LAYER_M10_S0==1)
    )
  };
  assign bus_shrd_sink9_src = bus_max_shrd_sink9_src[NUM_SRC-1:0];

  // Sink 10
  assign bus_max_shrd_sink10_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M11_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M11_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M16==1) 
               : ( `AXI_R_LAYER_M11_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M15==1) 
               : ( `AXI_R_LAYER_M11_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M14==1) 
               : ( `AXI_R_LAYER_M11_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M13==1) 
               : ( `AXI_R_LAYER_M11_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M12==1) 
               : ( `AXI_R_LAYER_M11_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M11==1) 
               : ( `AXI_R_LAYER_M11_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M10==1) 
               : ( `AXI_R_LAYER_M11_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M9==1) 
               : ( `AXI_R_LAYER_M11_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M8==1) 
               : ( `AXI_R_LAYER_M11_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M7==1) 
               : ( `AXI_R_LAYER_M11_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M6==1) 
               : ( `AXI_R_LAYER_M11_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M5==1) 
               : ( `AXI_R_LAYER_M11_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M4==1) 
               : ( `AXI_R_LAYER_M11_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M3==1) 
               : ( `AXI_R_LAYER_M11_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M2==1) 
               : ( `AXI_R_LAYER_M11_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S10_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S10_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M11_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S10_M1==1) 
               : ( `AXI_R_LAYER_M11_S0==1)
    )
  };
  assign bus_shrd_sink10_src = bus_max_shrd_sink10_src[NUM_SRC-1:0];

  // Sink 11
  assign bus_max_shrd_sink11_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M12_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M12_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M16==1) 
               : ( `AXI_R_LAYER_M12_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M15==1) 
               : ( `AXI_R_LAYER_M12_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M14==1) 
               : ( `AXI_R_LAYER_M12_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M13==1) 
               : ( `AXI_R_LAYER_M12_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M12==1) 
               : ( `AXI_R_LAYER_M12_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M11==1) 
               : ( `AXI_R_LAYER_M12_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M10==1) 
               : ( `AXI_R_LAYER_M12_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M9==1) 
               : ( `AXI_R_LAYER_M12_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M8==1) 
               : ( `AXI_R_LAYER_M12_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M7==1) 
               : ( `AXI_R_LAYER_M12_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M6==1) 
               : ( `AXI_R_LAYER_M12_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M5==1) 
               : ( `AXI_R_LAYER_M12_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M4==1) 
               : ( `AXI_R_LAYER_M12_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M3==1) 
               : ( `AXI_R_LAYER_M12_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M2==1) 
               : ( `AXI_R_LAYER_M12_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S11_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S11_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M12_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S11_M1==1) 
               : ( `AXI_R_LAYER_M12_S0==1)
    )
  };
  assign bus_shrd_sink11_src = bus_max_shrd_sink11_src[NUM_SRC-1:0];

  // Sink 12
  assign bus_max_shrd_sink12_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M13_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M13_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M16==1) 
               : ( `AXI_R_LAYER_M13_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M15==1) 
               : ( `AXI_R_LAYER_M13_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M14==1) 
               : ( `AXI_R_LAYER_M13_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M13==1) 
               : ( `AXI_R_LAYER_M13_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M12==1) 
               : ( `AXI_R_LAYER_M13_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M11==1) 
               : ( `AXI_R_LAYER_M13_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M10==1) 
               : ( `AXI_R_LAYER_M13_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M9==1) 
               : ( `AXI_R_LAYER_M13_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M8==1) 
               : ( `AXI_R_LAYER_M13_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M7==1) 
               : ( `AXI_R_LAYER_M13_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M6==1) 
               : ( `AXI_R_LAYER_M13_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M5==1) 
               : ( `AXI_R_LAYER_M13_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M4==1) 
               : ( `AXI_R_LAYER_M13_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M3==1) 
               : ( `AXI_R_LAYER_M13_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M2==1) 
               : ( `AXI_R_LAYER_M13_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S12_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S12_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M13_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S12_M1==1) 
               : ( `AXI_R_LAYER_M13_S0==1)
    )
  };
  assign bus_shrd_sink12_src = bus_max_shrd_sink12_src[NUM_SRC-1:0];

  // Sink 13
  assign bus_max_shrd_sink13_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M14_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M14_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M16==1) 
               : ( `AXI_R_LAYER_M14_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M15==1) 
               : ( `AXI_R_LAYER_M14_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M14==1) 
               : ( `AXI_R_LAYER_M14_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M13==1) 
               : ( `AXI_R_LAYER_M14_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M12==1) 
               : ( `AXI_R_LAYER_M14_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M11==1) 
               : ( `AXI_R_LAYER_M14_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M10==1) 
               : ( `AXI_R_LAYER_M14_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M9==1) 
               : ( `AXI_R_LAYER_M14_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M8==1) 
               : ( `AXI_R_LAYER_M14_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M7==1) 
               : ( `AXI_R_LAYER_M14_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M6==1) 
               : ( `AXI_R_LAYER_M14_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M5==1) 
               : ( `AXI_R_LAYER_M14_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M4==1) 
               : ( `AXI_R_LAYER_M14_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M3==1) 
               : ( `AXI_R_LAYER_M14_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M2==1) 
               : ( `AXI_R_LAYER_M14_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S13_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S13_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M14_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S13_M1==1) 
               : ( `AXI_R_LAYER_M14_S0==1)
    )
  };
  assign bus_shrd_sink13_src = bus_max_shrd_sink13_src[NUM_SRC-1:0];

  // Sink 14
  assign bus_max_shrd_sink14_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M15_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M15_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M16==1) 
               : ( `AXI_R_LAYER_M15_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M15==1) 
               : ( `AXI_R_LAYER_M15_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M14==1) 
               : ( `AXI_R_LAYER_M15_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M13==1) 
               : ( `AXI_R_LAYER_M15_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M12==1) 
               : ( `AXI_R_LAYER_M15_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M11==1) 
               : ( `AXI_R_LAYER_M15_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M10==1) 
               : ( `AXI_R_LAYER_M15_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M9==1) 
               : ( `AXI_R_LAYER_M15_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M8==1) 
               : ( `AXI_R_LAYER_M15_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M7==1) 
               : ( `AXI_R_LAYER_M15_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M6==1) 
               : ( `AXI_R_LAYER_M15_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M5==1) 
               : ( `AXI_R_LAYER_M15_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M4==1) 
               : ( `AXI_R_LAYER_M15_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M3==1) 
               : ( `AXI_R_LAYER_M15_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M2==1) 
               : ( `AXI_R_LAYER_M15_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S14_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S14_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M15_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S14_M1==1) 
               : ( `AXI_R_LAYER_M15_S0==1)
    )
  };
  assign bus_shrd_sink14_src = bus_max_shrd_sink14_src[NUM_SRC-1:0];

  // Sink 15
  assign bus_max_shrd_sink15_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
     : (CH==2) ? ( `AXI_B_LAYER_M16_S16==1) 
     : (CH==3) ? 1'b0
               : ( `AXI_R_LAYER_M16_S16==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M16==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S15==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M16==1) 
               : ( `AXI_R_LAYER_M16_S15==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M15==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S14==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M15==1) 
               : ( `AXI_R_LAYER_M16_S14==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M14==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S13==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M14==1) 
               : ( `AXI_R_LAYER_M16_S13==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M13==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S12==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M13==1) 
               : ( `AXI_R_LAYER_M16_S12==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M12==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S11==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M12==1) 
               : ( `AXI_R_LAYER_M16_S11==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M11==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S10==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M11==1) 
               : ( `AXI_R_LAYER_M16_S10==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M10==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S9==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M10==1) 
               : ( `AXI_R_LAYER_M16_S9==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M9==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S8==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M9==1) 
               : ( `AXI_R_LAYER_M16_S8==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M8==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S7==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M8==1) 
               : ( `AXI_R_LAYER_M16_S7==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M7==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S6==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M7==1) 
               : ( `AXI_R_LAYER_M16_S6==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M6==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S5==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M6==1) 
               : ( `AXI_R_LAYER_M16_S5==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M5==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S4==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M5==1) 
               : ( `AXI_R_LAYER_M16_S4==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M4==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S3==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M4==1) 
               : ( `AXI_R_LAYER_M16_S3==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M3==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S2==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M3==1) 
               : ( `AXI_R_LAYER_M16_S2==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M2==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S1==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M2==1) 
               : ( `AXI_R_LAYER_M16_S1==1)
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S15_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S15_M1==1) 
     : (CH==2) ? ( `AXI_B_LAYER_M16_S0==1) 
     : (CH==3) ? (`AXI_AR_LAYER_S15_M1==1) 
               : ( `AXI_R_LAYER_M16_S0==1)
    )
  };
  assign bus_shrd_sink15_src = bus_max_shrd_sink15_src[NUM_SRC-1:0];

  // Sink 16
  assign bus_max_shrd_sink16_src = {
    (  (CH==0) ? 1'b0 
     : (CH==1) ? 1'b0
               : 1'b0
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M16==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M16==1) 
               : (`AXI_AR_LAYER_S16_M16==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M15==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M15==1) 
               : (`AXI_AR_LAYER_S16_M15==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M14==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M14==1) 
               : (`AXI_AR_LAYER_S16_M14==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M13==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M13==1) 
               : (`AXI_AR_LAYER_S16_M13==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M12==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M12==1) 
               : (`AXI_AR_LAYER_S16_M12==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M11==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M11==1) 
               : (`AXI_AR_LAYER_S16_M11==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M10==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M10==1) 
               : (`AXI_AR_LAYER_S16_M10==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M9==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M9==1) 
               : (`AXI_AR_LAYER_S16_M9==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M8==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M8==1) 
               : (`AXI_AR_LAYER_S16_M8==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M7==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M7==1) 
               : (`AXI_AR_LAYER_S16_M7==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M6==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M6==1) 
               : (`AXI_AR_LAYER_S16_M6==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M5==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M5==1) 
               : (`AXI_AR_LAYER_S16_M5==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M4==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M4==1) 
               : (`AXI_AR_LAYER_S16_M4==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M3==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M3==1) 
               : (`AXI_AR_LAYER_S16_M3==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M2==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M2==1) 
               : (`AXI_AR_LAYER_S16_M2==1) 
    )
   ,(  (CH==0) ? (`AXI_AW_LAYER_S16_M1==1) 
     : (CH==1) ? ( `AXI_W_LAYER_S16_M1==1) 
               : (`AXI_AR_LAYER_S16_M1==1) 
    )
  };
  assign bus_shrd_sink16_src = bus_max_shrd_sink16_src[NUM_SRC-1:0];


  // Collect all bus_shrd_sink*_src signals into a single bus.
  assign bus_max_shrd_sink_src =
    { bus_shrd_sink16_src
     ,bus_shrd_sink15_src
     ,bus_shrd_sink14_src
     ,bus_shrd_sink13_src
     ,bus_shrd_sink12_src
     ,bus_shrd_sink11_src
     ,bus_shrd_sink10_src
     ,bus_shrd_sink9_src
     ,bus_shrd_sink8_src
     ,bus_shrd_sink7_src
     ,bus_shrd_sink6_src
     ,bus_shrd_sink5_src
     ,bus_shrd_sink4_src
     ,bus_shrd_sink3_src
     ,bus_shrd_sink2_src
     ,bus_shrd_sink1_src
     ,bus_shrd_sink0_src
    };
  // Strip away uneccessary bits.
  assign bus_shrd_sink_src = bus_max_shrd_sink_src[NUM_SRC*NUM_SNK-1:0];
 
  // Collect sink valid signals into a bus.
  assign valid_bus_max = 
    { valid_16
     ,valid_15
     ,valid_14
     ,valid_13
     ,valid_12
     ,valid_11
     ,valid_10
     ,valid_9
     ,valid_8
     ,valid_7
     ,valid_6
     ,valid_5
     ,valid_4
     ,valid_3
     ,valid_2
     ,valid_1
     ,valid_0
    };
  // Strip off extra bits.
  assign valid_bus = valid_bus_max[NUM_SNK-1:0];


  // Collect sink id values into a single bus.
  assign idmst_snk_bus_max = 
    { idmst_snk_16
     ,idmst_snk_15
     ,idmst_snk_14
     ,idmst_snk_13
     ,idmst_snk_12
     ,idmst_snk_11
     ,idmst_snk_10
     ,idmst_snk_9
     ,idmst_snk_8
     ,idmst_snk_7
     ,idmst_snk_6
     ,idmst_snk_5
     ,idmst_snk_4
     ,idmst_snk_3
     ,idmst_snk_2
     ,idmst_snk_1
     ,idmst_snk_0
    };
  // Strip off unused bits.
  assign idmst_snk_bus = idmst_snk_bus_max[NUM_SNK*IDMST_SNK_W-1:0];


  /*--------------------------------------------------------------------
   * Checking Code.
   */
  // Asserted if any shared slave has a link with a dedicated channel.
  wire aw_shrd_ddctd_lnk;
  assign aw_shrd_ddctd_lnk 
    = (  `AXI_S0_SHARED_AW_HAS_DDCTD
       | `AXI_S1_SHARED_AW_HAS_DDCTD 
       | `AXI_S2_SHARED_AW_HAS_DDCTD 
       | `AXI_S3_SHARED_AW_HAS_DDCTD 
       | `AXI_S4_SHARED_AW_HAS_DDCTD 
       | `AXI_S5_SHARED_AW_HAS_DDCTD 
       | `AXI_S6_SHARED_AW_HAS_DDCTD 
       | `AXI_S7_SHARED_AW_HAS_DDCTD 
       | `AXI_S8_SHARED_AW_HAS_DDCTD 
       | `AXI_S9_SHARED_AW_HAS_DDCTD 
       | `AXI_S10_SHARED_AW_HAS_DDCTD 
       | `AXI_S11_SHARED_AW_HAS_DDCTD 
       | `AXI_S12_SHARED_AW_HAS_DDCTD 
       | `AXI_S13_SHARED_AW_HAS_DDCTD 
       | `AXI_S14_SHARED_AW_HAS_DDCTD 
       | `AXI_S15_SHARED_AW_HAS_DDCTD 
       | `AXI_S16_SHARED_AW_HAS_DDCTD 
      );



  /*--------------------------------------------------------------------
   * CHECK SHARED
   *
   * If any 2 valids on the channel are asserted at the same time, 
   * generate an error if the valids are from paths which are both 
   * shared. Only 1 shared valid should be asserted at any time.
   */
  always @(*) begin : check_shared_PROC
    integer snk;
    integer src;
    integer idbit;

    integer snk_1;
    integer src_1;

    integer this_uida;
    integer this_log2_num_vis_sp;
    integer this_log2_count;

    integer slot;
    integer id_bit;
    integer slv_bit;
    integer count_bit;
    integer slv;
    integer vis_slv;
    integer slot_found;

    reg [`AXI_MIDW-1:0] slot_id;
    reg [`AXI_LOG2_NSP1-1:0] slot_slv;
    reg [`AXI_LOG2_MAX_NUM_MST_SLVS-1:0] slot_count;


    reg [IDMST_SNK_W-1:0] idmst_snk_tmp;

    reg error1;
  

    num_valids = 0;
    error1 = 0;

    // Delay this check so a valid deasserting on an edge while another
    // is asserting will not be seen as 2 valids asserted at the same
    // time.
    #2;

    for(snk=0;snk<NUM_SNK;snk=snk+1) begin
      //if(DEBUG==1) $display("%0t, SINK %0d", $time, snk);
      //if(DEBUG==1) $display("%0t, valid_bus[%0d] %0b", $time, snk, valid_bus[snk]);
      // Get source number who is accessing the sink.
      for(idbit=0;idbit<IDMST_SNK_W;idbit=idbit+1) begin
        idmst_snk_tmp[idbit] = idmst_snk_bus[(snk*IDMST_SNK_W)+idbit];
      end

      // For the AR, AW and W channels, the source can be determined
      // from the ID alone. (Not necessarilyy in bi di mode, but this checker
      // is not used in bi-di mode).
      src = idmst_snk_tmp;

      if(DEBUG==1) $display("%0t, src %0h, idmst_snk_tmp %0h", $time, src, idmst_snk_tmp);

      if((CH == 2) | (CH == 4) & valid_bus[snk]) begin
        // On the R and B channels, have to search the ID ordering tables of 
        // the associated master port in order to find which slave the t/x 
        // has come from.

        // Select active ID bus of this master.
        act_ids_max = 'b0;
        case(snk) 
          0 : act_ids_max = act_ids_m1;
          1 : act_ids_max = act_ids_m2;
          2 : act_ids_max = act_ids_m3;
          3 : act_ids_max = act_ids_m4;
          4 : act_ids_max = act_ids_m5;
          5 : act_ids_max = act_ids_m6;
          6 : act_ids_max = act_ids_m7;
          7 : act_ids_max = act_ids_m8;
          8 : act_ids_max = act_ids_m9;
          9 : act_ids_max = act_ids_m10;
          10 : act_ids_max = act_ids_m11;
          11 : act_ids_max = act_ids_m12;
          12 : act_ids_max = act_ids_m13;
          13 : act_ids_max = act_ids_m14;
          14 : act_ids_max = act_ids_m15;
          15 : act_ids_max = act_ids_m16;
        endcase

        // Select active slave number bus of this master.
        act_snums_max = 'b0;
        case(snk) 
          0 : act_snums_max = act_snums_m1;
          1 : act_snums_max = act_snums_m2;
          2 : act_snums_max = act_snums_m3;
          3 : act_snums_max = act_snums_m4;
          4 : act_snums_max = act_snums_m5;
          5 : act_snums_max = act_snums_m6;
          6 : act_snums_max = act_snums_m7;
          7 : act_snums_max = act_snums_m8;
          8 : act_snums_max = act_snums_m9;
          9 : act_snums_max = act_snums_m10;
          10 : act_snums_max = act_snums_m11;
          11 : act_snums_max = act_snums_m12;
          12 : act_snums_max = act_snums_m13;
          13 : act_snums_max = act_snums_m14;
          14 : act_snums_max = act_snums_m15;
          15 : act_snums_max = act_snums_m16;
        endcase

        // Select active slave number bus of this master.
        act_counts_max = 'b0;
        case(snk) 
          0 : act_counts_max = act_counts_m1;
          1 : act_counts_max = act_counts_m2;
          2 : act_counts_max = act_counts_m3;
          3 : act_counts_max = act_counts_m4;
          4 : act_counts_max = act_counts_m5;
          5 : act_counts_max = act_counts_m6;
          6 : act_counts_max = act_counts_m7;
          7 : act_counts_max = act_counts_m8;
          8 : act_counts_max = act_counts_m9;
          9 : act_counts_max = act_counts_m10;
          10 : act_counts_max = act_counts_m11;
          11 : act_counts_max = act_counts_m12;
          12 : act_counts_max = act_counts_m13;
          13 : act_counts_max = act_counts_m14;
          14 : act_counts_max = act_counts_m15;
          15 : act_counts_max = act_counts_m16;
        endcase

        // Select number of unique ID's for this master.
        this_uida = 0;
        case(snk) 
          0 : this_uida = MAX_UIDA_M1;
          1 : this_uida = MAX_UIDA_M2;
          2 : this_uida = MAX_UIDA_M3;
          3 : this_uida = MAX_UIDA_M4;
          4 : this_uida = MAX_UIDA_M5;
          5 : this_uida = MAX_UIDA_M6;
          6 : this_uida = MAX_UIDA_M7;
          7 : this_uida = MAX_UIDA_M8;
          8 : this_uida = MAX_UIDA_M9;
          9 : this_uida = MAX_UIDA_M10;
          10 : this_uida = MAX_UIDA_M11;
          11 : this_uida = MAX_UIDA_M12;
          12 : this_uida = MAX_UIDA_M13;
          13 : this_uida = MAX_UIDA_M14;
          14 : this_uida = MAX_UIDA_M15;
          15 : this_uida = MAX_UIDA_M16;
        endcase

        // Select number of unique ID's for this master.
        this_log2_num_vis_sp = 0;
        case(snk) 
          0 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M1;
          1 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M2;
          2 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M3;
          3 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M4;
          4 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M5;
          5 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M6;
          6 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M7;
          7 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M8;
          8 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M9;
          9 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M10;
          10 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M11;
          11 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M12;
          12 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M13;
          13 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M14;
          14 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M15;
          15 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M16;
        endcase

        // Select number active t/x's per unique ID for this master.
        this_log2_count = 0;
        case(snk) 
          0 : this_log2_count = L2_MAX_RCA_ID_P1_M1;
          1 : this_log2_count = L2_MAX_RCA_ID_P1_M2;
          2 : this_log2_count = L2_MAX_RCA_ID_P1_M3;
          3 : this_log2_count = L2_MAX_RCA_ID_P1_M4;
          4 : this_log2_count = L2_MAX_RCA_ID_P1_M5;
          5 : this_log2_count = L2_MAX_RCA_ID_P1_M6;
          6 : this_log2_count = L2_MAX_RCA_ID_P1_M7;
          7 : this_log2_count = L2_MAX_RCA_ID_P1_M8;
          8 : this_log2_count = L2_MAX_RCA_ID_P1_M9;
          9 : this_log2_count = L2_MAX_RCA_ID_P1_M10;
          10 : this_log2_count = L2_MAX_RCA_ID_P1_M11;
          11 : this_log2_count = L2_MAX_RCA_ID_P1_M12;
          12 : this_log2_count = L2_MAX_RCA_ID_P1_M13;
          13 : this_log2_count = L2_MAX_RCA_ID_P1_M14;
          14 : this_log2_count = L2_MAX_RCA_ID_P1_M15;
          15 : this_log2_count = L2_MAX_RCA_ID_P1_M16;
        endcase

        // Select visibility bus for this master.
        vis_bus_this_m = 'b0;
        case(snk) 
          0 : vis_bus_this_m = vis_bus_m1;
          1 : vis_bus_this_m = vis_bus_m2;
          2 : vis_bus_this_m = vis_bus_m3;
          3 : vis_bus_this_m = vis_bus_m4;
          4 : vis_bus_this_m = vis_bus_m5;
          5 : vis_bus_this_m = vis_bus_m6;
          6 : vis_bus_this_m = vis_bus_m7;
          7 : vis_bus_this_m = vis_bus_m8;
          8 : vis_bus_this_m = vis_bus_m9;
          9 : vis_bus_this_m = vis_bus_m10;
          10 : vis_bus_this_m = vis_bus_m11;
          11 : vis_bus_this_m = vis_bus_m12;
          12 : vis_bus_this_m = vis_bus_m13;
          13 : vis_bus_this_m = vis_bus_m14;
          14 : vis_bus_this_m = vis_bus_m15;
          15 : vis_bus_this_m = vis_bus_m16;
        endcase

        // Find which slave number the ID matches to.
        for(slot=0;slot<this_uida;slot=slot+1) begin
          if(DEBUG==1) $display("%0t, slot %0d", $time, slot);
          
          // Extract slot ID.
          slot_id = 'b0;
          for(id_bit=0;id_bit<=(`AXI_MIDW-1);id_bit=id_bit+1) begin
            slot_id[id_bit] = act_ids_max[(slot*`AXI_MIDW)+id_bit];
          end
          if(DEBUG==1) $display("%0t, slot_id %0h", $time, slot_id);
          
          // Extract slot slave.
          slot_slv = 'b0;
          for(slv_bit=0;slv_bit<=(this_log2_num_vis_sp-1);slv_bit=slv_bit+1) begin
            slot_slv[slv_bit] = act_snums_max[(slot*this_log2_num_vis_sp)+slv_bit];
            if(DEBUG==1) $display("%0t, slot_slv[%0d] %0b", $time, slv_bit, slot_slv[slv_bit]);
            if(DEBUG==1) $display("%0t, act_snums_max[%0d] %0b", $time, (slot*this_log2_num_vis_sp)+slv_bit, act_snums_max[(slot*this_log2_num_vis_sp)+slv_bit]);
          end
          if(DEBUG==1) $display("%0t, slot_slv %0b", $time, slot_slv);
          if(DEBUG==1) $display("%0t, act_snums_max %0b, this_log2_num_vis_sp %0d", $time, act_snums_max, this_log2_num_vis_sp);
          
          // Extract slot tx count.
          slot_count = {`AXI_LOG2_MAX_NUM_MST_SLVS{1'b0}};
          for(count_bit=0;count_bit<=(this_log2_count-1);count_bit=count_bit+1) begin
            slot_count[count_bit] = act_counts_max[(slot*this_log2_count)+count_bit];
          end
          if(DEBUG==1) $display("%0t, this_log2_count %0d", $time, this_log2_count);
          if(DEBUG==1) $display("%0t, act_counts_max %0b", $time, act_counts_max);
          if(DEBUG==1) $display("%0t, slot_count %0b", $time, slot_count);
          if(DEBUG==1) $display("%0t, idmst_snk_tmp %0b, slot_id %0b, slot_count %0b", $time, idmst_snk_tmp, slot_id, slot_count);

          if((idmst_snk_tmp == slot_id) & (slot_count != 'b0)) begin
            src = slot_slv;
            if(DEBUG==1) $display("%0t, SRC %0d", $time, src);
            if(DEBUG==1) $display("%0t, idmst_snk_tmp %0b, slot_id %0b, slot_count %0b", $time, idmst_snk_tmp, slot_id, slot_count);

            slv = 0;
            vis_slv = 0;
            slot_found = 0;
            // At this point, the src variable, extracted from the ID
            // ordering tables, denotes the local slave number at M(sink).
            // Here we map this to a system slave number.
            for(slv=0;slv<`AXI_NSP1;slv=slv+1) begin
              if(DEBUG==1) $display("%0t, vis_bus_this_m[%0d] %0b, vis_slv %0d, src %0d", $time, slv, vis_bus_this_m[slv], vis_slv, src);
              if(vis_bus_this_m[slv]) begin
                if((vis_slv==src) & (slot_found==0)) begin
                  src = slv;
                  slot_found = 1;
                end
                vis_slv = vis_slv+1;
              end
            end
            if(DEBUG==1) $display("%0t, vis_bus_this_m %0b", $time, vis_bus_this_m);
            if(DEBUG==1) $display("%0t, (VIS MAPPED) SRC %0d", $time, src);
          end //  if((idmst_snk_tmp == slot_id) ...

        end // for(slot=0; ...

      end // if((CH == 2) | (CH == 3)) begin


      //if(DEBUG==1) $display("%0t, CH = %0d", $time, CH);
      //if(DEBUG==1) $display("%0t, valid_bus[%0d] %0b, num_valids %0d", $time, snk, valid_bus[snk], num_valids);
      //if(DEBUG==1) $display("%0t, snk %0d, src %0d", $time, snk, src);
      //if(DEBUG==1) $display("%0t, bus_shrd_sink_src[%0d] %0b", $time, ((snk*NUM_SRC)+src), bus_shrd_sink_src[(snk*NUM_SRC)+src]);
      
      if(  valid_bus[snk] 
         & bus_shrd_sink_src[(snk*NUM_SRC)+src]
           // Turn off the check on the AW channel if there is a shared to
           // dedicated link  and the pipeline channel arbiter is enabled.
           // The implementation of the arbiter pipeline stage on this
           // channel breaks the key assumption of this checker that
           // 2 valids on a channel, which are both on shared master 
           // slave paths will never assert at the same time.
           // The hybrid arch on the AW channel can be fully checked
           // when this scenario does not exist.
         & ~((CH == 0) & aw_shrd_ddctd_lnk & `AXI_AW_PL_ARB)
        ) begin
         if(num_valids == 1) begin
           case(CH) 
             0 : $display("%0t, ERROR, AW channel, shared valid checker", $time);
             1 : $display("%0t, ERROR, W channel, shared valid checker", $time);
             2 : $display("%0t, ERROR, B channel, shared valid checker", $time);
             3 : $display("%0t, ERROR, AR channel, shared valid checker", $time);
             4 : $display("%0t, ERROR, R channel, shared valid checker", $time);
           endcase
           $display("%0t, ERROR, sink %0d valid asserted from src %0d"
                    ,$time, snk, src);
           $display("%0t, ERROR, while sink %0d valid from src %0d also asserted."
                    ,$time, snk_1, src_1);
           $display("%0t, ERROR, Both paths are on the shared layer, and should not",$time);
           $display("%0t,        be asserted in parallel.",$time);
           $display("%0t, ERROR, Note : all sources and sinks indexed 0 to X here.",$time);
           error1 = 1;
         end else begin
           snk_1 = snk;
           src_1 = src;
         end
         num_valids = num_valids + 1; 
       end 

    end // for(snk=0;...

  end // check_shared_PROC


  /*--------------------------------------------------------------------
   * Log non shared valids asserted while a valid on the shared valid is
   * asserted.
   */
  always @(posedge clk or negedge resetn) begin : log_parallel_PROC
    integer snk;
    integer src;
    integer idbit;

    integer snk_1;
    integer src_1;

    integer this_uida;
    integer this_log2_num_vis_sp;
    integer this_log2_count;

    integer slot;
    integer id_bit;
    integer slv_bit;
    integer count_bit;
    integer slv;
    integer vis_slv;

    reg [`AXI_MIDW-1:0] slot_id;
    reg [`AXI_LOG2_NSP1-1:0] slot_slv;
    reg [`AXI_LOG2_MAX_NUM_MST_SLVS-1:0] slot_count;

    reg [IDMST_SNK_W-1:0] idmst_snk_tmp;
    
    // Number of shared valids asserted in each cycle.
    integer num_valid;
    num_valid = 0;
    
    if(~resetn) begin
      mst_slv_parallel_acc_r <= 'b0;
    end else begin


      for(snk=0;snk<NUM_SNK;snk=snk+1) begin
        //if(DEBUG==1) $display("%0t, SINK %0d", $time, snk);
        //if(DEBUG==1) $display("%0t, valid_bus[%0d] %0b", $time, snk, valid_bus[snk]);
        // Get source number who is accessing the sink.
        for(idbit=0;idbit<IDMST_SNK_W;idbit=idbit+1) begin
          idmst_snk_tmp[idbit] = idmst_snk_bus[(snk*IDMST_SNK_W)+idbit];
        end

        // For the AR, AW and W channels, the source can be determined
        // from the ID alone. (Not necessarilyy in bi di mode, but this checker
        // is not used in bi-di mode).
        src = idmst_snk_tmp;
  
        if((CH == 2) | (CH == 4) & valid_bus[snk]) begin
          // On the R and B channels, have to search the ID ordering tables of 
          // the associated master port in order to find which slave the t/x 
          // has come from.
  
          // Select active ID bus of this master.
          act_ids_max = 'b0;
          case(snk) 
            0 : act_ids_max = act_ids_m1;
            1 : act_ids_max = act_ids_m2;
            2 : act_ids_max = act_ids_m3;
            3 : act_ids_max = act_ids_m4;
            4 : act_ids_max = act_ids_m5;
            5 : act_ids_max = act_ids_m6;
            6 : act_ids_max = act_ids_m7;
            7 : act_ids_max = act_ids_m8;
            8 : act_ids_max = act_ids_m9;
            9 : act_ids_max = act_ids_m10;
            10 : act_ids_max = act_ids_m11;
            11 : act_ids_max = act_ids_m12;
            12 : act_ids_max = act_ids_m13;
            13 : act_ids_max = act_ids_m14;
            14 : act_ids_max = act_ids_m15;
            15 : act_ids_max = act_ids_m16;
          endcase
  
          // Select active slave number bus of this master.
          act_snums_max = 'b0;
          case(snk) 
            0 : act_snums_max = act_snums_m1;
            1 : act_snums_max = act_snums_m2;
            2 : act_snums_max = act_snums_m3;
            3 : act_snums_max = act_snums_m4;
            4 : act_snums_max = act_snums_m5;
            5 : act_snums_max = act_snums_m6;
            6 : act_snums_max = act_snums_m7;
            7 : act_snums_max = act_snums_m8;
            8 : act_snums_max = act_snums_m9;
            9 : act_snums_max = act_snums_m10;
            10 : act_snums_max = act_snums_m11;
            11 : act_snums_max = act_snums_m12;
            12 : act_snums_max = act_snums_m13;
            13 : act_snums_max = act_snums_m14;
            14 : act_snums_max = act_snums_m15;
            15 : act_snums_max = act_snums_m16;
          endcase
  
          // Select active slave number bus of this master.
          act_counts_max = 'b0;
          case(snk) 
            0 : act_counts_max = act_counts_m1;
            1 : act_counts_max = act_counts_m2;
            2 : act_counts_max = act_counts_m3;
            3 : act_counts_max = act_counts_m4;
            4 : act_counts_max = act_counts_m5;
            5 : act_counts_max = act_counts_m6;
            6 : act_counts_max = act_counts_m7;
            7 : act_counts_max = act_counts_m8;
            8 : act_counts_max = act_counts_m9;
            9 : act_counts_max = act_counts_m10;
            10 : act_counts_max = act_counts_m11;
            11 : act_counts_max = act_counts_m12;
            12 : act_counts_max = act_counts_m13;
            13 : act_counts_max = act_counts_m14;
            14 : act_counts_max = act_counts_m15;
            15 : act_counts_max = act_counts_m16;
          endcase
  
          // Select number of unique ID's for this master.
          this_uida = 0;
          case(snk) 
            0 : this_uida = MAX_UIDA_M1;
            1 : this_uida = MAX_UIDA_M2;
            2 : this_uida = MAX_UIDA_M3;
            3 : this_uida = MAX_UIDA_M4;
            4 : this_uida = MAX_UIDA_M5;
            5 : this_uida = MAX_UIDA_M6;
            6 : this_uida = MAX_UIDA_M7;
            7 : this_uida = MAX_UIDA_M8;
            8 : this_uida = MAX_UIDA_M9;
            9 : this_uida = MAX_UIDA_M10;
            10 : this_uida = MAX_UIDA_M11;
            11 : this_uida = MAX_UIDA_M12;
            12 : this_uida = MAX_UIDA_M13;
            13 : this_uida = MAX_UIDA_M14;
            14 : this_uida = MAX_UIDA_M15;
            15 : this_uida = MAX_UIDA_M16;
          endcase
  
          // Select number of unique ID's for this master.
          this_log2_num_vis_sp = 0;
          case(snk) 
            0 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M1;
            1 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M2;
            2 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M3;
            3 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M4;
            4 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M5;
            5 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M6;
            6 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M7;
            7 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M8;
            8 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M9;
            9 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M10;
            10 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M11;
            11 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M12;
            12 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M13;
            13 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M14;
            14 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M15;
            15 : this_log2_num_vis_sp = `AXI_LOG2_NSP1V_M16;
          endcase
  
          // Select number active t/x's per unique ID for this master.
          this_log2_count = 0;
          case(snk) 
            0 : this_log2_count = L2_MAX_RCA_ID_P1_M1;
            1 : this_log2_count = L2_MAX_RCA_ID_P1_M2;
            2 : this_log2_count = L2_MAX_RCA_ID_P1_M3;
            3 : this_log2_count = L2_MAX_RCA_ID_P1_M4;
            4 : this_log2_count = L2_MAX_RCA_ID_P1_M5;
            5 : this_log2_count = L2_MAX_RCA_ID_P1_M6;
            6 : this_log2_count = L2_MAX_RCA_ID_P1_M7;
            7 : this_log2_count = L2_MAX_RCA_ID_P1_M8;
            8 : this_log2_count = L2_MAX_RCA_ID_P1_M9;
            9 : this_log2_count = L2_MAX_RCA_ID_P1_M10;
            10 : this_log2_count = L2_MAX_RCA_ID_P1_M11;
            11 : this_log2_count = L2_MAX_RCA_ID_P1_M12;
            12 : this_log2_count = L2_MAX_RCA_ID_P1_M13;
            13 : this_log2_count = L2_MAX_RCA_ID_P1_M14;
            14 : this_log2_count = L2_MAX_RCA_ID_P1_M15;
            15 : this_log2_count = L2_MAX_RCA_ID_P1_M16;
          endcase
  
          // Select visibility bus for this master.
          vis_bus_this_m = 'b0;
          case(snk) 
            0 : vis_bus_this_m = vis_bus_m1;
            1 : vis_bus_this_m = vis_bus_m2;
            2 : vis_bus_this_m = vis_bus_m3;
            3 : vis_bus_this_m = vis_bus_m4;
            4 : vis_bus_this_m = vis_bus_m5;
            5 : vis_bus_this_m = vis_bus_m6;
            6 : vis_bus_this_m = vis_bus_m7;
            7 : vis_bus_this_m = vis_bus_m8;
            8 : vis_bus_this_m = vis_bus_m9;
            9 : vis_bus_this_m = vis_bus_m10;
            10 : vis_bus_this_m = vis_bus_m11;
            11 : vis_bus_this_m = vis_bus_m12;
            12 : vis_bus_this_m = vis_bus_m13;
            13 : vis_bus_this_m = vis_bus_m14;
            14 : vis_bus_this_m = vis_bus_m15;
            15 : vis_bus_this_m = vis_bus_m16;
          endcase
  
          // Find which slave number the ID matches to.
          for(slot=0;slot<this_uida;slot=slot+1) begin
            //if(DEBUG==1) $display("%0t, slot %0d", $time, slot);
            
            // Extract slot ID.
            slot_id = 'b0;
            for(id_bit=0;id_bit<=(`AXI_MIDW-1);id_bit=id_bit+1) begin
              slot_id[id_bit] = act_ids_max[(slot*`AXI_MIDW)+id_bit];
            end
            //if(DEBUG==1) $display("%0t, slot_id %0h", $time, slot_id);
            
            // Extract slot slave.
            slot_slv = 'b0;
            for(slv_bit=0;slv_bit<=(this_log2_num_vis_sp-1);slv_bit=slv_bit+1) begin
              slot_slv[slv_bit] = act_snums_max[(slot*this_log2_num_vis_sp)+slv_bit];
              //if(DEBUG==1) $display("%0t, slot_slv[%0d] %0b", $time, slv_bit, slot_slv[slv_bit]);
              //if(DEBUG==1) $display("%0t, act_snums_max[%0d] %0b", $time, (slot*this_log2_num_vis_sp)+slv_bit, act_snums_max[(slot*this_log2_num_vis_sp)+slv_bit]);
            end
            //if(DEBUG==1) $display("%0t, slot_slv %0b", $time, slot_slv);
            //if(DEBUG==1) $display("%0t, act_snums_max %0b, this_log2_num_vis_sp %0d", $time, act_snums_max, this_log2_num_vis_sp);
            
            // Extract slot tx count.
            slot_count = {`AXI_LOG2_MAX_NUM_MST_SLVS{1'b0}};
            for(count_bit=0;count_bit<=(this_log2_count-1);count_bit=count_bit+1) begin
              slot_count[count_bit] = act_counts_max[(slot*this_log2_count)+count_bit];
            end
            //if(DEBUG==1) $display("%0t, this_log2_count %0d", $time, this_log2_count);
            //if(DEBUG==1) $display("%0t, act_counts_max %0b", $time, act_counts_max);
            //if(DEBUG==1) $display("%0t, slot_count %0b", $time, slot_count);
            //if(DEBUG==1) $display("%0t, idmst_snk_tmp %0b, slot_id %0b, slot_count %0b", $time, idmst_snk_tmp, slot_id, slot_count);
  
            if((idmst_snk_tmp == slot_id) & (slot_count != 'b0)) begin
              src = slot_slv;
              //if(DEBUG==1) $display("%0t, SRC %0d", $time, src);
              //if(DEBUG==1) $display("%0t, idmst_snk_tmp %0b, slot_id %0b, slot_count %0b", $time, idmst_snk_tmp, slot_id, slot_count);
  
              slv = 0;
              vis_slv = 0;
              // At this point, the src variable, extracted from the ID
              // ordering tables, denotes the local slave number at M(sink).
              // Here we map this to a system slave number.
              for(slv=0;slv<`AXI_NSP1;slv=slv+1) begin
                //if(DEBUG==1) $display("%0t, vis_bus_this_m[%0d] %0b, vis_slv %0d, src %0d", $time, slv, vis_bus_this_m[slv], vis_slv, src);
                if(vis_bus_this_m[slv]) begin
                  if(vis_slv==src) begin
                    src = slv;
                  end
                  vis_slv = vis_slv+1;
                end
              end
              //if(DEBUG==1) $display("%0t, vis_bus_this_m %0b", $time, vis_bus_this_m);
              //if(DEBUG==1) $display("%0t, (VIS MAPPED) SRC %0d", $time, src);
            end //  if((idmst_snk_tmp == slot_id) ...
  
          end // for(slot=0; ...
  
        end // if((CH == 2) | (CH == 3)) begin
  
  
        //if(DEBUG==1) $display("%0t, CH = %0d", $time, CH);
        //if(DEBUG==1) $display("%0t, valid_bus[%0d] %0b, num_valid %0d", $time, snk, valid_bus[snk], num_valid);
        //if(DEBUG==1) $display("%0t, snk %0d, src %0d", $time, snk, src);
        //if(DEBUG==1) $display("%0t, bus_shrd_sink_src[%0d] %0b", $time, ((snk*NUM_SRC)+src), bus_shrd_sink_src[(snk*NUM_SRC)+src]);
        

        /*--------------------------------------------------------------------
         * Log non shared valids asserted while a valid on the shared valid is
         * asserted.
         */
        if((num_valids>=1) & valid_bus[snk]) begin
          if(DEBUG==1) begin
            $display("%0t, num_valids %0d, valid_bus[%0d] %0b, bus_shrd_sink_src[%0d] %0b "
                     , $time, num_valids, snk, valid_bus[snk], (snk*NUM_SRC)+src, bus_shrd_sink_src[(snk*NUM_SRC)+src]);
          end
  
          if(~bus_shrd_sink_src[(snk*NUM_SRC)+src]) begin
            mst_slv_parallel_acc_r[(NUM_SRC*snk)+src] <= 1'b1;
          end
        end

      end // for(snk=0;...

    end 

  end // log_parallel_PROC



  /*--------------------------------------------------------------------
   * CHECK DEDICATED
   *
   * Previous code has generate flags for every source sink path that
   * has had parallel access with the shared layer.
   * Now, at the end of the sim, we generate an error for any dedicated
   * master slave path that has not had parallel access with the shared
   * layer. If this is the case path has not been implemented as 
   * dedicated.
   */
  always @ (*) begin : parallel_acc_error_report_PROC
    integer snk;
    integer src;
    reg error;
    reg [`AXI_MAX_NUM_USR_MSTS-1:0] vis_bus_tmp;

    integer parallel_acc_tmp;
    integer has_ddctd;
    integer num_vis;
    integer num_ddctd;
        
    if(report_parallel) begin
      error = 0;
      for(snk=0;snk<NUM_SNK;snk=snk+1) begin
  
        // Select the visibility parameters of whatever is a sink
        // on this channel.
        vis_bus_tmp = 'b0;
        if( (CH==0) | (CH==1) | (CH==3) ) begin
          // Select visibility bus for the sink port.
          case(snk) 
            0 : vis_bus_tmp = vis_bus_s0;
            1 : vis_bus_tmp = vis_bus_s1;
            2 : vis_bus_tmp = vis_bus_s2;
            3 : vis_bus_tmp = vis_bus_s3;
            4 : vis_bus_tmp = vis_bus_s4;
            5 : vis_bus_tmp = vis_bus_s5;
            6 : vis_bus_tmp = vis_bus_s6;
            7 : vis_bus_tmp = vis_bus_s7;
            8 : vis_bus_tmp = vis_bus_s8;
            9 : vis_bus_tmp = vis_bus_s9;
            10 : vis_bus_tmp = vis_bus_s10;
            11 : vis_bus_tmp = vis_bus_s11;
            12 : vis_bus_tmp = vis_bus_s12;
            13 : vis_bus_tmp = vis_bus_s13;
            14 : vis_bus_tmp = vis_bus_s14;
            15 : vis_bus_tmp = vis_bus_s15;
            16 : vis_bus_tmp = vis_bus_s16;
          endcase
        end else begin
          // Select visibility bus for the sink port.
          case(snk) 
            0 : vis_bus_tmp = vis_bus_m1;
            1 : vis_bus_tmp = vis_bus_m2;
            2 : vis_bus_tmp = vis_bus_m3;
            3 : vis_bus_tmp = vis_bus_m4;
            4 : vis_bus_tmp = vis_bus_m5;
            5 : vis_bus_tmp = vis_bus_m6;
            6 : vis_bus_tmp = vis_bus_m7;
            7 : vis_bus_tmp = vis_bus_m8;
            8 : vis_bus_tmp = vis_bus_m9;
            9 : vis_bus_tmp = vis_bus_m10;
            10 : vis_bus_tmp = vis_bus_m11;
            11 : vis_bus_tmp = vis_bus_m12;
            12 : vis_bus_tmp = vis_bus_m13;
            13 : vis_bus_tmp = vis_bus_m14;
            14 : vis_bus_tmp = vis_bus_m15;
            15 : vis_bus_tmp = vis_bus_m16;
          endcase
        end
  
        // Flag an error for any sink that has a dedicated layer, that has
        // not had a valid asserted in parallel with a shared layer valid.
        parallel_acc_tmp = 0;
        has_ddctd = 0;
        num_vis = 0;
        num_ddctd = 0;
        for(src=0;src<NUM_SRC;src=src+1) begin
          if(mst_slv_parallel_acc_r[(NUM_SRC*snk)+src]) parallel_acc_tmp = 1;
          if(~bus_shrd_sink_src[(NUM_SRC*snk)+src] & vis_bus_tmp[src]) begin
            has_ddctd = 1;
            num_ddctd = num_ddctd + 1;
          end
          if(vis_bus_tmp[src]) num_vis = num_vis + 1;
          if(DEBUG==1) begin
            $display("%0t, snk %0d, src %0d", $time, snk, src);
            $display("%0t, mst_slv_parallel_acc_r[%0d] %0b"
                    , $time, (NUM_SRC*snk)+src, mst_slv_parallel_acc_r[(NUM_SRC*snk)+src]);
            $display("%0t, bus_shrd_sink_src[%0d] %0b"
                    , $time, (NUM_SRC*snk)+src, bus_shrd_sink_src[(NUM_SRC*snk)+src]);
            $display("%0t, vis_bus_tmp[%0d] %0b", $time, src, vis_bus_tmp[src]);
          end
        end

        if(  has_ddctd & ~parallel_acc_tmp
             // Turn off the check on the AW channel if there is a shared to
             // dedicated link  and the pipeline channel arbiter is enabled.
             // The implementation of the arbiter pipeline stage on this
             // channel breaks the key assumption of this checker that
             // 2 valids on a channel, which are both on shared master 
             // slave paths will never assert at the same time.
             // The hybrid arch on the AW channel can be fully checked
             // when this scenario does not exist.
           & ~((CH == 0) & aw_shrd_ddctd_lnk & `AXI_AW_PL_ARB)
             // Don't perform dedicated layer parallel access check
             // if number of sources visible to a sink is less than
             // this number. Likelyhood of hitting pass condition
             // is too low.
           & (num_vis >= `VIS_CHECK_LIMIT)
             // Don't perform dedicated layer parallel access check
             // if number of dedicated sources visible to a sink is less than
             // this number. Likelyhood of hitting pass condition
             // is too low.
           & (num_ddctd >= `NUM_DDCTD_CHECK_LIMIT)
             // Don't perform dedicated layer parallel access check
             // if number of sinks on shared layer is less than
             // this number. Likelyhood of hitting pass condition
             // is too low.
           & (NUM_SNK_SHRD >= `NUM_SNK_SHRD_CHECK_LIMIT)
          )
         begin
           error = 1;
           case(CH) 
             0 : $display("%0t, ERROR, AW channel, dedicated parallel access checker", $time);
             1 : $display("%0t, ERROR, W channel, dedicated parallel access checker", $time);
             2 : $display("%0t, ERROR, B channel, dedicated parallel access checker", $time);
             3 : $display("%0t, ERROR, AR channel, dedicated parallel access checker", $time);
             4 : $display("%0t, ERROR, R channel, dedicated parallel access checker", $time);
           endcase
           $display("%0t, ERROR, sink %0d has a dedicated layer, but has never" ,$time, snk);
           $display("%0t, ERROR, had a valid asserted while a valid on the shared",$time);
           $display("%0t, ERROR, layer was asserted at the same time.",$time);
         end

      end // for(snk=0;snk<NUM_SNK;snk=snk+1) begin

      if(error==0) begin
        case(CH) 
          0 : $display("%0t, AW channel, dedicated parallel access checker passed.", $time);
          1 : $display("%0t, W channel, dedicated parallel access checker passed.", $time);
          2 : $display("%0t, B channel, dedicated parallel access checker passed.", $time);
          3 : $display("%0t, AR channel, dedicated parallel access checker passed.", $time);
          4 : $display("%0t, R channel, dedicated parallel access checker passed.", $time);
         endcase
      end

    end // if(report...
  end // parallel_acc_error_report_PROC


endmodule

