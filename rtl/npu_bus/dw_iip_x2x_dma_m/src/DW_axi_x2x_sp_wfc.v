/////////////////////////////////////////////////////////////////////////
//
//                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
//  The entire notice above must be reproduced on all authorized copies.
//
/////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
// ID maintain and stall xact for fanout (write fanout control)
/////////////////////////////////////////////////////////////////////////


module dma_m_DW_axi_x2x_sp_wfc (
 //inputs
  addr_fifo_ept_i,
  avalid_i,
  payload_i,
  rs_push_req_n_i,
  aready_i,
  rs_fifo_full_i,
  port_num_i,

 //outputs
  avalid_o,
  payload_o,
  rs_push_req_n_o,
  aready_o,
  rs_fifo_full_o
);

  //parameters
  parameter SPPLD_W    = `X2X_AWPYLD_W_SP;      //SP payload width
  parameter NUM_PORTS  = `X2X_NUM_W_PORTS;      //number of fanout ports
  parameter NUM_PORT_W = `X2X_LOG2_NUM_W_PORTS; //port number width
  parameter BUS_SPPLDW = NUM_PORTS * SPPLD_W;   //BUS payload width

  //inputs
  input                  addr_fifo_ept_i;  //Address FIFO empty signal
  input                  avalid_i;         //valid from resize
  input [SPPLD_W-1:0]    payload_i;        //payload from RS
  input                  rs_push_req_n_i;  //push enable from RS
  input [NUM_PORTS-1:0]  aready_i;         //ready from ports
  input [NUM_PORTS-1:0]  rs_fifo_full_i;   //bus RS FIFO full signal
  input [NUM_PORT_W-1:0] port_num_i;       //port number located
  
  //outputs
  output [NUM_PORTS-1:0]  avalid_o;         //valid to port1 to AXI slave
  output [BUS_SPPLDW-1:0] payload_o;        //BUS payload
  output [NUM_PORTS-1:0]  rs_push_req_n_o;  //push enable to RS FIFO1
  output                  aready_o;         //ready signal to resizer
  output                  rs_fifo_full_o;   //RS FIFO full to resizer
                                            //when ADDR fifo not empty
                                            //and corresponding RS fifo
                                            //not full from W of SP.


  integer               i, j;


  // Remove write interleaving fan out logic if fan out is not 
  // configured to exist.

  // Drive output signals to known values if there is no
  // write interleaving fan out in the configuration.
  assign avalid_o        = 1'b0;
  assign payload_o       = {BUS_SPPLDW{1'b0}};
  assign rs_push_req_n_o = {NUM_PORTS{1'b0}};
  assign aready_o        = 1'b0;
  assign rs_fifo_full_o  = 1'b0;



endmodule
