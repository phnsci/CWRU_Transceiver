module CWRU_Transceiver_TX(
	input CLOCK_50, // 50MHz clock from on-board oscillator
	input [3:0] KEY, // pushbutton inputs from board
	output [35:0] GPIO_1, // GPIO_1 pin outputs
	output [6:0] HEX0 // 7-segment display
	);

wire clk_4;
wire [7:0] code;

assign GPIO_1[17] = clk_4; // GPIO pin 20 outputs the 4kHz clock
assign GPIO_1[15] = CLOCK_50; // GPIO pin 18 outputs the 50MHz clock	

clk_4_gen c (CLOCK_50, clk_4);
button_input b (clk_4, KEY, code);
HEX_display d (clk_4, code, HEX0);

endmodule