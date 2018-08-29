
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/22 00:21:00
// Design Name: 
// Module Name: bias_buffer
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
	parameter REG_OUT=1'b0
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
localparam RAM_BITS=64;
wire [BITS-1:0] ram_outa;
wire [BITS-1:0] ram_outb;
wire [WORDSWD-1:0] c_ram_addr;
reg r_ram_dat_vld;

assign c_ram_addr = i_ram_addr;
assign o_ram_dat_vld = r_ram_dat_vld;

generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_outa_r;
reg [BITS-1:0] ram_outb_r;
assign o_bias_bramctl_rdata = ram_outa_r;
assign o_ram_dat = ram_outb_r;

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
		ram_outa_r <= 'h0;
		ram_outb_r <= 'h0;
	end
	else begin
		ram_outa_r <= ram_outa;
		ram_outb_r <= ram_outb;
	end
end
else begin //REG_OUT==1'b0
assign o_bias_bramctl_rdata = ram_outa;
assign o_ram_dat = ram_outb;
end
endgenerate


always @(posedge i_clk or negedge i_rst_n) 
	if(~i_rst_n) begin
		r_ram_dat_vld <= 1'b0;
	end 
	else begin 
		r_ram_dat_vld <= i_ram_rd_en;
	end
    
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
  .doutb(ram_outb)
);
`else

wire cena;
wire cenb;
assign cena = ~i_bias_bramctl_en;
assign cenb = ~i_ram_rd_en;

generate 
wire [BITS-1:0] wen;
for(genvar i=0;i<BITS/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_bias_bramctl_be[i]&i_bias_bramctl_we)}};
end
endgenerate

wire gwena;
assign gwena = ~i_bias_bramctl_we;

wire GWENB;
assign GWENB = 1'b1;

wire [2:0] EMA;
assign EMA = 3'b010;

wire [1:0] EMAW;
assign EMAW = 2'b00;


//- TestOut
  wire  CENYA;
  wire [RAM_BITS-1:0] WENYA;
  wire [WORDSWD-1:0] AYA;
  wire  CENYB;
  wire [RAM_BITS-1:0] WENYB;
  wire [WORDSWD-1:0] AYB;
  wire [1:0] SOA;
  wire [1:0] SOB;
  wire  GWENYA;
  wire  GWENYB;
  wire [RAM_BITS-1:0] QA;
//- TestIn
  wire  TENA;
  wire  TCENA;
  wire [RAM_BITS-1:0] TWENA;
  wire [WORDSWD-1:0] TAA;
  wire [RAM_BITS-1:0] TDA;
  wire  TENB;
  wire  TCENB;
  wire [RAM_BITS-1:0] TWENB;
  wire [WORDSWD-1:0] TAB;
  wire [RAM_BITS-1:0] TDB;
  wire [1:0] SIA;
  wire  SEA;
  wire  DFTRAMBYP;
  wire [1:0] SIB;
  wire  SEB;
  wire RET1N;
  wire  COLLDISN;
assign TENA = 1'b1;
assign TCENA = 1'b1;
assign TWENA = {RAM_BITS{1'b1}};
assign TAA = {WORDSWD{1'b0}};
assign TDA = {RAM_BITS{1'b0}};
assign TENB = 1'b1;
assign TCENB = 1'b1;
assign TWENB = {RAM_BITS{1'b1}};
assign TAB = {WORDSWD{1'b0}};
assign TDB = {RAM_BITS{1'b0}};
assign SIA = 2'b0;
assign SEA = 1'b0;
assign DFTRAMBYP = 1'b0;
assign SIB = 2'b0;
assign SEB = 1'b0;
assign RET1N = 1'b1;
assign COLLDISN = 1'b1;
//---------------------------------------------------
//-------------------------------------------------------

generate 
for(genvar num=0;num<(BITS/RAM_BITS);num=num+1)
sramdp_wrapper
#(WORDSWD, RAM_BITS)
biasb_ram
(
.CENYA(CENYA), 
.WENYA(WENYA), 
.AYA(AYA), 
.CENYB(CENYB), 
.WENYB(WENYB), 
.AYB(AYB), 
.SOA(SOA), 
.SOB(SOB),
.TENA(TENA),
.TCENA(TCENA), 
.TWENA(TWENA), 
.TAA(TAA), 
.TDA(TDA), 
.TENB(TENB), 
.TCENB(TCENB), 
.TWENB(TWENB), 
.TAB(TAB), 
.TDB(TDB), 
.SIA(SIA), 
.SEA(SEA), 
.DFTRAMBYP(DFTRAMBYP), 
.SIB(SIB), 
.SEB(SEB), 
.RET1N(RET1N), 
.COLLDISN(COLLDISN), 
.QA(ram_outa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(i_bias_bramctl_addr), 
.DA(i_bias_bramctl_wdata[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_outb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb), 
.WENB({RAM_BITS{1'b1}}), 
.GWENB(GWENB), 
.AB(c_ram_addr), 
.DB({RAM_BITS{1'b0}}), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
endgenerate

`endif //`ifdef FPGA

  
endmodule

