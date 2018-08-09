//dwh/DW_ocb/DW_axi/main/sim_vte/testbench/tb_axi_mon_xact.v#11 - edit change 778226 (text)
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

task axi_mon_xact;

  reg [31:0] wp_xact_cycle, wp_xact_trans, wp_xact_event, wp_xact_normal, wp_xact_proto_error;
  reg [31:0] wp_xact_perr, wp_xact_error, wp_xact_warn, wp_xact_fail, wp_xact;
  reg [31:0] wp_data_handle, wp_data_handle_next;
  reg [31:0] wp_fail_handle, coverage_wdata_before_addr;
  reg [31:0] xact_fail_trigger, xact_event_trigger,xact_event_type;
  reg [`SIM_XACT_BUFF-1:0] mst_xact_buff_tmp;
  reg [31:0] buffer_handle_index;
  reg [`SIM_XACT_BUFF-1:0] mst_pend;
  reg [71:0] port_string;
  reg [71:0] write_string;
  reg [71:0] temp_string;
  reg [71:0] temp_string_1;
  reg [31:0] rd_buffer_removal[`AXI_NUM_MASTERS:0];
  reg [31:0] wr_buffer_removal[`AXI_NUM_MASTERS:0];
  reg [31:0] mst_rd_curr_xact[`AXI_NUM_MASTERS:0];
  reg [63:0] slv_wr_curr_xact[`AXI_NUM_SLAVES:0];
  reg [63:0] slv_rd_curr_xact[`AXI_NUM_SLAVES:0];
  reg [17:0] alen, aid, tmp_aid;
  reg [638:0] resp;
  reg [63:0] addr, tmp_addr;
  reg last;
  reg [31:0] slv_num, mst_num;
  reg [31:0] port_num;
  reg [31:0] xact_event_cmd_status;
  reg [31:0] xact_fail_cmd_status;
  reg [31:0] cmd_status;
  reg [31:0] slv, mst;
  reg [31:0] write;
  reg [31:0] fail_stream_id, error_stream_id, i, m, n, k;
  reg [31:0] xact_event_message_id, wp_error_message_id, wp_error_type, xact_message_type, wp_event_id, xact_stream_id, xact_error_id  ;
  reg [31:0] xact_fail_message_id, xact_fail_message_type, cmd_fail_status , cmd_error_status;
  reg [638:0] name;
  reg [31:0] buffer_index;
 begin
#0;
   for(i = 0; i<= `AXI_NUM_MASTERS; i = i + 1) begin
     mst_rd_curr_xact[i]='b0;
     rd_buffer_removal[i] = 0;
     wr_buffer_removal[i] = 0;
   end//for(i...
   for(i = 0; i<= `AXI_NUM_SLAVES; i = i + 1) begin
     slv_wr_curr_xact[i]='b0;
     slv_rd_curr_xact[i]='b0;
   end//for(i...

   axi_monitor.new_stream(`VMT_DEFAULT_CMD_CHANNEL, xact_stream_id);

   coverage_wdata_before_addr = 0;
   arb_error = 0;
   id_error = 0;
   sim_error = 0; 
   df_error = 0;
   fork
    begin
      while(sim_in_progress) begin
        if(sim_error || id_error || arb_error || df_error) begin
           repeat(1) @(posedge aclk);
           $display("ERROR: VTE Terminated Early \nERROR: Default Slave Errors: %0d, Arb Errors %0d, ID Errors: %0d, Protocol Errors: %0d ",df_error, arb_error , id_error, sim_error);
           $finish;
        end
        repeat(1) @(posedge aclk);
      end
      $display("WDATA before AWREADY Coverage bin: %0d ", coverage_wdata_before_addr);
    end
    begin
      // AXI Transaction watchpoint
      axi_monitor.create_watchpoint(`VMT_MESSAGE_TYPE, `VMT_MSG_ERROR, wp_xact_error);
      axi_monitor.create_watchpoint(`VMT_MESSAGE_TYPE, `VMT_MSG_PROTO_ERROR, wp_xact_proto_error);
      axi_monitor.create_watchpoint(`VMT_MESSAGE_TYPE, `VMT_MSG_WARNING, wp_xact_warn);
      axi_monitor.create_watchpoint(`VMT_MESSAGE_TYPE, `VMT_MSG_PROTO_CYCLE, wp_xact_cycle);
      axi_monitor.create_watchpoint(`VMT_MESSAGE_ID, `AXI_MSGID_XACT_START, wp_xact_trans);
      axi_monitor.combine_watchpoints(wp_xact_error, `VMT_WP_LOGIC_OR, wp_xact_proto_error, wp_xact_perr);
      axi_monitor.combine_watchpoints(wp_xact_perr, `VMT_WP_LOGIC_OR, wp_xact_warn, wp_xact_fail);
      axi_monitor.combine_watchpoints(wp_xact_trans, `VMT_WP_LOGIC_OR, wp_xact_cycle, wp_xact_normal);
      axi_monitor.combine_watchpoints(wp_xact_normal, `VMT_WP_LOGIC_OR, wp_xact_fail, wp_xact_event);
      axi_monitor.set_watchpoint_trigger(xact_stream_id , wp_xact_event, `VMT_WP_TRIGGER_PARAM, `VMT_WP_TRIGGER_HANDSHAKE);
     
      while(sim_in_progress)begin
        for(mst_num = 1; mst_num <= `AXI_NUM_SYS_MASTERS; mst_num = mst_num + 1)begin
          if(rd_buffer_removal[mst_num]) xact_buffer_queue_clean_up(mst_num, 0);
          if(wr_buffer_removal[mst_num]) xact_buffer_queue_clean_up(mst_num, 1);
          
          wr_buffer_removal[mst_num] = 0;
          rd_buffer_removal[mst_num] = 0;
        end

        axi_monitor.watch_for(wp_xact_event, xact_event_trigger);
        axi_monitor.get_watchpoint_data_int(xact_event_trigger, `VMT_WP_DATA_NEXT_EVENT, wp_data_handle_next, xact_event_cmd_status);
        while(wp_data_handle_next != -1) begin
          wp_data_handle = wp_data_handle_next;
          axi_monitor.get_watchpoint_data_int(wp_data_handle, `VMT_WP_DATA_NEXT_EVENT, wp_data_handle_next, xact_event_cmd_status); 
          axi_monitor.get_watchpoint_data_int(wp_data_handle, `VMT_WP_DATA_EVENT_ID,  xact_event_type, xact_event_cmd_status);
         
           if(xact_event_type == `VMT_MSG_ERROR || xact_event_type == `VMT_MSG_PROTO_ERROR || xact_event_type == `VMT_MSG_WARNING) begin
             axi_monitor.get_watchpoint_data_int(wp_data_handle, `VMT_MSG_EVENT_ARG_MSG_ID, xact_event_message_id, xact_event_cmd_status);
             
             if( xact_event_message_id == `AXI_MSGID_WR_INTRLV_ADDR_RANGE_OVERLAP || 
               `ifdef AXI_BICMD_SUPPORT
                 xact_event_message_id == `AXI_MSGID_ADDR_CONSISTENCY             ||
               `endif
                 xact_event_message_id == `AXI_MSGID_FAILED_XACCESS               ||
                 xact_event_message_id == `AXI_MSGID_DECERR_FROM_SLV              ||
                 xact_event_message_id == `AXI_MSGID_MISSING_SLVERR               ||
                 xact_event_message_id == `AXI_MSGID_INVALID_DECERR               ||
                 xact_event_message_id == `AXI_MSGID_LOCK_ACC_EXCEEDS_2_XACT      ||
                 xact_event_message_id == `AXI_MSGID_LOCK_ACC_OUSTANDING_XACT     ||
                 xact_event_message_id == `AXI_MSGID_LOCK_ACC_EXCEEDS_4K          ||
                 xact_event_message_id == `AXI_MSGID_WR_BLOCK_DANGER              ||
                 xact_event_message_id == `AXI_MSGID_RD_BLOCK_DANGER 
                 ) begin
             end
             else if (xact_event_message_id == `AXI_MSGID_LOCK_ACC_EARLY_TERM) begin
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_LOCK_ACC_EARLY_TERM_ARG_PORTID, 0, port_string, cmd_status);
               
               if(port_string != "S0")begin
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_LOCK_ACC_EARLY_TERM_ARG_AID1, 0, aid, cmd_status);
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_LOCK_ACC_EARLY_TERM_ARG_AID2, 0, tmp_aid, cmd_status);
                 axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_LOCK_ACC_EARLY_TERM_ARG_WRITE_OR_READ, 0, write_string, cmd_status);
                 axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_LOCK_ACC_EARLY_TERM_ARG_READ_OR_WRITE, 0, temp_string, cmd_status);
                 
                 $display("DesignWare Model PROTOCOL-ERROR from test_DW_axi.axi_monitor at %0d:", $time);
                 $display("\tLocked access %0s transaction %0h still in progress, but unlock %0s transaction %0h has already been initiated on %0s clearing the lock (AXI1.0:6.3).", write_string, aid, temp_string, tmp_aid, port_string);
                 sim_error = sim_error + 1;
               end
             end
             else if (xact_event_message_id == `AXI_MSGID_LOCK_RELEASE_XACT_NOT_COMPLETE) begin
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_LOCK_RELEASE_XACT_NOT_COMPLETE_ARG_PORTID, 0, port_string, cmd_status);
               
               if(port_string != "S0")begin
                 axi_monitor.get_watchpoint_data_vec_64(wp_data_handle, `AXI_MSGID_LOCK_RELEASE_XACT_NOT_COMPLETE_ARG_ADDR, 0, addr, cmd_status);
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_LOCK_RELEASE_XACT_NOT_COMPLETE_ARG_AID, 0, aid, cmd_status);
                 axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_LOCK_RELEASE_XACT_NOT_COMPLETE_ARG_WRITE_OR_READ, 0, write_string, cmd_status);
                 
                 $display("DesignWare Model PROTOCOL-ERROR from test_DW_axi.axi_monitor at %0d:", $time);
                 $display("\tFinal Unlocking transaction has not completed before tranaction %0s with Address %0h and AID %0h started on Port %0s.(AXI1.0:6.3)", write_string, addr, aid, port_string);
                 sim_error = sim_error + 1;
               end
             end
             else if (xact_event_message_id == `AXI_MSGID_LOCK_ACC_INTER) begin
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_LOCK_ACC_INTER_ARG_PORTID, 0, port_string, cmd_status);
               
               if(port_string != "S0")begin
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_LOCK_ACC_INTER_ARG_AID1, 0, aid, cmd_status);
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_LOCK_ACC_INTER_ARG_AID2, 0, tmp_aid, cmd_status);
                 
                 $display("DesignWare Model PROTOCOL-ERROR from test_DW_axi.axi_monitor at %0d:", $time);
                 $display("\tLocked access initiated on slave %0s for AID %0h, but new AID %0h has been sent to slave (AXI1.0:6.3).", port_string, aid, tmp_aid);
                 sim_error = sim_error + 1;
               end
             end
             else begin
               // jstokes, 24.02.2010, workaround for VIP STAR 9000376063.
               if(  (`AXI_NUM_MASTERS==1) 
                  & (xact_event_message_id == `AXI_MSGID_ADDR_ORDER_NOT_PRESERVED))
               begin
               end else begin
                 sim_error = sim_error + 1;
               end
             end
          end
          else if(xact_event_type == `VMT_MSG_PROTO_CYCLE || xact_event_type == `AXI_MSGID_XACT_START) begin
            axi_monitor.get_watchpoint_data_int(wp_data_handle, `VMT_MSG_EVENT_ARG_MSG_ID, xact_event_message_id, xact_event_cmd_status);
          
          case(xact_event_message_id)
            `AXI_MSGID_XACT_START: begin
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_XACT_START_ARG_SYSTEM_OR_PORTID, 0, port_string, cmd_status);
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_XACT_START_ARG_DIRECTION, 0, write_string, cmd_status);
               axi_mon_wp_start_string_convert(port_string, write_string, port_num, write, slv, mst);

               // Watchpoint triggered on Master port transaction
               if(mst) begin
                 mst_num = port_num + 1;
            
                 if(write)begin
                   // Copy Write Transaction buffer handle from pending buffer array
                   mst_pend = mst_wr_xact_buff[mst_num][mst_wr_pend_ptr[mst_num]];
              
                   // Change the xact buffer from SIM_ADDR_PENDING to SIM_ADDR_ACTIVE to indicate the controls signals have been place on the bus
                   // Increment the pending pointer to point to the location of the next xact buffer
                   mst_pend[33:32] = `SIM_ADDR_ACTIVE;
                   mst_wr_xact_buff[mst_num][mst_wr_pend_ptr[mst_num]] = mst_pend;
                   
                   mst_wr_pend_ptr[mst_num] = mst_wr_pend_ptr[mst_num] + 1;

                   if(test_debug)begin      
                     for(m = 0; m <= mst_wr_pend_ptr[mst_num] ; m = m + 1) begin
                       $display("DEBUG %0d - mst_wr_xact_buff[%0d][%0d] %0h"
                                , $time, mst_num, m, mst_wr_xact_buff[mst_num][m]);
                     end
                   end

                   if(test_debug)$display("\t%0d - Master %0d - Write XACT initiated (Buffer %0h)", $time, mst_num, mst_pend[31:0]);
              
                 end else begin
                   // Copy read Transaction buffer handle from pending buffer array
                   mst_pend = mst_rd_xact_buff[mst_num][mst_rd_pend_ptr[mst_num]];
              
                   // Change the xact buffer from SIM_ADDR_PENDING to SIM_ADDR_ACTIVE to indicate the controls signals have been place on the bus
                   // Increment the pending pointer to point to the location of the next xact buffer
                   mst_pend[33:32] = `SIM_ADDR_ACTIVE;
                   mst_rd_xact_buff[mst_num][mst_rd_pend_ptr[mst_num]] = mst_pend;
                   mst_rd_pend_ptr[mst_num] = mst_rd_pend_ptr[mst_num] + 1;

                   if(test_debug)$display("\t%0d - Master %0d - Read XACT initiated (Buffer %0h)", $time, mst_num, mst_pend[31:0]);

                end //if(write...
              end //if(mst...
            
            end //`AXI_MSGID_XACT_START
            
            `AXI_MSGID_ADDR_WRITE_PHASE: begin
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_ADDR_WRITE_PHASE_ARG_SYSTEM_OR_PORTID, 0, port_string, cmd_status);
               axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_ADDR_WRITE_PHASE_ARG_AID, 0, aid, cmd_status);
               axi_monitor.get_watchpoint_data_vec_64(wp_data_handle, `AXI_MSGID_ADDR_WRITE_PHASE_ARG_ADDR, 0, addr, cmd_status);
               axi_mon_wp_string_convert(port_string, port_num, slv, mst);

               // Watchpoint triggered on Slave port transaction
               if(slv) begin
                 if(`AXI_NUM_SYS_MASTERS > 1)
                   mst_num = aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] + 1;
                 else
                   mst_num = 1;

                 `ifdef AXI_BICMD_SUPPORT
                   mst_num = axi_pnum_for_snum[mst_num];
                 `endif

                 // Increase the count of active Slave VIP Write Transactions
                 slv_wr_xact_cnt[port_num] = slv_wr_xact_cnt[port_num] + 1;
                 
                 // Task returns the oldest write XACT buffer with `SIM_ADDR_HS_START tag and matching AID
                 // Re-tags XACT buffer with `SIM_ADDR_HS_COMPLETE to indicate the handshaking
                 // for the address channel is complete
                 get_mst_addr_xact_buffer(mst_num, 1, aid, 0, mst_xact_buff_tmp, buffer_handle_index); 

                 // Use address of the XACT to determine which slave is being targeted 
                 axi_mon_addr_lookup(addr, slv_num);

                 // Multi tile deadlock masking.
                 check_multitile_dlock_masking(mst_num, slv_num, mst_xact_buff_tmp
	                                       , buffer_handle_index, (mst_wr_pend_ptr[mst_num]-1),0);

		             // If, for a write, the burst response has returned for
		             // the t/x before the address was accepted at the slave
		             // then trash the buffer when the address is accepted at
		             // the slave port.
		             if(mst_xact_buff_tmp[`SIM_XACT_BUFF-1] == `SIM_BRESP_COMPLETE) begin
                   wr_buffer_removal[mst_num] = 1;
                   remove_mst_xact_buffer(mst_num, 1, 1, mst_xact_buff_tmp);
		             end
                 
                 // Slave Sideband checker
                 if(`AXI_HAS_AWSB && check_wsb == 1) 
                   check_slv_addr_sideband(port_num, 1);
                 
                 if(port_num == 0) check_slv_df(mst_num, 1, 1, mst_xact_buff_tmp);
                 
                 
                 if(test_debug)begin 
                   $display("\t%0d - Slave  %0d - AW Channel - XACT accepted (Master %0d, aid %0h, Buffer %0h) - SLV WR XACT count: %0d", 
                     $time, port_num, mst_num, aid, mst_xact_buff_tmp[31:0], slv_wr_xact_cnt[port_num]);
                 end
               end// if(slv...
 
               // Watchpoint triggered on Master port transaction
               if(mst) begin
                 mst_num = port_num  + 1;

                 // Latest active (previous pending) XACT will be the one accepted by the Master port
                 // Change tag to indicate that Address channel handshaking has started
                 if(test_debug)begin      
                   for(m = 0; m <= mst_wr_pend_ptr[mst_num] ; m = m + 1) begin
                     $display("DEBUG: %0d - mst_wr_xact_buff[%0d][%0d] %0h"
                              , $time, mst_num, m, mst_wr_xact_buff[mst_num][m]);
                   end
                   $display("DEBUG : %0d - mst_wr_xact_buff[%0d][%0d] %0h"
                            , $time, mst_num, (mst_wr_pend_ptr[mst_num] - 1)
                            , mst_wr_xact_buff[mst_num][mst_wr_pend_ptr[mst_num] - 1]);
                 end


                 mst_xact_buff_tmp = mst_wr_xact_buff[mst_num][mst_wr_pend_ptr[mst_num] - 1];

                 mst_xact_buff_tmp[33:32] = `SIM_ADDR_HS_START;
                 mst_wr_xact_buff[mst_num][mst_wr_pend_ptr[mst_num] - 1] = mst_xact_buff_tmp;

                 // Use address of the XACT to determine which slave is being targeted 
                 axi_mon_addr_lookup(addr, slv_num);
             
                 // Master ID checker
                 check_mst_id(mst_num, slv_num, 1, mst_wr_pend_ptr[mst_num] - 1, aid);

               
                 if(test_debug)begin
                   $display("\t%0d - Master %0d - AW Channel - XACT accepted (Slave %0d, aid %0h, Buffer %0h) - MST WR XACT count: %0d", 
                      $time, mst_num, slv_num, aid, mst_xact_buff_tmp[31:0], mst_wr_pend_ptr[mst_num]);
                 end      
               end // if(mst_aw...
             end//`AXI_MSGID_ADDR_WRITE_PHASE
            
            `AXI_MSGID_ADDR_READ_PHASE: begin
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_ADDR_READ_PHASE_ARG_SYSTEM_OR_PORTID, 0, port_string, cmd_status);
               axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_ADDR_READ_PHASE_ARG_AID, 0, aid, cmd_status);
               axi_monitor.get_watchpoint_data_vec_64(wp_data_handle, `AXI_MSGID_ADDR_WRITE_PHASE_ARG_ADDR, 0, addr, cmd_status);
               axi_mon_wp_string_convert(port_string, port_num, slv, mst);
               
               // Watchpoint triggered on Slave port transaction
               if(slv) begin

		 if(`AXI_NUM_SYS_MASTERS > 1)
                   mst_num = aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] + 1;
		 else
                   mst_num = 1;

                 `ifdef AXI_BICMD_SUPPORT
                   mst_num = axi_pnum_for_snum[mst_num];
                 `endif

                 // Task returns the oldest read XACT buffer with `SIM_ADDR_HS_START 
		             // tag and matching AID Re-tags XACT buffer with `SIM_ADDR_HS_COMPLETE 
		             // to indicate the handshaking for the address channel is complete
                 get_mst_addr_xact_buffer(mst_num, 0, aid, 0, mst_xact_buff_tmp, buffer_handle_index); 
                 
                 // Increase the count of active Slave VIP Read Transactions
                 slv_rd_xact_cnt[port_num] = slv_rd_xact_cnt[port_num] + 1;

                 // Slave Sideband checker
                 if(`AXI_HAS_ARSB && check_rsb == 1) 
                   check_slv_addr_sideband(port_num, 0);
                 
                 // Slave ID checker
                 check_slv_id(port_num, 0, slv_rd_xact_cnt[port_num], aid, mst_xact_buff_tmp[31:0]);

                 if(port_num == 0) check_slv_df(mst_num, 0, 1, mst_xact_buff_tmp);
                 
                 if(test_debug)begin
                   $display("\t%0d - Slave  %0d - AR Channel - XACT accepted (Master %0d, Buffer %0h) - SLV RD XACT count: %0d", 
                     $time, port_num, mst_num, mst_xact_buff_tmp[31:0], slv_rd_xact_cnt[port_num] );
                 end
               end// if(slv...
               
               // Watchpoint triggered on Master port transaction
               if(mst) begin
                 mst_num = port_num  + 1;
                 
                 // Latest active (previous pending) XACT will be the one accepted by the Master port
                 // Change tag to indicate that Address channel handshaking has started
                 mst_xact_buff_tmp = mst_rd_xact_buff[mst_num][mst_rd_pend_ptr[mst_num] - 1]; 
                 mst_xact_buff_tmp[33:32] = `SIM_ADDR_HS_START;
                 mst_rd_xact_buff[mst_num][mst_rd_pend_ptr[mst_num] - 1] = mst_xact_buff_tmp;

                 // Use address of the XACT to determine which slave is being targeted 
                 axi_mon_addr_lookup(addr, slv_num);

                 // Master ID checker
                 check_mst_id(mst_num, slv_num, 0, mst_rd_pend_ptr[mst_num] - 1, aid);
                 
                 if(test_debug)begin 
                   $display("\t%0d - Master %0d - AR Channel - XACT accepted (Slave %0d, Buffer %0h) - MST RD XACT count: %0d", 
                      $time, mst_num, slv_num, mst_xact_buff_tmp[31:0], mst_rd_pend_ptr[mst_num]);
                 end
               end // if(mst...
             end//`AXI_MSGID_ADDR_READ_PHASE
             
            `AXI_MSGID_WRITE_DATA_PHASE: begin
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_WRITE_DATA_PHASE_ARG_SYSTEM_OR_PORTID, 0, port_string, cmd_status);
               axi_mon_wp_string_convert(port_string, port_num, slv, mst);
               
               // Watchpoint triggers on Master port
               if(mst) begin
                 axi_monitor.get_watchpoint_data_bit(wp_data_handle, `AXI_MSGID_WRITE_DATA_PHASE_ARG_WLAST, last, cmd_status);
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_WRITE_DATA_PHASE_ARG_WID, 0, aid, cmd_status);
                 mst_num = port_num + 1;

                 // Returns the oldest write XACT buffer with aid and where the last beat hasn't been written on the master port
                 get_mst_data_xact_buffer(mst_num, 1, 0, aid, mst_xact_buff_tmp); 
                  
                 // If the start of a new data burst  
                 if(mst_xact_buff_tmp[35:34] == `SIM_DATA_PENDING)begin
                   // Sets Master xact buffer to indicate `SIM_DATA_FB_START if tag indicates `SIM_DATA_PENDING
                   set_mst_xact_buffer_fb(mst_num, 1, mst_xact_buff_tmp); 

                   // Sets local Master xact buffer to indicate `SIM_DATA_FB_START if tag indicates `SIM_DATA_PENDING
                   mst_xact_buff_tmp[35:34] = `SIM_DATA_FB_START;

                   if(test_debug)begin
                     axi_master_get_buffer_attr_bitvec(mst_num, mst_xact_buff_tmp[31:0], `DW_VIP_AXI_ADDR, 0, tmp_addr);
                     axi_mon_addr_lookup(tmp_addr, slv_num);
                       
                     $display("\t%0d - Master %0d - WR Channel - XACT First beat of burst (Slave %0d, Buffer %0h)", 
                       $time, mst_num, slv_num,  mst_xact_buff_tmp[31:0]);
                   end//if(test...
                 end// if(mst_xa...
                 
                 // If last beat of data burst NOTE: Can be last AND new data burst 
                 if(last)begin
                   if(test_debug)begin
                     axi_master_get_buffer_attr_bitvec(mst_num, mst_xact_buff_tmp[31:0], `DW_VIP_AXI_ADDR, 0, tmp_addr);
                     axi_mon_addr_lookup(tmp_addr, slv_num);
                    
                     // Sets Master xact buffer to indicate that the last beat has been written on the master port
                     set_mst_xact_buffer_lb(mst_num, 1, 0, mst_xact_buff_tmp); 
                       
                     $display("\t%0d - Master %0d - WR Channel - XACT data written (Slave %0d, aid %0h, Buffer %0h)", 
                       $time, mst_num, slv_num, aid, mst_xact_buff_tmp[31:0]);
                   end
                 end//if(last)...
               end //if(mst)...
               
               // Watchpoint triggers on Slave port
               if(slv) begin
                 axi_monitor.get_watchpoint_data_bit(wp_data_handle, `AXI_MSGID_WRITE_DATA_PHASE_ARG_WLAST, last, cmd_status);
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_WRITE_DATA_PHASE_ARG_WID, 0, aid, cmd_status);
                 
                 if(`AXI_NUM_SYS_MASTERS > 1)
                   mst_num = aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] + 1;
                 else
                   mst_num = 1;
                 
                 `ifdef AXI_BICMD_SUPPORT
                   mst_num = axi_pnum_for_snum[mst_num];
                 `endif
               
                 // Slave Sideband checker
                 if(`AXI_HAS_WSB && check_wsb == 1) 
                   check_slv_data_sideband(port_num);

                 // Returns the oldest write XACT buffer with aid and where the last beat hasn't been written on the slave port
                 get_mst_data_xact_buffer(mst_num, 1, 1, aid, mst_xact_buff_tmp); 
                 
                 // If the write XACT currently at the slave port is different to the previous write XACT
                 if(slv_wr_curr_xact[port_num] != {mst_num, mst_xact_buff_tmp[31:0]}) begin
                   slv_wr_curr_xact[port_num] = {mst_num, mst_xact_buff_tmp[31:0]};
                
                   // Default Slave Checker
                   if(port_num == 0) check_slv_df(mst_num, 1, 0, mst_xact_buff_tmp);

                   // Slave ID Checker
                   if(!last) check_slv_id(port_num, 1, 0, aid, mst_xact_buff_tmp[31:0]);
                   
                   if(mst_xact_buff_tmp[35:34] == `SIM_DATA_FB_START) begin
                     // Sets Master xact buffer to indicate `SIM_DATA_FB_COMPLETE if tag indicates `SIM_DATA_FB_START
                     clear_mst_xact_buffer_fb(mst_num, 1, mst_xact_buff_tmp); 
                  
                     k = 0;
                     if(mst_xact_buff_tmp[33:32] == `SIM_ADDR_ACTIVE || mst_xact_buff_tmp[33:32] == `SIM_ADDR_HS_START) begin
                       coverage_wdata_before_addr = coverage_wdata_before_addr + 1;
                       k = 1;
                     end
                    
                     // Sets local Master xact buffer to indicate first beat is complete
                     mst_xact_buff_tmp[35:34] = `SIM_DATA_FB_COMPLETE;

                     if(test_debug)begin
                       if(k == 0) begin
                         $display("\t%0d - Slave  %0d - WR Channel - XACT First beat written (Master %0d, Buffer %0h)", 
                           $time, port_num, mst_num, mst_xact_buff_tmp[31:0]);
                       end else begin
                         $display("\t%0d - Slave  %0d - WR Channel - XACT First beat written (Master %0d, Buffer %0h) - Prior to AWREADY - (%0d)", 
                           $time, port_num, mst_num, mst_xact_buff_tmp[31:0], coverage_wdata_before_addr);
                       end
                     end// if(test_debug..
                   end//if(mst_...
                 end//if(slv_wr...

                 if(last) begin
                   // Sets Master xact buffer to indicate that the last beat has been written on the slave port
                   set_mst_xact_buffer_lb(mst_num, 1, 1, mst_xact_buff_tmp); 

                   // Multi tile deadlock masking.
                   // Decrement outstanding non local write count.
                   axi_master_get_buffer_attr_bitvec(mst_num, mst_xact_buff_tmp[31:0], `DW_VIP_AXI_ADDR, 0, tmp_addr);
                   axi_mon_addr_lookup(tmp_addr, slv_num);
                   check_multitile_dlock_masking(mst_num, slv_num, mst_xact_buff_tmp, 0, 0, 1);

                 
                 end
               end//if(slv)..  

             end //`AXI_MSGID_WRITE_DATA_PHASE             

            `AXI_MSGID_READ_DATA_PHASE: begin
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_READ_DATA_PHASE_ARG_SYSTEM_OR_PORTID, 0, port_string, cmd_status);
               axi_mon_wp_string_convert(port_string, port_num, slv, mst);
               
               // Watchpoint triggers on Master port
               if(mst) begin
                 axi_monitor.get_watchpoint_data_bit(wp_data_handle, `AXI_MSGID_READ_DATA_PHASE_ARG_RLAST, last, cmd_status);
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_READ_DATA_PHASE_ARG_RID, 0, aid, cmd_status);
                 mst_num = port_num + 1;
                 
                 // Master Sideband checker
                 if(`AXI_HAS_RSB && check_rsb == 1) 
                   check_mst_sideband(mst_num, 1);
                 
                 // Gets the oldest read XACT buffer with aid and where the LAST beat hasn't been read on the master port
                 get_mst_data_xact_buffer(mst_num, 0, 0, aid, mst_xact_buff_tmp); 
                 
                 // Keeps track of the read XACT currently at the master port
                 if(mst_rd_curr_xact[mst_num] != mst_xact_buff_tmp[31:0]) begin
                   mst_rd_curr_xact[mst_num] = mst_xact_buff_tmp[31:0];
                 end
                 
                 // If last data burst
                 if(last) begin
                   axi_master_get_buffer_attr_bitvec(mst_num, mst_xact_buff_tmp[31:0], `DW_VIP_AXI_ADDR, 0, tmp_addr);
                   axi_mon_addr_lookup(tmp_addr, slv_num);
                   
                   // Sets Master read xact buffer to indicate last beat has been read on master port
                   set_mst_xact_buffer_lb(mst_num, 0, 0, mst_xact_buff_tmp); 
                   
                   // Sets local Master xact buffer to indicate last beat has been written
                   mst_xact_buff_tmp[36] = 1'b1;

                   // Marks the read XACT buffer for removal from the buffer tracker (Master Port Complete)
                   rd_buffer_removal[mst_num] = 1;
                   remove_mst_xact_buffer(mst_num, 0, 1, mst_xact_buff_tmp);
                     
                   if(test_debug)begin  
                     $display("\t%0d - Master %0d - RD Channel - XACT completed (Slave %0d, Buffer %0h) - MST RD XACT count: %0d", 
                       $time, mst_num, slv_num, mst_xact_buff_tmp[31:0], mst_rd_xact_cnt[mst_num]);
                   end
                 end//if(last..
               end// if(mst...
                 
               // Watchpoint triggers on Slave port
               if(slv) begin
                 axi_monitor.get_watchpoint_data_bit(wp_data_handle, `AXI_MSGID_READ_DATA_PHASE_ARG_RLAST, last, cmd_status);
                 axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_READ_DATA_PHASE_ARG_RID, 0, aid, cmd_status);
                 axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_READ_DATA_PHASE_ARG_RRESP, 0, resp, cmd_status);

                 if(`AXI_NUM_SYS_MASTERS > 1)
                   mst_num = aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] + 1;
                 else
                   mst_num = 1;
                
                 `ifdef AXI_BICMD_SUPPORT
                   mst_num = axi_pnum_for_snum[mst_num];
                 `endif

                 // Gets the oldest read XACT buffer with aid and where the LAST beat hasn't been read on the slave port
                 get_mst_data_xact_buffer(mst_num, 0, 1, aid, mst_xact_buff_tmp); 
                 
                 if(mst_xact_buff_tmp[35:34] == `SIM_DATA_PENDING) begin
                   // Sets Master read xact buffer to indicate `SIM_DATA_ACTIVE if tag indicates `SIM_DATA_PENDING
                   set_mst_xact_buffer_fb(mst_num, 0, mst_xact_buff_tmp); 

                   // Sets local Master read xact buffer to indicate `SIM_DATA_ACTIVE if tag indicates `SIM_DATA_PENDING
                   mst_xact_buff_tmp[35:34] = `SIM_DATA_ACTIVE;

                   if(test_debug) begin
                     $display("\t%0d - Slave  %0d - RD Channel - XACT initiated (Master %0d, Buffer %0h)", $time, port_num, mst_num, mst_xact_buff_tmp[31:0]);
                   end // if(test_de...  
                 end // if(mst_rd...
                 
                 // Default Slave Checker
                 if(port_num == 0) begin
                   check_slv_df(mst_num, 0, 0, mst_xact_buff_tmp);

                   // Check response of default Slave
                   if(resp != "DECERR") begin
                     $display("ERROR: %0d - DEFAULT SLAVE - (Master %0d, Buffer %0h) - Expected Response: DECERR - Received Response: %0s", 
                       $time, mst_num, mst_xact_buff_tmp[31:0], resp);
                     df_error = df_error + 1;
                   end
                 end
                   
                 // Slave ID checker (TZ and Visibility)
                 check_slv_id(port_num, 0, 0, aid, mst_xact_buff_tmp[31:0]);
                 
                 // If last data burst
                 if(last) begin
                   // Sets Master read xact buffer to indicate last beat has been read on slave port
                   set_mst_xact_buffer_lb(mst_num, 0, 1, mst_xact_buff_tmp); 
                   
                   // Sets local Master xact buffer to indicate last beat has been written
                   mst_xact_buff_tmp[37] = 1'b1;
                   
                   // Marks the read XACT buffer for removal from the buffer tracker (Slave Port Complete)
                   rd_buffer_removal[mst_num] = 1;
                   remove_mst_xact_buffer(mst_num, 0, 0, mst_xact_buff_tmp);
                   
                   slv_rd_xact_cnt[port_num] = slv_rd_xact_cnt[port_num] - 1;
                 end // if(last...  
               end// if(slv...
             end //`AXI_MSGID_READ_DATA_PHASE

            `AXI_MSGID_WRITE_RESPONSE_PHASE: begin 
               axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_WRITE_RESPONSE_PHASE_ARG_SYSTEM_OR_PORTID, 0, port_string, cmd_status);
               axi_monitor.get_watchpoint_data_vec_32(wp_data_handle, `AXI_MSGID_WRITE_RESPONSE_PHASE_ARG_BID, 0, aid, cmd_status);
               axi_mon_wp_string_convert(port_string, port_num, slv, mst);

               // Watchpoint triggers on Master port
               if(mst)begin
                 mst_num = port_num + 1;

                 // Master Sideband checker
                 if(`AXI_HAS_BSB && check_wsb == 1) 
                   check_mst_sideband(mst_num, 0);

                 // Get oldest write XACT buffer with aid
                 get_mst_resp_xact_buffer(mst_num, 1, aid, mst_xact_buff_tmp, buffer_index); 

                 // Determine the source Slave from the address
                 axi_master_get_buffer_attr_bitvec(mst_num, mst_xact_buff_tmp[31:0], `DW_VIP_AXI_ADDR, 0, tmp_addr);
                 axi_mon_addr_lookup(tmp_addr, slv_num);
                 
                 // Marks the write XACT buffer for removal from the 
		 // buffer tracker (Master Port Complete).
		 // Only remove the buffer if the address portion has
		 // completed, otherwise just mark that the bresp has
		 // completed and the buffer will be trashed when the
		 // address is accepted at the slave.
		 if(mst_xact_buff_tmp[33:32] == `SIM_ADDR_HS_COMPLETE) begin
       wr_buffer_removal[mst_num] = 1;
       remove_mst_xact_buffer(mst_num, 1, 1, mst_xact_buff_tmp);
		 end else begin
       mst_xact_buff_tmp[`SIM_XACT_BUFF-1] = `SIM_BRESP_COMPLETE;

       // jstokes, 31/3/2009
       // Since the hybrid layer pipeline was added, the assumption that
       // the previous pending address in the buffer queue is always the
       // one to complete handshaking at the slave is broken.
       // To work around this, the get_mst_resp_xact_buffer task now
       // passes back a buffer index value, which tells us exactly where
       // in the queue the completing t/x is, so we can reinsert it
       // in the queue at the right point after editing it.
       mst_wr_xact_buff[mst_num][buffer_index] = mst_xact_buff_tmp;
		 end

                 if(test_debug)begin      
                   $display("\t%0d - Master %0d - BR Channel - XACT completed (Slave %0d, Buffer %0h, aid `h%0h `d%0d)", 
                     $time, mst_num, slv_num, mst_xact_buff_tmp[31:0], aid, aid);
                 end
               end//if(mst...
              
              // Watchpoint triggers on Slave port
              if(slv)begin
                axi_monitor.get_watchpoint_data_string(wp_data_handle, `AXI_MSGID_WRITE_RESPONSE_PHASE_ARG_BRESP, 0, resp, cmd_status);
                if(`AXI_NUM_SYS_MASTERS > 1)
                  mst_num = aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] + 1;
                else
                  mst_num = 1;

                `ifdef AXI_BICMD_SUPPORT
                  mst_num = axi_pnum_for_snum[mst_num];
                `endif
                
                // Check the write response of the default slave
                if(port_num == 0) begin
                  if(resp != "DECERR") begin
                    $display("ERROR: %0d - DEFAULT SLAVE - (Master %0d, AID %0d) - Expected Response: DECERR - Received Response: %0s", 
                       $time, mst_num, aid, resp);
                    df_error = df_error + 1;
                   end
                end                   

                // Get oldest write XACT buffer with aid and whos response hasn't been sent yet.
                get_mst_resp_xact_buffer(mst_num, 0, aid, mst_xact_buff_tmp, buffer_index); 
 
                if(test_debug)begin      
                   $display("\t%0d - Slave  %0d - BR Channel - Response initiated (Master %0d, Buffer %0h)", 
                     $time, port_num, mst_num, mst_xact_buff_tmp[31:0]);
                end
                
                // Marks the write XACT buffer for removal from the buffer tracker (Slave Port Complete)
                wr_buffer_removal[mst_num] = 1;
                remove_mst_xact_buffer(mst_num, 1, 0, mst_xact_buff_tmp);
                
                slv_wr_xact_cnt[port_num] = slv_wr_xact_cnt[port_num] - 1;
              end//if(slv..
             end//`AXI_MSGID_WRITE_RESPONSE_PHASE 
           endcase
          end
         end//while(wp_data_handle...
       end //while
    end // begin   
  join
 end
endtask

task automatic set_mst_xact_buffer_fb; 
   input [31:0] masterID;
   input [31:0] write;
   input [`SIM_XACT_BUFF-1:0] buffer_handle;
  
   reg [`SIM_XACT_BUFF-1:0] buffer_handle_tmp;
   reg [31:0] n, m, active_xact, non_active_xact;
 begin
#0;
   if(write)begin 
     active_xact = mst_wr_xact_cnt[masterID];
   end else begin
     active_xact = mst_rd_xact_cnt[masterID];
   end
  
   // search from the oldest active transaction to the newest
   if(active_xact >= 0) begin
   for(n = 0; n <= active_xact; n = n + 1) begin        
     if(write)
       buffer_handle_tmp = mst_wr_xact_buff[masterID][n];
     else
       buffer_handle_tmp = mst_rd_xact_buff[masterID][n];
     
     // find location of xact buffer     
     if(buffer_handle == buffer_handle_tmp) begin
       if(write) begin
         buffer_handle_tmp[35:34] = `SIM_DATA_FB_START;
         mst_wr_xact_buff[masterID][n] = buffer_handle_tmp;
       end else begin
         buffer_handle_tmp[35:34] = `SIM_DATA_ACTIVE;
         mst_rd_xact_buff[masterID][n] = buffer_handle_tmp;
       end

       n = active_xact + 1;
     end//if(buffer_...
     else begin
       buffer_handle_tmp = 0;
     end
   end//for  
   end
   
   if(buffer_handle_tmp == 0) begin
     $display("ERROR: %0d - VTE XACT TRACKER - Can't find xact buffer to set first beat for Master %0d (%0h)", $time, masterID, buffer_handle[31:0]);
     $finish;
   end
 end
endtask

task automatic set_mst_xact_buffer_lb; 
   input [31:0] masterID;
   input [31:0] write;
   input [31:0] port;
   input [`SIM_XACT_BUFF-1:0] buffer_handle;
  
   reg [`SIM_XACT_BUFF-1:0] buffer_handle_tmp;
   reg [31:0] n, m, active_xact, non_active_xact;
 begin
#0;
   if(write)begin 
     active_xact = mst_wr_xact_cnt[masterID];
   end else begin
     active_xact = mst_rd_xact_cnt[masterID];
   end
  
   // search from the oldest active transaction to the newest
   if(active_xact >= 0) begin
   for(n = 0; n <= active_xact; n = n + 1) begin        
     if(write)
       buffer_handle_tmp = mst_wr_xact_buff[masterID][n];
     else
       buffer_handle_tmp = mst_rd_xact_buff[masterID][n];
     
     // find location of xact buffer     
     if(buffer_handle == buffer_handle_tmp) begin
       if(write) begin
         buffer_handle_tmp[36 + port] = 1'b1;
         mst_wr_xact_buff[masterID][n] = buffer_handle_tmp;
       end else begin
         buffer_handle_tmp[36 + port] = 1'b1;
         mst_rd_xact_buff[masterID][n] = buffer_handle_tmp;
       end

       n = active_xact + 1;
     end//if(buffer_...
     else begin
       buffer_handle_tmp = 0;
     end
   end//for  
   end
   
   if(buffer_handle_tmp == 0) begin
     $display("ERROR: %0d - VTE XACT TRACKER - Can't find xact buffer to set first beat for Master %0d (%0h)", $time, masterID, buffer_handle[31:0]);
     $finish;
   end
 end
endtask

task automatic clear_mst_xact_buffer_fb; 
   input [31:0] masterID;
   input [31:0] write;
   input [`SIM_XACT_BUFF-1:0] buffer_handle;
  
   reg [`SIM_XACT_BUFF-1:0] buffer_handle_tmp;
   reg [31:0] n, m, active_xact, non_active_xact;
 begin
#0;
   if(write)begin 
     active_xact = mst_wr_xact_cnt[masterID];
   end else begin
     active_xact = mst_rd_xact_cnt[masterID];
   end
  
   // search from the oldest active transaction to the newest
   if(active_xact >= 0) begin
   for(n = 0; n <= active_xact + 1; n = n + 1) begin        
     if(write)
       buffer_handle_tmp = mst_wr_xact_buff[masterID][n];
     else
       buffer_handle_tmp = mst_rd_xact_buff[masterID][n];
     
     // find location of xact buffer     
     if(buffer_handle == buffer_handle_tmp) begin
       if(write) begin
         buffer_handle_tmp[35:34] = `SIM_DATA_FB_COMPLETE;
         mst_wr_xact_buff[masterID][n] = buffer_handle_tmp;
       end else begin
         buffer_handle_tmp[35:34] = `SIM_DATA_ACTIVE;
         mst_rd_xact_buff[masterID][n] = buffer_handle_tmp;
       end

       n = active_xact + 2;
     end//if(buffer_...
     else begin
       buffer_handle_tmp = 0;
     end
   end//for  
   end

   if(buffer_handle_tmp == 0) begin
     $display("ERROR: %0d - VTE XACT TRACKER - Can't find xact buffer to clear first beat for Master %0d (%0h)", $time, masterID, buffer_handle[31:0]);
     $finish;
   end
 end
endtask

task automatic remove_mst_xact_buffer;
   input [31:0] masterID;
   input [31:0] write;
   input [31:0] port;
   input [`SIM_XACT_BUFF-1:0] buffer_handle;

   reg [`SIM_XACT_BUFF-1:0] buffer_handle_tmp;
   reg [31:0] n, m, active_xact, non_active_xact;
 begin
#0;
   if(write)begin 
     active_xact = mst_wr_xact_cnt[masterID];
   end else begin
     active_xact = mst_rd_xact_cnt[masterID];
   end
  
   // search from the oldest active transaction to the newest
   if(active_xact >= 0) begin
   for(n = 0; n <= active_xact; n = n + 1) begin        
     if(write)
       buffer_handle_tmp = mst_wr_xact_buff[masterID][n];
     else
       buffer_handle_tmp = mst_rd_xact_buff[masterID][n];

     // find location of xact buffer     
     if(buffer_handle == buffer_handle_tmp) begin
       if(port)
         buffer_handle_tmp[`SIM_XACT_BUFF-2] = 1;
       else
         buffer_handle_tmp[`SIM_XACT_BUFF-3] = 1;
       
       if(write) begin
         mst_wr_xact_buff[masterID][n] = buffer_handle_tmp;
       end else begin
         mst_rd_xact_buff[masterID][n] = buffer_handle_tmp;
       end

       n = active_xact + 1;
     end//if(buffer_...
     else begin
       buffer_handle_tmp = 0;
     end
   end//for  
   end
  
   if(buffer_handle_tmp == 0) begin
     $display("ERROR: %0d - VTE XACT TRACKER - Can't find xact buffer to mark for removal for Master %0d (%0h)", $time, masterID, buffer_handle[31:0]);
     $finish;
   end  
  end
endtask  

task automatic xact_buffer_queue_clean_up;
   input [31:0] masterID;
   input [31:0] write; 

   reg [`SIM_XACT_BUFF-1:0] buffer_handle_tmp;
   reg [31:0] n, m, active_xact, queued_xact;
 begin
#0;
   if(write)begin 
     queued_xact = mst_wr_xact_cnt[masterID];
     active_xact = mst_wr_pend_ptr[masterID];
   end else begin
     queued_xact = mst_rd_xact_cnt[masterID];
     active_xact = mst_rd_pend_ptr[masterID];
   end

   // search from the oldest active transaction to the newest
   if(active_xact >= 0 && queued_xact >= 0) begin
   for(n = 0; n <= active_xact; n = n + 1) begin        
     if(write)
       buffer_handle_tmp = mst_wr_xact_buff[masterID][n];
     else
       buffer_handle_tmp = mst_rd_xact_buff[masterID][n];
     
     // find location of xact buffer     
     if(buffer_handle_tmp[`SIM_XACT_BUFF-2:`SIM_XACT_BUFF-3] == 2'b11) begin
       if(write)begin 
         mst_wr_xact_cnt[masterID]  = mst_wr_xact_cnt[masterID] - 1;
         mst_wr_pend_ptr[masterID] = mst_wr_pend_ptr[masterID] - 1;

         if(test_debug) begin
           $display("DEBUG : %0d - decerement mst_wr_pend_ptr[%0d] %0d"
                    , $time, masterID, mst_wr_pend_ptr[masterID]);

           for(m = 0; m <= mst_wr_pend_ptr[masterID] ; m = m + 1) begin
             $display("DEBUG : %0d - mst_wr_xact_buff[%0d][%0d] %0h"
                      , $time, masterID, m, mst_wr_xact_buff[masterID][m]);
           end
         end
       end else begin
         mst_rd_xact_cnt[masterID]  = mst_rd_xact_cnt[masterID] - 1;
         mst_rd_pend_ptr[masterID] = mst_rd_pend_ptr[masterID] - 1;
       end

       
       // remove completed xact from the buffer queue and shift other xacts in queue down place
       for(m = n; m <= queued_xact; m = m + 1) begin
         if(write) 
           mst_wr_xact_buff[masterID][m] = mst_wr_xact_buff[masterID][m + 1]; 
         else
           mst_rd_xact_buff[masterID][m] = mst_rd_xact_buff[masterID][m + 1]; 
       end
       n = active_xact + 1;
     end//if(buffer_...
   end//for  
   end else begin  
     $display("ERROR: %0d - VTE XACT TRACKER - Can't find xact buffer to remove for Master %0d", $time, masterID);
     $finish;
   end
 end
endtask 

// Task returns the oldest read/write XACT buffer with `SIM_ADDR_HS_START tag and matching AID
// Re-tags XACT buffer with `SIM_ADDR_HS_COMPLETE to indicate the handshaking
// for the address channel is complete
task automatic get_mst_addr_xact_buffer;
   input [31:0] masterID;
   input [31:0] write;
   input [31:0] aid;
   input start;
   output [`SIM_XACT_BUFF-1:0] buffer_handle;
   output [31:0] buffer_handle_index;

   reg [`SIM_XACT_BUFF-1:0] buffer_handle_tmp;
   reg [31:0] n, cmp_aid, tmp_aid, active_xact;

   integer tx_window;
   integer tx_window_index;

 begin
#0;
   cmp_aid = aid[`AXI_MIDW-1:0];
  
 `ifdef AXI_BICMD_SUPPORT
   if(masterID <= `AXI_NUM_ICM)
     cmp_aid = aid;
 `endif
   
   buffer_handle_tmp = 0;
   if(write) 
     active_xact = mst_wr_pend_ptr[masterID] - 1;
   else
     active_xact = mst_rd_pend_ptr[masterID] - 1;

   // jstokes, 28/3/2009
   // After the hybrid architecture enhancement, which included a 
   // pipeline stage in the shared sink block, it is possible for 2
   // t/x's issued from a master port to appear in a different order
   // at slave ports than the order they were issued in.
   // The shared layer pipeline could accept a t/x (2 t/x's, fully reg
   // pipeline), and allow a master port to issue another t/x to a non
   // shared slave port, the later t/x's might appear before the first
   // 2. For this reason, when looking for an ID in the t/x list
   // to match with when an ID appears on the slave port, we will 
   // consider the 3 oldest ID's, rather than just the oldest.
   tx_window = 3;
   tx_window_index = 0;

   // Search from the oldest transaction to the latest for `SIM_ADDR_HS_START
   for(n = 0; n <= active_xact; n = n + 1) begin        
     if(write)
       buffer_handle_tmp = mst_wr_xact_buff[masterID][n];
     else
       buffer_handle_tmp = mst_rd_xact_buff[masterID][n];
     
     if(buffer_handle_tmp[33:32] == `SIM_ADDR_HS_START | (start==1)) begin
       axi_master_get_buffer_attr_bitvec(masterID, buffer_handle_tmp, `DW_VIP_AXI_AID, 0, tmp_aid);

       // Find location of XACT buffer with matching Slave Number and AID
       if(tmp_aid == cmp_aid) begin

         if(start == 0) begin
           buffer_handle_tmp[33:32] = `SIM_ADDR_HS_COMPLETE;
         
           if(write)
             mst_wr_xact_buff[masterID][n] = buffer_handle_tmp ;
           else
             mst_rd_xact_buff[masterID][n] = buffer_handle_tmp ;
         end

         if(start == 1) begin
           buffer_handle_tmp[33:32] = `SIM_ADDR_HS_START;
         end

         buffer_handle = buffer_handle_tmp;
         buffer_handle_index = n;
         n = active_xact + 1;
       end//if(tmp_...
       else if(tx_window_index == tx_window) begin
         $display("ERROR: %0d - VTE XACT TRACKER - Oldest XACT buffer (%0h) with SIM_ADDR_HS_START tag has AID of %0h instead of expected AID of %0h, masterID %0d, write %0d, tx_window_index %0d", $time, buffer_handle_tmp[31:0], tmp_aid, cmp_aid, masterID, write, tx_window_index);
         sim_error = sim_error + 1; 
       end else begin
         tx_window_index = tx_window_index + 1;
       end
     end else begin
       buffer_handle_tmp = 0;
     end
   end//for  
   
   if(buffer_handle_tmp == 0 || buffer_handle_tmp == 'bX) begin
     $display("ERROR: %0d - VTE XACT TRACKER - Can't find xact buffer for Master %0d with AID of %0d and tag SIM_ADDR_HS_START", $time, masterID, cmp_aid);
     sim_error = sim_error + 1; 
   end
 end
endtask 

task automatic get_mst_data_xact_buffer;
   input [31:0] masterID;
   input [31:0] write;
   input [31:0] port;
   input [31:0] aid;
   output [`SIM_XACT_BUFF-1:0] buffer_handle;

   reg [`SIM_XACT_BUFF-1:0] n, buffer_handle_tmp;
   reg [31:0] cmp_aid, tmp_aid, active_xact;
 begin
#0;
   buffer_handle_tmp = 0;
   cmp_aid = aid[`AXI_MIDW-1:0];
   
 `ifdef AXI_BICMD_SUPPORT
   if(masterID <= `AXI_NUM_ICM)
     cmp_aid = aid;
 `endif
   
   if(write) 
     active_xact = mst_wr_xact_cnt[masterID];
   else
     active_xact = mst_rd_xact_cnt[masterID];
   
   // Search from the oldest active transaction to the newest
   if(active_xact >= 0)
   for(n = 0; n <= active_xact; n = n + 1) begin        
     if(write)
       buffer_handle_tmp = mst_wr_xact_buff[masterID][n];
     else
       buffer_handle_tmp = mst_rd_xact_buff[masterID][n];

     if(buffer_handle_tmp != 0) axi_master_get_buffer_attr_bitvec(masterID, buffer_handle_tmp[31:0], `DW_VIP_AXI_AID, 0, tmp_aid);

     // Find location of XACT buffer with matching Slave Number and AID and where the last beat hasn't been written
     if(tmp_aid == cmp_aid && buffer_handle_tmp[36 + port] != 1'b1) begin
       buffer_handle =  buffer_handle_tmp;
       n = active_xact + 1;
     end//if(tmp_...
     else begin
       buffer_handle_tmp = 0;
     end
   end//for  

   if(buffer_handle_tmp == 0 || buffer_handle_tmp == 'bX) begin
     $display("ERROR: %0d - VTE XACT TRACKER - Can't find xact buffer for Master %0d with AID: %0d", $time, masterID, cmp_aid);
     $finish;
   end
 end
endtask 

task automatic get_mst_resp_xact_buffer;
   input [31:0] masterID;
   input [31:0] port;
   input [31:0] aid;
   output [`SIM_XACT_BUFF-1:0] buffer_handle;
   output [31:0] buffer_index;

   reg [`SIM_XACT_BUFF-1:0] n, buffer_handle_tmp, tmp_aid, active_xact;
   reg [31:0] cmp_aid;
 begin
#0;
   buffer_handle_tmp = 0;
   cmp_aid = aid[`AXI_MIDW-1:0];
  
 `ifdef AXI_BICMD_SUPPORT
   if(masterID <= `AXI_NUM_ICM)
     cmp_aid = aid;
 `endif

   active_xact = mst_wr_xact_cnt[masterID];
   
   // Search from the oldest active transaction to the newest
   if(active_xact >= 0)
   for(n = 0; n <= active_xact; n = n + 1) begin        
     buffer_handle_tmp = mst_wr_xact_buff[masterID][n];

     if(buffer_handle_tmp != 0) axi_master_get_buffer_attr_bitvec(masterID, buffer_handle_tmp[31:0], `DW_VIP_AXI_AID, 0, tmp_aid);

     // Find location of XACT buffer with matching Slave Number and AID and where the response hasn't been sent yet
     if(tmp_aid == cmp_aid && buffer_handle_tmp[`SIM_XACT_BUFF-3 + port] != 1'b1) begin
       buffer_handle =  buffer_handle_tmp;
       buffer_index = n;
       n = active_xact + 1;
     end//if(tmp_...
     else begin
       buffer_handle_tmp = 0;
     end
   end//for  

   if(buffer_handle_tmp == 0 || buffer_handle_tmp == 'bX) begin
     $display("ERROR: %0d - VTE XACT TRACKER - Can't find xact buffer for Master %0d with AID: %0d (resp_xact)", $time, masterID, cmp_aid);
     $finish;
   end
 end
endtask 

//--------------------------------------------------------------------------------------------
// Determines targeted Slave based on the Address
// ----------------------------------------------
task automatic axi_mon_addr_lookup;
   input  [`AXI_AW-1:0] slave_addr;
   output [31:0] slaveID;

   integer region_count;
   integer slave_count;
   
   reg [31:0] slaveID_tmp;

 begin
#0; 
   slaveID_tmp = 0;
   for(slave_count = 1; slave_count <= `AXI_NUM_SLAVES; slave_count = slave_count + 1) begin
     for(region_count = 0; region_count < slv_num_regions[slave_count]; region_count = region_count + 1) begin
        if(   slave_addr >= slv_region_start_array[slave_count][region_count] 
           && slave_addr <= slv_region_end_array[slave_count][region_count]
              // jstokes, 7.8.2010
              // Only match to slave addresses which are actually visible
              // to a master in this address mode. Prevents problems due to
              // matching with slaves whose default addresses happened to
              // match the address of another slave who is visible to
              // a master in the active address mode.
           &  ((nv_by_m[slave_count] & remap_n) | (bv_by_m[slave_count] & ~remap_n))
          ) begin
          slaveID_tmp = slave_count;
        end
     end
   end
 
   slaveID = slaveID_tmp;
 end   
endtask

task automatic axi_mon_wp_string_convert;
  input  [71:0] port_string;
  output [31:0] port_num;
  output [31:0] slv_active;
  output [31:0] mst_active;

begin
#0;
    case(port_string)
        "M0": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 0;
        end
        "M1": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 1;
        end
        "M2": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 2;
        end
        "M3": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 3;
        end
        "M4": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 4;
        end
        "M5": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 5;
        end
        "M6": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 6;
        end
        "M7": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 7;
        end
        "M8": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 8;
        end
        "M9": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 9;
        end
        "M10": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 10;
        end
        "M11": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 11;
        end
        "M12": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 12;
        end
        "M13": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 13;
        end
        "M14": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 14;
        end
        "M15": begin
        mst_active = 1;
        slv_active = 0;
        port_num = 15;
        end
        "S0": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 0;
        end
        "S1": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 1;
        end
        "S2": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 2;
        end
        "S3": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 3;
        end
        "S4": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 4;
        end
        "S5": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 5;
        end
        "S6": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 6;
        end
        "S7": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 7;
        end
        "S8": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 8;
        end
        "S9": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 9;
        end
        "S10": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 10;
        end
        "S11": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 11;
        end
        "S12": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 12;
        end
        "S13": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 13;
        end
        "S14": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 14;
        end
        "S15": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 15;
        end
        "S16": begin
        mst_active = 0;
        slv_active = 1;
        port_num = 16;
        end
        default: begin
        mst_active = 0;
        slv_active = 0;
        port_num = 0;
        end
  endcase   
end
endtask

task automatic axi_mon_wp_start_string_convert;
  input  [71:0] port_string;
  input  [71:0] write_string;
  output [31:0] port_num;
  output [31:0] write;
  output [31:0] slv_start;
  output [31:0] mst_start;

begin
#0;
    case(write_string)
     "write": write = 1;
      default : write = 0;
    endcase 
    
    case(port_string)
        "M0": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 0;
        end
        "M1": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 1;
        end
        "M2": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 2;
        end
        "M3": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 3;
        end
        "M4": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 4;
        end
        "M5": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 5;
        end
        "M6": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 6;
        end
        "M7": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 7;
        end
        "M8": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 8;
        end
        "M9": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 9;
        end
        "M10": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 10;
        end
        "M11": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 11;
        end
        "M12": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 12;
        end
        "M13": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 13;
        end
        "M14": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 14;
        end
        "M15": begin
        mst_start = 1;
        slv_start = 0;
        port_num = 15;
        end
        "S0": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 0;
        end
        "S1": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 1;
        end
        "S2": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 2;
        end
        "S3": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 3;
        end
        "S4": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 4;
        end
        "S5": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 5;
        end
        "S6": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 6;
        end
        "S7": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 7;
        end
        "S8": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 8;
        end
        "S9": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 9;
        end
        "S10": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 10;
        end
        "S11": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 11;
        end
        "S12": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 12;
        end
        "S13": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 13;
        end
        "S14": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 14;
        end
        "S15": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 15;
        end
        "S16": begin
        mst_start = 0;
        slv_start = 1;
        port_num = 16;
        end
        default: begin
        mst_start = 0;
        slv_start = 0;
        port_num = 0;
        end
  endcase   
end
endtask

task axi_check_nonvisible;
  input [31:0] enable;
  begin
#0;
    check_nv = enable;
  end
endtask

task axi_check_write_sidebands;
  input [31:0] enable;
  begin
#0;
    check_wsb = enable;
  end
endtask

task axi_check_read_sidebands;
  input [31:0] enable;
  begin
#0;
    check_rsb = enable;
  end
endtask


