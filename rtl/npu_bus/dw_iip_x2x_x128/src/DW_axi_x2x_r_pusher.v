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
// Resize FIFO pushing control in R of SP
/////////////////////////////////////////////////////////////////////////

module x128_DW_axi_x2x_r_pusher (
  // Inputs 
  aclk,
  aresetn,
  aid_i,
  asize_i,
  asize_mp_i,
  aburst_i,
  addr_i,
  pre_last_xact_i,
  last_rs_xact_i,
  push_req_n_i,
  push_full_i,
  pop_empty_i,
  fifo_data_i,
  
  // Outputs 
  push_req_n_o,
  push_full_o,
  data_o
);

  //PARAMETERS.
  parameter ID_W       = `X2X_MP_IDW;      //ID width of SP
  parameter NUM_FIFOS  = `X2X_MAX_URIDA;   //number of FIFOs implemented
  parameter DATA_W     = 16;               //data width per FIFO
  parameter NOUS_SP_L  = 0;                // no upsize and sp DW larger
  parameter RS_FK_BP   = 0;                // fake bypass RS
  parameter A_TRK_W    = `X2X_ADDR_TRK_W;  //start addr width
  //internal parameters
  parameter BUS_DATA_W = NUM_FIFOS*DATA_W; //real width of data signal
  parameter URIDA_W    = `X2X_LOG2_MAX_URIDA; //URIDA width

  // Inputs
  input                  aclk;             //clk.
  input                  aresetn;          //reset.
  input [ID_W-1:0]       aid_i;           //ID from resize
  input [2:0]            asize_i;         //size from resize
  input [2:0]            asize_mp_i;      //MP asize for the xact
  input [1:0]            aburst_i;        //burst type
  input [A_TRK_W-1:0]    addr_i;          //start addr
  input                  pre_last_xact_i; //xact before last xact
  input                  last_rs_xact_i;  //last resize xact
  input                  push_req_n_i;    //resize push enable, act low
  input [NUM_FIFOS-1:0]  push_full_i;     //Bus of full status signals
  input [NUM_FIFOS-1:0]  pop_empty_i;     //Bus of full status signals
  input [BUS_DATA_W-1:0] fifo_data_i;     //data from FIFO to check ID

  // Outputs 
  output                 push_full_o;     //push full flag to resizer
  output [NUM_FIFOS-1:0] push_req_n_o;    //push enable to FIFOs
  output [DATA_W-1:0]    data_o;          //payload pushed to FIFOs
  

  wire [DATA_W-1:0]      data_o;
  wire                   push_full_o;
  wire [NUM_FIFOS-1:0]   push_req_n_o;
  reg                    push_full_match;
  reg                    push_full_free;
  reg  [NUM_FIFOS-1:0]   push_req_n_match;
  reg  [NUM_FIFOS-1:0]   push_req_n_free;
  reg  [ID_W-1:0]        fifo_id;       //get ID per FIFO
  reg                    match_id;
  reg                    free_id;
  reg  [ID_W-1:0]        fifo_id_s;     //get ID per FIFO
  reg  [ID_W-1:0]        fifo_id_r;     //reg fifo ID
  reg  [URIDA_W-1:0]     match_num;
  reg  [URIDA_W-1:0]     match_num_r;
  integer                i, j;


  ///////////////////////////////////////////////////////////////////////
  //concatenate data_o
  ///////////////////////////////////////////////////////////////////////
  assign data_o = RS_FK_BP ? {asize_mp_i, aid_i} :
                  (NOUS_SP_L ? {aburst_i, addr_i, last_rs_xact_i, 
                   asize_mp_i, aid_i} :
                  {aburst_i, addr_i, last_rs_xact_i, 
                   asize_mp_i, asize_i, aid_i});

  //reg fifo id for match_id to push the same aid info to the
  //fifo even if the fifo is empty during R xact
  always @(posedge aclk or negedge aresetn) begin
    if (!aresetn) begin
      fifo_id_r <= 0;
      match_num_r <= 0;
    end
    else begin
      if (match_id) begin
        fifo_id_r <= fifo_id_s;
        match_num_r <= match_num;
      end
    end
  end

  ///////////////////////////////////////////////////////////////////////
  //generate push_full_o to resizer and push_req_n_o to RS FIFO
  ///////////////////////////////////////////////////////////////////////
  always @(aid_i or push_full_i or pop_empty_i or fifo_data_i or
            push_req_n_i) begin
    push_full_match  = 1'b1;
    match_id         = 1'b0;
    push_req_n_match = {NUM_FIFOS{1'b1}};
    match_num = {URIDA_W{1'b0}};
    fifo_id_s = {ID_W{1'b0}};
    fifo_id = {ID_W{1'b0}};

    for (i=0; i<=(NUM_FIFOS-1); i=i+1) begin
      for (j=0; j<=(ID_W-1); j=j+1)
        fifo_id[j] = fifo_data_i[i*DATA_W+j];
 
      if ((fifo_id == aid_i) & !pop_empty_i[i] & !match_id) begin
        match_id  = 1'b1;
        fifo_id_s = fifo_id;
        match_num = i;

        if (!push_full_i[i]) begin
          push_full_match = 1'b0;

          if (!push_req_n_i)
            push_req_n_match[i] = 1'b0;
        end
      end
    end
  end

  //if fifo empty for current processing ID, need to push this ID info
  //to the same fifo for further R use.
  reg post_match_id;
  reg post_push_full_match;
  reg [NUM_FIFOS-1:0] post_push_req_n_match;
  always @(aid_i or push_full_i or pop_empty_i or fifo_id_r or 
            push_req_n_i or match_num_r or match_id) begin
    post_match_id = 1'b0;
    post_push_full_match = 1'b1;
    post_push_req_n_match = {NUM_FIFOS{1'b1}};

    for (i=0; i<=(NUM_FIFOS-1); i=i+1) begin
      if ((i == match_num_r) && (fifo_id_r == aid_i) && 
           pop_empty_i[i] & !match_id & !post_match_id) begin
        post_match_id = 1'b1;

        if (!push_full_i[i]) begin
          post_push_full_match = 1'b0;

          if (!push_req_n_i)
            post_push_req_n_match[i] = 1'b0;
        end
      end
    end
  end
  
  //if no match for ID and one fifo is free, take this fifo and
  //do push.
  always @(pop_empty_i or match_id or push_req_n_i) begin
    free_id         = 1'b0;
    push_full_free  = 1'b1;
    push_req_n_free = {NUM_FIFOS{1'b1}};

    if (!match_id) begin
      for (i=0; i<=(NUM_FIFOS-1); i=i+1) begin
        if (pop_empty_i[i] && !free_id) begin
          free_id        = 1'b1;
          push_full_free = 1'b0;

          if (!push_req_n_i)
            push_req_n_free[i] = 1'b0;
        end
      end
    end
  end

  //////////////////////////////////////////////////////
  // push_reg_n_o bus & push_full_o gen
  //////////////////////////////////////////////////////
  assign push_req_n_o = match_id ? push_req_n_match : 
                        (post_match_id ? post_push_req_n_match :
                        (free_id ? push_req_n_free : {NUM_FIFOS{1'b1}}));
  assign push_full_o  = match_id ? push_full_match : 
                        (post_match_id ? post_push_full_match :
                        (free_id ? push_full_free : 1'b1));

endmodule


