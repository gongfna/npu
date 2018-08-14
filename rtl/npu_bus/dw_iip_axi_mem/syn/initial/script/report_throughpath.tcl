
# Print report header (required for proper HTML generation) 
set rtPerlLineFormater /opt/synopsys/coretools/K-2015.06-SP5/linux64/dware/bin/format_line.pl
echo "Report : check_through_paths"
echo "Design : $rtCurrentDesign"
echo "Version: $product_version"
echo ****************************
echo ""

set perlExec $::synopsys_root/$::sh_arch/bin/snpsperl
if {![file exists $perlExec]} {
  set perlExec [file join /opt/synopsys/coretools/K-2015.06-SP5/linux64/dware/bin snpsperl]
}

echo [exec $perlExec $rtPerlLineFormater  "%-25s" "'Input Port'" "%-25s"  "'Output Port'"]
echo [exec $perlExec $rtPerlLineFormater  "%-25s" "------------------------" "%-25s"  "------------------------"]

foreach_in_collection rtOutput [all_outputs] {
  set rtOutName [get_attribute $rtOutput name]
  set rtFanin [all_fanin -flat -to $rtOutput -startpoints_only]
  # filter out any pins, leaving just the ports 
  if { [sizeof_collection $rtFanin] } {
    # DC returns an error if the find is empty, but catch returns 0. ???
    redirect /dev/null {set rtFanin [find port \{$rtFanin\}]}
    if { [sizeof_collection $rtFanin] } {
      foreach_in_collection rtInput $rtFanin {
        set rtInName [get_attribute $rtInput name]
        echo [exec $perlExec $rtPerlLineFormater  "%-25s" $rtInName "%-25s" $rtOutName]
      }
    }
  }
}

