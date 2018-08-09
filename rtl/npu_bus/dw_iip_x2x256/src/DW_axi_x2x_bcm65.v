
////////////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2004  - 2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// Filename    : DW_axi_x2x_bcm65.v
// Author      : ALS         04/28/04
// Description : DW_axi_x2x_bcm65.v Verilog module for DWbb
//
// DesignWare IP ID: 15e30698
//
////////////////////////////////////////////////////////////////////////////////


module x256_DW_axi_x2x_bcm65 
    (clk, rst_n, init_n, push_req_n, pop_req_n, diag_n, data_in, empty, 
    almost_empty, half_full, almost_full, full, error, data_out
    );
parameter WIDTH  = 8;                   // RANGE 1 TO 256
parameter DEPTH  = 4;                   // RANGE 2 TO 256
parameter AE_LEVEL = 1;                 // RANGE 0 TO 255
parameter AF_LEVEL = 1;                 // RANGE 0 TO 255
parameter ERR_MODE  =  0 ;              // RANGE 0 TO 2
parameter RST_MODE  =  0 ;              // RANGE 0 TO 1
parameter ADDR_WIDTH = 2 ;              // RANGE 1 TO 8

 input			clk;		// clock input
 input			rst_n;		// active low async. reset
 input			init_n;		// active low sync. reset (FIFO flush)
 input			push_req_n;	// active low push request
 input			pop_req_n;	// active low pop request
 input			diag_n;		// active low diagnostic input
 input [WIDTH-1 : 0]	data_in;	// FIFO input data bus
 output			empty;		// empty status flag
 output			almost_empty;	// almost empty status flag
 output			half_full;	// half full status flag
 output			almost_full;	// almost full status flag
 output			full;		// full status flag
 output			error;		// error status flag
 output [WIDTH-1 : 0 ]  data_out;	// FIFO outptu data bus

 wire                ram_async_rst_n, ram_sync_rst_n;
 wire [ADDR_WIDTH-1 : 0] ram_rd_addr, ram_wr_addr;
 wire [31:00] ae_level_i;
 wire [31:00] af_thresh_i; 
 wire ram_we_n;
    
// Dummy wires - used to suppress unconnected ports warnings by Leda tool - BR - 2/24/2010
 wire nen_unconn, nf_unconn, n_error_unconn; 
 wire [ADDR_WIDTH-1:0] wc_unconn;
   
  assign ae_level_i = AE_LEVEL;
  assign af_thresh_i = DEPTH - AF_LEVEL; 

  assign ram_async_rst_n = (RST_MODE == 0) ? rst_n : 1'b1;
  assign ram_sync_rst_n  = (RST_MODE == 0) ? init_n : 1'b1;
  

  x256_DW_axi_x2x_bcm06
   #(DEPTH, ERR_MODE, ADDR_WIDTH) U_FIFO_CTL(
			.clk(clk),
			.rst_n(rst_n),
                        .init_n(init_n),
			.push_req_n(push_req_n),
			.pop_req_n(pop_req_n),
            		.ae_level(ae_level_i[ADDR_WIDTH-1:0]),
            		.af_thresh(af_thresh_i[ADDR_WIDTH-1:0]),
			.diag_n(diag_n),
			.empty(empty),
			.almost_empty(almost_empty),
			.half_full(half_full),
			.almost_full(almost_full),
			.full(full),
			.error(error),
			.we_n(ram_we_n),
			.wr_addr(ram_wr_addr),
			.rd_addr(ram_rd_addr),
			.wrd_count(wc_unconn),
			.nxt_empty_n(nen_unconn),
			.nxt_full(nf_unconn),
			.nxt_error(n_error_unconn)
			);
    
  x256_DW_axi_x2x_bcm57
   #(WIDTH, DEPTH, 0, ADDR_WIDTH) U_FIFO_MEM( 
			.clk(clk),
			.rst_n(ram_async_rst_n),
                        .init_n(ram_sync_rst_n),                                       
			.wr_n(ram_we_n),
			.rd_addr(ram_rd_addr),
			.wr_addr(ram_wr_addr),
			.data_in(data_in),
			.data_out(data_out)
			);


endmodule
