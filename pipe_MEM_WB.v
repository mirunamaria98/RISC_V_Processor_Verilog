`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 07:47:21 PM
// Design Name: 
// Module Name: pipe_MEM_WB
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


module pipe_MEM_WB(
 input reset,write,clk,
    input MemtoReg,
    input RegWrite,
    input [31:0] ALU_OUT_MEM,
    input [31:0] REG_DATA2_MEM_FINAL,
    input [4:0]RD_MEM,
 
    output reg MemtoReg_out ,
    output reg RegWrite_out,
    output reg [31:0] ALU_OUT_MEM_out,
    output reg [31:0] REG_DATA2_MEM_FINAL_out,
    output reg [4:0]RD_MEM_out
    );
    
    always @(posedge clk)
        if (reset)
        begin

            MemtoReg_out<= 0;
            RegWrite_out<= 0;
            ALU_OUT_MEM_out<= 0;
            REG_DATA2_MEM_FINAL_out<= 0;
            RD_MEM_out <= 0;

            
        end
        else    
        begin
       if (write)
            begin
            MemtoReg_out<= MemtoReg;
            RegWrite_out<= RegWrite;
            ALU_OUT_MEM_out<= ALU_OUT_MEM;
            REG_DATA2_MEM_FINAL_out<= REG_DATA2_MEM_FINAL;
            RD_MEM_out <= RD_MEM;
            end
        end
    
endmodule
