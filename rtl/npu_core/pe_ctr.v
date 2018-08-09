`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:23:45 01/07/2018 
// Design Name: 
// Module Name:    pe_ctr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// pe_en control modified at 2018-1-17
// �������pe_maciʹ�ܺ���i��
// �������pe_maciʹ����conv_out��Чʱ����(����conv_out���ĵ�pe_en)
// fsm load_cstate control modified at 2018-1-20
// less than 7 pe_mac working all the time considered
// pe_en control modified at 2018-02-08
// addģʽ��wdata��wdata_vld��һ�ģ���Ӧ������r_pe_add_oenʱ��wdata_vld��һ��
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`default_nettype none
module pe_ctr #(
    parameter   DATA_WIDTH      =   8   ,
    parameter   DATA_COPIES     =   32  
) (
    input  wire                                 i_clk               ,
    input  wire                                 i_rst_n             ,
    input  wire[2:0]                            i_npe_mode          ,
    input  wire                                 i_mdata_vld         ,
    input  wire                                 i_wdata_vld         ,
    input  wire[6:0]                            i_pe_en             ,
    input  wire                                 i_pe_conv_out       ,
    input  wire                                 i_pe_fc_out         ,
    input  wire                                 i_pe_max_out        ,
    input  wire                                i_sorter_out,////////////////////////////////////
    input  wire									i_sorter_op,/////////////////////////////////
    output reg [DATA_COPIES*2*DATA_WIDTH-1:0]   o_npe_result        ,
    output wire                                 o_npe_result_vld    ,
    output wire[6:0]                            o_pe_mac_ld_en      ,
    output wire[6:0]                            o_pe_mac_clear      ,
    output wire                                 o_pe_max_clear      ,
    output wire                                  o_pe_acc_clear  ,
    output wire                                 o_sorter_clear ,////////////////////////////////////
    output wire[6:0]                            o_pe_mac_en         ,
    output wire                                 o_pe_max_en         ,
    output wire                                  o_pe_acc_en     ,
    output wire                                 o_pe_add_en         ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_mac0_result    ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_mac1_result    ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_mac2_result    ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_mac3_result    ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_mac4_result    ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_mac5_result    ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_mac6_result    ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_max_result     ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_acc_result ,
    input  wire[DATA_COPIES*2*DATA_WIDTH-1:0]   i_pe_add_result    ,
    input  wire [255:0]  i_sorter_result
);
//////////////////////////////////////////////////////////////////////////////////
    localparam      LOAD_PE_MAC0    = 7'b0000001;
    localparam      LOAD_PE_MAC1    = 7'b0000010;
    localparam      LOAD_PE_MAC2    = 7'b0000100;
    localparam      LOAD_PE_MAC3    = 7'b0001000;
    localparam      LOAD_PE_MAC4    = 7'b0010000;
    localparam      LOAD_PE_MAC5    = 7'b0100000;
    localparam      LOAD_PE_MAC6    = 7'b1000000;
    localparam      OUTPUT_PE_MAC0  = 7'b0000001;
    localparam      OUTPUT_PE_MAC1  = 7'b0000010;
    localparam      OUTPUT_PE_MAC2  = 7'b0000100;
    localparam      OUTPUT_PE_MAC3  = 7'b0001000;
    localparam      OUTPUT_PE_MAC4  = 7'b0010000;
    localparam      OUTPUT_PE_MAC5  = 7'b0100000;
    localparam      OUTPUT_PE_MAC6  = 7'b1000000;
//////////////////////////////////////////////////////////////////////////////////
    reg                                         mac_mode            ;
    reg                                         fc_mode             ;
    reg                                         max_mode            ;
    reg                                         add_mode            ;
    reg                                         acc_mode            ;
    reg 											sorter_mode;
    reg [6:0]                                   r_compute_pe_en[5:0];
    wire[6:0]                                   compute_pe_en       ;
    wire c_sorter_oen;
    always @(*) begin
        mac_mode = 1'b0;
        fc_mode  = 1'b0;
        max_mode = 1'b0;
        add_mode = 1'b0;
        acc_mode = 1'b0;
      
        case (i_npe_mode) 
            3'h1    : mac_mode = 1'b1;
            3'h4    : max_mode = 1'b1;
            3'h2    : fc_mode  = 1'b1;
            3'h3    : add_mode = 1'b1;
            3'h5    : acc_mode = 1'b1;////////////////////add by htt
        endcase
    end
    always @(posedge i_clk) begin
        r_compute_pe_en[0] <= i_pe_en;
        r_compute_pe_en[1] <= r_compute_pe_en[0];
        r_compute_pe_en[2] <= r_compute_pe_en[1];
        r_compute_pe_en[3] <= r_compute_pe_en[2];
        r_compute_pe_en[4] <= r_compute_pe_en[3];
        r_compute_pe_en[5] <= r_compute_pe_en[4];
    end
    assign compute_pe_en = {r_compute_pe_en[5][6], 
                            r_compute_pe_en[4][5],   
                            r_compute_pe_en[3][4], 
                            r_compute_pe_en[2][3], 
                            r_compute_pe_en[1][2], 
                            r_compute_pe_en[0][1], 
                            i_pe_en[0]};
    assign o_pe_mac_en = compute_pe_en & ({{6{mac_mode}}, mac_mode | fc_mode});
    assign o_pe_max_en = max_mode;
    assign o_pe_add_en = add_mode;
    assign o_pe_acc_en = acc_mode;

    reg [6:0]                                   r_load_cstate   ;
    reg [6:0]                                   c_load_nstate   ;
    wire[6:0]                                   load_cstate     ;    
    always @(*) begin
        case (r_load_cstate)
            LOAD_PE_MAC0    : c_load_nstate = (mac_mode && i_mdata_vld && i_pe_en[1]) ? LOAD_PE_MAC1 : LOAD_PE_MAC0;
            LOAD_PE_MAC1    : c_load_nstate = (i_mdata_vld && i_pe_en[2]) ? LOAD_PE_MAC2 : LOAD_PE_MAC0;
            LOAD_PE_MAC2    : c_load_nstate = (i_mdata_vld && i_pe_en[3]) ? LOAD_PE_MAC3 : LOAD_PE_MAC0;
            LOAD_PE_MAC3    : c_load_nstate = (i_mdata_vld && i_pe_en[4]) ? LOAD_PE_MAC4 : LOAD_PE_MAC0;
            LOAD_PE_MAC4    : c_load_nstate = (i_mdata_vld && i_pe_en[5]) ? LOAD_PE_MAC5 : LOAD_PE_MAC0;
            LOAD_PE_MAC5    : c_load_nstate = (i_mdata_vld && i_pe_en[6]) ? LOAD_PE_MAC6 : LOAD_PE_MAC0;
            LOAD_PE_MAC6    : c_load_nstate = LOAD_PE_MAC0;
            default         : c_load_nstate = LOAD_PE_MAC0;
        endcase
    end
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) r_load_cstate <= LOAD_PE_MAC0;
        else          r_load_cstate <= c_load_nstate;
    end
    assign load_cstate = r_load_cstate;    
    assign o_pe_mac_ld_en = mac_mode ? (load_cstate & {7{i_mdata_vld}}) : 
                          ((max_mode | fc_mode | add_mode | acc_mode) ? {6'h0, i_mdata_vld} : 7'h0);

    reg [6:0]                                   r_output_cstate ;
    reg [6:0]                                   c_output_nstate ;
    wire[6:0]                                   output_cstate   ;
    reg [6:0]                                   r_output_pe_en  ;
    wire[6:0]                                   output_pe_en    ;
    wire[6:0]                                   c_pe_mac_oen    ;
    reg [6:0]                                   r_pe_mac_oen    ;
    reg                                         r_pe_max_oen    ;
    reg                                         r_pe_add_oen    ;
    reg                                         r_pe_acc_oen    ;
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)           r_output_pe_en <= 7'h0;
        else if (i_pe_conv_out) r_output_pe_en <= i_pe_en;
        else                    r_output_pe_en <= r_output_pe_en;
    end
    assign output_pe_en = i_pe_conv_out ? i_pe_en : r_output_pe_en;
    always @(*) begin
        case (r_output_cstate)
            OUTPUT_PE_MAC0  : c_output_nstate = (i_pe_conv_out && output_pe_en[1]) ? OUTPUT_PE_MAC1 : OUTPUT_PE_MAC0;
            OUTPUT_PE_MAC1  : c_output_nstate = output_pe_en[2] ? OUTPUT_PE_MAC2 : OUTPUT_PE_MAC0;
            OUTPUT_PE_MAC2  : c_output_nstate = output_pe_en[3] ? OUTPUT_PE_MAC3 : OUTPUT_PE_MAC0;
            OUTPUT_PE_MAC3  : c_output_nstate = output_pe_en[4] ? OUTPUT_PE_MAC4 : OUTPUT_PE_MAC0;
            OUTPUT_PE_MAC4  : c_output_nstate = output_pe_en[5] ? OUTPUT_PE_MAC5 : OUTPUT_PE_MAC0;
            OUTPUT_PE_MAC5  : c_output_nstate = output_pe_en[6] ? OUTPUT_PE_MAC6 : OUTPUT_PE_MAC0;
            OUTPUT_PE_MAC6  : c_output_nstate = OUTPUT_PE_MAC0;
            default         : c_output_nstate = OUTPUT_PE_MAC0;
        endcase
    end
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) r_output_cstate <= OUTPUT_PE_MAC0;
        else          r_output_cstate <= c_output_nstate;
    end
    assign output_cstate = r_output_cstate;
    assign c_pe_mac_oen = mac_mode ? (output_cstate & {output_pe_en[6:1], output_pe_en[0] & i_pe_conv_out}) :
                         (fc_mode ? {6'h0, i_pe_en[0] & i_pe_fc_out} : 7'h0);
    reg                                         r_wdata_vld     ; 
    always @(posedge i_clk) begin
        r_pe_mac_oen <= c_pe_mac_oen;
        r_pe_max_oen <= max_mode & i_pe_max_out;
        r_pe_acc_oen <= acc_mode & i_pe_max_out;
        r_pe_add_oen <= add_mode & (i_mdata_vld | i_wdata_vld);
    //    r_pe_add_oen <= add_mode & (i_mdata_vld | r_wdata_vld); // modified at 2018-2-8
     //   r_wdata_vld  <= i_wdata_vld;
    end
    assign c_sorter_oen  = i_sorter_op & i_sorter_out;
    assign o_pe_mac_clear = r_pe_mac_oen;
    assign o_pe_max_clear = r_pe_max_oen;
    assign o_pe_acc_clear = r_pe_acc_oen;
    assign o_sorter_clear = c_sorter_oen;
    
    assign o_npe_result_vld = |r_pe_mac_oen | r_pe_max_oen | r_pe_acc_oen | r_pe_add_oen | c_sorter_oen;
    always @(*) begin
        case ({r_pe_add_oen, r_pe_acc_oen, r_pe_max_oen, r_pe_mac_oen,c_sorter_oen})
            11'b00000000010    : o_npe_result = i_pe_mac0_result;
            11'b00000000100    : o_npe_result = i_pe_mac1_result;
            11'b00000001000    : o_npe_result = i_pe_mac2_result;
            11'b00000010000    : o_npe_result = i_pe_mac3_result;
            11'b00000100000    : o_npe_result = i_pe_mac4_result;
            11'b00001000000    : o_npe_result = i_pe_mac5_result;
            11'b00010000000    : o_npe_result = i_pe_mac6_result;
            11'b00100000000    : o_npe_result = i_pe_max_result;
            11'b01000000000    : o_npe_result = i_pe_acc_result;
            11'b10000000000    : o_npe_result = i_pe_add_result; 
            11'b00000000001    : o_npe_result = {256'b0,i_sorter_result}; 
            default         : o_npe_result = {DATA_COPIES*2*DATA_WIDTH{1'b0}};
        endcase
    end
//////////////////////////////////////////////////////////////////////////////////
endmodule
`default_nettype wire
