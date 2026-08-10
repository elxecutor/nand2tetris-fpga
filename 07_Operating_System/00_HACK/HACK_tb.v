`timescale 10ns/1ns
`default_nettype none
module HACK_tb();

reg CLK = 0;
reg  [1:0] BUT = 3;
wire [1:0] LED;
wire RX,TX;
wire LCD_DCX,LCD_SDO,LCD_SCK,LCD_CSX;
wire RTP_SDI;
wire RTP_SCK,RTP_SDO;

HACK HACK(
	.CLK(CLK),
	.BUT(BUT),
    .LED(LED),
	.UART_RX(RX),
	.UART_TX(TX),
	.LCD_DCX(LCD_DCX),
	.LCD_SDO(LCD_SDO),
	.LCD_SCK(LCD_SCK),
	.LCD_CSX(LCD_CSX),
	.RTP_SDO(RTP_SDO),
	.RTP_SDI(RTP_SDI),
	.RTP_SCK(RTP_SCK)
);

always #0.5 CLK = ~CLK;

//Simulate UART
reg [9:0] uart = 10'b1111111111;
reg [15:0] baudrate = 0;
always @(posedge CLK)
	baudrate <= (baudrate==866)?0:baudrate+1;
always @(posedge CLK)
	if (baudrate==0) uart <= {1'b1,uart[9:1]};
assign RX = uart[0];
	//Simulate RTP
	reg [40:0] spi={1'b0,8'd128,8'd10,8'd25,8'd8,8'd22};
	assign RTP_SDI = spi[40];
	always @(posedge (RTP_SCK))
		spi <= {spi[39:0],1'b0};
	
initial begin
	$dumpfile("HACK_tb.vcd");
	$dumpvars(0, HACK_tb);
	
	#15000
	#30000 
	#30000 uart = (("R"<<2)|1);
	#30000 uart = (("X"<<2)|1);
	#30000 
	#30000 BUT = 1;
	#30000 
	#30000 BUT = 0;
	#400000
	$finish;
end

endmodule
