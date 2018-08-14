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

`timescale 1ns/10ps
`include "DW_axi_x2p_cc_constants.v"

module test_DW_axi_x2p;

  // dut parameters
  parameter aaw = `X2P_AXI_AW;
  parameter adw = `X2P_AXI_DW;
  parameter abe = `X2P_AXI_ENDIANNESS;
  parameter baw = `X2P_APB_ADDR_WIDTH;
  parameter bdw = `X2P_APB_DATA_WIDTH;
  parameter aclk_mode = `X2P_CLK_MODE;

  // tb parameters

  // higher 32 address bits
  parameter bah = 0;

  // AHB bus memory map
  parameter bsa_s1 = (baw == 32) ? `SIM_B_START_ADDR_S1 : {bah,`SIM_B_START_ADDR_S1};
  parameter bea_s1 = (baw == 32) ? `SIM_B_END_ADDR_S1   : {bah,`SIM_B_END_ADDR_S1};
  parameter bsa_s2 = (baw == 32) ? `SIM_B_START_ADDR_S2 : {bah,`SIM_B_START_ADDR_S2};
  parameter bea_s2 = (baw == 32) ? `SIM_B_END_ADDR_S2   : {bah,`SIM_B_END_ADDR_S2};
  parameter bsa_s3 = (baw == 32) ? `SIM_B_START_ADDR_S3 : {bah,`SIM_B_START_ADDR_S3};
  parameter bea_s3 = (baw == 32) ? `SIM_B_END_ADDR_S3   : {bah,`SIM_B_END_ADDR_S3};

 wire a_cactive_m0;

  // primary side bridge inputs
  wire a_hclken;
  wire a_ttick_comb;
  reg a_ttick;
  wire i_a_ttick; // internal
  wire e_a_ttick; // external (vera driven)

  // secondary side bridge inputs
  wire b_hclken;
  wire b_ttick;

  // internal wires vera driven
  wire               force_a_reset;
  wire               force_b_reset;
  wire               force_a_ttick;
  wire               cvrgen;             // trigger coverage checks

  // primary side bridge outputs
  wire               a_flush;

// TODO: delete this
//  reg                a_hresetn_dly1ns;
//  reg                b_hresetn_dly1ns;


  // axi wires
  `include "../testbench/x2p_wires.v"

  // Vera components
  test_DW_axi_x2p_shell vshell(a_hclk);


  // ----------------
  // input generation
  // ----------------
   reg 		     enable_apb_control;    // used to hold off assertion of signals for he VIP

`define RESET_DLY 6
  x2p_clock_gen #(`SIM_A_CLK_PERIOD, `SIM_B_CLK_PERIOD, `RESET_DLY)
    U_clk_gen_0 (.a_hclk(a_hclk),.a_hclk_gated(pclk_gen),
                 .a_hresetn(a_hresetn), .a_hclk_en(1'b1),
                 .b_hclk(b_hclk),.b_hclk_gated(sclk_gen),
                 .b_hresetn(b_hresetn), .b_hclk_en(1'b1));


`ifdef X2P_HAS_LOWPWR_HS_IF
   `ifndef X2P_HAS_LOWPWR_LEGACY_IF
      assign pclk = clklp;
   `else
      assign pclk = pclk_gen;
   `endif
`else
   assign pclk = pclk_gen;
`endif


`ifdef X2P_CLK_MODE_2
   assign       #1 sclk = pclk;
`else
   assign       #1 sclk = sclk_gen;
`endif
 // resets to bith sides must be tied together to assure the FIFO's are
   // reset properly take the longer reset of the two

   assign 	     master_reset_n = (`SIM_A_CLK_PERIOD > `SIM_B_CLK_PERIOD) ? a_hresetn : b_hresetn;

// to the VIP
   assign a_aresetn_m0 = master_reset_n;

   assign pslverr = 1'b0;


   // axi-apb bridge
       // apb Inputs  delay to assure sync with testbench
   wire  [`X2P_APB_DATA_WIDTH-1:0] pwdata;
   wire [31:0]                     paddr;
   wire [15:0]                     psel;
   wire                            penable;


       // apb Outputs
   wire  [`X2P_APB_DATA_WIDTH-1:0] prdata;
   wire  [`X2P_APB_DATA_WIDTH-1:0] prdata_test;
   wire                            pready;
   wire                            perror;



   // axi outputs
   assign     #1 a_awready_m0 = awready_x2p;
   assign     #1 a_arready_m0 = arready_x2p;
   assign     #1 a_rvalid_m0 = rvalid_x2p;
   assign     #1 a_rlast_m0 = rlast_x2p;
   assign     #1 a_rdata_m0 = rdata_x2p;
   assign     #1 a_rresp_m0 = rresp_x2p;
   assign     #1 a_rid_m0 = rid_x2p;
   assign     #1 a_wready_m0 = wready_x2p;
   assign     #1 a_bvalid_m0 = bvalid_x2p;
   assign     #1 a_bresp_m0 = bresp_x2p;
   assign     #1 a_bid_m0 = bid_x2p;

   `ifdef X2P_HAS_LOWPWR_HS_IF
   `ifndef X2P_HAS_LOWPWR_LEGACY_IF
   wire       int_csysreq;
   wire       int_csysack;
   wire       int_cactive;

   assign     #1 int_csysreq = csysreq;
   assign     #1 int_csysack = csysack;
   assign     #1 int_cactive = cactive;
   `endif
   `endif

   // for the VIP conflict during reset
   // allows me to alter the APB reset going to the VIP if needed
   wire   apb_vip_resetn = master_reset_n;

   assign    psel = b_psel;

   // jstokes, 10/3/2010, STAR 9000377785
   // Create new pslverr signals for each slave that can be 1 until pready
   // is asserted and then deassert.
   wire xpslverr_s0;
   wire xpslverr_s1;
   wire xpslverr_s2;
   wire xpslverr_s3;
   wire xpslverr_s4;
   wire xpslverr_s5;
   wire xpslverr_s6;
   wire xpslverr_s7;
   wire xpslverr_s8;
   wire xpslverr_s9;
   wire xpslverr_s10;
   wire xpslverr_s11;
   wire xpslverr_s12;
   wire xpslverr_s13;
   wire xpslverr_s14;
   wire xpslverr_s15;

   assign xpslverr_s0 = pready_s0 ? pslverr_s0 : $random() % 2'b10;
   assign xpslverr_s1 = pready_s1 ? pslverr_s1 : $random() % 2'b10;
   assign xpslverr_s2 = pready_s2 ? pslverr_s2 : $random() % 2'b10;
   assign xpslverr_s3 = pready_s3 ? pslverr_s3 : $random() % 2'b10;
   assign xpslverr_s4 = pready_s4 ? pslverr_s4 : $random() % 2'b10;
   assign xpslverr_s5 = pready_s5 ? pslverr_s5 : $random() % 2'b10;
   assign xpslverr_s6 = pready_s6 ? pslverr_s6 : $random() % 2'b10;
   assign xpslverr_s7 = pready_s7 ? pslverr_s7 : $random() % 2'b10;
   assign xpslverr_s8 = pready_s8 ? pslverr_s8 : $random() % 2'b10;
   assign xpslverr_s9 = pready_s9 ? pslverr_s9 : $random() % 2'b10;
   assign xpslverr_s10 = pready_s10 ? pslverr_s10 : $random() % 2'b10;
   assign xpslverr_s11 = pready_s11 ? pslverr_s11 : $random() % 2'b10;
   assign xpslverr_s12 = pready_s12 ? pslverr_s12 : $random() % 2'b10;
   assign xpslverr_s13 = pready_s13 ? pslverr_s13 : $random() % 2'b10;
   assign xpslverr_s14 = pready_s14 ? pslverr_s14 : $random() % 2'b10;
   assign xpslverr_s15 = pready_s15 ? pslverr_s15 : $random() % 2'b10;

  x32_DW_axi_x2p U_x2p_a
  (
// setup clks when a single clock only use aclk
`ifdef X2P_CLK_MODE_2
    .aclk                (pclk),          // the primary-side clk and reset wired to a_hclk
`else
    .aclk                (pclk),          // the primary-side clk and reset wired to a_hclk
    .pclk                (sclk),
`endif
    // axi Outputs
    .awready             (awready_x2p),
    .arready             (arready_x2p),
    .rvalid              (rvalid_x2p),
    .rlast               (rlast_x2p),
    .rdata               (rdata_x2p),
    .rresp               (rresp_x2p),
    .rid                 (rid_x2p),
    .wready              (wready_x2p),
    .bvalid              (bvalid_x2p),
    .bresp               (bresp_x2p),
    .bid                 (bid_x2p),
    // axi Inputs
    .aresetn             (master_reset_n),       // wired to a_hresetn

    .awvalid             (a_awvalid_m0),
    .awaddr              (a_awaddr_m0),
    .awlen               (a_awlen_m0),
    .awsize              (a_awsize_m0),
    .awburst             (a_awburst_m0),
    .awlock              (a_awlock_m0),
    .awcache             (a_awcache_m0),
    .awprot              (a_awprot_m0),
    .awid                (a_awid_m0),

    .arvalid             (a_arvalid_m0),
    .araddr              (a_araddr_m0),
    .arlen               (a_arlen_m0),
    .arsize              (a_arsize_m0),
    .arburst             (a_arburst_m0),
    .arlock              (a_arlock_m0),
    .arcache             (a_arcache_m0),
    .arprot              (a_arprot_m0),
    .arid                (a_arid_m0),
    .rready              (a_rready_m0),

    .wvalid              (a_wvalid_m0),
    .wlast               (a_wlast_m0),
    .wdata               (a_wdata_m0),
    .wstrb               (a_wstrb_m0[(adw/8)-1:0]),
    .wid                 (a_wid_m0),

    .bready              (a_bready_m0),

`ifdef X2P_HAS_LOWPWR_HS_IF
`ifdef X2P_HAS_LOWPWR_LEGACY_IF
    // Low Power controls (legacy)
    .nopx                (a_bsideband_m0[0]), // sending the bridge activity over on the side band
`else
    // Low Power controls
    .cactive             (cactive),
    .csysreq             (csysreq),
    .csysack             (csysack),
`endif
`endif

    // apb Inputs
`ifndef X2P_CLK_MODE_2
    .presetn             (master_reset_n),
`endif
    .paddr               (b_paddr),
    .pwrite              (b_pwrite),
    .psel_s0             (b_psel[0]),
   `ifdef X2P_HAS_S1
    .psel_s1             (b_psel[1]),
   `endif
   `ifdef X2P_HAS_S2
    .psel_s2             (b_psel[2]),
   `endif
   `ifdef X2P_HAS_S3
    .psel_s3             (b_psel[3]),
   `endif
   `ifdef X2P_HAS_S4
    .psel_s4             (b_psel[4]),
   `endif
   `ifdef X2P_HAS_S5
    .psel_s5             (b_psel[5]),
   `endif
   `ifdef X2P_HAS_S6
    .psel_s6             (b_psel[6]),
   `endif
   `ifdef X2P_HAS_S7
    .psel_s7             (b_psel[7]),
   `endif
   `ifdef X2P_HAS_S8
    .psel_s8             (b_psel[8]),
   `endif
   `ifdef X2P_HAS_S9
    .psel_s9             (b_psel[9]),
   `endif
   `ifdef X2P_HAS_S10
    .psel_s10             (b_psel[10]),
   `endif
   `ifdef X2P_HAS_S11
    .psel_s11             (b_psel[11]),
   `endif
   `ifdef X2P_HAS_S12
    .psel_s12             (b_psel[12]),
   `endif
   `ifdef X2P_HAS_S13
    .psel_s13             (b_psel[13]),
   `endif
   `ifdef X2P_HAS_S14
    .psel_s14             (b_psel[14]),
   `endif
   `ifdef X2P_HAS_S15
    .psel_s15             (b_psel[15]),
   `endif
    .penable             (b_penable),
    .pwdata              (b_pwdata),
   // apb outputs
   `ifdef X2P_HAS_S1
   `ifdef X2P_APB3_S1
    .pready_s1           (pready_s1),
    .pslverr_s1          (xpslverr_s1),
   `endif
    .prdata_s1           (prdata_s1[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S2
   `ifdef X2P_APB3_S2
    .pready_s2           (pready_s2),
    .pslverr_s2          (xpslverr_s2),
   `endif
    .prdata_s2           (prdata_s2[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S3
   `ifdef X2P_APB3_S3
    .pready_s3           (pready_s3),
    .pslverr_s3          (xpslverr_s3),
   `endif
    .prdata_s3           (prdata_s3[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S4
   `ifdef X2P_APB3_S4
    .pready_s4           (pready_s4),
    .pslverr_s4          (xpslverr_s4),
   `endif
    .prdata_s4           (prdata_s4[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S5
   `ifdef X2P_APB3_S5
    .pready_s5           (pready_s5),
    .pslverr_s5          (xpslverr_s5),
   `endif
    .prdata_s5           (prdata_s5[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S6
   `ifdef X2P_APB3_S6
    .pready_s6           (pready_s6),
    .pslverr_s6          (xpslverr_s6),
   `endif
    .prdata_s6           (prdata_s6[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S7
   `ifdef X2P_APB3_S7
    .pready_s7           (pready_s7),
    .pslverr_s7          (xpslverr_s7),
   `endif
    .prdata_s7           (prdata_s7[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S8
   `ifdef X2P_APB3_S8
    .pready_s8           (pready_s8),
    .pslverr_s8          (xpslverr_s8),
   `endif
    .prdata_s8           (prdata_s8[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S9
   `ifdef X2P_APB3_S9
    .pready_s9           (pready_s9),
    .pslverr_s9          (xpslverr_s9),
   `endif
    .prdata_s9           (prdata_s9[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S10
   `ifdef X2P_APB3_S10
    .pready_s10           (pready_s10),
    .pslverr_s10          (xpslverr_s10),
   `endif
    .prdata_s10           (prdata_s10[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S11
   `ifdef X2P_APB3_S11
    .pready_s11           (pready_s11),
    .pslverr_s11          (xpslverr_s11),
   `endif
    .prdata_s11           (prdata_s11[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S12
   `ifdef X2P_APB3_S12
    .pready_s12           (pready_s12),
    .pslverr_s12          (xpslverr_s12),
   `endif
    .prdata_s12           (prdata_s12[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S13
   `ifdef X2P_APB3_S13
    .pready_s13           (pready_s13),
    .pslverr_s13          (xpslverr_s13),
   `endif
    .prdata_s13           (prdata_s13[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S14
   `ifdef X2P_APB3_S14
    .pready_s14           (pready_s14),
    .pslverr_s14          (xpslverr_s14),
   `endif
    .prdata_s14           (prdata_s14[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_HAS_S15
   `ifdef X2P_APB3_S15
    .pready_s15           (pready_s15),
    .pslverr_s15          (xpslverr_s15),
   `endif
    .prdata_s15           (prdata_s15[`X2P_APB_DATA_WIDTH-1:0]),
   `endif

   `ifdef X2P_APB3_S0
    .pready_s0           (pready_s0),
    .pslverr_s0          (xpslverr_s0),
   `endif
    .prdata_s0           (prdata_s0[`X2P_APB_DATA_WIDTH-1:0])
);



  //include low power test unit
  `ifdef X2P_HAS_LOWPWR_HS_IF
  `ifndef X2P_HAS_LOWPWR_LEGACY_IF
     tb_check_lp #(
        1,
        `X2P_LOWPWR_NOPX_CNT,
        0,
        0,
        0,
        0
     )
     U_check_lp (
      .clk            (pclk_gen),
      .clklp          (clklp),
      .resetn         (master_reset_n),
      .cvrgen         (cvrgen),

      .awvalid_m_bus  (a_awvalid_m0),
      .awready_m_bus  (awready_x2p),
      .arvalid_m_bus  (a_arvalid_m0),
      .arready_m_bus  (arready_x2p),
      .wready_m_bus   (wready_x2p),
      .bvalid_m_bus   (bvalid_x2p),
      .bready_m_bus   (a_bready_m0),
      .rvalid_m_bus   (rvalid_x2p),
      .rready_m_bus   (a_rready_m0),
      .rlast_m_bus    (rlast_x2p),

      .csysreq        (int_csysreq),
      .csysack        (int_csysack),
      .cactive        (int_cactive)
     );

  tb_gen_lp U_tb_gen_lp (
     .resetn  (master_reset_n),
     .clk     (pclk_gen),
     .csysack (csysack),
     .cactive (cactive),
     .csysreq (csysreq),
     .clk_lp  (clklp)
  );

  `endif
  `endif



// Pullup the bridge CSYSREQ input, since it takes the Vera
// awhile to get it driven to a non-Z value.

  pullup (a_csysreq_m0);
  pullup (a_cysack_m0);

  // ----------------------------------------
  // configuration wires
  // ----------------------------------------



   // gets rid of the APB monitor complaints about the "z's"
   // during the inactiveperiod befor first access
   // plus the gate level doesn't like z's
   pulldown (pready_s15);
   pulldown (pready_s14);
   pulldown (pready_s13);
   pulldown (pready_s12);
   pulldown (pready_s11);
   pulldown (pready_s10);
   pulldown (pready_s9);
   pulldown (pready_s8);
   pulldown (pready_s7);
   pulldown (pready_s6);
   pulldown (pready_s5);
   pulldown (pready_s4);
   pulldown (pready_s3);
   pulldown (pready_s2);
   pulldown (pready_s1);
   pulldown (pready_s0);
   pulldown (pslverr_s15);
   pulldown (pslverr_s14);
   pulldown (pslverr_s13);
   pulldown (pslverr_s12);
   pulldown (pslverr_s11);
   pulldown (pslverr_s10);
   pulldown (pslverr_s9);
   pulldown (pslverr_s8);
   pulldown (pslverr_s7);
   pulldown (pslverr_s6);
   pulldown (pslverr_s5);
   pulldown (pslverr_s4);
   pulldown (pslverr_s3);
   pulldown (pslverr_s2);
   pulldown (pslverr_s1);
   pulldown (pslverr_s0);



  wire [31:0] sim_a_clk_period = `SIM_A_CLK_PERIOD;
  wire [31:0] sim_b_clk_period = `SIM_B_CLK_PERIOD;



// ----------------------------------------
// dump control
// ----------------------------------------

`ifdef DUMP_DEPTH
   initial begin
      `ifdef VCS
         $vcdpluson(`DUMP_DEPTH, test_DW_axi_x2p);
      `else
         `ifdef DUMP_FILE
         `else
         `define DUMP_FILE "test.vcd"
        `endif
         $dumpfile(`DUMP_FILE);
         $dumpvars(`DUMP_DEPTH, test_DW_axi_x2p);
       `endif
   end // initial begin
`endif //  `ifdef DUMP_DEPTH



// ----------------------------------------
// sdf simulations
// ----------------------------------------
`ifdef SDF_FILE
   initial begin
      $write("About to sdf-annotate the design from %s\n",`SDF_FILE);
      $sdf_annotate(`SDF_FILE, U_x2p_a, , , `SDF_LEVEL);
   end
`endif

//

endmodule // test_DW_axi_x2p

