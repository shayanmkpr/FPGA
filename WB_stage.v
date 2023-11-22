module WB_Stage(
  input clk , rst,
  input [31:0] PC_IN,
  output reg [31:0] PC
  );
  always @(posedge rst,posedge clk)
  begin
    if (rst) begin
      PC <= 32'b0;
	  end
    else begin
      PC <= PC_IN;
    end
  end
endmodule

