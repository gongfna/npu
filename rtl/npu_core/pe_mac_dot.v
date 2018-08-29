`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:14 01/07/2018 
// Design Name: 
// Module Name:    pe_mac 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`default_nettype none
module pe_mac_dot #(
    parameter   DATA_WIDTH      =   8   ,
    parameter   DATA_COPIES     =   32  ,
    parameter   INDEX_WIDTH     =   5   
) (
    input  wire                                             i_clk           ,
    input  wire                                             i_rst_n         ,
    input  wire[DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:0]   i_wdata         ,
    input  wire                                             i_wdata_vld     ,
    input  wire[DATA_COPIES*DATA_WIDTH-1:0]                 i_mdata         ,
    input  wire                                             i_mdata_vld     ,
     input  wire[DATA_COPIES*DATA_WIDTH-1:0]                 i_mdata1         ,
    input  wire                                             i_mdata_vld1     ,
    output wire[DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:0]   o_wdata         ,
    output wire                                             o_wdata_vld     ,
    output wire[DATA_COPIES*DATA_WIDTH-1:0]                 o_mdata         ,
    output wire                                             o_mdata_vld     ,
    output wire[DATA_COPIES*2*DATA_WIDTH-1:0]               o_mac_result    ,
    input  wire                                             i_mac_clear     ,
    input  wire                                             i_mac_en        ,
    input  wire                                             i_src_from2buffer,
    input  wire                                                  i_dot_en,        
    input   wire                                                 i_dotacc_en,
    input  wire[2:0]                                        i_mac_id        
);
//////////////////////////////////////////////////////////////////////////////////
    parameter Max_Value =$signed(16'h7fff);
    parameter Min_Value =$signed(16'h8000);
    parameter PARA_MODE_DOT=    4'd7;
    parameter PARA_MODE_DOT_ACC=4'd8;
    reg [DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH)-1:0]          r_wdata                         ;
    reg                                                     r_wdata_vld                     ;
    reg [DATA_COPIES*DATA_WIDTH-1:0]                        r_mdata                         ;
    reg                                                     r_mdata_vld                     ;
    reg [DATA_COPIES*DATA_WIDTH-1:0]                        r_mdata1                         ;
    reg                                                     r_mdata_vld1                     ;
    wire signed [DATA_WIDTH-1:0]                            multiplier[DATA_COPIES-1:0]     ;
    reg  signed [DATA_WIDTH-1:0]                            multiplicand[DATA_COPIES-1:0]   ;
    wire signed [DATA_WIDTH-1:0]                            data[DATA_COPIES-1:0]           ;
    wire[INDEX_WIDTH-1:0]                                   index[DATA_COPIES-1:0]          ;
    wire signed [2*DATA_WIDTH-1:0]                          c_mul_result[DATA_COPIES-1:0]   ;
    wire signed [2*DATA_WIDTH-1:0]                          c_mac_result[DATA_COPIES-1:0]   ;
    reg  signed [2*DATA_WIDTH-1:0]                          post_result[DATA_COPIES-1:0]    ;
    wire signed [2*DATA_WIDTH-1:0]                          c_result[DATA_COPIES-1:0]       ;
    reg  signed [2*DATA_WIDTH-1:0]                          r_result[DATA_COPIES-1:0]       ;
    wire                                                    mac_clear                       ;
    wire   dot_en;
    wire   first_valid; 
    wire   dot_dmdata_vld;
    assign mac_clear = i_mac_clear | ~i_mac_en;
    assign dot_en = i_dot_en || i_dotacc_en;
    //assign dot_dmdata_vld = dot_en&&i_mdata_vld&&i_mdata_vld1;
//////////////////////////////////////////////////////////////////////////////////
    genvar i;
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : assign_loop
            assign data[i]       = r_mdata[DATA_WIDTH*i+:DATA_WIDTH];
            assign multiplier[i] = (i_src_from2buffer&&dot_en) ? r_mdata[DATA_WIDTH*i+:DATA_WIDTH]  : r_wdata[INDEX_WIDTH*DATA_COPIES+DATA_WIDTH*i+:DATA_WIDTH]; // weight
            assign index[i]      = r_wdata[INDEX_WIDTH*i+:INDEX_WIDTH];
            assign o_mac_result[2*DATA_WIDTH*i+:2*DATA_WIDTH] = c_result[i];
        end
    endgenerate
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : mux_loop
            always @(*) begin
            		if(dot_en&&i_src_from2buffer) 
            		multiplicand[i] = r_mdata1[8*(i+1)-1 : i*8];
            		else
                multiplicand[i] = data[31-index[i]];
                /*
                case (index[i])
                    5'd00	:	multiplicand[i]	=	data[31]	;
                    5'd01	:	multiplicand[i]	=	data[30]	;
                    5'd02	:	multiplicand[i]	=	data[29]	;
                    5'd03	:	multiplicand[i]	=	data[28]	;
                    5'd04	:	multiplicand[i]	=	data[27]	;
                    5'd05	:	multiplicand[i]	=	data[26]	;
                    5'd06	:	multiplicand[i]	=	data[25]	;
                    5'd07	:	multiplicand[i]	=	data[24]	;
                    5'd08	:	multiplicand[i]	=	data[23]	;
                    5'd09	:	multiplicand[i]	=	data[22]	;
                    5'd10	:	multiplicand[i]	=	data[21]	;
                    5'd11	:	multiplicand[i]	=	data[20]	;
                    5'd12	:	multiplicand[i]	=	data[19]	;
                    5'd13	:	multiplicand[i]	=	data[18]	;
                    5'd14	:	multiplicand[i]	=	data[17]	;
                    5'd15	:	multiplicand[i]	=	data[16]	;
                    5'd16	:	multiplicand[i]	=	data[15]	;
                    5'd17	:	multiplicand[i]	=	data[14]	;
                    5'd18	:	multiplicand[i]	=	data[13]	;
                    5'd19	:	multiplicand[i]	=	data[12]	;
                    5'd20	:	multiplicand[i]	=	data[11]	;
                    5'd21	:	multiplicand[i]	=	data[10]	;
                    5'd22	:	multiplicand[i]	=	data[9]	    ;
                    5'd23	:	multiplicand[i]	=	data[8]	    ;
                    5'd24	:	multiplicand[i]	=	data[7]	    ;
                    5'd25	:	multiplicand[i]	=	data[6]	    ;
                    5'd26	:	multiplicand[i]	=	data[5]	    ;
                    5'd27	:	multiplicand[i]	=	data[4]	    ;
                    5'd28	:	multiplicand[i]	=	data[3]	    ;
                    5'd29	:	multiplicand[i]	=	data[2]	    ;
                    5'd30	:	multiplicand[i]	=	data[1]	    ;
                    5'd31	:	multiplicand[i]	=	data[0]	    ;
                    default :	multiplicand[i]	=	data[0]	    ;
                endcase
                */
            end
        end
    endgenerate

wire signed [DATA_WIDTH-1:0] mult_a [DATA_COPIES -1 :0]; 
wire signed [DATA_WIDTH-1:0] mult_a1 [DATA_COPIES -1 :0]; 
wire signed [DATA_WIDTH-1:0] mult_b [DATA_COPIES -1 :0];
wire signed [DATA_WIDTH-1:0] dot_mult_a  [DATA_COPIES-1:0];
wire signed [DATA_WIDTH-1:0] dot_mult_a1  [DATA_COPIES-1:0];
reg signed [DATA_WIDTH-1:0] dot_mult_b [DATA_COPIES-1:0];
// mult_res=32*16
reg dot_mult_en;
reg noblock_mult;

//always @(posedge i_clk or negedge i_rst_n) begin
//	  if (!i_rst_n) begin
//			 noblock_mult <= 1'b0;
//        end else 
//        if(dot_en&&i_mdata_vld&&i_mdata_vld1)
//        	noblock_mult <= 1'b1;
//        else	 noblock_mult <= 1'b0;
//end

always @(posedge i_clk or negedge i_rst_n) begin
	  if (!i_rst_n) begin
			 dot_mult_en <= 1'b0;
        end 
        else	if(dot_en&&i_mdata_vld) 
        begin
        	 	dot_mult_en <= ~dot_mult_en;
        	 end 
        else 
        	 dot_mult_en <= 1'b0;
        //end
end



generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : dot_loop
        assign dot_mult_a[i] = i_mdata[8*(i+1)-1 : i*8];
        //assign dot_mult_a1[i] =  i_mdata1[8*(i+1)-1 : i*8];
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
			dot_mult_b[i] <= 8'h0;
			//dot_mult_en <= 1'b0;
        end
        else begin
        	if(dot_en&&i_mdata_vld) begin
        		if(~dot_mult_en)
        			//                      
        			// ltsm_mult_a :  a -> b -> c -> d -> e ...
        			// ltsm_mult_b :  a -> a -> c -> c -> d ...
        			// ltsm_mult_en: 0 -> 1 -> 0 -> 1 -> 0 ...
        			// c_mul_result: 0 ->a*b->a*b->c*d
        			// c_mac_result: 0 -> 0 -> a*b+0-> a*b ->  a*b+c*d
					dot_mult_b[i] <= dot_mult_a[i];
				//dot_mult_en <= ~dot_mult_en;
			end else begin
				dot_mult_b[i] <= 8'h0;
			    //dot_mult_en <= 1'b0;
			end
        end
        end
   end
 endgenerate
  assign first_valid = dot_en ? r_mdata_vld :r_wdata_vld;
    generate
        for (i = 0; i < DATA_COPIES; i = i + 1) begin : mac_loop
        	 assign mult_a[i] = dot_mult_en&& ~i_src_from2buffer ? dot_mult_a[i] : multiplier[i];
        	 //assign mult_a1[i] = dot_mult_a1[i];
        	 assign mult_b[i] = dot_mult_en&& ~i_src_from2buffer ? dot_mult_b[i] : multiplicand[i];
        	// assign mult_b[i] = dot_mult_en ? dot_mult_b[i] : multiplicand[i];
            assign c_mul_result[i] = mult_a[i] * mult_b[i] ;
            assign c_mac_result[i] = dot_en&& ~i_src_from2buffer ? (dot_mult_en ? r_result[i] + c_mul_result[i] : (r_result[i] + 8'b0) ):(r_result[i] + c_mul_result[i]);
            always @(*) begin
              if ((c_mac_result[i][2*DATA_WIDTH-1] ^ r_result[i][2*DATA_WIDTH-1]) && 
                  (r_result[i][2*DATA_WIDTH-1] ^~ c_mul_result[i][2*DATA_WIDTH-1]))
                  post_result[i] = c_mac_result[i][2*DATA_WIDTH-1] ? 
                                   {1'b0, {2*DATA_WIDTH-1{1'b1}}} : // ������?
                                   {1'b1, {2*DATA_WIDTH-1{1'b0}}};  // ����Сֵ
             
                else 
                    post_result[i] = c_mac_result[i];
            end
           
            assign c_result[i] = first_valid ? post_result[i] : r_result[i];
            always @(posedge i_clk or negedge i_rst_n) begin
                if (!i_rst_n)       r_result[i] <= {2*DATA_WIDTH{1'h0}};
                else if (mac_clear) r_result[i] <= {2*DATA_WIDTH{1'h0}};
                else                r_result[i] <= c_result[i];
            end
        end
    endgenerate    
//////////////////////////////////////////////////////////////////////////////////
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_wdata_vld <= 1'b0;
            r_mdata_vld <= 1'b0;
            r_mdata_vld1 <= 1'b0;
        end
        else begin
            r_wdata_vld <= i_wdata_vld;
            r_mdata_vld <= i_mdata_vld;
            r_mdata_vld1 <= i_mdata_vld1;
        end
    end
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_wdata     <= {DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH){1'h0}};
        end
        else if (!i_mac_en && (i_mac_id != 3'h0)) begin
            r_wdata     <= {DATA_COPIES*(DATA_WIDTH+INDEX_WIDTH){1'h0}};
        end
        else if (i_wdata_vld) begin
            r_wdata     <= i_wdata;
        end
    end
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_mdata     <= {DATA_COPIES*DATA_WIDTH{1'h0}};
        end
        else if (!i_mac_en && (i_mac_id != 3'h0)) begin
            r_mdata     <= {DATA_COPIES*DATA_WIDTH{1'h0}};
        end
        else if (i_mdata_vld) begin
            r_mdata     <= i_mdata;
        end
    end
    
     always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_mdata1     <= {DATA_COPIES*DATA_WIDTH{1'h0}};
        end
        else if (!i_mac_en && (i_mac_id != 3'h0)) begin
            r_mdata1     <= {DATA_COPIES*DATA_WIDTH{1'h0}};
        end
        else if (i_mdata_vld1) begin
            r_mdata1     <= i_mdata1;
        end
    end
    assign o_wdata_vld = r_wdata_vld;
    assign o_wdata     = r_wdata;
    assign o_mdata_vld = r_mdata_vld;
    assign o_mdata     = r_mdata;
//////////////////////////////////////////////////////////////////////////////////

reg [19:0]r_mydebug_counter;
always@(posedge i_clk or negedge i_rst_n)begin
    		if(~i_rst_n)
    				r_mydebug_counter <= 20'd0;
    		else if(i_wdata_vld)
    				r_mydebug_counter <= r_mydebug_counter + 20'd1;
    		else
    				r_mydebug_counter <= r_mydebug_counter;
    end
    //////////////////////////////////////////////////////////////////////////////////
//debug 
//synopsys translate_off

integer f_pe0;
initial f_pe0 =  $fopen("pe0_data_mdata_w_mul_acc.txt");

/*generate 
    for(i=0; i < DATA_COPIES; i = i + 1) begin
        always @(posedge i_clk)
         begin
            if(!i_mac_id)
                if(r_wdata_vld) begin 
                     $fdisplay(f_pe0, "cycle : 0");
                     //$fdisplay(f_pe0, "%X %X %X %X ", multiplicand[27],multiplier[27],c_mul_result[27],post_result[27]);
                     $fdisplay(f_pe0, "%X %X %X %X ", multiplicand[DATA_COPIES-1-i],multiplier[DATA_COPIES-1-i],c_mul_result[DATA_COPIES-1-i],post_result[DATA_COPIES-1-i]);
                   //  $fdisplay(f_pe0, "%X %X %X %X ", multiplicand[30],multiplier[30],c_mul_result[30],post_result[30]);
                   //  $fdisplay(f_pe0, "%X %X %X %X ", multiplicand[29],multiplier[29],c_mul_result[29],post_result[29]);
                   //  $fdisplay(f_pe0, "%X %X %X %X ", multiplicand[28],multiplier[28],c_mul_result[28],post_result[28]);
                  //   $fdisplay(f_pe0, "%X %X %X %X ", multiplicand[27],multiplier[27],c_mul_result[27],post_result[27]);
                     end
                        $fflush(f_pe0);
         end
 end
endgenerate*/
 reg [19:0] r_debug_counter;
 always @(posedge i_clk)
         begin
            if(!i_rst_n)
                r_debug_counter <=0;
            else
            //if(i_mac_id==2)
            if(!i_mac_id)
                if(r_wdata_vld) begin 
                     $fdisplay(f_pe0, " cycle : %d %t",r_debug_counter,$time);
                     //$fdisplay(f_pe0, "%X %X %X %X ", multiplicand[27],multiplier[27],c_mul_result[27],post_result[27]);
                     $fdisplay(f_pe0, "%X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X",multiplicand[31],multiplicand[30],multiplicand[29],multiplicand[28],multiplicand[27],multiplicand[26],multiplicand[25],multiplicand[24],multiplicand[23],multiplicand[22],multiplicand[21],multiplicand[20],multiplicand[19],multiplicand[18],multiplicand[17],multiplicand[16],multiplicand[15],multiplicand[14],multiplicand[13],multiplicand[12],multiplicand[11],multiplicand[10],multiplicand[9],multiplicand[8],multiplicand[7],multiplicand[6],multiplicand[5],multiplicand[4],multiplicand[3],multiplicand[2],multiplicand[1],multiplicand[0]);
                     $fdisplay(f_pe0, "%X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X",multiplier[31],multiplier[30],multiplier[29],multiplier[28],multiplier[27],multiplier[26],multiplier[25],multiplier[24],multiplier[23],multiplier[22],multiplier[21],multiplier[20],multiplicand[19],multiplier[18],multiplier[17],multiplier[16],multiplier[15],multiplier[14],multiplier[13],multiplier[12],multiplier[11],multiplier[10],multiplier[9],multiplier[8],multiplier[7],multiplier[6],multiplier[5],multiplier[4],multiplier[3],multiplier[2],multiplier[1],multiplier[0]);
                     $fdisplay(f_pe0, "%X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X",c_mul_result[31],c_mul_result[30],c_mul_result[29],c_mul_result[28],c_mul_result[27],c_mul_result[26],c_mul_result[25],c_mul_result[24],c_mul_result[23],c_mul_result[22],c_mul_result[21],c_mul_result[20],c_mul_result[19],c_mul_result[18],c_mul_result[17],c_mul_result[16],c_mul_result[15],c_mul_result[14],c_mul_result[13],c_mul_result[12],c_mul_result[11],c_mul_result[10],c_mul_result[9],c_mul_result[8],c_mul_result[7],c_mul_result[6],c_mul_result[5],c_mul_result[4],c_mul_result[3],c_mul_result[2],c_mul_result[1],c_mul_result[0]);
                     $fdisplay(f_pe0, "%X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %X %t",post_result[31],post_result[30],post_result[29],post_result[28],post_result[27],post_result[26],post_result[25],post_result[24],post_result[23],post_result[22],post_result[21],post_result[20],post_result[19],post_result[18],post_result[17],post_result[16],post_result[15],post_result[14],post_result[13],post_result[12],post_result[11],post_result[10],post_result[9],post_result[8],post_result[7],post_result[6],post_result[5],post_result[4],post_result[3],post_result[2],post_result[1],post_result[0],$time);
                     r_debug_counter <= r_debug_counter +1;
                     end
                        $fflush(f_pe0);
         end
//synopsys translate_on
endmodule
`default_nettype wire
