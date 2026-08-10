/**
 * The HACK computer, including CPU, ROM, RAM and the generator for
 * reset and clk (25MHz) signal. For approx. 20us HACK CPU resets.
 * From this point onward the user is at the mercy of the software.
 * In particular, depending on the program's code, the LED may show
 * some output and the user may be able to interact with the computer
 * via the BUT.
 */

`default_nettype none
module HACK( 
    input CLK,			// external clock 100 MHz	
	input [1:0] BUT,	// user button (0 if pressed, 1 if released)
	output [1:0] LED	// leds (0 off, 1 on)
);

	// Put your code here:

endmodule
