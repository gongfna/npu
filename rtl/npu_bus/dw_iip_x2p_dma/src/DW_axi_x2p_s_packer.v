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
//-----------------------------------------------------------------------------
// 
// Filename    : DW_axi_x2ps_packer.v
// 
// Description : APB read data packing for DW_axi_x2p bridge.
//               Positions and loads the APB read data and holds it
//               for pushing into the read data buffer
//-----------------------------------------------------------------------------


module x32_DW_axi_x2p_s_packer (/*AUTOARG*/
   // Outputs
   axi_data, axi_id, axi_resp, axi_last,
   // Inputs
   clk, rstn, apb_data, apb_wd_sel, apb_addr, cmd_size, clr_reg,
   cmd_id, error, enable_pack, last
   );


   input                                clk;
   input                                rstn;
   input [`X2P_APB_DATA_WIDTH-1:0] 	apb_data;
   input [7:0] 			        apb_wd_sel;
   input [`X2P_APB_ADDR_WIDTH-1:0] 	apb_addr;
   input [2:0] 				cmd_size;
   input 				clr_reg;
   
   
   input [`X2P_AXI_SIDW-1:0] 		cmd_id;
   input 				error;
   input 				enable_pack;
   input 				last;
   
   
   output [`X2P_AXI_DW-1:0] 		axi_data;
   output [`X2P_AXI_SIDW-1:0] 		axi_id;
  output                                axi_resp;
   output 				axi_last;
   
   wire [`X2P_AXI_DW-1:0] 			axi_data;   
   reg [`X2P_AXI_DW-1:0] 			axi_data_reg, next_axi_data;
   reg [`X2P_AXI_SIDW-1:0] 			axi_id;
   wire 				axi_resp;
   
   integer 				i,j,k,ii,jj,kk,start,start_pt;
   reg [7:0] 				apb_axi_displ;
   reg [`X2P_APB_DATA_WIDTH-1:0] 	temp_data;
   
   
 /* AUTO_CONSTANT (`X2P_APB_DATA_WIDTH, `APB_BUS_SIZE, `X2P_AXI_DW, `X2P_MAX_AXI_SIZE) */ 

   always @(*)
     begin
	j = 0;
	apb_axi_displ = 0;
	start_pt      = 2;
	
	// use this as a ptr to the lsb of address used to
	// select were the APB data will be located
	if (cmd_size >= `APB_BUS_SIZE)
	  begin
	    // Case-select expression is constant due to configuration
	    // parameter, hence this warning can be disabled:
	    // leda W226 off
	    case(`APB_BUS_SIZE)
	      0:
		begin
	          start_pt = 0;
		end
	      1:
		begin
	          start_pt = 1;
	        end
	      2:
		begin
	          start_pt = 2;
	        end
	      default:
		start_pt = 2;
	    endcase // case(`APB_BUS_SIZE)
	    // leda W226 on

	    // Since the loop variable i will never be greater than 5 a
	    // range overflow is not possible, hence disable warning:
	    // leda FM_2_22 off
      // DCELAB_800: Loop variable is not initiated to a constant
      // jstokes : start_pt is decoded to a static value dependant
      //           on the APB_BUS_SIZE constant
      // leda DCELAB_800 off
	     for (i=start_pt; i < `X2P_MAX_AXI_SIZE; i = i+1)
	       begin
	         apb_axi_displ[j] = apb_addr[i];
	         j = j + 1;
	       end
	    // leda FM_2_22 on
      // leda DCELAB_800 on
	  end
     end // always @ (...
 
// go down all APB word wide inputs to the AXI word 
   //  has a mux for each of AXI Data width/ APB data width
	
   always @(/*AS*/apb_axi_displ or apb_data or axi_data_reg or clr_reg
	    or enable_pack)
     begin
	start = 0;
	if (clr_reg) next_axi_data = -1;
	else next_axi_data = axi_data_reg;
	temp_data = {`X2P_APB_DATA_WIDTH{1'b0}};
	
	if (enable_pack)
	  begin
	    start = 0;     
	// each APB Data Word
	    for (ii=0; ii < (`X2P_AXI_DW/`X2P_APB_DATA_WIDTH); ii = ii + 1)
	      begin
	        if (ii == apb_axi_displ) 
	      // this is the one to update
	          begin
//		 $display("----------%0t  start %0d AXI_DATA_WIDTH %0d ---------------------------------------",
// $time,start,`X2P_AXI_DW);
		 	 
		     for (jj=0; jj<`X2P_APB_DATA_WIDTH; jj = jj + 1)
		       begin
		         next_axi_data[start+jj] = apb_data[jj];
		         temp_data[jj] = apb_data[jj];
//		      $display("%t temp_data[%0d] = %0d (%0d)",$time,jj,temp_data[jj],apb_data[jj]);
		       end
//		 $display("%t ii=%0d apb_axi_displ %0d start %0d next_axi_data %h apb_data %h, temp_data %h",
//                           $time,ii,apb_axi_displ,start, next_axi_data, apb_data, temp_data);
		  end // if (ii == apb_axi_displ)
		 start = start + `X2P_APB_DATA_WIDTH;
	      end // for (ii=0; ii < (`X2P_AXI_DW/`X2P_APB_DATA_WIDTH); ii = ii + 1)
	  end // if (enable_pack)
     end // always @ (...
   

   
   assign axi_data = axi_data_reg;

   assign axi_last = last;   // un registered apb_xfer_cnt from control;
   
   assign axi_resp = error;
   
   
   always @(posedge clk or negedge rstn)
     begin
	if (rstn == 1'b0)
	  begin
	     axi_data_reg <= 0;
	     axi_id <= 0;     
	  end
	else
	  begin
	     axi_data_reg <= next_axi_data;
	     axi_id <= cmd_id;
	  end // else: !if(rstn == 1'b0)
     end // always @ (posedge clk or negedge rstn)
	
    
endmodule // DW_axi_x2ps_packer


















