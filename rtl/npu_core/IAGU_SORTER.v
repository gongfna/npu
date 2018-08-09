`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/30 17:23:18
// Design Name: 
// Module Name: IAGU_SORTER
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


module IAGU_SORTER(
            input i_clk,
			input i_rst_n,
			input [11:0]i_StartAdder,
			input [15:0]i_Input_sorter_num,
			input i_AGUStart,//?????????????????
			
			
			output  o_IOB_REn ,
			output  [11:0]o_IOB_RAddr,
			output  [4:0] last_line_sorter_num,
			output o_sorter_out

    );
    parameter INTERVAL_CYCLE = 5;
    
   reg [11:0] r_input_line;
   reg [2:0] r_cycle_num;
   wire c_input_piece_end;
   wire c_interval_end;
   wire [11:0] input_pieceNum;
   //wire [4:0] last_line_sorter_num;
   reg r_sorter_out_en;
   reg r_IOB_REn;
   reg [11:0]r_IOB_RAddr;
   reg r_addr_en;
   assign  input_pieceNum = (|i_Input_sorter_num[4:0]) ? (i_Input_sorter_num[15:5] + 11'b1) : i_Input_sorter_num[15:5];
   assign  last_line_sorter_num =  i_Input_sorter_num[4:0];
   assign  c_input_piece_end = (r_input_line+12'b1==input_pieceNum)&&r_IOB_REn;
   assign  c_interval_end = (r_cycle_num + 1 == INTERVAL_CYCLE);
  
    always@(posedge i_clk or negedge i_rst_n)begin
                if(!i_rst_n) begin
                        r_IOB_REn <= 1'd0;
                         r_input_line<= 12'b0;
                         r_IOB_RAddr <= 12'b0;
                         r_addr_en <= 1'b0;
                        //first_group <= 1'b0
                        end
                else if(i_AGUStart) begin
                        r_IOB_REn <= 1'd1;
                        r_input_line<= 12'b0;
                        r_IOB_RAddr <= i_StartAdder;
                        r_addr_en <= 1'b1;
                       end
                else  if(c_input_piece_end) begin
                      		r_IOB_REn <=0;
                      		r_input_line<=  12'b0;
                      		r_IOB_RAddr <= 12'b0;
                      		r_addr_en <= 1'b0;
                      end else if(c_interval_end&&r_addr_en) begin 
                          r_IOB_REn <= 1'b1;
                          r_input_line<=  r_input_line + 12'b1;
                          r_IOB_RAddr <= r_IOB_RAddr + 12'b1;
                          r_addr_en <= r_addr_en;
                      
                      end
                else  begin
                        r_IOB_REn <=0;
                         r_input_line<=  r_input_line;
                         r_IOB_RAddr <= r_IOB_RAddr;
                         r_addr_en <= r_addr_en;
                        end
        end
        
        always@(posedge i_clk or negedge i_rst_n)begin
                    if(!i_rst_n)
                             r_cycle_num <= 3'b0;
                            //first_group <= 1'b0
                    else if(i_AGUStart) 
                           r_cycle_num <= 3'b0;
                    else if(c_interval_end)
                                r_cycle_num <= 3'b0;
                               
                    else  begin
                            r_cycle_num <=  r_cycle_num + 3'b1;
                 
                            end
            end
            
             always@(posedge i_clk or negedge i_rst_n)begin
                    if(!i_rst_n)
                             r_sorter_out_en <= 1'b0;
                            //first_group <= 1'b0
                           
                    else if(c_input_piece_end)
                             r_sorter_out_en <= 1'b1;
                               
                    else  begin
                             r_sorter_out_en <= 1'b0;
                 
                            end
            end
            
            assign  o_IOB_REn  = r_IOB_REn;
            assign  o_IOB_RAddr = r_IOB_RAddr;
            assign  o_sorter_out = r_sorter_out_en;
    
endmodule
