class debug_axi_slv_seq extends svt_axi_slave_base_sequence;
 	bit [127:0] read_data;
	bit [127:0] write_data;
	bit [31:0]  src_start;
	bit [31:0]  dst_start;
	bit [31:0]  d_line;
	bit [3:0]   dma_mode;
	bit         be_stream;
	bit         be_block;
	bit [19:0]  cmd_index;
	bit [31:0]  data_index;

	bit [31:0]  wdata;

    svt_axi_slave_transaction req_resp;

    /** UVM Object Utility macro */
    `uvm_object_utils(debug_axi_slv_seq)

    /** Class Constructor */
    function new(string name="debug_axi_slv_seq");
      super.new(name);
    endfunction

    virtual task body();
      integer status;
      svt_configuration get_cfg;  


      `uvm_info("body", "Entered ...", UVM_LOW)

      p_sequencer.get_cfg(get_cfg);
      if (!$cast(cfg, get_cfg)) begin
        `uvm_fatal("body", "Unable to $cast the configuration to a svt_axi_port_configuration class");
      end


      // consumes responses sent by driver
      sink_responses();

      /** Refernce axi_slave_mem to slave agent's memori. */
      instantiate_axi_slave_mem();

      //initial DMA cmd
      mem2iob0();




      forever begin
        /**
         * Get the response request from the slave sequencer. The response request is
         * provided to the slave sequencer by the slave port monitor, through
         * TLM port.
         */
        p_sequencer.response_request_port.peek(req_resp);

        /**
         * Randomize the response and delays
         */
        status=req_resp.randomize with {
          bresp == svt_axi_slave_transaction::OKAY;
          foreach (rresp[index])  {
            rresp[index] == svt_axi_slave_transaction::OKAY;
            }
         };
         if(!status)
          `uvm_fatal("body","Unable to randomize a response")

        /**
         * If write transaction, write data into slave built-in memory, else get
         * data from slave built-in memory
         */
        if(req_resp.xact_type == svt_axi_slave_transaction::WRITE) begin
          put_write_transaction_data_to_mem(req_resp);
        end
        else begin
          get_read_data_from_mem_to_transaction(req_resp);
        end
      
        $cast(req,req_resp);

        /**
         * send to driver
         */
        `uvm_send(req)

      end

      `uvm_info("body", "Exiting...", UVM_LOW)
    endtask: body

    task mem2iob0();

       for(int i = 0; i < 8; i++) begin	
        	src_start  = 32'h8000_0000;
        	dst_start  = 32'h0000_0000;
        	//d_line     = 32'h0000_0010; //data num
        	d_line     = 32'h0000_0000; //data num
        	dma_mode   = 4'b0001 + i;
        	be_stream  = 1'b0;
        	be_block   = 1'b0; 
        	cmd_index  = i;
        	write_data = (5'b10010<<123) + (src_start<<90)	+ (dst_start<<58) + (d_line<<26) + (dma_mode<<22) + (be_stream<<21) + (be_block<<20) + cmd_index;
        	axi_slave_mem.write(32'h0000_0010*i,write_data);	
        	read_data = axi_slave_mem.read(32'h0000_0010*i);	
        	$display("addr = %h,write_data = %h,read_data = %h, cmd_index = %d",32'h0000_0010*i,write_data,read_data,cmd_index);
       end
		
	   `include "../testcase/test2"
       //for(int i = 0; i < 256; i++) begin	
       //	 wdata = $urandom();
       //	 write_data = wdata << 96;
       //	 wdata = $urandom();
       //	 write_data = write_data + (wdata << 64);
       //	 wdata = $urandom();
       //	 write_data = write_data + (wdata << 32);
       //	 //wdata = $urandom();
       //	 //write_data = write_data + (wdata << 0);
	   //  data_index = i;
       //	 write_data = write_data + data_index;	
       //	 axi_slave_mem.write(32'h8000_0000+32'h10*i,write_data);	
       //	 read_data = axi_slave_mem.read(32'h8000_0000+32'h10*i);	
       //  $display("addr = %h,write_data = %h,read_data = %h, data_index = %d",32'h8000_0000+32'h10*i,write_data,read_data,data_index);
	   //end

    endtask




endclass: debug_axi_slv_seq

