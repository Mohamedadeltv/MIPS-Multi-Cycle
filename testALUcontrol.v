`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:37:31 03/24/2021
// Design Name:   ALU
// Module Name:   F:/muxmohamedadel/testALUcontrol.v
// Project Name:  muxmohamedadel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testALUcontrol;

	// Inputs
	reg [5:0] func;
	reg [1:0] ALUOP;

	// Outputs
	wire [3:0] operation;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.func(func), 
		.ALUOP(ALUOP), 
		.operation(operation)
	);

	initial begin
		// Initialize Inputs
		func = 0;
		ALUOP = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	initial begin
	ALUOP=0;#100;
	ALUOP=1;#100;
	ALUOP=2;func=0;#100;
	ALUOP=2;func=2;#100;
	ALUOP=2;func=4;#100;
   ALUOP=2;func=5;#100;
	ALUOP=2;func=10;#100;
	ALUOP=3;func=2;#100;
	ALUOP=3;func=10;#100;
	end;

      
endmodule

