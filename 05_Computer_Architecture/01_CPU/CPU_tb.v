`default_nettype none
module CPU_tb();

	// IN,OUT
	reg clk=1;
    reg [15:0] inM=0;
   	reg [15:0] instruction=0;
	reg reset=1;
    wire [15:0] outM;
    wire writeM;
    wire [15:0] addressM;
    wire [15:0] pc;
	
	// Part
	CPU CPU(
		.clk(clk),
		.inM(inM),
		.instruction(instruction),
		.reset(reset),
		.outM(outM),
		.writeM(writeM),
		.addressM(addressM),
		.pc(pc)
	);

	// Simulation
	always #1 clk=~clk;
	always @(posedge clk) begin
		inM <= $random;
		reset <= (n<=10) || ((n>20) && (n<40));
		instruction <= $random;	
	end

	// Compare	
	reg [15:0] addressM_cmp=0;
	reg [15:0] regD=0;
	reg [15:0] pc_cmp=0;
	reg zx,nx,zy,ny,f,no;
	wire [15:0] out_cmp;
	wire [15:0] x,y;
	wire zr,ng;
	assign x = instruction[10]?(instruction[11]?~0:~regD):(instruction[11]?0:regD);
	assign y = instruction[8]?(instruction[9]?~0:~(instruction[12]?inM:addressM_cmp)):(instruction[9]?0:(instruction[12]?inM:addressM_cmp));
	assign out_cmp = instruction[6]?(instruction[7]?~(x+y):~(x&y)):(instruction[7]?(x+y):(x&y));
	wire comp;
	wire jmp;
	assign comp = instruction[15] && instruction[14] && instruction[13];
	assign zr = (out_cmp==0);
	assign ng = out_cmp[15];
	assign jmp = comp && ((ng&&instruction[2])||(zr&&instruction[1])||(~(ng|zr)&&instruction[0]));
	always @(posedge clk) begin
		addressM_cmp <= comp?(instruction[5]?out_cmp:addressM_cmp) : instruction;
		regD <= comp?(instruction[4]?out_cmp:regD) : regD;
		pc_cmp <= reset?0 : (jmp?addressM_cmp:pc_cmp+1);
	end
	wire writeM_cmp;
	assign writeM_cmp = comp?instruction[3]:0;
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if ((pc != pc_cmp) || (addressM != addressM_cmp) || (outM != out_cmp) || (writeM != writeM_cmp)) 
			begin
				$display("FAIL: clk=%1b, inM=%16b, instruction=%16b, reset=%1b, outM=%16b, writeM=%1b, addressM=%16b, pc=%16b",clk,inM,instruction,reset,outM,writeM,addressM,pc);
				fail=1;
			end
	endtask
	
	// Test  
  	initial begin
  		$dumpfile("CPU_tb.vcd");
  		$dumpvars(0, CPU_tb);
		
		$display("------------------------");
		$display("Testbench: CPU");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
