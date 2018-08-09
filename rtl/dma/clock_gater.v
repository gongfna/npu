/*

                _____  
  wait_r -----o|     \
               | AND  |--+   ____
  enable ------|_____/   +--|    \     _______
                            | OR  |---|       |         _____
  tst_gatedclock -------------------|____/    |       |--------|     \        
                                      | LATCH |        | AND  |------ gclk
            +------------------------o|       |   +----|_____/
            |                         |_______|   | 
            |                                     |
            |                                     |
   clk -----+-------------------------------------+

*/




module clock_gater (/*AUTOARG*/
   // Outputs
   gclk, 
   // Inputs
   clk, enable, wait_r, tst_gatedclock
   );


/******************************************************** INPUTS **************************************************************/

 input clk;         // System clock
 input enable;      // Enable signal
 input wait_r;      // Wait signal
 input tst_gatedclock;      // Scan mode signal (high for scan)

/******************************************************** OUTPUTS *************************************************************/

 output gclk;       // Gated clock
 
/*************************************************** WIRE DECLARATIONS ********************************************************/

 wire int1;         // Output of AND of enable and wait_r
 wire int2;         // Output of OR of int1 and tst_gatedclock
   
 wire gclk;         // Gated clock - Output of AND of latched enable and clock

/**************************************************** REG DECLARATIONS ********************************************************/

 reg genl;          // Latched enable

/*************************************************** END OF DECLARATIONS ******************************************************/

   
// Input AND
assign int1 = (enable & ~wait_r);
// And instantiation 

   
// OR
assign int2 = (int1 | tst_gatedclock);
// Or instantiation

   
// Latch
always @(clk or int2)
	if (~clk) 
           genl = int2;
// Latch instantiation

   
// AND on latch output
assign gclk = (genl & clk); 
// And instantiation

   
endmodule


