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

module ID_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
module EXE_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
module MEM_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
module WB_Stage_Reg(
  input clk,rst,freeze,flush,
  input[31:0] PC_in, Instruction_in,
  output reg[31:0] PC,Instruction
);
endmodule
