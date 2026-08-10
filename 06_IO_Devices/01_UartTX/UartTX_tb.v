`timescale 10ns/1ns
`default_nettype none

module UartTX_tb();

	// IN,OUT
	reg clk = 0;
	reg load = 0;
	reg [15:0] in = 0;
	wire TX;
	wire [15:0] out;

	// Part
	UartTX UartTX(
    	.clk(clk),
		.load(load),
		.in(in),
		.TX(TX),
		.out(out)
	);
	
	// Simulate
	always #2 clk=~clk;
	wire trigger;
	assign trigger = (n==1000) || (n==5000) || (n==9000);
	always @(posedge clk) begin
		in <= trigger?$random:in;	
		load <= trigger;
	end

	// Compare
	reg [9:0] uart=10'b1111111111;
	reg [15:0] baudrate = 0;
	reg [15:0] bits = 0;
	wire is216=(baudrate==216);
	reg [15:0] out_cmp=0;
	always @(posedge clk)
		out_cmp <=load?16'h8000:(bits==9)&is216?16'd0:out_cmp;
	always @(posedge clk)
		bits <= (load)?0:is216?bits+1:bits;
	always @(posedge clk)
		baudrate <= (is216?0:out_cmp?baudrate+1:baudrate);
	always @(posedge clk)
		uart <= (load)?((in<<2)|1):(is216?{1'b1,uart[9:1]}:uart);
	wire TX_cmp;
	assign TX_cmp = uart[1];
	
	reg fail = 0;
	reg [31:0] n = 0;
	task check;
		#4
		if ((TX != TX_cmp) ||(out != out_cmp))
			begin
				$display("FAIL: clk=%1b, load=%1b, in=%16b, out=%16b, TX=%1b",clk,load,in,out,TX);
				fail=1;
			end
	endtask

	initial begin
		$dumpfile("UartTX_tb.vcd");
  		$dumpvars(0, UartTX_tb);
		
		$display("------------------------");
		$display("Testbench: UartTX");

		for (n=0; n<13000;n=n+1) 
				check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
