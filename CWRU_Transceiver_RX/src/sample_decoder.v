module sample_decoder(
	input sample_flag, // to control sample input flow
	input [79:0] sample, // 80-bit sample
	output reg [7:0] code // decoded sample
);

integer i; // iterator for 8-bit code
integer j; // iterator for 80-bit sample
reg [3:0] window_sum; // total sum of a 10-bit window
reg [7:0] code_reg; // to hold sequentially decoded sample

initial
begin
	code = 8'h00;
end

always @(negedge sample_flag) // begin decoding once sampling is complete
begin
	// select ith bit to fill 8-bit code
	for (i = 0; i <= 7; i = i + 1)
	begin
		window_sum = 4'h0; // reset window sum
		
		// find most common value in 10-bit window of the sample based on ith position
		for (j = i * 10; j <= ((i + 1) * 10) - 1; j = j + 1)
			window_sum = window_sum + sample[j];
		
		if (window_sum < 4'h5)
			code_reg[i] = 1'b0;
		else
			code_reg[i] = 1'b1;
	end
	// once sample is fully decoded, bus result to output
	code = code_reg;
end

endmodule