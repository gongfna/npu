`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:10 04/10/2018 
// Design Name: 
// Module Name:    pe_mul 
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
`default_nettype none
module pe_mul #(
    parameter   DATA_WIDTH  = 8 ,
    parameter   DATA_COPIES = 32,
    parameter   INDEX_WIDTH = 5   
) (
    input wire i_clk  ,
    input wire i_rst_n,

    input wire [DATA_WIDTH-1:0]             i_wdata,
    input wire [DATA_COPIES*DATA_WIDTH-1:0] i_mdata,

    output wire [DATA_COPIES*2*DATA_WIDTH-1:0] o_mul_result
);
//////////////////////////////////////////////////////////////////////////////////
    wire signed [DATA_WIDTH-1:0]                   multiplier[DATA_COPIES-1:0];
    wire signed [DATA_WIDTH-1:0]                   multiplicand;
    wire signed [2*DATA_WIDTH-1:0]                 c_result[DATA_COPIES-1:0];
    reg  signed [2*DATA_WIDTH-1:0]                 r_result[DATA_COPIES-1:0];
//////////////////////////////////////////////////////////////////////////////////
    assign multiplicand = i_wdata;
    genvar i;
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : assign_loop
            assign multiplier[i] = i_mdata[DATA_WIDTH*i+:DATA_WIDTH];
            assign o_mul_result[2*DATA_WIDTH*i+:2*DATA_WIDTH] = c_result[i];
        end
    endgenerate

    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : mul_loop
            assign c_result[i] = multiplier[i] * multiplicand;
        end
    endgenerate    

endmodule

`default_nettype wire
