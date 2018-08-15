`ifndef NPU_SYS_MON
`define NPU_SYS_MON

class npu_sys_mon extends uvm_monitor;
		
	int file_idx;
	string file_name;

	`uvm_component_utils(npu_sys_mon)

	//virtual npu_sysf vif;

    uvm_analysis_port #(npu_sys_tr) ap;

	function new(string name = "npu_sys_mon", uvm_component parent = null);
        super.new(name,parent);	
    endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("npu_sys_mon","build_phase is called",UVM_LOW);
		//if(!uvm_config_db#(virtual npu_sysf)::get(this,"","vif",vif))
		//	`uvm_fatal("npu_sys_mon","virtual interface must be set for vif");

		ap = new("ap",this);

    endfunction



	virtual task main_phase(uvm_phase phase);
		npu_sys_tr tr;

        file_idx = 0;
		for(int i=0;i<8;i++) begin	
			tr = new("tr");
			sample_conv1_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_conv1_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			tr = new("tr");
			sample_pool1_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_pool1_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			tr = new("tr");
			sample_res2a_branch1_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res2a_branch1 put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			tr = new("tr");
			sample_res2a_branch2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res2a_branch2a_output put tr to scb",UVM_LOW);
		end

		file_idx = 0;
		for(int i=0;i<2;i++) begin	
			tr = new("tr");
			sample_res2a_branch2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res2a_branch2b_output put tr to scb",UVM_LOW);
		end


        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			tr = new("tr");
			sample_res2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res2a_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			tr = new("tr");
			sample_res2b_branch2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res2b_branch2a_output put tr to scb",UVM_LOW);
		end

		file_idx = 0;
		for(int i=0;i<2;i++) begin	
			tr = new("tr");
			sample_res2b_branch2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res2b_branch2b_output put tr to scb",UVM_LOW);
		end


        file_idx = 0;
		for(int i=0;i<2;i++) begin	
			tr = new("tr");
			sample_res2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res2b_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res3a_branch1_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res3a_branch1 put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res3a_branch2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res3a_branch2a_output put tr to scb",UVM_LOW);
		end

		file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res3a_branch2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res3a_branch2b_output put tr to scb",UVM_LOW);
		end


        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res3a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res3a_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res3b_branch2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res3b_branch2a_output put tr to scb",UVM_LOW);
		end

		file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res3b_branch2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res3b_branch2b_output put tr to scb",UVM_LOW);
		end


        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res3b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res3b_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res4a_branch1_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res4a_branch1 put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res4a_branch2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res4a_branch2a_output put tr to scb",UVM_LOW);
		end

		file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res4a_branch2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res4a_branch2b_output put tr to scb",UVM_LOW);
		end


        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res4a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res4a_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res4b_branch2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res4b_branch2a_output put tr to scb",UVM_LOW);
		end

		file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res4b_branch2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res4b_branch2b_output put tr to scb",UVM_LOW);
		end


        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res4b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res4b_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res5a_branch1_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res5a_branch1 put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res5a_branch2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res5a_branch2a_output put tr to scb",UVM_LOW);
		end

		file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res5a_branch2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res5a_branch2b_output put tr to scb",UVM_LOW);
		end


        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res5a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res5a_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res5b_branch2a_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res5b_branch2a_output put tr to scb",UVM_LOW);
		end

		file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res5b_branch2b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res5b_branch2b_output put tr to scb",UVM_LOW);
		end


        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_res5b_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_res5b_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_pool5_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_pool5_output put tr to scb",UVM_LOW);
		end

        file_idx = 0;
		for(int i=0;i<1;i++) begin	
			tr = new("tr");
			sample_fc1000_output();
			ap.write(tr);
			`uvm_info("npu_sys_mon","monitor sample_fc1000_output put tr to scb",UVM_LOW);
		end

    endtask


	task sample_conv1_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/conv1_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob1_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob1_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_pool1_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/pool1_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob0_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob0_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res2a_branch1_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res2a_branch1_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob1_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob1_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask

	task sample_res2a_branch2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res2a_branch2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob1_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob1_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res2a_branch2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res2a_branch2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob0_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob0_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob1_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob1_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask

	task sample_res2b_branch2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res2b_branch2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob0_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob0_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res2b_branch2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res2b_branch2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob1_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob1_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob0_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob0_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res3a_branch1_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res3a_branch1_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			wait(tb_top.DUT.iob1_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob1_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask

	task sample_res3a_branch2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res3a_branch2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res3a_branch2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res3a_branch2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res3a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res3a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res3b_branch2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res3b_branch2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res3b_branch2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res3b_branch2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res3b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res3b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<3136;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res4a_branch1_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res4a_branch1_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<1568;i++) begin	
			wait(tb_top.DUT.iob1_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob1_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask

	task sample_res4a_branch2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res4a_branch2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<1568;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res4a_branch2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res4a_branch2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<1568;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res4a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res4a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<1568;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res4b_branch2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res4b_branch2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<1568;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res4b_branch2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res4b_branch2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<1568;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res4b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res4b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<1568;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask

	task sample_res5a_branch1_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res5a_branch1_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<784;i++) begin	
			wait(tb_top.DUT.iob1_read);
			@(posedge tb_top.DUT.mstr_aclk);
			#1;
			data = tb_top.DUT.iob1_rdata[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask

	task sample_res5a_branch2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res5a_branch2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<784;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res5a_branch2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res5a_branch2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<784;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res5a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res5a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<784;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res5b_branch2a_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res5b_branch2a_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<784;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res5b_branch2b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res5b_branch2b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<784;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_res5b_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/res5b_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<784;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask

	task sample_pool5_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/pool5_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<16;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask


	task sample_fc1000_output();	
		int fp_w;
		bit [255:0] data;
		
		$sformat(file_name,"./data_act/fc1000_tiling_%0d.txt",file_idx);
		fp_w = $fopen(file_name,"w");
		for(int i=0;i<1;i++) begin	
			while(1) begin
				@(posedge tb_top.DUT.mstr_aclk);
				if(tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wr_en) break;	
			end	
			data = tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0];
         	//$display("data = %h,data_index = %d",data,i);
			$fwrite(fp_w,"%h\n",data);
	    end

		$fclose(fp_w);

		file_idx++;
	endtask



endclass

//tb_top.DUT.U_NPU_CORE.U_NPE_TOP.o_iob_wdat[255:0]



`endif

