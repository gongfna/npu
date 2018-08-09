//------------------------------------------------------------------------
//--
//--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
//--                            ALL RIGHTS RESERVED
//--
//--  This software and the associated documentation are confidential and
//--  proprietary to Synopsys, Inc.  Your use or disclosure of this
//--  software is subject to the terms and conditions of a written
//--  license agreement between you, or your company, and Synopsys, Inc.
//--
//--  The entire notice above must be reproduced on all authorized copies.

// -------------------------------------------------------------------------
// Checker for Master IDs 
// -------------------------------------------------------------------------
task automatic check_mst_id;

 input [31:0] masterID;
 input [31:0] slaveID;
 input [31:0] write;
 input [31:0] xact_cnt_max;
 input [31:0] aid;
 
 reg [31:0] aid_tmp;
 reg [`SIM_XACT_BUFF-1:0] xact_buff_tmp;
 reg [31:0] xact_cnt;
 reg [31:0] uid_cnt;
 reg [31:0] sid_cnt;
 reg [31:0] uid_max;
 reg [31:0] sid_max, aid_present;
 reg [31:0] reg_slice_buffer;
 reg [31:0] i;
 reg [31:0] aid_tracker_count[`AXI_POW2_MIDW:0];
 reg [31:0] aid_tracker[`AXI_POW2_MIDW:0];
 
  begin
  #0; 
     if(write) begin
        // If any pipeline stage exists in the channel, it will be able to
        // accept the masked t/x before the channel is stalled.
        reg_slice_buffer = ((`AXI_AW_TMO == 0) & (`AXI_AW_PL_ARB == 0)) ? 0 : 1;
        uid_max = mst_max_wr_uid_transaction[masterID] + reg_slice_buffer;
        sid_max = mst_max_wr_cmd_transaction[masterID] + reg_slice_buffer;
     end 
     else begin
        // If any pipeline stage exists in the channel, it will be able to
        // accept the masked t/x before the channel is stalled.
        reg_slice_buffer = ((`AXI_AR_TMO == 0) & (`AXI_AR_PL_ARB == 0)) ? 0 : 1;
        uid_max = mst_max_rd_uid_transaction[masterID] + reg_slice_buffer;
        sid_max = mst_max_rd_cmd_transaction[masterID] + reg_slice_buffer;
     end

     uid_cnt = 0;
     sid_cnt = 1;
     for(i = 1; i < `AXI_POW2_MIDW; i = i + 1) begin
       aid_tracker[i] = -1;
       aid_tracker_count[i] = 0;
     end
     
     // Check all active transactions (excluding lastest)
     for(xact_cnt = 0; xact_cnt < xact_cnt_max; xact_cnt = xact_cnt + 1) begin
       // Select a Read/Write XACT buffer to test from current Master
       if(write)
         xact_buff_tmp = mst_wr_xact_buff[masterID][xact_cnt];
       else
         xact_buff_tmp = mst_rd_xact_buff[masterID][xact_cnt];
      
       if(xact_buff_tmp[`SIM_XACT_BUFF-2:`SIM_XACT_BUFF-3] != 2'b11)begin
       // Get the XACT AID from Master's XACT Buffer
       axi_master_get_buffer_attr_bitvec(masterID, xact_buff_tmp[31:0], `DW_VIP_AXI_AID, 0, aid_tmp);
         
       // If AID is same - Increment same ID counter
       if(aid == aid_tmp) begin
         sid_cnt = sid_cnt + 1;
       end else begin// if AID is different - Increment unique ID counter
         aid_present = 0;
         
         for(i = 1; i < `AXI_POW2_MIDW; i = i + 1) begin
           if(aid == aid_tracker[i]) begin
             aid_present = i;
           end
         end

         if(aid_present) begin
           aid_tracker_count[aid_present] = aid_tracker_count[aid_present] + 1;
         end else begin
           for( i = 1; i < `AXI_POW2_MIDW; i = i + 1 ) begin
             if(aid_tracker_count[i] == 0) begin
               aid_tracker[i] = aid;
               aid_tracker_count[aid_present] = aid_tracker_count[aid_present] + 1;
               uid_cnt = uid_cnt + 1;
               i = `AXI_POW2_MIDW + 1;
             end
           end
         end
       end  
       end  
     end// for(xact...
  
     if(sid_cnt > sid_max) begin
       if(write)
         $display("ERROR: %0d - MST SAME ID CHECKER -> Master %0d port accepted %0d Write transactions (limit: %0d)  with AID of %0d", $time, masterID, sid_cnt, sid_max, aid);
       else 
         $display("ERROR: %0d - MST SAME ID CHECKER -> Master %0d port accepted %0d Read transactions (limit: %0d)  with AID of %0d", $time, masterID, sid_cnt, sid_max, aid);

       id_error = id_error + 1;
     end
     
     if(uid_cnt > uid_max) begin
       if(write)
         $display("ERROR: %0d - MST UNIQUE ID CHECKER -> Master %0d port accepted %0d Write transactions (limit: %0d) with unique AIDs", $time, masterID, uid_cnt, uid_max);
       else 
         $display("ERROR: %0d - MST UNIQUE ID CHECKER -> Master %0d port accepted %0d Read transactions (limit: %0d) with unique AIDs", $time, masterID, uid_cnt, uid_max);

       id_error = id_error + 1;
     end
  end//begin
endtask

// -------------------------------------------------------------------------
// Checker for Slave IDs 
// -------------------------------------------------------------------------
task automatic check_slv_id;

 input [31:0] slaveID;
 input [31:0] write;
 input [31:0] xact_cnt;
 input [31:0] xact_aid;
 input [31:0] xact_buff;
 
 reg [31:0] mst_num;
 reg [3:0] aprot;

  begin
  #0;
     if(`AXI_NUM_MASTERS > 1)
       mst_num = xact_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] + 1;
     else
       mst_num = 1;
     
     `ifdef AXI_BICMD_SUPPORT
        mst_num = axi_pnum_for_snum[mst_num];
     `endif

     `ifdef AXI_TZ_SUPPORT
       axi_master_get_buffer_attr_bitvec(mst_num, xact_buff[31:0], `DW_VIP_AXI_APROT, 0, aprot);
     `endif
     
     if(write) begin
       if(xact_cnt > slv_max_wr_transaction[slaveID] && num_vis_mst[slaveID] > 1) begin
         $display("ERROR: %0d - SLV ID CHECKER -> Slave %0d port forwarded %0d Write transactions (limit: %0d)", $time, slaveID, xact_cnt, slv_max_wr_transaction[slaveID] );
         
         id_error = id_error + 1;
       end
     
       if(!visible_slaves[mst_num][slaveID] && check_nv == 1)begin
         $display("ERROR: %0d - SLV VISIBILITY CHECKER -> Slave %0d port forwarded a write transaction from non-visible Master %0d", $time, slaveID, mst_num);
         
         id_error = id_error + 1;
       end 
     
      `ifdef AXI_TZ_SUPPORT
       if(visible_slaves[mst_num][slaveID] && tz_secure_s[slaveID] == 1'b1 && aprot[1] == 1)begin
         $display("ERROR: %0d - SLV TRUSTZONE CHECKER -> Secure Slave %0d port forwarded a unsecure write transaction from Master %0d", $time, slaveID, mst_num);
         
         id_error = id_error + 1;
       end
      `endif
       
     end 
     else begin
       if(xact_cnt > slv_max_rd_transaction[slaveID]  && num_vis_mst[slaveID] > 1) begin
         $display("ERROR: %0d - SLV ID CHECKER -> Slave %0d port forwarded %0d Read transactions (limit: %0d)", $time, slaveID, xact_cnt, slv_max_rd_transaction[slaveID] );
         
         id_error = id_error + 1;
       end
       
       if(!visible_slaves[mst_num][slaveID] && check_nv == 1)begin
         $display("ERROR: %0d - SLV VISIBILITY CHECKER -> Slave %0d port forwarded a read transaction from non-visible Master %0d", $time, slaveID, mst_num);
         
         id_error = id_error + 1;
       end 
      
      `ifdef AXI_TZ_SUPPORT
       if(visible_slaves[mst_num][slaveID] && tz_secure_s[slaveID] == 1'b1 && aprot[1] == 1)begin
         $display("ERROR: %0d - SLV TRUSTZONE CHECKER -> Secure Slave %0d port forwarded a unsecure read transaction from Master %0d", $time, slaveID, mst_num);
         
         id_error = id_error + 1;
       end
      `endif
     end

     
  end//begin
endtask

task automatic check_slv_addr_sideband;
  input [31:0] slaveID;
  input [31:0] write;
  reg [63:0] sideband_tmp;
  reg [`AXI_AW-1:0] addr_tmp;
  
  begin
  #0;  
    if(write) begin
      addr_tmp = awaddr_s[slaveID];
      sideband_tmp = {2{addr_tmp}};
      if(awsideband_s[slaveID] != sideband_tmp[`AXI_AW_SBW-1:0]) begin
         $display("ERROR: %0d - SLV AW_SIDEBAND CHECKER - Slave %0d: Received sideband value %0h, expected sideband value %0h", $time, slaveID, awsideband_s[slaveID], sideband_tmp[`AXI_AW_SBW-1:0] );
         id_error = id_error + 1;
      end   
    end
    else begin
      addr_tmp = araddr_s[slaveID];
      sideband_tmp = {2{addr_tmp}};
      if(arsideband_s[slaveID] != sideband_tmp[`AXI_AR_SBW-1:0]) begin
         $display("ERROR: %0d - SLV AR_SIDEBAND CHECKER - Slave %0d: Received sideband value %0h, expected sideband value %0h", $time, slaveID, arsideband_s[slaveID], sideband_tmp[`AXI_AR_SBW-1:0] );
         id_error = id_error + 1;
      end   
    end
  end
endtask  

task automatic check_slv_data_sideband;
  input [31:0] slaveID;
  reg [63:0] sideband_tmp;
  reg [`AXI_DW-1:0] data_tmp;
  
  begin
  #0;
    data_tmp = wdata_s[slaveID];
    sideband_tmp = {8{data_tmp}};
    
    if(wsideband_s[slaveID] != sideband_tmp[`AXI_W_SBW-1:0]) begin
      $display("ERROR: %0d - SLV W_SIDEBAND CHECKER - Slave %0d: Received sideband value %0h, expected sideband value %0h", $time, slaveID, wsideband_s[slaveID], sideband_tmp[`AXI_W_SBW-1:0] );
      id_error = id_error + 1;
    end   
  end
endtask  

task automatic check_mst_sideband;
  input [31:0] masterID;
  input [31:0] read;
  reg [63:0] sideband_tmp;
  reg [`AXI_MIDW-1:0] aid_tmp; 
  reg [`AXI_DW-1:0] data_tmp;

  begin
  #0;
    if(read) begin
      data_tmp = rdata_m[masterID];
      sideband_tmp = {8{data_tmp}};
      if(rsideband_m[masterID] != sideband_tmp[`AXI_R_SBW-1:0]) begin
         $display("ERROR: %0d - MST R_SIDEBAND CHECKER - Master %0d: Received sideband value %0h, expected sideband value %0h", $time, masterID, rsideband_m[masterID], sideband_tmp[`AXI_R_SBW-1:0] );
         id_error = id_error + 1;
      end   
    end
    else begin
      aid_tmp = bid_m[masterID];
      if(bresp_m[masterID] == 2'b11)
        sideband_tmp = {64{1'b0}};
      else
        sideband_tmp = {64{aid_tmp}};
     
      if(bsideband_m[masterID] != sideband_tmp[`AXI_B_SBW-1:0]) begin
         $display("ERROR: %0d - MST B_SIDEBAND CHECKER - Master %0d: Received sideband value %0h, expected sideband value %0h", $time, masterID, bsideband_m[masterID], sideband_tmp[`AXI_B_SBW-1:0] );
         id_error = id_error + 1;
      end   
    end
  end
endtask  


// Check that the multi tile write deadlock avoidance logic is working.
task automatic check_multitile_dlock_masking;

 input [31:0] masterID;
 input [31:0] slaveID;
 input [`SIM_XACT_BUFF-1:0] xact_buff;
 input [31:0] xact_buff_index;
 input [31:0] active_xact;
 input wcpl;

 reg [`AXI_MAX_NUM_MST_SLVS-1:0] non_lcl_slv_bus;
 reg [3:0] aprot;
 integer slv_tz;
 integer slv_vis;
 
 integer newer_tx;
 integer buff_slv_num;
 reg [`SIM_XACT_BUFF-1:0] buffer_handle_tmp;
 reg [63:0] buff_addr;
 reg lcl_tx_iss_b4_nlcl;
     
 reg test_debug;

 begin
  #0; 
     
     //test_debug = 1;
     test_debug = 0;
         
     // Create bus of non local slave signals.
     non_lcl_slv_bus =
       {(`AXI_ACC_NON_LCL_SLV_S16 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S15 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S14 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S13 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S12 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S11 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S10 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S9 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S8 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S7 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S6 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S5 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S4 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S3 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S2 ? 1'b1 : 1'b0),
        (`AXI_ACC_NON_LCL_SLV_S1 ? 1'b1 : 1'b0),
        1'b0 // Default slave is always local.
       };

     // Get security properity of t/x.
     axi_master_get_buffer_attr_bitvec(masterID, xact_buff[31:0], `DW_VIP_AXI_APROT, 0, aprot);

     // Filter slave number wrt. trustzone.
     // If trustzone is enabled, if the t/x is to a secure
     // slave and aprot[1] == 1'b1(non secure t/x), the t/x will
     // be sent to the default slave.
     slv_tz = `AXI_HAS_TZ_SUPPORT 
              ? ((|(tz_secure_s & (1'b1<<slaveID)) & aprot[1]) ? 0 : slaveID)
              : slaveID;

     if(test_debug) begin
       $display("DEBUG: %0d, xact_buff %0d, aprot %0b, slv_tz %0b"
                , $time, xact_buff, aprot, slv_tz);
     end

     // Will the t/x have been routed to the default slave due to
     // visibility.
     if(!visible_slaves[masterID][slv_tz]) slv_vis = 0;
     else slv_vis = slv_tz;


     if(~wcpl) begin

       if(test_debug) begin
         $display("DEBUG: %0d, B4, non_lcl_slv_bus[%0d] %0d"
	          , $time, slv_vis, non_lcl_slv_bus[slv_vis]);
         $display("DEBUG: %0d, B4, tb_mst_wlast_b4_awr[%0d] %0d"
	          , $time, (masterID-1), tb_mst_wlast_b4_awr[(masterID-1)]);
         $display("DEBUG: %0d mt dlock : tb_bus_mst_w_nlcl_pend_slv[%0d] %0d"
	          , $time, (masterID-1), tb_bus_mst_w_nlcl_pend_slv[(masterID-1)]);
         $display("DEBUG: %0d mt dlock : tb_bus_mst_w_nlcl_pend_cnt[%0d] %0d"
	          , $time, (masterID-1), tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)]);
       end

       // If this slave is a non local slave, record the slave number, 
       // and increment the count of pending t/x's at non local slaves.
       if(  non_lcl_slv_bus[slv_vis] 
          // Unless count is 0, don't accept a new slave number, otherwise
          // check below will not be able to detect failure condition.
          & (  (tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)] == 0)
             | (tb_bus_mst_w_nlcl_pend_slv[(masterID-1)] == slv_vis)
            )
         )
       begin
         tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)] = tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)]+1;
         tb_bus_mst_w_nlcl_pend_slv[(masterID-1)] = slv_vis;
         if(test_debug) begin
           $display("DEBUG: %0d mt dlock : tb_bus_mst_w_nlcl_pend_slv[%0d] %0b"
      	            , $time, (masterID-1), tb_bus_mst_w_nlcl_pend_slv[(masterID-1)]);
           $display("DEBUG: %0d mt dlock : tb_bus_mst_w_nlcl_pend_cnt[%0d] %0d"
	                  , $time, (masterID-1), tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)]);
	       end
       end

       // Count is back to 0, reset WLAST before AWREADY flag.
       if(tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)] == 0) tb_mst_wlast_b4_awr[(masterID-1)] = 0;

       if(test_debug) begin
         $display("DEBUG: %0d mt dlock : tb_mst_wlast_b4_awr[%0d] %0d"
                  , $time, (masterID-1), tb_mst_wlast_b4_awr[(masterID-1)]);
       end

     end // if(~wcpl)


     // Decrement the masters non local slave pending t/x whenever a WLAST
     // is received.
     if(wcpl) begin
       if(test_debug) begin
         $display("DEBUG: %0d mt dlock : CPL : tb_bus_mst_w_nlcl_pend_cnt[%0d] %0d"
                  , $time, (masterID-1), tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)]);
       end

       if(non_lcl_slv_bus[slv_vis]) begin

         // If WLAST reaches a slave before AWREADY, allow the count to
         // wrap around and flag that we now have more WLASTs for this
         // master than AWREADY's.
         if(tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)] == 0) begin
	         tb_mst_wlast_b4_awr[(masterID-1)] = 1;
           if(test_debug) begin
             $display("DEBUG: %0d, PRE WLAST CPL Master %0d, Slave %0d"
                      , $time, (masterID-1), slv_vis);
           end
         end

         tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)] = tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)]-1;
         if(test_debug) begin
           $display("DEBUG: %0d mt dlock : CPL : tb_bus_mst_w_nlcl_pend_cnt[%0d] %0d"
                    , $time, (masterID-1), tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)]);
	       end
       end
     end // if(wcpl)

     // If the non local pending tx count is non zero, search newer t/x's from
     // the master for t/x's to the masters currently pending non local slave.
     // Works around issue where the shared layer could buffer a t/x to
     // a local slave, and subsequently issue it after a t/x to a non local
     // slave which was sent later from the same master - note t/x to non
     // local slave would be sent from a dedicated address channel in this
     // case.
     lcl_tx_iss_b4_nlcl = 0;
     if(tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)] != 0) begin
       for(newer_tx = (xact_buff_index+1); newer_tx <= active_xact; newer_tx = newer_tx + 1) begin        
         buffer_handle_tmp = mst_wr_xact_buff[masterID][newer_tx];
         axi_master_get_buffer_attr_bitvec(masterID, buffer_handle_tmp, `DW_VIP_AXI_ADDR, 0, buff_addr);
         axi_mon_addr_lookup(buff_addr, buff_slv_num);

	       if(tb_bus_mst_w_nlcl_pend_slv[(masterID-1)] == buff_slv_num)
	         lcl_tx_iss_b4_nlcl = 1;
	 
         if(test_debug) begin
           $display("DEBUG: %0d : newer_tx %0d, buffer_handle_tmp %0d, buff_slv_num %0d, nlcl slv %0d"
	            , $time, newer_tx, buffer_handle_tmp, buff_slv_num, tb_bus_mst_w_nlcl_pend_slv[(masterID-1)]);
	       end
       end
     end
  
     // flag an error if the master who sent this t/x has outstanding writes to a different non local
     // slave for whom WLAST has not yet been received.
     if(   slv_vis != tb_bus_mst_w_nlcl_pend_slv[(masterID-1)]
         & (tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)] != 0)
         // Don't run check during write completion phase.
         & ~wcpl
	       & ~lcl_tx_iss_b4_nlcl
         // Don't run check if shared W layer exists and has a pipeline
         // stage. In this case we could get WLAST too late, and flag
         // a false failure when a new address arrives but we don't see the
         // WLAST that made it legal until too late. This test relies on
         // the fact that when you see WLAST at a slave port, it was sent
         // from a master port on that cycle, or the cycle before.
         & ~(((`AXI_W_SHARED_PL==1) | (`AXI_W_PL_ARB==1)) & (`AXI_W_HAS_SHARED_LAYER == 1))
	       // Don't flag an error if wlast for this address came before the 
	       // address reached the slave port.
	       &  ~tb_mst_wlast_b4_awr[(masterID-1)]
       ) 
     begin
       $display("ERROR: %0d - BI-DI/MULTI-TILE Deadlock Masking Checker. ", $time);
       $display("ERROR: Slave %0d, received a write address from master %0d", slv_vis, masterID);
       $display("Who has %0d writes outstanding at non local slave %0d"
                , tb_bus_mst_w_nlcl_pend_cnt[(masterID-1)], tb_bus_mst_w_nlcl_pend_slv[(masterID-1)]);
       id_error = id_error + 1;
     end

  end//begin
endtask
