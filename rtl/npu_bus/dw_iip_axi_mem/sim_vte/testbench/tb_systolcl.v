/* ---------------------------------------------------------------------
**
**                  (C) COPYRIGHT 2006-2011 SYNOPSYS, INC.
**                            ALL RIGHTS RESERVED
**
**  This software and the associated documentation are confidential and
**  proprietary to Synopsys, Inc.  Your use or disclosure of this
**  software is subject to the terms and conditions of a written
**  license agreement between you, or your company, and Synopsys, Inc.
**
**  The entire notice above must be reproduced on all authorized copies.
**
** ---------------------------------------------------------------------
**
** File     : tb_systolcl.v
** Created  : Tue May 24 17:09:09 MEST 2005
** Modified : $Date$
** Abstract : Testbench system to local port number mapping.
**
** ---------------------------------------------------------------------
*/

module tb_systolcl (
  // Inputs.
  sys_pnum_i,
  
  // Outputs.
  lcl_pnum_o
);

//----------------------------------------------------------------------
// MODULE PARAMETERS.
//----------------------------------------------------------------------
  parameter MP_LCL   = 0;  // Master or Slave to system to local.
  parameter NUM_PLCL = 17; // Number of visible/local ports.

  parameter LCLPNUM_W = 5; // Width of local port number signals. 

  parameter NUM_PSYS = 17; // Number of ports in the system, master or
                           // slave depending on which one we are 
			   // dealing with.

  parameter SYSPNUM_W = 5; // Width of system port number signals. 

  parameter P0_VIS  = 1; // Port visibility parameters. Set to 1 if
  parameter P1_VIS  = 1; // corresponding port is visible. Need 17
  parameter P2_VIS  = 1; // parameters, for slaves we have 16 possible
  parameter P3_VIS  = 1; // user slaves + 1 for the default slave.
  parameter P4_VIS  = 1; 
  parameter P5_VIS  = 1; 
  parameter P6_VIS  = 1; 
  parameter P7_VIS  = 1; 
  parameter P8_VIS  = 1; 
  parameter P9_VIS  = 1; 
  parameter P10_VIS = 1; 
  parameter P11_VIS = 1; 
  parameter P12_VIS = 1; 
  parameter P13_VIS = 1; 
  parameter P14_VIS = 1; 
  parameter P15_VIS = 1; 
  parameter P16_VIS = 1; 
  

//----------------------------------------------------------------------
// PORT DECLARATIONS.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// INPUTS
//----------------------------------------------------------------------
  input [SYSPNUM_W-1:0] sys_pnum_i; // System port number input.

//----------------------------------------------------------------------
// OUTPUTS
//----------------------------------------------------------------------
  output [LCLPNUM_W-1:0] lcl_pnum_o; // Local port number output.


  //--------------------------------------------------------------------
  // REGISTER VARIABLES.
  //--------------------------------------------------------------------

  // Local port system port numbers bus.
  reg [LCLPNUM_W*NUM_PSYS-1:0] bus_sys_port_lclnums; 
  
  // Map System Number to system port number (BICMD Support)
  reg [SYSPNUM_W-1:0] sys_pnum_map; // System port number input.


  //--------------------------------------------------------------------
  // WIRE VARIABLES.
  //--------------------------------------------------------------------
  wire [`AXI_MAX_NUM_MST_SLVS-1:0] bus_p_vis; // Bus containing all
                                              // port visibility 
					      // parameters.

  wire [LCLPNUM_W-1:0] lcl_pnum_mpd; // Local port number mapped from
                                     // system port number.
  
  wire p0_vis;					      
  wire p1_vis;					      
  wire p2_vis;					      
  wire p3_vis;					      
  wire p4_vis;					      
  wire p5_vis;					      
  wire p6_vis;					      
  wire p7_vis;					      
  wire p8_vis;					      
  wire p9_vis;					      
  wire p10_vis;					      
  wire p11_vis;					      
  wire p12_vis;					      
  wire p13_vis;					      
  wire p14_vis;					      
  wire p15_vis;					      
  wire p16_vis;					      
  
  assign p0_vis = P0_VIS;
  assign p1_vis = P1_VIS;
  assign p2_vis = P2_VIS;
  assign p3_vis = P3_VIS;
  assign p4_vis = P4_VIS;
  assign p5_vis = P5_VIS;
  assign p6_vis = P6_VIS;
  assign p7_vis = P7_VIS;
  assign p8_vis = P8_VIS;
  assign p9_vis = P9_VIS;
  assign p10_vis = P10_VIS;
  assign p11_vis = P11_VIS;
  assign p12_vis = P12_VIS;
  assign p13_vis = P13_VIS;
  assign p14_vis = P14_VIS;
  assign p15_vis = P15_VIS;
  assign p16_vis = P16_VIS;
      
  always @ (sys_pnum_i) begin
    sys_pnum_map = sys_pnum_i;
   
   `ifdef AXI_BICMD_SUPPORT
     if(MP_LCL) begin
      // For bi-directional command support system numbers
      // don't always correspond to system port numbers
      // case statement maps system numbers to system port numbers
      case(sys_pnum_i) 
        0:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M1  - 1;
        1:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M2  - 1;
        2:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M3  - 1;
        3:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M4  - 1;
        4:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M5  - 1;
        5:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M6  - 1;
        6:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M7  - 1;
        7:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M8  - 1;
        8:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M9  - 1;
        9:  sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M10 - 1;
        10: sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M11 - 1;
        11: sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M12 - 1;
        12: sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M13 - 1;
        13: sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M14 - 1;
        14: sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M15 - 1;
        15: sys_pnum_map = `AXI_PNUM_FOR_SYS_NUM_M16 - 1;
        default: sys_pnum_map = sys_pnum_i;
      endcase
     end
   `endif
  end

  // Build up bus of port visibility parameters.
  assign bus_p_vis = { p16_vis,
                       p15_vis,
                       p14_vis,
                       p13_vis,
                       p12_vis,
                       p11_vis,
                       p10_vis,
                       p9_vis,
                       p8_vis,
                       p7_vis,
                       p6_vis,
                       p5_vis,
                       p4_vis,
                       p3_vis,
                       p2_vis,
                       p1_vis,
                       p0_vis
		     };
 					      

  //--------------------------------------------------------------------
  // STATIC DECODE
  // Decode system port numbers corresponding local port numbers from 
  // input parameters.
  //--------------------------------------------------------------------
  always @ (bus_p_vis) 
  begin : gen_lcl_pnums_PROC
    reg [LCLPNUM_W-1:0] lcl_pnum;

    integer sys_pnum;
    integer i; // Loop iterator below.

    bus_sys_port_lclnums = {SYSPNUM_W*NUM_PSYS{1'b0}};
    lcl_pnum             = {LCLPNUM_W{1'b0}};

    // Search through all system ports to find a match for 
    // the current local port number. 
    for(sys_pnum=0; sys_pnum<=(NUM_PSYS-1); sys_pnum=sys_pnum+1) begin

      if(bus_p_vis[sys_pnum]) begin
	// Assign bit by bit as verilog does not allow variable
	// field widths.
        for(i=0 ; i<=(LCLPNUM_W-1) ; i=i+1) begin
          bus_sys_port_lclnums[(LCLPNUM_W*sys_pnum)+i] = lcl_pnum[i];
	end

        // When we match a system port number to a local port
        // number, the next visible system port will be
	// local port number lcl_pnum+1.
        lcl_pnum = lcl_pnum+1;			   
      end

    end // for(sys_pnum...

  end // gen_lcl_pnums_PROC
  

  // This module implements the system port number to local
  // port number mux.
  tb_busmux
  #(NUM_PSYS,     // Number of input busses.
    LCLPNUM_W,    // Width of each input bus.
    SYSPNUM_W     // Width of select line.
  )
  U_lcltosys_mux (
    .sel  (sys_pnum_map),
    .din  (bus_sys_port_lclnums), 
    .dout (lcl_pnum_mpd) 
  );
  

  // If the number of local ports is equal to the number of
  // system ports no mapping needs to be done so we can
  // assign the system port number straight to the local port
  // number.
  assign lcl_pnum_o = (NUM_PLCL==NUM_PSYS) 
                      ? sys_pnum_map 
		      : lcl_pnum_mpd;


  `ifdef PARAM_VARS_PROC
  // -------------------------------------------------------
  // Initial block added to declare and connect variables
  // to hold all parameters in this module for easy viewing
  // during debug in a wave viewer.
  // -------------------------------------------------------
  // synopsys translate_off 
  // VCS coverage off 
  initial begin : param_vars_PROC

    integer  MP_LCL_param; 
    integer  NUM_PLCL_param; 
    integer  LCLPNUM_W_param; 
    integer  NUM_PSYS_param; 
    integer  SYSPNUM_W_param; 
    integer  P0_VIS_param; 
    integer  P1_VIS_param; 
    integer  P2_VIS_param; 
    integer  P3_VIS_param; 
    integer  P4_VIS_param; 
    integer  P5_VIS_param; 
    integer  P6_VIS_param; 
    integer  P7_VIS_param; 
    integer  P8_VIS_param; 
    integer  P9_VIS_param; 
    integer  P10_VIS_param; 
    integer  P11_VIS_param; 
    integer  P12_VIS_param; 
    integer  P13_VIS_param; 
    integer  P14_VIS_param; 
    integer  P15_VIS_param; 
    integer  P16_VIS_param; 


    MP_LCL_param = MP_LCL; 
    NUM_PLCL_param = NUM_PLCL; 
    LCLPNUM_W_param = LCLPNUM_W; 
    NUM_PSYS_param = NUM_PSYS; 
    SYSPNUM_W_param = SYSPNUM_W; 
    P0_VIS_param = P0_VIS; 
    P1_VIS_param = P1_VIS; 
    P2_VIS_param = P2_VIS; 
    P3_VIS_param = P3_VIS; 
    P4_VIS_param = P4_VIS; 
    P5_VIS_param = P5_VIS; 
    P6_VIS_param = P6_VIS; 
    P7_VIS_param = P7_VIS; 
    P8_VIS_param = P8_VIS; 
    P9_VIS_param = P9_VIS; 
    P10_VIS_param = P10_VIS; 
    P11_VIS_param = P11_VIS; 
    P12_VIS_param = P12_VIS; 
    P13_VIS_param = P13_VIS; 
    P14_VIS_param = P14_VIS; 
    P15_VIS_param = P15_VIS; 
    P16_VIS_param = P16_VIS; 

  end // param_vars_PROC 

  // VCS coverage on 
  // synopsys translate_on 

  `endif // PARAM_VARS_PROC 
endmodule
