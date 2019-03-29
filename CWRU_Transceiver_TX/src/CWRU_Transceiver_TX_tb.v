`timescale 1 ns / 100 ps

module CWRU_Transceiver_TX_tb();

// input to the UUT are reg type
reg CLK;
reg [3:0] KEY;

// output of the UUT are wire type
wire [35:0] GPIO_1;
wire [6:0] HEX0;

initial
begin
	CLK = 0;
	KEY = 4'b1111;
	#200000 KEY = 4'b1110; // test KEY[0]
	#250000 KEY = 4'b1111;
	#250000 KEY = 4'b1101; // test KEY[1]
	#250000 KEY = 4'b1111;
	#250000 KEY = 4'b1011; // test KEY[2]
	#250000 KEY = 4'b1111;
	#250000 KEY = 4'b0111; // test KEY[3]
	#250000 KEY = 4'b1111;
	#250000 $stop;
end

// instantiate the Unit Under Test (UUT)
CWRU_Transceiver_TX UUT(CLK, KEY, GPIO_1, HEX0);

always
	#10 CLK = ~CLK; // generate 50MHz clock signal	
	
endmodule