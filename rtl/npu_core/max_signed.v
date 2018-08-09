module max_signed(ain,bin,max_out);

parameter Data_Width = 8;  
parameter Index_Width=16;


  input [Index_Width + Data_Width - 1 : 0] ain;
  input [Index_Width + Data_Width - 1 : 0] bin; 
  output[Index_Width + Data_Width - 1 : 0] max_out;
    
  wire signed [Data_Width-1 : 0] ain_data;
  wire signed [Data_Width-1 : 0] bin_data;  
  
  assign ain_data =  ain[Data_Width-1:0] ;
  assign bin_data =  bin[Data_Width-1:0] ;

  assign  max_out  = ((ain_data > bin_data)|| (ain_data == bin_data)) ? ain : bin;
  
endmodule