/**
 * The complete address space of the Hack computer's memory,
 * including RAM and memory-mapped I/O. 
 * The chip facilitates read and write operations, as follows:
 *     Read:  out(t) = Memory[address(t)](t)
 *     Write: if load(t-1) then Memory[address(t-1)](t) = in(t-1)
 * In words: the chip always outputs the value stored at the memory 
 * location specified by address. If load==1, the in value is loaded 
 * into the memory location specified by address. This value becomes 
 * available through the out output from the next time step onward.
 * Address space rules:
 * RAM 0x0000 - 0x0EFF (3840 words)
 * IO  0x1000 - 0x100F (maps to 16 different devices)
 * The behavior of IO addresses is described in 06_IO-Devices
 */

`default_nettype none
module Memory(
	input [15:0] address,
	input load,
	output [15:0] out,
	output loadRAM,
	output loadIO0,
	output loadIO1,
	output loadIO2,
	output loadIO3,
	output loadIO4,
	output loadIO5,
	output loadIO6,
	output loadIO7,
	output loadIO8,
	output loadIO9,
	output loadIOA,
	output loadIOB,
	output loadIOC,
	output loadIOD,
	output loadIOE,
	output loadIOF,
	input [15:0] inRAM,
	input [15:0] inIO0,
	input [15:0] inIO1,
	input [15:0] inIO2,
	input [15:0] inIO3,
	input [15:0] inIO4,
	input [15:0] inIO5,
	input [15:0] inIO6,
	input [15:0] inIO7,
	input [15:0] inIO8,
	input [15:0] inIO9,
	input [15:0] inIOA,
	input [15:0] inIOB,
	input [15:0] inIOC,
	input [15:0] inIOD,
	input [15:0] inIOE,
	input [15:0] inIOF
);

	// Put your code here:

endmodule
