/* verilog_memcomp Version: 4.0.5-EAC1 */
/* common_memcomp Version: 4.0.5-beta22 */
/* lang compiler Version: 4.1.6-beta1 Jul 19 2012 13:55:19 */
//
//       CONFIDENTIAL AND PROPRIETARY SOFTWARE OF ARM PHYSICAL IP, INC.
//      
//       Copyright (c) 1993 - 2018 ARM Physical IP, Inc.  All Rights Reserved.
//      
//       Use of this Software is subject to the terms and conditions of the
//       applicable license agreement with ARM Physical IP, Inc.
//       In addition, this Software is protected by patents, copyright law 
//       and international treaties.
//      
//       The copyright notice(s) in this Software does not indicate actual or
//       intended publication of this Software.
//
//      Verilog model for Synchronous Two-Port Register File
//
//       Instance Name:              s40dpsf_npu_1024x30
//       Words:                      1024
//       Bits:                       30
//       Mux:                        4
//       Drive:                      6
//       Write Mask:                 Off
//       Write Thru:                 Off
//       Extra Margin Adjustment:    On
//       Redundant Columns:          0
//       Test Muxes                  Off
//       Power Gating:               Off
//       Retention:                  On
//       Pipeline:                   Off
//       Read Disturb Test:	        Off
//       
//       Creation Date:  Sat Jul 28 13:32:10 2018
//       Version: 	r1p1
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v3.0 or v2.1) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All buses are modeled [MSB:LSB].  All 
//          ports are padded with Verilog primitives.
//
//      Modeling Limitations: None.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//
`timescale 1 ns/1 ps
`define ARM_MEM_PROP 1.000
`define ARM_MEM_RETAIN 1.000
`define ARM_MEM_PERIOD 3.000
`define ARM_MEM_WIDTH 1.000
`define ARM_MEM_SETUP 1.000
`define ARM_MEM_HOLD 0.500
`define ARM_MEM_COLLISION 3.000
// If ARM_UD_MODEL is defined at Simulator Command Line, it Selects the Fast Functional Model
`ifdef ARM_UD_MODEL

// Following parameter Values can be overridden at Simulator Command Line.

// ARM_UD_DP Defines the delay through Data Paths, for Memory Models it represents BIST MUX output delays.
`ifdef ARM_UD_DP
`else
`define ARM_UD_DP #0.001
`endif
// ARM_UD_CP Defines the delay through Clock Path Cells, for Memory Models it is not used.
`ifdef ARM_UD_CP
`else
`define ARM_UD_CP
`endif
// ARM_UD_SEQ Defines the delay through the Memory, for Memory Models it is used for CLK->Q delays.
`ifdef ARM_UD_SEQ
`else
`define ARM_UD_SEQ #0.01
`endif

`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module s40dpsf_npu_1024x30 (VDDCE, VDDPE, VSSE, QA, CLKA, CENA, AA, CLKB, CENB, AB,
    DB, EMAA, EMAB, RET1N, COLLDISN);
`else
module s40dpsf_npu_1024x30 (QA, CLKA, CENA, AA, CLKB, CENB, AB, DB, EMAA, EMAB, RET1N,
    COLLDISN);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 30;
  parameter WORDS = 1024;
  parameter MUX = 4;
  parameter MEM_WIDTH = 120; // redun block size 4, 60 on left, 60 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 30 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 0;
  parameter UPMS_WIDTH = 0;

  output [29:0] QA;
  input  CLKA;
  input  CENA;
  input [9:0] AA;
  input  CLKB;
  input  CENB;
  input [9:0] AB;
  input [29:0] DB;
  input [2:0] EMAA;
  input [2:0] EMAB;
  input  RET1N;
  input  COLLDISN;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  reg pre_charge_st;
  reg pre_charge_st_a;
  reg pre_charge_st_b;
  integer row_address;
  integer mux_address;
  reg [119:0] mem [0:255];
  reg [119:0] row, row_t;
  reg LAST_CLKA;
  reg [119:0] row_mask;
  reg [119:0] new_data;
  reg [119:0] data_out;
  reg [29:0] readLatch0;
  reg [29:0] shifted_readLatch0;
  reg [29:0] readLatch1;
  reg [29:0] shifted_readLatch1;
  reg LAST_CLKB;
  reg [29:0] QA_int;
  reg [29:0] writeEnable;
  real previous_CLKA;
  real previous_CLKB;
  initial previous_CLKA = 0;
  initial previous_CLKB = 0;
  reg READ_WRITE, WRITE_WRITE, READ_READ, ROW_CC, COL_CC;
  reg READ_WRITE_1, WRITE_WRITE_1, READ_READ_1;
  reg  cont_flag0_int;
  reg  cont_flag1_int;
  initial cont_flag0_int = 1'b0;
  initial cont_flag1_int = 1'b0;
  reg clk0_int;
  reg clk1_int;

  wire [29:0] QA_;
 wire  CLKA_;
  wire  CENA_;
  reg  CENA_int;
  reg  CENA_p2;
  wire [9:0] AA_;
  reg [9:0] AA_int;
 wire  CLKB_;
  wire  CENB_;
  reg  CENB_int;
  reg  CENB_p2;
  wire [9:0] AB_;
  reg [9:0] AB_int;
  wire [29:0] DB_;
  reg [29:0] DB_int;
  wire [2:0] EMAA_;
  reg [2:0] EMAA_int;
  wire [2:0] EMAB_;
  reg [2:0] EMAB_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire  COLLDISN_;
  reg  COLLDISN_int;

  assign QA[0] = QA_[0]; 
  assign QA[1] = QA_[1]; 
  assign QA[2] = QA_[2]; 
  assign QA[3] = QA_[3]; 
  assign QA[4] = QA_[4]; 
  assign QA[5] = QA_[5]; 
  assign QA[6] = QA_[6]; 
  assign QA[7] = QA_[7]; 
  assign QA[8] = QA_[8]; 
  assign QA[9] = QA_[9]; 
  assign QA[10] = QA_[10]; 
  assign QA[11] = QA_[11]; 
  assign QA[12] = QA_[12]; 
  assign QA[13] = QA_[13]; 
  assign QA[14] = QA_[14]; 
  assign QA[15] = QA_[15]; 
  assign QA[16] = QA_[16]; 
  assign QA[17] = QA_[17]; 
  assign QA[18] = QA_[18]; 
  assign QA[19] = QA_[19]; 
  assign QA[20] = QA_[20]; 
  assign QA[21] = QA_[21]; 
  assign QA[22] = QA_[22]; 
  assign QA[23] = QA_[23]; 
  assign QA[24] = QA_[24]; 
  assign QA[25] = QA_[25]; 
  assign QA[26] = QA_[26]; 
  assign QA[27] = QA_[27]; 
  assign QA[28] = QA_[28]; 
  assign QA[29] = QA_[29]; 
  assign CLKA_ = CLKA;
  assign CENA_ = CENA;
  assign AA_[0] = AA[0];
  assign AA_[1] = AA[1];
  assign AA_[2] = AA[2];
  assign AA_[3] = AA[3];
  assign AA_[4] = AA[4];
  assign AA_[5] = AA[5];
  assign AA_[6] = AA[6];
  assign AA_[7] = AA[7];
  assign AA_[8] = AA[8];
  assign AA_[9] = AA[9];
  assign CLKB_ = CLKB;
  assign CENB_ = CENB;
  assign AB_[0] = AB[0];
  assign AB_[1] = AB[1];
  assign AB_[2] = AB[2];
  assign AB_[3] = AB[3];
  assign AB_[4] = AB[4];
  assign AB_[5] = AB[5];
  assign AB_[6] = AB[6];
  assign AB_[7] = AB[7];
  assign AB_[8] = AB[8];
  assign AB_[9] = AB[9];
  assign DB_[0] = DB[0];
  assign DB_[1] = DB[1];
  assign DB_[2] = DB[2];
  assign DB_[3] = DB[3];
  assign DB_[4] = DB[4];
  assign DB_[5] = DB[5];
  assign DB_[6] = DB[6];
  assign DB_[7] = DB[7];
  assign DB_[8] = DB[8];
  assign DB_[9] = DB[9];
  assign DB_[10] = DB[10];
  assign DB_[11] = DB[11];
  assign DB_[12] = DB[12];
  assign DB_[13] = DB[13];
  assign DB_[14] = DB[14];
  assign DB_[15] = DB[15];
  assign DB_[16] = DB[16];
  assign DB_[17] = DB[17];
  assign DB_[18] = DB[18];
  assign DB_[19] = DB[19];
  assign DB_[20] = DB[20];
  assign DB_[21] = DB[21];
  assign DB_[22] = DB[22];
  assign DB_[23] = DB[23];
  assign DB_[24] = DB[24];
  assign DB_[25] = DB[25];
  assign DB_[26] = DB[26];
  assign DB_[27] = DB[27];
  assign DB_[28] = DB[28];
  assign DB_[29] = DB[29];
  assign EMAA_[0] = EMAA[0];
  assign EMAA_[1] = EMAA[1];
  assign EMAA_[2] = EMAA[2];
  assign EMAB_[0] = EMAB[0];
  assign EMAB_[1] = EMAB[1];
  assign EMAB_[2] = EMAB[2];
  assign RET1N_ = RET1N;
  assign COLLDISN_ = COLLDISN;

  assign `ARM_UD_SEQ QA_ = (RET1N_ | pre_charge_st) ? ((QA_int)) : {30{1'bx}};

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif
  always @ (EMAA_) begin
  	if(EMAA_ < 2) 
   	$display("Warning: Set Value for EMAA doesn't match Default value 2 in %m at %0t", $time);
  end
  always @ (EMAB_) begin
  	if(EMAB_ < 2) 
   	$display("Warning: Set Value for EMAB doesn't match Default value 2 in %m at %0t", $time);
  end

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval==1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction



  task ReadA;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (RET1N_int === 1'b0 && CENA_int === 1'b0) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CENA_int, EMAA_int, RET1N_int} === 1'bx) begin
        QA_int = {30{1'bx}};
    end else if ((AA_int >= WORDS) && (CENA_int === 1'b0)) begin
      QA_int = 0 ? QA_int : {30{1'bx}};
    end else if (CENA_int === 1'b0 && (^AA_int) === 1'bx) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (CENA_int === 1'b0) begin
      mux_address = (AA_int & 2'b11);
      row_address = (AA_int >> 2);
      if (row_address > 255)
        row = {120{1'bx}};
      else
        row = mem[row_address];
      data_out = (row >> mux_address);
      QA_int = {data_out[116], data_out[112], data_out[108], data_out[104], data_out[100],
        data_out[96], data_out[92], data_out[88], data_out[84], data_out[80], data_out[76],
        data_out[72], data_out[68], data_out[64], data_out[60], data_out[56], data_out[52],
        data_out[48], data_out[44], data_out[40], data_out[36], data_out[32], data_out[28],
        data_out[24], data_out[20], data_out[16], data_out[12], data_out[8], data_out[4],
        data_out[0]};
    end
  end
  endtask

  task WriteB;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end else if (RET1N_int === 1'b0 && CENB_int === 1'b0) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CENB_int, EMAB_int, RET1N_int} === 1'bx) begin
      failedWrite(1);
    end else if ((AB_int >= WORDS) && (CENB_int === 1'b0)) begin
    end else if (CENB_int === 1'b0 && (^AB_int) === 1'bx) begin
      failedWrite(1);
    end else if (CENB_int === 1'b0) begin
      mux_address = (AB_int & 2'b11);
      row_address = (AB_int >> 2);
      if (row_address > 255)
        row = {120{1'bx}};
      else
        row = mem[row_address];
        writeEnable = ~ {30{CENB_int}};
      row_mask =  ( {3'b000, writeEnable[29], 3'b000, writeEnable[28], 3'b000, writeEnable[27],
        3'b000, writeEnable[26], 3'b000, writeEnable[25], 3'b000, writeEnable[24],
        3'b000, writeEnable[23], 3'b000, writeEnable[22], 3'b000, writeEnable[21],
        3'b000, writeEnable[20], 3'b000, writeEnable[19], 3'b000, writeEnable[18],
        3'b000, writeEnable[17], 3'b000, writeEnable[16], 3'b000, writeEnable[15],
        3'b000, writeEnable[14], 3'b000, writeEnable[13], 3'b000, writeEnable[12],
        3'b000, writeEnable[11], 3'b000, writeEnable[10], 3'b000, writeEnable[9], 3'b000, writeEnable[8],
        3'b000, writeEnable[7], 3'b000, writeEnable[6], 3'b000, writeEnable[5], 3'b000, writeEnable[4],
        3'b000, writeEnable[3], 3'b000, writeEnable[2], 3'b000, writeEnable[1], 3'b000, writeEnable[0]} << mux_address);
      new_data =  ( {3'b000, DB_int[29], 3'b000, DB_int[28], 3'b000, DB_int[27], 3'b000, DB_int[26],
        3'b000, DB_int[25], 3'b000, DB_int[24], 3'b000, DB_int[23], 3'b000, DB_int[22],
        3'b000, DB_int[21], 3'b000, DB_int[20], 3'b000, DB_int[19], 3'b000, DB_int[18],
        3'b000, DB_int[17], 3'b000, DB_int[16], 3'b000, DB_int[15], 3'b000, DB_int[14],
        3'b000, DB_int[13], 3'b000, DB_int[12], 3'b000, DB_int[11], 3'b000, DB_int[10],
        3'b000, DB_int[9], 3'b000, DB_int[8], 3'b000, DB_int[7], 3'b000, DB_int[6],
        3'b000, DB_int[5], 3'b000, DB_int[4], 3'b000, DB_int[3], 3'b000, DB_int[2],
        3'b000, DB_int[1], 3'b000, DB_int[0]} << mux_address);
      row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
    end
  end
  endtask
  always @ (CENA_ or CLKA_) begin
  	if(CLKA_ == 1'b0) begin
  		CENA_p2 = CENA_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st_a == 1'b1 && (CENA_ === 1'bx || CLKA_ === 1'bx)) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st_a = 0;
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (RET1N_ === 1'b0 && CENA_p2 === 1'b0 ) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (RET1N_ === 1'b1 && CENA_p2 === 1'b0 ) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st_a = 1;
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st_a = 0;
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
      QA_int = {30{1'bx}};
      CENA_int = 1'bx;
      AA_int = {10{1'bx}};
      EMAA_int = {3{1'bx}};
      RET1N_int = 1'bx;
      COLLDISN_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st_a == 1'b1) begin
      pre_charge_st_a = 0;
      pre_charge_st = 0;
    end else begin
      pre_charge_st_a = 0;
      pre_charge_st = 0;
`else     
    end else begin
`endif
        QA_int = {30{1'bx}};
      CENA_int = 1'bx;
      AA_int = {10{1'bx}};
      EMAA_int = {3{1'bx}};
      RET1N_int = 1'bx;
      COLLDISN_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end


  always @ CLKA_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLKA_ === 1'bx || CLKA_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (CLKA_ === 1'b1 && LAST_CLKA === 1'b0) begin
`ifdef POWER_PINS
  if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
  end else begin
      CENA_int = CENA_;
      EMAA_int = EMAA_;
      RET1N_int = RET1N_;
      COLLDISN_int = COLLDISN_;
      if (CENA_int != 1'b1) begin
        AA_int = AA_;
      end
      clk0_int = 1'b0;
      CENA_int = CENA_;
      EMAA_int = EMAA_;
      RET1N_int = RET1N_;
      COLLDISN_int = COLLDISN_;
      if (CENA_int != 1'b1) begin
        AA_int = AA_;
      end
      clk0_int = 1'b0;
    ReadA;
      if (CENA_int === 1'b0) previous_CLKA = $realtime;
    #0;
      if (((previous_CLKA == previous_CLKB)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && COLLDISN_int === 1'b1 && is_contention(AA_int, AB_int, 1'b1,
        1'b0)) begin
//          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else if (((previous_CLKA == previous_CLKB)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && COLLDISN_int === 1'b1 && row_contention(AA_int, AB_int,
        1'b1, 1'b0)) begin
`ifdef ARM_MESSAGES
//          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
`endif
          ROW_CC = 1;
`ifdef ARM_MESSAGES
//          $display("%s contention: write B succeeds, read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end else if (((previous_CLKA == previous_CLKB)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && 
       row_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
          ROW_CC = 1;
//          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {30{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
//          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else begin
`ifdef ARM_MESSAGES
//          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end
      end
  end
    end else if (CLKA_ === 1'b0 && LAST_CLKA === 1'b1) begin
    end
  end
    LAST_CLKA = CLKA_;
  end
  always @ (CENB_ or CLKB_) begin
  	if(CLKB_ == 1'b0) begin
  		CENB_p2 = CENB_;
  	end
  end

`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st_b == 1'b1 && (CENB_ === 1'bx || CLKB_ === 1'bx)) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st_b = 0;
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end else if (RET1N_ === 1'b0 && CENB_p2 === 1'b0 ) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end else if (RET1N_ === 1'b1 && CENB_p2 === 1'b0 ) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st_b = 1;
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st_b = 0;
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(1);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
      CENB_int = 1'bx;
      AB_int = {10{1'bx}};
      DB_int = {30{1'bx}};
      EMAB_int = {3{1'bx}};
      RET1N_int = 1'bx;
      COLLDISN_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st_b == 1'b1) begin
      pre_charge_st_b = 0;
      pre_charge_st = 0;
    end else begin
      pre_charge_st_b = 0;
      pre_charge_st = 0;
`else     
    end else begin
`endif
      CENB_int = 1'bx;
      AB_int = {10{1'bx}};
      DB_int = {30{1'bx}};
      EMAB_int = {3{1'bx}};
      RET1N_int = 1'bx;
      COLLDISN_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end

  always @ CLKB_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLKB_ === 1'bx || CLKB_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
    end else if (CLKB_ === 1'b1 && LAST_CLKB === 1'b0) begin
  if (RET1N_ == 1'b0) begin
  end else begin
      CENB_int = CENB_;
      EMAB_int = EMAB_;
      RET1N_int = RET1N_;
      COLLDISN_int = COLLDISN_;
      if (CENB_int != 1'b1) begin
        AB_int = AB_;
        DB_int = DB_;
      end
      clk1_int = 1'b0;
      CENB_int = CENB_;
      EMAB_int = EMAB_;
      RET1N_int = RET1N_;
      COLLDISN_int = COLLDISN_;
      if (CENB_int != 1'b1) begin
        AB_int = AB_;
        DB_int = DB_;
      end
      clk1_int = 1'b0;
      WriteB;
      if (CENB_int === 1'b0) previous_CLKB = $realtime;
    #0;
      if (((previous_CLKA == previous_CLKB)) && COLLDISN_int === 1'b1 && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && is_contention(AA_int, AB_int, 1'b1,
        1'b0)) begin
//          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else if (((previous_CLKA == previous_CLKB)) && COLLDISN_int === 1'b1 && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && row_contention(AA_int, AB_int,
        1'b1, 1'b0)) begin
`ifdef ARM_MESSAGES
//          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
`endif
          ROW_CC = 1;
`ifdef ARM_MESSAGES
//          $display("%s contention: write B succeeds, read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end else if (((previous_CLKA == previous_CLKB)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && 
       row_contention(AA_int, AB_int,1'b1, 1'b0)) begin
          ROW_CC = 1;
//          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {30{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
//          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else begin
`ifdef ARM_MESSAGES
//          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end
      end
    end
  end
  end
    LAST_CLKB = CLKB_;
  end
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
 always @ (VDDCE or VDDPE or VSSE) begin
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
 end
`endif

  function row_contention;
    input [9:0] aa;
    input [9:0] ab;
    input  wena;
    input  wenb;
    reg result;
    reg sameRow;
    reg sameMux;
    reg anyWrite;
  begin
    anyWrite = ((& wena) === 1'b1 && (& wenb) === 1'b1) ? 1'b0 : 1'b1;
    sameMux = (aa[1:0] == ab[1:0]) ? 1'b1 : 1'b0;
    if (aa[9:2] == ab[9:2]) begin
      sameRow = 1'b1;
    end else begin
      sameRow = 1'b0;
    end
    if (sameRow == 1'b1 && anyWrite == 1'b1)
      row_contention = 1'b1;
    else if (sameRow == 1'b1 && sameMux == 1'b1)
      row_contention = 1'b1;
    else
      row_contention = 1'b0;
  end
  endfunction

  function col_contention;
    input [9:0] aa;
    input [9:0] ab;
  begin
    if (aa[1:0] == ab[1:0])
      col_contention = 1'b1;
    else
      col_contention = 1'b0;
  end
  endfunction

  function is_contention;
    input [9:0] aa;
    input [9:0] ab;
    input  wena;
    input  wenb;
    reg result;
  begin
    if ((& wena) === 1'b1 && (& wenb) === 1'b1) begin
      result = 1'b0;
    end else if (aa == ab) begin
      result = 1'b1;
    end else begin
      result = 1'b0;
    end
    is_contention = result;
  end
  endfunction


endmodule
`endcelldefine
`else
`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module s40dpsf_npu_1024x30 (VDDCE, VDDPE, VSSE, QA, CLKA, CENA, AA, CLKB, CENB, AB,
    DB, EMAA, EMAB, RET1N, COLLDISN);
`else
module s40dpsf_npu_1024x30 (QA, CLKA, CENA, AA, CLKB, CENB, AB, DB, EMAA, EMAB, RET1N,
    COLLDISN);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 30;
  parameter WORDS = 1024;
  parameter MUX = 4;
  parameter MEM_WIDTH = 120; // redun block size 4, 60 on left, 60 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 30 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 0;
  parameter UPMS_WIDTH = 0;

  output [29:0] QA;
  input  CLKA;
  input  CENA;
  input [9:0] AA;
  input  CLKB;
  input  CENB;
  input [9:0] AB;
  input [29:0] DB;
  input [2:0] EMAA;
  input [2:0] EMAB;
  input  RET1N;
  input  COLLDISN;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  reg pre_charge_st;
  reg pre_charge_st_a;
  reg pre_charge_st_b;
  integer row_address;
  integer mux_address;
  reg [119:0] mem [0:255];
  reg [119:0] row, row_t;
  reg LAST_CLKA;
  reg [119:0] row_mask;
  reg [119:0] new_data;
  reg [119:0] data_out;
  reg [29:0] readLatch0;
  reg [29:0] shifted_readLatch0;
  reg [29:0] readLatch1;
  reg [29:0] shifted_readLatch1;
  reg LAST_CLKB;
  reg [29:0] QA_int;
  reg [29:0] writeEnable;
  real previous_CLKA;
  real previous_CLKB;
  initial previous_CLKA = 0;
  initial previous_CLKB = 0;
  reg READ_WRITE, WRITE_WRITE, READ_READ, ROW_CC, COL_CC;
  reg READ_WRITE_1, WRITE_WRITE_1, READ_READ_1;
  reg  cont_flag0_int;
  reg  cont_flag1_int;
  initial cont_flag0_int = 1'b0;
  initial cont_flag1_int = 1'b0;

  reg NOT_CENA, NOT_AA9, NOT_AA8, NOT_AA7, NOT_AA6, NOT_AA5, NOT_AA4, NOT_AA3, NOT_AA2;
  reg NOT_AA1, NOT_AA0, NOT_CENB, NOT_AB9, NOT_AB8, NOT_AB7, NOT_AB6, NOT_AB5, NOT_AB4;
  reg NOT_AB3, NOT_AB2, NOT_AB1, NOT_AB0, NOT_DB29, NOT_DB28, NOT_DB27, NOT_DB26, NOT_DB25;
  reg NOT_DB24, NOT_DB23, NOT_DB22, NOT_DB21, NOT_DB20, NOT_DB19, NOT_DB18, NOT_DB17;
  reg NOT_DB16, NOT_DB15, NOT_DB14, NOT_DB13, NOT_DB12, NOT_DB11, NOT_DB10, NOT_DB9;
  reg NOT_DB8, NOT_DB7, NOT_DB6, NOT_DB5, NOT_DB4, NOT_DB3, NOT_DB2, NOT_DB1, NOT_DB0;
  reg NOT_EMAA2, NOT_EMAA1, NOT_EMAA0, NOT_EMAB2, NOT_EMAB1, NOT_EMAB0, NOT_RET1N;
  reg NOT_COLLDISN;
  reg NOT_CONTA, NOT_CLKA_PER, NOT_CLKA_MINH, NOT_CLKA_MINL, NOT_CONTB, NOT_CLKB_PER;
  reg NOT_CLKB_MINH, NOT_CLKB_MINL;
  reg clk0_int;
  reg clk1_int;

  wire [29:0] QA_;
 wire  CLKA_;
  wire  CENA_;
  reg  CENA_int;
  reg  CENA_p2;
  wire [9:0] AA_;
  reg [9:0] AA_int;
 wire  CLKB_;
  wire  CENB_;
  reg  CENB_int;
  reg  CENB_p2;
  wire [9:0] AB_;
  reg [9:0] AB_int;
  wire [29:0] DB_;
  reg [29:0] DB_int;
  wire [2:0] EMAA_;
  reg [2:0] EMAA_int;
  wire [2:0] EMAB_;
  reg [2:0] EMAB_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire  COLLDISN_;
  reg  COLLDISN_int;

  buf B0(QA[0], QA_[0]);
  buf B1(QA[1], QA_[1]);
  buf B2(QA[2], QA_[2]);
  buf B3(QA[3], QA_[3]);
  buf B4(QA[4], QA_[4]);
  buf B5(QA[5], QA_[5]);
  buf B6(QA[6], QA_[6]);
  buf B7(QA[7], QA_[7]);
  buf B8(QA[8], QA_[8]);
  buf B9(QA[9], QA_[9]);
  buf B10(QA[10], QA_[10]);
  buf B11(QA[11], QA_[11]);
  buf B12(QA[12], QA_[12]);
  buf B13(QA[13], QA_[13]);
  buf B14(QA[14], QA_[14]);
  buf B15(QA[15], QA_[15]);
  buf B16(QA[16], QA_[16]);
  buf B17(QA[17], QA_[17]);
  buf B18(QA[18], QA_[18]);
  buf B19(QA[19], QA_[19]);
  buf B20(QA[20], QA_[20]);
  buf B21(QA[21], QA_[21]);
  buf B22(QA[22], QA_[22]);
  buf B23(QA[23], QA_[23]);
  buf B24(QA[24], QA_[24]);
  buf B25(QA[25], QA_[25]);
  buf B26(QA[26], QA_[26]);
  buf B27(QA[27], QA_[27]);
  buf B28(QA[28], QA_[28]);
  buf B29(QA[29], QA_[29]);
  buf B30(CLKA_, CLKA);
  buf B31(CENA_, CENA);
  buf B32(AA_[0], AA[0]);
  buf B33(AA_[1], AA[1]);
  buf B34(AA_[2], AA[2]);
  buf B35(AA_[3], AA[3]);
  buf B36(AA_[4], AA[4]);
  buf B37(AA_[5], AA[5]);
  buf B38(AA_[6], AA[6]);
  buf B39(AA_[7], AA[7]);
  buf B40(AA_[8], AA[8]);
  buf B41(AA_[9], AA[9]);
  buf B42(CLKB_, CLKB);
  buf B43(CENB_, CENB);
  buf B44(AB_[0], AB[0]);
  buf B45(AB_[1], AB[1]);
  buf B46(AB_[2], AB[2]);
  buf B47(AB_[3], AB[3]);
  buf B48(AB_[4], AB[4]);
  buf B49(AB_[5], AB[5]);
  buf B50(AB_[6], AB[6]);
  buf B51(AB_[7], AB[7]);
  buf B52(AB_[8], AB[8]);
  buf B53(AB_[9], AB[9]);
  buf B54(DB_[0], DB[0]);
  buf B55(DB_[1], DB[1]);
  buf B56(DB_[2], DB[2]);
  buf B57(DB_[3], DB[3]);
  buf B58(DB_[4], DB[4]);
  buf B59(DB_[5], DB[5]);
  buf B60(DB_[6], DB[6]);
  buf B61(DB_[7], DB[7]);
  buf B62(DB_[8], DB[8]);
  buf B63(DB_[9], DB[9]);
  buf B64(DB_[10], DB[10]);
  buf B65(DB_[11], DB[11]);
  buf B66(DB_[12], DB[12]);
  buf B67(DB_[13], DB[13]);
  buf B68(DB_[14], DB[14]);
  buf B69(DB_[15], DB[15]);
  buf B70(DB_[16], DB[16]);
  buf B71(DB_[17], DB[17]);
  buf B72(DB_[18], DB[18]);
  buf B73(DB_[19], DB[19]);
  buf B74(DB_[20], DB[20]);
  buf B75(DB_[21], DB[21]);
  buf B76(DB_[22], DB[22]);
  buf B77(DB_[23], DB[23]);
  buf B78(DB_[24], DB[24]);
  buf B79(DB_[25], DB[25]);
  buf B80(DB_[26], DB[26]);
  buf B81(DB_[27], DB[27]);
  buf B82(DB_[28], DB[28]);
  buf B83(DB_[29], DB[29]);
  buf B84(EMAA_[0], EMAA[0]);
  buf B85(EMAA_[1], EMAA[1]);
  buf B86(EMAA_[2], EMAA[2]);
  buf B87(EMAB_[0], EMAB[0]);
  buf B88(EMAB_[1], EMAB[1]);
  buf B89(EMAB_[2], EMAB[2]);
  buf B90(RET1N_, RET1N);
  buf B91(COLLDISN_, COLLDISN);

   `ifdef ARM_FAULT_MODELING
     s40dpsf_npu_1024x30_error_injection u1(.CLK(CLKA_), .Q_out(QA_), .A(AA_int), .CEN(CENA_int), .Q_in(QA_int));
  `else
  assign QA_ = (RET1N_ | pre_charge_st) ? ((QA_int)) : {30{1'bx}};
  `endif

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif
  always @ (EMAA_) begin
  	if(EMAA_ < 2) 
   	$display("Warning: Set Value for EMAA doesn't match Default value 2 in %m at %0t", $time);
  end
  always @ (EMAB_) begin
  	if(EMAB_ < 2) 
   	$display("Warning: Set Value for EMAB doesn't match Default value 2 in %m at %0t", $time);
  end

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval==1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction



  task ReadA;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (RET1N_int === 1'b0 && CENA_int === 1'b0) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CENA_int, EMAA_int, RET1N_int} === 1'bx) begin
        QA_int = {30{1'bx}};
    end else if ((AA_int >= WORDS) && (CENA_int === 1'b0)) begin
      QA_int = 0 ? QA_int : {30{1'bx}};
    end else if (CENA_int === 1'b0 && (^AA_int) === 1'bx) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (CENA_int === 1'b0) begin
      mux_address = (AA_int & 2'b11);
      row_address = (AA_int >> 2);
      if (row_address > 255)
        row = {120{1'bx}};
      else
        row = mem[row_address];
      data_out = (row >> mux_address);
      QA_int = {data_out[116], data_out[112], data_out[108], data_out[104], data_out[100],
        data_out[96], data_out[92], data_out[88], data_out[84], data_out[80], data_out[76],
        data_out[72], data_out[68], data_out[64], data_out[60], data_out[56], data_out[52],
        data_out[48], data_out[44], data_out[40], data_out[36], data_out[32], data_out[28],
        data_out[24], data_out[20], data_out[16], data_out[12], data_out[8], data_out[4],
        data_out[0]};
    end
  end
  endtask

  task WriteB;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end else if (RET1N_int === 1'b0 && CENB_int === 1'b0) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CENB_int, EMAB_int, RET1N_int} === 1'bx) begin
      failedWrite(1);
    end else if ((AB_int >= WORDS) && (CENB_int === 1'b0)) begin
    end else if (CENB_int === 1'b0 && (^AB_int) === 1'bx) begin
      failedWrite(1);
    end else if (CENB_int === 1'b0) begin
      mux_address = (AB_int & 2'b11);
      row_address = (AB_int >> 2);
      if (row_address > 255)
        row = {120{1'bx}};
      else
        row = mem[row_address];
        writeEnable = ~ {30{CENB_int}};
      row_mask =  ( {3'b000, writeEnable[29], 3'b000, writeEnable[28], 3'b000, writeEnable[27],
        3'b000, writeEnable[26], 3'b000, writeEnable[25], 3'b000, writeEnable[24],
        3'b000, writeEnable[23], 3'b000, writeEnable[22], 3'b000, writeEnable[21],
        3'b000, writeEnable[20], 3'b000, writeEnable[19], 3'b000, writeEnable[18],
        3'b000, writeEnable[17], 3'b000, writeEnable[16], 3'b000, writeEnable[15],
        3'b000, writeEnable[14], 3'b000, writeEnable[13], 3'b000, writeEnable[12],
        3'b000, writeEnable[11], 3'b000, writeEnable[10], 3'b000, writeEnable[9], 3'b000, writeEnable[8],
        3'b000, writeEnable[7], 3'b000, writeEnable[6], 3'b000, writeEnable[5], 3'b000, writeEnable[4],
        3'b000, writeEnable[3], 3'b000, writeEnable[2], 3'b000, writeEnable[1], 3'b000, writeEnable[0]} << mux_address);
      new_data =  ( {3'b000, DB_int[29], 3'b000, DB_int[28], 3'b000, DB_int[27], 3'b000, DB_int[26],
        3'b000, DB_int[25], 3'b000, DB_int[24], 3'b000, DB_int[23], 3'b000, DB_int[22],
        3'b000, DB_int[21], 3'b000, DB_int[20], 3'b000, DB_int[19], 3'b000, DB_int[18],
        3'b000, DB_int[17], 3'b000, DB_int[16], 3'b000, DB_int[15], 3'b000, DB_int[14],
        3'b000, DB_int[13], 3'b000, DB_int[12], 3'b000, DB_int[11], 3'b000, DB_int[10],
        3'b000, DB_int[9], 3'b000, DB_int[8], 3'b000, DB_int[7], 3'b000, DB_int[6],
        3'b000, DB_int[5], 3'b000, DB_int[4], 3'b000, DB_int[3], 3'b000, DB_int[2],
        3'b000, DB_int[1], 3'b000, DB_int[0]} << mux_address);
      row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
    end
  end
  endtask
  always @ (CENA_ or CLKA_) begin
  	if(CLKA_ == 1'b0) begin
  		CENA_p2 = CENA_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st_a == 1'b1 && (CENA_ === 1'bx || CLKA_ === 1'bx)) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st_a = 0;
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (RET1N_ === 1'b0 && CENA_p2 === 1'b0 ) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (RET1N_ === 1'b1 && CENA_p2 === 1'b0 ) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st_a = 1;
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st_a = 0;
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
      QA_int = {30{1'bx}};
      CENA_int = 1'bx;
      AA_int = {10{1'bx}};
      EMAA_int = {3{1'bx}};
      RET1N_int = 1'bx;
      COLLDISN_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st_a == 1'b1) begin
      pre_charge_st_a = 0;
      pre_charge_st = 0;
    end else begin
      pre_charge_st_a = 0;
      pre_charge_st = 0;
`else     
    end else begin
`endif
        QA_int = {30{1'bx}};
      CENA_int = 1'bx;
      AA_int = {10{1'bx}};
      EMAA_int = {3{1'bx}};
      RET1N_int = 1'bx;
      COLLDISN_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end


  always @ CLKA_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLKA_ === 1'bx || CLKA_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        QA_int = {30{1'bx}};
    end else if (CLKA_ === 1'b1 && LAST_CLKA === 1'b0) begin
`ifdef POWER_PINS
  if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
  end else begin
      CENA_int = CENA_;
      EMAA_int = EMAA_;
      RET1N_int = RET1N_;
      COLLDISN_int = COLLDISN_;
      if (CENA_int != 1'b1) begin
        AA_int = AA_;
      end
      clk0_int = 1'b0;
      CENA_int = CENA_;
      EMAA_int = EMAA_;
      RET1N_int = RET1N_;
      COLLDISN_int = COLLDISN_;
      if (CENA_int != 1'b1) begin
        AA_int = AA_;
      end
      clk0_int = 1'b0;
    ReadA;
      if (CENA_int === 1'b0) previous_CLKA = $realtime;
    #0;
      if (((previous_CLKA == previous_CLKB)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && COLLDISN_int === 1'b1 && is_contention(AA_int, AB_int, 1'b1,
        1'b0)) begin
//          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else if (((previous_CLKA == previous_CLKB)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && COLLDISN_int === 1'b1 && row_contention(AA_int, AB_int,
        1'b1, 1'b0)) begin
`ifdef ARM_MESSAGES
//          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
`endif
          ROW_CC = 1;
`ifdef ARM_MESSAGES
//          $display("%s contention: write B succeeds, read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end else if (((previous_CLKA == previous_CLKB)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && 
       row_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
          ROW_CC = 1;
//          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {30{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
//          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else begin
`ifdef ARM_MESSAGES
//          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end
      end
  end
    end else if (CLKA_ === 1'b0 && LAST_CLKA === 1'b1) begin
    end
  end
    LAST_CLKA = CLKA_;
  end

  reg globalNotifier0;
  initial globalNotifier0 = 1'b0;
  initial cont_flag0_int = 1'b0;

  always @ globalNotifier0 begin
    if ($realtime == 0) begin
    end else if (CENA_int === 1'bx || EMAA_int[0] === 1'bx || EMAA_int[1] === 1'bx || 
      EMAA_int[2] === 1'bx || RET1N_int === 1'bx || clk0_int === 1'bx) begin
        QA_int = {30{1'bx}};
    end else if  (cont_flag0_int === 1'bx && COLLDISN_int === 1'b1 &&  (CENA_int !== 1'b1 && CENB_int !== 1'b1) && is_contention(AA_int, AB_int, 1'b1, 1'b0)) 
     begin
      cont_flag0_int = 1'b0;
//          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
    end else if  ((CENA_int !== 1'b1 && CENB_int !== 1'b1) && cont_flag0_int === 1'bx && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_int,
      AB_int,1'b1, 1'b0)) begin
      cont_flag0_int = 1'b0;
          ROW_CC = 1;
//          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {30{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
//          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else begin
`ifdef ARM_MESSAGES
//          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end
    end else begin
      #0;
      ReadA;
   end
    globalNotifier0 = 1'b0;
  end
  always @ (CENB_ or CLKB_) begin
  	if(CLKB_ == 1'b0) begin
  		CENB_p2 = CENB_;
  	end
  end

`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st_b == 1'b1 && (CENB_ === 1'bx || CLKB_ === 1'bx)) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st_b = 0;
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end else if (RET1N_ === 1'b0 && CENB_p2 === 1'b0 ) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end else if (RET1N_ === 1'b1 && CENB_p2 === 1'b0 ) begin
      failedWrite(1);
        QA_int = {30{1'bx}};
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st_b = 1;
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st_b = 0;
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(1);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
      CENB_int = 1'bx;
      AB_int = {10{1'bx}};
      DB_int = {30{1'bx}};
      EMAB_int = {3{1'bx}};
      RET1N_int = 1'bx;
      COLLDISN_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st_b == 1'b1) begin
      pre_charge_st_b = 0;
      pre_charge_st = 0;
    end else begin
      pre_charge_st_b = 0;
      pre_charge_st = 0;
`else     
    end else begin
`endif
      CENB_int = 1'bx;
      AB_int = {10{1'bx}};
      DB_int = {30{1'bx}};
      EMAB_int = {3{1'bx}};
      RET1N_int = 1'bx;
      COLLDISN_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end

  always @ CLKB_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLKB_ === 1'bx || CLKB_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
    end else if (CLKB_ === 1'b1 && LAST_CLKB === 1'b0) begin
  if (RET1N_ == 1'b0) begin
  end else begin
      CENB_int = CENB_;
      EMAB_int = EMAB_;
      RET1N_int = RET1N_;
      COLLDISN_int = COLLDISN_;
      if (CENB_int != 1'b1) begin
        AB_int = AB_;
        DB_int = DB_;
      end
      clk1_int = 1'b0;
      CENB_int = CENB_;
      EMAB_int = EMAB_;
      RET1N_int = RET1N_;
      COLLDISN_int = COLLDISN_;
      if (CENB_int != 1'b1) begin
        AB_int = AB_;
        DB_int = DB_;
      end
      clk1_int = 1'b0;
      WriteB;
      if (CENB_int === 1'b0) previous_CLKB = $realtime;
    #0;
      if (((previous_CLKA == previous_CLKB)) && COLLDISN_int === 1'b1 && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && is_contention(AA_int, AB_int, 1'b1,
        1'b0)) begin
//          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else if (((previous_CLKA == previous_CLKB)) && COLLDISN_int === 1'b1 && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && row_contention(AA_int, AB_int,
        1'b1, 1'b0)) begin
`ifdef ARM_MESSAGES
//          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
`endif
          ROW_CC = 1;
`ifdef ARM_MESSAGES
//          $display("%s contention: write B succeeds, read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end else if (((previous_CLKA == previous_CLKB)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && 
       row_contention(AA_int, AB_int,1'b1, 1'b0)) begin
          ROW_CC = 1;
//          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {30{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
//          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else begin
`ifdef ARM_MESSAGES
//          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end
      end
    end
  end
  end
    LAST_CLKB = CLKB_;
  end

  reg globalNotifier1;
  initial globalNotifier1 = 1'b0;
  initial cont_flag1_int = 1'b0;

  always @ globalNotifier1 begin
    if ($realtime == 0) begin
    end else if (CENB_int === 1'bx || EMAB_int[0] === 1'bx || EMAB_int[1] === 1'bx || 
      EMAB_int[2] === 1'bx || RET1N_int === 1'bx || clk1_int === 1'bx) begin
      failedWrite(1);
    end else if  (cont_flag1_int === 1'bx && COLLDISN_int === 1'b1 &&  (CENA_int !== 1'b1 && CENB_int !== 1'b1) && is_contention(AA_int, AB_int, 1'b1, 1'b0)) 
     begin
      cont_flag1_int = 1'b0;
//          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
    end else if  ((CENA_int !== 1'b1 && CENB_int !== 1'b1) && cont_flag1_int === 1'bx && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_int,
      AB_int,1'b1, 1'b0)) begin
      cont_flag1_int = 1'b0;
          ROW_CC = 1;
//          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {30{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
//          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {30{1'bx}};
      end else begin
`ifdef ARM_MESSAGES
//          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
`endif
          READ_WRITE = 1;
      end
    end else begin
      #0;
      WriteB;
   end
    globalNotifier1 = 1'b0;
  end
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
 always @ (VDDCE or VDDPE or VSSE) begin
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
 end
`endif

  function row_contention;
    input [9:0] aa;
    input [9:0] ab;
    input  wena;
    input  wenb;
    reg result;
    reg sameRow;
    reg sameMux;
    reg anyWrite;
  begin
    anyWrite = ((& wena) === 1'b1 && (& wenb) === 1'b1) ? 1'b0 : 1'b1;
    sameMux = (aa[1:0] == ab[1:0]) ? 1'b1 : 1'b0;
    if (aa[9:2] == ab[9:2]) begin
      sameRow = 1'b1;
    end else begin
      sameRow = 1'b0;
    end
    if (sameRow == 1'b1 && anyWrite == 1'b1)
      row_contention = 1'b1;
    else if (sameRow == 1'b1 && sameMux == 1'b1)
      row_contention = 1'b1;
    else
      row_contention = 1'b0;
  end
  endfunction

  function col_contention;
    input [9:0] aa;
    input [9:0] ab;
  begin
    if (aa[1:0] == ab[1:0])
      col_contention = 1'b1;
    else
      col_contention = 1'b0;
  end
  endfunction

  function is_contention;
    input [9:0] aa;
    input [9:0] ab;
    input  wena;
    input  wenb;
    reg result;
  begin
    if ((& wena) === 1'b1 && (& wenb) === 1'b1) begin
      result = 1'b0;
    end else if (aa == ab) begin
      result = 1'b1;
    end else begin
      result = 1'b0;
    end
    is_contention = result;
  end
  endfunction

   wire contA_flag = (CENA_int !== 1'b1  && CENB_ !== 1'b1) && ((COLLDISN_int === 1'b1 && is_contention(AB_, AA_int, 1'b0, 1'b1)) ||
              ((COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AB_, AA_int, 1'b0, 1'b1)));
   wire contB_flag = (CENB_int !== 1'b1  && CENA_ !== 1'b1) && ((COLLDISN_int === 1'b1 && is_contention(AA_, AB_int, 1'b1, 1'b0)) ||
              ((COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_, AB_int, 1'b1, 1'b0)));

  always @ NOT_CENA begin
    CENA_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA9 begin
    AA_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA8 begin
    AA_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA7 begin
    AA_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA6 begin
    AA_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA5 begin
    AA_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA4 begin
    AA_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA3 begin
    AA_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA2 begin
    AA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA1 begin
    AA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA0 begin
    AA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CENB begin
    CENB_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB9 begin
    AB_int[9] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB8 begin
    AB_int[8] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB7 begin
    AB_int[7] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB6 begin
    AB_int[6] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB5 begin
    AB_int[5] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB4 begin
    AB_int[4] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB3 begin
    AB_int[3] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB2 begin
    AB_int[2] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB1 begin
    AB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB0 begin
    AB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB29 begin
    DB_int[29] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB28 begin
    DB_int[28] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB27 begin
    DB_int[27] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB26 begin
    DB_int[26] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB25 begin
    DB_int[25] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB24 begin
    DB_int[24] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB23 begin
    DB_int[23] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB22 begin
    DB_int[22] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB21 begin
    DB_int[21] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB20 begin
    DB_int[20] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB19 begin
    DB_int[19] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB18 begin
    DB_int[18] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB17 begin
    DB_int[17] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB16 begin
    DB_int[16] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB15 begin
    DB_int[15] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB14 begin
    DB_int[14] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB13 begin
    DB_int[13] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB12 begin
    DB_int[12] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB11 begin
    DB_int[11] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB10 begin
    DB_int[10] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB9 begin
    DB_int[9] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB8 begin
    DB_int[8] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB7 begin
    DB_int[7] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB6 begin
    DB_int[6] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB5 begin
    DB_int[5] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB4 begin
    DB_int[4] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB3 begin
    DB_int[3] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB2 begin
    DB_int[2] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB1 begin
    DB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB0 begin
    DB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_EMAA2 begin
    EMAA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAA1 begin
    EMAA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAA0 begin
    EMAA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAB2 begin
    EMAB_int[2] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_EMAB1 begin
    EMAB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_EMAB0 begin
    EMAB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_RET1N begin
    RET1N_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_COLLDISN begin
    COLLDISN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end

  always @ NOT_CONTA begin
    cont_flag0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLKA_PER begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLKA_MINH begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLKA_MINL begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CONTB begin
    cont_flag1_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_CLKB_PER begin
    clk1_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_CLKB_MINH begin
    clk1_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_CLKB_MINL begin
    clk1_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end



  wire contA_RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq0aCENAeq0, contA_RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq1aCENAeq0;
  wire contA_RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq0aCENAeq0, contA_RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq1aCENAeq0;
  wire contA_RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq0aCENAeq0, contA_RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq1aCENAeq0;
  wire contA_RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq0aCENAeq0, contA_RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq1aCENAeq0;
  wire RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq0aCENAeq0, RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq1aCENAeq0;
  wire RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq0aCENAeq0, RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq1aCENAeq0;
  wire RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq0aCENAeq0, RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq1aCENAeq0;
  wire RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq0aCENAeq0, RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq1aCENAeq0;
  wire RET1Neq1aCENAeq0aCOLLDISNeq0, RET1Neq1aCENAeq0aCOLLDISNeq1, contB_RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq0aCENBeq0;
  wire contB_RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq1aCENBeq0, contB_RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq0aCENBeq0;
  wire contB_RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq1aCENBeq0, contB_RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq0aCENBeq0;
  wire contB_RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq1aCENBeq0, contB_RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq0aCENBeq0;
  wire contB_RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq1aCENBeq0, RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq0aCENBeq0;
  wire RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq1aCENBeq0, RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq0aCENBeq0;
  wire RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq1aCENBeq0, RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq0aCENBeq0;
  wire RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq1aCENBeq0, RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq0aCENBeq0;
  wire RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq1aCENBeq0, RET1Neq1, RET1Neq1aCENBeq0aCOLLDISNeq0;
  wire RET1Neq1aCENBeq0aCOLLDISNeq1, RET1Neq1aCENAeq0, RET1Neq1aCENBeq0;


  assign contA_RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq0aCENAeq0 = RET1N && !EMAA[2] && !EMAA[1] && !EMAA[0] && !CENA && contA_flag;
  assign contA_RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq1aCENAeq0 = RET1N && !EMAA[2] && !EMAA[1] && EMAA[0] && !CENA && contA_flag;
  assign contA_RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq0aCENAeq0 = RET1N && !EMAA[2] && EMAA[1] && !EMAA[0] && !CENA && contA_flag;
  assign contA_RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq1aCENAeq0 = RET1N && !EMAA[2] && EMAA[1] && EMAA[0] && !CENA && contA_flag;
  assign contA_RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq0aCENAeq0 = RET1N && EMAA[2] && !EMAA[1] && !EMAA[0] && !CENA && contA_flag;
  assign contA_RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq1aCENAeq0 = RET1N && EMAA[2] && !EMAA[1] && EMAA[0] && !CENA && contA_flag;
  assign contA_RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq0aCENAeq0 = RET1N && EMAA[2] && EMAA[1] && !EMAA[0] && !CENA && contA_flag;
  assign contA_RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq1aCENAeq0 = RET1N && EMAA[2] && EMAA[1] && EMAA[0] && !CENA && contA_flag;
  assign RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq0aCENAeq0 = RET1N && !EMAA[2] && !EMAA[1] && !EMAA[0] && !CENA;
  assign RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq1aCENAeq0 = RET1N && !EMAA[2] && !EMAA[1] && EMAA[0] && !CENA;
  assign RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq0aCENAeq0 = RET1N && !EMAA[2] && EMAA[1] && !EMAA[0] && !CENA;
  assign RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq1aCENAeq0 = RET1N && !EMAA[2] && EMAA[1] && EMAA[0] && !CENA;
  assign RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq0aCENAeq0 = RET1N && EMAA[2] && !EMAA[1] && !EMAA[0] && !CENA;
  assign RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq1aCENAeq0 = RET1N && EMAA[2] && !EMAA[1] && EMAA[0] && !CENA;
  assign RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq0aCENAeq0 = RET1N && EMAA[2] && EMAA[1] && !EMAA[0] && !CENA;
  assign RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq1aCENAeq0 = RET1N && EMAA[2] && EMAA[1] && EMAA[0] && !CENA;
  assign contB_RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq0aCENBeq0 = RET1N && !EMAB[2] && !EMAB[1] && !EMAB[0] && !CENB && contB_flag;
  assign contB_RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq1aCENBeq0 = RET1N && !EMAB[2] && !EMAB[1] && EMAB[0] && !CENB && contB_flag;
  assign contB_RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq0aCENBeq0 = RET1N && !EMAB[2] && EMAB[1] && !EMAB[0] && !CENB && contB_flag;
  assign contB_RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq1aCENBeq0 = RET1N && !EMAB[2] && EMAB[1] && EMAB[0] && !CENB && contB_flag;
  assign contB_RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq0aCENBeq0 = RET1N && EMAB[2] && !EMAB[1] && !EMAB[0] && !CENB && contB_flag;
  assign contB_RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq1aCENBeq0 = RET1N && EMAB[2] && !EMAB[1] && EMAB[0] && !CENB && contB_flag;
  assign contB_RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq0aCENBeq0 = RET1N && EMAB[2] && EMAB[1] && !EMAB[0] && !CENB && contB_flag;
  assign contB_RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq1aCENBeq0 = RET1N && EMAB[2] && EMAB[1] && EMAB[0] && !CENB && contB_flag;
  assign RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq0aCENBeq0 = RET1N && !EMAB[2] && !EMAB[1] && !EMAB[0] && !CENB;
  assign RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq1aCENBeq0 = RET1N && !EMAB[2] && !EMAB[1] && EMAB[0] && !CENB;
  assign RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq0aCENBeq0 = RET1N && !EMAB[2] && EMAB[1] && !EMAB[0] && !CENB;
  assign RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq1aCENBeq0 = RET1N && !EMAB[2] && EMAB[1] && EMAB[0] && !CENB;
  assign RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq0aCENBeq0 = RET1N && EMAB[2] && !EMAB[1] && !EMAB[0] && !CENB;
  assign RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq1aCENBeq0 = RET1N && EMAB[2] && !EMAB[1] && EMAB[0] && !CENB;
  assign RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq0aCENBeq0 = RET1N && EMAB[2] && EMAB[1] && !EMAB[0] && !CENB;
  assign RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq1aCENBeq0 = RET1N && EMAB[2] && EMAB[1] && EMAB[0] && !CENB;

  assign RET1Neq1aCENAeq0aCOLLDISNeq0 = RET1N && !CENA && !COLLDISN;
  assign RET1Neq1aCENAeq0aCOLLDISNeq1 = RET1N && !CENA && COLLDISN;
  assign RET1Neq1aCENBeq0aCOLLDISNeq0 = RET1N && !CENB && !COLLDISN;
  assign RET1Neq1aCENBeq0aCOLLDISNeq1 = RET1N && !CENB && COLLDISN;

  assign RET1Neq1 = RET1N;
  assign RET1Neq1aCENAeq0 = RET1N && !CENA;
  assign RET1Neq1aCENBeq0 = RET1N && !CENB;

  specify

    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $period(posedge CLKA, `ARM_MEM_PERIOD, NOT_CLKA_PER);
   `else
       $period(posedge CLKA &&& RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq0aCENAeq0, `ARM_MEM_PERIOD, NOT_CLKA_PER);
       $period(posedge CLKA &&& RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq1aCENAeq0, `ARM_MEM_PERIOD, NOT_CLKA_PER);
       $period(posedge CLKA &&& RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq0aCENAeq0, `ARM_MEM_PERIOD, NOT_CLKA_PER);
       $period(posedge CLKA &&& RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq1aCENAeq0, `ARM_MEM_PERIOD, NOT_CLKA_PER);
       $period(posedge CLKA &&& RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq0aCENAeq0, `ARM_MEM_PERIOD, NOT_CLKA_PER);
       $period(posedge CLKA &&& RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq1aCENAeq0, `ARM_MEM_PERIOD, NOT_CLKA_PER);
       $period(posedge CLKA &&& RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq0aCENAeq0, `ARM_MEM_PERIOD, NOT_CLKA_PER);
       $period(posedge CLKA &&& RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq1aCENAeq0, `ARM_MEM_PERIOD, NOT_CLKA_PER);
   `endif

   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $period(posedge CLKB, `ARM_MEM_PERIOD, NOT_CLKB_PER);
   `else
       $period(posedge CLKB &&& RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq0aCENBeq0, `ARM_MEM_PERIOD, NOT_CLKB_PER);
       $period(posedge CLKB &&& RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq1aCENBeq0, `ARM_MEM_PERIOD, NOT_CLKB_PER);
       $period(posedge CLKB &&& RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq0aCENBeq0, `ARM_MEM_PERIOD, NOT_CLKB_PER);
       $period(posedge CLKB &&& RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq1aCENBeq0, `ARM_MEM_PERIOD, NOT_CLKB_PER);
       $period(posedge CLKB &&& RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq0aCENBeq0, `ARM_MEM_PERIOD, NOT_CLKB_PER);
       $period(posedge CLKB &&& RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq1aCENBeq0, `ARM_MEM_PERIOD, NOT_CLKB_PER);
       $period(posedge CLKB &&& RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq0aCENBeq0, `ARM_MEM_PERIOD, NOT_CLKB_PER);
       $period(posedge CLKB &&& RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq1aCENBeq0, `ARM_MEM_PERIOD, NOT_CLKB_PER);
   `endif


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLKA, `ARM_MEM_WIDTH, 0, NOT_CLKA_MINH);
       $width(negedge CLKA, `ARM_MEM_WIDTH, 0, NOT_CLKA_MINL);
   `else
       $width(posedge CLKA &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLKA_MINH);
       $width(negedge CLKA &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLKA_MINL);
   `endif

   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLKB, `ARM_MEM_WIDTH, 0, NOT_CLKB_MINH);
       $width(negedge CLKB, `ARM_MEM_WIDTH, 0, NOT_CLKB_MINL);
   `else
       $width(posedge CLKB &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLKB_MINH);
       $width(negedge CLKB &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLKB_MINL);
   `endif


    $setuphold(posedge CLKB &&& contA_RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq0aCENAeq0, posedge CLKA, `ARM_MEM_COLLISION, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_RET1Neq1aEMAA2eq0aEMAA1eq0aEMAA0eq1aCENAeq0, posedge CLKA, `ARM_MEM_COLLISION, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq0aCENAeq0, posedge CLKA, `ARM_MEM_COLLISION, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_RET1Neq1aEMAA2eq0aEMAA1eq1aEMAA0eq1aCENAeq0, posedge CLKA, `ARM_MEM_COLLISION, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq0aCENAeq0, posedge CLKA, `ARM_MEM_COLLISION, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_RET1Neq1aEMAA2eq1aEMAA1eq0aEMAA0eq1aCENAeq0, posedge CLKA, `ARM_MEM_COLLISION, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq0aCENAeq0, posedge CLKA, `ARM_MEM_COLLISION, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_RET1Neq1aEMAA2eq1aEMAA1eq1aEMAA0eq1aCENAeq0, posedge CLKA, `ARM_MEM_COLLISION, 0.000, NOT_CONTA);

    $setuphold(posedge CLKA &&& contB_RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq0aCENBeq0, posedge CLKB, `ARM_MEM_COLLISION, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_RET1Neq1aEMAB2eq0aEMAB1eq0aEMAB0eq1aCENBeq0, posedge CLKB, `ARM_MEM_COLLISION, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq0aCENBeq0, posedge CLKB, `ARM_MEM_COLLISION, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_RET1Neq1aEMAB2eq0aEMAB1eq1aEMAB0eq1aCENBeq0, posedge CLKB, `ARM_MEM_COLLISION, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq0aCENBeq0, posedge CLKB, `ARM_MEM_COLLISION, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_RET1Neq1aEMAB2eq1aEMAB1eq0aEMAB0eq1aCENBeq0, posedge CLKB, `ARM_MEM_COLLISION, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq0aCENBeq0, posedge CLKB, `ARM_MEM_COLLISION, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_RET1Neq1aEMAB2eq1aEMAB1eq1aEMAB0eq1aCENBeq0, posedge CLKB, `ARM_MEM_COLLISION, 0.000, NOT_CONTB);

    $setuphold(posedge CLKA &&& RET1Neq1, posedge CENA, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CENA);
    $setuphold(posedge CLKA &&& RET1Neq1, negedge CENA, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CENA);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA9);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA8);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA7);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA6);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA5);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA4);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA3);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA2);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA1);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, posedge AA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA0);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA9);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA8);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA7);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA6);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA5);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA4);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA3);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA2);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA1);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq0, negedge AA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA0);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA9);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA8);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA7);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA6);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA5);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA4);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA3);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA2);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA1);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, posedge AA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA0);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA9);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA8);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA7);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA6);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA5);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA4);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA3);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA2);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA1);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0aCOLLDISNeq1, negedge AA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AA0);
    $setuphold(posedge CLKB &&& RET1Neq1, posedge CENB, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CENB);
    $setuphold(posedge CLKB &&& RET1Neq1, negedge CENB, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CENB);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB9);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB8);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB7);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB6);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB5);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB4);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB3);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB2);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB1);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, posedge AB[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB0);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB9);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB8);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB7);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB6);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB5);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB4);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB3);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB2);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB1);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq0, negedge AB[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB0);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB9);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB8);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB7);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB6);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB5);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB4);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB3);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB2);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB1);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, posedge AB[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB0);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB9);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB8);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB7);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB6);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB5);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB4);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB3);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB2);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB1);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0aCOLLDISNeq1, negedge AB[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_AB0);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB29);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB28);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB27);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB26);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB25);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB24);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB23);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB22);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB21);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB20);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB19);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB18);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB17);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB16);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB15);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB14);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB13);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB12);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB11);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB10);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB9);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB8);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB7);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB6);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB5);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB4);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB3);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB2);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB1);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge DB[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB0);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB29);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB28);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB27);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB26);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB25);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB24);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB23);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB22);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB21);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB20);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB19);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB18);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB17);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB16);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB15);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB14);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB13);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB12);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB11);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB10);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB9);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB8);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB7);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB6);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB5);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB4);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB3);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB2);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB1);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge DB[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DB0);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0, posedge EMAA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAA2);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0, posedge EMAA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAA1);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0, posedge EMAA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAA0);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0, negedge EMAA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAA2);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0, negedge EMAA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAA1);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0, negedge EMAA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAA0);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge EMAB[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAB2);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge EMAB[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAB1);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge EMAB[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAB0);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge EMAB[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAB2);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge EMAB[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAB1);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge EMAB[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAB0);
    $setuphold(posedge CLKA, posedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLKA, negedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLKB, posedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLKB, negedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0, posedge COLLDISN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_COLLDISN);
    $setuphold(posedge CLKA &&& RET1Neq1aCENAeq0, negedge COLLDISN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_COLLDISN);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, posedge COLLDISN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_COLLDISN);
    $setuphold(posedge CLKB &&& RET1Neq1aCENBeq0, negedge COLLDISN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_COLLDISN);
    $setuphold(negedge RET1N, negedge CENA, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, negedge CENA, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge RET1N, negedge CENB, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, negedge CENB, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CENB, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CENA, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CENB, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CENA, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
  endspecify


endmodule
`endcelldefine
`endif
`timescale 1ns/1ps
module s40dpsf_npu_1024x30_error_injection (Q_out, Q_in, CLK, A, CEN);
   output [29:0] Q_out;
   input [29:0] Q_in;
   input CLK;
   input [9:0] A;
   input CEN;
   parameter LEFT_RED_COLUMN_FAULT = 2'd1;
   parameter RIGHT_RED_COLUMN_FAULT = 2'd2;
   parameter NO_RED_FAULT = 2'd0;
   reg [29:0] Q_out;
   reg entry_found;
   reg list_complete;
   reg [19:0] fault_table [255:0];
   reg [19:0] fault_entry;
initial
begin
   `ifdef DUT
      `define pre_pend_path TB.DUT_inst.CHIP
   `else
       `define pre_pend_path TB.CHIP
   `endif
   `ifdef ARM_NONREPAIRABLE_FAULT
      `pre_pend_path.SMARCHCHKBVCD_LVISION_MBISTPG_ASSEMBLY_UNDER_TEST_INST.MEM0_MEM_INST.u1.add_fault(10'd754,5'd16,2'd1,2'd0);
   `endif
end
   task add_fault;
   //This task injects fault in memory
      input [9:0] address;
      input [4:0] bitPlace;
      input [1:0] fault_type;
      input [1:0] red_fault;
 
      integer i;
      reg done;
   begin
      done = 1'b0;
      i = 0;
      while ((!done) && i < 255)
      begin
         fault_entry = fault_table[i];
         if (fault_entry[0] === 1'b0 || fault_entry[0] === 1'bx)
         begin
            fault_entry[0] = 1'b1;
            fault_entry[2:1] = red_fault;
            fault_entry[4:3] = fault_type;
            fault_entry[9:5] = bitPlace;
            fault_entry[19:10] = address;
            fault_table[i] = fault_entry;
            done = 1'b1;
         end
         i = i+1;
      end
   end
   endtask
//This task removes all fault entries injected by user
task remove_all_faults;
   integer i;
begin
   for (i = 0; i < 256; i=i+1)
   begin
      fault_entry = fault_table[i];
      fault_entry[0] = 1'b0;
      fault_table[i] = fault_entry;
   end
end
endtask
task bit_error;
// This task is used to inject error in memory and should be called
// only from current module.
//
// This task injects error depending upon fault type to particular bit
// of the output
   inout [29:0] q_int;
   input [1:0] fault_type;
   input [4:0] bitLoc;
begin
   if (fault_type === 2'd0)
      q_int[bitLoc] = 1'b0;
   else if (fault_type === 2'd1)
      q_int[bitLoc] = 1'b1;
   else
      q_int[bitLoc] = ~q_int[bitLoc];
end
endtask
task error_injection_on_output;
// This function goes through error injection table for every
// read cycle and corrupts Q output if fault for the particular
// address is present in fault table
//
// If fault is redundant column is detected, this task corrupts
// Q output in read cycle
//
// If fault is repaired using repair bus, this task does not
// courrpt Q output in read cycle
//
   output [29:0] Q_output;
   reg list_complete;
   integer i;
   reg [7:0] row_address;
   reg [1:0] column_address;
   reg [4:0] bitPlace;
   reg [1:0] fault_type;
   reg [1:0] red_fault;
   reg valid;
   reg [3:0] msb_bit_calc;
begin
   entry_found = 1'b0;
   list_complete = 1'b0;
   i = 0;
   Q_output = Q_in;
   while(!list_complete)
   begin
      fault_entry = fault_table[i];
      {row_address, column_address, bitPlace, fault_type, red_fault, valid} = fault_entry;
      i = i + 1;
      if (valid == 1'b1)
      begin
         if (red_fault === NO_RED_FAULT)
         begin
            if (row_address == A[9:2] && column_address == A[1:0])
            begin
               if (bitPlace < 15)
                  bit_error(Q_output,fault_type, bitPlace);
               else if (bitPlace >= 15 )
                  bit_error(Q_output,fault_type, bitPlace);
            end
         end
      end
      else
         list_complete = 1'b1;
      end
   end
   endtask
   always @ (Q_in or CLK or A or CEN)
   begin
   if (CEN === 1'b0)
      error_injection_on_output(Q_out);
   else
      Q_out = Q_in;
   end
endmodule
