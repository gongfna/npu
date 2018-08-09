// ---------------------------------------------------------------------
//
//                   (C) COPYRIGHT 2005-2011 SYNOPSYS INC.
//                             ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys Inc.  Your use or disclosure of this software
//  is subject to the terms and conditions of a written license agreement
//  between you or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
// 
// ---------------------------------------------------------------------
// Author: Jorge Duarte
// ---------------------------------------------------------------------

module DW_axi_lpfsm (
  // Outputs
  cactive, csysack, ready,
  // Inputs
  aclk, aresetn, active_trans, csysreq
  );
  
  // -------------------------------------------------------------------
  // Parameters
  // -------------------------------------------------------------------
  
  parameter LOWPWR_NOPX_CNT   = 0;
  parameter LOWPWR_NOPX_CNT_W = 1;
  
  // -------------------------------------------------------------------
  // Ports
  // -------------------------------------------------------------------
  
  // Global signals  
  input                          aclk;         // clock 
  input                          aresetn;      // asynchronous reset 
  
  input                          active_trans; // active transaction  
  input                          csysreq;      // low power request 
  
  output                         cactive;      // low power clock active 
  output                         csysack;      // low power acknowledge 
  output                         ready;        // ready signal
  
  reg    [LOWPWR_NOPX_CNT_W-1:0] nopx_cnt;      
  reg                            nopx_end_cnt;
  reg                            csysack_delay;
  reg                            csysreq_rise;
  reg                            csysack_rise;
  reg                            cactive;      // See description above
  reg                            csysack;      // See description above
  reg                            ready;        // See description above


// leda w631 off
  always@(posedge aclk or negedge aresetn)
  begin : csysack_PROC
    if(~aresetn)
    begin
      csysack       <= 1'b1;
      csysack_delay <= 1'b1;
    end
    else
    begin
      csysack       <= csysreq;
      csysack_delay <= csysack;
    end
  end
  
  always@(*)
  begin : csysack_rise_PROC
    csysack_rise = csysack && ~csysack_delay;
  end

  generate

    if (LOWPWR_NOPX_CNT == 0) 
    
    begin : gen_nopx_0

      always@(posedge aclk or negedge aresetn)
      begin : nopx_cnt_zero_PROC
        if (~aresetn)
          nopx_cnt <= 1'b0;
        else
	  nopx_cnt <= nopx_cnt;
      end

      always@(posedge aclk or negedge aresetn)
      begin : nopx_end_cnt_zero_PROC
        if (~aresetn)
          nopx_end_cnt <= 1'b1;
        else
	  nopx_end_cnt <= nopx_end_cnt;
      end  
  
      always@(*)
      begin : cactive_zero_PROC
        cactive = active_trans || csysack_rise;
      end
  
    end 
    
    else
    
    begin : gen_nopx_1
  
      always@(*)
      begin : csysreq_rise_PROC
        csysreq_rise = csysreq && ~csysack;
      end

      always@(posedge aclk or negedge aresetn)
      begin : nopx_cnt_PROC
        if (~aresetn)
          nopx_cnt <= LOWPWR_NOPX_CNT-1;
        else
        begin
          if (~csysreq)
            nopx_cnt <= 0;
          else
          begin
	    if (csysreq_rise)
	      nopx_cnt <= LOWPWR_NOPX_CNT;
	    else
	    begin
              if (active_trans)
                nopx_cnt <= LOWPWR_NOPX_CNT-1;
              else
              begin
	        if (nopx_cnt > 0)
	          nopx_cnt <= nopx_cnt-1;
                else
	          nopx_cnt <= nopx_cnt;
	      end
	    end
          end
        end
      end

      always@(posedge aclk or negedge aresetn)
      begin : nopx_end_cnt_PROC
        if(~aresetn)
          nopx_end_cnt <= 1'b0;
        else
        begin
          if ((nopx_cnt == 0) && (active_trans == 1'b0))
	    nopx_end_cnt <= 1'b1;
          else
	    nopx_end_cnt <= 1'b0;
        end
      end  
  
      always@(*)
      begin : cactive_PROC
        cactive = active_trans || csysack_rise
                  || (~nopx_end_cnt && csysack);
      end
  
    end
 
  endgenerate
  
  always@(posedge aclk or negedge aresetn)
  begin : ready_PROC
    if (~aresetn)
      ready <= 1'b1;
    else
    begin
      if (cactive)
        ready <= 1'b1;
      else
      begin
        if (~csysack)
	  ready <= 1'b0;
	else
	  ready <= ready;
      end
    end
  end

// leda w631 on
    
endmodule
  
