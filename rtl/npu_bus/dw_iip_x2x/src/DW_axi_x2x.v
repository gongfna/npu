/*
------------------------------------------------------------------------
--
--                    (C) COPYRIGHT 2006-2011 SYNOPSYS, INC.
--                           ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this
--  software is subject to the terms and conditions of a written
--  license agreement between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
--
-- File     : DW_axi_x2x.v
-- Abstract : Top Level File for DW_axi_x2x
--
------------------------------------------------------------------------
*/


module DW_axi_x2x (


  // MASTER PORT I/O
  aclk_m
                   ,aresetn_m
                   ,// MP Write Address Channel 
                   awvalid_m
                   ,awaddr_m
                   ,awid_m
                   ,awlen_m
                   ,awsize_m
                   ,awburst_m
                   ,awlock_m
                   ,awcache_m
                   ,awprot_m
                   ,awready_m
                   ,// MP Write Data Channel 
                   wvalid_m
                   ,wid_m
                   ,wdata_m
                   ,wstrb_m
                   ,wlast_m
                   ,wready_m
                   ,// MP Write Response Channel
                   bvalid_m
                   ,bid_m
                   ,bresp_m
                   ,bready_m
                   ,// MP Read Address Channel
                   arvalid_m
                   ,arid_m
                   ,araddr_m
                   ,arlen_m
                   ,arsize_m
                   ,arburst_m
                   ,arlock_m
                   ,arcache_m
                   ,arprot_m
                   ,arready_m
                   ,// MP Read Data Channel
                   rvalid_m
                   ,rid_m
                   ,rdata_m
                   ,rresp_m
                   ,rlast_m
                   ,rready_m
                   ,// SLAVE PORT I/O
                   aclk_s
                   ,aresetn_s
                   ,// SP Write Address Channel 1
                   awvalid_s1
                   ,awaddr_s1
                   ,awid_s1
                   ,awlen_s1
                   ,awsize_s1
                   ,awburst_s1
                   ,awlock_s1
                   ,awcache_s1
                   ,awprot_s1
                   ,awready_s1
                   ,// SP Write Data Channel 1
                   wvalid_s1
                   ,wid_s1
                   ,wdata_s1
                   ,wstrb_s1
                   ,wlast_s1
                   ,wready_s1
                   ,// SP Write Response Channel 1
                   bvalid_s1
                   ,bid_s1
                   ,bresp_s1
                   ,bready_s1
                   ,// SP Read Address Channel
                   arvalid_s
                   ,arid_s
                   ,araddr_s
                   ,arlen_s
                   ,arsize_s
                   ,arburst_s
                   ,arlock_s
                   ,arcache_s
                   ,arprot_s
                   ,arready_s
                   ,// SP Read Data Channel
                   rvalid_s
                   ,rid_s
                   ,rdata_s
                   ,rresp_s
                   ,rlast_s
                   ,rready_s
                   );

  //--------------------------------------------------------------------
  // MODULE PARAMETERS
  //--------------------------------------------------------------------
  

  //--------------------------------------------------------------------
  // LOCAL MACROS
  //--------------------------------------------------------------------
  // Width of bus containing aw channel payloads for all slave ports.
  `define BUS_AWPYLD_W_SP (`X2X_NUM_W_PORTS*`X2X_AWPYLD_W_SP)
  
  // Width of bus containing w channel payloads for all slave ports.
  // Sized for the master port.
  `define BUS_WPYLD_W_MP (`X2X_NUM_W_PORTS*`X2X_WPYLD_W_MP)
  
  // Width of bus containing w channel payloads for all slave ports.
  // Sized for the slave port.
  `define BUS_WPYLD_W_SP (`X2X_NUM_W_PORTS*`X2X_WPYLD_W_SP)

  // Width of bus containing b channel payloads for all slave ports.
  `define BUS_BPYLD_W_SP (`X2X_NUM_W_PORTS*`X2X_BPYLD_W_SP)


  //--------------------------------------------------------------------
  // PORT DECLARATIONS
  //--------------------------------------------------------------------

  // MASTER PORT I/O
  input                       aclk_m;
  input                       aresetn_m;

  // MP Write Address Channel 
  input                       awvalid_m;
  input  [`X2X_MP_AW-1:0]     awaddr_m;
  input  [`X2X_MP_IDW-1:0]    awid_m;
  input  [`X2X_MP_BLW-1:0]    awlen_m;
  input  [`X2X_BSW-1:0]       awsize_m;
  input  [`X2X_BTW-1:0]       awburst_m;
  input  [`X2X_LTW-1:0]       awlock_m;
  input  [`X2X_CTW-1:0]       awcache_m;
  input  [`X2X_PTW-1:0]       awprot_m;
  output                      awready_m;

  // MP Write Data Channel from Master
  input                       wvalid_m;
  input  [`X2X_MP_IDW-1:0]    wid_m;
  input  [`X2X_MP_DW-1:0]     wdata_m;
  input  [`X2X_MP_SW-1:0]     wstrb_m;
  input                       wlast_m;
  output                      wready_m;

  // MP Write Response Channel from Master
  output                      bvalid_m;
  output [`X2X_MP_IDW-1:0]    bid_m;
  output [`X2X_BRW-1:0]       bresp_m;
  input                       bready_m;

  // MP Read Address Channel from Master
  input                       arvalid_m;
  input  [`X2X_MP_IDW-1:0]    arid_m;
  input  [`X2X_MP_AW-1:0]     araddr_m;
  input  [`X2X_MP_BLW-1:0]    arlen_m;
  input  [`X2X_BSW-1:0]       arsize_m;
  input  [`X2X_BTW-1:0]       arburst_m;
  input  [`X2X_LTW-1:0]       arlock_m;
  input  [`X2X_CTW-1:0]       arcache_m;
  input  [`X2X_PTW-1:0]       arprot_m;
  output                      arready_m;

  // MP Read Data Channel from Master
  output                      rvalid_m;
  output [`X2X_MP_IDW-1:0]    rid_m;
  output [`X2X_MP_DW-1:0]     rdata_m;
  output                      rlast_m;
  output [`X2X_RRW-1:0]       rresp_m;
  input                       rready_m;
  
  // MP Trustzone security bit

  // Low Power Handshaking Interface


  // SLAVE PORT I/O
  input                       aclk_s;
  input                       aresetn_s;

  // Write Address Channel 1
  output                      awvalid_s1;
  output [`X2X_SP_AW-1:0]     awaddr_s1;
  output [`X2X_SP_IDW-1:0]    awid_s1;
  output [`X2X_SP_BLW-1:0]    awlen_s1;
  output [`X2X_BSW-1:0]       awsize_s1;
  output [`X2X_BTW-1:0]       awburst_s1;
  output [`X2X_LTW-1:0]       awlock_s1;
  output [`X2X_CTW-1:0]       awcache_s1;
  output [`X2X_PTW-1:0]       awprot_s1;
  input                       awready_s1;

  // Write Data Channel 1
  output                      wvalid_s1;
  output [`X2X_SP_IDW-1:0]    wid_s1;
  output [`X2X_SP_DW-1:0]     wdata_s1;
  output [`X2X_SP_SW-1:0]     wstrb_s1;
  output                      wlast_s1;
  input                       wready_s1;

  // Write Response Channel 1
  input                       bvalid_s1;
  input  [`X2X_SP_IDW-1:0]    bid_s1;
  input  [`X2X_BRW-1:0]       bresp_s1;
  output                      bready_s1;
  

  // Write Address Channel 2

  // Write Data Channel 2

  // Write Response Channel 2


  // Write Address Channel 3

  // Write Data Channel 3

  // Write Response Channel 3


  // Write Address Channel 4

  // Write Data Channel 4

  // Write Response Channel 4


  // Write Address Channel 5

  // Write Data Channel 5

  // Write Response Channel 5


  // Write Address Channel 6

  // Write Data Channel 6

  // Write Response Channel 6


  // Write Address Channel 7

  // Write Data Channel 7

  // Write Response Channel 7


  // Write Address Channel 8

  // Write Data Channel 8

  // Write Response Channel 8


  // Read Address Channel
  output                      arvalid_s;
  output [`X2X_SP_IDW-1:0]    arid_s;
  output [`X2X_SP_AW-1:0]     araddr_s;
  output [`X2X_SP_BLW-1:0]    arlen_s;
  output [`X2X_BSW-1:0]       arsize_s;
  output [`X2X_BTW-1:0]       arburst_s;
  output [`X2X_LTW-1:0]       arlock_s;
  output [`X2X_CTW-1:0]       arcache_s;
  output [`X2X_PTW-1:0]       arprot_s;
  input                       arready_s;

  // Read Data Channel
  input                       rvalid_s;
  input  [`X2X_SP_IDW-1:0]    rid_s;
  input  [`X2X_SP_DW-1:0]     rdata_s;
  input                       rlast_s;
  input  [`X2X_RRW-1:0]       rresp_s;
  output                      rready_s;
  

  // SP Trustzone security bit



  //--------------------------------------------------------------------
  // Test environment debug outputs.
  //--------------------------------------------------------------------

  // AW channel fifo debug outputs.

  // W channel fifo debug outputs.
  
  // B channel fifo debug outputs.

  // AR channel fifo debug outputs.
  
  // R channel fifo debug outputs.


  //------------------------------------------------------------------- 
  // Wire Variables
  //------------------------------------------------------------------- 
  
  // AW Wires
  wire [`X2X_AWPYLD_W_MP-1:0] awpayload_m; // Payload from top i/o.
  wire [`X2X_AW_CH_FIFO_W-1:0] awpayload_mp; // Payload from MP block.
  wire [`X2X_AW_CH_FIFO_W-1:0] awpayload_fifo; // Payload from AW fifo.

  wire [`BUS_AWPYLD_W_SP-1:0] aw_bus_payload_sp; // Payloads for aw 
                                                 // channels for all
		 				 // slave ports.

  wire [`X2X_AWPYLD_W_SP-1:0] awpayload_sp1; // AW payload to SP 1.
  wire [`X2X_AWPYLD_W_SP-1:0] awpayload_sp2; // AW payload to SP 2.
  wire [`X2X_AWPYLD_W_SP-1:0] awpayload_sp3; // AW payload to SP 3.
  wire [`X2X_AWPYLD_W_SP-1:0] awpayload_sp4; // AW payload to SP 4.
  wire [`X2X_AWPYLD_W_SP-1:0] awpayload_sp5; // AW payload to SP 5.
  wire [`X2X_AWPYLD_W_SP-1:0] awpayload_sp6; // AW payload to SP 6.
  wire [`X2X_AWPYLD_W_SP-1:0] awpayload_sp7; // AW payload to SP 7.
  wire [`X2X_AWPYLD_W_SP-1:0] awpayload_sp8; // AW payload to SP 8.

  wire aw_push_req_n; // Push request to AW fifo.
  wire aw_push_full; // Full status from AW fifo. 

  wire aw_pop_req_n; // Pop request to AW fifo.
  wire aw_pop_empty; // Empty status from AW fifo.


  wire [`X2X_NUM_W_PORTS-1:0] aw_bus_ready_i; // Ready signals from
                                              // aw slave ports.

  wire [`X2X_NUM_W_PORTS-1:0] aw_bus_valid_o; // Valid signals to
                                              // aw slave ports.
					      

  // W Wires
  wire [`X2X_WPYLD_W_MP-1:0] wpayload_m; // Payload from top i/o.
  wire [`X2X_WPYLD_W_MP-1:0] wpayload_mp; // Payload from MP block.

  // Payloads from W channel fifo(s) for each SP, sized for MP.
  wire [`BUS_WPYLD_W_MP-1:0] w_bus_payload_fifo; 

  // Payloads for w channels for all slave ports.
  wire [`BUS_WPYLD_W_SP-1:0] w_bus_payload_sp; 

  wire [`X2X_WPYLD_W_SP-1:0] wpayload_sp1; // W payload to SP 1.
  wire [`X2X_WPYLD_W_SP-1:0] wpayload_sp2; // W payload to SP 2.
  wire [`X2X_WPYLD_W_SP-1:0] wpayload_sp3; // W payload to SP 3.
  wire [`X2X_WPYLD_W_SP-1:0] wpayload_sp4; // W payload to SP 4.
  wire [`X2X_WPYLD_W_SP-1:0] wpayload_sp5; // W payload to SP 5.
  wire [`X2X_WPYLD_W_SP-1:0] wpayload_sp6; // W payload to SP 6.
  wire [`X2X_WPYLD_W_SP-1:0] wpayload_sp7; // W payload to SP 7.
  wire [`X2X_WPYLD_W_SP-1:0] wpayload_sp8; // W payload to SP 8.

  // Push requests to W fifos.
  wire [`X2X_NUM_W_PORTS-1:0] w_bus_push_req_n; 
  // Full status from W fifos. 
  wire [`X2X_NUM_W_PORTS-1:0] w_bus_push_full; 

  // Pop requests to W fifos.
  wire [`X2X_NUM_W_PORTS-1:0] w_bus_pop_req_n; 
  // Empty status from W fifos.
  wire [`X2X_NUM_W_PORTS-1:0] w_bus_pop_empty; 


  // Ready signals from w slave ports.
  wire [`X2X_NUM_W_PORTS-1:0] w_bus_ready_i;

  // Valid signals to w slave ports.
  wire [`X2X_NUM_W_PORTS-1:0] w_bus_valid_o; 
					      

  // B Wires
  wire [`X2X_BPYLD_W_MP-1:0] bpayload_mp; // Payload from MP block.
  wire [`X2X_BPYLD_W_MP-1:0] bpayload_fifo; // Payload from B fifo.
  wire [`X2X_BPYLD_W_MP-1:0] bpayload_sp; // Payload from sp, sized for
                                          // master port.

  wire [`X2X_BPYLD_W_SP-1:0] bpayload_sp1; // B payload from SP 1. 
  wire [`X2X_BPYLD_W_SP-1:0] bpayload_sp2; // B payload from SP 2. 
  wire [`X2X_BPYLD_W_SP-1:0] bpayload_sp3; // B payload from SP 3. 
  wire [`X2X_BPYLD_W_SP-1:0] bpayload_sp4; // B payload from SP 4. 
  wire [`X2X_BPYLD_W_SP-1:0] bpayload_sp5; // B payload from SP 5. 
  wire [`X2X_BPYLD_W_SP-1:0] bpayload_sp6; // B payload from SP 6. 
  wire [`X2X_BPYLD_W_SP-1:0] bpayload_sp7; // B payload from SP 7. 
  wire [`X2X_BPYLD_W_SP-1:0] bpayload_sp8; // B payload from SP 8. 

  wire [`BUS_BPYLD_W_SP-1:0] b_bus_payload_i; // Payload from all slave
                                              // ports.
					     
  wire b_push_req_n; // Push request to B fifo.
  wire b_push_full; // Full status from B fifo. 

  wire b_pop_req_n; // Pop request to B fifo.
  wire b_pop_empty; // Empty status from B fifo.

  // Ready signals to b slave ports.
  wire [`X2X_NUM_W_PORTS-1:0] b_bus_ready_o;

  // Valid signals from b slave ports.
  wire [`X2X_NUM_W_PORTS-1:0] b_bus_valid_i; 
					      

  // AR wires
  wire [`X2X_ARPYLD_W_MP-1:0] arpayload_m; // Payload from top i/o.
  wire [`X2X_ARPYLD_W_MP-1:0] arpayload_mp; // Payload from MP block.
  wire [`X2X_ARPYLD_W_MP-1:0] arpayload_fifo; // Payload from AR fifo.
  wire [`X2X_ARPYLD_W_SP-1:0] arpayload_sp; // Payload from SP block.


  wire ar_push_req_n; // Push require to AR fifo.
  wire ar_push_full; // Full status from AR fifo.

  wire ar_pop_req_n; // Pop require to AR fifo.
  wire ar_pop_empty; // Empty status from AR fifo.


  // R wires
  wire [`X2X_RPYLD_W_MP-1:0] rpayload_mp; // Payload from MP block.
  wire [`X2X_RPYLD_W_MP-1:0] rpayload_fifo; // Payload from R fifo.
  wire [`X2X_RPYLD_W_MP-1:0] rpayload_sp; // Payload from SP block.
  wire [`X2X_RPYLD_W_SP-1:0] rpayload_s; // Payload from top i/o.
  
  wire r_push_req_n; // Push require to R fifo.
  wire r_push_full; // Full status from R fifo.

  wire r_pop_req_n; // Pop require to R fifo.
  wire r_pop_empty; // Empty status from R fifo.


  // Low power status signal wires.
  wire lp_stall_aw; // Stall AW channel as active write counter is
                    // at its maximum value or in low power mode.

  wire lp_stall_ar; // Stall AR channel as active read counter is
                    // at its maximum value or in low power mode. 

  // Intermediary address and id wires, used to convert signal widths.		    
  wire [`X2X_INTERNAL_AW-1:0]  araddr_s_w;
  wire [`X2X_MP_IDW-1:0] arid_s_w;

  wire [`X2X_INTERNAL_AW-1:0]  awaddr_s1_w;
  wire [`X2X_INTERNAL_AW-1:0]  awaddr_s2_w;
  wire [`X2X_INTERNAL_AW-1:0]  awaddr_s3_w;
  wire [`X2X_INTERNAL_AW-1:0]  awaddr_s4_w;
  wire [`X2X_INTERNAL_AW-1:0]  awaddr_s5_w;
  wire [`X2X_INTERNAL_AW-1:0]  awaddr_s6_w;
  wire [`X2X_INTERNAL_AW-1:0]  awaddr_s7_w;
  wire [`X2X_INTERNAL_AW-1:0]  awaddr_s8_w;

  wire [`X2X_MP_IDW-1:0] awid_s1_w;
  wire [`X2X_MP_IDW-1:0] awid_s2_w;
  wire [`X2X_MP_IDW-1:0] awid_s3_w;
  wire [`X2X_MP_IDW-1:0] awid_s4_w;
  wire [`X2X_MP_IDW-1:0] awid_s5_w;
  wire [`X2X_MP_IDW-1:0] awid_s6_w;
  wire [`X2X_MP_IDW-1:0] awid_s7_w;
  wire [`X2X_MP_IDW-1:0] awid_s8_w;

  wire [`X2X_MP_IDW-1:0] wid_s1_w;
  wire [`X2X_MP_IDW-1:0] wid_s2_w;
  wire [`X2X_MP_IDW-1:0] wid_s3_w;
  wire [`X2X_MP_IDW-1:0] wid_s4_w;
  wire [`X2X_MP_IDW-1:0] wid_s5_w;
  wire [`X2X_MP_IDW-1:0] wid_s6_w;
  wire [`X2X_MP_IDW-1:0] wid_s7_w;
  wire [`X2X_MP_IDW-1:0] wid_s8_w;

  // 1 in low power mode.
  wire lp_active;

// Dummy wires - used to suppress unconnected ports warnings by Leda tool - BR - 2/24/2010
  wire d_aw_cprno_unconn, dbwcprno_unconn, d_ar_cprno_unconn;
  wire drcprno_unconn, dbcpreqno_unconn, dbbcprno_unconn;

  // Build up AR payload signal.
  assign arpayload_m = {
    arid_m,
    araddr_m[`X2X_INTERNAL_AW-1:0],
    arlen_m,
    arsize_m,
    arburst_m,
    arlock_m,
    arcache_m,
    arprot_m};

  assign {
    rid_m,
    rdata_m,
    rresp_m,
    rlast_m} = rpayload_mp;

  // Build up AW payload signal.
  assign awpayload_m = {
    awid_m,
    awaddr_m[`X2X_INTERNAL_AW-1:0],
    awlen_m,
    awsize_m,
    awburst_m,
    awlock_m,
    awcache_m,
    awprot_m};

  // Build up W payload signal.
  assign wpayload_m = {
    wid_m,
    wdata_m,
    wstrb_m,
    wlast_m};

  // Break B payload signal down to AXI signals.
  assign {
    bid_m,
    bresp_m}
  = bpayload_mp;



  //------------------------------------------------------------------- 
  // Instantiate X2X MASTER PORT block
  //------------------------------------------------------------------- 
  DW_axi_x2x_mp
   
  #(`X2X_AWPYLD_W_MP, // Width of write address channel payload.
    `X2X_WPYLD_W_MP,  // Width of write channel payload.
    `X2X_BPYLD_W_MP,  // Width of burst response channel payload.
    `X2X_ARPYLD_W_MP, // Width of read address channel payload.
    `X2X_RPYLD_W_MP   // Width of read channel payload.
   )
  U_DW_axi_x2x_mp (
    // System inputs
    .aclk_i              (aclk_m),
    .aresetn_i           (aresetn_m),

     // AR EXTERNAL
     // Inputs
    .arvalid_i           (arvalid_m),
    .arpayload_i         (arpayload_m),

     // Outputs
    .arready_o           (arready_m),

     // AR INTERNAL
     // Inputs
    .ar_push_full_i      (ar_push_full),
    .lp_stall_ar_i       (lp_stall_ar),
  
     // Outputs
    .ar_push_req_n_o     (ar_push_req_n),
    .arpayload_o         (arpayload_mp),


     // R EXTERNAL
     // Inputs
    .rready_i            (rready_m),

     // Outputs
    .rvalid_o            (rvalid_m),
    .rpayload_o          (rpayload_mp),

     // R INTERNAL
     // Inputs
    .r_pop_empty_i       (r_pop_empty),
    .rpayload_i          (rpayload_fifo),
  
     // Outputs
    .r_pop_req_n_o       (r_pop_req_n),
  
     // AW EXTERNAL
     // Inputs
    .awvalid_i           (awvalid_m),
    .awpayload_i         (awpayload_m),

     // Outputs
    .awready_o           (awready_m),

     // AW INTERNAL
     // Inputs
    .aw_push_full_i      (aw_push_full),
    .lp_stall_aw_i       (lp_stall_aw),
  
     // Outputs
    .aw_push_req_n_o     (aw_push_req_n),
    .awpayload_o         (awpayload_mp),


     // W EXTERNAL
     // Inputs
    .wvalid_i            (wvalid_m),
    .wpayload_i          (wpayload_m),
    .lp_active_i         (lp_active),

     // Outputs
    .wready_o            (wready_m),


     // W INTERNAL
     // Inputs
    .w_bus_push_full_i   (w_bus_push_full),
  
     // Outputs
    .w_bus_push_req_n_o  (w_bus_push_req_n),
    .wpayload_o          (wpayload_mp),


     // B EXTERNAL
     // Inputs
    .bready_i            (bready_m),

     // Outputs
    .bvalid_o            (bvalid_m),
    .bpayload_o          (bpayload_mp),

     // B INTERNAL
     // Inputs
    .b_pop_empty_i       (b_pop_empty),
    .bpayload_i          (bpayload_fifo),
  
     // Outputs
    .b_pop_req_n_o       (b_pop_req_n),

     // Debug ports
    .dbg_aw_chf_push_req_n_o    (d_aw_cprno_unconn),
    .dbg_bus_w_chf_push_req_n_o (dbwcprno_unconn),
    .dbg_ar_chf_push_req_n_o    (d_ar_cprno_unconn)
   );


  //-------------------------------------------------------------------- 
  // Instantiate AR channel fifo.
  //-------------------------------------------------------------------- 
  DW_axi_x2x_sd_fifo
   
  #(`X2X_CLK_MODE,          // Single or dual clock fifos.
    `X2X_MP_SYNC_DEPTH,     // Num. of push side sync. register stages.
    `X2X_SP_SYNC_DEPTH,     // Num. of pop side sync. register stages.
    `X2X_ARPYLD_W_MP,       // Word width same as channel payload width.
    `X2X_AR_BUF_DEPTH,      // Depth of fifo.
    `X2X_AR_BUF_DEPTH_L2,   // Log base 2 of DEPTH.
    `X2X_AR_BUF_DEPTH_P1L2  // Log base 2 of DEPTH + 1.
   )
  U_AR_channel_fifo (
    // Inputs - Push Side 
    .clk_push_i    (aclk_m),
    .resetn_push_i (aresetn_m),

    .push_req_n_i  (ar_push_req_n),
    .data_i        (arpayload_mp),
  
    // Outputs - Push Side
    .push_full_o   (ar_push_full),


    // Inputs - Pop Side 
    .clk_pop_i     (aclk_s),
    .resetn_pop_i  (aresetn_s),

  
    .pop_req_n_i   (ar_pop_req_n),
  
    // Outputs - Pop Side
    .pop_empty_o   (ar_pop_empty),
    .data_o        (arpayload_fifo)
  );


  //-------------------------------------------------------------------- 
  // Instantiate R channel fifo.
  //-------------------------------------------------------------------- 
  DW_axi_x2x_sd_fifo
   
  #(`X2X_CLK_MODE,         // Single or dual clock fifos.
    `X2X_SP_SYNC_DEPTH,    // Num. of push side sync. register stages.
    `X2X_MP_SYNC_DEPTH,    // Num. of pop side sync. register stages.
    `X2X_RPYLD_W_MP,       // Word width same as channel payload width.
    `X2X_R_BUF_DEPTH,      // Depth of fifo.
    `X2X_R_BUF_DEPTH_L2,   // Log base 2 of DEPTH.
    `X2X_R_BUF_DEPTH_P1L2  // Log base 2 of DEPTH + 1.
   )
  U_R_channel_fifo (
    // Inputs - Push Side 
    .clk_push_i    (aclk_s),
    .resetn_push_i (aresetn_s),


    .push_req_n_i  (r_push_req_n),
    .data_i        (rpayload_sp),
  
    // Outputs - Push Side
    .push_full_o   (r_push_full),


    // Inputs - Pop Side 
    .clk_pop_i     (aclk_m),
    .resetn_pop_i  (aresetn_m),

  
    .pop_req_n_i   (r_pop_req_n),
  
    // Outputs - Pop Side
    .pop_empty_o   (r_pop_empty),
    .data_o        (rpayload_fifo)
  );


  //-------------------------------------------------------------------- 
  // Instantiate AW channel fifo.
  //-------------------------------------------------------------------- 
  DW_axi_x2x_sd_fifo
   
  #(`X2X_CLK_MODE,          // Single or dual clock fifos.
    `X2X_MP_SYNC_DEPTH,     // Num. of push side sync. register stages.
    `X2X_SP_SYNC_DEPTH,     // Num. of pop side sync. register stages.
    `X2X_AW_CH_FIFO_W,      // Word width same as channel payload width.
    `X2X_AW_BUF_DEPTH,      // Depth of fifo.
    `X2X_AW_BUF_DEPTH_L2,   // Log base 2 of DEPTH.
    `X2X_AW_BUF_DEPTH_P1L2  // Log base 2 of DEPTH + 1.
   )
  U_AW_channel_fifo (
    // Inputs - Push Side 
    .clk_push_i    (aclk_m),
    .resetn_push_i (aresetn_m),

    .push_req_n_i  (aw_push_req_n),
    .data_i        (awpayload_mp),
  
    // Outputs - Push Side
    .push_full_o   (aw_push_full),


    // Inputs - Pop Side 
    .clk_pop_i     (aclk_s),
    .resetn_pop_i  (aresetn_s),

  
    .pop_req_n_i   (aw_pop_req_n),
  
    // Outputs - Pop Side
    .pop_empty_o   (aw_pop_empty),
    .data_o        (awpayload_fifo)
  );


  //-------------------------------------------------------------------- 
  // Instantiate W channel fifo(s).
  //-------------------------------------------------------------------- 
  DW_axi_x2x_w_ch_fifos
  
  #(`X2X_CLK_MODE,         // Single or dual clock fifos.
    `X2X_MP_SYNC_DEPTH,    // Num. of push side sync. register stages.
    `X2X_SP_SYNC_DEPTH,    // Num. of pop side sync. register stages.
    `X2X_NUM_W_PORTS,      // Number of fifos.
    `X2X_WPYLD_W_MP,       // Word width same as channel payload width.
    `X2X_W_BUF_DEPTH,      // Depth of fifo.
    `X2X_W_BUF_DEPTH_L2,   // Log base 2 of DEPTH.
    `X2X_W_BUF_DEPTH_P1L2, // Log base 2 of DEPTH + 1.
    `BUS_WPYLD_W_MP        // Width of bus of data signals. 
   )
  U_W_channel_fifo (
    // Inputs - Push Side 
    .clk_push_i        (aclk_m),
    .resetn_push_i     (aresetn_m),

    .bus_push_req_n_i  (w_bus_push_req_n),
    .data_i            (wpayload_mp),
  
    // Outputs - Push Side
    .bus_push_full_o   (w_bus_push_full),


    // Inputs - Pop Side 
    .clk_pop_i         (aclk_s),
    .resetn_pop_i      (aresetn_s),

  
    .bus_pop_req_n_i   (w_bus_pop_req_n),
  
    // Outputs - Pop Side
    .bus_pop_empty_o   (w_bus_pop_empty),
    .bus_data_o        (w_bus_payload_fifo)
  );


  //-------------------------------------------------------------------- 
  // Instantiate B channel fifo.
  //-------------------------------------------------------------------- 
  DW_axi_x2x_sd_fifo
   
  #(`X2X_CLK_MODE,         // Single or dual clock fifos.
    `X2X_SP_SYNC_DEPTH,    // Num. of push side sync. register stages.
    `X2X_MP_SYNC_DEPTH,    // Num. of pop side sync. register stages.
    `X2X_BPYLD_W_MP,       // Word width same as channel payload width.
    `X2X_B_BUF_DEPTH,      // Depth of fifo.
    `X2X_B_BUF_DEPTH_L2,   // Log base 2 of DEPTH.
    `X2X_B_BUF_DEPTH_P1L2  // Log base 2 of DEPTH + 1.
   )
  U_B_channel_fifo (
    // Inputs - Push Side 
    .clk_push_i    (aclk_s),
    .resetn_push_i (aresetn_s),


    .push_req_n_i  (b_push_req_n),
    .data_i        (bpayload_sp),
  
    // Outputs - Push Side
    .push_full_o   (b_push_full),


    // Inputs - Pop Side 
    .clk_pop_i     (aclk_m),
    .resetn_pop_i  (aresetn_m),


    .pop_req_n_i   (b_pop_req_n),
  
    // Outputs - Pop Side
    .pop_empty_o   (b_pop_empty),
    .data_o        (bpayload_fifo)
  );


  //--------------------------------------------------------------------
  // Instantiate X2X SLAVE PORT block
  //--------------------------------------------------------------------
  DW_axi_x2x_sp
  
  #(`BUS_AWPYLD_W_SP,  // Width of bus containing AW channel payloads
                       // for all slave ports.
    `BUS_WPYLD_W_MP,   // Width of bus containing W channel payloads for
                       // all slave ports.
    `BUS_WPYLD_W_SP,   // Width of bus containing W channel payloads for
                       // all master ports.
    `BUS_BPYLD_W_SP    // Width of bus containing B channel payloads for
                       // all slave ports.
   )
  U_DW_axi_x2x_sp (
    // System inputs
    .aclk_i                    (aclk_s),
    .aresetn_i                 (aresetn_s),

    
    // AR INTERNAL
    // Inputs
    .ar_pop_empty_i            (ar_pop_empty),
    .arpayload_i               (arpayload_fifo),

    // Outputs
    .ar_pop_req_n_o            (ar_pop_req_n),
  
    // AR EXTERNAL
    // Inputs
    .arready_i                 (arready_s),
    
    // Outputs
    .arvalid_o                 (arvalid_s),
    .arpayload_o               (arpayload_sp),
  
  
    // R INTERNAL
    // Inputs
    .r_push_full_i             (r_push_full),
  
    // Outputs
    .r_push_req_n_o            (r_push_req_n),
    .rpayload_o                (rpayload_sp),
  
    // R EXTERNAL
    // Inputs
    .rvalid_i                  (rvalid_s),
    .rpayload_i                (rpayload_s),
    
    // Outputs
    .rready_o                  (rready_s),
  
    // AW INTERNAL
    // Inputs
    .aw_pop_empty_i            (aw_pop_empty),
    .awpayload_i               (awpayload_fifo),

    // Outputs
    .aw_pop_req_n_o            (aw_pop_req_n),

    // AW EXTERNAL
    // Inputs
    .aw_bus_ready_i            (aw_bus_ready_i),
  
    // Outputs
    .aw_bus_valid_o            (aw_bus_valid_o),
    .aw_bus_payload_o          (aw_bus_payload_sp),


    // W INTERNAL
    // Inputs
    .w_bus_pop_empty_i         (w_bus_pop_empty),
    .w_bus_payload_i           (w_bus_payload_fifo),

    // Outputs
    .w_bus_pop_req_n_o         (w_bus_pop_req_n),

    // W EXTERNAL
    // Inputs
    .w_bus_ready_i             (w_bus_ready_i),
    
    // Outputs
    .w_bus_valid_o             (w_bus_valid_o),
    .w_bus_payload_o           (w_bus_payload_sp),


    // B INTERNAL
    // Inputs
    .b_push_full_i             (b_push_full),

    // Outputs
    .b_push_req_n_o            (b_push_req_n),
    .bpayload_o                (bpayload_sp),
  
    // B EXTERNAL
    // Inputs
    .b_bus_valid_i             (b_bus_valid_i),
    .b_bus_payload_i           (b_bus_payload_i),
    
    // Outputs
    .b_bus_ready_o             (b_bus_ready_o),

    // Test environment debug outputs.
    .dbg_r_chf_push_req_n_o      (drcprno_unconn),
    .dbg_b_chf_push_req_n_o      (dbcpreqno_unconn),
    .dbg_b_bus_chf_push_req_n_o  (dbbcprno_unconn)
  );


  //--------------------------------------------------------------------
  // Instantiate TZ signal crossing module.
  //--------------------------------------------------------------------


  //--------------------------------------------------------------------
  // Instantiate pending t/x status signal generation block.
  //--------------------------------------------------------------------
   // Tie off these signals when the low power block is not required.
   assign lp_stall_aw = 1'b0;
   assign lp_stall_ar = 1'b0;
   assign lp_active = 1'b0;
  

  // -------------------------------------------------------------------
  // Remaining Debug Signal Connections.
  // -------------------------------------------------------------------



  assign {
    arid_s_w,
    araddr_s_w, 
    arlen_s, 
    arsize_s, 
    arburst_s, 
    arlock_s,
    arcache_s, 
    arprot_s }
  = arpayload_sp;

  // Turning off due to issue with cC handling ifdefs.

  // Need to take account of varying signal widths. 0 bits that are not
  // used internally.
  assign araddr_s = araddr_s_w;


  assign arid_s = arid_s_w;
  

  

  assign rpayload_s = {
    rid_s[`X2X_MP_IDW-1:0],
    rdata_s,
    rresp_s,
    rlast_s};


  // Collect aw ready signals from all slave ports into a single vector.
  assign aw_bus_ready_i = {
    awready_s1
  };

  // Connect all aw valid signals for all slave ports.
  assign {
    awvalid_s1 }
  = aw_bus_valid_o;

  
  // Connect all aw payload signals for all slave ports.
  assign {
    awpayload_sp1 }
  = aw_bus_payload_sp;

  // Break AW payload signals out into AXI signals
  // for all slave ports.






  








  assign {
    awid_s1_w, 
    awaddr_s1_w, 
    awlen_s1, 
    awsize_s1, 
    awburst_s1, 
    awlock_s1,
    awcache_s1, 
    awprot_s1 }
  = awpayload_sp1;

  // Turning off due to issue with cC handling ifdefs.

  // Need to take account of varying signal widths. 0 bits that are not
  // used internally.
  assign awaddr_s1 = awaddr_s1_w;


  assign awid_s1 = awid_s1_w;

  


  // Collect w ready signals from all slave ports into a single vector.
  assign w_bus_ready_i = {
    wready_s1
  };

  // Connect all w valid signals for all slave ports.
  assign {
    wvalid_s1 }
  = w_bus_valid_o;

  
  // Connect all w payload signals for all slave ports.
  assign {
    wpayload_sp1 }
  = w_bus_payload_sp;

  // Break W payload signals out into AXI signals
  // for all slave ports.














  assign {
    wid_s1_w, 
    wdata_s1, 
    wstrb_s1, 
    wlast_s1 }
  = wpayload_sp1;

  // Turning off due to issue with cC handling ifdefs.

  // Need to take account of varying signal widths. 0 bits that are not
  // used internally.
  assign wid_s1 = wid_s1_w;





  // Collect all b valid signals from all slave ports.
  assign b_bus_valid_i =  {
    bvalid_s1 };

  // Connect all b ready signals to all slave ports.
  assign {
    bready_s1 }
  = b_bus_ready_o;

  // Collect payload signals from all slave ports B channels
  // into payload vectors.







  assign bpayload_sp1 = {
    bid_s1[`X2X_MP_IDW-1:0],
    bresp_s1};


  // Collect all B SP payloads into a single vector.
  assign b_bus_payload_i = {
    bpayload_sp1
  };


endmodule 


