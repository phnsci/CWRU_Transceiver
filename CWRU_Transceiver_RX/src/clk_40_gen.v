module clk_40_gen(
	input clk_in,
	output reg clk_out
);

reg [11:0] counter; // for reference to 50MHz cycles, resets at 0x271 = 625

initial
begin
	clk_out = 1'b0; // 4kHz clock cycle for binary code transmission
	counter = 12'h000;
end

always @(posedge clk_in)
begin
	counter = counter + 12'h001;
	if (counter == 12'h271)
	begin
		clk_out = ~clk_out;
		counter = 12'h000;
	end	
end

endmodule