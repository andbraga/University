`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:37 05/26/2014 
// Design Name: 
// Module Name:    checkBCD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module checkBCD(A,S);

input [3:0]A;
output [3:0]S;
reg [3:0]S;
		
always @(A)

begin

	if (A<= 4'b1001)
	
		S = A;
		
	else
	
		S = 4'bxxxx;
		
end
endmodule
