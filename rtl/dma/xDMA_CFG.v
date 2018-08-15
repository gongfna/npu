/*
Project:
Team:
Module Name: xDMA_CFG
$RCSfile$
$Author$
$Date$
$Name$
$Revision$
$State$
Hierarchy: 
    ----> xDMA_CFG(xDMA_CFG.v)
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
module xDMA_CFG
(
//
input xclk, 
input xreset_n, 
//
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
input [7:0] i_line_size, 
input [1:0] i_stride, 
input [1:0] i_pad_num, 
//- xdma core
input dma_done, 
output [31:0] dma_src_addr, 
output [31:0] dma_dst_addr, 
output [31:0] dma_trans_len, 
output b_stream, 
output ex_dma, 
output [7:0] line_size, 
output [1:0] stride,
output [1:0] pad_num, 
output [31:0] zone1_addr_s,
output [31:0] zone1_size_s,
output [31:0] zone2_addr_s,
output [31:0] zone2_size_s,
output [31:0] zone3_addr_s,
output [31:0] zone3_size_s,
output [31:0] zone4_addr_s,
output [31:0] zone4_size_s,
output [3:0] zone_en_s,
output [31:0] src_addr_s,
output [31:0] inst_depth_s,
output [3:0] awid_cfg, 
output [1:0] awburst_cfg, 
output awlock_cfg, 
output [2:0] awprot_cfg, 
output [3:0] awcache_cfg, 
output [3:0] wid_cfg, 
output [3:0] arid_cfg, 
output [1:0] arburst_cfg, 
output arlock_cfg, 
output [2:0] arprot_cfg, 
output [3:0] arcache_cfg, 

//- Converter
output [3:0] dma_mode,
output mode_m2instb,

//- 
//- input [7:0] int_status, 
//- input [9:0] irr_pre,
//- input [3:0] zone_status_pre, 
//- input [7:0] status_pre,
output sys_reset_n, 
output axi_wr_buf_en, 
//output init_inst, 
output npu_stop, 
output npu_start, 
//input init_inst_finish, 
//- IRR
input internal_stop, 
input ex_zone_bias_wr_finish, 
input ex_zone_wib_wr_finish, 
input ex_zone_wb_wr_finish, 
input inst_exception, 
input init_inst_finish, 
input zone3_wr_finish, 
input zone2_wr_finish, 
input zone1_rd_finish, 
input zone0_rd_finish, 
//- STATUS
input npu_idle, 
input init_prot_finish, 
input sw_rst_finish, 
input zone_addr_mismatch, 
input inst_dec_exception, 
input inst_work_state, 
input npu_work_state, 

output o_interrupt
);
//-
localparam NUM_REGS=18;
wire [NUM_REGS-1:0] dma_regs_wr_en;
wire [NUM_REGS*32-1:0] dma_regs_port;
gapb_if_cfg #(NUM_REGS, 5) U_apb_if (
  // Outputs
  .prdata(prdata), 
  .blk_reg_wr_en(dma_regs_wr_en), 
  // Inputs
  .psel(psel), 
  .penable(penable), 
  .pwrite(pwrite), 
  .paddr(paddr[6:2]), 
  .pclk(pclk), 
  .rst_n(preset_n), 
  .tst_gatedclock(1'b0), 
  .regs_port(dma_regs_port)
);
//- IRR combine
wire [9:0] irr_pre;
assign irr_pre = {
internal_stop, 
ex_zone_bias_wr_finish, 
ex_zone_wib_wr_finish, 
ex_zone_wb_wr_finish, 
inst_exception, 
init_inst_finish, 
zone3_wr_finish, 
zone2_wr_finish, 
zone1_rd_finish, 
zone0_rd_finish
};
//- zone status combine
wire [3:0] zone_status_pre;
assign zone_status_pre = {
zone3_wr_finish, 
zone2_wr_finish, 
zone1_rd_finish, 
zone0_rd_finish
};
//- status combine
wire [7:0] status_pre;
assign status_pre = {
npu_idle, 
init_prot_finish, 
sw_rst_finish, 
init_inst_finish, 
zone_addr_mismatch, 
inst_dec_exception, 
inst_work_state, 
npu_work_state 
};

//- inst ctrl
assign o_dma_finish = dma_done;
//- dma core 
assign dma_src_addr = i_src_start; 
assign dma_dst_addr = i_dst_start; 
assign dma_trans_len = i_d_lines; 
assign ex_dma = i_ex_dma; 
assign b_stream = i_b_stream;
assign line_size = i_line_size;
assign stride = i_stride;
assign pad_num = i_pad_num;

//- init_prot
wire init_prot;
assign init_prot_en = init_prot & mode_m2instb;
wire gxclk;
clock_gater U_xclk_gater(
  .gclk(gxclk), 
  .clk(xclk), 
  .enable(~init_prot_en), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);

//-//- sync zone detect
//-wire mode_m2iob0;
//-wire mode_m2iob1;
//-wire mode_iob02m;
//-wire mode_iob12m;
//-wire sync_zone1_en;
//-wire sync_zone2_en;
//-wire sync_zone3_en;
//-wire sync_zone4_en;
//-assign mode_m2iob0 = ~dma_mode[3] & ~dma_mode[2] & ~dma_mode[1] & dma_mode[0];
//-assign mode_m2iob1 = ~dma_mode[3] & ~dma_mode[2] & dma_mode[1] & ~dma_mode[0];
//-assign mode_iob02m = ~dma_mode[3] & ~dma_mode[2] & dma_mode[1] & dma_mode[0];
//-assign mode_iob12m = ~dma_mode[3] & dma_mode[2] & ~dma_mode[1] & ~dma_mode[0];
//-assign sync_zone1_en = mode_m2iob0 & zone1_rd_en;
//-assign sync_zone2_en = mode_m2iob1 & zone2_rd_en;
//-assign sync_zone3_en = mode_iob02m & zone3_wr_en;
//-assign sync_zone4_en = mode_iob12m & zone4_wr_en;
//-
//-assign dma_trans_len = mode_m2iob0 ? dma_src_addr >= zone1_addr && 



//-------------------------------------------------------------
//- script generated logic below
//-------------------------------------------------------------
//`include "apb_access.v"
// ctrl write signal
wire ctrl_wr;
clock_gater U_ctrl_gater(
  .gclk(ctrl_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[0]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [6-1:0] ctrl;
//-always @(posedge ctrl_wr or negedge preset_n)
//-	if(~preset_n) begin
//-		ctrl <= {6{1'b0}};
//-	end
//-	else begin
//-		ctrl <= pwdata[6-1:0];
//-	end
always @(posedge pclk or negedge preset_n)
	if(~preset_n) begin
		ctrl <= {6{1'b0}};
	end
	else begin
		if(dma_regs_wr_en[0])
			ctrl <= pwdata[6-1:0];
		else
			ctrl[2:0] <= 3'b0;
	end
wire [6-1:0] ctrl_s;
gsync_ar #(6)U_ctrl_sync(//Output
		 .datasync_r(ctrl_s),
		 //Input
		 .datain(ctrl),
		 .clk(gxclk),
		 .areset(xreset_n));

// imr write signal
wire imr_wr;
clock_gater U_imr_gater(
  .gclk(imr_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[1]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [10-1:0] imr;
always @(posedge imr_wr or negedge preset_n)
	if(~preset_n) begin
		imr <= {10{1'b1}};
	end
	else begin
		imr <= pwdata[10-1:0];
	end
//wire [10-1:0] irr;
//gsync_ar #(10)U_irr_sync(//Output
//		 .datasync_r(irr),
//		 //Input
//		 .datain(irr_pre),
//		 .clk(pclk),
//		 .areset(preset_n));
//
wire [10-1:0] isr;
//-// irr write signal
//-wire irr_wr;
//-clock_gater U_irr_gater(
//-  .gclk(irr_wr), 
//-  .clk(pclk), 
//-  .enable(dma_regs_wr_en[2]), 
//-  .wait_r(1'b0), 
//-  .tst_gatedclock(1'b0)
//-);
reg [10-1:0] irr_clr;
always @(posedge pclk or negedge preset_n)
	if(~preset_n) begin
		irr_clr <= {10{1'b0}};
	end
	else begin
		if(dma_regs_wr_en[3])
			irr_clr <= pwdata[10-1:0];
		else
			irr_clr <= {10{1'b0}};
	end

wire [10-1:0] irr_clr_x;
gsync_ar #(10)U_irr_sync(//Output
		 .datasync_r(irr_clr_x),
		 //Input
		 .datain(irr_clr),
		 .clk(xclk),
		 .areset(xreset_n));
reg [10-1:0] irr_r;
reg [10-1:0] irr_o;
integer i;
always @(posedge xclk or negedge xreset_n)
	if(~xreset_n) begin
		irr_r <= {10{1'b0}};
		irr_o <= {10{1'b0}};
	end
	else begin
		irr_r <= irr_pre;
		for(i=0;i<10;i=i+1) begin
			if(irr_pre[i] & ~irr_r[i])
				irr_o[i] <= 1'b1;
			else begin
				if(irr_clr_x[i])
					irr_o[i] <= 1'b0;
			end
		end
	end
// zone1_addr write signal
wire zone1_addr_wr;
clock_gater U_zone1_addr_gater(
  .gclk(zone1_addr_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[4]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] zone1_addr;
always @(posedge zone1_addr_wr or negedge preset_n)
	if(~preset_n) begin
		zone1_addr <= {32{1'b0}};
	end
	else begin
		zone1_addr <= pwdata[32-1:0];
	end
//wire [32-1:0] zone1_addr_s;
gsync_ar #(32)U_zone1_addr_sync(//Output
		 .datasync_r(zone1_addr_s),
		 //Input
		 .datain(zone1_addr),
		 .clk(gxclk),
		 .areset(xreset_n));

// zone1_size write signal
wire zone1_size_wr;
clock_gater U_zone1_size_gater(
  .gclk(zone1_size_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[5]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] zone1_size;
always @(posedge zone1_size_wr or negedge preset_n)
	if(~preset_n) begin
		zone1_size <= {32{1'b0}};
	end
	else begin
		zone1_size <= pwdata[32-1:0];
	end
//wire [32-1:0] zone1_size_s;
gsync_ar #(32)U_zone1_size_sync(//Output
		 .datasync_r(zone1_size_s),
		 //Input
		 .datain(zone1_size),
		 .clk(gxclk),
		 .areset(xreset_n));

// zone2_addr write signal
wire zone2_addr_wr;
clock_gater U_zone2_addr_gater(
  .gclk(zone2_addr_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[6]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] zone2_addr;
always @(posedge zone2_addr_wr or negedge preset_n)
	if(~preset_n) begin
		zone2_addr <= {32{1'b0}};
	end
	else begin
		zone2_addr <= pwdata[32-1:0];
	end
//wire [32-1:0] zone2_addr_s;
gsync_ar #(32)U_zone2_addr_sync(//Output
		 .datasync_r(zone2_addr_s),
		 //Input
		 .datain(zone2_addr),
		 .clk(gxclk),
		 .areset(xreset_n));

// zone2_size write signal
wire zone2_size_wr;
clock_gater U_zone2_size_gater(
  .gclk(zone2_size_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[7]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] zone2_size;
always @(posedge zone2_size_wr or negedge preset_n)
	if(~preset_n) begin
		zone2_size <= {32{1'b0}};
	end
	else begin
		zone2_size <= pwdata[32-1:0];
	end
//wire [32-1:0] zone2_size_s;
gsync_ar #(32)U_zone2_size_sync(//Output
		 .datasync_r(zone2_size_s),
		 //Input
		 .datain(zone2_size),
		 .clk(gxclk),
		 .areset(xreset_n));

// zone3_addr write signal
wire zone3_addr_wr;
clock_gater U_zone3_addr_gater(
  .gclk(zone3_addr_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[8]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] zone3_addr;
always @(posedge zone3_addr_wr or negedge preset_n)
	if(~preset_n) begin
		zone3_addr <= {32{1'b0}};
	end
	else begin
		zone3_addr <= pwdata[32-1:0];
	end
//wire [32-1:0] zone3_addr_s;
gsync_ar #(32)U_zone3_addr_sync(//Output
		 .datasync_r(zone3_addr_s),
		 //Input
		 .datain(zone3_addr),
		 .clk(gxclk),
		 .areset(xreset_n));

// zone3_size write signal
wire zone3_size_wr;
clock_gater U_zone3_size_gater(
  .gclk(zone3_size_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[9]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] zone3_size;
always @(posedge zone3_size_wr or negedge preset_n)
	if(~preset_n) begin
		zone3_size <= {32{1'b0}};
	end
	else begin
		zone3_size <= pwdata[32-1:0];
	end
//wire [32-1:0] zone3_size_s;
gsync_ar #(32)U_zone3_size_sync(//Output
		 .datasync_r(zone3_size_s),
		 //Input
		 .datain(zone3_size),
		 .clk(gxclk),
		 .areset(xreset_n));

// zone4_addr write signal
wire zone4_addr_wr;
clock_gater U_zone4_addr_gater(
  .gclk(zone4_addr_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[10]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] zone4_addr;
always @(posedge zone4_addr_wr or negedge preset_n)
	if(~preset_n) begin
		zone4_addr <= {32{1'b0}};
	end
	else begin
		zone4_addr <= pwdata[32-1:0];
	end
//wire [32-1:0] zone4_addr_s;
gsync_ar #(32)U_zone4_addr_sync(//Output
		 .datasync_r(zone4_addr_s),
		 //Input
		 .datain(zone4_addr),
		 .clk(gxclk),
		 .areset(xreset_n));

// zone4_size write signal
wire zone4_size_wr;
clock_gater U_zone4_size_gater(
  .gclk(zone4_size_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[11]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] zone4_size;
always @(posedge zone4_size_wr or negedge preset_n)
	if(~preset_n) begin
		zone4_size <= {32{1'b0}};
	end
	else begin
		zone4_size <= pwdata[32-1:0];
	end
//wire [32-1:0] zone4_size_s;
gsync_ar #(32)U_zone4_size_sync(//Output
		 .datasync_r(zone4_size_s),
		 //Input
		 .datain(zone4_size),
		 .clk(gxclk),
		 .areset(xreset_n));

// zone_en write signal
wire zone_en_wr;
clock_gater U_zone_en_gater(
  .gclk(zone_en_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[12]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [4-1:0] zone_en;
always @(posedge zone_en_wr or negedge preset_n)
	if(~preset_n) begin
		zone_en <= {4{1'b0}};
	end
	else begin
		zone_en <= pwdata[4-1:0];
	end
//wire [4-1:0] zone_en_s;
gsync_ar #(4)U_zone_en_sync(//Output
		 .datasync_r(zone_en_s),
		 //Input
		 .datain(zone_en),
		 .clk(gxclk),
		 .areset(xreset_n));

// src_addr write signal
wire src_addr_wr;
clock_gater U_src_addr_gater(
  .gclk(src_addr_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[13]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] src_addr;
always @(posedge src_addr_wr or negedge preset_n)
	if(~preset_n) begin
		src_addr <= {32{1'b0}};
	end
	else begin
		src_addr <= pwdata[32-1:0];
	end
//wire [32-1:0] src_addr_s;
gsync_ar #(32)U_src_addr_sync(//Output
		 .datasync_r(src_addr_s),
		 //Input
		 .datain(src_addr),
		 .clk(gxclk),
		 .areset(xreset_n));

// inst_depth write signal
wire inst_depth_wr;
clock_gater U_inst_depth_gater(
  .gclk(inst_depth_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[14]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);
reg [32-1:0] inst_depth;
always @(posedge inst_depth_wr or negedge preset_n)
	if(~preset_n) begin
		inst_depth <= {32{1'b0}};
	end
	else begin
		inst_depth <= pwdata[32-1:0];
	end

// axi_ctrl write signal
wire axi_ctrl_wr;
clock_gater U_axi_ctrl_gater(
  .gclk(axi_ctrl_wr), 
  .clk(pclk), 
  .enable(dma_regs_wr_en[17]), 
  .wait_r(1'b0), 
  .tst_gatedclock(1'b0)
);

reg [32-1:0] axi_ctrl;
always @(posedge axi_ctrl_wr or negedge preset_n)
	if(~preset_n) begin
		axi_ctrl <= 32'h048c_0123;
	end
	else begin
		axi_ctrl <= pwdata[32-1:0];
	end

assign awid_cfg = axi_ctrl[31:28];
assign awburst_cfg = axi_ctrl[27:26];
assign awlock_cfg = axi_ctrl[25];
assign awprot_cfg = axi_ctrl[24:22];
assign awcache_cfg = axi_ctrl[21:18];
assign wid_cfg = axi_ctrl[17:14];
assign arid_cfg = axi_ctrl[13:10];
assign arburst_cfg = axi_ctrl[9:8];
assign arlock_cfg = axi_ctrl[7];
assign arprot_cfg = axi_ctrl[6:4];
assign arcache_cfg = axi_ctrl[3:0];




//wire [32-1:0] inst_depth_s;
gsync_ar #(32)U_inst_depth_sync(//Output
		 .datasync_r(inst_depth_s),
		 //Input
		 .datain(inst_depth),
		 .clk(gxclk),
		 .areset(xreset_n));

wire [4-1:0] zone_status;
gsync_ar #(4)U_zone_status_sync(//Output
		 .datasync_r(zone_status),
		 //Input
		 .datain(zone_status_pre),
		 .clk(pclk),
		 .areset(preset_n));
wire [8-1:0] status;
gsync_ar #(8)U_status_sync(//Output
		 .datasync_r(status),
		 //Input
		 .datain(status_pre),
		 .clk(pclk),
		 .areset(preset_n));
//- dma regs mux out 
assign dma_regs_port = {
{{(32-32){1'b0}}, axi_ctrl}, 
{{(32-8){1'b0}}, status}, 
{{(32-4){1'b0}}, zone_status}, 
{{(32-32){1'b0}}, inst_depth}, 
{{(32-32){1'b0}}, src_addr}, 
{{(32-4){1'b0}}, zone_en}, 
{{(32-32){1'b0}}, zone4_size}, 
{{(32-32){1'b0}}, zone4_addr}, 
{{(32-32){1'b0}}, zone3_size}, 
{{(32-32){1'b0}}, zone3_addr}, 
{{(32-32){1'b0}}, zone2_size}, 
{{(32-32){1'b0}}, zone2_addr}, 
{{(32-32){1'b0}}, zone1_size}, 
{{(32-32){1'b0}}, zone1_addr}, 
{{(32-10){1'b0}}, isr}, 
{{(32-10){1'b0}}, irr_o}, 
{{(32-10){1'b0}}, imr}, 
{{(32-6){1'b0}}, ctrl}};
//- interrupt or out
assign isr = ~imr & irr_o; 
assign o_interrupt = |isr;


//- Converter
wire init_inst;
assign dma_mode = dma_done ? 4'h0 : i_dma_mode;
assign mode_m2instb = init_inst;
assign axi_wr_buf_en = ctrl_s[5];
assign init_prot = ctrl_s[4];
//assign init_inst = ctrl_s[2];
//assign npu_stop = ctrl_s[1];
//assign npu_start = ctrl_s[0];
reg ctrl_s2_r;
reg ctrl_s1_r;
reg ctrl_s0_r;
assign init_inst = ctrl_s[2] & ~ctrl_s2_r;
assign npu_stop = ctrl_s[1] & ~ctrl_s1_r;
assign npu_start = ctrl_s[0] & ~ctrl_s0_r;
always @(posedge gxclk or negedge xreset_n)
	if(~xreset_n) begin
		ctrl_s2_r <= 1'b0;
		ctrl_s1_r <= 1'b0;
		ctrl_s0_r <= 1'b0;
	end
	else begin
		ctrl_s2_r <= ctrl_s[2];
		ctrl_s1_r <= ctrl_s[1];
		ctrl_s0_r <= ctrl_s[0];
	end

//- soft reset
wire sw_rst;
assign sw_rst = dma_regs_wr_en[0] & pwdata[3];
assign sys_reset_n = xreset_n & ~sw_rst;

endmodule
