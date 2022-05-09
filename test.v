`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:53:09 03/10/2021
// Design Name:   mux4to1
// Module Name:   D:/muxmohamedadel/test.v
// Project Name:  muxmohamedadel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux4to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg [3:0] X;
	reg [1:0] Y;

	// Outputs
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	mux4to1 uut (
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	initial begin
	X=15;Y=0;#100;
	end
      
endmodule

