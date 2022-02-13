`timescale 1ns / 1ps


module mips_singlecycle(
input clk,
input reset,
output [31:0] alu_result
);

// pc signals
wire [31:0] pc_in, pc_out, pc4, pc_br , pc_br2;
//imem signals
wire [31:0] instruction;  
// reg_file signals
wire [4:0] wr_addr;
wire [31:0] rd_data1, rd_data2, wr_data;
// dmem signals
wire [31:0] addr, rd_data;
// control signals
wire reg_dst, reg_wr, Alus, mem_wr, mem_rd, mem2reg, pcs;
wire [2:0] Aluop;
// Alu signals
wire [31:0] in2;
wire zero;
// sign_extended
wire [31:0] sign_extended;
program_counter p_counter(.clk(clk),.reset(reset),.pc_in(pc_in),.pc_out(pc_out));
assign pc4=pc_out+32'b100;
ins_mem ins_memory(.pc(pc_out),.instruction(instruction),.reset(reset));
control_unit cu(.reset(reset),.opcode(instruction[31:26]),.func(instruction[5:0]),.reg_dst(reg_dst),
.reg_wr(reg_wr),.Alus(Alus),.Aluop(Aluop),.mem_wr(mem_wr),.mem_rd(mem_rd),.mem2reg(mem2reg),.pcs(pcs));
Mux_5 mux1(.in0(instruction[20:16]),.in1(instruction[15:11]),.sel(reg_dst),.mux_out(wr_addr));
reg_file reg_f(.clk(clk),.reset(reset),.write_en(reg_wr),.rd_addr1(instruction[25:21]),.rd_addr2(instruction[20:16]),
.wr_addr(wr_addr),.wr_data(wr_data),.rd_data1(rd_data1),.rd_data2(rd_data2));
sign_extend sg(.data_in(instruction[15:0]),.data_out(sign_extended));
Mux_32 mux2(.in0(rd_data2),.in1(sign_extended),.sel(Alus),.mux_out(in2));
Alu alu(.in1(rd_data1),.in2(in2),.out(alu_result),.zero(zero),.aluop(Aluop));
shift_left sh(.data_in(sign_extended),.data_out(pc_br));
ALU_add_only add(.in1(pc4),.in2(pc_br),.out(pc_br2));
data_mem d_memory(.addr(alu_result),.clk(clk),.reset(reset),.rd_en(mem_rd),.wr_en(mem_wr),
.wr_data(rd_data2),.rd_data(rd_data));
Mux_32 mux3(.in0(alu_result),.in1(rd_data),.sel(mem2reg),.mux_out(wr_data));
Mux_32 mux4(.in0(pc4),.in1(pc_br2),.sel(pcs),.mux_out(pc_in));



endmodule 

		

