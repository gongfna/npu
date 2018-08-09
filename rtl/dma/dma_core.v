/*
Project:
Team:
Module Name: xDMA_core
$RCSfile$
$Author$
$Date$
$Name$
$Revision$
$State$
Hierarchy: 
    ----> xDMA_core(xDMA_core.v)
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
`define DBG_DISP2(msg, sig) \
`ifdef DEBUG \
#1 $display("%t ns %m ``msg", $time, ``sig); \
`endif 

`define CASER(ptr) ``ptr: mdata_ddr = afifo[(``ptr+1)*128-1:``ptr*128]; 
`define CASEW(wptr_r) \
``wptr_r:begin \
afifo[(``wptr_r+1)*128-1:``wptr_r*128] <= sdata_sram[127:0]; \
afifo[(``wptr_r+2)*128-1:(``wptr_r+1)*128] <= sdata_sram[255:128]; \
end

`define CASEW_M2(wptr_m2) \
``wptr_m2:begin \
fifo_m2[(``wptr_m2+1)*128-1:``wptr_m2*128] <= sdata_ddr_in[127:0]; \
end

module dma_core 
#(
parameter DW=128,
parameter DW_IOB=256 
)
(
//- xdma converter
output [31:0] maddr_sram_start, 
output [31:0] maddr_sram, 
output mread_sram, 
output reg mwrite_sram, 
output mlen_sram, 
output msize_sram, 
output reg [DW-1:0] mdata_sram, 
output [DW/8-1:0] mwstrb_sram, 
input saccept_sram, 
input svalid_sram, 
input slast_sram, 
input [DW_IOB-1:0] sdata_sram, 
output mready_sram, 
//- xdma cfg
output reg dma_finish, 
input [31:0] dma_src_addr, 
input [31:0] dma_dst_addr, 
input [31:0] dma_trans_len, 
input b_stream, 
input ex_dma, 
input [7:0] line_size, 
input [1:0] stride,
input [1:0] pad_num, 
input [31:0] zone1_addr_s,
input [31:0] zone1_size_s,
input [31:0] zone2_addr_s,
input [31:0] zone2_size_s,
input [31:0] zone3_addr_s,
input [31:0] zone3_size_s,
input [31:0] zone4_addr_s,
input [31:0] zone4_size_s,
input [3:0] zone_en_s,
input [31:0] src_addr_s,
input [31:0] inst_depth_s,
input mode_m2instb,
output reg mode_m2instb_r,
input [3:0] dma_mode, 
//- IRR
output ex_zone_bias_wr_finish, 
output ex_zone_wib_wr_finish, 
output ex_zone_wb_wr_finish, 
output init_inst_finish, 
output zone3_wr_finish, 
output zone2_wr_finish, 
output zone1_rd_finish, 
output zone0_rd_finish, 
//- STATUS
output init_prot_finish, 
output zone_addr_mismatch, 
output reg inst_dec_exception, 
input inst_work_state, 
input npu_work_state, 
// SLAVE PORT I/O
input                       aclk_m,
input                       aresetn_m,

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
input                       awready_s1,

// Write Data Channel 1
output                      wvalid_s1,
output [4-1:0]    wid_s1,
output [128-1:0]     wdata_s1,
output [16-1:0]     wstrb_s1,
output                      wlast_s1,
input                       wready_s1,

// Write Response Channel 1
input                       bvalid_s1,
input  [4-1:0]    bid_s1,
input  [2-1:0]       bresp_s1,
output                      bready_s1,
// Read Address Channel
output                      arvalid_s,
output [4-1:0]    arid_s,
output [32-1:0]     araddr_s,
output [4-1:0]    arlen_s,
output [3-1:0]       arsize_s,
output [2-1:0]       arburst_s,
output [2-1:0]       arlock_s,
output [4-1:0]       arcache_s,
output [3-1:0]       arprot_s,
input                       arready_s,

// Read Data Channel
input                       rvalid_s,
input  [4-1:0]    rid_s,
input  [128-1:0]     rdata_s,
input                       rlast_s,
input  [2-1:0]       rresp_s,
output                      rready_s,
// System IF
input xclk,
input xrst_n 
);

wire [31:0] len_max_shl4;
wire [31:0] len_max_shl1;
wire [31:0] len_max_shl5;
wire [31:0] maddr_ddr_diff_cur;
wire [31:0] maddr_ddr_diff_cur_w;
wire [31:0] maddr_ddr_diff_cur_all;
wire [31:0] maddr_ddr_diff_cur_w_all;
wire [8:0] burst_len;
wire [8:0] wburst_len;
wire [4:0] rddr_len_inc;
wire [4:0] wddr_len_inc;
wire [3:0] arnum_pre;
wire [3:0] awnum_pre;
reg [3:0] arnum;
reg [3:0] awnum;
wire [31:0] arnum_rest;
wire [31:0] awnum_rest;
reg [3:0] aw_wptr;
reg [3:0] aw_rptr;
reg [3:0] aw_rptr_r;
reg [4:0]wlast_cnt;
wire awfifo_empty;
wire awfifo_full;

reg dma_done_ddr_rreq_m1_r;
reg dma_done_ddr_rreq_m1_mask;
wire dma_done_mask;
reg dma_done; 
wire [2:0] rddr_size;
wire [3:0] rddr_len;
wire ddr_respb;
wire ddr_r_reqb;
wire ddr_aw_reqb;
wire ddr_w_reqb;
wire ddr_wb;

reg ex_dma_lvl_r;
reg ex_dma_r;
reg ex_dma_r2;
wire fifo_m2_full;
wire fifo_m2_empty;
wire fifo_m2_almost_empty;
//reg mwrite_sram;
//reg [127:0] fifo_m2[0:1];
reg [128*16-1:0] fifo_m2;
reg [31:0] sram_wr_resp_cnt;
reg [31:0] sram_wr_req_cnt;

wire sram_respb;
wire sram_r_reqb;
wire sram_w_reqb;
wire dma_en;
wire dma_en_2m;
wire dma_en_m2;
wire dma_en_m2m;
//wire mwrite_ddr;
reg mwrite_ddr;
reg mread_ddr;
//wire mwrite_ddr_data;
reg mwrite_ddr_data;
wire dma_done_ddr;
wire dma_done_ddr_wreq;
wire dma_done_ddr_wreq_m1;
wire dma_done_ddr_awreq;
wire dma_done_ddr_awreq_m1;
wire dma_done_ddr_rreq;
wire dma_done_ddr_rreq_m1;
//wire dma_done_sram;
reg dma_done_sram;
wire afifo_full;
wire afifo_empty;
parameter AFIFO_DEP=16;
localparam W_PTR=$clog2(AFIFO_DEP);
wire [3:0] bubble_num_m2;
wire [3:0] bubble_num;
wire [3:0] bubble_num2;
reg  [7:0] awptr;
reg  [7:0] awptr_r;
reg  [7:0] arptr;
wire [3:0] wptr;
wire [3:0] wptr_r;
reg  [7:0] rptr_m2;
reg  [7:0] wptr_m2;
wire [3:0] rptr;
//reg [127:0] afifo[0:15];
reg [128*AFIFO_DEP-1:0] afifo;
reg [3:0] awfifo[0:15];
//reg [4*16-1:0] awfifo;
wire mode_m2iob0;
wire mode_m2iob1;
wire mode_iob02m;
wire mode_iob12m;
wire mode_m2wb416;
wire mode_m2wb256;
wire mode_m2wib;
wire mode_m2biasb;
wire mode_m2lstmb;
wire mode_m2_down;

wire arready_in;
assign arready_in = arready_s;

//
//assign dma_finish = dma_done_ddr & dma_done_sram & ~dma_done;
assign wstrb_s1 = 16'hffff;
//
assign mode_m2iob0 = ~dma_mode[3] & ~dma_mode[2] & ~dma_mode[1] & dma_mode[0];
assign mode_m2iob1 = ~dma_mode[3] & ~dma_mode[2] & dma_mode[1] & ~dma_mode[0];
assign mode_iob02m = ~dma_mode[3] & ~dma_mode[2] & dma_mode[1] & dma_mode[0];
assign mode_iob12m = ~dma_mode[3] & dma_mode[2] & ~dma_mode[1] & ~dma_mode[0];
assign mode_m2wb416 = ~dma_mode[3] & dma_mode[2] & ~dma_mode[1] & dma_mode[0];
assign mode_m2wb256 = ~dma_mode[3] & dma_mode[2] & dma_mode[1] & ~dma_mode[0];
assign mode_m2wib = ~dma_mode[3] & dma_mode[2] & dma_mode[1] & dma_mode[0];
assign mode_m2biasb = dma_mode[3] & ~dma_mode[2] & ~dma_mode[1] & ~dma_mode[0];
assign mode_m2lstmb = dma_mode[3] & ~dma_mode[2] & ~dma_mode[1] & dma_mode[0];
//assign mode_m2_down = mode_m2wb416 | mode_m2wb256 | mode_m2wib | mode_m2lstmb;
assign mode_m2_down = mode_m2wib | mode_m2lstmb;
//- AGU

wire mode_m2;
wire mode_2m;
//wire [31:0] maddr_sram_start;
wire [31:0] maddr_ddr_start;
//reg mode_m2instb_r;
always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
		mode_m2instb_r <= 1'b0;
	end
	else begin
		if(dma_done)
			mode_m2instb_r <= 1'b0;
		else if(mode_m2instb)
			mode_m2instb_r <= 1'b1;
	end

assign mode_m2 = mode_m2instb_r | mode_m2iob0 | mode_m2iob1 | mode_m2wb416 | mode_m2wb256 | mode_m2wib | mode_m2biasb | mode_m2lstmb;
assign mode_2m = mode_iob02m | mode_iob12m;
assign maddr_sram_start = mode_m2instb_r ? 32'h0 : 
							mode_m2 ?  dma_dst_addr : dma_src_addr;
assign maddr_ddr_start = mode_m2instb_r ? src_addr_s :
							mode_m2 ? dma_src_addr : dma_dst_addr;

wire [31:0] len_max;
wire [31:0] wb_len_max;
//assign wb_len_max = dma_trans_len*3+1;
// TODO
assign wb_len_max = ((dma_trans_len>>2)+{31'h0,|dma_trans_len[1:0]})*13;
//assign len_max = mode_m2iob0|mode_m2iob1|mode_iob02m|mode_iob12m ? dma_trans_len<<1 : 
assign len_max = mode_m2iob0|mode_m2iob1 ? dma_trans_len<<1 :
				 mode_iob02m|mode_iob12m ? dma_trans_len : 
                 mode_m2wb416 ? wb_len_max : 
                 mode_m2wb256 ? dma_trans_len<<1: 
                 mode_m2wib ? dma_trans_len>>2 : 
                 mode_m2lstmb ? dma_trans_len>>2 : 
                 mode_m2biasb ? dma_trans_len<<2 : 
                 mode_m2instb_r ? inst_depth_s : 'h0;
//
//- zone_detect
wire [32*4-1:0] zone_addr_bus;
wire [32*4-1:0] zone_size_bus;
wire [32-1:0] zone_addr;
wire [32-1:0] zone_size;
wire zone_en;
wire zone_match;
wire zone_trans;
wire [3:0] zone_sel;
wire zone_sel0;
wire zone_sel1;
wire zone_sel2;
wire zone_sel3;
//assign zone_sel0 = mode_m2;
//assign zone_sel1 = mode_m2;
//assign zone_sel2 = mode_2m;
//assign zone_sel3 = mode_2m;
//assign zone_sel = {
//zone_sel3, 
//zone_sel2, 
//zone_sel1, 
//zone_sel0 
//};
//assign zone_addr_bus = {
//zone4_addr_s,
//zone3_addr_s,
//zone2_addr_s,
//zone1_addr_s
//};
//gmux_one_hot_cfg #(32, 4) U_zone_addr_mux(
//  //Outputs
//  .dataout(zone_addr), 
//  //Inputs
//  .datain(zone_addr_bus), 
//  .sel(zone_sel)
//);
//assign zone_size_bus = {
//zone4_size_s,
//zone3_size_s,
//zone2_size_s,
//zone1_size_s
//};
//gmux_one_hot_cfg #(32, 4) U_zone_size_mux(
//  //Outputs
//  .dataout(zone_size), 
//  //Inputs
//  .datain(zone_size_bus), 
//  .sel(zone_sel)
//);
//gmux_one_hot_cfg #(1, 4) U_zone_en_mux(
//  //Outputs
//  .dataout(zone_en), 
//  //Inputs
//  .datain(zone_en_s), 
//  .sel(zone_sel)
//);
wire zone1_addr_match;
wire zone2_addr_match;
wire zone3_addr_match;
wire zone4_addr_match;
assign zone1_addr_match = (maddr_ddr_start >= zone1_addr_s) & 
						 (maddr_ddr_start+len_max<=(zone1_addr_s+zone1_size_s));
assign zone2_addr_match = (maddr_ddr_start >= zone2_addr_s) & 
						 (maddr_ddr_start+len_max<=(zone2_addr_s+zone2_size_s));
assign zone3_addr_match = (maddr_ddr_start >= zone3_addr_s) & 
						 (maddr_ddr_start+len_max<=(zone3_addr_s+zone3_size_s));
assign zone4_addr_match = (maddr_ddr_start >= zone4_addr_s) & 
						 (maddr_ddr_start+len_max<=(zone4_addr_s+zone4_size_s));
assign zone_match = (zone1_addr_match & zone_en_s[0] & mode_m2) & ~mode_m2instb_r | 
                    (zone2_addr_match & zone_en_s[1] & mode_m2) & ~mode_m2instb_r | 
                    (zone3_addr_match & zone_en_s[2] & mode_2m) | 
                    (zone4_addr_match & zone_en_s[3] & mode_2m);  

assign zone_trans = (~b_stream | zone_match);

wire svalid_ddr;
wire [DW-1:0] sdata_ddr;
wire slast_ddr;
wire saccept_ddr;
//assign mready_sram = svalid_ddr & slast_ddr;
//assign mready_sram = svalid_ddr;
//assign mready_sram = saccept_ddr;
wire ex_dma_mix;
reg ex_dma_lvl;
assign ex_dma_mix = ex_dma_lvl | mode_m2instb_r;

always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
		ex_dma_lvl <= 1'b0;
	end
	else begin
		if(ex_dma)
			ex_dma_lvl <= 1'b1;
		else if(dma_done)
			ex_dma_lvl <= 1'b0;
	end
wire mready_ddr;
assign mready_sram = (((ex_dma_lvl|mode_m2instb_r) & mode_m2) | (ex_dma_lvl & mode_2m)) & 
                    zone_trans & 
                    saccept_ddr & 
                    ~dma_done;
assign mwstrb_sram = 32'hffff_ffff;
////- sort
reg [31:0] maddr_sram_pre;
reg [31:0] maddr_cnt;
reg [31:0] line_size_cnt;
//reg [31:0] maddr_arr;
//integer j;
//always @(*) 
//	begin
//		maddr_arr <= j;
//  		for(j=maddr_sram_pre;j<=maddr_sram_pre+line_size;j=j+1)
//  			if(j[1:0]==maddr_cnt)  maddr_arr <= j;
//  		for(j=maddr_sram_pre;j<=maddr_sram_pre+line_size;j=j+2)
//  			if(j[1:0]==maddr_cnt)  maddr_arr <= j;
//  		for(j=maddr_sram_pre;j<=maddr_sram_pre+line_size;j=j+3)
//  			if(j[1:0]==maddr_cnt)  maddr_arr <= j;
//		//$display("%m%t 1:%h , 2:%h ", $time, maddr_sram_pre, maddr_arr);
//	end
assign maddr_sram = ((mode_m2iob0|mode_m2iob1) ?  {1'b0, maddr_sram_pre[31:1]} : 
						mode_m2biasb ? {2'b0, maddr_sram_pre[31:2]} : maddr_sram_pre)
						+ maddr_sram_start;
always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
        maddr_sram_pre <= 'h0;
        maddr_cnt <= 'h0;
        line_size_cnt <= 'h0;
        inst_dec_exception <= 1'b0;
        sram_wr_resp_cnt <= 'h0;
        sram_wr_req_cnt <= 'h0;
    end
    else begin
        if(ex_dma_lvl) inst_dec_exception <= ~mode_2m & ~mode_m2;
        if(ex_dma_r & ~ex_dma_r2 & zone_trans) begin
            maddr_sram_pre <= 32'h0;
			maddr_cnt <= 32'h0;
			line_size_cnt <= 'h0;
        end
        //else if(svalid_ddr & slast_ddr & dma_en_m2 & ~dma_done_sram) begin
        else if(~fifo_m2_empty & mwrite_sram & dma_en_m2 & ~dma_done_sram) begin
            maddr_sram_pre <= maddr_sram_pre + 'h1;
			//`DBG_DISP2(MADDR_SRAM = %h, maddr_sram_pre)
		end
        else if(saccept_sram & dma_en_2m & ~afifo_full & ~dma_done_sram) begin
            maddr_sram_pre <= maddr_sram_pre + {30'h0, stride+2'b1};
			if(line_size_cnt >= (line_size-2)) begin
				line_size_cnt <= 'h0;
				maddr_cnt <= maddr_cnt + 'h1;
				if(maddr_cnt == stride) begin
					maddr_sram_pre <= maddr_sram_pre + 1;
					maddr_cnt <= 'h0;
				end
				else begin
					maddr_sram_pre <= maddr_sram_pre + 3 -line_size;
				end
			end
			else begin
				line_size_cnt <= line_size_cnt + (stride+1);
			end
        end

        if(ex_dma_r & ~ex_dma_r2 & zone_trans) begin
            sram_wr_resp_cnt <= maddr_sram_start;
            sram_wr_req_cnt <= maddr_sram_start;
        end
        else begin
            if(sram_respb) 
                sram_wr_resp_cnt <= sram_wr_resp_cnt + 'h1;
            if(sram_w_reqb) 
                sram_wr_req_cnt <= sram_wr_req_cnt + 'h1;
        end
    end

//assign mwrite_sram = mode_m2 & svalid_ddr & slast_ddr;

//assign mdata_sram = fifo_m2[rptr_m2[3:0]];
always @(*) begin
	case(rptr_m2[3:0])
	 0:mdata_sram = fifo_m2[1*128-1:0*128];
	 1:mdata_sram = fifo_m2[2*128-1:1*128];
	 2:mdata_sram = fifo_m2[3*128-1:2*128];
	 3:mdata_sram = fifo_m2[4*128-1:3*128];
	 4:mdata_sram = fifo_m2[5*128-1:4*128];
	 5:mdata_sram = fifo_m2[6*128-1:5*128];
	 6:mdata_sram = fifo_m2[7*128-1:6*128];
	 7:mdata_sram = fifo_m2[8*128-1:7*128];
	 8:mdata_sram = fifo_m2[9*128-1:8*128];
	 9:mdata_sram = fifo_m2[10*128-1:9*128];
	10:mdata_sram = fifo_m2[11*128-1:10*128];
	11:mdata_sram = fifo_m2[12*128-1:11*128];
	12:mdata_sram = fifo_m2[13*128-1:12*128];
	13:mdata_sram = fifo_m2[14*128-1:13*128];
	14:mdata_sram = fifo_m2[15*128-1:14*128];
	15:mdata_sram = fifo_m2[16*128-1:15*128];
	default:;
	endcase
end

wire fifo_m2_almost_full;
assign bubble_num_m2 = wptr_m2-rptr_m2;
assign fifo_m2_full = bubble_num_m2 >=2;
assign fifo_m2_empty = bubble_num_m2==0;
assign fifo_m2_almost_empty = bubble_num_m2==1;
assign fifo_m2_almost_full= bubble_num_m2==4'd14;
reg [3:0] mread_ddr_cnt;
//- assign mread_ddr = dma_en_m2 & (dma_done_ddr_rreq & saccept_ddr ? 1'b0 : 
//- //<<<<<<< HEAD
//- 							//	~fifo_m2_full & ~|mread_ddr_cnt);
//- //								~|mread_ddr_cnt);
//- //=======
//- 								~fifo_m2_full & ~|mread_ddr_cnt & ex_dma_r);
//- //>>>>>>> 3bc2582ffa8ee76a0bcb308aeed02ccaf4504b15

always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
		mread_ddr_cnt <= 4'h0;
	end
	else begin
		//if(arready_in)
		//	mread_ddr_cnt <= mread_ddr_cnt;
		//else if((mread_ddr_cnt==rddr_len) | dma_done | (~|stride))
		//	mread_ddr_cnt <= 4'h0;
		//else if(~fifo_m2_full & ex_dma_r) begin
		//	mread_ddr_cnt <= mread_ddr_cnt + 1;
		//end
		if(dma_done | (~|stride))
			mread_ddr_cnt <= 4'h0;
		else if(rvalid_s & ~fifo_m2_full & ex_dma_r) begin
			mread_ddr_cnt <= mread_ddr_cnt + 1;
		end
		else if(mread_ddr_cnt==rddr_len)
			mread_ddr_cnt <= 4'h0;
	end

//- assign arready_pos = arready_in & ~arready_in_r;


always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
		mread_ddr <= 1'b0;
	end
	else begin
		if(dma_done_ddr_rreq | ((len_max==1) ? dma_done_ddr_rreq_m1_mask:dma_done_ddr_rreq_m1)) begin
			mread_ddr <= 1'b0;
		end
		else begin
			if(mread_ddr & ~arready_in) begin
				//if((len_max==1) & mode_m2wib & mread_ddr) begin
				//	mread_ddr <= 1'b0;
				//end
				//else begin
					mread_ddr <= mread_ddr;
				//end
			end
			else begin
				//if((len_max==1) & mode_m2wib & mread_ddr) begin
				//	mread_ddr <= 1'b0;
				//end
				//else begin
					mread_ddr <= dma_en_m2 & ~|mread_ddr_cnt;
				//end
			end
		end
	end

wire fifo_m2_push_en;
wire [127:0] sdata_ddr_in;
reg [127:0] sdata_ddr_shift;
wire [127:0] sdata_ddr_merge;
reg [15:0] data_bit;
reg rlast_s_r;
wire [127:0] sdata_mask;
wire [127:0] sdata_ddr_mask;
wire remap;
assign remap = (|stride) & (mode_m2iob0 | mode_m2iob1);
assign fifo_m2_push_en = ((~remap) |
						  (remap & data_bit[15])) & rvalid_s & ~fifo_m2_full & dma_en_m2;


assign sdata_ddr_in = {128{|stride}} & sdata_ddr_merge | 
					  {128{~|stride}} & sdata_ddr;

always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
        wptr_m2 <= 'b0;
		fifo_m2 <= 'h0;
    end
    else begin
        // ddr read
        if(dma_done) begin
            wptr_m2 <= 'b0;
        end
        else begin
            //if(svalid_ddr & dma_en_m2) begin
            if(fifo_m2_push_en) begin
                if(~fifo_m2_full) begin
                    wptr_m2 <= wptr_m2 + 'b1;
                    //fifo_m2[wptr_m2[3:0]] <= sdata_ddr[127:0];
                    //fifo_m2[wptr_m2[3:0]] <= sdata_ddr_in[127:0];
					//if(wptr_m2==0) begin
                    //	fifo_m2[255:128] <= sdata_ddr_in[127:0];
					//end
					//else if(wptr_m2==1) begin
                    //	fifo_m2[255:128] <= sdata_ddr_in[127:0];
					//end
					//else begin
                    //	fifo_m2[127:0] <= sdata_ddr_in[127:0];
					//end
					case(wptr_m2[3:0]) 
						`CASEW_M2(0)	
						`CASEW_M2(1)	
						`CASEW_M2(2)	
						`CASEW_M2(3)	
						`CASEW_M2(4)	
						`CASEW_M2(5)	
						`CASEW_M2(6)	
						`CASEW_M2(7)	
						`CASEW_M2(8)	
						`CASEW_M2(9)	
						`CASEW_M2(10)	
						`CASEW_M2(11)	
						`CASEW_M2(12)	
						`CASEW_M2(13)	
						`CASEW_M2(14)	
						`CASEW_M2(15)	
						default:;
					endcase
				//`DBG_DISP(SDATA_IN = %h, sdata_ddr_in)
				//`DBG_DISP(wptr_m2 = %h, wptr_m2)
                end
                else begin
                    //if(fifo_m2_empty) 
                    //    wptr_m2 <= 'b0;
                end
            end
        end
    end

reg saccept_sram_r;
reg rvalid_s_r;
reg data_bit0_r;
//assign mwrite_sram = dma_en_m2 & ((~mode_m2_down | ~saccept_sram_r) & ~fifo_m2_empty) & ~dma_done_sram;
always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
        rptr_m2 <= 'b0;
        mwrite_sram <= 1'b0;
	    saccept_sram_r <= 1'b0;
		rvalid_s_r <= 1'b0;
    end
    else begin
        // sram write
		rvalid_s_r <= rvalid_s & ~fifo_m2_full;
		saccept_sram_r <= saccept_sram;
		if(mode_m2_down) begin
			if(dma_en_m2) begin
				if(saccept_sram)
					mwrite_sram <= 1'b0;
				else begin
					if(~fifo_m2_empty) begin
						mwrite_sram <= 1'b1;
					end
				end
				//-- if(~saccept_sram)
				//-- 	mwrite_sram <= 1'b0;
				//-- else begin
				//-- 	mwrite_sram <= ~fifo_m2_empty;
				//-- end
			end
		end
		else begin
			
			//mwrite_sram <= dma_en_m2 & ~fifo_m2_empty & ~dma_done_sram & svalid_ddr;
			 mwrite_sram <= dma_en_m2 & ~fifo_m2_empty & ~dma_done_sram & 
			//			   (|stride ? (rvalid_s & rready_s & data_bit[15]) : svalid_ddr);
		//				   (|stride ? (data_bit[0] & rvalid_s & rready_s) : svalid_ddr);
			//			   (|stride ? data_bit[15] : svalid_ddr);
			//			   (|stride ? data_bit[15] : rvalid_s_r);
			//			   (|stride ? data_bit[15] : ~fifo_m2_empty);
			//			   (|stride ? data_bit[15] : ~fifo_m2_empty&rvalid_s_r);
						   //(|stride ? data_bit[15] : rvalid_s_r);
						   (|stride ? (data_bit[0]&~data_bit0_r) : rvalid_s_r);
			//			   (|stride ? 1'b1 : svalid_ddr);
		end
        if(dma_done_sram) begin
            rptr_m2 <= 'b0;
            //mwrite_sram <= 1'b0;
        end
        else begin
            if(saccept_sram & dma_en_m2 & ~fifo_m2_empty) begin
                //mwrite_sram <= 1'b1;
                if(mwrite_sram) begin
                    rptr_m2 <= rptr_m2 + 'h1;
					//- `DBG_DISP2(MDATA_SR = %h, mdata_sram)
					//- `DBG_DISP2(ddr_wr_cnt = %h, ddr_wr_resp_cnt)
					//- `DBG_DISP2(maddr_ddr_start = %h, maddr_ddr_start)
					//- `DBG_DISP2(len_max = %h, len_max)
					//- `DBG_DISP2(RPTR_M2= %h, rptr_m2)
					//- `DBG_DISP2(dma_done ddr= %h, dma_done_ddr)
					//- `DBG_DISP2(dma_done srm= %h, dma_done_sram)
				end
            end
        end
    end
//assign mread_sram = ex_dma & zone_trans & mode_2m & saccept_ddr & ~afifo_full;
//always @(posedge xclk or negedge xrst_n) 
//    if(~xrst_n) begin
//        mread_sram <= 1'b0;
//    end
//    else begin
//        //if(ex_dma & zone_trans) begin
//        //    mread_sram <= mode_2m;
//        //end
//        //else begin
//        //    mread_sram <= 1'b0;
//        //end
//        if(~saccept_ddr) 
//            mread_sram <= 1'b0;
//        else if(ex_dma & zone_trans)
//            mread_sram <= mode_2m;
//    end

reg [31:0] maddr_ddr;

wire [7:0] mlen_ddr;
wire [2:0] msize_ddr;
wire [1:0] mburst_ddr;
//wire [DW-1:0] mdata_ddr;
reg [DW-1:0] mdata_ddr;
wire [31:0] mwstrb_ddr;
wire [3:0] mid_ddr;
//assign mlen_ddr = 8'h0;
assign mlen_ddr = awnum;
assign msize_ddr = 3'b100; //2**size*8=DW
assign mburst_ddr = 2'b01;
//assign mdata_ddr = sdata_sram;
//assign mdata_ddr = afifo[rptr];
//assign mdata_ddr = afifo[(rptr+1)*128-1:rptr*128];



integer i;
//generate
always @(*) begin
	case(rptr[3:0])
		//for(i=0;i<16;i=i+1) begin
		//i: mdata_ddr = afifo[(i+1)*128-1:i*128];
		//end
		`CASER(0)
		`CASER(1)
		`CASER(2)
		`CASER(3)
		`CASER(4)
		`CASER(5)
		`CASER(6)
		`CASER(7)
		`CASER(8)
		`CASER(9)
		`CASER(10)
		`CASER(11)
		`CASER(12)
		`CASER(13)
		`CASER(14)
		`CASER(15)
		default:;
	endcase
end
//endgenerate
assign mwstrb_ddr = 32'hffff_ffff;
//assign mready_ddr = svalid_sram & slast_sram;
//assign mready_ddr = svalid_sram;
//assign mready_ddr = (((ex_dma|mode_m2instb_r) & mode_m2) | (ex_dma & mode_2m)) & 
//                    zone_trans & 
//                    saccept_sram & 
//                    ~dma_done;
assign mready_ddr = dma_en_m2m &
                    (~mode_2m | ~afifo_empty) &
                    ~dma_done;


assign mid_ddr = 4'b0;
reg [31:0] ddr_wr_resp_cnt;
reg [31:0] ddr_wr_req_cnt;
reg [31:0] ddr_aw_req_cnt;

//-- AR AW LENGTH CALC

wire [3:0] boundary_4k_ar;
wire [3:0] boundary_4k_aw;
wire [31:0] maddr_ddr_diff_nxt;
wire [31:0] maddr_ddr_diff_nxt_w;
wire [3:0] maddr_ddr_diff_nxt_4k;
wire [3:0] maddr_ddr_diff_nxt_4k_w;
wire [3:0] boundary_4k_arnum;
wire [3:0] boundary_4k_awnum;
wire maddr_ddr_diff_over_range_r;
wire maddr_ddr_diff_over_range_w;
assign maddr_ddr_diff_over_range_r = (maddr_ddr_diff_cur > len_max_shl4)|
                                     (maddr_ddr_diff_nxt > len_max_shl4);
assign maddr_ddr_diff_over_range_w = (maddr_ddr_diff_cur_w > len_max_shl5)|
                                     (maddr_ddr_diff_nxt_w > len_max_shl5);

assign maddr_ddr_diff_nxt = maddr_ddr_diff_cur + 32'h100;
assign maddr_ddr_diff_nxt_w = maddr_ddr_diff_cur_w + 32'h100;
assign maddr_ddr_diff_nxt_4k = maddr_ddr_diff_cur_all[11:8];
assign maddr_ddr_diff_nxt_4k_w = maddr_ddr_diff_cur_w_all[11:8];
//assign boundary_4k_ar = (maddr_ddr_diff_nxt <= len_max_shl4) ? 
//-assign boundary_4k_ar = (maddr_ddr_diff_cur <= len_max_shl4) ? 
//-                        ((&maddr_ddr_diff_nxt_4k) ? ~maddr_ddr_diff_cur_all[7:4] : 
//-						 (maddr_ddr_diff_nxt <= len_max_shl4)? 4'hf:arnum_rest[3:0]) :
//-						arnum_rest[3:0];

assign boundary_4k_ar = maddr_ddr_diff_over_range_r ? 
//-                         arnum_rest[3:0] : ((&maddr_ddr_diff_nxt_4k) ? ~maddr_ddr_diff_cur_all[7:4] : 
                         4'h0 : ((&maddr_ddr_diff_nxt_4k) ? ~maddr_ddr_diff_cur_all[7:4] : 

//-wire rest_lt_ar;
//-assign rest_lt_ar = (&maddr_ddr_diff_nxt_4k) & 
//-                    (arnum_rest[3:0] < (~maddr_ddr_diff_cur_all[7:4]));
						                                               4'hf);
//-assign boundary_4k_aw = (maddr_ddr_diff_cur_w <= len_max_shl5) ? 
//-                        ((&maddr_ddr_diff_nxt_4k_w) ? ~maddr_ddr_diff_cur_w_all[7:4] : 
//-						 (maddr_ddr_diff_nxt_w <= len_max_shl5)? 4'hf:awnum_rest[3:0]) :
//-						awnum_rest[3:0];
assign boundary_4k_aw = maddr_ddr_diff_over_range_w ? 
//-                          awnum_rest[3:0] : ((&maddr_ddr_diff_nxt_4k_w) ? ~maddr_ddr_diff_cur_w_all[7:4] : 
                          4'h0 : ((&maddr_ddr_diff_nxt_4k_w) ? ~maddr_ddr_diff_cur_w_all[7:4] : 
						                                                  4'hf);
assign boundary_4k_arnum = maddr_ddr_diff_over_range_r ? 4'h0: 
                            ((&maddr_ddr_diff_nxt_4k) ? ~maddr_ddr_diff_cur_all[7:4] : 4'h0);
assign boundary_4k_awnum = maddr_ddr_diff_over_range_w ? 4'h0:
                            ((&maddr_ddr_diff_nxt_4k) ? ~maddr_ddr_diff_cur_w_all[7:4] : 4'h0);


assign len_max_shl4 = {len_max[27:0], 4'h0};
assign len_max_shl1 = {len_max[30:0], 1'b0};
assign len_max_shl5 = {len_max[26:0], 5'b0};
assign maddr_ddr_diff_cur = maddr_ddr_diff_cur_all-maddr_ddr_start;
assign maddr_ddr_diff_cur_w = maddr_ddr_diff_cur_w_all-maddr_ddr_start;
assign maddr_ddr_diff_cur_all = maddr_ddr+burst_len;
assign maddr_ddr_diff_cur_w_all = maddr_ddr+wburst_len;
assign arnum_rest = len_max - maddr_ddr_diff_cur[31:4] - 32'h1 - boundary_4k_arnum;
//assign awnum_rest = len_max_shl1 - maddr_ddr_diff_cur_w[31:4] - 32'h1;
assign awnum_rest = len_max_shl1 - maddr_ddr_diff_cur_w[31:4] - 32'h1 - boundary_4k_awnum;
//assign arnum_pre = ((maddr_ddr_diff_cur + 32'h100) <= len_max_shl4) ? 4'hf : arnum_rest[3:0];
assign arnum_pre = boundary_4k_ar;
//assign awnum_pre = ((maddr_ddr_diff_cur_w + 32'h100) <= len_max_shl5) ? 4'hf : awnum_rest[3:0];
assign awnum_pre = boundary_4k_aw;
//----------------------------------------------------------------
// sort begin
//-------------------------------------------------------------
//- Type1: raddr_ddr calc
//- 
// 1, calc first read address
//- [0,stride*3-1]
wire [2:0] stride_inc;//1-4
assign stride_inc = {1'b0, stride} + 3'b1;
//- available_bytes = stride*3
wire [3:0] available_bytes;//3-12
assign available_bytes = {stride_inc, 1'b0} + {1'b0, stride_inc}; // 4*3=12byte=96bit
wire [4:0] square_stride;//1-16
wire [4:0] adder2;
wire [4:0] adder1;
wire [4:0] adder0;
assign adder2 = stride_inc[2] ? {stride_inc,2'b0} : 5'h0;
assign adder1 = stride_inc[1] ? {1'b0, stride_inc,1'b0} : 5'h0;
assign adder0 = stride_inc[0] ? {2'b0, stride_inc} : 5'h0;
assign square_stride = adder2 + adder1 + adder0;
//- x = line_size*stride/ceil(stride^2*3/32)-pad_num
//- k_old = x * x * 3 
//- k_new = ((x+pad_num)/stride)^2 * ic_new, here "ic_new" is stride^2*3 inside 
//- [3,12,27,48]
wire [5:0] k_new;
assign ic_new = square_stride <<1 + square_stride;
//- piece_new = ceil(stride^2*3/32)
wire piece_new;
assign piece_new = k_new[5];
// stride_div_piece = stride / piece
wire [1:0] stride_div_piece;
assign stride_div_piece = stride_inc[2] ? 2'h2 : stride_inc[1:0];
wire [8:0] line_size_inc;
assign line_size_inc = {1'b0, line_size} + 9'h1;
//- k_old_x = line_size * stride_div_piece -pad_num
wire [9:0] k_old_x;
wire [9:0] line_size_mult;
wire [9:0] line_size_mult1;
wire [9:0] line_size_mult0;
assign line_size_mult1 = stride_div_piece[1] ? {line_size_inc, 1'b0} : 10'h0;
assign line_size_mult0 = stride_div_piece[0] ? {1'b0, line_size_inc} : 10'h0;
assign line_size_mult = line_size_mult1 + line_size_mult0;
assign k_old_x = line_size_mult - {8'h0, pad_num}; 
// 2, charge if first_addr<16Bytes go 2.1, else go 2.2
// LCM, least common multiple
// stride=2, 6  16 lcm48   3 trans
//	 	  3, 9  16 lcm144  9 trans
//        4, 12 16 lcm48   3 trans
// k_x[7:0]: 1-256 pixel, 3-768 byte
// map_size=(k_x)^2 * 3, 3-2^16*3
// axi_trans_times=ceil(map_size/16)
// 0 s^2*3 s^2*3*2
// 0 k_x*3
// s= 4 or 3        ||  2
// 16={s*3, 16-s*3} || {s*3, s*3, 16-s*3-s*3}
// 16=12+4 or 9+7   || 6+6+4
//   1   2   3     4   5
// 12-4 8-8 4-12 12-4 8-8
//  1    2     3     4    5    6 
// 9-7 2-9-5 4-9-3 6-9-1 8-8 1-9-6
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!! 1. read 16B, write stride*3, mask the unused byte
// !!! 2. calc second addr, repeat step 1
// !!! 3. calc third addr, repeat step 1
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// 1st addr=0; data_mask[stride*3-1:0] = 1'b1;
// 2st addr=k_x;

//- num_map=((k_x+pad_num)/stride)^2
//- STRIDE=4
//- addr_map0 = 4*3*0+k_x*0+line_nxt*k_x*3*4, 4*3*0+k_x*1+line_nxt*k_x*3*4,...,4*3*0+k_x*3+line_nxt*k_x*3*4 
//- addr_map1 = 4*3*1+k_x*0+line_nxt*k_x*3*4, 4*3*1+k_x*1+line_nxt*k_x*3*4,...,4*3*1+k_x*3+line_nxt*k_x*3*4 
//- addr_map2 = 4*3*2+k_x*0+line_nxt*k_x*3*4, 4*3*2+k_x*1+line_nxt*k_x*3*4,...,4*3*2+k_x*3+line_nxt*k_x*3*4 
//- addr_map3 = 4*3*3+k_x*0+line_nxt*k_x*3*4, 4*3*3+k_x*1+line_nxt*k_x*3*4,...,4*3*3+k_x*3+line_nxt*k_x*3*4 
//- maddr_ddr_pre = stride_inc*3*map_num + k_x*stride_cnt + line_nxt*k_x*3*stride_inc;
reg [2:0] map_num;//max=2^14(stride=2)
reg [1:0] stride_cnt;
reg [7:0] stride_cnt_y;
//- stride_cnt_x = line_size+pad_num/stride_inc;
wire [14:0] stride_cnt_x;
// TODO
wire [8:0] line_size_full;
assign line_size_full = line_size+pad_num;
assign stride_cnt_x = stride_inc==3? (line_size_full)*85>>8 :  // A/256, 85 so close
					  stride_inc==4? (line_size_full)>>2 : // A/4
					  stride_inc==2? (line_size_full)>>1 : // A/2
					                 (line_size_full);
reg [31:0] maddr_ddr_calc;
reg [7:0] line_nxt;
wire [5:0] map_num_mult3;
wire [7:0] map_num_mult3_multstride;
wire [11:0] k_x_mult_stride_cnt;
wire [19:0] maddr_ddr_pre;
wire [31:0] maddr_ddr_remap;
wire [9:0] k_x;
//wire [7:0] row_num;
wire [19:0] line_nxt_addr;
// map_size = line_size * line_size *3;
wire [19:0] map_size; //18bit
assign map_size = k_x * line_size;
// ROW=k_x/stride_inc; row_num use to calc maddr_ddr> 5
// line_nxt_addr = line_nxt * k_x * 3 * stride_inc;
assign line_nxt_addr = line_nxt * k_x * stride_inc; 
assign k_x = {1'b0, line_size, 1'b0} + {2'b0, line_size};
assign map_num_mult3 = {2'b0, map_num} + {1'b0, map_num, 1'b0};
assign map_num_mult3_multstride = stride_inc[2] ? {map_num_mult3, 2'b0} :
								  ((stride_inc[1] ? {1'b0, map_num_mult3,1'b0} : 8'h0) +
								  (stride_inc[0] ? {2'b0, map_num_mult3} : 8'h0));
assign k_x_mult_stride_cnt = (stride_cnt[1] ? {1'b0, k_x, 1'b0} : 12'h0) + 
				(stride_cnt[0] ? {2'b0, k_x} : 12'h0);
assign maddr_ddr_pre = line_nxt_addr  +  
						{12'b0, map_num_mult3_multstride} + {8'h0, k_x_mult_stride_cnt}; 

assign maddr_ddr_remap = {12'h0, maddr_ddr_pre} + maddr_ddr_start;
//- wire [2:0] map_num_b2d0_dec;
//- assign map_num_b2d0_dec = map_num[2:0] - 3'b1;
`ifdef IVERILOG
assign sdata_mask[(0+1)*8-1:0*8] = {8{data_bit[0]}};
assign sdata_mask[(1+1)*8-1:1*8] = {8{data_bit[1]}};
assign sdata_mask[(2+1)*8-1:2*8] = {8{data_bit[2]}};
assign sdata_mask[(3+1)*8-1:3*8] = {8{data_bit[3]}};
assign sdata_mask[(4+1)*8-1:4*8] = {8{data_bit[4]}};
assign sdata_mask[(5+1)*8-1:5*8] = {8{data_bit[5]}};
assign sdata_mask[(6+1)*8-1:6*8] = {8{data_bit[6]}};
assign sdata_mask[(7+1)*8-1:7*8] = {8{data_bit[7]}};
assign sdata_mask[(8+1)*8-1:8*8] = {8{data_bit[8]}};
assign sdata_mask[(9+1)*8-1:9*8] = {8{data_bit[9]}};
assign sdata_mask[(10+1)*8-1:10*8] = {8{data_bit[10]}};
assign sdata_mask[(11+1)*8-1:11*8] = {8{data_bit[11]}};
assign sdata_mask[(12+1)*8-1:12*8] = {8{data_bit[12]}};
assign sdata_mask[(13+1)*8-1:13*8] = {8{data_bit[13]}};
assign sdata_mask[(14+1)*8-1:14*8] = {8{data_bit[14]}};
assign sdata_mask[(15+1)*8-1:15*8] = {8{data_bit[15]}};
`else
generate 
	for (genvar gi=0; gi<16; gi=gi+1) begin
		assign sdata_mask[(gi+1)*8-1:gi*8] = {8{data_bit[gi]}};
	end
endgenerate
`endif // IVERILOG
assign sdata_ddr_mask = sdata_ddr & sdata_mask;
assign sdata_ddr_merge = sdata_ddr_mask | sdata_ddr_shift;
always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
		sdata_ddr_shift <= 128'h0;
	end
	else begin
		if(rvalid_s & ~fifo_m2_full) 
			if(data_bit[0])
				sdata_ddr_shift <= sdata_ddr_mask;
			else
				sdata_ddr_shift <= sdata_ddr_merge;
	end

reg mwrite_sram_done;
always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
		map_num <= 'h0;
		stride_cnt <= 'h0;
		stride_cnt_y <= 'h0;
		line_nxt <= 'h0;
		data_bit <= 16'h1;
		rlast_s_r <= 1'b0;
		data_bit0_r <= 1'b0;
		mwrite_sram_done <= 1'b0;
	end
	else begin
		data_bit0_r <= data_bit[0];
		if(~dma_done_ddr_rreq) begin
			mwrite_sram_done <= 1'b0;
		end
		else begin
			if(data_bit[0] & ~data_bit0_r) begin
				mwrite_sram_done <= 1'b1;
			end
		end
        if(ex_dma_r & ~ex_dma_r2 & zone_trans) begin
		    map_num <= 'h0;
		    stride_cnt <= 'h0;
		    stride_cnt_y <= 'h0;
		    line_nxt <= 'h0;
			rlast_s_r <= 1'b0;
			data_bit <= 16'h1;
        end
        else if(|stride & dma_en_m2 & (mode_m2iob0 | mode_m2iob1) 
		    //& ddr_r_reqb & ~fifo_m2_full & svalid_ddr & ~dma_done_ddr_rreq) begin
		    //& ~fifo_m2_full & svalid_ddr & ~dma_done_ddr_rreq) begin
		    //& ~fifo_m2_full & ~dma_done_ddr_rreq) begin
		    & ~fifo_m2_full & ~mwrite_sram_done) begin
			rlast_s_r <= rlast_s;
		    //- if(rlast_s_r) begin
			//- 	data_bit <= 16'b0;
			//-     data_bit[maddr_ddr_pre[3:0]] <= 1'b1;
			//- end
		    //- else begin
			//-     data_bit <= {data_bit[14:0], data_bit[15]};
		    //- end
			if(rvalid_s)
			     data_bit <= {data_bit[14:0], data_bit[15]};
		    //if(rlast_s) begin
		    if(mread_ddr & arready_in) begin
			    if(stride_cnt==stride) begin
			    	map_num <= map_num + 'h1;
			    	stride_cnt <= 'h0;
			    	stride_cnt_y <= stride_cnt_y + 8'b1;
			    	//if(stride_cnt_y==stride_inc) begin
			    	if(stride_cnt_y==stride_cnt_x[7:0]) begin
			    		line_nxt <= line_nxt + 'h1;
			    		stride_cnt_y <= 'h0;
			    		map_num <= 'h0;
			    	end
			    end
			    else begin
			    	stride_cnt <= stride_cnt + 2'b1;
			    end
		    end
				//-`ifdef DEBUG 
				//-$display("DATA_BIT=%b", data_bit);
				//-$display("RDATA_S=%h", rdata_s);
				//-$display("SDATA_MASK=%h", sdata_mask);
				//-#1 $display("SDATA_SHF= %h", sdata_ddr_shift);
				//-//$display("DMA_EN_M2=%h", dma_en_m2);
				//-//$display("MODE_M2IOB0=%h", mode_m2iob0);
				//-//$display("MODE_M2IOB1=%h", mode_m2iob1);
				//-$display("MADDR_DDR_CALC %h, STRIDE_CNT %d, MAP_NUM %d, LINE_NXT %d ", maddr_ddr_pre, 
				//-stride_cnt, map_num, line_nxt_addr);
				//-`endif
		end
	end
assign rddr_size = |stride ? 3'h0 : 3'h4;
//assign rddr_len = |stride ? available_bytes-4'b1 : 4'd3;
assign rddr_len = |stride ? available_bytes-4'b1 : arnum;


wire over_one_xfer;
assign over_one_xfer = available_bytes >16;
// 2.1, calc second read address and so on, until read_addr=16Bytes
// 2.2, write 16Bytes data to IOB
// 3, repeat step 2
// 4, if read_addr+stride > padding_addr 4.1
// 4.1, pad_num*3 Bytes add to read_data, if available data+pad_data>16Byte go 4.2
// 4.2, cut 16Bytes data, next read_data merge the remind pad_data and wirte to IOB
//-------------------------------------------------------------
//- Type2: waddr_sram calc 
//- 
//- 
reg [15:0] raddr_ddr_cnt;
always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
		raddr_ddr_cnt <= 'h0;
	end
	else begin
		raddr_ddr_cnt <= raddr_ddr_cnt + 'h1;
	end

//-------------------------------------------------------------
// sort end
//----------------------------------------------------------------

reg [3:0] awfifo_out;
wire [4:0] awfifo_data;
wire [3:0] awfifo_rdata;
assign awfifo_rdata = awfifo[aw_rptr_r];
assign awfifo_data = awfifo_empty ? 5'h1f : awfifo_rdata;

assign awfifo_empty = aw_wptr == aw_rptr;
assign awfifo_full = (aw_wptr - aw_rptr)>=2;


assign rddr_len_inc = rddr_len + 5'h1;
assign wddr_len_inc = awnum + 5'h1;
// TODO
assign burst_len  = rddr_len_inc * 9'h10;
assign wburst_len = wddr_len_inc * 9'h10;
always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
        maddr_ddr <= 'h0;
		ex_dma_lvl_r <= 1'b0;
        ex_dma_r <= 1'b0;
        ex_dma_r2 <= 1'b0;
        ddr_wr_resp_cnt <= 'h0;
        ddr_wr_req_cnt <= 'h0;
        ddr_aw_req_cnt <= 'h0;
		arnum <= 4'h0;
		awnum <= 4'h0;
		aw_wptr <= 'h0;
		aw_rptr <= 'h0;
		aw_rptr_r <= 'h0;
		wlast_cnt <= 'h0;
		awfifo_out <= 'h0;
    end
    else begin
		ex_dma_lvl_r <= ex_dma | mode_m2instb_r;
        ex_dma_r <= ex_dma_mix;
        ex_dma_r2 <= ex_dma_r;
		aw_rptr_r <= aw_rptr;
		if(dma_done) begin
        	ex_dma_r <= 1'b0;
        	ex_dma_r2 <= 1'b0;
			arnum <= 4'h0;
			awnum <= 4'h0;
			aw_wptr <= 'h0;
			aw_rptr <= 'h0;
			aw_rptr_r <= 'h0;
			awfifo_out <= 'h0;
		end
        if(ex_dma_r & ~ex_dma_r2 & zone_trans) begin
			if(mread_ddr & arready_in) begin
            	//maddr_ddr <= maddr_ddr_start + 'h10;
            	maddr_ddr <= maddr_ddr_start + burst_len;
				arnum <= arnum_pre;
			end
			else begin
            	maddr_ddr <= maddr_ddr_start;
			end
        end
        //else if(dma_en_m2 & ddr_r_reqb & ~fifo_m2_full & svalid_ddr & ~dma_done_ddr_rreq) begin
        //else if(dma_en_m2 & ddr_r_reqb & ~fifo_m2_full & ex_dma_r & ~dma_done_ddr_rreq & 
		//		arready_in) begin
        else if(dma_en_m2 & ddr_r_reqb & ex_dma_r) begin 
            //maddr_ddr <= maddr_ddr + 'h10;
            maddr_ddr <= maddr_ddr+ burst_len;
			arnum <= arnum_pre;
        end
        //else if(svalid_sram & slast_sram & ex_dma & zone_trans & mode_2m) begin
        //else if(ddr_w_reqb & ex_dma & zone_trans & mode_2m & ~dma_done_ddr) begin
        //else if(dma_en_2m & ddr_w_reqb & ~afifo_empty & ex_dma_r & ~dma_done_ddr_wreq) begin
        else if(dma_en_2m & ddr_aw_reqb & ex_dma_r) begin
            //maddr_ddr <= maddr_ddr + 'h10;
            maddr_ddr <= maddr_ddr + wburst_len;
			awnum <= awnum_pre;
        end

        if(ex_dma_r & ~ex_dma_r2 & zone_trans) begin
            ddr_wr_resp_cnt <= maddr_ddr_start;
            ddr_wr_req_cnt <= maddr_ddr_start;
            ddr_aw_req_cnt <= maddr_ddr_start;
			wlast_cnt <= 'h0;
			aw_wptr <= 'h0;
			aw_rptr <= 'h0;
        end
        else begin
            if(ddr_respb) 
                //ddr_wr_resp_cnt <= ddr_wr_resp_cnt + 'h1;
                ddr_wr_resp_cnt <= ddr_wr_resp_cnt + 'h1 + awfifo_out;
            if(ddr_w_reqb) begin
                ddr_wr_req_cnt <= ddr_wr_req_cnt + 'h1;
				wlast_cnt <= wlast_cnt + 'h1;
				if(wlast_cnt >= awfifo_data) begin
					wlast_cnt <= 'h0;
					if(~awfifo_empty) begin
						aw_rptr <= aw_rptr + 'h1;
						//awfifo_out <= awfifo[aw_rptr];
						awfifo_out <= awfifo_rdata;
					end
					//- if(awfifo_empty) begin 
					//- 	aw_rptr <= 'h0;
					//- 	aw_wptr <= 'h0;
					//- end
					//- else begin
					//- 	aw_rptr <= aw_rptr + 'h1;
					//- 	awfifo_out <= awfifo[aw_rptr];
					//- end
				end
			//	else
			//		wlast_cnt <= wlast_cnt + 4'h1;
			end
            if(ddr_aw_reqb & ~awfifo_full) begin
                //ddr_aw_req_cnt <= ddr_aw_req_cnt + 'h1;
                ddr_aw_req_cnt <= ddr_aw_req_cnt + wddr_len_inc;
				aw_wptr <= aw_wptr + 'h1;
				awfifo[aw_wptr] <= awnum;
			end
			//else begin
			//	if(awfifo_empty)
			//		aw_wptr <= 'h0;
			//end
        end
            
        
    end

//- 
assign bubble_num = wptr_r-rptr;
assign bubble_num2 = wptr-rptr;
assign afifo_full = (bubble_num >=2) && (bubble_num <=3);
assign afifo_empty = bubble_num2==0;
assign wptr = awptr <<1;
assign wptr_r = awptr_r <<1;
assign rptr = arptr;

assign mread_sram = ~dma_done_sram & saccept_sram & dma_en & mode_2m & ~afifo_full;

reg mread_sram_r;
always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
        awptr <= 'b0;
        awptr_r <= 'b0;
		mread_sram_r <= 1'b0;
		//-afifo[0] <= 'h0;
		//-afifo[1] <= 'h0;
		//-afifo[2] <= 'h0;
		//-afifo[3] <= 'h0;
		//-afifo[4] <= 'h0;
		//-afifo[5] <= 'h0;
		//-afifo[6] <= 'h0;
		//-afifo[7] <= 'h0;
		//-afifo[8] <= 'h0;
		//-afifo[9] <= 'h0;
		//-afifo[10] <= 'h0;
		//-afifo[11] <= 'h0;
		//-afifo[12] <= 'h0;
		//-afifo[13] <= 'h0;
		//-afifo[14] <= 'h0;
		//-afifo[15] <= 'h0;
		afifo <= 'h0;
    end
    else begin
        // sram read
        //awptr_r <= awptr;
		mread_sram_r <= mread_sram;
        if(dma_done) begin
            awptr <= 'b0;
			awptr_r <= 'b0;
        end
        else begin
            if(saccept_sram & dma_en & mode_2m) begin
                //if(svalid_sram & slast_sram & ~afifo_full) begin
                //if(~afifo_full & mread_sram_r) begin
                if(mread_sram_r) begin
                    //afifo[wptr_r] <= sdata_sram[127:0];
                    //afifo[wptr_r+1] <= sdata_sram[255:128];
                    //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                    //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
                    //afifo[(0+1)*128-1: 0*128] <= sdata_sram[127:0];
                    //afifo[(0+2)*128-1:(0+1)*128] <= sdata_sram[255:128];
					case(wptr_r[3:0])
		                `CASEW(0)
		                //`CASEW(1)
		                `CASEW(2)
		                //`CASEW(3)
		                `CASEW(4)
		                //`CASEW(5)
		                `CASEW(6)
		                //`CASEW(7)
		                `CASEW(8)
		                //`CASEW(9)
		                `CASEW(10)
		                //`CASEW(11)
		                `CASEW(12)
		                //`CASEW(13)
		                `CASEW(14)
		                //`CASEW(15)
					    //0:begin
                        //afifo[(0+1)*128-1: 0*128] <= sdata_sram[127:0];
                        //afifo[(0+2)*128-1:(0+1)*128] <= sdata_sram[255:128];
					    //end
					    //1:begin
                        //afifo[(1+1)*128-1: 1*128] <= sdata_sram[127:0];
                        //afifo[(1+2)*128-1:(1+1)*128] <= sdata_sram[255:128];
					    //end
					    //2:begin
                        //afifo[(2+1)*128-1:2*128] <= sdata_sram[127:0];
                        //afifo[(2+2)*128-1:(2+1)*128] <= sdata_sram[255:128];
					    //end
					    //3:begin
                        //afifo[(3+1)*128-1:3*128] <= sdata_sram[127:0];
                        //afifo[(3+2)*128-1:(3+1)*128] <= sdata_sram[255:128];
					    //end
					    //4:begin
                        //afifo[(4+1)*128-1:4*128] <= sdata_sram[127:0];
                        //afifo[(4+2)*128-1:(4+1)*128] <= sdata_sram[255:128];
					    //end
					    //5:begin
                        //afifo[(5+1)*128-1:5*128] <= sdata_sram[127:0];
                        //afifo[(5+2)*128-1:(5+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
					    //wptr_r:begin
                        //afifo[(wptr_r+1)*128-1:wptr_r*128] <= sdata_sram[127:0];
                        //afifo[(wptr_r+2)*128-1:(wptr_r+1)*128] <= sdata_sram[255:128];
					    //end
						default:;
					endcase
                end

                if(~afifo_full & mread_sram) begin
                    awptr <= awptr + 'b1;
        			awptr_r <= awptr;
                end
                else begin
                    if(afifo_empty) 
                        awptr <= 'b0;
                end
            end
        end
    end

//assign mwrite_ddr = ~afifo_empty & ~dma_done_ddr_wreq & dma_en_2m;
//assign mwrite_ddr_data = ~afifo_empty & ~dma_done_ddr_wreq & dma_en_2m;

always @(posedge xclk or negedge xrst_n) 
    if(~xrst_n) begin
        arptr <= 'b0;
        mwrite_ddr <= 1'b0;
        mwrite_ddr_data <= 1'b0;
    end
    else begin
		if(dma_done_ddr_awreq_m1 | dma_done_ddr_awreq) begin
			mwrite_ddr <= 1'b0;
		end
		else begin
			//-if(~awready_m & mwrite_ddr)
			//-	mwrite_ddr <= mwrite_ddr;
			//-else begin 
			//-	mwrite_ddr <= dma_en_2m & ~awfifo_full;
			//-end
			if(~awready_m & mwrite_ddr)
				mwrite_ddr <= mwrite_ddr;
			else begin 
				if(awready_m & mwrite_ddr)
					mwrite_ddr <= 1'b0;
				else
					mwrite_ddr <= dma_en_2m & ~awfifo_full;
			end
		end
		if(dma_done_ddr_wreq_m1 | dma_done_ddr_wreq) begin
			mwrite_ddr_data <= 1'b0;
		end
		else begin
			if(~wready_s1 & mwrite_ddr_data)
				mwrite_ddr_data <= mwrite_ddr_data;
			else begin
				mwrite_ddr_data <= dma_en_2m & ~afifo_empty & ~awfifo_empty;
			end
		end
        // ddr write
        if(afifo_empty | dma_done_ddr_wreq) begin
            arptr <= 'b0;
            //mwrite_ddr <= 1'b0;
        end
        else begin
            if(saccept_ddr & dma_en_2m) begin
               // mwrite_ddr <= 1'b1;
                //if(mwrite_ddr)
                if(wready_s1 & mwrite_ddr_data)
                    arptr <= arptr + 'b1;
            end
        end
    end
//- DTC
//assign mread_sram = mode_iob02m | mode_iob12m;
//assign mwrite_sram = mode_m2iob0 | mode_m2iob1 | mode_m2wb416 | mode_m2wb256 | mode_m2wib | mode_m2biasb | mode_m2instb_r;


//- IAU
wire sort_done;
assign dma_done_mask = ddr_wr_resp_cnt>maddr_ddr_start;
//assign dma_done_ddr = mode_2m|mode_m2 ? (maddr_ddr-maddr_ddr_start) >= len_max: 1'b0; 
//assign dma_done_ddr = mode_2m|mode_m2 ? (ddr_wr_resp_cnt-maddr_ddr_start) >= len_max: 1'b0; 
//assign dma_done_ddr = |stride? (maddr_ddr_pre >= map_size) : 
assign dma_done_ddr = |stride? sort_done : 
               //(ex_dma_r2 & (mode_2m ? (ddr_wr_resp_cnt-maddr_ddr_start+1) >= (len_max<<1) :
               (ex_dma_r2 & (mode_2m ? (dma_done_ddr_awreq&dma_done_ddr_wreq) :
                      mode_m2 ? dma_done_mask &((ddr_wr_resp_cnt-maddr_ddr_start) >= len_max) :
                                1'b0)); 
//assign dma_done_ddr_awreq = mode_2m ? (ddr_aw_req_cnt-maddr_ddr_start) >= (len_max<<1) :
assign dma_done_ddr_awreq = mode_2m ? 
                                ((ddr_aw_reqb & (ddr_aw_req_cnt-maddr_ddr_start+wddr_len_inc) >= (len_max<<1)) | 
								((ddr_aw_req_cnt-maddr_ddr_start) >= (len_max<<1)))
								: 1'b0; 
assign dma_done_ddr_awreq_m1 = mode_2m ? ((ddr_aw_req_cnt-maddr_ddr_start+1)>=(len_max<<1)) &
                                awready_s1 & mwrite_ddr :
                                1'b0; 
assign dma_done_ddr_wreq = mode_2m ? (ddr_wr_req_cnt-maddr_ddr_start) >= (len_max<<1) :
                                1'b0; 
assign dma_done_ddr_wreq_m1 = mode_2m ? ((ddr_wr_req_cnt-maddr_ddr_start+1)>=(len_max<<1)) & 
                                wready_s1 & mwrite_ddr_data:
                                1'b0; 
//assign dma_done_ddr_rreq = |stride? (maddr_ddr_pre >= map_size) : mode_m2 ? 
assign dma_done_ddr_rreq = |stride? sort_done : mode_m2 ? 
								//dma_done_mask &((maddr_ddr-maddr_ddr_start) >= (len_max<<4)) 
								(ddr_r_reqb & ((maddr_ddr-maddr_ddr_start+burst_len) >= (len_max<<4)) | 
								//(dma_done_mask &((maddr_ddr-maddr_ddr_start) >= (len_max<<4))))
								((maddr_ddr-maddr_ddr_start) >= (len_max<<4)))
									: 1'b0; 
assign dma_done_ddr_rreq_m1 = (mode_m2 & ex_dma_r2) ? 
								(((maddr_ddr-maddr_ddr_start)>>4 >= (len_max-1))
									    //& (maddr_ddr!=maddr_ddr_start)
										& arready_in
										)|dma_done_ddr_rreq_m1_mask : 
								1'b0; 


always @(posedge xclk or negedge xrst_n)
    if(~xrst_n) begin
		dma_done_ddr_rreq_m1_r <= 1'b0;
		dma_done_ddr_rreq_m1_mask <= 1'b0;
	end
	else begin
		dma_done_ddr_rreq_m1_r <= dma_done_ddr_rreq_m1;
		if(dma_done_ddr_rreq_m1 & ~dma_done_ddr_rreq_m1_r) begin
			dma_done_ddr_rreq_m1_mask <= 1'b1;
		end
		else begin
			if(dma_done) 
				dma_done_ddr_rreq_m1_mask <= 1'b0;
		end
	end


//assign dma_done_sram = mode_m2|mode_2m ? (maddr_sram-maddr_sram_start) >= len_max: 1'b0; 
//- assign dma_done_sram = |stride? (maddr_ddr_pre >= map_size) : 
//- 					 (ex_dma_r2 & (
//- 					 	mode_m2_down ? (sram_wr_req_cnt-maddr_sram_start) >= len_max: 
//- 							mode_m2|mode_2m ? (maddr_sram_pre+1) >= len_max: 1'b0)); 
//assign dma_done = dma_done_ddr & dma_done_sram;
assign sort_done = |line_size_full[1:0] ? (maddr_ddr_pre > map_size) :
			                              (maddr_ddr_pre >= map_size);
always @(posedge xclk or negedge xrst_n)
    if(~xrst_n) begin
        dma_done <= 1'b0;
		dma_finish <= 1'b0;
		dma_done_sram <= 1'b0;
    end
    else begin
		//dma_done_sram <= |stride? (maddr_ddr_pre >= map_size) : 
		dma_done_sram <= |stride? sort_done & mwrite_sram_done : 
				 		(ex_dma_r2 & (
				 		mode_m2_down ? (sram_wr_req_cnt-maddr_sram_start) >= len_max: 
						mode_m2|mode_2m ? (maddr_sram_pre+1) > len_max: 1'b0)); 
		if(|stride) 
            dma_done <= sort_done & mwrite_sram_done;
        else if(dma_done_ddr & dma_done_sram) begin
            dma_done <= 1'b1;
			dma_finish <= 1'b1;
		end
        //else if(ex_dma_mix & ~ex_dma_r)
        else if((ex_dma|mode_m2instb_r) & ~ex_dma_lvl_r)
            dma_done <= 1'b0;
		if(dma_done)
			dma_finish <= 1'b0;
    end
assign ex_zone_bias_wr_finish = mode_m2biasb & dma_done;
assign ex_zone_wib_wr_finish = mode_m2wib & dma_done;
assign ex_zone_wb_wr_finish = (mode_m2wb416|mode_m2wb256) & dma_done;
assign init_inst_finish = mode_m2instb_r & dma_done;
assign init_prot_finish = mode_m2instb_r & dma_done;
assign zone3_wr_finish = (mode_m2iob0|mode_m2iob1) & dma_done & zone_en_s[3];
assign zone2_wr_finish = (mode_m2iob0|mode_m2iob1) & dma_done & zone_en_s[2]; 
assign zone1_rd_finish = (mode_iob02m|mode_iob12m) & dma_done & zone_en_s[1]; 
assign zone0_rd_finish = (mode_iob02m|mode_iob12m) & dma_done & zone_en_s[0]; 
//assign zone_addr_mismatch = ~zone_addr_match;
assign zone_addr_mismatch = ~(zone1_addr_match | 
							  zone2_addr_match |
							  zone3_addr_match | 
							  zone4_addr_match);

//- GM

  // AXI write request
  wire [4-1:0]                         awid;
  wire                                      awvalid;
  wire [32-1:0]                         awaddr;
  wire [8-1:0]                         awlen;
  wire [2:0]                                awsize;
  wire [1:0]                                awburst;
  wire [1:0]                                awlock;
  wire [3:0]                                awcache;
  wire [2:0]                                awprot;
  wire                                      awready;

  // AXI write data
  wire [4-1:0]                         wid;
  wire                                      wvalid;
  wire                                      wlast;
  wire [DW-1:0]                         wdata;
  wire [32-1:0]                         wstrb;
  wire                                      wready;

  // AXI write response
  wire [4-1:0]                          bid;
  wire                                       bvalid;
  wire [1:0]                                 bresp;
  wire                                       bready;  
  
  // AXI read request
  wire [4-1:0]                         arid;
  wire                                      arvalid;
  wire [32-1:0]                         araddr;
  wire [8-1:0]                         arlen;
  wire [2:0]                                arsize;
  wire [1:0]                                arburst;
  wire [1:0]                                arlock;
  wire [3:0]                                arcache;
  wire [2:0]                                arprot;  
  wire                                      arready;

  // AXI read response & read data
  wire [4-1:0]                          rid;
  wire                                       rvalid;
  wire                                       rlast;
  wire [DW-1:0]                          rdata;
  wire [1:0]                                 rresp;
  wire                                       rready;

//assign ddr_respb = svalid_ddr & mready_ddr;
//assign ddr_respb = (|stride ? (data_bit[15]&rvalid_s&rready_s) : svalid_ddr) & mready_ddr;
assign ddr_respb = ( |stride ? (data_bit[15]) :
				    ((bvalid_s1 & bready_s1) | (rvalid_s & ~fifo_m2_full))
				   ) 
				  // & mready_ddr
				   ;
//assign ddr_w_reqb = mwrite_ddr & saccept_ddr;
assign ddr_aw_reqb = mwrite_ddr & awready_s1;
assign ddr_w_reqb = mwrite_ddr_data & wready_s1;
//assign ddr_r_reqb = mread_ddr & saccept_ddr;
assign ddr_r_reqb = mread_ddr & arready_in;
assign ddr_wb = mwrite_ddr & saccept_ddr;

assign sram_respb = mode_m2_down ? saccept_sram : svalid_sram & mready_sram;
assign sram_w_reqb = mwrite_sram & saccept_sram;
assign sram_r_reqb = mread_sram & saccept_sram;

assign dma_en = ex_dma_r2 & zone_trans;
assign dma_en_2m = dma_en & mode_2m;
assign dma_en_m2 = dma_en & mode_m2 | mode_m2instb_r;
assign dma_en_m2m = dma_en & (mode_2m | mode_m2) | mode_m2instb_r;
// 1. mode_2m logic done.
// 2. mode_m2 logic continue


// AXI IF
// Write Address Channel 1
assign awid_m = 4'h0;
assign awvalid_m = mwrite_ddr;
assign awaddr_m = maddr_ddr[31:0];
assign awlen_m = mlen_ddr;
assign awsize_m = msize_ddr;
assign awburst_m = 2'b01;
assign awlock_m = 1'b0;
assign awprot_m = 3'b010;
assign awcache_m = 4'b0011;

// Write Response Channel 1
assign bready_s1 = 1'b1;
assign wid_s1 = 4'h0;
assign wdata_s1 = mdata_ddr;
assign wvalid_s1 = mwrite_ddr_data;
//assign wlast_s1 = wvalid_s1;
//assign wlast_s1 = ~|wlast_cnt;
assign wlast_s1 = ((mode_iob02m|mode_iob12m) & (dma_trans_len==1)) | (wlast_cnt>=awfifo_data);

// Read Address Channel
assign arid_s = 4'h0;
assign arvalid_s = mread_ddr;
assign araddr_s = |stride ? maddr_ddr_remap : maddr_ddr[31:0];
assign arlen_s = rddr_len;
assign arsize_s = rddr_size;
assign arburst_s = 2'b01;
assign arlock_s = 1'b0;
assign arprot_s = 3'b010;
assign arcache_s = 4'b0011;

// Read Data Channel
assign rready_s = ~fifo_m2_full;
assign sdata_ddr = rdata_s;

// GIF
assign svalid_ddr = bvalid_s1 | rvalid_s;
//assign saccept_ddr = wready_s1 | arready_in;
assign saccept_ddr = awready_s1 | arready_in;


//DW_axi_gm U_gm(/*AUTOARG*/
//  // Outputs
//  .saccept(saccept_ddr), 
//                  .sid(), 
//                  .svalid(svalid_ddr), 
//                  .slast(slast_ddr), 
//                  .sdata(sdata_ddr), 
//                  .sresp(), 
//                  .awid(awid), 
//                  .awvalid(awvalid), 
//                  .awaddr(awaddr), 
//                  .awlen(awlen), 
//                  .awsize(awsize), 
//                  .awburst(awburst), 
//                  .awlock(awlock), 
//                  .awcache(awcache), 
//                  .awprot(awprot), 
//                  .wid(wid), 
//                  .wvalid(wvalid), 
//                  .wlast(wlast), 
//                  .wdata(wdata), 
//                  .wstrb(wstrb), 
//                  .bready(bready), 
//                  .arid(arid), 
//                  .arvalid(arvalid), 
//                  .araddr(araddr), 
//                  .arlen(arlen), 
//                  .arsize(arsize), 
//                  .arburst(arburst), 
//                  .arlock(arlock), 
//                  .arcache(arcache), 
//                  .arprot(arprot), 
//                  .rready(rready),   
//                  // Inputs
//                  .aclk(xclk), 
//                  .aresetn(xrst_n), 
//                  .gclken(1'b1), 
//                  .mid(mid_ddr), 
//                  .maddr(maddr_ddr), 
//                  .mread(mread_ddr), 
//                  .mwrite(mwrite_ddr), 
//                  .mlock(1'b0), 
//                  .mlen(mlen_ddr), 
//                  .msize(msize_ddr), 
//                  .mburst(mburst_ddr), 
//                  .mcache(4'b0000), 
//                  .mprot(3'b010), 
//                  .mdata(mdata_ddr), 
//                  .mwstrb(mwstrb_ddr), 
//                  .mready(mready_ddr), 
//                  .awready(awready), 
//                  .wready(wready), 
//                  .bid(bid), 
//                  .bvalid(bvalid), 
//                  .bresp(bresp), 
//                  .arready(arready), 
//                  .rid(rid), 
//                  .rvalid(rvalid), 
//                  .rlast(rlast), 
//                  .rdata(rdata), 
//                  .rresp(rresp)
//                  );
////- AXI X2X
//
//DW_axi_x2x 
//U_axi_x2x
//(
//  // MASTER PORT I/O
//  .aclk_m(xclk)
//                   ,.aresetn_m(xrst_n)
//                   ,// MP Write Address Channel 
//                   .awvalid_m(awvalid)
//                   ,.awaddr_m(awaddr)
//                   ,.awid_m(awid)
//                   ,.awlen_m(awlen)
//                   ,.awsize_m(awsize)
//                   ,.awburst_m(awburst)
//                   ,.awlock_m(awlock)
//                   ,.awcache_m(awcache)
//                   ,.awprot_m(awprot)
//                   ,.awready_m(awready)
//                   ,// MP Write Data Channel 
//                   .wvalid_m(wvalid)
//                   ,.wid_m(wid)
//                   ,.wdata_m(wdata)
//                   ,.wstrb_m(wstrb)
//                   ,.wlast_m(wlast)
//                   ,.wready_m(wready)
//                   ,// MP Write Response Channel
//                   .bvalid_m(bvalid)
//                   ,.bid_m(bid)
//                   ,.bresp_m(bresp)
//                   ,.bready_m(bready)
//                   ,// MP Read Address Channel
//                   .arvalid_m(arvalid)
//                   ,.arid_m(arid)
//                   ,.araddr_m(araddr)
//                   ,.arlen_m(arlen)
//                   ,.arsize_m(arsize)
//                   ,.arburst_m(arburst)
//                   ,.arlock_m(arlock)
//                   ,.arcache_m(arcache)
//                   ,.arprot_m(arprot)
//                   ,.arready_m(arready)
//                   ,// MP Read Data Channel
//                   .rvalid_m(rvalid)
//                   ,.rid_m(rid)
//                   ,.rdata_m(rdata)
//                   ,.rresp_m(rresp)
//                   ,.rlast_m(rlast)
//                   ,.rready_m(rready)
//                   ,// SLAVE PORT I/O
//                   .aclk_s(aclk_s)
//                   ,.aresetn_s(aresetn_s)
//                   ,// SP Write Address Channel 1
//                   .awvalid_s1(awvalid_m)
//                   ,.awaddr_s1(awaddr_m)
//                   ,.awid_s1(awid_m)
//                   ,.awlen_s1(awlen_m)
//                   ,.awsize_s1(awsize_m)
//                   ,.awburst_s1(awburst_m)
//                   ,.awlock_s1(awlock_m)
//                   ,.awcache_s1(awcache_m)
//                   ,.awprot_s1(awprot_m)
//                   ,.awready_s1(awready_s1)
//                   ,// SP Write Data Channel 1
//                   .wvalid_s1(wvalid_s1)
//                   ,.wid_s1(wid_s1)
//                   ,.wdata_s1(wdata_s1)
//                   ,.wstrb_s1(wstrb_s1)
//                   ,.wlast_s1(wlast_s1)
//                   ,.wready_s1(wready_s1)
//                   ,// SP Write Response Channel 1
//                   .bvalid_s1(bvalid_s1)
//                   ,.bid_s1(bid_s1)
//                   ,.bresp_s1(bresp_s1)
//                   ,.bready_s1(bready_s1)
//                   ,// SP Read Address Channel
//                   .arvalid_s(arvalid_s)
//                   ,.arid_s(arid_s)
//                   ,.araddr_s(araddr_s)
//                   ,.arlen_s(arlen_s)
//                   ,.arsize_s(arsize_s)
//                   ,.arburst_s(arburst_s)
//                   ,.arlock_s(arlock_s)
//                   ,.arcache_s(arcache_s)
//                   ,.arprot_s(arprot_s)
//                   ,.arready_in(arready_in)
//                   ,// SP Read Data Channel
//                   .rvalid_s(rvalid_s)
//                   ,.rid_s(rid_s)
//                   ,.rdata_s(rdata_s)
//                   ,.rresp_s(rresp_s)
//                   ,.rlast_s(rlast_s)
//                   ,.rready_s(rready_s)
//                   );
//
endmodule
