module inst_ctrl(
//   sys ctrl
    input i_clk                 ,
    input i_rst_n               ,
    input i_start_npu           ,
    input i_stop_npu            ,
// inst buffer
    output [11:0] o_pc                  ,
    output o_instb_rd_en         ,
    input  [127:0] i_inst_in                ,
    input  i_inst_valid          ,
    
// dma    
		input  i_dma_finish          ,
    output [3:0] o_dma_mode            ,
    output [31:0] o_src_start           ,
    output [31:0] o_dest_start          ,
    output [31:0] o_d_lines             , 
    output o_be_stream           ,
    //output o_wb_line_type        ,
    output o_ex_dma              , 
    output o_npu_idle,
    output o_internal_stop,  
// npu_core
    output o_calculate_enable    ,
    input  i_calculate_end       ,
    output [2:0] o_mode,
    output [11:0] o_addr_start_d        ,
    output [11:0] o_addr_start_w        ,
    output [11:0] o_addr_start_s1       ,
    output [11:0] o_addr_start_s2       ,
    output [7:0] o_addr_start_b        ,
    output [1:0]  o_buffer_flag         ,
    output [7:0]  o_i_x_length      ,
    output [7:0]  o_i_y_length      ,
    output o_b_first_tiling      ,
    output o_b_last_tiling       ,
    output [7:0]  o_part_num            ,
    output [2:0]  o_last_part           ,
    output [7:0]  o_o_line_size       ,
    output [7:0]  o_o_x_length     ,
    output [7:0]  o_o_y_length     ,
    output [7:0]  o_o_piece_num    ,
    output [7:0]  o_i_piece_num     ,
    output [3:0]  o_kernel              ,
    output [1:0]  o_stride              ,
    output [1:0]  o_pad                 ,
    output [7:0]  o_jump_length         ,
    output [7:0]  o_i_line_size           ,
    output [15:0] o_s_all_length        ,
    output [1:0]  o_act_mode            ,
    output [7:0]  o_avg_pool_coe        ,
    output [3:0]  o_w_q_encode          ,
    output [3:0]  o_i_q_encode          ,
    output [3:0]  o_o_q_encode            ,
    output [7:0]  o_dma_i_line_size  ,
    output [1:0]  o_dma_i_stride     ,
    output [1:0]  o_dma_i_pad_num    ,
    output [15:0] o_Input_sorter_num,
    output o_sorter_op
   // output [2:0]  o_softmax_o_num       ,
   // output [15:0] o_softmax_i_num       ,
  //  output [11:0] o_softmax_dest_addr   ,
   // output [11:0] o_softmax_src_addr


);

wire          c_be_stream    ; 
wire          c_be_noblock   ; 
wire      [4:0]   c_opcode   ;
wire      [11:0] c_jump_pc;
wire      c_wait_last_noblock_dma;
wire      c_err_inst;



decoder u_decoder (
	.i_clk(i_clk),
	.i_rst_n  (i_rst_n  ),
	.clr    (i_start_npu|i_dma_finish   ),

	.inst_in    (i_inst_in   ),
	.inst_valid (i_inst_valid),

	.opcode  (c_opcode),
	.o_mode    (o_mode  ),

	.o_addr_start_d (o_addr_start_d),
	.o_addr_start_w (o_addr_start_w),
	.o_addr_start_s (o_addr_start_s1),
	.o_addr_start_s2 (o_addr_start_s2),
	.o_addr_start_b (o_addr_start_b),
	.o_buffer_flag  (o_buffer_flag ),

	.o_i_x_length (o_i_x_length ),
	.o_i_y_length (o_i_y_length ),
	.o_i_piece_num(o_i_piece_num),

	.o_b_first_tiling (o_b_first_tiling),///////////////////add
	.o_b_last_tiling  (o_b_last_tiling),//////////////need add
	.o_part_num    (o_part_num   ), 
	.o_last_part   (o_last_part  ),
	.o_i_line_size (o_i_line_size),

	.o_o_x_length  (o_o_x_length ),
	.o_o_y_length  (o_o_y_length ),
	.o_o_piece_num (o_o_piece_num),

	.o_kernel(o_kernel),
	.o_stride(o_stride),
	.o_pad   (o_pad   ),

	.r_jump_length (o_jump_length ),
	.o_o_line_size (o_o_line_size ),
	.o_s_all_length(o_s_all_length),

	.o_avg_pool_coe(o_avg_pool_coe),
	.o_w_q_encode  (o_w_q_encode  ),
	.o_i_q_encode  (o_i_q_encode  ),
	.o_o_q_encode  (o_o_q_encode  ),

	//.o_softmax_o_num    (o_softmax_o_num    ),
	//.o_softmax_i_num    (o_softmax_i_num    ),
	//.o_softmax_dest_addr(o_softmax_dest_addr),
	//.o_softmax_src_addr (o_softmax_src_addr ),
	.o_sorter_op(o_sorter_op),
	.o_Input_sorter_num(o_Input_sorter_num),

	.o_dma_mode  (o_dma_mode  ),
	.o_src_start (o_src_start ),
	.o_dest_start(o_dest_start),
	.o_d_lines   (o_d_lines   ),
	.o_jump_pc                (c_jump_pc              ),
	.o_wait_last_noblock_dma  (c_wait_last_noblock_dma),
	.o_be_noblock             (c_be_noblock           ),
        .o_be_stream (o_be_stream ),
	.o_err_inst               (c_err_inst             ),
	.o_dma_i_line_size   (o_dma_i_line_size),
	.o_dma_i_stride      (o_dma_i_stride   ),
	.o_dma_i_pad_num     (o_dma_i_pad_num  ),
	.o_act_mode (o_act_mode)
		
);

shcedule u_shcedule( 

		.i_clk                    (i_clk                  ) ,
		.i_rst_n                  (i_rst_n                ) ,
		.i_start                  (i_start_npu                ) ,
		.i_stop                   (i_stop_npu                 ) ,
		.i_inst_valid             (i_inst_valid           ) ,
		.i_dma_finish             (i_dma_finish           ) ,
		.i_calculate_end          (i_calculate_end        ) ,
		.i_opcode                 (c_opcode               ) , 
		.i_jump_pc                (c_jump_pc              ) ,
		.i_wait_last_noblock_dma  (c_wait_last_noblock_dma) ,
		.i_be_noblock             (c_be_noblock           ) ,
		.i_err_inst               (c_err_inst             ) ,
		.o_pc                     (o_pc                   ) ,
		.o_inst_buffer_en         (o_instb_rd_en       ) ,
		.o_calculate_enable       (o_calculate_enable     ) ,
		.o_npu_idle               (o_npu_idle             ) ,
		.o_internal_stop          (o_internal_stop        ) ,
		.o_ex_dma                 (o_ex_dma               )
);

endmodule
