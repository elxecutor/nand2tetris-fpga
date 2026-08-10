/**
 * 16-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 * else out does not change
 */

`default_nettype none

module Register(
	input clk,
	input [15:0] in,
	input load,
	output [15:0] out
);
	reg [15:0] out = 0;
	always @(posedge clk)
		out <= load?in:out;
	initial out = 0;
endmodule
