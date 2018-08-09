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
// W control in MP including fanout
/////////////////////////////////////////////////////////////////////////

module x128_DW_axi_x2x_mp_w (
 //inputs
  aclk,
  aresetn,
  valid_i,
  payload_i,
  lp_active_i,
  awid_i,
  awact_i,
  push_full_i, 
  
 //outputs
  push_req_n_o,
  payload_o,
  ready_o,

  // Debug ports
  dbg_bus_push_req_n_o
);

  //parameters
  parameter NUM_PORTS = `X2X_NUM_W_PORTS;     //number of fanout ports
  parameter ID_LHS    = `X2X_WPYLD_ID_LHS_MP; //LHS of ID
  parameter ID_RHS    = `X2X_WPYLD_ID_RHS_MP; //RHS of ID
  parameter PLD_W     = `X2X_WPYLD_W_MP;      //payload width
  parameter MP_IDW    = `X2X_MP_IDW;          //ID width of MP
  //internal parameters
  parameter BUS_ID_W  = NUM_PORTS * MP_IDW;   //MP ID width of BUS
  parameter MAX_ID_W  = 8 * MP_IDW;           //Max BUS ID width

  //inputs
  input                  aclk;         //clock at MP
  input                  aresetn;      //reset active low
  input                  valid_i;      //valid signal
  input [PLD_W-1:0]      payload_i;    //payload in
  input                  lp_active_i;  // 1 in low power mode.
  input [BUS_ID_W-1:0]   awid_i;       //ID from AW of SP
  input [NUM_PORTS-1:0]  awact_i;      //active ID flag
  input [NUM_PORTS-1:0]  push_full_i;  //push full flag
  
  //outputs
  output [NUM_PORTS-1:0] push_req_n_o; //push enable to port 1
  output [PLD_W-1:0]     payload_o;    //payload to port
  output                 ready_o;      //ready signal to AXI master

  // Debug ports
  output dbg_bus_push_req_n_o;


  wire [MP_IDW-1:0]    wid;
  reg  [MP_IDW-1:0]    awid;
  reg                  ready_f;
  reg  [NUM_PORTS-1:0] push_req_n;
  wire                 ready_o;
  wire [PLD_W-1:0]     payload_o;
  wire [NUM_PORTS-1:0] push_req_n_o;
  integer              i, j;

  reg [NUM_PORTS-1:0] dbg_push_req_n; 

  ////////////////////////////////////////////////////////////
  // decode wid to put payload to corresponding FIFO.
  // If ID matches one port ID, forward payload to that FIFO
  ////////////////////////////////////////////////////////////

  assign payload_o = payload_i;

  // Hold ready out low during low power mode.
  assign ready_o         = !push_full_i[0] & ~lp_active_i;
  assign push_req_n_o[0] = !(valid_i && ready_o);



endmodule
