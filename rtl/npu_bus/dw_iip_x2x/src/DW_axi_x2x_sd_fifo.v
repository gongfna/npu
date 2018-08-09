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
** File     : DW_axi_x2x_sd_fifo.v
** Abstract : This block implements either 1 dual clock fifo or 1
**            single clock fifo.
**
** --------------------------------------------------------------------
*/

module DW_axi_x2x_sd_fifo (
  // Inputs - Push Side 
  clk_push_i,
  resetn_push_i,

  push_req_n_i,
  data_i,
  
  // Outputs - Push Side
  push_full_o,


  // Inputs - Pop Side 
  clk_pop_i,
  resetn_pop_i,

  pop_req_n_i,
  
  // Outputs - Pop Side
  pop_empty_o,
  data_o
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
			   
  parameter DATA_W = 0; // Controls the width of each fifo.

  parameter DEPTH = 0; // Controls the depth of each fifo.

  parameter LOG2_DEPTH = 0; // Log base 2 of DEPTH.

  parameter LOG2_DEPTH_P1 = 0; // Log base 2 of DEPTH + 1.


//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------
  
  // Inputs - Push Side 
  input clk_push_i; // Push side clk.
  input resetn_push_i; // Push side reset.

  input push_req_n_i; // Push request.

  input [DATA_W-1:0] data_i; // Data in for fifo.
  
  // Outputs - Push Side
  output push_full_o; // Full status signal from fifo.


  // Inputs - Pop Side 
  input clk_pop_i; // Pop side clk.
  input resetn_pop_i; // Pop side reset.

  input pop_req_n_i; // Pop request signal for fifo.

  // Outputs - Pop Side
  output pop_empty_o; // Empty status signal from fifo.

  output [DATA_W-1:0] data_o; // Data out from fifo.


  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  wire [DATA_W-1:0] sclk_data_o; // Single clock fifo output signals.
  wire sclk_push_full_o;
  wire sclk_pop_empty_o;

  wire [DATA_W-1:0] dclk_data_o; // Dual clock fifo output signals.
  wire dclk_push_full_o;
  wire dclk_pop_empty_o;

// Dummy wires - used to suppress unconnected ports warnings by Leda tool - BR - 2/24/2010
  wire push_e_unconn, push_ae_unconn, push_hf_unconn, push_af_unconn, push_error_unconn;
  wire [LOG2_DEPTH_P1-1:0] push_wc_unconn; 
  wire pop_ae_unconn, pop_hf_unconn, pop_af_unconn, pop_f_unconn, pop_error_unconn; 
  wire [LOG2_DEPTH_P1-1:0] pop_wc_unconn; 
  wire ae_unconn, hf_unconn, af_unconn, error_unconn, t_unconn; 



  //--------------------------------------------------------------------
  // Instantiate dual clock fifo.
  //--------------------------------------------------------------------
  DW_axi_x2x_bcm66
  
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
  U_dclk_fifo (
    // Push side - Inputs
    .clk_push        (clk_push_i),
    .rst_push_n      (resetn_push_i),

    .push_req_n      (push_req_n_i),
    .data_in         (data_i),

    // Push side - Outputs
    .push_full       (dclk_push_full_o),

    // Push side - Unconnected / Tied off.
    .init_push_n     (1'b1), // Tied to 1'b1.
    .push_empty      (push_e_unconn),
    .push_ae         (push_ae_unconn),
    .push_hf         (push_hf_unconn),
    .push_af         (push_af_unconn),
    .push_error      (push_error_unconn), 
    .push_word_count (push_wc_unconn),

    // Pop side - Inputs
    .clk_pop         (clk_pop_i),
    .rst_pop_n       (resetn_pop_i),
    .pop_req_n       (pop_req_n_i),

    // Pop side - Outputs
    .pop_empty       (dclk_pop_empty_o),
    .data_out        (dclk_data_o),

    // Pop side - Unconnected / tied off
    .init_pop_n      (1'b1), // Never using diagnostic mode.
    .pop_ae          (pop_ae_unconn),
    .pop_hf          (pop_hf_unconn),
    .pop_af          (pop_af_unconn),
    .pop_full        (pop_f_unconn),
    .pop_error       (pop_error_unconn), 
    .pop_word_count  (pop_wc_unconn),
    
    // Test mode inputs
    .test            (1'b0) // NOT USING TEST MODE.
  );


  //--------------------------------------------------------------------
  // Connect either dual or single clock fifo output signals.
  //--------------------------------------------------------------------
  assign push_full_o = DUAL_CLK ? dclk_push_full_o : sclk_push_full_o;

  assign pop_empty_o = DUAL_CLK ? dclk_pop_empty_o : sclk_pop_empty_o;

  assign data_o = DUAL_CLK ? dclk_data_o : sclk_data_o;

endmodule
