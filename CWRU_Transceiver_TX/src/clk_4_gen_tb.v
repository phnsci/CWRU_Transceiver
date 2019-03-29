`timescale 1 ns / 100 ps

module clk_4_gen_tb();

reg clk_in;

wire clk_out;
wire[3:0] counter;

initial
begin
	clk_in = 0;
	#5000 $stop;
end

clk_4_gen UUT(clk_in, clk_out, counter);

always
		#10 clk_in = ~clk_in;
	
endmodule