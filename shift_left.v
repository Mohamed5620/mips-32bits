`timescale 1ns / 1ps

// shift left by 2
module shift_left(
input [31:0] data_in,
output [31:0] data_out
);
assign data_out[31:0]=data_in[31:0]<<2;

endmodule
