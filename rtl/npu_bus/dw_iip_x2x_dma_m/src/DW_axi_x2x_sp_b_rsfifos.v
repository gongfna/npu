/* ---------------------------------------------------------------------
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
** ---------------------------------------------------------------------
**
** File     : DW_axi_x2x_sp_b_rsfifos.v
** Abstract : This block implements up to 32 single clock fifo's, with 
**            bused push, pop, status and output data signals. All fifos
**            share the same data input.
**
** ---------------------------------------------------------------------
*/

module dma_m_DW_axi_x2x_sp_b_rsfifos (
  // Inputs - Push Side 
  clk_i,
  resetn_i,

  bus_push_req_n_i,
  data_i,
  
  // Outputs - Push Side
  bus_push_full_o,


  // Inputs - Pop Side 
  bus_pop_req_n_i,
  
  // Outputs - Pop Side
  bus_pop_empty_o,
  bus_pop_empty_nxt_o,
  bus_data_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------

  // INTERFACE PARAMETERS - MUST BE SET BY INSTANTIATION
  parameter NUM_FIFOS = 1; // Controls how many fifos will be 
                           // implemented. Maximum of 32.			

  parameter DATA_W = 0; // Controls the width of each fifo.

  parameter DEPTH = 0; // Controls the depth of each fifo.

  parameter LOG2_DEPTH = 0; // Log base 2 of DEPTH.

  parameter BUS_DATA_W = 0; // Width of bus of data signals.

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------
  
  // Inputs - Push Side 
  input clk_i; 
  input resetn_i; 

  input [NUM_FIFOS-1:0] bus_push_req_n_i; // Bus of push request signals
                                          // for each fifo.

  input [DATA_W-1:0] data_i; // Payload vector for each fifo.
  
  // Outputs - Push Side
  output [NUM_FIFOS-1:0] bus_push_full_o; // Bus of full status signals
                                          // from each fifo.


  // Inputs - Pop Side 
  input [NUM_FIFOS-1:0] bus_pop_req_n_i; // Bus of pop request signals
                                         // for each fifo.

  // Outputs - Pop Side
  output [NUM_FIFOS-1:0] bus_pop_empty_o; // Bus of empty status signals
                                          // from each fifo.

  output [NUM_FIFOS-1:0] bus_pop_empty_nxt_o; // Bus of pre registered
                                              // empty status signals
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

//--------------------------------------------------------------------
// Instantiate single clock fifo's 
//--------------------------------------------------------------------
genvar gvf;
generate
  for (gvf=0; gvf < NUM_FIFOS; gvf=gvf+1) begin: UnrollFIFOs
    dma_m_DW_axi_x2x_fifo_s1_sf
    
    #(DATA_W,    // Word width.
      DEPTH,     // Word depth.  
      1,         // ae_level, don't care.
      1,         // af_level, don't care.
      0,         // err_mode, don't care.
      0,         // Reset mode, asynch. reset including memory.
      LOG2_DEPTH // Fifo address width.
    )
    U_fifo (
      .clk            (clk_i),   
      .rst_n          (resetn_i),
      .init_n         (1'b1), // Synchronous reset, not used.
  
      // Push side - Inputs
      .push_req_n     (bus_push_req_n_i[gvf]),
      .data_in        (data_i),   
      
      // Push side - Outputs
      .full           (bus_push_full_o[gvf]), 
  
      // Pop side - Inputs
      .pop_req_n      (bus_pop_req_n_i[gvf]),   
      
      // Pop side - Outputs
      .data_out       (bus_data_o[gvf*DATA_W+:DATA_W]),
      .empty          (bus_pop_empty_o[gvf]),
      .nxt_empty      (bus_pop_empty_nxt_o[gvf]),
  
      // Unconnected or tied off.
      .diag_n         (1'b1), // Never using diagnostic mode.
      .almost_empty   (fifo_ae_unconn[gvf]),
      .half_full      (fifo_hf_unconn[gvf]),
      .almost_full    (fifo_af_unconn[gvf]),
      .error          (fifo_error_unconn[gvf])
    );
  end
endgenerate

endmodule
