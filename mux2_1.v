`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 02:28:43 PM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(input[31:0] ina, inb,
            input sel,
            output reg [31:0] out);
   
//output devine egal cu inb daca sel este true sau 
//egal cu ina daca sel este negativ
    wire[31:0] ina_aux,inb_aux;
    wire sel_neg;
/*
    assign sel_neg = ~sel;
    assign ina_aux = sel_neg * ina;
    assign inb_aux = sel * inb;
    assign out = ina_aux + inb_aux;
    */
  always@(*) begin  
    if(sel == 1)
    begin
        out = inb;
    end
    else
    begin
        out = ina;
    end
    end

    
endmodule
