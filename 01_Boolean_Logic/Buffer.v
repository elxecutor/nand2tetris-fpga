/**
 * Buffer:
 * out = in
 */

`default_nettype none
module Buffer(
	input in,
	output out
);

	// Put your code here:
	wire n_in;

	nand(n_in, in, in);
	nand(out, n_in, n_in);
endmodule
