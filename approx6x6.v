`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 18:52:18
// Design Name: 
// Module Name: approx6x6
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


module approx6x6(
input [5:0] a,b,
output [11:0] prod
    );
    
    
wire pp[5:0][5:0];
wire [10:0] to_FA [1:0];

gen_prod gp2(.x(a), .y(b),.P(pp));
reduction_stage_approx rs2(.pp(pp), .to_FA(to_FA));
CLA11 fast_adder2(.sum(prod[10:0]), .cout(prod[11]), .a(to_FA[0]), .b(to_FA[1]));

    
endmodule
