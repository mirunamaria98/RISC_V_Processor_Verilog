`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 07:27:36 PM
// Design Name: 
// Module Name: pipe_ID_EX
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


module pipe_ID_EX(
    input reset,write,clk,
    input [31:0]PC,
    input MemRead,
    input MemtoReg,
    input MemWrite,
    input RegWrite,
    input Branch,
    input ALUSrc,
    input [1:0] ALUop,
    input [31:0] IMM_ID,
    input [31:0] REG_DATA1_ID,REG_DATA2_ID,
    input [2:0] FUNCT3_ID,
    input [6:0] FUNCT7_ID,
    input [6:0] OPCODE_ID,
    input [4:0] RD_ID,
    input [4:0] RS1_ID,
    input [4:0] RS2_ID,
    
    output reg [31:0]PC_out,
    output reg MemRead_out,
    output reg MemtoReg_out,
    output reg MemWrite_out,
    output reg RegWrite_out,
    output reg Branch_out,
    output reg ALUSrc_out,
    output reg [1:0] ALUop_out,
    output reg [31:0] IMM_ID_out,
    output reg [31:0] REG_DATA1_ID_out,REG_DATA2_ID_out,
    output reg [2:0] FUNCT3_ID_out,
    output reg [6:0] FUNCT7_ID_out,
    output reg [6:0] OPCODE_ID_out,
    output reg [4:0] RD_ID_out,
    output reg [4:0] RS1_ID_out,
    output reg [4:0] RS2_ID_out
    );
    
    
        always @(posedge clk)
        if (reset)
        begin
            PC_out<= 0;
            MemRead_out<= 0;
            MemtoReg_out<= 0;
            MemWrite_out<= 0;
            RegWrite_out<= 0;
            Branch_out<= 0;
            ALUSrc_out<= 0;
            ALUop_out<= 0;
            IMM_ID_out<= 0;
            REG_DATA1_ID_out<= 0;
            REG_DATA2_ID_out<= 0;
            FUNCT3_ID_out<= 0;
            FUNCT7_ID_out<= 0;
            OPCODE_ID_out<= 0;
            RD_ID_out<= 0;
            RS1_ID_out<= 0;
            RS2_ID_out<= 0;
            
        end
        else    
        begin
            if (write)
            begin
                PC_out<= PC;
                MemRead_out<= MemRead;
                MemtoReg_out<= MemtoReg;
                MemWrite_out<= MemWrite;
                RegWrite_out<= RegWrite;
                Branch_out<= Branch;
                ALUSrc_out<= ALUSrc;
                ALUop_out<= ALUop;
                IMM_ID_out<= IMM_ID;
                REG_DATA1_ID_out<= REG_DATA1_ID;
                REG_DATA2_ID_out<= REG_DATA2_ID;
                FUNCT3_ID_out<= FUNCT3_ID;
                FUNCT7_ID_out<= FUNCT7_ID;
                OPCODE_ID_out<= OPCODE_ID;
                RD_ID_out<= RD_ID;
                RS1_ID_out<= RS1_ID;
                RS2_ID_out<= RS2_ID;
            end
        end
endmodule
