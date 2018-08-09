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


module inst_buffer#(
    parameter INIT_FILE_B = "", // Specify name/location of RAM initialization file if using one (leave blank if not)
	parameter REG_OUT=1'b0
    )(
    input  i_clk, 
    input  i_rst_n, 
    //
    output [127:0] o_inst_rdat, 
	output         o_inst_rdat_vld, 
    input  [11:0]  i_inst_raddr, 
	input          i_inst_rd_en, 
    //external data input port for axi bram controller
    output [127:0] o_inst_bramctl_rdata, 
    input  [127:0] i_inst_bramctl_wdata, 
	input  [11:0]  i_inst_bramctl_addr, 
    input  [15:0]  i_inst_bramctl_be, 
    input          i_inst_bramctl_we, 
    input          i_inst_bramctl_en
);
localparam WORDSWD=12;
localparam BITS=128;
wire [BITS-1:0] ram_out;
reg r_inst_rdat_vld;

generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_out_r;
assign o_inst_rdat=ram_out_r[BITS-1:0];

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
		ram_out_r <= 'h0;
	end
	else begin
		ram_out_r <= ram_out;
	end
end
else begin //REG_OUT==1'b0
assign o_inst_rdat=ram_out[BITS-1:0];
end
endgenerate

assign o_inst_rdat_vld=r_inst_rdat_vld;

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
        r_inst_rdat_vld <= 1'b0;
    end 
	else begin
        r_inst_rdat_vld <= i_inst_rd_en;
    end
    
//  simple_dual_port_ram128x4096 inst_ram (
//        .clka(i_clk),    // input wire clka
//        //Write port
//        .ena(i_inst_bramctl_en),      // input wire ena
//        .wea(i_inst_bramctl_be&{16{i_inst_bramctl_we}}),      // input wire [15 : 0] wea
//        .addra(i_inst_bramctl_addr),  // input wire [9 : 0] addra
//        .dina(i_inst_bramctl_wdata[127:0]),    // input wire [18 : 0] dina
//        //Read port
//        .clkb(i_clk),    // input wire clkb
//        .enb(i_inst_rd_en),      // input wire enb
//        .addrb(i_inst_raddr),  // input wire [9 : 0] addrb
//        .doutb(w_ram_dout)  // output wire [18 : 0] doutb
//      );
`ifdef FPGA
instb_sram2p_wrapper
inst_ram
(
  .clka(i_clk), 
  .ena(i_inst_bramctl_en), 
  .wea(i_inst_bramctl_we), 
  .be(i_inst_bramctl_be), 
  .addra(i_inst_bramctl_addr), 
  .dina(i_inst_bramctl_wdata), 
  .clkb(i_clk), 
  .enb(i_inst_rd_en), 
  .addrb(i_inst_raddr), 
  .doutb(ram_out)
);
`else
//-------------------------------------------------------
//----------------------- MUX -------------------------
//---------------------------------------------------
assign o_inst_bramctl_rdata = ram_out;

wire cen;
assign cen = ~(i_inst_bramctl_en | i_inst_rd_en);

generate 
wire [BITS-1:0] wen;
for(genvar i=0;i<BITS/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_inst_bramctl_be[i]&i_inst_bramctl_we)}};
end
endgenerate

wire [WORDSWD-1:0] addr;
assign addr = i_inst_rd_en ? i_inst_raddr: i_inst_bramctl_addr;

wire [BITS-1:0] wdata;
assign wdata = i_inst_bramctl_wdata;

wire [2:0] ema;
assign ema = 3'b010;

wire [1:0] emaw;
assign emaw = 2'b00;

wire gwen;
assign gwen = ~i_inst_bramctl_we;

wire ret1n;
assign ret1n = 1'b1;
//---------------------------------------------------
//-------------------------------------------------------

sramsp_wrapper
#(WORDSWD, BITS)
inst_ram
(
.CENY(), 
.WENY(), 
.AY(), 
.GWENY(), 
.Q(ram_out), 
.SO(), 
.CLK(i_clk), 
.CEN(cen), 
.WEN(wen), 
.A(addr), 
.D(wdata), 
.EMA(ema), 
.EMAW(emaw),
.TEN(1'b1), 
.TCEN(1'b1), 
.TWEN({BITS{1'b1}}), 
.TA({WORDSWD{1'b0}}), 
.TD({BITS{1'b0}}), 
.GWEN(gwen), 
.TGWEN(1'b1), 
.RET1N(ret1n), 
.SI(2'b0), 
.SE(1'b0), 
.DFTRAMBYP(1'b0)

);
`endif //`ifdef FPGA
 

endmodule
