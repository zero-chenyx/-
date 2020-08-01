`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 11:16:14
// Design Name: 
// Module Name: die_judge
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


module die_judge(
    input clk_2Hz,
    input [11:0]nhead_x,
    input [11:0]nhead_y,
    input [11:0]nbody1_x,
    input [11:0]nbody1_y,
    input [11:0]nbody2_x,
    input [11:0]nbody2_y,
    input [11:0]nbody3_x,
    input [11:0]nbody3_y,
    input [11:0]nbody4_x,
    input [11:0]nbody4_y,
    input [11:0]nbody5_x,
    input [11:0]nbody5_y,
    input [11:0]nbody6_x,
    input [11:0]nbody6_y,
    input [11:0]nbody7_x,
    input [11:0]nbody7_y,
    input [11:0]nbody8_x,
    input [11:0]nbody8_y,
    input [11:0]nbody9_x,
    input [11:0]nbody9_y,
    input [11:0]nbody10_x,
    input [11:0]nbody10_y,
    output reg rst=0
    );
    
    always@(posedge clk_2Hz)
    begin
        if((nhead_x<=120 || nhead_x>=1800 || nhead_y<=80 || nhead_y>=1000) ||
        (nhead_x==nbody1_x && nhead_y==nbody1_y)||
        (nhead_x==nbody2_x && nhead_y==nbody2_y)||
        (nhead_x==nbody3_x && nhead_y==nbody3_y)||
        (nhead_x==nbody4_x && nhead_y==nbody4_y)||
        (nhead_x==nbody5_x && nhead_y==nbody5_y)||
        (nhead_x==nbody6_x && nhead_y==nbody6_y)||
        (nhead_x==nbody7_x && nhead_y==nbody7_y)||
        (nhead_x==nbody8_x && nhead_y==nbody8_y)||
        (nhead_x==nbody9_x && nhead_y==nbody9_y)||
        (nhead_x==nbody10_x && nhead_y==nbody10_y)     
        )
            rst=1;
        else
            rst=0;
    end
endmodule
