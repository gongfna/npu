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
// -------------------------------------------------------------------------
//
// AUTHOR:    James Feagans      2/24/2005
//
// VERSION:   DW_axi_gs_sm Verilog Synthesis Model
//
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
// ABSTRACT:  AXI to Generic Interface (GIF) Slave Gasket State Machine
//
//
// This is the master state machine of the generic interface slave gasket.
// It controls the data path flow of the request and response modules.
//
// State machine (sm):
//                                |----|                           mread
// AXI Low-Power -----------------| sm |---------------------- GIF mwrite
//  Channel                       |____|                           mlast
//                                   |                             saccept
//                   <to/from req and resp data path>
//
//
// The state machine assigns just three control signals:
//   - start (starts a new read or write transaction)
//   - advance (advances a read or write transaction; also asserted upon start)
//   - next_state (next state of the state machine)
//
// The req and resp modules provide signals that inform the state machine of
// their present circumstances. The req module indicates its ability to deliver
// a new read or write transaction, and whether data is available to advance
// a write transaction. The resp module indicates its ability to accept
// additional transactions and additional responses, which depend on the level
// of its internal post transaction FIFOs (fifo_bid and fifo_rid) as well as
// the space available in its response FIFO (fifo_resp) in the case that the
// gasket is operating in GIF Lite mode.
//
// Based on these information signals from the data path modules, the state
// machine drives the start and advance control signals to direct the data flow
// of the req and resp modules.
//
// Since many of the transitions are shared among the various states, common
// Verilog tasks are utilized to consolidate logic and improve code readability.
//
// For performance reasons, a one-hot state machine is used. The GIF signals
// mread and mwrite are combinationally driven to minimize signal latency
// through the gasket, and therefore require as efficient logic as possible.
//
// Since the signals are for GIF, the state changes upon gclk.
//
//
// Notes on low-power
//
// Transitioning from high- to low-power mode is a two step process. The first
// step occurs only when there is no transaction request in progress and csysreq
// is deasserted. At this point, start and advance signals are deasserted and
// the state machine enters into the SM_TO_LOW_PWR state. From here, the state
// machine waits for acknowledgement from the resp module that all outstanding
// GIF responses are returned to AXI. In addition, this SM_TO_LOW_PWR state
// provides the req module the one cycle required to deassert its arready and
// awready signals before actually powering down. When the resp module
// acknowledges via the resp_cactive signal that it is safe to shut off the
// power, the state machine enters low-power mode and acknowledges the system
// clock controller via csysack and cactive.
//
// To wake up from low-power mode is a simple one step process. Upon the system
// clock controller's assertion of csysreq, the state machine asserts csysack
// and cactive the next clock cycle and immediately begins to process any
// transaction requests that may have been stored in the request FIFOs and
// again services new AXI transaction requests.
//
//-----------------------------------------------------------------------------
module g512_DW_axi_gs_sm(/*AUTOARG*/
  // Outputs
  csysack, cactive, mread, mwrite, start_wr, start_rd, advance_wr, 
  advance_rd, auto_sresp, auto_svalid, req_last_accepted, 
  sm_high_pwr, 
  // Inputs
  aclk, aresetn, csysreq, gclken, mlast, saccept, start_wr_valid, 
  start_rd_valid, advance_wr_valid, start_wr_ready, start_rd_ready, 
  advance_rd_ready, resp_cactive
  );


// ----------------------------------------------------------------------------
// PARAMETERS
// ----------------------------------------------------------------------------

// encoding of dual bit command signals "start" and "advance"
parameter CMD_IDLE = 2'b00,
	  CMD_WR   = 2'b01,
	  CMD_RD   = 2'b10;

// One-hot FSM
parameter SM_IDLE       = 0, // Idle, high-power mode
	  SM_WR	        = 1, // WR in progress, mwrite asserted
	  SM_RD	        = 2, // RD in progress, mread asserted
	  SM_WR_MWAIT   = 3, // WR in progress, mwrite de-asserted
	  SM_RD_MWAIT   = 4, // RD in progress, mread de-asserted
	  SM_TO_LOW_PWR = 5, // Enroute to low-power pending approval from resp
	  SM_LOW_PWR    = 6; // Low-power mode

parameter num_states = 7;


// ----------------------------------------------------------------------------
// PORTS
// ----------------------------------------------------------------------------

// AXI INTERFACE
// Global
input  aclk;
input  aresetn;
// Low-power Channel
input  csysreq;
output csysack;
output cactive;

// GENERIC SLAVE INTERFACE
// Global
input  gclken;
// Request
output mread;
output mwrite;
input  mlast;
input  saccept;

// INTERNAL CONNECTIONS
// Inputs from req
input  start_wr_valid;
input  start_rd_valid;
input  advance_wr_valid;
//input  exfail;
// Inputs from resp
input  start_wr_ready;
input  start_rd_ready;
input  advance_rd_ready;
input  resp_cactive;
// Outputs
output start_wr;
output start_rd;
output advance_wr;
output advance_rd;
output auto_sresp;
output auto_svalid;
output req_last_accepted;
output sm_high_pwr;

  
// ----------------------------------------------------------------------------
// INTERNAL SIGNALS
// ----------------------------------------------------------------------------

// State machine
reg  [num_states-1:0] state, next_state;

// Dual bit command signals
reg  [1:0] start, advance;

// Indicates req and resp modules can perform a new write or read request
wire sysok_start_wr, sysok_start_rd;

reg  prev_req_last_accepted;

// csysreq registered on gclk so SM is not disturbed during a transaction
reg  csysreq_int;


// ----------------------------------------------------------------------------
// DESIGN
// ----------------------------------------------------------------------------

// GIF outputs combinationally driven in order to avoid second register stage
assign {mread, mwrite} = {next_state[SM_RD], next_state[SM_WR]};

// Control signals that initiate new write and read transactions
assign {start_rd, start_wr} = start;

// Control signals that advance the beat of current write and read transactions
assign {advance_rd, advance_wr} = advance;

// Instructs response module to automatically generate GIF response signals
assign auto_sresp = advance_wr & mlast;
assign auto_svalid = (advance_wr & mlast) | advance_rd;

// Indicates whether transaction or beat has completed
assign req_last_accepted = |advance & mlast;

// Low-power mode acknowledgement
assign cactive = ~state[SM_LOW_PWR];
assign csysack = cactive;

// Indicates to req that arready and awready can be asserted
assign sm_high_pwr = ~state[SM_LOW_PWR] & ~state[SM_TO_LOW_PWR];

// Determine whether the gasket is ready to issue a new GIF transaction
assign sysok_start_wr = start_wr_valid & start_wr_ready;
assign sysok_start_rd = start_rd_valid & start_rd_ready;


// This task provides the state transitions that initiate new RD/WR transactions
task gen_idle;
  input csysreq_int;
  input sysok_start_rd;
  input sysok_start_wr;
  input saccept;
  output [1:0] start;
  output [1:0] advance;
  output [num_states-1:0] next_state;
  begin
    next_state = 0;
    if (!csysreq_int) begin
      start      = 2'b00;
      advance    = 2'b00;
      next_state[SM_TO_LOW_PWR] = 1'b1;
    end
    else begin
      start      = {sysok_start_rd, sysok_start_wr};
      if(saccept)
        advance = start;
      else
        advance = CMD_IDLE;
      case (start)
        CMD_WR: begin
          next_state[SM_WR] = 1'b1;
        end
	CMD_RD:   next_state[SM_RD] = 1'b1;
	default:  next_state[SM_IDLE] = 1'b1;
      endcase
    end
  end
endtask

// This task provides the state transitions that continue a WR transaction
task gen_wr;
  input advance_wr_valid;
  input saccept;
  output [1:0] start;
  output [1:0] advance;
  output [num_states-1:0] next_state;
  begin
    start      = CMD_IDLE;
    next_state = 0;
    if (advance_wr_valid) begin // if gasket is ready, advance
      if(saccept)
        advance = CMD_WR;
      else
        advance = CMD_IDLE;
      next_state[SM_WR] = 1'b1;
    end
    else begin // wait for gasket to get wdata
      advance    = CMD_IDLE;
      next_state[SM_WR_MWAIT] = 1'b1;
    end
  end
endtask

// This task provides the state transitions that continue a RD transaction
task gen_rd;
  input advance_rd_ready;
  input saccept;
  output [1:0] start;
  output [1:0] advance;
  output [num_states-1:0] next_state;
  begin
    start      = CMD_IDLE;
    next_state = 0;
    if (advance_rd_ready) begin // if gasket is ready, advance
      if(saccept)
        advance = CMD_RD;
      else
        advance = CMD_IDLE;
      next_state[SM_RD] = 1'b1;
    end
    else begin // wait for gasket to become ready
      advance    = CMD_IDLE;
      next_state[SM_RD_MWAIT] = 1'b1;
    end
  end
endtask


// State Machine
// Since many states have the same transition condition/action pair, Verilog
// tasks are utilized to improve code readability.
always @(state or sysok_start_wr or sysok_start_rd or prev_req_last_accepted or
   saccept or advance_wr_valid or advance_rd_ready or csysreq_int or
   resp_cactive)  
begin : MAIN

  next_state = 0;

  case (1'b1)
  
    state[SM_IDLE]:
      gen_idle(csysreq_int,sysok_start_rd,sysok_start_wr,saccept,start, advance, next_state); 

    state[SM_WR]: begin
      if (prev_req_last_accepted)
        // current transaction request finished
        gen_idle(csysreq_int,sysok_start_rd,sysok_start_wr,saccept,start, advance, next_state); 
      else
        // continue current transaction request
        gen_wr(advance_wr_valid,saccept,start, advance, next_state);
    end

    state[SM_WR_MWAIT]:
      gen_wr(advance_wr_valid,saccept,start, advance, next_state);

    state[SM_RD]: begin
      if (prev_req_last_accepted)
        // current transaction request finished
        gen_idle(csysreq_int,sysok_start_rd,sysok_start_wr,saccept,start, advance, next_state); 
      else
        // continue current transaction request
        gen_rd(advance_rd_ready,saccept,start, advance, next_state);
    end

    state[SM_RD_MWAIT]:
      gen_rd(advance_rd_ready,saccept,start, advance, next_state);
  
    state[SM_TO_LOW_PWR]: begin
      start      = CMD_IDLE;
      advance    = CMD_IDLE;
      if (!resp_cactive) next_state[SM_LOW_PWR] = 1'b1;
      else               next_state[SM_TO_LOW_PWR] = 1'b1;
    end

    state[SM_LOW_PWR]: begin
      start      = CMD_IDLE;
      advance    = CMD_IDLE;
      if (csysreq_int) next_state[SM_IDLE] = 1'b1;
      else             next_state[SM_LOW_PWR] = 1'b1;
    end

    default: begin
      start      = CMD_IDLE;
      advance    = CMD_IDLE;      
      next_state[SM_IDLE] = 1'b1;
    end
    
  endcase
end // MAIN


// ----------------------------------------------------------------------------
// Flip Flops
// ----------------------------------------------------------------------------

always @(posedge aclk or negedge aresetn)
begin : DFF
  if (!aresetn) begin
    state[num_states-1:1]  <= 0;
    state[SM_IDLE]         <= 1'b1;
    prev_req_last_accepted <= 1'b0;
    csysreq_int            <= 1'b1;
  end
  else begin
    if (gclken) begin
      state                  <= next_state;
      prev_req_last_accepted <= req_last_accepted;
      csysreq_int            <= csysreq;
    end
    else begin
      state                  <= state;
      prev_req_last_accepted <= prev_req_last_accepted;
      csysreq_int            <= csysreq_int;
    end
  end
end // DFF

endmodule
