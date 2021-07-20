`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 12:37:33
// Design Name: 
// Module Name: tb_fast_adder
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


module tb_fast_adder;

wire [10:0] sum;
wire cout;
reg [10:0] a, b;

 CLA11 dut1(.sum(sum), .cout(cout), .a(a), .b(b));
 

 initial
 begin
 
 a = 11'b011_1111_1111;
 b = 11'b011_1111_1111;
  
 end
   
endmodule
