`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 13:58:43
// Design Name: 
// Module Name: tb_dadda6x6
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


module tb_dadda6x6;

reg [5:0] A,B;
wire [11:0] prod;
   
   integer i,j,errCount;
   integer total_error;
   
  initial
  begin
       errCount = 0;
       total_error = 0;
        for(i=0; i<64; i=i+1)
        
            #10 for(j = 0 ; j<64; j=j+1)
               
                begin                
                A = i;
                B = j;
                #10 if(prod != (A*B))
                begin
                    errCount = errCount +1;
                    total_error = total_error+prod-(A*B);
                    $display("%d * %d = %d Erro count = %d, Err:%d ", A, B,prod, errCount,total_error);
                    //if(errCount == 10)
                   // $stop;
                end
                else
               $display("%d * %d = %d Erro count = %d", A, B,prod, errCount);
                
            end
            
            $display("Mean error = %f", total_error/(64*64));
         /*   A = 63;B = 63;
            #1
            if(prod != (A*B))
                begin
                    errCount = errCount +1;
                    $display("%d * %d = %d Erro count = %d", A, B,prod, errCount);
                end
        // $display("Final Error Count  : %d   ", errCount); 
  */
  end   
     
 /*    
   dadda6x6 mul1(
    .a(A),.b(B),
    .prod(prod)  
    ); */


 approx6x6 mul2(
    .a(A),.b(B),
    .prod(prod)  
    );
endmodule
