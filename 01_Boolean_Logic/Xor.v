/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

`default_nettype none
module Xor(
	input a,
	input b,
	output out
);

	// Put your code here:
	wire n_a, n_b, t1, t2;
	nand(n_a, a, a);
	nand(n_b, b, b);
	nand(t1, n_a, b);
	nand(t2, n_b, a);
	nand(out, t1, t2);
endmodule
