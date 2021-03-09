`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 11:21:27 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(input[31:0] in,
                output reg [31:0] out);
    integer i;
    always@(in)
    begin
        if (in[6:0] == 7'b0000011)//lw imediate
            begin
                for(i = 0; i < 21; i = i + 1) begin
                    out[11 + i] = in[31];   
                end 
                out[10:5] = in[30:25];
                out[4:1] = in[24:21];
                out[0] = in[20];
                
                
            end
          else if(in[6:0] == 7'b0010011)//slli imediate
          begin
                for(i = 0; i < 21; i = i + 1) begin
                    out[11 + i] = in[31];   
                end
                out[10:5] = in[30:25];
                out[4:1] = in[24:21];
                out[0] = in[20];
                
                
          end
         else if (in[6:0] == 7'b0100011)//sw
         begin
                for(i = 0; i < 21; i = i + 1) begin
                    out[11 + i] = in[31];   
                end 
            out[10:5] = in[30:25];
            out[4:1] = in[11:8];
            out[0] = in[7];
            
            
            
         end
            //b
         else if(in[6:0] == 7'b1100011)//brench instr
            begin
                 for(i = 0; i < 19; i = i + 1)begin
                    out[12 + i] = in[31];
                 end
                out[10:5] = in[30:25];
                out[4:1] = in[11:8];
                out[11] = in[7];
                out[0] = 0;
                
                
                
            end
            //r
           else  if(in[6:0] == 7'b0110011)
                begin
                    out = 0;
                end
          else
             begin
                out = in; 
          end
     end
         
endmodule
