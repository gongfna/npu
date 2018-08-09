///------------------------------------------------------------------------
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

task test_wdata;
   reg write;
   integer mst_buffer[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0][8:0][9:0];
   integer cmd_status;
   integer cmd_buffer_tmp, cmd_buffer_tmp_1;
   integer res_buffer_tmp, res_buffer_tmp_1, wp_master, event_trigger;
   integer region_count;
   integer slaveID;
   integer masterID;
   
   reg [80:0] wr_string;
begin
#0;
     
    write = 1'b1;
    wr_string = "Write";
     
    $display("\n\t------------------------------------------------------");
    $display("\tTest : %0s Address/Data/Response Channel", wr_string);
    $display("\t------------------------------------------------------\n");
    $display("\ttest_wdata : Creating %0s Transactions", wr_string);
        
    for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
       for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
           for(region_count = 0; region_count < slv_num_regions[slaveID]; region_count = region_count + 1) begin
             if(test_debug) $display("\t%0d - test_wdata: %0s Transaction - Master %0d -> Slave %0d Region %0d", $time, wr_string, masterID, slaveID, region_count + 1);
               axi_mst_rand_xact(masterID, slaveID, 0, write, `SIM_UNLOCK, `SIM_SECURE, `SIM_BURST_RND, mst_buffer[masterID][slaveID][region_count][0]);
           end
       end   
     end 
     $display("\ttest_wdata: All %0s Transactions created\n", wr_string);
     

     repeat (1) @(posedge aclk);
     masterID = 1;
     slaveID = 1;
     region_count = 0;

     axi_slv_region_resp(slaveID, 0, `SIM_SLVERR_RND, 100, 0, 0, 0, 0, cmd_buffer_tmp);

     axi_master_add_to_pend(masterID, mst_buffer[masterID][slaveID][region_count][0]);
     axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[masterID][slaveID][region_count][0], cmd_buffer_tmp);
     axi_master_get_result(masterID, `VMT_DEFAULT_STREAM_ID, cmd_buffer_tmp, res_buffer_tmp);
     axi_slv_region_resp(slaveID, 0,`SIM_SLVERR_RND, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, cmd_buffer_tmp);
     
     $display("\ttest_wdata: Test Complete");
 end
endtask



//----------------------------------------------------------------------------------------------------------------
// Decoder Test - Read/Write Address/Data/Response channels 
// 
//  Tests Write channels when "write" == 1 and Read channels when "write" == 0   
//
//  Uses axi_mst_rand_xact to generate a Read/Write Transaction (fully randomised) from each Master to every region
//  within each Slave.
//
//  First iteration of the test only initiates Transactions that target Slaves that are visble to the Master
//  Second iteration of the test only initates Transactions that target non-visble Slaves and non-valid addresses
//
//  The "visibility" of a Slave determined by the value stored in the array: visible_slaves[masterID][slaveID])
//
//  To ease debugging: Each Transaction must be completed either by the targeted Slave or default Slave before another Transaction
//  is initiated. The blocking command axi_mst_get_result is used to ensure this. If a transaction never completes
//  the test will never finish and the Simulation will timeout.
//
task test_decode;
   input [31:0] write_sel;
   
   reg write;
   integer mst_buffer[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0][8:0][9:0];
   integer cmd_status;
   integer cmd_buffer_tmp, cmd_buffer_tmp_1;
   integer res_buffer_tmp, res_buffer_tmp_1, wp_master, event_trigger;
   integer unlock_buffer;
   integer trans_aid;
   integer trans_lock;
   integer secure_access;
   integer region_count;
   integer non_visible_check;
   integer slaveID;
   integer masterID;
   integer iteration;
   
   reg [2:0] trans_secure;
   reg [31:0] write_res;
   reg [80:0] wr_string;
begin
#0;
     
     if(write_sel == 2) begin
        wr_string = "Read/Write";
     end else if(write_sel == 1) begin
       write = 1'b1;
       wr_string = "Write";
     end else begin
       write = 1'b0;
       wr_string = "Read";
     end
     
     $display("\n\t------------------------------------------------------");
     $display("\tDecoder Test : %0s Address/Data/Response Channel", wr_string);
     $display("\t------------------------------------------------------\n");
     $display("\ttest_decode : Creating %0s Transactions", wr_string);
        
     for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
       
       // Creates transactions for current decoder tests
       for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
           for(region_count = 0; region_count < slv_num_regions[slaveID]; region_count = region_count + 1) begin
            if(test_debug) $display("\t%0d - test_decode : %0s Transaction - Master %0d -> Slave %0d Region %0d", $time, wr_string, masterID, slaveID, region_count + 1);

            // Ensure for simultaneous Read/Write all transactions are unlocked
            if(write_sel == 2) begin
              // Unlocked Read transaction
              axi_mst_rand_xact(masterID, slaveID, region_count, `SIM_READ, `SIM_UNLOCK, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer[masterID][slaveID][region_count][0]);
              if(test_debug) $display("\t%0d - test_decode : Read Transaction Buffer: %0h\n", $time, mst_buffer[masterID][slaveID][region_count][0]);
              
              // Unlocked Write transaction
              axi_mst_rand_xact(masterID, slaveID, region_count, `SIM_WRITE, `SIM_UNLOCK, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer[masterID][slaveID][region_count][1]);
              if(test_debug) $display("\t%0d - test_decode : Write Transaction Buffer: %0h\n", $time, mst_buffer[masterID][slaveID][region_count][1]);
            end else begin
              if(`AXI_HAS_LOCKING)
                axi_mst_rand_xact(masterID, slaveID, region_count, write, `SIM_LOCK_RND, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer[masterID][slaveID][region_count][0]);
              else
                axi_mst_rand_xact(masterID, slaveID, region_count, write, `SIM_UNLOCK, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer[masterID][slaveID][region_count][0]);
              // Fully Randomised Read or Write transaction
              //axi_mst_rand_xact(masterID, slaveID, region_count, write, 2, 2, mst_buffer[masterID][slaveID][region_count]);
              if(test_debug) $display("\t%0d - test_decode : %0s Transaction Buffer: %0h\n", $time, wr_string, mst_buffer[masterID][slaveID][region_count][0]);
            end
           end
       end   
     end 
     $display("\ttest_decode : All %0s Transactions created\n", wr_string);
     
     non_visible_check = 0;

     for(iteration = 0; iteration < 2; iteration = iteration + 1) begin // Two iterations - Valid and nonvalid addresses
       repeat (1) @(posedge aclk);

       if(iteration == 0) begin
         $display("\t-----------------------------------------------------------------------");
         $display("\t%0d -  %0s Transactions - Visible Slaves and valid addresses", $time, wr_string);
         $display("\t-----------------------------------------------------------------------\n");
       end else begin
         $display("\t----------------------------------------------------------------------------");
         $display("\t%0d - %0s Transactions - Nonvisible Slaves and nonvalid addresses", $time, wr_string);
         $display("\t----------------------------------------------------------------------------\n");
       end
       
       for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
         repeat (5) @(posedge aclk);
         $display("\n\t%0d - test_decode : Master %0d - %0s Transactions", $time, masterID, wr_string);
       
         for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
          //bypass slave which is invisible to all masters
          if ( ( nv_by_m[slaveID] & remap_n ) | ( bv_by_m[slaveID] & !remap_n ) ) begin
           if(!visible_slaves[masterID][slaveID]) non_visible_check = 1;
           
           if((visible_slaves[masterID][slaveID] && !iteration) || (!visible_slaves[masterID][slaveID] && iteration && write_sel !=2)) begin     
             for(region_count = 0; region_count < slv_num_regions[slaveID]; region_count = region_count + 1) begin
               if(write_sel == 2) begin
                 axi_master_create_watchpoint(masterID, `VMT_MESSAGE_ID, `AXI_MSGID_MASTER_SEND_XACT_COMPLETE, wp_master);
                 axi_master_set_watchpoint_trigger(masterID, `VMT_DEFAULT_STREAM_ID, wp_master, `VMT_WP_TRIGGER_PARAM, `VMT_WP_TRIGGER_HANDSHAKE);
          
                 // Initiate read and write transactions and wait on transaction completion
                 axi_master_add_to_pend(masterID, mst_buffer[masterID][slaveID][region_count][0]);
                 axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[masterID][slaveID][region_count][0], cmd_buffer_tmp);
                 axi_master_add_to_pend(masterID, mst_buffer[masterID][slaveID][region_count][1]);
                 axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[masterID][slaveID][region_count][1], cmd_buffer_tmp_1);
                 
                 axi_master_watch_for(masterID, wp_master, event_trigger);
                 axi_master_watch_for(masterID, wp_master, event_trigger);
                 axi_master_destroy_watchpoint(masterID, `VMT_DEFAULT_STREAM_ID, wp_master);
               end else begin
                 // Get buffer properties to determine if a locking command was generated
                 axi_master_get_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID][region_count][0], `DW_VIP_AXI_ALOCK, 0, trans_lock);
                 axi_master_get_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID][region_count][0], `DW_VIP_AXI_APROT, 0, trans_secure);
              
                 // If transaction was secure make unlocking command secure (if required) otherwise randomise 
                 if(trans_secure[1] == `SIM_SECURE)
                   secure_access = `SIM_SECURE;
                 else
                   secure_access = `SIM_UNSECURE;
 
                 // Initiate transaction and wait on transaction completion
                 axi_master_add_to_pend(masterID, mst_buffer[masterID][slaveID][region_count][0]);
                 axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[masterID][slaveID][region_count][0], cmd_buffer_tmp);
                 axi_master_get_result(masterID, `VMT_DEFAULT_STREAM_ID, cmd_buffer_tmp, res_buffer_tmp);
                 axi_master_delete_buffer(masterID, res_buffer_tmp);
                
                // Generate and initiate unlocking sequence if previous transaction was locked    
                 if(trans_lock == 2) begin
                   if(test_debug) $display("\t%0d - test_decode : Generating unlocking transaction for Transaction %0h", $time, mst_buffer[masterID][slaveID][region_count][0]);
                   axi_mst_rand_xact(masterID, slaveID, region_count, write, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, unlock_buffer);
                   if(test_debug) $display("\t%0d - test_decode : %0s Transaction - Unlock for Transaction %0h - Initiated", $time, wr_string, mst_buffer[masterID][slaveID][region_count][0]);
                  
                   // Get the ID of the initial locking transaction and assign it to the unlocking transaction
                   axi_master_get_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID][region_count][0], `DW_VIP_AXI_AID, 0, trans_aid);
                   axi_master_set_buffer_attr_bitvec(masterID, unlock_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
                   
                   // Initiate unlocking transaction and wait on transaction completion
                   axi_master_add_to_pend(masterID, unlock_buffer);
                   axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, unlock_buffer, cmd_buffer_tmp);
                   axi_master_get_result(masterID, `VMT_DEFAULT_STREAM_ID, cmd_buffer_tmp, res_buffer_tmp);
                   if(test_debug) $display("\t%0d - test_decode : %0s Transaction - Unlock for Transaction %0h - Completed", $time, wr_string, mst_buffer[masterID][slaveID][region_count][0]);
                   axi_master_delete_buffer(masterID, res_buffer_tmp);
                 end // if(trans_lo...
               end // if(write_se...
             end // for(re..
           end // if(vis...
          end //if ( ( nv_by_m
         end // for(slav...
       end  // for(mas...
       if(!non_visible_check) iteration = 2;
     end // Two iterations - Valid and nonvalid addresses
     $display("\ttest_decode : Test Complete");
 end
endtask

//----------------------------------------------------------------------------------------------------------------
// Exclusive Access Test - Read/Write Address/Data/Response channels 
// 
task test_exclusive;
   integer mst_buffer[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0][8:0];
   integer cmd_status, ex_write_buffer;
   integer cmd_buffer_tmp;
   integer res_buffer_tmp;
   integer region_count;
   integer slaveID;
   integer masterID;
   reg [1:0] resp;

begin
#0;
     
     $display("\n\t------------------------------------------------------");
     $display("\tExclusive Access Test");
     $display("\t------------------------------------------------------\n");
     $display("\ttest_exclusive : Creating Transactions");
        
     for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
       // Creates transactions for exclusive access tests
       for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
         for(region_count = 0; region_count < slv_num_regions[slaveID]; region_count = region_count + 1) begin
           if(test_debug) $display("\t%0d - test_exclusive : Exclusive Read Transaction - Master %0d -> Slave %0d Region %0d", $time, masterID, slaveID, region_count + 1);
           axi_mst_rand_xact(masterID, slaveID, region_count, `SIM_READ, `SIM_EXCLUSIVE, `SIM_SECURE, `SIM_BURST_RND, mst_buffer[masterID][slaveID][region_count]);
           axi_master_set_buffer_attr_bitvec(masterID,  mst_buffer[masterID][slaveID][region_count], `DW_VIP_AXI_ALOCK, 0, 2'b01);
           if(test_debug) begin 
             $display("\t%0d - test_exclusive : Overwrite alock attribute -> 01 (Exclusive)\n", $time);
             $display("\t%0d - test_exclusive : Read Transaction Buffer: %0h\n", $time, mst_buffer[masterID][slaveID][region_count]);
           end
         end
       end
     end   
     $display("\ttest_exclusive: All Exclusive Read Transactions created\n");
     

     repeat (2) @(posedge aclk);

       
     for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
       repeat (5) @(posedge aclk);
       $display("\n\t%0d - test_exclusive : Master %0d - Exclusive Access Transactions", $time, masterID);
       
       for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
         if(visible_slaves[masterID][slaveID]) begin     
           for(region_count = 0; region_count < slv_num_regions[slaveID]; region_count = region_count + 1) begin
             // Initiate exclusive read and wait for response
             axi_master_add_to_pend(masterID, mst_buffer[masterID][slaveID][region_count]);
             axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[masterID][slaveID][region_count], cmd_buffer_tmp);
             axi_master_get_result(masterID, `VMT_DEFAULT_STREAM_ID, cmd_buffer_tmp, res_buffer_tmp);
             axi_master_get_buffer_attr_bitvec(masterID, res_buffer_tmp, `DW_VIP_AXI_RESP, 0, resp);
            
             if(resp == 2'b01)begin
               // Initiate exclusive write to same address location 
               axi_master_copy_buffer(masterID, mst_buffer[masterID][slaveID][region_count], ex_write_buffer);
               axi_master_set_buffer_attr_int(masterID, ex_write_buffer, `DW_VIP_AXI_WRITE, 0, `VMT_TRUE);
               axi_master_add_to_pend(masterID, ex_write_buffer);
               axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, ex_write_buffer, cmd_buffer_tmp);
               axi_master_get_result(masterID, `VMT_DEFAULT_STREAM_ID, cmd_buffer_tmp, res_buffer_tmp);
             end
           end // for(re..
         end // if(vis...
       end // for(slav...
     end  // for(mas...
     $display("\ttest_exclusive : Test Complete");
 end
endtask


//----------------------------------------------------------------------------------------------------------------
// Arbiter Test - Address Channel 
// 
task test_arb_addr;
   input write;
   
   integer mst_buffer[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0][8:0];
   integer cmd_buffer_tmp;
   integer unlock_buffer[`AXI_NUM_MASTERS:0];
   integer trans_aid;
   integer trans_lock[`AXI_NUM_MASTERS:0];
   integer secure_access[`AXI_NUM_MASTERS:0];
   integer region_count;
   integer slaveID;
   integer masterID;
   integer transaction_count;
   integer mst_port, last_completed_master;
   integer event_trigger;
   integer cmd_status;
   integer wp_slave[`AXI_NUM_SLAVES:0];
   integer slv_aid, xact_slv_buffer;
   reg [2:0] trans_secure[`AXI_NUM_MASTERS:0];
   
   reg [40:0] wr_string;
begin
#0;
     
     if(write)
       wr_string = "Write";
     else
       wr_string = "Read";

     $display("\n\t------------------------------------");
     $display("\tArbiter Test : %0s Address Channel", wr_string);
     $display("\t------------------------------------\n");
     $display("\ttest_arb_addr : Configure %0s Transactions", wr_string);
     
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       // Transaction complete watchpoint
       if(write)
          axi_slave_create_watchpoint(slaveID, `VMT_MESSAGE_ID, `AXI_MSGID_END_OF_WR_XACT, wp_slave[slaveID]);
       else
          axi_slave_create_watchpoint(slaveID, `VMT_MESSAGE_ID, `AXI_MSGID_END_OF_RD_XACT, wp_slave[slaveID]);
       
       for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
         `ifdef AXI_EXT_PRIORITY
            set_master_priority[masterID] = {$random(seed)};
         `endif
         if(visible_slaves[masterID][slaveID]) begin   
           for(region_count = 0; region_count < slv_num_regions[slaveID];region_count = region_count + 1) begin
            $display("\t%0d - test_arb_addr : %0s Transaction: Master %0d -> Slave %0d Region %0d created", $time, wr_string, masterID, slaveID, region_count);
            if(`AXI_HAS_LOCKING)
              axi_mst_rand_xact(masterID, slaveID, region_count, write, `SIM_LOCK_RND, `SIM_SECURE, `SIM_BURST_RND, mst_buffer[masterID][slaveID][region_count]);
            else
              axi_mst_rand_xact(masterID, slaveID, region_count, write, `SIM_UNLOCK, `SIM_SECURE, `SIM_BURST_RND, mst_buffer[masterID][slaveID][region_count]);
              
            axi_master_set_buffer_attr_int(masterID, mst_buffer[masterID][slaveID][region_count], `DW_VIP_AXI_AVALID_WVALID_DELAY, 0, 0);
            
            $display("\t%0d - test_arb_addr : %0s Transaction ID: %0h\n", $time, wr_string, mst_buffer[masterID][slaveID][region_count]);
           end
         end 
       end   
     end 
     repeat (20) @(posedge aclk);
     $display("\ttest_arb_addr : All Transactions configured\n");
     
     $display("\ttest_arb_addr : Initiate transactions from Masters to common Slaves");
     
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       for(region_count = 0; region_count < slv_num_regions[slaveID]; region_count = region_count + 1) begin
         transaction_count = 0;
         last_completed_master = 0;  
         
         for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
           if(visible_slaves[masterID][slaveID]) begin   
             
             // Get buffer properties to determine if a locking command was generated
             axi_master_get_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID][region_count], `DW_VIP_AXI_ALOCK, 0, trans_lock[masterID]);
             axi_master_get_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID][region_count], `DW_VIP_AXI_APROT, 0, trans_secure[masterID]);

             // If transaction was secure make unlocking command secure (if required) otherwise randomise 
             if(trans_secure[masterID][1] == `SIM_SECURE)
               secure_access[masterID] = `SIM_SECURE;
             else
               secure_access[masterID] = `SIM_UNSECURE;
             
             // Initiate transaction and do NOT wait on transaction completion
             axi_master_add_to_pend(masterID, mst_buffer[masterID][slaveID][region_count]);
             axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[masterID][slaveID][region_count], cmd_buffer_tmp);
             
             // Count transactions issued to current Slave
             transaction_count = transaction_count + 1;
             
             // Generate unlocking sequence if previous transaction was locked    
             if(trans_lock[masterID] == 2) begin
                $display("\ttest_arb_addr : Generating unlocking transaction for Master %0d's Transaction Buffer %0h", masterID, mst_buffer[masterID][slaveID][region_count]);
                axi_mst_rand_xact(masterID, slaveID, region_count, write, `SIM_UNLOCK, secure_access[masterID], `SIM_BURST_RND, unlock_buffer[masterID]);
                
                // Get the ID of the initial locking transaction and assign it to the unlocking transaction
                axi_master_get_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID][region_count], `DW_VIP_AXI_AID, 0, trans_aid);
                axi_master_set_buffer_attr_bitvec(masterID, unlock_buffer[masterID], `DW_VIP_AXI_AID, 0, trans_aid);
             end
           end // if(visi... 
         end // for(masterID...
         
         // Wait until all transactions targeting current slave have completed
         while(transaction_count > 0) begin
            // Wait for a transaction to complete
            axi_slave_watch_for(slaveID, wp_slave[slaveID], event_trigger);
            
            // Get Master Port number of the transaction completed by the Slave (Master ID = Master Port + 1)
            if(write)
              axi_slave_get_watchpoint_data_int(slaveID, event_trigger, `AXI_MSGID_END_OF_WR_XACT_ARG_BUF_HANDLE, xact_slv_buffer, cmd_status);
            else  
              axi_slave_get_watchpoint_data_int(slaveID, event_trigger, `AXI_MSGID_END_OF_RD_XACT_ARG_BUF_HANDLE, xact_slv_buffer, cmd_status);
            
            axi_slave_get_buffer_attr_bitvec(slaveID, xact_slv_buffer, `DW_VIP_AXI_AID, 0, slv_aid); 
            
            if(`AXI_NUM_MASTERS > 1)
              mst_port = slv_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM];
            else
              mst_port = 0;

            `ifdef AXI_BICMD_SUPPORT
               mst_port = axi_pnum_for_snum[mst_port + 1] - 1;
            `endif

            // Check to see if the Master issued a locking command 
            if(trans_lock[mst_port + 1] == 2) begin
               // Initiate an unlocking sequence
               axi_master_add_to_pend(mst_port + 1, unlock_buffer[mst_port + 1]);
               axi_master_send_xact(mst_port + 1, `VMT_DEFAULT_STREAM_ID, unlock_buffer[mst_port + 1], cmd_buffer_tmp);
               $display("\ttest_arb_addr : Issuing unlocking transaction from Master %0d to Slave %0d", mst_port + 1, slaveID);
               trans_lock[mst_port + 1] = 0;
            end
            else begin
               transaction_count = transaction_count - 1;
               
               if((axi_master_priority[last_completed_master] > axi_master_priority[mst_port + 1]) || last_completed_master == 0) begin
                 last_completed_master = mst_port + 1;
               end else if(axi_master_priority[last_completed_master] == axi_master_priority[mst_port + 1]) begin 
                 if(last_completed_master <= mst_port + 1) begin
                   last_completed_master = mst_port + 1; 
                 end else begin
                   $display("\tERROR -> test_arb_addr : Master %0d (Priority %0d) won arbitration ahead of Master %0d (Priority %0d)", 
                   last_completed_master, axi_master_priority[last_completed_master], mst_port + 1, axi_master_priority[mst_port + 1]);
                   repeat (2) @(posedge aclk);
                   $finish; 
                 end
               end else if(axi_master_priority[last_completed_master] < axi_master_priority[mst_port + 1]) begin
                 $display("\tERROR -> test_arb_addr : Master %0d (Priority %0d) won arbitration ahead of Master %0d (Priority %0d)", 
                 last_completed_master, axi_master_priority[last_completed_master], mst_port + 1, axi_master_priority[mst_port + 1]);
                 repeat (2) @(posedge aclk);
                 $finish; 
               end
            end
         end// while(trans...
         
         repeat (5) @(posedge aclk);
       end// for(regi...
       repeat (5) @(posedge aclk);
  end // for(slav...
  
  repeat (2) @(posedge aclk);
  for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
    axi_slave_destroy_watchpoint(slaveID, `VMT_DEFAULT_STREAM_ID, wp_slave[slaveID]);
  end
  $display("\ttest_arb_addr : Test Complete");

 end
endtask

//----------------------------------------------------------------------------------------------------------------
// Arbiter Test - Read Data Channel 
// 
task test_arb_rd_data;
   integer mst_buffer[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0];
   integer cmd_buffer_tmp;
   integer buffer_tmp;
   integer slaveID;
   integer masterID;
   integer transaction_count;
   integer slv_num, last_completed_slave;
   integer event_trigger;
   integer cmd_status, region_count;
   integer region_rnd[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0];
   integer wp_master[`AXI_NUM_MASTERS:0];
   integer delay_param[`AXI_NUM_MASTERS:0];
   integer slv_addr, xact_mst_buffer;
   integer default_ready, random_master;
   reg [`AXI_SIDW-1:0] trans_aid;
   reg [40:0] wr_string;
   reg [40:0] ch_string;
 begin
#0;
     
   wr_string = "Read";
   ch_string = "Data";
   
   $display("\n\t------------------------------------");
   $display("\tArbiter Test : %0s %0s Channel", wr_string, ch_string);
   $display("\t------------------------------------\n");
   $display("\ttest_arb_data : Configure %0s Transactions", wr_string);
   trans_aid = 0;
   
   for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
     axi_master_create_watchpoint(masterID, `VMT_MESSAGE_ID, `AXI_MSGID_MASTER_SEND_XACT_COMPLETE, wp_master[masterID]);
     delay_param[masterID] = 1;
     
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       if(visible_slaves[masterID][slaveID]) begin   
         `ifdef AXI_EXT_PRIORITY
           set_slave_priority[slaveID] = {$random(seed)};
         `endif
         region_rnd[masterID][slaveID] = {$random(seed)} % slv_num_regions[slaveID];
         $display("\t%0d - test_arb_data : %0s Transaction: Master %0d -> Slave %0d Region %0d created", $time, wr_string, masterID, slaveID, region_rnd[masterID][slaveID]);
         axi_mst_rand_xact(masterID, slaveID, region_rnd[masterID][slaveID], `SIM_READ, `SIM_UNLOCK, `SIM_SECURE, `SIM_SINGLE_BURST,  mst_buffer[masterID][slaveID]);
         
         if(masterID <= `AXI_NUM_ICM && `AXI_LOG2_NM > 0) begin
           if(`AXI_NUM_ICM == 1) begin
            random_master = ({$random(seed)} % `AXI_NUM_SYS_MASTERS) + 1;
           `ifdef AXI_BICMD_SUPPORT
            while(axi_pnum_for_snum[random_master] != 1) begin
             random_master = {$random(seed)} % `AXI_NUM_SYS_MASTERS + 1;
            end
           `endif
            trans_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = random_master - 1;
           end else begin
            random_master = {$random(seed)} % num_valid_icm_master[masterID];
            trans_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = valid_icm_master[masterID][random_master+1] - 1;
           end
           axi_master_set_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID], `DW_VIP_AXI_AID, 0, trans_aid);
         end else begin
           axi_master_set_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID], `DW_VIP_AXI_AID, 0, trans_aid[`AXI_MIDW-1:0]);
         end

         $display("\t%0d - test_arb_data : Overwrite AID: %0d", $time, trans_aid); 
         $display("\t%0d - test_arb_data : %0s Transaction ID: %0h\n", $time, wr_string, mst_buffer[masterID][slaveID]);

         trans_aid[`AXI_MIDW-1:0] = trans_aid[`AXI_MIDW-1:0] + 1;

         axi_slave_get_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_ARREADY_PARAM, default_ready);
         if(default_ready)
           delay_param[masterID] =  delay_param[masterID] + 1;
         else
           delay_param[masterID] =  delay_param[masterID] + 2;
           
       end//if(vis... 
     end//for(slav...   
   end //for(mast...
   repeat (20) @(posedge aclk);
   
   $display("\ttest_arb_data : All Transactions configured\n");
   
   $display("\ttest_arb_data : Initiate transactions from Master to connected Slaves");
   for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
     transaction_count = 0;
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       if(visible_slaves[masterID][slaveID] && transaction_count < mst_max_rd_uid_transaction[masterID]) begin   
         axi_slave_get_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_ARREADY_PARAM, default_ready);
           
         if(default_ready)
           delay_param[masterID] =  delay_param[masterID] - 1;
         else
           delay_param[masterID] =  delay_param[masterID] - 2;
         
         axi_slv_region_resp(slaveID, region_rnd[masterID][slaveID], `SIM_SLVERR_RND, 0, 0, 0, delay_param[masterID], 0, buffer_tmp);
    
         // Initiate transaction and do NOT wait on transaction completion
         axi_master_add_to_pend(masterID, mst_buffer[masterID][slaveID]);
         axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[masterID][slaveID], cmd_buffer_tmp);
         transaction_count = transaction_count + 1;      
       end // if(visi... 
     end // for(slaveID...

     last_completed_slave = 0;  
     // Wait until all transactions issued by the current Master have completed
     while(transaction_count > 0) begin
       
       // Wait for a transaction to complete
       axi_master_watch_for(masterID, wp_master[masterID], event_trigger);
       axi_master_get_watchpoint_data_int(masterID, event_trigger, `AXI_MSGID_MASTER_SEND_XACT_COMPLETE_ARG_RESULT_BUF_HANDLE, buffer_tmp, cmd_buffer_tmp);
       axi_master_get_buffer_attr_bitvec(masterID, buffer_tmp, `DW_VIP_AXI_ADDR, 0, slv_addr);
       axi_slv_addr_lookup(slv_addr, slaveID);
       
       transaction_count = transaction_count - 1;               
       
       if((axi_slave_priority[last_completed_slave] > axi_slave_priority[slaveID]) || last_completed_slave == 0) begin
         last_completed_slave = slaveID;
       end else if(axi_slave_priority[last_completed_slave] == axi_slave_priority[slaveID]) begin 
         if(last_completed_slave <= slaveID) begin
           last_completed_slave = slaveID; 
         end else begin
           $display("\tERROR (%0d) -> test_arb_data : Slave %0d (Priority %0d) won arbitration ahead of Slave %0d (Priority %0d)", 
           $time, last_completed_slave, axi_slave_priority[last_completed_slave], slaveID, axi_slave_priority[slaveID]);
           repeat (2) @(posedge aclk);
           $finish; 
         end
       end else if(axi_slave_priority[last_completed_slave] < axi_slave_priority[slaveID]) begin
         $display("\tERROR (%0d) -> test_arb_data : Slave %0d (Priority %0d) won arbitration ahead of Slave %0d (Priority %0d)", 
         $time, last_completed_slave, axi_slave_priority[last_completed_slave], slaveID, axi_slave_priority[slaveID]);
         repeat (2) @(posedge aclk);
         $finish; 
       end

     end// while(trans...
     
     repeat(2) @(posedge aclk);
     axi_master_destroy_watchpoint(masterID, `VMT_DEFAULT_STREAM_ID, wp_master[masterID]);
  end // for(mst...

  // Re-Randomise the slave region responses
  for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1) begin
    for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1 ) begin
      if(visible_slaves[masterID][slaveID]) begin   
        axi_slv_region_resp(slaveID, region_rnd[masterID][slaveID],`SIM_SLVERR_RND, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, buffer_tmp);
      end
    end
  end//for(slav...

  $display("\ttest_arb_data : Test Complete");

 end
endtask

//----------------------------------------------------------------------------------------------------------------
// Arbiter Test - Write Data Channel 
// 
task test_arb_wr_data;
   integer mst_buffer[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0];
   integer cmd_buffer_tmp;
   integer res_buffer_tmp;
   integer region_rnd[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0];
   integer slaveID;
   integer masterID, i, last_completed_master;
   integer transaction_count;
   integer cmd_status, mst_cnt, mst_arb_1, mst_arb_2;
   integer delay_param_fb[`AXI_NUM_MASTERS:0];
   integer delay_param_sb[`AXI_NUM_MASTERS:0];
   integer xact_cnt[`AXI_NUM_SLAVES:0];
   integer default_ready, default_wready, delay_tmp;
   integer master_order[`AXI_NUM_MASTERS:0][`AXI_NUM_SLAVES:0]; 
   integer wp_slave[`AXI_NUM_SLAVES:0];
   integer event_trigger, slv_aid, trans_alen, xact_slv_buffer;
   reg [40:0] wr_string;
   reg [40:0] ch_string;
 begin
#0;
     
   wr_string = "Write";
   ch_string = "Data";
   
   $display("\n\t------------------------------------");
   $display("\tArbiter Test : %0s %0s Channel", wr_string, ch_string);
   $display("\t------------------------------------\n");
   $display("\ttest_arb_data : Configure %0s Transactions", wr_string);

   for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
     axi_slave_get_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_AWREADY_PARAM, default_ready);
     axi_slave_get_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_WREADY_PARAM, default_wready);
     
     masterID = ({$random(seed)} % `AXI_NUM_MASTERS) + 1;
     mst_cnt = 1;
     i = 1;
     while(i <= `AXI_NUM_MASTERS && mst_cnt < slv_wid_array[slaveID]) begin
       if(visible_slaves[masterID][slaveID]) begin   
        `ifdef AXI_EXT_PRIORITY
           set_master_priority[masterID] = {$random(seed)};
        `endif
         master_order[mst_cnt][slaveID] = masterID;
         xact_cnt[slaveID] = mst_cnt;
         delay_param_fb[masterID] = 2*(`AXI_NUM_MASTERS) - (mst_cnt*(2));
        
         if(`AXI_W_TMO)
           delay_param_sb[masterID] = (2*(`AXI_NUM_MASTERS + 1));
         else
           delay_param_sb[masterID] = (2*(`AXI_NUM_MASTERS + 1)) - (mst_cnt)*(!default_wready + 1);
         
         region_rnd[masterID][slaveID] = {$random(seed)} % slv_num_regions[slaveID];
         axi_slv_region_resp(slaveID, region_rnd[masterID][slaveID],`SIM_SLVERR_RND, 0, 0, 0, 0, 0, res_buffer_tmp);
     
         $display("\t%0d - test_arb_data : %0s Transaction: Master %0d -> Slave %0d Region %0d created", $time, wr_string, masterID, slaveID, region_rnd[masterID][slaveID]);

         if(`AXI_HAS_TZ_SUPPORT)
           axi_mst_rand_xact(masterID, slaveID, region_rnd[masterID][slaveID], `SIM_WRITE, `SIM_UNLOCK, `SIM_SECURE, `SIM_SINGLE_BURST, mst_buffer[masterID][slaveID]);
         else
           axi_mst_rand_xact(masterID, slaveID, region_rnd[masterID][slaveID], `SIM_WRITE, `SIM_UNLOCK, `SIM_SECURE_RND, `SIM_SINGLE_BURST, mst_buffer[masterID][slaveID]);
         
         axi_master_set_buffer_attr_int(masterID, mst_buffer[masterID][slaveID], `DW_VIP_AXI_AVALID_WVALID_DELAY, 0, delay_param_fb[masterID]);
         // Attempt to write the remaining burst data from all connected Masters simultaneously
         axi_master_set_buffer_attr_int(masterID, mst_buffer[masterID][slaveID], `DW_VIP_AXI_NEXT_WVALID_DELAY, 0, delay_param_sb[masterID]);
         
         $display("\t%0d - test_arb_data : %0s Transaction ID: %0h\n", $time, wr_string, mst_buffer[masterID][slaveID]);
         mst_cnt = mst_cnt + 1;
       end//if(vis... 

       if(masterID == `AXI_NUM_MASTERS)
         masterID = 1;
       else 
         masterID = masterID + 1;
       
       i = i + 1;
     end//for(slav...   
   end //for(mast...
   repeat (2) @(posedge aclk);
   
   $display("\ttest_arb_data : All Transactions configured\n");
   
   $display("\ttest_arb_data : Initiate transactions from Masters to common Slave");
   for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
     transaction_count = 0;
     last_completed_master = 0;
     
     for(mst_cnt = 1; mst_cnt <= xact_cnt[slaveID]; mst_cnt = mst_cnt + 1) begin
       masterID = master_order[mst_cnt][slaveID];
       if(visible_slaves[masterID][slaveID]) begin   
         axi_master_add_to_pend(masterID, mst_buffer[masterID][slaveID]);
         axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[masterID][slaveID], cmd_buffer_tmp);
         transaction_count = transaction_count + 1;      
         repeat (2) @(posedge aclk);
       end // if(visi... 
     end // for(masterID...
       
     while(transaction_count > 0) begin
       // Wait for a transaction to complete
       repeat (1) @(posedge aclk);
       
       if(wlast_s_bus[slaveID-1] && wvalid_s_bus[slaveID-1] && wready_s_bus[slaveID-1]) begin 
         slv_aid = wid_s[slaveID];
         
         if(`AXI_NUM_MASTERS > 1)
           masterID = slv_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] + 1;
         else
           masterID = 1;
        
         `ifdef AXI_BICMD_SUPPORT
            masterID = axi_pnum_for_snum[masterID];
         `endif

         transaction_count = transaction_count - 1;
         axi_master_get_buffer_attr_bitvec(masterID, mst_buffer[masterID][slaveID], `DW_VIP_AXI_ALEN, 0, trans_alen); 
          
         if(trans_alen > 0) begin
           if((axi_master_priority[last_completed_master] > axi_master_priority[masterID]) || last_completed_master == 0) begin
             last_completed_master = masterID;
           end else if(axi_master_priority[last_completed_master] == axi_master_priority[masterID]) begin 
             for(mst_cnt = 1; mst_cnt <= xact_cnt[slaveID]; mst_cnt = mst_cnt + 1 ) begin
               if(master_order[mst_cnt][slaveID] == last_completed_master) mst_arb_1 = mst_cnt;
               if(master_order[mst_cnt][slaveID] == masterID) mst_arb_2 = mst_cnt;
             end
             
             if(mst_arb_1 <= mst_arb_2) begin
               last_completed_master = masterID; 
             end else begin
               $display("\tERROR (%0d) -> test_arb_data : Master %0d (Priority %0d) won arbitration ahead of Master %0d (Priority %0d)", 
               $time, last_completed_master, axi_master_priority[last_completed_master], masterID, axi_master_priority[masterID]);
               repeat (2) @(posedge aclk);
               $finish; 
             end
           end else if(axi_master_priority[last_completed_master] < axi_master_priority[masterID]) begin
             $display("\tERROR (%0d) -> test_arb_data : Master %0d (Priority %0d) won arbitration ahead of Master %0d (Priority %0d)", 
             $time, last_completed_master, axi_master_priority[last_completed_master], masterID, axi_master_priority[masterID]);
             repeat (2) @(posedge aclk);
             $finish; 
           end
         end
       end  
     end// while(trans...

     repeat (`AXI_NUM_MASTERS + 10) @(posedge aclk);
  end // for(slav...
  
  repeat (20) @(posedge aclk);
  
  // Re-Randomise the slave region responses
  for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1) begin
    for(mst_cnt = 1; mst_cnt <= xact_cnt[slaveID]; mst_cnt = mst_cnt + 1 ) begin
      masterID = master_order[mst_cnt][slaveID];
      if(visible_slaves[masterID][slaveID]) begin   
        axi_slv_region_resp(slaveID, region_rnd[masterID][slaveID],`SIM_SLVERR_RND, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, {$random(seed)} % 10, res_buffer_tmp);
      end
    end
  end//for(slav...
 
 $display("\ttest_arb_data : Test Complete");
 end
endtask


//----------------------------------------------------------------------------------------------------------------
// Individual Read/Write ID Tests
// 
task test_mst_id;
   input [31:0] test_type;
   
   integer mst_buffer;
   integer cmd_buffer_tmp;
   integer res_buffer_tmp;
   reg[`AXI_SIDW-1:0] trans_aid;
   integer trans_count;
   integer slaveID;
   integer masterID;
   integer cmd_status;
   integer region_count, region_rnd;
   integer write, random_master;
   integer xact_max, max_slv_xact, max_mst_xact, burst_length, alen;
   
   reg [50:0] uid_string;
   reg [40:0] wr_string;
begin
#0;
     case(test_type)
       3: begin 
            write = 1; 
            wr_string = "Write";
            uid_string = "Unique";
          end
       2: begin 
            write = 0; 
            wr_string = "Read";
            uid_string = "Unique";
          end
       1: begin 
            write = 1; 
            wr_string = "Write";
            uid_string = "Same";
          end
        default: begin 
            write = 0; 
            wr_string = "Read";
            uid_string = "Same";
        end
     endcase   
     
     repeat (20) @(posedge aclk);
     
     $display("\n\t--------------------------------------------------");
     $display("\tMaster ID Test - %0s Transaction with %0s IDs", wr_string, uid_string );
     $display("\t--------------------------------------------------\n");
     
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
         if(visible_slaves[masterID][slaveID]) begin   
           case(test_type)
            3: begin 
               max_slv_xact = slv_max_wr_transaction[slaveID]; 
               max_mst_xact = mst_max_wr_uid_transaction[masterID]; 
            end
            2: begin 
               max_slv_xact = slv_max_rd_transaction[slaveID]; 
               max_mst_xact = mst_max_rd_uid_transaction[masterID];
            end
            1: begin 
               max_slv_xact = slv_max_wr_transaction[slaveID]; 
               max_mst_xact = mst_max_wr_cmd_transaction[masterID];
            end
            default: begin 
               max_slv_xact = slv_max_rd_transaction[slaveID]; 
               max_mst_xact = mst_max_rd_cmd_transaction[masterID];
            end
           endcase
 
           if(num_vis_mst[slaveID] > 1 && max_slv_xact >= max_mst_xact) 
             xact_max = max_slv_xact; 
           else
             xact_max = max_mst_xact; 

           if(uid_string == "Unique" && `AXI_POW2_MIDW < xact_max)
             xact_max = `AXI_POW2_MIDW;
           
           $display("\ttest_mst_id : Generate and initiate %0s ID %0s Transactions from Master %0d to Slave %0d", uid_string, wr_string, masterID, slaveID);
           
           trans_aid = 0;
           trans_aid = {$random(seed)} % {`AXI_MIDW{1'b1}};
         if(masterID <= `AXI_NUM_ICM && `AXI_LOG2_NM > 0) begin
           if(`AXI_NUM_ICM == 1) begin
            random_master = ({$random(seed)} % `AXI_NUM_SYS_MASTERS) + 1;
           `ifdef AXI_BICMD_SUPPORT
            while(axi_pnum_for_snum[random_master] != 1) begin
             random_master = {$random(seed)} % `AXI_NUM_SYS_MASTERS + 1;
            end
           `endif
            trans_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = random_master - 1;
           end else begin
            random_master = {$random(seed)} % num_valid_icm_master[masterID];
            trans_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = valid_icm_master[masterID][random_master+1] - 1;
           end
         end

           for(trans_count = 0; trans_count <= xact_max + 1; trans_count = trans_count + 1 ) begin
             region_rnd = {$random(seed)} % slv_num_regions[slaveID];
         
             axi_mst_rand_xact(masterID, slaveID, region_rnd, write, `SIM_UNLOCK, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer);
             if(test_debug) $display("\t%0d - test_mst_id : %0s Transaction: Master %0d -> Slave %0d Region %0d created", $time, wr_string, masterID, slaveID, region_rnd);
             
             // Interleave write data if only one master in system
             // Interleaving to a shared W channel is not
             // supported.
             //if(`AXI_NUM_MASTERS == 1 && test_type == 3) begin
             if(`AXI_NUM_MASTERS == 1 && test_type == 3 & (`AXI_W_HAS_SHARED_LAYER == 0)) begin
               if(test_debug) $display("\t%0d - test_mst_id : Write data will be interleaved", $time);
           
               axi_master_get_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_ALEN, 0, alen);
               
               if(trans_count == 0 || trans_count >= slv_wid_array[slaveID] || trans_count >= max_mst_xact || trans_count > 8)
                 axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_START_NEW_INTERLEAVE, 0, `VMT_TRUE);
               else
                 axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_START_NEW_INTERLEAVE, 0, `VMT_FALSE);
               
               axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_WRITE_INTERLEAVE_SIZE, 0, alen + 1);
               axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_WRITE_INTERLEAVE, 0, ({$random(seed)} % 3) + 1);
             
               for(burst_length = 1; burst_length < alen; burst_length = burst_length + 1) begin
                 axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_WRITE_INTERLEAVE, burst_length, ({$random(seed)} % 3) + 1);
               end
             end  
             
             // Set AID value of transaction (increment each XACT ID for unique ID tests)
             if(uid_string == "Unique") begin
               trans_aid[`AXI_MIDW-1:0] = trans_aid[`AXI_MIDW-1:0] + 1;
             end
               
             axi_master_set_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             if(test_debug) begin
               $display("\t%0d - test_mst_id : Overwrite AID: %0d", $time, trans_aid); 
               $display("\t%0d - test_mst_id : Initiating %0s Transaction with %0s ID (%0d) - Buffer %0h\n", $time, wr_string, uid_string, trans_aid, mst_buffer); 
             end
             axi_master_add_to_pend(masterID, mst_buffer);
             axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_tmp);
           end// for(trans...        
               
           // Wait on last initiated transaction
           axi_master_get_result(masterID, `VMT_DEFAULT_STREAM_ID, cmd_buffer_tmp, res_buffer_tmp);
           $display("\t%0d - test_mst_id : All %0s Transaction with %0s ID from Master %0d to Slave %0d - Completed\n", $time, wr_string, uid_string, masterID, slaveID) ; 
         end// if(vis...  
       end // for(mast...
     end // for(slav...
   
   $display("\ttest_mst_id : Test Complete");
   end
endtask

//----------------------------------------------------------------------------------------------------------------
// Read/Write ID Tests
// 
task test_mst_rw_id;
   input [31:0] test_type;
   
   integer mst_buffer[1:0];
   integer cmd_buffer_tmp[1:0];
   integer res_buffer_tmp[1:0];
   reg[`AXI_SIDW-1:0] trans_aid;
   reg[`AXI_SIDW-1:0] trans_aid_wr;
   integer trans_count;
   integer slaveID;
   integer masterID;
   integer cmd_status[1:0];
   integer region_count, region_rnd, transaction_count;
   integer rdite, wp_master, event_trigger, xact_buffer, random_master;
   integer xact_max, max_slv_xact, max_mst_xact, burst_length, alen;
   integer xact_wr_max, max_slv_wr_xact, max_mst_wr_xact;
   integer xact_rd_max, max_slv_rd_xact, max_mst_rd_xact;
   
   reg [50:0] uid_string;
   reg [80:0] wr_string;
begin
#0;
     wr_string = "Read/Write";

     case(test_type)
       1: begin 
            uid_string = "Unique";
          end
       default: begin 
            uid_string = "Same";
          end
     endcase   
     
     repeat (20) @(posedge aclk);
     
     $display("\n\t------------------------------------------------------");
     $display("\tMaster ID Test - %0s Transaction with %0s IDs", wr_string, uid_string );
     $display("\t------------------------------------------------------\n");
     
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
         transaction_count = 0;

         axi_master_create_watchpoint(masterID, `VMT_MESSAGE_ID, `AXI_MSGID_MASTER_SEND_XACT_COMPLETE, wp_master);
         axi_master_set_watchpoint_trigger(masterID, `VMT_DEFAULT_STREAM_ID, wp_master, `VMT_WP_TRIGGER_PARAM, `VMT_WP_TRIGGER_HANDSHAKE);

         if(visible_slaves[masterID][slaveID]) begin   
           case(test_type)
            1: begin 
               max_slv_rd_xact = slv_max_rd_transaction[slaveID]; 
               max_mst_rd_xact = mst_max_rd_uid_transaction[masterID]; 
               max_slv_wr_xact = slv_max_wr_transaction[slaveID]; 
               max_mst_wr_xact = mst_max_wr_uid_transaction[masterID]; 
            end
            default: begin 
               max_slv_rd_xact = slv_max_rd_transaction[slaveID]; 
               max_mst_rd_xact = mst_max_rd_cmd_transaction[masterID]; 
               max_slv_wr_xact = slv_max_wr_transaction[slaveID]; 
               max_mst_wr_xact = mst_max_wr_cmd_transaction[masterID]; 
            end
           endcase
 
           if(num_vis_mst[slaveID] > 1 && max_slv_wr_xact >= max_mst_wr_xact) 
             xact_wr_max = max_slv_wr_xact; 
           else
             xact_wr_max = max_mst_wr_xact; 
           
           if(num_vis_mst[slaveID] > 1 && max_slv_rd_xact >= max_mst_rd_xact) 
             xact_rd_max = max_slv_rd_xact; 
           else
             xact_rd_max = max_mst_rd_xact; 

           if(uid_string == "Unique" && `AXI_POW2_MIDW < xact_wr_max)
             xact_wr_max = `AXI_POW2_MIDW;
           
           if(uid_string == "Unique" && `AXI_POW2_MIDW < xact_rd_max)
             xact_rd_max = `AXI_POW2_MIDW;

           if(xact_rd_max >= xact_wr_max) 
             xact_max = xact_rd_max; 
           else
             xact_max = xact_wr_max; 
           
           $display("\ttest_mst_id : Generate and initiate %0s ID %0s Transactions from Master %0d to Slave %0d", uid_string, wr_string, masterID, slaveID);
           
           trans_aid = {$random(seed)} % {`AXI_MIDW{1'b1}};
           trans_aid_wr = {$random(seed)} % {`AXI_MIDW{1'b1}};
   
         if(masterID <= `AXI_NUM_ICM && `AXI_LOG2_NM > 0) begin
           if(`AXI_NUM_ICM == 1) begin
            random_master = ({$random(seed)} % `AXI_NUM_SYS_MASTERS) + 1;
           `ifdef AXI_BICMD_SUPPORT
            while(axi_pnum_for_snum[random_master] != 1) begin
             random_master = {$random(seed)} % `AXI_NUM_SYS_MASTERS + 1;
            end
           `endif
            trans_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = random_master - 1;
           `ifdef AXI_BICMD_SUPPORT
            while(axi_pnum_for_snum[random_master] != 1) begin
             random_master = {$random(seed)} % `AXI_NUM_SYS_MASTERS + 1;
            end
           `endif
            trans_aid_wr[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = random_master - 1;
           end else begin
            random_master = {$random(seed)} % num_valid_icm_master[masterID];
            trans_aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = valid_icm_master[masterID][random_master+1] - 1;
            random_master = {$random(seed)} % num_valid_icm_master[masterID];
            trans_aid_wr[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = valid_icm_master[masterID][random_master+1] - 1;
           end
         end

           for(trans_count = 0; trans_count <= xact_max + 1; trans_count = trans_count + 1 ) begin
             region_rnd = {$random(seed)} % slv_num_regions[slaveID];
             axi_mst_rand_xact(masterID, slaveID, region_rnd, `SIM_READ, `SIM_UNLOCK, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer[0]);
             if(test_debug) $display("\t%0d - test_mst_id : Read Transaction: Master %0d -> Slave %0d Region %0d created", $time, masterID, slaveID, region_rnd);
             
             region_rnd = {$random(seed)} % slv_num_regions[slaveID];
             axi_mst_rand_xact(masterID, slaveID, region_rnd, `SIM_WRITE, `SIM_UNLOCK, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer[1]);
             if(test_debug) $display("\t%0d - test_mst_id : Write Transaction: Master %0d -> Slave %0d Region %0d created", $time,  masterID, slaveID, region_rnd);
             
             // Interleave write data if only one master in system
             // Interleaving to a shared W channel is not
             // supported.
             //if(`AXI_NUM_MASTERS == 1 && test_type == 3) begin
             if(`AXI_NUM_MASTERS == 1 && test_type == 3 & (`AXI_W_HAS_SHARED_LAYER == 0)) begin
               if(test_debug) $display("\t%0d - test_mst_id : Write data will be interleaved", $time);
           
               axi_master_get_buffer_attr_bitvec(masterID, mst_buffer[1], `DW_VIP_AXI_ALEN, 0, alen);
               
               if(trans_count == 0 || trans_count >= 8 || trans_count >= max_mst_wr_xact || trans_count >= slv_wid_array[slaveID])
                 axi_master_set_buffer_attr_int(masterID, mst_buffer[1], `DW_VIP_AXI_START_NEW_INTERLEAVE, 0, `VMT_TRUE);
               else
                 axi_master_set_buffer_attr_int(masterID, mst_buffer[1], `DW_VIP_AXI_START_NEW_INTERLEAVE, 0, `VMT_FALSE);
               
               axi_master_set_buffer_attr_int(masterID, mst_buffer[1], `DW_VIP_AXI_WRITE_INTERLEAVE_SIZE, 0, alen + 1);
               axi_master_set_buffer_attr_int(masterID, mst_buffer[1], `DW_VIP_AXI_WRITE_INTERLEAVE, 0, ({$random(seed)} % 3) + 1);
             
               for(burst_length = 1; burst_length < alen; burst_length = burst_length + 1) begin
                 axi_master_set_buffer_attr_int(masterID, mst_buffer[1], `DW_VIP_AXI_WRITE_INTERLEAVE, burst_length, ({$random(seed)} % 3) + 1);
               end
             end  
             
             // Set AID value of transaction (increment each XACT ID for unique ID tests)
             if(uid_string == "Unique") begin
               trans_aid[`AXI_MIDW-1:0] = trans_aid[`AXI_MIDW-1:0] + 1;
               trans_aid_wr[`AXI_MIDW-1:0] = trans_aid_wr[`AXI_MIDW-1:0] + 1;
             end
               
             axi_master_set_buffer_attr_bitvec(masterID, mst_buffer[0], `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_set_buffer_attr_bitvec(masterID, mst_buffer[1], `DW_VIP_AXI_AID, 0, trans_aid_wr);

             if(test_debug) begin
               $display("\n\t%0d - test_mst_id : Overwrite Read AID: %0d", $time, trans_aid); 
               $display("\t%0d - test_mst_id : Initiating Read Transaction with %0s ID (%0d) - Buffer %0h", $time,  uid_string, trans_aid, mst_buffer[0]); 
               $display("\t%0d - test_mst_id : Overwrite Write AID: %0d", $time, trans_aid_wr); 
               $display("\t%0d - test_mst_id : Initiating Write Transaction with %0s ID (%0d) - Buffer %0h\n", $time,  uid_string, trans_aid_wr, mst_buffer[1]); 
             end
             transaction_count = transaction_count + 1;
             axi_master_add_to_pend(masterID, mst_buffer[0]);
             axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[0], cmd_buffer_tmp[0]);
             transaction_count = transaction_count + 1;
             axi_master_add_to_pend(masterID, mst_buffer[1]);
             axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer[1], cmd_buffer_tmp[1]);
           end// for(trans...        

           while(transaction_count > 0 ) begin
             axi_master_watch_for(masterID, wp_master, event_trigger);
             transaction_count = transaction_count - 1;
           end

           $display("\t%0d - test_mst_id : All Read/Write Transactions with %0s ID from Master %0d to Slave %0d - Completed\n", $time, uid_string, masterID, slaveID) ; 
         end// if(vis...  

         repeat (2) @(posedge aclk);
         axi_master_destroy_watchpoint(masterID, `VMT_DEFAULT_STREAM_ID, wp_master);
       end // for(mast...
     end // for(slav...
   
   $display("\ttest_mst_id : Test Complete");
   end
endtask

//----------------------------------------------------------------------------------------------------------------
// Random System Read/Write Tests
// 
task test_sys_rw;
   input [31:0] count;
   
   reg [31:0] buffer_tmp;
   integer mst_buffer;
   integer cmd_buffer_tmp;
   integer res_buffer_tmp;
   integer trans_count;
   integer slaveID, region_rnd;
   integer masterID;
   integer trans_lock;
   integer trans_secure;
   integer trans_aid;
   integer secure_access;
   integer lock_count, i, interleave_size;
   reg [`AXI_AW-1:0]trans_addr;

   integer wp_master, event_trigger;
   integer lock_type;
   integer slv_rvalid_delay;

   integer rnd_aready_dly;
   integer rnd_avalid_aready_dly;
   integer rnd_bready_dly;
   integer rnd_bvalid_bready_dly;

   reg [1:0] aburst;

   integer idle_count;

   `define IDLE_CLKS_MAX 100

   `define MAX_RVALID_WAIT 5

   `define AXI_TB_ABRST_WRAP 2'b10
   
begin
#0;
     repeat (20) @(posedge aclk);
     
     $display("\n\t------------------------------------------------------------");
     $display("\t Random System Test - %0d Read/Write Transactions per Master", count);
     $display("\t------------------------------------------------------------\n");
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       axi_slave_new_buffer(slaveID, buffer_tmp);
       interleave_size = ({$random(seed)} % 16) + 1;
       // We want this buffer to match both reads and writes.
       //axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 0, 0);
       //axi_slave_set_buffer_attr_enable(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 1);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_READ_INTERLEAVE_SIZE, 0, interleave_size);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_READ_INTERLEAVE, 0, ({$random(seed)} % 16) + 1);

       // Add random a*valid to a*ready delays.
       // We need both to guarantee that there is always a possibility of
       // delay. If the default ready is 1,
       // DW_VIP_AXI_RESP_AVALID_AREADY_DELAY will have no effect.
       rnd_avalid_aready_dly = ({$random(seed)} % 16) + 1;
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AVALID_AREADY_DELAY, 0, rnd_avalid_aready_dly);
       rnd_aready_dly = ({$random(seed)} % 32) + 1;
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AREADY_DELAY, 0, rnd_aready_dly);
       
       for(i = 1; i < interleave_size; i = i +1) begin
         axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_READ_INTERLEAVE, i, ({$random(seed)} % 17));
       end
       // STAR 9000268934 : Add random waits between slave rvalids.
       // Currently only the first 16 beats have valid wait states, if
       // extended burst mode is used, beats after the 16th will be issued
       // with no waits between them. For the DW_axi interconnect this is
       // not seen as a stimulus hole, as long as there are waits between
       // some valids the effect is the same on the interrconnect.
       for(i = 0; i < 15; i = i +1) begin
         slv_rvalid_delay = ({$random(seed)} % `MAX_RVALID_WAIT) + 1;
         axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_NEXT_RVALID_DELAY, i, slv_rvalid_delay);
       end
       axi_slave_add_to_match_list(slaveID, buffer_tmp, 0);
     end

     for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
       trans_lock = 0;
       lock_count = 0;
       secure_access = 0;
       
       $display("\ttest_rnd_rw : Generate and initiate %0d random transactions from Master %0d", count, masterID );
       for(trans_count = 1; trans_count <= count; trans_count = trans_count + 1 ) begin
         // If previous issued xact by the Master was locked  
         if(trans_lock == 2 && `AXI_HAS_LOCKING)begin
           lock_count = lock_count + 1;

           // If the last xact to be issued by the master or 1 in 3 chance create an unlocking xact otherwise continue locked sequence
           if(trans_count == count || (({$random(seed)} % 3) == 2) || lock_count == 2)begin
             axi_mst_rand_xact(masterID, slaveID, region_rnd, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             trans_lock = 0;
           end else begin
             axi_mst_rand_xact(masterID, slaveID, region_rnd, `SIM_RW_RND, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer);
           end

           axi_master_set_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
         end else begin
           slaveID = ({$random(seed)} % `AXI_NUM_SLAVES) + 1; 
           //gen visible slaveID by at least one master
           while ( ~((nv_by_m[slaveID] & remap_n) | (bv_by_m[slaveID] & !remap_n)) ) begin
             slaveID = ({$random(seed)} % `AXI_NUM_SLAVES) + 1;
           end

           region_rnd = {$random(seed)} % slv_num_regions[slaveID];
           lock_count = 0;
           
           if(`AXI_HAS_LOCKING && trans_count < count) begin
             axi_mst_rand_xact(masterID, slaveID, region_rnd, `SIM_RW_RND, `SIM_LOCK_RND, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer);
             axi_master_get_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_ALOCK, 0, trans_lock);
             axi_master_get_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_APROT, 0, trans_secure);
             axi_master_get_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
              
             // If transaction was secure make unlocking command secure 
             if(trans_secure[1] == `SIM_SECURE)
               secure_access = `SIM_SECURE;
             else
               secure_access = `SIM_UNSECURE;
           end else begin
             axi_mst_rand_xact(masterID, slaveID, region_rnd, `SIM_RW_RND, `SIM_UNLOCK, `SIM_SECURE_RND, `SIM_BURST_RND, mst_buffer);
           end
         end
         
         if(test_debug) $display("\t%0d - test_rnd_rw : Transaction: Master %0d -> Slave %0d Region %0d created", $time, masterID, slaveID, region_rnd);
	 
	 // If this t/x is an exclusive access, wait for the previous t/X
	 // to complete before sending.
         axi_master_get_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_ALOCK, 0, lock_type);

         // Add random bready delays.
         rnd_bready_dly = ({$random(seed)} % 32) + 1;
         axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_BREADY_DELAY, 0, rnd_bready_dly);
         rnd_bvalid_bready_dly = ({$random(seed)} % 16) + 1;
         axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_BVALID_BREADY_DELAY, 0, rnd_bvalid_bready_dly);

	       // Only enter here if there is a watchpoint to wait on or destroy.
	       if(trans_count > 1) begin

	         // Workaround for VIP issue. Where it appears the slave VIP got
	         // confused when 2 similar t/x's arrived from same master and
	         // the 2nd one is an exclusive access. If first t/x has a length
	         // of >16 then there is a risk of a VIP fatal. 
	         // Workaround by waiting for previous t/x completion if this t/x
	         // is an exclusive access.
	         if((lock_type == 1) && (`AXI_BLW > 4)) begin
             axi_master_watch_for(masterID, wp_master, event_trigger);
	         end

           axi_master_destroy_watchpoint(masterID, `VMT_DEFAULT_STREAM_ID, wp_master);
	       end

         // To hit a particular condition relating to multi tile deadlock
         // avoidance, if there is 1 master, use a length of 1 for the
         // first 50 random transactions. Want to get WLAST before AWVALID
         // at the multi tile deadlock mask block. Fixed configuration
         // combined with this stimulus used cover the desired code.
         if(`AXI_NUM_MASTERS == 1 & (trans_count < 50)) begin
           axi_master_get_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_ABURST, 0, aburst);
           if(aburst != `AXI_TB_ABRST_WRAP) 
             axi_master_set_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_ALEN, 0, 0);
         end

         axi_master_add_to_pend(masterID, mst_buffer);
         axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_tmp);

	 // Create watchpoint for completion of the current t/x.
         axi_master_create_watchpoint(masterID, `VMT_MESSAGE_ID, `AXI_MSGID_MASTER_SEND_XACT_COMPLETE, wp_master);
         axi_master_set_watchpoint_trigger(masterID, `VMT_DEFAULT_STREAM_ID, wp_master, `VMT_WP_TRIGGER_PARAM, `VMT_WP_TRIGGER_HANDSHAKE);
       end// for(trans...        

       // Because the watchpoin is created at the end of the previous loop
       // and the watch point destory occurs before it, need to destroy the
       // left over watchpoint after the loop exits.
       axi_master_destroy_watchpoint(masterID, `VMT_DEFAULT_STREAM_ID, wp_master);
         
     end     
           
     repeat (10) @(posedge aclk);
       
     // Wait for bus to be idle for IDLE_CLKS_MAX number of cycles before
     // continuing with the next test.
     idle_count = 0; 
     while(idle_count < `IDLE_CLKS_MAX) begin
        @(posedge aclk);
        if(   ((arvalid_m_bus == 'b0) & 
               (awvalid_m_bus == 'b0) & 
               (rvalid_m_bus == 'b0) & 
               (wvalid_m_bus == 'b0) & 
               (bvalid_m_bus == 'b0)
              ) 
            & ((arvalid_s_bus == 'b0) & 
               (awvalid_s_bus == 'b0) & 
               (rvalid_s_bus == 'b0) & 
               (wvalid_s_bus == 'b0) & 
               (bvalid_s_bus == 'b0)
              ) 
          ) 
       begin
         idle_count = idle_count + 1;
         if(test_debug) begin
           $display("\t %0t test_sys_rw : WAIT IDLE, idle_count %0d", $time, idle_count);
         end
       end else begin
         idle_count = 0;
       end
     end
     
     $display("\ttest_sys_rw : Test Complete");
   end
endtask

//----------------------------------------------------------------------------------------------------------------
// Test to expose a bug where timing based arbiters are not disabled while
// a transaction is being masked at a slave port because the max amount of
// t/x's are currently outstanding. This bug introduces the possibility of
// the timing based arbiter granting continually to the same client, if the
// transactions to the slave always complete at regular intervals, i.e.
// every 8 beats, or every 16 beats etc.
//
// This test will saturate a slave with transactions of the same length,
// while system verilog checkers will monitor the code to ensure the
// failure condition does not occur, and flag an error if it does.
// 
task test_tarb_disable;
   input [31:0] count;
   
   reg [31:0] buffer_tmp;
   integer mst_buffer;
   integer cmd_buffer_tmp;
   integer res_buffer_tmp;
   integer trans_count;
   integer slaveID, region_rnd;
   integer masterID;
   integer trans_lock;
   integer trans_secure;
   integer trans_aid;
   integer secure_access;
   integer lock_count, i, interleave_size;
   reg [`AXI_AW-1:0]trans_addr;

   integer idle_count;

   integer wp_master, event_trigger;
   integer lock_type;
   integer slv_rvalid_delay;

begin
#0;
     repeat (20) @(posedge aclk);
     
     $display("\n\t------------------------------------------------------------");
     $display("\t Timing Arbiter Disable Test.", count);
     $display("\t------------------------------------------------------------\n");
     // Only targeting slave 1.
     for(slaveID = 1; slaveID <= 1; slaveID = slaveID + 1 ) begin
       axi_slave_new_buffer(slaveID, buffer_tmp);
       interleave_size = ({$random(seed)} % 16) + 1;
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 0, 0);
       axi_slave_set_buffer_attr_enable(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 1);

       // No read interleaving.
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_READ_INTERLEAVE_SIZE, 0, 1);
     end

     // This test only runs for slave 1, the code that fixes the
     // arbiter enable problem is part of a submodule that is common
     // to all slave ports.
     slaveID = 1;
     if ( ~((nv_by_m[slaveID] & remap_n) | (bv_by_m[slaveID] & !remap_n)) ) begin
         $display("\t%0d - test_tarb_disable : Slave 1 not visible to any master, abandoning test.\n", $time);
     end else begin

       for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
       
         $display("\ttest_tarb_disable : Generate and initiate %0d random READ transactions from Master %0d"
                  , count, masterID );

         // Don't issue the t/x if the master is not visible to the slave (s1).
         if(visible_slaves[masterID][slaveID]) begin
           for(trans_count = 1; trans_count <= count; trans_count = trans_count + 1 ) begin
  
             region_rnd = {$random(seed)} % slv_num_regions[slaveID];
             
             // Create transaction buffer.
             // Always send secure t/x's to avoid hitting default slave if
             // unsecure access sent to secure slave.
             axi_mst_rand_xact(masterID, slaveID, region_rnd, `SIM_READ, 
                               `SIM_UNLOCK, `SIM_SECURE, `SIM_BURST_INCR_16, mst_buffer);
           
             if(test_debug)
               $display("\t%0d - test_tarb_disable : Transaction: Master %0d -> Slave %0d Region %0d created, buffer %0h"
                        , $time, masterID, slaveID, region_rnd, mst_buffer);
	   
             // Add to pending t/x list and issue the t/x.
             axi_master_add_to_pend(masterID, mst_buffer);
             axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_tmp);
  
	           // Create watchpoint for completion of the current t/x.
             axi_master_create_watchpoint(masterID, 
                                          `VMT_MESSAGE_ID, 
                                          `AXI_MSGID_MASTER_SEND_XACT_COMPLETE, 
                                          wp_master);
  
             axi_master_set_watchpoint_trigger(masterID, 
                                               `VMT_DEFAULT_STREAM_ID,
                                               wp_master, 
                                               `VMT_WP_TRIGGER_PARAM, 
                                               `VMT_WP_TRIGGER_HANDSHAKE);
           end// for(trans...        
  
           // Because the watchpoint is created at the end of the previous loop
           // and the watch point destory occurs before it, need to destroy the
           // left over watchpoint after the loop exits.
           axi_master_destroy_watchpoint(masterID, `VMT_DEFAULT_STREAM_ID, wp_master);

         end //if(visible_slaves...
           
       end // for(masterID      
             
     end // if slave 1 visible to any masters.

     repeat (10) @(posedge aclk);
     
       
     // Wait for bus to be idle for IDLE_CLKS_MAX number of cycles before
     // continuing with the next test.
     idle_count = 0; 
     while(idle_count < `IDLE_CLKS_MAX) begin
        @(posedge aclk);
        if(   ((arvalid_m_bus == 'b0) & 
               (awvalid_m_bus == 'b0) & 
               (rvalid_m_bus == 'b0) & 
               (wvalid_m_bus == 'b0) & 
               (bvalid_m_bus == 'b0)
              ) 
            & ((arvalid_s_bus == 'b0) & 
               (awvalid_s_bus == 'b0) & 
               (rvalid_s_bus == 'b0) & 
               (wvalid_s_bus == 'b0) & 
               (bvalid_s_bus == 'b0)
              ) 
          ) 
       begin
         idle_count = idle_count + 1;
         if(test_debug) begin
           $display("\t %0t test_tarb_disable : WAIT IDLE, idle_count %0d", $time, idle_count);
         end
       end else begin
         idle_count = 0;
       end
     end
     
     $display("\ttest_tarb_disable : Test Complete");
   end

endtask

//----------------------------------------------------------------------------------------------------------------
// 1 write test
// 
task test_one_write;
   input [31:0] count;
   
   reg [31:0] buffer_tmp;
   integer mst_buffer;
   integer mst_buffer_alen;
   integer cmd_buffer_tmp;
   integer res_buffer_tmp;
   integer trans_count;
   integer slaveID, region_rnd;
   integer masterID;
   integer trans_lock;
   integer trans_secure;
   integer trans_aid;
   integer secure_access;
   integer lock_count, i, interleave_size;
   reg [`AXI_AW-1:0]trans_addr;

   integer wp_master, event_trigger;
   integer lock_type;
   integer slv_rvalid_delay;

   integer rnd_aready_dly;

   integer idle_count;

   integer aw_pl_depth;
   integer w_pl_depth;

   `define IDLE_CLKS_MAX 100

   `define MAX_RVALID_WAIT 5
   
begin
#0;
     repeat (20) @(posedge aclk);
     
     $display("\n\t------------------------------------------------------------");
     $display("\t Write from Master 1 to Slave 1");
     $display("\t------------------------------------------------------------\n");
     for(slaveID = 1; slaveID <= 3; slaveID = slaveID + 1 ) begin
       axi_slave_new_buffer(slaveID, buffer_tmp);
       interleave_size = ({$random(seed)} % 16) + 1;
       // We want this buffer to match writes.
       axi_slave_set_buffer_attr_enable(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 1);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 0, 1);

       // No awready delays.
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AVALID_AREADY_DELAY, 0, 0);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AREADY_DELAY, 0, 0);

       // No wready delays
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_WVALID_WREADY_DELAY, 0, 0);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_WREADY_DELAY, 0, 0);

       axi_slave_add_to_match_list(slaveID, buffer_tmp, 0);
     end

     for(masterID = 1; masterID <= 1; masterID = masterID + 1) begin
       trans_lock = 0;
       lock_count = 0;
       secure_access = 0;
       
       $display("\ttest_rnd_rw : Generate and initiate 1 random transactions from Master %0d", masterID );
       for(trans_count = 1; trans_count <= 1; trans_count = trans_count + 1 ) begin
         slaveID = 1;

         region_rnd = {$random(seed)} % slv_num_regions[slaveID];

         if(test_debug) $display("\t%0d - test_rnd_rw : Transaction: Master %0d -> Slave %0d Region %0d created", $time, masterID, slaveID, region_rnd);

         axi_mst_rand_xact(masterID, slaveID, region_rnd, `SIM_WRITE, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
	 
         // Set 0 delay from AWVALID to WVALID.
         axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_AVALID_WVALID_DELAY, 0, 0);

         // Set all delays between consecutive WVALID's to 0.
         axi_master_get_buffer_attr_bitvec(masterID, mst_buffer, `DW_VIP_AXI_ALEN, 0, mst_buffer_alen); 
         for(i = 0; i < mst_buffer_alen; i = i +1) begin
           axi_master_set_buffer_attr_int(masterID, mst_buffer, `DW_VIP_AXI_NEXT_WVALID_DELAY, i, 0);
         end
         
	       // Only enter here if there is a watchpoint to wait on or destroy.
	       if(trans_count > 1) begin
           axi_master_destroy_watchpoint(masterID, `VMT_DEFAULT_STREAM_ID, wp_master);
	       end

         // Add the buffer to the pending t/x list and send.
         axi_master_add_to_pend(masterID, mst_buffer);
         axi_master_send_xact(masterID, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_tmp);

	       // Create watchpoint for completion of the current t/x.
         axi_master_create_watchpoint(masterID, `VMT_MESSAGE_ID, `AXI_MSGID_MASTER_SEND_XACT_COMPLETE, wp_master);
         axi_master_set_watchpoint_trigger(masterID, `VMT_DEFAULT_STREAM_ID, wp_master, `VMT_WP_TRIGGER_PARAM, `VMT_WP_TRIGGER_HANDSHAKE);
       end// for(trans...        


       aw_pl_depth = 0;
       aw_pl_depth = (`AXI_AW_TMO == 1) ? (aw_pl_depth+1) : aw_pl_depth;
       aw_pl_depth = (`AXI_AW_TMO == 2) ? (aw_pl_depth+2) : aw_pl_depth;
       aw_pl_depth = (`AXI_AW_PL_ARB == 1) ? (aw_pl_depth+1) : aw_pl_depth;

       w_pl_depth = 0;
       w_pl_depth = (`AXI_W_TMO == 1) ? (w_pl_depth+1) : w_pl_depth;
       w_pl_depth = (`AXI_W_TMO == 2) ? (w_pl_depth+2) : w_pl_depth;
       w_pl_depth = (`AXI_W_PL_ARB == 1) ? (w_pl_depth+1) : w_pl_depth;

       //$display("\t %0t test_one_write : aw_pl_depth %0d, w_pl_depth %0d", $time, aw_pl_depth, w_pl_depth);
       // If the configuration supports it (see below), if
       // AXI_REG_AW_W_PATHS == 0, awvalid_s and wvalid_s should assert in
       // the same cycle, and per the slave setup, wready_m should assert
       // in the same cycles as awvalid_m.
       @(posedge awvalid_m[1]);
       @(posedge aclk);

       // If M1 accesses S1 AW through shared layer and shared layer is
       // pipelined, need to wait an additional cycle for wready_m.
       // Only wait this extra cycle if no pipelining on W,
       if(  (`AXI_AW_LAYER_S1_M1==1) 
          & (`AXI_AW_SHARED_PL==1)
          // Don't delay if W has pipeline stage, as we will not need
          // to wait for wready_m if this is the case, and waiting
          // could delay to a point where wready_m has deasserted.
          & (w_pl_depth==0)
         )
       begin
         @(posedge aclk);
       end

			 if(!delayed_wready_m1
            // If there is pipelining on AW but no on W, then wready
            // will not immedaitely return from the slave due to the 
            // AW latency.
          & !((aw_pl_depth>0) & (w_pl_depth==0))
          & (`AXI_REG_AW_W_PATHS==0)
          & ((`AXI_WID_S1 == 1) | (`AXI_AW_PL_ARB==1))
          & (`AXI_W_MCA_NC_S1 == 1) 
          & (`AXI_AW_MCA_NC_S1 == 1) 
          // Feature only available on dedicated W layer.
          & (`AXI_W_LAYER_S1_M1 == 0) 
          & ((`AXI_AW_S1_HAS_SHRD_DDCTD_LNK_VAL==0) | (`AXI_AW_SHARED_PL==1))
          // M1 must be visible to S1 to run this check.
          // Parameters above guarantee that we can get a wready back from
          // S1 in same cycle that awvalid_m is issued.
          & visible_slaves[1][1] 
         ) 
       begin
         $display("\t %0t test_one_write : ERROR, wready_m1 not asserted immediately", $time);
         $display("\t %0t                  in config with no AW to W pipelining", $time);
       end
       
       // Because the watchpoin is created at the end of the previous loop
       // and the watch point destory occurs before it, need to destroy the
       // left over watchpoint after the loop exits.
       axi_master_destroy_watchpoint(masterID, `VMT_DEFAULT_STREAM_ID, wp_master);
         
     end     
           
     repeat (10) @(posedge aclk);
       
     // Wait for bus to be idle for IDLE_CLKS_MAX number of cycles before
     // continuing with the next test.
     idle_count = 0; 
     while(idle_count < `IDLE_CLKS_MAX) begin
        @(posedge aclk);
        if(   ((arvalid_m_bus == 'b0) & 
               (awvalid_m_bus == 'b0) & 
               (rvalid_m_bus == 'b0) & 
               (wvalid_m_bus == 'b0) & 
               (bvalid_m_bus == 'b0)
              ) 
            & ((arvalid_s_bus == 'b0) & 
               (awvalid_s_bus == 'b0) & 
               (rvalid_s_bus == 'b0) & 
               (wvalid_s_bus == 'b0) & 
               (bvalid_s_bus == 'b0)
              ) 
          ) 
       begin
         idle_count = idle_count + 1;
         if(test_debug) begin
           $display("\t %0t test_one_write : WAIT IDLE, idle_count %0d", $time, idle_count);
         end
       end else begin
         idle_count = 0;
       end
     end
     
     $display("\ttest_one_write : Test Complete");
   end
endtask

//----------------------------------------------------------------------------------------------------------------
// Test arbitration of locked sequences.
// 
task test_lock_arb;
   reg [31:0] buffer_tmp;
   integer mst_buffer;
   integer cmd_buffer_vm1_1;
   integer cmd_buffer_vm1_2;
   integer cmd_buffer_vm2_1;
   integer cmd_buffer_vm2_2;
   integer res_buffer_vm1_1;
   integer res_buffer_vm1_2;
   integer res_buffer_vm2_1;
   integer res_buffer_vm2_2;
   integer trans_count;
   integer slaveID, region;
   integer masterID;
   integer trans_lock;
   integer trans_secure;
   integer trans_aid;
   integer secure_access;
   integer lock_count, i, interleave_size;
   reg [`AXI_AW-1:0]trans_addr;

   integer wp_master, event_trigger;
   integer lock_type;
   integer slv_rvalid_delay;

   integer rnd_aready_dly;
   integer rnd_avalid_aready_dly;
   integer rnd_bready_dly;
   integer rnd_bvalid_bready_dly;

   reg [1:0] aburst;

   integer idle_count;

   integer m, vm1, vm2, num_vis;

   `define IDLE_CLKS_MAX 100

begin
#0;
     repeat (20) @(posedge aclk);
     
     $display("\n\t------------------------------------------------------------");
     $display("\t Lock Arbitration Test");
     $display("\t------------------------------------------------------------\n");
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       axi_slave_new_buffer(slaveID, buffer_tmp);
       interleave_size = ({$random(seed)} % 16) + 1;
       // We want this buffer to match both reads and writes.
       //axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 0, 0);
       //axi_slave_set_buffer_attr_enable(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 1);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_READ_INTERLEAVE_SIZE, 0, interleave_size);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_READ_INTERLEAVE, 0, ({$random(seed)} % 16) + 1);

     end

     // For each slave, send 2 locked t/x's from each of 2 visible masters.
     // If less than 2 visible masters for a slave, then don't do the test.
     // Externally, a checker will monitor granted lock sequences during
     // this test and flag an error if the same master is granted twice
     // when the arbitiration algorithm should have granted one and then
     // the other.
     secure_access = 0;
     region = 0;
     if(`AXI_HAS_LOCKING) begin
       @(posedge aclk);
       @(posedge aclk);
       tb_lock_arb_test_on = 1;
       for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
           num_vis = 0;
           vm1 = 0;
           vm2 = 0;
           for(m=1;m<=`AXI_NUM_MASTERS;m=m+1) begin
             if(visible_slaves[m][slaveID]) begin
               num_vis = num_vis + 1;
               vm1 = vm2;
               vm2 = m;
             end
           end

           $display("\t %0t, Generating locked sequences from masters %0d and %0d to slave %0d", $time, vm1, vm2, slaveID);

           if(num_vis >= 2) begin

             // Lock 1, vis master 1.
             axi_mst_rand_xact(vm1, slaveID, region, `SIM_RW_RND, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             axi_master_get_buffer_attr_bitvec(vm1, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_add_to_pend(vm1, mst_buffer);
             axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm1_1);

             // Unlock 1, vis master 1.
             axi_mst_rand_xact(vm1, slaveID, region, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             axi_master_set_buffer_attr_bitvec(vm1, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_add_to_pend(vm1, mst_buffer);
             axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm1_1);
             
             // Lock 2, vis master 1.
             axi_mst_rand_xact(vm1, slaveID, region, `SIM_RW_RND, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             axi_master_get_buffer_attr_bitvec(vm1, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_add_to_pend(vm1, mst_buffer);
             axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm1_2);

             // Unlock 2, vis master 1.
             axi_mst_rand_xact(vm1, slaveID, region, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             axi_master_set_buffer_attr_bitvec(vm1, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_add_to_pend(vm1, mst_buffer);
             axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm1_2);
             

             // Lock 1, vis master 2.
             axi_mst_rand_xact(vm2, slaveID, region, `SIM_RW_RND, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             axi_master_get_buffer_attr_bitvec(vm2, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_add_to_pend(vm2, mst_buffer);
             axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm2_1);

             // Unlock 1, vis master 2.
             axi_mst_rand_xact(vm2, slaveID, region, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             axi_master_set_buffer_attr_bitvec(vm2, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_add_to_pend(vm2, mst_buffer);
             axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm2_1);
             
             // Lock 2, vis master 2.
             axi_mst_rand_xact(vm2, slaveID, region, `SIM_RW_RND, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             axi_master_get_buffer_attr_bitvec(vm2, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_add_to_pend(vm2, mst_buffer);
             axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm2_2);

             // Unlock 2, vis master 2.
             axi_mst_rand_xact(vm2, slaveID, region, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
             axi_master_set_buffer_attr_bitvec(vm2, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid);
             axi_master_add_to_pend(vm2, mst_buffer);
             axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm2_2);

             // Wait for response of unlocking t/x from each master before
             // moving on.
             // Otherwise can't guarantee that for each slave, the lock
             // t/x's from each master will be requesting at the same time.
             axi_master_get_result(vm1, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm1_1, res_buffer_vm1_1);
             axi_master_get_result(vm1, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm1_2, res_buffer_vm1_2);
             axi_master_get_result(vm2, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm2_1, res_buffer_vm2_1);
             axi_master_get_result(vm2, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm2_2, res_buffer_vm2_2);

           end  // if(num_vis >= 2)

           @(posedge aclk);
           tb_lock_arb_test_on = 0;

       end
     end // if(`AXI_HAS_LOCKING)

     repeat (10) @(posedge aclk);
       
     // Wait for bus to be idle for IDLE_CLKS_MAX number of cycles before
     // continuing with the next test.
     idle_count = 0; 
     while(idle_count < `IDLE_CLKS_MAX) begin
        @(posedge aclk);
        if(   ((arvalid_m_bus == 'b0) & 
               (awvalid_m_bus == 'b0) & 
               (rvalid_m_bus == 'b0) & 
               (wvalid_m_bus == 'b0) & 
               (bvalid_m_bus == 'b0)
              ) 
            & ((arvalid_s_bus == 'b0) & 
               (awvalid_s_bus == 'b0) & 
               (rvalid_s_bus == 'b0) & 
               (wvalid_s_bus == 'b0) & 
               (bvalid_s_bus == 'b0)
              ) 
          ) 
       begin
         idle_count = idle_count + 1;
         if(test_debug) begin
           $display("\t %0t test_sys_rw : WAIT IDLE, idle_count %0d", $time, idle_count);
         end
       end else begin
         idle_count = 0;
       end
     end

     tb_lock_arb_test_on = 0;
     
  end
endtask



/*----------------------------------------------------------------------------------------------------------------
 * TEST MCA FCFS ARBITRATION
 * Send 2 requests from every master to every visible slave, and observe & check the grant order.
 * Test is run only for certain configurations.
 *
 * - FCFS only.
 * - Non BI-DI.
 * - Non hybrid.
 *
 * The intent of the test is not to check the arbiter itself, but that the
 * logic around the arbiter does not break the algorithm.
 *
 * Written to address CRM 9000406277
 */
task test_mca_fcfs_arb;
   reg [31:0] buffer_tmp;
   integer mst_buffer;
   integer mst_buffer1;
   integer mst_buffer2;
   integer cmd_buffer_vm_1;
   integer cmd_buffer_vm_2;
   integer res_buffer_vm_2;
   integer trans_count;
   integer slaveID, region;
   integer masterID;
   integer trans_lock;
   integer trans_secure;
   integer trans_aid;
   integer secure_access;
   integer lock_count, i, interleave_size;
   reg [`AXI_AW-1:0]trans_addr;

   integer wp_master, event_trigger;
   integer lock_type;
   integer slv_rvalid_delay;

   integer rnd_aready_dly;
   integer rnd_avalid_aready_dly;
   integer rnd_bready_dly;
   integer rnd_bvalid_bready_dly;

   reg [1:0] aburst;

   integer idle_count;

   integer m, vm, lm, num_vis, num_sameclk; 
   integer grant_mst, prev_grant_mst, grant_mst_exp;
   integer num_msts_granted;
   integer num_grants;
   integer rd1_wr0;
   reg any_avalid;
   reg [`AXI_NUM_MASTERS-1:0] avalids_sameclk;
   reg tx_acc;

   reg rtl_vcs_unencrypt;

   `define IDLE_CLKS_MAX 100

begin
#0;
     
   $display("\n\t------------------------------------------------------------");
   $display("\t TEST MCA FCFS ARBITRATION");
   $display("\t------------------------------------------------------------\n");
   for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
     axi_slave_new_buffer(slaveID, buffer_tmp);
     interleave_size = ({$random(seed)} % 16) + 1;

     // Short A*READY delays.
     rnd_aready_dly = ({$random(seed)} % 3) + 1;
     axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AVALID_AREADY_DELAY, 0, rnd_aready_dly);
     axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AREADY_DELAY, 0, rnd_aready_dly);
   end

   secure_access = 0;
   region = 0;

   // Perform tests on both read and write address channels.
   for(rd1_wr0=0;rd1_wr0<1;rd1_wr0=rd1_wr0+1) begin
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin

       if(rd1_wr0) $display("\t %0t, test_mca_fcfs_arb, SLAVE %0d, READ T/X's", $time, slaveID);
       else        $display("\t %0t, test_mca_fcfs_arb, SLAVE %0d, WRITE T/X's", $time, slaveID);

       // Calculate number of masters visible to this slave.
       num_vis = 0;
       for(m=1;m<=`AXI_NUM_MASTERS;m=m+1) begin
         if(visible_slaves[m][slaveID]) begin
           num_vis = num_vis + 1;
         end
       end

       // Only run for RTL & VCS & UNENCRYPTED. Need to white box
       // probe some DUT signals for this test.
       rtl_vcs_unencrypt = 0;
       `ifdef RTL
       `ifdef VCS
       `ifdef AXI_ENCRYPT
       `else
       rtl_vcs_unencrypt = 1;
       `endif
       `endif
       `endif
       if((slaveID==1) & ~rtl_vcs_unencrypt) begin
         $display("\t %0t, test_mca_fcfs_arb : This test can only run on unencrypted verilog with vcs, since this ", $time);
         $display("\t %0t,                     condition has not ben detected, this test will not be run", $time);
       end
  
       // Decode conditions under which test is run.
       if(  // * Slave is visible to 3 or more masters : otherwise failure condition is impossible to hit.
            (num_vis >= 3) 
            // * FCFS arbitration used : gives predictable expected grant order.
          & (get_ach_arbtype(slaveID, rd1_wr0)==1)
            // * Not a hybrid config : order of requests difficult to predict.
          & ((`AXI_AR_HAS_SHARED_LAYER == 0) | ~rd1_wr0)
          & ((`AXI_AW_HAS_SHARED_LAYER == 0) | rd1_wr0)
            // * No deadlock avoidance : will mask requests from arbiter, no effect on arbitration otherwise.
          & (`AXI_EN_MULTI_TILE_DLOCK_AVOID == 0)
            // Only run for RTL & VCS & UNENCRYPTED. Need to white box
            // probe some DUT signals for this test.
          & rtl_vcs_unencrypt
         ) begin
  
         // Loop through all masters visible to this slave.
         for(lm=1;lm<=num_vis;lm=lm+1) begin
  
           // Find the system master number of each master visible to
           // this slave, as we loop through.
           num_vis=0;
           vm = 0;
           for(m=1;m<=`AXI_NUM_MASTERS;m=m+1) begin
             if(visible_slaves[m][slaveID]) begin
               num_vis = num_vis + 1;
               if(lm == num_vis) vm = m;
             end
           end
  
           $display("\t %0t, test_mca_fcfs_arb, T/X from MST %0d to SLV %0d", $time, vm, slaveID);
  
           // Send 2 transfers from all masters visible to the slave
           // such that they will be requesting at the same time.
           fork
             begin
               axi_mst_rand_xact(vm, slaveID, region, (~rd1_wr0), `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
               axi_master_add_to_pend(vm, mst_buffer);
               axi_master_send_xact(vm, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm_1);
               $display("\t %0t, test_mca_fcfs_arb, t/x 1, mst_buffer %0d, cmd_buffer_vm_1 %0d, vm %0d", $time, mst_buffer, cmd_buffer_vm_1, vm);

               axi_mst_rand_xact(vm, slaveID, region, (~rd1_wr0), `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
               axi_master_add_to_pend(vm, mst_buffer);

               // Use different cmd buffer for last command to this slave.
               if(lm==num_vis) axi_master_send_xact(vm, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm_2);
               else            axi_master_send_xact(vm, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm_1);
               $display("\t %0t, test_mca_fcfs_arb, t/x 2, mst_buffer %0d, cmd_buffer_vm_1 %0d, vm %0d", $time, mst_buffer, cmd_buffer_vm_1, vm);
               $display("\t %0t, test_mca_fcfs_arb, t/x 2,                 cmd_buffer_vm_2 %0d, num_vis %0d", $time, mst_buffer, cmd_buffer_vm_2, num_vis);
             end
           join 
           
         end // for(lm=1;lm<=num_vis;lm=lm+1)
  
         // Wait for some master valids to assert, capture which ones assert at the same time.
         // Have to know which masters requests hit the arbiter at the same
         // time, then we can predict the grant order.
         any_avalid = 0;
         avalids_sameclk = 'b0;
         while(~any_avalid) begin
           @(posedge aclk);
           avalids_sameclk = get_arb_reqs_s(slaveID, rd1_wr0);
           any_avalid = |avalids_sameclk;
         end

         /*
          * CHECK GRANT ORDER AT THE SLAVE
          * Loop until all t/x's sent to the slave have been granted.
          */
         grant_mst=0;
         prev_grant_mst=0;
         num_msts_granted=0;
         num_grants=0;
         $display("\t %0t, test_mca_fcfs_arb, Check grant order at SLV %0d", $time, slaveID);
         
         // We expect 2 transfers from each visible master.
         while(num_grants != (num_vis*2)) begin
  
           // Wait until a valid ready handshake has occured.
           tx_acc = rd1_wr0
                    ? (arvalid_s_bus[slaveID-1] & arready_s_bus[slaveID-1])
                    : (awvalid_s_bus[slaveID-1] & awready_s_bus[slaveID-1]);
           while(~tx_acc) begin
             @(posedge aclk);
             tx_acc = rd1_wr0
                      ? (arvalid_s_bus[slaveID-1] & arready_s_bus[slaveID-1])
                      : (awvalid_s_bus[slaveID-1] & awready_s_bus[slaveID-1]);
           end // while(~(arvalid_s_bus[slaveID] ....

           // Capture granted master from upper ID bits.
           grant_mst = get_mstnum_from_id(slaveID, rd1_wr0);

           num_grants=num_grants+1;
  
           // If the granted master has changed, it must be to the next
           // highest numbered master visible to the slave.
           // Don't detect error on first granted master, no error
           // condition here.
           if((grant_mst!=prev_grant_mst) & (num_msts_granted>0)) begin
             num_sameclk=0;
             // Find next highest numbered visible master, whose valid
             // asserted among the first to assert.
             for(m=0;m<`AXI_NUM_MASTERS;m=m+1) begin
               if(visible_slaves[m][slaveID] & avalids_sameclk[m]) begin
                 num_sameclk = num_sameclk + 1;
                 if((num_msts_granted+1) == num_sameclk) grant_mst_exp = m;
               end
             end
             num_msts_granted=num_msts_granted+1;

             // We only check the grant order of the masters who asserted
             // first at the same time.
             if(grant_mst_exp != grant_mst & (num_msts_granted<=num_sameclk)) begin
               $display("\t %0t, test_mca_fcfs_arb, ERROR, rd1_wr0 %0d, SLV %0d, MST %0d granted, MST %0d expected"
                        , $time, rd1_wr0, slaveID, grant_mst, grant_mst_exp);
             end

           end 
             
           // Store last granted master
           prev_grant_mst = grant_mst;
           
         end // while(grant_mst!=(num_vis-1)) ....

         // Wait for last t/x to complete before continuing with next slave.
         axi_master_get_result(vm, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm_2, res_buffer_vm_2);
       end // if(num_vis >= 3) begin
  
     end // for(slaveID = 1; .....
   end // for(rd1_wr0=0;rd1_wr0<2;rd1_wr0=rd1_wr0+1)

   repeat (10) @(posedge aclk);
     
   // Wait for bus to be idle for IDLE_CLKS_MAX number of cycles before
   // continuing with the next test.
   idle_count = 0; 
   while(idle_count < `IDLE_CLKS_MAX) begin
      @(posedge aclk);
      if(   ((arvalid_m_bus == 'b0) & 
             (awvalid_m_bus == 'b0) & 
             (rvalid_m_bus == 'b0) & 
             (wvalid_m_bus == 'b0) & 
             (bvalid_m_bus == 'b0)
            ) 
          & ((arvalid_s_bus == 'b0) & 
             (awvalid_s_bus == 'b0) & 
             (rvalid_s_bus == 'b0) & 
             (wvalid_s_bus == 'b0) & 
             (bvalid_s_bus == 'b0)
            ) 
        ) 
     begin
       idle_count = idle_count + 1;
       if(test_debug) begin
         $display("\t %0t test_sys_rw : WAIT IDLE, idle_count %0d", $time, idle_count);
       end
     end else begin
       idle_count = 0;
     end
   end
   
 end
endtask


//----------------------------------------------------------------------------------------------------------------
// TEST CRM 9000403280
// 29/6/2010
// 
task test_lock_crm_9000403280;
   reg [31:0] buffer_tmp;
   integer mst_buffer;
   integer mst_buffer1;
   integer mst_buffer2;
   integer cmd_buffer_vm1_1;
   integer cmd_buffer_vm1_2;
   integer cmd_buffer_vm2_1;
   integer cmd_buffer_vm2_2;
   integer res_buffer_vm1_1;
   integer res_buffer_vm1_2;
   integer res_buffer_vm2_1;
   integer res_buffer_vm2_2;
   integer trans_count;
   integer slaveID, region;
   integer masterID;
   integer trans_lock;
   integer trans_secure;
   integer trans_aid1;
   integer trans_aid2;
   integer secure_access;
   integer lock_count, i, interleave_size;
   reg [`AXI_AW-1:0]trans_addr;

   integer wp_master, event_trigger;
   integer lock_type;
   integer slv_rvalid_delay;

   integer rnd_aready_dly;
   integer rnd_avalid_aready_dly;
   integer rnd_bready_dly;
   integer rnd_bvalid_bready_dly;

   reg [1:0] aburst;

   integer idle_count;

   integer m, vm1, vm2, num_vis;

   `define IDLE_CLKS_MAX 100

begin
#0;
     repeat (20) @(posedge aclk);
     
     $display("\n\t------------------------------------------------------------");
     $display("\t TEST CRM 9000403280");
     $display("\t------------------------------------------------------------\n");
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       axi_slave_new_buffer(slaveID, buffer_tmp);
       interleave_size = ({$random(seed)} % 16) + 1;
       // We want this buffer to match both reads and writes.
       //axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 0, 0);
       //axi_slave_set_buffer_attr_enable(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 1);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_READ_INTERLEAVE_SIZE, 0, interleave_size);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_READ_INTERLEAVE, 0, ({$random(seed)} % 16) + 1);

     end

     // From 2 masters, send a locked and non locked transfer to the same slave at the same
     // time. Some time after those transfers have completed, send a locked
     // sequence to the slave from both masters, if the arbiter was not
     // enabled correctly on the cycle after the locked sequence, the
     // simulation will deadlock and fail with a timeout.
     secure_access = 0;
     region = 0;
     if(`AXI_HAS_LOCKING) begin
       @(posedge aclk);
       @(posedge aclk);

       for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
         num_vis = 0;
         vm1 = 0;
         vm2 = 0;
         for(m=1;m<=`AXI_NUM_MASTERS;m=m+1) begin
           if(visible_slaves[m][slaveID]) begin
             num_vis = num_vis + 1;
             vm1 = vm2;
             vm2 = m;
           end
         end


         $display("\t %0t, Generating locked sequence from master %0d to slave %0d, non locked from master %0d to slave %0d"
                  , $time, vm1, slaveID, vm2, slaveID);

         if(num_vis >= 2) begin

           // Lock 1, vis master 1.
           axi_mst_rand_xact(vm1, slaveID, region, `SIM_RW_RND, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer);
           axi_master_get_buffer_attr_bitvec(vm1, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid1);
           axi_master_add_to_pend(vm1, mst_buffer);
           axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm1_1);
  
           // Unlock 1, vis master 1.
           axi_mst_rand_xact(vm1, slaveID, region, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
           axi_master_set_buffer_attr_bitvec(vm1, mst_buffer, `DW_VIP_AXI_AID, 0, trans_aid1);
           axi_master_add_to_pend(vm1, mst_buffer);
           axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm1_1);
               
           // NON lock , vis master 2.
           axi_mst_rand_xact(vm2, slaveID, region, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
           axi_master_add_to_pend(vm2, mst_buffer);
           axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm2_1);
               
           axi_master_get_result(vm1, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm1_1, res_buffer_vm1_1);
           axi_master_get_result(vm2, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm2_1, res_buffer_vm2_1);
  
           repeat (200) @(posedge aclk);
  
           $display("\t %0t, Generating locked sequences from masters %0d and %0d to slave %0d", $time, vm1, vm2, slaveID);
    
           fork
             begin
             // Lock 2, vis master 1.
             axi_mst_rand_xact(vm1, slaveID, region, `SIM_RW_RND, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer1);
             axi_master_get_buffer_attr_bitvec(vm1, mst_buffer1, `DW_VIP_AXI_AID, 0, trans_aid1);
             axi_master_add_to_pend(vm1, mst_buffer1);
             axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer1, cmd_buffer_vm1_2);
    
             // Unlock 2, vis master 1.
             axi_mst_rand_xact(vm1, slaveID, region, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer1);
             axi_master_set_buffer_attr_bitvec(vm1, mst_buffer1, `DW_VIP_AXI_AID, 0, trans_aid1);
             axi_master_add_to_pend(vm1, mst_buffer1);
             axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer1, cmd_buffer_vm1_2);
             end
    
             begin
             // Lock 1, vis master 2.
             axi_mst_rand_xact(vm2, slaveID, region, `SIM_RW_RND, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer2);
             axi_master_get_buffer_attr_bitvec(vm2, mst_buffer2, `DW_VIP_AXI_AID, 0, trans_aid2);
             axi_master_add_to_pend(vm2, mst_buffer2);
             axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer2, cmd_buffer_vm2_2);
    
             // Unlock 1, vis master 2.
             axi_mst_rand_xact(vm2, slaveID, region, `SIM_RW_RND, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer2);
             axi_master_set_buffer_attr_bitvec(vm2, mst_buffer2, `DW_VIP_AXI_AID, 0, trans_aid2);
             axi_master_add_to_pend(vm2, mst_buffer2);
             axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer2, cmd_buffer_vm2_2);
             end
           join
                 
           // Wait for response of unlocking t/x from each master before
           // moving on.
           // Otherwise can't guarantee that for each slave, the lock
           // t/x's from each master will be requesting at the same time.
           axi_master_get_result(vm1, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm1_2, res_buffer_vm1_2);
           axi_master_get_result(vm2, `VMT_DEFAULT_STREAM_ID, cmd_buffer_vm2_2, res_buffer_vm2_2);

         end // if(num_vis >= 2) begin

       end // for(slaveID = 1; .....

     end // if(`AXI_HAS_LOCKING)

     repeat (10) @(posedge aclk);
       
     // Wait for bus to be idle for IDLE_CLKS_MAX number of cycles before
     // continuing with the next test.
     idle_count = 0; 
     while(idle_count < `IDLE_CLKS_MAX) begin
        @(posedge aclk);
        if(   ((arvalid_m_bus == 'b0) & 
               (awvalid_m_bus == 'b0) & 
               (rvalid_m_bus == 'b0) & 
               (wvalid_m_bus == 'b0) & 
               (bvalid_m_bus == 'b0)
              ) 
            & ((arvalid_s_bus == 'b0) & 
               (awvalid_s_bus == 'b0) & 
               (rvalid_s_bus == 'b0) & 
               (wvalid_s_bus == 'b0) & 
               (bvalid_s_bus == 'b0)
              ) 
          ) 
       begin
         idle_count = idle_count + 1;
         if(test_debug) begin
           $display("\t %0t test_sys_rw : WAIT IDLE, idle_count %0d", $time, idle_count);
         end
       end else begin
         idle_count = 0;
       end
     end

     tb_lock_arb_test_on = 0;
     
  end
endtask


// Get requests from the input ports of slave address channel arbiters.
function [`AXI_NUM_MASTERS-1:0] get_arb_reqs_s;
  input [`AXI_LOG2_NSP1-1:0] slv;
  input rd1_wr0;

  begin
    get_arb_reqs_s = 'b0; 
    // This code will only compile if unencrypted RTL is present.
    `ifdef RTL
    `ifdef VCS
    `ifdef AXI_ENCRYPT
    `else
    if(rd1_wr0) begin
      `ifdef AXI_AR_SHARED_LAYER
      // To avoid compilation errors, don't probe slave arbiter requests
      // when hybrid parameters are used.
      `else
      case(slv) 
        1 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `ifdef AXI_HAS_S2
        2 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S3
        3 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S4
        4 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S5
        5 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S6
        6 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S7
        7 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S8
        8 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S9
        9 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S10
        10 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S11
        11 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S12
        12 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S13
        13 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S14
        14 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S15
        15 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S16
        16 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        default : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s0.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
      endcase
      `endif
    end else begin
      `ifdef AXI_AW_SHARED_LAYER
      // To avoid compilation errors, don't probe slave arbiter requests
      // when hybrid parameters are used.
      `else
      case(slv) 
        1 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `ifdef AXI_HAS_S2
        2 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S3
        3 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S4
        4 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S5
        5 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S6
        6 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S7
        7 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S8
        8 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S9
        9 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S10
        10 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S11
        11 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S12
        12 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S13
        13 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S14
        14 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S15
        15 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        `ifdef AXI_HAS_S16
        16 : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
        `endif
        default : get_arb_reqs_s = U_DW_axi.U_DW_axi_sp_s0.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.req_mca;
      endcase
      `endif
    end // if(rd1_wr0)
    `endif
    `endif
    `endif
  end
endfunction


// Extract the master number from the slave ID field at either the read or
// write address channel.
function [`AXI_LOG2_NM-1:0] get_mstnum_from_id;
  input [`AXI_LOG2_NSP1-1:0] slv;
  input rd1_wr0;

  integer i;
  reg [`AXI_LOG2_NM-1:0] sys_mnum;

  begin
    get_mstnum_from_id = 'b0;
    // Don't compile if only 1 master present, master number is always 0 in
    // this case, and mst num id bits won't exist.
    `ifdef AXI_HAS_M2
    case(slv) 
      1 : get_mstnum_from_id = rd1_wr0 ? arid_s1[`AXI_SIDW-1:`AXI_MIDW] : awid_s1[`AXI_SIDW-1:`AXI_MIDW];
      `ifdef AXI_HAS_S2
      2 : get_mstnum_from_id = rd1_wr0 ? arid_s2[`AXI_SIDW-1:`AXI_MIDW] : awid_s2[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S3
      3 : get_mstnum_from_id = rd1_wr0 ? arid_s3[`AXI_SIDW-1:`AXI_MIDW] : awid_s3[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S4
      4 : get_mstnum_from_id = rd1_wr0 ? arid_s4[`AXI_SIDW-1:`AXI_MIDW] : awid_s4[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S5
      5 : get_mstnum_from_id = rd1_wr0 ? arid_s5[`AXI_SIDW-1:`AXI_MIDW] : awid_s5[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S6
      6 : get_mstnum_from_id = rd1_wr0 ? arid_s6[`AXI_SIDW-1:`AXI_MIDW] : awid_s6[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S7
      7 : get_mstnum_from_id = rd1_wr0 ? arid_s7[`AXI_SIDW-1:`AXI_MIDW] : awid_s7[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S8
      8 : get_mstnum_from_id = rd1_wr0 ? arid_s8[`AXI_SIDW-1:`AXI_MIDW] : awid_s8[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S9
      9 : get_mstnum_from_id = rd1_wr0 ? arid_s9[`AXI_SIDW-1:`AXI_MIDW] : awid_s9[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S10
      10 : get_mstnum_from_id = rd1_wr0 ? arid_s10[`AXI_SIDW-1:`AXI_MIDW] : awid_s10[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S11
      11 : get_mstnum_from_id = rd1_wr0 ? arid_s11[`AXI_SIDW-1:`AXI_MIDW] : awid_s11[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S12
      12 : get_mstnum_from_id = rd1_wr0 ? arid_s12[`AXI_SIDW-1:`AXI_MIDW] : awid_s12[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S13
      13 : get_mstnum_from_id = rd1_wr0 ? arid_s13[`AXI_SIDW-1:`AXI_MIDW] : awid_s13[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S14
      14 : get_mstnum_from_id = rd1_wr0 ? arid_s14[`AXI_SIDW-1:`AXI_MIDW] : awid_s14[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S15
      15 : get_mstnum_from_id = rd1_wr0 ? arid_s15[`AXI_SIDW-1:`AXI_MIDW] : awid_s15[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      `ifdef AXI_HAS_S16
      16 : get_mstnum_from_id = rd1_wr0 ? arid_s16[`AXI_SIDW-1:`AXI_MIDW] : awid_s16[`AXI_SIDW-1:`AXI_MIDW];
      `endif
      default : get_mstnum_from_id = rd1_wr0 ? arid_s0[`AXI_SIDW-1:`AXI_MIDW] : awid_s0[`AXI_SIDW-1:`AXI_MIDW];
    endcase
    `endif

    // If bi-di is enabled then map the system master number we have taken
    // from the slave port to a local master number.
    `ifdef AXI_BICMD_SUPPORT
      sys_mnum = get_mstnum_from_id;
      // Subtract 1 because this function always returns master number from 0 to 15, not 1 to 16.
      // Add 1 to sys_mnum because axi_pnum_for_snum entries start from index 1 not 0.
      get_mstnum_from_id = axi_pnum_for_snum[(sys_mnum+1)] - 1;
    `endif

  end

endfunction

// Get the arbitration type of the slave read or write address channel.
function [3:0] get_ach_arbtype;
  input [`AXI_LOG2_NSP1-1:0] slv;
  input rd1_wr0;
  begin
    case(slv) 
      1 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S1 : `AXI_AW_ARB_TYPE_S1;
      2 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S2 : `AXI_AW_ARB_TYPE_S2;
      3 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S3 : `AXI_AW_ARB_TYPE_S3;
      4 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S4 : `AXI_AW_ARB_TYPE_S4;
      5 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S5 : `AXI_AW_ARB_TYPE_S5;
      6 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S6 : `AXI_AW_ARB_TYPE_S6;
      7 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S7 : `AXI_AW_ARB_TYPE_S7;
      8 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S8 : `AXI_AW_ARB_TYPE_S8;
      9 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S9 : `AXI_AW_ARB_TYPE_S9;
      10 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S10 : `AXI_AW_ARB_TYPE_S10;
      11 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S11 : `AXI_AW_ARB_TYPE_S11;
      12 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S12 : `AXI_AW_ARB_TYPE_S12;
      13 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S13 : `AXI_AW_ARB_TYPE_S13;
      14 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S14 : `AXI_AW_ARB_TYPE_S14;
      15 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S15 : `AXI_AW_ARB_TYPE_S15;
      16 : get_ach_arbtype = rd1_wr0 ? `AXI_AR_ARB_TYPE_S16 : `AXI_AW_ARB_TYPE_S16;
      default : get_ach_arbtype = 0;
    endcase
  end
endfunction

//----------------------------------------------------------------------------------------------------------------
// 
// TEST CRM 9000423090
// 5/10/10
// 
task test_fae_arb_lock_deadlock_crm_9000423090;
   reg [31:0] buffer_tmp;
   reg [31:0] buffer_tmp2;
   integer mst_buffer;
   integer mst_buffer1;
   integer mst_buffer2;
   integer mst_buffer3;
   integer cmd_buffer_vm1_1;
   integer cmd_buffer_vm1_2;
   integer cmd_buffer_vm2_1;
   integer cmd_buffer_vm2_2;
   integer cmd_buffer_vm3_1;
   integer res_buffer_vm1_1;
   integer res_buffer_vm1_2;
   integer res_buffer_vm2_1;
   integer res_buffer_vm2_2;
   integer res_buffer_vm3_1;
   integer trans_count;
   integer slaveID, region;
   integer masterID;
   integer trans_lock;
   integer trans_secure;
   integer trans_aid1;
   integer trans_aid2;
   integer secure_access;
   integer lock_count, i, interleave_size;
   reg [`AXI_AW-1:0]trans_addr;

   integer wp_master, event_trigger;
   integer lock_type;
   integer slv_rvalid_delay;

   integer rnd_aready_dly;
   integer rnd_avalid_aready_dly;
   integer rnd_bready_dly;
   integer rnd_bvalid_bready_dly;

   reg [1:0] aburst;

   integer idle_count;

   integer m, vm1, vm2, vm3, num_vis;

   integer rd0_wr1;

   integer mybreak;

   `define IDLE_CLKS_MAX 100

begin
#0;
     repeat (20) @(posedge aclk);
     
     $display("\n\t------------------------------------------------------------");
     $display("\t TEST CRM 9000423090 - FAE ARB DEADLOCK");
     $display("\t------------------------------------------------------------\n");
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       axi_slave_new_buffer(slaveID, buffer_tmp);
       interleave_size = ({$random(seed)} % 16) + 1;
       // This buffer is for reads only.
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 0, 0);
       axi_slave_set_buffer_attr_enable(slaveID, buffer_tmp, `DW_VIP_AXI_MATCH_WRITE, 1);
       // Long slave READY delays
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AVALID_AREADY_DELAY, 0, 100);

       // Add buffer to match list.
       axi_slave_add_to_match_list(slaveID, buffer_tmp, 0);

       // Setup write response buffer.
       axi_slave_new_buffer(slaveID, buffer_tmp2);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp2, `DW_VIP_AXI_MATCH_WRITE, 0, 1);
       axi_slave_set_buffer_attr_enable(slaveID, buffer_tmp2, `DW_VIP_AXI_MATCH_WRITE, 1);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp2, `DW_VIP_AXI_RESP_AVALID_AREADY_DELAY, 0, 99);
       axi_slave_add_to_match_list(slaveID, buffer_tmp2, 0);
     end

     // This is a directed test, which is designed to expose the bug in STAR 9000423090.
     // The test uses 3 masters, accessing slave 1. Slave 1 has fair among
     // equals arbiters in the read and write address channels.
     // Masters 1 and 2 should have the same external priority, while
     // master 3 should have a higher external priority.
     // To replay the bug we need the following stimulus.
     // 1.  Both M1 and M2 make a send a non locked read t/x to S1.
     // 2.  M1 wins arbitration first.
     // 3.  M2 wins arbitration for 2nd t/x to S1.
     // 4.  While waiting for arready_s1 to assert for the M2 S1 t/x,
     //     a read request from M3 to S1 arrives.
     //     Because of the bug, when arready_s1 asserts, the arbiters
     //     internal priority for M2 does not reset (because M3 owns the
     //     grant).
     // 4.1 At this time also, AW S1 is busy with a write t/x from M3.
     // 5.  While S1 is busy on both AW and AR channels with t/x's from M3,
     //     both M1 and M2 send a locked t/x to S1.
     // 6.  Now if M3's read and write address transfers to S1 complete on
     //     the same cycle, M1's lock t/x will be granted on S1 AW while M2's
     //     lock t/x will be granted on S1 AR. This occurs because M2 had
     //     higher priorty on S1 AR than S1 AW because his priority was not
     //     reset on S1 AR after the previous read t/x.
     //     Deadlock or a protocol error will occur from this point.
     //
     //
     //                                     ______________________
     //  awvalid_s3   ______________________|            
     //                                                ___
     //  awready_s3   _________________________________| |________
     //
     //  awid_s3                            X M3         X M1 (lock)
     //
     //                   _________________________________________
     //  arvalid_s3   ____| 
     //                        ___         ___         ___
     //  arready_s3   _________| |_________| |_________| |_________
     //
     //  arid_s3          X M1   X M2        X M3        X M2 (lock)
     //
     //                   ________                _________________
     //  req_m1       ____|      |________________|
     //                   ____________________    _________________
     //  req_m2       ____|                  |____|
     //                               ____________________
     //  req_m3       ________________|                  |_________
     //
     //  int_pr_m1    3   
     //
     //  int_pr_m2    3          X 2  
     //
     //  grant_ind        X m1   X m2 X m3               X m2   
     //
     //
     //
     //
     secure_access = 0;
     region = 0;
     slaveID = 1;
     if(  `AXI_HAS_LOCKING
        & (`AXI_NUM_MASTERS >= 3)
        & (visible_slaves[1][slaveID])
        & (visible_slaves[2][slaveID])
        & (visible_slaves[3][slaveID])
        & (`AXI_AR_ARB_TYPE_S1 == 2)
        & (`AXI_AW_ARB_TYPE_S1 == 2)
        & (axi_master_priority[1] == axi_master_priority[2])
        & (axi_master_priority[3] > axi_master_priority[2])
       ) 
     begin
       @(posedge aclk);
       @(posedge aclk);

       vm1 = 1;
       rd0_wr1 = 0;
       $display("\t %0t, Generating non locked READ t/x from master %0d to slave %0d", $time, vm1, slaveID);
       axi_mst_rand_xact(vm1, slaveID, region, rd0_wr1, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
       axi_master_add_to_pend(vm1, mst_buffer);
       axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm1_1);

       vm1 = 2;
       rd0_wr1 = 0;
       $display("\t %0t, Generating non locked READ t/x from master %0d to slave %0d", $time, vm1, slaveID);
       axi_mst_rand_xact(vm1, slaveID, region, rd0_wr1, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
       axi_master_add_to_pend(vm1, mst_buffer);
       axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm2_1);

       repeat (125) @(posedge aclk);
       vm1 = 3;
       rd0_wr1 = 0;
       $display("\t %0t, Generating non locked READ t/x from master %0d to slave %0d", $time, vm1, slaveID);
       axi_mst_rand_xact(vm1, slaveID, region, rd0_wr1, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer);
       axi_master_set_buffer_attr_bitvec(vm1, mst_buffer, `DW_VIP_AXI_ALEN, 0, 0);
       axi_master_set_buffer_attr_bitvec(vm1, mst_buffer, `DW_VIP_AXI_ABURST, 0, 1);
       axi_master_add_to_pend(vm1, mst_buffer);
       axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer, cmd_buffer_vm3_1);

       $display("\t %0t, Generating locked sequences from masters 1 and 2 to slave %0d", $time, slaveID);
    
       fork
         begin
           vm1 = 1;
           // Delay to start near M2 lock request.
           repeat (136) @(posedge aclk);
           // Lock 2, vis master 1.
           axi_mst_rand_xact(vm1, slaveID, region, rd0_wr1, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer1);
           axi_master_get_buffer_attr_bitvec(vm1, mst_buffer1, `DW_VIP_AXI_AID, 0, trans_aid1);
           axi_master_add_to_pend(vm1, mst_buffer1);
           axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer1, cmd_buffer_vm1_2);
   
           // Unlock 2, vis master 1.
           axi_mst_rand_xact(vm1, slaveID, region, rd0_wr1, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer1);
           axi_master_set_buffer_attr_bitvec(vm1, mst_buffer1, `DW_VIP_AXI_AID, 0, trans_aid1);
           axi_master_add_to_pend(vm1, mst_buffer1);
           axi_master_send_xact(vm1, `VMT_DEFAULT_STREAM_ID, mst_buffer1, cmd_buffer_vm1_2);
         end
  
         begin
           vm2 = 2;
           // Lock 1, vis master 2.
           axi_mst_rand_xact(vm2, slaveID, region, rd0_wr1, `SIM_LOCK, secure_access, `SIM_BURST_RND, mst_buffer2);
           axi_master_get_buffer_attr_bitvec(vm2, mst_buffer2, `DW_VIP_AXI_AID, 0, trans_aid2);
           axi_master_add_to_pend(vm2, mst_buffer2);
           axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer2, cmd_buffer_vm2_2);
  
           // Unlock 1, vis master 2.
           axi_mst_rand_xact(vm2, slaveID, region, rd0_wr1, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer2);
           axi_master_set_buffer_attr_bitvec(vm2, mst_buffer2, `DW_VIP_AXI_AID, 0, trans_aid2);
           axi_master_add_to_pend(vm2, mst_buffer2);
           axi_master_send_xact(vm2, `VMT_DEFAULT_STREAM_ID, mst_buffer2, cmd_buffer_vm2_2);
         end
         begin
           mybreak = 0;
           while(mybreak == 0) begin
             @(posedge aclk);
             if(U_DW_axi.arready_s1) mybreak <= 1;
           end
           rd0_wr1 = 1;
           vm3 = 3;
           $display("\t %0t, Generating non locked write t/x from master %0d to slave %0d", $time, vm3, slaveID);
           axi_mst_rand_xact(vm3, slaveID, region, rd0_wr1, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer3);
           axi_master_add_to_pend(vm3, mst_buffer3);
           axi_master_send_xact(vm3, `VMT_DEFAULT_STREAM_ID, mst_buffer3, cmd_buffer_vm3_1);
         end
       join
                 
     end // if(`AXI_HAS_LOCKING)

     repeat (10) @(posedge aclk);
       
     // Wait for bus to be idle for IDLE_CLKS_MAX number of cycles before
     // continuing with the next test.
     idle_count = 0; 
     while(idle_count < `IDLE_CLKS_MAX) begin
       @(posedge aclk);
       if(  !(arvalid_m_bus | awvalid_m_bus | rvalid_m_bus | wvalid_m_bus | bvalid_m_bus)
          & !(arvalid_s_bus | awvalid_s_bus | rvalid_s_bus | wvalid_s_bus | bvalid_s_bus)) begin
         idle_count = idle_count + 1;
         if(test_debug) $display("\t %0t test_sys_rw : WAIT IDLE, idle_count %0d", $time, idle_count);
       end else begin
         idle_count = 0;
       end
     end

  end
endtask

//----------------------------------------------------------------------------------------------------------------
// jstokes, 19/10/10
//
// TEST OVERLAPPING SLAVE ADDRESSES
// - Overlapping slave addresses are supported when the overlapping slaves
//   are not visible to any of the same masters.
// - This test finds all overlapping slave regions and sends t/x's to them
//   in parallel from 2 different masters. A check is performed that the
//   right slave reaches the right mastser.
//
// 
task test_ovrlp_slv_addr;
   integer secure_access;
   integer idle_count;
   integer slaveID;
   integer buffer_tmp;
   integer event_trigger;

   integer slv1, slv2;
   integer reg_s1, reg_s2;
   integer ol_slv1, ol_slv2;
   integer reg_ol_slv1, reg_ol_slv2;
   integer mst;
   integer mst_ol_slv1, mst_ol_slv2;

   `define OL_SLVS_ARR_SZ 500
   `define LOG2_MAX_NUM_REG 3

   reg [`AXI_LOG2_NSP1-1:0] ol_slvs_arr1 [`OL_SLVS_ARR_SZ-1:0];
   reg [`AXI_LOG2_NSP1-1:0] ol_slvs_arr2 [`OL_SLVS_ARR_SZ-1:0];
   reg [`LOG2_MAX_NUM_REG-1:0] ol_slvs_reg_arr1 [`OL_SLVS_ARR_SZ-1:0];
   reg [`LOG2_MAX_NUM_REG-1:0] ol_slvs_reg_arr2 [`OL_SLVS_ARR_SZ-1:0];

   reg [`AXI_NUM_SLAVES-1:0] slv_ovrlp_det_bus;

   integer num_overlaps;
   integer overlap_index;
   
   integer rd0_wr1;

   integer mst_buffer1, wp_m1;
   integer mst_buffer2, wp_m2;
   integer cmd_buffer_m1;
   integer cmd_buffer_m2;

   reg tx_acc1, tx_acc2;
   integer grant_mst;

   integer prev_test_debug;

   `define IDLE_CLKS_MAX 100

   `define MAX_RVALID_WAIT 5
   
begin
#0;
     repeat (20) @(posedge aclk);
     
     $display("\n\t------------------------------------------------------------");
     $display("\t Legally Overlapping Slave Address Test");
     $display("\t------------------------------------------------------------\n");

     // Setup slave response buffers. Do not want to randomise ready low
     // times here.
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1 ) begin
       axi_slave_new_buffer(slaveID, buffer_tmp);

       // No awready delays.
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AVALID_AREADY_DELAY, 0, 0);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_AREADY_DELAY, 0, 0);

       // No wready delays
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_WVALID_WREADY_DELAY, 0, 0);
       axi_slave_set_buffer_attr_int(slaveID, buffer_tmp, `DW_VIP_AXI_RESP_WREADY_DELAY, 0, 0);

       axi_slave_add_to_match_list(slaveID, buffer_tmp, 0);
     end



     // Collect information on overlapping slave regions.
     num_overlaps = 0;
     slv_ovrlp_det_bus = {`AXI_NUM_SLAVES{1'b0}};

     // For each slave
     for(slv1 = 1; slv1 <= `AXI_NUM_SLAVES; slv1 = slv1 + 1 ) begin

       // For each region
       for(reg_s1 = 0; reg_s1 <= (slv_num_regions[slv1]-1); reg_s1 = reg_s1 + 1 ) begin

         if(test_debug) begin
           $display("\t%0d - test_ovrlp_slv_addr - SLV1 - slv_region_start_array[%0d][%0d] = %0h, slv_num_regions[%0d] = %0d"
				            , $time, slv1, reg_s1, slv_region_start_array[slv1][reg_s1], slv1, slv_num_regions[slv1]);
           $display("\t%0d - test_ovrlp_slv_addr - SLV1 - slv_region_end_array[%0d][%0d] = %0h, slv_num_regions[%0d] = %0d"
				            , $time, slv1, reg_s1, slv_region_end_array[slv1][reg_s1], slv1, slv_num_regions[slv1]);
				 end

         // Search all other slave ...
         for(slv2 = 1; slv2 <= `AXI_NUM_SLAVES; slv2 = slv2 + 1 ) begin

           // ... regions
           for(reg_s2 = 0; reg_s2 <= (slv_num_regions[slv2]-1); reg_s2 = reg_s2 + 1 ) begin

             if(test_debug) begin
               $display("\t%0d - test_ovrlp_slv_addr - SLV2 - slv_region_start_array[%0d][%0d] = %0h, slv_num_regions[%0d] = %0d"
				                , $time, slv2, reg_s2, slv_region_start_array[slv2][reg_s2], slv2, slv_num_regions[slv2]);
               $display("\t%0d - test_ovrlp_slv_addr - SLV2 - slv_region_end_array[%0d][%0d] = %0h, slv_num_regions[%0d] = %0d"
				                , $time, slv2, reg_s2, slv_region_end_array[slv2][reg_s2], slv2, slv_num_regions[slv2]);
						 end

             // To see if they overlap.
             if (  (  (  (slv_region_start_array[slv2][reg_s2] >= slv_region_start_array[slv1][reg_s1])
                       & (slv_region_start_array[slv2][reg_s2] <= slv_region_end_array[slv1][reg_s1])
                      )
                    | (  (slv_region_end_array[slv2][reg_s2] >= slv_region_start_array[slv1][reg_s1])
                       & (slv_region_end_array[slv2][reg_s2] <= slv_region_end_array[slv1][reg_s1])
                      )
                   )
                   // Avoid detecting overlap with slaves own addresses.
                 & (slv1 != slv2)
                   // Don't record this overlap if overlaps of both these
                   // slaves have been detected already.
                 & (~slv_ovrlp_det_bus[slv1] | ~slv_ovrlp_det_bus[slv2])

								   // Need to know that both slaves are visible to at least
									 // 1 master in the active address mode.
								 & ~((nv_by_m[slv1]==0) & remap_n)
								 & ~((nv_by_m[slv2]==0) & remap_n)
								 & ~((bv_by_m[slv1]==0) & ~remap_n)
								 & ~((bv_by_m[slv2]==0) & ~remap_n)
                ) 
             begin
               ol_slvs_arr1[num_overlaps] = slv1;
               ol_slvs_arr2[num_overlaps] = slv2;
               ol_slvs_reg_arr1[num_overlaps] = reg_s1;
               ol_slvs_reg_arr2[num_overlaps] = reg_s2;
               slv_ovrlp_det_bus[slv1] = 1;
               slv_ovrlp_det_bus[slv2] = 1;

               num_overlaps = num_overlaps + 1;
               $display("\t%0d - test_ovrlp_slv_addr - Overlap Detected, num_overlaps %0d", $time, num_overlaps);

               if(test_debug) begin
                 $display("\t%0d - test_ovrlp_slv_addr - s %0d r %0d, sa = %0h, ea = %0h "
                          , $time, ol_slvs_arr1[num_overlaps-1], ol_slvs_reg_arr1[num_overlaps-1]
                          , slv_region_start_array[slv1][reg_s1], slv_region_end_array[slv1][reg_s1]);
                 $display("\t%0d - test_ovrlp_slv_addr - s %0d r %0d, sa = %0h, ea = %0h "
                          , $time, ol_slvs_arr2[num_overlaps-1], ol_slvs_reg_arr2[num_overlaps-1]
                          , slv_region_start_array[slv2][reg_s2], slv_region_end_array[slv2][reg_s2]);
               end
               $display("\n");
             end // check overlap
           end // for(reg_s2 = 1;

         end // for(slv2 = 1;

       end // for(reg_s1 = 1;

     end //  for(slv1 = 1;


     // Execute parallel transfers from all overlapping slave regions, to
     // any visible masters.
     secure_access = 0;

     // Enable debug messages during this test.
     prev_test_debug = test_debug;
     test_debug = 1;

     for(rd0_wr1=0 ; rd0_wr1<=1 ; rd0_wr1=rd0_wr1+1) begin
       for(overlap_index=0 ; overlap_index<num_overlaps ; overlap_index=overlap_index+1) begin

         if(rd0_wr1) $display("\t%0d - test_ovrlp_slv_addr - WRITE T/X's", $time);
         else        $display("\t%0d - test_ovrlp_slv_addr - READ T/X's", $time);
         $display("\t%0d - test_ovrlp_slv_addr - Target Overlap %0d", $time, overlap_index);
         $display("\n");

         // Extract the overlapping slave details from the arrays.
         ol_slv1     = ol_slvs_arr1[overlap_index];
         reg_ol_slv1 = ol_slvs_reg_arr1[overlap_index];
         ol_slv2     = ol_slvs_arr2[overlap_index];
         reg_ol_slv2 = ol_slvs_reg_arr2[overlap_index];

         // Find any master visible to each overlapping slave.
         for(mst=1;mst<= `AXI_NUM_MASTERS;mst=mst+1) begin
           if(visible_slaves[mst][ol_slv1]) mst_ol_slv1 = mst;
           if(visible_slaves[mst][ol_slv2]) mst_ol_slv2 = mst;
         end // for(mst=1;
  
         $display("\t%0d - test_ovrlp_slv_addr - send t/x from m %0d to s %0d", $time, mst_ol_slv1, ol_slv1);
         $display("\t%0d - test_ovrlp_slv_addr - in parallel with a t/x from m %0d to s %0d", $time, mst_ol_slv2, ol_slv2);
         $display("\n");

         fork
           begin
             // Generate tx completion watchpoint.
             axi_master_create_watchpoint(mst_ol_slv1, `VMT_MESSAGE_ID, `AXI_MSGID_MASTER_SEND_XACT_COMPLETE, wp_m1);
             axi_master_set_watchpoint_trigger(mst_ol_slv1, `VMT_DEFAULT_STREAM_ID, wp_m1, `VMT_WP_TRIGGER_PARAM, `VMT_WP_TRIGGER_HANDSHAKE);

             // Generate and send the tx.
             axi_mst_rand_xact(mst_ol_slv1, ol_slv1, reg_ol_slv1, rd0_wr1, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer1);
             axi_master_add_to_pend(mst_ol_slv1, mst_buffer1);
             axi_master_send_xact(mst_ol_slv1, `VMT_DEFAULT_STREAM_ID, mst_buffer1, cmd_buffer_m1);

             $display("\n");
             $display("\t%0d - test_ovrlp_slv_addr - wait for address h/s @ slv %0d", $time, ol_slv1);

             // Wait until a valid ready handshake has occured at the
             // target slave.
             tx_acc1 = 0;
             while(~tx_acc1) begin
               @(posedge aclk);
               tx_acc1 = rd0_wr1
                         ? (awvalid_s_bus[ol_slv1-1] & awready_s_bus[ol_slv1-1])
                         : (arvalid_s_bus[ol_slv1-1] & arready_s_bus[ol_slv1-1]);
             end

             // Capture granted master from upper ID bits.
             grant_mst = get_mstnum_from_id(ol_slv1, ~rd0_wr1) + 1;

             // Check that the t/x from the expected master reaches the
             // target slave.
             $display("\t%0d - test_ovrlp_slv_addr - grant_mst %0d, mst_ol_slv1 %0d", $time, grant_mst, mst_ol_slv1);
             if(grant_mst != mst_ol_slv1) begin
               $display("\t%0d - test_ovrlp_slv_addr - ERROR, Master %0d accessed Slave %0d", $time, grant_mst, ol_slv1);
               $display("\t%0d - test_ovrlp_slv_addr -        expected Master %0d.", $time, mst_ol_slv1);
             end

             // Wait for and then destroy the watch point.
             axi_master_watch_for(mst_ol_slv1, wp_m1, event_trigger);
             axi_master_destroy_watchpoint(mst_ol_slv1, `VMT_DEFAULT_STREAM_ID, wp_m1);
           end
           begin
             // Generate tx completion watchpoint.
             axi_master_create_watchpoint(mst_ol_slv2, `VMT_MESSAGE_ID, `AXI_MSGID_MASTER_SEND_XACT_COMPLETE, wp_m2);
             axi_master_set_watchpoint_trigger(mst_ol_slv2, `VMT_DEFAULT_STREAM_ID, wp_m2, `VMT_WP_TRIGGER_PARAM, `VMT_WP_TRIGGER_HANDSHAKE);

             // Generate and send the tx.
             axi_mst_rand_xact(mst_ol_slv2, ol_slv2, reg_ol_slv2, rd0_wr1, `SIM_UNLOCK, secure_access, `SIM_BURST_RND, mst_buffer2);
             axi_master_add_to_pend(mst_ol_slv2, mst_buffer2);
             axi_master_send_xact(mst_ol_slv2, `VMT_DEFAULT_STREAM_ID, mst_buffer2, cmd_buffer_m2);

             $display("\n");
             $display("\t%0d - test_ovrlp_slv_addr - wait for address h/s @ slv %0d", $time, ol_slv2);

             // Wait until a valid ready handshake has occured at the
             // target slave.
             tx_acc1 = 0;
             while(~tx_acc1) begin
               @(posedge aclk);
               tx_acc1 = rd0_wr1
                         ? (awvalid_s_bus[ol_slv2-1] & awready_s_bus[ol_slv2-1])
                         : (arvalid_s_bus[ol_slv2-1] & arready_s_bus[ol_slv2-1]);
             end

             // Capture granted master from upper ID bits.
             grant_mst = get_mstnum_from_id(ol_slv2, ~rd0_wr1) + 1;

             // Check that the t/x from the expected master reaches the
             // target slave.
             $display("\t%0d - test_ovrlp_slv_addr - grant_mst %0d, mst_ol_slv2 %0d", $time, grant_mst, mst_ol_slv2);
             if(grant_mst != mst_ol_slv2) begin
               $display("\t%0d - test_ovrlp_slv_addr - ERROR, Master %0d accessed Slave %0d", $time, grant_mst, ol_slv2);
               $display("\t%0d - test_ovrlp_slv_addr -        expected Master %0d.", $time, mst_ol_slv2);
             end

             // Wait for and then destroy the watch point.
             axi_master_watch_for(mst_ol_slv2, wp_m2, event_trigger);
             axi_master_destroy_watchpoint(mst_ol_slv2, `VMT_DEFAULT_STREAM_ID, wp_m2);
           end
         join 

         $display("\n");
         $display("\t%0d - test_ovrlp_slv_addr - tx's completed.", $time);
         $display("\n");
         
       end // for(overlap_index=0
     end // if(rd0_wr1=0;
           
     // Reset test_debug to value used prior to this test.
     test_debug = prev_test_debug;
       
     // Wait for bus to be idle for IDLE_CLKS_MAX number of cycles before
     // continuing with the next test.
     repeat (10) @(posedge aclk);
     idle_count = 0; 
     while(idle_count < `IDLE_CLKS_MAX) begin
       @(posedge aclk);
       if(  !(arvalid_m_bus | awvalid_m_bus | rvalid_m_bus | wvalid_m_bus | bvalid_m_bus)
          & !(arvalid_s_bus | awvalid_s_bus | rvalid_s_bus | wvalid_s_bus | bvalid_s_bus)) begin
         idle_count = idle_count + 1;
         if(test_debug) $display("\t %0t test_sys_rw : WAIT IDLE, idle_count %0d", $time, idle_count);
       end else begin
         idle_count = 0;
       end
     end
     
     $display("\ttest_ovrlp_slv_addr : Test Complete");
   end
endtask
