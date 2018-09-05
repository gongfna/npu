`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/18 23:53:17
// Design Name: 
// Module Name: inst_buffer
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


module inst_buffer#(
    parameter INIT_FILE_B = "", // Specify name/location of RAM initialization file if using one (leave blank if not)
	parameter REG_OUT=1'b0
    )(
    input  i_clk, 
    input  i_rst_n, 
    //
    output [127:0] o_inst_rdat, 
	output         o_inst_rdat_vld, 
    input  [11:0]  i_inst_raddr, 
	input          i_inst_rd_en, 
    //external data input port for axi bram controller
    output [127:0] o_inst_bramctl_rdata, 
    input  [127:0] i_inst_bramctl_wdata, 
	input  [11:0]  i_inst_bramctl_addr, 
    input  [15:0]  i_inst_bramctl_be, 
    input          i_inst_bramctl_we, 
    input          i_inst_bramctl_en
);
localparam WORDSWD=12;
localparam BITS=128;
localparam RAM_AWD=10;
localparam RAM_BITS=64;
wire [BITS-1:0] ram_outa;
wire [BITS-1:0] ram_outb;
reg r_inst_rdat_vld;

generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_outa_r;
reg [BITS-1:0] ram_outb_r;
assign o_inst_bramctl_rdata = ram_outa_r;
assign o_inst_rdat=ram_outb_r[BITS-1:0];

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
assign o_inst_bramctl_rdata = ram_outa;
assign o_inst_rdat=ram_outb[BITS-1:0];
end
endgenerate

assign o_inst_rdat_vld=r_inst_rdat_vld;

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
        r_inst_rdat_vld <= 1'b0;
    end 
	else begin
        r_inst_rdat_vld <= i_inst_rd_en;
    end
    
`ifdef FPGA
instb_sram2p_wrapper
inst_ram
(
  .clka(i_clk), 
  .ena(i_inst_bramctl_en), 
  .wea(i_inst_bramctl_we), 
  .be(i_inst_bramctl_be), 
  .addra(i_inst_bramctl_addr), 
  .dina(i_inst_bramctl_wdata), 
  .clkb(i_clk), 
  .enb(i_inst_rd_en), 
  .addrb(i_inst_raddr), 
  .doutb(ram_outb)
);
`else
//-------------------------------------------------------
//----------------------- MUX -------------------------
//---------------------------------------------------
wire cena;
wire cenb;
assign cena = ~i_inst_bramctl_en;
assign cenb = ~i_inst_rd_en;

generate 
wire [BITS-1:0] wen;
for(genvar i=0;i<BITS/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_inst_bramctl_be[i]&i_inst_bramctl_we)}};
end
endgenerate

wire [WORDSWD-1:0] addra;
wire [WORDSWD-1:0] addrb;
assign addra = i_inst_bramctl_addr;
assign addrb = i_inst_raddr;

wire [BITS-1:0] wdataa;
assign wdataa = i_inst_bramctl_wdata;

wire gwena;
assign gwena = ~i_inst_bramctl_we;
//---------------------------------------------------
//-------------------------------------------------------

wire GWENB;
assign GWENB = 1'b1;

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
reg [WORDSWD-RAM_AWD-1:0] addra_r;
reg [WORDSWD-RAM_AWD-1:0] addrb_r;
always @(posedge i_clk or negedge i_rst_n) 
	if(~i_rst_n) begin
		addra_r <= 'b0;
		addrb_r <= 'b0;
	end
	else begin
		addra_r <= addra[WORDSWD-1:WORDSWD-2];
		addrb_r <= addrb[WORDSWD-1:WORDSWD-2];
	end
assign cena_merge[3] = ~( addra[WORDSWD-1] &  addra[WORDSWD-2] & ~cena);
assign cena_merge[2] = ~( addra[WORDSWD-1] & ~addra[WORDSWD-2] & ~cena);
assign cena_merge[1] = ~(~addra[WORDSWD-1] &  addra[WORDSWD-2] & ~cena);
assign cena_merge[0] = ~(~addra[WORDSWD-1] & ~addra[WORDSWD-2] & ~cena);
assign ram_outa = addra_r[1] &  addra_r[0] ? ram_out3a :
                  addra_r[1] & ~addra_r[0] ? ram_out2a :
                 ~addra_r[1] &  addra_r[0] ? ram_out1a :
				                                        ram_out0a;
assign cenb_merge[3] = ~( addrb[WORDSWD-1] &  addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[2] = ~( addrb[WORDSWD-1] & ~addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[1] = ~(~addrb[WORDSWD-1] &  addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[0] = ~(~addrb[WORDSWD-1] & ~addrb[WORDSWD-2] & ~cenb);
assign ram_outb  = addrb_r[1] &  addrb_r[0] ? ram_out3b :
                   addrb_r[1] & ~addrb_r[0] ? ram_out2b :
                  ~addrb_r[1] &  addrb_r[0] ? ram_out1b :
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
.WENB({RAM_BITS{1'b1}}), 
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
.WENB({RAM_BITS{1'b1}}), 
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
.WENB({RAM_BITS{1'b1}}), 
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
.WENB({RAM_BITS{1'b1}}), 
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
.WENB({RAM_BITS{1'b1}}), 
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
