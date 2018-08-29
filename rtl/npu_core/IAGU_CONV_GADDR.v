`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/10 16:36:13
// Design Name: 
// Module Name: IAGU_CONV_GADDR
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
//CHN:根据基地址生产每个Group的地址
//CHN:每个Group生产7个或LastColNum个地址
module IAGU_CONV_GADDR (
    input i_clk  ,
    input i_rst_n,

    input [7:0] i_Input_XLength,
    input [11:0] i_BaseAdder   ,
    input [11:0] i_InputCurCol ,
    input [1:0] i_PartFlag     ,    //'bfirstpart' 'blastpart'
    input [3:0] i_KerCol       ,
    input i_BaseAdderEndf      ,
    input i_GroupStart         ,
    
    input [1:0] i_Pad       ,
    input [1:0] i_Stride    ,
    input [2:0] i_LastColNum,    //==last part_len
    input i_AGUStart        ,
    
    output o_Fifo_REn        ,
    output o_IOB_PadEn       ,
    output o_IOB_REn         ,
    output [11:0] o_IOB_RAddr,
    output o_GroupLoadEnd    ,
    output o_AGU_Endf   
);

   // reg [5:0] r_CurKerCol;
    reg [11:0] r_OutAdder;
    reg r_AdderEn;
    wire c_AdderEnd;
    reg [2:0] r_AdderCnt;
    reg [11:0] r_InputCurColAdder;

   // reg r_AGUStart;
    reg r_AGU_Endf;
/*
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_AGUStart <= 1'd0;
        else if (i_AGUStart & ~r_AGU_Endf)
            r_AGUStart <= 1'd1;
        else 
            r_AGUStart <= 1'd0;
    end
*/
    reg [2:0] r_PartLen;
    wire c_PadOneClk;
    assign c_PadOneClk = i_PartFlag[0] && (i_LastColNum == 3'd1);
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PartLen <= 3'd7;
        else if (i_GroupStart & ~r_AGU_Endf)
            if (i_PartFlag[0])    //last part
                r_PartLen <= i_LastColNum;
            else
                r_PartLen <= 3'd7;
        else 
            r_PartLen <= r_PartLen;
    end

    reg r_PadOneClk;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PadOneClk <= 1'd0;
        else if(i_AGUStart)
        	 r_PadOneClk <= 1'd0;
        else
            r_PadOneClk <= c_PadOneClk & i_GroupStart & ~r_AGU_Endf;                    
    end

    assign c_AdderEnd = (r_AdderCnt + 3'd1 == r_PartLen) && r_AdderEn;    //CHN:Last col num==1时单独处理
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_AdderEn <= 1'd0;
        else if (i_GroupStart & ~r_AGU_Endf & ~c_PadOneClk)    //CHN:pad 1clk 单独处理
            r_AdderEn <= 1'd1;
        else if (c_AdderEnd)
            r_AdderEn <= 1'd0;
        else
            r_AdderEn <= r_AdderEn;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_AdderCnt <= 3'd0;
        else if (i_GroupStart&~r_AGU_Endf)
            r_AdderCnt <= 3'd1; 
        else if (r_AdderEn & ~r_AGU_Endf)
            if (c_AdderEnd)
                r_AdderCnt <= 3'd0;
            else
                r_AdderCnt <= r_AdderCnt + 3'd1;
        else
            r_AdderCnt <= r_AdderCnt;
    end

    //CHN:计算kercol+cur_pe_col*stride
   // always@(posedge i_clk or negedge i_rst_n) begin
   //     if (!i_rst_n)
  //          r_CurKerCol <= 6'd0;
 //       else if (i_GroupStart & ~r_AGU_Endf)
  //          r_CurKerCol <= i_KerCol + i_Stride;
  //      else if (r_AdderEn & ~r_AGU_Endf)
 //           r_CurKerCol <= r_CurKerCol + i_Stride;
  //      else
  //          r_CurKerCol <= r_CurKerCol;
  //  end

    //CHN:计算cur_input_col = r_InputCurColAdder + cur_pe_col * stride，用于进行pad判断
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_InputCurColAdder <= 12'd0;
        else if (i_GroupStart & ~r_AGU_Endf)
            r_InputCurColAdder <= i_InputCurCol + i_Stride;
        else if (r_AdderEn & ~r_AGU_Endf)
            r_InputCurColAdder <= r_InputCurColAdder + i_Stride;
        else
            r_InputCurColAdder <= r_InputCurColAdder;
    end

    //CHN:计算地址  
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_OutAdder <= 12'd0;
        else if (i_GroupStart & ~r_AGU_Endf)
            r_OutAdder <= i_BaseAdder;
        else if (r_AdderEn & ~r_AGU_Endf)
            r_OutAdder <= r_OutAdder + i_Stride;
        else
            r_OutAdder <= r_OutAdder;
    end

    //CHN:判断PAD条件       
    /*
    CHN:paden条件
        if (cur_part == 0 and cur_input_col < pad) or (cur_input_col >= input_x_length + pad):
    在列上的pad内，pe将数据load为0
    input_addr = -1
    */

    reg [11:0] r_PadPosReg;
    reg r_PadEn, r_REn;   
    wire [11:0] real_InputCurCol;
     assign  real_InputCurCol = i_InputCurCol + r_AdderCnt;  
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PadPosReg <= 12'd0;
        //else if (i_AGUStart & ~r_AGU_Endf)
        else if (i_AGUStart )
            r_PadPosReg <= i_Input_XLength + i_Pad;    //i_Stride;
        else 
            r_PadPosReg <= r_PadPosReg;
    end

    always@(posedge i_clk or negedge i_rst_n)begin
        if (!i_rst_n) begin
            r_PadEn <= 1'd0;
            r_REn   <= 1'd0;
        end else begin
            if (i_GroupStart & ~r_AGU_Endf)
                if ((i_PartFlag[1]) && (i_InputCurCol < {10'd0, i_Pad}) || ((i_InputCurCol >= r_PadPosReg))) begin
                    r_PadEn <= 1'd1;
                    r_REn   <= 1'd0;
                end else begin
                    r_PadEn <= 1'd0;
                    r_REn   <= 1'd1;
                end
            else begin
                if (r_AdderEn)
                    if ((i_PartFlag[1]) && (r_InputCurColAdder < {10'd0, i_Pad}) || ((r_InputCurColAdder >= r_PadPosReg))) begin
                        r_PadEn <= 1'd1;
                        r_REn   <= 1'd0;
                    end else begin
                        r_PadEn <= 1'd0;
                        r_REn   <= 1'd1;
                    end
                else begin
                    r_PadEn <= 1'd0;
                    r_REn   <= 1'd0;
                end
            end
        end
    end

    reg r_GroupLoadEnd;
    wire c_GroupLoadEnd;
    assign c_GroupLoadEnd = r_AdderEn && c_AdderEnd || r_PadOneClk;    //CHN:只pad 1clk的需要单独处理
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_GroupLoadEnd <= 1'd1;
        end else begin
            if (c_GroupLoadEnd)
                r_GroupLoadEnd <= 1'd1;
            else if (i_GroupStart)
                r_GroupLoadEnd <= 1'd0;
            else
                r_GroupLoadEnd <= r_GroupLoadEnd;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) begin
            r_AGU_Endf <= 1'd0;
        end else begin
            if (i_AGUStart)
                r_AGU_Endf<= 1'd0;
            else if (i_BaseAdderEndf && r_GroupLoadEnd)
                r_AGU_Endf<= 1'd1;
            else
                r_AGU_Endf <= r_AGU_Endf;
        end
    end
        
    //for debug
  //  reg [19:0] r_GroupCounter;
  //  always@(posedge i_clk or negedge i_rst_n) begin
  //      if (!i_rst_n) begin
  //          r_GroupCounter <= 20'd0;
  //      end else begin
   //         if (i_AGUStart)
   //             r_GroupCounter<= 20'd0;
   //         else if (i_GroupStart)
   //             r_GroupCounter <= r_GroupCounter + 20'd1;
   //         else
   //             r_GroupCounter <= r_GroupCounter;
 //       end
 //   end
    //debug end 

    reg r_ConvEn;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_ConvEn <= 1'd0;
        end else begin
            if (i_AGUStart)
                r_ConvEn <= 1'd1;
            else if (r_AGU_Endf)
                r_ConvEn <= 1'd0;
            else
                r_ConvEn <= r_ConvEn;
        end
    end

    //output
    assign o_Fifo_REn     = c_AdderEnd || r_PadOneClk;
    assign o_GroupLoadEnd = r_GroupLoadEnd;
    assign o_AGU_Endf     = r_AGU_Endf;
    assign o_IOB_RAddr    = (r_ConvEn) ? r_OutAdder : 12'd0;
    assign o_IOB_PadEn    = r_PadEn;
    assign o_IOB_REn      = r_REn  ;

endmodule
