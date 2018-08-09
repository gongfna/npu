/* --------------------------------------------------------------------
**
**                    (C) COPYRIGHT 2006-2011 SYNOPSYS, INC.
**                           ALL RIGHTS RESERVED
**
**  This software and the associated documentation are confidential and
**  proprietary to Synopsys, Inc.  Your use or disclosure of this
**  software is subject to the terms and conditions of a written
**  license agreement between you, or your company, and Synopsys, Inc.
**
**  The entire notice above must be reproduced on all authorized copies.
**
** --------------------------------------------------------------------
**
** File     : DW_axi_x2x_w_ch_fifos.v
** Abstract : This block implements fifos for the write data channel.
**
**            Single or dual clock fifo's may be selected.
**
**            The majority of clock boundary crossing within the 
**            DW_axi_x2x is handled in this block.
**
** --------------------------------------------------------------------
*/

module x32_DW_axi_x2x_w_ch_fifos (
  // Inputs - Push Side 
  clk_push_i,
  resetn_push_i,

  bus_push_req_n_i,
  data_i,
  
  // Outputs - Push Side
  bus_push_full_o,


  // Inputs - Pop Side 
  clk_pop_i,
  resetn_pop_i,

  bus_pop_req_n_i,
  
  // Outputs - Pop Side
  bus_pop_empty_o,
  bus_data_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------

  // INTERFACE PARAMETERS - MUST BE SET BY INSTANTIATION
  parameter DUAL_CLK = 0; // Controls wether single or dual clock
                          // fifos are implemented.

  parameter PUSH_SYNC_DEPTH = 2; // Number of synchroniser registers to
                                 // use in push side of dual clock fifos.

  parameter POP_SYNC_DEPTH = 2; // Number of synchroniser registers to
                                // use in pop side of dual clock fifos.
			   
			   
  parameter NUM_FIFOS = 1; // Controls how many fifos will be 
                           // implemented. Maximum of 16.			

  parameter DATA_W = 0; // Controls the width of each fifo.

  parameter DEPTH = 0; // Controls the depth of each fifo.

  parameter LOG2_DEPTH = 0; // Log base 2 of DEPTH.

  parameter LOG2_DEPTH_P1 = 0; // Log base 2 of DEPTH + 1.

  parameter BUS_DATA_W = 0; // Width of bus of data signals.


  // INTERNAL PARAMETERS - MUST NOT BE SET BY INSTANTIATION
  parameter MAX_NUM_FIFOS = 8; // Maximum number of fifos in this 
                               // block.

  parameter MAX_DATA_W = MAX_NUM_FIFOS * DATA_W; // Max width of bus
                                                 // data signal.

//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------
 

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------
  
  // Inputs - Push Side 
  input clk_push_i; // Push side clk.
  input resetn_push_i; // Push side reset.

  input [NUM_FIFOS-1:0] bus_push_req_n_i; // Bus of push request signals
                                          // for each fifo.

  input [DATA_W-1:0] data_i; // Payload vector for each fifo.
  
  // Outputs - Push Side
  output [NUM_FIFOS-1:0] bus_push_full_o; // Bus of full status signals
                                          // from each fifo.


  // Inputs - Pop Side 
  input clk_pop_i; // Pop side clk.
  input resetn_pop_i; // Pop side reset.

  input [NUM_FIFOS-1:0] bus_pop_req_n_i; // Bus of pop request signals
                                         // for each fifo.

  // Outputs - Pop Side
  output [NUM_FIFOS-1:0] bus_pop_empty_o; // Bus of empty status signals
                                          // from each fifo.

  output [BUS_DATA_W-1:0] bus_data_o; // Bus of data vectors from
                                      // each fifo.


  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------

  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  
// Dummy wires - used to suppress unconnected ports warnings by Leda tool - BR - 2/24/2010
  wire [NUM_FIFOS-1:0] fifo_ae_unconn, fifo_hf_unconn, fifo_af_unconn, fifo_error_unconn;
  
  wire [NUM_FIFOS-1:0] fifo_push_e_unconn, fifo_push_ae_unconn, fifo_push_hf_unconn, fifo_push_af_unconn, fifo_push_error_unconn;
  wire [NUM_FIFOS*LOG2_DEPTH_P1-1:0] fifo_push_wc_unconn; 
  wire [NUM_FIFOS-1:0] fifo_pop_e_unconn, fifo_pop_ae_unconn, fifo_pop_hf_unconn, fifo_pop_af_unconn, fifo_pop_error_unconn;
  wire [NUM_FIFOS*LOG2_DEPTH_P1-1:0] fifo_pop_wc_unconn; 
  wire [NUM_FIFOS-1:0] fifo_t_unconn;
    
  //--------------------------------------------------------------------
  // Assign bussed input signals to max width signals.
  //--------------------------------------------------------------------


  //--------------------------------------------------------------------
  // Note ifdefs are used to remove unecessary fifos, for this module
  // there will only be more than 1 single or dual clock fifo if 
  // X2X_HAS_WI_FAN_OUT == 1, in this case there are multiple slave
  // ports on the the X2X (write channels only) , so we use the
  // macros X2X_SP[x] to tell us wheter or not to include a particular
  // fifo.
  //--------------------------------------------------------------------




  //--------------------------------------------------------------------
  // Instantiate dual clock fifo's 
  //--------------------------------------------------------------------
genvar gvdf;
generate
  for (gvdf=0; gvdf < NUM_FIFOS; gvdf=gvdf+1) begin:Unrollbcm66
    x32_DW_axi_x2x_bcm66
    
    #(DATA_W,           // Word width.
      DEPTH,            // Word depth.
      LOG2_DEPTH,	      // Fifo address width.
      LOG2_DEPTH_P1,    // Count width.
      1,                // push ae_level, don't care.
      1,                // push af_level, don't care.
      1,                // pop ae_level, don't care.
      1,                // pop af_level, don't care.
      0,                // err_mode, don't care.
      PUSH_SYNC_DEPTH,  // Push sync mode.
      POP_SYNC_DEPTH,   // Pop sync mode.
      0,                // Reset mode, asynch. reset including memory.
      0		      // No test input, leave to scan test tool.
    )
    U_dclk_fifo0 (
      // Push side - Inputs
      .clk_push        (clk_push_i),
      .rst_push_n      (resetn_push_i),
  
      .push_req_n      (bus_push_req_n_i[gvdf]),
      .data_in         (data_i),
  
      // Push side - Outputs
      .push_full       (bus_push_full_o[gvdf]),
  
      // Push side - Unconnected / Tied off.
      .init_push_n     (1'b1), // Tied to 1'b1.
      .push_empty      (fifo_push_e_unconn[gvdf]),
      .push_ae         (fifo_push_ae_unconn[gvdf]),
      .push_hf         (fifo_push_hf_unconn[gvdf]),
      .push_af         (fifo_push_af_unconn[gvdf]),
      .push_error      (fifo_push_error_unconn[gvdf]),
      .push_word_count (fifo_push_wc_unconn[gvdf*LOG2_DEPTH_P1+:LOG2_DEPTH_P1]),
  
      // Pop side - Inputs
      .clk_pop         (clk_pop_i),
      .rst_pop_n       (resetn_pop_i),
      .pop_req_n       (bus_pop_req_n_i[gvdf]),
  
      // Pop side - Outputs
      .pop_empty       (bus_pop_empty_o[gvdf]),
      .data_out        (bus_data_o[gvdf*DATA_W+:DATA_W]),
  
      // Pop side - Unconnected / tied off
      .init_pop_n      (1'b1), // Never using diagnostic mode.
      .pop_ae          (fifo_pop_e_unconn[gvdf]),
      .pop_hf          (fifo_pop_ae_unconn[gvdf]),
      .pop_af          (fifo_pop_hf_unconn[gvdf]),
      .pop_full        (fifo_pop_af_unconn[gvdf]),
      .pop_error       (fifo_pop_error_unconn[gvdf]),
      .pop_word_count  (fifo_pop_wc_unconn[gvdf*LOG2_DEPTH_P1+:LOG2_DEPTH_P1]),
      
      // Test mode inputs
      .test            (1'b0)
    );
  end
endgenerate 


endmodule
