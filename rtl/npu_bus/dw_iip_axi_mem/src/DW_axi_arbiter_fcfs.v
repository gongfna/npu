
////////////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2004 - 2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// Filename    : DW_axi_arbiter_fcfs.v
// Author      : James Feagans     May 20, 2004
// Description : DW_axi_arbiter_fcfs.v Verilog module for DWbb
//
// DesignWare IP ID: 22c35740
//
////////////////////////////////////////////////////////////////////////////////

// NOTE.
//jstokes, 31.03.2010, originally BCM54, name changed after custom DW_axi
//changes added - at comment marked with "jstokes"

// ABSTRACT:  Arbiter with first-come-first-served priority scheme
//   
// MODIFIED:
  module DW_axi_arbiter_fcfs (
	clk,
	rst_n,
  init_n,
	enable,
	request,
	lock,
	mask,
  use_other_pri,
  bus_pri_other,
  bus_gnt_lk_i,
	parked,
	granted,
	locked,
	grant,
	grant_index,
  bus_pri
);

  parameter n                = 4; // RANGE 2 to 32
  parameter park_mode        = 1; // RANGE 0 or 1
  parameter park_index       = 0; // RANGE 0 to (n - 1)
  parameter output_mode      = 1; // RANGE 0 or 1
  `define m n+1
  parameter index_width = 2; // RANGE 1 to 5
  parameter real_index_width = 3; // RANGE 2 to 6
  parameter HAS_LOCKING = 0; // Locking features required.



  input				clk;	 // clock input
  input				rst_n;	 // active low reset
  input				init_n;	 // active low reset
  input				enable;	 // active high register enable
  input  [n-1: 0]		request; // client request bus
  input  [n-1: 0]		lock;	 // client lock bus
  input  [n-1: 0]		mask;	 // client mask bus
  // Internal priority bus from the other channels arbiter.
  input  [(n*real_index_width)-1: 0] bus_pri_other;

  // 1 means use the internal priority of the other
  // address channel arbiter.
  input [n-1:0]		use_other_pri;
  // Bit asserted for granted locking client.
  input [n-1:0] bus_gnt_lk_i;

  output			parked;	 // arbiter parked status flag
  output			granted; // arbiter granted status flag
  output			locked;	 // arbeter locked status bus
  output [n-1: 0]		grant;	 // one-hot granted client bus
  output [index_width-1: 0]	grant_index; //ndex of current granted client 

  // Send internal priority to other address channel.
  output [(n*real_index_width)-1: 0] bus_pri;



wire   [1:0] current_state, next_state_ff, st_vec;
reg    [1:0] next_state, state_ff;

reg    [n-1: 0] next_grant;
wire   [index_width-1: 0] next_grant_index;
wire   next_parked, next_granted, next_locked;

reg    [n-1: 0] grant_int;
wire   [index_width-1: 0] grant_index_int;
reg    parked_int, granted_int, locked_int;


wire   [real_index_width-1: 0] max_prior, maxp1_priority;
wire   [n-1: 0] masked_req;


wire   [(n*real_index_width)-1: 0] prior, next_priority_ff;
reg    [(n*real_index_width)-1: 0] priority_ff;

reg    [(n*real_index_width)-1: 0] decr_prior;

reg    [(n*real_index_width)-1: 0] priority_vec;

reg    [(n*real_index_width)-1: 0] muxed_pri_vec;

reg    [(n*real_index_width)-1: 0] next_prior;

wire   [index_width-1: 0] current_index;

wire   [real_index_width-1: 0] priority_value;

wire   [n-1: 0] temp_gnt;

wire   [n-1: 0] p_index, p_index_temp;

reg    [index_width-1: 0] grant_index_n_int;
wire   [index_width-1: 0] next_grant_index_n;


  assign maxp1_priority = (n > ((1 << index_width) - 1'b1)) ?
    n: ((1 << index_width) - 1'b1);
  assign max_prior = maxp1_priority - 1'b1;

  assign masked_req = request & ~mask;

  assign next_locked = |(grant_int & lock);

  assign next_granted = next_locked | (|masked_req);

  assign next_parked = ~next_granted;


  always @(prior or masked_req or maxp1_priority) begin : PROC_reorder_input
    integer i1, j1;
    for (i1=0 ; i1<n ; i1=i1+1) begin
      for (j1=0 ; j1<real_index_width ; j1=j1+1) begin
	priority_vec[i1*real_index_width+j1] = (j1 == index_width) ?
          1'b0: prior[i1*real_index_width+j1];
	muxed_pri_vec[i1*real_index_width+j1] = (masked_req[i1]) ?
          priority_vec[i1*real_index_width+j1]: maxp1_priority[j1];
      end
    end
  end

  always @(prior) begin : PROC_predec
    integer i2, j2, k2;
    reg  [(real_index_width)-1: 0] temp_prior, temp2_prior;
    for (i2=0 ; i2<n ; i2=i2+1) begin
      for (j2=0 ; j2<real_index_width ; j2=j2+1) begin
        temp_prior[j2] = prior[i2*real_index_width+j2];
      end

      temp2_prior = temp_prior - 1'b1;

      for (k2=0 ; k2<real_index_width ; k2=k2+1) begin
        decr_prior[i2*real_index_width+k2] = temp2_prior[k2];
      end

    end
  end


  assign st_vec = {next_parked, next_locked};

  always @(current_state or st_vec) begin : PROC_mk_nxt_st
    case (current_state)
    2'b00: begin
      case (st_vec)
      2'b00: next_state = 2'b10;
      2'b10: next_state = 2'b01;
      default: next_state = 2'b00;
      endcase
    end
    2'b01: begin
      case (st_vec)
      2'b00: next_state = 2'b10;
      2'b01: next_state = 2'b11;
      default: next_state = 2'b01;
      endcase
    end
    2'b10: begin
      case (st_vec)
      2'b01: next_state = 2'b11;
      2'b10: next_state = 2'b01;
      default: next_state = 2'b10;
      endcase
    end
    default: begin
      case (st_vec)
      2'b00: next_state = 2'b10;
      2'b10: next_state = 2'b01;
      default: next_state = 2'b11;
      endcase
    end
    endcase
  end

  assign current_state = state_ff ^ 2'b00;
  assign next_state_ff = next_state ^ 2'b00;

  always @(current_state or masked_req or next_grant or prior or
                    next_locked or decr_prior or max_prior) begin : PROC_mk_nxt_prior
    integer i3, j3;
    for (i3=0 ; i3<n ; i3=i3+1) begin
      for (j3=0 ; j3<real_index_width ; j3=j3+1) begin
        case (current_state)
        2'b00: begin
          if (masked_req[i3]) begin
            if (next_grant[i3]) begin
              next_prior[i3*real_index_width+j3] = max_prior[j3];
            end else begin
              next_prior[i3*real_index_width+j3] = decr_prior[i3*real_index_width+j3];
            end
          end else begin
            next_prior[i3*real_index_width+j3] = max_prior[j3];
          end
        end
        2'b01: begin
          if (next_locked) begin
            if (masked_req[i3]) begin
              if (next_grant[i3]) begin
                next_prior[i3*real_index_width+j3] = prior[i3*real_index_width+j3];
              end else begin
                next_prior[i3*real_index_width+j3] = decr_prior[i3*real_index_width+j3];
              end
            end else begin
              next_prior[i3*real_index_width+j3] = max_prior[j3];
            end
          end else begin
            if (masked_req[i3]) begin
              if (next_grant[i3]) begin
                next_prior[i3*real_index_width+j3] = max_prior[j3];
              end else begin
                next_prior[i3*real_index_width+j3] = decr_prior[i3*real_index_width+j3];
              end
            end else begin
              next_prior[i3*real_index_width+j3] = max_prior[j3];
            end
          end
        end
        default: begin
          if (next_locked) begin
            if (masked_req[i3] == 1'b0) begin
              next_prior[i3*real_index_width+j3] = max_prior[j3];
            end else begin
              next_prior[i3*real_index_width+j3] = prior[i3*real_index_width+j3];
            end
          end else begin
            if (masked_req[i3] == 1'b0) begin
              next_prior[i3*real_index_width+j3] = max_prior[j3];
            end else begin
              if (next_grant[i3]) begin
                next_prior[i3*real_index_width+j3] = max_prior[j3];
              end else begin
                next_prior[i3*real_index_width+j3] = decr_prior[i3*real_index_width+j3];
              end
            end
          end
        end

        endcase
      end
    end
  end


  
    DW_axi_bcm01
     #(real_index_width, n, index_width) U_minmax (
		.a(muxed_pri_vec),
		.tc(1'b0),
		.min_max(1'b0),
		.value(priority_value),
		.index(current_index) );


  
  function [n-1:0] func_decode;
    input [index_width-1:0]		A;	// input
    reg   [n-1:0]		z;
    reg   [31:0]		i;
    begin
      z = {n{1'b0}};
      for (i=0 ; i<n ; i=i+1) begin
	if (i == A) begin
	  z [i] = 1'b1;
	end // if
      end // for (i
      func_decode = z;
    end
  endfunction

  assign temp_gnt = func_decode(current_index);

  
  function [n-1:0] func_decode_p_index;
    input [index_width-1:0]		A;	// input
    reg   [n-1:0]		z;
    reg   [31:0]		i;
    begin
      z = {n{1'b0}};
      for (i=0 ; i<n ; i=i+1) begin
	if (i == A) begin
	  z [i] = 1'b1;
	end // if
      end // for (i
      func_decode_p_index = z;
    end
  endfunction

  assign p_index_temp = func_decode_p_index(park_index);

  assign p_index = (park_mode == 0) ? {n{1'b0}}: p_index_temp;

  always @(next_parked or next_locked or grant_int or p_index or temp_gnt) begin : PROC_mk_nxt_gr
    case ({next_parked, next_locked}) 
    2'b00: next_grant = temp_gnt;
    2'b01: next_grant = grant_int;
    2'b10: next_grant = p_index;
    default: next_grant = grant_int;
    endcase
  end


  
  function [index_width-1:0] func_binenc;
    input [n-1:0]		a;	// input
    reg   [index_width-1:0]		z;
    reg   [31:0]		i,j;
    begin
      z = {index_width{1'b1}};
      for (i=n ; i > 0 ; i=i-1) begin
        j = i-1;
	if (a[j] == 1'b1)
	  z = j [index_width-1:0];
      end // for (i
      func_binenc = z;
    end
  endfunction

  assign next_grant_index = func_binenc(next_grant);


  always @(posedge clk or negedge rst_n) begin : PROC_regs
    integer x1, y1;
    integer x2, y2;
    if (~rst_n) begin
      state_ff            <= 2'b00;
      priority_ff         <= {n*real_index_width{1'b0}};
      grant_index_n_int   <= {index_width{1'b0}};
      parked_int          <= 1'b0;
      granted_int         <= 1'b0;
      locked_int          <= 1'b0;
      grant_int           <= {n{1'b0}};
    end else if (init_n == 1'b0) begin
      state_ff            <= 2'b00;
      priority_ff         <= {n*real_index_width{1'b0}};
      grant_index_n_int   <= {index_width{1'b0}};
      parked_int          <= 1'b0;
      granted_int         <= 1'b0;
      locked_int          <= 1'b0;
      grant_int           <= {n{1'b0}};
    end else if (enable) begin
      state_ff            <= next_state_ff;
      grant_index_n_int   <= next_grant_index_n;
      parked_int          <= next_parked;
      granted_int         <= next_granted;
      locked_int          <= next_locked;
      grant_int           <= next_grant;

      // jstokes, 31.03.2010
      // Take internal priority from the other address channel for locking
      // clients when instructed.
      if(HAS_LOCKING) begin
        for (x1=0 ; x1<n ; x1=x1+1) begin
          if(use_other_pri[x1]) begin
            for (y1=0 ; y1<real_index_width ; y1=y1+1) begin
              priority_ff[x1*real_index_width+y1]
                <= bus_pri_other[x1*real_index_width+y1];
            end
          end else begin
            for (y1=0 ; y1<real_index_width ; y1=y1+1) begin
              priority_ff[x1*real_index_width+y1]
                <= next_priority_ff[x1*real_index_width+y1];
            end
          end
        end
      end else begin
        priority_ff <= next_priority_ff;
      end
    end
  end

  // jstokes, 31.03.2010
  // Send internal priority to the other address channel.
  assign bus_pri = next_priority_ff;

  assign next_priority_ff = {n{max_prior}} ^ next_prior;
  assign prior = {n{max_prior}} ^ priority_ff;

  assign next_grant_index_n  = ~next_grant_index;
  assign grant_index_int     = ~grant_index_n_int;

  assign grant       = (output_mode == 0) ? next_grant :
                        grant_int;
  assign grant_index = (output_mode == 0) ? next_grant_index :
                        grant_index_int;
  assign granted     = (output_mode == 0) ? next_granted : 
	                granted_int;
  assign parked      = (park_mode == 0) ? 1'b0:
                         (output_mode == 0) ? next_parked : 
	                  parked_int;
  assign locked      = (output_mode == 0) ? next_locked : 
	                locked_int;

endmodule
