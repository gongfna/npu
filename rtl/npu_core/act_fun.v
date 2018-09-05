module act_fun(
	input i_clk,
	input i_rst_n,
	input unsigned [3:0] i_q_encode,
	input [255:0] i_round_dat,
	input [23:0] i_lut_bramctl_wdata,                                                                                                  
  input [4:0]  i_lut_bramctl_addr ,                                                                                                  
  input   i_lut_bramctl_we   ,                                                                                                  
  input        i_lut_bramctl_en   ,  
	output [511:0] o_act_dat,
	output [3:0] o_act_w_q_encode,
	output [3:0] o_act_o_q_encode
	
	
);

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 5;
parameter LUT_WIDTH = 24; 
parameter EQ_WIDTH = 4;
parameter LUT_DEPTH = 16;


wire [DATA_WIDTH-1:0] round_8b_dat[31:0];
reg [DATA_WIDTH-1:0] r_round_8b_dat[31:0];
wire [ADDR_WIDTH-1:0] act_lut_addr[31:0];

wire [ADDR_WIDTH*32-1:0] i_lut_raddr;
wire [LUT_WIDTH*32-1:0]  o_lut_dat; 

wire [LUT_WIDTH-1:0]  act_coe[31:0];
wire [DATA_WIDTH*2-1 : 0] act_dat[31:0];
wire [LUT_WIDTH-1:0]  q_encode;

assign o_act_w_q_encode = q_encode[19:16];
assign o_act_o_q_encode = q_encode[15:12];
genvar i;
   generate
       for(i = 0; i < 32; i = i +1)begin
           assign round_8b_dat[i] = i_round_dat[ ((i+1) * DATA_WIDTH - 1) : (i*DATA_WIDTH) ];
          	assign i_lut_raddr[((i+1)*ADDR_WIDTH-1): (i*ADDR_WIDTH)] = act_lut_addr[i];
          	assign act_coe[i] = o_lut_dat[((i+1) * LUT_WIDTH - 1) : (i*LUT_WIDTH)];             
           assign o_act_dat[ ((i+1) * DATA_WIDTH * 2 - 1 ):  (i*DATA_WIDTH * 2) ] = act_dat[i];
       end
   endgenerate


   
   generate
      for(i = 0; i < 32; i = i +1)begin
          lut_addr_gen#(
          	 .ADDR_WIDTH (ADDR_WIDTH),
          	 .DATA_WIDTH (DATA_WIDTH),
          	 .EQ_WIDTH  (EQ_WIDTH),
          	 .LUT_DEPTH (LUT_DEPTH)
          )lut_addr_gen_i  (
          	.i_clk         (i_clk          ),
          	.i_rst_n       (i_rst_n        ),
          	.i_round_dat   (round_8b_dat[i]),
          	.i_q_encode    (i_q_encode    ),///////////////
          	.c_q_encode    (q_encode[23:20] ),/////////////////////
          	.o_act_lut_addr(act_lut_addr[i])
          	
          );
      end
   endgenerate
   
  
          
   act_lut_bram#(                                                                                                                        
   // Specify name/location of RAM initialization file if using one (leave blank if not)                                                 
   .LUT_WIDTH  (LUT_WIDTH ),
   .LUT_DEPTH  (LUT_DEPTH ),
   .ADDR_WIDTH (ADDR_WIDTH), 
   .INIT_FILE  ("init_lut_bram.txt")                                                                                                                                                                                                                 
   )act_lut_bram_i(                                                                                                                                    
   .i_clk        (i_clk      ),                                                                                                         
   .i_rst_n      (i_rst_n    ),                                                                                                                                                                                                                           
   .i_lut_raddr  (i_lut_raddr),                                                                                                         
   .i_lut_rd_en  (1'b1),                                                                                                         
   .o_lut_dat    	(o_lut_dat    ),                                                                                                        
   .o_wdata_vld  (o_wdata_vld),  
   .q_encode     (q_encode),                                                                                                                                                                                                                                          
   //external data input port for axi bram controller                                                                                    
   .i_lut_bramctl_wdata (i_lut_bramctl_wdata),                                                                                                  
   .i_lut_bramctl_addr  (i_lut_bramctl_addr ),                                                                                                  
   .i_lut_bramctl_we    (i_lut_bramctl_we   ),                                                                                                  
   .i_lut_bramctl_en    (i_lut_bramctl_en   )                                                                                                
                                                                                             
   );

   generate
      for(i = 0; i < 32; i = i +1)begin
      always @(posedge i_clk or negedge i_rst_n) begin
                      if (!i_rst_n)begin
                             r_round_8b_dat[i] <= {DATA_WIDTH{1'h0}};
                             end
                      else begin  
                             r_round_8b_dat[i] <= round_8b_dat[i];                            
                      end
                  end
          linear_fun#(
          	 .COE_A_WIDTH  (8),
          	 .COE_B_WIDTH  (16),
          	 .DATA_WIDTH   (DATA_WIDTH)
          )linear_fun_i(
          	 .i_clk       (i_clk       ),                                                                                                         
             .i_rst_n     (i_rst_n     ), 
             .i_act_coe   (act_coe[i]),
             .i_dat       (r_round_8b_dat[i]),
             .o_result_dat (act_dat[i])             
          );
      end
   endgenerate                   
   
    
   
 
	
endmodule