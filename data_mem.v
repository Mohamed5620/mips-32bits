`timescale 1ns / 1ps

// data memory

module data_mem(
input [31:0] addr,
input clk,
input reset,
input rd_en,
input wr_en,
input [31:0] wr_data,
output [31:0] rd_data
);
reg [31:0] dmem [31:0];
wire [4:0] real_addr;
integer k;
assign real_addr=addr[6:2];
assign rd_data=(rd_en)? dmem[real_addr]:32'bx;
always @ (posedge clk)
begin
     if(reset)
	  begin
	       for(k=0;k<32;k=k+1)
			 dmem[k]=32'b0;
		end
	  else if(wr_en)
	  dmem[real_addr]=wr_data;
end
endmodule
