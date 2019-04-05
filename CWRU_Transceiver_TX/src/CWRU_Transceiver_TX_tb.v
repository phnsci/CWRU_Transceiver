`timescale 1 ns / 100 ps

module CWRU_Transceiver_TX_tb();

// input to the UUT are reg type
reg CLK;
reg [3:0] KEY;

// output of the UUT are wire type
wire clk_4_out;
wire code_MSB_out;
wire [7:0] code_reg; // code register
wire [2:0] counter; // counter to reset at 8
wire shift_flag; // to control code input flow
wire [35:0] GPIO_1;
wire [6:0] HEX0;

// instantiate the Unit Under Test (UUT)
CWRU_Transceiver_TX UUT(clk_4_out, code_MSB_out, code_reg, counter, shift_flag, CLK, KEY, GPIO_1, HEX0);

initial
begin
	CLK = 1'b0;
	KEY = 4'b1111;
	
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
	
	#1250000 $stop;
end


always
	#10 CLK = ~CLK; // generate 50MHz clock signal	
	
endmodule