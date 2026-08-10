/**
 * The HACK computer, including CPU, ROM and RAM.
 * When RST is 1, the program stored in the computer's ROM executes.
 * When RST is 0, the execution of the program restarts. 
 * Thus, to start a program's execution, reset must be pushed "down" (0)
 * and "up" (1). From this point onward the user is at the mercy of 
 * the software. In particular, depending on the program's code, the 
 * LED may show some output and the user may be able to interact 
 * with the computer via the BUT.
 */

`default_nettype none
module HACK( 
    input  CLK,				// external clock 100 MHz	
	input  [1:0] BUT,		// user button  ("pushed down" == 0) ("up" == 1)
	output [1:0] LED,		// leds (0 off, 1 on)
	input  UART_RX,			// UART recieve
	output UART_TX,			// UART transmit
	output SPI_SDO,			// SPI data out
	input  SPI_SDI,			// SPI data in
	output SPI_SCK,			// SPI serial clock
	output SPI_CSX,			// SPI chip select not
	output [17:0] SRAM_ADDR,// SRAM address 18 Bit = 256K
	inout [15:0] SRAM_DATA,	// SRAM data 16 Bit
	output SRAM_WEX,		// SRAM write_enable_not
	output SRAM_OEX,		// SRAM output_enable_not
	output SRAM_CSX, 		// SRAM chip_select_not
	output LCD_DCX,			// LCD data/command not
	output LCD_SDO,			// LCD data out 
	output LCD_SCK,			// LCD serial clock
	output LCD_CSX,			// LCD chip select not
	input  RTP_SDI,			// RTP data in s
	output RTP_SDO,			// RTP data out 
	output RTP_SCK			// RTP serial clock
);

	// Put your code here:

endmodule
