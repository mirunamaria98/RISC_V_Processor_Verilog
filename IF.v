`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 09:18:18 PM
// Design Name: 
// Module Name: IF
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


module IF(
    input clk,reset,
    input PCSrc, PC_write,
    input [31:0] PC_Branch,
    output [31:0] PC_IF, INSTRUCTION_IF
    );
    
    wire [31:0]rez_mux;
    wire [31:0]add_rez;
    
    adder add(4,PC_IF,add_rez);
    mux2_1 mux(add_rez,PC_Branch,PCSrc,rez_mux);
    PC pc(clk,reset,PC_write,rez_mux,PC_IF);
    instruction_memory instr(PC_IF[11:2],INSTRUCTION_IF);
    
endmodule
