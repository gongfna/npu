/*
Project:
Team:
Module Name: xConverter_upsize
$RCSfile$
$Author$
$Date$
$Name$
$Revision$
$State$
Hierarchy: 
    ----> xConverter_upsize(xConverter_upsize.v)
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
module xConverter_upsize
( 
  xclk, 
  xreset_n, 
  cs, 
  mready, 
  mwrite, 
  mwstrb, 
  wstrb_up
);
  parameter DWS = 128;
  parameter DWD = 256; 
  localparam DSTRB = DWS/8; 
  localparam DSTRBD = DWD/8;

  input xclk; 
  input xreset_n; 
  input cs;
  input mready; 
  input mwrite; 
  input [DSTRB-1:0] mwstrb; 
  output [DSTRBD-1:0] wstrb_up;
generate 
case(DWD/DWS) 
1:begin
assign wstrb_up = mwstrb;
end //1
2:begin
    reg tok;
    wire tik;
    assign tik = ~tok;
    always @(posedge xclk or negedge xreset_n)
        if(~xreset_n) begin
    	    tok <= 1'b0;
        end
        else begin
			if(~cs)
				tok <= 1'b0;
    	    else if(mwrite & mready) begin
    		    tok <= tik;
    		end
        end
    assign wstrb_up[DSTRB-1:0]=mwstrb & {DSTRB{tik}};
    assign wstrb_up[DSTRBD-1:DSTRB]=mwstrb & {DSTRB{tok}};
end
4:begin
    reg [1:0] nm_sel;
    wire [1:0] nm_sel_inc;
    assign nm_sel_inc = nm_sel+2'b1;
	wire nm_sel0;
	wire nm_sel1;
	wire nm_sel2;
	wire nm_sel3;
	wire nm_sel_b0;
	wire nm_sel_b1;
	wire nm_sel_b0_n;
	wire nm_sel_b1_n;
	assign nm_sel_b0 = nm_sel[0];
	assign nm_sel_b1 = nm_sel[1];
	assign nm_sel_b0_n = ~nm_sel[0];
	assign nm_sel_b1_n = ~nm_sel[1];
	assign nm_sel0 = nm_sel_b1_n & nm_sel_b0_n;
	assign nm_sel1 = nm_sel_b1_n & nm_sel_b0;
	assign nm_sel2 = nm_sel_b1 & nm_sel_b0_n;
	assign nm_sel3 = nm_sel_b1 & nm_sel_b0;
    always @(posedge xclk or negedge xreset_n)
        if(~xreset_n) begin
    	    nm_sel <= 2'b0;
        end
        else begin
			if(~cs)
    	    	nm_sel <= 2'b0;
    	    else if(mwrite & mready) begin
    		    nm_sel <= nm_sel_inc;
    		end
        end
    assign wstrb_up[DSTRB-1:0]=mwstrb & {DSTRB{nm_sel0}};
    assign wstrb_up[DSTRB*2-1:DSTRB]=mwstrb & {DSTRB{nm_sel1}};
    assign wstrb_up[DSTRB*3-1:DSTRB*2]=mwstrb & {DSTRB{nm_sel2}};
    assign wstrb_up[DSTRB*4-1:DSTRB*3]=mwstrb & {DSTRB{nm_sel3}};
end //2
default:;
endcase
endgenerate


endmodule

