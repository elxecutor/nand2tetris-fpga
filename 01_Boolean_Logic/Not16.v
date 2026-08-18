/**
 * 16-bit Not:
 * for i=0..15: out[i] = not in[i]
 */

`default_nettype none
module Not16(
	input [15:0] in,
	output [15:0] out
);

	// Put your code here:
	genvar i;
	generate
		for (i = 0; i <= 15; i++) begin
			nand(out[i], in[i], in[i]);
		end
	endgenerate
endmodule
