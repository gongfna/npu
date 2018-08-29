module sort_E1(
///input//////////////////////////////////
sys_clk,
sys_rst_n,
sorter_clr,
sort_in,
sort_en,
last_sort,	
last_line_sorter_num,
/////output/////////////////////////////////
E1H_sorter_out0,
E1H_sorter_out1,
E1H_sorter_out2,
E1H_sorter_out3,
E1H_sorter_out4,
E1L_sorter_out0,
E1L_sorter_out1,
E1L_sorter_out2,
E1L_sorter_out3,
E1L_sorter_out4,
E1_sort_en,
E1_last_sort,
E1_index_counter
);

parameter IDLE = 3'b000;
parameter ITERATION0 = 3'b001;
parameter ITERATION1 = 3'b011;
parameter ITERATION2 = 3'b010;
parameter ITERATION3 = 3'b110;
parameter ITERATION4 = 3'b100;

parameter Data_Width = 8;  
parameter Index_Width=16;
parameter Num_Inputs = 16;
parameter MIN = 8'h80;
input sys_clk      ;
input sys_rst_n   ;
input sorter_clr   ;
input [Data_Width*Num_Inputs*2-1 : 0] sort_in   ;
input last_sort ;	
input [4:0] last_line_sorter_num;

input sort_en      ;

output reg [Index_Width + Data_Width - 1 :0] E1H_sorter_out0;
output reg [Index_Width + Data_Width - 1 :0] E1H_sorter_out1;
output reg [Index_Width + Data_Width - 1 :0] E1H_sorter_out2;
output reg [Index_Width + Data_Width - 1 :0] E1H_sorter_out3;
output reg [Index_Width + Data_Width - 1 :0] E1H_sorter_out4;
output reg [Index_Width + Data_Width - 1 :0] E1L_sorter_out0;
output reg [Index_Width + Data_Width - 1 :0] E1L_sorter_out1;
output reg [Index_Width + Data_Width - 1 :0] E1L_sorter_out2;
output reg [Index_Width + Data_Width - 1 :0] E1L_sorter_out3;
output reg [Index_Width + Data_Width - 1 :0] E1L_sorter_out4;
output reg E1_sort_en;
output reg [Index_Width-1 :0] E1_index_counter;
output reg E1_last_sort;

reg sort_enL0;
reg sort_enL1;
reg sort_enL2;
reg sort_enL3;
reg sort_enL4; 
reg sort_enL5;

reg last_sortL0;
reg last_sortL1;
reg last_sortL2;
reg last_sortL3;
reg last_sortL4; 
reg last_sortL5;
reg [Index_Width -1 :0] index_counter; 

reg [Data_Width*Num_Inputs-1 : 0]sort_in_LL;
reg [Data_Width*Num_Inputs-1 : 0]sort_in_LH;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data0  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data1  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data2  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data3  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data4  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data5  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data6  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data7  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data8  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data9  ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data10 ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data11 ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data12 ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data13 ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data14 ;
reg [Index_Width + Data_Width - 1 : 0] L_sub_data15 ;

reg [Index_Width + Data_Width - 1 : 0] H_sub_data0  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data1  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data2  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data3  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data4  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data5  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data6  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data7  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data8  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data9  ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data10 ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data11 ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data12 ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data13 ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data14 ;
reg [Index_Width + Data_Width - 1 : 0] H_sub_data15 ;

wire [Index_Width + Data_Width - 1 :0] max_out_L;
wire [Index_Width + Data_Width - 1 :0] max_out_H;
reg [2:0] cur_state ;
reg [2:0] next_state;
always @(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin 
	  L_sub_data0  <= 24'b0;
    L_sub_data1  <= 24'b0;
    L_sub_data2  <= 24'b0;
    L_sub_data3  <= 24'b0;
    L_sub_data4  <= 24'b0;
    L_sub_data5  <= 24'b0;
    L_sub_data6  <= 24'b0;
    L_sub_data7  <= 24'b0;
    L_sub_data8  <= 24'b0;
    L_sub_data9  <= 24'b0;
    L_sub_data10 <= 24'b0;
    L_sub_data11 <= 24'b0;
    L_sub_data12 <= 24'b0;
    L_sub_data13 <= 24'b0;
    L_sub_data14 <= 24'b0;
    L_sub_data15 <= 24'b0;
    
    H_sub_data0  <= 24'b0;
    H_sub_data1  <= 24'b0;
    H_sub_data2  <= 24'b0;
    H_sub_data3  <= 24'b0;
    H_sub_data4  <= 24'b0;
    H_sub_data5  <= 24'b0;
    H_sub_data6  <= 24'b0;
    H_sub_data7  <= 24'b0;
    H_sub_data8  <= 24'b0;
    H_sub_data9  <= 24'b0;
    H_sub_data10 <= 24'b0;
    H_sub_data11 <= 24'b0;
    H_sub_data12 <= 24'b0;
    H_sub_data13 <= 24'b0;
    H_sub_data14 <= 24'b0;
    H_sub_data15 <= 24'b0;
	  index_counter <= 0;
	end else if(sorter_clr)
	begin
		 L_sub_data0  <= 24'b0;
     L_sub_data1  <= 24'b0;
     L_sub_data2  <= 24'b0;
     L_sub_data3  <= 24'b0;
     L_sub_data4  <= 24'b0;
     L_sub_data5  <= 24'b0;
     L_sub_data6  <= 24'b0;
     L_sub_data7  <= 24'b0;
     L_sub_data8  <= 24'b0;
     L_sub_data9  <= 24'b0;
     L_sub_data10 <= 24'b0;
     L_sub_data11 <= 24'b0;
     L_sub_data12 <= 24'b0;
     L_sub_data13 <= 24'b0;
     L_sub_data14 <= 24'b0;
     L_sub_data15 <= 24'b0;
     
     H_sub_data0  <= 24'b0;
     H_sub_data1  <= 24'b0;
     H_sub_data2  <= 24'b0;
     H_sub_data3  <= 24'b0;
     H_sub_data4  <= 24'b0;
     H_sub_data5  <= 24'b0;
     H_sub_data6  <= 24'b0;
     H_sub_data7  <= 24'b0;
     H_sub_data8  <= 24'b0;
     H_sub_data9  <= 24'b0;
     H_sub_data10 <= 24'b0;
     H_sub_data11 <= 24'b0;
     H_sub_data12 <= 24'b0;
     H_sub_data13 <= 24'b0;
     H_sub_data14 <= 24'b0;
     H_sub_data15 <= 24'b0;
		index_counter <= 0;
	end else if(sort_en)
	begin
		 L_sub_data0  <= {16'h0,sort_in[255:248]};
     L_sub_data1  <= last_sort&&(last_line_sorter_num < 5'h2)&&(|last_line_sorter_num) ? {16'h1,MIN} : {16'h1,sort_in[247:240]} ;
     L_sub_data2  <= last_sort&&(last_line_sorter_num < 5'h3)&&(|last_line_sorter_num) ? {16'h2,MIN} : {16'h2,sort_in[239:232]} ;
     L_sub_data3  <= last_sort&&(last_line_sorter_num < 5'h4)&&(|last_line_sorter_num) ? {16'h3,MIN} : {16'h3,sort_in[231:224]} ;
     L_sub_data4  <= last_sort&&(last_line_sorter_num < 5'h5)&&(|last_line_sorter_num) ? {16'h4,MIN} : {16'h4,sort_in[223:216]} ;
     L_sub_data5  <= last_sort&&(last_line_sorter_num < 5'h6)&&(|last_line_sorter_num) ? {16'h5,MIN} : {16'h5,sort_in[215:208]} ;
     L_sub_data6  <= last_sort&&(last_line_sorter_num < 5'h7)&&(|last_line_sorter_num) ? {16'h6,MIN} : {16'h6,sort_in[207:200]} ;
     L_sub_data7  <= last_sort&&(last_line_sorter_num < 5'h8)&&(|last_line_sorter_num) ? {16'h7,MIN} : {16'h7,sort_in[199:192]} ;
     L_sub_data8  <= last_sort&&(last_line_sorter_num < 5'h9)&&(|last_line_sorter_num) ? {16'h8,MIN} : {16'h8,sort_in[191:184]} ;
     L_sub_data9  <= last_sort&&(last_line_sorter_num < 5'ha)&&(|last_line_sorter_num) ? {16'h9,MIN} : {16'h9,sort_in[183:176]} ;
     L_sub_data10 <= last_sort&&(last_line_sorter_num < 5'hb)&&(|last_line_sorter_num) ? {16'ha,MIN} : {16'ha,sort_in[175:168]} ;
     L_sub_data11 <= last_sort&&(last_line_sorter_num < 5'hc)&&(|last_line_sorter_num) ? {16'hb,MIN} : {16'hb,sort_in[167:160]} ;
     L_sub_data12 <= last_sort&&(last_line_sorter_num < 5'hd)&&(|last_line_sorter_num) ? {16'hc,MIN} : {16'hc,sort_in[159:152]} ;
     L_sub_data13 <= last_sort&&(last_line_sorter_num < 5'he)&&(|last_line_sorter_num) ? {16'hd,MIN} : {16'hd,sort_in[151:144]} ;
     L_sub_data14 <= last_sort&&(last_line_sorter_num < 5'hf)&&(|last_line_sorter_num) ? {16'he,MIN} : {16'he,sort_in[143:136]} ;
     L_sub_data15 <= last_sort&&(last_line_sorter_num < 5'h10)&&(|last_line_sorter_num)? {16'hf,MIN} : {16'hf,sort_in[135:128]} ;
    
     H_sub_data0  <= last_sort&&(last_line_sorter_num < 5'h11)&&(|last_line_sorter_num) ? {16'h11,MIN} : {16'h10,sort_in[127:120]};
     H_sub_data1  <= last_sort&&(last_line_sorter_num < 5'h12)&&(|last_line_sorter_num) ? {16'h12,MIN} : {16'h11,sort_in[119:112]};
     H_sub_data2  <= last_sort&&(last_line_sorter_num < 5'h13)&&(|last_line_sorter_num) ? {16'h13,MIN} : {16'h12,sort_in[111:104]};
     H_sub_data3  <= last_sort&&(last_line_sorter_num < 5'h14)&&(|last_line_sorter_num) ? {16'h14,MIN} : {16'h13,sort_in[103:96 ]};
     H_sub_data4  <= last_sort&&(last_line_sorter_num < 5'h15)&&(|last_line_sorter_num) ? {16'h15,MIN} : {16'h14,sort_in[95:88  ]};
     H_sub_data5  <= last_sort&&(last_line_sorter_num < 5'h16)&&(|last_line_sorter_num) ? {16'h16,MIN} : {16'h15,sort_in[87:80  ]};
     H_sub_data6  <= last_sort&&(last_line_sorter_num < 5'h17)&&(|last_line_sorter_num) ? {16'h17,MIN} : {16'h16,sort_in[79:72  ]};
     H_sub_data7  <= last_sort&&(last_line_sorter_num < 5'h18)&&(|last_line_sorter_num) ? {16'h18,MIN} : {16'h17,sort_in[71:64  ]};
     H_sub_data8  <= last_sort&&(last_line_sorter_num < 5'h19)&&(|last_line_sorter_num) ? {16'h19,MIN} : {16'h18,sort_in[63:56  ]};
     H_sub_data9  <= last_sort&&(last_line_sorter_num < 5'h1a)&&(|last_line_sorter_num) ? {16'h1a,MIN} : {16'h19,sort_in[55:48  ]};
     H_sub_data10 <= last_sort&&(last_line_sorter_num < 5'h1b)&&(|last_line_sorter_num) ? {16'h1b,MIN} : {16'h1a,sort_in[47:40  ]};
     H_sub_data11 <= last_sort&&(last_line_sorter_num < 5'h1c)&&(|last_line_sorter_num) ? {16'h1c,MIN} : {16'h1b,sort_in[39:32  ]};
     H_sub_data12 <= last_sort&&(last_line_sorter_num < 5'h1d)&&(|last_line_sorter_num) ? {16'h1d,MIN} : {16'h1c,sort_in[31:24  ]};
     H_sub_data13 <= last_sort&&(last_line_sorter_num < 5'h1e)&&(|last_line_sorter_num) ? {16'h1e,MIN} : {16'h1d,sort_in[23:16  ]};
     H_sub_data14 <= last_sort&&(last_line_sorter_num < 5'h1f)&&(|last_line_sorter_num) ? {16'h1f,MIN} : {16'h1e,sort_in[15:8   ]};
     H_sub_data15 <= last_sort&&(|last_line_sorter_num) ? {16'hf,MIN} : {16'h1f,sort_in[7:0]};
	//	sort_in_LL <= sort_in[Data_Width*Num_Inputs-1:0];
	//	sort_in_LH <= sort_in[Data_Width*Num_Inputs*2-1 : Data_Width*Num_Inputs];
		index_counter <= index_counter + 1'b1;
	end else if(cur_state != IDLE) begin
		case(max_out_L[Index_Width + Data_Width -1 : Data_Width])
			16'h0: L_sub_data0 [7:0]<= MIN;
			16'h1: L_sub_data1 [7:0]<= MIN;
			16'h2: L_sub_data2 [7:0]<= MIN;
			16'h3: L_sub_data3 [7:0]<= MIN;
			16'h4: L_sub_data4 [7:0]<= MIN;
			16'h5: L_sub_data5 [7:0]<= MIN;
			16'h6: L_sub_data6 [7:0]<= MIN;
			16'h7: L_sub_data7 [7:0]<= MIN;
			16'h8: L_sub_data8 [7:0]<= MIN;
			16'h9: L_sub_data9 [7:0]<= MIN;
			16'ha: L_sub_data10[7:0]<= MIN;
			16'hb: L_sub_data11[7:0]<= MIN;
			16'hc: L_sub_data12[7:0]<= MIN;
			16'hd: L_sub_data13[7:0]<= MIN;
			16'he: L_sub_data14[7:0]<= MIN;
			16'hf: L_sub_data15[7:0]<= MIN;
		default: ;
			
		endcase
		
		case(max_out_H[Index_Width + Data_Width -1 : Data_Width])
		//generate
		//genvar k; 
		//for(k=0; k<Num_Inputs; k++)
		//begin
		//	k: sort_in_LH[Data_Width*(k+1) -1: Data_Width*k] <= MIN;
		//end
		//endgenerate
		  16'h10: H_sub_data0 [7:0]<= MIN;
			16'h11: H_sub_data1 [7:0]<= MIN;
			16'h12: H_sub_data2 [7:0]<= MIN;
			16'h13: H_sub_data3 [7:0]<= MIN;
			16'h14: H_sub_data4 [7:0]<= MIN;
			16'h15: H_sub_data5 [7:0]<= MIN;
			16'h16: H_sub_data6 [7:0]<= MIN;
			16'h17: H_sub_data7 [7:0]<= MIN;
			16'h18: H_sub_data8 [7:0]<= MIN;
			16'h19: H_sub_data9 [7:0]<= MIN;
			16'h1a: H_sub_data10[7:0]<= MIN;
			16'h1b: H_sub_data11[7:0]<= MIN;
			16'h1c: H_sub_data12[7:0]<= MIN;
			16'h1d: H_sub_data13[7:0]<= MIN;
			16'h1e: H_sub_data14[7:0]<= MIN;
			16'h1f: H_sub_data15[7:0]<= MIN;
		default: ;
			
		endcase
	end
end



always @(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		cur_state  <= 3'b0;
		//next_state <= 3'b0;
	end else if(sorter_clr)
	begin
	    cur_state  <= 3'b0;
		//next_state <= 3'b0;
		end
	else begin
		cur_state <= next_state;
	end	
end

always @(*)
begin
	case(cur_state)
	IDLE: begin
		if(sort_en)
			next_state = ITERATION0;
		else next_state = cur_state;
	end
	ITERATION0: next_state = ITERATION1;
	ITERATION1: next_state = ITERATION2;
	ITERATION2: next_state = ITERATION3;
	ITERATION3: next_state = ITERATION4;
	ITERATION4: next_state = IDLE;
	default: next_state = IDLE;
	endcase
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		E1H_sorter_out0 <= 0;
		E1H_sorter_out1 <= 0;
		E1H_sorter_out2 <= 0;
		E1H_sorter_out3 <= 0;
		E1H_sorter_out4 <= 0;
		E1L_sorter_out0 <= 0;
		E1L_sorter_out1 <= 0;
		E1L_sorter_out2 <= 0;
		E1L_sorter_out3 <= 0;
		E1L_sorter_out4 <= 0;
		E1_sort_en      <= 0;
		E1_index_counter<= 0; 
		sort_enL0 <= 0;
		sort_enL1 <= 0; 
		sort_enL2 <= 0;
		sort_enL3 <= 0;
		sort_enL4 <= 0; 
		sort_enL5 <= 0;  
		last_sortL0 <= 0;  
		last_sortL1 <= 0; 
		last_sortL2 <= 0; 
		last_sortL3 <= 0; 
		last_sortL4 <= 0; 
		last_sortL5 <= 0; 
		E1_last_sort<= 0; 

	end else if(sorter_clr)
	begin
		E1H_sorter_out0 <= 0;
		E1H_sorter_out1 <= 0;
		E1H_sorter_out2 <= 0;
		E1H_sorter_out3 <= 0;
		E1H_sorter_out4 <= 0;
		E1L_sorter_out0 <= 0;
		E1L_sorter_out1 <= 0;
		E1L_sorter_out2 <= 0;
		E1L_sorter_out3 <= 0;
		E1L_sorter_out4 <= 0;
		E1_sort_en      <= 0;
		E1_index_counter<= 0;
		sort_enL0 <= 0;
		sort_enL1 <= 0; 
		sort_enL2 <= 0;
		sort_enL3 <= 0;
		sort_enL4 <= 0; 
		sort_enL5 <= 0;
		last_sortL0 <= 0;  
		last_sortL1 <= 0; 
		last_sortL2 <= 0; 
		last_sortL3 <= 0; 
		last_sortL4 <= 0; 
		last_sortL5 <= 0; 
		E1_last_sort<= 0; 
	end else begin
		sort_enL0 <= sort_en;
		sort_enL1 <= sort_enL0 ;
		sort_enL2 <= sort_enL1;
		sort_enL3 <= sort_enL2;
		sort_enL4 <= sort_enL3; 
		sort_enL5 <= sort_enL4; 
		E1_sort_en      <= sort_enL5;
		
		last_sortL0   <= last_sort;
		last_sortL1   <= last_sortL0 ;
		last_sortL2   <= last_sortL1;
		last_sortL3   <= last_sortL2;
		last_sortL4   <= last_sortL3; 
		last_sortL5   <= last_sortL4; 
		E1_last_sort  <= last_sortL5;
		if(cur_state == ITERATION0)
		begin
			E1H_sorter_out0 <= max_out_H;
			E1L_sorter_out0  <= max_out_L;
			
		end else if(cur_state == ITERATION1)
		begin
			E1H_sorter_out1 <= max_out_H;
			E1L_sorter_out1  <= max_out_L;
			
		end  else if(cur_state == ITERATION2)
		begin
			E1H_sorter_out2 <= max_out_H;
			E1L_sorter_out2  <= max_out_L;
			
		end  else if(cur_state == ITERATION3)
		begin
			E1H_sorter_out3 <= max_out_H;
			E1L_sorter_out3  <= max_out_L;
			
		end  else if(cur_state == ITERATION4)
		begin
			E1H_sorter_out4 <= max_out_H;
			E1L_sorter_out4  <= max_out_L;
			
			E1_index_counter<= index_counter;
		end
	end
end
max16 max16_L (
.sub_data0 (L_sub_data0 ),
.sub_data1 (L_sub_data1 ),
.sub_data2 (L_sub_data2 ),
.sub_data3 (L_sub_data3 ),
.sub_data4 (L_sub_data4 ),
.sub_data5 (L_sub_data5 ),
.sub_data6 (L_sub_data6 ),
.sub_data7 (L_sub_data7 ),
.sub_data8 (L_sub_data8 ),
.sub_data9 (L_sub_data9 ),
.sub_data10(L_sub_data10),
.sub_data11(L_sub_data11),
.sub_data12(L_sub_data12),
.sub_data13(L_sub_data13),
.sub_data14(L_sub_data14),
.sub_data15(L_sub_data15),
.max_out   (max_out_L)
);

max16 max16_H (
.sub_data0 (H_sub_data0 ),
.sub_data1 (H_sub_data1 ),
.sub_data2 (H_sub_data2 ),
.sub_data3 (H_sub_data3 ),
.sub_data4 (H_sub_data4 ),
.sub_data5 (H_sub_data5 ),
.sub_data6 (H_sub_data6 ),
.sub_data7 (H_sub_data7 ),
.sub_data8 (H_sub_data8 ),
.sub_data9 (H_sub_data9 ),
.sub_data10(H_sub_data10),
.sub_data11(H_sub_data11),
.sub_data12(H_sub_data12),
.sub_data13(H_sub_data13),
.sub_data14(H_sub_data14),
.sub_data15(H_sub_data15),
.max_out   (max_out_H)
);
endmodule
