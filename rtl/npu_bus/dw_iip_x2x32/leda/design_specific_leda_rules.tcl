# This file contains design-specific Leda rules

    #Bus naming convention is HIGH to LOW
rule_deselect -rule A_12C_R
    #Constant condition expression
rule_deselect -rule W159

   # MF_3C_R : The module name should be the same as the file name.
   # Prefix regression run breaks this rule.
rule_deselect -rule MF_3C_R

# Turn off rule checking for variables not fully assigned in function
# this only occurs in bcm57.v and looks likea leda bug
# star 9000240864 has been filed
rule_deselect -rule FM_2_35

#turn off check for use of complex arithmatic
rule_deselect -rule FM_1_2

# Turn off rule checks for signal in sensitivity list but not in
# the body of the statement. Sometimes, the cc_constants mean that
# the section of code that contains the relevant signal is never accessed
# in the configuration
rule_deselect -rule C_2C_R
rule_deselect -rule W456

# turn off rule checking for signals missing in sensitivity list.
# the signals are in teh sensitivity list
rule_deselect -rule FM_2_1B
rule_deselect -rule W122

# turn off checks for illegal part selection and range overflow. On checking ranges of
# all assignments flaged. ranges were ok
rule_deselect -rule DCVER_256
rule_deselect -rule E267
rule_deselect -rule FM_2_22

# turn of check for parameter defined but not used. Sometimes the
# use of ifdef can mask the use of the parameter in the body of the code
rule_deselect -rule W175

# Turn off warning to check for multi-bit expression where
# 1 bit is expected. bcm57.v contains the following code
# (MEM_MODE & 2) which is correct but flags this leda warning
# Turning off globally this only occurs in bcm57.v
rule_deselect -rule W224

# turn off checking for shift by non-constant as we are happy to use this
# coding style
rule_deselect -rule W244

# turn off check for unconnected ports as we leave these blank deliberatley.
# rule_deselect -rule W287 - Unconnected ports fixed - BR -

# turn off checking for carry borrow loss in adder/sub as these are safe by design
rule_deselect -rule W484

# turn off checking for reduction of single bit expression as configurability 
# allows this to happen
rule_deselect -rule W563

# W631: Assigning to self. This is harmless but can reduce simulation speed
# Makes code intent clearer in my opinion (jstokes).
rule_deselect -rule W631
 
# Bugs in leda combinatorial loop checks. 
# C_8C_R: Avoid asynchronous feedback loop 
rule_deselect -rule C_8C_R 
 
# Bugs in leda combinatorial loop checks. 
# FM_1_1: Avoid asynchronous feedback loop 
rule_deselect -rule FM_1_1 
 
# Bugs in leda combinatorial loop checks. 
# G_553_1: Avoid asynchronous feedback loop 
rule_deselect -rule G_553_1 
 
# Bugs in leda combinatorial loop checks. 
# TEST_960: Avoid asynchronous feedback loop 
rule_deselect -rule TEST_960 
 
# Bugs in this leda check, I have seen this rule generate errors 
# due to undriven wires that are no connected to anything e.g.
# DW_ahb : DW_ahb.U_arb.wt_count_m15 when waiting token arb. not selected.
# NTL_CON12: undriven net Range: .... 
rule_deselect -rule NTL_CON12 
 
# CMPVE047: Macro * is not defined
# Bug in DW_minmax, undefined macros undef'd.
# STAR 9000404442 opened.
rule_deselect -rule CMPVE047
 
# NTL_CLK05: Data must be registered by 2 or more flipflops when crossing clock domain 
# JS_DEBUG, turning off for alpha, remove & review after.
rule_deselect -rule NTL_CLK05
