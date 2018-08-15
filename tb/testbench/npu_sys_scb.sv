`ifndef NPU_SYS_SCB
`define NPU_SYS_SCB

class npu_sys_scb extends uvm_scoreboard;

	`uvm_component_utils(npu_sys_scb)

	//npu_sys_tr   exp_queue[$];
	//npu_sys_cfg  cfg;

	//uvm_blocking_get_port #(npu_sys_tr) exp_port;
	uvm_blocking_get_port #(npu_sys_tr) act_port;

	function new(string name = "npu_sys_scb", uvm_component parent = null);
        super.new(name,parent);	
    endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("npu_sys_scb","build_phase is called",UVM_LOW);
		//exp_port = new("exp_port",this);
		act_port = new("act_port",this);

        //if(!uvm_config_db#(npu_sys_cfg)::get(this,"","cfg",cfg))
		//	`uvm_fatal("npu_sys_scb","npu_sys_cfg must be set for this.cfg");

    endfunction

	virtual task reset_phase(uvm_phase phase);

		`uvm_info("npu_sys_scb","reset_phase is called",UVM_LOW);

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

		`uvm_info("npu_sys_scb","main_phase is called",UVM_LOW);


        file_idx = 0;
		for(int i=0;i<8;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/conv1/conv1_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/conv1_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("conv1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("conv1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);
					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/pool1/pool1_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/pool1_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("pool1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("pool1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);
					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end


        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res2a_branch1/res2a_branch1_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res2a_branch1_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res2a_branch1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res2a_branch1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res2a_branch2a/res2a_branch2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res2a_branch2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res2a_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res2a_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res2a_branch2b/res2a_branch2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res2a_branch2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res2a_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res2a_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res2a/res2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end
		
        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res2b_branch2a/res2b_branch2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res2b_branch2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res2b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res2b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res2b_branch2b/res2b_branch2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res2b_branch2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res2b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res2b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res2b/res2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res3a_branch1/res3a_branch1_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res3a_branch1_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res3a_branch1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res3a_branch1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end



        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res3a_branch2a/res3a_branch2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res3a_branch2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res3a_branch2b/res3a_branch2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res3a_branch2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res3a/res3a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res3a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res3b_branch2a/res3b_branch2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res3b_branch2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res3b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res3b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res3b_branch2b/res3b_branch2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res3b_branch2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res3b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res3b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res3b/res3b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res3b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res3b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res3b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end


        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res4a_branch1/res4a_branch1_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res4a_branch1_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res4a_branch1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res4a_branch1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end



        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res4a_branch2a/res4a_branch2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res4a_branch2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				//if(data_exp !== data_act) 
				//	`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res4a_branch2b/res4a_branch2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res4a_branch2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				//if(data_exp !== data_act) 
				//	`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res4a/res4a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res4a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res4b_branch2a/res4b_branch2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res4b_branch2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
       	    	$display("res4b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);
				//if(data_exp !== data_act) 
				//	`uvm_error("npu_sys_scb",$sformatf("res4b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				//else
         	    //	$display("res4b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res4b_branch2b/res4b_branch2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res4b_branch2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				$display("res4b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);
				//if(data_exp !== data_act) 
				//	`uvm_error("npu_sys_scb",$sformatf("res4b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				//else
         	    //	$display("res4b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res4b/res4b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res4b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res4b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res4b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res5a_branch1/res5a_branch1_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res5a_branch1_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res5a_branch1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res5a_branch1_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end



        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res5a_branch2a/res5a_branch2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res5a_branch2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				//if(data_exp !== data_act) 
				//	`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res5a_branch2b/res5a_branch2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res5a_branch2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				//if(data_exp !== data_act) 
				//	`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res5a/res5a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res5a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
         	    $display("data_exp = %h,data_act = %h, data_index = %0d, file_index = %0d",data_exp,data_act,data_idx,file_idx);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("data_exp = %h,data_act = %h, data_index = %0d,file_index = %0d",data_exp,data_act,data_idx,file_idx))					
				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res5b_branch2a/res5b_branch2a_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res5b_branch2a_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				$display("res5b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);
				//if(data_exp !== data_act) 
				//	`uvm_error("npu_sys_scb",$sformatf("res5b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				//else
         	    //	$display("res5b_branch2a_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res5b_branch2b/res5b_branch2b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res5b_branch2b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				$display("res5b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);
				//if(data_exp !== data_act) 
				//	`uvm_error("npu_sys_scb",$sformatf("res5b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				//else
         	    //	$display("res5b_branch2b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/res5b/res5b_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/res5b_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("res5b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("res5b_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/pool5/pool5_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/pool5_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("pool5_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("pool5_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

				data_idx++;
        	end	
			data_idx = 0;

			$fclose(fp_exp);
			$fclose(fp_act);
			file_idx++;		
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			act_port.get(act_tr);

		    $sformat(file_name,"./data/outputnew2/fc1000/fc1000_output_tiling_%0d",file_idx);
			fp_exp = $fopen(file_name,"r");

		    $sformat(file_name,"./data_act/fc1000_tiling_%0d.txt",file_idx);
			fp_act = $fopen(file_name,"r");

 			while(!$feof(fp_exp)) begin  
        		$fscanf(fp_exp,"%h",data_exp); 
        		$fscanf(fp_act,"%h",data_act);
				if(data_exp !== data_act) 
					`uvm_error("npu_sys_scb",$sformatf("fc1000_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx))	
				else
         	    	$display("fc1000_tiling_%0d : data_exp = %h, data_act = %h, data_idx = %0d",file_idx,data_exp,data_act,data_idx);

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
