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
** File     : DW_axi_arbpl.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : This block implements the registering of the arbiter 
**            outputs in DW_axi_arb.v .
**
** ---------------------------------------------------------------------
*/


module DW_axi_arbpl (
  // Inputs - System.
  aclk_i,
  aresetn_i,

  // Inputs 
  grant_i,
  bus_grant_i,
  grant_index_i,
  take_grant_i,
  take_mca_grant_i,
  
  // Outputs
  grant_o,
  bus_grant_o,
  grant_index_o,
  new_req
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter PIPELINE = 0; // Pipeline these signals or not.
  parameter BUS_GRANT_W = 1;
  parameter GRANT_INDEX_W = 1;
  parameter MCA_EN = 0; // Enable multi cycle arbitration.
  parameter MCA_NC = 0; // Number of arb. cycles in multi cycle arb.
  parameter MCA_NC_W = 1; // Log base 2 of MCA_NC.

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

// Inputs - System.
  input aclk_i;    // AXI system clock.
  input aresetn_i; // AXI system reset.


// Inputs.
  input grant_i;
  input [BUS_GRANT_W-1:0] bus_grant_i;
  input [GRANT_INDEX_W-1:0] grant_index_i;
  input take_grant_i;
  input take_mca_grant_i;
                                                
// Outputs - Arbiter outputs.
  output grant_o;
  output [BUS_GRANT_W-1:0] bus_grant_o;
  output [GRANT_INDEX_W-1:0] grant_index_o;

// Outputs - Multi cycle arbitration control.
  output new_req; // Selects when to allow new request signals to be
                  // forwarded to the arbiter.

  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------
  reg grant_r;
  reg [BUS_GRANT_W-1:0] bus_grant_r;
  reg [GRANT_INDEX_W-1:0] grant_index_r;

  //--------------------------------------------------------------------
  // Multi Cycle Arbitration signals.
  //--------------------------------------------------------------------
  reg [MCA_NC_W-1:0] mca_count_r; // Free running counter, counts up
                                  // to MCA_NC.
				   
  wire grant_index_update; // Asserted when arbiter outputs should be
                           // updated.
			   

  //--------------------------------------------------------------------
  // Multi Cycle Arbitration.  Counter and control signal decode.
  //--------------------------------------------------------------------

  //--------------------------------------------------------------
  // Multi cycle arbitration counter.
  // This is a free running counter, reset to 0 after it reaches
  // MCA_NC - 1.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : mca_count_r_PROC
    if(~aresetn_i) begin
      mca_count_r <= {MCA_NC_W{1'b0}};
    end else begin
      if(mca_count_r == (MCA_NC - 1)) begin
        mca_count_r <= {MCA_NC_W{1'b0}};
      end else begin
        mca_count_r <= mca_count_r + 1'b1;
      end
    end
  end // mca_count_r_PROC
  

  //--------------------------------------------------------------------
  // Decode of more multi cycle arbitration control signals.
  
  // Capture new grant index at the end of the count period.
  assign grant_index_update = MCA_EN
                              ? (mca_count_r == (MCA_NC - 1))
			                        : 1'b1;

  // Capture new arbiter inputs in the same cycle that the grant
  // index is being updated.
  assign new_req = grant_index_update;

  // When to take new grants in arbiter pipeline mode
  wire apl_gi_update = ((MCA_EN==0) & (PIPELINE==1))
                        ? (~grant_r | take_grant_i) 
                        : 1'b0;
  
  //--------------------------------------------------------------------
  // Perform registering of arbiter outputs.
  //
  // If multi cycle arbitration is enabled, only take new grants at 
  // the end of each arbitration window, when a transfer has been 
  // accepted, or there is no valid active.
  //
  // In arbiter pipeline mode, take new grants when t/x has been
  // accepted or there was no previous grant, but not during a locked
  // sequence. After a locked sequence we take the next grants after 
  // the sequence ends.
  always @(posedge aclk_i or negedge aresetn_i) 
  begin : arb_outputs_reg_PROC
    if(~aresetn_i) begin
      grant_r       <= 1'b0;
      bus_grant_r   <= {BUS_GRANT_W{1'b0}};
      grant_index_r <= {GRANT_INDEX_W{1'b0}};
    end else begin
      if((grant_index_update & take_mca_grant_i & (MCA_EN==1))
         | apl_gi_update
) begin
        grant_r       <= grant_i;
        bus_grant_r   <= bus_grant_i;
        grant_index_r <= grant_index_i;
      end
    end
  end // arb_outputs_reg_PROC


  // Select either registered or unregistered outputs.
  // NOTE : Register stage is used if the pipeline stage after the arbiter
  // is selected OR if multi cycle arbitration is enabled.
  assign grant_o       = (PIPELINE || MCA_EN) ?       grant_r : grant_i;
  assign bus_grant_o   = (PIPELINE || MCA_EN) ?   bus_grant_r : bus_grant_i;
  assign grant_index_o = (PIPELINE || MCA_EN) ? grant_index_r : grant_index_i;

endmodule
