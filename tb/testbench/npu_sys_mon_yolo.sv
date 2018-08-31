`ifndef NPU_SYS_MON_YOLO
`define NPU_SYS_MON_YOLO

class npu_sys_mon_yolo extends uvm_monitor;
		
	int file_idx;
	string file_name;

	`uvm_component_utils(npu_sys_mon_yolo)

	//virtual npu_sysf vif;

    uvm_analysis_port #(npu_sys_tr) ap;

	function new(string name = "npu_sys_mon_yolo", uvm_component parent = null);
        super.new(name,parent);	
    endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("npu_sys_mon_yolo","build_phase is called",UVM_LOW);
		//if(!uvm_config_db#(virtual npu_sysf)::get(this,"","vif",vif))
		//	`uvm_fatal("npu_sys_mon_yolo","virtual interface must be set for vif");

		ap = new("ap",this);

    endfunction



	virtual task main_phase(uvm_phase phase);
		npu_sys_tr tr;

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_output0();
			ap.write(tr);
			`uvm_info("npu_sys_mon_yolo","monitor sample_conv1_output put tr to scb",UVM_LOW);
		end





    endtask


	task sample_output0();	
		int fp_w;
		bit [255:0] data;
		
		//$sformat(file_name,"./data_act/output.txt",file_idx);
		fp_w = $fopen("./data_act_yolo/output.txt","w");
		for(int i=0;i<1352;i++) begin	
	       	for(int j=0; j<2; j++) begin
		   		while(1) begin
		   			@(negedge tb_top.DUT.xclk);
		   			if(tb_top.DUT.iob0_write & tb_top.DUT.iob0_cs) break;	
		   		end	
		   		if(tb_top.DUT.iob0_wstrb === 32'h0000_ffff) begin
		   			data[127:0]  = tb_top.DUT.iob0_wdata[127:0];
		   		end
		   		if(tb_top.DUT.iob0_wstrb === 32'hffff_0000) begin
		   			data[255:128]  = tb_top.DUT.iob0_wdata[255:128];
		   		end
		    end      
	    	$fwrite(fp_w,"%h\n",data);
        end

		$fclose(fp_w);

	endtask



	task sample_output();	
		int fp_w;
		bit [255:0] data;
		
		//$sformat(file_name,"./data_act/output.txt",file_idx);
		fp_w = $fopen("./data_act_yolo/output.txt","w");
		for(int i=0;i<1352;i++) begin	
	       	for(int j=0; j<2; j++) begin
				while(1) begin
					@(posedge tb_top.axi_if.common_aclk);
					if (tb_top.axi_if.slave_if[0].wvalid & tb_top.axi_if.slave_if[0].wready) break;	
				end
		   		if(j==0) begin
		   			data[127:0]  = tb_top.axi_if.slave_if[0].wdata[127:0];
		   		end
		   		if(j==1) begin
		   			data[255:128]  = tb_top.axi_if.slave_if[0].wdata[127:0];
		   		end
		    end      
	    	$fwrite(fp_w,"%h\n",data);
        end

		$fclose(fp_w);

	endtask






endclass




`endif

