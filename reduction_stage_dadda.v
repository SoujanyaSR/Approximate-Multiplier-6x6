`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 13:06:30
// Design Name: 
// Module Name: reduction_stage_dadda
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


module reduction_stage_dadda(

input pp[5:0][5:0],
output [10:0] to_FA [1:0]

    );
    
//FA: 14
//HA:  6  

wire fa_s [14:1];
wire fa_c [14:1];
wire ha_s [6:1];
wire ha_c [6:1];


//stage1
fa fa1(.A(pp[00][05]), .B(pp[01][04]), .Cin(pp[02][03]), .S(fa_s[1]), .Co(fa_c[1]));
fa fa2(.A(pp[01][05]), .B(pp[02][04]), .Cin(pp[03][03]), .S(fa_s[2]), .Co(fa_c[2]));
fa fa3(.A(pp[02][05]), .B(pp[03][04]), .Cin(pp[04][03]), .S(fa_s[3]), .Co(fa_c[3]));

ha ha1(.A(pp[0][4]), .B(pp[1][3]), .S(ha_s[1]), .C(ha_c[1]));
ha ha2(.A(pp[3][2]), .B(pp[4][1]), .S(ha_s[2]), .C(ha_c[2]));
ha ha3(.A(pp[4][2]), .B(pp[5][1]), .S(ha_s[3]), .C(ha_c[3]));

//stage2
fa fa4(.A(ha_s[1]), .B(pp[2][2]), .Cin(pp[3][1]), .S(fa_s[4]), .Co(fa_c[4]));
fa fa5(.A(ha_c[1]), .B(fa_s[1]), .Cin(ha_s[2]), .S(fa_s[5]), .Co(fa_c[5]));
fa fa6(.A(fa_c[1]), .B(ha_c[2]), .Cin(fa_s[2]), .S(fa_s[6]), .Co(fa_c[6]));
fa fa7(.A(fa_c[2]), .B(ha_c[3]), .Cin(fa_s[3]), .S(fa_s[7]), .Co(fa_c[7]));
fa fa8(.A(fa_c[3]), .B(pp[3][5]), .Cin(pp[4][4]), .S(fa_s[8]), .Co(fa_c[8]));

ha ha4(.A(pp[0][3]), .B(pp[1][2]), .S(ha_s[4]), .C(ha_c[4]));

//stage3

fa fa9(.A(ha_s[4]), .B(pp[2][1]), .Cin(pp[3][0]),   .S(to_FA[0][3]), .Co(to_FA[1][4]));
fa fa10(.A(ha_c[4]), .B(fa_s[4]), .Cin(pp[4][0]),   .S(to_FA[0][4]), .Co(to_FA[1][5]));
fa fa11(.A(fa_c[4]), .B(fa_s[5]), .Cin(pp[05][00]), .S(to_FA[0][5]), .Co(to_FA[1][6]));
fa fa12(.A(fa_c[5]), .B(fa_s[6]), .Cin(ha_s[3]),    .S(to_FA[0][6]), .Co(to_FA[1][7]));
fa fa13(.A(fa_c[6]), .B(fa_s[7]), .Cin(pp[5][2]),   .S(to_FA[0][7]), .Co(to_FA[1][8]));
fa fa14(.A(fa_c[7]), .B(fa_s[8]), .Cin(pp[5][3]),   .S(to_FA[0][8]), .Co(to_FA[1][9]));
fa fa15(.A(pp[4][5]), .B(pp[5][4]), .Cin(fa_c[8]),   .S(to_FA[0][9]), .Co(to_FA[1][10]));

ha ha5(.A(pp[0][2]), .B(pp[1][1]), .S(to_FA[0][2]), .C(to_FA[1][3]));

//To fast adder

assign to_FA[0][0] = pp[0][0];
assign to_FA[1][0] = 1'b0;

assign to_FA[0][1] = pp[0][1];
assign to_FA[1][1] = pp[1][0];

assign to_FA[1][2] = pp[2][0];

assign to_FA[0][10] = pp[5][5];




    
    
endmodule
