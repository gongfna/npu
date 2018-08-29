/*
Project:
Team:
Module Name: xConverter_wb_upsize
$RCSfile$
$Author$
$Date$
$Name$
$Revision$
$State$
Hierarchy: 
    ----> xConverter_wb_upsize(xConverter_wb_upsize.v)
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

module xConverter_wb_upsize
( 
  xclk, 
  xreset_n, 
  maddr_sram_start, 
  mode_m2wb416, 
  mode_m2wb256, 
  mwrite, 
  wdata, 
  wb_write, 
  wb_addr, 
  wb_wstrb, 
  wb_wdata
);
  parameter DWS = 128;//16B
  parameter DWD = 416;//52B 
  parameter AW_WB = 13; 
  localparam DSTRB = DWS/8; 
  localparam DSTRBD = DWD/8;

  input xclk; 
  input xreset_n; 
  input [31:0] maddr_sram_start;
  input mode_m2wb416;
  input mode_m2wb256;
  input mwrite; 
  input [DWS-1:0] wdata;
  output wb_write;
  output [DSTRBD-1:0] wb_wstrb;
  output [AW_WB-1:0] wb_addr;
  output [DWD-1:0] wb_wdata;

reg [31:0] wb_fifo[0:12];
reg [AW_WB-1:0] wb_addr;
reg [DWD-1:0] wb_wdata;
reg [3:0] wptr;
reg wb_write;
reg mode_m2wb256_r;
reg mode_m2wb416_r;
assign wb_wstrb = mode_m2wb416 ? {DSTRBD{1'b1}} : {160'h0,{256{1'b1}}};
// 0 4 8 12
//   3 7 11 
//   2 6 10
//   1 5 9
//   0 4 8  12
integer i;
always @(posedge xclk or negedge xreset_n) 
	if(~xreset_n) begin
		wptr <= 4'h0;
		wb_wdata <= 416'h0;
		wb_write <= 1'b0;
		wb_addr <= {AW_WB{1'b0}};
		mode_m2wb256_r <= 1'b0;
		mode_m2wb416_r <= 1'b0;
		for(i=0;i<=12;i=i+1) begin
			wb_fifo[i][31:0] <= 32'h0;
		end
	end
	else begin
		mode_m2wb256_r <= mode_m2wb256;
		mode_m2wb416_r <= mode_m2wb416;
		if(wb_write) begin
			wb_addr <= wb_addr + 'h1;
		end
		else begin
			if(mode_m2wb256 & ~mode_m2wb256_r)
				wb_addr <= maddr_sram_start[AW_WB-1:0];
			if(mode_m2wb416 & ~mode_m2wb416_r)
				wb_addr <= maddr_sram_start[AW_WB-1:0];
		end
		if(mode_m2wb256) begin
			if(mwrite) begin
				if(wptr==4'd4) begin
					wb_write <= 1'b1;
					wptr <= 4'd0;
					wb_wdata <= {
							  wdata[127:0],  
							  wb_fifo[3], 
							  wb_fifo[2], 
							  wb_fifo[1], 
							  wb_fifo[0], 
					          160'h0
							  };
				end
				else begin
					wb_write <= 1'b0;
					wptr <= wptr + 4;
					wb_fifo[wptr+0] <= wdata[32*(1)-1:32*(0)];
					wb_fifo[wptr+1] <= wdata[32*(2)-1:32*(1)];
					wb_fifo[wptr+2] <= wdata[32*(3)-1:32*(2)];
					wb_fifo[wptr+3] <= wdata[32*(4)-1:32*(3)];
				end
			end	
			else begin
				wb_write <= 1'b0;
			end
		end
		else if(mode_m2wb416) begin
			if(mwrite) begin
				if(wptr==4'd12) begin
					wb_write <= 1'b1;
					wptr <= 4'd3;
				    wb_fifo[0] <= wdata[32*(2)-1:32*(1)];
				    wb_fifo[1] <= wdata[32*(3)-1:32*(2)];
				    wb_fifo[2] <= wdata[32*(4)-1:32*(3)];
					wb_wdata <= {wdata[31:0],  
							  wb_fifo[11], 
							  wb_fifo[10], 
							  wb_fifo[9], 
							  wb_fifo[8], 
							  wb_fifo[7], 
							  wb_fifo[6], 
							  wb_fifo[5], 
							  wb_fifo[4], 
							  wb_fifo[3], 
							  wb_fifo[2], 
							  wb_fifo[1], 
							  wb_fifo[0]};
				end
				else if(wptr==4'd11) begin
					wb_write <= 1'b1;
					wptr <= 4'd2;
				    wb_fifo[0] <= wdata[32*(3)-1:32*(2)];
				    wb_fifo[1] <= wdata[32*(4)-1:32*(3)];
					wb_wdata <= {wdata[63:0],  
							  wb_fifo[10], 
							  wb_fifo[9], 
							  wb_fifo[8], 
							  wb_fifo[7], 
							  wb_fifo[6], 
							  wb_fifo[5], 
							  wb_fifo[4], 
							  wb_fifo[3], 
							  wb_fifo[2], 
							  wb_fifo[1], 
							  wb_fifo[0]};
				end
				else if(wptr==4'd10) begin
					wb_write <= 1'b1;
					wptr <= 4'd1;
				    wb_fifo[0] <= wdata[32*(4)-1:32*(3)];
					wb_wdata <= {wdata[95:0],  
							  wb_fifo[9], 
							  wb_fifo[8], 
							  wb_fifo[7], 
							  wb_fifo[6], 
							  wb_fifo[5], 
							  wb_fifo[4], 
							  wb_fifo[3], 
							  wb_fifo[2], 
							  wb_fifo[1], 
							  wb_fifo[0]};
				end
				else if(wptr==4'd9) begin
					wb_write <= 1'b1;
					wptr <= 4'd0;
					wb_wdata <= {wdata[127:0],  
							  wb_fifo[8], 
							  wb_fifo[7], 
							  wb_fifo[6], 
							  wb_fifo[5], 
							  wb_fifo[4], 
							  wb_fifo[3], 
							  wb_fifo[2], 
							  wb_fifo[1], 
							  wb_fifo[0]};
				end
				else begin
					wb_write <= 1'b0;
					wptr <= wptr + 4;
					wb_fifo[wptr+0] <= wdata[32*(1)-1:32*(0)];
					wb_fifo[wptr+1] <= wdata[32*(2)-1:32*(1)];
					wb_fifo[wptr+2] <= wdata[32*(3)-1:32*(2)];
					wb_fifo[wptr+3] <= wdata[32*(4)-1:32*(3)];
				end
			end
			else begin
				wb_write <= 1'b0;
			end
		end
		else begin
			wb_addr <= maddr_sram_start[AW_WB-1:0]; 
			wptr <= 4'h0;
			wb_wdata <= 416'h0;
			wb_write <= 1'b0;
			for(i=0;i<=12;i=i+1) begin
				wb_fifo[i][31:0] <= 32'h0;
			end
		end	
	end


endmodule

