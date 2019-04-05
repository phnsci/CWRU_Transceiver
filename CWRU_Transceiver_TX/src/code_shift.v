module code_shift(
	// for simulation
	output reg [7:0] code_reg, // code register
	output reg [2:0] counter, // counter to reset at 8
	output reg shift_flag, // to control code input flow
	
	// non-simulation
	input clk,
	input [7:0] code,
	output reg code_MSB
);

// non-simulation 
//reg [7:0] code_reg; // code register
//reg [2:0] counter; // counter to reset at 8
//reg shift_flag; // to control code input flow

initial
begin
	code_MSB <= 1'b0;
	shift_flag <= 1'b0;
	counter <= 3'b000;
end

always @(clk)
begin
	// if not currently shifting and a button is pressed,
	// bus code to internal register and assert shift flag
	if (counter == 3'b000 && code[7] == 1'b1)
	begin
		code_reg <= code;
		shift_flag <= 1'b1;
	end

	// if counter has not yet reached 7 and shift flag is asserted,
	// output MSB and increment counter
	if (counter <= 3'b111 && shift_flag == 1'b1)
	begin
		counter <= counter + 3'b001;
		code_MSB <= code_reg[7];
		code_reg <= code_reg << 1;
	end

	// if counter has reached 8 and shifting is completed,
	// reset counter, and deassert shift flag
	if (counter == 3'b111)
	begin
		counter <= 3'b000;
		shift_flag <= 1'b0;
	end
end

endmodule