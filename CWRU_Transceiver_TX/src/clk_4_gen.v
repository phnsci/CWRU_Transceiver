module clk_4_gen(input clk_in, output reg clk_out);

reg counter = 16'h0000; // for reference to 50MHz cycles, resets at 0x30D4 = 12,500

initial
begin
	clk_out <= 1'b0; // 4kHz clock cycle for binary code transmission
end

always @(posedge clk_in)
begin
	counter <= counter + 1'b1;
	if (counter == 16'h30D4)
	begin
		clk_out <= ~clk_out;
		counter <= 16'h0000;
	end	
end

endmodule