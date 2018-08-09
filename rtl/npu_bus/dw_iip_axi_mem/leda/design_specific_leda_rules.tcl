# This file contains design-specific Leda rules

# DW_AXI

    #Bus naming convention is HIGH to LOW
rule_deselect -rule A_12C_R
    #Constant condition expression
rule_deselect -rule W159
    #Shift by non-constant
rule_deselect -rule W244
    #Reduction of a single bit expression is redundant
rule_deselect -rule W563
    #No reg declaration are allowed in sequential blocks
rule_deselect -rule S_7R_D
    #Avoid using pos and neg edge triggered flops in design.
    #May be necessary for some synchronisation blocks.
rule_deselect -rule DFT_003
   #Use fully assigned variables in functions.
   #Does not allow for use of integers as loop iterators, which we
   #do a lot.
rule_deselect -rule FM_2_35
   #Possible loss of carry/borrow in addition/subtraction.
   #Functional simulation would catch these problems if 
   #they were the cause of functional problems.
rule_deselect -rule W484
   #Usage of complex arithmetic operations that include multiplication,
   #division, remainder or modulus is not recommended (important memory usage).
   #Should be at discretion of designer.
rule_deselect -rule FM_1_2

   #Clock affects multiple clock or async ports of register
   #Suspect bug in this rule.
rule_deselect -rule TEST_994

   #Multi-bit expression when one bit expression is expected.
rule_deselect -rule W224

   #X in based number constant
   #Could be valid syntax.
rule_deselect -rule W443

   #Signal assigned more than once in a single flow of control.
   #Valid syntax.
rule_deselect -rule FM_1_7

   # FM_2_22: Possible range overflow
   # Expect simulation and synthesis to catch this, leda flags 
   # false warnings.
rule_deselect -rule FM_2_22

   # MF_3C_R : The module name should be the same as the file name.
   # Prefix regression run breaks this rule.
rule_deselect -rule MF_3C_R

   # STAR 9000235680
   # Leda bug causing these messages to fire incorrectly.
   # C_8C_R: Avoid asynchronous feedback loops.
rule_deselect -rule C_8C_R
   # G_553_1: Avoid asynchronous feedback loops.
rule_deselect -rule G_553_1
   # FM_1_1: Avoid asynchronous feedback loops.
rule_deselect -rule FM_1_1
   # TEST_960: Avoid asynchronous feedback loops.
rule_deselect -rule TEST_960


   # ELB095: Parameter V_BUS_SHRD_W is assigned to localparam during elaboration of this instance.
   # Not sure why this should constitute a warning, standard use of localparam.
rule_deselect -rule ELB095

  # W175: A parameter x has been defined but is not used.
  # Sometimes use of parameter is ifdef'd out,but parameter is not.
rule_deselect -rule W175

  # N_1P_R_B: A signal or port name must have a max of 32 characters
rule_deselect -rule N_1P_R_B


  # NTL_CON12: undriven net <net name>
  # There appears to be a bug with this check, it is reporting nets as undriven, but
  # I can see them toggle in wave viewer. It does report some signals correctly, but depending
  # on configuration we will not drive some signals (i.e. wires remain declared).
rule_deselect -rule NTL_CON12
 
# CMPVE047: Macro * is not defined
# Bug in DW_minmax, undefined macros undef'd.
# STAR 9000404442 opened.
rule_deselect -rule CMPVE047
 
# NTL_CLK05: Data must be registered by 2 or more flipflops when crossing clock domain 
# JS_DEBUG, turning off for alpha, remove & review after.
rule_deselect -rule NTL_CLK05
