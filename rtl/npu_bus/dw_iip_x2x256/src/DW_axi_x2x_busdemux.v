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
** File     : DW_axi_x2x_busdemux.v
** Created  : Thu May 26 13:27:47 MEST 2005
** Modified : $Date: 2011/01/05 $
** Abstract : Parameterized one-hot demux that will
**            demultiplex several buses (quantity specified
**            at compile time, and controlled by a parameter)
**            of a particular width (which is also specified at
**            compile time by a parameter). 
**
** ---------------------------------------------------------------------
*/


module x256_DW_axi_x2x_busdemux ( sel, din, dout );

   parameter BUS_COUNT = 2;   // Number of input buses.
   parameter MUX_WIDTH = 3;   // Bit width of data buses.
   parameter SEL_WIDTH = 1;   // Width of select line.

   input [SEL_WIDTH-1:0]           sel;  // Select signal.

   input [MUX_WIDTH-1:0] din;  // Input bus.
   wire  [MUX_WIDTH-1:0] din;  

   output [MUX_WIDTH*BUS_COUNT-1:0] dout; // Concatenated output
   reg    [MUX_WIDTH*BUS_COUNT-1:0] dout; // data busses. 


   reg [BUS_COUNT-1:0] sel_oh; // One-hot select signals.


   // Create one hot version of sel input.
   // Used as select line for the mux.
   always @(sel) 
   begin : sel_oh_PROC
     integer busnum;

     sel_oh = {BUS_COUNT{1'b0}};

     for(busnum=0 ; busnum<=(BUS_COUNT-1) ; busnum=busnum+1) begin
       if(sel == busnum) sel_oh[busnum] = 1'b1;
     end

   end


   // One of the subtleties that might not be obvious that makes 
   // this work so well is the use of the blocking assignment (=) 
   // that allows dout to be built up incrementally. 
   // The one-hot select builds up into the wide "or" function 
   // you'd code by hand.
   always @ (sel_oh or din) begin : mux_logic
      integer i, j;
      dout = {MUX_WIDTH{1'b0}};
      for (i = 0; i <= (BUS_COUNT-1); i = i + 1) begin
        for (j = 0; j <= (MUX_WIDTH-1); j = j + 1) begin
          dout[MUX_WIDTH*i +j]
	    = dout[MUX_WIDTH*i +j] | (din[j] & sel_oh[i]);
        end
      end
   end // always

endmodule // DW_axi_x2x_busdemux
