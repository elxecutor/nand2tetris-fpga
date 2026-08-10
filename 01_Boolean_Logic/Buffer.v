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
	wire inter;

	nand(inter, in, in);
	nand(out, inter, inter);
endmodule
