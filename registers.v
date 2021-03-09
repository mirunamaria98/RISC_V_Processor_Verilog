`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 09:53:41 PM
// Design Name: 
// Module Name: registers
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


module registers(input clk,reg_write,
                input [4:0] read_reg1,read_reg2,write_reg,
                input [31:0] write_data,
                output [31:0] read_data1, read_data2);
   integer i; 
   reg [31:0] vect[31:0];
   reg [31:0] reg_out1,reg_out2;
   
  initial begin    
     for( i = 0; i < 32; i = i + 1) 
        begin
            vect[i] = i;
         end
    end
    
    //dorim sa fie sincron cu frontul pozitiv al ceasului
    always@(posedge clk)
        begin
            //semnalul sincron reg_write activ pe 1 logic
            if(reg_write == 1)
            begin
               vect[write_reg] = write_data;
            end
        end
    always@(*)
        begin
            reg_out1 = vect[read_reg1];
            reg_out2 = vect[read_reg2];
        end
    
    assign read_data1 = reg_out1;
    assign read_data2 = reg_out2;
    
    
endmodule
