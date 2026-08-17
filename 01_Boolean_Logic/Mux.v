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
	wire nsel, a_nsel, b_sel;
	nand(nsel, sel, sel);
	nand(a_nsel, a, nsel);
	nand(b_sel, b, sel);
	nand(out, a_nsel, b_sel);
endmodule
