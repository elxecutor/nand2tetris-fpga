`timescale 10ns/1ns
`default_nettype none

module LCD_tb();

	// IN,OUT
	reg clk = 0;
	reg load = 0;
	reg load16 = 0;
	reg [15:0] in = 0;
	wire [15:0] out;
	wire DCX;
	wire CSX;
	wire SDO;
	wire SCK;

	// Part
	LCD LCD(
    	.clk(clk),
		.load(load),
		.load16(load16),
		.in(in),
		.out(out),
		.DCX(DCX),		//SPI-line data/command not
		.CSX(CSX),		//SPI-line chip enabled not
		.SDO(SDO),		//SPI-Line master out slave in
		.SCK(SCK)			//SPI-clock
	);
	
	// Simulate
	always #2 clk=~clk;
	wire trigger;
	assign trigger = (n==20) || (n==40) || (n==60) || (n==80) || (n==100);
	reg [1:0] xx=0;
	always @(posedge clk) begin
		in <= trigger?$random&16'h02ff:in;	
		if (trigger) xx<=xx+1;
		load <= trigger&&(~xx[1]);
		load16 <= trigger&&(xx==2);
	end

	// Compare
	reg[5:0] bits=0;
	reg d16=0;
	always @(posedge clk)
		d16 <= load16?1:(load)?0:d16;	
	always @(posedge clk)
		bits <= (load&~in[8]|load16)?1:(((bits[4]&~d16)|bits[5])?0:(busy?bits+1:0));
	wire busy=|bits;
	wire out_cmp = busy;
	reg [15:0] shift=0;
	always @(posedge clk)
		shift <= (load|load16)?in:(~SCK_cmp?shift:{shift[14:0],1'b0});
	wire SCK_cmp=busy&~bits[0];
	reg ce_cmp=0;
	always @(posedge clk)
		ce_cmp<=(load|load16)?(load16|load&~in[8]):ce_cmp;
	wire CSX_cmp=~ce_cmp;
	reg DCX_cmp=0;
	always @(posedge clk)
		DCX_cmp<=load?in[9]:(load16)?1:DCX_cmp;
	wire SDO_cmp=(d16&shift[15])|(~d16&shift[7]);	
	reg fail = 0;
	reg [31:0] n = 0;
	task check;
		#4
		if ((out[15]!=out_cmp)||(SDO!=SDO_cmp)||(CSX!=CSX_cmp)||(SCK!=SCK_cmp)||(DCX!=DCX_cmp))
			begin
				$display("FAIL: clk=%1b, load=%1b, in=%16b, out=%16b, DCX=%1b, CSX=%1b, SDO=%1b, SCK=%1b",clk,load,in,out,DCX,CSX,SDO,SCK);
				fail=1;
			end
	endtask

	initial begin
		$dumpfile("LCD_tb.vcd");
  		$dumpvars(0, LCD_tb);
		
		$display("------------------------");
		$display("Testbench: LCD");

		for (n=0; n<400;n=n+1) 
				check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
