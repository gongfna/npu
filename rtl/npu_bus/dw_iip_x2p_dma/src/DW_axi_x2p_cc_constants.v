/*
 ------------------------------------------------------------------------
--
--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
--                            ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this
--  software is subject to the terms and conditions of a written
--  license agreement between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
*/

//-----------------------------------------------------------------------------
// Description : This file contains all configuration parameters.
//-----------------------------------------------------------------------------

// AXI INTERFACE SETUP


// Name:         X2P_AXI_AW
// Default:      32
// Values:       32, ..., 64
// 
// Width of the AXI address bus. 
// This width comprises the full range from 32 bit to 64 bit. 
// The full range is used for the 'psel' select signals, 
// but only the lower 32 bits are passed on to paddr.
`define X2P_AXI_AW 32


// Name:         X2P_AXI_SIDW
// Default:      8
// Values:       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// 
// Width of the AXI transaction ID field.
`define X2P_AXI_SIDW 4


// Name:         X2P_AXI_DW
// Default:      32
// Values:       8 16 32 64 128 256 512
// 
// Width of the AXI read and write data bus.
`define X2P_AXI_DW 32


// Name:         X2P_AXI_BLW
// Default:      4
// Values:       4 5 6 7 8
// 
// Width of the AXI AWLEN and ARLEN burst count fields.
`define X2P_AXI_BLW 4


// Name:         X2P_AXI_ENDIANNESS
// Default:      Little Endian
// Values:       Little Endian (0), Big Endian (1)
// Enabled:      Always
// 
// If set to true, the AXI bus is big endian. 
// If set to false, the AXI bus is little endian. 
// The APB bus is always little endian.
`define X2P_AXI_ENDIANNESS 0


// `define BIV_ENDIAN_ENABLE


`define LITTLE_ENDIAN_ENABLE

// APB INTERFACE SETUP


// Name:         X2P_APB_ADDR_WIDTH
// Default:      32
// Values:       32
// 
// Width of the APB address bus.
`define X2P_APB_ADDR_WIDTH 32


// Name:         X2P_APB_DATA_WIDTH
// Default:      32
// Values:       8 16 32
// 
// Width of the APB read and write data bus. 
// This width has to be equal or smaller than 
// the width of the AXI data bus.
`define X2P_APB_DATA_WIDTH 32


// Name:         X2P_NUM_APB_SLAVES
// Default:      4
// Values:       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// 
// Number of APB Slave Ports.
`define X2P_NUM_APB_SLAVES 1


// Name:         X2P_CLK_MODE
// Default:      Dual Clock
// Values:       Dual Clock (0), Single Clock (2)
// 
// The AXI bus is clocked by aclk. 
// The APB bus is clocked by pclk. 
// Dual Clock: This mode should be selected if either aclk and pclk 
// are asynchronous or quasi-synchronous. 
// Single Clock: This mode should be selected if aclk and pclk are fully synchronous.
`define X2P_CLK_MODE 0



// Name:         X2P_DUAL_CLK_SYNC_DEPTH
// Default:      2
// Values:       0 1 2 3
// Enabled:      X2P_CLK_MODE == 0
// 
// X2P_DUAL_CLK_SYNC_DEPTH 
// Number of synchronisation register stages in the internal channel fifos 
// for signals crossing clock domains between AXI and APB. When aclk and pclk 
// are quasi-synchronous it should be possible to set this parameter to 0 
// to reduce the latency across the bridge. Only enabled if dual clock 
// mode is selected. If dual clock mode is not selected this parameter is irrelevant.
`define X2P_DUAL_CLK_SYNC_DEPTH 2



// `define X2P_CLK_MODE_2



`define X2P_CLK_MODE_0


//Creates a define for calculating the maximum number of pending read transactions

// Name:         X2P_MAX_PENDTRANS_READ
// Default:      4
// Values:       1, ..., 32
// Enabled:      Always
// 
// Defines the maximum number of pending read transactions.
`define X2P_MAX_PENDTRANS_READ 4

//Creates a define for calculating the maximum number of pending write transactions

// Name:         X2P_MAX_PENDTRANS_WRITE
// Default:      4
// Values:       1, ..., 32
// Enabled:      Always
// 
// Defines the maximum number of pending write transactions.
`define X2P_MAX_PENDTRANS_WRITE 4

// LOW POWER HANDSHAKING INTERFACE SETUP



// Name:         X2P_LOWPWR_HS_IF
// Default:      false
// Values:       false (0), true (1)
// Enabled:      Always
// 
// If true, the low-power handshaking interface-csysreq, 
// logic is implemented. If false, csysack, and cactive 
// signals-and associated control  no support for low-power 
// handshaking interface is provided.
`define X2P_LOWPWR_HS_IF 0



// Name:         X2P_LOWPWR_LEGACY_IF
// Default:      0
// Values:       0, 1
// Enabled:      X2P_LOWPWR_HS_IF==1
// 
// Legacy low power interface selection
`define X2P_LOWPWR_LEGACY_IF 0

//X2P_HAS_LOWPWR_HS_IF:
//Creates a define for whether or not the low power handshaking interface
//exists.

// `define X2P_HAS_LOWPWR_HS_IF

//X2P_HAS_LOWPWR_LEGACY_IF:
//Creates a define for whether or not the legacy low power handshaking
//interface exists.

// `define X2P_HAS_LOWPWR_LEGACY_IF



// Name:         X2P_LOWPWR_NOPX_CNT
// Default:      0
// Values:       0, ..., 4294967295
// Enabled:      X2P_LOWPWR_HS_IF == 1
// 
// Number of AXI clock cycles to wait before cactive signal 
// de-asserts, when there are no pending transactions. 
// Note that if csysreq de-asserts while waiting this number 
// of cycles, cactive will immediately de-assert. If a new 
// transaction is initiated during the wait period, the 
// counting will be halted, cactive will not de-assert, and 
// the counting will be reinitiated when there are no pending 
// transactions. 
// Available only if X2P_LOWPWR_HS_IF is true
`define X2P_LOWPWR_NOPX_CNT 32'd0

//This is the log2 of (X2P_LOWPWR_NOPX_CNT )

`define X2P_LOG2_LOWPWR_NOPX_CNT 1



// Name:         X2P_CMD_QUEUE_DEPTH
// Default:      4
// Values:       1 2 4 8 16 32
// 
// Number of locations in the common command queue. 
// Depth must be at least 2 when in dual-clock mode.
`define X2P_CMD_QUEUE_DEPTH 4


// Name:         X2P_WRITE_BUFFER_DEPTH
// Default:      2
// Values:       1 2 4 8 16 32 64
// 
// Number of locations in the write data buffer. 
// Depth must be at least 2 when in dual-clock mode.
`define X2P_WRITE_BUFFER_DEPTH 2


// Name:         X2P_WRITE_RESP_BUFFER_DEPTH
// Default:      2
// Values:       1 2 4 8 16
// 
// Number of locations in the write response buffer. 
// Depth must be at least 2 when in dual-clock mode.
`define X2P_WRITE_RESP_BUFFER_DEPTH 2


// Name:         X2P_READ_BUFFER_DEPTH
// Default:      2
// Values:       1 2 4 8 16 32
// 
// Number of locations in the read data buffer. 
// Depth must be at least 2 when in dual-clock mode.
`define X2P_READ_BUFFER_DEPTH 2



/********************************************************************/
/*                                                                  */
/*         Decoders for the APBs                                    */
/*                                                                  */
/********************************************************************/


// Name:         X2P_START_PADDR_S0
// Default:      0x0000000000000400
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// 
// Start address for APB Slave 0. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S0 64'h0000000001700000


// Name:         X2P_END_PADDR_S0
// Default:      0x00000000000007ff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// 
// End address for APB Slave 0. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S0 64'h00000000017007ff


// Name:         X2P_IS_APB3_S0
// Default:      false
// Values:       false (0), true (1)
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S0 0


// `define X2P_APB3_S0


// Name:         X2P_START_PADDR_S1
// Default:      0x0000000000000800
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>1
// 
// Start address for APB Slave 1. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S1 64'h0000000000000800


// Name:         X2P_END_PADDR_S1
// Default:      0x0000000000000bff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>1
// 
// End address for APB Slave 1. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S1 64'h0000000000000bff


// Name:         X2P_IS_APB3_S1
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>1
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S1 0


// `define X2P_APB3_S1


// Name:         X2P_START_PADDR_S2
// Default:      0x0000000000000c00
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>2
// 
// Start address for APB Slave 2. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S2 64'h0000000000000c00


// Name:         X2P_END_PADDR_S2
// Default:      0x0000000000000fff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>2
// 
// End address for APB Slave 2. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S2 64'h0000000000000fff


// Name:         X2P_IS_APB3_S2
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>2
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S2 0


// `define X2P_APB3_S2


// Name:         X2P_START_PADDR_S3
// Default:      0x0000000000001000
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>3
// 
// Start address for APB Slave 3. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S3 64'h0000000000001000


// Name:         X2P_END_PADDR_S3
// Default:      0x00000000000013ff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>3
// 
// End address for APB Slave 3. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S3 64'h00000000000013ff


// Name:         X2P_IS_APB3_S3
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>3
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S3 0


// `define X2P_APB3_S3


// Name:         X2P_START_PADDR_S4
// Default:      0x0000000000001400
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>4
// 
// Start address for APB Slave 4. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S4 64'h0000000000001400


// Name:         X2P_END_PADDR_S4
// Default:      0x00000000000017ff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>4
// 
// End address for APB Slave 4. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S4 64'h00000000000017ff


// Name:         X2P_IS_APB3_S4
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>4
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S4 0


// `define X2P_APB3_S4


// Name:         X2P_START_PADDR_S5
// Default:      0x0000000000001800
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>5
// 
// Start address for APB Slave 5. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S5 64'h0000000000001800


// Name:         X2P_END_PADDR_S5
// Default:      0x0000000000001bff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>5
// 
// End address for APB Slave 5. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S5 64'h0000000000001bff


// Name:         X2P_IS_APB3_S5
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>5
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S5 0


// `define X2P_APB3_S5


// Name:         X2P_START_PADDR_S6
// Default:      0x0000000000001c00
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>6
// 
// Start address for APB Slave 6. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S6 64'h0000000000001c00


// Name:         X2P_END_PADDR_S6
// Default:      0x0000000000001fff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>6
// 
// X2P_END_PADDR_S6 
// End address for APB Slave 6. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S6 64'h0000000000001fff


// Name:         X2P_IS_APB3_S6
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>6
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S6 0


// `define X2P_APB3_S6


// Name:         X2P_START_PADDR_S7
// Default:      0x0000000000002000
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>7
// 
// Start address for APB Slave 7. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S7 64'h0000000000002000


// Name:         X2P_END_PADDR_S7
// Default:      0x00000000000023ff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>7
// 
// End address for APB Slave 7. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S7 64'h00000000000023ff


// Name:         X2P_IS_APB3_S7
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>7
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S7 0


// `define X2P_APB3_S7


// Name:         X2P_START_PADDR_S8
// Default:      0x0000000000002400
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>8
// 
// Start address for APB Slave 8. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S8 64'h0000000000002400


// Name:         X2P_END_PADDR_S8
// Default:      0x00000000000027ff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>8
// 
// End address for APB Slave 8. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S8 64'h00000000000027ff


// Name:         X2P_IS_APB3_S8
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>8
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S8 0


// `define X2P_APB3_S8



// Name:         X2P_START_PADDR_S9
// Default:      0x0000000000002800
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>9
// 
// Start address for APB Slave 9. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S9 64'h0000000000002800


// Name:         X2P_END_PADDR_S9
// Default:      0x0000000000002bff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>9
// 
// End address for APB Slave 9. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S9 64'h0000000000002bff


// Name:         X2P_IS_APB3_S9
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>9
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S9 0


// `define X2P_APB3_S9


// Name:         X2P_START_PADDR_S10
// Default:      0x0000000000002c00
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>10
// 
// Start address for APB Slave 10. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S10 64'h0000000000002c00


// Name:         X2P_END_PADDR_S10
// Default:      0x0000000000002fff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>10
// 
// End address for APB Slave 10. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S10 64'h0000000000002fff


// Name:         X2P_IS_APB3_S10
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>10
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S10 0


// `define X2P_APB3_S10


// Name:         X2P_START_PADDR_S11
// Default:      0x0000000000003000
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>11
// 
// Start address for APB Slave 11. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S11 64'h0000000000003000


// Name:         X2P_END_PADDR_S11
// Default:      0x00000000000033ff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>11
// 
// End address for APB Slave 11. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S11 64'h00000000000033ff


// Name:         X2P_IS_APB3_S11
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>11
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S11 0


// `define X2P_APB3_S11


// Name:         X2P_START_PADDR_S12
// Default:      0x0000000000003400
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>12
// 
// Start address for APB Slave 12. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S12 64'h0000000000003400


// Name:         X2P_END_PADDR_S12
// Default:      0x00000000000037ff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>12
// 
// End address for APB Slave 12. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S12 64'h00000000000037ff


// Name:         X2P_IS_APB3_S12
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>12
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S12 0


// `define X2P_APB3_S12


// Name:         X2P_START_PADDR_S13
// Default:      0x0000000000003800
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>13
// 
// Start address for APB Slave 13. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S13 64'h0000000000003800


// Name:         X2P_END_PADDR_S13
// Default:      0x0000000000003bff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>13
// 
// End address for APB Slave 13. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S13 64'h0000000000003bff


// Name:         X2P_IS_APB3_S13
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>13
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S13 0


// `define X2P_APB3_S13



// Name:         X2P_START_PADDR_S14
// Default:      0x0000000000003c00
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>14
// 
// Start address for APB Slave 14. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S14 64'h0000000000003c00


// Name:         X2P_END_PADDR_S14
// Default:      0x0000000000003fff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>14
// 
// End address for APB Slave 14. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S14 64'h0000000000003fff


// Name:         X2P_IS_APB3_S14
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>14
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S14 0


// `define X2P_APB3_S14



// Name:         X2P_START_PADDR_S15
// Default:      0x0000000000004000
// Values:       0x0000000000000000, ..., pow(2,X2P_AXI_AW)-1024
// Enabled:      X2P_NUM_APB_SLAVES>15
// 
// Start address for APB Slave 15. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_START_PADDR_S15 64'h0000000000004000


// Name:         X2P_END_PADDR_S15
// Default:      0x00000000000043ff
// Values:       0x00000000000003ff, ..., pow(2,X2P_AXI_AW)-1
// Enabled:      X2P_NUM_APB_SLAVES>15
// 
// End address for APB Slave 15. 
//  
// Dependencies: Any address must not be contained in any other range and 
// must have a minimum size of 1 KB, and must be aligned to a 1 KB boundary.
`define X2P_END_PADDR_S15 64'h00000000000043ff


// Name:         X2P_IS_APB3_S15
// Default:      false
// Values:       false (0), true (1)
// Enabled:      X2P_NUM_APB_SLAVES>15
// 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification.
`define X2P_IS_APB3_S15 0


// `define X2P_APB3_S15


`define X2P_AXI_START_ADDR 64'h1700000


`define X2P_AXI_END_ADDR 64'h17007ff



// Name:         X2P_START_PADDR_32_S0
// Default:      0x01700000 (X2P_START_PADDR_S0 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #0 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S0 32'h01700000


// Name:         X2P_END_PADDR_32_S0
// Default:      0x017007ff (X2P_END_PADDR_S0 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #0 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S0 32'h017007ff


// Name:         X2P_START_PADDR_32_S1
// Default:      0x00000800 (X2P_START_PADDR_S1 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #1 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S1 32'h00000800


// Name:         X2P_END_PADDR_32_S1
// Default:      0x00000bff (X2P_END_PADDR_S1 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #1 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S1 32'h00000bff


// Name:         X2P_START_PADDR_32_S2
// Default:      0x00000c00 (X2P_START_PADDR_S2 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #2 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S2 32'h00000c00


// Name:         X2P_END_PADDR_32_S2
// Default:      0x00000fff (X2P_END_PADDR_S2 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #2 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S2 32'h00000fff


// Name:         X2P_START_PADDR_32_S3
// Default:      0x00001000 (X2P_START_PADDR_S3 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #3 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S3 32'h00001000


// Name:         X2P_END_PADDR_32_S3
// Default:      0x000013ff (X2P_END_PADDR_S3 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #3 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S3 32'h000013ff


// Name:         X2P_START_PADDR_32_S4
// Default:      0x00001400 (X2P_START_PADDR_S4 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #4 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S4 32'h00001400


// Name:         X2P_END_PADDR_32_S4
// Default:      0x000017ff (X2P_END_PADDR_S4 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #4 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S4 32'h000017ff


// Name:         X2P_START_PADDR_32_S5
// Default:      0x00001800 (X2P_START_PADDR_S5 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #5 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S5 32'h00001800


// Name:         X2P_END_PADDR_32_S5
// Default:      0x00001bff (X2P_END_PADDR_S5 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #5 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S5 32'h00001bff


// Name:         X2P_START_PADDR_32_S6
// Default:      0x00001c00 (X2P_START_PADDR_S6 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #6 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S6 32'h00001c00


// Name:         X2P_END_PADDR_32_S6
// Default:      0x00001fff (X2P_END_PADDR_S6 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// X2P_END_PADDR_32_S6 
// End Address for APB Slave #6 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S6 32'h00001fff


// Name:         X2P_START_PADDR_32_S7
// Default:      0x00002000 (X2P_START_PADDR_S7 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #7 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S7 32'h00002000


// Name:         X2P_END_PADDR_32_S7
// Default:      0x000023ff (X2P_END_PADDR_S7 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #7 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S7 32'h000023ff


// Name:         X2P_START_PADDR_32_S8
// Default:      0x00002400 (X2P_START_PADDR_S8 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #8 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S8 32'h00002400


// Name:         X2P_END_PADDR_32_S8
// Default:      0x000027ff (X2P_END_PADDR_S8 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #8 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S8 32'h000027ff


// Name:         X2P_START_PADDR_32_S9
// Default:      0x00002800 (X2P_START_PADDR_S9 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #9 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S9 32'h00002800


// Name:         X2P_END_PADDR_32_S9
// Default:      0x00002bff (X2P_END_PADDR_S9 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #9 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S9 32'h00002bff


// Name:         X2P_START_PADDR_32_S10
// Default:      0x00002c00 (X2P_START_PADDR_S10 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #10 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S10 32'h00002c00


// Name:         X2P_END_PADDR_32_S10
// Default:      0x00002fff (X2P_END_PADDR_S10 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #10 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S10 32'h00002fff


// Name:         X2P_START_PADDR_32_S11
// Default:      0x00003000 (X2P_START_PADDR_S11 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #11 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S11 32'h00003000


// Name:         X2P_END_PADDR_32_S11
// Default:      0x000033ff (X2P_END_PADDR_S11 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #11 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S11 32'h000033ff


// Name:         X2P_START_PADDR_32_S12
// Default:      0x00003400 (X2P_START_PADDR_S12 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #12 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S12 32'h00003400


// Name:         X2P_END_PADDR_32_S12
// Default:      0x000037ff (X2P_END_PADDR_S12 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #12 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S12 32'h000037ff


// Name:         X2P_START_PADDR_32_S13
// Default:      0x00003800 (X2P_START_PADDR_S13 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #13 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S13 32'h00003800


// Name:         X2P_END_PADDR_32_S13
// Default:      0x00003bff (X2P_END_PADDR_S13 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #13 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S13 32'h00003bff


// Name:         X2P_START_PADDR_32_S14
// Default:      0x00003c00 (X2P_START_PADDR_S14 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #14 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S14 32'h00003c00


// Name:         X2P_END_PADDR_32_S14
// Default:      0x00003fff (X2P_END_PADDR_S14 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #14 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S14 32'h00003fff


// Name:         X2P_START_PADDR_32_S15
// Default:      0x00004000 (X2P_START_PADDR_S15 & 0x00000000ffffffff)
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      0
// 
// Start Address for APB Slave #15 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_START_PADDR_32_S15 32'h00004000


// Name:         X2P_END_PADDR_32_S15
// Default:      0x000043ff (X2P_END_PADDR_S15 & 0x00000000ffffffff)
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      0
// 
// End Address for APB Slave #15 that the component will use 
// to decode the addressed APB Slave. This parameter 
// is non-editable and is used for visual purposes only 
// in the coreConsultant GUI.
`define X2P_END_PADDR_32_S15 32'h000043ff



// `define X2P_HAS_S1


// `define X2P_HAS_S2


// `define X2P_HAS_S3


// `define X2P_HAS_S4


// `define X2P_HAS_S5


// `define X2P_HAS_S6


// `define X2P_HAS_S7


// `define X2P_HAS_S8


// `define X2P_HAS_S9


// `define X2P_HAS_S10


// `define X2P_HAS_S11


// `define X2P_HAS_S12


// `define X2P_HAS_S13


// `define X2P_HAS_S14


// `define X2P_HAS_S15


// `define X2P_PREADY_S0


// `define X2P_PSLVERR_S0


// `define X2P_PREADY_S1


// `define X2P_PSLVERR_S1


// `define X2P_PREADY_S2


// `define X2P_PSLVERR_S2


// `define X2P_PREADY_S3


// `define X2P_PSLVERR_S3


// `define X2P_PREADY_S4


// `define X2P_PSLVERR_S4


// `define X2P_PREADY_S5


// `define X2P_PSLVERR_S5


// `define X2P_PREADY_S6


// `define X2P_PSLVERR_S6


// `define X2P_PREADY_S7


// `define X2P_PSLVERR_S7


// `define X2P_PREADY_S8


// `define X2P_PSLVERR_S8


// `define X2P_PREADY_S9


// `define X2P_PSLVERR_S9


// `define X2P_PREADY_S10


// `define X2P_PSLVERR_S10


// `define X2P_PREADY_S11


// `define X2P_PSLVERR_S11


// `define X2P_PREADY_S12


// `define X2P_PSLVERR_S12


// `define X2P_PREADY_S13


// `define X2P_PSLVERR_S13


// `define X2P_PREADY_S14


// `define X2P_PSLVERR_S14


// `define X2P_PREADY_S15


// `define X2P_PSLVERR_S15



// -------------------------------------
// simulation parameters available in cC
// -------------------------------------

// Name:         SIM_A_CLK_PERIOD
// Default:      100
// Values:       -2147483648, ..., 2147483647
// 
// This is a testbench parameter. The design does not depend on this 
// parameter. This parameter specifies the clock period of the primary 
// AXI system (also called AXI system "A") used in the testbench to drive 
// the Bridge slave interface.
`define SIM_A_CLK_PERIOD 100


// Name:         SIM_B_CLK_PERIOD
// Default:      100
// Values:       -2147483648, ..., 2147483647
// 
// This is a testbench parameter. The design does not depend from this 
// parameter. This parameter specifies the clock period of the secondary 
// APB system (also called APB system "B") used in the testbench to drive 
// the Bridge master interface.
`define SIM_B_CLK_PERIOD 100

// this enables tests to produce additional dump files with information about the
// random transfers generated, the addresses values observed on the bus etc.

`define SIM_DEBUG_LEVEL 0

// this enables tests to use a variable seed (related with the OS time) to
// initialize random generators.

`define SIM_USE_VARIABLE_SEED 0

// Verification use's SIM_RAND_SEED if SIM_USE_CC_RAND_SEED
// is set. Use's get_systime value otherwise. Note the
// seed wil be the same but the configurations
// will be different between regression runs.



`define SIM_RAND_SEED 32'h3d5b789a


`define SIM_USE_CC_RAND_SEED 0



`define USE_FOUNDATION 0


// ------------------------------------------
// simulation constants used in the testbench
// do not change !
// ------------------------------------------

// clock cycles in a time tick
`define SIM_A_TTICK_CLK_CYCLES 100000
`define SIM_B_TTICK_CLK_CYCLES 51

// primary bus memory map
`define SIM_A_START_ADDR_S1 32'h10000000  /* slave A1 */
`define SIM_A_END_ADDR_S1   32'h1fffffff
`define SIM_A_START_ADDR_S2 32'h20000000  /* bridge A->B */
`define SIM_A_END_ADDR_S2   32'h2fffffff
`define SIM_A_START_ADDR_S3 32'h30000000  /* slave A3 */
`define SIM_A_END_ADDR_S3   32'h3fffffff

// secondary bus memory map
`define SIM_B_START_ADDR_S1 32'h20000000  /* slave B1 */
`define SIM_B_END_ADDR_S1   32'h27ffffff
`define SIM_B_START_ADDR_S3 32'h28000000  /* slave B3 */
`define SIM_B_END_ADDR_S3   32'h2fffffff
`define SIM_B_START_ADDR_S2 32'h30000000  /* bridge A->B */
`define SIM_B_END_ADDR_S2   32'h3fffffff


//----------------------------------------------
// used for the axi to apb bridge
//----------------------------------------------


// Name:         AXI_TEST_RAND_XACTNS
// Default:      1000
// Values:       -2147483648, ..., 2147483647
// 
// This sets the number of transactions the random test will run
`define AXI_TEST_RAND_XACTNS 1000

//----------------------------------------------
// used for the axi to apb bridge
//----------------------------------------------


// Name:         AXI_TEST_INACTIVE_SIGNALS
// Default:      2
// Values:       -2147483648, ..., 2147483647
// 
// used to allow random generation of default signal levels 
//  in the regression tests 
//  bit 0 for default for RREADY 
//  bit 1                 BREADY 
//  3:2   WSTRB inactive 
//    0   low 
//    1   prev 
//    2   hign
`define AXI_TEST_INACTIVE_SIGNALS 2

/*****************************************/
/*                                       */
/*          MAXI BUS SIZES               */
/*                                       */
/*****************************************/
`define MAX_X2P_AXI_DATA_WIDTH  512
`define MAX_X2P_AXI_ADDR_WIDTH  64
`define MAX_X2P_AXI_ID_WIDTH 20



`define RM_BCM05 0

`define RM_BCM06 1

`define RM_BCM07 0

`define RM_BCM21 0

`define RM_BCM57 0

`define RM_ENDIAN 1
/*****************************************/
/*                                       */
/*          Derived Values               */
/*                                       */
/*****************************************/
// the following are "derived defines"
// the following will be derived from the X2P_CLK_MODE


`define X2P_AXI_WSTRB_WIDTH  `X2P_AXI_DW/8
`define X2P_APB_WSTRB_WIDTH  `X2P_APB_DATA_WIDTH/8


`define X2P_AXI_WDFIFO_WIDTH  `X2P_AXI_DW + `X2P_AXI_WSTRB_WIDTH + 1

// the LEN is the cmd queue will be the larger of the write and read
`define LEN_WIDTH `X2P_AXI_BLW

// keep the axi addr width allowing selects to span the whole X2P_AXI_AW range
//`define X2P_CMD_ADDR_WIDTH  `X2P_AXI_AW
//`define X2P_CMD_QUEUE_WIDTH  `X2P_AXI_AW + `X2P_AXI_SIDW + `X2P_AXI_BLW + 2 + 2 + 1
`define X2P_CMD_ADDR_WIDTH  32
`define X2P_CMD_QUEUE_WIDTH 32 + `X2P_AXI_SIDW + `X2P_AXI_BLW + 2 + 2 + 1

// based on the AXI data width define the max SIZE that can be issued
`define X2P_MAX_AXI_SIZE ((`X2P_AXI_DW == 512) ? 6 :((`X2P_AXI_DW == 256) ? 5 : ((`X2P_AXI_DW == 128) ? 4 : ((`X2P_AXI_DW == 64 ? 3 :((`X2P_AXI_DW == 32) ? 2 : ((`X2P_AXI_DW == 16) ? 1: 0)))))))
// provide the fixed size of the APB
`define X2P_APB_SIZE ((`X2P_APB_DATA_WIDTH == 512) ? 6 :((`X2P_APB_DATA_WIDTH == 256) ? 5 : ((`X2P_APB_DATA_WIDTH == 128) ? 4 : ((`X2P_APB_DATA_WIDTH == 64 ? 3 :((`X2P_APB_DATA_WIDTH == 32) ? 2 : ((`X2P_APB_DATA_WIDTH == 16) ? 1: 0)))))))


`define APB_BUS_SIZE ((`X2P_APB_DATA_WIDTH == 32) ? 2 : (`X2P_APB_DATA_WIDTH == 16) ? 1 : 0)


// `define X2P_ENCRYPT


