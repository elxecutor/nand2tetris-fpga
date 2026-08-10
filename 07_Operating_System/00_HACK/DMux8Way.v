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

	assign a = (sel==0)?in:0;
	assign b = (sel==1)?in:0;
	assign c = (sel==2)?in:0;
	assign d = (sel==3)?in:0;
	assign e = (sel==4)?in:0;
	assign f = (sel==5)?in:0;
	assign g = (sel==6)?in:0;
	assign h = (sel==7)?in:0;
	
endmodule
