/**
* 8-bit Shiftregister (shifts to left)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]<<1 | inLSB
* (shift one position to left and insert inLSB as least significant bit)
*/

`default_nettype none
module BitShift8L(
	input clk,
	input [7:0] in,
	input inLSB,
	input load,
	input shift,
	output [7:0] out
);

	// Put your code here:
	wire [7:0] next_out;
	assign next_out[0] = load ? in[0] : (shift ? inLSB : out[0]);
	assign next_out[1] = load ? in[1] : (shift ? out[0] : out[1]);
	assign next_out[2] = load ? in[2] : (shift ? out[1] : out[2]);
	assign next_out[3] = load ? in[3] : (shift ? out[2] : out[3]);
	assign next_out[4] = load ? in[4] : (shift ? out[3] : out[4]);
	assign next_out[5] = load ? in[5] : (shift ? out[4] : out[5]);
	assign next_out[6] = load ? in[6] : (shift ? out[5] : out[6]);
	assign next_out[7] = load ? in[7] : (shift ? out[6] : out[7]);
	DFF dff0(.clk(clk), .in(next_out[0]), .out(out[0]));
	DFF dff1(.clk(clk), .in(next_out[1]), .out(out[1]));
	DFF dff2(.clk(clk), .in(next_out[2]), .out(out[2]));
	DFF dff3(.clk(clk), .in(next_out[3]), .out(out[3]));
	DFF dff4(.clk(clk), .in(next_out[4]), .out(out[4]));
	DFF dff5(.clk(clk), .in(next_out[5]), .out(out[5]));
	DFF dff6(.clk(clk), .in(next_out[6]), .out(out[6]));
	DFF dff7(.clk(clk), .in(next_out[7]), .out(out[7]));

endmodule
