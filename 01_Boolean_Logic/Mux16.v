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
	wire n_sel;
	wire [15:0] a_n_sel, b_sel;
	
	nand(n_sel, sel, sel);
	
	genvar i;
	generate
		for (i=0;i<=15;i++) begin
			nand(a_n_sel[i], a[i], n_sel);
			nand(b_sel[i], b[i], sel);
			nand(out[i], a_n_sel[i], b_sel[i]);
		end
	endgenerate
endmodule
