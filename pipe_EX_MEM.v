`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 07:47:21 PM
// Design Name: 
// Module Name: pipe_EX_MEM
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


module pipe_EX_MEM(
 input reset,write,clk,
    input MemRead,
    input MemtoReg,
    input MemWrite,
    input RegWrite,
    input Branch,
    input ZERO_EX,
    input [31:0] ALU_OUT_EX,
    input [31:0] PC_Branch_EX,
    input [31:0] REG_DATA2_EX_FINAL,
    input [4:0]RD_EX,
 
    output reg MemRead_out,
    output reg MemtoReg_out,
    output reg MemWrite_out,
    output reg RegWrite_out,
    output reg Branch_out,
    output reg ZERO_EX_out,
    output reg [31:0] ALU_OUT_EX_out,
    output reg [31:0] PC_Branch_EX_out,
    output reg [31:0] REG_DATA2_EX_FINAL_out,
    output reg [4:0]RD_EX_out
    );
    
    always @(posedge clk)
        if (reset)
                begin
                MemRead_out<= 0;
                MemtoReg_out<= 0;
                MemWrite_out<= 0;
                RegWrite_out<= 0;
                Branch_out<= 0;
                ZERO_EX_out<= 0;
                ALU_OUT_EX_out<= 0;
                PC_Branch_EX_out<= 0;
                REG_DATA2_EX_FINAL_out<= 0;
                RD_EX_out <= 0;
            end
       else    
            begin
                if (write)
                    begin
                        MemRead_out<= MemRead;
                        MemtoReg_out<= MemtoReg;
                        MemWrite_out<= MemWrite;
                        RegWrite_out<= RegWrite;
                        Branch_out<= Branch;
                        ZERO_EX_out<= ZERO_EX;
                        ALU_OUT_EX_out<= ALU_OUT_EX;
                        PC_Branch_EX_out<= PC_Branch_EX;
                        REG_DATA2_EX_FINAL_out<= REG_DATA2_EX_FINAL;
                        RD_EX_out <= RD_EX;
                    end
            end    
endmodule
