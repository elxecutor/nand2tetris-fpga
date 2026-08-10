/**
* Data-Flip-Flop
* out[t+1] = in[t]
*/

`default_nettype none
module DFF(
		input clk,
		input in,
		output out
);

	// No need to implement this module
	// This module is implemented in verilog using reg-variables
	reg out=0;
	always @(posedge clk)
		if (in) out <= 1'b1;
		else out <= 1'b0;

endmodule

