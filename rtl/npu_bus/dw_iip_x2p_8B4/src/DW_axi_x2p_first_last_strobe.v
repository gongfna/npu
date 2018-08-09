
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
// Filename    : DW_axi_x2p_first_last_strobe.v
// Created     : Jan 6 2005
// Description : Finds the first and last nonzero strobes
//              
//-----------------------------------------------------------------------------
  

module DW_axi_x2p_first_last_strobe (/*AUTOARG*/
  // Outputs
  first_strobe, last_strobe, next_first_strobe, next_last_strobe, 
  // Inputs
  clk, rstn, write_strobes, sample_strobes
  );

   parameter primary_data_width = 32;
   parameter secondary_data_width = 32;

   input     clk;
   input     rstn;
   
   input [(primary_data_width/8)-1:0] write_strobes;
   input 			      sample_strobes;
   output [7:0] 		      first_strobe;
   output [7:0] 		      last_strobe;
   output [7:0] 		      next_first_strobe;
   output [7:0] 		      next_last_strobe;
   
   wire [(primary_data_width/8)-1:0]  write_strobes;
   reg [(primary_data_width/8)-1:0]   first_wr_strobes,last_wr_strobes;
   
   reg [7:0] 			      first_strobe,last_strobe;
   reg [7:0] 			      next_first_strobe,next_last_strobe;
   wire [7:0] 			      first_strobe_ns,last_strobe_ns;

  reg [(secondary_data_width/8)-1:0]  slice;
   reg [(primary_data_width/secondary_data_width)-1:0] active_slice;
   integer 			      counter;

   integer                             i,j,k,m;
  
   parameter    		      APB_WDS = (primary_data_width/secondary_data_width);

   //***********************************************************************
   //
   // first_strobes
   // from bottom up, check the strobes in groups the width of the secondary
   // count will indicate the first non-sero set of strobes
   //
   //***********************************************************************
   
// Constant condition expression changes on a per configuration basis
// hence the Leda warning can be disabled:
// leda W159 off
  always@(/*AUTOSENSE*/write_strobes)
    begin
      first_wr_strobes = write_strobes;
      if(primary_data_width > secondary_data_width)
        begin
          for(i=0;i<APB_WDS;i=i+1)
            begin
              for(j=0; j<secondary_data_width/8; j=j+1)
                slice[j] = first_wr_strobes[j+(secondary_data_width/8)*i];
              active_slice[i] = |slice;
            end
        end
      else
        active_slice = 0;
    end // always@ (...
  

  always@(/*AUTOSENSE*/active_slice)
    begin
      if(primary_data_width > secondary_data_width)
        next_first_strobe = APB_WDS;
      else
        next_first_strobe = 0;
      for(k=0;k<APB_WDS;k=k+1)
        begin
          if(active_slice[APB_WDS-1-k])
            begin
              next_first_strobe = APB_WDS-1-k;
            end
        end
    end // always@ (...
  
  
   //***********************************************************************
   //
   // last_strobes
   // from top down, check the strobes in groups the width of the secondary
   // count will indicate the first og the trailing  non-sero set of strobes
   //
   //***********************************************************************
   

  always@(/*AUTOSENSE*/active_slice)
    begin
      if(primary_data_width > secondary_data_width)
        next_last_strobe = 0;
      else
        next_last_strobe = APB_WDS;
      for(m=0;m<APB_WDS;m=m+1)
        begin
          if(active_slice[m])
            begin
              next_last_strobe = m+1;
            end
        end
    end // always@ (...
// leda W159 on
   
   assign last_strobe_ns = (sample_strobes == 1'b1) ? next_last_strobe : last_strobe;
   assign first_strobe_ns = (sample_strobes == 1'b1) ? next_first_strobe : first_strobe;

   always @(posedge clk or negedge rstn)
     begin
	if (!rstn)
	  begin
	     last_strobe <= 0;
	     first_strobe <= 0;
	  end
	else
          begin
	     last_strobe <= last_strobe_ns;
	     first_strobe <= first_strobe_ns;
	  end
     end // always @ (posedge clk or negedge rstn)
      
endmodule // DW_axi_x2_first_last_strobe















