module mux_2to1_32bit (
    input [31:0] data_in_0, // 32-bit input data for channel 0
    input [31:0] data_in_1, // 32-bit input data for channel 1
    input select,           // 1-bit control signal
    output reg [31:0] data_out // 32-bit output data
);

assign data_out = (select) ? data_in_1 : data_in_0;

endmodule
