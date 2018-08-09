
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
// Filename    : DW_axi_x2x_bcm07.v
// Author      : Vikas Gokhale       5/17/04
// Description : DW_axi_x2x_bcm07.v Verilog module for DWbb
//
// DesignWare IP ID: 45f8380d
//
////////////////////////////////////////////////////////////////////////////////



module x32_DW_axi_x2x_bcm07(
	clk_push,
	rst_push_n,
	init_push_n,
	push_req_n,
	push_empty,
	push_ae,
	push_hf,
	push_af,
	push_full,
	push_error,
	push_word_count,
	we_n,
	wr_addr,

	clk_pop,
	rst_pop_n,
	init_pop_n,
	pop_req_n,
	pop_empty,
	pop_ae,
	pop_hf,
	pop_af,
	pop_full,
	pop_error,
	pop_word_count,
	rd_addr,
	test
	);

parameter DEPTH		=  8;	// RANGE 4 to 16777216
parameter ADDR_WIDTH	=  3;	// RANGE 2 to 24
parameter COUNT_WIDTH	=  4;	// RANGE 3 to 25
parameter PUSH_AE_LVL	=  2;	// RANGE 1 to DEPTH-1
parameter PUSH_AF_LVL	=  2;	// RANGE 1 to DEPTH-1
parameter POP_AE_LVL	=  2;	// RANGE 1 to DEPTH-1
parameter POP_AF_LVL	=  2;	// RANGE 1 to DEPTH-1
parameter ERR_MODE	=  0;	// RANGE 0 to 1
parameter PUSH_SYNC	=  2;	// RANGE 1 to 3
parameter POP_SYNC	=  2;	// RANGE 1 to 3
parameter TST_MODE	=  0;	// RANGE 0 to 1
   
   

input  				clk_push;	// Push domain clk input
input  				rst_push_n;	// Push domain active low async reset
input  				init_push_n;	// Push domain active low sync reset
input  				push_req_n;	// Push domain active high push reqest
output 				push_empty;	// Push domain Empty status flag
output 				push_ae;	// Push domain Almost Empty status flag
output 				push_hf;	// Push domain Half full status flag
output 				push_af;	// Push domain Almost full status flag
output 				push_full;	// Push domain Full status flag
output 				push_error;	// Push domain Error status flag
output [COUNT_WIDTH-1 : 0]      push_word_count;// Push domain word count
output 				we_n;		// Push domain active low RAM write enable
output [ADDR_WIDTH-1 : 0]	wr_addr;	// Push domain RAM write address

input  				clk_pop;	// Pop domain clk input
input  				rst_pop_n;	// Pop domain active low async reset
input  				init_pop_n;	// Pop domain active low sync reset
input  				pop_req_n;	// Pop domain active high pop request
output 				pop_empty;	// Pop domain Empty status flag
output 				pop_ae;		// Pop domain Almost Empty status flag
output 				pop_hf;		// Pop domain Half full status flag
output 				pop_af;		// Pop domain Almost full status flag
output 				pop_full;	// Pop domain Full status flag
output 				pop_error;	// Pop domain Error status flag
output [COUNT_WIDTH-1 : 0]	pop_word_count;	// Pop domain word count
output [ADDR_WIDTH-1 : 0]	rd_addr;	// Pop domain RAM read address

input  				test;		// Scan test control input

wire [COUNT_WIDTH-1 : 0]        push_addr_g;

wire [COUNT_WIDTH-1 : 0]        pop_addr_g;

// Dummy wires - used to suppress unconnected ports warnings by Leda tool - BR - 2/23/2010
wire push_nen_unconn, push_nf_unconn, push_n_error_unconn; 
wire [COUNT_WIDTH-1:0] push_nwc_unconn; 
wire pop_nen_unconn, pop_nf_unconn, pop_n_error_unconn;
wire [COUNT_WIDTH-1:0] pop_nwc_unconn; 

  assign we_n = push_full | push_req_n;

x32_DW_axi_x2x_bcm05
 #(DEPTH, ADDR_WIDTH, COUNT_WIDTH, PUSH_AE_LVL,
    PUSH_AF_LVL, ERR_MODE, PUSH_SYNC, 1, TST_MODE) U_PUSH_FIFOFCTL(
  .clk(clk_push),
  .rst_n(rst_push_n),
  .init_n(init_push_n),
  .inc_req_n(push_req_n),
  .other_addr_g(pop_addr_g),
  .word_count(push_word_count),
  .empty(push_empty),
  .almost_empty(push_ae),
  .half_full(push_hf),
  .almost_full(push_af),
  .full(push_full),
  .error(push_error),
  .this_addr(wr_addr),
  .this_addr_g(push_addr_g),
  .next_word_count(push_nwc_unconn),
  .next_empty_n(push_nen_unconn),
  .next_full(push_nf_unconn),
  .next_error(push_n_error_unconn),
  .test(test)
  );

x32_DW_axi_x2x_bcm05
 #(DEPTH, ADDR_WIDTH, COUNT_WIDTH, POP_AE_LVL,
    POP_AF_LVL, ERR_MODE, POP_SYNC, 0, TST_MODE) U_POP_FIFOFCTL(
  .clk(clk_pop),
  .rst_n(rst_pop_n),
  .init_n(init_pop_n),
  .inc_req_n(pop_req_n),
  .other_addr_g(push_addr_g),
  .word_count(pop_word_count),
  .empty(pop_empty),
  .almost_empty(pop_ae),
  .half_full(pop_hf),
  .almost_full(pop_af),
  .full(pop_full),
  .error(pop_error),
  .this_addr(rd_addr),
  .this_addr_g(pop_addr_g),
  .next_word_count(pop_nwc_unconn),
  .next_empty_n(pop_nen_unconn),
  .next_full(pop_nf_unconn),
  .next_error(pop_n_error_unconn),
  .test(test)
  );

endmodule
