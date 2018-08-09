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
** File     : tb_ri_limit_checker.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : Checks that if ARB_RI_LIMIT_Mx is set for a particular 
**            master that read data is not interleaved.
**
** ---------------------------------------------------------------------
*/


module tb_ri_limit_checker (
  // Inputs - System.
  aclk_i,
  aresetn_i,

  // Inputs 
  valid_i,
  ready_i,
  last_i,
  id_i
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter IS_ICM = 0;
  parameter RI_LIMIT = 0;
  parameter MNUM = 0;

  parameter ID_W = IS_ICM ? `AXI_SIDW : `AXI_MIDW; 

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

// Inputs - System.
  input aclk_i;    // AXI system clock.
  input aresetn_i; // AXI system reset.


// Inputs.
  input valid_i;
  input ready_i;
  input last_i;
  input [ID_W-1:0] id_i;

// Reg & Wire Variables.
   reg [ID_W-1:0] id_prev_r;
   reg last_prev_r;
   reg tx_occured_r;
   wire ri_limit_1_broken;

  //--------------------------------------------------------------
  // Capture ID and LAST from the previous beat.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : id_last_prev_r_PROC
    if(~aresetn_i) begin
      id_prev_r   <= {ID_W{1'b0}};
      last_prev_r <= 1'b0;
      tx_occured_r <= 1'b0;
    end else begin
      if(valid_i & ready_i) begin
        id_prev_r   <= id_i;
	last_prev_r <= last_i;
        tx_occured_r <= 1'b1;
      end 
    end
  end // id_last_prev_r_PROC
        
  //--------------------------------------------------------------
  // Decode Error Condition.
  // When new valid is asserted check that the id matches the previous
  // beats ID, unless LAST was asserted for the previous beat.
  // tx_occured_r is used so that we don't always flag an error on
  // the first beat of the sim.
  assign ri_limit_1_broken 
    = valid_i & tx_occured_r & ((id_prev_r != id_i) & ~last_prev_r);

  //--------------------------------------------------------------
  // Report Error.
  always @(posedge aclk_i)
  begin

    if(ri_limit_1_broken & RI_LIMIT) begin

      $display("ERROR: %0d - RI LIMIT CHECKER -> Read interleaving depth of 1 exceeded."
               , $time); 
      $display("ERROR: %0d - RI LIMIT CHECKER -> @ MASTER %0d.", $time, MNUM); 
      $display("ERROR: %0d - RI LIMIT CHECKER -> New ID %0h occured.", $time, id_i); 
      $display("ERROR: %0d - RI LIMIT CHECKER -> Prev ID %0h not completed."
               , $time, id_prev_r); 
     end
  end

endmodule
