`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 10:41:32 PM
// Design Name: 
// Module Name: MEM
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


module MEM(
    input clk,       
    input mem_read,
    input mem_write,
    input [31:0] address,
    input [31:0] write_data,
    input ZERO_MEM,
    input Branch_MEM,
    input MemtoReg_MEM,
    input RegWrite_MEM,
    input [4:0] RD_MEM,
    output  brench_exec,
    output [31:0]read_data,
    output reg MemtoReg_MEM_out,
    output reg RegWrite_MEM_out,
    output reg [4:0] RD_MEM_out,
    output reg [31:0] ALU_OUT_MEM_out
    );
    
 
       // assign brench_exec = ZERO_MEM & Branch_MEM;
   
    
    data_memory mem( clk,       
                   mem_read,
                   mem_write,
                   address,
                   write_data,
                   read_data
                   );
    initial begin
    assign MemtoReg_MEM_out = MemtoReg_MEM;
    assign RegWrite_MEM_out = RegWrite_MEM;
    assign RD_MEM_out = RD_MEM;
    assign ALU_OUT_MEM_out = address;
    end
    
    
endmodule
