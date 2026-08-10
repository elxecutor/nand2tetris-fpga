/**
 * SPI controller for W25Q16BV
 * 
 * When load=1 transmission of byte in[7:0] is initiated. The byte is send to
 * MOSI (master out slave in) bitwise together with 8 clock signals on SCK.
 * At the same time the SPI recieves a byte at MISO (master in slave out).
 * Sampling of MISO is done at rising edge of SCK and shiftingis done at
 */ 
`default_nettype none

module SPI(
	input clk,
	input load,
	input [15:0] in,
	output [15:0] out,
	output CSX,
	output SDO,
	input SDI,
	output SCK
);

	// Put your code here:	

endmodule
