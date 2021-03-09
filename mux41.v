`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 05:11:29 PM
// Design Name: 
// Module Name: mux41
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


module mux41(
    input[31:0] ina,inb,inc,ind,
    input [1:0]sel,
    output reg [31:0] out
    );
    
    always @ (ina or inb or inc or ind or sel)
        begin
            case (sel)
                2'b00 : out <= ina;
                2'b01 : out <= inb;
                2'b10 : out <= inc;
                2'b11 : out <= ind;
            endcase
        end
endmodule
