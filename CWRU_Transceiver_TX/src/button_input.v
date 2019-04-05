module button_input(
	input clk,
	input [3:0] KEY,
	output reg [7:0] code
);

always @(posedge clk)
begin
	if (KEY[0] == 0)
		code = 8'b10000000; // output code 0
	else if (KEY[1] == 0)
		code = 8'b10100000; // output code 1
	else if (KEY[2] == 0)
		code = 8'b10101000; // output code 2
	else if (KEY[3] == 0)
		code = 8'b10101010; // output code 3
	else
		code = 8'b00000000; // no output
end

endmodule