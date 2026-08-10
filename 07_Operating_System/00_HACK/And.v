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
	and(out,a,b);

endmodule
