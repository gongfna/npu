rule_deselect -all
rule_select -policy DESIGNWARE
rule_select -policy rmm_rtl_coding_guidelines
rule_select -policy formality
rule_select -policy dc
rule_select -policy verilint
rule_select -policy dft


#########################################################
#  Additional rules from the 'DESIGN' policy
#########################################################
    # Data must be registered by 2 or more FF when crossing clock domain
rule_select -policy DESIGN  -rule NTL_CLK05
    # Floating output pin
rule_select -policy DESIGN  -rule NTL_CON08
    # Undriven net
rule_select -policy DESIGN  -rule NTL_CON12
    # Detects Internal generated Asynch. reset
rule_select -policy DESIGN -rule NTL_RST06 
rule_set_parameter -rule NTL_RST06 -parameter CHECK_ASYNCHRONOUS_RESET_ONLY -value {1}


#########################################################
#  Susspected Leda bugs - rules removed
#########################################################
     # Avoid internally generated reset/set/load
rule_deselect -rule G_546_1
     # Avoid internally generated reset/set/load
rule_deselect -rule A_5C_R_D
     # Avoid internally generated reset/set/load
rule_deselect -rule DFT_017
     # Truncating leading zeros (or x's or z's)
rule_deselect -rule W531
     # Reset abort_idle_time_sm is not an input to the module
rule_deselect -rule W402
    # Use only one clock signal per unit
rule_deselect -policy DESIGN  -rule NTL_CLK02

#########################################################
#  Design specific (WUSB) rules removed
#########################################################
  # The following rules are usually part of the common rule set, but
  # being removed from this specific project only.

     # Only legal names for reset 
rule_deselect -rule N_2C_R_B
     # Asynchronous reset detected
rule_deselect -rule DFT_019
     # Include comments with I/O declarations
rule_deselect -rule MF_8C_R
     # Non driven output ports or signals detected.
rule_deselect -rule FM_2_23
     # Gate instance with too few ports
rule_deselect -rule DCVER_154
     # Constant expression in conditional select
rule_deselect -rule W161
     # Use parameter statements to define the state vector of a state machine
rule_deselect -rule G_559_2_A
     # Only uppercase characters are allowed for parameters
rule_deselect -rule P_3C_G
     # Declare one port per line
rule_deselect -rule G_5210_2
     # Case statement must have a default assignment to prevent latch inference
rule_deselect -rule C_4C_R_A
     # Avoid operand size mismatch assignments
rule_deselect -rule FM_2_17
     # Do not use assignment in net/signal declaration
rule_deselect -rule FM_2_6B
     # Nested ifs. Consider using case or casex statement instead
rule_deselect -rule W526
     # Only lowercase characters are allowed in input port names
rule_deselect -rule PWR_1C_G_A
     # No logical expressions are allowed in port maps
rule_deselect -rule I_6C_R
     # Redundant signal in the sensitivity list
rule_deselect -rule FM_2_1A
     # Range select for integer or time variable
rule_deselect -rule W216
     # Do not use assignment in net/signal declaration
rule_deselect -rule FM_2_6B
    #Do not use `ifdef
rule_deselect -rule FM_2_34A
    #Only legal names for clock are clk and clk_<name>
rule_deselect -rule N_2C_R_A
    #Identifier of instance starts with ^DW. If it is a DesignWareFoundation cell, then Formality requires extra settings
rule_deselect -rule FM_1_3
    #Parameter range specification is only meaningful to synthesis. Synthesis and simulation may have different results
rule_deselect -rule  DCVER_311



#########################################################
#  Good to have Verilint rules, but not supported by Leda
#########################################################
   # The following is a list of Verilint rules that 
   # currently not supported by Leda. 

# W18 : Variable possibly not assigned in all paths through the block
# W19 : Truncation of extra bits
# W34 : Unused macro
# W120: Unused variable <%item>
# W123: Variable never gets set
# W175: Unused parameter
# W180: Zero extension of extra bits
# W191: Unused function
# W193: Empty statement
# W240: Unused input <%item>
# W241: Output <%item> never gets set
# W264: Not all possible cases covered
# W338: Unequal length in case item comparison
# W355: Parallel casex covered more than once
# W398: Case covered more than once
# W454: No default, and case is too wide to check if all cases are covered (maximum width is 31)
# W486: Shift overflow, some bits will be lost
# W497: Not all the bits of the vector <%item> are set
# W498: Not all the bits of the vector are used
# W528: Variable <%item> set but not used
# W630: Port connected to a NULL expression


#########################################################
#  Not selected DFT rules - Duplicated or not needed
#########################################################
     # Register all outputs from the block to improve coverage
rule_deselect -rule DFT_009  
     # 2 clocks in a block
rule_deselect -rule DFT_006



#########################################################
#  Not selected Formality rules
#########################################################



#########################################################
#  Not selected DC rules
#########################################################



#########################################################
#  Not selected Verilint rules - Duplicated or not needed
#########################################################
     #  Multiple resets in the module
rule_deselect -rule W390
     # Multiple resets in the module
rule_deselect -rule W390  
     # Case statement without default clausebut all the cases are covered
rule_deselect -rule W69  
     # Implicit wire declaration
rule_deselect -rule W154 
     # Extension of extra bits in constant integer conversion, not supported by Leda
rule_deselect -rule W162  
     # Not all possible cases covered but default case exists
rule_deselect -rule W332 
     # Extension of zero bits in constant
rule_deselect -rule W341 
     # Reset is used as data, not supported by Leda
rule_deselect -rule W404  
     # More than 1 top level module
rule_deselect -rule W433 
     # Reading from an output port
rule_deselect -rule W446 
     # Bus variable in sensitivity list but not all its bits are used
rule_deselect -rule W488 
     # `ifdef may not be supported
rule_deselect -rule W529 
     # Asynch. FF is inferred
rule_deselect -rule W549 
     # Mux is inferred
rule_deselect -rule W550 
     # Inferred a counter
rule_deselect -rule W570 
 # Synchronous flipflop is inferred
rule_deselect -rule W548 


############################################################
#  Not selected Designware rules - Duplicated or not needed
############################################################
     # Data must be registered by 2 flipflops when changing clock domains
rule_deselect -rule A_3C_R
     # <%value> blocks used to code state machine.One block should be used.
rule_deselect -rule CS_1C_R
     # Naming convention for state variables: name should end in _cs 
rule_deselect -rule CS_2C_R
     # In module name DW_<PRODUCT_NAME>_<MODULE>: <MODULE> has to have up to 8 characters
rule_deselect -rule MF_1C_R_A
     # In module name DW_<PRODUCT_NAME>_<MODULE>: <PRODUCT_NAME> has to have up to 8 characters
rule_deselect -rule MF_1C_R_B
     # In module name DW_<PRODUCT_NAME>_<MODULE>: <PRODUCT_NAME> must be the DesignWare product
rule_deselect -rule MF_1C_R_C
     # The module name has to be of the form DW_<PRODUCT_NAME>_<MODULE>
rule_deselect -rule MF_1C_R_D
     # In module name DW_<PRODUCT_NAME>_<MODULE>: No hierarchy in <MODULE>
rule_deselect -rule MF_4C_R
     # A signal or port name should have less than 20 characters
rule_deselect -rule N_1P_R_A
     # Use module port name as wire name between modules
rule_deselect -rule N_8C_G
     # All outputs should be registered.
rule_deselect -rule S_6C_R_A 
     # VHDL reserved words cannot be used as identifiers
rule_deselect -rule TK_6CP_R
     # Begin Instance names with U_
rule_deselect -rule I_3C_G
     # Include comments for each wire or reg declaration
rule_deselect -rule PWR_6C_G
     # Name all always blocks <name>_PROC
rule_deselect -rule N_7C_G
     # No integer declaration are allowed in sequential blocks
rule_deselect -rule S_7R_B


#########################################################
#  Check for full_case and parallel_case directives
#########################################################

# Do not use full_case directives in case statements
rule_select -verilog -policy VER_STARC_DSG -ruleset S_2_8_CASE_STATEMENT_DESCRIPTION -rule VER_2_8_1_5

# Do not use parallel_case directives in case statements
rule_select -verilog -policy VER_STARC_DSG -ruleset S_2_8_CASE_STATEMENT_DESCRIPTION -rule VER_2_8_5_1

#########################################################
#  Check that all flip-flops have reset/set/load present
#########################################################

rule_select -policy LEDA -ruleset RESETS -rule C_1406

#########################################################
#  Not selected RMM rules
#########################################################

  ### RMM Rules Redundant with DESIGNWARE Rule ###
rule_deselect -rule G_521_11
rule_deselect -rule G_521_2_B
rule_deselect -rule G_521_3_B
rule_deselect -rule G_521_5
rule_deselect -rule G_521_6
rule_deselect -rule G_521_9_A
rule_deselect -rule G_5215_4
rule_deselect -rule G_536_2
rule_deselect -rule G_542_1
rule_deselect -rule G_543_1
rule_deselect -rule G_551_1_H
rule_deselect -rule G_551_1_I
rule_deselect -rule G_551_1_K
rule_deselect -rule R_521_10
rule_deselect -rule R_5211_1
rule_deselect -rule R_524_1_A
rule_deselect -rule R_524_1_B
rule_deselect -rule R_524_1_C
rule_deselect -rule R_526_1
rule_deselect -rule R_552_1
rule_deselect -rule R_554_1_A
rule_deselect -rule R_554_1_B
rule_deselect -rule R_555_1_A
rule_deselect -rule R_555_1_B

  ### RMM Rules removed from the common set ###

     # Three state signal names should have suffix _z
rule_deselect -rule G_521_13_A
     # Flipflop outputs should have suffix _r
rule_deselect -rule G_521_13_B
     # Active low resets should be called rst_n
rule_deselect -rule G_521_9_B
     # Use Vector operations on arrays rather than for loops
rule_deselect -rule G_5214_2
     # The number of characters in 1 line should not exceed 72
rule_deselect -rule G_527_1
     # Use indentation of 2 spaces
rule_deselect -rule G_528_1
     # Avoid using both positive-edge and negative-edge triggered flip-flops in your design
rule_deselect -rule G_541_1
     # Clock should be visible from top unit
rule_deselect -rule G_544_1
     # Use 'if(<%context> == 'b0)' or 'if(<%context> == 'b1)' for synchronous reset/set/load expressions
rule_deselect -rule G_551_1_C
     # Use 'if(<%context> == 'b1)' for rising edge asynchronous reset/set/load expressions
rule_deselect -rule G_551_1_D
     # Use 'if(<%context> == 'b0)' for falling edge asynchronous reset/set/load expressions
rule_deselect -rule G_551_1_E
     # <%value> blocks used to code state machine.Two blocks should be used
rule_deselect -rule G_559_1
     # In state machine, keep FSM logic and non-FSM logic apart
rule_deselect -rule G_559_3
     # Assign a default state to the state machine
rule_deselect -rule G_559_4
     # Drivers of output ports should be registered.
rule_deselect -rule G_561_1
     # Avoid using asynchronous logic  WARNING VHDL/Verilog
rule_deselect -rule G_564_1
     # Ports must be declared in the following order: input inout output 
rule_deselect -rule R_5210_1_B
     # Every instance must have a (meaningful) label
rule_deselect -rule R_5215_3
     # Date field missing from header comment, covered by MF_7C_R
rule_deselect -rule R_524_1_D
     # Author field missing from header comment, covered by MF_7C_R
rule_deselect -rule R_524_1_E
     # Filename field missing from header comment, covered by MF_7C_R
rule_deselect -rule R_524_1_F
     # Function must have a header comment
rule_deselect -rule R_525_1_B
     # Task must have a header comment
rule_deselect -rule R_525_1_C


#########################################################
#  Design specific rules added
#########################################################
   ### This section should be used projects that want to
   ### add rules that were removed from the common rule set.
if {[file exists ./rce/design_specific_leda_rules.tcl]} {
  source -echo ./rce/design_specific_leda_rules.tcl
}

#########################################################
#  Temporary removed rules
#########################################################
 # Loss of carry/borrow
# rule_deselect -rule W484
 # Unconnected port <%formal>
# rule_deselect -rule W287 
