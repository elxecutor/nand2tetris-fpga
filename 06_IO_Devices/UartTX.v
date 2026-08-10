/**
 * UartTX controls transmission of bytes over UART.
 *
 * When load = 1 the chip starts serial transmission of the byte in[7:0] to the
 * TX line according to the protocoll 8N1 with 115200 baud. During transmission
 * out[15] is set to high (busy). The transmission is finished after 2170 clock 
 * cycles (10 byte a 217 cycle each). When transmission completes out[15] goes
 * low again (ready). 
 */
`default_nettype none
module UartTX(
	input clk,
	input load,
	input [15:0] in,
	output TX,
	output [15:0] out
);

	// Put your code here:

endmodule
