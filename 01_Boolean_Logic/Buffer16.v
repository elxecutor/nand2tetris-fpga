/**
 * 16-bit bitwise Buffer:
 * for i = 0..15: out[i] = in[i]
 */

`default_nettype none
module Buffer16(
	input [15:0] in,
	output [15:0] out
);

	// Put your code here:
	wire [15:0] n_in;
	genvar i;
	generate
		for (i=0;i<=15;i++) begin
			nand(n_in[i], in[i], in[i]);
			nand(out[i], n_in[i], n_in[i]);
		end
	endgenerate

endmodule
