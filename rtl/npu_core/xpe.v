`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: wuzhi
// 
// Create Date: 2018/01/09 22:14:00
// Design Name: 
// Module Name: xpe
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
/*2018-2-5,wuzhi,CHN:round_32x16b模块增加功能，消耗一拍时钟，o_xpe_dat_vld改为打三�?
*/
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module xpe #(
    parameter RAM_ADDR_WIDTH=8
)
(
    input i_clk  ,
    input i_rst_n,
    
    input [3:0] i_mode         ,
    input [1:0] i_xpe_mode     ,
    input i_sorter_op          ,
    input i_dot_en,
    input i_dotacc_en,
    input i_actfun_en,
    input [7:0] i_addr_start_b ,
    input [7:0] i_part_num     ,
    input       i_pe_out_en    ,
    input [7:0] i_output_layers,
    input       i_calculate_end,
    input [3:0] i_q_encode     ,
    input [3:0] w_q_encode     ,
    input [3:0] o_q_encode     ,
    input i_calc_en            ,
    input [511:0] i_npe_dat_out,
    input i_npe_dat_vld        ,
    input [511:0] i_ram_dat    ,
    input i_ram_dat_vld        ,
    input [255:0] i_mdata,
    input i_mdata_vld,
    //input i_act_fun,

    input [7:0] i_avg_pooling_coe,
    input [23:0] i_lut_bramctl_wdata,                                                                                                  
    input [3:0]  i_lut_bramctl_addr ,                                                                                                  
    input   i_lut_bramctl_we   ,                                                                                                  
    input        i_lut_bramctl_en   ,
    
    output [255:0] o_xpe_dat_out          ,
    output o_xpe_dat_vld                  ,
    output [RAM_ADDR_WIDTH-1:0] o_ram_addr,
    output o_ram_rd_en
);
    
    parameter PARA_MODE_CONV=4'd1;  
    parameter PARA_MODE_POOL=4'd4;
    parameter PARA_MODE_FC=4'd2;
    parameter PARA_MODE_ADD=4'd3;
    parameter PARA_MODE_AVG_POOL=4'd5;
    parameter PARA_MODE_MATRIX = 4'd6;////////////////
    parameter PARA_MODE_DOTACC = 4'd8;

    parameter PARA_NOACT=2'd0;
    parameter PARA_RELU=2'd1;
    parameter PARA_SIGMOID=2'd2;
    parameter PARA_TANH=2'd3;

    //module bias interface
    wire [511:0] o_bias_dat_o;
    wire [511:0] o_relu_dat;
    wire         c_bias_en;
    wire [255:0] round_xpe_dat_out;
    wire [511:0] i_relu_dat;
    wire [511:0] i_mdata_ex;
    wire [255:0] o_relu_out;
    wire [255:0] i_actSH_dat;
    wire c_act_xpe_dat_vld;
    wire [255:0] round_out_1;
    wire [511:0] o_avg_mul_result;
    wire [511:0] o_act_fun_dat;
    wire [511:0] i_final_round = i_mode==PARA_MODE_AVG_POOL ? o_avg_mul_result : ((i_mode==PARA_MODE_MATRIX || i_dotacc_en || ((i_xpe_mode == 2'b10||i_xpe_mode == 2'b11)&&i_actfun_en)) ? o_act_fun_dat: o_relu_dat );
    wire [3:0] using_i_q_encode;
    wire [3:0] using_w_q_encode;
    wire [3:0] using_o_q_encode;
    wire [1:0] using_round_mode;
    wire [31:0]  c_max_value_en;
    wire [31:0]  c_min_value_en;
    reg [255:0] r_round_out_1;
    reg r_npe_dat_vld_r;
    reg r_npe_dat_vld_r1;
    reg r_npe_dat_vld_r2;
    reg r_npe_dat_vld_r3;
    reg r_npe_dat_vld_r4;
    reg r_npe_dat_vld_r5;
    
    assign c_bias_en = (i_mode==PARA_MODE_CONV || i_mode==PARA_MODE_FC || i_mode==PARA_MODE_MATRIX);
    assign i_shift_en = (i_mode==PARA_MODE_ADD) ? 1'b0 : 1'b1;
    assign bypass_xpe = |{ i_sorter_op ,i_mode==PARA_MODE_POOL }; 
    assign o_xpe_dat_vld = i_actfun_en ? c_act_xpe_dat_vld :(bypass_xpe ? i_npe_dat_vld :
    (i_dotacc_en ? (i_xpe_mode == PARA_NOACT ? r_npe_dat_vld_r1 :(r_npe_dat_vld_r4|r_npe_dat_vld_r1)):
    (i_mode==PARA_MODE_MATRIX ? r_npe_dat_vld_r4 : 
    (i_mode==PARA_MODE_AVG_POOL ? r_npe_dat_vld_r2 :
     r_npe_dat_vld_r1))));
     assign c_act_xpe_dat_vld = i_xpe_mode == PARA_RELU ? r_npe_dat_vld_r : r_npe_dat_vld_r3;
     assign o_xpe_dat_out = bypass_xpe ? i_npe_dat_out[255:0] : (((i_xpe_mode == 2'b00)&&i_actfun_en) ? o_relu_out :(((i_dotacc_en &&r_npe_dat_vld_r1 ) ? round_out_1 :  round_xpe_dat_out)));
   //assign o_xpe_dat_out = bypass_xpe ? i_npe_dat_out[255:0] : (((i_dotacc_en &&r_npe_dat_vld_r2 ) ? r_round_out_1 :  round_xpe_dat_out));
    assign i_relu_dat = i_actfun_en ? i_mdata_ex : o_bias_dat_o;
    assign i_actSH_dat = i_actfun_en ? i_mdata : round_out_1;
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : assign_loop
            //assign addend[i] = {{DATA_WIDTH{i_mdata[DATA_WIDTH*(i+1)-1]}}, i_mdata[DATA_WIDTH*i+:DATA_WIDTH]};
            assign i_mdata_ex[2*8*i+:2*8] ={{8{i_mdata[8*(i+1)-1]}}, i_mdata[8*i+:8]};
            assign o_relu_out[ (8*(i+1)-1) : i*8] = o_relu_dat[(16*(i+1)-9):16*i];
        end
    endgenerate
    //assign o_xpe_dat_out = bypass_xpe ? i_npe_dat_out[255:0] : ((i_mode==PARA_MODE_DOTACC &&r_npe_dat_vld_r2 ) ? r_round_out_1 :  round_xpe_dat_out);
    //////////////////////////////////////
   
    //数据有效信号�?3拍，因为数据处理�?�?3�?
    always@(posedge i_clk or negedge i_rst_n) begin
        if( !i_rst_n ) begin
            r_npe_dat_vld_r <= 1'b0;
            r_npe_dat_vld_r1 <= 1'b0;
            r_npe_dat_vld_r2 <= 1'b0;
            r_npe_dat_vld_r3 <= 1'b0;
            r_npe_dat_vld_r4 <= 1'b0;
            r_npe_dat_vld_r5 <= 1'b0;
            // o_xpe_dat_vld <= 1'b0;
        end
        else if(i_actfun_en) begin
            r_npe_dat_vld_r <= i_mdata_vld;
            r_npe_dat_vld_r1 <= r_npe_dat_vld_r;
            r_npe_dat_vld_r2 <= r_npe_dat_vld_r1;
            r_npe_dat_vld_r3 <= r_npe_dat_vld_r2;
            r_npe_dat_vld_r4 <= r_npe_dat_vld_r3;
            r_npe_dat_vld_r5 <= r_npe_dat_vld_r4;
           // o_xpe_dat_vld <= r_npe_dat_vld_r2;
         end else begin
         	 r_npe_dat_vld_r <= i_npe_dat_vld;
            r_npe_dat_vld_r1 <= r_npe_dat_vld_r;
            r_npe_dat_vld_r2 <= r_npe_dat_vld_r1;
            r_npe_dat_vld_r3 <= r_npe_dat_vld_r2;
            r_npe_dat_vld_r4 <= r_npe_dat_vld_r3;
            r_npe_dat_vld_r5 <= r_npe_dat_vld_r4;
         end
    end
 always@(posedge i_clk or negedge i_rst_n) begin
           if( !i_rst_n ) 
           r_round_out_1 <= 256'h0;
           else r_round_out_1 <= round_out_1;
           
 end
    bias #(
        .RAM_ADDR_WIDTH(8)
    )
    bias (
        .i_clk          (i_clk),
        .i_rst_n        (i_rst_n),
        .i_part_num     (i_part_num[4:0]),
        .i_pe_out_en    (i_pe_out_en),
        .i_output_layers(i_output_layers),
        .i_addr_start_b (i_addr_start_b),
        .i_calc_en      (i_calc_en&&c_bias_en),
        .i_calculate_end(i_calculate_end),
        .i_npe_dat_out  (i_npe_dat_out),
        .i_npe_dat_vld  (i_npe_dat_vld),
        .i_ram_dat_vld  (i_ram_dat_vld),
        .i_ram_dat      (i_ram_dat),
        .o_bias_dat_o   (o_bias_dat_o),
        .o_ram_addr     (o_ram_addr),
        .o_ram_rd_en    (o_ram_rd_en)
    );

    relu relu (
        .i_bias_dat(i_relu_dat),
        .i_calc_en (i_xpe_mode==PARA_RELU),
        .o_relu_dat(o_relu_dat)
    );

   
    assign  using_i_q_encode = (i_mode==PARA_MODE_MATRIX||i_dotacc_en) ? o_q_encode : (i_mode==PARA_MODE_AVG_POOL ? 4'h0 : i_q_encode);
    assign  using_w_q_encode = i_mode==PARA_MODE_AVG_POOL ? 4'h0 : w_q_encode;
    assign  using_o_q_encode = i_mode==PARA_MODE_AVG_POOL ? 4'h0 : o_q_encode;
    assign  using_round_mode = i_mode==PARA_MODE_AVG_POOL ? 2'b0 : 2'b1;
    round_32x16b round_32x16b (
        .i_clk        (i_clk),
        .i_rst_n      (i_rst_n),
        .i_q_encode   (using_i_q_encode),
        .w_q_encode   (w_q_encode),
        .o_q_encode   (o_q_encode),
        .i_bias_dat   (i_final_round),
        .i_shift_en   (i_shift_en),
        .i_round_mode (2'b1),
        .bypass_round((c_max_value_en|c_min_value_en)&&(i_xpe_mode==PARA_SIGMOID||i_xpe_mode==PARA_TANH)),
        .o_round_dat  (round_xpe_dat_out)
    );

    round_32x16b round_32x16b_for_avg_pooling (
        .i_clk        (i_clk),
        .i_rst_n      (i_rst_n),
        .i_q_encode   (i_q_encode),
        .w_q_encode   (using_w_q_encode),
        .o_q_encode   (using_o_q_encode),
        .i_bias_dat   (o_bias_dat_o),
        .i_shift_en   (i_shift_en),
        .i_round_mode (using_round_mode),
        .bypass_round(32'b0),
        .o_round_dat  (round_out_1)
    );

    pe_mul pe_mul_for_avg_pooling (
        .i_clk       (i_clk),
        .i_rst_n     (i_rst_n),

        .i_wdata     (i_avg_pooling_coe),
        .i_mdata     (round_out_1),

        .o_mul_result(o_avg_mul_result)
    );
    
    act_fun act_fun_u(
	  .i_clk      (i_clk      ),
	  .i_rst_n    (i_rst_n    ),
	  .i_q_encode(i_q_encode),
	  .i_round_dat(i_actSH_dat),
	  .i_lut_bramctl_wdata(i_lut_bramctl_wdata),
	  .i_lut_bramctl_addr (i_lut_bramctl_addr ),
	  .i_lut_bramctl_we   (i_lut_bramctl_we   ),
	  .i_lut_bramctl_en   (i_lut_bramctl_en   ),
	  .i_act_mode (i_xpe_mode),
	  .o_act_dat  (o_act_fun_dat  ),
	  .o_max_value_en(c_max_value_en),
	  .o_min_value_en(c_min_value_en)
);

endmodule
