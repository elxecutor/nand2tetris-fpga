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

	Not U1(.in(in), .out(n_in));
	Not U2(.in(n_in), .out(out));
endmodule
