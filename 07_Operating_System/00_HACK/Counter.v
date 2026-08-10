/**
 * A 16-bit counter with reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */

`default_nettype none
module Counter(
	input clk,
	input inc,
	input reset,
	output [15:0] out
);
	reg [15:0] out=0;
	always @(posedge clk)
		out <= reset?0:(inc?out+1:out);

endmodule
