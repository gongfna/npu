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
// Filename    : DW_axi_x2ps.v
// 
// Description : APB Master for DW_axi_x2p bridge.
//-----------------------------------------------------------------------------

module x32_DW_axi_x2p_s (/*AUTOARG*/
  // Outputs
  pop_hcmd_int_n, pop_wdata_int_n, hwid_int, hwstatus_int, 
  push_resp_int_n, hrid_int, hrdata_int, hrstatus_int, hrlast_int, 
  push_data_int_n, psel, paddr, penable, pwdata, pwrite, 
  // Inputs
  clk, rst_n, hcmd_queue_wd_int, hcmd_rdy_int_n, hwword_int, 
  hwdata_rdy_int_n, hresp_rdy_int_n, read_buffer_full, pready_raw, 
  pslverr_raw, prdata
  );
   input                              clk;
   input                              rst_n;

// Interface to Common CMD Queue

   input   [`X2P_CMD_QUEUE_WIDTH:0] hcmd_queue_wd_int;   // Contains several fields
   input                              hcmd_rdy_int_n;      // Low means not empty
   output                             pop_hcmd_int_n;      // Low-true POP

// Interface to Write Data FIFO

   input  [`X2P_AXI_WDFIFO_WIDTH-1:0] hwword_int;          // DATA, WSTRB, LAST
   input                              hwdata_rdy_int_n;    // Low means not empty
   output                             pop_wdata_int_n;     // Low-true POP


   // the contents of the write data buffer is registered

   input                              hresp_rdy_int_n;     // Low means: OK to push
   output             [`X2P_AXI_SIDW-1:0] hwid_int;
   output                             hwstatus_int;
   output                             push_resp_int_n;     // Low-true PUSH


// Interface to the RDFIFO

   input 			      read_buffer_full;
   output             [`X2P_AXI_SIDW-1:0] hrid_int;
   output               [`X2P_AXI_DW-1:0] hrdata_int; 
   output                             hrstatus_int;
   output                             hrlast_int;
   output                             push_data_int_n;

 // APB master inputs 
   // raw is right off the buss when not APB3 
   // he raw signals will be bypassed and tied appropriatly 
  input                             pready_raw;  
  input                             pslverr_raw;
  input   [`X2P_APB_DATA_WIDTH-1:0] prdata;

  // APB master outputs
  output [15:0]                     psel;
  output  [`X2P_APB_ADDR_WIDTH-1:0] paddr; 
  output 			    penable;
  output  [`X2P_APB_DATA_WIDTH-1:0] pwdata;
  output                            pwrite;

  wire   [`X2P_CMD_QUEUE_WIDTH:0] hcmd_queue_wd_int;   // Contains several fields
  wire  [`X2P_AXI_WDFIFO_WIDTH-1:0] hwword_int;          // DATA, WSTRB, LAST
  wire   [`X2P_APB_DATA_WIDTH-1:0] prdata;
  
  wire [15:0]                      psel,psel_ungated;
   
// these are after the AMBA compatibility adjustments   
   reg 				    pready;
   reg 				    pslverr;

   wire [`X2P_APB_ADDR_WIDTH-1:0]   paddr;
   
   wire [(`X2P_APB_DATA_WIDTH/8)-1:0] selected_strobes;
   wire [7:0] next_apb_wd_sel;

   wire [7:0] first_strobe,last_strobe,next_first_strobe,next_last_strobe;
   wire [`X2P_MAX_AXI_SIZE:0] incr_value,base_incr_value;
   wire dcd_error,error,push_resp_request;
   wire set_addr,incr_addr,incr_base_addr;
   wire save_id,set_data,clr_data_reg;
   wire update_address,psel_en,enable_pack,last_push_read;

   wire [`X2P_CMD_ADDR_WIDTH-1:0] cmd_queue_addr; 
   wire [`X2P_AXI_SIDW-1:0] 	  cmd_id;
   wire [2:0] 			  cmd_size;
   
   wire [`X2P_AXI_DW-1:0] 		      conditioned_write_data;
   wire [(`X2P_AXI_DW/8)-1:0] 	      conditioned_write_strobes;

   wire [`X2P_AXI_DW-1:0] 		      packed_read_data;
   
   reg [`X2P_AXI_DW-1:0] 		      next_write_data,write_data_reg;
   reg [(`X2P_AXI_DW/8)-1:0] 	      next_write_strobes,write_strobes_reg;
   reg 				      next_write_last,write_last_reg;
   wire [2:0] 			      rd_cmd_size;
   wire                               rd_error;   
   
// Interface to Write Response FIFO

// if not APB3 tie pready active and pslverr low
   integer 			  AMBA_VER;

   assign cmd_id[`X2P_AXI_SIDW-1:0] = hcmd_queue_wd_int[(`LEN_WIDTH+`X2P_AXI_SIDW +5):(`LEN_WIDTH+6)];
   assign cmd_size[2:0] = hcmd_queue_wd_int[5:3];
   assign cmd_queue_addr[`X2P_CMD_ADDR_WIDTH-1:0] = hcmd_queue_wd_int >> (`LEN_WIDTH+`X2P_AXI_SIDW +6); 
   
   always @(pready_raw or psel or pslverr_raw)
     begin:AMBA3_Compatibility
	AMBA_VER=1;
	case(psel)
	  1: AMBA_VER = `X2P_IS_APB3_S0;
	  2: AMBA_VER = `X2P_IS_APB3_S1;
	  4: AMBA_VER = `X2P_IS_APB3_S2;
	  8: AMBA_VER = `X2P_IS_APB3_S3;
	  16: AMBA_VER = `X2P_IS_APB3_S4;
	  32: AMBA_VER = `X2P_IS_APB3_S5;
	  64: AMBA_VER = `X2P_IS_APB3_S6;
	  128: AMBA_VER = `X2P_IS_APB3_S7;
	  256: AMBA_VER = `X2P_IS_APB3_S8;
	  512: AMBA_VER = `X2P_IS_APB3_S9;
	  1024: AMBA_VER = `X2P_IS_APB3_S10;
	  2048: AMBA_VER = `X2P_IS_APB3_S11;
	  4096: AMBA_VER = `X2P_IS_APB3_S12;
	  8192: AMBA_VER = `X2P_IS_APB3_S13;
	  16384: AMBA_VER = `X2P_IS_APB3_S14;
	  32768: AMBA_VER = `X2P_IS_APB3_S15;
	  default: AMBA_VER = 1;
	endcase // case(psel)
	if (AMBA_VER >= 1)
	  begin
	     pready = pready_raw;
	     pslverr = pslverr_raw;
	  end
	else
          begin
	     pready = 1'b1;       // AMBA 2 so I'll tie pready internally
	     pslverr = 0;         // no slave error so tie it internally
	  end
     end // block: AMBA3_Compatibility
		  
   
   assign conditioned_write_data = 
            hwword_int[`X2P_AXI_WDFIFO_WIDTH-1:`X2P_AXI_WDFIFO_WIDTH-`X2P_AXI_DW];
   assign conditioned_write_strobes = hwword_int[(`X2P_AXI_DW/8):1];
   assign hrdata_int = packed_read_data; 
   

   
/// monitor the write buffer output determine from the strobes the 1's APB and the last APB word
    x32_DW_axi_x2p_first_last_strobe
     #(`X2P_AXI_DW,`X2P_APB_DATA_WIDTH) U_x2ps_first_last_strb(
				    .clk(clk),.rstn(rst_n),
                                    .sample_strobes(incr_base_addr),      
				    .write_strobes(conditioned_write_strobes),
				    .next_first_strobe(next_first_strobe),
			            .next_last_strobe(next_last_strobe),
       			            .first_strobe(first_strobe),
				    .last_strobe(last_strobe));
      
    
// the control module contains all the state machines (read and write)
    x32_DW_axi_x2p_s_control
     U_x2ps_ctrl(
				     .clk(clk),.rstn(rst_n),
				    // Inputs
                                     .cmd_queue_wd(hcmd_queue_wd_int), 
                                     .cmd_queue_empty(hcmd_rdy_int_n), 
                                     .write_buffer_last(write_last_reg), 
                                     .next_write_buff_empty(hwdata_rdy_int_n),
				     .resp_rdy_n(hresp_rdy_int_n),
				     .selected_strobes(selected_strobes),
				     .dcd_error(dcd_error),
				     .read_buffer_full(read_buffer_full),
                                     .pready(pready),
				     .pslverr(pslverr),
				    .first_strobes(first_strobe),
				    .next_first_strobes(next_first_strobe),
				    .last_strobes(last_strobe),
				     // Outputs
				     .pop_cmd_queue_n(pop_hcmd_int_n),
				     .pop_write_buff_n(pop_wdata_int_n),
				     .push_read_buffer_n(push_data_int_n),
				     .error(error),
                                     .rd_error(rd_error),
				     .push_rsp_buff_n(push_resp_request),
				     .next_apb_wd_sel(next_apb_wd_sel),
				     .set_addr(set_addr),
				     .incr_base_addr(incr_base_addr),
				     .set_data(set_data),
				     .incr_addr(incr_addr),
				     .update_address(update_address),
				     .incr_value(incr_value),
				     .base_incr_value(base_incr_value),
				     .psel_en(psel_en),
				     .penable(penable),
				     .enable_pack(enable_pack),
				     .last_push_read(last_push_read),
				     .clr_rd_data_reg(clr_data_reg),
				     .pwrite(pwrite),
				     .save_id(save_id),
				     .rd_cmd_size(rd_cmd_size)
                                    );
   
   x32_DW_axi_x2p_s_packer
    U_x2ps_pack(.clk(clk),.rstn(rst_n),
				  // inputs
				  .apb_data(prdata),
				  .apb_wd_sel(next_apb_wd_sel),
				  .apb_addr(paddr),
				  .cmd_size(cmd_size),
				  .cmd_id(cmd_id),
				  .error(rd_error),
				  .last(last_push_read),
				  .enable_pack(enable_pack),
				  .clr_reg(clr_data_reg),
				  // outputs go to the read data buffer
				  .axi_data(packed_read_data),
				  .axi_id(hrid_int),
				  .axi_resp(hrstatus_int),
				  .axi_last(hrlast_int)
				  );
   
   x32_DW_axi_x2p_s_unpack
    U_x2ps_unpack(.clk(clk),.rstn(rst_n),
				    // Outputs
				    .selected_data(pwdata), 
                                    .selected_strobes(selected_strobes),
                                    // Inputs
                                    .write_buff_data(write_data_reg), 
                                    .write_buff_strobes(write_strobes_reg), 
                                    .cmd_size(hcmd_queue_wd_int[5:3]),
                                    .next_apb_wd_sel(next_apb_wd_sel),
				    .set_data(set_data)
                                     );
// this will issue responses to the write response buffer
   x32_DW_axi_x2p_s_response
    U_x2ps_resp(.clk(clk),.rstn(rst_n),
				// inputs
				.wr_error(error),
				.push_req_n(push_resp_request),
				.cmd_id(cmd_id),
				.resp_rdy_n(hresp_rdy_int_n),
				.save_id(save_id),
				// outputs
				.resp_id(hwid_int),
				.resp_status(hwstatus_int),
				.push_n(push_resp_int_n)
				);
   // address generation for the APB and decode of address will issue 
   // an error upon address generated out of any APB slave address range
   
   x32_DW_axi_x2p_s_addr_dcd
    U_x2ps_addr (.clk(clk),.rstn(rst_n),
				     //Inputs
				     .cmd_addr(cmd_queue_addr),
				     .cmd_type(hcmd_queue_wd_int[2:1]),
				     .cmd_size(hcmd_queue_wd_int[5:3]),
				     .cmd_len(hcmd_queue_wd_int[5+`LEN_WIDTH:6]),
				     .cmd_direction(hcmd_queue_wd_int[0]),
				     .incr_addr(incr_addr),
				     .incr_base_addr(incr_base_addr),
				     .set_addr(set_addr),
				     .update_address(update_address),
                                     .incr_value(incr_value),
				     .base_incr_value(base_incr_value),
				     // Outputs
				     .dcd_error(dcd_error),
			             .psel(psel_ungated),
				     .paddr(paddr)
				     );
// gate out the psel on active ops
   assign psel = (psel_en == 1'b1) ? psel_ungated : 0;   

   
// register the outputs of the write data buffer
   // he registering goes with each pop of the write data buffer
   // the data first goes through the endian conversion
   always @(/*AS*/conditioned_write_data or conditioned_write_strobes
            or hwword_int or pop_wdata_int_n or write_data_reg
            or write_last_reg or write_strobes_reg)
     begin
	next_write_data = write_data_reg;
	next_write_strobes = write_strobes_reg;
	next_write_last = write_last_reg;
	if (pop_wdata_int_n == 1'b0)
	  begin
	     next_write_data = conditioned_write_data;
	     next_write_strobes = conditioned_write_strobes;
	     next_write_last = hwword_int[0];
	  end
     end // always @ (...
	
   
   //Register
   always @(posedge clk or negedge rst_n)
     begin
       if (!rst_n)
	 begin
	    write_data_reg <= 0;
	    write_strobes_reg <= 0;
	    write_last_reg <= 0;
	 end
       else
         begin
	    write_data_reg <= next_write_data;
	    write_strobes_reg <= next_write_strobes;
	    write_last_reg <= next_write_last;
	 end // else: !if(!rst_n)
     end // always @ (posedge clk or negedge rst_n)
   
endmodule // DW_axi_x2ps


				
					
 

   


























