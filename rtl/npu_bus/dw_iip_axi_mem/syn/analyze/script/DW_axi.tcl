set rtWorkingDir [pwd]
# Design specific setup variables.
# dc_shell setup variables for DW_axi
set_app_var hdlin_infer_complex_set_reset true
set_app_var suppress_errors {DDB-74 DDB-95 EQN-10 HDL-176 HDL-395 LINT-0 LINT-2 LINT-28 LINT-29 LINT-30 LINT-31 LINT-32 LINT-33 LINT-45 TIM-103 TIM-134 VER-61 VER-314 UCN-1 UIO-78 ELAB-349 LINT-52 OPT-1307 RCEX-076 DDC-9 OPT-301 LINT-60}
set_app_var suppress_warnings {DDB-74 DDB-95 EQN-10 HDL-176 HDL-395 LINT-0 LINT-2 LINT-28 LINT-29 LINT-30 LINT-31 LINT-32 LINT-33 LINT-45 TIM-103 TIM-134 VER-61 VER-314 UCN-1 UIO-78 ELAB-349 LINT-52 OPT-1307 RCEX-076 DDC-9 OPT-301 LINT-60}
set_app_var synlib_wait_for_design_license {DesignWare DC-Ultra-Opt DC-Ultra-Features}
set_app_var template_parameter_style %d
# Let DC find include files
set old_dc_search_path $::search_path
set rt_syn_path [pwd]
set rt_src_dirs ../src
foreach rtLoopVar $rt_src_dirs {
  lappend ::search_path [file join $rt_syn_path $rtLoopVar]
}
set ::hdlin_enable_vpp true


set rt_files_to_analyze { \
  ../src/DW_axi_cc_constants.v
  ../src/DW_axi_constants.v
  ../src/DW_axi_bcm_params.v
  ../src/DW_axi_bcm01.v
  ../src/DW_axi_bcm06.v
  ../src/DW_axi_arbiter_fae.v
  ../src/DW_axi_arbiter_fcfs.v
  ../src/DW_axi_bcm57.v
  ../src/DW_axi_arbiter_dp.v
  ../src/DW_axi_busmux.v
  ../src/DW_axi_busdemux.v
  ../src/DW_axi_multibusmux.v
  ../src/DW_axi_busmux_ohsel.v
  ../src/DW_axi_systolcl.v
  ../src/DW_axi_lcltosys.v
  ../src/DW_axi_irs.v
  ../src/DW_axi_irs_arbpl.v
  ../src/DW_axi_dcdr.v
  ../src/DW_axi_mca_reqhold.v
  ../src/DW_axi_arbpl.v
  ../src/DW_axi_arb.v
  ../src/DW_axi_mp_tzone.v
  ../src/DW_axi_mp_idmask.v
  ../src/DW_axi_mp_addrch.v
  ../src/DW_axi_mp_drespch.v
  ../src/DW_axi_mp_wdatach.v
  ../src/DW_axi_aw_mtile_dlock.v
  ../src/DW_axi_mp.v
  ../src/DW_axi_sp_addrch.v
  ../src/DW_axi_lockdec.v
  ../src/DW_axi_sp_lockarb.v
  ../src/DW_axi_sp_drespch.v
  ../src/DW_axi_fifo_s1_sf.v
  ../src/DW_axi_sp_wrorder.v
  ../src/DW_axi_sp_shrd_wrorder.v
  ../src/DW_axi_sp_wdatach.v
  ../src/DW_axi_sp.v
  ../src/DW_axi_sp_shrd.v
  ../src/DW_axi_mp_shrd.v
  ../src/DW_axi_dfltslv.v
  ../src/DW_axi_dlock_cnt.v
  ../src/DW_axi_dlock_mux.v
  ../src/DW_axi_lpfsm.v
  ../src/DW_axi_lp.v
  ../src/DW_axi.v
  ../src/DW_axi-undef.v
}
if { ![analyze -format verilog -lib work $rt_files_to_analyze] } {
  error "Could not analyze HDL files"
}

# Put the search path back
set ::search_path $old_dc_search_path
