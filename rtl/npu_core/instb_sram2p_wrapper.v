
module instb_sram2p_wrapper(
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
parameter AW=12;
parameter DW=128;
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
simple_dual_port_ram128x4096 
inst_ram 
(
.clka(clka), 
.ena(ena), 
.wea(ram_wea), 
.addra(addra), 
.dina(dina), 
.clkb(clkb), 
.enb(enb), 
.addrb(addrb), 
.doutb(doutb) 
);

`else

`endif



endmodule


