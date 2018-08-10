/*
 ------------------------------------------------------------------------
--
--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
--                            ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this
--  software is subject to the terms and conditions of a written
--  license agreement between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
*/
//
//-----------------------------------------------------------------------------
// Filename    : DW_axi_x2ps_unpack.v
// 
// Description : APB write data unpacking for DW_axi_x2p bridge.
//-----------------------------------------------------------------------------


module x32_DW_axi_x2p_s_unpack (/*AUTOARG*/
  // Outputs
  selected_data, selected_strobes, 
  // Inputs
  clk, rstn, write_buff_data, write_buff_strobes, cmd_size, 
  next_apb_wd_sel, set_data
  );


   input                                clk;
   input                                rstn;
   input [`X2P_AXI_DW-1:0] 		        write_buff_data;
   input [(`X2P_AXI_DW/8)-1:0] 	        write_buff_strobes;
   input [2:0] 			        cmd_size;
   input [7:0] 			        next_apb_wd_sel;
   input 				set_data;
   
   output [`X2P_APB_DATA_WIDTH-1:0]     selected_data;
   output [(`X2P_APB_DATA_WIDTH/8)-1:0] selected_strobes;
   
   reg [`X2P_APB_DATA_WIDTH-1:0] 	selected_data;
   wire [`X2P_AXI_DW-1:0] 			write_buff_data;
   wire [(`X2P_AXI_DW/8)-1:0] 		write_buff_strobes;
   wire [2:0] 				cmd_size;
   wire [7:0] 				next_apb_wd_sel;
   reg [`X2P_APB_DATA_WIDTH-1:0] 	next_selected_data;
   wire [`X2P_APB_DATA_WIDTH-1:0] 	selected_data_ns;
   reg [(`X2P_APB_DATA_WIDTH/8)-1:0] 	selected_strobes_ns;
   wire [(`X2P_APB_DATA_WIDTH/8)-1:0] 	selected_strobes;

  integer                               i;
  integer                               j;

  // Use of complex arithmetic operations intended, hence the
  // Leda warning can be disabled:
  // leda FM_1_2 off
   
  always@(/*AUTOSENSE*/next_apb_wd_sel or write_buff_data)
    /*AUTO_CONSTANT(`X2P_APB_DATA_WIDTH)*/
    begin
      for(i=0; i<`X2P_APB_DATA_WIDTH; i=i+1)
        begin
          next_selected_data[i] = write_buff_data[i+(next_apb_wd_sel*`X2P_APB_DATA_WIDTH)];
        end
    end // always@ (...
  
  always@(/*AUTOSENSE*/next_apb_wd_sel or write_buff_strobes)
    /*AUTO_CONSTANT(`X2P_APB_WSTRB_WIDTH)*/
    begin
      for(j=0; j<`X2P_APB_WSTRB_WIDTH; j=j+1)
        begin

	  // X2P_APB_WSTRB_WIDTH is derived from a configuration
	  // parameter and therefore a constant, hence the Leda
	  // warning can be disabled:
	  // leda W639 off
          selected_strobes_ns[j] = write_buff_strobes[j+(next_apb_wd_sel*`X2P_APB_WSTRB_WIDTH)];
	  // leda W639 on
        end
    end // always@ (...

   // leda FM_1_2 on
  
   assign selected_strobes = selected_strobes_ns;   
   assign selected_data_ns = (set_data==1'b1) ? next_selected_data : selected_data;
			      
  always @(posedge clk or negedge rstn)
    begin
       if (!rstn)
	 begin
	    selected_data <= 0;
	 end
       else
         begin
	    selected_data <= selected_data_ns;
	 end
    end // always @ (posedge clk or negedge rstn)
   

   
   
endmodule // DW_axi_x2ps_unpack


















