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
// R in SP
/////////////////////////////////////////////////////////////////////////

module x32_DW_axi_x2x_sp_r (
  //inputs
  aclk,
  aresetn,
  aid_i,
  asize_i,
  asize_mp_i,
  aburst_i,
  addr_i,
  pre_last_xact_i,
  last_rs_xact_i,
  rs_push_req_n_i,
  rvalid_i,
  rpayload_i,
  rpush_full_i,

  // Outputs 
  rs_push_full_o,
  pre_xact_fsh_o,
  rpush_req_n_o,
  rready_o,
  rpayload_o,

  // Debug ports
  dbg_push_req_n_o
);

  //parameters
  parameter MPPLD_W = `X2X_RPYLD_W_MP;        //MP payload width
  parameter SPPLD_W = `X2X_RPYLD_W_SP;        //SP payload width
  parameter MP_IDW  = `X2X_MP_IDW;            //MP ID width

  parameter A_TRK_W    = `X2X_ADDR_TRK_W;  //start addr bits
  parameter NUM_FIFOS  = `X2X_MAX_URIDA;   //number of FIFOs implemented
  parameter MP_DW      = `X2X_MP_DW;       //MP data width
  parameter SP_DW      = `X2X_SP_DW;       //SP data width
  parameter TX_US      = `X2X_HAS_TX_UPSIZE; //upsize
  parameter LOCKING    = `X2X_HAS_LOCKING; //locking
  //internal parameters

  ///////////////////////////////////////////////////////////////////////
  //1. if MP_DW == SP_DW && MP_BLW == SP_BLW && no ET, no rs fifo used.
  //2. if MP_DW == SP_DW && MP_BLW == SP_BLW && ET, need id and mp_asize.
  //3. in R channel, no alen used.
  //4. if MP_DW <= SP_DW && no upsize, asize_sp = asize_mp.(save 3 bits).
  //5. if no locking sequence, no pre_xact signal used. ( save 1 bit).
  ///////////////////////////////////////////////////////////////////////
  parameter NO_ALTER   = `X2X_TX_ALTER == `X2X_TX_NO_ALTER;
  parameter RS_FK_BP   = NO_ALTER && `X2X_HAS_ET;  //1 -> bypass RS but
                           //not bypass RS fifos. We need mp_asize and
                           //aid for endian transform.
  parameter RS_BYPASS  = NO_ALTER && !`X2X_HAS_ET; //1 -> bypass resizer
                           //and bypass RS fifos. Don't need info from
                           //AR channel.
  parameter NOUS_SP_L  = (MP_DW <= SP_DW) && !TX_US; //no US & SP larger
  parameter RS_FIFO_W  = RS_FK_BP ? (MP_IDW + 3) :
                         ( LOCKING ? ( NOUS_SP_L ? A_TRK_W + MP_IDW + 7 :
                         A_TRK_W + MP_IDW + 10 ) :
                         ( NOUS_SP_L ? A_TRK_W + MP_IDW + 6 :
                         A_TRK_W + MP_IDW + 9 ) );  //Resize FIFO width
  parameter DATA_W     = RS_FIFO_W;        //data width per FIFO
  parameter BUS_DATA_W = NUM_FIFOS*DATA_W; //real width of data signal

  input                  aclk;             //clk.
  input                  aresetn;          //reset.
  input [MP_IDW-1:0]     aid_i;           //ID from resize
  input [2:0]            asize_i;         //size from resize
  input [2:0]            asize_mp_i;      //MP asize for the xact
  input [1:0]            aburst_i;        //burst type for xact
  input [A_TRK_W-1:0]    addr_i;          //start addr
  input                  pre_last_xact_i; //xact before last xact
  input                  last_rs_xact_i;  //last resize xact
  input                  rs_push_req_n_i; //rs push enable, act low
  input                  rvalid_i;        //valid from AXI slave
  input [SPPLD_W-1:0]    rpayload_i;      //payload from AXI slave
  input                  rpush_full_i;    //read fifo push full flag

  // Outputs 
  output                 rs_push_full_o;  //push full flag to resizer
  output                 pre_xact_fsh_o;  //finish signl of pre last xact
  output                 rpush_req_n_o;   //read FIFO push enable,act low
  output                 rready_o;        //ready signal to AXI slave
  output [MPPLD_W-1:0]   rpayload_o;      //payload to read FIFO

  // Debug ports
  output dbg_push_req_n_o; // Asserted when we want to push to channel
                           // fifo, regardless of whether we can or not.

  wire [MPPLD_W-1:0]     rpayload_o;
  wire [MPPLD_W-1:0]     rpayload_unbp;
  wire [NUM_FIFOS-1:0]   rs_bus_push_req_n;
  wire [NUM_FIFOS-1:0]   rs_bus_push_full;
  wire [NUM_FIFOS-1:0]   rs_bus_pop_empty;
  wire [BUS_DATA_W-1:0]  rs_bus_fifo_data;
  wire [NUM_FIFOS-1:0]   rs_bus_pop_req_n;
  wire [DATA_W-1:0]      rs_push_data;
  wire                   rs_push_full_o;
  wire                   rs_push_full_unbp;
  wire                   pre_xact_fsh_o;
  wire                   pre_xact_fsh_unbp;
  wire                   rpush_req_n_o;
  wire                   rpush_req_n_unbp;
  wire                   rready_o;
  wire                   rready_unbp;
  wire                   dbg_push_req_n_o;
  wire                   dbg_push_req_n_unbp;

  //mux bypass RS
  assign rs_push_full_o = RS_BYPASS ? 1'b1 : rs_push_full_unbp;
  assign pre_xact_fsh_o = RS_BYPASS ? 1'b1 : pre_xact_fsh_unbp;
  assign rpush_req_n_o  = RS_BYPASS ? !(rvalid_i & ~rpush_full_i) : rpush_req_n_unbp;
  assign rready_o       = RS_BYPASS ? ~rpush_full_i : rready_unbp;
  assign rpayload_o     = RS_BYPASS ? rpayload_i : rpayload_unbp;

  
  //Resize FIFO pusher
  x32_DW_axi_x2x_r_pusher
  
  #(`X2X_MP_IDW,
    `X2X_MAX_URIDA,
    RS_FIFO_W,
    NOUS_SP_L,
    RS_FK_BP,
    `X2X_ADDR_TRK_W
  )
  U_read_rspusher (
    //inputs
    .aclk             ( aclk ),              //clock,
    .aresetn          ( aresetn ),           //reset, act low,
    .aid_i           ( aid_i ),            //ID from RS to RS FIFOs
    .asize_i         ( asize_i ),          //asize from RS to RS FIFOs
    .asize_mp_i      ( asize_mp_i ),       //MP asize from RS to RS FIFOs
    .aburst_i        ( aburst_i ),         //burst to RS fifos
    .addr_i          ( addr_i ),           //start addr
    .pre_last_xact_i ( pre_last_xact_i ),  //PreLastXact from RS to FIFOs
    .last_rs_xact_i  ( last_rs_xact_i ),   //LastRSXact from RS to FIFOs
    .push_req_n_i    ( rs_push_req_n_i ),  //RS push enable from RS
    .push_full_i     ( rs_bus_push_full ), //FIFOs full bus from FIFOs
    .pop_empty_i     ( rs_bus_pop_empty ), //FIFOs empty bus from FIFOs
    .fifo_data_i     ( rs_bus_fifo_data ), //FIFOs data bus from FIFOs

    // Outputs 
    .push_full_o     ( rs_push_full_unbp ),    //push full flag to RS
    .push_req_n_o    ( rs_bus_push_req_n ), //push enable bus to FIFOs
    .data_o          ( rs_push_data )       //push data to FIFOs
  );


  //Resize FIFOs (single clock)
  x32_DW_axi_x2x_sp_r_rsfifos
  
  #(`X2X_MAX_URIDA,
    RS_FIFO_W,
    `X2X_MAX_RCA_ID,
    `X2X_LOG2_MAX_RCA_ID,
    BUS_DATA_W
  )
  U_rsfifos (
    //inputs - push side
    .clk_i            ( aclk ),            //clock 
    .resetn_i         ( aresetn ),         //reset, act low
    .bus_push_req_n_i ( rs_bus_push_req_n ), //push enable bus to FIFOs
    .data_i           ( rs_push_data ),          //single FIFO data in 
    //outputs - push side
    .bus_push_full_o  ( rs_bus_push_full ),  //push full flag (bus)

    //inputs - pop side
    .bus_pop_req_n_i  ( rs_bus_pop_req_n ),  //pop enable bus to FIFOs
    // Outputs - pop side
    .bus_pop_empty_o  ( rs_bus_pop_empty ),  //pop empty flag (bus)
    .bus_data_o       ( rs_bus_fifo_data )   //multiple FIFOs data (bus)
  );

  //Resize fifo pop and read data packing
  x32_DW_axi_x2x_r_packer
  
  #(`X2X_MAX_URIDA,
    NOUS_SP_L,
    RS_FK_BP,
    RS_FIFO_W
  )
  U_read_packer (
    .aclk            ( aclk ),              //clock
    .aresetn         ( aresetn ),           //reset, act low
    .rvalid_i       ( rvalid_i ),         //read valid from AXI slave
    .rpayload_i     ( rpayload_i ),       //read payload from AXI slave
    .rs_data_i      ( rs_bus_fifo_data ), //RS data bus from RS FIFOs
    .rs_pop_ept_i   ( rs_bus_pop_empty ), //RS FIFOs empty flag bus
    .push_full_i    ( rpush_full_i ),     //push full flag from read FIFO

  // Outputs 
    .pre_xact_fsh_o ( pre_xact_fsh_unbp ),   //PreLastXact complete to RS
    .rs_pop_req_n_o ( rs_bus_pop_req_n ), //RS pop enable bus to RS FIFOs
    .r_push_req_n_o ( rpush_req_n_unbp ),    //push enable to read FIFO
    .rready_o       ( rready_unbp ),         //read ready to AXI slave
    .rpayload_o     ( rpayload_unbp )        //read payload to read FIFO
  );

endmodule



