`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: anny
// 
// Create Date: 2018/03/26 22:14:00
// Design Name: 
// Module Name: relu
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

module relu (
	//input i_clk,    // Clock
	//input i_rst_n,  // Asynchronous reset active low
	//input [2:0] i_xpe_mode,
	input i_calc_en,
	input [511:0] i_bias_dat,
	
	output reg [511:0] o_relu_dat
//	output o_relu_dat_vld, 
	
);


wire bias_signed[31:0];
genvar i;
generate  
	for (i= 0; i< 32; i= i+1)begin
		
		assign bias_signed[i] = (i_bias_dat[(i+1)*16-1]==1'b1);
		always@(*)begin
		  if(i_calc_en)
		  		o_relu_dat[(i+1)*16-1:i*16]= bias_signed[i]?16'h0:i_bias_dat[(i+1)*16-1:i*16];
		  else 
		  		o_relu_dat[(i+1)*16-1:i*16]= i_bias_dat[(i+1)*16-1:i*16];
		end
	end
endgenerate


endmodule