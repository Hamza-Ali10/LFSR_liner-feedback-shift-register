`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali 
// 
// Create Date: 08/18/2023 05:12:23 PM
// Design Name: 
// Module Name: LFSR_TB
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


module LFSR_TB(
    
    );
    
     localparam n = 8;
     reg clk;
     reg reset ;
     wire [1:n] Q;
     
    LFSR # (.n(n))uut (
     .clk(clk),
     .reset(reset),
     .Q(Q)
     );
   
     localparam T = 10;
     
     always
     begin
     clk = 1'b0;
     #(T / 2);
     clk = 1'b1;
     #(T / 2);
     end
     
     initial 
     begin
         reset = 1'b0;
     #2  reset = 1'b1;
     
     repeat(2)@(negedge clk);
     wait (Q == 1);
     #20 $stop;
     
     end

endmodule

