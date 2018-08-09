`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/19 00:33:44
// Design Name: 
// Module Name: wb_buffer
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


module wb_buffer#(
    // Specify name/location of RAM initialization file if using one (leave blank if not)
    parameter INIT_FILE0  = "",
    parameter INIT_FILE1  = "",
    parameter INIT_FILE2  = "",
    parameter INIT_FILE3  = "",
    parameter INIT_FILE4  = "",
    parameter INIT_FILE5  = "",
    parameter INIT_FILE6  = "",
    parameter INIT_FILE7  = "",
    parameter INIT_FILE8  = "",
    parameter INIT_FILE9  = "",
    parameter INIT_FILE10 = "",
    parameter INIT_FILE11 = "",
    parameter INIT_FILE12 = "", 
	parameter REG_OUT=1'b1
    )(
    input           i_clk, 
    input           i_rst_n, 
    //
    input [12:0]    i_wb_raddr, 
    input           i_wb_rd_en, 
    input			i_bypass_wb, 
    output [415:0]  o_wdata, 
    output          o_wdata_vld, 

    //external data input port for axi bram controller
    output [415:0]   o_wb_bramctl_rdata, 
    input [415:0]   i_wb_bramctl_wdata, 
    input [12:0]    i_wb_bramctl_addr, 
    input [51:0]    i_wb_bramctl_be, 
    input           i_wb_bramctl_we, 
    input           i_wb_bramctl_en, 
    //external set input port start addr 
    input [12:0]    i_wb_start_addr, 
    input           i_wb_start_addr_en
);

localparam WORDSWD=13;
localparam BITS=416; //512
wire [BITS-1:0] ram_out;
wire w_wb_bramctl_wren;
reg [12:0] r_wb_wren_mask;
reg [12:0] r_wb_waddr;
reg r_wdata_vld;
reg r_bypass_wb;

assign w_wb_bramctl_wren=(i_wb_bramctl_we==4'hf)&&i_wb_bramctl_en;

assign o_wdata_vld=r_wdata_vld;
//assign o_wdata = r_bypass_wb ? 416'b0 : ram_out;


generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_out_r;
assign o_wb_bramctl_rdata = ram_out_r;
assign o_wdata = r_bypass_wb ? 416'b0 : ram_out_r;

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
		ram_out_r <= 'h0;
	end
	else begin
		ram_out_r <= ram_out;
	end
end
else begin //REG_OUT==1'b0
assign o_wb_bramctl_rdata = ram_out;
assign o_wdata = r_bypass_wb ? 416'b0 : ram_out;
end
endgenerate


always@(posedge i_clk or negedge i_rst_n) begin
  if(i_rst_n==0) begin
    r_wdata_vld<=0;
    r_bypass_wb<= 0;
  end else begin
    r_wdata_vld<=i_wb_rd_en;
    r_bypass_wb <= i_bypass_wb;
  end 
end

always@(posedge i_clk or negedge i_rst_n) begin
  if(i_rst_n==0) begin
      r_wb_wren_mask<=13'b1;
  end else if(i_wb_start_addr_en) begin
      r_wb_wren_mask<=13'b1;
  end else if(w_wb_bramctl_wren) begin
      r_wb_wren_mask<={r_wb_wren_mask[11:0],r_wb_wren_mask[12]};
  end else begin
      r_wb_wren_mask<=r_wb_wren_mask;
  end
end

always@(posedge i_clk or negedge i_rst_n) begin
  if(i_rst_n==0) begin
      r_wb_waddr<=13'b0;
  end else if(i_wb_start_addr_en) begin
      r_wb_waddr<=i_wb_start_addr;
  end else if(w_wb_bramctl_wren&&r_wb_wren_mask[12]) begin
      r_wb_waddr<=r_wb_waddr+13'd1;
  end else begin
      r_wb_waddr<=r_wb_waddr;
  end
end
    
  
    
//    simple_dual_port_ram32x8192 wb_ram0 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[3:0]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[31:0]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[31:0])  // output wire [31 : 0] doutb
//    );
//    
//      simple_dual_port_ram32x8192 wb_ram1 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[7:4]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[63:32]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[63:32])  // output wire [31 : 0] doutb
//    );
//    
//     simple_dual_port_ram32x8192 wb_ram2 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[11:8]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[95:64]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[95:64])  // output wire [31 : 0] doutb
//    );
//  
//    simple_dual_port_ram32x8192 wb_ram3 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[15:12]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[127:96]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[127:96])  // output wire [31 : 0] doutb
//    );
//  
//  
//    simple_dual_port_ram32x8192 wb_ram4 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[19:16]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[159:128]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[159:128])  // output wire [31 : 0] doutb
//    );
//  
//    simple_dual_port_ram32x8192 wb_ram5 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[23:20]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[191:160]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[191:160])  // output wire [31 : 0] doutb
//    );
//    
//    simple_dual_port_ram32x8192 wb_ram6 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[27:24]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[223:192]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[223:192])  // output wire [31 : 0] doutb
//    );
//    
//   simple_dual_port_ram32x8192 wb_ram7 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[31:28]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[255:224]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[255:224])  // output wire [31 : 0] doutb
//    );
//    
//    simple_dual_port_ram32x8192 wb_ram8 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[35:32]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[287:256]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[287:256])  // output wire [31 : 0] doutb
//    );
//    
//    simple_dual_port_ram32x8192 wb_ram9 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[39:36]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[319:288]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[319:288])  // output wire [31 : 0] doutb
//    );
//    
//    simple_dual_port_ram32x8192 wb_ram10 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[43:40]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[351:320]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[351:320])  // output wire [31 : 0] doutb
//    );
//  
//    simple_dual_port_ram32x8192 wb_ram11 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[47:44]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[383:352]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[383:352])  // output wire [31 : 0] doutb
//    );
//    
//    simple_dual_port_ram32x8192 wb_ram12 (
//      .clka(i_clk),    // input wire clka
//      //Write port
//      .ena(1'b1),      // input wire ena
//      .wea(i_wb_bramctl_be[51:48]&{4{i_wb_bramctl_we}}),      // input wire [3 : 0] wea
//      .addra(i_wb_bramctl_addr),  // input wire [12 : 0] addra
//      .dina(i_wb_bramctl_wdata[415:384]),    // input wire [31 : 0] dina
//      //Read port
//      .clkb(i_clk),    // input wire clkb
//      .enb(i_wb_rd_en),      // input wire enb
//      .addrb(i_wb_raddr),  // input wire [12 : 0] addrb
//      .doutb(c_wdata[415:384])  // output wire [31 : 0] doutb
//    );
    
`ifdef FPGA
wb_sram2p_wrapper
wb_ram
(
  .clka(i_clk), 
  .ena(i_wb_bramctl_en), 
  .wea(i_wb_bramctl_we), 
  .be(i_wb_bramctl_be), 
  .addra(i_wb_bramctl_addr), 
  .dina(i_wb_bramctl_wdata), 
  .clkb(i_clk), 
  .enb(i_wb_rd_en), 
  .addrb(i_wb_raddr), 
  .doutb(ram_out)
);
`else

wire cen;
assign cen = ~(i_wb_bramctl_en| i_wb_rd_en);

generate 
wire [BITS-1:0] wen;
for(genvar i=0;i<BITS/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_wb_bramctl_be[i]&i_wb_bramctl_we)}};
end
endgenerate

wire [WORDSWD-1:0] addr;
assign addr = i_wb_rd_en? i_wb_raddr: i_wb_bramctl_addr;

wire [BITS-1:0] wdata;
assign wdata = i_wb_bramctl_wdata;

wire [2:0] ema;
assign ema = 3'b010;

wire [1:0] emaw;
assign emaw = 2'b00;

wire gwen;
assign gwen = ~i_wb_bramctl_we;

wire ret1n;
assign ret1n = 1'b1;

sramsp_wrapper
#(WORDSWD, 128)
wb_ram3
//(
//.Q(ram_out[128+128+128+31:128+128+32]), 
//.CLK(i_clk), 
//.CEN(cen), 
//.WEN(wen[128+128+128+31:128+128+32]), 
//.A(addr), 
//.D(wdata[128+128+128+31:128+128+32]), 
//.EMA(ema), 
//.EMAW(emaw), 
//.GWEN(gwen), 
//.RET1N(ret1n)
//);
(
.CENY(), 
.WENY(), 
.AY(), 
.GWENY(), 
.Q(ram_out[128+128+128+31:128+128+32]), 
.SO(), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[128+128+128+31:128+128+32]), 
.A(addr), 
.D(wdata[128+128+128+31:128+128+32]), 
.EMA(ema), 
.EMAW(emaw),
.TEN(1'b1), 
.TCEN(1'b1), 
.TWEN({128{1'b1}}), 
.TA({WORDSWD{1'b0}}), 
.TD({128{1'b0}}), 
.GWEN(gwen), 
.TGWEN(1'b1), 
.RET1N(ret1n), 
.SI(2'b0), 
.SE(1'b0), 
.DFTRAMBYP(1'b0)

);

sramsp_wrapper
#(WORDSWD, 128)
wb_ram2
//-(
//-.Q(ram_out[128+128+31:128+32]), 
//-.CLK(i_clk), 
//-.CEN(cen), 
//-.WEN(wen[128+128+31:128+32]), 
//-.A(addr), 
//-.D(wdata[128+128+31:128+32]), 
//-.EMA(ema), 
//-.EMAW(emaw), 
//-.GWEN(gwen), 
//-.RET1N(ret1n)
//-);
//-(
(
.CENY(), 
.WENY(), 
.AY(), 
.GWENY(), 
.Q(ram_out[128+128+31:128+32]), 
.SO(), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[128+128+31:128+32]), 
.A(addr), 
.D(wdata[128+128+31:128+32]), 
.EMA(ema), 
.EMAW(emaw),
.TEN(1'b1), 
.TCEN(1'b1), 
.TWEN({128{1'b1}}), 
.TA({WORDSWD{1'b0}}), 
.TD({128{1'b0}}), 
.GWEN(gwen), 
.TGWEN(1'b1), 
.RET1N(ret1n), 
.SI(2'b0), 
.SE(1'b0), 
.DFTRAMBYP(1'b0)

);
sramsp_wrapper
#(WORDSWD, 128)
wb_ram1
//-(
//-.Q(ram_out[128+31:32]), 
//-.CLK(i_clk), 
//-.CEN(cen), 
//-.WEN(wen[128+31:32]), 
//-.A(addr), 
//-.D(wdata[128+31:32]), 
//-.EMA(ema), 
//-.EMAW(emaw), 
//-.GWEN(gwen), 
//-.RET1N(ret1n)
//-);
(
.CENY(), 
.WENY(), 
.AY(), 
.GWENY(), 
.Q(ram_out[128+31:32]), 
.SO(), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[128+31:32]), 
.A(addr), 
.D(wdata[128+31:32]), 
.EMA(ema), 
.EMAW(emaw),
.TEN(1'b1), 
.TCEN(1'b1), 
.TWEN({128{1'b1}}), 
.TA({WORDSWD{1'b0}}), 
.TD({128{1'b0}}), 
.GWEN(gwen), 
.TGWEN(1'b1), 
.RET1N(ret1n), 
.SI(2'b0), 
.SE(1'b0), 
.DFTRAMBYP(1'b0)

);
sramsp_wrapper
#(WORDSWD, 32)
wb_ram0
//-(
//-.Q(ram_out[31:0]), 
//-.CLK(i_clk), 
//-.CEN(cen), 
//-.WEN(wen[31:0]), 
//-.A(addr), 
//-.D(wdata[31:0]), 
//-.EMA(ema), 
//-.EMAW(emaw), 
//-.GWEN(gwen), 
//-.RET1N(ret1n)
//-);
(
.CENY(), 
.WENY(), 
.AY(), 
.GWENY(), 
.Q(ram_out[31:0]), 
.SO(), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[31:0]), 
.A(addr), 
.D(wdata[31:0]), 
.EMA(ema), 
.EMAW(emaw),
.TEN(1'b1), 
.TCEN(1'b1), 
.TWEN({32{1'b1}}), 
.TA({WORDSWD{1'b0}}), 
.TD({32{1'b0}}), 
.GWEN(gwen), 
.TGWEN(1'b1), 
.RET1N(ret1n), 
.SI(2'b0), 
.SE(1'b0), 
.DFTRAMBYP(1'b0)

);
`endif //`ifdef FPGA
                  
endmodule
