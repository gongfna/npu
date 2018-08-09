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
** File     : DW_axi_x2x_mp.v
** Abstract : Master port block for DW_axi_x2x.
**
** --------------------------------------------------------------------
*/

module x256_DW_axi_x2x_mp (
  // System inputs
  aclk_i,
  aresetn_i,
  
  // AR EXTERNAL
  // Inputs
  arvalid_i,
  arpayload_i,

  // Outputs
  arready_o,

  // AR INTERNAL
  // Inputs
  ar_push_full_i,
  lp_stall_ar_i,
  
  // Outputs
  ar_push_req_n_o,
  arpayload_o,


  // R EXTERNAL
  // Inputs
  rready_i,

  // Outputs
  rvalid_o,
  rpayload_o,

  // R INTERNAL
  // Inputs
  r_pop_empty_i,
  rpayload_i,
  
  // Outputs
  r_pop_req_n_o,

  // AW EXTERNAL
  // Inputs
  awvalid_i,
  awpayload_i,

  // Outputs
  awready_o,

  // AW INTERNAL
  // Inputs
  aw_push_full_i,
  lp_stall_aw_i,
  
  // Outputs
  aw_push_req_n_o,
  awpayload_o,


  // W EXTERNAL
  // Inputs
  wvalid_i,
  wpayload_i,
  lp_active_i,

  // Outputs
  wready_o,


  // W INTERNAL
  
  // Inputs
  w_bus_push_full_i,
  
  // Outputs
  w_bus_push_req_n_o,
  wpayload_o,


  // B EXTERNAL
  // Inputs
  bready_i,

  // Outputs
  bvalid_o,
  bpayload_o,

  // B INTERNAL
  // Inputs
  b_pop_empty_i,
  bpayload_i,
  
  // Outputs
  b_pop_req_n_o,

  // Debug ports.
  dbg_aw_chf_push_req_n_o,
  dbg_bus_w_chf_push_req_n_o,
  dbg_ar_chf_push_req_n_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------

  // INSTANTIAION PARAMETERS - Must be set by instantiation.
  parameter AWPYLD_W = 0; // Width of write address channel payload.
  parameter WPYLD_W  = 0; // Width of write channel payload.
  parameter BPYLD_W  = 0; // Width of burst response channel payload.
  parameter ARPYLD_W = 0; // Width of read address channel payload.
  parameter RPYLD_W  = 0; // Width of read channel payload.

  // NON-INSTANTIAION PARAMETERS - Must not be set by instantiation.
  parameter AW_CH_FIFO_W = `X2X_AW_CH_FIFO_W; // Width of AW channel 
                                              // fifo.

  parameter NUM_W_PORTS = `X2X_NUM_W_PORTS; // Number of write ports 
                                            // for fan out enabled
					    // configs.

  parameter MP_ID_W = `X2X_MP_IDW; // Width of ID at MP.					    
  // Width of bus containing an MP ID for each write port.
  parameter BUS_MP_ID_W = NUM_W_PORTS * MP_ID_W; 


//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

  input aclk_i;
  input aresetn_i;

  // AR EXTERNAL
  // Inputs
  input arvalid_i;
  input [ARPYLD_W-1:0] arpayload_i;

  // Outputs
  output arready_o;

  // AR INTERNAL
  // Inputs
  input ar_push_full_i; // Channel fifo status bit.
  input lp_stall_ar_i; // Stall AR channel as active read counter is
                       // at its maximum value. Only active for a 
		       // transaction non altering configuration.

  
  // Outputs
  output ar_push_req_n_o; // Push request to channel fifo.
  output [ARPYLD_W-1:0] arpayload_o; // Payload to channel fifo.
  

  // R EXTERNAL
  // Inputs
  input rready_i;

  // Outputs
  output rvalid_o;
  output [RPYLD_W-1:0] rpayload_o;

  // R INTERNAL
  // Inputs
  input r_pop_empty_i; // Channel fifo status bit.
  input [RPYLD_W-1:0] rpayload_i; // Payload from channel fifo.
  
  // Outputs
  output  r_pop_req_n_o; // Pop request to channel fifo.


  // AW EXTERNAL
  // Inputs
  input awvalid_i; 
  input [AWPYLD_W-1:0] awpayload_i;

  // Outputs
  output awready_o;

  // AW INTERNAL
  // Inputs
  input aw_push_full_i; // Channel fifo status bit.
  input lp_stall_aw_i; // Stall AW channel as active write counter is
                       // at its maximum value. Only active for a 
		       // transaction non altering configuration.

  
  // Outputs
  output aw_push_req_n_o; // Push request to channel fifo.
  output [AW_CH_FIFO_W-1:0] awpayload_o; // Payload to channel fifo.
  

  // W EXTERNAL
  // Inputs
  input wvalid_i;
  input [WPYLD_W-1:0] wpayload_i;
  input lp_active_i; // 1 in low power mode.

  // Outputs
  output wready_o;

  // W INTERNAL - Note that for write interleaving fan out there
  //              can be more than one write data port on the
  //              X2X SP. There are bussed signals internally
  //              also because we implement a seperate write 
  //              data channel buffer for every write interleaving
  //              depth in this case.
  
  // Inputs
  // Bus of fifo status bits for all channel fifos.
  input [`X2X_NUM_W_PORTS-1:0] w_bus_push_full_i;
  
  // Outputs
  // Bus of push require signals for all channel fifos.
  output [`X2X_NUM_W_PORTS-1:0] w_bus_push_req_n_o;
  output [WPYLD_W-1:0] wpayload_o; // Payload to all channel fifos.


  // B EXTERNAL
  // Inputs
  input bready_i;

  // Outputs
  output bvalid_o;
  output [BPYLD_W-1:0] bpayload_o;

  // B INTERNAL
  // Inputs
  input b_pop_empty_i; // Channel fifo status bit.
  input [BPYLD_W-1:0] bpayload_i; // Payload from channel fifo.
  
  // Outputs
  output  b_pop_req_n_o; // Pop request to channel fifo.

  // Debug ports.
  output dbg_aw_chf_push_req_n_o;
  output [`X2X_NUM_W_PORTS-1:0] dbg_bus_w_chf_push_req_n_o;
  output dbg_ar_chf_push_req_n_o;

  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  
  // Write fan out communication from AW -> W & B -> AW.
  wire [NUM_W_PORTS-1:0] bus_awact;
  wire [BUS_MP_ID_W-1:0] bus_awid;
  wire [MP_ID_W-1:0]     bid;

// Dummy wires - used to suppress unconnected ports warnings by Leda tool - BR - 2/24/2010
  wire [`X2X_NUM_W_PORTS*`X2X_MP_IDW-1:0] awid_o_unconn;
  wire [`X2X_NUM_W_PORTS-1:0] awact_o_unconn; 
   
  //--------------------------------------------------------------------
  // Read address channel.
  //--------------------------------------------------------------------
  x256_DW_axi_x2x_mp_a
   
  #( 0,       //read channel
     ARPYLD_W, // Channel payload width.
     ARPYLD_W //AR Channel FIFO width
  )
  U_AR_DW_axi_x2x_mp_a (
    // System Inputs
    .aclk_i      (aclk_i),
    .aresetn_i   (aresetn_i),

    // AXI Interface
    // Inputs
    .valid_i     (arvalid_i),
    .payload_i   (arpayload_i),

    // Outputs
    .ready_o     (arready_o),
  
    // FIFO Push Interface
    // Inputs
    .push_full_i (ar_push_full_i),

    // Outputs
    .push_req_n  (ar_push_req_n_o),
    .payload_o   (arpayload_o),
  
    // Pending t/x Interface
  
    // Write Fanout
    // Inputs
    .bid_i        ({MP_ID_W{1'b0}}), // Not necessary for AR channel.
    .bvalid_i     (1'b0), // Not necessary for AR channel.
    .bready_i     (1'b0), // Not necessary for AR channel.
  
    // Outputs
    .awid_o       (awid_o_unconn),
    .awact_o      (awact_o_unconn),

    // Debug ports
    .dbg_push_req_n_o (dbg_ar_chf_push_req_n_o)
  );

  
  //--------------------------------------------------------------------
  // Read data channel.
  //--------------------------------------------------------------------
  x256_DW_axi_x2x_mp_rb
   
  #( RPYLD_W // Channel payload width.
  )
  U_DW_axi_x2x_mp_r ( 
    //inputs
    .ready_i     (rready_i),
    .pop_empty_i (r_pop_empty_i),
    .payload_i   (rpayload_i),
  
    //outputs
    .valid_o     (rvalid_o),
    .pop_req_n_o (r_pop_req_n_o),
    .payload_o   (rpayload_o)
  );



  //--------------------------------------------------------------------
  // Write address channel.
  //--------------------------------------------------------------------
  x256_DW_axi_x2x_mp_a
   
  #( 1,             //write channel
     AWPYLD_W,      // Channel payload width.
     AW_CH_FIFO_W   // AW channel fifo width.
  )
  U_AW_DW_axi_x2x_mp_a (
    // System Inputs
    .aclk_i      (aclk_i),
    .aresetn_i   (aresetn_i),

    // AXI Interface
    // Inputs
    .valid_i     (awvalid_i),
    .payload_i   (awpayload_i),

    // Outputs
    .ready_o     (awready_o),
  
    // FIFO Push Interface
    // Inputs
    .push_full_i (aw_push_full_i),

    // Outputs
    .push_req_n  (aw_push_req_n_o),
    .payload_o   (awpayload_o),
   

    // Pending t/x Interface
  
    
    // Write Fanout
    // Inputs
    .bid_i        (bid), 
    .bvalid_i     (bvalid_o), 
    .bready_i     (bready_i), 
  
    // Outputs
    .awid_o       (bus_awid), 
    .awact_o      (bus_awact), 
    
    // Debug ports
    .dbg_push_req_n_o (dbg_aw_chf_push_req_n_o)
  );


  //--------------------------------------------------------------------
  // Write data channel.
  //--------------------------------------------------------------------
  x256_DW_axi_x2x_mp_w
   
  U_DW_axi_x2x_mp_w (
    //inputs
    .aclk         (aclk_i),
    .aresetn      (aresetn_i),
    .valid_i      (wvalid_i),
    .payload_i    (wpayload_i),
    .lp_active_i  (lp_active_i),
    .awid_i       (bus_awid),
    .awact_i      (bus_awact),
    .push_full_i  (w_bus_push_full_i), 
    
    //outputs
    .push_req_n_o (w_bus_push_req_n_o),
    .payload_o    (wpayload_o),
    .ready_o      (wready_o),
    
    // Debug ports
    .dbg_bus_push_req_n_o (dbg_bus_w_chf_push_req_n_o)
  );


  //--------------------------------------------------------------------
  // Burst response channel.
  //--------------------------------------------------------------------
  x256_DW_axi_x2x_mp_rb
   
  #( BPYLD_W // Channel payload width.
  )
  U_DW_axi_x2x_mp_b (
    //inputs
    .ready_i     (bready_i),
    .pop_empty_i (b_pop_empty_i),
    .payload_i   (bpayload_i),
  
    //outputs
    .valid_o     (bvalid_o),
    .pop_req_n_o (b_pop_req_n_o),
    .payload_o   (bpayload_o)
  );

  // Extract ID from bpayload.
  assign bid = bpayload_o[`X2X_BPYLD_ID_LHS_MP:`X2X_BPYLD_ID_RHS_MP];

endmodule
