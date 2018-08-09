`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:26 01/08/2018 
// Design Name: 
// Module Name:    npe 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// pe_en control modified at 2018-02-08
// addģʽ��wdata��wdata_vld��һ��
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`default_nettype none
module npe #(
    parameter   DATA_WIDTH      =   8   ,
    parameter   DATA_COPIES     =   32  ,
    parameter   INDEX_WIDTH     =   5   
) (
    input  wire                                             i_clk           ,
    input  wire                                             i_rst_n         ,
    input  wire[2:0]                                        i_npe_mode      ,
    input  wire                                             i_sorter_op     ,
    input  wire[DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:0]   i_wdata         ,
    input  wire                                             i_wdata_vld     ,
    input  wire[DATA_COPIES*DATA_WIDTH-1:0]                 i_mdata         ,
    input  wire                                             i_mdata_vld     ,
    output wire[DATA_COPIES*2*DATA_WIDTH-1:0]               o_npe_result    ,
    output wire                                             o_npe_result_vld,
    input  wire                                             i_pe_conv_out   ,
    input  wire[6:0]                                        i_pe_en         ,
    input  wire                                             i_pe_max_out    ,
    input  wire                                             i_pe_fc_out, 
    input  wire [4:0]                                     last_line_sorter_num,  
    input  wire                                             i_sorter_out   
);

//////////////////////////////////////////////////////////////////////////////////
    wire[6:0]                           pe_mac_ld_en        ;
    wire[6:0]                           pe_mac_clear        ;
    wire                                pe_max_clear        ;
    wire  [255:0] sorter_result;

    wire[6:0]                           pe_mac_en           ;
    wire                                pe_max_en           ;
    wire       pe_acc_en   ;
   // wire  [255:0] sorter_result;
    wire  sorter_valid ;
    wire  last_sort_o  ;
    wire  sorter_clr   ;
    wire  pe_acc_clear ;
 //   wire  i_sorter_out ;
   wire[DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:0]  wdata[7:0]      ;
    wire                                            wdata_vld[7:0]  ;
    wire[DATA_COPIES*DATA_WIDTH-1:0]                mdata[7:0]      ;
    wire                                            mdata_vld[7:0]  ;
    wire[DATA_COPIES*2*DATA_WIDTH-1:0]              mac_result[6:0] ;
    wire[DATA_COPIES*2*DATA_WIDTH-1:0]              max_result      ;
    wire [DATA_COPIES*2*DATA_WIDTH-1:0] acc_result;
    wire[DATA_COPIES*2*DATA_WIDTH-1:0]              add_result      ;

	pe_ctr # (
        .DATA_WIDTH             (DATA_WIDTH         ), 
        .DATA_COPIES            (DATA_COPIES        )
    ) pe_ctr_inst (
		.i_clk                  (i_clk              ), 
		.i_rst_n                (i_rst_n            ), 
		.i_npe_mode             (i_npe_mode         ), 
		.i_mdata_vld            (i_mdata_vld        ), 
		.i_wdata_vld            (i_wdata_vld        ), 
		.i_pe_en                (i_pe_en            ), 
		.i_sorter_op 						(i_sorter_op),
		.i_pe_conv_out          (i_pe_conv_out      ), 
		.i_pe_fc_out            (i_pe_fc_out        ), 
		.i_pe_max_out           (i_pe_max_out       ), 
		.i_sorter_out			(last_sort_o),///////////////////////////////
		.o_npe_result           (o_npe_result       ), 
		.o_npe_result_vld       (o_npe_result_vld   ), 
		.o_pe_mac_ld_en         (pe_mac_ld_en       ), 
		.o_pe_mac_clear         (pe_mac_clear       ), 
		.o_pe_max_clear         (pe_max_clear       ),
        .o_pe_acc_clear         (pe_acc_clear    ),
		.o_sorter_clear           (sorter_clr),////////////////////////////
		.o_pe_mac_en            (pe_mac_en          ), 
		.o_pe_max_en            (pe_max_en          ),
        .o_pe_acc_en            (pe_acc_en       ),
		.o_pe_add_en            (                   ), 
		.i_pe_mac0_result       (mac_result[0]      ), 
		.i_pe_mac1_result       (mac_result[1]      ), 
		.i_pe_mac2_result       (mac_result[2]      ), 
		.i_pe_mac3_result       (mac_result[3]      ), 
		.i_pe_mac4_result       (mac_result[4]      ), 
		.i_pe_mac5_result       (mac_result[5]      ), 
		.i_pe_mac6_result       (mac_result[6]      ), 
		.i_pe_max_result        (max_result         ),
        .i_pe_acc_result        (acc_result      ), 
		.i_pe_add_result        (add_result         ),
		.i_sorter_result		(sorter_result)//////////////////////////////
	);

//////////////////////////////////////////////////////////////////////////////////
  
    assign wdata[0]     = i_wdata;
    assign wdata_vld[0] = i_wdata_vld;
    assign mdata[0]     = i_mdata;
    assign mdata_vld[0] = i_mdata_vld;    
    genvar i;
    generate
        for (i = 0; i < 7; i = i + 1) begin : inst_loop
            pe_mac # (
                .DATA_WIDTH             (DATA_WIDTH         ), 
                .DATA_COPIES            (DATA_COPIES        ),
                .INDEX_WIDTH            (INDEX_WIDTH        )
            ) pe_mac_inst (
                .i_clk                  (i_clk              ), 
                .i_rst_n                (i_rst_n            ), 
                .i_wdata                (wdata[i]           ), 
                .i_wdata_vld            (wdata_vld[i]       ), 
                .i_mdata                (mdata[0]           ), 
                .i_mdata_vld            (pe_mac_ld_en[i]    ), 
                .o_wdata                (wdata[i+1]         ), 
                .o_wdata_vld            (wdata_vld[i+1]     ), 
                .o_mdata                (mdata[i+1]         ), 
                .o_mdata_vld            (mdata_vld[i+1]     ), 
                .o_mac_result           (mac_result[i]      ), 
                .i_mac_clear            (pe_mac_clear[i]    ), 
                .i_mac_en               (pe_mac_en[i]       ),
                .i_mac_id               (i[2:0]             )
            );
        end
    endgenerate
    
//////////////////////////////////////////////////////////////////////////////////
   // 
	pe_max # (
        .DATA_WIDTH             (DATA_WIDTH         ), 
        .DATA_COPIES            (DATA_COPIES        )
    ) pe_max_inst (
		.i_clk                  (i_clk              ), 
		.i_rst_n                (i_rst_n            ), 
		.i_mdata                (mdata[1]           ), 
		.i_mdata_vld            (mdata_vld[1]       ), 
		.o_max_result           (max_result         ), 
		.i_max_clear            (pe_max_clear       ), 
		.i_max_en               (pe_max_en          )
	);

    //wire [DATA_COPIES*2*DATA_WIDTH-1:0] acc_result;
    pe_acc # (
        .DATA_WIDTH             (DATA_WIDTH  ), 
        .DATA_COPIES            (DATA_COPIES )
    ) pe_acc_inst (
        .i_clk                  (i_clk       ), 
        .i_rst_n                (i_rst_n     ), 
        .i_mdata                (mdata[1]    ), 
        .i_mdata_vld            (mdata_vld[1]), 
        .o_acc_result           (acc_result  ), 
        .i_acc_clear            (pe_acc_clear), 
        .i_acc_en               (pe_acc_en   )
    );
    
//////////////////////////////////////////////////////////////////////////////////
    
    reg [DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:0]  r_wdata         ;
    reg                                             r_wdata_vld     ;
    //wire[DATA_COPIES*2*DATA_WIDTH-1:0]              add_result      ;
   // always @(posedge i_clk) begin
      //  r_wdata     <= wdata[1];
       // r_wdata_vld <= wdata_vld[1];
    //end
	pe_add # (
        .DATA_WIDTH             (DATA_WIDTH         ), 
        .DATA_COPIES            (DATA_COPIES        )
    ) pe_add_inst (
      .i_wdata                (wdata[1][DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:INDEX_WIDTH*DATA_COPIES]), 
//		.i_wdata                (r_wdata[DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:INDEX_WIDTH*DATA_COPIES]), 
      .i_wdata_vld            (wdata_vld[1]       ), 
//		.i_wdata_vld            (r_wdata_vld        ), 
		.i_mdata                (mdata[1]           ), 
		.i_mdata_vld            (mdata_vld[1]       ), 
		.o_add_result           (add_result         )
	);
    
////////////////////////////////////add by htt//////////////////////////////////////////////
parameter Data_Width = 8;  
parameter Index_Width=16;
//wire  [Index_Width + Data_Width - 1 :0]sorter_out0  ; 
//wire  [Index_Width + Data_Width - 1 :0]sorter_out1  ;
//wire  [Index_Width + Data_Width - 1 :0]sorter_out2  ;
//wire  [Index_Width + Data_Width - 1 :0]sorter_out3  ;
//wire  [Index_Width + Data_Width - 1 :0]sorter_out4  ;
//wire  sorter_valid ;
sorter    sorter_i(/*autoport*/
//output
           .sorter_result(sorter_result),
           .sorter_valid (sorter_valid ) ,
           .last_sort_o  (last_sort_o  ),
  
//input
           .sys_clk   (i_clk   ),
           .sys_rst_n (i_rst_n ),
           .sorter_en (mdata_vld[0]&&i_sorter_op ),
           .sorter_clr(sorter_clr),
           .sorter_in (mdata[0] ),
           .last_line_sorter_num(last_line_sorter_num),
           .last_sort(i_sorter_out));
/////////////////////////////////////add by htt end///////////////////////////////////////////////
endmodule
`default_nettype wire
