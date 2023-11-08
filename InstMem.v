module arm_instruction_memory (
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
