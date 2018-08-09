
module gsync_ar (//Output
		 datasync_r,
		 //Input
		 datain,clk,areset);

  /****************************** parameters ******************************/
   // synopsys template
         parameter WIDTH = 16;
     
   /****************************************** OUTPUTS **********************************/

   output [WIDTH-1:0] datasync_r; //The output signal, synchronize to the new clock domain
   
   /******************************************  INPUTS **********************************/

   input [WIDTH-1:0] datain ;   //The input signal to the synchronizer
   input 	     clk;       //The clock to be synchronize to
   input 	     areset;    //ASync RESET signal
      
   /************************************** Wire DECLARATIONS ****************************/
   
   //No wire in that design
   
   /*************************************** Reg DECLARATIONS ****************************/

   reg [WIDTH-1:0]  sample_r;    //The first stage in synchronization
   reg [WIDTH-1:0]  datasync_r;  //The second stage in synchronization

   /*************************************************************************************/
   /*
   ----areset-------+---------------------+
                    +                     +
                 +--o--+               +--o--+
                 +     +               +     +
   ----datain--->+ FF1 +---sample_r--->+ FF2 +---datasync_r--->
                 +     +               +     +
                 +--^--+               +--^--+
                    |                     | 
                    |                     |
                   clk                   clk     
                                                                                         */
    /*************************************************************************************/  

// First sample
   always @(posedge clk or negedge areset)
     if (~areset)
       sample_r <= {WIDTH{1'b0}};
     else
       sample_r <= datain;

// Second sample   
   always @(posedge clk or negedge areset)
     if (~areset)
       datasync_r <= {WIDTH{1'b0}};
     else
       datasync_r <= sample_r;
   
endmodule 









