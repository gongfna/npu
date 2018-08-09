
# ===========================================================================
#
#     This confidential and proprietary software may be used only
#     as authorized by a licencing agreement from Synopsys Inc.
#     In the event of publications, the following notice is applicable:
#
#          (C) COPYRIGHT 2003-2011 SYNOPSYS INC.  ALL RIGHTS RESERVED
#
#     The entire notice above must be reproduced on all authorized copies.
#
# ---------------------------------------------------------------------------
# File:         runtest.pm
# Author:       Ray Beechinor
# Date:         Wed Aug 13 14:42:47 BST 2003
# Abstract:     Common Perl functions used by runtest script
# ===========================================================================

package runtest;

$^W=1;                # Turn warnings on
use 5.004;            # -- Insist on Perl version 5.004 or newer for safety
use strict;           # -- Follow rigid variable/subroutine declarations
use File::Basename;   # -- Compute the containing directory of this script
use Exporter();
use vars qw(@ISA @EXPORT @ExportedSubs);
@ISA = qw(Exporter);

@ExportedSubs = qw(&sourceLicenseCheck &fetchModuleName &runDwVipSetup &runtestPreparation &parseCcConstants);
push(@ExportedSubs, qw(&commonVerilogDefines &commonVerilogIncludes &generateVeraPlusargs &generateCcConstants &compileCheckEnvironment &compileVera &manageMCDFile));

push (@ExportedSubs, qw(&generateVrl &generateVshell &runSim &postProcess));
@EXPORT = @ExportedSubs;


use subs qw(&sourceLicenseCheck &fetchModuleName &runDwVipSetup &compile_exit &runtestPreparation &convertPath &parseCcConstants &commonVerilogDefines &commonVerilogIncludes &generateVeraPlusargs &generateCcConstants &compileCheckEnvironment &compileVera &generate_vro &add_include_list &get_file_list_by_ext &generateVrl &generateVshell &generate_proj &runSim &my_system &postProcess &check_completed &check_errors &check_illegal_prog &check_timeouts &act_cert_requested &act_certified &act_recert_requested &act_recertified);

#  local @runtest::inputArray;
#  local @runtest::returnArray;
#  local $runtest::Summary;
#  local $runtest::Pgm;
#  local $runtest::Cwd;
#  local $runtest::RtlDir;
#  local $runtest::VeraDir;
#  local $runtest::Netlist;
#  local $runtest::SdfFile;
#  local $runtest::DumpFile;
#  local $runtest::TestbenchDir;
#  local $runtest::Test;
#  local $runtest::configDirName;
#  local $runtest::ccparams_file;
#  local $runtest::Simulator;
#  local $runtest::testbench; 
#  local $runtest::DesignName;

sub sourceLicenseCheck($$$) {
  my ($licenseString, $rtlSim, $simulator) = @_;
  if (($rtlSim eq "RTL")  and (($simulator ne "vcs") and ($simulator ne "vcsi"))) {
#    `coreConsultant -shell -x "exec \$::sysCmd(rm) -fr .licenseCheck ; if \{[check_license -authorized $licenseString]\} \{exec \$::sysCmd(touch) .licenseCheck \} ; quit"` ;
#    system ("rm -fr rt_shell_command.log");
#    if (! (-e ".licenseCheck")) {
#       die "ERROR - Unable to perform an RTL simulation using $simulator!\n".
#           "RTL simulations on simulators other than VCS require a $licenseString license.\n\n";
#    }
  }
}

sub fetchModuleName() {

  # -/ --------------------------------------------------------------
  # -/ This function grabs the name of the top level design module.
  # -/ Since there is more than one file here now we elimate the shell
  # -/ h2h has named files as _input.v and _strings.v eliminate these
  # -/ --------------------------------------------------------------

  my $waste;
  my $ModName;
  $ModName = `echo ./testbench/test_*.v`;
  chomp $ModName;
  $ModName = (basename $ModName);
  $ModName =~ s/test_//;
  $ModName =~ s/_shell//;
  $ModName =~ s/_input//;
  $ModName =~ s/_strings//;
  ($ModName, $waste) = split ('.v', $ModName);

  return $ModName;
}

sub runDwVipSetup {

   #
   # check if dw_vip_setup has been called already
   #

   system("date");
   my $designware_home = "";

   my $vmtFileName = "vmt_version";
   my $vmt_version = "";
   my @vmtFileContents;

   if (defined $ENV{'DESIGNWARE_HOME'} ) {
     $designware_home = $ENV{'DESIGNWARE_HOME'};
   } else {
     print "ERROR: DESIGNWARE_HOME is not defined.\n";
     compile_exit(2);
   }
   if (!(-e "${designware_home}/bin/dw_vip_setup")) {
     print "ERROR:  dw_vip_setup script not found.  Check setting of DESIGNWARE_HOME.\n";
     compile_exit(2);
   }

   #
   # Check if VRO_CACHE_DIR is defined.
   #
   unless(defined $ENV{'VRO_CACHE_DIR'}) {
     #    
     # Check if DESIGNWARE_HOME is a writable location
     if(system("touch $designware_home/vip/xx_dwh_writable.xx > /dev/null 2>&1")) {
       print "\nWARNING: Env variable VRO_CACHE_DIR is not defined and DESIGNWARE_HOME is not writable\n";
       print "         Setting Env variable VRO_CACHE_DIR to $ENV{VERA_VRO_CACHE} - compiled vip will be placed here\n";
       $ENV{VRO_CACHE_DIR} = $ENV{VERA_VRO_CACHE};
     } else {
       system("\rm -rf $designware_home/vip/xx_dwh_writable.xx");
     }
   }


   if (!(-e "$vmtFileName")) {
     print "ERROR: vmt_version file missing!\n";
     compile_exit(2);
   } else {
   # open the file
     open(VMT_VERSION, "<$vmtFileName");
     @vmtFileContents = <VMT_VERSION>;
     close(VMT_VERSION);
     chomp(@vmtFileContents);
     $vmt_version = $vmtFileContents[0];
   }
   if(-f "../scratch/.dw_vip.cfg")
   {
      # filter .dw_vip.cfg to get a model list file
      system("grep '^%MOD' ../scratch/.dw_vip.cfg | sed 's:%MOD ::' | sed 's:amba:-v:' > vmt_model_list.tmp");

      # compare with the actual model list file
      if(system("diff vmt_model_list.tmp vmt_model_list > vmt_model_list.diff"))
      {
         printf STDERR "calling dw_vip_setup to refresh headers in ../scratch \n";
         system("$designware_home/bin/dw_vip_setup -path ../scratch -vmt $vmt_version -nos -a -m vmt_model_list");
      }
      else
      {
         printf STDERR "skipping dw_vip_setup call. Headers already in ../scratch\n";
      }
   }
   else
   {
      printf STDERR "calling dw_vip_setup to create headers in ../scratch \n";
      if (system("$designware_home/bin/dw_vip_setup -path ../scratch -vmt $vmt_version -nos -a -m vmt_model_list"))
      {
        compile_exit(2);
      }
   }
   system("rm -f vmt_model_list.*");
   system("date");
}

sub runtestPreparation() {

  @runtest::inputArray = @_;

 
  print STDERR "\n\n+------------------------+\n| Testbench Preparation  |".
               "\n+------------------------+\n\n";
  print STDERR "(this section of runtest.log supplied by runtest script)\n\n";

  # -- Keep a safe copy of the Invoke command line for a summary later,
  # -- delete some less useful parts of it
  $main::Summary = $main::Invoke." ...";
  $main::Summary =~ s/--rtl-dir\s+\S+\s*//g;
  $main::Summary =~ s/--timeout\s+\S+\s*//g;
  $main::Summary =~ s/(--test\s+\S+)\s*/sprintf("%-24s",$1) /ge;


  $main::Invoke =~ s/ --/\\\n            --/g;
  print STDERR "$main::Pgm: To recreate the run from this point for debug, do the following\n";
  print STDERR "$main::Pgm:    % cd ".`pwd`;
  print STDERR "${main::Pgm}:    % ${main::Invoke} \n\n";

  chdir "./$main::Test" or die "$main::Pgm: ERROR - Cannot cd to test subdirectory ./$main::Test";
  print STDERR "$main::Pgm: Changed Directory to ./$main::Test - look here for detailed logfiles/waves/results\n";

  # -- If it's midnight, wait a moment to avoid licensing problems
  my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
  sleep 120 if ($hour == 23 and $min == 59);
  sleep 60 if ($hour == 0 and $min == 0);

  # -- Set $Cwd now and we will use that as a reference point
  $main::Cwd = `pwd`; chomp $main::Cwd;
  $main::coreKit = (dirname (dirname $main::Cwd));

  $main::RtlDir = convertPath($main::RtlDir);
  $main::VeraDir = convertPath($main::VeraDir);
  $main::Netlist = convertPath($main::Netlist);
  $main::SdfFile = convertPath($main::SdfFile);
  $main::DumpFile = convertPath($main::DumpFile);
  $main::TestbenchDir = convertPath($main::TestbenchDir);
  $main::Test = convertPath($main::Test);

  $main::configDirName = (basename $main::coreKit);
  $main::ccparams_file = "<coreKit>/../${main::configDirName}/src/${main::DesignName}_cc_constants.v";
  $main::ccparams_file = convertPath($main::ccparams_file);
  print STDERR "\n$main::Pgm: coreKit in file:".(dirname (dirname $main::Cwd))."\n";
  print STDERR "$main::Pgm: runtest in file:".(dirname $main::Cwd)."\n";
  print STDERR "$main::Pgm: test is in file:$main::Cwd\n";

  # -- Simulator option should be case-insensitive - force to lower-case
  $main::Simulator = lc($main::Simulator);

  if ( $main::DumpFile =~ /\.(vcd|vpd)$/ ) {
    if (($main::Simulator eq "vcs") or ($main::Simulator eq "vcsi")) {
      $main::DumpFile =~ s/\.vcd$/\.vpd/;
    } else {
      $main::DumpFile =~ s/\.vpd$/\.vcd/;
    }
  } else {
    die "$main::Pgm: ERROR - Waves file extension not correct - should be XXXX.vcd or XXXX.vpd\n";
  }
  
  # -- Simulation Source
  $main::testbench = "$main::TestbenchDir/test_${main::DesignName}.v";

  # extract the bus type if possible

  my ($bin1, $busname, $bin2) = split('_', $main::DesignName);
  $main::bus = $busname;
  if (($busname ne 'ahb') && ($busname ne 'apb') && ($busname ne 'axi')) {
    $main::bus = "ahb"
  }
}

sub convertPath($) {

  # -/ --------------------------------------------------------------
  # -/ ConvertPath(path) determine the absolute root of the current
  # -/ and converts the supplied dirpath/filepath to relative to the
  # -/ test directory where the simulation is being run.
  # -/ All default file locations are calculated relative to the
  # -/ test directory, so we need to adjust those provided from the
  # -/ invoking directory and migrate any absolute ones to relative
  # -/ if possible.
  # -/
  # -/ This script is assumed to be located in $coreKit/sim and we
  # -/ have now chdir'ed one level further down into a Test
  # -/ subdirectory so to find the coreKit we go two levels up using
  # -/ (dirname(dirname $Cwd))
  # -/
  # -/ The routine also removes duplicate or trailing slashes to keep
  # -/ VCS happy Note - the routine also promises to convert <undef>
  # -/ to <undef>
  # -/ --------------------------------------------------------------
  my $path = shift;
  return undef unless defined($path);
  $path =~ s|^<coreKit>/|$main::coreKit/|;
  $path =~ s|^$main::coreKit/sim/|../|;
  $path =~ s|^$main::coreKit/|../../|;
  $path =~ s|//|/|g;
  $path =~ s|/$||;
  return $path;
}


sub parseCcConstants($) {

  my $ccparams_file = shift;
  my %ccparams;

  open (CCPARAMS, "< $ccparams_file") || die "ERROR - Can't open $ccparams_file ($!)\n";


  while (<CCPARAMS>) {
    if (/^\`define\s+(\S+)\s+(.+)/) {
      my ($param,$value) = ($1,$2);
      # -- Got param - convert it from verilog `define format number to a string
      # -- containing a vera-format number of the same radix e.g. NN`bXXXX -> 0xXXXX
      $value =~ s/^([0-9]*)\'h([0-9a-fA-F]+)$/0x$2/;
      $value =~ s/^([0-9]*)\'d[0]*([0-9]+)$/$2/;
      $value =~ s/^([0-9]*)\'o([0-7]+)$/0$2/;
      $value =~ s/^([0-9]*)\'b([0-1]+)$/0b$2/;
      $ccparams{$param} = $value;
    }
  }
  close CCPARAMS || die "ERROR - Failed to close $ccparams_file after read ($!)\n";

  return(%ccparams);
}

sub commonVerilogDefines($) {
  my $busType = shift;

if (($main::Simulator eq "vcs") or ($main::Simulator eq "mti_verilog") or ($main::Simulator eq "verilog_xl") or ($main::Simulator eq "nc_verilog") or ($main::Simulator eq "vcsi")) {

  print STDERR "$main::Pgm: Creating simulation command file: \n$main::Pgm:   file:$main::Cwd/$main::simcommand\n";
  open(SCF,">$main::simcommand") or
    die "$main::Pgm: ERROR -  couldn't open simulation command file $main::simcommand for write\n";

  # -- print header to file
  printf SCF "// -----------------------------------------------------------------------\n";
  printf SCF "// Simulation Control file produced by %s - do not edit\n",$main::Pgm;
  printf SCF "// -----------------------------------------------------------------------\n";
  printf SCF "\n";
 
  # -- VCS command
  if($main::Simulator eq "vcs") {
    printf SCF "+vcs+lic+wait\n";
    printf SCF "-notice\n";
  }

  # -- Misc commands
  printf SCF "+v2k\n";  
  printf SCF "+nowarnTFNPC\n";
  printf SCF "+warn=noPCWM\n";
  printf SCF "+libext+.v+.V\n";
  printf SCF "+sdfverbose\n";
  printf SCF "+neg_tchk\n";
  printf SCF "+plusarg_save\n";
  printf SCF "+warn=noTMR\n";
      
  if ($main::Period) {
      printf SCF "+define+PERIOD=$main::Period\n";
  }
  if ($main::Period2) {
      printf SCF "+define+PERIOD2=$main::Period2\n";
  }

  if ($main::Timeout) {
    printf SCF "+define+TIMEOUT=".($main::Period * $main::Timeout)."\n";
  }
  printf SCF "+define+DEBUG_LEVEL=$main::VeraDebugLevel\n";
  if ($main::Coverage) {
    printf SCF "+define+CODE_COVERAGE\n";
  }

  # -- RTL or Netlist simulation
  if ($main::RtlSim eq "RTL") {
    printf SCF "+define+RTL\n";
    printf SCF "+delay_mode_zero\n";
  } else {
    printf SCF "+define+NETLIST\n";
  }
  # The DW_ahb_dmac needs conditional instantiation of certain testbench components.
  # However, the CC params that control this are always defined, so we need to create
  # new ones if required
  if ($main::DesignName eq "DW_ahb_dmac") {
    if ($main::ccparams{'DMAH_M1_AHB_LITE'} eq 1) {
      printf SCF "+define+M1_AHB_LITE\n";
    }
    if ($main::ccparams{'DMAH_M2_AHB_LITE'} eq 1) {
      printf SCF "+define+M2_AHB_LITE\n";
    }
    if ($main::ccparams{'DMAH_M3_AHB_LITE'} eq 1) {
      printf SCF "+define+M3_AHB_LITE\n";
    }
    if ($main::ccparams{'DMAH_M4_AHB_LITE'} eq 1) {
      printf SCF "+define+M4_AHB_LITE\n";
    }
    if ($main::ccparams{'DMAH_NUM_HS_INT'} ne 0) {
      printf SCF "+define+NUM_HS_NZ\n";
    }
    if ($main::ccparams{'DMAH_NUM_MASTER_INT'} eq 2) {
      printf SCF "+define+NUM_MI_GE2\n";
    }
    if ($main::ccparams{'DMAH_NUM_MASTER_INT'} eq 3) {
      printf SCF "+define+NUM_MI_GE2 +define+NUM_MI_GE3\n";
    }
    if ($main::ccparams{'DMAH_NUM_MASTER_INT'} eq 4) {
      printf SCF "+define+NUM_MI_GE2 +define+NUM_MI_GE3 +define+NUM_MI_GE4\n";
    }
  }

  # -- common to all apb designs
  if ($busType eq "apb") {
    printf SCF "+define+APB_CLK_RATIO=$main::ApbClockRatio\n";
  }

 # -- SDF annotation
  if ($main::SdfFile) {
    if(($main::Simulator eq "vcs") or ($main::Simulator eq "vcsi")) {
      printf SCF "+csdf+precompile\n";
      printf SCF "+define+SDF_FILE=\"\"$main::SdfFile\"\"\n";
      if($main::SdfLevel eq 'max') {
        printf SCF "+define+SDF_LEVEL=\"\"MAXIMUM\"\"\n";
      } elsif($main::SdfLevel eq 'typ') {
        printf SCF "+define+SDF_LEVEL=\"\"TYPICAL\"\"\n";
      } else {
        printf SCF "+define+SDF_LEVEL=\"\"MINIMUM\"\"\n";
      }
    } else {
      printf SCF "+define+SDF_FILE=\\\"$main::SdfFile\\\"\n";
    }
  }

  # -- Dump file control
  if ($main::DumpEnabled) {
    if (defined $main::DumpDepth) {
      printf SCF "\n// What waves to record\n\n";
      if ((($main::Simulator eq "vcs") or ($main::Simulator eq "vcsi")) and ($main::DumpFile =~ /\.vpd$/)) {
        printf SCF "+vpdfile+$main::DumpFile\n";
      } else {
        printf SCF "+define+DUMP_FILE=\\\"$main::DumpFile\\\"\n";
      }
      printf SCF "+define+DUMP_DEPTH=$main::DumpDepth\n";
    } else {
      printf SCF "\n// Waves recording not enabled - no --dump-depth N specified\n\n";
      printf SCF "//+define+DUMP_DEPTH=0\n";
    }
  } else {
    printf SCF "\n// Waves recording not selected\n";
    printf SCF "//+define+DUMP_DEPTH=0\n";
  }

  # -- define a macro if it is a netlist
  if (!($main::RtlSim eq "RTL")) {
    printf SCF "\n// Tell the testbench that we have a netlist\n\n";
    printf SCF "+define+GATE_LEVEL_NETLIST\n";
  }

  # -- Construct the library switches from $LibDir and $LibFile
  # -- $LibDir, obtained from --lib-dir, is a space-separated list of directories.
  # -- We'll make a $libswitches by prepending "-y " to each of the directories.
  my $file_missing=0;

  my @libdirs = split(",",$main::LibDir);
  if (exists $ENV{SYNOPSYS} && ($main::RtlSim eq "GTECH")) {
    if ($ENV{SYNOPSYS} ne "") {
      if ( -d "$ENV{SYNOPSYS}/packages/gtech/src_ver" ) {
        push @libdirs,"$ENV{SYNOPSYS}/packages/gtech/src_ver";
      } else {
        print STDERR "\n$main::Pgm: ERROR - Env variable \$SYNOPSYS is not correctly set - ($ENV{SYNOPSYS})";
        print STDERR "\n                    Unable to find required directory - \$SYNOPSYS/packages/gtech/src_ver";
        print STDERR "\n                    If using SYNOPSYS Synthesis Tools, set Env variable \$SYNOPSYS to a valid location.";
        print STDERR "\n                    If NOT using SYNOPSYS Synthesis Tools, unset Env variable \$SYNOPSYS.\n";
        die "\n$main::Pgm: FATAL - $file_missing required files/directories missing. $main::Pgm terminating\n";
      }
    }
  }

  if (exists $main::ccparams{'USE_FOUNDATION'}) {
    if ($main::ccparams{'USE_FOUNDATION'} eq 1) { 
      push @libdirs,"$ENV{SYNOPSYS}/dw/sim_ver";
    }
  }


  my $libswitch= "";
  foreach (@libdirs) {
    $_ = convertPath($_);
    printf SCF "-y $_\n";
    unless (-d "$_") {
      $file_missing++;
      print STDERR "\n$main::Pgm: ERROR - directory $_ is required but missing.\n";
    }
  }


  # -- $LibFile, obtained from --lib-file, is a space-separated list of files.
  # -- We'll add to $libswitches by appending "-v " to each of the files
  if ($main::LibFile) {
    my @libfiles = split(",",$main::LibFile);
    foreach(@libfiles) {
      $_ = $main::LibDir."/".$_;
      $_ = convertPath($_);
      printf SCF "-v $_\n";
    }
  }

  close SCF or die "$main::Pgm: ERROR - failed to close command file $main::simcommand after write\n";
  die "$main::Pgm: FATAL - $file_missing required files/directories missing. $main::Pgm terminating\n" if $file_missing;
 } else {
  die "$main::Pgm: FATAL - $main::Simulator is unsupported\n";
 }

}

sub commonVerilogIncludes($) {

  my $busType = shift;
  if (-e ${main::simcommand}) {
    open(RCB,">>${main::simcommand}") or
    die "$main::Pgm: ERROR -  couldn't open simulation command file $main::simcommand for write\n" 
  } else {
    open(RCB,">${main::simcommand}") or
    die "$main::Pgm: ERROR -  couldn't open simulation command file $main::simcommand for write\n" 
  }


  printf RCB "\n// -----------------------------------------------------------------------\n";
  printf RCB "// Simulation Source files and include directories\n";
  printf RCB "// -----------------------------------------------\n\n";


  printf RCB "$main::testbench\n\n";

  if ($main::RtlSim eq "RTL") {
    print RCB "-f ${main::RtlDir}/${main::DesignName}.lst\n";
  } else {
    printf RCB "$main::Netlist\n\n";
  }

  printf RCB "+incdir+.\n";
  printf RCB "-y .\n\n";
  printf RCB "+incdir+$main::RtlDir\n";
  printf RCB "-y $main::RtlDir\n\n";
  printf RCB "+incdir+$main::TestbenchDir\n";
  printf RCB "-y $main::TestbenchDir\n\n";

  if ($main::DesignName eq 'DW_apb_uart') {
    printf RCB "$main::TestbenchDir/legacy/src/legacy_DW_apb_uart.v\n\n";
  }
  if ($main::DesignName eq 'DW_ahb') {
  } 
  elsif ($main::DesignName eq 'DW_apb') {
    # -- Source files & directories for DW_apb design
    printf RCB "./DW_ahb_cc_constants.v\n\n";
    printf RCB "$main::TestbenchDir/ahb/src/ahb_wrapper.v\n\n";
    printf RCB "+incdir+$main::TestbenchDir/ahb/src\n";
    printf RCB "-y $main::TestbenchDir/ahb/src\n\n";
  }
  elsif ($main::DesignName eq "DW_ahb_dmac") {
    printf RCB "-f $main::TestbenchDir/ahb.lst\n\n";
  }
  elsif ($main::DesignName eq "DW_ahb_h2h") {
    printf RCB "$main::TestbenchDir/ahb_wrapper.v\n\n";
  } 
  elsif ($main::DesignName eq "DW_ahb_eh2h" ||
         $main::DesignName eq "DW_axi_x2h") {
    #printf RCB "$main::TestbenchDir/eh2h_wrapper.v\n\n";
    printf RCB "$main::TestbenchDir/eh2h_DW_ahb.tokens.v\n\n";
  }
  elsif ($busType eq 'apb') {
    printf RCB "$main::TestbenchDir/ahb/src/DW_ahb_cc_constants.v\n\n";
    printf RCB "$main::TestbenchDir/ahb/src/ahb_wrapper.v\n\n";
    printf RCB "+incdir+${main::TestbenchDir}/ahb/src\n";
    printf RCB "-y ${main::TestbenchDir}/ahb/src\n\n";
    printf RCB "./DW_apb_cc_constants.v\n\n";
    printf RCB "${main::TestbenchDir}/apb/src/apb_wrapper.v\n\n";
    printf RCB "+incdir+${main::TestbenchDir}/apb/src\n";
    printf RCB "-y ${main::TestbenchDir}/apb/src\n\n";
 } 
 elsif ($busType eq 'ahb') {

    printf RCB "./DW_ahb_cc_constants.v\n\n";
    printf RCB "${main::TestbenchDir}/ahb/src/ahb_wrapper.v\n\n";
    printf RCB "+incdir+${main::TestbenchDir}/ahb/src\n";
    printf RCB "-y ${main::TestbenchDir}/ahb/src\n\n";
  }
 
  close RCB or die "$main::Pgm: ERROR - failed to close command file $main::simcommand after write\n";

}

sub generateVeraPlusargs ($) {
  my $Design = shift;

  my $file_missing=0;
 
  my ($bin, $bus, $bin2) = split('_', $Design);
  if (($bus ne 'ahb') && ($bus ne 'apb') && ($bus ne 'axi')) {
    $bus = "ahb";
  }
  # -- Open file for writing
  $main::plusargs = "config.ini";
  print STDERR "${main::Pgm}: Creating plusargs simulation file: \n${main::Pgm}:   file:${main::Cwd}/${main::plusargs}\n";
  open(VPF,">$main::plusargs") or die "$main::Pgm: ERROR -  couldn't open plusargs simulation file $main::plusargs for write\n";

  # -- print header to file
  printf VPF "// -----------------------------------------------------------------------\n";
  printf VPF "// Vera plusarg simulation file produced by %s - do not edit\n",$main::Pgm;
  printf VPF "// -----------------------------------------------------------------------\n";
  printf VPF "\n";
  printf VPF "+nowarnTFNPC\n";
  printf VPF "+nowarnTFMPC\n";
  printf VPF "+nowarnTMREN\n";
  printf VPF "+nowarnLDSNN\n";
  printf VPF "+nowarnOPTCHK\n";
  printf VPF "+nowarnLIBNOU\n";

  printf VPF "+debug_level=${main::VeraDebugLevel}\n";

  # -- Plusargs common to all designs
  printf VPF "+vera_pload=test_${main::DesignName}.proj\n";
  if ($main::Period)  { printf VPF "+PERIOD=${main::Period}\n"; }
  if ($main::Period)  { printf VPF "+PERIOD2=${main::Period2}\n"; }
  if ($main::Timeout) { printf VPF "+TIMEOUT=".(${main::Period} * ${main::Timeout})."\n"; }

 printf VPF "+enable_coverage=$main::EnCovMon\n";
  if ($main::RtlSim eq "RTL") {
    printf VPF "+netlist=0\n";
  } else {
    printf VPF "+netlist=1\n";
  }

  if($Design eq "DW_ahb") {

    # -- Plusargs for the DW_ahb design
    printf VPF "+ahb_cc_filename=$main::ccparams_file\n\n";
  }
  elsif($Design eq "DW_apb") {

    # -- Plusargs for the DW_apb design
    print  VPF "+apb_cc_filename=$main::ccparams_file\n";
    print  VPF "+ahb_cc_filename=./DW_ahb_cc_constants.v\n";
    printf VPF "+apb_clk_ratio=${main::ApbClockRatio}\n";
  }
  elsif ($Design eq "DW_ahb_dmac") {
    printf VPF "+cc_filename=${main::ccparams_file}\n\n";
  }
  elsif ($Design eq "DW_axi") {
    printf VPF "+cc_filename=${main::ccparams_file}\n\n";
  }
  elsif($bus eq "apb") {

    # -- Plusargs for APB peripherals
    printf VPF "+apb_periph_cc_filename=$main::ccparams_file\n\n";
    printf VPF "+apb_cc_filename=./DW_apb_cc_constants.v\n";
    printf VPF "+ahb_cc_filename=../testbench/ahb/src/DW_ahb_cc_constants.v\n\n";
  }
  elsif($bus eq "ahb") {
    # -- Plusargs for AHB peripherals
    printf VPF "+ahb_periph_cc_filename=$main::ccparams_file\n\n";
    printf VPF "+ahb_cc_filename=./DW_ahb_cc_constants.v\n\n";
  }

  close VPF or die "$main::Pgm: ERROR - failed to close command file $main::plusargs after write\n";
  die "$main::Pgm: FATAL - $file_missing required files/directories missing. $main::Pgm terminating\n" if $file_missing;

}

sub generateCcConstants($) {

  my $Design = shift;

  my ($bin, $bus, $bin2) = split('_', $Design);
  if (($bus ne 'ahb') && ($bus ne 'apb') && ($bus ne 'axi')) {
    $bus = "ahb";
  }

  # -/ --------------------------------------------------------------
  # -/ This function is used to generate a cc_constants file for the
  # -/ DW_ahb or DW_apb designs. The file generated by this function
  # -/ takes presedence over the existing cc_constants file.
  # -/ --------------------------------------------------------------

  if ($Design eq 'DW_apb') {

    # -- Bridge start and end address params from DW_apb_cc_constants.v
    # -- This script assumes these params already validated in cC plugin
    # -- ie (1) EA>SA, (2) (EA-SA) is legal, (3) (SA+(0x100000000-EA))>=4k
    #
    # -- Calculate where 1k slots for arbiter, slave (2 regions) should go

    my ($arbiter,$slave_r1,$slave_r2);
    my $apb_start = eval($main::ccparams{'R0_APB_SA'});
    if ($apb_start  >= 4096) {
      ($arbiter, $slave_r1, $slave_r2) = (0x00000000,0x00000400,0x00000c00);
    } elsif ($apb_start >= 2048) {
      ($arbiter, $slave_r1, $slave_r2) = (0x00000000,0x00000400,0xfffffc00);
    } elsif ($apb_start == 1024) {
      ($arbiter, $slave_r1, $slave_r2) = (0x00000000,0xfffff400,0xfffffc00);
    } elsif ($apb_start == 0) {
      ($arbiter, $slave_r1, $slave_r2) = (0xfffff000,0xfffff400,0xfffffc00);
    } else {
      die "$main::Pgm: Illegal value $apb_start for Apb start address R0_APB_SA";
    }

    # -- Generate an override DW_ahb_cc_constants file in the local directory.
    # -- This makes the DW_ahb instance in the testbench match up with the
    # -- unpacked configuration of the DW_apb under test in the databus width,
    # -- endiannenss and slave decode address region areas

    print STDERR "$main::Pgm: Creating override DW_ahb_cc_constants file: \n$main::Pgm:   file:$main::Cwd/DW_ahb_cc_constants.v\n";

    my $DW_ahb_default_params = "$main::TestbenchDir/ahb/src/DW_ahb_cc_constants.v";
    my $DW_ahb_override_params = "./DW_ahb_cc_constants.v";
    open(AHB_DEFAULT_PARAMS,"< $DW_ahb_default_params") || die "$main::Pgm: ERROR - Can't open $DW_ahb_default_params ($!)\n";
    open(AHB_OVERRIDE_PARAMS,"> $DW_ahb_override_params") || die "$main::Pgm: ERROR - Can't open $DW_ahb_override_params ($!)\n";
    while (<AHB_DEFAULT_PARAMS>) {
      if (/^\s*\`define\s+AHB_DATA_WIDTH\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'AHB_DATA_WIDTH'};
      } elsif (/^\s*\`define\s+BIG_ENDIAN\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define BIG_ENDIAN %d\n",$main::ccparams{'BIG_ENDIAN'};
      } elsif (/^\s*\`define\s+R1_N_SA_0\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define R1_N_SA_0 32'h%08x\n",$arbiter;
      } elsif (/^\s*\`define\s+R1_N_EA_0\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define R1_N_EA_0 32'h%08x\n",$arbiter+1023;
      } elsif (/^\s*\`define\s+R1_N_SA_2\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define R1_N_SA_2 32'h%08x\n",$slave_r1;
      } elsif (/^\s*\`define\s+R1_N_EA_2\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define R1_N_EA_2 32'h%08x\n",$slave_r1+1023;
      } elsif (/^\s*\`define\s+R2_N_SA_2\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define R2_N_SA_2 32'h%08x\n",$slave_r2;
      } elsif (/^\s*\`define\s+R2_N_EA_2\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define R2_N_EA_2 32'h%08x\n",$slave_r2+1023;
      } elsif (/^\s*\`define\s+R1_N_SA_1\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define R1_N_SA_1 32'h%08x\n",eval($main::ccparams{'R0_APB_SA'});
      } elsif (/^\s*\`define\s+R1_N_EA_1\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define R1_N_EA_1 32'h%08x\n",eval($main::ccparams{'R0_APB_EA'});
      } else {
        print AHB_OVERRIDE_PARAMS $_;
      }
    }
    close AHB_DEFAULT_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_ahb_default_params after read ($!)\n";
    close AHB_OVERRIDE_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_ahb_override_params after write ($!)\n";
  }
  elsif ($Design eq "DW_ahb_dmac") {
    # Loop round all the AHB peripherals and open their cc_params files.
    # Change the parameters of interest, and write to a new file.  Then copy
    # this file back to overwrite the original
    my $AhbNumber;
    foreach $AhbNumber (1..5){
      my $DW_ahb_original_params = "${main::TestbenchDir}/ahb".$AhbNumber."/src/DW_ahb_cc_constants.v";
      my $DW_ahb_new_params = "${main::TestbenchDir}/ahb".$AhbNumber."/src/DW_ahb_cc_constants.v_new";

      open(AHB_ORIGINAL_PARAMS,"< $DW_ahb_original_params") || die "$main::Pgm: ERROR - Can't open $DW_ahb_original_params ($!)\n";
      open(AHB_NEW_PARAMS,"> $DW_ahb_new_params") || die "$main::Pgm: ERROR - Can't open $DW_ahb_new_params ($!)\n";

      while (<AHB_ORIGINAL_PARAMS>) {
        if (/^\s*\`define\s+AHB_DATA_WIDTH\s+/) {
          # Deal with the data width parameters,  The source for the new value depends on which
          # AHB bus we are dealing with
          # AHB5 is the command bus, and this is parameterised with DMAH_S_DATA_WIDTH
          if($AhbNumber == 5){
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_S_HDATA_WIDTH'};
          }
          elsif($AhbNumber == 1){
            # AHB1 is the bus with 15 slaves.  This is attached to master interface 1, but can
            # be randomly connected (by the Vera) to any other interface that has the same data
            # width and AHB Lite setting
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_M1_HDATA_WIDTH'};
          }
          elsif($AhbNumber == 2){
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_M2_HDATA_WIDTH'};
          }
          elsif($AhbNumber == 3){
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_M3_HDATA_WIDTH'};
          }
          elsif($AhbNumber == 4){
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_M4_HDATA_WIDTH'};
          }
        }
        elsif (/^\s*\`define\s+BIG_ENDIAN\s+/) {
          printf AHB_NEW_PARAMS "`define BIG_ENDIAN %0d\n",$main::ccparams{'DMAH_BIG_ENDIAN'};
        }
        else {
          print AHB_NEW_PARAMS $_;
        }
      }
      close AHB_ORIGINAL_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_ahb_original_params after read ($!)\n";
      close AHB_NEW_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_ahb_new_params after write ($!)\n";
      # Now move the new param file back to the original one
      system("mv -f $DW_ahb_new_params $DW_ahb_original_params");
    }

    # Now do it all again for the ahb lite busses.  There are only 4 of them
    foreach $AhbNumber (1..4){
      my $DW_ahb_original_params = "$main::TestbenchDir/ahb_lite".$AhbNumber."/src/DW_ahb_cc_constants.v";
      my $DW_ahb_new_params = "$main::TestbenchDir/ahb_lite".$AhbNumber."/src/DW_ahb_cc_constants.v_new";

      open(AHB_ORIGINAL_PARAMS,"< $DW_ahb_original_params") || die "$main::Pgm: ERROR - Can't open $DW_ahb_original_params ($!)\n";
      open(AHB_NEW_PARAMS,"> $DW_ahb_new_params") || die "$main::Pgm: ERROR - Can't open $DW_ahb_new_params ($!)\n";

      while (<AHB_ORIGINAL_PARAMS>) {
        if (/^\s*\`define\s+AHB_DATA_WIDTH\s+/) {
          # Deal with the data width parameters,  The source for the new value depends on which
          # AHB bus we are dealing with
          # AHB5 is the command bus, and this is parameterised with DMAH_S_DATA_WIDTH
          if($AhbNumber == 5){
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_S_HDATA_WIDTH'};
          }
          elsif($AhbNumber == 1){
            # AHB1 is the bus with 15 slaves.  This is attached to master interface 1, but can
            # be randomly connected (by the Vera) to any other interface that has the same data
            # width and AHB Lite setting
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_M1_HDATA_WIDTH'};
          }
          elsif($AhbNumber == 2){
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_M2_HDATA_WIDTH'};
          }
          elsif($AhbNumber == 3){
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_M3_HDATA_WIDTH'};
          }
          elsif($AhbNumber == 4){
            printf AHB_NEW_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'DMAH_M4_HDATA_WIDTH'};
          }
        }
        elsif (/^\s*\`define\s+BIG_ENDIAN\s+/) {
          printf AHB_NEW_PARAMS "`define BIG_ENDIAN %0d\n",$main::ccparams{'DMAH_BIG_ENDIAN'};
        }
        else {
          print AHB_NEW_PARAMS $_;
        }
      }
      close AHB_ORIGINAL_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_ahb_original_params after read ($!)\n";
      close AHB_NEW_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_ahb_new_params after write ($!)\n";
      # Now move the new param file back to the original one
      system("mv -f $DW_ahb_new_params $DW_ahb_original_params");
    }
  }
  elsif($bus eq 'apb') {

    # -- Generate an override DW_apb_cc_constants file in the local
    # -- directory.This makes the DW_apb instance in the testbench
    # -- match up with the unpacked configuration of the peripheral
    # -- under test in the databus width, endiannenss and slave decode
    # -- address region areas

    print STDERR "$main::Pgm: Creating override DW_apb_cc_constants file: \n$main::Pgm:   file:$main::Cwd/DW_apb_cc_constants.v\n";
    my $DW_apb_default_params = "$main::TestbenchDir/apb/src/DW_apb_cc_constants.v";
    my $DW_apb_override_params = "./DW_apb_cc_constants.v";
    open(APB_DEFAULT_PARAMS,"< $DW_apb_default_params") || die "$main::Pgm: ERROR - Can't open $DW_apb_default_params ($!)\n";
    open(APB_OVERRIDE_PARAMS,"> $DW_apb_override_params") || die "$main::Pgm: ERROR - Can't open $DW_apb_override_params ($!)\n";
    while (<APB_DEFAULT_PARAMS>) {
      if (/^\s*\`define\s+APB_DATA_WIDTH\s+/) {
        printf APB_OVERRIDE_PARAMS "`define APB_DATA_WIDTH %0d\n",$main::ccparams{'APB_DATA_WIDTH'};
      } else {
        print APB_OVERRIDE_PARAMS $_;
      }
    }
    close APB_DEFAULT_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_apb_default_params after read ($!)\n";
    close APB_OVERRIDE_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_apb_override_params after write ($!)\n";
  }
  elsif($bus eq 'ahb') {

    # -- Generate an override DW_ahb_cc_constants file in the local
    # -- directory. This makes the DW_ahb instance in the testbench
    # -- match up with the unpacked configuration of the peripheral
    # -- under test in the databus width, endiannenss and slave
    # -- decode address region areas

    print STDERR "$main::Pgm: Creating override DW_ahb_cc_constants file: \n$main::Pgm:   file:$main::Cwd/DW_ahb_cc_constants.v\n";
    my $DW_ahb_default_params = "$main::TestbenchDir/ahb/src/DW_ahb_cc_constants.v";
    my $DW_ahb_override_params = "./DW_ahb_cc_constants.v";
    print STDERR "default params is $DW_ahb_default_params";
    open(AHB_DEFAULT_PARAMS,"< $DW_ahb_default_params") || die "$main::Pgm: ERROR - Can't open $DW_ahb_default_params ($!)\n";
    open(AHB_OVERRIDE_PARAMS,"> $DW_ahb_override_params") || die "$main::Pgm: ERROR - Can't open $DW_ahb_override_params ($!)\n";
    while (<AHB_DEFAULT_PARAMS>) {
      if (/^\s*\`define\s+AHB_DATA_WIDTH\s+/) {
        printf AHB_OVERRIDE_PARAMS "`define AHB_DATA_WIDTH %0d\n",$main::ccparams{'AHB_DATA_WIDTH'};
      } elsif (/^\s*\`define\s+BIG_ENDIAN\s+/) {
        if ($main::ccparams{'BIG_ENDIAN'}) {
          printf AHB_OVERRIDE_PARAMS "`define BIG_ENDIAN %0d\n",$main::ccparams{'BIG_ENDIAN'};
        } else {
          printf AHB_OVERRIDE_PARAMS "`define BIG_ENDIAN 0\n";
        }
      } else {
        print AHB_OVERRIDE_PARAMS $_;
      }
    }
    close AHB_DEFAULT_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_ahb_default_params after read ($!)\n";
    close AHB_OVERRIDE_PARAMS || die "$main::Pgm: ERROR - Failed to close $DW_ahb_override_params after write ($!)\n";
  }




}
sub manageMCDFile() {
    # This subroutine creates a 'vmt_mcd.cfg' file in the test directory if required.
    # First step is to always remove any old vmt_mcd.cfg file
    `rm -fr vmt_mcd.cfg`;
    # If GenerateMCDFile is 1, create the .cfg file
    if ($::main::GenerateMCDFile == 1) {
      `touch vmt_mcd.cfg`;
    }
}


sub compileCheckEnvironment() {
    #
    # Check VERA_HOME variable and Vera installation
    #
    if ( defined $ENV{'VERA_HOME'} ) {
        $main::vera_home = $ENV{'VERA_HOME'};
    }
    else {
        print "ERROR:  VERA_HOME is not set.\n";
        compile_exit( 10 );
    }

    #
    # Check VERA_VRO_CACHE variable
    #

    if ( defined $ENV{'VERA_VRO_CACHE'} ) {
        $main::vera_vro_cache = $ENV{'VERA_VRO_CACHE'};
    }
    else {
        print "ERROR:  VERA_VRO_CACHE is not set.\n";
        compile_exit( 10 );
    }

    #
    # Get VMC version of this Vera installation
    #
    chomp( $main::vera_vmc_version = `vera -vmc` );
    if ( $main::vera_vmc_version !~ /\d\.\d/ ) {
        print "ERROR:  Could not determine Vera VMC version.\n";
        compile_exit( 2 );
    }
}

sub compileVera($) {

    my ( $test ) = @_;

    my @file_list;
    my $file;
    my $path;

    $path = "..";

    @main::vera_include_list = add_include_list("$path/../scratch/include/vera"); # headers for VMT models
    @main::vera_include_list = add_include_list("$path/testbench");               # headers private to the corekit testbench
    @main::vera_include_list = add_include_list("$path/vera/include");            # headers from imported vera libraries (harness)
    @main::vera_include_list = add_include_list("$path/test");                   # header for the test task file

    @file_list = get_file_list_by_ext("$path/testbench", "vrp");
    foreach $file ( @file_list ) {
       generate_vro($file, "$path/testbench");
    }

    @file_list = get_file_list_by_ext("$path/vera/src", "vrp");
    foreach $file ( @file_list ) {
       generate_vro($file, "$main::vera_vro_cache/$main::vera_vmc_version/$main::DesignName");
    }

    @file_list = get_file_list_by_ext("$path/$test", "vrp");
    foreach $file ( @file_list ) {
       generate_vro($file, "$path/$test");
    }
}

sub generateVrl() {


    my $status;

    if ( ! -w "." ) {
        print "ERROR:  Directory  $main::Cwd/$main::Test not writable.\n";
        compile_exit( 31 );
    }

    # .vros from the cache
    $status  = system( "rm -f test_${main::DesignName}.vrl" );
    $status  = system( "touch test_${main::DesignName}.vrl" );
    $status  = system( "rm -fr .sim_was_run*");
    $status  = system( "rm -fr re_act*");
    $status  = system( "rm -fr act*.certificate");

    if ( -e "$main::vera_vro_cache/$main::vera_vmc_version/$main::DesignName" ) {
      $status += system( "ls $main::vera_vro_cache/$main::vera_vmc_version/$main::DesignName/*.vro >> test_${main::DesignName}.vrl" );
    }

    # .vros from the test directory
    $status += system( "ls ./*.vro >> test_${main::DesignName}.vrl" );

    # .vros from the testbench directory
    $status += system( "ls ../testbench/*.vro >> test_${main::DesignName}.vrl" );
    if ( $status ) {
        print "ERROR:  Could not create file test_${main::DesignName}.vrl.\n";
        compile_exit( 2 );
    }
}

sub generateVshell($) {

  my $simchoice = shift;
  my $status;
  my $vshell = "test_${main::DesignName}_shell.v";
  my $vera_cmd = "vera -proj test_${main::DesignName}.proj";
  my $inputLine;
  my $declarationsFound;

  my $dummy_period_hclk = "123456.0";
  my $dummy_period_pclk = "654321.0";
  if ( ! -w "." ) {
      print "ERROR:  Directory  ${main::Cwd}/${main::Test} not writable.\n";
      compile_exit( 31 );
    }

    generate_proj();
    print "  generating Vera shell $vshell\n";
    $status = system( $vera_cmd );
    if ( $status ) {
        print "ERROR:  Failure during Vera shell generation.\n";
        compile_exit( 10 );
    }
    # postprocess the vera shell to set user defined clock period and clock ratios

    else {
        $status += system("sed 's/$dummy_period_hclk/${main::Period}/' $vshell > $vshell.tmp");
        $status += system("sed '/^vmcclk*/ s/0;/1;/g' $vshell.tmp > $vshell.tmp1");
        $status += system("sed 's/$dummy_period_pclk/(${main::Period}*${main::ApbClockRatio})/' $vshell.tmp1 > $vshell");
        $status += system("rm -f $vshell.tmp $vshell.tmp1");
    }
}

sub runSim() {

  # -/ --------------------------------------------------------------
  # -/ This function generates and run the simulation command line
  # -/ for the selected simulator.
  # -/ --------------------------------------------------------------

  # -- Clean old log/wave/result files
  foreach (($main::DumpFile,$main::LogFile,$main::ResultFile)) {
    unlink($_) if (-e $_);
  }

  # -- Generate command script
  my @Commands;

  # vcs command line vera bind option 
  my $vcs_vera_bind="-vera_dbind";
  my $sixtyfourbitswitch;
  if ($main::DesignName eq "DW_ahb_h2h" ||
      $main::DesignName eq "DW_ahb_eh2h" ||
      $main::DesignName eq "DW_axi_x2h") {
    $vcs_vera_bind="-vera";
  } 

  # compile time code coverage options
  my $cm_cflags = ($main::Coverage) ? "-cm line+cond" : "";

  # run time code coverage options, note usage of cm_zip
  # to workaround a tool problem when using +fsm coverage
  my $cm_rflags = ($main::Coverage) ? "-cm_zip line+cond" : "";

  # limit the scope of the coverage for eh2h
  if ($main::DesignName eq "DW_ahb_eh2h") {
    $cm_cflags = ($main::Coverage) ? "-cm line+cond+tgl+fsm -cm_scope \"tree+test_DW_ahb_eh2h.U_eh2h_a\"" : "";
    $cm_rflags = ($main::Coverage) ? "-cm_zip line+cond+tgl+fsm" : "";
  }

  if ($main::DesignName eq "DW_axi_x2h") {
    $cm_cflags = ($main::Coverage) ? "-cm line+cond+tgl+fsm -cm_scope \"tree+test_DW_axi_x2h.U_x2h_a\"" : "";
    $cm_rflags = ($main::Coverage) ? "-cm_zip line+cond+tgl+fsm" : "";
  }

  if ($main::DesignName eq "DW_axi") {
    $cm_cflags = ($main::Coverage) ? "-cm line+cond+fsm -cm_noconst -cm_hier ../cm_hier_config" : "";
    $cm_rflags = ($main::Coverage) ? "-cm_zip line+cond+tgl+fsm" : "";
  }


  if (($main::Simulator eq "vcs") || ($main::Simulator eq "vcsi")) {
    if ($main::use64bitSimulator) {
      $sixtyfourbitswitch = "-full64";
    } else {
      $sixtyfourbitswitch = "";
    }
  }
  if ($main::Simulator eq "nc_verilog") {
    if ($main::use64bitSimulator) {
      $sixtyfourbitswitch = "-64bit";
    } else {
      $sixtyfourbitswitch = "";
    }
  }


  if ($main::Simulator eq "vcs" and $main::platform eq "HP-UX") {
    my $PlatformFlags = "$sixtyfourbitswitch -Mupdate=1";
    @Commands = ("vcs -Xbymod=4 -PP $PlatformFlags $cm_cflags $vcs_vera_bind -f $main::simcommand -f $main::plusargs",
                 "/bin/rm -fr *.o",
                 "./simv $cm_rflags",
                 "rm -f simv");
  } elsif ($main::Simulator eq "vcsi" and $main::platform eq "HP-UX") {
    my $PlatformFlags = "$sixtyfourbitswitch -Mupdate=1";
    @Commands = ("vcsi -Xbymod=4 -PP $PlatformFlags $cm_cflags $vcs_vera_bind -f $main::simcommand -f $main::plusargs",
                 "/bin/rm -fr *.o",
                 "./simv $cm_rflags",
                 "rm -f simv");
  } elsif ($main::Simulator eq "vcs") {
    my $PlatformFlags = "$sixtyfourbitswitch -Mupdate=1";
    @Commands = ("vcs -Xbymod=4 -PP $PlatformFlags $cm_cflags $vcs_vera_bind -f $main::simcommand -f $main::plusargs",
                 "./simv $cm_rflags",
                 "rm -f simv");
  } elsif ($main::Simulator eq "vcsi") {
    my $PlatformFlags = "$sixtyfourbitswitch -Mupdate=1";
    @Commands = ("vcsi -Xbymod=4 -PP $PlatformFlags $cm_cflags $vcs_vera_bind -f $main::simcommand -f $main::plusargs",
                 "./simv $cm_rflags",
                 "rm -f simv");
  } elsif ($main::Simulator eq "mti_verilog") {
    if ($main::RtlSim eq "GTECH") {
    @Commands = ("/bin/rm -rf ./work_axi",
                 "vlib ./work_axi",
                 "vlog -work work_axi -f $main::simcommand -f $main::plusargs",
                 "vsim -c -pli ../veriuser.so -lib ./work_axi -do \"set IterationLimit 500000;run -all;quit\" test_${main::DesignName} -f $main::plusargs");
    } else {
    @Commands = ("/bin/rm -rf ./work_axi",
                 "vlib ./work_axi",
                 "vlog -work work_axi -f $main::simcommand -f $main::plusargs -v $ENV{SYNOPSYS}/packages/gtech/src_ver/gtech_lib.v",
                 "vsim -c -pli ../veriuser.so -lib ./work_axi -do \"set IterationLimit 500000;run -all;quit\" test_${main::DesignName} -f $main::plusargs");
    }
  } elsif ($main::Simulator eq "verilog_xl") {
    @Commands = ("../vera_xl -x -f $main::simcommand -f $main::plusargs");
  } elsif ($main::Simulator eq "nc_verilog") {
    @Commands = ("rm -f hdl.var cds.lib ncsim.args libpli.so libpli.sl",
                 "ln -s ../libpli.so .",
                 "ln -s ../libpli.sl .",
                 "ncprep +nclicqueue +overwrite -f $main::simcommand -f $main::plusargs",
                 "ncvlog $sixtyfourbitswitch -f ncvlog.args",
                 "ncelab $sixtyfourbitswitch -f ncelab.args -access +rw",
                 "ncsim -LICQUEUE  $sixtyfourbitswitch -hdlvar hdl.var -cdslib cds.lib -f ncsim.args -STACKSIZE 3000000");
  } else {
    die "$main::Pgm: ERROR - Unknown simulator $main::Simulator not yet supported.\n";
  }
  my $cmd_file = "test.startsim";
  print STDERR "$main::Pgm: Creating simulation start script ${main::Test}/$cmd_file containing:\n";
  open(CMD,">$cmd_file") or die "$main::Pgm: ERROR - can't write startsim script \"$cmd_file\"\n";
  foreach my $cmd (@Commands) {
    print CMD "$cmd\n";
    print STDERR "$main::Pgm:    % $cmd\n";
  }
  close(CMD);

  # -- make command file executable
  system("chmod ugo+rx $cmd_file");
  # -- exit if you only want the scripts
  exit(0) if $main::Pretend;

  # -- print header and start time
  my $startdate = `date`; chomp $startdate;
  print STDERR "$main::Pgm: Running ${main::Test}/$cmd_file at $startdate\n";

  print STDERR "\n\n+------------------------+\n| Simulation Execution   |\n+------------------------+\n\n";
  print STDERR "(this section of runtest.log supplied by ${main::Test}/$cmd_file script)\n\n\n";

  # -- run command file
  my_system("pwd"); 
  my_system("./$cmd_file < /dev/null 2>&1 | tee $main::LogFile");

  # -- print end time and tail
  my $enddate = `date`; chomp $enddate;
  print STDERR "\n\n\n+--------------------+\n| Simulation Results |\n+--------------------+\n\n";
  print STDERR "$main::Pgm: Completed simulation at $enddate\n";
  print STDERR "$main::Pgm: The above simulation output was also saved to $main::LogFile : \n$main::Pgm:   file:${main::Cwd}/$main::LogFile\n";

}

sub postProcess() {

  my $errorConditions = "";
  my $errorExceptions = "";
  my $errorFile = "../html_extraction_config_file";
  my @configFileContents = ();
  open (CF, "<${errorFile}");
  @configFileContents = <CF>;
  close(CF);
  chomp(@configFileContents);
  foreach (@configFileContents) {
    if (/errorConditions:"(.*?)"/) {
      $errorConditions = $1;
    }
    if (/errorExceptions:"(.*?)"/) {
      $errorExceptions = $1;
    }
  }
  # -/ --------------------------------------------------------------
  # -/ This function parses the simulation log files and reports a
  # -/ test pass or fail status
  # -/ --------------------------------------------------------------
  `/bin/rm -rf passed failed timeout`;
  `/bin/rm -fr ../passed/$main::Test`;
  `/bin/rm -fr ../timeout/$main::Test`;
  `/bin/rm -fr ../failed/$main::Test`;

  open (RESULT,">$main::ResultFile") || die "$main::Pgm: ERROR: can't open result file $main::ResultFile for write\n";
  my $result;
  if(check_completed() & ! check_errors()) {
    `touch passed`;
    `touch ../passed/$main::Test`;
    $result = "PASSED";
    if(&check_warnings()) {
      if (&check_illegal_prog()) {
        $result .= " (WARNINGS and ILLEGAL PROGRAMMING)";
      } else {
        $result .= " (WARNINGS)";
      }
    } else {
      if (&check_illegal_prog()) {
        $result .= " (ILLEGAL PROGRAMMING)";
      }
    }
    if (act_cert_requested() && act_certified()) {
      $result .= " (ACT CERTIFIED)";
    }
    if (act_recert_requested() && act_recertified()) {
      $result .= "(ACT RECERTIFIED)";
    }
  `/bin/rm -rf simv simv.daidir csrc`;
  } else {
    $result = "FAILED";
    if(&check_timeouts()) {
      $result .= " (TIMEOUT)";
      `touch timeout`;
      `touch ../timeout/$main::Test`;
    } else {
      `touch failed`;
      system("egrep -i  \"$errorConditions\" test.log | egrep -iv \"$errorExceptions\" | head -1 > ../failed/$main::Test");
    }
    if (act_cert_requested() && !act_certified()) {
      $result .= "(ACT CERTIFICATION FAILURE)";
    }
    if (act_recert_requested() && !act_recertified()) {
      $result .= "(ACT RECERTIFICATION FAILURE)";
    }
  }
  print RESULT "$result \n";

  close RESULT || die "$main::Pgm: ERROR: can't close result file $main::ResultFile after write\n";
  print STDERR "$main::Pgm: Final result in ${main::Test}/${main::ResultFile} - Result is \"$result\"\n\n";
  printf STDERR "Result:  %-19s  Test: $main::Summary\n\n","\"$result\"";

}


sub act_recertified() {
   my $act_recertified = 0;
   my @act_recertification_required = glob(".sim_was_run_with_recert*");
   my $act_recert_requests = @act_recertification_required;
   my @certificates;
   my $certificates_found;
   if ($act_recert_requests>0) {
     @certificates = glob("re_act*");
     $certificates_found = @certificates;
     if ($certificates_found>0) {
       $act_recertified = 0;
     } else {
       $act_recertified = 1;
     }
   }
   return $act_recertified;
}
sub act_recert_requested() {
  # -/ -------------------------------------------------------------
  # -/ Checks to see if ACT recertification was requested in this test
  # -/--------------------------------------------------------------
  my $recert_requested = 0;
  my @act_recert_requests = glob (".sim_was_run_with_recert*");
  my $act_recert_requests = @act_recert_requests;
  if ($act_recert_requests>0) {
    $recert_requested = 1;
  }
  return $recert_requested;
}
sub act_cert_requested() {
  # -/ -------------------------------------------------------------
  # -/ Checks to see if ACT certification was requested in this test
  # -/--------------------------------------------------------------
  my $cert_requested = 0;
  my @act_requests = glob (".sim_was_run_with_act_mon*");
  my $act_requests = @act_requests;
  if ($act_requests>0) {
    $cert_requested = 1;
  }
  return $cert_requested;
}

sub act_certified() {
 # -/ -------------------------------------------------------------
 # -/ Checks that a certificate file has been generated for each
 # -/ requested certificate
 # -/ -------------------------------------------------------------
  my $certified = 1;
  my @act_requests = glob (".sim_was_run_with_act_mon*");
  my @act_certs = glob ("act*.certificate");
  my $number_of_requests = @act_requests;
  my $number_of_certs = @act_certs;
  if ($number_of_requests != $number_of_certs) {
    $certified = 0;
  }
  return $certified;
}


sub check_errors() {

  # -/ --------------------------------------------------------------
  # -/ look through log files for for lines with the word 'error' or
  # -/ 'fatal' in their first N characters, ie chances are they are
  # -/ error messages of some form. This is a strict and safe
  # -/ catch-all and may match on completely innocent lines.
  # -/ --------------------------------------------------------------

  my $errorConditions = "";
  my $errorExceptions = "";
  #my $errorFile = "../simulation_analysis_config_file";
  my $errorFile = "../html_extraction_config_file";
  my @configFileContents = ();
  open (CF, "<${errorFile}");
  @configFileContents = <CF>;
  close(CF);
  chomp(@configFileContents);
  foreach (@configFileContents) {
    if (/errorConditions:"(.*?)"/) {
      $errorConditions = $1;
    }
    if (/errorExceptions:"(.*?)"/) {
      $errorExceptions = $1;
    }
  }
  my $rv = 0;
  my $errors = 0;
  my @errors = "";

#  @errors = `egrep -i \"error|fatal\" $main::LogFile | grep -v Region: | grep -v -i \"errors: 0\" | grep -v -i \"Total error\" | grep -v -i vca_error |  grep -v -i "ErrorStop"  | grep -iv "strerror" | grep -iv "warning" | grep -iv \"m_envStatusError\" | grep -iv \"PROTO_ERROR\" | grep -iv "librterrorinf.so"`;
  @errors = `egrep -i  \"$errorConditions\" $main::LogFile | egrep -iv \"$errorExceptions\"`;
  foreach(@errors) { $errors++; }

  # -/ --------------------------------------------------------------
  # -/ Catch vcs warnings that should be considered failures.
  # -/ i.e. could be a failure to a third party tool.
  # -/ --------------------------------------------------------------
  my $error_warnings = 0;

 # This is a compile time warning - So code like ( in X2H )
 #         if (`X2H_AXI_ADDR_WIDTH == 64)
 #            mhaddr  =  mhaddr_reg;
 #          else
 #            mhaddr  = {{(64-`X2H_AXI_ADDR_WIDTH){1'b0}},mhaddr_reg};
 # will still give a warning when `X2H_AXI_ADDR_WIDTH == 64
 # as the compiler seems to parse both
 # branches of the if statement regardless of the X2H_AXI_ADDR_WIDTH
 # value. This may be new to VCS 2006.06! and is causing sims to fail

 # my @error_warnings = `egrep -i \"ZONMCM\" $main::LogFile`;
   my @error_warnings;

  foreach(@error_warnings) { $error_warnings++; }

  if (($errors > 0) || ($error_warnings > 0)) {
    $rv = 1;
  }

  return $rv;

}

sub check_warnings() {

  # -/ --------------------------------------------------------------
  # -/ Find warnings other than:
  # -/ a. runtest warnings
  # -/ b. inout coercion
  # -/ --------------------------------------------------------------

  my %warningsSeen;
  my $warningItem;
  my @uniquifiedWarningList;
  my @warnings;
  my $key;
  my @verifiedWarnings;
  my $warningFound;
  @warnings = `grep -i warning $main::LogFile`;
  foreach $warningItem (@warnings) {
    chomp($warningItem);
    $_ = $warningItem;
    $warningsSeen{"$warningItem"}++;
  }
  my $value;
  @uniquifiedWarningList = keys %warningsSeen;
  if (-e "../testbench/verifiedWarnings.txt") {
    open (OK_WARNINGS, "<../testbench/verifiedWarnings.txt");
    my @verifiedWarnings = <OK_WARNINGS> ;
    close(OK_WARNINGS);
    chomp(@verifiedWarnings);
    foreach $key (@uniquifiedWarningList) {
      foreach $warningFound (@verifiedWarnings) {
        if ($key =~ /$warningFound/) {
          delete($warningsSeen{"$key"});
        }
      }
    }
  }

  foreach $warningItem (sort keys %warningsSeen) {
    print "$warningItem \n";
  }
  my $warnings = scalar(%warningsSeen);
  return $warnings;

}
sub check_illegal_prog() {

  # -/ --------------------------------------------------------------
  # -/ Finds illegal programming:
  # -/ --------------------------------------------------------------

  my $illegal_prog = 0;
  my @illegal_prog = `grep ILLEGAL_PROG $main::LogFile`;
  foreach(@illegal_prog) { $illegal_prog++; }
  return $illegal_prog;

}
sub check_timeouts() {

  # -/ --------------------------------------------------------------
  # -/ Find timeout and return N
  # -/ --------------------------------------------------------------

  my $timeouts = 0;
  my @timeouts = `grep TIMEOUT $main::LogFile | grep -v "+TIMEOUT"`;
  foreach(@timeouts) { $timeouts++; }
  return $timeouts;

}
sub check_completed() {

  # -/ --------------------------------------------------------------
  # -/ Find completion message and return true/false
  # -/ --------------------------------------------------------------

  my @completed = `grep "User test stimulus has completed" $main::LogFile`;
  if($#completed >= 0) {
    return 1;
  } else {
    return 0;
  }

}

sub generate_proj() {

    my $status;

    if ( ! -w "." ) {
        print "ERROR:  Directory  $main::Cwd/$main::Test not writable.\n";
        compile_exit( 31 );
    }

    if ( ! -f "test_${main::DesignName}.proj" ) {
        print "  touching trivial Vera vcon test_${main::DesignName}.vcon\n";
        $status = system( "touch test_${main::DesignName}.vcon" );
        print "  generating trivial Vera proj test_${main::DesignName}.proj\n";
        open(proj_file,"> test_${main::DesignName}.proj") || die "$main::Pgm: ERROR - Can't open test_${main::DesignName}.proj ($!)\n";
        printf proj_file "// This file is created each time by runtest\n";
        printf proj_file "main test_${main::DesignName}\n";
        printf proj_file " test_${main::DesignName}.vrl\n";
        printf proj_file " test_${main::DesignName}.vcon\n";
        close(proj_file);
    }
}

sub generate_vro {

    my ( $source, $dest_dir ) = @_;

    #
    # Compile encrypted source code
    #
    my $base;
    my $status;
    my $vera_cmd;
    my $source_dir;

    $base = basename( $source, ".vrp" );
    $source_dir = dirname( $source, ".vrp" );

    if ( ! -d "$dest_dir" ) {
        $status = system( "mkdir -p $dest_dir " );
        if ( $status ) {
            print "ERROR:  Could not create directory '$dest_dir'.\n";
            compile_exit( 20 );
        }
    }

    # compile only if :
    # the .vro does not exist in $dest_dir
    # OR VeraForceCompile is enabled
    # OR VeraForceCompileMain is enabled and the source is the Vera program.
    # By default VeraForceCompile=0 and VeraForceCompileMain=1 to make sure
    # that the main program .vro (and vthe derived vera shell) are always in
    # line with the environment.
    if ( !( -f "$dest_dir/$base.vro") || ($main::VeraForceCompile == 1) || ( ($main::VeraForceCompileMain == 1) && ($base eq "test_${main::DesignName}") ) ) {

        if ( ! -w "$dest_dir" ) {
            print "ERROR:  Directory '$dest_dir' not writable.\n";
            compile_exit( 31 );
        }

        $vera_cmd  = "vera -cmp -vip -q -ip -cs ";
        $vera_cmd .= "@main::vera_include_list ";
        $vera_cmd .= "$source ";
        $vera_cmd .= "$dest_dir ";

        print "  compiling encrypted source - vera -cmp -vip $base.vrp\n";
        #print "  $vera_cmd\n";

        $status = system( $vera_cmd );
        if ( $status ) {
            print "ERROR:  Failure during Vera compilation.\n";
            compile_exit( 10 );
        }
    }
    else {
        print "  compilation skipped : object $base.vro already in cache.\n";
    }
}

sub add_include_list {

    my ( $include_dir ) = @_;

    #
    # add an element to the include list global
    # variable used for for the vera compilation
    #
    $main::vera_include_list[$#main::vera_include_list+1] = "-I$include_dir";

    #print "include_list=@vera_include_list\n";
    return( @main::vera_include_list );
}

sub get_file_list_by_ext {

    my ( $file_dir, $file_ext ) = @_;

    my @file_list;

    if ( ! -e $file_dir ) {
        @file_list = ();
        return( @file_list );
    }

    if ( ! opendir( D, $file_dir ) ) {
        print "ERROR:  Could not open VR file_dir '$file_dir'.\n";
        compile_exit( 12 );
    }

    @file_list = grep( /.$file_ext$/, readdir( D ) );

    closedir( D );

    if ( defined @file_list ) {
        @file_list = map { $file_dir . "/" . $_ } @file_list;
    }
    else {
        @file_list = ();
    }

    return( @file_list );

}

sub my_system($) {

  # -/ --------------------------------------------------------------
  # -/ my_system() - a system call with success/fail check plus
  # -/ Pretend/Verbose support
  # -/ --------------------------------------------------------------

  my $cmd = shift;

  if($main::Pretend or $main::Verbose) {
    printf STDERR "$main::Pgm: running \"$cmd\"\n";
  }
  unless ($main::Pretend) {
    system($cmd);
    die "$main::Pgm: ERROR - command \"$cmd\" failed, exit code $?\n" if($?);
  }

}

sub compile_exit {

    my ( $code ) = @_;

    if($code == 0) {
    }
    else {
       exit( $code );
    }
}

1;



