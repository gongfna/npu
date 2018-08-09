/*
------------------------------------------------------------------------
--
--                  (C) COPYRIGHT 2002-2011 SYNOPSYS INC.
--                            ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this software
--  is subject to the terms and conditions of a written license agreement
--  between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
--
-- File :                       DW_axi_x2x_busmux_ohsel.v
-- Author:                      See CVS log.
-- Date :                       $Date: 2011/01/05 $
-- Version :                    $Revision: #4 $
--
-- Description :     Parameterized one-hot mux that will
--                   multiplex several buses (quantity specified
--                   at compile time, and controlled by a parameter)
--                   of a particular width (which is also specified at
--                   compile time by a parameter). For example, the same
--                   module would be able to mux three 12-bit buses, or
--                   seven 5-bit buses, or any other combination,
--                   depending on the parameter values used when the
--                   module is instantiated.
--
-- Modification History:
-- Date                 By      Version Change  Description
-- =====================================================================
-- See CVS log
-- =====================================================================
*/

module x32_DW_axi_x2x_busmux_ohsel ( sel, din, dout );

   parameter bus_count = 2;   // number of input buses
   parameter mux_width = 3;   // bit width of data buses

   input [bus_count-1:0] sel;            // one-hot select signals
   input [mux_width*bus_count-1:0] din;  // concatenated input buses

   output [mux_width-1:0] dout;          // output data bus

   wire [bus_count-1:0]   sel;           // one-hot select signals
   wire [mux_width*bus_count-1:0] din;   // concatenated input buses

   reg [mux_width-1:0] dout;             // output data bus


   // One of the subtleties that might not be obvious that makes this work so well 
   // is the use of the blocking assignment (=) that allows dout to be built up 
   // incrementally. The one-hot select builds up into the wide "or" function 
   // you'd code by hand.
   always @ (sel or din) begin : mux_logic
      integer i, j;
      dout = {mux_width{1'b0}};
      for (i = 0; i <= (bus_count-1); i = i + 1) begin
        for (j = 0; j <= (mux_width-1); j = j + 1) begin
          dout[j] = dout[j] | din[mux_width*i +j]&sel[i];
        end
      end
   end // always

endmodule // DW_axi_x2x_busmux_ohsel

