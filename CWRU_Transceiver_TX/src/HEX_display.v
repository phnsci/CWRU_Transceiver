module HEX_display(
	input [7:0] code,
	output reg [6:0] HEX0
);

always @(code) // HEX display sensitive to only code
begin
	if (code == 8'b10000000)
		HEX0 = 7'b1000000; // display '0'
	else if (code == 8'b10100000)
		HEX0 = 7'b1111001; // display '1'
	else if (code == 8'b10101000)
		HEX0 = 7'b0100100; // display '2'
	else if (code == 8'b10101010)
		HEX0 = 7'b0110000; // display '3'
end

endmodule