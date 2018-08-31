/*
Project:
Team:
Module Name: xDMA_DATA_Converter
$RCSfile$
$Author$
$Date$
$Name$
$Revision$
$State$
Hierarchy: 
    ----> xDMA_DATA_Converter(xDMA_DATA_Converter.v)
           |
           |----> 
           |
           |---->
           |
           |---->
           |
           |---->
           |
           |---->
*/
module xDMA_DATA_Converter
#(parameter DWIDTH=128, 
  parameter AW_IOB=12, 
  parameter AW_WB=13, 
  parameter AW_WIB=10, 
  parameter AW_LSTMB=5, 
  parameter AW_BIASB=7, 
  parameter AW_INSTB=12,  

  parameter DW_IOB=256, 
  //parameter DW_WB=32, 
  parameter DW_WB=416, 
  parameter DW_WIB=32, 
  parameter DW_LSTMB=32, 
  parameter DW_INSTB=128, 
  parameter DW_BIASB=512, 
  parameter NM_IOB=1, 
  parameter NM_WB=1/8, 
  parameter NM_WIB=1/8, 
  parameter NM_INSTB=1/2, 
  parameter NM_BIASB=DW_BIASB/DWIDTH 
)
(
  input [3:0] dma_mode, 
  input mode_m2instb, 
  // GIF request
  input [31:0] maddr_sram_start, 
  input [31:0] maddr, 
  input mread, 
  input mwrite, 
  input mlen, //dont care
  input msize, //dont care
  input [DWIDTH-1:0] mdata, 
  input [DWIDTH/8-1:0] mwstrb, 
  output saccept, 
  // GIF response
  output svalid, // indicate sdata valid
  output slast, //always "1"
  output [DW_IOB-1:0] sdata, 
  input mready, // indicate master ready
  // IOB0 
  output [DW_IOB-1:0] iob0_wdata, 
  output [DW_IOB/8-1:0] iob0_wstrb, 
  output [AW_IOB-1:0] iob0_addr, 
  output iob0_write, 
  output iob0_read, 
  output iob0_cs, 
  input [DW_IOB-1:0] iob0_rdata, 
  input iob0_dready, 
  // IOB1 
  output [DW_IOB-1:0] iob1_wdata, 
  output [DW_IOB/8-1:0] iob1_wstrb, 
  output [AW_IOB-1:0] iob1_addr, 
  output iob1_write, 
  output iob1_read, 
  output iob1_cs, 
  input [DW_IOB-1:0] iob1_rdata, 
  input iob1_dready, 
  // WB 
  output [DW_WB-1:0] wb_wdata, 
  output [DW_WB/8-1:0] wb_wstrb, 
  output [AW_WB-1:0] wb_addr, 
  output wb_write, 
  output wb_cs, 
  input wb_dready, 
  // WIB 
  output [DW_WIB-1:0] wib_wdata, 
  output [DW_WIB/8-1:0] wib_wstrb, 
  output [AW_WIB-1:0] wib_addr, 
  output wib_write, 
  output wib_cs, 
  input wib_dready, 
  // LSTMB 
  output [DW_LSTMB-1:0] lstmb_wdata, 
  output [DW_LSTMB/8-1:0] lstmb_wstrb, 
  output [AW_LSTMB-1:0] lstmb_addr, 
  output lstmb_write, 
  output lstmb_cs, 
  input lstmb_dready, 
  // INSTB 
  output [DW_INSTB-1:0] instb_wdata, 
  output [DW_INSTB/8-1:0] instb_wstrb, 
  output [AW_INSTB-1:0] instb_addr, 
  output instb_write, 
  output instb_cs, 
  input instb_dready, 
  // BIASB 
  output [DW_BIASB-1:0] biasb_wdata, 
  output [DW_BIASB/8-1:0] biasb_wstrb, 
  output [AW_BIASB-1:0] biasb_addr, 
  output biasb_write, 
  output biasb_read, 
  output biasb_cs, 
  //
  input xclk, 
  input xreset_n 
);

assign svalid = (mread|mwrite) & mready;
assign slast = (mread|mwrite) & mready;
wire mode_m2iob0;
wire mode_m2iob1;
wire mode_iob02m;
wire mode_iob12m;
wire mode_m2wb416;
wire mode_m2wb256;
wire mode_m2wib;
wire mode_m2biasb;
wire mode_m2lstmb;
assign mode_m2iob0 = ~dma_mode[3] & ~dma_mode[2] & ~dma_mode[1] & dma_mode[0];
assign mode_m2iob1 = ~dma_mode[3] & ~dma_mode[2] & dma_mode[1] & ~dma_mode[0];
assign mode_iob02m = ~dma_mode[3] & ~dma_mode[2] & dma_mode[1] & dma_mode[0];
assign mode_iob12m = ~dma_mode[3] & dma_mode[2] & ~dma_mode[1] & ~dma_mode[0];
assign mode_m2wb416 = ~dma_mode[3] & dma_mode[2] & ~dma_mode[1] & dma_mode[0];
assign mode_m2wb256 = ~dma_mode[3] & dma_mode[2] & dma_mode[1] & ~dma_mode[0];
assign mode_m2wib = ~dma_mode[3] & dma_mode[2] & dma_mode[1] & dma_mode[0];
assign mode_m2biasb = dma_mode[3] & ~dma_mode[2] & ~dma_mode[1] & ~dma_mode[0];
assign mode_m2lstmb = dma_mode[3] & ~dma_mode[2] & dma_mode[1] & ~dma_mode[0];
// IOB0/1 converter upsize
wire [DW_IOB/8-1:0] wstrb_iob;
assign iob0_wdata = {mdata, mdata};
assign iob0_addr = maddr[AW_IOB-1:0];
//assign iob0_wstrb = {{(DW_IOB/8-DWIDTH/8){1'b0}},wstrb_iob};
assign iob0_wstrb = wstrb_iob;
assign iob0_write = mwrite & mode_m2iob0;
assign iob0_read = mread & mode_iob02m;
assign iob0_cs = mode_m2iob0 | mode_iob02m;
//assign iob1_wdata = {{(DW_IOB-DWIDTH){1'b0}}, mdata}; 
assign iob1_wdata = {mdata, mdata};
assign iob1_addr = maddr[AW_IOB-1:0];
//assign iob1_wstrb = {{(DW_IOB/8-DWIDTH/8){1'b0}},wstrb_iob};
assign iob1_wstrb = wstrb_iob;
assign iob1_write = mwrite & mode_m2iob1;
assign iob1_read = mread & mode_iob12m;
assign iob1_cs = mode_m2iob1 | mode_iob12m;
xConverter_upsize #(.DWS(DWIDTH), .DWD(DW_IOB)) 
U_IOB_upsize
( .xclk(xclk), 
  .xreset_n(xreset_n), 
  .cs(mode_m2iob0|mode_m2iob1), 
  .mready(mready), 
  .mwrite(mwrite), 
  .mwstrb(mwstrb[DWIDTH/8-1:0]), 
  .wstrb_up(wstrb_iob) 
);
// WB converter downsize
//assign wb_write = mwrite & (mode_m2wb256 | mode_m2wb416);
assign wb_saccept = 1'b1;
assign wb_cs = mode_m2wb256 | mode_m2wb416;
//defparam U_WB_downsize.DWIDTH_S=DWIDTH;
//defparam U_WB_downsize.DWIDTH_D=32;
//defparam U_WB_downsize.DWADDR  =AW_WB;
//-xConverter_downsize 
//-U_WB_downsize
//-( .xclk(xclk), 
//-  .xreset_n(xreset_n), 
//-  .mready(mready), 
//-  .mwrite(mwrite), 
//-  .mdata(mdata), 
//-  .maddr(maddr),
//-  .mwstrb(mwstrb[DWIDTH/8-1:0]), 
//-  .mdatao(/*wb_wdata*/), 
//-  .addro(/*wb_addr*/),
//-  .wstrb(/*wb_wstrb*/), 
//-  .saccept(/*wb_saccept*/)
//-);
xConverter_wb_upsize U_WB_upsize
( .xclk(xclk), 
  .xreset_n(xreset_n), 
  .maddr_sram_start(maddr_sram_start), 
  .mode_m2wb416(mode_m2wb416), 
  .mode_m2wb256(mode_m2wb256), 
  .mwrite(mwrite), 
  .wdata(mdata), 
  .wb_write(wb_write), 
  .wb_wstrb(wb_wstrb), 
  .wb_addr(wb_addr), 
  .wb_wdata(wb_wdata)
);

// WIB converter downsize
assign wib_write = mwrite & mode_m2wib;
assign wib_cs = mode_m2wib;
defparam U_WIB_downsize.DWIDTH_S=DWIDTH;
defparam U_WIB_downsize.DWIDTH_D=32;
defparam U_WIB_downsize.DWADDR  =AW_WIB;
xConverter_downsize 
U_WIB_downsize
( .xclk(xclk), 
  .xreset_n(xreset_n), 
  .mready(mready), 
  .mwrite(mwrite), 
  .mdata(mdata), 
  .maddr(maddr),
  .mwstrb(mwstrb[DWIDTH/8-1:0]), 
  .mdatao(wib_wdata), 
  .addro(wib_addr),
  .wstrb(wib_wstrb), 
  .saccept(wib_saccept)
);
// LSTMB converter downsize
assign lstmb_write = mwrite & mode_m2lstmb;
assign lstmb_cs = mode_m2lstmb;
defparam U_LSTMB_downsize.DWIDTH_S=DWIDTH;
defparam U_LSTMB_downsize.DWIDTH_D=32;
defparam U_LSTMB_downsize.DWADDR  =AW_LSTMB;
xConverter_downsize 
U_LSTMB_downsize
( .xclk(xclk), 
  .xreset_n(xreset_n), 
  .mready(mready), 
  .mwrite(mwrite), 
  .mdata(mdata), 
  .maddr(maddr),
  .mwstrb(mwstrb[DWIDTH/8-1:0]), 
  .mdatao(lstmb_wdata), 
  .addro(lstmb_addr),
  .wstrb(lstmb_wstrb), 
  .saccept(lstmb_saccept)
);
// INSTB converter downsize
assign instb_write = mwrite & mode_m2instb;
assign instb_cs = mode_m2instb;
//defparam U_INSTB_downsize.DWIDTH_S=DWIDTH;
//defparam U_INSTB_downsize.DWIDTH_D=128;
//defparam U_INSTB_downsize.DWADDR  =AW_INSTB;
//xConverter_downsize 
//U_INSTB_downsize
//( .xclk(xclk), 
//  .xreset_n(xreset_n), 
//  .mready(mready), 
//  .mwrite(mwrite), 
//  .mdata(mdata), 
//  .maddr(maddr),
//  .mwstrb(mwstrb), 
//  .mdatao(instb_wdata), 
//  .addro(instb_addr),
//  .wstrb(instb_wstrb), 
//  .saccept(instb_saccept)
//);
assign instb_wdata = mdata; 
assign instb_addr = maddr[AW_INSTB-1:0];
assign instb_wstrb = mwstrb;


// BIASB converter
wire [DW_BIASB/8-1:0] wstrb_biasb;
assign biasb_wdata = {NM_BIASB{mdata}}; 
assign biasb_addr = maddr[AW_BIASB-1:0];
assign biasb_wstrb = wstrb_biasb;
assign biasb_write = mwrite & mode_m2biasb;
assign biasb_cs = mode_m2biasb;
xConverter_upsize #(.DWS(DWIDTH), .DWD(DW_BIASB)) 
U_BIASB_upsize
( .xclk(xclk), 
  .xreset_n(xreset_n), 
  .cs(mode_m2biasb), 
  .mready(mready), 
  .mwrite(mwrite), 
  .mwstrb(mwstrb[DWIDTH/8-1:0]), 
  .wstrb_up(wstrb_biasb) 
);
// saccept mux

reg [15:0] dma_sel;
wire [15:0] saccept_bus;
assign saccept_bus ={
5'b0, 
mode_m2lstmb&lstmb_saccept, 
1'b0, 
mode_m2biasb, 
mode_m2wib&wib_saccept, 
mode_m2wb256&wb_saccept, 
mode_m2wb416&wb_saccept, 
mode_iob12m, 
mode_iob02m, 
mode_m2iob1, 
mode_m2iob0, 
1'b0};
integer i;
always @(*) 
    begin
	    for(i=0;i<16;i=i+1)
		  dma_sel[i] = (dma_mode==i);
	end

wire saccept_pre;
assign saccept = mode_m2instb | saccept_pre;
gmux_one_hot_cfg #(1, 16) U_saccept_mux(
  //Outputs
  .dataout(saccept_pre), 
  //Inputs
  .datain(saccept_bus), 
  .sel(dma_sel)
);
// sdata mux
wire [DW_IOB*2-1:0] sdata_bus;
assign sdata_bus = {iob1_rdata, iob0_rdata};
gmux_one_hot_cfg #(DW_IOB, 2) U_sdata_mux(
  //Outputs
  .dataout(sdata), 
  //Inputs
  .datain(sdata_bus), 
  .sel({mode_iob12m, mode_iob02m})
);
endmodule

