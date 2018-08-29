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
// Resizer
/////////////////////////////////////////////////////////////////////////

module dma_m_DW_axi_x2x_rs (
 //inputs
  aclk,
  aresetn,
  aid_i,
  addr_i,
  alen_i,
  asize_i,
  aburst_i,
  alock_i,
  alock_ac_i,
  acache_i,
  aprot_i,
  asideband_i,
  aready_i,
  rs_fifo_full_i,
  addrfifo_ept_i,
  pre_resp_comp_i,
  dir_xact_i,
  match_id_i,
  
 //outputs
  aid_o,
  addr_o,
  addr_rs_o,
  alen_o,
  asize_o,
  asize_mp_o,
  aburst_o,
  alock_o,
  alock_r_o,
  acache_o,
  aprot_o,
  asideband_o,
  avalid_o,
  pre_last_xact_o,
  last_rs_xact_o,
  rs_push_req_n_o,
  aready_o,
  wip_block_o,
  xact_upsize_o,
  pop_req_n_o 
);

  //parameters
  parameter WRITE_CHANNEL     = 0;                  //write = 1, read = 0
  parameter A_SBW             = 8;                  //sideband width
  parameter MP_DW             = `X2X_MP_DW;    
  parameter X2X_TX_UPSIZE     = `X2X_HAS_TX_UPSIZE; //upsize = 1
  parameter A_TRK_W           = `X2X_ADDR_TRK_W;  //addr bits to RS FIFO
  parameter MAX_MP_ALEN       = `X2X_MAX_MP_ALEN+1;//{`X2X_MP_BLW{1b1}}+1
  parameter MP_BLW            = `X2X_MP_BLW;      //MP burst length width
  parameter MP_IDW            = `X2X_MP_IDW;      //MP ID width
  parameter INT_AW            = `X2X_INTERNAL_AW; //Internal address widt
  parameter INT_BW            = `X2X_INTERNAL_BW; //Internal boundary
                                                  //width
  parameter SP_BLW            = `X2X_SP_BLW;      //SP burst length width
  parameter SP_IDW            = `X2X_SP_IDW;      //SP ID width
  parameter MAX_SP_ALEN       = `X2X_MAX_SP_ALEN+1;//{`X2X_SP_BLW{1b1}}+1
  parameter LOG2_MP_SW        = (`X2X_LOG2_MP_SW > 0) ?
                                `X2X_LOG2_MP_SW : 1;   //log2^MP_SW
  parameter LOG2_SP_SW        = `X2X_LOG2_SP_SW;   //log2^SP_SW
  parameter MAX_MP_ASIZE      = `X2X_MAX_MP_ASIZE; //bytes -> asize
  parameter MAX_SP_ASIZE      = `X2X_MAX_SP_ASIZE; //bytes -> asize
  parameter MAX_SP_TOTAL_BYTE = `X2X_MAX_SP_TOTAL_BYTE; //max_sp_asize *
                                                        //max_alen
  parameter MAX_MP_TOTAL_BYTE = `X2X_MAX_MP_TOTAL_BYTE; //max_mp_asize *
                                                        //max_alen
  parameter LOG2_BIG_SW       = (`X2X_LOG2_MP_SW >= `X2X_LOG2_SP_SW) ?
                                 `X2X_LOG2_MP_SW : `X2X_LOG2_SP_SW;
  parameter LOG2_BIG_BW       = LOG2_BIG_SW + SP_BLW;
  parameter LOG2_MP_BW        = LOG2_MP_SW + MP_BLW;
  parameter LOG2_MS_BW        = LOG2_MP_SW + SP_BLW;
  parameter MAX_ASIZE_S       = `X2X_MAX_SP_ASIZE; //ByteSize-->BurstSize
  parameter OPRT_AW           = (`X2X_LOG2_SP_BYTE > INT_BW) ?
                                (`X2X_LOG2_SP_BYTE + 1) : (INT_BW + 1);
                                                   //OPERATING ADDRESS
  parameter RDC_NUM_W         = (LOG2_MP_SW > MAX_ASIZE_S) ?
                                LOG2_MP_SW - MAX_ASIZE_S : 1;
                                                   //reduce_num width
  parameter NO_ALTER      = `X2X_TX_ALTER == `X2X_TX_NO_ALTER;
  parameter RS_FK_BP      = NO_ALTER && `X2X_HAS_ET;  //1->need to push
                                //mp_asize and aid to RS fifos for
                                //endian transform in data channels
  parameter ET_BYPASS     = NO_ALTER && !`X2X_HAS_ET; //1->bypass ET,
                                //no need to push data to RS fifos
  parameter RS_BYPASS     = RS_FK_BP | ET_BYPASS; //1->bypass RS,
                                //but not bypass RS fifos. we might
                                //push data to RS fifos for ET.
  parameter SPALEN_LRG_MP     = MAX_SP_ALEN >= MAX_MP_ALEN;
                                             //1 -> MAX SP ALEN larger
  parameter SPSIZE_LRG_MP     = MAX_SP_ASIZE >= MAX_MP_ASIZE;
                                             //1 -> MAX SP SIZE larger
  parameter SPBYTE_LRG_MP     = MAX_SP_TOTAL_BYTE >= MAX_MP_TOTAL_BYTE;
                                             //1 -> MAX SP bytes larger
  parameter PL                = `X2X_HAS_PIPELINE; //pipeline

  //inputs
  input                aclk;            //clk
  input                aresetn;         //reset, active low
  input  [MP_IDW-1:0]  aid_i;           //master ID
  input  [INT_AW-1:0]  addr_i;          //master address
  input  [MP_BLW-1:0]  alen_i;          //MP burst length
  input  [2:0]         asize_i;         //master asize
  input  [1:0]         aburst_i;        //master burst
  input  [1:0]         alock_i;         //master lock
  input  [1:0]         alock_ac_i;      //lock from another addr channel
  input  [3:0]         acache_i;        //master cache
  input  [2:0]         aprot_i;         //master prot
  input  [A_SBW-1:0]   asideband_i;     //sideband
  input                aready_i;        //ready from AXI slave
  input                rs_fifo_full_i;  //resize fifo full
  input                addrfifo_ept_i;  //addr FIFO empty
  input                pre_resp_comp_i; //(alen-1) resp complete signal
  input                dir_xact_i;      //direct xact from write interlea
  input                match_id_i;      //match id from WIP
  
  //outputs
  output [MP_IDW-1:0]  aid_o;           //ID to slave
  output [INT_AW-1:0]  addr_o;          //slave address
  output [A_TRK_W-1:0] addr_rs_o;       //addr to RS FIFOs
  output [SP_BLW-1:0]  alen_o;          //SP burst length
  output [2:0]         asize_o;         //slave asize
  output [2:0]         asize_mp_o;      //MP asize for read data packing
  output [1:0]         aburst_o;        //slave burst
  output [1:0]         alock_o;         //slave lock
  output [1:0]         alock_r_o;       //lock to another addr channel
  output [3:0]         acache_o;        //cache to slave
  output [2:0]         aprot_o;         //prot to slave
  output [A_SBW-1:0]   asideband_o;     //sideband
  output               avalid_o;        //valid to AXI slave
  output               pre_last_xact_o; //xact pre last xact to RS FIFO
  output               last_rs_xact_o;  //last resize xact to RS FIFO
  output               rs_push_req_n_o; //push enable to RS FIFO, act low
  output               aready_o;        //from aready_in for write interl
  output               wip_block_o;     //block same id xact
  output               xact_upsize_o;   //upsize enable, 1 -> upsize
  output               pop_req_n_o;     //pop enable, act low

  //temp calculation results
  reg  [2:0]           resize_ctrl;
  reg  [2:0]           mp_asize_mux;
  reg  [LOG2_BIG_BW:0] max_sp_total_byte_mux;
  wire [MP_BLW:0]      mp_alen;
  wire [LOG2_MP_BW:0]  mp_total_byte;
  wire [OPRT_AW-1:0]   bound_addr;
  wire [INT_BW-1:0]    tmp_bound_addr;
  wire [LOG2_MS_BW:0]  max_sp_mpasize_total_byte;

  //outputs and their registers from inputs
  reg  [2:0]         asize_mp_o;
  reg  [MP_IDW-1:0]  aid_o;
  wire [INT_AW-1:0]  addr_o;   
  wire [OPRT_AW-1:0] addr_unbp;   
  wire [SP_BLW-1:0]  alen_o;    
  wire [SP_BLW-1:0]  alen_unbp;    
  wire [2:0]         asize_o;    
  reg  [2:0]         asize_unbp;    
  wire [1:0]         aburst_o;
  reg  [1:0]         aburst_unbp;
  wire [1:0]         alock_o;
  reg  [1:0]         alock_unbp;
  reg  [1:0]         alock_r;
  wire [1:0]         alock_r_o;
  wire [1:0]         alock;    //to catch locked sequence of both channel
  wire [1:0]         alock_s;  //to catch locked sequence of last xact
  wire [1:0]         alock_ss; //to catch locked sequence of last xact
  wire [1:0]         alock_sss;//to catch locked sequence of last xact
  reg  [3:0]         acache_o;
  reg  [2:0]         aprot_o;
  wire               avalid_o;
  reg                avalid_unbp;
  reg                avalid_unbp_r;
  reg                aready_r;
  wire               pre_last_xact_o;
  wire               pre_last_xact_unbp;
  wire               last_rs_xact_o;     //output to RS FIFO
  reg                last_rs_xact_r;
  reg                last_rs_xact_unbp;     //output to RS FIFO
  wire               last_rs_xact_ctl;   //used to control State machine
  reg                last_rs_xact_ctl_r;
  wire               rs_push_req_n_o;
  reg                rs_push_req_n_unbp;
  wire               pop_req_n_o;
  reg                pop_req_n_unbp;
  reg                pop_req_n_unbp_r;
  wire [A_TRK_W-1:0] addr_rs_o;
  wire [A_TRK_W-1:0] addr_rs_unbp;
  wire [A_SBW-1:0]   asideband_o;

  //temp results and registered
  wire              aready_in;
  wire              xact_stall;
  reg               pre_resp_comp_r;
  wire              pre_resp_comp;
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  wire [OPRT_AW:0]   total_addr_s;   
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  reg  [OPRT_AW:0] total_addr_r;   
  wire [LOG2_MP_BW:0] total_alen_s;    
  reg  [LOG2_MP_BW:0] total_alen_r;    
  reg                 wait_for_tx_r;
  wire [LOG2_MP_BW:0] total_remain_bytes;
  wire [LOG2_MP_BW:0] pre_ran_num_bytes;
  reg  [LOG2_MP_BW:0] pre_ran_num_bytes_s;
  reg  [LOG2_MP_BW:0] pre_ran_num_bytes_r;
  wire [LOG2_MP_BW:0] deduct_ran_num_bytes;
  wire [LOG2_BIG_BW:0] total_byte_mux;
  //Tx issued enable
  wire              issued_tx;
  reg               issued_tx_r;
  //Upsize enable signal
  wire              xact_upsize; //1-->upsize; 0-->no
  wire              xact_upsize_o; //1-->upsize; 0-->no
  wire              ue_xact_upsize; //1-->upsize; 0-->no
  reg               xact_upsize_pl_r; //1-->upsize; 0-->no
  //aligned address
  reg  [OPRT_AW-1:0] aligned_addr;
  //unaligned uncount downsize xact number
  reg  [RDC_NUM_W-1:0] reduce_num_r;
  wire [RDC_NUM_W-1:0] mxin_reduce_num;
  wire [RDC_NUM_W-1:0] reduce_num;
  wire [LOG2_MP_SW-1:0] rn_mask; // Mask used in generation of
                                 // reduce_num.
  reg  [LOG2_MP_SW:0] align_mask; //mask align addr
  wire [LOG2_MP_SW-1:0] tmp_addr;
  wire [LOG2_MP_SW-1:0] tmp_num;
  //case control
  wire [1:0]        aburst_in;
  wire [3:0]        micro_ctrl;
  wire              alock_last_flag; //1->last DS normal xact (lock seq)
                                     //0->not last one
  wire              wrap_from_bound;
  reg [INT_AW-1:OPRT_AW] upper_addr_pl_r;
  reg               issued_aready_r;
  wire              aready_o;
  wire              aready_il;
  wire              wip_block_o;
  //RS_FK_BP control
  reg               avalid_fk;
  reg               avalid_fk_r;
  reg               push_for_fk_r;
  
  integer           i;

  //bypass resizer
  assign addr_o = RS_BYPASS ? addr_i : (PL ? {upper_addr_pl_r[INT_AW-1:OPRT_AW],
                             addr_unbp} : {addr_i[INT_AW-1:OPRT_AW], addr_unbp});
  assign alen_o = RS_BYPASS ? alen_i : alen_unbp;
  assign asize_o = RS_BYPASS ? asize_i : asize_unbp;
  assign aburst_o = RS_BYPASS ? aburst_i : aburst_unbp;
  assign alock_o = RS_BYPASS ? alock_i : alock_unbp;
  assign avalid_o = ET_BYPASS ? !addrfifo_ept_i : (RS_FK_BP ?
                    (WRITE_CHANNEL ? avalid_fk :
                      (!addrfifo_ept_i & !rs_fifo_full_i)) :
                    (xact_stall ? 1'b0 : avalid_unbp));
  assign pre_last_xact_o = RS_BYPASS ? 1'b0 : pre_last_xact_unbp;
  assign last_rs_xact_o = RS_BYPASS ? 1'b1 : last_rs_xact_unbp;
  assign rs_push_req_n_o = ET_BYPASS ? 1'b1 : (RS_FK_BP ? !(issued_tx & avalid_o)
                           : (xact_stall ? 1'b1 : rs_push_req_n_unbp));
  assign pop_req_n_o = ET_BYPASS ? !(!addrfifo_ept_i & aready_i) : (RS_FK_BP ?
                       (WRITE_CHANNEL ? !(!addrfifo_ept_i & avalid_fk & aready_i)
                       : !(!addrfifo_ept_i & !rs_fifo_full_i & aready_i)) : 
                       pop_req_n_unbp);
  assign addr_rs_o = RS_BYPASS ? addr_i[A_TRK_W-1:0] : addr_rs_unbp;

  //reg push_for_fk_r for RS_FK_BP
  // NTL_CLK05 : Data must be registered by 2 or more flipflops when crossing clock
  // domain
  // Path from A* fifo data out to here, gated by empty.
  // leda NTL_CLK05 off
  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      push_for_fk_r <= 1'b0;
    else begin
      if (WRITE_CHANNEL) begin
        if (issued_tx & avalid_o & !aready_il)
          push_for_fk_r <= 1'b1;
        else if (aready_il & avalid_o)
          push_for_fk_r <= 1'b0;
      end
      else push_for_fk_r <= 1'b0;
    end
  end
  // leda NTL_CLK05 on

  //reg avalid_fk_r for RS_FK_BP
  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      avalid_fk_r <= 1'b0;
    else
      avalid_fk_r <= avalid_fk;
  end

  //avalid_fk for RS_FK_BP
  always @(addrfifo_ept_i or rs_fifo_full_i or 
            push_for_fk_r or avalid_fk_r) begin
    if (!addrfifo_ept_i & !rs_fifo_full_i)
      avalid_fk = 1'b1;
    else if ((rs_fifo_full_i & !push_for_fk_r && WRITE_CHANNEL) |
               addrfifo_ept_i)
      avalid_fk = 1'b0;
    else avalid_fk = avalid_fk_r;
  end

  assign aready_in = xact_stall ? 1'b1 :
                     ((WRITE_CHANNEL & RS_FK_BP & push_for_fk_r) ?
                      aready_i :
                     ((!rs_fifo_full_i & aready_i) |
                      (issued_aready_r & rs_fifo_full_i & aready_i)));
  assign aready_o  = 1'b0;
  assign aready_il = aready_i;
  assign wip_block_o= 1'b0;

  assign aburst_in = aburst_i;

 //For PL
  reg [MP_IDW-1:0] aid_pl_r;
  reg [OPRT_AW-1:0] addr_pl_r;
  reg [MP_BLW-1:0] alen_pl_r;
  reg [A_SBW-1:0] asideband_pl_r;
  reg [2:0] asize_pl_r;
  reg [1:0] aburst_pl_r;
  reg [1:0] alock_pl_r;
  reg [3:0] acache_pl_r;
  reg [2:0] aprot_pl_r;
  reg addrfifo_ept_pl_r;
  wire for_first_xact;
  

  //xact_upsize with PL
  assign xact_upsize = PL ? xact_upsize_pl_r : ue_xact_upsize;
  assign xact_upsize_o = xact_upsize;

  //sizeband with PL
  assign asideband_o = RS_BYPASS ? asideband_i :
                       (PL ? asideband_pl_r : asideband_i);

  //xact issue enable.
  //during write xact, master must not wait for AWREADY asserted
  //before driving WVALID.
  //If read, the enable depends on aready_in.
  wire afifoept_rsfifoful_n;
  assign afifoept_rsfifoful_n = RS_BYPASS ?
                                !addrfifo_ept_i & !rs_fifo_full_i :
                                (PL ? 
                                !addrfifo_ept_pl_r & !rs_fifo_full_i :
                                !addrfifo_ept_i & !rs_fifo_full_i);

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      wait_for_tx_r <= 1'b0;
    end
    else begin
      if (wait_for_tx_r)
        wait_for_tx_r <= !aready_in;
      else
        wait_for_tx_r <= afifoept_rsfifoful_n & !aready_in;
    end
  end

  wire read_issued;
  assign read_issued = RS_BYPASS ? aready_in : 
                       (PL ? for_first_xact & aready_in : aready_in);
  assign issued_tx = WRITE_CHANNEL ? 
                     afifoept_rsfifoful_n & !wait_for_tx_r :
                     read_issued;
  
  // pop_req_n_unbp gen. If addr fifo not empty & resize fifo not full &
  // last resized xact completed & aready_i high, enable pop.
  wire pl_avalid; 
  assign pl_avalid = !addrfifo_ept_i & avalid_o;

  always @(aready_il or pl_avalid or last_rs_xact_ctl) begin
    if (aready_il & pl_avalid & last_rs_xact_ctl)
      pop_req_n_unbp = 1'b0;
    else
      pop_req_n_unbp = 1'b1;
  end

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      pop_req_n_unbp_r <= 1'b1;
    else begin
      if (!pop_req_n_unbp)
        pop_req_n_unbp_r <= 1'b0;
      else if (!rs_fifo_full_i)
        pop_req_n_unbp_r <= 1'b1;
    end
  end

  // some calculation for further use
  assign mp_alen = alen_i + 1'b1; //MP length
  assign mp_total_byte = mp_alen << asize_i; //MP total bytes
  //Calculate the number of downsized SP xacts that will be ignored due
  //to an unaligned MP start address.
  //The reduce_num only used in INCR/FIXed type and first DS xact & DS
  //asize is SP data width.
    assign reduce_num = 0;

    assign total_remain_bytes = mp_total_byte;

  reg [MP_BLW:0] mp_alen_pl_r;
  reg [LOG2_MP_BW:0] mp_total_byte_pl_r;
  reg [RDC_NUM_W-1:0] reduce_num_pl_r;
  reg [LOG2_MP_BW:0] total_remain_bytes_pl_r;
  reg [OPRT_AW-1:0] bound_addr_pl_r;
  reg [LOG2_MS_BW:0] max_sp_mpasize_total_byte_pl_r;
  reg [OPRT_AW-1:0] aligned_addr_pl_r;
  //Boundary address for wrap xact
  //In wrap alen=2,4,8,16 only and asize_bytes=1,2,4,8,16,32,64 only.

  //function to tranform alen to bit width
  function [2:0] num_bit;
    input [4:0]  alen;

    reg   [2:0] tmp_bit;

    begin
      tmp_bit = {3{1'b0}};

      case (alen)
        2:  tmp_bit = 1;
        4:  tmp_bit = 2;
        8:  tmp_bit = 3;
        //default=16
        default: tmp_bit = 4;
      endcase

      num_bit = tmp_bit;
    end
  endfunction

  //least (num_bit(mp_alen)+asize_i) is 0 for bound_addr
  wire [INT_BW-1:0] bd_mask;
  wire [5:0] bind_bit;
  assign bind_bit = num_bit(mp_alen) + asize_i;
  assign bd_mask = {INT_BW{1'b1}} << bind_bit;
  assign tmp_bound_addr = addr_i[INT_BW-1:0] & bd_mask;
  assign bound_addr  = {addr_i[OPRT_AW-1:INT_BW], tmp_bound_addr};

  //if sp_asize=mp_asize & sp_alen=MAX_SP_ALEN, in SP xact bytes are
  assign max_sp_mpasize_total_byte = MAX_SP_ALEN << asize_i;
 
  //instance Upsizing enable.
  dma_m_DW_axi_x2x_ue
   #( X2X_TX_UPSIZE )
  U_upsize_enable ( 
  //Inputs
  .addr_i          ( addr_i ),
  .alen_i          ( alen_i ),
  .asize_i         ( asize_i ),
  //Outputs
  .xact_upsize_o   ( ue_xact_upsize ) );

  //reg pre_resp_comp_i and clear
  // This logic only applies to configurations with 
  // X2X_HAS_LOCKING == 1.
  assign pre_resp_comp = 1'b0;


  //for push_req_n and push_full
  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      issued_aready_r <= 1'b0;
    else begin
      if (WRITE_CHANNEL) begin
        if (!rs_push_req_n_unbp & !aready_il)
          issued_aready_r <= 1'b1;
        else if (aready_il & avalid_o)
          issued_aready_r <= 1'b0;
      end
      else issued_aready_r <= 1'b0;
    end
  end


  //generate addr to RS fifos.
  assign addr_rs_unbp = addr_unbp[A_TRK_W-1:0];

  //upsize mp_asize or downsize mp_asize
  //upsize or downsize max_sp_total_byte_mux
  always @(xact_upsize or asize_pl_r or
            max_sp_mpasize_total_byte_pl_r or
            asize_i or  max_sp_mpasize_total_byte) begin
    if (xact_upsize) begin
      mp_asize_mux = MAX_ASIZE_S;
      max_sp_total_byte_mux = MAX_SP_TOTAL_BYTE;
    end
    else begin //downsize
      mp_asize_mux = PL ? asize_pl_r : asize_i;
      max_sp_total_byte_mux = PL ? max_sp_mpasize_total_byte_pl_r :
                              max_sp_mpasize_total_byte;
    end
  end

  assign total_byte_mux = (resize_ctrl == `MUL_XACT_NOTLAST) ?
                     MAX_SP_TOTAL_BYTE : max_sp_total_byte_mux;

  //get locked sequence for both AW & AR channels
  //2'b10-->locked.
  assign alock = `NORMAL;

  //assign alock_r to alock_r_o (output) for another addr channel
  assign alock_r_o = alock_r;

  //alock_last_flag gen for lock sequence with last DS normal xact
  assign alock_last_flag = 1'b0;

  ///////////////////////////////////////////////////////////////////////
  //                       resizing
  //
  //If X2X issues 1st xact from a primary xact, we have the following.
  // 1.if mp_asize<=MAX_SP_ASIZE & mp_alen<=MAX_SP_ALEN, pass as-is (for
  //   WRAP, aligned_addr == bound_addr).
  //   if upsize, asize_o = log2(MAX_SP_ASIZE).
  //
  // 2.if mp_asize<=MAX_SP_ASIZE & mp_alen>MAX_SP_ALEN, multi xacts.
  //   if upsize, it might be single xact.
  //
  // 3.if mp_asize>MAX_SP_ASIZE & mp_total_byte<=MAX_SP_TOTAL_BYTE,
  //   single xact and no upsize (for WRAP, aligned_addr == bound_addr;
  //   for FIXED, total_remain_bytes <= MAX_SP_TOTAL_BYTE).
  //
  // 4.Otherwise (mp_asize>MAX_SP_ASIZE & mp_total_byte > 
  //   MAX_SP_TOTAL_BYTE), multi xacts and no upsize.
  //
  //If X2X issues 2nd and on xact from a primary xact, we have to do
  // 1.if mp_asize<=MAX_SP_ASIZE & mp_alen>MAX_SP_ALEN & not WRAP or
  //   aligned_addr != bound_addr & WRAP, multi xacts and possible
  //   upsize.
  //
  // 2.mp_total_byte <= MAX_SP_TOTAL_BYTE & not WRAP, no action.
  //
  // 3.Otherwise, multi xacts and no upsize.
  ///////////////////////////////////////////////////////////////////////
  wire spasize_larger;
  wire spalen_larger;
  wire spbyte_larger;

  assign spasize_larger = ((PL ? asize_pl_r : asize_i) <= MAX_SP_ASIZE) |
                          SPSIZE_LRG_MP;
  assign spalen_larger = ((PL ? mp_alen_pl_r : mp_alen)
                          <= MAX_SP_ALEN) | SPALEN_LRG_MP;
  assign spbyte_larger = ((PL ? mp_total_byte_pl_r : mp_total_byte)
                          <= MAX_SP_TOTAL_BYTE) | SPBYTE_LRG_MP;
  assign wrap_from_bound = PL ? addr_pl_r == bound_addr_pl_r &&
                           aburst_pl_r == `X2X_BT_WRAP : 
                           addr_i[OPRT_AW-1:0] == bound_addr && 
                           aburst_in == `X2X_BT_WRAP;

  //resize control signal gen used to control different size cases
  wire [MP_BLW:0] pl_mp_alen;
  wire pl_addrfifo_ept;
  wire [OPRT_AW-1:0] pl_bound_addr;
  wire [OPRT_AW-1:0] pl_addr;
  wire [1:0] pl_aburst;
  wire [LOG2_MP_BW:0] pl_total_remain_bytes;
  wire pl_ept_or_full;
  assign pl_mp_alen = PL ? mp_alen_pl_r : mp_alen;
  assign pl_addrfifo_ept = PL ? addrfifo_ept_pl_r : addrfifo_ept_i;
  assign pl_bound_addr = PL ? bound_addr_pl_r : bound_addr;
  assign pl_addr = PL ? addr_pl_r : addr_i[OPRT_AW-1:0];
  assign pl_aburst = PL ? aburst_pl_r : aburst_in;
  assign pl_total_remain_bytes = PL ? total_remain_bytes_pl_r :
                                 total_remain_bytes;
  assign pl_ept_or_full = PL ? !addrfifo_ept_pl_r : 
                               !addrfifo_ept_i;

  always @(pl_mp_alen or pl_ept_or_full or
            pl_bound_addr or wrap_from_bound or pl_addr or
            spasize_larger or spalen_larger or spbyte_larger or
            pl_aburst or pl_total_remain_bytes or
            last_rs_xact_ctl_r) begin
    resize_ctrl = `NO_ACTION;

     //if addr FIFO not empty & resize FIFO not full,do calculate & xact
     if (pl_ept_or_full) begin
       if (last_rs_xact_ctl_r) begin //in last xact
         if (spasize_larger) begin
           if (spalen_larger
               && (wrap_from_bound || (pl_aburst != `X2X_BT_WRAP))
)
             //as_is_or_upsize control, in last xact
             resize_ctrl = `AS_IS_OR_US_INLAST;
 
           else //  mp_alen > MAX_SP_ALEN
             //control of multi xacts or upsize, in last xact
             resize_ctrl = `MUL_XACT_OR_US_INLAST;
 
         end
         else begin //mp_asize > MAX_SP_ASIZE
           if ((spbyte_larger && (
               wrap_from_bound |
               pl_aburst == `X2X_BT_INCR)) ||
               (((pl_total_remain_bytes <= MAX_SP_TOTAL_BYTE) |
                  SPBYTE_LRG_MP) &&
               pl_aburst == `X2X_BT_FIXED))
             //single xact, in last xact
             resize_ctrl = `SINGLE_XACT_INLAST; 
 
           else //mp_total_byte > MAX_SP_TOTAL_BYTE
             //multi xacts, in last xact
             resize_ctrl = `MUL_XACT_INLAST;
         end
       end // if last_rs_xact_ctl_r
       else begin //not in last xact
         if (spasize_larger) begin
           if (((`X2X_MP_BLW > `X2X_SP_BLW)
	         && pl_mp_alen > MAX_SP_ALEN
	         && pl_aburst != `X2X_BT_WRAP
)
                || (pl_addr != pl_bound_addr && 
                pl_aburst == `X2X_BT_WRAP)
)
             //multi xacts or upsize, not in last xact
             resize_ctrl = `MUL_XACT_OR_US_NOTLAST;
         end
         else begin //mp_asize > MAX_SP_ASIZE
           if (spbyte_larger && (pl_aburst != `X2X_BT_WRAP))
             resize_ctrl = `NO_ACTION;
           else
             //multi xacts, not in last xact
             resize_ctrl = `MUL_XACT_NOTLAST;
         end
       end //else if ( mp_asize
     end //if ( !addrfifo_ept_i & !rs_fifo_full_i )
  end //always

  //instance xact control module
  //last_rs_xact_ctl used to indicate last xact or not
  dma_m_DW_axi_x2x_xact_ctrl
   
  #( OPRT_AW ) U_xact_ctrl (
    .resize_ctrl_i           ( resize_ctrl ),
    .aready_i                ( aready_in ),
    .xact_upsize_i           ( xact_upsize ),
    .mp_total_byte_i         ( PL ? mp_total_byte_pl_r : mp_total_byte ),
    .addr_i                  ( pl_addr ),
    .bound_addr_i            ( pl_bound_addr ),
    .total_addr_r_i          ( total_addr_r ),
    .total_alen_r_i          ( total_alen_r ),
    .aburst_i                ( pl_aburst ),
    .mp_asize_mux_i          ( mp_asize_mux ),
    .alock_last_flag_i       ( alock_last_flag ),
    .pre_resp_comp_i         ( pre_resp_comp ),
    .max_sp_total_byte_mux_i ( max_sp_total_byte_mux ),
    .last_rs_xact_ctl_r_i    ( last_rs_xact_ctl_r ),
    .mp_alen_i               ( pl_mp_alen ),
    .total_remain_bytes_i    ( pl_total_remain_bytes ),
    .deduct_ran_num_bytes_i  ( deduct_ran_num_bytes ),

    .micro_ctrl_o            ( micro_ctrl ),
    .last_rs_xact_ctl_o      ( last_rs_xact_ctl )
  );

  //instance addr_alen
  //alen_o/addr_o gen. changes per xact
  wire [LOG2_MS_BW:0] pl_max_sp_mpasize_total_byte;
  assign pl_max_sp_mpasize_total_byte = PL ? 
         max_sp_mpasize_total_byte_pl_r : max_sp_mpasize_total_byte;

  dma_m_DW_axi_x2x_addr_alen
   
  #( OPRT_AW, RDC_NUM_W ) U_addr_alen (
    .resize_ctrl_i               ( resize_ctrl ),
    .xact_upsize_i               ( xact_upsize ),
    .mp_total_byte_i       ( PL ? mp_total_byte_pl_r : mp_total_byte ),
    .aligned_addr_i        ( PL ? aligned_addr_pl_r : aligned_addr ),
    .bound_addr_i                ( pl_bound_addr ),
    .total_alen_r_i              ( total_alen_r ),
    .total_addr_r_i              ( total_addr_r ),
    .max_sp_mpasize_total_byte_i ( pl_max_sp_mpasize_total_byte ),
    .asize_i                     ( PL ? asize_pl_r : asize_i ),
    .micro_ctrl_i                ( micro_ctrl ),
    .reduce_num_i                ( PL ? reduce_num_pl_r : reduce_num ),
    .aready_i                    ( aready_in ),
    .aburst_i                    ( pl_aburst ),
    .alen_i                      ( PL ? alen_pl_r : alen_i ),
    .addr_i                      ( pl_addr ),
    .max_sp_total_byte_mux_i     ( max_sp_total_byte_mux ),
    .alock_last_flag_i           ( alock_last_flag ),
    .mp_asize_mux_i              ( mp_asize_mux ),
    .total_remain_bytes_i        ( pl_total_remain_bytes ),
    .reduce_num_r_i              ( reduce_num_r ),
    .pre_ran_num_bytes_i         ( pre_ran_num_bytes ),

    //outputs
    .xact_stall_o                ( xact_stall ),
    .alen_o                      ( alen_unbp ),
    .addr_o                      ( addr_unbp ),
    .total_alen_o                ( total_alen_s ),
    .total_addr_o                ( total_addr_s ),
    .mxin_reduce_num_o           ( mxin_reduce_num ),
    .pre_last_xact_o             ( pre_last_xact_unbp )
  );

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      reduce_num_r <= 0;
    else
      reduce_num_r <= mxin_reduce_num;
  end

  //alock_unbp gen. mind last normal xact within a locked sequenc with DS
  assign alock_s = `NORMAL;
  assign alock_ss = `NORMAL;
  assign alock_sss = PL ? alock_pl_r : alock_i;

  always @(resize_ctrl or micro_ctrl or
            alock_s or alock_ss or alock_sss) begin
    alock_unbp = alock_sss;

    case (resize_ctrl)
      `MUL_XACT_OR_US_INLAST: begin
        case (micro_ctrl)
          `MXUI_NO_CROSS, `MXUI_CROSS, `MXUI_DS, 
          `MXUI_FI_MUL, `MXUI_FI_DS:
            alock_unbp = alock_s;

          default: alock_unbp = alock_sss;
        endcase
      end

      `MUL_XACT_OR_US_NOTLAST, `MUL_XACT_NOTLAST: begin
        case (micro_ctrl)
          `MUX_OVERONE, `MUX_CROSS, `MUX_FI_MUL: alock_unbp = alock_s;

          `MUX_WRAP_BOUND, `MUX_WRAP, `MUX_FI_LAST: alock_unbp=alock_ss;

          default: alock_unbp = alock_sss;
        endcase
      end

      `MUL_XACT_INLAST: alock_unbp = alock_s;

      default: alock_unbp = alock_sss;
    endcase
  end
  
  //aburst_unbp gen. for DS, WRAP -> INCR
  always @(resize_ctrl or pl_aburst) begin
    aburst_unbp = pl_aburst;

    case (resize_ctrl)
      `SINGLE_XACT_INLAST, `MUL_XACT_OR_US_INLAST, 
      `MUL_XACT_OR_US_NOTLAST, `MUL_XACT_INLAST, 
      `MUL_XACT_NOTLAST, `AS_IS_OR_US_INLAST: begin
        if (pl_aburst == `X2X_BT_WRAP) aburst_unbp = `X2X_BT_INCR;
      end

      default: aburst_unbp = pl_aburst;
    endcase
  end

  //aid_o/asize_mp_o/acache_o/aprot_o gen. SP_IDW >= MP_IDW
  always @(aid_i or asize_i or acache_i or aprot_i or
            aid_pl_r or asize_pl_r or acache_pl_r or aprot_pl_r) begin
    aid_o = RS_BYPASS ? aid_i : (PL ? aid_pl_r : aid_i);
    asize_mp_o = RS_BYPASS ? asize_i : (PL ? asize_pl_r : asize_i);
    acache_o = RS_BYPASS ? acache_i : (PL ? acache_pl_r : acache_i);
    aprot_o = RS_BYPASS ? aprot_i : (PL ? aprot_pl_r : aprot_i);
  end

  //asize_unbp gen. take asize_i from MP or MAX_ASIZE_S from MAX_SP_ASIZE
  //aligned_addr gen, dependent on asize_unbp. 
  always @(resize_ctrl or asize_i or asize_pl_r or xact_upsize or
            ue_xact_upsize or addr_i) begin
    asize_unbp = PL ? asize_pl_r : asize_i;

    case (resize_ctrl)
      `AS_IS_OR_US_INLAST, `MUL_XACT_OR_US_INLAST, 
      `MUL_XACT_OR_US_NOTLAST: begin
        if (xact_upsize)
          asize_unbp = MAX_ASIZE_S;
      end

      `SINGLE_XACT_INLAST, `MUL_XACT_INLAST, `MUL_XACT_NOTLAST:
        asize_unbp = MAX_ASIZE_S;

      default: asize_unbp = PL ? asize_pl_r : asize_i;
    endcase

    if (ue_xact_upsize) begin
      align_mask = {(LOG2_MP_SW+1){1'b1}} << MAX_ASIZE_S;
      aligned_addr = {addr_i[OPRT_AW-1:LOG2_MP_SW+1],
                     (addr_i[LOG2_MP_SW:0] & align_mask)};
    end
    else begin
      align_mask = {(LOG2_MP_SW+1){1'b1}} << asize_i;
      aligned_addr = {addr_i[OPRT_AW-1:LOG2_MP_SW+1],
                     (addr_i[LOG2_MP_SW:0] & align_mask)}; 
    end
  end

  //last_rs_xact_unbp gen. mind last xact only
  always @(micro_ctrl or resize_ctrl
) begin
    last_rs_xact_unbp = 1'b0;

    case (resize_ctrl)
      `AS_IS_OR_US_INLAST, `SINGLE_XACT_INLAST:
        last_rs_xact_unbp = 1'b1;

      `MUL_XACT_OR_US_INLAST: begin
        case (micro_ctrl)
          `MXUI_SINGLE, `MXUI_FI_SINGLE:
            last_rs_xact_unbp = 1'b1;

          default: last_rs_xact_unbp = 1'b0;
        endcase
      end

      `MUL_XACT_OR_US_NOTLAST, `MUL_XACT_NOTLAST: begin
        case (micro_ctrl)
          `MUX_WRAP_BOUND, `MUX_WRAP, `MUX_FI_LAST: begin
              last_rs_xact_unbp = 1'b1;
          end
        
          default: last_rs_xact_unbp = 1'b0;
        endcase
      end

      default: last_rs_xact_unbp = 1'b0;
    endcase
  end

  //avalid_unbp/rs_push_req_n_unbp gen. 
  //mind lock sequence for last normal xact
  always @(micro_ctrl or resize_ctrl or issued_tx or 
            issued_tx_r or issued_aready_r or
            pl_addrfifo_ept or rs_fifo_full_i
            or avalid_unbp_r or aready_r or
            pop_req_n_unbp_r) begin
    avalid_unbp = 1'b0;
    rs_push_req_n_unbp = 1'b1;

    if (pl_addrfifo_ept | (rs_fifo_full_i & !issued_aready_r & 
          WRITE_CHANNEL) |
         (rs_fifo_full_i & !WRITE_CHANNEL) |
         (rs_fifo_full_i & issued_tx_r) |
         (WRITE_CHANNEL & rs_fifo_full_i & !pop_req_n_unbp_r))
      avalid_unbp = 1'b0;
    else begin
      case (resize_ctrl)
        `AS_IS_OR_US_INLAST, `SINGLE_XACT_INLAST,
        `MUL_XACT_OR_US_INLAST, `MUL_XACT_INLAST: begin
          avalid_unbp = 1'b1;
  
          if (issued_tx)
            rs_push_req_n_unbp = 1'b0;
        end
  
        default: begin
//        `MUL_XACT_OR_US_NOTLAST, `MUL_XACT_NOTLAST: begin
          case (micro_ctrl)
            `MUX_OVERONE, `MUX_CROSS, `MUX_FI_MUL: begin
              avalid_unbp = 1'b1;
  
              if (issued_tx)
                rs_push_req_n_unbp = 1'b0;
            end
  
            `MUX_WRAP_BOUND, `MUX_WRAP, `MUX_FI_LAST: begin
                avalid_unbp = 1'b1;
  
                if (issued_tx)
                  rs_push_req_n_unbp = 1'b0;
            end
  
            default: begin
              avalid_unbp = 1'b0;
            end
          endcase
        end
  
//        default: begin
//          if ( avalid_unbp_r & aready_r ) avalid_unbp = 1'b0;
//          else avalid_unbp = avalid_unbp_r;
//        end
      endcase
    end
  end

  ///////////////////////////////////////////////////////////////////
  // register total_alen and total_addr, last_rs_xact_ctl and
  // default last_rs_xact_ctl is 1.
  ///////////////////////////////////////////////////////////////////
  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      total_alen_r       <= 0;
      avalid_unbp_r      <= 1'b0;
      aready_r           <= 1'b0;
    end
    else begin
      total_alen_r       <= total_alen_s;
      avalid_unbp_r      <= avalid_unbp;
      aready_r           <= aready_il;
    end
  end

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      total_addr_r <= 0;
    else
      total_addr_r <= total_addr_s;
  end

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      last_rs_xact_ctl_r <= 1'b1;
    else
      last_rs_xact_ctl_r <= last_rs_xact_ctl;
  end

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      alock_r <= 0;
    else
      alock_r <= alock_o;
  end

  //issued_tx_r used to disable avalid if aready/avalid/issued_tx
  //asserted at the same cycle as well as rs_fifo_full
  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      issued_tx_r <= 0;
    else begin
      if (avalid_unbp & aready_il & issued_tx)
        issued_tx_r <= 1'b1;
      else if (!rs_fifo_full_i)
        issued_tx_r <= 1'b0;
    end
  end

  ///////////////////////////////////////////////////////////////////
  // To get how many bytes already ran
  // add total_byte_mux if avalid_o & ready both high.
  ///////////////////////////////////////////////////////////////////
  always @(last_rs_xact_ctl_r or avalid_unbp or pre_ran_num_bytes_r
            or total_byte_mux or aready_in or xact_stall) begin
    if (last_rs_xact_ctl_r)
      pre_ran_num_bytes_s = 0;
    else if ((avalid_unbp & aready_in) | xact_stall)
      pre_ran_num_bytes_s = pre_ran_num_bytes_r + total_byte_mux;
    else
      pre_ran_num_bytes_s = pre_ran_num_bytes_r;
  end

  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn)
      pre_ran_num_bytes_r <= 0;
    else
      pre_ran_num_bytes_r <= pre_ran_num_bytes_s;
  end

  assign pre_ran_num_bytes = pre_ran_num_bytes_r + total_byte_mux;

  assign deduct_ran_num_bytes = pre_ran_num_bytes + total_byte_mux;

endmodule
