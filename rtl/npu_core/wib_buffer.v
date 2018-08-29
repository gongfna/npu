`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/18 23:53:17
// Design Name: 
// Module Name: wib_buffer
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


module wib_buffer#(
    parameter INIT_FILE_B = "", // Specify name/location of RAM initialization file if using one (leave blank if not)
	parameter REG_OUT=1'b0
    )(
    input  i_clk, 
    input  i_rst_n, 
    //
    output [18:0] o_wib_rdat, 
    output        o_wib_rdat_vld, 
    input  [9:0]  i_wib_raddr, 
    input         i_wib_rd_en, 
    //external data input port for axi bram controller
	output [31:0] o_wib_bramctl_rdata, 
    input  [31:0] i_wib_bramctl_wdata, 
    input  [9:0] i_wib_bramctl_addr, 
    input         i_wib_bramctl_we, 
    input  [3:0]  i_wib_bramctl_be, 
    input         i_wib_bramctl_en
);
localparam WORDSWD=10;
localparam BITS=19;
wire [BITS-1:0] ram_outa;
wire [BITS-1:0] ram_outb;
reg r_wib_rdat_vld;

assign o_wib_rdat_vld=r_wib_rdat_vld;

generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_outa_r;
reg [BITS-1:0] ram_outb_r;
assign o_wib_rdat=ram_outb_r;
assign o_wib_bramctl_rdata = {13'h0, ram_outa_r};

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
assign o_wib_rdat=ram_outb;
assign o_wib_bramctl_rdata = ram_outa;
end
endgenerate

always@(posedge i_clk or negedge i_rst_n) 
	if(~i_rst_n) begin
        r_wib_rdat_vld <= 1'b0;
	end
	else begin
        r_wib_rdat_vld <= i_wib_rd_en;
	end
    
//  simple_dual_port_ram19x1024 wib_ram (
//        .clka(i_clk),    // input wire clka
//        //Write port
//        .ena(1'b1),      // input wire ena
//        .wea(w_wib_bramctl_wren),      // input wire [0 : 0] wea
//        .addra(i_wib_bramctl_addr[9:0]),  // input wire [9 : 0] addra
//        .dina(i_wib_bramctl_wdata),    // input wire [18 : 0] dina
//        //Read port
//        .clkb(i_clk),    // input wire clkb
//        .enb(i_wib_rd_en),      // input wire enb
//        .addrb(i_wib_raddr),  // input wire [9 : 0] addrb
//        .doutb(w_ram_dout)  // output wire [18 : 0] doutb
//      );
`ifdef FPGA
wib_sram2p_wrapper
wib_ram
(
  .clka(i_clk), 
  .ena(i_wib_bramctl_en), 
  .wea(i_wib_bramctl_we), 
  .be(i_wib_bramctl_be), 
  .addra(i_wib_bramctl_addr), 
  .dina(i_wib_bramctl_wdata), 
  .clkb(i_clk), 
  .enb(i_wib_rd_en), 
  .addrb(i_wib_raddr), 
  .doutb(ram_outb)
);
`else
//-------------------------------------------------------
//----------------------- MUX -------------------------
//---------------------------------------------------

wire cena;
wire cenb;
assign cena = ~i_wib_bramctl_en;
assign cenb = ~i_wib_rd_en;

generate 
wire [32-1:0] wen;
for(genvar i=0;i<32/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_wib_bramctl_be[i]&i_wib_bramctl_we)}};
end
endgenerate

wire [2:0] EMA;
assign EMA = 3'b010;

wire [1:0] EMAW;
assign EMAW = 2'b00;

wire gwena;
assign gwena = ~i_wib_bramctl_we;
wire GWENB;
assign GWENB = 1'b1;

//- TestOut
  wire  CENYA;
  wire [BITS-1:0] WENYA;
  wire [WORDSWD-1:0] AYA;
  wire  CENYB;
  wire [BITS-1:0] WENYB;
  wire [WORDSWD-1:0] AYB;
  wire [1:0] SOA;
  wire [1:0] SOB;
  wire  GWENYA;
  wire  GWENYB;
  wire [BITS-1:0] QA;
//- TestIn
  wire  TENA;
  wire  TCENA;
  wire [BITS-1:0] TWENA;
  wire [WORDSWD-1:0] TAA;
  wire [BITS-1:0] TDA;
  wire  TENB;
  wire  TCENB;
  wire [BITS-1:0] TWENB;
  wire [WORDSWD-1:0] TAB;
  wire [BITS-1:0] TDB;
  wire [1:0] SIA;
  wire  SEA;
  wire  DFTRAMBYP;
  wire [1:0] SIB;
  wire  SEB;
  wire RET1N;
  wire  COLLDISN;
assign TENA = 1'b1;
assign TCENA = 1'b1;
assign TWENA = {BITS{1'b1}};
assign TAA = {WORDSWD{1'b0}};
assign TDA = {BITS{1'b0}};
assign TENB = 1'b1;
assign TCENB = 1'b1;
assign TWENB = {BITS{1'b1}};
assign TAB = {WORDSWD{1'b0}};
assign TDB = {BITS{1'b0}};
assign SIA = 2'b0;
assign SEA = 1'b0;
assign DFTRAMBYP = 1'b0;
assign SIB = 2'b0;
assign SEB = 1'b0;
assign RET1N = 1'b1;
assign COLLDISN = 1'b1;

//---------------------------------------------------
//-------------------------------------------------------

sramdp_wrapper
#(WORDSWD, BITS)
wib_ram
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
.QA(ram_outa), 
.CLKA(i_clk), 
.CENA(cena), 
.WENA(wen[BITS-1:0]), 
.GWENA(gwena), 
.AA(i_wib_bramctl_addr), 
.DA(i_wib_bramctl_wdata[BITS-1:0]), 
.QB(ram_outb), 
.CLKB(i_clk), 
.CENB(cenb), 
.WENB({BITS{1'b1}}), 
.GWENB(GWENB), 
.AB(i_wib_raddr), 
.DB({BITS{1'b0}}), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
`endif //`ifdef FPGA
  

endmodule
