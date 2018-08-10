/*
Project: 
Team: 
Module Name: xDMA_lite
$RCSfile$
$Author$
$Date$
$Name$
$Revision$
$State$
Hierarchy: 
    ----> xDMA_lite(xDMA_lite.v)
	       |
	       |----> DW_axi_gm
	       |
	       |----> xDMA_apb_if
	       |
	       |----> xDMA_core
	       |
	       |----> 
	       |
	       |---->
*/
module dma 
#(
  parameter DWIDTH=128, 
  parameter AW_IOB=12, 
  parameter AW_WB=13, 
  parameter AW_WIB=10, 
  parameter AW_LSTMB=5, 
  parameter AW_BIASB=7, 
  parameter AW_INSTB=12, 
  parameter DW_IOB=256,
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
//- xDMA_Converter
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
//- xDMA_CFG
  //- apb
  input pclk, 
  input preset_n, 
  input [7:0] paddr, 
  input [31:0] pwdata, 
  input pwrite, 
  input psel, 
  input penable, 
  output [31:0] prdata, 
  //- inst ctrl
  output o_dma_finish, 
  input [3:0] i_dma_mode, 
  input [31:0] i_src_start, 
  input [31:0] i_dst_start, 
  input [31:0] i_d_lines, 
  input i_b_stream, 
  input i_ex_dma, 
  input i_npu_idle, 
  input i_inst_exception, 
  input i_internal_stop, 
  input npu_work_state, 
  input inst_work_state, 
  input [7:0] i_line_size, 
  input [1:0] i_stride,
  input [1:0] i_pad_num, 
//- AXI MASTER
  input aclk_m, 
  input aresetn_m, 
  // Write Address Channel 1
  output                      awvalid_m,
  output [32-1:0]     awaddr_m,
  output [4-1:0]    awid_m,
  output [4-1:0]    awlen_m,
  output [3-1:0]       awsize_m,
  output [2-1:0]       awburst_m,
  output [2-1:0]       awlock_m,
  output [4-1:0]       awcache_m,
  output [3-1:0]       awprot_m,
  input                       awready_m,
  
  // Write Data Channel 1
  output                      wvalid_m,
  output [4-1:0]    wid_m,
  output [128-1:0]     wdata_m,
  output [16-1:0]     wstrb_m,
  output                      wlast_m,
  input                       wready_m,
  
  // Write Response Channel 1
  input                       bvalid_m,
  input  [4-1:0]    bid_m,
  input  [2-1:0]       bresp_m,
  output                      bready_m,
  // Read Address Channel
  output                      arvalid_m,
  output [4-1:0]    arid_m,
  output [32-1:0]     araddr_m,
  output [4-1:0]    arlen_m,
  output [3-1:0]       arsize_m,
  output [2-1:0]       arburst_m,
  output [2-1:0]       arlock_m,
  output [4-1:0]       arcache_m,
  output [3-1:0]       arprot_m,
  input                       arready_m,
  
  // Read Data Channel
  input                       rvalid_m,
  input  [4-1:0]    rid_m,
  input  [128-1:0]     rdata_m,
  input                       rlast_m,
  input  [2-1:0]       rresp_m,
  output                      rready_m,
// System IF
  output npu_start, 
  output npu_stop, 
  output o_interrupt, 
  output sys_reset_n, 
// gs_mux select signal 1: axi_slv; 0: xDMA.
  output axi_wr_buf_en, 
  input xclk,
  input xrst_n
);
//- xdma core
wire dma_done; 
wire [31:0] dma_src_addr;
wire [31:0] dma_dst_addr; 
wire [31:0] dma_trans_len; 
wire b_stream;
wire ex_dma;
wire [7:0] line_size; 
wire [1:0] stride;
wire [1:0] pad_num; 
wire [31:0] zone1_addr_s;
wire [31:0] zone1_size_s;
wire [31:0] zone2_addr_s;
wire [31:0] zone2_size_s;
wire [31:0] zone3_addr_s;
wire [31:0] zone3_size_s;
wire [31:0] zone4_addr_s;
wire [31:0] zone4_size_s;
wire [3:0] zone_en_s;
wire [31:0] src_addr_s;
wire [31:0] inst_depth_s;
wire [3:0] awid_cfg; 
wire [1:0] awburst_cfg; 
wire awlock_cfg; 
wire [2:0] awprot_cfg; 
wire [3:0] awcache_cfg; 
wire [3:0] wid_cfg; 
wire [3:0] arid_cfg; 
wire [1:0] arburst_cfg; 
wire arlock_cfg; 
wire [2:0] arprot_cfg; 
wire [3:0] arcache_cfg; 
//- Converter
wire [3:0] dma_mode;
wire mode_m2instb;
wire mode_m2instb_r;

wire [31:0] maddr_sram; 
wire [31:0] maddr_sram_start;
wire mread_sram;
wire mwrite_sram;
wire mlen_sram;
wire msize_sram;
wire [DWIDTH-1:0] mdata_sram;
wire [DWIDTH/8-1:0] mwstrb_sram;
wire saccept_sram;
wire svalid_sram;
wire slast_sram;
wire [DW_IOB-1:0] sdata_sram;
wire mready_sram;

xDMA_DATA_Converter
//#(parameter DWIDTH=256, 
//  parameter AW_IOB=12, 
//  parameter AW_WB=13, 
//  parameter AW_WIB=10, 
//  parameter AW_BIASB=7, 
//  parameter AW_INSTB=12, 
//  localparam DW_IOB=256, 
//  localparam DW_WB=32, 
//  localparam DW_WIB=32, 
//  localparam DW_INSTB=128, 
//  localparam DW_BIASB=512, 
//  localparam NM_IOB=1, 
//  localparam NM_WB=1/8, 
//  localparam NM_WIB=1/8, 
//  localparam NM_INSTB=1/2, 
//  localparam NM_BIASB=DW_BIASB/DWIDTH
//)
U_xConverter (
  .dma_mode(dma_mode), 
  .mode_m2instb(mode_m2instb_r), 
  // GIF request
  .maddr_sram_start(maddr_sram_start), 
  .maddr(maddr_sram), 
  .mread(mread_sram), 
  .mwrite(mwrite_sram), 
  .mlen(mlen_sram), //dont care
  .msize(msize_sram), //dont care
  .mdata(mdata_sram), 
  .mwstrb(mwstrb_sram), 
  .saccept(saccept_sram), 
  // GIF response
  .svalid(svalid_sram), // indicate sdata valid
  .slast(slast_sram), //always "1"
  .sdata(sdata_sram), 
  .mready(mready_sram), // indicate master ready
  // IOB0 
  .iob0_wdata(iob0_wdata), 
  .iob0_wstrb(iob0_wstrb), 
  .iob0_addr(iob0_addr), 
  .iob0_write(iob0_write), 
  .iob0_read(iob0_read), 
  .iob0_cs(iob0_cs), 
  .iob0_rdata(iob0_rdata), 
  .iob0_dready(iob0_dready), 
  // IOB1 
  .iob1_wdata(iob1_wdata), 
  .iob1_wstrb(iob1_wstrb), 
  .iob1_addr(iob1_addr), 
  .iob1_write(iob1_write), 
  .iob1_read(iob1_read), 
  .iob1_cs(iob1_cs), 
  .iob1_rdata(iob1_rdata), 
  .iob1_dready(iob1_dready), 
  // WB 
  .wb_wdata(wb_wdata), 
  .wb_wstrb(wb_wstrb), 
  .wb_addr(wb_addr), 
  .wb_write(wb_write), 
  .wb_cs(wb_cs), 
  .wb_dready(wb_dready), 
  // WIB 
  .wib_wdata(wib_wdata), 
  .wib_wstrb(wib_wstrb), 
  .wib_addr(wib_addr), 
  .wib_write(wib_write), 
  .wib_cs(wib_cs), 
  .wib_dready(wib_dready), 
  // LSTMB 
  .lstmb_wdata(lstmb_wdata), 
  .lstmb_wstrb(lstmb_wstrb), 
  .lstmb_addr(lstmb_addr), 
  .lstmb_write(lstmb_write), 
  .lstmb_cs(lstmb_cs), 
  .lstmb_dready(lstmb_dready), 
  // INSTB 
  .instb_wdata(instb_wdata), 
  .instb_wstrb(instb_wstrb), 
  .instb_addr(instb_addr), 
  .instb_write(instb_write), 
  .instb_cs(instb_cs), 
  .instb_dready(instb_dready), 
  // BIASB 
  .biasb_wdata(biasb_wdata), 
  .biasb_wstrb(biasb_wstrb), 
  .biasb_addr(biasb_addr), 
  .biasb_write(biasb_write), 
  .biasb_read(biasb_read), 
  .biasb_cs(biasb_cs), 
  //
  .xclk(xclk), 
  .xreset_n(xrst_n) 
);

xDMA_CFG
U_xDMA_CFG
(
  .xclk(xclk), 
  .xreset_n(xrst_n), 
  .pclk(pclk), 
  .preset_n(preset_n), 
  .paddr(paddr), 
  .pwdata(pwdata), 
  .pwrite(pwrite), 
  .psel(psel), 
  .penable(penable), 
  .prdata(prdata), 
  //- inst ctrl
  .o_dma_finish(o_dma_finish), 
  .i_dma_mode(i_dma_mode), 
  .i_src_start(i_src_start), 
  .i_dst_start(i_dst_start), 
  .i_d_lines(i_d_lines), 
  .i_b_stream(i_b_stream), 
  .i_ex_dma(i_ex_dma), 
  .i_line_size(i_line_size), 
  .i_stride(i_stride), 
  .i_pad_num(i_pad_num), 
  //- xdma core
  .dma_done(dma_done), 
  .dma_src_addr(dma_src_addr), 
  .dma_dst_addr(dma_dst_addr), 
  .dma_trans_len(dma_trans_len), 
  .b_stream(b_stream), 
  .ex_dma(ex_dma), 
  .line_size(line_size), 
  .stride(stride), 
  .pad_num(pad_num), 
  .zone1_addr_s(zone1_addr_s),
  .zone1_size_s(zone1_size_s),
  .zone2_addr_s(zone2_addr_s),
  .zone2_size_s(zone2_size_s),
  .zone3_addr_s(zone3_addr_s),
  .zone3_size_s(zone3_size_s),
  .zone4_addr_s(zone4_addr_s),
  .zone4_size_s(zone4_size_s),
  .zone_en_s(zone_en_s),
  .src_addr_s(src_addr_s),
  .inst_depth_s(inst_depth_s),
  .awid_cfg(awid_cfg), 
  .awburst_cfg(awburst_cfg), 
  .awlock_cfg(awlock_cfg), 
  .awprot_cfg(awprot_cfg), 
  .awcache_cfg(awcache_cfg), 
  .wid_cfg(wid_cfg), 
  .arid_cfg(arid_cfg), 
  .arburst_cfg(arburst_cfg), 
  .arlock_cfg(arlock_cfg), 
  .arprot_cfg(arprot_cfg), 
  .arcache_cfg(arcache_cfg), 
  //- Converter
  .dma_mode(dma_mode),
  .mode_m2instb(mode_m2instb),
  .sys_reset_n(sys_reset_n), 
  .axi_wr_buf_en(axi_wr_buf_en), 
  .npu_stop(npu_stop), 
  .npu_start(npu_start), 
  //- IRR
  .internal_stop(i_internal_stop), 
  .ex_zone_bias_wr_finish(ex_zone_bias_wr_finish), 
  .ex_zone_wib_wr_finish(ex_zone_wib_wr_finish), 
  .ex_zone_wb_wr_finish(ex_zone_wb_wr_finish), 
  .inst_exception(i_inst_exception), 
  .init_inst_finish(init_inst_finish), 
  .zone3_wr_finish(zone3_wr_finish), 
  .zone2_wr_finish(zone2_wr_finish), 
  .zone1_rd_finish(zone1_rd_finish), 
  .zone0_rd_finish(zone0_rd_finish), 
  //- STATUS
  .npu_idle(i_npu_idle), 
  .sw_rst_finish(1'b1), 
  .init_prot_finish(init_prot_finish), 
  .zone_addr_mismatch(zone_addr_mismatch), 
  .inst_dec_exception(inst_dec_exception), 
  .inst_work_state(inst_work_state), 
  .npu_work_state(npu_work_state), 
  .o_interrupt(o_interrupt)
);

dma_core
U_DMA_CORE
(
//- xdma converter
.maddr_sram_start(maddr_sram_start), 
.maddr_sram(maddr_sram), 
.mread_sram(mread_sram), 
.mwrite_sram(mwrite_sram), 
.mlen_sram(mlen_sram), 
.msize_sram(msize_sram), 
.mdata_sram(mdata_sram), 
.mwstrb_sram(mwstrb_sram), 
.saccept_sram(saccept_sram), 
.svalid_sram(svalid_sram), 
.slast_sram(slast_sram), 
.sdata_sram(sdata_sram), 
.mready_sram(mready_sram), 
//- xdma cfg
.dma_finish(dma_done), 
.dma_src_addr(dma_src_addr), 
.dma_dst_addr(dma_dst_addr), 
.dma_trans_len(dma_trans_len), 
.b_stream(b_stream), 
.ex_dma(ex_dma), 
.line_size(line_size), 
.stride(stride), 
.pad_num(pad_num), 
.zone1_addr_s(zone1_addr_s),
.zone1_size_s(zone1_size_s),
.zone2_addr_s(zone2_addr_s),
.zone2_size_s(zone2_size_s),
.zone3_addr_s(zone3_addr_s),
.zone3_size_s(zone3_size_s),
.zone4_addr_s(zone4_addr_s),
.zone4_size_s(zone4_size_s),
.zone_en_s(zone_en_s),
.src_addr_s(src_addr_s),
.inst_depth_s(inst_depth_s),
.awid_cfg(awid_cfg), 
.awburst_cfg(awburst_cfg), 
.awlock_cfg(awlock_cfg), 
.awprot_cfg(awprot_cfg), 
.awcache_cfg(awcache_cfg), 
.wid_cfg(wid_cfg), 
.arid_cfg(arid_cfg), 
.arburst_cfg(arburst_cfg), 
.arlock_cfg(arlock_cfg), 
.arprot_cfg(arprot_cfg), 
.arcache_cfg(arcache_cfg), 
.mode_m2instb(mode_m2instb),
.mode_m2instb_r(mode_m2instb_r),
.dma_mode(dma_mode), 
//- IRR
.ex_zone_bias_wr_finish(ex_zone_bias_wr_finish), 
.ex_zone_wib_wr_finish(ex_zone_wib_wr_finish), 
.ex_zone_wb_wr_finish(ex_zone_wb_wr_finish), 
.init_inst_finish(init_inst_finish), 
.zone3_wr_finish(zone3_wr_finish), 
.zone2_wr_finish(zone2_wr_finish), 
.zone1_rd_finish(zone1_rd_finish), 
.zone0_rd_finish(zone0_rd_finish), 
//- STATUS
.init_prot_finish(init_prot_finish), 
.zone_addr_mismatch(zone_addr_mismatch), 
.inst_dec_exception(inst_dec_exception), 
.inst_work_state(inst_work_state), 
.npu_work_state(npu_work_state), 
// SLAVE PORT I/O
.aclk_m(aclk_m)
,.aresetn_m(aresetn_m)
,// MP Write Address Channel 1
.awvalid_m(awvalid_m)
,.awaddr_m(awaddr_m)
,.awid_m(awid_m)
,.awlen_m(awlen_m)
,.awsize_m(awsize_m)
,.awburst_m(awburst_m)
,.awlock_m(awlock_m)
,.awcache_m(awcache_m)
,.awprot_m(awprot_m)
,.awready_m(awready_m)
,// MP Write Data Channel 1
.wvalid_m(wvalid_m)
,.wid_m(wid_m)
,.wdata_m(wdata_m)
,.wstrb_m(wstrb_m)
,.wlast_m(wlast_m)
,.wready_m(wready_m)
,// MP Write Response Channel 1
.bvalid_m(bvalid_m)
,.bid_m(bid_m)
,.bresp_m(bresp_m)
,.bready_m(bready_m)
,// MP Read Address Channel
.arvalid_m(arvalid_m)
,.arid_m(arid_m)
,.araddr_m(araddr_m)
,.arlen_m(arlen_m)
,.arsize_m(arsize_m)
,.arburst_m(arburst_m)
,.arlock_m(arlock_m)
,.arcache_m(arcache_m)
,.arprot_m(arprot_m)
,.arready_m(arready_m)
,// MP Read Data Channel
.rvalid_m(rvalid_m)
,.rid_m(rid_m)
,.rdata_m(rdata_m)
,.rresp_m(rresp_m)
,.rlast_m(rlast_m)
,.rready_m(rready_m), 
// System IF
.xclk(xclk),
.xrst_n(xrst_n) 
);
endmodule
