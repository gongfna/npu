
////////////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2004 - 2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// Filename    : DW_axi_gs_bcm06.v
// Author      : Rick Kelly         4/14/04
// Description : DW_axi_gs_bcm06.v Verilog module for DWbb
//
// DesignWare IP ID: 33a0015d
//
////////////////////////////////////////////////////////////////////////////////

module g512_DW_axi_gs_bcm06 (
    clk,
    rst_n,
    init_n,
    push_req_n,
    pop_req_n,
    diag_n,
    ae_level,
    af_thresh,
    we_n,
    empty,
    almost_empty,
    half_full,
    almost_full,
    full,
    error,
    wr_addr,
    rd_addr,
    wrd_count,
    nxt_empty_n,
    nxt_full,
    nxt_error
    );

parameter DEPTH  = 4;		// RANGE 2 to 16777216
parameter ERR_MODE  =  0 ;	// RANGE 0 to 2
parameter ADDR_WIDTH = 2;	// RANGE 1 to 24

input			clk;		// Input Clock (pos edge)
input			rst_n;		// Async reset (active low)
input			init_n;		// Sync reset (active low) (FIFO clear/flush)
input			push_req_n;	// Push request (active low)
input			pop_req_n;	// Pop Request (active low)
input			diag_n;		// Diagnostic sync. reset rd_addr (active low)
input  [ADDR_WIDTH-1:0]	ae_level;	// Almost empty level input bus
input  [ADDR_WIDTH-1:0]	af_thresh;	// Almost full threshold input bus
output			we_n;		// RAM Write Enable output (active low)
output			empty;		// FIFO Empty flag output (active high)
output			almost_empty;	// FIFO Almost Empty flag output (active high)
output			half_full;	// FIFO Half Full flag output (active high)
output			almost_full;	// FIFO almost Full flag output (active high)
output			full;		// FIFO full flag output (active high)
output			error;		// FIFO Error flag output (active high)
output [ADDR_WIDTH-1:0]	wr_addr;	// RAM Write Address output bus
output [ADDR_WIDTH-1:0]	rd_addr;	// RAM Read Address output bus
output [ADDR_WIDTH-1:0]	wrd_count;	// Words in FIFO (not always accurate at full)
output			nxt_empty_n;	// Look ahead empty flag (active low)
output			nxt_full;	// Look ahead full flag
output			nxt_error;	// Look ahead empty flag


wire			next_empty_n;
reg			empty_n;
wire			next_almost_empty_n;
reg			almost_empty_n;
wire			next_half_full;
reg			half_full_int;
wire			next_almost_full;
reg			almost_full_int;
wire			next_full;
reg			full_int;
wire			next_error;
reg			error_int;
wire   [ADDR_WIDTH-1:0]	next_wr_addr;
reg    [ADDR_WIDTH-1:0]	wr_addr_int;
wire			next_wr_addr_at_max;
reg			wr_addr_at_max;
wire   [ADDR_WIDTH-1:0]	next_rd_addr;
reg    [ADDR_WIDTH-1:0]	rd_addr_int;
wire			next_rd_addr_at_max;
reg			rd_addr_at_max;
wire   [ADDR_WIDTH-1:0]	next_word_count;
reg    [ADDR_WIDTH-1:0]	word_count;
reg    [ADDR_WIDTH-1:0]	advanced_word_count;

wire			advance_wr_addr;
wire   [ADDR_WIDTH:0]	advanced_wr_addr;
wire			advance_rd_addr;
wire   [ADDR_WIDTH:0]	advanced_rd_addr;
wire			inc_word_count;
wire			dec_word_count;

// N_10P_R_D: Use lower case for net name
// leda N_10P_R_D off
wire [31:0]	LastAddress;
wire [31:0]	AE_level_val;
wire [31:0]	HF_thresh_val;
wire [31:0]	AF_thresh_val;
// leda N_10P_R_D on


  assign LastAddress   =  DEPTH - 1;
  assign AE_level_val  =  ae_level;
  assign HF_thresh_val = (DEPTH + 1)/2;
  assign AF_thresh_val =  af_thresh;

  assign we_n = push_req_n | (full_int & pop_req_n);


  assign advance_wr_addr = ~(push_req_n | (full_int & pop_req_n));

  assign advance_rd_addr = ~pop_req_n  & empty_n;


  assign advanced_wr_addr = {wr_addr_int,advance_wr_addr} + 1;
  assign next_wr_addr = (wr_addr_at_max  &advance_wr_addr)?
				{ADDR_WIDTH{1'b0}} :
				advanced_wr_addr[ADDR_WIDTH:1];

  assign advanced_rd_addr = {rd_addr_int,advance_rd_addr} + 1;
  assign next_rd_addr = ((rd_addr_at_max & advance_rd_addr) ||
			    ((diag_n==1'b0)&&(ERR_MODE == 0)))?
				{ADDR_WIDTH{1'b0}} :
				advanced_rd_addr[ADDR_WIDTH:1];


  assign next_rd_addr_at_max = ((next_rd_addr & LastAddress[ADDR_WIDTH-1:0]) == LastAddress[ADDR_WIDTH-1:0])? 1'b1 : 1'b0;

  assign next_wr_addr_at_max = ((next_wr_addr & LastAddress[ADDR_WIDTH-1:0]) == LastAddress[ADDR_WIDTH-1:0])? 1'b1 : 1'b0;

  assign inc_word_count = ~push_req_n & pop_req_n & ~full_int |
			  ~push_req_n & ~empty_n;

  assign dec_word_count = push_req_n & ~pop_req_n & empty_n;

  always @ (word_count or dec_word_count) begin : PROC_infer_incdec
    if (dec_word_count)
      advanced_word_count = word_count - 1;
    else
      advanced_word_count = word_count + 1;
  end

  assign next_word_count = ((inc_word_count | dec_word_count) == 1'b0)?
				word_count : advanced_word_count;

  assign next_full =	((word_count == LastAddress[ADDR_WIDTH-1:0])? ~push_req_n & pop_req_n : 1'b0) |
			(full_int & push_req_n & pop_req_n) |
			(full_int & ~push_req_n);

  assign next_empty_n = (next_word_count == {ADDR_WIDTH{1'b0}})? next_full : 1'b1;


  assign next_half_full = (next_word_count >= HF_thresh_val[ADDR_WIDTH-1:0])? 1'b1 : next_full;


  assign next_almost_empty_n = ~(((next_word_count <= AE_level_val[ADDR_WIDTH-1:0])? 1'b1 : 1'b0) &
				((1<<ADDR_WIDTH == DEPTH)? ~next_full : 1'b1)) ;


  assign next_almost_full = (next_word_count >= AF_thresh_val[ADDR_WIDTH-1:0])? 1'b1 :
				next_full;


  assign next_error = (~pop_req_n & ~empty_n) |
			(~push_req_n & pop_req_n & full_int) |
			((ERR_MODE==0)? ((|(wr_addr_int ^ rd_addr_int)) ^ (empty_n & ~full_int)) : 1'b0) |
			((ERR_MODE==2)? 1'b0 : error_int);


  always @ (posedge clk or negedge rst_n) begin : PROC_registers
    if (rst_n == 1'b0) begin
      empty_n          <= 1'b0;
      almost_empty_n   <= 1'b0;
      half_full_int    <= 1'b0;
      almost_full_int  <= 1'b0;
      full_int         <= 1'b0;
      error_int        <= 1'b0;
      wr_addr_int      <= {ADDR_WIDTH{1'b0}};
      rd_addr_at_max   <= 1'b0;
      wr_addr_at_max   <= 1'b0;
      rd_addr_int      <= {ADDR_WIDTH{1'b0}};
      word_count       <= {ADDR_WIDTH{1'b0}};
    end else if (init_n == 1'b0) begin
      empty_n          <= 1'b0;
      almost_empty_n   <= 1'b0;
      half_full_int    <= 1'b0;
      almost_full_int  <= 1'b0;
      full_int         <= 1'b0;
      error_int        <= 1'b0;
      rd_addr_at_max   <= 1'b0;
      wr_addr_at_max   <= 1'b0;
      wr_addr_int      <= {ADDR_WIDTH{1'b0}};
      rd_addr_int      <= {ADDR_WIDTH{1'b0}};
      word_count       <= {ADDR_WIDTH{1'b0}};
    end else begin
      empty_n          <= next_empty_n;
      almost_empty_n   <= next_almost_empty_n;
      half_full_int    <= next_half_full;
      almost_full_int  <= next_almost_full;
      full_int         <= next_full;
      error_int        <= next_error;
      rd_addr_at_max   <= next_rd_addr_at_max;
      wr_addr_at_max   <= next_wr_addr_at_max;
      wr_addr_int      <= next_wr_addr;
      rd_addr_int      <= next_rd_addr;
      word_count       <= next_word_count;
    end
  end

  assign empty = ~empty_n;
  assign almost_empty = ~almost_empty_n;
  assign half_full = half_full_int;
  assign almost_full = almost_full_int;
  assign full = full_int;
  assign error = error_int;
  assign wr_addr = wr_addr_int;
  assign rd_addr = rd_addr_int;
  assign wrd_count = word_count;
  assign nxt_empty_n = next_empty_n | ~init_n;
  assign nxt_full    = next_full    &  init_n;
  assign nxt_error   = next_error   &  init_n;

endmodule

