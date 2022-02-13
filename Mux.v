`timescale 1ns / 1ps

// 32 bit Mux

module Mux_32(
input [31:0] in0,
input [31:0] in1,
input sel,
output [31:0] mux_out
    );
assign mux_out=(sel)? in1:in0;

endmodule

// 5 bit Mux

module Mux_5(
input [4:0] in0,
input [4:0] in1,
input sel,
output [4:0] mux_out
    );
assign mux_out=(sel)? in1:in0;

endmodule
