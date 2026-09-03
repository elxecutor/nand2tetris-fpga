/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

`default_nettype none
module Mux16(
	input [15:0] a,
	input [15:0] b,
   	input sel,
	output [15:0] out
);

	// Put your code here:	
	genvar i;
	generate
		for (i=0;i<=15;i++) begin
			Mux U1(.a(a[i], .b(b[i]), .sel(sel), .out(out[i])));
		end
	endgenerate
endmodule
