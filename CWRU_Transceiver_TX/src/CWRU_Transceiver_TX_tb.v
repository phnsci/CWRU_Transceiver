`timescale 1 ns / 100 ps

module CWRU_Transceiver_TX_tb();

// inputs to the UUT are reg type
reg CLK;
reg [3:0] KEY;
reg [9:0] SW;

// outputs of the UUT are wire type
wire [35:0] GPIO_1;
wire [6:0] HEX0;

// instantiate the Unit Under Test (UUT)
CWRU_Transceiver_TX UUT(CLK, KEY, SW, GPIO_1, HEX0);

initial begin
	CLK = 1'b0;
	KEY = 4'b1111;
	SW = 10'b1111111111;
	
	// test normal keypresses
	#50000 KEY = 4'b1110; // test KEY[0]
	#250000 KEY = 4'b1111;
	
	#1250000 KEY = 4'b1101; // test KEY[1]
	#250000 KEY = 4'b1111;
	
	#1250000 KEY = 4'b1011; // test KEY[2]
	#250000 KEY = 4'b1111;
	
	#1250000 KEY = 4'b0111; // test KEY[3]
	#250000 KEY = 4'b1111;
	
	// test overlapping keypresses
	#1250000 KEY = 4'b1100; // test KEY[0], KEY[1] simultaneously
	#250000 KEY = 4'b1111;
	
	#1250000 KEY = 4'b1011; // test KEY[2]
	#250000 KEY = 4'b1111;
	
	#125000 KEY = 4'b0111; // test KEY[3] overlapping KEY[2]
	#250000 KEY = 4'b1111;
	
	#1250000 KEY = 4'b0000; // test KEY[3:0]
	#250000 KEY = 4'b1111;
	
	#1250000 KEY = 4'b1101; // test KEY[1]
	#250000 KEY = 4'b1111;
	
	#125000 KEY = 4'b0011; // test KEY[3], KEY[2] simultaneously overlapping KEY[1]
	#250000 KEY = 4'b1111;
	
	#1250000 SW[1] = 0; // test clk output, should override the following pushbutton presses
	
	// test normal keypresses in reverse order
	#1250000 KEY = 4'b0111; // test KEY[3]
	#250000 KEY = 4'b1111;
	
	#1250000 KEY = 4'b1011; // test KEY[2]
	#250000 KEY = 4'b1111;
	
	#250000 SW[0] = 0; // test callsign output, should override all other stimuli
	
	#1250000 KEY = 4'b1101; // test KEY[1]
	#250000 KEY = 4'b1111;
	
	#1250000 KEY = 4'b1110; // test KEY[0]
	#250000 KEY = 4'b1111;
	
	#25000000 $stop;
end


always
	#10 CLK = ~CLK; // generate 50MHz clock signal	
	
endmodule