`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/05 22:01:39
// Design Name: 
// Module Name: round_16b_8b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// CHN:1. 完成32个16b的右移，截取低8位，做出溢出判断后输出
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module round_16b_8b (
    input i_clk  ,
    input i_rst_n,

    input       i_shift_en  ,
    input [1:0] i_round_mode,

    input unsigned [4:0] shift_num,
    input bypass_round,
    input signed   [15:0] dat_i   ,

    output reg signed [7:0] dat_o,
    output act_max,
    output act_min
);
 
    parameter Max_Value =$signed(8'h7f);
    parameter Min_Value =$signed(8'h80);  
    parameter Fixd_Value=$signed(16'h01);
    
    wire signed [15:0] shift_result;
    wire signed [15:0] shift_result_t;  
    wire signed [15:0] shift_result_t1;
    reg round_g;
    reg [6:0] round_r;
    reg round_lsb;
    assign shift_result_t =  i_shift_en ? (bypass_round ? dat_i>>4'b1000 : dat_i >>> shift_num) : dat_i;
    // assign round_g = dat_i[7];
    // assign round_lsb = dat_i[8];
    // assign round_r = |dat_i[6:0];
    always @(*)
    begin
        case (shift_num[3:0])
            4'b0000:begin 
                round_g = 1'b0;
                round_lsb = 1'b0;
                round_r = 1'b0;
            end
            4'b0001:begin 
                round_g = dat_i[0];
                round_lsb = dat_i[1];
                round_r = 1'b0;
            end
            4'b0010:begin 
                round_g = dat_i[1];
                round_lsb = dat_i[2];
                round_r = dat_i[0];
            end
            4'b0011:begin 
                round_g = dat_i[2];
                round_lsb = dat_i[3];
                round_r = |dat_i[1:0];
            end
            4'b0100:begin 
                round_g = dat_i[3];
                round_lsb = dat_i[4];
                round_r = |dat_i[2:0];
            end
            4'b0101:begin 
                round_g = dat_i[4];
                round_lsb = dat_i[5];
                round_r = |dat_i[3:0];
            end
            4'b0110:begin 
                round_g = dat_i[5];
                round_lsb = dat_i[6];
                round_r = |dat_i[4:0];
            end
            4'b0111:begin 
                round_g = dat_i[6];
                round_lsb = dat_i[7];
                round_r = |dat_i[5:0];
            end
            4'b1000:begin 
                round_g = dat_i[7];
                round_lsb = dat_i[8];
                round_r = |dat_i[6:0];
            end
            4'b1001:begin 
                round_g = dat_i[8];
                round_lsb = dat_i[9];
                round_r = |dat_i[7:0];
            end
            4'b1010:begin 
                round_g = dat_i[9];
                round_lsb = dat_i[10];
                round_r = |dat_i[8:0];
            end
            4'b1011:begin 
                round_g = dat_i[10];
                round_lsb = dat_i[11];
                round_r = |dat_i[9:0];
            end
            4'b1100:begin 
                round_g = dat_i[11];
                round_lsb = dat_i[12];
                round_r = |dat_i[10:0];
            end
            4'b1101:begin 
                round_g = dat_i[12];
                round_lsb = dat_i[13];
                round_r = |dat_i[11:0];
            end
            4'b1110:begin 
                round_g = dat_i[13];
                round_lsb = dat_i[14];
                round_r = |dat_i[12:0];
            end
            4'b1111:begin 
                round_g = dat_i[14];
                round_lsb = dat_i[15];
                round_r = |dat_i[13:0];
            end
        endcase
    end
///////////////////////////////////////////////////////////////
/*
always @(*)
    begin
        case(o_q_encode)
        4'b0101:begin
        end
        4'b0110:begin
        end
        4'b0111:begin
        end
        endcase
    end
    */
/////////////////////////////////////////////////////////////////////
    //assign add_one = (round_g&round_r) || (&{round_lsb, round_g, ~round_r});    
    assign add_one = round_g;
    // assign shift_result_t1 = shift_result_t + Fixd_Value;
    assign shift_result = (add_one & i_shift_en) && (i_round_mode != 2'b0)&& !bypass_round ? (shift_result_t + Fixd_Value) : shift_result_t;
  // assign shift_result = add_one&i_shift_en ? (shift_result_t + Fixd_Value) : shift_result_t ;
    // assign shift_result = ( shift_result_t1 >>> 1'b1 );  
    // assign shift_result = ( shift_result_t1 >>> 1'b1 ); 
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)                     dat_o <= 0;
        else if (bypass_round) dat_o <= shift_result[7:0] ;
        else if(shift_result > Max_Value) dat_o <= Max_Value;
        else if(shift_result < Min_Value) dat_o <= Min_Value;
        else                              dat_o <= shift_result[7:0] ;
    end

endmodule
