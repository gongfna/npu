// SYNOPSYS_VERA_SHELL

module test_DW_axi_x2p_shell(
        SystemClock
);
input SystemClock;

// parameter decls
parameter vera_load_ApbMonitor = "${VRO_CACHE_DIR}/vip/amba/6.00a/apb_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/ApbMonitor.vro";
parameter vera_load_ApbCoverage = "${VRO_CACHE_DIR}/vip/amba/6.00a/apb_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/ApbCoverage.vro";
parameter vera_load_ApbMonitorCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/apb_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/ApbMonitorCommands.vro";
parameter vera_load_AxiMon64Cfg = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMon64Cfg.vro";
parameter vera_load_AxiMonitorCoverage = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorCoverage.vro";
parameter vera_load_AxiMonSysChks = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonSysChks.vro";
parameter vera_load_AxiMonitor64Internal = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitor64Internal.vro";
parameter vera_load_AxiMonitor = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_monitor_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitor.vro";
parameter vera_load_ApbSlave = "${VRO_CACHE_DIR}/vip/amba/6.00a/apb_slave_vmt/vera/lib/${VERA_VMC}_vmt3.50b/ApbSlave.vro";
parameter vera_load_ApbSlaveCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/apb_slave_vmt/vera/lib/${VERA_VMC}_vmt3.50b/ApbSlaveCommands.vro";
parameter vera_load_ApbXact = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/ApbXact.vro";
parameter vera_load_AmbaBufferMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AmbaBufferMgr.vro";
parameter vera_load_AhbXact = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AhbXact.vro";
parameter vera_load_AmbaXact = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AmbaXact.vro";
parameter vera_load_AmbaCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AmbaCommands.vro";
parameter vera_load_AmbaModel = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AmbaModel.vro";
parameter vera_load_AmbaLibrary = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AmbaLibrary.vro";
parameter vera_load_AxiMasterDriver = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterDriver.vro";
parameter vera_load_AxiMasterReceiver = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterReceiver.vro";
parameter vera_load_AxiMstrXmitMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrXmitMgr.vro";
parameter vera_load_AxiMstrTimer = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrTimer.vro";
parameter vera_load_AxiMstrSemaData = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrSemaData.vro";
parameter vera_load_AxiMstrRcvMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrRcvMgr.vro";
parameter vera_load_AxiMstrOutStndngMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrOutStndngMgr.vro";
parameter vera_load_AxiMstrIntlver = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrIntlver.vro";
parameter vera_load_AxiMstrInnerBuffer = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMstrInnerBuffer.vro";
parameter vera_load_AxiMasterBuffer = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterBuffer.vro";
parameter vera_load_AxiMasterInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterInternal.vro";
parameter vera_load_AxiMasterCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterCommands.vro";
parameter vera_load_AxiMaster = "${VRO_CACHE_DIR}/vip/amba/6.00a/axi_master_vmt/vera/lib/${VERA_VMC}_vmt3.50b/AxiMaster.vro";
parameter vera_load_AxiTransactionLog = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiTransactionLog.vro";
parameter vera_load_AmbaLog = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AmbaLog.vro";
parameter vera_load_AxiMonitorCommonCoverage = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorCommonCoverage.vro";
parameter vera_load_AxiMonitorCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorCommands.vro";
parameter vera_load_AxiMonitorBuffer = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorBuffer.vro";
parameter vera_load_AxiMonChChks = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonChChks.vro";
parameter vera_load_AxiMonXactChks = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonXactChks.vro";
parameter vera_load_AxiMonChecker = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonChecker.vro";
parameter vera_load_AxiMonXactBuf = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonXactBuf.vro";
parameter vera_load_AxiMonCh = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonCh.vro";
parameter vera_load_AxiMonPort = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonPort.vro";
parameter vera_load_AxiMonCfg = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonCfg.vro";
parameter vera_load_AxiMonitorInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorInternal.vro";
parameter vera_load_AxiBusArchitectureConfiguration_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiBusArchitectureConfiguration_rvm.vro";
parameter vera_load_AxiMonitorExtendedTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorExtendedTransaction_rvm.vro";
parameter vera_load_AxiMonitorTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMonitorTransaction_rvm.vro";
parameter vera_load_AxiSlaveTransactionInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiSlaveTransactionInternal.vro";
parameter vera_load_AxiMasterTransactionInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterTransactionInternal.vro";
parameter vera_load_AxiTransactionInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiTransactionInternal.vro";
parameter vera_load_AxiConfigurationInternal = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiConfigurationInternal.vro";
parameter vera_load_AxiConfiguration_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiConfiguration_rvm.vro";
parameter vera_load_AxiSlaveExtendedTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiSlaveExtendedTransaction_rvm.vro";
parameter vera_load_AxiSlaveTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiSlaveTransaction_rvm.vro";
parameter vera_load_AxiMasterExtendedTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterExtendedTransaction_rvm.vro";
parameter vera_load_AxiMasterTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMasterTransaction_rvm.vro";
parameter vera_load_AxiTransaction_rvm = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiTransaction_rvm.vro";
parameter vera_load_AxiMatchObj = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMatchObj.vro";
parameter vera_load_AxiMatchMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMatchMgr.vro";
parameter vera_load_AxiResponseMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiResponseMgr.vro";
parameter vera_load_AxiDriver = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiDriver.vro";
parameter vera_load_AxiReceiver = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiReceiver.vro";
parameter vera_load_AxiRcvMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiRcvMgr.vro";
parameter vera_load_AxiChXfer = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiChXfer.vro";
parameter vera_load_AxiBufferMgr = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiBufferMgr.vro";
parameter vera_load_AxiMdlCfg = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiMdlCfg.vro";
parameter vera_load_AxiCommands = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiCommands.vro";
parameter vera_load_AxiModel = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiModel.vro";
parameter vera_load_AxiLib = "${VRO_CACHE_DIR}/vip/amba/6.00a/vera/lib/${VERA_VMC}_vmt3.50b/AxiLib.vro";
parameter vera_load_dw_vip_rvm = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/dw_vip_rvm.vro";
parameter vera_load_VmtCoverageCommands = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoverageCommands.vro";
parameter vera_load_VmtCoverageManager = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoverageManager.vro";
parameter vera_load_VmtCoverageGroup = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoverageGroup.vro";
parameter vera_load_VmtCoveragePoint = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoveragePoint.vro";
parameter vera_load_VmtCoverageBase = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCoverageBase.vro";
parameter vera_load_VmtTransactionMonitorCommands = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionMonitorCommands.vro";
parameter vera_load_VmtTransactionChoiceMonitor = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionChoiceMonitor.vro";
parameter vera_load_VmtTransactionSequenceMonitor = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionSequenceMonitor.vro";
parameter vera_load_VmtProtocolTransactionMonitor = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtProtocolTransactionMonitor.vro";
parameter vera_load_VmtTransactionMonitor = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionMonitor.vro";
parameter vera_load_VmtPayload = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtPayload.vro";
parameter vera_load_VmtTransactionInfo = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionInfo.vro";
parameter vera_load_VmtTransactionExpression = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionExpression.vro";
parameter vera_load_VmtTransactionCommands = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionCommands.vro";
parameter vera_load_VmtTransactionChoiceGenerator = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionChoiceGenerator.vro";
parameter vera_load_VmtTransactionSequenceGenerator = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionSequenceGenerator.vro";
parameter vera_load_VmtProtocolTransactionGenerator = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtProtocolTransactionGenerator.vro";
parameter vera_load_VmtTransactionGenerator = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransactionGenerator.vro";
parameter vera_load_VmtTransaction = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtTransaction.vro";
parameter vera_load_VmtXactBase = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtXactBase.vro";
parameter vera_load_VmtMem = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtMem.vro";
parameter vera_load_VmtCommonCommands = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCommonCommands.vro";
parameter vera_load_VmtCommandManager = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCommandManager.vro";
parameter vera_load_VmtCommandDispatch = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtCommandDispatch.vro";
parameter vera_load_VmtBase = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtBase.vro";
parameter vera_load_VmtMessageService = "${VRO_CACHE_DIR}/vip/vmt/3.50b/vera/lib/${VERA_VMC}/VmtMessageService.vro";
parameter vera_udf_VipCommon = "${DESIGNWARE_HOME}/vip/common/latest/C/lib/${VERA_PLATFORM}/VipCommon.dl";
parameter vera_udf_VmtModelManager = "${DESIGNWARE_HOME}/vip/vmt/3.50b/C/lib/${VERA_PLATFORM}/VmtModelManager.dl";
parameter vera_runtime_information = "${VERA_VERSION}:${VERA_VMC}:${VERA_PLATFORM}:${DESIGNWARE_HOME}:";
parameter vera_load_all = "./test.vrl";

// Nets which VMC will reference

// System clock: SystemClock
wire SystemClock;

// Interface: pslv_if Signal: pclk
wire pslv_if_pclk;
assign pslv_if_pclk = test_DW_axi_x2p.sclk;

// Interface: pslv_if Signal: presetn
reg vmc_pslv_if_presetn_reg;
assign test_DW_axi_x2p.apb_vip_resetn = vmc_pslv_if_presetn_reg;
wire pslv_if_presetn;
assign pslv_if_presetn = test_DW_axi_x2p.apb_vip_resetn;

// Interface: pslv_if Signal: psel
wire [15:0] pslv_if_psel;
assign pslv_if_psel = test_DW_axi_x2p.b_psel;

// Interface: pslv_if Signal: penable
wire pslv_if_penable;
assign pslv_if_penable = test_DW_axi_x2p.b_penable;

// Interface: pslv_if Signal: paddr
reg [31:0] vmc_pslv_if_paddr_reg;
assign test_DW_axi_x2p.b_paddr = vmc_pslv_if_paddr_reg;
wire [31:0] pslv_if_paddr;
assign pslv_if_paddr = test_DW_axi_x2p.b_paddr;

// Interface: pslv_if Signal: pwrite
reg vmc_pslv_if_pwrite_reg;
assign test_DW_axi_x2p.b_pwrite = vmc_pslv_if_pwrite_reg;
wire pslv_if_pwrite;
assign pslv_if_pwrite = test_DW_axi_x2p.b_pwrite;

// Interface: pslv_if Signal: pwdata
reg [31:0] vmc_pslv_if_pwdata_reg;
assign test_DW_axi_x2p.b_pwdata = vmc_pslv_if_pwdata_reg;
wire [31:0] pslv_if_pwdata;
assign pslv_if_pwdata = test_DW_axi_x2p.b_pwdata;

// Interface: pslv_if Signal: prdata
reg [31:0] vmc_pslv_if_prdata_reg;
assign test_DW_axi_x2p.prdata = vmc_pslv_if_prdata_reg;
wire [31:0] pslv_if_prdata;
assign pslv_if_prdata = test_DW_axi_x2p.prdata;

// Interface: pslv_if Signal: prdata_s0
reg [31:0] vmc_pslv_if_prdata_s0_reg;
assign test_DW_axi_x2p.prdata_s0 = vmc_pslv_if_prdata_s0_reg;
wire [31:0] pslv_if_prdata_s0;
assign pslv_if_prdata_s0 = test_DW_axi_x2p.prdata_s0;

// Interface: pslv_if Signal: prdata_s1
reg [31:0] vmc_pslv_if_prdata_s1_reg;
assign test_DW_axi_x2p.prdata_s1 = vmc_pslv_if_prdata_s1_reg;
wire [31:0] pslv_if_prdata_s1;
assign pslv_if_prdata_s1 = test_DW_axi_x2p.prdata_s1;

// Interface: pslv_if Signal: prdata_s2
reg [31:0] vmc_pslv_if_prdata_s2_reg;
assign test_DW_axi_x2p.prdata_s2 = vmc_pslv_if_prdata_s2_reg;
wire [31:0] pslv_if_prdata_s2;
assign pslv_if_prdata_s2 = test_DW_axi_x2p.prdata_s2;

// Interface: pslv_if Signal: prdata_s3
reg [31:0] vmc_pslv_if_prdata_s3_reg;
assign test_DW_axi_x2p.prdata_s3 = vmc_pslv_if_prdata_s3_reg;
wire [31:0] pslv_if_prdata_s3;
assign pslv_if_prdata_s3 = test_DW_axi_x2p.prdata_s3;

// Interface: pslv_if Signal: prdata_s4
reg [31:0] vmc_pslv_if_prdata_s4_reg;
assign test_DW_axi_x2p.prdata_s4 = vmc_pslv_if_prdata_s4_reg;
wire [31:0] pslv_if_prdata_s4;
assign pslv_if_prdata_s4 = test_DW_axi_x2p.prdata_s4;

// Interface: pslv_if Signal: prdata_s5
reg [31:0] vmc_pslv_if_prdata_s5_reg;
assign test_DW_axi_x2p.prdata_s5 = vmc_pslv_if_prdata_s5_reg;
wire [31:0] pslv_if_prdata_s5;
assign pslv_if_prdata_s5 = test_DW_axi_x2p.prdata_s5;

// Interface: pslv_if Signal: prdata_s6
reg [31:0] vmc_pslv_if_prdata_s6_reg;
assign test_DW_axi_x2p.prdata_s6 = vmc_pslv_if_prdata_s6_reg;
wire [31:0] pslv_if_prdata_s6;
assign pslv_if_prdata_s6 = test_DW_axi_x2p.prdata_s6;

// Interface: pslv_if Signal: prdata_s7
reg [31:0] vmc_pslv_if_prdata_s7_reg;
assign test_DW_axi_x2p.prdata_s7 = vmc_pslv_if_prdata_s7_reg;
wire [31:0] pslv_if_prdata_s7;
assign pslv_if_prdata_s7 = test_DW_axi_x2p.prdata_s7;

// Interface: pslv_if Signal: prdata_s8
reg [31:0] vmc_pslv_if_prdata_s8_reg;
assign test_DW_axi_x2p.prdata_s8 = vmc_pslv_if_prdata_s8_reg;
wire [31:0] pslv_if_prdata_s8;
assign pslv_if_prdata_s8 = test_DW_axi_x2p.prdata_s8;

// Interface: pslv_if Signal: prdata_s9
reg [31:0] vmc_pslv_if_prdata_s9_reg;
assign test_DW_axi_x2p.prdata_s9 = vmc_pslv_if_prdata_s9_reg;
wire [31:0] pslv_if_prdata_s9;
assign pslv_if_prdata_s9 = test_DW_axi_x2p.prdata_s9;

// Interface: pslv_if Signal: prdata_s10
reg [31:0] vmc_pslv_if_prdata_s10_reg;
assign test_DW_axi_x2p.prdata_s10 = vmc_pslv_if_prdata_s10_reg;
wire [31:0] pslv_if_prdata_s10;
assign pslv_if_prdata_s10 = test_DW_axi_x2p.prdata_s10;

// Interface: pslv_if Signal: prdata_s11
reg [31:0] vmc_pslv_if_prdata_s11_reg;
assign test_DW_axi_x2p.prdata_s11 = vmc_pslv_if_prdata_s11_reg;
wire [31:0] pslv_if_prdata_s11;
assign pslv_if_prdata_s11 = test_DW_axi_x2p.prdata_s11;

// Interface: pslv_if Signal: prdata_s12
reg [31:0] vmc_pslv_if_prdata_s12_reg;
assign test_DW_axi_x2p.prdata_s12 = vmc_pslv_if_prdata_s12_reg;
wire [31:0] pslv_if_prdata_s12;
assign pslv_if_prdata_s12 = test_DW_axi_x2p.prdata_s12;

// Interface: pslv_if Signal: prdata_s13
reg [31:0] vmc_pslv_if_prdata_s13_reg;
assign test_DW_axi_x2p.prdata_s13 = vmc_pslv_if_prdata_s13_reg;
wire [31:0] pslv_if_prdata_s13;
assign pslv_if_prdata_s13 = test_DW_axi_x2p.prdata_s13;

// Interface: pslv_if Signal: prdata_s14
reg [31:0] vmc_pslv_if_prdata_s14_reg;
assign test_DW_axi_x2p.prdata_s14 = vmc_pslv_if_prdata_s14_reg;
wire [31:0] pslv_if_prdata_s14;
assign pslv_if_prdata_s14 = test_DW_axi_x2p.prdata_s14;

// Interface: pslv_if Signal: prdata_s15
reg [31:0] vmc_pslv_if_prdata_s15_reg;
assign test_DW_axi_x2p.prdata_s15 = vmc_pslv_if_prdata_s15_reg;
wire [31:0] pslv_if_prdata_s15;
assign pslv_if_prdata_s15 = test_DW_axi_x2p.prdata_s15;

// Interface: pslv_if Signal: pready
wire pslv_if_pready;
assign pslv_if_pready = test_DW_axi_x2p.pready;

// Interface: pslv_if Signal: pready_s0
reg vmc_pslv_if_pready_s0_reg;
assign test_DW_axi_x2p.pready_s0 = vmc_pslv_if_pready_s0_reg;
wire pslv_if_pready_s0;
assign pslv_if_pready_s0 = test_DW_axi_x2p.pready_s0;

// Interface: pslv_if Signal: pready_s1
reg vmc_pslv_if_pready_s1_reg;
assign test_DW_axi_x2p.pready_s1 = vmc_pslv_if_pready_s1_reg;
wire pslv_if_pready_s1;
assign pslv_if_pready_s1 = test_DW_axi_x2p.pready_s1;

// Interface: pslv_if Signal: pready_s2
reg vmc_pslv_if_pready_s2_reg;
assign test_DW_axi_x2p.pready_s2 = vmc_pslv_if_pready_s2_reg;
wire pslv_if_pready_s2;
assign pslv_if_pready_s2 = test_DW_axi_x2p.pready_s2;

// Interface: pslv_if Signal: pready_s3
reg vmc_pslv_if_pready_s3_reg;
assign test_DW_axi_x2p.pready_s3 = vmc_pslv_if_pready_s3_reg;
wire pslv_if_pready_s3;
assign pslv_if_pready_s3 = test_DW_axi_x2p.pready_s3;

// Interface: pslv_if Signal: pready_s4
reg vmc_pslv_if_pready_s4_reg;
assign test_DW_axi_x2p.pready_s4 = vmc_pslv_if_pready_s4_reg;
wire pslv_if_pready_s4;
assign pslv_if_pready_s4 = test_DW_axi_x2p.pready_s4;

// Interface: pslv_if Signal: pready_s5
reg vmc_pslv_if_pready_s5_reg;
assign test_DW_axi_x2p.pready_s5 = vmc_pslv_if_pready_s5_reg;
wire pslv_if_pready_s5;
assign pslv_if_pready_s5 = test_DW_axi_x2p.pready_s5;

// Interface: pslv_if Signal: pready_s6
reg vmc_pslv_if_pready_s6_reg;
assign test_DW_axi_x2p.pready_s6 = vmc_pslv_if_pready_s6_reg;
wire pslv_if_pready_s6;
assign pslv_if_pready_s6 = test_DW_axi_x2p.pready_s6;

// Interface: pslv_if Signal: pready_s7
reg vmc_pslv_if_pready_s7_reg;
assign test_DW_axi_x2p.pready_s7 = vmc_pslv_if_pready_s7_reg;
wire pslv_if_pready_s7;
assign pslv_if_pready_s7 = test_DW_axi_x2p.pready_s7;

// Interface: pslv_if Signal: pready_s8
reg vmc_pslv_if_pready_s8_reg;
assign test_DW_axi_x2p.pready_s8 = vmc_pslv_if_pready_s8_reg;
wire pslv_if_pready_s8;
assign pslv_if_pready_s8 = test_DW_axi_x2p.pready_s8;

// Interface: pslv_if Signal: pready_s9
reg vmc_pslv_if_pready_s9_reg;
assign test_DW_axi_x2p.pready_s9 = vmc_pslv_if_pready_s9_reg;
wire pslv_if_pready_s9;
assign pslv_if_pready_s9 = test_DW_axi_x2p.pready_s9;

// Interface: pslv_if Signal: pready_s10
reg vmc_pslv_if_pready_s10_reg;
assign test_DW_axi_x2p.pready_s10 = vmc_pslv_if_pready_s10_reg;
wire pslv_if_pready_s10;
assign pslv_if_pready_s10 = test_DW_axi_x2p.pready_s10;

// Interface: pslv_if Signal: pready_s11
reg vmc_pslv_if_pready_s11_reg;
assign test_DW_axi_x2p.pready_s11 = vmc_pslv_if_pready_s11_reg;
wire pslv_if_pready_s11;
assign pslv_if_pready_s11 = test_DW_axi_x2p.pready_s11;

// Interface: pslv_if Signal: pready_s12
reg vmc_pslv_if_pready_s12_reg;
assign test_DW_axi_x2p.pready_s12 = vmc_pslv_if_pready_s12_reg;
wire pslv_if_pready_s12;
assign pslv_if_pready_s12 = test_DW_axi_x2p.pready_s12;

// Interface: pslv_if Signal: pready_s13
reg vmc_pslv_if_pready_s13_reg;
assign test_DW_axi_x2p.pready_s13 = vmc_pslv_if_pready_s13_reg;
wire pslv_if_pready_s13;
assign pslv_if_pready_s13 = test_DW_axi_x2p.pready_s13;

// Interface: pslv_if Signal: pready_s14
reg vmc_pslv_if_pready_s14_reg;
assign test_DW_axi_x2p.pready_s14 = vmc_pslv_if_pready_s14_reg;
wire pslv_if_pready_s14;
assign pslv_if_pready_s14 = test_DW_axi_x2p.pready_s14;

// Interface: pslv_if Signal: pready_s15
reg vmc_pslv_if_pready_s15_reg;
assign test_DW_axi_x2p.pready_s15 = vmc_pslv_if_pready_s15_reg;
wire pslv_if_pready_s15;
assign pslv_if_pready_s15 = test_DW_axi_x2p.pready_s15;

// Interface: pslv_if Signal: pslverr
wire pslv_if_pslverr;
assign pslv_if_pslverr = test_DW_axi_x2p.pslverr;

// Interface: pslv_if Signal: pslverr_s0
reg vmc_pslv_if_pslverr_s0_reg;
assign test_DW_axi_x2p.pslverr_s0 = vmc_pslv_if_pslverr_s0_reg;
wire pslv_if_pslverr_s0;
assign pslv_if_pslverr_s0 = test_DW_axi_x2p.pslverr_s0;

// Interface: pslv_if Signal: pslverr_s1
reg vmc_pslv_if_pslverr_s1_reg;
assign test_DW_axi_x2p.pslverr_s1 = vmc_pslv_if_pslverr_s1_reg;
wire pslv_if_pslverr_s1;
assign pslv_if_pslverr_s1 = test_DW_axi_x2p.pslverr_s1;

// Interface: pslv_if Signal: pslverr_s2
reg vmc_pslv_if_pslverr_s2_reg;
assign test_DW_axi_x2p.pslverr_s2 = vmc_pslv_if_pslverr_s2_reg;
wire pslv_if_pslverr_s2;
assign pslv_if_pslverr_s2 = test_DW_axi_x2p.pslverr_s2;

// Interface: pslv_if Signal: pslverr_s3
reg vmc_pslv_if_pslverr_s3_reg;
assign test_DW_axi_x2p.pslverr_s3 = vmc_pslv_if_pslverr_s3_reg;
wire pslv_if_pslverr_s3;
assign pslv_if_pslverr_s3 = test_DW_axi_x2p.pslverr_s3;

// Interface: pslv_if Signal: pslverr_s4
reg vmc_pslv_if_pslverr_s4_reg;
assign test_DW_axi_x2p.pslverr_s4 = vmc_pslv_if_pslverr_s4_reg;
wire pslv_if_pslverr_s4;
assign pslv_if_pslverr_s4 = test_DW_axi_x2p.pslverr_s4;

// Interface: pslv_if Signal: pslverr_s5
reg vmc_pslv_if_pslverr_s5_reg;
assign test_DW_axi_x2p.pslverr_s5 = vmc_pslv_if_pslverr_s5_reg;
wire pslv_if_pslverr_s5;
assign pslv_if_pslverr_s5 = test_DW_axi_x2p.pslverr_s5;

// Interface: pslv_if Signal: pslverr_s6
reg vmc_pslv_if_pslverr_s6_reg;
assign test_DW_axi_x2p.pslverr_s6 = vmc_pslv_if_pslverr_s6_reg;
wire pslv_if_pslverr_s6;
assign pslv_if_pslverr_s6 = test_DW_axi_x2p.pslverr_s6;

// Interface: pslv_if Signal: pslverr_s7
reg vmc_pslv_if_pslverr_s7_reg;
assign test_DW_axi_x2p.pslverr_s7 = vmc_pslv_if_pslverr_s7_reg;
wire pslv_if_pslverr_s7;
assign pslv_if_pslverr_s7 = test_DW_axi_x2p.pslverr_s7;

// Interface: pslv_if Signal: pslverr_s8
reg vmc_pslv_if_pslverr_s8_reg;
assign test_DW_axi_x2p.pslverr_s8 = vmc_pslv_if_pslverr_s8_reg;
wire pslv_if_pslverr_s8;
assign pslv_if_pslverr_s8 = test_DW_axi_x2p.pslverr_s8;

// Interface: pslv_if Signal: pslverr_s9
reg vmc_pslv_if_pslverr_s9_reg;
assign test_DW_axi_x2p.pslverr_s9 = vmc_pslv_if_pslverr_s9_reg;
wire pslv_if_pslverr_s9;
assign pslv_if_pslverr_s9 = test_DW_axi_x2p.pslverr_s9;

// Interface: pslv_if Signal: pslverr_s10
reg vmc_pslv_if_pslverr_s10_reg;
assign test_DW_axi_x2p.pslverr_s10 = vmc_pslv_if_pslverr_s10_reg;
wire pslv_if_pslverr_s10;
assign pslv_if_pslverr_s10 = test_DW_axi_x2p.pslverr_s10;

// Interface: pslv_if Signal: pslverr_s11
reg vmc_pslv_if_pslverr_s11_reg;
assign test_DW_axi_x2p.pslverr_s11 = vmc_pslv_if_pslverr_s11_reg;
wire pslv_if_pslverr_s11;
assign pslv_if_pslverr_s11 = test_DW_axi_x2p.pslverr_s11;

// Interface: pslv_if Signal: pslverr_s12
reg vmc_pslv_if_pslverr_s12_reg;
assign test_DW_axi_x2p.pslverr_s12 = vmc_pslv_if_pslverr_s12_reg;
wire pslv_if_pslverr_s12;
assign pslv_if_pslverr_s12 = test_DW_axi_x2p.pslverr_s12;

// Interface: pslv_if Signal: pslverr_s13
reg vmc_pslv_if_pslverr_s13_reg;
assign test_DW_axi_x2p.pslverr_s13 = vmc_pslv_if_pslverr_s13_reg;
wire pslv_if_pslverr_s13;
assign pslv_if_pslverr_s13 = test_DW_axi_x2p.pslverr_s13;

// Interface: pslv_if Signal: pslverr_s14
reg vmc_pslv_if_pslverr_s14_reg;
assign test_DW_axi_x2p.pslverr_s14 = vmc_pslv_if_pslverr_s14_reg;
wire pslv_if_pslverr_s14;
assign pslv_if_pslverr_s14 = test_DW_axi_x2p.pslverr_s14;

// Interface: pslv_if Signal: pslverr_s15
reg vmc_pslv_if_pslverr_s15_reg;
assign test_DW_axi_x2p.pslverr_s15 = vmc_pslv_if_pslverr_s15_reg;
wire pslv_if_pslverr_s15;
assign pslv_if_pslverr_s15 = test_DW_axi_x2p.pslverr_s15;

// Interface: pslv_if Signal: psel_nu
wire pslv_if_psel_nu;
assign pslv_if_psel_nu = test_DW_axi_x2p.psel_nu;

// Interface: pslv_if Signal: penable_nu
wire pslv_if_penable_nu;
assign pslv_if_penable_nu = test_DW_axi_x2p.penable_nu;

// Interface: pslv_if Signal: paddr_nu
wire [31:0] pslv_if_paddr_nu;
assign pslv_if_paddr_nu = test_DW_axi_x2p.paddr_nu;

// Interface: pslv_if Signal: pwrite_nu
wire pslv_if_pwrite_nu;
assign pslv_if_pwrite_nu = test_DW_axi_x2p.pwrite_nu;

// Interface: pslv_if Signal: pwdata_nu
wire [31:0] pslv_if_pwdata_nu;
assign pslv_if_pwdata_nu = test_DW_axi_x2p.pwdata_nu;

// Interface: pslv_if Signal: pready_nu
reg vmc_pslv_if_pready_nu_reg;
assign test_DW_axi_x2p.pready_nu = vmc_pslv_if_pready_nu_reg;
wire pslv_if_pready_nu;
assign pslv_if_pready_nu = test_DW_axi_x2p.pready_nu;

// Interface: pslv_if Signal: prdata_nu
reg [31:0] vmc_pslv_if_prdata_nu_reg;
assign test_DW_axi_x2p.prdata_nu = vmc_pslv_if_prdata_nu_reg;
wire [31:0] pslv_if_prdata_nu;
assign pslv_if_prdata_nu = test_DW_axi_x2p.prdata_nu;

// Interface: pslv_if Signal: pslverr_nu
reg vmc_pslv_if_pslverr_nu_reg;
assign test_DW_axi_x2p.pslverr_nu = vmc_pslv_if_pslverr_nu_reg;
wire pslv_if_pslverr_nu;
assign pslv_if_pslverr_nu = test_DW_axi_x2p.pslverr_nu;

// Interface: axm0_if Signal: aclk
wire axm0_if_aclk;
assign axm0_if_aclk = test_DW_axi_x2p.pclk;

// Interface: axm0_if Signal: aresetn
reg vmc_axm0_if_aresetn_reg;
assign test_DW_axi_x2p.a_aresetn_m0 = vmc_axm0_if_aresetn_reg;
wire axm0_if_aresetn;
assign axm0_if_aresetn = test_DW_axi_x2p.a_aresetn_m0;

// Interface: axm0_if Signal: awvalid
reg vmc_axm0_if_awvalid_reg;
assign test_DW_axi_x2p.a_awvalid_m0 = vmc_axm0_if_awvalid_reg;
wire axm0_if_awvalid;
assign axm0_if_awvalid = test_DW_axi_x2p.a_awvalid_m0;

// Interface: axm0_if Signal: awaddr
reg [63:0] vmc_axm0_if_awaddr_reg;
assign test_DW_axi_x2p.a_awaddr_m0 = vmc_axm0_if_awaddr_reg;
wire [63:0] axm0_if_awaddr;
assign axm0_if_awaddr = test_DW_axi_x2p.a_awaddr_m0;

// Interface: axm0_if Signal: awlen
reg [9:0] vmc_axm0_if_awlen_reg;
assign test_DW_axi_x2p.a_awlen_m0 = vmc_axm0_if_awlen_reg;
wire [9:0] axm0_if_awlen;
assign axm0_if_awlen = test_DW_axi_x2p.a_awlen_m0;

// Interface: axm0_if Signal: awsize
reg [2:0] vmc_axm0_if_awsize_reg;
assign test_DW_axi_x2p.a_awsize_m0 = vmc_axm0_if_awsize_reg;
wire [2:0] axm0_if_awsize;
assign axm0_if_awsize = test_DW_axi_x2p.a_awsize_m0;

// Interface: axm0_if Signal: awburst
reg [1:0] vmc_axm0_if_awburst_reg;
assign test_DW_axi_x2p.a_awburst_m0 = vmc_axm0_if_awburst_reg;
wire [1:0] axm0_if_awburst;
assign axm0_if_awburst = test_DW_axi_x2p.a_awburst_m0;

// Interface: axm0_if Signal: awlock
reg [1:0] vmc_axm0_if_awlock_reg;
assign test_DW_axi_x2p.a_awlock_m0 = vmc_axm0_if_awlock_reg;
wire [1:0] axm0_if_awlock;
assign axm0_if_awlock = test_DW_axi_x2p.a_awlock_m0;

// Interface: axm0_if Signal: awcache
reg [3:0] vmc_axm0_if_awcache_reg;
assign test_DW_axi_x2p.a_awcache_m0 = vmc_axm0_if_awcache_reg;
wire [3:0] axm0_if_awcache;
assign axm0_if_awcache = test_DW_axi_x2p.a_awcache_m0;

// Interface: axm0_if Signal: awprot
reg [2:0] vmc_axm0_if_awprot_reg;
assign test_DW_axi_x2p.a_awprot_m0 = vmc_axm0_if_awprot_reg;
wire [2:0] axm0_if_awprot;
assign axm0_if_awprot = test_DW_axi_x2p.a_awprot_m0;

// Interface: axm0_if Signal: awid
reg [31:0] vmc_axm0_if_awid_reg;
assign test_DW_axi_x2p.a_awid_m0 = vmc_axm0_if_awid_reg;
wire [31:0] axm0_if_awid;
assign axm0_if_awid = test_DW_axi_x2p.a_awid_m0;

// Interface: axm0_if Signal: awready
reg vmc_axm0_if_awready_reg;
assign test_DW_axi_x2p.a_awready_m0 = vmc_axm0_if_awready_reg;
wire axm0_if_awready;
assign axm0_if_awready = test_DW_axi_x2p.a_awready_m0;

// Interface: axm0_if Signal: arvalid
reg vmc_axm0_if_arvalid_reg;
assign test_DW_axi_x2p.a_arvalid_m0 = vmc_axm0_if_arvalid_reg;
wire axm0_if_arvalid;
assign axm0_if_arvalid = test_DW_axi_x2p.a_arvalid_m0;

// Interface: axm0_if Signal: araddr
reg [63:0] vmc_axm0_if_araddr_reg;
assign test_DW_axi_x2p.a_araddr_m0 = vmc_axm0_if_araddr_reg;
wire [63:0] axm0_if_araddr;
assign axm0_if_araddr = test_DW_axi_x2p.a_araddr_m0;

// Interface: axm0_if Signal: arlen
reg [9:0] vmc_axm0_if_arlen_reg;
assign test_DW_axi_x2p.a_arlen_m0 = vmc_axm0_if_arlen_reg;
wire [9:0] axm0_if_arlen;
assign axm0_if_arlen = test_DW_axi_x2p.a_arlen_m0;

// Interface: axm0_if Signal: arsize
reg [2:0] vmc_axm0_if_arsize_reg;
assign test_DW_axi_x2p.a_arsize_m0 = vmc_axm0_if_arsize_reg;
wire [2:0] axm0_if_arsize;
assign axm0_if_arsize = test_DW_axi_x2p.a_arsize_m0;

// Interface: axm0_if Signal: arburst
reg [1:0] vmc_axm0_if_arburst_reg;
assign test_DW_axi_x2p.a_arburst_m0 = vmc_axm0_if_arburst_reg;
wire [1:0] axm0_if_arburst;
assign axm0_if_arburst = test_DW_axi_x2p.a_arburst_m0;

// Interface: axm0_if Signal: arlock
reg [1:0] vmc_axm0_if_arlock_reg;
assign test_DW_axi_x2p.a_arlock_m0 = vmc_axm0_if_arlock_reg;
wire [1:0] axm0_if_arlock;
assign axm0_if_arlock = test_DW_axi_x2p.a_arlock_m0;

// Interface: axm0_if Signal: arcache
reg [3:0] vmc_axm0_if_arcache_reg;
assign test_DW_axi_x2p.a_arcache_m0 = vmc_axm0_if_arcache_reg;
wire [3:0] axm0_if_arcache;
assign axm0_if_arcache = test_DW_axi_x2p.a_arcache_m0;

// Interface: axm0_if Signal: arprot
reg [2:0] vmc_axm0_if_arprot_reg;
assign test_DW_axi_x2p.a_arprot_m0 = vmc_axm0_if_arprot_reg;
wire [2:0] axm0_if_arprot;
assign axm0_if_arprot = test_DW_axi_x2p.a_arprot_m0;

// Interface: axm0_if Signal: arid
reg [31:0] vmc_axm0_if_arid_reg;
assign test_DW_axi_x2p.a_arid_m0 = vmc_axm0_if_arid_reg;
wire [31:0] axm0_if_arid;
assign axm0_if_arid = test_DW_axi_x2p.a_arid_m0;

// Interface: axm0_if Signal: arready
reg vmc_axm0_if_arready_reg;
assign test_DW_axi_x2p.a_arready_m0 = vmc_axm0_if_arready_reg;
wire axm0_if_arready;
assign axm0_if_arready = test_DW_axi_x2p.a_arready_m0;

// Interface: axm0_if Signal: rvalid
reg vmc_axm0_if_rvalid_reg;
assign test_DW_axi_x2p.a_rvalid_m0 = vmc_axm0_if_rvalid_reg;
wire axm0_if_rvalid;
assign axm0_if_rvalid = test_DW_axi_x2p.a_rvalid_m0;

// Interface: axm0_if Signal: rlast
reg vmc_axm0_if_rlast_reg;
assign test_DW_axi_x2p.a_rlast_m0 = vmc_axm0_if_rlast_reg;
wire axm0_if_rlast;
assign axm0_if_rlast = test_DW_axi_x2p.a_rlast_m0;

// Interface: axm0_if Signal: rdata
reg [1023:0] vmc_axm0_if_rdata_reg;
assign test_DW_axi_x2p.a_rdata_m0 = vmc_axm0_if_rdata_reg;
wire [1023:0] axm0_if_rdata;
assign axm0_if_rdata = test_DW_axi_x2p.a_rdata_m0;

// Interface: axm0_if Signal: rresp
reg [1:0] vmc_axm0_if_rresp_reg;
assign test_DW_axi_x2p.a_rresp_m0 = vmc_axm0_if_rresp_reg;
wire [1:0] axm0_if_rresp;
assign axm0_if_rresp = test_DW_axi_x2p.a_rresp_m0;

// Interface: axm0_if Signal: rid
reg [31:0] vmc_axm0_if_rid_reg;
assign test_DW_axi_x2p.a_rid_m0 = vmc_axm0_if_rid_reg;
wire [31:0] axm0_if_rid;
assign axm0_if_rid = test_DW_axi_x2p.a_rid_m0;

// Interface: axm0_if Signal: rready
reg vmc_axm0_if_rready_reg;
assign test_DW_axi_x2p.a_rready_m0 = vmc_axm0_if_rready_reg;
wire axm0_if_rready;
assign axm0_if_rready = test_DW_axi_x2p.a_rready_m0;

// Interface: axm0_if Signal: wvalid
reg vmc_axm0_if_wvalid_reg;
assign test_DW_axi_x2p.a_wvalid_m0 = vmc_axm0_if_wvalid_reg;
wire axm0_if_wvalid;
assign axm0_if_wvalid = test_DW_axi_x2p.a_wvalid_m0;

// Interface: axm0_if Signal: wlast
reg vmc_axm0_if_wlast_reg;
assign test_DW_axi_x2p.a_wlast_m0 = vmc_axm0_if_wlast_reg;
wire axm0_if_wlast;
assign axm0_if_wlast = test_DW_axi_x2p.a_wlast_m0;

// Interface: axm0_if Signal: wdata
reg [1023:0] vmc_axm0_if_wdata_reg;
assign test_DW_axi_x2p.a_wdata_m0 = vmc_axm0_if_wdata_reg;
wire [1023:0] axm0_if_wdata;
assign axm0_if_wdata = test_DW_axi_x2p.a_wdata_m0;

// Interface: axm0_if Signal: wstrb
reg [127:0] vmc_axm0_if_wstrb_reg;
assign test_DW_axi_x2p.a_wstrb_m0 = vmc_axm0_if_wstrb_reg;
wire [127:0] axm0_if_wstrb;
assign axm0_if_wstrb = test_DW_axi_x2p.a_wstrb_m0;

// Interface: axm0_if Signal: wid
reg [31:0] vmc_axm0_if_wid_reg;
assign test_DW_axi_x2p.a_wid_m0 = vmc_axm0_if_wid_reg;
wire [31:0] axm0_if_wid;
assign axm0_if_wid = test_DW_axi_x2p.a_wid_m0;

// Interface: axm0_if Signal: wready
wire axm0_if_wready;
assign axm0_if_wready = test_DW_axi_x2p.a_wready_m0;

// Interface: axm0_if Signal: bvalid
reg vmc_axm0_if_bvalid_reg;
assign test_DW_axi_x2p.a_bvalid_m0 = vmc_axm0_if_bvalid_reg;
wire axm0_if_bvalid;
assign axm0_if_bvalid = test_DW_axi_x2p.a_bvalid_m0;

// Interface: axm0_if Signal: bresp
reg [1:0] vmc_axm0_if_bresp_reg;
assign test_DW_axi_x2p.a_bresp_m0 = vmc_axm0_if_bresp_reg;
wire [1:0] axm0_if_bresp;
assign axm0_if_bresp = test_DW_axi_x2p.a_bresp_m0;

// Interface: axm0_if Signal: bid
reg [31:0] vmc_axm0_if_bid_reg;
assign test_DW_axi_x2p.a_bid_m0 = vmc_axm0_if_bid_reg;
wire [31:0] axm0_if_bid;
assign axm0_if_bid = test_DW_axi_x2p.a_bid_m0;

// Interface: axm0_if Signal: bready
reg vmc_axm0_if_bready_reg;
assign test_DW_axi_x2p.a_bready_m0 = vmc_axm0_if_bready_reg;
wire axm0_if_bready;
assign axm0_if_bready = test_DW_axi_x2p.a_bready_m0;

// Interface: axm0_if Signal: csysreq
reg vmc_axm0_if_csysreq_reg;
assign test_DW_axi_x2p.a_csysreq_m0 = vmc_axm0_if_csysreq_reg;
wire axm0_if_csysreq;
assign axm0_if_csysreq = test_DW_axi_x2p.a_csysreq_m0;

// Interface: axm0_if Signal: csysack
reg vmc_axm0_if_csysack_reg;
assign test_DW_axi_x2p.a_csysack_m0 = vmc_axm0_if_csysack_reg;
wire axm0_if_csysack;
assign axm0_if_csysack = test_DW_axi_x2p.a_csysack_m0;

// Interface: axm0_if Signal: cactive
reg vmc_axm0_if_cactive_reg;
assign test_DW_axi_x2p.a_cactive_m0 = vmc_axm0_if_cactive_reg;
wire axm0_if_cactive;
assign axm0_if_cactive = test_DW_axi_x2p.a_cactive_m0;

// Interface: axm0_if Signal: awsideband
reg [63:0] vmc_axm0_if_awsideband_reg;
assign test_DW_axi_x2p.a_awsideband_m0 = vmc_axm0_if_awsideband_reg;
wire [63:0] axm0_if_awsideband;
assign axm0_if_awsideband = test_DW_axi_x2p.a_awsideband_m0;

// Interface: axm0_if Signal: arsideband
reg [63:0] vmc_axm0_if_arsideband_reg;
assign test_DW_axi_x2p.a_arsideband_m0 = vmc_axm0_if_arsideband_reg;
wire [63:0] axm0_if_arsideband;
assign axm0_if_arsideband = test_DW_axi_x2p.a_arsideband_m0;

// Interface: axm0_if Signal: rsideband
reg [63:0] vmc_axm0_if_rsideband_reg;
assign test_DW_axi_x2p.a_rsideband_m0 = vmc_axm0_if_rsideband_reg;
wire [63:0] axm0_if_rsideband;
assign axm0_if_rsideband = test_DW_axi_x2p.a_rsideband_m0;

// Interface: axm0_if Signal: wsideband
reg [63:0] vmc_axm0_if_wsideband_reg;
assign test_DW_axi_x2p.a_wsideband_m0 = vmc_axm0_if_wsideband_reg;
wire [63:0] axm0_if_wsideband;
assign axm0_if_wsideband = test_DW_axi_x2p.a_wsideband_m0;

// Interface: axm0_if Signal: bsideband
reg [63:0] vmc_axm0_if_bsideband_reg;
assign test_DW_axi_x2p.a_bsideband_m0 = vmc_axm0_if_bsideband_reg;
wire [63:0] axm0_if_bsideband;
assign axm0_if_bsideband = test_DW_axi_x2p.a_bsideband_m0;

// Interface: tb_if Signal: hclk
wire tb_if_hclk;
assign tb_if_hclk = test_DW_axi_x2p.sclk;

// Interface: tb_if Signal: force_a_reset
reg vmc_tb_if_force_a_reset_reg;
assign test_DW_axi_x2p.force_a_reset = vmc_tb_if_force_a_reset_reg;
wire tb_if_force_a_reset;
assign tb_if_force_a_reset = test_DW_axi_x2p.force_a_reset;

// Interface: tb_if Signal: force_b_reset
reg vmc_tb_if_force_b_reset_reg;
assign test_DW_axi_x2p.force_b_reset = vmc_tb_if_force_b_reset_reg;
wire tb_if_force_b_reset;
assign tb_if_force_b_reset = test_DW_axi_x2p.force_b_reset;

// Interface: tb_if Signal: sim_a_clk_period
wire [31:0] tb_if_sim_a_clk_period;
assign tb_if_sim_a_clk_period = test_DW_axi_x2p.sim_a_clk_period;

// Interface: tb_if Signal: sim_b_clk_period
wire [31:0] tb_if_sim_b_clk_period;
assign tb_if_sim_b_clk_period = test_DW_axi_x2p.sim_b_clk_period;

// Interface: tb_if Signal: cvrgen
reg vmc_tb_if_cvrgen_reg;
assign test_DW_axi_x2p.cvrgen = vmc_tb_if_cvrgen_reg;
wire tb_if_cvrgen;
assign tb_if_cvrgen = test_DW_axi_x2p.cvrgen;

// Interface: x_mon_if Signal: arvalid_s1
wire x_mon_if_arvalid_s1;
assign x_mon_if_arvalid_s1 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s2
wire x_mon_if_arvalid_s2;
assign x_mon_if_arvalid_s2 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s3
wire x_mon_if_arvalid_s3;
assign x_mon_if_arvalid_s3 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s4
wire x_mon_if_arvalid_s4;
assign x_mon_if_arvalid_s4 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s5
wire x_mon_if_arvalid_s5;
assign x_mon_if_arvalid_s5 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s6
wire x_mon_if_arvalid_s6;
assign x_mon_if_arvalid_s6 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s7
wire x_mon_if_arvalid_s7;
assign x_mon_if_arvalid_s7 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s8
wire x_mon_if_arvalid_s8;
assign x_mon_if_arvalid_s8 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s9
wire x_mon_if_arvalid_s9;
assign x_mon_if_arvalid_s9 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s10
wire x_mon_if_arvalid_s10;
assign x_mon_if_arvalid_s10 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s11
wire x_mon_if_arvalid_s11;
assign x_mon_if_arvalid_s11 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s12
wire x_mon_if_arvalid_s12;
assign x_mon_if_arvalid_s12 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s13
wire x_mon_if_arvalid_s13;
assign x_mon_if_arvalid_s13 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s14
wire x_mon_if_arvalid_s14;
assign x_mon_if_arvalid_s14 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s15
wire x_mon_if_arvalid_s15;
assign x_mon_if_arvalid_s15 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s16
wire x_mon_if_arvalid_s16;
assign x_mon_if_arvalid_s16 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s17
wire x_mon_if_arvalid_s17;
assign x_mon_if_arvalid_s17 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s18
wire x_mon_if_arvalid_s18;
assign x_mon_if_arvalid_s18 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s19
wire x_mon_if_arvalid_s19;
assign x_mon_if_arvalid_s19 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s20
wire x_mon_if_arvalid_s20;
assign x_mon_if_arvalid_s20 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s21
wire x_mon_if_arvalid_s21;
assign x_mon_if_arvalid_s21 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s22
wire x_mon_if_arvalid_s22;
assign x_mon_if_arvalid_s22 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s23
wire x_mon_if_arvalid_s23;
assign x_mon_if_arvalid_s23 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s24
wire x_mon_if_arvalid_s24;
assign x_mon_if_arvalid_s24 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s25
wire x_mon_if_arvalid_s25;
assign x_mon_if_arvalid_s25 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s26
wire x_mon_if_arvalid_s26;
assign x_mon_if_arvalid_s26 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s27
wire x_mon_if_arvalid_s27;
assign x_mon_if_arvalid_s27 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s28
wire x_mon_if_arvalid_s28;
assign x_mon_if_arvalid_s28 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s29
wire x_mon_if_arvalid_s29;
assign x_mon_if_arvalid_s29 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s30
wire x_mon_if_arvalid_s30;
assign x_mon_if_arvalid_s30 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_s31
wire x_mon_if_arvalid_s31;
assign x_mon_if_arvalid_s31 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: araddr_s1
wire [63:0] x_mon_if_araddr_s1;
assign x_mon_if_araddr_s1 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s2
wire [63:0] x_mon_if_araddr_s2;
assign x_mon_if_araddr_s2 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s3
wire [63:0] x_mon_if_araddr_s3;
assign x_mon_if_araddr_s3 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s4
wire [63:0] x_mon_if_araddr_s4;
assign x_mon_if_araddr_s4 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s5
wire [63:0] x_mon_if_araddr_s5;
assign x_mon_if_araddr_s5 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s6
wire [63:0] x_mon_if_araddr_s6;
assign x_mon_if_araddr_s6 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s7
wire [63:0] x_mon_if_araddr_s7;
assign x_mon_if_araddr_s7 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s8
wire [63:0] x_mon_if_araddr_s8;
assign x_mon_if_araddr_s8 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s9
wire [63:0] x_mon_if_araddr_s9;
assign x_mon_if_araddr_s9 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s10
wire [63:0] x_mon_if_araddr_s10;
assign x_mon_if_araddr_s10 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s11
wire [63:0] x_mon_if_araddr_s11;
assign x_mon_if_araddr_s11 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s12
wire [63:0] x_mon_if_araddr_s12;
assign x_mon_if_araddr_s12 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s13
wire [63:0] x_mon_if_araddr_s13;
assign x_mon_if_araddr_s13 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s14
wire [63:0] x_mon_if_araddr_s14;
assign x_mon_if_araddr_s14 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s15
wire [63:0] x_mon_if_araddr_s15;
assign x_mon_if_araddr_s15 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s16
wire [63:0] x_mon_if_araddr_s16;
assign x_mon_if_araddr_s16 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s17
wire [63:0] x_mon_if_araddr_s17;
assign x_mon_if_araddr_s17 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s18
wire [63:0] x_mon_if_araddr_s18;
assign x_mon_if_araddr_s18 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s19
wire [63:0] x_mon_if_araddr_s19;
assign x_mon_if_araddr_s19 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s20
wire [63:0] x_mon_if_araddr_s20;
assign x_mon_if_araddr_s20 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s21
wire [63:0] x_mon_if_araddr_s21;
assign x_mon_if_araddr_s21 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s22
wire [63:0] x_mon_if_araddr_s22;
assign x_mon_if_araddr_s22 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s23
wire [63:0] x_mon_if_araddr_s23;
assign x_mon_if_araddr_s23 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s24
wire [63:0] x_mon_if_araddr_s24;
assign x_mon_if_araddr_s24 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s25
wire [63:0] x_mon_if_araddr_s25;
assign x_mon_if_araddr_s25 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s26
wire [63:0] x_mon_if_araddr_s26;
assign x_mon_if_araddr_s26 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s27
wire [63:0] x_mon_if_araddr_s27;
assign x_mon_if_araddr_s27 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s28
wire [63:0] x_mon_if_araddr_s28;
assign x_mon_if_araddr_s28 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s29
wire [63:0] x_mon_if_araddr_s29;
assign x_mon_if_araddr_s29 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s30
wire [63:0] x_mon_if_araddr_s30;
assign x_mon_if_araddr_s30 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_s31
wire [63:0] x_mon_if_araddr_s31;
assign x_mon_if_araddr_s31 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: arlen_s1
wire [9:0] x_mon_if_arlen_s1;
assign x_mon_if_arlen_s1 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s2
wire [9:0] x_mon_if_arlen_s2;
assign x_mon_if_arlen_s2 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s3
wire [9:0] x_mon_if_arlen_s3;
assign x_mon_if_arlen_s3 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s4
wire [9:0] x_mon_if_arlen_s4;
assign x_mon_if_arlen_s4 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s5
wire [9:0] x_mon_if_arlen_s5;
assign x_mon_if_arlen_s5 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s6
wire [9:0] x_mon_if_arlen_s6;
assign x_mon_if_arlen_s6 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s7
wire [9:0] x_mon_if_arlen_s7;
assign x_mon_if_arlen_s7 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s8
wire [9:0] x_mon_if_arlen_s8;
assign x_mon_if_arlen_s8 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s9
wire [9:0] x_mon_if_arlen_s9;
assign x_mon_if_arlen_s9 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s10
wire [9:0] x_mon_if_arlen_s10;
assign x_mon_if_arlen_s10 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s11
wire [9:0] x_mon_if_arlen_s11;
assign x_mon_if_arlen_s11 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s12
wire [9:0] x_mon_if_arlen_s12;
assign x_mon_if_arlen_s12 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s13
wire [9:0] x_mon_if_arlen_s13;
assign x_mon_if_arlen_s13 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s14
wire [9:0] x_mon_if_arlen_s14;
assign x_mon_if_arlen_s14 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s15
wire [9:0] x_mon_if_arlen_s15;
assign x_mon_if_arlen_s15 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s16
wire [9:0] x_mon_if_arlen_s16;
assign x_mon_if_arlen_s16 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s17
wire [9:0] x_mon_if_arlen_s17;
assign x_mon_if_arlen_s17 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s18
wire [9:0] x_mon_if_arlen_s18;
assign x_mon_if_arlen_s18 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s19
wire [9:0] x_mon_if_arlen_s19;
assign x_mon_if_arlen_s19 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s20
wire [9:0] x_mon_if_arlen_s20;
assign x_mon_if_arlen_s20 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s21
wire [9:0] x_mon_if_arlen_s21;
assign x_mon_if_arlen_s21 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s22
wire [9:0] x_mon_if_arlen_s22;
assign x_mon_if_arlen_s22 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s23
wire [9:0] x_mon_if_arlen_s23;
assign x_mon_if_arlen_s23 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s24
wire [9:0] x_mon_if_arlen_s24;
assign x_mon_if_arlen_s24 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s25
wire [9:0] x_mon_if_arlen_s25;
assign x_mon_if_arlen_s25 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s26
wire [9:0] x_mon_if_arlen_s26;
assign x_mon_if_arlen_s26 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s27
wire [9:0] x_mon_if_arlen_s27;
assign x_mon_if_arlen_s27 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s28
wire [9:0] x_mon_if_arlen_s28;
assign x_mon_if_arlen_s28 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s29
wire [9:0] x_mon_if_arlen_s29;
assign x_mon_if_arlen_s29 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s30
wire [9:0] x_mon_if_arlen_s30;
assign x_mon_if_arlen_s30 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_s31
wire [9:0] x_mon_if_arlen_s31;
assign x_mon_if_arlen_s31 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arsize_s1
wire [2:0] x_mon_if_arsize_s1;
assign x_mon_if_arsize_s1 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s2
wire [2:0] x_mon_if_arsize_s2;
assign x_mon_if_arsize_s2 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s3
wire [2:0] x_mon_if_arsize_s3;
assign x_mon_if_arsize_s3 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s4
wire [2:0] x_mon_if_arsize_s4;
assign x_mon_if_arsize_s4 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s5
wire [2:0] x_mon_if_arsize_s5;
assign x_mon_if_arsize_s5 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s6
wire [2:0] x_mon_if_arsize_s6;
assign x_mon_if_arsize_s6 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s7
wire [2:0] x_mon_if_arsize_s7;
assign x_mon_if_arsize_s7 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s8
wire [2:0] x_mon_if_arsize_s8;
assign x_mon_if_arsize_s8 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s9
wire [2:0] x_mon_if_arsize_s9;
assign x_mon_if_arsize_s9 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s10
wire [2:0] x_mon_if_arsize_s10;
assign x_mon_if_arsize_s10 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s11
wire [2:0] x_mon_if_arsize_s11;
assign x_mon_if_arsize_s11 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s12
wire [2:0] x_mon_if_arsize_s12;
assign x_mon_if_arsize_s12 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s13
wire [2:0] x_mon_if_arsize_s13;
assign x_mon_if_arsize_s13 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s14
wire [2:0] x_mon_if_arsize_s14;
assign x_mon_if_arsize_s14 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s15
wire [2:0] x_mon_if_arsize_s15;
assign x_mon_if_arsize_s15 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s16
wire [2:0] x_mon_if_arsize_s16;
assign x_mon_if_arsize_s16 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s17
wire [2:0] x_mon_if_arsize_s17;
assign x_mon_if_arsize_s17 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s18
wire [2:0] x_mon_if_arsize_s18;
assign x_mon_if_arsize_s18 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s19
wire [2:0] x_mon_if_arsize_s19;
assign x_mon_if_arsize_s19 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s20
wire [2:0] x_mon_if_arsize_s20;
assign x_mon_if_arsize_s20 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s21
wire [2:0] x_mon_if_arsize_s21;
assign x_mon_if_arsize_s21 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s22
wire [2:0] x_mon_if_arsize_s22;
assign x_mon_if_arsize_s22 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s23
wire [2:0] x_mon_if_arsize_s23;
assign x_mon_if_arsize_s23 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s24
wire [2:0] x_mon_if_arsize_s24;
assign x_mon_if_arsize_s24 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s25
wire [2:0] x_mon_if_arsize_s25;
assign x_mon_if_arsize_s25 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s26
wire [2:0] x_mon_if_arsize_s26;
assign x_mon_if_arsize_s26 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s27
wire [2:0] x_mon_if_arsize_s27;
assign x_mon_if_arsize_s27 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s28
wire [2:0] x_mon_if_arsize_s28;
assign x_mon_if_arsize_s28 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s29
wire [2:0] x_mon_if_arsize_s29;
assign x_mon_if_arsize_s29 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s30
wire [2:0] x_mon_if_arsize_s30;
assign x_mon_if_arsize_s30 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_s31
wire [2:0] x_mon_if_arsize_s31;
assign x_mon_if_arsize_s31 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arburst_s1
wire [1:0] x_mon_if_arburst_s1;
assign x_mon_if_arburst_s1 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s2
wire [1:0] x_mon_if_arburst_s2;
assign x_mon_if_arburst_s2 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s3
wire [1:0] x_mon_if_arburst_s3;
assign x_mon_if_arburst_s3 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s4
wire [1:0] x_mon_if_arburst_s4;
assign x_mon_if_arburst_s4 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s5
wire [1:0] x_mon_if_arburst_s5;
assign x_mon_if_arburst_s5 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s6
wire [1:0] x_mon_if_arburst_s6;
assign x_mon_if_arburst_s6 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s7
wire [1:0] x_mon_if_arburst_s7;
assign x_mon_if_arburst_s7 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s8
wire [1:0] x_mon_if_arburst_s8;
assign x_mon_if_arburst_s8 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s9
wire [1:0] x_mon_if_arburst_s9;
assign x_mon_if_arburst_s9 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s10
wire [1:0] x_mon_if_arburst_s10;
assign x_mon_if_arburst_s10 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s11
wire [1:0] x_mon_if_arburst_s11;
assign x_mon_if_arburst_s11 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s12
wire [1:0] x_mon_if_arburst_s12;
assign x_mon_if_arburst_s12 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s13
wire [1:0] x_mon_if_arburst_s13;
assign x_mon_if_arburst_s13 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s14
wire [1:0] x_mon_if_arburst_s14;
assign x_mon_if_arburst_s14 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s15
wire [1:0] x_mon_if_arburst_s15;
assign x_mon_if_arburst_s15 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s16
wire [1:0] x_mon_if_arburst_s16;
assign x_mon_if_arburst_s16 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s17
wire [1:0] x_mon_if_arburst_s17;
assign x_mon_if_arburst_s17 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s18
wire [1:0] x_mon_if_arburst_s18;
assign x_mon_if_arburst_s18 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s19
wire [1:0] x_mon_if_arburst_s19;
assign x_mon_if_arburst_s19 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s20
wire [1:0] x_mon_if_arburst_s20;
assign x_mon_if_arburst_s20 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s21
wire [1:0] x_mon_if_arburst_s21;
assign x_mon_if_arburst_s21 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s22
wire [1:0] x_mon_if_arburst_s22;
assign x_mon_if_arburst_s22 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s23
wire [1:0] x_mon_if_arburst_s23;
assign x_mon_if_arburst_s23 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s24
wire [1:0] x_mon_if_arburst_s24;
assign x_mon_if_arburst_s24 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s25
wire [1:0] x_mon_if_arburst_s25;
assign x_mon_if_arburst_s25 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s26
wire [1:0] x_mon_if_arburst_s26;
assign x_mon_if_arburst_s26 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s27
wire [1:0] x_mon_if_arburst_s27;
assign x_mon_if_arburst_s27 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s28
wire [1:0] x_mon_if_arburst_s28;
assign x_mon_if_arburst_s28 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s29
wire [1:0] x_mon_if_arburst_s29;
assign x_mon_if_arburst_s29 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s30
wire [1:0] x_mon_if_arburst_s30;
assign x_mon_if_arburst_s30 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_s31
wire [1:0] x_mon_if_arburst_s31;
assign x_mon_if_arburst_s31 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arlock_s1
wire [1:0] x_mon_if_arlock_s1;
assign x_mon_if_arlock_s1 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s2
wire [1:0] x_mon_if_arlock_s2;
assign x_mon_if_arlock_s2 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s3
wire [1:0] x_mon_if_arlock_s3;
assign x_mon_if_arlock_s3 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s4
wire [1:0] x_mon_if_arlock_s4;
assign x_mon_if_arlock_s4 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s5
wire [1:0] x_mon_if_arlock_s5;
assign x_mon_if_arlock_s5 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s6
wire [1:0] x_mon_if_arlock_s6;
assign x_mon_if_arlock_s6 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s7
wire [1:0] x_mon_if_arlock_s7;
assign x_mon_if_arlock_s7 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s8
wire [1:0] x_mon_if_arlock_s8;
assign x_mon_if_arlock_s8 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s9
wire [1:0] x_mon_if_arlock_s9;
assign x_mon_if_arlock_s9 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s10
wire [1:0] x_mon_if_arlock_s10;
assign x_mon_if_arlock_s10 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s11
wire [1:0] x_mon_if_arlock_s11;
assign x_mon_if_arlock_s11 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s12
wire [1:0] x_mon_if_arlock_s12;
assign x_mon_if_arlock_s12 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s13
wire [1:0] x_mon_if_arlock_s13;
assign x_mon_if_arlock_s13 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s14
wire [1:0] x_mon_if_arlock_s14;
assign x_mon_if_arlock_s14 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s15
wire [1:0] x_mon_if_arlock_s15;
assign x_mon_if_arlock_s15 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s16
wire [1:0] x_mon_if_arlock_s16;
assign x_mon_if_arlock_s16 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s17
wire [1:0] x_mon_if_arlock_s17;
assign x_mon_if_arlock_s17 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s18
wire [1:0] x_mon_if_arlock_s18;
assign x_mon_if_arlock_s18 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s19
wire [1:0] x_mon_if_arlock_s19;
assign x_mon_if_arlock_s19 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s20
wire [1:0] x_mon_if_arlock_s20;
assign x_mon_if_arlock_s20 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s21
wire [1:0] x_mon_if_arlock_s21;
assign x_mon_if_arlock_s21 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s22
wire [1:0] x_mon_if_arlock_s22;
assign x_mon_if_arlock_s22 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s23
wire [1:0] x_mon_if_arlock_s23;
assign x_mon_if_arlock_s23 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s24
wire [1:0] x_mon_if_arlock_s24;
assign x_mon_if_arlock_s24 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s25
wire [1:0] x_mon_if_arlock_s25;
assign x_mon_if_arlock_s25 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s26
wire [1:0] x_mon_if_arlock_s26;
assign x_mon_if_arlock_s26 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s27
wire [1:0] x_mon_if_arlock_s27;
assign x_mon_if_arlock_s27 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s28
wire [1:0] x_mon_if_arlock_s28;
assign x_mon_if_arlock_s28 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s29
wire [1:0] x_mon_if_arlock_s29;
assign x_mon_if_arlock_s29 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s30
wire [1:0] x_mon_if_arlock_s30;
assign x_mon_if_arlock_s30 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_s31
wire [1:0] x_mon_if_arlock_s31;
assign x_mon_if_arlock_s31 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arcache_s1
wire [3:0] x_mon_if_arcache_s1;
assign x_mon_if_arcache_s1 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s2
wire [3:0] x_mon_if_arcache_s2;
assign x_mon_if_arcache_s2 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s3
wire [3:0] x_mon_if_arcache_s3;
assign x_mon_if_arcache_s3 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s4
wire [3:0] x_mon_if_arcache_s4;
assign x_mon_if_arcache_s4 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s5
wire [3:0] x_mon_if_arcache_s5;
assign x_mon_if_arcache_s5 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s6
wire [3:0] x_mon_if_arcache_s6;
assign x_mon_if_arcache_s6 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s7
wire [3:0] x_mon_if_arcache_s7;
assign x_mon_if_arcache_s7 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s8
wire [3:0] x_mon_if_arcache_s8;
assign x_mon_if_arcache_s8 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s9
wire [3:0] x_mon_if_arcache_s9;
assign x_mon_if_arcache_s9 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s10
wire [3:0] x_mon_if_arcache_s10;
assign x_mon_if_arcache_s10 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s11
wire [3:0] x_mon_if_arcache_s11;
assign x_mon_if_arcache_s11 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s12
wire [3:0] x_mon_if_arcache_s12;
assign x_mon_if_arcache_s12 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s13
wire [3:0] x_mon_if_arcache_s13;
assign x_mon_if_arcache_s13 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s14
wire [3:0] x_mon_if_arcache_s14;
assign x_mon_if_arcache_s14 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s15
wire [3:0] x_mon_if_arcache_s15;
assign x_mon_if_arcache_s15 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s16
wire [3:0] x_mon_if_arcache_s16;
assign x_mon_if_arcache_s16 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s17
wire [3:0] x_mon_if_arcache_s17;
assign x_mon_if_arcache_s17 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s18
wire [3:0] x_mon_if_arcache_s18;
assign x_mon_if_arcache_s18 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s19
wire [3:0] x_mon_if_arcache_s19;
assign x_mon_if_arcache_s19 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s20
wire [3:0] x_mon_if_arcache_s20;
assign x_mon_if_arcache_s20 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s21
wire [3:0] x_mon_if_arcache_s21;
assign x_mon_if_arcache_s21 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s22
wire [3:0] x_mon_if_arcache_s22;
assign x_mon_if_arcache_s22 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s23
wire [3:0] x_mon_if_arcache_s23;
assign x_mon_if_arcache_s23 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s24
wire [3:0] x_mon_if_arcache_s24;
assign x_mon_if_arcache_s24 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s25
wire [3:0] x_mon_if_arcache_s25;
assign x_mon_if_arcache_s25 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s26
wire [3:0] x_mon_if_arcache_s26;
assign x_mon_if_arcache_s26 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s27
wire [3:0] x_mon_if_arcache_s27;
assign x_mon_if_arcache_s27 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s28
wire [3:0] x_mon_if_arcache_s28;
assign x_mon_if_arcache_s28 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s29
wire [3:0] x_mon_if_arcache_s29;
assign x_mon_if_arcache_s29 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s30
wire [3:0] x_mon_if_arcache_s30;
assign x_mon_if_arcache_s30 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_s31
wire [3:0] x_mon_if_arcache_s31;
assign x_mon_if_arcache_s31 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arprot_s1
wire [2:0] x_mon_if_arprot_s1;
assign x_mon_if_arprot_s1 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s2
wire [2:0] x_mon_if_arprot_s2;
assign x_mon_if_arprot_s2 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s3
wire [2:0] x_mon_if_arprot_s3;
assign x_mon_if_arprot_s3 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s4
wire [2:0] x_mon_if_arprot_s4;
assign x_mon_if_arprot_s4 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s5
wire [2:0] x_mon_if_arprot_s5;
assign x_mon_if_arprot_s5 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s6
wire [2:0] x_mon_if_arprot_s6;
assign x_mon_if_arprot_s6 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s7
wire [2:0] x_mon_if_arprot_s7;
assign x_mon_if_arprot_s7 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s8
wire [2:0] x_mon_if_arprot_s8;
assign x_mon_if_arprot_s8 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s9
wire [2:0] x_mon_if_arprot_s9;
assign x_mon_if_arprot_s9 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s10
wire [2:0] x_mon_if_arprot_s10;
assign x_mon_if_arprot_s10 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s11
wire [2:0] x_mon_if_arprot_s11;
assign x_mon_if_arprot_s11 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s12
wire [2:0] x_mon_if_arprot_s12;
assign x_mon_if_arprot_s12 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s13
wire [2:0] x_mon_if_arprot_s13;
assign x_mon_if_arprot_s13 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s14
wire [2:0] x_mon_if_arprot_s14;
assign x_mon_if_arprot_s14 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s15
wire [2:0] x_mon_if_arprot_s15;
assign x_mon_if_arprot_s15 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s16
wire [2:0] x_mon_if_arprot_s16;
assign x_mon_if_arprot_s16 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s17
wire [2:0] x_mon_if_arprot_s17;
assign x_mon_if_arprot_s17 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s18
wire [2:0] x_mon_if_arprot_s18;
assign x_mon_if_arprot_s18 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s19
wire [2:0] x_mon_if_arprot_s19;
assign x_mon_if_arprot_s19 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s20
wire [2:0] x_mon_if_arprot_s20;
assign x_mon_if_arprot_s20 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s21
wire [2:0] x_mon_if_arprot_s21;
assign x_mon_if_arprot_s21 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s22
wire [2:0] x_mon_if_arprot_s22;
assign x_mon_if_arprot_s22 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s23
wire [2:0] x_mon_if_arprot_s23;
assign x_mon_if_arprot_s23 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s24
wire [2:0] x_mon_if_arprot_s24;
assign x_mon_if_arprot_s24 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s25
wire [2:0] x_mon_if_arprot_s25;
assign x_mon_if_arprot_s25 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s26
wire [2:0] x_mon_if_arprot_s26;
assign x_mon_if_arprot_s26 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s27
wire [2:0] x_mon_if_arprot_s27;
assign x_mon_if_arprot_s27 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s28
wire [2:0] x_mon_if_arprot_s28;
assign x_mon_if_arprot_s28 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s29
wire [2:0] x_mon_if_arprot_s29;
assign x_mon_if_arprot_s29 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s30
wire [2:0] x_mon_if_arprot_s30;
assign x_mon_if_arprot_s30 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_s31
wire [2:0] x_mon_if_arprot_s31;
assign x_mon_if_arprot_s31 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arid_s1
wire [31:0] x_mon_if_arid_s1;
assign x_mon_if_arid_s1 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s2
wire [31:0] x_mon_if_arid_s2;
assign x_mon_if_arid_s2 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s3
wire [31:0] x_mon_if_arid_s3;
assign x_mon_if_arid_s3 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s4
wire [31:0] x_mon_if_arid_s4;
assign x_mon_if_arid_s4 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s5
wire [31:0] x_mon_if_arid_s5;
assign x_mon_if_arid_s5 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s6
wire [31:0] x_mon_if_arid_s6;
assign x_mon_if_arid_s6 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s7
wire [31:0] x_mon_if_arid_s7;
assign x_mon_if_arid_s7 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s8
wire [31:0] x_mon_if_arid_s8;
assign x_mon_if_arid_s8 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s9
wire [31:0] x_mon_if_arid_s9;
assign x_mon_if_arid_s9 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s10
wire [31:0] x_mon_if_arid_s10;
assign x_mon_if_arid_s10 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s11
wire [31:0] x_mon_if_arid_s11;
assign x_mon_if_arid_s11 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s12
wire [31:0] x_mon_if_arid_s12;
assign x_mon_if_arid_s12 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s13
wire [31:0] x_mon_if_arid_s13;
assign x_mon_if_arid_s13 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s14
wire [31:0] x_mon_if_arid_s14;
assign x_mon_if_arid_s14 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s15
wire [31:0] x_mon_if_arid_s15;
assign x_mon_if_arid_s15 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s16
wire [31:0] x_mon_if_arid_s16;
assign x_mon_if_arid_s16 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s17
wire [31:0] x_mon_if_arid_s17;
assign x_mon_if_arid_s17 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s18
wire [31:0] x_mon_if_arid_s18;
assign x_mon_if_arid_s18 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s19
wire [31:0] x_mon_if_arid_s19;
assign x_mon_if_arid_s19 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s20
wire [31:0] x_mon_if_arid_s20;
assign x_mon_if_arid_s20 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s21
wire [31:0] x_mon_if_arid_s21;
assign x_mon_if_arid_s21 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s22
wire [31:0] x_mon_if_arid_s22;
assign x_mon_if_arid_s22 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s23
wire [31:0] x_mon_if_arid_s23;
assign x_mon_if_arid_s23 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s24
wire [31:0] x_mon_if_arid_s24;
assign x_mon_if_arid_s24 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s25
wire [31:0] x_mon_if_arid_s25;
assign x_mon_if_arid_s25 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s26
wire [31:0] x_mon_if_arid_s26;
assign x_mon_if_arid_s26 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s27
wire [31:0] x_mon_if_arid_s27;
assign x_mon_if_arid_s27 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s28
wire [31:0] x_mon_if_arid_s28;
assign x_mon_if_arid_s28 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s29
wire [31:0] x_mon_if_arid_s29;
assign x_mon_if_arid_s29 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s30
wire [31:0] x_mon_if_arid_s30;
assign x_mon_if_arid_s30 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_s31
wire [31:0] x_mon_if_arid_s31;
assign x_mon_if_arid_s31 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arready_s1
wire x_mon_if_arready_s1;
assign x_mon_if_arready_s1 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s2
wire x_mon_if_arready_s2;
assign x_mon_if_arready_s2 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s3
wire x_mon_if_arready_s3;
assign x_mon_if_arready_s3 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s4
wire x_mon_if_arready_s4;
assign x_mon_if_arready_s4 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s5
wire x_mon_if_arready_s5;
assign x_mon_if_arready_s5 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s6
wire x_mon_if_arready_s6;
assign x_mon_if_arready_s6 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s7
wire x_mon_if_arready_s7;
assign x_mon_if_arready_s7 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s8
wire x_mon_if_arready_s8;
assign x_mon_if_arready_s8 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s9
wire x_mon_if_arready_s9;
assign x_mon_if_arready_s9 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s10
wire x_mon_if_arready_s10;
assign x_mon_if_arready_s10 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s11
wire x_mon_if_arready_s11;
assign x_mon_if_arready_s11 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s12
wire x_mon_if_arready_s12;
assign x_mon_if_arready_s12 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s13
wire x_mon_if_arready_s13;
assign x_mon_if_arready_s13 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s14
wire x_mon_if_arready_s14;
assign x_mon_if_arready_s14 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s15
wire x_mon_if_arready_s15;
assign x_mon_if_arready_s15 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s16
wire x_mon_if_arready_s16;
assign x_mon_if_arready_s16 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s17
wire x_mon_if_arready_s17;
assign x_mon_if_arready_s17 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s18
wire x_mon_if_arready_s18;
assign x_mon_if_arready_s18 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s19
wire x_mon_if_arready_s19;
assign x_mon_if_arready_s19 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s20
wire x_mon_if_arready_s20;
assign x_mon_if_arready_s20 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s21
wire x_mon_if_arready_s21;
assign x_mon_if_arready_s21 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s22
wire x_mon_if_arready_s22;
assign x_mon_if_arready_s22 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s23
wire x_mon_if_arready_s23;
assign x_mon_if_arready_s23 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s24
wire x_mon_if_arready_s24;
assign x_mon_if_arready_s24 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s25
wire x_mon_if_arready_s25;
assign x_mon_if_arready_s25 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s26
wire x_mon_if_arready_s26;
assign x_mon_if_arready_s26 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s27
wire x_mon_if_arready_s27;
assign x_mon_if_arready_s27 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s28
wire x_mon_if_arready_s28;
assign x_mon_if_arready_s28 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s29
wire x_mon_if_arready_s29;
assign x_mon_if_arready_s29 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s30
wire x_mon_if_arready_s30;
assign x_mon_if_arready_s30 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_s31
wire x_mon_if_arready_s31;
assign x_mon_if_arready_s31 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: awvalid_s1
wire x_mon_if_awvalid_s1;
assign x_mon_if_awvalid_s1 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s2
wire x_mon_if_awvalid_s2;
assign x_mon_if_awvalid_s2 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s3
wire x_mon_if_awvalid_s3;
assign x_mon_if_awvalid_s3 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s4
wire x_mon_if_awvalid_s4;
assign x_mon_if_awvalid_s4 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s5
wire x_mon_if_awvalid_s5;
assign x_mon_if_awvalid_s5 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s6
wire x_mon_if_awvalid_s6;
assign x_mon_if_awvalid_s6 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s7
wire x_mon_if_awvalid_s7;
assign x_mon_if_awvalid_s7 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s8
wire x_mon_if_awvalid_s8;
assign x_mon_if_awvalid_s8 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s9
wire x_mon_if_awvalid_s9;
assign x_mon_if_awvalid_s9 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s10
wire x_mon_if_awvalid_s10;
assign x_mon_if_awvalid_s10 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s11
wire x_mon_if_awvalid_s11;
assign x_mon_if_awvalid_s11 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s12
wire x_mon_if_awvalid_s12;
assign x_mon_if_awvalid_s12 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s13
wire x_mon_if_awvalid_s13;
assign x_mon_if_awvalid_s13 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s14
wire x_mon_if_awvalid_s14;
assign x_mon_if_awvalid_s14 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s15
wire x_mon_if_awvalid_s15;
assign x_mon_if_awvalid_s15 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s16
wire x_mon_if_awvalid_s16;
assign x_mon_if_awvalid_s16 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s17
wire x_mon_if_awvalid_s17;
assign x_mon_if_awvalid_s17 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s18
wire x_mon_if_awvalid_s18;
assign x_mon_if_awvalid_s18 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s19
wire x_mon_if_awvalid_s19;
assign x_mon_if_awvalid_s19 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s20
wire x_mon_if_awvalid_s20;
assign x_mon_if_awvalid_s20 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s21
wire x_mon_if_awvalid_s21;
assign x_mon_if_awvalid_s21 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s22
wire x_mon_if_awvalid_s22;
assign x_mon_if_awvalid_s22 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s23
wire x_mon_if_awvalid_s23;
assign x_mon_if_awvalid_s23 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s24
wire x_mon_if_awvalid_s24;
assign x_mon_if_awvalid_s24 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s25
wire x_mon_if_awvalid_s25;
assign x_mon_if_awvalid_s25 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s26
wire x_mon_if_awvalid_s26;
assign x_mon_if_awvalid_s26 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s27
wire x_mon_if_awvalid_s27;
assign x_mon_if_awvalid_s27 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s28
wire x_mon_if_awvalid_s28;
assign x_mon_if_awvalid_s28 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s29
wire x_mon_if_awvalid_s29;
assign x_mon_if_awvalid_s29 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s30
wire x_mon_if_awvalid_s30;
assign x_mon_if_awvalid_s30 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_s31
wire x_mon_if_awvalid_s31;
assign x_mon_if_awvalid_s31 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awaddr_s1
wire [63:0] x_mon_if_awaddr_s1;
assign x_mon_if_awaddr_s1 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s2
wire [63:0] x_mon_if_awaddr_s2;
assign x_mon_if_awaddr_s2 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s3
wire [63:0] x_mon_if_awaddr_s3;
assign x_mon_if_awaddr_s3 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s4
wire [63:0] x_mon_if_awaddr_s4;
assign x_mon_if_awaddr_s4 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s5
wire [63:0] x_mon_if_awaddr_s5;
assign x_mon_if_awaddr_s5 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s6
wire [63:0] x_mon_if_awaddr_s6;
assign x_mon_if_awaddr_s6 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s7
wire [63:0] x_mon_if_awaddr_s7;
assign x_mon_if_awaddr_s7 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s8
wire [63:0] x_mon_if_awaddr_s8;
assign x_mon_if_awaddr_s8 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s9
wire [63:0] x_mon_if_awaddr_s9;
assign x_mon_if_awaddr_s9 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s10
wire [63:0] x_mon_if_awaddr_s10;
assign x_mon_if_awaddr_s10 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s11
wire [63:0] x_mon_if_awaddr_s11;
assign x_mon_if_awaddr_s11 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s12
wire [63:0] x_mon_if_awaddr_s12;
assign x_mon_if_awaddr_s12 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s13
wire [63:0] x_mon_if_awaddr_s13;
assign x_mon_if_awaddr_s13 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s14
wire [63:0] x_mon_if_awaddr_s14;
assign x_mon_if_awaddr_s14 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s15
wire [63:0] x_mon_if_awaddr_s15;
assign x_mon_if_awaddr_s15 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s16
wire [63:0] x_mon_if_awaddr_s16;
assign x_mon_if_awaddr_s16 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s17
wire [63:0] x_mon_if_awaddr_s17;
assign x_mon_if_awaddr_s17 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s18
wire [63:0] x_mon_if_awaddr_s18;
assign x_mon_if_awaddr_s18 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s19
wire [63:0] x_mon_if_awaddr_s19;
assign x_mon_if_awaddr_s19 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s20
wire [63:0] x_mon_if_awaddr_s20;
assign x_mon_if_awaddr_s20 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s21
wire [63:0] x_mon_if_awaddr_s21;
assign x_mon_if_awaddr_s21 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s22
wire [63:0] x_mon_if_awaddr_s22;
assign x_mon_if_awaddr_s22 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s23
wire [63:0] x_mon_if_awaddr_s23;
assign x_mon_if_awaddr_s23 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s24
wire [63:0] x_mon_if_awaddr_s24;
assign x_mon_if_awaddr_s24 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s25
wire [63:0] x_mon_if_awaddr_s25;
assign x_mon_if_awaddr_s25 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s26
wire [63:0] x_mon_if_awaddr_s26;
assign x_mon_if_awaddr_s26 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s27
wire [63:0] x_mon_if_awaddr_s27;
assign x_mon_if_awaddr_s27 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s28
wire [63:0] x_mon_if_awaddr_s28;
assign x_mon_if_awaddr_s28 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s29
wire [63:0] x_mon_if_awaddr_s29;
assign x_mon_if_awaddr_s29 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s30
wire [63:0] x_mon_if_awaddr_s30;
assign x_mon_if_awaddr_s30 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_s31
wire [63:0] x_mon_if_awaddr_s31;
assign x_mon_if_awaddr_s31 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awlen_s1
wire [9:0] x_mon_if_awlen_s1;
assign x_mon_if_awlen_s1 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s2
wire [9:0] x_mon_if_awlen_s2;
assign x_mon_if_awlen_s2 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s3
wire [9:0] x_mon_if_awlen_s3;
assign x_mon_if_awlen_s3 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s4
wire [9:0] x_mon_if_awlen_s4;
assign x_mon_if_awlen_s4 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s5
wire [9:0] x_mon_if_awlen_s5;
assign x_mon_if_awlen_s5 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s6
wire [9:0] x_mon_if_awlen_s6;
assign x_mon_if_awlen_s6 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s7
wire [9:0] x_mon_if_awlen_s7;
assign x_mon_if_awlen_s7 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s8
wire [9:0] x_mon_if_awlen_s8;
assign x_mon_if_awlen_s8 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s9
wire [9:0] x_mon_if_awlen_s9;
assign x_mon_if_awlen_s9 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s10
wire [9:0] x_mon_if_awlen_s10;
assign x_mon_if_awlen_s10 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s11
wire [9:0] x_mon_if_awlen_s11;
assign x_mon_if_awlen_s11 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s12
wire [9:0] x_mon_if_awlen_s12;
assign x_mon_if_awlen_s12 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s13
wire [9:0] x_mon_if_awlen_s13;
assign x_mon_if_awlen_s13 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s14
wire [9:0] x_mon_if_awlen_s14;
assign x_mon_if_awlen_s14 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s15
wire [9:0] x_mon_if_awlen_s15;
assign x_mon_if_awlen_s15 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s16
wire [9:0] x_mon_if_awlen_s16;
assign x_mon_if_awlen_s16 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s17
wire [9:0] x_mon_if_awlen_s17;
assign x_mon_if_awlen_s17 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s18
wire [9:0] x_mon_if_awlen_s18;
assign x_mon_if_awlen_s18 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s19
wire [9:0] x_mon_if_awlen_s19;
assign x_mon_if_awlen_s19 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s20
wire [9:0] x_mon_if_awlen_s20;
assign x_mon_if_awlen_s20 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s21
wire [9:0] x_mon_if_awlen_s21;
assign x_mon_if_awlen_s21 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s22
wire [9:0] x_mon_if_awlen_s22;
assign x_mon_if_awlen_s22 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s23
wire [9:0] x_mon_if_awlen_s23;
assign x_mon_if_awlen_s23 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s24
wire [9:0] x_mon_if_awlen_s24;
assign x_mon_if_awlen_s24 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s25
wire [9:0] x_mon_if_awlen_s25;
assign x_mon_if_awlen_s25 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s26
wire [9:0] x_mon_if_awlen_s26;
assign x_mon_if_awlen_s26 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s27
wire [9:0] x_mon_if_awlen_s27;
assign x_mon_if_awlen_s27 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s28
wire [9:0] x_mon_if_awlen_s28;
assign x_mon_if_awlen_s28 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s29
wire [9:0] x_mon_if_awlen_s29;
assign x_mon_if_awlen_s29 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s30
wire [9:0] x_mon_if_awlen_s30;
assign x_mon_if_awlen_s30 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_s31
wire [9:0] x_mon_if_awlen_s31;
assign x_mon_if_awlen_s31 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awsize_s1
wire [2:0] x_mon_if_awsize_s1;
assign x_mon_if_awsize_s1 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s2
wire [2:0] x_mon_if_awsize_s2;
assign x_mon_if_awsize_s2 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s3
wire [2:0] x_mon_if_awsize_s3;
assign x_mon_if_awsize_s3 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s4
wire [2:0] x_mon_if_awsize_s4;
assign x_mon_if_awsize_s4 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s5
wire [2:0] x_mon_if_awsize_s5;
assign x_mon_if_awsize_s5 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s6
wire [2:0] x_mon_if_awsize_s6;
assign x_mon_if_awsize_s6 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s7
wire [2:0] x_mon_if_awsize_s7;
assign x_mon_if_awsize_s7 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s8
wire [2:0] x_mon_if_awsize_s8;
assign x_mon_if_awsize_s8 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s9
wire [2:0] x_mon_if_awsize_s9;
assign x_mon_if_awsize_s9 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s10
wire [2:0] x_mon_if_awsize_s10;
assign x_mon_if_awsize_s10 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s11
wire [2:0] x_mon_if_awsize_s11;
assign x_mon_if_awsize_s11 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s12
wire [2:0] x_mon_if_awsize_s12;
assign x_mon_if_awsize_s12 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s13
wire [2:0] x_mon_if_awsize_s13;
assign x_mon_if_awsize_s13 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s14
wire [2:0] x_mon_if_awsize_s14;
assign x_mon_if_awsize_s14 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s15
wire [2:0] x_mon_if_awsize_s15;
assign x_mon_if_awsize_s15 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s16
wire [2:0] x_mon_if_awsize_s16;
assign x_mon_if_awsize_s16 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s17
wire [2:0] x_mon_if_awsize_s17;
assign x_mon_if_awsize_s17 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s18
wire [2:0] x_mon_if_awsize_s18;
assign x_mon_if_awsize_s18 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s19
wire [2:0] x_mon_if_awsize_s19;
assign x_mon_if_awsize_s19 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s20
wire [2:0] x_mon_if_awsize_s20;
assign x_mon_if_awsize_s20 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s21
wire [2:0] x_mon_if_awsize_s21;
assign x_mon_if_awsize_s21 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s22
wire [2:0] x_mon_if_awsize_s22;
assign x_mon_if_awsize_s22 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s23
wire [2:0] x_mon_if_awsize_s23;
assign x_mon_if_awsize_s23 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s24
wire [2:0] x_mon_if_awsize_s24;
assign x_mon_if_awsize_s24 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s25
wire [2:0] x_mon_if_awsize_s25;
assign x_mon_if_awsize_s25 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s26
wire [2:0] x_mon_if_awsize_s26;
assign x_mon_if_awsize_s26 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s27
wire [2:0] x_mon_if_awsize_s27;
assign x_mon_if_awsize_s27 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s28
wire [2:0] x_mon_if_awsize_s28;
assign x_mon_if_awsize_s28 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s29
wire [2:0] x_mon_if_awsize_s29;
assign x_mon_if_awsize_s29 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s30
wire [2:0] x_mon_if_awsize_s30;
assign x_mon_if_awsize_s30 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_s31
wire [2:0] x_mon_if_awsize_s31;
assign x_mon_if_awsize_s31 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awburst_s1
wire [1:0] x_mon_if_awburst_s1;
assign x_mon_if_awburst_s1 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s2
wire [1:0] x_mon_if_awburst_s2;
assign x_mon_if_awburst_s2 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s3
wire [1:0] x_mon_if_awburst_s3;
assign x_mon_if_awburst_s3 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s4
wire [1:0] x_mon_if_awburst_s4;
assign x_mon_if_awburst_s4 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s5
wire [1:0] x_mon_if_awburst_s5;
assign x_mon_if_awburst_s5 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s6
wire [1:0] x_mon_if_awburst_s6;
assign x_mon_if_awburst_s6 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s7
wire [1:0] x_mon_if_awburst_s7;
assign x_mon_if_awburst_s7 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s8
wire [1:0] x_mon_if_awburst_s8;
assign x_mon_if_awburst_s8 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s9
wire [1:0] x_mon_if_awburst_s9;
assign x_mon_if_awburst_s9 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s10
wire [1:0] x_mon_if_awburst_s10;
assign x_mon_if_awburst_s10 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s11
wire [1:0] x_mon_if_awburst_s11;
assign x_mon_if_awburst_s11 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s12
wire [1:0] x_mon_if_awburst_s12;
assign x_mon_if_awburst_s12 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s13
wire [1:0] x_mon_if_awburst_s13;
assign x_mon_if_awburst_s13 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s14
wire [1:0] x_mon_if_awburst_s14;
assign x_mon_if_awburst_s14 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s15
wire [1:0] x_mon_if_awburst_s15;
assign x_mon_if_awburst_s15 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s16
wire [1:0] x_mon_if_awburst_s16;
assign x_mon_if_awburst_s16 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s17
wire [1:0] x_mon_if_awburst_s17;
assign x_mon_if_awburst_s17 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s18
wire [1:0] x_mon_if_awburst_s18;
assign x_mon_if_awburst_s18 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s19
wire [1:0] x_mon_if_awburst_s19;
assign x_mon_if_awburst_s19 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s20
wire [1:0] x_mon_if_awburst_s20;
assign x_mon_if_awburst_s20 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s21
wire [1:0] x_mon_if_awburst_s21;
assign x_mon_if_awburst_s21 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s22
wire [1:0] x_mon_if_awburst_s22;
assign x_mon_if_awburst_s22 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s23
wire [1:0] x_mon_if_awburst_s23;
assign x_mon_if_awburst_s23 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s24
wire [1:0] x_mon_if_awburst_s24;
assign x_mon_if_awburst_s24 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s25
wire [1:0] x_mon_if_awburst_s25;
assign x_mon_if_awburst_s25 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s26
wire [1:0] x_mon_if_awburst_s26;
assign x_mon_if_awburst_s26 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s27
wire [1:0] x_mon_if_awburst_s27;
assign x_mon_if_awburst_s27 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s28
wire [1:0] x_mon_if_awburst_s28;
assign x_mon_if_awburst_s28 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s29
wire [1:0] x_mon_if_awburst_s29;
assign x_mon_if_awburst_s29 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s30
wire [1:0] x_mon_if_awburst_s30;
assign x_mon_if_awburst_s30 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_s31
wire [1:0] x_mon_if_awburst_s31;
assign x_mon_if_awburst_s31 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awlock_s1
wire [1:0] x_mon_if_awlock_s1;
assign x_mon_if_awlock_s1 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s2
wire [1:0] x_mon_if_awlock_s2;
assign x_mon_if_awlock_s2 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s3
wire [1:0] x_mon_if_awlock_s3;
assign x_mon_if_awlock_s3 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s4
wire [1:0] x_mon_if_awlock_s4;
assign x_mon_if_awlock_s4 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s5
wire [1:0] x_mon_if_awlock_s5;
assign x_mon_if_awlock_s5 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s6
wire [1:0] x_mon_if_awlock_s6;
assign x_mon_if_awlock_s6 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s7
wire [1:0] x_mon_if_awlock_s7;
assign x_mon_if_awlock_s7 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s8
wire [1:0] x_mon_if_awlock_s8;
assign x_mon_if_awlock_s8 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s9
wire [1:0] x_mon_if_awlock_s9;
assign x_mon_if_awlock_s9 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s10
wire [1:0] x_mon_if_awlock_s10;
assign x_mon_if_awlock_s10 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s11
wire [1:0] x_mon_if_awlock_s11;
assign x_mon_if_awlock_s11 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s12
wire [1:0] x_mon_if_awlock_s12;
assign x_mon_if_awlock_s12 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s13
wire [1:0] x_mon_if_awlock_s13;
assign x_mon_if_awlock_s13 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s14
wire [1:0] x_mon_if_awlock_s14;
assign x_mon_if_awlock_s14 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s15
wire [1:0] x_mon_if_awlock_s15;
assign x_mon_if_awlock_s15 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s16
wire [1:0] x_mon_if_awlock_s16;
assign x_mon_if_awlock_s16 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s17
wire [1:0] x_mon_if_awlock_s17;
assign x_mon_if_awlock_s17 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s18
wire [1:0] x_mon_if_awlock_s18;
assign x_mon_if_awlock_s18 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s19
wire [1:0] x_mon_if_awlock_s19;
assign x_mon_if_awlock_s19 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s20
wire [1:0] x_mon_if_awlock_s20;
assign x_mon_if_awlock_s20 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s21
wire [1:0] x_mon_if_awlock_s21;
assign x_mon_if_awlock_s21 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s22
wire [1:0] x_mon_if_awlock_s22;
assign x_mon_if_awlock_s22 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s23
wire [1:0] x_mon_if_awlock_s23;
assign x_mon_if_awlock_s23 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s24
wire [1:0] x_mon_if_awlock_s24;
assign x_mon_if_awlock_s24 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s25
wire [1:0] x_mon_if_awlock_s25;
assign x_mon_if_awlock_s25 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s26
wire [1:0] x_mon_if_awlock_s26;
assign x_mon_if_awlock_s26 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s27
wire [1:0] x_mon_if_awlock_s27;
assign x_mon_if_awlock_s27 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s28
wire [1:0] x_mon_if_awlock_s28;
assign x_mon_if_awlock_s28 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s29
wire [1:0] x_mon_if_awlock_s29;
assign x_mon_if_awlock_s29 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s30
wire [1:0] x_mon_if_awlock_s30;
assign x_mon_if_awlock_s30 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_s31
wire [1:0] x_mon_if_awlock_s31;
assign x_mon_if_awlock_s31 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awcache_s1
wire [3:0] x_mon_if_awcache_s1;
assign x_mon_if_awcache_s1 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s2
wire [3:0] x_mon_if_awcache_s2;
assign x_mon_if_awcache_s2 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s3
wire [3:0] x_mon_if_awcache_s3;
assign x_mon_if_awcache_s3 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s4
wire [3:0] x_mon_if_awcache_s4;
assign x_mon_if_awcache_s4 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s5
wire [3:0] x_mon_if_awcache_s5;
assign x_mon_if_awcache_s5 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s6
wire [3:0] x_mon_if_awcache_s6;
assign x_mon_if_awcache_s6 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s7
wire [3:0] x_mon_if_awcache_s7;
assign x_mon_if_awcache_s7 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s8
wire [3:0] x_mon_if_awcache_s8;
assign x_mon_if_awcache_s8 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s9
wire [3:0] x_mon_if_awcache_s9;
assign x_mon_if_awcache_s9 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s10
wire [3:0] x_mon_if_awcache_s10;
assign x_mon_if_awcache_s10 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s11
wire [3:0] x_mon_if_awcache_s11;
assign x_mon_if_awcache_s11 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s12
wire [3:0] x_mon_if_awcache_s12;
assign x_mon_if_awcache_s12 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s13
wire [3:0] x_mon_if_awcache_s13;
assign x_mon_if_awcache_s13 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s14
wire [3:0] x_mon_if_awcache_s14;
assign x_mon_if_awcache_s14 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s15
wire [3:0] x_mon_if_awcache_s15;
assign x_mon_if_awcache_s15 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s16
wire [3:0] x_mon_if_awcache_s16;
assign x_mon_if_awcache_s16 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s17
wire [3:0] x_mon_if_awcache_s17;
assign x_mon_if_awcache_s17 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s18
wire [3:0] x_mon_if_awcache_s18;
assign x_mon_if_awcache_s18 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s19
wire [3:0] x_mon_if_awcache_s19;
assign x_mon_if_awcache_s19 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s20
wire [3:0] x_mon_if_awcache_s20;
assign x_mon_if_awcache_s20 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s21
wire [3:0] x_mon_if_awcache_s21;
assign x_mon_if_awcache_s21 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s22
wire [3:0] x_mon_if_awcache_s22;
assign x_mon_if_awcache_s22 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s23
wire [3:0] x_mon_if_awcache_s23;
assign x_mon_if_awcache_s23 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s24
wire [3:0] x_mon_if_awcache_s24;
assign x_mon_if_awcache_s24 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s25
wire [3:0] x_mon_if_awcache_s25;
assign x_mon_if_awcache_s25 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s26
wire [3:0] x_mon_if_awcache_s26;
assign x_mon_if_awcache_s26 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s27
wire [3:0] x_mon_if_awcache_s27;
assign x_mon_if_awcache_s27 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s28
wire [3:0] x_mon_if_awcache_s28;
assign x_mon_if_awcache_s28 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s29
wire [3:0] x_mon_if_awcache_s29;
assign x_mon_if_awcache_s29 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s30
wire [3:0] x_mon_if_awcache_s30;
assign x_mon_if_awcache_s30 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_s31
wire [3:0] x_mon_if_awcache_s31;
assign x_mon_if_awcache_s31 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awprot_s1
wire [2:0] x_mon_if_awprot_s1;
assign x_mon_if_awprot_s1 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s2
wire [2:0] x_mon_if_awprot_s2;
assign x_mon_if_awprot_s2 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s3
wire [2:0] x_mon_if_awprot_s3;
assign x_mon_if_awprot_s3 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s4
wire [2:0] x_mon_if_awprot_s4;
assign x_mon_if_awprot_s4 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s5
wire [2:0] x_mon_if_awprot_s5;
assign x_mon_if_awprot_s5 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s6
wire [2:0] x_mon_if_awprot_s6;
assign x_mon_if_awprot_s6 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s7
wire [2:0] x_mon_if_awprot_s7;
assign x_mon_if_awprot_s7 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s8
wire [2:0] x_mon_if_awprot_s8;
assign x_mon_if_awprot_s8 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s9
wire [2:0] x_mon_if_awprot_s9;
assign x_mon_if_awprot_s9 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s10
wire [2:0] x_mon_if_awprot_s10;
assign x_mon_if_awprot_s10 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s11
wire [2:0] x_mon_if_awprot_s11;
assign x_mon_if_awprot_s11 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s12
wire [2:0] x_mon_if_awprot_s12;
assign x_mon_if_awprot_s12 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s13
wire [2:0] x_mon_if_awprot_s13;
assign x_mon_if_awprot_s13 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s14
wire [2:0] x_mon_if_awprot_s14;
assign x_mon_if_awprot_s14 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s15
wire [2:0] x_mon_if_awprot_s15;
assign x_mon_if_awprot_s15 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s16
wire [2:0] x_mon_if_awprot_s16;
assign x_mon_if_awprot_s16 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s17
wire [2:0] x_mon_if_awprot_s17;
assign x_mon_if_awprot_s17 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s18
wire [2:0] x_mon_if_awprot_s18;
assign x_mon_if_awprot_s18 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s19
wire [2:0] x_mon_if_awprot_s19;
assign x_mon_if_awprot_s19 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s20
wire [2:0] x_mon_if_awprot_s20;
assign x_mon_if_awprot_s20 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s21
wire [2:0] x_mon_if_awprot_s21;
assign x_mon_if_awprot_s21 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s22
wire [2:0] x_mon_if_awprot_s22;
assign x_mon_if_awprot_s22 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s23
wire [2:0] x_mon_if_awprot_s23;
assign x_mon_if_awprot_s23 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s24
wire [2:0] x_mon_if_awprot_s24;
assign x_mon_if_awprot_s24 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s25
wire [2:0] x_mon_if_awprot_s25;
assign x_mon_if_awprot_s25 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s26
wire [2:0] x_mon_if_awprot_s26;
assign x_mon_if_awprot_s26 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s27
wire [2:0] x_mon_if_awprot_s27;
assign x_mon_if_awprot_s27 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s28
wire [2:0] x_mon_if_awprot_s28;
assign x_mon_if_awprot_s28 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s29
wire [2:0] x_mon_if_awprot_s29;
assign x_mon_if_awprot_s29 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s30
wire [2:0] x_mon_if_awprot_s30;
assign x_mon_if_awprot_s30 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_s31
wire [2:0] x_mon_if_awprot_s31;
assign x_mon_if_awprot_s31 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awid_s1
wire [31:0] x_mon_if_awid_s1;
assign x_mon_if_awid_s1 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s2
wire [31:0] x_mon_if_awid_s2;
assign x_mon_if_awid_s2 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s3
wire [31:0] x_mon_if_awid_s3;
assign x_mon_if_awid_s3 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s4
wire [31:0] x_mon_if_awid_s4;
assign x_mon_if_awid_s4 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s5
wire [31:0] x_mon_if_awid_s5;
assign x_mon_if_awid_s5 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s6
wire [31:0] x_mon_if_awid_s6;
assign x_mon_if_awid_s6 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s7
wire [31:0] x_mon_if_awid_s7;
assign x_mon_if_awid_s7 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s8
wire [31:0] x_mon_if_awid_s8;
assign x_mon_if_awid_s8 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s9
wire [31:0] x_mon_if_awid_s9;
assign x_mon_if_awid_s9 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s10
wire [31:0] x_mon_if_awid_s10;
assign x_mon_if_awid_s10 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s11
wire [31:0] x_mon_if_awid_s11;
assign x_mon_if_awid_s11 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s12
wire [31:0] x_mon_if_awid_s12;
assign x_mon_if_awid_s12 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s13
wire [31:0] x_mon_if_awid_s13;
assign x_mon_if_awid_s13 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s14
wire [31:0] x_mon_if_awid_s14;
assign x_mon_if_awid_s14 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s15
wire [31:0] x_mon_if_awid_s15;
assign x_mon_if_awid_s15 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s16
wire [31:0] x_mon_if_awid_s16;
assign x_mon_if_awid_s16 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s17
wire [31:0] x_mon_if_awid_s17;
assign x_mon_if_awid_s17 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s18
wire [31:0] x_mon_if_awid_s18;
assign x_mon_if_awid_s18 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s19
wire [31:0] x_mon_if_awid_s19;
assign x_mon_if_awid_s19 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s20
wire [31:0] x_mon_if_awid_s20;
assign x_mon_if_awid_s20 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s21
wire [31:0] x_mon_if_awid_s21;
assign x_mon_if_awid_s21 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s22
wire [31:0] x_mon_if_awid_s22;
assign x_mon_if_awid_s22 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s23
wire [31:0] x_mon_if_awid_s23;
assign x_mon_if_awid_s23 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s24
wire [31:0] x_mon_if_awid_s24;
assign x_mon_if_awid_s24 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s25
wire [31:0] x_mon_if_awid_s25;
assign x_mon_if_awid_s25 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s26
wire [31:0] x_mon_if_awid_s26;
assign x_mon_if_awid_s26 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s27
wire [31:0] x_mon_if_awid_s27;
assign x_mon_if_awid_s27 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s28
wire [31:0] x_mon_if_awid_s28;
assign x_mon_if_awid_s28 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s29
wire [31:0] x_mon_if_awid_s29;
assign x_mon_if_awid_s29 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s30
wire [31:0] x_mon_if_awid_s30;
assign x_mon_if_awid_s30 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_s31
wire [31:0] x_mon_if_awid_s31;
assign x_mon_if_awid_s31 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awready_s1
wire x_mon_if_awready_s1;
assign x_mon_if_awready_s1 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s2
wire x_mon_if_awready_s2;
assign x_mon_if_awready_s2 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s3
wire x_mon_if_awready_s3;
assign x_mon_if_awready_s3 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s4
wire x_mon_if_awready_s4;
assign x_mon_if_awready_s4 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s5
wire x_mon_if_awready_s5;
assign x_mon_if_awready_s5 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s6
wire x_mon_if_awready_s6;
assign x_mon_if_awready_s6 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s7
wire x_mon_if_awready_s7;
assign x_mon_if_awready_s7 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s8
wire x_mon_if_awready_s8;
assign x_mon_if_awready_s8 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s9
wire x_mon_if_awready_s9;
assign x_mon_if_awready_s9 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s10
wire x_mon_if_awready_s10;
assign x_mon_if_awready_s10 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s11
wire x_mon_if_awready_s11;
assign x_mon_if_awready_s11 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s12
wire x_mon_if_awready_s12;
assign x_mon_if_awready_s12 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s13
wire x_mon_if_awready_s13;
assign x_mon_if_awready_s13 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s14
wire x_mon_if_awready_s14;
assign x_mon_if_awready_s14 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s15
wire x_mon_if_awready_s15;
assign x_mon_if_awready_s15 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s16
wire x_mon_if_awready_s16;
assign x_mon_if_awready_s16 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s17
wire x_mon_if_awready_s17;
assign x_mon_if_awready_s17 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s18
wire x_mon_if_awready_s18;
assign x_mon_if_awready_s18 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s19
wire x_mon_if_awready_s19;
assign x_mon_if_awready_s19 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s20
wire x_mon_if_awready_s20;
assign x_mon_if_awready_s20 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s21
wire x_mon_if_awready_s21;
assign x_mon_if_awready_s21 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s22
wire x_mon_if_awready_s22;
assign x_mon_if_awready_s22 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s23
wire x_mon_if_awready_s23;
assign x_mon_if_awready_s23 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s24
wire x_mon_if_awready_s24;
assign x_mon_if_awready_s24 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s25
wire x_mon_if_awready_s25;
assign x_mon_if_awready_s25 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s26
wire x_mon_if_awready_s26;
assign x_mon_if_awready_s26 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s27
wire x_mon_if_awready_s27;
assign x_mon_if_awready_s27 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s28
wire x_mon_if_awready_s28;
assign x_mon_if_awready_s28 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s29
wire x_mon_if_awready_s29;
assign x_mon_if_awready_s29 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s30
wire x_mon_if_awready_s30;
assign x_mon_if_awready_s30 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_s31
wire x_mon_if_awready_s31;
assign x_mon_if_awready_s31 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: rvalid_s1
wire x_mon_if_rvalid_s1;
assign x_mon_if_rvalid_s1 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s2
wire x_mon_if_rvalid_s2;
assign x_mon_if_rvalid_s2 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s3
wire x_mon_if_rvalid_s3;
assign x_mon_if_rvalid_s3 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s4
wire x_mon_if_rvalid_s4;
assign x_mon_if_rvalid_s4 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s5
wire x_mon_if_rvalid_s5;
assign x_mon_if_rvalid_s5 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s6
wire x_mon_if_rvalid_s6;
assign x_mon_if_rvalid_s6 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s7
wire x_mon_if_rvalid_s7;
assign x_mon_if_rvalid_s7 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s8
wire x_mon_if_rvalid_s8;
assign x_mon_if_rvalid_s8 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s9
wire x_mon_if_rvalid_s9;
assign x_mon_if_rvalid_s9 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s10
wire x_mon_if_rvalid_s10;
assign x_mon_if_rvalid_s10 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s11
wire x_mon_if_rvalid_s11;
assign x_mon_if_rvalid_s11 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s12
wire x_mon_if_rvalid_s12;
assign x_mon_if_rvalid_s12 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s13
wire x_mon_if_rvalid_s13;
assign x_mon_if_rvalid_s13 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s14
wire x_mon_if_rvalid_s14;
assign x_mon_if_rvalid_s14 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s15
wire x_mon_if_rvalid_s15;
assign x_mon_if_rvalid_s15 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s16
wire x_mon_if_rvalid_s16;
assign x_mon_if_rvalid_s16 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s17
wire x_mon_if_rvalid_s17;
assign x_mon_if_rvalid_s17 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s18
wire x_mon_if_rvalid_s18;
assign x_mon_if_rvalid_s18 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s19
wire x_mon_if_rvalid_s19;
assign x_mon_if_rvalid_s19 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s20
wire x_mon_if_rvalid_s20;
assign x_mon_if_rvalid_s20 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s21
wire x_mon_if_rvalid_s21;
assign x_mon_if_rvalid_s21 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s22
wire x_mon_if_rvalid_s22;
assign x_mon_if_rvalid_s22 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s23
wire x_mon_if_rvalid_s23;
assign x_mon_if_rvalid_s23 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s24
wire x_mon_if_rvalid_s24;
assign x_mon_if_rvalid_s24 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s25
wire x_mon_if_rvalid_s25;
assign x_mon_if_rvalid_s25 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s26
wire x_mon_if_rvalid_s26;
assign x_mon_if_rvalid_s26 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s27
wire x_mon_if_rvalid_s27;
assign x_mon_if_rvalid_s27 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s28
wire x_mon_if_rvalid_s28;
assign x_mon_if_rvalid_s28 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s29
wire x_mon_if_rvalid_s29;
assign x_mon_if_rvalid_s29 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s30
wire x_mon_if_rvalid_s30;
assign x_mon_if_rvalid_s30 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_s31
wire x_mon_if_rvalid_s31;
assign x_mon_if_rvalid_s31 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rlast_s1
wire x_mon_if_rlast_s1;
assign x_mon_if_rlast_s1 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s2
wire x_mon_if_rlast_s2;
assign x_mon_if_rlast_s2 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s3
wire x_mon_if_rlast_s3;
assign x_mon_if_rlast_s3 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s4
wire x_mon_if_rlast_s4;
assign x_mon_if_rlast_s4 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s5
wire x_mon_if_rlast_s5;
assign x_mon_if_rlast_s5 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s6
wire x_mon_if_rlast_s6;
assign x_mon_if_rlast_s6 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s7
wire x_mon_if_rlast_s7;
assign x_mon_if_rlast_s7 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s8
wire x_mon_if_rlast_s8;
assign x_mon_if_rlast_s8 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s9
wire x_mon_if_rlast_s9;
assign x_mon_if_rlast_s9 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s10
wire x_mon_if_rlast_s10;
assign x_mon_if_rlast_s10 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s11
wire x_mon_if_rlast_s11;
assign x_mon_if_rlast_s11 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s12
wire x_mon_if_rlast_s12;
assign x_mon_if_rlast_s12 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s13
wire x_mon_if_rlast_s13;
assign x_mon_if_rlast_s13 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s14
wire x_mon_if_rlast_s14;
assign x_mon_if_rlast_s14 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s15
wire x_mon_if_rlast_s15;
assign x_mon_if_rlast_s15 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s16
wire x_mon_if_rlast_s16;
assign x_mon_if_rlast_s16 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s17
wire x_mon_if_rlast_s17;
assign x_mon_if_rlast_s17 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s18
wire x_mon_if_rlast_s18;
assign x_mon_if_rlast_s18 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s19
wire x_mon_if_rlast_s19;
assign x_mon_if_rlast_s19 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s20
wire x_mon_if_rlast_s20;
assign x_mon_if_rlast_s20 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s21
wire x_mon_if_rlast_s21;
assign x_mon_if_rlast_s21 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s22
wire x_mon_if_rlast_s22;
assign x_mon_if_rlast_s22 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s23
wire x_mon_if_rlast_s23;
assign x_mon_if_rlast_s23 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s24
wire x_mon_if_rlast_s24;
assign x_mon_if_rlast_s24 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s25
wire x_mon_if_rlast_s25;
assign x_mon_if_rlast_s25 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s26
wire x_mon_if_rlast_s26;
assign x_mon_if_rlast_s26 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s27
wire x_mon_if_rlast_s27;
assign x_mon_if_rlast_s27 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s28
wire x_mon_if_rlast_s28;
assign x_mon_if_rlast_s28 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s29
wire x_mon_if_rlast_s29;
assign x_mon_if_rlast_s29 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s30
wire x_mon_if_rlast_s30;
assign x_mon_if_rlast_s30 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_s31
wire x_mon_if_rlast_s31;
assign x_mon_if_rlast_s31 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rdata_s1
wire [1023:0] x_mon_if_rdata_s1;
assign x_mon_if_rdata_s1 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s2
wire [1023:0] x_mon_if_rdata_s2;
assign x_mon_if_rdata_s2 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s3
wire [1023:0] x_mon_if_rdata_s3;
assign x_mon_if_rdata_s3 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s4
wire [1023:0] x_mon_if_rdata_s4;
assign x_mon_if_rdata_s4 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s5
wire [1023:0] x_mon_if_rdata_s5;
assign x_mon_if_rdata_s5 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s6
wire [1023:0] x_mon_if_rdata_s6;
assign x_mon_if_rdata_s6 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s7
wire [1023:0] x_mon_if_rdata_s7;
assign x_mon_if_rdata_s7 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s8
wire [1023:0] x_mon_if_rdata_s8;
assign x_mon_if_rdata_s8 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s9
wire [1023:0] x_mon_if_rdata_s9;
assign x_mon_if_rdata_s9 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s10
wire [1023:0] x_mon_if_rdata_s10;
assign x_mon_if_rdata_s10 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s11
wire [1023:0] x_mon_if_rdata_s11;
assign x_mon_if_rdata_s11 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s12
wire [1023:0] x_mon_if_rdata_s12;
assign x_mon_if_rdata_s12 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s13
wire [1023:0] x_mon_if_rdata_s13;
assign x_mon_if_rdata_s13 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s14
wire [1023:0] x_mon_if_rdata_s14;
assign x_mon_if_rdata_s14 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s15
wire [1023:0] x_mon_if_rdata_s15;
assign x_mon_if_rdata_s15 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s16
wire [1023:0] x_mon_if_rdata_s16;
assign x_mon_if_rdata_s16 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s17
wire [1023:0] x_mon_if_rdata_s17;
assign x_mon_if_rdata_s17 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s18
wire [1023:0] x_mon_if_rdata_s18;
assign x_mon_if_rdata_s18 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s19
wire [1023:0] x_mon_if_rdata_s19;
assign x_mon_if_rdata_s19 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s20
wire [1023:0] x_mon_if_rdata_s20;
assign x_mon_if_rdata_s20 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s21
wire [1023:0] x_mon_if_rdata_s21;
assign x_mon_if_rdata_s21 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s22
wire [1023:0] x_mon_if_rdata_s22;
assign x_mon_if_rdata_s22 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s23
wire [1023:0] x_mon_if_rdata_s23;
assign x_mon_if_rdata_s23 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s24
wire [1023:0] x_mon_if_rdata_s24;
assign x_mon_if_rdata_s24 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s25
wire [1023:0] x_mon_if_rdata_s25;
assign x_mon_if_rdata_s25 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s26
wire [1023:0] x_mon_if_rdata_s26;
assign x_mon_if_rdata_s26 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s27
wire [1023:0] x_mon_if_rdata_s27;
assign x_mon_if_rdata_s27 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s28
wire [1023:0] x_mon_if_rdata_s28;
assign x_mon_if_rdata_s28 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s29
wire [1023:0] x_mon_if_rdata_s29;
assign x_mon_if_rdata_s29 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s30
wire [1023:0] x_mon_if_rdata_s30;
assign x_mon_if_rdata_s30 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_s31
wire [1023:0] x_mon_if_rdata_s31;
assign x_mon_if_rdata_s31 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rresp_s1
wire [1:0] x_mon_if_rresp_s1;
assign x_mon_if_rresp_s1 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s2
wire [1:0] x_mon_if_rresp_s2;
assign x_mon_if_rresp_s2 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s3
wire [1:0] x_mon_if_rresp_s3;
assign x_mon_if_rresp_s3 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s4
wire [1:0] x_mon_if_rresp_s4;
assign x_mon_if_rresp_s4 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s5
wire [1:0] x_mon_if_rresp_s5;
assign x_mon_if_rresp_s5 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s6
wire [1:0] x_mon_if_rresp_s6;
assign x_mon_if_rresp_s6 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s7
wire [1:0] x_mon_if_rresp_s7;
assign x_mon_if_rresp_s7 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s8
wire [1:0] x_mon_if_rresp_s8;
assign x_mon_if_rresp_s8 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s9
wire [1:0] x_mon_if_rresp_s9;
assign x_mon_if_rresp_s9 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s10
wire [1:0] x_mon_if_rresp_s10;
assign x_mon_if_rresp_s10 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s11
wire [1:0] x_mon_if_rresp_s11;
assign x_mon_if_rresp_s11 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s12
wire [1:0] x_mon_if_rresp_s12;
assign x_mon_if_rresp_s12 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s13
wire [1:0] x_mon_if_rresp_s13;
assign x_mon_if_rresp_s13 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s14
wire [1:0] x_mon_if_rresp_s14;
assign x_mon_if_rresp_s14 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s15
wire [1:0] x_mon_if_rresp_s15;
assign x_mon_if_rresp_s15 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s16
wire [1:0] x_mon_if_rresp_s16;
assign x_mon_if_rresp_s16 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s17
wire [1:0] x_mon_if_rresp_s17;
assign x_mon_if_rresp_s17 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s18
wire [1:0] x_mon_if_rresp_s18;
assign x_mon_if_rresp_s18 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s19
wire [1:0] x_mon_if_rresp_s19;
assign x_mon_if_rresp_s19 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s20
wire [1:0] x_mon_if_rresp_s20;
assign x_mon_if_rresp_s20 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s21
wire [1:0] x_mon_if_rresp_s21;
assign x_mon_if_rresp_s21 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s22
wire [1:0] x_mon_if_rresp_s22;
assign x_mon_if_rresp_s22 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s23
wire [1:0] x_mon_if_rresp_s23;
assign x_mon_if_rresp_s23 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s24
wire [1:0] x_mon_if_rresp_s24;
assign x_mon_if_rresp_s24 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s25
wire [1:0] x_mon_if_rresp_s25;
assign x_mon_if_rresp_s25 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s26
wire [1:0] x_mon_if_rresp_s26;
assign x_mon_if_rresp_s26 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s27
wire [1:0] x_mon_if_rresp_s27;
assign x_mon_if_rresp_s27 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s28
wire [1:0] x_mon_if_rresp_s28;
assign x_mon_if_rresp_s28 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s29
wire [1:0] x_mon_if_rresp_s29;
assign x_mon_if_rresp_s29 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s30
wire [1:0] x_mon_if_rresp_s30;
assign x_mon_if_rresp_s30 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_s31
wire [1:0] x_mon_if_rresp_s31;
assign x_mon_if_rresp_s31 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rid_s1
wire [31:0] x_mon_if_rid_s1;
assign x_mon_if_rid_s1 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s2
wire [31:0] x_mon_if_rid_s2;
assign x_mon_if_rid_s2 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s3
wire [31:0] x_mon_if_rid_s3;
assign x_mon_if_rid_s3 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s4
wire [31:0] x_mon_if_rid_s4;
assign x_mon_if_rid_s4 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s5
wire [31:0] x_mon_if_rid_s5;
assign x_mon_if_rid_s5 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s6
wire [31:0] x_mon_if_rid_s6;
assign x_mon_if_rid_s6 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s7
wire [31:0] x_mon_if_rid_s7;
assign x_mon_if_rid_s7 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s8
wire [31:0] x_mon_if_rid_s8;
assign x_mon_if_rid_s8 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s9
wire [31:0] x_mon_if_rid_s9;
assign x_mon_if_rid_s9 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s10
wire [31:0] x_mon_if_rid_s10;
assign x_mon_if_rid_s10 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s11
wire [31:0] x_mon_if_rid_s11;
assign x_mon_if_rid_s11 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s12
wire [31:0] x_mon_if_rid_s12;
assign x_mon_if_rid_s12 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s13
wire [31:0] x_mon_if_rid_s13;
assign x_mon_if_rid_s13 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s14
wire [31:0] x_mon_if_rid_s14;
assign x_mon_if_rid_s14 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s15
wire [31:0] x_mon_if_rid_s15;
assign x_mon_if_rid_s15 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s16
wire [31:0] x_mon_if_rid_s16;
assign x_mon_if_rid_s16 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s17
wire [31:0] x_mon_if_rid_s17;
assign x_mon_if_rid_s17 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s18
wire [31:0] x_mon_if_rid_s18;
assign x_mon_if_rid_s18 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s19
wire [31:0] x_mon_if_rid_s19;
assign x_mon_if_rid_s19 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s20
wire [31:0] x_mon_if_rid_s20;
assign x_mon_if_rid_s20 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s21
wire [31:0] x_mon_if_rid_s21;
assign x_mon_if_rid_s21 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s22
wire [31:0] x_mon_if_rid_s22;
assign x_mon_if_rid_s22 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s23
wire [31:0] x_mon_if_rid_s23;
assign x_mon_if_rid_s23 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s24
wire [31:0] x_mon_if_rid_s24;
assign x_mon_if_rid_s24 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s25
wire [31:0] x_mon_if_rid_s25;
assign x_mon_if_rid_s25 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s26
wire [31:0] x_mon_if_rid_s26;
assign x_mon_if_rid_s26 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s27
wire [31:0] x_mon_if_rid_s27;
assign x_mon_if_rid_s27 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s28
wire [31:0] x_mon_if_rid_s28;
assign x_mon_if_rid_s28 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s29
wire [31:0] x_mon_if_rid_s29;
assign x_mon_if_rid_s29 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s30
wire [31:0] x_mon_if_rid_s30;
assign x_mon_if_rid_s30 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_s31
wire [31:0] x_mon_if_rid_s31;
assign x_mon_if_rid_s31 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rready_s1
wire x_mon_if_rready_s1;
assign x_mon_if_rready_s1 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s2
wire x_mon_if_rready_s2;
assign x_mon_if_rready_s2 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s3
wire x_mon_if_rready_s3;
assign x_mon_if_rready_s3 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s4
wire x_mon_if_rready_s4;
assign x_mon_if_rready_s4 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s5
wire x_mon_if_rready_s5;
assign x_mon_if_rready_s5 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s6
wire x_mon_if_rready_s6;
assign x_mon_if_rready_s6 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s7
wire x_mon_if_rready_s7;
assign x_mon_if_rready_s7 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s8
wire x_mon_if_rready_s8;
assign x_mon_if_rready_s8 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s9
wire x_mon_if_rready_s9;
assign x_mon_if_rready_s9 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s10
wire x_mon_if_rready_s10;
assign x_mon_if_rready_s10 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s11
wire x_mon_if_rready_s11;
assign x_mon_if_rready_s11 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s12
wire x_mon_if_rready_s12;
assign x_mon_if_rready_s12 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s13
wire x_mon_if_rready_s13;
assign x_mon_if_rready_s13 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s14
wire x_mon_if_rready_s14;
assign x_mon_if_rready_s14 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s15
wire x_mon_if_rready_s15;
assign x_mon_if_rready_s15 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s16
wire x_mon_if_rready_s16;
assign x_mon_if_rready_s16 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s17
wire x_mon_if_rready_s17;
assign x_mon_if_rready_s17 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s18
wire x_mon_if_rready_s18;
assign x_mon_if_rready_s18 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s19
wire x_mon_if_rready_s19;
assign x_mon_if_rready_s19 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s20
wire x_mon_if_rready_s20;
assign x_mon_if_rready_s20 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s21
wire x_mon_if_rready_s21;
assign x_mon_if_rready_s21 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s22
wire x_mon_if_rready_s22;
assign x_mon_if_rready_s22 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s23
wire x_mon_if_rready_s23;
assign x_mon_if_rready_s23 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s24
wire x_mon_if_rready_s24;
assign x_mon_if_rready_s24 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s25
wire x_mon_if_rready_s25;
assign x_mon_if_rready_s25 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s26
wire x_mon_if_rready_s26;
assign x_mon_if_rready_s26 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s27
wire x_mon_if_rready_s27;
assign x_mon_if_rready_s27 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s28
wire x_mon_if_rready_s28;
assign x_mon_if_rready_s28 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s29
wire x_mon_if_rready_s29;
assign x_mon_if_rready_s29 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s30
wire x_mon_if_rready_s30;
assign x_mon_if_rready_s30 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_s31
wire x_mon_if_rready_s31;
assign x_mon_if_rready_s31 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: wvalid_s1
wire x_mon_if_wvalid_s1;
assign x_mon_if_wvalid_s1 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s2
wire x_mon_if_wvalid_s2;
assign x_mon_if_wvalid_s2 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s3
wire x_mon_if_wvalid_s3;
assign x_mon_if_wvalid_s3 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s4
wire x_mon_if_wvalid_s4;
assign x_mon_if_wvalid_s4 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s5
wire x_mon_if_wvalid_s5;
assign x_mon_if_wvalid_s5 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s6
wire x_mon_if_wvalid_s6;
assign x_mon_if_wvalid_s6 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s7
wire x_mon_if_wvalid_s7;
assign x_mon_if_wvalid_s7 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s8
wire x_mon_if_wvalid_s8;
assign x_mon_if_wvalid_s8 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s9
wire x_mon_if_wvalid_s9;
assign x_mon_if_wvalid_s9 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s10
wire x_mon_if_wvalid_s10;
assign x_mon_if_wvalid_s10 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s11
wire x_mon_if_wvalid_s11;
assign x_mon_if_wvalid_s11 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s12
wire x_mon_if_wvalid_s12;
assign x_mon_if_wvalid_s12 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s13
wire x_mon_if_wvalid_s13;
assign x_mon_if_wvalid_s13 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s14
wire x_mon_if_wvalid_s14;
assign x_mon_if_wvalid_s14 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s15
wire x_mon_if_wvalid_s15;
assign x_mon_if_wvalid_s15 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s16
wire x_mon_if_wvalid_s16;
assign x_mon_if_wvalid_s16 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s17
wire x_mon_if_wvalid_s17;
assign x_mon_if_wvalid_s17 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s18
wire x_mon_if_wvalid_s18;
assign x_mon_if_wvalid_s18 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s19
wire x_mon_if_wvalid_s19;
assign x_mon_if_wvalid_s19 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s20
wire x_mon_if_wvalid_s20;
assign x_mon_if_wvalid_s20 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s21
wire x_mon_if_wvalid_s21;
assign x_mon_if_wvalid_s21 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s22
wire x_mon_if_wvalid_s22;
assign x_mon_if_wvalid_s22 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s23
wire x_mon_if_wvalid_s23;
assign x_mon_if_wvalid_s23 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s24
wire x_mon_if_wvalid_s24;
assign x_mon_if_wvalid_s24 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s25
wire x_mon_if_wvalid_s25;
assign x_mon_if_wvalid_s25 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s26
wire x_mon_if_wvalid_s26;
assign x_mon_if_wvalid_s26 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s27
wire x_mon_if_wvalid_s27;
assign x_mon_if_wvalid_s27 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s28
wire x_mon_if_wvalid_s28;
assign x_mon_if_wvalid_s28 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s29
wire x_mon_if_wvalid_s29;
assign x_mon_if_wvalid_s29 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s30
wire x_mon_if_wvalid_s30;
assign x_mon_if_wvalid_s30 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_s31
wire x_mon_if_wvalid_s31;
assign x_mon_if_wvalid_s31 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wlast_s1
wire x_mon_if_wlast_s1;
assign x_mon_if_wlast_s1 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s2
wire x_mon_if_wlast_s2;
assign x_mon_if_wlast_s2 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s3
wire x_mon_if_wlast_s3;
assign x_mon_if_wlast_s3 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s4
wire x_mon_if_wlast_s4;
assign x_mon_if_wlast_s4 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s5
wire x_mon_if_wlast_s5;
assign x_mon_if_wlast_s5 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s6
wire x_mon_if_wlast_s6;
assign x_mon_if_wlast_s6 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s7
wire x_mon_if_wlast_s7;
assign x_mon_if_wlast_s7 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s8
wire x_mon_if_wlast_s8;
assign x_mon_if_wlast_s8 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s9
wire x_mon_if_wlast_s9;
assign x_mon_if_wlast_s9 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s10
wire x_mon_if_wlast_s10;
assign x_mon_if_wlast_s10 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s11
wire x_mon_if_wlast_s11;
assign x_mon_if_wlast_s11 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s12
wire x_mon_if_wlast_s12;
assign x_mon_if_wlast_s12 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s13
wire x_mon_if_wlast_s13;
assign x_mon_if_wlast_s13 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s14
wire x_mon_if_wlast_s14;
assign x_mon_if_wlast_s14 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s15
wire x_mon_if_wlast_s15;
assign x_mon_if_wlast_s15 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s16
wire x_mon_if_wlast_s16;
assign x_mon_if_wlast_s16 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s17
wire x_mon_if_wlast_s17;
assign x_mon_if_wlast_s17 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s18
wire x_mon_if_wlast_s18;
assign x_mon_if_wlast_s18 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s19
wire x_mon_if_wlast_s19;
assign x_mon_if_wlast_s19 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s20
wire x_mon_if_wlast_s20;
assign x_mon_if_wlast_s20 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s21
wire x_mon_if_wlast_s21;
assign x_mon_if_wlast_s21 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s22
wire x_mon_if_wlast_s22;
assign x_mon_if_wlast_s22 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s23
wire x_mon_if_wlast_s23;
assign x_mon_if_wlast_s23 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s24
wire x_mon_if_wlast_s24;
assign x_mon_if_wlast_s24 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s25
wire x_mon_if_wlast_s25;
assign x_mon_if_wlast_s25 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s26
wire x_mon_if_wlast_s26;
assign x_mon_if_wlast_s26 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s27
wire x_mon_if_wlast_s27;
assign x_mon_if_wlast_s27 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s28
wire x_mon_if_wlast_s28;
assign x_mon_if_wlast_s28 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s29
wire x_mon_if_wlast_s29;
assign x_mon_if_wlast_s29 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s30
wire x_mon_if_wlast_s30;
assign x_mon_if_wlast_s30 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_s31
wire x_mon_if_wlast_s31;
assign x_mon_if_wlast_s31 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wdata_s1
wire [1023:0] x_mon_if_wdata_s1;
assign x_mon_if_wdata_s1 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s2
wire [1023:0] x_mon_if_wdata_s2;
assign x_mon_if_wdata_s2 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s3
wire [1023:0] x_mon_if_wdata_s3;
assign x_mon_if_wdata_s3 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s4
wire [1023:0] x_mon_if_wdata_s4;
assign x_mon_if_wdata_s4 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s5
wire [1023:0] x_mon_if_wdata_s5;
assign x_mon_if_wdata_s5 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s6
wire [1023:0] x_mon_if_wdata_s6;
assign x_mon_if_wdata_s6 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s7
wire [1023:0] x_mon_if_wdata_s7;
assign x_mon_if_wdata_s7 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s8
wire [1023:0] x_mon_if_wdata_s8;
assign x_mon_if_wdata_s8 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s9
wire [1023:0] x_mon_if_wdata_s9;
assign x_mon_if_wdata_s9 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s10
wire [1023:0] x_mon_if_wdata_s10;
assign x_mon_if_wdata_s10 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s11
wire [1023:0] x_mon_if_wdata_s11;
assign x_mon_if_wdata_s11 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s12
wire [1023:0] x_mon_if_wdata_s12;
assign x_mon_if_wdata_s12 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s13
wire [1023:0] x_mon_if_wdata_s13;
assign x_mon_if_wdata_s13 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s14
wire [1023:0] x_mon_if_wdata_s14;
assign x_mon_if_wdata_s14 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s15
wire [1023:0] x_mon_if_wdata_s15;
assign x_mon_if_wdata_s15 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s16
wire [1023:0] x_mon_if_wdata_s16;
assign x_mon_if_wdata_s16 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s17
wire [1023:0] x_mon_if_wdata_s17;
assign x_mon_if_wdata_s17 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s18
wire [1023:0] x_mon_if_wdata_s18;
assign x_mon_if_wdata_s18 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s19
wire [1023:0] x_mon_if_wdata_s19;
assign x_mon_if_wdata_s19 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s20
wire [1023:0] x_mon_if_wdata_s20;
assign x_mon_if_wdata_s20 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s21
wire [1023:0] x_mon_if_wdata_s21;
assign x_mon_if_wdata_s21 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s22
wire [1023:0] x_mon_if_wdata_s22;
assign x_mon_if_wdata_s22 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s23
wire [1023:0] x_mon_if_wdata_s23;
assign x_mon_if_wdata_s23 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s24
wire [1023:0] x_mon_if_wdata_s24;
assign x_mon_if_wdata_s24 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s25
wire [1023:0] x_mon_if_wdata_s25;
assign x_mon_if_wdata_s25 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s26
wire [1023:0] x_mon_if_wdata_s26;
assign x_mon_if_wdata_s26 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s27
wire [1023:0] x_mon_if_wdata_s27;
assign x_mon_if_wdata_s27 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s28
wire [1023:0] x_mon_if_wdata_s28;
assign x_mon_if_wdata_s28 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s29
wire [1023:0] x_mon_if_wdata_s29;
assign x_mon_if_wdata_s29 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s30
wire [1023:0] x_mon_if_wdata_s30;
assign x_mon_if_wdata_s30 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_s31
wire [1023:0] x_mon_if_wdata_s31;
assign x_mon_if_wdata_s31 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wstrb_s1
wire [127:0] x_mon_if_wstrb_s1;
assign x_mon_if_wstrb_s1 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s2
wire [127:0] x_mon_if_wstrb_s2;
assign x_mon_if_wstrb_s2 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s3
wire [127:0] x_mon_if_wstrb_s3;
assign x_mon_if_wstrb_s3 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s4
wire [127:0] x_mon_if_wstrb_s4;
assign x_mon_if_wstrb_s4 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s5
wire [127:0] x_mon_if_wstrb_s5;
assign x_mon_if_wstrb_s5 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s6
wire [127:0] x_mon_if_wstrb_s6;
assign x_mon_if_wstrb_s6 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s7
wire [127:0] x_mon_if_wstrb_s7;
assign x_mon_if_wstrb_s7 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s8
wire [127:0] x_mon_if_wstrb_s8;
assign x_mon_if_wstrb_s8 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s9
wire [127:0] x_mon_if_wstrb_s9;
assign x_mon_if_wstrb_s9 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s10
wire [127:0] x_mon_if_wstrb_s10;
assign x_mon_if_wstrb_s10 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s11
wire [127:0] x_mon_if_wstrb_s11;
assign x_mon_if_wstrb_s11 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s12
wire [127:0] x_mon_if_wstrb_s12;
assign x_mon_if_wstrb_s12 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s13
wire [127:0] x_mon_if_wstrb_s13;
assign x_mon_if_wstrb_s13 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s14
wire [127:0] x_mon_if_wstrb_s14;
assign x_mon_if_wstrb_s14 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s15
wire [127:0] x_mon_if_wstrb_s15;
assign x_mon_if_wstrb_s15 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s16
wire [127:0] x_mon_if_wstrb_s16;
assign x_mon_if_wstrb_s16 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s17
wire [127:0] x_mon_if_wstrb_s17;
assign x_mon_if_wstrb_s17 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s18
wire [127:0] x_mon_if_wstrb_s18;
assign x_mon_if_wstrb_s18 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s19
wire [127:0] x_mon_if_wstrb_s19;
assign x_mon_if_wstrb_s19 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s20
wire [127:0] x_mon_if_wstrb_s20;
assign x_mon_if_wstrb_s20 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s21
wire [127:0] x_mon_if_wstrb_s21;
assign x_mon_if_wstrb_s21 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s22
wire [127:0] x_mon_if_wstrb_s22;
assign x_mon_if_wstrb_s22 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s23
wire [127:0] x_mon_if_wstrb_s23;
assign x_mon_if_wstrb_s23 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s24
wire [127:0] x_mon_if_wstrb_s24;
assign x_mon_if_wstrb_s24 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s25
wire [127:0] x_mon_if_wstrb_s25;
assign x_mon_if_wstrb_s25 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s26
wire [127:0] x_mon_if_wstrb_s26;
assign x_mon_if_wstrb_s26 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s27
wire [127:0] x_mon_if_wstrb_s27;
assign x_mon_if_wstrb_s27 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s28
wire [127:0] x_mon_if_wstrb_s28;
assign x_mon_if_wstrb_s28 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s29
wire [127:0] x_mon_if_wstrb_s29;
assign x_mon_if_wstrb_s29 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s30
wire [127:0] x_mon_if_wstrb_s30;
assign x_mon_if_wstrb_s30 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_s31
wire [127:0] x_mon_if_wstrb_s31;
assign x_mon_if_wstrb_s31 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wid_s1
wire [31:0] x_mon_if_wid_s1;
assign x_mon_if_wid_s1 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s2
wire [31:0] x_mon_if_wid_s2;
assign x_mon_if_wid_s2 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s3
wire [31:0] x_mon_if_wid_s3;
assign x_mon_if_wid_s3 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s4
wire [31:0] x_mon_if_wid_s4;
assign x_mon_if_wid_s4 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s5
wire [31:0] x_mon_if_wid_s5;
assign x_mon_if_wid_s5 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s6
wire [31:0] x_mon_if_wid_s6;
assign x_mon_if_wid_s6 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s7
wire [31:0] x_mon_if_wid_s7;
assign x_mon_if_wid_s7 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s8
wire [31:0] x_mon_if_wid_s8;
assign x_mon_if_wid_s8 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s9
wire [31:0] x_mon_if_wid_s9;
assign x_mon_if_wid_s9 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s10
wire [31:0] x_mon_if_wid_s10;
assign x_mon_if_wid_s10 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s11
wire [31:0] x_mon_if_wid_s11;
assign x_mon_if_wid_s11 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s12
wire [31:0] x_mon_if_wid_s12;
assign x_mon_if_wid_s12 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s13
wire [31:0] x_mon_if_wid_s13;
assign x_mon_if_wid_s13 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s14
wire [31:0] x_mon_if_wid_s14;
assign x_mon_if_wid_s14 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s15
wire [31:0] x_mon_if_wid_s15;
assign x_mon_if_wid_s15 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s16
wire [31:0] x_mon_if_wid_s16;
assign x_mon_if_wid_s16 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s17
wire [31:0] x_mon_if_wid_s17;
assign x_mon_if_wid_s17 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s18
wire [31:0] x_mon_if_wid_s18;
assign x_mon_if_wid_s18 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s19
wire [31:0] x_mon_if_wid_s19;
assign x_mon_if_wid_s19 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s20
wire [31:0] x_mon_if_wid_s20;
assign x_mon_if_wid_s20 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s21
wire [31:0] x_mon_if_wid_s21;
assign x_mon_if_wid_s21 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s22
wire [31:0] x_mon_if_wid_s22;
assign x_mon_if_wid_s22 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s23
wire [31:0] x_mon_if_wid_s23;
assign x_mon_if_wid_s23 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s24
wire [31:0] x_mon_if_wid_s24;
assign x_mon_if_wid_s24 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s25
wire [31:0] x_mon_if_wid_s25;
assign x_mon_if_wid_s25 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s26
wire [31:0] x_mon_if_wid_s26;
assign x_mon_if_wid_s26 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s27
wire [31:0] x_mon_if_wid_s27;
assign x_mon_if_wid_s27 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s28
wire [31:0] x_mon_if_wid_s28;
assign x_mon_if_wid_s28 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s29
wire [31:0] x_mon_if_wid_s29;
assign x_mon_if_wid_s29 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s30
wire [31:0] x_mon_if_wid_s30;
assign x_mon_if_wid_s30 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_s31
wire [31:0] x_mon_if_wid_s31;
assign x_mon_if_wid_s31 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wready_s1
wire x_mon_if_wready_s1;
assign x_mon_if_wready_s1 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s2
wire x_mon_if_wready_s2;
assign x_mon_if_wready_s2 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s3
wire x_mon_if_wready_s3;
assign x_mon_if_wready_s3 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s4
wire x_mon_if_wready_s4;
assign x_mon_if_wready_s4 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s5
wire x_mon_if_wready_s5;
assign x_mon_if_wready_s5 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s6
wire x_mon_if_wready_s6;
assign x_mon_if_wready_s6 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s7
wire x_mon_if_wready_s7;
assign x_mon_if_wready_s7 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s8
wire x_mon_if_wready_s8;
assign x_mon_if_wready_s8 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s9
wire x_mon_if_wready_s9;
assign x_mon_if_wready_s9 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s10
wire x_mon_if_wready_s10;
assign x_mon_if_wready_s10 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s11
wire x_mon_if_wready_s11;
assign x_mon_if_wready_s11 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s12
wire x_mon_if_wready_s12;
assign x_mon_if_wready_s12 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s13
wire x_mon_if_wready_s13;
assign x_mon_if_wready_s13 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s14
wire x_mon_if_wready_s14;
assign x_mon_if_wready_s14 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s15
wire x_mon_if_wready_s15;
assign x_mon_if_wready_s15 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s16
wire x_mon_if_wready_s16;
assign x_mon_if_wready_s16 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s17
wire x_mon_if_wready_s17;
assign x_mon_if_wready_s17 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s18
wire x_mon_if_wready_s18;
assign x_mon_if_wready_s18 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s19
wire x_mon_if_wready_s19;
assign x_mon_if_wready_s19 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s20
wire x_mon_if_wready_s20;
assign x_mon_if_wready_s20 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s21
wire x_mon_if_wready_s21;
assign x_mon_if_wready_s21 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s22
wire x_mon_if_wready_s22;
assign x_mon_if_wready_s22 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s23
wire x_mon_if_wready_s23;
assign x_mon_if_wready_s23 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s24
wire x_mon_if_wready_s24;
assign x_mon_if_wready_s24 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s25
wire x_mon_if_wready_s25;
assign x_mon_if_wready_s25 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s26
wire x_mon_if_wready_s26;
assign x_mon_if_wready_s26 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s27
wire x_mon_if_wready_s27;
assign x_mon_if_wready_s27 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s28
wire x_mon_if_wready_s28;
assign x_mon_if_wready_s28 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s29
wire x_mon_if_wready_s29;
assign x_mon_if_wready_s29 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s30
wire x_mon_if_wready_s30;
assign x_mon_if_wready_s30 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_s31
wire x_mon_if_wready_s31;
assign x_mon_if_wready_s31 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: bvalid_s1
wire x_mon_if_bvalid_s1;
assign x_mon_if_bvalid_s1 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s2
wire x_mon_if_bvalid_s2;
assign x_mon_if_bvalid_s2 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s3
wire x_mon_if_bvalid_s3;
assign x_mon_if_bvalid_s3 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s4
wire x_mon_if_bvalid_s4;
assign x_mon_if_bvalid_s4 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s5
wire x_mon_if_bvalid_s5;
assign x_mon_if_bvalid_s5 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s6
wire x_mon_if_bvalid_s6;
assign x_mon_if_bvalid_s6 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s7
wire x_mon_if_bvalid_s7;
assign x_mon_if_bvalid_s7 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s8
wire x_mon_if_bvalid_s8;
assign x_mon_if_bvalid_s8 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s9
wire x_mon_if_bvalid_s9;
assign x_mon_if_bvalid_s9 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s10
wire x_mon_if_bvalid_s10;
assign x_mon_if_bvalid_s10 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s11
wire x_mon_if_bvalid_s11;
assign x_mon_if_bvalid_s11 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s12
wire x_mon_if_bvalid_s12;
assign x_mon_if_bvalid_s12 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s13
wire x_mon_if_bvalid_s13;
assign x_mon_if_bvalid_s13 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s14
wire x_mon_if_bvalid_s14;
assign x_mon_if_bvalid_s14 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s15
wire x_mon_if_bvalid_s15;
assign x_mon_if_bvalid_s15 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s16
wire x_mon_if_bvalid_s16;
assign x_mon_if_bvalid_s16 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s17
wire x_mon_if_bvalid_s17;
assign x_mon_if_bvalid_s17 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s18
wire x_mon_if_bvalid_s18;
assign x_mon_if_bvalid_s18 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s19
wire x_mon_if_bvalid_s19;
assign x_mon_if_bvalid_s19 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s20
wire x_mon_if_bvalid_s20;
assign x_mon_if_bvalid_s20 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s21
wire x_mon_if_bvalid_s21;
assign x_mon_if_bvalid_s21 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s22
wire x_mon_if_bvalid_s22;
assign x_mon_if_bvalid_s22 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s23
wire x_mon_if_bvalid_s23;
assign x_mon_if_bvalid_s23 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s24
wire x_mon_if_bvalid_s24;
assign x_mon_if_bvalid_s24 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s25
wire x_mon_if_bvalid_s25;
assign x_mon_if_bvalid_s25 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s26
wire x_mon_if_bvalid_s26;
assign x_mon_if_bvalid_s26 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s27
wire x_mon_if_bvalid_s27;
assign x_mon_if_bvalid_s27 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s28
wire x_mon_if_bvalid_s28;
assign x_mon_if_bvalid_s28 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s29
wire x_mon_if_bvalid_s29;
assign x_mon_if_bvalid_s29 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s30
wire x_mon_if_bvalid_s30;
assign x_mon_if_bvalid_s30 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_s31
wire x_mon_if_bvalid_s31;
assign x_mon_if_bvalid_s31 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bresp_s1
wire [1:0] x_mon_if_bresp_s1;
assign x_mon_if_bresp_s1 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s2
wire [1:0] x_mon_if_bresp_s2;
assign x_mon_if_bresp_s2 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s3
wire [1:0] x_mon_if_bresp_s3;
assign x_mon_if_bresp_s3 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s4
wire [1:0] x_mon_if_bresp_s4;
assign x_mon_if_bresp_s4 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s5
wire [1:0] x_mon_if_bresp_s5;
assign x_mon_if_bresp_s5 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s6
wire [1:0] x_mon_if_bresp_s6;
assign x_mon_if_bresp_s6 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s7
wire [1:0] x_mon_if_bresp_s7;
assign x_mon_if_bresp_s7 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s8
wire [1:0] x_mon_if_bresp_s8;
assign x_mon_if_bresp_s8 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s9
wire [1:0] x_mon_if_bresp_s9;
assign x_mon_if_bresp_s9 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s10
wire [1:0] x_mon_if_bresp_s10;
assign x_mon_if_bresp_s10 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s11
wire [1:0] x_mon_if_bresp_s11;
assign x_mon_if_bresp_s11 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s12
wire [1:0] x_mon_if_bresp_s12;
assign x_mon_if_bresp_s12 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s13
wire [1:0] x_mon_if_bresp_s13;
assign x_mon_if_bresp_s13 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s14
wire [1:0] x_mon_if_bresp_s14;
assign x_mon_if_bresp_s14 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s15
wire [1:0] x_mon_if_bresp_s15;
assign x_mon_if_bresp_s15 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s16
wire [1:0] x_mon_if_bresp_s16;
assign x_mon_if_bresp_s16 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s17
wire [1:0] x_mon_if_bresp_s17;
assign x_mon_if_bresp_s17 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s18
wire [1:0] x_mon_if_bresp_s18;
assign x_mon_if_bresp_s18 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s19
wire [1:0] x_mon_if_bresp_s19;
assign x_mon_if_bresp_s19 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s20
wire [1:0] x_mon_if_bresp_s20;
assign x_mon_if_bresp_s20 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s21
wire [1:0] x_mon_if_bresp_s21;
assign x_mon_if_bresp_s21 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s22
wire [1:0] x_mon_if_bresp_s22;
assign x_mon_if_bresp_s22 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s23
wire [1:0] x_mon_if_bresp_s23;
assign x_mon_if_bresp_s23 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s24
wire [1:0] x_mon_if_bresp_s24;
assign x_mon_if_bresp_s24 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s25
wire [1:0] x_mon_if_bresp_s25;
assign x_mon_if_bresp_s25 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s26
wire [1:0] x_mon_if_bresp_s26;
assign x_mon_if_bresp_s26 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s27
wire [1:0] x_mon_if_bresp_s27;
assign x_mon_if_bresp_s27 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s28
wire [1:0] x_mon_if_bresp_s28;
assign x_mon_if_bresp_s28 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s29
wire [1:0] x_mon_if_bresp_s29;
assign x_mon_if_bresp_s29 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s30
wire [1:0] x_mon_if_bresp_s30;
assign x_mon_if_bresp_s30 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_s31
wire [1:0] x_mon_if_bresp_s31;
assign x_mon_if_bresp_s31 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bid_s1
wire [31:0] x_mon_if_bid_s1;
assign x_mon_if_bid_s1 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s2
wire [31:0] x_mon_if_bid_s2;
assign x_mon_if_bid_s2 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s3
wire [31:0] x_mon_if_bid_s3;
assign x_mon_if_bid_s3 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s4
wire [31:0] x_mon_if_bid_s4;
assign x_mon_if_bid_s4 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s5
wire [31:0] x_mon_if_bid_s5;
assign x_mon_if_bid_s5 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s6
wire [31:0] x_mon_if_bid_s6;
assign x_mon_if_bid_s6 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s7
wire [31:0] x_mon_if_bid_s7;
assign x_mon_if_bid_s7 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s8
wire [31:0] x_mon_if_bid_s8;
assign x_mon_if_bid_s8 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s9
wire [31:0] x_mon_if_bid_s9;
assign x_mon_if_bid_s9 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s10
wire [31:0] x_mon_if_bid_s10;
assign x_mon_if_bid_s10 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s11
wire [31:0] x_mon_if_bid_s11;
assign x_mon_if_bid_s11 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s12
wire [31:0] x_mon_if_bid_s12;
assign x_mon_if_bid_s12 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s13
wire [31:0] x_mon_if_bid_s13;
assign x_mon_if_bid_s13 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s14
wire [31:0] x_mon_if_bid_s14;
assign x_mon_if_bid_s14 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s15
wire [31:0] x_mon_if_bid_s15;
assign x_mon_if_bid_s15 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s16
wire [31:0] x_mon_if_bid_s16;
assign x_mon_if_bid_s16 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s17
wire [31:0] x_mon_if_bid_s17;
assign x_mon_if_bid_s17 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s18
wire [31:0] x_mon_if_bid_s18;
assign x_mon_if_bid_s18 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s19
wire [31:0] x_mon_if_bid_s19;
assign x_mon_if_bid_s19 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s20
wire [31:0] x_mon_if_bid_s20;
assign x_mon_if_bid_s20 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s21
wire [31:0] x_mon_if_bid_s21;
assign x_mon_if_bid_s21 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s22
wire [31:0] x_mon_if_bid_s22;
assign x_mon_if_bid_s22 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s23
wire [31:0] x_mon_if_bid_s23;
assign x_mon_if_bid_s23 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s24
wire [31:0] x_mon_if_bid_s24;
assign x_mon_if_bid_s24 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s25
wire [31:0] x_mon_if_bid_s25;
assign x_mon_if_bid_s25 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s26
wire [31:0] x_mon_if_bid_s26;
assign x_mon_if_bid_s26 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s27
wire [31:0] x_mon_if_bid_s27;
assign x_mon_if_bid_s27 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s28
wire [31:0] x_mon_if_bid_s28;
assign x_mon_if_bid_s28 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s29
wire [31:0] x_mon_if_bid_s29;
assign x_mon_if_bid_s29 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s30
wire [31:0] x_mon_if_bid_s30;
assign x_mon_if_bid_s30 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_s31
wire [31:0] x_mon_if_bid_s31;
assign x_mon_if_bid_s31 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bready_s1
wire x_mon_if_bready_s1;
assign x_mon_if_bready_s1 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s2
wire x_mon_if_bready_s2;
assign x_mon_if_bready_s2 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s3
wire x_mon_if_bready_s3;
assign x_mon_if_bready_s3 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s4
wire x_mon_if_bready_s4;
assign x_mon_if_bready_s4 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s5
wire x_mon_if_bready_s5;
assign x_mon_if_bready_s5 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s6
wire x_mon_if_bready_s6;
assign x_mon_if_bready_s6 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s7
wire x_mon_if_bready_s7;
assign x_mon_if_bready_s7 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s8
wire x_mon_if_bready_s8;
assign x_mon_if_bready_s8 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s9
wire x_mon_if_bready_s9;
assign x_mon_if_bready_s9 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s10
wire x_mon_if_bready_s10;
assign x_mon_if_bready_s10 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s11
wire x_mon_if_bready_s11;
assign x_mon_if_bready_s11 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s12
wire x_mon_if_bready_s12;
assign x_mon_if_bready_s12 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s13
wire x_mon_if_bready_s13;
assign x_mon_if_bready_s13 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s14
wire x_mon_if_bready_s14;
assign x_mon_if_bready_s14 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s15
wire x_mon_if_bready_s15;
assign x_mon_if_bready_s15 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s16
wire x_mon_if_bready_s16;
assign x_mon_if_bready_s16 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s17
wire x_mon_if_bready_s17;
assign x_mon_if_bready_s17 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s18
wire x_mon_if_bready_s18;
assign x_mon_if_bready_s18 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s19
wire x_mon_if_bready_s19;
assign x_mon_if_bready_s19 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s20
wire x_mon_if_bready_s20;
assign x_mon_if_bready_s20 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s21
wire x_mon_if_bready_s21;
assign x_mon_if_bready_s21 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s22
wire x_mon_if_bready_s22;
assign x_mon_if_bready_s22 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s23
wire x_mon_if_bready_s23;
assign x_mon_if_bready_s23 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s24
wire x_mon_if_bready_s24;
assign x_mon_if_bready_s24 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s25
wire x_mon_if_bready_s25;
assign x_mon_if_bready_s25 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s26
wire x_mon_if_bready_s26;
assign x_mon_if_bready_s26 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s27
wire x_mon_if_bready_s27;
assign x_mon_if_bready_s27 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s28
wire x_mon_if_bready_s28;
assign x_mon_if_bready_s28 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s29
wire x_mon_if_bready_s29;
assign x_mon_if_bready_s29 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s30
wire x_mon_if_bready_s30;
assign x_mon_if_bready_s30 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_s31
wire x_mon_if_bready_s31;
assign x_mon_if_bready_s31 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: cactive_s1
wire x_mon_if_cactive_s1;
assign x_mon_if_cactive_s1 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s2
wire x_mon_if_cactive_s2;
assign x_mon_if_cactive_s2 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s3
wire x_mon_if_cactive_s3;
assign x_mon_if_cactive_s3 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s4
wire x_mon_if_cactive_s4;
assign x_mon_if_cactive_s4 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s5
wire x_mon_if_cactive_s5;
assign x_mon_if_cactive_s5 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s6
wire x_mon_if_cactive_s6;
assign x_mon_if_cactive_s6 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s7
wire x_mon_if_cactive_s7;
assign x_mon_if_cactive_s7 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s8
wire x_mon_if_cactive_s8;
assign x_mon_if_cactive_s8 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s9
wire x_mon_if_cactive_s9;
assign x_mon_if_cactive_s9 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s10
wire x_mon_if_cactive_s10;
assign x_mon_if_cactive_s10 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s11
wire x_mon_if_cactive_s11;
assign x_mon_if_cactive_s11 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s12
wire x_mon_if_cactive_s12;
assign x_mon_if_cactive_s12 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s13
wire x_mon_if_cactive_s13;
assign x_mon_if_cactive_s13 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s14
wire x_mon_if_cactive_s14;
assign x_mon_if_cactive_s14 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s15
wire x_mon_if_cactive_s15;
assign x_mon_if_cactive_s15 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s16
wire x_mon_if_cactive_s16;
assign x_mon_if_cactive_s16 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s17
wire x_mon_if_cactive_s17;
assign x_mon_if_cactive_s17 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s18
wire x_mon_if_cactive_s18;
assign x_mon_if_cactive_s18 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s19
wire x_mon_if_cactive_s19;
assign x_mon_if_cactive_s19 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s20
wire x_mon_if_cactive_s20;
assign x_mon_if_cactive_s20 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s21
wire x_mon_if_cactive_s21;
assign x_mon_if_cactive_s21 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s22
wire x_mon_if_cactive_s22;
assign x_mon_if_cactive_s22 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s23
wire x_mon_if_cactive_s23;
assign x_mon_if_cactive_s23 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s24
wire x_mon_if_cactive_s24;
assign x_mon_if_cactive_s24 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s25
wire x_mon_if_cactive_s25;
assign x_mon_if_cactive_s25 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s26
wire x_mon_if_cactive_s26;
assign x_mon_if_cactive_s26 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s27
wire x_mon_if_cactive_s27;
assign x_mon_if_cactive_s27 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s28
wire x_mon_if_cactive_s28;
assign x_mon_if_cactive_s28 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s29
wire x_mon_if_cactive_s29;
assign x_mon_if_cactive_s29 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s30
wire x_mon_if_cactive_s30;
assign x_mon_if_cactive_s30 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_s31
wire x_mon_if_cactive_s31;
assign x_mon_if_cactive_s31 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: csysreq_s1
wire x_mon_if_csysreq_s1;
assign x_mon_if_csysreq_s1 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s2
wire x_mon_if_csysreq_s2;
assign x_mon_if_csysreq_s2 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s3
wire x_mon_if_csysreq_s3;
assign x_mon_if_csysreq_s3 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s4
wire x_mon_if_csysreq_s4;
assign x_mon_if_csysreq_s4 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s5
wire x_mon_if_csysreq_s5;
assign x_mon_if_csysreq_s5 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s6
wire x_mon_if_csysreq_s6;
assign x_mon_if_csysreq_s6 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s7
wire x_mon_if_csysreq_s7;
assign x_mon_if_csysreq_s7 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s8
wire x_mon_if_csysreq_s8;
assign x_mon_if_csysreq_s8 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s9
wire x_mon_if_csysreq_s9;
assign x_mon_if_csysreq_s9 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s10
wire x_mon_if_csysreq_s10;
assign x_mon_if_csysreq_s10 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s11
wire x_mon_if_csysreq_s11;
assign x_mon_if_csysreq_s11 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s12
wire x_mon_if_csysreq_s12;
assign x_mon_if_csysreq_s12 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s13
wire x_mon_if_csysreq_s13;
assign x_mon_if_csysreq_s13 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s14
wire x_mon_if_csysreq_s14;
assign x_mon_if_csysreq_s14 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s15
wire x_mon_if_csysreq_s15;
assign x_mon_if_csysreq_s15 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s16
wire x_mon_if_csysreq_s16;
assign x_mon_if_csysreq_s16 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s17
wire x_mon_if_csysreq_s17;
assign x_mon_if_csysreq_s17 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s18
wire x_mon_if_csysreq_s18;
assign x_mon_if_csysreq_s18 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s19
wire x_mon_if_csysreq_s19;
assign x_mon_if_csysreq_s19 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s20
wire x_mon_if_csysreq_s20;
assign x_mon_if_csysreq_s20 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s21
wire x_mon_if_csysreq_s21;
assign x_mon_if_csysreq_s21 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s22
wire x_mon_if_csysreq_s22;
assign x_mon_if_csysreq_s22 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s23
wire x_mon_if_csysreq_s23;
assign x_mon_if_csysreq_s23 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s24
wire x_mon_if_csysreq_s24;
assign x_mon_if_csysreq_s24 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s25
wire x_mon_if_csysreq_s25;
assign x_mon_if_csysreq_s25 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s26
wire x_mon_if_csysreq_s26;
assign x_mon_if_csysreq_s26 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s27
wire x_mon_if_csysreq_s27;
assign x_mon_if_csysreq_s27 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s28
wire x_mon_if_csysreq_s28;
assign x_mon_if_csysreq_s28 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s29
wire x_mon_if_csysreq_s29;
assign x_mon_if_csysreq_s29 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s30
wire x_mon_if_csysreq_s30;
assign x_mon_if_csysreq_s30 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_s31
wire x_mon_if_csysreq_s31;
assign x_mon_if_csysreq_s31 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysack_s1
wire x_mon_if_csysack_s1;
assign x_mon_if_csysack_s1 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s2
wire x_mon_if_csysack_s2;
assign x_mon_if_csysack_s2 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s3
wire x_mon_if_csysack_s3;
assign x_mon_if_csysack_s3 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s4
wire x_mon_if_csysack_s4;
assign x_mon_if_csysack_s4 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s5
wire x_mon_if_csysack_s5;
assign x_mon_if_csysack_s5 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s6
wire x_mon_if_csysack_s6;
assign x_mon_if_csysack_s6 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s7
wire x_mon_if_csysack_s7;
assign x_mon_if_csysack_s7 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s8
wire x_mon_if_csysack_s8;
assign x_mon_if_csysack_s8 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s9
wire x_mon_if_csysack_s9;
assign x_mon_if_csysack_s9 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s10
wire x_mon_if_csysack_s10;
assign x_mon_if_csysack_s10 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s11
wire x_mon_if_csysack_s11;
assign x_mon_if_csysack_s11 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s12
wire x_mon_if_csysack_s12;
assign x_mon_if_csysack_s12 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s13
wire x_mon_if_csysack_s13;
assign x_mon_if_csysack_s13 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s14
wire x_mon_if_csysack_s14;
assign x_mon_if_csysack_s14 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s15
wire x_mon_if_csysack_s15;
assign x_mon_if_csysack_s15 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s16
wire x_mon_if_csysack_s16;
assign x_mon_if_csysack_s16 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s17
wire x_mon_if_csysack_s17;
assign x_mon_if_csysack_s17 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s18
wire x_mon_if_csysack_s18;
assign x_mon_if_csysack_s18 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s19
wire x_mon_if_csysack_s19;
assign x_mon_if_csysack_s19 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s20
wire x_mon_if_csysack_s20;
assign x_mon_if_csysack_s20 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s21
wire x_mon_if_csysack_s21;
assign x_mon_if_csysack_s21 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s22
wire x_mon_if_csysack_s22;
assign x_mon_if_csysack_s22 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s23
wire x_mon_if_csysack_s23;
assign x_mon_if_csysack_s23 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s24
wire x_mon_if_csysack_s24;
assign x_mon_if_csysack_s24 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s25
wire x_mon_if_csysack_s25;
assign x_mon_if_csysack_s25 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s26
wire x_mon_if_csysack_s26;
assign x_mon_if_csysack_s26 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s27
wire x_mon_if_csysack_s27;
assign x_mon_if_csysack_s27 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s28
wire x_mon_if_csysack_s28;
assign x_mon_if_csysack_s28 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s29
wire x_mon_if_csysack_s29;
assign x_mon_if_csysack_s29 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s30
wire x_mon_if_csysack_s30;
assign x_mon_if_csysack_s30 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_s31
wire x_mon_if_csysack_s31;
assign x_mon_if_csysack_s31 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: awsideband_s1
wire [63:0] x_mon_if_awsideband_s1;
assign x_mon_if_awsideband_s1 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s2
wire [63:0] x_mon_if_awsideband_s2;
assign x_mon_if_awsideband_s2 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s3
wire [63:0] x_mon_if_awsideband_s3;
assign x_mon_if_awsideband_s3 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s4
wire [63:0] x_mon_if_awsideband_s4;
assign x_mon_if_awsideband_s4 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s5
wire [63:0] x_mon_if_awsideband_s5;
assign x_mon_if_awsideband_s5 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s6
wire [63:0] x_mon_if_awsideband_s6;
assign x_mon_if_awsideband_s6 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s7
wire [63:0] x_mon_if_awsideband_s7;
assign x_mon_if_awsideband_s7 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s8
wire [63:0] x_mon_if_awsideband_s8;
assign x_mon_if_awsideband_s8 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s9
wire [63:0] x_mon_if_awsideband_s9;
assign x_mon_if_awsideband_s9 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s10
wire [63:0] x_mon_if_awsideband_s10;
assign x_mon_if_awsideband_s10 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s11
wire [63:0] x_mon_if_awsideband_s11;
assign x_mon_if_awsideband_s11 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s12
wire [63:0] x_mon_if_awsideband_s12;
assign x_mon_if_awsideband_s12 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s13
wire [63:0] x_mon_if_awsideband_s13;
assign x_mon_if_awsideband_s13 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s14
wire [63:0] x_mon_if_awsideband_s14;
assign x_mon_if_awsideband_s14 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s15
wire [63:0] x_mon_if_awsideband_s15;
assign x_mon_if_awsideband_s15 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s16
wire [63:0] x_mon_if_awsideband_s16;
assign x_mon_if_awsideband_s16 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s17
wire [63:0] x_mon_if_awsideband_s17;
assign x_mon_if_awsideband_s17 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s18
wire [63:0] x_mon_if_awsideband_s18;
assign x_mon_if_awsideband_s18 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s19
wire [63:0] x_mon_if_awsideband_s19;
assign x_mon_if_awsideband_s19 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s20
wire [63:0] x_mon_if_awsideband_s20;
assign x_mon_if_awsideband_s20 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s21
wire [63:0] x_mon_if_awsideband_s21;
assign x_mon_if_awsideband_s21 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s22
wire [63:0] x_mon_if_awsideband_s22;
assign x_mon_if_awsideband_s22 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s23
wire [63:0] x_mon_if_awsideband_s23;
assign x_mon_if_awsideband_s23 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s24
wire [63:0] x_mon_if_awsideband_s24;
assign x_mon_if_awsideband_s24 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s25
wire [63:0] x_mon_if_awsideband_s25;
assign x_mon_if_awsideband_s25 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s26
wire [63:0] x_mon_if_awsideband_s26;
assign x_mon_if_awsideband_s26 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s27
wire [63:0] x_mon_if_awsideband_s27;
assign x_mon_if_awsideband_s27 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s28
wire [63:0] x_mon_if_awsideband_s28;
assign x_mon_if_awsideband_s28 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s29
wire [63:0] x_mon_if_awsideband_s29;
assign x_mon_if_awsideband_s29 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s30
wire [63:0] x_mon_if_awsideband_s30;
assign x_mon_if_awsideband_s30 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_s31
wire [63:0] x_mon_if_awsideband_s31;
assign x_mon_if_awsideband_s31 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: arsideband_s1
wire [63:0] x_mon_if_arsideband_s1;
assign x_mon_if_arsideband_s1 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s2
wire [63:0] x_mon_if_arsideband_s2;
assign x_mon_if_arsideband_s2 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s3
wire [63:0] x_mon_if_arsideband_s3;
assign x_mon_if_arsideband_s3 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s4
wire [63:0] x_mon_if_arsideband_s4;
assign x_mon_if_arsideband_s4 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s5
wire [63:0] x_mon_if_arsideband_s5;
assign x_mon_if_arsideband_s5 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s6
wire [63:0] x_mon_if_arsideband_s6;
assign x_mon_if_arsideband_s6 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s7
wire [63:0] x_mon_if_arsideband_s7;
assign x_mon_if_arsideband_s7 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s8
wire [63:0] x_mon_if_arsideband_s8;
assign x_mon_if_arsideband_s8 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s9
wire [63:0] x_mon_if_arsideband_s9;
assign x_mon_if_arsideband_s9 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s10
wire [63:0] x_mon_if_arsideband_s10;
assign x_mon_if_arsideband_s10 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s11
wire [63:0] x_mon_if_arsideband_s11;
assign x_mon_if_arsideband_s11 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s12
wire [63:0] x_mon_if_arsideband_s12;
assign x_mon_if_arsideband_s12 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s13
wire [63:0] x_mon_if_arsideband_s13;
assign x_mon_if_arsideband_s13 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s14
wire [63:0] x_mon_if_arsideband_s14;
assign x_mon_if_arsideband_s14 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s15
wire [63:0] x_mon_if_arsideband_s15;
assign x_mon_if_arsideband_s15 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s16
wire [63:0] x_mon_if_arsideband_s16;
assign x_mon_if_arsideband_s16 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s17
wire [63:0] x_mon_if_arsideband_s17;
assign x_mon_if_arsideband_s17 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s18
wire [63:0] x_mon_if_arsideband_s18;
assign x_mon_if_arsideband_s18 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s19
wire [63:0] x_mon_if_arsideband_s19;
assign x_mon_if_arsideband_s19 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s20
wire [63:0] x_mon_if_arsideband_s20;
assign x_mon_if_arsideband_s20 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s21
wire [63:0] x_mon_if_arsideband_s21;
assign x_mon_if_arsideband_s21 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s22
wire [63:0] x_mon_if_arsideband_s22;
assign x_mon_if_arsideband_s22 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s23
wire [63:0] x_mon_if_arsideband_s23;
assign x_mon_if_arsideband_s23 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s24
wire [63:0] x_mon_if_arsideband_s24;
assign x_mon_if_arsideband_s24 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s25
wire [63:0] x_mon_if_arsideband_s25;
assign x_mon_if_arsideband_s25 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s26
wire [63:0] x_mon_if_arsideband_s26;
assign x_mon_if_arsideband_s26 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s27
wire [63:0] x_mon_if_arsideband_s27;
assign x_mon_if_arsideband_s27 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s28
wire [63:0] x_mon_if_arsideband_s28;
assign x_mon_if_arsideband_s28 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s29
wire [63:0] x_mon_if_arsideband_s29;
assign x_mon_if_arsideband_s29 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s30
wire [63:0] x_mon_if_arsideband_s30;
assign x_mon_if_arsideband_s30 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_s31
wire [63:0] x_mon_if_arsideband_s31;
assign x_mon_if_arsideband_s31 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: rsideband_s1
wire [63:0] x_mon_if_rsideband_s1;
assign x_mon_if_rsideband_s1 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s2
wire [63:0] x_mon_if_rsideband_s2;
assign x_mon_if_rsideband_s2 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s3
wire [63:0] x_mon_if_rsideband_s3;
assign x_mon_if_rsideband_s3 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s4
wire [63:0] x_mon_if_rsideband_s4;
assign x_mon_if_rsideband_s4 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s5
wire [63:0] x_mon_if_rsideband_s5;
assign x_mon_if_rsideband_s5 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s6
wire [63:0] x_mon_if_rsideband_s6;
assign x_mon_if_rsideband_s6 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s7
wire [63:0] x_mon_if_rsideband_s7;
assign x_mon_if_rsideband_s7 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s8
wire [63:0] x_mon_if_rsideband_s8;
assign x_mon_if_rsideband_s8 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s9
wire [63:0] x_mon_if_rsideband_s9;
assign x_mon_if_rsideband_s9 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s10
wire [63:0] x_mon_if_rsideband_s10;
assign x_mon_if_rsideband_s10 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s11
wire [63:0] x_mon_if_rsideband_s11;
assign x_mon_if_rsideband_s11 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s12
wire [63:0] x_mon_if_rsideband_s12;
assign x_mon_if_rsideband_s12 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s13
wire [63:0] x_mon_if_rsideband_s13;
assign x_mon_if_rsideband_s13 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s14
wire [63:0] x_mon_if_rsideband_s14;
assign x_mon_if_rsideband_s14 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s15
wire [63:0] x_mon_if_rsideband_s15;
assign x_mon_if_rsideband_s15 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s16
wire [63:0] x_mon_if_rsideband_s16;
assign x_mon_if_rsideband_s16 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s17
wire [63:0] x_mon_if_rsideband_s17;
assign x_mon_if_rsideband_s17 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s18
wire [63:0] x_mon_if_rsideband_s18;
assign x_mon_if_rsideband_s18 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s19
wire [63:0] x_mon_if_rsideband_s19;
assign x_mon_if_rsideband_s19 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s20
wire [63:0] x_mon_if_rsideband_s20;
assign x_mon_if_rsideband_s20 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s21
wire [63:0] x_mon_if_rsideband_s21;
assign x_mon_if_rsideband_s21 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s22
wire [63:0] x_mon_if_rsideband_s22;
assign x_mon_if_rsideband_s22 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s23
wire [63:0] x_mon_if_rsideband_s23;
assign x_mon_if_rsideband_s23 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s24
wire [63:0] x_mon_if_rsideband_s24;
assign x_mon_if_rsideband_s24 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s25
wire [63:0] x_mon_if_rsideband_s25;
assign x_mon_if_rsideband_s25 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s26
wire [63:0] x_mon_if_rsideband_s26;
assign x_mon_if_rsideband_s26 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s27
wire [63:0] x_mon_if_rsideband_s27;
assign x_mon_if_rsideband_s27 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s28
wire [63:0] x_mon_if_rsideband_s28;
assign x_mon_if_rsideband_s28 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s29
wire [63:0] x_mon_if_rsideband_s29;
assign x_mon_if_rsideband_s29 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s30
wire [63:0] x_mon_if_rsideband_s30;
assign x_mon_if_rsideband_s30 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_s31
wire [63:0] x_mon_if_rsideband_s31;
assign x_mon_if_rsideband_s31 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: wsideband_s1
wire [63:0] x_mon_if_wsideband_s1;
assign x_mon_if_wsideband_s1 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s2
wire [63:0] x_mon_if_wsideband_s2;
assign x_mon_if_wsideband_s2 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s3
wire [63:0] x_mon_if_wsideband_s3;
assign x_mon_if_wsideband_s3 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s4
wire [63:0] x_mon_if_wsideband_s4;
assign x_mon_if_wsideband_s4 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s5
wire [63:0] x_mon_if_wsideband_s5;
assign x_mon_if_wsideband_s5 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s6
wire [63:0] x_mon_if_wsideband_s6;
assign x_mon_if_wsideband_s6 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s7
wire [63:0] x_mon_if_wsideband_s7;
assign x_mon_if_wsideband_s7 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s8
wire [63:0] x_mon_if_wsideband_s8;
assign x_mon_if_wsideband_s8 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s9
wire [63:0] x_mon_if_wsideband_s9;
assign x_mon_if_wsideband_s9 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s10
wire [63:0] x_mon_if_wsideband_s10;
assign x_mon_if_wsideband_s10 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s11
wire [63:0] x_mon_if_wsideband_s11;
assign x_mon_if_wsideband_s11 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s12
wire [63:0] x_mon_if_wsideband_s12;
assign x_mon_if_wsideband_s12 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s13
wire [63:0] x_mon_if_wsideband_s13;
assign x_mon_if_wsideband_s13 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s14
wire [63:0] x_mon_if_wsideband_s14;
assign x_mon_if_wsideband_s14 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s15
wire [63:0] x_mon_if_wsideband_s15;
assign x_mon_if_wsideband_s15 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s16
wire [63:0] x_mon_if_wsideband_s16;
assign x_mon_if_wsideband_s16 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s17
wire [63:0] x_mon_if_wsideband_s17;
assign x_mon_if_wsideband_s17 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s18
wire [63:0] x_mon_if_wsideband_s18;
assign x_mon_if_wsideband_s18 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s19
wire [63:0] x_mon_if_wsideband_s19;
assign x_mon_if_wsideband_s19 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s20
wire [63:0] x_mon_if_wsideband_s20;
assign x_mon_if_wsideband_s20 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s21
wire [63:0] x_mon_if_wsideband_s21;
assign x_mon_if_wsideband_s21 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s22
wire [63:0] x_mon_if_wsideband_s22;
assign x_mon_if_wsideband_s22 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s23
wire [63:0] x_mon_if_wsideband_s23;
assign x_mon_if_wsideband_s23 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s24
wire [63:0] x_mon_if_wsideband_s24;
assign x_mon_if_wsideband_s24 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s25
wire [63:0] x_mon_if_wsideband_s25;
assign x_mon_if_wsideband_s25 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s26
wire [63:0] x_mon_if_wsideband_s26;
assign x_mon_if_wsideband_s26 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s27
wire [63:0] x_mon_if_wsideband_s27;
assign x_mon_if_wsideband_s27 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s28
wire [63:0] x_mon_if_wsideband_s28;
assign x_mon_if_wsideband_s28 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s29
wire [63:0] x_mon_if_wsideband_s29;
assign x_mon_if_wsideband_s29 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s30
wire [63:0] x_mon_if_wsideband_s30;
assign x_mon_if_wsideband_s30 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_s31
wire [63:0] x_mon_if_wsideband_s31;
assign x_mon_if_wsideband_s31 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: bsideband_s1
wire [63:0] x_mon_if_bsideband_s1;
assign x_mon_if_bsideband_s1 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s2
wire [63:0] x_mon_if_bsideband_s2;
assign x_mon_if_bsideband_s2 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s3
wire [63:0] x_mon_if_bsideband_s3;
assign x_mon_if_bsideband_s3 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s4
wire [63:0] x_mon_if_bsideband_s4;
assign x_mon_if_bsideband_s4 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s5
wire [63:0] x_mon_if_bsideband_s5;
assign x_mon_if_bsideband_s5 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s6
wire [63:0] x_mon_if_bsideband_s6;
assign x_mon_if_bsideband_s6 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s7
wire [63:0] x_mon_if_bsideband_s7;
assign x_mon_if_bsideband_s7 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s8
wire [63:0] x_mon_if_bsideband_s8;
assign x_mon_if_bsideband_s8 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s9
wire [63:0] x_mon_if_bsideband_s9;
assign x_mon_if_bsideband_s9 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s10
wire [63:0] x_mon_if_bsideband_s10;
assign x_mon_if_bsideband_s10 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s11
wire [63:0] x_mon_if_bsideband_s11;
assign x_mon_if_bsideband_s11 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s12
wire [63:0] x_mon_if_bsideband_s12;
assign x_mon_if_bsideband_s12 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s13
wire [63:0] x_mon_if_bsideband_s13;
assign x_mon_if_bsideband_s13 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s14
wire [63:0] x_mon_if_bsideband_s14;
assign x_mon_if_bsideband_s14 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s15
wire [63:0] x_mon_if_bsideband_s15;
assign x_mon_if_bsideband_s15 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s16
wire [63:0] x_mon_if_bsideband_s16;
assign x_mon_if_bsideband_s16 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s17
wire [63:0] x_mon_if_bsideband_s17;
assign x_mon_if_bsideband_s17 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s18
wire [63:0] x_mon_if_bsideband_s18;
assign x_mon_if_bsideband_s18 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s19
wire [63:0] x_mon_if_bsideband_s19;
assign x_mon_if_bsideband_s19 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s20
wire [63:0] x_mon_if_bsideband_s20;
assign x_mon_if_bsideband_s20 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s21
wire [63:0] x_mon_if_bsideband_s21;
assign x_mon_if_bsideband_s21 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s22
wire [63:0] x_mon_if_bsideband_s22;
assign x_mon_if_bsideband_s22 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s23
wire [63:0] x_mon_if_bsideband_s23;
assign x_mon_if_bsideband_s23 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s24
wire [63:0] x_mon_if_bsideband_s24;
assign x_mon_if_bsideband_s24 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s25
wire [63:0] x_mon_if_bsideband_s25;
assign x_mon_if_bsideband_s25 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s26
wire [63:0] x_mon_if_bsideband_s26;
assign x_mon_if_bsideband_s26 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s27
wire [63:0] x_mon_if_bsideband_s27;
assign x_mon_if_bsideband_s27 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s28
wire [63:0] x_mon_if_bsideband_s28;
assign x_mon_if_bsideband_s28 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s29
wire [63:0] x_mon_if_bsideband_s29;
assign x_mon_if_bsideband_s29 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s30
wire [63:0] x_mon_if_bsideband_s30;
assign x_mon_if_bsideband_s30 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_s31
wire [63:0] x_mon_if_bsideband_s31;
assign x_mon_if_bsideband_s31 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: arvalid_m0
wire x_mon_if_arvalid_m0;
assign x_mon_if_arvalid_m0 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m1
wire x_mon_if_arvalid_m1;
assign x_mon_if_arvalid_m1 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m2
wire x_mon_if_arvalid_m2;
assign x_mon_if_arvalid_m2 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m3
wire x_mon_if_arvalid_m3;
assign x_mon_if_arvalid_m3 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m4
wire x_mon_if_arvalid_m4;
assign x_mon_if_arvalid_m4 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m5
wire x_mon_if_arvalid_m5;
assign x_mon_if_arvalid_m5 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m6
wire x_mon_if_arvalid_m6;
assign x_mon_if_arvalid_m6 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m7
wire x_mon_if_arvalid_m7;
assign x_mon_if_arvalid_m7 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m8
wire x_mon_if_arvalid_m8;
assign x_mon_if_arvalid_m8 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m9
wire x_mon_if_arvalid_m9;
assign x_mon_if_arvalid_m9 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m10
wire x_mon_if_arvalid_m10;
assign x_mon_if_arvalid_m10 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m11
wire x_mon_if_arvalid_m11;
assign x_mon_if_arvalid_m11 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m12
wire x_mon_if_arvalid_m12;
assign x_mon_if_arvalid_m12 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m13
wire x_mon_if_arvalid_m13;
assign x_mon_if_arvalid_m13 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m14
wire x_mon_if_arvalid_m14;
assign x_mon_if_arvalid_m14 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m15
wire x_mon_if_arvalid_m15;
assign x_mon_if_arvalid_m15 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m16
wire x_mon_if_arvalid_m16;
assign x_mon_if_arvalid_m16 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m17
wire x_mon_if_arvalid_m17;
assign x_mon_if_arvalid_m17 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m18
wire x_mon_if_arvalid_m18;
assign x_mon_if_arvalid_m18 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m19
wire x_mon_if_arvalid_m19;
assign x_mon_if_arvalid_m19 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m20
wire x_mon_if_arvalid_m20;
assign x_mon_if_arvalid_m20 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m21
wire x_mon_if_arvalid_m21;
assign x_mon_if_arvalid_m21 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m22
wire x_mon_if_arvalid_m22;
assign x_mon_if_arvalid_m22 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m23
wire x_mon_if_arvalid_m23;
assign x_mon_if_arvalid_m23 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m24
wire x_mon_if_arvalid_m24;
assign x_mon_if_arvalid_m24 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m25
wire x_mon_if_arvalid_m25;
assign x_mon_if_arvalid_m25 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m26
wire x_mon_if_arvalid_m26;
assign x_mon_if_arvalid_m26 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m27
wire x_mon_if_arvalid_m27;
assign x_mon_if_arvalid_m27 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m28
wire x_mon_if_arvalid_m28;
assign x_mon_if_arvalid_m28 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m29
wire x_mon_if_arvalid_m29;
assign x_mon_if_arvalid_m29 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m30
wire x_mon_if_arvalid_m30;
assign x_mon_if_arvalid_m30 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: arvalid_m31
wire x_mon_if_arvalid_m31;
assign x_mon_if_arvalid_m31 = test_DW_axi_x2p. arvalid_nu;

// Interface: x_mon_if Signal: araddr_m0
wire [63:0] x_mon_if_araddr_m0;
assign x_mon_if_araddr_m0 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m1
wire [63:0] x_mon_if_araddr_m1;
assign x_mon_if_araddr_m1 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m2
wire [63:0] x_mon_if_araddr_m2;
assign x_mon_if_araddr_m2 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m3
wire [63:0] x_mon_if_araddr_m3;
assign x_mon_if_araddr_m3 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m4
wire [63:0] x_mon_if_araddr_m4;
assign x_mon_if_araddr_m4 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m5
wire [63:0] x_mon_if_araddr_m5;
assign x_mon_if_araddr_m5 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m6
wire [63:0] x_mon_if_araddr_m6;
assign x_mon_if_araddr_m6 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m7
wire [63:0] x_mon_if_araddr_m7;
assign x_mon_if_araddr_m7 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m8
wire [63:0] x_mon_if_araddr_m8;
assign x_mon_if_araddr_m8 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m9
wire [63:0] x_mon_if_araddr_m9;
assign x_mon_if_araddr_m9 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m10
wire [63:0] x_mon_if_araddr_m10;
assign x_mon_if_araddr_m10 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m11
wire [63:0] x_mon_if_araddr_m11;
assign x_mon_if_araddr_m11 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m12
wire [63:0] x_mon_if_araddr_m12;
assign x_mon_if_araddr_m12 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m13
wire [63:0] x_mon_if_araddr_m13;
assign x_mon_if_araddr_m13 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m14
wire [63:0] x_mon_if_araddr_m14;
assign x_mon_if_araddr_m14 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m15
wire [63:0] x_mon_if_araddr_m15;
assign x_mon_if_araddr_m15 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m16
wire [63:0] x_mon_if_araddr_m16;
assign x_mon_if_araddr_m16 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m17
wire [63:0] x_mon_if_araddr_m17;
assign x_mon_if_araddr_m17 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m18
wire [63:0] x_mon_if_araddr_m18;
assign x_mon_if_araddr_m18 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m19
wire [63:0] x_mon_if_araddr_m19;
assign x_mon_if_araddr_m19 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m20
wire [63:0] x_mon_if_araddr_m20;
assign x_mon_if_araddr_m20 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m21
wire [63:0] x_mon_if_araddr_m21;
assign x_mon_if_araddr_m21 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m22
wire [63:0] x_mon_if_araddr_m22;
assign x_mon_if_araddr_m22 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m23
wire [63:0] x_mon_if_araddr_m23;
assign x_mon_if_araddr_m23 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m24
wire [63:0] x_mon_if_araddr_m24;
assign x_mon_if_araddr_m24 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m25
wire [63:0] x_mon_if_araddr_m25;
assign x_mon_if_araddr_m25 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m26
wire [63:0] x_mon_if_araddr_m26;
assign x_mon_if_araddr_m26 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m27
wire [63:0] x_mon_if_araddr_m27;
assign x_mon_if_araddr_m27 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m28
wire [63:0] x_mon_if_araddr_m28;
assign x_mon_if_araddr_m28 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m29
wire [63:0] x_mon_if_araddr_m29;
assign x_mon_if_araddr_m29 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m30
wire [63:0] x_mon_if_araddr_m30;
assign x_mon_if_araddr_m30 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: araddr_m31
wire [63:0] x_mon_if_araddr_m31;
assign x_mon_if_araddr_m31 = test_DW_axi_x2p. araddr_nu;

// Interface: x_mon_if Signal: arlen_m0
wire [9:0] x_mon_if_arlen_m0;
assign x_mon_if_arlen_m0 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m1
wire [9:0] x_mon_if_arlen_m1;
assign x_mon_if_arlen_m1 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m2
wire [9:0] x_mon_if_arlen_m2;
assign x_mon_if_arlen_m2 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m3
wire [9:0] x_mon_if_arlen_m3;
assign x_mon_if_arlen_m3 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m4
wire [9:0] x_mon_if_arlen_m4;
assign x_mon_if_arlen_m4 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m5
wire [9:0] x_mon_if_arlen_m5;
assign x_mon_if_arlen_m5 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m6
wire [9:0] x_mon_if_arlen_m6;
assign x_mon_if_arlen_m6 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m7
wire [9:0] x_mon_if_arlen_m7;
assign x_mon_if_arlen_m7 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m8
wire [9:0] x_mon_if_arlen_m8;
assign x_mon_if_arlen_m8 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m9
wire [9:0] x_mon_if_arlen_m9;
assign x_mon_if_arlen_m9 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m10
wire [9:0] x_mon_if_arlen_m10;
assign x_mon_if_arlen_m10 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m11
wire [9:0] x_mon_if_arlen_m11;
assign x_mon_if_arlen_m11 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m12
wire [9:0] x_mon_if_arlen_m12;
assign x_mon_if_arlen_m12 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m13
wire [9:0] x_mon_if_arlen_m13;
assign x_mon_if_arlen_m13 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m14
wire [9:0] x_mon_if_arlen_m14;
assign x_mon_if_arlen_m14 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m15
wire [9:0] x_mon_if_arlen_m15;
assign x_mon_if_arlen_m15 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m16
wire [9:0] x_mon_if_arlen_m16;
assign x_mon_if_arlen_m16 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m17
wire [9:0] x_mon_if_arlen_m17;
assign x_mon_if_arlen_m17 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m18
wire [9:0] x_mon_if_arlen_m18;
assign x_mon_if_arlen_m18 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m19
wire [9:0] x_mon_if_arlen_m19;
assign x_mon_if_arlen_m19 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m20
wire [9:0] x_mon_if_arlen_m20;
assign x_mon_if_arlen_m20 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m21
wire [9:0] x_mon_if_arlen_m21;
assign x_mon_if_arlen_m21 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m22
wire [9:0] x_mon_if_arlen_m22;
assign x_mon_if_arlen_m22 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m23
wire [9:0] x_mon_if_arlen_m23;
assign x_mon_if_arlen_m23 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m24
wire [9:0] x_mon_if_arlen_m24;
assign x_mon_if_arlen_m24 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m25
wire [9:0] x_mon_if_arlen_m25;
assign x_mon_if_arlen_m25 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m26
wire [9:0] x_mon_if_arlen_m26;
assign x_mon_if_arlen_m26 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m27
wire [9:0] x_mon_if_arlen_m27;
assign x_mon_if_arlen_m27 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m28
wire [9:0] x_mon_if_arlen_m28;
assign x_mon_if_arlen_m28 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m29
wire [9:0] x_mon_if_arlen_m29;
assign x_mon_if_arlen_m29 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m30
wire [9:0] x_mon_if_arlen_m30;
assign x_mon_if_arlen_m30 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arlen_m31
wire [9:0] x_mon_if_arlen_m31;
assign x_mon_if_arlen_m31 = test_DW_axi_x2p. arlen_nu;

// Interface: x_mon_if Signal: arsize_m0
wire [2:0] x_mon_if_arsize_m0;
assign x_mon_if_arsize_m0 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m1
wire [2:0] x_mon_if_arsize_m1;
assign x_mon_if_arsize_m1 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m2
wire [2:0] x_mon_if_arsize_m2;
assign x_mon_if_arsize_m2 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m3
wire [2:0] x_mon_if_arsize_m3;
assign x_mon_if_arsize_m3 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m4
wire [2:0] x_mon_if_arsize_m4;
assign x_mon_if_arsize_m4 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m5
wire [2:0] x_mon_if_arsize_m5;
assign x_mon_if_arsize_m5 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m6
wire [2:0] x_mon_if_arsize_m6;
assign x_mon_if_arsize_m6 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m7
wire [2:0] x_mon_if_arsize_m7;
assign x_mon_if_arsize_m7 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m8
wire [2:0] x_mon_if_arsize_m8;
assign x_mon_if_arsize_m8 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m9
wire [2:0] x_mon_if_arsize_m9;
assign x_mon_if_arsize_m9 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m10
wire [2:0] x_mon_if_arsize_m10;
assign x_mon_if_arsize_m10 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m11
wire [2:0] x_mon_if_arsize_m11;
assign x_mon_if_arsize_m11 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m12
wire [2:0] x_mon_if_arsize_m12;
assign x_mon_if_arsize_m12 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m13
wire [2:0] x_mon_if_arsize_m13;
assign x_mon_if_arsize_m13 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m14
wire [2:0] x_mon_if_arsize_m14;
assign x_mon_if_arsize_m14 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m15
wire [2:0] x_mon_if_arsize_m15;
assign x_mon_if_arsize_m15 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m16
wire [2:0] x_mon_if_arsize_m16;
assign x_mon_if_arsize_m16 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m17
wire [2:0] x_mon_if_arsize_m17;
assign x_mon_if_arsize_m17 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m18
wire [2:0] x_mon_if_arsize_m18;
assign x_mon_if_arsize_m18 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m19
wire [2:0] x_mon_if_arsize_m19;
assign x_mon_if_arsize_m19 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m20
wire [2:0] x_mon_if_arsize_m20;
assign x_mon_if_arsize_m20 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m21
wire [2:0] x_mon_if_arsize_m21;
assign x_mon_if_arsize_m21 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m22
wire [2:0] x_mon_if_arsize_m22;
assign x_mon_if_arsize_m22 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m23
wire [2:0] x_mon_if_arsize_m23;
assign x_mon_if_arsize_m23 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m24
wire [2:0] x_mon_if_arsize_m24;
assign x_mon_if_arsize_m24 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m25
wire [2:0] x_mon_if_arsize_m25;
assign x_mon_if_arsize_m25 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m26
wire [2:0] x_mon_if_arsize_m26;
assign x_mon_if_arsize_m26 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m27
wire [2:0] x_mon_if_arsize_m27;
assign x_mon_if_arsize_m27 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m28
wire [2:0] x_mon_if_arsize_m28;
assign x_mon_if_arsize_m28 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m29
wire [2:0] x_mon_if_arsize_m29;
assign x_mon_if_arsize_m29 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m30
wire [2:0] x_mon_if_arsize_m30;
assign x_mon_if_arsize_m30 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arsize_m31
wire [2:0] x_mon_if_arsize_m31;
assign x_mon_if_arsize_m31 = test_DW_axi_x2p. arsize_nu;

// Interface: x_mon_if Signal: arburst_m0
wire [1:0] x_mon_if_arburst_m0;
assign x_mon_if_arburst_m0 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m1
wire [1:0] x_mon_if_arburst_m1;
assign x_mon_if_arburst_m1 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m2
wire [1:0] x_mon_if_arburst_m2;
assign x_mon_if_arburst_m2 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m3
wire [1:0] x_mon_if_arburst_m3;
assign x_mon_if_arburst_m3 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m4
wire [1:0] x_mon_if_arburst_m4;
assign x_mon_if_arburst_m4 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m5
wire [1:0] x_mon_if_arburst_m5;
assign x_mon_if_arburst_m5 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m6
wire [1:0] x_mon_if_arburst_m6;
assign x_mon_if_arburst_m6 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m7
wire [1:0] x_mon_if_arburst_m7;
assign x_mon_if_arburst_m7 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m8
wire [1:0] x_mon_if_arburst_m8;
assign x_mon_if_arburst_m8 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m9
wire [1:0] x_mon_if_arburst_m9;
assign x_mon_if_arburst_m9 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m10
wire [1:0] x_mon_if_arburst_m10;
assign x_mon_if_arburst_m10 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m11
wire [1:0] x_mon_if_arburst_m11;
assign x_mon_if_arburst_m11 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m12
wire [1:0] x_mon_if_arburst_m12;
assign x_mon_if_arburst_m12 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m13
wire [1:0] x_mon_if_arburst_m13;
assign x_mon_if_arburst_m13 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m14
wire [1:0] x_mon_if_arburst_m14;
assign x_mon_if_arburst_m14 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m15
wire [1:0] x_mon_if_arburst_m15;
assign x_mon_if_arburst_m15 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m16
wire [1:0] x_mon_if_arburst_m16;
assign x_mon_if_arburst_m16 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m17
wire [1:0] x_mon_if_arburst_m17;
assign x_mon_if_arburst_m17 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m18
wire [1:0] x_mon_if_arburst_m18;
assign x_mon_if_arburst_m18 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m19
wire [1:0] x_mon_if_arburst_m19;
assign x_mon_if_arburst_m19 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m20
wire [1:0] x_mon_if_arburst_m20;
assign x_mon_if_arburst_m20 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m21
wire [1:0] x_mon_if_arburst_m21;
assign x_mon_if_arburst_m21 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m22
wire [1:0] x_mon_if_arburst_m22;
assign x_mon_if_arburst_m22 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m23
wire [1:0] x_mon_if_arburst_m23;
assign x_mon_if_arburst_m23 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m24
wire [1:0] x_mon_if_arburst_m24;
assign x_mon_if_arburst_m24 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m25
wire [1:0] x_mon_if_arburst_m25;
assign x_mon_if_arburst_m25 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m26
wire [1:0] x_mon_if_arburst_m26;
assign x_mon_if_arburst_m26 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m27
wire [1:0] x_mon_if_arburst_m27;
assign x_mon_if_arburst_m27 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m28
wire [1:0] x_mon_if_arburst_m28;
assign x_mon_if_arburst_m28 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m29
wire [1:0] x_mon_if_arburst_m29;
assign x_mon_if_arburst_m29 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m30
wire [1:0] x_mon_if_arburst_m30;
assign x_mon_if_arburst_m30 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arburst_m31
wire [1:0] x_mon_if_arburst_m31;
assign x_mon_if_arburst_m31 = test_DW_axi_x2p. arburst_nu;

// Interface: x_mon_if Signal: arlock_m0
wire [1:0] x_mon_if_arlock_m0;
assign x_mon_if_arlock_m0 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m1
wire [1:0] x_mon_if_arlock_m1;
assign x_mon_if_arlock_m1 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m2
wire [1:0] x_mon_if_arlock_m2;
assign x_mon_if_arlock_m2 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m3
wire [1:0] x_mon_if_arlock_m3;
assign x_mon_if_arlock_m3 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m4
wire [1:0] x_mon_if_arlock_m4;
assign x_mon_if_arlock_m4 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m5
wire [1:0] x_mon_if_arlock_m5;
assign x_mon_if_arlock_m5 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m6
wire [1:0] x_mon_if_arlock_m6;
assign x_mon_if_arlock_m6 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m7
wire [1:0] x_mon_if_arlock_m7;
assign x_mon_if_arlock_m7 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m8
wire [1:0] x_mon_if_arlock_m8;
assign x_mon_if_arlock_m8 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m9
wire [1:0] x_mon_if_arlock_m9;
assign x_mon_if_arlock_m9 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m10
wire [1:0] x_mon_if_arlock_m10;
assign x_mon_if_arlock_m10 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m11
wire [1:0] x_mon_if_arlock_m11;
assign x_mon_if_arlock_m11 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m12
wire [1:0] x_mon_if_arlock_m12;
assign x_mon_if_arlock_m12 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m13
wire [1:0] x_mon_if_arlock_m13;
assign x_mon_if_arlock_m13 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m14
wire [1:0] x_mon_if_arlock_m14;
assign x_mon_if_arlock_m14 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m15
wire [1:0] x_mon_if_arlock_m15;
assign x_mon_if_arlock_m15 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m16
wire [1:0] x_mon_if_arlock_m16;
assign x_mon_if_arlock_m16 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m17
wire [1:0] x_mon_if_arlock_m17;
assign x_mon_if_arlock_m17 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m18
wire [1:0] x_mon_if_arlock_m18;
assign x_mon_if_arlock_m18 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m19
wire [1:0] x_mon_if_arlock_m19;
assign x_mon_if_arlock_m19 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m20
wire [1:0] x_mon_if_arlock_m20;
assign x_mon_if_arlock_m20 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m21
wire [1:0] x_mon_if_arlock_m21;
assign x_mon_if_arlock_m21 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m22
wire [1:0] x_mon_if_arlock_m22;
assign x_mon_if_arlock_m22 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m23
wire [1:0] x_mon_if_arlock_m23;
assign x_mon_if_arlock_m23 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m24
wire [1:0] x_mon_if_arlock_m24;
assign x_mon_if_arlock_m24 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m25
wire [1:0] x_mon_if_arlock_m25;
assign x_mon_if_arlock_m25 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m26
wire [1:0] x_mon_if_arlock_m26;
assign x_mon_if_arlock_m26 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m27
wire [1:0] x_mon_if_arlock_m27;
assign x_mon_if_arlock_m27 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m28
wire [1:0] x_mon_if_arlock_m28;
assign x_mon_if_arlock_m28 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m29
wire [1:0] x_mon_if_arlock_m29;
assign x_mon_if_arlock_m29 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m30
wire [1:0] x_mon_if_arlock_m30;
assign x_mon_if_arlock_m30 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arlock_m31
wire [1:0] x_mon_if_arlock_m31;
assign x_mon_if_arlock_m31 = test_DW_axi_x2p. arlock_nu;

// Interface: x_mon_if Signal: arcache_m0
wire [3:0] x_mon_if_arcache_m0;
assign x_mon_if_arcache_m0 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m1
wire [3:0] x_mon_if_arcache_m1;
assign x_mon_if_arcache_m1 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m2
wire [3:0] x_mon_if_arcache_m2;
assign x_mon_if_arcache_m2 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m3
wire [3:0] x_mon_if_arcache_m3;
assign x_mon_if_arcache_m3 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m4
wire [3:0] x_mon_if_arcache_m4;
assign x_mon_if_arcache_m4 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m5
wire [3:0] x_mon_if_arcache_m5;
assign x_mon_if_arcache_m5 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m6
wire [3:0] x_mon_if_arcache_m6;
assign x_mon_if_arcache_m6 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m7
wire [3:0] x_mon_if_arcache_m7;
assign x_mon_if_arcache_m7 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m8
wire [3:0] x_mon_if_arcache_m8;
assign x_mon_if_arcache_m8 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m9
wire [3:0] x_mon_if_arcache_m9;
assign x_mon_if_arcache_m9 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m10
wire [3:0] x_mon_if_arcache_m10;
assign x_mon_if_arcache_m10 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m11
wire [3:0] x_mon_if_arcache_m11;
assign x_mon_if_arcache_m11 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m12
wire [3:0] x_mon_if_arcache_m12;
assign x_mon_if_arcache_m12 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m13
wire [3:0] x_mon_if_arcache_m13;
assign x_mon_if_arcache_m13 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m14
wire [3:0] x_mon_if_arcache_m14;
assign x_mon_if_arcache_m14 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m15
wire [3:0] x_mon_if_arcache_m15;
assign x_mon_if_arcache_m15 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m16
wire [3:0] x_mon_if_arcache_m16;
assign x_mon_if_arcache_m16 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m17
wire [3:0] x_mon_if_arcache_m17;
assign x_mon_if_arcache_m17 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m18
wire [3:0] x_mon_if_arcache_m18;
assign x_mon_if_arcache_m18 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m19
wire [3:0] x_mon_if_arcache_m19;
assign x_mon_if_arcache_m19 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m20
wire [3:0] x_mon_if_arcache_m20;
assign x_mon_if_arcache_m20 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m21
wire [3:0] x_mon_if_arcache_m21;
assign x_mon_if_arcache_m21 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m22
wire [3:0] x_mon_if_arcache_m22;
assign x_mon_if_arcache_m22 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m23
wire [3:0] x_mon_if_arcache_m23;
assign x_mon_if_arcache_m23 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m24
wire [3:0] x_mon_if_arcache_m24;
assign x_mon_if_arcache_m24 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m25
wire [3:0] x_mon_if_arcache_m25;
assign x_mon_if_arcache_m25 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m26
wire [3:0] x_mon_if_arcache_m26;
assign x_mon_if_arcache_m26 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m27
wire [3:0] x_mon_if_arcache_m27;
assign x_mon_if_arcache_m27 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m28
wire [3:0] x_mon_if_arcache_m28;
assign x_mon_if_arcache_m28 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m29
wire [3:0] x_mon_if_arcache_m29;
assign x_mon_if_arcache_m29 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m30
wire [3:0] x_mon_if_arcache_m30;
assign x_mon_if_arcache_m30 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arcache_m31
wire [3:0] x_mon_if_arcache_m31;
assign x_mon_if_arcache_m31 = test_DW_axi_x2p. arcache_nu;

// Interface: x_mon_if Signal: arprot_m0
wire [2:0] x_mon_if_arprot_m0;
assign x_mon_if_arprot_m0 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m1
wire [2:0] x_mon_if_arprot_m1;
assign x_mon_if_arprot_m1 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m2
wire [2:0] x_mon_if_arprot_m2;
assign x_mon_if_arprot_m2 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m3
wire [2:0] x_mon_if_arprot_m3;
assign x_mon_if_arprot_m3 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m4
wire [2:0] x_mon_if_arprot_m4;
assign x_mon_if_arprot_m4 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m5
wire [2:0] x_mon_if_arprot_m5;
assign x_mon_if_arprot_m5 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m6
wire [2:0] x_mon_if_arprot_m6;
assign x_mon_if_arprot_m6 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m7
wire [2:0] x_mon_if_arprot_m7;
assign x_mon_if_arprot_m7 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m8
wire [2:0] x_mon_if_arprot_m8;
assign x_mon_if_arprot_m8 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m9
wire [2:0] x_mon_if_arprot_m9;
assign x_mon_if_arprot_m9 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m10
wire [2:0] x_mon_if_arprot_m10;
assign x_mon_if_arprot_m10 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m11
wire [2:0] x_mon_if_arprot_m11;
assign x_mon_if_arprot_m11 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m12
wire [2:0] x_mon_if_arprot_m12;
assign x_mon_if_arprot_m12 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m13
wire [2:0] x_mon_if_arprot_m13;
assign x_mon_if_arprot_m13 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m14
wire [2:0] x_mon_if_arprot_m14;
assign x_mon_if_arprot_m14 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m15
wire [2:0] x_mon_if_arprot_m15;
assign x_mon_if_arprot_m15 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m16
wire [2:0] x_mon_if_arprot_m16;
assign x_mon_if_arprot_m16 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m17
wire [2:0] x_mon_if_arprot_m17;
assign x_mon_if_arprot_m17 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m18
wire [2:0] x_mon_if_arprot_m18;
assign x_mon_if_arprot_m18 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m19
wire [2:0] x_mon_if_arprot_m19;
assign x_mon_if_arprot_m19 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m20
wire [2:0] x_mon_if_arprot_m20;
assign x_mon_if_arprot_m20 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m21
wire [2:0] x_mon_if_arprot_m21;
assign x_mon_if_arprot_m21 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m22
wire [2:0] x_mon_if_arprot_m22;
assign x_mon_if_arprot_m22 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m23
wire [2:0] x_mon_if_arprot_m23;
assign x_mon_if_arprot_m23 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m24
wire [2:0] x_mon_if_arprot_m24;
assign x_mon_if_arprot_m24 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m25
wire [2:0] x_mon_if_arprot_m25;
assign x_mon_if_arprot_m25 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m26
wire [2:0] x_mon_if_arprot_m26;
assign x_mon_if_arprot_m26 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m27
wire [2:0] x_mon_if_arprot_m27;
assign x_mon_if_arprot_m27 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m28
wire [2:0] x_mon_if_arprot_m28;
assign x_mon_if_arprot_m28 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m29
wire [2:0] x_mon_if_arprot_m29;
assign x_mon_if_arprot_m29 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m30
wire [2:0] x_mon_if_arprot_m30;
assign x_mon_if_arprot_m30 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arprot_m31
wire [2:0] x_mon_if_arprot_m31;
assign x_mon_if_arprot_m31 = test_DW_axi_x2p. arprot_nu;

// Interface: x_mon_if Signal: arid_m0
wire [31:0] x_mon_if_arid_m0;
assign x_mon_if_arid_m0 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m1
wire [31:0] x_mon_if_arid_m1;
assign x_mon_if_arid_m1 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m2
wire [31:0] x_mon_if_arid_m2;
assign x_mon_if_arid_m2 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m3
wire [31:0] x_mon_if_arid_m3;
assign x_mon_if_arid_m3 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m4
wire [31:0] x_mon_if_arid_m4;
assign x_mon_if_arid_m4 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m5
wire [31:0] x_mon_if_arid_m5;
assign x_mon_if_arid_m5 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m6
wire [31:0] x_mon_if_arid_m6;
assign x_mon_if_arid_m6 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m7
wire [31:0] x_mon_if_arid_m7;
assign x_mon_if_arid_m7 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m8
wire [31:0] x_mon_if_arid_m8;
assign x_mon_if_arid_m8 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m9
wire [31:0] x_mon_if_arid_m9;
assign x_mon_if_arid_m9 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m10
wire [31:0] x_mon_if_arid_m10;
assign x_mon_if_arid_m10 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m11
wire [31:0] x_mon_if_arid_m11;
assign x_mon_if_arid_m11 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m12
wire [31:0] x_mon_if_arid_m12;
assign x_mon_if_arid_m12 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m13
wire [31:0] x_mon_if_arid_m13;
assign x_mon_if_arid_m13 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m14
wire [31:0] x_mon_if_arid_m14;
assign x_mon_if_arid_m14 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m15
wire [31:0] x_mon_if_arid_m15;
assign x_mon_if_arid_m15 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m16
wire [31:0] x_mon_if_arid_m16;
assign x_mon_if_arid_m16 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m17
wire [31:0] x_mon_if_arid_m17;
assign x_mon_if_arid_m17 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m18
wire [31:0] x_mon_if_arid_m18;
assign x_mon_if_arid_m18 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m19
wire [31:0] x_mon_if_arid_m19;
assign x_mon_if_arid_m19 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m20
wire [31:0] x_mon_if_arid_m20;
assign x_mon_if_arid_m20 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m21
wire [31:0] x_mon_if_arid_m21;
assign x_mon_if_arid_m21 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m22
wire [31:0] x_mon_if_arid_m22;
assign x_mon_if_arid_m22 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m23
wire [31:0] x_mon_if_arid_m23;
assign x_mon_if_arid_m23 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m24
wire [31:0] x_mon_if_arid_m24;
assign x_mon_if_arid_m24 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m25
wire [31:0] x_mon_if_arid_m25;
assign x_mon_if_arid_m25 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m26
wire [31:0] x_mon_if_arid_m26;
assign x_mon_if_arid_m26 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m27
wire [31:0] x_mon_if_arid_m27;
assign x_mon_if_arid_m27 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m28
wire [31:0] x_mon_if_arid_m28;
assign x_mon_if_arid_m28 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m29
wire [31:0] x_mon_if_arid_m29;
assign x_mon_if_arid_m29 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m30
wire [31:0] x_mon_if_arid_m30;
assign x_mon_if_arid_m30 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arid_m31
wire [31:0] x_mon_if_arid_m31;
assign x_mon_if_arid_m31 = test_DW_axi_x2p. arid_nu;

// Interface: x_mon_if Signal: arready_m0
wire x_mon_if_arready_m0;
assign x_mon_if_arready_m0 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m1
wire x_mon_if_arready_m1;
assign x_mon_if_arready_m1 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m2
wire x_mon_if_arready_m2;
assign x_mon_if_arready_m2 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m3
wire x_mon_if_arready_m3;
assign x_mon_if_arready_m3 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m4
wire x_mon_if_arready_m4;
assign x_mon_if_arready_m4 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m5
wire x_mon_if_arready_m5;
assign x_mon_if_arready_m5 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m6
wire x_mon_if_arready_m6;
assign x_mon_if_arready_m6 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m7
wire x_mon_if_arready_m7;
assign x_mon_if_arready_m7 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m8
wire x_mon_if_arready_m8;
assign x_mon_if_arready_m8 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m9
wire x_mon_if_arready_m9;
assign x_mon_if_arready_m9 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m10
wire x_mon_if_arready_m10;
assign x_mon_if_arready_m10 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m11
wire x_mon_if_arready_m11;
assign x_mon_if_arready_m11 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m12
wire x_mon_if_arready_m12;
assign x_mon_if_arready_m12 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m13
wire x_mon_if_arready_m13;
assign x_mon_if_arready_m13 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m14
wire x_mon_if_arready_m14;
assign x_mon_if_arready_m14 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m15
wire x_mon_if_arready_m15;
assign x_mon_if_arready_m15 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m16
wire x_mon_if_arready_m16;
assign x_mon_if_arready_m16 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m17
wire x_mon_if_arready_m17;
assign x_mon_if_arready_m17 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m18
wire x_mon_if_arready_m18;
assign x_mon_if_arready_m18 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m19
wire x_mon_if_arready_m19;
assign x_mon_if_arready_m19 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m20
wire x_mon_if_arready_m20;
assign x_mon_if_arready_m20 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m21
wire x_mon_if_arready_m21;
assign x_mon_if_arready_m21 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m22
wire x_mon_if_arready_m22;
assign x_mon_if_arready_m22 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m23
wire x_mon_if_arready_m23;
assign x_mon_if_arready_m23 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m24
wire x_mon_if_arready_m24;
assign x_mon_if_arready_m24 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m25
wire x_mon_if_arready_m25;
assign x_mon_if_arready_m25 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m26
wire x_mon_if_arready_m26;
assign x_mon_if_arready_m26 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m27
wire x_mon_if_arready_m27;
assign x_mon_if_arready_m27 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m28
wire x_mon_if_arready_m28;
assign x_mon_if_arready_m28 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m29
wire x_mon_if_arready_m29;
assign x_mon_if_arready_m29 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m30
wire x_mon_if_arready_m30;
assign x_mon_if_arready_m30 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: arready_m31
wire x_mon_if_arready_m31;
assign x_mon_if_arready_m31 = test_DW_axi_x2p. arready_nu;

// Interface: x_mon_if Signal: awvalid_m0
wire x_mon_if_awvalid_m0;
assign x_mon_if_awvalid_m0 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m1
wire x_mon_if_awvalid_m1;
assign x_mon_if_awvalid_m1 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m2
wire x_mon_if_awvalid_m2;
assign x_mon_if_awvalid_m2 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m3
wire x_mon_if_awvalid_m3;
assign x_mon_if_awvalid_m3 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m4
wire x_mon_if_awvalid_m4;
assign x_mon_if_awvalid_m4 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m5
wire x_mon_if_awvalid_m5;
assign x_mon_if_awvalid_m5 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m6
wire x_mon_if_awvalid_m6;
assign x_mon_if_awvalid_m6 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m7
wire x_mon_if_awvalid_m7;
assign x_mon_if_awvalid_m7 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m8
wire x_mon_if_awvalid_m8;
assign x_mon_if_awvalid_m8 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m9
wire x_mon_if_awvalid_m9;
assign x_mon_if_awvalid_m9 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m10
wire x_mon_if_awvalid_m10;
assign x_mon_if_awvalid_m10 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m11
wire x_mon_if_awvalid_m11;
assign x_mon_if_awvalid_m11 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m12
wire x_mon_if_awvalid_m12;
assign x_mon_if_awvalid_m12 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m13
wire x_mon_if_awvalid_m13;
assign x_mon_if_awvalid_m13 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m14
wire x_mon_if_awvalid_m14;
assign x_mon_if_awvalid_m14 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m15
wire x_mon_if_awvalid_m15;
assign x_mon_if_awvalid_m15 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m16
wire x_mon_if_awvalid_m16;
assign x_mon_if_awvalid_m16 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m17
wire x_mon_if_awvalid_m17;
assign x_mon_if_awvalid_m17 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m18
wire x_mon_if_awvalid_m18;
assign x_mon_if_awvalid_m18 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m19
wire x_mon_if_awvalid_m19;
assign x_mon_if_awvalid_m19 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m20
wire x_mon_if_awvalid_m20;
assign x_mon_if_awvalid_m20 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m21
wire x_mon_if_awvalid_m21;
assign x_mon_if_awvalid_m21 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m22
wire x_mon_if_awvalid_m22;
assign x_mon_if_awvalid_m22 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m23
wire x_mon_if_awvalid_m23;
assign x_mon_if_awvalid_m23 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m24
wire x_mon_if_awvalid_m24;
assign x_mon_if_awvalid_m24 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m25
wire x_mon_if_awvalid_m25;
assign x_mon_if_awvalid_m25 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m26
wire x_mon_if_awvalid_m26;
assign x_mon_if_awvalid_m26 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m27
wire x_mon_if_awvalid_m27;
assign x_mon_if_awvalid_m27 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m28
wire x_mon_if_awvalid_m28;
assign x_mon_if_awvalid_m28 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m29
wire x_mon_if_awvalid_m29;
assign x_mon_if_awvalid_m29 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m30
wire x_mon_if_awvalid_m30;
assign x_mon_if_awvalid_m30 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awvalid_m31
wire x_mon_if_awvalid_m31;
assign x_mon_if_awvalid_m31 = test_DW_axi_x2p. awvalid_nu;

// Interface: x_mon_if Signal: awaddr_m0
wire [63:0] x_mon_if_awaddr_m0;
assign x_mon_if_awaddr_m0 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m1
wire [63:0] x_mon_if_awaddr_m1;
assign x_mon_if_awaddr_m1 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m2
wire [63:0] x_mon_if_awaddr_m2;
assign x_mon_if_awaddr_m2 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m3
wire [63:0] x_mon_if_awaddr_m3;
assign x_mon_if_awaddr_m3 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m4
wire [63:0] x_mon_if_awaddr_m4;
assign x_mon_if_awaddr_m4 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m5
wire [63:0] x_mon_if_awaddr_m5;
assign x_mon_if_awaddr_m5 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m6
wire [63:0] x_mon_if_awaddr_m6;
assign x_mon_if_awaddr_m6 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m7
wire [63:0] x_mon_if_awaddr_m7;
assign x_mon_if_awaddr_m7 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m8
wire [63:0] x_mon_if_awaddr_m8;
assign x_mon_if_awaddr_m8 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m9
wire [63:0] x_mon_if_awaddr_m9;
assign x_mon_if_awaddr_m9 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m10
wire [63:0] x_mon_if_awaddr_m10;
assign x_mon_if_awaddr_m10 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m11
wire [63:0] x_mon_if_awaddr_m11;
assign x_mon_if_awaddr_m11 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m12
wire [63:0] x_mon_if_awaddr_m12;
assign x_mon_if_awaddr_m12 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m13
wire [63:0] x_mon_if_awaddr_m13;
assign x_mon_if_awaddr_m13 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m14
wire [63:0] x_mon_if_awaddr_m14;
assign x_mon_if_awaddr_m14 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m15
wire [63:0] x_mon_if_awaddr_m15;
assign x_mon_if_awaddr_m15 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m16
wire [63:0] x_mon_if_awaddr_m16;
assign x_mon_if_awaddr_m16 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m17
wire [63:0] x_mon_if_awaddr_m17;
assign x_mon_if_awaddr_m17 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m18
wire [63:0] x_mon_if_awaddr_m18;
assign x_mon_if_awaddr_m18 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m19
wire [63:0] x_mon_if_awaddr_m19;
assign x_mon_if_awaddr_m19 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m20
wire [63:0] x_mon_if_awaddr_m20;
assign x_mon_if_awaddr_m20 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m21
wire [63:0] x_mon_if_awaddr_m21;
assign x_mon_if_awaddr_m21 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m22
wire [63:0] x_mon_if_awaddr_m22;
assign x_mon_if_awaddr_m22 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m23
wire [63:0] x_mon_if_awaddr_m23;
assign x_mon_if_awaddr_m23 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m24
wire [63:0] x_mon_if_awaddr_m24;
assign x_mon_if_awaddr_m24 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m25
wire [63:0] x_mon_if_awaddr_m25;
assign x_mon_if_awaddr_m25 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m26
wire [63:0] x_mon_if_awaddr_m26;
assign x_mon_if_awaddr_m26 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m27
wire [63:0] x_mon_if_awaddr_m27;
assign x_mon_if_awaddr_m27 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m28
wire [63:0] x_mon_if_awaddr_m28;
assign x_mon_if_awaddr_m28 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m29
wire [63:0] x_mon_if_awaddr_m29;
assign x_mon_if_awaddr_m29 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m30
wire [63:0] x_mon_if_awaddr_m30;
assign x_mon_if_awaddr_m30 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awaddr_m31
wire [63:0] x_mon_if_awaddr_m31;
assign x_mon_if_awaddr_m31 = test_DW_axi_x2p. awaddr_nu;

// Interface: x_mon_if Signal: awlen_m0
wire [9:0] x_mon_if_awlen_m0;
assign x_mon_if_awlen_m0 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m1
wire [9:0] x_mon_if_awlen_m1;
assign x_mon_if_awlen_m1 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m2
wire [9:0] x_mon_if_awlen_m2;
assign x_mon_if_awlen_m2 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m3
wire [9:0] x_mon_if_awlen_m3;
assign x_mon_if_awlen_m3 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m4
wire [9:0] x_mon_if_awlen_m4;
assign x_mon_if_awlen_m4 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m5
wire [9:0] x_mon_if_awlen_m5;
assign x_mon_if_awlen_m5 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m6
wire [9:0] x_mon_if_awlen_m6;
assign x_mon_if_awlen_m6 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m7
wire [9:0] x_mon_if_awlen_m7;
assign x_mon_if_awlen_m7 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m8
wire [9:0] x_mon_if_awlen_m8;
assign x_mon_if_awlen_m8 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m9
wire [9:0] x_mon_if_awlen_m9;
assign x_mon_if_awlen_m9 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m10
wire [9:0] x_mon_if_awlen_m10;
assign x_mon_if_awlen_m10 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m11
wire [9:0] x_mon_if_awlen_m11;
assign x_mon_if_awlen_m11 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m12
wire [9:0] x_mon_if_awlen_m12;
assign x_mon_if_awlen_m12 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m13
wire [9:0] x_mon_if_awlen_m13;
assign x_mon_if_awlen_m13 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m14
wire [9:0] x_mon_if_awlen_m14;
assign x_mon_if_awlen_m14 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m15
wire [9:0] x_mon_if_awlen_m15;
assign x_mon_if_awlen_m15 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m16
wire [9:0] x_mon_if_awlen_m16;
assign x_mon_if_awlen_m16 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m17
wire [9:0] x_mon_if_awlen_m17;
assign x_mon_if_awlen_m17 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m18
wire [9:0] x_mon_if_awlen_m18;
assign x_mon_if_awlen_m18 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m19
wire [9:0] x_mon_if_awlen_m19;
assign x_mon_if_awlen_m19 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m20
wire [9:0] x_mon_if_awlen_m20;
assign x_mon_if_awlen_m20 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m21
wire [9:0] x_mon_if_awlen_m21;
assign x_mon_if_awlen_m21 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m22
wire [9:0] x_mon_if_awlen_m22;
assign x_mon_if_awlen_m22 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m23
wire [9:0] x_mon_if_awlen_m23;
assign x_mon_if_awlen_m23 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m24
wire [9:0] x_mon_if_awlen_m24;
assign x_mon_if_awlen_m24 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m25
wire [9:0] x_mon_if_awlen_m25;
assign x_mon_if_awlen_m25 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m26
wire [9:0] x_mon_if_awlen_m26;
assign x_mon_if_awlen_m26 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m27
wire [9:0] x_mon_if_awlen_m27;
assign x_mon_if_awlen_m27 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m28
wire [9:0] x_mon_if_awlen_m28;
assign x_mon_if_awlen_m28 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m29
wire [9:0] x_mon_if_awlen_m29;
assign x_mon_if_awlen_m29 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m30
wire [9:0] x_mon_if_awlen_m30;
assign x_mon_if_awlen_m30 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awlen_m31
wire [9:0] x_mon_if_awlen_m31;
assign x_mon_if_awlen_m31 = test_DW_axi_x2p. awlen_nu;

// Interface: x_mon_if Signal: awsize_m0
wire [2:0] x_mon_if_awsize_m0;
assign x_mon_if_awsize_m0 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m1
wire [2:0] x_mon_if_awsize_m1;
assign x_mon_if_awsize_m1 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m2
wire [2:0] x_mon_if_awsize_m2;
assign x_mon_if_awsize_m2 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m3
wire [2:0] x_mon_if_awsize_m3;
assign x_mon_if_awsize_m3 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m4
wire [2:0] x_mon_if_awsize_m4;
assign x_mon_if_awsize_m4 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m5
wire [2:0] x_mon_if_awsize_m5;
assign x_mon_if_awsize_m5 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m6
wire [2:0] x_mon_if_awsize_m6;
assign x_mon_if_awsize_m6 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m7
wire [2:0] x_mon_if_awsize_m7;
assign x_mon_if_awsize_m7 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m8
wire [2:0] x_mon_if_awsize_m8;
assign x_mon_if_awsize_m8 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m9
wire [2:0] x_mon_if_awsize_m9;
assign x_mon_if_awsize_m9 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m10
wire [2:0] x_mon_if_awsize_m10;
assign x_mon_if_awsize_m10 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m11
wire [2:0] x_mon_if_awsize_m11;
assign x_mon_if_awsize_m11 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m12
wire [2:0] x_mon_if_awsize_m12;
assign x_mon_if_awsize_m12 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m13
wire [2:0] x_mon_if_awsize_m13;
assign x_mon_if_awsize_m13 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m14
wire [2:0] x_mon_if_awsize_m14;
assign x_mon_if_awsize_m14 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m15
wire [2:0] x_mon_if_awsize_m15;
assign x_mon_if_awsize_m15 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m16
wire [2:0] x_mon_if_awsize_m16;
assign x_mon_if_awsize_m16 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m17
wire [2:0] x_mon_if_awsize_m17;
assign x_mon_if_awsize_m17 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m18
wire [2:0] x_mon_if_awsize_m18;
assign x_mon_if_awsize_m18 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m19
wire [2:0] x_mon_if_awsize_m19;
assign x_mon_if_awsize_m19 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m20
wire [2:0] x_mon_if_awsize_m20;
assign x_mon_if_awsize_m20 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m21
wire [2:0] x_mon_if_awsize_m21;
assign x_mon_if_awsize_m21 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m22
wire [2:0] x_mon_if_awsize_m22;
assign x_mon_if_awsize_m22 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m23
wire [2:0] x_mon_if_awsize_m23;
assign x_mon_if_awsize_m23 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m24
wire [2:0] x_mon_if_awsize_m24;
assign x_mon_if_awsize_m24 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m25
wire [2:0] x_mon_if_awsize_m25;
assign x_mon_if_awsize_m25 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m26
wire [2:0] x_mon_if_awsize_m26;
assign x_mon_if_awsize_m26 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m27
wire [2:0] x_mon_if_awsize_m27;
assign x_mon_if_awsize_m27 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m28
wire [2:0] x_mon_if_awsize_m28;
assign x_mon_if_awsize_m28 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m29
wire [2:0] x_mon_if_awsize_m29;
assign x_mon_if_awsize_m29 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m30
wire [2:0] x_mon_if_awsize_m30;
assign x_mon_if_awsize_m30 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awsize_m31
wire [2:0] x_mon_if_awsize_m31;
assign x_mon_if_awsize_m31 = test_DW_axi_x2p. awsize_nu;

// Interface: x_mon_if Signal: awburst_m0
wire [1:0] x_mon_if_awburst_m0;
assign x_mon_if_awburst_m0 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m1
wire [1:0] x_mon_if_awburst_m1;
assign x_mon_if_awburst_m1 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m2
wire [1:0] x_mon_if_awburst_m2;
assign x_mon_if_awburst_m2 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m3
wire [1:0] x_mon_if_awburst_m3;
assign x_mon_if_awburst_m3 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m4
wire [1:0] x_mon_if_awburst_m4;
assign x_mon_if_awburst_m4 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m5
wire [1:0] x_mon_if_awburst_m5;
assign x_mon_if_awburst_m5 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m6
wire [1:0] x_mon_if_awburst_m6;
assign x_mon_if_awburst_m6 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m7
wire [1:0] x_mon_if_awburst_m7;
assign x_mon_if_awburst_m7 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m8
wire [1:0] x_mon_if_awburst_m8;
assign x_mon_if_awburst_m8 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m9
wire [1:0] x_mon_if_awburst_m9;
assign x_mon_if_awburst_m9 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m10
wire [1:0] x_mon_if_awburst_m10;
assign x_mon_if_awburst_m10 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m11
wire [1:0] x_mon_if_awburst_m11;
assign x_mon_if_awburst_m11 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m12
wire [1:0] x_mon_if_awburst_m12;
assign x_mon_if_awburst_m12 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m13
wire [1:0] x_mon_if_awburst_m13;
assign x_mon_if_awburst_m13 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m14
wire [1:0] x_mon_if_awburst_m14;
assign x_mon_if_awburst_m14 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m15
wire [1:0] x_mon_if_awburst_m15;
assign x_mon_if_awburst_m15 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m16
wire [1:0] x_mon_if_awburst_m16;
assign x_mon_if_awburst_m16 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m17
wire [1:0] x_mon_if_awburst_m17;
assign x_mon_if_awburst_m17 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m18
wire [1:0] x_mon_if_awburst_m18;
assign x_mon_if_awburst_m18 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m19
wire [1:0] x_mon_if_awburst_m19;
assign x_mon_if_awburst_m19 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m20
wire [1:0] x_mon_if_awburst_m20;
assign x_mon_if_awburst_m20 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m21
wire [1:0] x_mon_if_awburst_m21;
assign x_mon_if_awburst_m21 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m22
wire [1:0] x_mon_if_awburst_m22;
assign x_mon_if_awburst_m22 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m23
wire [1:0] x_mon_if_awburst_m23;
assign x_mon_if_awburst_m23 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m24
wire [1:0] x_mon_if_awburst_m24;
assign x_mon_if_awburst_m24 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m25
wire [1:0] x_mon_if_awburst_m25;
assign x_mon_if_awburst_m25 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m26
wire [1:0] x_mon_if_awburst_m26;
assign x_mon_if_awburst_m26 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m27
wire [1:0] x_mon_if_awburst_m27;
assign x_mon_if_awburst_m27 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m28
wire [1:0] x_mon_if_awburst_m28;
assign x_mon_if_awburst_m28 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m29
wire [1:0] x_mon_if_awburst_m29;
assign x_mon_if_awburst_m29 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m30
wire [1:0] x_mon_if_awburst_m30;
assign x_mon_if_awburst_m30 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awburst_m31
wire [1:0] x_mon_if_awburst_m31;
assign x_mon_if_awburst_m31 = test_DW_axi_x2p. awburst_nu;

// Interface: x_mon_if Signal: awlock_m0
wire [1:0] x_mon_if_awlock_m0;
assign x_mon_if_awlock_m0 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m1
wire [1:0] x_mon_if_awlock_m1;
assign x_mon_if_awlock_m1 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m2
wire [1:0] x_mon_if_awlock_m2;
assign x_mon_if_awlock_m2 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m3
wire [1:0] x_mon_if_awlock_m3;
assign x_mon_if_awlock_m3 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m4
wire [1:0] x_mon_if_awlock_m4;
assign x_mon_if_awlock_m4 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m5
wire [1:0] x_mon_if_awlock_m5;
assign x_mon_if_awlock_m5 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m6
wire [1:0] x_mon_if_awlock_m6;
assign x_mon_if_awlock_m6 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m7
wire [1:0] x_mon_if_awlock_m7;
assign x_mon_if_awlock_m7 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m8
wire [1:0] x_mon_if_awlock_m8;
assign x_mon_if_awlock_m8 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m9
wire [1:0] x_mon_if_awlock_m9;
assign x_mon_if_awlock_m9 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m10
wire [1:0] x_mon_if_awlock_m10;
assign x_mon_if_awlock_m10 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m11
wire [1:0] x_mon_if_awlock_m11;
assign x_mon_if_awlock_m11 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m12
wire [1:0] x_mon_if_awlock_m12;
assign x_mon_if_awlock_m12 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m13
wire [1:0] x_mon_if_awlock_m13;
assign x_mon_if_awlock_m13 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m14
wire [1:0] x_mon_if_awlock_m14;
assign x_mon_if_awlock_m14 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m15
wire [1:0] x_mon_if_awlock_m15;
assign x_mon_if_awlock_m15 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m16
wire [1:0] x_mon_if_awlock_m16;
assign x_mon_if_awlock_m16 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m17
wire [1:0] x_mon_if_awlock_m17;
assign x_mon_if_awlock_m17 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m18
wire [1:0] x_mon_if_awlock_m18;
assign x_mon_if_awlock_m18 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m19
wire [1:0] x_mon_if_awlock_m19;
assign x_mon_if_awlock_m19 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m20
wire [1:0] x_mon_if_awlock_m20;
assign x_mon_if_awlock_m20 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m21
wire [1:0] x_mon_if_awlock_m21;
assign x_mon_if_awlock_m21 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m22
wire [1:0] x_mon_if_awlock_m22;
assign x_mon_if_awlock_m22 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m23
wire [1:0] x_mon_if_awlock_m23;
assign x_mon_if_awlock_m23 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m24
wire [1:0] x_mon_if_awlock_m24;
assign x_mon_if_awlock_m24 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m25
wire [1:0] x_mon_if_awlock_m25;
assign x_mon_if_awlock_m25 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m26
wire [1:0] x_mon_if_awlock_m26;
assign x_mon_if_awlock_m26 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m27
wire [1:0] x_mon_if_awlock_m27;
assign x_mon_if_awlock_m27 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m28
wire [1:0] x_mon_if_awlock_m28;
assign x_mon_if_awlock_m28 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m29
wire [1:0] x_mon_if_awlock_m29;
assign x_mon_if_awlock_m29 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m30
wire [1:0] x_mon_if_awlock_m30;
assign x_mon_if_awlock_m30 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awlock_m31
wire [1:0] x_mon_if_awlock_m31;
assign x_mon_if_awlock_m31 = test_DW_axi_x2p. awlock_nu;

// Interface: x_mon_if Signal: awcache_m0
wire [3:0] x_mon_if_awcache_m0;
assign x_mon_if_awcache_m0 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m1
wire [3:0] x_mon_if_awcache_m1;
assign x_mon_if_awcache_m1 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m2
wire [3:0] x_mon_if_awcache_m2;
assign x_mon_if_awcache_m2 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m3
wire [3:0] x_mon_if_awcache_m3;
assign x_mon_if_awcache_m3 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m4
wire [3:0] x_mon_if_awcache_m4;
assign x_mon_if_awcache_m4 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m5
wire [3:0] x_mon_if_awcache_m5;
assign x_mon_if_awcache_m5 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m6
wire [3:0] x_mon_if_awcache_m6;
assign x_mon_if_awcache_m6 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m7
wire [3:0] x_mon_if_awcache_m7;
assign x_mon_if_awcache_m7 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m8
wire [3:0] x_mon_if_awcache_m8;
assign x_mon_if_awcache_m8 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m9
wire [3:0] x_mon_if_awcache_m9;
assign x_mon_if_awcache_m9 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m10
wire [3:0] x_mon_if_awcache_m10;
assign x_mon_if_awcache_m10 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m11
wire [3:0] x_mon_if_awcache_m11;
assign x_mon_if_awcache_m11 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m12
wire [3:0] x_mon_if_awcache_m12;
assign x_mon_if_awcache_m12 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m13
wire [3:0] x_mon_if_awcache_m13;
assign x_mon_if_awcache_m13 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m14
wire [3:0] x_mon_if_awcache_m14;
assign x_mon_if_awcache_m14 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m15
wire [3:0] x_mon_if_awcache_m15;
assign x_mon_if_awcache_m15 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m16
wire [3:0] x_mon_if_awcache_m16;
assign x_mon_if_awcache_m16 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m17
wire [3:0] x_mon_if_awcache_m17;
assign x_mon_if_awcache_m17 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m18
wire [3:0] x_mon_if_awcache_m18;
assign x_mon_if_awcache_m18 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m19
wire [3:0] x_mon_if_awcache_m19;
assign x_mon_if_awcache_m19 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m20
wire [3:0] x_mon_if_awcache_m20;
assign x_mon_if_awcache_m20 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m21
wire [3:0] x_mon_if_awcache_m21;
assign x_mon_if_awcache_m21 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m22
wire [3:0] x_mon_if_awcache_m22;
assign x_mon_if_awcache_m22 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m23
wire [3:0] x_mon_if_awcache_m23;
assign x_mon_if_awcache_m23 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m24
wire [3:0] x_mon_if_awcache_m24;
assign x_mon_if_awcache_m24 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m25
wire [3:0] x_mon_if_awcache_m25;
assign x_mon_if_awcache_m25 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m26
wire [3:0] x_mon_if_awcache_m26;
assign x_mon_if_awcache_m26 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m27
wire [3:0] x_mon_if_awcache_m27;
assign x_mon_if_awcache_m27 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m28
wire [3:0] x_mon_if_awcache_m28;
assign x_mon_if_awcache_m28 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m29
wire [3:0] x_mon_if_awcache_m29;
assign x_mon_if_awcache_m29 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m30
wire [3:0] x_mon_if_awcache_m30;
assign x_mon_if_awcache_m30 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awcache_m31
wire [3:0] x_mon_if_awcache_m31;
assign x_mon_if_awcache_m31 = test_DW_axi_x2p. awcache_nu;

// Interface: x_mon_if Signal: awprot_m0
wire [2:0] x_mon_if_awprot_m0;
assign x_mon_if_awprot_m0 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m1
wire [2:0] x_mon_if_awprot_m1;
assign x_mon_if_awprot_m1 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m2
wire [2:0] x_mon_if_awprot_m2;
assign x_mon_if_awprot_m2 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m3
wire [2:0] x_mon_if_awprot_m3;
assign x_mon_if_awprot_m3 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m4
wire [2:0] x_mon_if_awprot_m4;
assign x_mon_if_awprot_m4 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m5
wire [2:0] x_mon_if_awprot_m5;
assign x_mon_if_awprot_m5 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m6
wire [2:0] x_mon_if_awprot_m6;
assign x_mon_if_awprot_m6 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m7
wire [2:0] x_mon_if_awprot_m7;
assign x_mon_if_awprot_m7 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m8
wire [2:0] x_mon_if_awprot_m8;
assign x_mon_if_awprot_m8 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m9
wire [2:0] x_mon_if_awprot_m9;
assign x_mon_if_awprot_m9 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m10
wire [2:0] x_mon_if_awprot_m10;
assign x_mon_if_awprot_m10 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m11
wire [2:0] x_mon_if_awprot_m11;
assign x_mon_if_awprot_m11 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m12
wire [2:0] x_mon_if_awprot_m12;
assign x_mon_if_awprot_m12 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m13
wire [2:0] x_mon_if_awprot_m13;
assign x_mon_if_awprot_m13 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m14
wire [2:0] x_mon_if_awprot_m14;
assign x_mon_if_awprot_m14 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m15
wire [2:0] x_mon_if_awprot_m15;
assign x_mon_if_awprot_m15 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m16
wire [2:0] x_mon_if_awprot_m16;
assign x_mon_if_awprot_m16 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m17
wire [2:0] x_mon_if_awprot_m17;
assign x_mon_if_awprot_m17 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m18
wire [2:0] x_mon_if_awprot_m18;
assign x_mon_if_awprot_m18 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m19
wire [2:0] x_mon_if_awprot_m19;
assign x_mon_if_awprot_m19 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m20
wire [2:0] x_mon_if_awprot_m20;
assign x_mon_if_awprot_m20 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m21
wire [2:0] x_mon_if_awprot_m21;
assign x_mon_if_awprot_m21 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m22
wire [2:0] x_mon_if_awprot_m22;
assign x_mon_if_awprot_m22 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m23
wire [2:0] x_mon_if_awprot_m23;
assign x_mon_if_awprot_m23 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m24
wire [2:0] x_mon_if_awprot_m24;
assign x_mon_if_awprot_m24 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m25
wire [2:0] x_mon_if_awprot_m25;
assign x_mon_if_awprot_m25 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m26
wire [2:0] x_mon_if_awprot_m26;
assign x_mon_if_awprot_m26 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m27
wire [2:0] x_mon_if_awprot_m27;
assign x_mon_if_awprot_m27 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m28
wire [2:0] x_mon_if_awprot_m28;
assign x_mon_if_awprot_m28 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m29
wire [2:0] x_mon_if_awprot_m29;
assign x_mon_if_awprot_m29 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m30
wire [2:0] x_mon_if_awprot_m30;
assign x_mon_if_awprot_m30 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awprot_m31
wire [2:0] x_mon_if_awprot_m31;
assign x_mon_if_awprot_m31 = test_DW_axi_x2p. awprot_nu;

// Interface: x_mon_if Signal: awid_m0
wire [31:0] x_mon_if_awid_m0;
assign x_mon_if_awid_m0 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m1
wire [31:0] x_mon_if_awid_m1;
assign x_mon_if_awid_m1 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m2
wire [31:0] x_mon_if_awid_m2;
assign x_mon_if_awid_m2 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m3
wire [31:0] x_mon_if_awid_m3;
assign x_mon_if_awid_m3 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m4
wire [31:0] x_mon_if_awid_m4;
assign x_mon_if_awid_m4 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m5
wire [31:0] x_mon_if_awid_m5;
assign x_mon_if_awid_m5 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m6
wire [31:0] x_mon_if_awid_m6;
assign x_mon_if_awid_m6 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m7
wire [31:0] x_mon_if_awid_m7;
assign x_mon_if_awid_m7 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m8
wire [31:0] x_mon_if_awid_m8;
assign x_mon_if_awid_m8 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m9
wire [31:0] x_mon_if_awid_m9;
assign x_mon_if_awid_m9 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m10
wire [31:0] x_mon_if_awid_m10;
assign x_mon_if_awid_m10 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m11
wire [31:0] x_mon_if_awid_m11;
assign x_mon_if_awid_m11 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m12
wire [31:0] x_mon_if_awid_m12;
assign x_mon_if_awid_m12 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m13
wire [31:0] x_mon_if_awid_m13;
assign x_mon_if_awid_m13 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m14
wire [31:0] x_mon_if_awid_m14;
assign x_mon_if_awid_m14 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m15
wire [31:0] x_mon_if_awid_m15;
assign x_mon_if_awid_m15 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m16
wire [31:0] x_mon_if_awid_m16;
assign x_mon_if_awid_m16 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m17
wire [31:0] x_mon_if_awid_m17;
assign x_mon_if_awid_m17 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m18
wire [31:0] x_mon_if_awid_m18;
assign x_mon_if_awid_m18 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m19
wire [31:0] x_mon_if_awid_m19;
assign x_mon_if_awid_m19 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m20
wire [31:0] x_mon_if_awid_m20;
assign x_mon_if_awid_m20 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m21
wire [31:0] x_mon_if_awid_m21;
assign x_mon_if_awid_m21 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m22
wire [31:0] x_mon_if_awid_m22;
assign x_mon_if_awid_m22 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m23
wire [31:0] x_mon_if_awid_m23;
assign x_mon_if_awid_m23 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m24
wire [31:0] x_mon_if_awid_m24;
assign x_mon_if_awid_m24 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m25
wire [31:0] x_mon_if_awid_m25;
assign x_mon_if_awid_m25 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m26
wire [31:0] x_mon_if_awid_m26;
assign x_mon_if_awid_m26 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m27
wire [31:0] x_mon_if_awid_m27;
assign x_mon_if_awid_m27 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m28
wire [31:0] x_mon_if_awid_m28;
assign x_mon_if_awid_m28 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m29
wire [31:0] x_mon_if_awid_m29;
assign x_mon_if_awid_m29 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m30
wire [31:0] x_mon_if_awid_m30;
assign x_mon_if_awid_m30 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awid_m31
wire [31:0] x_mon_if_awid_m31;
assign x_mon_if_awid_m31 = test_DW_axi_x2p. awid_nu;

// Interface: x_mon_if Signal: awready_m0
wire x_mon_if_awready_m0;
assign x_mon_if_awready_m0 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m1
wire x_mon_if_awready_m1;
assign x_mon_if_awready_m1 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m2
wire x_mon_if_awready_m2;
assign x_mon_if_awready_m2 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m3
wire x_mon_if_awready_m3;
assign x_mon_if_awready_m3 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m4
wire x_mon_if_awready_m4;
assign x_mon_if_awready_m4 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m5
wire x_mon_if_awready_m5;
assign x_mon_if_awready_m5 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m6
wire x_mon_if_awready_m6;
assign x_mon_if_awready_m6 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m7
wire x_mon_if_awready_m7;
assign x_mon_if_awready_m7 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m8
wire x_mon_if_awready_m8;
assign x_mon_if_awready_m8 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m9
wire x_mon_if_awready_m9;
assign x_mon_if_awready_m9 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m10
wire x_mon_if_awready_m10;
assign x_mon_if_awready_m10 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m11
wire x_mon_if_awready_m11;
assign x_mon_if_awready_m11 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m12
wire x_mon_if_awready_m12;
assign x_mon_if_awready_m12 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m13
wire x_mon_if_awready_m13;
assign x_mon_if_awready_m13 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m14
wire x_mon_if_awready_m14;
assign x_mon_if_awready_m14 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m15
wire x_mon_if_awready_m15;
assign x_mon_if_awready_m15 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m16
wire x_mon_if_awready_m16;
assign x_mon_if_awready_m16 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m17
wire x_mon_if_awready_m17;
assign x_mon_if_awready_m17 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m18
wire x_mon_if_awready_m18;
assign x_mon_if_awready_m18 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m19
wire x_mon_if_awready_m19;
assign x_mon_if_awready_m19 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m20
wire x_mon_if_awready_m20;
assign x_mon_if_awready_m20 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m21
wire x_mon_if_awready_m21;
assign x_mon_if_awready_m21 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m22
wire x_mon_if_awready_m22;
assign x_mon_if_awready_m22 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m23
wire x_mon_if_awready_m23;
assign x_mon_if_awready_m23 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m24
wire x_mon_if_awready_m24;
assign x_mon_if_awready_m24 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m25
wire x_mon_if_awready_m25;
assign x_mon_if_awready_m25 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m26
wire x_mon_if_awready_m26;
assign x_mon_if_awready_m26 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m27
wire x_mon_if_awready_m27;
assign x_mon_if_awready_m27 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m28
wire x_mon_if_awready_m28;
assign x_mon_if_awready_m28 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m29
wire x_mon_if_awready_m29;
assign x_mon_if_awready_m29 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m30
wire x_mon_if_awready_m30;
assign x_mon_if_awready_m30 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: awready_m31
wire x_mon_if_awready_m31;
assign x_mon_if_awready_m31 = test_DW_axi_x2p. awready_nu;

// Interface: x_mon_if Signal: rvalid_m0
wire x_mon_if_rvalid_m0;
assign x_mon_if_rvalid_m0 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m1
wire x_mon_if_rvalid_m1;
assign x_mon_if_rvalid_m1 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m2
wire x_mon_if_rvalid_m2;
assign x_mon_if_rvalid_m2 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m3
wire x_mon_if_rvalid_m3;
assign x_mon_if_rvalid_m3 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m4
wire x_mon_if_rvalid_m4;
assign x_mon_if_rvalid_m4 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m5
wire x_mon_if_rvalid_m5;
assign x_mon_if_rvalid_m5 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m6
wire x_mon_if_rvalid_m6;
assign x_mon_if_rvalid_m6 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m7
wire x_mon_if_rvalid_m7;
assign x_mon_if_rvalid_m7 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m8
wire x_mon_if_rvalid_m8;
assign x_mon_if_rvalid_m8 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m9
wire x_mon_if_rvalid_m9;
assign x_mon_if_rvalid_m9 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m10
wire x_mon_if_rvalid_m10;
assign x_mon_if_rvalid_m10 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m11
wire x_mon_if_rvalid_m11;
assign x_mon_if_rvalid_m11 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m12
wire x_mon_if_rvalid_m12;
assign x_mon_if_rvalid_m12 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m13
wire x_mon_if_rvalid_m13;
assign x_mon_if_rvalid_m13 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m14
wire x_mon_if_rvalid_m14;
assign x_mon_if_rvalid_m14 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m15
wire x_mon_if_rvalid_m15;
assign x_mon_if_rvalid_m15 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m16
wire x_mon_if_rvalid_m16;
assign x_mon_if_rvalid_m16 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m17
wire x_mon_if_rvalid_m17;
assign x_mon_if_rvalid_m17 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m18
wire x_mon_if_rvalid_m18;
assign x_mon_if_rvalid_m18 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m19
wire x_mon_if_rvalid_m19;
assign x_mon_if_rvalid_m19 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m20
wire x_mon_if_rvalid_m20;
assign x_mon_if_rvalid_m20 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m21
wire x_mon_if_rvalid_m21;
assign x_mon_if_rvalid_m21 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m22
wire x_mon_if_rvalid_m22;
assign x_mon_if_rvalid_m22 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m23
wire x_mon_if_rvalid_m23;
assign x_mon_if_rvalid_m23 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m24
wire x_mon_if_rvalid_m24;
assign x_mon_if_rvalid_m24 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m25
wire x_mon_if_rvalid_m25;
assign x_mon_if_rvalid_m25 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m26
wire x_mon_if_rvalid_m26;
assign x_mon_if_rvalid_m26 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m27
wire x_mon_if_rvalid_m27;
assign x_mon_if_rvalid_m27 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m28
wire x_mon_if_rvalid_m28;
assign x_mon_if_rvalid_m28 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m29
wire x_mon_if_rvalid_m29;
assign x_mon_if_rvalid_m29 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m30
wire x_mon_if_rvalid_m30;
assign x_mon_if_rvalid_m30 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rvalid_m31
wire x_mon_if_rvalid_m31;
assign x_mon_if_rvalid_m31 = test_DW_axi_x2p. rvalid_nu;

// Interface: x_mon_if Signal: rlast_m0
wire x_mon_if_rlast_m0;
assign x_mon_if_rlast_m0 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m1
wire x_mon_if_rlast_m1;
assign x_mon_if_rlast_m1 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m2
wire x_mon_if_rlast_m2;
assign x_mon_if_rlast_m2 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m3
wire x_mon_if_rlast_m3;
assign x_mon_if_rlast_m3 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m4
wire x_mon_if_rlast_m4;
assign x_mon_if_rlast_m4 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m5
wire x_mon_if_rlast_m5;
assign x_mon_if_rlast_m5 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m6
wire x_mon_if_rlast_m6;
assign x_mon_if_rlast_m6 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m7
wire x_mon_if_rlast_m7;
assign x_mon_if_rlast_m7 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m8
wire x_mon_if_rlast_m8;
assign x_mon_if_rlast_m8 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m9
wire x_mon_if_rlast_m9;
assign x_mon_if_rlast_m9 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m10
wire x_mon_if_rlast_m10;
assign x_mon_if_rlast_m10 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m11
wire x_mon_if_rlast_m11;
assign x_mon_if_rlast_m11 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m12
wire x_mon_if_rlast_m12;
assign x_mon_if_rlast_m12 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m13
wire x_mon_if_rlast_m13;
assign x_mon_if_rlast_m13 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m14
wire x_mon_if_rlast_m14;
assign x_mon_if_rlast_m14 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m15
wire x_mon_if_rlast_m15;
assign x_mon_if_rlast_m15 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m16
wire x_mon_if_rlast_m16;
assign x_mon_if_rlast_m16 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m17
wire x_mon_if_rlast_m17;
assign x_mon_if_rlast_m17 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m18
wire x_mon_if_rlast_m18;
assign x_mon_if_rlast_m18 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m19
wire x_mon_if_rlast_m19;
assign x_mon_if_rlast_m19 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m20
wire x_mon_if_rlast_m20;
assign x_mon_if_rlast_m20 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m21
wire x_mon_if_rlast_m21;
assign x_mon_if_rlast_m21 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m22
wire x_mon_if_rlast_m22;
assign x_mon_if_rlast_m22 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m23
wire x_mon_if_rlast_m23;
assign x_mon_if_rlast_m23 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m24
wire x_mon_if_rlast_m24;
assign x_mon_if_rlast_m24 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m25
wire x_mon_if_rlast_m25;
assign x_mon_if_rlast_m25 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m26
wire x_mon_if_rlast_m26;
assign x_mon_if_rlast_m26 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m27
wire x_mon_if_rlast_m27;
assign x_mon_if_rlast_m27 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m28
wire x_mon_if_rlast_m28;
assign x_mon_if_rlast_m28 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m29
wire x_mon_if_rlast_m29;
assign x_mon_if_rlast_m29 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m30
wire x_mon_if_rlast_m30;
assign x_mon_if_rlast_m30 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rlast_m31
wire x_mon_if_rlast_m31;
assign x_mon_if_rlast_m31 = test_DW_axi_x2p. rlast_nu;

// Interface: x_mon_if Signal: rdata_m0
wire [1023:0] x_mon_if_rdata_m0;
assign x_mon_if_rdata_m0 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m1
wire [1023:0] x_mon_if_rdata_m1;
assign x_mon_if_rdata_m1 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m2
wire [1023:0] x_mon_if_rdata_m2;
assign x_mon_if_rdata_m2 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m3
wire [1023:0] x_mon_if_rdata_m3;
assign x_mon_if_rdata_m3 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m4
wire [1023:0] x_mon_if_rdata_m4;
assign x_mon_if_rdata_m4 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m5
wire [1023:0] x_mon_if_rdata_m5;
assign x_mon_if_rdata_m5 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m6
wire [1023:0] x_mon_if_rdata_m6;
assign x_mon_if_rdata_m6 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m7
wire [1023:0] x_mon_if_rdata_m7;
assign x_mon_if_rdata_m7 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m8
wire [1023:0] x_mon_if_rdata_m8;
assign x_mon_if_rdata_m8 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m9
wire [1023:0] x_mon_if_rdata_m9;
assign x_mon_if_rdata_m9 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m10
wire [1023:0] x_mon_if_rdata_m10;
assign x_mon_if_rdata_m10 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m11
wire [1023:0] x_mon_if_rdata_m11;
assign x_mon_if_rdata_m11 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m12
wire [1023:0] x_mon_if_rdata_m12;
assign x_mon_if_rdata_m12 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m13
wire [1023:0] x_mon_if_rdata_m13;
assign x_mon_if_rdata_m13 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m14
wire [1023:0] x_mon_if_rdata_m14;
assign x_mon_if_rdata_m14 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m15
wire [1023:0] x_mon_if_rdata_m15;
assign x_mon_if_rdata_m15 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m16
wire [1023:0] x_mon_if_rdata_m16;
assign x_mon_if_rdata_m16 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m17
wire [1023:0] x_mon_if_rdata_m17;
assign x_mon_if_rdata_m17 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m18
wire [1023:0] x_mon_if_rdata_m18;
assign x_mon_if_rdata_m18 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m19
wire [1023:0] x_mon_if_rdata_m19;
assign x_mon_if_rdata_m19 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m20
wire [1023:0] x_mon_if_rdata_m20;
assign x_mon_if_rdata_m20 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m21
wire [1023:0] x_mon_if_rdata_m21;
assign x_mon_if_rdata_m21 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m22
wire [1023:0] x_mon_if_rdata_m22;
assign x_mon_if_rdata_m22 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m23
wire [1023:0] x_mon_if_rdata_m23;
assign x_mon_if_rdata_m23 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m24
wire [1023:0] x_mon_if_rdata_m24;
assign x_mon_if_rdata_m24 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m25
wire [1023:0] x_mon_if_rdata_m25;
assign x_mon_if_rdata_m25 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m26
wire [1023:0] x_mon_if_rdata_m26;
assign x_mon_if_rdata_m26 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m27
wire [1023:0] x_mon_if_rdata_m27;
assign x_mon_if_rdata_m27 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m28
wire [1023:0] x_mon_if_rdata_m28;
assign x_mon_if_rdata_m28 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m29
wire [1023:0] x_mon_if_rdata_m29;
assign x_mon_if_rdata_m29 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m30
wire [1023:0] x_mon_if_rdata_m30;
assign x_mon_if_rdata_m30 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rdata_m31
wire [1023:0] x_mon_if_rdata_m31;
assign x_mon_if_rdata_m31 = test_DW_axi_x2p. rdata_nu;

// Interface: x_mon_if Signal: rresp_m0
wire [1:0] x_mon_if_rresp_m0;
assign x_mon_if_rresp_m0 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m1
wire [1:0] x_mon_if_rresp_m1;
assign x_mon_if_rresp_m1 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m2
wire [1:0] x_mon_if_rresp_m2;
assign x_mon_if_rresp_m2 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m3
wire [1:0] x_mon_if_rresp_m3;
assign x_mon_if_rresp_m3 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m4
wire [1:0] x_mon_if_rresp_m4;
assign x_mon_if_rresp_m4 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m5
wire [1:0] x_mon_if_rresp_m5;
assign x_mon_if_rresp_m5 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m6
wire [1:0] x_mon_if_rresp_m6;
assign x_mon_if_rresp_m6 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m7
wire [1:0] x_mon_if_rresp_m7;
assign x_mon_if_rresp_m7 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m8
wire [1:0] x_mon_if_rresp_m8;
assign x_mon_if_rresp_m8 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m9
wire [1:0] x_mon_if_rresp_m9;
assign x_mon_if_rresp_m9 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m10
wire [1:0] x_mon_if_rresp_m10;
assign x_mon_if_rresp_m10 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m11
wire [1:0] x_mon_if_rresp_m11;
assign x_mon_if_rresp_m11 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m12
wire [1:0] x_mon_if_rresp_m12;
assign x_mon_if_rresp_m12 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m13
wire [1:0] x_mon_if_rresp_m13;
assign x_mon_if_rresp_m13 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m14
wire [1:0] x_mon_if_rresp_m14;
assign x_mon_if_rresp_m14 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m15
wire [1:0] x_mon_if_rresp_m15;
assign x_mon_if_rresp_m15 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m16
wire [1:0] x_mon_if_rresp_m16;
assign x_mon_if_rresp_m16 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m17
wire [1:0] x_mon_if_rresp_m17;
assign x_mon_if_rresp_m17 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m18
wire [1:0] x_mon_if_rresp_m18;
assign x_mon_if_rresp_m18 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m19
wire [1:0] x_mon_if_rresp_m19;
assign x_mon_if_rresp_m19 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m20
wire [1:0] x_mon_if_rresp_m20;
assign x_mon_if_rresp_m20 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m21
wire [1:0] x_mon_if_rresp_m21;
assign x_mon_if_rresp_m21 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m22
wire [1:0] x_mon_if_rresp_m22;
assign x_mon_if_rresp_m22 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m23
wire [1:0] x_mon_if_rresp_m23;
assign x_mon_if_rresp_m23 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m24
wire [1:0] x_mon_if_rresp_m24;
assign x_mon_if_rresp_m24 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m25
wire [1:0] x_mon_if_rresp_m25;
assign x_mon_if_rresp_m25 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m26
wire [1:0] x_mon_if_rresp_m26;
assign x_mon_if_rresp_m26 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m27
wire [1:0] x_mon_if_rresp_m27;
assign x_mon_if_rresp_m27 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m28
wire [1:0] x_mon_if_rresp_m28;
assign x_mon_if_rresp_m28 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m29
wire [1:0] x_mon_if_rresp_m29;
assign x_mon_if_rresp_m29 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m30
wire [1:0] x_mon_if_rresp_m30;
assign x_mon_if_rresp_m30 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rresp_m31
wire [1:0] x_mon_if_rresp_m31;
assign x_mon_if_rresp_m31 = test_DW_axi_x2p. rresp_nu;

// Interface: x_mon_if Signal: rid_m0
wire [31:0] x_mon_if_rid_m0;
assign x_mon_if_rid_m0 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m1
wire [31:0] x_mon_if_rid_m1;
assign x_mon_if_rid_m1 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m2
wire [31:0] x_mon_if_rid_m2;
assign x_mon_if_rid_m2 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m3
wire [31:0] x_mon_if_rid_m3;
assign x_mon_if_rid_m3 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m4
wire [31:0] x_mon_if_rid_m4;
assign x_mon_if_rid_m4 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m5
wire [31:0] x_mon_if_rid_m5;
assign x_mon_if_rid_m5 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m6
wire [31:0] x_mon_if_rid_m6;
assign x_mon_if_rid_m6 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m7
wire [31:0] x_mon_if_rid_m7;
assign x_mon_if_rid_m7 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m8
wire [31:0] x_mon_if_rid_m8;
assign x_mon_if_rid_m8 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m9
wire [31:0] x_mon_if_rid_m9;
assign x_mon_if_rid_m9 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m10
wire [31:0] x_mon_if_rid_m10;
assign x_mon_if_rid_m10 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m11
wire [31:0] x_mon_if_rid_m11;
assign x_mon_if_rid_m11 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m12
wire [31:0] x_mon_if_rid_m12;
assign x_mon_if_rid_m12 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m13
wire [31:0] x_mon_if_rid_m13;
assign x_mon_if_rid_m13 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m14
wire [31:0] x_mon_if_rid_m14;
assign x_mon_if_rid_m14 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m15
wire [31:0] x_mon_if_rid_m15;
assign x_mon_if_rid_m15 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m16
wire [31:0] x_mon_if_rid_m16;
assign x_mon_if_rid_m16 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m17
wire [31:0] x_mon_if_rid_m17;
assign x_mon_if_rid_m17 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m18
wire [31:0] x_mon_if_rid_m18;
assign x_mon_if_rid_m18 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m19
wire [31:0] x_mon_if_rid_m19;
assign x_mon_if_rid_m19 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m20
wire [31:0] x_mon_if_rid_m20;
assign x_mon_if_rid_m20 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m21
wire [31:0] x_mon_if_rid_m21;
assign x_mon_if_rid_m21 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m22
wire [31:0] x_mon_if_rid_m22;
assign x_mon_if_rid_m22 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m23
wire [31:0] x_mon_if_rid_m23;
assign x_mon_if_rid_m23 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m24
wire [31:0] x_mon_if_rid_m24;
assign x_mon_if_rid_m24 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m25
wire [31:0] x_mon_if_rid_m25;
assign x_mon_if_rid_m25 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m26
wire [31:0] x_mon_if_rid_m26;
assign x_mon_if_rid_m26 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m27
wire [31:0] x_mon_if_rid_m27;
assign x_mon_if_rid_m27 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m28
wire [31:0] x_mon_if_rid_m28;
assign x_mon_if_rid_m28 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m29
wire [31:0] x_mon_if_rid_m29;
assign x_mon_if_rid_m29 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m30
wire [31:0] x_mon_if_rid_m30;
assign x_mon_if_rid_m30 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rid_m31
wire [31:0] x_mon_if_rid_m31;
assign x_mon_if_rid_m31 = test_DW_axi_x2p. rid_nu;

// Interface: x_mon_if Signal: rready_m0
wire x_mon_if_rready_m0;
assign x_mon_if_rready_m0 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m1
wire x_mon_if_rready_m1;
assign x_mon_if_rready_m1 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m2
wire x_mon_if_rready_m2;
assign x_mon_if_rready_m2 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m3
wire x_mon_if_rready_m3;
assign x_mon_if_rready_m3 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m4
wire x_mon_if_rready_m4;
assign x_mon_if_rready_m4 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m5
wire x_mon_if_rready_m5;
assign x_mon_if_rready_m5 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m6
wire x_mon_if_rready_m6;
assign x_mon_if_rready_m6 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m7
wire x_mon_if_rready_m7;
assign x_mon_if_rready_m7 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m8
wire x_mon_if_rready_m8;
assign x_mon_if_rready_m8 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m9
wire x_mon_if_rready_m9;
assign x_mon_if_rready_m9 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m10
wire x_mon_if_rready_m10;
assign x_mon_if_rready_m10 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m11
wire x_mon_if_rready_m11;
assign x_mon_if_rready_m11 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m12
wire x_mon_if_rready_m12;
assign x_mon_if_rready_m12 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m13
wire x_mon_if_rready_m13;
assign x_mon_if_rready_m13 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m14
wire x_mon_if_rready_m14;
assign x_mon_if_rready_m14 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m15
wire x_mon_if_rready_m15;
assign x_mon_if_rready_m15 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m16
wire x_mon_if_rready_m16;
assign x_mon_if_rready_m16 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m17
wire x_mon_if_rready_m17;
assign x_mon_if_rready_m17 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m18
wire x_mon_if_rready_m18;
assign x_mon_if_rready_m18 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m19
wire x_mon_if_rready_m19;
assign x_mon_if_rready_m19 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m20
wire x_mon_if_rready_m20;
assign x_mon_if_rready_m20 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m21
wire x_mon_if_rready_m21;
assign x_mon_if_rready_m21 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m22
wire x_mon_if_rready_m22;
assign x_mon_if_rready_m22 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m23
wire x_mon_if_rready_m23;
assign x_mon_if_rready_m23 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m24
wire x_mon_if_rready_m24;
assign x_mon_if_rready_m24 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m25
wire x_mon_if_rready_m25;
assign x_mon_if_rready_m25 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m26
wire x_mon_if_rready_m26;
assign x_mon_if_rready_m26 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m27
wire x_mon_if_rready_m27;
assign x_mon_if_rready_m27 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m28
wire x_mon_if_rready_m28;
assign x_mon_if_rready_m28 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m29
wire x_mon_if_rready_m29;
assign x_mon_if_rready_m29 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m30
wire x_mon_if_rready_m30;
assign x_mon_if_rready_m30 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: rready_m31
wire x_mon_if_rready_m31;
assign x_mon_if_rready_m31 = test_DW_axi_x2p. rready_nu;

// Interface: x_mon_if Signal: wvalid_m0
wire x_mon_if_wvalid_m0;
assign x_mon_if_wvalid_m0 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m1
wire x_mon_if_wvalid_m1;
assign x_mon_if_wvalid_m1 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m2
wire x_mon_if_wvalid_m2;
assign x_mon_if_wvalid_m2 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m3
wire x_mon_if_wvalid_m3;
assign x_mon_if_wvalid_m3 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m4
wire x_mon_if_wvalid_m4;
assign x_mon_if_wvalid_m4 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m5
wire x_mon_if_wvalid_m5;
assign x_mon_if_wvalid_m5 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m6
wire x_mon_if_wvalid_m6;
assign x_mon_if_wvalid_m6 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m7
wire x_mon_if_wvalid_m7;
assign x_mon_if_wvalid_m7 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m8
wire x_mon_if_wvalid_m8;
assign x_mon_if_wvalid_m8 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m9
wire x_mon_if_wvalid_m9;
assign x_mon_if_wvalid_m9 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m10
wire x_mon_if_wvalid_m10;
assign x_mon_if_wvalid_m10 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m11
wire x_mon_if_wvalid_m11;
assign x_mon_if_wvalid_m11 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m12
wire x_mon_if_wvalid_m12;
assign x_mon_if_wvalid_m12 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m13
wire x_mon_if_wvalid_m13;
assign x_mon_if_wvalid_m13 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m14
wire x_mon_if_wvalid_m14;
assign x_mon_if_wvalid_m14 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m15
wire x_mon_if_wvalid_m15;
assign x_mon_if_wvalid_m15 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m16
wire x_mon_if_wvalid_m16;
assign x_mon_if_wvalid_m16 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m17
wire x_mon_if_wvalid_m17;
assign x_mon_if_wvalid_m17 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m18
wire x_mon_if_wvalid_m18;
assign x_mon_if_wvalid_m18 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m19
wire x_mon_if_wvalid_m19;
assign x_mon_if_wvalid_m19 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m20
wire x_mon_if_wvalid_m20;
assign x_mon_if_wvalid_m20 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m21
wire x_mon_if_wvalid_m21;
assign x_mon_if_wvalid_m21 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m22
wire x_mon_if_wvalid_m22;
assign x_mon_if_wvalid_m22 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m23
wire x_mon_if_wvalid_m23;
assign x_mon_if_wvalid_m23 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m24
wire x_mon_if_wvalid_m24;
assign x_mon_if_wvalid_m24 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m25
wire x_mon_if_wvalid_m25;
assign x_mon_if_wvalid_m25 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m26
wire x_mon_if_wvalid_m26;
assign x_mon_if_wvalid_m26 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m27
wire x_mon_if_wvalid_m27;
assign x_mon_if_wvalid_m27 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m28
wire x_mon_if_wvalid_m28;
assign x_mon_if_wvalid_m28 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m29
wire x_mon_if_wvalid_m29;
assign x_mon_if_wvalid_m29 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m30
wire x_mon_if_wvalid_m30;
assign x_mon_if_wvalid_m30 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wvalid_m31
wire x_mon_if_wvalid_m31;
assign x_mon_if_wvalid_m31 = test_DW_axi_x2p. wvalid_nu;

// Interface: x_mon_if Signal: wlast_m0
wire x_mon_if_wlast_m0;
assign x_mon_if_wlast_m0 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m1
wire x_mon_if_wlast_m1;
assign x_mon_if_wlast_m1 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m2
wire x_mon_if_wlast_m2;
assign x_mon_if_wlast_m2 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m3
wire x_mon_if_wlast_m3;
assign x_mon_if_wlast_m3 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m4
wire x_mon_if_wlast_m4;
assign x_mon_if_wlast_m4 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m5
wire x_mon_if_wlast_m5;
assign x_mon_if_wlast_m5 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m6
wire x_mon_if_wlast_m6;
assign x_mon_if_wlast_m6 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m7
wire x_mon_if_wlast_m7;
assign x_mon_if_wlast_m7 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m8
wire x_mon_if_wlast_m8;
assign x_mon_if_wlast_m8 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m9
wire x_mon_if_wlast_m9;
assign x_mon_if_wlast_m9 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m10
wire x_mon_if_wlast_m10;
assign x_mon_if_wlast_m10 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m11
wire x_mon_if_wlast_m11;
assign x_mon_if_wlast_m11 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m12
wire x_mon_if_wlast_m12;
assign x_mon_if_wlast_m12 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m13
wire x_mon_if_wlast_m13;
assign x_mon_if_wlast_m13 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m14
wire x_mon_if_wlast_m14;
assign x_mon_if_wlast_m14 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m15
wire x_mon_if_wlast_m15;
assign x_mon_if_wlast_m15 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m16
wire x_mon_if_wlast_m16;
assign x_mon_if_wlast_m16 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m17
wire x_mon_if_wlast_m17;
assign x_mon_if_wlast_m17 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m18
wire x_mon_if_wlast_m18;
assign x_mon_if_wlast_m18 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m19
wire x_mon_if_wlast_m19;
assign x_mon_if_wlast_m19 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m20
wire x_mon_if_wlast_m20;
assign x_mon_if_wlast_m20 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m21
wire x_mon_if_wlast_m21;
assign x_mon_if_wlast_m21 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m22
wire x_mon_if_wlast_m22;
assign x_mon_if_wlast_m22 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m23
wire x_mon_if_wlast_m23;
assign x_mon_if_wlast_m23 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m24
wire x_mon_if_wlast_m24;
assign x_mon_if_wlast_m24 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m25
wire x_mon_if_wlast_m25;
assign x_mon_if_wlast_m25 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m26
wire x_mon_if_wlast_m26;
assign x_mon_if_wlast_m26 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m27
wire x_mon_if_wlast_m27;
assign x_mon_if_wlast_m27 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m28
wire x_mon_if_wlast_m28;
assign x_mon_if_wlast_m28 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m29
wire x_mon_if_wlast_m29;
assign x_mon_if_wlast_m29 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m30
wire x_mon_if_wlast_m30;
assign x_mon_if_wlast_m30 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wlast_m31
wire x_mon_if_wlast_m31;
assign x_mon_if_wlast_m31 = test_DW_axi_x2p. wlast_nu;

// Interface: x_mon_if Signal: wdata_m0
wire [1023:0] x_mon_if_wdata_m0;
assign x_mon_if_wdata_m0 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m1
wire [1023:0] x_mon_if_wdata_m1;
assign x_mon_if_wdata_m1 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m2
wire [1023:0] x_mon_if_wdata_m2;
assign x_mon_if_wdata_m2 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m3
wire [1023:0] x_mon_if_wdata_m3;
assign x_mon_if_wdata_m3 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m4
wire [1023:0] x_mon_if_wdata_m4;
assign x_mon_if_wdata_m4 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m5
wire [1023:0] x_mon_if_wdata_m5;
assign x_mon_if_wdata_m5 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m6
wire [1023:0] x_mon_if_wdata_m6;
assign x_mon_if_wdata_m6 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m7
wire [1023:0] x_mon_if_wdata_m7;
assign x_mon_if_wdata_m7 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m8
wire [1023:0] x_mon_if_wdata_m8;
assign x_mon_if_wdata_m8 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m9
wire [1023:0] x_mon_if_wdata_m9;
assign x_mon_if_wdata_m9 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m10
wire [1023:0] x_mon_if_wdata_m10;
assign x_mon_if_wdata_m10 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m11
wire [1023:0] x_mon_if_wdata_m11;
assign x_mon_if_wdata_m11 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m12
wire [1023:0] x_mon_if_wdata_m12;
assign x_mon_if_wdata_m12 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m13
wire [1023:0] x_mon_if_wdata_m13;
assign x_mon_if_wdata_m13 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m14
wire [1023:0] x_mon_if_wdata_m14;
assign x_mon_if_wdata_m14 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m15
wire [1023:0] x_mon_if_wdata_m15;
assign x_mon_if_wdata_m15 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m16
wire [1023:0] x_mon_if_wdata_m16;
assign x_mon_if_wdata_m16 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m17
wire [1023:0] x_mon_if_wdata_m17;
assign x_mon_if_wdata_m17 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m18
wire [1023:0] x_mon_if_wdata_m18;
assign x_mon_if_wdata_m18 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m19
wire [1023:0] x_mon_if_wdata_m19;
assign x_mon_if_wdata_m19 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m20
wire [1023:0] x_mon_if_wdata_m20;
assign x_mon_if_wdata_m20 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m21
wire [1023:0] x_mon_if_wdata_m21;
assign x_mon_if_wdata_m21 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m22
wire [1023:0] x_mon_if_wdata_m22;
assign x_mon_if_wdata_m22 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m23
wire [1023:0] x_mon_if_wdata_m23;
assign x_mon_if_wdata_m23 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m24
wire [1023:0] x_mon_if_wdata_m24;
assign x_mon_if_wdata_m24 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m25
wire [1023:0] x_mon_if_wdata_m25;
assign x_mon_if_wdata_m25 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m26
wire [1023:0] x_mon_if_wdata_m26;
assign x_mon_if_wdata_m26 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m27
wire [1023:0] x_mon_if_wdata_m27;
assign x_mon_if_wdata_m27 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m28
wire [1023:0] x_mon_if_wdata_m28;
assign x_mon_if_wdata_m28 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m29
wire [1023:0] x_mon_if_wdata_m29;
assign x_mon_if_wdata_m29 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m30
wire [1023:0] x_mon_if_wdata_m30;
assign x_mon_if_wdata_m30 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wdata_m31
wire [1023:0] x_mon_if_wdata_m31;
assign x_mon_if_wdata_m31 = test_DW_axi_x2p. wdata_nu;

// Interface: x_mon_if Signal: wstrb_m0
wire [127:0] x_mon_if_wstrb_m0;
assign x_mon_if_wstrb_m0 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m1
wire [127:0] x_mon_if_wstrb_m1;
assign x_mon_if_wstrb_m1 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m2
wire [127:0] x_mon_if_wstrb_m2;
assign x_mon_if_wstrb_m2 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m3
wire [127:0] x_mon_if_wstrb_m3;
assign x_mon_if_wstrb_m3 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m4
wire [127:0] x_mon_if_wstrb_m4;
assign x_mon_if_wstrb_m4 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m5
wire [127:0] x_mon_if_wstrb_m5;
assign x_mon_if_wstrb_m5 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m6
wire [127:0] x_mon_if_wstrb_m6;
assign x_mon_if_wstrb_m6 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m7
wire [127:0] x_mon_if_wstrb_m7;
assign x_mon_if_wstrb_m7 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m8
wire [127:0] x_mon_if_wstrb_m8;
assign x_mon_if_wstrb_m8 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m9
wire [127:0] x_mon_if_wstrb_m9;
assign x_mon_if_wstrb_m9 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m10
wire [127:0] x_mon_if_wstrb_m10;
assign x_mon_if_wstrb_m10 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m11
wire [127:0] x_mon_if_wstrb_m11;
assign x_mon_if_wstrb_m11 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m12
wire [127:0] x_mon_if_wstrb_m12;
assign x_mon_if_wstrb_m12 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m13
wire [127:0] x_mon_if_wstrb_m13;
assign x_mon_if_wstrb_m13 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m14
wire [127:0] x_mon_if_wstrb_m14;
assign x_mon_if_wstrb_m14 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m15
wire [127:0] x_mon_if_wstrb_m15;
assign x_mon_if_wstrb_m15 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m16
wire [127:0] x_mon_if_wstrb_m16;
assign x_mon_if_wstrb_m16 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m17
wire [127:0] x_mon_if_wstrb_m17;
assign x_mon_if_wstrb_m17 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m18
wire [127:0] x_mon_if_wstrb_m18;
assign x_mon_if_wstrb_m18 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m19
wire [127:0] x_mon_if_wstrb_m19;
assign x_mon_if_wstrb_m19 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m20
wire [127:0] x_mon_if_wstrb_m20;
assign x_mon_if_wstrb_m20 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m21
wire [127:0] x_mon_if_wstrb_m21;
assign x_mon_if_wstrb_m21 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m22
wire [127:0] x_mon_if_wstrb_m22;
assign x_mon_if_wstrb_m22 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m23
wire [127:0] x_mon_if_wstrb_m23;
assign x_mon_if_wstrb_m23 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m24
wire [127:0] x_mon_if_wstrb_m24;
assign x_mon_if_wstrb_m24 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m25
wire [127:0] x_mon_if_wstrb_m25;
assign x_mon_if_wstrb_m25 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m26
wire [127:0] x_mon_if_wstrb_m26;
assign x_mon_if_wstrb_m26 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m27
wire [127:0] x_mon_if_wstrb_m27;
assign x_mon_if_wstrb_m27 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m28
wire [127:0] x_mon_if_wstrb_m28;
assign x_mon_if_wstrb_m28 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m29
wire [127:0] x_mon_if_wstrb_m29;
assign x_mon_if_wstrb_m29 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m30
wire [127:0] x_mon_if_wstrb_m30;
assign x_mon_if_wstrb_m30 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wstrb_m31
wire [127:0] x_mon_if_wstrb_m31;
assign x_mon_if_wstrb_m31 = test_DW_axi_x2p. wstrb_nu;

// Interface: x_mon_if Signal: wid_m0
wire [31:0] x_mon_if_wid_m0;
assign x_mon_if_wid_m0 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m1
wire [31:0] x_mon_if_wid_m1;
assign x_mon_if_wid_m1 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m2
wire [31:0] x_mon_if_wid_m2;
assign x_mon_if_wid_m2 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m3
wire [31:0] x_mon_if_wid_m3;
assign x_mon_if_wid_m3 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m4
wire [31:0] x_mon_if_wid_m4;
assign x_mon_if_wid_m4 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m5
wire [31:0] x_mon_if_wid_m5;
assign x_mon_if_wid_m5 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m6
wire [31:0] x_mon_if_wid_m6;
assign x_mon_if_wid_m6 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m7
wire [31:0] x_mon_if_wid_m7;
assign x_mon_if_wid_m7 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m8
wire [31:0] x_mon_if_wid_m8;
assign x_mon_if_wid_m8 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m9
wire [31:0] x_mon_if_wid_m9;
assign x_mon_if_wid_m9 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m10
wire [31:0] x_mon_if_wid_m10;
assign x_mon_if_wid_m10 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m11
wire [31:0] x_mon_if_wid_m11;
assign x_mon_if_wid_m11 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m12
wire [31:0] x_mon_if_wid_m12;
assign x_mon_if_wid_m12 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m13
wire [31:0] x_mon_if_wid_m13;
assign x_mon_if_wid_m13 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m14
wire [31:0] x_mon_if_wid_m14;
assign x_mon_if_wid_m14 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m15
wire [31:0] x_mon_if_wid_m15;
assign x_mon_if_wid_m15 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m16
wire [31:0] x_mon_if_wid_m16;
assign x_mon_if_wid_m16 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m17
wire [31:0] x_mon_if_wid_m17;
assign x_mon_if_wid_m17 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m18
wire [31:0] x_mon_if_wid_m18;
assign x_mon_if_wid_m18 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m19
wire [31:0] x_mon_if_wid_m19;
assign x_mon_if_wid_m19 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m20
wire [31:0] x_mon_if_wid_m20;
assign x_mon_if_wid_m20 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m21
wire [31:0] x_mon_if_wid_m21;
assign x_mon_if_wid_m21 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m22
wire [31:0] x_mon_if_wid_m22;
assign x_mon_if_wid_m22 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m23
wire [31:0] x_mon_if_wid_m23;
assign x_mon_if_wid_m23 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m24
wire [31:0] x_mon_if_wid_m24;
assign x_mon_if_wid_m24 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m25
wire [31:0] x_mon_if_wid_m25;
assign x_mon_if_wid_m25 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m26
wire [31:0] x_mon_if_wid_m26;
assign x_mon_if_wid_m26 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m27
wire [31:0] x_mon_if_wid_m27;
assign x_mon_if_wid_m27 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m28
wire [31:0] x_mon_if_wid_m28;
assign x_mon_if_wid_m28 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m29
wire [31:0] x_mon_if_wid_m29;
assign x_mon_if_wid_m29 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m30
wire [31:0] x_mon_if_wid_m30;
assign x_mon_if_wid_m30 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wid_m31
wire [31:0] x_mon_if_wid_m31;
assign x_mon_if_wid_m31 = test_DW_axi_x2p. wid_nu;

// Interface: x_mon_if Signal: wready_m0
wire x_mon_if_wready_m0;
assign x_mon_if_wready_m0 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m1
wire x_mon_if_wready_m1;
assign x_mon_if_wready_m1 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m2
wire x_mon_if_wready_m2;
assign x_mon_if_wready_m2 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m3
wire x_mon_if_wready_m3;
assign x_mon_if_wready_m3 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m4
wire x_mon_if_wready_m4;
assign x_mon_if_wready_m4 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m5
wire x_mon_if_wready_m5;
assign x_mon_if_wready_m5 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m6
wire x_mon_if_wready_m6;
assign x_mon_if_wready_m6 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m7
wire x_mon_if_wready_m7;
assign x_mon_if_wready_m7 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m8
wire x_mon_if_wready_m8;
assign x_mon_if_wready_m8 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m9
wire x_mon_if_wready_m9;
assign x_mon_if_wready_m9 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m10
wire x_mon_if_wready_m10;
assign x_mon_if_wready_m10 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m11
wire x_mon_if_wready_m11;
assign x_mon_if_wready_m11 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m12
wire x_mon_if_wready_m12;
assign x_mon_if_wready_m12 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m13
wire x_mon_if_wready_m13;
assign x_mon_if_wready_m13 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m14
wire x_mon_if_wready_m14;
assign x_mon_if_wready_m14 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m15
wire x_mon_if_wready_m15;
assign x_mon_if_wready_m15 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m16
wire x_mon_if_wready_m16;
assign x_mon_if_wready_m16 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m17
wire x_mon_if_wready_m17;
assign x_mon_if_wready_m17 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m18
wire x_mon_if_wready_m18;
assign x_mon_if_wready_m18 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m19
wire x_mon_if_wready_m19;
assign x_mon_if_wready_m19 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m20
wire x_mon_if_wready_m20;
assign x_mon_if_wready_m20 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m21
wire x_mon_if_wready_m21;
assign x_mon_if_wready_m21 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m22
wire x_mon_if_wready_m22;
assign x_mon_if_wready_m22 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m23
wire x_mon_if_wready_m23;
assign x_mon_if_wready_m23 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m24
wire x_mon_if_wready_m24;
assign x_mon_if_wready_m24 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m25
wire x_mon_if_wready_m25;
assign x_mon_if_wready_m25 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m26
wire x_mon_if_wready_m26;
assign x_mon_if_wready_m26 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m27
wire x_mon_if_wready_m27;
assign x_mon_if_wready_m27 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m28
wire x_mon_if_wready_m28;
assign x_mon_if_wready_m28 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m29
wire x_mon_if_wready_m29;
assign x_mon_if_wready_m29 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m30
wire x_mon_if_wready_m30;
assign x_mon_if_wready_m30 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: wready_m31
wire x_mon_if_wready_m31;
assign x_mon_if_wready_m31 = test_DW_axi_x2p. wready_nu;

// Interface: x_mon_if Signal: bvalid_m0
wire x_mon_if_bvalid_m0;
assign x_mon_if_bvalid_m0 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m1
wire x_mon_if_bvalid_m1;
assign x_mon_if_bvalid_m1 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m2
wire x_mon_if_bvalid_m2;
assign x_mon_if_bvalid_m2 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m3
wire x_mon_if_bvalid_m3;
assign x_mon_if_bvalid_m3 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m4
wire x_mon_if_bvalid_m4;
assign x_mon_if_bvalid_m4 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m5
wire x_mon_if_bvalid_m5;
assign x_mon_if_bvalid_m5 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m6
wire x_mon_if_bvalid_m6;
assign x_mon_if_bvalid_m6 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m7
wire x_mon_if_bvalid_m7;
assign x_mon_if_bvalid_m7 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m8
wire x_mon_if_bvalid_m8;
assign x_mon_if_bvalid_m8 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m9
wire x_mon_if_bvalid_m9;
assign x_mon_if_bvalid_m9 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m10
wire x_mon_if_bvalid_m10;
assign x_mon_if_bvalid_m10 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m11
wire x_mon_if_bvalid_m11;
assign x_mon_if_bvalid_m11 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m12
wire x_mon_if_bvalid_m12;
assign x_mon_if_bvalid_m12 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m13
wire x_mon_if_bvalid_m13;
assign x_mon_if_bvalid_m13 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m14
wire x_mon_if_bvalid_m14;
assign x_mon_if_bvalid_m14 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m15
wire x_mon_if_bvalid_m15;
assign x_mon_if_bvalid_m15 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m16
wire x_mon_if_bvalid_m16;
assign x_mon_if_bvalid_m16 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m17
wire x_mon_if_bvalid_m17;
assign x_mon_if_bvalid_m17 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m18
wire x_mon_if_bvalid_m18;
assign x_mon_if_bvalid_m18 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m19
wire x_mon_if_bvalid_m19;
assign x_mon_if_bvalid_m19 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m20
wire x_mon_if_bvalid_m20;
assign x_mon_if_bvalid_m20 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m21
wire x_mon_if_bvalid_m21;
assign x_mon_if_bvalid_m21 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m22
wire x_mon_if_bvalid_m22;
assign x_mon_if_bvalid_m22 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m23
wire x_mon_if_bvalid_m23;
assign x_mon_if_bvalid_m23 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m24
wire x_mon_if_bvalid_m24;
assign x_mon_if_bvalid_m24 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m25
wire x_mon_if_bvalid_m25;
assign x_mon_if_bvalid_m25 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m26
wire x_mon_if_bvalid_m26;
assign x_mon_if_bvalid_m26 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m27
wire x_mon_if_bvalid_m27;
assign x_mon_if_bvalid_m27 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m28
wire x_mon_if_bvalid_m28;
assign x_mon_if_bvalid_m28 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m29
wire x_mon_if_bvalid_m29;
assign x_mon_if_bvalid_m29 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m30
wire x_mon_if_bvalid_m30;
assign x_mon_if_bvalid_m30 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bvalid_m31
wire x_mon_if_bvalid_m31;
assign x_mon_if_bvalid_m31 = test_DW_axi_x2p. bvalid_nu;

// Interface: x_mon_if Signal: bresp_m0
wire [1:0] x_mon_if_bresp_m0;
assign x_mon_if_bresp_m0 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m1
wire [1:0] x_mon_if_bresp_m1;
assign x_mon_if_bresp_m1 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m2
wire [1:0] x_mon_if_bresp_m2;
assign x_mon_if_bresp_m2 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m3
wire [1:0] x_mon_if_bresp_m3;
assign x_mon_if_bresp_m3 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m4
wire [1:0] x_mon_if_bresp_m4;
assign x_mon_if_bresp_m4 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m5
wire [1:0] x_mon_if_bresp_m5;
assign x_mon_if_bresp_m5 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m6
wire [1:0] x_mon_if_bresp_m6;
assign x_mon_if_bresp_m6 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m7
wire [1:0] x_mon_if_bresp_m7;
assign x_mon_if_bresp_m7 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m8
wire [1:0] x_mon_if_bresp_m8;
assign x_mon_if_bresp_m8 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m9
wire [1:0] x_mon_if_bresp_m9;
assign x_mon_if_bresp_m9 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m10
wire [1:0] x_mon_if_bresp_m10;
assign x_mon_if_bresp_m10 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m11
wire [1:0] x_mon_if_bresp_m11;
assign x_mon_if_bresp_m11 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m12
wire [1:0] x_mon_if_bresp_m12;
assign x_mon_if_bresp_m12 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m13
wire [1:0] x_mon_if_bresp_m13;
assign x_mon_if_bresp_m13 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m14
wire [1:0] x_mon_if_bresp_m14;
assign x_mon_if_bresp_m14 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m15
wire [1:0] x_mon_if_bresp_m15;
assign x_mon_if_bresp_m15 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m16
wire [1:0] x_mon_if_bresp_m16;
assign x_mon_if_bresp_m16 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m17
wire [1:0] x_mon_if_bresp_m17;
assign x_mon_if_bresp_m17 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m18
wire [1:0] x_mon_if_bresp_m18;
assign x_mon_if_bresp_m18 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m19
wire [1:0] x_mon_if_bresp_m19;
assign x_mon_if_bresp_m19 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m20
wire [1:0] x_mon_if_bresp_m20;
assign x_mon_if_bresp_m20 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m21
wire [1:0] x_mon_if_bresp_m21;
assign x_mon_if_bresp_m21 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m22
wire [1:0] x_mon_if_bresp_m22;
assign x_mon_if_bresp_m22 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m23
wire [1:0] x_mon_if_bresp_m23;
assign x_mon_if_bresp_m23 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m24
wire [1:0] x_mon_if_bresp_m24;
assign x_mon_if_bresp_m24 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m25
wire [1:0] x_mon_if_bresp_m25;
assign x_mon_if_bresp_m25 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m26
wire [1:0] x_mon_if_bresp_m26;
assign x_mon_if_bresp_m26 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m27
wire [1:0] x_mon_if_bresp_m27;
assign x_mon_if_bresp_m27 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m28
wire [1:0] x_mon_if_bresp_m28;
assign x_mon_if_bresp_m28 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m29
wire [1:0] x_mon_if_bresp_m29;
assign x_mon_if_bresp_m29 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m30
wire [1:0] x_mon_if_bresp_m30;
assign x_mon_if_bresp_m30 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bresp_m31
wire [1:0] x_mon_if_bresp_m31;
assign x_mon_if_bresp_m31 = test_DW_axi_x2p. bresp_nu;

// Interface: x_mon_if Signal: bid_m0
wire [31:0] x_mon_if_bid_m0;
assign x_mon_if_bid_m0 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m1
wire [31:0] x_mon_if_bid_m1;
assign x_mon_if_bid_m1 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m2
wire [31:0] x_mon_if_bid_m2;
assign x_mon_if_bid_m2 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m3
wire [31:0] x_mon_if_bid_m3;
assign x_mon_if_bid_m3 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m4
wire [31:0] x_mon_if_bid_m4;
assign x_mon_if_bid_m4 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m5
wire [31:0] x_mon_if_bid_m5;
assign x_mon_if_bid_m5 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m6
wire [31:0] x_mon_if_bid_m6;
assign x_mon_if_bid_m6 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m7
wire [31:0] x_mon_if_bid_m7;
assign x_mon_if_bid_m7 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m8
wire [31:0] x_mon_if_bid_m8;
assign x_mon_if_bid_m8 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m9
wire [31:0] x_mon_if_bid_m9;
assign x_mon_if_bid_m9 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m10
wire [31:0] x_mon_if_bid_m10;
assign x_mon_if_bid_m10 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m11
wire [31:0] x_mon_if_bid_m11;
assign x_mon_if_bid_m11 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m12
wire [31:0] x_mon_if_bid_m12;
assign x_mon_if_bid_m12 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m13
wire [31:0] x_mon_if_bid_m13;
assign x_mon_if_bid_m13 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m14
wire [31:0] x_mon_if_bid_m14;
assign x_mon_if_bid_m14 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m15
wire [31:0] x_mon_if_bid_m15;
assign x_mon_if_bid_m15 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m16
wire [31:0] x_mon_if_bid_m16;
assign x_mon_if_bid_m16 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m17
wire [31:0] x_mon_if_bid_m17;
assign x_mon_if_bid_m17 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m18
wire [31:0] x_mon_if_bid_m18;
assign x_mon_if_bid_m18 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m19
wire [31:0] x_mon_if_bid_m19;
assign x_mon_if_bid_m19 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m20
wire [31:0] x_mon_if_bid_m20;
assign x_mon_if_bid_m20 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m21
wire [31:0] x_mon_if_bid_m21;
assign x_mon_if_bid_m21 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m22
wire [31:0] x_mon_if_bid_m22;
assign x_mon_if_bid_m22 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m23
wire [31:0] x_mon_if_bid_m23;
assign x_mon_if_bid_m23 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m24
wire [31:0] x_mon_if_bid_m24;
assign x_mon_if_bid_m24 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m25
wire [31:0] x_mon_if_bid_m25;
assign x_mon_if_bid_m25 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m26
wire [31:0] x_mon_if_bid_m26;
assign x_mon_if_bid_m26 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m27
wire [31:0] x_mon_if_bid_m27;
assign x_mon_if_bid_m27 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m28
wire [31:0] x_mon_if_bid_m28;
assign x_mon_if_bid_m28 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m29
wire [31:0] x_mon_if_bid_m29;
assign x_mon_if_bid_m29 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m30
wire [31:0] x_mon_if_bid_m30;
assign x_mon_if_bid_m30 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bid_m31
wire [31:0] x_mon_if_bid_m31;
assign x_mon_if_bid_m31 = test_DW_axi_x2p. bid_nu;

// Interface: x_mon_if Signal: bready_m0
wire x_mon_if_bready_m0;
assign x_mon_if_bready_m0 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m1
wire x_mon_if_bready_m1;
assign x_mon_if_bready_m1 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m2
wire x_mon_if_bready_m2;
assign x_mon_if_bready_m2 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m3
wire x_mon_if_bready_m3;
assign x_mon_if_bready_m3 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m4
wire x_mon_if_bready_m4;
assign x_mon_if_bready_m4 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m5
wire x_mon_if_bready_m5;
assign x_mon_if_bready_m5 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m6
wire x_mon_if_bready_m6;
assign x_mon_if_bready_m6 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m7
wire x_mon_if_bready_m7;
assign x_mon_if_bready_m7 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m8
wire x_mon_if_bready_m8;
assign x_mon_if_bready_m8 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m9
wire x_mon_if_bready_m9;
assign x_mon_if_bready_m9 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m10
wire x_mon_if_bready_m10;
assign x_mon_if_bready_m10 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m11
wire x_mon_if_bready_m11;
assign x_mon_if_bready_m11 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m12
wire x_mon_if_bready_m12;
assign x_mon_if_bready_m12 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m13
wire x_mon_if_bready_m13;
assign x_mon_if_bready_m13 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m14
wire x_mon_if_bready_m14;
assign x_mon_if_bready_m14 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m15
wire x_mon_if_bready_m15;
assign x_mon_if_bready_m15 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m16
wire x_mon_if_bready_m16;
assign x_mon_if_bready_m16 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m17
wire x_mon_if_bready_m17;
assign x_mon_if_bready_m17 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m18
wire x_mon_if_bready_m18;
assign x_mon_if_bready_m18 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m19
wire x_mon_if_bready_m19;
assign x_mon_if_bready_m19 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m20
wire x_mon_if_bready_m20;
assign x_mon_if_bready_m20 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m21
wire x_mon_if_bready_m21;
assign x_mon_if_bready_m21 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m22
wire x_mon_if_bready_m22;
assign x_mon_if_bready_m22 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m23
wire x_mon_if_bready_m23;
assign x_mon_if_bready_m23 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m24
wire x_mon_if_bready_m24;
assign x_mon_if_bready_m24 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m25
wire x_mon_if_bready_m25;
assign x_mon_if_bready_m25 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m26
wire x_mon_if_bready_m26;
assign x_mon_if_bready_m26 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m27
wire x_mon_if_bready_m27;
assign x_mon_if_bready_m27 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m28
wire x_mon_if_bready_m28;
assign x_mon_if_bready_m28 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m29
wire x_mon_if_bready_m29;
assign x_mon_if_bready_m29 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m30
wire x_mon_if_bready_m30;
assign x_mon_if_bready_m30 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: bready_m31
wire x_mon_if_bready_m31;
assign x_mon_if_bready_m31 = test_DW_axi_x2p. bready_nu;

// Interface: x_mon_if Signal: cactive_m0
wire x_mon_if_cactive_m0;
assign x_mon_if_cactive_m0 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m1
wire x_mon_if_cactive_m1;
assign x_mon_if_cactive_m1 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m2
wire x_mon_if_cactive_m2;
assign x_mon_if_cactive_m2 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m3
wire x_mon_if_cactive_m3;
assign x_mon_if_cactive_m3 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m4
wire x_mon_if_cactive_m4;
assign x_mon_if_cactive_m4 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m5
wire x_mon_if_cactive_m5;
assign x_mon_if_cactive_m5 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m6
wire x_mon_if_cactive_m6;
assign x_mon_if_cactive_m6 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m7
wire x_mon_if_cactive_m7;
assign x_mon_if_cactive_m7 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m8
wire x_mon_if_cactive_m8;
assign x_mon_if_cactive_m8 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m9
wire x_mon_if_cactive_m9;
assign x_mon_if_cactive_m9 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m10
wire x_mon_if_cactive_m10;
assign x_mon_if_cactive_m10 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m11
wire x_mon_if_cactive_m11;
assign x_mon_if_cactive_m11 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m12
wire x_mon_if_cactive_m12;
assign x_mon_if_cactive_m12 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m13
wire x_mon_if_cactive_m13;
assign x_mon_if_cactive_m13 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m14
wire x_mon_if_cactive_m14;
assign x_mon_if_cactive_m14 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m15
wire x_mon_if_cactive_m15;
assign x_mon_if_cactive_m15 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m16
wire x_mon_if_cactive_m16;
assign x_mon_if_cactive_m16 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m17
wire x_mon_if_cactive_m17;
assign x_mon_if_cactive_m17 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m18
wire x_mon_if_cactive_m18;
assign x_mon_if_cactive_m18 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m19
wire x_mon_if_cactive_m19;
assign x_mon_if_cactive_m19 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m20
wire x_mon_if_cactive_m20;
assign x_mon_if_cactive_m20 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m21
wire x_mon_if_cactive_m21;
assign x_mon_if_cactive_m21 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m22
wire x_mon_if_cactive_m22;
assign x_mon_if_cactive_m22 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m23
wire x_mon_if_cactive_m23;
assign x_mon_if_cactive_m23 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m24
wire x_mon_if_cactive_m24;
assign x_mon_if_cactive_m24 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m25
wire x_mon_if_cactive_m25;
assign x_mon_if_cactive_m25 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m26
wire x_mon_if_cactive_m26;
assign x_mon_if_cactive_m26 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m27
wire x_mon_if_cactive_m27;
assign x_mon_if_cactive_m27 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m28
wire x_mon_if_cactive_m28;
assign x_mon_if_cactive_m28 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m29
wire x_mon_if_cactive_m29;
assign x_mon_if_cactive_m29 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m30
wire x_mon_if_cactive_m30;
assign x_mon_if_cactive_m30 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: cactive_m31
wire x_mon_if_cactive_m31;
assign x_mon_if_cactive_m31 = test_DW_axi_x2p. cactive_nu;

// Interface: x_mon_if Signal: csysreq_m0
wire x_mon_if_csysreq_m0;
assign x_mon_if_csysreq_m0 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m1
wire x_mon_if_csysreq_m1;
assign x_mon_if_csysreq_m1 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m2
wire x_mon_if_csysreq_m2;
assign x_mon_if_csysreq_m2 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m3
wire x_mon_if_csysreq_m3;
assign x_mon_if_csysreq_m3 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m4
wire x_mon_if_csysreq_m4;
assign x_mon_if_csysreq_m4 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m5
wire x_mon_if_csysreq_m5;
assign x_mon_if_csysreq_m5 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m6
wire x_mon_if_csysreq_m6;
assign x_mon_if_csysreq_m6 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m7
wire x_mon_if_csysreq_m7;
assign x_mon_if_csysreq_m7 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m8
wire x_mon_if_csysreq_m8;
assign x_mon_if_csysreq_m8 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m9
wire x_mon_if_csysreq_m9;
assign x_mon_if_csysreq_m9 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m10
wire x_mon_if_csysreq_m10;
assign x_mon_if_csysreq_m10 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m11
wire x_mon_if_csysreq_m11;
assign x_mon_if_csysreq_m11 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m12
wire x_mon_if_csysreq_m12;
assign x_mon_if_csysreq_m12 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m13
wire x_mon_if_csysreq_m13;
assign x_mon_if_csysreq_m13 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m14
wire x_mon_if_csysreq_m14;
assign x_mon_if_csysreq_m14 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m15
wire x_mon_if_csysreq_m15;
assign x_mon_if_csysreq_m15 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m16
wire x_mon_if_csysreq_m16;
assign x_mon_if_csysreq_m16 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m17
wire x_mon_if_csysreq_m17;
assign x_mon_if_csysreq_m17 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m18
wire x_mon_if_csysreq_m18;
assign x_mon_if_csysreq_m18 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m19
wire x_mon_if_csysreq_m19;
assign x_mon_if_csysreq_m19 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m20
wire x_mon_if_csysreq_m20;
assign x_mon_if_csysreq_m20 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m21
wire x_mon_if_csysreq_m21;
assign x_mon_if_csysreq_m21 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m22
wire x_mon_if_csysreq_m22;
assign x_mon_if_csysreq_m22 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m23
wire x_mon_if_csysreq_m23;
assign x_mon_if_csysreq_m23 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m24
wire x_mon_if_csysreq_m24;
assign x_mon_if_csysreq_m24 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m25
wire x_mon_if_csysreq_m25;
assign x_mon_if_csysreq_m25 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m26
wire x_mon_if_csysreq_m26;
assign x_mon_if_csysreq_m26 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m27
wire x_mon_if_csysreq_m27;
assign x_mon_if_csysreq_m27 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m28
wire x_mon_if_csysreq_m28;
assign x_mon_if_csysreq_m28 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m29
wire x_mon_if_csysreq_m29;
assign x_mon_if_csysreq_m29 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m30
wire x_mon_if_csysreq_m30;
assign x_mon_if_csysreq_m30 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysreq_m31
wire x_mon_if_csysreq_m31;
assign x_mon_if_csysreq_m31 = test_DW_axi_x2p. csysreq_nu;

// Interface: x_mon_if Signal: csysack_m0
wire x_mon_if_csysack_m0;
assign x_mon_if_csysack_m0 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m1
wire x_mon_if_csysack_m1;
assign x_mon_if_csysack_m1 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m2
wire x_mon_if_csysack_m2;
assign x_mon_if_csysack_m2 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m3
wire x_mon_if_csysack_m3;
assign x_mon_if_csysack_m3 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m4
wire x_mon_if_csysack_m4;
assign x_mon_if_csysack_m4 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m5
wire x_mon_if_csysack_m5;
assign x_mon_if_csysack_m5 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m6
wire x_mon_if_csysack_m6;
assign x_mon_if_csysack_m6 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m7
wire x_mon_if_csysack_m7;
assign x_mon_if_csysack_m7 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m8
wire x_mon_if_csysack_m8;
assign x_mon_if_csysack_m8 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m9
wire x_mon_if_csysack_m9;
assign x_mon_if_csysack_m9 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m10
wire x_mon_if_csysack_m10;
assign x_mon_if_csysack_m10 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m11
wire x_mon_if_csysack_m11;
assign x_mon_if_csysack_m11 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m12
wire x_mon_if_csysack_m12;
assign x_mon_if_csysack_m12 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m13
wire x_mon_if_csysack_m13;
assign x_mon_if_csysack_m13 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m14
wire x_mon_if_csysack_m14;
assign x_mon_if_csysack_m14 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m15
wire x_mon_if_csysack_m15;
assign x_mon_if_csysack_m15 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m16
wire x_mon_if_csysack_m16;
assign x_mon_if_csysack_m16 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m17
wire x_mon_if_csysack_m17;
assign x_mon_if_csysack_m17 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m18
wire x_mon_if_csysack_m18;
assign x_mon_if_csysack_m18 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m19
wire x_mon_if_csysack_m19;
assign x_mon_if_csysack_m19 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m20
wire x_mon_if_csysack_m20;
assign x_mon_if_csysack_m20 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m21
wire x_mon_if_csysack_m21;
assign x_mon_if_csysack_m21 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m22
wire x_mon_if_csysack_m22;
assign x_mon_if_csysack_m22 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m23
wire x_mon_if_csysack_m23;
assign x_mon_if_csysack_m23 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m24
wire x_mon_if_csysack_m24;
assign x_mon_if_csysack_m24 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m25
wire x_mon_if_csysack_m25;
assign x_mon_if_csysack_m25 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m26
wire x_mon_if_csysack_m26;
assign x_mon_if_csysack_m26 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m27
wire x_mon_if_csysack_m27;
assign x_mon_if_csysack_m27 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m28
wire x_mon_if_csysack_m28;
assign x_mon_if_csysack_m28 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m29
wire x_mon_if_csysack_m29;
assign x_mon_if_csysack_m29 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m30
wire x_mon_if_csysack_m30;
assign x_mon_if_csysack_m30 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: csysack_m31
wire x_mon_if_csysack_m31;
assign x_mon_if_csysack_m31 = test_DW_axi_x2p. csysack_nu;

// Interface: x_mon_if Signal: awsideband_m0
wire [63:0] x_mon_if_awsideband_m0;
assign x_mon_if_awsideband_m0 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m1
wire [63:0] x_mon_if_awsideband_m1;
assign x_mon_if_awsideband_m1 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m2
wire [63:0] x_mon_if_awsideband_m2;
assign x_mon_if_awsideband_m2 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m3
wire [63:0] x_mon_if_awsideband_m3;
assign x_mon_if_awsideband_m3 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m4
wire [63:0] x_mon_if_awsideband_m4;
assign x_mon_if_awsideband_m4 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m5
wire [63:0] x_mon_if_awsideband_m5;
assign x_mon_if_awsideband_m5 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m6
wire [63:0] x_mon_if_awsideband_m6;
assign x_mon_if_awsideband_m6 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m7
wire [63:0] x_mon_if_awsideband_m7;
assign x_mon_if_awsideband_m7 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m8
wire [63:0] x_mon_if_awsideband_m8;
assign x_mon_if_awsideband_m8 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m9
wire [63:0] x_mon_if_awsideband_m9;
assign x_mon_if_awsideband_m9 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m10
wire [63:0] x_mon_if_awsideband_m10;
assign x_mon_if_awsideband_m10 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m11
wire [63:0] x_mon_if_awsideband_m11;
assign x_mon_if_awsideband_m11 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m12
wire [63:0] x_mon_if_awsideband_m12;
assign x_mon_if_awsideband_m12 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m13
wire [63:0] x_mon_if_awsideband_m13;
assign x_mon_if_awsideband_m13 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m14
wire [63:0] x_mon_if_awsideband_m14;
assign x_mon_if_awsideband_m14 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m15
wire [63:0] x_mon_if_awsideband_m15;
assign x_mon_if_awsideband_m15 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m16
wire [63:0] x_mon_if_awsideband_m16;
assign x_mon_if_awsideband_m16 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m17
wire [63:0] x_mon_if_awsideband_m17;
assign x_mon_if_awsideband_m17 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m18
wire [63:0] x_mon_if_awsideband_m18;
assign x_mon_if_awsideband_m18 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m19
wire [63:0] x_mon_if_awsideband_m19;
assign x_mon_if_awsideband_m19 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m20
wire [63:0] x_mon_if_awsideband_m20;
assign x_mon_if_awsideband_m20 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m21
wire [63:0] x_mon_if_awsideband_m21;
assign x_mon_if_awsideband_m21 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m22
wire [63:0] x_mon_if_awsideband_m22;
assign x_mon_if_awsideband_m22 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m23
wire [63:0] x_mon_if_awsideband_m23;
assign x_mon_if_awsideband_m23 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m24
wire [63:0] x_mon_if_awsideband_m24;
assign x_mon_if_awsideband_m24 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m25
wire [63:0] x_mon_if_awsideband_m25;
assign x_mon_if_awsideband_m25 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m26
wire [63:0] x_mon_if_awsideband_m26;
assign x_mon_if_awsideband_m26 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m27
wire [63:0] x_mon_if_awsideband_m27;
assign x_mon_if_awsideband_m27 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m28
wire [63:0] x_mon_if_awsideband_m28;
assign x_mon_if_awsideband_m28 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m29
wire [63:0] x_mon_if_awsideband_m29;
assign x_mon_if_awsideband_m29 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m30
wire [63:0] x_mon_if_awsideband_m30;
assign x_mon_if_awsideband_m30 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: awsideband_m31
wire [63:0] x_mon_if_awsideband_m31;
assign x_mon_if_awsideband_m31 = test_DW_axi_x2p. awsideband_nu;

// Interface: x_mon_if Signal: arsideband_m0
wire [63:0] x_mon_if_arsideband_m0;
assign x_mon_if_arsideband_m0 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m1
wire [63:0] x_mon_if_arsideband_m1;
assign x_mon_if_arsideband_m1 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m2
wire [63:0] x_mon_if_arsideband_m2;
assign x_mon_if_arsideband_m2 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m3
wire [63:0] x_mon_if_arsideband_m3;
assign x_mon_if_arsideband_m3 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m4
wire [63:0] x_mon_if_arsideband_m4;
assign x_mon_if_arsideband_m4 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m5
wire [63:0] x_mon_if_arsideband_m5;
assign x_mon_if_arsideband_m5 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m6
wire [63:0] x_mon_if_arsideband_m6;
assign x_mon_if_arsideband_m6 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m7
wire [63:0] x_mon_if_arsideband_m7;
assign x_mon_if_arsideband_m7 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m8
wire [63:0] x_mon_if_arsideband_m8;
assign x_mon_if_arsideband_m8 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m9
wire [63:0] x_mon_if_arsideband_m9;
assign x_mon_if_arsideband_m9 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m10
wire [63:0] x_mon_if_arsideband_m10;
assign x_mon_if_arsideband_m10 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m11
wire [63:0] x_mon_if_arsideband_m11;
assign x_mon_if_arsideband_m11 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m12
wire [63:0] x_mon_if_arsideband_m12;
assign x_mon_if_arsideband_m12 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m13
wire [63:0] x_mon_if_arsideband_m13;
assign x_mon_if_arsideband_m13 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m14
wire [63:0] x_mon_if_arsideband_m14;
assign x_mon_if_arsideband_m14 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m15
wire [63:0] x_mon_if_arsideband_m15;
assign x_mon_if_arsideband_m15 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m16
wire [63:0] x_mon_if_arsideband_m16;
assign x_mon_if_arsideband_m16 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m17
wire [63:0] x_mon_if_arsideband_m17;
assign x_mon_if_arsideband_m17 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m18
wire [63:0] x_mon_if_arsideband_m18;
assign x_mon_if_arsideband_m18 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m19
wire [63:0] x_mon_if_arsideband_m19;
assign x_mon_if_arsideband_m19 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m20
wire [63:0] x_mon_if_arsideband_m20;
assign x_mon_if_arsideband_m20 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m21
wire [63:0] x_mon_if_arsideband_m21;
assign x_mon_if_arsideband_m21 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m22
wire [63:0] x_mon_if_arsideband_m22;
assign x_mon_if_arsideband_m22 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m23
wire [63:0] x_mon_if_arsideband_m23;
assign x_mon_if_arsideband_m23 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m24
wire [63:0] x_mon_if_arsideband_m24;
assign x_mon_if_arsideband_m24 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m25
wire [63:0] x_mon_if_arsideband_m25;
assign x_mon_if_arsideband_m25 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m26
wire [63:0] x_mon_if_arsideband_m26;
assign x_mon_if_arsideband_m26 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m27
wire [63:0] x_mon_if_arsideband_m27;
assign x_mon_if_arsideband_m27 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m28
wire [63:0] x_mon_if_arsideband_m28;
assign x_mon_if_arsideband_m28 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m29
wire [63:0] x_mon_if_arsideband_m29;
assign x_mon_if_arsideband_m29 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m30
wire [63:0] x_mon_if_arsideband_m30;
assign x_mon_if_arsideband_m30 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: arsideband_m31
wire [63:0] x_mon_if_arsideband_m31;
assign x_mon_if_arsideband_m31 = test_DW_axi_x2p. arsideband_nu;

// Interface: x_mon_if Signal: rsideband_m0
wire [63:0] x_mon_if_rsideband_m0;
assign x_mon_if_rsideband_m0 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m1
wire [63:0] x_mon_if_rsideband_m1;
assign x_mon_if_rsideband_m1 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m2
wire [63:0] x_mon_if_rsideband_m2;
assign x_mon_if_rsideband_m2 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m3
wire [63:0] x_mon_if_rsideband_m3;
assign x_mon_if_rsideband_m3 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m4
wire [63:0] x_mon_if_rsideband_m4;
assign x_mon_if_rsideband_m4 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m5
wire [63:0] x_mon_if_rsideband_m5;
assign x_mon_if_rsideband_m5 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m6
wire [63:0] x_mon_if_rsideband_m6;
assign x_mon_if_rsideband_m6 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m7
wire [63:0] x_mon_if_rsideband_m7;
assign x_mon_if_rsideband_m7 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m8
wire [63:0] x_mon_if_rsideband_m8;
assign x_mon_if_rsideband_m8 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m9
wire [63:0] x_mon_if_rsideband_m9;
assign x_mon_if_rsideband_m9 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m10
wire [63:0] x_mon_if_rsideband_m10;
assign x_mon_if_rsideband_m10 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m11
wire [63:0] x_mon_if_rsideband_m11;
assign x_mon_if_rsideband_m11 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m12
wire [63:0] x_mon_if_rsideband_m12;
assign x_mon_if_rsideband_m12 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m13
wire [63:0] x_mon_if_rsideband_m13;
assign x_mon_if_rsideband_m13 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m14
wire [63:0] x_mon_if_rsideband_m14;
assign x_mon_if_rsideband_m14 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m15
wire [63:0] x_mon_if_rsideband_m15;
assign x_mon_if_rsideband_m15 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m16
wire [63:0] x_mon_if_rsideband_m16;
assign x_mon_if_rsideband_m16 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m17
wire [63:0] x_mon_if_rsideband_m17;
assign x_mon_if_rsideband_m17 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m18
wire [63:0] x_mon_if_rsideband_m18;
assign x_mon_if_rsideband_m18 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m19
wire [63:0] x_mon_if_rsideband_m19;
assign x_mon_if_rsideband_m19 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m20
wire [63:0] x_mon_if_rsideband_m20;
assign x_mon_if_rsideband_m20 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m21
wire [63:0] x_mon_if_rsideband_m21;
assign x_mon_if_rsideband_m21 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m22
wire [63:0] x_mon_if_rsideband_m22;
assign x_mon_if_rsideband_m22 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m23
wire [63:0] x_mon_if_rsideband_m23;
assign x_mon_if_rsideband_m23 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m24
wire [63:0] x_mon_if_rsideband_m24;
assign x_mon_if_rsideband_m24 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m25
wire [63:0] x_mon_if_rsideband_m25;
assign x_mon_if_rsideband_m25 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m26
wire [63:0] x_mon_if_rsideband_m26;
assign x_mon_if_rsideband_m26 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m27
wire [63:0] x_mon_if_rsideband_m27;
assign x_mon_if_rsideband_m27 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m28
wire [63:0] x_mon_if_rsideband_m28;
assign x_mon_if_rsideband_m28 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m29
wire [63:0] x_mon_if_rsideband_m29;
assign x_mon_if_rsideband_m29 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m30
wire [63:0] x_mon_if_rsideband_m30;
assign x_mon_if_rsideband_m30 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: rsideband_m31
wire [63:0] x_mon_if_rsideband_m31;
assign x_mon_if_rsideband_m31 = test_DW_axi_x2p. rsideband_nu;

// Interface: x_mon_if Signal: wsideband_m0
wire [63:0] x_mon_if_wsideband_m0;
assign x_mon_if_wsideband_m0 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m1
wire [63:0] x_mon_if_wsideband_m1;
assign x_mon_if_wsideband_m1 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m2
wire [63:0] x_mon_if_wsideband_m2;
assign x_mon_if_wsideband_m2 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m3
wire [63:0] x_mon_if_wsideband_m3;
assign x_mon_if_wsideband_m3 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m4
wire [63:0] x_mon_if_wsideband_m4;
assign x_mon_if_wsideband_m4 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m5
wire [63:0] x_mon_if_wsideband_m5;
assign x_mon_if_wsideband_m5 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m6
wire [63:0] x_mon_if_wsideband_m6;
assign x_mon_if_wsideband_m6 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m7
wire [63:0] x_mon_if_wsideband_m7;
assign x_mon_if_wsideband_m7 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m8
wire [63:0] x_mon_if_wsideband_m8;
assign x_mon_if_wsideband_m8 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m9
wire [63:0] x_mon_if_wsideband_m9;
assign x_mon_if_wsideband_m9 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m10
wire [63:0] x_mon_if_wsideband_m10;
assign x_mon_if_wsideband_m10 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m11
wire [63:0] x_mon_if_wsideband_m11;
assign x_mon_if_wsideband_m11 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m12
wire [63:0] x_mon_if_wsideband_m12;
assign x_mon_if_wsideband_m12 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m13
wire [63:0] x_mon_if_wsideband_m13;
assign x_mon_if_wsideband_m13 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m14
wire [63:0] x_mon_if_wsideband_m14;
assign x_mon_if_wsideband_m14 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m15
wire [63:0] x_mon_if_wsideband_m15;
assign x_mon_if_wsideband_m15 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m16
wire [63:0] x_mon_if_wsideband_m16;
assign x_mon_if_wsideband_m16 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m17
wire [63:0] x_mon_if_wsideband_m17;
assign x_mon_if_wsideband_m17 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m18
wire [63:0] x_mon_if_wsideband_m18;
assign x_mon_if_wsideband_m18 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m19
wire [63:0] x_mon_if_wsideband_m19;
assign x_mon_if_wsideband_m19 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m20
wire [63:0] x_mon_if_wsideband_m20;
assign x_mon_if_wsideband_m20 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m21
wire [63:0] x_mon_if_wsideband_m21;
assign x_mon_if_wsideband_m21 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m22
wire [63:0] x_mon_if_wsideband_m22;
assign x_mon_if_wsideband_m22 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m23
wire [63:0] x_mon_if_wsideband_m23;
assign x_mon_if_wsideband_m23 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m24
wire [63:0] x_mon_if_wsideband_m24;
assign x_mon_if_wsideband_m24 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m25
wire [63:0] x_mon_if_wsideband_m25;
assign x_mon_if_wsideband_m25 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m26
wire [63:0] x_mon_if_wsideband_m26;
assign x_mon_if_wsideband_m26 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m27
wire [63:0] x_mon_if_wsideband_m27;
assign x_mon_if_wsideband_m27 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m28
wire [63:0] x_mon_if_wsideband_m28;
assign x_mon_if_wsideband_m28 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m29
wire [63:0] x_mon_if_wsideband_m29;
assign x_mon_if_wsideband_m29 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m30
wire [63:0] x_mon_if_wsideband_m30;
assign x_mon_if_wsideband_m30 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: wsideband_m31
wire [63:0] x_mon_if_wsideband_m31;
assign x_mon_if_wsideband_m31 = test_DW_axi_x2p. wsideband_nu;

// Interface: x_mon_if Signal: bsideband_m0
wire [63:0] x_mon_if_bsideband_m0;
assign x_mon_if_bsideband_m0 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m1
wire [63:0] x_mon_if_bsideband_m1;
assign x_mon_if_bsideband_m1 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m2
wire [63:0] x_mon_if_bsideband_m2;
assign x_mon_if_bsideband_m2 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m3
wire [63:0] x_mon_if_bsideband_m3;
assign x_mon_if_bsideband_m3 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m4
wire [63:0] x_mon_if_bsideband_m4;
assign x_mon_if_bsideband_m4 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m5
wire [63:0] x_mon_if_bsideband_m5;
assign x_mon_if_bsideband_m5 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m6
wire [63:0] x_mon_if_bsideband_m6;
assign x_mon_if_bsideband_m6 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m7
wire [63:0] x_mon_if_bsideband_m7;
assign x_mon_if_bsideband_m7 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m8
wire [63:0] x_mon_if_bsideband_m8;
assign x_mon_if_bsideband_m8 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m9
wire [63:0] x_mon_if_bsideband_m9;
assign x_mon_if_bsideband_m9 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m10
wire [63:0] x_mon_if_bsideband_m10;
assign x_mon_if_bsideband_m10 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m11
wire [63:0] x_mon_if_bsideband_m11;
assign x_mon_if_bsideband_m11 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m12
wire [63:0] x_mon_if_bsideband_m12;
assign x_mon_if_bsideband_m12 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m13
wire [63:0] x_mon_if_bsideband_m13;
assign x_mon_if_bsideband_m13 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m14
wire [63:0] x_mon_if_bsideband_m14;
assign x_mon_if_bsideband_m14 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m15
wire [63:0] x_mon_if_bsideband_m15;
assign x_mon_if_bsideband_m15 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m16
wire [63:0] x_mon_if_bsideband_m16;
assign x_mon_if_bsideband_m16 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m17
wire [63:0] x_mon_if_bsideband_m17;
assign x_mon_if_bsideband_m17 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m18
wire [63:0] x_mon_if_bsideband_m18;
assign x_mon_if_bsideband_m18 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m19
wire [63:0] x_mon_if_bsideband_m19;
assign x_mon_if_bsideband_m19 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m20
wire [63:0] x_mon_if_bsideband_m20;
assign x_mon_if_bsideband_m20 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m21
wire [63:0] x_mon_if_bsideband_m21;
assign x_mon_if_bsideband_m21 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m22
wire [63:0] x_mon_if_bsideband_m22;
assign x_mon_if_bsideband_m22 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m23
wire [63:0] x_mon_if_bsideband_m23;
assign x_mon_if_bsideband_m23 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m24
wire [63:0] x_mon_if_bsideband_m24;
assign x_mon_if_bsideband_m24 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m25
wire [63:0] x_mon_if_bsideband_m25;
assign x_mon_if_bsideband_m25 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m26
wire [63:0] x_mon_if_bsideband_m26;
assign x_mon_if_bsideband_m26 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m27
wire [63:0] x_mon_if_bsideband_m27;
assign x_mon_if_bsideband_m27 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m28
wire [63:0] x_mon_if_bsideband_m28;
assign x_mon_if_bsideband_m28 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m29
wire [63:0] x_mon_if_bsideband_m29;
assign x_mon_if_bsideband_m29 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m30
wire [63:0] x_mon_if_bsideband_m30;
assign x_mon_if_bsideband_m30 = test_DW_axi_x2p. bsideband_nu;

// Interface: x_mon_if Signal: bsideband_m31
wire [63:0] x_mon_if_bsideband_m31;
assign x_mon_if_bsideband_m31 = test_DW_axi_x2p. bsideband_nu;


// Misc variables
integer vmcint_prog_id;

// Global Variables at top block


// Initial driver state
initial
begin
  vmc_pslv_if_presetn_reg = 1'bz;
  vmc_pslv_if_paddr_reg = 32'bz;
  vmc_pslv_if_pwrite_reg = 1'bz;
  vmc_pslv_if_pwdata_reg = 32'bz;
  vmc_pslv_if_prdata_reg = 32'bz;
  vmc_pslv_if_prdata_s0_reg = 32'bz;
  vmc_pslv_if_prdata_s1_reg = 32'bz;
  vmc_pslv_if_prdata_s2_reg = 32'bz;
  vmc_pslv_if_prdata_s3_reg = 32'bz;
  vmc_pslv_if_prdata_s4_reg = 32'bz;
  vmc_pslv_if_prdata_s5_reg = 32'bz;
  vmc_pslv_if_prdata_s6_reg = 32'bz;
  vmc_pslv_if_prdata_s7_reg = 32'bz;
  vmc_pslv_if_prdata_s8_reg = 32'bz;
  vmc_pslv_if_prdata_s9_reg = 32'bz;
  vmc_pslv_if_prdata_s10_reg = 32'bz;
  vmc_pslv_if_prdata_s11_reg = 32'bz;
  vmc_pslv_if_prdata_s12_reg = 32'bz;
  vmc_pslv_if_prdata_s13_reg = 32'bz;
  vmc_pslv_if_prdata_s14_reg = 32'bz;
  vmc_pslv_if_prdata_s15_reg = 32'bz;
  vmc_pslv_if_pready_s0_reg = 1'bz;
  vmc_pslv_if_pready_s1_reg = 1'bz;
  vmc_pslv_if_pready_s2_reg = 1'bz;
  vmc_pslv_if_pready_s3_reg = 1'bz;
  vmc_pslv_if_pready_s4_reg = 1'bz;
  vmc_pslv_if_pready_s5_reg = 1'bz;
  vmc_pslv_if_pready_s6_reg = 1'bz;
  vmc_pslv_if_pready_s7_reg = 1'bz;
  vmc_pslv_if_pready_s8_reg = 1'bz;
  vmc_pslv_if_pready_s9_reg = 1'bz;
  vmc_pslv_if_pready_s10_reg = 1'bz;
  vmc_pslv_if_pready_s11_reg = 1'bz;
  vmc_pslv_if_pready_s12_reg = 1'bz;
  vmc_pslv_if_pready_s13_reg = 1'bz;
  vmc_pslv_if_pready_s14_reg = 1'bz;
  vmc_pslv_if_pready_s15_reg = 1'bz;
  vmc_pslv_if_pslverr_s0_reg = 1'bz;
  vmc_pslv_if_pslverr_s1_reg = 1'bz;
  vmc_pslv_if_pslverr_s2_reg = 1'bz;
  vmc_pslv_if_pslverr_s3_reg = 1'bz;
  vmc_pslv_if_pslverr_s4_reg = 1'bz;
  vmc_pslv_if_pslverr_s5_reg = 1'bz;
  vmc_pslv_if_pslverr_s6_reg = 1'bz;
  vmc_pslv_if_pslverr_s7_reg = 1'bz;
  vmc_pslv_if_pslverr_s8_reg = 1'bz;
  vmc_pslv_if_pslverr_s9_reg = 1'bz;
  vmc_pslv_if_pslverr_s10_reg = 1'bz;
  vmc_pslv_if_pslverr_s11_reg = 1'bz;
  vmc_pslv_if_pslverr_s12_reg = 1'bz;
  vmc_pslv_if_pslverr_s13_reg = 1'bz;
  vmc_pslv_if_pslverr_s14_reg = 1'bz;
  vmc_pslv_if_pslverr_s15_reg = 1'bz;
  vmc_pslv_if_pready_nu_reg = 1'bz;
  vmc_pslv_if_prdata_nu_reg = 32'bz;
  vmc_pslv_if_pslverr_nu_reg = 1'bz;
  vmc_axm0_if_aresetn_reg = 1'bz;
  vmc_axm0_if_awvalid_reg = 1'bz;
  vmc_axm0_if_awaddr_reg = 64'bz;
  vmc_axm0_if_awlen_reg = 10'bz;
  vmc_axm0_if_awsize_reg = 3'bz;
  vmc_axm0_if_awburst_reg = 2'bz;
  vmc_axm0_if_awlock_reg = 2'bz;
  vmc_axm0_if_awcache_reg = 4'bz;
  vmc_axm0_if_awprot_reg = 3'bz;
  vmc_axm0_if_awid_reg = 32'bz;
  vmc_axm0_if_awready_reg = 1'bz;
  vmc_axm0_if_arvalid_reg = 1'bz;
  vmc_axm0_if_araddr_reg = 64'bz;
  vmc_axm0_if_arlen_reg = 10'bz;
  vmc_axm0_if_arsize_reg = 3'bz;
  vmc_axm0_if_arburst_reg = 2'bz;
  vmc_axm0_if_arlock_reg = 2'bz;
  vmc_axm0_if_arcache_reg = 4'bz;
  vmc_axm0_if_arprot_reg = 3'bz;
  vmc_axm0_if_arid_reg = 32'bz;
  vmc_axm0_if_arready_reg = 1'bz;
  vmc_axm0_if_rvalid_reg = 1'bz;
  vmc_axm0_if_rlast_reg = 1'bz;
  vmc_axm0_if_rdata_reg = 1024'bz;
  vmc_axm0_if_rresp_reg = 2'bz;
  vmc_axm0_if_rid_reg = 32'bz;
  vmc_axm0_if_rready_reg = 1'bz;
  vmc_axm0_if_wvalid_reg = 1'bz;
  vmc_axm0_if_wlast_reg = 1'bz;
  vmc_axm0_if_wdata_reg = 1024'bz;
  vmc_axm0_if_wstrb_reg = 128'bz;
  vmc_axm0_if_wid_reg = 32'bz;
  vmc_axm0_if_bvalid_reg = 1'bz;
  vmc_axm0_if_bresp_reg = 2'bz;
  vmc_axm0_if_bid_reg = 32'bz;
  vmc_axm0_if_bready_reg = 1'bz;
  vmc_axm0_if_csysreq_reg = 1'bz;
  vmc_axm0_if_csysack_reg = 1'bz;
  vmc_axm0_if_cactive_reg = 1'bz;
  vmc_axm0_if_awsideband_reg = 64'bz;
  vmc_axm0_if_arsideband_reg = 64'bz;
  vmc_axm0_if_rsideband_reg = 64'bz;
  vmc_axm0_if_wsideband_reg = 64'bz;
  vmc_axm0_if_bsideband_reg = 64'bz;
  vmc_tb_if_force_a_reset_reg = 1'bz;
  vmc_tb_if_force_b_reset_reg = 1'bz;
  vmc_tb_if_cvrgen_reg = 1'bz;
end

initial
begin

    $vmc_init();
    vmcint_prog_id = $vmc_setup_start("test_DW_axi_x2p");
    $vera_add_parameter("vera_shell_version", "1.0", 2);

// Interface definition for VMC

    $vmc_system_clock(SystemClock);
    $vmc_add_interface_signal(1, 1, pslv_if_pclk, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 2, pslv_if_presetn, vmc_pslv_if_presetn_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 3, pslv_if_psel, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 4, pslv_if_penable, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 5, pslv_if_paddr, vmc_pslv_if_paddr_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 6, pslv_if_pwrite, vmc_pslv_if_pwrite_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 7, pslv_if_pwdata, vmc_pslv_if_pwdata_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 8, pslv_if_prdata, vmc_pslv_if_prdata_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 9, pslv_if_prdata_s0, vmc_pslv_if_prdata_s0_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 10, pslv_if_prdata_s1, vmc_pslv_if_prdata_s1_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 11, pslv_if_prdata_s2, vmc_pslv_if_prdata_s2_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 12, pslv_if_prdata_s3, vmc_pslv_if_prdata_s3_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 13, pslv_if_prdata_s4, vmc_pslv_if_prdata_s4_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 14, pslv_if_prdata_s5, vmc_pslv_if_prdata_s5_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 15, pslv_if_prdata_s6, vmc_pslv_if_prdata_s6_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 16, pslv_if_prdata_s7, vmc_pslv_if_prdata_s7_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 17, pslv_if_prdata_s8, vmc_pslv_if_prdata_s8_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 18, pslv_if_prdata_s9, vmc_pslv_if_prdata_s9_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 19, pslv_if_prdata_s10, vmc_pslv_if_prdata_s10_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 20, pslv_if_prdata_s11, vmc_pslv_if_prdata_s11_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 21, pslv_if_prdata_s12, vmc_pslv_if_prdata_s12_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 22, pslv_if_prdata_s13, vmc_pslv_if_prdata_s13_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 23, pslv_if_prdata_s14, vmc_pslv_if_prdata_s14_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 24, pslv_if_prdata_s15, vmc_pslv_if_prdata_s15_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 25, pslv_if_pready, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 26, pslv_if_pready_s0, vmc_pslv_if_pready_s0_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 27, pslv_if_pready_s1, vmc_pslv_if_pready_s1_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 28, pslv_if_pready_s2, vmc_pslv_if_pready_s2_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 29, pslv_if_pready_s3, vmc_pslv_if_pready_s3_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 30, pslv_if_pready_s4, vmc_pslv_if_pready_s4_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 31, pslv_if_pready_s5, vmc_pslv_if_pready_s5_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 32, pslv_if_pready_s6, vmc_pslv_if_pready_s6_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 33, pslv_if_pready_s7, vmc_pslv_if_pready_s7_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 34, pslv_if_pready_s8, vmc_pslv_if_pready_s8_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 35, pslv_if_pready_s9, vmc_pslv_if_pready_s9_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 36, pslv_if_pready_s10, vmc_pslv_if_pready_s10_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 37, pslv_if_pready_s11, vmc_pslv_if_pready_s11_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 38, pslv_if_pready_s12, vmc_pslv_if_pready_s12_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 39, pslv_if_pready_s13, vmc_pslv_if_pready_s13_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 40, pslv_if_pready_s14, vmc_pslv_if_pready_s14_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 41, pslv_if_pready_s15, vmc_pslv_if_pready_s15_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 42, pslv_if_pslverr, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 43, pslv_if_pslverr_s0, vmc_pslv_if_pslverr_s0_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 44, pslv_if_pslverr_s1, vmc_pslv_if_pslverr_s1_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 45, pslv_if_pslverr_s2, vmc_pslv_if_pslverr_s2_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 46, pslv_if_pslverr_s3, vmc_pslv_if_pslverr_s3_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 47, pslv_if_pslverr_s4, vmc_pslv_if_pslverr_s4_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 48, pslv_if_pslverr_s5, vmc_pslv_if_pslverr_s5_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 49, pslv_if_pslverr_s6, vmc_pslv_if_pslverr_s6_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 50, pslv_if_pslverr_s7, vmc_pslv_if_pslverr_s7_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 51, pslv_if_pslverr_s8, vmc_pslv_if_pslverr_s8_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 52, pslv_if_pslverr_s9, vmc_pslv_if_pslverr_s9_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 53, pslv_if_pslverr_s10, vmc_pslv_if_pslverr_s10_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 54, pslv_if_pslverr_s11, vmc_pslv_if_pslverr_s11_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 55, pslv_if_pslverr_s12, vmc_pslv_if_pslverr_s12_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 56, pslv_if_pslverr_s13, vmc_pslv_if_pslverr_s13_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 57, pslv_if_pslverr_s14, vmc_pslv_if_pslverr_s14_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 58, pslv_if_pslverr_s15, vmc_pslv_if_pslverr_s15_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 59, pslv_if_psel_nu, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 60, pslv_if_penable_nu, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 61, pslv_if_paddr_nu, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 62, pslv_if_pwrite_nu, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 63, pslv_if_pwdata_nu, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 64, pslv_if_pready_nu, vmc_pslv_if_pready_nu_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 65, pslv_if_prdata_nu, vmc_pslv_if_prdata_nu_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(1, 66, pslv_if_pslverr_nu, vmc_pslv_if_pslverr_nu_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 1, axm0_if_aclk, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 2, axm0_if_aresetn, vmc_axm0_if_aresetn_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 3, axm0_if_awvalid, vmc_axm0_if_awvalid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 4, axm0_if_awaddr, vmc_axm0_if_awaddr_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 5, axm0_if_awlen, vmc_axm0_if_awlen_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 6, axm0_if_awsize, vmc_axm0_if_awsize_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 7, axm0_if_awburst, vmc_axm0_if_awburst_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 8, axm0_if_awlock, vmc_axm0_if_awlock_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 9, axm0_if_awcache, vmc_axm0_if_awcache_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 10, axm0_if_awprot, vmc_axm0_if_awprot_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 11, axm0_if_awid, vmc_axm0_if_awid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 12, axm0_if_awready, vmc_axm0_if_awready_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 13, axm0_if_arvalid, vmc_axm0_if_arvalid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 14, axm0_if_araddr, vmc_axm0_if_araddr_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 15, axm0_if_arlen, vmc_axm0_if_arlen_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 16, axm0_if_arsize, vmc_axm0_if_arsize_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 17, axm0_if_arburst, vmc_axm0_if_arburst_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 18, axm0_if_arlock, vmc_axm0_if_arlock_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 19, axm0_if_arcache, vmc_axm0_if_arcache_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 20, axm0_if_arprot, vmc_axm0_if_arprot_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 21, axm0_if_arid, vmc_axm0_if_arid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 22, axm0_if_arready, vmc_axm0_if_arready_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 23, axm0_if_rvalid, vmc_axm0_if_rvalid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 24, axm0_if_rlast, vmc_axm0_if_rlast_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 25, axm0_if_rdata, vmc_axm0_if_rdata_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 26, axm0_if_rresp, vmc_axm0_if_rresp_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 27, axm0_if_rid, vmc_axm0_if_rid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 28, axm0_if_rready, vmc_axm0_if_rready_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 29, axm0_if_wvalid, vmc_axm0_if_wvalid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 30, axm0_if_wlast, vmc_axm0_if_wlast_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 31, axm0_if_wdata, vmc_axm0_if_wdata_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 32, axm0_if_wstrb, vmc_axm0_if_wstrb_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 33, axm0_if_wid, vmc_axm0_if_wid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 34, axm0_if_wready, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 35, axm0_if_bvalid, vmc_axm0_if_bvalid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 36, axm0_if_bresp, vmc_axm0_if_bresp_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 37, axm0_if_bid, vmc_axm0_if_bid_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 38, axm0_if_bready, vmc_axm0_if_bready_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 39, axm0_if_csysreq, vmc_axm0_if_csysreq_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 40, axm0_if_csysack, vmc_axm0_if_csysack_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 41, axm0_if_cactive, vmc_axm0_if_cactive_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 42, axm0_if_awsideband, vmc_axm0_if_awsideband_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 43, axm0_if_arsideband, vmc_axm0_if_arsideband_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 44, axm0_if_rsideband, vmc_axm0_if_rsideband_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 45, axm0_if_wsideband, vmc_axm0_if_wsideband_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(2, 46, axm0_if_bsideband, vmc_axm0_if_bsideband_reg, 3, 2, -1, 1, 1, 1, 1, 1, 1, 1, 1 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 1, tb_if_hclk, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 2, tb_if_force_a_reset, vmc_tb_if_force_a_reset_reg, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 3, tb_if_force_b_reset, vmc_tb_if_force_b_reset_reg, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 4, tb_if_sim_a_clk_period, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 5, tb_if_sim_b_clk_period, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(3, 6, tb_if_cvrgen, vmc_tb_if_cvrgen_reg, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1, x_mon_if_arvalid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2, x_mon_if_arvalid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 3, x_mon_if_arvalid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 4, x_mon_if_arvalid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 5, x_mon_if_arvalid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 6, x_mon_if_arvalid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 7, x_mon_if_arvalid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 8, x_mon_if_arvalid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 9, x_mon_if_arvalid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 10, x_mon_if_arvalid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 11, x_mon_if_arvalid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 12, x_mon_if_arvalid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 13, x_mon_if_arvalid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 14, x_mon_if_arvalid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 15, x_mon_if_arvalid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 16, x_mon_if_arvalid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 17, x_mon_if_arvalid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 18, x_mon_if_arvalid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 19, x_mon_if_arvalid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 20, x_mon_if_arvalid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 21, x_mon_if_arvalid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 22, x_mon_if_arvalid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 23, x_mon_if_arvalid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 24, x_mon_if_arvalid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 25, x_mon_if_arvalid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 26, x_mon_if_arvalid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 27, x_mon_if_arvalid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 28, x_mon_if_arvalid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 29, x_mon_if_arvalid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 30, x_mon_if_arvalid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 31, x_mon_if_arvalid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 32, x_mon_if_araddr_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 33, x_mon_if_araddr_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 34, x_mon_if_araddr_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 35, x_mon_if_araddr_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 36, x_mon_if_araddr_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 37, x_mon_if_araddr_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 38, x_mon_if_araddr_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 39, x_mon_if_araddr_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 40, x_mon_if_araddr_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 41, x_mon_if_araddr_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 42, x_mon_if_araddr_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 43, x_mon_if_araddr_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 44, x_mon_if_araddr_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 45, x_mon_if_araddr_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 46, x_mon_if_araddr_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 47, x_mon_if_araddr_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 48, x_mon_if_araddr_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 49, x_mon_if_araddr_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 50, x_mon_if_araddr_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 51, x_mon_if_araddr_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 52, x_mon_if_araddr_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 53, x_mon_if_araddr_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 54, x_mon_if_araddr_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 55, x_mon_if_araddr_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 56, x_mon_if_araddr_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 57, x_mon_if_araddr_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 58, x_mon_if_araddr_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 59, x_mon_if_araddr_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 60, x_mon_if_araddr_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 61, x_mon_if_araddr_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 62, x_mon_if_araddr_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 63, x_mon_if_arlen_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 64, x_mon_if_arlen_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 65, x_mon_if_arlen_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 66, x_mon_if_arlen_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 67, x_mon_if_arlen_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 68, x_mon_if_arlen_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 69, x_mon_if_arlen_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 70, x_mon_if_arlen_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 71, x_mon_if_arlen_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 72, x_mon_if_arlen_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 73, x_mon_if_arlen_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 74, x_mon_if_arlen_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 75, x_mon_if_arlen_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 76, x_mon_if_arlen_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 77, x_mon_if_arlen_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 78, x_mon_if_arlen_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 79, x_mon_if_arlen_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 80, x_mon_if_arlen_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 81, x_mon_if_arlen_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 82, x_mon_if_arlen_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 83, x_mon_if_arlen_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 84, x_mon_if_arlen_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 85, x_mon_if_arlen_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 86, x_mon_if_arlen_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 87, x_mon_if_arlen_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 88, x_mon_if_arlen_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 89, x_mon_if_arlen_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 90, x_mon_if_arlen_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 91, x_mon_if_arlen_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 92, x_mon_if_arlen_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 93, x_mon_if_arlen_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 94, x_mon_if_arsize_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 95, x_mon_if_arsize_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 96, x_mon_if_arsize_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 97, x_mon_if_arsize_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 98, x_mon_if_arsize_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 99, x_mon_if_arsize_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 100, x_mon_if_arsize_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 101, x_mon_if_arsize_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 102, x_mon_if_arsize_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 103, x_mon_if_arsize_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 104, x_mon_if_arsize_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 105, x_mon_if_arsize_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 106, x_mon_if_arsize_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 107, x_mon_if_arsize_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 108, x_mon_if_arsize_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 109, x_mon_if_arsize_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 110, x_mon_if_arsize_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 111, x_mon_if_arsize_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 112, x_mon_if_arsize_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 113, x_mon_if_arsize_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 114, x_mon_if_arsize_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 115, x_mon_if_arsize_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 116, x_mon_if_arsize_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 117, x_mon_if_arsize_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 118, x_mon_if_arsize_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 119, x_mon_if_arsize_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 120, x_mon_if_arsize_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 121, x_mon_if_arsize_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 122, x_mon_if_arsize_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 123, x_mon_if_arsize_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 124, x_mon_if_arsize_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 125, x_mon_if_arburst_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 126, x_mon_if_arburst_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 127, x_mon_if_arburst_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 128, x_mon_if_arburst_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 129, x_mon_if_arburst_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 130, x_mon_if_arburst_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 131, x_mon_if_arburst_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 132, x_mon_if_arburst_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 133, x_mon_if_arburst_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 134, x_mon_if_arburst_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 135, x_mon_if_arburst_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 136, x_mon_if_arburst_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 137, x_mon_if_arburst_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 138, x_mon_if_arburst_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 139, x_mon_if_arburst_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 140, x_mon_if_arburst_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 141, x_mon_if_arburst_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 142, x_mon_if_arburst_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 143, x_mon_if_arburst_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 144, x_mon_if_arburst_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 145, x_mon_if_arburst_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 146, x_mon_if_arburst_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 147, x_mon_if_arburst_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 148, x_mon_if_arburst_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 149, x_mon_if_arburst_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 150, x_mon_if_arburst_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 151, x_mon_if_arburst_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 152, x_mon_if_arburst_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 153, x_mon_if_arburst_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 154, x_mon_if_arburst_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 155, x_mon_if_arburst_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 156, x_mon_if_arlock_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 157, x_mon_if_arlock_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 158, x_mon_if_arlock_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 159, x_mon_if_arlock_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 160, x_mon_if_arlock_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 161, x_mon_if_arlock_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 162, x_mon_if_arlock_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 163, x_mon_if_arlock_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 164, x_mon_if_arlock_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 165, x_mon_if_arlock_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 166, x_mon_if_arlock_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 167, x_mon_if_arlock_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 168, x_mon_if_arlock_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 169, x_mon_if_arlock_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 170, x_mon_if_arlock_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 171, x_mon_if_arlock_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 172, x_mon_if_arlock_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 173, x_mon_if_arlock_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 174, x_mon_if_arlock_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 175, x_mon_if_arlock_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 176, x_mon_if_arlock_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 177, x_mon_if_arlock_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 178, x_mon_if_arlock_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 179, x_mon_if_arlock_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 180, x_mon_if_arlock_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 181, x_mon_if_arlock_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 182, x_mon_if_arlock_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 183, x_mon_if_arlock_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 184, x_mon_if_arlock_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 185, x_mon_if_arlock_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 186, x_mon_if_arlock_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 187, x_mon_if_arcache_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 188, x_mon_if_arcache_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 189, x_mon_if_arcache_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 190, x_mon_if_arcache_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 191, x_mon_if_arcache_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 192, x_mon_if_arcache_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 193, x_mon_if_arcache_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 194, x_mon_if_arcache_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 195, x_mon_if_arcache_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 196, x_mon_if_arcache_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 197, x_mon_if_arcache_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 198, x_mon_if_arcache_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 199, x_mon_if_arcache_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 200, x_mon_if_arcache_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 201, x_mon_if_arcache_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 202, x_mon_if_arcache_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 203, x_mon_if_arcache_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 204, x_mon_if_arcache_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 205, x_mon_if_arcache_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 206, x_mon_if_arcache_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 207, x_mon_if_arcache_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 208, x_mon_if_arcache_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 209, x_mon_if_arcache_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 210, x_mon_if_arcache_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 211, x_mon_if_arcache_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 212, x_mon_if_arcache_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 213, x_mon_if_arcache_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 214, x_mon_if_arcache_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 215, x_mon_if_arcache_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 216, x_mon_if_arcache_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 217, x_mon_if_arcache_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 218, x_mon_if_arprot_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 219, x_mon_if_arprot_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 220, x_mon_if_arprot_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 221, x_mon_if_arprot_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 222, x_mon_if_arprot_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 223, x_mon_if_arprot_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 224, x_mon_if_arprot_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 225, x_mon_if_arprot_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 226, x_mon_if_arprot_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 227, x_mon_if_arprot_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 228, x_mon_if_arprot_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 229, x_mon_if_arprot_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 230, x_mon_if_arprot_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 231, x_mon_if_arprot_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 232, x_mon_if_arprot_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 233, x_mon_if_arprot_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 234, x_mon_if_arprot_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 235, x_mon_if_arprot_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 236, x_mon_if_arprot_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 237, x_mon_if_arprot_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 238, x_mon_if_arprot_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 239, x_mon_if_arprot_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 240, x_mon_if_arprot_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 241, x_mon_if_arprot_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 242, x_mon_if_arprot_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 243, x_mon_if_arprot_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 244, x_mon_if_arprot_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 245, x_mon_if_arprot_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 246, x_mon_if_arprot_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 247, x_mon_if_arprot_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 248, x_mon_if_arprot_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 249, x_mon_if_arid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 250, x_mon_if_arid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 251, x_mon_if_arid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 252, x_mon_if_arid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 253, x_mon_if_arid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 254, x_mon_if_arid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 255, x_mon_if_arid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 256, x_mon_if_arid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 257, x_mon_if_arid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 258, x_mon_if_arid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 259, x_mon_if_arid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 260, x_mon_if_arid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 261, x_mon_if_arid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 262, x_mon_if_arid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 263, x_mon_if_arid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 264, x_mon_if_arid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 265, x_mon_if_arid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 266, x_mon_if_arid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 267, x_mon_if_arid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 268, x_mon_if_arid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 269, x_mon_if_arid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 270, x_mon_if_arid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 271, x_mon_if_arid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 272, x_mon_if_arid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 273, x_mon_if_arid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 274, x_mon_if_arid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 275, x_mon_if_arid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 276, x_mon_if_arid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 277, x_mon_if_arid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 278, x_mon_if_arid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 279, x_mon_if_arid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 280, x_mon_if_arready_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 281, x_mon_if_arready_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 282, x_mon_if_arready_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 283, x_mon_if_arready_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 284, x_mon_if_arready_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 285, x_mon_if_arready_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 286, x_mon_if_arready_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 287, x_mon_if_arready_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 288, x_mon_if_arready_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 289, x_mon_if_arready_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 290, x_mon_if_arready_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 291, x_mon_if_arready_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 292, x_mon_if_arready_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 293, x_mon_if_arready_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 294, x_mon_if_arready_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 295, x_mon_if_arready_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 296, x_mon_if_arready_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 297, x_mon_if_arready_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 298, x_mon_if_arready_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 299, x_mon_if_arready_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 300, x_mon_if_arready_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 301, x_mon_if_arready_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 302, x_mon_if_arready_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 303, x_mon_if_arready_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 304, x_mon_if_arready_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 305, x_mon_if_arready_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 306, x_mon_if_arready_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 307, x_mon_if_arready_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 308, x_mon_if_arready_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 309, x_mon_if_arready_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 310, x_mon_if_arready_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 311, x_mon_if_awvalid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 312, x_mon_if_awvalid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 313, x_mon_if_awvalid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 314, x_mon_if_awvalid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 315, x_mon_if_awvalid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 316, x_mon_if_awvalid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 317, x_mon_if_awvalid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 318, x_mon_if_awvalid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 319, x_mon_if_awvalid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 320, x_mon_if_awvalid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 321, x_mon_if_awvalid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 322, x_mon_if_awvalid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 323, x_mon_if_awvalid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 324, x_mon_if_awvalid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 325, x_mon_if_awvalid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 326, x_mon_if_awvalid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 327, x_mon_if_awvalid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 328, x_mon_if_awvalid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 329, x_mon_if_awvalid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 330, x_mon_if_awvalid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 331, x_mon_if_awvalid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 332, x_mon_if_awvalid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 333, x_mon_if_awvalid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 334, x_mon_if_awvalid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 335, x_mon_if_awvalid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 336, x_mon_if_awvalid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 337, x_mon_if_awvalid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 338, x_mon_if_awvalid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 339, x_mon_if_awvalid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 340, x_mon_if_awvalid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 341, x_mon_if_awvalid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 342, x_mon_if_awaddr_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 343, x_mon_if_awaddr_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 344, x_mon_if_awaddr_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 345, x_mon_if_awaddr_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 346, x_mon_if_awaddr_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 347, x_mon_if_awaddr_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 348, x_mon_if_awaddr_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 349, x_mon_if_awaddr_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 350, x_mon_if_awaddr_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 351, x_mon_if_awaddr_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 352, x_mon_if_awaddr_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 353, x_mon_if_awaddr_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 354, x_mon_if_awaddr_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 355, x_mon_if_awaddr_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 356, x_mon_if_awaddr_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 357, x_mon_if_awaddr_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 358, x_mon_if_awaddr_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 359, x_mon_if_awaddr_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 360, x_mon_if_awaddr_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 361, x_mon_if_awaddr_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 362, x_mon_if_awaddr_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 363, x_mon_if_awaddr_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 364, x_mon_if_awaddr_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 365, x_mon_if_awaddr_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 366, x_mon_if_awaddr_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 367, x_mon_if_awaddr_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 368, x_mon_if_awaddr_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 369, x_mon_if_awaddr_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 370, x_mon_if_awaddr_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 371, x_mon_if_awaddr_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 372, x_mon_if_awaddr_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 373, x_mon_if_awlen_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 374, x_mon_if_awlen_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 375, x_mon_if_awlen_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 376, x_mon_if_awlen_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 377, x_mon_if_awlen_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 378, x_mon_if_awlen_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 379, x_mon_if_awlen_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 380, x_mon_if_awlen_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 381, x_mon_if_awlen_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 382, x_mon_if_awlen_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 383, x_mon_if_awlen_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 384, x_mon_if_awlen_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 385, x_mon_if_awlen_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 386, x_mon_if_awlen_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 387, x_mon_if_awlen_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 388, x_mon_if_awlen_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 389, x_mon_if_awlen_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 390, x_mon_if_awlen_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 391, x_mon_if_awlen_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 392, x_mon_if_awlen_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 393, x_mon_if_awlen_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 394, x_mon_if_awlen_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 395, x_mon_if_awlen_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 396, x_mon_if_awlen_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 397, x_mon_if_awlen_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 398, x_mon_if_awlen_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 399, x_mon_if_awlen_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 400, x_mon_if_awlen_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 401, x_mon_if_awlen_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 402, x_mon_if_awlen_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 403, x_mon_if_awlen_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 404, x_mon_if_awsize_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 405, x_mon_if_awsize_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 406, x_mon_if_awsize_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 407, x_mon_if_awsize_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 408, x_mon_if_awsize_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 409, x_mon_if_awsize_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 410, x_mon_if_awsize_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 411, x_mon_if_awsize_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 412, x_mon_if_awsize_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 413, x_mon_if_awsize_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 414, x_mon_if_awsize_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 415, x_mon_if_awsize_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 416, x_mon_if_awsize_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 417, x_mon_if_awsize_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 418, x_mon_if_awsize_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 419, x_mon_if_awsize_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 420, x_mon_if_awsize_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 421, x_mon_if_awsize_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 422, x_mon_if_awsize_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 423, x_mon_if_awsize_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 424, x_mon_if_awsize_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 425, x_mon_if_awsize_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 426, x_mon_if_awsize_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 427, x_mon_if_awsize_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 428, x_mon_if_awsize_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 429, x_mon_if_awsize_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 430, x_mon_if_awsize_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 431, x_mon_if_awsize_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 432, x_mon_if_awsize_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 433, x_mon_if_awsize_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 434, x_mon_if_awsize_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 435, x_mon_if_awburst_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 436, x_mon_if_awburst_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 437, x_mon_if_awburst_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 438, x_mon_if_awburst_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 439, x_mon_if_awburst_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 440, x_mon_if_awburst_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 441, x_mon_if_awburst_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 442, x_mon_if_awburst_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 443, x_mon_if_awburst_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 444, x_mon_if_awburst_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 445, x_mon_if_awburst_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 446, x_mon_if_awburst_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 447, x_mon_if_awburst_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 448, x_mon_if_awburst_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 449, x_mon_if_awburst_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 450, x_mon_if_awburst_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 451, x_mon_if_awburst_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 452, x_mon_if_awburst_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 453, x_mon_if_awburst_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 454, x_mon_if_awburst_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 455, x_mon_if_awburst_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 456, x_mon_if_awburst_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 457, x_mon_if_awburst_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 458, x_mon_if_awburst_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 459, x_mon_if_awburst_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 460, x_mon_if_awburst_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 461, x_mon_if_awburst_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 462, x_mon_if_awburst_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 463, x_mon_if_awburst_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 464, x_mon_if_awburst_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 465, x_mon_if_awburst_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 466, x_mon_if_awlock_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 467, x_mon_if_awlock_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 468, x_mon_if_awlock_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 469, x_mon_if_awlock_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 470, x_mon_if_awlock_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 471, x_mon_if_awlock_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 472, x_mon_if_awlock_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 473, x_mon_if_awlock_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 474, x_mon_if_awlock_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 475, x_mon_if_awlock_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 476, x_mon_if_awlock_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 477, x_mon_if_awlock_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 478, x_mon_if_awlock_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 479, x_mon_if_awlock_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 480, x_mon_if_awlock_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 481, x_mon_if_awlock_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 482, x_mon_if_awlock_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 483, x_mon_if_awlock_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 484, x_mon_if_awlock_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 485, x_mon_if_awlock_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 486, x_mon_if_awlock_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 487, x_mon_if_awlock_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 488, x_mon_if_awlock_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 489, x_mon_if_awlock_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 490, x_mon_if_awlock_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 491, x_mon_if_awlock_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 492, x_mon_if_awlock_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 493, x_mon_if_awlock_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 494, x_mon_if_awlock_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 495, x_mon_if_awlock_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 496, x_mon_if_awlock_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 497, x_mon_if_awcache_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 498, x_mon_if_awcache_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 499, x_mon_if_awcache_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 500, x_mon_if_awcache_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 501, x_mon_if_awcache_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 502, x_mon_if_awcache_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 503, x_mon_if_awcache_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 504, x_mon_if_awcache_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 505, x_mon_if_awcache_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 506, x_mon_if_awcache_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 507, x_mon_if_awcache_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 508, x_mon_if_awcache_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 509, x_mon_if_awcache_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 510, x_mon_if_awcache_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 511, x_mon_if_awcache_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 512, x_mon_if_awcache_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 513, x_mon_if_awcache_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 514, x_mon_if_awcache_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 515, x_mon_if_awcache_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 516, x_mon_if_awcache_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 517, x_mon_if_awcache_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 518, x_mon_if_awcache_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 519, x_mon_if_awcache_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 520, x_mon_if_awcache_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 521, x_mon_if_awcache_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 522, x_mon_if_awcache_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 523, x_mon_if_awcache_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 524, x_mon_if_awcache_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 525, x_mon_if_awcache_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 526, x_mon_if_awcache_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 527, x_mon_if_awcache_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 528, x_mon_if_awprot_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 529, x_mon_if_awprot_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 530, x_mon_if_awprot_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 531, x_mon_if_awprot_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 532, x_mon_if_awprot_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 533, x_mon_if_awprot_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 534, x_mon_if_awprot_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 535, x_mon_if_awprot_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 536, x_mon_if_awprot_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 537, x_mon_if_awprot_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 538, x_mon_if_awprot_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 539, x_mon_if_awprot_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 540, x_mon_if_awprot_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 541, x_mon_if_awprot_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 542, x_mon_if_awprot_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 543, x_mon_if_awprot_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 544, x_mon_if_awprot_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 545, x_mon_if_awprot_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 546, x_mon_if_awprot_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 547, x_mon_if_awprot_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 548, x_mon_if_awprot_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 549, x_mon_if_awprot_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 550, x_mon_if_awprot_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 551, x_mon_if_awprot_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 552, x_mon_if_awprot_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 553, x_mon_if_awprot_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 554, x_mon_if_awprot_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 555, x_mon_if_awprot_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 556, x_mon_if_awprot_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 557, x_mon_if_awprot_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 558, x_mon_if_awprot_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 559, x_mon_if_awid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 560, x_mon_if_awid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 561, x_mon_if_awid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 562, x_mon_if_awid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 563, x_mon_if_awid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 564, x_mon_if_awid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 565, x_mon_if_awid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 566, x_mon_if_awid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 567, x_mon_if_awid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 568, x_mon_if_awid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 569, x_mon_if_awid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 570, x_mon_if_awid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 571, x_mon_if_awid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 572, x_mon_if_awid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 573, x_mon_if_awid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 574, x_mon_if_awid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 575, x_mon_if_awid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 576, x_mon_if_awid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 577, x_mon_if_awid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 578, x_mon_if_awid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 579, x_mon_if_awid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 580, x_mon_if_awid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 581, x_mon_if_awid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 582, x_mon_if_awid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 583, x_mon_if_awid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 584, x_mon_if_awid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 585, x_mon_if_awid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 586, x_mon_if_awid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 587, x_mon_if_awid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 588, x_mon_if_awid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 589, x_mon_if_awid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 590, x_mon_if_awready_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 591, x_mon_if_awready_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 592, x_mon_if_awready_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 593, x_mon_if_awready_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 594, x_mon_if_awready_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 595, x_mon_if_awready_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 596, x_mon_if_awready_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 597, x_mon_if_awready_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 598, x_mon_if_awready_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 599, x_mon_if_awready_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 600, x_mon_if_awready_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 601, x_mon_if_awready_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 602, x_mon_if_awready_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 603, x_mon_if_awready_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 604, x_mon_if_awready_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 605, x_mon_if_awready_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 606, x_mon_if_awready_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 607, x_mon_if_awready_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 608, x_mon_if_awready_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 609, x_mon_if_awready_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 610, x_mon_if_awready_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 611, x_mon_if_awready_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 612, x_mon_if_awready_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 613, x_mon_if_awready_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 614, x_mon_if_awready_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 615, x_mon_if_awready_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 616, x_mon_if_awready_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 617, x_mon_if_awready_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 618, x_mon_if_awready_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 619, x_mon_if_awready_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 620, x_mon_if_awready_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 621, x_mon_if_rvalid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 622, x_mon_if_rvalid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 623, x_mon_if_rvalid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 624, x_mon_if_rvalid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 625, x_mon_if_rvalid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 626, x_mon_if_rvalid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 627, x_mon_if_rvalid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 628, x_mon_if_rvalid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 629, x_mon_if_rvalid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 630, x_mon_if_rvalid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 631, x_mon_if_rvalid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 632, x_mon_if_rvalid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 633, x_mon_if_rvalid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 634, x_mon_if_rvalid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 635, x_mon_if_rvalid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 636, x_mon_if_rvalid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 637, x_mon_if_rvalid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 638, x_mon_if_rvalid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 639, x_mon_if_rvalid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 640, x_mon_if_rvalid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 641, x_mon_if_rvalid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 642, x_mon_if_rvalid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 643, x_mon_if_rvalid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 644, x_mon_if_rvalid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 645, x_mon_if_rvalid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 646, x_mon_if_rvalid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 647, x_mon_if_rvalid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 648, x_mon_if_rvalid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 649, x_mon_if_rvalid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 650, x_mon_if_rvalid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 651, x_mon_if_rvalid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 652, x_mon_if_rlast_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 653, x_mon_if_rlast_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 654, x_mon_if_rlast_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 655, x_mon_if_rlast_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 656, x_mon_if_rlast_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 657, x_mon_if_rlast_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 658, x_mon_if_rlast_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 659, x_mon_if_rlast_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 660, x_mon_if_rlast_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 661, x_mon_if_rlast_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 662, x_mon_if_rlast_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 663, x_mon_if_rlast_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 664, x_mon_if_rlast_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 665, x_mon_if_rlast_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 666, x_mon_if_rlast_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 667, x_mon_if_rlast_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 668, x_mon_if_rlast_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 669, x_mon_if_rlast_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 670, x_mon_if_rlast_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 671, x_mon_if_rlast_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 672, x_mon_if_rlast_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 673, x_mon_if_rlast_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 674, x_mon_if_rlast_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 675, x_mon_if_rlast_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 676, x_mon_if_rlast_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 677, x_mon_if_rlast_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 678, x_mon_if_rlast_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 679, x_mon_if_rlast_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 680, x_mon_if_rlast_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 681, x_mon_if_rlast_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 682, x_mon_if_rlast_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 683, x_mon_if_rdata_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 684, x_mon_if_rdata_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 685, x_mon_if_rdata_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 686, x_mon_if_rdata_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 687, x_mon_if_rdata_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 688, x_mon_if_rdata_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 689, x_mon_if_rdata_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 690, x_mon_if_rdata_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 691, x_mon_if_rdata_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 692, x_mon_if_rdata_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 693, x_mon_if_rdata_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 694, x_mon_if_rdata_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 695, x_mon_if_rdata_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 696, x_mon_if_rdata_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 697, x_mon_if_rdata_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 698, x_mon_if_rdata_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 699, x_mon_if_rdata_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 700, x_mon_if_rdata_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 701, x_mon_if_rdata_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 702, x_mon_if_rdata_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 703, x_mon_if_rdata_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 704, x_mon_if_rdata_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 705, x_mon_if_rdata_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 706, x_mon_if_rdata_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 707, x_mon_if_rdata_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 708, x_mon_if_rdata_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 709, x_mon_if_rdata_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 710, x_mon_if_rdata_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 711, x_mon_if_rdata_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 712, x_mon_if_rdata_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 713, x_mon_if_rdata_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 714, x_mon_if_rresp_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 715, x_mon_if_rresp_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 716, x_mon_if_rresp_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 717, x_mon_if_rresp_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 718, x_mon_if_rresp_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 719, x_mon_if_rresp_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 720, x_mon_if_rresp_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 721, x_mon_if_rresp_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 722, x_mon_if_rresp_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 723, x_mon_if_rresp_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 724, x_mon_if_rresp_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 725, x_mon_if_rresp_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 726, x_mon_if_rresp_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 727, x_mon_if_rresp_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 728, x_mon_if_rresp_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 729, x_mon_if_rresp_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 730, x_mon_if_rresp_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 731, x_mon_if_rresp_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 732, x_mon_if_rresp_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 733, x_mon_if_rresp_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 734, x_mon_if_rresp_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 735, x_mon_if_rresp_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 736, x_mon_if_rresp_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 737, x_mon_if_rresp_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 738, x_mon_if_rresp_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 739, x_mon_if_rresp_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 740, x_mon_if_rresp_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 741, x_mon_if_rresp_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 742, x_mon_if_rresp_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 743, x_mon_if_rresp_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 744, x_mon_if_rresp_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 745, x_mon_if_rid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 746, x_mon_if_rid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 747, x_mon_if_rid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 748, x_mon_if_rid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 749, x_mon_if_rid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 750, x_mon_if_rid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 751, x_mon_if_rid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 752, x_mon_if_rid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 753, x_mon_if_rid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 754, x_mon_if_rid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 755, x_mon_if_rid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 756, x_mon_if_rid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 757, x_mon_if_rid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 758, x_mon_if_rid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 759, x_mon_if_rid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 760, x_mon_if_rid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 761, x_mon_if_rid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 762, x_mon_if_rid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 763, x_mon_if_rid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 764, x_mon_if_rid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 765, x_mon_if_rid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 766, x_mon_if_rid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 767, x_mon_if_rid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 768, x_mon_if_rid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 769, x_mon_if_rid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 770, x_mon_if_rid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 771, x_mon_if_rid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 772, x_mon_if_rid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 773, x_mon_if_rid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 774, x_mon_if_rid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 775, x_mon_if_rid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 776, x_mon_if_rready_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 777, x_mon_if_rready_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 778, x_mon_if_rready_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 779, x_mon_if_rready_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 780, x_mon_if_rready_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 781, x_mon_if_rready_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 782, x_mon_if_rready_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 783, x_mon_if_rready_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 784, x_mon_if_rready_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 785, x_mon_if_rready_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 786, x_mon_if_rready_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 787, x_mon_if_rready_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 788, x_mon_if_rready_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 789, x_mon_if_rready_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 790, x_mon_if_rready_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 791, x_mon_if_rready_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 792, x_mon_if_rready_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 793, x_mon_if_rready_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 794, x_mon_if_rready_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 795, x_mon_if_rready_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 796, x_mon_if_rready_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 797, x_mon_if_rready_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 798, x_mon_if_rready_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 799, x_mon_if_rready_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 800, x_mon_if_rready_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 801, x_mon_if_rready_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 802, x_mon_if_rready_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 803, x_mon_if_rready_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 804, x_mon_if_rready_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 805, x_mon_if_rready_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 806, x_mon_if_rready_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 807, x_mon_if_wvalid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 808, x_mon_if_wvalid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 809, x_mon_if_wvalid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 810, x_mon_if_wvalid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 811, x_mon_if_wvalid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 812, x_mon_if_wvalid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 813, x_mon_if_wvalid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 814, x_mon_if_wvalid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 815, x_mon_if_wvalid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 816, x_mon_if_wvalid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 817, x_mon_if_wvalid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 818, x_mon_if_wvalid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 819, x_mon_if_wvalid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 820, x_mon_if_wvalid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 821, x_mon_if_wvalid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 822, x_mon_if_wvalid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 823, x_mon_if_wvalid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 824, x_mon_if_wvalid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 825, x_mon_if_wvalid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 826, x_mon_if_wvalid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 827, x_mon_if_wvalid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 828, x_mon_if_wvalid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 829, x_mon_if_wvalid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 830, x_mon_if_wvalid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 831, x_mon_if_wvalid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 832, x_mon_if_wvalid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 833, x_mon_if_wvalid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 834, x_mon_if_wvalid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 835, x_mon_if_wvalid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 836, x_mon_if_wvalid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 837, x_mon_if_wvalid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 838, x_mon_if_wlast_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 839, x_mon_if_wlast_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 840, x_mon_if_wlast_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 841, x_mon_if_wlast_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 842, x_mon_if_wlast_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 843, x_mon_if_wlast_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 844, x_mon_if_wlast_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 845, x_mon_if_wlast_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 846, x_mon_if_wlast_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 847, x_mon_if_wlast_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 848, x_mon_if_wlast_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 849, x_mon_if_wlast_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 850, x_mon_if_wlast_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 851, x_mon_if_wlast_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 852, x_mon_if_wlast_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 853, x_mon_if_wlast_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 854, x_mon_if_wlast_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 855, x_mon_if_wlast_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 856, x_mon_if_wlast_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 857, x_mon_if_wlast_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 858, x_mon_if_wlast_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 859, x_mon_if_wlast_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 860, x_mon_if_wlast_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 861, x_mon_if_wlast_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 862, x_mon_if_wlast_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 863, x_mon_if_wlast_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 864, x_mon_if_wlast_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 865, x_mon_if_wlast_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 866, x_mon_if_wlast_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 867, x_mon_if_wlast_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 868, x_mon_if_wlast_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 869, x_mon_if_wdata_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 870, x_mon_if_wdata_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 871, x_mon_if_wdata_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 872, x_mon_if_wdata_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 873, x_mon_if_wdata_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 874, x_mon_if_wdata_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 875, x_mon_if_wdata_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 876, x_mon_if_wdata_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 877, x_mon_if_wdata_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 878, x_mon_if_wdata_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 879, x_mon_if_wdata_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 880, x_mon_if_wdata_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 881, x_mon_if_wdata_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 882, x_mon_if_wdata_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 883, x_mon_if_wdata_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 884, x_mon_if_wdata_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 885, x_mon_if_wdata_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 886, x_mon_if_wdata_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 887, x_mon_if_wdata_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 888, x_mon_if_wdata_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 889, x_mon_if_wdata_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 890, x_mon_if_wdata_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 891, x_mon_if_wdata_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 892, x_mon_if_wdata_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 893, x_mon_if_wdata_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 894, x_mon_if_wdata_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 895, x_mon_if_wdata_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 896, x_mon_if_wdata_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 897, x_mon_if_wdata_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 898, x_mon_if_wdata_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 899, x_mon_if_wdata_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 900, x_mon_if_wstrb_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 901, x_mon_if_wstrb_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 902, x_mon_if_wstrb_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 903, x_mon_if_wstrb_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 904, x_mon_if_wstrb_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 905, x_mon_if_wstrb_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 906, x_mon_if_wstrb_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 907, x_mon_if_wstrb_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 908, x_mon_if_wstrb_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 909, x_mon_if_wstrb_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 910, x_mon_if_wstrb_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 911, x_mon_if_wstrb_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 912, x_mon_if_wstrb_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 913, x_mon_if_wstrb_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 914, x_mon_if_wstrb_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 915, x_mon_if_wstrb_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 916, x_mon_if_wstrb_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 917, x_mon_if_wstrb_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 918, x_mon_if_wstrb_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 919, x_mon_if_wstrb_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 920, x_mon_if_wstrb_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 921, x_mon_if_wstrb_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 922, x_mon_if_wstrb_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 923, x_mon_if_wstrb_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 924, x_mon_if_wstrb_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 925, x_mon_if_wstrb_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 926, x_mon_if_wstrb_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 927, x_mon_if_wstrb_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 928, x_mon_if_wstrb_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 929, x_mon_if_wstrb_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 930, x_mon_if_wstrb_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 931, x_mon_if_wid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 932, x_mon_if_wid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 933, x_mon_if_wid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 934, x_mon_if_wid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 935, x_mon_if_wid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 936, x_mon_if_wid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 937, x_mon_if_wid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 938, x_mon_if_wid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 939, x_mon_if_wid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 940, x_mon_if_wid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 941, x_mon_if_wid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 942, x_mon_if_wid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 943, x_mon_if_wid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 944, x_mon_if_wid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 945, x_mon_if_wid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 946, x_mon_if_wid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 947, x_mon_if_wid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 948, x_mon_if_wid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 949, x_mon_if_wid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 950, x_mon_if_wid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 951, x_mon_if_wid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 952, x_mon_if_wid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 953, x_mon_if_wid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 954, x_mon_if_wid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 955, x_mon_if_wid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 956, x_mon_if_wid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 957, x_mon_if_wid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 958, x_mon_if_wid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 959, x_mon_if_wid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 960, x_mon_if_wid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 961, x_mon_if_wid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 962, x_mon_if_wready_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 963, x_mon_if_wready_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 964, x_mon_if_wready_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 965, x_mon_if_wready_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 966, x_mon_if_wready_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 967, x_mon_if_wready_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 968, x_mon_if_wready_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 969, x_mon_if_wready_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 970, x_mon_if_wready_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 971, x_mon_if_wready_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 972, x_mon_if_wready_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 973, x_mon_if_wready_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 974, x_mon_if_wready_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 975, x_mon_if_wready_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 976, x_mon_if_wready_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 977, x_mon_if_wready_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 978, x_mon_if_wready_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 979, x_mon_if_wready_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 980, x_mon_if_wready_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 981, x_mon_if_wready_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 982, x_mon_if_wready_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 983, x_mon_if_wready_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 984, x_mon_if_wready_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 985, x_mon_if_wready_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 986, x_mon_if_wready_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 987, x_mon_if_wready_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 988, x_mon_if_wready_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 989, x_mon_if_wready_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 990, x_mon_if_wready_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 991, x_mon_if_wready_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 992, x_mon_if_wready_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 993, x_mon_if_bvalid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 994, x_mon_if_bvalid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 995, x_mon_if_bvalid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 996, x_mon_if_bvalid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 997, x_mon_if_bvalid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 998, x_mon_if_bvalid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 999, x_mon_if_bvalid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1000, x_mon_if_bvalid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1001, x_mon_if_bvalid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1002, x_mon_if_bvalid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1003, x_mon_if_bvalid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1004, x_mon_if_bvalid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1005, x_mon_if_bvalid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1006, x_mon_if_bvalid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1007, x_mon_if_bvalid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1008, x_mon_if_bvalid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1009, x_mon_if_bvalid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1010, x_mon_if_bvalid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1011, x_mon_if_bvalid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1012, x_mon_if_bvalid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1013, x_mon_if_bvalid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1014, x_mon_if_bvalid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1015, x_mon_if_bvalid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1016, x_mon_if_bvalid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1017, x_mon_if_bvalid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1018, x_mon_if_bvalid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1019, x_mon_if_bvalid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1020, x_mon_if_bvalid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1021, x_mon_if_bvalid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1022, x_mon_if_bvalid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1023, x_mon_if_bvalid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1024, x_mon_if_bresp_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1025, x_mon_if_bresp_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1026, x_mon_if_bresp_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1027, x_mon_if_bresp_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1028, x_mon_if_bresp_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1029, x_mon_if_bresp_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1030, x_mon_if_bresp_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1031, x_mon_if_bresp_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1032, x_mon_if_bresp_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1033, x_mon_if_bresp_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1034, x_mon_if_bresp_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1035, x_mon_if_bresp_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1036, x_mon_if_bresp_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1037, x_mon_if_bresp_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1038, x_mon_if_bresp_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1039, x_mon_if_bresp_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1040, x_mon_if_bresp_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1041, x_mon_if_bresp_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1042, x_mon_if_bresp_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1043, x_mon_if_bresp_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1044, x_mon_if_bresp_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1045, x_mon_if_bresp_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1046, x_mon_if_bresp_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1047, x_mon_if_bresp_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1048, x_mon_if_bresp_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1049, x_mon_if_bresp_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1050, x_mon_if_bresp_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1051, x_mon_if_bresp_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1052, x_mon_if_bresp_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1053, x_mon_if_bresp_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1054, x_mon_if_bresp_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1055, x_mon_if_bid_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1056, x_mon_if_bid_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1057, x_mon_if_bid_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1058, x_mon_if_bid_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1059, x_mon_if_bid_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1060, x_mon_if_bid_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1061, x_mon_if_bid_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1062, x_mon_if_bid_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1063, x_mon_if_bid_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1064, x_mon_if_bid_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1065, x_mon_if_bid_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1066, x_mon_if_bid_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1067, x_mon_if_bid_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1068, x_mon_if_bid_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1069, x_mon_if_bid_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1070, x_mon_if_bid_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1071, x_mon_if_bid_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1072, x_mon_if_bid_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1073, x_mon_if_bid_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1074, x_mon_if_bid_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1075, x_mon_if_bid_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1076, x_mon_if_bid_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1077, x_mon_if_bid_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1078, x_mon_if_bid_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1079, x_mon_if_bid_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1080, x_mon_if_bid_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1081, x_mon_if_bid_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1082, x_mon_if_bid_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1083, x_mon_if_bid_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1084, x_mon_if_bid_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1085, x_mon_if_bid_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1086, x_mon_if_bready_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1087, x_mon_if_bready_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1088, x_mon_if_bready_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1089, x_mon_if_bready_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1090, x_mon_if_bready_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1091, x_mon_if_bready_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1092, x_mon_if_bready_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1093, x_mon_if_bready_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1094, x_mon_if_bready_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1095, x_mon_if_bready_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1096, x_mon_if_bready_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1097, x_mon_if_bready_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1098, x_mon_if_bready_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1099, x_mon_if_bready_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1100, x_mon_if_bready_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1101, x_mon_if_bready_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1102, x_mon_if_bready_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1103, x_mon_if_bready_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1104, x_mon_if_bready_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1105, x_mon_if_bready_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1106, x_mon_if_bready_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1107, x_mon_if_bready_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1108, x_mon_if_bready_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1109, x_mon_if_bready_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1110, x_mon_if_bready_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1111, x_mon_if_bready_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1112, x_mon_if_bready_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1113, x_mon_if_bready_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1114, x_mon_if_bready_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1115, x_mon_if_bready_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1116, x_mon_if_bready_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1117, x_mon_if_cactive_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1118, x_mon_if_cactive_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1119, x_mon_if_cactive_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1120, x_mon_if_cactive_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1121, x_mon_if_cactive_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1122, x_mon_if_cactive_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1123, x_mon_if_cactive_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1124, x_mon_if_cactive_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1125, x_mon_if_cactive_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1126, x_mon_if_cactive_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1127, x_mon_if_cactive_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1128, x_mon_if_cactive_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1129, x_mon_if_cactive_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1130, x_mon_if_cactive_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1131, x_mon_if_cactive_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1132, x_mon_if_cactive_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1133, x_mon_if_cactive_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1134, x_mon_if_cactive_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1135, x_mon_if_cactive_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1136, x_mon_if_cactive_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1137, x_mon_if_cactive_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1138, x_mon_if_cactive_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1139, x_mon_if_cactive_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1140, x_mon_if_cactive_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1141, x_mon_if_cactive_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1142, x_mon_if_cactive_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1143, x_mon_if_cactive_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1144, x_mon_if_cactive_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1145, x_mon_if_cactive_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1146, x_mon_if_cactive_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1147, x_mon_if_cactive_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1148, x_mon_if_csysreq_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1149, x_mon_if_csysreq_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1150, x_mon_if_csysreq_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1151, x_mon_if_csysreq_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1152, x_mon_if_csysreq_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1153, x_mon_if_csysreq_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1154, x_mon_if_csysreq_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1155, x_mon_if_csysreq_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1156, x_mon_if_csysreq_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1157, x_mon_if_csysreq_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1158, x_mon_if_csysreq_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1159, x_mon_if_csysreq_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1160, x_mon_if_csysreq_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1161, x_mon_if_csysreq_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1162, x_mon_if_csysreq_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1163, x_mon_if_csysreq_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1164, x_mon_if_csysreq_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1165, x_mon_if_csysreq_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1166, x_mon_if_csysreq_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1167, x_mon_if_csysreq_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1168, x_mon_if_csysreq_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1169, x_mon_if_csysreq_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1170, x_mon_if_csysreq_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1171, x_mon_if_csysreq_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1172, x_mon_if_csysreq_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1173, x_mon_if_csysreq_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1174, x_mon_if_csysreq_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1175, x_mon_if_csysreq_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1176, x_mon_if_csysreq_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1177, x_mon_if_csysreq_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1178, x_mon_if_csysreq_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1179, x_mon_if_csysack_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1180, x_mon_if_csysack_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1181, x_mon_if_csysack_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1182, x_mon_if_csysack_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1183, x_mon_if_csysack_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1184, x_mon_if_csysack_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1185, x_mon_if_csysack_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1186, x_mon_if_csysack_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1187, x_mon_if_csysack_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1188, x_mon_if_csysack_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1189, x_mon_if_csysack_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1190, x_mon_if_csysack_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1191, x_mon_if_csysack_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1192, x_mon_if_csysack_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1193, x_mon_if_csysack_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1194, x_mon_if_csysack_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1195, x_mon_if_csysack_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1196, x_mon_if_csysack_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1197, x_mon_if_csysack_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1198, x_mon_if_csysack_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1199, x_mon_if_csysack_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1200, x_mon_if_csysack_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1201, x_mon_if_csysack_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1202, x_mon_if_csysack_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1203, x_mon_if_csysack_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1204, x_mon_if_csysack_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1205, x_mon_if_csysack_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1206, x_mon_if_csysack_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1207, x_mon_if_csysack_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1208, x_mon_if_csysack_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1209, x_mon_if_csysack_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1210, x_mon_if_awsideband_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1211, x_mon_if_awsideband_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1212, x_mon_if_awsideband_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1213, x_mon_if_awsideband_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1214, x_mon_if_awsideband_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1215, x_mon_if_awsideband_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1216, x_mon_if_awsideband_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1217, x_mon_if_awsideband_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1218, x_mon_if_awsideband_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1219, x_mon_if_awsideband_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1220, x_mon_if_awsideband_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1221, x_mon_if_awsideband_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1222, x_mon_if_awsideband_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1223, x_mon_if_awsideband_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1224, x_mon_if_awsideband_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1225, x_mon_if_awsideband_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1226, x_mon_if_awsideband_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1227, x_mon_if_awsideband_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1228, x_mon_if_awsideband_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1229, x_mon_if_awsideband_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1230, x_mon_if_awsideband_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1231, x_mon_if_awsideband_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1232, x_mon_if_awsideband_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1233, x_mon_if_awsideband_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1234, x_mon_if_awsideband_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1235, x_mon_if_awsideband_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1236, x_mon_if_awsideband_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1237, x_mon_if_awsideband_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1238, x_mon_if_awsideband_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1239, x_mon_if_awsideband_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1240, x_mon_if_awsideband_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1241, x_mon_if_arsideband_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1242, x_mon_if_arsideband_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1243, x_mon_if_arsideband_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1244, x_mon_if_arsideband_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1245, x_mon_if_arsideband_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1246, x_mon_if_arsideband_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1247, x_mon_if_arsideband_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1248, x_mon_if_arsideband_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1249, x_mon_if_arsideband_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1250, x_mon_if_arsideband_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1251, x_mon_if_arsideband_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1252, x_mon_if_arsideband_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1253, x_mon_if_arsideband_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1254, x_mon_if_arsideband_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1255, x_mon_if_arsideband_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1256, x_mon_if_arsideband_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1257, x_mon_if_arsideband_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1258, x_mon_if_arsideband_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1259, x_mon_if_arsideband_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1260, x_mon_if_arsideband_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1261, x_mon_if_arsideband_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1262, x_mon_if_arsideband_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1263, x_mon_if_arsideband_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1264, x_mon_if_arsideband_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1265, x_mon_if_arsideband_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1266, x_mon_if_arsideband_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1267, x_mon_if_arsideband_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1268, x_mon_if_arsideband_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1269, x_mon_if_arsideband_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1270, x_mon_if_arsideband_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1271, x_mon_if_arsideband_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1272, x_mon_if_rsideband_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1273, x_mon_if_rsideband_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1274, x_mon_if_rsideband_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1275, x_mon_if_rsideband_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1276, x_mon_if_rsideband_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1277, x_mon_if_rsideband_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1278, x_mon_if_rsideband_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1279, x_mon_if_rsideband_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1280, x_mon_if_rsideband_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1281, x_mon_if_rsideband_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1282, x_mon_if_rsideband_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1283, x_mon_if_rsideband_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1284, x_mon_if_rsideband_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1285, x_mon_if_rsideband_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1286, x_mon_if_rsideband_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1287, x_mon_if_rsideband_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1288, x_mon_if_rsideband_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1289, x_mon_if_rsideband_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1290, x_mon_if_rsideband_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1291, x_mon_if_rsideband_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1292, x_mon_if_rsideband_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1293, x_mon_if_rsideband_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1294, x_mon_if_rsideband_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1295, x_mon_if_rsideband_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1296, x_mon_if_rsideband_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1297, x_mon_if_rsideband_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1298, x_mon_if_rsideband_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1299, x_mon_if_rsideband_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1300, x_mon_if_rsideband_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1301, x_mon_if_rsideband_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1302, x_mon_if_rsideband_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1303, x_mon_if_wsideband_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1304, x_mon_if_wsideband_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1305, x_mon_if_wsideband_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1306, x_mon_if_wsideband_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1307, x_mon_if_wsideband_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1308, x_mon_if_wsideband_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1309, x_mon_if_wsideband_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1310, x_mon_if_wsideband_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1311, x_mon_if_wsideband_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1312, x_mon_if_wsideband_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1313, x_mon_if_wsideband_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1314, x_mon_if_wsideband_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1315, x_mon_if_wsideband_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1316, x_mon_if_wsideband_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1317, x_mon_if_wsideband_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1318, x_mon_if_wsideband_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1319, x_mon_if_wsideband_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1320, x_mon_if_wsideband_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1321, x_mon_if_wsideband_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1322, x_mon_if_wsideband_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1323, x_mon_if_wsideband_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1324, x_mon_if_wsideband_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1325, x_mon_if_wsideband_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1326, x_mon_if_wsideband_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1327, x_mon_if_wsideband_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1328, x_mon_if_wsideband_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1329, x_mon_if_wsideband_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1330, x_mon_if_wsideband_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1331, x_mon_if_wsideband_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1332, x_mon_if_wsideband_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1333, x_mon_if_wsideband_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1334, x_mon_if_bsideband_s1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1335, x_mon_if_bsideband_s2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1336, x_mon_if_bsideband_s3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1337, x_mon_if_bsideband_s4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1338, x_mon_if_bsideband_s5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1339, x_mon_if_bsideband_s6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1340, x_mon_if_bsideband_s7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1341, x_mon_if_bsideband_s8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1342, x_mon_if_bsideband_s9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1343, x_mon_if_bsideband_s10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1344, x_mon_if_bsideband_s11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1345, x_mon_if_bsideband_s12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1346, x_mon_if_bsideband_s13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1347, x_mon_if_bsideband_s14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1348, x_mon_if_bsideband_s15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1349, x_mon_if_bsideband_s16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1350, x_mon_if_bsideband_s17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1351, x_mon_if_bsideband_s18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1352, x_mon_if_bsideband_s19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1353, x_mon_if_bsideband_s20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1354, x_mon_if_bsideband_s21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1355, x_mon_if_bsideband_s22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1356, x_mon_if_bsideband_s23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1357, x_mon_if_bsideband_s24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1358, x_mon_if_bsideband_s25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1359, x_mon_if_bsideband_s26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1360, x_mon_if_bsideband_s27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1361, x_mon_if_bsideband_s28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1362, x_mon_if_bsideband_s29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1363, x_mon_if_bsideband_s30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1364, x_mon_if_bsideband_s31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1365, x_mon_if_arvalid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1366, x_mon_if_arvalid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1367, x_mon_if_arvalid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1368, x_mon_if_arvalid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1369, x_mon_if_arvalid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1370, x_mon_if_arvalid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1371, x_mon_if_arvalid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1372, x_mon_if_arvalid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1373, x_mon_if_arvalid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1374, x_mon_if_arvalid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1375, x_mon_if_arvalid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1376, x_mon_if_arvalid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1377, x_mon_if_arvalid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1378, x_mon_if_arvalid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1379, x_mon_if_arvalid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1380, x_mon_if_arvalid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1381, x_mon_if_arvalid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1382, x_mon_if_arvalid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1383, x_mon_if_arvalid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1384, x_mon_if_arvalid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1385, x_mon_if_arvalid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1386, x_mon_if_arvalid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1387, x_mon_if_arvalid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1388, x_mon_if_arvalid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1389, x_mon_if_arvalid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1390, x_mon_if_arvalid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1391, x_mon_if_arvalid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1392, x_mon_if_arvalid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1393, x_mon_if_arvalid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1394, x_mon_if_arvalid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1395, x_mon_if_arvalid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1396, x_mon_if_arvalid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1397, x_mon_if_araddr_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1398, x_mon_if_araddr_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1399, x_mon_if_araddr_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1400, x_mon_if_araddr_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1401, x_mon_if_araddr_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1402, x_mon_if_araddr_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1403, x_mon_if_araddr_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1404, x_mon_if_araddr_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1405, x_mon_if_araddr_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1406, x_mon_if_araddr_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1407, x_mon_if_araddr_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1408, x_mon_if_araddr_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1409, x_mon_if_araddr_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1410, x_mon_if_araddr_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1411, x_mon_if_araddr_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1412, x_mon_if_araddr_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1413, x_mon_if_araddr_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1414, x_mon_if_araddr_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1415, x_mon_if_araddr_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1416, x_mon_if_araddr_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1417, x_mon_if_araddr_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1418, x_mon_if_araddr_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1419, x_mon_if_araddr_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1420, x_mon_if_araddr_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1421, x_mon_if_araddr_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1422, x_mon_if_araddr_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1423, x_mon_if_araddr_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1424, x_mon_if_araddr_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1425, x_mon_if_araddr_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1426, x_mon_if_araddr_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1427, x_mon_if_araddr_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1428, x_mon_if_araddr_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1429, x_mon_if_arlen_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1430, x_mon_if_arlen_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1431, x_mon_if_arlen_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1432, x_mon_if_arlen_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1433, x_mon_if_arlen_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1434, x_mon_if_arlen_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1435, x_mon_if_arlen_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1436, x_mon_if_arlen_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1437, x_mon_if_arlen_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1438, x_mon_if_arlen_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1439, x_mon_if_arlen_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1440, x_mon_if_arlen_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1441, x_mon_if_arlen_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1442, x_mon_if_arlen_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1443, x_mon_if_arlen_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1444, x_mon_if_arlen_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1445, x_mon_if_arlen_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1446, x_mon_if_arlen_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1447, x_mon_if_arlen_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1448, x_mon_if_arlen_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1449, x_mon_if_arlen_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1450, x_mon_if_arlen_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1451, x_mon_if_arlen_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1452, x_mon_if_arlen_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1453, x_mon_if_arlen_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1454, x_mon_if_arlen_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1455, x_mon_if_arlen_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1456, x_mon_if_arlen_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1457, x_mon_if_arlen_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1458, x_mon_if_arlen_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1459, x_mon_if_arlen_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1460, x_mon_if_arlen_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1461, x_mon_if_arsize_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1462, x_mon_if_arsize_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1463, x_mon_if_arsize_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1464, x_mon_if_arsize_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1465, x_mon_if_arsize_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1466, x_mon_if_arsize_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1467, x_mon_if_arsize_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1468, x_mon_if_arsize_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1469, x_mon_if_arsize_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1470, x_mon_if_arsize_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1471, x_mon_if_arsize_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1472, x_mon_if_arsize_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1473, x_mon_if_arsize_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1474, x_mon_if_arsize_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1475, x_mon_if_arsize_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1476, x_mon_if_arsize_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1477, x_mon_if_arsize_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1478, x_mon_if_arsize_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1479, x_mon_if_arsize_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1480, x_mon_if_arsize_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1481, x_mon_if_arsize_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1482, x_mon_if_arsize_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1483, x_mon_if_arsize_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1484, x_mon_if_arsize_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1485, x_mon_if_arsize_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1486, x_mon_if_arsize_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1487, x_mon_if_arsize_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1488, x_mon_if_arsize_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1489, x_mon_if_arsize_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1490, x_mon_if_arsize_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1491, x_mon_if_arsize_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1492, x_mon_if_arsize_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1493, x_mon_if_arburst_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1494, x_mon_if_arburst_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1495, x_mon_if_arburst_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1496, x_mon_if_arburst_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1497, x_mon_if_arburst_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1498, x_mon_if_arburst_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1499, x_mon_if_arburst_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1500, x_mon_if_arburst_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1501, x_mon_if_arburst_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1502, x_mon_if_arburst_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1503, x_mon_if_arburst_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1504, x_mon_if_arburst_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1505, x_mon_if_arburst_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1506, x_mon_if_arburst_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1507, x_mon_if_arburst_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1508, x_mon_if_arburst_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1509, x_mon_if_arburst_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1510, x_mon_if_arburst_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1511, x_mon_if_arburst_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1512, x_mon_if_arburst_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1513, x_mon_if_arburst_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1514, x_mon_if_arburst_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1515, x_mon_if_arburst_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1516, x_mon_if_arburst_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1517, x_mon_if_arburst_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1518, x_mon_if_arburst_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1519, x_mon_if_arburst_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1520, x_mon_if_arburst_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1521, x_mon_if_arburst_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1522, x_mon_if_arburst_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1523, x_mon_if_arburst_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1524, x_mon_if_arburst_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1525, x_mon_if_arlock_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1526, x_mon_if_arlock_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1527, x_mon_if_arlock_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1528, x_mon_if_arlock_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1529, x_mon_if_arlock_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1530, x_mon_if_arlock_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1531, x_mon_if_arlock_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1532, x_mon_if_arlock_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1533, x_mon_if_arlock_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1534, x_mon_if_arlock_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1535, x_mon_if_arlock_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1536, x_mon_if_arlock_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1537, x_mon_if_arlock_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1538, x_mon_if_arlock_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1539, x_mon_if_arlock_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1540, x_mon_if_arlock_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1541, x_mon_if_arlock_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1542, x_mon_if_arlock_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1543, x_mon_if_arlock_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1544, x_mon_if_arlock_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1545, x_mon_if_arlock_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1546, x_mon_if_arlock_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1547, x_mon_if_arlock_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1548, x_mon_if_arlock_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1549, x_mon_if_arlock_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1550, x_mon_if_arlock_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1551, x_mon_if_arlock_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1552, x_mon_if_arlock_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1553, x_mon_if_arlock_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1554, x_mon_if_arlock_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1555, x_mon_if_arlock_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1556, x_mon_if_arlock_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1557, x_mon_if_arcache_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1558, x_mon_if_arcache_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1559, x_mon_if_arcache_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1560, x_mon_if_arcache_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1561, x_mon_if_arcache_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1562, x_mon_if_arcache_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1563, x_mon_if_arcache_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1564, x_mon_if_arcache_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1565, x_mon_if_arcache_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1566, x_mon_if_arcache_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1567, x_mon_if_arcache_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1568, x_mon_if_arcache_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1569, x_mon_if_arcache_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1570, x_mon_if_arcache_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1571, x_mon_if_arcache_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1572, x_mon_if_arcache_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1573, x_mon_if_arcache_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1574, x_mon_if_arcache_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1575, x_mon_if_arcache_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1576, x_mon_if_arcache_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1577, x_mon_if_arcache_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1578, x_mon_if_arcache_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1579, x_mon_if_arcache_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1580, x_mon_if_arcache_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1581, x_mon_if_arcache_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1582, x_mon_if_arcache_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1583, x_mon_if_arcache_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1584, x_mon_if_arcache_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1585, x_mon_if_arcache_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1586, x_mon_if_arcache_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1587, x_mon_if_arcache_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1588, x_mon_if_arcache_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1589, x_mon_if_arprot_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1590, x_mon_if_arprot_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1591, x_mon_if_arprot_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1592, x_mon_if_arprot_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1593, x_mon_if_arprot_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1594, x_mon_if_arprot_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1595, x_mon_if_arprot_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1596, x_mon_if_arprot_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1597, x_mon_if_arprot_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1598, x_mon_if_arprot_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1599, x_mon_if_arprot_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1600, x_mon_if_arprot_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1601, x_mon_if_arprot_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1602, x_mon_if_arprot_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1603, x_mon_if_arprot_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1604, x_mon_if_arprot_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1605, x_mon_if_arprot_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1606, x_mon_if_arprot_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1607, x_mon_if_arprot_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1608, x_mon_if_arprot_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1609, x_mon_if_arprot_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1610, x_mon_if_arprot_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1611, x_mon_if_arprot_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1612, x_mon_if_arprot_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1613, x_mon_if_arprot_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1614, x_mon_if_arprot_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1615, x_mon_if_arprot_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1616, x_mon_if_arprot_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1617, x_mon_if_arprot_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1618, x_mon_if_arprot_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1619, x_mon_if_arprot_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1620, x_mon_if_arprot_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1621, x_mon_if_arid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1622, x_mon_if_arid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1623, x_mon_if_arid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1624, x_mon_if_arid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1625, x_mon_if_arid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1626, x_mon_if_arid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1627, x_mon_if_arid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1628, x_mon_if_arid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1629, x_mon_if_arid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1630, x_mon_if_arid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1631, x_mon_if_arid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1632, x_mon_if_arid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1633, x_mon_if_arid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1634, x_mon_if_arid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1635, x_mon_if_arid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1636, x_mon_if_arid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1637, x_mon_if_arid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1638, x_mon_if_arid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1639, x_mon_if_arid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1640, x_mon_if_arid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1641, x_mon_if_arid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1642, x_mon_if_arid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1643, x_mon_if_arid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1644, x_mon_if_arid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1645, x_mon_if_arid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1646, x_mon_if_arid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1647, x_mon_if_arid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1648, x_mon_if_arid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1649, x_mon_if_arid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1650, x_mon_if_arid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1651, x_mon_if_arid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1652, x_mon_if_arid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1653, x_mon_if_arready_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1654, x_mon_if_arready_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1655, x_mon_if_arready_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1656, x_mon_if_arready_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1657, x_mon_if_arready_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1658, x_mon_if_arready_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1659, x_mon_if_arready_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1660, x_mon_if_arready_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1661, x_mon_if_arready_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1662, x_mon_if_arready_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1663, x_mon_if_arready_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1664, x_mon_if_arready_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1665, x_mon_if_arready_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1666, x_mon_if_arready_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1667, x_mon_if_arready_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1668, x_mon_if_arready_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1669, x_mon_if_arready_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1670, x_mon_if_arready_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1671, x_mon_if_arready_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1672, x_mon_if_arready_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1673, x_mon_if_arready_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1674, x_mon_if_arready_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1675, x_mon_if_arready_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1676, x_mon_if_arready_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1677, x_mon_if_arready_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1678, x_mon_if_arready_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1679, x_mon_if_arready_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1680, x_mon_if_arready_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1681, x_mon_if_arready_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1682, x_mon_if_arready_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1683, x_mon_if_arready_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1684, x_mon_if_arready_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1685, x_mon_if_awvalid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1686, x_mon_if_awvalid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1687, x_mon_if_awvalid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1688, x_mon_if_awvalid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1689, x_mon_if_awvalid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1690, x_mon_if_awvalid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1691, x_mon_if_awvalid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1692, x_mon_if_awvalid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1693, x_mon_if_awvalid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1694, x_mon_if_awvalid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1695, x_mon_if_awvalid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1696, x_mon_if_awvalid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1697, x_mon_if_awvalid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1698, x_mon_if_awvalid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1699, x_mon_if_awvalid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1700, x_mon_if_awvalid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1701, x_mon_if_awvalid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1702, x_mon_if_awvalid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1703, x_mon_if_awvalid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1704, x_mon_if_awvalid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1705, x_mon_if_awvalid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1706, x_mon_if_awvalid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1707, x_mon_if_awvalid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1708, x_mon_if_awvalid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1709, x_mon_if_awvalid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1710, x_mon_if_awvalid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1711, x_mon_if_awvalid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1712, x_mon_if_awvalid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1713, x_mon_if_awvalid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1714, x_mon_if_awvalid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1715, x_mon_if_awvalid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1716, x_mon_if_awvalid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1717, x_mon_if_awaddr_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1718, x_mon_if_awaddr_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1719, x_mon_if_awaddr_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1720, x_mon_if_awaddr_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1721, x_mon_if_awaddr_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1722, x_mon_if_awaddr_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1723, x_mon_if_awaddr_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1724, x_mon_if_awaddr_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1725, x_mon_if_awaddr_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1726, x_mon_if_awaddr_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1727, x_mon_if_awaddr_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1728, x_mon_if_awaddr_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1729, x_mon_if_awaddr_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1730, x_mon_if_awaddr_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1731, x_mon_if_awaddr_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1732, x_mon_if_awaddr_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1733, x_mon_if_awaddr_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1734, x_mon_if_awaddr_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1735, x_mon_if_awaddr_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1736, x_mon_if_awaddr_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1737, x_mon_if_awaddr_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1738, x_mon_if_awaddr_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1739, x_mon_if_awaddr_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1740, x_mon_if_awaddr_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1741, x_mon_if_awaddr_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1742, x_mon_if_awaddr_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1743, x_mon_if_awaddr_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1744, x_mon_if_awaddr_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1745, x_mon_if_awaddr_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1746, x_mon_if_awaddr_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1747, x_mon_if_awaddr_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1748, x_mon_if_awaddr_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1749, x_mon_if_awlen_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1750, x_mon_if_awlen_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1751, x_mon_if_awlen_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1752, x_mon_if_awlen_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1753, x_mon_if_awlen_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1754, x_mon_if_awlen_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1755, x_mon_if_awlen_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1756, x_mon_if_awlen_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1757, x_mon_if_awlen_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1758, x_mon_if_awlen_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1759, x_mon_if_awlen_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1760, x_mon_if_awlen_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1761, x_mon_if_awlen_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1762, x_mon_if_awlen_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1763, x_mon_if_awlen_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1764, x_mon_if_awlen_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1765, x_mon_if_awlen_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1766, x_mon_if_awlen_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1767, x_mon_if_awlen_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1768, x_mon_if_awlen_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1769, x_mon_if_awlen_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1770, x_mon_if_awlen_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1771, x_mon_if_awlen_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1772, x_mon_if_awlen_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1773, x_mon_if_awlen_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1774, x_mon_if_awlen_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1775, x_mon_if_awlen_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1776, x_mon_if_awlen_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1777, x_mon_if_awlen_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1778, x_mon_if_awlen_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1779, x_mon_if_awlen_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1780, x_mon_if_awlen_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1781, x_mon_if_awsize_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1782, x_mon_if_awsize_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1783, x_mon_if_awsize_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1784, x_mon_if_awsize_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1785, x_mon_if_awsize_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1786, x_mon_if_awsize_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1787, x_mon_if_awsize_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1788, x_mon_if_awsize_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1789, x_mon_if_awsize_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1790, x_mon_if_awsize_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1791, x_mon_if_awsize_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1792, x_mon_if_awsize_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1793, x_mon_if_awsize_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1794, x_mon_if_awsize_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1795, x_mon_if_awsize_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1796, x_mon_if_awsize_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1797, x_mon_if_awsize_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1798, x_mon_if_awsize_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1799, x_mon_if_awsize_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1800, x_mon_if_awsize_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1801, x_mon_if_awsize_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1802, x_mon_if_awsize_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1803, x_mon_if_awsize_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1804, x_mon_if_awsize_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1805, x_mon_if_awsize_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1806, x_mon_if_awsize_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1807, x_mon_if_awsize_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1808, x_mon_if_awsize_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1809, x_mon_if_awsize_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1810, x_mon_if_awsize_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1811, x_mon_if_awsize_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1812, x_mon_if_awsize_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1813, x_mon_if_awburst_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1814, x_mon_if_awburst_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1815, x_mon_if_awburst_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1816, x_mon_if_awburst_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1817, x_mon_if_awburst_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1818, x_mon_if_awburst_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1819, x_mon_if_awburst_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1820, x_mon_if_awburst_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1821, x_mon_if_awburst_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1822, x_mon_if_awburst_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1823, x_mon_if_awburst_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1824, x_mon_if_awburst_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1825, x_mon_if_awburst_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1826, x_mon_if_awburst_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1827, x_mon_if_awburst_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1828, x_mon_if_awburst_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1829, x_mon_if_awburst_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1830, x_mon_if_awburst_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1831, x_mon_if_awburst_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1832, x_mon_if_awburst_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1833, x_mon_if_awburst_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1834, x_mon_if_awburst_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1835, x_mon_if_awburst_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1836, x_mon_if_awburst_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1837, x_mon_if_awburst_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1838, x_mon_if_awburst_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1839, x_mon_if_awburst_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1840, x_mon_if_awburst_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1841, x_mon_if_awburst_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1842, x_mon_if_awburst_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1843, x_mon_if_awburst_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1844, x_mon_if_awburst_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1845, x_mon_if_awlock_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1846, x_mon_if_awlock_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1847, x_mon_if_awlock_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1848, x_mon_if_awlock_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1849, x_mon_if_awlock_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1850, x_mon_if_awlock_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1851, x_mon_if_awlock_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1852, x_mon_if_awlock_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1853, x_mon_if_awlock_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1854, x_mon_if_awlock_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1855, x_mon_if_awlock_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1856, x_mon_if_awlock_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1857, x_mon_if_awlock_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1858, x_mon_if_awlock_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1859, x_mon_if_awlock_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1860, x_mon_if_awlock_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1861, x_mon_if_awlock_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1862, x_mon_if_awlock_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1863, x_mon_if_awlock_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1864, x_mon_if_awlock_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1865, x_mon_if_awlock_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1866, x_mon_if_awlock_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1867, x_mon_if_awlock_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1868, x_mon_if_awlock_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1869, x_mon_if_awlock_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1870, x_mon_if_awlock_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1871, x_mon_if_awlock_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1872, x_mon_if_awlock_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1873, x_mon_if_awlock_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1874, x_mon_if_awlock_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1875, x_mon_if_awlock_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1876, x_mon_if_awlock_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1877, x_mon_if_awcache_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1878, x_mon_if_awcache_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1879, x_mon_if_awcache_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1880, x_mon_if_awcache_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1881, x_mon_if_awcache_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1882, x_mon_if_awcache_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1883, x_mon_if_awcache_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1884, x_mon_if_awcache_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1885, x_mon_if_awcache_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1886, x_mon_if_awcache_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1887, x_mon_if_awcache_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1888, x_mon_if_awcache_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1889, x_mon_if_awcache_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1890, x_mon_if_awcache_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1891, x_mon_if_awcache_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1892, x_mon_if_awcache_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1893, x_mon_if_awcache_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1894, x_mon_if_awcache_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1895, x_mon_if_awcache_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1896, x_mon_if_awcache_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1897, x_mon_if_awcache_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1898, x_mon_if_awcache_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1899, x_mon_if_awcache_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1900, x_mon_if_awcache_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1901, x_mon_if_awcache_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1902, x_mon_if_awcache_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1903, x_mon_if_awcache_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1904, x_mon_if_awcache_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1905, x_mon_if_awcache_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1906, x_mon_if_awcache_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1907, x_mon_if_awcache_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1908, x_mon_if_awcache_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1909, x_mon_if_awprot_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1910, x_mon_if_awprot_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1911, x_mon_if_awprot_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1912, x_mon_if_awprot_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1913, x_mon_if_awprot_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1914, x_mon_if_awprot_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1915, x_mon_if_awprot_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1916, x_mon_if_awprot_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1917, x_mon_if_awprot_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1918, x_mon_if_awprot_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1919, x_mon_if_awprot_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1920, x_mon_if_awprot_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1921, x_mon_if_awprot_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1922, x_mon_if_awprot_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1923, x_mon_if_awprot_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1924, x_mon_if_awprot_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1925, x_mon_if_awprot_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1926, x_mon_if_awprot_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1927, x_mon_if_awprot_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1928, x_mon_if_awprot_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1929, x_mon_if_awprot_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1930, x_mon_if_awprot_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1931, x_mon_if_awprot_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1932, x_mon_if_awprot_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1933, x_mon_if_awprot_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1934, x_mon_if_awprot_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1935, x_mon_if_awprot_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1936, x_mon_if_awprot_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1937, x_mon_if_awprot_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1938, x_mon_if_awprot_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1939, x_mon_if_awprot_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1940, x_mon_if_awprot_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1941, x_mon_if_awid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1942, x_mon_if_awid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1943, x_mon_if_awid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1944, x_mon_if_awid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1945, x_mon_if_awid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1946, x_mon_if_awid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1947, x_mon_if_awid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1948, x_mon_if_awid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1949, x_mon_if_awid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1950, x_mon_if_awid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1951, x_mon_if_awid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1952, x_mon_if_awid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1953, x_mon_if_awid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1954, x_mon_if_awid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1955, x_mon_if_awid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1956, x_mon_if_awid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1957, x_mon_if_awid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1958, x_mon_if_awid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1959, x_mon_if_awid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1960, x_mon_if_awid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1961, x_mon_if_awid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1962, x_mon_if_awid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1963, x_mon_if_awid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1964, x_mon_if_awid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1965, x_mon_if_awid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1966, x_mon_if_awid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1967, x_mon_if_awid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1968, x_mon_if_awid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1969, x_mon_if_awid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1970, x_mon_if_awid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1971, x_mon_if_awid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1972, x_mon_if_awid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1973, x_mon_if_awready_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1974, x_mon_if_awready_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1975, x_mon_if_awready_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1976, x_mon_if_awready_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1977, x_mon_if_awready_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1978, x_mon_if_awready_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1979, x_mon_if_awready_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1980, x_mon_if_awready_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1981, x_mon_if_awready_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1982, x_mon_if_awready_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1983, x_mon_if_awready_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1984, x_mon_if_awready_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1985, x_mon_if_awready_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1986, x_mon_if_awready_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1987, x_mon_if_awready_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1988, x_mon_if_awready_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1989, x_mon_if_awready_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1990, x_mon_if_awready_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1991, x_mon_if_awready_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1992, x_mon_if_awready_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1993, x_mon_if_awready_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1994, x_mon_if_awready_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1995, x_mon_if_awready_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1996, x_mon_if_awready_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1997, x_mon_if_awready_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1998, x_mon_if_awready_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 1999, x_mon_if_awready_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2000, x_mon_if_awready_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2001, x_mon_if_awready_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2002, x_mon_if_awready_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2003, x_mon_if_awready_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2004, x_mon_if_awready_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2005, x_mon_if_rvalid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2006, x_mon_if_rvalid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2007, x_mon_if_rvalid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2008, x_mon_if_rvalid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2009, x_mon_if_rvalid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2010, x_mon_if_rvalid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2011, x_mon_if_rvalid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2012, x_mon_if_rvalid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2013, x_mon_if_rvalid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2014, x_mon_if_rvalid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2015, x_mon_if_rvalid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2016, x_mon_if_rvalid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2017, x_mon_if_rvalid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2018, x_mon_if_rvalid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2019, x_mon_if_rvalid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2020, x_mon_if_rvalid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2021, x_mon_if_rvalid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2022, x_mon_if_rvalid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2023, x_mon_if_rvalid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2024, x_mon_if_rvalid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2025, x_mon_if_rvalid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2026, x_mon_if_rvalid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2027, x_mon_if_rvalid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2028, x_mon_if_rvalid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2029, x_mon_if_rvalid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2030, x_mon_if_rvalid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2031, x_mon_if_rvalid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2032, x_mon_if_rvalid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2033, x_mon_if_rvalid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2034, x_mon_if_rvalid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2035, x_mon_if_rvalid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2036, x_mon_if_rvalid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2037, x_mon_if_rlast_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2038, x_mon_if_rlast_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2039, x_mon_if_rlast_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2040, x_mon_if_rlast_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2041, x_mon_if_rlast_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2042, x_mon_if_rlast_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2043, x_mon_if_rlast_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2044, x_mon_if_rlast_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2045, x_mon_if_rlast_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2046, x_mon_if_rlast_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2047, x_mon_if_rlast_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2048, x_mon_if_rlast_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2049, x_mon_if_rlast_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2050, x_mon_if_rlast_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2051, x_mon_if_rlast_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2052, x_mon_if_rlast_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2053, x_mon_if_rlast_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2054, x_mon_if_rlast_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2055, x_mon_if_rlast_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2056, x_mon_if_rlast_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2057, x_mon_if_rlast_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2058, x_mon_if_rlast_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2059, x_mon_if_rlast_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2060, x_mon_if_rlast_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2061, x_mon_if_rlast_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2062, x_mon_if_rlast_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2063, x_mon_if_rlast_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2064, x_mon_if_rlast_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2065, x_mon_if_rlast_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2066, x_mon_if_rlast_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2067, x_mon_if_rlast_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2068, x_mon_if_rlast_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2069, x_mon_if_rdata_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2070, x_mon_if_rdata_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2071, x_mon_if_rdata_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2072, x_mon_if_rdata_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2073, x_mon_if_rdata_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2074, x_mon_if_rdata_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2075, x_mon_if_rdata_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2076, x_mon_if_rdata_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2077, x_mon_if_rdata_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2078, x_mon_if_rdata_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2079, x_mon_if_rdata_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2080, x_mon_if_rdata_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2081, x_mon_if_rdata_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2082, x_mon_if_rdata_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2083, x_mon_if_rdata_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2084, x_mon_if_rdata_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2085, x_mon_if_rdata_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2086, x_mon_if_rdata_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2087, x_mon_if_rdata_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2088, x_mon_if_rdata_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2089, x_mon_if_rdata_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2090, x_mon_if_rdata_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2091, x_mon_if_rdata_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2092, x_mon_if_rdata_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2093, x_mon_if_rdata_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2094, x_mon_if_rdata_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2095, x_mon_if_rdata_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2096, x_mon_if_rdata_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2097, x_mon_if_rdata_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2098, x_mon_if_rdata_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2099, x_mon_if_rdata_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2100, x_mon_if_rdata_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2101, x_mon_if_rresp_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2102, x_mon_if_rresp_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2103, x_mon_if_rresp_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2104, x_mon_if_rresp_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2105, x_mon_if_rresp_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2106, x_mon_if_rresp_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2107, x_mon_if_rresp_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2108, x_mon_if_rresp_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2109, x_mon_if_rresp_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2110, x_mon_if_rresp_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2111, x_mon_if_rresp_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2112, x_mon_if_rresp_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2113, x_mon_if_rresp_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2114, x_mon_if_rresp_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2115, x_mon_if_rresp_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2116, x_mon_if_rresp_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2117, x_mon_if_rresp_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2118, x_mon_if_rresp_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2119, x_mon_if_rresp_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2120, x_mon_if_rresp_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2121, x_mon_if_rresp_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2122, x_mon_if_rresp_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2123, x_mon_if_rresp_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2124, x_mon_if_rresp_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2125, x_mon_if_rresp_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2126, x_mon_if_rresp_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2127, x_mon_if_rresp_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2128, x_mon_if_rresp_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2129, x_mon_if_rresp_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2130, x_mon_if_rresp_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2131, x_mon_if_rresp_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2132, x_mon_if_rresp_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2133, x_mon_if_rid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2134, x_mon_if_rid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2135, x_mon_if_rid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2136, x_mon_if_rid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2137, x_mon_if_rid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2138, x_mon_if_rid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2139, x_mon_if_rid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2140, x_mon_if_rid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2141, x_mon_if_rid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2142, x_mon_if_rid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2143, x_mon_if_rid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2144, x_mon_if_rid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2145, x_mon_if_rid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2146, x_mon_if_rid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2147, x_mon_if_rid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2148, x_mon_if_rid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2149, x_mon_if_rid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2150, x_mon_if_rid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2151, x_mon_if_rid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2152, x_mon_if_rid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2153, x_mon_if_rid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2154, x_mon_if_rid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2155, x_mon_if_rid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2156, x_mon_if_rid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2157, x_mon_if_rid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2158, x_mon_if_rid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2159, x_mon_if_rid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2160, x_mon_if_rid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2161, x_mon_if_rid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2162, x_mon_if_rid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2163, x_mon_if_rid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2164, x_mon_if_rid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2165, x_mon_if_rready_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2166, x_mon_if_rready_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2167, x_mon_if_rready_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2168, x_mon_if_rready_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2169, x_mon_if_rready_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2170, x_mon_if_rready_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2171, x_mon_if_rready_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2172, x_mon_if_rready_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2173, x_mon_if_rready_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2174, x_mon_if_rready_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2175, x_mon_if_rready_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2176, x_mon_if_rready_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2177, x_mon_if_rready_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2178, x_mon_if_rready_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2179, x_mon_if_rready_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2180, x_mon_if_rready_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2181, x_mon_if_rready_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2182, x_mon_if_rready_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2183, x_mon_if_rready_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2184, x_mon_if_rready_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2185, x_mon_if_rready_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2186, x_mon_if_rready_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2187, x_mon_if_rready_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2188, x_mon_if_rready_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2189, x_mon_if_rready_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2190, x_mon_if_rready_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2191, x_mon_if_rready_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2192, x_mon_if_rready_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2193, x_mon_if_rready_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2194, x_mon_if_rready_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2195, x_mon_if_rready_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2196, x_mon_if_rready_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2197, x_mon_if_wvalid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2198, x_mon_if_wvalid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2199, x_mon_if_wvalid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2200, x_mon_if_wvalid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2201, x_mon_if_wvalid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2202, x_mon_if_wvalid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2203, x_mon_if_wvalid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2204, x_mon_if_wvalid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2205, x_mon_if_wvalid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2206, x_mon_if_wvalid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2207, x_mon_if_wvalid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2208, x_mon_if_wvalid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2209, x_mon_if_wvalid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2210, x_mon_if_wvalid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2211, x_mon_if_wvalid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2212, x_mon_if_wvalid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2213, x_mon_if_wvalid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2214, x_mon_if_wvalid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2215, x_mon_if_wvalid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2216, x_mon_if_wvalid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2217, x_mon_if_wvalid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2218, x_mon_if_wvalid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2219, x_mon_if_wvalid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2220, x_mon_if_wvalid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2221, x_mon_if_wvalid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2222, x_mon_if_wvalid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2223, x_mon_if_wvalid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2224, x_mon_if_wvalid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2225, x_mon_if_wvalid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2226, x_mon_if_wvalid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2227, x_mon_if_wvalid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2228, x_mon_if_wvalid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2229, x_mon_if_wlast_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2230, x_mon_if_wlast_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2231, x_mon_if_wlast_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2232, x_mon_if_wlast_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2233, x_mon_if_wlast_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2234, x_mon_if_wlast_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2235, x_mon_if_wlast_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2236, x_mon_if_wlast_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2237, x_mon_if_wlast_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2238, x_mon_if_wlast_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2239, x_mon_if_wlast_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2240, x_mon_if_wlast_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2241, x_mon_if_wlast_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2242, x_mon_if_wlast_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2243, x_mon_if_wlast_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2244, x_mon_if_wlast_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2245, x_mon_if_wlast_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2246, x_mon_if_wlast_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2247, x_mon_if_wlast_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2248, x_mon_if_wlast_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2249, x_mon_if_wlast_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2250, x_mon_if_wlast_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2251, x_mon_if_wlast_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2252, x_mon_if_wlast_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2253, x_mon_if_wlast_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2254, x_mon_if_wlast_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2255, x_mon_if_wlast_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2256, x_mon_if_wlast_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2257, x_mon_if_wlast_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2258, x_mon_if_wlast_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2259, x_mon_if_wlast_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2260, x_mon_if_wlast_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2261, x_mon_if_wdata_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2262, x_mon_if_wdata_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2263, x_mon_if_wdata_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2264, x_mon_if_wdata_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2265, x_mon_if_wdata_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2266, x_mon_if_wdata_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2267, x_mon_if_wdata_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2268, x_mon_if_wdata_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2269, x_mon_if_wdata_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2270, x_mon_if_wdata_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2271, x_mon_if_wdata_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2272, x_mon_if_wdata_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2273, x_mon_if_wdata_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2274, x_mon_if_wdata_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2275, x_mon_if_wdata_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2276, x_mon_if_wdata_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2277, x_mon_if_wdata_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2278, x_mon_if_wdata_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2279, x_mon_if_wdata_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2280, x_mon_if_wdata_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2281, x_mon_if_wdata_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2282, x_mon_if_wdata_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2283, x_mon_if_wdata_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2284, x_mon_if_wdata_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2285, x_mon_if_wdata_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2286, x_mon_if_wdata_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2287, x_mon_if_wdata_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2288, x_mon_if_wdata_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2289, x_mon_if_wdata_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2290, x_mon_if_wdata_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2291, x_mon_if_wdata_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2292, x_mon_if_wdata_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2293, x_mon_if_wstrb_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2294, x_mon_if_wstrb_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2295, x_mon_if_wstrb_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2296, x_mon_if_wstrb_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2297, x_mon_if_wstrb_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2298, x_mon_if_wstrb_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2299, x_mon_if_wstrb_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2300, x_mon_if_wstrb_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2301, x_mon_if_wstrb_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2302, x_mon_if_wstrb_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2303, x_mon_if_wstrb_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2304, x_mon_if_wstrb_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2305, x_mon_if_wstrb_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2306, x_mon_if_wstrb_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2307, x_mon_if_wstrb_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2308, x_mon_if_wstrb_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2309, x_mon_if_wstrb_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2310, x_mon_if_wstrb_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2311, x_mon_if_wstrb_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2312, x_mon_if_wstrb_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2313, x_mon_if_wstrb_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2314, x_mon_if_wstrb_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2315, x_mon_if_wstrb_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2316, x_mon_if_wstrb_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2317, x_mon_if_wstrb_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2318, x_mon_if_wstrb_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2319, x_mon_if_wstrb_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2320, x_mon_if_wstrb_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2321, x_mon_if_wstrb_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2322, x_mon_if_wstrb_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2323, x_mon_if_wstrb_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2324, x_mon_if_wstrb_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2325, x_mon_if_wid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2326, x_mon_if_wid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2327, x_mon_if_wid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2328, x_mon_if_wid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2329, x_mon_if_wid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2330, x_mon_if_wid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2331, x_mon_if_wid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2332, x_mon_if_wid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2333, x_mon_if_wid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2334, x_mon_if_wid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2335, x_mon_if_wid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2336, x_mon_if_wid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2337, x_mon_if_wid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2338, x_mon_if_wid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2339, x_mon_if_wid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2340, x_mon_if_wid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2341, x_mon_if_wid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2342, x_mon_if_wid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2343, x_mon_if_wid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2344, x_mon_if_wid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2345, x_mon_if_wid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2346, x_mon_if_wid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2347, x_mon_if_wid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2348, x_mon_if_wid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2349, x_mon_if_wid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2350, x_mon_if_wid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2351, x_mon_if_wid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2352, x_mon_if_wid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2353, x_mon_if_wid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2354, x_mon_if_wid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2355, x_mon_if_wid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2356, x_mon_if_wid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2357, x_mon_if_wready_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2358, x_mon_if_wready_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2359, x_mon_if_wready_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2360, x_mon_if_wready_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2361, x_mon_if_wready_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2362, x_mon_if_wready_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2363, x_mon_if_wready_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2364, x_mon_if_wready_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2365, x_mon_if_wready_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2366, x_mon_if_wready_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2367, x_mon_if_wready_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2368, x_mon_if_wready_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2369, x_mon_if_wready_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2370, x_mon_if_wready_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2371, x_mon_if_wready_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2372, x_mon_if_wready_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2373, x_mon_if_wready_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2374, x_mon_if_wready_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2375, x_mon_if_wready_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2376, x_mon_if_wready_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2377, x_mon_if_wready_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2378, x_mon_if_wready_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2379, x_mon_if_wready_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2380, x_mon_if_wready_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2381, x_mon_if_wready_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2382, x_mon_if_wready_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2383, x_mon_if_wready_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2384, x_mon_if_wready_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2385, x_mon_if_wready_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2386, x_mon_if_wready_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2387, x_mon_if_wready_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2388, x_mon_if_wready_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2389, x_mon_if_bvalid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2390, x_mon_if_bvalid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2391, x_mon_if_bvalid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2392, x_mon_if_bvalid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2393, x_mon_if_bvalid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2394, x_mon_if_bvalid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2395, x_mon_if_bvalid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2396, x_mon_if_bvalid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2397, x_mon_if_bvalid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2398, x_mon_if_bvalid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2399, x_mon_if_bvalid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2400, x_mon_if_bvalid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2401, x_mon_if_bvalid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2402, x_mon_if_bvalid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2403, x_mon_if_bvalid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2404, x_mon_if_bvalid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2405, x_mon_if_bvalid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2406, x_mon_if_bvalid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2407, x_mon_if_bvalid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2408, x_mon_if_bvalid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2409, x_mon_if_bvalid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2410, x_mon_if_bvalid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2411, x_mon_if_bvalid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2412, x_mon_if_bvalid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2413, x_mon_if_bvalid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2414, x_mon_if_bvalid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2415, x_mon_if_bvalid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2416, x_mon_if_bvalid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2417, x_mon_if_bvalid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2418, x_mon_if_bvalid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2419, x_mon_if_bvalid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2420, x_mon_if_bvalid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2421, x_mon_if_bresp_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2422, x_mon_if_bresp_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2423, x_mon_if_bresp_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2424, x_mon_if_bresp_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2425, x_mon_if_bresp_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2426, x_mon_if_bresp_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2427, x_mon_if_bresp_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2428, x_mon_if_bresp_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2429, x_mon_if_bresp_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2430, x_mon_if_bresp_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2431, x_mon_if_bresp_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2432, x_mon_if_bresp_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2433, x_mon_if_bresp_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2434, x_mon_if_bresp_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2435, x_mon_if_bresp_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2436, x_mon_if_bresp_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2437, x_mon_if_bresp_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2438, x_mon_if_bresp_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2439, x_mon_if_bresp_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2440, x_mon_if_bresp_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2441, x_mon_if_bresp_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2442, x_mon_if_bresp_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2443, x_mon_if_bresp_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2444, x_mon_if_bresp_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2445, x_mon_if_bresp_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2446, x_mon_if_bresp_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2447, x_mon_if_bresp_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2448, x_mon_if_bresp_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2449, x_mon_if_bresp_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2450, x_mon_if_bresp_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2451, x_mon_if_bresp_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2452, x_mon_if_bresp_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2453, x_mon_if_bid_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2454, x_mon_if_bid_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2455, x_mon_if_bid_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2456, x_mon_if_bid_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2457, x_mon_if_bid_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2458, x_mon_if_bid_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2459, x_mon_if_bid_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2460, x_mon_if_bid_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2461, x_mon_if_bid_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2462, x_mon_if_bid_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2463, x_mon_if_bid_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2464, x_mon_if_bid_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2465, x_mon_if_bid_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2466, x_mon_if_bid_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2467, x_mon_if_bid_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2468, x_mon_if_bid_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2469, x_mon_if_bid_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2470, x_mon_if_bid_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2471, x_mon_if_bid_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2472, x_mon_if_bid_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2473, x_mon_if_bid_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2474, x_mon_if_bid_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2475, x_mon_if_bid_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2476, x_mon_if_bid_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2477, x_mon_if_bid_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2478, x_mon_if_bid_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2479, x_mon_if_bid_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2480, x_mon_if_bid_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2481, x_mon_if_bid_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2482, x_mon_if_bid_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2483, x_mon_if_bid_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2484, x_mon_if_bid_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2485, x_mon_if_bready_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2486, x_mon_if_bready_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2487, x_mon_if_bready_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2488, x_mon_if_bready_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2489, x_mon_if_bready_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2490, x_mon_if_bready_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2491, x_mon_if_bready_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2492, x_mon_if_bready_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2493, x_mon_if_bready_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2494, x_mon_if_bready_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2495, x_mon_if_bready_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2496, x_mon_if_bready_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2497, x_mon_if_bready_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2498, x_mon_if_bready_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2499, x_mon_if_bready_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2500, x_mon_if_bready_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2501, x_mon_if_bready_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2502, x_mon_if_bready_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2503, x_mon_if_bready_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2504, x_mon_if_bready_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2505, x_mon_if_bready_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2506, x_mon_if_bready_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2507, x_mon_if_bready_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2508, x_mon_if_bready_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2509, x_mon_if_bready_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2510, x_mon_if_bready_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2511, x_mon_if_bready_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2512, x_mon_if_bready_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2513, x_mon_if_bready_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2514, x_mon_if_bready_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2515, x_mon_if_bready_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2516, x_mon_if_bready_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2517, x_mon_if_cactive_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2518, x_mon_if_cactive_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2519, x_mon_if_cactive_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2520, x_mon_if_cactive_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2521, x_mon_if_cactive_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2522, x_mon_if_cactive_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2523, x_mon_if_cactive_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2524, x_mon_if_cactive_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2525, x_mon_if_cactive_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2526, x_mon_if_cactive_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2527, x_mon_if_cactive_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2528, x_mon_if_cactive_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2529, x_mon_if_cactive_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2530, x_mon_if_cactive_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2531, x_mon_if_cactive_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2532, x_mon_if_cactive_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2533, x_mon_if_cactive_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2534, x_mon_if_cactive_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2535, x_mon_if_cactive_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2536, x_mon_if_cactive_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2537, x_mon_if_cactive_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2538, x_mon_if_cactive_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2539, x_mon_if_cactive_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2540, x_mon_if_cactive_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2541, x_mon_if_cactive_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2542, x_mon_if_cactive_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2543, x_mon_if_cactive_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2544, x_mon_if_cactive_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2545, x_mon_if_cactive_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2546, x_mon_if_cactive_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2547, x_mon_if_cactive_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2548, x_mon_if_cactive_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2549, x_mon_if_csysreq_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2550, x_mon_if_csysreq_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2551, x_mon_if_csysreq_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2552, x_mon_if_csysreq_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2553, x_mon_if_csysreq_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2554, x_mon_if_csysreq_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2555, x_mon_if_csysreq_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2556, x_mon_if_csysreq_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2557, x_mon_if_csysreq_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2558, x_mon_if_csysreq_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2559, x_mon_if_csysreq_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2560, x_mon_if_csysreq_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2561, x_mon_if_csysreq_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2562, x_mon_if_csysreq_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2563, x_mon_if_csysreq_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2564, x_mon_if_csysreq_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2565, x_mon_if_csysreq_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2566, x_mon_if_csysreq_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2567, x_mon_if_csysreq_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2568, x_mon_if_csysreq_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2569, x_mon_if_csysreq_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2570, x_mon_if_csysreq_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2571, x_mon_if_csysreq_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2572, x_mon_if_csysreq_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2573, x_mon_if_csysreq_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2574, x_mon_if_csysreq_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2575, x_mon_if_csysreq_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2576, x_mon_if_csysreq_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2577, x_mon_if_csysreq_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2578, x_mon_if_csysreq_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2579, x_mon_if_csysreq_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2580, x_mon_if_csysreq_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2581, x_mon_if_csysack_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2582, x_mon_if_csysack_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2583, x_mon_if_csysack_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2584, x_mon_if_csysack_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2585, x_mon_if_csysack_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2586, x_mon_if_csysack_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2587, x_mon_if_csysack_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2588, x_mon_if_csysack_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2589, x_mon_if_csysack_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2590, x_mon_if_csysack_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2591, x_mon_if_csysack_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2592, x_mon_if_csysack_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2593, x_mon_if_csysack_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2594, x_mon_if_csysack_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2595, x_mon_if_csysack_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2596, x_mon_if_csysack_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2597, x_mon_if_csysack_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2598, x_mon_if_csysack_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2599, x_mon_if_csysack_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2600, x_mon_if_csysack_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2601, x_mon_if_csysack_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2602, x_mon_if_csysack_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2603, x_mon_if_csysack_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2604, x_mon_if_csysack_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2605, x_mon_if_csysack_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2606, x_mon_if_csysack_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2607, x_mon_if_csysack_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2608, x_mon_if_csysack_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2609, x_mon_if_csysack_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2610, x_mon_if_csysack_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2611, x_mon_if_csysack_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2612, x_mon_if_csysack_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2613, x_mon_if_awsideband_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2614, x_mon_if_awsideband_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2615, x_mon_if_awsideband_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2616, x_mon_if_awsideband_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2617, x_mon_if_awsideband_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2618, x_mon_if_awsideband_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2619, x_mon_if_awsideband_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2620, x_mon_if_awsideband_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2621, x_mon_if_awsideband_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2622, x_mon_if_awsideband_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2623, x_mon_if_awsideband_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2624, x_mon_if_awsideband_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2625, x_mon_if_awsideband_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2626, x_mon_if_awsideband_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2627, x_mon_if_awsideband_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2628, x_mon_if_awsideband_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2629, x_mon_if_awsideband_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2630, x_mon_if_awsideband_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2631, x_mon_if_awsideband_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2632, x_mon_if_awsideband_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2633, x_mon_if_awsideband_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2634, x_mon_if_awsideband_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2635, x_mon_if_awsideband_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2636, x_mon_if_awsideband_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2637, x_mon_if_awsideband_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2638, x_mon_if_awsideband_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2639, x_mon_if_awsideband_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2640, x_mon_if_awsideband_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2641, x_mon_if_awsideband_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2642, x_mon_if_awsideband_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2643, x_mon_if_awsideband_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2644, x_mon_if_awsideband_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2645, x_mon_if_arsideband_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2646, x_mon_if_arsideband_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2647, x_mon_if_arsideband_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2648, x_mon_if_arsideband_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2649, x_mon_if_arsideband_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2650, x_mon_if_arsideband_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2651, x_mon_if_arsideband_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2652, x_mon_if_arsideband_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2653, x_mon_if_arsideband_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2654, x_mon_if_arsideband_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2655, x_mon_if_arsideband_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2656, x_mon_if_arsideband_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2657, x_mon_if_arsideband_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2658, x_mon_if_arsideband_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2659, x_mon_if_arsideband_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2660, x_mon_if_arsideband_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2661, x_mon_if_arsideband_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2662, x_mon_if_arsideband_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2663, x_mon_if_arsideband_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2664, x_mon_if_arsideband_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2665, x_mon_if_arsideband_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2666, x_mon_if_arsideband_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2667, x_mon_if_arsideband_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2668, x_mon_if_arsideband_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2669, x_mon_if_arsideband_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2670, x_mon_if_arsideband_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2671, x_mon_if_arsideband_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2672, x_mon_if_arsideband_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2673, x_mon_if_arsideband_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2674, x_mon_if_arsideband_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2675, x_mon_if_arsideband_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2676, x_mon_if_arsideband_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2677, x_mon_if_rsideband_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2678, x_mon_if_rsideband_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2679, x_mon_if_rsideband_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2680, x_mon_if_rsideband_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2681, x_mon_if_rsideband_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2682, x_mon_if_rsideband_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2683, x_mon_if_rsideband_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2684, x_mon_if_rsideband_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2685, x_mon_if_rsideband_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2686, x_mon_if_rsideband_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2687, x_mon_if_rsideband_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2688, x_mon_if_rsideband_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2689, x_mon_if_rsideband_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2690, x_mon_if_rsideband_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2691, x_mon_if_rsideband_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2692, x_mon_if_rsideband_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2693, x_mon_if_rsideband_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2694, x_mon_if_rsideband_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2695, x_mon_if_rsideband_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2696, x_mon_if_rsideband_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2697, x_mon_if_rsideband_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2698, x_mon_if_rsideband_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2699, x_mon_if_rsideband_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2700, x_mon_if_rsideband_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2701, x_mon_if_rsideband_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2702, x_mon_if_rsideband_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2703, x_mon_if_rsideband_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2704, x_mon_if_rsideband_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2705, x_mon_if_rsideband_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2706, x_mon_if_rsideband_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2707, x_mon_if_rsideband_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2708, x_mon_if_rsideband_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2709, x_mon_if_wsideband_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2710, x_mon_if_wsideband_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2711, x_mon_if_wsideband_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2712, x_mon_if_wsideband_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2713, x_mon_if_wsideband_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2714, x_mon_if_wsideband_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2715, x_mon_if_wsideband_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2716, x_mon_if_wsideband_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2717, x_mon_if_wsideband_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2718, x_mon_if_wsideband_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2719, x_mon_if_wsideband_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2720, x_mon_if_wsideband_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2721, x_mon_if_wsideband_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2722, x_mon_if_wsideband_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2723, x_mon_if_wsideband_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2724, x_mon_if_wsideband_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2725, x_mon_if_wsideband_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2726, x_mon_if_wsideband_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2727, x_mon_if_wsideband_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2728, x_mon_if_wsideband_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2729, x_mon_if_wsideband_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2730, x_mon_if_wsideband_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2731, x_mon_if_wsideband_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2732, x_mon_if_wsideband_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2733, x_mon_if_wsideband_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2734, x_mon_if_wsideband_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2735, x_mon_if_wsideband_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2736, x_mon_if_wsideband_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2737, x_mon_if_wsideband_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2738, x_mon_if_wsideband_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2739, x_mon_if_wsideband_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2740, x_mon_if_wsideband_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2741, x_mon_if_bsideband_m0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2742, x_mon_if_bsideband_m1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2743, x_mon_if_bsideband_m2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2744, x_mon_if_bsideband_m3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2745, x_mon_if_bsideband_m4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2746, x_mon_if_bsideband_m5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2747, x_mon_if_bsideband_m6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2748, x_mon_if_bsideband_m7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2749, x_mon_if_bsideband_m8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2750, x_mon_if_bsideband_m9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2751, x_mon_if_bsideband_m10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2752, x_mon_if_bsideband_m11, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2753, x_mon_if_bsideband_m12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2754, x_mon_if_bsideband_m13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2755, x_mon_if_bsideband_m14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2756, x_mon_if_bsideband_m15, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2757, x_mon_if_bsideband_m16, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2758, x_mon_if_bsideband_m17, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2759, x_mon_if_bsideband_m18, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2760, x_mon_if_bsideband_m19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2761, x_mon_if_bsideband_m20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2762, x_mon_if_bsideband_m21, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2763, x_mon_if_bsideband_m22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2764, x_mon_if_bsideband_m23, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2765, x_mon_if_bsideband_m24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2766, x_mon_if_bsideband_m25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2767, x_mon_if_bsideband_m26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2768, x_mon_if_bsideband_m27, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2769, x_mon_if_bsideband_m28, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2770, x_mon_if_bsideband_m29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2771, x_mon_if_bsideband_m30, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vmc_add_interface_signal(4, 2772, x_mon_if_bsideband_m31, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0 );
    $vera_add_parameter("vera_load_ApbMonitor", vera_load_ApbMonitor, 2);
    $vera_add_parameter("vera_load_ApbCoverage", vera_load_ApbCoverage, 2);
    $vera_add_parameter("vera_load_ApbMonitorCommands", vera_load_ApbMonitorCommands, 2);
    $vera_add_parameter("vera_load_AxiMon64Cfg", vera_load_AxiMon64Cfg, 2);
    $vera_add_parameter("vera_load_AxiMonitorCoverage", vera_load_AxiMonitorCoverage, 2);
    $vera_add_parameter("vera_load_AxiMonSysChks", vera_load_AxiMonSysChks, 2);
    $vera_add_parameter("vera_load_AxiMonitor64Internal", vera_load_AxiMonitor64Internal, 2);
    $vera_add_parameter("vera_load_AxiMonitor", vera_load_AxiMonitor, 2);
    $vera_add_parameter("vera_load_ApbSlave", vera_load_ApbSlave, 2);
    $vera_add_parameter("vera_load_ApbSlaveCommands", vera_load_ApbSlaveCommands, 2);
    $vera_add_parameter("vera_load_ApbXact", vera_load_ApbXact, 2);
    $vera_add_parameter("vera_load_AmbaBufferMgr", vera_load_AmbaBufferMgr, 2);
    $vera_add_parameter("vera_load_AhbXact", vera_load_AhbXact, 2);
    $vera_add_parameter("vera_load_AmbaXact", vera_load_AmbaXact, 2);
    $vera_add_parameter("vera_load_AmbaCommands", vera_load_AmbaCommands, 2);
    $vera_add_parameter("vera_load_AmbaModel", vera_load_AmbaModel, 2);
    $vera_add_parameter("vera_load_AmbaLibrary", vera_load_AmbaLibrary, 2);
    $vera_add_parameter("vera_load_AxiMasterDriver", vera_load_AxiMasterDriver, 2);
    $vera_add_parameter("vera_load_AxiMasterReceiver", vera_load_AxiMasterReceiver, 2);
    $vera_add_parameter("vera_load_AxiMstrXmitMgr", vera_load_AxiMstrXmitMgr, 2);
    $vera_add_parameter("vera_load_AxiMstrTimer", vera_load_AxiMstrTimer, 2);
    $vera_add_parameter("vera_load_AxiMstrSemaData", vera_load_AxiMstrSemaData, 2);
    $vera_add_parameter("vera_load_AxiMstrRcvMgr", vera_load_AxiMstrRcvMgr, 2);
    $vera_add_parameter("vera_load_AxiMstrOutStndngMgr", vera_load_AxiMstrOutStndngMgr, 2);
    $vera_add_parameter("vera_load_AxiMstrIntlver", vera_load_AxiMstrIntlver, 2);
    $vera_add_parameter("vera_load_AxiMstrInnerBuffer", vera_load_AxiMstrInnerBuffer, 2);
    $vera_add_parameter("vera_load_AxiMasterBuffer", vera_load_AxiMasterBuffer, 2);
    $vera_add_parameter("vera_load_AxiMasterInternal", vera_load_AxiMasterInternal, 2);
    $vera_add_parameter("vera_load_AxiMasterCommands", vera_load_AxiMasterCommands, 2);
    $vera_add_parameter("vera_load_AxiMaster", vera_load_AxiMaster, 2);
    $vera_add_parameter("vera_load_AxiTransactionLog", vera_load_AxiTransactionLog, 2);
    $vera_add_parameter("vera_load_AmbaLog", vera_load_AmbaLog, 2);
    $vera_add_parameter("vera_load_AxiMonitorCommonCoverage", vera_load_AxiMonitorCommonCoverage, 2);
    $vera_add_parameter("vera_load_AxiMonitorCommands", vera_load_AxiMonitorCommands, 2);
    $vera_add_parameter("vera_load_AxiMonitorBuffer", vera_load_AxiMonitorBuffer, 2);
    $vera_add_parameter("vera_load_AxiMonChChks", vera_load_AxiMonChChks, 2);
    $vera_add_parameter("vera_load_AxiMonXactChks", vera_load_AxiMonXactChks, 2);
    $vera_add_parameter("vera_load_AxiMonChecker", vera_load_AxiMonChecker, 2);
    $vera_add_parameter("vera_load_AxiMonXactBuf", vera_load_AxiMonXactBuf, 2);
    $vera_add_parameter("vera_load_AxiMonCh", vera_load_AxiMonCh, 2);
    $vera_add_parameter("vera_load_AxiMonPort", vera_load_AxiMonPort, 2);
    $vera_add_parameter("vera_load_AxiMonCfg", vera_load_AxiMonCfg, 2);
    $vera_add_parameter("vera_load_AxiMonitorInternal", vera_load_AxiMonitorInternal, 2);
    $vera_add_parameter("vera_load_AxiBusArchitectureConfiguration_rvm", vera_load_AxiBusArchitectureConfiguration_rvm, 2);
    $vera_add_parameter("vera_load_AxiMonitorExtendedTransaction_rvm", vera_load_AxiMonitorExtendedTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiMonitorTransaction_rvm", vera_load_AxiMonitorTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiSlaveTransactionInternal", vera_load_AxiSlaveTransactionInternal, 2);
    $vera_add_parameter("vera_load_AxiMasterTransactionInternal", vera_load_AxiMasterTransactionInternal, 2);
    $vera_add_parameter("vera_load_AxiTransactionInternal", vera_load_AxiTransactionInternal, 2);
    $vera_add_parameter("vera_load_AxiConfigurationInternal", vera_load_AxiConfigurationInternal, 2);
    $vera_add_parameter("vera_load_AxiConfiguration_rvm", vera_load_AxiConfiguration_rvm, 2);
    $vera_add_parameter("vera_load_AxiSlaveExtendedTransaction_rvm", vera_load_AxiSlaveExtendedTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiSlaveTransaction_rvm", vera_load_AxiSlaveTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiMasterExtendedTransaction_rvm", vera_load_AxiMasterExtendedTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiMasterTransaction_rvm", vera_load_AxiMasterTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiTransaction_rvm", vera_load_AxiTransaction_rvm, 2);
    $vera_add_parameter("vera_load_AxiMatchObj", vera_load_AxiMatchObj, 2);
    $vera_add_parameter("vera_load_AxiMatchMgr", vera_load_AxiMatchMgr, 2);
    $vera_add_parameter("vera_load_AxiResponseMgr", vera_load_AxiResponseMgr, 2);
    $vera_add_parameter("vera_load_AxiDriver", vera_load_AxiDriver, 2);
    $vera_add_parameter("vera_load_AxiReceiver", vera_load_AxiReceiver, 2);
    $vera_add_parameter("vera_load_AxiRcvMgr", vera_load_AxiRcvMgr, 2);
    $vera_add_parameter("vera_load_AxiChXfer", vera_load_AxiChXfer, 2);
    $vera_add_parameter("vera_load_AxiBufferMgr", vera_load_AxiBufferMgr, 2);
    $vera_add_parameter("vera_load_AxiMdlCfg", vera_load_AxiMdlCfg, 2);
    $vera_add_parameter("vera_load_AxiCommands", vera_load_AxiCommands, 2);
    $vera_add_parameter("vera_load_AxiModel", vera_load_AxiModel, 2);
    $vera_add_parameter("vera_load_AxiLib", vera_load_AxiLib, 2);
    $vera_add_parameter("vera_load_dw_vip_rvm", vera_load_dw_vip_rvm, 2);
    $vera_add_parameter("vera_load_VmtCoverageCommands", vera_load_VmtCoverageCommands, 2);
    $vera_add_parameter("vera_load_VmtCoverageManager", vera_load_VmtCoverageManager, 2);
    $vera_add_parameter("vera_load_VmtCoverageGroup", vera_load_VmtCoverageGroup, 2);
    $vera_add_parameter("vera_load_VmtCoveragePoint", vera_load_VmtCoveragePoint, 2);
    $vera_add_parameter("vera_load_VmtCoverageBase", vera_load_VmtCoverageBase, 2);
    $vera_add_parameter("vera_load_VmtTransactionMonitorCommands", vera_load_VmtTransactionMonitorCommands, 2);
    $vera_add_parameter("vera_load_VmtTransactionChoiceMonitor", vera_load_VmtTransactionChoiceMonitor, 2);
    $vera_add_parameter("vera_load_VmtTransactionSequenceMonitor", vera_load_VmtTransactionSequenceMonitor, 2);
    $vera_add_parameter("vera_load_VmtProtocolTransactionMonitor", vera_load_VmtProtocolTransactionMonitor, 2);
    $vera_add_parameter("vera_load_VmtTransactionMonitor", vera_load_VmtTransactionMonitor, 2);
    $vera_add_parameter("vera_load_VmtPayload", vera_load_VmtPayload, 2);
    $vera_add_parameter("vera_load_VmtTransactionInfo", vera_load_VmtTransactionInfo, 2);
    $vera_add_parameter("vera_load_VmtTransactionExpression", vera_load_VmtTransactionExpression, 2);
    $vera_add_parameter("vera_load_VmtTransactionCommands", vera_load_VmtTransactionCommands, 2);
    $vera_add_parameter("vera_load_VmtTransactionChoiceGenerator", vera_load_VmtTransactionChoiceGenerator, 2);
    $vera_add_parameter("vera_load_VmtTransactionSequenceGenerator", vera_load_VmtTransactionSequenceGenerator, 2);
    $vera_add_parameter("vera_load_VmtProtocolTransactionGenerator", vera_load_VmtProtocolTransactionGenerator, 2);
    $vera_add_parameter("vera_load_VmtTransactionGenerator", vera_load_VmtTransactionGenerator, 2);
    $vera_add_parameter("vera_load_VmtTransaction", vera_load_VmtTransaction, 2);
    $vera_add_parameter("vera_load_VmtXactBase", vera_load_VmtXactBase, 2);
    $vera_add_parameter("vera_load_VmtMem", vera_load_VmtMem, 2);
    $vera_add_parameter("vera_load_VmtCommonCommands", vera_load_VmtCommonCommands, 2);
    $vera_add_parameter("vera_load_VmtCommandManager", vera_load_VmtCommandManager, 2);
    $vera_add_parameter("vera_load_VmtCommandDispatch", vera_load_VmtCommandDispatch, 2);
    $vera_add_parameter("vera_load_VmtBase", vera_load_VmtBase, 2);
    $vera_add_parameter("vera_load_VmtMessageService", vera_load_VmtMessageService, 2);
    $vera_add_parameter("vera_udf_VipCommon", vera_udf_VipCommon, 2);
    $vera_add_parameter("vera_udf_VmtModelManager", vera_udf_VmtModelManager, 2);
    $vera_add_parameter("vera_runtime_information", vera_runtime_information, 2);
    $vera_add_parameter("vera_load_all", vera_load_all, 2);


    $vmc_start_program() ;


end
endmodule
