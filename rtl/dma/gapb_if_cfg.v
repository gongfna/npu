/*****************************************************************************
** Project  :  cevaXS1100                                                   **
******************************************************************************
**                                      **                                  **
** File name:  gapb_if_cfg.v            **           Ceva Inc.              **
** Designer :  Ran Halutz               **  DSP Cores & Platforms Division  **
**                                      **                                  **
******************************************************************************
******************************************************************************
**                                                                          **
** Module Description:                                                      **
**                                                                          **
** This module implements generic interface for APB protocol registers.     **
** The module outputs write enable signals that should be used in a clock   **
** gater, in order to write to the registers.                               **
** The module should receive on its regs_port bus a concatenation of all the**
** registers outputs - for read transactions. (this way read masks and read **
** only registers may be implemented by inserting zero instead of the regs  **
** output).                                                                 **
**                                                                          **
** The module assumes CONSECUTIVE address, i.e 0,1,2,3,4                    **
**                                                                          **
******************************************************************************
******************************************************************************
**                                                                          **
** Hierarchy:                                                               **
**                                                                          **
** gapb_if_cfg.v                                                            **
**   |                                                                      **
**   +---->gmux_one_hot_cfg                                                 **
**   |                                                                      **
**   +---->clock_gater                                                      **
**                                                                          **
******************************************************************************
******************************************************************************
**                                                                          **
**   RTL Version        Date                                                **
**   -----------      ---------                                             **
**      V0.2          15Aug2004                                             **
**                                                                          **
******************************************************************************
****************************************************************************** 
** This file has been provided pursuant to a License Agreement containing   **
** restrictions on its use. This data contains valuable trade secrets       **
** and proprietary information of Ceva Inc. and is protected                **
*****************************************************************************/
// $Revision: 1.2 $

module gapb_if_cfg (/*AUTOARG*/
   // Outputs
   prdata, blk_reg_wr_en, 
   // Inputs
   psel, penable, pwrite, pclk, paddr, rst_n, tst_gatedclock, regs_port
   );

// synopsys template
 parameter REG_NUM = 8;                // Number of registers to control
 parameter ADDR_WIDTH = 3;             // Address width to decode

/******************************************************** INPUTS **************************************************************/
// APB bus inputs
input psel;                            // APB select signal
input penable;                         // APB enable signal
input pwrite;                          // APB write signal
input pclk;                            // APB clock
input [ADDR_WIDTH-1:0] paddr;          // APB address bus
// General inputs
input rst_n;                           // Reset
input tst_gatedclock;                          // Scan enable
// Reigsters input bus
input [32*REG_NUM-1:0] regs_port;      // Registers bus

/******************************************************** OUTPUTS *************************************************************/
output [31:0] prdata;                  // APB read data bus
output [REG_NUM-1:0] blk_reg_wr_en;    // Write enable bus to registers


/*************************************************** WIRE DECLARATIONS ********************************************************/
// Read transaction signals
wire blk_rd_trans;                     // Read indication
wire [31:0] blk_prdata_tmp;            // Read mux output
wire blk_prata_wr_en;                  // prdata clock gater enable signal
wire blk_prdata_wr;                    // prdata gated clock   
// Write transaction signals
wire blk_wr_trans;                     // Write indication
wire [REG_NUM-1:0] blk_reg_wr_en;      // Write enable bus to registers



/**************************************************** REG DECLARATIONS ********************************************************/
// Read transactions address decoding
integer r;                             // index for read address decoding
reg [REG_NUM-1:0] blk_rd_adec;         // Address decoding result for read transaction
// Write transactions addres decoding
integer w;                             // index for write address decoding
reg [REG_NUM-1:0] blk_wr_adec;         // Address decoding result for write transaction

/************************************************ PHYSICAL REG DECLARATIONS ***************************************************/
reg [31:0] prdata;                     // APB read data bus
reg [ADDR_WIDTH-1:0] blk_paddr_r;      // APB address bus, Sampled
reg blk_psel_r;                        // APB select signal, Sampled
reg blk_pwrite_r;                      // APB write signal, Sampled


/*************************************************** END OF DECLARATIONS ******************************************************/


// ******************************************************************************************
// Read transaction
// ******************************************************************************************

// ******************************************************************
// Address decoding for read transactions
// ******************************************************************

   // Read indication
   assign blk_rd_trans = (psel &      // APB select signal 
                          ~pwrite);   // APB write signal

   // Addres decoding and read mux control
   always @(/*AUTO SENSE*/blk_rd_trans or paddr)
     begin
	for (r=0 ; r<REG_NUM ; r=r+1)
	  blk_rd_adec[r] = ({1'b1,{64-ADDR_WIDTH{1'b0}},paddr[ADDR_WIDTH-1:0]} == ({blk_rd_trans,{64{1'b0}}} + r));
     end
 
   // read mux
   gmux_one_hot_cfg #(32,REG_NUM) read_mux(/*AUTO INST*/
			     // Outputs
			     .dataout	(blk_prdata_tmp[31:0]),
			     // Inputs
			     .datain	(regs_port[32*REG_NUM-1:0]),
			     .sel	(blk_rd_adec[REG_NUM-1:0]));


// ******************************************************************
// Sample the read data
// ******************************************************************

   // prdata clock gater enable signal
   assign blk_prata_wr_en = blk_rd_trans;

   // prdata clock gater
   clock_gater blk_prdata_gater (// Outputs
				    .gclk    (blk_prdata_wr),	 
				    // Inputs
				    .clk     (pclk),			 
				    .enable  (blk_prata_wr_en), 
				    .wait_r  (1'b0),		 
				    .tst_gatedclock  (tst_gatedclock));		         

   // Sample prdata register
   always @ ( posedge blk_prdata_wr or negedge rst_n ) begin
      if (~rst_n) 
	prdata[31:0] <= 32'h00000000;
      else 
	prdata[31:0] <= blk_prdata_tmp[31:0];
   end


// ******************************************************************************************
// Write transaction
// ******************************************************************************************

// ******************************************************************
// Sample APB signals for write transactions
// ******************************************************************

   // Sample address bus
   always @ ( posedge pclk or negedge rst_n ) begin
      if (~rst_n) 
	blk_paddr_r[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
      else 
	blk_paddr_r[ADDR_WIDTH-1:0] <= paddr[ADDR_WIDTH-1:0];
   end

   // Sample select signal
   always @ ( posedge pclk or negedge rst_n ) begin
      if (~rst_n) 
	blk_psel_r <= 1'b0;
      else 
	blk_psel_r <= psel;
   end

   // Sample write signal
   always @ ( posedge pclk or negedge rst_n ) begin
      if (~rst_n) 
	blk_pwrite_r <= 1'b0;
      else 
	blk_pwrite_r <= pwrite;
   end


// ******************************************************************
// address decoding for write transactions
// ******************************************************************

   // Write indication (from sampled bus controls)
   assign blk_wr_trans = (blk_psel_r &      // APB select signal, Sampled
                          blk_pwrite_r);    // APB write signal, Sampled

   // Addres decoding and wr_en generation
   always @(/*AUTO SENSE*/blk_paddr_r or blk_wr_trans)
     begin
	for (w=0 ; w<REG_NUM ; w=w+1)
	  blk_wr_adec [w] = ({1'b1,{64-ADDR_WIDTH{1'b0}},blk_paddr_r[ADDR_WIDTH-1:0]} == ({blk_wr_trans,{64{1'b0}}} + w));
     end

   // Write enable signals bus
   assign blk_reg_wr_en[REG_NUM-1:0] = (blk_wr_adec[REG_NUM-1:0] &   // Address decoding result
                                        {REG_NUM{penable}});         // penable signal

endmodule









