/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

`default_nettype none
module And(
	input a,
	input b,
	output out
);
	// Put your code here:
	wire n_ab;

	Nand U1(.a(a), .b(b), .out(n_ab));
	Nand U2(.a(n_ab), .b(n_ab), .out(out));
endmodule
