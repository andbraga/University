`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:30:19 04/14/2014 
// Design Name: 
// Module Name:    Selector 
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
module Selector(I0,I1,HAB,COD,O);

input [3:0]I0,I1;
input HAB,COD;
output [3:0]O;
reg [3:0]O;

always @ (I0 or I1 or HAB or COD)

begin

	if(!HAB)
			
			O = 4'b1111;
			
	else
		
		if(!COD)
			
			O = I0;

		else

			O = I1;
		
end

endmodule

