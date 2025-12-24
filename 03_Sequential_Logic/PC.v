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
	wire [15:0] inc_out, load_mux_out, reset_mux_out, pc_next;
	Inc16 inc(.in(out), .out(inc_out));
	Mux16 inc_mux(.a(out), .b(inc_out), .sel(inc), .out(load_mux_out));
	Mux16 load_mux(.a(load_mux_out), .b(in), .sel(load), .out(reset_mux_out));
	Mux16 reset_mux(.a(reset_mux_out), .b(16'b0), .sel(reset), .out(pc_next));
	DFF dff0(.clk(clk), .in(pc_next[0]), .out(out[0]));
	DFF dff1(.clk(clk), .in(pc_next[1]), .out(out[1]));
	DFF dff2(.clk(clk), .in(pc_next[2]), .out(out[2]));
	DFF dff3(.clk(clk), .in(pc_next[3]), .out(out[3]));
	DFF dff4(.clk(clk), .in(pc_next[4]), .out(out[4]));
	DFF dff5(.clk(clk), .in(pc_next[5]), .out(out[5]));
	DFF dff6(.clk(clk), .in(pc_next[6]), .out(out[6]));
	DFF dff7(.clk(clk), .in(pc_next[7]), .out(out[7]));
	DFF dff8(.clk(clk), .in(pc_next[8]), .out(out[8]));
	DFF dff9(.clk(clk), .in(pc_next[9]), .out(out[9]));
	DFF dff10(.clk(clk), .in(pc_next[10]), .out(out[10]));
	DFF dff11(.clk(clk), .in(pc_next[11]), .out(out[11]));
	DFF dff12(.clk(clk), .in(pc_next[12]), .out(out[12]));
	DFF dff13(.clk(clk), .in(pc_next[13]), .out(out[13]));
	DFF dff14(.clk(clk), .in(pc_next[14]), .out(out[14]));
	DFF dff15(.clk(clk), .in(pc_next[15]), .out(out[15]));

endmodule
