rm -rf simv simv.daidir work.lib++

FPGA=$2
DEBUG_SLV=$3

vericom \
-f ../filelist/rtl.lst \
-f ../filelist/tb.lst \
-f ../filelist/tc.lst \
-f ../filelist/dw_axi_mem.lst \
-f ../filelist/dw_axi_gs32.lst \
-f ../filelist/dw_axi_gs128.lst \
-f ../filelist/dw_axi_gs256.lst \
-f ../filelist/dw_axi_gs512.lst \
-f ../filelist/dw_axi_x2x32.lst \
-f ../filelist/dw_axi_x2x128.lst \
-f ../filelist/dw_axi_x2x256.lst \
-f ../filelist/dw_axi_x2x512.lst \
-f ../filelist/dw_axi_x2p_dma.lst \
-f ../filelist/dw_axi_x2x_dma_m.lst \
../testbench/tb_top.sv +define+XDMA_AXI_DEBUG_SLAVE+$DEBUG_SLV+$FPGA

#../bench/tb_top.sv +define+DEBUG_SLV+XDMA_AXI_DEBUG_SLAVE
#../bench/tb_top.sv +define+XDMA_AXI_DEBUG_SLAVE
#../bench/tb_top.sv +define+FPGA+DEBUG+XDMA_AXI_DEBUG_SLAVE

#exit
if [[ $1 ]]
then
opt1=$1
else
opt1=debug_test
fi
echo $opt1
make all TC=$opt1 FPGA_SIM=$FPGA DEBUG_SLV=$DEBUG_SLV
#./r $opt1
