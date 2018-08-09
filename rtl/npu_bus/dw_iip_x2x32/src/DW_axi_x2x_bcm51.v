
////////////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2004 - 2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
// Filename    : DW_axi_x2x_bcm51.v
// Author      : Bruce Dean      April 20, 2004
// Description : DW_axi_x2x_bcm51.v Verilog module for DWbb
//
// DesignWare IP ID: 8cd3d19b
//
////////////////////////////////////////////////////////////////////////////////

module x32_DW_axi_x2x_bcm51 (
           clk,
           rst_n,
           init_n,
           enable,
           request,
           lock,
           mask,
           parked,
           locked,
           granted,
           grant,
           grant_index
    );
    
  parameter N                = 4; // RANGE 2 to 32
  parameter PARK_MODE        = 1; // RANGE 0 or 1
  parameter PARK_INDEX       = 0; // RANGE 0 to (N - 1)
  parameter OUTPUT_MODE      = 1; // RANGE 0 or 1
  parameter INDEX_WIDTH = 2;  // RANGE 1 to 5



  input				clk;	 // clock input
  input				rst_n;	 // active low asynchronous reset
  input				init_n;	 // active low synchronous reset
  input				enable;	 // active high enable
  input  [N-1: 0]		request; // client request bus
  input  [N-1: 0]		lock;	 // client lock bus
  input  [N-1: 0]		mask;	 // client mask bus

  output			parked;	 // arbiter parked status flag
  output			granted; // arbiter granted status flag
  output			locked;	 // arbeter locked status bus
  output [N-1: 0]		grant;	 // one-hot granted client bus
  output [INDEX_WIDTH-1: 0]	grant_index; //ndex of current granted client 


wire                     parked_mode;
wire [N-1 : 0]           grant_mode;
wire [INDEX_WIDTH-1 : 0] grant_index_mode;

reg  [INDEX_WIDTH-1 : 0] grant_index_int, grant_index_next;
reg  [N-1 : 0]           grant_next, grant_int;


reg            parked_next, parked_int;
reg            granted_next, granted_int;
reg            locked_next, locked_int;

wire [N-1 : 0] mreq;
   
  assign             mreq = request & ~mask;
  assign grant_index_mode = (PARK_MODE == 1) ? PARK_INDEX : {INDEX_WIDTH{1'b1}};
  assign       grant_mode = (PARK_MODE == 1) ? 1'b1 << PARK_INDEX : {N{1'b0}};
  assign      parked_mode = (PARK_MODE == 1) ? 1'b1:1'b0;

always @ (mreq or lock or grant_index_int or grant_int 
          or parked_int or granted_int or grant_index_mode 
          or grant_mode or parked_mode) begin : MASKED_REQ_COMBO_PROC
   integer   index;
   if(lock > 0 && lock == grant_int) begin
     locked_next      = 1'b1;
     grant_index_next = grant_index_int;
     grant_next       = grant_int;
     parked_next      = parked_int;
     granted_next     = granted_int;
   end else begin
      grant_index_next = grant_index_mode;
      grant_next       = grant_mode;
      parked_next      = parked_mode;
      granted_next     = 1'b0;
      locked_next      = 1'b0;
      for(index = 0; index < N; index = index +1) begin
        if (mreq[N - 1 - index] == 1'b1) begin
          grant_next       = 1'b1 << N - 1 - index;
          grant_index_next = N -1 - index;
          parked_next      = 1'b0;
          granted_next     = 1'b1;
        end
      end
   end
 end

  always @(posedge clk or negedge rst_n) begin : register
    if (rst_n == 1'b0) begin
      grant_index_int     <= {INDEX_WIDTH{1'b1}};
      parked_int          <= 1'b0;
      granted_int         <= 1'b0;
      locked_int          <= 1'b0;
      grant_int           <= 1'b0;
    end else if (init_n == 1'b0) begin
      grant_index_int     <= {INDEX_WIDTH{1'b1}};
      parked_int          <= 1'b0;
      granted_int         <= 1'b0;
      locked_int          <= 1'b0;
      grant_int           <= 1'b1;
    end else if(enable) begin
      grant_index_int     <= grant_index_next;
      parked_int          <= parked_next;
      granted_int         <= granted_next;
      locked_int          <= locked_next;
      grant_int           <= grant_next;
    end
  end


  assign grant       = (OUTPUT_MODE == 0) ? grant_next :
                        grant_int;

  assign grant_index = (OUTPUT_MODE == 0) ? grant_index_next :
                        grant_index_int;

  assign granted     = (OUTPUT_MODE == 0) ? granted_next : 
	                granted_int;
   
  assign parked      = (OUTPUT_MODE == 0) ? parked_next : 
	                parked_int;
  assign locked      = (OUTPUT_MODE == 0) ? locked_next : 
	                locked_int;



endmodule
