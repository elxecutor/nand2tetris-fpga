/**
 * Computes the sum of three bits.
 */

`default_nettype none
module FullAdder(
	input a,		//1-bit input
	input b,		//1-bit input
	input c,		//1-bit input
	output sum,		//Right bit of a + b + c
	output carry	//Left bit of a + b + c
);

	// Put your code here:
	wire sum1, carry1, carry2;
	HalfAdder ha1(.a(a), .b(b), .sum(sum1), .carry(carry1));
	HalfAdder ha2(.a(sum1), .b(c), .sum(sum), .carry(carry2));
	assign carry = carry1 | carry2;

endmodule
