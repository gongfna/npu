/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2006-2011 SYNOPSYS, INC.
**                            ALL RIGHTS RESERVED
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
** File     : DW_axi_mp_addrch.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : Master port address channel block, implements master
**            port read and write address channels, seperate
**            instantiations for each.
**
** ---------------------------------------------------------------------
*/

module DW_axi_mp_addrch (
  aclk_i,
  aresetn_i,

  remap_n_i,



  // Inputs - External Master.
  valid_i,
  payload_i,

  // Outputs - External Master.
  ready_o,

  // Inputs - Slave Ports.
  ready_i,
  aw_shrd_lyr_granted_s_bus_i,
  issued_wtx_shrd_sys_s_bus_i,

  // Outputs - Slave Ports.
  bus_valid_o,
  valid_o,
  mask_valid_o,
  shrd_ch_req_o,
  payload_o,

  // Inputs - Pipeline stage.
  id_rs_i,
  local_slv_rs_i,

  // Inputs - Read Data/Burst Response Channel.
  cpl_tx_i,
  cpl_id_i,

  
  // Outputs - Write Data Channel.
  act_ids_o,
  act_snums_o,
  issuedtx_slot_oh_o
);


//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter MS_NUM = 0; // Master system number.
  parameter ICM_PORT = 0; // Master system number.

  parameter NUM_VIS_SP = 16; // Number of visible slave ports.

  parameter LOG2_NUM_VIS_SP = 4; // Log 2 of NUM_VIS_SP.

  parameter TMO = 0; // Channel timing option.

  parameter PL_ARB = 0; // 1 if arbiter outputs are pipelined.

  // Channel payload width from master.
  parameter PYLD_M_W = `AXI_AR_PYLD_M_W;
  // Channel payload width to slave.
  parameter PYLD_S_W = `AXI_AR_PYLD_S_W;

  parameter S0_N_VIS  = 1; // Normal mode slave visibility parameters.
  parameter S1_N_VIS  = 1;
  parameter S2_N_VIS  = 1;
  parameter S3_N_VIS  = 1;
  parameter S4_N_VIS  = 1;
  parameter S5_N_VIS  = 1;
  parameter S6_N_VIS  = 1;
  parameter S7_N_VIS  = 1;
  parameter S8_N_VIS  = 1;
  parameter S9_N_VIS  = 1;
  parameter S10_N_VIS = 1;
  parameter S11_N_VIS = 1;
  parameter S12_N_VIS = 1;
  parameter S13_N_VIS = 1;
  parameter S14_N_VIS = 1;
  parameter S15_N_VIS = 1;
  parameter S16_N_VIS = 1;

  parameter S0_B_VIS  = 1; // Boot mode slave visibility parameters.
  parameter S1_B_VIS  = 1;
  parameter S2_B_VIS  = 1;
  parameter S3_B_VIS  = 1;
  parameter S4_B_VIS  = 1;
  parameter S5_B_VIS  = 1;
  parameter S6_B_VIS  = 1;
  parameter S7_B_VIS  = 1;
  parameter S8_B_VIS  = 1;
  parameter S9_B_VIS  = 1;
  parameter S10_B_VIS = 1;
  parameter S11_B_VIS = 1;
  parameter S12_B_VIS = 1;
  parameter S13_B_VIS = 1;
  parameter S14_B_VIS = 1;
  parameter S15_B_VIS = 1;
  parameter S16_B_VIS = 1;

  parameter MAX_CA_ID         = 4; // Max active transactions per  ID.
  parameter MAX_UIDA          = 4; // Number of unique ID's that may be
                                 // active.

  parameter LOG2_MAX_CA_ID_P1 = 3; // Log base 2 of MAX_CA_ID + 1.

  parameter ACT_IDS_W         = 16; // Width of active IDs bus.
  parameter ACT_SNUMS_W       = 8;  // Width of active slave numbers bus.
  parameter ACT_COUNTS_W      = 8;  // Width of active count per ID bus.

  // Shared layer for this channel exists.
  parameter HAS_SHARED = 0;

  // Source on shared or dedicated layer parameters.
  parameter SHARED_S0 = 0;
  parameter SHARED_S1 = 0;
  parameter SHARED_S2 = 0;
  parameter SHARED_S3 = 0;
  parameter SHARED_S4 = 0;
  parameter SHARED_S5 = 0;
  parameter SHARED_S6 = 0;
  parameter SHARED_S7 = 0;
  parameter SHARED_S8 = 0;
  parameter SHARED_S9 = 0;
  parameter SHARED_S10 = 0;
  parameter SHARED_S11 = 0;
  parameter SHARED_S12 = 0;
  parameter SHARED_S13 = 0;
  parameter SHARED_S14 = 0;
  parameter SHARED_S15 = 0;
  parameter SHARED_S16 = 0;

  // Which sinks have a shared to dedicated link.
  parameter SHRD_DDCTD_S0 = 0;
  parameter SHRD_DDCTD_S1 = 0;
  parameter SHRD_DDCTD_S2 = 0;
  parameter SHRD_DDCTD_S3 = 0;
  parameter SHRD_DDCTD_S4 = 0;
  parameter SHRD_DDCTD_S5 = 0;
  parameter SHRD_DDCTD_S6 = 0;
  parameter SHRD_DDCTD_S7 = 0;
  parameter SHRD_DDCTD_S8 = 0;
  parameter SHRD_DDCTD_S9 = 0;
  parameter SHRD_DDCTD_S10 = 0;
  parameter SHRD_DDCTD_S11 = 0;
  parameter SHRD_DDCTD_S12 = 0;
  parameter SHRD_DDCTD_S13 = 0;
  parameter SHRD_DDCTD_S14 = 0;
  parameter SHRD_DDCTD_S15 = 0;
  parameter SHRD_DDCTD_S16 = 0;

  // Is this a write or read address channel.
  parameter WCH = 0;

//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------
  // Slave visibility macros. Derived from normal and boot mode
  // slave visibility parameters. A slave is visible if it is visible
  // in either normal or boot mode.
  `define S0_VIS  ( S0_N_VIS ||  S0_B_VIS)
  `define S1_VIS  ( S1_N_VIS ||  S1_B_VIS)
  `define S2_VIS  ( S2_N_VIS ||  S2_B_VIS)
  `define S3_VIS  ( S3_N_VIS ||  S3_B_VIS)
  `define S4_VIS  ( S4_N_VIS ||  S4_B_VIS)
  `define S5_VIS  ( S5_N_VIS ||  S5_B_VIS)
  `define S6_VIS  ( S6_N_VIS ||  S6_B_VIS)
  `define S7_VIS  ( S7_N_VIS ||  S7_B_VIS)
  `define S8_VIS  ( S8_N_VIS ||  S8_B_VIS)
  `define S9_VIS  ( S9_N_VIS ||  S9_B_VIS)
  `define S10_VIS (S10_N_VIS || S10_B_VIS)
  `define S11_VIS (S11_N_VIS || S11_B_VIS)
  `define S12_VIS (S12_N_VIS || S12_B_VIS)
  `define S13_VIS (S13_N_VIS || S13_B_VIS)
  `define S14_VIS (S14_N_VIS || S14_B_VIS)
  `define S15_VIS (S15_N_VIS || S15_B_VIS)
  `define S16_VIS (S16_N_VIS || S16_B_VIS)

  `define PAYLOAD_W (PYLD_M_W + ICM_PORT*(`AXI_LOG2_NM))
  `define ID_W (`AXI_MIDW + ICM_PORT*(`AXI_LOG2_NM))

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------
  // Inputs - System.
  input aclk_i;    // AXI system clock.
  input aresetn_i; // AXI system reset.

  input remap_n_i; // Remap input, switches between normal and boot
                   // address maps.



  // Inputs - External Master.
  input                 valid_i;      // Valid from external
                                      // master.

  input [`PAYLOAD_W-1:0]  payload_i;  // Channel payload vector.

  // Outputs - External Master.
  output                ready_o;    // Ready to external
                                    // master.

  // Inputs - Slave Ports.
  input ready_i; // Ready signal from int reg slice.


  // Bit for each attached slave, asserted if the slaves dedicated layer
  // has granted the shared layer.
  input [NUM_VIS_SP-1:0]  aw_shrd_lyr_granted_s_bus_i;

  // Bit for each attached slave, asserted if this master port was
  // requesting to the slave on the shared to dedicated link.
  input [NUM_VIS_SP-1:0] issued_wtx_shrd_sys_s_bus_i;


  // Outputs - Slave Ports.
  output [NUM_VIS_SP-1:0] bus_valid_o; // Valid to master
  reg    [NUM_VIS_SP-1:0] bus_valid_o; // interfaces.

  output valid_o; // Single bit valid output.

  // Asserted when a valid signal should be masked.
  output                  mask_valid_o;

  output                  shrd_ch_req_o; // Request for shared layer.

  output [PYLD_S_W-1:0]   payload_o;   // Payload to master
  reg    [PYLD_S_W-1:0]   payload_o;   // interfaces.

  // Inputs - Pipeline stage.
  // Used to perform transaction masking while a masked t/x is accepted
  // into a pipeline stage.
  input [`ID_W-1:0] id_rs_i;
  input [LOG2_NUM_VIS_SP-1:0] local_slv_rs_i;

  // Inputs - Read Data or Burst Response Channel.
  input                  cpl_tx_i; // Read and write transaction
  input [`ID_W-1:0]      cpl_id_i; // completion signals.


  // Outputs - Write data channel.
  output [ACT_IDS_W-1:0]    act_ids_o;    // Active IDs bus.
  output [ACT_SNUMS_W-1:0]  act_snums_o;  // Active slave numbers bus.


  output [MAX_UIDA-1:0] issuedtx_slot_oh_o; // Which ID slot has had a
                                            // transaction issued.

  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------
  reg                  cpl_tx_r; // Registered versions of completion
  reg [`ID_W-1:0]      cpl_id_r; // signals, for timing considerations.


  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  wire [LOG2_NUM_VIS_SP-1:0] local_slv_idcdr; // Local slave number
                                              // from the internal
                                                   // address decoder.

  wire [LOG2_NUM_VIS_SP-1:0] local_slv_xdcdr; // Slave number from the
                                              // external address
                                                   // decoder mapped to a
                                                   // local slave number.

  wire [LOG2_NUM_VIS_SP-1:0] local_slv_mux; // Result of mux between
                                            // internal slave number and
                                                 // slave number coming from
                                                 // external decoder.

  wire [LOG2_NUM_VIS_SP-1:0] local_slv_tzone; // Local slave number
                                              // from the tzone block.

  wire [LOG2_NUM_VIS_SP-1:0] local_slv; // Local slave number
                                        // muxed between slave number
                                            // from trust zone block
                                            // and slave number before trust
                                            // zone block.

  wire [`ID_W-1:0]     id_mst;   // ID and address signals from master.
  wire [`AXI_AW-1:0]   addr_mst;

  // Wires for unconnected sub module ports.
  wire [`AXI_LOG2_NSP1-1:0] sys_slv_unconn;
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] bidi_sys_pnum_oh_unconn;

  // Asserted when the addressed slave is on the shared layer.
  wire slv_on_shrd_mux;
  wire slv_on_shrd_xdcdr;
  wire slv_on_shrd_idcdr;

  wire valid_lp;



  // When the master is exiting from Low Power the clock might
  // take a few cycles to come back after CACTIVE asserts. During
  // this time the slave can see the valid and will accept the
  // transaction. But the master doesn't get a READY assertion
  // since it is being masked. valid_lp will block the master
  // from keep sending the transfer until the low power controller
  // brings the clock back into the system and READY is unmasked.
     assign valid_lp = valid_i;


  // Extract ID and address signals from payload_i.
  assign addr_mst
    = payload_i[`AXI_ARPYLD_ADDR_LHS:`AXI_ARPYLD_ADDR_RHS];

  assign id_mst
    = payload_i[`AXI_AWPYLD_ID_RHS_M+`ID_W-1:`AXI_AWPYLD_ID_RHS_M];


  //--------------------------------------------------------------------
  // Instantiate the address decoder block.
  //--------------------------------------------------------------------
  DW_axi_dcdr
  
  #(NUM_VIS_SP,      // Number of slaves visible to this master port.
    LOG2_NUM_VIS_SP, // Log 2 of NUM_VIS_SP.

    // Normal mode slave visibility parameters.
     S0_N_VIS,  S1_N_VIS,  S2_N_VIS, S3_N_VIS,   S4_N_VIS, S5_N_VIS,
     S6_N_VIS,  S7_N_VIS,  S8_N_VIS, S9_N_VIS,  S10_N_VIS, S11_N_VIS,
    S12_N_VIS, S13_N_VIS, S14_N_VIS, S15_N_VIS, S16_N_VIS,

    // Boot mode slave visibility parameters.
     S0_B_VIS,  S1_B_VIS,  S2_B_VIS,  S3_B_VIS,  S4_B_VIS,  S5_B_VIS,
     S6_B_VIS,  S7_B_VIS,  S8_B_VIS,  S9_B_VIS, S10_B_VIS, S11_B_VIS,
    S12_B_VIS, S13_B_VIS, S14_B_VIS, S15_B_VIS, S16_B_VIS,

    HAS_SHARED, // Is there a shared layer for this channel.

    // Source on shared or dedicated layer parameters.
     SHARED_S0,  SHARED_S1,  SHARED_S2,  SHARED_S3,
     SHARED_S4,  SHARED_S5,  SHARED_S6,  SHARED_S7,
     SHARED_S8,  SHARED_S9, SHARED_S10, SHARED_S11,
    SHARED_S12, SHARED_S13, SHARED_S14, SHARED_S15,
    SHARED_S16
  )
  U_mp_addrch_dcdr (
    // Inputs.
    .addr_i        (addr_mst),
    .remap_n_i     (remap_n_i),

    // Outputs.
    .local_slv_o   (local_slv_idcdr),
    .slv_on_shrd_o (slv_on_shrd_idcdr),
    .sys_slv_o     (sys_slv_unconn) // Unconnected, not used here.
  );




  // Mux between slave number from external decoder and slave
  // number from internal decoder.
  assign local_slv_mux = `AXI_HAS_XDCDR
                         ? local_slv_xdcdr
                            : local_slv_idcdr;

  // Select from slv_on_shrd signal from external decoder and internal
  // decoder.
  // If the trustzone block is enabled it could re route a t/x to the
  // deafult slave if an un secure access was attempted to a secure
  // slave. If this has happened we need to check if the default
  // slave is accessed via the shared layer from here, so we can
  // assert the shared layer request signal.
  assign slv_on_shrd_mux =
    (`AXI_HAS_TZ_SUPPORT & (local_slv_mux != local_slv_tzone))
    ? (SHARED_S0 == 1'b1)
    : `AXI_HAS_XDCDR
      ? slv_on_shrd_xdcdr
      : slv_on_shrd_idcdr;




  // Mux between local slave number output from trust zone block and
  // local slave number before trust zone block.
  assign local_slv = `AXI_HAS_TZ_SUPPORT
                     ? local_slv_tzone
                       : local_slv_mux;


  // Registering completion signals from read or write data channels
  // for timing performance reasons.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : completion_regs_PROC
    if(!aresetn_i) begin
      cpl_tx_r <= 1'b0;
      cpl_id_r <= {`ID_W{1'b0}};
    end else begin
      cpl_tx_r <= cpl_tx_i;
      cpl_id_r <= cpl_id_i;
    end
  end // completion_regs_PROC


  //--------------------------------------------------------------------
  // Instantiate id mask block.
  //--------------------------------------------------------------------
  DW_axi_mp_idmask
  
  #(
    MAX_CA_ID,          // Number of active transactions allowed per id.
    MAX_UIDA,           // Number of unique id's that the master may
                        // have outstanding transactions for at any
                           // time.
    LOG2_MAX_CA_ID_P1,  // Log 2 of MAX_CA_ID + 1.
    NUM_VIS_SP,         // Number of visible slave ports.
    LOG2_NUM_VIS_SP,    // Log 2 of number of visible slave ports.
    ACT_IDS_W,          // Width of active ID's bus.
    ACT_SNUMS_W,        // Width of active slave number's bus.
    ACT_COUNTS_W,       // Width of active transaction count per id bus.
    TMO,                // Channel timing mode option.
    PL_ARB,             // Arbiter pipeline stage ?

    // Port visibility parameters.
    `S0_VIS, `S1_VIS, `S2_VIS, `S3_VIS, `S4_VIS, `S5_VIS, `S6_VIS,
    `S7_VIS, `S8_VIS, `S9_VIS, `S10_VIS, `S11_VIS, `S12_VIS, `S13_VIS,
    `S14_VIS, `S15_VIS, `S16_VIS,

    // Source on shared or dedicated layer parameters.
     SHARED_S0,  SHARED_S1,  SHARED_S2,  SHARED_S3,
     SHARED_S4,  SHARED_S5,  SHARED_S6,  SHARED_S7,
     SHARED_S8,  SHARED_S9, SHARED_S10, SHARED_S11,
    SHARED_S12, SHARED_S13, SHARED_S14, SHARED_S15,
    SHARED_S16,

    // Which sinks have shared to dedicatd links ?
     SHRD_DDCTD_S0,  SHRD_DDCTD_S1,  SHRD_DDCTD_S2,  SHRD_DDCTD_S3,
     SHRD_DDCTD_S4,  SHRD_DDCTD_S5,  SHRD_DDCTD_S6,  SHRD_DDCTD_S7,
     SHRD_DDCTD_S8,  SHRD_DDCTD_S9, SHRD_DDCTD_S10, SHRD_DDCTD_S11,
    SHRD_DDCTD_S12, SHRD_DDCTD_S13, SHRD_DDCTD_S14, SHRD_DDCTD_S15,
    SHRD_DDCTD_S16,

    WCH                 // Is this a write address channel.
  )
  U_DW_axi_mp_idmask (
    // Inputs - System.
    .aclk_i                      (aclk_i),
    .aresetn_i                   (aresetn_i),

    // Inputs - Channel Source.
    .valid_i                     (valid_lp),
    .ready_mst_i                 (ready_o),
    .id_i                        (id_mst),
    .local_slv_i                 (local_slv),
    .id_rs_i                     (id_rs_i),
    .local_slv_rs_i              (local_slv_rs_i),

    // Inputs - Channel Destination.
    .ready_i                     (ready_o),
    .aw_shrd_lyr_granted_s_bus_i (aw_shrd_lyr_granted_s_bus_i),
    .issued_wtx_shrd_sys_s_bus_i (issued_wtx_shrd_sys_s_bus_i),

    // Inputs - Completion channel.
    .cpl_tx_i                    (cpl_tx_r),
    .cpl_id_i                    (cpl_id_r),
    // Outputs - Channel Destination.
    .mask_valid_o                (mask_valid_o),

    // Outputs - Write data channel.
    .act_ids_o                   (act_ids_o),
    .act_snums_o                 (act_snums_o),
    .issuedtx_slot_oh_o          (issuedtx_slot_oh_o)
  );



  // Demultiplex the valid line from the master to the
  // valid line for the addressed slave.
  always @(*)
  begin : bus_valid_o_PROC
    integer slvnum;

    bus_valid_o = {NUM_VIS_SP{1'b0}};

    for(slvnum=0 ;
        slvnum<=(NUM_VIS_SP-1) ;
        slvnum=slvnum+1
)
    begin
      if((local_slv==slvnum)
         & valid_lp
         // Masking is done here if there is no pipeline stage in the
         // channel. Otherwise masking is done in the first pipeline
         // stage.
         & (~mask_valid_o | (TMO!=0) | PL_ARB)
)
      begin
         bus_valid_o[slvnum] = 1'b1;
      end
    end

  end // bus_valid_o_PROC


  // Single bit valid output, masked in same way as bus_valid_o.
  assign valid_o = valid_lp & (~mask_valid_o | (TMO!=0) | PL_ARB);

  // Generate request for the shared layer, if it exists.
  // Masking is done here if there is no pipeline stage in the
  // channel. Otherwise masking is done in the first pipeline
  // stage.
  assign shrd_ch_req_o
    = HAS_SHARED
      ? ((~mask_valid_o | (TMO!=0) | PL_ARB)
          & slv_on_shrd_mux
          & valid_lp
)
      : 1'b0;

  // The Leda warning "Signal is read before being assigned" is
  // incorrectly firing and a CRM has been filed, hence the warning can
  // be disabled:
  // leda FM_2_36 off

  // Append master port number to the id component of payload_i to form
  // payload_o.
  // Have to do this using a for loop because of complications with
  // the configurable presence of sideband signals in the payload bus.
  always @(*)
  begin : append_mstnum_to_id_PROC
    integer pyld_bit;
    integer id_bit;
    reg [`AXI_SIDW-1:0] sidw;

    id_bit = 0;
    sidw = {MS_NUM,
            payload_i[`AXI_ARPYLD_ID_LHS_M:`AXI_ARPYLD_ID_RHS_M]};

    if (`AXI_NUM_SYS_MASTERS == 1 || ICM_PORT == 1) begin
      // No master port bits to append if only 1 system master
      // or interconnecting master port.
      payload_o = payload_i;
    end else begin
      for(pyld_bit=0 ;
          pyld_bit<=(PYLD_S_W-1) ;
          pyld_bit=pyld_bit+1
) begin
        // Assign fields up to id field.
        if(pyld_bit<`AXI_ARPYLD_ID_RHS_M) begin
          payload_o[pyld_bit] = payload_i[pyld_bit];

        // Assign id field.
        end else if((pyld_bit>=`AXI_ARPYLD_ID_RHS_M)
                     && (pyld_bit<=(`AXI_ARPYLD_ID_LHS_M+`AXI_LOG2_NM))
)
        begin
          payload_o[pyld_bit] = sidw[id_bit];
           id_bit = id_bit+1;

        // Assign fields after id fields.
        end else begin
            payload_o[pyld_bit] = payload_i[pyld_bit-`AXI_LOG2_NM];
        end
      end
    end // if (`AXI_NUM_MASTERS == 1)

  end // append_mstnum_to_id_PROC

  // leda FM_2_36 on

  // Connect ready to the master.
  // Use ready directly from the pipeline stage or slave ports.
  // If Low Power handshaking interface is enabled, ready_o will
  // be hold low while the system is in Low Power mode. This
  // will block the master from being woken up by other master
  // whose clock is free running.
     assign ready_o = ready_i;

  // Undefine here to avoid macros when redefined in other
  // blocks.
  `undef S0_VIS
  `undef S1_VIS
  `undef S2_VIS
  `undef S3_VIS
  `undef S4_VIS
  `undef S5_VIS
  `undef S6_VIS
  `undef S7_VIS
  `undef S8_VIS
  `undef S9_VIS
  `undef S10_VIS
  `undef S11_VIS
  `undef S12_VIS
  `undef S13_VIS
  `undef S14_VIS
  `undef S15_VIS
  `undef S16_VIS
  `undef PAYLOAD_W
  `undef ID_W

endmodule
