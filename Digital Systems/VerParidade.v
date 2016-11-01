`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:21:35 05/08/2014 
// Design Name: 
// Module Name:    VerParidade 
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
module VerParidade(I,O);
	
	input [3:0]I;
	output O;
			
	assign O = ^I;
    
endmodule
