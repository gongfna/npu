`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/22 00:21:00
// Design Name: 
// Module Name: io_buffer
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


module io_buffer#(
    parameter INIT_FILE = "", // Specify name/location of RAM initialization file if using one (leave blank if not)
	parameter REG_OUT=1'b1
    )(
    input i_clk, 
    input i_rst_n, 

    //external data input port for axi bram controller
    input  [11:0]   i_iob_bramctl_addr, 
    input           i_iob_bramctl_en, 
    output [255:0]  o_iob_bramctl_rdata, 
    input  [31:0]   i_iob_bramctl_be, 
    input           i_iob_bramctl_we, 
    input  [255:0]  i_iob_bramctl_wdata,    
    //外部接口使能
    input           i_iob_ext_en, 

    //内部逻辑接口
    input  [11:0]   i_iob_raddr, 
    input           i_iob_rd_en, 
    input           i_iob_pad_en, 
    input  [11:0]   i_iob_waddr, 
    input           i_iob_wr_en, 
    input  [255:0]  i_iob_wdat, 
    input           i_rwsel, //'1' r;'0'w
    output [255:0]  o_mdata, 
    output          o_mdata_vld 
); 
localparam WORDSWD=12;
localparam BITS=256;
wire [BITS-1:0] ram_out;
	wire w_iob_ena;
    wire w_iob_wea;
    wire [31:0] w_iob_be;
    wire [11:0] w_iob_waddr;
    wire [255:0] w_iob_wdata;
    
    wire w_iob_enb;
    wire [11:0] w_iob_raddr;
    
    reg r_mdata_vld;    
    reg r_iob_pad_en;
 
    reg r_mdata_sel;


	assign w_iob_ena = i_iob_ext_en ? i_iob_bramctl_en : i_iob_wr_en;
    assign w_iob_wea  = i_iob_ext_en ? i_iob_bramctl_we : ~i_rwsel;
	assign w_iob_be = i_iob_ext_en ? i_iob_bramctl_be : 32'hffff_ffff;
    assign w_iob_waddr = i_iob_ext_en ? i_iob_bramctl_addr : i_iob_waddr;
    assign w_iob_wdata = i_iob_ext_en ? i_iob_bramctl_wdata : i_iob_wdat;
    
	assign w_iob_enb = i_iob_ext_en ? i_iob_bramctl_en : i_iob_rd_en;
    assign w_iob_raddr = i_iob_ext_en ? i_iob_bramctl_addr : i_iob_raddr;

    // assign o_mdata = r_mdata_vld ? (r_iob_pad_en ? 256'b0 : w_iob_rdata) : 256'b0;
    //assign o_mdata = r_mdata_sel ? ram_out: 256'b0;
    assign o_mdata_vld = r_mdata_vld;

    //assign o_iob_bramctl_rdata=ram_out;

generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_out_r;
assign o_mdata = r_mdata_sel ? ram_out_r: 256'b0;
assign o_iob_bramctl_rdata=ram_out_r[BITS-1:0];

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
		ram_out_r <= 'h0;
	end
	else begin
		ram_out_r <= ram_out;
		//-if(w_iob_enb) begin
		//-	ram_out_r <= ram_out;
		//-end
		//-else begin
		//-	ram_out_r <= 'h0;
		//-end
	end
end
else begin //REG_OUT==1'b0
assign o_mdata = r_mdata_sel ? ram_out: 256'b0;
assign o_iob_bramctl_rdata=ram_out[BITS-1:0];
end
endgenerate




    always@(posedge i_clk or negedge i_rst_n) begin
        if(i_rst_n==0) begin
            r_mdata_vld <=1'b0;
        end else if(i_rwsel) begin
            if(i_iob_pad_en)begin
                r_mdata_vld <= 1'd1;
            end else if(i_iob_rd_en) begin
                r_mdata_vld <= 1'd1;
            end else begin
                r_mdata_vld <= 1'd0;
            end
        end else begin
            r_mdata_vld <= 1'd0;
        end        
    end    

    always @(posedge i_clk or negedge i_rst_n) begin
        if (i_rst_n==0) begin
            r_mdata_sel <= 0;            
        end else if (i_rwsel && i_iob_rd_en &&(i_iob_pad_en==0)) begin
            r_mdata_sel <= 1;            
        end else begin
            r_mdata_sel <= 0;
        end
    end

    always@(posedge i_clk or negedge i_rst_n) begin
        if(i_rst_n==0) begin
            r_iob_pad_en <=1'b0;
        end else begin
            r_iob_pad_en <= i_iob_pad_en;
        end
    end
  
   
    
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
//    simple_dual_port_ram256x4096 iob_ram(
//      .clka(i_clk),    // input wire clka
//      .ena(1'b1),      // input wire ena
//      .wea(w_iob_wren_ext),      // input wire [31 : 0] wea
//      .addra(w_iob_waddr),  // input wire [11 : 0] addra
//      .dina(w_iob_wdata),    // input wire [255 : 0] dina
//      .clkb(i_clk),    // input wire clkb
//      .enb(w_iob_rden),      // input wire enb
//      .addrb(w_iob_raddr),  // input wire [11 : 0] addrb
//      .doutb(w_iob_rdata)  // output wire [255 : 0] doutb
//    );
`ifdef FPGA
iob_sram2p_wrapper
iob_ram
(
  .clka(i_clk), 
  .ena(w_iob_ena), 
  .wea(w_iob_wea), 
  .be(w_iob_be), 
  .addra(w_iob_waddr), 
  .dina(w_iob_wdata), 
  .clkb(i_clk), 
  .enb(w_iob_enb), 
  .addrb(w_iob_raddr), 
  .doutb(ram_out)
);
`else
//assign o_iob_bramctl_rdata = ram_out;

wire cen;
assign cen = ~(w_iob_ena| w_iob_enb);

generate 
wire [BITS-1:0] wen;
for(genvar i=0;i<BITS/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(w_iob_be[i]&w_iob_wea)}};
end
endgenerate

wire [WORDSWD-1:0] addr;
//assign addr = w_iob_enb? w_iob_raddr: w_iob_waddr;
assign addr = w_iob_wea ? w_iob_waddr : w_iob_raddr;

wire [BITS-1:0] wdata;
assign wdata = w_iob_wdata;

wire [2:0] ema;
assign ema = 3'b010;

wire [1:0] emaw;
assign emaw = 2'b00;

wire gwen;
assign gwen = ~w_iob_wea;

wire ret1n;
assign ret1n = 1'b1;

sramsp_wrapper
#(WORDSWD, 128)
iob_ram1
(
.CENY(), 
.WENY(), 
.AY(), 
.GWENY(), 
.Q(ram_out[128+127:128]), 
.SO(), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[128+127:128]), 
.A(addr), 
.D(wdata[128+127:128]), 
.EMA(ema), 
.EMAW(emaw),
.TEN(1'b1), 
.TCEN(1'b1), 
.TWEN({128{1'b1}}), 
.TA({WORDSWD{1'b0}}), 
.TD({128{1'b0}}), 
.GWEN(gwen), 
.TGWEN(1'b1), 
.RET1N(ret1n), 
.SI(2'b0), 
.SE(1'b0), 
.DFTRAMBYP(1'b0)

);

sramsp_wrapper
#(WORDSWD, 128)
iob_ram0
(
.CENY(), 
.WENY(), 
.AY(), 
.GWENY(), 
.Q(ram_out[127:0]), 
.SO(), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[127:0]), 
.A(addr), 
.D(wdata[127:0]), 
.EMA(ema), 
.EMAW(emaw),
.TEN(1'b1), 
.TCEN(1'b1), 
.TWEN({128{1'b1}}), 
.TA({WORDSWD{1'b0}}), 
.TD({128{1'b0}}), 
.GWEN(gwen), 
.TGWEN(1'b1), 
.RET1N(ret1n), 
.SI(2'b0), 
.SE(1'b0), 
.DFTRAMBYP(1'b0)

);

`endif //`ifdef FPGA
  
endmodule

