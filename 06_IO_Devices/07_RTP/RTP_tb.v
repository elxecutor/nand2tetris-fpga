`timescale 10ns/1ns
`default_nettype none

module RTP_tb();

	// IN,OUT
	reg clk = 0;
	reg load = 0;
	reg [15:0] in = 0;
	wire [15:0] out;
	wire SDO;
	reg SDI=0;
	wire SCK;

	// Part
	RTP RTP(
    	.clk(clk),
		.load(load),
		.in(in),
		.out(out),
		.SDO(SDO),
		.SDI(SDI),
		.SCK(SCK)
	);
	
	// Simulate
	always #2 clk=~clk;
	wire trigger;
	assign trigger = (n==20) || (n==420) || (n==820) || (n==1220) || (n==1620);
	always @(posedge clk) begin
		in <= trigger?$random&16'h03ff:in;	
		load <= trigger;
	end

	always @(posedge SCK_cmp)
		SDI <= $random;
	// Compare
	reg[8:0] bits=0;
	always @(posedge clk)
		bits <= load?1:((bits==256)?0:(busy?bits+1:0));
	wire busy=|bits[8:0];
	wire [15:0] out_cmp = {busy,7'd0,shift};
	reg [7:0] shift=0;
	wire tr=~|bits[3:0]&busy;
	reg lsb=0;
	always @(posedge clk)
		lsb<=(tr&SCK_cmp)?SDI:lsb;
	always @(posedge clk)
		shift <= load?in[7:0]:((tr&~SCK_cmp)?{shift[6:0],lsb}:shift);
	reg SCK_cmp=0;
	always @(posedge clk)
		SCK_cmp <= load?1:(tr&busy&~bits[8])?~SCK_cmp:SCK_cmp;
	wire SDO_cmp;
	assign SDO_cmp = shift[7];	
	reg fail = 0;
	reg [31:0] n = 0;
	task check;
		#4
		if ((out!=out_cmp)||(SCK!=SCK_cmp)||(SDO!=SDO_cmp))
			begin
				$display("FAIL: clk=%1b, load=%1b, in=%16b, out=%16b, SDO=%1b, SDI=%1b, SCK=%1b",clk,load,in,out,SDO,SDI,SCK);
				fail=1;
			end
	endtask

	initial begin
		$dumpfile("RTP_tb.vcd");
  		$dumpvars(0, RTP_tb);
		
		$display("------------------------");
		$display("Testbench: RTP");

		for (n=0; n<2000;n=n+1) 
				check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
