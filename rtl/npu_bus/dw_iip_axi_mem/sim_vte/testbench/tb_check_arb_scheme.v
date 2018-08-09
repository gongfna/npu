// Dont't compile if the master 1's ready data channel is on the shared
// layer.
`ifdef AXI_M1_ON_R_SHARED
`else
// This file checks the arbiter instantiated in the read data channel in
// master port 1 of DW_axi. The purpose of the test is to check that the
// arbitration scheme selected by the ARB_TYPE parameter in that module
// correctly reflects the specified arbitration scheme for that value.
// This is done by instantiating the correct arbiter type here and
// comparing the outputs of the DUT arbiter and TB arbiter on a cycle by
// cycle basis.
//
// Only this arbiter is checked because we have another check that the
// correct ARB_TYPE parameter is set in each instantiation of
// DW_axi_arb, and given the purpose of this check, these 2 checks give 
// us a good degree of confidence that the selected arbitration scheme
// has been implemented correctly at each arbitration point.
//
// The test works by probing into the DUT to extract the signals applied
// to the DW_axi_arb instantion in the read data channel of MP 1, and
// applying these inputs to an arbiter (fcfs/dp/2t) instantiated here in
// this check. The grant index outputs of these 2 arbiters will be sampled 
// at specific times and their values compared for a pass/fail result.

// Arbiter parameters.
parameter NC = `AXI_NSP1V_M1;
parameter LOG2_NC = `AXI_LOG2_NSP1V_M1;
parameter LOG2_NC_P1 = `AXI_LOG2_NSP2V_M1;
parameter PRIORITY_W = `AXI_SLV_PRIORITY_W;

parameter BUS_PRIORITY_W = NC*PRIORITY_W;

// DUT parameters.
parameter PL_ARB = `AXI_R_PL_ARB;

// Wires to connect to internal DUT signals.
wire [NC-1:0] req;
wire [BUS_PRIORITY_W-1:0] bus_priority;
wire [LOG2_NC-1:0] dut_grant_index;


// Internal signals.
wire [LOG2_NC-1:0] tb_grant_index;


// Connect to DUT arbiter signals.
assign req = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.req_mca;
assign bus_priority = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.bus_priorities_mca;
assign dut_grant_index = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.grant_index_arb_o;
assign tb_arb_enable = test_DW_axi.U_DW_axi.U_DW_axi_mp_m1.gen_r_drespch.U_R_DW_axi_mp_drespch.U_DW_axi_arb.arb_enable;



//----------------------------------------------------------------------
// Perform the grant index comparison.
//----------------------------------------------------------------------
reg arb_scheme_check_err;

always @(posedge aclk)
begin

  // NOTE : This check is turned off if multi cycle arbitration is 
  //        enabled at this port. 
  if( (dut_grant_index != tb_grant_index) && (`AXI_R_MCA_NC_M1 == 1)
    ) begin
    $display("ERROR: %0d -  ARB SCHEME CHECKER -> Grant index mismatch in MP1 R channel, grant index is %0d, should be %0d .", $time, dut_grant_index, tb_grant_index); 
    found_error=1;
    arb_scheme_check_err <= 1;
   end else begin
    arb_scheme_check_err <= 0;
   end

end


  //--------------------------------------------------------------------
  // Instantiate designware arbiter.
  // Note we use the the same arbiter for DP and USER options. 
  // By default there is a DP arbiter instantiated in the user arbiter.
  //--------------------------------------------------------------------
  generate 
    case (`AXI_R_ARB_TYPE_M1)

      `AXI_ARB_TYPE_DP,  
      `AXI_ARB_TYPE_USER : begin
  DW_axi_arbiter_dp
        #(NC,          // Number of clients.
          PRIORITY_W,  // Priority signal width per client.   
          0,           // No park mode.     
          0,           // Park mode N/A.
          0,           // Unregistered output mode.
          LOG2_NC      // Width of grant index.
        )
        U_DW_axi_arbiter_dp (
          // Inputs 
          .clk          (aclk),
          .rst_n        (aresetn),
          .enable       (1'b1), // DP arbiter not timing based so
	                        // always enable.
      
          .request      (req),
          .lock         ({NC{1'b0}}), // No locking on R channel.
          .mask         ({NC{1'b0}}), // Not using mask inputs.
          .prior        (bus_priority),
          
          // Outputs
          .grant_index  (tb_grant_index),
          .granted      (), // Unconnected output.
          .locked       (), // Unconnected output.
          .grant        (), // Unconnected output.
          .parked       ()  // Unconnected output.
        );
      end
    
      `AXI_ARB_TYPE_FCFS : begin
  DW_axi_arbiter_fcfs
        #(NC,          // Number of clients.
          0,           // No park mode.     
          0,           // Park mode N/A.
          0,           // Unregistered output mode.
          LOG2_NC,     // Width of grant index.
	        LOG2_NC_P1   // Index width (log b2 (num clients + 1).
        )
        U_DW_axi_arbiter_fcfs (
	        // Inputs.
	        .clk         (aclk),
	        .rst_n       (aresetn),
          .init_n      (1'b1), // No synchronous reset.

	        .enable      (tb_arb_enable), 
	        .request     (req),
          .lock        ({NC{1'b0}}), // No locking on R channel.
          .mask        ({NC{1'b0}}), // Not using mask inputs.

	        // Outputs.
          .grant_index (tb_grant_index),
          .granted     (), // Unconnected output.
          .locked      (), // Unconnected output.
          .grant       (), // Unconnected output.
          .parked      ()  // Unconnected output.
         );
      end

      `AXI_ARB_TYPE_2T : begin
  DW_axi_arbiter_fae
        #(NC,          // Number of clients.
          PRIORITY_W,  // Priority signal width per client.   
          0,           // No park mode.     
          0,           // Park mode N/A.
          0,           // Unregistered output mode.
          LOG2_NC      // Width of grant index.
        )
	      U_DW_axi_arbiter_2t (
	        .clk         (aclk),
	        .rst_n       (aresetn),
          .init_n      (1'b1), // No synchronous reset.

	        .enable      (tb_arb_enable), 
	        .request     (req),
	        .prior       (bus_priority),
          .lock        ({NC{1'b0}}), // No locking on R channel.
          .mask        ({NC{1'b0}}), // Not using mask inputs.
       
          .grant_index  (tb_grant_index),
          .granted      (), // Unconnected output.
          .locked       (), // Unconnected output.
          .grant        (), // Unconnected output.
          .parked       ()  // Unconnected output.
        );
      end

    endcase

  endgenerate


`endif



