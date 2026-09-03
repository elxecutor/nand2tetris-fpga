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
	wire n_sel, t1, t2;
	Not U1(.in(sel), .out(n_sel));
	And U2(.a(a), .b(n_sel), .out(t1));
	And U3(.a(b), .b(sel), .out(t2));
	Or U4(.a(t1), .b(t2), .out(out));
endmodule
