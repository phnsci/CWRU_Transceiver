module clk_4_gen(
	input clk_in,
	output reg clk_out
	);

reg [15:0] counter; // for reference to 50MHz cycles, resets at 0x186A = 6,250

initial
begin
	clk_out = 1'b0; // 4kHz clock cycle for binary code transmission
	counter = 16'h0000;
end

always @(posedge clk_in)
begin
	counter = counter + 16'h0001;
	if (counter == 16'h186A)
	begin
		clk_out = ~clk_out;
		counter = 16'h0000;
	end	
end

endmodule