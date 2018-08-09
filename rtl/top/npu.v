/*
Project: 
Team: 
Module Name: npu_sys
$RCSfile$
$Author$
$Date$
$Name$
$Revision$
$State$
Hierarchy: 
    ----> npu_sys(npu_sys.v)
	       |
	       |----> U_DMA
	       |
	       |----> 
	       |
	       |----> 
	       |
	       |----> 
	       |
	       |---->
*/

`define GENE_CONN_DCLA(gs) \
   ,.maddr_``gs(maddr_``gs) \
   ,.mread_``gs(mread_``gs) \
   ,.mwrite_``gs(mwrite_``gs) \
   ,.msize_``gs(msize_``gs) \
   ,.mburst_``gs(mburst_``gs) \
   ,.mlen_``gs(mlen_``gs) \
   ,.mlast_``gs(mlast_``gs) \
   ,.mdata_``gs(mdata_``gs) \
   ,.mwstrb_``gs(mwstrb_``gs) \
   ,.mready_``gs(mready_``gs) \
   ,.saccept_``gs(saccept_``gs) \
   ,.svalid_``gs(svalid_``gs) \
   ,.sdata_``gs(sdata_``gs) \
   ,.sresp_``gs(sresp_``gs)

`define GENE_WIRE_DCLA(gs) \
  wire [`GS_AW-1:0] maddr_``gs; \
  wire mread_``gs; \
  wire mwrite_``gs; \
  wire [2:0] msize_``gs; \
  wire [1:0] mburst_``gs; \
  wire [`GS_BW-1:0] mlen_``gs; \
  wire mlast_``gs; \
  wire [`GS_DW_``gs-1:0] mdata_``gs; \
  wire [`GS_DW_``gs/8-1:0] mwstrb_``gs; \
  wire  saccept_``gs; \
  wire  svalid_``gs; \
  wire  [`GS_DW_``gs-1:0] sdata_``gs; \
  wire  [1:0] sresp_``gs; \
  wire mready_``gs; 

module npu
#(
  parameter DWIDTH=128, 
  parameter AW_IOB=12, 
  parameter AW_IOB0=12, 
  parameter AW_IOB1=12, 
  parameter AW_WB=13, 
  parameter AW_WIB=10, 
  parameter AW_LSTMB=5, 
  parameter AW_BIASB=7, 
  parameter AW_INSTB=12, 
  parameter DW_IOB=256,
  parameter DW_IOB0=256,
  parameter DW_IOB1=256,
  parameter DW_WB=416, 
  parameter DW_WIB=32, 
  parameter DW_LSTMB=32, 
  parameter DW_INSTB=128, 
  parameter DW_BIASB=512, 
  parameter NM_IOB=1, 
  parameter NM_IOB0=1, 
  parameter NM_IOB1=1, 
  parameter NM_WB=1/8, 
  parameter NM_WIB=1/8, 
  parameter NM_INSTB=1/2, 
  parameter NM_BIASB=DW_BIASB/DWIDTH 
)
(
`ifndef XDMA_AXI_DEBUG_SLAVE
//- apb
  input pclk, 
  input preset_n, 
  input [7:0] paddr, 
  input [31:0] pwdata, 
  input pwrite, 
  input psel, 
  input penable, 
  output [31:0] prdata, 
`endif
//- AXI MASTER
  input mstr_aclk, 
  input mstr_aresetn, 
  // Write Address Channel 1
  output                      mstr_awvalid,
  output [32-1:0]      mstr_awaddr,
  output [4-1:0]     mstr_awid,
  output [4-1:0]     mstr_awlen,
  output [3-1:0]        mstr_awsize,
  output [2-1:0]        mstr_awburst,
  output [2-1:0]        mstr_awlock,
  output [4-1:0]        mstr_awcache,
  output [3-1:0]        mstr_awprot,
  input                        mstr_awready,
  
  // Write Data Channel 1
  output                       mstr_wvalid,
  output [4-1:0]     mstr_wid,
  output [128-1:0]      mstr_wdata,
  output [16-1:0]      mstr_wstrb,
  output                       mstr_wlast,
  input                        mstr_wready,
  
  // Write Response Channel 1
  input                        mstr_bvalid,
  input  [4-1:0]     mstr_bid,
  input  [2-1:0]        mstr_bresp,
  output                       mstr_bready,
  // Read Address Channel
  output                       mstr_arvalid,
  output [4-1:0]     mstr_arid,
  output [32-1:0]      mstr_araddr,
  output [4-1:0]     mstr_arlen,
  output [3-1:0]        mstr_arsize,
  output [2-1:0]        mstr_arburst,
  output [2-1:0]        mstr_arlock,
  output [4-1:0]        mstr_arcache,
  output [3-1:0]        mstr_arprot,
  input                        mstr_arready,
  
  // Read Data Channel
  input                        mstr_rvalid,
  input  [4-1:0]     mstr_rid,
  input  [128-1:0]      mstr_rdata,
  input                        mstr_rlast,
  input  [2-1:0]        mstr_rresp,
  output                       mstr_rready, 
`ifdef XDMA_AXI_DEBUG_SLAVE
//- AXI SLAVE
  // Write Address Channel from Master1
  input                       slv_awvalid, 
  input  [`AXI_AW-1:0]        slv_awaddr, 

          input  [`AXI_IDW_M1-1:0]     slv_awid, 

  input  [`AXI_BLW-1:0]       slv_awlen, 
  input  [`AXI_BSW-1:0]       slv_awsize, 
  input  [`AXI_BTW-1:0]       slv_awburst, 
  input  [`AXI_LTW-1:0]       slv_awlock, 
  input  [`AXI_CTW-1:0]       slv_awcache, 
  input  [`AXI_PTW-1:0]       slv_awprot, 
  output                      slv_awready, 
  // Write Data Channel from Master1
  input                       slv_wvalid, 

          input  [`AXI_IDW_M1-1:0]     slv_wid, 

  input  [`AXI_DW-1:0]        slv_wdata, 
  input  [`AXI_SW-1:0]        slv_wstrb, 
  input                       slv_wlast, 
  output                      slv_wready, 
  // Write Response Channel from Master1
  output                      slv_bvalid, 

          output [`AXI_IDW_M1-1:0]     slv_bid, 

  output [`AXI_BRW-1:0]       slv_bresp, 
  input                       slv_bready, 
  // Read Address Channel from Master1
  input                       slv_arvalid, 

          input  [`AXI_IDW_M1-1:0]     slv_arid, 

  input  [`AXI_AW-1:0]        slv_araddr, 
  input  [`AXI_BLW-1:0]       slv_arlen, 
  input  [`AXI_BSW-1:0]       slv_arsize, 
  input  [`AXI_BTW-1:0]       slv_arburst, 
  input  [`AXI_LTW-1:0]       slv_arlock, 
  input  [`AXI_CTW-1:0]       slv_arcache, 
  input  [`AXI_PTW-1:0]       slv_arprot, 
  output                      slv_arready, 
  // Read Data Channel from Master1
  output                      slv_rvalid, 

          output [`AXI_IDW_M1-1:0]     slv_rid, 

  output [`AXI_DW-1:0]        slv_rdata, 
  output                      slv_rlast, 
  output [`AXI_RRW-1:0]       slv_rresp, 
  input                       slv_rready, 

  input remap_n, 
`endif //`ifdef XDMA_AXI_DEBUG_SLAVE
  //
  input xclk,
  input xrst_n


);
  // APB
  wire [31:0] paddr;
  wire [31:0] pwdata;
  wire pwrite;
  wire psel;
  wire penable;
  wire [31:0] prdata;
  // IOB0 
  wire [DW_IOB-1:0] iob0_wdata; 
  wire [DW_IOB/8-1:0] iob0_wstrb; 
  wire [AW_IOB-1:0] iob0_addr; 
  wire iob0_write; 
  wire iob0_read; 
  wire iob0_cs; 
  wire [DW_IOB-1:0] iob0_rdata; 
  wire iob0_dready; 
  // IOB1 
  wire [DW_IOB-1:0] iob1_wdata; 
  wire [DW_IOB/8-1:0] iob1_wstrb; 
  wire [AW_IOB-1:0] iob1_addr; 
  wire iob1_write; 
  wire iob1_read; 
  wire iob1_cs; 
  wire [DW_IOB-1:0] iob1_rdata; 
  wire iob1_dready; 
  // WB 
  wire [DW_WB-1:0] wb_wdata; 
  wire [DW_WB/8-1:0] wb_wstrb; 
  wire [AW_WB-1:0] wb_addr; 
  wire wb_write; 
  wire wb_cs; 
  wire wb_dready; 
  wire [DW_WB-1:0] wb_rdata; 
  // WIB 
  wire [DW_WIB-1:0] wib_wdata; 
  wire [DW_WIB/8-1:0] wib_wstrb; 
  wire [AW_WIB-1:0] wib_addr; 
  wire wib_write; 
  wire wib_cs; 
  wire wib_dready; 
  wire [DW_WIB-1:0] wib_rdata; 
  // LSTMB 
  wire [DW_LSTMB-1:0] lstmb_wdata; 
  wire [DW_LSTMB/8-1:0] lstmb_wstrb; 
  wire [AW_LSTMB-1:0] lstmb_addr; 
  wire lstmb_write; 
  wire lstmb_cs; 
  wire lstmb_dready; 
  wire [DW_LSTMB-1:0] lstmb_rdata; 
  // INSTB 
  wire [DW_INSTB-1:0] instb_wdata; 
  wire [DW_INSTB/8-1:0] instb_wstrb; 
  wire [AW_INSTB-1:0] instb_addr; 
  wire instb_write; 
  wire instb_cs; 
  wire instb_dready; 
  wire [DW_INSTB-1:0] instb_rdata; 
  // BIASB 
  wire [DW_BIASB-1:0] biasb_wdata; 
  wire [DW_BIASB/8-1:0] biasb_wstrb; 
  wire [AW_BIASB-1:0] biasb_addr; 
  wire biasb_write; 
  wire biasb_read; 
  wire biasb_cs; 
  wire [DW_BIASB-1:0] biasb_rdata; 
  // IOB0 
  wire [DW_IOB-1:0] iob0_wdata_npe; 
  wire [DW_IOB/8-1:0] iob0_wstrb_npe; 
  wire [AW_IOB-1:0] iob0_addr_npe; 
  wire iob0_write_npe; 
  wire iob0_read_npe; 
  wire iob0_cs_npe; 
  wire [DW_IOB-1:0] iob0_rdata_npe; 
  // IOB1 
  wire [DW_IOB-1:0] iob1_wdata_npe; 
  wire [DW_IOB/8-1:0] iob1_wstrb_npe; 
  wire [AW_IOB-1:0] iob1_addr_npe; 
  wire iob1_write_npe; 
  wire iob1_read_npe; 
  wire iob1_cs_npe; 
  wire [DW_IOB-1:0] iob1_rdata_npe; 
  // WB 
  wire [DW_WB-1:0] wb_wdata_npe; 
  wire [DW_WB/8-1:0] wb_wstrb_npe; 
  wire [AW_WB-1:0] wb_addr_npe; 
  wire wb_write_npe; 
  wire wb_cs_npe; 
  wire [DW_WB-1:0] wb_rdata_npe; 
  // WIB 
  wire [DW_WIB-1:0] wib_wdata_npe; 
  wire [DW_WIB/8-1:0] wib_wstrb_npe; 
  wire [AW_WIB-1:0] wib_addr_npe; 
  wire wib_write_npe; 
  wire wib_cs_npe; 
  wire [DW_WIB-1:0] wib_rdata_npe; 
  // LSTMB 
  wire [DW_LSTMB-1:0] lstmb_wdata_npe; 
  wire [DW_LSTMB/8-1:0] lstmb_wstrb_npe; 
  wire [AW_LSTMB-1:0] lstmb_addr_npe; 
  wire lstmb_write_npe; 
  wire lstmb_cs_npe; 
  wire [DW_LSTMB-1:0] lstmb_rdata_npe; 
  // INSTB 
  wire [DW_INSTB-1:0] instb_wdata_npe; 
  wire [DW_INSTB/8-1:0] instb_wstrb_npe; 
  wire [AW_INSTB-1:0] instb_addr_npe; 
  wire instb_write_npe; 
  wire instb_cs_npe; 
  wire [DW_INSTB-1:0] instb_rdata_npe; 
  // BIASB 
  wire [DW_BIASB-1:0] biasb_wdata_npe; 
  wire [DW_BIASB/8-1:0] biasb_wstrb_npe; 
  wire [AW_BIASB-1:0] biasb_addr_npe; 
  wire biasb_write_npe; 
  wire biasb_read_npe; 
  wire biasb_cs_npe; 
  wire [DW_BIASB-1:0] biasb_rdata_npe; 
   
  //- inst ctrl
  wire o_dma_finish; 
  wire [3:0] i_dma_mode; 
  wire [31:0] i_src_start; 
  wire [31:0] i_dst_start; 
  wire [31:0] i_d_lines; 
  wire i_b_stream; 
  wire i_ex_dma; 
  wire i_npu_idle; 
  wire i_inst_exception; 
  wire i_internal_stop; 
  wire npu_work_state; 
  wire inst_work_state; 
  wire [7:0] i_line_size; 
  wire [1:0] i_stride;
  wire [1:0] i_pad_num; 
// System IF
  wire npu_start; 
  wire npu_stop; 
  wire o_interrupt; 
  wire sys_reset_n; 
`GENE_WIRE_DCLA(gs1)
`GENE_WIRE_DCLA(gs2)
`GENE_WIRE_DCLA(gs3)
`GENE_WIRE_DCLA(gs4)
`GENE_WIRE_DCLA(gs5)
`GENE_WIRE_DCLA(gs6)
`GENE_WIRE_DCLA(gs7)
//--------------------
//-assign i_b_stream = 1'b0;
//-`ifdef DEBUG
//-assign i_stride = (i_dma_mode==1)?2'd2:2'b0;
//-`else
//-assign i_stride = 2'b0;
//-`endif
//-assign i_line_size = 8'd19;
//-assign i_pad_num = 2'd2;
assign i_inst_exception=0; 
`ifdef DEBUG_SLV
assign i_internal_stop=1; 
`else
assign i_internal_stop=0; 
`endif
assign npu_work_state=0; 
`ifdef DEBUG
always @(posedge xclk) 
	begin
		if(iob0_write) begin
			$display("[XDMA] wdata=%h",iob0_wdata);
			$display("[XDMA] wstrb=%h",iob0_wstrb);
			$display("[XDMA] addr=%h",iob0_addr);
		end
	end
`endif
       
npu_core U_NPU_CORE
   (
     .i_clk                 (xclk                 ),
     .i_rst_n               (xrst_n               ),
     .i_start_npu           (npu_start			  ),
     .i_stop_npu            (npu_stop			  ),
     .o_src_start           (i_src_start          ),
     .o_dest_start          (i_dst_start          ),
     .o_d_lines             (i_d_lines            ), 
     .o_dma_mode            (i_dma_mode           ),
     .o_ex_dma              (i_ex_dma             ),
	 .o_dma_i_line_size(i_line_size          ), 
     .o_dma_i_stride(i_stride             ), 
     .o_dma_i_pad_num(i_pad_num            ), 
	 .o_be_stream           (i_b_stream           ), 
     .i_dma_finish          (o_dma_finish         ), 
     .o_npu_idle            (i_npu_idle           ),        
     .o_internal_stop       (/*i_internal_stop*/      ),
`ifdef XDMA_AXI_DEBUG_SLAVE
     .i_iob_0_bramctl_en    (iob0_cs_npe), // Chip Enable Signal (optional)
     .o_iob_0_bramctl_rdata (iob0_rdata_npe), // Data Out Bus (optional)
     .i_iob_0_bramctl_wdata (iob0_wdata_npe), // Data In Bus (optional)
     .i_iob_0_bramctl_we    (iob0_write_npe), // Byte Enables (optional)
     .i_iob_0_bramctl_be    (iob0_wstrb_npe), // Byte Enables (optional)
     .i_iob_0_bramctl_addr  (iob0_addr_npe), // Address Signal (required)
     .i_iob_1_bramctl_en    (iob1_cs_npe), // Chip Enable Signal (optional)
     .o_iob_1_bramctl_rdata (iob1_rdata_npe), // Data Out Bus (optional)
     .i_iob_1_bramctl_wdata (iob1_wdata_npe), // Data In Bus (optional)
     .i_iob_1_bramctl_we    (iob1_write_npe), // Byte Enables (optional)
     .i_iob_1_bramctl_be    (iob1_wstrb_npe), // Byte Enables (optional)
     .i_iob_1_bramctl_addr  (iob1_addr_npe), // Address Signal (required)
     .i_wb_bramctl_en       (wb_cs_npe), // Chip Enable Signal (optional)
     .o_wb_bramctl_rdata    (wb_rdata_npe[415:0]), // Data Out Bus (optional)
     .i_wb_bramctl_wdata    (wb_wdata_npe[415:0]), // Data In Bus (optional)
     .i_wb_bramctl_we       (wb_write_npe), // Byte Enables (optional)
     .i_wb_bramctl_be       (wb_wstrb_npe), // Byte Enables (optional)
     .i_wb_bramctl_addr     (wb_addr_npe), // Address Signal (required)                                  
     .i_wib_bramctl_en      (wib_cs_npe), // Chip Enable Signal (optional)
     .o_wib_bramctl_rdata   (wib_rdata_npe), // Data Out Bus (optional)
     .i_wib_bramctl_wdata   (wib_wdata_npe), // Data In Bus (optional)
     .i_wib_bramctl_we      (wib_write_npe), // Byte Enables (optional)
     .i_wib_bramctl_be      (wib_wstrb_npe), // Byte Enables (optional)
     .i_wib_bramctl_addr    (wib_addr_npe), // Address Signal (required)                
     .i_lstmb_bramctl_en      (lstmb_cs_npe), // Chip Enable Signal (optional)
     .o_lstmb_bramctl_rdata   (lstmb_rdata_npe), // Data Out Bus (optional)
     .i_lstmb_bramctl_wdata   (lstmb_wdata_npe), // Data In Bus (optional)
     .i_lstmb_bramctl_we      (lstmb_write_npe), // Byte Enables (optional)
     .i_lstmb_bramctl_be      (lstmb_wstrb_npe), // Byte Enables (optional)
     .i_lstmb_bramctl_addr    (lstmb_addr_npe), // Address Signal (required)                
     .i_bias_bramctl_en     (biasb_cs_npe), // Chip Enable Signal (optional)
     .o_bias_bramctl_rdata  (biasb_rdata_npe), // Data Out Bus (optional)
     .i_bias_bramctl_wdata  (biasb_wdata_npe), // Data In Bus (optional)
     .i_bias_bramctl_we     (biasb_write_npe), // Byte Enables (optional)
     .i_bias_bramctl_be     (biasb_wstrb_npe), // Byte Enables (optional)
     .i_bias_bramctl_addr   (biasb_addr_npe), // Address Signal (required)                
     .i_inst_bramctl_en     (instb_cs_npe), // Chip Enable Signal (optional)
     .o_inst_bramctl_rdata  (instb_rdata_npe), // Data Out Bus (optional)
     .i_inst_bramctl_wdata  (instb_wdata_npe), // Data In Bus (optional)
     .i_inst_bramctl_we     (instb_write_npe), // Byte Enables (optional)
     .i_inst_bramctl_be     (instb_wstrb_npe), // Byte Enables (optional)
     .i_inst_bramctl_addr   (instb_addr_npe), // Address Signal (required)                
`else
     .i_iob_0_bramctl_en    (iob0_cs), // Chip Enable Signal (optional)
     .o_iob_0_bramctl_rdata (iob0_rdata), // Data Out Bus (optional)
     .i_iob_0_bramctl_wdata (iob0_wdata), // Data In Bus (optional)
     .i_iob_0_bramctl_we    (iob0_write), // Byte Enables (optional)
     .i_iob_0_bramctl_be    (iob0_wstrb), // Byte Enables (optional)
     .i_iob_0_bramctl_addr  (iob0_addr), // Address Signal (required)
     .i_iob_1_bramctl_en    (iob1_cs), // Chip Enable Signal (optional)
     .o_iob_1_bramctl_rdata (iob1_rdata), // Data Out Bus (optional)
     .i_iob_1_bramctl_wdata (iob1_wdata), // Data In Bus (optional)
     .i_iob_1_bramctl_we    (iob1_write), // Byte Enables (optional)
     .i_iob_1_bramctl_be    (iob1_wstrb), // Byte Enables (optional)
     .i_iob_1_bramctl_addr  (iob1_addr), // Address Signal (required)
     .i_wb_bramctl_en       (wb_cs), // Chip Enable Signal (optional)
     .o_wb_bramctl_rdata    (wb_rdata[415:0]), // Data Out Bus (optional)
     .i_wb_bramctl_wdata    (wb_wdata[415:0]), // Data In Bus (optional)
     .i_wb_bramctl_we       (wb_write), // Byte Enables (optional)
     .i_wb_bramctl_be       (wb_wstrb), // Byte Enables (optional)
     .i_wb_bramctl_addr     (wb_addr), // Address Signal (required)                                  
     .i_wib_bramctl_en      (wib_cs), // Chip Enable Signal (optional)
     .o_wib_bramctl_rdata   (wib_rdata), // Data Out Bus (optional)
     .i_wib_bramctl_wdata   (wib_wdata), // Data In Bus (optional)
     .i_wib_bramctl_we      (wib_write), // Byte Enables (optional)
     .i_wib_bramctl_be      (wib_wstrb), // Byte Enables (optional)
     .i_wib_bramctl_addr    (wib_addr), // Address Signal (required)                
     .i_lstmb_bramctl_en      (lstmb_cs), // Chip Enable Signal (optional)
     .o_lstmb_bramctl_rdata   (lstmb_rdata), // Data Out Bus (optional)
     .i_lstmb_bramctl_wdata   (lstmb_wdata), // Data In Bus (optional)
     .i_lstmb_bramctl_we      (lstmb_write), // Byte Enables (optional)
     .i_lstmb_bramctl_be      (lstmb_wstrb), // Byte Enables (optional)
     .i_lstmb_bramctl_addr    (lstmb_addr), // Address Signal (required)                
     .i_bias_bramctl_en     (biasb_cs), // Chip Enable Signal (optional)
     .o_bias_bramctl_rdata  (biasb_rdata), // Data Out Bus (optional)
     .i_bias_bramctl_wdata  (biasb_wdata), // Data In Bus (optional)
     .i_bias_bramctl_we     (biasb_write), // Byte Enables (optional)
     .i_bias_bramctl_be     (biasb_wstrb), // Byte Enables (optional)
     .i_bias_bramctl_addr   (biasb_addr), // Address Signal (required)                
     .i_inst_bramctl_en     (instb_cs), // Chip Enable Signal (optional)
     .o_inst_bramctl_rdata  (instb_rdata), // Data Out Bus (optional)
     .i_inst_bramctl_wdata  (instb_wdata), // Data In Bus (optional)
     .i_inst_bramctl_we     (instb_write), // Byte Enables (optional)
     .i_inst_bramctl_be     (instb_wstrb), // Byte Enables (optional)
     .i_inst_bramctl_addr   (instb_addr), // Address Signal (required)                
`endif// XDMA_AXI_DEBUG_SLAVE
     .i_iob_0_bramctl_s_clk (i_clk), // Clock Signal (required)
     .i_iob_0_bramctl_s_rst (i_rst_n), // Reset Signal (required)
     .i_iob_1_bramctl_s_clk (i_clk), // Clock Signal (required)
     .i_iob_1_bramctl_s_rst (i_rst_n), // Reset Signal (required)
     .i_wb_bramctl_s_clk    (i_clk), // Clock Signal (required)
     .i_wb_bramctl_s_rst    (i_rst_n), // Reset Signal (required)
     .i_wib_bramctl_s_clk   (i_clk), // Clock Signal (required)
     .i_wib_bramctl_s_rst   (i_rst_n),  // Reset Signal (required)
     .i_lstmb_bramctl_s_clk   (i_clk), // Clock Signal (required)
     .i_lstmb_bramctl_s_rst   (i_rst_n),  // Reset Signal (required)
     .i_bias_bramctl_s_clk  (i_clk), // Clock Signal (required)
     .i_bias_bramctl_s_rst  (i_rst_n),  // Reset Signal (required)    
     .i_inst_bramctl_s_clk  (i_clk), // Clock Signal (required)
     .i_inst_bramctl_s_rst  (i_rst_n)// Reset Signal (required) 
     

  );
  
dma U_DMA
(
//- xDMA_Converter
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
//- xDMA_CFG
  //- apb
`ifdef XDMA_AXI_DEBUG_SLAVE
  .pclk(xclk), 
  .preset_n(xrst_n), 
`else
  .pclk(pclk), 
  .preset_n(preset_n), 
`endif
  .paddr(paddr[7:0]), 
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
  .i_npu_idle(i_npu_idle), 
  .i_inst_exception(i_inst_exception), 
  .i_internal_stop(i_internal_stop), 
  .inst_work_state(inst_work_state), 
  .npu_work_state(npu_work_state), 
//- AXI MASTER
.aclk_m(mstr_aclk)
,.aresetn_m(mstr_aresetn)
,// MP Write Address Channel 1
 .awvalid_m(mstr_awvalid)
,.awaddr_m(mstr_awaddr)
,.awid_m(mstr_awid)
,.awlen_m(mstr_awlen)
,.awsize_m(mstr_awsize)
,.awburst_m(mstr_awburst)
,.awlock_m(mstr_awlock)
,.awcache_m(mstr_awcache)
,.awprot_m(mstr_awprot)
,.awready_m(mstr_awready)
,// MP Write Data Channel 1
 .wvalid_m(mstr_wvalid)
,.wid_m(mstr_wid)
,.wdata_m(mstr_wdata)
,.wstrb_m(mstr_wstrb)
,.wlast_m(mstr_wlast)
,.wready_m(mstr_wready)
,// MP Write Response Channel 1
 .bvalid_m(mstr_bvalid)
,.bid_m(mstr_bid)
,.bresp_m(mstr_bresp)
,.bready_m(mstr_bready)
,// MP Read Address Channel
 .arvalid_m(mstr_arvalid)
,.arid_m(mstr_arid)
,.araddr_m(mstr_araddr)
,.arlen_m(mstr_arlen)
,.arsize_m(mstr_arsize)
,.arburst_m(mstr_arburst)
,.arlock_m(mstr_arlock)
,.arcache_m(mstr_arcache)
,.arprot_m(mstr_arprot)
,.arready_m(mstr_arready)
,// MP Read Data Channel
 .rvalid_m(mstr_rvalid)
,.rid_m(mstr_rid)
,.rdata_m(mstr_rdata)
,.rresp_m(mstr_rresp)
,.rlast_m(mstr_rlast)
,.rready_m(mstr_rready), 
// System IF
  .npu_start(npu_start), 
  .npu_stop(npu_stop), 
  .o_interrupt(o_interrupt), 
  .sys_reset_n(sys_reset_n), 
  .xclk(xclk), 
  .xrst_n(xrst_n) 
);

`ifdef XDMA_AXI_DEBUG_SLAVE
wire [95:0] wb_rdata_npe_high;
assign wb_rdata_npe_high = 96'h0;

npu_bus U_NPU_BUS(
               .aclk(mstr_aclk)
               ,.aresetn(mstr_aresetn)
			   ,.xclk(xclk) 
			   ,.xrst_n(xrst_n) 
               // Write Address Channel from Master1
               ,.awvalid_m1(slv_awvalid)
               ,.awaddr_m1(slv_awaddr)
               ,.awid_m1(slv_awid)
               ,.awlen_m1(slv_awlen)
               ,.awsize_m1(slv_awsize)
               ,.awburst_m1(slv_awburst)
               ,.awlock_m1(slv_awlock)
               ,.awcache_m1(slv_awcache)
               ,.awprot_m1(slv_awprot)
               ,.awready_m1(slv_awready)
               // Write Data Channel from Master1
               ,.wvalid_m1(slv_wvalid)
               ,.wid_m1(slv_wid)
               ,.wdata_m1(slv_wdata)
               ,.wstrb_m1(slv_wstrb)
               ,.wlast_m1(slv_wlast)
               ,.wready_m1(slv_wready)
               // Write Response Channel from Master1
               ,.bvalid_m1(slv_bvalid)
               ,.bid_m1(slv_bid)
               ,.bresp_m1(slv_bresp)
               ,.bready_m1(slv_bready)
               // Read Address Channel from Master1
               ,.arvalid_m1(slv_arvalid)
               ,.arid_m1(slv_arid)
               ,.araddr_m1(slv_araddr)
               ,.arlen_m1(slv_arlen)
               ,.arsize_m1(slv_arsize)
               ,.arburst_m1(slv_arburst)
               ,.arlock_m1(slv_arlock)
               ,.arcache_m1(slv_arcache)
               ,.arprot_m1(slv_arprot)
               ,.arready_m1(slv_arready)
               // Read Data Channel from Master1
               ,.rvalid_m1(slv_rvalid)
               ,.rid_m1(slv_rid)
               ,.rdata_m1(slv_rdata)
               ,.rresp_m1(slv_rresp)
               ,.rlast_m1(slv_rlast)
               ,.rready_m1(slv_rready)
               ,.remap_n(remap_n)
               ,.paddr(paddr)
               ,.pwdata(pwdata)
               ,.pwrite(pwrite)
               ,.psel(psel)
               ,.penable(penable)
               ,.prdata(prdata)
               `GENE_CONN_DCLA(gs1)
               `GENE_CONN_DCLA(gs2)
               `GENE_CONN_DCLA(gs3)
               `GENE_CONN_DCLA(gs4)
               `GENE_CONN_DCLA(gs5)
               `GENE_CONN_DCLA(gs6)
               `GENE_CONN_DCLA(gs7)
               );

gs_mux #(
.AW_IOB0(12), 
.AW_IOB1(12), 
.AW_LSTMB(5), 
.AW_WB(13), 
.AW_WIB(10), 
.AW_BIASB(7), 
.AW_INSTB(12), 
.DW_IOB0(256),
.DW_IOB1(256),
.DW_LSTMB(32), 
.DW_WB(512), 
.DW_WIB(32), 
.DW_INSTB(128), 
.DW_BIASB(512)
) 
U_GS_MUX(
  .i_internal_stop(i_internal_stop), 
// XDMA BUFFER IF
  // IOB0 
  .iob0_wdata(iob0_wdata), 
  .iob0_wstrb(iob0_wstrb), 
  .iob0_addr(iob0_addr), 
  .iob0_write(iob0_write), 
  .iob0_read(iob0_read), 
  .iob0_cs(iob0_cs), 
  .iob0_rdata(iob0_rdata), 
  // IOB1 
  .iob1_wdata(iob1_wdata), 
  .iob1_wstrb(iob1_wstrb), 
  .iob1_addr(iob1_addr), 
  .iob1_write(iob1_write), 
  .iob1_read(iob1_read), 
  .iob1_cs(iob1_cs), 
  .iob1_rdata(iob1_rdata), 
  // WB 
  .wb_wdata(wb_wdata), 
  .wb_wstrb(wb_wstrb), 
  .wb_addr(wb_addr), 
  .wb_write(wb_write), 
  .wb_cs(wb_cs), 
  // WIB 
  .wib_wdata(wib_wdata), 
  .wib_wstrb(wib_wstrb), 
  .wib_addr(wib_addr), 
  .wib_write(wib_write), 
  .wib_cs(wib_cs), 
  // LSTMB 
  .lstmb_wdata(lstmb_wdata), 
  .lstmb_wstrb(lstmb_wstrb), 
  .lstmb_addr(lstmb_addr), 
  .lstmb_write(lstmb_write), 
  .lstmb_cs(lstmb_cs), 
  // INSTB 
  .instb_wdata(instb_wdata), 
  .instb_wstrb(instb_wstrb), 
  .instb_addr(instb_addr), 
  .instb_write(instb_write), 
  .instb_cs(instb_cs), 
  // BIASB 
  .biasb_wdata(biasb_wdata), 
  .biasb_wstrb(biasb_wstrb), 
  .biasb_addr(biasb_addr), 
  .biasb_write(biasb_write), 
  .biasb_read(biasb_read), 
  .biasb_cs(biasb_cs), 
// NPE BUFFER IF
  // IOB0 
  .iob0_wdata_npe(iob0_wdata_npe), 
  .iob0_wstrb_npe(iob0_wstrb_npe), 
  .iob0_addr_npe(iob0_addr_npe), 
  .iob0_write_npe(iob0_write_npe), 
  .iob0_read_npe(iob0_read_npe), 
  .iob0_cs_npe(iob0_cs_npe), 
  .iob0_rdata_npe(iob0_rdata_npe), 
  // IOB1 
  .iob1_wdata_npe(iob1_wdata_npe), 
  .iob1_wstrb_npe(iob1_wstrb_npe), 
  .iob1_addr_npe(iob1_addr_npe), 
  .iob1_write_npe(iob1_write_npe), 
  .iob1_read_npe(iob1_read_npe), 
  .iob1_cs_npe(iob1_cs_npe), 
  .iob1_rdata_npe(iob1_rdata_npe), 
  // LSTMB 
  .lstmb_wdata_npe(lstmb_wdata_npe), 
  .lstmb_wstrb_npe(lstmb_wstrb_npe), 
  .lstmb_addr_npe(lstmb_addr_npe), 
  .lstmb_write_npe(lstmb_write_npe), 
  .lstmb_read_npe(lstmb_read_npe), 
  .lstmb_cs_npe(lstmb_cs_npe), 
  .lstmb_rdata_npe(lstmb_rdata_npe), 
  // WB 
  .wb_wdata_npe(wb_wdata_npe), 
  .wb_wstrb_npe(wb_wstrb_npe), 
  .wb_addr_npe(wb_addr_npe), 
  .wb_write_npe(wb_write_npe), 
  .wb_cs_npe(wb_cs_npe), 
  .wb_rdata_npe({wb_rdata_npe_high, wb_rdata_npe}), 
  // WIB 
  .wib_wdata_npe(wib_wdata_npe), 
  .wib_wstrb_npe(wib_wstrb_npe), 
  .wib_addr_npe(wib_addr_npe), 
  .wib_write_npe(wib_write_npe), 
  .wib_cs_npe(wib_cs_npe), 
  .wib_rdata_npe(wib_rdata_npe), 
  // INSTB 
  .instb_wdata_npe(instb_wdata_npe), 
  .instb_wstrb_npe(instb_wstrb_npe), 
  .instb_addr_npe(instb_addr_npe), 
  .instb_write_npe(instb_write_npe), 
  .instb_cs_npe(instb_cs_npe), 
  .instb_rdata_npe(instb_rdata_npe), 
  // BIASB 
  .biasb_wdata_npe(biasb_wdata_npe), 
  .biasb_wstrb_npe(biasb_wstrb_npe), 
  .biasb_addr_npe(biasb_addr_npe), 
  .biasb_write_npe(biasb_write_npe), 
  .biasb_read_npe(biasb_read_npe), 
  .biasb_cs_npe(biasb_cs_npe), 
  .biasb_rdata_npe(biasb_rdata_npe)
               `GENE_CONN_DCLA(gs1)
               `GENE_CONN_DCLA(gs2)
               `GENE_CONN_DCLA(gs3)
               `GENE_CONN_DCLA(gs4)
               `GENE_CONN_DCLA(gs5)
               `GENE_CONN_DCLA(gs6)
               `GENE_CONN_DCLA(gs7)
);

`endif //`ifdef XDMA_AXI_DEBUG_SLAVE

endmodule
