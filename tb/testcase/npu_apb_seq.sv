class npu_apb_mst_seq extends svt_apb_master_base_sequence;
	
  svt_apb_master_transaction write_tran;
  svt_apb_master_transaction read_tran;

  /** Parameter that controls the number of transactions that will be generated */
  rand int unsigned sequence_length = 10;

  /** Constrain the sequence length to a reasonable value */
  constraint reasonable_sequence_length {
    sequence_length <= 100;
  }

  /** UVM Object Utility macro */
  `uvm_object_utils(npu_apb_mst_seq)

  /** Class Constructor */
  function new(string name="npu_apb_mst_seq");
    super.new(name);
  endfunction
  
  virtual task body();
        
	bit status;
    bit [31:0] wdata;
    bit [31:0] rdata;

	`uvm_info("body", "Entered ...", UVM_LOW)

    super.body();

    status = uvm_config_db #(int unsigned)::get(null, get_full_name(), "sequence_length", sequence_length);

    `uvm_info("body", $sformatf("sequence_length is %0d as a result of %0s.", sequence_length, status ? "config DB" : "randomization"), UVM_LOW);




    apb_write(8'h34,32'h0000_0000); //SRC_ADDR: instr start addr in ddr
	//apb_read(8'h34,rdata);

	//apb_write(8'h38,32'h0000_02a3); //INST_DEPTH
	apb_write(8'h38,32'd675); //INST_DEPTH: dma move instr length
	//apb_read(8'h38,rdata);

	apb_write(8'h00,32'h0000_0004); //CTRL : start init instr
	//apb_read(8'h00,rdata);

	@(posedge tb_top.DUT.U_DMA.U_xDMA_CFG.init_inst_finish);// wait dma move instr finish 
	apb_read(8'h44,rdata);
//	if((rdata & 32'h10) !== 32'h10)
//		`uvm_error("body", "read status error");



	apb_write(8'h00,32'h0000_0001); //CTRL : start NPU
	//apb_read(8'h00,rdata);



    #30_000_000; // wait 30ms for network data simulate finish 



    `uvm_info("body", "Exiting...", UVM_LOW)

  endtask: body

  task apb_write(input bit [7:0] addr, input bit [31:0] wdata);
      /** Set up the write transaction */
      `uvm_create(write_tran)
      write_tran.cfg       = cfg;
      write_tran.xact_type = svt_apb_transaction::WRITE;
      write_tran.address   = addr;
      write_tran.data      = wdata;
      write_tran.num_wait_cycles = 3;

      /** Send the write transaction */
      `uvm_send(write_tran)

      /** Wait for the write transaction to complete */
      get_response(rsp);
   
      `uvm_info("body", $sformatf("APB WRITE : addr =0x%h, data = 0x%h",write_tran.address,write_tran.data), UVM_LOW);
      //`uvm_info("body", "APB WRITE transaction completed", UVM_LOW);
  endtask:apb_write


  task apb_read(input bit [7:0] addr, output bit [31:0] rdata);
      /** Set up the read transaction */
      `uvm_create(read_tran)
      read_tran.cfg       = cfg;
      read_tran.xact_type = svt_apb_transaction::READ;
      read_tran.address   = addr;

      /** Send the read transaction */
      `uvm_send(read_tran)

      /** Wait for the read transaction to complete */
      get_response(rsp);

      rdata = read_tran.data;

      `uvm_info("body", $sformatf("APB READ : addr = 0x%h, data = 0x%h",read_tran.address,read_tran.data ), UVM_LOW);    
      //`uvm_info("body", "APB READ transaction completed", UVM_LOW);

  endtask:apb_read

endclass: npu_apb_mst_seq

