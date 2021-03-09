`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 03:32:56 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
        input[3:0] ALUop,
        input [31:0] ina,inb,
        output reg zero, // nu stiu daca trebuie reg , e pus de mine
        output reg [31:0] out
    );
    
    always@(*) begin 
        if(ALUop == 4'b0010)//ld sd add
        begin
            out = ina + inb;
        end
        else if(ALUop == 4'b0110) //sub
        begin 
            out = ina - inb;
        end
        else if(ALUop == 4'b0000) //and
        begin 
            out = ina & inb;
        end
        else if(ALUop == 4'b0001) //or
        begin 
            out = ina | inb;
        end
        else if(ALUop == 4'b0011) //xor
        begin 
            out = ina ^ inb;
        end
        else if(ALUop == 4'b0101) //srl srli
        begin 
            out = ina >> inb;
        end
        else if(ALUop == 4'b0100) //sll slli
        begin 
            out = ina << inb;
        end
        else if(ALUop == 4'b1001) //sra srai
        begin 
            out = ina >>> inb;
        end
        else if(ALUop == 4'b0111) //sltu nu se tine cont de semn
        begin 
            if(ina < inb) 
                begin 
                    out = 1;
                end
            else
                begin 
                    out = 0;
                end
        end
        else if(ALUop == 4'b1000) //slt  se tine cont de semn
        begin 
            if(ina[31:0] == 1 && inb[31:0] == 1 || ina[31:0] == 0 && inb[31:0] == 0)
                begin 
                    if(ina > inb)
                    begin
                        out = 1;
                    end
                    else
                    begin 
                        out = 0;
                    end
                end
            if(ina[31:0] == 1 && inb[31:0] == 0)
            begin
                out = 0;
            end
            
            if(ina[31:0] == 0 && inb[31:0] == 1)
            begin
                out = 1;
            end
        end 
     /* 
     if(out == 0)
        begin
            zero = 1;
        end
     else
     begin
        zero = 0;
     end*/
    end
  
  always@(*) begin
    if(out == 0)
        begin
            zero = 1;
        end
     else
     begin
        zero = 0;
     end
  end
    
    
    
endmodule
