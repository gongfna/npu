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
	parameter REG_OUT=1'b0
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
    input           i_wsel, //'1' r;'0'w
    output [255:0]  o_mdata, 
    output          o_mdata_vld 
); 
localparam WORDSWD=12;
localparam BITS=256;
localparam RAM_AWD=10;
localparam RAM_BITS=64;
wire [BITS-1:0] ram_outa;
wire [BITS-1:0] ram_outb;
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
    assign w_iob_wea  = i_iob_ext_en ? i_iob_bramctl_we : ~i_wsel;
	assign w_iob_be = i_iob_ext_en ? i_iob_bramctl_be : 32'hffff_ffff;
    assign w_iob_waddr = i_iob_ext_en ? i_iob_bramctl_addr : i_iob_waddr;
    assign w_iob_wdata = i_iob_ext_en ? i_iob_bramctl_wdata : i_iob_wdat;
    
	assign w_iob_enb = i_iob_ext_en ? i_iob_bramctl_en : i_iob_rd_en;
    assign w_iob_raddr = i_iob_ext_en ? i_iob_bramctl_addr : i_iob_raddr;

    // assign o_mdata = r_mdata_vld ? (r_iob_pad_en ? 256'b0 : w_iob_rdata) : 256'b0;
    assign o_mdata_vld = r_mdata_vld;


generate 
if(REG_OUT==1'b1) begin 
reg [BITS-1:0] ram_outa_r;
reg [BITS-1:0] ram_outb_r;
assign o_mdata = r_mdata_sel ? ram_outb_r: 256'b0;
assign o_iob_bramctl_rdata=ram_outa_r[BITS-1:0];

always@(posedge i_clk or negedge i_rst_n)
	if(~i_rst_n)begin
		ram_outa_r <= 'h0;
		ram_outb_r <= 'h0;
	end
	else begin
		ram_outa_r <= ram_outa;
		ram_outb_r <= ram_outb;
	end
end
else begin //REG_OUT==1'b0
assign o_mdata = r_mdata_sel ? ram_outb: 256'b0;
assign o_iob_bramctl_rdata = ram_outa[BITS-1:0];
end
endgenerate




    always@(posedge i_clk or negedge i_rst_n) begin
        if(i_rst_n==0) begin
            r_mdata_vld <=1'b0;
        end else if(i_iob_pad_en)begin
                r_mdata_vld <= 1'd1;
            end else if(i_iob_rd_en) begin
                r_mdata_vld <= 1'd1;
            end else begin
                r_mdata_vld <= 1'd0;
            end  
    end    

    always @(posedge i_clk or negedge i_rst_n) begin
        if (i_rst_n==0) begin
            r_mdata_sel <= 0;            
        end else if ( i_iob_rd_en &&(i_iob_pad_en==0)) begin
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
  .doutb(ram_outb)
);
`else

wire cena;
wire cenb;
assign cena = ~i_iob_bramctl_en;
assign cenb = ~(i_iob_wr_en | i_iob_rd_en);

wire [BITS-1:0] wen;
wire [BITS-1:0] wenb;
generate 
for(genvar i=0;i<BITS/8;i=i+1) begin
assign wen[8*(i+1)-1:8*i] = {8{~(i_iob_bramctl_be[i]&w_iob_wea)}};
end
endgenerate
assign wenb = {BITS{i_wsel}};

wire [WORDSWD-1:0] addra;
wire [WORDSWD-1:0] addrb;
assign addra = i_iob_bramctl_addr;
assign addrb = ~i_wsel ? i_iob_waddr : i_iob_raddr;
wire [BITS-1:0] wdataa;
wire [BITS-1:0] wdatab;
assign wdataa = i_iob_bramctl_wdata;
assign wdatab = i_iob_wdat;


wire gwena;
assign gwena = ~i_iob_bramctl_we;
wire GWENB;
assign GWENB = i_wsel;
//---------------------------------------------------
//-------------------------------------------------------

wire [2:0] EMA;
assign EMA = 3'b010;

wire [1:0] EMAW;
assign EMAW = 2'b00;


//- TestOut
  wire  CENYA;
  wire [RAM_BITS-1:0] WENYA;
  wire [RAM_AWD-1:0] AYA;
  wire  CENYB;
  wire [RAM_BITS-1:0] WENYB;
  wire [RAM_AWD-1:0] AYB;
  wire [1:0] SOA;
  wire [1:0] SOB;
  wire  GWENYA;
  wire  GWENYB;
//- TestIn
  wire  TENA;
  wire  TCENA;
  wire [RAM_BITS-1:0] TWENA;
  wire [RAM_AWD-1:0] TAA;
  wire [RAM_BITS-1:0] TDA;
  wire  TENB;
  wire  TCENB;
  wire [RAM_BITS-1:0] TWENB;
  wire [RAM_AWD-1:0] TAB;
  wire [RAM_BITS-1:0] TDB;
  wire [1:0] SIA;
  wire  SEA;
  wire  DFTRAMBYP;
  wire [1:0] SIB;
  wire  SEB;
  wire RET1N;
  wire  COLLDISN;
assign TENA = 1'b1;
assign TCENA = 1'b1;
assign TWENA = {RAM_BITS{1'b1}};
assign TAA = {RAM_AWD{1'b0}};
assign TDA = {RAM_BITS{1'b0}};
assign TENB = 1'b1;
assign TCENB = 1'b1;
assign TWENB = {RAM_BITS{1'b1}};
assign TAB = {RAM_AWD{1'b0}};
assign TDB = {RAM_BITS{1'b0}};
assign SIA = 2'b0;
assign SEA = 1'b0;
assign DFTRAMBYP = 1'b0;
assign SIB = 2'b0;
assign SEB = 1'b0;
assign RET1N = 1'b1;
assign COLLDISN = 1'b1;
//---------------------------------------------------
//-------------------------------------------------------
localparam MERGE_BITS=2**(WORDSWD-RAM_AWD);
wire [MERGE_BITS-1:0] cena_merge;
wire [MERGE_BITS-1:0] cenb_merge;
wire [BITS-1:0] ram_out3a;
wire [BITS-1:0] ram_out2a;
wire [BITS-1:0] ram_out1a;
wire [BITS-1:0] ram_out0a;
wire [BITS-1:0] ram_out3b;
wire [BITS-1:0] ram_out2b;
wire [BITS-1:0] ram_out1b;
wire [BITS-1:0] ram_out0b;
generate 
if((WORDSWD-RAM_AWD)==2) begin
assign cena_merge[3] = ~( addra[WORDSWD-1] &  addra[WORDSWD-2] & ~cena);
assign cena_merge[2] = ~( addra[WORDSWD-1] & ~addra[WORDSWD-2] & ~cena);
assign cena_merge[1] = ~(~addra[WORDSWD-1] &  addra[WORDSWD-2] & ~cena);
assign cena_merge[0] = ~(~addra[WORDSWD-1] & ~addra[WORDSWD-2] & ~cena);
assign ram_outa = addra[WORDSWD-1] & addra[WORDSWD-2] ? ram_out3a :
                 addra[WORDSWD-1] & ~addra[WORDSWD-2] ? ram_out2a :
                 ~addra[WORDSWD-1] & addra[WORDSWD-2] ? ram_out1a :
				                                        ram_out0a;
assign cenb_merge[3] = ~( addrb[WORDSWD-1] &  addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[2] = ~( addrb[WORDSWD-1] & ~addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[1] = ~(~addrb[WORDSWD-1] &  addrb[WORDSWD-2] & ~cenb);
assign cenb_merge[0] = ~(~addrb[WORDSWD-1] & ~addrb[WORDSWD-2] & ~cenb);
assign ram_outb  = addrb[WORDSWD-1] &  addrb[WORDSWD-2] ? ram_out3b :
                  addrb[WORDSWD-1] & ~addrb[WORDSWD-2] ? ram_out2b :
                 ~addrb[WORDSWD-1] &  addrb[WORDSWD-2] ? ram_out1b :
				                                         ram_out0b;
end
if((WORDSWD-RAM_AWD)==1) begin
assign cena_merge[1] = ~( addra[WORDSWD-1] & ~cena);
assign cena_merge[0] = ~(~addra[WORDSWD-1] & ~cena);
assign ram_outa = addra[WORDSWD-1] ? ram_out1a :
				                     ram_out0a;
assign cenb_merge[1] = ~( addrb[WORDSWD-1] & ~cenb);
assign cenb_merge[0] = ~(~addrb[WORDSWD-1] & ~cenb);
assign ram_outb  = addrb[WORDSWD-1] ? ram_out1b :
				                     ram_out0b;
end
if((WORDSWD-RAM_AWD)==0) begin
assign cena_merge = cena;
assign cenb_merge = cenb;
end
endgenerate

generate
for(genvar num=0;num<(BITS/RAM_BITS);num=num+1) begin
if((WORDSWD-RAM_AWD)==2) begin
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram3
(
.CENYA(CENYA), 
.WENYA(WENYA), 
.AYA(AYA), 
.CENYB(CENYB), 
.WENYB(WENYB), 
.AYB(AYB), 
.SOA(SOA), 
.SOB(SOB),
.TENA(TENA),
.TCENA(TCENA), 
.TWENA(TWENA), 
.TAA(TAA), 
.TDA(TDA), 
.TENB(TENB), 
.TCENB(TCENB), 
.TWENB(TWENB), 
.TAB(TAB), 
.TDB(TDB), 
.SIA(SIA), 
.SEA(SEA), 
.DFTRAMBYP(DFTRAMBYP), 
.SIB(SIB), 
.SEB(SEB), 
.RET1N(RET1N), 
.COLLDISN(COLLDISN), 
.QA(ram_out3a[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge[3]), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_out3b[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge[3]), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB(wdatab[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram2
(
.CENYA(CENYA), 
.WENYA(WENYA), 
.AYA(AYA), 
.CENYB(CENYB), 
.WENYB(WENYB), 
.AYB(AYB), 
.SOA(SOA), 
.SOB(SOB),
.TENA(TENA),
.TCENA(TCENA), 
.TWENA(TWENA), 
.TAA(TAA), 
.TDA(TDA), 
.TENB(TENB), 
.TCENB(TCENB), 
.TWENB(TWENB), 
.TAB(TAB), 
.TDB(TDB), 
.SIA(SIA), 
.SEA(SEA), 
.DFTRAMBYP(DFTRAMBYP), 
.SIB(SIB), 
.SEB(SEB), 
.RET1N(RET1N), 
.COLLDISN(COLLDISN), 
.QA(ram_out2a[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge[2]), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_out2b[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge[2]), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB(wdatab[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
end
if((WORDSWD-RAM_AWD)>=1) begin
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram1
(
.CENYA(CENYA), 
.WENYA(WENYA), 
.AYA(AYA), 
.CENYB(CENYB), 
.WENYB(WENYB), 
.AYB(AYB), 
.SOA(SOA), 
.SOB(SOB),
.TENA(TENA),
.TCENA(TCENA), 
.TWENA(TWENA), 
.TAA(TAA), 
.TDA(TDA), 
.TENB(TENB), 
.TCENB(TCENB), 
.TWENB(TWENB), 
.TAB(TAB), 
.TDB(TDB), 
.SIA(SIA), 
.SEA(SEA), 
.DFTRAMBYP(DFTRAMBYP), 
.SIB(SIB), 
.SEB(SEB), 
.RET1N(RET1N), 
.COLLDISN(COLLDISN), 
.QA(ram_out1a[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge[1]), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_out1b[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge[1]), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB(wdatab[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram0
(
.CENYA(CENYA), 
.WENYA(WENYA), 
.AYA(AYA), 
.CENYB(CENYB), 
.WENYB(WENYB), 
.AYB(AYB), 
.SOA(SOA), 
.SOB(SOB),
.TENA(TENA),
.TCENA(TCENA), 
.TWENA(TWENA), 
.TAA(TAA), 
.TDA(TDA), 
.TENB(TENB), 
.TCENB(TCENB), 
.TWENB(TWENB), 
.TAB(TAB), 
.TDB(TDB), 
.SIA(SIA), 
.SEA(SEA), 
.DFTRAMBYP(DFTRAMBYP), 
.SIB(SIB), 
.SEB(SEB), 
.RET1N(RET1N), 
.COLLDISN(COLLDISN), 
.QA(ram_out0a[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge[0]), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_out0b[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge[0]), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB(wdatab[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
end
if((WORDSWD-RAM_AWD)==0) begin
sramdp_wrapper
#(RAM_AWD, RAM_BITS)
U_ram
(
.CENYA(CENYA), 
.WENYA(WENYA), 
.AYA(AYA), 
.CENYB(CENYB), 
.WENYB(WENYB), 
.AYB(AYB), 
.SOA(SOA), 
.SOB(SOB),
.TENA(TENA),
.TCENA(TCENA), 
.TWENA(TWENA), 
.TAA(TAA), 
.TDA(TDA), 
.TENB(TENB), 
.TCENB(TCENB), 
.TWENB(TWENB), 
.TAB(TAB), 
.TDB(TDB), 
.SIA(SIA), 
.SEA(SEA), 
.DFTRAMBYP(DFTRAMBYP), 
.SIB(SIB), 
.SEB(SEB), 
.RET1N(RET1N), 
.COLLDISN(COLLDISN), 
.QA(ram_outa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKA(i_clk), 
.CENA(cena_merge), 
.WENA(wen[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENA(gwena), 
.AA(addra[RAM_AWD-1:0]), 
.DA(wdataa[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.QB(ram_outb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.CLKB(i_clk), 
.CENB(cenb_merge), 
.WENB(wenb[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.GWENB(GWENB), 
.AB(addrb[RAM_AWD-1:0]), 
.DB(wdatab[RAM_BITS*(num+1)-1:RAM_BITS*num]), 
.EMAA(EMA), 
.EMAWA(EMAW), 
.EMAB(EMA), 
.EMAWB(EMAW)
);
end
end //gen for
endgenerate

`endif //`ifdef FPGA
  
endmodule

