module button_input(input clk, input [3:0] KEY, output reg code);

always @(posedge clk)
begin
	if (KEY[0] == 0)
		code <= 'b10000000;
	else if (KEY[1] == 0)
		code <= 'b10100000;
	else if (KEY[2] == 0)
		code <= 'b10101000;
	else if (KEY[3] == 0)
		code <= 'b10101010;
end

endmodule