`timescale 1ns / 1ps

// instruction memory

module ins_mem (
input [31:0] pc,
output [31:0] instruction,
input reset
 );
reg [31:0] imem [31:0];
wire [4:0] read_addr;
integer i;
assign read_addr=pc[6:2];
assign instruction = imem[read_addr];
initial 
begin
     
      imem[0]= 32'b00000010001100101000000000100000; //add s0,s1,s2
      imem[1]= 32'b00000010001100101000000000100001; //sub s0,s1,s2
      imem[2]= 32'b00000010001100101000000000100010; //and s0,s1,s2
      imem[3]= 32'b00000010001100101000000000100011; //or s0,s1,s2
      imem[4]= 32'b00000010001100101000000000100100; //slt s0,s1,s2
      imem[5]= 32'b10001100000100000000000000000100; //ld s0,4(0)
      imem[6]= 32'b10101100000100000000000000000100; //st s0,4(0)
      imem[7]= 32'b00010000001000000000000000000011; //br at,0,3
end
always @(posedge reset)
begin
     for(i=8;i<32;i=i+1)
     imem[i]=32'b0;
end
 
endmodule
