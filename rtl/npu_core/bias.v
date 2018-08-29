`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:wuzhi
// 
// Create Date: 2018/01/09 21:13:00
// Design Name: 
// Module Name: bias
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//����NPE���ݣ�����bias RAM�ĵ�ַ��ȡ��ӦBiasֵ��������
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bias #(
    parameter RAM_ADDR_WIDTH = 8
)
(
    input i_clk,
    input i_rst_n,
    input i_calc_en,
    input [511:0] i_npe_dat_out,
    input i_npe_dat_vld,
    input [4:0] i_part_num,
    input       i_pe_out_en,
    input [7:0] i_output_layers,
    input [7:0] i_addr_start_b,
    input       i_calculate_end,
   // input i_npe_dat_vld,
    output  [RAM_ADDR_WIDTH - 1:0] o_ram_addr,
    output                        o_ram_rd_en,
    input           i_ram_dat_vld, 
    input  [511:0]   i_ram_dat,
    output [511:0]  o_bias_dat_o
    );

   // reg [511:0] i_npe_dat_out_r;
    //reg [511:0] r_ram_dat;
    reg r_AddrEn;
   // wire[511:0] c_ram_dat = i_ram_dat_vld?i_ram_dat:r_ram_dat;
    
    // always@(posedge i_clk)begin
    //     i_npe_dat_out_r <= i_npe_dat_out;
    // end

    // // always@(posedge i_clk or negedge i_rst_n)begin
    // //   if(!i_rst_n)
    // //     r_ram_dat <= 'b0;
    // //   else if(i_ram_dat_vld)
    // //     r_ram_dat <= i_ram_dat;
    // //     else 
    // //     r_ram_dat <= r_ram_dat;
    // // end

   always @(posedge i_clk or negedge i_rst_n) begin 
     if(~i_rst_n) 
        r_AddrEn <= 0;
     else if(i_calc_en) 
        r_AddrEn <= 1'b1 ;
    else if(i_calculate_end)
        r_AddrEn <= 1'b0;
    else 
        r_AddrEn <= r_AddrEn;
   end

    //bias adder_gen         
    bias_addr_gen#(
       .ADDR_WIDTH(RAM_ADDR_WIDTH)
    )
        bias_addr_gen(
            .i_clk(i_clk),
            .i_rst_n(i_rst_n),
            .i_addr_start_b(i_addr_start_b),
            .i_part_num(i_part_num),
            .i_pe_out_en(i_pe_out_en),
            .i_output_layers(i_output_layers),
            .i_AddrEn(r_AddrEn ),
            .i_calc_en(i_calc_en), 
            .o_ram_addr(o_ram_addr),
            .o_ram_rd_en(o_ram_rd_en)      
        );

    add_32x16b add_32x16b(              
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_calc_en(r_AddrEn),
        .i_npe_dat_out(i_npe_dat_out),
        .i_ram_dat(i_ram_dat),
        .o_bias_dat_o(o_bias_dat_o)
        );
        
endmodule
