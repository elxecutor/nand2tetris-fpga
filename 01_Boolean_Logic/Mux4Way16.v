/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 00
 *                        b[i] if sel == 01
 *						  c[i] if sel == 10
 *						  d[i] if sel == 11
 */

`default_nettype none
module Mux4Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
   	input [1:0] sel,
	output [15:0] out
);
	
	// Put your code here:
	wire [15:0] t1, t2;
	Mux16 m1(a, b, sel[0], t1);
	Mux16 m2(c, d, sel[0], t2);
	Mux16 m3(t1, t2, sel[1], out);

endmodule
