`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 14:21:06
// Design Name: 
// Module Name: tb_gen_prod
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


module tb_gen_prod;
    
    reg [5:0] a,b;
    wire pp[5:0][5:0];
    
    gen_prod gp1(.x(a), .y(b),.P(pp));
    
    initial
     begin
         a = 6'h0000_00;
		 b = 6'h0000_00;
		 #200;
		a = 6'b0000_01;
		b = 6'b0000_11;
      
    end
endmodule
