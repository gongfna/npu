
/*
 ------------------------------------------------------------------------
--
--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
--                            ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this
--  software is subject to the terms and conditions of a written
--  license agreement between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
*/

//-----------------------------------------------------------------------------
// Filename    : DW_axi_x2p.v
// Created     : Dec 15 2005
// Description : Top level AXI-to-APB bridge.
//               A unidirectional bridge which is an AXI slave and
//               an APB master.
//-----------------------------------------------------------------------------

module DW_axi_x2p (






   // Outputs
   rdata 
                   ,bresp 
                   ,rresp 
                   ,bid 
                   ,rid 
                   ,awready 
                   ,wready 
                   ,bvalid 
                   ,arready
                   ,rlast 
                   ,rvalid
                   ,psel_s0 
                   ,paddr 
                   ,penable 
                   ,pwdata
                   ,pwrite 
                   ,// Inputs
                   aclk 
                   ,pclk 
                   ,aresetn 
                   ,awaddr 
                   ,wdata 
                   ,araddr 
                   ,awvalid 
                   ,wlast 
                   ,wvalid
                   ,bready 
                   ,arvalid 
                   ,rready 
                   ,awburst 
                   ,awlock 
                   ,arburst 
                   ,arlock 
                   ,awsize
                   ,awprot 
                   ,arsize 
                   ,arprot 
                   ,awid 
                   ,wid 
                   ,awlen 
                   ,awcache 
                   ,wstrb 
                   ,arid
                   ,arlen 
                   ,arcache 
                   ,presetn 
                   ,prdata_s0 
                   );

  input                             aclk; // AXI clock
  input [`X2P_AXI_AW-1:0]               araddr; // AXI read address
  input [1:0]                       arburst; // AXI read burst
  input [3:0]                       arcache; // AXI read cache attributes
  input                             aresetn; // AXI reset
  input [`X2P_AXI_SIDW-1:0]             arid; // AXI read ID
  input [`LEN_WIDTH-1:0]            arlen; // AXI read length
  input [1:0]                       arlock; // AXI read lock
  input [2:0]                       arprot; // AXI read protection attributes
  input [2:0]                       arsize; // AXI read size
  input                             arvalid; // AXI read valid
  input [`X2P_AXI_AW-1:0]               awaddr; // AXI write address
  input [1:0]                       awburst; // AXI write burst
  input [3:0]                       awcache; // AXI write cache attributes
  input [`X2P_AXI_SIDW-1:0]             awid; // AXI write ID
  input [`LEN_WIDTH-1:0]            awlen; // AXI write length
  input [1:0]                       awlock; // AXI write lock
  input [2:0]                       awprot; // AXI write protection indicator
  input [2:0]                       awsize; // AXI write size
  input                             awvalid; // AXI write valid
  input                             bready; // AXI write response ready
  input                             rready; // AXI read response ready
  input [`X2P_AXI_DW-1:0]               wdata; // AXI write data
  input [`X2P_AXI_SIDW-1:0]             wid; // AXI write data ID
  input                             wlast; // AXI write data last
  input [`X2P_AXI_WSTRB_WIDTH-1:0]  wstrb; // AXI write data strobes
  input                             wvalid; // AXI write data valid

  input                             pclk; // APB clock
  input [`X2P_APB_DATA_WIDTH-1:0]   prdata_s0; // APB read data slave 0
  input                             presetn; // APB reset

  output                            arready; // AXI read ready
  output                            awready; // AXI write ready
  output [`X2P_AXI_SIDW-1:0]            bid; // AXI write response ID
  output [1:0]                      bresp; // AXI write response
  output                            bvalid; // AXI write response valid
  output [`X2P_AXI_DW-1:0]              rdata; // AXI read data
  output [`X2P_AXI_SIDW-1:0]            rid; // AXI read data ID
  output                            rlast; // AXI read data last
  output [1:0]                      rresp; // AXI read response
  output                            rvalid; // AXI read valid
  output                            wready; // AXI write ready

  output [`X2P_APB_ADDR_WIDTH-1:0]  paddr; // APB address
  output                            penable; // APB enable
  output                            psel_s0; // APB select slave 0
  output [`X2P_APB_DATA_WIDTH-1:0]  pwdata; // APB write data
  output                            pwrite; // APB write indicator



  // "Command" words
  wire [`X2P_CMD_QUEUE_WIDTH:0]     hcmd_queue_wd_int,
                                    cmd_queue_wd;

  // Write data (actually {WDATA,WSTRB,WLAST}
  wire [`X2P_AXI_WDFIFO_WIDTH-1:0]  awr_buff_wd,
                                    hwword_int;

  // Responses returned through write response, read data buffers
  wire                              hwstatus_int;
  wire                              pop_resp_status_wd;
  wire                              hrstatus_int;
  wire                              arstatus_int;

  // IDs returned through write response, read data buffers
  wire [`X2P_AXI_SIDW-1:0]              hwid_int,
                                    pop_resp_id_wd,
                                    hrid_int,
                                    arid_int;

  // Read data
  wire [`X2P_AXI_DW-1:0]                ardata_int,
                                    hrdata_int;
  wire                              read_buff_full;

  // read data from the APB muxed in from the slaves
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata;


  wire                              pready_s0_s;
  wire                              pready_s1_s;
  wire                              pready_s2_s;
  wire                              pready_s3_s;
  wire                              pready_s4_s;
  wire                              pready_s5_s;
  wire                              pready_s6_s;
  wire                              pready_s7_s;
  wire                              pready_s8_s;
  wire                              pready_s9_s;
  wire                              pready_s10_s;
  wire                              pready_s11_s;
  wire                              pready_s12_s;
  wire                              pready_s13_s;
  wire                              pready_s14_s;
  wire                              pready_s15_s;

  wire                              pslverr_s0_s;
  wire                              pslverr_s1_s;
  wire                              pslverr_s2_s;
  wire                              pslverr_s3_s;
  wire                              pslverr_s4_s;
  wire                              pslverr_s5_s;
  wire                              pslverr_s6_s;
  wire                              pslverr_s7_s;
  wire                              pslverr_s8_s;
  wire                              pslverr_s9_s;
  wire                              pslverr_s10_s;
  wire                              pslverr_s11_s;
  wire                              pslverr_s12_s;
  wire                              pslverr_s13_s;
  wire                              pslverr_s14_s;
  wire                              pslverr_s15_s;

  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s0_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s1_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s2_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s3_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s4_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s5_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s6_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s7_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s8_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s9_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s10_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s11_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s12_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s13_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s14_s;
  wire [`X2P_APB_DATA_WIDTH-1:0]    prdata_s15_s;

  // Internal wires in the AXI-clock domain
  wire                              awvalid_gtd;
  wire                              awready_int;
  wire                              wvalid_gtd;
  wire                              wready_int;
  wire                              arvalid_gtd;
  wire                              arready_int;
  wire                              resp_pop_rdy_n;
  wire                              pop_resp_n;
  wire                              wr_buff_push_rdy_n;
  wire                              push_write_buffer_n;
  wire                              arlast_int;
  wire                              pop_rdata_n;
  wire                              arvalid_int_n;
  wire                              cmd_push_af;
  wire                              cmd_queue_push_rdy_n;
  wire                              wr_push_cmd_queue_n;
  wire                              rd_push_cmd_queue_n;

  // Internal wires in the AHB-clock domain
  wire                              hcmd_rdy_int_n;
  wire                              pop_hcmd_int_n;
  wire                              hwdata_rdy_int_n;
  wire                              pop_wdata_int_n;
  wire                              hresp_rdy_int_n;
  wire                              push_resp_int_n;
  wire                              hrlast_int;
  wire                              push_data_int_n;
  wire                              push_cmd_queue_n;

  // when using a single clock connect aclk internally
  wire                              pclk_int;
  wire                              presetn_int;

  wire                             ready_en;

  assign                            pclk_int = pclk;
  assign                            presetn_int = presetn;
  wire                              pready, pslverr;

  wire [15:0]                       psel;

  assign {
         psel_s0} = psel;


  assign prdata_s0_s = prdata_s0;

  assign prdata_s1_s = 0;
  assign prdata_s2_s = 0;
  assign prdata_s3_s = 0;
  assign prdata_s4_s = 0;
  assign prdata_s5_s = 0;
  assign prdata_s6_s = 0;
  assign prdata_s7_s = 0;
  assign prdata_s8_s = 0;
  assign prdata_s9_s = 0;
  assign prdata_s10_s = 0;
  assign prdata_s11_s = 0;
  assign prdata_s12_s = 0;
  assign prdata_s13_s = 0;
  assign prdata_s14_s = 0;
  assign prdata_s15_s = 0;


  assign pready_s0_s = 0;
  assign pready_s1_s = 0;
  assign pready_s2_s = 0;
  assign pready_s3_s = 0;
  assign pready_s4_s = 0;
  assign pready_s5_s = 0;
  assign pready_s6_s = 0;
  assign pready_s7_s = 0;
  assign pready_s8_s = 0;
  assign pready_s9_s = 0;
  assign pready_s10_s = 0;
  assign pready_s11_s = 0;
  assign pready_s12_s = 0;
  assign pready_s13_s = 0;
  assign pready_s14_s = 0;
  assign pready_s15_s = 0;


  assign pslverr_s0_s = 0;
  assign pslverr_s1_s = 0;
  assign pslverr_s2_s = 0;
  assign pslverr_s3_s = 0;
  assign pslverr_s4_s = 0;
  assign pslverr_s5_s = 0;
  assign pslverr_s6_s = 0;
  assign pslverr_s7_s = 0;
  assign pslverr_s8_s = 0;
  assign pslverr_s9_s = 0;
  assign pslverr_s10_s = 0;
  assign pslverr_s11_s = 0;
  assign pslverr_s12_s = 0;
  assign pslverr_s13_s = 0;
  assign pslverr_s14_s = 0;
  assign pslverr_s15_s = 0;


  DW_axi_x2p_mux
   U_MUX (
                        .psel(psel),
                        .pready_s0_s(pready_s0_s),
                        .pready_s1_s(pready_s1_s),
                        .pready_s2_s(pready_s2_s),
                        .pready_s3_s(pready_s3_s),
                        .pready_s4_s(pready_s4_s),
                        .pready_s5_s(pready_s5_s),
                        .pready_s6_s(pready_s6_s),
                        .pready_s7_s(pready_s7_s),
                        .pready_s8_s(pready_s8_s),
                        .pready_s9_s(pready_s9_s),
                        .pready_s10_s(pready_s10_s),
                        .pready_s11_s(pready_s11_s),
                        .pready_s12_s(pready_s12_s),
                        .pready_s13_s(pready_s13_s),
                        .pready_s14_s(pready_s14_s),
                        .pready_s15_s(pready_s15_s),
                        .pslverr_s0_s(pslverr_s0_s),
                        .pslverr_s1_s(pslverr_s1_s),
                        .pslverr_s2_s(pslverr_s2_s),
                        .pslverr_s3_s(pslverr_s3_s),
                        .pslverr_s4_s(pslverr_s4_s),
                        .pslverr_s5_s(pslverr_s5_s),
                        .pslverr_s6_s(pslverr_s6_s),
                        .pslverr_s7_s(pslverr_s7_s),
                        .pslverr_s8_s(pslverr_s8_s),
                        .pslverr_s9_s(pslverr_s9_s),
                        .pslverr_s10_s(pslverr_s10_s),
                        .pslverr_s11_s(pslverr_s11_s),
                        .pslverr_s12_s(pslverr_s12_s),
                        .pslverr_s13_s(pslverr_s13_s),
                        .pslverr_s14_s(pslverr_s14_s),
                        .pslverr_s15_s(pslverr_s15_s),
                        .prdata_s0_s(prdata_s0_s),
                        .prdata_s1_s(prdata_s1_s),
                        .prdata_s2_s(prdata_s2_s),
                        .prdata_s3_s(prdata_s3_s),
                        .prdata_s4_s(prdata_s4_s),
                        .prdata_s5_s(prdata_s5_s),
                        .prdata_s6_s(prdata_s6_s),
                        .prdata_s7_s(prdata_s7_s),
                        .prdata_s8_s(prdata_s8_s),
                        .prdata_s9_s(prdata_s9_s),
                        .prdata_s10_s(prdata_s10_s),
                        .prdata_s11_s(prdata_s11_s),
                        .prdata_s12_s(prdata_s12_s),
                        .prdata_s13_s(prdata_s13_s),
                        .prdata_s14_s(prdata_s14_s),
                        .prdata_s15_s(prdata_s15_s),
                        .prdata(prdata),
                        .pready(pready),
                        .pslverr(pslverr));


 //DW_axi_x2p_p  #(`X2P_AXI_SIDW,`X2P_AXI_AW, `X2P_AXI_DW, `X2P_AXI_WSTRB_WIDTH,
DW_axi_x2p_p
  #(`X2P_AXI_SIDW,32, `X2P_AXI_DW, `X2P_AXI_WSTRB_WIDTH,
         `X2P_CMD_QUEUE_WIDTH,`X2P_AXI_WDFIFO_WIDTH,`LEN_WIDTH)
               U_AXI_SLAVE(
                  .awid(awid),
                  .awaddr(awaddr[31:0]),
                  .awlen(awlen),
                  .awsize(awsize),
                  .awburst(awburst),
                  .awlock(awlock),
                  .awcache(awcache),
                  .awprot(awprot),
                  .awvalid(awvalid_gtd),
                  .awready(awready_int),
                  .wid(wid),
                  .wdata(wdata),
                  .wstrb(wstrb),
                  .wlast(wlast),
                  .wvalid(wvalid_gtd),
                  .wready(wready_int),
                  .bid(bid),
                  .bresp(bresp),
                  .bvalid(bvalid),
                  .bready(bready),

                  // the response buffer
                  .response_avail_n(resp_pop_rdy_n),
                  .pop_resp_n(pop_resp_n),
                  .pop_resp_word({pop_resp_status_wd,pop_resp_id_wd}),
                  // the write data buffer
                  .write_buffer_wd(awr_buff_wd),
                  .push_write_buffer_n(push_write_buffer_n),
                  .write_buff_rdy_n(wr_buff_push_rdy_n),
                  // read side
                  .arid(arid),
                  .araddr(araddr[31:0]),
                  .arlen(arlen),
                  .arsize(arsize),
                  .arburst(arburst),
                  .arlock(arlock),
                  .arcache(arcache),
                  .arprot(arprot),
                  .arvalid(arvalid_gtd),
                  .arready(arready_int),
                  .rid(rid),
                  .rdata(rdata),
                  .rresp(rresp),
                  .rlast(rlast),
                  .rvalid(rvalid),
                  .rready(rready),
                  // the read data buffer
                  .arstatus_int(arstatus_int),
                  .arid_int(arid_int),
                  .arlast_int(arlast_int),
                  .ardata_int(ardata_int),
                  .pop_data_int_n(pop_rdata_n),
                  .arvalid_int_n(arvalid_int_n),
                  // the common command queue
                  .wr_push_comm_cmd_q_n(wr_push_cmd_queue_n),
                  .rd_push_comm_cmd_q_n(rd_push_cmd_queue_n),
                  .push_cmd_queue_n(push_cmd_queue_n),
                  .cmd_queue_wd(cmd_queue_wd),
                  .cmd_queue_rdy_n(cmd_queue_push_rdy_n));

// no low-power in the bridge
   // just a report of internal activity

DW_axi_x2p_arb
 U_X2H_ARB (
                 .aclk(aclk),
                 .aresetn(aresetn),
                 // Outputs
                 .wvalid_gtd(wvalid_gtd),
                 .wready(wready),
                 .awvalid_gtd(awvalid_gtd),
                 .arvalid_gtd(arvalid_gtd),
                 .awready(awready),
                 .arready(arready),
                 // Inputs
                 .wvalid(wvalid),
                 .awvalid(awvalid),
                 .arvalid(arvalid),
                 .wready_int(wready_int),
                 .cmd_queue_rdy_n(cmd_queue_push_rdy_n),
                 .cmd_push_af(cmd_push_af)
                 );

// FIFOs

DW_axi_x2p_cmd_queue
 U_CMD_QUEUE (
               // the AXI slave side is pushing
               .clk_axi(aclk),
               .push_rst_n(aresetn),
               .acmd_queue_wd_int(cmd_queue_wd),
               .push_acmd_int_n(push_cmd_queue_n),
               .acmd_rdy_int_n(cmd_queue_push_rdy_n),
               .push_af(cmd_push_af),
               // the APB Master Side is popping
               .clk_apb(pclk_int),
               .pop_rst_n(presetn_int),
               .pop_hcmd_int_n(pop_hcmd_int_n),
               .hcmd_queue_wd_int(hcmd_queue_wd_int),
               .hcmd_rdy_int_n(hcmd_rdy_int_n));

DW_axi_x2p_write_data_buffer
 U_WR_DATA_BUFF (
             // AXI Slave Side is pushing
             .clk_axi(aclk),
             .push_rst_n(aresetn),
             .awword_int(awr_buff_wd),
             .push_awdata_int_n(push_write_buffer_n),
             .awdata_rdy_int_n(wr_buff_push_rdy_n),
              // the APB Master Side is popping
             .clk_apb(pclk_int),
             .pop_rst_n(presetn_int),
             .hwword_int(hwword_int),
             .pop_wdata_int_n(pop_wdata_int_n),
             .hwdata_rdy_int_n(hwdata_rdy_int_n));


DW_axi_x2p_resp_buffer
 U_RESP_BUFF (
               // the AXI slave side is popping
              .clk_axi(aclk),
              .pop_rst_n(aresetn),
              .awstatus_int(pop_resp_status_wd),
              .awid_int(pop_resp_id_wd),
              .pop_resp_int_n(pop_resp_n),
              .aresp_rdy_int_n(resp_pop_rdy_n),
               // the APB Master Side is pushing
              .clk_apb(pclk_int),
              .push_rst_n(presetn_int),
              .hwstatus_int(hwstatus_int),
              .hwid_int(hwid_int),
              .push_resp_int_n(push_resp_int_n),
              .hresp_rdy_int_n(hresp_rdy_int_n));

DW_axi_x2p_read_data_buffer
 U_RD_DATA_BUFF (
             // AXI Slave Side is popping
             .clk_axi(aclk),
             .pop_rst_n(aresetn),
             .arstatus_int(arstatus_int),
             .arid_int(arid_int),
             .arlast_int(arlast_int),
             .ardata_int(ardata_int),
             .pop_data_int_n(pop_rdata_n),
             .arvalid_int_n(arvalid_int_n),
              // the APB Master Side is pushing
             .clk_apb(pclk_int),
             .push_rst_n(presetn_int),
             .hrstatus_int(hrstatus_int),
             .hrid_int(hrid_int),
             .hrlast_int(hrlast_int),
             .hrdata_int(hrdata_int),
             .push_data_int_n(push_data_int_n),
             .hrdata_rdy_int_n(read_buff_full));

// APB Master interface
 DW_axi_x2p_s
   U_APB_MASTER (
             // Inputs
             .clk(pclk_int),
             .rst_n(presetn_int),
        // Inputs from internal FIFOs
             .hcmd_queue_wd_int(hcmd_queue_wd_int),
             .hcmd_rdy_int_n(hcmd_rdy_int_n),
             .hwword_int(hwword_int),
             .hwdata_rdy_int_n(hwdata_rdy_int_n),
             .hresp_rdy_int_n(hresp_rdy_int_n),
             .read_buffer_full(read_buff_full),
        // Inputs from APB
        // the raw ports are always here but in the
        // case the slave is not APB3 these will be tied
        // inside the master
             .pready_raw(pready),
             .pslverr_raw(pslverr),
             .prdata(prdata),
             // Outputs
        // to the internal FIFOs
             .pop_hcmd_int_n(pop_hcmd_int_n),
             .pop_wdata_int_n(pop_wdata_int_n),
             .hwid_int(hwid_int),
             .hwstatus_int(hwstatus_int),
             .push_resp_int_n(push_resp_int_n),
             .hrid_int(hrid_int),
             .hrdata_int(hrdata_int),
             .hrstatus_int(hrstatus_int),
             .hrlast_int(hrlast_int),
             .push_data_int_n(push_data_int_n),
             // Outputs to the APB
             .psel(psel),
             .paddr(paddr),
             .pwdata(pwdata),
        .pwrite(pwrite),
             .penable(penable)
);


 `undef LITTLE_ENDIAN_ENABLE
 `undef X2P_CLK_MODE_0
endmodule // DW_axi_x2p





























