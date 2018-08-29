`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/19 9:16:13
// Design Name: 
// Module Name: IAGU_DOTACC
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
//CHN:ʵ��DOTACC�ĵ�ַ����
module IAGU_DOTACC (
    input i_clk  ,
    input i_rst_n,

    input [15:0] i_StartAdder   ,
    input [15:0] i_StartAdder2   ,
    input [7:0] i_Input_PieceNum,
    input [7:0] i_Out_PieceNum  ,
    input i_bFirstTiling        ,
    input i_bLastTiling         ,
    input i_AGUStart            ,
    //input [1:0]buffer_flag,
    input i_square_mode,
    input i_src_from2buffer,

   

    output o_IOB_REn         ,
    output [11:0] o_IOB_RAddr,
    output o_IOB_REn1         ,
    output [11:0] o_IOB_RAddr1,
    output o_PE_DOTACC_out
);

    reg [15:0] r_OutAdder;
    reg [15:0] r_OutAdder1;
    wire [15:0] s_OutAdder;  
    reg [15:0] r_start_Adder ;
    reg [15:0] r_start_Adder1;
    
    reg        r_AdderEn;
    wire       c_AdderEnd;
    reg        r_AGU_Endf;

    reg [7:0] r_InputPiece;
    reg [7:0] r_OutPiece;
    wire      c_InputPieceEnd;
    wire      c_OutPieceEnd;

    reg r_WorkEn;
    reg first_group;
    reg r_InputNum;
    reg r_DOTACCOutEn;
    reg r_rsel;   
    reg r_AGUStart;     
    reg r_InputPieceEnd;
    wire [11:0] c_Out_PieceNum;
    wire c_InputPeiceEnd;
    reg [7:0]  r_c_input_piece;
   
    assign c_OutPieceEnd   = (r_OutPiece + 8'd1 == i_Out_PieceNum)&&(r_WorkEn&r_InputNum || i_src_from2buffer || i_square_mode);
    assign c_InputPieceEnd = (r_c_input_piece + 8'd1 == i_Input_PieceNum )&&(r_WorkEn&r_InputNum || i_src_from2buffer || i_square_mode);
    assign c_AdderEnd      = c_InputPieceEnd && c_OutPieceEnd && r_AdderEn;
    assign c_Out_PieceNum = {4'b0,i_Out_PieceNum};
    //assign data_from2buffer = i_StartAdder[12] != i_StartAdder2[12];
   // assign c_OutAdder = r_InputNum ? 
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
        else if (c_AdderEnd)
            r_InputNum <= 1'd0;
        else if(r_AdderEn)
        	if(i_src_from2buffer || i_square_mode)
        	r_InputNum <=1'b1; 
        	else
        	 r_InputNum <= r_InputNum + 1'b1;
        else
            r_InputNum <= r_InputNum;
    end
    
     always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_c_input_piece <= 2'd0;
            //first_group <= 1'b0
        else if (i_AGUStart )
            r_c_input_piece <= 2'd0;
        else if (c_InputPieceEnd)
            r_c_input_piece <= 2'd0;
        else if(r_AdderEn&&r_InputNum)
        	 r_c_input_piece <= r_c_input_piece + 2'b1;
        else
            r_c_input_piece <= r_c_input_piece;
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
        else if (c_InputPieceEnd & r_AdderEn)
                if (first_group)
                    r_OutPiece <= 8'd0;
                else
                    r_OutPiece <= r_OutPiece + 8'd1;
            else
                r_OutPiece <= r_OutPiece;
      
    end

    //CHN:�����ַ  
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
                r_start_Adder <= 12'd0;
                r_start_Adder1 <= 12'd0;
                end
        else if (i_AGUStart ) begin
                r_start_Adder <= i_StartAdder+ 12'b1;
                r_start_Adder1 <= i_StartAdder2+ 12'b1;
                end
        else if (r_AdderEn && c_InputPieceEnd) begin
              
            	  r_start_Adder <=  r_start_Adder + 12'b1;
            	  r_start_Adder1 <= r_start_Adder1 + 12'b1;
            	  end      
    end
    
    always @(posedge i_clk or negedge i_rst_n) begin
    	if(!i_rst_n) begin
    		r_AGUStart      <= 1'b0;
    		r_InputPieceEnd <= 1'b0;
    	end else begin
    		r_AGUStart  <= i_AGUStart;
    		r_InputPieceEnd <= c_InputPieceEnd;
    	end
    end
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
                r_OutAdder <= 12'd0;
                r_OutAdder1 <= 12'd0;
                end
        else if (i_AGUStart ) begin
        	   r_OutAdder <=  i_StartAdder;
              r_OutAdder1 <= i_StartAdder2;
        end
        else if( c_InputPieceEnd&&r_InputNum) begin
                r_OutAdder <=  r_start_Adder;
                r_OutAdder1 <= r_start_Adder1;
                end
        else if (r_AdderEn&r_InputNum) begin                      
            	  r_OutAdder <=  r_OutAdder + i_Out_PieceNum;
            	  r_OutAdder1 <= r_OutAdder1 + i_Out_PieceNum;
            	  end      
    end
     
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_AGU_Endf <= 1'd0;
        end else begin
            if (i_AGUStart)
                r_AGU_Endf <= 1'd0;
            else if (c_AdderEnd)
                r_AGU_Endf <= 1'd1;
            else
                r_AGU_Endf <= r_AGU_Endf;
        end
    end

    reg r_FCOutEn;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_DOTACCOutEn <= 1'd0;
        end else begin
            //if (i_GroupStart&i_bLastTiling&&c_AdderEnd) 
            if (r_AdderEn && ~first_group && c_InputPieceEnd&&r_InputNum)
                r_DOTACCOutEn <= 1'd1;
            else
                r_DOTACCOutEn <= 1'b0;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) r_WorkEn <= 1'd0;
        else         r_WorkEn <= r_AdderEn & ~c_AdderEnd;
    end
	
	assign s_OutAdder = r_InputNum ? r_OutAdder : r_OutAdder1;
   
    //output    
    assign o_IOB_RAddr =i_src_from2buffer ? r_OutAdder[11:0] : s_OutAdder[11:0] ;
    assign o_IOB_REn   = (i_src_from2buffer || !r_OutAdder[12]) ? r_AdderEn : 1'b0;
    assign o_IOB_RAddr1 = i_src_from2buffer ? r_OutAdder1[11:0] : s_OutAdder[11:0] ;
    assign o_IOB_REn1   = (i_src_from2buffer || r_OutAdder[12]) ? r_AdderEn : 1'b0;
    assign o_PE_DOTACC_out = r_DOTACCOutEn;
    //assign o_rsel = r_rsel;
     
   

endmodule