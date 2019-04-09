module shift_sampler(
	input clk, // 40kHz generated clock
	input signal, // output signal from RX PCB
	output reg [79:0] sample, // take 80 samples at 40kHz
	output reg sample_flag // to control signal input flow
);

integer counter; // counter to reset at 0

initial
begin
	sample = 0;
	sample_flag = 1'b0;
	counter = 79;
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
	// increment counter and take one sample of the signal
	if (sample_flag == 1'b1 && counter >= 0)
	begin
		counter = counter - 1;
		sample[counter] = signal;
	end

	// if counter has reached 0 and sampling is completed,
	// reset counter and deassert sample flag
	if (counter == 0)
	begin
		counter = 79;
		sample_flag = 1'b0;
	end
end

endmodule