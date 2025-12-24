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

	// Put your code here:
	wire [15:0] mux_out;
	Mux16 mux(.a(out), .b(in), .sel(load), .out(mux_out));
	DFF dff0(.clk(clk), .in(mux_out[0]), .out(out[0]));
	DFF dff1(.clk(clk), .in(mux_out[1]), .out(out[1]));
	DFF dff2(.clk(clk), .in(mux_out[2]), .out(out[2]));
	DFF dff3(.clk(clk), .in(mux_out[3]), .out(out[3]));
	DFF dff4(.clk(clk), .in(mux_out[4]), .out(out[4]));
	DFF dff5(.clk(clk), .in(mux_out[5]), .out(out[5]));
	DFF dff6(.clk(clk), .in(mux_out[6]), .out(out[6]));
	DFF dff7(.clk(clk), .in(mux_out[7]), .out(out[7]));
	DFF dff8(.clk(clk), .in(mux_out[8]), .out(out[8]));
	DFF dff9(.clk(clk), .in(mux_out[9]), .out(out[9]));
	DFF dff10(.clk(clk), .in(mux_out[10]), .out(out[10]));
	DFF dff11(.clk(clk), .in(mux_out[11]), .out(out[11]));
	DFF dff12(.clk(clk), .in(mux_out[12]), .out(out[12]));
	DFF dff13(.clk(clk), .in(mux_out[13]), .out(out[13]));
	DFF dff14(.clk(clk), .in(mux_out[14]), .out(out[14]));
	DFF dff15(.clk(clk), .in(mux_out[15]), .out(out[15]));

endmodule
