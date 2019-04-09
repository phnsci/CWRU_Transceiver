module CWRU_Transceiver_RX(
	input CLOCK_50,
	input [35:0] GPIO_1,
	output [6:0] HEX0
);

wire clk_40, sample_flag;
wire [79:0] sample;
wire [7:0] code;

clk_40_gen c(CLOCK_50, clk_40); // to generate 40kHz clock from 50MHz clock
shift_sampler s(clk_40, GPIO_1[17], sample, sample_flag); // signal exits PCB through pin 20?
sample_decoder d(sample_flag, sample, code); // to decode sampled signal down to 8 bits
HEX_display h(code, HEX0); // to display decoded signal

endmodule