/**
 * SRAM controller:
 * If load[t] == 1 then out[t+1] = in[t]
 *                      OEX[t+1] = 1
 *                      WEX[t+1] = 0
 *                      DATA[t+1] = in[t] (DATA is configured as output)
 * At any other time:
 * out = DATA (DATA is configured as input)
 * CSX =0;
 */
`default_nettype none
module SRAM_D(
	input clk,
	input load,
	input [15:0] in,
	output [15:0] out,
	inout [15:0] DATA,	// SRAM data 16 Bit
	output CSX, 		// SRAM chip_enable_not
	output OEX,		// SRAM output_enable_not
	output WEX			// SRAM write_enable_not
);
	
	// Put your code here:

endmodule
