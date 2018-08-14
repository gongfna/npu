`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/10 16:36:13
// Design Name: 
// Module Name: IAGU_CONV_BADDR
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
//CHN:CONV?????????????Group????????????,?õ•??fifo??
module IAGU_CONV_BADDR (
    input i_clk  ,
    input i_rst_n,

    input [11:0] i_StartAdder    ,
    input [7:0] i_Input_PieceNum ,
    input [7:0] i_Out_PieceNum   ,
    input [7:0] i_Out_YLength    ,
    input [7:0] i_PartNum        ,
    // input [2:0] i_LastColNum     ,
    input [7:0] i_Input_YLength  ,
    input [7:0] i_Input_XLength  ,
    input i_bFirstTiling         ,
    input i_bLastTiling          ,
    input [11:0] i_OneLineSize   ,    //CHN:????????ß≥=input_xlength*input_piece_num
    input [11:0] i_StrideLineSize,    //CHN:Stride???????ß≥=input_xlength*input_piece_num*Stride
    input [1:0] i_Pad            ,
    input [1:0] i_Stride         ,
    input [3:0] i_kernel         ,
    input i_Start                ,    //CHN:????????
    
    input i_Fifo_REn          ,    //CHN:??????????
    output[11:0] o_BaseAddr   ,    //CHN:??????????FIFO???show-ahead??
    output[11:0] o_InputCurCol,    //CHN:????ß÷??
    output[1:0] o_PartFlag    ,    //CHN:'bFirstPart' +'bLastPart'
    output[3:0] o_KerCol      ,
    output o_PreComp_Rdy      ,    //CHN:?????????
    output o_Endf                  //CHN:?????????????????FIFO
);

    //------------------------------------------------------------------------------
    reg [11:0] r_CurRow;                       //CHN:??????y??????
    reg [7:0] r_CurOutPiece;                   //CHN:??????Output_piece????
    reg [3:0] r_CurPart;                       //CHN:??????part????x??
    reg [3:0] r_CurKerRow, r_CurKerCol;        //CHN:ker_row??ker_col????
    reg [7:0] r_CurInputPiece;                 //CHN:???input_piece????
    reg [3:0] r_WorkState, r_WorkState_next;  

    reg [11:0] r_CurInputRow;        //CHN??????????y??????,curRow*stride
    reg [11:0] r_LineBeginAdder;     //CHN:???????????(y??)????????
    reg [11:0] r_Part_begin_addr;    //CHN:??????????ß÷?part??????
    reg [11:0] r_PadLineSize;                    //CHN:pad line size=pad*OneLineSize
    reg [4:0] r_PartStride, r_LastPartStride;    //CHN:???part???????=part_len(7)*stride
    wire c_BaseAdderEn;                          //CHN:???????????
    wire c_KerRowContinueEn;                     //CHN:?ßÿ??????continue
    reg r_Start;
    reg  r_Endf;
    //CHN:?????????----------------------------------------------
    wire c_bRowEnd, c_bOutPieceEnd, c_bPartEnd;
    wire c_bKerRowEnd, c_bKerColEnd, c_bInPieceEnd;
    wire c_CRowEn, c_COutPieceEn, c_CPartEn, c_CIPieceEn;    //CHN:??????????
    wire c_KerRowEn;                                         //CHN:????CurKerRow?Å£???

    //--------------------------------------------------------------
    //CHN:?????????????????
    assign c_bRowEnd      = (r_CurRow + 12'd1) == i_Out_YLength;
    assign c_bOutPieceEnd = (r_CurOutPiece + 8'd1) == i_Out_PieceNum;
    assign c_bPartEnd     = (r_CurPart + 4'd1) == i_PartNum;
    assign c_bKerRowEnd   = (r_CurKerRow + 4'd1) == i_kernel;
    assign c_bKerColEnd   = ((r_CurKerCol + 4'd1) == i_kernel) && c_BaseAdderEn;
    assign c_bInPieceEnd  = (r_CurInputPiece + 8'd1) == i_Input_PieceNum;

    //CHN:????????????????------------------------------------------
    assign c_CRowEn      = c_bOutPieceEnd && c_COutPieceEn;
    assign c_COutPieceEn = c_bPartEnd && c_CPartEn;
    assign c_CPartEn     = c_bInPieceEnd && c_CIPieceEn;
    assign c_CIPieceEn   = c_bKerRowEnd && c_bKerColEnd || c_bKerRowEnd && c_KerRowContinueEn;
    wire c_bWorkEn;

    //CHN:??????????------------------------------------------------
    assign c_bWorkEn = r_WorkState[1] | r_WorkState[2] | r_WorkState[3];
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurRow <= 12'd0;
        else if (r_Start)
            r_CurRow <= 12'd0;
        else if (c_CRowEn && c_bWorkEn)
            if (c_bRowEnd)
                r_CurRow <= 12'd0;
            else
                r_CurRow <= r_CurRow + 12'd1;
        else
            r_CurRow <= r_CurRow;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurOutPiece <= 8'd0;
        else if (r_Start)
            r_CurOutPiece <= 8'd0;
        else if (c_COutPieceEn && c_bWorkEn)
            if (c_bOutPieceEnd)
                r_CurOutPiece <= 8'd0;
            else
                r_CurOutPiece <= r_CurOutPiece + 8'd1;
        else
            r_CurOutPiece <= r_CurOutPiece;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurPart <= 4'd0;
        else if (r_Start)
            r_CurPart <= 4'd0;
        else if (c_CPartEn && c_bWorkEn)
            if(c_bPartEnd)
                r_CurPart <= 4'd0;
            else
                r_CurPart <= r_CurPart + 4'd1;
        else
            r_CurPart <= r_CurPart;
    end
    
    //CHN???????????BaseAdder calculation
    /*--------------------------------------------------------------------------------------------------------
    cur_input_row = cur_row * stride
    cur_input_row_without_pad = cur_input_row - pad
    line_begin_addr = input_begin_addr + cur_input_row_without_pad * one_line_size   
    input_piece_begin_addr = line_begin_addr + input_piece * input_x_length
    part_begin_addr = cur_part * PE_col_num * stride

    cur_kernel_row_begin_addr = input_piece_begin_addr + cur_kernel_row * one_line_size
    input_addr = cur_kernel_row_begin_addr + part_begin_addr + cur_kernel_col + cur_pe_col * stride - pad
    ---------------------------------------------------------------------------------------------------------*/

    //CHN:i_Start??????????:
    //CHN??(1)pad line size;(2)PartStrideLine;(3)input_y_length+pad;
    reg [11:0] r_InputYLength_withPad;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_InputYLength_withPad <= 12'd0;
        else if(i_Start)
        	 r_InputYLength_withPad <= 12'b0;
        else if (r_Start)    
            r_InputYLength_withPad <= i_Input_YLength + i_Pad;
        else
            r_InputYLength_withPad <= r_InputYLength_withPad;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PadLineSize <= 12'd0;
        else if (i_Start)    
            r_PadLineSize <= i_Pad * i_OneLineSize;
        else
            r_PadLineSize <= r_PadLineSize;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
             r_PartStride <= 5'd0;
        end else begin
            if (i_Start)
                r_PartStride <= 7 * i_Stride;
            else
                r_PartStride <= r_PartStride;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Start <= 1'd0;
        else    
            r_Start <= i_Start;
    end
       
    //CHN:??????????????????
    reg  r1_Start, r2_Start, r3_Start;                 //CHN:???????3?????
    reg  r1_CurRowEn, r1_CurPartEn, r1_CurInputPieceEn;//CHN:??1??
    reg  r2_CurRowEn, r2_CurPartEn, r2_CurInputPieceEn;//CHN:??2??
    reg  r3_CurRowEn, r3_CurPartEn, r3_CurInputPieceEn;//CHN:??3??
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r1_CurRowEn <= 1'd0; r1_CurPartEn <= 1'd0; r1_CurInputPieceEn <= 1'd0;
            r2_CurRowEn <= 1'd0; r2_CurPartEn <= 1'd0; r2_CurInputPieceEn <= 1'd0;
            r3_CurRowEn <= 1'd0; r3_CurPartEn <= 1'd0; r3_CurInputPieceEn <= 1'd0;
        end else begin
            r1_CurRowEn <= c_CRowEn;    r1_CurPartEn <= c_CPartEn;    r1_CurInputPieceEn <= c_CIPieceEn;
            r2_CurRowEn <= r1_CurRowEn; r2_CurPartEn <= r1_CurPartEn; r2_CurInputPieceEn <= r1_CurInputPieceEn;
            r3_CurRowEn <= r2_CurRowEn; r3_CurPartEn <= r2_CurPartEn; r3_CurInputPieceEn <= r2_CurInputPieceEn;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r1_Start <= 1'd0;
            r2_Start <= 1'd0;
            r3_Start <= 1'd0;
        end else begin
            r1_Start <= r_Start;
            r2_Start <= r1_Start;
            r3_Start <= r2_Start;
        end
    end

    //CHN:CurInputRow??AGuStart?????????????õÃ??????????Stride?????CurInputRow*Stride
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurInputRow <= 12'd0;
        else if(i_Start)
            r_CurInputRow <= 12'd0;
        else if (c_CRowEn && c_bWorkEn)
            r_CurInputRow <= r_CurInputRow + i_Stride;
        else
            r_CurInputRow <= r_CurInputRow;
    end

    //CHN:----------------------------??????1??-------------------------------------------
    //CHN:??????1???r_LineBeginAdder??Start??????????
    //CHN:???õÃ??????????i_StrideLineSize?????cur_input_row_without_pad*one_line_size
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_LineBeginAdder <= 12'd0;
        else if (r1_Start)//CHN:??AGUStart?????????
            if (i_bFirstTiling)
                r_LineBeginAdder <= i_StartAdder - r_PadLineSize;//CHN:first tiling ?????pad
            else
                r_LineBeginAdder <= i_StartAdder;
        else if (r1_CurRowEn)
                r_LineBeginAdder <= r_LineBeginAdder + i_StrideLineSize;
        else
            r_LineBeginAdder <= r_LineBeginAdder;
    end

    //CHN:r_Part_begin_addr??i_AGUStart????®Æ???0?????????????????¶Ã?PE_col_num * stride?????cur_part * PE_col_num * stride
    //CHN:PE_col_num * stride???????????7*stride??parlen%7*stride???õ•??r_PartStride??r_LastPartStride?ßµ??????iAGUStart?????®¢?
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Part_begin_addr <= 12'd0;
        else if (r1_Start)
            r_Part_begin_addr <= 12'd0;
        else if (r1_CurPartEn)
            if (r_CurPart == 4'd0)//CHN:out_piece???????????????part?????????????????0
                r_Part_begin_addr <= 12'd0;
            else
                r_Part_begin_addr <= r_Part_begin_addr + r_PartStride;
        else
            r_Part_begin_addr <= r_Part_begin_addr;
    end

    //CHN:----------------------------??????2??-------------------------------------------
    //CHN:r_Input_piece_addr_withPart=line_begin_addr + input_piece * input_x_length + part_begin_addr
    //CHN:r_Input_piece_begin_addr??r2_Start??????r_LineBeginAdder + part_begin_addr
    //CHN:??????¶Ã?input_x_length,???line_begin_addr + input_piece * input_x_length
    reg [11:0] r_Input_piece_addr_withPart;    //line_begin_addr + input_piece * input_x_length + part_begin_addr
    wire [11:0] c_LineBeginAddr_withPart;
    assign c_LineBeginAddr_withPart = r_LineBeginAdder + r_Part_begin_addr;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Input_piece_addr_withPart <= 12'd0;
        else if (r2_Start || r2_CurRowEn || r2_CurPartEn)
            r_Input_piece_addr_withPart <= c_LineBeginAddr_withPart;
        else if (r2_CurInputPieceEn)
            r_Input_piece_addr_withPart <= r_Input_piece_addr_withPart + i_Input_XLength;
        else
            r_Input_piece_addr_withPart <= r_Input_piece_addr_withPart;
    end

    //CHN:----------------------------??????3??-------------------------------------------
    //CHN:cur_kernel_row_addr_withPart_noPad = input_piece_begin_addr + part_begin_addr - pad = r_Input_piece_addr_withPart - pad+cur_kernel_row * one_line_size
    //CHN:??3?????????input_piece??????????????????
    parameter ST_KER_IDLE=4'd1;
    parameter ST_KER_ROW_CONTINUE=4'd2;    //CHN:cur_ker_row????
    parameter ST_KER_COL_EN=4'd4;          //CHN:???????ker_col_num??Group???
    parameter ST_KER_ROW_INC=4'd8;         //CHN:???????????????????????cur_ker_row????

    reg [11:0] r_CurInputRow_kernel;    //cur_kernel_row + cur_input_row 
    reg [11:0] r_Cur_kernel_row_addr_withPart_noPad;
    reg r_GroupLineStart;

    assign c_KerRowContinueEn = (i_bFirstTiling && (r_CurInputRow_kernel < {10'd0, i_Pad}))
                                || (i_bFirstTiling && i_bLastTiling && (r_CurInputRow_kernel >= r_InputYLength_withPad))
                                || (!i_bFirstTiling && i_bLastTiling && (r_CurInputRow_kernel >= i_Input_YLength));

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurInputRow_kernel <= 12'd0;
        else if(i_Start)
        	 r_CurInputRow_kernel <= 12'd0;
        else if (r_Endf)  
        		r_CurInputRow_kernel <= 12'b0;
        else if (r2_Start || r2_CurRowEn || r2_CurInputPieceEn)//CHN:r2???????r_CurInputRow+kernel(==0)
            r_CurInputRow_kernel <= r_CurInputRow;
        else if (c_KerRowEn && c_bWorkEn && (~c_CIPieceEn))    //CHN:??¶»???kerRow?????1
            r_CurInputRow_kernel <= r_CurInputRow_kernel + 12'd1;
        else
            r_CurInputRow_kernel <= r_CurInputRow_kernel;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Cur_kernel_row_addr_withPart_noPad <= 12'd0;
        else if( i_Start)
        	 r_Cur_kernel_row_addr_withPart_noPad <= 12'd0;
        else if (r3_Start || r3_CurRowEn || r3_CurPartEn || r3_CurInputPieceEn)    //CHN:????¶Ã?????????????????
            r_Cur_kernel_row_addr_withPart_noPad <= r_Input_piece_addr_withPart - i_Pad;
        else if (c_KerRowEn && c_bWorkEn)    //CHN:????????????¶»???kerRow?????1??
            r_Cur_kernel_row_addr_withPart_noPad <= r_Cur_kernel_row_addr_withPart_noPad + i_OneLineSize;
        else
            r_Cur_kernel_row_addr_withPart_noPad <= r_Cur_kernel_row_addr_withPart_noPad;
    end

    //CHN?????????????????????????????ß÷?????????        
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_WorkState <= ST_KER_IDLE;
        else 
            r_WorkState <= r_WorkState_next;
    end
    
    always@(*) begin
        case(r_WorkState)
            ST_KER_IDLE:
                if (r_Endf)
                    r_WorkState_next = ST_KER_IDLE;
                else if (r3_Start || r3_CurInputPieceEn)
                    if (c_KerRowContinueEn)
                        r_WorkState_next = ST_KER_ROW_CONTINUE;
                    else
                        r_WorkState_next = ST_KER_COL_EN;
                else
                    r_WorkState_next = ST_KER_IDLE;

            ST_KER_ROW_CONTINUE:
                if (c_KerRowContinueEn)
                    if (c_bKerRowEnd)//CHN:ker row????
                        r_WorkState_next = ST_KER_IDLE;
                    else
                        r_WorkState_next = ST_KER_ROW_CONTINUE;
                else
                    r_WorkState_next = ST_KER_COL_EN;

            ST_KER_COL_EN:
                if (c_bKerColEnd)//CHN:?????row inc
                    r_WorkState_next = ST_KER_ROW_INC;
                else
                    r_WorkState_next = ST_KER_COL_EN;

            ST_KER_ROW_INC:
                if (c_KerRowContinueEn)
                    if (c_bKerRowEnd)//CHN:ker row????
                        r_WorkState_next = ST_KER_IDLE;
                    else
                        r_WorkState_next = ST_KER_ROW_CONTINUE;
                else
                    if (r_CurKerRow == 4'd0)//CHN:????IDLE?????????????input_piece_addr
                        r_WorkState_next = ST_KER_IDLE;
                    else
                        r_WorkState_next = ST_KER_COL_EN;

        default:
                r_WorkState_next = ST_KER_IDLE;
        endcase
    end
    
    //CHN:???????????????????????????????????cur_kernel_row_begin_addr + part_begin_addr + cur_kernel_col - pad
    reg [11:0] r_InputBaseAddr;    //CHN:??????????????r_CurKerRowPart +cur_kernel_col-pad??????????r_Cur_kernel_row_begin_addr+cur_kernel_col
    reg [3:0] r2_CurKerCol;
    reg [11:0] r_InputCurCol;      //CHN:???õ•??cur_input_col = part_begin_addr + cur_kernel_col ????cur_input_col = part_begin_addr + cur_kernel_col + cur_pe_col * stride?????????pad?ßÿ??
    reg r_FifoWen;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_InputBaseAddr <= 12'd0;
        else if (c_BaseAdderEn)
            r_InputBaseAddr <= r_Cur_kernel_row_addr_withPart_noPad + r_CurKerCol;
        else 
            r_InputBaseAddr <= r_InputBaseAddr;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_InputCurCol <= 12'd0;
        else if (c_BaseAdderEn)
            r_InputCurCol <= r_Part_begin_addr + r_CurKerCol;    //cur_input_col = part_begin_addr + cur_kernel_col 
        else 
            r_InputCurCol <= r_InputCurCol;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r2_CurKerCol <= 4'd0;
        else 
            r2_CurKerCol <= r_CurKerCol;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_FifoWen <= 1'd0;
        else 
            r_FifoWen <= c_BaseAdderEn;
    end

    //for debug--------------------------------------
  //  reg [19:0] r_counter;
  //  always@(posedge i_clk or negedge i_rst_n) begin
    //    if (!i_rst_n)
    //        r_counter <= 20'd0;
     //   else if (r_Start)
      //      r_counter <= 20'd0;
      //  else if (r_FifoWen)
      //      r_counter <= r_counter + 20'd1;
      //  else
       //     r_counter <= r_counter;
    //end
    //end debug---------------------------------------
    
    //CHN??????????????????input_piece??ker_row??ker_col
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurInputPiece <= 4'd0;
        else if (r_Start)
            r_CurInputPiece <= 4'd0;
        else if (c_CIPieceEn)
            if (c_bInPieceEnd)
                r_CurInputPiece <= 4'd0;
            else
                r_CurInputPiece <= r_CurInputPiece + 4'd1;
        else
            r_CurInputPiece <= r_CurInputPiece;
    end 

    assign c_KerRowEn = c_bKerColEnd || (c_KerRowContinueEn && c_bWorkEn);
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurKerRow <= 4'd0;
        else if (r_Start)
            r_CurKerRow <= 4'd0;
        else if (c_KerRowEn)
            if (c_bKerRowEnd)    //CHN:??????
                r_CurKerRow <= 4'd0;
            else
                r_CurKerRow <= r_CurKerRow + 4'd1;
        else
            r_CurKerRow <= r_CurKerRow;
    end

    wire c_FifoAlmostFull, c_FifoEmpty;
    wire c_bKerColEn = r_WorkState[2] && (~c_FifoAlmostFull);
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurKerCol <= 4'd0;
        else if (r_Start)
            r_CurKerCol <= 4'd0;
        else if (c_bKerColEn)
            if (c_bKerColEnd)
                r_CurKerCol <= 4'd0;
            else
                r_CurKerCol <= r_CurKerCol + 4'd1;
        else
            r_CurKerCol <= r_CurKerCol;
    end
    assign c_BaseAdderEn = c_bKerColEn;

    //CHN????????õ•
    wire [1:0] c_PartFlag;    //part flag 'first part flag ' 'last part flag'
    reg r_bFirstPart, r_bLastPart;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_bFirstPart <= 1'd0;
        else if (c_BaseAdderEn)
            if (r_CurPart == 4'd0)
                r_bFirstPart <= 1'd1;
            else 
                r_bFirstPart <= 1'd0;
        else
            r_bFirstPart <= r_bFirstPart;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_bLastPart <= 1'd0;
        else if (c_BaseAdderEn)
            if (c_bPartEnd)
                r_bLastPart <= 1'd1;
            else 
                r_bLastPart <= 1'd0;
        else
            r_bLastPart <= r_bLastPart;
    end

    assign c_PartFlag = {r_bFirstPart, r_bLastPart};
    //{c_PartFlag,r2_CurKerCol,r_InputCurCol,r_InputBaseAddr}
`ifdef FPGA
    
    //Fifo18X1K u_BaseAdderFifo (
    Fifo30x1K u_BaseAdderFifo (
        .clk         (i_clk),       // input wire clk
        .srst        (!i_rst_n),    // input wire srst
        // .din({c_PartFlag,r2_CurKerCol,r_InputBaseAddr}),    // input wire [17 : 0] din==part_flag[1:0]+cur_kercol[3:0]+baseadder[11:0]
        .din         ({c_PartFlag, r2_CurKerCol, r_InputCurCol, r_InputBaseAddr}),    // input wire [29 : 0] din==part_flag[1:0]+cur_kercol[3:0]+baseadder[11:0]
        .wr_en       (r_FifoWen),     // input wire wr_en
        .rd_en       (i_Fifo_REn),    // input wire rd_en
        .dout        ({o_PartFlag, o_KerCol, o_InputCurCol, o_BaseAddr}),    // output wire [17 : 0] dout
        .full        (),                    // output wire full
        .almost_full (c_FifoAlmostFull),    // output wire almost_full
        .empty       (c_FifoEmpty)//,       // output wire empty
        // .data_count(),     // output wire [10 : 0] data_count
        // .wr_rst_busy(),    // output wire wr_rst_busy
        // .rd_rst_busy()     // output wire rd_rst_busy
    ); 
         
`else 
  localparam NUM_FIFOS = 1; // Controls how many fifos will be 
                           // implemented. Maximum of 16.			 
  localparam LOG2_DEPTH_P1 = 0; // Log base 2 of DEPTH + 10
  wire [NUM_FIFOS-1:0] fifo_push_e_unconn, fifo_push_ae_unconn, fifo_push_hf_unconn, fifo_push_error_unconn;
  wire [NUM_FIFOS*LOG2_DEPTH_P1-1:0] fifo_push_wc_unconn; 
  wire [NUM_FIFOS-1:0] fifo_pop_e_unconn, fifo_pop_ae_unconn, fifo_pop_hf_unconn, fifo_pop_af_unconn, fifo_pop_error_unconn;
  wire [NUM_FIFOS*LOG2_DEPTH_P1-1:0] fifo_pop_wc_unconn; 
    
bm_cpub_axi2top_DW_axi_x2x_bcm66 u_BaseAdderFifo (
    .clk_push  (i_clk),       // input wire clk
		.rst_push_n(i_rst_n),
		.init_push_n(1'b1),
		.push_req_n (~r_FifoWen),     // input wire wr_en
		.data_in  ({c_PartFlag, r2_CurKerCol, r_InputCurCol, r_InputBaseAddr}),  
     .push_empty      (fifo_push_e_unconn),
     .push_ae         (fifo_push_ae_unconn),
     .push_hf         (fifo_push_hf_unconn),
		 .push_af (c_FifoAlmostFull),    // output wire almost_full
     .push_error      (fifo_push_error_unconn),
     .push_word_count (fifo_push_wc_unconn),
		.clk_pop (i_clk),       // input wire clk
		.rst_pop_n(i_rst_n),
		.init_pop_n(1'b1),
		.pop_req_n  (~i_Fifo_REn),    // input wire rd_en
		.pop_empty (c_FifoEmpty),       // output wire empty
      .pop_ae          (fifo_pop_e_unconn),
      .pop_hf          (fifo_pop_ae_unconn),
      .pop_af          (fifo_pop_hf_unconn),
      .pop_full        (fifo_pop_af_unconn),
      .pop_error       (fifo_pop_error_unconn),
      .pop_word_count  (fifo_pop_wc_unconn),
		.data_out ({o_PartFlag, o_KerCol, o_InputCurCol, o_BaseAddr}),    // output wire [17 : 0] dout

		.test(1'b0)
		);
`endif
/*
//////////-----------------------------------------------------------------
module bm_cpub_axi2top_DW_axi_x2x_bcm66(
		clk_push,
		rst_push_n,
		init_push_n,
		push_req_n,
		data_in,
		push_empty,
		push_ae,
		push_hf,
		push_af,
		push_full,
		push_error,
		push_word_count,

		clk_pop,
		rst_pop_n,
		init_pop_n,
		pop_req_n,
		pop_empty,
		pop_ae,
		pop_hf,
		pop_af,
		pop_full,
		pop_error,
		pop_word_count,
		data_out,

		test
		);
//////////----------------------------------------------------------------  
*/
    //CHN???????????????
    assign o_PreComp_Rdy = ~c_FifoEmpty;  
    
    wire c_WorkEndOver;
    assign c_WorkEndOver = c_bRowEnd && c_bOutPieceEnd && c_bPartEnd && c_bInPieceEnd && c_bKerRowEnd
                           && (c_bKerColEnd || c_KerRowContinueEn);    //ker row && col end or ker_row end && row_continue
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Endf <= 1'd0;
        else if (i_Start)
            r_Endf <= 1'd0;
        else if (c_WorkEndOver)
            r_Endf <= 1'd1;
        else
            r_Endf <= r_Endf;
    end
    assign o_Endf = r_Endf & c_FifoEmpty;

endmodule
