`default_nettype none
module RAM512_tb();

	// IN,OUT
	reg clk=1;
	reg [15:0] in;
	reg [8:0] address;
	reg load;
	wire [15:0] out;

	// Part
	RAM512 RAM512(
		.clk(clk),
		.address(address),
		.in(in),
		.load(load),
		.out(out)
	);

	// Simulate
	always #1 clk=~clk;
	always @(posedge clk) begin
		in <= $random;	
		address <= n;
		load <= (n<512);
	end

	// Compare
	reg [15:0] regRAM [0:511];
	always @(posedge clk)
		if (load) regRAM[address[8:0]] <= in;
	wire[15:0] out_cmp = regRAM[address[8:0]];
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: clk=%1b, address=%9b, in=%16b, load=%1b, out=%16b",clk,address,in,load,out);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("RAM512_tb.vcd");
  		$dumpvars(0, RAM512_tb);
		
		$display("------------------------");
		$display("Testbench: RAM512");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
