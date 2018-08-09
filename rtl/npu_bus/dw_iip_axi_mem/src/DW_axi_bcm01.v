
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
// Filename    : DW_axi_bcm01.v
// Author      : Rick Kelly     May 18, 2004
// Description : DW_axi_bcm01.v Verilog module for DWbb
//
// DesignWare IP ID: 84d7966e
//
////////////////////////////////////////////////////////////////////////////////

  module DW_axi_bcm01 (
      // Inputs
	a,
	tc,
	min_max,
      // Outputs
	value,
	index
);

parameter WIDTH = 		4;	// element WIDTH
parameter NUM_INPUTS = 		8;	// number of elements in input array
parameter INDEX_WIDTH = 	3;	// size of index pointer = ceil(log2(NUM_INPUTS))


input  [NUM_INPUTS*WIDTH-1 : 0]		a;	// Concatenated input vector
input					tc;	// 0 = unsigned, 1 = signed
input					min_max;// 0 = find min, 1 = find max
output [WIDTH-1:0]			value;	// mon or max value found
output [INDEX_WIDTH-1:0]		index;	// index to value found

  DW_minmax #(WIDTH,NUM_INPUTS) U1(
	.a(a),
	.tc(tc),
	.min_max(min_max),
	.value(value),
	.index(index) );


endmodule
