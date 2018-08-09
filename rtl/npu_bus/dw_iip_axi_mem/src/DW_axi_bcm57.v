
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
// Filename    : DW_axi_bcm57.v
// Author      : Rick Kelly    April 26, 2004
// Description : DW_axi_bcm57.v Verilog module for DWbb
//
// DesignWare IP ID: e2f0bec1
//
////////////////////////////////////////////////////////////////////////////////




  module DW_axi_bcm57 (
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


   reg [DATA_WIDTH-1:0]		mem [0 : DEPTH-1];

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
