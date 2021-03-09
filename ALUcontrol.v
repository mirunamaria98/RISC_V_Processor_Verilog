`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 01:56:20 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(
            input [1:0]ALUop,
            input[6:0]funct7,
            input[2:0]funct3,
            output reg [3:0] ALUinput
    );
    
    
    
    always@(*) begin
        if(ALUop == 2'b00)//load store
            begin
                ALUinput[0] = 0;
                ALUinput[1] = 1;
                ALUinput[2] = 0;
                ALUinput[3] = 0;
            end
         else if(ALUop == 2'b10)//r-type
            begin
                if(funct3 == 3'b000)
                    begin
                        if(funct7 == 7'b0000000)//add
                            begin
                                ALUinput[0] = 0;
                                ALUinput[1] = 1;
                                ALUinput[2] = 0;
                                ALUinput[3] = 0;
                            end
                           else if(funct7 == 7'b0100000)//sub
                                begin
                                    ALUinput[0] = 0;
                                    ALUinput[1] = 1;
                                    ALUinput[2] = 1;
                                    ALUinput[3] = 0;
                                end                         
                    end
                    
                     else if(funct3 == 3'b111 && funct7 == 7'b00000000)//and
                        begin
                            ALUinput[0] = 0;
                            ALUinput[1] = 0;
                            ALUinput[2] = 0;
                            ALUinput[3] = 0;
                        end
                     else if(funct3 == 3'b110 && funct7 == 7'b00000000 )//or
                        begin
                            ALUinput[0] = 1;
                            ALUinput[1] = 0;
                            ALUinput[2] = 0;
                            ALUinput[3] = 0;
                        end
                     else if(funct3 == 3'b100 && funct7 == 7'b00000000)//xor
                        begin
                            ALUinput[0] = 0;
                            ALUinput[1] = 0;
                            ALUinput[2] = 1;
                            ALUinput[3] = 1;
                        end
                     else if(funct3 == 3'b101 && funct7 == 7'b00000000)//srl srli
                     begin 
                            ALUinput[0] = 0;
                            ALUinput[1] = 1;
                            ALUinput[2] = 0;
                            ALUinput[3] = 1;
                     end
                     else if(funct3 == 3'b001 && funct7 == 7'b01000000)//sll slli
                     begin 
                            ALUinput[0] = 0;
                            ALUinput[1] = 0;
                            ALUinput[2] = 1;
                            ALUinput[3] = 0;
                     end
                     else if(funct3 == 3'b101 && funct7 == 7'b01000000)//sra srai
                     begin 
                            ALUinput[0] = 1;
                            ALUinput[1] = 0;
                            ALUinput[2] = 0;
                            ALUinput[3] = 1;
                     end
                     else if(funct3 == 3'b011 && funct7 == 7'b01000000)//sltu
                     begin 
                            ALUinput[0] = 1;
                            ALUinput[1] = 1;
                            ALUinput[2] = 1;
                            ALUinput[3] = 0;
                     end
                      else if(funct3 == 3'b010 && funct7 == 7'b01000000)//slt
                     begin 
                            ALUinput[0] = 0;
                            ALUinput[1] = 0;
                            ALUinput[2] = 0;
                            ALUinput[3] = 1;
                     end
                     
            end
            else if(ALUop == 2'b01)//beq
                begin
                    if(funct3 == 3'b000 || funct3 == 3'b001)//beq bne
                    begin
                        ALUinput[0] = 0;
                        ALUinput[1] = 1;
                        ALUinput[2] = 1;
                        ALUinput[3] = 0;
                    end
                    else if(funct3 == 3'b100 || funct3 == 3'b101)//blt bge
                    begin
                        ALUinput[0] = 0;
                        ALUinput[1] = 0;
                        ALUinput[2] = 0;
                        ALUinput[3] = 1;
                    end
                    else if(funct3 == 3'b110 || funct3 == 3'b111)//blte bgen
                    begin
                        ALUinput[0] = 1;
                        ALUinput[1] = 1;
                        ALUinput[2] = 1;
                        ALUinput[3] = 0;
                    end
                end
    end
endmodule
