`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 12:19:43 AM
// Design Name: 
// Module Name: ID
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ID(input clk,
input [31:0] PC_ID,INSTRUCTION_ID,
input RegWrite_WB,
input [31:0] ALU_DATA_WB,
input [4:0] RD_WB,
output [31:0] IMM_ID,
output [31:0] REG_DATA1_ID,REG_DATA2_ID,
output [2:0] FUNCT3_ID,
output [6:0] FUNCT7_ID,
output [6:0] OPCODE_ID,
output [4:0] RD_ID,
output [4:0] RS1_ID,
output [4:0] RS2_ID
);

//19:15 rs1  registrii in fisierul lor in risk spks
//24:20 rs2
registers regg(clk,RegWrite_WB,INSTRUCTION_ID[19:15],INSTRUCTION_ID[24:20],RD_WB,ALU_DATA_WB,REG_DATA1_ID,REG_DATA2_ID);
//genereaza instructiunea imediata
imm_gen imm(INSTRUCTION_ID,IMM_ID);

//le propagam mai departe 
//nu dorim sa le pierdem
assign PC_ID_out = PC_ID;
assign OPCODE_ID =INSTRUCTION_ID[6:0];
assign RD_ID = INSTRUCTION_ID[11:7];
assign FUNCT3_ID = INSTRUCTION_ID[14:12];
assign RS1_ID = INSTRUCTION_ID[19:15];
assign RS2_ID = INSTRUCTION_ID[24:20];
assign FUNCT7_ID = INSTRUCTION_ID[31:25];
endmodule
