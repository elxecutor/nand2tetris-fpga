/**
 * The special function register RTP receives bytes from the touch panel
 * controller AR1021.
 * 
 * When load=1 transmission of byte in[7:0] is initiated. The byte is send to
 * SDO bitwise together with 8 clock signals on SCK. At the same time RTP
 * receives a byte at SDI. During transmission out[15] is 1. The transmission
 * of a byte takes 256 clock cycles (32 cycles for each bit to achieve a slower
 * transfer rate). Every 32 clock cycles one bit is shifted out. In the middle
 * of each bit at counter number 31 the bit SDI is sampled. When transmission
 * is completed out[15]=0 and RTP outputs the received byte to out[7:0].
 */
`default_nettype none

module RTP(
	input clk,
	input load,
	input [15:0] in,
	output [15:0] out,
	output SDO,
	input SDI,
	output SCK
);

	// Put your code here:

endmodule
