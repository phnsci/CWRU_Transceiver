module CWRU_Transceiver_TX_tb(input CLOCK_50);

reg [35:0] GPIO_1;

CWRU_Transceiver_TX UUT(CLOCK_50, GPIO_1);

endmodule