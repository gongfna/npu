/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2006-2011 SYNOPSYS, INC.
**                            ALL RIGHTS RESERVED
**
**  This software and the associated documentation are confidential and
**  proprietary to Synopsys, Inc.  Your use or disclosure of this
**  software is subject to the terms and conditions of a written
**  license agreement between you, or your company, and Synopsys, Inc.
**
**  The entire notice above must be reproduced on all authorized copies.
**
** ---------------------------------------------------------------------
**
** File     : DW_axi_lp.v
** Created  : Tue May 11 15:54:00 MEST 2010
** Modified : $Date$
** Abstract : The purpose of this block is to implementn low power
**            interface compliant with axi protocol.
**
** ---------------------------------------------------------------------
*/
module DW_axi_lp (
  aclk_i,
  aresetn_i,

  awpendtrans_i,
  arpendtrans_i,
  awvalid_m_i,
  arvalid_m_i,

  csysreq_i,
  csysack_o,
  cactive_o,
  ready_en_o
);

  input      aclk_i;                                // AXI system clock
  input      aresetn_i;                             // AXI system reset

  input      [`AXI_NUM_MASTERS-1:0] awpendtrans_i;  // Number of pending transitions on write address channel of all Masters
  input      [`AXI_NUM_MASTERS-1:0] arpendtrans_i;  // Number of pending transitions on read address channel of all Masters

  input      [`AXI_NUM_MASTERS-1:0] awvalid_m_i;    // Masters awvalid bus
  input      [`AXI_NUM_MASTERS-1:0] arvalid_m_i;    // Masters arvalid_m bus

  input      csysreq_i;                             // System low-power request
  output     csysack_o;                             // Low-power request acknowledgement
  output     cactive_o;                             // Clock active
  output     ready_en_o;                            // Ready enable

  wire       cactive_o;
  wire       csysack_o;

  wire       active_trans;

  wire       ready_en_o;


  assign active_trans = (|awpendtrans_i) | (|arpendtrans_i) | (|awvalid_m_i) | (|arvalid_m_i);


  DW_axi_lpfsm
   #(
    `AXI_LOWPWR_NOPX_CNT,
    `AXI_LOG2_LOWPWR_NOPX_CNT
  )
  U_DW_axi_lpfsm (
     // Inputs
     .aclk         (aclk_i),
     .aresetn      (aresetn_i),
     .active_trans (active_trans),
     .csysreq      (csysreq_i),

     // Outputs
     .cactive      (cactive_o),
     .csysack      (csysack_o),
     .ready        (ready_en_o)
  );


endmodule
