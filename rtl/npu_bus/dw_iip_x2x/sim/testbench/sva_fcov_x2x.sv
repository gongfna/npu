// =======================================
// Functional coverage for the X2X Bridge
// =======================================

//program sva_fcov(/*AUTOARG*/
module sva_fcov_x2x(/*AUTOARG*/
   // Inputs
   aclk_m, aresetn_m, aclk_s, aresetn_s,
   awvalid_m, awready_m, awid_m, awaddr_m, awlen_m, awsize_m, awburst_m, awlock_m, awsideband_m,
   arvalid_m, arready_m, arid_m, araddr_m, arlen_m, arsize_m, arburst_m, arlock_m, arsideband_m,
   wvalid_m, wready_m, wsideband_m,
   awvalid_s1, awready_s1, awid_s1, awlen_s1, awsize_s1,
   arvalid_s1, arready_s1, arid_s1, arlen_s1, arsize_s1,
   wvalid_s1, wready_s1, wid_s1,
   bvalid_s1, bready_s1, bid_s1, bresp_s1, bsideband_s1,
   rvalid_s1, rready_s1, rid_s1, rresp_s1, rlast_s1, rsideband_s1,
   awvalid_s2, awready_s2, awlen_s2, awsize_s2,
   awvalid_s3, awready_s3, awlen_s3, awsize_s3,
   awvalid_s4, awready_s4, awlen_s4, awsize_s4,
   awvalid_s5, awready_s5, awlen_s5, awsize_s5,
   awvalid_s6, awready_s6, awlen_s6, awsize_s6,
   awvalid_s7, awready_s7, awlen_s7, awsize_s7,
   awvalid_s8, awready_s8, awlen_s8, awsize_s8,
   aw_chf_full, aw_chf_push,
   ar_chf_full, ar_chf_push,
   w_chf_full, w_chf_push,
   b_chf_full, b_chf_push,
   r_chf_full, r_chf_push
   );

   // inputs
   input                   aclk_m;
   input                   aresetn_m;
   input                   aclk_s;
   input                   aresetn_s;
   input                   awvalid_m;
   input                   awready_m;
   input [`X2X_MP_IDW-1:0] awid_m;
   input [`X2X_MP_AW-1:0]  awaddr_m;
   input [`X2X_MP_BLW-1:0] awlen_m;
   input [`X2X_BSW-1:0]    awsize_m;
   input [`X2X_BTW-1:0]    awburst_m;
   input [`X2X_LTW-1:0]    awlock_m;
   input [`X2X_AW_SBW-1:0] awsideband_m;
   input                   arvalid_m;
   input                   arready_m;
   input [`X2X_MP_IDW-1:0] arid_m;
   input [`X2X_MP_AW-1:0]  araddr_m;
   input [`X2X_MP_BLW-1:0] arlen_m;
   input [`X2X_BSW-1:0]    arsize_m;
   input [`X2X_BTW-1:0]    arburst_m;
   input [`X2X_LTW-1:0]    arlock_m;
   input [`X2X_AR_SBW-1:0] arsideband_m;
   input                   wvalid_m;
   input                   wready_m;
   input [`X2X_W_SBW-1:0]  wsideband_m;
   input                   awvalid_s1;
   input                   awready_s1;
   input [`X2X_SP_IDW-1:0] awid_s1;
   input [`X2X_SP_BLW-1:0] awlen_s1;
   input [`X2X_BSW-1:0]    awsize_s1;
   input                   arvalid_s1;
   input                   arready_s1;
   input [`X2X_SP_IDW-1:0] arid_s1;
   input [`X2X_SP_BLW-1:0] arlen_s1;
   input [`X2X_BSW-1:0]    arsize_s1;
   input                   wvalid_s1;
   input                   wready_s1;
   input [`X2X_SP_IDW-1:0] wid_s1;
   input                   bvalid_s1;
   input                   bready_s1;
   input [`X2X_SP_IDW-1:0] bid_s1;
   input [`X2X_BRW-1:0]    bresp_s1;
   input [`X2X_B_SBW-1:0]  bsideband_s1;
   input                   rvalid_s1;
   input                   rready_s1;
   input [`X2X_SP_IDW-1:0] rid_s1;
   input [`X2X_RRW-1:0]    rresp_s1;
   input                   rlast_s1;
   input [`X2X_R_SBW-1:0]  rsideband_s1;
   input                   awvalid_s2;
   input                   awready_s2;
   input [`X2X_SP_BLW-1:0] awlen_s2;
   input [`X2X_BSW-1:0]    awsize_s2;
   input                   awvalid_s3;
   input                   awready_s3;
   input [`X2X_SP_BLW-1:0] awlen_s3;
   input [`X2X_BSW-1:0]    awsize_s3;
   input                   awvalid_s4;
   input                   awready_s4;
   input [`X2X_SP_BLW-1:0] awlen_s4;
   input [`X2X_BSW-1:0]    awsize_s4;
   input                   awvalid_s5;
   input                   awready_s5;
   input [`X2X_SP_BLW-1:0] awlen_s5;
   input [`X2X_BSW-1:0]    awsize_s5;
   input                   awvalid_s6;
   input                   awready_s6;
   input [`X2X_SP_BLW-1:0] awlen_s6;
   input [`X2X_BSW-1:0]    awsize_s6;
   input                   awvalid_s7;
   input                   awready_s7;
   input [`X2X_SP_BLW-1:0] awlen_s7;
   input [`X2X_BSW-1:0]    awsize_s7;
   input                   awvalid_s8;
   input                   awready_s8;
   input [`X2X_SP_BLW-1:0] awlen_s8;
   input [`X2X_BSW-1:0]    awsize_s8;
   input                   aw_chf_full;
   input                   aw_chf_push;
   input                   ar_chf_full;
   input                   ar_chf_push;
   input                   w_chf_full;
   input                   w_chf_push;
   input                   b_chf_full;
   input                   b_chf_push;
   input                   r_chf_full;
   input                   r_chf_push;


// ===============================================================================

   reg prev_r_acpt_s1;
   reg prev_ar_usized;
   reg prev_ar_dsized_multi;
   reg [`X2X_MP_IDW-1:0] prev_arid_m;
   reg [`X2X_MP_IDW-1:0] prev_awid_m;
   reg [`X2X_SP_IDW-1:0] prev_rid_s1;
   reg [`X2X_MP_IDW-1:0] p_ar_btb_id;
   reg [`X2X_MP_IDW-1:0] sync1_p_ar_btb_id;
   reg [`X2X_MP_IDW-1:0] sync2_p_ar_btb_id;
   reg [`X2X_MP_IDW-1:0] prev_p_ar_btb_id;
   reg ar_id_new;
   reg aw_id_new;
   reg r_btb;

   // Max lengths
   wire [7:0] max_awlen_m = awlen_m;
   wire [7:0] max_arlen_m = arlen_m;
   wire [7:0] max_awlen_s1 = awlen_s1;
   wire [7:0] max_arlen_s1 = arlen_s1;
   wire [7:0] max_awlen_s2 = awlen_s2;
   wire [7:0] max_awlen_s3 = awlen_s3;
   wire [7:0] max_awlen_s4 = awlen_s4;
   wire [7:0] max_awlen_s5 = awlen_s5;
   wire [7:0] max_awlen_s6 = awlen_s6;
   wire [7:0] max_awlen_s7 = awlen_s7;
   wire [7:0] max_awlen_s8 = awlen_s8;

   // Address channel transaction accepted
   wire aw_acpt_m  = awvalid_m && awready_m;
   wire ar_acpt_m  = arvalid_m && arready_m;
   wire aw_acpt_s1 = awvalid_s1 && awready_s1;
   wire ar_acpt_s1 = arvalid_s1 && arready_s1;

   // The isunknown function is not supported in VCS 2005.06-SP2
   //wire aw_acpt_s2 = !($isunknown({awvalid_s2, awready_s2})) && (awvalid_s2 && awready_s2);
   //wire aw_acpt_s3 = !($isunknown({awvalid_s3, awready_s3})) && (awvalid_s3 && awready_s3);
   //wire aw_acpt_s4 = !($isunknown({awvalid_s4, awready_s4})) && (awvalid_s4 && awready_s4);
   //wire aw_acpt_s5 = !($isunknown({awvalid_s5, awready_s5})) && (awvalid_s5 && awready_s5);
   //wire aw_acpt_s6 = !($isunknown({awvalid_s6, awready_s6})) && (awvalid_s6 && awready_s6);
   //wire aw_acpt_s7 = !($isunknown({awvalid_s7, awready_s7})) && (awvalid_s7 && awready_s7);
   //wire aw_acpt_s8 = !($isunknown({awvalid_s8, awready_s8})) && (awvalid_s8 && awready_s8);

   wire aw_acpt_s2 = awvalid_s2 && awready_s2;
   wire aw_acpt_s3 = awvalid_s3 && awready_s3;
   wire aw_acpt_s4 = awvalid_s4 && awready_s4;
   wire aw_acpt_s5 = awvalid_s5 && awready_s5;
   wire aw_acpt_s6 = awvalid_s6 && awready_s6;
   wire aw_acpt_s7 = awvalid_s7 && awready_s7;
   wire aw_acpt_s8 = awvalid_s8 && awready_s8;

   wire w_acpt_m = wvalid_m && wready_m;

   wire w_acpt_s1 = wvalid_s1 && wready_s1;
   wire b_acpt_s1 = bvalid_s1 && bready_s1;
   wire r_acpt_s1 = rvalid_s1 && rready_s1;

   // Is the DUT configured to have endian mapping
   wire endian_en = (`X2X_HAS_ET == 1) ? 1'b1 : 1'b0;

   // Maximum length supported by the MP
   wire [`X2X_MP_BLW-1:0] max_len_mp = (`X2X_MP_BLW == 4) ? 4'b1111 : (`X2X_MP_BLW == 5) ? 5'b11111 :
                                       (`X2X_MP_BLW == 6) ? 6'b111111 : (`X2X_MP_BLW == 7) ? 7'b1111111 :
                                       8'b11111111;

   // Maximum length supported by the SP
   wire [`X2X_SP_BLW-1:0] max_len_sp = (`X2X_SP_BLW == 4) ? 4'b1111 : (`X2X_SP_BLW == 5) ? 5'b11111 :
                                       (`X2X_SP_BLW == 6) ? 6'b111111 : (`X2X_SP_BLW == 7) ? 7'b1111111 :
                                       8'b11111111;

   // Address channel size expressed in terms of number of bytes
   wire [7:0] aw_size_m = (awsize_m == 0) ? 1'b1 : (awsize_m == 1) ? 2'b10 :
                          (awsize_m == 2) ? 3'b100 : (awsize_m == 3) ? 4'b1000 : 
                          (awsize_m == 4) ? 5'b10000 : (awsize_m == 5) ? 6'b100000 : 
                          (awsize_m == 6) ? 7'b1000000 : 8'b10000000;

   wire [7:0] ar_size_m = (arsize_m == 0) ? 1'b1 : (arsize_m == 1) ? 2'b10 :
                          (arsize_m == 2) ? 3'b100 : (arsize_m == 3) ? 4'b1000 : 
                          (arsize_m == 4) ? 5'b10000 : (arsize_m == 5) ? 6'b100000 : 
                          (arsize_m == 6) ? 7'b1000000 : 8'b10000000;

   // Is the DUT configured to have downsizing
   wire dsizing_en = ((`X2X_MP_DW > `X2X_SP_DW) || (max_len_mp > max_len_sp)) ? 1'b1 : 1'b0;

   // Downsizing rules
   wire aw_dsized_rule1 = aw_size_m > (`X2X_SP_DW/8);
   wire ar_dsized_rule1 = ar_size_m > (`X2X_SP_DW/8);
   wire aw_dsized_rule2 = awlen_m > max_len_sp;
   wire ar_dsized_rule2 = arlen_m > max_len_sp;

   // Downsized
   wire aw_dsized = (aw_dsized_rule1 || aw_dsized_rule2);
   wire ar_dsized = (ar_dsized_rule1 || ar_dsized_rule2);

   // Non-downsized transaction
   wire aw_nds = !aw_dsized_rule1 && !aw_dsized_rule2;
   wire ar_nds = !ar_dsized_rule1 && !ar_dsized_rule2;

   // Downsized unaligned addresses length (a*len) altering
   // The lsb of the address that is of interest for downsized transactions
   // with unaligned addresses is calculated by log2(X2X_SP_SW)
   wire aw_ds_ua_la = aw_dsized ?
                      ((awsize_m == 3'b110 && `X2X_SP_SW == 32) ? ((awaddr_m[5] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b110 && `X2X_SP_SW == 16) ? ((awaddr_m[5:4] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b110 && `X2X_SP_SW == 8)  ? ((awaddr_m[5:3] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b110 && `X2X_SP_SW == 4)  ? ((awaddr_m[5:2] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b110 && `X2X_SP_SW == 2)  ? ((awaddr_m[5:1] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b110 && `X2X_SP_SW == 1)  ? ((awaddr_m[5:0] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b101 && `X2X_SP_SW == 16) ? ((awaddr_m[4] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b101 && `X2X_SP_SW == 8)  ? ((awaddr_m[4:3] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b101 && `X2X_SP_SW == 4)  ? ((awaddr_m[4:2] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b101 && `X2X_SP_SW == 2)  ? ((awaddr_m[4:1] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b101 && `X2X_SP_SW == 1)  ? ((awaddr_m[4:0] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b100 && `X2X_SP_SW == 8)  ? ((awaddr_m[3] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b100 && `X2X_SP_SW == 4)  ? ((awaddr_m[3:2] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b100 && `X2X_SP_SW == 2)  ? ((awaddr_m[3:1] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b100 && `X2X_SP_SW == 1)  ? ((awaddr_m[3:0] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b011 && `X2X_SP_SW == 4)  ? ((awaddr_m[2] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b011 && `X2X_SP_SW == 2)  ? ((awaddr_m[2:1] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b011 && `X2X_SP_SW == 1)  ? ((awaddr_m[2:0] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b010 && `X2X_SP_SW == 2)  ? ((awaddr_m[1] != 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b010 && `X2X_SP_SW == 1)  ? ((awaddr_m[1:0] != 0) ? 1'b1 : 1'b0) :
                       ((awaddr_m[0] != 0) ? 1'b1 : 1'b0)) : 1'b0;

   wire ar_ds_ua_la = ar_dsized ?
                      ((arsize_m == 3'b110 && `X2X_SP_SW == 32) ? ((araddr_m[5] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b110 && `X2X_SP_SW == 16) ? ((araddr_m[5:4] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b110 && `X2X_SP_SW == 8)  ? ((araddr_m[5:3] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b110 && `X2X_SP_SW == 4)  ? ((araddr_m[5:2] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b110 && `X2X_SP_SW == 2)  ? ((araddr_m[5:1] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b110 && `X2X_SP_SW == 1)  ? ((araddr_m[5:0] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b101 && `X2X_SP_SW == 16) ? ((araddr_m[4] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b101 && `X2X_SP_SW == 8)  ? ((araddr_m[4:3] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b101 && `X2X_SP_SW == 4)  ? ((araddr_m[4:2] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b101 && `X2X_SP_SW == 2)  ? ((araddr_m[4:1] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b101 && `X2X_SP_SW == 1)  ? ((araddr_m[4:0] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b100 && `X2X_SP_SW == 8)  ? ((araddr_m[3] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b100 && `X2X_SP_SW == 4)  ? ((araddr_m[3:2] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b100 && `X2X_SP_SW == 2)  ? ((araddr_m[3:1] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b100 && `X2X_SP_SW == 1)  ? ((araddr_m[3:0] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b011 && `X2X_SP_SW == 4)  ? ((araddr_m[2] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b011 && `X2X_SP_SW == 2)  ? ((araddr_m[2:1] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b011 && `X2X_SP_SW == 1)  ? ((araddr_m[2:0] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b010 && `X2X_SP_SW == 2)  ? ((araddr_m[1] != 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b010 && `X2X_SP_SW == 1)  ? ((araddr_m[1:0] != 0) ? 1'b1 : 1'b0) :
                       ((araddr_m[0] != 0) ? 1'b1 : 1'b0)) : 1'b0;

   // Downsized to multiple transactions
   wire aw_dsized_multi = aw_dsized_rule2 ||
                          (((aw_size_m * (awlen_m + 1)) > (`X2X_SP_SW * (1<<`X2X_SP_BLW))) && !aw_ds_ua_la) ? 1'b1 : 1'b0;
   wire ar_dsized_multi = ar_dsized_rule2 ||
                          (((ar_size_m * (arlen_m + 1)) > (`X2X_SP_SW * (1<<`X2X_SP_BLW))) && !ar_ds_ua_la) ? 1'b1 : 1'b0;

   // Is the DUT configured to have upsizing
   wire usizing_en = (`X2X_HAS_TX_UPSIZE == 1) ? 1'b1 : 1'b0;

   // Upsizing rule 1
   wire aw_us_rule1 = usizing_en ? (((aw_size_m * (awlen_m + 1))%`X2X_SP_SW == 0) ? 1'b1 : 1'b0) : 1'b0;
   wire ar_us_rule1 = usizing_en ? (((ar_size_m * (arlen_m + 1))%`X2X_SP_SW == 0) ? 1'b1 : 1'b0) : 1'b0;

   // Rule 2 (Upsizing Aligned Address): For up sizing to occur there are two
   // rules that must hold true. One of these is that the address must be MP a*size
   // aligned to the SP data width. The msb of the address that is of interest
   // is calculated by log2(X2X_SP_SW)-1.
   wire aw_us_rule2 = usizing_en ?
                      ((awsize_m == 3'b101 && `X2X_SP_SW == 64) ? ((awaddr_m[5] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b100 && `X2X_SP_SW == 64) ? ((awaddr_m[5:4] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b100 && `X2X_SP_SW == 32) ? ((awaddr_m[4] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b011 && `X2X_SP_SW == 64) ? ((awaddr_m[5:3] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b011 && `X2X_SP_SW == 32) ? ((awaddr_m[4:3] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b011 && `X2X_SP_SW == 16) ? ((awaddr_m[3] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b010 && `X2X_SP_SW == 64) ? ((awaddr_m[5:2] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b010 && `X2X_SP_SW == 32) ? ((awaddr_m[4:2] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b010 && `X2X_SP_SW == 16) ? ((awaddr_m[3:2] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b010 && `X2X_SP_SW == 8)  ? ((awaddr_m[2] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b001 && `X2X_SP_SW == 64) ? ((awaddr_m[5:1] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b001 && `X2X_SP_SW == 32) ? ((awaddr_m[4:1] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b001 && `X2X_SP_SW == 16) ? ((awaddr_m[3:1] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b001 && `X2X_SP_SW == 8)  ? ((awaddr_m[2:1] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b001 && `X2X_SP_SW == 4)  ? ((awaddr_m[1] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b000 && `X2X_SP_SW == 64) ? ((awaddr_m[5:0] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b000 && `X2X_SP_SW == 32) ? ((awaddr_m[4:0] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b000 && `X2X_SP_SW == 16) ? ((awaddr_m[3:0] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b000 && `X2X_SP_SW == 8)  ? ((awaddr_m[2:0] == 0) ? 1'b1 : 1'b0) :
                       (awsize_m == 3'b000 && `X2X_SP_SW == 4)  ? ((awaddr_m[1:0] == 0) ? 1'b1 : 1'b0) :
                       ((awaddr_m[0] == 0) ? 1'b1 : 1'b0)) : 1'b0;

   wire ar_us_rule2 = usizing_en ?
                      ((arsize_m == 3'b101 && `X2X_SP_SW == 64) ? ((araddr_m[5] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b100 && `X2X_SP_SW == 64) ? ((araddr_m[5:4] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b100 && `X2X_SP_SW == 32) ? ((araddr_m[4] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b011 && `X2X_SP_SW == 64) ? ((araddr_m[5:3] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b011 && `X2X_SP_SW == 32) ? ((araddr_m[4:3] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b011 && `X2X_SP_SW == 16) ? ((araddr_m[3] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b010 && `X2X_SP_SW == 64) ? ((araddr_m[5:2] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b010 && `X2X_SP_SW == 32) ? ((araddr_m[4:2] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b010 && `X2X_SP_SW == 16) ? ((araddr_m[3:2] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b010 && `X2X_SP_SW == 8)  ? ((araddr_m[2] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b001 && `X2X_SP_SW == 64) ? ((araddr_m[5:1] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b001 && `X2X_SP_SW == 32) ? ((araddr_m[4:1] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b001 && `X2X_SP_SW == 16) ? ((araddr_m[3:1] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b001 && `X2X_SP_SW == 8)  ? ((araddr_m[2:1] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b001 && `X2X_SP_SW == 4)  ? ((araddr_m[1] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b000 && `X2X_SP_SW == 64) ? ((araddr_m[5:0] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b000 && `X2X_SP_SW == 32) ? ((araddr_m[4:0] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b000 && `X2X_SP_SW == 16) ? ((araddr_m[3:0] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b000 && `X2X_SP_SW == 8)  ? ((araddr_m[2:0] == 0) ? 1'b1 : 1'b0) :
                       (arsize_m == 3'b000 && `X2X_SP_SW == 4)  ? ((araddr_m[1:0] == 0) ? 1'b1 : 1'b0) :
                       ((araddr_m[0] == 0) ? 1'b1 : 1'b0)) : 1'b0;

   wire aw_usized = aw_us_rule1 && aw_us_rule2;
   wire ar_usized = ar_us_rule1 && ar_us_rule2;

   // Upsizing and downsizing 
   wire aw_us_ds = aw_usized && aw_dsized_rule2;
   wire ar_us_ds = ar_usized && ar_dsized_rule2;

   wire aw_us_ua = usizing_en ?
                   ((awsize_m == 3'b101)  ? ((awaddr_m[4:0] != 0) ? 1'b1 : 1'b0) :
                    (awsize_m == 3'b100)  ? ((awaddr_m[3:0] != 0) ? 1'b1 : 1'b0) :
                    (awsize_m == 3'b011)  ? ((awaddr_m[2:0] != 0) ? 1'b1 : 1'b0) :
                    (awsize_m == 3'b010)  ? ((awaddr_m[1:0] != 0) ? 1'b1 : 1'b0) :
                    ((awaddr_m[0] != 0) ? 1'b1 : 1'b0)) : 1'b0;

   wire ar_us_ua = usizing_en ?
                   ((arsize_m == 3'b101)  ? ((araddr_m[4:0] != 0) ? 1'b1 : 1'b0) :
                    (arsize_m == 3'b100)  ? ((araddr_m[3:0] != 0) ? 1'b1 : 1'b0) :
                    (arsize_m == 3'b011)  ? ((araddr_m[2:0] != 0) ? 1'b1 : 1'b0) :
                    (arsize_m == 3'b010)  ? ((araddr_m[1:0] != 0) ? 1'b1 : 1'b0) :
                    ((araddr_m[0] != 0) ? 1'b1 : 1'b0)) : 1'b0;

   // Back-to-back transfers on the SP read data channel
   always @(posedge aclk_s) begin
     if((rid_s1 == prev_rid_s1) && ((r_acpt_s1 == 1'b1) && (prev_r_acpt_s1 == 1'b1))) 
       begin
         r_btb <= 1'b1;
       end
     else
       begin
         r_btb = 1'b0;
       end
   end

   // Transaction on the MP that exceeds 4KB, but not greater than 8KB
   wire aw_exceed_4k = (((aw_size_m * (awlen_m + 1)) > 4096) && ((aw_size_m * (awlen_m + 1)) <= 8192)) ? 1'b1 : 1'b0;
   wire ar_exceed_4k = (((ar_size_m * (arlen_m + 1)) > 4096) && ((ar_size_m * (arlen_m + 1)) <= 8192)) ? 1'b1 : 1'b0;

   // Transaction on the MP that exceeds 8KB
   wire aw_exceed_8k = ((aw_size_m * (awlen_m + 1)) > 8192) ? 1'b1 : 1'b0;
   wire ar_exceed_8k = ((ar_size_m * (arlen_m + 1)) > 8192) ? 1'b1 : 1'b0;

   // WRAP boundary
   wire [14:0] aw_wrap_bound = aw_size_m * (awlen_m + 1);
   wire [14:0] ar_wrap_bound = ar_size_m * (arlen_m + 1);

   // Number of bits of the address that are of interest for calculating 
   // whether or not the address is aligned to the given wrap boundary
   wire aw_num_bits = (aw_wrap_bound == 1) ? 0     : (aw_wrap_bound == 2) ? 1     : (aw_wrap_bound <= 4) ? 2 :
                      (aw_wrap_bound <= 8) ? 3     : (aw_wrap_bound <= 16) ? 4    : (aw_wrap_bound <= 32) ? 5 :
                      (aw_wrap_bound <= 64) ? 6    : (aw_wrap_bound <= 128) ? 7   : (aw_wrap_bound <= 256) ? 8 :
                      (aw_wrap_bound <= 512) ? 9   : (aw_wrap_bound <= 1024) ? 10 : (aw_wrap_bound <= 2048) ? 11 :
                      (aw_wrap_bound <= 4096) ? 12 : (aw_wrap_bound <= 8192) ? 13 : 14;

   wire ar_num_bits = (ar_wrap_bound == 1) ? 0     : (ar_wrap_bound == 2) ? 1     : (ar_wrap_bound <= 4) ? 2 :
                      (ar_wrap_bound <= 8) ? 3     : (ar_wrap_bound <= 16) ? 4    : (ar_wrap_bound <= 32) ? 5 :
                      (ar_wrap_bound <= 64) ? 6    : (ar_wrap_bound <= 128) ? 7   : (ar_wrap_bound <= 256) ? 8 :
                      (ar_wrap_bound <= 512) ? 9   : (ar_wrap_bound <= 1024) ? 10 : (ar_wrap_bound <= 2048) ? 11 :
                      (ar_wrap_bound <= 4096) ? 12 : (ar_wrap_bound <= 8192) ? 13 : 14;

   wire [`X2X_MP_AW-1:0] aw_mask = {`X2X_MP_AW{1'b1}} << aw_num_bits;
   wire [`X2X_MP_AW-1:0] ar_mask = {`X2X_MP_AW{1'b1}} << ar_num_bits;

   // Address aligned to the wrap boundary
   wire aw_aa_wb = (|(awaddr_m & (~aw_mask)) == 0) ? 1'b1 : 1'b0;
   wire ar_aa_wb = (|(araddr_m & (~ar_mask)) == 0) ? 1'b1 : 1'b0;

   // Error response on the SP
   wire b_err = (b_acpt_s1 && ((bresp_s1 == 2'b10) || (bresp_s1 == 2'b11))) ? 1'b1 : 1'b0;
   wire r_err = (r_acpt_s1 && ((rresp_s1 == 2'b10) || (rresp_s1 == 2'b11))) ? 1'b1 : 1'b0;
   
   //wire curr_p_ar_btb_id = `X2X_CLK_MODE ? sync2_p_ar_btb_id : p_ar_btb_id;
   
   // Note: Ignoring different clock configs for now
   wire [`X2X_MP_IDW-1:0] curr_arid_m = arid_m;
   wire [`X2X_MP_IDW-1:0] curr_awid_m = awid_m;

   // previous value registers
   always @(posedge aclk_s) begin
     prev_r_acpt_s1 <= r_acpt_s1;
     prev_rid_s1 <= rid_s1;
     prev_arid_m <= curr_arid_m;
     prev_awid_m <= curr_awid_m;
     prev_ar_usized <= ar_usized;
     prev_ar_dsized_multi <= ar_dsized_multi;
     sync1_p_ar_btb_id <= p_ar_btb_id;
     sync2_p_ar_btb_id <= sync1_p_ar_btb_id;
     //prev_p_ar_btb_id <= curr_p_ar_btb_id;
   end

   //wire new_ar_btb_id = (curr_p_ar_btb_id != prev_p_ar_btb_id) ? 1'b1 : 1'b0;
   wire new_arid_m = (curr_arid_m != prev_arid_m) ? 1'b1 : 1'b0;
   wire new_awid_m = (curr_awid_m != prev_awid_m) ? 1'b1 : 1'b0;

   integer rd_id_q[$];
   integer wr_id_q[$];

   // Track the active read transactions on the SP
   always @(posedge aclk_s) begin
     integer i;
     
     // When a SP read transaction is accepted 
     // store the ID in the Q
     if(ar_acpt_s1) begin
       rd_id_q.push_front(arid_s1);
     end

     // When a SP read transaction completes
     // remove it from the Q
     if(r_acpt_s1 && rlast_s1) begin
       
       // Search from the end of the Q for a matching id
       for(i=rd_id_q.size()-1; i>=0; i--) begin
         if(rd_id_q[i] == rid_s1) begin
           rd_id_q.delete(i);
           i = -1; break;
         end
       end

       // Detect no matching id
       if(i != -1) begin
         $display("[%0d] ERROR : No matching id %0d", $time, arid_s1);
       end
     end
   end

   always @(posedge aclk_s) begin
     integer j;

     if(new_arid_m) begin

       // Search from the end of the Q for a matching id
       for(j=rd_id_q.size()-1; j>=0; j--) begin
         if(rd_id_q[j] == curr_arid_m) begin
           ar_id_new <= 1'b0; break;
         end else begin
           ar_id_new <= 1'b1; break;
         end
       end
     end else begin
       ar_id_new <= 1'b0;
     end     
   end

   // Track the active write transactions on the SP
   always @(posedge aclk_s) begin
     integer i;
     
     // When a SP write transaction is accepted 
     // store the ID in the Q
     if(aw_acpt_s1) begin
       wr_id_q.push_front(awid_s1);
     end

     // When a SP write transaction completes
     // remove it from the Q
     if(b_acpt_s1) begin
       
       // Search from the end of the Q for a matching id
       for(i=wr_id_q.size()-1; i>=0; i--) begin
         if(wr_id_q[i] == bid_s1) begin
           wr_id_q.delete(i);
           i = -1; break;
         end
       end

       // Detect no matching id
       if(i != -1) begin
         $display("[%0d] ERROR : No matching id %0d", $time, bid_s1);
       end
     end
   end

   always @(posedge aclk_s) begin
     integer j;

     if(new_awid_m) begin

       // Search from the end of the Q for a matching id
       for(j=wr_id_q.size()-1; j>=0; j--) begin
         if(wr_id_q[j] == curr_awid_m) begin
           aw_id_new <= 1'b0; break;
         end else begin
           aw_id_new <= 1'b1; break;
         end
       end
     end else begin
       aw_id_new <= 1'b0;
     end     
   end

   // Active data on the respective channels
   wire aw_sband_act = (`X2X_HAS_AWSB) ? ((awsideband_m != 0) ? 1'b1 : 1'b0) : 1'b0;
   wire ar_sband_act = (`X2X_HAS_ARSB) ? ((arsideband_m != 0) ? 1'b1 : 1'b0) : 1'b0;
   wire w_sband_act  = (`X2X_HAS_WSB)  ? ((wsideband_m != 0) ? 1'b1 : 1'b0) : 1'b0;
   wire b_sband_act  = (`X2X_HAS_BSB)  ? ((bsideband_s1 != 0) ? 1'b1 : 1'b0) : 1'b0;
   wire r_sband_act  = (`X2X_HAS_RSB)  ? ((rsideband_s1 != 0) ? 1'b1 : 1'b0) : 1'b0;

   // Attempt to push to the channel FIFO's when full (overflow attempt)
   wire aw_chf_of_atmpt = aw_chf_full &&  !aw_chf_push;
   wire ar_chf_of_atmpt = ar_chf_full && !ar_chf_push;
   wire w_chf_of_atmpt = w_chf_full&& !w_chf_push;
   wire b_chf_of_atmpt = b_chf_full && !b_chf_push;
   wire r_chf_of_atmpt = r_chf_full && !r_chf_push;

// ===============================================================================
  
// ====================================
// Functional coverage points
// ====================================

// ------------------------------------------
// Transactions in a non-resizing and 
// non-endian mapping configuration (Num 1).
// Transaction lengths upto 256 (Num 2).
// All transaction sizes and the cross
// coverage between them (Num 43).
// ------------------------------------------

   // Coverage group definition
   covergroup CG_EXT_PROT_M @(posedge aclk_m);

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted. (Num 1). UT = unaltered transaction.
     coverpoint aw_acpt_m iff(aresetn_m && (!dsizing_en && !usizing_en && !endian_en))
     {
       bins UT [] = { 1 }; // Include all bins
     }
     coverpoint ar_acpt_m iff(aresetn_m && (!dsizing_en && !usizing_en && !endian_en))
     {
       bins UT [] = { 1 }; // Include all bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted. (Num 2).
     coverpoint max_awlen_m iff(aresetn_m && aw_acpt_m)
     {
       //bins LEN[] = { [0:255] }; // Include all bins
       bins LEN[] = { [0:15] }; // FIXME: As BLW is not greater than 4
     }
     coverpoint max_arlen_m iff(aresetn_m && ar_acpt_m)
     {
       //bins LEN[] = { [0:255] }; // Include all bins
       bins LEN[] = { [0:15] }; // FIXME: As BLW is not greater than 4
     }

     coverpoint awsize_m iff(aresetn_m && aw_acpt_m)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     coverpoint arsize_m iff(aresetn_m && ar_acpt_m)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }

     // Cross coverage for length and size on the write channel
     cross_length_size_wr : cross max_awlen_m, awsize_m;

     // Cross coverage for length and size on the read channel
     cross_length_size_rd : cross max_arlen_m, arsize_m;
   endgroup
  
   covergroup CG_EXT_PROT_S @(posedge aclk_s);
     coverpoint max_awlen_s1 iff(aresetn_s && aw_acpt_s1)     
     {
       //bins LEN[] = { [0:255] }; // Include all bins
       bins LEN[] = { [0:15] }; // FIXME: As BLW is not greater than 4
     }
     coverpoint max_arlen_s1 iff(aresetn_s && ar_acpt_s1)     
     {
       //bins LEN[] = { [0:255] }; // Include all bins
       bins LEN[] = { [0:15] }; // FIXME: As BLW is not greater than 4
     }

     // FIXME: As write interleave fan out is not configured
     /*
     coverpoint max_awlen_s2 iff(aresetn_s && aw_acpt_s2)     
     {
       bins LEN[] = { [0:255] }; // Include all bins
     }
     coverpoint max_awlen_s3 iff(aresetn_s && aw_acpt_s3)     
     {
       bins LEN[] = { [0:255] }; // Include all bins
     }
     coverpoint max_awlen_s4 iff(aresetn_s && aw_acpt_s4)     
     {
       bins LEN[] = { [0:255] }; // Include all bins
     }
     coverpoint max_awlen_s5 iff(aresetn_s && aw_acpt_s5)     
     {
       bins LEN[] = { [0:255] }; // Include all bins
     }
     coverpoint max_awlen_s6 iff(aresetn_s && aw_acpt_s6)     
     {
       bins LEN[] = { [0:255] }; // Include all bins
     }
     coverpoint max_awlen_s7 iff(aresetn_s && aw_acpt_s7)     
     {
       bins LEN[] = { [0:255] }; // Include all bins
     }
     coverpoint max_awlen_s8 iff(aresetn_s && aw_acpt_s8)     
     {
       bins LEN[] = { [0:255] }; // Include all bins
     }
     */

     coverpoint awsize_s1 iff(aresetn_s && aw_acpt_s1)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     coverpoint arsize_s1 iff(aresetn_s && ar_acpt_s1)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }

     // FIXME: As write interleave fan out is not configured
     /*
     coverpoint awsize_s2 iff(aresetn_s && aw_acpt_s2)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     coverpoint awsize_s3 iff(aresetn_s && aw_acpt_s3)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     coverpoint awsize_s4 iff(aresetn_s && aw_acpt_s4)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     coverpoint awsize_s5 iff(aresetn_s && aw_acpt_s5)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     coverpoint awsize_s6 iff(aresetn_s && aw_acpt_s6)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     coverpoint awsize_s7 iff(aresetn_s && aw_acpt_s7)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     coverpoint awsize_s8 iff(aresetn_s && aw_acpt_s8)
     {
       bins SIZE[] = { [0:6] }; // Include all bins
     }
     */

     // Cross coverage for length and size on the write channel
     cross_length_size_wr_s1 : cross max_awlen_s1, awsize_s1;

     // Cross coverage for length and size on the read channel
     cross_length_size_rd_s1 : cross max_arlen_s1, arsize_s1;

     // FIXME: As write interleave fan out is not configured
     /*
     // Cross coverage for length and size on the write channel
     cross_length_size_wr_s2 : cross max_awlen_s2, awsize_s2;

     // Cross coverage for length and size on the write channel
     cross_length_size_wr_s3 : cross max_awlen_s3, awsize_s3;

     // Cross coverage for length and size on the write channel
     cross_length_size_wr_s4 : cross max_awlen_s4, awsize_s4;

     // Cross coverage for length and size on the write channel
     cross_length_size_wr_s5 : cross max_awlen_s5, awsize_s5;

     // Cross coverage for length and size on the write channel
     cross_length_size_wr_s6 : cross max_awlen_s6, awsize_s6;

     // Cross coverage for length and size on the write channel
     cross_length_size_wr_s7 : cross max_awlen_s7, awsize_s7;

     // Cross coverage for length and size on the write channel
     cross_length_size_wr_s8 : cross max_awlen_s8, awsize_s8;
     */
   endgroup

   // Coverage group instantiation
   CG_EXT_PROT_M cg_ext_prot_m = new;
   CG_EXT_PROT_S cg_ext_prot_s = new;


// -----------------------------------------
// Down sizing for reads and writes for rule
// 1, rule 2 and rule1 && rule 2. For all
// burst types (Num 5-7).
// Down sized unaligned addresses length 
// (a*len) altering and non-length altering
// transactions (Num 8 & 9).
// -----------------------------------------
 
   // Coverage group definition
   covergroup CG_DSIZING @(posedge aclk_m);

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted.
     coverpoint aw_dsized_rule1 iff(aresetn_m && aw_acpt_m)
     {
       bins DSIZE1[] = { 0,1 }; // Include bins
     }
     coverpoint ar_dsized_rule1 iff(aresetn_m && ar_acpt_m)
     {
       bins DSIZE1[] = { 0,1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted.
     coverpoint aw_dsized_rule2 iff(aresetn_m && aw_acpt_m)
     {
       //bins DSIZE2[] = { 0,1 }; // Include bins
       bins DSIZE2[] = { 0 }; // FIXME: As BLW is not greater than 4
     }
     coverpoint ar_dsized_rule2 iff(aresetn_m && ar_acpt_m)
     {
       //bins DSIZE2[] = { 0,1 }; // Include bins
       bins DSIZE2[] = { 0 }; // FIXME: As BLW is not greater than 4
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m and a*_dsized_rule1 or a*_dsized_rule2 asserted.
     coverpoint aw_ds_ua_la iff(aresetn_m && aw_acpt_m && aw_dsized)
     {
       bins DS_UA_LA[] = { 0,1 }; // Include bins
     }
     coverpoint ar_ds_ua_la iff(aresetn_m && ar_acpt_m && ar_dsized)
     {
       bins DS_UA_LA[] = { 0,1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted 
     coverpoint awburst_m iff(aresetn_m && aw_acpt_m)
     {
       bins BURST[] = { 0,1,2 }; // Include only relevant bins
     }
     coverpoint arburst_m iff(aresetn_m && ar_acpt_m)
     {
       bins BURST[] = { 0,1,2 }; // Include only relevant bins
     }

     // Cross coverage for rule 1, rule 2 and burst type on the write channel
     cross_aw_ds_r1_r2_bt : cross aw_dsized_rule1, aw_dsized_rule2, awburst_m;

     // Cross coverage for rule 1, rule 2 and burst type on the read channel
     cross_ar_ds_r1_r2_bt : cross ar_dsized_rule1, ar_dsized_rule2, arburst_m;

     // Cross coverage for downsized unaligned addresses length (a*len)
     // altering and burst type on the write channel
     cross_aw_ds_ua_la_bt : cross aw_ds_ua_la, awburst_m;

     // Cross coverage for downsized unaligned addresses length (a*len)
     // altering and burst type on the read channel
     cross_ar_ds_ua_la_bt : cross ar_ds_ua_la, arburst_m;
   endgroup

   // Coverage group instantiation
   CG_DSIZING cg_downsizing = new;


// --------------------------------------------
// Up sizing for reads and writes. For all
// burst types (Num 10).
// Up sizing and down sizing together (Num 11).
// Back-to-back read transfers on the SP for
// an upsized transaction (Num 14).
// --------------------------------------------

   // 1. Property definition (for Num 14)
   // FIXME: This CP is not valid for multi-clock configs.
   property p_ar_btb_s;
     logic data; 
     logic [`X2X_MP_IDW-1:0] arid;

/*
     (@(posedge aclk_m)

       // Up sized transaction on the MP read address channel
       //(ar_usized, arid = arid_m)
       (ar_usized, arid = arid_m, p_ar_btb_id_copy(arid))

       ##1 @(posedge aclk_s) (rid_s1 == arid)
        //##2 (ar_id_new, $display("RID not seen before on SP @ %0d", $time))
      
       // Back-to-back reads on the SP read data channel.
       // Note, this may need to be extended to take into
       // account write interleave fan out channels.
       //##1 (rid_s1 == arid) [*1:$]
       // ##1 ((r_btb && (rid_s1 == arid)) [*1:100], data = 1, p_ar_btb_s_copy(data))
     );
*/
     (@(posedge aclk_s)

       ((prev_ar_usized && ar_id_new), arid = prev_arid_m)

         // Back-to-back reads on the SP read data channel.
         // Note, this may need to be extended to take into
         // account write interleave fan out channels.
         ##[1:$] ((rid_s1 == arid && r_btb), data = 1, p_ar_btb_s_copy(data))
     );

   endproperty


   // 2. coverage activation
   cov_ar_btb_s : cover property(p_ar_btb_s);

   // 3. global variables
   logic p_ar_btb_s_data = 0;

   // 4. copy local variables to global variables
   task p_ar_btb_s_copy(input logic data);
     p_ar_btb_s_data = data;
//    $display("%b", p_dir_cmd_d2_data);
   endtask

   always @(posedge aclk_s) begin
     if(p_ar_btb_s_data) begin
       p_ar_btb_s_copy(0);
     end
   end
 
   // Coverage group definition
   covergroup CG_USIZING @(posedge aclk_m);

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and upsizing is configured.
     coverpoint aw_usized iff(aresetn_m && aw_acpt_m && usizing_en)
     {
       bins USIZE[] = { 0,1 }; // Include bins
     }
     coverpoint ar_usized iff(aresetn_m && ar_acpt_m && usizing_en)
     {
       bins USIZE[] = { 0,1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and upsizing is configured.
     coverpoint aw_us_ds iff(aresetn_m && aw_acpt_m && usizing_en)
     {
       //bins US_DS[] = { 0,1 }; // Include bins
       bins US_DS[] = { 0 }; // FIXME: As BLW is not greater than 4
     }
     coverpoint ar_us_ds iff(aresetn_m && ar_acpt_m && usizing_en)
     {
       //bins US_DS[] = { 0,1 }; // Include bins
       bins US_DS[] = { 0 }; // FIXME: As BLW is not greater than 4
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and upsizing is configured.
     coverpoint aw_us_ua iff(aresetn_m && aw_acpt_m && usizing_en)
     {
       bins US_UA[] = { 0,1 }; // Include bins
     }
     coverpoint ar_us_ua iff(aresetn_m && ar_acpt_m && usizing_en)
     {
       bins US_UA[] = { 0,1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // upsizing is configured.
     coverpoint p_ar_btb_s_data iff(aresetn_m && usizing_en && (`X2X_CLK_MODE == 0))
     {
       bins US_BTBR[] = { 1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted 
     coverpoint awburst_m iff(aresetn_m && aw_acpt_m)
     {
       bins BURST[] = { 0,1,2 }; // Include only relevant bins
     }
     coverpoint arburst_m iff(aresetn_m && ar_acpt_m)
     {
       bins BURST[] = { 0,1,2 }; // Include only relevant bins
     }

     // Cross coverage for upsizing, unaligned addresses and burst type
     // on the write channel
     cross_aw_us_bt : cross aw_usized, aw_us_ua, awburst_m;

     // Cross coverage for upsizing, unaligned addresses and burst type
     // on the read channel
     cross_ar_us_bt : cross ar_usized, ar_us_ua, arburst_m;

     // Cross coverage for upsizing with downsizing and burst type on
     // the write channel
     cross_aw_us_ds_bt : cross aw_us_ds, awburst_m;

     // Cross coverage for upsizing with downsizing and burst type on 
     // the read channel
     cross_ar_us_ds_bt : cross ar_us_ds, arburst_m;
   endgroup

   // Coverage group instantiation
   CG_USIZING cg_upsizing = new;


   // -----------------------------------------------
   // Transactions that exceed 4KB for reads and
   // writes (Num15).
   // Transactions that exceed 8KB for reads and
   // writes (Num16).
   // Non-downsizing wrap for read and writes
   // when downsizing not configured (Num 17).
   // Non-downsizing wrap for read and writes
   // when downsizing is configured (Num 18).
   // Non-downsizing wrap that are not aligned to
   // the wrap boundary, for read and writes (Num 19).
   // Non-downsizing wrap that are aligned to the
   // wrap boundary, for read and writes (Num 20).
   // -----------------------------------------------

   // Coverage group definition
   covergroup CG_TYPES @(posedge aclk_m);

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted. (Num 15).
     coverpoint aw_exceed_4k iff(aresetn_m && aw_acpt_m)
     {
       //bins EX_4KB[] = { 0,1 }; // Include bins
       bins EX_4KB[] = { 0 }; // FIXME: As BLW is not greater than 4
     }
     coverpoint ar_exceed_4k iff(aresetn_m && ar_acpt_m)
     {
       //bins EX_4KB[] = { 0,1 }; // Include bins
       bins EX_4KB[] = { 0 }; // FIXME: As BLW is not greater than 4
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted. (Num 16).
     coverpoint aw_exceed_8k iff(aresetn_m && aw_acpt_m)
     {
       //bins EX_8KB[] = { 0,1 }; // Include bins
       bins EX_8KB[] = { 0 }; // FIXME: As BLW is not greater than 4
     }
     coverpoint ar_exceed_8k iff(aresetn_m && ar_acpt_m)
     {
       //bins EX_8KB[] = { 0,1 }; // Include bins
       bins EX_8KB[] = { 0 }; // FIXME: As BLW is not greater than 4
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and burst type is WRAP. (Num 17/18).
     coverpoint aw_nds iff(aresetn_m && aw_acpt_m && (awburst_m == 2'b10))
     {
       bins NDSW[] = { 1 }; // Include bins
     }
     coverpoint ar_nds iff(aresetn_m && ar_acpt_m && (arburst_m == 2'b10))
     {
       bins NDSW[] = { 1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and non-downsized WRAP burst. (Num 19/20).
     coverpoint aw_aa_wb iff(aresetn_m && aw_acpt_m && aw_nds && (awburst_m == 2'b10))
     {
       bins AA_WB[] = { 0,1 }; // Include bins
     }
     coverpoint ar_aa_wb iff(aresetn_m && ar_acpt_m && ar_nds && (arburst_m == 2'b10))
     {
       bins AA_WB[] = { 0,1 }; // Include bins
     }

     // Cross coverage for non-downsized and downsising enable on
     // the write channel. (Num 17/18).
     cross_aw_nds_ds_en : cross aw_nds, dsizing_en;

     // Cross coverage for non-downsized and downsising enable on
     // the read channel. (Num 17/18).
     cross_ar_nds_ds_en : cross ar_nds, dsizing_en;
   endgroup

   // Coverage group instantiation
   CG_TYPES cg_types = new;


   // -----------------------------------------------
   // Exclusive access downsized transactions. This
   // refers to transactions that will be downsized
   // to multiple transactions (Num 26).
   // Exclusive access downsized transactions that
   // will not be downsized to multiple transactions
   // (Num 27).
   // Exclusive access non-downsized transactions
   // (Num 28).
   // Exclusive access upsized transactions (Num 29).
   // -----------------------------------------------

   // Coverage group definition
   covergroup CG_ATOMIC @(posedge aclk_m);

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted.
     coverpoint awlock_m iff(aresetn_m && aw_acpt_m)
     {
       bins EXCL[] = { 1 }; // Include bins
     }
     coverpoint arlock_m iff(aresetn_m && ar_acpt_m)
     {
       bins EXCL[] = { 1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and it is an Exclusive access. (Num 26 & 27).
     //coverpoint aw_dsized_rule2  iff(aresetn_m && aw_acpt_m && (awlock_m == 2'b01))
     coverpoint aw_dsized_multi iff(aresetn_m && aw_acpt_m && (awlock_m == 2'b01))
     {
       bins EX_DS[] = { 0,1 }; // Include bins
     }
     //coverpoint ar_dsized_rule2 iff(aresetn_m && ar_acpt_m && (arlock_m == 2'b01))
     coverpoint ar_dsized_multi iff(aresetn_m && ar_acpt_m && (arlock_m == 2'b01))
     {
       bins EX_DS[] = { 0,1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and it is an Exclusive access. (Num 27).
     //coverpoint aw_dsized_rule1 iff(aresetn_m && aw_acpt_m && (awlock_m == 2'b01))
     //{
     //  bins EX_DS1[] = { 1 }; // Include bins
     //}
     //coverpoint ar_dsized_rule1 iff(aresetn_m && ar_acpt_m && (arlock_m == 2'b01))
     //{
     //  bins EX_DS1[] = { 1 }; // Include bins
     //}

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and it is an Exclusive access. (Num 28).
     coverpoint aw_nds iff(aresetn_m && aw_acpt_m && (awlock_m == 2'b01))
     {
       bins EX_NDS[] = { 1 }; // Include bins
     }
     coverpoint ar_nds iff(aresetn_m && ar_acpt_m && (arlock_m == 2'b01))
     {
       bins EX_NDS[] = { 1 }; // Include bins
     }

     // Collect coverage outside of reset, count increments only when
     // a*_acpt_m asserted and it is an Exclusive access. (Num 29).
     //coverpoint aw_usized iff(aresetn_m && aw_acpt_m && (awlock_m == 2'b01))
     //{
     //  bins EX_US[] = { 1 }; // Include bins
     //}
     //coverpoint ar_usized iff(aresetn_m && ar_acpt_m && (arlock_m == 2'b01))
     //{
     //  bins EX_US[] = { 1 }; // Include bins
     //}

     // Cross coverage for upsizing with atomic accesses 
     // the write channel. (Num 29).
     cross_aw_us_atom : cross aw_usized, awlock_m;

     // Cross coverage for upsizing with atomic accesses 
     // the read channel
     cross_ar_us_atom : cross ar_usized, arlock_m;
   endgroup

   // Coverage group instantiation
   CG_ATOMIC cg_atomic = new;


   // -----------------------------------------------
   // .
   // -----------------------------------------------
/*
   // 1. Property definition (for Num 30)
   // FIXME: This CP is not valid for multi-clock configs.
   property p_r_err_s1;
     logic data; 
     logic [`X2X_MP_IDW-1:0] arid;
     (@(posedge aclk_s)

       // Down sized transaction on the MP read address channel
       ((prev_ar_dsized_multi && ar_id_new), arid = prev_arid_m)
      
       // Error response on the SP
       ##1 (((r_err && (rid_s1 == arid)) || ds_trans_comp) [*1:$], data = 1, p_r_err_s1_copy(data))
     );
   endproperty

   // 2. coverage activation
   cov_r_err_s1 : cover property(p_r_err_s1);

   // 3. global variables
   logic p_r_err_s1_data;

   // 4. copy local variables to global variables
   task p_r_err_s1_copy(input logic data);
     p_r_err_s1_data = data;
   endtask

   // Coverage group definition
   covergroup CG_RESP @(posedge aclk_s);

     // Collect coverage outside of reset.
     coverpoint p_r_err_s1_data iff(aresetn_s && (`X2X_CLK_MODE == 0))
     {
       bins ERR_RESP[] = { 1 }; // Include bins
     }

     //coverpoint p_b_err_s1_data iff(aresetn_s && (`X2X_CLK_MODE == 0))
     //{
     //  bins ERR_RESP[] = { 1 }; // Include bins
     //}
   endgroup

   // Coverage group instantiation
   CG_ERR_RESP cg_err_resp = new;
*/


   // -----------------------------------------------
   // Traffic has occured on all side band signals
   // (Num 35).
   // -----------------------------------------------

   // Coverage group definition
   covergroup CG_SIDEBAND_M @(posedge aclk_m);

     // Collect coverage outside of reset.
     coverpoint aw_sband_act iff(aresetn_m && aw_acpt_m)
     {
       bins SBAND[] = { 1 }; // Include bins
     }

     coverpoint ar_sband_act iff(aresetn_m && ar_acpt_m)
     {
       bins SBAND[] = { 1 }; // Include bins
     }

     coverpoint w_sband_act iff(aresetn_m && w_acpt_m)
     {
       bins SBAND[] = { 1 }; // Include bins
     }
   endgroup

   // FIXME: Note for completeness the burst response
   // sideband signals must also be covered for all write
   // interleave triplets for fan out configurations
   covergroup CG_SIDEBAND_S @(posedge aclk_s);

     // Collect coverage outside of reset.
     coverpoint r_sband_act iff(aresetn_s && r_acpt_s1)
     {
       bins SBAND[] = { 1 }; // Include bins
     }

     coverpoint b_sband_act iff(aresetn_s && b_acpt_s1)
     {
       bins SBAND[] = { 1 }; // Include bins
     }
   endgroup

   // Coverage group instantiation
   CG_SIDEBAND_M cg_sideband_m = new;
   CG_SIDEBAND_S cg_sideband_s = new;


   // -----------------------------------------------
   // Occurance of reset, in both clock domains if
   // applicable (Num 39).
   // -----------------------------------------------

   // Coverage group definition
   covergroup CG_RESET_M @(posedge aclk_m);

     // Collect coverage.
     coverpoint aresetn_m
     {
       bins RST[] = { 0 }; // Include bins
     }
   endgroup

   covergroup CG_RESET_S @(posedge aclk_s);

     // Collect coverage.
     coverpoint aresetn_s
     {
       bins RST[] = { 0 }; // Include bins
     }
   endgroup

   // Coverage group instantiation
   CG_RESET_M cg_reset_m = new;
   CG_RESET_S cg_reset_s = new;


   // -----------------------------------------------
   // FIFO's full and push attempted (overflow 
   // attempted) (Num 42). Note, resize information
   // FIFOs to be covered.
   // -----------------------------------------------

   // Coverage group definition
   covergroup CG_FIFO_M @(posedge aclk_m);

     // Collect coverage.
     coverpoint aw_chf_of_atmpt iff(aresetn_m)
     {
       bins FIFO_OF[] = { 1 }; // Include bins
     }

     coverpoint ar_chf_of_atmpt iff(aresetn_m)
     {
       bins FIFO_OF[] = { 1 }; // Include bins
     }

     coverpoint w_chf_of_atmpt iff(aresetn_m)
     {
       bins FIFO_OF[] = { 1 }; // Include bins
     }
   endgroup

   covergroup CG_FIFO_S @(posedge aclk_s);

     // Collect coverage.
     coverpoint b_chf_of_atmpt iff(aresetn_s)
     {
       bins FIFO_OF[] = { 1 }; // Include bins
     }

     coverpoint r_chf_of_atmpt iff(aresetn_s)
     {
       bins FIFO_OF[] = { 1 }; // Include bins
     }
   endgroup

   // Coverage group instantiation
   CG_FIFO_M cg_fifo_m = new;
   CG_FIFO_S cg_fifo_s = new;

endmodule
