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

	// No need to implement this chip
	// This chip is implemented in verilog using reg-variables
	reg out_reg;
	always @(posedge clk)
		out_reg <= in;
	assign out = out_reg;

endmodule
