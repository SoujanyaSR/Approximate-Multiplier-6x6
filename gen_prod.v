`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 12:22:04
// Design Name: 
// Module Name: gen_prod
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_prod(
	input [5:0]x,
	input [5:0]y,
	output P[5:0][5:0] ); 	//portlist can be 2D array in verilog 
	genvar i,j;
	generate
		for(i = 0; i < 6; i = i +1) begin:part_product
		  for(j = 0; j < 6; j = j +1) begin
			assign P[i][j] = x[j] & y[i] ;
		  end
		end
	endgenerate
endmodule

