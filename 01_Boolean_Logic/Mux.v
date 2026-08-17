/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

`default_nettype none
module Mux(
	input a,
	input b,
	input sel,
	output out
);

	// Put your code here:
	wire n_sel, a_n_sel, b_sel;
	nand(n_sel, sel, sel);
	nand(a_n_sel, a, n_sel);
	nand(b_sel, b, sel);
	nand(out, a_n_sel, b_sel);
endmodule
