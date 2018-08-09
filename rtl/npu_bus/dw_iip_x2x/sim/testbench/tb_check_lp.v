/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
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
** File     : tb_check_lp.v
** Abstract : Checks Low Power handshaking infrastructure.
**
**
** ---------------------------------------------------------------------
**
** CHECKERS:
**
** - check that csysack follows csysreq (1 clk cycle delayed)
**
** - cactive deasserts when csysreq deasserts and there are no outstanding
**   transactions in the bus
**
** - cactive will deassert after transactions counter reaches 0 (csysreq is
**   kept high)
**
** - after reset cactive will deassert after transactions counter reaches 0
**
** - cactive will remain deasserted while there are no transactions pending
**   in the bus
**
** - cactive will assert when new transaction arrives into the bus
**
** - cactive will remain asserted while there are transactions pending in
**   the bus
**
**  - after reset cactive will be:
**    - 0 if NOPX = 0;
**    - 1 if NOPX > 0;
**
** - ready will remain deasserted during Low Power mode
**
** - cactive will assert at the same time as csysack after Lexiting from
**   Low Power
**
** - If there is a buffer stage between the Master and the Slave ports,
**   ready signals for AW, AR and W channels must assert after exiting
**   from Low Power
**
** ---------------------------------------------------------------------
**
** COVERAGE POINTS:
**
** - The system enter in Low Power mode at least once
**
** - The clock is removed sometime during the Low Power mode
**
** - cactive deasserts when LPC requests entering in Low Power mode
**
** - cactive deasserts after no transactions counter have been elapsed
**
** - The system enter in Low Power mode - request accepted
**
** - The system enter in Low Power mode - request rejected
**
** - The system exits from Low Power mode by component request
**
** - The system exits from Low Power mode by LPC request
**
** - The system exits from Low Power mode after Low Power entering rejected
**
** ---------------------------------------------------------------------
*/



module tb_check_lp (
  clk,                                            // System clock
  clklp,                                          // Low Power clock
  resetn,                                         // System reset
  cvrgen,                                         // Coverage enable signal. Will trigger coverage points checking

  awvalid_m_bus,
  awready_m_bus,
  arvalid_m_bus,
  arready_m_bus,
  wready_m_bus,
  bvalid_m_bus,
  bready_m_bus,
  rvalid_m_bus,
  rready_m_bus,
  rlast_m_bus,

  csysreq,
  csysack,
  cactive
);

// Parameters
parameter              NMST = 1;                  // Number of masters
parameter              NOPX = 0;                  // Post Completion Delay Counter
parameter              PCPL = 0;                  // Post Completion Latency (0 or 1)

parameter              AR_HAS_BUFF = 0;           // 1 if there is a buffer stage between the Master and Slave ports
parameter              AW_HAS_BUFF = 0;           // 1 if there is a buffer stage between the Master and Slave ports
parameter              W_HAS_BUFF  = 0;           // 1 if there is a buffer stage between the Master and Slave ports


localparam             FpRej = 1'b0;              // FSM state to control rejected Low Power mode entry
localparam             LpRej = 1'b1;              // ...


input                  clk;                       // System clock
input                  clklp;                     // Low Power clock
input                  resetn;                    // System reset
input                  cvrgen;                    // Coverage enable - will check covrage point on asserting

input   [NMST-1:0]     awvalid_m_bus;
input   [NMST-1:0]     awready_m_bus;
input   [NMST-1:0]     arvalid_m_bus;
input   [NMST-1:0]     arready_m_bus;
input   [NMST-1:0]     wready_m_bus;
input   [NMST-1:0]     bvalid_m_bus;
input   [NMST-1:0]     bready_m_bus;
input   [NMST-1:0]     rvalid_m_bus;
input   [NMST-1:0]     rready_m_bus;
input   [NMST-1:0]     rlast_m_bus;

input                  csysreq;                   // Low Power request
input                  csysack;                   // Low Power acknowledge
input                  cactive;                   // Clock active


reg     [NMST-1:0]     bvalid_m_bus_reg;
reg     [NMST-1:0]     bready_m_bus_reg;
reg     [NMST-1:0]     rvalid_m_bus_reg;
reg     [NMST-1:0]     rready_m_bus_reg;
reg     [NMST-1:0]     rlast_m_bus_reg;

wire    [NMST-1:0]     bvalid_bus;
wire    [NMST-1:0]     bready_bus;
wire    [NMST-1:0]     rvalid_bus;
wire    [NMST-1:0]     rready_bus;
wire    [NMST-1:0]     rlast_bus;

reg     [31:0]         cnt_trans;
reg     [31:0]         cnt_trans_reg;
reg     [31:0]         nopx_cnt;

reg                    csysreq_dl;                // Delayed version of csysreq signal
reg                    csysreq_lp_dl;             // Delayed version of csysreq signal (Low Power clock domain)
wire                   csysreq_edge;              // Edge detection of csysreq signal
wire                   csysreq_ne;                // Negative edge of csysreq signal
wire                   csysreq_pe;                // Positive edge of csysreq signal
reg                    csysreq_lp_pe_dl;          // Delayed csysreq positive edge detection (Low Power clock domain)
reg                    csysreq_ne_dl;             // Delayed csysreq negative edge detection

reg                    csysack_dl;                // Delayed csysack signal
wire                   csysack_ne;                // Negative edge of csysack
wire                   csysack_pe;                // Positive edge of csysack
reg                    csysack_pe_dl;             // Delayed csysack positive edge detection

reg                    cactive_dl;                // Delayed cactive signal
wire                   cactive_pe;                // Positive edge detection of the cactive
wire                   cactive_ne;                // Negative edge detection of the cactive
reg                    cactive_lp_dl_s1;          // Delayed cactive signal (Low Power domain) - 1st stage
reg                    cactive_lp_dl_s2;          // Delayed cactive signal (Low Power domain) - 2nd stage
wire                   cactive_lp_pe;             // Positive edge detection of the cactive (Low Power domain)

reg                    resetn_reg;                // Delaysed resetn signal
wire                   resetn_edge;               // Edge detection of the reset

wire                   low_power_on;
reg                    low_power_on_dl;           // Delayed low_power_on signal
wire                   low_power_on_pe;           // Positive edge of low_power_on signal
wire                   low_power_ready;           // Low Power Ready status

reg                    cvrg_enter_lp_reject_flg;  // Low Power mode entry rejection flag
reg                    rejstate;
reg                    next_rejstate;

wire                   avalid;                    // AW and AR channels valid signal detection
wire                   ready;                     // AW, AR and W channles ready signal detection
wire                   active_trans;              // active transactions
reg                    active_trans_dl;           // Delayed active_trans signal

reg                    leaving_reset;             // reset flag

// Coverage points
integer                mst, mstr;

integer                cvrg_lp_mode;              // Enter in Low Power
integer                cvrg_clk_cnt;              // system clock counter
integer                cvrg_lpclk_cnt;            // Lpw-Power clock counter
integer                cvrg_cactive_by_csysreq;   // cactive goes low after when csysreq deasserts
integer                cvrg_cactive_by_counter;   // cactive goes low after counter reaches 0

integer                cvrg_enter_lp_accept;      // Enter in Low Power mode accepted
integer                cvrg_enter_lp_reject;      // Enter in Low Power mode rejected
integer                cvrg_exit_lp_comp_req;     // Exit from Low Power mode after component request
integer                cvrg_exit_lp_lpc_req;      // Exit from Low Power mode after LPC request
integer                cvrg_exit_lp_after_reject; // Exit from Low Power mode after Low Power entering rejected


assign avalid = awvalid_m_bus || arvalid_m_bus;
assign ready  = awready_m_bus || arready_m_bus || wready_m_bus;


// csysreq edges detection
always @(posedge clk or negedge resetn) begin
  if(!resetn) begin
     csysreq_dl <= 1'b1;
  end
  else begin
     csysreq_dl <= csysreq;
  end
end

assign csysreq_ne   = !csysreq && csysreq_dl;
assign csysreq_pe   = csysreq && !csysreq_dl;


always @(posedge clklp or negedge resetn) begin
  if(!resetn) begin
     csysreq_lp_dl <= 1'b1;
  end
  else begin
     csysreq_lp_dl <= csysreq;
  end
end

assign csysreq_edge  = csysreq^csysreq_lp_dl;
assign csysreq_lp_pe = csysreq && !csysreq_lp_dl;


// csysreq_lp_pe_dl will trigger cactive asserting check
// after a Low Power exiting request. This is implemented
// in Low Power clock domain since Low Power clock could
// not come back into the system immediately
always @(posedge clklp or negedge resetn) begin
  if(!resetn) begin
     csysreq_lp_pe_dl <= 1'b0;
  end
  else begin
     csysreq_lp_pe_dl <= csysreq_lp_pe;
  end
end

// csysreq_ne_dl will trigger cactive deasserting check
// after a Low Power entering request (by LPC)
always @(posedge clklp or negedge resetn) begin
  if(!resetn) begin
     csysreq_ne_dl <= 1'b0;
  end
  else begin
     csysreq_ne_dl <= csysreq_ne;
  end
end


// csysack edge detection
always @(posedge clk or negedge resetn) begin
  if(!resetn) begin
     csysack_dl <= 1'b1;
  end
  else begin
     csysack_dl <= csysack;
  end
end

assign csysack_ne = !csysack && csysack_dl;
assign csysack_pe = csysack && !csysack_dl;


always @(posedge clklp or negedge resetn) begin
  if(!resetn) begin
     csysack_pe_dl    <= 1'b0;
  end
  else begin
     csysack_pe_dl    <= csysack_pe;
  end
end


// Cactive edge detection
always @(posedge clk or negedge resetn) begin
  if(!resetn) begin
     cactive_dl <= 1'b0;
  end
  else begin
     cactive_dl <= cactive;
  end
end

assign cactive_pe = cactive && !cactive_dl;
assign cactive_ne = !cactive && cactive_dl;


// Cactive edge detection (Low Power Domain)
always @(posedge clklp or negedge resetn) begin
  if(!resetn) begin
     cactive_lp_dl_s1 <= 1'b0;
     cactive_lp_dl_s2 <= 1'b0;
  end
  else begin
     cactive_lp_dl_s1 <= cactive;
     cactive_lp_dl_s2 <= cactive_lp_dl_s1;
  end
end

assign cactive_lp_pe = cactive_lp_dl_s2 && !cactive_lp_dl_s2;


// Reset edge detection
always @(posedge clk or negedge resetn) begin
  if(!resetn) begin
     resetn_reg <= 1'b0;
  end
  else begin
     resetn_reg <= resetn;
  end
end

assign resetn_edge = resetn_reg^resetn;


// Detect the period from when a reset pulse occurs
// until the first transaction arrives into the bus
always @(posedge clk or negedge resetn) begin
  if(!resetn) begin
     leaving_reset  <= 1'b1;
  end
  else begin
     if (avalid || !csysreq) leaving_reset <= 1'b0;
  end
end


// Burst Response and Read Data channels sampling latency
// When PCL is set 1, the transaction will complete only
// one clock cycle after a valid response combination is
// catched, i.e, either (bvalid && bready) or
// (rvalid && rready && rlast) are true.
always @(posedge clk or negedge resetn) begin
  if(!resetn) begin
     bvalid_m_bus_reg <= {NMST{1'b0}};
     bready_m_bus_reg <= {NMST{1'b0}};
     rvalid_m_bus_reg <= {NMST{1'b0}};
     rready_m_bus_reg <= {NMST{1'b0}};
     rlast_m_bus_reg  <= {NMST{1'b0}};
  end
  else begin
     bvalid_m_bus_reg <= bvalid_m_bus;
     bready_m_bus_reg <= bready_m_bus;
     rvalid_m_bus_reg <= rvalid_m_bus;
     rready_m_bus_reg <= rready_m_bus;
     rlast_m_bus_reg  <= rlast_m_bus;
  end
end

assign bvalid_bus = (PCPL==1) ? bvalid_m_bus_reg : bvalid_m_bus;
assign bready_bus = (PCPL==1) ? bready_m_bus_reg : bready_m_bus;
assign rvalid_bus = (PCPL==1) ? rvalid_m_bus_reg : rvalid_m_bus;
assign rready_bus = (PCPL==1) ? rready_m_bus_reg : rready_m_bus;
assign rlast_bus  = (PCPL==1) ? rlast_m_bus_reg  : rlast_m_bus;


// Count active transations in the bus
always @(posedge clk or negedge resetn) begin
  if(!resetn) begin
     cnt_trans = 0;
  end
  else begin
     for(mst=0; mst < NMST; mst=mst+1) begin
        if (awvalid_m_bus[mst] && awready_m_bus[mst])
           cnt_trans = cnt_trans + 1;

        if (arvalid_m_bus[mst] && arready_m_bus[mst])
            cnt_trans = cnt_trans + 1;

        if (bvalid_bus[mst] && bready_bus[mst])
           cnt_trans = cnt_trans - 1;

        if (rvalid_bus[mst] && rready_bus[mst] && rlast_bus[mst])
            cnt_trans = cnt_trans - 1;
     end
     cnt_trans_reg <= cnt_trans;
  end
end

assign active_trans = (|cnt_trans_reg) || avalid;


always @(posedge clk or negedge resetn) begin
  if(!resetn) begin
     active_trans_dl <= 0;
  end
  else begin
     active_trans_dl <= active_trans;
  end
end


// Control no outstanding transactions counter
always @(posedge clklp or negedge resetn) begin
  if(!resetn) begin
     nopx_cnt <= NOPX;
  end
  else begin
     if (csysreq_lp_pe) begin
        nopx_cnt <= NOPX + 1;
     end
     else if (active_trans || (nopx_cnt==0) || (cactive===0)) begin
        nopx_cnt <= NOPX;
     end
     else begin
        nopx_cnt <= nopx_cnt - 1;
     end
  end
end


// ---------------------------------------------------------------------
// Entering in low power mode detection
// ---------------------------------------------------------------------
//                  ___     ___     ___     ___     ___     ___     ___
// clk          ___|   |___|   |___|   |___|   |___|   |___|   |___|   |
//                 T1      T2     T3      T4       T5      T6
//              ___                                 ___________________
// csysreq         |_______________________________|
//              ___________                                  __________
// csysack                 |________________________________|
//              ___________________                          __________
// cactive                         |________________________|
//                                  _______________
// low_power_on ___________________|               |___________________
//                                   _______
// low_power_on_pe _________________|       |___________________________
//                                          ________________
// low_power_ready ________________________|                |___________
//
// ---------------------------------------------------------------------

assign low_power_on = !csysreq && !cactive && !csysack;

always @(posedge clklp or negedge resetn) begin
  if(!resetn) begin
     low_power_on_dl <= 0;
  end
  else begin
     low_power_on_dl <= low_power_on;
  end
end

assign low_power_on_pe = low_power_on && !low_power_on_dl;

assign low_power_ready = low_power_on_dl;


// ---------------------------------------------------------------------
// Checker: check that csysack follows csysreq (1 clk cycle delayed)
//
//                  ___     ___     ___     ___     ___     ___
// clk          ___|   |___|   |___|   |___|   |___|   |___|   |
//              ___________                         ____________
// csysreq                 |_______________________|
//              ___________________                         _____
// csysreq_dl                      |_______________________|
//                          _______                 _______
// csysreq_edge ___________|       |_______________|       |_____
//
// csysreq_edge will detect csysreq edges. It will last for 1 clk cycle.
//
// - csysreq and csysack must be equal when csysreq_edge is 0
// - csysreq and csysack must be different when csysreq_edge is 1
//
// ---------------------------------------------------------------------

always @(posedge clklp) begin
  if((csysreq_edge == 1) && (csysreq == csysack)) begin
     $display("%0t, ERROR: LOW POWER I/F CHECKER - csysreq and csysack have the same value after csysreq transition!", $time);
  end
  else if((csysreq_edge == 0) && (csysreq != csysack)) begin
     $display("%0t, ERROR: LOW POWER I/F CHECKER - csysack is different from csysreq after csysreq transition!", $time);
  end
end


always @(posedge clk) begin
   // Check that cactive is deasserted when csysreq is deasserted
   if (
      // When there are no outstanding transactions pending in the bus
      // (!active_trans_dl) and csysreq deasserts (!csysreq) while the
      // no transactions counter is still being decremented (nopx_cnt!=0),
      // cactive should deassert.

      // cactive will deassert 1 clock cycle after csysreq deasserts. So
      // the checker should be evaluated in the second posedge of clock
      // after csysreq deasserts (csysreq_dl -> 0)
      csysreq_ne_dl && (cactive !== 0) && !active_trans

      ) begin
      $display("%0t, ERROR: LOW POWER I/F CHECKER - cactive should be deasserted when csysreq deasserts and there are no pending transactions in the bus!", $time);
   end


   // Check that cactive will deassert when counter reaches 0 (csysreq
   // is kept high)
   if (NOPX!=0) begin
      if (
         // When there are no Low Power Entry requests in the bus (csysreq)
         // and no outstanding transactions pending (!active_trans)
         csysreq && !active_trans

         // avoid when csysreq asserts at the same instant cactive is
         // deasserting because the counter have been elapsed. In this
         // scenario cactive will assert only in the next clock cycle
         // remaining low until that.
         && !csysreq_pe

         // and cactive deasserts while the no transactions counter is
         // still decrementing
            && ((cactive_ne && (nopx_cnt > 0))
               || (!cactive_ne && (nopx_cnt == 0)))

         // avoid when the system is leaving from reset
         && !leaving_reset

         ) begin
         $display("%0t, ERROR: LOW POWER I/F CHECKER - cactive should deassert after nopx counter reaches 0!", $time);
      end
   end


   // Check when leaving from reset cactive will deassert nopx counter cycles after
   // (csysreq is kept high)
   if (NOPX!=0) begin
      if (
         // When there are no Low Power Entry requests in the bus (csysreq)
         // and no outstanding transactions pending (!active_trans)
         csysreq && !active_trans

         // and cactive deasserts while the no transactions counter is
         // still decrementing
            && ((cactive_ne && (nopx_cnt > 0))
               || (!cactive_ne && (nopx_cnt == 0)))

         // Leaving from reset
         && leaving_reset
         ) begin
         $display("%0t, ERROR: LOW POWER I/F CHECKER - cactive should deassert after nopx counter reaches 0 immediately after reset!", $time);
      end
   end

   if ((cactive!==0) && (NOPX==0) && !active_trans && !csysack_pe) begin
      $display("%0t, ERROR: LOW POWER I/F CHECKER - cactive should be deasserted when there are no transactions pending in the bus!", $time);
   end

   // Check that cactive will assert when new transaction arrives into the bus
   if ((awvalid_m_bus || arvalid_m_bus) && !cactive) begin
      $display("%0t, ERROR: LOW POWER I/F CHECKER - cactive should assert when new transaction arrives into the bus!", $time);
   end

   // Check that cactive will remain asserted while there are pending transactions in the bus
   if (active_trans && (cactive===0)) begin
      $display("%0t, ERROR: LOW POWER I/F CHECKER - cactive should be asserted while there are transactions in the bus!", $time);
   end

   // Check cactive value after reset (0 if NOPX is zero; 1 if NOPX is greater than zero)
   if (resetn_edge &&
      (((NOPX==0) && (cactive!==0)) ||
      ((NOPX!=0) && (cactive===0)))) begin
      $display("%0t, ERROR: LOW POWER I/F CHECKER - after reset cactive should be at 0 if NOPX counter is 0; 1 if NOPX is greater than 0!", $time);
   end

   // Check that ready is held low during Low Power
   if (low_power_ready && ready) begin
      $display("%0t, ERROR: LOW POWER I/F CHECKER - ready should be held low during Low Power!", $time);
   end
end

always @(posedge clklp) begin

   // Check that cactive will assert at the same time as csysack after LPC requests exiting from Low Power
   if (csysreq_lp_pe_dl && (cactive===0) && !active_trans) begin
      $display("%0t, ERROR: LOW POWER I/F CHECKER - cactive should assert after Low Power Controller request!", $time);
   end

   // Check that if there is a buffer stage between the Master and the Slave ports the ready
   // signal will assert
   if (cactive_lp_pe) begin
      for(mstr=0; mstr < NMST; mstr=mstr+1) begin
        if ((AW_HAS_BUFF==1) & !awready_m_bus[mstr]) begin
           $display("%0t, ERROR: LOW POWER I/F CHECKER - awready for the master %d should assert after exiting from Low Power!", $time,mstr);
        end

        if ((AR_HAS_BUFF==1) & !arready_m_bus[mstr]) begin
           $display("%0t, ERROR: LOW POWER I/F CHECKER - arready for the master %d should assert after exiting from Low Power!", $time,mstr);
        end

        if ((W_HAS_BUFF==1) & !wready_m_bus[mstr]) begin
            $display("%0t, ERROR: LOW POWER I/F CHECKER - wready for the master %d should assert after exiting from Low Power!", $time,mstr);
         end
      end
   end

end



initial begin
   cvrg_lp_mode              = 0;
   cvrg_clk_cnt              = 0;
   cvrg_lpclk_cnt            = 0;
   cvrg_cactive_by_csysreq   = 0;
   cvrg_cactive_by_counter   = 0;

   cvrg_enter_lp_accept      = 0;
   cvrg_enter_lp_reject      = 0;
   cvrg_exit_lp_comp_req     = 0;
   cvrg_exit_lp_lpc_req      = 0;
   cvrg_exit_lp_after_reject = 0;

   cvrg_enter_lp_reject_flg  = 0;

end



// ---------------------------------------------------------------------
// The system enter in Low Power mode at least once
// ---------------------------------------------------------------------
always @(posedge clk) begin
   if (low_power_on_pe) begin
      cvrg_lp_mode = cvrg_lp_mode + 1;
   end
end

// ---------------------------------------------------------------------
// Cover Low Power clock disabled during Low Power mode
// ---------------------------------------------------------------------
always @(posedge clk) begin
   if (low_power_on) begin
      cvrg_clk_cnt = cvrg_clk_cnt + 1;
   end
end

always @(posedge clklp) begin
   if (low_power_on) begin
      cvrg_lpclk_cnt = cvrg_lpclk_cnt + 1;
   end
end

// ---------------------------------------------------------------------
// Cover cactive deasserting by csysreq deasserting
// ---------------------------------------------------------------------
always @(posedge clk) begin
//   if (csysreq_ne && cactive_ne && !active_trans && (nopx_cnt!=0)) begin
   if (csysreq_ne_dl && cactive_ne && !active_trans) begin
      cvrg_cactive_by_csysreq = cvrg_cactive_by_csysreq + 1;
   end
end

// ---------------------------------------------------------------------
// Cover cactive deasserting after nopx have been elapsed
// ---------------------------------------------------------------------
always @(posedge clk) begin
   if (csysreq && cactive_ne && !active_trans && (nopx_cnt==0)) begin
      cvrg_cactive_by_counter = cvrg_cactive_by_counter + 1;
   end
end



// ---------------------------------------------------------------------
// Cover Entering in Low Power mode - request accepted
// ---------------------------------------------------------------------
//                  ___     ___     ___     ___     ___     ___
// clk          ___|   |___|   |___|   |___|   |___|   |___|   |
//                         T1      T2     T3      T4
//              ___________________
// csysreq                         |____________________________
//              ___________________________
// csysack                                 |____________________
//              ___________
// cactive                 |____________________________________
//
// @T1 - cactive goes low
// @T2 - Low Power handshake request
// @T3 - Low Power handshake complete
// @T4 - Low Power request accepted
//
// ---------------------------------------------------------------------
always @(csysack) begin
   if (!csysack && !cactive) begin
      cvrg_enter_lp_accept = cvrg_enter_lp_accept + 1;
   end
end

// ---------------------------------------------------------------------
// Cover entering in Low Power mode - request rejected
// ---------------------------------------------------------------------
//                  ___     ___     ___     ___     ___     ___
// clk          ___|   |___|   |___|   |___|   |___|   |___|   |
//                         T1      T2     T3      T4       T5
//              ___________
// csysreq                 |____________________________________
//              ___________________
// csysack                         |____________________________
//                                  _______
// csysack_ne   ___________________|       |____________________
//              ___________________________________
// cactive                                         |____________
//
//
// @T1 - Low Power handshake request
// @T2 - Low Power handshake complete
// @T3 - Low Power request rejected
// @T4 - cactive goes low
// @T5 - Low Power mode activated
//
// ---------------------------------------------------------------------
always @(posedge clk) begin
   if (csysack_ne && cactive) begin
      cvrg_enter_lp_reject = cvrg_enter_lp_reject + 1;
   end
end


// ---------------------------------------------------------------------
// Cover Exiting from Low Power mode by component request
// ---------------------------------------------------------------------
//                  ___     ___     ___     ___     ___     ___
// clk          ___|   |___|   |___|   |___|   |___|   |___|   |
//                 T0      T1      T2     T3      T4
//                                  ____________________________
// csysreq      ___________________|
//                                          ____________________
// csyack       ___________________________|
//                          ____________________________________
// cactive      ___________|
//                          _______
// cactive_pe   ___________|       |____________________________
//
// @T0 - Low Power mode active
// @T1 - New transaction arrives in; cactive goes high
// @T2 - Exiting Low Power request
// @T3 - Exiting Low Power handshake complete
// @T4 - Normal Operation
//
// ---------------------------------------------------------------------
always @(posedge clk) begin
   if (cactive_pe && !csysreq) begin
      cvrg_exit_lp_comp_req = cvrg_exit_lp_comp_req + 1;
   end
end

// ---------------------------------------------------------------------
// Cover Exiting from Low Power mode by LPC request
// ---------------------------------------------------------------------
//                  ___     ___     ___     ___     ___     ___
// clk          ___|   |___|   |___|   |___|   |___|   |___|   |
//                 T0      T1      T2     T3
//                          ____________________________________
// csysreq      ___________|
//                                  ____________________________
// csyack       ___________________|
//                                  ____________________________
// cactive      ___________________|
//                          _______
// csysreq_pe   ___________|       |____________________________
//
// @T0 - Low Power mode active
// @T1 - Exiting Low Power request
// @T2 - Exiting Low Power handshake complete; cactive goes high
// @T3 - Normal Operation
//
// ---------------------------------------------------------------------
always @(posedge clk) begin
   if (csysreq_pe && !cactive) begin
      cvrg_exit_lp_lpc_req = cvrg_exit_lp_lpc_req + 1;
   end
end


// ---------------------------------------------------------------------
// Cover Exiting from Low Power mode after Low Power entering rejected
// ---------------------------------------------------------------------
//                  ___     ___     ___     ___     ___     ___     ___
// clk          ___|   |___|   |___|   |___|   |___|   |___|   |___|   |
//                 T1      T2     T3       T4     T5       T6      T7
//              ___                                 ___________________
// csysreq         |_______________________________|
//              ___________                                 __________
// csysack                 |_______________________________|
//                          _______
// csysack_ne   ___________|       |___________________________________
//              ___________________                         ___________
// cactive                         |_______________________|
//                                  _______________
// low_power_on ___________________|               |___________________
//
//              ___ _______________________________ ___________________
// next_rejstate___X_____________LpRej_____________X________FpRej______
//
//              ___________ _______________________________ __________
// rejstate     ___FpRej___X___________LpRej_______________X___FpRej__
//
//                                  ________________________
// *reject_flg  ___________________|                        |_________
//
// @T1 - Low Power request
// @T1 - Low Power handshake complete
// @T2 - Low Power request rejected
//       no outstanding transaction in the bus => cactive goes low
//       Low Power entry rejections flag goes high
// @T3 - Low Power mode activated
// @T5 - LPC requests Exiting from Low Power
// @T6 - Low Power handshake completed
//       Low Power entry rejections flag goes low
// @T7 - Normal Operation
//
// ---------------------------------------------------------------------


always@(*) begin
  next_rejstate = rejstate;
  case (rejstate)
     FpRej:
        begin
           cvrg_enter_lp_reject_flg = 1'b0;
           if(csysack_ne && (cactive || avalid)) begin
              next_rejstate = LpRej;
           end
        end
     LpRej:
        begin
            // assert the flag only when entering in Low Power
           if (low_power_on) begin
              cvrg_enter_lp_reject_flg = 1'b1;
           end

           if(csysreq) begin
              next_rejstate = FpRej;
           end
        end
  endcase
end

always@(posedge clk or negedge resetn) begin
  if(~resetn) begin
      rejstate <= FpRej;
  end
  else begin
      rejstate <= next_rejstate;
  end
end

always @(posedge clk) begin
  if (csysreq && !csysack && !cactive && cvrg_enter_lp_reject_flg) begin
     cvrg_exit_lp_after_reject = cvrg_exit_lp_after_reject + 1;
  end
end



always @(cvrgen) begin
   if (cvrgen==1) begin
      if (cvrg_lp_mode == 0) begin
         $display("WARNING: LOW POWER I/F CHECKER - The system should enter in Low Power mode at least once!");
      end else begin
         $display("INFO: LOW POWER I/F CHECKER - The system entered in Low Power %d times", cvrg_lp_mode);
      end

      if (cvrg_clk_cnt == cvrg_lpclk_cnt) begin
         $display("WARNING: LOW POWER I/F CHECKER -  The clock had not been removed in none of times the Low Power mode was active!");
      end

      if (cvrg_cactive_by_csysreq == 0) begin
         $display("WARNING: LOW POWER I/F CHECKER - The system did not cover cactive deasserting by csysreq deasserting!");
      end else begin
         $display("INFO: LOW POWER I/F CHECKER - The system entered in Low Power after Low Power Controller request %d times", cvrg_cactive_by_csysreq);
      end

      if (cvrg_cactive_by_counter == 0) begin
         $display("WARNING: LOW POWER I/F CHECKER - The system did not cover cactive deasserting after nopx have been elapsed!");
      end else begin
         $display("INFO: LOW POWER I/F CHECKER - The system had been ready for entering in Low Power mode %d times", cvrg_cactive_by_counter);
      end

      if (cvrg_enter_lp_accept == 0) begin
         $display("WARNING: LOW POWER I/F CHECKER - The system did not cover entering in Low Power mode - request accepted!");
      end else begin
         $display("INFO: LOW POWER I/F CHECKER - The system has accepted an entering in Low Power request %d times", cvrg_enter_lp_accept);
      end

      if (cvrg_enter_lp_reject == 0) begin
         $display("WARNING: LOW POWER I/F CHECKER - The system did not cover entering in Low Power mode - request rejected!");
      end else begin
         $display("INFO: LOW POWER I/F CHECKER - The system has rejected an entering in Low Power request %d times", cvrg_enter_lp_reject);
      end

      if (cvrg_exit_lp_comp_req == 0) begin
         $display("WARNING: LOW POWER I/F CHECKER - The system did not cover exiting from Low Power mode by component request!");
      end else begin
         $display("INFO: LOW POWER I/F CHECKER - The system exited from Low Power after new transaction arrives in %d times", cvrg_exit_lp_comp_req);
      end

      if (cvrg_exit_lp_lpc_req == 0) begin
         $display("WARNING: LOW POWER I/F CHECKER - The system did not cover exiting from Low Power mode by LPC request!");
      end else begin
         $display("INFO: LOW POWER I/F CHECKER - The system exited from Low Power after Low Power Controller request %d times", cvrg_exit_lp_lpc_req);
      end

      if (cvrg_exit_lp_after_reject == 0) begin
         $display("WARNING: LOW POWER I/F CHECKER - The system did not cover exiting from Low Power mode after Low Power entering rejected!");
      end else begin
         $display("INFO: LOW POWER I/F CHECKER - The system exited from Low Power after rejecting Low Power Controller request %d times", cvrg_exit_lp_after_reject);
      end

   end
end


endmodule

