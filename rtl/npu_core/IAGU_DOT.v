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
module IAGU_DOT (
    input i_clk  ,
    input i_rst_n,

    input [15:0] i_StartAdder   ,
    input [15:0] i_StartAdder2   ,
   // input [7:0] i_Input_PieceNum,
    input [7:0] i_Out_PieceNum  ,
    input i_bFirstTiling        ,
    input i_bLastTiling         ,
    input i_AGUStart            ,
   // input [1:0]buffer_flag,
    input i_square_mode,
    input i_src_from2buffer,

   

    output o_IOB_REn         ,
    //output o_rsel,
    output [11:0] o_IOB_RAddr,
    //output o_PE_DOT_out,
     output o_IOB_REn1         ,
    //output o_rsel1,
    output [11:0] o_IOB_RAddr1,
    output o_PE_DOT_out
);

    reg [15:0] r_OutAdder;
    reg [15:0] r_OutAdder2;
    reg        r_AdderEn;
    wire       c_AdderEnd;
    reg        r_AGU_Endf;

   // reg [7:0] r_InputPiece;
    reg [7:0] r_OutPiece;
    wire      c_InputPieceEnd;
    wire      c_OutPieceEnd;
    //wire      data_from2buffer;
    wire [15:0] same_bufferaddr;

    reg r_WorkEn;
    reg first_group;
    reg r_InputNum;
    reg r_DOTOutEn;
    reg r_AdderEnd;

   // assign data_from2buffer = i_StartAdder[12] != i_StartAdder2[12];
    assign same_bufferaddr = (r_WorkEn==1) ? (r_InputNum ? r_OutAdder2   : r_OutAdder)  : 12'd0;
    assign c_OutPieceEnd   = (r_OutPiece + 8'b1 == i_Out_PieceNum)&&(r_WorkEn&r_InputNum || i_src_from2buffer || i_square_mode);
    assign c_AdderEnd      = c_OutPieceEnd && r_AdderEn;
   
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_AdderEn <= 1'd0;
            //first_group <= 1'b0
        else if (i_AGUStart )
            r_AdderEn <= 1'd1;
        else if (c_AdderEnd)
            r_AdderEn <= 1'd0;
        else
            r_AdderEn <= r_AdderEn;
    end
    
      always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_InputNum <= 1'd0;
            //first_group <= 1'b0
        else if (i_AGUStart ) begin
        	if(i_src_from2buffer||i_square_mode)
            r_InputNum <= 1'd1;
           else  r_InputNum <= 1'd0;
            end
        else if (r_AdderEnd)
            r_InputNum <= 1'd0;
        else if(r_AdderEn)
        	if(i_src_from2buffer||i_square_mode)
        	 r_InputNum <= 1'b1;
        	 else
        	 r_InputNum <= r_InputNum + 1'b1;
        else
            r_InputNum <= r_InputNum;
    end
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) first_group <= 1'b0;
        else          first_group <= i_AGUStart;
    end

   
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_OutPiece <= 8'd0;
        else if(i_AGUStart )
            r_OutPiece <= 8'd0; 
        else if (r_InputNum & r_AdderEn)               
                    r_OutPiece <= r_OutPiece + 8'd1;
            else
                r_OutPiece <= r_OutPiece;
      
    end

    //CHN:计算地址  
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
                r_OutAdder <= 12'd0;
                r_OutAdder2 <= 12'd0;
                end
        else if (i_AGUStart )begin
                r_OutAdder <= i_StartAdder;
                r_OutAdder2 <= i_StartAdder2;
                end
        else if (r_AdderEn)
            //if (first_group) begin
            //    r_OutAdder <= i_StartAdder;
            //     r_OutAdder2 <= i_StartAdder2;
            //    end
             if(r_InputNum) begin
            	  r_OutAdder <= r_OutAdder + 12'b1;
            	  r_OutAdder2 <= r_OutAdder2 + 12'b1;
            	  end
              //  r_OutAdder <= r_OutAdder + i_Out_PieceNum;
            //else r_OutAdder <= r_OutAdder + 12'b1;
      
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


    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_DOTOutEn <= 1'd0;
        end else begin
            //if (i_GroupStart&i_bLastTiling&&c_AdderEnd) 
            if (r_AdderEn && r_InputNum)
                r_DOTOutEn <= 1'd1;
            else
                r_DOTOutEn <= 1'd0;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) r_WorkEn <= 1'd0;
        else         r_WorkEn <= r_AdderEn & ~r_AGU_Endf;
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
    //output    
    assign o_IOB_RAddr = (i_src_from2buffer || i_square_mode ) ? r_OutAdder[11:0] : same_bufferaddr; 
    assign o_IOB_REn   = (i_src_from2buffer || !r_OutAdder[12]) ? r_AdderEn : 1'b0;
      
    assign o_IOB_RAddr1 = (i_src_from2buffer || i_square_mode ) ? r_OutAdder2[11:0] : same_bufferaddr;
    assign o_IOB_REn1   = (i_src_from2buffer || r_OutAdder[12]) ? r_AdderEn : 1'b0;
   
    assign o_PE_DOT_out = r_DOTOutEn;  
   

endmodule
