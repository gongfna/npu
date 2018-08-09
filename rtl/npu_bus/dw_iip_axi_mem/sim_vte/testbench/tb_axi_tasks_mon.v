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

///////////////////////////////////////////////////////////////////////////////////////
//
// Tasks relating to the AXI Monitor VIP
//
///////////////////////////////////////////////////////////////////////////////////////

//--------------------------------------------------------------------------------------------
// Sets the coverage for the Monitor 
// --------------------------------------
task axi_mon_coverage;
  begin
#0;
     axi_monitor.enable_collect(`VMT_ALL_COV_INSTANCES, `VMT_ALL_COV_GROUPS);
    // axi_monitor.enable_collect(`VMT_ALL_COV_INSTANCES, `DW_VIP_AXI_CG_FLOW_WR_XACT);
     // Turn off error coverage bin
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_SYSTEM, `DW_VIP_AXI_CG_ERROR_MSGID);
     // Turn off invalid xact coverage bins
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M16, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M17, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M18, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M19, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M20, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M21, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M22, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M23, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M24, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M25, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M26, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M27, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M28, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M29, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M30, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_M31, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S17, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S18, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S19, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S20, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S21, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S22, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S23, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S24, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S25, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S26, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S27, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S28, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S29, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S30, `VMT_ALL_COV_GROUPS);
     axi_monitor.disable_collect(`DW_VIP_AXI_CI_S31, `VMT_ALL_COV_GROUPS);
     
  end
endtask

//--------------------------------------------------------------------------------------------
// Generates the AXI Monitor's Memory Map 
// --------------------------------------
//
// This task loads a memory map of all the Slave's address regions into the AXI Monitor VIP
// based on the unpacked design and the mode of operation (if `AXI_REMAP_EN is true)
//
// Remapping is handled by the arrays slv_region_start_array and slv_region_end_array.
// (When remap_n = 1 they will return one set of values and return another set when remap_n = 0 )
task axi_mon_memory_map;
  integer slv_count;
  integer region_count;
  reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] start_addr_lcl;
  reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] end_addr_lcl;
 begin
#0;
   for(slv_count = 1; slv_count <= `AXI_NUM_SLAVES; slv_count = slv_count + 1) begin
     for(region_count = 0; region_count < slv_num_regions[slv_count]; region_count = region_count + 1) begin
       start_addr_lcl = {`DW_VIP_AXI_ADDR_WIDTH_PARAM{1'b0}};
       end_addr_lcl = {`DW_VIP_AXI_ADDR_WIDTH_PARAM{1'b0}};
       
       start_addr_lcl[`AXI_AW-1:0] = slv_region_start_array[slv_count][region_count];
       end_addr_lcl[`AXI_AW-1:0]   = slv_region_end_array[slv_count][region_count];
       if(num_vis_mst[slv_count] > 0) axi_monitor.configure_memmap(slv_count, start_addr_lcl, end_addr_lcl);   
     end
   end
 end
endtask

//--------------------------------------------------------------------------------------------
// Wrapper task to simplify the setting of `DW_VIP_AXI_MASTER_*_WRITE_INTERLEAVE_DEPTH_PARAM
// -----------------------------------------------------------------------------
task axi_mon_master_port_wid;
   input [31:0] masterID;
   input [31:0] wid_depth;
begin
#0;
   case (masterID)
     1 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_0_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     2 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_1_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     3 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_2_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     4 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_3_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     5 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_4_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     6 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_5_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     7 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_6_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     8 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_7_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     9 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_8_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     10 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_9_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     11 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_10_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     12 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_11_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     13 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_12_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     14 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_13_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     15 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_14_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     16 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_15_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     default : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_0_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
   endcase
end
endtask
//--------------------------------------------------------------------------------------------
// Wrapper task to simplify the setting of `DW_VIP_AXI_SLAVE_*_WRITE_INTERLEAVE_DEPTH_PARAM
// -----------------------------------------------------------------------------
task axi_mon_slave_port_wid;
   input [31:0] slaveID;
   input [31:0] wid_depth;
begin
#0;
   case (slaveID)
     0 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_0_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     1 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_1_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     2 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_2_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     3 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_3_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     4 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_4_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     5 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_5_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     6 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_6_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     7 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_7_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     8 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_8_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     9 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_9_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     10 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_10_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     11 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_11_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     12 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_12_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     13 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_13_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     14 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_14_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     15 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_15_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     16 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_16_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
     default : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_0_WRITE_INTERLEAVE_DEPTH_PARAM, wid_depth);
   endcase
end
endtask

//--------------------------------------------------------------------------------------------
// Wrapper task to simplify the setting of `DW_VIP_AXI_SLAVE_*_NOTIFY_XACT_PARAM
// -----------------------------------------------------------------------------
task axi_mon_slave_port_notify;
   input [31:0] slaveID;
begin
#0;
   case (slaveID)
     0 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_0_NOTIFY_XACT_PARAM, 1);
     1 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_1_NOTIFY_XACT_PARAM, 1);
     2 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_2_NOTIFY_XACT_PARAM, 1);
     3 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_3_NOTIFY_XACT_PARAM, 1);
     4 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_4_NOTIFY_XACT_PARAM, 1);
     5 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_5_NOTIFY_XACT_PARAM, 1);
     6 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_6_NOTIFY_XACT_PARAM, 1);
     7 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_7_NOTIFY_XACT_PARAM, 1);
     8 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_8_NOTIFY_XACT_PARAM, 1);
     9 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_9_NOTIFY_XACT_PARAM, 1);
     10 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_10_NOTIFY_XACT_PARAM, 1);
     11 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_11_NOTIFY_XACT_PARAM, 1);
     12 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_12_NOTIFY_XACT_PARAM, 1);
     13 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_13_NOTIFY_XACT_PARAM, 1);
     14 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_14_NOTIFY_XACT_PARAM, 1);
     15 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_15_NOTIFY_XACT_PARAM, 1);
     16 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_16_NOTIFY_XACT_PARAM, 1);
     default : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_0_NOTIFY_XACT_PARAM, 1);
   endcase
end
endtask

//--------------------------------------------------------------------------------------------
// Wrapper task to simplify the setting of `DW_VIP_AXI_MASTER_*_NOTIFY_XACT_PARAM
// ------------------------------------------------------------------------------
//
// Note: Case statement goes from 1->16 while *_NOTIFY_XACT_PARAM goes from 0->15
//       This is due to the fact that Master 1 connects to port 0, Master 2 connects to port 1 etc.
task axi_mon_master_port_notify;
   input [31:0] masterID;
begin
#0;
   case (masterID)
     1 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_0_NOTIFY_XACT_PARAM, 1);
     2 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_1_NOTIFY_XACT_PARAM, 1);
     3 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_2_NOTIFY_XACT_PARAM, 1);
     4 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_3_NOTIFY_XACT_PARAM, 1);
     5 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_4_NOTIFY_XACT_PARAM, 1);
     6 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_5_NOTIFY_XACT_PARAM, 1);
     7 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_6_NOTIFY_XACT_PARAM, 1);
     8 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_7_NOTIFY_XACT_PARAM, 1);
     9 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_8_NOTIFY_XACT_PARAM, 1);
     10 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_9_NOTIFY_XACT_PARAM, 1);
     11 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_10_NOTIFY_XACT_PARAM, 1);
     12 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_11_NOTIFY_XACT_PARAM, 1);
     13 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_12_NOTIFY_XACT_PARAM, 1);
     14 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_13_NOTIFY_XACT_PARAM, 1);
     15 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_14_NOTIFY_XACT_PARAM, 1);
     16 : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_15_NOTIFY_XACT_PARAM, 1);
     default : axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_0_NOTIFY_XACT_PARAM, 1);
   endcase
end
endtask

//--------------------------------------------------------------------------------------------
// Configures the AXI Monitor 
// --------------------------
task axi_mon_configure;
  integer masterID;
  integer slaveID;
  integer logID;
 begin
#0;
   // Turns on all logging messages and hides warnings due to unused ports/upper bits   
   if(test_debug) begin
     axi_monitor.open_msg_log(`VMT_DEFAULT_STREAM_ID, "tb_axi_monitor.log", `VMT_MSG_LOG_MODE_OVR, logID);
   end
   axi_monitor.enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_LOG_DEFAULT, `VMT_MSG_ROUTE_ALL_LOGS);
   axi_monitor.enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_TRANS, `VMT_MSG_ROUTE_ALL_LOGS);
   axi_monitor.enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_ALL, `VMT_MSG_ROUTE_ALL_LOGS);
   
   axi_monitor.enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
   axi_monitor.enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_DEFAULT, `VMT_MSG_ROUTE_SIM);

   // jstokes, 24.02.2010, workaround for VIP STAR 9000376063.
   if(`AXI_NUM_MASTERS==1) begin
     axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_ADDR_ORDER_NOT_PRESERVED, `VMT_MSG_ROUTE_ALL);
   end
   
   
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_PHANTOM_MSTR_PORT, `VMT_MSG_ROUTE_ALL);
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_PHANTOM_SLV_PORT, `VMT_MSG_ROUTE_ALL);  
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_PHANTOM_BITS, `VMT_MSG_ROUTE_ALL);  
   
   // DUT doesn't check for address overlap during interleaving
  // axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_WR_INTRLV_ADDR_RANGE_OVERLAP, `VMT_MSG_ROUTE_ALL);  
  
   // Prevents false errors due to non-visibility (DECERR tracked in tb_axi_mon_xact.v)
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_DECERR_FROM_SLV, `VMT_MSG_ROUTE_ALL);  
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_MISSING_SLVERR, `VMT_MSG_ROUTE_ALL);  
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_INVALID_DECERR, `VMT_MSG_ROUTE_ALL);  

   // Prevents false errors due to DECERR or forced SLVERR resp
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_FAILED_XACCESS, `VMT_MSG_ROUTE_ALL);  
  
   // Supresses Warnings about potential deadlocks
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_RD_BLOCK_DANGER, `VMT_MSG_ROUTE_ALL);  
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_WR_BLOCK_DANGER, `VMT_MSG_ROUTE_ALL);  
   
   // Turn off warnings due to protocol "recommendations" for locking 
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_LOCK_ACC_EXCEEDS_4K, `VMT_MSG_ROUTE_ALL);
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_LOCK_ACC_EXCEEDS_2_XACT, `VMT_MSG_ROUTE_ALL);

   // Turn of locking message until the next version of the VIP (not enough info in message to filter it) 
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_LOCK_ACC_OUSTANDING_XACT, `VMT_MSG_ROUTE_ALL);  
   
   // Turns off the displaying of error message as DUT doesn't allow locking of default Slave
   // This error is checked and displayed in the tb_axi_mon_xact.v if valid
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_LOCK_ACC_INTER, `VMT_MSG_ROUTE_ALL);  
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_LOCK_RELEASE_XACT_NOT_COMPLETE, `VMT_MSG_ROUTE_ALL);  
   axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_LOCK_ACC_EARLY_TERM, `VMT_MSG_ROUTE_ALL);  
   
   // Disable AID checking on address channel when BICMD_SUPPORT is enabled 
   `ifdef AXI_BICMD_SUPPORT
     axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_ADDR_CONSISTENCY, `VMT_MSG_ROUTE_ALL);  
     // Turn off REPORT messages from the monitor that flood the log file in BI-DI mode.
     axi_monitor.disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_REPORT, `VMT_MSG_ROUTE_ALL);  
  `endif

   // Configures Monitor to use unpacked CC constant values
   axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
   axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
   if(`AXI_NUM_ICM > 0) begin
     // Disable warning about slv ID width being too small when Interconnecting Masters are used
     axi_monitor.disable_msg_id(`VMT_DEFAULT_STREAM_ID, `AXI_MSGID_IC_SLV_ID_WIDTH_TOO_SMALL, `VMT_MSG_ROUTE_ALL);  
     axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_ID_WIDTH_PARAM, `AXI_SIDW);
   end else begin
     axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_ID_WIDTH_PARAM, `AXI_MIDW);
   end
   axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_ID_WIDTH_PARAM, `AXI_SIDW);
   axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MASTER_COUNT_PARAM, `AXI_NUM_MASTERS); 
   axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
   
   //  `AXI_NUM_SLAVES + 1 -> Monitoring the default Slave as well
   axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_SLAVE_COUNT_PARAM, `AXI_NUM_SLAVES + 1);
   
   // Turns on transaction notification for all connected Master and Slave VIPs
   for(masterID = 1; masterID <= `AXI_NUM_SYS_MASTERS; masterID = masterID + 1) begin
     axi_mon_master_port_notify(masterID);  
     
     if(`AXI_W_TMO == 0) 
       axi_mon_master_port_wid(masterID, 2);
     else
       axi_mon_master_port_wid(masterID, 3);
     
     for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1) begin
       if(num_vis_mst[slaveID] == 1 && visible_slaves[masterID][slaveID] == 1)
         axi_mon_master_port_wid(masterID, 8);
     end  
   end

   axi_mon_slave_port_wid(0, 8);

   for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1) begin
     axi_mon_slave_port_notify(slaveID); 
     
     if(num_vis_mst[slaveID] == 1 || slv_wid_array[slaveID] > 8)
       axi_mon_slave_port_wid(slaveID, 8);
     else
       axi_mon_slave_port_wid(slaveID, slv_wid_array[slaveID]);
   end

   // Configures Monitor to interpret all transactions on Slave Port 0 to be handled as "Default Slave"
   // transactions. Also turns on transaction notification for default Slave.
   axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_SLAVE_PORT_IDX_PARAM, 0); 
   
   //Sets timeout parameter to be a function of the number of Slaves and Masters connected to the Interconnect, Max interleave depth, max_xact2, the max. burst length of a XACT
   axi_monitor.set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_READY_WATCHDOG_TIMEOUT_PARAM, (`AXI_NUM_SLAVES + `AXI_NUM_SYS_MASTERS)*16*(max_xact2 + 1)*16); 
   axi_mon_slave_port_notify(0);
   axi_mon_coverage;

   if($test$plusargs("enable_coverage=1")) axi_mon_coverage;
 end
endtask

//--------------------------------------------------------------------------------------------
// Configures and starts the AXI Monitor 
// -------------------------------------
task axi_mon_start;
 begin
#0;
   if(`AXI_HAS_LEGAL_ADDR_OVRLP_VAL == 0) begin
     $display("\tTestbench : Configuring the MONITOR model");
     axi_mon_configure;
     axi_mon_memory_map;
     $display("\tTestbench : Monitor - Configured");
     axi_monitor.start;
     $display("\tTestbench : Monitor - Started");
   end else begin
     $display("\tTestbench : Monitor - Not Started (Because DW_axi configuration contains legal address overlapping).");
   end
 end
endtask


//--------------------------------------------------------------------------------------------
// Configures the AXI Port Monitors 
// --------------------------------
task axi_port_mon_configure;
  integer masterID;
  integer slaveID;
  integer logID;
  integer snum;
 begin

   for(snum=1;snum<=`AXI_NUM_SLAVES;snum=snum+1) begin
     case (snum)
       1 : begin
         // Enable error messages.
         axi_port_mon[1].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[1].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[1].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[1].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[1].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[1].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[1]);
         axi_port_mon[1].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `ifdef AXI_HAS_S2
       2 : begin
         // Enable error messages.
         axi_port_mon[2].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[2].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[2].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[2].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[2].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[2].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[2]);
         axi_port_mon[2].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S3
       3 : begin
         // Enable error messages.
         axi_port_mon[3].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[3].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[3].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[3].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[3].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[3].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[3]);
         axi_port_mon[3].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S4
       4 : begin
         // Enable error messages.
         axi_port_mon[4].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[4].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[4].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[4].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[4].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[4].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[4]);
         axi_port_mon[4].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S5
       5 : begin
         // Enable error messages.
         axi_port_mon[5].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[5].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[5].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[5].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[5].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[5].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[5]);
         axi_port_mon[5].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S6
       6 : begin
         // Enable error messages.
         axi_port_mon[6].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[6].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[6].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[6].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[6].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[6].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[6]);
         axi_port_mon[6].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S7
       7 : begin
         // Enable error messages.
         axi_port_mon[7].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[7].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[7].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[7].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[7].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[7].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[7]);
         axi_port_mon[7].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S8
       8 : begin
         // Enable error messages.
         axi_port_mon[8].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[8].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[8].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[8].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[8].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[8].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[8]);
         axi_port_mon[8].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S9
       9 : begin
         // Enable error messages.
         axi_port_mon[9].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[9].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[9].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[9].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[9].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[9].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[9]);
         axi_port_mon[9].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S10
       10 : begin
         // Enable error messages.
         axi_port_mon[10].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[10].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[10].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[10].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[10].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[10].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[10]);
         axi_port_mon[10].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S11
       11 : begin
         // Enable error messages.
         axi_port_mon[11].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[11].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[11].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[11].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[11].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[11].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[11]);
         axi_port_mon[11].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S12
       12 : begin
         // Enable error messages.
         axi_port_mon[12].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[12].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[12].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[12].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[12].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[12].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[12]);
         axi_port_mon[12].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S13
       13 : begin
         // Enable error messages.
         axi_port_mon[13].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[13].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[13].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[13].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[13].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[13].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[13]);
         axi_port_mon[13].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S14
       14 : begin
         // Enable error messages.
         axi_port_mon[14].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[14].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[14].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[14].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[14].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[14].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[14]);
         axi_port_mon[14].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S15
       15 : begin
         // Enable error messages.
         axi_port_mon[15].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[15].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[15].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[15].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[15].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[15].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[15]);
         axi_port_mon[15].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
       `ifdef AXI_HAS_S16
       16 : begin
         // Enable error messages.
         axi_port_mon[16].enable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_PROTO_ERROR, `VMT_MSG_ROUTE_SIM);
         // Disable warninging messages.
         axi_port_mon[16].disable_msg_type(`VMT_DEFAULT_STREAM_ID, `VMT_MSG_WARNING, `VMT_MSG_ROUTE_SIM);
         // Configure monitor to match DUT.
         axi_port_mon[16].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_port_mon[16].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM,  32*(((`AXI_AW-1)/32) + 1));
         axi_port_mon[16].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM,  `AXI_SIDW);
         axi_port_mon[16].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[16]);
         axi_port_mon[16].set_config_param(`VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
       end
       `endif
     endcase
   end // for(snum=1;

 end
endtask

//--------------------------------------------------------------------------------------------
// Configures and starts the AXI Port Monitors
// -------------------------------------------
task axi_port_mon_start;
 integer snum;
 begin
#0;
   if(`AXI_HAS_LEGAL_ADDR_OVRLP_VAL == 1) begin
     $display("\tTestbench : Configuring the Port MONITORs.");
     axi_port_mon_configure;
     $display("\tTestbench : Port Monitors - Configured");
     for(snum=1;snum<=`AXI_NUM_SLAVES;snum=snum+1) begin
       case(snum)
         1 : axi_port_mon[1].start;
         `ifdef AXI_HAS_S2
         2 : axi_port_mon[2].start;
         `endif
         `ifdef AXI_HAS_S3
         3 : axi_port_mon[3].start;
         `endif
         `ifdef AXI_HAS_S4
         4 : axi_port_mon[4].start;
         `endif
         `ifdef AXI_HAS_S5
         5 : axi_port_mon[5].start;
         `endif
         `ifdef AXI_HAS_S6
         6 : axi_port_mon[6].start;
         `endif
         `ifdef AXI_HAS_S7
         7 : axi_port_mon[7].start;
         `endif
         `ifdef AXI_HAS_S8
         8 : axi_port_mon[8].start;
         `endif
         `ifdef AXI_HAS_S9
         9 : axi_port_mon[9].start;
         `endif
         `ifdef AXI_HAS_S10
         10 : axi_port_mon[10].start;
         `endif
         `ifdef AXI_HAS_S11
         11 : axi_port_mon[11].start;
         `endif
         `ifdef AXI_HAS_S12
         12 : axi_port_mon[12].start;
         `endif
         `ifdef AXI_HAS_S13
         13 : axi_port_mon[13].start;
         `endif
         `ifdef AXI_HAS_S14
         14 : axi_port_mon[14].start;
         `endif
         `ifdef AXI_HAS_S15
         15 : axi_port_mon[15].start;
         `endif
         `ifdef AXI_HAS_S16
         16 : axi_port_mon[16].start;
         `endif
       endcase
     end
     $display("\tTestbench : Port Monitors - Started");
   end else begin
     $display("\tTestbench : Port Monitor Not Started , Bus Monitor used for this configuration.");
   end
 end
endtask
