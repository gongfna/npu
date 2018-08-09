/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2006-2011 SYNOPSYS, INC.
**                            ALL RIGHTS RESERVED
**
**  This software and the associated documentation are confidential and
**  proprietary to Synopsys, Inc.  Your use or disclosure of this
**  software is subject to the terms and conditions of a written
**  license agreement between you, or your company, and Synopsys, Inc.
**
**  The entire notice above must be reproduced on all authorized copies.
**
** ---------------------------------------------------------------------
**
** File     : DW_axi_x2x_constants.v
** Abstract : Some static macro's for DW_axi_x2x.
**
** ---------------------------------------------------------------------
*/

// Max data width
`define X2X_MAX_DW 512

// Max strobe width
`define X2X_MAX_SW  64

// Log 2 max strobe width
`define X2X_LOG2_MAX_SW  6

// Burst Size Width
`define X2X_BSW 3
// Burst Type Width
`define X2X_BTW 2
// Locked Type Width
`define X2X_LTW 2 
// Cache Type Width
`define X2X_CTW 4
// Protection Type Width
`define X2X_PTW 3
// Buffered Response Width
`define X2X_BRW 2
// Read Response Width
`define X2X_RRW 2

// Locked type field macros.
`define X2X_LT_NORM  2'b00
`define X2X_LT_EX    2'b01
`define X2X_LT_LOCK  2'b10

// Protection type field macros.
`define X2X_PT_PRVLGD    3'bxx1
`define X2X_PT_NORM      3'bxx0
`define X2X_PT_SECURE    3'bx1x
`define X2X_PT_NSECURE   3'bx0x
`define X2X_PT_INSTRUCT  3'b1xx
`define X2X_PT_DATA      3'b0xx

`define X2X_PT_PRVLGD_BIT   0
`define X2X_PT_SECURE_BIT   1
`define X2X_PT_INSTRUCT_BIT 2

// Encoding definition of RESP signals.
`define X2X_RESP_OKAY     2'b00
`define X2X_RESP_EXOKAY   2'b01
`define X2X_RESP_SLVERR   2'b10
`define X2X_RESP_DECERR   2'b11

// Burst type macros.
`define X2X_BT_FIXED      2'b00
`define X2X_BT_INCR       2'b01
`define X2X_BT_WRAP       2'b10
`define X2X_BT_X          2'bxx


// Macros used as parameter inputs to blocks,
`define X2X_NOREQ_LOCKING  0 // No locking functionality required.
`define X2X_REQ_LOCKING    1 // Locking functionality required.

// Some blocks need to implement different logic depending
// on what type of channel they are implementing, these macros
// are used for that purpose.
`define X2X_W_CH 1      // This channel is a write data channel.
`define X2X_NOT_W_CH  0 // This channel is not a write data channel.

`define X2X_AW_CH 1      // This channel is a write address channel.
`define X2X_NOT_AW_CH  0 // This channel is not a write address channel.

`define X2X_R_CH 1      // This channel is a read data channel.
`define X2X_NOT_R_CH  0 // This channel is not a read data channel.

`define X2X_ADDR_CH 1     // This channel is an address channel.
`define X2X_NOT_ADDR_CH 0 // This channel is not an address channel.

// Macros to define the various levels of t/x altering the X2X is
// required to do.
`define X2X_TX_NO_ALTER        0 // No t/x altering.
`define X2X_LEN_ONLY_ALTER     1 // T/x length altering only.
`define X2X_MP_LRGR_ALTER      2 // MP DW largest altering.
`define X2X_SP_LRGR_ALTER      3 // SP DW largest altering, no upsizing.
`define X2X_SP_LRGR_US_ALTER   4 // SP DW largest altering, upsizing.

// Macros to define alock access types for resizer use
`define NORMAL                 2'b00 //normal access
`define EXCLUS                 2'b01 //exclusive access
`define LOCKED                 2'b10 //locked access

// Macros to define different cases in resizer (upsize --> US)
`define NO_ACTION               3'b000 //No action
`define AS_IS_OR_US_INLAST      3'b001 //pass as is or US from last
`define MUL_XACT_OR_US_INLAST   3'b010 //mul xacts or US from last 
`define MUL_XACT_OR_US_NOTLAST  3'b011 //mul xacts or US not from last
`define SINGLE_XACT_INLAST      3'b100 //single xact from last xact
`define MUL_XACT_INLAST         3'b101 //mul xacts from last xact
`define MUL_XACT_NOTLAST        3'b110 //mul xacts not from last xact

// Macros to define controls in resizer (MUL_XACT_OR_US_INLAST -> MXUI)
`define IDLE_CTRL               4'b0000 //idle
`define MUX_OVERONE             4'b0001 //over one xact for *_NOTLAST
`define MUX_WRAP_BOUND          4'b0010 //wrap boundary for *_NOTLAST
`define MUX_WRAP                4'b0011 //from boundary for *_NOTLAST
`define MUX_CROSS               4'b0100 //cross boundary for *_NOTLAST
`define MUX_FI_MUL              4'b0101 //mul xact of *_NOTLAST, fix/incr
`define MUX_FI_LAST             4'b0110 //last mutil xact for *_NOTLAST
`define MXI_WRAP                4'b0111 //wrap for MUL_XACT_INLAST
`define MXI_FI                  4'b1000 //fix/incr for MUL_XACT_INLAST
`define MXUI_SINGLE             4'b1001 //single xact for MXUI
`define MXUI_NO_CROSS           4'b1010 //no cross boundary for MXUI
`define MXUI_CROSS              4'b1011 //cross boundary for MXUI
`define MXUI_DS                 4'b1100 //downsize for MXUI
`define MXUI_FI_SINGLE          4'b1101 //fix/incr single xact for MXUI
`define MXUI_FI_MUL             4'b1110 //fix/incr mul xacts for MXUI
`define MXUI_FI_DS              4'b1111 //fix/incr downsize for MXUI




