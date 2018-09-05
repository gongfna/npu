module linear_fun#(
	 parameter COE_A_WIDTH  = 8,
	 parameter COE_B_WIDTH  = 16,
	 parameter DATA_WIDTH  = 8
)(
	  input         i_clk       ,                                                                                                         
    input         i_rst_n     , 
    input    [(COE_A_WIDTH + COE_B_WIDTH - 1) :0] i_act_coe   ,
    input    signed [DATA_WIDTH - 1 : 0]          i_dat       ,
    output   signed [DATA_WIDTH*2 - 1:0]          o_result_dat
 
);
	
	wire  signed [COE_A_WIDTH-1:0]  coe_a;
	wire  signed [COE_B_WIDTH-1:0]  coe_b;
	wire  signed [DATA_WIDTH*2 - 1:0] result_dat;
	wire  signed [DATA_WIDTH*2 - 1:0] mul_dat;
	reg   signed [DATA_WIDTH*2 - 1:0] r_result_dat;
	
		
	assign coe_a = i_act_coe[(COE_A_WIDTH + COE_B_WIDTH - 1) :COE_B_WIDTH ];
	assign coe_b = i_act_coe[COE_B_WIDTH-1 : 0];
	assign mul_dat    = coe_a * i_dat ;
	assign result_dat = mul_dat +  coe_b;
	
	always @(posedge i_clk or negedge i_rst_n)
	begin
		if(!i_rst_n)
		r_result_dat <= 0;
		else r_result_dat <= result_dat;
	end
	
	assign o_result_dat = r_result_dat;
	
endmodule