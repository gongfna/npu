

`define GS_IO_IN(GS_DW, gs) \
  input [`GS_AW-1:0] maddr_``gs, \
  input mread_``gs, \
  input mwrite_``gs, \
  input [2:0] msize_``gs, \
  input [1:0] mburst_``gs, \
  input [`GS_BW-1:0] mlen_``gs, \
  input mlast_``gs, \
  input [``GS_DW-1:0] mdata_``gs, \
  input [``GS_DW/8-1:0] mwstrb_``gs, \
  input mready_``gs, \
  output  saccept_``gs, \
  output  svalid_``gs, \
  output  [``GS_DW-1:0] sdata_``gs, \
  output  [1:0] sresp_``gs,

`define XDMA_IO_IN(BUF, buff) \
  input [AW_``BUF-1:0]``buff``_addr, \
  input buff``_read, \
  input buff``_write, \
  input [DW_``BUF-1:0]``buff``_wdata, \
  input [DW_``BUF/8-1:0]``buff``_wstrb, \
  input buff``_cs, \
  output  [DW_``BUF-1:0]``buff``_rdata,

`define NPE_IO_OUT(BUF, buff) \
  output [AW_``BUF-1:0]``buff``_addr_npe, \
  output buff``_read_npe, \
  output buff``_write_npe, \
  output [DW_``BUF-1:0]``buff``_wdata_npe, \
  output [DW_``BUF/8-1:0]``buff``_wstrb_npe, \
  output buff``_cs_npe, \
  input  [DW_``BUF-1:0]``buff``_rdata_npe,

`define NPE_IO_OUT2(BUF, buff) \
  output [AW_``BUF-1:0]``buff``_addr_npe, \
  output buff``_read_npe, \
  output buff``_write_npe, \
  output [DW_``BUF-1:0]``buff``_wdata_npe, \
  output [DW_``BUF/8-1:0]``buff``_wstrb_npe, \
  output buff``_cs_npe, \
  input  [DW_``BUF-1:0]``buff``_rdata_npe

`define MUX_LOGIC(gs, buff) \
assign buff``_addr_npe  = buffer_debug ? maddr_``gs :``buff``_addr; \
assign buff``_write_npe = buffer_debug ? mwrite_``gs :``buff``_write; \
assign buff``_read_npe  = buffer_debug & mread_``gs ; \
assign buff``_wdata_npe = buffer_debug ? mdata_``gs :``buff``_wdata; \
assign buff``_wstrb_npe = buffer_debug ? mwstrb_``gs :``buff``_wstrb; \
assign buff``_cs_npe    = buffer_debug ? mready_``gs :``buff``_cs; \
assign buff``_rdata     =``buff``_rdata_npe;

`define GS_RESP(gs, buff) \
wire mread_``gs``_r; \
assign saccept_``gs = 1'b1; \
assign svalid_``gs = mread_``gs``; \
assign sdata_``gs =``buff``_rdata_npe; \
assign sresp_``gs = 2'b00;



module gs_mux
#(
  parameter AW_IOB0=12, 
  parameter AW_IOB1=12, 
  parameter AW_WB=13, 
  parameter AW_WIB=10, 
  parameter AW_BIASB=7, 
  parameter AW_INSTB=12, 
  parameter DW_IOB0=256,
  parameter DW_IOB1=256,
  parameter DW_WB=416, 
  parameter DW_WIB=32, 
  parameter DW_INSTB=128, 
  parameter DW_BIASB=512 
)
(
input i_internal_stop, 
`GS_IO_IN(`GS_DW_gs1, gs1)
`GS_IO_IN(`GS_DW_gs2, gs2)
`GS_IO_IN(`GS_DW_gs3, gs3)
`GS_IO_IN(`GS_DW_gs4, gs4)
`GS_IO_IN(`GS_DW_gs5, gs5)
`GS_IO_IN(`GS_DW_gs6, gs6)
`GS_IO_IN(`GS_DW_gs7, gs7)
`XDMA_IO_IN(IOB0, iob0)
`XDMA_IO_IN(IOB1, iob1)
`XDMA_IO_IN(WB, wb)
`XDMA_IO_IN(WIB, wib)
`XDMA_IO_IN(INSTB, instb)
`XDMA_IO_IN(BIASB, biasb)
`NPE_IO_OUT(IOB0, iob0)
`NPE_IO_OUT(IOB1, iob1)
`NPE_IO_OUT(WB, wb)
`NPE_IO_OUT(WIB, wib)
`NPE_IO_OUT(INSTB, instb)
`NPE_IO_OUT2(BIASB, biasb)
);

wire buffer_debug;
assign buffer_debug = i_internal_stop;
//assign buffer_debug = 1'b1;

`MUX_LOGIC(gs1, iob0)
`MUX_LOGIC(gs2, iob1)
//`MUX_LOGIC(gs3, wb)
`MUX_LOGIC(gs4, wb)
`MUX_LOGIC(gs5, wib)
`MUX_LOGIC(gs6, instb)
`MUX_LOGIC(gs7, biasb)

`GS_RESP(gs1, iob0)
`GS_RESP(gs2, iob1)
//`GS_RESP(gs3, wb)
`GS_RESP(gs4, wb)
`GS_RESP(gs5, wib)
`GS_RESP(gs6, instb)
`GS_RESP(gs7, biasb)



endmodule

