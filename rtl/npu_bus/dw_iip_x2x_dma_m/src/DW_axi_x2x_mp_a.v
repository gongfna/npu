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
** File     : DW_axi_x2x_mp_a.v
** Abstract : Converts X2X master port address channel signals to
**            a fifo push interface signaling.
**
** --------------------------------------------------------------------
*/

module dma_m_DW_axi_x2x_mp_a (
  // System Inputs
  aclk_i,
  aresetn_i,

  // AXI Interface
  // Inputs
  valid_i,
  payload_i,

  // Outputs
  ready_o,
  
  // FIFO Push Interface
  // Inputs
  push_full_i,

  // Outputs
  push_req_n,
  payload_o,

  // Write Fanout
  // Inputs
  bid_i,
  bvalid_i,
  bready_i,

  //lowpower stall input

  // Outputs
  awid_o,
  awact_o,

  // Debug ports
  dbg_push_req_n_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter WRITE_CH = 1; //1 -> write channel, 0 -> read channel
  parameter PYLD_W = `X2X_AWPYLD_W_MP; //payload width of AW or AR of MP
  parameter CH_FIFO_W = `X2X_AW_CH_FIFO_W; //payload width in FIFO
  parameter INC_WRITE_FANOUT = WRITE_CH && `X2X_HAS_WI_FAN_OUT; 
                               //AW channel & fanout, 1. Otherwise, 0
  parameter NUM_PORTS = `X2X_NUM_W_PORTS; //number of fanout ports
  parameter MP_IDW    = `X2X_MP_IDW;      //ID width of MP
  parameter IDACTW    = `X2X_MAX_WCA_ID_P1L2; //width of per act ID

  //internal parameters
  parameter BUS_ID_W  = NUM_PORTS * MP_IDW; //MP ID width of BUS
  parameter MAX_ID_W  = 8 * MP_IDW;         //Max BUS ID width
  parameter MAX_IDA_W = 8 * IDACTW;         //Max BUS ACT ID width
  parameter NUM_PORT_W = `X2X_LOG2_NUM_W_PORTS; //port number width

//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------
  // System Inputs
  input aclk_i;
  input aresetn_i;

  // AXI Interface
  // Inputs
  input valid_i; // Valid from channel source.
  input [PYLD_W-1:0] payload_i; // Payload from channel source.

  // Outputs
  output ready_o; // Ready to channel source.
  wire   ready_o;
  
  // FIFO Push Interface
  // Inputs
  input push_full_i; // Full status from channel fifo.

  // Outputs
  output push_req_n; // Push request to channel fifo.
  wire   push_req_n; 

  output [CH_FIFO_W-1:0] payload_o; // Channel payload to channel fifo.
  wire   [CH_FIFO_W-1:0] payload_o;

  // Write fanout
  // Inputs
  input  [MP_IDW-1:0] bid_i; //ID from B of MP
  input               bvalid_i; //valid from B of MP
  input               bready_i; //ready from B of MP

  //lowpower stall

  // Outputs
  output [BUS_ID_W-1:0]  awid_o;      //ID to W of MP
  output [NUM_PORTS-1:0] awact_o;     //ID active to W of MP

  // Debug Ports
  output dbg_push_req_n_o;


  wire                  f_stall;    //fanout stall signal
  wire [NUM_PORT_W-1:0] f_port_num; //fanout port number
  wire [BUS_ID_W-1:0]  awid_o;      //ID to W of MP
  wire [NUM_PORTS-1:0] awact_o;     //ID active to W of MP
  wire [BUS_ID_W-1:0]  awid_wf;     //ID to W of MP
  wire [NUM_PORTS-1:0] awact_wf;    //ID active to W of MP


  //instance DW_axi_x2x_fanout to locate write fanout ports
  dma_m_DW_axi_x2x_mp_wfc
  
  #(PYLD_W,
    NUM_PORTS,
    MP_IDW,
    IDACTW
   )
  U_mp_fanout (
   //inputs
    .aclk         ( aclk_i ),
    .aresetn      ( aresetn_i ),
    .avalid_i     ( valid_i ),
    .apayload_i   ( payload_i ),
    .apush_full_i ( push_full_i ),
    .bid_i        ( bid_i ), 
    .bvalid_i     ( bvalid_i ),
    .bready_i     ( bready_i ),

   //outputs
    .awid_o       ( awid_wf ),
    .awact_o      ( awact_wf ),
    .f_port_num_o ( f_port_num ),
    .f_stall_o    ( f_stall )
  );

  //write fanout mux
  assign awid_o  = INC_WRITE_FANOUT ? awid_wf : 0;
  assign awact_o = INC_WRITE_FANOUT ? awact_wf : 0;
  
  // Active low push request.
  // Asserted when source has valid data and the destination
  // fifo is not full.
  // If write fanout and stall, no push.
  assign push_req_n =                      (INC_WRITE_FANOUT ? (f_stall ? 1'b1 :
                      ~(valid_i && !push_full_i)) :
                      ~(valid_i && !push_full_i));


  // Straight through connection.
  // If write fanout, need port number.
  // Otherwise, port number = 0.
  assign payload_o =                     ((NUM_PORTS == 1) ? payload_i :
                     (INC_WRITE_FANOUT ? {f_port_num,payload_i} :
                                        payload_i));


  // Ready to channel source.
  // Asserted whenever the destination fifo is NOT full.
  // If write fanout & stall, no ready asserted.
  assign ready_o =                   (INC_WRITE_FANOUT ? (f_stall ? 1'b0 :
                   !push_full_i) : !push_full_i);



endmodule
