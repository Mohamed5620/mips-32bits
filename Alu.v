`timescale 1ns / 1ps
// main Alu

module Alu(
input [31:0] in1,
input [31:0] in2,
output reg [31:0] out,
output reg zero,
input [2:0] aluop
    );
always@(*)
begin
     case(aluop)
	  3'b010:begin
	         out<=in1+in2;
				zero<=0;
				end
	  3'b110:begin
	         out<=in1-in2;
				zero<=~|out;
				end
	  3'b000:begin
	         out<=in1&in2;
				zero<=0;
				end
	  3'b001:begin
            out<=in1|in2;
				zero<=0;
				end
	  3'b111:begin
	         if(in1<in2)
				out<=1;
				else
				out<=0;
				zero<=0;
				end
		endcase
end
endmodule

// add only

module ALU_add_only (
input [31:0] in1,
input [31:0]in2,
output [31:0] out
);
assign out=in1+in2;
endmodule
