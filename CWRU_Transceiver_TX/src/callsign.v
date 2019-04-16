module callsign(
	input clk, // 4kHz generated clock
	output reg callsign_bit // Morse code signal output
);

/* 
Phong Nguyen's callsign in Morse code
K = _ . _     = 111010111
E = .         = 1
8 = _ _ _ . . = 111011101110101
F = . . _ .   = 101011101
C = _ . _ .   = 11101011101
U = . . _     = 1010111

With 3 spaces between characters, 7 spaces between words,
KE8FCU = (K)111010111 + 000 + (E)1 + 000 + (8)111011101110101 + 
			000 + (F)101011101 + 000 + (C)11101011101 + 000 + (U)1010111 + 0000000

Each character will be stored in its own register
with the required following space included:
K = 111010111000 -> 000111010111 = [11:0]
E = 1000 -> 0001 = [3:0]
8 = 111011101110101000 -> 000101011101110111 = [17:0]
F = 101011101000 -> 000101110101 = [11:0]
C = 11101011101000 -> 00010111010111 = [13:0]
U = 10101110000000 -> 00000001110101 = [13:0]
Note that the endianness of the bits have to be flipped to 
accomodate for the direction of the bit counter
*/

reg [11:0] reg_K;
reg [3:0]  reg_E;
reg [17:0] reg_8;
reg [11:0] reg_F;
reg [13:0] reg_C;
reg [13:0] reg_U;

reg [4:0] bit_counter; // inner counter to track current bit of a character
reg [2:0] char_counter; // outer counter to track current character

initial
begin
	reg_K = 12'b000111010111;
	reg_E = 4'b0001;
	reg_8 = 18'b000101011101110111;
	reg_F = 12'b000101110101;
	reg_C = 14'b00010111010111;
	reg_U = 14'b00000001110101;
	bit_counter = 5'b00000;
	char_counter = 3'b000;
	callsign_bit = 1'b0;
end

always @(posedge clk) // transmit at 4kHz
begin
	if (char_counter == 3'b000) // corresponding to K
	begin
		if (bit_counter == 5'b01011)
		begin // reset bit and increment char at bit = 11
			bit_counter = 5'b11111;
			char_counter = char_counter + 3'b001;
		end
		else
			callsign_bit = reg_K[bit_counter];
	end
	
	else if (char_counter == 3'b001) // corresponding to E
	begin
		if (bit_counter == 5'b00011)
		begin // reset bit and increment char at bit = 3
			bit_counter = 5'b11111;
			char_counter = char_counter + 3'b001;
		end
		else
			callsign_bit = reg_E[bit_counter];
	end
	
	else if (char_counter == 3'b010) // corresponding to 8
	begin
		if (bit_counter == 5'b10001)
		begin // reset bit and increment char at bit = 17
			bit_counter = 5'b11111;
			char_counter = char_counter + 3'b001;
		end
		else
			callsign_bit = reg_8[bit_counter];
	end
	
	else if (char_counter == 3'b011) // corresponding to F
	begin
		if (bit_counter == 5'b01011)
		begin // reset bit and increment char at bit = 11
			bit_counter = 5'b11111;
			char_counter = char_counter + 3'b001;
		end
		else
			callsign_bit = reg_F[bit_counter];
	end
	
	else if (char_counter == 3'b100) // corresponding to C
	begin
		if (bit_counter == 5'b01101)
		begin // reset bit and increment char at bit = 13
			bit_counter = 5'b11111;
			char_counter = char_counter + 3'b001;
		end
		else
			callsign_bit = reg_C[bit_counter];
	end
	
	else if (char_counter == 3'b101) // corresponding to U
	begin
		if (bit_counter == 5'b01101)
		begin // reset bit and char at bit = 13
			bit_counter = 5'b11111;
			char_counter = 3'b000;
		end
		else
			callsign_bit = reg_U[bit_counter];
	end
	bit_counter = bit_counter + 5'b00001; // always increment bit 
end

endmodule