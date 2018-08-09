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


// Name:         GS_AW
// Default:      32
// Values:       32, ..., 64
// 
// Address width on AXI and GIF interfaces.
`define GS_AW 32


// Name:         GS_DW
// Default:      32
// Values:       8 16 32 64 128 256 512
// 
// Data width on AXI and GIF interfaces. 
//  No distinction is made between read and write channels.
`define GS_DW 128

`define GS_WW (`GS_DW / 8 )


// Name:         GS_ID
// Default:      12
// Values:       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// 
// Width of transaction ID field on the AXI and GIF interfaces.
`define GS_ID 4


// Name:         GS_BW
// Default:      4
// Values:       4 5 6 7 8
// 
// Width of burst length field on the AXI and GIF interfaces.
`define GS_BW 4


// Name:         GS_LOWPWR_HS_IF
// Default:      false
// Values:       false (0), true (1)
// 
// GS_LOWPWR_HS_IF 
// If true, the low-power handshaking interface-csysreq, csysack, and 
// cactive signals and associated control logic is implemented. 
// If false, no support for low-power handshaking interface is provided.
`define GS_LOWPWR_HS_IF 0


// Name:         GS_LOWPWR_NOPX_CNT
// Default:      0
// Values:       0, ..., 4294967295
// Enabled:      GS_LOWPWR_HS_IF==1
// 
// GS_LOWPWR_NOPX_CNT 
// Number of AXI clock cycles to wait before cactive signal de-asserts, 
// when there are no pending transactions. 
// Note that if csysreq de-asserts while waiting this number of cycles, cactive will 
// immediately de-assert. If a new transaction is initiated during the wait period, the 
// counting will be halted, cactive will not de-assert, and the counting will be 
// reinitiated when there are no pending transactions. 
// Available only if GS_LOWPWR_HS_IF is true
`define GS_LOWPWR_NOPX_CNT 32'd0

//Creates a define for enabling legacy low power interface

`define GS_LOWPWR_NOPX_CNT_W 1


// Name:         GS_LOWPWR_LEGACY_IF
// Default:      0
// Values:       0, 1
// Enabled:      GS_LOWPWR_HS_IF==1
// 
// Legacy low power interface selection
`define GS_LOWPWR_LEGACY_IF 0

//Creates a define for enabling low power interface

// `define GS_HAS_LOWPWR_HS_IF

//Creates a define for enabling legacy low power interface

// `define GS_HAS_LOWPWR_LEGACY_IF


// Name:         GS_AXI_EX_ACCESS
// Default:      1
// Values:       0, ..., 16
// 
// Maximum number of exclusive accesses supported in parallel. 
//  A value of 0 means exclusive accesses are not supported.
`define GS_AXI_EX_ACCESS 1


// Name:         GS_GIF_LITE
// Default:      false
// Values:       false (0), true (1)
// 
// Lite version of GIF. Supports devices with one-cycle data 
//  response and no flow control.
`define GS_GIF_LITE 1


// Name:         GS_BID_BUFFER
// Default:      1
// Values:       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// 
// Depth of BID buffer for outstanding GIF write requests. 
//  If set to 1, equivalent to blocking GIF write; current GIF write 
//  requests must complete (write response received from GIF Response 
//  Channel) before next AXI write request is accepted by DW_axi_gs. 
//  If greater than 1, AXI write IDs are allowed to be queued in BID 
//  buffer, while write request is transferred to GIF Request Channel 
//  before previous GIF writes responses are completed (up to the 
//  configured limit).
`define GS_BID_BUFFER 1


// Name:         GS_RID_BUFFER
// Default:      1
// Values:       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// 
// Depth of RID buffer for outstanding RID requests. 
//  If set to 1, equivalent to blocking GIF read; current GIF read request 
//  must complete (read response received form GIF response channel) before 
//  next AXI read request is accepted by DW_axi_gs. 
//  If greater than 1, AXI read IDs are allowed to be queued in RID buffer, 
//  while read request if transferred to GIF Request Channel before previous 
//  GIF reads responsese are completed (up to the configured limit).
`define GS_RID_BUFFER 1


// Name:         GS_DIRECT_GIF_READY
// Default:      true
// Values:       false (0), true (1)
// 
// If true, GIF saccept input is combinationally connected to AXI 
//  awready, wready, and arready outputs. 
//  If false, GIF saccept input is registered, inserting one cycle 
//  of latency.
`define GS_DIRECT_GIF_READY 1


// Name:         GS_REQ_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of combined read and write AXI request buffer. Higher values 
//  allow AXI requests to be bufffered, rather than stalled, if GIF 
//  request channel stalls DW_axi_gs transactions.
`define GS_REQ_BUFFER 1

//Creates a define for calculating the maximum number of pending requests

`define GS_LOWPWR_PENDTRANS_MAX 2

//Creates a define for calculating the width of the counter needed to 
//keep track of pending requests

`define GS_LOWPWR_PENDTRANS_CNT_W 2


// Name:         GS_WDATA_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of AXI write data buffer. Higher values allow AXI write data 
//  to be buffered, rather than stalled, if GIF request channel stalls 
//  DW_axi_gs transactions data.
`define GS_WDATA_BUFFER 1

// See databook for side effect of DIRECT_AXI_READY
// and GIF_LITE both enabled with a slow GCLK.


// Name:         GS_DIRECT_AXI_READY
// Default:      true
// Values:       false (0), true (1)
// 
// If true, AXI rready and bready inputs are combinationally connected to 
//  GIF mready outputs. 
//  If false, AXI rready and bready inputs are registered, inserting one 
//  cycle of latency.
`define GS_DIRECT_AXI_READY 1


// Name:         GS_RESP_BUFFER
// Default:      1
// Values:       1 2 3 4
// 
// Depth of GIF response buffer. Higher values allow GIF responses to be 
//  buffered, rather than stalled, if AXI read data or write response 
//  channel stall DW_axi_gs responses.
`define GS_RESP_BUFFER 1


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


// `define GS_ENCRYPT
