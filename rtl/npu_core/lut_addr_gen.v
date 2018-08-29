module lut_addr_gen#(
	 parameter ADDR_WIDTH  = 4,
	 parameter DATA_WIDTH  = 8,
	 parameter EQ_WIDTH = 4,
	 parameter LUT_DEPTH = 256
)
(
	input  i_clk,
	input  i_rst_n,
	input  signed [DATA_WIDTH-1 : 0] i_round_dat,
	input  [EQ_WIDTH-1:0] i_shift_num,
	output [ADDR_WIDTH-1 : 0] o_act_lut_addr,
	output o_max_value_en,
	output o_min_value_en
);
parameter Max_Value=$signed(8'h08);
parameter Min_Value=$signed(8'hf8);
 reg  [ADDR_WIDTH-1 : 0] act_lut_addr;
 reg  [ADDR_WIDTH-1 : 0] act_lut_addr_s5;
 reg  [ADDR_WIDTH-1 : 0] act_lut_addr_s6;
 wire [DATA_WIDTH-2 : 0] shifted_data;
 reg  [ADDR_WIDTH-1 : 0] r_act_lut_addr;
 reg r_max_value_en;
 reg r_min_value_en; 

 assign shifted_data = i_round_dat[6:0] >> i_shift_num ;
 
 always @(*)
 begin
 	case({i_round_dat[7], shifted_data[2:0]})
 	4'b0000:  act_lut_addr = 4'd0;
 	4'b0001:  act_lut_addr = 4'd1;
 	4'b0010:  act_lut_addr = 4'd2;
 	4'b0011:  act_lut_addr = 4'd3;
 	4'b0100:  act_lut_addr = 4'd4;
 	4'b0101:  act_lut_addr = 4'd5;
 	4'b0110:  act_lut_addr = 4'd6;
 	4'b0111:  act_lut_addr = 4'd7;
 	4'b1111:  act_lut_addr = 4'd8;//-1
 	4'b1110:  act_lut_addr = 4'd9;//-2
 	4'b1101:  act_lut_addr = 4'd10;//-3
 	4'b1100:  act_lut_addr = 4'd11;//-4
 	4'b1011:  act_lut_addr = 4'd12;//-5
 	4'b1010:  act_lut_addr = 4'd13;//-6
 	4'b1001:  act_lut_addr = 4'd14;//-7
 	
 	default:act_lut_addr = 4'd0;
 	endcase
 	
 end
 
  always @(*)
 begin
 	case({i_round_dat[7], shifted_data[1:0]})
 	3'b000:  act_lut_addr_s5 = 4'd0;
 	3'b001:  act_lut_addr_s5 = 4'd1;
 	3'b010:  act_lut_addr_s5 = 4'd2;
 	3'b011:  act_lut_addr_s5 = 4'd3;
 	3'b111:  act_lut_addr_s5 = 4'd8;//-1
 	3'b110:  act_lut_addr_s5 = 4'd9;//-2
 	3'b101:  act_lut_addr_s5 = 4'd10;//-3
 	
 	default:act_lut_addr_s5 = 4'd0;
 	endcase
 	
 end
 
  always @(*)
 begin
 	case({i_round_dat[7], shifted_data[0]})
 	2'b00:  act_lut_addr_s6 = 4'd0;
 	2'b01:  act_lut_addr_s6 = 4'd1;
 	2'b11:  act_lut_addr_s6 = 4'd8;//-1
 	
 	default:act_lut_addr_s6 = 4'd0;
 	endcase
 	
 end
 
 always @(posedge i_clk, negedge i_rst_n)
 begin
 	if(!i_rst_n)
 	r_act_lut_addr <= 0;
 	else if(i_shift_num < 4'h4 || i_shift_num == 4'h4)
 	r_act_lut_addr <= act_lut_addr; 
 	else if(i_shift_num == 4'h5)	
 	r_act_lut_addr <= act_lut_addr_s5; 
 	else if(i_shift_num == 4'h6)
 	r_act_lut_addr <= act_lut_addr_s6;
 end
 
  always @(posedge i_clk, negedge i_rst_n)
 begin
 	if(!i_rst_n)
 	begin
 		r_max_value_en <= 0;
 		r_min_value_en<= 0;
 	end
 	else if(~i_round_dat[7] && |shifted_data[6:3])
 		r_max_value_en <= 1;
 	else if(i_round_dat[7] && ~|shifted_data[2:0])
 		r_min_value_en <= 1;
 	else begin
 		r_max_value_en <= 0;
 		r_min_value_en <= 0;
 	end
 	//r_act_lut_addr <= act_lut_addr; 	
 end
 
 assign  o_act_lut_addr = r_act_lut_addr;
 assign  o_max_value_en = r_max_value_en;
 assign  o_min_value_en = r_min_value_en;
endmodule