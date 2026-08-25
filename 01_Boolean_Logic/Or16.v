/**
 * 16-bit bitwise Or:
 * for i = 0..15: out[i] = (a[i] or b[i])
 */

`default_nettype none
module Or16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);

	// Put your code here:
 	wire [15:0] n_a, n_b;

	genvar i;
	generate
		for (i=0;i<=15;i++) begin		
			nand(n_a[i], a[i], a[i]);
			nand(n_b[i], b[i], b[i]);
			nand(out[i], n_a[i], n_b[i]);
		end
	endgenerate

endmodule
