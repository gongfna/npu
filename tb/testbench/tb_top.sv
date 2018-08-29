//`timescale 1ns/1ps

//`include "uvm_macros.svh"

`include "svt_axi_defines.svi"
`include "svt_apb_defines.svi"


`include "uvm_pkg.sv"
`include "svt_apb_if.svi"
`include "svt_apb.uvm.pkg"
`include "svt_axi_if.svi"
`include "svt_axi.uvm.pkg"

import uvm_pkg::*;
import svt_uvm_pkg::*;
import svt_apb_uvm_pkg::*;
import svt_axi_uvm_pkg::*;

module tb_top(); 

    reg          pclk      ;
    reg          preset_n  ;
    reg          aclk      ;
    reg          areset_n  ;
    reg          xclk      ;
    reg          xrst_n    ;



    initial begin     		   
        pclk = 0;
        forever #5 pclk = ~pclk; //100Mhz clock 0.5/0.1
    end
     
    initial begin
         preset_n  = 0;
         #10; 
         preset_n  = 1;
    end 

    initial begin     		   
        aclk = 0;
        forever #(0.5/0.4) aclk = ~aclk; //250Mhz clock 0.5/0.25
    end
     
    initial begin
         areset_n  = 0;
         #10; 
         areset_n  = 1;
    end 

    initial begin     		   
        xclk = 0;
        forever #(0.5/0.8) xclk = ~xclk; //250Mhz clock
    end
     
    initial begin
         xrst_n  = 0;
         #10; 
         xrst_n  = 1;
    end 


    svt_apb_if apb_if();
    assign apb_if.pclk = pclk;
    assign apb_if.presetn = preset_n;


	svt_axi_if axi_if();
	assign axi_if.common_aclk = aclk;
	assign axi_if.master_if[0].aresetn = areset_n;
	assign axi_if.slave_if[0].aresetn = areset_n;

	initial begin
		uvm_config_db#(svt_apb_vif)::set(uvm_root::get(),"uvm_test_top.env.apb_system_env", "vif", apb_if);
		uvm_config_db#(svt_axi_vif)::set(uvm_root::get(),"uvm_test_top.env.axi_system_env", "vif", axi_if);
	end
	


    	
	npu DUT (
  	//			 //APB Bus
  	//			 .pclk					(pclk				        ), 
 	//			 .preset_n				(preset_n			        ), 
 	//			 .paddr					(apb_if.paddr				), 
 	//			 .pwdata				(apb_if.pwdata				), 
 	//			 .pwrite				(apb_if.pwrite				), 
 	//			 .psel					(apb_if.psel				), 
 	//			 .penable				(apb_if.penable			    ), 
 	//			 .prdata				(apb_if.prdata[0]			), 
				 //AXI Global singnal				 
				 .mstr_aclk				(aclk				        ),
				 .mstr_aresetn			(areset_n			        ),
				 //AXI Write Address Channel
				 .mstr_awvalid			(axi_if.slave_if[0].awvalid	),
				 .mstr_awaddr				(axi_if.slave_if[0].awaddr	),
				 .mstr_awid				(axi_if.slave_if[0].awid	),
				 .mstr_awlen				(axi_if.slave_if[0].awlen	),
				 .mstr_awsize				(axi_if.slave_if[0].awsize	),
				 .mstr_awburst			(axi_if.slave_if[0].awburst	),
				 .mstr_awlock				(axi_if.slave_if[0].awlock	),
				 .mstr_awcache			(axi_if.slave_if[0].awcache	),
				 .mstr_awprot				(axi_if.slave_if[0].awprot	),
				 .mstr_awready			(axi_if.slave_if[0].awready	),
				 //AXI Write Data Channel
				 .mstr_wvalid				(axi_if.slave_if[0].wvalid	),
				 .mstr_wid				(axi_if.slave_if[0].wid		),
				 .mstr_wdata				(axi_if.slave_if[0].wdata	),
				 .mstr_wstrb				(axi_if.slave_if[0].wstrb	),
				 .mstr_wlast				(axi_if.slave_if[0].wlast	),
				 .mstr_wready				(axi_if.slave_if[0].wready  ),
				 //AXI Write Response Channel
				 .mstr_bvalid				(axi_if.slave_if[0].bvalid	),
				 .mstr_bid				(axi_if.slave_if[0].bid		),
				 .mstr_bresp				(axi_if.slave_if[0].bresp	),
				 .mstr_bready				(axi_if.slave_if[0].bready	),
				 //AXI Read Address Channel
				 .mstr_arvalid				(axi_if.slave_if[0].arvalid	),
				 .mstr_arid				(axi_if.slave_if[0].arid	),
				 .mstr_araddr				(axi_if.slave_if[0].araddr	),
				 .mstr_arlen				(axi_if.slave_if[0].arlen	),
				 .mstr_arsize				(axi_if.slave_if[0].arsize	),
				 .mstr_arburst				(axi_if.slave_if[0].arburst	),
				 .mstr_arlock				(axi_if.slave_if[0].arlock	),
				 .mstr_arcache				(axi_if.slave_if[0].arcache	),
				 .mstr_arprot				(axi_if.slave_if[0].arprot	),
				 .mstr_arready				(axi_if.slave_if[0].arready	),
				 //AXI Read Data Channel
				 .mstr_rvalid				(axi_if.slave_if[0].rvalid	),
				 .mstr_rid					(axi_if.slave_if[0].rid	    ),
				 .mstr_rdata				(axi_if.slave_if[0].rdata	),
				 .mstr_rresp				(axi_if.slave_if[0].rresp	),
				 .mstr_rlast				(axi_if.slave_if[0].rlast	),
				 .mstr_rready				(axi_if.slave_if[0].rready	), 

				 //AXI Write Address Channel
				 .slv_awvalid			(axi_if.master_if[0].awvalid	),
				 .slv_awaddr				(axi_if.master_if[0].awaddr	),
				 .slv_awid				(axi_if.master_if[0].awid	),
				 .slv_awlen				(axi_if.master_if[0].awlen	),
				 .slv_awsize				(axi_if.master_if[0].awsize	),
				 .slv_awburst			(axi_if.master_if[0].awburst	),
				 .slv_awlock				(axi_if.master_if[0].awlock	),
				 .slv_awcache			(axi_if.master_if[0].awcache	),
				 .slv_awprot				(axi_if.master_if[0].awprot	),
				 .slv_awready			(axi_if.master_if[0].awready	),
				 //AXI Write Data Channel
				 .slv_wvalid				(axi_if.master_if[0].wvalid	),
				 .slv_wid				(axi_if.master_if[0].wid		),
				 .slv_wdata				(axi_if.master_if[0].wdata	),
				 .slv_wstrb				(axi_if.master_if[0].wstrb	),
				 .slv_wlast				(axi_if.master_if[0].wlast	),
				 .slv_wready				(axi_if.master_if[0].wready  ),
				 //AXI Write Response Channel
				 .slv_bvalid				(axi_if.master_if[0].bvalid	),
				 .slv_bid				(axi_if.master_if[0].bid		),
				 .slv_bresp				(axi_if.master_if[0].bresp	),
				 .slv_bready				(axi_if.master_if[0].bready	),
				 //AXI Read Address Channel
				 .slv_arvalid			(axi_if.master_if[0].arvalid	),
				 .slv_arid				(axi_if.master_if[0].arid	),
				 .slv_araddr				(axi_if.master_if[0].araddr	),
				 .slv_arlen				(axi_if.master_if[0].arlen	),
				 .slv_arsize				(axi_if.master_if[0].arsize	),
				 .slv_arburst			(axi_if.master_if[0].arburst	),
				 .slv_arlock				(axi_if.master_if[0].arlock	),
				 .slv_arcache			(axi_if.master_if[0].arcache	),
				 .slv_arprot				(axi_if.master_if[0].arprot	),
				 .slv_arready			(axi_if.master_if[0].arready	),
				 //AXI Read Data Channel
				 .slv_rvalid				(axi_if.master_if[0].rvalid	),
				 .slv_rid				(axi_if.master_if[0].rid	    ),
				 .slv_rdata				(axi_if.master_if[0].rdata	),
				 .slv_rresp				(axi_if.master_if[0].rresp	),
				 .slv_rlast				(axi_if.master_if[0].rlast	),
				 .slv_rready				(axi_if.master_if[0].rready	), 
				 //System IF
				 .remap_n(1'b1), 
                 .xclk					(xclk				        ), 
                 .xrst_n				(xrst_n				        ) 
				 );



initial begin
	$fsdbDumpfile("test.fsdb");
	$fsdbDumpvars(0,tb_top);
end


initial begin
	run_test();
end


endmodule
