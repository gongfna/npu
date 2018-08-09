
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/22 00:21:00
// Design Name: 
// Module Name: io_buffer
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

module bias_buffer #(
    parameter BIAS_INIT_FILE = "", // Specify name/location of RAM initialization file if using one (leave blank if not)
	parameter REG_OUT=1'b1
    )(
    input i_clk, 
    input i_rst_n, 
    //external data input port for axi bram controller
    output [511:0]  o_bias_bramctl_rdata, 
    input  [6:0]    i_bias_bramctl_addr, 
    input           i_bias_bramctl_en, 
    input  [63:0]   i_bias_bramctl_be, 
    input           i_bias_bramctl_we, 
    input  [511:0]  i_bias_bramctl_wdata, 
	

    //internel bias buffer port
	input [6:0] i_ram_addr, 
	input i_ram_rd_en, 

	output [511:0] o_ram_dat, 
	output o_ram_dat_vld
	);

localparam WORDSWD=7;
localparam BITS=512;
wire [BITS-1:0] ram_out;
wire [WORDSWD-1:0] c_ram_addr;
reg r_ram_dat_vld;

assign c_ram_addr = i_ram_addr;
assign o_ram_dat_vld = r_ram_dat_vld;

generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_out_r;
assign o_ram_dat = ram_out_r;
assign o_bias_bramctl_rdata = ram_out_r;

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
		ram_out_r <= 'h0;
	end
	else begin
		ram_out_r <= ram_out;
	end
end
else begin //REG_OUT==1'b0
assign o_ram_dat = ram_out;
assign o_bias_bramctl_rdata = ram_out;
end
endgenerate


always @(posedge i_clk or negedge i_rst_n) 
	if(~i_rst_n) begin
		r_ram_dat_vld <= 1'b0;
	end 
	else begin 
		r_ram_dat_vld <= i_ram_rd_en;
	end
    
//   simple_dual_port_ram512x128 u_bias (
//      .clka(i_clk),    // input wire clka
//      //write port
//      .ena(i_bias_bramctl_en),      // input wire ena
//      .wea(i_bias_bramcrl_be & {64{i_bias_bramctl_we}}),      // input wire [63 : 0] wea
//      .addra(i_bias_bramctl_addr[7:0]),  // input wire [6 : 0] addra
//      .dina(i_bias_bramctl_wdata),    // input wire [511 : 0] dina
//      //read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_ram_rd_en),      // input wire enb
//      .addrb(c_ram_addr),  // input wire [6 : 0] addrb
//      .doutb(o_ram_dat)  // output wire [511 : 0] doutb
//    );
`ifdef FPGA
biasb_sram2p_wrapper
biasb_ram
(
  .clka(i_clk), 
  .ena(i_bias_bramctl_en), 
  .wea(i_bias_bramctl_we), 
  .be(i_bias_bramctl_be), 
  .addra(i_bias_bramctl_addr[6:0]), 
  .dina(i_bias_bramctl_wdata), 
  .clkb(i_clk), 
  .enb(i_ram_rd_en), 
  .addrb(c_ram_addr[6:0]), 
  .doutb(ram_out)
);
`else

wire cen;
assign cen = ~(i_bias_bramctl_en | i_ram_rd_en);

generate 
wire [BITS-1:0] wen;
for(genvar i=0;i<BITS/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_bias_bramctl_be[i]&i_bias_bramctl_we)}};
end
endgenerate

wire [WORDSWD-1:0] addr;
assign addr = i_ram_rd_en ? c_ram_addr : i_bias_bramctl_addr;

wire [BITS-1:0] wdata;
assign wdata = i_bias_bramctl_wdata;

wire [2:0] ema;
assign ema = 3'b010;

wire [1:0] emaw;
assign emaw = 2'b00;

wire gwen;
assign gwen = ~i_bias_bramctl_we;

wire ret1n;
assign ret1n = 1'b1;

rfsp_wrapper
#(WORDSWD, 128)
biasb_ram3
(
.Q(ram_out[128+128+128+127:128+128+128+0]), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[128+128+128+127:128+128+128+0]), 
.A(addr), 
.D(wdata[128+128+128+127:128+128+128+0]), 
.EMA(ema), 
.EMAW(emaw), 
.GWEN(gwen), 
.RET1N(ret1n)
);

rfsp_wrapper
#(WORDSWD, 128)
biasb_ram2
(
.Q(ram_out[128+128+127:128+128+0]), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[128+128+127:128+128+0]), 
.A(addr), 
.D(wdata[128+128+127:128+128+0]), 
.EMA(ema), 
.EMAW(emaw), 
.GWEN(gwen), 
.RET1N(ret1n)
);

rfsp_wrapper
#(WORDSWD, 128)
biasb_ram1
(
.Q(ram_out[128+127:128+0]), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[128+127:128+0]), 
.A(addr), 
.D(wdata[128+127:128+0]), 
.EMA(ema), 
.EMAW(emaw), 
.GWEN(gwen), 
.RET1N(ret1n)
);

rfsp_wrapper
#(WORDSWD, 128)
biasb_ram0
(
.Q(ram_out[127:0]), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[127:0]), 
.A(addr), 
.D(wdata[127:0]), 
.EMA(ema), 
.EMAW(emaw), 
.GWEN(gwen), 
.RET1N(ret1n)
);
`endif //`ifdef FPGA

  
endmodule

