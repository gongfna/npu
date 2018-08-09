/////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
/////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
// read data packing. 
// 1. extact read data from AXI slave to get ID, data and controls.
// 2. compare the read ID with the RS FIFO's IDs. If match, packing.
//    If not, stall.
// 3. During packing, a register required to count down the number of
//    MP_ARSIZE/SP_ARSIZE. If it is zero, do push to read FIFO.
// 4. If it is the last resize xact, issue RLAST to 1.
// 5. After packing, do pop to the RS FIFO.
/////////////////////////////////////////////////////////////////////////

module DW_axi_x2x_r_packer (
  // Inputs 
  aclk,
  aresetn,
  rvalid_i,
  rpayload_i,
  rs_data_i,
  rs_pop_ept_i,
  push_full_i,
  
  // Outputs 
  pre_xact_fsh_o,
  rs_pop_req_n_o,
  r_push_req_n_o,
  rready_o,
  rpayload_o
);

  //parameters
  parameter NUM_FIFOS  = `X2X_MAX_URIDA;   //number of FIFOs implemented
  parameter NOUS_SP_L  = 0;                //No US and SP DW larger
  parameter RS_FK_BP   = 0;                //fake bypass RS
  parameter DATA_W     = 16;               //data width per FIFO

  //master port
  parameter MPPLD_W = `X2X_RPYLD_W_MP;        //MP payload width
  parameter MPLT_PT = `X2X_RPYLD_LAST_MP;     //MP last bit position
  parameter MPRP_RS = `X2X_RPYLD_RESP_RHS_MP; //MP prot left side
  parameter MPRP_LS = `X2X_RPYLD_RESP_LHS_MP; //MP prot left side
  parameter MPDT_RS = `X2X_RPYLD_DATA_RHS_MP; //MP cache right side
  parameter MPDT_LS = `X2X_RPYLD_DATA_LHS_MP; //MP cache left side
  parameter MPID_RS = `X2X_RPYLD_ID_RHS_MP;   //MP lock right side
  parameter MPID_LS = `X2X_RPYLD_ID_LHS_MP;   //MP lock left side
  parameter MP_BLW  = `X2X_MP_BLW;            //MP Burst length width
  parameter MP_DW   = `X2X_MP_DW;             //MP data width
  parameter MP_IDW  = `X2X_MP_IDW;            //MP ID width
  //slave port
  parameter SPPLD_W = `X2X_RPYLD_W_SP;        //SP payload width
  parameter SPLT_PT = `X2X_RPYLD_LAST_SP;     //MP last bit position
  parameter SPRP_RS = `X2X_RPYLD_RESP_RHS_SP; //MP prot left side
  parameter SPRP_LS = `X2X_RPYLD_RESP_LHS_SP; //MP prot left side
  parameter SPDT_RS = `X2X_RPYLD_DATA_RHS_SP; //MP cache right side
  parameter SPDT_LS = `X2X_RPYLD_DATA_LHS_SP; //MP cache left side
  parameter SPID_RS = `X2X_RPYLD_ID_RHS_SP;   //MP lock right side
  parameter SPID_LS = `X2X_RPYLD_ID_LHS_SP;   //MP lock left side
  parameter SP_BLW  = `X2X_SP_BLW;            //MP Burst length width
  parameter SP_DW   = `X2X_SP_DW;             //MP data width
  parameter SP_IDW  = `X2X_SP_IDW;            //MP ID width
  //sideband
  parameter R_SBW   = `X2X_R_SBW;
  //internal parameters
  parameter A_TRK_W     = `X2X_ADDR_TRK_W;  //start addr width
  parameter BUS_DATA_W  = NUM_FIFOS*DATA_W; //real width of data signal
  parameter ASIZE_W     = 3;                //asize width
  parameter BUS_ASIZE_W = NUM_FIFOS*ASIZE_W;//BUS asize width
  parameter BUS_MPPLD_W = NUM_FIFOS*MPPLD_W;//BUS payload

  // Inputs
  input                  aclk;             //clk.
  input                  aresetn;          //reset.
  input                  rvalid_i;        //valid from AXI slave
  input [SPPLD_W-1:0]    rpayload_i;      //payload from AXI slave
  input [BUS_DATA_W-1:0] rs_data_i;       //real data width for all FIFOs
  input [NUM_FIFOS-1:0]  rs_pop_ept_i;    //Bus of RS FIFO empty signals
  input                  push_full_i;     //read fifo push full flag

  // Outputs 
  output                 pre_xact_fsh_o;  //finish signl of pre last xact
  output [NUM_FIFOS-1:0] rs_pop_req_n_o;  //RS FIFO pop enable, act low.
  output                 r_push_req_n_o;  //read FIFO push enable,act low
  output                 rready_o;        //ready signal to AXI slave
  output [MPPLD_W-1:0]   rpayload_o;      //payload to read FIFO
  

  wire [NUM_FIFOS-1:0]   pre_xact_fsh;    //xact before last RS xact
  wire                   pre_xact_fsh_o;
  wire [BUS_MPPLD_W-1:0] rpayload;
  wire [BUS_ASIZE_W-1:0] mp_asize;
  reg  [MPPLD_W-1:0]     rpayload_tmp;
  wire                   rready_o;        //RREADY to slave
  wire [NUM_FIFOS-1:0]   rready;
  reg                    r_push_req_n_o;  //push enable to read FIFO
  wire                   dbg_p_req_n_o;
  wire [NUM_FIFOS-1:0]   r_push_req_n;    //push enable to read FIFO
  wire [NUM_FIFOS-1:0]   dbg_p_req_n;    //push enable for debug
  reg  [2:0]             fifo_asize_mp;   //for endian
  wire [MP_DW-1:0]       data_endian_out; //data after endianness
  wire [NUM_FIFOS-1:0]   rs_pop_req_n_o;  //pop enable to RS fifo
  wire [NUM_FIFOS-1:0]   rs_pop_req_n;
  wire                   last_from_dp; //last signal dopack
  wire [1:0]             resp_from_dp; //response from dopack
  wire [MP_DW-1:0]       data_from_dp; //data from dopack
  wire [MP_IDW-1:0]      rid_from_dp;  //RID from dopack
  wire [R_SBW-1:0]       sb_from_dp;   //sideband from dopack
  wire [NUM_FIFOS-1:0]   fifo_prelastxact; //pre last xact per FIFO
  wire [NUM_FIFOS-1:0]   fifo_lastrsxact;  //last resize xact per fifo
  wire [MPPLD_W-1:0]     rpayload_o;       //payload to read FIFO
  integer                i, j;

  genvar gvdp;
  generate
    for (gvdp=0; gvdp < NUM_FIFOS; gvdp=gvdp+1) begin:UnrollFIFOs
      DW_axi_x2x_r_dopack
       
      #( DATA_W, NOUS_SP_L, RS_FK_BP ) U_dopack (
        //inputs
        .aclk                ( aclk ),
        .aresetn             ( aresetn ),
        .rpayload_i         ( rpayload_i ),
        .push_full_i        ( push_full_i ),
        .pop_empty_i        ( rs_pop_ept_i[gvdp] ),
        .rvalid_i           ( rvalid_i ),
        .fifo_data_i        ( rs_data_i[gvdp*DATA_W+:DATA_W] ),
        //outputs
        .pre_xact_fsh_o     ( pre_xact_fsh[gvdp] ),
        .rs_pop_req_n_o     ( rs_pop_req_n[gvdp] ),
        .r_push_req_n_o     ( r_push_req_n[gvdp] ),
        .rready_o           ( rready[gvdp] ),
        .fifo_asize_mp_o    ( mp_asize[gvdp*ASIZE_W+:ASIZE_W] ),
        .rpayload_o         ( rpayload[gvdp*MPPLD_W+:MPPLD_W] )
      );
    end
  endgenerate

  //debug signal for push_req_n
  
  //Only rvaild corresponding ID matches, rready asserted,
  //so rready can be |. same to pre_xact_fsh.
  assign rready_o       = |rready;
  assign pre_xact_fsh_o = |pre_xact_fsh;

  // pop_req_n_o bus gen
  assign rs_pop_req_n_o = rs_pop_req_n;

  //choose output data to read fifo
  always @(r_push_req_n or rpayload or mp_asize) begin
    rpayload_tmp   = 0;
    r_push_req_n_o = 1'b1;

    fifo_asize_mp = {`X2X_BSW{1'b0}};

    for (i=0; i<NUM_FIFOS; i=i+1) begin
      if (r_push_req_n[i] == 1'b0) begin
        for (j=0; j<MPPLD_W; j=j+1)
          rpayload_tmp[j] = rpayload[i*MPPLD_W + j];

        for (j=0; j<ASIZE_W; j=j+1)
          fifo_asize_mp[j] = mp_asize[i*ASIZE_W+j];
  
        r_push_req_n_o  = r_push_req_n[i];
      end
    end
  end

  //extract signals from dopack
  assign {           rid_from_dp, data_from_dp, resp_from_dp, last_from_dp}
         = rpayload_tmp;

  wire [`X2X_MP_SW-1:0] strobe_out;
  //endian transform
  DW_axi_x2x_et
  
  #(`X2X_HAS_ET,
    `X2X_MP_DW,
    `X2X_MP_SW,
    0
  )
  U_endian (
    .data_in_i  ( data_from_dp ),
    .strobe_in_i({`X2X_MP_SW{1'b0}}),
    .asize_i    ( fifo_asize_mp ),
    .data_out_o ( data_endian_out ),
    .strobe_out_o ( strobe_out )
  );

  //payload to read FIFO
  assign rpayload_o = {                       rid_from_dp, data_endian_out, 
                       resp_from_dp, last_from_dp};

endmodule


