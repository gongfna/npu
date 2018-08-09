/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2006-2011 SYNOPSYS, INC.
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
** File     : tb_dcdr.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : Decoder for VTE DW_axi testbench.
**
** ---------------------------------------------------------------------
*/

`include "DW_axi_cc_constants.v"
`include "DW_axi_constants.v"

module tb_dcdr (
  // Inputs.
  addr_i,
`ifdef AXI_REMAP
  remap_n_i,
`endif
  
  // Outputs.
  local_slv_o,
  sys_slv_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter NUM_VIS_SP = 16; // Number of slave ports visible from the
                             // master port where this block is 
			     // instantiated.

  parameter LOG2_NUM_VIS_SP = 4; // Log 2 of NUM_VIS_SP.
			     
  parameter S0_N_VIS = 1; // Slave 0 to 16 normal address mode 
  parameter S1_N_VIS = 1; // visibility parameters.
  parameter S2_N_VIS = 1; 
  parameter S3_N_VIS = 1; 
  parameter S4_N_VIS = 1; 
  parameter S5_N_VIS = 1; 
  parameter S6_N_VIS = 1; 
  parameter S7_N_VIS = 1; 
  parameter S8_N_VIS = 1; 
  parameter S9_N_VIS = 1; 
  parameter S10_N_VIS = 1; 
  parameter S11_N_VIS = 1; 
  parameter S12_N_VIS = 1; 
  parameter S13_N_VIS = 1; 
  parameter S14_N_VIS = 1; 
  parameter S15_N_VIS = 1; 
  parameter S16_N_VIS = 1; 

  parameter S0_B_VIS = 1; // Slave 0 to 16 boot address mode 
  parameter S1_B_VIS = 1; // visibility parameters.
  parameter S2_B_VIS = 1; 
  parameter S3_B_VIS = 1; 
  parameter S4_B_VIS = 1; 
  parameter S5_B_VIS = 1; 
  parameter S6_B_VIS = 1; 
  parameter S7_B_VIS = 1; 
  parameter S8_B_VIS = 1; 
  parameter S9_B_VIS = 1; 
  parameter S10_B_VIS = 1; 
  parameter S11_B_VIS = 1; 
  parameter S12_B_VIS = 1; 
  parameter S13_B_VIS = 1; 
  parameter S14_B_VIS = 1; 
  parameter S15_B_VIS = 1; 
  parameter S16_B_VIS = 1; 


//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------

  // Slave visibility macros. Derived from normal and boot mode 
  // slave visibility parameters. A slave is visible if it is visible
  // in either normal or boot mode.
  `define P0_VIS  ( S0_N_VIS ||  S0_B_VIS)
  `define P1_VIS  ( S1_N_VIS ||  S1_B_VIS)
  `define P2_VIS  ( S2_N_VIS ||  S2_B_VIS)
  `define P3_VIS  ( S3_N_VIS ||  S3_B_VIS)
  `define P4_VIS  ( S4_N_VIS ||  S4_B_VIS)
  `define P5_VIS  ( S5_N_VIS ||  S5_B_VIS)
  `define P6_VIS  ( S6_N_VIS ||  S6_B_VIS)
  `define P7_VIS  ( S7_N_VIS ||  S7_B_VIS)
  `define P8_VIS  ( S8_N_VIS ||  S8_B_VIS)
  `define P9_VIS  ( S9_N_VIS ||  S9_B_VIS)
  `define P10_VIS (S10_N_VIS || S10_B_VIS)
  `define P11_VIS (S11_N_VIS || S11_B_VIS)
  `define P12_VIS (S12_N_VIS || S12_B_VIS)
  `define P13_VIS (S13_N_VIS || S13_B_VIS)
  `define P14_VIS (S14_N_VIS || S14_B_VIS)
  `define P15_VIS (S15_N_VIS || S15_B_VIS)
  `define P16_VIS (S16_N_VIS || S16_B_VIS)


//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// INPUTS
//----------------------------------------------------------------------
  input [`AXI_AW-1:0] addr_i;    // Address from master.

`ifdef AXI_REMAP
  input               remap_n_i; // Address remap input pin. 
                                 // When remap_n is asserted the decoder
				 // will operate with the boot mode
				 // address map.
`endif

//----------------------------------------------------------------------
// OUTPUTS
//----------------------------------------------------------------------
  output [LOG2_NUM_VIS_SP-1:0] local_slv_o; // Decoded local slave 
                                           // number.

  output [`AXI_LOG2_NSP1-1:0] sys_slv_o;   // Decoded system slave 
  reg    [`AXI_LOG2_NSP1-1:0] sys_slv_o;   // number.

  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------

  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  
  wire dcd_slv_norm_1; // Decode signals for slaves 1 to 16 in normal 
  wire dcd_slv_norm_2; // address mode.
  wire dcd_slv_norm_3;
  wire dcd_slv_norm_4;
  wire dcd_slv_norm_5;
  wire dcd_slv_norm_6;
  wire dcd_slv_norm_7;
  wire dcd_slv_norm_8;
  wire dcd_slv_norm_9;
  wire dcd_slv_norm_10;
  wire dcd_slv_norm_11;
  wire dcd_slv_norm_12;
  wire dcd_slv_norm_13;
  wire dcd_slv_norm_14;
  wire dcd_slv_norm_15;
  wire dcd_slv_norm_16;

`ifdef AXI_REMAP
  wire dcd_slv_boot_1; // Decode signals for slaves 1 to 16 in boot 
  wire dcd_slv_boot_2; // address mode.
  wire dcd_slv_boot_3;
  wire dcd_slv_boot_4;
  wire dcd_slv_boot_5;
  wire dcd_slv_boot_6;
  wire dcd_slv_boot_7;
  wire dcd_slv_boot_8;
  wire dcd_slv_boot_9;
  wire dcd_slv_boot_10;
  wire dcd_slv_boot_11;
  wire dcd_slv_boot_12;
  wire dcd_slv_boot_13;
  wire dcd_slv_boot_14;
  wire dcd_slv_boot_15;
  wire dcd_slv_boot_16;
`endif

  
  // Concatenation of all normal mode slave decode signals.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_dcd_slv_norm;

`ifdef AXI_REMAP
  // Concatenation of all boot mode slave decode signals.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_dcd_slv_boot;
`endif

  // Result of muxing between normal and boot mode slave decode
  // signals.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_dcd_slv_mux;



  // Generate the normal address mode slave decode signals.

  assign dcd_slv_norm_1 = 
         (    ((addr_i>=`AXI_R1_NSA_S1) && (addr_i<=`AXI_R1_NEA_S1))

	   || ((addr_i>=`AXI_R2_NSA_S1) && (addr_i<=`AXI_R2_NEA_S1) 
	       && (`AXI_NUM_RN_S1>=2))

	   || ((addr_i>=`AXI_R3_NSA_S1) && (addr_i<=`AXI_R3_NEA_S1) 
	       && (`AXI_NUM_RN_S1>=3))

	   || ((addr_i>=`AXI_R4_NSA_S1) && (addr_i<=`AXI_R4_NEA_S1) 
	       && (`AXI_NUM_RN_S1>=4))

	   || ((addr_i>=`AXI_R5_NSA_S1) && (addr_i<=`AXI_R5_NEA_S1) 
	       && (`AXI_NUM_RN_S1>=5))

	   || ((addr_i>=`AXI_R6_NSA_S1) && (addr_i<=`AXI_R6_NEA_S1) 
	       && (`AXI_NUM_RN_S1>=6))

	   || ((addr_i>=`AXI_R7_NSA_S1) && (addr_i<=`AXI_R7_NEA_S1) 
	       && (`AXI_NUM_RN_S1>=7))

	   || ((addr_i>=`AXI_R8_NSA_S1) && (addr_i<=`AXI_R8_NEA_S1) 
	       && (`AXI_NUM_RN_S1>=8))

	 ) && S1_N_VIS;

  assign dcd_slv_norm_2 = 
         (    ((addr_i>=`AXI_R1_NSA_S2) && (addr_i<=`AXI_R1_NEA_S2))

	   || ((addr_i>=`AXI_R2_NSA_S2) && (addr_i<=`AXI_R2_NEA_S2) 
	       && (`AXI_NUM_RN_S2>=2))

	   || ((addr_i>=`AXI_R3_NSA_S2) && (addr_i<=`AXI_R3_NEA_S2) 
	       && (`AXI_NUM_RN_S2>=3))

	   || ((addr_i>=`AXI_R4_NSA_S2) && (addr_i<=`AXI_R4_NEA_S2) 
	       && (`AXI_NUM_RN_S2>=4))

	   || ((addr_i>=`AXI_R5_NSA_S2) && (addr_i<=`AXI_R5_NEA_S2) 
	       && (`AXI_NUM_RN_S2>=5))

	   || ((addr_i>=`AXI_R6_NSA_S2) && (addr_i<=`AXI_R6_NEA_S2) 
	       && (`AXI_NUM_RN_S2>=6))

	   || ((addr_i>=`AXI_R7_NSA_S2) && (addr_i<=`AXI_R7_NEA_S2) 
	       && (`AXI_NUM_RN_S2>=7))

	   || ((addr_i>=`AXI_R8_NSA_S2) && (addr_i<=`AXI_R8_NEA_S2) 
	       && (`AXI_NUM_RN_S2>=8))

	 ) && S2_N_VIS;

  assign dcd_slv_norm_3 = 
         (    ((addr_i>=`AXI_R1_NSA_S3) && (addr_i<=`AXI_R1_NEA_S3))

	   || ((addr_i>=`AXI_R2_NSA_S3) && (addr_i<=`AXI_R2_NEA_S3) 
	       && (`AXI_NUM_RN_S3>=2))

	   || ((addr_i>=`AXI_R3_NSA_S3) && (addr_i<=`AXI_R3_NEA_S3) 
	       && (`AXI_NUM_RN_S3>=3))

	   || ((addr_i>=`AXI_R4_NSA_S3) && (addr_i<=`AXI_R4_NEA_S3) 
	       && (`AXI_NUM_RN_S3>=4))

	   || ((addr_i>=`AXI_R5_NSA_S3) && (addr_i<=`AXI_R5_NEA_S3) 
	       && (`AXI_NUM_RN_S3>=5))

	   || ((addr_i>=`AXI_R6_NSA_S3) && (addr_i<=`AXI_R6_NEA_S3) 
	       && (`AXI_NUM_RN_S3>=6))

	   || ((addr_i>=`AXI_R7_NSA_S3) && (addr_i<=`AXI_R7_NEA_S3) 
	       && (`AXI_NUM_RN_S3>=7))

	   || ((addr_i>=`AXI_R8_NSA_S3) && (addr_i<=`AXI_R8_NEA_S3) 
	       && (`AXI_NUM_RN_S3>=8))

	 ) && S3_N_VIS;

  assign dcd_slv_norm_4 = 
         (    ((addr_i>=`AXI_R1_NSA_S4) && (addr_i<=`AXI_R1_NEA_S4))

	   || ((addr_i>=`AXI_R2_NSA_S4) && (addr_i<=`AXI_R2_NEA_S4) 
	       && (`AXI_NUM_RN_S4>=2))

	   || ((addr_i>=`AXI_R3_NSA_S4) && (addr_i<=`AXI_R3_NEA_S4) 
	       && (`AXI_NUM_RN_S4>=3))

	   || ((addr_i>=`AXI_R4_NSA_S4) && (addr_i<=`AXI_R4_NEA_S4) 
	       && (`AXI_NUM_RN_S4>=4))

	   || ((addr_i>=`AXI_R5_NSA_S4) && (addr_i<=`AXI_R5_NEA_S4) 
	       && (`AXI_NUM_RN_S4>=5))

	   || ((addr_i>=`AXI_R6_NSA_S4) && (addr_i<=`AXI_R6_NEA_S4) 
	       && (`AXI_NUM_RN_S4>=6))

	   || ((addr_i>=`AXI_R7_NSA_S4) && (addr_i<=`AXI_R7_NEA_S4) 
	       && (`AXI_NUM_RN_S4>=7))

	   || ((addr_i>=`AXI_R8_NSA_S4) && (addr_i<=`AXI_R8_NEA_S4) 
	       && (`AXI_NUM_RN_S4>=8))

	 ) && S4_N_VIS;

  assign dcd_slv_norm_5 = 
         (    ((addr_i>=`AXI_R1_NSA_S5) && (addr_i<=`AXI_R1_NEA_S5))

	   || ((addr_i>=`AXI_R2_NSA_S5) && (addr_i<=`AXI_R2_NEA_S5) 
	       && (`AXI_NUM_RN_S5>=2))

	   || ((addr_i>=`AXI_R3_NSA_S5) && (addr_i<=`AXI_R3_NEA_S5) 
	       && (`AXI_NUM_RN_S5>=3))

	   || ((addr_i>=`AXI_R4_NSA_S5) && (addr_i<=`AXI_R4_NEA_S5) 
	       && (`AXI_NUM_RN_S5>=4))

	   || ((addr_i>=`AXI_R5_NSA_S5) && (addr_i<=`AXI_R5_NEA_S5) 
	       && (`AXI_NUM_RN_S5>=5))

	   || ((addr_i>=`AXI_R6_NSA_S5) && (addr_i<=`AXI_R6_NEA_S5) 
	       && (`AXI_NUM_RN_S5>=6))

	   || ((addr_i>=`AXI_R7_NSA_S5) && (addr_i<=`AXI_R7_NEA_S5) 
	       && (`AXI_NUM_RN_S5>=7))

	   || ((addr_i>=`AXI_R8_NSA_S5) && (addr_i<=`AXI_R8_NEA_S5) 
	       && (`AXI_NUM_RN_S5>=8))

	 ) && S5_N_VIS;

  assign dcd_slv_norm_6 = 
         (    ((addr_i>=`AXI_R1_NSA_S6) && (addr_i<=`AXI_R1_NEA_S6))

	   || ((addr_i>=`AXI_R2_NSA_S6) && (addr_i<=`AXI_R2_NEA_S6) 
	       && (`AXI_NUM_RN_S6>=2))

	   || ((addr_i>=`AXI_R3_NSA_S6) && (addr_i<=`AXI_R3_NEA_S6) 
	       && (`AXI_NUM_RN_S6>=3))

	   || ((addr_i>=`AXI_R4_NSA_S6) && (addr_i<=`AXI_R4_NEA_S6) 
	       && (`AXI_NUM_RN_S6>=4))

	   || ((addr_i>=`AXI_R5_NSA_S6) && (addr_i<=`AXI_R5_NEA_S6) 
	       && (`AXI_NUM_RN_S6>=5))

	   || ((addr_i>=`AXI_R6_NSA_S6) && (addr_i<=`AXI_R6_NEA_S6) 
	       && (`AXI_NUM_RN_S6>=6))

	   || ((addr_i>=`AXI_R7_NSA_S6) && (addr_i<=`AXI_R7_NEA_S6) 
	       && (`AXI_NUM_RN_S6>=7))

	   || ((addr_i>=`AXI_R8_NSA_S6) && (addr_i<=`AXI_R8_NEA_S6) 
	       && (`AXI_NUM_RN_S6>=8))

	 ) && S6_N_VIS;

  assign dcd_slv_norm_7 = 
         (    ((addr_i>=`AXI_R1_NSA_S7) && (addr_i<=`AXI_R1_NEA_S7))

	   || ((addr_i>=`AXI_R2_NSA_S7) && (addr_i<=`AXI_R2_NEA_S7) 
	       && (`AXI_NUM_RN_S7>=2))

	   || ((addr_i>=`AXI_R3_NSA_S7) && (addr_i<=`AXI_R3_NEA_S7) 
	       && (`AXI_NUM_RN_S7>=3))

	   || ((addr_i>=`AXI_R4_NSA_S7) && (addr_i<=`AXI_R4_NEA_S7) 
	       && (`AXI_NUM_RN_S7>=4))

	   || ((addr_i>=`AXI_R5_NSA_S7) && (addr_i<=`AXI_R5_NEA_S7) 
	       && (`AXI_NUM_RN_S7>=5))

	   || ((addr_i>=`AXI_R6_NSA_S7) && (addr_i<=`AXI_R6_NEA_S7) 
	       && (`AXI_NUM_RN_S7>=6))

	   || ((addr_i>=`AXI_R7_NSA_S7) && (addr_i<=`AXI_R7_NEA_S7) 
	       && (`AXI_NUM_RN_S7>=7))

	   || ((addr_i>=`AXI_R8_NSA_S7) && (addr_i<=`AXI_R8_NEA_S7) 
	       && (`AXI_NUM_RN_S7>=8))

	 ) && S7_N_VIS;

  assign dcd_slv_norm_8 = 
         (    ((addr_i>=`AXI_R1_NSA_S8) && (addr_i<=`AXI_R1_NEA_S8))

	   || ((addr_i>=`AXI_R2_NSA_S8) && (addr_i<=`AXI_R2_NEA_S8) 
	       && (`AXI_NUM_RN_S8>=2))

	   || ((addr_i>=`AXI_R3_NSA_S8) && (addr_i<=`AXI_R3_NEA_S8) 
	       && (`AXI_NUM_RN_S8>=3))

	   || ((addr_i>=`AXI_R4_NSA_S8) && (addr_i<=`AXI_R4_NEA_S8) 
	       && (`AXI_NUM_RN_S8>=4))

	   || ((addr_i>=`AXI_R5_NSA_S8) && (addr_i<=`AXI_R5_NEA_S8) 
	       && (`AXI_NUM_RN_S8>=5))

	   || ((addr_i>=`AXI_R6_NSA_S8) && (addr_i<=`AXI_R6_NEA_S8) 
	       && (`AXI_NUM_RN_S8>=6))

	   || ((addr_i>=`AXI_R7_NSA_S8) && (addr_i<=`AXI_R7_NEA_S8) 
	       && (`AXI_NUM_RN_S8>=7))

	   || ((addr_i>=`AXI_R8_NSA_S8) && (addr_i<=`AXI_R8_NEA_S8) 
	       && (`AXI_NUM_RN_S8>=8))

	 ) && S8_N_VIS;

  assign dcd_slv_norm_9 = 
         (    ((addr_i>=`AXI_R1_NSA_S9) && (addr_i<=`AXI_R1_NEA_S9))

	   || ((addr_i>=`AXI_R2_NSA_S9) && (addr_i<=`AXI_R2_NEA_S9) 
	       && (`AXI_NUM_RN_S9>=2))

	   || ((addr_i>=`AXI_R3_NSA_S9) && (addr_i<=`AXI_R3_NEA_S9) 
	       && (`AXI_NUM_RN_S9>=3))

	   || ((addr_i>=`AXI_R4_NSA_S9) && (addr_i<=`AXI_R4_NEA_S9) 
	       && (`AXI_NUM_RN_S9>=4))

	   || ((addr_i>=`AXI_R5_NSA_S9) && (addr_i<=`AXI_R5_NEA_S9) 
	       && (`AXI_NUM_RN_S9>=5))

	   || ((addr_i>=`AXI_R6_NSA_S9) && (addr_i<=`AXI_R6_NEA_S9) 
	       && (`AXI_NUM_RN_S9>=6))

	   || ((addr_i>=`AXI_R7_NSA_S9) && (addr_i<=`AXI_R7_NEA_S9) 
	       && (`AXI_NUM_RN_S9>=7))

	   || ((addr_i>=`AXI_R8_NSA_S9) && (addr_i<=`AXI_R8_NEA_S9) 
	       && (`AXI_NUM_RN_S9>=8))

	 ) && S9_N_VIS;

  assign dcd_slv_norm_10 = 
         (    ((addr_i>=`AXI_R1_NSA_S10) && (addr_i<=`AXI_R1_NEA_S10))

	   || ((addr_i>=`AXI_R2_NSA_S10) && (addr_i<=`AXI_R2_NEA_S10) 
	       && (`AXI_NUM_RN_S10>=2))

	   || ((addr_i>=`AXI_R3_NSA_S10) && (addr_i<=`AXI_R3_NEA_S10) 
	       && (`AXI_NUM_RN_S10>=3))

	   || ((addr_i>=`AXI_R4_NSA_S10) && (addr_i<=`AXI_R4_NEA_S10) 
	       && (`AXI_NUM_RN_S10>=4))

	   || ((addr_i>=`AXI_R5_NSA_S10) && (addr_i<=`AXI_R5_NEA_S10) 
	       && (`AXI_NUM_RN_S10>=5))

	   || ((addr_i>=`AXI_R6_NSA_S10) && (addr_i<=`AXI_R6_NEA_S10) 
	       && (`AXI_NUM_RN_S10>=6))

	   || ((addr_i>=`AXI_R7_NSA_S10) && (addr_i<=`AXI_R7_NEA_S10) 
	       && (`AXI_NUM_RN_S10>=7))

	   || ((addr_i>=`AXI_R8_NSA_S10) && (addr_i<=`AXI_R8_NEA_S10) 
	       && (`AXI_NUM_RN_S10>=8))

	 ) && S10_N_VIS;

  assign dcd_slv_norm_11 = 
         (    ((addr_i>=`AXI_R1_NSA_S11) && (addr_i<=`AXI_R1_NEA_S11))

	   || ((addr_i>=`AXI_R2_NSA_S11) && (addr_i<=`AXI_R2_NEA_S11) 
	       && (`AXI_NUM_RN_S11>=2))

	   || ((addr_i>=`AXI_R3_NSA_S11) && (addr_i<=`AXI_R3_NEA_S11) 
	       && (`AXI_NUM_RN_S11>=3))

	   || ((addr_i>=`AXI_R4_NSA_S11) && (addr_i<=`AXI_R4_NEA_S11) 
	       && (`AXI_NUM_RN_S11>=4))

	   || ((addr_i>=`AXI_R5_NSA_S11) && (addr_i<=`AXI_R5_NEA_S11) 
	       && (`AXI_NUM_RN_S11>=5))

	   || ((addr_i>=`AXI_R6_NSA_S11) && (addr_i<=`AXI_R6_NEA_S11) 
	       && (`AXI_NUM_RN_S11>=6))

	   || ((addr_i>=`AXI_R7_NSA_S11) && (addr_i<=`AXI_R7_NEA_S11) 
	       && (`AXI_NUM_RN_S11>=7))

	   || ((addr_i>=`AXI_R8_NSA_S11) && (addr_i<=`AXI_R8_NEA_S11) 
	       && (`AXI_NUM_RN_S11>=8))

	 ) && S11_N_VIS;

  assign dcd_slv_norm_12 = 
         (    ((addr_i>=`AXI_R1_NSA_S12) && (addr_i<=`AXI_R1_NEA_S12))

	   || ((addr_i>=`AXI_R2_NSA_S12) && (addr_i<=`AXI_R2_NEA_S12) 
	       && (`AXI_NUM_RN_S12>=2))

	   || ((addr_i>=`AXI_R3_NSA_S12) && (addr_i<=`AXI_R3_NEA_S12) 
	       && (`AXI_NUM_RN_S12>=3))

	   || ((addr_i>=`AXI_R4_NSA_S12) && (addr_i<=`AXI_R4_NEA_S12) 
	       && (`AXI_NUM_RN_S12>=4))

	   || ((addr_i>=`AXI_R5_NSA_S12) && (addr_i<=`AXI_R5_NEA_S12) 
	       && (`AXI_NUM_RN_S12>=5))

	   || ((addr_i>=`AXI_R6_NSA_S12) && (addr_i<=`AXI_R6_NEA_S12) 
	       && (`AXI_NUM_RN_S12>=6))

	   || ((addr_i>=`AXI_R7_NSA_S12) && (addr_i<=`AXI_R7_NEA_S12) 
	       && (`AXI_NUM_RN_S12>=7))

	   || ((addr_i>=`AXI_R8_NSA_S12) && (addr_i<=`AXI_R8_NEA_S12) 
	       && (`AXI_NUM_RN_S12>=8))

	 ) && S12_N_VIS;

  assign dcd_slv_norm_13 = 
         (    ((addr_i>=`AXI_R1_NSA_S13) && (addr_i<=`AXI_R1_NEA_S13))

	   || ((addr_i>=`AXI_R2_NSA_S13) && (addr_i<=`AXI_R2_NEA_S13) 
	       && (`AXI_NUM_RN_S13>=2))

	   || ((addr_i>=`AXI_R3_NSA_S13) && (addr_i<=`AXI_R3_NEA_S13) 
	       && (`AXI_NUM_RN_S13>=3))

	   || ((addr_i>=`AXI_R4_NSA_S13) && (addr_i<=`AXI_R4_NEA_S13) 
	       && (`AXI_NUM_RN_S13>=4))

	   || ((addr_i>=`AXI_R5_NSA_S13) && (addr_i<=`AXI_R5_NEA_S13) 
	       && (`AXI_NUM_RN_S13>=5))

	   || ((addr_i>=`AXI_R6_NSA_S13) && (addr_i<=`AXI_R6_NEA_S13) 
	       && (`AXI_NUM_RN_S13>=6))

	   || ((addr_i>=`AXI_R7_NSA_S13) && (addr_i<=`AXI_R7_NEA_S13) 
	       && (`AXI_NUM_RN_S13>=7))

	   || ((addr_i>=`AXI_R8_NSA_S13) && (addr_i<=`AXI_R8_NEA_S13) 
	       && (`AXI_NUM_RN_S13>=8))

	 ) && S13_N_VIS;

  assign dcd_slv_norm_14 = 
         (    ((addr_i>=`AXI_R1_NSA_S14) && (addr_i<=`AXI_R1_NEA_S14))

	   || ((addr_i>=`AXI_R2_NSA_S14) && (addr_i<=`AXI_R2_NEA_S14) 
	       && (`AXI_NUM_RN_S14>=2))

	   || ((addr_i>=`AXI_R3_NSA_S14) && (addr_i<=`AXI_R3_NEA_S14) 
	       && (`AXI_NUM_RN_S14>=3))

	   || ((addr_i>=`AXI_R4_NSA_S14) && (addr_i<=`AXI_R4_NEA_S14) 
	       && (`AXI_NUM_RN_S14>=4))

	   || ((addr_i>=`AXI_R5_NSA_S14) && (addr_i<=`AXI_R5_NEA_S14) 
	       && (`AXI_NUM_RN_S14>=5))

	   || ((addr_i>=`AXI_R6_NSA_S14) && (addr_i<=`AXI_R6_NEA_S14) 
	       && (`AXI_NUM_RN_S14>=6))

	   || ((addr_i>=`AXI_R7_NSA_S14) && (addr_i<=`AXI_R7_NEA_S14) 
	       && (`AXI_NUM_RN_S14>=7))

	   || ((addr_i>=`AXI_R8_NSA_S14) && (addr_i<=`AXI_R8_NEA_S14) 
	       && (`AXI_NUM_RN_S14>=8))

	 ) && S14_N_VIS;

  assign dcd_slv_norm_15 = 
         (    ((addr_i>=`AXI_R1_NSA_S15) && (addr_i<=`AXI_R1_NEA_S15))

	   || ((addr_i>=`AXI_R2_NSA_S15) && (addr_i<=`AXI_R2_NEA_S15) 
	       && (`AXI_NUM_RN_S15>=2))

	   || ((addr_i>=`AXI_R3_NSA_S15) && (addr_i<=`AXI_R3_NEA_S15) 
	       && (`AXI_NUM_RN_S15>=3))

	   || ((addr_i>=`AXI_R4_NSA_S15) && (addr_i<=`AXI_R4_NEA_S15) 
	       && (`AXI_NUM_RN_S15>=4))

	   || ((addr_i>=`AXI_R5_NSA_S15) && (addr_i<=`AXI_R5_NEA_S15) 
	       && (`AXI_NUM_RN_S15>=5))

	   || ((addr_i>=`AXI_R6_NSA_S15) && (addr_i<=`AXI_R6_NEA_S15) 
	       && (`AXI_NUM_RN_S15>=6))

	   || ((addr_i>=`AXI_R7_NSA_S15) && (addr_i<=`AXI_R7_NEA_S15) 
	       && (`AXI_NUM_RN_S15>=7))

	   || ((addr_i>=`AXI_R8_NSA_S15) && (addr_i<=`AXI_R8_NEA_S15) 
	       && (`AXI_NUM_RN_S15>=8))

	 ) && S15_N_VIS;

  assign dcd_slv_norm_16 = 
         (    ((addr_i>=`AXI_R1_NSA_S16) && (addr_i<=`AXI_R1_NEA_S16))

	   || ((addr_i>=`AXI_R2_NSA_S16) && (addr_i<=`AXI_R2_NEA_S16) 
	       && (`AXI_NUM_RN_S16>=2))

	   || ((addr_i>=`AXI_R3_NSA_S16) && (addr_i<=`AXI_R3_NEA_S16) 
	       && (`AXI_NUM_RN_S16>=3))

	   || ((addr_i>=`AXI_R4_NSA_S16) && (addr_i<=`AXI_R4_NEA_S16) 
	       && (`AXI_NUM_RN_S16>=4))

	   || ((addr_i>=`AXI_R5_NSA_S16) && (addr_i<=`AXI_R5_NEA_S16) 
	       && (`AXI_NUM_RN_S16>=5))

	   || ((addr_i>=`AXI_R6_NSA_S16) && (addr_i<=`AXI_R6_NEA_S16) 
	       && (`AXI_NUM_RN_S16>=6))

	   || ((addr_i>=`AXI_R7_NSA_S16) && (addr_i<=`AXI_R7_NEA_S16) 
	       && (`AXI_NUM_RN_S16>=7))

	   || ((addr_i>=`AXI_R8_NSA_S16) && (addr_i<=`AXI_R8_NEA_S16) 
	       && (`AXI_NUM_RN_S16>=8))

	 ) && S16_N_VIS;


// Remove decoding for boot region if the remap option has not
// been configured.
`ifdef AXI_REMAP			    
  // Generate the boot address mode slave decode signals.
  assign dcd_slv_boot_1 = 
         (    ((addr_i>=`AXI_R1_BSA_S1) && (addr_i<=`AXI_R1_BEA_S1))

	   || ((addr_i>=`AXI_R2_BSA_S1) && (addr_i<=`AXI_R2_BEA_S1) 
	       && (`AXI_NUM_RB_S1>=2))

	   || ((addr_i>=`AXI_R3_BSA_S1) && (addr_i<=`AXI_R3_BEA_S1) 
	       && (`AXI_NUM_RB_S1>=3))

	   || ((addr_i>=`AXI_R4_BSA_S1) && (addr_i<=`AXI_R4_BEA_S1) 
	       && (`AXI_NUM_RB_S1>=4))

	   || ((addr_i>=`AXI_R5_BSA_S1) && (addr_i<=`AXI_R5_BEA_S1) 
	       && (`AXI_NUM_RB_S1>=5))

	   || ((addr_i>=`AXI_R6_BSA_S1) && (addr_i<=`AXI_R6_BEA_S1) 
	       && (`AXI_NUM_RB_S1>=6))

	   || ((addr_i>=`AXI_R7_BSA_S1) && (addr_i<=`AXI_R7_BEA_S1) 
	       && (`AXI_NUM_RB_S1>=7))

	   || ((addr_i>=`AXI_R8_BSA_S1) && (addr_i<=`AXI_R8_BEA_S1) 
	       && (`AXI_NUM_RB_S1>=8))

	 ) && S1_B_VIS; 


  assign dcd_slv_boot_2 = 
         (    ((addr_i>=`AXI_R1_BSA_S2) && (addr_i<=`AXI_R1_BEA_S2))

	   || ((addr_i>=`AXI_R2_BSA_S2) && (addr_i<=`AXI_R2_BEA_S2) 
	       && (`AXI_NUM_RB_S2>=2))

	   || ((addr_i>=`AXI_R3_BSA_S2) && (addr_i<=`AXI_R3_BEA_S2) 
	       && (`AXI_NUM_RB_S2>=3))

	   || ((addr_i>=`AXI_R4_BSA_S2) && (addr_i<=`AXI_R4_BEA_S2) 
	       && (`AXI_NUM_RB_S2>=4))

	   || ((addr_i>=`AXI_R5_BSA_S2) && (addr_i<=`AXI_R5_BEA_S2) 
	       && (`AXI_NUM_RB_S2>=5))

	   || ((addr_i>=`AXI_R6_BSA_S2) && (addr_i<=`AXI_R6_BEA_S2) 
	       && (`AXI_NUM_RB_S2>=6))

	   || ((addr_i>=`AXI_R7_BSA_S2) && (addr_i<=`AXI_R7_BEA_S2) 
	       && (`AXI_NUM_RB_S2>=7))

	   || ((addr_i>=`AXI_R8_BSA_S2) && (addr_i<=`AXI_R8_BEA_S2) 
	       && (`AXI_NUM_RB_S2>=8))

	 ) && S2_B_VIS; 


  assign dcd_slv_boot_3 = 
         (    ((addr_i>=`AXI_R1_BSA_S3) && (addr_i<=`AXI_R1_BEA_S3))

	   || ((addr_i>=`AXI_R2_BSA_S3) && (addr_i<=`AXI_R2_BEA_S3) 
	       && (`AXI_NUM_RB_S3>=2))

	   || ((addr_i>=`AXI_R3_BSA_S3) && (addr_i<=`AXI_R3_BEA_S3) 
	       && (`AXI_NUM_RB_S3>=3))

	   || ((addr_i>=`AXI_R4_BSA_S3) && (addr_i<=`AXI_R4_BEA_S3) 
	       && (`AXI_NUM_RB_S3>=4))

	   || ((addr_i>=`AXI_R5_BSA_S3) && (addr_i<=`AXI_R5_BEA_S3) 
	       && (`AXI_NUM_RB_S3>=5))

	   || ((addr_i>=`AXI_R6_BSA_S3) && (addr_i<=`AXI_R6_BEA_S3) 
	       && (`AXI_NUM_RB_S3>=6))

	   || ((addr_i>=`AXI_R7_BSA_S3) && (addr_i<=`AXI_R7_BEA_S3) 
	       && (`AXI_NUM_RB_S3>=7))

	   || ((addr_i>=`AXI_R8_BSA_S3) && (addr_i<=`AXI_R8_BEA_S3) 
	       && (`AXI_NUM_RB_S3>=8))

	 ) && S3_B_VIS; 


  assign dcd_slv_boot_4 = 
         (    ((addr_i>=`AXI_R1_BSA_S4) && (addr_i<=`AXI_R1_BEA_S4))

	   || ((addr_i>=`AXI_R2_BSA_S4) && (addr_i<=`AXI_R2_BEA_S4) 
	       && (`AXI_NUM_RB_S4>=2))

	   || ((addr_i>=`AXI_R3_BSA_S4) && (addr_i<=`AXI_R3_BEA_S4) 
	       && (`AXI_NUM_RB_S4>=3))

	   || ((addr_i>=`AXI_R4_BSA_S4) && (addr_i<=`AXI_R4_BEA_S4) 
	       && (`AXI_NUM_RB_S4>=4))

	   || ((addr_i>=`AXI_R5_BSA_S4) && (addr_i<=`AXI_R5_BEA_S4) 
	       && (`AXI_NUM_RB_S4>=5))

	   || ((addr_i>=`AXI_R6_BSA_S4) && (addr_i<=`AXI_R6_BEA_S4) 
	       && (`AXI_NUM_RB_S4>=6))

	   || ((addr_i>=`AXI_R7_BSA_S4) && (addr_i<=`AXI_R7_BEA_S4) 
	       && (`AXI_NUM_RB_S4>=7))

	   || ((addr_i>=`AXI_R8_BSA_S4) && (addr_i<=`AXI_R8_BEA_S4) 
	       && (`AXI_NUM_RB_S4>=8))

	 ) && S4_B_VIS; 


  assign dcd_slv_boot_5 = 
         (    ((addr_i>=`AXI_R1_BSA_S5) && (addr_i<=`AXI_R1_BEA_S5))

	   || ((addr_i>=`AXI_R2_BSA_S5) && (addr_i<=`AXI_R2_BEA_S5) 
	       && (`AXI_NUM_RB_S5>=2))

	   || ((addr_i>=`AXI_R3_BSA_S5) && (addr_i<=`AXI_R3_BEA_S5) 
	       && (`AXI_NUM_RB_S5>=3))

	   || ((addr_i>=`AXI_R4_BSA_S5) && (addr_i<=`AXI_R4_BEA_S5) 
	       && (`AXI_NUM_RB_S5>=4))

	   || ((addr_i>=`AXI_R5_BSA_S5) && (addr_i<=`AXI_R5_BEA_S5) 
	       && (`AXI_NUM_RB_S5>=5))

	   || ((addr_i>=`AXI_R6_BSA_S5) && (addr_i<=`AXI_R6_BEA_S5) 
	       && (`AXI_NUM_RB_S5>=6))

	   || ((addr_i>=`AXI_R7_BSA_S5) && (addr_i<=`AXI_R7_BEA_S5) 
	       && (`AXI_NUM_RB_S5>=7))

	   || ((addr_i>=`AXI_R8_BSA_S5) && (addr_i<=`AXI_R8_BEA_S5) 
	       && (`AXI_NUM_RB_S5>=8))

	 ) && S5_B_VIS; 


  assign dcd_slv_boot_6 = 
         (    ((addr_i>=`AXI_R1_BSA_S6) && (addr_i<=`AXI_R1_BEA_S6))

	   || ((addr_i>=`AXI_R2_BSA_S6) && (addr_i<=`AXI_R2_BEA_S6) 
	       && (`AXI_NUM_RB_S6>=2))

	   || ((addr_i>=`AXI_R3_BSA_S6) && (addr_i<=`AXI_R3_BEA_S6) 
	       && (`AXI_NUM_RB_S6>=3))

	   || ((addr_i>=`AXI_R4_BSA_S6) && (addr_i<=`AXI_R4_BEA_S6) 
	       && (`AXI_NUM_RB_S6>=4))

	   || ((addr_i>=`AXI_R5_BSA_S6) && (addr_i<=`AXI_R5_BEA_S6) 
	       && (`AXI_NUM_RB_S6>=5))

	   || ((addr_i>=`AXI_R6_BSA_S6) && (addr_i<=`AXI_R6_BEA_S6) 
	       && (`AXI_NUM_RB_S6>=6))

	   || ((addr_i>=`AXI_R7_BSA_S6) && (addr_i<=`AXI_R7_BEA_S6) 
	       && (`AXI_NUM_RB_S6>=7))

	   || ((addr_i>=`AXI_R8_BSA_S6) && (addr_i<=`AXI_R8_BEA_S6) 
	       && (`AXI_NUM_RB_S6>=8))

	 ) && S6_B_VIS; 


  assign dcd_slv_boot_7 = 
         (    ((addr_i>=`AXI_R1_BSA_S7) && (addr_i<=`AXI_R1_BEA_S7))

	   || ((addr_i>=`AXI_R2_BSA_S7) && (addr_i<=`AXI_R2_BEA_S7) 
	       && (`AXI_NUM_RB_S7>=2))

	   || ((addr_i>=`AXI_R3_BSA_S7) && (addr_i<=`AXI_R3_BEA_S7) 
	       && (`AXI_NUM_RB_S7>=3))

	   || ((addr_i>=`AXI_R4_BSA_S7) && (addr_i<=`AXI_R4_BEA_S7) 
	       && (`AXI_NUM_RB_S7>=4))

	   || ((addr_i>=`AXI_R5_BSA_S7) && (addr_i<=`AXI_R5_BEA_S7) 
	       && (`AXI_NUM_RB_S7>=5))

	   || ((addr_i>=`AXI_R6_BSA_S7) && (addr_i<=`AXI_R6_BEA_S7) 
	       && (`AXI_NUM_RB_S7>=6))

	   || ((addr_i>=`AXI_R7_BSA_S7) && (addr_i<=`AXI_R7_BEA_S7) 
	       && (`AXI_NUM_RB_S7>=7))

	   || ((addr_i>=`AXI_R8_BSA_S7) && (addr_i<=`AXI_R8_BEA_S7) 
	       && (`AXI_NUM_RB_S7>=8))

	 ) && S7_B_VIS; 


  assign dcd_slv_boot_8 = 
         (    ((addr_i>=`AXI_R1_BSA_S8) && (addr_i<=`AXI_R1_BEA_S8))

	   || ((addr_i>=`AXI_R2_BSA_S8) && (addr_i<=`AXI_R2_BEA_S8) 
	       && (`AXI_NUM_RB_S8>=2))

	   || ((addr_i>=`AXI_R3_BSA_S8) && (addr_i<=`AXI_R3_BEA_S8) 
	       && (`AXI_NUM_RB_S8>=3))

	   || ((addr_i>=`AXI_R4_BSA_S8) && (addr_i<=`AXI_R4_BEA_S8) 
	       && (`AXI_NUM_RB_S8>=4))

	   || ((addr_i>=`AXI_R5_BSA_S8) && (addr_i<=`AXI_R5_BEA_S8) 
	       && (`AXI_NUM_RB_S8>=5))

	   || ((addr_i>=`AXI_R6_BSA_S8) && (addr_i<=`AXI_R6_BEA_S8) 
	       && (`AXI_NUM_RB_S8>=6))

	   || ((addr_i>=`AXI_R7_BSA_S8) && (addr_i<=`AXI_R7_BEA_S8) 
	       && (`AXI_NUM_RB_S8>=7))

	   || ((addr_i>=`AXI_R8_BSA_S8) && (addr_i<=`AXI_R8_BEA_S8) 
	       && (`AXI_NUM_RB_S8>=8))

	 ) && S8_B_VIS; 


  assign dcd_slv_boot_9 = 
         (    ((addr_i>=`AXI_R1_BSA_S9) && (addr_i<=`AXI_R1_BEA_S9))

	   || ((addr_i>=`AXI_R2_BSA_S9) && (addr_i<=`AXI_R2_BEA_S9) 
	       && (`AXI_NUM_RB_S9>=2))

	   || ((addr_i>=`AXI_R3_BSA_S9) && (addr_i<=`AXI_R3_BEA_S9) 
	       && (`AXI_NUM_RB_S9>=3))

	   || ((addr_i>=`AXI_R4_BSA_S9) && (addr_i<=`AXI_R4_BEA_S9) 
	       && (`AXI_NUM_RB_S9>=4))

	   || ((addr_i>=`AXI_R5_BSA_S9) && (addr_i<=`AXI_R5_BEA_S9) 
	       && (`AXI_NUM_RB_S9>=5))

	   || ((addr_i>=`AXI_R6_BSA_S9) && (addr_i<=`AXI_R6_BEA_S9) 
	       && (`AXI_NUM_RB_S9>=6))

	   || ((addr_i>=`AXI_R7_BSA_S9) && (addr_i<=`AXI_R7_BEA_S9) 
	       && (`AXI_NUM_RB_S9>=7))

	   || ((addr_i>=`AXI_R8_BSA_S9) && (addr_i<=`AXI_R8_BEA_S9) 
	       && (`AXI_NUM_RB_S9>=8))

	 ) && S9_B_VIS; 


  assign dcd_slv_boot_10 = 
         (    ((addr_i>=`AXI_R1_BSA_S10) && (addr_i<=`AXI_R1_BEA_S10))

	   || ((addr_i>=`AXI_R2_BSA_S10) && (addr_i<=`AXI_R2_BEA_S10) 
	       && (`AXI_NUM_RB_S10>=2))

	   || ((addr_i>=`AXI_R3_BSA_S10) && (addr_i<=`AXI_R3_BEA_S10) 
	       && (`AXI_NUM_RB_S10>=3))

	   || ((addr_i>=`AXI_R4_BSA_S10) && (addr_i<=`AXI_R4_BEA_S10) 
	       && (`AXI_NUM_RB_S10>=4))

	   || ((addr_i>=`AXI_R5_BSA_S10) && (addr_i<=`AXI_R5_BEA_S10) 
	       && (`AXI_NUM_RB_S10>=5))

	   || ((addr_i>=`AXI_R6_BSA_S10) && (addr_i<=`AXI_R6_BEA_S10) 
	       && (`AXI_NUM_RB_S10>=6))

	   || ((addr_i>=`AXI_R7_BSA_S10) && (addr_i<=`AXI_R7_BEA_S10) 
	       && (`AXI_NUM_RB_S10>=7))

	   || ((addr_i>=`AXI_R8_BSA_S10) && (addr_i<=`AXI_R8_BEA_S10) 
	       && (`AXI_NUM_RB_S10>=8))

	 ) && S10_B_VIS; 


  assign dcd_slv_boot_11 = 
         (    ((addr_i>=`AXI_R1_BSA_S11) && (addr_i<=`AXI_R1_BEA_S11))

	   || ((addr_i>=`AXI_R2_BSA_S11) && (addr_i<=`AXI_R2_BEA_S11) 
	       && (`AXI_NUM_RB_S11>=2))

	   || ((addr_i>=`AXI_R3_BSA_S11) && (addr_i<=`AXI_R3_BEA_S11) 
	       && (`AXI_NUM_RB_S11>=3))

	   || ((addr_i>=`AXI_R4_BSA_S11) && (addr_i<=`AXI_R4_BEA_S11) 
	       && (`AXI_NUM_RB_S11>=4))

	   || ((addr_i>=`AXI_R5_BSA_S11) && (addr_i<=`AXI_R5_BEA_S11) 
	       && (`AXI_NUM_RB_S11>=5))

	   || ((addr_i>=`AXI_R6_BSA_S11) && (addr_i<=`AXI_R6_BEA_S11) 
	       && (`AXI_NUM_RB_S11>=6))

	   || ((addr_i>=`AXI_R7_BSA_S11) && (addr_i<=`AXI_R7_BEA_S11) 
	       && (`AXI_NUM_RB_S11>=7))

	   || ((addr_i>=`AXI_R8_BSA_S11) && (addr_i<=`AXI_R8_BEA_S11) 
	       && (`AXI_NUM_RB_S11>=8))

	 ) && S11_B_VIS; 


  assign dcd_slv_boot_12 = 
         (    ((addr_i>=`AXI_R1_BSA_S12) && (addr_i<=`AXI_R1_BEA_S12))

	   || ((addr_i>=`AXI_R2_BSA_S12) && (addr_i<=`AXI_R2_BEA_S12) 
	       && (`AXI_NUM_RB_S12>=2))

	   || ((addr_i>=`AXI_R3_BSA_S12) && (addr_i<=`AXI_R3_BEA_S12) 
	       && (`AXI_NUM_RB_S12>=3))

	   || ((addr_i>=`AXI_R4_BSA_S12) && (addr_i<=`AXI_R4_BEA_S12) 
	       && (`AXI_NUM_RB_S12>=4))

	   || ((addr_i>=`AXI_R5_BSA_S12) && (addr_i<=`AXI_R5_BEA_S12) 
	       && (`AXI_NUM_RB_S12>=5))

	   || ((addr_i>=`AXI_R6_BSA_S12) && (addr_i<=`AXI_R6_BEA_S12) 
	       && (`AXI_NUM_RB_S12>=6))

	   || ((addr_i>=`AXI_R7_BSA_S12) && (addr_i<=`AXI_R7_BEA_S12) 
	       && (`AXI_NUM_RB_S12>=7))

	   || ((addr_i>=`AXI_R8_BSA_S12) && (addr_i<=`AXI_R8_BEA_S12) 
	       && (`AXI_NUM_RB_S12>=8))

	 ) && S12_B_VIS; 


  assign dcd_slv_boot_13 = 
         (    ((addr_i>=`AXI_R1_BSA_S13) && (addr_i<=`AXI_R1_BEA_S13))

	   || ((addr_i>=`AXI_R2_BSA_S13) && (addr_i<=`AXI_R2_BEA_S13) 
	       && (`AXI_NUM_RB_S13>=2))

	   || ((addr_i>=`AXI_R3_BSA_S13) && (addr_i<=`AXI_R3_BEA_S13) 
	       && (`AXI_NUM_RB_S13>=3))

	   || ((addr_i>=`AXI_R4_BSA_S13) && (addr_i<=`AXI_R4_BEA_S13) 
	       && (`AXI_NUM_RB_S13>=4))

	   || ((addr_i>=`AXI_R5_BSA_S13) && (addr_i<=`AXI_R5_BEA_S13) 
	       && (`AXI_NUM_RB_S13>=5))

	   || ((addr_i>=`AXI_R6_BSA_S13) && (addr_i<=`AXI_R6_BEA_S13) 
	       && (`AXI_NUM_RB_S13>=6))

	   || ((addr_i>=`AXI_R7_BSA_S13) && (addr_i<=`AXI_R7_BEA_S13) 
	       && (`AXI_NUM_RB_S13>=7))

	   || ((addr_i>=`AXI_R8_BSA_S13) && (addr_i<=`AXI_R8_BEA_S13) 
	       && (`AXI_NUM_RB_S13>=8))

	 ) && S13_B_VIS; 


  assign dcd_slv_boot_14 = 
         (    ((addr_i>=`AXI_R1_BSA_S14) && (addr_i<=`AXI_R1_BEA_S14))

	   || ((addr_i>=`AXI_R2_BSA_S14) && (addr_i<=`AXI_R2_BEA_S14) 
	       && (`AXI_NUM_RB_S14>=2))

	   || ((addr_i>=`AXI_R3_BSA_S14) && (addr_i<=`AXI_R3_BEA_S14) 
	       && (`AXI_NUM_RB_S14>=3))

	   || ((addr_i>=`AXI_R4_BSA_S14) && (addr_i<=`AXI_R4_BEA_S14) 
	       && (`AXI_NUM_RB_S14>=4))

	   || ((addr_i>=`AXI_R5_BSA_S14) && (addr_i<=`AXI_R5_BEA_S14) 
	       && (`AXI_NUM_RB_S14>=5))

	   || ((addr_i>=`AXI_R6_BSA_S14) && (addr_i<=`AXI_R6_BEA_S14) 
	       && (`AXI_NUM_RB_S14>=6))

	   || ((addr_i>=`AXI_R7_BSA_S14) && (addr_i<=`AXI_R7_BEA_S14) 
	       && (`AXI_NUM_RB_S14>=7))

	   || ((addr_i>=`AXI_R8_BSA_S14) && (addr_i<=`AXI_R8_BEA_S14) 
	       && (`AXI_NUM_RB_S14>=8))

	 ) && S14_B_VIS; 


  assign dcd_slv_boot_15 = 
         (    ((addr_i>=`AXI_R1_BSA_S15) && (addr_i<=`AXI_R1_BEA_S15))

	   || ((addr_i>=`AXI_R2_BSA_S15) && (addr_i<=`AXI_R2_BEA_S15) 
	       && (`AXI_NUM_RB_S15>=2))

	   || ((addr_i>=`AXI_R3_BSA_S15) && (addr_i<=`AXI_R3_BEA_S15) 
	       && (`AXI_NUM_RB_S15>=3))

	   || ((addr_i>=`AXI_R4_BSA_S15) && (addr_i<=`AXI_R4_BEA_S15) 
	       && (`AXI_NUM_RB_S15>=4))

	   || ((addr_i>=`AXI_R5_BSA_S15) && (addr_i<=`AXI_R5_BEA_S15) 
	       && (`AXI_NUM_RB_S15>=5))

	   || ((addr_i>=`AXI_R6_BSA_S15) && (addr_i<=`AXI_R6_BEA_S15) 
	       && (`AXI_NUM_RB_S15>=6))

	   || ((addr_i>=`AXI_R7_BSA_S15) && (addr_i<=`AXI_R7_BEA_S15) 
	       && (`AXI_NUM_RB_S15>=7))

	   || ((addr_i>=`AXI_R8_BSA_S15) && (addr_i<=`AXI_R8_BEA_S15) 
	       && (`AXI_NUM_RB_S15>=8))

	 ) && S15_B_VIS; 


  assign dcd_slv_boot_16 = 
         (    ((addr_i>=`AXI_R1_BSA_S16) && (addr_i<=`AXI_R1_BEA_S16))

	   || ((addr_i>=`AXI_R2_BSA_S16) && (addr_i<=`AXI_R2_BEA_S16) 
	       && (`AXI_NUM_RB_S16>=2))

	   || ((addr_i>=`AXI_R3_BSA_S16) && (addr_i<=`AXI_R3_BEA_S16) 
	       && (`AXI_NUM_RB_S16>=3))

	   || ((addr_i>=`AXI_R4_BSA_S16) && (addr_i<=`AXI_R4_BEA_S16) 
	       && (`AXI_NUM_RB_S16>=4))

	   || ((addr_i>=`AXI_R5_BSA_S16) && (addr_i<=`AXI_R5_BEA_S16) 
	       && (`AXI_NUM_RB_S16>=5))

	   || ((addr_i>=`AXI_R6_BSA_S16) && (addr_i<=`AXI_R6_BEA_S16) 
	       && (`AXI_NUM_RB_S16>=6))

	   || ((addr_i>=`AXI_R7_BSA_S16) && (addr_i<=`AXI_R7_BEA_S16) 
	       && (`AXI_NUM_RB_S16>=7))

	   || ((addr_i>=`AXI_R8_BSA_S16) && (addr_i<=`AXI_R8_BEA_S16) 
	       && (`AXI_NUM_RB_S16>=8))

	 ) && S16_B_VIS; 


`endif
  
  // Concatenate all normal slave decode signals into one bus.	 
  assign bus_dcd_slv_norm = { dcd_slv_norm_16,
                              dcd_slv_norm_15,
                              dcd_slv_norm_14,
                              dcd_slv_norm_13,
                              dcd_slv_norm_12,
                              dcd_slv_norm_11,
                              dcd_slv_norm_10,
                              dcd_slv_norm_9,
                              dcd_slv_norm_8,
                              dcd_slv_norm_7,
                              dcd_slv_norm_6,
                              dcd_slv_norm_5,
                              dcd_slv_norm_4,
                              dcd_slv_norm_3,
                              dcd_slv_norm_2,
                              dcd_slv_norm_1,
			      ~|bus_dcd_slv_norm
			        [`AXI_MAX_NUM_MST_SLVS-1:1]
			    };
  

`ifdef AXI_REMAP
  // Concatenate all boot slave decode signals into one bus.	 
  assign bus_dcd_slv_boot = { dcd_slv_boot_16,
                              dcd_slv_boot_15,
                              dcd_slv_boot_14,
                              dcd_slv_boot_13,
                              dcd_slv_boot_12,
                              dcd_slv_boot_11,
                              dcd_slv_boot_10,
                              dcd_slv_boot_9,
                              dcd_slv_boot_8,
                              dcd_slv_boot_7,
                              dcd_slv_boot_6,
                              dcd_slv_boot_5,
                              dcd_slv_boot_4,
                              dcd_slv_boot_3,
                              dcd_slv_boot_2,
                              dcd_slv_boot_1,
			      ~|bus_dcd_slv_boot
			        [`AXI_MAX_NUM_MST_SLVS-1:1]
			    };
`endif			    
  
			    
  // Remap address decode signal mux.			    
`ifdef AXI_REMAP
  assign bus_dcd_slv_mux = (!remap_n_i && `AXI_REMAP_EN) 
                           ? bus_dcd_slv_boot
		           : bus_dcd_slv_norm;
`else
  assign bus_dcd_slv_mux = bus_dcd_slv_norm;
`endif


  //--------------------------------------------------------------------
  // Map bus_dcd_slv_mux from one hot to a binary slave number.
  // Note default slave 0 is decoded from bus_dcd_slv_mux == 'b0,
  // and slave 1 is decoded from bus_dcd_slv_mux[1] = 1'b1,
  // and so on.
  //--------------------------------------------------------------------
  always @(bus_dcd_slv_mux)
  begin : bus_dcd_slv_to_oh_PROC
    reg [`AXI_LOG2_NSP1-1:0] slvnum;

    integer slvnum_intg;

    sys_slv_o = {`AXI_LOG2_NSP1{1'b0}};

    // For loop must iterate through all slaves including the
    // default slave.
    for(slvnum_intg = {`AXI_LOG2_NSP1{1'b0}} ;
        slvnum_intg <= (`AXI_NSP1-1)   ;
        slvnum_intg = slvnum_intg + 1'b1  
       )
    begin
      slvnum = slvnum_intg;
      if(bus_dcd_slv_mux[slvnum_intg]) sys_slv_o = slvnum;
    end 

  end // bus_dcd_slv_to_oh_PROC


  // Map decoded system slave number to local slave number.
  tb_systolcl
  #(0,               // 0-Slave System Number, 1-Master System Number
    NUM_VIS_SP,      // Number of slaves visible from this master port.
    LOG2_NUM_VIS_SP, // Log 2 of NUM_VIS_SP.
    `AXI_NSP1,       // Number of slaves in system, including default
                     // slave.
    `AXI_LOG2_NSP1,  // Log base 2 of number of slaves in the system.
    `P0_VIS,         // Port visibility parameters.
    `P1_VIS,
    `P2_VIS,
    `P3_VIS,
    `P4_VIS,
    `P5_VIS,
    `P6_VIS,
    `P7_VIS,
    `P8_VIS,
    `P9_VIS,
    `P10_VIS,
    `P11_VIS,
    `P12_VIS,
    `P13_VIS,
    `P14_VIS,
    `P15_VIS,
    `P16_VIS
  )
  U_dcdr_systolcl (
    .sys_pnum_i  (sys_slv_o),
    .lcl_pnum_o  (local_slv_o)
  );


  `ifdef PARAM_VARS_PROC
  // -------------------------------------------------------
  // Initial block added to declare and connect variables
  // to hold all parameters in this module for easy viewing
  // during debug in a wave viewer.
  // -------------------------------------------------------
  // synopsys translate_off 
  // VCS coverage off 
  initial begin : param_vars_PROC

    integer  NUM_VIS_SP_param; 
    integer  LOG2_NUM_VIS_SP_param; 
    integer  S0_N_VIS_param; 
    integer  S1_N_VIS_param; 
    integer  S2_N_VIS_param; 
    integer  S3_N_VIS_param; 
    integer  S4_N_VIS_param; 
    integer  S5_N_VIS_param; 
    integer  S6_N_VIS_param; 
    integer  S7_N_VIS_param; 
    integer  S8_N_VIS_param; 
    integer  S9_N_VIS_param; 
    integer  S10_N_VIS_param; 
    integer  S11_N_VIS_param; 
    integer  S12_N_VIS_param; 
    integer  S13_N_VIS_param; 
    integer  S14_N_VIS_param; 
    integer  S15_N_VIS_param; 
    integer  S16_N_VIS_param; 
    integer  S0_B_VIS_param; 
    integer  S1_B_VIS_param; 
    integer  S2_B_VIS_param; 
    integer  S3_B_VIS_param; 
    integer  S4_B_VIS_param; 
    integer  S5_B_VIS_param; 
    integer  S6_B_VIS_param; 
    integer  S7_B_VIS_param; 
    integer  S8_B_VIS_param; 
    integer  S9_B_VIS_param; 
    integer  S10_B_VIS_param; 
    integer  S11_B_VIS_param; 
    integer  S12_B_VIS_param; 
    integer  S13_B_VIS_param; 
    integer  S14_B_VIS_param; 
    integer  S15_B_VIS_param; 
    integer  S16_B_VIS_param; 


    NUM_VIS_SP_param = NUM_VIS_SP; 
    LOG2_NUM_VIS_SP_param = LOG2_NUM_VIS_SP; 
    S0_N_VIS_param = S0_N_VIS; 
    S1_N_VIS_param = S1_N_VIS; 
    S2_N_VIS_param = S2_N_VIS; 
    S3_N_VIS_param = S3_N_VIS; 
    S4_N_VIS_param = S4_N_VIS; 
    S5_N_VIS_param = S5_N_VIS; 
    S6_N_VIS_param = S6_N_VIS; 
    S7_N_VIS_param = S7_N_VIS; 
    S8_N_VIS_param = S8_N_VIS; 
    S9_N_VIS_param = S9_N_VIS; 
    S10_N_VIS_param = S10_N_VIS; 
    S11_N_VIS_param = S11_N_VIS; 
    S12_N_VIS_param = S12_N_VIS; 
    S13_N_VIS_param = S13_N_VIS; 
    S14_N_VIS_param = S14_N_VIS; 
    S15_N_VIS_param = S15_N_VIS; 
    S16_N_VIS_param = S16_N_VIS; 
    S0_B_VIS_param = S0_B_VIS; 
    S1_B_VIS_param = S1_B_VIS; 
    S2_B_VIS_param = S2_B_VIS; 
    S3_B_VIS_param = S3_B_VIS; 
    S4_B_VIS_param = S4_B_VIS; 
    S5_B_VIS_param = S5_B_VIS; 
    S6_B_VIS_param = S6_B_VIS; 
    S7_B_VIS_param = S7_B_VIS; 
    S8_B_VIS_param = S8_B_VIS; 
    S9_B_VIS_param = S9_B_VIS; 
    S10_B_VIS_param = S10_B_VIS; 
    S11_B_VIS_param = S11_B_VIS; 
    S12_B_VIS_param = S12_B_VIS; 
    S13_B_VIS_param = S13_B_VIS; 
    S14_B_VIS_param = S14_B_VIS; 
    S15_B_VIS_param = S15_B_VIS; 
    S16_B_VIS_param = S16_B_VIS; 

  end // param_vars_PROC 

  // VCS coverage on 
  // synopsys translate_on 

  `endif // PARAM_VARS_PROC 
endmodule
