module act_lut_bram#(                                                                                                                        
    // Specify name/location of RAM initialization file if using one (leave blank if not)                                                 
    parameter LUT_WIDTH  = 24,
    parameter LUT_DEPTH  = 16,
    parameter ADDR_WIDTH  = 4  , 
    parameter INIT_FILE  = ""                                                                                                                                                                                                                
    )(                                                                                                                                    
    input           i_clk       ,                                                                                                         
    input           i_rst_n     ,                                                                                                         
    //内部逻辑接口                                                                                                                  
    input [ADDR_WIDTH*32 - 1 : 0]    i_lut_raddr  ,                                                                                                         
    input           i_lut_rd_en  ,                                                                                                         
    output [LUT_WIDTH*32-1 : 0]   o_lut_dat    	,                                                                                                        
    output          o_wdata_vld ,                                                                                                         
                                                                                                                                   
    //external data input port for axi bram controller                                                                                    
    input [23:0]    i_lut_bramctl_wdata ,                                                                                                  
    input [ADDR_WIDTH - 1 : 0]    i_lut_bramctl_addr  ,                                                                                                  
    input      i_lut_bramctl_we    ,                                                                                                  
    input           i_lut_bramctl_en                                                                                                  
);                                                                                                                                        


 lookup_table U_LOOKUP_TABLE(  
     .w_addr(i_lut_bramctl_addr) ,
     .datain(i_lut_bramctl_wdata[LUT_WIDTH-1 : 0]) ,
     .clka  (i_clk) ,
     .rst   (i_rst_n) ,
     .we    (i_lut_bramctl_we) ,    
     //.re    () ,
	   .addr0 (i_lut_raddr[ADDR_WIDTH*(0+1)-1:ADDR_WIDTH*0]) ,
	   .addr1 (i_lut_raddr[ADDR_WIDTH*(1+1)-1:ADDR_WIDTH*1]) ,
     .addr2 (i_lut_raddr[ADDR_WIDTH*(2+1)-1:ADDR_WIDTH*2]) ,
     .addr3 (i_lut_raddr[ADDR_WIDTH*(3+1)-1:ADDR_WIDTH*3]) ,
     .addr4 (i_lut_raddr[ADDR_WIDTH*(4+1)-1:ADDR_WIDTH*4]) ,
     .addr5 (i_lut_raddr[ADDR_WIDTH*(5+1)-1:ADDR_WIDTH*5]) ,
     .addr6 (i_lut_raddr[ADDR_WIDTH*(6+1)-1:ADDR_WIDTH*6]) ,
     .addr7 (i_lut_raddr[ADDR_WIDTH*(7+1)-1:ADDR_WIDTH*7]) ,
     .addr8 (i_lut_raddr[ADDR_WIDTH*(8+1)-1:ADDR_WIDTH*8]) ,
     .addr9 (i_lut_raddr[ADDR_WIDTH*(9+1)-1:ADDR_WIDTH*9]) ,
     .addr10(i_lut_raddr[ADDR_WIDTH*(10+1)-1:ADDR_WIDTH*10]) ,
     .addr11(i_lut_raddr[ADDR_WIDTH*(11+1)-1:ADDR_WIDTH*11]) ,
     .addr12(i_lut_raddr[ADDR_WIDTH*(12+1)-1:ADDR_WIDTH*12]) ,
     .addr13(i_lut_raddr[ADDR_WIDTH*(13+1)-1:ADDR_WIDTH*13]) ,
     .addr14(i_lut_raddr[ADDR_WIDTH*(14+1)-1:ADDR_WIDTH*14]) ,
     .addr15(i_lut_raddr[ADDR_WIDTH*(15+1)-1:ADDR_WIDTH*15]) ,
     .addr16(i_lut_raddr[ADDR_WIDTH*(16+1)-1:ADDR_WIDTH*16]) ,
     .addr17(i_lut_raddr[ADDR_WIDTH*(17+1)-1:ADDR_WIDTH*17]) ,
     .addr18(i_lut_raddr[ADDR_WIDTH*(18+1)-1:ADDR_WIDTH*18]) ,
     .addr19(i_lut_raddr[ADDR_WIDTH*(19+1)-1:ADDR_WIDTH*19]) ,
     .addr20(i_lut_raddr[ADDR_WIDTH*(20+1)-1:ADDR_WIDTH*20]) ,
     .addr21(i_lut_raddr[ADDR_WIDTH*(21+1)-1:ADDR_WIDTH*21]) ,
     .addr22(i_lut_raddr[ADDR_WIDTH*(22+1)-1:ADDR_WIDTH*22]) ,
     .addr23(i_lut_raddr[ADDR_WIDTH*(23+1)-1:ADDR_WIDTH*23]) ,
     .addr24(i_lut_raddr[ADDR_WIDTH*(24+1)-1:ADDR_WIDTH*24]) ,
     .addr25(i_lut_raddr[ADDR_WIDTH*(25+1)-1:ADDR_WIDTH*25]) ,
     .addr26(i_lut_raddr[ADDR_WIDTH*(26+1)-1:ADDR_WIDTH*26]) ,
     .addr27(i_lut_raddr[ADDR_WIDTH*(27+1)-1:ADDR_WIDTH*27]) ,
     .addr28(i_lut_raddr[ADDR_WIDTH*(28+1)-1:ADDR_WIDTH*28]) ,
     .addr29(i_lut_raddr[ADDR_WIDTH*(29+1)-1:ADDR_WIDTH*29]) ,
     .addr30(i_lut_raddr[ADDR_WIDTH*(30+1)-1:ADDR_WIDTH*30]) ,
     .addr31(i_lut_raddr[ADDR_WIDTH*(31+1)-1:ADDR_WIDTH*31]) ,
     .data0 (o_lut_dat[LUT_WIDTH*(0+1)-1:LUT_WIDTH*0]) , 
     .data1 (o_lut_dat[LUT_WIDTH*(1+1)-1:LUT_WIDTH*1]) ,
     .data2 (o_lut_dat[LUT_WIDTH*(2+1)-1:LUT_WIDTH*2]) ,
     .data3 (o_lut_dat[LUT_WIDTH*(3+1)-1:LUT_WIDTH*3]) ,
     .data4 (o_lut_dat[LUT_WIDTH*(4+1)-1:LUT_WIDTH*4]) ,
     .data5 (o_lut_dat[LUT_WIDTH*(5+1)-1:LUT_WIDTH*5]) ,
     .data6 (o_lut_dat[LUT_WIDTH*(6+1)-1:LUT_WIDTH*6]) ,
     .data7 (o_lut_dat[LUT_WIDTH*(7+1)-1:LUT_WIDTH*7]) ,
     .data8 (o_lut_dat[LUT_WIDTH*(8+1)-1:LUT_WIDTH*8]) ,
     .data9 (o_lut_dat[LUT_WIDTH*(9+1)-1:LUT_WIDTH*9]) , 
     .data10(o_lut_dat[LUT_WIDTH*(10+1)-1:LUT_WIDTH*10]) ,
     .data11(o_lut_dat[LUT_WIDTH*(11+1)-1:LUT_WIDTH*11]) ,
     .data12(o_lut_dat[LUT_WIDTH*(12+1)-1:LUT_WIDTH*12]) ,
     .data13(o_lut_dat[LUT_WIDTH*(13+1)-1:LUT_WIDTH*13]) ,
     .data14(o_lut_dat[LUT_WIDTH*(14+1)-1:LUT_WIDTH*14]) ,
     .data15(o_lut_dat[LUT_WIDTH*(15+1)-1:LUT_WIDTH*15]) ,
     .data16(o_lut_dat[LUT_WIDTH*(16+1)-1:LUT_WIDTH*16]) ,
     .data17(o_lut_dat[LUT_WIDTH*(17+1)-1:LUT_WIDTH*17]) ,
     .data18(o_lut_dat[LUT_WIDTH*(18+1)-1:LUT_WIDTH*18]) ,
     .data19(o_lut_dat[LUT_WIDTH*(19+1)-1:LUT_WIDTH*19]) ,
     .data20(o_lut_dat[LUT_WIDTH*(20+1)-1:LUT_WIDTH*20]) ,
     .data21(o_lut_dat[LUT_WIDTH*(21+1)-1:LUT_WIDTH*21]) ,
     .data22(o_lut_dat[LUT_WIDTH*(22+1)-1:LUT_WIDTH*22]) ,
     .data23(o_lut_dat[LUT_WIDTH*(23+1)-1:LUT_WIDTH*23]) ,
     .data24(o_lut_dat[LUT_WIDTH*(24+1)-1:LUT_WIDTH*24]) ,
     .data25(o_lut_dat[LUT_WIDTH*(25+1)-1:LUT_WIDTH*25]) ,
     .data26(o_lut_dat[LUT_WIDTH*(26+1)-1:LUT_WIDTH*26]) ,
     .data27(o_lut_dat[LUT_WIDTH*(27+1)-1:LUT_WIDTH*27]) ,
     .data28(o_lut_dat[LUT_WIDTH*(28+1)-1:LUT_WIDTH*28]) ,
     .data29(o_lut_dat[LUT_WIDTH*(29+1)-1:LUT_WIDTH*29]) ,
     .data30(o_lut_dat[LUT_WIDTH*(30+1)-1:LUT_WIDTH*30]) ,
     .data31(o_lut_dat[LUT_WIDTH*(31+1)-1:LUT_WIDTH*31])




    );                                                                                                                                 
/*                                                                                        
  genvar i;
    generate
        for(i = 0; i < 32; i = i +1)begin                                                                                                                                          
    				simple_dual_port_ram #(                                                                                                               
    				  .RAM_WIDTH(LUT_WIDTH),                       // Specify RAM data width                                                                     
    				  .RAM_DEPTH(LUT_DEPTH),                     // Specify RAM depth (number of entries)                                                      
    				  .ADDR_WIDTH(ADDR_WIDTH),                      // Specify RAM address width                                                                  
    				  .RAM_PERFORMANCE("LOW_LATENCY"),    // Select "HIGH_PERFORMANCE" or "LOW_LATENCY"                                                   
    				  .INIT_FILE("X:/2018workfile/WangMengDi/npu_lstm_v/npupro0417/dma/src/test_act_fun/init_lut_bram.txt")                        // Specify name/location of RAM initialization file if using one (leave blank if not) 
    				) lut_ram (                                                                                                                           
    				  .clk(i_clk),     // Clock                                                                                                           
    				  //Write Port                                                                                                                        
    				  .a_addr(i_lut_bramctl_addr),   // Write address bus, width determined from RAM_DEPTH                                                        
    				  .a_din(i_lut_bramctl_wdata[LUT_WIDTH-1 : 0]),     // RAM input data, width determined from RAM_WIDTH                                                  
    				  .a_wren(i_lut_bramctl_we),       // Write enable
    				  //.a_wren(1'b0),       // Write enable                                                                
    				  //Read port                                                                                                                         
    				  .b_rst(~i_rst_n),     // Output reset (does not affect memory contents)                                                             
    				  .b_addr(i_lut_raddr[ADDR_WIDTH*(i+1)-1:ADDR_WIDTH*i]),   // Read address bus, width determined from RAM_DEPTH                                                         
    				  .b_rden(i_lut_rd_en),         // Read Enable, for additional power savings, disable when not in use                                                                                                                           
    				  .b_dout(o_lut_dat[LUT_WIDTH*(i+1)-1:LUT_WIDTH*i])    // RAM output data, width determined from RAM_WIDTH                                                       
    				);    
    end
    endgenerate   
    simple_dual_port_ram #(                                                                                                               
    				  .RAM_WIDTH(LUT_WIDTH),                       // Specify RAM data width                                                                     
    				  .RAM_DEPTH(LUT_DEPTH),                     // Specify RAM depth (number of entries)                                                      
    				  .ADDR_WIDTH(ADDR_WIDTH),                      // Specify RAM address width                                                                  
    				  .RAM_PERFORMANCE("LOW_LATENCY"),    // Select "HIGH_PERFORMANCE" or "LOW_LATENCY"                                                   
    				  .INIT_FILE("X:/2018workfile/WangMengDi/npu_lstm_v/npupro0417/dma/src/test_act_fun/init_lut_bram.txt")                        // Specify name/location of RAM initialization file if using one (leave blank if not) 
    				) lut_ram0 (                                                                                                                           
    				  .clk(i_clk),     // Clock                                                                                                           
    				  //Write Port                                                                                                                        
    				  .a_addr(i_lut_bramctl_addr),   // Write address bus, width determined from RAM_DEPTH                                                        
    				  .a_din(i_lut_bramctl_wdata[LUT_WIDTH-1 : 0]),     // RAM input data, width determined from RAM_WIDTH                                                  
    				  .a_wren(i_lut_bramctl_we),       // Write enable 
    				  //.a_wren(1'b0),       // Write enable                                                                 
    				  //Read port                                                                                                                         
    				  .b_rst(~i_rst_n),     // Output reset (does not affect memory contents)                                                             
    				  .b_addr(i_lut_raddr[ADDR_WIDTH-1:0]),   // Read address bus, width determined from RAM_DEPTH                                                         
    				  .b_rden(i_lut_rd_en),         // Read Enable, for additional power savings, disable when not in use                                                                                                                           
    				  .b_dout(o_lut_dat[LUT_WIDTH-1:0])    // RAM output data, width determined from RAM_WIDTH                                                       
    				);                                                                                                                                    
*/                                                                                                                                  
endmodule                                                                                                                                 