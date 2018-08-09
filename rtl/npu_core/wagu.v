`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/08 16:36:13
// Design Name: 
// Module Name: wagu
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
module wagu (
    input i_clk  ,
    input i_rst_n,

    //INST_CTRL接口
    input [2:0] i_mode         ,
    input [12:0] i_addr_start_w ,
    input [3:0] i_kernel       ,
    input [1:0] i_stride       ,
    input [1:0] i_pad          ,
    input [7:0] i_out_x_length ,
    input [7:0] i_out_y_length ,
    input [7:0] i_in_y_length  ,
    input [7:0] i_part_num     ,
    // input [11:0] i_one_line_size,
    // input [11:0] i_stride_jump_size,
    input i_b_first_tiling     ,
    input i_b_last_tiling      ,
    input [7:0] i_input_layers ,
    input [7:0] i_output_layers,
    input i_enable_calculate   ,
    input [2:0] i_last_col_num , 
    //NPE接口
    output [6:0] o_pe_en,
    output o_pe_conv_out,
    output o_pe_fc_out  ,

    //WB接口
    output [12:0] o_wb_raddr,
    output o_wb_rd_en       ,
    output o_bypass_wb , 

    //WIB接口
    input [18:0] i_wib_rdat ,
    input i_wib_rdat_vld    ,
    output [9:0] o_wib_raddr,
    output o_wib_rd_en      ,     

    //IOAGU接口
    output o_group_load_start  ,
    input i_group_load_end     ,
    input i_ioagu_next_addr_rdy

    //Test接口
);

    parameter [2:0] CONV_MODE=3'd1,    //模式定义
                    POOL_MODE=3'd4,
                    FC_MODE  =3'd2,
                    ADD_MODE =3'd3;
    
    wire w_tiling_end;

    //---------------------------- CONV --------------------------------
    //WIBR
    parameter [1:0] WIBR_IDLE    =2'd0,    //状态定义
                    WIBR_IDX_RD  =2'd1,
                    WIBR_ADDR_GEN=2'd2;
    reg [1:0] r_wibr_state;

    parameter [0:0] WBR_IDLE    =1'd0,    //状态定义
                    WBR_ADDR_GEN=1'd1;
    reg [0:0] r_wbr_state;

    reg [7:0] r_cur_in_row;
    reg [7:0] r_cur_row;
    reg [3:0] r_cur_part;
    reg [7:0] r_cur_input_piece;
    reg [7:0] r_cur_output_piece;
    reg [3:0] r_cur_kernel_row;
    reg [3:0] r_cur_kernel_col;    

    reg [9:0] r_wib_raddr;
    reg [9:0] r_wib_loopback_raddr;
    reg r_conv_tiling_end;

    wire w_conv_tiling_end;
 
    wire w_wib_rd_en;
    wire w_skip_kernel_row;
    wire w_wb_addr_rd;
    wire r_wb_addr_rd;
    reg r_wibr_group_addr_vld;
    reg [12:0] r_group_data_addr;
    reg [5:0]  r_group_data_num;
    reg [5:0]  r_wb_rd_cnt;

    //reg [6:0] r_pe_en;
    reg r_part_end;
    reg [3:0] r_wb_cur_part;
    wire w_pe_conv_out;
    reg r_pe_conv_out;
    reg r_pe_conv_out_2;
    reg r_pe_fc_out_2;

    wire [6:0] w_last_pe_en;
    wire [6:0] w_next_pe_en;
    reg [6:0] r_pe_en;
    reg [3:0] r_pe_en_cnt;

    //---------------------------- ADD --------------------------------
    reg [7:0] r_cur_add_row;
    reg [7:0] r_cur_add_input_piece;
    reg [7:0] r_cur_add_col;

    parameter [0:0] ADD_WBR_IDLE    =1'd0,    //状态定义
                    ADD_WBR_ADDR_GEN=1'd1;
    reg [0:0] r_add_wbr_state;
    reg [12:0] r_add_wb_offset;

    //---------------------------- FC ---------------------------------
    wire w_fc_tiling_end;

    reg [7:0] r_cur_fc_input_piece;
    reg [7:0] r_cur_fc_output_piece;
    //reg [9:0] r_fc_wib_offset;
    reg r_fc_tiling_end;
    reg r_bypass_wb;

    //all outputs
    assign o_pe_en = r_pe_en;
    assign w_last_pe_en = (i_last_col_num == 1) ? 7'b0000001:
                                                  ((i_last_col_num == 2) ? 7'b0000011 :
                                                  ((i_last_col_num == 3) ? 7'b0000111 :
                                                  ((i_last_col_num == 4) ? 7'b0001111 :
                                                  ((i_last_col_num == 5) ? 7'b0011111 :
                                                  ((i_last_col_num == 6) ? 7'b0111111 :
                                                  ((i_last_col_num == 7) ? 7'b1111111 : 7'b0))))));
    assign w_next_pe_en = (r_pe_en_cnt==i_part_num-1) ? w_last_pe_en : 7'b1111111;
    assign o_pe_conv_out = r_pe_conv_out_2;
    assign o_pe_fc_out = r_pe_fc_out_2;
    assign o_wb_raddr = (i_mode == CONV_MODE || i_mode == FC_MODE) ? r_group_data_addr:
                                               ((i_mode == ADD_MODE) ? r_add_wb_offset:
                                               13'b0);
    assign o_wb_rd_en = (r_wbr_state == WBR_ADDR_GEN || r_add_wbr_state == ADD_WBR_ADDR_GEN) ? 1'b1 : 1'b0;
    assign o_bypass_wb = r_bypass_wb; 
    assign o_wib_raddr = r_wib_raddr;
    assign o_wib_rd_en = w_wib_rd_en;
    assign o_group_load_start = w_wb_addr_rd;

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_pe_en <= 0;
        else
            if (i_enable_calculate || r_pe_conv_out_2)
                r_pe_en <= w_next_pe_en;
            else
                r_pe_en <= r_pe_en;
    end

    // always @(posedge i_clk or negedge i_rst_n) begin
    //     if (!i_rst_n)
    //         r_pe_en_cnt <= 0;
    //     else if (i_enable_calculate)
    //         r_pe_en_cnt <= 1;
    //     else if (r_pe_conv_out_2)
    //         if (r_pe_en_cnt == i_part_num - 1)
    //             r_pe_en_cnt <= 0;
    //         else
    //             r_pe_en_cnt <= r_pe_en_cnt+1;
    //     else    
    //         r_pe_en_cnt <= r_pe_en_cnt;
    // end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_pe_en_cnt <= 0;
        else if (i_enable_calculate || r_pe_conv_out_2)
            if (r_pe_en_cnt == i_part_num - 1)
                r_pe_en_cnt <= 0;
            else
                r_pe_en_cnt <= r_pe_en_cnt + 1;
         else    
            r_pe_en_cnt <= r_pe_en_cnt;
    end

    //======================================= WIBR ==============================================  
    //generate WIB address and read enable signal
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_wib_raddr <= 0;
        else if (r_wibr_state == WIBR_IDLE)
                if(i_enable_calculate)
                    r_wib_raddr <= i_addr_start_w;
                else
                    r_wib_raddr <= 0;
        else if (r_wibr_state == WIBR_IDX_RD)    //if(w_wib_rd_en)    //generate next address
                if (i_mode == CONV_MODE)
                    if (r_cur_kernel_col == i_kernel - 1 && r_cur_kernel_row == i_kernel - 1
                        && r_cur_input_piece == i_input_layers - 1)
                            if (r_cur_part == i_part_num - 1)
                                if (r_cur_output_piece == i_output_layers - 1)
                                    r_wib_raddr <= i_addr_start_w;
                                else
                                    r_wib_raddr <= r_wib_raddr + 1;
                            else
                                r_wib_raddr <= r_wib_loopback_raddr;
                    else
                        r_wib_raddr <= r_wib_raddr + 1;
                else if (i_mode == FC_MODE)
                    r_wib_raddr <= r_wib_raddr + 1;
        else
            r_wib_raddr <= r_wib_raddr;
    end

    assign w_wib_rd_en = (r_wibr_state == WIBR_IDX_RD && (i_mode == FC_MODE || (i_mode == CONV_MODE && !w_skip_kernel_row))) ? 1'b1 : 1'b0;    //do not generate rd_en while skipping current row

    //loop 6 -- kernel col loop
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_cur_kernel_col <= 0;
        else if(i_enable_calculate)
        		r_cur_kernel_col <= 0;
        else if (i_mode == CONV_MODE && r_wibr_state == WIBR_IDX_RD)
            if (r_cur_kernel_col == i_kernel - 1)
                r_cur_kernel_col <= 0;
            else
                r_cur_kernel_col <= r_cur_kernel_col + 1;
        else
            r_cur_kernel_col <= r_cur_kernel_col;
    end

    //loop 5 -- kernel row loop 
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_cur_kernel_row <= 0;
        else if(i_enable_calculate)
        	r_cur_kernel_row <= 0;	
        else if (r_wibr_state == WIBR_IDX_RD)
            if (r_cur_kernel_col == i_kernel - 1)
                if (r_cur_kernel_row == i_kernel - 1)
                    r_cur_kernel_row <= 0;
                else
                    r_cur_kernel_row <= r_cur_kernel_row + 1;
            else
                r_cur_kernel_row <= r_cur_kernel_row;
        else
            r_cur_kernel_row <= r_cur_kernel_row;
    end

    assign w_skip_kernel_row = ((i_b_first_tiling && (r_cur_in_row + r_cur_kernel_row < i_pad)) 
                                || (i_b_first_tiling && i_b_last_tiling && (r_cur_in_row + r_cur_kernel_row >= i_in_y_length + i_pad))
                                || (!i_b_first_tiling && i_b_last_tiling && (r_cur_in_row + r_cur_kernel_row >= i_in_y_length))) ? 1'b1 : 1'b0;          
    
    //assign w_skip_kernel_row = 0;                                             

    //loop 4 -- input piece loop
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_cur_input_piece <= 0;
       // else if(i_enable_calculate)  
        	//	 r_cur_input_piece <= 0;
        else if (r_wibr_state == WIBR_IDX_RD)
            if (r_cur_kernel_col == i_kernel - 1 && r_cur_kernel_row == i_kernel - 1)
                if (r_cur_input_piece == i_input_layers - 1)
                    r_cur_input_piece <= 0;
                else
                    r_cur_input_piece <= r_cur_input_piece + 1;
            else
                r_cur_input_piece <= r_cur_input_piece;
        else
            r_cur_input_piece <= r_cur_input_piece;
    end

    //loop 3 -- window partition loop
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_cur_part <= 0;
         else if(i_enable_calculate)
            r_cur_part <= 0;
        else if (r_wibr_state == WIBR_IDX_RD)
            if (r_cur_kernel_col == i_kernel - 1 && r_cur_kernel_row == i_kernel - 1
                && r_cur_input_piece == i_input_layers - 1)
                if (r_cur_part == i_part_num - 1)
                    r_cur_part <= 0;
                else
                    r_cur_part <= r_cur_part + 1;
            else
                r_cur_part <= r_cur_part;
        else
            r_cur_part <= r_cur_part;
    end

    //loop 2 -- output piece loop (traverse all kernels in wb)
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_cur_output_piece <= 0;
        else if(i_enable_calculate) 
        	 r_cur_output_piece <= 0;
        else if (r_wibr_state == WIBR_IDX_RD)
            if (r_cur_kernel_col == i_kernel - 1 && r_cur_kernel_row == i_kernel - 1 
                && r_cur_input_piece == i_input_layers-1 && r_cur_part == i_part_num - 1)
                if(r_cur_output_piece == i_output_layers - 1)
                    r_cur_output_piece <= 0;
                else
                    r_cur_output_piece <= r_cur_output_piece + 1;
            else
                r_cur_output_piece <= r_cur_output_piece;
        else
            r_cur_output_piece <= r_cur_output_piece;
    end

    //save loopback address
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_wib_loopback_raddr <= 0;
        else if (i_enable_calculate)
                r_wib_loopback_raddr <= i_addr_start_w;    //initialize loopback address of first kernel piece
        else if (r_wibr_state == WIBR_IDLE)
            r_wib_loopback_raddr <= 0;
        else if (r_wibr_state == WIBR_IDX_RD)
            if (r_cur_kernel_col == i_kernel - 1 && r_cur_kernel_row == i_kernel - 1 
                && r_cur_input_piece == i_input_layers - 1 && r_cur_part == i_part_num - 1)
                if (r_cur_output_piece == i_output_layers - 1)
                    r_wib_loopback_raddr <= i_addr_start_w;    //update loopback address of first kernel piece
                else
                    r_wib_loopback_raddr <= r_wib_raddr + 1;    //update loopback address of next kernel piece
            else
                r_wib_loopback_raddr <= r_wib_loopback_raddr;
        else
            r_wib_loopback_raddr <= r_wib_loopback_raddr;
    end

    //loop 1
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_cur_row <= 0;
            r_cur_in_row <= 0;
            r_conv_tiling_end <= 0;
        end else begin
            if (r_wibr_state == WIBR_IDLE) begin
                r_cur_row <= 0;
                r_cur_in_row <= 0;
                r_conv_tiling_end <= 0;
            end else if(r_wibr_state == WIBR_IDX_RD) begin
                if (r_cur_kernel_col == i_kernel - 1 && r_cur_kernel_row == i_kernel - 1 
                    && r_cur_input_piece == i_input_layers - 1 && r_cur_part == i_part_num - 1
                    && r_cur_output_piece == i_output_layers - 1) begin
                    if(r_cur_row == i_out_y_length - 1) begin
                        r_cur_row <= 0;
                        r_cur_in_row <= 0;
                        r_conv_tiling_end <= 1;
                    end else begin
                        r_cur_row <= r_cur_row+1;
                        r_cur_in_row <= r_cur_in_row+i_stride;
                    end
                end else begin
                    r_cur_row <= r_cur_row;
                    r_cur_in_row <= r_cur_in_row;
                end
            end else begin
                r_cur_row <= r_cur_row;
                r_cur_in_row <= r_cur_in_row;
            end
        end
    end

    assign w_tiling_end = w_conv_tiling_end | w_fc_tiling_end;
    
    assign w_conv_tiling_end = (i_mode == CONV_MODE)
                               && (r_cur_kernel_col == i_kernel - 1 && r_cur_kernel_row == i_kernel - 1 
                                   && r_cur_input_piece == i_input_layers - 1 && r_cur_part == i_part_num - 1
                                   && r_cur_output_piece == i_output_layers - 1 && r_cur_row == i_out_y_length - 1) ? 1'b1 : 1'b0;
                                                
    assign w_fc_tiling_end = (i_mode == FC_MODE) && (r_cur_fc_input_piece == i_input_layers - 1 && r_cur_fc_output_piece == i_output_layers - 1) ? 1'b1 : 1'b0;
    
    //wibr fsm
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_wibr_state <= WIBR_IDLE;
        end else  begin
            case (r_wibr_state)
                WIBR_IDLE: begin
                    if ((i_mode == CONV_MODE || i_mode == FC_MODE) && i_enable_calculate)
                        r_wibr_state <= WIBR_IDX_RD;
                    else
                        r_wibr_state <= r_wibr_state;
                end

                WIBR_IDX_RD: begin
                    if (w_wib_rd_en)
                        r_wibr_state <= WIBR_ADDR_GEN;
                    else if (w_tiling_end)
                        r_wibr_state <= WIBR_IDLE;
                    else
                        r_wibr_state <= r_wibr_state;
                end

                WIBR_ADDR_GEN: begin
                    if (w_wb_addr_rd)
                        if((i_mode == CONV_MODE && r_conv_tiling_end) || (i_mode == FC_MODE && r_fc_tiling_end))    //end of tiling
                            r_wibr_state <= WIBR_IDLE;
                        else
                            r_wibr_state <= WIBR_IDX_RD;    
                    else
                        r_wibr_state <= r_wibr_state;   
                end

                default:
                    r_wibr_state <= WIBR_IDLE;
            endcase
        end
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_wibr_group_addr_vld <= 0;
        //else if(i_enable_calculate)
        	// r_wibr_group_addr_vld <= 0;
        else if(w_wib_rd_en)
            r_wibr_group_addr_vld <= 1;
        else if(w_wb_addr_rd)
            r_wibr_group_addr_vld <= 0;
        else
            r_wibr_group_addr_vld <= r_wibr_group_addr_vld;
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_part_end <= 0;
        else if(i_enable_calculate)
        	 r_part_end <= 0;
        else if(r_wibr_state == WIBR_IDX_RD && r_cur_kernel_col == i_kernel - 1
                && r_cur_input_piece == i_input_layers - 1)
                if (i_b_last_tiling && i_b_first_tiling)
                    if ((r_cur_in_row + r_cur_kernel_row == i_in_y_length + i_pad - 1)
                        || (r_cur_in_row + r_cur_kernel_row < i_in_y_length + i_pad - 1 && r_cur_kernel_row == i_kernel - 1))
                        r_part_end <= 1;
                    else
                        r_part_end <= r_part_end;
                else if (i_b_last_tiling && !i_b_first_tiling)
                    if ((r_cur_in_row + r_cur_kernel_row == i_in_y_length - 1)
                        || (r_cur_in_row + r_cur_kernel_row < i_in_y_length - 1 && r_cur_kernel_row == i_kernel - 1))
                        r_part_end <= 1;
                    else
                        r_part_end <= r_part_end;
                else
                    if (r_cur_kernel_row == i_kernel - 1)
                        r_part_end <= 1;
                    else
                        r_part_end <= r_part_end;
        else if (w_wb_addr_rd)
            r_part_end <= 0;
        else
            r_part_end <= r_part_end;
    end

    //////////////////////////////fc_mode///////////////////
    reg r_fc_input_piece_end;  
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_fc_input_piece_end <= 0;
        else if(i_enable_calculate)
        	 r_fc_input_piece_end <= 0 ;
        else if (r_wibr_state == WIBR_IDX_RD && r_cur_input_piece == i_input_layers - 1)
            r_fc_input_piece_end <= 1;  
        else if (w_wb_addr_rd)
            r_fc_input_piece_end <= 0;
        else
            r_fc_input_piece_end <= r_fc_input_piece_end; 
    end

    //======================================= WBR ==============================================  
    //wbr fsm
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_wbr_state <= WBR_IDLE;
        else if(i_enable_calculate)
        	 r_wbr_state <= WBR_IDLE;
        else 
            case (r_wbr_state)
                WBR_IDLE: begin
                    if ((i_mode == CONV_MODE || i_mode == FC_MODE) && r_wibr_group_addr_vld
                        && i_group_load_end && i_ioagu_next_addr_rdy)
                        r_wbr_state <= WBR_ADDR_GEN;
                    else
                        r_wbr_state <= r_wbr_state;
                end

                WBR_ADDR_GEN: begin
                    if (r_wb_rd_cnt == r_group_data_num)
                        r_wbr_state <= WBR_IDLE;
                    else
                        r_wbr_state <= r_wbr_state;
                end

                default:
                    r_wbr_state <= WBR_IDLE;
            endcase
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_group_data_addr <= 0;
            r_group_data_num <= 0;
            r_bypass_wb <= 1'b0; 
        end else if (r_wbr_state == WBR_IDLE)
            if (r_wibr_group_addr_vld && i_group_load_end && i_ioagu_next_addr_rdy) begin
                    r_group_data_addr <= i_wib_rdat[18:6];
                    r_group_data_num <= i_wib_rdat[5:0] == 6'b0 ? 6'b1 : i_wib_rdat[5:0];
                    r_bypass_wb <= i_wib_rdat[5:0] == 6'b0 ? 1'b1 : 1'b0;
            end else begin
                    r_group_data_addr <= 0; 
                    r_group_data_num <= 0;
                    r_bypass_wb <= 1'b0;
            end
        else begin
            if (r_wb_rd_cnt == r_group_data_num)
                r_group_data_addr <= 0;
            else    
                r_group_data_addr <= r_group_data_addr + 1;
                r_group_data_num <= r_group_data_num;
        end 
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_wb_rd_cnt <= 0;
        else if(i_enable_calculate) 
        	 r_wb_rd_cnt <= 0;
        else if(r_wbr_state == WBR_IDLE)
            if(r_wibr_group_addr_vld && i_group_load_end && i_ioagu_next_addr_rdy)
                r_wb_rd_cnt <= 1;
            else
                r_wb_rd_cnt <= 0;
        else if (r_wb_rd_cnt > 0 && r_wb_rd_cnt != r_group_data_num)
            r_wb_rd_cnt <= r_wb_rd_cnt + 1;
        else
            r_wb_rd_cnt <= 0;
    end

    assign w_wb_addr_rd = (r_wbr_state == WBR_IDLE && r_wibr_group_addr_vld 
                           && i_group_load_end && i_ioagu_next_addr_rdy) ? 1'b1 : 1'b0;      

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_pe_conv_out <= 0;
        else if(i_enable_calculate)
        	r_pe_conv_out <= 0; 
        else if (r_wbr_state==WBR_IDLE && r_wibr_group_addr_vld && i_group_load_end && i_ioagu_next_addr_rdy)
            r_pe_conv_out <= r_part_end;
        else if (w_pe_conv_out)
            r_pe_conv_out <= 0;
    end 

    /////////////////////////////////add by htt///////////////////////////////    
    reg r_pe_fc_out; 
    wire w_pe_fc_out;  
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_pe_fc_out <= 0;
        else if(i_enable_calculate)
        	r_pe_fc_out <= 0;
        else if (r_wbr_state == WBR_IDLE && r_wibr_group_addr_vld && i_group_load_end && i_ioagu_next_addr_rdy)
            r_pe_fc_out <= r_fc_input_piece_end;
        else if (w_pe_fc_out)
            r_pe_fc_out <= 0;
    end   
    //////////////////////////////////////////////////////////////////////// 
    assign w_pe_conv_out = (i_mode == CONV_MODE && r_wb_rd_cnt == r_group_data_num && r_pe_conv_out) ? 1'b1 : 1'b0;
    assign w_pe_fc_out = (i_mode == FC_MODE && r_wb_rd_cnt == r_group_data_num && r_pe_fc_out) ? 1'b1 : 1'b0;
    
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_pe_conv_out_2 <= 0;
        else if(i_enable_calculate)
            r_pe_conv_out_2 <= 0;
        else if (w_pe_conv_out)
            r_pe_conv_out_2 <= 1;
        else
            r_pe_conv_out_2 <= 0;
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_pe_fc_out_2 <= 0;
        else if(i_enable_calculate)
            r_pe_fc_out_2 <= 0;
        else if (w_pe_fc_out)
            r_pe_fc_out_2 <= 1;
        else
            r_pe_fc_out_2 <= 0;
    end

    //======================================= FC Mode ==============================================  
//    always @(posedge i_clk or negedge i_rst_n) begin
    //    if (!i_rst_n) 
  //          r_fc_wib_offset <= 0;
  //      else if(i_enable_calculate)
  //          r_fc_wib_offset <= 0;
  //      else if (i_mode == FC_MODE && r_wibr_state == WIBR_IDX_RD)
 //               r_fc_wib_offset <= r_fc_wib_offset + 1;
   //         else
   //             r_fc_wib_offset <= r_fc_wib_offset;
  //  end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_cur_fc_input_piece <= 0;
        else if (i_mode == FC_MODE && r_wibr_state == WIBR_IDX_RD) 
            if (r_cur_fc_input_piece == i_input_layers - 1)
                r_cur_fc_input_piece <= 0;
            else
                r_cur_fc_input_piece <= r_cur_fc_input_piece + 1;
        else
            r_cur_fc_input_piece <= r_cur_fc_input_piece;
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_cur_fc_output_piece <= 0;
            r_fc_tiling_end <= 0;
        end else if (r_wibr_state == WIBR_IDLE)
            r_fc_tiling_end <= 0;
        else if(r_wibr_state == WIBR_IDX_RD && r_cur_fc_input_piece == i_input_layers - 1) 
            if (r_cur_fc_output_piece == i_output_layers - 1) begin
                r_cur_fc_output_piece <= 0;
                r_fc_tiling_end <= 1;
            end else
                r_cur_fc_output_piece <= r_cur_fc_output_piece + 1;
        else
            r_cur_fc_output_piece <= r_cur_fc_output_piece;
    end

    //======================================= ADD Mode ==============================================  
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_add_wbr_state <= ADD_WBR_IDLE;
        else
            case (r_add_wbr_state)
                ADD_WBR_IDLE: begin
                    if(i_mode == ADD_MODE && i_enable_calculate)
                        r_add_wbr_state <= ADD_WBR_ADDR_GEN;
                    else
                        r_add_wbr_state <= r_add_wbr_state;
                end

                ADD_WBR_ADDR_GEN: begin
                    if (r_cur_add_col == i_out_x_length - 1 && r_cur_add_input_piece == i_input_layers - 1
                        && r_cur_add_row == i_out_y_length - 1)
                        r_add_wbr_state <= ADD_WBR_IDLE;
                    else
                        r_add_wbr_state <= r_add_wbr_state;
                end

                default:
                    r_add_wbr_state <= ADD_WBR_IDLE;
            endcase
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_add_wb_offset <= 0;
         else if(i_enable_calculate)
         	r_add_wb_offset <= 0;
        else if (r_add_wbr_state == ADD_WBR_ADDR_GEN)
            r_add_wb_offset <= r_add_wb_offset + 1;
        else
            r_add_wb_offset <= 0;
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_cur_add_col <= 0;
        else if(i_enable_calculate)
        		r_cur_add_col <= 0;
        else if (r_add_wbr_state == ADD_WBR_ADDR_GEN) 
            if(r_cur_add_col == i_out_x_length - 1)
              r_cur_add_col <= 0;
            else
              r_cur_add_col <= r_cur_add_col + 1;
        else
            r_cur_add_col <= 0;
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_cur_add_input_piece <= 0;
         else if(i_enable_calculate)
         		 r_cur_add_input_piece <= 0;
        else if (r_add_wbr_state == ADD_WBR_ADDR_GEN)
            if (r_cur_add_col == i_out_x_length - 1)
                if (r_cur_add_input_piece == i_input_layers - 1)
                    r_cur_add_input_piece <= 0;
                else
                    r_cur_add_input_piece <= r_cur_add_input_piece + 1;
            else
                r_cur_add_input_piece <= r_cur_add_input_piece;
        else
            r_cur_add_input_piece <= 0;
    end
    
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) 
            r_cur_add_row <= 0;
        else if(i_enable_calculate) 
            r_cur_add_row <= 0;
        else if (r_add_wbr_state == ADD_WBR_ADDR_GEN)
            if (r_cur_add_col == i_out_x_length - 1 && r_cur_add_input_piece == i_input_layers - 1)
                if (r_cur_add_row == i_out_y_length - 1)
                    r_cur_add_row <= 0;
                else
                    r_cur_add_row <= r_cur_add_row+1;
            else
                r_cur_add_row <= r_cur_add_row;
        else
            r_cur_add_row <= 0;
    end

endmodule
