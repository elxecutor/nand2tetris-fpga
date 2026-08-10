`default_nettype none
module RAM3840_tb();

	// IN,OUT
	reg clk=1;
	reg [15:0] in;
	reg [11:0] address;
	reg load;
	wire [15:0] out;

	// Part
	RAM3840 RAM3840(
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
		address <= (n<3840)?n:n-3840;
		load <= (n<3840);
	end

	// Compare
	reg [15:0] regRAM [0:3839];
	always @(posedge clk)
		if (load) regRAM[address[11:0]] <= in;
	wire[15:0] out_cmp = regRAM[address[11:0]];
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: clk=%1b, address=%12b, in=%16b, load=%1b, out=%16b",clk,address,in,load,out);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("RAM3840_tb.vcd");
  		$dumpvars(0, RAM3840_tb);
		
		$display("------------------------");
		$display("Testbench: RAM3840");

		for (n=0; n<2*3840;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
