`timescale 10ns/1ns
`default_nettype none

module SRAM_D_tb();

	// IN,OUT
	reg clk = 0;
	reg load = 0;
	reg [15:0] in=0;
	wire [15:0] out;
	wire CSX;
	wire OEX;
	wire WEX;
	wire [15:0] DATA;

	// Part
	SRAM_D SRAM_D(
    	.clk(clk),
		.load(load),
		.in(in),
		.out(out),
		.CSX(CSX),
		.OEX(OEX),
		.WEX(WEX),
		.DATA(DATA)
	);
	
	// Simulate
	always #2 clk=~clk;
	wire trigger;
	reg write;
	assign trigger = (n==4) || (n==8) || (n==12) || (n==16) || (n==20);
	always @(posedge clk) begin
		in <= $random;	
		load <= trigger;
		write <= load;
	end
	reg [15:0] data;
	always @(posedge clk)
		if (load) data <= in;
	// Compare
	wire CSX_cmp = 0;
	wire OEX_cmp = write;
	wire WEX_cmp = ~write;
	wire [15:0] out_cmp = (~CSX_cmp&~OEX_cmp)?16'bzzzzzzzzzzzzzzzz:data; 
	reg fail = 0;
	reg [31:0] n = 0;
	task check;
		#4
		if ((out!=out_cmp)||(CSX!=CSX_cmp)||(OEX!=OEX_cmp)||(WEX!=WEX_cmp))
			begin
				$display("FAIL: clk=%1b, load=%1b, in=%16b, out=%16b, CSX=%1b, OEX=%1b, SEX=%1b, DATA=%16b",clk,load,in,out,CSX,OEX,WEX,DATA);
				fail=1;
			end
	endtask

	initial begin
		$dumpfile("SRAM_D_tb.vcd");
  		$dumpvars(0, SRAM_D_tb);
		
		$display("------------------------");
		$display("Testbench: SRAM_D");

		for (n=0; n<24;n=n+1) 
				check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
