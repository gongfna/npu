`timescale 1ns / 1ps

module decoder(
	input i_clk,
	input i_rst_n,
	input clr,

	input [127:0] inst_in,
	input inst_valid,

	output [4:0] opcode,
	output [3:0] o_mode,

	output  [15:0] o_addr_start_d      ,
	output  [15:0] o_addr_start_d2      ,
	output  [9:0] o_addr_start_w      ,
	output  [15:0] o_addr_start_s      ,
	output  [15:0] o_addr_start_s2      ,
	output  [7:0] o_addr_start_b      ,
	output  [1:0]  o_buffer_flag       ,
                                      
	output  [7:0]  o_i_x_length        ,
	output  [7:0]  o_i_y_length        ,
	output  [7:0]  o_i_piece_num       ,
                                      
	//output  [1:0]  o_tiling_type       ,
	output         o_b_first_tiling       ,
	output         o_b_last_tiling       ,
	output  [7:0]  o_part_num          ,
	output  [3:0]  o_last_part         ,
	output  [7:0]  o_i_line_size       ,
                                   
	output  [7:0]  o_o_x_length        ,
	output  [7:0]  o_o_y_length        ,
	output  [7:0]  o_o_piece_num       ,
                                   
	output  [3:0]  o_kernel            ,
	output  [1:0]  o_stride            ,
	output  [1:0]  o_pad               ,
                                   
	output  reg [7:0] r_jump_length        ,
	output  [7:0]  o_o_line_size        ,
	output  [15:0] o_s_all_length      ,
                                   
	output  [7:0]  o_avg_pool_coe       ,
	output  [3:0]  o_w_q_encode         ,
	output  [3:0]  o_i_q_encode         ,
	output  [3:0]  o_o_q_encode         ,
	
	 output o_sorter_op,
	 output  [15:0] o_Input_sorter_num,
	 output o_dot_en   ,
	 output o_dotacc_en,
	 output o_actfun_en,
	 output o_square_mode,

	//output  [2:0]  o_softmax_o_num      ,
	//output  [15:0] o_softmax_i_num     ,
	//output  [11:0] o_softmax_dest_addr ,
	//output  [11:0] o_softmax_src_addr  ,

	output  [3:0]  o_dma_mode          ,
	output  [31:0] o_src_start         ,
	output  [31:0] o_dest_start        ,
	output  [31:0] o_d_lines           ,
	output  o_be_stream  ,
	output  o_be_noblock ,
	output  [7:0] o_dma_i_line_size ,     
	output  [1:0] o_dma_i_stride    ,
	output  [1:0] o_dma_i_pad_num   ,
	
	output  [11:0] o_jump_pc              ,
	output  o_wait_last_noblock_dma,
	output  o_src_from2buffer,
	//output  o_be_noblock,
	output  [1:0] o_act_mode,
	output  o_err_inst


);

parameter DMA = 5'b10010;
parameter IOB2N = 5'b01010;
parameter WB2N = 5'b01011;
parameter N2IOB = 5'b01101;
parameter SOFTMAX = 5'b00110;
parameter STOP = 5'b11111;
parameter JUMP = 5'b11100;
parameter DOT = 5'b10011;
parameter DOTACC = 5'b10110;
parameter ACTFUN = 5'b10111;

wire  [9:0]opcode_array;
reg   [3:0] r_mode;
reg   [15:0] r_addr_start_d ;    
reg   [15:0] r_addr_start_d2 ; 
reg   [11:0] r_addr_start_w ;    
reg   [15:0] r_addr_start_s ;   
reg   [15:0] r_addr_start_s2 ;  
reg   [11:0] r_addr_start_b ;    
reg   [1:0]  r_buffer_flag  ;    
                              
reg   [7:0]  r_i_x_length  ;     
reg   [7:0]  r_i_y_length  ;     
reg   [7:0]  r_i_piece_num ; 
reg   [15:0]  r_Input_sorter_num ;    
                              
reg   [1:0]  r_tiling_type ;     
reg   [7:0]  r_part_num    ;     
reg   [3:0]  r_last_part   ;     
reg   [7:0]  r_i_line_size ;     
                              
reg   [7:0]  r_o_x_length  ;     
reg   [7:0]  r_o_y_length  ;     
reg   [7:0]  r_o_piece_num ;     
                              
reg   [3:0]  r_kernel     ;      
reg   [1:0]  r_stride     ;      
reg   [1:0]  r_pad        ;      
                              
//reg   [7:0]  r_jump_length  ;    
reg   [7:0]  r_o_line_size  ;    
reg   [15:0] r_s_all_length ;    
                              
reg   [7:0]  r_avg_pool_coe ;    
reg   [3:0]  r_w_q_encode   ;    
reg   [3:0]  r_i_q_encode   ;    
reg   [3:0]  r_o_q_encode   ;    
                              
reg   [2:0]  r_softmax_o_num     ;
reg   [15:0] r_softmax_i_num     ;
reg   [11:0] r_softmax_dest_addr ;
reg   [11:0] r_softmax_src_addr  ;
                              
reg   [3:0]  r_dma_mode    ;     
reg   [31:0] r_src_start   ;     
reg   [31:0] r_dest_start  ;     
reg   [31:0] r_d_lines     ; 
reg          r_be_stream    ; 
//reg          r_be_noblock   ;
reg     [1:0]     r_act_mode;
reg   r_b_last_tiling ;
reg   r_b_first_tiling;
reg   r_sorter_op;
reg  [7:0] r_dma_i_line_size ;
reg  [1:0] r_dma_i_stride    ;
reg  [1:0] r_dma_i_pad_num   ;
reg   r_dot_en    ;
reg   r_dotacc_en ;
reg   r_actfun_en ;
reg   r_square_mode;
reg   r_src_from2buffer;

assign opcode = inst_in[127:123];
//assign opcode = 5'b10111;
assign o_jump_pc               = inst_in[122:111];
assign o_wait_last_noblock_dma = inst_in[20];
assign o_be_noblock            = inst_in[20];
assign opcode_array  = {(opcode == DMA),(opcode == IOB2N),(opcode == WB2N),(opcode == N2IOB)
,(opcode == SOFTMAX),(opcode == STOP),(opcode == JUMP),(opcode == DOT),(opcode == DOTACC),(opcode == ACTFUN)};
assign o_err_inst = (~|opcode_array)&&inst_valid; 
assign o_mode = r_mode;  
assign o_addr_start_d       = r_addr_start_d     ;
assign o_addr_start_d2       = r_addr_start_d2     ;     
assign o_addr_start_w       = r_addr_start_w[9:0]     ;
assign o_addr_start_s       = r_addr_start_s     ;
assign o_addr_start_b       = r_addr_start_b[7:0]     ;
assign o_buffer_flag        = r_buffer_flag      ;                 
assign o_i_x_length         = r_i_x_length       ;
assign o_i_y_length         = r_i_y_length       ;
assign o_i_piece_num        = r_i_piece_num      ;                 
//assign o_tiling_type        = r_tiling_type      ;
assign o_b_first_tiling     = r_b_first_tiling   ;
assign o_b_last_tiling      = r_b_last_tiling   ;


assign o_part_num           = r_part_num         ;
assign o_last_part          = r_last_part        ;
assign o_i_line_size        = r_i_line_size      ;                
assign o_o_x_length         = r_o_x_length       ;
assign o_o_y_length         = r_o_y_length       ;
assign o_o_piece_num        = r_o_piece_num      ;               
assign o_kernel             = r_kernel           ;
assign o_stride             = r_stride           ;
assign o_pad                = r_pad              ;                
//assign o_jump_length        = r_jump_length      ;
assign o_o_line_size        = r_o_line_size      ;
assign o_s_all_length       = r_s_all_length     ;              
assign o_avg_pool_coe       = r_avg_pool_coe     ;
assign o_w_q_encode         = r_w_q_encode       ;
assign o_i_q_encode         = r_i_q_encode       ;
assign o_o_q_encode         = r_o_q_encode       ;               
assign o_softmax_o_num      = r_softmax_o_num    ;
assign o_softmax_i_num      = r_softmax_i_num    ;
assign o_softmax_dest_addr  = r_softmax_dest_addr;
assign o_softmax_src_addr   = r_softmax_src_addr ;                
assign o_dma_mode           = r_dma_mode         ;
assign o_src_start          = r_src_start        ;
assign o_dest_start         = r_dest_start       ;
assign o_d_lines            = r_d_lines          ;   
assign o_be_stream          = r_be_stream        ;   
//assign o_be_noblock         = r_be_noblock       ; 
assign o_act_mode           = r_act_mode;
assign o_addr_start_s2 = r_addr_start_s2;
assign o_sorter_op = r_sorter_op;
assign  o_dot_en    = r_dot_en   ;
assign  o_dotacc_en = r_dotacc_en;
assign  o_actfun_en = r_actfun_en;
assign  o_square_mode = r_square_mode;
assign  o_src_from2buffer = r_src_from2buffer;
assign o_Input_sorter_num = r_Input_sorter_num;
assign o_dma_i_line_size = r_dma_i_line_size;
assign o_dma_i_stride    = r_dma_i_stride   ;
assign o_dma_i_pad_num   = r_dma_i_pad_num  ;


always @(posedge i_clk or negedge i_rst_n)
begin
	if (i_rst_n == 0)
	begin
		r_mode         <= 4'h0;
		r_addr_start_d <= 12'h0;
		r_addr_start_d2 <= 12'h0;
		r_addr_start_w <= 12'h0;
		r_addr_start_s <= 12'h0;
		r_addr_start_s2 <= 12'b0;
		r_addr_start_b <= 12'h0;
		r_buffer_flag  <= 2'b0;
		r_i_x_length   <= 8'h0;
		r_i_y_length   <= 8'h0;
		r_i_piece_num  <= 8'h0;
		r_tiling_type  <= 2'b0;
		r_part_num     <= 8'h0;
		r_last_part    <= 4'h0;
		r_i_line_size  <= 8'h0;
		r_o_x_length   <= 8'h0;
		r_o_y_length   <= 8'h0;
		r_o_piece_num  <= 8'h0;
		r_kernel       <= 4'h0;
		r_stride       <= 2'b0;
		r_pad          <= 2'b0;
		r_jump_length  <= 8'h0;
		r_s_all_length <= 16'h0;
		r_o_line_size  <= 8'h0;
		r_dma_mode     <= 4'h0;
		r_src_start    <= 32'h0;
		r_dest_start   <= 32'h0;
		r_d_lines      <= 32'h0;
	    r_be_stream    <= 1'b0;
//	    r_be_noblock   <= 1'b0;
	    r_act_mode     <= 2'b0;
	    r_softmax_o_num <= 3'b0;
	    r_softmax_i_num <= 16'b0;
	    r_softmax_dest_addr <= 12'b0;
		    r_softmax_src_addr <= 12'b0;
		    r_w_q_encode       <= 4'b0;
			r_i_q_encode       <= 4'b0;
			r_o_q_encode       <= 4'b0;
			r_avg_pool_coe <= 8'b0;
			r_b_last_tiling  <= 1'b0;
           r_b_first_tiling <= 1'b0;
           r_sorter_op <= 1'b0;
           r_dot_en    <= 1'b0;
           r_dotacc_en <= 1'b0;
           r_actfun_en <= 1'b0; 
           r_square_mode <= 1'b0;
           r_src_from2buffer <= 1'b0;
           r_Input_sorter_num <= 16'b0;
            r_dma_i_line_size <= 8'b0;
			r_dma_i_stride    <= 2'b0;
			r_dma_i_pad_num   <= 2'b0;
          

		
	end
	else if (clr)
	begin
		r_mode         <= 4'h0;
		r_addr_start_d <= 12'h0;
		r_addr_start_d2 <= 12'h0;
		r_addr_start_w <= 12'h0;
		r_addr_start_s <= 12'h0;
		r_addr_start_s2 <= 12'b0;
		r_addr_start_b <= 12'h0;
		r_buffer_flag  <= 2'b0;
		r_i_x_length   <= 8'h0;
		r_i_y_length   <= 8'h0;
		r_i_piece_num  <= 8'h0;
		//r_tiling_type  <= 2'b0;
		r_part_num     <= 8'h0;
		r_last_part    <= 4'h0;
		r_i_line_size  <= 8'h0;
		r_o_x_length   <= 8'h0;
		r_o_y_length   <= 8'h0;
		r_o_piece_num  <= 8'h0;
		r_kernel       <= 4'h0;
		r_stride       <= 2'b0;
		r_pad          <= 2'b0;
		r_jump_length  <= 8'h0;
		r_s_all_length <= 16'h0;
		r_o_line_size  <= 8'h0;
		r_dma_mode     <= 4'h0;
		r_src_start    <= 32'h0;
		r_dest_start   <= 32'h0;
		r_d_lines      <= 32'h0; 
		r_be_stream    <= 1'b0;
	  //r_be_noblock   <= 1'b0;
	  r_act_mode<= 2'b0;
	    r_softmax_o_num <= 3'b0;
	    r_softmax_i_num <= 16'b0;
	    r_softmax_dest_addr <= 12'b0;
		r_softmax_src_addr <= 12'b0;
		 r_w_q_encode       <= 4'b0;
			r_i_q_encode       <= 4'b0;
			r_o_q_encode       <= 4'b0;
			r_avg_pool_coe <= 8'b0;
			r_b_last_tiling  <= 1'b0;
           r_b_first_tiling <= 1'b0;
           r_sorter_op <= 1'b0;
           r_dot_en    <= 1'b0;
           r_dotacc_en <= 1'b0;
           r_actfun_en <= 1'b0;
           r_square_mode <= 1'b0;
            r_src_from2buffer <= 1'b0;
            r_Input_sorter_num <= 16'b0;   
             r_dma_i_line_size <= 8'b0;
			r_dma_i_stride    <= 2'b0;
			r_dma_i_pad_num   <= 2'b0;
			
           
           
	end
	else if(inst_valid)
	begin
		case (opcode)
			DMA:
			begin
				r_src_start <= inst_in[121:90];
				r_dest_start <= inst_in[89:58];
				r_d_lines <= inst_in[57:26];
				r_dma_mode <= inst_in[25:22];
				r_be_stream <= inst_in[21];
				r_dma_i_line_size <= inst_in[19:12];
				r_dma_i_stride    <= inst_in[11:10];
				r_dma_i_pad_num   <= inst_in[9:7];
			end

			IOB2N:
			begin
				r_addr_start_d <= inst_in[121:106];
				//r_buffer_flag <= inst_in[105:102];
				r_mode <= inst_in[105:102];
				r_i_x_length <= inst_in[101:94];
				r_i_y_length <= inst_in[93:86];
				r_i_piece_num <= inst_in[85:78];
				//r_tiling_type <= inst_in[79:78];
				r_b_last_tiling  <=  inst_in[77];
              r_b_first_tiling <=   inst_in[76];
				//r_tiling_type <= inst_in[79:78];
				//r_tiling_type <= inst_in[79:78];
				r_part_num <= inst_in[75:68];
				r_last_part <= inst_in[67:64];
				r_i_line_size <= inst_in[63:56];
				r_avg_pool_coe <= inst_in[55:48];
			end

			WB2N:
			begin
				r_addr_start_w <= inst_in[121:110];
				r_addr_start_b <= inst_in[109:98];
				r_kernel <= inst_in[97:94];
				r_stride <= inst_in[93:92];
				r_pad <= inst_in[91:90];
				r_w_q_encode <= inst_in[89:86];
				r_i_q_encode <= inst_in[85:82];
				r_o_q_encode <= inst_in[81:78];
			end

			N2IOB:
			begin
				r_addr_start_s <= inst_in[121:106];
				
				r_o_x_length <= inst_in[105:98];
				r_o_y_length <= inst_in[97:90];
				r_o_piece_num <= inst_in[89:82];
				r_jump_length <= inst_in[81:74];
				r_o_line_size <= inst_in[73:66];
				r_s_all_length <= inst_in[65:50];
				r_act_mode <= inst_in[49:48];
				//r_addr_start_s2 <= inst_in[49:38];
				r_sorter_op <= 1'b0;
				r_dot_en    <= 1'b0;
              r_dotacc_en <= 1'b0;
              r_actfun_en <= 1'b0;
               r_src_from2buffer <= 1'b0;
			end

			SOFTMAX:
			begin
				//r_softmax_o_num <= inst_in[121:1];
         			r_Input_sorter_num <= inst_in[121:106];
         			r_addr_start_s <= inst_in[105:90];
         			r_addr_start_d <= inst_in[89:74];
        			// r_buffer_flag <= inst_in[79:78];
         			r_sorter_op <= 1'b1;
         			r_o_x_length <= 1'b1;
         			r_o_y_length <= 1'b1;
         			r_o_piece_num <= 1'b1;
         			r_mode <= 4'b0;
         			r_dot_en    <= 1'b0;
           			r_dotacc_en <= 1'b0;
           			r_actfun_en <= 1'b0;
				r_src_from2buffer <= 1'b0;
				//r_wait_last_dma <= inst_in[37];
			end
			
		DOT:
			begin
			
				r_addr_start_d <= inst_in[121:106];
				r_addr_start_d2 <= inst_in[105:90];
				r_src_from2buffer <= inst_in[118]!=inst_in[102];
				r_o_piece_num  <= inst_in[89:82];
				r_sorter_op <= 1'b0;
				r_w_q_encode       <= inst_in[81:78];
			   r_i_q_encode       <= inst_in[77:74];
			   r_o_q_encode       <= inst_in[73:70];
			   r_addr_start_s <= inst_in[69:54];
			   r_square_mode <= inst_in[39];
			   r_o_x_length <= 1'b1;
         		r_o_y_length <= 1'b1;
			   r_dot_en    <= 1'b1;
              r_dotacc_en <= 1'b0;
              r_actfun_en <= 1'b0;
              /*
              r_addr_start_d <= 16'h0000;
				r_addr_start_d2 <= 16'h0006;
				r_src_from2buffer <= 1'b0;
				r_o_piece_num  <= 8'h04;
				r_sorter_op <= 1'b0;
				r_w_q_encode       <= inst_in[81:78];
			   r_i_q_encode       <= inst_in[77:74];
			   r_o_q_encode       <= inst_in[73:70];
			   r_addr_start_s <= 16'h1000;
			   r_square_mode <= 1'b0;
			   r_o_x_length <= 1'b1;
         		r_o_y_length <= 1'b1;
			   r_dot_en    <= 1'b1;
              r_dotacc_en <= 1'b0;
              r_actfun_en <= 1'b0;*/
              
			end	
		
		DOTACC:
			begin
			
				r_addr_start_d <= inst_in[121:106];
				r_addr_start_d2 <= inst_in[105:90];
				r_src_from2buffer <= inst_in[118]!=inst_in[102];
				r_o_piece_num  <= inst_in[81:74];
				r_i_piece_num <= inst_in[89:82];
				r_sorter_op <= 1'b0;
				r_w_q_encode       <= inst_in[73:70];
			   r_i_q_encode       <= inst_in[69:66];
			   r_o_q_encode       <= inst_in[65:62];
			   r_addr_start_s <= inst_in[61:46];
			   r_addr_start_s2 <= inst_in[45:30];
			   r_act_mode <= inst_in[29:28];
			   r_square_mode <= inst_in[27];
			   r_o_x_length <= 1'b1;
         		r_o_y_length <= 1'b1;
			   r_dot_en    <= 1'b0;
              r_dotacc_en <= 1'b1;
              r_actfun_en <= 1'b0;
              /*
              r_addr_start_d <= 16'h0000;
				r_addr_start_d2 <= 16'h0000;
				r_src_from2buffer <= 1'b0;
				r_i_piece_num <= 8'h04;
				r_o_piece_num  <= 8'h04;
				r_sorter_op <= 1'b0;
				r_w_q_encode       <= inst_in[81:78];
			   r_i_q_encode       <= inst_in[77:74];
			   r_o_q_encode       <= inst_in[73:70];
			   r_addr_start_s <= 16'h1000;
			   r_addr_start_s2 <= 16'h0000;
			   r_square_mode <= 1'b1;
			   r_act_mode <= 2'b10;
			   r_o_x_length <= 1'b1;
         		r_o_y_length <= 1'b1;
			   r_dot_en    <= 1'b0;
              r_dotacc_en <= 1'b1;
              r_actfun_en <= 1'b0;*/
			   
			end	
			
		ACTFUN:
			begin
			
				r_addr_start_d <= inst_in[121:106];
				r_i_piece_num <= inst_in[105:98];
				r_o_piece_num  <= inst_in[105:98];
				r_sorter_op <= 1'b0;
				r_o_x_length <= 1'b1;
         		r_o_y_length <= 1'b1;
			   r_i_q_encode       <= inst_in[97:94];
			   r_o_q_encode       <= inst_in[93:90];
			   r_addr_start_s <= inst_in[89:74];
			   r_act_mode <= inst_in[73:72];
			   r_dot_en    <= 1'b0;
              r_dotacc_en <= 1'b0;
              r_actfun_en <= 1'b1;
              
             /* 
              r_addr_start_d <= 16'h0000;
				r_i_piece_num <= 8'h4;
				r_o_piece_num  <= 8'h4;
				r_sorter_op <= 1'b0;
				r_o_x_length <= 1'b1;
         		r_o_y_length <= 1'b1;
			   r_i_q_encode       <= inst_in[97:94];
			   r_o_q_encode       <= inst_in[93:90];
			   r_addr_start_s <= 16'h1000;
			   r_act_mode <= 2'b10;
			   r_dot_en    <= 1'b0;
              r_dotacc_en <= 1'b0;
              r_actfun_en <= 1'b1;
			   */
			end	

			
		endcase
	end else begin
			  r_mode         <= r_mode        ;
		    r_addr_start_d <= r_addr_start_d;
		    r_addr_start_w <= r_addr_start_w;
		    r_addr_start_s <= r_addr_start_s;
		    r_addr_start_b <= r_addr_start_b;
		    r_buffer_flag  <= r_buffer_flag ;
		    r_i_x_length   <= r_i_x_length  ;
		    r_i_y_length   <= r_i_y_length  ;
		    r_i_piece_num  <= r_i_piece_num ;
		    r_tiling_type  <= r_tiling_type ;
		    r_part_num     <= r_part_num    ;
		    r_last_part    <= r_last_part   ;
		    r_i_line_size  <= r_i_line_size ;
		    r_o_x_length   <= r_o_x_length  ;
		    r_o_y_length   <= r_o_y_length  ;
		    r_o_piece_num  <= r_o_piece_num ;
		    r_kernel       <= r_kernel      ;
		    r_stride       <= r_stride      ;
		    r_pad          <= r_pad         ;
		    r_jump_length  <= r_jump_length ;
		    r_s_all_length <= r_s_all_length;
		    r_o_line_size  <= r_o_line_size ;
		    r_dma_mode     <= r_dma_mode    ;
		    r_src_start    <= r_src_start   ;
		    r_dest_start   <= r_dest_start  ;
		    r_d_lines      <= r_d_lines     ;
		   	r_be_stream    <= r_be_stream ;
	       // r_be_noblock   <= r_be_noblock; 
	        r_act_mode <= r_act_mode;
	        r_softmax_o_num     <= r_softmax_o_num    ;
	        r_softmax_i_num     <= r_softmax_i_num    ;
	        r_softmax_dest_addr <= r_softmax_dest_addr;
		      r_softmax_src_addr  <= r_softmax_src_addr ;
		      r_w_q_encode        <= r_w_q_encode;
			    r_i_q_encode        <= r_i_q_encode;
			    r_o_q_encode        <= r_o_q_encode;
			    r_avg_pool_coe <= r_avg_pool_coe;
			    r_addr_start_d <= r_addr_start_d ;
		    
		   
	end
end

endmodule
