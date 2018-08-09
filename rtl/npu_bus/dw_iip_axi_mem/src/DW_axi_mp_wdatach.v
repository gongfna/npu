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
** File     : DW_axi_mp_wdatach.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : This block implements the master port write data channel.
**
** ---------------------------------------------------------------------
*/

module DW_axi_mp_wdatach (
  // Inputs - System.
  aclk_i,
  aresetn_i,

  // Inputs - External Master.
  valid_i,
  payload_i,

  // Outputs - External Master.
  ready_o,

  // Inputs - Slave Ports.
  ready_i,

  // Outputs - Slave Ports.
  bus_valid_o,
  valid_o,
  mask_valid_o,
  shrd_ch_req_o,
  payload_o,

  // Inputs - Pipeline stage.
  id_rs_i,

  // Inputs  - Write Address Channel.
  act_ids_i,
  act_snums_i,
  issuedtx_slot_oh_i
);


//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter MS_NUM = 0; // Master system number.
  parameter ICM_PORT = 0; // Master system number.

  parameter NUM_VIS_SP = 16;  // Number of visible slave ports.

  parameter LOG2_NUM_VIS_SP = 16;  // Log base 2 of NUM_VIS_SP.

  parameter TMO = 0; // W channel timing option.

  parameter PL_ARB = 0; // 1 if arbiter outputs are pipelined.

  parameter PYLD_M_W = `AXI_W_PYLD_M_W; // W channel payload width
                                        // from master.
  parameter PYLD_S_W = `AXI_W_PYLD_S_W; // W channel payload width to
                                        // slave.

  parameter ACT_IDS_W = 16;   // Width of active write IDs bus.
  parameter ACT_SNUMS_W = 8;  // Width of active slave numbers bus.
  parameter ACT_COUNTS_W = 8; // Width of active write count per ID bus.

  parameter MAX_UIDA = 4; // Number of unique ID's that may be
                          // active at any time.

  parameter LOG2_MAX_CA_ID_P1 = 3; // Log base 2 of MAX_CA_ID + 1.

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

  // Inputs - External Master.
  input                   valid_i; // Valid from external
                                   // master.
  input [`PAYLOAD_W-1:0]  payload_i; // Payload from external
                                     // master.

  // Outputs - External Master.
  output ready_o; // Ready to external master.

  // Inputs - Slave Ports.
  input ready_i; // Ready signals from all slave ports.

  // Outputs - Slave Ports.
  output [NUM_VIS_SP-1:0] bus_valid_o; // Valid to slave ports.
  reg    [NUM_VIS_SP-1:0] bus_valid_o;

  output valid_o; // Single bit valid output, used to avoid requiring
                  // an OR reduction on bus_valid_o in the internal
                  // register slice blocks.

  // Asserted when a valid signal should be masked.
  output                  mask_valid_o;
  output                  shrd_ch_req_o; // Request for shared layer.
  output [PYLD_S_W-1:0]   payload_o;   // Payload to slave ports.
  reg    [PYLD_S_W-1:0]   payload_o;

  // Inputs - Pipeline stage.
  // Used to perform transaction masking while a masked t/x is accepted
  // into a pipeline stage.
  input [`ID_W-1:0] id_rs_i;

  // Inputs - Write Address Channel.
  input [ACT_IDS_W-1:0]   act_ids_i;    // Active write IDs bus.
  input [ACT_SNUMS_W-1:0] act_snums_i;  // Active write slave numbers
                                        // bus.

  input [MAX_UIDA-1:0] issuedtx_slot_oh_i; // Bit asserted for the ID
                                           // slot that has had a t/x
                                               // issued.

  //--------------------------------------------------------------------
  // VARIABLES.
  //--------------------------------------------------------------------
  reg [MAX_UIDA-1:0] id_slot_match_oh; // One hot bus which tells us
                                       // which id slot wid matched
                                           // to. Will be 0 if it matches
                                           // to no active slot.

  reg [MAX_UIDA-1:0] id_slot_match_oh_r; // id_slot_match_oh registered.

  reg [ACT_IDS_W-1:0]   act_ids_r;    // Registered verisions of
  reg [ACT_SNUMS_W-1:0] act_snums_r;  // corresponding input signals.

  reg [ACT_COUNTS_W-1:0] act_wcounts_r; // Count of number of
                                        // outstanding write data parts
                                             // of write transactions.

  reg [ACT_COUNTS_W-1:0] act_wcounts_nxt; // Next active write counts
                                          // register value.

  reg [MAX_UIDA-1:0] issuedtx_slot_oh_r; // Registered version of the
                                         // corresponding input port.

  reg waiting_for_tx_acc_r; // Reg to tell us when we are waiting for
                            // a t/x to be accepted.

  // Asserted when the t/x currently being masked has been accepted into
  // the pipeline stage(s) already.
  reg masked_tx_acc_by_pl_r;

  // Asserted when the last t/x of a burst, currently being masked, has
  // been accepted into the pipeline stage(s) already.
  reg masked_last_tx_acc_by_pl_r;

  wire [LOG2_NUM_VIS_SP-1:0] local_slv; // Local slave number, selected
                                        // by the incoming id value
                                            // from the act_snums_i
                                            // bus.

  wire [`AXI_NSP1-1:0] sys_slv_oh; // One hot system slave number.
  // Max sized version of sys_slv_oh.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] sys_slv_oh_max;

  wire valid_mskd; // Masked version of valid_i from the id mask
                   // block.

  wire [`AXI_LOG2_NM-1:0] ms_num; // Wire to hold the master system
                                  // number of this master port.

  wire wd_cpl_acc; // Asserted when completion of write data part
                   // of write t/x is accepted.

  reg wd_cpl_acc_r; // registered.

  wire [MAX_UIDA-1:0] wd_cpl_acc_slot_oh; // Bit asserted for each
                                          // slot the write data
                                               // part of a t/x for that
                                               // slot has completed.

  wire last; // wlast signal extracted from payload.

  wire [`ID_W-1:0] id; // wid extracted from payload.

  wire tx_issued; // Asserted when a transaction is issued in this
                  // channel.

  // ID value used to generate the mask. Selected
  // between the master input (decoded) values and the values stored
  // in the first pipeline stage.
  wire [`ID_W-1:0] id_mux;

  // Bit for each slave, asserted if this master port accesses that
  // slave on the shared layer.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] shared_s_bus;

  wire slv_on_shrd; // Asserted when decoded slave is accessed via
                    // shared layer.

  wire reissue_wvalid; // Asserted when a masked wvalid (t/x) should be
                       // reissued.

  // Signals from AW MP, selected from registered version or non
  // registered depending on `AXI_REG_AW_W_PATHS.
  wire [ACT_IDS_W-1:0]   act_ids_mux;
  wire [ACT_SNUMS_W-1:0] act_snums_mux;
  wire [MAX_UIDA-1:0] issuedtx_slot_oh_mux;

  wire valid_lp;

  // When the master is exiting from Low Power the clock might
  // take a few cycles to come back after CACTIVE asserts. During
  // this time the slave can see the valid and will accept the
  // transaction. But the master doesn't get a READY assertion
  // since it is being masked. valid_lp will block the master
  // from keep sending the transfer until the low power controller
  // brings the clock back into the system and READY is unmasked.
     assign valid_lp = valid_i;


  // Register these signals from the write address channel for
  // timing performance reasons.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : id_slots_r_PROC
    if(!aresetn_i) begin
      act_ids_r    <= {ACT_IDS_W{1'b0}};
      act_snums_r  <= {ACT_SNUMS_W{1'b0}};
    end else begin
      act_ids_r    <= act_ids_i;
      act_snums_r  <= act_snums_i;
    end
  end // id_slots_r_PROC

  // Are AW to W paths registered.
  assign act_ids_mux = `AXI_REG_AW_W_PATHS ? act_ids_r : act_ids_i;
  assign act_snums_mux = `AXI_REG_AW_W_PATHS ? act_snums_r : act_snums_i;


  // Extract signals from payload.
  assign id
    = payload_i[`AXI_WPYLD_ID_RHS_M+`ID_W-1:`AXI_WPYLD_ID_RHS_M];

  assign last = payload_i[`AXI_WPYLD_LAST];


  // Register signal to tell us when we are waiting for a t/x to
  // be accepted.
  always @(negedge aresetn_i or posedge aclk_i)
  begin : waiting_for_tx_acc_r_PROC
    if(!aresetn_i) begin
      waiting_for_tx_acc_r <= 1'b0;
    end else begin
      if(waiting_for_tx_acc_r) begin
         // T/x accepted.
        waiting_for_tx_acc_r <= !ready_i;
      end else begin
         // Set this register if valid is asserted and not accepted.
        // Don't set if this t/x has already been accepted by the channel
        // pipeline, in this case the master will already have removed the
        // valid for the t/x, so we don't need to worry about the t/x
        // masking itself.
        waiting_for_tx_acc_r
          <=   valid_mskd
             & ~ready_i
             & ~masked_tx_acc_by_pl_r;
      end
    end
  end // waiting_for_tx_acc_r_PROC


  // Assert this output when a transaction has been issued from the
  // slave port.
  assign tx_issued =   // Valid asserted for new t/x, i.e. not waiting
                       // for previous to be accepted.
                        valid_mskd & !waiting_for_tx_acc_r
                       // Mask signal for t/x previously accepted into
                       // pipeline deasserts, t/x is issued now.
                     | (masked_tx_acc_by_pl_r & ~mask_valid_o);


  //--------------------------------------------------------------------
  // Maintain count of the outstanding number of write data parts of
  // transactions outstanding for each unique ID.
  // This is necessary because we can't use the ID slot count value
  // from the address channel, as this is only decremented on
  // transaction completion.
  // If we used that count value we could route a write data transfer
  // to the wrong slave because we have matched it to an active ID slot
  // when the ID slot was actually just waiting for the burst response
  // to come back.
  // So by maintaining a count per unique ID that is decremented on
  // wvalid , wready and wlast, and masking an incoming valid if this
  // count is zero for the slot the incoming ID matches too, we will
  // fix this problem.
  //--------------------------------------------------------------------

  // Register this signal from the write address channel.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : issuedtx_slot_oh_r_PROC
    if(!aresetn_i) begin
      issuedtx_slot_oh_r <= {MAX_UIDA{1'b0}};
    end else begin
      issuedtx_slot_oh_r <= issuedtx_slot_oh_i;
    end
  end // issuedtx_slot_oh_r_PROC

  // Are AW to W paths registered.
  assign issuedtx_slot_oh_mux = `AXI_REG_AW_W_PATHS
                                ? issuedtx_slot_oh_r
                                : issuedtx_slot_oh_i;

  // Decode when completion of write data part of t/x has been issued.
  assign wd_cpl_acc
    =   (valid_mskd & last & ready_i)
        // Decode when the last beat of a t/x was masked but accepted
        // into the pipeline and is being issued now.
        // Only required when there is a pipeline stage in the channel.
      | ((masked_last_tx_acc_by_pl_r & ~mask_valid_o)
          & ((TMO != 0) | (PL_ARB == 1))
);

  // Need to register this path to avoid a combinatorial loop.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : wd_cpl_acc_r_PROC
    if(!aresetn_i) begin
      wd_cpl_acc_r <= 1'b0;
    end else begin
      wd_cpl_acc_r <= wd_cpl_acc;
    end
  end // wd_cpl_acc_r_PROC


  // Decode which slot the completing write data is for.
  assign wd_cpl_acc_slot_oh =   {MAX_UIDA{wd_cpl_acc_r}}
                              & id_slot_match_oh_r;


  //--------------------------------------------------------------------
  // Active write data counts per unique ID register.
  //--------------------------------------------------------------------
  always @(posedge aclk_i or negedge aresetn_i)
  begin : act_wcounts_r_PROC
    if(!aresetn_i) begin
      act_wcounts_r <= {ACT_COUNTS_W{1'b0}};
    end else begin
      act_wcounts_r <= act_wcounts_nxt;
    end
  end // act_wcounts_r_PROC

  // Due to loop varaible limitations range overflow is not possible,
  // hence the Leda warning can be disabled:
  // leda FM_2_22 off

  //--------------------------------------------------------------------
  // Proc for register containing the number of write data parts of
  // write transactions for every unique ID slot.
  //--------------------------------------------------------------------
  always @(*)
  begin : act_wcounts_nxt_PROC
    reg [LOG2_MAX_CA_ID_P1-1:0] count;

    integer  slot_num;
    integer  count_bit;

    act_wcounts_nxt = {ACT_COUNTS_W{1'b0}};

    for(slot_num=0 ;
        slot_num<=(MAX_UIDA-1) ;
        slot_num=slot_num+1
)
    begin

      // Get count value for this slot.
      for(count_bit=0 ;
           count_bit<=(LOG2_MAX_CA_ID_P1-1) ;
           count_bit=count_bit+1
)
      begin
        count[count_bit]
         = act_wcounts_r[(slot_num*LOG2_MAX_CA_ID_P1)+count_bit];
      end

      case({ issuedtx_slot_oh_mux[slot_num],
              wd_cpl_acc_slot_oh[slot_num] })

         // leda W192 off
         // No transaction issued and none completed, or transaction
         // issued and completed in same cycle for this id slot
         // means no change in active transaction count value for
         // for this id slot.
         2'b00,
         2'b11 : begin
         end
         // leda W192 on

         // Transaction completed and no transaction issued
         // for this id slot, means decrement active transaction
         // count value.
         2'b01 : begin
                count = count - 1'b1;
         end

         // Transaction issued and no transaction completed
         // for this id slot, means increment active transaction
         // count value.
         2'b10 : begin
                count = count + 1'b1;
         end

      endcase

      // Assign count back into the act_wcounts_nxt bus.
      for(count_bit=0 ;
           count_bit<=(LOG2_MAX_CA_ID_P1-1) ;
           count_bit=count_bit+1
)
      begin
         act_wcounts_nxt[(slot_num*LOG2_MAX_CA_ID_P1)+count_bit]
         = count[count_bit];
      end

    end // for(slot_num=0

  end // act_wcounts_nxt_PROC


  //--------------------------------------------------------------------
  // Find active ID slot that the incoming id value matches to.
  //--------------------------------------------------------------------
  always @(*)
  begin : id_slot_match_oh_PROC

    integer slotnum;
    integer idbit;
    integer countbit;

    reg [`ID_W-1:0]         slot_id;
    reg [LOG2_MAX_CA_ID_P1-1:0] slot_count;

    id_slot_match_oh = {MAX_UIDA{1'b0}};

    for(slotnum=0; slotnum<=(MAX_UIDA-1) ; slotnum=slotnum+1) begin

      // ID value for this slot.
      for(idbit=0; idbit<=(`ID_W-1) ; idbit=idbit+1) begin
        slot_id[idbit] = act_ids_mux[(slotnum*`ID_W)+idbit];
      end

      // Count value for this slot.
      for(countbit=0 ;
          countbit<=(LOG2_MAX_CA_ID_P1-1) ;
           countbit=countbit+1
) begin
        slot_count[countbit]
          = act_wcounts_nxt[(slotnum*LOG2_MAX_CA_ID_P1)+countbit];
      end

      // Does an active slot ID value match with id.
      if((slot_id == id_mux) &&
          (slot_count != {LOG2_MAX_CA_ID_P1{1'b0}})
)
      begin
        id_slot_match_oh[slotnum] = 1'b1;
      end

    end

  end // id_slot_match_oh_PROC

  // leda FM_2_22 on


  // Create registered version of id_slot_match_oh.
  // Need to register this path to avoid a combinatorial loop.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : id_slot_match_oh_r_PROC
    if(~aresetn_i) begin
      id_slot_match_oh_r <= {MAX_UIDA{1'b0}};
    end else begin
      id_slot_match_oh_r <= id_slot_match_oh;
    end
  end

  // DC shows up no "incompatible width" issues so the Leda warning
  // is incorrect and hence can be disabled:
  // leda W110 off

  // Use id_slot_match_oh to select the slave number associated
  // the incoming ID value.
  DW_axi_busmux_ohsel
  
  #(MAX_UIDA,         // Number of buses to mux between.
    LOG2_NUM_VIS_SP   // Width of each bus input to the mux.
  )
  U_busmux_act_slv (
    .sel   (id_slot_match_oh),
    .din   (act_snums_mux),
    .dout  (local_slv)
  );
  // leda W110 on


  /*--------------------------------------------------------------------
   * Decode if locl_slv refers to a slave which this master accesses
   * through the shared layer.
   */

  DW_axi_lcltosys
  
  #(NUM_VIS_SP,       // Number of local slaves.
    LOG2_NUM_VIS_SP,
    `AXI_NSP1,        // Number of slaves on this interconnect instance.
    `AXI_LOG2_NSP1,

    // Port visibility parameters.
     `S0_VIS,  `S1_VIS,  `S2_VIS,  `S3_VIS,  `S4_VIS,  `S5_VIS,
     `S6_VIS,  `S7_VIS,  `S8_VIS,  `S9_VIS, `S10_VIS, `S11_VIS,
    `S12_VIS, `S13_VIS, `S14_VIS, `S15_VIS, `S16_VIS,

    1                 // Use 1-hot encoding.
  )
  U_DW_axi_lcltosys (
    // Inputs.
    .lcl_pnum_i     (local_slv),

    // Outputs.
    .sys_pnum_o     (sys_slv_oh)
  );

  // Assign to max sized version.
  assign sys_slv_oh_max = sys_slv_oh;

  // Bit for each slave, asserted if this master port accesses that
  // slave on the shared layer.
  assign shared_s_bus
    = {(SHARED_S16 ? 1'b1 : 1'b0),
       (SHARED_S15 ? 1'b1 : 1'b0),
       (SHARED_S14 ? 1'b1 : 1'b0),
       (SHARED_S13 ? 1'b1 : 1'b0),
       (SHARED_S12 ? 1'b1 : 1'b0),
       (SHARED_S11 ? 1'b1 : 1'b0),
       (SHARED_S10 ? 1'b1 : 1'b0),
       (SHARED_S9 ? 1'b1 : 1'b0),
       (SHARED_S8 ? 1'b1 : 1'b0),
       (SHARED_S7 ? 1'b1 : 1'b0),
       (SHARED_S6 ? 1'b1 : 1'b0),
       (SHARED_S5 ? 1'b1 : 1'b0),
       (SHARED_S4 ? 1'b1 : 1'b0),
       (SHARED_S3 ? 1'b1 : 1'b0),
       (SHARED_S2 ? 1'b1 : 1'b0),
       (SHARED_S1 ? 1'b1 : 1'b0),
       (SHARED_S0 ? 1'b1 : 1'b0)
      };

  // Decode if the addressed slave is on the shared layer.
  assign slv_on_shrd = HAS_SHARED
                       ? |(shared_s_bus & sys_slv_oh_max)
                       : 1'b0 ;

  // Conditions to mask valid.
  // - Incoming id matches to no active id value.
  // Because we register the effect of a beat once it is issued
  // not accepted we must control the mask signal such that a
  // valid does not get masked while it is waiting for a ready
  // to come back from the slave, we use waiting_for_tx_acc_r
  // for this purpose here.
  assign mask_valid_o =   (id_slot_match_oh == {MAX_UIDA{1'b0}})
                        & ~waiting_for_tx_acc_r;


  /* -------------------------------------------------------------------
   * Decode whether to use id and local slave inputs from the master,
   * or the pipeline stage.
   *
   * If there are pipeline stage(s) the mask will be generated from
   * the pipeline stage signals if (when) a masked t/x has been accepted
   * into the pipeline. This is required because the master can change
   * the channel signals after the t/x has been accepted (ready high),
   * but we need to hold the mask so we can block the t/x until the t/x
   * has been unmasked.
   *
   */

  // Detect when a masked t/x has been accepted into a pipeline stage.
  // Clear when the mask condition is cleared (mask_valid_o deasserts).
  // Note we use the timing mode and arbiter pipeline parameters to
  // remove the logic when there are no pipelines in the channel.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : masked_tx_acc_by_pl_r_PROC
    if(!aresetn_i) begin
      masked_tx_acc_by_pl_r <= 1'b0;
    end else begin
      if(~masked_tx_acc_by_pl_r) begin
        masked_tx_acc_by_pl_r
          <= mask_valid_o & valid_lp & ready_i
             & ((TMO != 0) | (PL_ARB == 1));
      end else begin
        masked_tx_acc_by_pl_r <= mask_valid_o;
      end
    end
  end // masked_tx_acc_by_pl_r_PROC

  // Detect when the masked last t/x of a burst has been accepted
  // into a pipeline stage. Used to generate the burst completion
  // signal when the masked t/x is unmasked and issued.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : masked_last_tx_acc_by_pl_r_PROC
    if(!aresetn_i) begin
      masked_last_tx_acc_by_pl_r <= 1'b0;
    end else begin
      if(~masked_last_tx_acc_by_pl_r) begin
        masked_last_tx_acc_by_pl_r
          <= mask_valid_o & valid_lp & ready_i & last
             & ((TMO != 0) | (PL_ARB == 1));
      end else begin
        masked_last_tx_acc_by_pl_r <= mask_valid_o;
      end
    end
  end // masked_last_tx_acc_by_pl_r_PROC

  /* -------------------------------------------------------------------
   * Select between master and pipeline stage id signals.
   */
  assign id_mux = masked_tx_acc_by_pl_r
                  ? id_rs_i
                  : id;


  // Generate masked valid output.
  // Valid in masked or for a non combinatorial timing mode
  // - tx_reissued (registered timing modes only).
  assign valid_mskd = valid_lp & !mask_valid_o;

  // Generate request for the shared layer, if it exists.
  // Masking is done here if there is no pipeline stage in the
  // channel. Otherwise masking is done in the first pipeline
  // stage.
  assign shrd_ch_req_o
    = HAS_SHARED
      ? ((~mask_valid_o | (TMO!=0) | PL_ARB)
          & slv_on_shrd
          & (valid_lp
               // If a pipeline stage exists, have to reissue this
               // signal when a masked beat, which was accepted
               // into the pipeline, has now been unmasked.
               // For full explanation see comment on similar code
               // ini generation of bus_valid_o.
             | (({mask_valid_o,masked_tx_acc_by_pl_r} == 2'b01)
                 & ((TMO!=0) | PL_ARB)
)
)
)
      : 1'b0;


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
         & (valid_lp | reissue_wvalid)
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

  // Generate single bit valid output.
  assign valid_o =   (valid_lp | reissue_wvalid)
                   // Masking is done here if there is no pipeline stage in the
                   // channel. Otherwise masking is done in the first pipeline
                   // stage.
                   & (~mask_valid_o | (TMO!=0) | PL_ARB);


  // If there is a pipeline stage in this channel,  a masked t/x is
  // first accepted into the first pipeline and masked there.
  // But since the correct valid signals (target slave) cannot be
  // generated until the mask is cleared, and the master valid is gone
  // after being accepted into the pipeline, here we generate new valid
  // signals to the pipeline stage when the mask has been cleared
  // (decoded as a falling edge of mask_valid_o.
  // The pipeline stage block will in turn capture the new valid signals
  // and send the unmasked t/x to the correct slave.
  assign reissue_wvalid
    = (({mask_valid_o,masked_tx_acc_by_pl_r} == 2'b01)
       & ((TMO!=0) | PL_ARB)
);

  // Assign MS_NUM parameter to a wire variable.
  assign ms_num = MS_NUM;

  // The Leda warning "Signal is read before being assigned" is incorrectly
  // firing and a CRM has been filed, hence the warning can be disabled:
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
    sidw = {ms_num,
            payload_i[`AXI_WPYLD_ID_LHS_M:`AXI_WPYLD_ID_RHS_M]};

    if (`AXI_NUM_SYS_MASTERS == 1 || ICM_PORT == 1) begin
      // No master port bits to append if only 1 system master.
      payload_o = payload_i;
    end else begin
      for(pyld_bit=0 ; pyld_bit<=(PYLD_S_W-1) ; pyld_bit=pyld_bit+1) begin
        // Assign fields up to id field.
        if(pyld_bit<`AXI_WPYLD_ID_RHS_M) begin
          payload_o[pyld_bit] = payload_i[pyld_bit];

        // Assign id field.
        end else if((pyld_bit>=`AXI_WPYLD_ID_RHS_M)
                     && (pyld_bit<=`AXI_WPYLD_ID_LHS_M+`AXI_LOG2_NM)
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

  `undef PAYLOAD_W
  `undef ID_W

endmodule
