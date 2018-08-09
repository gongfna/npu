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
** File     : tb_check_shared.v
** Abstract : 2 checks related to the hybrid feature.
**            
**            1. Check shared, checks that source sink paths configured
**               as shared, have been implemented as such.
**
**            2. Check dedicated, checks that source sink paths 
**               configured as dedicated, have been implemented as such.
**
**
** ---------------------------------------------------------------------
*/

/*
// check default values after reset
    always@(*)
      if(!aresetn)
        begin
	  if(dlock_mst != 0) $display("ERROR");
	  if(dlock_slv != 0) $display("ERROR");
	  if(dlock_id  != 0) $display("ERROR");
	  if(dlock_wr  != 0) $display("ERROR");
	  if(dlock_irq != 0) $display("ERROR");
	end
*/

// start counter for local copy of dlc_zero, dlc_max; must be synchronized with internal signals
// reset should be enough to guarantee this

// detect start of new write transaction


task tb_axi_initialize_deadlock;

integer master,slot;

begin
  
    for(master=1;master<=`AXI_NUM_MASTERS;master=master+1) begin
        for(slot=0;slot<`AXI_POW2_MIDW;slot=slot+1) begin

	    aw_outstanding [master][slot] = 0;
	    ar_outstanding [master][slot] = 0;
	    aw_deadlocked  [master][slot] = 0;
	    ar_deadlocked  [master][slot] = 0;
	    aw_tx_count    [master][slot] = 0;
	    ar_tx_count    [master][slot] = 0;
	    ar_tx_slvs     [master][slot] = 0;
	    ar_tx_ids      [master][slot] = 0;
	    aw_tx_slvs     [master][slot] = 0;
	    aw_tx_ids      [master][slot] = 0;
	end

	aw_tx_issued[master] = 0;
	ar_tx_issued[master] = 0;
	
	aw_cpl_tx_i[master]  = 0;
	ar_cpl_tx_i[master]  = 0;
		
    end

    check_dlock_mst = 0;
    check_dlock_slv = 0;
    check_dlock_id  = 0;
    check_dlock_wr  = 0;
    check_dlock_irq = 0;

end
endtask


task tb_axi_check_deadlock;

integer slave;
integer region;
integer master;
integer slot;

integer sslv;
integer lslv;
integer tx_issued_slv_sys_tmp;


reg dlc_zero;
reg dlc_max;

reg i_check_dlock_irq;
reg i_check_dlock_wr;

reg dlock_slv_check_fail;
reg dlock_id_check_fail;

integer i_check_dlock_mst;
integer i_check_dlock_slv;
integer i_check_dlock_id;

integer found_dlock_mst;

begin
	
    #1 dlc_zero = test_DW_axi.U_DW_axi.dlc_zero;
    #1 dlc_max  = test_DW_axi.U_DW_axi.dlc_max;
	
    for(slot=0;slot<`AXI_POW2_MIDW;slot=slot+1) begin    
        `ifdef AXI_HAS_M1 
            aw_issued_slot_num_oh[1][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[1][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[1][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[1][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M2 
            aw_issued_slot_num_oh[2][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[2][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[2][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[2][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M3 
            aw_issued_slot_num_oh[3][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[3][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[3][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[3][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M4 
            aw_issued_slot_num_oh[4][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[4][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[4][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[4][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M5 
            aw_issued_slot_num_oh[5][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[5][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[5][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[5][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M6 
            aw_issued_slot_num_oh[6][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[6][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[6][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[6][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M7 
            aw_issued_slot_num_oh[7][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[7][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[7][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[7][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M8 
            aw_issued_slot_num_oh[8][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[8][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[8][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[8][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M9
            aw_issued_slot_num_oh[9][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[9][slot]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[9][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[9][slot]     = test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M10 
            aw_issued_slot_num_oh[10][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[10][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[10][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[10][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M11 
            aw_issued_slot_num_oh[11][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[11][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[11][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[11][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M12 
            aw_issued_slot_num_oh[12][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[12][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[12][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[12][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M13 
            aw_issued_slot_num_oh[13][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[13][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[13][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[13][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M14 
            aw_issued_slot_num_oh[14][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[14][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[14][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[14][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M15 
            aw_issued_slot_num_oh[15][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[15][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[15][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[15][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
        `ifdef AXI_HAS_M16 
            aw_issued_slot_num_oh[16][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            ar_issued_slot_num_oh[16][slot] = test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.issued_slot_num_oh[slot];
            aw_cpl_slot_num_oh[16][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
            ar_cpl_slot_num_oh[16][slot]    = test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.cpl_slot_num_oh[slot];
        `endif
    end

    `ifdef AXI_HAS_M1 
    aw_tx_issued_slv[1]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[1]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    // NOTE : Need to be careful if there is only 1 master, `AXI_SIDW-`AXI_MIDW
    // will resolve to 0 and there will be compilation errors due to {0{1'b0}}.
    `ifdef AXI_HAS_M2 
    aw_tx_issued_id[1]  = `AXI_HAS_BICMD 
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[1]  = `AXI_HAS_BICMD 
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `else
    aw_tx_issued_id[1]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux;
    ar_tx_issued_id[1]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux;
    `endif
    `endif
    `ifdef AXI_HAS_M2 
    aw_tx_issued_slv[2]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[2]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[2]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=2))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[2]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=2))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m2.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M3 
    aw_tx_issued_slv[3]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[3]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[3]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=3))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[3]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=3))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m3.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M4 
    aw_tx_issued_slv[4]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[4]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[4]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=4))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[4]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=4))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m4.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M5 
    aw_tx_issued_slv[5]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[5]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[5]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=5))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[5]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=5))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m5.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M6 
    aw_tx_issued_slv[6]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[6]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[6]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=6))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[6]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=6))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m6.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M7 
    aw_tx_issued_slv[7]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[7]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[7]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=7))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[7]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=7))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m7.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M8 
    aw_tx_issued_slv[8]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[8]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[8]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=8))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {'b0, test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[8]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=8))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m8.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M9
    aw_tx_issued_slv[9]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[9]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[9]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=9))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[9]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=9))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m9.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M10 
    aw_tx_issued_slv[10]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[10]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[10]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=10))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[10]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=10))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m10.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M11 
    aw_tx_issued_slv[11]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[11]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[11]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=11))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[11]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=11))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m11.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M12 
    aw_tx_issued_slv[12]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[12]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[12]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=12))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[12]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=12))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m12.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M13 
    aw_tx_issued_slv[13]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[13]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[13]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=13))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[13]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=13))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m13.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M14 
    aw_tx_issued_slv[14]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[14]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[14]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=14))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[14]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=14))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m14.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M15 
    aw_tx_issued_slv[15]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[15]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[15]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=15))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[15]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=15))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m15.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif
    `ifdef AXI_HAS_M16 
    aw_tx_issued_slv[16]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    ar_tx_issued_slv[16]  = test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.local_slv_mux;
    // Pad out with 0's if ID is not SIDW bits wide, which it will be if this is not an interconnecting master port.
    aw_tx_issued_id[16]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=16))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AW_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    ar_tx_issued_id[16]  = (`AXI_HAS_BICMD & (`AXI_NUM_ICM>=16))
                           ? test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux
                           : {{(`AXI_SIDW-`AXI_MIDW){1'b0}}, test_DW_axi.U_DW_axi.U_DW_axi_mp_m16.U_AR_DW_axi_mp_addrch.U_DW_axi_mp_idmask.id_mux};
    `endif


    // Keep track of how many t/x's are outstanding for each write ID, for each
    // master.
    for(master=1; master <= `AXI_NUM_MASTERS; master = master+1) begin
        for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
            case({aw_issued_slot_num_oh[master][slot],aw_cpl_slot_num_oh[master][slot]})
                2'b00,
                2'b11 : begin
                  // Do Nothing
                end
            	2'b01 : aw_tx_count[master][slot] <= aw_tx_count[master][slot] - 1;
                2'b10 : begin

                  // Map local slave number to system slave number.
                  lslv=1;
                  for(sslv=1;sslv<=`AXI_NUM_SLAVES;sslv=sslv+1) begin
                    if(visible_slaves[master][sslv] | visible_slaves_other_mode[master][sslv]) begin
                      if(lslv==aw_tx_issued_slv[master]) tx_issued_slv_sys_tmp = sslv;
                      lslv=lslv+1;
                    end
                  end
                  // Note that the visible_slaves* variables do not store visibility info for the default slave, all masters
                  // always visible to default slave.
                  aw_tx_slvs[master][slot] <= (aw_tx_issued_slv[master]==0) ? 0 : tx_issued_slv_sys_tmp;
            	  //$display("%0t, debug, aw_tx_slvs[%0d][%0d] = %0h, aw_tx_issued_slv[%0d] %0b, tx_issued_slv_sys_tmp %0h"
                           //, $time, master, slot, aw_tx_slvs[master][slot], master, aw_tx_issued_slv[master], tx_issued_slv_sys_tmp);
                  //aw_tx_slvs[master][slot] <= (aw_tx_issued_slv[master]==0) ? 0 : tx_issued_slv_sys_tmp;
            	  //$display("%0t, debug, PREV, aw_tx_slvs[%0d][%0d] = %0h"
                           //, $time, master, slot-1, aw_tx_slvs[master][slot-1]);

                  aw_tx_count[master][slot] <= aw_tx_count[master][slot] + 1;
                  aw_tx_ids[master][slot] <= aw_tx_issued_id[master];
            	  //$display("%0t, debug, aw_tx_ids[%0d][%0d] = %0h, aw_tx_issued_id[%0h] %0h, aw_issued_slot_num_oh[%0d][%0d] %0b \n\n"
                           //, $time, master, slot, aw_tx_ids[master][slot]
                           //, master, aw_tx_issued_id[master]
                           //, master, slot, aw_issued_slot_num_oh[master][slot]);
                end
            endcase
        end
    end


    // Keep track of how many t/x's are outstanding for each read ID, for each
    // master.
    for(master=1; master <= `AXI_NUM_MASTERS; master = master+1) begin
        for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
            //$display("%0t, debug, master %0d, slot %0d, ar_issued_slot_num_oh[%0d][%0d] %0b, ar_cpl_slot_num_oh[%0d][%0d] %0b"
                     //, $time, master, slot, master, slot, ar_issued_slot_num_oh[master][slot], master, slot, ar_cpl_slot_num_oh[master][slot]);
            case({ar_issued_slot_num_oh[master][slot],ar_cpl_slot_num_oh[master][slot]})
                2'b00,
                2'b11 : begin
                  // Do Nothing
                end
            	2'b01 : ar_tx_count[master][slot] <= ar_tx_count[master][slot] - 1;
                2'b10 : begin
                  // Map local slave number to system slave number.
                  lslv=1;
                  for(sslv=1;sslv<=`AXI_NUM_SLAVES;sslv=sslv+1) begin
            	    //$display("%0t, debug, visible_slaves[%0d][%0d] %0d, visible_slaves_other_mode[%0d][%0d] %0d, sslv %0d, lslv %0d"
                             //, $time, master, sslv, visible_slaves[master][sslv]
                             //, master, sslv, visible_slaves_other_mode[master][sslv], sslv, lslv);
                    if(visible_slaves[master][sslv] | visible_slaves_other_mode[master][sslv]) begin
                      if(lslv==ar_tx_issued_slv[master]) tx_issued_slv_sys_tmp = sslv;
                      lslv=lslv+1;
                    end
                  end
                  // Note that the visible_slaves* variables do not store visibility info for the default slave, all masters
                  // always visible to default slave.
                  ar_tx_slvs[master][slot] <= (ar_tx_issued_slv[master]==0) ? 0 : tx_issued_slv_sys_tmp;
            	  //$display("%0t, debug, ar_tx_slvs[%0d][%0d] = %0h, ar_tx_issued_slv[%0d] %0b"
                           //, $time, master, slot, ar_tx_slvs[master][slot], master, ar_tx_issued_slv[master]);

                  ar_tx_count[master][slot] <= ar_tx_count[master][slot] + 1;
                  ar_tx_ids[master][slot] <= ar_tx_issued_id[master];
            	  //$display("%0t, debug, ar_tx_ids[%0d][%0d] = %0h, ar_issued_slot_num_oh[%0d][%0d] %0b"
                           //, $time, master, slot, ar_tx_ids[master][slot], master, slot, ar_issued_slot_num_oh[master][slot]);
                end
            endcase
/*
            if(ar_issued_slot_num_oh[master][slot])
            	$display("%0d New read transaction for master %0d, slot %0d\n",$time,master,slot);
            if(ar_cpl_slot_num_oh[master][slot])
            	$display("%0d Completed read transaction for master %0d, slot %0d\n",$time,master,slot);
            if(ar_issued_slot_num_oh[master][slot] || ar_cpl_slot_num_oh[master][slot])
            	$display("%0d Number of outstanding read transactions for master %0d, slot %0d is %0d\n",$time,master,slot,ar_tx_count[master][slot]);
*/
        end
    end


    // Keep track of all outstanding master writes, and which ID's are
    // outstanding.
    for(master=1; master <= `AXI_NUM_MASTERS; master = master+1) begin
        for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
            if(aw_cpl_slot_num_oh[master][slot]) begin
            	aw_outstanding[master][slot] = 0;
            end else if((dlc_zero) && (aw_tx_count[master][slot] > 0)) begin 
            	aw_outstanding[master][slot] = 1;
            end else begin
                aw_outstanding[master][slot] = aw_outstanding[master][slot];
            end 
        end
    end

    // Keep track of all outstanding master reads, and which ID's are
    // outstanding.
    for(master=1; master <= `AXI_NUM_MASTERS; master = master+1) begin
        for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
            if(ar_cpl_slot_num_oh[master][slot]) begin
                //$display("debug, completion, ar_cpl_slot_num_oh[%0d][%0d] = %0b", $time, master, slot, ar_cpl_slot_num_oh[master][slot]);
            	ar_outstanding[master][slot] = 0;
            end else if((dlc_zero) && (ar_tx_count[master][slot] > 0)) begin 
                //$display("debug, oustanding t/x, ar_tx_count[%0d][%0d] = %0b", $time, master, slot, ar_tx_count[master][slot]);
            	ar_outstanding[master][slot] = 1;
            end else begin
                ar_outstanding[master][slot] = ar_outstanding[master][slot];
            end 
        end
    end


    // Record which masters have deadlocked writes.
    for(master=1; master <= `AXI_NUM_MASTERS; master = master+1) begin
        for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
            /*if(aw_cpl_slot_num_oh[master][slot]) begin
            	aw_deadlocked[master][slot] = 0;
            end else*/ if((dlc_max) && (aw_outstanding[master][slot] > 0)) begin 
            	aw_deadlocked[master][slot] <= 1;
            end else if(aw_outstanding[master][slot] == 0) begin 
            	aw_deadlocked[master][slot] <= 0;
            end else begin
                aw_deadlocked[master][slot] <= aw_deadlocked[master][slot];
            end 
        end
    end

    // Record which masters have deadlocked reads.
    for(master=1; master <= `AXI_NUM_MASTERS; master = master+1) begin
        for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
            /*if(ar_cpl_slot_num_oh[master][slot]) begin
            	ar_deadlocked[master][slot] = 0;
            end else*/ if((dlc_max) && (ar_outstanding[master][slot] > 0)) begin 
            	ar_deadlocked[master][slot] <= 1;
            end else if(ar_outstanding[master][slot] == 0) begin 
            	ar_deadlocked[master][slot] <= 0;
            end else begin
                ar_deadlocked[master][slot] <= ar_deadlocked[master][slot];
            end 
        end
    end

    // Decode if a deadlock has occured, from which master, and whether it
    // is a read or write.
    found_dlock_mst   = 0;
    i_check_dlock_irq = 0;
    i_check_dlock_wr  = 0;
    i_check_dlock_mst = 0;
    for(master=1; master <= `AXI_NUM_MASTERS; master = master+1) begin
        for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
            if(found_dlock_mst == 0) begin
            	if(aw_deadlocked[master][slot] || ar_deadlocked[master][slot]) begin
            	    found_dlock_mst = 1;
           	    i_check_dlock_irq = 1;
            	    i_check_dlock_mst = master-1;
                    if(i_check_dlock_irq) begin
                      //$display("%0t debug, aw_deadlocked[%0d][%0d] = %0d, ar_deadlocked[%0d][%0d] = %0d"
                               //, $time, master, slot, aw_deadlocked[master][slot], master, slot, ar_deadlocked[master][slot]);
                    end
                    for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
            	        if(aw_deadlocked[master][slot]) begin
                            i_check_dlock_wr  = 1;
            	        end
                    end
            	end
            end 
        end
    end


    // Perform the check.
    check_dlock_irq = i_check_dlock_irq;
    check_dlock_wr  = i_check_dlock_wr;
    check_dlock_mst = i_check_dlock_mst;
    
    if(dlock_irq != check_dlock_irq) begin
        $display("%0d ERROR (tb_axi_update_deadlock): dlock_irq is %0b, should be %0b\n",$time,dlock_irq,check_dlock_irq);
        $finish;
    end

    if(dlock_wr != check_dlock_wr) begin
        $display("%0d ERROR (tb_axi_update_deadlock): dlock_wr is %0b, should be %0b\n",$time,dlock_wr,check_dlock_wr);
        $finish;
    end

    if(dlock_mst != check_dlock_mst) begin
        $display("%0d ERROR (tb_axi_update_deadlock): dlock_mst is %0d, should be %0d\n",$time,dlock_mst,check_dlock_mst);
        $finish;
    end

    // Check that dlock_slv matches with one of the slaves at which
    // a deadlocked ID is outstanding. It is indeterministic exactly which
    // slave will appear on dlock_slv, but it must be one of the deadlocked
    // slaves.
    dlock_slv_check_fail = 1;
    if(dlock_irq & dlock_wr) begin
      for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
        if(aw_deadlocked[dlock_mst+1][slot] & (aw_tx_slvs[dlock_mst+1][slot] == dlock_slv)) begin
          dlock_slv_check_fail = 0;
        end
      end
      if(dlock_slv_check_fail) begin
        $display("%0d ERROR (tb_axi_update_deadlock): dlock_slv is %0d, does not match any write t/x deadlocked slaves for dlock_mst+1=%0d\n"
                 ,$time,dlock_slv, dlock_mst+1);
        for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
          //$display("%0d debug, aw_deadlocked[%0d][%0d] %0d, aw_tx_slvs[%0d][%0d] = %0d"
                   //, $time, dlock_mst+1, slot, aw_deadlocked[dlock_mst+1][slot]
                   //, dlock_mst+1, slot, aw_tx_slvs[dlock_mst+1][slot]);
        end
        $finish;
      end
    end

    if(dlock_irq & ~dlock_wr) begin
      for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
        if(ar_deadlocked[dlock_mst+1][slot] & (ar_tx_slvs[dlock_mst+1][slot] == dlock_slv)) begin
          dlock_slv_check_fail = 0;
        end
      end
      if(dlock_slv_check_fail) begin
        $display("%0d ERROR (tb_axi_update_deadlock): dlock_slv is %0d, does not match any read t/x deadlocked slaves for dlock_mst+1=%0d\n"
                 ,$time,dlock_slv, dlock_mst+1);
        //for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
          //$display("%0d debug, ar_deadlocked[%0d][%0d] = %0d, ar_tx_slvs[%0d][%0d] = %0d"
                   //, $time, dlock_mst+1, slot, ar_deadlocked[dlock_mst+1][slot], dlock_mst+1, slot, ar_tx_slvs[dlock_mst+1][slot]);
        //end
        $finish;
      end
    end

    // Check that dlock_id matches with one of the deadlocked ID's.
    // a deadlocked ID is outstanding. It is indeterministic exactly which
    // id will appear on dlock_id, but it must be one of the deadlocked ID's.
    dlock_id_check_fail = 1;
    if(dlock_irq & dlock_wr) begin
      for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
        if(aw_deadlocked[dlock_mst+1][slot] & (aw_tx_ids[dlock_mst+1][slot][`AXI_MIDW-1:0]  == dlock_id)) begin
          dlock_id_check_fail = 0;
        end
      end
      if(dlock_id_check_fail) begin
        $display("%0d ERROR (tb_axi_update_deadlock): dlock_id is %0h, does not match any write t/x deadlocked ID's for dlock_mst+1=%0d\n"
                 ,$time,dlock_id, dlock_mst+1);
        //for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
          //$display("%0d debug, aw_deadlocked[%0d][%0d] = %0d, aw_tx_ids[%0d][%0d] = %0h, dlock_id = %0h"
                   //, $time, dlock_mst+1, slot, aw_deadlocked[dlock_mst+1][slot], dlock_mst+1, slot
                   //, aw_tx_ids[dlock_mst+1][slot][`AXI_MIDW-1:0], dlock_id);
        //end
        $finish;
      end
    end

    dlock_id_check_fail = 1;
    if(dlock_irq & ~dlock_wr) begin
      for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
        if(ar_deadlocked[dlock_mst+1][slot] & (ar_tx_ids[dlock_mst+1][slot][`AXI_MIDW-1:0] == dlock_id)) begin
          dlock_id_check_fail = 0;
        end
      end
      if(dlock_id_check_fail) begin
        $display("%0d ERROR (tb_axi_update_deadlock): dlock_id is %0h, does not match any read t/x deadlocked ID's for dlock_mst+1=%0d\n"
                 ,$time,dlock_id, dlock_mst+1);
        //for(slot = 0; slot < `AXI_POW2_MIDW; slot = slot+1) begin
          //$display("%0d debug, ar_deadlocked[%0d][%0d] = %0d, ar_tx_ids[%0d][%0d] = %0h, dlock_id = %0h"
                   //, $time, dlock_mst+1, slot, ar_deadlocked[dlock_mst+1][slot], dlock_mst+1, slot 
                   //, ar_tx_ids[dlock_mst+1][slot][`AXI_MIDW-1:0], dlock_id);
        //end
        $finish;
      end
    end
    

/*
    if(dlock_irq) begin
        if(dlock_wr) begin
            if(dlock_slv != slave_wr_xact_m[dlock_mst-1][awid_m[dlock_mst-1]]) begin
	        //$display("%0d ERROR (tb_axi_update_deadlock): dlock_slv is %0d, should be %0d",$time,dlock_slv,slave_wr_xact_m[dlock_mst-1][awid_m[dlock_mst-1]]);
	    end
	end else begin
            if(dlock_slv != slave_rd_xact_m[dlock_mst-1][awid_m[dlock_mst-1]]) begin
	        //$display("%0d ERROR (tb_axi_update_deadlock): dlock_slv is %0d, should be %0d",$time,dlock_slv,slave_rd_xact_m[dlock_mst-1][awid_m[dlock_mst-1]]);	    
	    end
	end
    end
*/

end
endtask



