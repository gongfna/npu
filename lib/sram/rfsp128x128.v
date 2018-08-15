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
//      Verilog model for Synchronous Single-Port Register File
//
//       Instance Name:              rfsp128x128
//       Words:                      128
//       Bits:                       128
//       Mux:                        2
//       Drive:                      6
//       Write Mask:                 On
//       Write Thru:                 On
//       Extra Margin Adjustment:    On
//       Redundant Columns:          0
//       Test Muxes                  Off
//       Power Gating:               Off
//       Retention:                  On
//       Pipeline:                   Off
//       Read Disturb Test:	        Off
//       
//       Creation Date:  Fri Jul 13 14:38:37 2018
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
module rfsp128x128 (VDDCE, VDDPE, VSSE, Q, CLK, CEN, WEN, A, D, EMA, EMAW, GWEN, RET1N);
`else
module rfsp128x128 (Q, CLK, CEN, WEN, A, D, EMA, EMAW, GWEN, RET1N);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 128;
  parameter WORDS = 128;
  parameter MUX = 2;
  parameter MEM_WIDTH = 256; // redun block size 2, 128 on left, 128 on right
  parameter MEM_HEIGHT = 64;
  parameter WP_SIZE = 1 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 0;

  output [127:0] Q;
  input  CLK;
  input  CEN;
  input [127:0] WEN;
  input [6:0] A;
  input [127:0] D;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  GWEN;
  input  RET1N;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  reg [255:0] mem [0:63];
  reg [255:0] row, row_t;
  reg LAST_CLK;
  reg [255:0] row_mask;
  reg [255:0] new_data;
  reg [255:0] data_out;
  reg [127:0] readLatch0;
  reg [127:0] shifted_readLatch0;
  reg [127:0] Q_int;
  reg [127:0] writeEnable;
  reg clk0_int;

  wire [127:0] Q_;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire [127:0] WEN_;
  reg [127:0] WEN_int;
  wire [6:0] A_;
  reg [6:0] A_int;
  wire [127:0] D_;
  reg [127:0] D_int;
  wire [2:0] EMA_;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
  reg [1:0] EMAW_int;
  wire  GWEN_;
  reg  GWEN_int;
  wire  RET1N_;
  reg  RET1N_int;

  assign Q[0] = Q_[0]; 
  assign Q[1] = Q_[1]; 
  assign Q[2] = Q_[2]; 
  assign Q[3] = Q_[3]; 
  assign Q[4] = Q_[4]; 
  assign Q[5] = Q_[5]; 
  assign Q[6] = Q_[6]; 
  assign Q[7] = Q_[7]; 
  assign Q[8] = Q_[8]; 
  assign Q[9] = Q_[9]; 
  assign Q[10] = Q_[10]; 
  assign Q[11] = Q_[11]; 
  assign Q[12] = Q_[12]; 
  assign Q[13] = Q_[13]; 
  assign Q[14] = Q_[14]; 
  assign Q[15] = Q_[15]; 
  assign Q[16] = Q_[16]; 
  assign Q[17] = Q_[17]; 
  assign Q[18] = Q_[18]; 
  assign Q[19] = Q_[19]; 
  assign Q[20] = Q_[20]; 
  assign Q[21] = Q_[21]; 
  assign Q[22] = Q_[22]; 
  assign Q[23] = Q_[23]; 
  assign Q[24] = Q_[24]; 
  assign Q[25] = Q_[25]; 
  assign Q[26] = Q_[26]; 
  assign Q[27] = Q_[27]; 
  assign Q[28] = Q_[28]; 
  assign Q[29] = Q_[29]; 
  assign Q[30] = Q_[30]; 
  assign Q[31] = Q_[31]; 
  assign Q[32] = Q_[32]; 
  assign Q[33] = Q_[33]; 
  assign Q[34] = Q_[34]; 
  assign Q[35] = Q_[35]; 
  assign Q[36] = Q_[36]; 
  assign Q[37] = Q_[37]; 
  assign Q[38] = Q_[38]; 
  assign Q[39] = Q_[39]; 
  assign Q[40] = Q_[40]; 
  assign Q[41] = Q_[41]; 
  assign Q[42] = Q_[42]; 
  assign Q[43] = Q_[43]; 
  assign Q[44] = Q_[44]; 
  assign Q[45] = Q_[45]; 
  assign Q[46] = Q_[46]; 
  assign Q[47] = Q_[47]; 
  assign Q[48] = Q_[48]; 
  assign Q[49] = Q_[49]; 
  assign Q[50] = Q_[50]; 
  assign Q[51] = Q_[51]; 
  assign Q[52] = Q_[52]; 
  assign Q[53] = Q_[53]; 
  assign Q[54] = Q_[54]; 
  assign Q[55] = Q_[55]; 
  assign Q[56] = Q_[56]; 
  assign Q[57] = Q_[57]; 
  assign Q[58] = Q_[58]; 
  assign Q[59] = Q_[59]; 
  assign Q[60] = Q_[60]; 
  assign Q[61] = Q_[61]; 
  assign Q[62] = Q_[62]; 
  assign Q[63] = Q_[63]; 
  assign Q[64] = Q_[64]; 
  assign Q[65] = Q_[65]; 
  assign Q[66] = Q_[66]; 
  assign Q[67] = Q_[67]; 
  assign Q[68] = Q_[68]; 
  assign Q[69] = Q_[69]; 
  assign Q[70] = Q_[70]; 
  assign Q[71] = Q_[71]; 
  assign Q[72] = Q_[72]; 
  assign Q[73] = Q_[73]; 
  assign Q[74] = Q_[74]; 
  assign Q[75] = Q_[75]; 
  assign Q[76] = Q_[76]; 
  assign Q[77] = Q_[77]; 
  assign Q[78] = Q_[78]; 
  assign Q[79] = Q_[79]; 
  assign Q[80] = Q_[80]; 
  assign Q[81] = Q_[81]; 
  assign Q[82] = Q_[82]; 
  assign Q[83] = Q_[83]; 
  assign Q[84] = Q_[84]; 
  assign Q[85] = Q_[85]; 
  assign Q[86] = Q_[86]; 
  assign Q[87] = Q_[87]; 
  assign Q[88] = Q_[88]; 
  assign Q[89] = Q_[89]; 
  assign Q[90] = Q_[90]; 
  assign Q[91] = Q_[91]; 
  assign Q[92] = Q_[92]; 
  assign Q[93] = Q_[93]; 
  assign Q[94] = Q_[94]; 
  assign Q[95] = Q_[95]; 
  assign Q[96] = Q_[96]; 
  assign Q[97] = Q_[97]; 
  assign Q[98] = Q_[98]; 
  assign Q[99] = Q_[99]; 
  assign Q[100] = Q_[100]; 
  assign Q[101] = Q_[101]; 
  assign Q[102] = Q_[102]; 
  assign Q[103] = Q_[103]; 
  assign Q[104] = Q_[104]; 
  assign Q[105] = Q_[105]; 
  assign Q[106] = Q_[106]; 
  assign Q[107] = Q_[107]; 
  assign Q[108] = Q_[108]; 
  assign Q[109] = Q_[109]; 
  assign Q[110] = Q_[110]; 
  assign Q[111] = Q_[111]; 
  assign Q[112] = Q_[112]; 
  assign Q[113] = Q_[113]; 
  assign Q[114] = Q_[114]; 
  assign Q[115] = Q_[115]; 
  assign Q[116] = Q_[116]; 
  assign Q[117] = Q_[117]; 
  assign Q[118] = Q_[118]; 
  assign Q[119] = Q_[119]; 
  assign Q[120] = Q_[120]; 
  assign Q[121] = Q_[121]; 
  assign Q[122] = Q_[122]; 
  assign Q[123] = Q_[123]; 
  assign Q[124] = Q_[124]; 
  assign Q[125] = Q_[125]; 
  assign Q[126] = Q_[126]; 
  assign Q[127] = Q_[127]; 
  assign CLK_ = CLK;
  assign CEN_ = CEN;
  assign WEN_[0] = WEN[0];
  assign WEN_[1] = WEN[1];
  assign WEN_[2] = WEN[2];
  assign WEN_[3] = WEN[3];
  assign WEN_[4] = WEN[4];
  assign WEN_[5] = WEN[5];
  assign WEN_[6] = WEN[6];
  assign WEN_[7] = WEN[7];
  assign WEN_[8] = WEN[8];
  assign WEN_[9] = WEN[9];
  assign WEN_[10] = WEN[10];
  assign WEN_[11] = WEN[11];
  assign WEN_[12] = WEN[12];
  assign WEN_[13] = WEN[13];
  assign WEN_[14] = WEN[14];
  assign WEN_[15] = WEN[15];
  assign WEN_[16] = WEN[16];
  assign WEN_[17] = WEN[17];
  assign WEN_[18] = WEN[18];
  assign WEN_[19] = WEN[19];
  assign WEN_[20] = WEN[20];
  assign WEN_[21] = WEN[21];
  assign WEN_[22] = WEN[22];
  assign WEN_[23] = WEN[23];
  assign WEN_[24] = WEN[24];
  assign WEN_[25] = WEN[25];
  assign WEN_[26] = WEN[26];
  assign WEN_[27] = WEN[27];
  assign WEN_[28] = WEN[28];
  assign WEN_[29] = WEN[29];
  assign WEN_[30] = WEN[30];
  assign WEN_[31] = WEN[31];
  assign WEN_[32] = WEN[32];
  assign WEN_[33] = WEN[33];
  assign WEN_[34] = WEN[34];
  assign WEN_[35] = WEN[35];
  assign WEN_[36] = WEN[36];
  assign WEN_[37] = WEN[37];
  assign WEN_[38] = WEN[38];
  assign WEN_[39] = WEN[39];
  assign WEN_[40] = WEN[40];
  assign WEN_[41] = WEN[41];
  assign WEN_[42] = WEN[42];
  assign WEN_[43] = WEN[43];
  assign WEN_[44] = WEN[44];
  assign WEN_[45] = WEN[45];
  assign WEN_[46] = WEN[46];
  assign WEN_[47] = WEN[47];
  assign WEN_[48] = WEN[48];
  assign WEN_[49] = WEN[49];
  assign WEN_[50] = WEN[50];
  assign WEN_[51] = WEN[51];
  assign WEN_[52] = WEN[52];
  assign WEN_[53] = WEN[53];
  assign WEN_[54] = WEN[54];
  assign WEN_[55] = WEN[55];
  assign WEN_[56] = WEN[56];
  assign WEN_[57] = WEN[57];
  assign WEN_[58] = WEN[58];
  assign WEN_[59] = WEN[59];
  assign WEN_[60] = WEN[60];
  assign WEN_[61] = WEN[61];
  assign WEN_[62] = WEN[62];
  assign WEN_[63] = WEN[63];
  assign WEN_[64] = WEN[64];
  assign WEN_[65] = WEN[65];
  assign WEN_[66] = WEN[66];
  assign WEN_[67] = WEN[67];
  assign WEN_[68] = WEN[68];
  assign WEN_[69] = WEN[69];
  assign WEN_[70] = WEN[70];
  assign WEN_[71] = WEN[71];
  assign WEN_[72] = WEN[72];
  assign WEN_[73] = WEN[73];
  assign WEN_[74] = WEN[74];
  assign WEN_[75] = WEN[75];
  assign WEN_[76] = WEN[76];
  assign WEN_[77] = WEN[77];
  assign WEN_[78] = WEN[78];
  assign WEN_[79] = WEN[79];
  assign WEN_[80] = WEN[80];
  assign WEN_[81] = WEN[81];
  assign WEN_[82] = WEN[82];
  assign WEN_[83] = WEN[83];
  assign WEN_[84] = WEN[84];
  assign WEN_[85] = WEN[85];
  assign WEN_[86] = WEN[86];
  assign WEN_[87] = WEN[87];
  assign WEN_[88] = WEN[88];
  assign WEN_[89] = WEN[89];
  assign WEN_[90] = WEN[90];
  assign WEN_[91] = WEN[91];
  assign WEN_[92] = WEN[92];
  assign WEN_[93] = WEN[93];
  assign WEN_[94] = WEN[94];
  assign WEN_[95] = WEN[95];
  assign WEN_[96] = WEN[96];
  assign WEN_[97] = WEN[97];
  assign WEN_[98] = WEN[98];
  assign WEN_[99] = WEN[99];
  assign WEN_[100] = WEN[100];
  assign WEN_[101] = WEN[101];
  assign WEN_[102] = WEN[102];
  assign WEN_[103] = WEN[103];
  assign WEN_[104] = WEN[104];
  assign WEN_[105] = WEN[105];
  assign WEN_[106] = WEN[106];
  assign WEN_[107] = WEN[107];
  assign WEN_[108] = WEN[108];
  assign WEN_[109] = WEN[109];
  assign WEN_[110] = WEN[110];
  assign WEN_[111] = WEN[111];
  assign WEN_[112] = WEN[112];
  assign WEN_[113] = WEN[113];
  assign WEN_[114] = WEN[114];
  assign WEN_[115] = WEN[115];
  assign WEN_[116] = WEN[116];
  assign WEN_[117] = WEN[117];
  assign WEN_[118] = WEN[118];
  assign WEN_[119] = WEN[119];
  assign WEN_[120] = WEN[120];
  assign WEN_[121] = WEN[121];
  assign WEN_[122] = WEN[122];
  assign WEN_[123] = WEN[123];
  assign WEN_[124] = WEN[124];
  assign WEN_[125] = WEN[125];
  assign WEN_[126] = WEN[126];
  assign WEN_[127] = WEN[127];
  assign A_[0] = A[0];
  assign A_[1] = A[1];
  assign A_[2] = A[2];
  assign A_[3] = A[3];
  assign A_[4] = A[4];
  assign A_[5] = A[5];
  assign A_[6] = A[6];
  assign D_[0] = D[0];
  assign D_[1] = D[1];
  assign D_[2] = D[2];
  assign D_[3] = D[3];
  assign D_[4] = D[4];
  assign D_[5] = D[5];
  assign D_[6] = D[6];
  assign D_[7] = D[7];
  assign D_[8] = D[8];
  assign D_[9] = D[9];
  assign D_[10] = D[10];
  assign D_[11] = D[11];
  assign D_[12] = D[12];
  assign D_[13] = D[13];
  assign D_[14] = D[14];
  assign D_[15] = D[15];
  assign D_[16] = D[16];
  assign D_[17] = D[17];
  assign D_[18] = D[18];
  assign D_[19] = D[19];
  assign D_[20] = D[20];
  assign D_[21] = D[21];
  assign D_[22] = D[22];
  assign D_[23] = D[23];
  assign D_[24] = D[24];
  assign D_[25] = D[25];
  assign D_[26] = D[26];
  assign D_[27] = D[27];
  assign D_[28] = D[28];
  assign D_[29] = D[29];
  assign D_[30] = D[30];
  assign D_[31] = D[31];
  assign D_[32] = D[32];
  assign D_[33] = D[33];
  assign D_[34] = D[34];
  assign D_[35] = D[35];
  assign D_[36] = D[36];
  assign D_[37] = D[37];
  assign D_[38] = D[38];
  assign D_[39] = D[39];
  assign D_[40] = D[40];
  assign D_[41] = D[41];
  assign D_[42] = D[42];
  assign D_[43] = D[43];
  assign D_[44] = D[44];
  assign D_[45] = D[45];
  assign D_[46] = D[46];
  assign D_[47] = D[47];
  assign D_[48] = D[48];
  assign D_[49] = D[49];
  assign D_[50] = D[50];
  assign D_[51] = D[51];
  assign D_[52] = D[52];
  assign D_[53] = D[53];
  assign D_[54] = D[54];
  assign D_[55] = D[55];
  assign D_[56] = D[56];
  assign D_[57] = D[57];
  assign D_[58] = D[58];
  assign D_[59] = D[59];
  assign D_[60] = D[60];
  assign D_[61] = D[61];
  assign D_[62] = D[62];
  assign D_[63] = D[63];
  assign D_[64] = D[64];
  assign D_[65] = D[65];
  assign D_[66] = D[66];
  assign D_[67] = D[67];
  assign D_[68] = D[68];
  assign D_[69] = D[69];
  assign D_[70] = D[70];
  assign D_[71] = D[71];
  assign D_[72] = D[72];
  assign D_[73] = D[73];
  assign D_[74] = D[74];
  assign D_[75] = D[75];
  assign D_[76] = D[76];
  assign D_[77] = D[77];
  assign D_[78] = D[78];
  assign D_[79] = D[79];
  assign D_[80] = D[80];
  assign D_[81] = D[81];
  assign D_[82] = D[82];
  assign D_[83] = D[83];
  assign D_[84] = D[84];
  assign D_[85] = D[85];
  assign D_[86] = D[86];
  assign D_[87] = D[87];
  assign D_[88] = D[88];
  assign D_[89] = D[89];
  assign D_[90] = D[90];
  assign D_[91] = D[91];
  assign D_[92] = D[92];
  assign D_[93] = D[93];
  assign D_[94] = D[94];
  assign D_[95] = D[95];
  assign D_[96] = D[96];
  assign D_[97] = D[97];
  assign D_[98] = D[98];
  assign D_[99] = D[99];
  assign D_[100] = D[100];
  assign D_[101] = D[101];
  assign D_[102] = D[102];
  assign D_[103] = D[103];
  assign D_[104] = D[104];
  assign D_[105] = D[105];
  assign D_[106] = D[106];
  assign D_[107] = D[107];
  assign D_[108] = D[108];
  assign D_[109] = D[109];
  assign D_[110] = D[110];
  assign D_[111] = D[111];
  assign D_[112] = D[112];
  assign D_[113] = D[113];
  assign D_[114] = D[114];
  assign D_[115] = D[115];
  assign D_[116] = D[116];
  assign D_[117] = D[117];
  assign D_[118] = D[118];
  assign D_[119] = D[119];
  assign D_[120] = D[120];
  assign D_[121] = D[121];
  assign D_[122] = D[122];
  assign D_[123] = D[123];
  assign D_[124] = D[124];
  assign D_[125] = D[125];
  assign D_[126] = D[126];
  assign D_[127] = D[127];
  assign EMA_[0] = EMA[0];
  assign EMA_[1] = EMA[1];
  assign EMA_[2] = EMA[2];
  assign EMAW_[0] = EMAW[0];
  assign EMAW_[1] = EMAW[1];
  assign GWEN_ = GWEN;
  assign RET1N_ = RET1N;

  assign `ARM_UD_SEQ Q_ = (RET1N_ | pre_charge_st) ? ((Q_int)) : {128{1'bx}};

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif
  always @ (EMA_) begin
  	if(EMA_ < 2) 
   	$display("Warning: Set Value for EMA doesn't match Default value 2 in %m at %0t", $time);
  end
  always @ (EMAW_) begin
  	if(EMAW_ < 0) 
   	$display("Warning: Set Value for EMAW doesn't match Default value 0 in %m at %0t", $time);
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



  task readWrite;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (RET1N_int === 1'b0 && CEN_int === 1'b0) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CEN_int, EMA_int, EMAW_int, RET1N_int} === 1'bx) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0)) begin
      Q_int = {128{1'bx}};
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (CEN_int === 1'b0) begin
      mux_address = (A_int & 1'b1);
      row_address = (A_int >> 1);
      if (row_address > 63)
        row = {256{1'bx}};
      else
        row = mem[row_address];
      if( isBitX(GWEN_int) ) begin
        writeEnable = {128{1'bx}};
        D_int = {128{1'bx}};
      end else
          writeEnable = ~ ( {128{GWEN_int}} | {WEN_int[127], WEN_int[126], WEN_int[125],
          WEN_int[124], WEN_int[123], WEN_int[122], WEN_int[121], WEN_int[120], WEN_int[119],
          WEN_int[118], WEN_int[117], WEN_int[116], WEN_int[115], WEN_int[114], WEN_int[113],
          WEN_int[112], WEN_int[111], WEN_int[110], WEN_int[109], WEN_int[108], WEN_int[107],
          WEN_int[106], WEN_int[105], WEN_int[104], WEN_int[103], WEN_int[102], WEN_int[101],
          WEN_int[100], WEN_int[99], WEN_int[98], WEN_int[97], WEN_int[96], WEN_int[95],
          WEN_int[94], WEN_int[93], WEN_int[92], WEN_int[91], WEN_int[90], WEN_int[89],
          WEN_int[88], WEN_int[87], WEN_int[86], WEN_int[85], WEN_int[84], WEN_int[83],
          WEN_int[82], WEN_int[81], WEN_int[80], WEN_int[79], WEN_int[78], WEN_int[77],
          WEN_int[76], WEN_int[75], WEN_int[74], WEN_int[73], WEN_int[72], WEN_int[71],
          WEN_int[70], WEN_int[69], WEN_int[68], WEN_int[67], WEN_int[66], WEN_int[65],
          WEN_int[64], WEN_int[63], WEN_int[62], WEN_int[61], WEN_int[60], WEN_int[59],
          WEN_int[58], WEN_int[57], WEN_int[56], WEN_int[55], WEN_int[54], WEN_int[53],
          WEN_int[52], WEN_int[51], WEN_int[50], WEN_int[49], WEN_int[48], WEN_int[47],
          WEN_int[46], WEN_int[45], WEN_int[44], WEN_int[43], WEN_int[42], WEN_int[41],
          WEN_int[40], WEN_int[39], WEN_int[38], WEN_int[37], WEN_int[36], WEN_int[35],
          WEN_int[34], WEN_int[33], WEN_int[32], WEN_int[31], WEN_int[30], WEN_int[29],
          WEN_int[28], WEN_int[27], WEN_int[26], WEN_int[25], WEN_int[24], WEN_int[23],
          WEN_int[22], WEN_int[21], WEN_int[20], WEN_int[19], WEN_int[18], WEN_int[17],
          WEN_int[16], WEN_int[15], WEN_int[14], WEN_int[13], WEN_int[12], WEN_int[11],
          WEN_int[10], WEN_int[9], WEN_int[8], WEN_int[7], WEN_int[6], WEN_int[5],
          WEN_int[4], WEN_int[3], WEN_int[2], WEN_int[1], WEN_int[0]});
      if (GWEN_int !== 1'b1) begin
        row_mask =  ( {1'b0, writeEnable[127], 1'b0, writeEnable[126], 1'b0, writeEnable[125],
          1'b0, writeEnable[124], 1'b0, writeEnable[123], 1'b0, writeEnable[122], 1'b0, writeEnable[121],
          1'b0, writeEnable[120], 1'b0, writeEnable[119], 1'b0, writeEnable[118], 1'b0, writeEnable[117],
          1'b0, writeEnable[116], 1'b0, writeEnable[115], 1'b0, writeEnable[114], 1'b0, writeEnable[113],
          1'b0, writeEnable[112], 1'b0, writeEnable[111], 1'b0, writeEnable[110], 1'b0, writeEnable[109],
          1'b0, writeEnable[108], 1'b0, writeEnable[107], 1'b0, writeEnable[106], 1'b0, writeEnable[105],
          1'b0, writeEnable[104], 1'b0, writeEnable[103], 1'b0, writeEnable[102], 1'b0, writeEnable[101],
          1'b0, writeEnable[100], 1'b0, writeEnable[99], 1'b0, writeEnable[98], 1'b0, writeEnable[97],
          1'b0, writeEnable[96], 1'b0, writeEnable[95], 1'b0, writeEnable[94], 1'b0, writeEnable[93],
          1'b0, writeEnable[92], 1'b0, writeEnable[91], 1'b0, writeEnable[90], 1'b0, writeEnable[89],
          1'b0, writeEnable[88], 1'b0, writeEnable[87], 1'b0, writeEnable[86], 1'b0, writeEnable[85],
          1'b0, writeEnable[84], 1'b0, writeEnable[83], 1'b0, writeEnable[82], 1'b0, writeEnable[81],
          1'b0, writeEnable[80], 1'b0, writeEnable[79], 1'b0, writeEnable[78], 1'b0, writeEnable[77],
          1'b0, writeEnable[76], 1'b0, writeEnable[75], 1'b0, writeEnable[74], 1'b0, writeEnable[73],
          1'b0, writeEnable[72], 1'b0, writeEnable[71], 1'b0, writeEnable[70], 1'b0, writeEnable[69],
          1'b0, writeEnable[68], 1'b0, writeEnable[67], 1'b0, writeEnable[66], 1'b0, writeEnable[65],
          1'b0, writeEnable[64], 1'b0, writeEnable[63], 1'b0, writeEnable[62], 1'b0, writeEnable[61],
          1'b0, writeEnable[60], 1'b0, writeEnable[59], 1'b0, writeEnable[58], 1'b0, writeEnable[57],
          1'b0, writeEnable[56], 1'b0, writeEnable[55], 1'b0, writeEnable[54], 1'b0, writeEnable[53],
          1'b0, writeEnable[52], 1'b0, writeEnable[51], 1'b0, writeEnable[50], 1'b0, writeEnable[49],
          1'b0, writeEnable[48], 1'b0, writeEnable[47], 1'b0, writeEnable[46], 1'b0, writeEnable[45],
          1'b0, writeEnable[44], 1'b0, writeEnable[43], 1'b0, writeEnable[42], 1'b0, writeEnable[41],
          1'b0, writeEnable[40], 1'b0, writeEnable[39], 1'b0, writeEnable[38], 1'b0, writeEnable[37],
          1'b0, writeEnable[36], 1'b0, writeEnable[35], 1'b0, writeEnable[34], 1'b0, writeEnable[33],
          1'b0, writeEnable[32], 1'b0, writeEnable[31], 1'b0, writeEnable[30], 1'b0, writeEnable[29],
          1'b0, writeEnable[28], 1'b0, writeEnable[27], 1'b0, writeEnable[26], 1'b0, writeEnable[25],
          1'b0, writeEnable[24], 1'b0, writeEnable[23], 1'b0, writeEnable[22], 1'b0, writeEnable[21],
          1'b0, writeEnable[20], 1'b0, writeEnable[19], 1'b0, writeEnable[18], 1'b0, writeEnable[17],
          1'b0, writeEnable[16], 1'b0, writeEnable[15], 1'b0, writeEnable[14], 1'b0, writeEnable[13],
          1'b0, writeEnable[12], 1'b0, writeEnable[11], 1'b0, writeEnable[10], 1'b0, writeEnable[9],
          1'b0, writeEnable[8], 1'b0, writeEnable[7], 1'b0, writeEnable[6], 1'b0, writeEnable[5],
          1'b0, writeEnable[4], 1'b0, writeEnable[3], 1'b0, writeEnable[2], 1'b0, writeEnable[1],
          1'b0, writeEnable[0]} << mux_address);
        new_data =  ( {1'b0, D_int[127], 1'b0, D_int[126], 1'b0, D_int[125], 1'b0, D_int[124],
          1'b0, D_int[123], 1'b0, D_int[122], 1'b0, D_int[121], 1'b0, D_int[120], 1'b0, D_int[119],
          1'b0, D_int[118], 1'b0, D_int[117], 1'b0, D_int[116], 1'b0, D_int[115], 1'b0, D_int[114],
          1'b0, D_int[113], 1'b0, D_int[112], 1'b0, D_int[111], 1'b0, D_int[110], 1'b0, D_int[109],
          1'b0, D_int[108], 1'b0, D_int[107], 1'b0, D_int[106], 1'b0, D_int[105], 1'b0, D_int[104],
          1'b0, D_int[103], 1'b0, D_int[102], 1'b0, D_int[101], 1'b0, D_int[100], 1'b0, D_int[99],
          1'b0, D_int[98], 1'b0, D_int[97], 1'b0, D_int[96], 1'b0, D_int[95], 1'b0, D_int[94],
          1'b0, D_int[93], 1'b0, D_int[92], 1'b0, D_int[91], 1'b0, D_int[90], 1'b0, D_int[89],
          1'b0, D_int[88], 1'b0, D_int[87], 1'b0, D_int[86], 1'b0, D_int[85], 1'b0, D_int[84],
          1'b0, D_int[83], 1'b0, D_int[82], 1'b0, D_int[81], 1'b0, D_int[80], 1'b0, D_int[79],
          1'b0, D_int[78], 1'b0, D_int[77], 1'b0, D_int[76], 1'b0, D_int[75], 1'b0, D_int[74],
          1'b0, D_int[73], 1'b0, D_int[72], 1'b0, D_int[71], 1'b0, D_int[70], 1'b0, D_int[69],
          1'b0, D_int[68], 1'b0, D_int[67], 1'b0, D_int[66], 1'b0, D_int[65], 1'b0, D_int[64],
          1'b0, D_int[63], 1'b0, D_int[62], 1'b0, D_int[61], 1'b0, D_int[60], 1'b0, D_int[59],
          1'b0, D_int[58], 1'b0, D_int[57], 1'b0, D_int[56], 1'b0, D_int[55], 1'b0, D_int[54],
          1'b0, D_int[53], 1'b0, D_int[52], 1'b0, D_int[51], 1'b0, D_int[50], 1'b0, D_int[49],
          1'b0, D_int[48], 1'b0, D_int[47], 1'b0, D_int[46], 1'b0, D_int[45], 1'b0, D_int[44],
          1'b0, D_int[43], 1'b0, D_int[42], 1'b0, D_int[41], 1'b0, D_int[40], 1'b0, D_int[39],
          1'b0, D_int[38], 1'b0, D_int[37], 1'b0, D_int[36], 1'b0, D_int[35], 1'b0, D_int[34],
          1'b0, D_int[33], 1'b0, D_int[32], 1'b0, D_int[31], 1'b0, D_int[30], 1'b0, D_int[29],
          1'b0, D_int[28], 1'b0, D_int[27], 1'b0, D_int[26], 1'b0, D_int[25], 1'b0, D_int[24],
          1'b0, D_int[23], 1'b0, D_int[22], 1'b0, D_int[21], 1'b0, D_int[20], 1'b0, D_int[19],
          1'b0, D_int[18], 1'b0, D_int[17], 1'b0, D_int[16], 1'b0, D_int[15], 1'b0, D_int[14],
          1'b0, D_int[13], 1'b0, D_int[12], 1'b0, D_int[11], 1'b0, D_int[10], 1'b0, D_int[9],
          1'b0, D_int[8], 1'b0, D_int[7], 1'b0, D_int[6], 1'b0, D_int[5], 1'b0, D_int[4],
          1'b0, D_int[3], 1'b0, D_int[2], 1'b0, D_int[1], 1'b0, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
      end else begin
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[254], data_out[252], data_out[250], data_out[248], data_out[246],
          data_out[244], data_out[242], data_out[240], data_out[238], data_out[236],
          data_out[234], data_out[232], data_out[230], data_out[228], data_out[226],
          data_out[224], data_out[222], data_out[220], data_out[218], data_out[216],
          data_out[214], data_out[212], data_out[210], data_out[208], data_out[206],
          data_out[204], data_out[202], data_out[200], data_out[198], data_out[196],
          data_out[194], data_out[192], data_out[190], data_out[188], data_out[186],
          data_out[184], data_out[182], data_out[180], data_out[178], data_out[176],
          data_out[174], data_out[172], data_out[170], data_out[168], data_out[166],
          data_out[164], data_out[162], data_out[160], data_out[158], data_out[156],
          data_out[154], data_out[152], data_out[150], data_out[148], data_out[146],
          data_out[144], data_out[142], data_out[140], data_out[138], data_out[136],
          data_out[134], data_out[132], data_out[130], data_out[128], data_out[126],
          data_out[124], data_out[122], data_out[120], data_out[118], data_out[116],
          data_out[114], data_out[112], data_out[110], data_out[108], data_out[106],
          data_out[104], data_out[102], data_out[100], data_out[98], data_out[96],
          data_out[94], data_out[92], data_out[90], data_out[88], data_out[86], data_out[84],
          data_out[82], data_out[80], data_out[78], data_out[76], data_out[74], data_out[72],
          data_out[70], data_out[68], data_out[66], data_out[64], data_out[62], data_out[60],
          data_out[58], data_out[56], data_out[54], data_out[52], data_out[50], data_out[48],
          data_out[46], data_out[44], data_out[42], data_out[40], data_out[38], data_out[36],
          data_out[34], data_out[32], data_out[30], data_out[28], data_out[26], data_out[24],
          data_out[22], data_out[20], data_out[18], data_out[16], data_out[14], data_out[12],
          data_out[10], data_out[8], data_out[6], data_out[4], data_out[2], data_out[0]};
      end
      if (GWEN_int !== 1'b1) begin
        Q_int = D_int;
      end else begin
        shifted_readLatch0 = readLatch0;
        Q_int = {shifted_readLatch0[127], shifted_readLatch0[126], shifted_readLatch0[125],
          shifted_readLatch0[124], shifted_readLatch0[123], shifted_readLatch0[122],
          shifted_readLatch0[121], shifted_readLatch0[120], shifted_readLatch0[119],
          shifted_readLatch0[118], shifted_readLatch0[117], shifted_readLatch0[116],
          shifted_readLatch0[115], shifted_readLatch0[114], shifted_readLatch0[113],
          shifted_readLatch0[112], shifted_readLatch0[111], shifted_readLatch0[110],
          shifted_readLatch0[109], shifted_readLatch0[108], shifted_readLatch0[107],
          shifted_readLatch0[106], shifted_readLatch0[105], shifted_readLatch0[104],
          shifted_readLatch0[103], shifted_readLatch0[102], shifted_readLatch0[101],
          shifted_readLatch0[100], shifted_readLatch0[99], shifted_readLatch0[98],
          shifted_readLatch0[97], shifted_readLatch0[96], shifted_readLatch0[95], shifted_readLatch0[94],
          shifted_readLatch0[93], shifted_readLatch0[92], shifted_readLatch0[91], shifted_readLatch0[90],
          shifted_readLatch0[89], shifted_readLatch0[88], shifted_readLatch0[87], shifted_readLatch0[86],
          shifted_readLatch0[85], shifted_readLatch0[84], shifted_readLatch0[83], shifted_readLatch0[82],
          shifted_readLatch0[81], shifted_readLatch0[80], shifted_readLatch0[79], shifted_readLatch0[78],
          shifted_readLatch0[77], shifted_readLatch0[76], shifted_readLatch0[75], shifted_readLatch0[74],
          shifted_readLatch0[73], shifted_readLatch0[72], shifted_readLatch0[71], shifted_readLatch0[70],
          shifted_readLatch0[69], shifted_readLatch0[68], shifted_readLatch0[67], shifted_readLatch0[66],
          shifted_readLatch0[65], shifted_readLatch0[64], shifted_readLatch0[63], shifted_readLatch0[62],
          shifted_readLatch0[61], shifted_readLatch0[60], shifted_readLatch0[59], shifted_readLatch0[58],
          shifted_readLatch0[57], shifted_readLatch0[56], shifted_readLatch0[55], shifted_readLatch0[54],
          shifted_readLatch0[53], shifted_readLatch0[52], shifted_readLatch0[51], shifted_readLatch0[50],
          shifted_readLatch0[49], shifted_readLatch0[48], shifted_readLatch0[47], shifted_readLatch0[46],
          shifted_readLatch0[45], shifted_readLatch0[44], shifted_readLatch0[43], shifted_readLatch0[42],
          shifted_readLatch0[41], shifted_readLatch0[40], shifted_readLatch0[39], shifted_readLatch0[38],
          shifted_readLatch0[37], shifted_readLatch0[36], shifted_readLatch0[35], shifted_readLatch0[34],
          shifted_readLatch0[33], shifted_readLatch0[32], shifted_readLatch0[31], shifted_readLatch0[30],
          shifted_readLatch0[29], shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26],
          shifted_readLatch0[25], shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22],
          shifted_readLatch0[21], shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18],
          shifted_readLatch0[17], shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14],
          shifted_readLatch0[13], shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10],
          shifted_readLatch0[9], shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6],
          shifted_readLatch0[5], shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2],
          shifted_readLatch0[1], shifted_readLatch0[0]};
      end
      if( isBitX(GWEN_int) ) begin
        Q_int = {128{1'bx}};
      end
    end
  end
  endtask
  always @ (CEN_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
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
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (RET1N_ === 1'b0 && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (RET1N_ === 1'b1 && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
      Q_int = {128{1'bx}};
      CEN_int = 1'bx;
      WEN_int = {128{1'bx}};
      A_int = {7{1'bx}};
      D_int = {128{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      GWEN_int = 1'bx;
      RET1N_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st == 1'b1) begin
      pre_charge_st = 0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
        Q_int = {128{1'bx}};
      CEN_int = 1'bx;
      WEN_int = {128{1'bx}};
      A_int = {7{1'bx}};
      D_int = {128{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      GWEN_int = 1'bx;
      RET1N_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end


  always @ CLK_ begin
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
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      CEN_int = CEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      RET1N_int = RET1N_;
      if (CEN_int != 1'b1) begin
        WEN_int = WEN_;
        A_int = A_;
        D_int = D_;
        GWEN_int = GWEN_;
      end
      clk0_int = 1'b0;
      CEN_int = CEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      RET1N_int = RET1N_;
      if (CEN_int != 1'b1) begin
        WEN_int = WEN_;
        A_int = A_;
        D_int = D_;
        GWEN_int = GWEN_;
      end
      clk0_int = 1'b0;
    readWrite;
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
    end
  end
    LAST_CLK = CLK_;
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

endmodule
`endcelldefine
`else
`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module rfsp128x128 (VDDCE, VDDPE, VSSE, Q, CLK, CEN, WEN, A, D, EMA, EMAW, GWEN, RET1N);
`else
module rfsp128x128 (Q, CLK, CEN, WEN, A, D, EMA, EMAW, GWEN, RET1N);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 128;
  parameter WORDS = 128;
  parameter MUX = 2;
  parameter MEM_WIDTH = 256; // redun block size 2, 128 on left, 128 on right
  parameter MEM_HEIGHT = 64;
  parameter WP_SIZE = 1 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 0;

  output [127:0] Q;
  input  CLK;
  input  CEN;
  input [127:0] WEN;
  input [6:0] A;
  input [127:0] D;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  GWEN;
  input  RET1N;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  reg [255:0] mem [0:63];
  reg [255:0] row, row_t;
  reg LAST_CLK;
  reg [255:0] row_mask;
  reg [255:0] new_data;
  reg [255:0] data_out;
  reg [127:0] readLatch0;
  reg [127:0] shifted_readLatch0;
  reg [127:0] Q_int;
  reg [127:0] writeEnable;

  reg NOT_CEN, NOT_WEN127, NOT_WEN126, NOT_WEN125, NOT_WEN124, NOT_WEN123, NOT_WEN122;
  reg NOT_WEN121, NOT_WEN120, NOT_WEN119, NOT_WEN118, NOT_WEN117, NOT_WEN116, NOT_WEN115;
  reg NOT_WEN114, NOT_WEN113, NOT_WEN112, NOT_WEN111, NOT_WEN110, NOT_WEN109, NOT_WEN108;
  reg NOT_WEN107, NOT_WEN106, NOT_WEN105, NOT_WEN104, NOT_WEN103, NOT_WEN102, NOT_WEN101;
  reg NOT_WEN100, NOT_WEN99, NOT_WEN98, NOT_WEN97, NOT_WEN96, NOT_WEN95, NOT_WEN94;
  reg NOT_WEN93, NOT_WEN92, NOT_WEN91, NOT_WEN90, NOT_WEN89, NOT_WEN88, NOT_WEN87;
  reg NOT_WEN86, NOT_WEN85, NOT_WEN84, NOT_WEN83, NOT_WEN82, NOT_WEN81, NOT_WEN80;
  reg NOT_WEN79, NOT_WEN78, NOT_WEN77, NOT_WEN76, NOT_WEN75, NOT_WEN74, NOT_WEN73;
  reg NOT_WEN72, NOT_WEN71, NOT_WEN70, NOT_WEN69, NOT_WEN68, NOT_WEN67, NOT_WEN66;
  reg NOT_WEN65, NOT_WEN64, NOT_WEN63, NOT_WEN62, NOT_WEN61, NOT_WEN60, NOT_WEN59;
  reg NOT_WEN58, NOT_WEN57, NOT_WEN56, NOT_WEN55, NOT_WEN54, NOT_WEN53, NOT_WEN52;
  reg NOT_WEN51, NOT_WEN50, NOT_WEN49, NOT_WEN48, NOT_WEN47, NOT_WEN46, NOT_WEN45;
  reg NOT_WEN44, NOT_WEN43, NOT_WEN42, NOT_WEN41, NOT_WEN40, NOT_WEN39, NOT_WEN38;
  reg NOT_WEN37, NOT_WEN36, NOT_WEN35, NOT_WEN34, NOT_WEN33, NOT_WEN32, NOT_WEN31;
  reg NOT_WEN30, NOT_WEN29, NOT_WEN28, NOT_WEN27, NOT_WEN26, NOT_WEN25, NOT_WEN24;
  reg NOT_WEN23, NOT_WEN22, NOT_WEN21, NOT_WEN20, NOT_WEN19, NOT_WEN18, NOT_WEN17;
  reg NOT_WEN16, NOT_WEN15, NOT_WEN14, NOT_WEN13, NOT_WEN12, NOT_WEN11, NOT_WEN10;
  reg NOT_WEN9, NOT_WEN8, NOT_WEN7, NOT_WEN6, NOT_WEN5, NOT_WEN4, NOT_WEN3, NOT_WEN2;
  reg NOT_WEN1, NOT_WEN0, NOT_A6, NOT_A5, NOT_A4, NOT_A3, NOT_A2, NOT_A1, NOT_A0, NOT_D127;
  reg NOT_D126, NOT_D125, NOT_D124, NOT_D123, NOT_D122, NOT_D121, NOT_D120, NOT_D119;
  reg NOT_D118, NOT_D117, NOT_D116, NOT_D115, NOT_D114, NOT_D113, NOT_D112, NOT_D111;
  reg NOT_D110, NOT_D109, NOT_D108, NOT_D107, NOT_D106, NOT_D105, NOT_D104, NOT_D103;
  reg NOT_D102, NOT_D101, NOT_D100, NOT_D99, NOT_D98, NOT_D97, NOT_D96, NOT_D95, NOT_D94;
  reg NOT_D93, NOT_D92, NOT_D91, NOT_D90, NOT_D89, NOT_D88, NOT_D87, NOT_D86, NOT_D85;
  reg NOT_D84, NOT_D83, NOT_D82, NOT_D81, NOT_D80, NOT_D79, NOT_D78, NOT_D77, NOT_D76;
  reg NOT_D75, NOT_D74, NOT_D73, NOT_D72, NOT_D71, NOT_D70, NOT_D69, NOT_D68, NOT_D67;
  reg NOT_D66, NOT_D65, NOT_D64, NOT_D63, NOT_D62, NOT_D61, NOT_D60, NOT_D59, NOT_D58;
  reg NOT_D57, NOT_D56, NOT_D55, NOT_D54, NOT_D53, NOT_D52, NOT_D51, NOT_D50, NOT_D49;
  reg NOT_D48, NOT_D47, NOT_D46, NOT_D45, NOT_D44, NOT_D43, NOT_D42, NOT_D41, NOT_D40;
  reg NOT_D39, NOT_D38, NOT_D37, NOT_D36, NOT_D35, NOT_D34, NOT_D33, NOT_D32, NOT_D31;
  reg NOT_D30, NOT_D29, NOT_D28, NOT_D27, NOT_D26, NOT_D25, NOT_D24, NOT_D23, NOT_D22;
  reg NOT_D21, NOT_D20, NOT_D19, NOT_D18, NOT_D17, NOT_D16, NOT_D15, NOT_D14, NOT_D13;
  reg NOT_D12, NOT_D11, NOT_D10, NOT_D9, NOT_D8, NOT_D7, NOT_D6, NOT_D5, NOT_D4, NOT_D3;
  reg NOT_D2, NOT_D1, NOT_D0, NOT_EMA2, NOT_EMA1, NOT_EMA0, NOT_EMAW1, NOT_EMAW0, NOT_GWEN;
  reg NOT_RET1N;
  reg NOT_CLK_PER, NOT_CLK_MINH, NOT_CLK_MINL;
  reg clk0_int;

  wire [127:0] Q_;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire [127:0] WEN_;
  reg [127:0] WEN_int;
  wire [6:0] A_;
  reg [6:0] A_int;
  wire [127:0] D_;
  reg [127:0] D_int;
  wire [2:0] EMA_;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
  reg [1:0] EMAW_int;
  wire  GWEN_;
  reg  GWEN_int;
  wire  RET1N_;
  reg  RET1N_int;

  buf B0(Q[0], Q_[0]);
  buf B1(Q[1], Q_[1]);
  buf B2(Q[2], Q_[2]);
  buf B3(Q[3], Q_[3]);
  buf B4(Q[4], Q_[4]);
  buf B5(Q[5], Q_[5]);
  buf B6(Q[6], Q_[6]);
  buf B7(Q[7], Q_[7]);
  buf B8(Q[8], Q_[8]);
  buf B9(Q[9], Q_[9]);
  buf B10(Q[10], Q_[10]);
  buf B11(Q[11], Q_[11]);
  buf B12(Q[12], Q_[12]);
  buf B13(Q[13], Q_[13]);
  buf B14(Q[14], Q_[14]);
  buf B15(Q[15], Q_[15]);
  buf B16(Q[16], Q_[16]);
  buf B17(Q[17], Q_[17]);
  buf B18(Q[18], Q_[18]);
  buf B19(Q[19], Q_[19]);
  buf B20(Q[20], Q_[20]);
  buf B21(Q[21], Q_[21]);
  buf B22(Q[22], Q_[22]);
  buf B23(Q[23], Q_[23]);
  buf B24(Q[24], Q_[24]);
  buf B25(Q[25], Q_[25]);
  buf B26(Q[26], Q_[26]);
  buf B27(Q[27], Q_[27]);
  buf B28(Q[28], Q_[28]);
  buf B29(Q[29], Q_[29]);
  buf B30(Q[30], Q_[30]);
  buf B31(Q[31], Q_[31]);
  buf B32(Q[32], Q_[32]);
  buf B33(Q[33], Q_[33]);
  buf B34(Q[34], Q_[34]);
  buf B35(Q[35], Q_[35]);
  buf B36(Q[36], Q_[36]);
  buf B37(Q[37], Q_[37]);
  buf B38(Q[38], Q_[38]);
  buf B39(Q[39], Q_[39]);
  buf B40(Q[40], Q_[40]);
  buf B41(Q[41], Q_[41]);
  buf B42(Q[42], Q_[42]);
  buf B43(Q[43], Q_[43]);
  buf B44(Q[44], Q_[44]);
  buf B45(Q[45], Q_[45]);
  buf B46(Q[46], Q_[46]);
  buf B47(Q[47], Q_[47]);
  buf B48(Q[48], Q_[48]);
  buf B49(Q[49], Q_[49]);
  buf B50(Q[50], Q_[50]);
  buf B51(Q[51], Q_[51]);
  buf B52(Q[52], Q_[52]);
  buf B53(Q[53], Q_[53]);
  buf B54(Q[54], Q_[54]);
  buf B55(Q[55], Q_[55]);
  buf B56(Q[56], Q_[56]);
  buf B57(Q[57], Q_[57]);
  buf B58(Q[58], Q_[58]);
  buf B59(Q[59], Q_[59]);
  buf B60(Q[60], Q_[60]);
  buf B61(Q[61], Q_[61]);
  buf B62(Q[62], Q_[62]);
  buf B63(Q[63], Q_[63]);
  buf B64(Q[64], Q_[64]);
  buf B65(Q[65], Q_[65]);
  buf B66(Q[66], Q_[66]);
  buf B67(Q[67], Q_[67]);
  buf B68(Q[68], Q_[68]);
  buf B69(Q[69], Q_[69]);
  buf B70(Q[70], Q_[70]);
  buf B71(Q[71], Q_[71]);
  buf B72(Q[72], Q_[72]);
  buf B73(Q[73], Q_[73]);
  buf B74(Q[74], Q_[74]);
  buf B75(Q[75], Q_[75]);
  buf B76(Q[76], Q_[76]);
  buf B77(Q[77], Q_[77]);
  buf B78(Q[78], Q_[78]);
  buf B79(Q[79], Q_[79]);
  buf B80(Q[80], Q_[80]);
  buf B81(Q[81], Q_[81]);
  buf B82(Q[82], Q_[82]);
  buf B83(Q[83], Q_[83]);
  buf B84(Q[84], Q_[84]);
  buf B85(Q[85], Q_[85]);
  buf B86(Q[86], Q_[86]);
  buf B87(Q[87], Q_[87]);
  buf B88(Q[88], Q_[88]);
  buf B89(Q[89], Q_[89]);
  buf B90(Q[90], Q_[90]);
  buf B91(Q[91], Q_[91]);
  buf B92(Q[92], Q_[92]);
  buf B93(Q[93], Q_[93]);
  buf B94(Q[94], Q_[94]);
  buf B95(Q[95], Q_[95]);
  buf B96(Q[96], Q_[96]);
  buf B97(Q[97], Q_[97]);
  buf B98(Q[98], Q_[98]);
  buf B99(Q[99], Q_[99]);
  buf B100(Q[100], Q_[100]);
  buf B101(Q[101], Q_[101]);
  buf B102(Q[102], Q_[102]);
  buf B103(Q[103], Q_[103]);
  buf B104(Q[104], Q_[104]);
  buf B105(Q[105], Q_[105]);
  buf B106(Q[106], Q_[106]);
  buf B107(Q[107], Q_[107]);
  buf B108(Q[108], Q_[108]);
  buf B109(Q[109], Q_[109]);
  buf B110(Q[110], Q_[110]);
  buf B111(Q[111], Q_[111]);
  buf B112(Q[112], Q_[112]);
  buf B113(Q[113], Q_[113]);
  buf B114(Q[114], Q_[114]);
  buf B115(Q[115], Q_[115]);
  buf B116(Q[116], Q_[116]);
  buf B117(Q[117], Q_[117]);
  buf B118(Q[118], Q_[118]);
  buf B119(Q[119], Q_[119]);
  buf B120(Q[120], Q_[120]);
  buf B121(Q[121], Q_[121]);
  buf B122(Q[122], Q_[122]);
  buf B123(Q[123], Q_[123]);
  buf B124(Q[124], Q_[124]);
  buf B125(Q[125], Q_[125]);
  buf B126(Q[126], Q_[126]);
  buf B127(Q[127], Q_[127]);
  buf B128(CLK_, CLK);
  buf B129(CEN_, CEN);
  buf B130(WEN_[0], WEN[0]);
  buf B131(WEN_[1], WEN[1]);
  buf B132(WEN_[2], WEN[2]);
  buf B133(WEN_[3], WEN[3]);
  buf B134(WEN_[4], WEN[4]);
  buf B135(WEN_[5], WEN[5]);
  buf B136(WEN_[6], WEN[6]);
  buf B137(WEN_[7], WEN[7]);
  buf B138(WEN_[8], WEN[8]);
  buf B139(WEN_[9], WEN[9]);
  buf B140(WEN_[10], WEN[10]);
  buf B141(WEN_[11], WEN[11]);
  buf B142(WEN_[12], WEN[12]);
  buf B143(WEN_[13], WEN[13]);
  buf B144(WEN_[14], WEN[14]);
  buf B145(WEN_[15], WEN[15]);
  buf B146(WEN_[16], WEN[16]);
  buf B147(WEN_[17], WEN[17]);
  buf B148(WEN_[18], WEN[18]);
  buf B149(WEN_[19], WEN[19]);
  buf B150(WEN_[20], WEN[20]);
  buf B151(WEN_[21], WEN[21]);
  buf B152(WEN_[22], WEN[22]);
  buf B153(WEN_[23], WEN[23]);
  buf B154(WEN_[24], WEN[24]);
  buf B155(WEN_[25], WEN[25]);
  buf B156(WEN_[26], WEN[26]);
  buf B157(WEN_[27], WEN[27]);
  buf B158(WEN_[28], WEN[28]);
  buf B159(WEN_[29], WEN[29]);
  buf B160(WEN_[30], WEN[30]);
  buf B161(WEN_[31], WEN[31]);
  buf B162(WEN_[32], WEN[32]);
  buf B163(WEN_[33], WEN[33]);
  buf B164(WEN_[34], WEN[34]);
  buf B165(WEN_[35], WEN[35]);
  buf B166(WEN_[36], WEN[36]);
  buf B167(WEN_[37], WEN[37]);
  buf B168(WEN_[38], WEN[38]);
  buf B169(WEN_[39], WEN[39]);
  buf B170(WEN_[40], WEN[40]);
  buf B171(WEN_[41], WEN[41]);
  buf B172(WEN_[42], WEN[42]);
  buf B173(WEN_[43], WEN[43]);
  buf B174(WEN_[44], WEN[44]);
  buf B175(WEN_[45], WEN[45]);
  buf B176(WEN_[46], WEN[46]);
  buf B177(WEN_[47], WEN[47]);
  buf B178(WEN_[48], WEN[48]);
  buf B179(WEN_[49], WEN[49]);
  buf B180(WEN_[50], WEN[50]);
  buf B181(WEN_[51], WEN[51]);
  buf B182(WEN_[52], WEN[52]);
  buf B183(WEN_[53], WEN[53]);
  buf B184(WEN_[54], WEN[54]);
  buf B185(WEN_[55], WEN[55]);
  buf B186(WEN_[56], WEN[56]);
  buf B187(WEN_[57], WEN[57]);
  buf B188(WEN_[58], WEN[58]);
  buf B189(WEN_[59], WEN[59]);
  buf B190(WEN_[60], WEN[60]);
  buf B191(WEN_[61], WEN[61]);
  buf B192(WEN_[62], WEN[62]);
  buf B193(WEN_[63], WEN[63]);
  buf B194(WEN_[64], WEN[64]);
  buf B195(WEN_[65], WEN[65]);
  buf B196(WEN_[66], WEN[66]);
  buf B197(WEN_[67], WEN[67]);
  buf B198(WEN_[68], WEN[68]);
  buf B199(WEN_[69], WEN[69]);
  buf B200(WEN_[70], WEN[70]);
  buf B201(WEN_[71], WEN[71]);
  buf B202(WEN_[72], WEN[72]);
  buf B203(WEN_[73], WEN[73]);
  buf B204(WEN_[74], WEN[74]);
  buf B205(WEN_[75], WEN[75]);
  buf B206(WEN_[76], WEN[76]);
  buf B207(WEN_[77], WEN[77]);
  buf B208(WEN_[78], WEN[78]);
  buf B209(WEN_[79], WEN[79]);
  buf B210(WEN_[80], WEN[80]);
  buf B211(WEN_[81], WEN[81]);
  buf B212(WEN_[82], WEN[82]);
  buf B213(WEN_[83], WEN[83]);
  buf B214(WEN_[84], WEN[84]);
  buf B215(WEN_[85], WEN[85]);
  buf B216(WEN_[86], WEN[86]);
  buf B217(WEN_[87], WEN[87]);
  buf B218(WEN_[88], WEN[88]);
  buf B219(WEN_[89], WEN[89]);
  buf B220(WEN_[90], WEN[90]);
  buf B221(WEN_[91], WEN[91]);
  buf B222(WEN_[92], WEN[92]);
  buf B223(WEN_[93], WEN[93]);
  buf B224(WEN_[94], WEN[94]);
  buf B225(WEN_[95], WEN[95]);
  buf B226(WEN_[96], WEN[96]);
  buf B227(WEN_[97], WEN[97]);
  buf B228(WEN_[98], WEN[98]);
  buf B229(WEN_[99], WEN[99]);
  buf B230(WEN_[100], WEN[100]);
  buf B231(WEN_[101], WEN[101]);
  buf B232(WEN_[102], WEN[102]);
  buf B233(WEN_[103], WEN[103]);
  buf B234(WEN_[104], WEN[104]);
  buf B235(WEN_[105], WEN[105]);
  buf B236(WEN_[106], WEN[106]);
  buf B237(WEN_[107], WEN[107]);
  buf B238(WEN_[108], WEN[108]);
  buf B239(WEN_[109], WEN[109]);
  buf B240(WEN_[110], WEN[110]);
  buf B241(WEN_[111], WEN[111]);
  buf B242(WEN_[112], WEN[112]);
  buf B243(WEN_[113], WEN[113]);
  buf B244(WEN_[114], WEN[114]);
  buf B245(WEN_[115], WEN[115]);
  buf B246(WEN_[116], WEN[116]);
  buf B247(WEN_[117], WEN[117]);
  buf B248(WEN_[118], WEN[118]);
  buf B249(WEN_[119], WEN[119]);
  buf B250(WEN_[120], WEN[120]);
  buf B251(WEN_[121], WEN[121]);
  buf B252(WEN_[122], WEN[122]);
  buf B253(WEN_[123], WEN[123]);
  buf B254(WEN_[124], WEN[124]);
  buf B255(WEN_[125], WEN[125]);
  buf B256(WEN_[126], WEN[126]);
  buf B257(WEN_[127], WEN[127]);
  buf B258(A_[0], A[0]);
  buf B259(A_[1], A[1]);
  buf B260(A_[2], A[2]);
  buf B261(A_[3], A[3]);
  buf B262(A_[4], A[4]);
  buf B263(A_[5], A[5]);
  buf B264(A_[6], A[6]);
  buf B265(D_[0], D[0]);
  buf B266(D_[1], D[1]);
  buf B267(D_[2], D[2]);
  buf B268(D_[3], D[3]);
  buf B269(D_[4], D[4]);
  buf B270(D_[5], D[5]);
  buf B271(D_[6], D[6]);
  buf B272(D_[7], D[7]);
  buf B273(D_[8], D[8]);
  buf B274(D_[9], D[9]);
  buf B275(D_[10], D[10]);
  buf B276(D_[11], D[11]);
  buf B277(D_[12], D[12]);
  buf B278(D_[13], D[13]);
  buf B279(D_[14], D[14]);
  buf B280(D_[15], D[15]);
  buf B281(D_[16], D[16]);
  buf B282(D_[17], D[17]);
  buf B283(D_[18], D[18]);
  buf B284(D_[19], D[19]);
  buf B285(D_[20], D[20]);
  buf B286(D_[21], D[21]);
  buf B287(D_[22], D[22]);
  buf B288(D_[23], D[23]);
  buf B289(D_[24], D[24]);
  buf B290(D_[25], D[25]);
  buf B291(D_[26], D[26]);
  buf B292(D_[27], D[27]);
  buf B293(D_[28], D[28]);
  buf B294(D_[29], D[29]);
  buf B295(D_[30], D[30]);
  buf B296(D_[31], D[31]);
  buf B297(D_[32], D[32]);
  buf B298(D_[33], D[33]);
  buf B299(D_[34], D[34]);
  buf B300(D_[35], D[35]);
  buf B301(D_[36], D[36]);
  buf B302(D_[37], D[37]);
  buf B303(D_[38], D[38]);
  buf B304(D_[39], D[39]);
  buf B305(D_[40], D[40]);
  buf B306(D_[41], D[41]);
  buf B307(D_[42], D[42]);
  buf B308(D_[43], D[43]);
  buf B309(D_[44], D[44]);
  buf B310(D_[45], D[45]);
  buf B311(D_[46], D[46]);
  buf B312(D_[47], D[47]);
  buf B313(D_[48], D[48]);
  buf B314(D_[49], D[49]);
  buf B315(D_[50], D[50]);
  buf B316(D_[51], D[51]);
  buf B317(D_[52], D[52]);
  buf B318(D_[53], D[53]);
  buf B319(D_[54], D[54]);
  buf B320(D_[55], D[55]);
  buf B321(D_[56], D[56]);
  buf B322(D_[57], D[57]);
  buf B323(D_[58], D[58]);
  buf B324(D_[59], D[59]);
  buf B325(D_[60], D[60]);
  buf B326(D_[61], D[61]);
  buf B327(D_[62], D[62]);
  buf B328(D_[63], D[63]);
  buf B329(D_[64], D[64]);
  buf B330(D_[65], D[65]);
  buf B331(D_[66], D[66]);
  buf B332(D_[67], D[67]);
  buf B333(D_[68], D[68]);
  buf B334(D_[69], D[69]);
  buf B335(D_[70], D[70]);
  buf B336(D_[71], D[71]);
  buf B337(D_[72], D[72]);
  buf B338(D_[73], D[73]);
  buf B339(D_[74], D[74]);
  buf B340(D_[75], D[75]);
  buf B341(D_[76], D[76]);
  buf B342(D_[77], D[77]);
  buf B343(D_[78], D[78]);
  buf B344(D_[79], D[79]);
  buf B345(D_[80], D[80]);
  buf B346(D_[81], D[81]);
  buf B347(D_[82], D[82]);
  buf B348(D_[83], D[83]);
  buf B349(D_[84], D[84]);
  buf B350(D_[85], D[85]);
  buf B351(D_[86], D[86]);
  buf B352(D_[87], D[87]);
  buf B353(D_[88], D[88]);
  buf B354(D_[89], D[89]);
  buf B355(D_[90], D[90]);
  buf B356(D_[91], D[91]);
  buf B357(D_[92], D[92]);
  buf B358(D_[93], D[93]);
  buf B359(D_[94], D[94]);
  buf B360(D_[95], D[95]);
  buf B361(D_[96], D[96]);
  buf B362(D_[97], D[97]);
  buf B363(D_[98], D[98]);
  buf B364(D_[99], D[99]);
  buf B365(D_[100], D[100]);
  buf B366(D_[101], D[101]);
  buf B367(D_[102], D[102]);
  buf B368(D_[103], D[103]);
  buf B369(D_[104], D[104]);
  buf B370(D_[105], D[105]);
  buf B371(D_[106], D[106]);
  buf B372(D_[107], D[107]);
  buf B373(D_[108], D[108]);
  buf B374(D_[109], D[109]);
  buf B375(D_[110], D[110]);
  buf B376(D_[111], D[111]);
  buf B377(D_[112], D[112]);
  buf B378(D_[113], D[113]);
  buf B379(D_[114], D[114]);
  buf B380(D_[115], D[115]);
  buf B381(D_[116], D[116]);
  buf B382(D_[117], D[117]);
  buf B383(D_[118], D[118]);
  buf B384(D_[119], D[119]);
  buf B385(D_[120], D[120]);
  buf B386(D_[121], D[121]);
  buf B387(D_[122], D[122]);
  buf B388(D_[123], D[123]);
  buf B389(D_[124], D[124]);
  buf B390(D_[125], D[125]);
  buf B391(D_[126], D[126]);
  buf B392(D_[127], D[127]);
  buf B393(EMA_[0], EMA[0]);
  buf B394(EMA_[1], EMA[1]);
  buf B395(EMA_[2], EMA[2]);
  buf B396(EMAW_[0], EMAW[0]);
  buf B397(EMAW_[1], EMAW[1]);
  buf B398(GWEN_, GWEN);
  buf B399(RET1N_, RET1N);

   `ifdef ARM_FAULT_MODELING
     rfsp128x128_error_injection u1(.CLK(CLK_), .Q_out(Q_), .A(A_int), .CEN(CEN_int), .GWEN(GWEN_int), .WEN(WEN_int), .Q_in(Q_int));
  `else
  assign Q_ = (RET1N_ | pre_charge_st) ? ((Q_int)) : {128{1'bx}};
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
  always @ (EMA_) begin
  	if(EMA_ < 2) 
   	$display("Warning: Set Value for EMA doesn't match Default value 2 in %m at %0t", $time);
  end
  always @ (EMAW_) begin
  	if(EMAW_ < 0) 
   	$display("Warning: Set Value for EMAW doesn't match Default value 0 in %m at %0t", $time);
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



  task readWrite;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (RET1N_int === 1'b0 && CEN_int === 1'b0) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CEN_int, EMA_int, EMAW_int, RET1N_int} === 1'bx) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0)) begin
      Q_int = {128{1'bx}};
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (CEN_int === 1'b0) begin
      mux_address = (A_int & 1'b1);
      row_address = (A_int >> 1);
      if (row_address > 63)
        row = {256{1'bx}};
      else
        row = mem[row_address];
      if( isBitX(GWEN_int) ) begin
        writeEnable = {128{1'bx}};
        D_int = {128{1'bx}};
      end else
          writeEnable = ~ ( {128{GWEN_int}} | {WEN_int[127], WEN_int[126], WEN_int[125],
          WEN_int[124], WEN_int[123], WEN_int[122], WEN_int[121], WEN_int[120], WEN_int[119],
          WEN_int[118], WEN_int[117], WEN_int[116], WEN_int[115], WEN_int[114], WEN_int[113],
          WEN_int[112], WEN_int[111], WEN_int[110], WEN_int[109], WEN_int[108], WEN_int[107],
          WEN_int[106], WEN_int[105], WEN_int[104], WEN_int[103], WEN_int[102], WEN_int[101],
          WEN_int[100], WEN_int[99], WEN_int[98], WEN_int[97], WEN_int[96], WEN_int[95],
          WEN_int[94], WEN_int[93], WEN_int[92], WEN_int[91], WEN_int[90], WEN_int[89],
          WEN_int[88], WEN_int[87], WEN_int[86], WEN_int[85], WEN_int[84], WEN_int[83],
          WEN_int[82], WEN_int[81], WEN_int[80], WEN_int[79], WEN_int[78], WEN_int[77],
          WEN_int[76], WEN_int[75], WEN_int[74], WEN_int[73], WEN_int[72], WEN_int[71],
          WEN_int[70], WEN_int[69], WEN_int[68], WEN_int[67], WEN_int[66], WEN_int[65],
          WEN_int[64], WEN_int[63], WEN_int[62], WEN_int[61], WEN_int[60], WEN_int[59],
          WEN_int[58], WEN_int[57], WEN_int[56], WEN_int[55], WEN_int[54], WEN_int[53],
          WEN_int[52], WEN_int[51], WEN_int[50], WEN_int[49], WEN_int[48], WEN_int[47],
          WEN_int[46], WEN_int[45], WEN_int[44], WEN_int[43], WEN_int[42], WEN_int[41],
          WEN_int[40], WEN_int[39], WEN_int[38], WEN_int[37], WEN_int[36], WEN_int[35],
          WEN_int[34], WEN_int[33], WEN_int[32], WEN_int[31], WEN_int[30], WEN_int[29],
          WEN_int[28], WEN_int[27], WEN_int[26], WEN_int[25], WEN_int[24], WEN_int[23],
          WEN_int[22], WEN_int[21], WEN_int[20], WEN_int[19], WEN_int[18], WEN_int[17],
          WEN_int[16], WEN_int[15], WEN_int[14], WEN_int[13], WEN_int[12], WEN_int[11],
          WEN_int[10], WEN_int[9], WEN_int[8], WEN_int[7], WEN_int[6], WEN_int[5],
          WEN_int[4], WEN_int[3], WEN_int[2], WEN_int[1], WEN_int[0]});
      if (GWEN_int !== 1'b1) begin
        row_mask =  ( {1'b0, writeEnable[127], 1'b0, writeEnable[126], 1'b0, writeEnable[125],
          1'b0, writeEnable[124], 1'b0, writeEnable[123], 1'b0, writeEnable[122], 1'b0, writeEnable[121],
          1'b0, writeEnable[120], 1'b0, writeEnable[119], 1'b0, writeEnable[118], 1'b0, writeEnable[117],
          1'b0, writeEnable[116], 1'b0, writeEnable[115], 1'b0, writeEnable[114], 1'b0, writeEnable[113],
          1'b0, writeEnable[112], 1'b0, writeEnable[111], 1'b0, writeEnable[110], 1'b0, writeEnable[109],
          1'b0, writeEnable[108], 1'b0, writeEnable[107], 1'b0, writeEnable[106], 1'b0, writeEnable[105],
          1'b0, writeEnable[104], 1'b0, writeEnable[103], 1'b0, writeEnable[102], 1'b0, writeEnable[101],
          1'b0, writeEnable[100], 1'b0, writeEnable[99], 1'b0, writeEnable[98], 1'b0, writeEnable[97],
          1'b0, writeEnable[96], 1'b0, writeEnable[95], 1'b0, writeEnable[94], 1'b0, writeEnable[93],
          1'b0, writeEnable[92], 1'b0, writeEnable[91], 1'b0, writeEnable[90], 1'b0, writeEnable[89],
          1'b0, writeEnable[88], 1'b0, writeEnable[87], 1'b0, writeEnable[86], 1'b0, writeEnable[85],
          1'b0, writeEnable[84], 1'b0, writeEnable[83], 1'b0, writeEnable[82], 1'b0, writeEnable[81],
          1'b0, writeEnable[80], 1'b0, writeEnable[79], 1'b0, writeEnable[78], 1'b0, writeEnable[77],
          1'b0, writeEnable[76], 1'b0, writeEnable[75], 1'b0, writeEnable[74], 1'b0, writeEnable[73],
          1'b0, writeEnable[72], 1'b0, writeEnable[71], 1'b0, writeEnable[70], 1'b0, writeEnable[69],
          1'b0, writeEnable[68], 1'b0, writeEnable[67], 1'b0, writeEnable[66], 1'b0, writeEnable[65],
          1'b0, writeEnable[64], 1'b0, writeEnable[63], 1'b0, writeEnable[62], 1'b0, writeEnable[61],
          1'b0, writeEnable[60], 1'b0, writeEnable[59], 1'b0, writeEnable[58], 1'b0, writeEnable[57],
          1'b0, writeEnable[56], 1'b0, writeEnable[55], 1'b0, writeEnable[54], 1'b0, writeEnable[53],
          1'b0, writeEnable[52], 1'b0, writeEnable[51], 1'b0, writeEnable[50], 1'b0, writeEnable[49],
          1'b0, writeEnable[48], 1'b0, writeEnable[47], 1'b0, writeEnable[46], 1'b0, writeEnable[45],
          1'b0, writeEnable[44], 1'b0, writeEnable[43], 1'b0, writeEnable[42], 1'b0, writeEnable[41],
          1'b0, writeEnable[40], 1'b0, writeEnable[39], 1'b0, writeEnable[38], 1'b0, writeEnable[37],
          1'b0, writeEnable[36], 1'b0, writeEnable[35], 1'b0, writeEnable[34], 1'b0, writeEnable[33],
          1'b0, writeEnable[32], 1'b0, writeEnable[31], 1'b0, writeEnable[30], 1'b0, writeEnable[29],
          1'b0, writeEnable[28], 1'b0, writeEnable[27], 1'b0, writeEnable[26], 1'b0, writeEnable[25],
          1'b0, writeEnable[24], 1'b0, writeEnable[23], 1'b0, writeEnable[22], 1'b0, writeEnable[21],
          1'b0, writeEnable[20], 1'b0, writeEnable[19], 1'b0, writeEnable[18], 1'b0, writeEnable[17],
          1'b0, writeEnable[16], 1'b0, writeEnable[15], 1'b0, writeEnable[14], 1'b0, writeEnable[13],
          1'b0, writeEnable[12], 1'b0, writeEnable[11], 1'b0, writeEnable[10], 1'b0, writeEnable[9],
          1'b0, writeEnable[8], 1'b0, writeEnable[7], 1'b0, writeEnable[6], 1'b0, writeEnable[5],
          1'b0, writeEnable[4], 1'b0, writeEnable[3], 1'b0, writeEnable[2], 1'b0, writeEnable[1],
          1'b0, writeEnable[0]} << mux_address);
        new_data =  ( {1'b0, D_int[127], 1'b0, D_int[126], 1'b0, D_int[125], 1'b0, D_int[124],
          1'b0, D_int[123], 1'b0, D_int[122], 1'b0, D_int[121], 1'b0, D_int[120], 1'b0, D_int[119],
          1'b0, D_int[118], 1'b0, D_int[117], 1'b0, D_int[116], 1'b0, D_int[115], 1'b0, D_int[114],
          1'b0, D_int[113], 1'b0, D_int[112], 1'b0, D_int[111], 1'b0, D_int[110], 1'b0, D_int[109],
          1'b0, D_int[108], 1'b0, D_int[107], 1'b0, D_int[106], 1'b0, D_int[105], 1'b0, D_int[104],
          1'b0, D_int[103], 1'b0, D_int[102], 1'b0, D_int[101], 1'b0, D_int[100], 1'b0, D_int[99],
          1'b0, D_int[98], 1'b0, D_int[97], 1'b0, D_int[96], 1'b0, D_int[95], 1'b0, D_int[94],
          1'b0, D_int[93], 1'b0, D_int[92], 1'b0, D_int[91], 1'b0, D_int[90], 1'b0, D_int[89],
          1'b0, D_int[88], 1'b0, D_int[87], 1'b0, D_int[86], 1'b0, D_int[85], 1'b0, D_int[84],
          1'b0, D_int[83], 1'b0, D_int[82], 1'b0, D_int[81], 1'b0, D_int[80], 1'b0, D_int[79],
          1'b0, D_int[78], 1'b0, D_int[77], 1'b0, D_int[76], 1'b0, D_int[75], 1'b0, D_int[74],
          1'b0, D_int[73], 1'b0, D_int[72], 1'b0, D_int[71], 1'b0, D_int[70], 1'b0, D_int[69],
          1'b0, D_int[68], 1'b0, D_int[67], 1'b0, D_int[66], 1'b0, D_int[65], 1'b0, D_int[64],
          1'b0, D_int[63], 1'b0, D_int[62], 1'b0, D_int[61], 1'b0, D_int[60], 1'b0, D_int[59],
          1'b0, D_int[58], 1'b0, D_int[57], 1'b0, D_int[56], 1'b0, D_int[55], 1'b0, D_int[54],
          1'b0, D_int[53], 1'b0, D_int[52], 1'b0, D_int[51], 1'b0, D_int[50], 1'b0, D_int[49],
          1'b0, D_int[48], 1'b0, D_int[47], 1'b0, D_int[46], 1'b0, D_int[45], 1'b0, D_int[44],
          1'b0, D_int[43], 1'b0, D_int[42], 1'b0, D_int[41], 1'b0, D_int[40], 1'b0, D_int[39],
          1'b0, D_int[38], 1'b0, D_int[37], 1'b0, D_int[36], 1'b0, D_int[35], 1'b0, D_int[34],
          1'b0, D_int[33], 1'b0, D_int[32], 1'b0, D_int[31], 1'b0, D_int[30], 1'b0, D_int[29],
          1'b0, D_int[28], 1'b0, D_int[27], 1'b0, D_int[26], 1'b0, D_int[25], 1'b0, D_int[24],
          1'b0, D_int[23], 1'b0, D_int[22], 1'b0, D_int[21], 1'b0, D_int[20], 1'b0, D_int[19],
          1'b0, D_int[18], 1'b0, D_int[17], 1'b0, D_int[16], 1'b0, D_int[15], 1'b0, D_int[14],
          1'b0, D_int[13], 1'b0, D_int[12], 1'b0, D_int[11], 1'b0, D_int[10], 1'b0, D_int[9],
          1'b0, D_int[8], 1'b0, D_int[7], 1'b0, D_int[6], 1'b0, D_int[5], 1'b0, D_int[4],
          1'b0, D_int[3], 1'b0, D_int[2], 1'b0, D_int[1], 1'b0, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
      end else begin
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[254], data_out[252], data_out[250], data_out[248], data_out[246],
          data_out[244], data_out[242], data_out[240], data_out[238], data_out[236],
          data_out[234], data_out[232], data_out[230], data_out[228], data_out[226],
          data_out[224], data_out[222], data_out[220], data_out[218], data_out[216],
          data_out[214], data_out[212], data_out[210], data_out[208], data_out[206],
          data_out[204], data_out[202], data_out[200], data_out[198], data_out[196],
          data_out[194], data_out[192], data_out[190], data_out[188], data_out[186],
          data_out[184], data_out[182], data_out[180], data_out[178], data_out[176],
          data_out[174], data_out[172], data_out[170], data_out[168], data_out[166],
          data_out[164], data_out[162], data_out[160], data_out[158], data_out[156],
          data_out[154], data_out[152], data_out[150], data_out[148], data_out[146],
          data_out[144], data_out[142], data_out[140], data_out[138], data_out[136],
          data_out[134], data_out[132], data_out[130], data_out[128], data_out[126],
          data_out[124], data_out[122], data_out[120], data_out[118], data_out[116],
          data_out[114], data_out[112], data_out[110], data_out[108], data_out[106],
          data_out[104], data_out[102], data_out[100], data_out[98], data_out[96],
          data_out[94], data_out[92], data_out[90], data_out[88], data_out[86], data_out[84],
          data_out[82], data_out[80], data_out[78], data_out[76], data_out[74], data_out[72],
          data_out[70], data_out[68], data_out[66], data_out[64], data_out[62], data_out[60],
          data_out[58], data_out[56], data_out[54], data_out[52], data_out[50], data_out[48],
          data_out[46], data_out[44], data_out[42], data_out[40], data_out[38], data_out[36],
          data_out[34], data_out[32], data_out[30], data_out[28], data_out[26], data_out[24],
          data_out[22], data_out[20], data_out[18], data_out[16], data_out[14], data_out[12],
          data_out[10], data_out[8], data_out[6], data_out[4], data_out[2], data_out[0]};
      end
      if (GWEN_int !== 1'b1) begin
        Q_int = D_int;
      end else begin
        shifted_readLatch0 = readLatch0;
        Q_int = {shifted_readLatch0[127], shifted_readLatch0[126], shifted_readLatch0[125],
          shifted_readLatch0[124], shifted_readLatch0[123], shifted_readLatch0[122],
          shifted_readLatch0[121], shifted_readLatch0[120], shifted_readLatch0[119],
          shifted_readLatch0[118], shifted_readLatch0[117], shifted_readLatch0[116],
          shifted_readLatch0[115], shifted_readLatch0[114], shifted_readLatch0[113],
          shifted_readLatch0[112], shifted_readLatch0[111], shifted_readLatch0[110],
          shifted_readLatch0[109], shifted_readLatch0[108], shifted_readLatch0[107],
          shifted_readLatch0[106], shifted_readLatch0[105], shifted_readLatch0[104],
          shifted_readLatch0[103], shifted_readLatch0[102], shifted_readLatch0[101],
          shifted_readLatch0[100], shifted_readLatch0[99], shifted_readLatch0[98],
          shifted_readLatch0[97], shifted_readLatch0[96], shifted_readLatch0[95], shifted_readLatch0[94],
          shifted_readLatch0[93], shifted_readLatch0[92], shifted_readLatch0[91], shifted_readLatch0[90],
          shifted_readLatch0[89], shifted_readLatch0[88], shifted_readLatch0[87], shifted_readLatch0[86],
          shifted_readLatch0[85], shifted_readLatch0[84], shifted_readLatch0[83], shifted_readLatch0[82],
          shifted_readLatch0[81], shifted_readLatch0[80], shifted_readLatch0[79], shifted_readLatch0[78],
          shifted_readLatch0[77], shifted_readLatch0[76], shifted_readLatch0[75], shifted_readLatch0[74],
          shifted_readLatch0[73], shifted_readLatch0[72], shifted_readLatch0[71], shifted_readLatch0[70],
          shifted_readLatch0[69], shifted_readLatch0[68], shifted_readLatch0[67], shifted_readLatch0[66],
          shifted_readLatch0[65], shifted_readLatch0[64], shifted_readLatch0[63], shifted_readLatch0[62],
          shifted_readLatch0[61], shifted_readLatch0[60], shifted_readLatch0[59], shifted_readLatch0[58],
          shifted_readLatch0[57], shifted_readLatch0[56], shifted_readLatch0[55], shifted_readLatch0[54],
          shifted_readLatch0[53], shifted_readLatch0[52], shifted_readLatch0[51], shifted_readLatch0[50],
          shifted_readLatch0[49], shifted_readLatch0[48], shifted_readLatch0[47], shifted_readLatch0[46],
          shifted_readLatch0[45], shifted_readLatch0[44], shifted_readLatch0[43], shifted_readLatch0[42],
          shifted_readLatch0[41], shifted_readLatch0[40], shifted_readLatch0[39], shifted_readLatch0[38],
          shifted_readLatch0[37], shifted_readLatch0[36], shifted_readLatch0[35], shifted_readLatch0[34],
          shifted_readLatch0[33], shifted_readLatch0[32], shifted_readLatch0[31], shifted_readLatch0[30],
          shifted_readLatch0[29], shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26],
          shifted_readLatch0[25], shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22],
          shifted_readLatch0[21], shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18],
          shifted_readLatch0[17], shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14],
          shifted_readLatch0[13], shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10],
          shifted_readLatch0[9], shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6],
          shifted_readLatch0[5], shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2],
          shifted_readLatch0[1], shifted_readLatch0[0]};
      end
      if( isBitX(GWEN_int) ) begin
        Q_int = {128{1'bx}};
      end
    end
  end
  endtask
  always @ (CEN_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
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
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (RET1N_ === 1'b0 && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (RET1N_ === 1'b1 && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
      Q_int = {128{1'bx}};
      CEN_int = 1'bx;
      WEN_int = {128{1'bx}};
      A_int = {7{1'bx}};
      D_int = {128{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      GWEN_int = 1'bx;
      RET1N_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st == 1'b1) begin
      pre_charge_st = 0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
        Q_int = {128{1'bx}};
      CEN_int = 1'bx;
      WEN_int = {128{1'bx}};
      A_int = {7{1'bx}};
      D_int = {128{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      GWEN_int = 1'bx;
      RET1N_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end


  always @ CLK_ begin
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
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        Q_int = {128{1'bx}};
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      CEN_int = CEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      RET1N_int = RET1N_;
      if (CEN_int != 1'b1) begin
        WEN_int = WEN_;
        A_int = A_;
        D_int = D_;
        GWEN_int = GWEN_;
      end
      clk0_int = 1'b0;
      CEN_int = CEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      RET1N_int = RET1N_;
      if (CEN_int != 1'b1) begin
        WEN_int = WEN_;
        A_int = A_;
        D_int = D_;
        GWEN_int = GWEN_;
      end
      clk0_int = 1'b0;
    readWrite;
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
    end
  end
    LAST_CLK = CLK_;
  end

  reg globalNotifier0;
  initial globalNotifier0 = 1'b0;

  always @ globalNotifier0 begin
    if ($realtime == 0) begin
    end else if (CEN_int === 1'bx || EMAW_int[0] === 1'bx || EMAW_int[1] === 1'bx || 
      EMA_int[0] === 1'bx || EMA_int[1] === 1'bx || EMA_int[2] === 1'bx || RET1N_int === 1'bx || 
      clk0_int === 1'bx) begin
        Q_int = {128{1'bx}};
      failedWrite(0);
    end else begin
      #0;
      readWrite;
   end
    globalNotifier0 = 1'b0;
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

  always @ NOT_CEN begin
    CEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN127 begin
    WEN_int[127] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN126 begin
    WEN_int[126] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN125 begin
    WEN_int[125] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN124 begin
    WEN_int[124] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN123 begin
    WEN_int[123] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN122 begin
    WEN_int[122] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN121 begin
    WEN_int[121] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN120 begin
    WEN_int[120] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN119 begin
    WEN_int[119] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN118 begin
    WEN_int[118] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN117 begin
    WEN_int[117] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN116 begin
    WEN_int[116] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN115 begin
    WEN_int[115] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN114 begin
    WEN_int[114] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN113 begin
    WEN_int[113] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN112 begin
    WEN_int[112] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN111 begin
    WEN_int[111] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN110 begin
    WEN_int[110] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN109 begin
    WEN_int[109] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN108 begin
    WEN_int[108] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN107 begin
    WEN_int[107] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN106 begin
    WEN_int[106] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN105 begin
    WEN_int[105] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN104 begin
    WEN_int[104] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN103 begin
    WEN_int[103] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN102 begin
    WEN_int[102] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN101 begin
    WEN_int[101] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN100 begin
    WEN_int[100] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN99 begin
    WEN_int[99] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN98 begin
    WEN_int[98] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN97 begin
    WEN_int[97] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN96 begin
    WEN_int[96] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN95 begin
    WEN_int[95] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN94 begin
    WEN_int[94] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN93 begin
    WEN_int[93] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN92 begin
    WEN_int[92] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN91 begin
    WEN_int[91] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN90 begin
    WEN_int[90] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN89 begin
    WEN_int[89] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN88 begin
    WEN_int[88] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN87 begin
    WEN_int[87] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN86 begin
    WEN_int[86] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN85 begin
    WEN_int[85] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN84 begin
    WEN_int[84] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN83 begin
    WEN_int[83] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN82 begin
    WEN_int[82] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN81 begin
    WEN_int[81] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN80 begin
    WEN_int[80] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN79 begin
    WEN_int[79] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN78 begin
    WEN_int[78] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN77 begin
    WEN_int[77] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN76 begin
    WEN_int[76] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN75 begin
    WEN_int[75] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN74 begin
    WEN_int[74] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN73 begin
    WEN_int[73] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN72 begin
    WEN_int[72] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN71 begin
    WEN_int[71] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN70 begin
    WEN_int[70] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN69 begin
    WEN_int[69] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN68 begin
    WEN_int[68] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN67 begin
    WEN_int[67] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN66 begin
    WEN_int[66] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN65 begin
    WEN_int[65] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN64 begin
    WEN_int[64] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN63 begin
    WEN_int[63] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN62 begin
    WEN_int[62] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN61 begin
    WEN_int[61] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN60 begin
    WEN_int[60] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN59 begin
    WEN_int[59] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN58 begin
    WEN_int[58] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN57 begin
    WEN_int[57] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN56 begin
    WEN_int[56] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN55 begin
    WEN_int[55] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN54 begin
    WEN_int[54] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN53 begin
    WEN_int[53] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN52 begin
    WEN_int[52] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN51 begin
    WEN_int[51] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN50 begin
    WEN_int[50] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN49 begin
    WEN_int[49] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN48 begin
    WEN_int[48] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN47 begin
    WEN_int[47] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN46 begin
    WEN_int[46] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN45 begin
    WEN_int[45] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN44 begin
    WEN_int[44] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN43 begin
    WEN_int[43] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN42 begin
    WEN_int[42] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN41 begin
    WEN_int[41] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN40 begin
    WEN_int[40] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN39 begin
    WEN_int[39] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN38 begin
    WEN_int[38] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN37 begin
    WEN_int[37] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN36 begin
    WEN_int[36] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN35 begin
    WEN_int[35] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN34 begin
    WEN_int[34] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN33 begin
    WEN_int[33] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN32 begin
    WEN_int[32] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN31 begin
    WEN_int[31] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN30 begin
    WEN_int[30] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN29 begin
    WEN_int[29] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN28 begin
    WEN_int[28] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN27 begin
    WEN_int[27] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN26 begin
    WEN_int[26] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN25 begin
    WEN_int[25] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN24 begin
    WEN_int[24] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN23 begin
    WEN_int[23] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN22 begin
    WEN_int[22] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN21 begin
    WEN_int[21] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN20 begin
    WEN_int[20] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN19 begin
    WEN_int[19] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN18 begin
    WEN_int[18] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN17 begin
    WEN_int[17] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN16 begin
    WEN_int[16] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN15 begin
    WEN_int[15] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN14 begin
    WEN_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN13 begin
    WEN_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN12 begin
    WEN_int[12] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN11 begin
    WEN_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN10 begin
    WEN_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN9 begin
    WEN_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN8 begin
    WEN_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN7 begin
    WEN_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN6 begin
    WEN_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN5 begin
    WEN_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN4 begin
    WEN_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN3 begin
    WEN_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN2 begin
    WEN_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN1 begin
    WEN_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN0 begin
    WEN_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A6 begin
    A_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A5 begin
    A_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A4 begin
    A_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A3 begin
    A_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A2 begin
    A_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A1 begin
    A_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A0 begin
    A_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D127 begin
    D_int[127] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D126 begin
    D_int[126] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D125 begin
    D_int[125] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D124 begin
    D_int[124] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D123 begin
    D_int[123] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D122 begin
    D_int[122] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D121 begin
    D_int[121] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D120 begin
    D_int[120] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D119 begin
    D_int[119] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D118 begin
    D_int[118] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D117 begin
    D_int[117] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D116 begin
    D_int[116] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D115 begin
    D_int[115] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D114 begin
    D_int[114] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D113 begin
    D_int[113] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D112 begin
    D_int[112] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D111 begin
    D_int[111] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D110 begin
    D_int[110] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D109 begin
    D_int[109] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D108 begin
    D_int[108] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D107 begin
    D_int[107] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D106 begin
    D_int[106] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D105 begin
    D_int[105] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D104 begin
    D_int[104] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D103 begin
    D_int[103] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D102 begin
    D_int[102] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D101 begin
    D_int[101] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D100 begin
    D_int[100] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D99 begin
    D_int[99] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D98 begin
    D_int[98] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D97 begin
    D_int[97] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D96 begin
    D_int[96] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D95 begin
    D_int[95] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D94 begin
    D_int[94] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D93 begin
    D_int[93] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D92 begin
    D_int[92] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D91 begin
    D_int[91] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D90 begin
    D_int[90] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D89 begin
    D_int[89] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D88 begin
    D_int[88] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D87 begin
    D_int[87] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D86 begin
    D_int[86] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D85 begin
    D_int[85] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D84 begin
    D_int[84] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D83 begin
    D_int[83] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D82 begin
    D_int[82] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D81 begin
    D_int[81] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D80 begin
    D_int[80] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D79 begin
    D_int[79] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D78 begin
    D_int[78] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D77 begin
    D_int[77] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D76 begin
    D_int[76] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D75 begin
    D_int[75] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D74 begin
    D_int[74] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D73 begin
    D_int[73] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D72 begin
    D_int[72] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D71 begin
    D_int[71] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D70 begin
    D_int[70] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D69 begin
    D_int[69] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D68 begin
    D_int[68] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D67 begin
    D_int[67] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D66 begin
    D_int[66] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D65 begin
    D_int[65] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D64 begin
    D_int[64] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D63 begin
    D_int[63] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D62 begin
    D_int[62] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D61 begin
    D_int[61] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D60 begin
    D_int[60] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D59 begin
    D_int[59] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D58 begin
    D_int[58] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D57 begin
    D_int[57] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D56 begin
    D_int[56] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D55 begin
    D_int[55] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D54 begin
    D_int[54] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D53 begin
    D_int[53] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D52 begin
    D_int[52] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D51 begin
    D_int[51] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D50 begin
    D_int[50] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D49 begin
    D_int[49] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D48 begin
    D_int[48] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D47 begin
    D_int[47] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D46 begin
    D_int[46] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D45 begin
    D_int[45] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D44 begin
    D_int[44] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D43 begin
    D_int[43] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D42 begin
    D_int[42] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D41 begin
    D_int[41] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D40 begin
    D_int[40] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D39 begin
    D_int[39] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D38 begin
    D_int[38] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D37 begin
    D_int[37] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D36 begin
    D_int[36] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D35 begin
    D_int[35] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D34 begin
    D_int[34] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D33 begin
    D_int[33] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D32 begin
    D_int[32] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D31 begin
    D_int[31] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D30 begin
    D_int[30] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D29 begin
    D_int[29] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D28 begin
    D_int[28] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D27 begin
    D_int[27] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D26 begin
    D_int[26] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D25 begin
    D_int[25] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D24 begin
    D_int[24] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D23 begin
    D_int[23] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D22 begin
    D_int[22] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D21 begin
    D_int[21] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D20 begin
    D_int[20] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D19 begin
    D_int[19] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D18 begin
    D_int[18] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D17 begin
    D_int[17] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D16 begin
    D_int[16] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D15 begin
    D_int[15] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D14 begin
    D_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D13 begin
    D_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D12 begin
    D_int[12] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D11 begin
    D_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D10 begin
    D_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D9 begin
    D_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D8 begin
    D_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D7 begin
    D_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D6 begin
    D_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D5 begin
    D_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D4 begin
    D_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D3 begin
    D_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D2 begin
    D_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D1 begin
    D_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D0 begin
    D_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA2 begin
    EMA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA1 begin
    EMA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA0 begin
    EMA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW1 begin
    EMAW_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW0 begin
    EMAW_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_GWEN begin
    GWEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_RET1N begin
    RET1N_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end

  always @ NOT_CLK_PER begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINH begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINL begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end



  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0, RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0;
  wire RET1Neq1, RET1Neq1aCENeq0aWEN127eq0aGWENeq0, RET1Neq1aCENeq0aWEN126eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN125eq0aGWENeq0, RET1Neq1aCENeq0aWEN124eq0aGWENeq0, RET1Neq1aCENeq0aWEN123eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN122eq0aGWENeq0, RET1Neq1aCENeq0aWEN121eq0aGWENeq0, RET1Neq1aCENeq0aWEN120eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN119eq0aGWENeq0, RET1Neq1aCENeq0aWEN118eq0aGWENeq0, RET1Neq1aCENeq0aWEN117eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN116eq0aGWENeq0, RET1Neq1aCENeq0aWEN115eq0aGWENeq0, RET1Neq1aCENeq0aWEN114eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN113eq0aGWENeq0, RET1Neq1aCENeq0aWEN112eq0aGWENeq0, RET1Neq1aCENeq0aWEN111eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN110eq0aGWENeq0, RET1Neq1aCENeq0aWEN109eq0aGWENeq0, RET1Neq1aCENeq0aWEN108eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN107eq0aGWENeq0, RET1Neq1aCENeq0aWEN106eq0aGWENeq0, RET1Neq1aCENeq0aWEN105eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN104eq0aGWENeq0, RET1Neq1aCENeq0aWEN103eq0aGWENeq0, RET1Neq1aCENeq0aWEN102eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN101eq0aGWENeq0, RET1Neq1aCENeq0aWEN100eq0aGWENeq0, RET1Neq1aCENeq0aWEN99eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN98eq0aGWENeq0, RET1Neq1aCENeq0aWEN97eq0aGWENeq0, RET1Neq1aCENeq0aWEN96eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN95eq0aGWENeq0, RET1Neq1aCENeq0aWEN94eq0aGWENeq0, RET1Neq1aCENeq0aWEN93eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN92eq0aGWENeq0, RET1Neq1aCENeq0aWEN91eq0aGWENeq0, RET1Neq1aCENeq0aWEN90eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN89eq0aGWENeq0, RET1Neq1aCENeq0aWEN88eq0aGWENeq0, RET1Neq1aCENeq0aWEN87eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN86eq0aGWENeq0, RET1Neq1aCENeq0aWEN85eq0aGWENeq0, RET1Neq1aCENeq0aWEN84eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN83eq0aGWENeq0, RET1Neq1aCENeq0aWEN82eq0aGWENeq0, RET1Neq1aCENeq0aWEN81eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN80eq0aGWENeq0, RET1Neq1aCENeq0aWEN79eq0aGWENeq0, RET1Neq1aCENeq0aWEN78eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN77eq0aGWENeq0, RET1Neq1aCENeq0aWEN76eq0aGWENeq0, RET1Neq1aCENeq0aWEN75eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN74eq0aGWENeq0, RET1Neq1aCENeq0aWEN73eq0aGWENeq0, RET1Neq1aCENeq0aWEN72eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN71eq0aGWENeq0, RET1Neq1aCENeq0aWEN70eq0aGWENeq0, RET1Neq1aCENeq0aWEN69eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN68eq0aGWENeq0, RET1Neq1aCENeq0aWEN67eq0aGWENeq0, RET1Neq1aCENeq0aWEN66eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN65eq0aGWENeq0, RET1Neq1aCENeq0aWEN64eq0aGWENeq0, RET1Neq1aCENeq0aWEN63eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN62eq0aGWENeq0, RET1Neq1aCENeq0aWEN61eq0aGWENeq0, RET1Neq1aCENeq0aWEN60eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN59eq0aGWENeq0, RET1Neq1aCENeq0aWEN58eq0aGWENeq0, RET1Neq1aCENeq0aWEN57eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN56eq0aGWENeq0, RET1Neq1aCENeq0aWEN55eq0aGWENeq0, RET1Neq1aCENeq0aWEN54eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN53eq0aGWENeq0, RET1Neq1aCENeq0aWEN52eq0aGWENeq0, RET1Neq1aCENeq0aWEN51eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN50eq0aGWENeq0, RET1Neq1aCENeq0aWEN49eq0aGWENeq0, RET1Neq1aCENeq0aWEN48eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN47eq0aGWENeq0, RET1Neq1aCENeq0aWEN46eq0aGWENeq0, RET1Neq1aCENeq0aWEN45eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN44eq0aGWENeq0, RET1Neq1aCENeq0aWEN43eq0aGWENeq0, RET1Neq1aCENeq0aWEN42eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN41eq0aGWENeq0, RET1Neq1aCENeq0aWEN40eq0aGWENeq0, RET1Neq1aCENeq0aWEN39eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN38eq0aGWENeq0, RET1Neq1aCENeq0aWEN37eq0aGWENeq0, RET1Neq1aCENeq0aWEN36eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN35eq0aGWENeq0, RET1Neq1aCENeq0aWEN34eq0aGWENeq0, RET1Neq1aCENeq0aWEN33eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN32eq0aGWENeq0, RET1Neq1aCENeq0aWEN31eq0aGWENeq0, RET1Neq1aCENeq0aWEN30eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN29eq0aGWENeq0, RET1Neq1aCENeq0aWEN28eq0aGWENeq0, RET1Neq1aCENeq0aWEN27eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN26eq0aGWENeq0, RET1Neq1aCENeq0aWEN25eq0aGWENeq0, RET1Neq1aCENeq0aWEN24eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN23eq0aGWENeq0, RET1Neq1aCENeq0aWEN22eq0aGWENeq0, RET1Neq1aCENeq0aWEN21eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN20eq0aGWENeq0, RET1Neq1aCENeq0aWEN19eq0aGWENeq0, RET1Neq1aCENeq0aWEN18eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN17eq0aGWENeq0, RET1Neq1aCENeq0aWEN16eq0aGWENeq0, RET1Neq1aCENeq0aWEN15eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN14eq0aGWENeq0, RET1Neq1aCENeq0aWEN13eq0aGWENeq0, RET1Neq1aCENeq0aWEN12eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN11eq0aGWENeq0, RET1Neq1aCENeq0aWEN10eq0aGWENeq0, RET1Neq1aCENeq0aWEN9eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN8eq0aGWENeq0, RET1Neq1aCENeq0aWEN7eq0aGWENeq0, RET1Neq1aCENeq0aWEN6eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN5eq0aGWENeq0, RET1Neq1aCENeq0aWEN4eq0aGWENeq0, RET1Neq1aCENeq0aWEN3eq0aGWENeq0;
  wire RET1Neq1aCENeq0aWEN2eq0aGWENeq0, RET1Neq1aCENeq0aWEN1eq0aGWENeq0, RET1Neq1aCENeq0aWEN0eq0aGWENeq0;
  wire RET1Neq1aCENeq0;


  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0 = RET1N && !EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0 = RET1N && !EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0 = RET1N && !EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0 = RET1N && !EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0 = RET1N && !EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0 = RET1N && !EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0 = RET1N && !EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0 = RET1N && !EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0 = RET1N && !EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0 = RET1N && !EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0 = RET1N && !EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0 = RET1N && !EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0 = RET1N && !EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0 = RET1N && !EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0 = RET1N && !EMA[2] && EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0 = RET1N && !EMA[2] && EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0 = RET1N && EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0 = RET1N && EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0 = RET1N && EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0 = RET1N && EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0 = RET1N && EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0 = RET1N && EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0 = RET1N && EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0 = RET1N && EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0 = RET1N && EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0 = RET1N && EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0 = RET1N && EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0 = RET1N && EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0 = RET1N && EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0 = RET1N && EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0 = RET1N && EMA[2] && EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && !CEN;
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0 = RET1N && EMA[2] && EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && !CEN;

  assign RET1Neq1aCENeq0aWEN127eq0aGWENeq0 = RET1N && !CEN && !WEN[127] && !GWEN;
  assign RET1Neq1aCENeq0aWEN126eq0aGWENeq0 = RET1N && !CEN && !WEN[126] && !GWEN;
  assign RET1Neq1aCENeq0aWEN125eq0aGWENeq0 = RET1N && !CEN && !WEN[125] && !GWEN;
  assign RET1Neq1aCENeq0aWEN124eq0aGWENeq0 = RET1N && !CEN && !WEN[124] && !GWEN;
  assign RET1Neq1aCENeq0aWEN123eq0aGWENeq0 = RET1N && !CEN && !WEN[123] && !GWEN;
  assign RET1Neq1aCENeq0aWEN122eq0aGWENeq0 = RET1N && !CEN && !WEN[122] && !GWEN;
  assign RET1Neq1aCENeq0aWEN121eq0aGWENeq0 = RET1N && !CEN && !WEN[121] && !GWEN;
  assign RET1Neq1aCENeq0aWEN120eq0aGWENeq0 = RET1N && !CEN && !WEN[120] && !GWEN;
  assign RET1Neq1aCENeq0aWEN119eq0aGWENeq0 = RET1N && !CEN && !WEN[119] && !GWEN;
  assign RET1Neq1aCENeq0aWEN118eq0aGWENeq0 = RET1N && !CEN && !WEN[118] && !GWEN;
  assign RET1Neq1aCENeq0aWEN117eq0aGWENeq0 = RET1N && !CEN && !WEN[117] && !GWEN;
  assign RET1Neq1aCENeq0aWEN116eq0aGWENeq0 = RET1N && !CEN && !WEN[116] && !GWEN;
  assign RET1Neq1aCENeq0aWEN115eq0aGWENeq0 = RET1N && !CEN && !WEN[115] && !GWEN;
  assign RET1Neq1aCENeq0aWEN114eq0aGWENeq0 = RET1N && !CEN && !WEN[114] && !GWEN;
  assign RET1Neq1aCENeq0aWEN113eq0aGWENeq0 = RET1N && !CEN && !WEN[113] && !GWEN;
  assign RET1Neq1aCENeq0aWEN112eq0aGWENeq0 = RET1N && !CEN && !WEN[112] && !GWEN;
  assign RET1Neq1aCENeq0aWEN111eq0aGWENeq0 = RET1N && !CEN && !WEN[111] && !GWEN;
  assign RET1Neq1aCENeq0aWEN110eq0aGWENeq0 = RET1N && !CEN && !WEN[110] && !GWEN;
  assign RET1Neq1aCENeq0aWEN109eq0aGWENeq0 = RET1N && !CEN && !WEN[109] && !GWEN;
  assign RET1Neq1aCENeq0aWEN108eq0aGWENeq0 = RET1N && !CEN && !WEN[108] && !GWEN;
  assign RET1Neq1aCENeq0aWEN107eq0aGWENeq0 = RET1N && !CEN && !WEN[107] && !GWEN;
  assign RET1Neq1aCENeq0aWEN106eq0aGWENeq0 = RET1N && !CEN && !WEN[106] && !GWEN;
  assign RET1Neq1aCENeq0aWEN105eq0aGWENeq0 = RET1N && !CEN && !WEN[105] && !GWEN;
  assign RET1Neq1aCENeq0aWEN104eq0aGWENeq0 = RET1N && !CEN && !WEN[104] && !GWEN;
  assign RET1Neq1aCENeq0aWEN103eq0aGWENeq0 = RET1N && !CEN && !WEN[103] && !GWEN;
  assign RET1Neq1aCENeq0aWEN102eq0aGWENeq0 = RET1N && !CEN && !WEN[102] && !GWEN;
  assign RET1Neq1aCENeq0aWEN101eq0aGWENeq0 = RET1N && !CEN && !WEN[101] && !GWEN;
  assign RET1Neq1aCENeq0aWEN100eq0aGWENeq0 = RET1N && !CEN && !WEN[100] && !GWEN;
  assign RET1Neq1aCENeq0aWEN99eq0aGWENeq0 = RET1N && !CEN && !WEN[99] && !GWEN;
  assign RET1Neq1aCENeq0aWEN98eq0aGWENeq0 = RET1N && !CEN && !WEN[98] && !GWEN;
  assign RET1Neq1aCENeq0aWEN97eq0aGWENeq0 = RET1N && !CEN && !WEN[97] && !GWEN;
  assign RET1Neq1aCENeq0aWEN96eq0aGWENeq0 = RET1N && !CEN && !WEN[96] && !GWEN;
  assign RET1Neq1aCENeq0aWEN95eq0aGWENeq0 = RET1N && !CEN && !WEN[95] && !GWEN;
  assign RET1Neq1aCENeq0aWEN94eq0aGWENeq0 = RET1N && !CEN && !WEN[94] && !GWEN;
  assign RET1Neq1aCENeq0aWEN93eq0aGWENeq0 = RET1N && !CEN && !WEN[93] && !GWEN;
  assign RET1Neq1aCENeq0aWEN92eq0aGWENeq0 = RET1N && !CEN && !WEN[92] && !GWEN;
  assign RET1Neq1aCENeq0aWEN91eq0aGWENeq0 = RET1N && !CEN && !WEN[91] && !GWEN;
  assign RET1Neq1aCENeq0aWEN90eq0aGWENeq0 = RET1N && !CEN && !WEN[90] && !GWEN;
  assign RET1Neq1aCENeq0aWEN89eq0aGWENeq0 = RET1N && !CEN && !WEN[89] && !GWEN;
  assign RET1Neq1aCENeq0aWEN88eq0aGWENeq0 = RET1N && !CEN && !WEN[88] && !GWEN;
  assign RET1Neq1aCENeq0aWEN87eq0aGWENeq0 = RET1N && !CEN && !WEN[87] && !GWEN;
  assign RET1Neq1aCENeq0aWEN86eq0aGWENeq0 = RET1N && !CEN && !WEN[86] && !GWEN;
  assign RET1Neq1aCENeq0aWEN85eq0aGWENeq0 = RET1N && !CEN && !WEN[85] && !GWEN;
  assign RET1Neq1aCENeq0aWEN84eq0aGWENeq0 = RET1N && !CEN && !WEN[84] && !GWEN;
  assign RET1Neq1aCENeq0aWEN83eq0aGWENeq0 = RET1N && !CEN && !WEN[83] && !GWEN;
  assign RET1Neq1aCENeq0aWEN82eq0aGWENeq0 = RET1N && !CEN && !WEN[82] && !GWEN;
  assign RET1Neq1aCENeq0aWEN81eq0aGWENeq0 = RET1N && !CEN && !WEN[81] && !GWEN;
  assign RET1Neq1aCENeq0aWEN80eq0aGWENeq0 = RET1N && !CEN && !WEN[80] && !GWEN;
  assign RET1Neq1aCENeq0aWEN79eq0aGWENeq0 = RET1N && !CEN && !WEN[79] && !GWEN;
  assign RET1Neq1aCENeq0aWEN78eq0aGWENeq0 = RET1N && !CEN && !WEN[78] && !GWEN;
  assign RET1Neq1aCENeq0aWEN77eq0aGWENeq0 = RET1N && !CEN && !WEN[77] && !GWEN;
  assign RET1Neq1aCENeq0aWEN76eq0aGWENeq0 = RET1N && !CEN && !WEN[76] && !GWEN;
  assign RET1Neq1aCENeq0aWEN75eq0aGWENeq0 = RET1N && !CEN && !WEN[75] && !GWEN;
  assign RET1Neq1aCENeq0aWEN74eq0aGWENeq0 = RET1N && !CEN && !WEN[74] && !GWEN;
  assign RET1Neq1aCENeq0aWEN73eq0aGWENeq0 = RET1N && !CEN && !WEN[73] && !GWEN;
  assign RET1Neq1aCENeq0aWEN72eq0aGWENeq0 = RET1N && !CEN && !WEN[72] && !GWEN;
  assign RET1Neq1aCENeq0aWEN71eq0aGWENeq0 = RET1N && !CEN && !WEN[71] && !GWEN;
  assign RET1Neq1aCENeq0aWEN70eq0aGWENeq0 = RET1N && !CEN && !WEN[70] && !GWEN;
  assign RET1Neq1aCENeq0aWEN69eq0aGWENeq0 = RET1N && !CEN && !WEN[69] && !GWEN;
  assign RET1Neq1aCENeq0aWEN68eq0aGWENeq0 = RET1N && !CEN && !WEN[68] && !GWEN;
  assign RET1Neq1aCENeq0aWEN67eq0aGWENeq0 = RET1N && !CEN && !WEN[67] && !GWEN;
  assign RET1Neq1aCENeq0aWEN66eq0aGWENeq0 = RET1N && !CEN && !WEN[66] && !GWEN;
  assign RET1Neq1aCENeq0aWEN65eq0aGWENeq0 = RET1N && !CEN && !WEN[65] && !GWEN;
  assign RET1Neq1aCENeq0aWEN64eq0aGWENeq0 = RET1N && !CEN && !WEN[64] && !GWEN;
  assign RET1Neq1aCENeq0aWEN63eq0aGWENeq0 = RET1N && !CEN && !WEN[63] && !GWEN;
  assign RET1Neq1aCENeq0aWEN62eq0aGWENeq0 = RET1N && !CEN && !WEN[62] && !GWEN;
  assign RET1Neq1aCENeq0aWEN61eq0aGWENeq0 = RET1N && !CEN && !WEN[61] && !GWEN;
  assign RET1Neq1aCENeq0aWEN60eq0aGWENeq0 = RET1N && !CEN && !WEN[60] && !GWEN;
  assign RET1Neq1aCENeq0aWEN59eq0aGWENeq0 = RET1N && !CEN && !WEN[59] && !GWEN;
  assign RET1Neq1aCENeq0aWEN58eq0aGWENeq0 = RET1N && !CEN && !WEN[58] && !GWEN;
  assign RET1Neq1aCENeq0aWEN57eq0aGWENeq0 = RET1N && !CEN && !WEN[57] && !GWEN;
  assign RET1Neq1aCENeq0aWEN56eq0aGWENeq0 = RET1N && !CEN && !WEN[56] && !GWEN;
  assign RET1Neq1aCENeq0aWEN55eq0aGWENeq0 = RET1N && !CEN && !WEN[55] && !GWEN;
  assign RET1Neq1aCENeq0aWEN54eq0aGWENeq0 = RET1N && !CEN && !WEN[54] && !GWEN;
  assign RET1Neq1aCENeq0aWEN53eq0aGWENeq0 = RET1N && !CEN && !WEN[53] && !GWEN;
  assign RET1Neq1aCENeq0aWEN52eq0aGWENeq0 = RET1N && !CEN && !WEN[52] && !GWEN;
  assign RET1Neq1aCENeq0aWEN51eq0aGWENeq0 = RET1N && !CEN && !WEN[51] && !GWEN;
  assign RET1Neq1aCENeq0aWEN50eq0aGWENeq0 = RET1N && !CEN && !WEN[50] && !GWEN;
  assign RET1Neq1aCENeq0aWEN49eq0aGWENeq0 = RET1N && !CEN && !WEN[49] && !GWEN;
  assign RET1Neq1aCENeq0aWEN48eq0aGWENeq0 = RET1N && !CEN && !WEN[48] && !GWEN;
  assign RET1Neq1aCENeq0aWEN47eq0aGWENeq0 = RET1N && !CEN && !WEN[47] && !GWEN;
  assign RET1Neq1aCENeq0aWEN46eq0aGWENeq0 = RET1N && !CEN && !WEN[46] && !GWEN;
  assign RET1Neq1aCENeq0aWEN45eq0aGWENeq0 = RET1N && !CEN && !WEN[45] && !GWEN;
  assign RET1Neq1aCENeq0aWEN44eq0aGWENeq0 = RET1N && !CEN && !WEN[44] && !GWEN;
  assign RET1Neq1aCENeq0aWEN43eq0aGWENeq0 = RET1N && !CEN && !WEN[43] && !GWEN;
  assign RET1Neq1aCENeq0aWEN42eq0aGWENeq0 = RET1N && !CEN && !WEN[42] && !GWEN;
  assign RET1Neq1aCENeq0aWEN41eq0aGWENeq0 = RET1N && !CEN && !WEN[41] && !GWEN;
  assign RET1Neq1aCENeq0aWEN40eq0aGWENeq0 = RET1N && !CEN && !WEN[40] && !GWEN;
  assign RET1Neq1aCENeq0aWEN39eq0aGWENeq0 = RET1N && !CEN && !WEN[39] && !GWEN;
  assign RET1Neq1aCENeq0aWEN38eq0aGWENeq0 = RET1N && !CEN && !WEN[38] && !GWEN;
  assign RET1Neq1aCENeq0aWEN37eq0aGWENeq0 = RET1N && !CEN && !WEN[37] && !GWEN;
  assign RET1Neq1aCENeq0aWEN36eq0aGWENeq0 = RET1N && !CEN && !WEN[36] && !GWEN;
  assign RET1Neq1aCENeq0aWEN35eq0aGWENeq0 = RET1N && !CEN && !WEN[35] && !GWEN;
  assign RET1Neq1aCENeq0aWEN34eq0aGWENeq0 = RET1N && !CEN && !WEN[34] && !GWEN;
  assign RET1Neq1aCENeq0aWEN33eq0aGWENeq0 = RET1N && !CEN && !WEN[33] && !GWEN;
  assign RET1Neq1aCENeq0aWEN32eq0aGWENeq0 = RET1N && !CEN && !WEN[32] && !GWEN;
  assign RET1Neq1aCENeq0aWEN31eq0aGWENeq0 = RET1N && !CEN && !WEN[31] && !GWEN;
  assign RET1Neq1aCENeq0aWEN30eq0aGWENeq0 = RET1N && !CEN && !WEN[30] && !GWEN;
  assign RET1Neq1aCENeq0aWEN29eq0aGWENeq0 = RET1N && !CEN && !WEN[29] && !GWEN;
  assign RET1Neq1aCENeq0aWEN28eq0aGWENeq0 = RET1N && !CEN && !WEN[28] && !GWEN;
  assign RET1Neq1aCENeq0aWEN27eq0aGWENeq0 = RET1N && !CEN && !WEN[27] && !GWEN;
  assign RET1Neq1aCENeq0aWEN26eq0aGWENeq0 = RET1N && !CEN && !WEN[26] && !GWEN;
  assign RET1Neq1aCENeq0aWEN25eq0aGWENeq0 = RET1N && !CEN && !WEN[25] && !GWEN;
  assign RET1Neq1aCENeq0aWEN24eq0aGWENeq0 = RET1N && !CEN && !WEN[24] && !GWEN;
  assign RET1Neq1aCENeq0aWEN23eq0aGWENeq0 = RET1N && !CEN && !WEN[23] && !GWEN;
  assign RET1Neq1aCENeq0aWEN22eq0aGWENeq0 = RET1N && !CEN && !WEN[22] && !GWEN;
  assign RET1Neq1aCENeq0aWEN21eq0aGWENeq0 = RET1N && !CEN && !WEN[21] && !GWEN;
  assign RET1Neq1aCENeq0aWEN20eq0aGWENeq0 = RET1N && !CEN && !WEN[20] && !GWEN;
  assign RET1Neq1aCENeq0aWEN19eq0aGWENeq0 = RET1N && !CEN && !WEN[19] && !GWEN;
  assign RET1Neq1aCENeq0aWEN18eq0aGWENeq0 = RET1N && !CEN && !WEN[18] && !GWEN;
  assign RET1Neq1aCENeq0aWEN17eq0aGWENeq0 = RET1N && !CEN && !WEN[17] && !GWEN;
  assign RET1Neq1aCENeq0aWEN16eq0aGWENeq0 = RET1N && !CEN && !WEN[16] && !GWEN;
  assign RET1Neq1aCENeq0aWEN15eq0aGWENeq0 = RET1N && !CEN && !WEN[15] && !GWEN;
  assign RET1Neq1aCENeq0aWEN14eq0aGWENeq0 = RET1N && !CEN && !WEN[14] && !GWEN;
  assign RET1Neq1aCENeq0aWEN13eq0aGWENeq0 = RET1N && !CEN && !WEN[13] && !GWEN;
  assign RET1Neq1aCENeq0aWEN12eq0aGWENeq0 = RET1N && !CEN && !WEN[12] && !GWEN;
  assign RET1Neq1aCENeq0aWEN11eq0aGWENeq0 = RET1N && !CEN && !WEN[11] && !GWEN;
  assign RET1Neq1aCENeq0aWEN10eq0aGWENeq0 = RET1N && !CEN && !WEN[10] && !GWEN;
  assign RET1Neq1aCENeq0aWEN9eq0aGWENeq0 = RET1N && !CEN && !WEN[9] && !GWEN;
  assign RET1Neq1aCENeq0aWEN8eq0aGWENeq0 = RET1N && !CEN && !WEN[8] && !GWEN;
  assign RET1Neq1aCENeq0aWEN7eq0aGWENeq0 = RET1N && !CEN && !WEN[7] && !GWEN;
  assign RET1Neq1aCENeq0aWEN6eq0aGWENeq0 = RET1N && !CEN && !WEN[6] && !GWEN;
  assign RET1Neq1aCENeq0aWEN5eq0aGWENeq0 = RET1N && !CEN && !WEN[5] && !GWEN;
  assign RET1Neq1aCENeq0aWEN4eq0aGWENeq0 = RET1N && !CEN && !WEN[4] && !GWEN;
  assign RET1Neq1aCENeq0aWEN3eq0aGWENeq0 = RET1N && !CEN && !WEN[3] && !GWEN;
  assign RET1Neq1aCENeq0aWEN2eq0aGWENeq0 = RET1N && !CEN && !WEN[2] && !GWEN;
  assign RET1Neq1aCENeq0aWEN1eq0aGWENeq0 = RET1N && !CEN && !WEN[1] && !GWEN;
  assign RET1Neq1aCENeq0aWEN0eq0aGWENeq0 = RET1N && !CEN && !WEN[0] && !GWEN;

  assign RET1Neq1 = RET1N;
  assign RET1Neq1aCENeq0 = RET1N && !CEN;

  specify

    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && GWEN == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && GWEN == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[127] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[126] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[125] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[124] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[123] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[122] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[121] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[120] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[119] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[118] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[117] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[116] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[115] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[114] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[113] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[112] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[111] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[110] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[109] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[108] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[107] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[106] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[105] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[104] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[103] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[102] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[101] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[100] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[99] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[98] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[97] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[96] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[95] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[94] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[93] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[92] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[91] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[90] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[89] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[88] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[87] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[86] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[85] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[84] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[83] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[82] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[81] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[80] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[79] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[78] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[77] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[76] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[75] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[74] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[73] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[72] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[71] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[70] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[69] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[68] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[67] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[66] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[65] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[64] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[63] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[62] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[61] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[60] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[59] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[58] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[57] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[56] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[55] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[54] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[53] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[52] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[51] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[50] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[49] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[48] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[47] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[46] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[45] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[44] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[43] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[42] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[41] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[40] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[39] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[38] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[37] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[36] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[35] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[34] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[33] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[32] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && GWEN == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $period(posedge CLK, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `else
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aCENeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `endif


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `else
       $width(posedge CLK &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `endif

    $setuphold(posedge CLK &&& RET1Neq1, posedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN);
    $setuphold(posedge CLK &&& RET1Neq1, negedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[127], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN127);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[126], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN126);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[125], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN125);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[124], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN124);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[123], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN123);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[122], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN122);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[121], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN121);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[120], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN120);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[119], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN119);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[118], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN118);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[117], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN117);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[116], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN116);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[115], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN115);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[114], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN114);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[113], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN113);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[112], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN112);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[111], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN111);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[110], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN110);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[109], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN109);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[108], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN108);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[107], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN107);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[106], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN106);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[105], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN105);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[104], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN104);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[103], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN103);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[102], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN102);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[101], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN101);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[100], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN100);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[99], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN99);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[98], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN98);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[97], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN97);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[96], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN96);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[95], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN95);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[94], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN94);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[93], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN93);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[92], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN92);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[91], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN91);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[90], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN90);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[89], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN89);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[88], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN88);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[87], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN87);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[86], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN86);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[85], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN85);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[84], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN84);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[83], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN83);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[82], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN82);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[81], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN81);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[80], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN80);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[79], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN79);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[78], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN78);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[77], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN77);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[76], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN76);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[75], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN75);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[74], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN74);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[73], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN73);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[72], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN72);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[71], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN71);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[70], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN70);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[69], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN69);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[68], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN68);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[67], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN67);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[66], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN66);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[65], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN65);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[64], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN64);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[63], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN63);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[62], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN62);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[61], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN61);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[60], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN60);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[59], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN59);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[58], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN58);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[57], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN57);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[56], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN56);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[55], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN55);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[54], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN54);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[53], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN53);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[52], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN52);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[51], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN51);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[50], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN50);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[49], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN49);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[48], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN48);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[47], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN47);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[46], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN46);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[45], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN45);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[44], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN44);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[43], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN43);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[42], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN42);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[41], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN41);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[40], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN40);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[39], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN39);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[38], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN38);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[37], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN37);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[36], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN36);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[35], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN35);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[34], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN34);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[33], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN33);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[32], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN32);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN31);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN30);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN29);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN28);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN27);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN26);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN25);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN24);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN23);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN22);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN21);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN20);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN19);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN18);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN17);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN16);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN15);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN14);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN13);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN12);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN11);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN10);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN9);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN8);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge WEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[127], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN127);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[126], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN126);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[125], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN125);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[124], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN124);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[123], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN123);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[122], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN122);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[121], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN121);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[120], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN120);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[119], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN119);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[118], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN118);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[117], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN117);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[116], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN116);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[115], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN115);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[114], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN114);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[113], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN113);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[112], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN112);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[111], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN111);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[110], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN110);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[109], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN109);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[108], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN108);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[107], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN107);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[106], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN106);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[105], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN105);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[104], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN104);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[103], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN103);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[102], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN102);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[101], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN101);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[100], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN100);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[99], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN99);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[98], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN98);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[97], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN97);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[96], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN96);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[95], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN95);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[94], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN94);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[93], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN93);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[92], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN92);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[91], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN91);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[90], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN90);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[89], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN89);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[88], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN88);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[87], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN87);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[86], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN86);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[85], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN85);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[84], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN84);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[83], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN83);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[82], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN82);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[81], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN81);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[80], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN80);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[79], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN79);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[78], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN78);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[77], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN77);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[76], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN76);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[75], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN75);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[74], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN74);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[73], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN73);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[72], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN72);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[71], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN71);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[70], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN70);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[69], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN69);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[68], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN68);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[67], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN67);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[66], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN66);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[65], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN65);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[64], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN64);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[63], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN63);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[62], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN62);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[61], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN61);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[60], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN60);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[59], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN59);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[58], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN58);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[57], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN57);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[56], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN56);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[55], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN55);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[54], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN54);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[53], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN53);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[52], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN52);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[51], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN51);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[50], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN50);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[49], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN49);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[48], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN48);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[47], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN47);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[46], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN46);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[45], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN45);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[44], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN44);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[43], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN43);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[42], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN42);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[41], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN41);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[40], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN40);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[39], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN39);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[38], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN38);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[37], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN37);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[36], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN36);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[35], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN35);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[34], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN34);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[33], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN33);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[32], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN32);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN31);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN30);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN29);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN28);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN27);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN26);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN25);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN24);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN23);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN22);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN21);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN20);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN19);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN18);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN17);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN16);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN15);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN14);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN13);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN12);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN11);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN10);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN9);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN8);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge WEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN127eq0aGWENeq0, posedge D[127], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D127);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN127eq0aGWENeq0, negedge D[127], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D127);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN126eq0aGWENeq0, posedge D[126], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D126);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN126eq0aGWENeq0, negedge D[126], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D126);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN125eq0aGWENeq0, posedge D[125], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D125);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN125eq0aGWENeq0, negedge D[125], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D125);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN124eq0aGWENeq0, posedge D[124], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D124);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN124eq0aGWENeq0, negedge D[124], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D124);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN123eq0aGWENeq0, posedge D[123], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D123);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN123eq0aGWENeq0, negedge D[123], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D123);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN122eq0aGWENeq0, posedge D[122], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D122);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN122eq0aGWENeq0, negedge D[122], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D122);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN121eq0aGWENeq0, posedge D[121], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D121);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN121eq0aGWENeq0, negedge D[121], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D121);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN120eq0aGWENeq0, posedge D[120], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D120);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN120eq0aGWENeq0, negedge D[120], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D120);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN119eq0aGWENeq0, posedge D[119], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D119);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN119eq0aGWENeq0, negedge D[119], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D119);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN118eq0aGWENeq0, posedge D[118], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D118);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN118eq0aGWENeq0, negedge D[118], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D118);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN117eq0aGWENeq0, posedge D[117], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D117);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN117eq0aGWENeq0, negedge D[117], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D117);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN116eq0aGWENeq0, posedge D[116], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D116);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN116eq0aGWENeq0, negedge D[116], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D116);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN115eq0aGWENeq0, posedge D[115], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D115);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN115eq0aGWENeq0, negedge D[115], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D115);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN114eq0aGWENeq0, posedge D[114], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D114);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN114eq0aGWENeq0, negedge D[114], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D114);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN113eq0aGWENeq0, posedge D[113], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D113);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN113eq0aGWENeq0, negedge D[113], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D113);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN112eq0aGWENeq0, posedge D[112], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D112);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN112eq0aGWENeq0, negedge D[112], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D112);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN111eq0aGWENeq0, posedge D[111], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D111);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN111eq0aGWENeq0, negedge D[111], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D111);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN110eq0aGWENeq0, posedge D[110], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D110);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN110eq0aGWENeq0, negedge D[110], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D110);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN109eq0aGWENeq0, posedge D[109], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D109);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN109eq0aGWENeq0, negedge D[109], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D109);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN108eq0aGWENeq0, posedge D[108], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D108);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN108eq0aGWENeq0, negedge D[108], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D108);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN107eq0aGWENeq0, posedge D[107], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D107);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN107eq0aGWENeq0, negedge D[107], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D107);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN106eq0aGWENeq0, posedge D[106], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D106);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN106eq0aGWENeq0, negedge D[106], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D106);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN105eq0aGWENeq0, posedge D[105], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D105);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN105eq0aGWENeq0, negedge D[105], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D105);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN104eq0aGWENeq0, posedge D[104], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D104);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN104eq0aGWENeq0, negedge D[104], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D104);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN103eq0aGWENeq0, posedge D[103], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D103);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN103eq0aGWENeq0, negedge D[103], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D103);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN102eq0aGWENeq0, posedge D[102], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D102);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN102eq0aGWENeq0, negedge D[102], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D102);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN101eq0aGWENeq0, posedge D[101], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D101);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN101eq0aGWENeq0, negedge D[101], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D101);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN100eq0aGWENeq0, posedge D[100], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D100);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN100eq0aGWENeq0, negedge D[100], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D100);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN99eq0aGWENeq0, posedge D[99], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D99);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN99eq0aGWENeq0, negedge D[99], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D99);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN98eq0aGWENeq0, posedge D[98], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D98);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN98eq0aGWENeq0, negedge D[98], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D98);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN97eq0aGWENeq0, posedge D[97], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D97);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN97eq0aGWENeq0, negedge D[97], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D97);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN96eq0aGWENeq0, posedge D[96], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D96);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN96eq0aGWENeq0, negedge D[96], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D96);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN95eq0aGWENeq0, posedge D[95], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D95);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN95eq0aGWENeq0, negedge D[95], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D95);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN94eq0aGWENeq0, posedge D[94], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D94);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN94eq0aGWENeq0, negedge D[94], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D94);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN93eq0aGWENeq0, posedge D[93], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D93);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN93eq0aGWENeq0, negedge D[93], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D93);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN92eq0aGWENeq0, posedge D[92], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D92);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN92eq0aGWENeq0, negedge D[92], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D92);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN91eq0aGWENeq0, posedge D[91], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D91);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN91eq0aGWENeq0, negedge D[91], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D91);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN90eq0aGWENeq0, posedge D[90], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D90);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN90eq0aGWENeq0, negedge D[90], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D90);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN89eq0aGWENeq0, posedge D[89], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D89);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN89eq0aGWENeq0, negedge D[89], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D89);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN88eq0aGWENeq0, posedge D[88], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D88);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN88eq0aGWENeq0, negedge D[88], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D88);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN87eq0aGWENeq0, posedge D[87], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D87);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN87eq0aGWENeq0, negedge D[87], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D87);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN86eq0aGWENeq0, posedge D[86], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D86);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN86eq0aGWENeq0, negedge D[86], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D86);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN85eq0aGWENeq0, posedge D[85], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D85);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN85eq0aGWENeq0, negedge D[85], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D85);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN84eq0aGWENeq0, posedge D[84], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D84);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN84eq0aGWENeq0, negedge D[84], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D84);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN83eq0aGWENeq0, posedge D[83], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D83);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN83eq0aGWENeq0, negedge D[83], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D83);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN82eq0aGWENeq0, posedge D[82], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D82);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN82eq0aGWENeq0, negedge D[82], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D82);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN81eq0aGWENeq0, posedge D[81], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D81);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN81eq0aGWENeq0, negedge D[81], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D81);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN80eq0aGWENeq0, posedge D[80], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D80);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN80eq0aGWENeq0, negedge D[80], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D80);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN79eq0aGWENeq0, posedge D[79], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D79);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN79eq0aGWENeq0, negedge D[79], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D79);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN78eq0aGWENeq0, posedge D[78], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D78);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN78eq0aGWENeq0, negedge D[78], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D78);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN77eq0aGWENeq0, posedge D[77], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D77);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN77eq0aGWENeq0, negedge D[77], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D77);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN76eq0aGWENeq0, posedge D[76], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D76);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN76eq0aGWENeq0, negedge D[76], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D76);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN75eq0aGWENeq0, posedge D[75], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D75);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN75eq0aGWENeq0, negedge D[75], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D75);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN74eq0aGWENeq0, posedge D[74], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D74);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN74eq0aGWENeq0, negedge D[74], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D74);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN73eq0aGWENeq0, posedge D[73], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D73);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN73eq0aGWENeq0, negedge D[73], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D73);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN72eq0aGWENeq0, posedge D[72], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D72);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN72eq0aGWENeq0, negedge D[72], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D72);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN71eq0aGWENeq0, posedge D[71], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D71);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN71eq0aGWENeq0, negedge D[71], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D71);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN70eq0aGWENeq0, posedge D[70], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D70);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN70eq0aGWENeq0, negedge D[70], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D70);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN69eq0aGWENeq0, posedge D[69], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D69);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN69eq0aGWENeq0, negedge D[69], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D69);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN68eq0aGWENeq0, posedge D[68], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D68);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN68eq0aGWENeq0, negedge D[68], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D68);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN67eq0aGWENeq0, posedge D[67], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D67);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN67eq0aGWENeq0, negedge D[67], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D67);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN66eq0aGWENeq0, posedge D[66], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D66);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN66eq0aGWENeq0, negedge D[66], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D66);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN65eq0aGWENeq0, posedge D[65], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D65);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN65eq0aGWENeq0, negedge D[65], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D65);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN64eq0aGWENeq0, posedge D[64], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D64);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN64eq0aGWENeq0, negedge D[64], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D64);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN63eq0aGWENeq0, posedge D[63], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D63);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN63eq0aGWENeq0, negedge D[63], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D63);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN62eq0aGWENeq0, posedge D[62], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D62);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN62eq0aGWENeq0, negedge D[62], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D62);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN61eq0aGWENeq0, posedge D[61], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D61);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN61eq0aGWENeq0, negedge D[61], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D61);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN60eq0aGWENeq0, posedge D[60], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D60);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN60eq0aGWENeq0, negedge D[60], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D60);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN59eq0aGWENeq0, posedge D[59], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D59);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN59eq0aGWENeq0, negedge D[59], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D59);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN58eq0aGWENeq0, posedge D[58], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D58);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN58eq0aGWENeq0, negedge D[58], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D58);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN57eq0aGWENeq0, posedge D[57], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D57);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN57eq0aGWENeq0, negedge D[57], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D57);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN56eq0aGWENeq0, posedge D[56], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D56);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN56eq0aGWENeq0, negedge D[56], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D56);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN55eq0aGWENeq0, posedge D[55], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D55);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN55eq0aGWENeq0, negedge D[55], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D55);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN54eq0aGWENeq0, posedge D[54], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D54);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN54eq0aGWENeq0, negedge D[54], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D54);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN53eq0aGWENeq0, posedge D[53], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D53);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN53eq0aGWENeq0, negedge D[53], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D53);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN52eq0aGWENeq0, posedge D[52], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D52);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN52eq0aGWENeq0, negedge D[52], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D52);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN51eq0aGWENeq0, posedge D[51], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D51);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN51eq0aGWENeq0, negedge D[51], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D51);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN50eq0aGWENeq0, posedge D[50], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D50);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN50eq0aGWENeq0, negedge D[50], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D50);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN49eq0aGWENeq0, posedge D[49], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D49);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN49eq0aGWENeq0, negedge D[49], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D49);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN48eq0aGWENeq0, posedge D[48], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D48);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN48eq0aGWENeq0, negedge D[48], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D48);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN47eq0aGWENeq0, posedge D[47], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D47);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN47eq0aGWENeq0, negedge D[47], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D47);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN46eq0aGWENeq0, posedge D[46], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D46);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN46eq0aGWENeq0, negedge D[46], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D46);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN45eq0aGWENeq0, posedge D[45], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D45);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN45eq0aGWENeq0, negedge D[45], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D45);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN44eq0aGWENeq0, posedge D[44], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D44);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN44eq0aGWENeq0, negedge D[44], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D44);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN43eq0aGWENeq0, posedge D[43], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D43);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN43eq0aGWENeq0, negedge D[43], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D43);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN42eq0aGWENeq0, posedge D[42], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D42);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN42eq0aGWENeq0, negedge D[42], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D42);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN41eq0aGWENeq0, posedge D[41], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D41);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN41eq0aGWENeq0, negedge D[41], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D41);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN40eq0aGWENeq0, posedge D[40], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D40);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN40eq0aGWENeq0, negedge D[40], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D40);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN39eq0aGWENeq0, posedge D[39], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D39);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN39eq0aGWENeq0, negedge D[39], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D39);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN38eq0aGWENeq0, posedge D[38], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D38);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN38eq0aGWENeq0, negedge D[38], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D38);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN37eq0aGWENeq0, posedge D[37], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D37);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN37eq0aGWENeq0, negedge D[37], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D37);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN36eq0aGWENeq0, posedge D[36], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D36);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN36eq0aGWENeq0, negedge D[36], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D36);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN35eq0aGWENeq0, posedge D[35], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D35);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN35eq0aGWENeq0, negedge D[35], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D35);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN34eq0aGWENeq0, posedge D[34], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D34);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN34eq0aGWENeq0, negedge D[34], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D34);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN33eq0aGWENeq0, posedge D[33], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D33);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN33eq0aGWENeq0, negedge D[33], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D33);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN32eq0aGWENeq0, posedge D[32], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D32);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN32eq0aGWENeq0, negedge D[32], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D32);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN31eq0aGWENeq0, posedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN31eq0aGWENeq0, negedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN30eq0aGWENeq0, posedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN30eq0aGWENeq0, negedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN29eq0aGWENeq0, posedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN29eq0aGWENeq0, negedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN28eq0aGWENeq0, posedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN28eq0aGWENeq0, negedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN27eq0aGWENeq0, posedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN27eq0aGWENeq0, negedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN26eq0aGWENeq0, posedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN26eq0aGWENeq0, negedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN25eq0aGWENeq0, posedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN25eq0aGWENeq0, negedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN24eq0aGWENeq0, posedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN24eq0aGWENeq0, negedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN23eq0aGWENeq0, posedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN23eq0aGWENeq0, negedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN22eq0aGWENeq0, posedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN22eq0aGWENeq0, negedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN21eq0aGWENeq0, posedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN21eq0aGWENeq0, negedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN20eq0aGWENeq0, posedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN20eq0aGWENeq0, negedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN19eq0aGWENeq0, posedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN19eq0aGWENeq0, negedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN18eq0aGWENeq0, posedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN18eq0aGWENeq0, negedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN17eq0aGWENeq0, posedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN17eq0aGWENeq0, negedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN16eq0aGWENeq0, posedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN16eq0aGWENeq0, negedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN15eq0aGWENeq0, posedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN15eq0aGWENeq0, negedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN14eq0aGWENeq0, posedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN14eq0aGWENeq0, negedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN13eq0aGWENeq0, posedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN13eq0aGWENeq0, negedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN12eq0aGWENeq0, posedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN12eq0aGWENeq0, negedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN11eq0aGWENeq0, posedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN11eq0aGWENeq0, negedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN10eq0aGWENeq0, posedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN10eq0aGWENeq0, negedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN9eq0aGWENeq0, posedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN9eq0aGWENeq0, negedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN8eq0aGWENeq0, posedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN8eq0aGWENeq0, negedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN7eq0aGWENeq0, posedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN7eq0aGWENeq0, negedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN6eq0aGWENeq0, posedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN6eq0aGWENeq0, negedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN5eq0aGWENeq0, posedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN5eq0aGWENeq0, negedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN4eq0aGWENeq0, posedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN4eq0aGWENeq0, negedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN3eq0aGWENeq0, posedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN3eq0aGWENeq0, negedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN2eq0aGWENeq0, posedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN2eq0aGWENeq0, negedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN1eq0aGWENeq0, posedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN1eq0aGWENeq0, negedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN0eq0aGWENeq0, posedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aWEN0eq0aGWENeq0, negedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN);
    $setuphold(posedge CLK, posedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLK, negedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CEN, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CEN, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
  endspecify


endmodule
`endcelldefine
`endif
`timescale 1ns/1ps
module rfsp128x128_error_injection (Q_out, Q_in, CLK, A, CEN, WEN, GWEN);
   output [127:0] Q_out;
   input [127:0] Q_in;
   input CLK;
   input [6:0] A;
   input CEN;
   input [127:0] WEN;
   input GWEN;
   parameter LEFT_RED_COLUMN_FAULT = 2'd1;
   parameter RIGHT_RED_COLUMN_FAULT = 2'd2;
   parameter NO_RED_FAULT = 2'd0;
   reg [127:0] Q_out;
   reg entry_found;
   reg list_complete;
   reg [18:0] fault_table [63:0];
   reg [18:0] fault_entry;
initial
begin
   `ifdef DUT
      `define pre_pend_path TB.DUT_inst.CHIP
   `else
       `define pre_pend_path TB.CHIP
   `endif
   `ifdef ARM_NONREPAIRABLE_FAULT
      `pre_pend_path.SMARCHCHKBVCD_LVISION_MBISTPG_ASSEMBLY_UNDER_TEST_INST.MEM0_MEM_INST.u1.add_fault(7'd2,7'd70,2'd1,2'd0);
   `endif
end
   task add_fault;
   //This task injects fault in memory
      input [6:0] address;
      input [6:0] bitPlace;
      input [1:0] fault_type;
      input [1:0] red_fault;
 
      integer i;
      reg done;
   begin
      done = 1'b0;
      i = 0;
      while ((!done) && i < 63)
      begin
         fault_entry = fault_table[i];
         if (fault_entry[0] === 1'b0 || fault_entry[0] === 1'bx)
         begin
            fault_entry[0] = 1'b1;
            fault_entry[2:1] = red_fault;
            fault_entry[4:3] = fault_type;
            fault_entry[11:5] = bitPlace;
            fault_entry[18:12] = address;
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
   for (i = 0; i < 64; i=i+1)
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
   inout [127:0] q_int;
   input [1:0] fault_type;
   input [6:0] bitLoc;
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
   output [127:0] Q_output;
   reg list_complete;
   integer i;
   reg [5:0] row_address;
   reg [0:0] column_address;
   reg [6:0] bitPlace;
   reg [1:0] fault_type;
   reg [1:0] red_fault;
   reg valid;
   reg [5:0] msb_bit_calc;
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
            if (row_address == A[6:1] && column_address == A[0:0])
            begin
               if (bitPlace < 64)
                  bit_error(Q_output,fault_type, bitPlace);
               else if (bitPlace >= 64 )
                  bit_error(Q_output,fault_type, bitPlace);
            end
         end
      end
      else
         list_complete = 1'b1;
      end
   end
   endtask
   always @ (Q_in or CLK or A or CEN or WEN or GWEN)
   begin
   if (CEN === 1'b0)
      error_injection_on_output(Q_out);
   else
      Q_out = Q_in;
   end
endmodule
