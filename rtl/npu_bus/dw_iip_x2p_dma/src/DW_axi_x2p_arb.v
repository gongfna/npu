
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
// Filename    : DW_axi_x2p_arb.v
// Created     : Fri Jan 7 20:00:00 GMT 2005
// Description : AXI-to-AHB bridge arbritation on reads and writes.
//               Simple write leads read on first conflict then alternates
//               until no conflict.
//               NO Support for low-power
//
//-----------------------------------------------------------------------------


module x32_DW_axi_x2p_arb (/*AUTOARG*/
   // Outputs
   wvalid_gtd, wready, awvalid_gtd, arvalid_gtd, awready, arready,
   // Inputs
   aclk, aresetn, wvalid, awvalid, arvalid, wready_int,
   cmd_queue_rdy_n, cmd_push_af
   );
  input aclk;
  input aresetn;
  input wvalid;
  input awvalid;         // AXI write address valid
  input arvalid;         // AXI read address valid

  input wready_int;      // write data wready from the slave controller


  input cmd_queue_rdy_n; // cmd queue is ready for a push
  input cmd_push_af;     // only one location in cmd queue is left

  output wvalid_gtd;     // will pass this on when arbritated
  output wready;         // ready to axi on a write
  output awvalid_gtd;    // to slave control for pushing fifo on when arbritated
  output arvalid_gtd;    // to slave control will pass this on when arbritated
  output awready;        // ready to axi on a write address
  output arready;        // ready to axi on a read address

  reg [2:0]                               arb_state;
  reg [2:0]                               arb_next_state;
  reg awvalid_int, arvalid_int, rdy_push, rdy_push_af;
  // using one hot here
`define IDLE 0
`define WREADY 1
`define RREADY 2
`define RREADY_PEND 4

  // combinatoral
  always @(/*AS*/arvalid or awvalid or cmd_push_af or cmd_queue_rdy_n)
    begin
      awvalid_int = awvalid;
      arvalid_int = arvalid;

  // Give the cmd queue status
  // push_rdy indicates that the CMD Queue has space available and
  //
  // rdy_push_af is used when transitioning from a ready imeadiatly
  // to the other ready
  // have to check to see if the fifo will have space after current ready
  // and have to check if the low-power ack is not going to be asser

      rdy_push = ~cmd_queue_rdy_n;
      rdy_push_af = cmd_push_af;

    end // always @ (...


  assign awready = arb_state[0];
  assign arready = arb_state[1];


  // the gtd are the a_valids sent on to the bridge
  assign awvalid_gtd =awready;
  assign arvalid_gtd =arready;

  // state machine for arbritating the write read conflict
  // machine will be activated only when a confilict arises
  // a write will go first then read
  // when the conflict doesn't exist the sm will go back to idle
  // This will assure that if write(s) and reads(s) occur at the same cycle
  // the following will occur
  // 1) following inactivity, write then read
  // 2) continuing with read alternating with write
  // 3) No activity will return to write fist

  always @(arb_state or arvalid or awvalid or awvalid_int
           or rdy_push or rdy_push_af)
    begin:ARB_STATES
      arb_next_state = arb_state;
        case(arb_state)
          `IDLE: // Idle wvalid always first
             begin
              arb_next_state = `IDLE;
              if (rdy_push == 1'b1)
                begin
                  if (awvalid == 1'b1)
                    arb_next_state = `WREADY;
                  else
                    if (arvalid == 1'b1)
                      arb_next_state = `RREADY;
                    else
                      arb_next_state = arb_state;
                end
             end // case: `IDLE
           `WREADY: // Issue WREADY if rvalid go on to issue rready
                    // since the cmd queue is being pushed check if almost full
                    // then its about to fill then defer
              begin
                if (arvalid == 1'b1)
                  begin
                    if (rdy_push_af == 1'b0)
                      arb_next_state = `RREADY;
                    else
                      arb_next_state = `RREADY_PEND;
                  end
                else arb_next_state = `IDLE; //awready just issued so have to wait
                                             // one clock before checking on write
              end // case: `WREADY
         `RREADY: // issue RREADY wvalid goes next first
                  // when here a push is going on, look at the almost full as the FIFO being filled
            begin
              if (awvalid_int == 1'b1)
                begin
                  if (rdy_push_af == 1'b0)  arb_next_state = `WREADY;
                  else arb_next_state = `IDLE;
                end
              else arb_next_state = `IDLE; // have to wait for current rwready to go away
            end
         `RREADY_PEND:
            begin
              if (rdy_push == 1'b1)  arb_next_state = `RREADY;
              else arb_next_state = `RREADY_PEND;
            end
          default: arb_next_state = `IDLE;
        endcase // case(arb_state)
    end // block: ARB_STATES

 // Gate off any write data transfers when powered down

  assign wvalid_gtd =  wvalid;
  assign wready     = wready_int;

  //
  // FF's
  //
  always @(posedge aclk or negedge aresetn)
    if (aresetn == 1'b0)
      begin
        arb_state <= `IDLE;
      end
    else
      begin
        arb_state <= arb_next_state;
      end
`undef IDLE
`undef WREADY
`undef RREADY
`undef RREADY_PEND

endmodule // DW_axi_x2p_arb







