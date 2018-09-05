/*
Project:
Team:
Module Name: xConverter_downsize
$RCSfile$
$Author$
$Date$
$Name$
$Revision$
$State$
Hierarchy: 
    ----> xConverter_downsize(xConverter_downsize.v)
	       |
	       |----> 
	       |
	       |---->
	       |
	       |---->
	       |
	       |---->
	       |
	       |---->
*/
module xConverter_downsize
#(parameter DWIDTH_S = 256,
  parameter DWIDTH_D = 32, 
  parameter DWADDR = 32  
)
( input xclk, 
  input xreset_n, 
  input mready, 
  input mwrite, 
  input [DWIDTH_S-1:0] mdata, 
  input [31:0] maddr, 
  input [DWIDTH_S/8-1:0] mwstrb, 
  output [DWIDTH_D-1:0] mdatao, 
  output [DWADDR-1:0] addro, 
  output [DWIDTH_D/8-1:0] wstrb, 
  output saccept
);
  localparam CWIDTH = $clog2(DWIDTH_S/DWIDTH_D); 
  localparam DWM = DWIDTH_S/DWIDTH_D;
reg [DWM-1:0] xsel;
reg [CWIDTH-1:0] addr_cal;
integer i;
assign saccept = xsel[DWM-1];
//assign addro = {maddr[DWADDR-CWIDTH-1:CWIDTH], addr_cal};
assign addro = maddr[DWADDR-1:0];

always @(*) 
    begin
	    for(i=0;i<DWM;i=i+1)
		  xsel[i] = (addr_cal==i);
	end

always @(posedge xclk or negedge xreset_n)
	if(~xreset_n) begin
		addr_cal <= 'b0;
	end
	else begin
		if(mready & mwrite) 
			addr_cal <= addr_cal + 'b1;
		else
			addr_cal <= 'b0;
	end

gmux_one_hot_cfg #(DWIDTH_D/8, DWM) U_wstrb_mux(
  //Outputs
  .dataout(wstrb), 
  //Inputs
  .datain(mwstrb), 
  .sel(xsel)
);

gmux_one_hot_cfg #(DWIDTH_D, DWM) U_mdatao_mux(
  //Outputs
  .dataout(mdatao), 
  //Inputs
  .datain(mdata), 
  .sel(xsel)
);

endmodule

