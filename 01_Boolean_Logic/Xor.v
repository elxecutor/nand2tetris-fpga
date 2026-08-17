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
	wire na, nb, napb, nbpa;
	nand(na, a, a);
	nand(nb, b, b);
	nand(napb, na, b);
	nand(nbpa, nb, a);
	nand(out, nbpa, napb);
endmodule
