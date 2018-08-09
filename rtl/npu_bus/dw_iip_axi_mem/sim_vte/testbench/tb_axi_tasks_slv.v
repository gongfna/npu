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
// Tasks relating to the AXI Slave VIP
//
///////////////////////////////////////////////////////////////////////////////////////

//--------------------------------------------------------------------------------------------
// Configures the Slave VIP model
// -------------------------------
// This task accepts as it's arguments: 
// slaveID   - Selects which Slave to configure 
task axi_slv_configure;
   input [31:0] slaveID;
 begin
#0;
   $display("\tTestbench : Configuring SLAVE %0d model", slaveID);  
   axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
   axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM, 32*(((`AXI_AW-1)/32) + 1));
   axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM, `AXI_SIDW);
   axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));
   
   if(slv_wid_array[slaveID] > 8)
     axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, 8);
   else
     axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, slv_wid_array[slaveID]);
   
  
   // If read interleaving limiting is set on just 1 master port (limit to
   // 1) then we don't support read interleaving from any slave ports.
   // This is the restriction we use to guarantee no deadlock conditions,
   // though other less stringent restrictions are possible.
   if(ri_limit_m[`AXI_NUM_MASTERS-1:0] == {`AXI_NUM_MASTERS{1'b0}}) begin
     if(slv_max_rd_transaction[slaveID] > 8)
       axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_READ_INTERLEAVE_DEPTH_PARAM,  8);
     else
       axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_READ_INTERLEAVE_DEPTH_PARAM,  slv_max_rd_transaction[slaveID]);
   end else begin
     axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_READ_INTERLEAVE_DEPTH_PARAM,  1);
   end
   
   axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_NUM_OUTSTANDING_XACT_PARAM, slv_max_transaction[slaveID]);
   
   // jstokes, 4/10/10, crm 9000423090
   // - all slaves now randomise default awready. Required for the directed
   // test for this STAR. Test requires long valid ready wait times, which
   // didn't work if default ready is 1.
   axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_AWREADY_PARAM, {$random(seed)} % 2);
   axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_ARREADY_PARAM, {$random(seed)} % 2);

   // Slave 1 must have default WREADY of 1 for AW W latency test.
   if(slaveID == 1)
     axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_WREADY_PARAM, 1);
   else
     axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_WREADY_PARAM, {$random(seed)} % 2);

   axi_slave_set_config_param(slaveID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_EXCLUSIVE_ACCESS_PARAM, 32*8);

 end
endtask

//--------------------------------------------------------------------------------------------
// Starts all the Slave VIP models
// -------------------------------
task axi_slv_all_start;
   integer slaveID;
 begin
#0;
   for(slaveID = 1; slaveID <= `AXI_NUM_SLAVES; slaveID = slaveID + 1) begin
     axi_slave_start(slaveID);
   end   
 end     
endtask

//--------------------------------------------------------------------------------------------
// Determines targeted Slave based on the Address
// ----------------------------------------------
task automatic axi_slv_addr_lookup;
   input  [`AXI_AW-1:0] slave_addr;
   output [31:0] slaveID;

   integer region_count;
   integer slave_count;

 begin
#0; 
   slaveID = 0;
   for(slave_count = 1; slave_count <= `AXI_NUM_SLAVES; slave_count = slave_count + 1) begin
     for(region_count = 0; region_count <= slv_num_regions[slave_count]; region_count = region_count + 1) begin
        if(slave_addr >= slv_region_start_array[slave_count][region_count] && slave_addr <= slv_region_end_array[slave_count][region_count])
          slaveID = slave_count;
     end
   end
 end   
endtask

//--------------------------------------------------------------------------------------------
// Configures Slave VIPs response for Reads and Writes to valid region
// -------------------------------------------------------------------
// This task accepts as it's arguments: 
// slaveID               - Selects which Slave to configure
// regionID              - Selects which Region to configure
// avalid_aready_delay   - Minimum delay between A*VALID being asserted and A*READY being asserted. 
//                         (Ignored if A*READY is being asserted due to default setting) 
// aready_delay          - Minimum delay until A*READY returns to its default setting after both 
//                         A*VALID and A*READY are asserted. (A*READY held low during this delay)
// wready_delay          - Minimum delay until WREADY returns to its default setting after both 
//                         WVALID and WREADY are asserted. (WREADY held low during this delay)
// rvalid_delay          - Minimum delay until RVALID is driven high after both ARVALID and ARREADY 
//                         are asserted. (RVALID held low during this delay unless other transfers 
//                         are in progress)
// bvalid_delay          - Minimum delay until BVALID is driven high following the acceptance of the
//                         last beat of write data in a transaction.
task axi_slv_region_resp;
   input [31:0]          slaveID;
   input [31:0]          regionID;
   input [31:0]          slverr;
   input [31:0]          avalid_aready_delay;
   input [31:0]          aready_delay;
   input [31:0]          wready_delay;
   input [31:0]          rvalid_delay;
   input [31:0]          bvalid_delay;
   
   output [31:0]         buffer_out;

   reg [31:0]            buffer_local;

   reg [`AXI_AW-1:0]     start_addr;
   reg [`AXI_DW-1:0]     data, data_rand_max;
   reg [31:0]            region_size, burst_length, random_sel, temp_integer, i; 

 begin
#0;
   start_addr = slv_region_start_array[slaveID][regionID];
   region_size = slv_region_size_array[slaveID][regionID] + 1;
   
   axi_slave_new_buffer(slaveID, buffer_local);
         
   axi_slave_set_buffer_attr_bitvec(slaveID, buffer_local, `DW_VIP_AXI_MATCH_ADDR_BASE, 0, start_addr);
   axi_slave_set_buffer_attr_enable(slaveID, buffer_local, `DW_VIP_AXI_MATCH_ADDR_BASE, 1);

   axi_slave_set_buffer_attr_bitvec(slaveID, buffer_local, `DW_VIP_AXI_MATCH_ADDR_SIZE, 0, region_size);
   axi_slave_set_buffer_attr_enable(slaveID, buffer_local, `DW_VIP_AXI_MATCH_ADDR_SIZE, 1);
   
   axi_slave_set_buffer_attr_int(slaveID, buffer_local, `DW_VIP_AXI_RESP_AVALID_AREADY_DELAY, 0, avalid_aready_delay);
   axi_slave_set_buffer_attr_int(slaveID, buffer_local, `DW_VIP_AXI_RESP_AREADY_DELAY, 0, aready_delay);
   axi_slave_set_buffer_attr_int(slaveID, buffer_local, `DW_VIP_AXI_RESP_WREADY_DELAY, 0, wready_delay);
   axi_slave_set_buffer_attr_int(slaveID, buffer_local, `DW_VIP_AXI_RESP_ADDRESS_RVALID_DELAY, 0, rvalid_delay);
   axi_slave_set_buffer_attr_int(slaveID, buffer_local, `DW_VIP_AXI_RESP_WRITE_BVALID_DELAY, 0, bvalid_delay);
   
   if(slverr == `SIM_SLVERR_RND)
     random_sel = {$random(seed)} % 5;
   else
     random_sel = slverr;

   
   if(random_sel == `SIM_SLVERR) begin
     for(burst_length = 0; burst_length < 16; burst_length = burst_length + 1) begin
       axi_slave_set_buffer_attr_int(slaveID, buffer_local, `DW_VIP_AXI_RESP_STATUS_ERROR, burst_length, `DW_VIP_AXI_RESP_SLVERR);
     end
   end
   
   axi_slave_add_to_match_list(slaveID, buffer_local, 0);
   
   buffer_out = buffer_local;
 end
endtask

//--------------------------------------------------------------------------------------------
// Configures a Slave region to always return SLVERR
// -------------------------------------------------
task axi_slv_slverr_resp;
   input  [31:0] slaveID;
   input  [31:0] buffer_in_handle;

   reg [31:0] buffer_handle;

   integer burst_length;

 begin
#0;   
   for(burst_length = 0; burst_length < 16; burst_length = burst_length + 1) begin
     axi_slave_set_buffer_attr_int(slaveID, buffer_handle, `DW_VIP_AXI_RESP_STATUS_ERROR, burst_length, `DW_VIP_AXI_RESP_SLVERR);
   end
  
   axi_slave_add_to_match_list(slaveID, buffer_handle, 0);
 end   
endtask

