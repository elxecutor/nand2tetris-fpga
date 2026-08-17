/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

`default_nettype none
module DMux(
	input in,
	input sel,
    output a,
	output b
);

	// Put your code here:
	wire n_sel, in_n_sel, in_sel;
	nand(n_sel, sel, sel);
	nand(in_n_sel, in, n_sel);
	nand(a, in_n_sel, in_n_sel);
	nand(in_sel, in, sel);
	nand(b, in_sel, in_sel);
endmodule
