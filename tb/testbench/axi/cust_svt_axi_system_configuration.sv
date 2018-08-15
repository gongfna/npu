
class cust_svt_axi_system_configuration extends svt_axi_system_configuration;
	
	`uvm_object_utils(cust_svt_axi_system_configuration)

	function new (string name = "cust_svt_axi_system_configuration");
		super.new(name);

		// Create a single AXI master agent and a single slave agent
		this.num_masters = 1;
		this.num_slaves = 1;

		// Create port configurations
		this.create_sub_cfgs(1,1);
		this.master_cfg[0].data_width = 128;
		this.slave_cfg[0].data_width = 128;
		this.master_cfg[0].id_width = 4;
		this.slave_cfg[0].id_width = 4;

	endfunction


endclass
