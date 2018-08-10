

`define MEM_AXI_WIRE_DCLA(port) \
  wire                      awvalid_``port; \
  wire [`AXI_AW-1:0]        awaddr_``port; \
  wire [`AXI_SIDW-1:0]     awid_``port; \
  wire [`AXI_BLW-1:0]       awlen_``port; \
  wire [`AXI_BSW-1:0]       awsize_``port; \
  wire [`AXI_BTW-1:0]       awburst_``port; \
  wire [`AXI_LTW-1:0]       awlock_``port; \
  wire [`AXI_CTW-1:0]       awcache_``port; \
  wire [`AXI_PTW-1:0]       awprot_``port; \
  wire                       awready_``port; \
  wire                      wvalid_``port; \
  wire [`AXI_SIDW-1:0]     wid_``port; \
  wire [`AXI_DW-1:0]        wdata_``port; \
  wire [`AXI_SW-1:0]        wstrb_``port; \
  wire                      wlast_``port; \
  wire                       wready_``port; \
  wire                       bvalid_``port; \
  wire  [`AXI_SIDW-1:0]     bid_``port; \
  wire  [`AXI_BRW-1:0]       bresp_``port; \
  wire                      bready_``port; \
  wire                      arvalid_``port; \
  wire [`AXI_SIDW-1:0]     arid_``port; \
  wire [`AXI_AW-1:0]        araddr_``port; \
  wire [`AXI_BLW-1:0]       arlen_``port; \
  wire [`AXI_BSW-1:0]       arsize_``port; \
  wire [`AXI_BTW-1:0]       arburst_``port; \
  wire [`AXI_LTW-1:0]       arlock_``port; \
  wire [`AXI_CTW-1:0]       arcache_``port; \
  wire [`AXI_PTW-1:0]       arprot_``port; \
  wire                       arready_``port; \
  wire                       rvalid_``port; \
  wire  [`AXI_SIDW-1:0]     rid_``port; \
  wire  [`AXI_DW-1:0]        rdata_``port; \
  wire                       rlast_``port; \
  wire  [`AXI_RRW-1:0]       rresp_``port; \
  wire                      rready_``port;

`define GS_AXI_WIRE_DCLA(GS_DW, port) \
wire  [`GS_ID-1:0] awid_``port; \
wire  [`GS_AW-1:0] awaddr_``port; \
wire  [`GS_BW-1:0] awlen_``port; \
wire  [2:0] awsize_``port; \
wire  [1:0] awburst_``port; \
wire  [1:0] awlock_``port; \
wire  [3:0] awcache_``port; \
wire  [2:0] awprot_``port; \
wire  awvalid_``port; \
wire awready_``port; \
wire  [`GS_ID-1:0] wid_``port; \
wire  [``GS_DW-1:0] wdata_``port; \
wire  [``GS_DW/8-1:0] wstrb_``port; \
wire  wlast_``port; \
wire  wvalid_``port; \
wire wready_``port; \
wire [`GS_ID-1:0] bid_``port; \
wire [1:0] bresp_``port; \
wire bvalid_``port; \
wire  bready_``port; \
wire  [`GS_ID-1:0] arid_``port; \
wire  [`GS_AW-1:0] araddr_``port; \
wire  [`GS_BW-1:0] arlen_``port; \
wire  [2:0] arsize_``port; \
wire  [1:0] arburst_``port; \
wire  [1:0] arlock_``port; \
wire  [3:0] arcache_``port; \
wire  [2:0] arprot_``port; \
wire  arvalid_``port; \
wire arready_``port; \
wire [`GS_ID-1:0] rid_``port; \
wire [``GS_DW-1:0] rdata_``port; \
wire [1:0] rresp_``port; \
wire rlast_``port; \
wire rvalid_``port; \
wire rready_``port; 

`define GENE_IO_DCLA(GS_DW, gs) \
  output [`GS_AW-1:0] maddr_``gs, \
  output mread_``gs, \
  output mwrite_``gs, \
  output [2:0] msize_``gs, \
  output [1:0] mburst_``gs, \
  output [`GS_BW-1:0] mlen_``gs, \
  output mlast_``gs, \
  output [``GS_DW-1:0] mdata_``gs, \
  output [``GS_DW/8-1:0] mwstrb_``gs, \
  input  saccept_``gs, \
  input  svalid_``gs, \
  input  [``GS_DW-1:0] sdata_``gs, \
  input  [1:0] sresp_``gs, \
  output mready_``gs,  

`define X2P_INST(wd, INST, x2p) \
wd``_DW_axi_x2p U_x2p_``INST (/*AUTOARG*/ \
                 .awready(awready_``x2p), \
                 .wready(wready_``x2p), \
                 .bid(bid_``x2p), \
                 .bresp(bresp_``x2p), \
                 .bvalid(bvalid_``x2p), \
                 .arready(arready_``x2p), \
                 .rid(rid_``x2p), \
                 .rdata(rdata_``x2p), \
                 .rresp(rresp_``x2p), \
                 .rlast(rlast_``x2p), \
                 .rvalid(rvalid_``x2p), \
                 .aclk(aclk), \
                 .pclk(xclk), \
                 .aresetn(aresetn), \
                 .awid(awid_``x2p), \
                 .awaddr(awaddr_``x2p), \
                 .awlen(awlen_``x2p), \
                 .awsize(awsize_``x2p), \
                 .awburst(awburst_``x2p), \
                 .awlock(awlock_``x2p), \
                 .awcache(awcache_``x2p), \
                 .awprot(awprot_``x2p), \
                 .awvalid(awvalid_``x2p), \
                 .wid(wid_``x2p), \
                 .wdata(wdata_``x2p), \
                 .wstrb(wstrb_``x2p), \
                 .wlast(wlast_``x2p), \
                 .wvalid(wvalid_``x2p), \
                 .bready(bready_``x2p), \
                 .arid(arid_``x2p), \
                 .araddr(araddr_``x2p), \
                 .arlen(arlen_``x2p), \
                 .arsize(arsize_``x2p), \
                 .arburst(arburst_``x2p), \
                 .arlock(arlock_``x2p), \
                 .arcache(arcache_``x2p), \
                 .arprot(arprot_``x2p), \
                 .arvalid(arvalid_``x2p), \
                 .rready(rready_``x2p), \
                 .psel_s0(psel), \
                 .paddr(paddr), \
                 .penable(penable), \
                 .pwdata(pwdata), \
                 .pwrite(pwrite), \
                 .presetn(xrst_n), \
                 .prdata_s0(prdata) \
                 ); 

`define GS_INST(wd, INST, gs) \
wire gclken_``gs; \
assign gclken_``gs= 1'b1; \
wd``_DW_axi_gs U_gs_``INST (/*AUTOARG*/ \
                 .awready(awready_``gs), \
                 .wready(wready_``gs), \
                 .bid(bid_``gs), \
                 .bresp(bresp_``gs), \
                 .bvalid(bvalid_``gs), \
                 .arready(arready_``gs), \
                 .rid(rid_``gs), \
                 .rdata(rdata_``gs), \
                 .rresp(rresp_``gs), \
                 .rlast(rlast_``gs), \
                 .rvalid(rvalid_``gs), \
                 .maddr(maddr_``gs), \
                 .mread(mread_``gs), \
                 .mwrite(mwrite_``gs), \
                 .msize(msize_``gs), \
                 .mburst(mburst_``gs), \
                 .mlen(mlen_``gs), \
                 .mlast(mlast_``gs), \
                 .mdata(mdata_``gs), \
                 .mwstrb(mwstrb_``gs), \
                 .mready(mready_``gs), \
                 .aclk(xclk), \
                 .aresetn(xrst_n), \
                 .awid(awid_``gs), \
                 .awaddr(awaddr_``gs), \
                 .awlen(awlen_``gs), \
                 .awsize(awsize_``gs), \
                 .awburst(awburst_``gs), \
                 .awlock(awlock_``gs), \
                 .awcache(awcache_``gs), \
                 .awprot(awprot_``gs), \
                 .awvalid(awvalid_``gs), \
                 .wid(wid_``gs), \
                 .wdata(wdata_``gs), \
                 .wstrb(wstrb_``gs), \
                 .wlast(wlast_``gs), \
                 .wvalid(wvalid_``gs), \
                 .bready(bready_``gs), \
                 .arid(arid_``gs), \
                 .araddr(araddr_``gs), \
                 .arlen(arlen_``gs), \
                 .arsize(arsize_``gs), \
                 .arburst(arburst_``gs), \
                 .arlock(arlock_``gs), \
                 .arcache(arcache_``gs), \
                 .arprot(arprot_``gs), \
                 .arvalid(arvalid_``gs), \
                 .rready(rready_``gs), \
                 .gclken(gclken_``gs), \
                 .saccept(saccept_``gs), \
                 .svalid(svalid_``gs), \
                 .sdata(sdata_``gs), \
                 .sresp(sresp_``gs) \
                 );

`define X2X_INST(wd, port, gs) \
wd``_DW_axi_x2x U_X2X_``port( \
                   .aclk_m(aclk) \
                   ,.aresetn_m(aresetn) \
                   ,.awvalid_m(awvalid_``port) \
                   ,.awaddr_m(awaddr_``port) \
                   ,.awid_m(awid_``port) \
                   ,.awlen_m(awlen_``port) \
                   ,.awsize_m(awsize_``port) \
                   ,.awburst_m(awburst_``port) \
                   ,.awlock_m(awlock_``port) \
                   ,.awcache_m(awcache_``port) \
                   ,.awprot_m(awprot_``port) \
                   ,.awready_m(awready_``port) \
                   ,.wvalid_m(wvalid_``port) \
                   ,.wid_m(wid_``port) \
                   ,.wdata_m(wdata_``port) \
                   ,.wstrb_m(wstrb_``port) \
                   ,.wlast_m(wlast_``port) \
                   ,.wready_m(wready_``port) \
                   ,.bvalid_m(bvalid_``port) \
                   ,.bid_m(bid_``port) \
                   ,.bresp_m(bresp_``port) \
                   ,.bready_m(bready_``port) \
                   ,.arvalid_m(arvalid_``port) \
                   ,.arid_m(arid_``port) \
                   ,.araddr_m(araddr_``port) \
                   ,.arlen_m(arlen_``port) \
                   ,.arsize_m(arsize_``port) \
                   ,.arburst_m(arburst_``port) \
                   ,.arlock_m(arlock_``port) \
                   ,.arcache_m(arcache_``port) \
                   ,.arprot_m(arprot_``port) \
                   ,.arready_m(arready_``port) \
                   ,.rvalid_m(rvalid_``port) \
                   ,.rid_m(rid_``port) \
                   ,.rdata_m(rdata_``port) \
                   ,.rresp_m(rresp_``port) \
                   ,.rlast_m(rlast_``port) \
                   ,.rready_m(rready_``port) \
                   ,.aclk_s(xclk) \
                   ,.aresetn_s(xrst_n) \
                   ,.awvalid_s1(awvalid_``gs) \
                   ,.awaddr_s1(awaddr_``gs) \
                   ,.awid_s1(awid_``gs) \
                   ,.awlen_s1(awlen_``gs) \
                   ,.awsize_s1(awsize_``gs) \
                   ,.awburst_s1(awburst_``gs) \
                   ,.awlock_s1(awlock_``gs) \
                   ,.awcache_s1(awcache_``gs) \
                   ,.awprot_s1(awprot_``gs) \
                   ,.awready_s1(awready_``gs) \
                   ,.wvalid_s1(wvalid_``gs) \
                   ,.wid_s1(wid_``gs) \
                   ,.wdata_s1(wdata_``gs) \
                   ,.wstrb_s1(wstrb_``gs) \
                   ,.wlast_s1(wlast_``gs) \
                   ,.wready_s1(wready_``gs) \
                   ,.bvalid_s1(bvalid_``gs) \
                   ,.bid_s1(bid_``gs) \
                   ,.bresp_s1(bresp_``gs) \
                   ,.bready_s1(bready_``gs) \
                   ,.arvalid_s(arvalid_``gs) \
                   ,.arid_s(arid_``gs) \
                   ,.araddr_s(araddr_``gs) \
                   ,.arlen_s(arlen_``gs) \
                   ,.arsize_s(arsize_``gs) \
                   ,.arburst_s(arburst_``gs) \
                   ,.arlock_s(arlock_``gs) \
                   ,.arcache_s(arcache_``gs) \
                   ,.arprot_s(arprot_``gs) \
                   ,.arready_s(arready_``gs) \
                   ,.rvalid_s(rvalid_``gs) \
                   ,.rid_s(rid_``gs) \
                   ,.rdata_s(rdata_``gs) \
                   ,.rresp_s(rresp_``gs) \
                   ,.rlast_s(rlast_``gs) \
                   ,.rready_s(rready_``gs) \
                   );

module npu_bus(
//- AXI SLAVE
  // Write Address Channel from Master1
  input                       awvalid_m1, 
  input  [`AXI_AW-1:0]        awaddr_m1, 

          input  [`AXI_IDW_M1-1:0]     awid_m1, 

  input  [`AXI_BLW-1:0]       awlen_m1, 
  input  [`AXI_BSW-1:0]       awsize_m1, 
  input  [`AXI_BTW-1:0]       awburst_m1, 
  input  [`AXI_LTW-1:0]       awlock_m1, 
  input  [`AXI_CTW-1:0]       awcache_m1, 
  input  [`AXI_PTW-1:0]       awprot_m1, 
  output                      awready_m1, 
  // Write Data Channel from Master1
  input                       wvalid_m1, 

          input  [`AXI_IDW_M1-1:0]     wid_m1, 

  input  [`AXI_DW-1:0]        wdata_m1, 
  input  [`AXI_SW-1:0]        wstrb_m1, 
  input                       wlast_m1, 
  output                      wready_m1, 
  // Write Response Channel from Master1
  output                      bvalid_m1, 

          output [`AXI_IDW_M1-1:0]     bid_m1, 

  output [`AXI_BRW-1:0]       bresp_m1, 
  input                       bready_m1, 
  // Read Address Channel from Master1
  input                       arvalid_m1, 

          input  [`AXI_IDW_M1-1:0]     arid_m1, 

  input  [`AXI_AW-1:0]        araddr_m1, 
  input  [`AXI_BLW-1:0]       arlen_m1, 
  input  [`AXI_BSW-1:0]       arsize_m1, 
  input  [`AXI_BTW-1:0]       arburst_m1, 
  input  [`AXI_LTW-1:0]       arlock_m1, 
  input  [`AXI_CTW-1:0]       arcache_m1, 
  input  [`AXI_PTW-1:0]       arprot_m1, 
  output                      arready_m1, 
  // Read Data Channel from Master1
  output                      rvalid_m1, 

          output [`AXI_IDW_M1-1:0]     rid_m1, 

  output [`AXI_DW-1:0]        rdata_m1, 
  output                      rlast_m1, 
  output [`AXI_RRW-1:0]       rresp_m1, 
  input                       rready_m1, 

  input remap_n, 

  `GENE_IO_DCLA(`GS_DW_gs1, gs1)
  `GENE_IO_DCLA(`GS_DW_gs2, gs2)
  `GENE_IO_DCLA(`GS_DW_gs3, gs3)
  `GENE_IO_DCLA(`GS_DW_gs4, gs4)
  `GENE_IO_DCLA(`GS_DW_gs5, gs5)
  `GENE_IO_DCLA(`GS_DW_gs6, gs6)
  `GENE_IO_DCLA(`GS_DW_gs7, gs7)
// APB 
  output [31:0] paddr, 
  output [31:0] pwdata, 
  output pwrite, 
  output psel, 
  output penable, 
  input [31:0] prdata, 
  
//
  input aclk,  
  input aresetn, 
  input xclk, 
  input xrst_n
);

//-wire [31:0] paddr;
//-wire [31:0] pwdata;
//-wire pwrite;
//-wire psel;
//-wire penable;
//-wire [31:0] prdata;

  // Default Slave Port Signals

  // Default slave write address channel

  wire [`AXI_SIDW-1:0] dbg_awid_s0;
  wire [`AXI_AW-1:0]   dbg_awaddr_s0;
  wire [`AXI_BLW-1:0]  dbg_awlen_s0;
  wire [`AXI_BSW-1:0]	dbg_awsize_s0;
  wire [`AXI_BTW-1:0]	dbg_awburst_s0;
  wire [`AXI_LTW-1:0]	dbg_awlock_s0;
  wire [`AXI_CTW-1:0] 	dbg_awcache_s0;
  wire [`AXI_PTW-1:0]	dbg_awprot_s0;
  wire                  dbg_awvalid_s0;
  wire                  dbg_awready_s0;

  // Default slave write data channel

  wire [`AXI_SIDW-1:0]   dbg_wid_s0;
  wire [`AXI_DW-1:0]     dbg_wdata_s0;
  wire [`AXI_SW-1:0]     dbg_wstrb_s0;
  wire                    dbg_wlast_s0;
  wire                    dbg_wvalid_s0;
  wire                    dbg_wready_s0;

  // Default Slave write burst response channel

  wire [`AXI_SIDW-1:0]   dbg_bid_s0;
  wire [`AXI_BRW-1:0]    dbg_bresp_s0;
  wire                    dbg_bvalid_s0;
  wire                    dbg_bready_s0;

  // Default slave read address channel

  wire [`AXI_SIDW-1:0] dbg_arid_s0;
  wire [`AXI_AW-1:0]   dbg_araddr_s0;
  wire [`AXI_BLW-1:0]  dbg_arlen_s0;
  wire [`AXI_BSW-1:0]  dbg_arsize_s0;
  wire [`AXI_BTW-1:0]  dbg_arburst_s0;
  wire [`AXI_LTW-1:0]  dbg_arlock_s0;
  wire [`AXI_CTW-1:0]  dbg_arcache_s0;
  wire [`AXI_PTW-1:0]  dbg_arprot_s0;
  wire                  dbg_arvalid_s0;
  wire                  dbg_arready_s0;

  // Default slave read data channel
  wire [`AXI_SIDW-1:0] dbg_rid_s0;
  wire [`AXI_DW-1:0]   dbg_rdata_s0;
  wire [`AXI_RRW-1:0]  dbg_rresp_s0;
  wire                  dbg_rvalid_s0;
  wire                  dbg_rlast_s0;
  wire                  dbg_rready_s0;

`MEM_AXI_WIRE_DCLA(s1)
`MEM_AXI_WIRE_DCLA(s2)
`MEM_AXI_WIRE_DCLA(s3)
`MEM_AXI_WIRE_DCLA(s4)
`MEM_AXI_WIRE_DCLA(s5)
`MEM_AXI_WIRE_DCLA(s6)
`MEM_AXI_WIRE_DCLA(s7)
`MEM_AXI_WIRE_DCLA(s8)

`GS_AXI_WIRE_DCLA(`GS_DW_gs1, gs1)
`GS_AXI_WIRE_DCLA(`GS_DW_gs2, gs2)
`GS_AXI_WIRE_DCLA(`GS_DW_gs3, gs3)
`GS_AXI_WIRE_DCLA(`GS_DW_gs4, gs4)
`GS_AXI_WIRE_DCLA(`GS_DW_gs5, gs5)
`GS_AXI_WIRE_DCLA(`GS_DW_gs6, gs6)
`GS_AXI_WIRE_DCLA(`GS_DW_gs7, gs7)
`GS_AXI_WIRE_DCLA(32, x2p)

`X2X_INST(x256, s1, gs1)
`X2X_INST(x256, s2, gs2)
`X2X_INST(x32, s3, gs3)
`X2X_INST(x512, s4, gs4)
`X2X_INST(x32,  s5, gs5)
`X2X_INST(x512, s6, gs6)
`X2X_INST(x128, s7, gs7)
`X2X_INST(x32, s8, x2p)

`GS_INST(g256, IOB0,  gs1) 
`GS_INST(g256, IOB1,  gs2) 
`GS_INST(g32, LSTMB,  gs3) 
`GS_INST(g512, WB416, gs4) 
`GS_INST(g32,  WIB,   gs5) 
`GS_INST(g512, BIAS,  gs6) 
`GS_INST(g128, INST,  gs7) 
`X2P_INST(x32, xdma, x2p) 

DW_axi U_axi_mem (
               .aclk(aclk) 
               ,.aresetn(aresetn)
               // Write Address Channel from Master1
               ,.awvalid_m1(awvalid_m1)
               ,.awaddr_m1(awaddr_m1)
               ,.awid_m1(awid_m1)
               ,.awlen_m1(awlen_m1)
               ,.awsize_m1(awsize_m1)
               ,.awburst_m1(awburst_m1)
               ,.awlock_m1(awlock_m1)
               ,.awcache_m1(awcache_m1)
               ,.awprot_m1(awprot_m1)
               ,.awready_m1(awready_m1)
               // Write Data Channel from Master1
               ,.wvalid_m1(wvalid_m1)
               ,.wid_m1(wid_m1)
               ,.wdata_m1(wdata_m1)
               ,.wstrb_m1(wstrb_m1)
               ,.wlast_m1(wlast_m1)
               ,.wready_m1(wready_m1)
               // Write Response Channel from Master1
               ,.bvalid_m1(bvalid_m1)
               ,.bid_m1(bid_m1)
               ,.bresp_m1(bresp_m1)
               ,.bready_m1(bready_m1)
               // Read Address Channel from Master1
               ,.arvalid_m1(arvalid_m1)
               ,.arid_m1(arid_m1)
               ,.araddr_m1(araddr_m1)
               ,.arlen_m1(arlen_m1)
               ,.arsize_m1(arsize_m1)
               ,.arburst_m1(arburst_m1)
               ,.arlock_m1(arlock_m1)
               ,.arcache_m1(arcache_m1)
               ,.arprot_m1(arprot_m1)
               ,.arready_m1(arready_m1)
               // Read Data Channel from Master1
               ,.rvalid_m1(rvalid_m1)
               ,.rid_m1(rid_m1)
               ,.rdata_m1(rdata_m1)
               ,.rresp_m1(rresp_m1)
               ,.rlast_m1(rlast_m1)
               ,.rready_m1(rready_m1)
               // Write Address Channel from Slave1
               ,.awvalid_s1(awvalid_s1)
               ,.awaddr_s1(awaddr_s1)
               ,.awid_s1(awid_s1)
               ,.awlen_s1(awlen_s1)
               ,.awsize_s1(awsize_s1)
               ,.awburst_s1(awburst_s1)
               ,.awlock_s1(awlock_s1)
               ,.awcache_s1(awcache_s1)
               ,.awprot_s1(awprot_s1)
               ,.awready_s1(awready_s1)
               // Write Data Channel from Slave1
               ,.wvalid_s1(wvalid_s1)
               ,.wid_s1(wid_s1)
               ,.wdata_s1(wdata_s1)
               ,.wstrb_s1(wstrb_s1)
               ,.wlast_s1(wlast_s1)
               ,.wready_s1(wready_s1)
               // Write Response Channel from Slave1
               ,.bvalid_s1(bvalid_s1)
               ,.bid_s1(bid_s1)
               ,.bresp_s1(bresp_s1)
               ,.bready_s1(bready_s1)
               // Read Address Channel from Slave1
               ,.arvalid_s1(arvalid_s1)
               ,.arid_s1(arid_s1)
               ,.araddr_s1(araddr_s1)
               ,.arlen_s1(arlen_s1)
               ,.arsize_s1(arsize_s1)
               ,.arburst_s1(arburst_s1)
               ,.arlock_s1(arlock_s1)
               ,.arcache_s1(arcache_s1)
               ,.arprot_s1(arprot_s1)
               ,.arready_s1(arready_s1)
               // Read Data Channel from Slave1
               ,.rvalid_s1(rvalid_s1)
               ,.rid_s1(rid_s1)
               ,.rdata_s1(rdata_s1)
               ,.rresp_s1(rresp_s1)
               ,.rlast_s1(rlast_s1)
               ,.rready_s1(rready_s1)
               // Write Address Channel from Slave2
               ,.awvalid_s2(awvalid_s2)
               ,.awaddr_s2(awaddr_s2)
               ,.awid_s2(awid_s2)
               ,.awlen_s2(awlen_s2)
               ,.awsize_s2(awsize_s2)
               ,.awburst_s2(awburst_s2)
               ,.awlock_s2(awlock_s2)
               ,.awcache_s2(awcache_s2)
               ,.awprot_s2(awprot_s2)
               ,.awready_s2(awready_s2)
               // Write Data Channel from Slave2
               ,.wvalid_s2(wvalid_s2)
               ,.wid_s2(wid_s2)
               ,.wdata_s2(wdata_s2)
               ,.wstrb_s2(wstrb_s2)
               ,.wlast_s2(wlast_s2)
               ,.wready_s2(wready_s2)
               // Write Response Channel from Slave2
               ,.bvalid_s2(bvalid_s2)
               ,.bid_s2(bid_s2)
               ,.bresp_s2(bresp_s2)
               ,.bready_s2(bready_s2)
               // Read Address Channel from Slave2
               ,.arvalid_s2(arvalid_s2)
               ,.arid_s2(arid_s2)
               ,.araddr_s2(araddr_s2)
               ,.arlen_s2(arlen_s2)
               ,.arsize_s2(arsize_s2)
               ,.arburst_s2(arburst_s2)
               ,.arlock_s2(arlock_s2)
               ,.arcache_s2(arcache_s2)
               ,.arprot_s2(arprot_s2)
               ,.arready_s2(arready_s2)
               // Read Data Channel from Slave2
               ,.rvalid_s2(rvalid_s2)
               ,.rid_s2(rid_s2)
               ,.rdata_s2(rdata_s2)
               ,.rresp_s2(rresp_s2)
               ,.rlast_s2(rlast_s2)
               ,.rready_s2(rready_s2)
               // Write Address Channel from Slave3
               ,.awvalid_s3(awvalid_s3)
               ,.awaddr_s3(awaddr_s3)
               ,.awid_s3(awid_s3)
               ,.awlen_s3(awlen_s3)
               ,.awsize_s3(awsize_s3)
               ,.awburst_s3(awburst_s3)
               ,.awlock_s3(awlock_s3)
               ,.awcache_s3(awcache_s3)
               ,.awprot_s3(awprot_s3)
               ,.awready_s3(awready_s3)
               // Write Data Channel from Slave3
               ,.wvalid_s3(wvalid_s3)
               ,.wid_s3(wid_s3)
               ,.wdata_s3(wdata_s3)
               ,.wstrb_s3(wstrb_s3)
               ,.wlast_s3(wlast_s3)
               ,.wready_s3(wready_s3)
               // Write Response Channel from Slave3
               ,.bvalid_s3(bvalid_s3)
               ,.bid_s3(bid_s3)
               ,.bresp_s3(bresp_s3)
               ,.bready_s3(bready_s3)
               // Read Address Channel from Slave3
               ,.arvalid_s3(arvalid_s3)
               ,.arid_s3(arid_s3)
               ,.araddr_s3(araddr_s3)
               ,.arlen_s3(arlen_s3)
               ,.arsize_s3(arsize_s3)
               ,.arburst_s3(arburst_s3)
               ,.arlock_s3(arlock_s3)
               ,.arcache_s3(arcache_s3)
               ,.arprot_s3(arprot_s3)
               ,.arready_s3(arready_s3)
               // Read Data Channel from Slave3
               ,.rvalid_s3(rvalid_s3)
               ,.rid_s3(rid_s3)
               ,.rdata_s3(rdata_s3)
               ,.rresp_s3(rresp_s3)
               ,.rlast_s3(rlast_s3)
               ,.rready_s3(rready_s3)
               // Write Address Channel from Slave4
               ,.awvalid_s4(awvalid_s4)
               ,.awaddr_s4(awaddr_s4)
               ,.awid_s4(awid_s4)
               ,.awlen_s4(awlen_s4)
               ,.awsize_s4(awsize_s4)
               ,.awburst_s4(awburst_s4)
               ,.awlock_s4(awlock_s4)
               ,.awcache_s4(awcache_s4)
               ,.awprot_s4(awprot_s4)
               ,.awready_s4(awready_s4)
               // Write Data Channel from Slave4
               ,.wvalid_s4(wvalid_s4)
               ,.wid_s4(wid_s4)
               ,.wdata_s4(wdata_s4)
               ,.wstrb_s4(wstrb_s4)
               ,.wlast_s4(wlast_s4)
               ,.wready_s4(wready_s4)
               // Write Response Channel from Slave4
               ,.bvalid_s4(bvalid_s4)
               ,.bid_s4(bid_s4)
               ,.bresp_s4(bresp_s4)
               ,.bready_s4(bready_s4)
               // Read Address Channel from Slave4
               ,.arvalid_s4(arvalid_s4)
               ,.arid_s4(arid_s4)
               ,.araddr_s4(araddr_s4)
               ,.arlen_s4(arlen_s4)
               ,.arsize_s4(arsize_s4)
               ,.arburst_s4(arburst_s4)
               ,.arlock_s4(arlock_s4)
               ,.arcache_s4(arcache_s4)
               ,.arprot_s4(arprot_s4)
               ,.arready_s4(arready_s4)
               // Read Data Channel from Slave4
               ,.rvalid_s4(rvalid_s4)
               ,.rid_s4(rid_s4)
               ,.rdata_s4(rdata_s4)
               ,.rresp_s4(rresp_s4)
               ,.rlast_s4(rlast_s4)
               ,.rready_s4(rready_s4)
               // Write Address Channel from Slave5
               ,.awvalid_s5(awvalid_s5)
               ,.awaddr_s5(awaddr_s5)
               ,.awid_s5(awid_s5)
               ,.awlen_s5(awlen_s5)
               ,.awsize_s5(awsize_s5)
               ,.awburst_s5(awburst_s5)
               ,.awlock_s5(awlock_s5)
               ,.awcache_s5(awcache_s5)
               ,.awprot_s5(awprot_s5)
               ,.awready_s5(awready_s5)
               // Write Data Channel from Slave5
               ,.wvalid_s5(wvalid_s5)
               ,.wid_s5(wid_s5)
               ,.wdata_s5(wdata_s5)
               ,.wstrb_s5(wstrb_s5)
               ,.wlast_s5(wlast_s5)
               ,.wready_s5(wready_s5)
               // Write Response Channel from Slave5
               ,.bvalid_s5(bvalid_s5)
               ,.bid_s5(bid_s5)
               ,.bresp_s5(bresp_s5)
               ,.bready_s5(bready_s5)
               // Read Address Channel from Slave5
               ,.arvalid_s5(arvalid_s5)
               ,.arid_s5(arid_s5)
               ,.araddr_s5(araddr_s5)
               ,.arlen_s5(arlen_s5)
               ,.arsize_s5(arsize_s5)
               ,.arburst_s5(arburst_s5)
               ,.arlock_s5(arlock_s5)
               ,.arcache_s5(arcache_s5)
               ,.arprot_s5(arprot_s5)
               ,.arready_s5(arready_s5)
               // Read Data Channel from Slave5
               ,.rvalid_s5(rvalid_s5)
               ,.rid_s5(rid_s5)
               ,.rdata_s5(rdata_s5)
               ,.rresp_s5(rresp_s5)
               ,.rlast_s5(rlast_s5)
               ,.rready_s5(rready_s5)
               // Write Address Channel from Slave6
               ,.awvalid_s6(awvalid_s6)
               ,.awaddr_s6(awaddr_s6)
               ,.awid_s6(awid_s6)
               ,.awlen_s6(awlen_s6)
               ,.awsize_s6(awsize_s6)
               ,.awburst_s6(awburst_s6)
               ,.awlock_s6(awlock_s6)
               ,.awcache_s6(awcache_s6)
               ,.awprot_s6(awprot_s6)
               ,.awready_s6(awready_s6)
               // Write Data Channel from Slave6
               ,.wvalid_s6(wvalid_s6)
               ,.wid_s6(wid_s6)
               ,.wdata_s6(wdata_s6)
               ,.wstrb_s6(wstrb_s6)
               ,.wlast_s6(wlast_s6)
               ,.wready_s6(wready_s6)
               // Write Response Channel from Slave6
               ,.bvalid_s6(bvalid_s6)
               ,.bid_s6(bid_s6)
               ,.bresp_s6(bresp_s6)
               ,.bready_s6(bready_s6)
               // Read Address Channel from Slave6
               ,.arvalid_s6(arvalid_s6)
               ,.arid_s6(arid_s6)
               ,.araddr_s6(araddr_s6)
               ,.arlen_s6(arlen_s6)
               ,.arsize_s6(arsize_s6)
               ,.arburst_s6(arburst_s6)
               ,.arlock_s6(arlock_s6)
               ,.arcache_s6(arcache_s6)
               ,.arprot_s6(arprot_s6)
               ,.arready_s6(arready_s6)
               // Read Data Channel from Slave6
               ,.rvalid_s6(rvalid_s6)
               ,.rid_s6(rid_s6)
               ,.rdata_s6(rdata_s6)
               ,.rresp_s6(rresp_s6)
               ,.rlast_s6(rlast_s6)
               ,.rready_s6(rready_s6)
               // Write Address Channel from Slave7
               ,.awvalid_s7(awvalid_s7)
               ,.awaddr_s7(awaddr_s7)
               ,.awid_s7(awid_s7)
               ,.awlen_s7(awlen_s7)
               ,.awsize_s7(awsize_s7)
               ,.awburst_s7(awburst_s7)
               ,.awlock_s7(awlock_s7)
               ,.awcache_s7(awcache_s7)
               ,.awprot_s7(awprot_s7)
               ,.awready_s7(awready_s7)
               // Write Data Channel from Slave7
               ,.wvalid_s7(wvalid_s7)
               ,.wid_s7(wid_s7)
               ,.wdata_s7(wdata_s7)
               ,.wstrb_s7(wstrb_s7)
               ,.wlast_s7(wlast_s7)
               ,.wready_s7(wready_s7)
               // Write Response Channel from Slave7
               ,.bvalid_s7(bvalid_s7)
               ,.bid_s7(bid_s7)
               ,.bresp_s7(bresp_s7)
               ,.bready_s7(bready_s7)
               // Read Address Channel from Slave7
               ,.arvalid_s7(arvalid_s7)
               ,.arid_s7(arid_s7)
               ,.araddr_s7(araddr_s7)
               ,.arlen_s7(arlen_s7)
               ,.arsize_s7(arsize_s7)
               ,.arburst_s7(arburst_s7)
               ,.arlock_s7(arlock_s7)
               ,.arcache_s7(arcache_s7)
               ,.arprot_s7(arprot_s7)
               ,.arready_s7(arready_s7)
               // Read Data Channel from Slave7
               ,.rvalid_s7(rvalid_s7)
               ,.rid_s7(rid_s7)
               ,.rdata_s7(rdata_s7)
               ,.rresp_s7(rresp_s7)
               ,.rlast_s7(rlast_s7)
               ,.rready_s7(rready_s7)
               // Write Address Channel from Slave8
               ,.awvalid_s8(awvalid_s8)
               ,.awaddr_s8(awaddr_s8)
               ,.awid_s8(awid_s8)
               ,.awlen_s8(awlen_s8)
               ,.awsize_s8(awsize_s8)
               ,.awburst_s8(awburst_s8)
               ,.awlock_s8(awlock_s8)
               ,.awcache_s8(awcache_s8)
               ,.awprot_s8(awprot_s8)
               ,.awready_s8(awready_s8)
               // Write Data Channel from Slave8
               ,.wvalid_s8(wvalid_s8)
               ,.wid_s8(wid_s8)
               ,.wdata_s8(wdata_s8)
               ,.wstrb_s8(wstrb_s8)
               ,.wlast_s8(wlast_s8)
               ,.wready_s8(wready_s8)
               // Write Response Channel from Slave8
               ,.bvalid_s8(bvalid_s8)
               ,.bid_s8(bid_s8)
               ,.bresp_s8(bresp_s8)
               ,.bready_s8(bready_s8)
               // Read Address Channel from Slave8
               ,.arvalid_s8(arvalid_s8)
               ,.arid_s8(arid_s8)
               ,.araddr_s8(araddr_s8)
               ,.arlen_s8(arlen_s8)
               ,.arsize_s8(arsize_s8)
               ,.arburst_s8(arburst_s8)
               ,.arlock_s8(arlock_s8)
               ,.arcache_s8(arcache_s8)
               ,.arprot_s8(arprot_s8)
               ,.arready_s8(arready_s8)
               // Read Data Channel from Slave8
               ,.rvalid_s8(rvalid_s8)
               ,.rid_s8(rid_s8)
               ,.rdata_s8(rdata_s8)
               ,.rresp_s8(rresp_s8)
               ,.rlast_s8(rlast_s8)
               ,.rready_s8(rready_s8)
               ,.// Default Slave Port Signals
               // Default slave write address channel
               dbg_awid_s0(dbg_awid_s0)
               ,.dbg_awaddr_s0(dbg_awaddr_s0)
               ,.dbg_awlen_s0(dbg_awlen_s0)
               ,.dbg_awsize_s0(dbg_awsize_s0)
               ,.dbg_awburst_s0(dbg_awburst_s0)
               ,.dbg_awlock_s0(dbg_awlock_s0)
               ,.dbg_awcache_s0(dbg_awcache_s0)
               ,.dbg_awprot_s0(dbg_awprot_s0)
               ,.dbg_awvalid_s0(dbg_awvalid_s0)
               ,.dbg_awready_s0(dbg_awready_s0)
               ,.// Default slave write data channel
               dbg_wid_s0(dbg_wid_s0)
               ,.dbg_wdata_s0(dbg_wdata_s0)
               ,.dbg_wstrb_s0(dbg_wstrb_s0)
               ,.dbg_wlast_s0(dbg_wlast_s0)
               ,.dbg_wvalid_s0(dbg_wvalid_s0)
               ,.dbg_wready_s0(dbg_wready_s0)
               ,.// Default slave write burst response channel
               dbg_bid_s0(dbg_bid_s0)
               ,.dbg_bresp_s0(dbg_bresp_s0)
               ,.dbg_bvalid_s0(dbg_bvalid_s0)
               ,.dbg_bready_s0(dbg_bready_s0)
               ,.// Default slave read address channel
               dbg_arid_s0(dbg_arid_s0)
               ,.dbg_araddr_s0(dbg_araddr_s0)
               ,.dbg_arlen_s0(dbg_arlen_s0)
               ,.dbg_arsize_s0(dbg_arsize_s0)
               ,.dbg_arburst_s0(dbg_arburst_s0)
               ,.dbg_arlock_s0(dbg_arlock_s0)
               ,.dbg_arcache_s0(dbg_arcache_s0)
               ,.dbg_arprot_s0(dbg_arprot_s0)
               ,.dbg_arvalid_s0(dbg_arvalid_s0)
               ,.dbg_arready_s0(dbg_arready_s0)
               ,.// Default slave read data channel
               dbg_rid_s0(dbg_rid_s0)
               ,.dbg_rdata_s0(dbg_rdata_s0)
               ,.dbg_rresp_s0(dbg_rresp_s0)
               ,.dbg_rvalid_s0(dbg_rvalid_s0)
               ,.dbg_rlast_s0(dbg_rlast_s0)
               ,.dbg_rready_s0(dbg_rready_s0)
               ,.remap_n(remap_n)
               );

//wire gclken_s1;
//assign gclken_s1 = 1'b1;
//DW_axi_gs U_IOB0_gs(/*AUTOARG*/
//  // Outputs
//                 awready(awready_s1), 
//                 wready(wready_s1), 
//                 bid(bid_s1), 
//                 bresp(bresp_s1), 
//                 bvalid(bvalid_s1), 
//                 arready(arready_s1), 
//                 rid(rid_s1), 
//                 rdata(rdata_s1), 
//                 rresp(rresp_s1), 
//                 rlast(rlast_s1), 
//                 rvalid(rvalid_s1), 
//                 maddr(maddr_s1), 
//                 mread(mread_s1), 
//                 mwrite(mwrite_s1), 
//                 msize(msize_s1), 
//                 mburst(mburst_s1), 
//                 mlen(mlen_s1), 
//                 mlast(mlast_s1), 
//                 mdata(mdata_s1), 
//                 mwstrb(mwstrb_s1), 
//                 mready(mready_s1), 
//                 // Inputs
//                 aclk(aclk_s1), 
//                 aresetn(aresetn_s1), 
//                 awid(awid_s1), 
//                 awaddr(awaddr_s1), 
//                 awlen(awlen_s1), 
//                 awsize(awsize_s1), 
//                 awburst(awburst_s1), 
//                 awlock(awlock_s1), 
//                 awcache(awcache_s1), 
//                 awprot(awprot_s1), 
//                 awvalid(awvalid_s1), 
//                 wid(wid_s1), 
//                 wdata(wdata_s1), 
//                 wstrb(wstrb_s1), 
//                 wlast(wlast_s1), 
//                 wvalid(wvalid_s1), 
//                 bready(bready_s1), 
//                 arid(arid_s1), 
//                 araddr(araddr_s1), 
//                 arlen(arlen_s1), 
//                 arsize(arsize_s1), 
//                 arburst(arburst_s1), 
//                 arlock(arlock_s1), 
//                 arcache(arcache_s1), 
//                 arprot(arprot_s1), 
//                 arvalid(arvalid_s1), 
//                 rready(rready_s1), 
//                 gclken(gclken_s1), 
//                 saccept(saccept_s1), 
//                 svalid(svalid_s1), 
//                 sdata(sdata_s1), 
//                 sresp(sresp_s1)
//                 );
//
//wire gclken_s2;
//assign gclken_s2 = 1'b1;
//DW_axi_gs U_IOB1_gs(/*AUTOARG*/
//  // Outputs
//                 awready(awready_s2), 
//                 wready(wready_s2), 
//                 bid(bid_s2), 
//                 bresp(bresp_s2), 
//                 bvalid(bvalid_s2), 
//                 arready(arready_s2), 
//                 rid(rid_s2), 
//                 rdata(rdata_s2), 
//                 rresp(rresp_s2), 
//                 rlast(rlast_s2), 
//                 rvalid(rvalid_s2), 
//                 maddr(maddr_s2), 
//                 mread(mread_s2), 
//                 mwrite(mwrite_s2), 
//                 msize(msize_s2), 
//                 mburst(mburst_s2), 
//                 mlen(mlen_s2), 
//                 mlast(mlast_s2), 
//                 mdata(mdata_s2), 
//                 mwstrb(mwstrb_s2), 
//                 mready(mready_s2), 
//                 // Inputs
//                 aclk(aclk_s2), 
//                 aresetn(aresetn_s2), 
//                 awid(awid_s2), 
//                 awaddr(awaddr_s2), 
//                 awlen(awlen_s2), 
//                 awsize(awsize_s2), 
//                 awburst(awburst_s2), 
//                 awlock(awlock_s2), 
//                 awcache(awcache_s2), 
//                 awprot(awprot_s2), 
//                 awvalid(awvalid_s2), 
//                 wid(wid_s2), 
//                 wdata(wdata_s2), 
//                 wstrb(wstrb_s2), 
//                 wlast(wlast_s2), 
//                 wvalid(wvalid_s2), 
//                 bready(bready_s2), 
//                 arid(arid_s2), 
//                 araddr(araddr_s2), 
//                 arlen(arlen_s2), 
//                 arsize(arsize_s2), 
//                 arburst(arburst_s2), 
//                 arlock(arlock_s2), 
//                 arcache(arcache_s2), 
//                 arprot(arprot_s2), 
//                 arvalid(arvalid_s2), 
//                 rready(rready_s2), 
//                 gclken(gclken_s2), 
//                 saccept(saccept_s2), 
//                 svalid(svalid_s2), 
//                 sdata(sdata_s2), 
//                 sresp(sresp_s2)
//                 );

endmodule

