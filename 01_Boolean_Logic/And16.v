/**
 * 16-bit bitwise And:
 * for i = 0..15: out[i] = (a[i] and b[i])
 */

`default_nettype none
module And16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);

	// Put your code here:
	wire [15:0] n_ab;

	genvar i;
	generate
		for (i=0;i<=15;i++) begin
			And U1(.a(a[i]), .b(b[i]), .out(out[i]));
		end
	endgenerate

endmodule
