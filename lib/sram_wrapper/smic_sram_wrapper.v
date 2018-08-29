
`define SMIC_SP_IO_CONN \
.Q(Q), \
.CLK(CLK), \
.CEN(CEN), \
.WEN(WEN), \
.DELAY(DELAY), \
.BWEN(BWEN), \
.A(A), \
.D(D)


module smic_sram_wrapper
#(
  parameter WORDSWD = 7,
  parameter BITS = 19
)
(
  output [BITS-1:0] Q,
  input  CLK,
  input  CEN,
  input  WEN, 
  input [1:0] DELAY,
  input [BITS-1:0] BWEN,
  input [WORDSWD-1:0] A,
  input [BITS-1:0] D
);
`ifdef XDEBUG
initial begin
$display("[xDEBUG] %tns, %m, WORDSWD=%d, BITS=%d", $time, WORDSWD, BITS);
end
`endif
generate 
if(WORDSWD==10 && BITS==28)
S40NLLVHSSPRLRK_DL_X256Y4D28B4
U_sram1024x28 (
`SMIC_SP_IO_CONN
);
if(WORDSWD==7 && BITS==32)
S40NLLVHSSPRLRK_DL_X32Y4D32B2
U_sram128x32 (
`SMIC_SP_IO_CONN
);
if(WORDSWD==11 && BITS==32)
S40NLLVHSSPRLRK_DL_X256Y8D32B4
U_sram2048x32 (
`SMIC_SP_IO_CONN
);

endgenerate


endmodule

