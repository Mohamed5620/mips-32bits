`timescale 1ns / 1ps

// control unit

module control_unit(
input reset,
input [5:0] opcode,
input [5:0] func,
output reg reg_dst,
output reg reg_wr,
output reg Alus,
output reg [2:0] Aluop,
output reg mem_wr,
output reg mem_rd,
output reg mem2reg,
output reg pcs
);
always @(*)
begin
     if(reset)
	  begin
	  reg_dst=1'b0;
     reg_wr=1'b0;
     Alus=1'b0;
     Aluop=3'b000;
     mem_wr=1'b0;
     mem_rd=1'b0;
     mem2reg=1'b0;
     pcs=1'b0;
	  end
	  else
	  begin
	       case(opcode)
			 6'b000000:begin
			           case(func)
						  6'b100000:begin
						  reg_dst=1'b1;
                    reg_wr=1'b1;
                    Alus=1'b0;
                    Aluop=3'b010;
                    mem_wr=1'b0;
                    mem_rd=1'b0;
                    mem2reg=1'b0;
                    pcs=1'b0;
						  end
						  6'b100001:begin
						  reg_dst=1'b1;
                    reg_wr=1'b1;
                    Alus=1'b0;
                    Aluop=3'b110;
                    mem_wr=1'b0;
                    mem_rd=1'b0;
                    mem2reg=1'b0;
                    pcs=1'b0;
						  end
						  6'b100010:begin
						  reg_dst=1'b1;
                    reg_wr=1'b1;
                    Alus=1'b0;
                    Aluop=3'b000;
                    mem_wr=1'b0;
                    mem_rd=1'b0;
                    mem2reg=1'b0;
                    pcs=1'b0;
						  end
						  6'b100011:begin
						  reg_dst=1'b1;
                    reg_wr=1'b1;
                    Alus=1'b0;
                    Aluop=3'b001;
                    mem_wr=1'b0;
                    mem_rd=1'b0;
                    mem2reg=1'b0;
                    pcs=1'b0;
						  end
						  6'b100100:begin
						  reg_dst=1'b1;
                    reg_wr=1'b1;
                    Alus=1'b0;
                    Aluop=3'b111;
                    mem_wr=1'b0;
                    mem_rd=1'b0;
                    mem2reg=1'b0;
                    pcs=1'b0;
						  end
						  default:begin
						  reg_dst=1'b0;
                    reg_wr=1'b0;
                    Alus=1'b0;
                    Aluop=3'b000;
                    mem_wr=1'b0;
                    mem_rd=1'b0;
                    mem2reg=1'b0;
                    pcs=1'b0;
						  end
						  endcase
						  end
			6'b100011:begin
						 reg_dst=1'b0;
                   reg_wr=1'b1;
                   Alus=1'b1;
                   Aluop=3'b010;
                   mem_wr=1'b0;
                   mem_rd=1'b1;
                   mem2reg=1'b1;
                   pcs=1'b0;
						 end
			6'b101011:begin
			          reg_dst=1'bx;
                   reg_wr=1'b0;
                   Alus=1'b1;
                   Aluop=3'b010;
                   mem_wr=1'b1;
                   mem_rd=1'b0;
                   mem2reg=1'bx;
                   pcs=1'b0;
						 end
			6'b000100:begin
			          reg_dst=1'bx;
                   reg_wr=1'b0;
                   Alus=1'b0;
                   Aluop=3'b110;
                   mem_wr=1'b0;
                   mem_rd=1'b0;
                   mem2reg=1'bx;
                   pcs=1'b1;
						 end
			default:begin
	              reg_dst=1'b0;
                 reg_wr=1'b0;
                 Alus=1'b0;
                 Aluop=3'b000;
                 mem_wr=1'b0;
                 mem_rd=1'b0;
                 mem2reg=1'b0;
                 pcs=1'b0;
	              end
	       endcase
		end
end
endmodule 