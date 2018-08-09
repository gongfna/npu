//------------------------------------------------------------------------
//--
//--                  (C) COPYRIGHT 2001-2011 SYNOPSYS, INC.
//--                            ALL RIGHTS RESERVED
//--
//--  This software and the associated documentation are confidential and
//--  proprietary to Synopsys, Inc.  Your use or disclosure of this
//--  software is subject to the terms and conditions of a written
//--  license agreement between you, or your company, and Synopsys, Inc.
//--
//--  The entire notice above must be reproduced on all authorized copies.

// -------------------------------------------------
//
// -------------------------------------------------
task automatic axi_master_block_stream;
   input [31:0] masterID;
   input [31:0] streamID;
   input [31:0] timeout;
   inout [31:0] cmd_status;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].block_stream(streamID, timeout, cmd_status);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].block_stream(streamID, timeout, cmd_status);
`endif
     default : axi_master[1].block_stream(streamID, timeout, cmd_status);
   endcase
end
endtask

task automatic axi_master_disable_msg_id;
   input [31:0] masterID;
   input [31:0] stream;
   input [31:0] msg_id;
   input [31:0] msg_logID;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].disable_msg_id(stream, msg_id, msg_logID);
`endif
     default : axi_master[1].disable_msg_id(stream, msg_id, msg_logID);
   endcase
end
endtask

task automatic axi_master_set_buffer_data_pattern;
   input [31:0] masterID;
   input [31:0] buf_handle;
   input [31:0] pattern;
   input [1023:0] value;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].set_buffer_data_pattern(buf_handle, pattern, value);
`endif
     default : axi_master[1].set_buffer_data_pattern(buf_handle, pattern, value);
   endcase
end
endtask

task automatic axi_master_set_config_param;
   input [31:0] masterID;
   input [31:0] streamID;
   input [31:0] param;
   input [31:0] value;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].set_config_param(streamID, param, value);
`endif
     default : axi_master[1].set_config_param(streamID, param, value);
   endcase
end
endtask

task automatic axi_master_get_config_param;
   input [31:0] masterID;
   input [31:0] streamID;
   input [31:0] param;
   inout [31:0] value;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].get_config_param(streamID, param, value);
`endif
     default : axi_master[1].get_config_param(streamID, param, value);
   endcase
end
endtask

task automatic axi_master_start;
   input [31:0] masterID;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].start;
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].start;
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].start;
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].start;
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].start;
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].start;
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].start;
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].start;
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].start;
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].start;
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].start;
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].start;
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].start;
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].start;
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].start;
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].start;
`endif
     default : axi_master[1].start;
   endcase
end
endtask

task automatic axi_master_reset_model;
   input [31:0] masterID;
   input [31:0] rst_type;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].reset_model(rst_type);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].reset_model(rst_type);
`endif
     default : axi_master[1].reset_model(rst_type);
   endcase
end
endtask

task automatic axi_master_new_buffer;
   input [31:0] masterID;
   inout [31:0] buffer_handle;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].new_buffer(buffer_handle);
`endif
     default : axi_master[1].new_buffer(buffer_handle);
   endcase
end
endtask

task automatic axi_master_delete_buffer;
   input [31:0] masterID;
   inout [31:0] buffer_handle;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].delete_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].delete_buffer(buffer_handle);
`endif
     default : axi_master[1].delete_buffer(buffer_handle);
   endcase
end
endtask

task automatic axi_master_copy_buffer;
   input [31:0] masterID;
   input [31:0] orig_buffer_handle;
   inout [31:0] new_buffer_handle;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
     default : axi_master[1].copy_buffer(orig_buffer_handle, new_buffer_handle);
   endcase
end
endtask

task automatic axi_master_set_buffer_attr_bitvec;
   input [31:0] masterID;
   input [31:0] buffer_handle;
   input [31:0] attr_id;
   input [31:0] position;
   input [1023:0] value;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
     default : axi_master[1].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
   endcase
end
endtask

task automatic axi_master_get_buffer_attr_bitvec;
   input [31:0] masterID;
   input [31:0] buffer_handle;
   input [31:0] attr_id;
   input [31:0] position;
   inout [1023:0] value;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
     default : axi_master[1].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
   endcase
end
endtask

task automatic axi_master_set_buffer_attr_int;
   input [31:0] masterID;
   input [31:0] buffer_handle;
   input [31:0] attr_id;
   input [31:0] position;
   input [31:0] value;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
     default : axi_master[1].set_buffer_attr_int(buffer_handle, attr_id, position, value);
   endcase
end
endtask

task automatic axi_master_get_result;
   input [31:0] masterID;
   input [31:0] streamID;
   input [31:0] cmd_handle;
   inout [31:0] buf_handle;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].get_result(streamID, cmd_handle, buf_handle);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].get_result(streamID, cmd_handle, buf_handle);
`endif
     default : axi_master[1].get_result(streamID, cmd_handle, buf_handle);
   endcase
end
endtask

task automatic axi_master_get_buffer_attr_int;
   input [31:0] masterID;
   input [31:0] buffer_handle;
   input [31:0] attr_id;
   input [31:0] position;
   inout [31:0] value;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].get_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
     default : axi_master[1].get_buffer_attr_int(buffer_handle, attr_id, position, value);
   endcase
end
endtask

task automatic axi_master_send_xact;
   input [31:0] masterID;
   input [31:0] streamID;
   input [31:0] xact_buffer;
   inout [31:0] cmd_handle;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].send_xact(streamID, xact_buffer, cmd_handle);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].send_xact(streamID, xact_buffer, cmd_handle);
`endif
     default : axi_master[1].send_xact(streamID, xact_buffer, cmd_handle);
   endcase
end
endtask

task automatic axi_master_create_watchpoint;
   input [31:0] masterID;
   input [31:0] wp_type;
   input [31:0] id;
   inout [31:0] handle;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].create_watchpoint(wp_type, id, handle);
`endif
     default : axi_master[1].create_watchpoint(wp_type, id, handle);
   endcase
end
endtask

task automatic axi_master_destroy_watchpoint;
   input [31:0] masterID;
   input [31:0] id;
   input [31:0] handle;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].destroy_watchpoint(id, handle);
`endif
     default : axi_master[1].destroy_watchpoint(id, handle);
   endcase
end
endtask

task automatic axi_master_watch_for;
   input [31:0] masterID;
   input [31:0] wp_handle;
   inout [31:0] handle;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].watch_for(wp_handle, handle);
`endif
     default : axi_master[1].watch_for(wp_handle, handle);
   endcase
end
endtask

task automatic axi_master_get_watchpoint_data_int;
   input [31:0] masterID;
   input [31:0] handle;
   input [31:0] position;
   inout [31:0] value;
   inout [31:0] status;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].get_watchpoint_data_int(handle, position, value, status );
`endif
     default : axi_master[1].get_watchpoint_data_int(handle, position, value, status );
   endcase
end
endtask

task automatic axi_master_set_watchpoint_trigger;
   input [31:0] masterID;
   input [31:0] id;
   input [31:0] handle;
   input [31:0] profile;
   input [31:0] value;
begin
#0;
   case (masterID)
`ifdef AXI_HAS_M1
     1 : axi_master[1].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M2
     2 : axi_master[2].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M3
     3 : axi_master[3].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M4
     4 : axi_master[4].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M5
     5 : axi_master[5].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M6
     6 : axi_master[6].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M7
     7 : axi_master[7].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M8
     8 : axi_master[8].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M9
     9 : axi_master[9].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M10
     10 : axi_master[10].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M11
     11 : axi_master[11].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M12
     12 : axi_master[12].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M13
     13 : axi_master[13].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M14
     14 : axi_master[14].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M15
     15 : axi_master[15].set_watchpoint_trigger(id, handle, profile, value );
`endif
`ifdef AXI_HAS_M16
     16 : axi_master[16].set_watchpoint_trigger(id, handle, profile, value );
`endif
     default : axi_master[1].set_watchpoint_trigger(id, handle, profile, value );
   endcase
end
endtask

task automatic axi_slave_set_config_param;
   input [31:0] slaveID;
   input [31:0] streamID;
   input [31:0] param;
   input [31:0] value;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].set_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].set_config_param(streamID, param, value);
`endif
     default : axi_slave[1].set_config_param(streamID, param, value);
   endcase
end
endtask

task automatic axi_slave_disable_msg_id;
   input [31:0] slaveID;
   input [31:0] stream;
   input [31:0] msg_id;
   input [31:0] msg_logID;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].disable_msg_id(stream, msg_id, msg_logID);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].disable_msg_id(stream, msg_id, msg_logID);
`endif
     default : axi_slave[1].disable_msg_id(stream, msg_id, msg_logID);
   endcase
end
endtask

task automatic axi_slave_get_config_param;
   input [31:0] slaveID;
   input [31:0] streamID;
   input [31:0] param;
   inout [31:0] value;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].get_config_param(streamID, param, value);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].get_config_param(streamID, param, value);
`endif
     default : axi_slave[1].get_config_param(streamID, param, value);
   endcase
end
endtask

task automatic axi_slave_new_buffer;
   input [31:0] slaveID;
   inout [31:0] buffer_handle;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].new_buffer(buffer_handle);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].new_buffer(buffer_handle);
`endif
     default : axi_slave[1].new_buffer(buffer_handle);
   endcase
end
endtask

task automatic axi_slave_set_buffer_attr_bitvec;
   input [31:0]   slaveID;
   input [31:0]   buffer_handle;
   input [31:0]   attr_id;
   input [31:0]   position;
   input [1023:0] value;
begin
#0;
   case(slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
     default : axi_slave[1].set_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
   endcase
end
endtask

task automatic axi_slave_set_buffer_attr_int;
   input [31:0] slaveID;
   input [31:0] buffer_handle;
   input [31:0] attr_id;
   input [31:0] position;
   input [31:0] value;
begin
#0;
   case(slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].set_buffer_attr_int(buffer_handle, attr_id, position, value);
`endif
     default : axi_slave[1].set_buffer_attr_int(buffer_handle, attr_id, position, value);
   endcase
end
endtask

task automatic axi_slave_set_buffer_attr_enable;
   input [31:0] slaveID;
   input [31:0] buffer_handle;
   input [31:0] attr_id;
   input [31:0] enable;
begin
#0;
   case(slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].set_buffer_attr_enable(buffer_handle, attr_id, enable);
`endif
     default : axi_slave[1].set_buffer_attr_enable(buffer_handle, attr_id, enable);
   endcase
end
endtask

task automatic axi_slave_add_to_match_list;
   input [31:0] slaveID;
   input [31:0] buffer_handle;
   input [31:0] index;
begin
#0;
   case(slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].add_to_match_list(buffer_handle, index);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].add_to_match_list(buffer_handle, index);
`endif
     default : axi_slave[1].add_to_match_list(buffer_handle, index);
   endcase
end
endtask

task automatic axi_slave_start;
   input [31:0] slaveID;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].start;
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].start;
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].start;
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].start;
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].start;
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].start;
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].start;
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].start;
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].start;
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].start;
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].start;
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].start;
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].start;
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].start;
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].start;
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].start;
`endif
     default : axi_slave[1].start;
   endcase
end
endtask

task automatic axi_slave_fill_mem;
   input [31:0] slaveID;
   input [31:0] streamID;
   input [63:0] start_addr;
   input [31:0] width;
   input [31:0] pattern;
   input [1023:0] initial_value;
   input [31:0] num_words;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
`endif
     default : axi_slave[1].fill_mem(streamID, start_addr, width, pattern, initial_value, num_words);
   endcase
end
endtask

task automatic axi_slave_copy_buffer;
   input [31:0] slaveID;
   input [31:0] orig_buffer_handle;
   inout [31:0] new_buffer_handle;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].copy_buffer(orig_buffer_handle, new_buffer_handle);
`endif
     default : axi_slave[1].copy_buffer(orig_buffer_handle, new_buffer_handle);
   endcase
end
endtask

task automatic axi_slave_remove_from_match_list;
   input [31:0] slaveID;
   inout [31:0] index;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].remove_from_match_list(index);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].remove_from_match_list(index);
`endif
     default : axi_slave[1].remove_from_match_list(index);
   endcase
end
endtask

task automatic axi_slave_create_watchpoint;
   input [31:0] slaveID;
   input [31:0] wp_type;
   input [31:0] id;
   inout [31:0] handle;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].create_watchpoint(wp_type, id, handle);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].create_watchpoint(wp_type, id, handle);
`endif
     default : axi_slave[1].create_watchpoint(wp_type, id, handle);
   endcase
end
endtask

task automatic axi_slave_destroy_watchpoint;
   input [31:0] slaveID;
   input [31:0] id;
   input [31:0] handle;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].destroy_watchpoint(id, handle);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].destroy_watchpoint(id, handle);
`endif
     default : axi_slave[1].destroy_watchpoint(id, handle);
   endcase
end
endtask

task automatic axi_slave_watch_for;
   input [31:0] slaveID;
   input [31:0] wp_handle;
   inout [31:0] handle;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].watch_for(wp_handle, handle);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].watch_for(wp_handle, handle);
`endif
     default : axi_slave[1].watch_for(wp_handle, handle);
   endcase
end
endtask

task automatic axi_slave_get_watchpoint_data_int;
   input [31:0] slaveID;
   input [31:0] handle;
   input [31:0] position;
   inout [31:0] value;
   inout [31:0] status;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].get_watchpoint_data_int(handle, position, value, status );
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].get_watchpoint_data_int(handle, position, value, status );
`endif
     default : axi_slave[1].get_watchpoint_data_int(handle, position, value, status );
   endcase
end
endtask

task automatic axi_slave_get_buffer_attr_bitvec;
   input [31:0] slaveID;
   input [31:0] buffer_handle;
   input [31:0] attr_id;
   input [31:0] position;
   inout [1023:0] value;
begin
#0;
   case (slaveID)
`ifdef AXI_HAS_S1
     1 : axi_slave[1].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S2
     2 : axi_slave[2].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S3
     3 : axi_slave[3].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S4
     4 : axi_slave[4].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S5
     5 : axi_slave[5].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S6
     6 : axi_slave[6].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S7
     7 : axi_slave[7].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S8
     8 : axi_slave[8].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S9
     9 : axi_slave[9].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S10
     10 : axi_slave[10].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S11
     11 : axi_slave[11].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S12
     12 : axi_slave[12].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S13
     13 : axi_slave[13].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S14
     14 : axi_slave[14].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S15
     15 : axi_slave[15].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
`ifdef AXI_HAS_S16
     16 : axi_slave[16].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
`endif
     default : axi_slave[1].get_buffer_attr_bitvec(buffer_handle, attr_id, position, value);
   endcase
end
endtask

