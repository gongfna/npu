// Monitor granted masters at AR S1 to check if the same master gets
// granted twice when >1 masters are requesting. When a timing based
// arbiter has been instantiated this condition should never occur, if
// it does it shows that the arbiter is not being disabled (paused) 
// while arbitration is not being performed.
//
// NOTE : For the fair among equals arbiter we must ensure that all 
//        requesting clients have the same priority before detecting
//        an error. Because this arbiter has a priority component,
//        the same client could be correctly granted twice.

// Arbiter parameters.
parameter NC_S1 = `AXI_NMV_S1;
parameter LOG2_NC_S1 = `AXI_LOG2_NMV_S1;
//parameter LOG2_NC_P1_S1 = `AXI_LOG2_NSP2V_M1;
parameter PRIORITY_W_S1 = `AXI_MST_PRIORITY_W;

parameter BUS_PRIORITY_W_S1 = NC_S1*PRIORITY_W_S1;

// Wires to connect to internal DUT signals.
wire [NC_S1-1:0] req_s1;
wire [NC_S1-1:0] req_s1_arbpl_mux;
reg  [NC_S1-1:0] req_s1_arbpl_r;
wire [BUS_PRIORITY_W_S1-1:0] bus_priority_s1;
wire [LOG2_NC_S1-1:0] ars1_dut_grant_index;
wire ars1_arb_enable;
wire ars1_arb_enable_mux;
reg  ars1_arb_enable_r;
wire ars1_ch_locked;


// Connect to DUT arbiter signals.
`ifdef AXI_S1_ON_AR_SHARED
assign req_s1 = 1'b0;
assign bus_priority_s1 = {BUS_PRIORITY_W_S1{1'b0}};
assign ars1_dut_grant_index = {LOG2_NC_S1{1'b0}};
assign ars1_arb_enable = 1'b0;
`else
assign req_s1 = test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.rreq_i;
assign bus_priority_s1 = test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.bus_mst_priorities_i;
assign ars1_dut_grant_index = test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.grant_p_local_o;
assign ars1_arb_enable = test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.arb_enable;
assign ars1_ch_locked = test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.this_ch_locked_r;
`endif


// If we have a registered arbiter on the channel then the requests will be 
// cleared combinatorially with ready. So we need to keep a registered
// version of the request signals in order to capture which requests where active
// when the grant was made.
// jstokes, 3/12/2010, also register arbiter enable to align with the
// requests.
always @(posedge aclk or negedge aresetn)
begin
  if(!aresetn) begin
    req_s1_arbpl_r <= {NC_S1{1'b0}};
    ars1_arb_enable_r <= 1'b0;
  end else begin
    req_s1_arbpl_r <= req_s1;
    ars1_arb_enable_r <= ars1_arb_enable;
  end
end
assign req_s1_arbpl_mux = (`AXI_AR_PL_ARB == 0) ? req_s1 : req_s1_arbpl_r;
assign ars1_arb_enable_mux = (`AXI_AR_PL_ARB == 0) ? ars1_arb_enable : ars1_arb_enable_r;


// Control signals for TB.
wire tb_valid_s1;
wire tb_ready_s1;
wire tb_ar_tx_acc_s1;

assign tb_valid_s1 = test_DW_axi.U_DW_axi.arvalid_s1;
assign tb_ready_s1 = test_DW_axi.U_DW_axi.arready_s1;
assign tb_ar_tx_acc_s1 = tb_valid_s1 & tb_ready_s1;

/*----------------------------------------------------------------------
 * Register to tell us when we are waiting for a grant to be accepted.
 */
reg tb_tx_wait_acc_s1_r;
always @(posedge aclk or negedge aresetn)
begin
  if(!aresetn) begin
    tb_tx_wait_acc_s1_r <= 1'b0;
  end else begin
    if   (tb_valid_s1 & ~tb_ready_s1) tb_tx_wait_acc_s1_r <= 1'b1;
    else                              tb_tx_wait_acc_s1_r <= 1'b0;
  end
end

// Asserted whenever a new grant has occured at AR S1.
// Check is not done if S1 is on the AR shared channel.
wire tb_new_grant_s1;
assign tb_new_grant_s1 
  = `AXI_S1_ON_AR_SHARED_VAL ? 1'b0 : tb_valid_s1 & ~tb_tx_wait_acc_s1_r;

reg tb_new_grant_s1_r;
always @(posedge aclk or negedge aresetn)
begin
  if(!aresetn) begin
    tb_new_grant_s1_r <= 1'b0;
  end else begin
    tb_new_grant_s1_r <= tb_new_grant_s1;
  end 
end

/*----------------------------------------------------------------------
 * Register current grant index to use as the previous grant index 
 * in testing the error condition.
 */
reg multiple_reqs;
reg multiple_reqs_r;
reg multiple_reqs_2r;
reg [LOG2_NC_S1-1:0] ars1_grant_index_r;
reg [LOG2_NC_S1-1:0] ars1_grant_index_2r;

always @(posedge aclk or negedge aresetn)
begin
  if(!aresetn) begin
    ars1_grant_index_r <= {LOG2_NC_S1{1'b0}};
    ars1_grant_index_2r <= {LOG2_NC_S1{1'b0}};
    multiple_reqs_r <= 1'b0;
    multiple_reqs_2r <= 1'b0;
  end else begin
     if(tb_new_grant_s1) begin
       ars1_grant_index_r <= ars1_dut_grant_index;
       ars1_grant_index_2r <= ars1_grant_index_r;

       // Don't record multiple grants during a locked sequence, timing
       // arbiter is not controlling grants during a locked sequence.
       multiple_reqs_r <= ars1_ch_locked ? 1'b0 : multiple_reqs;
       multiple_reqs_2r <= ars1_ch_locked ? 1'b0 : multiple_reqs_r;
     end else if(ars1_ch_locked) begin
       // jstokes, 3.12.2010
       // The arbiter can grant the the same client before and
       // after a locked sequence. The arbiter priorities are modified
       // at the end of the locked sequence to ensure the AR and AW channel
       // arbiters are in an identical state (regarding internal priorities
       // of all clients.
       multiple_reqs_r <= 1'b0;
       multiple_reqs_2r <= 1'b0;
     end
  end
end

/*----------------------------------------------------------------------
 * Decode if more than 1 request is present.
 */
integer i2;
always @(*) begin 
  // jstokes, 3/12/2010
  if(tb_new_grant_s1) begin
    multiple_reqs = 1;
    for(i2=0;i2<=(NC_S1-1);i2=i2+1) begin
      if(   (req_s1_arbpl_mux == (1'b1 << i2))
          | (req_s1_arbpl_mux == {NC_S1{1'b0}})
        ) 
      begin
        multiple_reqs = 0;
      end
    end
  end else begin
    multiple_reqs = multiple_reqs_r;
  end
end

/*----------------------------------------------------------------------
 * Calculate number of AR grants at S1. To avoid triggering a failure
 * for the first grant.
 */
reg [31:0] num_ar_s1_grants_r;
always @(posedge aclk or negedge aresetn) 
begin : num_ar_s1_grants_r_PROC
  if(~aresetn) begin
    num_ar_s1_grants_r <= 0;
  end else begin
    if(tb_ar_tx_acc_s1) num_ar_s1_grants_r <= num_ar_s1_grants_r + 1;
  end
end // num_ar_s1_grants_r_PROC

/*----------------------------------------------------------------------
 * For a fair among equals arbiter, check that all requesting clients
 * have the same priority, since this is the only condition where the
 * arbiter should not grant to the same master twice in succession if
 * more than one master is requesting.
 */
reg fae_all_reqs_same_p;
integer mst;
integer pr_bit;
reg [PRIORITY_W_S1-1:0] current_pr;
reg [PRIORITY_W_S1-1:0] previous_pr;
reg first_req;

always @(*) begin 
  fae_all_reqs_same_p = 1;
  first_req = 1;
  current_pr = 0;
  previous_pr = 0;

  for(mst=0;mst<NC_S1;mst=mst+1) begin
    // Extract priority of this master.
    for(pr_bit=0;pr_bit<=(PRIORITY_W_S1-1);pr_bit=pr_bit+1) begin
      current_pr[pr_bit] = bus_priority_s1[(mst*PRIORITY_W_S1)+pr_bit];
    end

    if(req_s1_arbpl_mux[mst]) begin
      if(first_req) begin
        first_req = 0;
      end else begin
        if(current_pr != previous_pr) fae_all_reqs_same_p = 0;
      end
      previous_pr = current_pr;
    end
  end // for(mst=0;
end

/*----------------------------------------------------------------------
 * Perform the check.
 */
always @(posedge aclk)
begin

  if(   // New t/x issued at S1.
        tb_new_grant_s1

        // Timing arbiter preset at s1.
     && (  (`AXI_AR_ARB_TYPE_S1 == `AXI_ARB_TYPE_FCFS) 
         | (`AXI_AR_ARB_TYPE_S1 == `AXI_ARB_TYPE_2T)
        ) 

        // Current grant index same as the previous one.
        // Failure condition for PL_ARB == 0.
     && ((ars1_dut_grant_index == ars1_grant_index_r) & tb_new_grant_s1 & multiple_reqs_r | (`AXI_AR_PL_ARB==1))
        
        // Failure condition for PL_ARB == 1.
        // If the arbiter pipeline is enabled, it is possible to
        // get 2 back 2 back identical grants legally, so in this case
        // we check that the previous 2 grants are identical.
     && (  (  (ars1_dut_grant_index == ars1_grant_index_r) & tb_new_grant_s1 & multiple_reqs_r
            & ((ars1_grant_index_2r == ars1_grant_index_r) & multiple_reqs_2r) 
           )
         | (`AXI_AR_PL_ARB==0)
        )

        // Multiple requests were preset when the grant was made.
     //&& multiple_reqs

        // Multi cycle arbitration is not enabled at AR S1.
     && (`AXI_AR_MCA_NC_S1 == 1)

        // Not the first grant of the sim.
     && (num_ar_s1_grants_r > 0)

        // For fair among equals arb, all requesting clients must have same priority
        // for failure condition to be detectable.
      && (fae_all_reqs_same_p | (`AXI_AR_ARB_TYPE_S1 != `AXI_ARB_TYPE_2T))

        // Not in a locked sequence.
      &&  ~ars1_ch_locked
    ) begin
    $display("ERROR: %0d -  TIMING ARB ENABLE CHECKER -> ", $time);
    $display("ERROR: %0d -  Timing arbiter at AR S1 has granted the same client back to back", $time);
    $display("ERROR: %0d -  when more than one client was requesting.", $time);
    $display("ERROR: %0d -  Current grant index %0h, previous grant index %0h."
             , $time, ars1_dut_grant_index, ars1_grant_index_r); 
		$finish;
  end
end // always @(posedge aclk)
