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
    input i_actfun_en,
    input i_dot_en,
    input i_dotacc_en,
    input [7:0] i_output_layers, 
    input [7:0] i_x_length     ,
    input [7:0] i_y_length     ,
    input [15:0] i_addr_start_s, 
    input [15:0] i_addr_start_s2,
    input [255:0] i_xpe_dat_out,
    input i_xpe_dat_vld        ,
    input [7:0] i_store_length ,
    input [7:0] i_jump_length  ,
    input [1:0] i_buffer_flag,
    input [3:0] i_mode,
    input [1:0] i_xpe_mode,

    output [15:0]o_iob_waddr,
    output o_iob_wr_en      ,
    output o_calculate_end  ,
    output o_wsel,
    output [255:0]o_iob_wdat
);

    parameter PARA_MODE_CONV=4'd1;  
    parameter PARA_MODE_POOL=4'd4;
    parameter PARA_MODE_FC=  4'd2;
    parameter PARA_MODE_ADD=4'd3;
    parameter PARA_MODE_ACC=4'd5;
    parameter PARA_MODE_MATRIX= 4'd6;
    parameter PARA_MODE_DOT=    4'd7;
    parameter PARA_MODE_DOT_ACC=4'd8;
    //------------------------------------------------------------------------------
    reg r_OutEn;
    reg [7:0] r_StoreCnt, r_JumpLength;
    reg [11:0] r_IOB_WAddr;
    reg [11:0] r_IOB_WAddr2;
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
    
    wire  c_continue_en;
    reg [1:0] r_swich_en;
    
     always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_swich_en <= 1'd0;
        else if (i_xpe_dat_vld) begin
             if(r_swich_en == 2'b10) 
              r_swich_en <= 2'b1;
              else
              r_swich_en <= r_swich_en + 2'b1;            
            end
        else r_swich_en <= r_swich_en;
    end
    
assign c_continue_en = (i_dotacc_en && i_xpe_mode != 2'b0) ? (r_swich_en == 2'b10 ? 1'b1 : 1'b0) : 1'b1;
   
    
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
           // r_StoreLength <= i_store_length;
            r_JumpLength  <= i_jump_length;
        end else begin
            //r_StoreLength <= r_StoreLength;
            r_JumpLength  <= r_JumpLength;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_IOB_WAddr <= 12'd0;
            r_IOB_WAddr2 <= 12'd0;
            end
        else if (i_calculate_enable) begin
            r_IOB_WAddr <= i_addr_start_s;
            r_IOB_WAddr2 <= i_addr_start_s2;
            end
        else if (r_OutEn && r_IOB_WrEn & c_continue_en)
            if (r_bDontJump)begin
                r_IOB_WAddr <= r_IOB_WAddr + 12'd1;
                 r_IOB_WAddr2 <= r_IOB_WAddr2 + 12'd1;
            end    
            else if (c_JumpEn) begin
                r_IOB_WAddr <= r_IOB_WAddr + r_JumpLength;
                r_IOB_WAddr2 <= r_IOB_WAddr2 + r_JumpLength;
                end
            else begin
                r_IOB_WAddr <= r_IOB_WAddr + 12'd1;
                 r_IOB_WAddr2 <= r_IOB_WAddr2 + 12'd1;
                end
        else
            r_IOB_WAddr <= r_IOB_WAddr;
            // r_IOB_WAddr2 <= r_IOB_WAddr2;
    end

    //assign c_bDontJmump = (r_StoreLength == 8'd0);
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
    wire [8:0] double_output_layers;
    assign c_XEnd = (r_XLengthCnt + 8'd1 == i_x_length);
    assign c_YEnd = (r_YLengthCnt + 12'd1 == i_y_length);
    assign double_output_layers = i_output_layers<<1;
    assign c_PieceEnd = (i_mode == 4'd8) ? (r_PieceCnt + 8'd1  == double_output_layers) : (r_PieceCnt + 8'd1 == i_output_layers);
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
            if (r_IOB_WrEn & c_XEnd & c_PieceEnd & c_continue_en)
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
    assign o_iob_waddr     = c_continue_en&&i_dotacc_en ? r_IOB_WAddr2 : r_IOB_WAddr;
    assign o_iob_wr_en     = r_IOB_WrEn;
    assign o_iob_wdat      = r_IOB_Wdat;
    assign o_calculate_end = r_AGUEndf;
    assign o_wsel_dot_acc = c_continue_en ? i_addr_start_s[12] : i_addr_start_s2[12] ;
    assign o_wsel_dot = i_addr_start_s[12] ? 1'b1 : 1'b0;
    assign o_wsel = i_dotacc_en ? o_wsel_dot_acc : (i_dot_en ? o_wsel_dot : (i_addr_start_s[12]  ? 1'b1 : 1'b0));

endmodule
