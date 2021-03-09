`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2021 09:21:35 PM
// Design Name: 
// Module Name: RISC_V
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


module RISC_V(input clk,
              input reset,
              
              output [31:0] PC_EX,
              output [31:0] ALU_OUT_EX,
              output [31:0] PC_MEM,
              output PCSrc,
              output [31:0] DATA_MEMORY_MEM,
              output [31:0] ALU_DATA_WB,//rezultatul de la alu in wb
              output [1:0] forwardA, forwardB,
              output pipeline_stall
             );
      wire PC_write;
      wire [31:0] PC_IF, INSTRUCTION_IF;   
      wire IF_ID_write;//semnalul pt reg IF-ID (calculat in hazard detection)
      wire [31:0]INSTRUCTION_ID;//INSTR DIN IS SALVATA DE REG IF-ID
      wire [31:0]PC_ID;//PC DIN IF SALVAT DE REG IF-ID
      wire RegWrite_WB;//semnal de control venit de la wb, folosi in id
      wire [4:0] RD_WB;//registul rezultat in stadiul id
      wire  [31:0] IMM_ID;//valoarea imediata calculata in staiul id
      wire [31:0] REG_DATA1_ID,REG_DATA2_ID;//registre sursa in stagiul id
      wire [2:0] FUNCT3_ID;
      wire [6:0] FUNCT7_ID;
      wire [6:0] OPCODE_ID;
      wire [4:0] RD_ID;//adresa dest
      wire [4:0] RS1_ID;//adr sursa
      wire [4:0] RS2_ID;
      wire MemRead;
      wire MemtoReg;
      wire MemWrite;
      wire RegWrite;
      wire Branch;
      wire ALUSrc;//semnale de control
      wire[1:0] ALUop;  
     wire MemRead_EX;
        wire MemtoReg_EX;
    wire MemWrite_EX;
    wire RegWrite_EX;
   wire Branch_EX;
   wire ALUSrc_EX;
    wire [1:0] ALUop_EX;
    wire [31:0] IMM_EX;
    wire [31:0] REG_DATA1_EX;
    wire [31:0]REG_DATA2_EX;
    wire[2:0] FUNCT3_EX;
   wire [6:0] FUNCT7_EX;
    wire [6:0] OPCODE_EX;
    wire [4:0] RD_EX;
    wire [4:0] RS1_EX;
    wire [4:0] RS2_EX;
    wire  [31:0]ALU_OUT_MEM;   //valoarea alu in stagiul mem  
     wire ZERO_EX;
     wire [31:0] PC_Branch_EX;
     wire [31:0] REG_DATA2_EX_FINAL;
     wire MemRead_EX_out;
     wire MemtoReg_EX_out;
     wire        MemWrite_EX_out;
     wire RegWrite_EX_out;
     wire Branch_EX_out;
     wire [4:0] rd_EX_out;
     wire MemRead_MEM;
    wire MemtoReg_MEM;
    wire MemWrite_MEM;
    wire RegWrite_MEM;
    wire Branch_MEM;
    wire ZERO_MEM;
   // wire [31:0] PC_Branch_MEM;
    wire [31:0] REG_DATA2_MEM;
    wire [4:0]RD_MEM;
    wire brench_exec;
    wire  MemtoReg_MEM_out;
   wire RegWrite_MEM_out;
    wire [4:0] RD_MEM_out;
    wire [31:0] ALU_OUT_MEM_out;
    wire MemtoReg_WB ;
    wire [31:0] ALU_WB;
    wire [31:0] MEM_READ_DATA;
     
     
     
     
     
     
      
      IF iff(clk,reset,PCSrc, PC_write,PC_MEM,PC_IF,INSTRUCTION_IF);
      pipeline reg_IF_ID(clk,reset,IF_ID_write,INSTRUCTION_IF,PC_IF,INSTRUCTION_ID,PC_ID);
      
      
      ID ups(
        clk,
        PC_ID,INSTRUCTION_ID,
        RegWrite_WB,
        ALU_DATA_WB,
        RD_WB,
        IMM_ID,
        REG_DATA1_ID,
        REG_DATA2_ID,
        FUNCT3_ID,
        FUNCT7_ID,
        OPCODE_ID,
        RD_ID,
        RS1_ID,
        RS2_ID
        );
      
      
      control_path path(
        OPCODE_ID,//opcode-ul instructiunii
        pipeline_stall,//semnal provenit din unitatea de detectie a hazardurilor
        MemRead,
        MemtoReg,
        MemWrite,
        RegWrite,
        Branch,
        ALUSrc,//semnale de control
        ALUop
        );
      
      
      pipe_ID_EX id_ex(
        reset,
        1'b1,
        clk,
        PC_ID,
        MemRead,
        MemtoReg,
        MemWrite,
        RegWrite,
        Branch,
        ALUSrc,
        ALUop,
        IMM_ID,
        REG_DATA1_ID,
        REG_DATA2_ID,
        FUNCT3_ID,
        FUNCT7_ID,
        OPCODE_ID,
        RD_ID,
        RS1_ID,
        RS2_ID,
        
        PC_EX,
        MemRead_EX,
        MemtoReg_EX,
        MemWrite_EX,
        RegWrite_EX,
        Branch_EX,
        ALUSrc_EX,
        ALUop_EX,
        IMM_EX,
        REG_DATA1_EX,
        REG_DATA2_EX,
        FUNCT3_EX,
        FUNCT7_EX,
        OPCODE_EX,
        RD_EX,
        RS1_EX,
        RS2_EX
        );
    
    
    EX ex(IMM_EX,      
          REG_DATA1_EX,
          REG_DATA2_EX,
          PC_EX,
          FUNCT3_EX,
          FUNCT7_EX,
          RD_EX,
          RS1_EX,
          RS2_EX,
          RegWrite_EX,
          MemtoReg_EX,
          MemRead_EX,
          MemWrite_EX,
          ALUop_EX,
          ALUSrc_EX,
          Branch_EX,
          forwardA,forwardB,
          
          ALU_DATA_WB,
          ALU_OUT_MEM,
          
          ZERO_EX,
          ALU_OUT_EX,
          PC_Branch_EX,
          REG_DATA2_EX_FINAL,
          MemRead_EX_out,
          MemtoReg_EX_out,
          MemWrite_EX_out,
          RegWrite_EX_out,
          Branch_EX_out,
          rd_EX_out
          
          );
          
    pipe_EX_MEM pipe_ex_mem(
         reset,1'b1,clk,
         MemRead_EX_out,
         MemtoReg_EX_out,
         MemWrite_EX_out,
         RegWrite_EX_out,
         Branch_EX_out,
         ZERO_EX,
         ALU_OUT_EX,
         PC_Branch_EX,
         REG_DATA2_EX_FINAL,
         rd_EX_out,
     
         MemRead_MEM,
         MemtoReg_MEM,
         MemWrite_MEM,
         RegWrite_MEM,
         Branch_MEM,
         ZERO_MEM,
         ALU_OUT_MEM,
         PC_MEM,
         REG_DATA2_MEM,
        RD_MEM
    );   
    
    
      data_memory mem( clk,       
                   MemRead_MEM,
                   MemWrite_MEM,
                   ALU_OUT_MEM,
                   REG_DATA2_MEM,
                   DATA_MEMORY_MEM
                   ); 
                   
      assign PCSrc = ZERO_MEM & Branch_MEM;
      assign MemtoReg_MEM_out = MemtoReg_MEM;
      assign RegWrite_MEM_out = RegWrite_MEM;
      assign RD_MEM_out = RD_MEM;
      assign ALU_OUT_MEM_out = ALU_OUT_MEM;      
 /*   
    assign PCSrc = ZERO_MEM & Branch_MEM;/////////////////////////////////////////
      MEM mmem(
    clk,       
     MemRead_MEM,
    MemWrite_MEM,
    ALU_OUT_MEM,
    REG_DATA2_MEM,
    ZERO_MEM,
    Branch_MEM,
    MemtoReg_MEM,
    RegWrite_MEM,
    RD_MEM,
   
    //PCSrc,
    DATA_MEMORY_MEM,
    MemtoReg_MEM_out,
   RegWrite_MEM_out,
    RD_MEM_out,
    ALU_OUT_MEM_out
    );
      */
    
pipe_MEM_WB r_b(
    reset,1'b1,clk,
    MemtoReg_MEM_out,
    RegWrite_MEM_out,
    ALU_OUT_MEM_out,
    DATA_MEMORY_MEM,
    RD_MEM_out,
 
    MemtoReg_WB ,
    RegWrite_WB,
    ALU_WB,
    MEM_READ_DATA,
    RD_WB
    );
      
    mux2_1 mmm(//nu mai mofifica
        ALU_WB,
        MEM_READ_DATA, 
        
        MemtoReg_WB,
        ALU_DATA_WB);
      
   forwarding forw(RS1_EX,
                  RS2_EX,
                  RD_MEM,
                  RD_WB,
                  RegWrite_MEM,
                  RegWrite_WB,
                  forwardA,forwardB);
                  
   hazard_detection ups2(RD_EX,
                        RS1_ID,
                        RS2_ID,
                        MemRead,
                        PC_write,
                        IF_ID_write,
                        pipeline_stall);
      
      
      
      
    
endmodule
