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
//
// Filename    : DW_axi_x2ps_addr_dcd.v
// 
// Description : APB Address  generation and range checking for DW_axi_x2p bridge.
//-----------------------------------------------------------------------------

module x32_DW_axi_x2p_s_addr_dcd (/*AUTOARG*/
  // Outputs
  dcd_error, paddr, psel, 
  // Inputs
  clk, rstn, cmd_addr, cmd_type, cmd_size, cmd_len, cmd_direction, 
  incr_addr, incr_base_addr, set_addr, incr_value, base_incr_value, 
  update_address
  );

   input                              clk;
   input                              rstn;

// Interface to Common CMD Queue - the address field

   input [`X2P_CMD_ADDR_WIDTH-1:0] cmd_addr;   // starting address of corrent transaction
   input [1:0] 			   cmd_type; // INCR,FIXED,WRAP
   input [2:0] 			   cmd_size;
   input [`LEN_WIDTH-1:0] 	   cmd_len;
   input 			   cmd_direction;
   
   input 			   incr_addr;
   input 			   incr_base_addr;
   input 			   set_addr;
  
   input[`X2P_MAX_AXI_SIZE:0]      incr_value; // used to incr the paddr
   input[`X2P_MAX_AXI_SIZE:0]      base_incr_value; // used to incr during the write buff pop
   
   input 			   update_address;
   
   output 			   dcd_error;
   output [`X2P_APB_ADDR_WIDTH-1:0]   paddr;
  output [15:0]                       psel;     //results of the address decoder. 
 
   reg [`X2P_APB_ADDR_WIDTH-1:0]   paddr;
   wire [`X2P_APB_ADDR_WIDTH-1:0]  next_paddr; 
  
   
  reg [15:0]                       psel;   
  wire [15:0]                      next_psel,raw_psel;   
   

   wire  [`X2P_CMD_ADDR_WIDTH-1:0] cmd_addr;
   reg [`X2P_CMD_ADDR_WIDTH-1:0]  next_address, address_temp, address,
                                  next_address_from_set, next_base_address_from_set, 
                                 next_address_from_incr_base, next_base_address_from_incr_base,
                                  next_address_from_incr, next_base_address_from_incr,  
				   base_addr, next_base_addr,addr_lsb_mask;
  
    
                                                          
   wire [1:0] 			  cmd_type;
   wire [2:0] 			   cmd_size;
   wire [`LEN_WIDTH-1:0] 	   cmd_len;
   wire 			   dcd_error;
   wire [`X2P_MAX_AXI_SIZE:0] 	   incr_value;
   wire [`X2P_MAX_AXI_SIZE:0] 	   base_incr_value;
 // being explict in setting the priorites for next address generation;
   
   wire 			   set_address = set_addr;
   wire 			   incr_base_address = (!set_addr & incr_base_addr);
   wire 			   incr_address = incr_addr & !(set_addr | incr_base_addr);
   wire                            next_decode_error;
   
   
`define APB_ADD_INC (`X2P_APB_DATA_WIDTH > 16) ? 4 : ((`X2P_APB_DATA_WIDTH > 8) ? 2 : 1)
`define APB_IND (`X2P_APB_DATA_WIDTH > 16) ? 2 : ((`X2P_APB_DATA_WIDTH > 8) ? 1 : 0)
`define AXI_MOD ((`X2P_AXI_DW > 256) ? 6 :((`X2P_AXI_DW > 128) ? 5 : ((`X2P_AXI_DW > 64) ? 4 : ((`X2P_AXI_DW > 32) ? 3 :((`X2P_AXI_DW > 16) ? 2 : 1)))))
   
     /* AUTO_CONSTANT (`APB_ADD_INC,`APB_IND, `X2P_CMD_ADDR_WIDTH, `AXI_MOD `X2P_APB_SIZE) */

   wire [8:0] 			   apb_incr,base_apb_incr;
   wire [8:0] 			   apb_add_inc = 1 << `X2P_APB_SIZE;
   
   
   reg [7:0] 			   base_addr_inc;

   reg 			           wrap_error;    // given when wrap len is not a power of 2
   

   assign 			   apb_incr = incr_value << `X2P_APB_SIZE;
   assign 			   base_apb_incr = base_incr_value << `X2P_APB_SIZE;
   
 /* AUTO_CONSTANT (`X2P_AXI_BLW) */
 // incriment the base address by the AXI beat size
 always @(/*AS*/cmd_size)
   begin
      base_addr_inc = 1;

      // Intended to Shift by non-constant
      // leda W244 off
      base_addr_inc = base_addr_inc << cmd_size;
   end
// used in WRAP to mask the wrap address
   always @(/*AS*/cmd_len or cmd_size or cmd_type)
     begin
	addr_lsb_mask = -1;
	wrap_error    = 0;
	
        if (cmd_type == 2)
	  begin
	    // to do wrap set up the mask for the address
            // set to the number of beats.
	    // The width of the case control signal varies for
	    // different configurations, hence the Leda warning
	    // can be disabled here.
	    // leda W263 off
	    case(cmd_len)      
	      1      : addr_lsb_mask[0]   = 0;
	      3      : addr_lsb_mask[1:0] = 0;
	      7      : addr_lsb_mask[2:0] = 0;
	      15     : addr_lsb_mask[3:0] = 0;
	      31     : addr_lsb_mask[4:0] = 0;
	      63     : addr_lsb_mask[5:0] = 0;
	      127    : addr_lsb_mask[6:0] = 0;
	      255    : addr_lsb_mask[7:0] = 0;
	      default:
		begin
		       wrap_error         = 1;
		       addr_lsb_mask      = 0;
	        end     
	    endcase // case(cmd_len)
	    // leda W263 on
	     
	    // multiply the beats  by the size this will get the total bytes in the transfer
	    // and the locs for the wrapping address 
	    addr_lsb_mask = addr_lsb_mask << cmd_size;
	    // leda W244 on
	  end // if (cmd_type == 2)
     end // always @ (...
   
       
   //********************************************************************************
   //
   //  Addresss generation
   //  Overriding in the following order
   //  if set_addr 
   //     comes when the cmd queue is popped and in Fixed types when the
   //     last apb transfer for the AXI word
   //  else if incr_base_addr
   //      on the last apb word transfer of the AXI word
   //      The base_addr is the calculation of the address by SIZE incrs.
   //      the next_address sent o the APB is the base address incrimented by the APB
   //  else if incr_addr
   //      comes with each apb transfer
   //         
   //  
   //
   
   // the address generated on set address
   // at this time the write buff is being popped
   always @(/*AS*/base_apb_incr or cmd_addr or cmd_direction)
     begin
	next_base_address_from_set = cmd_addr; 
	      // the base is the cmd_add address
	      // indicatating the first beat address
        if (cmd_direction == 1'b1)
          begin
            // the address will be the base aligned to the AXI data 
	    // width displaced by the first write strobe
             next_address_from_set = {cmd_addr[`X2P_CMD_ADDR_WIDTH-1:`AXI_MOD],
                                     base_apb_incr[`AXI_MOD-1:0]};
	  end
	else
	  begin
         // read base is set to the cmd address
            next_address_from_set = cmd_addr;
      	  end // else: !if(cmd_direction == 1'b1)
     end // always @ (...

    // RTL was written with a particular function in mind so any
    // concerns regarding loss of carry/borrow in addition/subtraction
    // can be ignored by Leda.
    // leda W484 off

    // the incrimenting of the base is done when the write buffer
    // is being popped	     
    always @(/*AS*/addr_lsb_mask or address or apb_add_inc
             or base_addr or base_addr_inc or base_apb_incr
             or cmd_addr or cmd_direction or cmd_type)
      begin
	 next_address_from_incr_base = address;
	 next_base_address_from_incr_base = base_addr;
	     // a new beat from the AXI, calculate the address for the AXI beat
	     // incriment the base to the next beat AXI address
	case (cmd_type)
	  0: begin // Fixed
	     next_base_address_from_incr_base = cmd_addr;
	     next_address_from_incr_base = 0;
	     if (cmd_direction == 1'b1)
	        next_address_from_incr_base = {cmd_addr[`X2P_CMD_ADDR_WIDTH-1:`AXI_MOD],
                                          base_apb_incr[`AXI_MOD-1:0]};
	     else next_address_from_incr_base = cmd_addr;
	  end
	  1: begin
	     // the next address is set to the AXI word boundary
	     next_base_address_from_incr_base = base_addr + base_addr_inc;    
	     // the wite strobes will indicate the displacement
	     if (cmd_direction == 1'b1) 
               begin
		 next_address_from_incr_base = 
                   {next_base_address_from_incr_base[`X2P_CMD_ADDR_WIDTH-1:`AXI_MOD],
                                             base_apb_incr[`AXI_MOD-1:0]};
	       end
	     // read is just a increment of paddr b APB word
	     else next_address_from_incr_base = address + apb_add_inc;
	  end // case: 1
	  2: begin // WRAP     
	     // the incrimented base address is wrapped base on 
	     // incrementing the SIZE address bit
	     
	     address_temp = base_addr + base_addr_inc;
	     // now restore the address outside the wrap making this wrap on the SIZE * LEN bits
	     next_base_address_from_incr_base = base_addr & addr_lsb_mask;
	     next_base_address_from_incr_base = next_base_address_from_incr_base 
                                             | (address_temp & ~addr_lsb_mask);		     
 	     // the wite strobes will indicate the displacement
	     if (cmd_direction == 1'b1)
               begin
		  next_address_from_incr_base = 
                     {next_base_address_from_incr_base[`X2P_CMD_ADDR_WIDTH-1:`AXI_MOD],
                                              base_apb_incr[`AXI_MOD-1:0]};
	       end
		     // read is just a increment of paddr 
             else next_address_from_incr_base = next_base_address_from_incr_base;
	  end // case: 2
	  default: begin // all the others are considered to be INCR     
	     next_base_address_from_incr_base = base_addr + base_addr_inc;
	  end
	endcase // case(cmd_type)
      end // always @ (...


   // the incr address is used to just incriment the address by the apb word
   always @(/*AS*/address or apb_add_inc or base_addr)
     begin
	next_base_address_from_incr = base_addr;
	next_address_from_incr = address + apb_add_inc;     
     end

   // leda W484 on
   
   // now select which one to send to address
   always @(/*AS*/address or base_addr or incr_address
            or incr_base_address or next_address_from_incr
            or next_address_from_incr_base or next_address_from_set
            or next_base_address_from_incr
            or next_base_address_from_incr_base
            or next_base_address_from_set or set_address)
     begin
     /// the following sets up the priority of choices
     // above I set it such that only one of the signals could be activ
       next_address = address;
       next_base_addr = base_addr;
       if ({set_address,incr_base_address,incr_address} == 3'b0)
	 begin
	   next_address = address;
	   next_base_addr = base_addr;
	 end
	if (set_address == 1'b1)
	 begin
	   next_address = next_address_from_set;
	   next_base_addr = next_base_address_from_set;
	 end
       if (incr_base_address == 1'b1)
	 begin
	   next_address = next_address_from_incr_base;
	   next_base_addr = next_base_address_from_incr_base;
	 end
      if (incr_address == 1'b1)
	 begin
	   next_address = next_address_from_incr;
	   next_base_addr = next_base_address_from_incr;
	 end
     end // always @ (...
   
 
   // get the psels from the address decoder
   x32_DW_axi_x2p_dcdr
    U_apb_psel(.psel_addr({address[`X2P_CMD_ADDR_WIDTH-1:10],10'b0}),
			      .psel_err(next_decode_error),
			      .psel_int(raw_psel));
   assign dcd_error = next_decode_error | wrap_error;

   assign next_paddr = (update_address == 1'b1) ? next_address[`X2P_APB_ADDR_WIDTH-1:0] : paddr;
   assign next_psel = (update_address == 1'b1) ? raw_psel : psel;
		  
		  
   // now the register
   always @(posedge clk or negedge rstn)
     begin
	if (!rstn)
	  begin
	     base_addr <= 0;
	     paddr <= 0;
	     psel <= 0;
	     address <= 0;
	  end
	else
          begin
	     base_addr <= next_base_addr;
	     paddr <= next_paddr;
	     psel <= next_psel;
	     address <= next_address;
	  end // else: !if(!rstn)
     end // always @ (posedge clk or negedge rstn)

`undef APB_ADD_INC
`undef APB_IND
`undef AXI_MOD
   
endmodule // DW_axi_x2ps_addr_dcd
























