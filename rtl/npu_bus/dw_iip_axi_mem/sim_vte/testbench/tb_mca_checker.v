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
** File     : tb_mca_checker.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : Checks the outputs of arbiters with multi cycle
**            arbitration enabled.
**
** ---------------------------------------------------------------------
*/


module tb_mca_checker (
  // Inputs - System.
  aclk_i,
  aresetn_i,

  // Inputs 
  valid_i,
  ready_i,
  arb_enable_i,

  resp_valid_i,
  resp_ready_i,
  resp_last_i,

  grant_arb_i,
  grant_i,
  bus_grant_i,
  grant_index_i,
  burst_tx_not_cpl_r_i,

  channel_i,
  port_i,
  shared_i
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter BUS_GRANT_W = 0;
  parameter GRANT_INDEX_W = 0;
  parameter MCA_EN = 0; // Enable multi cycle arbitration.
  parameter MCA_NC = 0; // Number of arb. cycles in multi cycle arb.
  parameter MCA_NC_W = 0; // Log base 2 of MCA_NC.
  parameter PORT_W = 0; // Port input width.
  parameter RI_LIMIT = 0; // Is read interleave limit enabled.
  parameter MAX_ACT_TXS = 1; // Max num of active t/x's on A* channels.

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------

// Inputs - System.
  input aclk_i;    // AXI system clock.
  input aresetn_i; // AXI system reset.


// Inputs.
  input valid_i;
  input ready_i;
  input arb_enable_i;

  input resp_valid_i;
  input resp_ready_i;
  input resp_last_i;

  input grant_arb_i; // From base arb module (not reg stage).
  input grant_i;
  input [BUS_GRANT_W-1:0] bus_grant_i;
  input [GRANT_INDEX_W-1:0] grant_index_i;
  input burst_tx_not_cpl_r_i; // burst arb lock signal.

  input [2:0] channel_i; // Encoding of channel name.
  input [PORT_W-1:0] port_i; // Port number.
  input shared_i; // 1 if checking a shared channel.
                                                
		     
  reg grant_r;
  reg [BUS_GRANT_W-1:0] bus_grant_r;
  reg [GRANT_INDEX_W-1:0] grant_index_r;

  reg [MCA_NC_W-1:0] mca_count_r; // Free running counter, counts up
                                  // to MCA_NC.
				   
  wire grant_index_update; // Asserted when arbiter outputs should be
                           // updated.
			   
  reg grant_index_update_r; // 1 cycle delayed version.

  reg wait_tx_acc_r; // Waiting for tx to be accepted.
  reg wait_tx_acc_r_r; // Registered version of above.
  wire wait_tx_acc_r_fed; // Falling edge detect of wait_tx_acc_r.

  reg gi_update_blocked_r; // Grant index update blocked.
  wire pnd_vld_arb_chng_ok; // Ok for arb outputs to change due to 
                            // pending valid being accepted.

  reg burst_tx_not_cpl_r_i_r;    // Generate fed of burst_tx_not_cpl_r_i
  wire burst_tx_not_cpl_r_i_fed; // 

  reg aresetn_i_r; // 1 cycle delayed version of aresetn_i.			    


  //--------------------------------------------------------------------
  //
  // This check works by defining 2 points where the arbiter outputs
  // are allowed to change.
  //
  // 1. The cycle after the multi cycle arbitration counter flips over.
  // 2. If a valid was pending when 1. occured, then the arbiter 
  //    outputs may change the cycle after the pending valid has been
  //    accepted.
  //
  // If the arbiter outputs change at any other time an error will be
  // flagged.
  //--------------------------------------------------------------------

  //--------------------------------------------------------------------
  // Multi Cycle Arbitration.  Counter and control signal decode.
  //--------------------------------------------------------------------

  //--------------------------------------------------------------
  // Multi cycle arbitration counter.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : mca_count_r_PROC
    if(~aresetn_i) begin
      mca_count_r <= 'b0;
    end else begin
      if(mca_count_r == (MCA_NC - 1)) begin
        mca_count_r <= 'b0;
      end else begin
        mca_count_r <= mca_count_r + 1'b1;
      end
    end
  end // mca_count_r_PROC
        

  //--------------------------------------------------------------------
  // Decode of more multi cycle arbitration control signals.
  
  // Capture new grant index at the end of the count period.
  assign grant_index_update = MCA_EN
                              ? (mca_count_r == (MCA_NC - 1))
			      : 1'b1;

  // Generate 1 cycle delayed version, because valid signals will change 1
  // cycle after this is asserted.
  always @(posedge aclk_i or negedge aresetn_i) 
  begin : grant_index_update_r_PROC
    if(~aresetn_i) begin
      grant_index_update_r <= 1'b0;
    end else begin
      grant_index_update_r <= grant_index_update;
    end
  end // grant_index_update_r_PROC


  //--------------------------------------------------------------------
  // Perform registering of arbiter outputs.
  // Registered every cycle to perform cycle by cycle check.
  always @(posedge aclk_i or negedge aresetn_i) 
  begin : arb_outputs_reg_PROC
    if(~aresetn_i) begin
      grant_r       <= 1'b0;
      bus_grant_r   <= 'b0;
      grant_index_r <= 'b0;
    end else begin
      grant_r       <= grant_i;
      bus_grant_r   <= bus_grant_i;
      grant_index_r <= grant_index_i;
    end
  end // arb_outputs_reg_PROC


  //--------------------------------------------------------------------
  // Decode when a valid is pending.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : wait_tx_acc_r_PROC
    if(!aresetn_i) begin
      wait_tx_acc_r <= 1'b0;
    end else begin
      wait_tx_acc_r <= valid_i & ~ready_i;
    end
  end

  //--------------------------------------------------------------------
  // Falling edge detect of wait_tx_acc_r.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : wait_tx_acc_r_r_PROC
    if(!aresetn_i) begin
      wait_tx_acc_r_r <= 1'b0;
    end else begin
      wait_tx_acc_r_r <= wait_tx_acc_r;
    end
  end

  assign wait_tx_acc_r_fed = wait_tx_acc_r_r & ~wait_tx_acc_r;

  //--------------------------------------------------------------------
  // Falling edge detect of burst_tx_not_cpl_r_i.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : burst_tx_not_cpl_r_i_PROC
    if(!aresetn_i) begin
      burst_tx_not_cpl_r_i_r <= 1'b0;
    end else begin
      burst_tx_not_cpl_r_i_r <= burst_tx_not_cpl_r_i; 
    end
  end

  assign burst_tx_not_cpl_r_i_fed =    burst_tx_not_cpl_r_i_r
                                    & ~burst_tx_not_cpl_r_i;


  //--------------------------------------------------------------------
  // Decode when a grant index update has been blocked by a pending
  // valid.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : gi_update_blocked_r_PROC
    if(!aresetn_i) begin
      gi_update_blocked_r <= 1'b0;
    end else begin

      if(grant_index_update_r & wait_tx_acc_r)
        gi_update_blocked_r <= 1'b1;

      // If both conditions happen in the same cycle this
      // takes precedence.
      if(wait_tx_acc_r_fed)
        gi_update_blocked_r <= 1'b0;
    end
  end


  // Create 1 cycle delayed aresetn_i signal.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : aresetn_i_r_PROC
    if(!aresetn_i) begin
      aresetn_i_r <= 1'b0;
    end else begin
      aresetn_i_r <= aresetn_i;
    end
  end 


  //--------------------------------------------------------------------
  // Decode when when arbiter outputs may change due to a pending valid
  // being accepted.
  assign pnd_vld_arb_chng_ok = wait_tx_acc_r_fed & gi_update_blocked_r;

  always @(posedge aclk_i)
  begin

    if(MCA_EN) test_DW_axi.chk_mca_done = 1;

    if((   (grant_i       != grant_r)
        || (bus_grant_i   != bus_grant_r)
        || (grant_index_i != grant_index_r)
       )
       && !(pnd_vld_arb_chng_ok | grant_index_update_r)
       && MCA_EN 
       // Read interleaving limit feature locks arbitration until a burst
       // completes, arbitration will unlock when the burst finishes, which
       // could be at a different time than the multi cycle arbitration
       // logic will allow the grants to change, this causes this check to
       // fall over, so we don't signal a failure if the grants change 
       // the cycle after a burst ends if RI_LIMIT feature is enabled.
       && !(RI_LIMIT & burst_tx_not_cpl_r_i_fed)
       && aresetn_i
       // Registers used to capture a change in arbiter outputs will not
       // update until 1 cycle after reset.
       && aresetn_i_r
      ) begin

      test_DW_axi.chk_mca_failed = 1; 

      $display("ERROR: %0d - MCA CHECKER -> Unexpected arbiter output change.", $time); 
      $display("ERROR: %0d - MCA CHECKER -> grant : exp %0h : act %0h."
               , $time, grant_r, grant_i); 
      $display("ERROR: %0d - MCA CHECKER -> bus_grant : exp %0h : act %0h."
               , $time, bus_grant_r, bus_grant_i); 
      $display("ERROR: %0d - MCA CHECKER -> grant_index : exp %0h : act %0h."
               , $time, grant_index_r, grant_index_i); 

      if(~shared_i) begin
        case(channel_i) 
	        3'b000 : begin
            $display("ERROR: %0d - MCA CHECKER -> AR SP %0d.", $time, port_i); 
	        end
	        3'b001 : begin
            $display("ERROR: %0d - MCA CHECKER -> AW SP %0d.", $time, port_i); 
	        end
	        3'b010 : begin
            $display("ERROR: %0d - MCA CHECKER -> W SP %0d.", $time, port_i); 
	        end
	        3'b011 : begin
            $display("ERROR: %0d - MCA CHECKER -> R MP %0d.", $time, port_i); 
	        end
	        3'b100 : begin
            $display("ERROR: %0d - MCA CHECKER -> B MP %0d.", $time, port_i); 
	        end
        endcase
      end else begin
        // Testing a shared channel.
        case(channel_i) 
	        3'b000 : begin
            $display("ERROR: %0d - MCA CHECKER -> AR SP SHARED.", $time); 
	        end
	        3'b001 : begin
            $display("ERROR: %0d - MCA CHECKER -> AW SP SHARED.", $time); 
	        end
	        3'b010 : begin
            $display("ERROR: %0d - MCA CHECKER -> W SP SHARED.", $time); 
	        end
	        3'b011 : begin
            $display("ERROR: %0d - MCA CHECKER -> R MP SHARED.", $time); 
	        end
	        3'b100 : begin
            $display("ERROR: %0d - MCA CHECKER -> B MP SHARED.", $time); 
	        end
        endcase
      end

     end
  end

  /*----------------------------------------------------------------------
   * Check that if a VALID READY handshake occured during the arbitration
   * window, the arbiter is enabled at the end of that window.
   */
  wire tx_acc;
  assign tx_acc = valid_i & ready_i;


  // Record when VALID READY handshake occurs during arbitration window.
  reg tx_acc_in_window_r;
  wire tx_acc_in_window;
  always @(posedge aclk_i or negedge aresetn_i)
  begin : tx_acc_in_window_r_PROC
    if(~aresetn_i) begin
      tx_acc_in_window_r <= 1'b0;
    end else begin
      if(tx_acc) tx_acc_in_window_r <= 1'b1;
      // This branch takes priority, clear at end of every window.
      if(grant_index_update) tx_acc_in_window_r <= 1'b0;
    end
  end // tx_acc_in_window_r_PROC

  // Take account of tx_acc happening on same cycle that arbitration
  // window ends.
  assign tx_acc_in_window = tx_acc_in_window_r | tx_acc;


  /*----------------------------------------------------------------------
   * Detect if maximum outstanding number of transactions has been
   * reached. This will cause the arbiter on address channels to be 
   * disabled.
   */
  wire tx_cpl;
  assign tx_cpl =  resp_valid_i
                 & resp_ready_i 
                 & (resp_last_i | (channel_i==3'b001));
  
  // Delay by one cycle to line up with DUT.                 
  reg tx_cpl_r;                 
  always @(posedge aclk_i or negedge aresetn_i) 
  begin : tx_cpl_r_PROC
    if(~aresetn_i) begin
      tx_cpl_r <= 1'b0;
    end else begin
      tx_cpl_r <= tx_cpl;
    end
  end 

  reg [31:0] num_act_tx_r;
  always @(posedge aclk_i or negedge aresetn_i) 
  begin : num_act_tx_r_PROC
    if(~aresetn_i) begin
      num_act_tx_r <= 'b0;
    end else begin
      case({{valid_i & ready_i},{tx_cpl_r}})
        2'b00,
        2'b11 : num_act_tx_r <= num_act_tx_r;
        2'b10 : num_act_tx_r <= num_act_tx_r + 1;
        2'b01 : num_act_tx_r <= num_act_tx_r - 1;
      endcase
    end 
  end 

  wire max_act_tx;
  assign max_act_tx = (num_act_tx_r==MAX_ACT_TXS);

  // Check ERROR condition.
  // Arbiter not enabled at end of window when tx was accepted during
  // the window.
  always @(posedge aclk_i)
  begin

    if(  (tx_acc_in_window & grant_index_update & ~arb_enable_i)
       & (MCA_EN ==1)

       // Dedicated address channel arbiters are disabled while valid is masked
       // (due to max. outstanding t/x's), to hold current grant.
       & ~(max_act_tx & ~shared_i & ((channel_i==3'b000) | (channel_i==3'b001)))

       // Only expect arbiter to be enabled when it has granted current
       // valid. It is possible for a valid to assert before request has
       // reached arbiter i.e. for default granted master.
       & grant_arb_i
      ) begin

      test_DW_axi.chk_mca_failed = 1; 

      $display("ERROR: %0d - MCA CHECKER -> Arbiter not enabled at end of arbitration window", $time); 
      $display("ERROR: %0d - MCA CHECKER -> in spite of VALID/READY handshake during the window.", $time); 

      if(~shared_i) begin
        case(channel_i) 
	        3'b000 : begin
            $display("ERROR: %0d - MCA CHECKER -> AR SP %0d.", $time, port_i); 
	        end
	        3'b001 : begin
            $display("ERROR: %0d - MCA CHECKER -> AW SP %0d.", $time, port_i); 
	        end
	        3'b010 : begin
            $display("ERROR: %0d - MCA CHECKER -> W SP %0d.", $time, port_i); 
	        end
	        3'b011 : begin
            $display("ERROR: %0d - MCA CHECKER -> R MP %0d.", $time, port_i); 
	        end
	        3'b100 : begin
            $display("ERROR: %0d - MCA CHECKER -> B MP %0d.", $time, port_i); 
	        end
        endcase
      end else begin
        // Testing a shared channel.
        case(channel_i) 
	        3'b000 : begin
            $display("ERROR: %0d - MCA CHECKER -> AR SP SHARED.", $time); 
	        end
	        3'b001 : begin
            $display("ERROR: %0d - MCA CHECKER -> AW SP SHARED.", $time); 
	        end
	        3'b010 : begin
            $display("ERROR: %0d - MCA CHECKER -> W SP SHARED.", $time); 
	        end
	        3'b011 : begin
            $display("ERROR: %0d - MCA CHECKER -> R MP SHARED.", $time); 
	        end
	        3'b100 : begin
            $display("ERROR: %0d - MCA CHECKER -> B MP SHARED.", $time); 
	        end
        endcase
      end

     end
  end // always @(posedge aclk_i)


endmodule
