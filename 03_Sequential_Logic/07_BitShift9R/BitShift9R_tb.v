`default_nettype none
module BitShift9R_tb();

	// IN,OUT
	reg clk=1;
	reg [8:0] in;
	reg load,shift,inMSB;
	wire [8:0] out;
	
	// Part
	BitShift9R BITSHIFT9R(
		.clk(clk),
		.in(in),
		.inMSB(inMSB),
		.load(load),
		.shift(shift),
		.out(out)
	);

	// Simulate
	always #1 clk=~clk;
	always @(posedge clk) begin
		in <= $random;
		shift <= (n==0) || ((n>20) && (n<50));
		inMSB <= $random;	
		load <= (n==10);
	end
	
	// Compare
	reg [8:0] out_cmp;
	always @(posedge clk)
		out_cmp <= load?in:(shift?(out_cmp>>1)|(inMSB<<8):out_cmp);	
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: clk=%1b, in=%9b, load=%1b, shift=%1b, out=%9b",clk,in,inMSB,load,shift,out);
				fail=1;
			end
	endtask
	
	// Test  
  	initial begin
  		$dumpfile("BitShift9R_tb.vcd");
  		$dumpvars(0, BitShift9R_tb);
		
		$display("------------------------");
		$display("Testbench: BitShift9R");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
