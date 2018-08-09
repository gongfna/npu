/////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
/////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
// R and B channel RTL in MP
/////////////////////////////////////////////////////////////////////////

module DW_axi_x2x_mp_rb (
 //inputs
  ready_i,
  pop_empty_i,
  payload_i,
  
 //outputs
  valid_o,
  pop_req_n_o,
  payload_o
);

  //parameters
  parameter PLD_W = `X2X_RPYLD_W_MP;  //payload width

  //inputs
  input              ready_i;      //ready signal
  input              pop_empty_i;  //pop_empty flag, active high
  input [PLD_W-1:0]  payload_i;    //input payload
  
  //outputs
  output             valid_o;      //valid signal
  output             pop_req_n_o;  //pop enable, active low
  output [PLD_W-1:0] payload_o;    //output payload


  wire               valid_o;
  wire               pop_req_n_o;
  wire [PLD_W-1:0]   payload_o;


  ///////////////////////////////////////////////////////
  // If FIFO empty, no more data valid.
  // so valid must be deasserted.
  ///////////////////////////////////////////////////////
  assign valid_o = !pop_empty_i;

  ///////////////////////////////////////////////////////
  // If FIFO empty or AXI master not ready, no more pop
  ///////////////////////////////////////////////////////
  assign pop_req_n_o = !(valid_o && ready_i);

  ///////////////////////////////////////////////////////
  // payload just passes as-is
  ///////////////////////////////////////////////////////
  assign payload_o = payload_i;

endmodule



