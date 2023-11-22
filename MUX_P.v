module MUX_P ( input [31:0] data_in_0, input [31:0] data_in_1, input select, output [31:0] data_out );
assign data_out = (select) ? data_in_1 : data_in_0;
endmodule