`define DATA_ADDR_START   32'h12000000
`define WEIGHT_ADDR_START 32'h12500000
`define INDEX_ADDR_START  32'h14000000
`define BIAS_ADDR_START   32'h14500000

class yolo_axi_slv_seq extends svt_axi_slave_base_sequence;
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
    `uvm_object_utils(yolo_axi_slv_seq)

    /** Class Constructor */
    function new(string name="yolo_axi_slv_seq");
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

      load_instruction();
      load_data();
	  //load_weight();
	  //load_index();
	  //load_bias();



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





	task write_word(input bit[`SVT_AXI_MAX_ADDR_WIDTH-1:0] addr, bit[31:0] data);
	    int log_base_2_data_width ;
	    bit[`SVT_AXI_MAX_ADDR_WIDTH-1:0] aligned_addr;
	    int unsigned offset;
	    bit[`SVT_AXI_MAX_DATA_WIDTH-1:0] write_data;
	    bit[(`SVT_AXI_MAX_DATA_WIDTH/8)-1:0] write_wstrb;
	
	    log_base_2_data_width = 4;
	    aligned_addr = (addr >> log_base_2_data_width) << log_base_2_data_width;
	    offset = addr - aligned_addr;
	    write_data = data << (offset*8);
	    write_wstrb = 4'hf << offset;
	    void'(axi_slave_mem.write(aligned_addr,write_data,write_wstrb));
	endtask

	task read_word(input bit[`SVT_AXI_MAX_ADDR_WIDTH-1:0] addr, output bit[31:0] data);
	    int log_base_2_data_width ;
	    bit[`SVT_AXI_MAX_ADDR_WIDTH-1:0] aligned_addr;
	    int unsigned offset;
	    bit[`SVT_AXI_MAX_DATA_WIDTH-1:0] read_data;
	
	    log_base_2_data_width = 4;
	    aligned_addr = (addr >> log_base_2_data_width) << log_base_2_data_width;
	    offset = addr - aligned_addr;
	    read_data = axi_slave_mem.read(aligned_addr);
	    data = read_data[offset*8+:32];
	endtask


	task load_instruction();
 		bit [127:0] read_data;
		bit [127:0] write_data;
    	bit [31:0]  addr;
		int fd ;
		int count;
		int i = 0;

		fd = $fopen("./data_yolo/inst/instruct_hex.txt","r");

 		while(!$feof(fd)) begin  
        	$fscanf(fd,"%h",read_data); 
			addr = 	32'h10*i;
			write_data = read_data;
       	 	axi_slave_mem.write(addr,write_data);	
			read_data = 128'h0;
       	 	read_data = axi_slave_mem.read(addr);	
         	//$display("addr = %h,write_data = %h,read_data = %h, data_index = %d",addr,write_data,read_data,i);
			i++;
        end		

		$fclose(fd);

	endtask


	task load_data();
 		bit [255:0] read_data;
		bit [255:0] write_data;
		bit [31:0] addr;
		int fd ;
		int i = 0;

		fd = $fopen("./data_yolo/input.txt","r");

		addr = `DATA_ADDR_START;
 		while(!$feof(fd)) begin  
        	$fscanf(fd,"%h",read_data); 
			write_data = read_data;
       	 	axi_slave_mem.write(addr+32'h00,write_data[127:0]);
       	 	axi_slave_mem.write(addr+32'h10,write_data[255:128]);
			read_data = 256'h0;
       	 	read_data[127:0]   = axi_slave_mem.read(addr+32'h00);	
       	 	read_data[255:128] = axi_slave_mem.read(addr+32'h10);	
         	//$display("addr = %h,write_data = %h,read_data = %h, data_index = %d",addr,write_data,read_data,i);
			if(read_data !== write_data) begin
        		`uvm_error("body", "READ DATA ERROR");				
			end
			i++;
			addr = addr+32'h20;
        end		

		$fclose(fd);

	endtask





endclass: yolo_axi_slv_seq

