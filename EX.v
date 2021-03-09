`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 04:11:19 PM
// Design Name: 
// Module Name: EX
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


module EX(input [31:0] IMM_EX,         
          input [31:0] REG_DATA1_EX,
          input [31:0] REG_DATA2_EX,
          input [31:0] PC_EX,
          input [2:0] FUNCT3_EX,
          input [6:0] FUNCT7_EX,
          input [4:0] RD_EX,
          input [4:0] RS1_EX,
          input [4:0] RS2_EX,
          input RegWrite_EX,
          input MemtoReg_EX,
          input MemRead_EX,
          input MemWrite_EX,
          input [1:0] ALUop_EX,
          input ALUSrc_EX,
          input Branch_EX,
          input [1:0] forwardA,forwardB,
          
          input [31:0] ALU_DATA_WB,
          input [31:0] ALU_OUT_MEM,
          
          output ZERO_EX,
          output [31:0] ALU_OUT_EX,
          output [31:0] PC_Branch_EX,
          output [31:0] REG_DATA2_EX_FINAL,
          output MemRead_EX_out,
                MemtoReg_EX_out,
                 MemWrite_EX_out,
             RegWrite_EX_out,
             Branch_EX_out,
             output [4:0] rd_EX_out
          );
        
        wire [3:0]ALUInput;
        wire [31:0]out_mux1,out_mux2,out_mux3;
        wire [31:0]rez_addr;
        
       
       
        mux41 mux1(REG_DATA1_EX,ALU_DATA_WB,ALU_OUT_MEM,32'b0,forwardA,out_mux1);
        
        mux41 mux2(REG_DATA2_EX,ALU_DATA_WB,ALU_OUT_MEM,32'b0,forwardB,REG_DATA2_EX_FINAL);
        
        mux2_1 mux3(REG_DATA2_EX_FINAL,IMM_EX,ALUSrc_EX,out_mux3);//nu se mai modifica
        
        adder ups3(PC_EX,IMM_EX,PC_Branch_EX);
        
        ALUcontrol alu_control(ALUop_EX,FUNCT7_EX,FUNCT3_EX,ALUInput);
        ALU alu(ALUInput,out_mux1,out_mux3,ZERO_EX,ALU_OUT_EX);
        
        //assign REG_DATA2_EX_FINAL = out_mux2;
       // assign PC_Branch_EX = rez_addr;
        assign MemRead_EX_out = MemRead_EX;
        assign MemtoReg_EX_out = MemtoReg_EX;
        assign MemWrite_EX_out = MemWrite_EX;
        assign RegWrite_EX_out = RegWrite_EX;
        assign Branch_EX_out = Branch_EX;
        assign rd_EX_out = RD_EX;
        
        
        
endmodule
