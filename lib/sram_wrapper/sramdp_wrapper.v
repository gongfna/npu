
`define SRAMSP_IO_CONN \
.CENY(CENY), \
.WENY(WENY), \
.AY(AY), \
.GWENY(GWENY), \
.Q(Q), \
.SO(SO), \
.CLK(CLK), \
.CEN(CEN), \
.WEN(WEN), \
.A(A), \
.D(D), \
.EMA(EMA), \
.EMAW(EMAW),\
.TEN(TEN), \
.TCEN(TCEN), \
.TWEN(TWEN), \
.TA(TA), \
.TD(TD), \
.GWEN(GWEN), \
.TGWEN(TGWEN), \
.RET1N(RET1N), \
.SI(SI), \
.SE(SE), \
.DFTRAMBYP(DFTRAMBYP)

`define SRAMDP_IO_CONN \
.CENYA(CENYA), \
.WENYA(WENYA), \
.AYA(AYA), \
.CENYB(CENYB), \
.WENYB(WENYB), \
.AYB(AYB), \
.GWENYA(GWENYA), \
.GWENYB(GWENYB), \
.SOA(SOA), \
.SOB(SOB),\
.TENA(TENA),\
.TCENA(TCENA), \
.TWENA(TWENA), \
.TAA(TAA), \
.TDA(TDA), \
.TENB(TENB), \
.TCENB(TCENB), \
.TWENB(TWENB), \
.TAB(TAB), \
.TDB(TDB), \
.TGWENA(TGWENA), \
.TGWENB(TGWENB), \
.SIA(SIA), \
.SEA(SEA), \
.DFTRAMBYP(DFTRAMBYP), \
.SIB(SIB), \
.SEB(SEB), \
.QA(QA), \
.QB(QB), \
.CLKA(CLKA), \
.CENA(CENA), \
.WENA(WENA), \
.AA(AA), \
.DA(DA), \
.CLKB(CLKB), \
.CENB(CENB), \
.WENB(WENB), \
.AB(AB), \
.DB(DB), \
.EMAA(EMAA), \
.EMAWA(EMAWA), \
.EMAB(EMAB), \
.EMAWB(EMAWB), \
.GWENA(GWENA), \
.GWENB(GWENB), \
.RET1N(RET1N), \
.COLLDISN(COLLDISN)


module sramdp_wrapper
#(
  parameter WORDSWD = 10,
  parameter BITS = 19
  //parameter WORDS = 2048,
)
(
//- TestOut
  output  CENYA, 
  output [BITS-1:0] WENYA, 
  output [WORDSWD-1:0] AYA, 
  output  CENYB, 
  output [BITS-1:0] WENYB, 
  output [WORDSWD-1:0] AYB, 
  output  GWENYA, 
  output  GWENYB, 
  output [1:0] SOA, 
  output [1:0] SOB, 
//- TestIn
  input  TENA, 
  input  TCENA, 
  input [BITS-1:0] TWENA, 
  input [WORDSWD-1:0] TAA, 
  input [BITS-1:0] TDA, 
  input  TENB, 
  input  TCENB, 
  input [BITS-1:0] TWENB, 
  input [WORDSWD-1:0] TAB, 
  input [BITS-1:0] TDB, 
  input  TGWENA, 
  input  TGWENB, 
  input [1:0] SIA, 
  input  SEA, 
  input  DFTRAMBYP, 
  input [1:0] SIB, 
  input  SEB, 
//- 
  input  RET1N, 
  input  COLLDISN, 
//- Common
  output [BITS-1:0] QA, 
  output [BITS-1:0] QB, 
  input  CLKA, 
  input  CENA, 
  input [BITS-1:0] WENA, 
  input  GWENA, 
  input [WORDSWD-1:0] AA, 
  input [BITS-1:0] DA, 
  input  CLKB, 
  input  CENB, 
  input [BITS-1:0] WENB, 
  input  GWENB, 
  input [WORDSWD-1:0] AB, 
  input [BITS-1:0] DB, 
  input [2:0] EMAA, 
  input [1:0] EMAWA, 
  input [2:0] EMAB, 
  input [1:0] EMAWB
);
`ifdef XDEBUG
initial begin
$display("[xDEBUG] %tns, %m, WORDSWD=%d, BITS=%d", $time, WORDSWD, BITS);
end
`endif
generate 
if(WORDSWD==10 && BITS==19)
S40DPRA_NPU_1024X19
U_sramdp1024x19 (
`SRAMDP_IO_CONN
);
if(WORDSWD==7 && BITS==64)
S40DPRA_NPU_128X64
U_sramdp128x64 (
`SRAMDP_IO_CONN
);
if(WORDSWD==10 && BITS==64)
S40DPRA_NPU_1024X64
U_sramdp1024x64 (
`SRAMDP_IO_CONN
);
if(WORDSWD==11 && BITS==32)
S40DPRA_NPU_2048X32
U_sramdp2048x32 (
`SRAMDP_IO_CONN
);

endgenerate


endmodule

