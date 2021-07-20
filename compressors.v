`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 12:24:03
// Design Name: 
// Module Name: compressors
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

//Exact Compressors: Full adder and Half adder



module fa( 
    input A, B, Cin,
    output S, Co    
    );
    
     xor xor1(S, A, B, Cin);     
     assign Co = (A & B) | (B & Cin) | (Cin & A);
    
endmodule

module ha(    
    input A,B,
    output S,C
    );
    
    xor x1(S,A,B);
    and x2(C,A,B);    
    
endmodule
    

//Approximate compressors

module compressor3_2(input [2:0]p, output [2:1]w); //  p2,p1,p0, output w1,w2);
    wire a1;
    and u1(a1 , p[0] , p[1]); //assign a1 = p0 & p1;
    or  u2(w[2] , a1 , p[2]);  //assign w2 = a1 | p2;
    or  u3(w[1] , p[0] , p[1]);  //assign w1 = p0 |p1;
endmodule

module compressor4_2(input [3:0]p, output [2:1]w);  // p3,p2,p1,p0, output w2,w1);
    wire a1,a2;
    and u1(a1 , p[0] , p[1]);     //assign a1 = p0 & p1;
    and u2(a2 , p[2] , p[3]);     //assign a2 = p2 & p3;
    or u3(w[2] , a1 , p[2] , p[3]); //assign w2 = a1 | p2 | p3;
    or u4(w[1] , a2 , p[0] , p[1]); //assign w1 = a2 | p0 | p1;
endmodule

module compressor5_3(input [4:0]p, output [3:1]w); //  p4,p3,p2,p1,p0, output w3,w2,w1);
    wire a1,a2;
    and u1(a1 , p[0] , p[1]);      //assign a1 = p0 & p1;
    and u2(a2 , p[2] , p[3]);      //assign a2 = p2 & p3;
    or u3(w[3] , p[0] , p[1]);       //assign w3 = p0 | p1;
    or u4(w[1] , a1 , p[2] , p[3]);  //assign w1 = a1 | p2 | p3;
    or u5(w[2] , a2 , p[4]);       //assign w2 = a2 | p4;
endmodule

module compressor6_3(input [5:0]p, output [3:1]w); //  p5,p4,p3,p2,p1,p0, output w3,w2,w1);
    wire a1,a2,a3;
    and u1(a1 , p[0] , p[1]);      //assign a1 = p0 & p1;
    and u2(a2 , p[2] , p[3]);      //assign a2 = p2 & p3;
    and u3(a3 , p[4] , p[5]);      //assign a3 = p4 & p5;
    or u4(w[1] , a1 , p[2] , p[3]);  //assign w1 = a1 | p2 | p3;
    or u5(w[3] , a2 , p[4] , p[5]);  //assign w3 = a2 | p4 | p5;
    or u6(w[2] , a3 , p[0] , p[1]);  //assign w2 = a3 | p0 | p1;
endmodule



