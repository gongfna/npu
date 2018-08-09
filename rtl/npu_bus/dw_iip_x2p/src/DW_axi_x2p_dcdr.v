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
------------------------------------------------------------------------
--
--
-- File :                       DW_axi_x2p_dcdr
-- Date :                       $Date: 2006/02/07 $
-- Version      :               $Revision: #1 $
-- Abstract     :               APB address decoder module.
--
-- This module takes as input the address. It decodes the address and
-- either generates a valid decode or an invalid_addr signal (psel_int = 0)
-- The decoder is maximally configured
-- - 16 slaves - always, and the required PSEL lines are sliced out of
-- this maximally configured system.
--
--
--
-- Modification History:        Refer to perforce log
-- =====================================================================
*/

module DW_axi_x2p_dcdr (/*AUTOARG*/
  // Outputs
  psel_int, psel_err,
  // Inputs
  psel_addr
  );
  // parameter 				apb_size = `X2P_APB_SIZE;
   parameter 				num_apb_slaves = `X2P_NUM_APB_SLAVES;

//-----------------
// IO declarations
//-----------------

   input [`X2P_CMD_ADDR_WIDTH-1:0]   psel_addr;    // input address bus

   output [15:0]      psel_int;  // PSEL output bus

   output 			        psel_err;  // set when no selects or more than 1 sel

//----------------
// wires and regs
//----------------
  wire [15:0]                           psel_int;
  reg                                   psel_err;
  wire [31:0]                           paddr;      // 64 bit addressing the top 32 arn not seen

//---------------------------
// Internal wires and regs
//---------------------------
   wire [15:0] psel_tmp; // max width psel bus
   wire [3:0]  num_slaves = num_apb_slaves;
   integer     adjusted_size;

   wire [63:0] start_tmp_paddr0,end_tmp_paddr0;
   wire [63:0] start_tmp_paddr1,end_tmp_paddr1;
   wire [63:0] start_tmp_paddr2,end_tmp_paddr2;
   wire [63:0] start_tmp_paddr3,end_tmp_paddr3;
   wire [63:0] start_tmp_paddr4,end_tmp_paddr4;
   wire [63:0] start_tmp_paddr5,end_tmp_paddr5;
   wire [63:0] start_tmp_paddr6,end_tmp_paddr6;
   wire [63:0] start_tmp_paddr7,end_tmp_paddr7;
   wire [63:0] start_tmp_paddr8,end_tmp_paddr8;
   wire [63:0] start_tmp_paddr9,end_tmp_paddr9;
   wire [63:0] start_tmp_paddr10,end_tmp_paddr10;
   wire [63:0] start_tmp_paddr11,end_tmp_paddr11;
   wire [63:0] start_tmp_paddr12,end_tmp_paddr12;
   wire [63:0] start_tmp_paddr13,end_tmp_paddr13;
   wire [63:0] start_tmp_paddr14,end_tmp_paddr14;
   wire [63:0] start_tmp_paddr15,end_tmp_paddr15;

   wire [31:0] start_paddr0,end_paddr0;
   wire [31:0] start_paddr1,end_paddr1;
   wire [31:0] start_paddr2,end_paddr2;
   wire [31:0] start_paddr3,end_paddr3;
   wire [31:0] start_paddr4,end_paddr4;
   wire [31:0] start_paddr5,end_paddr5;
   wire [31:0] start_paddr6,end_paddr6;
   wire [31:0] start_paddr7,end_paddr7;
   wire [31:0] start_paddr8,end_paddr8;
   wire [31:0] start_paddr9,end_paddr9;
   wire [31:0] start_paddr10,end_paddr10;
   wire [31:0] start_paddr11,end_paddr11;
   wire [31:0] start_paddr12,end_paddr12;
   wire [31:0] start_paddr13,end_paddr13;
   wire [31:0] start_paddr14,end_paddr14;
   wire [31:0] start_paddr15,end_paddr15;


   // aaraujo (CRM_9000404273) @ 19/10/2010:
   // X2P_START_PADDR_S(i) and X2P_END_PADDR_S(i) are now 64-bits
   // parameters. But only the lower 32 bits are used by DW_axi_x2p
   // to decode which slave is being accessed.
   assign      start_tmp_paddr0 = `X2P_START_PADDR_S0;
   assign      start_paddr0     = start_tmp_paddr0[31:0];
   assign      end_tmp_paddr0   = `X2P_END_PADDR_S0;
   assign      end_paddr0       = end_tmp_paddr0[31:0];

   assign      start_tmp_paddr1 = `X2P_START_PADDR_S1;
   assign      start_paddr1     = start_tmp_paddr1[31:0];
   assign      end_tmp_paddr1   = `X2P_END_PADDR_S1;
   assign      end_paddr1       = end_tmp_paddr1[31:0];

   assign      start_tmp_paddr2 = `X2P_START_PADDR_S2;
   assign      start_paddr2     = start_tmp_paddr2[31:0];
   assign      end_tmp_paddr2   = `X2P_END_PADDR_S2;
   assign      end_paddr2       = end_tmp_paddr2[31:0];

   assign      start_tmp_paddr3 = `X2P_START_PADDR_S3;
   assign      start_paddr3     = start_tmp_paddr3[31:0];
   assign      end_tmp_paddr3   = `X2P_END_PADDR_S3;
   assign      end_paddr3       = end_tmp_paddr3[31:0];

   assign      start_tmp_paddr4 = `X2P_START_PADDR_S4;
   assign      start_paddr4     = start_tmp_paddr4[31:0];
   assign      end_tmp_paddr4   = `X2P_END_PADDR_S4;
   assign      end_paddr4       = end_tmp_paddr4[31:0];

   assign      start_tmp_paddr5 = `X2P_START_PADDR_S5;
   assign      start_paddr5     = start_tmp_paddr5[31:0];
   assign      end_tmp_paddr5   = `X2P_END_PADDR_S5;
   assign      end_paddr5       = end_tmp_paddr5[31:0];

   assign      start_tmp_paddr6 = `X2P_START_PADDR_S6;
   assign      start_paddr6     = start_tmp_paddr6[31:0];
   assign      end_tmp_paddr6   = `X2P_END_PADDR_S6;
   assign      end_paddr6       = end_tmp_paddr6[31:0];

   assign      start_tmp_paddr7 = `X2P_START_PADDR_S7;
   assign      start_paddr7     = start_tmp_paddr7[31:0];
   assign      end_tmp_paddr7   = `X2P_END_PADDR_S7;
   assign      end_paddr7       = end_tmp_paddr7[31:0];

   assign      start_tmp_paddr8 = `X2P_START_PADDR_S8;
   assign      start_paddr8     = start_tmp_paddr8[31:0];
   assign      end_tmp_paddr8   = `X2P_END_PADDR_S8;
   assign      end_paddr8       = end_tmp_paddr8[31:0];

   assign      start_tmp_paddr9 = `X2P_START_PADDR_S9;
   assign      start_paddr9     = start_tmp_paddr9[31:0];
   assign      end_tmp_paddr9   = `X2P_END_PADDR_S9;
   assign      end_paddr9       = end_tmp_paddr9[31:0];

   assign      start_tmp_paddr10 = `X2P_START_PADDR_S10;
   assign      start_paddr10     = start_tmp_paddr10[31:0];
   assign      end_tmp_paddr10   = `X2P_END_PADDR_S10;
   assign      end_paddr10       = end_tmp_paddr10[31:0];

   assign      start_tmp_paddr11 = `X2P_START_PADDR_S11;
   assign      start_paddr11     = start_tmp_paddr11[31:0];
   assign      end_tmp_paddr11   = `X2P_END_PADDR_S11;
   assign      end_paddr11       = end_tmp_paddr11[31:0];

   assign      start_tmp_paddr12 = `X2P_START_PADDR_S12;
   assign      start_paddr12     = start_tmp_paddr12[31:0];
   assign      end_tmp_paddr12   = `X2P_END_PADDR_S12;
   assign      end_paddr12       = end_tmp_paddr12[31:0];

   assign      start_tmp_paddr13 = `X2P_START_PADDR_S13;
   assign      start_paddr13     = start_tmp_paddr13[31:0];
   assign      end_tmp_paddr13   = `X2P_END_PADDR_S13;
   assign      end_paddr13       = end_tmp_paddr13[31:0];

   assign      start_tmp_paddr14 = `X2P_START_PADDR_S14;
   assign      start_paddr14     = start_tmp_paddr14[31:0];
   assign      end_tmp_paddr14   = `X2P_END_PADDR_S14;
   assign      end_paddr14       = end_tmp_paddr14[31:0];

   assign      start_tmp_paddr15 = `X2P_START_PADDR_S15;
   assign      start_paddr15     = start_tmp_paddr15[31:0];
   assign      end_tmp_paddr15   = `X2P_END_PADDR_S15;
   assign      end_paddr15       = end_tmp_paddr15[31:0];

   assign      paddr = psel_addr;

// the selection is only in 1k blocks
// Generate comparator based decoder for a maximally configured
// APB system always
//
   assign      psel_tmp[0] = ((paddr[31:10] >= start_paddr0[31:10]) && (paddr[31:10] <= end_paddr0[31:10]));
 assign psel_tmp[1] = 0;
 assign psel_tmp[2] = 0;
 assign psel_tmp[3] = 0;
 assign psel_tmp[4] = 0;
 assign psel_tmp[5] = 0;
 assign psel_tmp[6] = 0;
 assign psel_tmp[7] = 0;
 assign psel_tmp[8] = 0;
 assign psel_tmp[9] = 0;
 assign psel_tmp[10] = 0;
 assign psel_tmp[11] = 0;
 assign psel_tmp[12] = 0;
 assign psel_tmp[13] = 0;
 assign psel_tmp[14] = 0;
 assign psel_tmp[15] = 0;

//
// Extract the active slice from the maximally configured bus
//
   assign psel_int = psel_tmp;

   // if no selects set the error
   // 1st is out of range
   // 2nd is not aligned to the APB
  always @(/*AS*/psel_tmp)
    begin
      psel_err = 0;
      if (|psel_tmp == 0) psel_err = 1;
    end

endmodule // DW_axi_x2p_dcdr
























