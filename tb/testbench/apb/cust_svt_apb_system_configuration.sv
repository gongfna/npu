
class cust_svt_apb_system_configuration extends svt_apb_system_configuration;
	
	`uvm_object_utils(cust_svt_apb_system_configuration)

	function new (string name = "cust_svt_apb_system_cfg");
		super.new(name);

		// Create a single APB master agent and a single slave agent
		//this.num_masters = 1;
		this.num_slaves = 1;

		// Create port configurations
		this.create_sub_cfgs(1);
		this.paddr_width = svt_apb_system_configuration::PADDR_WIDTH_8;
		this.pdata_width = svt_apb_system_configuration::PDATA_WIDTH_32;
		this.apb4_enable = 0;
		this.apb3_enable = 0;

        this.is_active = 1;
    	this.slave_cfg[0].is_active = 0;

	endfunction


endclass
