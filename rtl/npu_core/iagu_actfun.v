module iagu_actfun(
       i_clk  ,
       i_rst_n,
       i_addr_start_d,
	     i_i_piece_num,
	     i_AGUStart            ,
	     
	     o_IOB_REn         ,
       //o_rsel,
       o_IOB_RAddr,
       o_PE_ACTFUN_out
	   );
	   
    input i_clk  ;
    input i_rst_n;
    input [11:0] i_addr_start_d;
	  input [7:0] i_i_piece_num;
	  input i_AGUStart         ;  
	  output o_IOB_REn         ;
    //output o_rsel            ;
    output [11:0] o_IOB_RAddr     ;
    output        o_PE_ACTFUN_out   ; 
    
   // reg r_IOB_REn ;
   // reg r_rsel    ;  
    reg [11:0] r_IOB_RAddr      ;
    reg r_PE_ACTFUN_out  ;
    reg [7:0] r_input_piece; 
    reg r_AdderEn;
    reg r_WorkEn;
    
    wire c_AdderEnd; 
    
    assign c_AdderEnd = (r_input_piece + 8'd1 == i_i_piece_num);
    
    always @(posedge i_clk or negedge i_rst_n)
    begin
    	if(!i_rst_n)
    	begin
    		r_input_piece <= 8'b0;
    	end else if(i_AGUStart)
    	begin
    		r_input_piece <= 8'b0; 
    	end else if(r_AdderEn)
    	begin 
    		r_input_piece <= r_input_piece + 12'b1;
    	end else begin
    		r_input_piece <= r_input_piece;
    	end
    	
    end
    
     always @(posedge i_clk or negedge i_rst_n)
    begin
    	if(!i_rst_n)
    	begin
    		r_IOB_RAddr <= 12'b0;
    	end else if(i_AGUStart)
    	begin
    		r_IOB_RAddr <= i_addr_start_d; 
    	end else if(r_AdderEn)
    	begin 
    		r_IOB_RAddr <= r_IOB_RAddr + 12'b1;
    	end else begin
    		r_IOB_RAddr <= r_IOB_RAddr;
    	end
    	
    end
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            r_AdderEn <= 1'd0;
            //first_group <= 1'b0
        else if (i_AGUStart )
            r_AdderEn <= 1'd1;
        else if (c_AdderEnd)
            r_AdderEn <= 1'd0;
        else
            r_AdderEn <= r_AdderEn;
    end
    
    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) r_WorkEn <= 1'd0;
        else         r_WorkEn <= r_AdderEn & ~c_AdderEnd;
    end
    
    assign o_IOB_RAddr = r_IOB_RAddr ;
    assign o_IOB_REn   = r_AdderEn ; 
    
endmodule