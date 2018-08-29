`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2018 09:20:29 AM
// Design Name: 
// Module Name: lookup_table
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lookup_table(  
     w_addr,
     datain,
     clka,
     rst,
     we,
	   addr0,
	   addr1,
    addr2,
    addr3,
    addr4,
    addr5,
    addr6,
    addr7 ,
    addr8 ,
    addr9 ,
     addr10,
     addr11,
     addr12,
     addr13,
     addr14,
     addr15,
     addr16,
     addr17,
     addr18,
     addr19,
     addr20,
     addr21,
     addr22,
     addr23,
     addr24,
     addr25,
     addr26,
     addr27,
     addr28,
     addr29,
     addr30,
     addr31,
     data0,
     data1,
     data2,
     data3,
     data4,
     data5,
     data6,
     data7  ,
     data8  ,
     data9 , 
     data10 ,
     data11 ,
     data12 ,
     data13 ,
     data14 ,
     data15 ,
     data16 ,
     data17 ,
     data18 ,
     data19 ,
     data20 ,
     data21 ,
     data22 ,
     data23 ,
     data24 ,
     data25 ,
     data26 ,
     data27 ,
     data28 ,
     data29 ,
     data30 ,
     data31




    );
    
    input [3:0]w_addr;
    input [23:0]datain;
    input clka;
    input rst;
    input we;
    
    
    
    
    input [3:0] addr0;
    input [3:0] addr1; 
    input [3:0] addr2; 
    input [3:0] addr3; 
    input [3:0] addr4; 
    input [3:0] addr5; 
    input [3:0] addr6;
    input [3:0] addr7 ; 
    input [3:0] addr8 ; 
    input [3:0] addr9 ; 
    input [3:0] addr10; 
    input [3:0] addr11; 
    input [3:0] addr12;
    input [3:0] addr13; 
    input [3:0] addr14; 
    input [3:0] addr15; 
    input [3:0] addr16; 
    input [3:0] addr17; 
    input [3:0] addr18;
    input [3:0] addr19; 
    input [3:0] addr20; 
    input [3:0] addr21; 
    input [3:0] addr22; 
    input [3:0] addr23; 
    input [3:0] addr24;
    input [3:0] addr25; 
    input [3:0] addr26; 
    input [3:0] addr27; 
    input [3:0] addr28; 
    input [3:0] addr29;
    input [3:0] addr30; 
    input [3:0] addr31;
    output [23:0] data0;
    output [23:0] data1;
    output [23:0] data2;
    output [23:0] data3;
    output [23:0] data4;
    output [23:0] data5;
    output [23:0] data6;
    output [23:0] data7 ;
    output [23:0] data8 ;
    output [23:0] data9 ;
    output [23:0] data10;
    output [23:0] data11;
    output [23:0] data12;
    output [23:0] data13;
    output [23:0] data14;
    output [23:0] data15;
    output [23:0] data16;
    output [23:0] data17;
    output [23:0] data18;
    output [23:0] data19;
    output [23:0] data20;
    output [23:0] data21;
    output [23:0] data22;
    output [23:0] data23;
    output [23:0] data24;
    output [23:0] data25;
    output [23:0] data26;
    output [23:0] data27;
    output [23:0] data28;
    output [23:0] data29;
    output [23:0] data30;
    output [23:0] data31;

    
   reg  [23:0] mem[15:0];
   
    always @(posedge clka or negedge rst)
    begin
    	if(!rst) begin
    	mem[0] <= 24'b0;
    	mem[1] <= 24'b0;
    	mem[2] <= 24'b0;
    	mem[3] <= 24'b0;
    	mem[4] <= 24'b0;
    	mem[5] <= 24'b0;
    	mem[6] <= 24'b0;
    	mem[7] <= 24'b0;
    	mem[8] <= 24'b0;
    	mem[9] <= 24'b0;
    	mem[10] <= 24'b0;
    	mem[11] <= 24'b0;
    	mem[12] <= 24'b0;
    	mem[13] <= 24'b0;
    	mem[14] <= 24'b0;
    	mem[15] <= 24'b0;
    end
    	else if(we)
    	mem[w_addr]<=datain;
    end
    
    assign data0  = mem[addr0];
    assign data1  = mem[addr1];
    assign data2  = mem[addr2];
    assign data3  = mem[addr3];
    assign data4  = mem[addr4];
    assign data5  = mem[addr5];
    assign data6  = mem[addr6]; 
    assign data7  = mem[addr7 ];
    assign data8  = mem[addr8 ];
    assign data9  = mem[addr9 ];
    assign data10 = mem[addr10];
    assign data11 = mem[addr11];
    assign data12 = mem[addr12];
    assign data13 = mem[addr13];
    assign data14 = mem[addr14];
    assign data15 = mem[addr15];
    assign data16 = mem[addr16];
    assign data17 = mem[addr17];
    assign data18 = mem[addr18];
    assign data19 = mem[addr19];
    assign data20 = mem[addr20];
    assign data21 = mem[addr21];
    assign data22 = mem[addr22];
    assign data23 = mem[addr23];
    assign data24 = mem[addr24];
    assign data25 = mem[addr25];
    assign data26 = mem[addr26];
    assign data27 = mem[addr27];
    assign data28 = mem[addr28];
    assign data29 = mem[addr29];
    assign data30 = mem[addr30];
    assign data31 = mem[addr31];
 
    
endmodule