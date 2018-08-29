`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/10 
// Design Name: 
// Module Name: IAGU
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
module IAGU (
    input i_clk  ,
    input i_rst_n,

    input [3:0] i_mode             ,  
    input i_sorter_op              ,
    input [15:0] i_Input_sorter_num, 
    input i_dot_en                 ,
    input i_dotacc_en              ,
    input i_actfun_en              ,
    input i_square_mode, 
    input i_src_from2buffer,
    input i_calculate_enable       ,
    input [15:0] i_addr_start_d    ,
    input [15:0] i_addr_start_d2    ,
    input [3:0] i_kernel           ,
    input [1:0] i_stride           ,
    input [1:0] i_pad              ,
    input [7:0] i_x_length         ,
    input [7:0] i_y_length         ,
    input [7:0] i_input_x_length   ,
    input [7:0] i_input_y_length   ,
    input [7:0] i_part_num         ,
    input [11:0] i_one_line_size   ,
    input [11:0] i_stride_jump_size,
    input i_b_first_tiling         ,
    input i_b_last_tiling          ,
    input [7:0] i_input_layers     ,
    input [7:0] i_output_layers    , 
    input [2:0] i_last_col_num     ,
   // input [1:0] i_buffer_flag,
    
    //NPE
    output o_pe_max_out,
    output o_pe_add_out,
    output o_sorter_out,
    output [4:0] last_line_sorter_num,
    output o_PE_DOT_out,
    output o_PE_DOTACC_out,
    // output o_pe_fc_out,
    
    // WAGU
    input  i_group_load_start,
    output o_precomp_rdy     ,
    output o_group_lead_end  ,
    
    output [11:0] o_iob_raddr ,
    output        o_iob_rd_en ,
    output [11:0] o_iob_raddr1 ,
    output        o_iob_rd_en1 ,
   // output        o_rsel,
    //output        o_wsel,
    output        o_iob_pad_en
);

    wire c_BaseAdderRdEn;
    wire [11:0] c_BaseAdder, c_InputCurCol;
    wire [1:0] c_PartFlag;
    wire [3:0] c_KerCol;
    wire c_BaseAdderEndf;
    wire c_ConvEndf;
    wire o_rsel;

    parameter PARA_MODE_CONV=4'd1;  
    parameter PARA_MODE_POOL=4'd4;
    parameter PARA_MODE_FC=  4'd2;
    parameter PARA_MODE_ADD=4'd3;
    parameter PARA_MODE_ACC=4'd5;
    parameter PARA_MODE_MATRIX= 4'd6;
    parameter PARA_MODE_DOT=    4'd7;
    parameter PARA_MODE_DOT_ACC=4'd8;

    wire c_iob_pool_pad_en, c_iob_conv_pad_en;
    wire c_iob_pool_rd_en, c_iob_conv_rd_en, c_iob_fc_rd_en, c_iob_add_rd_en, c_iob_sorter_rd_en,c_iob_dot_rd_en,c_iob_dot_acc_rd_en,c_iob_actfun_rd_en;
    wire [11:0] c_iob_pool_raddr, c_iob_conv_raddr, c_iob_fc_raddr, c_iob_add_raddr, c_iob_sorter_raddr,c_iob_dot_raddr,c_iob_dot_acc_raddr,c_iob_dot_raddr1,c_iob_dot_acc_raddr1,c_iob_actfun_raddr;

    //CHN:卷积控制模块--------------------------------------------
    wire c_conv_precomp_rdy;
    wire o_rsel_dot;
    wire o_rsel_dot_acc;
    IAGU_CONV_BADDR u_conv_base(
        .i_clk            (i_clk),
        .i_rst_n          (i_rst_n),

        .i_StartAdder     (i_addr_start_d[11:0]),
        .i_Input_PieceNum (i_input_layers),
        .i_Out_PieceNum   (i_output_layers),
        .i_Out_YLength    (i_y_length),
        .i_PartNum        (i_part_num[4:0]),

        .i_Input_YLength   (i_input_y_length),
        .i_Input_XLength   (i_input_x_length),
        .i_bFirstTiling    (i_b_first_tiling),
        .i_bLastTiling     (i_b_last_tiling),
        .i_OneLineSize     (i_one_line_size),       //CHN:�?行数据大�?=input_xlength*input_piece_num
        .i_StrideLineSize  (i_stride_jump_size),    //CHN:Stride行数据大�?=input_xlength*input_piece_num*Stride
        .i_Pad             (i_pad),
        .i_Stride          (i_stride),
        .i_kernel          (i_kernel),
        .i_Start           (i_calculate_enable&&(i_mode==PARA_MODE_CONV)),    //CHN:启动计算

        //CHN:同GROUP_ADDR接口
        .i_Fifo_REn    (c_BaseAdderRdEn),       //CHN:基地�?读使�?
        .o_BaseAddr    (c_BaseAdder),           //CHN:基地�?数据，FIFO接口show-ahead模式
        .o_InputCurCol (c_InputCurCol),
        .o_PartFlag    (c_PartFlag),            //CHN:'01'-first part; '10' mid part; '11'-last part;'00'unvalid
        .o_KerCol      (c_KerCol),
        .o_PreComp_Rdy (c_conv_precomp_rdy),    //CHN:基地�?就绪
        .o_Endf        (c_BaseAdderEndf)        //CHN:基地�?结束，表示内部FIFO
    );

    wire c_conv_group_lead_end;
    IAGU_CONV_GADDR u_group_addr(
        .i_clk            (i_clk),
        .i_rst_n          (i_rst_n),

        .i_Input_XLength  (i_input_x_length),
        .i_BaseAdder      (c_BaseAdder),
        .i_InputCurCol    (c_InputCurCol),
        .i_PartFlag       (c_PartFlag),
        .i_KerCol         (c_KerCol),
        .i_BaseAdderEndf  (c_BaseAdderEndf),
        .i_GroupStart     (i_group_load_start&&(i_mode==PARA_MODE_CONV)),
        .i_Stride         (i_stride),
        .i_AGUStart       (i_calculate_enable&&(i_mode==PARA_MODE_CONV)),
        .i_LastColNum     (i_last_col_num),
        .i_Pad            (i_pad),

        .o_Fifo_REn      (c_BaseAdderRdEn),
        .o_IOB_PadEn     (c_iob_conv_pad_en),        //CHN:指示当前地址为PAD
        .o_IOB_REn       (c_iob_conv_rd_en),         //CHN:指示读使�?
        .o_IOB_RAddr     (c_iob_conv_raddr),         //CHN:当前Group数据起始地址
        .o_GroupLoadEnd  (c_conv_group_lead_end),    //CHN:当前Group数据结束
        .o_AGU_Endf      (c_ConvEndf)                //CHN:AGU end flag
    );
    
    
    //CHN:POOL模块----------------------------------------------- 
    IAGU_POOL u_pool(
        .i_clk            (i_clk),
        .i_rst_n          (i_rst_n),

        .i_StartAdder     (i_addr_start_d[11:0]),
        .i_Input_PieceNum (i_input_layers),
        .i_Out_PieceNum   (i_output_layers),
        .i_Out_YLength    (i_y_length),
        .i_Out_XLength    (i_x_length),
        .i_Input_YLength  (i_input_y_length),
        .i_Input_XLength  (i_input_x_length),
        .i_bFirstTiling   (i_b_first_tiling),
        .i_bLastTiling    (i_b_last_tiling),
        .i_OneLineSize    (i_one_line_size),      
        .i_StrideLineSize (i_stride_jump_size),  
        .i_Pad            (i_pad),
        .i_Stride         (i_stride),
        .i_kernel         (i_kernel),
        .i_Start          (i_calculate_enable&&(i_mode==PARA_MODE_POOL || i_mode==PARA_MODE_ACC)),    //CHN:启动计算
        
         .o_IOB_REn       (c_iob_pool_rd_en),
         .o_IOB_PadEn     (c_iob_pool_pad_en),
         .o_IOB_RAddr     (c_iob_pool_raddr),
         .o_PE_POOL_out   (o_pe_max_out)
    );

    //CHN:FC模块-----------------------------------------------   
    wire c_fc_group_load_end;
    wire c_fc_precomp_rdy;
    IAGU_FC u_fc(
        .i_clk            (i_clk),
        .i_rst_n          (i_rst_n),

        .i_StartAdder     (i_addr_start_d[11:0]),
        .i_Input_PieceNum (i_input_layers),
        .i_Out_PieceNum   (i_output_layers),
        .i_bFirstTiling   (i_b_first_tiling),
        .i_bLastTiling    (i_b_last_tiling),
        .i_AGUStart       (i_calculate_enable&&(i_mode==PARA_MODE_FC || i_mode==PARA_MODE_MATRIX)),
        
        .i_GroupStart     (i_group_load_start&&(i_mode==PARA_MODE_FC|| i_mode==PARA_MODE_MATRIX)),
        .o_GroupLoadEnd   (c_fc_group_load_end),
        .o_PreComp_Rdy    (c_fc_precomp_rdy),
        
        .o_IOB_REn        (c_iob_fc_rd_en),
        .o_IOB_RAddr      (c_iob_fc_raddr)
        // .o_PE_Fc_out      (o_pe_fc_out)
    );

    //CHN:ADD模块-----------------------------------------------  
    IAGU_ADD u_add(
        .i_clk            (i_clk),
        .i_rst_n          (i_rst_n),

        .i_Input_PieceNum (i_input_layers),
        .i_Out_YLength    (i_y_length),
        .i_Out_XLength    (i_x_length),
        .i_AGUStart       (i_calculate_enable&&(i_mode==PARA_MODE_ADD)),

        .o_IOB_REn        (c_iob_add_rd_en),
        .o_IOB_RAddr      (c_iob_add_raddr),
        .o_PE_ADD_out     (o_pe_add_out)
    );

//////////////////////////////add by htt/////////////////////////////////////////////////
    IAGU_SORTER  u_IAGU_SORTER(
        .i_clk            (i_clk  ),
        .i_rst_n          (i_rst_n),
        .i_StartAdder     (i_addr_start_d[11:0]),
       // .i_Input_PieceNum (i_input_layers),
        .i_Input_sorter_num (i_Input_sorter_num),
        .i_AGUStart       (i_calculate_enable&&i_sorter_op),

        .o_IOB_REn        (c_iob_sorter_rd_en),
        .o_IOB_RAddr      (c_iob_sorter_raddr),
        .last_line_sorter_num(last_line_sorter_num),
        .o_sorter_out     (o_sorter_out)

    );
////////////////////////////////////////////////////////////////////////
IAGU_DOT U_IAGU_DOT (
    .i_clk                 (i_clk           ),
    .i_rst_n               (i_rst_n         ),
    .i_StartAdder          (i_addr_start_d    ),
    .i_StartAdder2          (i_addr_start_d2    ),
    //.i_Input_PieceNum      (i_input_layers),
    .i_Out_PieceNum        (i_output_layers  ),
    .i_bFirstTiling        (i_b_first_tiling  ),
    .i_bLastTiling         (i_b_last_tiling   ),
    .i_AGUStart            (i_calculate_enable&&i_dot_en      ), 
    .i_square_mode         (i_square_mode),
    .i_src_from2buffer(i_src_from2buffer),
    //.buffer_flag           (i_buffer_flag     ),
    .o_IOB_REn             (c_iob_dot_rd_en       ),
    .o_IOB_RAddr           (c_iob_dot_raddr     ),
    .o_IOB_REn1             (c_iob_dot_rd_en1       ),
    .o_IOB_RAddr1           (c_iob_dot_raddr1     ),
    .o_PE_DOT_out          (o_PE_DOT_out    )
);
/////////////////////////////////////////////////////////////////////
IAGU_DOTACC U_IAGU_DOTACC (
    .i_clk                 (i_clk           ),
    .i_rst_n               (i_rst_n         ),
    .i_StartAdder          (i_addr_start_d    ),
    .i_StartAdder2          (i_addr_start_d2    ),
    .i_Input_PieceNum      (i_input_layers),
    .i_Out_PieceNum        (i_output_layers  ),
    .i_bFirstTiling        (i_b_first_tiling  ),
    .i_bLastTiling         (i_b_last_tiling   ),
    .i_AGUStart            (i_calculate_enable&& i_dotacc_en     ),
    //.buffer_flag           (i_buffer_flag     ),
    .i_square_mode         (i_square_mode),
    .i_src_from2buffer(i_src_from2buffer),
    .o_IOB_REn             (c_iob_dot_acc_rd_en       ),
    .o_IOB_RAddr           (c_iob_dot_acc_raddr     ), 
    .o_IOB_REn1             (c_iob_dot_acc_rd_en1       ),
    .o_IOB_RAddr1           (c_iob_dot_acc_raddr1     ), 
    .o_PE_DOTACC_out       (o_PE_DOTACC_out )
);

iagu_actfun  U_IAGU_ACTFUN(
       .i_clk         (i_clk         ),
       .i_rst_n       (i_rst_n       ),
       .i_addr_start_d(i_addr_start_d[11:0]),
	     .i_i_piece_num (i_input_layers ) ,
	     .i_AGUStart    (i_calculate_enable&&i_actfun_en    )        ,
	     
	     .o_IOB_REn       (c_iob_actfun_rd_en      )  ,
       //.o_rsel          (o_rsel         ),
       .o_IOB_RAddr     (c_iob_actfun_raddr    ),
       .o_PE_ACTFUN_out (o_PE_ACTFUN_out)
	   );
/////////////////////////////////////////////////////////////////////
    
    assign o_iob_rd_en      =((~o_rsel) && (c_iob_conv_rd_en | c_iob_pool_rd_en | c_iob_fc_rd_en | c_iob_add_rd_en | c_iob_sorter_rd_en|c_iob_actfun_rd_en))| c_iob_dot_rd_en| c_iob_dot_acc_rd_en;
    assign o_iob_raddr      = c_iob_conv_raddr | c_iob_pool_raddr | c_iob_fc_raddr | c_iob_add_raddr | c_iob_sorter_raddr |c_iob_actfun_raddr|c_iob_dot_raddr |c_iob_dot_acc_raddr;
    assign o_iob_rd_en1      = (o_rsel &&(c_iob_conv_rd_en | c_iob_pool_rd_en | c_iob_fc_rd_en | c_iob_add_rd_en | c_iob_sorter_rd_en|c_iob_actfun_rd_en))| c_iob_dot_rd_en1| c_iob_dot_acc_rd_en1;
    assign o_iob_raddr1      = c_iob_conv_raddr | c_iob_pool_raddr | c_iob_fc_raddr | c_iob_add_raddr | c_iob_sorter_raddr |c_iob_actfun_raddr|c_iob_dot_raddr1|c_iob_dot_acc_raddr1;
    
    assign o_iob_pad_en     = c_iob_pool_pad_en | c_iob_conv_pad_en;
    assign o_precomp_rdy    = c_conv_precomp_rdy | c_fc_precomp_rdy;
    assign o_group_lead_end = c_conv_group_lead_end | c_fc_group_load_end;
    assign o_rsel = i_addr_start_d[12] ? 1'b1 : 1'b0;

endmodule
