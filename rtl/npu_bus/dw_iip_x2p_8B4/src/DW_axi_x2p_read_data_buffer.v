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
// Filename    : DW_axi_x2p_read_data_buffer.v
// 
// Created     : Dec 15 2005
// Description : Connects to the DesignWare fifo control and the registers
//               Allows for a single or two clocks, selects fifo based on 
//               clocking
//               The APB side pushes with the data ID and resp
//               and monitors the condition of the stack by looking at
//               the adddress to the RAM (hrdata_uush_cnt)
//-----------------------------------------------------------------------------

module DW_axi_x2p_read_data_buffer(/*AUTOARG*/
   // Outputs
   arstatus_int, arid_int, arlast_int, ardata_int, arvalid_int_n,
   hrdata_rdy_int_n,
   // Inputs
   clk_axi, pop_data_int_n, clk_apb, push_data_int_n, hrstatus_int,
   hrid_int, hrlast_int, hrdata_int, push_rst_n, pop_rst_n
   );

     // requires the following to be defined
//  X2P_AXI_DATA_WIDTH       width of the read data word;
//  X2P_AXI_ID_WIDTH         width of the read id
//  X2P_READ_BUFFER_DEPTH    depth of the FIFO

//  X2P_CLK_MODE           0 = Two Clocks implies FIFO with 2 push and pop sync 
//                         1 = Two  Clocks  imnplies FIFO with 3 push and pop sync
//                         2 = single clock implies a single clock fifo
    
`define fifo_width  `X2P_AXI_DW + `X2P_AXI_SIDW + 2
`define depth `X2P_READ_BUFFER_DEPTH
// push and pop syns for dual clock systems.
// if the clock ar sync use 1 reg between domains
// if async use the constraint
`define push_sync `X2P_DUAL_CLK_SYNC_DEPTH
`define pop_sync  `push_sync
// set up all the widths and depths assume here that the depth cannot exceed 256
`define count_width ((`depth <= 2) ? 2 :(`depth <= 4) ? 3 :(`depth <= 8) ? 4 :(`depth <= 16) ? 5:(`depth <= 32) ? 6:(`depth <= 64) ? 7:(`depth <= 128) ? 8:9)
`define DW_addr_width  (`count_width-1)
   // if FIFO is  dual-clocked adjusting the RAM depth for odd and non-power of 2 compatibility with the control
`define DW_effective_depth_s1 `depth 
`define DW_effective_depth_s2 ((`depth == (1 << `DW_addr_width))? `depth : `depth + ((`depth & 1) ? 1: 2))
`define DW_effective_depth ((`X2P_CLK_MODE==2) ? `DW_effective_depth_s1 : `DW_effective_depth_s2)
  
  input                                   clk_axi;
  output                                  arstatus_int; 
  output [`X2P_AXI_SIDW-1:0]                  arid_int;
  output                                  arlast_int;
  output [`X2P_AXI_DW-1:0]                    ardata_int;
  input                                   pop_data_int_n;
  output                                  arvalid_int_n;
   output 				  hrdata_rdy_int_n;
   
  
  input                                   clk_apb;
  input                                   push_data_int_n;
  input                                   hrstatus_int; 
  input [`X2P_AXI_SIDW-1:0]                   hrid_int;
  input                                   hrlast_int;
  input [`X2P_AXI_DW-1:0]                     hrdata_int;
  
  input                                   push_rst_n;
  input                                   pop_rst_n;
  
  wire                                    arstatus_int;
  wire [`DW_addr_width-1:0]               wr_addr,rd_addr;
 
  wire                                    we_n, hrdata_rdy_int_n, arvalid_int_n; 
  wire                                    tie_low,tie_hi,mem_rst_n;
  wire                                    clk_push,clk_pop;

  wire [`fifo_width-1:0]                  data_out_int;
  wire [`fifo_width-1:0]                  data_in_int;
  
  assign                    mem_rst_n = push_rst_n;
  assign                    tie_low = 1'b0;
  assign                    tie_hi  = 1'b1;
 `define push_ae_lvl 2
 `define push_af_lvl 2
 `define pop_ae_lvl 2
 `define pop_af_lvl 2
 `define err_mode 0
 `define tst_mode 0      // scan test input not connected

  assign clk_push = clk_apb;
  assign clk_pop = clk_axi;

  wire [`DW_addr_width-1:0]  af_thresh,ae_level;
  assign                     af_thresh = `DW_effective_depth-1;

  // Truncation of bits in constant expected for certain configs
  // hence the Leda warning can be disabled:
  // leda W163 off
  assign                     ae_level = `push_ae_lvl;
  // leda W163 on

  // Not concerned with unconnected ports, hence disable the
  // Leda warnings:
  // leda W287 off
  // Call fifo Controller
   
    // dual clock controller
  DW_axi_x2p_bcm07
   #(`depth,`DW_addr_width,`count_width,
                       `push_ae_lvl,
                       `push_af_lvl,
                       `pop_ae_lvl,
                       `pop_af_lvl,
                       `err_mode,
                       `push_sync,
                       `pop_sync,
                       `tst_mode
                       )                     
      U_READ_FIFO_CONTROL_S2(
                .clk_push(clk_push),
                .clk_pop(clk_pop),
                .test(tie_low),                          
                .rst_push_n(push_rst_n),
                .init_push_n(tie_hi ),           
                .rst_pop_n(pop_rst_n),
                .init_pop_n(tie_hi ),            
                .push_full(hrdata_rdy_int_n),
                .pop_empty(arvalid_int_n),
                .push_req_n(push_data_int_n),
                .pop_req_n(pop_data_int_n),
                .we_n(we_n),
                .wr_addr(wr_addr),
                .rd_addr(rd_addr),
                .push_empty(),              
                .push_ae(),
                .push_hf(),
                .push_af(),
                .push_error(),
                .push_word_count(),
                .pop_ae(),
 	        .pop_hf(),
	        .pop_af(),
	        .pop_full(),
	        .pop_error(),
                .pop_word_count() 
                 );
  // leda W287 on
                                 
  // The RAM
  DW_axi_x2p_bcm57
   #(`fifo_width,`DW_effective_depth,0,`DW_addr_width)
     U_READ_DATA_FIFO_RAM(.init_n(tie_hi),                    
                      .clk(clk_push),
                      .rst_n(mem_rst_n),
                      .wr_n(we_n),
                      .rd_addr(rd_addr),
                      .wr_addr(wr_addr),
                      .data_out(data_out_int),
                      .data_in({data_in_int})
                      );

  assign                     arstatus_int = data_out_int[`X2P_AXI_DW+`X2P_AXI_SIDW+1];
  assign                     arid_int = data_out_int[`X2P_AXI_DW+`X2P_AXI_SIDW:`X2P_AXI_DW+1];
  assign                     arlast_int = data_out_int[`X2P_AXI_DW];
  assign                     ardata_int = data_out_int[`X2P_AXI_DW-1:0];
  
  assign data_in_int = {hrstatus_int,hrid_int,hrlast_int,hrdata_int};
  
  
// uesd in all the fifos for undefine defines
 `undef depth
 `undef DW_effective_depth_s1                         
 `undef DW_effective_depth_s2                         
 `undef DW_effective_depth                         
 `undef DW_addr_width
 `undef push_ae_lvl
 `undef push_af_lvl
 `undef pop_ae_lvl
 `undef pop_af_lvl
 `undef err_mode
 `undef push_sync
 `undef pop_sync
 `undef tst_mode 
 `undef count_width
 `undef fifo_width                       

endmodule // DW_axi_x2p_read_data_buffer

  
  

  











         
                      

