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
	genvar i;
	generate
		for (i = 0; i <= 15; i++) begin
			Buffer U1(.in(in), .out(out));
		end
	endgenerate
endmodule
