`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/27 23:15:33
// Design Name: 
// Module Name: tb_npe_core_wrapper
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


module tb_npe_core_wrapper;
   
     
    // reset initial 
    
  
    
    ///////////////////////////////////////////////////////////////////////
    reg  i_clk                        ;
    reg  i_rst_n                      ;
    reg  i_start_npu                  ;
    reg  i_stop_npu                   ;
    wire [31:0] o_src_start           ;
    wire [31:0] o_dest_start          ;
    wire [31:0] o_d_lines             ; 
    wire [3:0] o_dma_mode             ;
    wire o_ex_dma                     ;
    wire i_dma_finish                  ; 
    wire o_npu_idle                   ;        
    wire o_internal_stop              ;
    wire          i_iob_0_bramctl_en   ; // Chip Enable Signal (optional)
    wire [255:0] o_iob_0_bramctl_rdata; // Data Out Bus (optional)
    wire [255:0]  i_iob_0_bramctl_wdata; // Data In Bus (optional)
    wire [31:0]   i_iob_0_bramctl_we   ; // Byte Enables (optional)
    wire [16:0]   i_iob_0_bramctl_addr ; // Address Signal (required)
    wire          i_iob_0_bramctl_s_clk; // Clock Signal (required)
    wire          i_iob_0_bramctl_s_rst; // Reset Signal (required)
    wire          i_iob_1_bramctl_en   ; // Chip Enable Signal (optional)
    wire [255:0] o_iob_1_bramctl_rdata; // Data Out Bus (optional)
    wire [255:0]  i_iob_1_bramctl_wdata; // Data In Bus (optional)
    wire [31:0]   i_iob_1_bramctl_we   ; // Byte Enables (optional)
    wire [16:0]   i_iob_1_bramctl_addr ; // Address Signal (required)
    wire          i_iob_1_bramctl_s_clk; // Clock Signal (required)
    wire          i_iob_1_bramctl_s_rst; // Reset Signal (required)

    wire          i_wb_bramctl_en    ; // Chip Enable Signal (optional)
    wire [31:0]  o_wb_bramctl_rdata ; // Data Out Bus (optional)
    wire [415:0]   i_wb_bramctl_wdata ; // Data In Bus (optional)
    wire [3:0]    i_wb_bramctl_we    ; // Byte Enables (optional)
    wire [17:0]   i_wb_bramctl_addr  ; // Address Signal (required)                                  
    wire          i_wb_bramctl_s_clk ; // Clock Signal (required)
    wire          i_wb_bramctl_s_rst ; // Reset Signal (required)
    wire          i_wib_bramctl_en   ; // Chip Enable Signal (optional)
    wire[31:0]   o_wib_bramctl_rdata; // Data Out Bus (optional)
    wire [31:0]   i_wib_bramctl_wdata; // Data In Bus (optional)
    wire [3:0]    i_wib_bramctl_we   ; // Byte Enables (optional)
    wire [11:0]   i_wib_bramctl_addr ; // Address Signal (required)                
    wire          i_wib_bramctl_s_clk; // Clock Signal (required)
    wire          i_wib_bramctl_s_rst;  // Reset Signal (required)

    wire             i_bias_bramctl_en   ; // Chip Enable Signal (optional)
    wire  [511:0]   o_bias_bramctl_rdata; // Data Out Bus (optional)
    wire   [511:0]   i_bias_bramctl_wdata; // Data In Bus (optional)
    wire   [63:0]    i_bias_bramctl_we   ; // Byte Enables (optional)
    wire   [11:0]    i_bias_bramctl_addr ; // Address Signal (required)                
    wire             i_bias_bramctl_s_clk; // Clock Signal (required)
    wire             i_bias_bramctl_s_rst;  // Reset Signal (required) 
    
     wire          i_inst_bramctl_en   ; // Chip Enable Signal (optional)
    wire[128:0]   o_inst_bramctl_rdata; // Data Out Bus (optional)
    wire [128:0]   i_inst_bramctl_wdata = 0; // Data In Bus (optional)
    wire [15:0]    i_inst_bramctl_we   = 0; // Byte Enables (optional)
    wire [18:0]    i_inst_bramctl_addr = 0; // Address Signal (required)                
    wire           i_inst_bramctl_s_clk; // Clock Signal (required)
    wire           i_inst_bramctl_s_rst; // Reset Signal (required) 
    //////////////////////////////////////////////////////////////////////////////////
    wire   data_all_clka  ;
    wire   data_all_ena   ;
    wire  [0 : 0]   data_all_wea   ;
    wire  [15 : 0]  data_all_addra ;
    wire  [255 : 0] data_all_dina  ;
    wire  [255 : 0] data_all_douta ; 
    
    wire  weight_all_clka              ;
    wire  weight_all_ena               ;
    wire  [0 : 0]    weight_all_wea    ;
    wire  [19 : 0]   weight_all_addra  ;
    wire  [415 : 0]  weight_all_dina   ;
    wire  [415 : 0]  weight_all_douta  ;  
    
    wire  weight_index_all_clka          ;
    wire  weight_index_all_ena           ;
    wire [0 : 0]  weight_index_all_wea   ;
    wire [13 : 0] weight_index_all_addra ;
    wire [31 : 0] weight_index_all_dina  ;
    wire [18 : 0] weight_index_all_douta ;  
    
    wire  bias_all_ena                  ;
    wire [0 : 0]   bias_all_wea         ;
    wire [9 : 0]   bias_all_addra       ;
    wire [511 : 0] bias_all_dina        ;
    wire [511 : 0] bias_all_douta       ;
    

    /////////////////////////////////////////////////////////////////////////////
     initial begin
    
         i_clk = 1;
         forever #5 i_clk = ~i_clk;   // 100Mhz clock
    end
      initial    begin
         i_rst_n = 1;
         #20 i_rst_n = 0;
         #10 i_rst_n = 1;
    end 
    
    initial
      begin
    ///////////////////////////ѡ���޷������Ƚ�,ѡ����Сֵ///////////////////////////////////////////////
       i_start_npu=0;
      
       #200 i_start_npu =1;
       #10 i_start_npu =0;
  
       #100000000
       //if(inst_npe_core_wrapper.o_calculate_end)
                   $fclose(f_xpe);
    $finish;    
    end
    
   /*
     always @(posedge i_clk)
     begin
            if(inst_npe_core_wrapper.u_inst_ctrl.o_calculate_enable)begin
            inst_npe_core_wrapper.u_inst_ctrl.i_calculate_end =0;
            #200 inst_npe_core_wrapper.u_inst_ctrl.i_calculate_end =1;   
            end 
     end
    */ 
   //  always @(posedge i_clk)
   //       begin
   //              if(o_ex_dma)begin
   //              #200 i_dma_finish =1;
   //               #10  i_dma_finish =0;
   //               end  
   //       end
          
       
     ///////////////////////////////////////////////////////////////////////////////////////
    npe_core_wrapper inst_npe_core_wrapper
   (
     .i_clk                 (i_clk                ),
     .i_rst_n               (i_rst_n              ),
     .i_start_npu           (i_start_npu          ),
     .i_stop_npu            (i_stop_npu           ),
     .o_src_start           (o_src_start          ),
     .o_dest_start          (o_dest_start         ),
     .o_d_lines             (o_d_lines            ), 
     .o_dma_mode            (o_dma_mode           ),
     .o_ex_dma              (o_ex_dma             ),
     .i_dma_finish          (i_dma_finish         ), 
     .o_npu_idle            (o_npu_idle           ),        
     .o_internal_stop       (o_internal_stop      ),
     .i_iob_0_bramctl_en    (i_iob_0_bramctl_en   ), // Chip Enable Signal (optional)
     .o_iob_0_bramctl_rdata (o_iob_0_bramctl_rdata), // Data Out Bus (optional)
     .i_iob_0_bramctl_wdata (i_iob_0_bramctl_wdata), // Data In Bus (optional)
     .i_iob_0_bramctl_we    (i_iob_0_bramctl_we   ), // Byte Enables (optional)
     .i_iob_0_bramctl_addr  (i_iob_0_bramctl_addr ), // Address Signal (required)
     .i_iob_0_bramctl_s_clk (i_iob_0_bramctl_s_clk), // Clock Signal (required)
     .i_iob_0_bramctl_s_rst (i_iob_0_bramctl_s_rst), // Reset Signal (required)
     .i_iob_1_bramctl_en    (i_iob_1_bramctl_en   ), // Chip Enable Signal (optional)
     .o_iob_1_bramctl_rdata (o_iob_1_bramctl_rdata), // Data Out Bus (optional)
     .i_iob_1_bramctl_wdata (i_iob_1_bramctl_wdata), // Data In Bus (optional)
     .i_iob_1_bramctl_we    (i_iob_1_bramctl_we   ), // Byte Enables (optional)
     .i_iob_1_bramctl_addr  (i_iob_1_bramctl_addr ), // Address Signal (required)
     .i_iob_1_bramctl_s_clk (i_iob_1_bramctl_s_clk), // Clock Signal (required)
     .i_iob_1_bramctl_s_rst (i_iob_1_bramctl_s_rst), // Reset Signal (required)
     .i_wb_bramctl_en       (i_wb_bramctl_en      ), // Chip Enable Signal (optional)
     .o_wb_bramctl_rdata    (o_wb_bramctl_rdata   ), // Data Out Bus (optional)
     .i_wb_bramctl_wdata    (i_wb_bramctl_wdata   ), // Data In Bus (optional)
     .i_wb_bramctl_we       (i_wb_bramctl_we      ), // Byte Enables (optional)
     .i_wb_bramctl_addr     (i_wb_bramctl_addr    ), // Address Signal (required)                                  
     .i_wb_bramctl_s_clk    (i_wb_bramctl_s_clk   ), // Clock Signal (required)
     .i_wb_bramctl_s_rst    (i_wb_bramctl_s_rst   ), // Reset Signal (required)
     .i_wib_bramctl_en      (i_wib_bramctl_en     ), // Chip Enable Signal (optional)
     .o_wib_bramctl_rdata   (o_wib_bramctl_rdata  ), // Data Out Bus (optional)
     .i_wib_bramctl_wdata   (i_wib_bramctl_wdata  ), // Data In Bus (optional)
     .i_wib_bramctl_we      (i_wib_bramctl_we     ), // Byte Enables (optional)
     .i_wib_bramctl_addr    (i_wib_bramctl_addr   ), // Address Signal (required)                
     .i_wib_bramctl_s_clk   (i_wib_bramctl_s_clk  ), // Clock Signal (required)
     .i_wib_bramctl_s_rst   (i_wib_bramctl_s_rst  ),  // Reset Signal (required)
     .i_bias_bramctl_en     (i_bias_bramctl_en    ), // Chip Enable Signal (optional)
     .o_bias_bramctl_rdata  (o_bias_bramctl_rdata ), // Data Out Bus (optional)
     .i_bias_bramctl_wdata  (i_bias_bramctl_wdata ), // Data In Bus (optional)
     .i_bias_bramctl_we     (i_bias_bramctl_we    ), // Byte Enables (optional)
     .i_bias_bramctl_addr   (i_bias_bramctl_addr  ), // Address Signal (required)                
     .i_bias_bramctl_s_clk  (i_bias_bramctl_s_clk ), // Clock Signal (required)
     .i_bias_bramctl_s_rst  (i_bias_bramctl_s_rst ),  // Reset Signal (required)    
     .i_inst_bramctl_en     (i_inst_bramctl_en    ), // Chip Enable Signal (optional)
     .o_inst_bramctl_rdata  (o_inst_bramctl_rdata ), // Data Out Bus (optional)
     .i_inst_bramctl_wdata  (i_inst_bramctl_wdata ), // Data In Bus (optional)
     .i_inst_bramctl_we     (i_inst_bramctl_we    ), // Byte Enables (optional)
     .i_inst_bramctl_addr   (i_inst_bramctl_addr  ), // Address Signal (required)                
     .i_inst_bramctl_s_clk  (i_inst_bramctl_s_clk ), // Clock Signal (required)
     .i_inst_bramctl_s_rst  (i_inst_bramctl_s_rst )// Reset Signal (required) 
     

  );
  
  data_mover u_data_mover(
	.sys_clk             (i_clk),
	.rst_n               (i_rst_n),
	.clr                 (o_ex_dma),
	.en                  (),
	.dma_mode            (o_dma_mode),
	.src_addr_start (o_src_start),
	.dest_addr_start     (o_dest_start),
	.d_lines             (o_d_lines),
	.douta_d_all         (data_all_douta ),
	.dina_d_all          (data_all_dina),
	.addr_d_all          (data_all_addra),
	.wea_d_all           (data_all_wea),
	.ena_d_all           (data_all_ena),
	.douta_w_all         (weight_all_douta),
	.addr_w_all          (weight_all_addra),
	.wea_w_all           (weight_all_wea  ),
	.ena_w_all           (weight_all_ena  ),
	.douta_i_all         (weight_index_all_douta),
	.addr_i_all          (weight_index_all_addra),
	.wea_i_all           (weight_index_all_wea),
	.ena_i_all           (weight_index_all_ena),	
	.douta_b_all         (bias_all_douta),
	.addr_b_all          (bias_all_addra),
	.wea_b_all           (bias_all_wea  ),
	.ena_b_all           (bias_all_ena  ),	
	.index_addr          (i_wib_bramctl_addr ),
	.dina_index          (i_wib_bramctl_wdata),
	.wea_index           (i_wib_bramctl_we   ),
	.ena_index           (i_wib_bramctl_en   ),
	.bias_addr           (i_bias_bramctl_addr ),
	.dina_bias           (i_bias_bramctl_wdata),
	.wea_bias            (i_bias_bramctl_we   ),
	.ena_bias            (i_bias_bramctl_en   ),	
	.w_addr              (i_wb_bramctl_addr),
	.dina_w              (i_wb_bramctl_wdata),
	.wea_weight          (i_wb_bramctl_we),
	.ena_weight          (i_wb_bramctl_en),
	.data_1              (o_iob_0_bramctl_rdata),
	.data_2              (o_iob_1_bramctl_rdata),
	.data_addr_1         (i_iob_0_bramctl_addr),
	.data_addr_2         (i_iob_1_bramctl_addr),
	.dina_d_1            (i_iob_0_bramctl_wdata),
	.dina_d_2            (i_iob_1_bramctl_wdata),
	.wea_d_1             (i_iob_0_bramctl_we),
	.wea_d_2             (i_iob_1_bramctl_we),
	.ena_d_1             (i_iob_0_bramctl_en),
	.ena_d_2             (i_iob_1_bramctl_en),
	.finish              (i_dma_finish )
);

data_all u_data_all (
  .clka (i_clk  ),    // input wire clka
  .ena  (data_all_ena   ),      // input wire ena
  .wea  (data_all_wea   ),      // input wire [0 : 0]  wea
  .addra(data_all_addra ),      // input wire [15 : 0] addra
  .dina (data_all_dina  ),      // input wire [255 : 0] dina
  .douta(data_all_douta )      // output wire [255 : 0] douta
);
/*
weight_all u_weight_all (
  .clka (i_clk ),    // input wire clka
  .ena  (weight_all_ena  ),      // input wire ena
  .wea  (weight_all_wea  ),      // input wire [0 : 0]  wea
  .addra(weight_all_addra),      // input wire [14 : 0] addra
  .dina (weight_all_dina ),      // input wire [415 : 0] dina
  .douta(weight_all_douta)      // output wire [415 : 0] douta
);
*/
weight_index_all u_weight_index_all (
  .clka (i_clk ) ,    // input wire clka
  .ena  (weight_index_all_ena  )  ,      // input wire ena
  .wea  (weight_index_all_wea  )  ,      // input wire [0 : 0] wea
  .addra(weight_index_all_addra),        // input wire [13 : 0] addra
  .dina (weight_index_all_dina ) ,       // input wire [18 : 0] dina
  .douta(weight_index_all_douta)        // output wire [18 : 0] douta
);

simple_dual_port_ram #(                                                                                                    
//  Xilinx Simple Dual Port Single Clock RAM                                                                                      
//  This code implements a parameterizable SDP single clock memory.                                                               
//  If a reset or enable is not necessary, it may be tied off or removed from the code.                                           
  .RAM_WIDTH ( 416   ),                  // Specify RAM data width                                                            
  .RAM_DEPTH ( 262144),                // Specify RAM depth (number of entries)                                             
  .ADDR_WIDTH( 20    ),                 // Specify RAM address width                                                           
  .INIT_FILE (   "X:/2018workfile/npu0509/npupro0417/dma/coe_file/all_resnet/weight.txt"  )                // Specify name/location of RAM initialization file if using one (leave blank if not)
                                                                                                                                  
) wb_all (                                                                                                                               
  .a_addr (),       // Write address bus, width determined from RAM_DEPTH                                      
  .b_addr (weight_all_addra),       // Read address bus, width determined from RAM_DEPTH                                       
  .a_din  (weight_all_dina),         // RAM input data                                                                          
  .clk    (i_clk),                           // Clock                                                                                   
  .a_wren (),                        // Write enable                                                                            
  .b_rden (weight_all_ena),                        // Read Enable, for additional power savings, disable when not in use                      
  .b_rst  (),                         // Output reset (does not affect memory contents)                                          
  .b_regce(),                       // Output register enable                                                                  
  .b_dout (weight_all_douta)       // RAM output data                                                                         
); 
  
/*
simple_dual_port_ram #(                                                                                                    
//  Xilinx Simple Dual Port Single Clock RAM                                                                                      
//  This code implements a parameterizable SDP single clock memory.                                                               
//  If a reset or enable is not necessary, it may be tied off or removed from the code.                                           
  .RAM_WIDTH ( 416   ),                  // Specify RAM data width                                                            
  .RAM_DEPTH ( 338),                // Specify RAM depth (number of entries)                                             
  .ADDR_WIDTH( 20    ),                 // Specify RAM address width                                                           
  .INIT_FILE (   "/home/tingting/npupro0417/dma/coe_file/conv2a2a/weight2.txt"  )                // Specify name/location of RAM initialization file if using one (leave blank if not)
                                                                                                                                  
) wb_all (                                                                                                                               
  .a_addr (),       // Write address bus, width determined from RAM_DEPTH                                      
  .b_addr (weight_all_addra),       // Read address bus, width determined from RAM_DEPTH                                       
  .a_din  (weight_all_dina),         // RAM input data                                                                          
  .clk    (i_clk),                           // Clock                                                                                   
  .a_wren (),                        // Write enable                                                                            
  .b_rden (weight_all_ena),                        // Read Enable, for additional power savings, disable when not in use                      
  .b_rst  (),                         // Output reset (does not affect memory contents)                                          
  .b_regce(),                       // Output register enable                                                                  
  .b_dout (weight_all_douta)       // RAM output data                                                                         
); */
            
bias_all u_bias_all (
  .clka(i_clk),    // input wire clka
  .ena   (bias_all_ena   ),      // input wire ena
  .wea   (bias_all_wea   ),      // input wire [0 : 0]  wea
  .addra (bias_all_addra  ),  // input wire    [9 : 0]  addra
  .dina  (bias_all_dina  ),    // input wire   [511 : 0] dina
  .douta (bias_all_douta )  // output wire     [511 : 0] douta
);
   
    reg [19:0]r_debug_counter;
    integer f_pe;
    integer f_xpe;
    
   // initial begin
   //     f_pe =  $fopen("result.txt");
   //     r_debug_counter=20'd0;
   //     forever begin
   //         @(posedge clk)begin
   //             if(inst_npe_core_wrapper.u_npe_core.c_npe_result_vld) begin
   //                 $fdisplay(f_pe, "%H", inst_npe_core_wrapper.u_npe_core.c_npe_result);
   //                 r_debug_counter<=r_debug_counter+20'd1;
   //                 $fflush(f_pe);
   //             end
   //             if(o_calculate_end)
   //                 $fclose(f_pe);
   //         end
   //     end
   // end
      initial begin
       f_xpe =  $fopen("xpe_result.txt");
       r_debug_counter=20'd0;
       forever begin
           @(posedge i_clk)begin
               if(inst_npe_core_wrapper.u_npe_core.c_xpe_dat_vld) begin
                   $fdisplay(f_xpe, "%H", inst_npe_core_wrapper.u_npe_core.c_xpe_dat_out);
              // if(inst_npe_core_wrapper.u_npe_core.u_xpe.r_npe_dat_vld_r) begin
               //  $fdisplay(f_xpe, "%H", inst_npe_core_wrapper.u_npe_core.u_xpe.o_bias_dat_o);
              // if(inst_npe_core_wrapper.u_npe_core.c_npe_result_vld) begin
              //   $fdisplay(f_xpe, "%H", inst_npe_core_wrapper.u_npe_core.c_npe_result);
                   r_debug_counter<=r_debug_counter+20'd1;
                   $fflush(f_xpe);
               end
             
           end
       end
   end


    integer allcount;
    integer outputcount;
    integer f_ram,i;
    integer  f_output;

    initial begin
       // i_calculate_enable= 1'd0;
        allcount=inst_npe_core_wrapper.c_part_num*inst_npe_core_wrapper.c_o_y_length*inst_npe_core_wrapper.c_o_piece_num*inst_npe_core_wrapper.c_i_piece_num*inst_npe_core_wrapper.c_kernel*inst_npe_core_wrapper.c_kernel;
        outputcount = inst_npe_core_wrapper.c_o_piece_num*inst_npe_core_wrapper.c_o_x_length*inst_npe_core_wrapper.c_o_y_length;
        wait(i_rst_n);         
        #70 

        $display("reset done...");

        for(i=0;i<1;i=i+1)
        begin
           
            #20 
            wait(inst_npe_core_wrapper.o_calculate_end);
            #200
            $display("all process over.");
           // $stop();

        end

      //  i_iob_0_ext_en<=1;
/*
        f_ram = $fopen("ioram.txt","w");           
        f_output = $fopen("outputdata.txt","w");  
        for(i=0;i<4096*32;i=i+32) begin
            @(posedge i_clk)begin
                i_iob_0_bramctl_addr<=i;                
                i_iob_0_bramctl_en<=1;
                if(i_iob_0_bramctl_addr>=32) begin
                		if(i<=(outputcount+1)*32)begin                                           
                        $fdisplay(f_output, "%H", o_iob_0_bramctl_rdata);
                        $fflush(f_output); 
                    end                             
                	$fdisplay(f_ram, "%H", o_iob_0_bramctl_rdata);
                    $fflush(f_ram);
                end
            end
        end*/
        @(posedge i_clk)begin
            $fdisplay(f_ram, "%H", o_iob_0_bramctl_rdata);
        end
        $fclose(f_ram);
       // $stop();
    end

endmodule
