`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:18 01/07/2018 
// Design Name: 
// Module Name:    pe_add 
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
module pe_add #(
    parameter   DATA_WIDTH      =   8   ,
    parameter   DATA_COPIES     =   32  
) (
    //input  wire                                 i_clk           ,
    //input  wire                                 i_rst_n         ,
    input  wire[DATA_COPIES*DATA_WIDTH-1:0]     i_wdata         ,
    input  wire                                 i_wdata_vld     ,
    input  wire[DATA_COPIES*DATA_WIDTH-1:0]     i_mdata         ,
    input  wire                                 i_mdata_vld     ,
    output wire[DATA_COPIES*2*DATA_WIDTH-1:0]   o_add_result    //,
    //input  wire                                 i_add_clear     ,
    //input  wire                                 i_add_en        
);
//////////////////////////////////////////////////////////////////////////////////
    wire signed [DATA_WIDTH-1:0]                addend[DATA_COPIES-1:0]         ;
    wire signed [DATA_WIDTH-1:0]                augend[DATA_COPIES-1:0]         ;
    wire signed [DATA_WIDTH:0]                  c_result[DATA_COPIES-1:0]       ;
    //reg  signed [DATA_WIDTH:0]                  r_result[DATA_COPIES-1:0]       ;
    //wire                                        add_clear                       ;
    //assign add_clear = i_add_clear | ~i_add_en;
   // assign o_add_result[511:256] = 256'b0;
//////////////////////////////////////////////////////////////////////////////////
    genvar i;
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : assign_loop
            assign addend[i] = i_mdata_vld ? i_mdata[DATA_WIDTH*i+:DATA_WIDTH] : {DATA_WIDTH{1'b0}};
            assign augend[i] = i_wdata_vld ? i_wdata[DATA_WIDTH*i+:DATA_WIDTH] : {DATA_WIDTH{1'b0}};
            assign o_add_result[2*DATA_WIDTH*i+:2*DATA_WIDTH] = {{DATA_WIDTH-1{c_result[i][DATA_WIDTH]}}, c_result[i]};
        end
    endgenerate
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : max_loop
            assign c_result[i] = addend[i] + augend[i];
            /*
            always @(posedge i_clk or negedge i_rst_n) begin
                if (!i_rst_n)       r_result[i] <= {DATA_WIDTH+1{1'h0}};
                else if (add_clear) r_result[i] <= {DATA_WIDTH+1{1'h0}};
                else                r_result[i] <= c_result[i];
            end
            */
        end
    endgenerate
//////////////////////////////////////////////////////////////////////////////////
endmodule
`default_nettype wire
