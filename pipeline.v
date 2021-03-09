`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 12:44:06 AM
// Design Name: 
// Module Name: pipeline
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


module pipeline(clk,reset,write,instr,in,out_instr,out);
input [31:0] instr;
input [31:0] in;
input reset,write,clk;
output reg [31:0] out_instr;
output reg [31:0] out;

    //daca reset este 1 intoarce 0
    //daca write e 1 intoarce valoarea de la intrare
    //salvam doua valori:iesirea de la pc si instructiunea obt de la instr memory 
    always @(posedge clk)
        if (reset)
        begin
            out_instr <= 0;
            out <= 0;
        end
        else    
        begin
            if (write)
            begin
                out_instr <= instr;
                out <= in;
            end
        end
endmodule