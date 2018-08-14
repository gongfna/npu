## Analyze the I/O and create an annotation script.
  set RegisteredInputs ""
  set UnRegisteredInputs ""

  set attrFile [file join . constrain script register_attrs.tcl]
  set fid [open $attrFile w]
  puts $fid "# Set attributes defining registered ports.\n"

  set attrCmd "set_attribute -quiet -type boolean"
  set attrName rtIsRegisteredInput

  # Analyze the inputs.
  foreach_in_collection in [all_inputs] {
    set pname [get_attribute $in name]
    set findPort "\[find port \{$pname\}\]"

    set allFanoutCells [all_fanout -from $in -only_cells -flat]
    set nonSeqs [filter_collection $allFanoutCells "@is_sequential!=true"]
    if { [sizeof_collection $nonSeqs] } {
      set attrValue false
    } else {
      set attrValue true
    }

    puts $fid "$attrCmd $findPort $attrName $attrValue"
  }

  set attrName rtIsRegisteredOutput

  # Analyze the outputs.
  foreach_in_collection out [all_outputs] {
    set pname [get_attribute $out name]
    set findPort "\[find port \{$pname\}\]"

    set allFaninCells [all_fanin -to $out -only_cells -flat]
    set nonSeqs [filter_collection $allFaninCells "@is_sequential!=true"]
    if { [sizeof_collection $nonSeqs] } {
      set attrValue false
    } else {
      set attrValue true
    }

    puts $fid "$attrCmd $findPort $attrName $attrValue"
  }

  close $fid

## Now annotate the outputs.
source $attrFile

# Print report header (required for proper HTML generation) 
  echo "****************************"
  echo "Report : check_unregistered_io"
  echo "Design : DW_axi"
  echo "Version: $product_version"
  echo "****************************"
  echo ""



# look for unregistered inputs

  set rtIgnoredInputs [all_inputs]
  set rtUnregisteredInputs [filter_collection [all_inputs] @rtIsRegisteredInput==false]
  set rtRegisteredInputs [filter_collection [all_inputs] @rtIsRegisteredInput==true]
  set rtIgnoredInputs [remove_from_collection $rtIgnoredInputs $rtUnregisteredInputs]
  set rtIgnoredInputs [remove_from_collection $rtIgnoredInputs $rtRegisteredInputs]

  foreach_in_collection rtPort $rtUnregisteredInputs {
    echo "[get_attribute $rtPort name] is not registered at input"
  }

# look for unregistered outputs
  set rtIgnoredOutputs [all_outputs]
  set rtUnregisteredOutputs [filter_collection [all_outputs] @rtIsRegisteredOutput==false]
  set rtRegisteredOutputs [filter_collection [all_outputs] @rtIsRegisteredOutput==true]
  set rtIgnoredOutputs [remove_from_collection $rtIgnoredOutputs $rtUnregisteredOutputs]
  set rtIgnoredOutputs [remove_from_collection $rtIgnoredOutputs $rtRegisteredOutputs]

  foreach_in_collection rtPort $rtUnregisteredOutputs {
    echo "[get_attribute $rtPort name] is not registered at output"
  }

  echo ""
  echo "Inputs:"
  echo "  [sizeof_collection $rtUnregisteredInputs] unregistered"
  echo "  [sizeof_collection $rtRegisteredInputs] registered"
  if { [set rtTmp [sizeof_collection $rtIgnoredInputs]] } {
    echo "  $rtTmp ignored"
  }
  echo ""
  echo "Outputs:"
  echo "  [sizeof_collection $rtUnregisteredOutputs] unregistered"
  echo "  [sizeof_collection $rtRegisteredOutputs] registered"
  if { [set rtTmp [sizeof_collection $rtIgnoredOutputs]] } {
    echo "  $rtTmp ignored"
  }
  echo ""

# cleanup variables created for the report
  unset rtTmp
  unset rtIgnoredInputs
  unset rtUnregisteredInputs
  unset rtRegisteredInputs
  unset rtIgnoredOutputs
  unset rtUnregisteredOutputs
  unset rtRegisteredOutputs
  unset rtPort
