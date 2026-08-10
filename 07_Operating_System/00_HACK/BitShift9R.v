/**
* 10 bit Shiftregister (shifts to right)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]>>1 | (inMSB<<9)
* (shift one position to right and insert inMSB as most significant bit)
*/

`default_nettype none
module BitShift9R(
	input clk,
	input [8:0] in,
	input inMSB,
	input load,
	input shift,
	output [8:0] out
);

	reg [8:0] out = 0;
	always @(posedge clk)
		out <= load?in:(shift?{inMSB,out[8:1]}:out);

endmodule
