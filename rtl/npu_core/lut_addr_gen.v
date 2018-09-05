module lut_addr_gen#(
	 parameter ADDR_WIDTH  = 5,
	 parameter DATA_WIDTH  = 8,
	 parameter EQ_WIDTH = 4,
	 parameter LUT_DEPTH = 256
)
(
	input  i_clk,
	input  i_rst_n,
	input  signed [DATA_WIDTH-1 : 0] i_round_dat,
	input  [EQ_WIDTH-1:0]     i_q_encode    ,
	input  [EQ_WIDTH-1:0]     c_q_encode    ,
	output [ADDR_WIDTH-1 : 0] o_act_lut_addr
	
);

 
 
wire [3:0] cq_sub_iq;
wire [3:0] shift_num;
wire signed [13:0] shifted_data;
wire overflow_input;
wire underflow_input;
wire iq_lt_cq;
reg  [ADDR_WIDTH-1 : 0] r_act_lut_addr;

assign  cq_sub_iq = c_q_encode - i_q_encode;
assign  shift_num = cq_sub_iq > 4'b0100 ? 4'b0100 : cq_sub_iq;
assign  shifted_data = i_round_dat[6:0] << shift_num;
assign  overflow_input = i_round_dat[7]==1'b0 && |shifted_data[13:7];
assign  underflow_input = i_round_dat[7]==1'b1 && (shift_num == 4'b0100 ? ~&shifted_data[10:7] : 
(shift_num == 4'b0011 ? ~&shifted_data[9:7] : (shift_num == 4'b0010 ? ~&shifted_data[8:7] :
(shift_num == 4'b0001 ? ~&shifted_data[7]: 0))));
assign  iq_lt_cq = i_q_encode < c_q_encode; 

 


always @(posedge i_clk or negedge i_rst_n)
begin
  if(~i_rst_n)
    r_act_lut_addr <= 5'b0;
  else if(iq_lt_cq) begin
    if(overflow_input)
      r_act_lut_addr <= 5'b10000;
    else if(underflow_input)
      r_act_lut_addr <= 5'b10001;
    else r_act_lut_addr <= {1'b0,i_round_dat[7],shifted_data[6:4]};
  end else r_act_lut_addr <= {1'b0,i_round_dat[7:4]};  
	
end

assign o_act_lut_addr = r_act_lut_addr; 

endmodule