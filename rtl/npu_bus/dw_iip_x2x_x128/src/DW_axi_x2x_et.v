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
// endian transform
// If asize_i = 0, no transform needed.
// If ~X2X_HAS_ET, no transform needed.
// Otherwise, swap bytes according to Endian Definitions. 
// If WRITE_CH = 1, perform endian mapping on the strobe input also.
/////////////////////////////////////////////////////////////////////////

module x128_DW_axi_x2x_et (
 //inputs
  data_in_i,
  strobe_in_i,
  asize_i,
  
 //outputs
  data_out_o,
  strobe_out_o
);

  //parameters
  parameter HAS_ET = `X2X_HAS_ET; //0 - no transform, 1 - transform
  parameter DATA_W = `X2X_MP_DW;  // [8],16,32,64,128,256,512
  parameter STROBE_W = 1;         // 1,2,4,8,16,32,64
  parameter WRITE_CH = 0;         // 0 - Read data channel.
                                  // 1 - Write data channel.
  //internal
  parameter DATA_W_4 = DATA_W >> 4;
  parameter DATA_W_5 = DATA_W >> 5;
  parameter DATA_W_6 = DATA_W >> 6;
  parameter DATA_W_7 = DATA_W >> 7;
  parameter DATA_W_8 = DATA_W >> 8;
  parameter DATA_W_9 = DATA_W >> 9;

  //inputs
  input  [DATA_W-1:0]   data_in_i;   // input data
  input  [STROBE_W-1:0] strobe_in_i; // input strobes
  input  [2:0]          asize_i;     // data size
  
  //outputs
  output [DATA_W-1:0]   data_out_o;   // output data
  output [STROBE_W-1:0] strobe_out_o; // output strobes

  reg    [DATA_W-1:0]   data_out_o;

  wire [`X2X_MAX_SW-1:0] strobe_tmp_in;
  reg  [`X2X_MAX_SW-1:0] strobe_tmp_out;

  integer i, j, k;

  ////////////////////////////////////////////////////////////
  // 1. assign data_out_o to 0.
  // 2. if !HAS_ET | asize_i byte is 8, no endian transform
  // 3. do endian transform within asize_i according to
  //    endian format.
  //    Give an example here. if asize_i is 3'b010 (4-byte,
  //    32-bit) and data_w is 64-bit, we have 
  //    data_in_i[63:0] = data_in_i[7,6,5,4,3,2,1,0] in byte.
  //    So after endian transform, we have data_out_o =
  //    {data_in_i[4,5,6,7],data_in_i[0,1,2,3]}.
  ////////////////////////////////////////////////////////////
  always @(data_in_i or asize_i) begin
    data_out_o = {DATA_W{1'b0}};

    if ((!HAS_ET) || (asize_i == 3'b000))
      data_out_o = data_in_i;
    else begin
      case (asize_i)
        3'b001 : begin
          for (i=0; i<DATA_W_4; i=i+1) begin //sizes
            for (j=0; j<2; j=j+1) begin //bytes
              for (k=0; k<8; k=k+1) begin //bits
                 data_out_o[(i<<4)+((1-j)<<3)+k] = 
                 data_in_i[(i<<4)+(j<<3)+k];
              end
            end
          end
        end

        3'b010 : begin
          for (i=0; i<DATA_W_5; i=i+1) begin //sizes
            for (j=0; j<4; j=j+1) begin //bytes
              for (k=0; k<8; k=k+1) begin //bits
                 data_out_o[(i<<5)+((3-j)<<3)+k] = 
                 data_in_i[(i<<5)+(j<<3)+k];
              end
            end
          end
        end

        3'b011 : begin
          for (i=0; i<DATA_W_6; i=i+1) begin //sizes
            for (j=0; j<8; j=j+1) begin //bytes
              for (k=0; k<8; k=k+1) begin //bits
                 data_out_o[(i<<6)+((7-j)<<3)+k] = 
                 data_in_i[(i<<6)+(j<<3)+k];
              end
            end
          end
        end

        3'b100 : begin
          for (i=0; i<DATA_W_7; i=i+1) begin //sizes
            for (j=0; j<16; j=j+1) begin //bytes
              for (k=0; k<8; k=k+1) begin //bits
                 data_out_o[(i<<7)+((15-j)<<3)+k] = 
                 data_in_i[(i<<7)+(j<<3)+k];
              end
            end
          end
        end

        3'b101 : begin
          for (i=0; i<DATA_W_8; i=i+1) begin //sizes
            for (j=0; j<32; j=j+1) begin //bytes
              for (k=0; k<8; k=k+1) begin //bits
                 data_out_o[(i<<8)+((31-j)<<3)+k] = 
                 data_in_i[(i<<8)+(j<<3)+k];
              end
            end
          end
        end

        //default=3'b110
        default : begin
          for (i=0; i<DATA_W_9; i=i+1) begin //sizes
            for (j=0; j<64; j=j+1) begin //bytes
              for (k=0; k<8; k=k+1) begin //bits
                 data_out_o[(i<<9)+((63-j)<<3)+k] = 
                 data_in_i[(i<<9)+(j<<3)+k];
              end
            end
          end
        end
      endcase
    end
  end

  ///////////////////////////////////////////////////////
  // assign strobe_tmp to STROBE_W-bit strobe_in_i
  ///////////////////////////////////////////////////////
  assign strobe_tmp_in = {{(`X2X_MAX_SW-STROBE_W){1'b0}}, strobe_in_i};


  ///////////////////////////////////////////////////////
  // 1, assign strobe_tmp_out to 0.
  // 2, do endian transform within asize_i according to
  //    endian format on strobe input.
  ///////////////////////////////////////////////////////
  always @(strobe_tmp_in or asize_i) 
  begin : strobe_tmp_out_PROC

    integer asz_num;
    integer byte_num;

    strobe_tmp_out = {`X2X_MAX_SW{1'b0}};

    // No endian mapping required if endianness at SP and MP
    // are the same, data width is 8 bits, or asize_i is 8 bits.
    if ((!HAS_ET)
         || (DATA_W == 8)
)
    begin
      strobe_tmp_out = strobe_tmp_in;
    end else begin

      // Decode how many bytes in asize_i.
      case (asize_i)
        3'b000  : strobe_tmp_out = strobe_tmp_in;

	3'b001  : begin
	  // Cycle through chunks of size asize bytes.
	  for(asz_num=0 ; asz_num<(STROBE_W / 2) ; asz_num=asz_num+1)
	  begin
	    // Swap bytes within asize.
            for(byte_num=0 ; byte_num<2 ; byte_num=byte_num+1) begin
	      strobe_tmp_out[(asz_num*2)+byte_num]
	      = strobe_tmp_in[ (asz_num*2) +((2 -1)-byte_num)];
	    end
	  end
	end

	3'b010  : begin
	  // Cycle through chunks of size asize bytes.
	  for(asz_num=0 ; asz_num<(STROBE_W / 4) ; asz_num=asz_num+1)
	  begin
	    // Swap bytes within asize.
            for(byte_num=0 ; byte_num<4 ; byte_num=byte_num+1) begin
	      strobe_tmp_out[(asz_num*4)+byte_num]
	      = strobe_tmp_in[ (asz_num*4) +((4 -1)-byte_num)];
	    end
	  end
	end

	3'b011  : begin
	  // Cycle through chunks of size asize bytes.
	  for(asz_num=0 ; asz_num<(STROBE_W / 8) ; asz_num=asz_num+1)
	  begin
	    // Swap bytes within asize.
            for(byte_num=0 ; byte_num<8 ; byte_num=byte_num+1) begin
	      strobe_tmp_out[(asz_num*8)+byte_num]
	      = strobe_tmp_in[ (asz_num*8) +((8 -1)-byte_num)];
	    end
	  end
	end

	3'b100  : begin
	  // Cycle through chunks of size asize bytes.
	  for(asz_num=0 ; asz_num<(STROBE_W / 16) ; asz_num=asz_num+1)
	  begin
	    // Swap bytes within asize.
            for(byte_num=0 ; byte_num<16 ; byte_num=byte_num+1) begin
	      strobe_tmp_out[(asz_num*16)+byte_num]
	      = strobe_tmp_in[ (asz_num*16) +((16 -1)-byte_num)];
	    end
	  end
	end

	3'b101  : begin
	  // Cycle through chunks of size asize bytes.
	  for(asz_num=0 ; asz_num<(STROBE_W / 32) ; asz_num=asz_num+1)
	  begin
	    // Swap bytes within asize.
            for(byte_num=0 ; byte_num<32 ; byte_num=byte_num+1) begin
	      strobe_tmp_out[(asz_num*32)+byte_num]
	      = strobe_tmp_in[ (asz_num*32) +((32 -1)-byte_num)];
	    end
	  end
	end

	3'b110  : begin
	  // Cycle through chunks of size asize bytes.
	  for(asz_num=0 ; asz_num<(STROBE_W / 64) ; asz_num=asz_num+1)
	  begin
	    // Swap bytes within asize.
            for(byte_num=0 ; byte_num<64 ; byte_num=byte_num+1) begin
	      strobe_tmp_out[(asz_num*64)+byte_num]
	      = strobe_tmp_in[ (asz_num*64) +((64 -1)-byte_num)];
	    end
	  end
	end

	//Turning off coverage here as the default case cannot be hit.
	//VCS coverage off
	default : begin
	  // Cycle through chunks of size asize bytes.
	  for(asz_num=0 ; asz_num<(STROBE_W / 64) ; asz_num=asz_num+1)
	  begin
	    // Swap bytes within asize.
            for(byte_num=0 ; byte_num<64 ; byte_num=byte_num+1) begin
	      strobe_tmp_out[(asz_num*64)+byte_num]
	      = strobe_tmp_in[ (asz_num*64) +((64 -1)-byte_num)];
	    end
	  end
	end
	//VCS coverage on

      endcase

    end

  end // strobe_tmp_out_PROC


  ///////////////////////////////////////////////////////
  // assign strobe_tmp_out to DATA_W-bit strobe_out_o
  // Only assign if WRITE_CH parameter is set to 1.
  // We want to remove strobe mapping logic if this
  // block is not being used in a write data channel.
  ///////////////////////////////////////////////////////
  assign strobe_out_o = (WRITE_CH == 1)
                        ? strobe_tmp_out[STROBE_W-1:0]
			: {STROBE_W{1'b0}};

endmodule
