
// Checks the ARB_TYPE parameters in all instantiations of the DW_axi_arb
// module to check if they match the relevant AXI_*_ARB_TYPE_* parameter.
reg found_error = 0;
initial
begin
#5

 `ifdef AXI_HAS_S0 

    `ifdef AXI_S0_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S0) begin
         $display("ERROR: ARB_TYPE parameter in SP 0, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S0); found_error=1;
       end
    `endif


    `ifdef AXI_S0_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S0) begin
         $display("ERROR: ARB_TYPE parameter in SP 0, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S0); found_error=1;
       end
    `endif


    `ifdef AXI_S0_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S0) begin
        $display("ERROR: ARB_TYPE parameter in SP 0, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S0); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S1 

    `ifdef AXI_S1_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S1) begin
         $display("ERROR: ARB_TYPE parameter in SP 1, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S1); found_error=1;
       end
    `endif


    `ifdef AXI_S1_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S1) begin
         $display("ERROR: ARB_TYPE parameter in SP 1, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S1); found_error=1;
       end
    `endif


    `ifdef AXI_S1_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S1) begin
        $display("ERROR: ARB_TYPE parameter in SP 1, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S1); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S2 

    `ifdef AXI_S2_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S2) begin
         $display("ERROR: ARB_TYPE parameter in SP 2, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S2); found_error=1;
       end
    `endif


    `ifdef AXI_S2_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S2) begin
         $display("ERROR: ARB_TYPE parameter in SP 2, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S2); found_error=1;
       end
    `endif


    `ifdef AXI_S2_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S2) begin
        $display("ERROR: ARB_TYPE parameter in SP 2, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S2); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S3 

    `ifdef AXI_S3_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S3) begin
         $display("ERROR: ARB_TYPE parameter in SP 3, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S3); found_error=1;
       end
    `endif


    `ifdef AXI_S3_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S3) begin
         $display("ERROR: ARB_TYPE parameter in SP 3, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S3); found_error=1;
       end
    `endif


    `ifdef AXI_S3_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S3) begin
        $display("ERROR: ARB_TYPE parameter in SP 3, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S3); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S4 

    `ifdef AXI_S4_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S4) begin
         $display("ERROR: ARB_TYPE parameter in SP 4, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S4); found_error=1;
       end
    `endif


    `ifdef AXI_S4_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S4) begin
         $display("ERROR: ARB_TYPE parameter in SP 4, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S4); found_error=1;
       end
    `endif


    `ifdef AXI_S4_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S4) begin
        $display("ERROR: ARB_TYPE parameter in SP 4, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S4); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S5 

    `ifdef AXI_S5_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S5) begin
         $display("ERROR: ARB_TYPE parameter in SP 5, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S5); found_error=1;
       end
    `endif


    `ifdef AXI_S5_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S5) begin
         $display("ERROR: ARB_TYPE parameter in SP 5, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S5); found_error=1;
       end
    `endif


    `ifdef AXI_S5_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S5) begin
        $display("ERROR: ARB_TYPE parameter in SP 5, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S5); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S6 

    `ifdef AXI_S6_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S6) begin
         $display("ERROR: ARB_TYPE parameter in SP 6, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S6); found_error=1;
       end
    `endif


    `ifdef AXI_S6_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S6) begin
         $display("ERROR: ARB_TYPE parameter in SP 6, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S6); found_error=1;
       end
    `endif


    `ifdef AXI_S6_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S6) begin
        $display("ERROR: ARB_TYPE parameter in SP 6, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S6); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S7 

    `ifdef AXI_S7_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S7) begin
         $display("ERROR: ARB_TYPE parameter in SP 7, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S7); found_error=1;
       end
    `endif


    `ifdef AXI_S7_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S7) begin
         $display("ERROR: ARB_TYPE parameter in SP 7, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S7); found_error=1;
       end
    `endif


    `ifdef AXI_S7_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S7) begin
        $display("ERROR: ARB_TYPE parameter in SP 7, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S7); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S8 

    `ifdef AXI_S8_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S8) begin
         $display("ERROR: ARB_TYPE parameter in SP 8, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S8); found_error=1;
       end
    `endif


    `ifdef AXI_S8_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S8) begin
         $display("ERROR: ARB_TYPE parameter in SP 8, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S8); found_error=1;
       end
    `endif


    `ifdef AXI_S8_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S8) begin
        $display("ERROR: ARB_TYPE parameter in SP 8, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S8); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S9 

    `ifdef AXI_S9_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S9) begin
         $display("ERROR: ARB_TYPE parameter in SP 9, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S9); found_error=1;
       end
    `endif


    `ifdef AXI_S9_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S9) begin
         $display("ERROR: ARB_TYPE parameter in SP 9, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S9); found_error=1;
       end
    `endif


    `ifdef AXI_S9_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S9) begin
        $display("ERROR: ARB_TYPE parameter in SP 9, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S9); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S10 

    `ifdef AXI_S10_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S10) begin
         $display("ERROR: ARB_TYPE parameter in SP 10, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S10); found_error=1;
       end
    `endif


    `ifdef AXI_S10_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S10) begin
         $display("ERROR: ARB_TYPE parameter in SP 10, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S10); found_error=1;
       end
    `endif


    `ifdef AXI_S10_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S10) begin
        $display("ERROR: ARB_TYPE parameter in SP 10, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S10); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S11 

    `ifdef AXI_S11_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S11) begin
         $display("ERROR: ARB_TYPE parameter in SP 11, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S11); found_error=1;
       end
    `endif


    `ifdef AXI_S11_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S11) begin
         $display("ERROR: ARB_TYPE parameter in SP 11, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S11); found_error=1;
       end
    `endif


    `ifdef AXI_S11_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S11) begin
        $display("ERROR: ARB_TYPE parameter in SP 11, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S11); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S12 

    `ifdef AXI_S12_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S12) begin
         $display("ERROR: ARB_TYPE parameter in SP 12, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S12); found_error=1;
       end
    `endif


    `ifdef AXI_S12_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S12) begin
         $display("ERROR: ARB_TYPE parameter in SP 12, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S12); found_error=1;
       end
    `endif


    `ifdef AXI_S12_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S12) begin
        $display("ERROR: ARB_TYPE parameter in SP 12, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S12); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S13 

    `ifdef AXI_S13_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S13) begin
         $display("ERROR: ARB_TYPE parameter in SP 13, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S13); found_error=1;
       end
    `endif


    `ifdef AXI_S13_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S13) begin
         $display("ERROR: ARB_TYPE parameter in SP 13, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S13); found_error=1;
       end
    `endif


    `ifdef AXI_S13_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S13) begin
        $display("ERROR: ARB_TYPE parameter in SP 13, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S13); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S14 

    `ifdef AXI_S14_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S14) begin
         $display("ERROR: ARB_TYPE parameter in SP 14, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S14); found_error=1;
       end
    `endif


    `ifdef AXI_S14_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S14) begin
         $display("ERROR: ARB_TYPE parameter in SP 14, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S14); found_error=1;
       end
    `endif


    `ifdef AXI_S14_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S14) begin
        $display("ERROR: ARB_TYPE parameter in SP 14, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S14); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S15 

    `ifdef AXI_S15_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S15) begin
         $display("ERROR: ARB_TYPE parameter in SP 15, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S15); found_error=1;
       end
    `endif


    `ifdef AXI_S15_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S15) begin
         $display("ERROR: ARB_TYPE parameter in SP 15, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S15); found_error=1;
       end
    `endif


    `ifdef AXI_S15_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S15) begin
        $display("ERROR: ARB_TYPE parameter in SP 15, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S15); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_S16 

    `ifdef AXI_S16_ON_AR_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_ARB_TYPE_S16) begin
         $display("ERROR: ARB_TYPE parameter in SP 16, AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.gen_ar_addrch.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_ARB_TYPE_S16); found_error=1;
       end
    `endif


    `ifdef AXI_S16_ON_AW_SHARED
    `else
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_ARB_TYPE_S16) begin
         $display("ERROR: ARB_TYPE parameter in SP 16, AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.gen_aw_addrch.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_ARB_TYPE_S16); found_error=1;
       end
    `endif


    `ifdef AXI_S16_ON_W_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_ARB_TYPE_S16) begin
        $display("ERROR: ARB_TYPE parameter in SP 16, W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.gen_w_datach.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_ARB_TYPE_S16); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M1 

    `ifdef AXI_M1_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M1) begin
        $display("ERROR: ARB_TYPE parameter in MP 1, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M1); found_error=1;
      end
    `endif


    `ifdef AXI_M1_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M1) begin
        $display("ERROR: ARB_TYPE parameter in MP 1, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M1); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M2 

    `ifdef AXI_M2_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M2) begin
        $display("ERROR: ARB_TYPE parameter in MP 2, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M2); found_error=1;
      end
    `endif


    `ifdef AXI_M2_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M2) begin
        $display("ERROR: ARB_TYPE parameter in MP 2, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M2); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M3 

    `ifdef AXI_M3_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M3) begin
        $display("ERROR: ARB_TYPE parameter in MP 3, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M3); found_error=1;
      end
    `endif


    `ifdef AXI_M3_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M3) begin
        $display("ERROR: ARB_TYPE parameter in MP 3, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M3); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M4 

    `ifdef AXI_M4_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M4) begin
        $display("ERROR: ARB_TYPE parameter in MP 4, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M4); found_error=1;
      end
    `endif


    `ifdef AXI_M4_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M4) begin
        $display("ERROR: ARB_TYPE parameter in MP 4, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M4); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M5 

    `ifdef AXI_M5_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M5) begin
        $display("ERROR: ARB_TYPE parameter in MP 5, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M5); found_error=1;
      end
    `endif


    `ifdef AXI_M5_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M5) begin
        $display("ERROR: ARB_TYPE parameter in MP 5, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M5); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M6 

    `ifdef AXI_M6_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M6) begin
        $display("ERROR: ARB_TYPE parameter in MP 6, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M6); found_error=1;
      end
    `endif


    `ifdef AXI_M6_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M6) begin
        $display("ERROR: ARB_TYPE parameter in MP 6, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M6); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M7 

    `ifdef AXI_M7_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M7) begin
        $display("ERROR: ARB_TYPE parameter in MP 7, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M7); found_error=1;
      end
    `endif


    `ifdef AXI_M7_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M7) begin
        $display("ERROR: ARB_TYPE parameter in MP 7, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M7); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M8 

    `ifdef AXI_M8_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M8) begin
        $display("ERROR: ARB_TYPE parameter in MP 8, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M8); found_error=1;
      end
    `endif


    `ifdef AXI_M8_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M8) begin
        $display("ERROR: ARB_TYPE parameter in MP 8, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M8); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M9 

    `ifdef AXI_M9_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M9) begin
        $display("ERROR: ARB_TYPE parameter in MP 9, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M9); found_error=1;
      end
    `endif


    `ifdef AXI_M9_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M9) begin
        $display("ERROR: ARB_TYPE parameter in MP 9, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M9); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M10 

    `ifdef AXI_M10_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M10) begin
        $display("ERROR: ARB_TYPE parameter in MP 10, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M10); found_error=1;
      end
    `endif


    `ifdef AXI_M10_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M10) begin
        $display("ERROR: ARB_TYPE parameter in MP 10, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M10); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M11 

    `ifdef AXI_M11_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M11) begin
        $display("ERROR: ARB_TYPE parameter in MP 11, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M11); found_error=1;
      end
    `endif


    `ifdef AXI_M11_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M11) begin
        $display("ERROR: ARB_TYPE parameter in MP 11, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M11); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M12 

    `ifdef AXI_M12_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M12) begin
        $display("ERROR: ARB_TYPE parameter in MP 12, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M12); found_error=1;
      end
    `endif


    `ifdef AXI_M12_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M12) begin
        $display("ERROR: ARB_TYPE parameter in MP 12, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M12); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M13 

    `ifdef AXI_M13_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M13) begin
        $display("ERROR: ARB_TYPE parameter in MP 13, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M13); found_error=1;
      end
    `endif


    `ifdef AXI_M13_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M13) begin
        $display("ERROR: ARB_TYPE parameter in MP 13, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M13); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M14 

    `ifdef AXI_M14_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M14) begin
        $display("ERROR: ARB_TYPE parameter in MP 14, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M14); found_error=1;
      end
    `endif


    `ifdef AXI_M14_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M14) begin
        $display("ERROR: ARB_TYPE parameter in MP 14, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M14); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M15 

    `ifdef AXI_M15_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M15) begin
        $display("ERROR: ARB_TYPE parameter in MP 15, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M15); found_error=1;
      end
    `endif


    `ifdef AXI_M15_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M15) begin
        $display("ERROR: ARB_TYPE parameter in MP 15, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M15); found_error=1;
      end
    `endif

 `endif

 `ifdef AXI_HAS_M16 

    `ifdef AXI_M16_ON_R_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_ARB_TYPE_M16) begin
        $display("ERROR: ARB_TYPE parameter in MP 16, R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_ARB_TYPE_M16); found_error=1;
      end
    `endif


    `ifdef AXI_M16_ON_B_SHARED
    `else
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_ARB_TYPE_M16) begin
        $display("ERROR: ARB_TYPE parameter in MP 16, B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.gen_b_drespch.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_ARB_TYPE_M16); found_error=1;
      end
    `endif

 `endif


    `ifdef AXI_AR_SHARED_LAYER
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AR_SHARED_ARB_TYPE) begin
         $display("ERROR: ARB_TYPE parameter in shared SP AR channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_shared.U_AR_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AR_SHARED_ARB_TYPE); found_error=1;
       end
    `endif
  

    `ifdef AXI_AW_SHARED_LAYER
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE != `AXI_AW_SHARED_ARB_TYPE) begin
         $display("ERROR: ARB_TYPE parameter in shared SP AW channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_shared.U_AW_DW_axi_sp_addrch.U_DW_axi_sp_lockarb.U_DW_axi_arb.ARB_TYPE, `AXI_AW_SHARED_ARB_TYPE); found_error=1;
       end
    `endif
  

    `ifdef AXI_W_SHARED_LAYER
       if (test_DW_axi.U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE != `AXI_W_SHARED_ARB_TYPE) begin
         $display("ERROR: ARB_TYPE parameter in shared SP W channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_sp_shared.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.ARB_TYPE, `AXI_W_SHARED_ARB_TYPE); found_error=1;
       end
    `endif
  

    `ifdef AXI_R_SHARED_LAYER
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_R_SHARED_ARB_TYPE) begin
        $display("ERROR: ARB_TYPE parameter in shared MP R channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_shared.U_R_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_R_SHARED_ARB_TYPE); found_error=1;
      end
    `endif


    `ifdef AXI_B_SHARED_LAYER
      if (test_DW_axi.U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE != `AXI_B_SHARED_ARB_TYPE) begin
        $display("ERROR: ARB_TYPE parameter in shared MP B channel, does not match configured value. Value is %0d, should be %0d.", test_DW_axi.U_DW_axi.U_DW_axi_mp_shared.U_B_DW_axi_mp_drespch.U_DW_axi_arb.ARB_TYPE, `AXI_B_SHARED_ARB_TYPE); found_error=1;
      end
    `endif


  if (found_error == 1) begin
    $finish;
  end else begin
    $display("INFO: ARB_TYPE parameter checker passed."); 
  end

end

