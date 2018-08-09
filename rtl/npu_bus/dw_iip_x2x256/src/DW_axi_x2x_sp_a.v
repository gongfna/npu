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
// AR & AW in SP
/////////////////////////////////////////////////////////////////////////

module x256_DW_axi_x2x_sp_a (
 //inputs
  aclk,
  aresetn,
  payload_i,
  aready_i,
  alock_ac_i,
  data_fifo_full_i,
  resp_fifo_full_i,
  addr_fifo_ept_i,
  pre_resp_comp_i,
  wid_i,
  wrequest_i,
  us_issue_req_i,
  
 //outputs
  payload_o,
  avalid_o,
  rs_push_req_n_o,
  aid_o,
  addr_rs_o,
  alen_o,
  asize_o,
  asize_mp_o,
  aburst_o,
  alock_r_o,
  pre_last_xact_o,
  last_rs_xact_o,
  us_xact_issue_off_o,
  pop_req_n_o
);

  //parameters from upper level module
  parameter WRITE_CH  = 0;                      //1->write channel,
                                                //0->read channel
  parameter INC_WRITE_FANOUT = `X2X_HAS_WI_FAN_OUT && WRITE_CH; 
                                                //write + fanout
  parameter NUM_FIFOS = `X2X_NUM_W_PORTS;       //number of RS FIFOs
  parameter NUM_PORTS = `X2X_NUM_W_PORTS;       //number of FANOUT ports
  parameter A_TRK_W   = `X2X_ADDR_TRK_W;        //addr bits to RS FIFO

  //auto switch parameters based on WRITE_CH
  parameter MPPLD_W = WRITE_CH ? `X2X_AWPYLD_W_MP :
                      `X2X_ARPYLD_W_MP;         //MP payload width
  parameter SPPLD_W = WRITE_CH ? `X2X_AWPYLD_W_SP :
                      `X2X_ARPYLD_W_SP;         //SP payload width

  //not from upper level module
  parameter MP_BLW     = `X2X_MP_BLW;             //Burst length width
  parameter INT_AW     = `X2X_INTERNAL_AW;        //Internal addr width
  parameter MP_IDW     = `X2X_MP_IDW;             //ID width
  parameter SP_BLW     = `X2X_SP_BLW;             //Burst length width
  parameter SP_IDW     = `X2X_SP_IDW;             //ID width
  parameter BUS_ID_W   = NUM_PORTS * MP_IDW;      //MP ID width of BUS
  parameter NUM_PORT_W = `X2X_LOG2_NUM_W_PORTS;   //port number width
  parameter MPPLD_W_I  = NUM_PORTS == 1 ? MPPLD_W :
                         MPPLD_W + NUM_PORT_W;    //+ port number
  parameter BUS_SPPLDW = NUM_PORTS * SPPLD_W;     //SP payload BUS width
  parameter A_SBW      = (WRITE_CH && `X2X_HAS_AWSB) ? `X2X_AW_SBW :
                         ((!WRITE_CH && `X2X_HAS_ARSB) ? `X2X_AR_SBW :
                         1);                      //SB width of AW or AR
  parameter PUSH_DW    = MP_IDW + A_TRK_W + SP_BLW +
                         `X2X_BTW + 8;       //push data width

  //inputs
  input                 aclk;             //clock
  input                 aresetn;          //reset, act low
  input [MPPLD_W_I-1:0] payload_i;        //payload from Addr FIFO
  input [NUM_PORTS-1:0] aready_i;         //ready from port
  input [1:0]           alock_ac_i;       //alock from another channel
  input [NUM_FIFOS-1:0] data_fifo_full_i; //resize FIFO full
  input [NUM_FIFOS-1:0] resp_fifo_full_i; //resize FIFO full
  input                 addr_fifo_ept_i;  //addr FIFO empty
  input                 pre_resp_comp_i;  //previous xacts completed
  input [MP_IDW-1:0]    wid_i;            //ID from W channel
  input                 wrequest_i;       //W request to push to RS fifo
  input                 us_issue_req_i;   //W request to issue xact
  
  //outputs
  output [BUS_SPPLDW-1:0] payload_o;       //payload to port
  output [NUM_PORTS-1:0]  avalid_o;        //avalid to port
  output [NUM_FIFOS-1:0]  rs_push_req_n_o; //push enable to RS FIFO
  output [MP_IDW-1:0]     aid_o;           //ID to rs fifos
  output [A_TRK_W-1:0]    addr_rs_o;       //addr to RS
  output [SP_BLW-1:0]     alen_o;          //len to rs fifos
  output [2:0]            asize_o;         //size to rs fifos
  output [`X2X_BTW-1:0]   aburst_o;        //burst type to rs fifos
  output [2:0]            asize_mp_o;      //MP asize to resp fifos
  output [1:0]            alock_r_o;       //alock to another channel
  output                  pre_last_xact_o; //xact pre last xact
  output                  last_rs_xact_o;  //last xact
  output                  us_xact_issue_off_o; //US xact issued
  output                  pop_req_n_o;     //pop enable to addr FIFO

  wire [SPPLD_W-1:0]    payload_w;
  wire                  avalid_w;
  wire                  rs_push_req_n_w;
  wire [MP_IDW-1:0]     aid_w;
  wire [A_TRK_W-1:0]    addr_rs_w;
  wire [SP_BLW-1:0]     alen_w;
  wire [2:0]            asize_w;
  wire [`X2X_BTW-1:0]   aburst_w;
  wire [2:0]            asize_mp_w;
  wire                  pre_last_xact_w;
  wire                  last_rs_xact_w;
  wire                  rs_fifo_full;
  wire [NUM_FIFOS-1:0]  rs_fifo_full_in;
  wire [NUM_FIFOS-1:0]  rs_push_req_n_wfc;
  wire                  aready_mux;
  reg  [NUM_FIFOS-1:0]  rs_push_req_n_o;
  reg  [2:0]            aprot_i;
  reg  [3:0]            acache_i;
  reg  [1:0]            alock_i;
  reg  [1:0]            aburst_i;
  reg  [2:0]            asize_i;
  reg  [MP_BLW-1:0]     alen_i;
  reg  [INT_AW-1:0]     addr_i;
  reg  [MP_IDW-1:0]     aid_i;
  reg  [A_SBW-1:0]      asideband_i;
  wire [A_SBW-1:0]      asideband_rs;
  reg  [NUM_PORT_W-1:0] port_num_i;
  wire                  pre_last_xact_o;
  wire                  last_rs_xact_o;
  wire [2:0]            aprot_rs;
  wire [3:0]            acache_rs;
  wire [1:0]            alock_rs;
  wire [1:0]            aburst_rs;
  wire [2:0]            asize_rs;
  wire [2:0]            asize_o;
  wire [SP_BLW-1:0]     alen_rs;
  wire [SP_BLW-1:0]     alen_o;
  wire [INT_AW-1:0]     addr_rs;
  wire [A_TRK_W-1:0]    addr_rs_o;
  wire [A_TRK_W-1:0]    addr_rs_rs;
  wire [MP_IDW-1:0]     aid_rs;
  wire [MP_IDW-1:0]     aid_o;
  wire [NUM_PORTS-1:0]  avalid_wfc;
  wire                  rs_fifo_full_wfc;
  wire                  avalid_rs;
  wire                  rs_push_req_n_rs;
  wire                  aready_wfc;
  wire                  pre_last_xact_rs;
  wire                  last_rs_xact_rs;
  wire [2:0]            asize_mp_rs;
  wire [SPPLD_W-1:0]    awpayload_wip;
  wire                  awvalid_wip;
  wire                  dir_xact_wip;
  wire                  rs_push_req_n_wip;
  wire                  awpush_full_wip;
  wire [PUSH_DW-1:0]    push_data_wip;
  wire                  aready_rs;
  wire [BUS_SPPLDW-1:0] payload_wfc;
  wire                  last_rs_xact_r;
  wire                  match_id;
  wire                  wip_block;
  wire                  xact_upsize;
  wire                  us_xact_off;
  wire [MP_IDW-1:0]     us_issue_wid;
  reg  [SPPLD_W-1:0]    payload_rs;
  reg  [BUS_SPPLDW-1:0] payload_o;
  reg  [NUM_PORTS-1:0]  avalid_o;

  //extract payload_i to addr and control signals
  //payload_i={port_num, aid, addr, alen, asize, aburst, 
  //           alock, acache, aprot}
  always @(payload_i) begin
    if ((WRITE_CH && `X2X_HAS_AWSB) | (!WRITE_CH && `X2X_HAS_ARSB))
      {port_num_i, asideband_i, aid_i, addr_i, alen_i, asize_i,
       aburst_i, alock_i, acache_i, aprot_i} = payload_i;
    else begin
      {port_num_i, aid_i, addr_i, alen_i, asize_i,
       aburst_i, alock_i, acache_i, aprot_i} = payload_i;
       asideband_i = 0; //undriven
    end
  end

  //generate rs_fifo_full_in, no response channel for R
  assign rs_fifo_full_in = WRITE_CH ? 
                           data_fifo_full_i | resp_fifo_full_i :
                           data_fifo_full_i; 

  //generate rs_fifo_full for RS
  assign rs_fifo_full = INC_WRITE_FANOUT ? rs_fifo_full_wfc :
                                           rs_fifo_full_in[0];

  //assign W xact info
  assign {payload_w, avalid_w, rs_push_req_n_w}  = 
         {payload_rs, avalid_rs, rs_push_req_n_rs};

  assign {aid_w, addr_rs_w, alen_w, asize_w, asize_mp_w,
          aburst_w, pre_last_xact_w, last_rs_xact_w} = 
         {aid_rs, addr_rs_rs, alen_rs, asize_rs, asize_mp_rs,
          aburst_rs, pre_last_xact_rs, last_rs_xact_rs};

  assign us_xact_issue_off_o = 1'b0;

  //gen us_issue_wid for us_issue_req
  assign us_issue_wid = wid_i;

  //instance write interleave process
   assign dir_xact_wip = 1'b0;
   assign match_id = 1'b0;

  //instance write fanout control
  x256_DW_axi_x2x_sp_wfc
   
  #( SPPLD_W ) U_sp_w_fanout (
    //inputs
    .addr_fifo_ept_i   ( addr_fifo_ept_i ),
    .avalid_i          ( avalid_rs ),
    .payload_i         ( payload_rs ),
    .rs_push_req_n_i   ( rs_push_req_n_rs ),
    .aready_i          ( aready_i ),
    .rs_fifo_full_i    ( rs_fifo_full_in ),
    .port_num_i        ( port_num_i ),
    //outputs
    .avalid_o          ( avalid_wfc ),
    .payload_o         ( payload_wfc ),
    .rs_push_req_n_o   ( rs_push_req_n_wfc ),
    .aready_o          ( aready_wfc ),
    .rs_fifo_full_o    ( rs_fifo_full_wfc )
  );

  assign aready_mux      = INC_WRITE_FANOUT ? aready_wfc : aready_i[0];

  always @(avalid_wfc or avalid_rs or rs_push_req_n_wfc or avalid_w or
            rs_push_req_n_rs or payload_wfc or payload_rs or payload_w or
            rs_push_req_n_w) begin
    avalid_o        = {NUM_PORTS{1'b0}};
    rs_push_req_n_o = {NUM_FIFOS{1'b1}};
    payload_o       = {BUS_SPPLDW{1'b0}};

    if (INC_WRITE_FANOUT) begin //fanout
      avalid_o        = avalid_wfc;
      rs_push_req_n_o = rs_push_req_n_wfc;
      payload_o       = payload_wfc;
    end
    else begin //directly from resizer
      avalid_o        = WRITE_CH ? avalid_w : avalid_rs;
      rs_push_req_n_o = WRITE_CH ? rs_push_req_n_w : rs_push_req_n_rs;
      payload_o       = WRITE_CH ? payload_w : payload_rs;
    end
  end

  //instance resizer
  x256_DW_axi_x2x_rs
   
  #( WRITE_CH, A_SBW ) U_resizer (
    //inputs
    .aclk             ( aclk ),
    .aresetn          ( aresetn ),
    .aid_i            ( aid_i ),
    .addr_i           ( addr_i ),
    .alen_i           ( alen_i ),
    .asize_i          ( asize_i ),
    .aburst_i         ( aburst_i ),
    .alock_i          ( alock_i ),
    .alock_ac_i       ( alock_ac_i ),
    .acache_i         ( acache_i ),
    .aprot_i          ( aprot_i ),
    .asideband_i      ( asideband_i ),
    .aready_i         ( aready_mux ),
    .rs_fifo_full_i   ( rs_fifo_full ),
    .addrfifo_ept_i   ( addr_fifo_ept_i ),
    .pre_resp_comp_i  ( pre_resp_comp_i ),
    .dir_xact_i       ( dir_xact_wip ),
    .match_id_i       ( match_id ),
    //outputs
    .aid_o            ( aid_rs ),
    .addr_o           ( addr_rs ),
    .addr_rs_o        ( addr_rs_rs ),
    .alen_o           ( alen_rs ),
    .asize_o          ( asize_rs ),
    .asize_mp_o       ( asize_mp_rs ),
    .aburst_o         ( aburst_rs ),
    .alock_o          ( alock_rs ),
    .alock_r_o        ( alock_r_o ),
    .acache_o         ( acache_rs ),
    .aprot_o          ( aprot_rs ),
    .asideband_o      ( asideband_rs ),
    .avalid_o         ( avalid_rs ),
    .pre_last_xact_o  ( pre_last_xact_rs ),
    .last_rs_xact_o   ( last_rs_xact_rs ),
    .rs_push_req_n_o  ( rs_push_req_n_rs ),
    .aready_o         ( aready_rs ),
    .wip_block_o      ( wip_block ),
    .xact_upsize_o    ( xact_upsize ),
    .pop_req_n_o      ( pop_req_n_o )
  );

  //concatenate to payload
  //payload={aid, addr, alen, asize, aburst, alock, acache, aprot}
  always @(aid_rs or addr_rs or alen_rs or asize_rs or aburst_rs or
            alock_rs or acache_rs or aprot_rs or asideband_rs) begin
    if ((WRITE_CH && `X2X_HAS_AWSB) | (!WRITE_CH && `X2X_HAS_ARSB))
      payload_rs = {asideband_rs, aid_rs, addr_rs, alen_rs, asize_rs,
                    aburst_rs, alock_rs, acache_rs, aprot_rs};
    else
      payload_rs = {aid_rs, addr_rs, alen_rs, asize_rs, aburst_rs,
                    alock_rs, acache_rs, aprot_rs};
  end

  //to RS fifos
  assign aid_o = WRITE_CH ? aid_w : aid_rs;
  assign alen_o = WRITE_CH ? alen_w : alen_rs;
  assign asize_o = WRITE_CH ? asize_w : asize_rs;
  assign aburst_o = WRITE_CH ? aburst_w : aburst_rs;
  assign addr_rs_o = WRITE_CH ? addr_rs_w : addr_rs_rs;
  assign asize_mp_o = WRITE_CH ? asize_mp_w : asize_mp_rs;
  assign pre_last_xact_o = WRITE_CH ? pre_last_xact_w : pre_last_xact_rs;
  assign last_rs_xact_o = WRITE_CH ? last_rs_xact_w : last_rs_xact_rs;

endmodule



