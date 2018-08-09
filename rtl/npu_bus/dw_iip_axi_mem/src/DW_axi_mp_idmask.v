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
** File     : DW_axi_mp_idmask.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : The purpose of this block is to mask the valid signal
**            for transactions that break the outstanding transaction
**            rules, and also to maintain a table of active id values
**            along with the slave numbers and the number of
**            transactions outstanding for the id value.
**
** ---------------------------------------------------------------------
*/

module DW_axi_mp_idmask (
  // Inputs - System.
  aclk_i,
  aresetn_i,

  // Inputs - Channel Source.
  valid_i,
  ready_mst_i,
  id_i,
  local_slv_i,
  id_rs_i,
  local_slv_rs_i,

  // Inputs - Channel Destination.
  ready_i,
  aw_shrd_lyr_granted_s_bus_i,
  issued_wtx_shrd_sys_s_bus_i,

  // Inputs - Completion channel.
  cpl_tx_i,
  cpl_id_i,


  // Outputs - Channel Destination.
  mask_valid_o,

  // Outputs - Write data channel.
  act_ids_o,
  act_snums_o,
  issuedtx_slot_oh_o
);


//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------

  parameter MAX_CA_ID = 4; // Number of active transactions allowed
                           // per id value.

  parameter MAX_UIDA  = 4; // Number of unique id values that the
                           // external master can have active
                             // transactions for at any one time.

  parameter LOG2_MAX_CA_ID_P1 = 3; // Log base 2 of MAX_CA_ID + 1.

  parameter NUM_VIS_SP  = 2; // Num. visible slave ports.

  parameter LOG2_NUM_VIS_SP  = 2; // Log base 2 of number of visible
                                  // slave ports.


  parameter ACT_IDS_W    = 16; // Width of active IDs bus.
  parameter ACT_SNUMS_W  = 8;  // Width of active slave numbers bus.
  parameter ACT_COUNTS_W = 8;  // Width of active count per ID bus.

  parameter TMO = 0; // Channel timing option.

  parameter PL_ARB = 0; // 1 if arbiter outputs are pipelined.

  // Visibility of each slave port to this master port.
  parameter VIS_S0 = 0;
  parameter VIS_S1 = 0;
  parameter VIS_S2 = 0;
  parameter VIS_S3 = 0;
  parameter VIS_S4 = 0;
  parameter VIS_S5 = 0;
  parameter VIS_S6 = 0;
  parameter VIS_S7 = 0;
  parameter VIS_S8 = 0;
  parameter VIS_S9 = 0;
  parameter VIS_S10 = 0;
  parameter VIS_S11 = 0;
  parameter VIS_S12 = 0;
  parameter VIS_S13 = 0;
  parameter VIS_S14 = 0;
  parameter VIS_S15 = 0;
  parameter VIS_S16 = 0;

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
  `define ID_W `AXI_MIDW

  `define REG_INTER_BLOCK_PATHS 0

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

  // Inputs - System.
  input aclk_i;    // AXI system clock.
  input aresetn_i; // AXI system reset.

  // Inputs - Channel Source.
  input                       valid_i;

  input                       ready_mst_i; // Ready signal to master.

  input [`ID_W-1:0]           id_i; // Incoming ID value aligned with
                                    // address (i.e. decoding).

  input [LOG2_NUM_VIS_SP-1:0] local_slv_i; // Local slave number aligned
                                           // with address.

  // ID and slave number signals from the first pipeline stage.
  // Used to generate the mask signal when a masked t/x is accepted
  // into the pipeline, until the mask is cleared and the masked t/x
  // can be issued.
  input [`ID_W-1:0]           id_rs_i;
  input [LOG2_NUM_VIS_SP-1:0] local_slv_rs_i;


  // Inputs - Channel Destination.
  input ready_i;

  // Bit for each attached slave, asserted if the slaves dedicated layer
  // has granted the shared layer.
  input [NUM_VIS_SP-1:0]  aw_shrd_lyr_granted_s_bus_i;

  // Bit for each attached slave, asserted if this master port was
  // requesting to the slave on the shared to dedicated link.
  input [NUM_VIS_SP-1:0] issued_wtx_shrd_sys_s_bus_i;


  // Inputs - Completion Channel.
  // i.e. read address channel <=> read data channel.
  // i.e. write address channel <=> burst response channel.
  input                 cpl_tx_i; // Asserted to this block when a
                                  // transaction has completed.
  input [`ID_W-1:0]     cpl_id_i; // ID of the transaction that
                                  // completed with the assertion of
                                      // cpl_tx_i.

  // Outputs - Channel Destination.
  output mask_valid_o; // Asserted when valid output is to be masked.

  // Outputs - Write data channel.
  output [ACT_IDS_W-1:0]    act_ids_o;    // Bus containing all active
                                          // ID values.
  output [ACT_SNUMS_W-1:0]  act_snums_o;  // Bus containing all active
                                          // slave numbers.

  output [MAX_UIDA-1:0] issuedtx_slot_oh_o; // One hot signal with a
                                            // bit for each id slot. Bit
                                                 // asserted means
                                                 // transaction accepted for
                                                 // that ID slot.



  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------
//  reg [ACT_IDS_W-1:0]    act_ids_r;    // Regster containing all active
  reg [`ID_W*MAX_UIDA-1:0] act_ids_r;  // Regster containing all active
                                       // ID values.
  reg [ACT_SNUMS_W-1:0]  act_snums_r;  // Register containing all active
                                       // slave numbers.
  reg [ACT_COUNTS_W-1:0] act_counts_r; // Register containing active
                                       // transaction count for all
                                           // ID values.

//  reg [ACT_IDS_W-1:0]    act_ids_nxt;   // Pre register versions of
  reg [`ID_W*MAX_UIDA-1:0] act_ids_nxt; // Pre register versions of
  reg [ACT_SNUMS_W-1:0]  act_snums_nxt; // relevant *_r signals.

  reg [ACT_COUNTS_W-1:0] act_counts_nxt; // Next active count register
                                         // values.

  reg [MAX_UIDA-1:0] cpl_slot_num_oh; // One hot signal with a bit for
                                      // each id slot. An id slots bit
                                          // will be asserted if there
                                          // is a transaction completion for
                                          // the id value stored in that
                                          // id slot.

  reg [MAX_UIDA-1:0] slot_id_match_oh; // One hot signal with a bit for
                                       // each id slot. An id slots bit
                                          // will be asserted if the
                                           // incoming id_mux signal matches
                                           // with the the id value stored
                                           // in that id slot.

  reg [MAX_UIDA-1:0] freeslot_oh; // One hot signal with a bit for
                                  // each id slot. An id slots bit is
                                      // asserted if the incoming id
                                      // does not match to an active id
                                      // and that slot is the lowest
                                      // numbered inactive id slot.

  reg [MAX_UIDA-1:0] slot_inactive_oh; // One hot signal with a bit for
                                       // each id slot. If the count
                                           // value for a slot is 0 that
                                           // slots bit will be asserted
                                           // in this signal.

  reg waiting_for_tx_acc_r; // Reg to tell us when we are waiting for
                            // a t/x to be accepted.

  // Asserted when the t/x currently being masked has been accepted into
  // the pipeline stage(s) already.
  reg masked_tx_acc_by_pl_r;



  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  wire tx_issued; // Asserted when a transaction has been issued.

  wire [MAX_UIDA-1:0] issued_slot_num_oh; // One hot signal with a bit
                                          // for each id slot. An id
                                               // slots bit will be asserted
                                               // if a transaction is issued
                                               // for that slot.

  wire [LOG2_NUM_VIS_SP-1:0] slot_slv;  // Slave number stored in the id
                                        // slot that id_mux matches to.

  wire [LOG2_MAX_CA_ID_P1-1:0] slot_count; // Active transaction count
                                           // stored in the id slot that
                                                // id_mux matches to.

  wire id_txs_w_other_slv; // Asserted when incoming id_mux value has
                           // active transactions with another slave.

  wire id_slot_count_max; // Asserted when the active transaction count
                          // of the slot selected by id_mux is at its
                             // maximum value.

  wire id_nofree_nomatch; // Asserted when the incoming id_mux value
                          // does not match with any id slots and
                             // there are no free id slots.

  wire no_id_match; // Asserted when the incoming id_mux signal matches
                    // with no id slot.

  // ID and local slave value used to generate the mask. Selected
  // between the master input (decoded) values and the values stored
  // in the first pipeline stage.
  wire [`ID_W-1:0]           id_mux;
  wire [LOG2_NUM_VIS_SP-1:0] local_slv_mux;

  wire valid_mskd; // valid_i qualified with mask_valid_o.



  /* -------------------------------------------------------------------
   * For hybrid configurations, with shared to dedicated layer links,
   * with either the shared layer pipeline, or the arbiter pipeline
   * stage enabled, on the AW channel only, the following deadlock
   * scenario is possible.
   *
   * 1. Mx issues Mx_tx1 to Sx through shared to dedicated link.
   *    Since this t/x is accepted into shared layer pipeline, Mx can issue
   *    further t/x's to other slaves.
   *
   * 2. Mx issues Mx_tx2 to Sy.
   *
   * 3. Mx_tx1 has to wait for My_tx2 to complete @ Sx's dedicated
   *    layer.
   *
   * 4. My_tx2 is waiting (on the write channel) for My_tx1 to
   *    complete.
   *
   * 5. My_tx1 is waiting for Mx_tx2 to complete at Sy, hence
   *    deadlock
   *
   * To avoid this scenario, if this sends an AW t/x through the shared
   * to dedicatd link (and the other conditions above are met),
   * all other t/x's are masked until we decode that the shared to
   * dedicated layer t/x has reached the end point slave.
   *
   * Decoding that the t/x has reached the slave is done with the
   * following signals.
   *
   * aw_shrd_lyr_granted_s_bus_i : bit for each slave asserted when
   * the shared layer is granted at the slave.
   *
   * issued_wtx_shrd_sys_s_bus_i : bit for each slave, asserted when
   * this master is requesting from the shared layer to the slaves
   * dedicated layer.
   */

  // Bit for each slave, asserted if this master port accesses that
  // slave on the shared layer.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] shared_s_bus;
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

  // Bit for each slave, asserted if the slave has a shared to dedicated
  // link.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] shrd_ddctd_s_bus;
  assign shrd_ddctd_s_bus
    = {(SHRD_DDCTD_S16 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S15 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S14 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S13 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S12 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S11 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S10 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S9 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S8 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S7 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S6 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S5 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S4 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S3 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S2 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S1 ? 1'b1 : 1'b0),
       (SHRD_DDCTD_S0 ? 1'b1 : 1'b0)
      };

  // Contains a bit for each slave, asserted if the slave is accessed
  // through the shared layer here, but also has a shared to dedicated
  // link.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] shrd_here_has_shrd_ddctd_bus;
  assign shrd_here_has_shrd_ddctd_bus = shrd_ddctd_s_bus & shared_s_bus;

  // VIS_S* parameters collected into a bus.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] vis_bus;
  assign vis_bus =
    {(VIS_S16 ? 1'b1 : 1'b0),
     (VIS_S15 ? 1'b1 : 1'b0),
     (VIS_S14 ? 1'b1 : 1'b0),
     (VIS_S13 ? 1'b1 : 1'b0),
     (VIS_S12 ? 1'b1 : 1'b0),
     (VIS_S11 ? 1'b1 : 1'b0),
     (VIS_S10 ? 1'b1 : 1'b0),
     (VIS_S9 ? 1'b1 : 1'b0),
     (VIS_S8 ? 1'b1 : 1'b0),
     (VIS_S7 ? 1'b1 : 1'b0),
     (VIS_S6 ? 1'b1 : 1'b0),
     (VIS_S5 ? 1'b1 : 1'b0),
     (VIS_S4 ? 1'b1 : 1'b0),
     (VIS_S3 ? 1'b1 : 1'b0),
     (VIS_S2 ? 1'b1 : 1'b0),
     (VIS_S1 ? 1'b1 : 1'b0),
     (VIS_S0 ? 1'b1 : 1'b0)
    };

  // Reduce shrd_here_has_shrd_ddctd_bus down to bits for visible slaves
  // only.
  reg [NUM_VIS_SP-1:0] shrd_here_has_shrd_ddctd_bus_vis;
  always @(*) begin : shrd_here_has_shrd_ddctd_bus_vis_PROC
    integer ss;
    integer ls;
    ls = 0;
    shrd_here_has_shrd_ddctd_bus_vis = {NUM_VIS_SP{1'b0}};
    for(ss=0;ss<`AXI_MAX_NUM_USR_MSTS;ss=ss+1) begin
      if(vis_bus[ss]) begin
        shrd_here_has_shrd_ddctd_bus_vis[ls]
          = shrd_here_has_shrd_ddctd_bus[ss];
        ls=ls+1;
      end
    end
  end // shrd_here_has_shrd_ddctd_bus_vis_PROC


  // Select the bit relating the local_slv_mux.
  wire local_slv_mux_thru_shrd_ddctd;
  DW_axi_busmux
  
  #(NUM_VIS_SP,     // Number of buses to mux between.
    1,              // Width of each bus.
    LOG2_NUM_VIS_SP // Select width.
  )
  U_shrd_here_has_shrd_ddctd_bus_vis_busmux (
    .sel   (local_slv_mux),
    .din   (shrd_here_has_shrd_ddctd_bus_vis),
    .dout  (local_slv_mux_thru_shrd_ddctd)
  );


  // Asserted when a t/x from this master has been issued at a dedicated
  // AW layer, after coming through the shared to dedicated link.
  wire issued_at_ddctd_thru_shrd;
  assign issued_at_ddctd_thru_shrd
    = |(aw_shrd_lyr_granted_s_bus_i & issued_wtx_shrd_sys_s_bus_i);

  reg issued_at_ddctd_thru_shrd_r;
  always @(posedge aclk_i or negedge aresetn_i)
  begin : issued_at_ddctd_thru_shrd_r_PROC
    if(~aresetn_i) begin
      issued_at_ddctd_thru_shrd_r <= 1'b0;
    end else begin
      issued_at_ddctd_thru_shrd_r <= issued_at_ddctd_thru_shrd;
    end
  end // issued_at_ddctd_thru_shrd_r

  // Rising edge detect of issued_at_ddctd_thru_shrd_r.
  wire issued_at_ddctd_thru_shrd_red;
  assign issued_at_ddctd_thru_shrd_red
    = issued_at_ddctd_thru_shrd & ~issued_at_ddctd_thru_shrd_r;


  // Decode when to mask due to transactions in the pipeline
  // through the shared to dedicated link.
  reg tx_in_shrd_ddctd_pipe_mask_r;
  always @(posedge aclk_i or negedge aresetn_i)
  begin : tx_in_shrd_ddctd_pipe_mask_r_PROC
    if(~aresetn_i) begin
      tx_in_shrd_ddctd_pipe_mask_r <= 1'b0;
    end else begin
      // Assert every time a t/x is issued through a
      // shared to dedicated link.
      if(local_slv_mux_thru_shrd_ddctd
         & tx_issued
           // This masking condition is only required on the AW
           // channel, if either of these 2 pipelines exist.
         & (`AXI_AW_PL_ARB | `AXI_AW_SHARED_PL)
) begin
        tx_in_shrd_ddctd_pipe_mask_r <= 1'b1;
      end
      // Clear the mask when the t/x through the
      // shared to dedicated link has been issued to
      // the target slave.
      if(issued_at_ddctd_thru_shrd_red) begin
        tx_in_shrd_ddctd_pipe_mask_r <= 1'b0;
      end
    end
  end // tx_in_shrd_ddctd_pipe_mask_r_PROC


  /* -------------------------------------------------------------------
   * Select between master and pipeline stage id and local_slv signals.
   */
  assign id_mux = masked_tx_acc_by_pl_r
                  ? id_rs_i
                  : id_i;

  assign local_slv_mux = masked_tx_acc_by_pl_r
                         ? local_slv_rs_i
                         : local_slv_i;

  //--------------------------------------------------------------------
  // GENERATE TX ISSUED SIGNAL.
  //--------------------------------------------------------------------

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
  assign tx_issued =   // Unmasked valid asserted for new t/x, i.e. not
                       // waiting for previous t/x to be accepted.
                        valid_mskd & !waiting_for_tx_acc_r
                       // Mask signal for t/x previously accepted into
                       // pipeline deasserts, t/x is issued now.
                     | (masked_tx_acc_by_pl_r & ~mask_valid_o);

  // Due to loop varaible limitations range overflow is not possible,
  // hence the Leda warning can be disabled:
  // leda FM_2_22 off

  //--------------------------------------------------------------------
  // UNIQUE ID SLOTS
  // For every unique ID value we maintain an "id slot" , each slot
  // contains the active ID value for that slot , the active slave
  // number for the active ID value in the slot and the number of
  // active transactions for the active ID value in the slot.
  // The ID slots are implemented across 3 registers,
  // act_ids_r, act_snums_r and act_counts_r, which store the
  // information listed above for each slot.
  //--------------------------------------------------------------------

  // DC is not reporting any infered latches, hence Leda is incorrect and
  // the errors can be disabled:
  // leda DFT_021 off
  // leda S_4C_R off

  //--------------------------------------------------------------------
  // Proc for registers containing active ID value, and slave number
  // for every unique ID slot.
  // Note we load a transaction into a slot as soon as it has been
  // issued, we don't wait for it to be accepted by the slave.
  // We need to this because of the possibility of a register after the
  // arbiter, in which case a transaction will always complete at least
  // a cycle after being issued, this delay is unacceptable for ID
  // masking purposes. Because if back2back transactions are issued,
  // with the first changing the state of the DW_axi such that the
  // second must be stalled, we will be too late in decoding the effect
  // of the first t/x because we waited for it to be accepted.
  //--------------------------------------------------------------------
  always @(*)
  begin : act_ids_snums_nxt_PROC
    integer  slot_num;
    integer  id_bit;
    integer  snum_bit;

    act_ids_nxt = act_ids_r;
    act_snums_nxt = act_snums_r;

    for(slot_num=0 ;
        slot_num<=(MAX_UIDA-1) ;
         slot_num=slot_num+1
)
    begin

     // If the current transaction has been issued and
     // this slot is the free slot then load the incoming
     // id value and slave number into this id slot.
     if(tx_issued && freeslot_oh[slot_num]) begin

       // Assign the incoming id to the correct field of
       // of the act_ids_nxt bus register bit by bit.
       for(id_bit=0 ; id_bit<=(`ID_W-1) ; id_bit=id_bit+1) begin
          act_ids_nxt[(slot_num*`ID_W)+id_bit]
          = id_mux[id_bit];
       end

       // Assign the incoming slave number to the correct field of
       // of the act_snums_nxt bus register bit by bit.
       for(snum_bit=0 ;
           snum_bit<=(LOG2_NUM_VIS_SP-1) ;
           snum_bit=snum_bit+1
)
       begin
          act_snums_nxt[(slot_num*LOG2_NUM_VIS_SP)+snum_bit]
          = local_slv_mux[snum_bit];
         end

       end // if(tx_issued

    end // for(slot_num=0

  end // act_ids_snums_nxt_PROC

  // leda DFT_021 on
  // leda S_4C_R on


  // Registers for act_ids_nxt & act_snums_nxt.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : act_ids_snums_r_PROC
    // leda FM_1_4 off
    // leda thinks that a variable is being assigned the
    // reset value but it isn't
    if(!aresetn_i) begin
      // leda W410 off
      // W410: Latch inferred
      // Leda seems unable to detect that only relevable bits of
      // act_ids_r are set by reset and next state logic. Synthesis
      // regressions find no latches.
      //act_ids_r   <=   {ACT_IDS_W{1'b0}};
      act_ids_r   <=   {`ID_W*MAX_UIDA{1'b0}};
      // leda W410 on
      act_snums_r <= {ACT_SNUMS_W{1'b0}};
      // leda FM_1_4 on
    end else begin
      act_ids_r   <= act_ids_nxt;
      act_snums_r <= act_snums_nxt;
    end // if(!aresetn_i
  end // act_ids_r_PROC


  //--------------------------------------------------------------------
  // Proc to decode which id slot has had a transaction completion.
  // i.e. cpl_tx_i was asserted with cpl_id_i equal to the id value
  // stored in the id slot.
  //--------------------------------------------------------------------
  always @(cpl_tx_i or cpl_id_i or act_ids_r or act_counts_r)
  begin : cpl_slot_num_oh_PROC
    reg [`ID_W-1:0]         id;
    reg [LOG2_MAX_CA_ID_P1-1:0] count;

    integer  slot_num;
    integer  id_bit;
    integer  count_bit;

    for(slot_num=0 ;
        slot_num<=(MAX_UIDA-1) ;
        slot_num=slot_num+1
)
    begin

      // Generate a vector containing this id slots id value
      // bit by bit.
      for(id_bit=0 ; id_bit<=(`ID_W-1) ; id_bit=id_bit+1) begin
        id[id_bit] = act_ids_r[(slot_num*`ID_W)+id_bit];
      end

      // Get count value for this slot.
      for(count_bit=0 ;
          count_bit<=(LOG2_MAX_CA_ID_P1-1) ;
          count_bit=count_bit+1
)
      begin
        count[count_bit]
          = act_counts_r[(slot_num*LOG2_MAX_CA_ID_P1)+count_bit];
      end

      // Assert bit for this id slot if the there is a transaction
      // completion and the completion id matches the id value of
      // this id slot and the slot is active (i.e. has outstanding
      // transactions).
      cpl_slot_num_oh[slot_num]
        =    cpl_tx_i
          && (id == cpl_id_i)
              && (count != {LOG2_MAX_CA_ID_P1{1'b0}});

    end // for(slot_num=0

  end // cpl_slot_num_oh_PROC


  //--------------------------------------------------------------------
  // Proc to decode which active id slot the incoming ID signal
  // matches to. i.e. ID equal to the id value stored in the id slot
  // and the transaction count value for the slot is non zero.
  // Note we use the version of the id input that is aligned with
  // address decoding, because we have to decide at the address decoding
  // stage wether or not to mask the valid signal.
  //--------------------------------------------------------------------
  always @(*)
  begin : slot_id_match_oh_PROC
    reg [`ID_W-1:0]     id;

    integer  slot_num;
    integer  id_bit;

    for(slot_num=0 ;
        slot_num<=(MAX_UIDA-1) ;
        slot_num=slot_num+1
)
    begin

      // Generate a vector containing this id slots id value
      // bit by bit.
      for(id_bit=0 ; id_bit<=(`ID_W-1) ; id_bit=id_bit+1) begin
        id[id_bit] = act_ids_r[(slot_num*`ID_W)+id_bit];
      end

      // Assert bit for this id slot if the incoming ID signal
      // matches the id value of this id slot.
      slot_id_match_oh[slot_num] = (id == id_mux)
                                   && !slot_inactive_oh[slot_num];

    end // for(slot_num=0

  end // slot_id_match_oh_PROC


  // Decode when the incoming ID signal did not match to any id
  // slots.
  assign no_id_match = (slot_id_match_oh == {MAX_UIDA{1'b0}});


  // Decode the slot number which has had a transaction accepted.
  // Bitwise AND of slot number which ID matches to OR which slot
  // number can accept a transaction with a new ID, with tx_accepted.
  assign issued_slot_num_oh = (slot_id_match_oh | freeslot_oh)
                              & {MAX_UIDA{tx_issued}};


  //--------------------------------------------------------------------
  // Proc to decode which id slot is the the current lowest numbered
  // free (inactive) id slot.
  //--------------------------------------------------------------------
  always @(slot_inactive_oh or no_id_match)
  begin : freeslot_oh_PROC
    reg found;

    integer  slot_num;

    freeslot_oh = {MAX_UIDA{1'b0}};
    found       = 1'b0;

    for(slot_num=0 ;
        slot_num<=(MAX_UIDA-1) ;
        slot_num=slot_num+1
)
    begin

      // Assert bit for this id slot if the slot is inactive
      // , if no previous id slots had were inactive and if the
      // incoming ID signal matched to no active id slot.
      if(slot_inactive_oh[slot_num] && !found && no_id_match)
      begin
        freeslot_oh[slot_num] = 1'b1;
         // Use found variable to only match to least significant
         // numbered id slot.
         found = 1'b1;
      end

    end // for(slot_num=0

  end // freeslot_oh_PROC


  //--------------------------------------------------------------------
  // Active count register.
  //--------------------------------------------------------------------
  always @(posedge aclk_i or negedge aresetn_i)
  begin : act_counts_r_PROC
    if(!aresetn_i) begin
      act_counts_r <= {ACT_COUNTS_W{1'b0}};
    end else begin
      act_counts_r <= act_counts_nxt;
    end
  end // act_counts_r_PROC

  // has_pending_trans_o will assert whenever the active transactions
  // counter is greater than 0 or if there is a masked transaction
  // accepted into the pipeline stage. The bus cannot enter in Low Power
  // mode if there is only a stored transaction in the pipeline (active
  // transactions counter is 0). Thus masked transaction signal is used
  // to prevent that scenario.
  assign has_pending_trans_o = (|act_counts_r) | masked_tx_acc_by_pl_r;

  //--------------------------------------------------------------------
  // Calculate next active count register values.
  //--------------------------------------------------------------------
  always @(act_counts_r or issued_slot_num_oh or cpl_slot_num_oh)
  begin : act_counts_nxt_PROC
    reg [LOG2_MAX_CA_ID_P1-1:0] count;

    integer  slot_num;
    integer  count_bit;

    act_counts_nxt = {ACT_COUNTS_W{1'b0}};

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
         = act_counts_r[(slot_num*LOG2_MAX_CA_ID_P1)+count_bit];
      end

      case({issued_slot_num_oh[slot_num],cpl_slot_num_oh[slot_num]})

         // leda W192 off
        // No transaction issued and none completed, or transaction
         // accepted and completed in same cycle for this id slot
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

      // Assign count back into the act_counts_nxt bus.
      for(count_bit=0 ;
          count_bit<=(LOG2_MAX_CA_ID_P1-1) ;
           count_bit=count_bit+1
)
      begin
        act_counts_nxt[(slot_num*LOG2_MAX_CA_ID_P1)+count_bit]
           = count[count_bit];
      end

    end // for(slot_num=0

  end // act_counts_nxt_PROC


  //--------------------------------------------------------------------
  // Proc to decode which id slots are inactive, i.e. have a count
  // value of 0.
  //--------------------------------------------------------------------
  always @(act_counts_r)
  begin : slot_inactive_oh_PROC
    reg [LOG2_MAX_CA_ID_P1-1:0] count;

    integer  slot_num;
    integer  count_bit;

    slot_inactive_oh = {MAX_UIDA{1'b0}};

    for(slot_num=0 ;
        slot_num<=(MAX_UIDA-1) ;
        slot_num=slot_num+1
)
    begin

      // Generate a vector containing this id slots active transaction
      // count value bit by bit.
      for(count_bit=0 ;
          count_bit<=(LOG2_MAX_CA_ID_P1-1) ;
           count_bit=count_bit+1
)
      begin
        count[count_bit] = act_counts_r
                            [(slot_num*LOG2_MAX_CA_ID_P1)+count_bit];
      end

      slot_inactive_oh[slot_num] = (count == {LOG2_MAX_CA_ID_P1{1'b0}});

    end // for(slot_num=0

  end // slot_inactive_oh_PROC

  // leda FM_2_22 on

  // Select the slave number stored in the id slot that matches with
  // the incoming ID signal.
  DW_axi_busmux_ohsel
  
  #(MAX_UIDA,         // Number of buses to mux between.
    LOG2_NUM_VIS_SP   // Width of each bus input to the mux.
  )
  U_slot_slv_busmux (
    .sel   (slot_id_match_oh),
    .din   (act_snums_r),
    .dout  (slot_slv)
  );

  // DC shows up no "incompatible width" issues so the Leda warning
  // is incorrect and hence can be disabled:
  // leda W110 off

  // Select the active count number stored in the id slot that matches
  // with the incoming ID signal.
  DW_axi_busmux_ohsel
  
  #(MAX_UIDA,           // Number of buses to mux between.
    LOG2_MAX_CA_ID_P1   // Width each bus input to the mux.
  )
  U_slot_count_busmux (
    .sel   (slot_id_match_oh),
    .din   (act_counts_r),
    .dout  (slot_count)
  );
  // leda W110 on

  // Decode when incoming ID signal selects an id slot that
  // already has outstanding transactions with a different slave.
  assign id_txs_w_other_slv = (slot_slv != local_slv_mux) &&
                              (slot_count != 0);

  // Decode when incoming ID signal selects an id slot that
  // has an outstanding transaction count value that is already at
  // the maximum value.
  assign id_slot_count_max = (slot_count == MAX_CA_ID);

  // Decode when incoming ID signal does not select any id slot
  // and there are no free id slots.
  assign id_nofree_nomatch = (freeslot_oh == {MAX_UIDA{1'b0}}) &&
                             no_id_match;


  // Because we register the effect of a beat once it is issued
  // not accepted we must control the mask signal such that a
  // valid does not get masked while it is waiting for a ready
  // to come back from the slave, we use waiting_for_tx_acc_r
  // for this purpose here.
  assign mask_valid_o = (id_txs_w_other_slv
                         | id_slot_count_max
                         | id_nofree_nomatch
                         | tx_in_shrd_ddctd_pipe_mask_r
)
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
  // Clear when the mask condition is cleared (mask_valid deasserts).
  // Note we use the timing mode and arbiter pipeline parameters to
  // remove the logic when there are no pipelines in the channel.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : masked_tx_acc_by_pl_r_PROC
    if(!aresetn_i) begin
      masked_tx_acc_by_pl_r <= 1'b0;
    end else begin
      if(~masked_tx_acc_by_pl_r) begin
        masked_tx_acc_by_pl_r
          <= mask_valid_o & valid_i & ready_i
             & ((TMO != 0) | (PL_ARB == 1));
      end else begin
        masked_tx_acc_by_pl_r <= mask_valid_o;
      end
    end
  end // masked_tx_acc_by_pl_r_PROC

  // Generate masked valid signal.
  assign valid_mskd = valid_i & ~mask_valid_o;


  // Assign id slot contents to their output ports.
  assign act_ids_o = `REG_INTER_BLOCK_PATHS
                     ? act_ids_r
                     : act_ids_nxt;

  assign act_snums_o  = `REG_INTER_BLOCK_PATHS
                        ? act_snums_r
                        : act_snums_nxt;

  // For write data channel, tell it when a t/x has been issued
  // for each ID slot.
  assign issuedtx_slot_oh_o = issued_slot_num_oh;



  `undef ID_W
  `undef REG_INTER_BLOCK_PATHS

endmodule
