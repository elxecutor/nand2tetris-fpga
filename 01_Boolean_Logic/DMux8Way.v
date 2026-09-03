/**
 * 8-way demultiplexor:
 * {a, b, c, d, e, f, g, h} = {in, 0, 0, 0, 0, 0, 0, 0} if sel == 000
 *                            {0, in, 0, 0, 0, 0, 0, 0} if sel == 001
 *                            etc.
 *                            {0, 0, 0, 0, 0, 0, 0, in} if sel == 111
 */

`default_nettype none
module DMux8Way(
	input in,
	input [2:0] sel,
    output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output h
);

	// Put your code here:
	wire t1, t2, t3, t4;
	DMux4Way U1(.in(in), .sel(sel[2:1]), .a(t1), .b(t2), .c(t3), .d(t4));

	DMux U2(.in(t1), .sel(sel[0]), .a(a), .b(b));
	DMux U3(.in(t2), .sel(sel[0]), .a(c), .b(d));
	DMux U4(.in(t3), .sel(sel[0]), .a(e), .b(f));
	DMux U5(.in(t4), .sel(sel[0]), .a(g), .b(h));
endmodule
