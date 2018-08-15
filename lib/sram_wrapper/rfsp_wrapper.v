
`define RFSP_IO_CONN \
.Q(Q), \
.CLK(CLK), \
.CEN(CEN), \
.WEN(WEN), \
.A(A), \
.D(D), \
.EMA(EMA), \
.EMAW(EMAW), \
.GWEN(GWEN), \
.RET1N(RET1N)

module rfsp_wrapper
#(
  parameter WORDSWD = 10,
  parameter BITS = 19
)
(
  output [BITS-1:0] Q,
  input  CLK,
  input  CEN,
  input [BITS-1:0] WEN,
  input [WORDSWD-1:0] A,
  input [BITS-1:0] D,
  input [2:0] EMA,
  input [1:0] EMAW,
  input  GWEN,
  input  RET1N
);
`ifdef XDEBUG
initial begin
$display("[xDEBUG] %tns, %m, WORDSWD=%d, BITS=%d", $time, WORDSWD, BITS);
end
`endif
generate 
if(WORDSWD==10 && BITS==19)
S40SPRF_NPU_1024X19 
U_rfsp1024x19 (
`RFSP_IO_CONN
);
if(WORDSWD==9 && BITS==128)
rfsp512x128 
U_rfsp512x128 (
`RFSP_IO_CONN
);
if(WORDSWD==7 && BITS==128)
S40SPRF_NPU_128X128
U_rfsp128x128 (
`RFSP_IO_CONN
);

endgenerate


endmodule

