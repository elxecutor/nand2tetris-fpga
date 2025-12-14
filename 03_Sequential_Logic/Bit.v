/**
 * 1-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 *    else out does not change (out[t+1] = out[t])
 */

`default_nettype none
module Bit(
	input clk,
	input in,
	input load,
	output out
);

	// Put your code here:
	wire mux_out;
	Mux m(.a(out), .b(in), .sel(load), .out(mux_out));
	DFF d(.clk(clk), .in(mux_out), .out(out));

endmodule
