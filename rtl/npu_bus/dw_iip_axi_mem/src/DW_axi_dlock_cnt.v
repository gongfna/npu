/*
------------------------------------------------------------------------
--
--                    (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
--                           ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this
--  software is subject to the terms and conditions of a written
--  license agreement between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
--
-- File     : DW_axi_dlock_cnt.v
-- Version  :  
-- Abstract : Counter for dealock detection
--
------------------------------------------------------------------------
*/


module DW_axi_dlock_cnt (
  aclk,
  aresetn,
  dlc_zero,
  dlc_max
);

  input  aclk;
  input  aresetn;
  output dlc_zero;
  output dlc_max;

  reg [`AXI_LOG2_DLOCK_TIMEOUT_P1-1:0] dlc_cnt;

  reg dlc_zero;
  reg dlc_max;

  always@(posedge aclk or negedge aresetn)
    begin : dlc_cnt_PROC
      if(!aresetn)
        dlc_cnt <= 0;
      else
        begin
	  if(dlc_cnt < `AXI_DLOCK_TIMEOUT)
	    dlc_cnt <= dlc_cnt+1;
	  else
	    dlc_cnt <= 0;
	end
    end

  always@(posedge aclk or negedge aresetn)
    begin : dlc_zero_PROC
      if(!aresetn)
        dlc_zero <= 1'b0;
      else
        begin
	  if(dlc_cnt == 0)
	    dlc_zero <= 1'b1;
	  else
	    dlc_zero <= 1'b0;
	end
    end

  always@(posedge aclk or negedge aresetn)
    begin : dlc_max_PROC
      if(!aresetn)
        dlc_max <= 1'b0;
      else
        begin
	  if(dlc_cnt == `AXI_DLOCK_TIMEOUT)
	    dlc_max <= 1'b1;
	  else
	    dlc_max <= 1'b0;
	end
    end

endmodule
