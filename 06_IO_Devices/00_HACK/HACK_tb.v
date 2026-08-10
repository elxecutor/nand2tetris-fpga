`timescale 10ns/1ns
`default_nettype none
module HACK_tb();

	// IN,OUT
	reg CLK = 1;
	reg [1:0] BUT = 3;
	wire [1:0] LED;
	wire UART_TX;
	wire UART_RX;
	wire SPI_SDO;
	wire SPI_SDI;
	wire SPI_SCK;
	wire SPI_CSX;
	wire [17:0] SRAM_ADDR;
	wire [15:0] SRAM_DATA;
	wire SRAM_WEX;
	wire SRAM_OEX;
	wire SRAM_CSX;
	wire LCD_DCX;
	wire LCD_SDO;
	wire LCD_SCK;
	wire LCD_CSX;
	reg RTP_SDI;
	wire RTP_SDO;
	wire RTP_SCK;

	// Part
	HACK HACK(
    	.CLK(CLK),					// external clock 100 MHz	
		.BUT(BUT),					// user button  ("pushed down" == 0) ("up" == 1)
		.LED(LED),					// leds (0 off, 1 on)
		.UART_RX(UART_RX),			// UART receive
		.UART_TX(UART_TX),			// UART transmit
		.SPI_SDO(SPI_SDO),			// SPI serial data out 
		.SPI_SDI(SPI_SDI),			// SPI serial data in 
		.SPI_SCK(SPI_SCK),			// SPI serial clock
		.SPI_CSX(SPI_CSX),			// SPI chip select not
		.SRAM_ADDR(SRAM_ADDR),		// SRAM address 18 Bit = 256K
		.SRAM_DATA(SRAM_DATA),		// SRAM data 16 Bit
		.SRAM_WEX(SRAM_WEX),		// SRAM write_enable_not
		.SRAM_OEX(SRAM_OEX),		// SRAM output_enable_not
		.SRAM_CSX(SRAM_CSX), 		// SRAM chip_select_not
		.LCD_DCX(LCD_DCX),			// LCD data/command not
		.LCD_SDO(LCD_SDO),			// LCD serial data out 
		.LCD_SCK(LCD_SCK),			// LCD serial clock
		.LCD_CSX(LCD_CSX),			// LCD chip select not
		.RTP_SDI(RTP_SDI),			// RTP serial data in
		.RTP_SDO(RTP_SDO),			// RTP serial data out in
		.RTP_SCK(RTP_SCK)			// RTP serial clock
	);

	// Simulate
	always #0.5 CLK = ~CLK;
	integer n=0;
	always @(posedge CLK) n=n+1;

	// Compare
	reg [9:0] uart=10'b1111111111;
	reg [15:0] baudrate = 0;
	always @(posedge CLK)
		baudrate <= ((baudrate==866)?0:baudrate+1);
	always @(posedge CLK) begin
		uart <= (n==5000)?((82<<2)+1):(n==15000)?((88<<2)+1):((baudrate==866)?{1'b1,uart[9:1]}:uart);
	end
	wire shift = (baudrate==866);
	assign UART_RX = uart[0];
	
	//Simulate SPI
	reg spi_sleep=1;
	reg [31:0] spi_cmd=0;
	reg [95:0] spi=0;
	assign SPI_SDI = (SPI_CSX | spi_sleep) ? 1'bz:spi[95];
	always @(posedge (SPI_SCK))
		spi <= {spi[95:0],1'b0};
	always @(posedge (SPI_SCK))
		spi_cmd <= {spi_cmd[30:0],SPI_SDO};
	always @(negedge (SPI_CSX))
		spi_cmd <= 0;
	always @(spi_cmd) begin
		if (spi_cmd==32'h000000AB) spi_sleep <= 0;
		if (spi_cmd==32'h000000B9) spi_sleep <= 1;
		if (spi_cmd==32'h03040000) spi <= "SPI! 123";
		if (spi_cmd==32'h03010000) spi <= 96'h1001_FC10_1000_E308_0000_EA87;
	end

	//Simulate SRAM
	reg [16:0] sram[0:7];
	always @(posedge CLK)
		if (~SRAM_WEX&&SRAM_OEX&&~SRAM_CSX) sram[SRAM_ADDR] <= SRAM_DATA;
	assign SRAM_DATA = (~SRAM_CSX&&~SRAM_OEX)?sram[SRAM_ADDR]:16'bzzzzzzzzzzzzzzzz;
	//Simulate LCD
	reg [7:0] lcd_c;
	reg [15:0] lcd_d;
	always @(posedge LCD_SCK) begin
		lcd_c <= (~LCD_DCX)?{lcd_c[6:0],LCD_SDO}:lcd_c;
		lcd_d <= (LCD_DCX)?{lcd_d[6:0],LCD_SDO}:lcd_d;
	end
	always @(negedge LCD_CSX) begin
		lcd_c <= 0;
		lcd_d <= 0;
	end
	//simulate BUT
	always @(posedge CLK) begin
		if (n==10000) BUT<=0;
		if (n==20000) BUT<=1;
		if (n==30000) BUT<=2;
	end

	initial begin
		$dumpfile("HACK_tb.vcd");
  		$dumpvars(0, HACK_tb);
		
		$display("------------------------");
		$display("Testbench: Hack");

		#40000
		$finish;
	end

endmodule
