`default_nettype none
module CPU(
	input clk,
    input [15:0] inM,
   	input [15:0] instruction,
	input reset,
    output [15:0] outM,
    output writeM,
    output [15:0] addressM,
    output [15:0] pc
);

	// Compare	
	reg [15:0] addressM=0;
	reg [15:0] regD=0;
	reg [15:0] pc=0;
	wire [15:0] x,y;
	wire zr,ng;
	assign x = instruction[10]?(instruction[11]?~0:~regD):(instruction[11]?0:regD);
	assign y = instruction[8]?(instruction[9]?~0:~(instruction[12]?inM:addressM)):(instruction[9]?0:(instruction[12]?inM:addressM));
	assign outM = instruction[6]?(instruction[7]?~(x+y):~(x&y)):(instruction[7]?(x+y):(x&y));
	wire comp;
	wire jmp;
	assign comp = instruction[15] && instruction[14] && instruction[13];
	assign zr = (outM==0);
	assign ng = outM[15];
	assign jmp = comp && ((ng&&instruction[2])||(zr&&instruction[1])||(~(ng|zr)&&instruction[0]));
	
	always @(posedge clk) begin
		addressM <= comp?(instruction[5]?outM:addressM) : instruction;
		regD <= comp?(instruction[4]?outM:regD) : regD;
		pc <= reset?0 : (jmp?addressM:pc+1);
	end
	wire writeM;
	assign writeM = comp?instruction[3]:0;
	
endmodule
