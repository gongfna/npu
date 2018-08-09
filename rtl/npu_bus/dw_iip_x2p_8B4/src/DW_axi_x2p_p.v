/*
 ------------------------------------------------------------------------
--
--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
--                            ALL RIGHTS RESERVED
--
--  This software and the associated documentation are confidential and
--  proprietary to Synopsys, Inc.  Your use or disclosure of this
--  software is subject to the terms and conditions of a written
--  license agreement between you, or your company, and Synopsys, Inc.
--
--  The entire notice above must be reproduced on all authorized copies.
*/


//-----------------------------------------------------------------------------
// Filename    : DW_axi_x2p.v
// Created     : Thurs Dec 15 15:00:00 GMT 2005
// Description : AXI Slave
//               Top Level of the AXI Slave controls
//               
//----------------------------------------------------------------------------


/*********************************************************************/
/*                                                                   */
/*                  AXI_SLAVE module                                 */
/*                                                                   */
/*                                                                   */
/*********************************************************************/


module DW_axi_x2p_p(/*AUTOARG*/
   // Outputs
   awready, wready, bid, bresp, bvalid, wr_push_comm_cmd_q_n,
   rd_push_comm_cmd_q_n, cmd_queue_wd, push_cmd_queue_n, pop_resp_n,
   write_buffer_wd, push_write_buffer_n, rid, rdata, rresp, rlast,
   rvalid, arready, pop_data_int_n,
   // Inputs
   awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot,
   awvalid, wid, wdata, wstrb, wlast, wvalid, bready, cmd_queue_rdy_n,
   response_avail_n, pop_resp_word, write_buff_rdy_n, arid, araddr,
   arlen, arsize, arburst, arlock, arcache, arprot, arvalid, rready,
   arstatus_int, arid_int, arlast_int, ardata_int, arvalid_int_n
   );
   parameter AXI_ID_WIDTH = 4;
   parameter AXI_ADDR_WIDTH = 32;
   parameter AXI_DATA_WIDTH = 32;
   parameter AXI_WSTRB_WIDTH = 4;
   parameter CMD_QUEUE_WIDTH = AXI_ADDR_WIDTH + AXI_ID_WIDTH + 17;
   parameter WDFIFO_WIDTH = AXI_DATA_WIDTH + AXI_DATA_WIDTH/8 +1;
   parameter AXI_LEN_WIDTH = 4;
   

  // Signals user for the AXI master reading refer to sec 2.5
  //   AMBA AXI Protocol v1.0 from ARM              
  input [AXI_ID_WIDTH-1:0]     awid;    // id to slave
  input [AXI_ADDR_WIDTH-1:0]   awaddr;
  input [AXI_LEN_WIDTH-1:0]    awlen;
  input [2:0]                  awsize;
  input [1:0]                  awburst;
  input [1:0]                  awlock;
  input [3:0]                  awcache;
  input [2:0]                  awprot;
  input                        awvalid;
  output                       awready;   
  input [AXI_ID_WIDTH-1:0]     wid;
  input [AXI_DATA_WIDTH-1:0]   wdata;
  input [AXI_WSTRB_WIDTH-1:0]  wstrb;
  input                        wlast;
  input                        wvalid;
 
  output                       wready;
  output [AXI_ID_WIDTH-1:0]    bid;
  output [1:0]                 bresp;
  output                       bvalid;
  input                        bready;

   
  // these are used for the command queue
  output                       wr_push_comm_cmd_q_n;
  output                       rd_push_comm_cmd_q_n;
  output [CMD_QUEUE_WIDTH:0] cmd_queue_wd;
  output                       push_cmd_queue_n;
  input                        cmd_queue_rdy_n;
  //  the response buffer
  input                        response_avail_n;
  input [AXI_ID_WIDTH:0]       pop_resp_word;   // ID plus two bit status
  output                       pop_resp_n;
 
  //the write buffer
  output [WDFIFO_WIDTH-1:0]    write_buffer_wd;  // include the WSTRB and LAST
  output                       push_write_buffer_n;
  input                        write_buff_rdy_n;
  
  input [AXI_ID_WIDTH-1:0]     arid;    // id to slave
  input [AXI_ADDR_WIDTH-1:0]   araddr;  
  input [AXI_LEN_WIDTH-1:0]    arlen;
  input [2:0]                  arsize;
  input [1:0]                  arburst;
  input [1:0]                  arlock;
  input [3:0]                  arcache;
  input [2:0]                  arprot;
  input                        arvalid;
  input                        rready;   // ready to accept read data
  
  /* signals returned from the slave */
  output [AXI_ID_WIDTH-1:0]    rid;
  output [AXI_DATA_WIDTH-1:0]  rdata;
  output [1:0]                 rresp;
  output                       rlast;
  output                       rvalid; 
  output                       arready;

 // the read data fifo
  input                        arstatus_int;
  input [AXI_ID_WIDTH-1:0]     arid_int;
  input                        arlast_int;
  input [AXI_DATA_WIDTH-1:0]   ardata_int;
  output                       pop_data_int_n;
  input                        arvalid_int_n;
  
  reg                          push_cmd_queue_n;
  reg    [CMD_QUEUE_WIDTH:0] cmd_queue_wd;
  wire [AXI_ID_WIDTH-1:0]      bid;
  wire [1:0]                   bresp;  
  wire [WDFIFO_WIDTH-1:0]      write_buffer_wd;  // include the WSTRB and LAST

  // write cmd queue
   reg [CMD_QUEUE_WIDTH:0]    wr_cmd_queue_wd;
   reg [CMD_QUEUE_WIDTH:0]    rd_cmd_queue_wd;

//----------------------------------------------------------------------------- 
//                  The RESPONSE for writes                       
// passes the responses from the response buffer to the AXI       
// and the Write Data Buffer                                      
//-----------------------------------------------------------------------------
  
  // Issuing the response
  // loop on the Response Buffer upon seeing it not empty 
  // pass on the ID and error code. Keep poping until empty
  // hold the bvalid and response until bready

  // set up so all the outputs are registered out of the fifo
  assign bvalid =  (response_avail_n == 1'b0);
  assign bresp = {pop_resp_word[AXI_ID_WIDTH],1'b0};
  assign bid   = pop_resp_word[AXI_ID_WIDTH-1:0];
  assign pop_resp_n = ~((response_avail_n == 1'b0) && (bready == 1'b1));

//-----------------------------------------------------------------------------
// 
//               AXI Slave Write Control
//               Controls for writting. Pushing the command queue
//               and pushing data fromthe AXI-W into the write data buffer
//-----------------------------------------------------------------------------     


  //           command queue operations
  // send the the AWREADY if the
  // command queue is ready, as soon as the AWVALID shows up 
  // modified for APB by eliminating the  unused AXI cache, protect, lock
   assign wr_push_comm_cmd_q_n = ~((cmd_queue_rdy_n == 1'b0) && (awvalid == 1'b1));

   always @(/*AS*/awaddr or awburst or awid or awlen or awsize)
     begin
	wr_cmd_queue_wd = {awaddr,awid,awlen,awsize,awburst,1'b1};
/*;
       wr_cmd_queue_wd[AXI_DATA_WIDTH-1:0] = awaddr;
       wr_cmd_queue_wd = wr_cmd_queue_wd << AXI_ID_WIDTH; 
       wr_cmd_queue_wd[AXI_ID_WIDTH-1:0] = awid;
       wr_cmd_queue_wd = wr_cmd_queue_wd << AXI_LEN_WIDTH;
       wr_cmd_queue_wd[AXI_LEN_WIDTH-1:0] = awlen;
       wr_cmd_queue_wd = wr_cmd_queue_wd << 3;
       wr_cmd_queue_wd[2:0] = awsize;
       wr_cmd_queue_wd = wr_cmd_queue_wd << 2;
       wr_cmd_queue_wd[1:0] = awburst;
       wr_cmd_queue_wd = wr_cmd_queue_wd << 1;
       wr_cmd_queue_wd[0] = 1'b1;*/
     end // always @ (...
   
  assign awready = ~cmd_queue_rdy_n;

  // select which is to go to the command queue
  // the push commands come from the external arbritation
  always @(/*AS*/rd_cmd_queue_wd or rd_push_comm_cmd_q_n
	   or wr_cmd_queue_wd or wr_push_comm_cmd_q_n)
    begin
    /* this will be used to arb the pushes from read and write */
    /* there will be no conflicts between read and write */
      push_cmd_queue_n = wr_push_comm_cmd_q_n & rd_push_comm_cmd_q_n;
      if (rd_push_comm_cmd_q_n != 1) cmd_queue_wd = rd_cmd_queue_wd;
      else cmd_queue_wd = wr_cmd_queue_wd;
    end

  //           write data buffer
  // push the write data buffer anytime the AXI is writting and
  // the write data buffer is not full
  assign push_write_buffer_n = ~((write_buff_rdy_n == 1'b0) && (wvalid == 1'b1));
  assign write_buffer_wd = {wdata,wstrb,wlast};
  assign wready = ~write_buff_rdy_n;
    
//-----------------------------------------------------------------------------
// 
//              AXI Slave Read Controls
//                                                                  
//              Two independent operations:                                       
//                  1) Push Commands                                                  
//                     Monitor the AXI for a read operation. Upon sensing ARVALID    
//                     push the command queue and return ARREADY                      
//                  2) Monitor the Read Data Buffer and as long as it is not empty    
//                     pop its contents and present it to the AXI                      
//
//-----------------------------------------------------------------------------

//
//         Pushing the command queue
//
// push the command queue whenever the AXI-R comes
// if the command queue is available
// as soon as the ARVALID shows up send the the ARREADY
   // modified for APB by excluding the AXI cache,protect, and lock
   always @(/*AS*/araddr or arburst or arid or arlen or arsize)
     begin
	rd_cmd_queue_wd = {araddr,arid,arlen,arsize,arburst,1'b0};
     end
   

  assign rd_push_comm_cmd_q_n = ~((cmd_queue_rdy_n == 1'b0) && (arvalid == 1'b1));
  assign arready = ~cmd_queue_rdy_n;
  
//
//   The Read DATA Buffer 
//   as long as the read buffer contains anything keep popping it
//   and putting the contents out to the AXI
// 

  // As long as there is something in the Read Data Buffer issue RVALID
  assign rvalid = ~arvalid_int_n;
  // Pop the Read Data Buffer when its not empty and the AXI has issued RREADY
  assign pop_data_int_n = ~((rready == 1'b1) && (arvalid_int_n == 1'b0));
  
  assign rdata = ardata_int;
  assign rid = arid_int;
  assign rresp = {arstatus_int,1'b0};
  assign rlast = arlast_int;

endmodule // DW_axi_x2p_slave
























