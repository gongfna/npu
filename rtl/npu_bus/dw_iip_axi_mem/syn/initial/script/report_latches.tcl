# reuse-pragma attr EncryptText {=sDc::encrypt} 

# Count all latches in the design 
redirect /dev/null {
  set latches [all_registers -level_sensitive]
  set rtLatchCount [sizeof_collection $latches]
  set lockupLatchCount 0
  set clockGatingLatchCount 0
  if { $rtLatchCount } {
    set lockupLatchCount [sizeof_collection [filter_collection $latches "scan_lockup==true"]]
    set clockGatingLatchCount [sizeof_collection [filter_collection $latches "clock_gating_logic==true"]]
  }
}

# Print report header (required for proper HTML generation) 
  echo "****************************"
  echo "Report : check_latches"
  echo "Design : DW_axi"
  echo "Version: $product_version"
  echo "****************************"

# Print an indication of how many latches were actually found 
if { $rtLatchCount } {
  echo "The total number of latches in this design = $rtLatchCount"
  echo "Lockup latches in this design              = $lockupLatchCount"
  echo "Clock gating latches in this design        = $clockGatingLatchCount"
} else {
  echo "No latches in the design."
}

unset rtLatchCount
unset lockupLatchCount
unset clockGatingLatchCount
