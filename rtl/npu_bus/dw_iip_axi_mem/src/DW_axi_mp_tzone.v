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
** File     : DW_axi_mp_tzone.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : This block is responsible for implementing the trustzone
**            features. 
**
** ---------------------------------------------------------------------
*/

module DW_axi_mp_tzone (
  // Inputs.
  slvnum_i,
  prot_i,
  bus_secure_i,
  
  // Outputs.
  slvnum_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter NUM_VIS_SP = 16; // Number of slave ports visible to
                             // this master port.

  parameter LOG2_NUM_VIS_SP = 4; // Log 2 of NUM_VIS_SP.

//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// INPUTS
//----------------------------------------------------------------------
  input [LOG2_NUM_VIS_SP-1:0] slvnum_i;     // Incoming local slave 
                                            // number.

  input [`AXI_PTW-1:0]        prot_i;       // Protection attributes of 
                                            // current transaction.

  input [NUM_VIS_SP-1:0]      bus_secure_i; // Secure bit for every 
                                            // system slave, including 
				 	    // the default slave.

//----------------------------------------------------------------------
// OUTPUTS
//----------------------------------------------------------------------
  output [LOG2_NUM_VIS_SP-1:0] slvnum_o; // Output local slave number.


  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------


  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  wire current_slv_secure_c; // Asserted if input slave number refers
                             // to a secure slave.
			     
  wire secure_access_c; // Asserted if current transaction is secure.

  wire security_break_c; // Asserted if unsecure transaction to secure
                         // slave is attempted.
  

  // This module implements the security bit mux.
  DW_axi_busmux
  
  #(NUM_VIS_SP,      // Number of inputs to the mux.
    1,               // Width of each input to the mux.
    LOG2_NUM_VIS_SP  // Width of select line for the mux.
  )
  U_lcltosys_mux (
    .sel  (slvnum_i),
    .din  (bus_secure_i), 
    .dout (current_slv_secure_c) 
  );
  

  // Is this a secure access.
  assign secure_access_c = !prot_i[`AXI_PT_SECURE_BIT];


  // Is this a non secure access to a secure slave.
  assign security_break_c = (!secure_access_c && current_slv_secure_c)
		            ? 1'b1 : 1'b0;


  // Send output slave number of 0 (default slave) if there is
  // a security break.
  assign slvnum_o = security_break_c ? {LOG2_NUM_VIS_SP{1'b0}}
                                     : slvnum_i;


endmodule
