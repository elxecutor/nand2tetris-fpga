/**
 * Not gate:
 * out = not in
 */

`default_nettype none
module Not(
	input in,
	output out
);

	// Put your code here:
	nand(out, in, in);
endmodule
