`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:01:46 05/23/2014 
// Design Name: 
// Module Name:    Sequenciador 
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
module Sequenciador(B,C,BP,HAB,COD, O, clk);

input clk,BP,HAB,COD;
input[3:0]B,C;
output O;
reg O;

reg [3:0] Creg,Breg;
reg BPreg, StopB;
reg [3:0] i=0;
reg g=0;

always @ (g)
	begin
	
	Creg = C;
	Breg = B;
	BPreg = BP;
	StopB = COD;
	
	end
always @ (posedge clk)
	begin

	if(HAB == 0 && g==0)
		begin			
			O = 0;
		end
	else
		begin
				
			i = i + 1;
	
	case (i)

	1: begin
		O = 1;g=1;
		end
	2: O = Creg[3];
	3: O = Creg[2];
	4: O = Creg[1];
	5: O = Creg[0];
	6: O = Breg[3];
	7: O = Breg[2];
	8: O = Breg[1];
	9: O = Breg[0];
	10: O = BPreg;
	11: O = ~StopB; 
	12:	begin
			O = ~StopB; g=0; i=0;
			end
	endcase
		end
	end
endmodule
