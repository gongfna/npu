`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ma xiaohan
// 
// Create Date:    21:12:00 03/28/2018 
// Design Name: 
// Module Name:    pe_acc
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
module pe_acc #(
    parameter DATA_WIDTH  = 8,
    parameter DATA_COPIES = 32  
) (
    input  wire                                i_clk       ,
    input  wire                                i_rst_n     ,

    input  wire                                i_acc_clear ,
    input  wire                                i_acc_en    ,

    input  wire [DATA_COPIES*DATA_WIDTH-1:0]   i_mdata     ,
    input  wire                                i_mdata_vld ,
    
    output wire [DATA_COPIES*2*DATA_WIDTH-1:0] o_acc_result
);

    wire signed [DATA_WIDTH*2-1:0] addend[DATA_COPIES-1:0]    ;
    wire signed [DATA_WIDTH*2-1:0] add_result[DATA_COPIES-1:0];
    wire signed [DATA_WIDTH*2-1:0] c_result[DATA_COPIES-1:0]  ;
    reg  signed [DATA_WIDTH*2-1:0] r_result[DATA_COPIES-1:0]  ;
    wire                         acc_clear                    ;

    assign acc_clear = i_acc_clear | ~i_acc_en;

    genvar i;
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : assign_loop
            assign addend[i] = {{DATA_WIDTH{i_mdata[DATA_WIDTH*(i+1)-1]}}, i_mdata[DATA_WIDTH*i+:DATA_WIDTH]};
            assign o_acc_result[2*DATA_WIDTH*i+:2*DATA_WIDTH] = c_result[i];
        end
    endgenerate

    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : acc_loop
            assign add_result[i] = addend[i] + r_result[i];
            assign c_result[i] = i_mdata_vld ? add_result[i] : r_result[i];
            always @(posedge i_clk or negedge i_rst_n) begin
                if (!i_rst_n)       r_result[i] <= {2*DATA_WIDTH{1'h0}};
                else if (acc_clear) r_result[i] <= {2*DATA_WIDTH{1'h0}};
                else                r_result[i] <= c_result[i];
            end
        end
    endgenerate

endmodule

`default_nettype wire
