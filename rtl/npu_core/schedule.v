module shcedule( 

		input  i_clk             ,
		input  i_rst_n           ,
		input  i_start           ,
		input  i_stop            ,
		input  i_inst_valid      ,
		input  i_dma_finish      ,
		input  i_calculate_end   ,
		input  [4:0] i_opcode    ,
		input  [11:0] i_jump_pc  ,
		input  i_wait_last_noblock_dma   ,
		input  i_be_noblock       ,
		input  i_err_inst        ,
		output [11:0] o_pc       ,
		output o_inst_buffer_en  ,
		output o_calculate_enable,
		output o_npu_idle,
		output o_internal_stop,
		output o_ex_dma
);

parameter ST_FETCH_INST = 4'b0001;
parameter ST_EXECUTE_INST = 4'b0011;
parameter ST_WAIT_EXECUTE = 4'b0101;
parameter ST_DMA_WAIT_FETCH = 4'b0010;
parameter ST_NPU_WAIT_FETCH = 4'b1010;
parameter ST_STOP_NPU = 4'b0110;
parameter ST_WAIT_LAST_DMA_FINISH = 4'b1001;
parameter ST_WAIT_LAST_NPU_FINISH = 4'b1011;
parameter ST_NPU_IDLE = 4'b0000;

parameter L_IOB2N=5'b01010;     parameter L_WB2N=5'b01011;
parameter S_N2IOB=5'b01101;
parameter PDMA=5'b10010;
parameter JUMP=5'b11100;
parameter SOFTMAX = 5'b00110;
parameter STOP = 5'b11111;
parameter DOT = 5'b10011;
parameter DOTACC = 5'b10110;
parameter ACTFUN = 5'b10111;



wire  c_inst_exec ;
wire  c_wait_last_noblock_dma;

wire  [11:0] c_pc;
reg   [11:0] r_next_pc;
wire c_jump_pc_en;
wire c_calculate_enable;
wire c_ex_dma;
reg  r_sync_noblock_dma;
reg  r_calculate_enable;
reg  r_fetch_en;
reg  r_ex_dma;
reg  [4:0] r_WorkState;
reg  [4:0] r_WorkState_next;
wire  be_noblock;
wire  clr_decoder;

assign be_noblock = (i_opcode == PDMA)  && i_be_noblock;
//assign clr_decoder = o_calculate_enable || o_ex_dma;

always @(posedge i_clk or negedge i_rst_n)
begin
	if(!i_rst_n)
		r_sync_noblock_dma <= 1'b0;
	
	else  if(i_dma_finish)
		r_sync_noblock_dma <= 1'b0;
	else if(i_inst_valid && be_noblock)	
		r_sync_noblock_dma <= 1'b1;
	else r_sync_noblock_dma <= r_sync_noblock_dma;
   
	
end


assign c_inst_exec = (i_opcode == S_N2IOB) | (i_opcode == PDMA)| (i_opcode == SOFTMAX) | (i_opcode == DOT)| (i_opcode == DOTACC) | (i_opcode == ACTFUN);
assign o_internal_stop = (i_opcode == STOP);
assign c_wait_last_noblock_dma = i_wait_last_noblock_dma  | (i_opcode == PDMA);
assign c_jump_pc_en = (i_opcode == JUMP);
assign  o_pc = r_next_pc;
assign c_calculate_enable = (r_WorkState == ST_EXECUTE_INST) && ((i_opcode == S_N2IOB) | (i_opcode == SOFTMAX) | (i_opcode == DOT)| (i_opcode == DOTACC) | (i_opcode == ACTFUN));
assign c_ex_dma = ((r_WorkState == ST_EXECUTE_INST) && (i_opcode == PDMA));
assign o_npu_idle = (r_WorkState == ST_NPU_IDLE);
//assign c_fetch_en = (r_WorkState == ST_FETCH_INST);
assign o_inst_buffer_en = r_fetch_en;

always @(posedge i_clk or negedge i_rst_n)
begin
	if(!i_rst_n)begin
		r_next_pc <= 12'b0;
	end	else if(i_start)begin
		r_next_pc <= 12'b0;
	end else if(i_inst_valid)
		if(c_jump_pc_en)
			r_next_pc <= i_jump_pc;
		else 
			r_next_pc <= o_pc + 12'b1;
	else r_next_pc <= r_next_pc;
end

always @(posedge i_clk or  negedge i_rst_n)
begin
	if(!i_rst_n)
		r_fetch_en <= 1'b0;
	else if((r_WorkState != r_WorkState_next)&&(r_WorkState_next == ST_FETCH_INST ) ||(i_inst_valid && !c_inst_exec)&&(r_WorkState == ST_FETCH_INST ))
		r_fetch_en <= 1'b1;
	else 
		r_fetch_en <= 1'b0;
end

always @(posedge i_clk or  negedge i_rst_n)
begin
	if(!i_rst_n) begin
		r_ex_dma <= 1'b0;
		r_calculate_enable <= 1'b0;
	end else begin
		r_ex_dma <= c_ex_dma;
		r_calculate_enable <= c_calculate_enable;
	end
	
end



always@(posedge i_clk or negedge i_rst_n)begin
		if(!i_rst_n)
				r_WorkState <= ST_NPU_IDLE;
		else 
				r_WorkState <= r_WorkState_next;
end

always@(*)begin
		case(r_WorkState)
			ST_NPU_IDLE:
				if(i_start)
							r_WorkState_next=ST_FETCH_INST;
				else
							r_WorkState_next=ST_NPU_IDLE;
			ST_FETCH_INST:
					if(i_inst_valid && c_inst_exec)//
						if(i_inst_valid && c_wait_last_noblock_dma)
							if(r_sync_noblock_dma)
								r_WorkState_next=ST_WAIT_EXECUTE;
							else 
								 r_WorkState_next=ST_EXECUTE_INST;
						else
							r_WorkState_next=ST_EXECUTE_INST;
					else	if((i_inst_valid && (o_internal_stop || i_err_inst)) || i_stop )
						  r_WorkState_next=ST_STOP_NPU;
					else 
						  r_WorkState_next=ST_FETCH_INST;
				
			ST_WAIT_EXECUTE:
					if(!r_sync_noblock_dma)
							r_WorkState_next=ST_EXECUTE_INST;
					else if(i_stop)
							r_WorkState_next=ST_STOP_NPU;
					else
							r_WorkState_next=ST_WAIT_EXECUTE;
			ST_EXECUTE_INST:
						if(i_stop)
							r_WorkState_next=ST_STOP_NPU;
					else	if(i_opcode == PDMA) 	
							if(i_be_noblock)	
							r_WorkState_next=ST_FETCH_INST;	
							else					
							r_WorkState_next=ST_DMA_WAIT_FETCH;
					else if (!i_calculate_end)
					       r_WorkState_next=ST_NPU_WAIT_FETCH;
					else 
							r_WorkState_next=ST_EXECUTE_INST;
			ST_DMA_WAIT_FETCH:
					if(i_dma_finish)
							r_WorkState_next=ST_FETCH_INST;
					else	if(i_stop) 								
							r_WorkState_next=ST_WAIT_LAST_DMA_FINISH;
					else 
							r_WorkState_next=ST_DMA_WAIT_FETCH;
			ST_NPU_WAIT_FETCH:
					if(i_calculate_end )
							r_WorkState_next=ST_FETCH_INST;
					else	if(i_stop) 								
							r_WorkState_next=ST_WAIT_LAST_NPU_FINISH;
					else 
							r_WorkState_next=ST_NPU_WAIT_FETCH;
			ST_WAIT_LAST_NPU_FINISH:
					if(i_calculate_end )
							r_WorkState_next=ST_STOP_NPU;
					else									
							r_WorkState_next=ST_WAIT_LAST_NPU_FINISH;
			ST_WAIT_LAST_DMA_FINISH:
					if(i_dma_finish)
							r_WorkState_next=ST_STOP_NPU;
					else									
							r_WorkState_next=ST_WAIT_LAST_DMA_FINISH;
					
			ST_STOP_NPU:
				if(r_sync_noblock_dma)
						r_WorkState_next=ST_STOP_NPU;
				else
						r_WorkState_next=ST_NPU_IDLE;
			        
		default:
				r_WorkState_next = ST_NPU_IDLE;
		endcase
end
	 	
assign  o_calculate_enable = r_calculate_enable;
assign  o_ex_dma = r_ex_dma;
endmodule
