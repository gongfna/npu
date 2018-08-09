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


//-----------------------------------------------------------------------------
// Filename    : DW_axi_x2ps_response.v
// Created     : Dec 19 2005
// Description : APB control of the write response buffer
//               
//               
//----------------------------------------------------------------------------



module DW_axi_x2p_s_response(/*AUTOARG*/
   // Outputs
   resp_id, resp_status, push_n,
   // Inputs
   clk, rstn, wr_error, push_req_n, cmd_id, resp_rdy_n, save_id
   );

   input clk; 
   input rstn; 
  
   input wr_error;
   input push_req_n;
   input [`X2P_AXI_SIDW-1:0] cmd_id;      // this is right from the cmd queue
   input 		 resp_rdy_n;
   input 		 save_id;
   
   output [`X2P_AXI_SIDW-1:0] resp_id;
  output                  resp_status;
   output 		  push_n;

   reg [`X2P_AXI_SIDW-1:0] 	  saved_cmd_id;
   wire [`X2P_AXI_SIDW-1:0]   next_saved_cmd_id;
   reg saved_error,dlyd_resp,next_dlyd_resp;
   wire next_saved_error;

   
   // a push_req indicates that the control is finishing the last write
   // since a pop of the cmd queue may be occuring if te resp buff is not ready save the current
   // id and status and wait
   // register the id and the error, next cycle if the resp buff is ready push.
   
   assign 		  push_n =!((resp_rdy_n==1'b0) && dlyd_resp);

   assign 		  next_saved_cmd_id = (save_id == 1'b1) ? cmd_id : saved_cmd_id;
   assign 		  next_saved_error = (push_req_n == 1'b0) ? wr_error : saved_error;
   assign 		  resp_id = saved_cmd_id;
   assign 		  resp_status = next_saved_error; // any error is a SLVERR
   
  always @(/*AS*/dlyd_resp or push_req_n or resp_rdy_n)
    begin
       next_dlyd_resp = dlyd_resp;
       if (push_req_n == 1'b0) next_dlyd_resp = 1;
       if (dlyd_resp && (resp_rdy_n == 1'b0)) next_dlyd_resp = 0;
    end
   

  always @(posedge clk or negedge rstn)
    begin
       if (!rstn)
	 begin
	    dlyd_resp <= 0;
	    saved_cmd_id <= 0;
	    saved_error <= 0;
	 end
       else
         begin
	    dlyd_resp <= next_dlyd_resp;
	    saved_cmd_id <= next_saved_cmd_id;
	    saved_error <= next_saved_error;
	 end // else: !if(rstn != 1'b1)
    end // always @ (posedge clk or negedge rstn)
  
endmodule // DW_axi_x2ps_response
























