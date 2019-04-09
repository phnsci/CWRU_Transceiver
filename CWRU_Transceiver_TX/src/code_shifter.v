module code_shifter(
	input clk,
	input [7:0] code,
	output reg code_MSB
);

integer counter; // counter to reset at 8
reg [7:0] code_reg; // code register
reg shift_flag; // to control code input flow

initial
begin
	code_MSB = 1'b0;
	shift_flag = 1'b0;
	counter = 0;
end

always @(clk)
begin
	// if not currently shifting and a button is pressed,
	// bus code to internal register and assert shift flag
	if (shift_flag == 1'b0 && code[7] == 1'b1)
	begin
		code_reg = code;
		shift_flag = 1'b1;
	end

	// if shift flag is asserted and counter has not yet reached 8,
	// output MSB and increment counter
	if (shift_flag == 1'b1 && counter <= 8)
	begin
		counter = counter + 1;
		code_MSB = code_reg[7];
		code_reg = code_reg << 1;
	end

	// if counter has reached 8 and shifting is completed,
	// reset counter and deassert shift flag
	if (counter == 8)
	begin
		counter = 0;
		shift_flag = 1'b0;
	end
end

endmodule