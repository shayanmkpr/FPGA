module IF_stage(
  input clk, rst,freeze,Branch_taken,input[31:0] BranchAddr,output[31:0] PC,output [31:0] Instruction );
  wire[31:0] nextPC, MUXout;
  reg[31:0]PCreg=0;
  always@(posedge clk, posedge rst)begin
    if(rst)
      PCreg<=0;
    else if(~freeze)
      PCreg<=MUXout;
  end
  assign PC=nextPC;
  assign nextPC=PCreg+4;
  assign MUXout=Branch_taken ? BranchAddr : nextPC;
  InstMem IM (clk, PCreg,  Instruction);
endmodule

module IF_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
  always@(posedge clk, posedge rst)begin
    if(rst)begin
      PC<=0;
      Instruction<=0;
    end
    else begin
      if(flush) begin
        PC<=0;
        Instruction<=0;
      end
      else if(~freeze) begin
        PC<=PC_in;
        Instruction<=Instruction_in;
      end
    end
  end
endmodule

module ID_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
endmodule
module EXE_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
endmodule

module MEM_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
endmodule

module WB_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
endmodule

module InstMem (
    input clk,
    input [31:0] address, // 6-bit instruction address
    output reg [31:0] instruction // 32-bit instruction word
);

always @* begin
    case (address)
        0: instruction = 32'b11100011000000000000000000000000; // NOP
        4: instruction = 32'b01100101000000000000000000000000; // ADD 
        8: instruction = 32'b01101010000000000000000000000000; // SUB 
        12: instruction = 32'b10010001000000000000000000000000; // AND 
        16: instruction = 32'b10101001000000000000000000000000; // ORR 
        20: instruction = 32'b11101001000000000000000000000000; // EOR 
        24: instruction = 32'b00000000000000000000000000000000; // CMP
        28: instruction = 32'b00000001000000000000000000000000; // TST
        32: instruction = 32'b01001001000000000000000000000000; // LDR
        36: instruction = 32'b01001011000000000000000000000000; // STR
        40: instruction = 32'b11010000000000000000000000000000; // B
        44: instruction = 32'b01110101000000000000000000000000; // ADC
        48: instruction = 32'b01010001000000000000000000000000; // SBC
        default: instruction = 32'b00000000000000000000000000000000; // Default to a NOP
    endcase
end

endmodule

