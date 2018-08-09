
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
// Filename    : tb_fifo_ram.v
// Author      : Rick Kelly    April 26, 2004
// Description : tb_fifo_ram.v Verilog module for DWbb
//
// DesignWare IP ID: e2f0bec1
//
////////////////////////////////////////////////////////////////////////////////




  module tb_fifo_ram (
	clk,
	rst_n,
	init_n,
	wr_n,
	data_in,
	wr_addr,
        rd_addr,
	data_out
	);

   parameter DATA_WIDTH = 4;	// RANGE 1 to 256
   parameter DEPTH = 8;		// RANGE 2 to 256
   parameter MEM_MODE = 0;	// RANGE 0 to 3
   parameter ADDR_WIDTH = 3;	// RANGE 1 to 8

   input 			clk;		// clock input
   input 			rst_n;		// active low async. reset
   input 			init_n;		// active low sync. reset
   input 			wr_n;		// active low RAM write enable
   input [DATA_WIDTH-1:0]	data_in;	// RAM write data input bus
   input [ADDR_WIDTH-1:0]	wr_addr;	// RAM write address bus
   input [ADDR_WIDTH-1:0]	rd_addr;	// RAM read address bus

   output [DATA_WIDTH-1:0]	data_out;	// RAM read data output bus


`ifdef DWC_USE_1D_MEM_ARRAY
   reg [DEPTH*DATA_WIDTH-1:0]   next_mem;
   reg [DEPTH*DATA_WIDTH-1:0]   mem;
`else
   reg [DATA_WIDTH-1:0]		mem [0 : DEPTH-1];
`endif

   reg [ADDR_WIDTH-1:0]		wr_addr_pipe;
   reg				we_pipe;
   reg [DATA_WIDTH-1:0]		data_in_pipe;
   reg [ADDR_WIDTH-1:0]		rd_addr_pipe;
   reg [DATA_WIDTH-1:0]		data_out_pipe;

  wire [ADDR_WIDTH-1:0]		write_addr;
  wire				write_en_n;
  wire [DATA_WIDTH-1:0]		write_data;
  wire [ADDR_WIDTH-1:0]		read_addr;
  wire [DATA_WIDTH-1:0]		read_data;
   
`ifdef DWC_USE_1D_MEM_ARRAY
   
  function [DATA_WIDTH-1:0] func_read_mux ;
    input [DATA_WIDTH*DEPTH-1:0]	a;	// input bus
    input [ADDR_WIDTH-1:0]  	sel;	// select
    reg   [DATA_WIDTH-1:0]	z;
    // leda FM_2_35 off
    reg   [31:0]		i, j, k;
    // leda FM_2_35 on
    begin
      z = {DATA_WIDTH {1'b0}};
      k = 0;
      for (i=0 ; i<DEPTH ; i=i+1) begin
	if (i == sel) begin
	  for (j=0 ; j<DATA_WIDTH ; j=j+1) begin
	    z[j] = a[j + k];
	  end // for (j
	end // if
	k = k + DATA_WIDTH;
      end // for (i
      func_read_mux  = z;
    end
  endfunction

  assign read_data = func_read_mux ( mem, read_addr );



   always @ (mem or write_en_n or write_addr or write_data) begin : PROC_mk_next_mem
     integer i, j, k;
     next_mem = mem;

     k = 0;
     if ( write_en_n == 1'b0 ) begin
       for (i=0 ; i<DEPTH ; i=i+1) begin
	 if (write_addr == i) begin
	   for (j=0 ; j < DATA_WIDTH ; j=j+1) begin
	     next_mem[ k+j] = write_data[j];
	   end
	 end
	 k = k + DATA_WIDTH;
       end
     end
   end


  
  always @ (posedge clk or negedge rst_n) begin : PROC_mem_array_regs
    if (rst_n == 1'b0) begin
      mem <= {DATA_WIDTH*DEPTH{1'b0}};
    end else if (init_n == 1'b0) begin
      mem <= {DATA_WIDTH*DEPTH{1'b0}};
    end else begin
      mem <= next_mem;
    end
  end
`else
  // FM_2_22: Possible range overflow
  // Simulation will catch errors here if they exist.
  // leda FM_2_22 off
  assign read_data = mem[read_addr];
  // leda FM_2_22 on

  always @ (posedge clk or negedge rst_n) begin : PROC_mem_array_regs
    integer i;
    if (rst_n == 1'b0) begin
      for (i=0 ; i < DEPTH ; i=i+1)
	mem[i] <= {DATA_WIDTH{1'b0}};
    end else if (init_n == 1'b0) begin
      for (i=0 ; i < DEPTH ; i=i+1)
	mem[i] <= {DATA_WIDTH{1'b0}};
    end else begin
      if (write_en_n == 1'b0)
  // FM_2_22: Possible range overflow
  // Simulation will catch errors here if they exist.
  // leda FM_2_22 off
	mem[write_addr] <= write_data;
  // leda FM_2_22 on
    end
  end
`endif
  
  always @ (posedge clk or negedge rst_n) begin : PROC_retiming_regs
    if (rst_n == 1'b0) begin
      we_pipe <= 1'b0;
      wr_addr_pipe <= {ADDR_WIDTH{1'b0}};
      data_in_pipe <= {DATA_WIDTH{1'b0}};
      rd_addr_pipe <= {ADDR_WIDTH{1'b0}};
      data_out_pipe <= {DATA_WIDTH{1'b0}};
    end else if (init_n == 1'b0) begin
      we_pipe <= 1'b0;
      wr_addr_pipe <= {ADDR_WIDTH{1'b0}};
      data_in_pipe <= {DATA_WIDTH{1'b0}};
      rd_addr_pipe <= {ADDR_WIDTH{1'b0}};
      data_out_pipe <= {DATA_WIDTH{1'b0}};
    end else begin
      we_pipe <= wr_n;
      wr_addr_pipe <= wr_addr;
      data_in_pipe <= data_in;
      rd_addr_pipe <= rd_addr;
      data_out_pipe <= read_data;
    end
  end


  assign write_en_n = ((MEM_MODE & 2)==2)? we_pipe : wr_n;
  assign write_data = ((MEM_MODE & 2)==2)? data_in_pipe : data_in;
  assign write_addr = ((MEM_MODE & 2)==2)? wr_addr_pipe : wr_addr;
  assign read_addr  = ((MEM_MODE & 2)==2)? rd_addr_pipe : rd_addr;
  assign data_out = ((MEM_MODE & 1)==1)? data_out_pipe : read_data;
   
endmodule
