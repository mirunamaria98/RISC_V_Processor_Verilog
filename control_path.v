`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 01:31:16 PM
// Design Name: 
// Module Name: control_path
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


module control_path(
    input [6:0] opcode,//opcode-ul instructiunii
    input control_sel,//semnal provenit din unitatea de detectie a hazardurilor
    output reg MemRead,MemtoReg,MemWrite,RegWrite,Branch,ALUSrc,//semnale de control
    output reg [1:0] ALUop
    );
    
    always@(*)
    begin
        if(control_sel == 1) 
            begin
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                RegWrite = 0;
                Branch = 0;
                ALUSrc = 0;
                ALUop = 0;
            end
         else 
            begin   
               if (opcode == 7'b0110011) //r
                    begin
                        ALUSrc = 0;
                        MemtoReg = 0;
                        RegWrite = 1;
                        MemRead = 0;
                        MemWrite = 0;
                        Branch = 0;
                        ALUop[1] = 1;
                        ALUop[0] = 0;
                        
                    end
               else if (opcode == 7'b0000011) //lw
                    begin
                        ALUSrc = 1;
                        MemtoReg = 1;
                        RegWrite = 1;
                        MemRead = 1;
                        MemWrite = 0;
                        Branch = 0;
                        ALUop[1] = 0;
                        ALUop[0] = 0;
                        
                    end
              else if (opcode == 7'b0100011) //sw
                    begin
                        ALUSrc = 1;
                        MemtoReg = 1'bx;//x
                        RegWrite = 0;
                        MemRead = 0;
                        MemWrite = 1;
                        Branch = 0;
                        ALUop[1] = 0;
                        ALUop[0] = 0;
                        
                    end
              else if (opcode == 7'b1100011) //beq
                    begin
                        ALUSrc = 0;
                        MemtoReg = 1'bx; //xxxx
                        RegWrite = 0;
                        MemRead = 0;
                        MemWrite = 0;
                        Branch = 1;
                        ALUop[1] = 0;
                        ALUop[0] = 1;
                        
                    end
              else if (opcode == 7'b0010011) //i
                    begin
                        ALUSrc = 1;
                        MemtoReg = 0;
                        RegWrite = 1;
                        MemRead = 0;
                        MemWrite = 0;
                        Branch = 0;
                        ALUop[1] = 1;
                        ALUop[0] = 0;
                        
                    end
                else if(opcode == 7'b00000000)
                begin
                        ALUSrc = 0;
                        MemtoReg = 0;
                        RegWrite = 0;
                        MemRead = 0;
                        MemWrite = 0;
                        Branch = 0;
                        ALUop[1] = 0;
                        ALUop[0] = 0;
                end
               else begin 
               ALUSrc = 1'bX;
		                      MemtoReg = 1'bX;
		                      RegWrite = 1'bX;
		                      MemRead = 1'bX;
		                      MemWrite = 1'bX;
		                      Branch = 1'bX;
		                      ALUop[1] = 1'bX;
		                      ALUop[0] = 1'bX;
		                  end
                 
            end
    end
    
    
endmodule
