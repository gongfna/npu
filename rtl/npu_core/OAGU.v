`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/10 
// Design Name: 
// Module Name: OAGU
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
module OAGU(
    input i_clk  ,
    input i_rst_n,

    input i_calculate_enable   ,
    input i_sorter_op          ,
    input [7:0] i_output_layers, 
    input [7:0] i_x_length     ,
    input [7:0] i_y_length     ,
    input [11:0] i_addr_start_s, 
    input [255:0] i_xpe_dat_out,
    input i_xpe_dat_vld        ,
    input [7:0] i_store_length ,
    input [7:0] i_jump_length  ,

    output [11:0]o_iob_waddr,
    output o_iob_wr_en      ,
    output o_calculate_end  ,
    output [255:0]o_iob_wdat
);

    //------------------------------------------------------------------------------
    reg r_OutEn;
    reg [7:0] r_StoreCnt, r_JumpLength;
    reg [11:0] r_IOB_WAddr;
    reg [255:0] r_IOB_Wdat;
    reg r_bDontJump;
    wire c_JumpEn;
    wire c_bDontJmump;
    reg r_IOB_WrEn;
    reg r_AGUEndf;
    wire c_AGUEndf;

    reg [3:0] r_PieceCnt;
    reg [7:0] r_YLengthCnt;
    reg [7:0] r_XLengthCnt;

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_OutEn <= 1'd0;
        else if (i_calculate_enable)
            r_OutEn <= 1'd1;
        else if (c_AGUEndf)
            r_OutEn <= 1'd0;
        else
            r_OutEn <= r_OutEn;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            //r_StoreLength <= 8'd0;
            r_JumpLength  <= 8'd0;
        end else if (i_calculate_enable) begin
            //r_StoreLength <= i_store_length;
            r_JumpLength  <= i_jump_length;
        end else begin
           // r_StoreLength <= r_StoreLength;
            r_JumpLength  <= r_JumpLength;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_IOB_WAddr <= 12'd0;
        else if (i_calculate_enable)
            r_IOB_WAddr <= i_addr_start_s;
        else if (r_OutEn && r_IOB_WrEn)
            if (r_bDontJump)
                r_IOB_WAddr <= r_IOB_WAddr + 12'd1;
            else if (c_JumpEn)
                r_IOB_WAddr <= r_IOB_WAddr + r_JumpLength;
            else
                r_IOB_WAddr <= r_IOB_WAddr + 12'd1;
        else
            r_IOB_WAddr <= r_IOB_WAddr;
    end

  //  assign c_bDontJmump = (r_StoreLength == 8'd0);
    assign c_JumpEn = (r_StoreCnt + 8'd1 == i_store_length);

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_bDontJump <= 1'd0;
        else if (i_calculate_enable)
            r_bDontJump <= (i_store_length == 8'd0);
        else 
            r_bDontJump <= r_bDontJump;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_StoreCnt <= 8'd0;
        else if (i_calculate_enable)
            r_StoreCnt <= 8'd0;
        else if (r_OutEn&&r_IOB_WrEn)
            if (!r_bDontJump)
                if (c_JumpEn)
                    r_StoreCnt<= 8'd0;
                else
                    r_StoreCnt <= r_StoreCnt + 8'd1;
            else
                r_StoreCnt <= r_StoreCnt + 8'd1;
        else
            r_StoreCnt <= r_StoreCnt;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_IOB_WrEn <= 1'd0;
        else if (r_OutEn)
            r_IOB_WrEn <= i_xpe_dat_vld;
        else
            r_IOB_WrEn <= 1'd0;
    end
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_IOB_Wdat <= 256'd0;
        else if (r_OutEn)
            if (i_xpe_dat_vld)
                r_IOB_Wdat <= i_xpe_dat_out;
            else
                r_IOB_Wdat<=r_IOB_Wdat;
        else
            r_IOB_Wdat <= r_IOB_Wdat;
    end

    //output end control
    wire c_XEnd, c_YEnd, c_PieceEnd;
    assign c_XEnd = (r_XLengthCnt + 8'd1 == i_x_length);
    assign c_YEnd = (r_YLengthCnt + 12'd1 == i_y_length);
    assign c_PieceEnd = (r_PieceCnt + 8'd1 == i_output_layers);
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_XLengthCnt <= 8'd0;
        else if (i_calculate_enable)
            r_XLengthCnt <= 8'd0;
        else if (r_OutEn)
            if (r_IOB_WrEn)
                if (c_XEnd)
                    r_XLengthCnt <= 8'd0;
                else
                    r_XLengthCnt <= r_XLengthCnt + 8'd1;
            else
                r_XLengthCnt<=r_XLengthCnt;
        else
            r_XLengthCnt <= r_XLengthCnt;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PieceCnt <= 8'd0;
        else if (i_calculate_enable)
            r_PieceCnt <= 8'd0;
        else if (r_OutEn)
            if (r_IOB_WrEn & c_XEnd)
                if (c_PieceEnd)
                    r_PieceCnt <= 8'd0;
                else
                    r_PieceCnt <= r_PieceCnt + 8'd1;
            else
                r_PieceCnt <= r_PieceCnt;
        else
                r_PieceCnt <= r_PieceCnt;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_YLengthCnt <= 12'd0;
        else if (i_calculate_enable)
            r_YLengthCnt <= 12'd0;
        else if (r_OutEn)
            if (r_IOB_WrEn & c_XEnd & c_PieceEnd)
                if (c_YEnd)
                    r_YLengthCnt <= 12'd0;
                else
                    r_YLengthCnt <= r_YLengthCnt + 12'd1;
            else
                r_YLengthCnt <= r_YLengthCnt;
        else
            r_YLengthCnt <= r_YLengthCnt;
    end

    assign c_AGUEndf = r_IOB_WrEn & c_XEnd & c_PieceEnd & c_YEnd;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_AGUEndf <= 1'd0;
        else if (i_calculate_enable)
            r_AGUEndf <= 1'd0;
        else if (r_OutEn)
            if (c_AGUEndf)
                r_AGUEndf <= 1'd1;
            else
                r_AGUEndf <= r_AGUEndf;
        else
            r_AGUEndf <= r_AGUEndf;
    end

    //output
    assign o_iob_waddr     = r_IOB_WAddr;
    assign o_iob_wr_en     = r_IOB_WrEn;
    assign o_iob_wdat      = r_IOB_Wdat;
    assign o_calculate_end = r_AGUEndf;

endmodule
