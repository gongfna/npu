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
** File     : DW_axi_multibusmux.v
** Created  : Thu May 26 13:27:47 MEST 2005
** Modified : $Date$
** Abstract : This block is a repackaging of the busmux module 
**            which can implement a parameterisable number of 
**            busmuxes.
**
** ---------------------------------------------------------------------
*/


module DW_axi_multibusmux ( sel, din, dout );

   parameter BUS_COUNT = 2;   // Number of input buses.
   parameter MUX_WIDTH = 3;   // Bit width of data buses.
   parameter SEL_WIDTH = 1;   // Width of select line.
   parameter MUX_COUNT = 2;   // Number of muxes.

   // Select signal.
   input [SEL_WIDTH*MUX_COUNT-1:0]           sel;  

   // Concatenated input buses.
   input [MUX_WIDTH*BUS_COUNT*MUX_COUNT-1:0] din;  
   wire  [MUX_WIDTH*BUS_COUNT*MUX_COUNT-1:0] din;  

   // Output data bus.
   output [MUX_WIDTH*MUX_COUNT-1:0]          dout; 
   reg    [MUX_WIDTH*MUX_COUNT-1:0]          dout;             


   // One-hot select signals.
   reg [BUS_COUNT*MUX_COUNT-1:0] sel_oh; 


   // Create one hot version of sel inputs.
   // Used as select line for the muxes.
   always @(*) 
   begin : sel_oh_PROC
     reg [SEL_WIDTH-1:0] sel_int;

     integer busnum;
     integer muxnum;
     integer selbit;

     sel_oh = {BUS_COUNT*MUX_COUNT{1'b0}};

     for(muxnum=0 ; muxnum<=(MUX_COUNT-1) ; muxnum=muxnum+1) begin

       // Select the select lines for this mux.
       for(selbit=0 ; selbit<=(SEL_WIDTH-1) ; selbit=selbit+1) begin
         sel_int[selbit] = sel[(muxnum*SEL_WIDTH)+selbit];
       end

       // Convert to one-hot.
       for(busnum=0 ; busnum<=(BUS_COUNT-1) ; busnum=busnum+1) begin
	 if(sel_int == busnum) begin
	   sel_oh[(muxnum*BUS_COUNT)+busnum] = 1'b1;
	 end
       end

     end

   end


   // Implement the selected number of muxes.
   // One of the subtleties that might not be obvious that makes 
   // this work so well is the use of the blocking assignment (=) 
   // that allows dout to be built up incrementally. 
   // The one-hot select builds up into the wide "or" function 
   // you'd code by hand.
   always @ (*) 
   begin : mux_logic_PROC

     reg [MUX_WIDTH*BUS_COUNT-1:0] din_int;
     reg [BUS_COUNT-1:0]           sel_oh_int;

     integer muxnum;
     integer busnum;
     integer muxbit;
     integer selbit;
     integer dinbit;

     dout = {MUX_COUNT*MUX_WIDTH{1'b0}};

     for(muxnum=0 ; muxnum<=(MUX_COUNT-1) ; muxnum=muxnum+1) begin
       
       // Select the one hot select lines for this mux.
       for(selbit=0 ; selbit<=(BUS_COUNT-1) ; selbit=selbit+1) begin
         sel_oh_int[selbit] = sel_oh[(muxnum*BUS_COUNT)+selbit];
       end
       
       // Select the data lines for this mux.
       for(dinbit=0 ; 
           dinbit<=(MUX_WIDTH*BUS_COUNT-1) ; 
	   dinbit=dinbit+1
) 
       begin
         din_int[dinbit] = din[(muxnum*MUX_WIDTH*BUS_COUNT)+dinbit];
       end

       // Implement the mux.
       for(busnum=0 ; busnum<=(BUS_COUNT-1) ; busnum=busnum+1) begin
         for(muxbit=0 ; muxbit<=(MUX_WIDTH-1) ; muxbit=muxbit+1) begin
           dout[(muxnum*MUX_WIDTH)+muxbit] 
	     = dout[(muxnum*MUX_WIDTH)+muxbit] 
	       | (din_int[(MUX_WIDTH*busnum)+muxbit]
	          & sel_oh_int[busnum]);
         end
       end

     end // for(muxnum=0


   end // always


endmodule // DW_axi_multibusmux

