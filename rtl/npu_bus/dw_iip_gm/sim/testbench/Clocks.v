// -------------------------------------------------------------------------
//
//   Copyright (c) 2005 Synopsys, Inc. This IP and the associated
//   documentation are confidential and proprietary to Synopsys, Inc. Your
//   use or disclosure of this IP is subject to the terms and conditions of
//   a written license agreement between you, or your company,
//   and Synopsys, Inc.
// 
//   The entire notice above must be reproduced on all authorized copies.
// 
// -------------------------------------------------------------------------
// Author: Christian Graber
// -------------------------------------------------------------------------

module Clocks(/*AUTOARG*/
  // Outputs
  aclk, aresetn, gclk, gclken, equal
  );
  parameter aclk_period = 10;
  parameter gclk_period = 10;
  
  // derived parameters
  parameter ratio = gclk_period/aclk_period;
  
  output aclk;
  output aresetn;
  output gclk, gclken;
  output equal;
  
  reg    aclk;
  reg    aresetn;
  reg    gclk;
  reg    equal;
  
  initial aclk = 1;
  initial gclk = 1;
  
  always #(aclk_period/2) aclk = ~aclk;
  always #(gclk_period/2) gclk = ~gclk;
  
  integer a;
  initial begin
    a = 1;
    #1 a = 1;
  end
  

  always @(posedge aclk) a <= (a+1) % ratio;
  
  assign gclken = (a == 0) ? 1 : 0;
  
  initial begin
    #10  aresetn = 1'b1;
    #100 aresetn = 1'b0;
    repeat (300) @(posedge aclk);
    #1 aresetn = 1'b1;
  end

  initial begin
    if(aclk_period==gclk_period)
      equal = 1'b1;
    else
      equal = 1'b0;
  end
  
endmodule
