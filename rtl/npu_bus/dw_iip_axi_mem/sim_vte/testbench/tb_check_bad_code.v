
reg found_error = 0;
initial
begin
#5

`ifdef AXI_HAS_M1
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m1 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m1 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M1 < `AXI_NSV_M1) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 1, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M1=%0d < AXI_NSV_M1=%0d)", `AXI_MAX_URIDA_M1, `AXI_NSV_M1); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 1, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M1=%0d >= AXI_NSV_M1=%0d)", `AXI_MAX_URIDA_M1, `AXI_NSV_M1); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M1 < `AXI_NSV_M1) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 1, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M1=%0d < AXI_NSV_M1=%0d)", `AXI_MAX_UWIDA_M1, `AXI_NSV_M1); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 1, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M1=%0d >= AXI_NSV_M1=%0d)", `AXI_MAX_UWIDA_M1, `AXI_NSV_M1); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M2
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m2 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m2 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M2 < `AXI_NSV_M2) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 2, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M2=%0d < AXI_NSV_M2=%0d)", `AXI_MAX_URIDA_M2, `AXI_NSV_M2); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 2, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M2=%0d >= AXI_NSV_M2=%0d)", `AXI_MAX_URIDA_M2, `AXI_NSV_M2); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M2 < `AXI_NSV_M2) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 2, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M2=%0d < AXI_NSV_M2=%0d)", `AXI_MAX_UWIDA_M2, `AXI_NSV_M2); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 2, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M2=%0d >= AXI_NSV_M2=%0d)", `AXI_MAX_UWIDA_M2, `AXI_NSV_M2); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M3
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m3 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m3 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M3 < `AXI_NSV_M3) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 3, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M3=%0d < AXI_NSV_M3=%0d)", `AXI_MAX_URIDA_M3, `AXI_NSV_M3); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 3, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M3=%0d >= AXI_NSV_M3=%0d)", `AXI_MAX_URIDA_M3, `AXI_NSV_M3); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M3 < `AXI_NSV_M3) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 3, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M3=%0d < AXI_NSV_M3=%0d)", `AXI_MAX_UWIDA_M3, `AXI_NSV_M3); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 3, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M3=%0d >= AXI_NSV_M3=%0d)", `AXI_MAX_UWIDA_M3, `AXI_NSV_M3); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M4
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m4 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m4 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M4 < `AXI_NSV_M4) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 4, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M4=%0d < AXI_NSV_M4=%0d)", `AXI_MAX_URIDA_M4, `AXI_NSV_M4); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 4, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M4=%0d >= AXI_NSV_M4=%0d)", `AXI_MAX_URIDA_M4, `AXI_NSV_M4); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M4 < `AXI_NSV_M4) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 4, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M4=%0d < AXI_NSV_M4=%0d)", `AXI_MAX_UWIDA_M4, `AXI_NSV_M4); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 4, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M4=%0d >= AXI_NSV_M4=%0d)", `AXI_MAX_UWIDA_M4, `AXI_NSV_M4); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M5
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m5 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m5 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M5 < `AXI_NSV_M5) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 5, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M5=%0d < AXI_NSV_M5=%0d)", `AXI_MAX_URIDA_M5, `AXI_NSV_M5); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 5, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M5=%0d >= AXI_NSV_M5=%0d)", `AXI_MAX_URIDA_M5, `AXI_NSV_M5); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M5 < `AXI_NSV_M5) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 5, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M5=%0d < AXI_NSV_M5=%0d)", `AXI_MAX_UWIDA_M5, `AXI_NSV_M5); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 5, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M5=%0d >= AXI_NSV_M5=%0d)", `AXI_MAX_UWIDA_M5, `AXI_NSV_M5); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M6
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m6 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m6 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M6 < `AXI_NSV_M6) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 6, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M6=%0d < AXI_NSV_M6=%0d)", `AXI_MAX_URIDA_M6, `AXI_NSV_M6); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 6, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M6=%0d >= AXI_NSV_M6=%0d)", `AXI_MAX_URIDA_M6, `AXI_NSV_M6); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M6 < `AXI_NSV_M6) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 6, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M6=%0d < AXI_NSV_M6=%0d)", `AXI_MAX_UWIDA_M6, `AXI_NSV_M6); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 6, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M6=%0d >= AXI_NSV_M6=%0d)", `AXI_MAX_UWIDA_M6, `AXI_NSV_M6); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M7
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m7 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m7 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M7 < `AXI_NSV_M7) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 7, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M7=%0d < AXI_NSV_M7=%0d)", `AXI_MAX_URIDA_M7, `AXI_NSV_M7); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 7, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M7=%0d >= AXI_NSV_M7=%0d)", `AXI_MAX_URIDA_M7, `AXI_NSV_M7); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M7 < `AXI_NSV_M7) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 7, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M7=%0d < AXI_NSV_M7=%0d)", `AXI_MAX_UWIDA_M7, `AXI_NSV_M7); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 7, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M7=%0d >= AXI_NSV_M7=%0d)", `AXI_MAX_UWIDA_M7, `AXI_NSV_M7); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M8
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m8 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m8 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M8 < `AXI_NSV_M8) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 8, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M8=%0d < AXI_NSV_M8=%0d)", `AXI_MAX_URIDA_M8, `AXI_NSV_M8); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 8, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M8=%0d >= AXI_NSV_M8=%0d)", `AXI_MAX_URIDA_M8, `AXI_NSV_M8); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M8 < `AXI_NSV_M8) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 8, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M8=%0d < AXI_NSV_M8=%0d)", `AXI_MAX_UWIDA_M8, `AXI_NSV_M8); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 8, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M8=%0d >= AXI_NSV_M8=%0d)", `AXI_MAX_UWIDA_M8, `AXI_NSV_M8); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M9
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m9 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m9 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M9 < `AXI_NSV_M9) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 9, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M9=%0d < AXI_NSV_M9=%0d)", `AXI_MAX_URIDA_M9, `AXI_NSV_M9); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 9, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M9=%0d >= AXI_NSV_M9=%0d)", `AXI_MAX_URIDA_M9, `AXI_NSV_M9); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M9 < `AXI_NSV_M9) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 9, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M9=%0d < AXI_NSV_M9=%0d)", `AXI_MAX_UWIDA_M9, `AXI_NSV_M9); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 9, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M9=%0d >= AXI_NSV_M9=%0d)", `AXI_MAX_UWIDA_M9, `AXI_NSV_M9); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M10
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m10 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m10 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M10 < `AXI_NSV_M10) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 10, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M10=%0d < AXI_NSV_M10=%0d)", `AXI_MAX_URIDA_M10, `AXI_NSV_M10); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 10, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M10=%0d >= AXI_NSV_M10=%0d)", `AXI_MAX_URIDA_M10, `AXI_NSV_M10); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M10 < `AXI_NSV_M10) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 10, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M10=%0d < AXI_NSV_M10=%0d)", `AXI_MAX_UWIDA_M10, `AXI_NSV_M10); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 10, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M10=%0d >= AXI_NSV_M10=%0d)", `AXI_MAX_UWIDA_M10, `AXI_NSV_M10); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M11
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m11 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m11 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M11 < `AXI_NSV_M11) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 11, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M11=%0d < AXI_NSV_M11=%0d)", `AXI_MAX_URIDA_M11, `AXI_NSV_M11); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 11, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M11=%0d >= AXI_NSV_M11=%0d)", `AXI_MAX_URIDA_M11, `AXI_NSV_M11); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M11 < `AXI_NSV_M11) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 11, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M11=%0d < AXI_NSV_M11=%0d)", `AXI_MAX_UWIDA_M11, `AXI_NSV_M11); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 11, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M11=%0d >= AXI_NSV_M11=%0d)", `AXI_MAX_UWIDA_M11, `AXI_NSV_M11); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M12
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m12 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m12 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M12 < `AXI_NSV_M12) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 12, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M12=%0d < AXI_NSV_M12=%0d)", `AXI_MAX_URIDA_M12, `AXI_NSV_M12); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 12, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M12=%0d >= AXI_NSV_M12=%0d)", `AXI_MAX_URIDA_M12, `AXI_NSV_M12); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M12 < `AXI_NSV_M12) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 12, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M12=%0d < AXI_NSV_M12=%0d)", `AXI_MAX_UWIDA_M12, `AXI_NSV_M12); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 12, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M12=%0d >= AXI_NSV_M12=%0d)", `AXI_MAX_UWIDA_M12, `AXI_NSV_M12); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M13
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m13 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m13 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M13 < `AXI_NSV_M13) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 13, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M13=%0d < AXI_NSV_M13=%0d)", `AXI_MAX_URIDA_M13, `AXI_NSV_M13); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 13, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M13=%0d >= AXI_NSV_M13=%0d)", `AXI_MAX_URIDA_M13, `AXI_NSV_M13); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M13 < `AXI_NSV_M13) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 13, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M13=%0d < AXI_NSV_M13=%0d)", `AXI_MAX_UWIDA_M13, `AXI_NSV_M13); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 13, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M13=%0d >= AXI_NSV_M13=%0d)", `AXI_MAX_UWIDA_M13, `AXI_NSV_M13); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M14
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m14 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m14 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M14 < `AXI_NSV_M14) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 14, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M14=%0d < AXI_NSV_M14=%0d)", `AXI_MAX_URIDA_M14, `AXI_NSV_M14); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 14, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M14=%0d >= AXI_NSV_M14=%0d)", `AXI_MAX_URIDA_M14, `AXI_NSV_M14); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M14 < `AXI_NSV_M14) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 14, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M14=%0d < AXI_NSV_M14=%0d)", `AXI_MAX_UWIDA_M14, `AXI_NSV_M14); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 14, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M14=%0d >= AXI_NSV_M14=%0d)", `AXI_MAX_UWIDA_M14, `AXI_NSV_M14); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M15
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m15 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m15 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M15 < `AXI_NSV_M15) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 15, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M15=%0d < AXI_NSV_M15=%0d)", `AXI_MAX_URIDA_M15, `AXI_NSV_M15); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 15, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M15=%0d >= AXI_NSV_M15=%0d)", `AXI_MAX_URIDA_M15, `AXI_NSV_M15); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M15 < `AXI_NSV_M15) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 15, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M15=%0d < AXI_NSV_M15=%0d)", `AXI_MAX_UWIDA_M15, `AXI_NSV_M15); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 15, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M15=%0d >= AXI_NSV_M15=%0d)", `AXI_MAX_UWIDA_M15, `AXI_NSV_M15); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_M16
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m16 Read Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
  if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: m16 Response Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end

  if (`AXI_MAX_URIDA_M16 < `AXI_NSV_M16) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 16, Read Channel USE_INT_GRANT_INDEX is 1 (AXI_MAX_URIDA_M16=%0d < AXI_NSV_M16=%0d)", `AXI_MAX_URIDA_M16, `AXI_NSV_M16); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_R_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 16, Read Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_URIDA_M16=%0d >= AXI_NSV_M16=%0d)", `AXI_MAX_URIDA_M16, `AXI_NSV_M16); found_error=1;
    end
  end
  if (`AXI_MAX_UWIDA_M16 < `AXI_NSV_M16) begin 
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
      $display("ERROR: Master 16, Response Channel USE_INT_GRANT_INDEX is 1(AXI_MAX_UWIDA_M16=%0d < AXI_NSV_M16=%0d)", `AXI_MAX_UWIDA_M16, `AXI_NSV_M16); found_error=1;
    end
  end else begin
    if (test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_B_DW_axi_mp_drespch.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 0) begin
      $display("ERROR: Master 16, Response Channel USE_INT_GRANT_INDEX is 0 (AXI_MAX_UWIDA_M16=%0d >= AXI_NSV_M16=%0d)", `AXI_MAX_UWIDA_M16, `AXI_NSV_M16); found_error=1;
    end
  end
`endif


`ifdef AXI_HAS_S0
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s0 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s0.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 0, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S1
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s1 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s1.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 1, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S2
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s2 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s2.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 2, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S3
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s3 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s3.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 3, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S4
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s4 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s4.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 4, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S5
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s5 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s5.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 5, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S6
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s6 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s6.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 6, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S7
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s7 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s7.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 7, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S8
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s8 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s8.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 8, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S9
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s9 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s9.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 9, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S10
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s10 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s10.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 10, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S11
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s11 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s11.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 11, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S12
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s12 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s12.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 12, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S13
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s13 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s13.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 13, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S14
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s14 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s14.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 14, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S15
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s15 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s15.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 15, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


`ifdef AXI_HAS_S16
// Check for value outside range
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX > 1) begin
    $display("ERROR: s16 Write Value out of range %0d", test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX); found_error=1;
  end
// Check for wrong level
  if (test_DW_axi.U_DW_axi.U_DW_axi_sp_s16.U_W_DW_axi_sp_wdatach.U_DW_axi_arb.USE_INT_GRANT_INDEX[0] == 1) begin
    $display("ERROR: Slave 16, Write Channel USE_INT_GRANT_INDEX is 1"); found_error=1;
  end
`endif


//  if (found_error == 1) $finish;

 $display("User test stimulus has completed");
 $finish;

end
