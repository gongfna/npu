`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/10 16:36:13
// Design Name: 
// Module Name: IAGU_POOL
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

module IAGU_POOL (
    input i_clk  ,
    input i_rst_n,

    input [11:0] i_StartAdder    ,
    input [7:0] i_Input_PieceNum ,
    input [7:0] i_Out_PieceNum   ,
    input [7:0] i_Out_YLength    ,
    input [7:0] i_Out_XLength    ,
    input [7:0] i_Input_YLength  ,
    input [7:0] i_Input_XLength  ,
    input i_bFirstTiling         ,
    input i_bLastTiling          ,
    input [11:0] i_OneLineSize   ,    //CHN:һ�����ݴ�С=input_xlength*input_piece_num
    input [11:0] i_StrideLineSize,    //CHN:Stride�����ݴ�С=input_xlength*input_piece_num*Stride
    input [1:0] i_Pad            ,
    input [1:0] i_Stride         ,
    input [3:0] i_kernel         ,
    input i_Start                ,    //CHN:��������
    
    output o_IOB_REn         ,
    output o_IOB_PadEn       ,
    output [11:0] o_IOB_RAddr,
    output o_PE_POOL_out
);

    //------------------------------------------------------------------------------
    reg [11:0] r_CurRow;                  //CHN:��Ӧ���y������
    reg [7:0] r_CurCol;                   //CHN:��Ӧ���Y��
    reg [3:0] r_CurKerRow,r_CurKerCol;    //CHN:ker_row��ker_col����
    reg [7:0] r_CurInputPiece;            //CHN:��Ӧinput_piece����
    reg [3:0] r_WorkState,r_WorkState_next;  
    reg [11:0] r_CurInputRow;       //CHN����������y������,curRow*stride
    reg [11:0] r_LineBeginAdder;    //CHN:��������ÿ��(y��)����ʼ��ַ
    reg r_Start;
    reg [11:0] r_PadLineSize;    //CHN:pad line size=pad*OneLineSize
    wire c_AdderEn;              //CHN:��ַ���ʹ��
    wire c_KerRowContinueEn;
     
    //CHN:���������----------------------------------------------
    wire c_bRowEnd;
    wire c_bColEnd;
    wire c_bKerRowEnd, c_bKerColEnd, c_bInPieceEnd;
    wire c_CRowEn, c_CIPieceEn, c_CColEn;    //CHN:�������ʹ��
    wire c_KerRowEn;                         //CHN:����CurKerRow�仯ʹ��
    reg r_Endf;
    wire c_bKerColEn = r_WorkState[2];
    //--------------------------------------------------------------
    //CHN:�����������������
    assign c_bRowEnd = ((r_CurRow + 8'd1) >= i_Out_YLength);
    assign c_bColEnd = ((r_CurCol + 8'd1) >= i_Out_XLength);
    assign c_bKerRowEnd  =  r_CurKerRow + 4'd1 >= i_kernel;
    assign c_bKerColEnd  = ((r_CurKerCol + 4'd1) >= i_kernel) && c_AdderEn;
    assign c_bInPieceEnd = ((r_CurInputPiece + 8'd1) >= i_Input_PieceNum);

    //CHN:�������������ʹ��------------------------------------------
    assign c_CRowEn    = c_bInPieceEnd && c_CIPieceEn;
    assign c_CIPieceEn = c_bColEnd && c_CColEn;
    assign c_CColEn    = c_bKerRowEnd && c_bKerColEnd || c_bKerRowEnd && c_KerRowContinueEn && (i_Pad != 2'd0);
    wire  c_bWorkEn;

    //CHN:��������߼�------------------------------------------------
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

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurCol <= 8'd0;
        else if (r_Start)
            r_CurCol <= 8'd0;
        else if (c_CColEn && c_bWorkEn)
            if (c_bColEnd)
                r_CurCol <= 8'd0;
            else
                r_CurCol <= r_CurCol + 8'd1;
        else
            r_CurCol <= r_CurCol;
    end

    //CHN����ַ����
    //CHN:i_Start�Ƚ���Ԥ����:
    //CHN��(1)pad line size;(2)PartStrideLine;(3)input_y_length+pad;(4)input_x_length+pad;
    reg [11:0] r_InputYLength_withPad;
    reg [11:0] r_InputXLength_withPad;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_InputYLength_withPad <= 12'd0;
        else if (i_Start)    
            r_InputYLength_withPad <= i_Input_YLength + i_Pad;
        else
            r_InputYLength_withPad <= r_InputYLength_withPad;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_InputXLength_withPad <= 12'd0;
        else if (i_Start)    
            r_InputXLength_withPad <=i_Input_XLength+i_Pad;
        else
            r_InputXLength_withPad <= r_InputXLength_withPad;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PadLineSize <= 12'd0;
        else if (i_Start)    
            r_PadLineSize <=i_Pad * i_OneLineSize;
        else
            r_PadLineSize <= r_PadLineSize;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n)
            r_Start <= 1'd0;
        else    
            r_Start <= i_Start;
    end
       
    //CHN:Ԥ������Ŀ��ƣ���4��
    reg r1_Start, r2_Start, r3_Start, r4_Start;      //CHN:�׿�����3�Ŀ���
    reg r1_CurRowEn, r1_CurInputPieceEn, r1_CurColEn;//CHN:��1��
    reg r2_CurRowEn, r2_CurInputPieceEn, r2_CurColEn;//CHN:��2��
    reg r3_CurRowEn, r3_CurInputPieceEn, r3_CurColEn;//CHN:��3��
    reg r4_CurRowEn, r4_CurInputPieceEn, r4_CurColEn;//CHN:��4��
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r1_CurRowEn <= 1'd0; r1_CurColEn <= 1'd0; r1_CurInputPieceEn <= 1'd0;
            r2_CurRowEn <= 1'd0; r2_CurColEn <= 1'd0; r2_CurInputPieceEn <= 1'd0;
            r3_CurRowEn <= 1'd0; r3_CurColEn <= 1'd0; r3_CurInputPieceEn <= 1'd0;
            r4_CurRowEn <= 1'd0; r4_CurColEn <= 1'd0; r4_CurInputPieceEn <= 1'd0;
        end else begin
            r1_CurRowEn <= c_CRowEn   ; r1_CurColEn <= c_CColEn   ; r1_CurInputPieceEn <= c_CIPieceEn;
            r2_CurRowEn <= r1_CurRowEn; r2_CurColEn <= r1_CurColEn; r2_CurInputPieceEn <= r1_CurInputPieceEn;
            r3_CurRowEn <= r2_CurRowEn; r3_CurColEn <= r2_CurColEn; r3_CurInputPieceEn <= r2_CurInputPieceEn;
            r4_CurRowEn <= r3_CurRowEn; r4_CurColEn <= r3_CurColEn; r4_CurInputPieceEn <= r3_CurInputPieceEn;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r1_Start <= 1'd0;
            r2_Start <= 1'd0;
            r3_Start <= 1'd0;
            r4_Start <= 1'd0;
        end else begin
            r1_Start <= r_Start;
            r2_Start <= r1_Start;
            r3_Start <= r2_Start;
            r4_Start <= r3_Start;
        end
    end

    //CHN:CurInputRow��AGuStartʱ�����ʼֵ�����浱�������ʱ��Stride��ʵ��CurInputRow*Stride
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurInputRow <= 12'd0;
        else if (r_Start)
            r_CurInputRow <= 12'd0;
        else if (c_CRowEn && c_bWorkEn)
            r_CurInputRow <= r_CurInputRow + i_Stride;
        else
            r_CurInputRow <= r_CurInputRow;
    end
       
    //CHN:----------------------------Ԥ�����1��-------------------------------------------
    //CHN:Ԥ�����1�ģ�r_LineBeginAdder��Startʱ�����ʼֵ��
    //CHN:���浱�������ʱ��i_StrideLineSize��ʵ��cur_input_row_without_pad*one_line_size
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_LineBeginAdder <= 12'd0;
        else if(r1_Start)//CHN:�ⲿAGUStartʱ�������ַ
            r_LineBeginAdder <= i_StartAdder - r_PadLineSize;
        else if (r1_CurRowEn)
            r_LineBeginAdder <= r_LineBeginAdder + i_StrideLineSize;
        else
            r_LineBeginAdder <=r_LineBeginAdder;
    end
       
       
    //CHN:----------------------------Ԥ�����2��-------------------------------------------
    //CHN:r_Input_piece_addr_withPart = line_begin_addr + input_piece * input_x_length + part_begin_addr
    //CHN:r_Input_piece_begin_addr��r2_Startʱ����Ϊr_LineBeginAdder + part_begin_addr
    //CHN:����ÿ�μ�input_x_length,ʵ��line_begin_addr + input_piece * input_x_length
    reg [11:0] r_Input_piece_addr;//line_begin_addr + input_piece * input_x_length + part_begin_addr
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Input_piece_addr <= 12'd0;
        else if(r2_Start || r2_CurRowEn)
            r_Input_piece_addr <= r_LineBeginAdder;
        else if(r2_CurInputPieceEn)
            r_Input_piece_addr <= r_Input_piece_addr + i_Input_XLength;
        else
            r_Input_piece_addr <= r_Input_piece_addr;
    end
       
       
    //CHN:----------------------------Ԥ�����3��-------------------------------------------
    //CHN:r_Cur_kernel_col_addr_noPad = r_Input_piece_addr + cur_col * stride - pad
    reg [11:0] r_Cur_kernel_col_addr_noPad;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Cur_kernel_col_addr_noPad <= 12'd0;
        else if (r3_Start || r3_CurRowEn || r3_CurInputPieceEn)    //CHN:ÿ���µĴ��ڣ����¼����ʼ��ַ
            r_Cur_kernel_col_addr_noPad <= r_Input_piece_addr - i_Pad;
        else if (c_CColEn && c_bWorkEn)    //CHN:col����仯����Ҫÿ�μ�stride, r_Input_piece_addr +  cur_col * stride - pad
            r_Cur_kernel_col_addr_noPad <= r_Cur_kernel_col_addr_noPad+i_Stride;
        else
            r_Cur_kernel_col_addr_noPad <= r_Cur_kernel_col_addr_noPad;
    end
       
    //CHN:----------------------------Ԥ�����4��-------------------------------------------
    //CHN:ÿ��row����ʱ������r_Cur_kernel_col_addr_noPad+one_line_size
    reg [11:0]r_Cur_kernel_row_col_noPad;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Cur_kernel_row_col_noPad <= 12'd0;
        else if (r4_Start || r4_CurRowEn || r4_CurInputPieceEn || r4_CurColEn || c_KerRowContinueEn)    //CHN:ÿ���µĴ��ڣ����¼����ʼ��ַ
            r_Cur_kernel_row_col_noPad <= r_Cur_kernel_col_addr_noPad;
        else if (c_KerRowEn && c_bWorkEn)    //CHN:�����ڵĴ��䣬ÿ�θ���kerRow�����1��
            r_Cur_kernel_row_col_noPad <= r_Cur_kernel_row_col_noPad + i_OneLineSize;
        else
            r_Cur_kernel_row_col_noPad <= r_Cur_kernel_row_col_noPad;
    end

    //CHN:��4�ĺ����һ��kernel_size*kernel_size��ַ���ɣ���״̬�����
    parameter ST_KER_IDLE=4'd1;
    parameter ST_KER_ROW_CONTINUE=4'd2;    //CHN:cur_ker_row����
    parameter ST_KER_COL_EN=4'd4;          //CHN:ÿ������ker_col_num��Group��ַ
    parameter ST_KER_ROW_INC=4'd8;         //CHN:ÿ��������ɣ���Ҫһ��������cur_ker_row����
    reg [11:0] r_CurInputRow_kernel;         //cur_kernel_row + cur_input_row 

//    wire c_KerRowContinueEn;    //CHN:�ж��Ƿ���continue
    wire c_bLoad_Y0_flag;       //CHN:resnet���ڵ���pad��������ұ�һ�м�����һ�У����ж�������continueEn==1��i_pad==0
    assign c_KerRowContinueEn = (i_bFirstTiling && (r_CurInputRow_kernel < {10'd0, i_Pad}))
                                || (i_bFirstTiling && i_bLastTiling && (r_CurInputRow_kernel >= r_InputYLength_withPad))
                                || (!i_bFirstTiling && i_bLastTiling && (r_CurInputRow_kernel >= i_Input_YLength));
    assign c_bLoad_Y0_flag = c_KerRowContinueEn && (i_Pad == 2'd0);     

    //CHN:���������ж��Ƿ����е�������λ��
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurInputRow_kernel <= 12'd0;
        else if (r2_Start || r2_CurRowEn || r2_CurInputPieceEn)    //CHN:r2���ļ���r_CurInputRow+kernel(==0)
            r_CurInputRow_kernel <= r_CurInputRow;
        else if (c_KerRowEn && c_bWorkEn)    //CHN:ÿ�θ���kerRow�����1
            if (c_bKerRowEnd)
                r_CurInputRow_kernel <= r_CurInputRow;
            else
                r_CurInputRow_kernel <= r_CurInputRow_kernel + 12'd1;
        else
            r_CurInputRow_kernel <= r_CurInputRow_kernel;
    end
    
    //CHN:���������ж���pad������λ��-----------------------------
    reg [11:0] r_Col_With_KerCol;    //cur_col * stride + cur_ker_col
    wire [11:0] c_CurCol_Mul_Stride;
    wire c_ColPadEn;
    assign c_CurCol_Mul_Stride = r_CurCol * i_Stride;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_Col_With_KerCol <= 12'd0;
        else if (r1_CurColEn || r1_Start)    //CHN:����cur_col*stride
                r_Col_With_KerCol <= c_CurCol_Mul_Stride;
        else if (c_bKerColEn && c_bWorkEn)    //CHN:ÿ�θ���kerCol�����1
            if (c_bKerColEnd)
                r_Col_With_KerCol <= c_CurCol_Mul_Stride;
            else
                r_Col_With_KerCol <=r_Col_With_KerCol + 12'd1;
        else
            r_Col_With_KerCol <= r_Col_With_KerCol;
    end

    assign c_ColPadEn = (r_Col_With_KerCol < i_Pad) ||(r_Col_With_KerCol >= r_InputXLength_withPad);
    
    //CHN��4�ļ�����ɺ�����״̬���ƣ����һ�еĵ�ַ����     
    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) r_WorkState <= ST_KER_IDLE;
        else         r_WorkState <= r_WorkState_next;
    end

    always@(*) begin
        case(r_WorkState)
            ST_KER_IDLE:
                if(r_Endf)
                    r_WorkState_next = ST_KER_IDLE;
                else if (r4_Start || r4_CurColEn)
                    if (c_KerRowContinueEn)
                        if (i_Pad == 2'd0)    //CHN:����pad
                            r_WorkState_next = ST_KER_COL_EN;
                        else
                            r_WorkState_next = ST_KER_ROW_CONTINUE;
                    else
                        r_WorkState_next = ST_KER_COL_EN;
                else
                    r_WorkState_next = ST_KER_IDLE;

            ST_KER_ROW_CONTINUE:
                if (c_KerRowContinueEn)
                    if (c_bKerRowEnd)    //CHN:ker row����
                        r_WorkState_next = ST_KER_IDLE;
                    else
                        r_WorkState_next = ST_KER_ROW_CONTINUE;
                else
                    r_WorkState_next = ST_KER_COL_EN;

            ST_KER_COL_EN:
                if (c_bKerColEnd)    //CHN:��һ��row inc
                    r_WorkState_next = ST_KER_ROW_INC;
                else
                    r_WorkState_next = ST_KER_COL_EN;

            ST_KER_ROW_INC:
                if (c_KerRowContinueEn)
                    if (i_Pad == 2'd0)    //CHN:����pad
                        if(r_CurKerRow == 4'd0)//CHN:����IDLE��������Ҫ����input_piece_addr
                            r_WorkState_next = ST_KER_IDLE;
                        else
                            r_WorkState_next = ST_KER_COL_EN;
                    else if (c_bKerRowEnd)    //CHN:ker row����
                        r_WorkState_next = ST_KER_IDLE;
                    else
                        r_WorkState_next = ST_KER_ROW_CONTINUE;
                else
                    if (r_CurKerRow == 4'd0)    //CHN:����IDLE��������Ҫ����input_piece_addr
                        r_WorkState_next = ST_KER_IDLE;
                    else
                        r_WorkState_next = ST_KER_COL_EN;
                
        default:
                r_WorkState_next = ST_KER_IDLE;
        endcase
    end
    
    //CHN:���������������ַ��Ԥ�������ʱ��Ҫ�����cur_kernel_row_begin_addr + part_begin_addr + cur_kernel_col - pad
    reg [11:0] r_PoolAddr;       
   // reg [3:0] r2_CurKerCol;
    reg r_PoolEn;
    reg r_MaxOutEn, r2_MaxOutEn;
   // reg r_AdderEn;
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PoolAddr <= 12'd0;
        else if (c_AdderEn)
            r_PoolAddr <= r_Cur_kernel_row_col_noPad + r_CurKerCol;
        else 
            r_PoolAddr <= r_PoolAddr;
    end

  //  always@(posedge i_clk or negedge i_rst_n) begin
    //    if (!i_rst_n)
     //       r_AdderEn <= 1'd0;
   //     else    
    //        r_AdderEn <= c_AdderEn;
    //end
  //  always@(posedge i_clk or negedge i_rst_n) begin
   //     if (!i_rst_n)
   //         r2_CurKerCol <= 4'd0;
   //     else 
   //          r2_CurKerCol <= r_CurKerCol;
 //   end
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_MaxOutEn <= 1'd0;
            r2_MaxOutEn <= 1'd0;
        end else begin  
            r_MaxOutEn <= c_bKerRowEnd && (c_bKerColEnd || c_KerRowContinueEn && (i_Pad != 2'd0));
            r2_MaxOutEn <= r_MaxOutEn;
        end
    end

    //for debug--------------------------------------
    reg [19:0]r_counter;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_counter <= 20'd0;
        else if (r_Start)
            r_counter <= 20'd0;
        else if (c_AdderEn)
            r_counter <= r_counter + 20'd1;
        else
            r_counter <=r_counter;    
    end
    //end debug---------------------------------------

    //CHN���ڲ�ѭ����������ƣ�ker_row��ker_col
    assign c_KerRowEn = c_bKerColEnd || (c_KerRowContinueEn && (i_Pad != 2'd0) && c_bWorkEn);
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_CurKerRow <= 4'd0;
        else if (r_Start)
            r_CurKerRow <= 4'd0;
        else if (c_KerRowEn)
            if (c_bKerRowEnd)    //CHN:�ص����
                r_CurKerRow <= 4'd0;
            else
                r_CurKerRow <= r_CurKerRow + 4'd1;
        else
            r_CurKerRow <= r_CurKerRow;
    end

   
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

    assign c_AdderEn = c_bKerColEn;

    //CHN�������ͽ�������
    
    wire c_WorkEndOver;
    assign c_WorkEndOver = c_bRowEnd && c_bColEnd && c_bInPieceEnd && c_bKerRowEnd
                           && (c_bKerColEnd || c_KerRowContinueEn && (i_Pad != 2'd0));//ker row && col end or ker_row end && row_continue
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

    assign o_Endf  = r_Endf ;

    always@(posedge i_clk or negedge i_rst_n)
    begin
        if (!i_rst_n)
            r_PoolEn <= 1'd0;
        else if(i_Start)
            r_PoolEn <= 1'd1;
        else if(r_Endf)
            r_PoolEn <= 1'd0;
        else
            r_PoolEn <= r_PoolEn;
    end

    reg r_bLoad_Y0_flag,r_PadEn;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_bLoad_Y0_flag <= 1'd0;
        else 
            r_bLoad_Y0_flag <= c_bLoad_Y0_flag;
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_PadEn <= 1'd0;
        else 
            r_PadEn <= (r_bLoad_Y0_flag || c_ColPadEn) && c_AdderEn;
    end

    reg r_IOB_REn;
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_IOB_REn <= 1'd0;
        else 
            r_IOB_REn <= (~(r_bLoad_Y0_flag || c_ColPadEn)) && c_AdderEn;
    end

    //CHN:����ź�
    assign o_IOB_RAddr   = (r_PoolEn) ? r_PoolAddr : 12'd0;
    assign o_IOB_REn     = r_IOB_REn;
    assign o_IOB_PadEn   = r_PadEn;
    assign o_PE_POOL_out = r2_MaxOutEn;

endmodule
