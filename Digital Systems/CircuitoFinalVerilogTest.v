// Verilog test fixture created from schematic C:\Users\USER\Documents\Univ\2o Semestre\SD\PROJECTOS\Projecto1SD\CircuitoFinal.sch - Sat May 24 20:25:54 2014

`timescale 1ns / 1ps

module CircuitoFinal_CircuitoFinal_sch_tb();

// Inputs
   reg COD;
   reg [3:0] A;
   reg HAB;
   reg Clock;

// Output
   wire Cout1;
   wire Cout0;
   wire O;

// Bidirs

// Instantiate the UUT
   CircuitoFinal UUT (
		.COD(COD), 
		.A(A), 
		.Cout1(Cout1), 
		.Cout0(Cout0), 
		.HAB(HAB), 
		.Clock(Clock), 
		.O(O)
   );
// Initialize Inputs
   always
begin	
		#5 Clock= ~ Clock;
		end
       initial begin
		COD = 1;
		A = 4'b0000;
		HAB = 1;
		Clock = 0;
		
		//#25 
		
		//HAB = 0;

		
   end
endmodule
