`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 12:11:52
// Design Name: 
// Module Name: Change_ground
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


module Change_ground(
    input clk_2Hz,
    output reg [23:0]C_Background
    );
    reg [1:0]Pa=2'b00;
    
    always@(posedge clk_2Hz)
    begin
        Pa = Pa+1;
        case(Pa)
            2'b00: C_Background = 24'h000000;
            2'b01: C_Background = 24'hff0000;
            2'b10: C_Background = 24'h00ff00;
            2'b11: C_Background = 24'h0000ff;
        endcase
    end
    
endmodule
