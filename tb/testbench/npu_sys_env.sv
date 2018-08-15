`ifndef NPU_SYS_ENV
`define NPU_SYS_ENV


class npu_sys_env extends uvm_env;

	`uvm_component_utils(npu_sys_env)

    svt_apb_system_env                 apb_system_env;
	cust_svt_apb_system_configuration  apb_cfg;


	svt_axi_system_env                 axi_system_env;
  	cust_svt_axi_system_configuration  axi_cfg;

	//npu_sys_agt i_agt;
	//npu_sys_agt o_agt;
	//npu_sys_rm  rm;
	npu_sys_scb scb;
	npu_sys_mon mon;
	
	event sample_data_over_event;

	//uvm_tlm_analysis_fifo #(npu_sys_tr) agt_rm_fifo;
	//uvm_tlm_analysis_fifo #(npu_sys_tr) agt_scb_fifo;
	//uvm_tlm_analysis_fifo #(npu_sys_tr) rm_scb_fifo;
	uvm_tlm_analysis_fifo #(npu_sys_tr) mon_scb_fifo;

	function new(string name = "npu_sys_env", uvm_component parent = null);
        super.new(name,parent);			
    endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("npu_sys_env","build_phase is called",UVM_LOW);
		
		axi_cfg = cust_svt_axi_system_configuration::type_id::create("axi_cfg");
		uvm_config_db#(svt_axi_system_configuration)::set(this,"axi_system_env", "cfg", this.axi_cfg);	
		axi_system_env = svt_axi_system_env::type_id::create("axi_system_env",this);


        apb_cfg = cust_svt_apb_system_configuration::type_id::create("apb_cfg",this);
		uvm_config_db#(svt_apb_system_configuration)::set(this,"apb_system_env", "cfg", apb_cfg);	
		apb_system_env = svt_apb_system_env::type_id::create("apb_system_env",this);



		//o_agt = npu_sys_agt::type_id::create("o_agt",this);
		//i_agt.is_active = UVM_ACTIVE;
		//o_agt.is_active = UVM_PASSIVE;

		//rm  = npu_sys_rm::type_id::create("rm",this);
		scb = npu_sys_scb::type_id::create("scb",this);
		mon = npu_sys_mon::type_id::create("mon",this);

		//agt_rm_fifo  = new("agt_rm_fifo",this);
		//agt_scb_fifo = new("agt_scb_fifo",this);
		//rm_scb_fifo  = new("rm_scb_fifo",this);
		mon_scb_fifo = new("mon_scb_fifo",this);


	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		//i_agt.ap.connect(agt_rm_fifo.analysis_export);
		//rm.port.connect(agt_rm_fifo.blocking_get_export);

		//o_agt.ap.connect(agt_scb_fifo.analysis_export);
		//scb.act_port.connect(agt_scb_fifo.blocking_get_export);

		//rm.ap.connect(rm_scb_fifo.analysis_export);
		//scb.exp_port.connect(rm_scb_fifo.blocking_get_export);

		mon.ap.connect(mon_scb_fifo.analysis_export);
	    scb.act_port.connect(mon_scb_fifo.blocking_get_export);

	endfunction

	virtual task main_phase(uvm_phase phase);
	   			
		`uvm_info("npu_sys_env","main_phase is called",UVM_LOW);
		//while(1) begin	   			
			//@(negedge tb_top.i_rst_n);
			//clear fifo
			//agt_rm_fifo.flush();
			//agt_scb_fifo.flush();
			//rm_scb_fifo.flush();
			//`uvm_info("npu_sys_env","uvm fifo is flushed",UVM_LOW);
		//end



    endtask


endclass

`endif

