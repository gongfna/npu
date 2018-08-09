`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:12:00 01/07/2018 
// Design Name: 
// Module Name:    pe_max 
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
module pe_max #(
    parameter   DATA_WIDTH      =   8   ,
    parameter   DATA_COPIES     =   32  
) (
    input  wire                                 i_clk           ,
    input  wire                                 i_rst_n         ,
    input  wire[DATA_COPIES*DATA_WIDTH-1:0]     i_mdata         ,
    input  wire                                 i_mdata_vld     ,
    output wire[DATA_COPIES*2*DATA_WIDTH-1:0]   o_max_result    ,
    input  wire                                 i_max_clear     ,
    input  wire                                 i_max_en        
);
//////////////////////////////////////////////////////////////////////////////////
    wire signed [DATA_WIDTH-1:0]                compared[DATA_COPIES-1:0]       ;
    wire signed [DATA_WIDTH-1:0]                comp_result[DATA_COPIES-1:0]    ;
    wire signed [DATA_WIDTH-1:0]                c_result[DATA_COPIES-1:0]       ;
    reg  signed [DATA_WIDTH-1:0]                r_result[DATA_COPIES-1:0]       ;
    wire                                        max_clear                       ;
    assign max_clear = i_max_clear | ~i_max_en;
    assign o_max_result[511:256] = 256'b0;
//////////////////////////////////////////////////////////////////////////////////
    genvar i;
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : assign_loop
            assign compared[i] = i_mdata[DATA_WIDTH*i+:DATA_WIDTH];
            assign o_max_result[DATA_WIDTH*(i+1)-1:DATA_WIDTH*i] =  c_result[i];
        end
    endgenerate
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : max_loop
            assign comp_result[i] = maxout(compared[i], r_result[i]);
            assign c_result[i] = i_mdata_vld ? comp_result[i] : r_result[i];
            always @(posedge i_clk or negedge i_rst_n) begin
                if (!i_rst_n)       r_result[i] <= {1'b1, {DATA_WIDTH-1{1'h0}}};
                else if (max_clear) r_result[i] <= {1'b1, {DATA_WIDTH-1{1'h0}}};
                else                r_result[i] <= c_result[i];
            end
        end
    endgenerate
//////////////////////////////////////////////////////////////////////////////////
    // max(a,b)    
    function signed [DATA_WIDTH-1:0] maxout;
        input signed [DATA_WIDTH-1:0] a;
        input signed [DATA_WIDTH-1:0] b;
        begin
            maxout = (a - b > 0) ? a : b;
        end
    endfunction
//////////////////////////////////////////////////////////////////////////////////
endmodule
`default_nettype wire
