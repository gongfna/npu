`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: wuzhi
// 
// Create Date: 2018/01/08 22:27:40
// Design Name: 
// Module Name: 32x16b_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 实例化32份16b加法器
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module add_32x16b(
    input i_clk,
    input i_rst_n,
    input       i_calc_en,
    input [511:0] i_npe_dat_out,
    //input i_ram_dat_vld,
    input [511:0] i_ram_dat,
    output [511:0] o_bias_dat_o
    );
    
    wire signed [15:0] npe_dat[31:0];
    wire signed [15:0] ram_dat[31:0];
    wire signed [15:0] bias_dat[31:0];

    genvar i;
    generate
        for(i = 0; i < 32; i = i +1)begin
            assign npe_dat[i] = i_npe_dat_out[ ((i+1) * 16 - 1) : (i*16) ];
            assign ram_dat[i] = i_ram_dat[ ((i+1) * 16 - 1 ):  (i*16) ];
            assign o_bias_dat_o[ ((i+1) * 16 - 1 ):  (i*16) ] = bias_dat[i];
        end
    endgenerate    

    generate
        for(i = 0; i < 32; i = i +1)begin
            add	
                #(
                .DATIN_WIDTH(16),
                .DATOUT_WIDTH(16)
                )
                    add_inst(
                        .clk(i_clk),
                        .rst_n(i_rst_n),
                        .en(i_calc_en),
                        .clr(1'b0),
                        .i_op_a(npe_dat[i]),
                        .i_op_b(ram_dat[i]),
                        .o_result(bias_dat[i])
                    );												
            end
    endgenerate
    
endmodule
