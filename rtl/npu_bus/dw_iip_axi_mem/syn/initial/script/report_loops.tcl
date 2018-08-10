  # Check for combinational feedback loops. 
  set rtTmpFile [file join $rtReportDir "${rtCurrentDesign}_tmp.rpt"]
  redirect $rtTmpFile {
    report_timing -loop
  }

  set perlExec $::synopsys_root/$::sh_arch/bin/snpsperl
  if {![file exists $perlExec]} {
    set perlExec [file join /opt/synopsys/coretools/K-2015.06-SP5/linux64/dware/bin snpsperl]
  }
  
echo [exec $perlExec /opt/synopsys/coretools/K-2015.06-SP5/linux64/dware/bin/gen_checks_report.pl cleanup $rtTmpFile]

  # Remove variables.
  unset rtTmpFile
