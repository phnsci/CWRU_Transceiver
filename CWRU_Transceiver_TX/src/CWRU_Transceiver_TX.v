module CWRU_Transceiver_TX(input clk_50, output [35:0] GPIO_1);

wire clk_4;

assign GPIO_1[17] = clk_4;

clk_4_gen c (clk_50, clk_4);
//button_input b (clk_4, code);
//LED_display d (clk_4, code);

endmodule