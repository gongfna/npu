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
// ID maintain and reg active block (write fanout control) in AW of MP
/////////////////////////////////////////////////////////////////////////


module dma_m_DW_axi_x2x_mp_wfc (
 //inputs
  aclk,
  aresetn,
  avalid_i,
  apayload_i,
  apush_full_i,
  bid_i,
  bvalid_i,
  bready_i,

 //outputs
  awid_o,
  awact_o,
  f_port_num_o,
  f_stall_o
);

  //parameters
  parameter AW_PLD_W  = `X2X_AWPYLD_W_MP;       //AW payload width of MP
  parameter NUM_PORTS = `X2X_NUM_W_PORTS;       //number of fanout ports
  parameter MP_IDW    = `X2X_MP_IDW;            //ID width of MP
  parameter IDACTW    = `X2X_MAX_WCA_ID_P1L2;   //width of per act ID
  parameter ID_LS     = `X2X_AWPYLD_ID_LHS_MP;  //ID left side bit of MP
  parameter ID_RS     = `X2X_AWPYLD_ID_RHS_MP;  //ID right side bit of MP
  parameter WCA_ID    = `X2X_MAX_WCA_ID;        //number per active ID
  //internal parameters
  parameter BUS_ID_W  = NUM_PORTS * MP_IDW;     //MP ID width of BUS
  parameter BUS_IDACTW = NUM_PORTS * IDACTW;    //BUS width of  act ID
  parameter NUM_PORT_W = `X2X_LOG2_NUM_W_PORTS; //port number width

  //inputs
  input                   aclk;         //clock
  input                   aresetn;      //reset, act low
  input                   avalid_i;     //valid signal from AXI master
  input [AW_PLD_W-1:0]    apayload_i;   //payload from AXI master
  input                   apush_full_i; //push full signal from AW FIFO
  input [MP_IDW-1:0]      bid_i;        //ID from B of MP
  input                   bvalid_i;     //valid from B of MP
  input                   bready_i;     //ready from B of MP
  
  //outputs
  output [BUS_ID_W-1:0]   awid_o;       //ID bus to W of MP 
  output [NUM_PORTS-1:0]  awact_o;      //port active flag
  output [NUM_PORT_W-1:0] f_port_num_o; //port # of current xact go thru
  output                  f_stall_o;    //stall signal to stop AW xact


  wire [NUM_PORT_W-1:0] f_port_num_o;      //port number for this xact
  reg [NUM_PORT_W-1:0]  f_match_port_num;  //port number for this xact
  reg [NUM_PORT_W-1:0]  f_free_port_num;   //port number for this xact
  wire                  f_stall_o;         //fanout stall
  reg                   f_match_stall;     //fanout stall
  reg                   f_free_stall;      //fanout stall
  wire [MP_IDW-1:0]     aid;               //aid to be held for use
  reg  [BUS_ID_W-1:0]   awid_r;            //registered BUS MP_IDW
  reg  [BUS_ID_W-1:0]   awid;              //BUS free ID value
  reg  [MP_IDW-1:0]     awid_b;            //catch temperary ID from 
                                           //registered ID for B channel.
                                           //If match B id and 
                                           //bvalid/bready, -1 xact num. 
  reg  [MP_IDW-1:0]     awid_a;            //catch temperary ID from
                                           //registered ID for A channel.
                                           //If match A id, +1 xact num.

  reg  [BUS_IDACTW-1:0] awact_m1;          //-1 of act ID num if one reg
                                           //id matches B id.
  wire [BUS_IDACTW-1:0] awact_bus;         //act num per ID with bus.
  reg  [BUS_IDACTW-1:0] awact_p1;          //+1 of act ID num if one reg
                                           //id matches A id.
  reg  [BUS_IDACTW-1:0] awact_free;        //act ID num is 1 if one reg
                                           //is free and no the other
                                           //reg IDs match the aid.
  reg  [BUS_IDACTW-1:0] awact_r;           //reg bus act ID value
  reg  [IDACTW-1:0]     awact_tb;          //temperary awact value from
                                           //awact_r for bid_i.
  reg  [IDACTW-1:0]     awact_tm1;         //temperary value of awact_tb
                                           // - 1.
  reg  [IDACTW-1:0]     awact_tp1;         //temperary value 
  reg  [IDACTW-1:0]     awact_use3;        //held value of num of act ID
  reg  [IDACTW-1:0]     awact_cm1;         //catch per ID value from
                                           //awact_m1 to find matching
                                           //aid value.
  reg  [IDACTW-1:0]     awact_fm1;         //catch per ID value from
                                           //awact_m1 to find free reg
                                           //to locate aid value if no
                                           //matching reg ids.
  reg                   aid_match;         //AID match flag
  reg                   aid_free;          //AID free flag


  integer               i, j;


  // Remove all logic if write fan out is not configured to exist.
  // Drive to known values if write fan out is not configured to exist.
  assign awid_o       = {BUS_ID_W{1'b0}};
  assign awact_o      = {NUM_PORTS{1'b0}};
  assign f_port_num_o = {NUM_PORT_W{1'b0}};
  assign f_stall_o    = 1'b0;

endmodule


