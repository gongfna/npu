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
// Tasks relating to the AXI Master VIP
//
///////////////////////////////////////////////////////////////////////////////////////

//--------------------------------------------------------------------------------------------
// Configures the Master VIP model
// -------------------------------
// This task automatic accepts as it's arguments: 
// masterID   - Selects which Master to configure 
task automatic axi_mst_configure;
   input [31:0] masterID;
 begin
#0;
         $display("\tTestbench : Configuring MASTER %0d model", masterID);

         if(masterID <= `AXI_NUM_ICM)
           axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM, `AXI_SIDW);
         else
           axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ID_WIDTH_PARAM, `AXI_MIDW);
           
         axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DATA_WIDTH_PARAM, `AXI_DW);
         axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_ADDR_WIDTH_PARAM, 32*(((`AXI_AW-1)/32) + 1));
         axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_WRITE_INTERLEAVE_DEPTH_PARAM, 8);
         axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_NUM_OUTSTANDING_XACT_PARAM, mst_max_transaction[masterID]);
         axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_RREADY_PARAM, {$random(seed)} % 2); 
         axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_DEFAULT_BREADY_PARAM, {$random(seed)} % 2); 
         axi_master_set_config_param(masterID, `VMT_DEFAULT_STREAM_ID, `DW_VIP_AXI_MAX_BURST_LENGTH_PARAM, ({`AXI_BLW{1'b1}} + 1));

         // Turn off warnings due to protocol "recommendations" for locking 
         axi_master_disable_msg_id(masterID, `VMT_DEFAULT_STREAM_ID, `AXI_MSGID_CROSS_LOCK_BOUNDARY, `VMT_MSG_ROUTE_ALL);  
         axi_master_disable_msg_id(masterID, `VMT_DEFAULT_STREAM_ID, `AXI_MSGID_LOCK_LENGTH, `VMT_MSG_ROUTE_ALL);  
         
         // Prevents false errors due to DECERR or forced SLVERR resp
         axi_master_disable_msg_id(masterID, `VMT_DEFAULT_STREAM_ID, `AXI_MSGID_FAILED_XACCESS, `VMT_MSG_ROUTE_ALL);  
         axi_master_disable_msg_id(masterID, `VMT_DEFAULT_STREAM_ID, `AXI_MSGID_UNEXPECTED_BUFFER_INDEXED_ATTRIBUTE_VALUE, `VMT_MSG_ROUTE_ALL);  
 end
endtask

//--------------------------------------------------------------------------------------------
// Starts all the Master VIP models
// --------------------------------
task automatic axi_mst_all_start;
   integer masterID;
 begin
#0;
         for(masterID = 1; masterID <= `AXI_NUM_MASTERS; masterID = masterID + 1) begin
    	    axi_master_start(masterID);
	 end   
 end	 
endtask

//--------------------------------------------------------------------------------------------
// Generates a random AXI Transaction
// ----------------------------------
// This task automatic accepts as it's arguments: 
// masterID   - Selects which Master will issue the transaction.
// slaveID    - Selects which Slave is targeted by the Master
// regionID   - Selects which Region is targeted by the Master
// write      - (0) - Read, (1) - Write, (2) - Randomly select
// lock       - (0) - Unlock, (1) - Lock, (2) - Randomly select
// secure     - (0) - Secure, (1) - Nonsecure, (2) - Randomly select
//
// All other aspects of the transaction (Burst Length, Cache Type etc.) are generated
// randomly within the constraints of the AXI protocol
task automatic axi_mst_rand_xact;
   input  [31:0]        masterID;
   input  [31:0]        slaveID;
   input  [31:0]        regionID;
   input  [31:0]	write;
   input  [31:0]       	lock;
   input  [31:0]        secure;
   input  [31:0]        burst;
   
   output [31:0]        buffer_out;
   
   reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] slv_addr;
   reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] tmp_addr;
   reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] tmp_bytes;
   reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] bound_addr;
   reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] num_words;
   reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] addr_offset;
   reg [`DW_VIP_AXI_ADDR_WIDTH_PARAM-1:0] offset_rand_max;
   reg [31:0]           buffer_local;
   reg [31:0]		write_sel;
   reg [31:0]       	lock_sel, total_bytes;
   reg [31:0]      	secure_sel;
   reg [1:0]            alock;
   reg [2:0]            aprot;
   reg [3:0]            acache;
   reg [`AXI_DW-1:0]    data_rand_max;
   reg [`AXI_DW-1:0]    data;
   reg [`AXI_DW-1:0]    data_temp;
   reg [1:0]            aburst;
   reg [2:0]            asize;
   integer              num_bytes;
   reg [`AXI_SIDW-1:0]  aid;
   reg [`AXI_BLW-1:0]   alen;
   reg [40:0]           wr_string;
 
   integer i, single_burst, temp_integer, k, random_master;
   reg [`AXI_AW-1:0] boundary;

   integer slv;
   integer reg_slv;

 begin
   #0;
   if(write == `SIM_RW_RND)
     write_sel = {$random(seed)} % 2;
   else
     write_sel = write;
  
   if(lock == `SIM_LOCK_RND) begin
     lock_sel = {$random(seed)} % 3;
     // Prevent an exclusive write from being randomly generated
     while(write_sel == `SIM_WRITE && lock_sel == `SIM_EXCLUSIVE) begin
       lock_sel = {$random(seed)} % 3;
     end
   end else if(lock == `SIM_EXCLUSIVE && write_sel == `SIM_WRITE ) begin
     lock_sel = 0;
   end else begin
     lock_sel = lock;
   end
   
   if(secure == `SIM_SECURE_RND)
     secure_sel = {$random(seed)} % 2;
   else
     secure_sel = secure;
   
   if(burst == `SIM_BURST_RND)
     single_burst = {$random(seed)} % 2;
   else
     single_burst = burst;
      
   addr_offset = {`DW_VIP_AXI_ADDR_WIDTH_PARAM{1'b0}};
   slv_addr = {`DW_VIP_AXI_ADDR_WIDTH_PARAM{1'b0}};
 
   // Randomise the starting address offset for targeted Slave Region
   offset_rand_max = $random(seed);
   for(i = 1; i <= `AXI_AW/32; i = i + 1) begin
     temp_integer = $random(seed);
     offset_rand_max = {offset_rand_max, temp_integer};
   end
     
   addr_offset = offset_rand_max % (slv_region_size_array[slaveID][regionID] + 1);
   slv_addr[`AXI_AW-1:0] = slv_region_start_array[slaveID][regionID] + addr_offset[`AXI_AW-1:0];
   boundary = addr_offset / (4096);

   case(`AXI_DW)
       8: asize  = {$random(seed)} % 1;
      16: asize  = {$random(seed)} % 2;
      32: asize  = {$random(seed)} % 3;
      64: asize  = {$random(seed)} % 4;
     128: asize  = {$random(seed)} % 5;
     256: asize  = {$random(seed)} % 6;
     512: asize  = {$random(seed)} % 7;
    1024: asize  = {$random(seed)} % 8;
    default: asize = 2;
   endcase 
   
   num_bytes = 2**asize;
   // Max number of bytes in exclusive access is 128
   if(lock_sel == `SIM_EXCLUSIVE) begin
     while(num_bytes > 128) begin
       asize = asize - 1; 
       num_bytes = 2**asize;
     end
   end
  
     
   // Randomly selects Burst Types from Fixed, Incremental or Wrapping
   // Unless specificaly asked for incr.
   if   (burst == `SIM_BURST_INCR_16)  aburst = 1;
   else                                aburst = {$random(seed)} % 3;
   
   // If the Burst Type is "Wrapping" ensures the length of the burst is
   // 2,4,8, 16 etc. as specified by the AXI protocol.
   if(aburst == 2) begin
     axi_weighted_alen(alen);

     while((alen != 1 && alen != 3 && alen != 7 && alen != 15
           && alen != 31 && alen != 63 && alen != 127 && alen != 255) || ((alen+1)*num_bytes >= 4096) ) begin
       axi_weighted_alen(alen);
     end
   end 
   // If the Burst Type is "Incremental" adjusts addr to ensure the length of the burst 
   // doesn't cause the transaction to cross Slave region boundaries
   else if (aburst == 1) begin 
     if(burst == `SIM_BURST_INCR_16) begin
       alen = 15;
     end else begin
       axi_weighted_alen(alen);
     end

     if(((alen+1)*num_bytes) + addr_offset[`AXI_AW-1:0] >= (4096*(boundary+1)) - 1) begin
        slv_addr[`AXI_AW-1:0] = slv_region_start_array[slaveID][regionID] + 4096*boundary;
     end
   end
   // If the Burst Type is "Fixed" ensures the length of the burst 
   // is within the burst length limit set by the AXI protocol
   else begin
     axi_weighted_alen(alen);
   end

   if(alen == 16) alen = 15;
   
   if(lock_sel == `SIM_EXCLUSIVE) begin

     total_bytes = (alen + 1) * num_bytes;
     while(total_bytes != 1 &&
           total_bytes != 2 &&
           total_bytes != 4 &&
           total_bytes != 8 && 
           total_bytes != 16 && 
           total_bytes != 32 && 
           total_bytes != 64 && 
           total_bytes != 128) begin
       
       axi_weighted_alen(alen);
       total_bytes = (alen + 1) * num_bytes;
     end
   end else begin
     while((alen+1)*num_bytes >= 4096) begin
       axi_weighted_alen(alen);
     end
   end
   
   if(alen == 0 && aburst == 2 && lock_sel == `SIM_EXCLUSIVE) begin
     alen = 1;
     asize = 0;
     num_bytes = 2**asize;
     total_bytes = (alen + 1) * num_bytes;
   end

   // If burst type is randomly selected to be "Wrapping"
   // Ensure starting address is aligned to the size of the transfer
   if(aburst == 2) slv_addr = (slv_addr/num_bytes) * (num_bytes);   
   
   // If burst type is randomly selected to be an Exclusive access
   // Ensure starting address is aligned to the size of the transfer
   if(lock_sel == `SIM_EXCLUSIVE) slv_addr = (slv_addr/total_bytes) * (total_bytes);   
   
   // Randomly selects Privileged access
   aprot[0]  = {$random(seed)} % 2;
   // Selects Secure access based on external argument
   aprot[1]  = secure_sel;
   // Randomly selects Instruction access
   aprot[2]  = {$random(seed)} % 2;
   
   alock = lock_sel;
   
   // Ensures the randomly selected Cache Type doesn't select a reserved value
   acache = {$random(seed)} % 16;
   while(acache == 4 || acache == 5 || acache == 8 || acache == 9 || acache == 12 || acache == 13) begin
     acache = {$random(seed)} % 16;
   end
   // If exclusive read/write xact can't be cacheable
   if(lock_sel == `SIM_EXCLUSIVE)
     acache = {$random(seed)} % 2;

   // Create a new buffer for the transaction
   axi_master_new_buffer(masterID, buffer_local);
  
   // Randomly select an AID value for this transaction
   aid = {$random(seed)} % `AXI_MIDW;

`ifdef AXI_BICMD_SUPPORT
   if(masterID <= `AXI_NUM_ICM && `AXI_LOG2_NM > 0) begin
     if(`AXI_NUM_ICM == 1) begin
       random_master = ({$random(seed)} % `AXI_NUM_SYS_MASTERS) + 1;
       while(axi_pnum_for_snum[random_master] != 1) begin
         random_master = {$random(seed)} % `AXI_NUM_SYS_MASTERS + 1;
       end
       aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = random_master - 1;
     end else begin
       random_master = {$random(seed)} % num_valid_icm_master[masterID];
       aid[`AXI_SIDW-1:`AXI_SIDW-`AXI_LOG2_NM] = valid_icm_master[masterID][random_master+1] - 1;
     end
   end
`endif

   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_AID, 0, aid);

   if(write_sel == 0) 
     axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_WRITE, 0, `VMT_FALSE);
   else 
     axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_WRITE, 0, `VMT_TRUE);
   
   axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_XACT_TIMEOUT, 0, 256*17*17);
   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_ADDR, 0, slv_addr);
   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_ALOCK, 0, alock);
   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_ALEN, 0, alen);
   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_ACACHE, 0, acache);
   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_APROT, 0, aprot);
   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_ABURST, 0, aburst);
   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_ASIZE, 0, asize);
   
   if(write_sel == 0) begin
     wr_string = "Read";
     
     data_rand_max = $random(seed);
     for(k = 0; k <= `AXI_DW/32; k = k + 1) begin
       temp_integer =  $random(seed);
       data_rand_max = {data_rand_max, temp_integer};
     end

     data = data_rand_max % {`AXI_DW{1'b1}};
     tmp_addr = slv_addr / `AXI_DW;
     tmp_addr = tmp_addr * `AXI_DW;

     if(aburst == 2) begin //wrapping, need to fill the whole boundary mem
       tmp_bytes = (2**asize)*(alen+1); //number of bytes
       bound_addr = ( slv_addr / tmp_bytes ) * tmp_bytes; //aligned to boundary
       bound_addr = ( bound_addr / (`AXI_DW/8) ) * (`AXI_DW/8); //aligned to data width
       num_words = (tmp_bytes/(`AXI_DW/8))+1; //total words to be written

       // jstokes, 27.10.10
       // Fill the slave memory for every slave that matches this address.
       // Required for configurations with legally overlapping slave addresses.
       for(reg_slv = 0; reg_slv <= (`SIM_MAX_NUM_SLV_REGIONS-1); reg_slv = reg_slv + 1) begin
         for(slv = 1; slv <= `AXI_NUM_SLAVES; slv = slv + 1) begin
           //$display("\t %0t, DEBUG, slv_addr %0h, slv_region_start_array[%0d][%0d] %0h"
                    //, $time, slv_addr, slv, reg_slv, slv_region_start_array[slv][reg_slv]);
           //$display("\t %0t, DEBUG, slv_num_regions[%0d] %0h, slv_region_end_array[%0d][%0d] %h"
                    //, $time, slv, slv_num_regions[slv], slv, reg_slv, slv_region_end_array[slv][reg_slv]);
           if(  (slv_addr >= slv_region_start_array[slv][reg_slv])
              & (slv_addr <= slv_region_end_array[slv][reg_slv])
              & (reg_slv <= slv_num_regions[slv])
              & (slv <= `AXI_NUM_SLAVES)
             ) 
           begin
             axi_slave_fill_mem(slv, `VMT_DEFAULT_STREAM_ID, bound_addr, `AXI_DW, `VMT_MEM_PATTERN_INCR, data,  num_words);
             //$display("\t %0t, DEBUG, OVERLAP ? , write_sel %0d, mst %0d, slv %0d, reg_slv %0d", $time, write_sel, masterID, slv, reg_slv);
           end
         end // for(slv = 1;
       end // for(reg_slv = 1;
     end
     else begin //not wrapping
       // jstokes, 27.10.10
       // Fill the slave memory for every slave that matches this address.
       // Required for configurations with legally overlapping slave addresses.
       for(reg_slv = 0; reg_slv <= (`SIM_MAX_NUM_SLV_REGIONS-1); reg_slv = reg_slv + 1) begin
         for(slv = 1; slv <= `AXI_NUM_SLAVES; slv = slv + 1) begin
           //$display("\t %0t, DEBUG, slv_addr %0h, slv_region_start_array[%0d][%0d] %0h"
                    //, $time, slv_addr, slv, reg_slv, slv_region_start_array[slv][reg_slv]);
           //$display("\t %0t, DEBUG, slv_num_regions[%0d] %0h, slv_region_end_array[%0d][%0d] %h"
                    //, $time, slv, slv_num_regions[slv], slv, reg_slv, slv_region_end_array[slv][reg_slv]);
           if(  (slv_addr >= slv_region_start_array[slv][reg_slv])
              & (slv_addr <= slv_region_end_array[slv][reg_slv])
              & (reg_slv <= slv_num_regions[slv])
              & (slv <= `AXI_NUM_SLAVES)
             ) 
           begin
             axi_slave_fill_mem(slv, `VMT_DEFAULT_STREAM_ID, tmp_addr, `AXI_DW, `VMT_MEM_PATTERN_INCR, data,  (2**asize)*(alen+1)+`AXI_DW);
             //$display("\t %0t, DEBUG, OVERLAP ? , write_sel %0d, mst %0d, slv %0d, reg_slv %0d", $time, write_sel, masterID, slv, reg_slv);
           end
         end // for(slv = 1;
       end // for(reg_slv = 1;
     end

     axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_RREADY_DELAY, 0, {$random(seed)} % 5);

     if(single_burst == 0)begin
       for(i = 0; i < alen; i = i + 1) begin
         axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_RVALID_RREADY_DELAY, i, {$random(seed)} % 5);
       end
     end  
   end 
   else begin
     wr_string = "Write";
     
     data_rand_max = $random(seed);
     for(i = 0; i <= `AXI_DW/32; i = i + 1) begin
      temp_integer =  $random(seed);
      data_rand_max = {data_rand_max, temp_integer};
     end
     
     data = data_rand_max % {`AXI_DW{1'b1}};

     axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_AVALID_WVALID_DELAY, 0, ({$random(seed)} % 10) - 3);
     axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_BVALID_BREADY_DELAY, 0, {$random(seed)} % 5);
     axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_BREADY_DELAY, 0, {$random(seed)} % 5);

     if(single_burst == 0)begin
       for(i = 0; i < alen; i = i + 1) begin
         axi_master_set_buffer_attr_int(masterID, buffer_local, `DW_VIP_AXI_NEXT_WVALID_DELAY, i, {$random(seed)} % 5);
       end
     end  
     
     axi_master_set_buffer_data_pattern(masterID, buffer_local, `VMT_MEM_PATTERN_INCR, data);
   end
   
   axi_master_set_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_ASIZE, 0, asize);
   if(test_debug) begin
     $display("\tTestbench : %s Details -> Addr = %0h, ID = %h, Burst Length = %d", wr_string, slv_addr, aid, alen);
     $display("\tTestbench : %s Details -> Lock = %d, Prot = %d, Cache = %d, Burst Type = %d, Burst Size = %d", wr_string, alock, aprot, acache, aburst, asize);
   
     /*if(write_sel == 1) begin
       for(i = 0; i < alen; i = i + 1)begin
         axi_master_get_buffer_attr_bitvec(masterID, buffer_local, `DW_VIP_AXI_DATA, i, data_temp);
         $display("\tTestbench : %s Details -> %0d) Data %h", wr_string, i, data_temp);
       end
     end*/
   end

   buffer_out = buffer_local;
 end
endtask

task automatic axi_master_add_to_pend;
  input [31:0] masterID;
  input [31:0] buffer_handle;
  
  reg [31:0] write;
 begin
#0;
   axi_master_get_buffer_attr_int(masterID, buffer_handle, `DW_VIP_AXI_WRITE, 0, write);

   // Place the buffer handle at the top of the Read/Write pending queue for the targeted master
   if(write == `VMT_FALSE) begin
     mst_rd_xact_buff[masterID][mst_rd_xact_cnt[masterID]] = {`SIM_PENDING, buffer_handle};
     mst_rd_xact_cnt[masterID] = mst_rd_xact_cnt[masterID] + 1;
   end else begin
     mst_wr_xact_buff[masterID][mst_wr_xact_cnt[masterID]] = {`SIM_PENDING, buffer_handle};
     mst_wr_xact_cnt[masterID] = mst_wr_xact_cnt[masterID] + 1;
   end
   
 end
endtask 

//-------------------------------
// Converts string to integer
//-------------------------------

task automatic axi_mst_port_string_convert;
   input [31:0] port_string;
   output [31:0] port_number;
 begin
#0;
   case(port_string)
      "M0": port_number = 0;
      "M1": port_number = 1;
      "M2": port_number = 2;
      "M3": port_number = 3;
      "M4": port_number = 4;
      "M5": port_number = 5;
      "M6": port_number = 6;
      "M7": port_number = 7;
      "M8": port_number = 8;
      "M9": port_number = 9;
      "M10": port_number = 10;
      "M11": port_number = 11;
      "M12": port_number = 12;
      "M13": port_number = 13;
      "M14": port_number = 14;
      "M15": port_number = 15;
      default: port_number = 0;
   endcase   
 end
endtask

task automatic axi_weighted_alen;
   output [`AXI_BLW-1:0] alen;
   integer rand_int;
 begin
 #0; 
  rand_int =  $random(seed) % 100;

  if(rand_int < 80 )
    alen =  {$random(seed)} % 16;
  else
    alen  = {$random(seed)} % ({`AXI_BLW{1'b1}} + 1);

 end
endtask

//task to check wdata/rdata with xxxxxxxx
task automatic axi_mon_check_x_data;
  input [5:0] num;
  input       valid;
  input       ready;
  input       data;

  reg no_use;
begin
#0;
  if ( valid & ready ) begin
    if ( data == 1'b1 || data == 1'b0 )
      no_use = 1'b0;
    else
      $display("ERROR: wdata_m and/or rdata_s at port %d have value x and/or z", num);
  end
end
endtask

