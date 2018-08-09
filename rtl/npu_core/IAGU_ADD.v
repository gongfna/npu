`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/19 9:16:13
// Design Name: 
// Module Name: IAGU_ADD
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
module IAGU_ADD (
    input i_clk  ,
    input i_rst_n,

    input [7:0] i_Input_PieceNum,
    input [7:0] i_Out_YLength   ,
    input [7:0] i_Out_XLength   ,
    input i_AGUStart,
    
    output o_IOB_REn        ,
    output [11:0]o_IOB_RAddr,
    output o_PE_ADD_out
);

    
    reg [11:0] r_OutAdder;
    reg        r_AdderEn;
    wire       c_AdderEnd;
    reg        r_AGU_Endf;

    wire c_XEnd, c_YEnd, c_PieceEnd;
    reg [7:0] r_XLengthCnt;
    reg [11:0] r_YLengthCnt;
    reg [7:0] r_PieceCnt;

    assign c_AdderEnd = c_XEnd && c_YEnd && c_PieceEnd;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_AdderEn <= 1'd0;
        else if (i_AGUStart & ~r_AGU_Endf)
            r_AdderEn <= 1'd1;
        else if (c_AdderEnd)
            r_AdderEn <= 1'd0;
        else
            r_AdderEn <= r_AdderEn;
    end 
    
    //CHN:计算地址  
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_OutAdder <= 12'd0;
        else if (i_AGUStart & ~r_AGU_Endf)
            r_OutAdder <= 12'd0;
        else if (r_AdderEn & ~r_AGU_Endf)
            r_OutAdder <= r_OutAdder + 12'd1;
        else
            r_OutAdder <= r_OutAdder;
    end
            
    //-------------------------------------------------------------------------
    //CHN:坐标变化顺序，先x、再z、最后y
    assign c_XEnd     = (r_XLengthCnt + 8'd1 == i_Out_XLength);
    assign c_YEnd     = (r_YLengthCnt + 12'd1 == i_Out_YLength);
    assign c_PieceEnd = (r_PieceCnt + 8'd1 == i_Input_PieceNum);
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_XLengthCnt <= 8'd0;
        else if (i_AGUStart)
            r_XLengthCnt <= 8'd0;
        else if (r_AdderEn)
            if (c_XEnd)
                r_XLengthCnt <= 8'd0;
            else
                r_XLengthCnt <= r_XLengthCnt + 8'd1;
        else
            r_XLengthCnt <= r_XLengthCnt;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PieceCnt <= 8'd0;
        else if (i_AGUStart)
            r_PieceCnt <= 8'd0;
        else if (r_AdderEn)
            if (c_XEnd)
                if (c_PieceEnd)
                    r_PieceCnt <= 8'd0;
                else
                    r_PieceCnt <= r_PieceCnt+8'd1;
            else
                r_PieceCnt <= r_PieceCnt;
        else
            r_PieceCnt<=r_PieceCnt;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_YLengthCnt <= 12'd0;
        else if (i_AGUStart)
            r_YLengthCnt <= 12'd0;
        else if (r_AdderEn)
            if (c_XEnd & c_PieceEnd)
                if (c_YEnd)
                    r_YLengthCnt <= 12'd0;
                else
                    r_YLengthCnt <= r_YLengthCnt + 12'd1;
            else
                r_YLengthCnt <= r_YLengthCnt;
        else
            r_YLengthCnt <= r_YLengthCnt;
    end

    assign c_AGUEndf = r_AdderEn & c_XEnd & c_PieceEnd & c_YEnd;
    //-----------------------------------------------------------------------   
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_AGU_Endf <= 1'd0;
        end else begin
            if (i_AGUStart)
                r_AGU_Endf<= 1'd0;
            else if(c_AGUEndf)
                r_AGU_Endf<= 1'd1;
            else
                r_AGU_Endf<=1'd0;
        end
    end

    //output    
    assign o_IOB_RAddr  = (r_AdderEn) ? r_OutAdder : 12'd0;
    assign o_IOB_REn    = r_AdderEn;
    assign o_PE_ADD_out = r_AdderEn;

endmodule
