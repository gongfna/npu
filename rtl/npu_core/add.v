`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: wuzhi
// 
// Create Date: 2018/01/07 21:41:46
// Design Name: 
// Module Name: add
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


module add
#(
	parameter DATIN_WIDTH = 16,
	parameter DATOUT_WIDTH = 16
)
(
    input clk,
    input rst_n,
    input en,
    input clr,
    input signed [DATIN_WIDTH-1:0] i_op_a,
    input signed [DATIN_WIDTH-1:0] i_op_b,
    output reg signed [DATOUT_WIDTH-1:0] o_result
    );
	parameter Max_Value = $signed(16'h7fff);
    parameter Min_Value = $signed(16'h8000);
    
	wire signed [DATOUT_WIDTH-1:0] c_result;
    assign c_result = i_op_a + i_op_b;
    
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)
            o_result <= {(DATOUT_WIDTH){1'b0}};
        else if(clr)
            o_result <= {(DATOUT_WIDTH){1'b0}};
        else if(en)
            if((i_op_a[DATOUT_WIDTH-1] == i_op_b[DATOUT_WIDTH-1]) && (c_result[DATOUT_WIDTH-1] ^ i_op_a[DATOUT_WIDTH-1]))//CHN:溢出检测条件 c=a+b；c和a、b的符号位相反
                o_result <= c_result[DATOUT_WIDTH-1] ? Max_Value : Min_Value;
            else
                o_result <= c_result;
        else
                o_result <= i_op_a;
    end

endmodule