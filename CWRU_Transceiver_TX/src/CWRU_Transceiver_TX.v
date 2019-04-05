module CWRU_Transceiver_TX(
	// for simulation
	output clk_4_out,
	output code_MSB_out,
	output [7:0] code_reg, // code register
	output [2:0] counter, // counter to reset at 8
	output shift_flag, // to control code input flow
	
	// non-simulation
	input CLOCK_50, // 50MHz clock from on-board oscillator
	input [3:0] KEY, // pushbutton inputs from board
	output [35:0] GPIO_1, // GPIO_1 pin outputs
	output [6:0] HEX0 // 7-segment display
);

wire clk_4, code_MSB;
wire [7:0] code;

assign GPIO_1[17] = code_MSB; // GPIO pin 20 outputs code at 4kHz

// for simulation
assign clk_4_out = clk_4;
assign code_MSB_out = code_MSB;

clk_4_gen c(CLOCK_50, clk_4);

// for simulation
code_shift s(code_reg, counter, shift_flag, clk_4, code, code_MSB);

// non-simulation
//code_shift s(clk_4, code, code_MSB);

button_input b(clk_4, KEY, code);

HEX_display d(code, HEX0);

endmodule