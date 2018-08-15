

#+++++++++++++++++++++++++++++++++++++++++
##create new project
#++++++++++++++++++++++++++++++++=++++++++++
new_project npu_sys -projectwdir . -force

#+++++++++++++++++++++++++++++++++++++++++
##Data Import Section
#++++++++++++++++++++++++++++++++=++++++++++
read_file -type sourcelist /home/xsy/npu/from_yas/filelist.f
read_file -type sgdc /home/xsy/npu/from_yas/example.sgdc

#+++++++++++++++++++++++++++++++++++++++++
## dedicate instantiate ram or fifo 
#++++++++++++++++++++++++++++++++=++++++++++
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/rfsp1024x19_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/rfsp128x128_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/rfsp512x128_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/sramsp2048x128_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/sramsp32768x36_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/sramsp4096x128_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/sramsp4096x144_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/sramsp8192x128_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/sramsp8192x144_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/sramsp8192x32_ss_0p90v_0p90v_125c.lib
read_file -type gateslib /home/xsy/npu/from_yas/ramlib/s40dpsf_npu_1024x30_ss_0p90v_0p90v_125c.lib
#+++++++++++++++++++++++++++++++++++++++++
## foundary lib
#++++++++++++++++++++++++++++++++=++++++++++
read_file -type gateslib /home/lib/foundary/training_lib/stdcel/lib/tt1p20v25c/saed90nm_typ.lib
read_file -type gateslib /home/lib/foundary/training_lib/stdcel/lib/tt1p20v25c/saed90nm_typ_cg_hvt.lib
read_file -type gateslib /home/lib/foundary/training_lib/stdcel/lib/tt1p20v25c/saed90nm_typ_cg.lib
read_file -type gateslib /home/lib/foundary/training_lib/stdcel/lib/tt1p20v25c/saed90nm_typ_cg_lvt.lib
read_file -type gateslib /home/lib/foundary/training_lib/stdcel/lib/tt1p20v25c/saed90nm_typ_hvt.lib
read_file -type gateslib /home/lib/foundary/training_lib/stdcel/lib/tt1p20v25c/saed90nm_typ_lvt.lib
#+++++++++++++++++++++++++++++++++++++++++++++++++++
##Common Options Section
#++++++++++++++++++++++++++++++++++++++++++++++++++++
## set DUT top module
set MY_TOP_MODULENAME  npu_sys
set_option top $MY_TOP_MODULENAME

set_option language_mode mixed
set_option designread_enable_synthesis yes

# automatically enableSV
set_option enableSV yes

# automatically sort VHDL files
set_option sort yes

# removing work directory and recompile all design
set_option remove_work yes

# generate spyglass_cmdline_debug.log file 
set_option enable_cmdline_debug yes

# enable the Power Explorer feature of the SpyGlass Power Estimation product
# This command enables various views that contains data related to register and memory instance of design.
set_option enable_power_platform_flow yes

#by default,SpyGlass creates clock gating logic only when 16 or more flip‑flops are found in a design unit with the same clock signal and the same enable signal in a MUX-based logic when sgsyn_clock_gating is specified. 
#Use sgsyn_clock_gating_threshold to specify your own minimum number.
#set_option sgsyn_clock_gating_threshold 3 


#+++++++++++++++++++++++++++++++++++++++++++++++++++
##Goal Setup Section
#+++++++++++++++++++++++++++++++++++++++++++++++++++
current_methodology /opt/synopsys/SpyGlass-L2016.06/SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff


#current_goal physical_aware_power/physical_power_postfloorplan
#-top $MY_TOP_MODULENAME
#set_parameter phy_tech_path $MY_TECHPATH_SGP
# set_parameter phy_sdc ../source/generic.sdc

#current_goal physical_aware_power/power_est_average
#set_parameter pe_decompile capacitance
#set_parameter pe_report_leaf 



##===================== lint ====================
#
###===================== lint ===================
run_goal -goal {lint/lint_rtl
                lint/lint_turbo_rtl
                lint/lint_functional_rtl
                lint/lint_abstract}


#===================== cdc ====================
#

run_goal -goal {cdc/cdc_setup_check
                cdc/clock_reset_integrity
                cdc/cdc_verify_struct
                cdc/cdc_verify
                cdc/cdc_abstract
                cdc/cdc_verify_jitter}

#===================== power ====================
#

run_goal -goal {power/power_audit 
                power/power_activity_check 
                power/power_gen_pesd
                power/power_calibration
                power/power_est_average}

save_project
gui_start spyglass
