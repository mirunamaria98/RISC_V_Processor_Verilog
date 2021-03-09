`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 02:41:26 PM
// Design Name: 
// Module Name: PC
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


module PC( input clk, res,write,
           input [31:0] in,
           output reg [31:0] out
    );
    
 always@(posedge clk )
     begin
     if(res == 1)
        begin
            out = 0;
        end
     else
        begin
         if (write == 1)
             begin 
                out = in;
          end
       end
   end
    
    
endmodule
