`ifndef NPU_SYS_TR
`define NPU_SYS_TR

class npu_sys_tr extends uvm_sequence_item;

	rand bit [3:0] dma_mode;
	
	`uvm_object_utils_begin(npu_sys_tr)
		`uvm_field_int(dma_mode,UVM_ALL_ON);
	`uvm_object_utils_end

	function new(string name = "npu_sys_tr");
        super.new(name);	
    endfunction

endclass

`endif

		

