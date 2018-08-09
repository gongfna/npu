// ---------------------------------------------------------------------
//
//                   (C) COPYRIGHT 2005-2011 SYNOPSYS INC.
//                             ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys Inc.  Your use or disclosure of this software
//  is subject to the terms and conditions of a written license agreement
//  between you or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// -------------------------------------------------------------------------
//
// AUTHOR:    James Feagans      2/10/2005
//
// VERSION:   DW_axi_gs_fifo Verilog Synthesis Model
//
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
// ABSTRACT:  FIFO with valid/ready, depth 0, signal feedthrough.
//
// Features:
//   1. Valid/ready signal interface
//   2. Configurable direct valid/data feedthrough:
//        e.g. if (direct_vld)
//               dst_data = (empty) ? src_data: memory;
//             else
//               dst_data = memory;
//   3. Configurable direct ready feedthrough:
//        e.g. if (direct_rdy)
//               src_rdy = !full | dst_rdy;
//             else
//               src_rdy = !full;
//   4. Zero register stage configuration (depth = 0) available if
//        (direct_vld & direct_rdy)
//        
//-----------------------------------------------------------------------------
module g256_DW_axi_gs_fifo(

  // Global
  clk,        // Clock, positive edge
  clk_en,     // Clock enable for quasi-synchronous clocking mode
  rst_n,      // Reset, active low

  // Source Interface
  src_data,   // Input data
  src_vld,    // Source indicates valid input data is available
  src_rdy,    // FIFO indicates ready to accept data

  // Destination Interface
  dst_data,   // Output data
  dst_vld,    // FIFO indicates valid output data is available
  dst_rdy     // Destination indicates ready to accept data

);

// ----------------------------------------------------------------------------
// PARAMETERS
// ----------------------------------------------------------------------------

// The width and depth parameters are specified by the user upon component
// instantiation. They are set by default to the following values:
parameter width = 8;       // RANGE 1 to 255
parameter depth = 4;       // RANGE 0 to 255

// if (direct_vld == 0) {
//   dst_vld = !empty;
//   data and valid arrive in minimum of one clock cycle
//   requirement: depth >= 1
// }
// else {
//   dst_vld = !empty | src_vld;
//   data and valid arrive in same clock cycle when empty
//   requirement: depth >= 0
// {
parameter direct_vld = 0; // RANGE 0 to 1

// if (direct_rdy == 0) {
//   src_rdy = !full;
//   pushing when full not allowed
//   requirement: depth >= 1 (depth >= 2 for maximum throughput)
// }
// else {
//   src_rdy = !full | dst_rdy;
//   pushing when full allowed
//   requirement: depth >= 0
// {
parameter direct_rdy = 0;  // RANGE 0 to 1


// The addr_width parameter is automatically set based on the depth parameter.
// It used to specify the select line bit width for the flip-flop memory
// bank multiplexer.
parameter addr_width = ((depth>16)?((depth>64)?((depth>128)?8:7):
  ((depth>32)?6:5)):((depth>4)?((depth>8)?4:3):((depth>2)?2:1)));


// ----------------------------------------------------------------------------
// PORTS
// ----------------------------------------------------------------------------

// Global
input  clk;
input  clk_en;
input  rst_n;

// Source Interface
input  [width-1:0] src_data;
input  src_vld;
output src_rdy;

// Destination Interface
output [width-1:0] dst_data;
output dst_vld;
input  dst_rdy;


// ----------------------------------------------------------------------------
// INTERNAL SIGNALS
// ----------------------------------------------------------------------------

wire empty, full;
wire [width-1:0] fifo_dst_data;
reg  dst_vld, push_req_n, pop_req_n;
reg  [width-1:0] dst_data;

wire push, pop;


// ----------------------------------------------------------------------------
// DESIGN
// ----------------------------------------------------------------------------

// Assign output port handshake signals based on internal state of the FIFO
// and input control signals:
assign src_rdy = (direct_rdy ? (!full | dst_rdy): !full);

// if (valid & ready), initiate the FIFO operation
assign push = src_vld & src_rdy;
assign pop  = dst_vld & dst_rdy;

always @(src_vld or dst_rdy or empty or src_data or fifo_dst_data or empty or
         push or pop)
begin
  if ((direct_vld == 1) & src_vld & dst_rdy & empty) begin
    dst_data   = src_data;
    dst_vld    = src_vld;
    push_req_n = 1;
    pop_req_n  = 1;
  end
  else begin
    dst_data   = fifo_dst_data;
    dst_vld    = !empty;
    push_req_n = !push;
    pop_req_n  = !pop;
  end
end

  //leda W287 off
  // turn off warning for unconnected port
g256_DW_axi_gs_bcm65
 #(width,depth,0,0,0,0,addr_width)
    fifo(.clk(clk), 
         .rst_n(rst_n),
         .init_n(1'b1), 
         .diag_n(1'b1),
         .push_req_n(push_req_n), 
         .pop_req_n(pop_req_n),
         .data_in(src_data),
         .empty(empty), 
         .full(full),
         .data_out(fifo_dst_data),
         .almost_empty(),
         .almost_full(),
         .half_full(),
         .error()
         );
  //leda W287 on

endmodule
