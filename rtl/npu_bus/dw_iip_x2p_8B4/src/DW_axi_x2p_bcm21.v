
////////////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2005 - 2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// Filename    : DW_axi_x2p_bcm21.v
// Author      : Doug Lee    2/20/05
// Description : DW_axi_x2p_bcm21.v Verilog module for DWbb
//
// DesignWare IP ID: a737444c
//
////////////////////////////////////////////////////////////////////////////////



module DW_axi_x2p_bcm21 (
    clk_d,
    rst_d_n,
    init_d_n,
    data_s,
    test,
    data_d
    );

parameter WIDTH        = 1;  // RANGE 1 to 1024
parameter F_SYNC_TYPE  = 2;  // RANGE 0 to 4
parameter TST_MODE     = 0;  // RANGE 0 to 1
parameter VERIF_EN     = 1;  // RANGE 0 to 4


input			clk_d;      // clock input from destination domain
input			rst_d_n;    // active low asynchronous reset from destination domain
input			init_d_n;   // active low synchronous reset from destination domain
input  [WIDTH-1:0]      data_s;     // data to be synchronized from source domain
input                   test;       // test input
output [WIDTH-1:0]      data_d;     // data synchronized to destination domain


reg    [WIDTH-1:0]      sample_nsyncf;
reg    [WIDTH-1:0]      sample_syncf;
reg    [WIDTH-1:0]      sample_syncm1;
reg    [WIDTH-1:0]      sample_syncm2;
reg    [WIDTH-1:0]      sample_syncl;
reg    [WIDTH-1:0]      test_hold;

wire   [WIDTH-1:0]      tst_mode_selected;
wire   [WIDTH-1:0]      f_sync_type_is_0_data;
wire   [WIDTH-1:0]      next_sample_syncf;
wire   [WIDTH-1:0]      next_sample_syncm1;
wire   [WIDTH-1:0]      next_sample_syncm2;
wire   [WIDTH-1:0]      next_sample_syncl;



// leda off
`ifdef SYNTHESIS `else
  initial begin
    if ((F_SYNC_TYPE > 0)&&(F_SYNC_TYPE < 8))
       $display("Information: *** Instance %m module is using the <Double Register Synchronizer (1)> Clock Domain Crossing Method ***");
  end

`ifdef DW_REPORT_SYNC_PARAMS
  initial begin
    if ((F_SYNC_TYPE & 7) > 0)
      $display("Information: *** Instance %m is configured as follows: WIDTH is: %0d, F_SYNC_TYPE is: %0d, TST_MODE is: %0d ***", WIDTH, (F_SYNC_TYPE & 7), TST_MODE);
  end
`endif
`endif
// leda on


`ifdef SYNTHESIS
`define DW_data_s_int  data_s
`else
`ifdef DW_MODEL_MISSAMPLES
// leda off
  initial begin
    $display("Information: %m: *** Running with DW_MODEL_MISSAMPLES defined, VERIF_EN is: %0d ***",
			VERIF_EN);
  end

wire			hclk_odd;
reg  [WIDTH-1:0]	last_data_dyn, data_s_delta_t;
reg  [WIDTH-1:0]	last_data_s, last_data_s_q, last_data_s_qq;
wire [WIDTH-1:0]	data_s_sel_0, data_s_sel_1;
reg  [WIDTH-1:0]	data_select; initial data_select = 0;
reg  [WIDTH-1:0]	data_select_2; initial data_select_2 = 0;


  initial data_s_delta_t = {WIDTH{1'b0}};

  always @ (data_s) begin : PROC_delta_delay
    data_s_delta_t <= data_s;
  end // PROC_delta_delay

  always @ (posedge hclk_odd or data_s) begin : PROC_catch_last_data
    last_data_dyn <= data_s_delta_t;
  end // PROC_catch_last_data

  assign hclk_odd = (VERIF_EN % 2)? clk_d : ~clk_d;

  always @ (posedge clk_d or negedge rst_d_n) begin : PROC_missample_hist_even
    if (rst_d_n == 1'b0) begin
      last_data_s_q  <= {WIDTH{1'b0}};
    end else if (init_d_n == 1'b0) begin
      last_data_s_q  <= {WIDTH{1'b0}};
    end else begin
      last_data_s_q <= last_data_s;
    end
  end // PROC_missample_hist_even

  always @ (posedge hclk_odd or negedge rst_d_n) begin : PROC_missample_hist_odd
    if (rst_d_n == 1'b0) begin
      last_data_s <= {WIDTH{1'b0}};
      last_data_s_qq  <= {WIDTH{1'b0}};
    end else if (init_d_n == 1'b0) begin
      last_data_s <= {WIDTH{1'b0}};
      last_data_s_qq  <= {WIDTH{1'b0}};
    end else begin
      last_data_s <= data_s;
      last_data_s_qq <= last_data_s_q;
    end
  end // PROC_missample_hist_odd

  always @ (data_s or last_data_s) begin : PROC_mk_next_data_select
    if (data_s != last_data_s) begin
      data_select = wide_random(WIDTH);

      if ((VERIF_EN == 2) || (VERIF_EN == 3))
	data_select_2 = wide_random(WIDTH);
      else
	data_select_2 = {WIDTH{1'b0}};
    end
  end  // PROC_mk_next_data_select

  assign data_s_sel_0 = (VERIF_EN < 1)? data_s : ((data_s & ~data_select) | (last_data_dyn & data_select));

  assign data_s_sel_1 = (VERIF_EN < 2)? {WIDTH{1'b0}} : ((last_data_s_q & ~data_select) | (last_data_s_qq & data_select));

`define DW_data_s_int  ((data_s_sel_0 & ~data_select_2) | (data_s_sel_1 & data_select_2))

  function [WIDTH-1:0] wide_random;
    input [31:0]        in_width;   // should match "WIDTH" parameter -- need one input to satisfy Verilog function requirement

    reg   [WIDTH-1:0]   temp_result;
    reg   [31:0]        rand_slice;
    integer             i, j, base;


    begin
      temp_result = $random;
      if (((WIDTH / 32) + 1) > 1) begin
        for (i=1 ; i < ((WIDTH / 32) + 1) ; i=i+1) begin
          base = i << 5;
          rand_slice = $random;
          for (j=0 ; ((j < 32) && (base+j < in_width)) ; j=j+1) begin
            temp_result[base+j] = rand_slice[j];
          end
        end
      end

      wide_random = temp_result;
    end
  endfunction  // wide_random

  initial begin : seed_random_PROC
    integer seed, init_rand;
    `ifdef DW_MISSAMPLE_SEED
      seed = `DW_MISSAMPLE_SEED;
    `else
      seed = 32'h0badbeef;
    `endif

    init_rand = $random(seed);
  end // seed_random_PROC

// leda on
`else
`define DW_data_s_int  data_s
`endif
`endif

// leda W161 off
  assign tst_mode_selected  = (TST_MODE == 1) ? test_hold : data_s;
// leda W161 on
  assign f_sync_type_is_0_data  = (test == 1'b1) ? tst_mode_selected : data_s;

  assign next_sample_syncf  = (test == 1'b0) ? `DW_data_s_int : tst_mode_selected;
// leda W161 off
  assign next_sample_syncm1 = ((F_SYNC_TYPE & 7) == 1) ? sample_nsyncf : sample_syncf;
  assign next_sample_syncm2 = sample_syncm1;
  assign next_sample_syncl  = ((F_SYNC_TYPE & 7) == 3) ? sample_syncm1 : 
				((F_SYNC_TYPE & 7) == 4) ? sample_syncm2 : next_sample_syncm1;
// leda W161 on


// leda S_2C_R off
// leda DFT_003 off
// NTL_CLK05: Data must be registered by 2 or more flipflops when crossing 
// clock domain
// sample_nsyncf captures async data on the negedge, this will be
// registered once more before the output, which leda does not detect.
// leda NTL_CLK05 off
  always @ (negedge clk_d or negedge rst_d_n) begin : PROC_negedge_registers
    if (rst_d_n == 1'b0) begin
      sample_nsyncf    <= {WIDTH{1'b0}};
      test_hold        <= {WIDTH{1'b0}};
    end else if (init_d_n == 1'b0) begin
      sample_nsyncf    <= {WIDTH{1'b0}};
      test_hold        <= {WIDTH{1'b0}};
    end else begin
      sample_nsyncf    <= `DW_data_s_int;
      test_hold        <= data_s;
    end
  end
// leda DFT_003 on
// leda S_2C_R on
// leda NTL_CLK05 on


// NTL_CLK05: Data must be registered by 2 or more flipflops when crossing 
// clock domain
// sample_nsyncf captures async data on the negedge, this will be
// registered once more before the output, which leda does not detect.
// leda NTL_CLK05 off
  always @ (posedge clk_d or negedge rst_d_n) begin : PROC_posedge_registers
    if (rst_d_n == 1'b0) begin
      sample_syncf     <= {WIDTH{1'b0}};
      sample_syncm1    <= {WIDTH{1'b0}};
      sample_syncm2    <= {WIDTH{1'b0}};
      sample_syncl     <= {WIDTH{1'b0}};
    end else if (init_d_n == 1'b0) begin
      sample_syncf     <= {WIDTH{1'b0}};
      sample_syncm1    <= {WIDTH{1'b0}};
      sample_syncm2    <= {WIDTH{1'b0}};
      sample_syncl     <= {WIDTH{1'b0}};
    end else begin
      sample_syncf     <= next_sample_syncf;
      sample_syncm1    <= next_sample_syncm1;
      sample_syncm2    <= next_sample_syncm2;
      sample_syncl     <= next_sample_syncl;
    end
  end
// leda NTL_CLK05 on

  assign data_d = ((F_SYNC_TYPE & 7) == 0) ? f_sync_type_is_0_data : sample_syncl;

`undef DW_data_s_int
endmodule
