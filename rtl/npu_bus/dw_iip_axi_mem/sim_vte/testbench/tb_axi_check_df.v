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
// Checker for Slave IDs 
// -------------------------------------------------------------------------
task automatic check_slv_df;

 input [31:0] masterID;
 input [31:0] write;
 input [31:0] addr_ch;
 input [31:0] xact_buff;
 
 reg [63:0] tmp_addr;
 reg [31:0] aprot;
 reg [31:0] slv_num;
 reg [16:0] wr_string;
 
  begin
  #0;
    if(write && addr_ch) wr_string = "AW";
    if(write && !addr_ch) wr_string = "WR";
    if(!write && addr_ch) wr_string = "AR";
    if(!write && !addr_ch) wr_string = "RD";
    
    axi_master_get_buffer_attr_bitvec(masterID, xact_buff[31:0], `DW_VIP_AXI_ADDR, 0, tmp_addr);
    axi_mon_addr_lookup(tmp_addr, slv_num);
                         
    `ifdef AXI_TZ_SUPPORT
       axi_master_get_buffer_attr_bitvec(masterID, xact_buff[31:0], `DW_VIP_AXI_APROT, 0, aprot);

       if(visible_slaves[masterID][slv_num] && tz_secure_s[slv_num] == 1'b1 && aprot[1] == 0) begin
         $display("ERROR: %0d - %0s Channel - SECURE ACCESS FAILED - Valid attempt by Master %0d (Buffer %0h) to access Slave %0d incorrectly routed to default slave", 
           $time, wr_string, masterID, xact_buff, slv_num);
         df_error = df_error + 1;
       end
       else if(visible_slaves[masterID][slv_num] && tz_secure_s[slv_num] == 1'b1 && aprot[1] != 0) begin
         if(test_debug) $display("\t%0d - Slave  0 - %0s Channel - Unsecure Access - XACT routed to the default slave (Master %0d, Buffer %0h)", $time, wr_string, masterID, xact_buff);
       end 
       else
    `endif
       if(visible_slaves[masterID][slv_num]) begin
         $display("ERROR: %0d - %0s Channel - DEFAULT SLAVE - Valid attempt by Master %0d (Buffer %0h) to access Slave %0d (Addr: %0h) incorrectly routed to default slave", 
           $time, wr_string, masterID, xact_buff, slv_num, tmp_addr);
         df_error = df_error + 1;
       end
         
       if(!visible_slaves[masterID][slv_num]) begin
         if(test_debug) $display("\t%0d - Slave 0  - %0s Channel - Slave %0d Nonvisible - XACT routed to the default slave (Master, %0d Buffer %0h)", $time, wr_string, slv_num, masterID, xact_buff);
       end

  end//begin
endtask

