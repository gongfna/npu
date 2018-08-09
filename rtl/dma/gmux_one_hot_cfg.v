
module gmux_one_hot_cfg (/*AUTOARG*/
   // Outputs
   dataout, 
   // Inputs
   datain, sel
   );


/****************************************************** PARAMETERS ************************************************************/
// synopsys template
 parameter WIDTH = 16;
 parameter DEPTH = 16;

/******************************************************** INPUTS **************************************************************/

 input  [DEPTH*WIDTH-1:0] datain;  // mux datain 
 input  [DEPTH-1:0] sel;           // mux select 


/******************************************************** OUTPUTS *************************************************************/

 output [WIDTH-1:0] dataout;  // mux dataout

/*************************************************** WIRE DECLARATIONS ********************************************************/

 integer d;   // depth   
 integer w;   // width   
 integer d1;  // depth 1 
 integer w1;  // width 1 


/**************************************************** REG DECLARATIONS ********************************************************/

 reg [DEPTH*WIDTH-1:0] datain_tmp;  // datain bus anded with the selects inputs
 reg [WIDTH-1:0] dataout;           // mux dataout

/*************************************************** END OF DECLARATIONS ******************************************************/


// ******************************************************************
// And the selects with the datain bus
// ******************************************************************

 always @(datain or sel)
  for (d=0; d<DEPTH; d=d+1)
   for (w=0; w<WIDTH; w=w+1)
    datain_tmp[w+(d*WIDTH)] = datain[w+(d*WIDTH)] & sel[d];

// ******************************************************************
// Or of datain_tmp bus
// ******************************************************************

 always @(datain_tmp or dataout)
  begin
   dataout = datain_tmp[WIDTH-1:0];
   for (w1=0; w1<WIDTH; w1=w1+1)
    for (d1=1; d1<DEPTH; d1=d1+1)
     dataout[w1] = datain_tmp[w1+d1*WIDTH] | dataout[w1];
  end

endmodule








