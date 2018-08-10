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

module x2p_clock_gen(/*AUTOARG*/
   // Outputs
   a_hclk, a_hresetn, b_hclk, b_hresetn, a_hclk_gated, b_hclk_gated,
   // Inputs
   a_hclk_en, b_hclk_en
   );
  parameter a_clk_period = 100;
  parameter b_clk_period = 100;
   parameter dly_to_reset = 0;


  // derived parameters

   output   a_hclk;
   output   a_hresetn;
   output   b_hclk;
   output   b_hresetn;
   input    a_hclk_en;
   input    b_hclk_en;
   output   a_hclk_gated, b_hclk_gated;



   reg 	 a_clk, b_clk, a_hclk, b_hclk;
   reg 	 a_hresetn, b_hresetn;
   reg   a_hclk_gated, b_hclk_gated;

   // -------------
  // clocks
  // -------------


  always @(/*AS*/a_hclk)
    begin
      #a_clk_period a_clk = ~a_hclk;
    end

  always @(/*AS*/b_hclk)
    begin
      #b_clk_period b_clk = ~b_hclk;
    end

   always @(/*AS*/a_clk or a_hclk_en or b_clk or b_hclk_en)
     begin
   if (a_hclk_en == 1'b1)
          a_hclk_gated = a_clk;
        else
          a_hclk_gated = 1'b0;
   if (b_hclk_en == 1'b1)
     b_hclk_gated = b_clk;
   else
          b_hclk_gated = 1'b1;
     end // always @ (...


   always @(/*AS*/a_clk) a_hclk = a_clk;

   always @(/*AS*/b_clk) b_hclk = b_clk;


  // -------------
  // make wav
   // clocks
  // -------------
  initial a_hclk = 1;
  initial b_hclk = 1;

  // -------------
  // reset
  // -------------

  initial begin
    a_hresetn = 1;
    #(dly_to_reset * a_clk_period);
    #1 a_hresetn = 0;
    #(10*a_clk_period);
    #2 a_hresetn = 1;
  end
  initial begin
    b_hresetn = 1;
    #(dly_to_reset * b_clk_period);
    #1 b_hresetn = 0;
    #(10*b_clk_period);
    #2 b_hresetn = 1;
  end

endmodule // x2p_clock_gen


