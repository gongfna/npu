
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

module sramsp_wrapper
#(
  parameter WORDSWD = 16,
  parameter BITS = 36
  //parameter WORDS = 2048,
)
(
  output  CENY,
  output [BITS-1:0] WENY,
  output [WORDSWD-1:0] AY,
  output  GWENY,
  output [BITS-1:0] Q,
  output [1:0] SO,
  input  CLK,
  input  CEN,
  input [BITS-1:0] WEN,
  input [WORDSWD-1:0] A,
  input [BITS-1:0] D,
  input [2:0] EMA,
  input [1:0] EMAW,
  input  TEN,
  input  TCEN,
  input [BITS-1:0] TWEN,
  input [WORDSWD-1:0] TA,
  input [BITS-1:0] TD,
  input  GWEN,
  input  TGWEN,
  input  RET1N,
  input [1:0] SI,
  input  SE,
  input  DFTRAMBYP
);
`ifdef XDEBUG
initial begin
$display("[xDEBUG] %tns, %m, WORDSWD=%d, BITS=%d", $time, WORDSWD, BITS);
end
`endif
generate 
if(WORDSWD==11 && BITS==128)
sramsp2048x128 
U_sramsp2048x128 (
`SRAMSP_IO_CONN
);
if(WORDSWD==16 && BITS==36)
sramsp32768x36 
U_sramsp32768x36 (
`SRAMSP_IO_CONN
);
if(WORDSWD==12 && BITS==128)
S40SPRA_NPU_4096X128 
U_sramsp4096x128 (
`SRAMSP_IO_CONN
);
if(WORDSWD==13 && BITS==128)
S40SPRA_NPU_8192X128 
U_sramsp8192x128 (
`SRAMSP_IO_CONN
);
if(WORDSWD==13 && BITS==144)
sramsp8192x144 
U_sramsp8192x144 (
`SRAMSP_IO_CONN
);
if(WORDSWD==13 && BITS==32)
S40SPRA_NPU_8192X32 
U_sramsp8192x32 (
`SRAMSP_IO_CONN
);

endgenerate


endmodule

