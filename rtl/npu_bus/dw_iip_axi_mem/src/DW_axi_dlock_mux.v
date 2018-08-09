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
-- Abstract : Deadlock detector
--
------------------------------------------------------------------------
*/


module DW_axi_dlock_mux (
  aclk,
  aresetn,
  dlock_w_m1,
  dlock_id_w_m1,
  dlock_snum_w_m1,
  dlock_r_m1,
  dlock_id_r_m1,
  dlock_snum_r_m1,
  dlock_mst,
  dlock_slv,
  dlock_id,
  dlock_wr,
  dlock_irq
);

  input                          aclk;
  input                          aresetn;
  input                          dlock_w_m1;
  input [`AXI_MIDW-1:0]          dlock_id_w_m1;
  input [`AXI_LOG2_NSP1-1:0]     dlock_snum_w_m1;
  input                          dlock_r_m1;
  input [`AXI_MIDW-1:0]          dlock_id_r_m1;
  input [`AXI_LOG2_NSP1-1:0]     dlock_snum_r_m1;
  output [`AXI_LOG2_LCL_NM-1:0]  dlock_mst;
  output [`AXI_LOG2_NSP1-1:0]    dlock_slv;
  output [`AXI_MIDW-1:0]         dlock_id;
  output                         dlock_wr;
  output                         dlock_irq;

  reg    [`AXI_NUM_MASTERS-1:0]  dlock_w;
  reg    [`AXI_MIDW-1:0]         dlock_id_w   [`AXI_NUM_MASTERS-1:0];
  reg    [`AXI_LOG2_NSP1-1:0]    dlock_snum_w [`AXI_NUM_MASTERS-1:0];
  reg    [`AXI_NUM_MASTERS-1:0]  dlock_r;
  reg    [`AXI_MIDW-1:0]         dlock_id_r   [`AXI_NUM_MASTERS-1:0];
  reg    [`AXI_LOG2_NSP1-1:0]    dlock_snum_r [`AXI_NUM_MASTERS-1:0];

  reg    [`AXI_LOG2_LCL_NM-1:0]  dlock_mst_c;
  reg    [`AXI_LOG2_NSP1-1:0]    dlock_slv_c;
  reg    [`AXI_MIDW-1:0]         dlock_id_c;
  reg                            dlock_wr_c;
  reg                            dlock_irq_c;


  always @(*)
  begin : dlock_w_PROC

  dlock_w[0]  = dlock_w_m1;
















  end

  always @(*)
  begin : dlock_id_w_PROC

  dlock_id_w[0]  = dlock_id_w_m1;
















  end

  always @(*)
  begin : dlock_snum_w_PROC

  dlock_snum_w[0]  = dlock_snum_w_m1;
















  end

  always @(*)
  begin : dlock_r_PROC

  dlock_r[0]  = dlock_r_m1;
















  end

  always @(*)
  begin : dlock_id_r_PROC

  dlock_id_r[0]  = dlock_id_r_m1;
















  end

  always @(*)
  begin : dlock_snum_r_PROC

  dlock_snum_r[0]  = dlock_snum_r_m1;
















  end

  always @(*)
  begin : dlock_PROC
    integer i;
    reg     found;
    
    dlock_mst_c = {`AXI_LOG2_LCL_NM{1'b0}};
    dlock_slv_c = {`AXI_LOG2_NSP1{1'b0}};
    dlock_id_c  = {`AXI_MIDW{1'b0}};
    dlock_wr_c  = 1'b0;
    dlock_irq_c = 1'b0;

    found     = 0;

    for(i = 0;
         i <= `AXI_NUM_MASTERS-1;
	 i = i+1)
      begin
        if ((dlock_w[i] || dlock_r[i]) && !found)
	  begin
            dlock_mst_c = i;
	    if(dlock_w[i])
	      begin
	        dlock_slv_c = dlock_snum_w[i];
	        dlock_id_c  = dlock_id_w[i];
	      end
	    else
	      begin
	        dlock_slv_c = dlock_snum_r[i];
	        dlock_id_c  = dlock_id_r[i];
	      end
	    dlock_wr_c  = dlock_w[i];
	    dlock_irq_c = 1;
	    found       = 1;
          end
      end
  end

  assign dlock_mst = dlock_mst_c;
  assign dlock_slv = dlock_slv_c;
  assign dlock_id  = dlock_id_c;
  assign dlock_wr  = dlock_wr_c;
  assign dlock_irq = dlock_irq_c;      

endmodule
