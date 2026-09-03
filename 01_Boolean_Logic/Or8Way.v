/**
 * 8-way Or: 
 * out = (in[0] or in[1] or ... or in[7])
 */

`default_nettype none
module Or8Way(
	input [7:0] in,
	output out
);

	// Put your code here:
	wire [3:0] t1;
	wire [1:0] t2;
	
	Or U1(.a(in[0]), .b(in[1]), .out(t1[0]));
	Or U2(.a(in[2]), .b(in[3]), .out(t1[1]));
	Or U3(.a(in[4]), .b(in[5]), .out(t1[2]));
	Or U4(.a(in[6]), .b(in[7]), .out(t1[3]));

	Or U5(.a(t1[0]), .b(t1[1]), .out(t2[0]));
	Or U6(.a(t1[2]), .b(t1[3]), .out(t2[1]));

	Or U7(.a(t2[0]), .b(t2[1]), .out(out));
endmodule
