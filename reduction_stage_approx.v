`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 15:37:05
// Design Name: 
// Module Name: reduction_stage_approx
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


module reduction_stage_approx(
input pp[5:0][5:0],
output [10:0] to_FA [1:0]

    );
    
    //FA: 5
    //HA: 2
    //approx comp: 3/2: 3; 4/2; 5/3; 6/3
    
    wire [2:1] fa_s;
    wire [2:1] fa_c;
    wire [1:1] ha_s;
    wire [1:1] ha_c;    
    
    wire [2:0] comp_out3[1:0];
    
    
//stage1

    compressor3_2 cmp1(.p({pp[0][2],pp[1][1],pp[2][0]}), .w({to_FA[0][2],to_FA[1][2]}) );
    compressor4_2 cmp2(.p({pp[0][3],pp[1][2], pp[2][1],pp[3][0]}), .w({to_FA[0][3],to_FA[1][3]}));
    compressor5_3 cmp3(.p({pp[0][4], pp[1][3], pp[2][2], pp[3][1], pp[4][0]}), .w({comp_out3[0][0],comp_out3[0][1],comp_out3[0][2]}));
    compressor6_3 cmp4(.p({pp[0][5], pp[1][4], pp[2][3], pp[3][2], pp[4][1], pp[5][0]}), .w({comp_out3[1][0],comp_out3[1][1],comp_out3[1][2]}));
    
    fa fa1(.A(pp[1][5]), .B(pp[2][4]), .Cin(pp[3][3]), .S(fa_s[1]), .Co(fa_c[1]));
    fa fa2(.A(pp[2][5]), .B(pp[3][4]), .Cin(pp[4][3]), .S(fa_s[2]), .Co(fa_c[2]));
    
    ha ha1(.A(pp[3][5]), .B(pp[4][4]), .S(ha_s[1]), .C(ha_c[1]));
    
//stage2

    compressor3_2 cmp5(.p({comp_out3[0][0],comp_out3[0][1],comp_out3[0][2] }), .w({to_FA[0][4],to_FA[1][4]}));
    compressor3_2 cmp6(.p({comp_out3[1][0],comp_out3[1][1],comp_out3[1][2] }), .w({to_FA[0][5],to_FA[1][5]}));
    
    ha ha2(.A(fa_s[1]), .B(pp[2][4]), .S(to_FA[0][6]), .C(to_FA[1][7])); 
    
    fa fa3(.A(fa_s[2]), .B(fa_c[1]), .Cin(pp[5][2]), .S(to_FA[0][7]), .Co(to_FA[1][8]));   
    fa fa4(.A(fa_c[2]), .B(ha_s[1]), .Cin(pp[5][3]), .S(to_FA[0][8]), .Co(to_FA[1][9]));
    fa fa5(.A(ha_c[1]), .B(pp[4][5]), .Cin(pp[5][4]), .S(to_FA[0][9]), .Co(to_FA[1][10]));

//stage3
    
    assign to_FA[0][0] = pp[0][0];
    assign to_FA[1][0] = 1'b0;
    
    assign to_FA[0][1] = pp[0][1];
    assign to_FA[1][1] = pp[1][0];
    
    assign to_FA[1][6] = pp[5][1];
    
    assign to_FA[0][10] = pp[5][5];  
    
    
endmodule
