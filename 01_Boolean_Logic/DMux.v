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
	wire n_sel;
	Not U1(.in(sel), .out(n_sel));
	And U2(.a(in), .b(n_sel), .out(a));
	And U3(.a(in), .b(sel), .out(b));
endmodule
