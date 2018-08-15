#makefile

SHELL = /bin/bash

#SEED_OPTION = +ntb_random_seed=3777769073
#SEED_OPTION = +ntb_random_seed=1
SEED_OPTION = +ntb_random_seed_automatic

 

INC_DIR = \
+incdir+/home/common/VIP/amba_svt/include/sverilog \
+incdir+/home/common/VIP/amba_svt/src/sverilog/vcs \
+incdir+/home/common/VIP/amba_svt/src/verilog/vcs \
+incdir+/home/common/VIP/amba_svt/include/verilog \
+incdir+../testbench/apb \
+incdir+../testbench/axi

CM_COM = -cm line+tgl+cond+fsm+assert -cm_hier ../filelist/cm.lst -cm_dir $(TC)
CM_SIM = -cm line+tgl+cond+fsm

###+define+DEBUG_SLV #\

FPGA_SIM = 
DEBUG_SLV = 

DEFINE = \
+define+${FPGA_SIM} \
+define+${DEBUG_SLV} \
+define+INITIALIZE_MEMORY \
+define+XDMA_AXI_DEBUG_SLAVE \
+define+UVM_PACKER_MAX_BYTES=1500000 \
+define+UVM_DISABLE_AUTO_ITEM_RECORDING \
+define+SVT_UVM_TECHNOLOGY \
+define+SYNOPSYS_SV \
+define+SVT_APB_INCLUDE_USER_DEFINES \
+define+SVT_AXI_INCLUDE_USER_DEFINES \
+define+SVT_APB_DISCONNECT_TOP_LEVEL_APB_IF_SIGNALS

all:com sim


#.PHONY:com
com:
	@if [ ! -d $(TC) ]; then mkdir $(TC); fi 
	vcs +plusarg_save -debug_pp -notice  -M -lca -full64 -sverilog +v2k -debug_all  -timescale=1ns/1ps -ntb_opts uvm $(DEFINE)  $(INC_DIR) -file ../filelist/npu.lst ../testbench/tb_top.sv  -f ../filelist/tb.lst -f ../filelist/tc.lst  -l ./$(TC)/compile.log -P ${VERDI_HOME}/share/PLI/VCS/LINUXAMD64/novas.tab ${VERDI_HOME}/share/PLI/VCS/LINUXAMD64/pli.a +vcs+lic+wait  +nospecify +notiming_check 
	@cp ../filelist/rtl.lst filelist.f
	@echo "../testbench/tb_top.sv">>filelist.f





#.PHONY:sim
sim: com
	./simv $(SEED_OPTION) +vcs+lic+wait  -cm_name $(TC) +UVM_TESTNAME=$(TC) -l ./$(TC)/sim.log 
	@cp test.fsdb ./$(TC)/.



verdi:
	verdi -sv -f filelist.f -ssf test.fsdb &


cov:
	urg -dir *vdb -report cov
	@tar -cvf cov.tar cov
	@sz cov.tar




.PHONY:clean
clean:
	@rm -rf simv* csrc ucli.key novas* verdiLog vc_hdrs.h



