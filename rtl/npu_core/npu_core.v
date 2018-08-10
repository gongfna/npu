`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/24 19:27:55
// Design Name: 
// Module Name: npe_core_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module npu_core
   (
    input i_clk,
    input i_rst_n,

    
    input i_start_npu,
    input i_stop_npu ,
      
    output [31:0] o_src_start  ,
    output [31:0] o_dest_start ,
    output [31:0] o_d_lines    , 
    output [3:0] o_dma_mode,
    output o_ex_dma,
	output [7:0] o_dma_i_line_size, 
    output [1:0] o_dma_i_stride, 
    output [1:0] o_dma_i_pad_num, 
	output o_be_stream, 
    input i_dma_finish, 
    
    output o_npu_idle,        
    output o_internal_stop,
    
    
    

    //input          i_iob_0_ext_en,
    // (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC NONE,MEM_WIDTH 256,MEM_SIZE 131072,READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_0 EN" *)
    input          i_iob_0_bramctl_en, // Chip Enable Signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_0 DOUT" *)
    output [255:0] o_iob_0_bramctl_rdata, // Data Out Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_0 DIN" *)
    input [255:0]  i_iob_0_bramctl_wdata, // Data In Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_0 WE" *)
    input          i_iob_0_bramctl_we, // Byte Enables (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_0 ADDR" *)
    input [31:0]   i_iob_0_bramctl_be, // Byte Enables (optional)
    input [11:0]   i_iob_0_bramctl_addr, // Address Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_0 CLK" *)
    input          i_iob_0_bramctl_s_clk, // Clock Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_0 RST" *)
    input          i_iob_0_bramctl_s_rst, // Reset Signal (required)

    //input          i_iob_1_ext_en,
    // (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC NONE,MEM_WIDTH 256,MEM_SIZE 131072,READ_WRITE_MODE READ_WRITE" *)\
    (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_1 EN" *)
    input          i_iob_1_bramctl_en, // Chip Enable Signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_1 DOUT" *)
    output [255:0] o_iob_1_bramctl_rdata, // Data Out Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_1 DIN" *)
    input [255:0]  i_iob_1_bramctl_wdata, // Data In Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_1 WE" *)
    input          i_iob_1_bramctl_we, // Byte Enables (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_1 ADDR" *)
    input [31:0]   i_iob_1_bramctl_be, // Byte Enables (optional)
    input [11:0]   i_iob_1_bramctl_addr, // Address Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_1 CLK" *)
    input          i_iob_1_bramctl_s_clk, // Clock Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 IOB_BRAM_1 RST" *)
    input          i_iob_1_bramctl_s_rst, // Reset Signal (required)

    //input [12:0]   i_wb_start_addr    ,
    //input          i_wb_start_addr_en ,
    // (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC NONE,MEM_WIDTH 32,MEM_SIZE 212992,READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WB_BRAM EN" *)
    input          i_wb_bramctl_en, // Chip Enable Signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WB_BRAM DOUT" *)
    output [415:0]  o_wb_bramctl_rdata, // Data Out Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WB_BRAM DIN" *)
    input [415:0]   i_wb_bramctl_wdata, // Data In Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WB_BRAM WE" *)
    input          i_wb_bramctl_we, // Byte Enables (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WB_BRAM ADDR" *)
    input  [51:0]   i_wb_bramctl_be, // Byte Enables (optional)
    input [12:0]   i_wb_bramctl_addr, // Address Signal (required)                                  
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WB_BRAM CLK" *)
    input          i_wb_bramctl_s_clk, // Clock Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WB_BRAM RST" *)
    input          i_wb_bramctl_s_rst, // Reset Signal (required)

    // (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC NONE,MEM_WIDTH 32,MEM_SIZE 4096,READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WIB_BRAM EN" *)
    input          i_wib_bramctl_en, // Chip Enable Signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WIB_BRAM DOUT" *)
    output[31:0]   o_wib_bramctl_rdata, // Data Out Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WIB_BRAM DIN" *)
    input [31:0]   i_wib_bramctl_wdata, // Data In Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WIB_BRAM WE" *)
    input          i_wib_bramctl_we, // Byte Enables (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WIB_BRAM ADDR" *)
    input [3:0]    i_wib_bramctl_be, // Byte Enables (optional)
    input [9:0]   i_wib_bramctl_addr, // Address Signal (required)                
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WIB_BRAM CLK" *)
    input          i_wib_bramctl_s_clk, // Clock Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 WIB_BRAM RST" *)
    input          i_wib_bramctl_s_rst,  // Reset Signal (required)


    input          i_lstmb_bramctl_en, // Chip Enable Signal (optional)
    output[31:0]   o_lstmb_bramctl_rdata, // Data Out Bus (optional)
    input [31:0]   i_lstmb_bramctl_wdata, // Data In Bus (optional)
    input          i_lstmb_bramctl_we, // Byte Enables (optional)
    input [3:0]    i_lstmb_bramctl_be, // Byte Enables (optional)
    input [4:0]    i_lstmb_bramctl_addr, // Address Signal (required)                
    input          i_lstmb_bramctl_s_clk, // Clock Signal (required)
    input          i_lstmb_bramctl_s_rst,  // Reset Signal (required)

    // (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC NONE,MEM_WIDTH 32,MEM_SIZE 4096,READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BIAS_BRAM EN" *)
    input          i_bias_bramctl_en, // Chip Enable Signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BIAS_BRAM DOUT" *)
    output[511:0]   o_bias_bramctl_rdata, // Data Out Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BIAS_BRAM DIN" *)
    input [511:0]   i_bias_bramctl_wdata, // Data In Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BIAS_BRAM WE" *)
    input           i_bias_bramctl_we, // Byte Enables (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BIAS_BRAM ADDR" *)
    input [63:0]    i_bias_bramctl_be, // Byte Enables (optional)
    input [6:0]   i_bias_bramctl_addr, // Address Signal (required)                
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BIAS_BRAM CLK" *)
    input          i_bias_bramctl_s_clk, // Clock Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BIAS_BRAM RST" *)
    input          i_bias_bramctl_s_rst,  // Reset Signal (required) 
    
     // (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC NONE,MEM_WIDTH 128,MEM_SIZE 4096,READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 INST_BRAM EN" *)
    input          i_inst_bramctl_en, // Chip Enable Signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 INST_BRAM DOUT" *)
    output[127:0]   o_inst_bramctl_rdata, // Data Out Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 INST_BRAM DIN" *)
    input [127:0]   i_inst_bramctl_wdata, // Data In Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 INST_BRAM WE" *)
    input     i_inst_bramctl_we, // Byte Enables (optional)
    input  [15:0]  i_inst_bramctl_be   ,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 INST_BRAM ADDR" *)
    input [11:0]   i_inst_bramctl_addr, // Address Signal (required)                
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 INST_BRAM CLK" *)
    input          i_inst_bramctl_s_clk, // Clock Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 INST_BRAM RST" *)
    input          i_inst_bramctl_s_rst  // Reset Signal (required) 
     

  );
    wire [2:0]c_mode;
    reg r_enable;   
    wire [11:0]c_addr_start_d,c_addr_start_s;
    wire [1:0]c_pad;
    wire [3:0]c_kernel;
    wire [1:0]c_stride;
    wire [7:0]c_o_x_length,c_i_x_length;
    wire [7:0]c_o_y_length,c_i_y_length;
    wire [7:0]c_part_num;
    wire [11:0]c_one_line_size;
    wire [11:0]c_stride_jump_size;
    wire c_b_first_tiling,c_b_last_tiling;
    wire [7:0]c_i_piece_num,c_o_piece_num;
    wire [2:0]c_last_col_num;
  	
    wire [15:0]c_s_all_length;
    wire [7:0]c_jump_length; 
    
   // wire [1:0] c_act_mode;
    wire [3:0] c_i_q_encode;
    wire [3:0] c_w_q_encode;
    wire [3:0] c_o_q_encode;
    
    integer allcount;   
    wire [11:0]c_addr_start_w;
    wire [7:0]  c_addr_start_b; 
    wire  [11:0] c_addr_start_s1 ;
    wire  [11:0] c_addr_start_s2 ;
    
    
    wire  [127:0] c_inst  ;     
    wire  c_inst_valid    ;
    wire  [11:0] c_pc     ;    
    wire  c_instb_rd_en   ;
    wire  c_buffer_flag   ;
    wire  [2:0] c_last_part     ;  
    wire  [1:0] c_act_mode  ;
    wire  [7:0] c_avg_pool_coe;////////////////add where
    
    
    //CHN:同io_ram的接卿
    wire [11:0]  o_iob_raddr  ;
    wire         o_iob_rd_en  ;
    wire         o_iob_pad_en ;
    wire [11:0]  o_iob_waddr  ;
    wire         o_iob_wr_en  ;
    wire [255:0] o_iob_wdat	  ;
    wire [32*8-1:0] i_mdata_0,i_mdata_1;
    wire i_mdata_vld_0,i_mdata_vld_1;
    wire c_rwsel;
    //CHN:同wb_ram的接卿
    wire [32*(8+5)-1:0] i_wdata ;
    wire i_wdata_vld;
    wire [12:0] o_wb_raddr;
    wire o_wb_rd_en;
    
    //CHN:bias_ram接口
    wire [6:0] o_ram_addr;
    wire [511:0] i_ram_dat;
    wire o_ram_rd_en;
    wire i_ram_dat_vld;   

    //CHN:WIB_ram接口
    wire [18:0] i_wib_rdat;
    wire i_wib_rdat_vld;
    wire [9:0] o_wib_raddr;
    wire o_wib_rd_en;  

    reg r_caculate_enable;
    reg r_i_caculate_enable_buf; 
    
    wire  o_calculate_enable ;
    wire  i_calculate_end    ;
    
    wire  c_sorter_op ;
    wire [7:0] c_o_line_size;
    wire [15:0] c_Input_sorter_num;    

   // `include "../../../../../../test_bench/config.v"
    // //网络参数配置
    
    // assign c_mode             = 1;        //NPU工作模式: 1:CONV 2:POOL 3:FC 4:ADD
    // assign c_addr_start_s     = 0;        //Output Buffer起始地址
    // assign c_addr_start_d     = 0;        //input Buffer起始地址
    // assign c_addr_start_w     = 0;        //Weight Buffer起始地址
    // assign c_addr_start_b     = 0;
    // /* kernel parameters */
    // assign c_pad              = 0;
    // assign c_kernel           = 4;
    // assign c_stride           = 1;
    // /*tiling parameters */
    // assign c_out_x_length     = 112;
    // assign c_out_y_length     = 14;
    // assign c_input_x_length   = 115;
    // assign c_input_y_length   = 17;
    // assign c_part_num         = 16;
    // assign c_b_first_tiling   = 15;
    // assign c_b_last_tiling    = 0;
    // assign c_input_layers     = 1;
    // assign c_output_layers    = 2;
    // assign c_last_col_num     = 7;
    // /* rounding parameters */
    // assign c_i_q_encode       = 7;
    // assign c_w_q_encode       = 7;
    // assign c_o_q_encode       = 6;
    
    // assign c_xpe_mode            = 1;

    /* IO AGU parameter */
    assign c_rwsel            = c_buffer_flag ? 1'b0 : 1'b1;
    assign c_one_line_size    = c_i_piece_num*c_i_x_length;
    assign c_stride_jump_size = c_one_line_size*c_stride;
  //  assign c_sorter_op = 1'b0 ;

    assign c_store_length = 0;
   // assign c_jump_length  = 0;
    
      inst_ctrl  U_INST_CTRL(
//   sys ctrl
    .i_clk        (i_clk      )         ,
    .i_rst_n      (i_rst_n    )         ,
    .i_start_npu  (i_start_npu)         ,
    .i_stop_npu   (i_stop_npu )         ,
// inst buffer
    .o_pc          (c_pc         )        ,
    .o_instb_rd_en (c_instb_rd_en)        ,
    .i_inst_in        (c_inst       )        ,
    .i_inst_valid  (c_inst_valid )        ,
    
// dma    
		.i_dma_finish      (i_dma_finish   )    ,
    .o_dma_mode        (o_dma_mode     )    ,
    .o_src_start       (o_src_start    )    ,
    .o_dest_start      (o_dest_start   )    ,
    .o_d_lines         (o_d_lines      )    , 
    .o_be_stream       (o_be_stream    )    ,
   // .o_wb_line_type    (o_wb_line_type )    ,
    .o_ex_dma          (o_ex_dma       )    , 
    .o_npu_idle        (o_npu_idle     )    ,
    .o_internal_stop   (o_internal_stop)    ,  
    .o_dma_i_line_size(o_dma_i_line_size), 
    .o_dma_i_stride(o_dma_i_stride), 
    .o_dma_i_pad_num(o_dma_i_pad_num), 
// npu_core
    .o_calculate_enable   (o_calculate_enable ) ,
    .i_calculate_end      (o_calculate_end    ) ,
    .o_mode(c_mode),
    .o_addr_start_d       (c_addr_start_d     ) ,
    .o_addr_start_w       (c_addr_start_w     ) ,
    .o_addr_start_s1      (c_addr_start_s1    ) ,
    .o_addr_start_s2      (c_addr_start_s2    ) ,
    .o_addr_start_b       (c_addr_start_b     ) ,
    .o_buffer_flag        (c_buffer_flag      ) ,
    .o_i_x_length         (c_i_x_length   ) ,
    .o_i_y_length         (c_i_y_length   ) ,
   // .o_o_piece_num          (o_piece_num        ) ,
    .o_b_first_tiling     (c_b_first_tiling   ) ,
    .o_b_last_tiling      (c_b_last_tiling    ) ,
    .o_part_num           (c_part_num         ) ,
    .o_last_part          (c_last_part        ) ,
    .o_o_line_size      (c_o_line_size    ) ,
    .o_o_x_length    (c_o_x_length  ) ,
    .o_o_y_length    (c_o_y_length  ) ,
    .o_o_piece_num   (c_o_piece_num ) ,
    .o_i_piece_num    (c_i_piece_num  ) ,
    .o_kernel             (c_kernel           ) ,
    .o_stride             (c_stride           ) ,
    .o_pad                (c_pad              ) ,
    .o_jump_length        (c_jump_length      ) ,
    .o_i_line_size          (c_i_line_size        ) ,
    .o_s_all_length       (c_s_all_length     ) ,
    .o_act_mode           (c_act_mode         ) ,
    .o_avg_pool_coe       (c_avg_pool_coe     ) ,
    .o_w_q_encode         (c_w_q_encode       ) ,
    .o_i_q_encode         (c_i_q_encode       ) ,
    .o_o_q_encode         (c_o_q_encode       )   ,
    .o_Input_sorter_num   (c_Input_sorter_num),
     .o_sorter_op (c_sorter_op)
    //.o_softmax_o_num      (c_softmax_o_num    ) ,
    //.o_softmax_i_num      (c_softmax_i_num    ) ,
   // .o_softmax_dest_addr  (c_softmax_dest_addr) ,
    //.o_softmax_src_addr   (c_softmax_src_addr )


);

    inst_buffer 
	#(.REG_OUT(1'b0))
	U_INST(
    .i_clk  (i_clk  ),
    .i_rst_n(i_rst_n),
    //内部逻辑接口
    .o_inst_rdat      (c_inst          ),
    .o_inst_rdat_vld  (c_inst_valid    ),
    .i_inst_raddr     (c_pc            ),
    .i_inst_rd_en     (c_instb_rd_en   ),
    //external data input port for axi bram controller
    .i_inst_bramctl_wdata(i_inst_bramctl_wdata),
    .o_inst_bramctl_rdata(o_inst_bramctl_rdata),
    .i_inst_bramctl_addr (i_inst_bramctl_addr ),
    .i_inst_bramctl_we   (i_inst_bramctl_we   ),
    .i_inst_bramctl_be   (i_inst_bramctl_be   ),
    .i_inst_bramctl_en   (i_inst_bramctl_en   )
);

    io_buffer #(
        .INIT_FILE()
	,.REG_OUT(1'b0)
    ) U_IORAM_0 (
        .i_clk   (i_clk),
        .i_rst_n (i_rst_n),

        //外部AXI总线接口
        .i_iob_bramctl_addr (i_iob_0_bramctl_addr ),
        .i_iob_bramctl_en   (i_iob_0_bramctl_en   ),
        .o_iob_bramctl_rdata(o_iob_0_bramctl_rdata),
        .i_iob_bramctl_we   (i_iob_0_bramctl_we   ),
		.i_iob_bramctl_be   (i_iob_0_bramctl_be), 
        .i_iob_bramctl_wdata(i_iob_0_bramctl_wdata),
        
        //外部接口使能
        .i_iob_ext_en (i_iob_0_bramctl_en),
    
        //内部逻辑接口
        .i_iob_raddr  (o_iob_raddr),
        .i_iob_rd_en  (o_iob_rd_en),
        .i_iob_pad_en (o_iob_pad_en),
        .i_iob_waddr  (o_iob_waddr),
        .i_iob_wr_en  (o_iob_wr_en),
        .i_iob_wdat	  (o_iob_wdat),
        .i_rwsel      (c_rwsel),
        .o_mdata      (i_mdata_0),
        .o_mdata_vld  (i_mdata_vld_0)
    );

    io_buffer #(
        .INIT_FILE()
	,.REG_OUT(1'b0)
    ) U_IORAM_1 (
        .i_clk   (i_clk),
        .i_rst_n (i_rst_n),

        //外部AXI总线接口
        .i_iob_bramctl_addr (i_iob_1_bramctl_addr ),
        .i_iob_bramctl_en   (i_iob_1_bramctl_en   ),
        .o_iob_bramctl_rdata(o_iob_1_bramctl_rdata),
        .i_iob_bramctl_we   (i_iob_1_bramctl_we   ),
		.i_iob_bramctl_be   (i_iob_1_bramctl_be), 
        .i_iob_bramctl_wdata(i_iob_1_bramctl_wdata),
    
        //外部接口使能
        .i_iob_ext_en   (i_iob_1_bramctl_en),

        //内部逻辑接口
        .i_iob_raddr    (o_iob_raddr),
        .i_iob_rd_en    (o_iob_rd_en),
        .i_iob_pad_en   (o_iob_pad_en),
        .i_iob_waddr    (o_iob_waddr),
        .i_iob_wr_en    (o_iob_wr_en),
        .i_iob_wdat     (o_iob_wdat),
        .i_rwsel        (~c_rwsel),
    	.o_mdata        (i_mdata_1),
    	.o_mdata_vld    (i_mdata_vld_1)
    ); 
			
    wb_buffer#(
        // Specify name/location of RAM initialization file if using one (leave blank if not)
        .INIT_FILE0  ( ),
        .INIT_FILE1  ( ),
        .INIT_FILE2  ( ),
        .INIT_FILE3  ( ),
        .INIT_FILE4  ( ),
        .INIT_FILE5  ( ),
        .INIT_FILE6  ( ),
        .INIT_FILE7  ( ),
        .INIT_FILE8  ( ),
        .INIT_FILE9  ( ),
        .INIT_FILE10 ( ),
        .INIT_FILE11 ( ),
        .INIT_FILE12 ( )
	,.REG_OUT(1'b0)
    )U_WB(
        .i_clk  (i_clk),
        .i_rst_n(i_rst_n),
        //内部逻辑接口
        .o_wdata     (i_wdata),
        .o_wdata_vld (i_wdata_vld),
        .i_wb_raddr  (o_wb_raddr),
        .i_wb_rd_en  (o_wb_rd_en),
        .i_bypass_wb          (o_bypass_wb),

        .i_wb_bramctl_wdata(i_wb_bramctl_wdata),
        .o_wb_bramctl_rdata(o_wb_bramctl_rdata),
        .i_wb_bramctl_addr (i_wb_bramctl_addr ),
        .i_wb_bramctl_we   (i_wb_bramctl_we   ),
        .i_wb_bramctl_be   (i_wb_bramctl_be   ),
        .i_wb_bramctl_en   (i_wb_bramctl_en   ),
        .i_wb_start_addr   (/*i_wb_start_addr*/13'h0   ),
        .i_wb_start_addr_en(i_wb_start_addr_en)
    );

    wib_buffer#(
        .INIT_FILE_B( )
	,.REG_OUT(1'b0)
    )U_WIB(
        .i_clk  (i_clk),
        .i_rst_n(i_rst_n),
        //内部逻辑接口
        .o_wib_rdat       (i_wib_rdat)    ,
        .o_wib_rdat_vld   (i_wib_rdat_vld),
        .i_wib_raddr      (o_wib_raddr)   ,
        .i_wib_rd_en      (o_wib_rd_en)   ,
        //external data input port for axi bram controller
        .i_wib_bramctl_wdata(i_wib_bramctl_wdata),
        .o_wib_bramctl_rdata(o_wib_bramctl_rdata),
        .i_wib_bramctl_addr (i_wib_bramctl_addr ),
        .i_wib_bramctl_we   (i_wib_bramctl_we   ),
        .i_wib_bramctl_be   (i_wib_bramctl_be   ),
        .i_wib_bramctl_en   (i_wib_bramctl_en   )
    );			
			
    // bias
    bias_buffer#(
        .BIAS_INIT_FILE( )
	,.REG_OUT(1'b0)
        )U_BIAS(
        .i_clk      (i_clk),
        .i_rst_n    (i_rst_n),
        //external data input port for axi bram controller
        .i_bias_bramctl_addr (i_bias_bramctl_addr ),
        .i_bias_bramctl_en   (i_bias_bramctl_en   ),
        .o_bias_bramctl_rdata(o_bias_bramctl_rdata),
        .i_bias_bramctl_we   (i_bias_bramctl_we   ),
        .i_bias_bramctl_be   (i_bias_bramctl_be   ),
        .i_bias_bramctl_wdata(i_bias_bramctl_wdata),    
        //internel bias buffer port
        .i_ram_addr (o_ram_addr),
        .i_ram_rd_en(o_ram_rd_en),
        .o_ram_dat  (i_ram_dat),
        .o_ram_dat_vld(i_ram_dat_vld)
    );
   // assign i_ram_dat=256'd0;

    always@(posedge i_clk or negedge i_rst_n) begin
        if(i_rst_n==0)begin
            r_caculate_enable <=1'b0;
        end else if((o_calculate_enable==1)&&(r_i_caculate_enable_buf==0)) begin
            r_caculate_enable <=1'b1;
        end else begin
            r_caculate_enable <=1'b0;
        end
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (i_rst_n==0) begin
            r_i_caculate_enable_buf <=1'b0;
        end else begin
            r_i_caculate_enable_buf <=o_calculate_enable;
        end
    end

    npe_top U_NPE_TOP(
        .i_clk  (i_clk),
        .i_rst_n(i_rst_n),
        //CHN:同controler的接卿
        .i_mode             (c_mode),
        .i_sorter_op (c_sorter_op),
        .i_Input_sorter_num(c_Input_sorter_num),
        .i_calculate_enable (r_caculate_enable),
        .i_addr_start_w     ({1'b0,c_addr_start_w}),
        .i_addr_start_s     (c_addr_start_s1),
        .i_addr_start_d     (c_addr_start_d),
        .i_addr_start_b     (c_addr_start_b),
        .i_kernel           (c_kernel),
        .i_stride           (c_stride),
        .i_pad              (c_pad),
        .i_x_length         (c_o_x_length),
        .i_y_length         (c_o_y_length),
        .i_input_x_length   (c_i_x_length),
        .i_input_y_length   (c_i_y_length),
        .i_part_num         (c_part_num),
        .i_one_line_size    (c_one_line_size),///////////////???????????????????
        .i_stride_jump_size (c_stride_jump_size),
        .i_b_first_tiling   (c_b_first_tiling),
        .i_b_last_tiling    (c_b_last_tiling),
        .i_input_layers     (c_i_piece_num),
        .i_output_layers    (c_o_piece_num),
        .i_last_col_num     (c_last_part),
        .i_store_length     (c_o_line_size),
        .i_jump_length      (c_jump_length),
        .o_calculate_end    (o_calculate_end),
        .i_xpe_mode         (c_act_mode),
        .i_i_q_encode       (c_i_q_encode),
        .i_w_q_encode       (c_w_q_encode),
        .i_o_q_encode       (c_o_q_encode),
        .i_avg_pooling_coe (c_avg_pool_coe),
        //CHN:同io_ram的接卿
        .o_iob_raddr        (o_iob_raddr),
        .o_iob_rd_en        (o_iob_rd_en),
        .o_iob_pad_en       (o_iob_pad_en),
        .o_iob_waddr        (o_iob_waddr),
        .o_iob_wr_en        (o_iob_wr_en),
        .o_iob_wdat         (o_iob_wdat),
        .i_mdata            (i_mdata_0|i_mdata_1),
        .i_mdata_vld        (i_mdata_vld_0|i_mdata_vld_1),
        //CHN:同wb_ram的接卿
        .i_wdata            (i_wdata),
        .i_wdata_vld        (i_wdata_vld),
        .o_wb_raddr         (o_wb_raddr),
        .o_wb_rd_en         (o_wb_rd_en),
        .o_bypass_wb          (o_bypass_wb),
        //CHN:bias_ram接口
        .o_ram_addr         (o_ram_addr),
        .i_ram_dat_vld      (i_ram_dat_vld),
        .i_ram_dat          (i_ram_dat),
        .o_ram_rd_en        (o_ram_rd_en),
        //CHN:WIB_ram接口
        .i_wib_rdat         (i_wib_rdat),
        .i_wib_rdat_vld     (i_wib_rdat_vld),
        .o_wib_raddr        (o_wib_raddr),
        .o_wib_rd_en        (o_wib_rd_en)  
    );
			
endmodule
