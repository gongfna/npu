/////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
/////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
// Upsizing enable signal generation
/////////////////////////////////////////////////////////////////////////

module x512_DW_axi_x2x_ue (
 //inputs
  addr_i,
  alen_i,
  asize_i,
  
 //outputs
  xact_upsize_o 
);

  //parameters
  parameter X2X_TX_UPSIZE = 1;                     //upsize = 1
  //internal
  parameter MAX_SP_BYTES  = `X2X_MAX_SP_BYTES; 
  parameter MAX_ASIZE_S   = (`X2X_MAX_SP_ASIZE > 0) ? 
                            `X2X_MAX_SP_ASIZE : 1; //ByteSize-->BurstSize
  parameter ANY_ASIZE     = `X2X_UPSIZE_ANY_ASIZE; //any asize
  parameter LOG2_MP_SW    = `X2X_LOG2_MP_SW;       //log2^MP_SW

  //inputs
  input  [`X2X_INTERNAL_AW-1:0] addr_i;        //master address
  input  [`X2X_MP_BLW-1:0]      alen_i;        //MP burst length
  input  [2:0]                  asize_i;       //master asize
  
  //outputs
  output                        xact_upsize_o; //pop enable, act low

  //Upsize enable signal
  reg [5:0]         catch_bits;
  wire              unalign_bit;
  wire              xact_upsize_o; //1-->upsize; 0-->no
  wire              beat_integer;

  ///////////////////////////////////////////////////////////////////////
  //Upsizing enable.
  //If `X2X_TX_UPSIZE & ( `X2X_MP_DW < `X2X_SP_DW ) &
  //MP_TOTAL_BYTES is integer of `X2X_SP_DW/8 &
  //MP data width aligned to SP data width
  ///////////////////////////////////////////////////////////////////////
  // Leda check (may only do modulo by constant for synthesis) is firing
  // incorrectly here.
  // leda W639 off
  assign beat_integer = (((alen_i + 1) << asize_i) % 
                         MAX_SP_BYTES) == 0; //integer
  // leda W639 on

  //check aligned bits from start addr_i
  assign unalign_bit = (MAX_ASIZE_S > asize_i) ? 
                       |{addr_i[MAX_ASIZE_S-1:0] >> asize_i} :
                       1'b1; //1-->unaligned, 0-->aligned

  //if ANY_ASIZE true and upsize conditions meet, do upsize.
  //if ANY_ASIZE false and if upsize conditions meet and asize_i
  //equals LOG2_MP_SW, do upsize.
  assign xact_upsize_o = (ANY_ASIZE | 
                           (!ANY_ASIZE & (LOG2_MP_SW == asize_i))) &
                           X2X_TX_UPSIZE & (`X2X_MP_DW < `X2X_SP_DW) &
                           beat_integer & !unalign_bit;

endmodule



