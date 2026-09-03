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
	Not U1(.in(a), .out(n_a));
	Not U2(.in(b), .out(n_b));
	And U3(.a(n_a), .b(b), .out(t1));
	And U4(.a(a), .b(n_b), .out(t2));
	Or U5(.a(t1), .b(t2), .out(out));
endmodule
