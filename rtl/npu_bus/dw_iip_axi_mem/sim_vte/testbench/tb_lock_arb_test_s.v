///------------------------------------------------------------------------
//--
//--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
//--                            ALL RIGHTS RESERVED
//--
//--  This software and the associated documentation are confidential and
//--  proprietary to Synopsys, Inc.  Your use or disclosure of this
//--  software is subject to the terms and conditions of a written
//--  license agreement between you, or your company, and Synopsys, Inc.
//--
//--  The entire notice above must be reproduced on all authorized copies.

`include "DW_axi_cc_constants.v"

// When lock arbiter test is running, flag an error if the same lock
// sequence is granted twice in a row, when the arbitration algorithm means
// it should not.
module tb_lock_arb_test_s 
(
  aclk,
  aresetn,
  awvalid_i,
  awready_i,
  awlock_i,
  awid_i,
  arvalid_i,
  arready_i,
  arlock_i,
  arid_i,
  bus_awvalid_m,
  bus_arvalid_m,
  lock_arb_test_on
);

 parameter SNUM = 0;
 parameter ARB_TYPE = 0;

 input aclk;
 input aresetn;
 input awvalid_i;
 input awready_i;
 input [1:0] awlock_i;
 input [`AXI_SIDW-1:0] awid_i;
 input arvalid_i;
 input arready_i;
 input [1:0] arlock_i;
 input [`AXI_SIDW-1:0] arid_i;
 input lock_arb_test_on;
 input [`AXI_NUM_MASTERS-1:0] bus_awvalid_m;
 input [`AXI_NUM_MASTERS-1:0] bus_arvalid_m;

 reg m_valids_diff_time_r;
 reg first_valids_occ_r;

 wire [`AXI_NUM_MASTERS-1:0] bus_avalid_m;
 assign bus_avalid_m = bus_awvalid_m | bus_arvalid_m;

 // The master valids need to assert at the same time to avoid
 // false negatives.
 // Stimulus will toggle lock_arb_test_on after testing each slave.
 always @(posedge aclk or negedge aresetn) begin : m_valids_diff_time_r_PROC
  integer m; 
  integer nvld;
  nvld = 0;

  if(~aresetn) begin
    m_valids_diff_time_r <= 1'b0;
    first_valids_occ_r <= 1'b0;
  end else begin
    if(~m_valids_diff_time_r & lock_arb_test_on) begin
      for(m=0;m<=`AXI_NUM_MASTERS;m=m+1) begin
        if(bus_avalid_m[m]) nvld = nvld+1;
      end
      // Only flag on first valids during test.
      m_valids_diff_time_r <= |(bus_avalid_m) & (nvld==1) & ~first_valids_occ_r;
      if(|(bus_avalid_m)) first_valids_occ_r <= 1'b1;
    end else begin
      m_valids_diff_time_r <= lock_arb_test_on;
      first_valids_occ_r <= lock_arb_test_on;
    end
  end
 end // always ...

 wire lock_acc;
 assign lock_acc = (  (awvalid_i & awready_i & (awlock_i == 2'b10))
                    | (arvalid_i & arready_i & (arlock_i == 2'b10))
                   )
                   & lock_arb_test_on;

 wire nonlock_acc;
 assign nonlock_acc = (  (awvalid_i & awready_i & (awlock_i != 2'b10))
                       | (arvalid_i & arready_i & (arlock_i != 2'b10))
                      )
                      & lock_arb_test_on;

 reg nonlock_occured;
 always @(posedge aclk or negedge aresetn) 
 begin
   if(~aresetn) begin
     nonlock_occured <= 1'b0;
   end else begin
     if(~nonlock_occured)
       nonlock_occured <= nonlock_acc;
     else 
       nonlock_occured <= ~lock_acc;
   end 
 end 


 // Only grab upper ID bits if there is >1 master.
 wire [`AXI_MIDW-1:0] lock_mst;
 `ifdef AXI_HAS_M2
 assign lock_mst = awvalid_i
                   ? awid_i[`AXI_SIDW-1:`AXI_MIDW]
                   : arid_i[`AXI_SIDW-1:`AXI_MIDW];
 `else
 assign lock_mst = 0;
 `endif


 reg [`AXI_MIDW-1:0] lock_mst_r;
 always @(posedge aclk or negedge aresetn) 
 begin
   if(~aresetn) begin
     lock_mst_r <= {`AXI_MIDW{1'b0}};
   end else begin
     if(lock_acc) begin
       lock_mst_r <= lock_mst;
     end
   end 
 end 

 always @(posedge aclk) begin
   if(    (nonlock_occured & lock_acc & (lock_mst == lock_mst_r))
        & lock_arb_test_on
        & `AXI_HAS_LOCKING

          // Can't guarantee timing arbiter will grant different master
          // unless this is true.
        & (   (ARB_TYPE==1)
            | ((ARB_TYPE==2) & `AXI_HAS_EXT_PRIORITY)
          )
          // Single master ID doesn't correspond to a single local master
          // in this case.
       &  (`AXI_HAS_BICMD==0)

         // Must be equal timing options on the address channels to avoid
         // false negatives. I.e. if the 2nd request arrives at the slave 
         // after the slave has already locked to another master, the 
         // first master may be granted again because that 2nd request
         // will not be seen by the arbiter until after the locked
         // sequence.
       & (`AXI_AR_TMO==`AXI_AW_TMO)

         // Master valids must assert at same time for failure condition to
         // avoid false failures.
       & ~m_valids_diff_time_r
     )
   begin
    $display("\n\t------------------------------------------------------");
    $display("\nERROR %0t, timing arbiter at S %0d, granted same", $time, SNUM);
    $display("\nmasters locked sequence back to back.");
    $display("\n\t------------------------------------------------------");
   end
 end

endmodule
