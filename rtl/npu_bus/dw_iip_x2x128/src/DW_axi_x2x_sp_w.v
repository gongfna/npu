/* --------------------------------------------------------------------
**
**                    (C) COPYRIGHT 2006-2011 SYNOPSYS, INC.
**                           ALL RIGHTS RESERVED
**
**  This software and the associated documentation are confidential and
**  proprietary to Synopsys, Inc.  Your use or disclosure of this
**  software is subject to the terms and conditions of a written
**  license agreement between you, or your company, and Synopsys, Inc.
**
**  The entire notice above must be reproduced on all authorized copies.
**
** --------------------------------------------------------------------
**
** File     : DW_axi_x2x_sp_w.v
** Abstract : This block implements the write data control block
**            in the X2X slave port.
**
**            It receives notification of issued transactions from
**            the slave port write address channel, stores them in
**            a fifo and converts write data beats from the master
**            ports to match the transactions issued by the slave port
**            address channels.
**
** --------------------------------------------------------------------
*/


module x128_DW_axi_x2x_sp_w (
  // System inputs
  aclk_i,
  aresetn_i,

  // SP WRITE ADDRESS CHANNEL I/F
  // Inputs 
  rs_push_req_n_i,
  aid_i,
  alen_i,
  aburst_i,
  asize_sp_i,
  asize_mp_i,
  addr_i,
  us_xact_issue_off_i,
  
  // Outputs 
  rs_fifo_full_o,
  wrequest_o,
  wid_o,
  us_issue_req_o,
  

  // CHANNEL FIFO I/F
  // Inputs 
  pop_empty_i,
  payload_i,
  
  // Outputs 
  pop_req_n_o,
  

  // EXTERNAL SLAVE PORT I/F
  // Inputs 
  ready_i,
  
  // Outputs 
  valid_o,
  payload_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------

  // INTERFACE PARAMETERS - MUST BE SET BY INSTANTIATION


  // INTERNAL PARAMETERS - MUST NOT BE SET BY INSTANTIATION
  parameter SP_PYLD_W = `X2X_WPYLD_W_SP; // SP payload width.
  parameter MP_PYLD_W = `X2X_WPYLD_W_MP; // MP payload width.

  parameter MP_ID_W = `X2X_MP_IDW; // Internal ID width will always be
                                   // this value. May be padded out to 
			           // larger width before being 
				   // forwarded from the SP.

  parameter SP_ID_W = `X2X_SP_IDW; // ID width driven out from X2X SP.

  parameter SP_BL_W = `X2X_SP_BLW; // SP burst length signal width.
  parameter MP_BL_W = `X2X_MP_BLW; // MP Burst length signal width.

  parameter BS_W = `X2X_BSW; // Burst size signal width.

  parameter BT_W = `X2X_BTW; // Burst type signal width.

  parameter BS_P1_W = `X2X_BSW + 1; // (Burst size + 1) signal width.

  parameter RSI_FIFO_W = `X2X_SP_W_RSFIFO_W; // Width of resize info.
                                             // fifo.
  
  // Depth of resizing info. fifo.
  parameter RSINFO_FIFO_D = `X2X_SP_W_RSFIFO_D;
  
  // Log base 2 of RSINFO_FIFO_D.
  parameter RSINFO_FIFO_D_L2 = `X2X_SP_W_RSFIFO_D_L2;
  
  // Log base 2 of (RSINFO_FIFO_D+1).
  parameter RSINFO_FIFO_D_P1L2 = `X2X_SP_W_RSFIFO_D_P1L2;
	                     
  // Bits of address that X2X requires for resizing.
  parameter ADDR_TRK_W = `X2X_ADDR_TRK_W;

  // Beats per pop width.
  parameter BEATS_PER_POP_W = `X2X_SP_W_BEATS_PER_POP_W;					     
  // Write interleaving depth.
  parameter WID = (`X2X_HAS_WI_FAN_OUT ? 1 : `X2X_WID) ; 

  // Bussed resize info. slot signal widths.
  parameter BUS_MP_ID_W         = (WID*MP_ID_W);
  parameter BUS_SP_BL_W         = (WID*SP_BL_W);
  parameter BUS_BS_W            = (WID*BS_W);
  parameter BUS_BT_W            = (WID*BT_W);
  parameter BUS_BS_P1_W         = (WID*BS_P1_W);
  parameter BUS_ADDR_TRK_W      = (WID*ADDR_TRK_W);
  parameter BUS_BEATS_PER_POP_W = (WID*BEATS_PER_POP_W);

  // MP signal width parameters.
  parameter MP_DW = `X2X_MP_DW;
  parameter MP_SW = `X2X_MP_SW;

  // SP signal width parameters.
  parameter SP_DW = `X2X_SP_DW;
  parameter SP_SW = `X2X_SP_SW;

  // Sideband signal width.
  parameter W_SBW = `X2X_W_SBW;

  // Data select width.
  parameter DATA_SEL_W = `X2X_DATA_SEL_W;

  // Maximum possible asize from SP.
  parameter MAX_SP_ASIZE = `X2X_MAX_SP_ASIZE;

  // Log base 2 of SP strobe width.
  parameter SP_LOG2_SW = `X2X_LOG2_SP_SW;
  
  // Log base 2 of MP strobe width.
  parameter MP_LOG2_SW = `X2X_LOG2_MP_SW;

  // Bussed data & strobe packing variable signal widths.
  parameter BUS_SP_DW = (WID*SP_DW);
  parameter BUS_SP_SW = (WID*SP_SW);

  // Resizing ratio.
  parameter RS_RATIO = `X2X_RS_RATIO;

  // Has upsizing.
  parameter HAS_TX_UPSIZE = `X2X_HAS_TX_UPSIZE;

  // Log b2 of max strobe width.
  parameter LOG2_MAX_SW = `X2X_LOG2_MAX_SW;

  // Slave port data width divided by all possible values of mp_asize.
  parameter SP_DW_DIV8   = SP_DW / 8;   
  parameter SP_DW_DIV16  = SP_DW / 16;
  parameter SP_DW_DIV32  = SP_DW / 32;
  parameter SP_DW_DIV64  = SP_DW / 64;
  parameter SP_DW_DIV128 = SP_DW / 128;
  parameter SP_DW_DIV256 = SP_DW / 256;
  parameter SP_DW_DIV512 = SP_DW / 512;

//----------------------------------------------------------------------
// LOCAL MACROS.
//----------------------------------------------------------------------
 

//----------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------
  // System inputs
  input aclk_i;
  input aresetn_i;
  

  //--------------------------------------------------------------------
  // SP WRITE ADDRESS CHANNEL I/F
  //--------------------------------------------------------------------
  // Inputs 
  input rs_push_req_n_i; // Push request to resize info. fifo.

  // Resized transaction attributes.
  input [MP_ID_W-1:0] aid_i;
  input [SP_BL_W-1:0] alen_i;
  input [BT_W-1:0] aburst_i;
  input [BS_W-1:0] asize_sp_i; // Size of t/x issued from SP.
  input [BS_W-1:0] asize_mp_i; // Size of t/x issued to MP.
  input [ADDR_TRK_W-1:0] addr_i; // Require certain bits of t/x address 
                                 // to track beat location if MP and SP
				 // data widths are different.
  
  input us_xact_issue_off_i; // Used in controlling issuing of upsized
                             // t/x data in configs with X2X_WID>1.
			   
  // Outputs 
  output rs_fifo_full_o; // Resize info. fifo full.

  output wrequest_o; // Asserted for non fan out interleaving 
                     // configurations when there is a write beat 
		     // present from the MP that does not match with
		     // any resize information.

  output [MP_ID_W-1:0] wid_o; // ID value associated with write data
                              // beat that asserted wrequest_o.

  output us_issue_req_o; // Used in synchronising issuing of upsized 
                         // write t/x's with the write data for configs
		         // with X2X_WID > 1.
  

  //--------------------------------------------------------------------
  // CHANNEL FIFO I/F
  //--------------------------------------------------------------------
  // Inputs 
  input pop_empty_i; // Empty status from channel fifo.
  input [MP_PYLD_W-1:0] payload_i; // Payload from channel fifo.
  
  // Outputs 
  output pop_req_n_o; // Pop request to channel fifo.
  reg    pop_req_n_o; 
  

  //--------------------------------------------------------------------
  // EXTERNAL SLAVE PORT I/F
  //--------------------------------------------------------------------
  // Inputs 
  input ready_i; // Ready from SP.
  
  // Outputs 
  output valid_o; // Valid to SP.
  reg    valid_o; 
  output [SP_PYLD_W-1:0] payload_o; // Payload to SP.


  //--------------------------------------------------------------------
  // WIRE/REGISTER VARIABLE DECLARATIONS
  //--------------------------------------------------------------------
  
  // RESIZE INFO. CONDITIONING SIGNALS.
  reg [ADDR_TRK_W-1:0] addr_aligned; // addr_i aligned w.r.t. 
                                     // asize_sp_i.
 
  wire [BEATS_PER_POP_W-1:0] beats_per_pop; // Number of write data 
                                            // beats issued for every 
					    // pop from channel fifo.

  // RSI FIFO SIGNALS.					    
  reg [RSI_FIFO_W-1:0] rsi_fifo_di; // Data in to resize info. fifo.
  wire [RSI_FIFO_W-1:0] rsi_fifo_do; // Data out from resize info. fifo.

  wire rsi_fifo_push_n;					    
  wire rsi_fifo_pop_n;
  
  // Full and empty fifo status.
  wire rsi_fifo_full;  
  wire rsi_fifo_empty;

  // Resizing information signals from the output of the resize
  // information fifo.
  reg  [MP_ID_W-1:0]         rsif_aid;
  reg  [SP_BL_W-1:0]         rsif_alen;
  reg  [BT_W-1:0]            rsif_aburst;
  reg  [BS_W-1:0]            rsif_asize_sp;
  reg  [BS_W-1:0]            rsif_asize_mp;
  reg  [LOG2_MAX_SW:0]       rsif_asize_mp_bytes;
  reg  [ADDR_TRK_W-1:0]      rsif_addr;
  wire [BEATS_PER_POP_W-1:0] rsif_bpp;    // Beats per pop.
  // Set to 0 as a wire if signal is not required by configuration.
  wire  [BEATS_PER_POP_W-1:0] rsif_fb_bpp; 
					  

  // RESIZE INFO. SLOT CONTROL SIGNALS
  reg [WID-1:0] rsis_newtx; // Bit for each slot asserted when there 
                            // is information for a new t/x to load.

  wire [WID-1:0] rsis_update_mp; // Bit for each slot asserted when 
                                 // there is updated information 
				 // while the t/x is in progress, 
				 // following acceptance of an MP
				 // beat.

  wire [WID-1:0] rsis_update_sp; // Bit for each slot asserted when 
                                 // there is updated information 
				 // while the t/x is in progress, 
				 // following acceptance of an SP
				 // beat.


  // RESIZE INFO. SLOT SIGNALS
  // Slot for 1 to write interleaving depth (WID).
  reg [WID-1:0] bus_rsis_active_r; // Bit for each slot asserted if slot
                                   // is active.
  reg [BUS_MP_ID_W-1:0]         bus_rsis_aid_r;
  reg [BUS_SP_BL_W-1:0]         bus_rsis_alen_r;
  reg [BUS_BT_W-1:0]            bus_rsis_aburst_r;
  reg [BUS_BS_W-1:0]            bus_rsis_asize_sp_r;
  reg [BUS_BS_W-1:0]            bus_rsis_asize_mp_r;
  reg [BUS_ADDR_TRK_W-1:0]      bus_rsis_addr_r;
  reg [BUS_BEATS_PER_POP_W-1:0] bus_rsis_bpp_r;
  
  wire [BEATS_PER_POP_W-1:0] rsis_bpp;    // Beats per pop and first 

  // Drive to 0 as wire.
  wire  [BEATS_PER_POP_W-1:0] rsis_fb_bpp; 

  // AXI MP CHANNEL SIGNALS - Extracted from channel fifo payload.
  wire [MP_ID_W-1:0] mp_id;
  wire [MP_DW-1:0]   mp_wdata;
  wire [MP_SW-1:0]   mp_wstrb;
  wire               mp_wlast;
  wire [W_SBW-1:0]   mp_sideband;

  // ENDIAN TRANSFORMED AXI MP CHANNEL SIGNALS
  wire [MP_DW-1:0] et_mp_wdata;
  wire [MP_SW-1:0] et_mp_wstrb;
  
  // AXI SP CHANNEL SIGNALS  
  wire [SP_DW-1:0]   sp_us_wdata; // Upsized write data.
  wire [SP_SW-1:0]   sp_us_wstrb; // Upsized write strobes.
  wire [SP_DW-1:0]   sp_nus_wdata; // Non-Upsized write data.
  wire [SP_SW-1:0]   sp_nus_wstrb; // Non-Upsized write strobes.
  wire [SP_DW-1:0]   sp_wdata;
  wire [SP_SW-1:0]   sp_wstrb;
  wire               sp_wlast;
  wire [W_SBW-1:0]   sp_sideband;


  // ID MATCHING SIGNALS
  wire match_active_id; // Asserted when ID from channel fifo matches
                        // with an active set of resizing information
 		        // from either the RSI fifo or RSI slots.

  reg [WID-1:0] rsis_match; // Bit for each RSI slot asserted when ID 
                            // from channel fifo matches with ID in the
			    // RSI slot.

  wire rsif_match; // Asserted when channel ID does not match with
                   // any active RSI slot ID's but matches with ID at
		   // the head of the RSI fifo.



  // CURRENT T/X ATTRIBUTE SIGNALS
  // Selected from either the RSI slots or the RSI fifo.
  wire [SP_BL_W-1:0]         mux_alen;
  wire [BT_W-1:0]            mux_aburst;
  wire [BS_W-1:0]            mux_asize_sp;
  wire [BS_W-1:0]            mux_asize_mp;
  reg  [LOG2_MAX_SW:0]       mux_asize_sp_bytes;
  reg  [LOG2_MAX_SW:0]       mux_asize_mp_bytes;
  wire [ADDR_TRK_W-1:0]      mux_addr;
  wire [BEATS_PER_POP_W-1:0] mux_bpp;

  // BEAT GENERATION SIGNALS		   
  
  // Address used to track position of active beats in data bus.
  // Register and next register value variables.
  reg [ADDR_TRK_W-1:0] update_addr_nxt; 
  reg [ADDR_TRK_W-1:0] update_addr_r; 

  wire [ADDR_TRK_W-1:0] current_addr;

  wire [SP_BL_W-1:0] update_alen; // Tracks remaing beats in t/x.

  // Tracks number of beats issued for every pop from channel fifo.
  // Register value and nxt - nxt value to register.
  // Used to generate pop to channel fifo.
  reg [BUS_BEATS_PER_POP_W-1:0] update_bpp_r; 
  reg [BUS_BEATS_PER_POP_W-1:0] update_bpp_nxt; 

  wire beat_acc_mp; // Asserted when an mp beat is accepted.
  wire beat_acc_sp; // Asserted when an sp beat is accepted.

  
  // DATA AND STROBE MUX SIGNALS
  wire [DATA_SEL_W-1:0] sp_data_sel; // Select lines for selecting
                                     // sp write data from mp write
				     // data.


  // UPSIZING VARIABLES
  wire [SP_SW-1:0] size_mp_ben; // Byte enable from size mp. Sized
                                // for SP to allow shifting.

  wire [SP_SW-1:0] size_mp_ben_spw; // Byte enable from size mp expanded
                                    // out to sp strobe width size.

  wire [SP_DW-1:0] dpack_wd; // Write data for data pack registers.
  wire [SP_SW-1:0] spack_ws; // Write strobes for strobe pack registers.

  reg [SP_DW-1:0] dpack_fixed_wd; // Write data for data pack 
                                  // registers. For fixed t/x's
				   
  reg [SP_SW-1:0] spack_fixed_ws; // Write strobes for strobe pack 
                                  // registers. For fixed t/x's.

  reg [BUS_SP_DW-1:0] bus_dpack_nxt; // Next and register variables for    
  reg [BUS_SP_DW-1:0] bus_dpack_r;   // data packing registers.

  reg [BUS_SP_SW-1:0] bus_spack_nxt; // Next and register variables for    
  reg [BUS_SP_SW-1:0] bus_spack_r;   // strobe packing registers.

  wire upsized_tx; // Asserted when current beat is from an upsized
                   // transactions.

  wire pack_reg_nxt_full; // Asserted when next beat from channel fifo
                          // to currently active packing register 
			  // will fill it.
			  
// Dummy wires - used to suppress unconnected ports warnings by Leda tool - BR - 2/24/2010
   wire ae_unconn, hf_unconn, af_unconn, error_unconn; 
   
  //--------------------------------------------------------------------
  // Signals used in synchronising issuing of upsized write t/x's
  // with upsized write data for configs with WID > 1.
  //--------------------------------------------------------------------
  
  // Bit for each write interleaving depth to tell us when the upsized
  // t/x currently being processed has started.
  reg [WID-1:0] bus_us_tx_started_r; 


  //--------------------------------------------------------------------
  // The Resize Information Fifo (RSIF) stores information about slave
  // port transactions from the resizer block in the write address
  // channel. We need this information here in order to rebuild the 
  // write beats into the new transaction that the X2X has issued.
  //
  // The following steps are done to generate input data for RSI fifo
  //
  // 1. Condition data from SP AW.
  // 2. Collect into single vector depending on required data.
  //--------------------------------------------------------------------


  // 1. Condition data from SP AW.
  //    - Align address with respect to the asize of the smaller
  //      data width side. This is only functionaly necessary for 
  //      upsizing configurations but we do in all cases for clarity
  //      and ease of debugging.
  always @(addr_i or asize_sp_i or asize_mp_i)
  begin : addr_aligned_PROC
    reg [`X2X_BSW-1:0] size;
    reg [ADDR_TRK_W-1:0] size_addr_mask;
    reg [ADDR_TRK_W-1:0] all_1s_aw;

    addr_aligned = {ADDR_TRK_W{1'b0}};

    // Align with respect to the asize of the smaller side.
    size = (MP_DW > SP_DW) ? asize_sp_i : asize_mp_i;

    // Align address by zeroing lsb's depending on size value.
    // Do this by ANDing the address with a mask generated from the 
    // size we want to align with. Mask will have 0's in bit positions 
    // that address within the size.
    all_1s_aw = {ADDR_TRK_W{1'b1}};
    size_addr_mask = (all_1s_aw << size);

    addr_aligned = addr_i & size_addr_mask;

  end // addr_aligned_PROC


  // 2. Collect into single vector depending on required data.
  //    - The data we put into the fifo changes depending on the
  //      configuration so here we will select what goes into the
  //      resize info. fifo.
  always @(addr_aligned  or 
           aid_i         or
	   alen_i        or
	   aburst_i      or
	   asize_sp_i    or
	   asize_mp_i   
)
  begin : rsi_fifo_di_PROC
    integer start_bit;
    integer sz_bit;
    integer len_bit;
    integer addr_bit;
    integer burst_bit;

    // Using start bit variable to track where next signals should
    // be concatenated to rsi_fifo_di.
    start_bit = 0;

    rsi_fifo_di = {RSI_FIFO_W{1'b0}};





    // asize_mp
    // Endian mapping, downsizing, or SP larger with upsizing.
    if(`X2X_HAS_ET
       || (MP_DW > SP_DW)
       || ((MP_DW < SP_DW) && HAS_TX_UPSIZE)
) 
    begin
      // leda FM_2_36 off
      // leda thinks asize_mp_i is read before being assigned but it is
      // an input to the module
      for(sz_bit=0 ; sz_bit<=(BS_W-1) ; sz_bit=sz_bit+1)
      begin
        rsi_fifo_di[start_bit+sz_bit] = asize_mp_i[sz_bit];
      end
      // leda FM_2_36 on
      start_bit = start_bit + BS_W;
    end

    // asize_sp
    // Any difference in MP and SP data widths.
    if(MP_DW != SP_DW) begin
      for(sz_bit=0 ; sz_bit<=(BS_W-1) ; sz_bit=sz_bit+1)
      begin
        rsi_fifo_di[start_bit+sz_bit] = asize_sp_i[sz_bit];
      end
      start_bit = start_bit + BS_W;
    end

    // alen
    // Any difference in data widths or len widths.
    if((MP_DW   != SP_DW)   || 
        (MP_BL_W != SP_BL_W)
) 
    begin
      for(len_bit=0 ; len_bit<=(SP_BL_W-1) ; len_bit=len_bit+1)
      begin
        rsi_fifo_di[start_bit+len_bit] = alen_i[len_bit];
      end
      start_bit = start_bit + SP_BL_W;
    end

    // addr
    // Any difference in data widths.
    if(MP_DW != SP_DW) begin
      for(addr_bit=0 ; addr_bit<=(ADDR_TRK_W-1) ; addr_bit=addr_bit+1)
      begin
        rsi_fifo_di[start_bit+addr_bit] = addr_aligned[addr_bit];
      end
      start_bit = start_bit + ADDR_TRK_W;
    end

    // aburst
    // Any difference in data widths.
    if(MP_DW != SP_DW) begin
      for(burst_bit=0 ; 
          burst_bit<=(BT_W-1) ; 
	  burst_bit=burst_bit+1
)
      begin
        rsi_fifo_di[start_bit+burst_bit] = aburst_i[burst_bit];
      end
      start_bit = start_bit + BT_W;
    end

  end // rsi_fifo_di_PROC


  //-------------------------------------------------------------------- 
  // Re Sizing Information (RSI) Fifo - Control Signals.
  //-------------------------------------------------------------------- 

  // Generate push to RSI fifo. Gate with full status to avoid overflow.
  assign rsi_fifo_push_n = rs_push_req_n_i | rsi_fifo_full;
  
  // Generate pop to RSI fifo. We pop whenever the incoming channel
  // ID matches with no active RSI slot but matches with the ID at 
  // the head of the RSIS fifo.
  assign rsi_fifo_pop_n = ~rsif_match;


  //-------------------------------------------------------------------- 
  // Re Sizing Information (RSI) Fifo.
  //-------------------------------------------------------------------- 
  // The depth of this fifo is the number of unique write ID's * the 
  // number of active transactions per unique ID. Because of the write
  // ordering rules (must start in address order) we can get away with
  // using 1 fifo here. In the SP B channel there will be a separate 
  // fifo for each unique ID, so this block will stall the SP AW channel
  // if either the unique ID or t/x per unique ID limits are reached.
  //-------------------------------------------------------------------- 
  x128_DW_axi_x2x_bcm65
  
  #(RSI_FIFO_W,      // Word width.
    RSINFO_FIFO_D,   // Word depth.  
    1,               // ae_level, don't care.
    1,               // af_level, don't care.
    0,               // err_mode, don't care.
    0,               // Reset mode, asynch. reset including memory.
    RSINFO_FIFO_D_L2 // Fifo address width.
  )
  U_SP_W_RSI_FIFO (
    .clk            (aclk_i),   
    .rst_n          (aresetn_i),
    .init_n         (1'b1), // Synchronous reset, not used.

    // Push side - Inputs
    .push_req_n     (rsi_fifo_push_n),
    .data_in        (rsi_fifo_di),   
    
    // Push side - Outputs
    .full           (rsi_fifo_full), 

    // Pop side - Inputs
    .pop_req_n      (rsi_fifo_pop_n),   
    
    // Pop side - Outputs
    .data_out       (rsi_fifo_do),
    .empty          (rsi_fifo_empty),

    // Unconnected or tied off.
    .diag_n         (1'b1), // Never using diagnostic mode.
    .almost_empty   (ae_unconn),
    .half_full      (hf_unconn),
    .almost_full    (af_unconn),
    .error          (error_unconn)
  );


  //--------------------------------------------------------------------
  // Extract individual signals from resize fifo data out.
  //--------------------------------------------------------------------
  always @(rsi_fifo_do)
  begin : rsi_fifo_do_PROC
    integer start_bit;
    integer sz_bit;
    integer len_bit;
    integer addr_bit;
    integer burst_bit;

    // Using start bit variable to track where next signals should
    // be from in rsi_fifo_do.
    start_bit = 0;
    rsif_aburst = 0;

    {rsif_aid, rsif_asize_mp, rsif_alen, rsif_asize_sp, rsif_addr}
      = {RSI_FIFO_W{1'b0}};

    // aid

    rsif_aid = {MP_ID_W{1'b0}};


    // asize_mp
    // Endian mapping or SP larger with upsizing.
    if(`X2X_HAS_ET
       || (MP_DW > SP_DW)
       || ((MP_DW < SP_DW) && HAS_TX_UPSIZE)
) 
    begin
      for(sz_bit=0 ; sz_bit<=(BS_W-1) ; sz_bit=sz_bit+1)
      begin
        rsif_asize_mp[sz_bit] = rsi_fifo_do[start_bit+sz_bit];
      end
      start_bit = start_bit + BS_W;
    end

    // asize_sp
    // Any difference in MP and SP data widths.
    if(MP_DW != SP_DW) begin
      for(sz_bit=0 ; sz_bit<=(BS_W-1) ; sz_bit=sz_bit+1)
      begin
        rsif_asize_sp[sz_bit] = rsi_fifo_do[start_bit+sz_bit];
      end
      start_bit = start_bit + BS_W;
    end

    // alen
    // Any difference in data widths or len widths.
    if((MP_DW   != SP_DW)   || 
        (MP_BL_W != SP_BL_W)
) 
    begin
      for(len_bit=0 ; len_bit<=(SP_BL_W-1) ; len_bit=len_bit+1)
      begin
        rsif_alen[len_bit] = rsi_fifo_do[start_bit+len_bit];
      end
      start_bit = start_bit + SP_BL_W;
    end

    // addr
    // Any difference in data widths.
    if(MP_DW != SP_DW) begin
      for(addr_bit=0 ; addr_bit<=(ADDR_TRK_W-1) ; addr_bit=addr_bit+1)
      begin
        rsif_addr[addr_bit] = rsi_fifo_do[start_bit+addr_bit];
      end
      start_bit = start_bit + ADDR_TRK_W;
    end

    // aburst
    // Any difference in data widths.
    if(MP_DW != SP_DW) begin
      for(burst_bit=0 ; 
          burst_bit<=(BT_W-1) ; 
	  burst_bit=burst_bit+1
)
      begin
	rsif_aburst[burst_bit] = rsi_fifo_do[start_bit+burst_bit];
      end
      start_bit = start_bit + BT_W;
    end

  end // rsi_fifo_do_PROC
  
  
  // Calculate the number of bytes in rsif_asize_mp.		    
  always @(rsif_asize_mp)
  begin : rsif_asize_mp_bytes_PROC
    case (rsif_asize_mp)
      3'b000  : rsif_asize_mp_bytes = 1;
      3'b001  : rsif_asize_mp_bytes = 2;
      3'b010  : rsif_asize_mp_bytes = 4;
      3'b011  : rsif_asize_mp_bytes = 8;
      3'b100  : rsif_asize_mp_bytes = 16;
      3'b101  : rsif_asize_mp_bytes = 32;
      3'b110  : rsif_asize_mp_bytes = 64;
      default : rsif_asize_mp_bytes = 64;
    endcase
  end // rsif_asize_mp_bytes_PROC


  //    - Generate beats_per_pop,
  //      For all except the first beat from the mp, the number of sp
  //      write data beats we generate for every beat from the mp 
  //      (pop from from channel fifo) is mp size bytes/max sp size 
  //      bytes. To cut down on logic size we use shifting to perform 
  //      the division, taking that /X => >> log base 2(X) and that 
  //      there will always be a power of 2 relationship between the
  //      t/x sizes on MP and SP, and that MAX_SP_ASIZE is log base 2
  //      of SP_DW, we can right shift the number of bytes represented
  //      by rsif_asize_mp by MAX_SP_ASIZE to get our answer.
  //      Applies for downsizing only.
  //VCS coverage off
  assign rsif_bpp = (rsif_asize_mp > MAX_SP_ASIZE)
                    ? (rsif_asize_mp_bytes >> MAX_SP_ASIZE)
	            : 1'b1;
  //VCS coverage on

  //--------------------------------------------------------------------
  // Calculate beats per pop for the first beat of the t/x from the MP. 
  // Address alignment may mean there are less SP beats from the first 
  // MP beat than the (mp_size/sp_size) value that applies to other 
  // beats. The bits of the address from asize_mp down to log base 2 SP
  // byte width (strobe width) tell us how many SP width beats will be 
  // missed due to unalignment.
  //--------------------------------------------------------------------
  assign rsif_fb_bpp = {BEATS_PER_POP_W{1'b0}};


  //--------------------------------------------------------------------
  // Resize Information Slot Control Signals
  //
  // 1. rsis_newtx
  //    This signal is used to load details for a new slave port 
  //    transaction into one of the RSI slots. Has 1 bit for every RSI
  //    slot.
  //
  // 2. rsis_update
  //    This signals is used to instruct an RSI slot to update its 
  //    transaction information while the transaction is in progress.
  //    Has 1 bit for every RSI slot.
  //--------------------------------------------------------------------
  
  // 1. rsis_newtx
  //    When the channel ID matched with no active RSI slot ID and 
  //    matched with the ID at the head of the RSI fifo, we find
  //    the lowest numbered inactive RSI slot to load the resizing
  //    information for the t/x into from the RSI fifo.
  always @(bus_rsis_active_r or 
           rsif_match        or
	   sp_wlast          or
	   ready_i
)
  begin : rsis_newtx_PROC
    reg found;

    integer  slot_num;

    rsis_newtx = {WID{1'b0}};
    found      = 1'b0;

    for(slot_num=0 ; slot_num<=(WID-1) ; slot_num=slot_num+1) begin
    
      // Assert bit for this rsis slot if the slot is inactive
      // , if no previous id slots were inactive and if the 
      // incoming channel ID matched with the ID at the head of the
      // RSI fifo.
      if(~bus_rsis_active_r[slot_num] & !found & rsif_match
	 // Do not load into RSI slot if the write data part of
	 // the t/x has completed already.
         & ~(sp_wlast & ready_i)
)
      begin
        rsis_newtx[slot_num] = 1'b1;
	// Use found variable to only match to least significant
	// numbered id slot.
	found = 1'b1;
      end

    end // for(slot_num=0

  end // rsis_newtx_PROC


  // 2. rsis_update_sp/mp
  //    Signals to update RSI slots on acceptance of a beat from
  //    the MP or acceptance of a beat from the SP.
  assign rsis_update_mp = rsis_match & {WID{beat_acc_mp}};
  assign rsis_update_sp = rsis_match & {WID{beat_acc_sp}};


  //--------------------------------------------------------------------
  // Resize Information Slots (1 for each write interleaving depth).
  //
  // Each slot contains (depending on configuration) :
  // 1. active
  // 2. aid
  // 3. alen
  // 4. aburst
  // 5. asize_sp
  // 6. asize_mp
  // 7. addr (up to 6 lsb's)
  // 8. beats per pop
  //--------------------------------------------------------------------

  // 1. active
  //    Bit for each RSI slot, asserted when t/x in slot is active.

  // leda S_7R_D off
  // leda does not like reg declarations inside sequential blocks
  // however, it is legal to use local reg's as long as the reg is not used
  // outside the always block. In this case it isn't
  always @(posedge aclk_i or negedge aresetn_i)
    begin : bus_rsis_active_PROC
      integer slot_num;
      integer len_bit;
      reg [SP_BL_W-1:0] alen;

      if(!aresetn_i) begin
        bus_rsis_active_r <= {WID{1'b0}};
      end else begin

        for(slot_num=0 ; slot_num<=(WID-1) ; slot_num=slot_num+1) begin

	       // Extract alen for this slot.
          for(len_bit=0 ; len_bit<=(SP_BL_W-1) ; len_bit=len_bit+1) 
	         begin
	           alen[len_bit] = bus_rsis_alen_r[(slot_num*SP_BL_W)+len_bit];
	         end

	       // If this is the active slot and a beat is accepted on the SP
	       // and the beat is the last beat of the t/x ,then the t/x in the
	       // slot is finished and the slot is inactive.
	       if(rsis_update_sp[slot_num] & sp_wlast) 
	         begin
	           bus_rsis_active_r[slot_num] <= 1'b0;

	           // New t/x for this slot, assert active bit. 
	         end else if (rsis_newtx[slot_num]) begin
	           bus_rsis_active_r[slot_num] <= 1'b1;
	         end

        end // for(slot_num=0
      end // if(!aresetn_i)
    end // bus_rsis_active_PROC
  // leda S_7R_D on

  // 2. aid
  //    ID for each re size info. slot.
  always @(posedge aclk_i or negedge aresetn_i)
    begin : bus_rsis_aid_r_PROC
      integer slot_num;
      integer id_bit;

      if(!aresetn_i) begin
        bus_rsis_aid_r <= {BUS_MP_ID_W{1'b0}};
      end else begin
        for(slot_num=0 ; slot_num<=(WID-1) ; slot_num=slot_num+1) begin

	       // New t/x for this slot, load from RSI fifo.
	       if(rsis_newtx[slot_num]) begin
            for(id_bit=0 ; id_bit<=(MP_ID_W-1) ; id_bit=id_bit+1) begin
	           bus_rsis_aid_r[(slot_num*MP_ID_W)+id_bit]
	             <= rsif_aid[id_bit];
	         end
	       end

        end // for(slot_num=0 

      end // if(!aresetn_i)

    end // bus_rsis_aid_r_PROC


  // 3. alen
  //    Length of resized t/x generated by resizer in the 
  //    SP AW block.
  always @(posedge aclk_i or negedge aresetn_i)
    begin : bus_rsis_alen_r_PROC
      integer slot_num;
      integer len_bit;

      if(!aresetn_i) begin
        bus_rsis_alen_r <= {BUS_SP_BL_W{1'b0}};
      end else begin
        for(slot_num=0 ; slot_num<=(WID-1) ; slot_num=slot_num+1) begin

	       // New t/x for this slot, load from RSI fifo.
	       if(rsis_newtx[slot_num]) begin
            for(len_bit=0 ; 
	             len_bit<=(SP_BL_W-1) ; 
	             len_bit=len_bit+1
) 
	           begin
	             // If beat is accepted in same cycle as being loaded
	             // into an RSIS slot then use the update value which has
	             // changed to take into account the accepted beat.
	             bus_rsis_alen_r[(slot_num*SP_BL_W)+len_bit] 
	               <= beat_acc_sp
	                  ? update_alen[len_bit]
	               : rsif_alen[len_bit];
	           end
	       end

	       // Update remaining length for this t/x. Transfer generation 
	       // logic decrements the length value as it issues beats for the 
	       // transaction. A bit of rsis_update_sp is asserted whenever a 
	       // beat for the t/x in the corresponding slot is accepted at the
	       // SP , so we save the updated length into the currently active
	       // slot.
	       if(rsis_update_sp[slot_num]) begin
            for(len_bit=0 ; 
	             len_bit<=(SP_BL_W-1) ; 
	             len_bit=len_bit+1
) 
	           begin
                // leda W396 off
                // leda thinks this reg isn't reset
                // I think teh carrige return is throwing it
	             bus_rsis_alen_r[(slot_num*SP_BL_W)+len_bit] 
	               <= update_alen[len_bit];
                //leda W396 on
	           end
	       end

        end // for(slot_num=0 

      end // if(!aresetn_i)

    end // bus_rsis_alen_r_PROC


  // 4. aburst
  //    Burst type of t/x generated by resizer in SP AW block.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : bus_rsis_aburst_r_PROC
    integer slot_num;
    integer burst_bit;

    if(!aresetn_i) begin
      bus_rsis_aburst_r <= {BUS_BT_W{1'b0}};
    end else begin
      for(slot_num=0 ; slot_num<=(WID-1) ; slot_num=slot_num+1) begin

	// New t/x for this slot, load from RSI fifo.
	if(rsis_newtx[slot_num]) begin
          for(burst_bit=0 ; burst_bit<=(BT_W-1) ; burst_bit=burst_bit+1) begin
	    bus_rsis_aburst_r[(slot_num*BT_W)+burst_bit] 
	      <= rsif_aburst[burst_bit];
	  end
	end

      end // for(slot_num=0 

    end // if(!aresetn_i)
  end // bus_rsis_aburst_r_PROC


  // 5. asize_sp
  //    Size of t/x generated by resizer in SP AW block.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : bus_rsis_asize_sp_r_PROC
    integer slot_num;
    integer size_bit;

    if(!aresetn_i) begin
      bus_rsis_asize_sp_r <= {BUS_BS_P1_W{1'b0}};
    end else begin
      for(slot_num=0 ; slot_num<=(WID-1) ; slot_num=slot_num+1) begin

	// New t/x for this slot, load from RSI fifo.
	if(rsis_newtx[slot_num]) begin
          for(size_bit=0 ; size_bit<=(BS_W-1) ; size_bit=size_bit+1) begin
	    bus_rsis_asize_sp_r[(slot_num*BS_W)+size_bit] 
	      <= rsif_asize_sp[size_bit];
	  end
	end

      end // for(slot_num=0 

    end // if(!aresetn_i)
  end // bus_rsis_asize_sp_r_PROC


  // 6. asize_mp
  //    Size of t/x received at X2X MP.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : bus_rsis_asize_mp_r_PROC
    integer slot_num;
    integer size_bit;

    if(!aresetn_i) begin
      bus_rsis_asize_mp_r <= {BUS_BS_W{1'b0}};
    end else begin
      for(slot_num=0 ; slot_num<=(WID-1) ; slot_num=slot_num+1) begin

	// New t/x for this slot, load from RSI fifo.
	if(rsis_newtx[slot_num]) begin
          for(size_bit=0 ; 
	      size_bit<=(BS_W-1) ; 
	      size_bit=size_bit+1
)
	  begin
	    bus_rsis_asize_mp_r[(slot_num*BS_W)+size_bit] 
	      <= rsif_asize_mp[size_bit];
	  end
	end

      end // for(slot_num=0 

    end // if(!aresetn_i)
  end // bus_rsis_asize_mp_r_PROC


  // 7. addr
  //    Lsb's of start address generated by resizer in SP AW block.
  //    leda W396 off
  //    leda incorrectly thinks that bus_rsis_addr_r doesn't have a reset
  always @(posedge aclk_i or negedge aresetn_i)
  begin : bus_rsis_addr_r_PROC
    integer slot_num;
    integer addr_bit;

    if(!aresetn_i) begin
      bus_rsis_addr_r <= {BUS_ADDR_TRK_W{1'b0}};
    end else begin
      for(slot_num=0 ; slot_num<=(WID-1) ; slot_num=slot_num+1) begin

	// New t/x for this slot, load from RSI fifo.
	if(rsis_newtx[slot_num]) begin
          for(addr_bit=0 ; 
	      addr_bit<=(ADDR_TRK_W-1) ;
	      addr_bit=addr_bit+1
) 
	  begin
	    // If beat is accepted in same cycle as being loaded
	    // into an RSIS slot then use the update value which has
	    // changed to take into account the accepted beat.
	    bus_rsis_addr_r[(slot_num*ADDR_TRK_W)+addr_bit] 
	      <= beat_acc_mp
	         ? update_addr_nxt[addr_bit]
	         : rsif_addr[addr_bit];
	  end
	end

	// Transfer generation logic updates the address as it 
	// proccesses beats for the transaction. Here we save the
	// updated address bits in the resize info. slot that 
	// corresponds with the t/x currently in operation.
	// Updated every time a beat from the MP is accepted.
	if(rsis_update_mp[slot_num]) begin
          for(addr_bit=0 ; 
	      addr_bit<=(ADDR_TRK_W-1) ; 
	      addr_bit=addr_bit+1
) 
	  begin
	    bus_rsis_addr_r[(slot_num*ADDR_TRK_W)+addr_bit] 
	      <= update_addr_nxt[addr_bit];
	  end
	end

      end // for(slot_num=0 
    end // if(!aresetn_i)
  end // bus_rsis_addr_r_PROC
// leda W396 on

  //--------------------------------------------------------------------
  // Split payload from channel fifo up into constituent parts.
  //--------------------------------------------------------------------
  assign {
    mp_id, 
    mp_wdata, 
    mp_wstrb, 
    mp_wlast}
  = payload_i;


  //--------------------------------------------------------------------
  // Do endian mapping.
  // This block will optimise away endian mapping logic if no endian
  // transformation/mapping is required.
  //--------------------------------------------------------------------
  x128_DW_axi_x2x_et
   
  #(`X2X_HAS_ET, // Do endianness transformation or not.
    `X2X_MP_DW,  // Data width.
    `X2X_MP_SW,  // Strobe width.
    1            // 1 for write data channel, 0 for read data.
                 // Controls presence of strobe mapping logic.
  )
  U_sp_w_endian_transform (
    //inputs
    .data_in_i    (mp_wdata),
    .strobe_in_i  (mp_wstrb),
    .asize_i      (mux_asize_mp),
  
    //outputs
    .data_out_o   (et_mp_wdata),
    .strobe_out_o (et_mp_wstrb)
  );


  //--------------------------------------------------------------------
  // Find set of resizing information for the ID from the channel 
  // fifo.
  //--------------------------------------------------------------------
  always @(bus_rsis_aid_r    or
           bus_rsis_active_r or
	   pop_empty_i       or
	   mp_id 
)
  begin : rsis_match_PROC

    integer rsis_num;
    integer id_bit;

    reg [WID-1:0] local_match;

    reg [MP_ID_W-1:0] rsis_id;

    local_match = {WID{1'b0}};

    for(rsis_num=0 ; rsis_num<=(WID-1) ; rsis_num=rsis_num+1) begin

      // Extract ID from this slot into temporary variable.
      for(id_bit=0 ; id_bit<=(MP_ID_W-1) ; id_bit=id_bit+1) begin
        rsis_id[id_bit] = bus_rsis_aid_r[(MP_ID_W*rsis_num)+id_bit];
      end
     
      // If master port ID matches with slot ID and the slot is
      // active assert bit for this slot.
      if((rsis_id == mp_id) & bus_rsis_active_r[rsis_num]) begin
	local_match[rsis_num] = 1'b1;
      end

    end

    // For final value, if channel fifo is empty then do not assert
    // any match bits.
    rsis_match = (WID > 1) ? ({WID{~pop_empty_i}} & local_match)

                            // If WID == 1 then we don't care about the
			    // ID matching as the t/x's always have
			    // to be completed in address order.
			    // So just match if the only RSIS slot is
			    // active.
                            : (~pop_empty_i & bus_rsis_active_r[0]);

  end // rsis_match_PROC


  // If incoming channel ID has not matched with any RSI slot ID's,
  // and neither the channel fifo or RIS fifo are empty then we
  // can say the incoming ID matches with the fifo at the head
  // of the RSIF fifo. Don't need to worry about ID matching,
  // as the data must be in order with the t/x.
  assign rsif_match = (~|rsis_match 
                         & ~(pop_empty_i | rsi_fifo_empty)
);
                      


  // Assert if incoming channel ID has matched with any active 
  // resizing information slots (RSIS) or matched with the ID
  // at the head of the RSI fifo.
  assign match_active_id = (|rsis_match) | rsif_match;


  //--------------------------------------------------------------------
  // RESIZE INFO. MUXES
  //
  // Note resizing information can come from resizing info. slots
  // (RSIS) or the resizing info. fifo (RSIF). RSIF signals are 
  // appended into the mux inputs at the MSB positions.
  //--------------------------------------------------------------------
  
  // alen mux.
  x128_DW_axi_x2x_busmux_ohsel
  
  #((WID+1), // Number of buses to mux between.
    SP_BL_W  // Width of each bus input to the mux.
  ) 
  U_rsis_alen_busmux (
    .sel   ({rsif_match, rsis_match}),
    .din   ({rsif_alen, bus_rsis_alen_r}),
    .dout  (mux_alen)
  );
  

  // aburst mux.
  x128_DW_axi_x2x_busmux_ohsel
  
  #((WID+1), // Number of buses to mux between.
    BT_W  // Width of each bus input to the mux.
  ) 
  U_rsis_aburst_busmux (
    .sel   ({rsif_match, rsis_match}),
    .din   ({rsif_aburst, bus_rsis_aburst_r}),
    .dout  (mux_aburst)
  );
  

  // asize_sp mux.
  x128_DW_axi_x2x_busmux_ohsel
  
  #((WID+1), // Number of buses to mux between.
    BS_W     // Width of each bus input to the mux.
  ) 
  U_rsis_asize_sp_busmux (
    .sel   ({rsif_match, rsis_match}),
    .din   ({rsif_asize_sp, bus_rsis_asize_sp_r}),
    .dout  (mux_asize_sp)
  );
  

  // asize_mp mux.
  x128_DW_axi_x2x_busmux_ohsel
  
  #((WID+1), // Number of buses to mux between.
    BS_W     // Width of each bus input to the mux.
   ) 
  U_rsis_asize_mp_busmux (
    .sel   ({rsif_match, rsis_match}),
    .din   ({rsif_asize_mp, bus_rsis_asize_mp_r}),
    .dout  (mux_asize_mp)
  );


  // addr mux.
  x128_DW_axi_x2x_busmux_ohsel
  
  #((WID+1),    // Number of buses to mux between.
    ADDR_TRK_W  // Width of each bus input to the mux.
   ) 
  U_rsis_addr_busmux (
    .sel   ({rsif_match, rsis_match}),
    .din   ({rsif_addr, bus_rsis_addr_r}),
    .dout  (mux_addr)
  );


  //--------------------------------------------------------------------
  // Signals derived from mux_* signals.
  //--------------------------------------------------------------------


  // Calculate the number of bytes in mux_asize_mp.		    
  always @(mux_asize_sp)
  begin : mux_asize_sp_bytes_PROC
    case (mux_asize_sp)
      3'b000  : mux_asize_sp_bytes = 1;
      3'b001  : mux_asize_sp_bytes = 2;
      3'b010  : mux_asize_sp_bytes = 4;
      3'b011  : mux_asize_sp_bytes = 8;
      3'b100  : mux_asize_sp_bytes = 16;
      3'b101  : mux_asize_sp_bytes = 32;
      3'b110  : mux_asize_sp_bytes = 64;
      default : mux_asize_sp_bytes = 64;
    endcase
  end // mux_asize_sp_bytes_PROC


  // Calculate the number of bytes in mux_asize_mp.		    
  always @(mux_asize_mp)
  begin : mux_asize_mp_bytes_PROC
    case (mux_asize_mp)
      3'b000  : mux_asize_mp_bytes = 1;
      3'b001  : mux_asize_mp_bytes = 2;
      3'b010  : mux_asize_mp_bytes = 4;
      3'b011  : mux_asize_mp_bytes = 8;
      3'b100  : mux_asize_mp_bytes = 16;
      3'b101  : mux_asize_mp_bytes = 32;
      3'b110  : mux_asize_mp_bytes = 64;
      default : mux_asize_mp_bytes = 64;
    endcase
  end // mux_asize_mp_bytes_PROC


  // Beats per pop value derived from RSIS mux_* values.
  // Used for FIXED bursts where we have to return to the first beat,
  // beats per pop value after every MP beat.
  // Only used for configs with MP_DW > SP_DW.

  //VCS coverage off
  assign rsis_bpp = (mux_asize_mp > MAX_SP_ASIZE)
                    ? (mux_asize_mp_bytes >> MAX_SP_ASIZE)
		    : 1'b1;
  //VCS coverage on


  assign rsis_fb_bpp = {BEATS_PER_POP_W{1'b0}};
  

  // Gen current beats per pop (BPP).
  assign mux_bpp = rsif_match 

                   // For the first beat of an SP t/x (first beat will
		   // match with RSI fifo) always select first beat
		   // beats per pop value derived from RSIF values.
                   ? rsif_fb_bpp 

		   : (mux_aburst == `X2X_BT_FIXED)
		     // If this is not the first beat of an SP 
		     // transaction then we select the first beat bpp
		     // value for FIXED t/x types as the same byte 
		     // lanes will be active for each beat.
		     ?  rsis_fb_bpp

		     // For a non FIXED t/x type take the bpp value 
		     // derived from the RSIS mux_* values.
		     :  rsis_bpp;


  //--------------------------------------------------------------------
  // BEAT GENERATION LOGIC
  //--------------------------------------------------------------------
  
  // Assert whenever a beat from channel fifo has been accepted.
  assign beat_acc_mp = ~pop_req_n_o;

  // Assert whenever a beat is accepted from SP.    
  assign beat_acc_sp = valid_o & ready_i;


  //--------------------------------------------------------------------
  // TRACK ADDRESS - During MP beat.
  //--------------------------------------------------------------------
  // Increment address by size_sp_bytes to keep track of active byte
  // lanes for each beat. Stored in the currently active RSI slot
  // whenever rsis_update is asserted.
  // Upper bits of mux_addr will tell us where to take next chunk
  // of sp_wdata from, in the mp_wdata bus.
  // While using multiple SP beats to send a single MP beat the address
  // will come from update_addr_r, and when that beat is finished we
  // will reload from the active RSIS address. The RSIS address is 
  // updated after every completed MP beat.
  always @(*)
  begin : update_addr_nxt_PROC
    reg [ADDR_TRK_W-1:0] addr;
    reg                  beat_acc;
    reg [LOG2_MAX_SW:0]  asize_bytes;

    update_addr_nxt = {ADDR_TRK_W{1'b0}};

    // Select mux_addr from RSIF or RSIS when we are waiting for
    // another MP beat to operate on.
    // NOTE : update_bpp_r is only relevant if X2X_MP_DW > X2X_SP_DW.
    if(((update_bpp_r == {BEATS_PER_POP_W{1'b0}}) || (MP_DW <= SP_DW)) 
        & match_active_id
)
    begin
      addr = mux_addr;
    end else begin
      addr = update_addr_r;
    end

    // beat_acc controls when we update update_addr_r. 
    // For configs where MP_DW > SP_DW, we can issue multiple SP beats
    // for every MP beat, so we update on every accepted SP beat.
    // For configs where MP_DW < SP_DW and upsizing is enabled, we could
    // accept multiple MP beats before we issue a single SP beat, so
    // we update on every accepted MP beat.
    // In other cases beat_acc_mp and beat_acc_sp are identical so we 
    // default to beat_acc_sp.
    beat_acc = ((MP_DW < SP_DW) && HAS_TX_UPSIZE) 
               ? beat_acc_mp 
	       : beat_acc_sp;

    // Select which asize bytes value to add to update_addr_r, 
    // depending on whether we are updating from MP beats or SP beats.
    // See selecting of beat_acc.
    asize_bytes = ((MP_DW < SP_DW) && HAS_TX_UPSIZE) 
                  ? mux_asize_mp_bytes
	          : mux_asize_sp_bytes;

    casex({beat_acc, mux_aburst})
    
      {1'b1, `X2X_BT_FIXED} : begin

	//VCS coverage off
	if(mux_asize_mp > MAX_SP_ASIZE) begin
	  // If we get a FIXED burst from the MP with a SIZE greater
	  // than the max SP SIZE. We have to use multiple SP beats to
	  // send the single SP beat but we have to be careful not to
	  // keep incrementing the address. When we have sent the
	  // MP SIZE we have to wrap back to the start of the FIXED 
	  // address for the next MP beat.
	  if(update_bpp_nxt != {BEATS_PER_POP_W{1'b0}}) begin
	    // Haven't sent the full MP SIZE yet so keep incrementing.
	    update_addr_nxt = addr + asize_bytes;
	  end else begin
	    // We have sent the full MP size so wrap back to the
	    // start address.
	    update_addr_nxt = mux_addr;
	  end
	//VCS coverage on
	end else begin
	  // Turn off coverage here for non upsizing configs.
	  //VCS coverage off
	  // MP ASIZE is <= MAX_SP_ASIZE.
	  if(upsized_tx) begin
	    // For an upsized fixed t/x we increment the address until
	    // the pack register is full, then we reset to the start
	    // address for the next beat.
	    update_addr_nxt 
	    = pack_reg_nxt_full 
	      // Because an upsized fixed t/x has to meet the upsizing
	      // rules, we know we can set the start address as
	      // all 0's. This logic has to take responsibility for 
	      // setting bus_rsis_addr back to the start address for the 
	      // burst as the value in bus_rsis_addr will have been
	      // incremented by 1 beat as we accepted the beat from
	      // the master port. Unalignment w.r.t. asize_mp is 
	      // transparent to the write data channel anyway so we
	      // can use all 0's.
	      ? {ADDR_TRK_W{1'b0}} 
	      : (addr + asize_bytes);
	  end else begin
	  //VCS coverage on
	    // Non upsized fixed t/x, address stays static throughout
	    // the t/x.
	    update_addr_nxt = addr;
	  end
	end 

      end // `X2X_BT_FIXED

      {1'b1, `X2X_BT_INCR} : begin
        update_addr_nxt = addr + asize_bytes;
      end // `X2X_BT_INCR

      default : begin
	// No beat accepted, do not update address.
        update_addr_nxt = addr;
      end

    endcase

  end // update_addr_nxt_PROC

  
  // Register process, loaded from update_addr_nxt.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : update_addr_r_PROC
    if(!aresetn_i) begin
      update_addr_r <= {ADDR_TRK_W{1'b0}};
    end else begin
      update_addr_r <= update_addr_nxt;
    end
  end // update_addr_r_PROC


  // Address of the current beat. Select from mux_addr (from the RSI
  // slots or RSI fifo) or the update_addr_r register.
  // Update_addr_r contains the address of the current beat as we work
  // through a beat from the MP (could be multiple SP beats) and we
  // select mux_addr for the first cycle of a new beat from the MP.
  //VCS coverage off
  assign current_addr 
    = (update_bpp_r == {BEATS_PER_POP_W{1'b0}})
      ? mux_addr
      : update_addr_r;
  //VCS coverage on


  // Update length, subtract 1. Loaded into the currently active RSI
  // slot whenever rsis_update is asserted. 
  // Since alen=0 implies a single beat this value will wrap around
  // after the last beat, but this should not be a problem as we
  // have a seperate active bit for each RSI slot to tell us when
  // there are beats left for a t/x in the slot.
  assign update_alen = (mux_alen - 1'b1);


  //--------------------------------------------------------------------
  // Track beats per pop.
  //--------------------------------------------------------------------
  // Because of downsizing we could have to issue multiple beats
  // for a single pop from the write data channel fifo.
  // when it is 0 we will pop the write data channel fifo if it
  // is not empty.
  // Also, when this value is 0 we will load update_bpp_r from
  // mux_bpp (from the RSI slots).
  //--------------------------------------------------------------------
  always @(update_bpp_r    or
           mux_bpp         or
	   beat_acc_sp     or
	   match_active_id 
) 
  begin : update_bpp_nxt_PROC
    update_bpp_nxt = {BEATS_PER_POP_W{1'b0}};

    // Remove logic if SP DW is larger.
  end // update_bpp_nxt_PROC


  // Register process, loaded from update_bpp_nxt.
  always @(posedge aclk_i or negedge aresetn_i)
  begin : update_bpp_r_PROC
    if(!aresetn_i) begin
      update_bpp_r <= {BEATS_PER_POP_W{1'b0}};
    end else begin
      update_bpp_r <= update_bpp_nxt;
    end
  end // update_bpp_r_PROC


  //--------------------------------------------------------------------
  // Generate pop to write data channel fifo.
  //--------------------------------------------------------------------
  always @(pop_empty_i       or
           update_bpp_nxt    or
	   beat_acc_sp       or
	   upsized_tx        or
	   pack_reg_nxt_full or
	   valid_o           or
	   ready_i           or
	   match_active_id
)
  begin : pop_req_n_o_PROC
    pop_req_n_o = 1'b1;

    // Only pop if the fifo is not empty.
    if(~pop_empty_i) begin

      // For downsized configs, beats per pop next must be 0 when
      // the SP beat is accepted before we can pop the channel fifo.
      // Because we can have multiple SP beats from a single MP beat.
      if(MP_DW > SP_DW) begin
	pop_req_n_o 
	  = ~(beat_acc_sp 
	      & (update_bpp_nxt == {BEATS_PER_POP_W{1'b0}})
);

      // For all other configs we can pop whenever an MP beat is
      // accepted. In other configs (i.e. upsizing) we can have
      // multiple MP beats for a single SP beat.
      end else begin


	pop_req_n_o = 
          (HAS_TX_UPSIZE & upsized_tx)
          // For upsizing configurations, beats from upsized
          // transactions will be accepted into packing
          // registers until the packing register is full.
          // So here, unless the packing register is full
          // we can accept the upsized beat immediately
          // - once it matches with an RSI slot ID - when
          // it is full we will issue to the external slave
          // so we must wait for ready before asserting.
          ? ~(pack_reg_nxt_full
                ? valid_o & ready_i 
	        : match_active_id
)
	  // MP_DW <= SP_DW and no upsizing. Pop whenever a
	  // beat is accepted from the SP.
          : ~(valid_o & ready_i);


      end

    end // if(~pop_empty_i

  end // pop_req_n_o_PROC


  // Drive these values to 0 for configs where functionality is
  // not required.
  assign upsized_tx = 1'b0;
  assign pack_reg_nxt_full = 1'b0;
  assign us_issue_req_o = 1'b0;


  //--------------------------------------------------------------------
  // DATA AND STROBE MUXES.
  //--------------------------------------------------------------------
  
  



  assign sp_wdata = et_mp_wdata;
  assign sp_wstrb = et_mp_wstrb;


  //--------------------------------------------------------------------
  // OUTPUT STAGE
  //
  // Drive remaining channel output signals.
  //--------------------------------------------------------------------

  // Decode valid out.
  always @(*)
  begin : valid_o_PROC

    reg us_valid;

    valid_o = 1'b0;
    us_valid = 1'b0;

    // If no t/x altering or endianness mapping is taking place we
    // can drive valid_o directly from the channel fifos pop empty
    // signal.
    if((`X2X_TX_ALTER == `X2X_TX_NO_ALTER)
       && (`X2X_HAS_ET == 0)
)
    begin 
      valid_o = ~pop_empty_i;

    // If the beat is from an upsized t/x, the data beats have to
    // be packed before we issue a beat from the X2X SP. So only
    // assert valid if the next mp beat will fill the pack reg and
    // we have an ID match.
    end else if(upsized_tx) begin


      // Assert when we have valid data for an upsized t/x.
      us_valid = pack_reg_nxt_full & match_active_id;

      // Here we control valid for an upsized transaction to take 
      // account of the necessary synchronisation with the write 
      // address channel for configs with X2X_WID > 1.

      //leda FM_2_36 off
      //blocking assignments mean us_valid is assigned before it is read
      valid_o = (WID>1) 
                  // If this is the first beat of data for the upsized
		  // write, then do no assert until the write address
		  // channel has signalled it can forward the upsized
		  // write t/x by deasserting us_xact_issue_off_i.
                ? (~|(rsis_match & bus_us_tx_started_r) 
		    ? (~us_xact_issue_off_i & us_valid)

		  // Otherwise assert valid as normal.
		    : us_valid
)
                : us_valid;
      //lead FM_2_36 on
      

    // This branch applies to all other configs where the beat
    // is not from an upsized t/x so can be issued immediately if
    // there is an ID match.
    end else begin
      valid_o = match_active_id;
    end
  end // valid_o_PROC



  // Drive sp_wlast.		  
  // If the X2X will not change the length of t/x's that pass through 
  // it then we can forward wlast directly from the channel fifo. 
  // Otherwise we will decode last from our internal length value 
  // being == 0.
  // Justifying with valid_o so it is not asserted by default.
  //
  // Turn coverage off for whole line. TX_ALTER==NO_ALTER will
  // never be hit for interesting configs and the other line
  // is safe from a coverage point of view.
  //VCS coverage off
  assign sp_wlast = (`X2X_TX_ALTER==`X2X_TX_NO_ALTER)
		    ? (valid_o ? mp_wlast : 1'b0)
		    : (valid_o ? (mux_alen == {SP_BL_W{1'b0}}) : 1'b0);
  //VCS coverage on


  // Build up payload out bus.
  // Drive outputs to 'b0 if valid is not being asserted to reduce 
  // unecessary switching on output ports.
  assign payload_o = 
    valid_o ? { 
               mp_id,
               sp_wdata,
               sp_wstrb,
               sp_wlast
	      }
	    : {SP_PYLD_W{1'b0}};


  // Connect RSI fifo full output.
  assign rs_fifo_full_o = rsi_fifo_full;

  // Connect write interleaving signals to the address channels.
  assign wrequest_o = (WID > 1) 
                        // Assert when the channel fifo is not empty
			// and the MP write id does not match with any
			// active ID.
                      ? (~match_active_id & ~pop_empty_i) 
		      : 1'b0;

  assign wid_o = mp_id;

endmodule
