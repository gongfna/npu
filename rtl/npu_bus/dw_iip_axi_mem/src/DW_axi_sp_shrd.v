/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
**                            ALL RIGHTS RESERVED
**
**  This software and the associated documentation are confidential and
**  proprietary to Synopsys, Inc.  Your use or disclosure of this
**  software is subject to the terms and conditions of a written
**  license agreement between you, or your company, and Synopsys, Inc.
**
**  The entire notice above must be reproduced on all authorized copies.
**
** ---------------------------------------------------------------------
**
** File     : DW_axi_sp_shrd.v
** Created  : Mon May  9 19:49:59 MEST 2005
** Modified : $Date$
** Abstract : Shared slave port block for the DW_axi interconnect.
**            Only blocks for the AR,AW and W channels exist because
**            only channel sink blocks are shared in a shared channel.
**
**            Multiple masters request to access multiple slaves on this
**            channel.
**
** ---------------------------------------------------------------------
*/
module DW_axi_sp_shrd (
  aclk_i,
  aresetn_i,





  dummy_input
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter AR_NUM_VIS_MP = 16;        // Number of masters connected to
  parameter LOG2_AR_NUM_VIS_MP = 4;    // shared AR channel + derived 
  parameter LOG2_AR_NUM_VIS_MP_P1 = 4; // values.

  parameter AW_NUM_VIS_MP = 16;        // Number of masters connected to
  parameter LOG2_AW_NUM_VIS_MP = 4;    // shared AW channel + derived 
  parameter LOG2_AW_NUM_VIS_MP_P1 = 4; // values.

  parameter W_NUM_VIS_MP = 16;        // Number of masters connected to
  parameter LOG2_W_NUM_VIS_MP = 4;    // shared W channel + derived 
  parameter LOG2_W_NUM_VIS_MP_P1 = 4; // values.

  parameter ARB_TYPE_AR = 0; // Arbiter type for AR channel.
  parameter ARB_TYPE_AW = 0; // Arbiter type for AW channel.
  parameter ARB_TYPE_W = 0; // Arbiter type for W channel.

  parameter AR_MCA_EN = 0; // 1 if multi-cycle arbitration is enabled
  parameter AW_MCA_EN = 0; // for each of these 3 channels.
  parameter W_MCA_EN = 0; 

  parameter AR_MCA_NC = 0; // Number of arbitration cycles if
  parameter AW_MCA_NC = 0; // multi cycle arbitration is enabled
  parameter W_MCA_NC = 0;  // for each of these 3 channels.

  parameter AR_MCA_NC_W = 1; // Log base 2 of *_MCA_NC + 1 params.
  parameter AW_MCA_NC_W = 1; 
  parameter W_MCA_NC_W = 1;  

  parameter LOCKING = 0; // Set to 1 if the slave port will
                         // implement AXI locking functionality.
                      
  parameter AR_NSS = 1; // How many slaves connect to each shared layer.
  parameter AW_NSS = 1; //
  parameter W_NSS = 1;  //

  parameter W_NSS_L2 = 1; // Log base 2 of W_NSS.

  // Forward active command limits for each slave on the shared layer.
  parameter FARC_S0 = 1;
  parameter FARC_S1 = 1;
  parameter FARC_S2 = 1;
  parameter FARC_S3 = 1;
  parameter FARC_S4 = 1;
  parameter FARC_S5 = 1;
  parameter FARC_S6 = 1;
  parameter FARC_S7 = 1;
  parameter FARC_S8 = 1;
  parameter FARC_S9 = 1;
  parameter FARC_S10 = 1;
  parameter FARC_S11 = 1;
  parameter FARC_S12 = 1;
  parameter FARC_S13 = 1;
  parameter FARC_S14 = 1;
  parameter FARC_S15 = 1;
  parameter FARC_S16 = 1;
  
  // Log base 2 of FARC + 1 for each slave on the shared layer.
  parameter LOG2_FARC_P1_S0 = 1;
  parameter LOG2_FARC_P1_S1 = 1;
  parameter LOG2_FARC_P1_S2 = 1;
  parameter LOG2_FARC_P1_S3 = 1;
  parameter LOG2_FARC_P1_S4 = 1;
  parameter LOG2_FARC_P1_S5 = 1;
  parameter LOG2_FARC_P1_S6 = 1;
  parameter LOG2_FARC_P1_S7 = 1;
  parameter LOG2_FARC_P1_S8 = 1;
  parameter LOG2_FARC_P1_S9 = 1;
  parameter LOG2_FARC_P1_S10 = 1;
  parameter LOG2_FARC_P1_S11 = 1;
  parameter LOG2_FARC_P1_S12 = 1;
  parameter LOG2_FARC_P1_S13 = 1;
  parameter LOG2_FARC_P1_S14 = 1;
  parameter LOG2_FARC_P1_S15 = 1;
  parameter LOG2_FARC_P1_S16 = 1;

  // Forward active command limits for each slave on the shared layer.
  parameter FAWC_S0 = 1;
  parameter FAWC_S1 = 1;
  parameter FAWC_S2 = 1;
  parameter FAWC_S3 = 1;
  parameter FAWC_S4 = 1;
  parameter FAWC_S5 = 1;
  parameter FAWC_S6 = 1;
  parameter FAWC_S7 = 1;
  parameter FAWC_S8 = 1;
  parameter FAWC_S9 = 1;
  parameter FAWC_S10 = 1;
  parameter FAWC_S11 = 1;
  parameter FAWC_S12 = 1;
  parameter FAWC_S13 = 1;
  parameter FAWC_S14 = 1;
  parameter FAWC_S15 = 1;
  parameter FAWC_S16 = 1;
  
  // Log base 2 of FAWC + 1 for each slave on the shared layer.
  parameter LOG2_FAWC_P1_S0 = 1;
  parameter LOG2_FAWC_P1_S1 = 1;
  parameter LOG2_FAWC_P1_S2 = 1;
  parameter LOG2_FAWC_P1_S3 = 1;
  parameter LOG2_FAWC_P1_S4 = 1;
  parameter LOG2_FAWC_P1_S5 = 1;
  parameter LOG2_FAWC_P1_S6 = 1;
  parameter LOG2_FAWC_P1_S7 = 1;
  parameter LOG2_FAWC_P1_S8 = 1;
  parameter LOG2_FAWC_P1_S9 = 1;
  parameter LOG2_FAWC_P1_S10 = 1;
  parameter LOG2_FAWC_P1_S11 = 1;
  parameter LOG2_FAWC_P1_S12 = 1;
  parameter LOG2_FAWC_P1_S13 = 1;
  parameter LOG2_FAWC_P1_S14 = 1;
  parameter LOG2_FAWC_P1_S15 = 1;
  parameter LOG2_FAWC_P1_S16 = 1;

  // Parameter for each shared slave, 1 if the slave also
  // has a dedicatd channel (read & write address, write data).
  parameter HAS_DDCTD_AR_S0 = 1;
  parameter HAS_DDCTD_AR_S1 = 1;
  parameter HAS_DDCTD_AR_S2 = 1;
  parameter HAS_DDCTD_AR_S3 = 1;
  parameter HAS_DDCTD_AR_S4 = 1;
  parameter HAS_DDCTD_AR_S5 = 1;
  parameter HAS_DDCTD_AR_S6 = 1;
  parameter HAS_DDCTD_AR_S7 = 1;
  parameter HAS_DDCTD_AR_S8 = 1;
  parameter HAS_DDCTD_AR_S9 = 1;
  parameter HAS_DDCTD_AR_S10 = 1;
  parameter HAS_DDCTD_AR_S11 = 1;
  parameter HAS_DDCTD_AR_S12 = 1;
  parameter HAS_DDCTD_AR_S13 = 1;
  parameter HAS_DDCTD_AR_S14 = 1;
  parameter HAS_DDCTD_AR_S15 = 1;
  parameter HAS_DDCTD_AR_S16 = 1;

  parameter HAS_DDCTD_AW_S0 = 1;
  parameter HAS_DDCTD_AW_S1 = 1;
  parameter HAS_DDCTD_AW_S2 = 1;
  parameter HAS_DDCTD_AW_S3 = 1;
  parameter HAS_DDCTD_AW_S4 = 1;
  parameter HAS_DDCTD_AW_S5 = 1;
  parameter HAS_DDCTD_AW_S6 = 1;
  parameter HAS_DDCTD_AW_S7 = 1;
  parameter HAS_DDCTD_AW_S8 = 1;
  parameter HAS_DDCTD_AW_S9 = 1;
  parameter HAS_DDCTD_AW_S10 = 1;
  parameter HAS_DDCTD_AW_S11 = 1;
  parameter HAS_DDCTD_AW_S12 = 1;
  parameter HAS_DDCTD_AW_S13 = 1;
  parameter HAS_DDCTD_AW_S14 = 1;
  parameter HAS_DDCTD_AW_S15 = 1;
  parameter HAS_DDCTD_AW_S16 = 1;

  parameter HAS_DDCTD_W_S0 = 1;
  parameter HAS_DDCTD_W_S1 = 1;
  parameter HAS_DDCTD_W_S2 = 1;
  parameter HAS_DDCTD_W_S3 = 1;
  parameter HAS_DDCTD_W_S4 = 1;
  parameter HAS_DDCTD_W_S5 = 1;
  parameter HAS_DDCTD_W_S6 = 1;
  parameter HAS_DDCTD_W_S7 = 1;
  parameter HAS_DDCTD_W_S8 = 1;
  parameter HAS_DDCTD_W_S9 = 1;
  parameter HAS_DDCTD_W_S10 = 1;
  parameter HAS_DDCTD_W_S11 = 1;
  parameter HAS_DDCTD_W_S12 = 1;
  parameter HAS_DDCTD_W_S13 = 1;
  parameter HAS_DDCTD_W_S14 = 1;
  parameter HAS_DDCTD_W_S15 = 1;
  parameter HAS_DDCTD_W_S16 = 1;

  // Width of concatenated read address channel payload vector for all
  // visible master ports.
  localparam BUS_AR_PYLD_S_W = AR_NUM_VIS_MP*`AXI_AR_PYLD_S_W; 

  // Width of concatenated write address channel payload vector for all
  // visible master ports.
  localparam BUS_AW_PYLD_S_W = AW_NUM_VIS_MP*`AXI_AW_PYLD_S_W; 

  // Width of concatenated write data channel payload vector for all
  // visible master ports.
  localparam BUS_W_PYLD_S_W = W_NUM_VIS_MP*`AXI_W_PYLD_S_W;   

  // Width of master priority busses for each channel.
  localparam AR_BUS_PRIORITY_W = `AXI_MST_PRIORITY_W*AR_NUM_VIS_MP;
  localparam AW_BUS_PRIORITY_W = `AXI_MST_PRIORITY_W*AW_NUM_VIS_MP;
  localparam W_BUS_PRIORITY_W = `AXI_MST_PRIORITY_W*W_NUM_VIS_MP;
  
  // Every master will send a bus of valid signals, with 1 signal for
  // every attached slave (signals for slaves not visible to that master
  // are tied to 0 at the top level.
  localparam AR_V_BUS_SHRD_W = AR_NUM_VIS_MP*AR_NSS;
  localparam AW_V_BUS_SHRD_W = AW_NUM_VIS_MP*AW_NSS;
  localparam W_V_BUS_SHRD_W = W_NUM_VIS_MP*W_NSS;

//----------------------------------------------------------------------
// PORT DECLARATIONS.
//----------------------------------------------------------------------
  input aclk_i;    // AXI system clock.
  input aresetn_i; // AXI system reset.

  //--------------------------------------------------------------------
  // READ ADDRESS CHANNEL.
  //--------------------------------------------------------------------
  

  //--------------------------------------------------------------------
  // WRITE ADDRESS CHANNEL.
  //--------------------------------------------------------------------
  


  //--------------------------------------------------------------------
  // WRITE DATA CHANNEL.
  //--------------------------------------------------------------------
  

  input dummy_input; // Unconnected, easy way to avoid syntax errors
                     // with the configurable i/o list.

  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  wire outstnd_wtxs_fed; // Signal from write address channel block, 
                         // when its transaction count register has 
			                   // gone to 0.
			 
  wire outstnd_nonlkd_wtxs; // Signal from write address channel block,
                            // asserted when there are outstanding 
	 	 	                      // non locked write transactions to the 
			                      // slave.
			 
  wire outstnd_rtxs_fed; // Signal from read address channel block, 
                         // when its transaction count register has 
			                   // gone to 0.

  wire outstnd_nonlkd_rtxs; // Signal from read address channel block,
                            // asserted when there are outstanding 
			                      // non locked read transactions to the 
			                      // slave.

  wire unlocking_wtx_rcvd; // Signal from write address channel block
                           // asserted when it has received an 
			                     // unlocking transaction.
  wire unlocking_rtx_rcvd; // Signal from read address channel block
                           // asserted when it has received an 
			                     // unlocking transaction.
			   
  wire arlock; // Asserted by read address channel when its arbiter
               // is locked to a particular master.
  wire awlock; // Asserted by write address channel when its arbiter
               // is locked to a particular master.
               
  wire rcpl_tx; // Read transaction completed signal, from read data
                // channel to read address channel.
  wire wcpl_tx; // Write transaction completed signal, from burst
                // response channel to read address channel.

  // 1-hot grant and local grant indexes from the arbiter in the read 
  // address channel block.
  wire [AR_NUM_VIS_MP-1:0]      bus_grant_arb_ar;     
  wire [LOG2_AR_NUM_VIS_MP-1:0] grant_m_local_arb_ar;

  // Locking signals tied off.
  wire [AW_NUM_VIS_MP-1:0]      bus_grant_arb_ar_plarb_aww;     
  wire [LOG2_AW_NUM_VIS_MP-1:0] grant_m_local_arb_ar_plarb_aww;

  // 1-hot grant and local grant indexes from the arbiter in the write 
  // address channel block.
  wire [AW_NUM_VIS_MP-1:0]      bus_grant_arb_aw;   
  wire [LOG2_AW_NUM_VIS_MP-1:0] grant_m_local_arb_aw;
  
  // Locking signals tied off.
  wire [AR_NUM_VIS_MP-1:0]      bus_grant_arb_aw_plarb_arw;     
  wire [LOG2_AR_NUM_VIS_MP-1:0] grant_m_local_arb_aw_plarb_arw;

  wire issued_wtx; // Asserted by write address channel when write
                   // command has been issued. Goes to write data 
		               // channel.
                                       
  // Signifies the master number whos transaction has been issued 
  // with issued_wtx.
  wire [LOG2_AW_NUM_VIS_MP-1:0] issued_wmstnum;

  // Shared channel requests from aw channel to ar channel, and vice
  // versa. The request from the aw channel are re mapped w.r.t. ar
  // channel visibility , this is required as the ar and aw shared
  // layers may be visible to different numbers of masters.
  wire [AR_NUM_VIS_MP-1:0] aw_shrd_ch_req_arw; 
  wire [AW_NUM_VIS_MP-1:0] ar_shrd_ch_req_aww; 
  wire [AR_V_BUS_SHRD_W-1:0]   bus_awvalid_shrd_arw;
  wire [AW_V_BUS_SHRD_W-1:0]   bus_arvalid_shrd_aww;

  // Max. sized wire for issued_wtx_shrd_bus_o.
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] issued_wtx_shrd_bus_max;
  
  // Max. sized wire for issued_wtx_shrd_mst_oh_o.
  wire [`AXI_MAX_NUM_USR_MSTS-1:0] issued_wtx_shrd_mst_oh_max;
  
  // Extra bit to support coding style used in assignment.
  wire [W_NSS:0] issued_wtx_shrd_bus_wnss_eb;
  wire [W_NSS-1:0] issued_wtx_shrd_bus_wnss;

  // issued_wtx_shrd_mst_oh_o for shared W masters only.
  // *_eb => Extra bit to support coding style used in assignment.
  wire [W_NUM_VIS_MP:0] issued_wtx_shrd_mst_oh_wnsm_eb;
  wire [W_NUM_VIS_MP-1:0] issued_wtx_shrd_mst_oh_wnsm;

  wire shrd_w_nxt_fb_pend_o_unconn; 

  wire arvalid_o_unconn;
  wire awvalid_o_unconn;
  wire wvalid_o_unconn;

  wire ar_issued_tx_o_unconn; 
  wire [LOG2_AR_NUM_VIS_MP-1:0] ar_issued_mstnum_o_unconn; 
  wire [AR_NSS-1:0] ar_issued_tx_shrd_slv_oh_o_unconn; 
  wire [AR_NUM_VIS_MP-1:0] ar_issued_tx_mst_oh_o_unconn; 

  wire ar_shrd_lyr_granted_unconn;
  wire aw_shrd_lyr_granted_unconn;



  

  

endmodule

