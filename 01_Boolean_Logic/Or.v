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

	Nand U1(.a(a), .b(a), .out(n_a));
	Nand U2(.a(b), .b(b), .out(n_b));
	Nand U3(.a(n_a), .b(n_b), .out(out));
endmodule
