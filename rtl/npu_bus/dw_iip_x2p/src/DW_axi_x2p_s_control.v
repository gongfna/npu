//dwh/DW_ocb/DW_axi_x2p/dev_DW_axi_x2p/src/DW_axi_x2p_s_control.v#12 - edit change 1071512 (text)
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
// Filename    : DW_axi_x2ps_control.v
// Created     : Dec 19 2005
// Description : APB Master Control
//               The APB state machines 
//               
//----------------------------------------------------------------------------

/*********************************************************************/
/*                                                                   */
/*                  X2P_APB control module                           */
/*                                                                   */
/*                                                                   */
/*********************************************************************/

module DW_axi_x2p_s_control(/*AUTOARG*/
  // Outputs
  push_read_buffer_n, rd_error, enable_pack, last_push_read, 
  clr_rd_data_reg, penable, psel_en, pwrite, pop_write_buff_n, 
  pop_cmd_queue_n, push_rsp_buff_n, error, incr_addr, set_addr, 
  incr_base_addr, incr_value, base_incr_value, save_id, set_data, 
  next_apb_wd_sel, update_address, rd_cmd_size, 
  // Inputs
  clk, rstn, cmd_queue_wd, cmd_queue_empty, write_buffer_last, 
  next_write_buff_empty, selected_strobes, dcd_error, 
  read_buffer_full, pready, pslverr, first_strobes, 
  next_first_strobes, last_strobes, resp_rdy_n
  );

   input clk, rstn; 
  // these are used for the command queue
  input [`X2P_CMD_QUEUE_WIDTH:0] cmd_queue_wd;
  input                          cmd_queue_empty;
 
  //the write buffer
  input                       write_buffer_last;  // include the WSTRB and LAST
  input                       next_write_buff_empty;

// coming from the  data unpacking module
// strobes set for current APB word to write 
// address decode error from the address generation
   input [(`X2P_APB_DATA_WIDTH/8)-1:0] selected_strobes; // strobes for current APB word to write 
// address decode error from the address generation
   input 			       dcd_error;

   // interface to the read buffer
   input 	        	       read_buffer_full;
   output 			       push_read_buffer_n;
   reg 				       push_read_buffer_n,push_read_buffer_reg;
   output 			       rd_error;  
   
   // issues an update in the read buffer packer
   output 			       enable_pack;
   output 			       last_push_read;
   output 			       clr_rd_data_reg;
      
 // from the APB
   input 		        pready;
   input 		        pslverr;

   // the index pointing to the firstf non-zero strobes
   input [7:0] 		        first_strobes;
   input [7:0] 		        next_first_strobes;
   // points to the first of the last  0'd APB strobes
   input [7:0] 		        last_strobes;
   
   
   // to the APB
   output 		        penable;
   output 		        psel_en;    // this will enable the slect
   output 		        pwrite;
   

   // to pop the next write data word
   output 		        pop_write_buff_n;
   // pop the cmd queue
   output 		        pop_cmd_queue_n;
   // for pushing into the response buffer
   input 		        resp_rdy_n;
   output 		        push_rsp_buff_n;
   output 		        error;
// to address generator to incriment address
   output 		        incr_addr;   // incriment address
   output 		        set_addr;    // set in th epopped address
   wire 		        set_addr;
   output 		        incr_base_addr; // incriments per AXI beat
   output [`X2P_MAX_AXI_SIZE:0] incr_value;     // gives how many apb words to increment
   output [`X2P_MAX_AXI_SIZE:0] base_incr_value; // used while popping the write buff
   output 		        save_id;  // time to save he cmd_id
   
   // indicates the data is to be set
   output 		        set_data;
   
   // this will count the APB words
   output [7:0] 	        next_apb_wd_sel;
   output 		        update_address;
   output [2:0]                 rd_cmd_size; // this will be held allowing the packed data to be converted

 
   wire 		      update_address;
   
   reg  		      pwrite;
   reg 			      pop_write_buff_n;
 
   reg [7:0] 		      next_apb_wd_sel, apb_wd_sel;
   reg 			      psel_en;
  
   reg 			      penable;
  
   
   reg [7:0] 		      apb_wds_in_axi_wd, next_apb_wds_in_axi_wd; 

   wire  [`X2P_CMD_QUEUE_WIDTH:0]     cmd_queue_wd;
   wire 			write_buffer_last; 

   // break up the command word
   wire 		      cmd_direction = cmd_queue_wd[0];
   wire [1:0] 		      cmd_type = cmd_queue_wd[2:1];
   wire [2:0] 		      cmd_size = cmd_queue_wd[5:3];
   wire [2:0] 		      next_rd_cmd_size;   
   reg [2:0] 		      rd_cmd_size;
   
   wire [`LEN_WIDTH-1:0]      cmd_len = cmd_queue_wd[`LEN_WIDTH+5:6];
   wire [`X2P_AXI_AW-1:0] 	      cmd_addr;
   
   wire 		      wr_pop_cmd, save_id;
   reg 			      rd_pop_cmd;
   
   reg 			      next_error, error;
  
   reg 			      write_active, next_write_active;
   wire 		      wr_incr_base_addr;
   reg 			      pop_wr_buff_request,next_pop_wr_buff_request;
     
   wire 		      any_error;
   reg 			      next_rd_err;
   reg 			      rd_error;    // becomes read response
   
	
   // last apb word of the axi read buffer
   reg 			      next_apb_read_last, apb_read_last;
   reg 			      last_push_read,next_last_push_read;
   wire 		      next_push_read_buffer_n;
   
   // keeps count of the rmaning words to transfer in a read
   reg [`LEN_WIDTH-1:0]       apb_axi_beat, next_apb_axi_beat;

   integer 		      i;

   reg [`X2P_MAX_AXI_SIZE:0]  incr_value,base_incr_value;
   reg 			      write_buff_empty,write_buff_empty_ns;
   reg 			      write_buffer_last_reg,next_write_buffer_last_reg;
   
   wire                       next_wr_set_addr,
                              rd_set_addr,rd_incr_base_addr;
   wire 		      apb_finished;
   reg 			      initial_cmd_error;
   wire 		      wr_incr_addr,rd_incr_addr;
   
                               
  /* AUTO_CONSTANT (`APB_BUS_SIZE, `X2P_MAX_AXI_SIZE, `X2P_APB_DATA_WIDTH) */
    assign cmd_addr = cmd_queue_wd >> (`X2P_AXI_SIDW + `LEN_WIDTH + 6);


   reg [5:0] 		      next_state, state, next_state_check_on_strobes;
   
   //  bit 4 = 1 is a write
   parameter 		      IDLE = 0;
   parameter 		      WSEL   = 6'b010010; // bit 1 is PSEL
   parameter 		      WEN    = 6'b010011; // bit 0 is PENABLE 
   parameter 		      WDTWT  = 6'b010000;
   parameter 		      NWSEL  = 6'b010100;
   parameter 		      WRESP  = 6'b011000;
   parameter 		      NWEN   = 6'b011100; // forces a pop of the write buffer WSEL in time
   parameter 		      WTSTART= 6'b110000; // waiting for wr buff on stsrt   
   parameter 		      PURGE = 6'b001100;
   parameter 		      RSEL   = 6'b000010;
   parameter 		      REN    = 6'b000011;
   parameter 		      NREN   = 6'b101100;//used for initial address checks
   parameter 		      RBUFWT = 6'b000100;
   parameter 		      PREPURGE= 6'b100000; // used to put a blank cycle to allow a push before a purge
   

   wire [(`X2P_APB_DATA_WIDTH/8)-1:0] all_apb_strobes = -1;
   

   function [7:0] get_initial_apb_wd_sel;
      input [2:0] size;
      input [`X2P_AXI_AW-1:0] addr;
      // set the initial wd sel based on the address SIZE and the APB size
      // adjusts the count based on the address displacement
      // the value will end up pointing to the first byte of the first beat
      // to unpack from the write buffer
      integer sel_index;
      
      begin
	 get_initial_apb_wd_sel = 0;
	for(sel_index= 0; sel_index < 8; sel_index = sel_index+1)
          begin
	     if (sel_index < (size-`APB_BUS_SIZE)) 
               get_initial_apb_wd_sel[sel_index] = addr[`APB_BUS_SIZE + sel_index];
	  end
      end
   endfunction // get_initial_apb_wd_sel

   	
   //***************************************************************************
   // 
   //  The state machines 
   // 
   // 
   // ***************************************************************************/

   //  
   // the state machine for all controls in the X2XS
  
   always @(/*AS*/any_error or apb_axi_beat or apb_read_last
            or cmd_direction or cmd_len or cmd_queue_empty
            or dcd_error or error or initial_cmd_error
            or next_state_check_on_strobes or next_write_buff_empty
            or pop_wr_buff_request or pready or pslverr
            or read_buffer_full or resp_rdy_n or state
            or write_buff_empty or write_buffer_last
            or write_buffer_last_reg)
     begin
	next_state = state;
        penable = 1'b0;
        pwrite = 1'b0;
        psel_en = 1'b0;
       
	case(state)
	  IDLE: begin
	     next_state = IDLE;
	     if (cmd_queue_empty == 1'b0)
	       begin
                 if (cmd_direction == 1)
		   begin	    
		     if (next_write_buff_empty == 1'b0)
		       begin
		       // the cmd queue contains a write command and the write data 
		       // is available advance the write data buffer to the next word 
		       // while regestering the wr data this will sync up to the APB ops.
                         next_state = NWEN;
		       end
		     else next_state = WTSTART;
		   end // if (cmd_direction == 1)
	         else
                   begin
		    // The cmd queue is requesting a read operation
		     next_state = NREN;	      
               // address not aligned to the APB will reject this AXI transaction
		      // write will do this check during the NWEN
		    if (initial_cmd_error == 1'b1) next_state = PURGE;
		   end // else: !if(cmd_direction == 1)
	       end // if (cmd_queue_empty == 1'b0)
	  end // case: IDLE
	  PURGE:begin
	     next_state = PURGE;
	     if (cmd_direction == 1'b1)
	       begin
		 if (write_buffer_last == 1'b1)
		   next_state = WRESP;
	       end
	     else // a read purge requires the rd buffer be pushed
               begin
		  // counting to len 
		  if (apb_axi_beat == cmd_len)
		    begin
		       next_state = IDLE;
		       // check if the read buffer will take the last push
		       // if its full keep looping
		       if (read_buffer_full == 1'b1)
			 next_state = PURGE;
		    end
	       end // else: !if(cmd_direction == 1'b1)
	  end // case: PURGE
	  
    
	  //**********************************************************************
	  //*
	  //*           Write State Machine
	  //*
	  //**********************************************************************

	  WSEL:
	    begin
               pwrite = 1'b1;
               psel_en = 1'b1;
	       // this is when spel is asserted for one cycle before penable
	       next_state = WEN;
       	    end
	
	  WEN:
	    begin
               penable = 1'b1;
               pwrite = 1'b1;
               psel_en = 1'b1;
	       // this is the time where penable will normally be asserted
	       // if not writting to the APB this will just do the checks on the next
	       // while doing an APB access wait for PREADY before proceeding
	       // the NWEN is non APB transactionsfrom the AXI
	       if ((pready == 1'b1) && (state == WEN))
		 begin
		    next_state = WSEL;
		    // issuing the data
		    // now decide to continue with the issue of data
		    // apb_wd_sel 0 indicates done unpacking and presenting 
		    // the AXI wd on the APB
		    // last strobes 0 ndicates the AXI wd strobes are all 0
		    // in all these cases time to pop the write data buffer to 
		    // get the next AXI word
		    if (pop_wr_buff_request == 1'b0) 
		      begin
			 next_state = next_state_check_on_strobes;
		      end
		    else
 		    // getting here indicates that the write buffer needs popping
		    // check if the current registered buffer data is last
                    // if not last need to get the current buffer data register it 
                    // and pop it to the next
		    // if the current status of the write buff is empty
                    // have to go and wait for it to have something befor doing the pop
                    // next_write_buff_empty is the empty status direct from the write buff
                       begin
			 if (write_buffer_last_reg == 1'b1) 
                           next_state = WRESP;
			 else
                           begin
			     if (write_buff_empty == 1'b1)
                                next_state = WDTWT;
			     else 
			       next_state = next_state_check_on_strobes;
			   end
		       end // else: !if(pop_wr_buff_request == 1'b0)
		 end // if (((pready == 1'b1) && (state == WEN)) || (state == NWEN))
	    end // case: WEN,NWEN
          
 	  NWEN:
	    begin
	       // this is the time where penable will normally be asserted
	       // if not writting to the APB this will just do the checks on the next
	       // while doing an APB access wait for PREADY before proceeding
	       // the NWEN is non APB transactionsfrom the AXI
	       if (state == NWEN)
		 begin
		    next_state = WSEL;
		    // issuing the data
		    // now decide to continue with the issue of data
		    // apb_wd_sel 0 indicates done unpacking and presenting 
		    // the AXI wd on the APB
		    // last strobes 0 ndicates the AXI wd strobes are all 0
		    // in all these cases time to pop the write data buffer to 
		    // get the next AXI word
		    if (pop_wr_buff_request == 1'b0) 
		      begin
			 next_state = next_state_check_on_strobes;
		      end
		    else
 		    // getting here indicates that the write buffer needs popping
		    // check if the current registered buffer data is last
                    // if not last need to get the current buffer data register it 
                    // and pop it to the next
		    // if the current status of the write buff is empty
                    // have to go and wait for it to have something befor doing the pop
                    // next_write_buff_empty is the empty status direct from the write buff
                       begin
			 if (write_buffer_last_reg == 1'b1) 
                           next_state = WRESP;
			 else
                           begin
			     if (write_buff_empty == 1'b1)
                                next_state = WDTWT;
			     else 
			       next_state = next_state_check_on_strobes;
			   end
		       end // else: !if(pop_wr_buff_request == 1'b0)
		 end // if (((pready == 1'b1) && (state == WEN)) || (state == NWEN))
	    end // case: WEN,NWEN

	  WDTWT: begin
	     // getting ere the write buffer is empty and the transaction has not finished
	     // used while into the transfer
	     next_state = WDTWT;
	     if (next_write_buff_empty == 1'b0)
	       begin
		  next_state = NWEN;  // pop the write buff and register the current write data
	       end
	  end
	  WTSTART:
	    // needed to differiate waiting for the write buffer on start
	    // used to initialize to addressing
	    begin
	       next_state = WTSTART;
	       if (next_write_buff_empty == 1'b0)
		 begin
		    next_state = NWEN;
		 end
	    end
	  WRESP: begin
	     if (resp_rdy_n == 1'b0) next_state = IDLE;
	     else next_state = WRESP;
	  end
	  NWSEL:
	    // fougrep_nd that the strobes are all off
	    // get the next data
	    // should act the same a WEN but don't look for pready
	    begin
	       next_state = NWEN;
	    end
	
          //**********************************************************************
	  //*
	  //*          Read State Machine
	  //*
	  //**********************************************************************
	  RSEL: begin
             psel_en = 1'b1;
	     next_state = REN;
	  end
	  REN: begin
             penable = 1'b1;
             psel_en = 1'b1;
            
	     // this is the penable time in the APB read
	     // NREN is used only on startup. This functions as the REN
	     // in the final next address. psel and decode checks
	     next_state = state;
	     // wait for PREADY before proceding
	     if ((pready == 1'b1) && (state==REN))
	       begin
		  next_state = RSEL;
		  // if the APB has reached the AXI word size
		  // check to see if the read data can be pushed into the read buffer
		  // if it can be pushed then check to see if the AXI 
		  // transaction is finished
		  if (apb_read_last == 1'b1)
		    // time to push the read buffer
		    begin
		       if(read_buffer_full == 1'b1) 
                             next_state = RBUFWT;
		      else 
                        if (apb_axi_beat == cmd_len)
			  next_state = IDLE;
			else
                          // errror is pslverr registered. pslverr comes only on the
                          // single apb transaction so any error has to be saved
                          // the end of the fill of the axi word
                          if(dcd_error || pslverr || error) next_state = PREPURGE;
		    end // if (apb_read_last == 1'b1)
		  // if the next APB address dcds out of range
                  // push te read buffer with SLVERR 
                  else if (any_error == 1'b1) next_state =PREPURGE;
	       end // if (((pready == 1'b1) && (state==REN)) || (state == NREN))
	  end // case: REN,NREN
	  NREN: begin
	     // this is the penable time in the APB read
	     // NREN is used only on startup. This functions as the REN
	     // in the final next address. psel and decode checks
	     next_state = state;
	     // wait for PREADY before proceding
	     if (state == NREN)
	       begin
		  next_state = RSEL;
		  // if the APB has reached the AXI word size
		  // check to see if the read data can be pushed into the read buffer
		  // if it can be pushed then check to see if the AXI 
		  // transaction is finished
		  if (apb_read_last == 1'b1)
		    // time to push the read buffer
		    begin
		       if(read_buffer_full == 1'b1) 
                             next_state = RBUFWT;
		      else 
                        if (apb_axi_beat == cmd_len)
			  next_state = IDLE;
			else
                          // errror is pslverr registered. pslverr comes only on the
                          // single apb transaction so any error has to be saved
                          // the end of the fill of the axi word
                          if(dcd_error || pslverr || error) next_state = PREPURGE;
		    end // if (apb_read_last == 1'b1)
		  // if the next APB address dcds out of range
                  // push te read buffer with SLVERR 
                  else if (any_error == 1'b1) next_state =PREPURGE;
	       end // if (((pready == 1'b1) && (state==REN)) || (state == NREN))
	  end // case: REN,NREN          
          // PREPURGE is used to allow a pending good push read buffer
	  // to complete.
	  PREPURGE:begin     	 
                    next_state = PURGE;
	  end
	  RBUFWT: begin
	     // need to do a push but the read buffer id full
	     // keep looping here until the read buffer has space
	     if (read_buffer_full) next_state = RBUFWT;
	     else
	       begin
	     // returning from the push
	     // act as if this was the REN state	  
                if (apb_axi_beat == cmd_len)
		  next_state = IDLE; // finished exit
	        else
                  begin
		     // more to come get ack to accessing
		     next_state = RSEL;
	       // going to purge have to delay a cycle
	       // to alow the previous op to finish. Equivalent to
	       // a RSEL in a normal operation
	             if (any_error == 1'b1) next_state = PREPURGE;
		  end
	       end // else: !if(read_buffer_full)
	  end // case: RBUFWT
	  default: next_state = IDLE;
	endcase // case(state)
     end // always @ (...
   
  

   //******************************************************************************
   //      initial_cmd_error 
   //      
   // check for address alingment size smaller than the APB size
   //  
      
   always @(/*AS*/cmd_addr or cmd_size) 
      begin
	 initial_cmd_error = 0;

	 // Case-select expression is constant due to configuration
	 // parameter, hence this warning can be disabled:
	 // leda W226 off
	 // Check the cmd_address for alignment for reads
	 case(`APB_BUS_SIZE)
	   0:initial_cmd_error = 0;
	   1:if(cmd_addr[0:0] != 0) initial_cmd_error = 1'b1;
	   2:if(cmd_addr[1:0] != 0) initial_cmd_error = 1'b1;
           default:if(cmd_addr[1:0] != 0) initial_cmd_error = 1'b1;
	 endcase // case(`APB_BUS_SIZE)
	 // leda W226 on
	 
      // if the SIZE is less than the APB error or any other error
	  if (cmd_size < `APB_BUS_SIZE)
	    initial_cmd_error = 1'b1;
      end // always @ (...
   
      
   //******************************************************************************
   //      next_state_check_on_strobes 
   //      
   /// free running check on the strobes as they arrive
   //
   always @(/*AS*/all_apb_strobes or any_error or apb_finished
            or last_strobes or next_write_buff_empty or pslverr
            or selected_strobes or write_buffer_last)
     begin
	// check the selected strobes if all 0 get the next APB size wd
	// all 1's go and issue to APB
	// if there is a mix of strobes this is an error
	//  also any error will be checked
        next_state_check_on_strobes = WSEL; //if all is OK continue
	// if the last strobe indicates none in the AXI were found (0)
	// then its on to the next AXI word
	if (last_strobes == 0)
	  begin
	     if (write_buffer_last == 1'b1)
	    // this was the last for this AXI xaction
	    // issue the resp
	        next_state_check_on_strobes = WRESP;
	     else
            // tis is not the last, advance and pop the next APB word
              begin
                if (next_write_buff_empty == 1'b1)
 
                 next_state_check_on_strobes = WDTWT;
                else next_state_check_on_strobes = NWSEL; // will pop another
	      end // else: !if(write_buffer_last == 1'b1)
	  end // if (last_strobes == 0)
	else
	  begin
	     // there are strobes set check
	     // to see if this goes on to the APB
	     if (selected_strobes == all_apb_strobes) 
	       next_state_check_on_strobes = WSEL;
	     else
               if (selected_strobes == 0)
		 begin
		    next_state_check_on_strobes = NWSEL;
		    // nothing here to write
		    // if last apb write go to pop the next
		    // if not continuue advancing in the word
		    if (apb_finished == 1'b1)
		      begin
			 // time to go out and pop if not the last
			 if (write_buffer_last ==1'b1) 
                           next_state_check_on_strobes = WRESP;
			 else
                           if (next_write_buff_empty == 1'b1) 
			     next_state_check_on_strobes = WDTWT;
			   else 
			     next_state_check_on_strobes = NWSEL;
		      end // if (apb_finished == 1'b1)
		 end // if (selected_strobes == 0)
	       else 
		 next_state_check_on_strobes = PURGE;
	  end // else: !if(last_strobes == 0)
	// error will overide the previous
	if ((any_error == 1'b1) || (pslverr == 1'b1))
	  next_state_check_on_strobes = PURGE;
     end // always @ (...

   // also fre run the calculation on the last APB write for the AXI word
   assign apb_finished = (apb_wd_sel + 1 == last_strobes);

   // RTL was written with a particular function in mind so any
   // concerns regarding loss of carry/borrow in addition/subtraction
   // can be ignored by Leda.
   // leda W484 off
   
   //******************************************************************************
   //      next_apb_axi_beat 
   //      
   /// as the read buffer is pushed count this as a beat for the axi from the apb

   always @(/*AS*/apb_axi_beat or next_push_read_buffer_n
            or next_state or read_buffer_full or state)
     begin
	next_apb_axi_beat = apb_axi_beat;
	// initialize the beat count
        if (state == IDLE)
	  begin
	     next_apb_axi_beat = 0;
	     // if going to PURGE adjust the beat for the early push
	     if (next_state == PURGE) next_apb_axi_beat = 0;
	  end
	// incriment the beat count   
	if (((state == PURGE) && (read_buffer_full == 1'b0)) 
           || (next_push_read_buffer_n == 1'b0))
	  next_apb_axi_beat = apb_axi_beat + 1;
     end // always @ (...

    
   
   //******************************************************************************
   //      next_apb_wd_sel 
   //      
   // keep track of the APB words that are unpacked from the Write Data Buffer
   // set when the write buffer is available. set to point at the first non 0 strobes
   // incrmented as the APB words are advanced
   // The same for the reads but keep track of the read data for packing
  
   always @(/*AS*/apb_wd_sel or apb_wds_in_axi_wd or cmd_addr
            or cmd_direction or cmd_size or cmd_type or last_strobes
            or next_first_strobes or state)
     begin
	case(state)
	  IDLE,WDTWT,WTSTART: begin
	     // when starting initialize to the starting APB word in the AXI word
	     // after finished waiting for the buffer go not empty
	     if(cmd_direction == 1'b1)
	       begin
		  // in a write using the location of the first strobe
		  // to set the word sel
		  next_apb_wd_sel = next_first_strobes;
	       end
	     else
	       begin
		  // in a read set from the cmd_addr
		  // the start is based on the address dislacement in the AXI addres
		  next_apb_wd_sel = get_initial_apb_wd_sel(cmd_size,cmd_addr);
	       end // else: !if(cmd_direction == 1'b1)
	  end // case: IDLE,WDTWT,WTSTART
	  WSEL,NWSEL: begin
	     // a write needs to get the strobe each time it pops a new word
	     // the first strobe will set the wrd sel
	     // the pop will not occur when the write buff is empty  
	          if ((apb_wd_sel + 1 == last_strobes)
                     || (last_strobes == 0) || (state == WDTWT)) 
	            begin
		  // APB finished with the current AXI word
		  // get the new displacement from the strobes 
		  // before popping the write buff
		       next_apb_wd_sel = next_first_strobes;
	            end
	          else
	            begin
		  // haven't finished unpacking the AXI word
		       next_apb_wd_sel = apb_wd_sel + 1;
	            end // else: !if((apb_wd_sel + 1 == last_strobes)...
	  end // case: WSEL,NWSEL
	  RSEL: begin
	     // if the read is finished reset
	     if (apb_wd_sel+1 == apb_wds_in_axi_wd)
	       begin
	          next_apb_wd_sel = 0;
		  if (cmd_type == 0) // if fixed go back to the cmd addr
		    next_apb_wd_sel = get_initial_apb_wd_sel(cmd_size,cmd_addr);
	       end
	     else
	       begin
		  next_apb_wd_sel = apb_wd_sel + 1;
	       end
	  end // case: RSEL
	  default:
	    next_apb_wd_sel = apb_wd_sel;
	endcase // case(state)
     end // always @ (...

   // leda W484 on
      
   //**********************************************************************************
   //
   // next_apb_wds_in_axi_wd
   // this will indicate the last apb word positioned in the axi word
   // find the apb words in this series of transfers
   // the write uses the strobes to figure both first and last
   // so this is dynamically set every time the write data is fetched
   // 
   // the read sets first always to 0 and last the number of
   // axi transfers per AXI word this will never change from the command
	
   always @(/*AS*/apb_wd_sel or apb_wds_in_axi_wd or cmd_direction
            or cmd_size or last_strobes or state)
     begin
	next_apb_wds_in_axi_wd = apb_wds_in_axi_wd;
	if (cmd_direction == 1'b1)
	  begin
	     // for writes any time new  write buffer data could occurr
	     if ((state==NWEN) || (apb_wd_sel == 0))
	       begin
	          next_apb_wds_in_axi_wd = last_strobes;
	       end
	  end
	else
          begin
	     // for reads
             if (state == IDLE)
	       begin
		 // Shifting by non-constant is intended operation, hence
		 // the Leda warning can be disabled:
		 // leda W244 off
	         next_apb_wds_in_axi_wd = (1 << (cmd_size - `APB_BUS_SIZE));
		 // leda W244 on
	       end
	  end // else: !if(cmd_direction == 1'b1)
     end // always @ (...
   
   
   //**********************************************************************************
   //
   // apb_read_last
   // last APB word in the current AXI word
   //
   always @(/*AS*/apb_read_last or apb_wd_sel or apb_wds_in_axi_wd
            or pready or state)
     begin
	next_apb_read_last = apb_read_last;
	if ((state == RSEL) && (apb_wd_sel+1 == apb_wds_in_axi_wd)) next_apb_read_last = 1;
        if ((state == REN) && (pready == 1'b1)) next_apb_read_last = 0;
     end
 
   //*********************************************************************************
   // pop_wr_buff_request
   // need to pop the next apb word from the write data buffer
   // 
   always @(/*AS*/apb_wd_sel or last_strobes or pop_wr_buff_request
            or state)
     begin
	next_pop_wr_buff_request = pop_wr_buff_request;
	// this will set if a pop is needed
	// reset if a po is not needed
	if ((state == WSEL) 
            || (state == NWSEL))
	  begin
	     next_pop_wr_buff_request = (((apb_wd_sel+1) == last_strobes) 
                                 && (last_strobes != 0));
	  end
	// reset when exiting
	if (state == WRESP) next_pop_wr_buff_request = 0;
 
     end // always @ (...

   //**********************************************************************************
   //
   // Addressing controls follow
   // 
   // in the LAST AXI word
   //
 
   //
   // incr_value
   // used to incriment the next_address
   // normally will be 1 but in cases when a write strobe is not aligned to
   // to the begining of the SIZE word will have to push up the APB addr
   // to incr when inc base need the value generated in the pop
   always @(/*AS*/first_strobes or next_first_strobes)
     begin
	incr_value = 0;
	base_incr_value = 0;
	for (i=0;i<`X2P_MAX_AXI_SIZE; i=i+1)
	  begin
	     incr_value[i] = first_strobes[i];
	     base_incr_value[i] = next_first_strobes[i];
	  end
     end

   // set and increment the address paddr
   // incr_addr is an APB address incriment
   // during write should be active only when not incr_base (popping the write buff)

   assign wr_incr_addr = ((state==WSEL) || (state == NWSEL));
   assign rd_incr_addr = (state == RSEL);
   
   // www.joe CRM_9000235907 - Sept 2008
   // replaced commented line with line below 
   assign incr_addr = wr_incr_addr | (rd_incr_addr && ((next_last_push_read==1'b0) || (next_last_push_read==1'b1 && next_apb_read_last==1'b0)));
   //assign incr_addr = wr_incr_addr | rd_incr_addr;
   // www.joe - end
   
   // set when the next AXI word has been popped, advances to the next AXI word address
   // not used in Read INCR
   
   // www.joe CRM_9000235907 - Sept 2008
   // replaced commented line with line below 
   assign rd_incr_base_addr = ((next_apb_read_last == 1'b1) && (state == RSEL) && (next_last_push_read == 1'b0));
   //assign rd_incr_base_addr = ((next_apb_read_last == 1'b1) && (state == RSEL));
   // www.joe - end

   assign wr_incr_base_addr = !(pop_write_buff_n);
   assign incr_base_addr = ((state != PURGE) &&
                             ((rd_incr_base_addr == 1'b1) 
                              || (wr_incr_base_addr == 1'b1)));
   
   // the inital setting of the address from the cmd queue
   // will be issued to set the starting address of the transaction
   // In FIXED this will also be issued on each AXI beat
   
   assign next_wr_set_addr = ((cmd_direction == 1'b1) 
                   && ((state == IDLE) || (state == WTSTART)));
   assign rd_set_addr = ((cmd_direction == 1'b0) && (state == IDLE) 
                        && (cmd_queue_empty == 1'b0));
   assign set_addr = ((rd_set_addr == 1'b1) || (next_wr_set_addr == 1'b1));

   // using a seperate paddr register to keep the address transitions down
   assign update_address = ((next_state == WSEL) || (next_state == RSEL));  
  
   //
   // write error setting. Any error from the APB or an internal error will be held
   // untill the end of the transaction
   // errrors detected upon obtaining the command are issued right away
   // errors found during the read transfer are delayed one cycle into the purge
   // this is because the push to the read data buffer is in progress with
   //  the last good address data
   always @(*)
     begin
	     next_error = error;
	     // during a write the error has to be presented with the push to the write resp buffer
	     if ((cmd_direction == 1'b1) && (next_state == PURGE))
         next_error = 1;

	     // into a purge during a transfer delay the err to keep away from the push read buff
       // jstokes, 10/3/2010, STAR 9000377785
       // pslverr should not be considered here unless pready == 1 also.
       // Code for this process cleaned up also.
	     if ((state == PURGE) || (state == PREPURGE) || (pslverr & pready)) 
         next_error = 1;

	     // read or write bad from the start imeadiatly issue the error
	     if ((state == IDLE) && (next_state == PURGE)) 
          next_error = 1;

	     // clear when exiting purge
	     //cg if ((next_state == IDLE) && (state == PURGE))  next_error = 0;
       if (next_state == IDLE)  next_error = 0;
     end // always @ (...

   // write_active
   always @(/*AS*/cmd_direction or next_state or state or write_active)
     begin
	next_write_active = write_active;
	if (next_state == IDLE) next_write_active = 0;
	if ((state == IDLE) && (next_state != IDLE) && (cmd_direction == 1))
	  next_write_active = 1;
     end

   //
   // read error response setting
   //
   always @(/*AS*/cmd_direction or dcd_error or initial_cmd_error
            or pready or pslverr or rd_error or state)
     begin
	next_rd_err = rd_error;
	if (state == IDLE) next_rd_err = 0;
	if (cmd_direction == 0)
	  begin
            if(((dcd_error ==1) && (state != IDLE)) || (initial_cmd_error == 1'b1)) 
              next_rd_err = 1;
	  end
	if ((state == REN) && (pready== 1'b1) && (pslverr == 1)) next_rd_err = 1;
     end	
	

		    
// address decode error or write strobe error
   assign any_error = dcd_error || error || initial_cmd_error;
		      
   // pop the write data buffer
   // the pop will cause the curret data to be registered and processed
   // if this is the last don't pop until starting the next AXI xfer
   // pop if the buff returns from empty or idle
   always @(/*AS*/apb_wd_sel or cmd_direction or cmd_queue_empty
            or last_strobes or next_write_buff_empty or state
            or write_buffer_last or write_buffer_last_reg)
     begin
        pop_write_buff_n = 1'b1;
	if (cmd_direction == 1'b1)
	  begin
	     case(state)
	       WSEL,NWSEL: begin
		  // need the next AXI word to unpace
		  // and not the last AXI word
		  if ((((apb_wd_sel+1 == last_strobes) || (last_strobes == 0)) 
                                && (write_buffer_last_reg == 1'b0))
                                && (next_write_buff_empty == 1'b0))
		    pop_write_buff_n = 1'b0;
	       end
	       IDLE,WDTWT,WTSTART: begin
		  // starting the xfer, need a pop and the buffer is got something
		  if ((cmd_queue_empty == 1'b0) && (next_write_buff_empty == 1'b0))
		    pop_write_buff_n = 1'b0;
	       end
	       PURGE: begin
		  // keep popping if not empty an not last
		  if((write_buffer_last == 1'b0)
                                && (next_write_buff_empty == 1'b0))
		    pop_write_buff_n = 1'b0;
	       end
	       default: pop_write_buff_n = 1'b1;
	     endcase // case(state)
	  end // if (cmd_direction == 1'b1)
     end // always @ (...

   // used to register the current ID
   // for the write response
   assign save_id = (state == IDLE);

   // the pop of the CMD Queue
   assign wr_pop_cmd = ((state == WRESP) && (resp_rdy_n == 1'b0));

always @(/*AS*/apb_axi_beat or apb_read_last or cmd_direction
         or cmd_len or cmd_queue_empty or pready or read_buffer_full
         or state)     
  begin
     case(state)
       PURGE: begin
	  rd_pop_cmd = ((apb_axi_beat == cmd_len) 
                        && (read_buffer_full == 0)
			&& (cmd_queue_empty == 0)
                        && (cmd_direction == 0));
       end
       REN: begin
	  rd_pop_cmd =((pready == 1'b1) 
                            && (apb_read_last == 1'b1) 
                            && (read_buffer_full == 0)
                            && (cmd_queue_empty == 0) 
                            && (apb_axi_beat == cmd_len));
       end
       RBUFWT: begin
	  rd_pop_cmd = ((read_buffer_full == 0)
                         && (cmd_queue_empty == 0) 
                        && (apb_axi_beat == cmd_len));
       end
       default: rd_pop_cmd = 0;
     endcase // case(state)
  end // always @ (...
 
   assign pop_cmd_queue_n = !((wr_pop_cmd | rd_pop_cmd));
   
 
   // telling the read buffer to pack the data
   assign enable_pack = pready & penable & ~cmd_direction;
   // telling the packer this is the last apb for the transaction
   // during the purge since this is an error condition the push will occur disregarding the data
   
   // setting the rlast to be pushed
   always @(/*AS*/cmd_direction or cmd_len or last_push_read
            or next_apb_axi_beat or next_state or state)
     begin
	if(cmd_direction == 1'b0)
	  begin
	     case(state)
	       RSEL,PURGE,PREPURGE:begin       
                   next_last_push_read = (next_apb_axi_beat == cmd_len);
	       end
	       IDLE: begin
		  next_last_push_read = 0;
		  // one beat get the last now, it will be too late otherwize
		  if ((next_state == PURGE) && (cmd_len == 0))
		    next_last_push_read = 1'b1;    
	       end
	       default:     next_last_push_read = last_push_read;
	     endcase // case(state)
	  end // if (cmd_direction == 1'b0)
	else
         next_last_push_read = 0;
     end // always @ (...
   
   
   // clears the packer data reg
   assign clr_rd_data_reg = (state == IDLE);
   
   // pushing the read data buffer
   assign next_push_read_buffer_n = ~(((cmd_direction == 1'b0) && (read_buffer_full == 0)) && 
                             ((((state == REN) && (apb_read_last) && (pready == 1'b1)) 
                              || ((state == RBUFWT) && (next_state != RBUFWT)))));
   
  // a push to the read buffer on an error is issued without registering it
   always @(/*AS*/cmd_direction or push_read_buffer_reg
            or read_buffer_full or state)
     begin
	if ((state == PURGE) && (cmd_direction == 1'b0))
	  push_read_buffer_n = read_buffer_full;
	else
          begin
	     push_read_buffer_n = push_read_buffer_reg;
	  end
     end
   // have to save the rd cmd size. This is because the last read pussh
   // is while the cmd queue is being popped have to have the size to do the endian conversion
   assign next_rd_cmd_size = ((state == IDLE) && (next_state == NREN)) ? cmd_size : rd_cmd_size;
   
   // issue a request to push the resp buffer when the last appears
   // going to idle from issuing the resp in write implies that the LAST has come and last 
   // the last apb word hase gone out
   assign push_rsp_buff_n = !((state == WRESP) && (resp_rdy_n == 1'b0));
      
   // set the write data
   // when the next cycle will be a write sel
   assign set_data = (next_state == WSEL);
         

   //*****************************************************************
   //
   // syncing the write buf status to the appropriate APB transaction
   //
   //****************************************************************

   
 // take the popped status and position it such that it goes with
   // the APB transaction avoiding the previous
   // write_buffer_last is the popped last registered//    
always @(/*AS*/next_state or pready or state or write_buffer_last
         or write_buffer_last_reg)
  begin
     next_write_buffer_last_reg = write_buffer_last_reg;
     // sets to write buffer last reg
     // check after the pop and position with the first popped APB transaction
     if (((state == WEN) && (pready == 1'b1)) || (state == NWEN))
         next_write_buffer_last_reg = write_buffer_last;
     if (next_state == IDLE) next_write_buffer_last_reg = 0;
  end


   
// the just popped write buffer empty is delayed until the current APB write is finised
   // with the previous popped transaction on the APB
   always @(/*AS*/next_write_buff_empty or pop_write_buff_n or pready
            or state or write_buff_empty)
     begin
	write_buff_empty_ns = write_buff_empty;
	// setting just as the last APB finishes
	// or after popping or after waiting for the the buffer to fill
	if (((state == WEN) && (pready == 1'b1)) 
             || (state == NWEN) || (state == WDTWT))
	  write_buff_empty_ns = next_write_buff_empty;
	// reset when the write buff is popped implies not empty
	if (pop_write_buff_n == 1'b0) write_buff_empty_ns = 0;
     end // always @ (...
   
  
   // all the FFs are here

   always @(posedge clk or negedge rstn)
     begin
	if (rstn == 1'b0)
	  begin
	     state <= IDLE;
	     apb_read_last <= 0;
	     apb_wd_sel <= 0;
	     error <= 0;
	     write_active <= 0;
	     apb_wds_in_axi_wd <= 0;
	     push_read_buffer_reg <= 1'b1;
	     apb_axi_beat <= 0;
	     last_push_read <= 0;
	     write_buff_empty <= 0; 
             write_buffer_last_reg <= 0;
	     pop_wr_buff_request <= 0;
	     rd_cmd_size <= 0;
	     rd_error <= 0;
	  end // if (rstn == 1'b0)
	else
          begin
	     state <= next_state;
	     apb_read_last <= next_apb_read_last;
	     apb_wd_sel <= next_apb_wd_sel;
    	     error <= next_error;
	     write_active <= next_write_active;
	     apb_wds_in_axi_wd <= next_apb_wds_in_axi_wd;
	     push_read_buffer_reg <= next_push_read_buffer_n;
	     apb_axi_beat  <= next_apb_axi_beat;
	     last_push_read <= next_last_push_read;
	     write_buff_empty <= write_buff_empty_ns;
             write_buffer_last_reg <= next_write_buffer_last_reg;
	     pop_wr_buff_request <= next_pop_wr_buff_request;
	     rd_cmd_size <= next_rd_cmd_size;
	     rd_error <= next_rd_err;
	  end // else: !if(rstn == 1'b0)
     end // always @ (posedge clk or negedge rstn)

   
endmodule // DW_axi_x2ps_control



