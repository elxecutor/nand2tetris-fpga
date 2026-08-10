/**
 * instruction memory at boot time 
 * The instruction memory is read only (ROM) and
 * preloaded with 256 x 16bit of Hackcode holding the bootloader.
 * 
 * instruction = ROM[pc]
 */

`default_nettype none
module ROM(
	input [15:0] pc,
	output [15:0] instruction		
);

	// No need to implement this chip
	// The file ROM.BIN holds the hack code 
	parameter ROMFILE = "ROM.hack";
	
	reg [15:0] mem [0:65535];
	assign instruction = mem[pc];
	
	initial begin
		$readmemb(ROMFILE,mem);
	end

endmodule
