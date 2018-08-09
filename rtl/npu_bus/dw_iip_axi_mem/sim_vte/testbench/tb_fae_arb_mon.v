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
** File     : tb_fae_arb_mon.v
** Abstract : Models and checks output of fair among equals arbiters.
**
** ---------------------------------------------------------------------
*/

`include "DW_axi_cc_constants.v"
`include "DW_axi_constants.v"

module tb_fae_arb_mon (
  // Inputs.
  aclk,
  aresetn,

  // White box inputs to the internal arbiter (from internal to the DUT)
  req_i,
  ext_priors_i,
  enable_i,

  // AXI interface on the DUT I/O.
  valid_i,
  ready_i,
  id_i
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter N = 1; 
  parameter PRIOR_W = 1;
  parameter INDEX_W = 1;
  parameter SNUM = 1;
  parameter WCH  = 0;

  parameter M1_VIS = 0;
  parameter M2_VIS = 0;
  parameter M3_VIS = 0;
  parameter M4_VIS = 0;
  parameter M5_VIS = 0;
  parameter M6_VIS = 0;
  parameter M7_VIS = 0;
  parameter M8_VIS = 0;
  parameter M9_VIS = 0;
  parameter M10_VIS = 0;
  parameter M11_VIS = 0;
  parameter M12_VIS = 0;
  parameter M13_VIS = 0;
  parameter M14_VIS = 0;
  parameter M15_VIS = 0;
  parameter M16_VIS = 0;

  localparam E_PRIORS_W = N*PRIOR_W;
  localparam I_PRIORS_W = N*INDEX_W;
  localparam C_PRIORS_W = N*(INDEX_W+PRIOR_W);

  localparam LOG2_NM = `AXI_LOG2_NM;

  // This module is not required if there is just 1 master (no arbitration)
  // but it will still be compiled, so need to assign these values
  // here to avoid compilation errors.
  localparam SID_W = `AXI_NUM_MASTERS==1 ? 2 : `AXI_SIDW;
  localparam MID_W = `AXI_NUM_MASTERS==1 ? 1 : `AXI_MIDW;

//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// INPUTS
//----------------------------------------------------------------------
  input aclk;
  input aresetn;

  // White box inputs to the internal arbiter (from internal to the DUT)
  input [N-1:0] req_i;
  input [E_PRIORS_W-1:0] ext_priors_i;
  input enable_i;

  // AXI interface on the DUT I/O.
  input valid_i;
  input ready_i;
  input [SID_W-1:0] id_i;


  // Register internal priorities.
  reg [I_PRIORS_W-1:0] int_priors;
  reg [I_PRIORS_W-1:0] int_priors_r;
  always @(posedge aclk or negedge aresetn) begin : int_priors_r_PROC
    if(~aresetn) begin
      int_priors_r <= {I_PRIORS_W{1'b0}};
    end else begin
      if(enable_i) int_priors_r <= int_priors;
    end
  end 

  // Combine internal and external priorities.
  reg [C_PRIORS_W-1:0] com_priors;
  always @(*) begin : com_priors_PROC
    integer cnum;
    integer cbit;
    for(cnum=0;cnum<N;cnum=cnum+1) begin
      for(cbit=0;cbit<(INDEX_W+PRIOR_W);cbit=cbit+1) begin
        if(cbit < INDEX_W) begin
          com_priors[(cnum*(INDEX_W+PRIOR_W))+cbit] = int_priors_r[(cnum*INDEX_W)+cbit];
        end else begin
          // Priorities to DUT arbiters are inverted (i.e. 0 is highest),
          // this checker is using opposite priority encoding (i.e.
          // 1 higher priority than 0), so we invert DUT priorities.
          com_priors[(cnum*(INDEX_W+PRIOR_W))+cbit] = !ext_priors_i[((cnum*PRIOR_W)+cbit)-INDEX_W];
        end
      end
    end
  end


  // Find lowest priority value from client who is requesting,
  // and the index of that client.
  reg [INDEX_W-1:0] grant_index;
  reg [(INDEX_W+PRIOR_W)-1:0] granted_c_pri;
  always @(*) begin : grant_index_oh_PROC
    integer cnum;
    integer bit1;
    integer bit2;
    reg [(INDEX_W+PRIOR_W)-1:0] prior_tmp1;
    reg [(INDEX_W+PRIOR_W)-1:0] high_pri_tmp;
    reg     prev_c_req;

    grant_index = {INDEX_W{1'b0}};
    granted_c_pri = {(INDEX_W+PRIOR_W){1'b0}};
    high_pri_tmp = {(INDEX_W+PRIOR_W){1'b0}};
    prev_c_req = 1'b0;

    for(cnum=0;cnum<N;cnum=cnum+1) begin
      for(bit1=0;bit1<(INDEX_W+PRIOR_W);bit1=bit1+1) begin
        prior_tmp1[bit1] = com_priors[(cnum*(INDEX_W+PRIOR_W))+bit1];
      end


      // Is this client requesting, and is his priority higher than the next
      // client.
      // Start off with client 0 as the granted client.
      if(cnum==0) begin
        grant_index = cnum;
        granted_c_pri = prior_tmp1;
        // This clients priority is the new highest priority.
        high_pri_tmp = prior_tmp1;
        prev_c_req = req_i[cnum];
      end else begin
        if((prior_tmp1>high_pri_tmp | ~prev_c_req) & req_i[cnum]) begin
          grant_index = cnum;
          granted_c_pri = prior_tmp1;
          // This clients priority is the new highest priority.
          high_pri_tmp = prior_tmp1;
          prev_c_req = req_i[cnum];
        end
      end

    end
  end 

  // Extract external priority from granted_c_pri.
  wire [PRIOR_W-1:0] granted_ext_pri;
  assign granted_ext_pri = granted_c_pri[(INDEX_W+PRIOR_W)-1:INDEX_W];

  // Decode next internal priority values.
  always @(*) begin : int_priors_PROC
    integer cnum;
    integer bit1;
    integer bit2;
    integer bit3;
    reg [PRIOR_W-1:0] ext_prior_tmp;
    reg [INDEX_W-1:0] int_prior_tmp;
    reg [INDEX_W-1:0] int_prior_new;

    int_priors = int_priors_r;
    int_prior_new = {INDEX_W{1'b0}};

    for(cnum=0;cnum<N;cnum=cnum+1) begin
      // extract external priority for this client from ext_priors_i.
      for(bit1=0;bit1<PRIOR_W;bit1=bit1+1) begin
        // Priorities to DUT arbiters are inverted (i.e. 0 is highest),
        // this checker is using opposite priority encoding (i.e.
        // 1 higher priority than 0), so we invert DUT priorities.
        ext_prior_tmp[bit1] = ~ext_priors_i[(cnum*PRIOR_W)+bit1];
      end

      // extract internal priority for this client from int_priors_r.
      for(bit2=0;bit2<INDEX_W;bit2=bit2+1) begin
        int_prior_tmp[bit2] = int_priors_r[(cnum*INDEX_W)+bit2];
      end
      
      // Default to the old priority value.
      int_prior_new = int_prior_tmp;

      if(grant_index == cnum) begin
        // Reset internal priority if granted.
        int_prior_new = {INDEX_W{1'b0}};
      end else begin
        // If not granted, and this client has the same external priority as the
        // currently granted client, then increment this clients priority.
        if(granted_ext_pri == ext_prior_tmp & req_i[cnum]) begin
          int_prior_new = int_prior_tmp + 1'b1;
        end
      end

      // Insert new client internal priority back into
      // int_priors.
      for(bit3=0;bit3<INDEX_W;bit3=bit3+1) begin
        int_priors[(cnum*INDEX_W)+bit3] = int_prior_new[bit3];
      end
      
    end
  end

  /*
   * Queue to push grants into.
   */
  wire [INDEX_W-1:0] fifo_grant_index;
  wire fifo_full;
  wire fifo_empty;
  wire fifo_push_l1;
  wire fifo_push_l2;
  wire fifo_pop_l1;
  wire fifo_pop_l2;

  // Generate push. "l2" push signal is the one that reaches the FIFO.
  // Just needs to be deep enough for the number of grants we can have
  // before the resultant transfer appears at the slave port.
  assign fifo_push_l1 = enable_i;

  // Level 2 fifo push. Don't push the fifo if it is being popped while
  // empty at the same time.
  assign fifo_push_l2 = fifo_push_l1 & ~(fifo_pop_l1 & fifo_empty);

  // Generate pop. "l2" pop signal is the one that reaches the FIFO.
  assign fifo_pop_l1 = (valid_i & ready_i);
  assign fifo_pop_l2 = fifo_pop_l1 & ~fifo_empty;

  // Level 2 fifo push. Don't push the fifo if it is being popped while
  // empty at the same time.
  assign fifo_push_l2 = fifo_push_l1 & ~(fifo_pop_l1 & fifo_empty);


  tb_fifo
  #(.WIDTH      (INDEX_W), 
    .DEPTH      (5),  
    .ADDR_WIDTH (3) 
  )
  U_grant_q (
    .clk            (aclk),
    .rst_n          (aresetn),
    .init_n         (1'b1), // Synchronous reset, not used.
    .diag_n         (1'b1), // Never using diagnostic mode.

    .push_req_n     (~fifo_push_l2),
    .data_in        (grant_index),

    .pop_req_n      (~fifo_pop_l2),
    .data_out       (fifo_grant_index),

    .empty          (fifo_empty),
    .full           (fifo_full)
  );


  // Flag error if a push while full or pop while empty occurs.
  always @(posedge aclk) begin
    if(fifo_push_l2 & fifo_full) begin
      $display("%0t, tb_fae_arb_monitor, slv %0d, write ? = %0d, Grant Q pushed while full.", $time, SNUM, WCH);
    end
    // If there is no pipelining on the channel we could get a grant index
    // push, and the valid&ready handshake associated with that grant in
    // the same cycle. To allow for this, if a valid&ready handshake, and
    // grant index push occur in the same cycle while the grant Q is
    // empty we will bypass the grant Q in doing the check i.e. we will
    // check against grant_index instead of fifo_grant_index.
    // For that reason, a pop while empty is not an error if push is
    // asserted at the same time.
    if(fifo_pop_l2 & fifo_empty) begin
      $display("%0t, tb_fae_arb_monitor, slv %0d, write ? = %0d, Grant Q popped while empty.", $time, SNUM, WCH);
    end
  end


  // Map system master number from ID to a local master number.
  wire [`AXI_LOG2_NM-1:0] id_mstnum;
  wire [`AXI_LOG2_NM-1:0] id_mstnum_ic;
  reg  [INDEX_W-1:0]      id_mstnum_lcl;

  assign id_mstnum = id_i[SID_W-1:MID_W];

  // Subtract 1 because this function always returns master number from 0 to 15, not 1 to 16.
  // Add 1 to sys_mnum because axi_pnum_for_snum entries start from index 1 not 0.
  `ifdef AXI_BICMD_SUPPORT
  assign id_mstnum_ic = (test_DW_axi.axi_pnum_for_snum[(id_mstnum+1)] - 1);
	`else
  assign id_mstnum_ic = id_mstnum;
	`endif

	// Map system master number (for this interconnect), to master number
	// local to this slave port.
	wire [`AXI_NUM_MASTERS-1:0] mst_slv_vis_bus;
	assign mst_slv_vis_bus =  
	  {((M16_VIS==1) ? 1'b1 : 1'b0),
	   ((M15_VIS==1) ? 1'b1 : 1'b0),
	   ((M14_VIS==1) ? 1'b1 : 1'b0),
	   ((M13_VIS==1) ? 1'b1 : 1'b0),
	   ((M12_VIS==1) ? 1'b1 : 1'b0),
	   ((M11_VIS==1) ? 1'b1 : 1'b0),
	   ((M10_VIS==1) ? 1'b1 : 1'b0),
	   ((M9_VIS==1) ? 1'b1 : 1'b0),
	   ((M8_VIS==1) ? 1'b1 : 1'b0),
	   ((M7_VIS==1) ? 1'b1 : 1'b0),
	   ((M6_VIS==1) ? 1'b1 : 1'b0),
	   ((M5_VIS==1) ? 1'b1 : 1'b0),
	   ((M4_VIS==1) ? 1'b1 : 1'b0),
	   ((M3_VIS==1) ? 1'b1 : 1'b0),
	   ((M2_VIS==1) ? 1'b1 : 1'b0),
	   ((M1_VIS==1) ? 1'b1 : 1'b0)
		};


	reg [`AXI_LOG2_NM-1:0] lcl_mst;
	// Wider width to allow mst to hit exit condition.
	reg [`AXI_LOG2_NM:0] mst;
	always @(*) begin
	  lcl_mst = {`AXI_LOG2_NM{1'b0}};
	  for (mst={`AXI_LOG2_NM{1'b0}} ; mst<`AXI_NUM_MASTERS ; mst=mst+1'b1) begin
		  if(mst_slv_vis_bus[mst]) begin
		    if(mst == id_mstnum_ic) id_mstnum_lcl = lcl_mst;
			  lcl_mst = lcl_mst + 1'b1;
	    end
	  end
  end

  // Compare grant indexes from modeled arbiter (via U_grant_q), with the
  // master number in the upper bits of A*ID_S* .
  always @(posedge aclk) begin
    // If there is no pipelining on the channel we could get a grant index
    // push, and the valid&ready handshake associated with that grant in
    // the same cycle. To allow for this, if a valid&ready handshake, and
    // grant index push occur in the same cycle while the grant Q is
    // empty we will bypass the grant Q in doing the check i.e. we will
    // check against grant_index instead of fifo_grant_index.
    if(fifo_empty) begin
      if(     fifo_pop_l1 
            & (~fifo_push_l1 & (grant_index !== id_mstnum_lcl))
        )
      begin
        if(WCH) begin
          $display("%0t, ERROR, Slave %0d, Write Address Channel, Incorrect Grant from FAE Arb. , expected M %0d, actual M %0d ."
                   , $time, SNUM, grant_index, id_mstnum_lcl);
        end else begin
          $display("%0t, ERROR, Slave %0d, Read Address Channel, Incorrect Grant from FAE Arb. , expected M %0d, actual M %0d ."
                   , $time, SNUM, grant_index, id_mstnum_lcl);
        end
        $display("%0t, ERROR, (NOTE : local master number used).",  $time);
        // End simulation when an error occurs.
        $finish;
      end
    end else begin
      if(  fifo_pop_l1 
         & (fifo_grant_index !== id_mstnum_lcl)
        ) 
      begin
        if(WCH) begin
          $display("%0t, ERROR, Slave %0d, Write Address Channel, Incorrect Grant from FAE Arb. , expected M %0d, actual M %0d ."
                   , $time, SNUM, fifo_grant_index, id_mstnum_lcl);
        end else begin
          $display("%0t, ERROR, Slave %0d, Read Address Channel, Incorrect Grant from FAE Arb. , expected M %0d, actual M %0d ."
                   , $time, SNUM, fifo_grant_index, id_mstnum_lcl);
        end
        $display("%0t, ERROR, (NOTE : local master number used).",  $time);
        // End simulation when an error occurs.
        $finish;
      end
    end // if(fifo_empty) begin .. else ..
  end

endmodule
