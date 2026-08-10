`default_nettype none
module PC_tb();

	// IN,OUT
	reg clk=1;
	reg [15:0] in;
	reg load,inc,reset;
	wire [15:0] out;

	// Part
	PC PC(
		.clk(clk),
		.in(in),
		.load(load),
		.inc(inc),
		.reset(reset),
		.out(out)
	);

	// Simulate
	always #1 clk=~clk;
	always @(posedge clk) begin
		in <= $random;	
		reset <= (n==10) || (n==24) || (n==44);
		inc <= $random;
		load <= $random;
	end

	// Compare
	reg [15:0] out_cmp;
	always @(posedge clk)
		out_cmp <= (reset?0:(load?in:(inc?out+1:out)));	
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: clk=%1b, in=%16b, load=%1b, inc=%1b, reset=%1b, out=%16b",clk,in,load,inc,reset,out);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("PC_tb.vcd");
  		$dumpvars(0, PC_tb);
		
		$display("------------------------");
		$display("Testbench: PC");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
