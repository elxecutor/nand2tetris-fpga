/**
 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */

`default_nettype none
module PC(
	input clk,
	input [15:0] in,
	input load,
	input inc,
	input reset,
	output [15:0] out
);	
	
	// Put your code here:
	reg [15:0] out_reg;
	always @(posedge clk) begin
		if (reset) out_reg <= 16'b0;
		else if (load) out_reg <= in;
		else if (inc) out_reg <= out_reg + 1;
		else out_reg <= out_reg;
	end
	assign out = out_reg;

endmodule
