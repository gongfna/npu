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
** File     : DW_axi_lockdec.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : Decode a*lock bits from the ar and aw payloads from each 
**            visible master port.
**
** ---------------------------------------------------------------------
*/

module DW_axi_lockdec (
  // Inputs.
  bus_awpayload_i,
  bus_arpayload_i,

  // Outputs.
  bus_awlocktx_o,
  bus_arlocktx_o
);

   
//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter NUM_VIS_MP = 2; // Number of visible master ports.

  parameter BUS_AW_PYLD_S_W = 0; // Payload width of AW channel at 
                                 // slave port.
				
  parameter BUS_AR_PYLD_S_W = 0; // Payload width of AR channel at 
                                 // slave port.
				 
//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// INPUTS
//----------------------------------------------------------------------
  input [BUS_AW_PYLD_S_W-1:0] bus_awpayload_i;
  input [BUS_AR_PYLD_S_W-1:0] bus_arpayload_i;

//----------------------------------------------------------------------
// OUTPUTS
//----------------------------------------------------------------------
  output [NUM_VIS_MP-1:0] bus_awlocktx_o; // Bit for each visible master
  reg    [NUM_VIS_MP-1:0] bus_awlocktx_o; // port. Asserted if lock bits
	  				  // decode to locked AW t/x.
					 
  output [NUM_VIS_MP-1:0] bus_arlocktx_o; // Bit for each visible master
  reg    [NUM_VIS_MP-1:0] bus_arlocktx_o; // port. Asserted if lock bits
					  // decode to locked AW t/x.
					  

  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------
  reg [`AXI_AW_PYLD_S_W-1:0] awpayload; // Temporary variables for a 
  reg [`AXI_AR_PYLD_S_W-1:0] arpayload; // single payload.

  // RTL was written with a particular function in mind so any
  // concerns regarding possible range overflow can be ignored
  // by Leda.
  // leda FM_2_22 off
   
  // Decode if awlock bits from each mp signal a lock t/x.
  always @(*)
  begin : bus_awlocktx_o_PROC
    integer mp, bt; 
    bus_awlocktx_o = {NUM_VIS_MP{1'b0}};

    for(mp=0 ; mp<=(NUM_VIS_MP-1) ; mp=mp+1) begin

      for(bt=0 ; bt<=(`AXI_AW_PYLD_S_W-1) ; bt=bt+1) begin
	awpayload[bt] = bus_awpayload_i[(mp*`AXI_AW_PYLD_S_W)+bt];
      end

      bus_awlocktx_o[mp] 
        = (awpayload[`AXI_AWPYLD_LOCK_LHS:`AXI_AWPYLD_LOCK_RHS]
	     == `AXI_LT_LOCK
);

    end
  end // bus_awlocktx_o_PROC
  

  // Decode if arlock bits from each mp signal a lock t/x.
  always @(*)
  begin : bus_arlocktx_o_PROC
    integer mp, bt; 
    bus_arlocktx_o = {NUM_VIS_MP{1'b0}};

    for(mp=0 ; mp<=(NUM_VIS_MP-1) ; mp=mp+1) begin

      for(bt=0 ; bt<=(`AXI_AR_PYLD_S_W-1) ; bt=bt+1) begin
	arpayload[bt] = bus_arpayload_i[(mp*`AXI_AR_PYLD_S_W)+bt];
      end

      bus_arlocktx_o[mp] 
        = (arpayload[`AXI_ARPYLD_LOCK_LHS:`AXI_ARPYLD_LOCK_RHS]
	     == `AXI_LT_LOCK
);

    end
  end // bus_arlocktx_o_PROC

  // leda FM_2_22 on

endmodule
