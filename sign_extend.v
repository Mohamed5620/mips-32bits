`timescale 1ns / 1ps

// sign extend from 16 bits up to 32 bits

module sign_extend(
input [15:0] data_in,
output [31:0] data_out
);
assign data_out[15:0]=data_in[15:0];
assign data_out[31:16]=(data_in[15])?16'b1111111111111111:16'b0;

endmodule
