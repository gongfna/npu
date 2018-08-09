module sort_E3(
///input//////////////////////////////////
sys_clk,
sys_rst_n,
sorter_clr,
E2H_sorter_out0,
E2H_sorter_out1,
E2H_sorter_out2,
E2H_sorter_out3,
E2H_sorter_out4,
E2L_sorter_out0,
E2L_sorter_out1,
E2L_sorter_out2,
E2L_sorter_out3,
E2L_sorter_out4,
E2_sort_en,
E2_last_sort,
//E2_index_counter,
/////output/////////////////////////////////
last_sort_o,
sorter_out0,
sorter_out1,
sorter_out2,
sorter_out3,
sorter_out4, 
sorter_valid

);

parameter Data_Width = 8;  
parameter Index_Width=16;
parameter MIN = 8'h80;
parameter IDLE = 3'b000;
parameter ITERATION0 = 3'b001;
parameter ITERATION1 = 3'b011;
parameter ITERATION2 = 3'b010;
parameter ITERATION3 = 3'b110;
parameter ITERATION4 = 3'b100;

input  sys_clk;
input  sys_rst_n;
input  sorter_clr;
input  [Index_Width + Data_Width - 1 :0] E2H_sorter_out0;
input  [Index_Width + Data_Width - 1 :0] E2H_sorter_out1;
input  [Index_Width + Data_Width - 1 :0] E2H_sorter_out2;
input  [Index_Width + Data_Width - 1 :0] E2H_sorter_out3;
input  [Index_Width + Data_Width - 1 :0] E2H_sorter_out4;
input  [Index_Width + Data_Width - 1 :0] E2L_sorter_out0;
input  [Index_Width + Data_Width - 1 :0] E2L_sorter_out1;
input  [Index_Width + Data_Width - 1 :0] E2L_sorter_out2;
input  [Index_Width + Data_Width - 1 :0] E2L_sorter_out3;
input  [Index_Width + Data_Width - 1 :0] E2L_sorter_out4;
input  E2_sort_en;
input  E2_last_sort;

output reg [Index_Width + Data_Width - 1 :0] sorter_out0;
output reg [Index_Width + Data_Width - 1 :0] sorter_out1;
output reg [Index_Width + Data_Width - 1 :0] sorter_out2;
output reg [Index_Width + Data_Width - 1 :0] sorter_out3;
output reg [Index_Width + Data_Width - 1 :0] sorter_out4; 
output reg sorter_valid;
output reg last_sort_o;

reg [Index_Width + Data_Width - 1 :0] E3_sorter_out0;
reg [Index_Width + Data_Width - 1 :0] E3_sorter_out1;
reg [Index_Width + Data_Width - 1 :0] E3_sorter_out2;
reg [Index_Width + Data_Width - 1 :0] E3_sorter_out3;
reg [Index_Width + Data_Width - 1 :0] E3_sorter_out4;

reg sort_enL1;
reg sort_enL2;
reg sort_enL3;
reg sort_enL4; 
reg sort_enL5;
reg E3_sort_en;

reg last_sortL1;
reg last_sortL2;
reg last_sortL3;
reg last_sortL4; 
reg last_sortL5;
reg E3_last_sort;

reg max_hit0 ;
reg max_hit1 ;
reg max_hit2 ;
reg max_hit3 ;
reg max_hit4 ;
reg max_hit5 ;
reg max_hit6 ;
reg max_hit7 ;
reg max_hit8 ;
reg max_hit9 ;
reg max_hit10;
reg max_hit11;
reg max_hit12;
reg max_hit13;
reg max_hit14;

reg [2:0] cur_state ;
reg [2:0] next_state;

wire [Index_Width + Data_Width - 1 :0] sub_data0 ;
wire [Index_Width + Data_Width - 1 :0] sub_data1 ;
wire [Index_Width + Data_Width - 1 :0] sub_data2 ;
wire [Index_Width + Data_Width - 1 :0] sub_data3 ;
wire [Index_Width + Data_Width - 1 :0] sub_data4 ;
wire [Index_Width + Data_Width - 1 :0] sub_data5 ;
wire [Index_Width + Data_Width - 1 :0] sub_data6 ;
wire [Index_Width + Data_Width - 1 :0] sub_data7 ;
wire [Index_Width + Data_Width - 1 :0] sub_data8 ;
wire [Index_Width + Data_Width - 1 :0] sub_data9 ;
wire [Index_Width + Data_Width - 1 :0] sub_data10;
wire [Index_Width + Data_Width - 1 :0] sub_data11;
wire [Index_Width + Data_Width - 1 :0] sub_data12;
wire [Index_Width + Data_Width - 1 :0] sub_data13;
wire [Index_Width + Data_Width - 1 :0] sub_data14;
wire [Index_Width + Data_Width - 1 :0] sub_data15;
wire [Index_Width + Data_Width - 1 :0] max_out   ;


always @(posedge sys_clk, negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		 max_hit0  <= 1'b0;
     max_hit1  <= 1'b0;
     max_hit2  <= 1'b0;
     max_hit3  <= 1'b0;
     max_hit4  <= 1'b0;
     max_hit5  <= 1'b0;
     max_hit6  <= 1'b0;
     max_hit7  <= 1'b0;
     max_hit8  <= 1'b0;
     max_hit9  <= 1'b0;
     max_hit10 <= 1'b0;
     max_hit11 <= 1'b0;
     max_hit12 <= 1'b0;
     max_hit13 <= 1'b0;
     max_hit14 <= 1'b0;

	end else if(sorter_clr || E2_sort_en)
	begin
		 max_hit0  <= 1'b0;
     max_hit1  <= 1'b0;
     max_hit2  <= 1'b0;
     max_hit3  <= 1'b0;
     max_hit4  <= 1'b0;
     max_hit5  <= 1'b0;
     max_hit6  <= 1'b0;
     max_hit7  <= 1'b0;
     max_hit8  <= 1'b0;
     max_hit9  <= 1'b0;
     max_hit10 <= 1'b0;
     max_hit11 <= 1'b0;
     max_hit12 <= 1'b0;
     max_hit13 <= 1'b0;
     max_hit14 <= 1'b0;
	end else if(cur_state != IDLE) begin
		case(max_out)
		sub_data0 : max_hit0  <= 1'b1;
		sub_data1 : max_hit1  <= 1'b1;
		sub_data2 : max_hit2  <= 1'b1;
		sub_data3 : max_hit3  <= 1'b1;
		sub_data4 : max_hit4  <= 1'b1;
		sub_data5 : max_hit5  <= 1'b1;
		sub_data6 : max_hit6  <= 1'b1;
		sub_data7 : max_hit7  <= 1'b1;
		sub_data8 : max_hit8  <= 1'b1;
		sub_data9 : max_hit9  <= 1'b1;
		sub_data10: max_hit10 <= 1'b1;
		sub_data11: max_hit11 <= 1'b1;
		sub_data12: max_hit12 <= 1'b1;
		sub_data13: max_hit13 <= 1'b1;
		sub_data14: max_hit14 <= 1'b1;
		default: ;
			
		endcase
		
		
	end
end
////////////////////////////////////////////////////////////////////////////////


always @(posedge sys_clk, negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		cur_state  <= 3'b0;
		next_state <= 3'b0;
	end else if(sorter_clr)
	begin
	    cur_state  <= 3'b0;
		next_state <= 3'b0;
		end
	else begin
		cur_state <= next_state;
	end	
end

always @(*)
begin
	case(cur_state)
	IDLE: begin
		if(E2_sort_en)
			next_state = ITERATION0;
		else next_state = cur_state;
	end
	ITERATION0: next_state = ITERATION1;
	ITERATION1: next_state = ITERATION2;
	ITERATION2: next_state = ITERATION3;
	ITERATION3: next_state = ITERATION4;
	ITERATION4: next_state = IDLE;
	default: next_state = 3'bx;
	endcase
end
///////////////////////////////////////////////////////////////////////////////
always @(posedge sys_clk, negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		E3_sorter_out0   <= 0;
		E3_sorter_out1   <= 0;
		E3_sorter_out2   <= 0;
		E3_sorter_out3   <= 0;
		E3_sorter_out4   <= 0;
		E3_sort_en       <= 0;
		sort_enL1        <= 0;
		sort_enL2        <= 0;
		sort_enL3        <= 0;
		sort_enL4        <= 0;
		sort_enL5        <= 0;
		sorter_valid <=   0;
		last_sortL1 <=  0;
		last_sortL2 <=  0;
		last_sortL3 <=  0;
		last_sortL4 <=  0;
		last_sortL5 <=  0;
		E3_last_sort<=  0;
		last_sort_o <=  0;		
		//E3_index_counter <= 0;
	end else if(sorter_clr)
	begin
		E3_sorter_out0   <= 0;
		E3_sorter_out1   <= 0;
		E3_sorter_out2   <= 0;
		E3_sorter_out3   <= 0;
		E3_sorter_out4   <= 0;
		E3_sort_en       <= 0;
		sort_enL1        <= 0;
		sort_enL2        <= 0;
		sort_enL3        <= 0;
		sort_enL4        <= 0; 
		sort_enL5        <= 0; 
		sorter_valid <=  0;
		last_sortL1 <=  0;
		last_sortL2 <=  0;
		last_sortL3 <=  0;
		last_sortL4 <=  0;
		last_sortL5 <=  0;
		E3_last_sort<=  0;
		last_sort_o <=  0;
		//E3_index_counter <= 0;
	end else begin
		sort_enL1 <= E2_sort_en;
		sort_enL2 <= sort_enL1;
		sort_enL3 <= sort_enL2;
		sort_enL4 <= sort_enL3; 
		sort_enL5 <= sort_enL4;
		E3_sort_en      <= sort_enL5;
		sorter_valid <= E3_sort_en;
		
		last_sortL1 <= E2_last_sort;
		last_sortL2 <= last_sortL1;
		last_sortL3 <= last_sortL2;
		last_sortL4 <= last_sortL3; 
		last_sortL5 <= last_sortL4;
		E3_last_sort<= last_sortL5;
		last_sort_o <= E3_last_sort;
		if(cur_state == ITERATION0)
		begin
			E3_sorter_out0   <= max_out;
			
			
		end else if(cur_state == ITERATION1)
		begin
			E3_sorter_out1   <= max_out;
			
		end  else if(cur_state == ITERATION2)
		begin
			E3_sorter_out2   <= max_out;
			
		end  else if(cur_state == ITERATION3)
		begin
			E3_sorter_out3   <= max_out;
			
		end  else if(cur_state == ITERATION4)
		begin
			E3_sorter_out4   <= max_out;			
			
			
		end
	end
end
/////////////////////////////////////////////////////////////////////////////////

always @(posedge sys_clk, negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin  
    sorter_out0 <= MIN;
    sorter_out1 <= MIN;
    sorter_out2 <= MIN;
    sorter_out3 <= MIN;
    sorter_out4 <= MIN;	
	end else if(sorter_clr)
	begin
	    sorter_out0 <= MIN;
      sorter_out1 <= MIN;
      sorter_out2 <= MIN;
      sorter_out3 <= MIN;
      sorter_out4 <= MIN;
      end
	else if(E3_sort_en) begin
		
	  sorter_out0 <= E3_sorter_out0;
      sorter_out1 <= E3_sorter_out1;
      sorter_out2 <= E3_sorter_out2;
      sorter_out3 <= E3_sorter_out3;
      sorter_out4 <= E3_sorter_out4;
      
	end	
end
/////////////////////////////////////////////////////////////////////////////////////////
assign sub_data0  = max_hit0  ? MIN : E2H_sorter_out0 ;
assign sub_data1  = max_hit1  ? MIN : E2H_sorter_out1 ;
assign sub_data2  = max_hit2  ? MIN : E2H_sorter_out2 ;
assign sub_data3  = max_hit3  ? MIN : E2H_sorter_out3 ;
assign sub_data4  = max_hit4  ? MIN : E2H_sorter_out4 ;
assign sub_data5  = max_hit5  ? MIN : E2L_sorter_out0 ;
assign sub_data6  = max_hit6  ? MIN : E2L_sorter_out1 ;
assign sub_data7  = max_hit7  ? MIN : E2L_sorter_out2 ;
assign sub_data8  = max_hit8  ? MIN : E2L_sorter_out3 ;
assign sub_data9  = max_hit9  ? MIN : E2L_sorter_out4 ;
assign sub_data10 = max_hit10 ? MIN : sorter_out0     ;
assign sub_data11 = max_hit11 ? MIN : sorter_out1     ;
assign sub_data12 = max_hit12 ? MIN : sorter_out2     ;
assign sub_data13 = max_hit13 ? MIN : sorter_out3     ;
assign sub_data14 = max_hit14 ? MIN : sorter_out4     ;
assign sub_data15 = MIN;


max16 max16_H (
.sub_data0 (sub_data0 ),
.sub_data1 (sub_data1 ),
.sub_data2 (sub_data2 ),
.sub_data3 (sub_data3 ),
.sub_data4 (sub_data4 ),
.sub_data5 (sub_data5 ),
.sub_data6 (sub_data6 ),
.sub_data7 (sub_data7 ),
.sub_data8 (sub_data8 ),
.sub_data9 (sub_data9 ),
.sub_data10(sub_data10),
.sub_data11(sub_data11),
.sub_data12(sub_data12),
.sub_data13(sub_data13),
.sub_data14(sub_data14),
.sub_data15(sub_data15),
.max_out   (max_out   )
);
endmodule