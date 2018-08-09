
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
// Filename    : DW_axi_x2x_bcm05.v
// Author      : Vikas Gokhale       5/17/04
// Description : DW_axi_x2x_bcm05.v Verilog module for DWbb
//
// DesignWare IP ID: 30a2d424
//
////////////////////////////////////////////////////////////////////////////////



module DW_axi_x2x_bcm05(
	clk,
	rst_n,
	init_n,
	inc_req_n,
	other_addr_g,
	word_count,
	empty,
	almost_empty,
	half_full,
	almost_full,
	full,
	error,
	this_addr,
	this_addr_g,
	next_word_count,
	next_empty_n,
	next_full,
	next_error,

	test
	);

parameter DEPTH		=  8;	// RANGE 4 to 16777216
parameter ADDR_WIDTH	=  3;	// RANGE 2 to 24
parameter COUNT_WIDTH	=  4;	// RANGE 3 to 25
parameter AE_LVL	=  2;	// RANGE 1 to DEPTH-1
parameter AF_LVL	=  2;	// RANGE 1 to DEPTH-1
parameter ERR_MODE	=  0;	// RANGE 0 to 1
parameter SYNC_DEPTH	=  2;	// RANGE 1 to 3
parameter IO_MODE	=  1;	// RANGE 0 to 1
parameter TST_MODE	=  0;	// RANGE 0 to 1
   

input  				      clk;		// clock inptu
input  				      rst_n;		// active low async reset
input  				      init_n;		// active low sync. reset
input  				      inc_req_n;	// active high request to advance
input  [COUNT_WIDTH-1 : 0]	      other_addr_g;	// Gray pointer form oppos. I/F
output [COUNT_WIDTH-1 : 0]	      word_count;	// Local word count output
output 				      empty;		// Empty status flag
output 				      almost_empty;	// Almost Empty status flag
output 				      half_full;	// Half full status flag
output 				      almost_full;	// Almost full status flag
output 				      full;		// Full status flag
output 				      error;		// Error status flag
output [ADDR_WIDTH-1 : 0]	      this_addr;	// Local RAM address
output [COUNT_WIDTH-1 : 0]	      this_addr_g;	// Gray coded pointer to other domain
output [COUNT_WIDTH-1 : 0]	      next_word_count;	// Look ahead word count
output 				      next_empty_n;	// Look ahead empty flag (active low)
output 				      next_full;	// Look ahead full flag
output 				      next_error;	// Look ahead error flag

input  				      test;		// Scan test control input

wire [COUNT_WIDTH-1 : 0]              a_empty_vector;
wire [COUNT_WIDTH-1 : 0]              a_full_vector;
wire [COUNT_WIDTH-1 : 0]              hlf_full_vector;
wire [COUNT_WIDTH-1 : 0]              full_count_bus;
wire [COUNT_WIDTH-1 : 0]              bus_low;
wire [COUNT_WIDTH-1 : 0]              residual_value_bus;
wire [COUNT_WIDTH-1 : 0]              offset_residual_bus;
wire [COUNT_WIDTH-1 : 0]              start_value_bus;
wire [COUNT_WIDTH-1 : 0]              end_value_bus;
wire [COUNT_WIDTH-1 : 0]              start_value_gray_bus;

wire                                  tie_low;
wire                                  tie_high;
wire [COUNT_WIDTH-1 : 0]              next_count_int;
wire [ADDR_WIDTH-1 : 0]               next_this_addr_int;
wire [COUNT_WIDTH-1 : 0]              next_this_addr_g_int;
wire                                  next_empty_int;
wire                                  next_almost_empty_int;
wire                                  next_half_full_int;
wire                                  next_almost_full_int;
wire                                  next_full_int;

wire                                  next_almost_empty;
wire                                  next_half_full;
wire                                  next_almost_full;
wire                                  error_seen;
wire                                  next_error_int;

wire [COUNT_WIDTH-1 : 0]              count;

wire                                  next_empty;

wire [COUNT_WIDTH-1 : 0]              sync;
wire [COUNT_WIDTH-1 : 0]              other_addr_g_sync;

wire [COUNT_WIDTH-1 : 0]              next_this_addr_g;
wire [COUNT_WIDTH-1 : 0]              other_addr_decoded;

wire                                  advance;
wire [COUNT_WIDTH-1 : 0]              succesive_count;
wire [ADDR_WIDTH-1 : 0]               succesive_addr;

wire [COUNT_WIDTH-1 : 0]              advanced_count;
reg  [COUNT_WIDTH-1 : 0]              next_word_count_int;
wire [ADDR_WIDTH-1 : 0]               next_this_addr;

wire [COUNT_WIDTH : 0]                temp1;

wire [COUNT_WIDTH-1 : 0]              wrd_count_p1;

wire [COUNT_WIDTH-1 : 0]              wr_addr;
wire [COUNT_WIDTH-1 : 0]              rd_addr;

wire                                  at_end;
wire                                  at_end_n;

reg [COUNT_WIDTH-1 : 0]               count_int;
reg [ADDR_WIDTH-1 : 0]                this_addr_int;
reg [COUNT_WIDTH-1 : 0]               this_addr_g_int;
reg [COUNT_WIDTH-1 : 0]               word_count_int;
 
reg                                   empty_int;
reg                                   almost_empty_int;
reg                                   half_full_int;
reg                                   almost_full_int;
reg                                   full_int;
reg                                   error_int;

reg [COUNT_WIDTH-1 : 0]               this_addr_g_ltch;


  assign a_empty_vector        = AE_LVL;
  assign hlf_full_vector       = ((DEPTH  +  1)/ 2);
  assign a_full_vector         = (DEPTH  - AF_LVL);
  assign full_count_bus        = DEPTH;
  assign bus_low               = {COUNT_WIDTH{1'b0}};
  assign residual_value_bus    = ((1 << COUNT_WIDTH) - ((DEPTH == (1 << (COUNT_WIDTH - 1)))? (DEPTH * 2) : 
                           ((DEPTH + 2) - (DEPTH & 1))));
  assign offset_residual_bus   = ((((((1 << COUNT_WIDTH) - ((DEPTH == (1 << (COUNT_WIDTH - 1)))? (DEPTH * 2) : 
                           ((DEPTH + 2) - (DEPTH & 1)))))/2)));
  assign start_value_bus       = (((((1 << COUNT_WIDTH) - ((DEPTH == (1 << (COUNT_WIDTH - 1)))? (DEPTH * 2) : 
                           ((DEPTH + 2) - (DEPTH & 1)))))/2));
  assign end_value_bus         = (((1 << COUNT_WIDTH) -  1 - (((((1 << COUNT_WIDTH) - ((DEPTH == (1 << (COUNT_WIDTH - 1)))? (DEPTH * 2) : 
                           ((DEPTH + 2) - (DEPTH & 1)))))/2))));
  assign start_value_gray_bus  = (start_value_bus  ^ (start_value_bus >> 1));
 
  assign tie_low               = 1'b0;
  assign tie_high              = 1'b1;

  assign next_almost_empty     = (next_word_count_int <= a_empty_vector) ? 1'b1 : 1'b0;
  assign next_half_full        = (next_word_count_int >= hlf_full_vector) ? 1'b1 : 1'b0; 
  assign next_almost_full      = (next_word_count_int >= a_full_vector) ? 1'b1 : 1'b0; 
  assign next_empty            = (next_word_count_int == bus_low) ? 1'b1 : 1'b0; 
  assign next_full_int         = (next_word_count_int == full_count_bus) ? 1'b1 : 1'b0; 

  assign error_seen            = !inc_req_n && at_end;
  assign next_error_int        = (ERR_MODE == 0) ? (error_seen || error_int) : error_seen;

  assign next_count_int        = advanced_count ^ start_value_bus;
  assign next_this_addr_int    = next_this_addr;
  assign next_this_addr_g_int  = next_this_addr_g ^ start_value_gray_bus;
  assign next_empty_int        = ~next_empty;
  assign next_almost_empty_int = ~next_almost_empty;
  assign next_half_full_int    = next_half_full;
  assign next_almost_full_int  = next_almost_full;
 
  // NTL_CLK05: Data must be registered by 2 or more flipflops when
  // crossing clock domain
  // This leda error is firing because we have a path from the fifo data
  // out, back to the pop input. In the case of the X2X, this can happen
  // where we look at the size of the t/x before deciding if we pop now
  // or later, when last downsized t/x has been sent for example.
  // Looking at the RTL, all conditions that pop the fifo are gated by
  // fifo empty.
  // leda NTL_CLK05 off
  always @ (posedge clk or negedge rst_n) begin
     if (!rst_n) begin
       count_int <= {COUNT_WIDTH{1'b0}};
       this_addr_int <= {ADDR_WIDTH{1'b0}};
       this_addr_g_int <= {COUNT_WIDTH{1'b0}};
       word_count_int <= {COUNT_WIDTH{1'b0}};
       empty_int <= 1'b0;
       almost_empty_int <= 1'b0;
       half_full_int <= 1'b0;
       almost_full_int <= 1'b0;
       full_int <= 1'b0;
       error_int <= 1'b0;
     end else if (!init_n) begin
       count_int <= {COUNT_WIDTH{1'b0}};
       this_addr_int <= {ADDR_WIDTH{1'b0}};
       this_addr_g_int <= {COUNT_WIDTH{1'b0}};
       word_count_int <= {COUNT_WIDTH{1'b0}};
       empty_int <= 1'b0;
       almost_empty_int <= 1'b0;
       half_full_int <= 1'b0;
       almost_full_int <= 1'b0;
       full_int <= 1'b0;
       error_int <= 1'b0;
     end else begin
       count_int <= next_count_int ;
       this_addr_int <= next_this_addr_int ;
       this_addr_g_int <= next_this_addr_g_int ;
       word_count_int <= next_word_count_int ;
       empty_int <= next_empty_int;
       almost_empty_int <= next_almost_empty_int;
       half_full_int <= next_half_full_int;
       almost_full_int <= next_almost_full_int;
       full_int <= next_full_int;
       error_int <= next_error_int;
     end
    end
  // leda NTL_CLK05 on

  assign this_addr          = ((1<<COUNT_WIDTH) != (DEPTH*2)) ?
                              this_addr_int :
                              count;

  assign other_addr_g_sync  = sync ^ start_value_gray_bus;

  assign count              = count_int ^ start_value_bus;
  assign word_count         = word_count_int;

  assign empty              = ~empty_int;
  assign almost_empty       = ~almost_empty_int;
  assign half_full          = half_full_int;
  assign almost_full        = almost_full_int;
  assign full               = full_int;
  assign error              = error_int;

  assign at_end             = (IO_MODE == 1) ? full_int : ~empty_int;
  assign at_end_n           = (IO_MODE == 1) ? ~full_int : empty_int;

  assign next_word_count    = init_n ? next_word_count_int : ({(COUNT_WIDTH-1){1'b0}});
  assign next_empty_n       = ~next_empty && init_n;
  assign next_full          = next_full_int && init_n;
  assign next_error         = next_error_int && init_n;


  DW_axi_x2x_bcm21
   #(COUNT_WIDTH, SYNC_DEPTH, TST_MODE, 1) U_sync(
    .clk_d(clk),
    .rst_d_n(rst_n),
    .init_d_n(init_n),
    .data_s(other_addr_g),
    .test(test),
    .data_d(sync) );

  
  function [COUNT_WIDTH-1:0] func_bin2gray ;
    input [COUNT_WIDTH-1:0]		B;	// input
    begin 
      func_bin2gray  = B ^ { 1'b0, B[COUNT_WIDTH-1 : 1] }; 
    end
  endfunction

  assign next_this_addr_g = func_bin2gray (advanced_count);

  
  function [COUNT_WIDTH-1:0] func_gray2bin ;
    input [COUNT_WIDTH-1:0]		G;	// input
    reg   [COUNT_WIDTH-1:0]		b;
    reg   [31:0]		i;
    begin 
      b = {G[COUNT_WIDTH-1], {COUNT_WIDTH-1{1'b0}}};
      for (i=0 ; i<(COUNT_WIDTH-1) ; i=i+1) begin
	b [COUNT_WIDTH - 2 - i] = G[COUNT_WIDTH - 2 - i] ^ b [COUNT_WIDTH - 1 - i];
      end // for (i
      func_gray2bin  = b; 
    end
  endfunction

  assign other_addr_decoded = func_gray2bin (other_addr_g_sync);
 
  assign advance            = ~inc_req_n && ~at_end;

  assign succesive_count = ((((1 << COUNT_WIDTH) - DEPTH) == DEPTH) || (this_addr_int != ((DEPTH == (1 << (COUNT_WIDTH - 1)))? (DEPTH * 2) : 
                           ((DEPTH + 2) - (DEPTH & 1)))-1))? count+1 : start_value_bus;
  assign succesive_addr  = ((((1 << COUNT_WIDTH) - DEPTH) == DEPTH) || (this_addr_int != ((DEPTH == (1 << (COUNT_WIDTH - 1)))? (DEPTH * 2) : 
                           ((DEPTH + 2) - (DEPTH & 1)))-1))? this_addr_int+1 : {ADDR_WIDTH{1'b0}};

  assign advanced_count = (advance == 1'b1)? succesive_count : count;
  assign next_this_addr = (advance == 1'b1)? succesive_addr : this_addr_int;

  assign temp1              = wr_addr - rd_addr;
  assign wrd_count_p1       = temp1[COUNT_WIDTH-1 : 0];

  always @(wrd_count_p1 or residual_value_bus or rd_addr or wr_addr) begin
    if ((1<<COUNT_WIDTH) != (DEPTH*2)) begin
      if (rd_addr > wr_addr)
        next_word_count_int = wrd_count_p1 - residual_value_bus;
      else
        next_word_count_int = wrd_count_p1;
    end else begin
      next_word_count_int = wrd_count_p1;
    end
  end

  assign rd_addr        = (IO_MODE == 1) ? other_addr_decoded : advanced_count;
  assign wr_addr        = (IO_MODE == 1) ? advanced_count : other_addr_decoded;

  assign this_addr_g = ((TST_MODE == 2) ?
                        ((test == 1'b1) ? this_addr_g_ltch : this_addr_g_int) :
                        this_addr_g_int);
   always @(clk or this_addr_g_int) begin : PROC_scan_capture_hold_latch
    // Test latch, more supressions required, STAR 9000405061 filed
    // DFT_021: Latch inferred for this_addr_g_ltch(0 to 3)
    // W410: Latch inferred for this_addr_g_ltch(0 to 3)
    // leda DFT_021 off
    // leda W410 off
    // leda S_4C_R off
    // leda CS_5P_R_A off
    if (clk == 1'b0)
      this_addr_g_ltch <= this_addr_g_int;
    // leda CS_5P_R_A on
    // leda S_4C_R on
    // leda DFT_021 on
    // leda W410 on
   end // PROC_scan_capture_hold_latch

endmodule
