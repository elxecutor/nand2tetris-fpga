 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

`default_nettype none
module Or(
	input a,
	input b,
	output out
);
	// Put your code here:
 	wire n_a, n_b;

	nand(n_a, a, a);
	nand(n_b, b, b);
	nand(out, n_a, n_b);
endmodule
