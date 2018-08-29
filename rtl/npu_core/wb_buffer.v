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
	parameter REG_OUT=1'b0
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
    input           i_wb_bramctl_en 
    //external set input port start addr 
   // input [12:0]    i_wb_start_addr, 
    //input           i_wb_start_addr_en
);

localparam WORDSWD=13;
localparam BITS=416; //512
localparam RAM_AWD=11;
localparam RAM_BITS=32;
wire [BITS-1:0] ram_outa;
wire [BITS-1:0] ram_outb;
//wire w_wb_bramctl_wren;
reg [12:0] r_wb_wren_mask;
reg [12:0] r_wb_waddr;
reg r_wdata_vld;
reg r_bypass_wb;

//assign w_wb_bramctl_wren=(i_wb_bramctl_we==4'hf)&&i_wb_bramctl_en;

assign o_wdata_vld=r_wdata_vld;
//assign o_wdata = r_bypass_wb ? 416'b0 : ram_out;


generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_outa_r;
reg [BITS-1:0] ram_outb_r;
assign o_wb_bramctl_rdata = ram_outa_r;
assign o_wdata = r_bypass_wb ? 416'b0 : ram_outb_r;

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
assign o_wb_bramctl_rdata = ram_outa;
assign o_wdata = r_bypass_wb ? 416'b0 : ram_outb;
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
  .doutb(ram_outb)
);
`else

wire cena;
wire cenb;
assign cena = ~i_wb_bramctl_en;
assign cenb = ~i_wb_rd_en;

generate 
wire [BITS-1:0] wen;
wire [BITS-1:0] wenb;
for(genvar i=0;i<BITS/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_wb_bramctl_be[i]&i_wb_bramctl_we)}};
end
endgenerate
assign wenb = {BITS{1'b1}};

wire [WORDSWD-1:0] addra;
wire [WORDSWD-1:0] addrb;
assign addra = i_wb_bramctl_addr;
assign addrb = i_wb_raddr;

wire [BITS-1:0] wdataa;
wire [BITS-1:0] wdatab;
assign wdataa = i_wb_bramctl_wdata;
assign wdatab = {BITS{1'b0}};


wire gwena;
assign gwena = ~i_wb_bramctl_we;
wire GWENB;
assign GWENB = 1'b1;
//---------------------------------------------------
//-------------------------------------------------------

wire [2:0] EMA;
assign EMA = 3'b010;

wire [1:0] EMAW;
assign EMAW = 2'b00;


//- TestOut
  wire  CENYA;
  wire [RAM_BITS-1:0] WENYA;
  wire [RAM_AWD-1:0] AYA;
  wire  CENYB;
  wire [RAM_BITS-1:0] WENYB;
  wire [RAM_AWD-1:0] AYB;
  wire [1:0] SOA;
  wire [1:0] SOB;
  wire  GWENYA;
  wire  GWENYB;
//- TestIn
  wire  TENA;
  wire  TCENA;
  wire [RAM_BITS-1:0] TWENA;
  wire [RAM_AWD-1:0] TAA;
  wire [RAM_BITS-1:0] TDA;
  wire  TENB;
  wire  TCENB;
  wire [RAM_BITS-1:0] TWENB;
  wire [RAM_AWD-1:0] TAB;
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
assign TAA = {RAM_AWD{1'b0}};
assign TDA = {RAM_BITS{1'b0}};
assign TENB = 1'b1;
assign TCENB = 1'b1;
assign TWENB = {RAM_BITS{1'b1}};
assign TAB = {RAM_AWD{1'b0}};
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
localparam MERGE_BITS=2**(WORDSWD-RAM_AWD);
wire [MERGE_BITS-1:0] cena_merge;
wire [MERGE_BITS-1:0] cenb_merge;
wire [BITS-1:0] ram_out3a;
wire [BITS-1:0] ram_out2a;
wire [BITS-1:0] ram_out1a;
wire [BITS-1:0] ram_out0a;
wire [BITS-1:0] ram_out3b;
wire [BITS-1:0] ram_out2b;
wire [BITS-1:0] ram_out1b;
wire [BITS-1:0] ram_out0b;
generate 
if((WORDSWD-RAM_AWD)==2) begin
assign cena_merge[3] = ~( addra[WORDSWD-1] &  addra[WORDSWD-2] & ~cena);
assign cena_merge[2] = ~( addra[WORDSWD-1] & ~addra[WORDSWD-2] & ~cena);
assign cena_merge[1] = ~(~addra[WORDSWD-1] &  addra[WORDSWD-2] & ~cena);
assign cena_merge[0] = ~(~addra[WORDSWD-1] & ~addra[WORDSWD-2] & ~cena);
assign ram_outa = addra[WORDSWD-1] & addra[WORDSWD-2] ? ram_out3a :
                 addra[WORDSWD-1] & ~addra[WORDSWD-2] ? ram_out2a :
                 ~addra[WORDSWD-1] & addra[WORDSWD-2] ? ram_out1a :
				                                        ram_out0a;
assign cenb_merge[3] = ~( addrb[WORDSWD-1] &  addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[2] = ~( addrb[WORDSWD-1] & ~addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[1] = ~(~addrb[WORDSWD-1] &  addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[0] = ~(~addrb[WORDSWD-1] & ~addrb[WORDSWD-2] & ~cenb);
assign ram_outb  = addrb[WORDSWD-1] &  addrb[WORDSWD-2] ? ram_out3b :
                  addrb[WORDSWD-1] & ~addrb[WORDSWD-2] ? ram_out2b :
                 ~addrb[WORDSWD-1] &  addrb[WORDSWD-2] ? ram_out1b :
				                                         ram_out0b;
end
if((WORDSWD-RAM_AWD)==1) begin
assign cena_merge[1] = ~( addra[WORDSWD-1] & ~cena);
assign cena_merge[0] = ~(~addra[WORDSWD-1] & ~cena);
assign ram_outa = addra[WORDSWD-1] ? ram_out1a :
				                     ram_out0a;
assign cenb_merge[1] = ~( addrb[WORDSWD-1] & ~cenb);
assign cenb_merge[0] = ~(~addrb[WORDSWD-1] & ~cenb);
assign ram_outb  = addrb[WORDSWD-1] ? ram_out1b :
				                     ram_out0b;
end
if((WORDSWD-RAM_AWD)==0) begin
assign cena_merge = cena;
assign cenb_merge = cenb;
end
endgenerate

generate
for(genvar num=0;num<(BITS/RAM_BITS);num=num+1) begin
if((WORDSWD-RAM_AWD)==2) begin
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram3
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
.QA(ram_out3a[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge[3]), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_out3b[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge[3]), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB({RAM_BITS{1'b0}}), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram2
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
.QA(ram_out2a[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge[2]), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_out2b[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge[2]), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB({RAM_BITS{1'b0}}), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
end
if((WORDSWD-RAM_AWD)>=1) begin
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram1
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
.QA(ram_out1a[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge[1]), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_out1b[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge[1]), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB({RAM_BITS{1'b0}}), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram0
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
.QA(ram_out0a[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge[0]), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_out0b[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge[0]), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB({RAM_BITS{1'b0}}), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
end
if((WORDSWD-RAM_AWD)==0) begin
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram
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
.CENA(cena_merge), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_outb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB({RAM_BITS{1'b0}}), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
end
end //gen for
endgenerate


`endif //`ifdef FPGA
                  
endmodule
