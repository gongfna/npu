/*
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
** File     : DW_axi_mp_shrd.v
** Created  : Mon May  9 19:49:55 MEST 2005
** Modified : $Date$
** Abstract : Shared Master Port block for the DW_axi interconnect.
**            Multiple external slaves compete for access to the R and
**            B channels of multiple external masters.
**
**            Only blocks for the R and B channels are here because 
**            only channel sink blocks are shared.
**
** ---------------------------------------------------------------------
*/
module DW_axi_mp_shrd (
  aclk_i,
  aresetn_i,



  dummy_input
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  // Master port configured as interconnecting port 
  parameter ICM_PORT = `AXI_HAS_BICMD;

  parameter R_NUM_VIS_SP = 16;        // Number of slaves connected to
  parameter LOG2_R_NUM_VIS_SP = 4;    // shared R channel + derived 
  parameter LOG2_R_NUM_VIS_SP_P1 = 4; // values.

  parameter B_NUM_VIS_SP = 16;        // Number of slaves connected to
  parameter LOG2_B_NUM_VIS_SP = 4;    // shared B channel + derived 
  parameter LOG2_B_NUM_VIS_SP_P1 = 4; // values.

  parameter ARB_TYPE_R = 0; // Arbiter type for R channel.
  parameter ARB_TYPE_B = 0; // Arbiter type for B channel.

  parameter R_MCA_EN = 0; // 1 if multi-cycle arbitration is enabled
  parameter B_MCA_EN = 0; // for each of these 2 channels.

  parameter R_MCA_NC = 0; // Number of arbitration cycles if
  parameter B_MCA_NC = 0; // multi cycle arbitration is enabled
                          // for each of these 2 channels.

  parameter R_MCA_NC_W = 1; // Log base 2 of *_MCA_NC + 1.
  parameter B_MCA_NC_W = 1; 

  parameter RI_LIMIT = 0; // Limit read interleaving to 1, true/false.

  parameter R_NSM = 1; // Number of masters on each shared channel.
  parameter B_NSM = 1; //

  // Parameter for each shared master, 1 if the master also
  // has a dedicatd channel.
  parameter HAS_DDCTD_R_M0 = 1;
  parameter HAS_DDCTD_R_M1 = 1;
  parameter HAS_DDCTD_R_M2 = 1;
  parameter HAS_DDCTD_R_M3 = 1;
  parameter HAS_DDCTD_R_M4 = 1;
  parameter HAS_DDCTD_R_M5 = 1;
  parameter HAS_DDCTD_R_M6 = 1;
  parameter HAS_DDCTD_R_M7 = 1;
  parameter HAS_DDCTD_R_M8 = 1;
  parameter HAS_DDCTD_R_M9 = 1;
  parameter HAS_DDCTD_R_M10 = 1;
  parameter HAS_DDCTD_R_M11 = 1;
  parameter HAS_DDCTD_R_M12 = 1;
  parameter HAS_DDCTD_R_M13 = 1;
  parameter HAS_DDCTD_R_M14 = 1;
  parameter HAS_DDCTD_R_M15 = 1;

  parameter HAS_DDCTD_B_M0 = 1;
  parameter HAS_DDCTD_B_M1 = 1;
  parameter HAS_DDCTD_B_M2 = 1;
  parameter HAS_DDCTD_B_M3 = 1;
  parameter HAS_DDCTD_B_M4 = 1;
  parameter HAS_DDCTD_B_M5 = 1;
  parameter HAS_DDCTD_B_M6 = 1;
  parameter HAS_DDCTD_B_M7 = 1;
  parameter HAS_DDCTD_B_M8 = 1;
  parameter HAS_DDCTD_B_M9 = 1;
  parameter HAS_DDCTD_B_M10 = 1;
  parameter HAS_DDCTD_B_M11 = 1;
  parameter HAS_DDCTD_B_M12 = 1;
  parameter HAS_DDCTD_B_M13 = 1;
  parameter HAS_DDCTD_B_M14 = 1;
  parameter HAS_DDCTD_B_M15 = 1;

  // Additional bits required for payload bus when ICM ports are used
  localparam ICM_PYLD = `AXI_HAS_BICMD*`AXI_LOG2_NM;

  // Width of concatenated read data channel payload vector from all 
  // visible slave ports.
  // Note : master number has been stripped from ID signal in
  //        the slave port.
  localparam BUS_R_PYLD_S_W
             = R_NUM_VIS_SP*(`AXI_R_PYLD_M_W + ICM_PYLD); 

  // Width of concatenated burst response channel payload vector for all
  // visible slave ports.
  // Note : master number has been stripped from ID signal in
  //        the slave port.
  localparam BUS_B_PYLD_S_W
             = B_NUM_VIS_SP*(`AXI_B_PYLD_M_W + ICM_PYLD); 

  // Width of concatenated slave priorities for all visible slave ports.
  localparam R_BUS_PRIORITY_W = `AXI_SLV_PRIORITY_W*R_NUM_VIS_SP;
  localparam B_BUS_PRIORITY_W = `AXI_SLV_PRIORITY_W*B_NUM_VIS_SP;

  // Width of buses containing a valid signal for each attached master
  // from every attached slave.
  localparam R_V_BUS_SHRD_W = R_NUM_VIS_SP*R_NSM;
  localparam B_V_BUS_SHRD_W = B_NUM_VIS_SP*B_NSM;


//----------------------------------------------------------------------
// LOCAL MAROS.
//----------------------------------------------------------------------

  `define LCL_AR_PYLD_W `AXI_AR_PYLD_M_W
  `define LCL_AW_PYLD_W `AXI_AW_PYLD_M_W
  `define LCL_W_PYLD_W  `AXI_W_PYLD_M_W

  `define LCL_R_M_PYLD_W  `AXI_R_PYLD_M_W
  `define LCL_R_S_PYLD_W  `AXI_R_PYLD_M_W

  `define LCL_B_M_PYLD_W  `AXI_B_PYLD_M_W
  `define LCL_B_S_PYLD_W  `AXI_B_PYLD_M_W

  `define ID_W `AXI_MIDW

//----------------------------------------------------------------------
// PORT DECLARATIONS.
//----------------------------------------------------------------------
  input aclk_i;    // AXI system clock.
  input aresetn_i; // AXI system reset.




  input dummy_input; // Unconnected, easy way to avoid syntax errors
                     // with the configurable i/o list.

  // Wires for unconnected sub module output ports.                     
  wire rvalid_o_unconn;
  wire rcpl_tx_o_unconn;
  wire bvalid_o_unconn;
  wire bcpl_tx_o_unconn;




endmodule

`undef LCL_R_M_PYLD_W
`undef LCL_R_S_PYLD_W
`undef LCL_B_M_PYLD_W
`undef LCL_B_S_PYLD_W
