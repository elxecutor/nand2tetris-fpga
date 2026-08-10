`default_nettype none
module BitShift8L_tb();

	// IN,OUT
	reg clk=1;
	reg [7:0] in;
	reg load,shift,inLSB;
	wire [7:0] out;
	
	// Part
	BitShift8L BITSHIFT8L(
		.clk(clk),
		.in(in),
		.inLSB(inLSB),
		.load(load),
		.shift(shift),
		.out(out)
	);

	// Simulate
	always #1 clk=~clk;
	always @(posedge clk) begin
		in <= $random;
		shift <= (n==0) || ((n>20) && (n<50));
		inLSB <= $random;	
		load <= (n==10);
	end
	
	// Compare
	reg [7:0] out_cmp;
	always @(posedge clk)
		out_cmp <= load?in:(shift?(out_cmp<<1)|inLSB:out_cmp);	
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: clk=%1b, in=%8b, load=%1b, shift=%1b, out=%8b",clk,in,inLSB,load,shift,out);
				fail=1;
			end
	endtask
	
	// Test  
  	initial begin
  		$dumpfile("BitShift8L_tb.vcd");
  		$dumpvars(0, BitShift8L_tb);
		
		$display("------------------------");
		$display("Testbench: BitShift8L");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
