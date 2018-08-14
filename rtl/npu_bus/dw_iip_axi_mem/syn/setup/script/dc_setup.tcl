#######################################################################
# Design Compiler Top-Down Reference Methodology Setup
# Script: dc_setup.tcl
# Version: Z-2007.03 (Apr. 13, 2007)
# Copyright (C) 2007, Synopsys All rights reserved.
#######################################################################

set DESIGN_NAME DW_axi

#######################################################################
# Setup Variables
#######################################################################

set ::bus_naming_style {%s[%d]}
set ::bus_dimension_separator_style {][}
set ::template_naming_style %s_%p
set ::template_parameter_style %d
set ::template_separator_style _
set ::hdl_naming_threshold 20
set ::hdlin_field_naming_style {}
set ::hdlin_vrlg_std 2005
set ::uniquify_naming_style %s_%d
set ::test_default_scan_style multiplexed_flip_flop
set ::alib_library_analysis_path ./
set ::alib_library_analysis_cache ./
set ::compile_seqmap_identify_shift_registers true



# The following will only be used for DCT
set DCT_IGNORED_ROUTING_LAYERS ""           ;# Enter the same ignored routing layers as P&R
                                             # set DCT_IGNORED_ROUTING_LAYERS {METAL4 METAL5}

# The following variables are used by scripts in dc_scripts to direct the location
# of the output files

set REPORTS_DIR [file join . initial report]
set RESULTS_DIR [file join . initial db]

file mkdir $REPORTS_DIR
file mkdir $RESULTS_DIR

#######################################################################
# Library Setup
#######################################################################

set ::dcSnpsRoot /opt/synopsys/SYN-K-2015.06
set ::target_library [list default_technology]
set ::link_library [list * default_technology]


# Enable use of dw_foundation.sldb
if {[lsearch -exact $::synthetic_library dw_foundation.sldb] == -1} {
  lappend ::synthetic_library dw_foundation.sldb
}


## Make sure the synthetic_libraries are in link_library
foreach synLib $::synthetic_library {
  if { [lsearch -exact $::link_library $synLib] } {
    lappend ::link_library $synLib
  }
}


#######################################################################
# Library Modifications
#######################################################################

# Read in the target libraries before trying to modify
foreach rtLib $::target_library { read_db $rtLib }

source ./initial/script/dontUseLibCells.tcl

