`ifndef BASE_SEQ
`define BASE_SEQ

class base_seq extends uvm_sequence #(npu_sys_tr);

	npu_sys_tr tr;

	`uvm_object_utils(base_seq)
	//`uvm_declare_p_sequencer(npu_sys_sqr) 

	function new(string name = "base_seq");
        super.new(name);	
    endfunction

	virtual task pre_body();
		if(starting_phase != null) 
			starting_phase.raise_objection(this);
	endtask

	virtual task body();
		`uvm_info("base_seq","test begin",UVM_LOW)
		#100;

	endtask

	virtual task post_body();
		if(starting_phase != null) 
			starting_phase.drop_objection(this);
	

	endtask

endclass

`endif


