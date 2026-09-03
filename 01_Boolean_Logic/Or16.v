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
			Or U1(.a(a[i]), .b(b[i]), .out(out[i]));
		end
	endgenerate

endmodule
