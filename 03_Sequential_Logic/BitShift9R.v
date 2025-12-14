/**
* 9 bit Shiftregister (shifts to right)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]>>1 | (inMSB<<8)
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

	// Put your code here:
	reg [8:0] out_reg;
	always @(posedge clk) begin
		if (load) out_reg <= in;
		else if (shift) out_reg <= {inMSB, out_reg[8:1]};
		else out_reg <= out_reg;
	end
	assign out = out_reg;

endmodule
