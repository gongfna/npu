`timescale 1ns/1ns         
module  sorter    (/*autoport*/
//output
           sorter_result,
           sorter_valid ,
           last_sort_o,
  
//input
           sys_clk,
           sys_rst_n,
           sorter_en,
           sorter_clr,
           last_sort,
           last_line_sorter_num,
           sorter_in);

parameter Data_Width = 8;
parameter N = 5;                //the total maxmium to be sorted
parameter Data_init = 8'h80;    //the data  should be initialized the minimum values
parameter Index_Width=16;       

input  [255:0] sorter_in  ; 
input  sorter_en  ; 
input  sys_clk    ;
input  sys_rst_n  ;
input  sorter_clr ;
input  last_sort  ;
input [4:0] last_line_sorter_num;

output [255:0] sorter_result;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out0  ;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out1  ;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out2  ;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out3  ;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out4  ;
output   sorter_valid ; 
output  last_sort_o  ;  


wire [Index_Width + Data_Width - 1 :0] E1H_sorter_out0 ;
wire [Index_Width + Data_Width - 1 :0] E1H_sorter_out1 ;
wire [Index_Width + Data_Width - 1 :0] E1H_sorter_out2 ;
wire [Index_Width + Data_Width - 1 :0] E1H_sorter_out3 ;
wire [Index_Width + Data_Width - 1 :0] E1H_sorter_out4 ;
wire [Index_Width + Data_Width - 1 :0] E1L_sorter_out0 ;
wire [Index_Width + Data_Width - 1 :0] E1L_sorter_out1 ;
wire [Index_Width + Data_Width - 1 :0] E1L_sorter_out2 ;
wire [Index_Width + Data_Width - 1 :0] E1L_sorter_out3 ;
wire [Index_Width + Data_Width - 1 :0] E1L_sorter_out4 ;
wire  E1_sort_en      ;
wire [Index_Width-1 :0] E1_index_counter;

wire [Index_Width + Data_Width - 1 :0]  E2H_sorter_out0 ;
wire [Index_Width + Data_Width - 1 :0]  E2H_sorter_out1 ;
wire [Index_Width + Data_Width - 1 :0]  E2H_sorter_out2 ;
wire [Index_Width + Data_Width - 1 :0]  E2H_sorter_out3 ;
wire [Index_Width + Data_Width - 1 :0]  E2H_sorter_out4 ;
wire [Index_Width + Data_Width - 1 :0]  E2L_sorter_out0 ;
wire [Index_Width + Data_Width - 1 :0]  E2L_sorter_out1 ;
wire [Index_Width + Data_Width - 1 :0]  E2L_sorter_out2 ;
wire [Index_Width + Data_Width - 1 :0]  E2L_sorter_out3 ;
wire [Index_Width + Data_Width - 1 :0]  E2L_sorter_out4 ;
wire  E2_sort_en      ;

wire [Index_Width + Data_Width - 1 :0]  sorter_out[4:0]  ;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out1  ;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out2  ;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out3  ;
//wire [Index_Width + Data_Width - 1 :0]  sorter_out4  ;
wire  sorter_valid ;

 genvar i;
    generate
        for(i = 0; i < 5; i = i +1)begin
            assign  sorter_result[((i+1)*(Index_Width + Data_Width) - 1) : i*(Index_Width + Data_Width)] = sorter_out[i];
        end
    endgenerate 
    assign  sorter_result[255 : 5*(Index_Width + Data_Width)] = 0;

sort_E1 sort_E1_i(
///input//////////////////////////////////
.sys_clk      (sys_clk      ),
.sys_rst_n    (sys_rst_n    ),
.sorter_clr   (sorter_clr   ),
.sort_in      (sorter_in   ),
.sort_en      (sorter_en      ),  
.last_sort		(last_sort),  
.last_line_sorter_num(last_line_sorter_num),
/////output/////////////////////////////////
.E1H_sorter_out0 (E1H_sorter_out0 ),
.E1H_sorter_out1 (E1H_sorter_out1 ),
.E1H_sorter_out2 (E1H_sorter_out2 ),
.E1H_sorter_out3 (E1H_sorter_out3 ),
.E1H_sorter_out4 (E1H_sorter_out4 ),
.E1L_sorter_out0 (E1L_sorter_out0 ),
.E1L_sorter_out1 (E1L_sorter_out1 ),
.E1L_sorter_out2 (E1L_sorter_out2 ),
.E1L_sorter_out3 (E1L_sorter_out3 ),
.E1L_sorter_out4 (E1L_sorter_out4 ),
.E1_sort_en      (E1_sort_en      ),
.E1_last_sort		 (E1_last_sort),
.E1_index_counter(E1_index_counter)
);
        
sort_E2 sort_E2_i(
///input//////////////////////////////////
.sys_clk         (sys_clk         ),
.sys_rst_n       (sys_rst_n       ),
.sorter_clr      (sorter_clr      ),
.E1H_sorter_out0 (E1H_sorter_out0 ),
.E1H_sorter_out1 (E1H_sorter_out1 ),
.E1H_sorter_out2 (E1H_sorter_out2 ),
.E1H_sorter_out3 (E1H_sorter_out3 ),
.E1H_sorter_out4 (E1H_sorter_out4 ),
.E1L_sorter_out0 (E1L_sorter_out0 ),
.E1L_sorter_out1 (E1L_sorter_out1 ),
.E1L_sorter_out2 (E1L_sorter_out2 ),
.E1L_sorter_out3 (E1L_sorter_out3 ),
.E1L_sorter_out4 (E1L_sorter_out4 ),
.E1_sort_en      (E1_sort_en      ),
.E1_index_counter(E1_index_counter),
.E1_last_sort		 (E1_last_sort), 
/////output/////////////////////////////////
.E2H_sorter_out0 (E2H_sorter_out0),
.E2H_sorter_out1 (E2H_sorter_out1),
.E2H_sorter_out2 (E2H_sorter_out2),
.E2H_sorter_out3 (E2H_sorter_out3),
.E2H_sorter_out4 (E2H_sorter_out4),
.E2L_sorter_out0 (E2L_sorter_out0),
.E2L_sorter_out1 (E2L_sorter_out1),
.E2L_sorter_out2 (E2L_sorter_out2),
.E2L_sorter_out3 (E2L_sorter_out3),
.E2L_sorter_out4 (E2L_sorter_out4),
.E2_last_sort		 (E2_last_sort), 
.E2_sort_en      (E2_sort_en     )
//E2_index_counter

);

 sort_E3 sort_E3_i(
///input//////////////////////////////////
.sys_clk         (sys_clk        ),
.sys_rst_n       (sys_rst_n      ),
.sorter_clr      (sorter_clr     ),
.E2H_sorter_out0 (E2H_sorter_out0),
.E2H_sorter_out1 (E2H_sorter_out1),
.E2H_sorter_out2 (E2H_sorter_out2),
.E2H_sorter_out3 (E2H_sorter_out3),
.E2H_sorter_out4 (E2H_sorter_out4),
.E2L_sorter_out0 (E2L_sorter_out0),
.E2L_sorter_out1 (E2L_sorter_out1),
.E2L_sorter_out2 (E2L_sorter_out2),
.E2L_sorter_out3 (E2L_sorter_out3),
.E2L_sorter_out4 (E2L_sorter_out4),
.E2_sort_en      (E2_sort_en     ),  
.E2_last_sort		 (E2_last_sort),
//E2_index_counter,
/////output/////////////////////////////////
.last_sort_o (last_sort_o),
.sorter_out0 (sorter_out[0] ),
.sorter_out1 (sorter_out[1] ),
.sorter_out2 (sorter_out[2] ),
.sorter_out3 (sorter_out[3] ),
.sorter_out4 (sorter_out[4] ), 
.sorter_valid(sorter_valid)

);   
           
endmodule
 