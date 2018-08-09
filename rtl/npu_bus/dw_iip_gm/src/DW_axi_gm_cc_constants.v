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


// Name:         GM_AW
// Default:      32
// Values:       32, ..., 64
// 
// Address width on AXI and GIF interfaces.
`define GM_AW 32


// Name:         GM_DW
// Default:      32
// Values:       8 16 32 64 128 256 512
// 
// Data width on AXI and GIF interfaces.  
//  No distinction is made in between read and write channels.
`define GM_DW 128


// Name:         GM_ID
// Default:      4
// Values:       1 2 3 4 5 6 7 8 9 10 11 12
// 
// Width of transaction ID field of the AXI and GIF interface.
`define GM_ID 4


// Name:         GM_BW
// Default:      4
// Values:       4 5 6 7 8
// 
// Width of the burst length field of the AXI and GIF interface.
`define GM_BW 8


// Name:         GM_LOWPWR_HS_IF
// Default:      false
// Values:       false (0), true (1)
// 
// GM_LOWPWR_HS_IF 
// If true, the low-power handshaking interface-csysreq, csysack, and 
// cactive signals and associated control logic is implemented. 
// If false, no support for low-power handshaking interface is provided.
`define GM_LOWPWR_HS_IF 0



// Name:         GM_LOWPWR_NOPX_CNT
// Default:      0
// Values:       0, ..., 4294967295
// Enabled:      GM_LOWPWR_HS_IF==1
// 
// GM_LOWPWR_NOPX_CNT 
// Number of AXI clock cycles to wait before cactive signal de-asserts, 
// when there are no pending transactions. 
// Note that if csysreq de-asserts while waiting this number of cycles, cactive will 
// immediately de-assert. If a new transaction is initiated during the wait period, the 
// counting will be halted, cactive will not de-assert, and the counting will be 
// reinitiated when there are no pending transactions. 
// Available only if GM_LOWPWR_HS_IF is true
`define GM_LOWPWR_NOPX_CNT 32'd0

//Creates a define for enabling legacy low power interface

`define GM_LOWPWR_NOPX_CNT_W 1


// Name:         GM_LOWPWR_LEGACY_IF
// Default:      0
// Values:       0, 1
// Enabled:      GM_LOWPWR_HS_IF==1
// 
// Legacy low power interface selection
`define GM_LOWPWR_LEGACY_IF 0

//Creates a define for enabling low power interface

// `define GM_HAS_LOWPWR_HS_IF

//Creates a define for enabling legacy low power interface

// `define GM_HAS_LOWPWR_LEGACY_IF

//Creates a define for calculating the maximum number of pending read transactions

// Name:         GM_MAX_PENDTRANS_READ
// Default:      4
// Values:       1, ..., 32
// Enabled:      GM_LOWPWR_HS_IF==1
// 
// GM_MAX_PENDTRANS_READ 
// Maximum number of AXI read transactions that may be outstanding 
// at any time 
// Available only if GM_LOWPWR_HS_IF is true
`define GM_MAX_PENDTRANS_READ 4

//Creates a define for calculating the maximum number of pending write transactions

// Name:         GM_MAX_PENDTRANS_WRITE
// Default:      4
// Values:       1, ..., 32
// Enabled:      GM_LOWPWR_HS_IF==1
// 
// GM_MAX_PENDTRANS_WRITE 
// Maximum number of AXI write transactions that may be outstanding 
// at any time 
// Available only if GM_LOWPWR_HS_IF is true
`define GM_MAX_PENDTRANS_WRITE 4

//Creates a define for calculating the width of the counter needed to 
//keep track of pending requests

`define GM_CNT_PENDTRANS_READ_W 3

//Creates a define for calculating the width of the counter needed to 
//keep track of pending requests

`define GM_CNT_PENDTRANS_WRITE_W 3


`define GM_WW (`GM_DW / 8 )


// Name:         GM_DIRECT_AXI_READY
// Default:      true
// Values:       false (0), true (1)
// 
// If true, AXI awready, wready, and rready inputs are 
//  combinationally connected to the GIF saccept output. 
//  If false, these inputs are registered, inserting one 
//  cycle of latency.
`define GM_DIRECT_AXI_READY 1


// Name:         GM_REQ_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of GIF request buffer. Higher values allow GIF  
//  requests to be buffered, rather than stalled, if the AXI 
//  address channel stalls DW_axi_gm transactions. Higher  
//  values also increase gate count. 
//  If GM_DIRECT_GIF_READY is false, recommended to set to 2 
//  or higher in order to avoid performance degradation.
`define GM_REQ_BUFFER 1

`define GM_REQ_BUFFER_AW (`GM_REQ_BUFFER/3)+1


// Name:         GM_WDATA_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of GIF write data buffer. Higher values allow GIF 
//  write data to be buffered, rather than stalled, if the AXI 
//  write data channel stalls DW_axi_gm transactions. Higher 
//  values also increase gate count. 
//  If GM_DIRECT_GIF_READY is false, recommended to be set 
//  to 2 or higher in order to avoid write performance 
//  degradation.
`define GM_WDATA_BUFFER 1

`define GM_WDATA_BUFFER_AW (`GM_WDATA_BUFFER/3)+1


// Name:         GM_DIRECT_GIF_READY
// Default:      true
// Values:       false (0), true (1)
// 
// If true, the mready input is combinationally connected to the 
//  rready/bready outputs.  
//  If false, the mready input is registered, inserting one cycle  
//  of latency.
`define GM_DIRECT_GIF_READY 1


// Name:         GM_RESP_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of combined AXI read and write response buffer. Higher values 
//  allow AXI responses to be buffered, rather than stalled, if the GIF 
//  response channel stalls DW_axi_gm transactions. Higher values also 
//  increase gate count.
`define GM_RESP_BUFFER 4

`define GM_RESP_BUFFER_AW (`GM_RESP_BUFFER/3)+1


// Name:         GM_BLOCK_READ
// Default:      false
// Values:       false (0), true (1)
// 
// If true, current GIF read request must complete (all read data 
//  received from AXI read data channel) before the next GIF request 
//  is accepted by DW_axi_gm. 
//  If false, GIF requests are allowed to be queued in the request 
//  buffer and transferred to the AXI read address channel before 
//  outstanding read requests complete.
`define GM_BLOCK_READ 0



// Name:         GM_BLOCK_WRITE
// Default:      false
// Values:       false (0), true (1)
// 
// If true, current GIF write request must complete (write reponse 
//  received from AXI write response channel) before the next GIF 
//  request is accepted by DW_axi_gm. 
//  If false, GIF requests are allowed to be queued in the request 
//  buffer and transferred to the AXI write address channel before 
//  outstanding write requests complete.
`define GM_BLOCK_WRITE 0


// -------------------------------------
// simulation parameters available in cC
// -------------------------------------


// Name:         SIM_ACLK_PERIOD
// Default:      10
// Values:       -2147483648, ..., 2147483647
// 
// This is a testbench parameter. The design does not depend on this parameter.  
// This parameter specifies the clock period of the AXI interface.
`define SIM_ACLK_PERIOD 10


// Name:         SIM_GCLK_PERIOD
// Default:      10
// Values:       10 20 30 40 50 60 70
// 
// This is a testbench parameter. The design does not depend on this parameter.  
// This parameter specifies the clock period of the generic interface GIF.
`define SIM_GCLK_PERIOD 10


// `define GM_ENCRYPT

