`timescale 10ns/1ns
`default_nettype none

module SPI_tb();

	// IN,OUT
	reg clk = 0;
	reg load = 0;
	reg [15:0] in = 0;
	wire [15:0] out;
	wire CSX;
	wire SDO;
	reg SDI=0;
	wire SCK;

	// Part
	SPI SPI(
    	.clk(clk),
		.load(load),
		.in(in),
		.out(out),
		.CSX(CSX),
		.SDO(SDO),
		.SDI(SDI),
		.SCK(SCK)
	);
	
	// Simulate
	always #2 clk=~clk;
	wire trigger;
	assign trigger = (n==20) || (n==40) || (n==60) || (n==80) || (n==100);
	always @(posedge clk) begin
		in <= $random;
		load <= trigger;
		SDI <= $random;
	end

	// Compare
	reg[4:0] bits=0;
	always @(posedge clk)
		bits <= (load&~in[8])?1:((bits==16)?0:(busy?bits+1:0));
	wire busy=|bits;
	wire [15:0] out_cmp = {busy,7'd0,shift};
	reg [7:0] shift=0;
	reg miso_s;
	always @(posedge clk)
		miso_s <= SDI;
	always @(posedge clk)
		shift <= load?in[7:0]:(~SCK_cmp?shift:{shift[6:0],miso_s});
	wire SCK_cmp=busy&~bits[0];
	reg CSX_cmp=1;
	always @(posedge clk)
		CSX_cmp<=load?in[8]:CSX_cmp;
	wire SDO_cmp=shift[7];	
	reg fail = 0;
	reg [31:0] n = 0;
	task check;
		#4
		if ((out!=out_cmp)||(SCK!=SCK_cmp)||(SDO!=SDO_cmp)||(CSX!=CSX_cmp))
			begin
				$display("FAIL: clk=%1b, load=%1b, in=%16b, out=%16b, CSX=%1b, SDO=%1b, SDI=%1b, SCK=%1b",clk,load,in,out,CSX,SDO,SDI,SCK);
				fail=1;
			end
	endtask

	initial begin
		$dumpfile("SPI_tb.vcd");
  		$dumpvars(0, SPI_tb);
		
		$display("------------------------");
		$display("Testbench: SPI");

		for (n=0; n<400;n=n+1) 
				check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
