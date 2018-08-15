`ifndef DEBUG_TEST
`define DEBUG_TEST

class debug_test extends uvm_test;

	npu_sys_env  env ;

	`uvm_component_utils(debug_test)

	function new(string name = "debug_test", uvm_component parent = null);
        super.new(name,parent);	
    endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("debug_test","build_phase is called",UVM_LOW);
		
		env  = npu_sys_env::type_id::create("env",this);
		
		uvm_config_db#(uvm_object_wrapper)::set(this,"env.main_phase","default_sequence",base_seq::type_id::get());
   	    
		//uvm_config_db#(uvm_object_wrapper)::set(this,"env.apb_system_env.master.sequencer.main_phase", "default_sequence", debug_apb_mst_seq::type_id::get());

		uvm_config_db#(uvm_object_wrapper)::set(this,"env.axi_system_env.master*.sequencer.main_phase", "default_sequence", debug_axi_mst_seq::type_id::get());

   	    uvm_config_db#(uvm_object_wrapper)::set(this,"env.axi_system_env.slave*.sequencer.main_phase", "default_sequence", debug_axi_slv_seq::type_id::get());

		set_report_max_quit_count(10);

    endfunction


	virtual function void report_phase(uvm_phase phase);
		uvm_report_server server;
		int err_num;
		super.report_phase(phase);
		
		server = get_report_server();
		err_num = server.get_severity_count(UVM_ERROR);

		if(err_num != 0) begin
			`uvm_info("debug_test","TESTCASE FAILED",UVM_LOW);
		end
		else begin
			`uvm_info("debug_test","TESTCASE PASSED",UVM_LOW);		
		end

	endfunction

endclass

`endif


