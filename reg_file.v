`timescale 1ns / 1ps

// register file

module reg_file(
input clk,
input reset,
input write_en,
input [4:0] rd_addr1,
input [4:0] rd_addr2,
input [4:0] wr_addr,
input [31:0] wr_data,
output [31:0] rd_data1,
output [31:0] rd_data2
);

reg [31:0] File [31:0];
integer k;
assign rd_data1=File[rd_addr1];
assign rd_data2=File[rd_addr2];
always @ (posedge clk)
begin 
     if (reset)
	  begin
	       for(k=0;k<32;k=k+1)
			 File[k]=32'b0;
	   end
	  else if(write_en)
	  File[wr_addr]=wr_data;
end
endmodule

