`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17:54:26 01/14/2018 
// Design Name: 
// Module Name: npu_core 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module npe_top #(                                                                                                                     
 parameter RAM_ADDR_WIDTH = 8				,                                                                                                
 parameter   DATA_WIDTH      =   8   ,                                                                                              
 parameter   DATA_COPIES     =   32  ,                                                                                              
 parameter   INDEX_WIDTH     =   5                                                                                                  
) (                                                                                                                                    
 input  wire                                             i_clk           		,                                                      
 input  wire                                             i_rst_n         		,                                                      
                                                                                                                                    
 //CHN:?controler????                                                                                                               
 input [3:0]                                             i_mode          		,                                                      
 input  wire                                             i_sorter_op ,                                                              
 input [15:0]                                          i_Input_sorter_num ,                                                         
 input                    i_dot_en     ,                                                                                            
 input                    i_dotacc_en  ,                                                                                            
 input                    i_actfun_en  ,                                                                                            
 input                    i_square_mode,                                                                                            
 input                    i_src_from2buffer,                                                                                        
input 																									i_calculate_enable	,                                                        
input [15:0]                                            i_addr_start_s      ,                                                        
input [15:0]                                            i_addr_start_s2      ,                                                       
input [15:0]																						i_addr_start_d 			,                                                        
input [15:0]																						i_addr_start_d2 			,                                                      
input [9:0]                                            i_addr_start_w      ,                                                         
input [7:0]												i_addr_start_b      ,                                                                              
input [3:0]																							i_kernel 						,                                                        
input [1:0]																							i_stride						,                                                        
input [1:0]																							i_pad								,                                                        
input [7:0]																							i_x_length					,                                                        
input [7:0]																							i_y_length					,                                                        
input [7:0]																							i_input_x_length		,                                                        
input [7:0]																							i_input_y_length		,                                                        
input [7:0]																							i_part_num					,                                                        
input [11:0]																						i_one_line_size			,                                                        
input [11:0]																						i_stride_jump_size	,                                                        
input 																									i_b_first_tiling		,                                                        
input 																									i_b_last_tiling			,                                                        
input [7:0]																							i_input_layers			,                                                        
input [7:0]																							i_output_layers			,	                                                       
input [2:0]																							i_last_col_num 			,                                                        
input [7:0]																							i_store_length			,                                                        
input	[7:0]																							i_jump_length				,                                                        
input	[7:0]																							i_avg_pooling_coe				,                                                    
input [1:0]                                             i_buffer_flag,                                                               
output 																									o_calculate_end			,                                                        
                                                                                                                                     
//xpe                                                                                                                                
input [1:0] 											i_xpe_mode	        ,                                                                              
input [3:0]                                             i_i_q_encode        ,                                                        
input [3:0]                                             i_w_q_encode        ,                                                        
input [3:0]                                             i_o_q_encode        ,                                                        
                                                                                                                                     
//CHN:?io_ram????                                                                                                                    
output [11:0]																						o_iob_raddr					,                                                        
output       																						o_iob_rd_en					,                                                        
//output [15:0]																						o_iob_raddr1					,                                                    
//output       																						o_iob_rd_en1					,                                                    
//output        o_rsel,                                                                                                              
output        o_wsel,                                                                                                                
output 																									o_iob_pad_en				,                                                        
output [15:0]																						o_iob_waddr					,                                                        
output 																									o_iob_wr_en					,                                                        
output [255:0]																					o_iob_wdat					,                                                        
 input  [DATA_COPIES*DATA_WIDTH-1:0]                 		i_mdata         		,                                                      
 input                                               		i_mdata_vld     		,                                                      
                                                                                                                                    
 output [11:0]																						o_iob_raddr1					,                                                    
 output       																						o_iob_rd_en1					,                                                      
 //output        o_rsel,                                                                                                              
 //output        o_wsel,                                                                                                              
 output 																									o_iob_pad_en1				,                                                        
 output [15:0]																						o_iob_waddr1					,                                                      
 output 																									o_iob_wr_en1					,                                                      
 output [255:0]																					o_iob_wdat1				,                                                          
 input  [DATA_COPIES*DATA_WIDTH-1:0]                 		i_mdata1         		,                                                      
 input                                               		i_mdata_vld1     		,                                                      
                                                                                                                                    
 //CHN:?wb_ram????                                                                                                                  
 input  [DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:0]   		i_wdata         		,                                                        
 input                                               		i_wdata_vld     		,                                                      
 output [12:0] 																					o_wb_raddr					,                                                      
 output 					     								o_wb_rd_en					,                                                                          
 output                                                  o_bypass_wb    ,                                                           
                                                                                                                                    
 //CHN:bias_ram???                                                                                                                  
 output [RAM_ADDR_WIDTH - 1:0] 							     o_ram_addr					,                                                              
 input [511:0] 				   								 i_ram_dat						,                                                                      
 output														 o_ram_rd_en,                                                                                      
 input 														 i_ram_dat_vld,	                                                                                   
 //CHN:WIB_ram???                                                                                                                   
 input [18:0] 																						i_wib_rdat					,                                                      
 input 																									i_wib_rdat_vld			,                                                      
 output [9:0] 																						o_wib_raddr					,                                                      
 output 																									o_wib_rd_en	,                                                              
 // act_fun LUT interface                                                                                                           
 input [23:0] i_lut_bramctl_wdata,                                                                                                  
 input [4:0]  i_lut_bramctl_addr ,                                                                                                  
 input   i_lut_bramctl_we   ,                                                                                                       
 input        i_lut_bramctl_en   				                                                                                           
);                                                                                                                                     
                                                                                                                                       
//////////////////////////////////////////////////////////////////////////////////                                                     
                                                                                                                                       
                                                                                                                                       
    	wire [6:0]c_pe_en;                                                                                                               
    	wire c_pe_conv_out,c_pe_max_out,c_pe_fc_out;                                                                                     
    	wire c_group_load_start,c_precomp_rdy,c_group_lead_end;                                                                          
    	wire [511:0]c_npe_result;                                                                                                        
		wire c_npe_result_vld;                                                                                                             
		wire [255:0]c_xpe_dat_out;                                                                                                         
		wire c_xpe_dat_vld,c_pe_add_out;                                                                                                   
		wire c_pe_out_en;                                                                                                                  
		wire [4:0] last_line_sorter_num;                                                                                                   
		assign c_pe_out_en = c_pe_fc_out | c_pe_conv_out;                                                                                  
    	                                                                                                                                 
    	IAGU	U_IAGU(                                                                                                                    
					.i_clk							(i_clk),                                                                                                 
					.i_rst_n						(i_rst_n),                                                                                               
					.i_mode							(i_mode),                                                                                                
					.i_sorter_op				(i_sorter_op),                                                                                           
					.i_dot_en           (i_dot_en   ),                                                                                           
					.i_dotacc_en        (i_dotacc_en),                                                                                           
					.i_actfun_en        (i_actfun_en),                                                                                           
					.i_square_mode(i_square_mode),                                                                                               
					.i_src_from2buffer(i_src_from2buffer),                                                                                       
					.i_calculate_enable	(i_calculate_enable),                                                                                    
					.i_addr_start_d 		(i_addr_start_d),                                                                                        
					.i_addr_start_d2 		(i_addr_start_d2),                                                                                       
					.i_kernel 					(i_kernel),                                                                                              
					.i_stride						(i_stride),                                                                                              
					.i_pad							(i_pad),                                                                                                 
					.i_x_length					(i_x_length),                                                                                            
					.i_y_length					(i_y_length),                                                                                            
					.i_input_x_length		(i_input_x_length),                                                                                      
					.i_input_y_length		(i_input_y_length),                                                                                      
					.i_part_num					(i_part_num),                                                                                            
					.i_one_line_size		(i_one_line_size),                                                                                       
					.i_stride_jump_size	(i_stride_jump_size),                                                                                    
					.i_b_first_tiling		(i_b_first_tiling),                                                                                      
					.i_b_last_tiling		(i_b_last_tiling),                                                                                       
					.i_input_layers			(i_input_layers),                                                                                        
					.i_output_layers		(i_output_layers),	                                                                                     
					.i_last_col_num 		(i_last_col_num),                                                                                        
					//.i_buffer_flag      (i_buffer_flag),                                                                                       
					                                                                                                                             
					//NPE                                                                                                                        
					.o_pe_max_out				(c_pe_max_out),                                                                                          
					.o_pe_add_out				(c_pe_add_out),                                                                                          
					.o_sorter_out				(c_sorter_out),                                                                                          
					.last_line_sorter_num (last_line_sorter_num),                                                                                
					.i_Input_sorter_num(i_Input_sorter_num),                                                                                     
					.o_PE_DOT_out   (c_PE_DOT_out   ),                                                                                           
                  .o_PE_DOTACC_out(c_PE_DOTACC_out),                                                                                   
				//	.o_pe_fc_out				(c_pe_fc_out),                                                                                         
					                                                                                                                             
					// WAGU                                                                                                                      
					.i_group_load_start	(c_group_load_start),                                                                                    
					.o_precomp_rdy			(c_precomp_rdy),                                                                                         
					.o_group_lead_end		(c_group_lead_end),                                                                                      
					                                                                                                                             
					.o_iob_raddr				(o_iob_raddr),                                                                                           
					.o_iob_rd_en				(o_iob_rd_en),                                                                                           
					.o_iob_raddr1				(o_iob_raddr1),                                                                                          
					.o_iob_rd_en1				(o_iob_rd_en1),                                                                                          
					//.o_rsel             (o_rsel),                                                                                              
					//.o_wsel             (o_wsel),                                                                                              
					.o_iob_pad_en				(o_iob_pad_en)                                                                                           
                                                                                                                                       
		);                                                                                                                                 
		                                                                                                                                   
		                                                                                                                                   
		OAGU	U_OAGU(                                                                                                                      
					.i_clk							(i_clk),                                                                                                 
					.i_rst_n						(i_rst_n),                                                                                               
					.i_calculate_enable	(i_calculate_enable),                                                                                    
					.i_output_layers		(i_output_layers),	                                                                                     
					.i_sorter_op				(i_sorter_op),                                                                                           
					.i_dot_en           (i_dot_en   ),                                                                                           
					.i_dotacc_en        (i_dotacc_en),                                                                                           
					.i_actfun_en        (i_actfun_en),		                                                                                       
					.i_x_length					(i_x_length),                                                                                            
					.i_y_length					(i_y_length),                                                                                            
					.i_addr_start_s			(i_addr_start_s),                                                                                        
					.i_addr_start_s2			(i_addr_start_s2),	                                                                                   
					.i_xpe_dat_out			(c_xpe_dat_out),                                                                                         
					.i_xpe_dat_vld			(c_xpe_dat_vld),                                                                                         
					.i_store_length			(i_store_length),                                                                                        
					.i_jump_length			(i_jump_length),                                                                                         
					.i_xpe_mode		(i_xpe_mode)		,                                                                                              
					.o_iob_waddr				(o_iob_waddr),	                                                                                         
					.o_iob_wr_en				(o_iob_wr_en),                                                                                           
					.o_calculate_end		(o_calculate_end),                                                                                       
					.o_wsel             (o_wsel),                                                                                                
					.o_iob_wdat					(o_iob_wdat),                                                                                            
					.i_mode(i_mode),                                                                                                             
					.i_buffer_flag(i_buffer_flag)                                                                                                
		);                                                                                                                                 
		                                                                                                                                   
		wagu U_WAGU(                                                                                                                       
		    .i_clk								(i_clk),                                                                                                 
		    .i_rst_n							(i_rst_n),                                                                                               
		                                                                                                                                   
		    //INST_CTRL???                                                                                                                 
		    .i_mode								(i_mode),                                                                                                
		    .i_addr_start_w				(i_addr_start_w),                                                                                        
		    .i_kernel							(i_kernel),                                                                                              
		    .i_stride							(i_stride),                                                                                              
		    .i_pad								(i_pad),                                                                                                 
		    .i_out_x_length				(i_x_length),                                                                                            
		    .i_out_y_length				(i_y_length),                                                                                            
		    .i_in_y_length				(i_input_y_length),                                                                                      
		    .i_part_num						(i_part_num),                                                                                            
		    .i_b_first_tiling			(i_b_first_tiling),                                                                                      
		    .i_b_last_tiling			(i_b_last_tiling),                                                                                       
		    .i_input_layers				(i_input_layers),                                                                                        
		    .i_output_layers			(i_output_layers),                                                                                       
		    .i_enable_calculate		(i_calculate_enable),                                                                                    
		    .i_last_col_num				(i_last_col_num),                                                                                        
                                                                                                                                       
			//NPE???                                                                                                                         
			.o_pe_en					(c_pe_en),                                                                                                     
			.o_pe_conv_out				(c_pe_conv_out),                                                                                           
			.o_pe_fc_out				(c_pe_fc_out),                                                                                               
				                                                                                                                               
			//WB???                                                                                                                          
			.o_wb_raddr				(o_wb_raddr),                                                                                                  
		    .o_wb_rd_en				(o_wb_rd_en),                                                                                                
		    .o_bypass_wb          (o_bypass_wb),                                                                                           
		                                                                                                                                   
		    //WIB???                                                                                                                       
		    .i_wib_rdat				(i_wib_rdat),                                                                                                
		    .i_wib_rdat_vld		    (i_wib_rdat_vld),                                                                                        
		    .o_wib_raddr			(o_wib_raddr),                                                                                               
		    .o_wib_rd_en			(o_wib_rd_en),                                                                                               
		                                                                                                                                   
		    //IOAGU???                                                                                                                     
		    .o_group_load_start(c_group_load_start),                                                                                       
		    .i_group_load_end		(c_group_lead_end),                                                                                        
		    .i_ioagu_next_addr_rdy (c_precomp_rdy)		                                                                                     
		                                                                                                                                   
		    //Test???                                                                                                                      
		    );                                                                                                                             
		                                                                                                                                   
		                                                                                                                                   
		  npe U_NPE(                                                                                                                       
		    .i_clk           (i_clk)						,                                                                                          
		    .i_rst_n         (i_rst_n)					,                                                                                          
		    .i_npe_mode      (i_mode)						,                                                                                          
		    .i_dot_en        (i_dot_en   ),                                                                                                
		    .i_dotacc_en     (i_dotacc_en),                                                                                                
		    .i_sorter_op		 (i_sorter_op)      ,                                                                                          
		    .i_wdata         (i_wdata)					,                                                                                          
		    .i_wdata_vld     (i_wdata_vld)			,                                                                                          
		    .i_mdata         (i_mdata)					,                                                                                          
		    .i_mdata_vld     (i_mdata_vld)			,                                                                                          
		    .i_mdata1         (i_mdata1)					,                                                                                        
		    .i_mdata_vld1     (i_mdata_vld1)			,                                                                                        
		    .o_npe_result    (c_npe_result)			,                                                                                          
		    .o_npe_result_vld(c_npe_result_vld)	,                                                                                          
		    .i_pe_conv_out   (c_pe_conv_out)		,                                                                                          
		    .i_pe_en         (c_pe_en)					,                                                                                          
		    .i_pe_max_out    (c_pe_max_out)			,                                                                                          
		    .i_pe_fc_out     (c_pe_fc_out ),                                                                                               
		    .last_line_sorter_num (last_line_sorter_num),                                                                                  
		    .i_PE_DOT_out    (c_PE_DOT_out   ),                                                                                            
		    .i_PE_DOTACC_out (c_PE_DOTACC_out),                                                                                            
		    .i_square_mode(i_square_mode),                                                                                                 
		    .i_src_from2buffer(i_src_from2buffer),                                                                                         
		    .i_sorter_out		 (c_sorter_out)                                                                                                
		);                                                                                                                                 
		                                                                                                                                   
                                                                                                                                       
		xpe U_XPE(                                                                                                                         
		    .i_clk			(i_clk)				,                                                                                                    
		    .i_rst_n		(i_rst_n)			,                                                                                                    
		    .i_mode         (i_mode)			,                                                                                                
		    .i_xpe_mode		(i_xpe_mode)		,                                                                                                
		    .i_sorter_op    (i_sorter_op),                                                                                                 
		    .i_dot_en(i_dot_en),                                                                                                           
		    .i_dotacc_en(i_dotacc_en),                                                                                                     
		    .i_actfun_en(i_actfun_en),                                                                                                     
		    .i_addr_start_b(i_addr_start_b)		,                                                                                            
		    .i_part_num     (i_part_num),                                                                                                  
		    .i_pe_out_en    (c_pe_out_en),                                                                                                 
		    .i_output_layers(i_output_layers),                                                                                             
		    .i_calculate_end(o_calculate_end),                                                                                             
		    .i_q_encode     (i_i_q_encode)      ,                                                                                          
        	.w_q_encode     (i_w_q_encode)      ,                                                                                        
        	.o_q_encode     (i_o_q_encode)      ,                                                                                        
		    .i_calc_en		(i_calculate_enable),                                                                                            
		    .i_avg_pooling_coe (i_avg_pooling_coe),                                                                                        
		    .i_npe_dat_out	(c_npe_result)		,                                                                                            
		    .i_npe_dat_vld	(c_npe_result_vld)	,                                                                                          
		    .i_mdata (i_mdata),                                                                                                            
		    .i_mdata_vld (i_mdata_vld),                                                                                                    
		    .i_ram_dat		(i_ram_dat)			,                                                                                                
		    .i_ram_dat_vld  (i_ram_dat_vld)	,                                                                                              
		    .i_lut_bramctl_wdata(i_lut_bramctl_wdata),                                                                                     
	      .i_lut_bramctl_addr (i_lut_bramctl_addr ),                                                                                     
	      .i_lut_bramctl_we   (i_lut_bramctl_we   ),                                                                                     
	      .i_lut_bramctl_en   (i_lut_bramctl_en   ),                                                                                     
		    .o_xpe_dat_out	(c_xpe_dat_out)	,                                                                                              
		    .o_xpe_dat_vld	(c_xpe_dat_vld),                                                                                               
		    .o_ram_addr     (o_ram_addr),                                                                                                  
		    .o_ram_rd_en    (o_ram_rd_en)                                                                                                  
    );                                                                                                                                 
                                                                                                                                       
endmodule                                                                                                                              
