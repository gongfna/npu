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
** File     : DW_axi_mca_reqhold.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : This block performs the arbiter input signal holding for
**            any arbiter that has multi-cycle arbitration enabled.
**
** ---------------------------------------------------------------------
*/

module DW_axi_mca_reqhold (
  // Inputs - System.
  aclk_i,
  aresetn_i,

  // Inputs - Payload source.
  bus_req_i,
  bus_prior_i,
  
  // Inputs - Multi cycle arbitration control.
  new_req_i,

  // Outputs - Channel arbiter.
  bus_req_o,
  bus_prior_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter MCA_EN = 0; // 1 if multi cycle arbitration is enabled.

  parameter HOLD_PRIOR = 0; // 1 if this block should register priority
                            // values.
  
  parameter BUS_PRIOR_W = 0; // Width of priority input bus.

  parameter N = 2; // Numbre of request signals.
		   
//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------
  // Inputs - System.
  input aclk_i;    // AXI system clock.
  input aresetn_i; // AXI system reset.

  // Inputs - Payload source.
  input [N-1:0]  bus_req_i; 
  input [BUS_PRIOR_W-1:0]  bus_prior_i; 

  // Inputs - Multi cycle arbitration control.
  input          new_req_i;

  // Outputs - Channel arbiter.
  output [N-1:0] bus_req_o; 
  output [BUS_PRIOR_W-1:0] bus_prior_o; 


  //--------------------------------------------------------------------
  // Register signals.
  //--------------------------------------------------------------------
  reg [N-1:0] bus_req_r;
  reg [BUS_PRIOR_W-1:0] bus_prior_r;


  //--------------------------------------------------------------------
  // Request hold and mux registers for request and priority signals.
  // Load registers with new request signals if new_req_i is 
  // asserted otherwise hold values.
  //--------------------------------------------------------------------
  assign bus_req_o = (MCA_EN == 0)
                     ? bus_req_i
		     : bus_req_r;

  always @(posedge aclk_i or negedge aresetn_i)
  begin : bus_req_r_PROC
    if(!aresetn_i) begin
      bus_req_r <= {N{1'b0}};
    end else begin
      bus_req_r <= (new_req_i ? bus_req_i : bus_req_r);
    end
  end // bus_req_r_PROC


  // Registering of priority signals is not required unless user has
  // chosen to register external priority signals.
  assign bus_prior_o = ((MCA_EN == 0) || (HOLD_PRIOR == 0))
                       ? bus_prior_i
		       : bus_prior_r;

  always @(posedge aclk_i or negedge aresetn_i)
  begin : bus_prior_r_PROC
    if(!aresetn_i) begin
      bus_prior_r <= {BUS_PRIOR_W{1'b0}};
    end else begin
      bus_prior_r <= (new_req_i ? bus_prior_i : bus_prior_r);
    end
  end // bus_prior_r_PROC


endmodule
