`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// wz
// Create Date: 2018/01/09 21:45:31
// Design Name: 
// Module Name: rounding
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 32个16b数据截取为32个8b，具体每个16b到8b的rounding策略在子模块实现
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
/*
*/
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module round_32x16b(
    input i_clk,
    input i_rst_n,
    input unsigned [3:0] i_q_encode,
    input unsigned [3:0] w_q_encode,
    input unsigned [3:0] o_q_encode,
    input [511:0] i_bias_dat,
    input i_shift_en,
    input [1:0] i_round_mode,    // 0 for trunc, 1 for nearst
    input [31:0] bypass_round,
    output [255:0] o_round_dat
);

    reg unsigned [4:0] shift_num;

    wire signed [15:0] bias_16b_dat[31:0];
    wire signed [7:0] round_8b_dat[31:0];

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) shift_num <= 0;
        else shift_num <= ( i_q_encode + w_q_encode - o_q_encode   );
    end

    genvar i;
    generate
        for (i = 0; i < 32; i = i +1) begin
            assign bias_16b_dat[i] = i_bias_dat[((i+1)*16-1) : (i*16) ];
            assign o_round_dat[ ((i+1)*8-1 ) : (i*8) ] = round_8b_dat[i];
        end
    endgenerate
    
    generate
        for(i = 0; i < 32; i = i + 1) begin
            round_16b_8b round_16b_8b (
                .i_clk(i_clk),
                .i_rst_n(i_rst_n),
                .shift_num(shift_num),
                .i_shift_en(i_shift_en),
                .i_round_mode(i_round_mode),
                .bypass_round(bypass_round[i]),
                .dat_i(bias_16b_dat[i]),
                .dat_o(round_8b_dat[i])
            );
        end
    endgenerate

endmodule
