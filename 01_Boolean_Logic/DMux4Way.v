/**
 * 4-way demultiplexor:
 * {a, b, c, d} = {in, 0, 0, 0} if sel == 00
 *                {0, in, 0, 0} if sel == 01
 *                {0, 0, in, 0} if sel == 10
 *                {0, 0, 0, in} if sel == 11
 */

`default_nettype none
module DMux4Way(
	input in,
	input [1:0] sel,
    output a,
	output b,
	output c,
	output d
);
	
	// Put your code here:
	wire t1, t2;
	DMux U1(.in(in), .sel(sel[1]), .a(t1), .b(t2));

	DMux U2(.in(t1), .sel(sel[0]), .a(a), .b(b));
	DMux U3(.in(t2), .sel(sel[0]), .a(c), .b(d));
endmodule
