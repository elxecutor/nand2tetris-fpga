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
	Bit b0(.clk(clk), .in(in[0]), .load(load), .out(out[0]));
	Bit b1(.clk(clk), .in(in[1]), .load(load), .out(out[1]));
	Bit b2(.clk(clk), .in(in[2]), .load(load), .out(out[2]));
	Bit b3(.clk(clk), .in(in[3]), .load(load), .out(out[3]));
	Bit b4(.clk(clk), .in(in[4]), .load(load), .out(out[4]));
	Bit b5(.clk(clk), .in(in[5]), .load(load), .out(out[5]));
	Bit b6(.clk(clk), .in(in[6]), .load(load), .out(out[6]));
	Bit b7(.clk(clk), .in(in[7]), .load(load), .out(out[7]));
	Bit b8(.clk(clk), .in(in[8]), .load(load), .out(out[8]));
	Bit b9(.clk(clk), .in(in[9]), .load(load), .out(out[9]));
	Bit b10(.clk(clk), .in(in[10]), .load(load), .out(out[10]));
	Bit b11(.clk(clk), .in(in[11]), .load(load), .out(out[11]));
	Bit b12(.clk(clk), .in(in[12]), .load(load), .out(out[12]));
	Bit b13(.clk(clk), .in(in[13]), .load(load), .out(out[13]));
	Bit b14(.clk(clk), .in(in[14]), .load(load), .out(out[14]));
	Bit b15(.clk(clk), .in(in[15]), .load(load), .out(out[15]));

endmodule
