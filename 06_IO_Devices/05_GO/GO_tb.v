`timescale 10ns/1ns
`default_nettype none

module GO_tb();

	// IN,OUT
	reg clk = 0;
	reg load = 0;
	reg [15:0] sram_addr=0;
	reg [15:0] pc=0;
	wire [15:0] SRAM_ADDR;
	reg [15:0] ROM_data=0;
	reg [15:0] sram_data=0;
	wire [15:0] instruction;

	// Part
	GO GO(
    	.clk(clk),
		.load(load),
		.sram_addr(sram_addr),
		.pc(pc),
		.SRAM_ADDR(SRAM_ADDR),
		.ROM_data(ROM_data),
		.sram_data(sram_data),
		.instruction(instruction)
	);
	
	// Simulate
	always #2 clk=~clk;
	wire trigger;
	reg write;
	assign trigger = (n==10);
	always @(posedge clk) begin
		sram_addr <= $random;	
		pc <= $random;	
		ROM_data <= $random;	
		sram_data <= $random;	
		load <= trigger;
	end
	
	// Compare
	reg fail = 0;
	reg [31:0] n = 0;
	reg run=0;
	always @(posedge clk)
		if (load) run <=1;
	wire [15:0] SRAM_ADDR_cmp=run?pc:sram_addr;
	wire [15:0] instruction_cmp=run?sram_data:ROM_data;
	task check;
		#4
		if ((SRAM_ADDR!=SRAM_ADDR_cmp) || (instruction!=instruction_cmp))
			begin
				$display("FAIL: clk=%1b, load=%1b",clk,load);
				fail=1;
			end
	endtask

	initial begin
		$dumpfile("GO_tb.vcd");
  		$dumpvars(0, GO_tb);
		
		$display("------------------------");
		$display("Testbench: GO");

		for (n=0; n<20;n=n+1) 
				check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
