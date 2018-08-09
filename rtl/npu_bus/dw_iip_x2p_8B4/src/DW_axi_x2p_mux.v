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
// Description : Output multiplexor.
//-----------------------------------------------------------------------------
module DW_axi_x2p_mux (/*AUTOARG*/
  // Outputs
  prdata, pready, pslverr, 
  // Inputs
  psel, prdata_s0_s, prdata_s1_s, prdata_s2_s, prdata_s3_s, 
  prdata_s4_s, prdata_s5_s, prdata_s6_s, prdata_s7_s, prdata_s8_s, 
  prdata_s9_s, prdata_s10_s, prdata_s11_s, prdata_s12_s, 
  prdata_s13_s, prdata_s14_s, prdata_s15_s, pready_s0_s, pready_s1_s, 
  pready_s2_s, pready_s3_s, pready_s4_s, pready_s5_s, pready_s6_s, 
  pready_s7_s, pready_s8_s, pready_s9_s, pready_s10_s, pready_s11_s, 
  pready_s12_s, pready_s13_s, pready_s14_s, pready_s15_s, 
  pslverr_s0_s, pslverr_s1_s, pslverr_s2_s, pslverr_s3_s, 
  pslverr_s4_s, pslverr_s5_s, pslverr_s6_s, pslverr_s7_s, 
  pslverr_s8_s, pslverr_s9_s, pslverr_s10_s, pslverr_s11_s, 
  pslverr_s12_s, pslverr_s13_s, pslverr_s14_s, pslverr_s15_s
  );
  
  input [15:0]                                 psel;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s0_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s1_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s2_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s3_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s4_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s5_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s6_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s7_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s8_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s9_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s10_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s11_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s12_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s13_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s14_s;
  input [`X2P_APB_DATA_WIDTH-1:0]        prdata_s15_s;
  
  input                                  pready_s0_s;
  input                                  pready_s1_s;  
  input                                  pready_s2_s;
  input                                  pready_s3_s;  
  input                                  pready_s4_s;
  input                                  pready_s5_s;  
  input                                  pready_s6_s;
  input                                  pready_s7_s;  
  input                                  pready_s8_s;
  input                                  pready_s9_s;  
  input                                  pready_s10_s;
  input                                  pready_s11_s;  
  input                                  pready_s12_s;
  input                                  pready_s13_s;  
  input                                  pready_s14_s;
  input                                  pready_s15_s;

  input                                  pslverr_s0_s;
  input                                  pslverr_s1_s;  
  input                                  pslverr_s2_s;
  input                                  pslverr_s3_s;  
  input                                  pslverr_s4_s;
  input                                  pslverr_s5_s;  
  input                                  pslverr_s6_s;
  input                                  pslverr_s7_s;  
  input                                  pslverr_s8_s;
  input                                  pslverr_s9_s;  
  input                                  pslverr_s10_s;
  input                                  pslverr_s11_s;  
  input                                  pslverr_s12_s;
  input                                  pslverr_s13_s;  
  input                                  pslverr_s14_s;
  input                                  pslverr_s15_s;
  
  output [`X2P_APB_DATA_WIDTH-1:0]       prdata;
  output                                 pready;
  output                                 pslverr;

  reg [`X2P_APB_DATA_WIDTH-1:0]          prdata_s;
  reg                                    pready_s;
  reg                                    pslverr_s;

  assign                                 prdata = prdata_s;
  assign                                 pready = pready_s;
  assign                                 pslverr = pslverr_s;
  
  
    always@(*)
        begin
            case (psel)
              16'h0001: prdata_s = prdata_s0_s;
              default:  prdata_s = 0;
            endcase // case(psel)
        end // always@ (prdata_s0 or prdata_s1 or prdata_s10...


  
   always @(*)
     begin
	case(psel)
	  default: pready_s = 0;
	endcase // case(psel)
     end // always @ (...   

   always @(*)
     begin
	case(psel)
	  default: pslverr_s = 0;
	endcase // case(psel)
     end // always @ (...  
  

//       
endmodule // DW_axi_x2p_mux
