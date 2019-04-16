`timescale 1 ns / 100 ps

module CWRU_Transceiver_RX_tb();

// inputs to the UUT are reg type
reg CLK;
reg [35:0] GPIO_1;

// outputs of the UUT are wire type
wire [6:0] HEX0;

CWRU_Transceiver_RX UUT(CLK, GPIO_1, HEX0);

initial begin
	CLK = 1'b0;
	GPIO_1[15] = 1'b0;

	// test KEY[0] transmission
	#250000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#1750000;
	// 10000000
	
	// test KEY[1] transmission
	#500000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#250000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#1250000;
	// 10100000
	
	// test KEY[2] transmission
	#500000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#250000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#250000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#750000;
	// 10101000
	
	// test KEY[3] transmission
	#500000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#250000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#250000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#250000 GPIO_1[15] = 1'b1;
	#250000 GPIO_1[15] = 1'b0;
	#2500000 $stop;
	// 10101010
end

always
	#10 CLK = ~CLK; // generate 50MHz clock signal

endmodule