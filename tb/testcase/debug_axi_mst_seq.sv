class debug_axi_mst_seq extends svt_axi_master_base_sequence;
	
  	/** Parameter that controls the number of transactions that will be generated */
  	rand int unsigned sequence_length = 10;

  	/** Constrain the sequence length to a reasonable value */
  	constraint reasonable_sequence_length {
    	sequence_length <= 100;
  	}
		
		bit [31:0] debug_addr;
		bit [31:0] buffer_addr_size;
		rand bit [127:0] debug_data;
		constraint reasonable_debug_data {
		    debug_data <= {128{1'b1}};
		}
		bit [31:0] buffer_addr[$];
		bit [127:0] buffer_data[$];

  	/** UVM Object Utility macro */
 	`uvm_object_utils(debug_axi_mst_seq)

  	/** Class Constructor */
  	function new(string name="debug_axi_mst_seq");
    	super.new(name);
  	endfunction

  
    virtual task body();
    	svt_axi_master_transaction write_tran;
    	svt_axi_master_transaction read_tran;
    	svt_configuration get_cfg;
    	bit status;
    	
		`uvm_info("body", "Entered ...", UVM_LOW)

        super.body();

        status = uvm_config_db #(int unsigned)::get(null, get_full_name(), "sequence_length", sequence_length);

        `uvm_info("body", $sformatf("sequence_length is %0d as a result of %0s.", sequence_length, status ? "config DB" : "randomization"), UVM_LOW);

    	/** Obtain a handle to the port configuration */
    	p_sequencer.get_cfg(get_cfg);
    	if (!$cast(cfg, get_cfg)) begin
      		`uvm_fatal("body", "Unable to $cast the configuration to a svt_axi_port_configuration class");
    	end
		//-buffer_addr.push_back(32'h0200_0000);
		//-buffer_addr.push_back(32'h0a00_0000);
		//-//buffer_addr.push_back(32'h0c00_0000);
		//-buffer_addr.push_back(32'h0e00_0000);
		//-buffer_addr.push_back(32'h1000_0000);
		//-buffer_addr.push_back(32'h1200_0000);
		//-buffer_addr.push_back(32'h1400_0000);
		buffer_addr.push_back(32'h0170_0004); buffer_data.push_back(32'h0000_03ff);
		buffer_addr.push_back(32'h0170_0034); buffer_data.push_back(32'h0000_0000);
		buffer_addr.push_back(32'h0170_003c); buffer_data.push_back(32'h0000_0008);
		buffer_addr.push_back(32'h0170_0000); buffer_data.push_back(32'h0000_0004);
	    //@(posedge tb_top.DUT.U_DMA.U_xDMA_CFG.init_inst_finish);
		//buffer_addr.push_back(32'h0170_0000); buffer_data.push_back(32'h0000_0001);
        buffer_addr_size=buffer_addr.size;
    	for(int i = 0; i < buffer_addr_size; i++) begin
		    debug_addr = buffer_addr.pop_front;
			debug_data = buffer_data.pop_front;
      		/** Set up the write transaction */
      		`uvm_create(write_tran)
      		write_tran.port_cfg     = cfg;
      		write_tran.xact_type    = svt_axi_transaction::WRITE;
      		write_tran.addr         = debug_addr;
      		write_tran.burst_type   = svt_axi_transaction::INCR;
      		write_tran.burst_size   = svt_axi_transaction::BURST_SIZE_32BIT;
      		write_tran.atomic_type  = svt_axi_transaction::NORMAL;

			`ifdef SVT_AXI_MAX_BURST_LENGTH_WIDTH_1
      			write_tran.burst_length = 1;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_2
      			write_tran.burst_length = 2;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_3
      			write_tran.burst_length = 4;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_4
      			write_tran.burst_length = 8;
			`else
      			write_tran.burst_length = 16;
			`endif 
      			
		    write_tran.burst_length = 1;

      		write_tran.data         = new[write_tran.burst_length];
      		write_tran.wstrb        = new[write_tran.burst_length];
      		write_tran.data_user    = new[write_tran.burst_length];
      		foreach (write_tran.data[i]) begin
        		//write_tran.data[i] = 128'h1234_5678_5a5a_a5a5_5555_aaaa_1234_abcd;
        		write_tran.data[i] = debug_data;
      		end
      		foreach(write_tran.wstrb[i]) begin
        		write_tran.wstrb[i] = 16'hffff;
      		end
      		write_tran.wvalid_delay = new[write_tran.burst_length];
      		foreach (write_tran.wvalid_delay[i]) begin
        		write_tran.wvalid_delay[i]=i;
      		end

      		/** Send the write transaction */
      		`uvm_send(write_tran)

      		/** Wait for the write transaction to complete */
      		get_response(rsp);
		end //for
	    //@(posedge tb_top.DUT.U_DMA.U_xDMA_CFG.o_interrupt);

		buffer_addr.push_back(32'h0170_0048); buffer_data.push_back(32'h048c_1123);
		buffer_addr.push_back(32'h0170_000c); buffer_data.push_back(32'h0000_0400);
		buffer_addr.push_back(32'h0170_0034); buffer_data.push_back(32'h0000_0000);
		buffer_addr.push_back(32'h0170_0038); buffer_data.push_back(32'h0000_0020);
		buffer_addr.push_back(32'h0170_003c); buffer_data.push_back(32'h0000_0008);
		buffer_addr.push_back(32'h0170_0000); buffer_data.push_back(32'h0000_0004);
	    //@(posedge tb_top.DUT.U_DMA.U_xDMA_CFG.init_inst_finish);
		//buffer_addr.push_back(32'h0170_0000); buffer_data.push_back(32'h0000_0001);
        buffer_addr_size=buffer_addr.size;
    	for(int i = 0; i < buffer_addr_size; i++) begin
		    debug_addr = buffer_addr.pop_front;
			debug_data = buffer_data.pop_front;
      		/** Set up the write transaction */
      		`uvm_create(write_tran)
      		write_tran.port_cfg     = cfg;
      		write_tran.xact_type    = svt_axi_transaction::WRITE;
      		write_tran.addr         = debug_addr;
      		write_tran.burst_type   = svt_axi_transaction::INCR;
      		write_tran.burst_size   = svt_axi_transaction::BURST_SIZE_32BIT;
      		write_tran.atomic_type  = svt_axi_transaction::NORMAL;

			`ifdef SVT_AXI_MAX_BURST_LENGTH_WIDTH_1
      			write_tran.burst_length = 1;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_2
      			write_tran.burst_length = 2;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_3
      			write_tran.burst_length = 4;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_4
      			write_tran.burst_length = 8;
			`else
      			write_tran.burst_length = 16;
			`endif 
      			
		    write_tran.burst_length = 1;

      		write_tran.data         = new[write_tran.burst_length];
      		write_tran.wstrb        = new[write_tran.burst_length];
      		write_tran.data_user    = new[write_tran.burst_length];
      		foreach (write_tran.data[i]) begin
        		//write_tran.data[i] = 128'h1234_5678_5a5a_a5a5_5555_aaaa_1234_abcd;
        		write_tran.data[i] = debug_data;
      		end
      		foreach(write_tran.wstrb[i]) begin
        		write_tran.wstrb[i] = 16'hffff;
      		end
      		write_tran.wvalid_delay = new[write_tran.burst_length];
      		foreach (write_tran.wvalid_delay[i]) begin
        		write_tran.wvalid_delay[i]=i;
      		end

      		/** Send the write transaction */
      		`uvm_send(write_tran)

      		/** Wait for the write transaction to complete */
      		get_response(rsp);
		end //for
	    @(posedge tb_top.DUT.U_DMA.U_xDMA_CFG.init_inst_finish);


		buffer_addr.push_back(32'h0170_0000); buffer_data.push_back(32'h0000_0020);
        buffer_addr_size=buffer_addr.size;
    	for(int i = 0; i < buffer_addr_size; i++) begin
		    debug_addr = buffer_addr.pop_front;
			debug_data = buffer_data.pop_front;
      		/** Set up the write transaction */
      		`uvm_create(write_tran)
      		write_tran.port_cfg     = cfg;
      		write_tran.xact_type    = svt_axi_transaction::WRITE;
      		write_tran.addr         = debug_addr;
      		write_tran.burst_type   = svt_axi_transaction::INCR;
      		write_tran.burst_size   = svt_axi_transaction::BURST_SIZE_32BIT;
      		write_tran.atomic_type  = svt_axi_transaction::NORMAL;

			`ifdef SVT_AXI_MAX_BURST_LENGTH_WIDTH_1
      			write_tran.burst_length = 1;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_2
      			write_tran.burst_length = 2;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_3
      			write_tran.burst_length = 4;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_4
      			write_tran.burst_length = 8;
			`else
      			write_tran.burst_length = 16;
			`endif 
      			
		    write_tran.burst_length = 1;

      		write_tran.data         = new[write_tran.burst_length];
      		write_tran.wstrb        = new[write_tran.burst_length];
      		write_tran.data_user    = new[write_tran.burst_length];
      		foreach (write_tran.data[i]) begin
        		//write_tran.data[i] = 128'h1234_5678_5a5a_a5a5_5555_aaaa_1234_abcd;
        		write_tran.data[i] = debug_data;
      		end
      		foreach(write_tran.wstrb[i]) begin
        		write_tran.wstrb[i] = 16'hffff;
      		end
      		write_tran.wvalid_delay = new[write_tran.burst_length];
      		foreach (write_tran.wvalid_delay[i]) begin
        		write_tran.wvalid_delay[i]=i;
      		end

      		/** Send the write transaction */
      		`uvm_send(write_tran)

      		/** Wait for the write transaction to complete */
      		get_response(rsp);
		end //for


		buffer_addr.push_back(32'h0170_004c); 
		buffer_addr.push_back(32'h0000_0000); 
		buffer_addr.push_back(32'h0020_0000);
		//buffer_addr.push_back(32'h0040_0000);
		buffer_addr.push_back(32'h00c0_0000);
		buffer_addr.push_back(32'h0140_0000);
		buffer_addr.push_back(32'h0150_0000);
		buffer_addr.push_back(32'h0160_0000);
        buffer_addr_size=buffer_addr.size;
    	for(int i = 0; i < buffer_addr_size; i++) begin
		    debug_addr = buffer_addr.pop_front;
      		/** Set up the write transaction */
      		`uvm_create(write_tran)
      		write_tran.port_cfg     = cfg;
      		write_tran.xact_type    = svt_axi_transaction::WRITE;
      		//write_tran.addr         = 32'h0200_0000 + ('h100_0000 *i);
      		write_tran.addr         = debug_addr;
      		write_tran.burst_type   = svt_axi_transaction::INCR;
      		write_tran.burst_size   = svt_axi_transaction::BURST_SIZE_128BIT;
      		write_tran.atomic_type  = svt_axi_transaction::NORMAL;

			`ifdef SVT_AXI_MAX_BURST_LENGTH_WIDTH_1
      			write_tran.burst_length = 1;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_2
      			write_tran.burst_length = 2;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_3
      			write_tran.burst_length = 4;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_4
      			write_tran.burst_length = 8;
			`else
      			write_tran.burst_length = 16;
			`endif 
      			
		    write_tran.burst_length = 16;

      		write_tran.data         = new[write_tran.burst_length];
      		write_tran.wstrb        = new[write_tran.burst_length];
      		write_tran.data_user    = new[write_tran.burst_length];
      		foreach (write_tran.data[i]) begin
        		//write_tran.data[i] = 128'h1234_5678_5a5a_a5a5_5555_aaaa_1234_abcd;
        		write_tran.data[i] = debug_data;
      		end
      		foreach(write_tran.wstrb[i]) begin
        		write_tran.wstrb[i] = 16'hffff;
      		end
      		write_tran.wvalid_delay = new[write_tran.burst_length];
      		foreach (write_tran.wvalid_delay[i]) begin
        		write_tran.wvalid_delay[i]=i;
      		end

      		/** Send the write transaction */
      		`uvm_send(write_tran)

      		/** Wait for the write transaction to complete */
      		get_response(rsp);

      		`uvm_info("body", $sformatf("AXI WRITE DATA = 0x%h",write_tran.data[0]), UVM_LOW);

      		`uvm_info("body", "AXI WRITE transaction completed", UVM_LOW);




      		/** Set up the read transaction */
      		`uvm_create(read_tran)
      		read_tran.port_cfg     = cfg;
      		read_tran.xact_type    = svt_axi_transaction::READ;
      		//read_tran.addr         = 32'h0200_0000 + ('h100_0000 *i);
      		read_tran.addr         = debug_addr;
      		read_tran.burst_type   = svt_axi_transaction::INCR;
      		read_tran.burst_size   = svt_axi_transaction::BURST_SIZE_128BIT;
      		read_tran.atomic_type  = svt_axi_transaction::NORMAL;
			`ifdef SVT_AXI_MAX_BURST_LENGTH_WIDTH_1
      			read_tran.burst_length = 1;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_2
      			read_tran.burst_length = 2;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_3
      			read_tran.burst_length = 4;
			`elsif SVT_AXI_MAX_BURST_LENGTH_WIDTH_4
      			read_tran.burst_length = 8;
			`else
      			read_tran.burst_length = 16;
			`endif      
    		read_tran.burst_length = 16;
      		read_tran.rresp        = new[read_tran.burst_length];
      		read_tran.data         = new[read_tran.burst_length];
      		read_tran.rready_delay = new[read_tran.burst_length];
      		read_tran.data_user    = new[read_tran.burst_length];
      		foreach (read_tran.rready_delay[i]) begin
        		read_tran.rready_delay[i]=i;
      		end

      		/** Send the read transaction */
      		`uvm_send(read_tran)

      		/** Wait for the read transaction to complete */
      		get_response(rsp);

      		`uvm_info("body", $sformatf("AXI READ DATA = 0x%h",read_tran.data[0]), UVM_LOW);

    
      		`uvm_info("body", "AXI READ transaction completed", UVM_LOW);
    	end

    	`uvm_info("body", "Exiting...", UVM_LOW)

  endtask: body
  

endclass: debug_axi_mst_seq

