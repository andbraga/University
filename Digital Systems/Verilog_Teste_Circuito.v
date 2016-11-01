// Verilog test fixture created from schematic C:\Users\USER\Documents\Univ\2o Semestre\SD\PROJECTO 1\Projecto1SD\Circuito.sch - Wed Apr 16 15:46:06 2014

`timescale 1ns / 1ps

module Circuito_Circuito_sch_tb();

// Inputs
   reg HAB;
   reg COD;
   reg [3:0] A;
   reg [3:0] X;
   reg [3:0] Y;

// Output
   wire [3:0] B;
   wire [3:0] C;
   wire Cout0;
   wire Cout1;

// Bidirs

// Instantiate the UUT
   Circuito UUT (
		.HAB(HAB), 
		.COD(COD), 
		.A(A), 
		.X(X), 
		.Y(Y), 
		.B(B), 
		.C(C), 
		.Cout0(Cout0), 
		.Cout1(Cout1)
   );
// Initialize Inputs
   `ifdef auto_init       
		 initial begin
		HAB = 0;
		COD = 0;
		A = 4'b0000;
		X = 4'b0101;
		Y = 4'b0001;
   `endif
	
		
	initial
	begin
				
		X = 4'b0101;
		Y = 4'b0001;
		HAB = 0;
		COD = 0;
		A = 4'b0000;
		
		#25
				
		A = 4'b0001;
		
		#25
		
		A = 4'b0010;
		
		#25
		
		A = 4'b0011;
		
		#25
		
		A = 4'b0100;
		
		#25
		
		A = 4'b0101;
		
		#25
		
		A = 4'b0110;
		
		#25
		
		A = 4'b0111;
		
		#25
		
		A = 4'b1000;
		
		#25
		
		A = 4'b1001;
		
		#25
		
		HAB = 0;
		COD = 1;
		A = 4'b0000;
		
		#25
		
		A = 4'b0001;
		
		#25
		
		A = 4'b0010;
		
		#25
		
		A = 4'b0011;
		
		#25
		
		A = 4'b0100;
		
		#25
		
		A = 4'b0101;
		
		#25
		
		A = 4'b0110;
		
		#25
		
		A = 4'b0111;
		
		#25
		
		A = 4'b1000;
		
		#25
		
		A = 4'b1001;
		
		#25
		
		HAB = 1;
		COD = 0;
		A = 4'b0000;
		
		#25
		
		A = 4'b0001;
		
		#25
		
		A = 4'b0010;
		
		#25
		
		A = 4'b0011;
		
		#25
		
		A = 4'b0100;
		
		#25
		
		A = 4'b0101;
		
		#25
		
		A = 4'b0110;
		
		#25
		
		A = 4'b0111;
		
		#25
		
		A = 4'b1000;
		
		#25
		
		A = 4'b1001;
		
		#25
		
		HAB = 1;
		COD = 1;
		A = 4'b0000;
		
		#25
		
		A = 4'b0001;
		
		#25
		
		A = 4'b0010;
		
		#25
		
		A = 4'b0011;
		
		#25
		
		A = 4'b0100;
		
		#25
		
		A = 4'b0101;
		
		#25
		
		A = 4'b0110;
		
		#25
		
		A = 4'b0111;
		
		#25
		
		A = 4'b1000;
		
		#25
		
		A = 4'b1001;
	
	
		
	end
endmodule


