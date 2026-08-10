/**
 * UartRX receives bytes over UART
 *
 * When clear = 1 the chip clears the receive buffer and is ready to receive
 * next byte. out[15] is set to 1 to show, that chip is ready to receive next
 * byte. When RX goes low the chip starts sampling the RX line. After reading
 * of byte completes, chip ouputs the received byte to out[7:0]] with out[15]=0.
 */
`default_nettype none

module UartRX(
	input clk,
	input clear,
	input RX,
	output [15:0] out
);
	
	// Put your code here:

endmodule
