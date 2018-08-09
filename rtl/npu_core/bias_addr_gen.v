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


module bias_addr_gen
#(
	parameter ADDR_WIDTH = 8
)
(
    input i_clk,
    input i_rst_n,
    input [7:0] i_part_num,
    input [7:0] i_addr_start_b,
    input       i_pe_out_en,
    input       i_calc_en,
    input [7:0] i_output_layers,
    input       i_AddrEn,
   // input i_npe_dat_vld,
    output reg [ADDR_WIDTH - 1:0] o_ram_addr,
    output                        o_ram_rd_en
    );
   reg [5:0]  r_part_num;
   reg [8:0]  r_cur_outlayers;
  // reg        r_ram_rd_en;
   
   wire c_outlayerEn;
   wire c_addr_En;
   reg first_part_zero;
  

   assign c_outlayerEn = ((r_part_num == i_part_num)&& i_pe_out_en) || (first_part_zero&&i_pe_out_en);
   assign o_ram_rd_en = c_outlayerEn ;
   assign c_addr_En   = c_outlayerEn && (r_cur_outlayers==i_output_layers);

   always@(posedge i_clk or negedge i_rst_n)begin
       if(!i_rst_n)
        r_part_num <= 6'h0;
       else if(i_calc_en)
          r_part_num <= 6'h0;
       else
           if(i_pe_out_en&&i_AddrEn)
              if(r_part_num == i_part_num )
               r_part_num <= 6'h1;
              else 
               r_part_num <= r_part_num + 1;
           else 
               r_part_num <= r_part_num;
    end 
  
  //用来修改第一次的r_part计数器
always @(posedge i_clk or negedge i_rst_n) begin 
  if(~i_rst_n) begin
     first_part_zero<= 0;
  end else if (i_calc_en) 
     first_part_zero <= 1'b1 ;
     else if(i_pe_out_en && first_part_zero)
     first_part_zero <= 1'b0;
     else
     first_part_zero <= first_part_zero;  
end


  always@(posedge i_clk or negedge i_rst_n)begin
       if(!i_rst_n)
        r_cur_outlayers <= 8'h0;
       else if(i_calc_en)
        r_cur_outlayers <= 8'h1;
       else
           if(c_outlayerEn&i_AddrEn)
              if(r_cur_outlayers == i_output_layers)
               r_cur_outlayers <= 8'h1;
              else 
               r_cur_outlayers <= r_cur_outlayers + 1;
           else 
               r_cur_outlayers <= r_cur_outlayers;
    end 

    always@(posedge i_clk or negedge i_rst_n)begin
        if( !i_rst_n )
            o_ram_addr <= {ADDR_WIDTH{1'b0}};
        else if(i_calc_en)
          //  o_ram_addr <= {ADDR_WIDTH{1'b0}};
              o_ram_addr <= i_addr_start_b;
        //else if(c_outlayerEn &i_AddrEn)
          else if(o_ram_rd_en&i_AddrEn)
               if(c_addr_En)
                  o_ram_addr <= i_addr_start_b;    
                else
                  o_ram_addr <= o_ram_addr + 1;
         else
            o_ram_addr <= o_ram_addr;
    end
  
endmodule
