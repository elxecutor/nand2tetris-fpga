/**
* Tristate Buffer (16 bit)
*
* if (dir == 0) IN: PIN are set to High-Z, dataR = external PIN
* if (dir == 1) OUTPUT: dataW is output to external PIN, dataR = dataW
*/
`default_nettype none

module InOut(
	inout [15:0] PIN,
	input [15:0] dataW,
	output [15:0] dataR,
	input dir
);
	// No need to implement this chip.
	// This chip is implemented using tristate value z
	assign PIN = dir? dataW: 16'bzzzzzzzzzzzzzzzz;
	assign dataR = PIN;
	
endmodule
