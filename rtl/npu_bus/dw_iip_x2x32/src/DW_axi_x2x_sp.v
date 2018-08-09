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
** File     : DW_axi_x2x_sp.v
** Abstract : Slave port block for DW_axi_x2x.
**
** --------------------------------------------------------------------
*/

module x32_DW_axi_x2x_sp (
  // System inputs
  aclk_i,
  aresetn_i,

  // AR INTERNAL
  // Inputs
  ar_pop_empty_i,
  arpayload_i,

  // Outputs
  ar_pop_req_n_o,

  // AR EXTERNAL
  // Inputs
  arready_i,
  
  // Outputs
  arvalid_o,
  arpayload_o,


  // R INTERNAL
  // Inputs
  r_push_full_i,

  // Outputs
  r_push_req_n_o,
  rpayload_o,

  // R EXTERNAL
  // Inputs
  rvalid_i,
  rpayload_i,
  
  // Outputs
  rready_o,

  // AW INTERNAL
  // Inputs
  aw_pop_empty_i,
  awpayload_i,

  // Outputs
  aw_pop_req_n_o,

  // AW EXTERNAL
  // Inputs
  aw_bus_ready_i,
  
  // Outputs
  aw_bus_valid_o,
  aw_bus_payload_o,


  // W INTERNAL
  // Inputs
  w_bus_pop_empty_i,
  w_bus_payload_i,

  // Outputs
  w_bus_pop_req_n_o,

  // W EXTERNAL
  // Inputs
  w_bus_ready_i,
  
  // Outputs
  w_bus_valid_o,
  w_bus_payload_o,


  // B INTERNAL
  // Inputs
  b_push_full_i,

  // Outputs
  b_push_req_n_o,
  bpayload_o,

  // B EXTERNAL
  // Inputs
  b_bus_valid_i,
  b_bus_payload_i,
  
  // Outputs
  b_bus_ready_o,
  
  // Test environment debug outputs.
  dbg_r_chf_push_req_n_o,
  dbg_b_chf_push_req_n_o,
  dbg_b_bus_chf_push_req_n_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  
  // INSTANTIATION PARAMETERS - MUST BE SET BY INSTANTIATION.
  
  // Width of bus containing AW channel payloads for all slave ports.
  parameter BUS_AWPYLD_W_SP = 0; 

  // Width of bus containing W channel payloads for all master ports.
  parameter BUS_WPYLD_W_MP = 0; 
  // Width of bus containing W channel payloads for all slave ports.
  parameter BUS_WPYLD_W_SP = 0; 

  // Width of bus containing B channel payloads for all slave ports.
  parameter BUS_BPYLD_W_SP = 0; 


  // INTERNAL PARAMETERS - MUST NOT BE SET BY INSTANTIATION.
  
  // Width of AW payload from channel fifo. Will contain write port 
  // number for fan out configs + AW payload.
  parameter AW_CH_FIFO_W = `X2X_AW_CH_FIFO_W; 
					      
  // SP Payloads.					      
  parameter WPYLD_W_MP  = `X2X_WPYLD_W_MP; 
  parameter BPYLD_W_MP  = `X2X_BPYLD_W_MP; 
  parameter ARPYLD_W_MP = `X2X_ARPYLD_W_MP; 
  parameter RPYLD_W_MP  = `X2X_RPYLD_W_MP;

  // MP Payloads.					      
  parameter AWPYLD_W_SP = `X2X_AWPYLD_W_SP; 
  parameter WPYLD_W_SP  = `X2X_WPYLD_W_SP; 
  parameter BPYLD_W_SP  = `X2X_BPYLD_W_SP; 
  parameter ARPYLD_W_SP = `X2X_ARPYLD_W_SP; 
  parameter RPYLD_W_SP  = `X2X_RPYLD_W_SP;
  
  
  parameter MP_ID_W = `X2X_MP_IDW; // ID width at MP.
  
  parameter ADDR_TRK_W = `X2X_ADDR_TRK_W; // Bits of address that X2X 
                                          // requires for resizing.

  parameter BEATS_PER_POP_W = `X2X_SP_W_BEATS_PER_POP_W; // Beats per 
                                                         // pop width.

  parameter BS_W = `X2X_BSW; // Burst size signal width.

  parameter BT_W = `X2X_BTW; // Burst type signal width.

  parameter SP_BL_W = `X2X_SP_BLW; // SP burst length signal width.

//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

  input aclk_i;
  input aresetn_i;

  // AR INTERNAL
  // Inputs
  input ar_pop_empty_i; // Empty status signal from AR channel fifo.
  input [ARPYLD_W_MP-1:0] arpayload_i; // Payload from AR channel fifo.

  // Outputs
  output ar_pop_req_n_o; // Pop require signal to AR channel fifo.

  // AR EXTERNAL
  // Inputs
  input arready_i; // AR ready from SP.
  
  // Outputs
  output arvalid_o; // AR valid to SP.
  output [ARPYLD_W_SP-1:0] arpayload_o; // AR payload to SP.

  
  // R INTERNAL
  // Inputs
  input r_push_full_i; // Full status signal from R channel fifo.

  // Outputs
  output r_push_req_n_o; // Push require signal to R channel fifo.
  output [RPYLD_W_MP-1:0] rpayload_o; // Payload to R channel fifo.

  // R EXTERNAL
  // Inputs
  input rvalid_i; // R valid from SP.
  input [RPYLD_W_SP-1:0] rpayload_i; // R payload from SP.
  
  // Outputs
  output rready_o; // R ready to SP.

  // AW INTERNAL
  // Inputs
  input aw_pop_empty_i; // Empty status signal from AW channel fifo.
  input [AW_CH_FIFO_W-1:0] awpayload_i; // Payload from AW channel fifo.

  // Outputs
  output aw_pop_req_n_o; // Pop require signal to AW channel fifo.

  // AW EXTERNAL
  // Inputs
  // AW readys from all SP's.
  input [`X2X_NUM_W_PORTS-1:0] aw_bus_ready_i; 
  
  // Outputs
  // AW valids to all SP's.
  output [`X2X_NUM_W_PORTS-1:0] aw_bus_valid_o; 
  // AW payload to all SP's. 
  output [BUS_AWPYLD_W_SP-1:0] aw_bus_payload_o; 

  
  // W INTERNAL - Note that for write interleaving fan out there
  //              can be more than one write data port on the
  //              X2X SP. There are bussed signals internally
  //              also because we implement a seperate write 
  //              data channel buffer for every write interleaving
  //              depth in this case.
  
  // Inputs
  // Bus of empty status signal from W channel fifos.
  input [`X2X_NUM_W_PORTS-1:0] w_bus_pop_empty_i;

  // Bus of payload signals from W channel fifos.
  input [BUS_WPYLD_W_MP-1:0] w_bus_payload_i; 

  // Outputs
  // Pop require signals to W channel fifos.
  output [`X2X_NUM_W_PORTS-1:0] w_bus_pop_req_n_o; 

  // W EXTERNAL
  // Inputs
  // W ready signals from all slave ports.
  input [`X2X_NUM_W_PORTS-1:0] w_bus_ready_i; 
  
  // Outputs
  // W valid signals to all slave ports.
  output [`X2X_NUM_W_PORTS-1:0] w_bus_valid_o; 
  // Bus of payload signals to all slave ports.
  output [BUS_WPYLD_W_SP-1:0] w_bus_payload_o; 


  // B INTERNAL - Note that for write interleaving fan out there
  //              can be more than one burst response port on the
  //              X2X SP. There are no bussed signals internally
  //              because unlike the W channels we will merge all
  //              these B channels down to a single B channel buffer.
  
  // Inputs
  // Full status signal from B channel fifo.
  input [`X2X_NUM_W_PORTS-1:0] b_push_full_i;

  // Outputs
  output b_push_req_n_o; // Push require signal to B channel fifo.
  output [BPYLD_W_MP-1:0] bpayload_o; // Payload to channel fifo.

  // B EXTERNAL
  // Inputs
  // B valid signals from all SP's.
  input [`X2X_NUM_W_PORTS-1:0] b_bus_valid_i; 
  // Bus of payload signals from all SP's.
  input [BUS_BPYLD_W_SP-1:0] b_bus_payload_i; 
  
  // Outputs
  // B ready signals to all slave ports.
  output [`X2X_NUM_W_PORTS-1:0] b_bus_ready_o; 


  //--------------------------------------------------------------------
  // Test environment debug outputs.
  //--------------------------------------------------------------------
  output dbg_r_chf_push_req_n_o;
  output dbg_b_chf_push_req_n_o;
  output [`X2X_NUM_W_PORTS-1:0] dbg_b_bus_chf_push_req_n_o;


  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------

  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  
  // Resizing info. from AR -> R.
  wire                  ar_rs_push_req_n; // Push to resize info. 
                                          // fifo's in R block.
  wire [MP_ID_W-1:0]    ar_aid; 
  wire [ADDR_TRK_W-1:0] ar_addr_rs; 
  wire [BS_W-1:0]       ar_size; 
  wire [BT_W-1:0]       ar_burst; 
  wire [BS_W-1:0]       ar_size_mp; 
  wire [SP_BL_W-1:0]    ar_alen; 
  wire                  ar_pre_last_xact;
  wire                  ar_last_xact;

  wire r_rsi_fifo_full; // Resizing info. fifo in R block full.
  wire r_pre_resp_comp; // 1 prior to last of downsized to multiple t/x
                        // completed.


  // Resizing info. from AW -> R.
  wire                  aw_rs_push_req_n; // Push to resize info. 
                                          // fifo's in W & B blocks.
  wire [MP_ID_W-1:0]    aw_aid; 
  wire [ADDR_TRK_W-1:0] aw_addr_rs; 
  wire [BS_W-1:0]       aw_size; 
  wire [BT_W-1:0]       aw_burst; 
  wire [BS_W-1:0]       aw_size_mp; 
  wire [SP_BL_W-1:0]    aw_alen; 
  wire                  aw_pre_last_xact;
  wire                  aw_last_xact;

  wire w_rsi_fifo_full; // Resizing info. fifo in W block full.
  wire b_rsi_fifo_full; // Resizing info. fifo in B block full.
  wire b_pre_resp_comp; // 1 prior to last of downsized to multiple t/x
                        // completed.

  // Locking communication signals between AR <-> AW.
  wire [`X2X_LTW-1:0] awlock_r; 
  wire [`X2X_LTW-1:0] arlock_r; 

  // Write interleaving communication signals between W -> AW.
  wire wrequest;
  wire [MP_ID_W-1:0] wid;
  wire us_issue_req;
  wire us_xact_issue_off;

// Dummy wires - used to suppress unconnected ports warnings by Leda tool - BR - 2/24/2010
  wire uxioo_unconn; 
   
  //--------------------------------------------------------------------
  // Read Address Channel.
  //--------------------------------------------------------------------
  x32_DW_axi_x2x_sp_a
   
  #(0 // Write or read channel, 0 for read.
  )
  U_DW_axi_x2x_sp_ar (
    //inputs
    .aclk             (aclk_i),
    .aresetn          (aresetn_i),
    .payload_i        (arpayload_i),
    .aready_i         (arready_i),
    .alock_ac_i       (awlock_r),
    .data_fifo_full_i (r_rsi_fifo_full),
    .resp_fifo_full_i (1'b1), // Unconnected, not necessary here.
    .addr_fifo_ept_i  (ar_pop_empty_i),
    .pre_resp_comp_i  (r_pre_resp_comp),
    .wrequest_i       ( 1'b0 ),
    .wid_i            ({MP_ID_W{1'b0}}),
    .us_issue_req_i   (1'b0), //don't need for AR channel
  
    //outputs
    .payload_o        (arpayload_o),
    .avalid_o         (arvalid_o),
    .rs_push_req_n_o  (ar_rs_push_req_n),
    .aid_o            (ar_aid),
    .addr_rs_o        (ar_addr_rs),
    .alen_o           (ar_alen),
    .asize_o          (ar_size),
    .aburst_o         (ar_burst),
    .asize_mp_o       (ar_size_mp),
    .alock_r_o        (arlock_r),
    .pre_last_xact_o  (ar_pre_last_xact),
    .last_rs_xact_o   (ar_last_xact), 
    .us_xact_issue_off_o (uxioo_unconn),
    .pop_req_n_o      (ar_pop_req_n_o)
  );


  //--------------------------------------------------------------------
  // Read Data Channel.
  //--------------------------------------------------------------------
  x32_DW_axi_x2x_sp_r
   
  U_DW_axi_x2x_sp_r (
    //inputs
    .aclk            (aclk_i),
    .aresetn         (aresetn_i),
    .aid_i           (ar_aid),
    .asize_i         (ar_size),
    .aburst_i        (ar_burst),
    .asize_mp_i      (ar_size_mp),
    .addr_i          (ar_addr_rs),
    .pre_last_xact_i (ar_pre_last_xact),
    .last_rs_xact_i  (ar_last_xact), 
    .rs_push_req_n_i (ar_rs_push_req_n),
    .rvalid_i        (rvalid_i),
    .rpayload_i      (rpayload_i),
    .rpush_full_i    (r_push_full_i),

    // Outputs 
    .rs_push_full_o  (r_rsi_fifo_full),
    .pre_xact_fsh_o  (r_pre_resp_comp),
    .rpush_req_n_o   (r_push_req_n_o),
    .rready_o        (rready_o),
    .rpayload_o      (rpayload_o),

    // Debug Ports
    .dbg_push_req_n_o (dbg_r_chf_push_req_n_o)
  );


  //--------------------------------------------------------------------
  // Write Address Channel.
  //--------------------------------------------------------------------
  x32_DW_axi_x2x_sp_a
   
  #(1 // Write or read channel, 1 for write.
  )
  U_DW_axi_x2x_sp_aw (
    //inputs
    .aclk             (aclk_i),
    .aresetn          (aresetn_i),
    .payload_i        (awpayload_i),
    .aready_i         (aw_bus_ready_i),
    .alock_ac_i       (arlock_r),
    .data_fifo_full_i (w_rsi_fifo_full),
    .resp_fifo_full_i (b_rsi_fifo_full),
    .addr_fifo_ept_i  (aw_pop_empty_i),
    .pre_resp_comp_i  (b_pre_resp_comp),
    .wrequest_i       (wrequest),
    .wid_i            (wid),
    .us_issue_req_i   (us_issue_req),
  
    //outputs
    .payload_o        (aw_bus_payload_o),
    .avalid_o         (aw_bus_valid_o),
    .rs_push_req_n_o  (aw_rs_push_req_n),
    .aid_o            (aw_aid),
    .addr_rs_o        (aw_addr_rs),
    .alen_o           (aw_alen),
    .asize_o          (aw_size),
    .aburst_o         (aw_burst),
    .asize_mp_o       (aw_size_mp),
    .alock_r_o        (awlock_r),
    .pre_last_xact_o  (aw_pre_last_xact),
    .last_rs_xact_o   (aw_last_xact), 
    .us_xact_issue_off_o (us_xact_issue_off),
    .pop_req_n_o      (aw_pop_req_n_o)
  );


  //--------------------------------------------------------------------
  // Write data control top level.
  //--------------------------------------------------------------------
  x32_DW_axi_x2x_sp_w_top
   
  U_DW_axi_x2x_sp_w_top (
    // System inputs
    .aclk_i              (aclk_i),
    .aresetn_i           (aresetn_i),

    // SP WRITE ADDRESS CHANNEL I/F
    // Inputs 
    .bus_rs_push_req_n_i (aw_rs_push_req_n),
    .aid_i               (aw_aid),
    .alen_i              (aw_alen),
    .aburst_i            (aw_burst),
    .asize_sp_i          (aw_size),
    .asize_mp_i          (aw_size_mp),
    .addr_i              (aw_addr_rs),
    .us_xact_issue_off_i (us_xact_issue_off),
  
    // Outputs 
    .bus_rs_fifo_full_o  (w_rsi_fifo_full),
    .wrequest_o          (wrequest),
    .wid_o               (wid),
    .us_issue_req_o      (us_issue_req),
  

    // CHANNEL FIFOS I/F
    // Inputs 
    .bus_pop_empty_i     (w_bus_pop_empty_i),
    .bus_payload_i       (w_bus_payload_i),
  
    // Outputs 
    .bus_pop_req_n_o     (w_bus_pop_req_n_o),
  

    // EXTERNAL SLAVE PORTS I/F
    // Inputs 
    .bus_ready_i         (w_bus_ready_i),
  
    // Outputs 
    .bus_valid_o         (w_bus_valid_o),
    .bus_payload_o       (w_bus_payload_o)
  );


  //--------------------------------------------------------------------
  // Burst response control.
  //--------------------------------------------------------------------
  x32_DW_axi_x2x_sp_b
   
  U_DW_axi_x2x_sp_b (
    // System inputs
    .aclk_i                  (aclk_i),
    .aresetn_i               (aresetn_i),

    // SP WRITE ADDRESS CHANNEL I/F
    // Inputs 
    .rs_push_req_n_i         (aw_rs_push_req_n),
    .aid_i                   (aw_aid),
    .pre_last_xact_i         (aw_pre_last_xact),
    .last_xact_i             (aw_last_xact),
  
    // Outputs 
    .rs_fifo_full_o          (b_rsi_fifo_full),
    .pre_last_cpl_o          (b_pre_resp_comp),
  

    // CHANNEL FIFO I/F
    // Inputs 
    .push_full_i             (b_push_full_i),
  
    // Outputs 
    .push_req_n_o            (b_push_req_n_o),
    .payload_o               (bpayload_o),
  

    // EXTERNAL SLAVE PORT I/F
    // Inputs 
    .bus_valid_i             (b_bus_valid_i),
    .bus_payload_i           (b_bus_payload_i),
  
    // Outputs 
    .bus_ready_o             (b_bus_ready_o),

    // Test environment debug outputs.
    .dbg_bus_chf_push_req_n_o  (dbg_b_bus_chf_push_req_n_o),
    .dbg_push_req_n_o          (dbg_b_chf_push_req_n_o)
  );

endmodule
