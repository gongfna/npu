`ifndef NPU_SYS_SCB_YOLO
`define NPU_SYS_SCB_YOLO

class npu_sys_scb_yolo extends uvm_scoreboard;

	`uvm_component_utils(npu_sys_scb_yolo)

	//npu_sys_tr   exp_queue[$];
	//npu_sys_cfg  cfg;

	//uvm_blocking_get_port #(npu_sys_tr) exp_port;
	uvm_blocking_get_port #(npu_sys_tr) act_port;

	function new(string name = "npu_sys_scb_yolo", uvm_component parent = null);
        super.new(name,parent);	
    endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("npu_sys_scb_yolo","build_phase is called",UVM_LOW);
		//exp_port = new("exp_port",this);
		act_port = new("act_port",this);

        //if(!uvm_config_db#(npu_sys_cfg)::get(this,"","cfg",cfg))
		//	`uvm_fatal("npu_sys_scb_yolo","npu_sys_cfg must be set for this.cfg");

    endfunction

	virtual task reset_phase(uvm_phase phase);

		`uvm_info("npu_sys_scb_yolo","reset_phase is called",UVM_LOW);

    endtask


	virtual task main_phase(uvm_phase phase);
		//npu_sys_tr exp_tr;
		npu_sys_tr act_tr;
		//npu_sys_tr tmp_tr;
		bit result;

 		bit [255:0] data_exp;
		bit [255:0] data_act;
		int fp_exp;
		int fp_act;
		int data_idx = 0;
	    int file_idx;
	    string file_name;

		super.main_phase(phase);

		`uvm_info("npu_sys_scb_yolo","main_phase is called",UVM_LOW);


        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    //$sformat(file_name,"./data/output.txt",file_idx);
			fp_exp = $fopen("./data_yolo/output.txt","r");

		    //$sformat(file_name,"./data_act/output.txt",file_idx);
			fp_act = $fopen("./data_act_yolo/output.txt","r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb_yolo",$sformatf("output_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("output_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);
					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

    endtask


endclass

`endif
