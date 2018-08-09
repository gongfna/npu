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
/*2018-2-5,wuzhi,CHN:round_32x16b模块增加功能，消耗一拍时钟，o_xpe_dat_vld改为打三拍
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
    
    input [2:0] i_mode         ,
    input [1:0] i_xpe_mode     ,
    input i_sorter_op          ,
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

    input [7:0] i_avg_pooling_coe,
    
    output [255:0] o_xpe_dat_out          ,
    output o_xpe_dat_vld                  ,
    output [RAM_ADDR_WIDTH-1:0] o_ram_addr,
    output o_ram_rd_en
);
    
    parameter PARA_MODE_CONV=3'd1;  
    parameter PARA_MODE_POOL=3'd4;
    parameter PARA_MODE_FC=3'd2;
    parameter PARA_MODE_ADD=3'd3;
    parameter PARA_MODE_AVG_POOL=3'd5;

    parameter PARA_NOACT=2'd0;
    parameter PARA_RELU=2'd1;
    parameter PARA_SIGMOID=2'd2;

    //module bias interface
    wire [511:0] o_bias_dat_o;
    wire [511:0] o_relu_dat;
    wire         c_bias_en;
    wire [255:0] round_xpe_dat_out;
    reg r_npe_dat_vld_r;
    reg r_npe_dat_vld_r1;
    //reg r_npe_dat_vld_r2;

    assign c_bias_en = (i_mode==PARA_MODE_CONV || i_mode==PARA_MODE_FC);
    assign i_shift_en = (i_mode==PARA_MODE_ADD) ? 1'b0 : 1'b1;
    assign bypass_xpe = |{ i_sorter_op ,i_mode==PARA_MODE_POOL }; 
    assign o_xpe_dat_vld = bypass_xpe ? i_npe_dat_vld :  r_npe_dat_vld_r1;
    assign o_xpe_dat_out = bypass_xpe ? i_npe_dat_out[255:0] : round_xpe_dat_out;
    //////////////////////////////////////
   
    //数据有效信号打3拍，因为数据处理需要3拍
    always@(posedge i_clk or negedge i_rst_n) begin
        if( !i_rst_n ) begin
            r_npe_dat_vld_r <= 1'b0;
            r_npe_dat_vld_r1 <= 1'b0;
          //  r_npe_dat_vld_r2 <= 1'b0;
            // o_xpe_dat_vld <= 1'b0;
        end
        else begin
            r_npe_dat_vld_r <= i_npe_dat_vld;
            r_npe_dat_vld_r1 <= r_npe_dat_vld_r;
            //r_npe_dat_vld_r2 <= r_npe_dat_vld_r1;
           // o_xpe_dat_vld <= r_npe_dat_vld_r2;
         end
    end

    bias #(
        .RAM_ADDR_WIDTH(8)
    )
    bias (
        .i_clk          (i_clk),
        .i_rst_n        (i_rst_n),
        .i_part_num     (i_part_num),
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
        .i_bias_dat(o_bias_dat_o),
        .i_calc_en (i_xpe_mode==PARA_RELU),
        .o_relu_dat(o_relu_dat)
    );

    wire [255:0] round_avg_dat_out_1;
    wire [511:0] o_avg_mul_result;
    wire [511:0] i_final_round = i_mode==PARA_MODE_AVG_POOL ? o_avg_mul_result : o_relu_dat;
    wire [3:0] using_i_q_encode = i_mode==PARA_MODE_AVG_POOL ? 4'h0 : i_q_encode;
    round_32x16b round_32x16b (
        .i_clk        (i_clk),
        .i_rst_n      (i_rst_n),
        .i_q_encode   (using_i_q_encode),
        .w_q_encode   (w_q_encode),
        .o_q_encode   (o_q_encode),
        .i_bias_dat   (i_final_round),
        .i_shift_en   (i_shift_en),
        .i_round_mode (2'b1),
        .o_round_dat  (round_xpe_dat_out)
    );

    round_32x16b round_32x16b_for_avg_pooling (
        .i_clk        (i_clk),
        .i_rst_n      (i_rst_n),
        .i_q_encode   (i_q_encode),
        .w_q_encode   (4'h0),
        .o_q_encode   (4'h0),
        .i_bias_dat   (i_npe_dat_out),
        .i_shift_en   (i_shift_en),
        .i_round_mode (2'b0),
        .o_round_dat  (round_avg_dat_out_1)
    );

    pe_mul pe_mul_for_avg_pooling (
        .i_clk       (i_clk),
        .i_rst_n     (i_rst_n),

        .i_wdata     (i_avg_pooling_coe),
        .i_mdata     (round_avg_dat_out_1),

        .o_mul_result(o_avg_mul_result)
    );

endmodule
