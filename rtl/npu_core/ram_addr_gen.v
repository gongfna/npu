`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: wuzhi
// 
// Create Date: 2018/01/09 15:36:21
// Design Name: 
// Module Name: bias_dat_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 生成取BIAS值的RAM地址
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram_addr_gen
#(
	parameter ADDR_WIDTH = 7
)
(
    input i_clk,
    input i_rst_n,
    input [7:0] i_out_x_length,
  //  input [7:0] i_out_y_length,
    input [7:0] i_output_layers,
    input i_calc_en,
    input i_npe_dat_vld,
    output reg [ADDR_WIDTH - 1:0] o_ram_addr,
    output                        o_ram_rd_en
    );
    
   reg [11:0] r_cur_outXLength;
   reg [11:0] r_cur_outYLength;
   reg [8:0]  r_cur_outlayers;
   reg        r_ram_rd_en;
   
   wire c_outlayerEn;
   assign c_outlayerEn = (r_cur_outXLength == i_out_x_length -1);
   assign o_ram_rd_en = r_ram_rd_en;
   
   always@(posedge i_clk or negedge i_rst_n)begin
       if(!i_rst_n)
        r_cur_outXLength <= 11'h0;
       else if(i_calc_en)
          r_cur_outXLength <= 11'h0;
       else
           if(i_npe_dat_vld)
              if(c_outlayerEn)
               r_cur_outXLength <= 11'h0;
              else 
               r_cur_outXLength <= r_cur_outXLength + 1;
           else 
               r_cur_outXLength <= r_cur_outXLength;
    end 

         
    always@(posedge i_clk or negedge i_rst_n)begin
       if(!i_rst_n)
        r_cur_outlayers <= 8'h0;
       else if(i_calc_en)
        r_cur_outlayers <= 8'h0;
       else
           if(i_npe_dat_vld &&c_outlayerEn)
              if(r_cur_outlayers == i_output_layers-1)
               r_cur_outlayers <= 8'h0;
              else 
               r_cur_outlayers <= r_cur_outlayers + 1;
           else 
               r_cur_outlayers <= r_cur_outlayers;
    end 
         

    always@(posedge i_clk or negedge i_rst_n)begin
        if( !i_rst_n )
            o_ram_addr <= {ADDR_WIDTH{1'b0}};
        else if(i_calc_en)
            o_ram_addr <= {ADDR_WIDTH{1'b0}};
        else if(c_outlayerEn)
               if(r_cur_outlayers == 9'h0)
                o_ram_addr <= 0;
              else
                o_ram_addr <= o_ram_addr +1;
        else
            o_ram_addr <= o_ram_addr;
    end

   always @(posedge i_clk or negedge i_rst_n) begin 
       if(~i_rst_n) 
            r_ram_rd_en <= 0;  
        else if(i_calc_en|c_outlayerEn)
          r_ram_rd_en <= 1'b1 ;
        else 
            r_ram_rd_en <= 0;
   end
   
endmodule
