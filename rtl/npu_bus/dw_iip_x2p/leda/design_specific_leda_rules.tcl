# This file contains design-specific Leda rules

# turn off checks for prefix on module name
rule_deselect -rule MF_3C_R

# turn of check for parameter defined but not used. Sometimes the
# use of ifdef can mask the use of the parameter in the body of the code
rule_deselect -rule W175

# Turn off rule checking for constant consition expression
# use of parameters allows this to happen
rule_deselect -rule W159

# Turn off warning to check for multi-bit expression where
# 1 bit is expected. bcm57.v contains the following code
# (MEM_MODE & 2) which is correct but flags this leda warning
# Turning off globally this only occurs in bcm57.v
rule_deselect -rule W224

# turn off checks for unconnected ports
# rule_deselect -rule W287 - Unconnected ports fixed - BR -

# turn off checking for carry borrow loss in adder/sub as these are safe by design
rule_deselect -rule W484

 
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
