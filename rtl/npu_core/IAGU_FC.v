`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/19 9:16:13
// Design Name: 
// Module Name: IAGU_FC
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
//CHN:实现FC的地址生成
module IAGU_FC (
    input i_clk  ,
    input i_rst_n,

    input [11:0] i_StartAdder   ,
    input [7:0] i_Input_PieceNum,
    input [7:0] i_Out_PieceNum  ,
    input i_bFirstTiling        ,
    input i_bLastTiling         ,
    input i_AGUStart            ,

    input i_GroupStart   ,
    output o_GroupLoadEnd,
    output o_PreComp_Rdy ,

    output o_IOB_REn         ,
    output [11:0] o_IOB_RAddr
    // output o_PE_Fc_out
);

    reg [11:0] r_OutAdder;
    reg        r_AdderEn;
    wire       c_AdderEnd;
    reg        r_AGU_Endf;

    reg [7:0] r_InputPiece;
    reg [7:0] r_OutPiece;
    wire      c_InputPieceEnd;
    wire      c_OutPieceEnd;

    reg r_WorkEn;
    reg first_group;
    reg first_group_t;
    reg r_AdderEnd;

    assign c_InputPieceEnd = (r_InputPiece + 8'd1 == i_Input_PieceNum);
    assign c_OutPieceEnd   = (r_OutPiece + 8'd1 == i_Out_PieceNum);
    assign c_AdderEnd      = c_InputPieceEnd && c_OutPieceEnd && r_AdderEn;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_AdderEn <= 1'd0;
            //first_group <= 1'b0
        else if (i_AGUStart )
            r_AdderEn <= 1'd1;
        else if (r_AdderEnd)
            r_AdderEn <= 1'd0;
        else
            r_AdderEn <= r_AdderEn;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)begin 
        first_group <= 1'b0;
        first_group_t <= 1'b0;
        end
        else  begin      
        first_group_t <= i_AGUStart;
        first_group <= first_group_t;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_InputPiece <= 8'd0;
        else if (i_AGUStart )
            r_InputPiece <= 8'd0;   
        else if (i_GroupStart & r_AdderEn & ~r_AGU_Endf)
            if (c_InputPieceEnd || first_group)
                r_InputPiece <= 8'd0;
            else
                r_InputPiece <= r_InputPiece + 8'd1;
        else
            r_InputPiece <= r_InputPiece;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_OutPiece <= 8'd0;
        else if(i_AGUStart )
            r_OutPiece <= 8'd0; 
        else if (i_GroupStart & r_AdderEn & ~r_AGU_Endf)
            if (c_InputPieceEnd)
                if (c_OutPieceEnd || first_group)
                    r_OutPiece <= 8'd0;
                else
                    r_OutPiece <= r_OutPiece + 8'd1;
            else
                r_OutPiece <= r_OutPiece;
        else
            r_OutPiece <= r_OutPiece;
    end

    //CHN:计算地址  
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
                r_OutAdder <= 12'd0;
        else if (i_AGUStart )
                r_OutAdder <= i_StartAdder;
        else if (i_GroupStart & r_AdderEn & ~r_AGU_Endf)
            if (c_InputPieceEnd || first_group)
                r_OutAdder <= i_StartAdder;
            else
                r_OutAdder <= r_OutAdder + 12'd1;
        else
            r_OutAdder <= r_OutAdder;
    end
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_AdderEnd <= 1'd0;
        end else begin
            if (i_AGUStart)
                r_AdderEnd <= 1'd0;
            else r_AdderEnd <= c_AdderEnd;
        end
    end  
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_AGU_Endf <= 1'd0;
        end else begin
            if (i_AGUStart)
                r_AGU_Endf <= 1'd0;
            else if (r_AdderEnd)
                r_AGU_Endf <= 1'd1;
            else
                r_AGU_Endf <= r_AGU_Endf;
        end
    end

   // reg r_FCOutEn;
  //  always@(posedge i_clk or negedge i_rst_n) begin
  //      if (!i_rst_n) begin
   //         r_FCOutEn <= 1'd0;
   //     end else begin
            //if (i_GroupStart&i_bLastTiling&&c_AdderEnd) 
 //           if (i_bLastTiling && r_AdderEn && c_InputPieceEnd)
  //              r_FCOutEn <= 1'd1;
   //         else
   //             r_FCOutEn <= r_FCOutEn;
  //      end
//    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) r_WorkEn <= 1'd0;
        else         r_WorkEn <= i_GroupStart & ~r_AGU_Endf;
    end

    reg r_GroupLoadEnd;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)          r_GroupLoadEnd <= 1'd0;
        else if (i_GroupStart) r_GroupLoadEnd <= 1'd1;
        else if (r_AdderEn)    r_GroupLoadEnd <= 1'd0;
        else                   r_GroupLoadEnd <= r_GroupLoadEnd;
    end

    //output    
    assign o_IOB_RAddr = (r_AdderEn) ? r_OutAdder : 12'd0;
    assign o_IOB_REn   = r_WorkEn;
    // assign o_PE_Fc_out = r_FCOutEn;
     
    assign o_PreComp_Rdy = r_AdderEn & (~r_AGU_Endf);
    assign o_GroupLoadEnd = r_GroupLoadEnd;

endmodule
