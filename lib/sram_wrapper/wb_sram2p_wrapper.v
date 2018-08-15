
module wb_sram2p_wrapper(
  clka, 
  ena, 
  wea, 
  be, 
  addra, 
  dina, 
  clkb, 
  enb, 
  addrb, 
  doutb
);
parameter AW=13;
parameter DW=416;
localparam BW=DW/8;
localparam DP=2**AW;
input clka; 
input ena; 
input wea; 
input [BW-1:0] be; 
input [AW-1:0] addra; 
input [DW-1:0] dina; 
input clkb; 
input enb; 
input [AW-1:0] addrb; 
output [DW-1:0] doutb;


`ifdef FPGA
wire [BW-1:0] ram_wea;
assign ram_wea = {BW{wea}} & be;
genvar i;
generate
for(i=0;i<13;i=i+1) begin
simple_dual_port_ram32x8192
wb_rami 
(
.clka(clka), 
.ena(ena), 
.wea(ram_wea[(i+1)*4-1:i*4]), 
.addra(addra), 
.dina(dina[(i+1)*32-1:i*32]), 
.clkb(clkb), 
.enb(enb), 
.addrb(addrb), 
.doutb(doutb[(i+1)*32-1:i*32]) 
);
end
endgenerate
`else

`endif



endmodule


