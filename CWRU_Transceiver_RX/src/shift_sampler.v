module shift_sampler(
	input clk, // 40kHz generated clock
	input signal, // output signal from RX PCB
	output reg [79:0] sample, // take 80 samples at 40kHz
	output reg sample_flag // to control signal input flow
);

reg [6:0] counter; // counter to reset at 0

initial
begin
	sample = 80'h00000000000000000000;
	sample_flag = 1'b0;
	counter = 7'b1001111; // counter starts at 79
end

always @(posedge clk)
begin
	// if not currently sampling and a high signal is sensed,
	// assert sample flag to begin sampling
	if (sample_flag == 1'b0 && signal == 1'b1)
	begin
		sample_flag = 1'b1;
	end

	// if sample flag is asserted and counter has not yet reached 0,
	// take one sample of the signal and decrement counter
	if (sample_flag == 1'b1 && counter > 7'b0000000)
	begin
		sample[counter] = signal;
		counter = counter - 7'b0000001;
	end

	// if counter has reached 0 and sampling is completed,
	// take final sample, reset counter, and deassert sample flag
	if (counter == 7'b0000000)
	begin
		sample[counter] = signal;
		counter = 7'b1001111;
		sample_flag = 1'b0;
	end
end

endmodule