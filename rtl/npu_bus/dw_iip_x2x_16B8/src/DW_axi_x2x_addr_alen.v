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
// xact control
/////////////////////////////////////////////////////////////////////////

module DW_axi_x2x_addr_alen (
  //inputs
  resize_ctrl_i,
  xact_upsize_i,
  mp_total_byte_i,
  aligned_addr_i,
  total_alen_r_i,
  total_addr_r_i,
  max_sp_mpasize_total_byte_i,
  asize_i,
  micro_ctrl_i,
  reduce_num_i,
  aready_i,
  aburst_i,
  alen_i,
  addr_i,
  max_sp_total_byte_mux_i,
  alock_last_flag_i,
  mp_asize_mux_i,
  total_remain_bytes_i,
  pre_ran_num_bytes_i,
  reduce_num_r_i,
  
  //outputs
  xact_stall_o,
  alen_o,
  addr_o,
  total_alen_o,
  total_addr_o,
  mxin_reduce_num_o,
  pre_last_xact_o
);

  //parameters
  parameter OPRT_AW           = 2;                 //operating address
  parameter RDC_NUM_W         = 1;                 //reduce number
  parameter MAX_SP_ALEN       = `X2X_MAX_SP_ALEN+1;//{`X2X_SP_BLW{1b1}}+1
  parameter MAX_SP_TOTAL_BYTE = `X2X_MAX_SP_TOTAL_BYTE; //max_asize*
  parameter INT_AW            = `X2X_INTERNAL_AW; //Internal address 
                                                  //width.
  parameter SP_BLW            = `X2X_SP_BLW;      //SP burst length width
  parameter MP_BLW            = `X2X_MP_BLW;      //SP burst length width
  parameter LOG2_SP_SW        = `X2X_LOG2_SP_SW;     //log2^SP_SW
  parameter MAX_SP_ASIZE      = `X2X_MAX_SP_ASIZE;   //log2^SP_SW
  parameter MAX_MP_ASIZE      = `X2X_MAX_MP_ASIZE;   //log2^MP_SW
  parameter LOG2_MP_SW        = (`X2X_LOG2_MP_SW > 0) ?
                                `X2X_LOG2_MP_SW : 1;   //log2^MP_SW
  parameter LOG2_BIG_SW       = (`X2X_LOG2_MP_SW >= `X2X_LOG2_SP_SW) ?
                                 `X2X_LOG2_MP_SW : `X2X_LOG2_SP_SW;
  parameter LOG2_BIG_BW       = LOG2_BIG_SW + SP_BLW; //big size + SP len
  parameter LOG2_MP_BW        = LOG2_MP_SW + MP_BLW;  //MP asize + alen
  parameter LOG2_MS_BW        = LOG2_MP_SW + SP_BLW;  //MP size + SP len

  //inputs
  input  [2:0]          resize_ctrl_i;           //resize control
  input                 xact_upsize_i;           //upsize enable
  input  [LOG2_MP_BW:0] mp_total_byte_i;      //MP total byte number
  input  [OPRT_AW-1:0]  aligned_addr_i;          //aligned addr
  input  [LOG2_MP_BW:0] total_alen_r_i;          //total alen
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  input  [OPRT_AW:0]    total_addr_r_i;          //total addr
  input  [LOG2_MS_BW:0] max_sp_mpasize_total_byte_i; //SP total bytes
  input  [2:0]          asize_i;                 //MP asize to bytes
  input  [3:0]          micro_ctrl_i;            //case control
  input  [RDC_NUM_W-1:0] reduce_num_i;         //unaligned unused xact
  input                 aready_i;                //ready of A from SP
  input  [1:0]          aburst_i;                //aburst from MP
  input  [MP_BLW-1:0]   alen_i;                  //alen from MP
  input  [OPRT_AW-1:0]  addr_i;                  //addr from MP
  input  [LOG2_BIG_BW:0] max_sp_total_byte_mux_i; //sp total byte mux
  input                 alock_last_flag_i;      //last normal of lock seq
  input  [2:0]          mp_asize_mux_i;          //byte mux
  input  [LOG2_MP_BW:0] total_remain_bytes_i; //total remain fix byte
  input  [LOG2_MP_BW:0] pre_ran_num_bytes_i;  //pre ran number of byte
  input  [RDC_NUM_W-1:0] reduce_num_r_i;      //reg reduce number
  
  //outputs
  output              xact_stall_o;    //stall if MAX_SP_ALEN<=reduce_num
  output [SP_BLW-1:0] alen_o;          //alen to SP
  output [OPRT_AW-1:0] addr_o;          //slave address
  output [LOG2_MP_BW:0] total_alen_o;    //total alen
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  output [OPRT_AW:0] total_addr_o;    //total addr
  output [RDC_NUM_W-1:0] mxin_reduce_num_o; //reduce number from MXI
  output              pre_last_xact_o; //xact before last xact


  //alen_o gen. mind upsize and last xact
  wire [SP_BLW-1:0]  alen_s;
  wire [SP_BLW-1:0]  alen_s12;
  wire [SP_BLW-1:0]  alen_s34;
  wire [SP_BLW-1:0]  alen_s56;
  wire [OPRT_AW:0]  upper_bound_addr;
  wire [OPRT_AW:0]  bound_plus_total;
  wire [OPRT_AW:0]  align_plus_sp_total;
  wire [OPRT_AW:0]  align_plus_mpsp_total;
  wire [OPRT_AW:0]  addr_t_plus_sp_total;
  wire [LOG2_MP_BW:0] minus_aligned_addr;
  wire [LOG2_MP_BW:0] minus_total_addr;
  wire [2:0]          asize_mux;
  wire                xact_stall_o;

  //calculations used below
  assign align_plus_mpsp_total = aligned_addr_i 
                                 + max_sp_mpasize_total_byte_i;
  assign align_plus_sp_total = aligned_addr_i + MAX_SP_TOTAL_BYTE;
  assign alen_s  = (mp_total_byte_i >> MAX_SP_ASIZE) - 1;

  assign alen_s56 = (resize_ctrl_i == `MUL_XACT_OR_US_NOTLAST &&
                     !xact_upsize_i) ?
                     ((mp_total_byte_i-
                      (total_alen_r_i << asize_i)) >> asize_i) - 1 :
                     ((mp_total_byte_i -
                      (total_alen_r_i << MAX_SP_ASIZE))
                      >> MAX_SP_ASIZE) - 1;

  assign asize_mux = (resize_ctrl_i == `MUL_XACT_OR_US_NOTLAST) ?
                      asize_i : MAX_SP_ASIZE;

  //if resize_ctrl_i == `MUL_XACT_OR_US_INLAST
  reg  [SP_BLW-1:0]   mxui_alen;
  reg  [LOG2_MP_BW:0] mxui_total_alen;
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  reg  [OPRT_AW:0]  mxui_total_addr;

  always @(micro_ctrl_i or alen_s or
            align_plus_mpsp_total or 
            alen_i or
            total_alen_r_i or total_addr_r_i or align_plus_sp_total
) begin
    mxui_alen = alen_i;
    mxui_total_alen = total_alen_r_i;
    mxui_total_addr = total_addr_r_i;

      case (micro_ctrl_i)
        `MXUI_SINGLE, `MXUI_FI_SINGLE:
          mxui_alen = alen_s;

        `MXUI_NO_CROSS, `MXUI_FI_MUL, `MXUI_FI_DS: begin
          mxui_total_alen = MAX_SP_ALEN;
          mxui_alen = MAX_SP_ALEN - 1;
      
          if (micro_ctrl_i == `MXUI_NO_CROSS || 
	  //VCS coverage off
               micro_ctrl_i == `MXUI_FI_MUL) 
	  //VCS coverage on
            mxui_total_addr = align_plus_sp_total;

          if (micro_ctrl_i == `MXUI_FI_DS)
            mxui_total_addr = align_plus_mpsp_total;
        end


        default: mxui_alen = alen_i;
      endcase
  end

  //if resize_ctrl_i == `MUL_XACT_OR_US_NOTLAST
  reg  [SP_BLW-1:0]   mxun_alen;
  reg  [LOG2_MP_BW:0] mxun_total_alen;
  reg  [OPRT_AW-1:0]  mxun_addr;
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  reg  [OPRT_AW:0]  mxun_total_addr;
  wire [LOG2_MP_BW:0] alen_plus_max;
  wire [LOG2_MP_BW:0] alen_r_plus_a34;
  wire [OPRT_AW:0]  plus_sp_mux;

  assign alen_plus_max = total_alen_r_i + MAX_SP_ALEN;
  assign plus_sp_mux = total_addr_r_i + max_sp_total_byte_mux_i;

  always @(micro_ctrl_i or 
            alen_s56 or alen_i or
            total_alen_r_i or total_addr_r_i or addr_i or 
            aready_i or alen_plus_max or
            aburst_i or plus_sp_mux) begin
    mxun_alen = alen_i;
    mxun_total_alen = total_alen_r_i;
    mxun_addr = addr_i[OPRT_AW-1:0];
    mxun_total_addr = total_addr_r_i;

      case (micro_ctrl_i)

        `MUX_FI_LAST: begin
          mxun_alen = alen_s56;


          // jstokes, 7.8.10, crm 9000406128, total_addr_r_i now
          // OPRT_AW+1 bits wide, mxun_addr needs only OPRT_AW bits.
          if (micro_ctrl_i == `MUX_FI_LAST && aburst_i == `X2X_BT_INCR)
            mxun_addr = total_addr_r_i[OPRT_AW-1:0]; //INCR
        end


        `MUX_FI_MUL: begin
          mxun_alen = MAX_SP_ALEN - 1;

          if (aready_i) begin
            mxun_total_alen = alen_plus_max;
            mxun_total_addr = plus_sp_mux;
          end

          if (aburst_i == `X2X_BT_INCR) //INCR
            // jstokes, 7.8.10, crm 9000406128, total_addr_r_i now
            // OPRT_AW+1 bits wide, mxun_addr needs only OPRT_AW bits.
            mxun_addr = total_addr_r_i[OPRT_AW-1:0];
        end

        default: mxun_alen = alen_i;
      endcase
  end

  //if resize_ctrl_i == `MUL_XACT_INLAST
  reg  [SP_BLW-1:0]    mxi_alen;
  reg  [LOG2_MP_BW:0]  mxi_total_alen;
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  reg  [OPRT_AW:0]     mxi_total_addr;
  reg                  mxi_stall; //to stall xact
  reg  [RDC_NUM_W-1:0] mxi_reduce_num;

  always @(micro_ctrl_i or 
            reduce_num_i or alen_i or
            total_alen_r_i or total_addr_r_i or aburst_i or
            align_plus_sp_total or reduce_num_r_i) begin
    mxi_alen = alen_i;
    mxi_stall = 1'b0; 
    mxi_total_alen = total_alen_r_i;
    mxi_total_addr = total_addr_r_i;
    mxi_reduce_num = reduce_num_r_i;

      case (micro_ctrl_i)

        `MXI_FI: begin
          if (aburst_i == `X2X_BT_FIXED)
            mxi_alen = MAX_SP_ALEN - 1;
          else begin //INCR
            if (MAX_SP_ALEN > reduce_num_i) begin
              mxi_alen = MAX_SP_ALEN - 1 - reduce_num_i;
              mxi_reduce_num = 0;
            end
            else begin //MAX_SP_ALEN <= reduce_num_i
              mxi_alen = MAX_SP_ALEN - 1;
              mxi_stall = 1'b1;
              mxi_reduce_num = reduce_num_i - MAX_SP_ALEN;
            end
          end

          mxi_total_alen = MAX_SP_ALEN;
          mxi_total_addr = align_plus_sp_total;
        end

        default: mxi_alen = alen_i;
      endcase
  end


  //if resize_ctrl_i == `MUL_XACT_NOTLAST
  reg  [SP_BLW-1:0]   mxn_alen;
  reg  [LOG2_MP_BW:0] mxn_total_alen;
  reg  [OPRT_AW-1:0]  mxn_addr;
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  reg  [OPRT_AW:0]    mxn_total_addr;
  reg  [RDC_NUM_W-1:0] mxn_reduce_num;
  reg                  mxn_stall;
  wire [OPRT_AW:0]   total_plus_sp_total;

  assign total_plus_sp_total = total_addr_r_i + MAX_SP_TOTAL_BYTE;

  always @(micro_ctrl_i or 
            alen_s56 or alen_i or total_alen_r_i or
            total_addr_r_i or addr_i or
            aready_i or alen_plus_max or
            total_plus_sp_total or
            aburst_i or reduce_num_r_i or
            total_remain_bytes_i or pre_ran_num_bytes_i or
            asize_mux) begin
    mxn_alen = alen_i;
    mxn_total_alen = total_alen_r_i;
    mxn_addr = addr_i[OPRT_AW-1:0];
    mxn_total_addr = total_addr_r_i;
    mxn_reduce_num = reduce_num_r_i;
    mxn_stall = 1'b0;

      case (micro_ctrl_i)

        `MUX_FI_LAST: begin
          if (micro_ctrl_i == `MUX_FI_LAST && aburst_i == `X2X_BT_FIXED)
            mxn_alen = ((total_remain_bytes_i - 
                       pre_ran_num_bytes_i) >> asize_mux) - 1;
          else if (micro_ctrl_i == `MUX_FI_LAST && 
                   aburst_i == `X2X_BT_INCR)
            mxn_alen = alen_s56 - reduce_num_r_i;
          else
            mxn_alen = alen_s56;


          if (micro_ctrl_i == `MUX_FI_LAST && 
               aburst_i == `X2X_BT_INCR) begin
            // jstokes, 7.8.10, crm 9000406128, total_addr_r_i now
            // OPRT_AW+1 bits wide.
            if (total_addr_r_i <= {1'b0, addr_i[OPRT_AW-1:0]})
              mxn_addr = addr_i[OPRT_AW-1:0];
            else
              // jstokes, 7.8.10, crm 9000406128, total_addr_r_i now
              // OPRT_AW+1 bits wide, mxn_addr needs only OPRT_AW bits.
              mxn_addr = total_addr_r_i[OPRT_AW-1:0];
          end
        end


        `MUX_FI_MUL: begin
          if (aburst_i == `X2X_BT_FIXED)
            mxn_alen = MAX_SP_ALEN - 1;
          else begin //`X2X_BT_INCR
            if (MAX_SP_ALEN > reduce_num_r_i)
              mxn_alen = MAX_SP_ALEN - 1 - reduce_num_r_i;
            else begin //MAX_SP_ALEN <= reduce_num_i
              mxn_alen = MAX_SP_ALEN - 1;
              mxn_stall = 1'b1;
            end 
          end

          if (aready_i)
              mxn_total_alen = alen_plus_max;

          if (aburst_i == `X2X_BT_INCR) begin
            // jstokes, 7.8.10, crm 9000406128, total_addr_r_i now
            // OPRT_AW+1 bits wide.
            if (total_addr_r_i <= {1'b0, addr_i[OPRT_AW-1:0]})
              mxn_addr = addr_i[OPRT_AW-1:0];
            else //>addr_i
              // jstokes, 7.8.10, crm 9000406128, total_addr_r_i now
              // OPRT_AW+1 bits wide, mxn_addr needs only OPRT_AW bits.
              mxn_addr = total_addr_r_i[OPRT_AW-1:0];

            if (aready_i) begin
              mxn_total_addr = total_plus_sp_total;
              
              if (MAX_SP_ALEN > reduce_num_r_i)
                mxn_reduce_num = 0;
              else
                mxn_reduce_num = reduce_num_r_i - MAX_SP_ALEN;
            end
          end
        end

        default: mxn_alen = alen_i;
      endcase
  end

  //pre_last_xact_o gen. need to calculate xact just before last xact
  //mind wrap cross boundary
  //if resize_ctrl_i == `MUL_XACT_NOTLAST
 
  //xact stall if MAX_SP_ALEN <= reduce_num_r;
  assign xact_stall_o = mxi_stall | mxn_stall;

  //reg reduce number
  reg  [RDC_NUM_W-1:0] mxin_reduce_num_o;

  always @(reduce_num_r_i or mxi_reduce_num or micro_ctrl_i or 
            mxn_reduce_num) begin
    mxin_reduce_num_o = reduce_num_r_i;

    if (micro_ctrl_i == `MXI_FI)
      mxin_reduce_num_o = mxi_reduce_num;
    else begin
      if (micro_ctrl_i == `MUX_FI_MUL || micro_ctrl_i == `MUX_FI_LAST)
        mxin_reduce_num_o = mxn_reduce_num;
    end
  end

  //alen/addr/total_alen/total_addr mux
  reg [SP_BLW-1:0]   alen_o;
  reg [LOG2_MP_BW:0] total_alen_o;
  reg [OPRT_AW-1:0]  addr_o;
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  reg [OPRT_AW:0]    total_addr_o;
  reg                    pre_last_xact_o;

  always @(resize_ctrl_i or mxn_alen or mxi_alen or mxui_alen or 
            mxun_alen or alen_i or total_alen_r_i or addr_i or
            total_addr_r_i or xact_upsize_i or alen_s or mxun_addr or
            mxui_total_alen or mxui_total_addr or mxun_total_alen or
            mxun_total_addr or reduce_num_i or mxi_total_alen or
            mxi_total_addr or mxn_total_alen or mxn_addr or aburst_i or
            mxn_total_addr or 
            total_remain_bytes_i or
            asize_mux) begin
    alen_o = alen_i;
    total_alen_o = total_alen_r_i;
    addr_o = addr_i[OPRT_AW-1:0];
    total_addr_o = total_addr_r_i;
    pre_last_xact_o = 1'b0;

    case (resize_ctrl_i)
      `AS_IS_OR_US_INLAST: begin
        if (xact_upsize_i)  alen_o = alen_s;
      end 

      `MUL_XACT_OR_US_INLAST: begin
        alen_o = mxui_alen;
        total_alen_o = mxui_total_alen;
        total_addr_o = mxui_total_addr;
      end

      `MUL_XACT_OR_US_NOTLAST: begin
        alen_o = mxun_alen;
        total_alen_o = mxun_total_alen;
        addr_o = mxun_addr;
        total_addr_o = mxun_total_addr;
      end

      `SINGLE_XACT_INLAST: begin
        if (aburst_i == `X2X_BT_FIXED)
          alen_o = (total_remain_bytes_i >> asize_mux) - 1;
        else 
          //sp_alen > reduce_num_i
          alen_o = alen_s - reduce_num_i;
      end

      `MUL_XACT_INLAST: begin
        alen_o = mxi_alen;
        total_alen_o = mxi_total_alen;
        total_addr_o = mxi_total_addr;
      end

      `MUL_XACT_NOTLAST: begin
        alen_o = mxn_alen;
        total_alen_o = mxn_total_alen;
        addr_o = mxn_addr;
        total_addr_o = mxn_total_addr;
      end

      default: alen_o = alen_i;
    endcase
  end

endmodule
