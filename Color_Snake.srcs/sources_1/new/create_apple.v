`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 13:54:24
// Design Name: 
// Module Name: create_apple
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


module create_apple(
    input clk_100MHz,
    input clk_2Hz,
    input apple_status,
    output reg [11:0]apple_x,
    output reg [11:0]apple_y
    );
    
    reg [11:0]xx=12'd140;
    reg [11:0]yy=12'd100;
    
    always@(posedge clk_100MHz)
    begin
        if(xx<1780)
            xx=xx+20;
        else
            xx=140;
        if(yy<900)
            yy=yy+20;
        else
            yy=100;
    end
    
    always@(posedge clk_2Hz)
    begin
        if(apple_status==0)
        begin
            apple_x<=xx;
            apple_y<=yy;
        end
    end
endmodule
