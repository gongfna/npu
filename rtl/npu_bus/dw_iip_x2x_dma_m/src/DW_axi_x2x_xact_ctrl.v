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

module dma_m_DW_axi_x2x_xact_ctrl (
  //inputs
  resize_ctrl_i,
  aready_i,
  xact_upsize_i,
  mp_total_byte_i,
  addr_i,
  bound_addr_i,
  total_addr_r_i,
  total_alen_r_i,
  aburst_i,
  mp_asize_mux_i,
  alock_last_flag_i,
  pre_resp_comp_i,
  max_sp_total_byte_mux_i,
  last_rs_xact_ctl_r_i,
  mp_alen_i,
  total_remain_bytes_i,
  deduct_ran_num_bytes_i,
  
  //outputs
  micro_ctrl_o,
  last_rs_xact_ctl_o
);

  //parameters
  parameter OPRT_AW           = 2; //operating address
  parameter MAX_SP_ALEN       = `X2X_MAX_SP_ALEN+1;//{`X2X_SP_BLW{1b1}}+1
  parameter MAX_SP_TOTAL_BYTE = `X2X_MAX_SP_TOTAL_BYTE; //max_asize*
  parameter MAX_MP_TOTAL_BYTE = `X2X_MAX_MP_TOTAL_BYTE; //max_asize*
  parameter INT_AW            = `X2X_INTERNAL_AW; //Internal address 
                                                  //width
  parameter SP_BLW            = `X2X_SP_BLW;      //SP burst length width
  parameter MP_BLW            = `X2X_MP_BLW;      //MP burst length width
  parameter LOG2_SP_SW        = `X2X_LOG2_SP_SW;  //log2^SP_SW
  parameter MAX_SP_ASIZE      = `X2X_MAX_SP_ASIZE;//bytes -> asize
  parameter LOG2_MP_SW        = (`X2X_LOG2_MP_SW > 0) ?
                                `X2X_LOG2_MP_SW : 1;   //log2^MP_S
  parameter LOG2_BIG_SW       = (`X2X_LOG2_MP_SW >= `X2X_LOG2_SP_SW) ?
                                 `X2X_LOG2_MP_SW : `X2X_LOG2_SP_SW;
  parameter LOG2_BIG_BW       = LOG2_BIG_SW + SP_BLW;//big asize + SP len
  parameter LOG2_MP_BW        = LOG2_MP_SW + MP_BLW;  //MP asize + alen;
  parameter SPBYTE_LGR_MP     = MAX_MP_TOTAL_BYTE <= MAX_SP_TOTAL_BYTE;
                                              //1 -> SP bytes larger MP


  //inputs
  input  [2:0]         resize_ctrl_i;           //resize control
  input                aready_i;                //aready
  input                xact_upsize_i;           //upsize enable
  input  [LOG2_MP_BW:0] mp_total_byte_i;        //MP total byte number
  input  [OPRT_AW-1:0]  addr_i;                  //aligned addr
  input  [OPRT_AW-1:0]  bound_addr_i;            //boundary addr
  // jstokes, 7.8.10, crm 9000406128, added 1 bit to this signal to
  // fix bug downsizing wrap transactions which wrap at 4k boundary.
  input  [OPRT_AW:0]    total_addr_r_i;          //total addr
  input  [LOG2_MP_BW:0] total_alen_r_i;          //total alen
  input  [1:0]         aburst_i;                //aburst
  input  [2:0]         mp_asize_mux_i;          //asize mux
  input                alock_last_flag_i;       //alock last normal flag
  input                pre_resp_comp_i;         //pre last complete
  input  [LOG2_BIG_BW:0] max_sp_total_byte_mux_i; //SP total bye mux
  input                last_rs_xact_ctl_r_i;    //last xact ctrl
  input  [MP_BLW:0]    mp_alen_i;               //MP alen
  input  [LOG2_MP_BW:0] total_remain_bytes_i;    //total remian fix byte
  input  [LOG2_MP_BW:0] deduct_ran_num_bytes_i; //ran byte num
  
  //outputs
  output [3:0]         micro_ctrl_o;            //micro control
  output               last_rs_xact_ctl_o;      //last RS xact ctrl

  reg  [3:0]           mxui_micro_ctrl;
  reg  [3:0]           mxi_micro_ctrl;
  reg  [3:0]           mux_micro_ctrl;
  reg                  mxui_xact_ctrl;
  reg                  mxi_xact_ctrl;
  reg                  mux_xact_ctrl;
  reg  [3:0]           micro_ctrl_o;            //micro control
  reg                  last_rs_xact_ctl_o;      //last RS xact ctrl
  wire [2:0]           asize_mux;
  wire [LOG2_BIG_BW:0] total_byte_mux;


  //if resize_ctrl_i == `MUL_XACT_NOTLAST
  //if resize_ctrl_i == `MUL_XACT_OR_US_NOTLAST
  assign asize_mux= (resize_ctrl_i == `MUL_XACT_NOTLAST) ? MAX_SP_ASIZE :
                     mp_asize_mux_i;
  assign total_byte_mux = (resize_ctrl_i == `MUL_XACT_NOTLAST) ? 
                     MAX_SP_TOTAL_BYTE : max_sp_total_byte_mux_i;

  always @(mp_total_byte_i or aready_i
            or addr_i 
            or bound_addr_i
            or total_alen_r_i or asize_mux
            or total_addr_r_i
            or aburst_i or total_remain_bytes_i
            or last_rs_xact_ctl_r_i
            or deduct_ran_num_bytes_i) begin
    mux_micro_ctrl = 0;
    mux_xact_ctrl  = last_rs_xact_ctl_r_i;

      if (aburst_i == `X2X_BT_WRAP) begin //wrap
        if (mp_total_byte_i > 
             ((total_alen_r_i + MAX_SP_ALEN) << asize_mux)
) 
        begin //over one xact
          // More than 1 SP t/x left (after the current t/x) 
          // to complete the transfer.
          mux_micro_ctrl = `MUX_OVERONE;
 
          if (aready_i)
            mux_xact_ctrl = 1'b0;
        end 
        else begin //last one or two xacts
          if (total_addr_r_i == bound_addr_i + mp_total_byte_i) begin
            // Next t/x will complete the transfer, current transfer
            // addresses to the upper wrap boundary.
            mux_micro_ctrl = `MUX_WRAP_BOUND;

            //from bound, last one
              if (aready_i) mux_xact_ctrl = 1'b1;
          end
          // jstokes, 7.8.10, crm 9000406128, total_addr_r_i now
          // OPRT_AW+1 bits wide.
          else if (addr_i == bound_addr_i ||
                    total_addr_r_i < {1'b0, addr_i}) begin 
            //no cross or closest to aligned_addr_i, last one
            mux_micro_ctrl = `MUX_WRAP;

              if (aready_i) mux_xact_ctrl = 1'b1;
          end
          else begin //cross boundary
            mux_micro_ctrl = `MUX_CROSS;

            if (aready_i)
              mux_xact_ctrl = 1'b0;
          end
        end
      end
      else begin //fixed or incr
        if (aburst_i == `X2X_BT_FIXED &&
            total_remain_bytes_i > deduct_ran_num_bytes_i) begin //nolast
          mux_micro_ctrl = `MUX_FI_MUL;

          if (aready_i)
            mux_xact_ctrl = 1'b0;
        end
        else if (aburst_i == `X2X_BT_INCR &&
          mp_total_byte_i > deduct_ran_num_bytes_i) begin //not last xact
          mux_micro_ctrl = `MUX_FI_MUL;
  
          if (aready_i)
            mux_xact_ctrl = 1'b0;
        end
        else begin //last xact
          mux_micro_ctrl = `MUX_FI_LAST;

          if (aready_i)
            mux_xact_ctrl = 1'b1;
        end
      end
  end

  //if resize_ctrl_i == `MUL_XACT_INLAST
  always @(aready_i or 
            aburst_i or
            last_rs_xact_ctl_r_i) begin
    mxi_micro_ctrl = 0;
    mxi_xact_ctrl  = last_rs_xact_ctl_r_i;

      if (aburst_i == `X2X_BT_WRAP) begin //wrap
        mxi_micro_ctrl = `MXI_WRAP;

        if (aready_i)
          mxi_xact_ctrl = 1'b0;
      end
      else begin //fixed or incr
        mxi_micro_ctrl = `MXI_FI;

        if (aready_i)
          mxi_xact_ctrl = 1'b0;
      end
  end

  wire spbyte_lgr_mp;
  assign spbyte_lgr_mp = (mp_total_byte_i <= MAX_SP_TOTAL_BYTE) |
                         SPBYTE_LGR_MP;

  //if resize_ctrl_i == `MUL_XACT_OR_US_INLAST
  always @(xact_upsize_i or 
            aready_i or spbyte_lgr_mp or
            bound_addr_i or addr_i or aburst_i or
            mp_total_byte_i or
            last_rs_xact_ctl_r_i) begin
    mxui_micro_ctrl = 0;
    mxui_xact_ctrl  = last_rs_xact_ctl_r_i;

      if (aburst_i == `X2X_BT_WRAP) begin //wrap
	 //VCS coverage off
        if (xact_upsize_i) begin //upsize
          if (spbyte_lgr_mp &&
               addr_i == bound_addr_i) begin //SingleXact
            mxui_micro_ctrl = `MXUI_SINGLE;
  
            if (aready_i)
              mxui_xact_ctrl = 1'b1;
          end
          else if (addr_i + MAX_SP_TOTAL_BYTE <=
                    bound_addr_i + mp_total_byte_i) begin //no cross
            //no cross, multi xact
            mxui_micro_ctrl = `MXUI_NO_CROSS;
   
            if (aready_i)
              mxui_xact_ctrl = 1'b0;
          end
          else begin //cross, multi xact
            mxui_micro_ctrl = `MXUI_CROSS;
  
            if (aready_i)
              mxui_xact_ctrl = 1'b0;
          end
        end
	 //VCS coverage on
        else begin //downsize, multi xact
          mxui_micro_ctrl = `MXUI_DS;
  
          if (aready_i)
            mxui_xact_ctrl = 1'b0;
        end
      end
      else begin //fixed or incr
         // Turn off coverage for this section of code if 
	 // no upsizing has been configured.
	  //VCS coverage off
        if (xact_upsize_i) begin //upsize
          if (spbyte_lgr_mp) begin //SingleXact
            mxui_micro_ctrl = `MXUI_FI_SINGLE;

            if (aready_i)
              mxui_xact_ctrl = 1'b1;
          end
          else begin //multi xact
            mxui_micro_ctrl = `MXUI_FI_MUL;

            if (aready_i)
              mxui_xact_ctrl = 1'b0;
          end
        end
        else begin //downsize, multi xact
	  //VCS coverage on 
          mxui_micro_ctrl = `MXUI_FI_DS;

          if (aready_i)
            mxui_xact_ctrl = 1'b0;
        end
      end
  end

  //micro_ctrl and xact_ctl mux
  always @(resize_ctrl_i or mxui_micro_ctrl or mxui_xact_ctrl or
            mux_micro_ctrl or mux_xact_ctrl or mxi_micro_ctrl or
            mxi_xact_ctrl or last_rs_xact_ctl_r_i or aready_i) begin
    last_rs_xact_ctl_o = last_rs_xact_ctl_r_i;
    micro_ctrl_o       = `IDLE_CTRL;

    case (resize_ctrl_i)
      `AS_IS_OR_US_INLAST, `SINGLE_XACT_INLAST: begin
        if (aready_i)
          last_rs_xact_ctl_o = 1'b1;
      end

      `MUL_XACT_OR_US_INLAST: begin
        last_rs_xact_ctl_o = mxui_xact_ctrl;
        micro_ctrl_o       = mxui_micro_ctrl;
      end 

      `MUL_XACT_INLAST: begin
        last_rs_xact_ctl_o = mxi_xact_ctrl;
        micro_ctrl_o       = mxi_micro_ctrl;
      end

      `MUL_XACT_OR_US_NOTLAST, `MUL_XACT_NOTLAST: begin
        last_rs_xact_ctl_o = mux_xact_ctrl;
        micro_ctrl_o       = mux_micro_ctrl;
      end

      default: begin
        last_rs_xact_ctl_o = last_rs_xact_ctl_r_i;
        micro_ctrl_o       = 0;
      end
    endcase
  end

endmodule
