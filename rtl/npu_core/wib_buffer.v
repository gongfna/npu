`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/18 23:53:17
// Design Name: 
// Module Name: wib_buffer
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


module wib_buffer#(
    parameter INIT_FILE_B = "", // Specify name/location of RAM initialization file if using one (leave blank if not)
	parameter REG_OUT=1'b1
    )(
    input  i_clk, 
    input  i_rst_n, 
    //
    output [18:0] o_wib_rdat, 
    output        o_wib_rdat_vld, 
    input  [9:0]  i_wib_raddr, 
    input         i_wib_rd_en, 
    //external data input port for axi bram controller
	output [31:0] o_wib_bramctl_rdata, 
    input  [31:0] i_wib_bramctl_wdata, 
    input  [11:0] i_wib_bramctl_addr, 
    input         i_wib_bramctl_we, 
    input  [3:0]  i_wib_bramctl_be, 
    input         i_wib_bramctl_en
);
localparam WORDSWD=10;
localparam BITS=19;
wire [BITS-1:0] ram_out;
reg r_wib_rdat_vld;

//assign o_wib_rdat=ram_out[18:0];
assign o_wib_rdat_vld=r_wib_rdat_vld;

generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_out_r;
assign o_wib_rdat=ram_out_r;
assign o_wib_bramctl_rdata = {13'h0, ram_out_r};

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
		ram_out_r <= 'h0;
	end
	else begin
		ram_out_r <= ram_out;
	end
end
else begin //REG_OUT==1'b0
assign o_wib_rdat=ram_out;
assign o_wib_bramctl_rdata = ram_out;
end
endgenerate

always@(posedge i_clk or negedge i_rst_n) 
	if(~i_rst_n) begin
        r_wib_rdat_vld <= 1'b0;
	end
	else begin
        r_wib_rdat_vld <= i_wib_rd_en;
	end
    
//  simple_dual_port_ram19x1024 wib_ram (
//        .clka(i_clk),    // input wire clka
//        //Write port
//        .ena(1'b1),      // input wire ena
//        .wea(w_wib_bramctl_wren),      // input wire [0 : 0] wea
//        .addra(i_wib_bramctl_addr[9:0]),  // input wire [9 : 0] addra
//        .dina(i_wib_bramctl_wdata),    // input wire [18 : 0] dina
//        //Read port
//        .clkb(i_clk),    // input wire clkb
//        .enb(i_wib_rd_en),      // input wire enb
//        .addrb(i_wib_raddr),  // input wire [9 : 0] addrb
//        .doutb(w_ram_dout)  // output wire [18 : 0] doutb
//      );
`ifdef FPGA
wib_sram2p_wrapper
wib_ram
(
  .clka(i_clk), 
  .ena(i_wib_bramctl_en), 
  .wea(i_wib_bramctl_we), 
  .be(i_wib_bramctl_be), 
  .addra(i_wib_bramctl_addr), 
  .dina(i_wib_bramctl_wdata), 
  .clkb(i_clk), 
  .enb(i_wib_rd_en), 
  .addrb(i_wib_raddr), 
  .doutb(ram_out)
);
`else
//-------------------------------------------------------
//----------------------- MUX -------------------------
//---------------------------------------------------

wire cen;
assign cen = ~(i_wib_bramctl_en | i_wib_rd_en);

generate 
wire [32-1:0] wen;
for(genvar i=0;i<32/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_wib_bramctl_be[i]&i_wib_bramctl_we)}};
end
endgenerate

wire [WORDSWD-1:0] addr;
assign addr = i_wib_rd_en ? i_wib_raddr : i_wib_bramctl_addr;

wire [BITS-1:0] wdata;
assign wdata = i_wib_bramctl_wdata[BITS-1:0];

wire [2:0] ema;
assign ema = 3'b010;

wire [1:0] emaw;
assign emaw = 2'b00;

wire gwen;
assign gwen = ~i_wib_bramctl_we;

wire ret1n;
assign ret1n = 1'b1;
//---------------------------------------------------
//-------------------------------------------------------

rfsp_wrapper
#(WORDSWD, BITS)
wib_ram
(
.Q(ram_out), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen[BITS-1:0]), 
.A(addr), 
.D(wdata), 
.EMA(ema), 
.EMAW(emaw), 
.GWEN(gwen), 
.RET1N(ret1n)
);
`endif //`ifdef FPGA
  

endmodule
