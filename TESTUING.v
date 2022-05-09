`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:55:17 03/17/2021
// Design Name:   THIRDSECTION
// Module Name:   F:/muxmohamedadel/TESTUING.v
// Project Name:  muxmohamedadel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: THIRDSECTION
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TESTUING;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] x;

	// Outputs
	wire zero;
	wire [31:0] C;

	// Instantiate the Unit Under Test (UUT)
	THIRDSECTION uut (
		.A(A), 
		.B(B), 
		.x(x), 
		.zero(zero), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		x = 0; 
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end 
	initial begin 
	A=12;B=15;x=0;#100; 
   A=17;B=20;x=1;#100;

	end
      
endmodule

