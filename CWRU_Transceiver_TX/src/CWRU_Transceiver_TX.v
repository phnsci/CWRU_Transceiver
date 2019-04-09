module CWRU_Transceiver_TX(
	input CLOCK_50, // 50MHz clock from on-board oscillator
	input [3:0] KEY, // pushbutton inputs from board
	output [35:0] GPIO_1, // GPIO_1 pin outputs
	output [6:0] HEX0 // 7-segment display
);

wire clk_4, code_MSB;
wire [7:0] code;

assign GPIO_1[17] = code_MSB; // GPIO pin 20 outputs code at 4kHz

clk_4_gen c(CLOCK_50, clk_4); // to generate 4kHz clock using 50MHz clock
button_encoder b(clk_4, KEY, code); // to encode pushbuttons
code_shifter s(clk_4, code, code_MSB); // to shift code out to PCB
HEX_display h(code, HEX0); // to display encoded pushbuttons

endmodule