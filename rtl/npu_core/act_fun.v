module act_fun(
	input i_clk,
	input i_rst_n,
	input unsigned [3:0] i_q_encode,
   // input unsigned [3:0] w_q_encode,
    //input unsigned [3:0] o_q_encode,
	input [255:0] i_round_dat,
	input [23:0] i_lut_bramctl_wdata,                                                                                                  
  input [3:0]  i_lut_bramctl_addr ,                                                                                                  
  input   i_lut_bramctl_we   ,                                                                                                  
  input        i_lut_bramctl_en   , 
  input [1:0] i_act_mode,  
	output [511:0] o_act_dat,
	output [31:0]  o_max_value_en,
    output [31:0]  o_min_value_en
	
);

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 4;
parameter LUT_WIDTH = 24; 
parameter EQ_WIDTH = 4;
parameter LUT_DEPTH = 16;
//parameter Fixd_Value=$signed(8'h01);

wire [DATA_WIDTH-1:0] round_8b_dat[31:0];
reg [DATA_WIDTH-1:0] r_round_8b_dat[31:0];
reg [DATA_WIDTH-1:0] r2_round_8b_dat[31:0];
wire [ADDR_WIDTH-1:0] act_lut_addr[31:0];

wire [ADDR_WIDTH*32-1:0] i_lut_raddr;
wire [LUT_WIDTH*32-1:0]  o_lut_dat; 

wire [LUT_WIDTH-1:0]  act_coe[31:0];
wire [DATA_WIDTH*2-1 : 0] act_dat[31:0];
wire [EQ_WIDTH-1 : 0] i_shift_num;

wire [31:0]  c_max_value_en;
wire [31:0]  c_min_value_en;



 
assign  i_shift_num =  i_q_encode ;
genvar i;
   generate
       for(i = 0; i < 32; i = i +1)begin
           assign round_8b_dat[i] = i_round_dat[ ((i+1) * DATA_WIDTH - 1) : (i*DATA_WIDTH) ];
          	assign i_lut_raddr[((i+1)*ADDR_WIDTH-1): (i*ADDR_WIDTH)] = act_lut_addr[i];
          	assign act_coe[i] = o_lut_dat[((i+1) * LUT_WIDTH - 1) : (i*LUT_WIDTH)];             
           assign o_act_dat[ ((i+1) * DATA_WIDTH * 2 - 1 ):  (i*DATA_WIDTH * 2) ] = act_dat[i];
       end
   endgenerate

reg [7:0] r_max_value;
reg [7:0] r_min_value;

 always @(*)
 begin
 	case(i_q_encode)
 		4'b0: begin
 			r_max_value = 8'h01;
 			r_min_value = i_act_mode==2'b10 ? 8'h00 :8'hff ;//-1
 		end
 		4'd1: begin
 			r_max_value = 8'h02;
 			r_min_value = i_act_mode==2'b10 ? 8'h00 :8'hfe ;
 		end
 		4'd2: begin
 			r_max_value =  8'h04;
 			r_min_value = i_act_mode==2'b10 ? 8'h00 :8'hfc ;
 		end
 		4'd3: begin
 			r_max_value = 8'h08;
 			r_min_value = i_act_mode==2'b10 ? 8'h00 :8'hf8 ;
 		end
 		4'd4: begin
 			r_max_value = 8'h10;
 			r_min_value = i_act_mode==2'b10 ? 8'h00 :8'hf0 ;
 		end
 		4'd5: begin
 			r_max_value = 8'h20;
 			r_min_value = i_act_mode==2'b10 ? 8'h00 :8'he0  ;
 		end
 		4'd6: begin
 			r_max_value = 8'h40;
 			r_min_value = i_act_mode==2'b10 ? 8'h00 :8'hc0  ;
 		end
 		4'd7: begin
 			r_max_value = 8'h7f;
 			r_min_value = i_act_mode==2'b10 ? 8'h00 :8'h80  ;
 		end
 	endcase
 end
   
   generate
      for(i = 1; i < 32; i = i +1)begin
          lut_addr_gen#(
          	 .ADDR_WIDTH (ADDR_WIDTH),
          	 .DATA_WIDTH (DATA_WIDTH),
          	 .EQ_WIDTH  (EQ_WIDTH),
          	 .LUT_DEPTH (LUT_DEPTH)
          )lut_addr_gen_i  (
          	.i_clk         (i_clk          ),
          	.i_rst_n       (i_rst_n        ),
          	.i_round_dat   (round_8b_dat[i]),
          	.i_shift_num   (i_shift_num    ),
          	.o_act_lut_addr(act_lut_addr[i]),
          	.o_max_value_en(c_max_value_en[i]),
          	.o_min_value_en(c_min_value_en[i])
          );
      end
   endgenerate
   
    lut_addr_gen#(
          	 .ADDR_WIDTH (ADDR_WIDTH),
          	 .DATA_WIDTH (DATA_WIDTH),
          	 .EQ_WIDTH  (EQ_WIDTH),
          	 .LUT_DEPTH (LUT_DEPTH)
          )lut_addr_gen_i0  (
          	.i_clk         (i_clk          ),
          	.i_rst_n       (i_rst_n        ),
          	.i_round_dat   (round_8b_dat[0]),
          	.i_shift_num   (i_shift_num    ),
          	.o_act_lut_addr(act_lut_addr[0]),
          	.o_max_value_en(c_max_value_en[0]),
          	.o_min_value_en(c_min_value_en[0])
          );
          
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
                             r2_round_8b_dat[i] <= {DATA_WIDTH{1'h0}};
                             end
                      else begin  
                             r_round_8b_dat[i] <= round_8b_dat[i];
                             r2_round_8b_dat[i] <= r_round_8b_dat[i];
                      end
                  end
          linear_fun#(
          	 .COE_A_WIDTH  (8),
          	 .COE_B_WIDTH  (16),
          	 .DATA_WIDTH   (DATA_WIDTH)
          )linear_fun_i(
          	 .i_clk       (i_clk       ),                                                                                                         
             .i_rst_n     (i_rst_n     ), 
             .i_act_coe   (act_coe[i]  ),
             .i_dat       (r_round_8b_dat[i]),
             .i_max_value_en(c_max_value_en[i]),
             .i_min_value_en(c_min_value_en[i]),   
             .i_max_value(r_max_value),
             .i_min_value(r_min_value),
             .o_result_dat(act_dat[i]),
             .o_max_value_en(o_max_value_en[i]),
             .o_min_value_en(o_min_value_en[i])
          );
      end
   endgenerate                   
   
    
   
 
	
endmodule