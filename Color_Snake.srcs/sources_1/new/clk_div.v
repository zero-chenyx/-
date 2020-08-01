`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 11:58:02
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clk_100MHz,
    output reg clk_2Hz,
    output reg clk_10Hz
    );
    reg [24:0]cnt_2=0;
    reg [24:0]cnt_10=0;
    always@(posedge clk_100MHz)
    begin
        cnt_2<=cnt_2+1;
        cnt_10<=cnt_10+1;
        if (cnt_2 == 15000000)
            begin
                clk_2Hz <= ~clk_2Hz;
                cnt_2 <= 0;
            end 
        if (cnt_10 == 5000000)
            begin
                clk_10Hz <= ~clk_10Hz;
                cnt_10 <= 0;
            end   
    end
endmodule
