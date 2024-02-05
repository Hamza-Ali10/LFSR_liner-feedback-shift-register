`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/18/2023 05:03:26 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR#(parameter n = 8)(
        input clk,
        input reset,
        output [1: n] Q
    );
    
    reg [0:n] Q_reg , Q_next ;
    wire taps;
    
    always@ (posedge clk , negedge reset)
    begin
            if(!reset )
             Q_reg = 1'b1;    // LFSR shouldn't start with 0 or ffff
            
            else
            Q_reg <= Q_next ;
    end
    
    //next state logic
    always@(taps , Q_reg )
     Q_next = {taps , Q_reg[1:n-1]}; 
   
    // output
    assign Q = Q_reg;
    
    // n = 3
    //assign taps = Q_reg[3] ^ Q_reg[2]; 
    
     // n = 8
       assign taps = Q_reg[8] ^ Q_reg[6] ^ Q_reg[5] ^ Q_reg[4] ; 
; 
     
endmodule