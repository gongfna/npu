module sort_E2(
///input//////////////////////////////////
sys_clk,
sys_rst_n,
sorter_clr,
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
E1_index_counter,
E1_last_sort,
/////output/////////////////////////////////
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
E2_last_sort,
E2_sort_en
//E2_index_counter

);

parameter Data_Width = 8;  
parameter Index_Width=16;

input   sys_clk;
input   sys_rst_n;
input   sorter_clr;
input  [Index_Width + Data_Width - 1 :0] E1H_sorter_out0;
input  [Index_Width + Data_Width - 1 :0] E1H_sorter_out1;
input  [Index_Width + Data_Width - 1 :0] E1H_sorter_out2;
input  [Index_Width + Data_Width - 1 :0] E1H_sorter_out3;
input  [Index_Width + Data_Width - 1 :0] E1H_sorter_out4;
input  [Index_Width + Data_Width - 1 :0] E1L_sorter_out0;
input  [Index_Width + Data_Width - 1 :0] E1L_sorter_out1;
input  [Index_Width + Data_Width - 1 :0] E1L_sorter_out2;
input  [Index_Width + Data_Width - 1 :0] E1L_sorter_out3;
input  [Index_Width + Data_Width - 1 :0] E1L_sorter_out4;
input   E1_sort_en;
input  [Index_Width-1 :0] E1_index_counter;
input  E1_last_sort;


output reg [Index_Width + Data_Width - 1 :0] E2H_sorter_out0; 
output reg [Index_Width + Data_Width - 1 :0] E2H_sorter_out1; 
output reg [Index_Width + Data_Width - 1 :0] E2H_sorter_out2; 
output reg [Index_Width + Data_Width - 1 :0] E2H_sorter_out3; 
output reg [Index_Width + Data_Width - 1 :0] E2H_sorter_out4; 
output reg [Index_Width + Data_Width - 1 :0] E2L_sorter_out0; 
output reg [Index_Width + Data_Width - 1 :0] E2L_sorter_out1; 
output reg [Index_Width + Data_Width - 1 :0] E2L_sorter_out2; 
output reg [Index_Width + Data_Width - 1 :0] E2L_sorter_out3; 
output reg [Index_Width + Data_Width - 1 :0] E2L_sorter_out4; 
output reg  E2_sort_en;   
output reg  E2_last_sort;   
//output reg  E2_index_counter ;

wire  [ Index_Width -1:0] index_valueL0;      
wire  [ Index_Width -1:0] index_valueL1;
wire  [ Index_Width -1:0] index_valueL2;
wire  [ Index_Width -1:0] index_valueL3;      
wire  [ Index_Width -1:0] index_valueL4;
wire  [ Index_Width -1:0] index_valueH0;
wire  [ Index_Width -1:0] index_valueH1;
wire  [ Index_Width -1:0] index_valueH2;
wire  [ Index_Width -1:0] index_valueH3;      
wire  [ Index_Width -1:0] index_valueH4;

assign index_valueL0 = E1L_sorter_out0[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueL1 = E1L_sorter_out1[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueL2 = E1L_sorter_out2[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueL3 = E1L_sorter_out3[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueL4 = E1L_sorter_out4[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueH0 = E1H_sorter_out0[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueH1 = E1H_sorter_out1[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueH2 = E1H_sorter_out2[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueH3 = E1H_sorter_out3[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);
assign index_valueH4 = E1H_sorter_out4[Index_Width + Data_Width - 1: Data_Width ] + ((E1_index_counter-1) << 5);



always @(posedge sys_clk, negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		E2H_sorter_out0 <= 0;
		E2H_sorter_out1 <= 0;
		E2H_sorter_out2 <= 0;
		E2H_sorter_out3 <= 0;
		E2H_sorter_out4 <= 0;
		E2L_sorter_out0 <= 0;
		E2L_sorter_out1 <= 0;
		E2L_sorter_out2 <= 0;
		E2L_sorter_out3 <= 0;
		E2L_sorter_out4 <= 0;
	end else if(sorter_clr)
	begin
		E2H_sorter_out0 <= 0;
		E2H_sorter_out1 <= 0;
		E2H_sorter_out2 <= 0;
		E2H_sorter_out3 <= 0;
		E2H_sorter_out4 <= 0;
		E2L_sorter_out0 <= 0;
		E2L_sorter_out1 <= 0;
		E2L_sorter_out2 <= 0;
		E2L_sorter_out3 <= 0;
		E2L_sorter_out4 <= 0;
		end
	else 
	if(E1_sort_en) begin
		E2H_sorter_out0 <= {index_valueH0, E1H_sorter_out0[Data_Width - 1 : 0]};
		E2H_sorter_out1 <= {index_valueH1, E1H_sorter_out1[Data_Width - 1 : 0]};
		E2H_sorter_out2 <= {index_valueH2, E1H_sorter_out2[Data_Width - 1 : 0]};
		E2H_sorter_out3 <= {index_valueH3, E1H_sorter_out3[Data_Width - 1 : 0]};
		E2H_sorter_out4 <= {index_valueH4, E1H_sorter_out4[Data_Width - 1 : 0]};
		E2L_sorter_out0 <= {index_valueL0, E1L_sorter_out0[Data_Width - 1 : 0]};
		E2L_sorter_out1 <= {index_valueL1, E1L_sorter_out1[Data_Width - 1 : 0]};
		E2L_sorter_out2 <= {index_valueL2, E1L_sorter_out2[Data_Width - 1 : 0]};
		E2L_sorter_out3 <= {index_valueL3, E1L_sorter_out3[Data_Width - 1 : 0]};
		E2L_sorter_out4 <= {index_valueL4, E1L_sorter_out4[Data_Width - 1 : 0]};

	end	
		
end
////////////////////////////////////////////////////////
always @(posedge sys_clk, negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
	   E2_sort_en  		<= 0;
		E2_last_sort    <= 0;
	end else if(sorter_clr)
	begin
	   E2_sort_en  		<= 0;
		E2_last_sort    <= 0;
    end else begin
      E2_sort_en   <= E1_sort_en;  
	  E2_last_sort <= E1_last_sort; 
    end
end
endmodule