
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
// Filename    : DW_axi_x2x_bcm66.v
// Author      : Doug Lee       9/3/04
// Description : DW_axi_x2x_bcm66.v Verilog module for DWbb
//
// DesignWare IP ID: 6a0e29ae
//
////////////////////////////////////////////////////////////////////////////////



module bm_cpub_axi2top_DW_axi_x2x_bcm66(
		clk_push,
		rst_push_n,
		init_push_n,
		push_req_n,
		data_in,
		push_empty,
		push_ae,
		push_hf,
		push_af,
		push_full,
		push_error,
		push_word_count,

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
		data_out,

		test
		);

parameter WIDTH = 30;		// RANGE 1 to 256
parameter DEPTH = 1024;		// RANGE 4 to 256
parameter ADDR_WIDTH = 10;	// RANGE 2 to 8
parameter COUNT_WIDTH = 11;	// RANGE 3 to 9
parameter PUSH_AE_LVL = 2;	// RANGE 1 to 255
parameter PUSH_AF_LVL = 4;	// RANGE 1 to 255
parameter POP_AE_LVL = 3;	// RANGE 1 to 255
parameter POP_AF_LVL = 1022;	// RANGE 1 to 255
parameter ERR_MODE = 0;		// RANGE 0 to 1
parameter PUSH_SYNC = 2;	// RANGE 2 to 3
parameter POP_SYNC = 2;		// RANGE 2 to 3
parameter RST_MODE = 0;		// RANGE 0 to 1
parameter TST_MODE = 0;		// RANGE 0 to 1
   
`define DW_mem_depth   ((DEPTH == (1<<ADDR_WIDTH))? DEPTH : DEPTH + ((DEPTH & 1)? 1 : 2))

   input                       clk_push;	 // push domain clock input
   input                       rst_push_n;	 // push domain async. reset
   input                       init_push_n;	 // push domain sync. reset
   input                       push_req_n;	 // push domain push request
   input [WIDTH-1:0]	       data_in;		 // FIFO input data bus (push domain)
   output 		       push_empty;	 // push domain empty status flag
   output 		       push_ae; 	 // push domain almost empty status flag
   output 		       push_hf;		 // push domain half full status flag
   output 		       push_af;		 // push domain almost full status flag
   output 		       push_full;	 // push domain full status flag
   output 		       push_error;	 // push domain error status flag
   output [COUNT_WIDTH-1:0]    push_word_count;	 // push domain FIFO word count

   input                       clk_pop;		 // pop domain clock input
   input                       rst_pop_n;	 // pop domain async. reset
   input                       init_pop_n;	 // pop domain sync. reset
   input                       pop_req_n;	 // pop domain pop request
   output 		       pop_empty;	 // pop domain empty status flag
   output 		       pop_ae; 		 // pop domain almost empty status flag
   output 		       pop_hf;		 // pop domain half full status flag
   output 		       pop_af;		 // pop domain almost full status flag
   output 		       pop_full;	 // pop domain full status flag
   output 		       pop_error;	 // pop domain error status flag
   output [COUNT_WIDTH-1:0]    pop_word_count;	 // pop domain FIFO word count
   output [WIDTH-1:0]	       data_out;	 // FIFO input data bus (pop domain)

   input                       test;		 // scan test mode control input


wire [ADDR_WIDTH-1 : 0] wr_addr_int;
wire [ADDR_WIDTH-1 : 0] rd_addr_int;
wire [WIDTH-1 : 0]	pre_data_out;

wire we_n_int;
wire pop_empty_int;
wire a_mem_rst_n, s_mem_rst_n;
   
  
   assign a_mem_rst_n  = ((RST_MODE == 0) ? rst_push_n  : (1'b1));
   assign s_mem_rst_n  = ((RST_MODE == 0) ? init_push_n  : (1'b1));
   assign rst_ram_n    = a_mem_rst_n & s_mem_rst_n;
    // Instance of DW_axi_x2x_bcm07
   bm_cpub_axi2top_DW_axi_x2x_bcm07
    #( 
		       DEPTH, 
		       ADDR_WIDTH,
		       COUNT_WIDTH,
		       PUSH_AE_LVL,
		       PUSH_AF_LVL, 
		       POP_AE_LVL,
		       POP_AF_LVL,
		       ERR_MODE, 
		       PUSH_SYNC, 
		       POP_SYNC,  
		       TST_MODE
		       )
      U_FIFO_CTL ( 
	  .clk_push(clk_push), 
	  .rst_push_n(rst_push_n), 
	  .init_push_n(init_push_n), 
	  .push_req_n(push_req_n), 
	  .pop_req_n(pop_req_n), 
	  .push_empty(push_empty), 
	  .push_ae(push_ae),
	  .push_hf(push_hf), 
	  .push_af(push_af), 
	  .push_full(push_full), 
	  .push_error(push_error), 
	  .push_word_count(push_word_count),
	  .we_n(we_n_int),
	  .wr_addr(wr_addr_int), 

	  .clk_pop(clk_pop), 
	  .rst_pop_n(rst_pop_n), 
	  .init_pop_n(init_pop_n), 
	  .pop_empty(pop_empty_int), 
	  .pop_ae(pop_ae), 
	  .pop_hf(pop_hf), 
	  .pop_af(pop_af), 
	  .pop_full(pop_full), 
	  .pop_error(pop_error),
	  .pop_word_count(pop_word_count),
	  .rd_addr(rd_addr_int),

	  .test(test) );
/*
  parameter ASSERT_PREFIX = "";
  parameter BITS = 18;
  parameter WORDS = 1024;
  parameter MUX = 4;
  parameter MEM_WIDTH = 72; // redun block size 4, 36 on left, 36 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 1 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 0
 S40SPRF_NPU_1024X18
      #(
        .BITS(18)
        .WORDS(1024)
        )
     U_FIFO_MEM (
       .Q(pre_data_out), 
       .CLK(), 
       .CEN(), 
       .WEN(), 
       .A(), 
       .D(), 
       .EMA(), 
       .EMAW(), 
       .GWEN(), 
       .RET1N()
       );

*/
 S40DPRF_NPU_1024X30
         #(
        .BITS(30),
        .WORDS(1024)
         )
      U_FIFO_MEM  (
        .QA(pre_data_out), 
        .CLKA(clk_push), 
        .CENA(1'b0), 
        .AA(rd_addr_int),
        .CLKB(clk_push), 
        .CENB(we_n_int), 
        .AB(wr_addr_int), 
        .DB(data_in), 
        .EMAA(3'b010), 
        .EMAB(3'b010), 
        .RET1N(1'b1),
        .COLLDISN(1'b1) );
/*  commoned by xia 
     bm_cpub_axi2top_DW_axi_x2x_bcm57
      #(
			WIDTH, 
			`DW_mem_depth, 
			0,
			ADDR_WIDTH )
	   U_FIFO_MEM ( 
		.clk(clk_push), 
		.rst_n(a_mem_rst_n), 
		.init_n(s_mem_rst_n),
		.wr_n(we_n_int), 
	 	.data_in(data_in), 
		.rd_addr(rd_addr_int), 
		.wr_addr(wr_addr_int), 
	 	.data_out(pre_data_out) );
*/

    assign data_out = pre_data_out ;
    assign pop_empty = pop_empty_int;

`undef DW_mem_depth

endmodule
