`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 15:08:41
// Design Name: 
// Module Name: Snake_position
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


module Snake_position(
    input clk_2Hz,
    input rst,
    input [1:0]direct,
    input [3:0]body_l,
    
    output reg [11:0]nhead_x=12'd900,
    output reg [11:0]nhead_y=12'd500,
    output reg [11:0]nbody1_x=12'd880,
    output reg [11:0]nbody1_y=12'd500,
    output reg [11:0]nbody2_x=12'd860,
    output reg [11:0]nbody2_y=12'd500,
    output reg [11:0]nbody3_x=12'd840,
    output reg [11:0]nbody3_y=12'd500,
    output reg [11:0]nbody4_x=12'd30,
    output reg [11:0]nbody4_y=12'd30,
    output reg [11:0]nbody5_x=12'd30,
    output reg [11:0]nbody5_y=12'd30,
    output reg [11:0]nbody6_x=12'd30,
    output reg [11:0]nbody6_y=12'd30,
    output reg [11:0]nbody7_x=12'd30,
    output reg [11:0]nbody7_y=12'd30,
    output reg [11:0]nbody8_x=12'd30,
    output reg [11:0]nbody8_y=12'd30,
    output reg [11:0]nbody9_x=12'd30,
    output reg [11:0]nbody9_y=12'd30,
    output reg [11:0]nbody10_x=12'd30,
    output reg [11:0]nbody10_y=12'd30
    );
   
    always@(posedge clk_2Hz)
    begin
        nbody1_x<=nhead_x;
        nbody1_y<=nhead_y;
        nbody2_x<=nbody1_x;
        nbody2_y<=nbody1_y;
        nbody3_x<=nbody2_x;
        nbody3_y<=nbody2_y;
        if(direct == 2'b00)
        begin
            nhead_x= nhead_x+20;            
        end
        if(direct == 2'b01)
        begin           
            nhead_y= nhead_y-20;
        end
        if(direct == 2'b10)
        begin           
            nhead_x= nhead_x-20;
        end
        if(direct == 2'b11)
        begin           
            nhead_y= nhead_y+20;
        end
        
        if(body_l==4'd4)
        begin
            nbody4_x<=nbody3_x;
            nbody4_y<=nbody3_y;
        end
        
        if(body_l==4'd5)
        begin
            nbody4_x<=nbody3_x;
            nbody4_y<=nbody3_y;
            nbody5_x<=nbody4_x;
            nbody5_y<=nbody4_y;
        end
        
        if(body_l==4'd6)
        begin
            nbody4_x<=nbody3_x;
            nbody4_y<=nbody3_y;
            nbody5_x<=nbody4_x;
            nbody5_y<=nbody4_y;
            nbody6_x<=nbody5_x;
            nbody6_y<=nbody5_y;
        end
        
        if(body_l==4'd7)
        begin
            nbody4_x<=nbody3_x;
            nbody4_y<=nbody3_y;
            nbody5_x<=nbody4_x;
            nbody5_y<=nbody4_y;
            nbody6_x<=nbody5_x;
            nbody6_y<=nbody5_y;
            nbody7_x<=nbody6_x;
            nbody7_y<=nbody6_y;
        end
        
        if(body_l==4'd8)
        begin
            nbody4_x<=nbody3_x;
            nbody4_y<=nbody3_y;
            nbody5_x<=nbody4_x;
            nbody5_y<=nbody4_y;
            nbody6_x<=nbody5_x;
            nbody6_y<=nbody5_y;
            nbody7_x<=nbody6_x;
            nbody7_y<=nbody6_y;
            nbody8_x<=nbody7_x;
            nbody8_y<=nbody7_y;
        end
        
        if(body_l==4'd9)
        begin
            nbody4_x<=nbody3_x;
            nbody4_y<=nbody3_y;
            nbody5_x<=nbody4_x;
            nbody5_y<=nbody4_y;
            nbody6_x<=nbody5_x;
            nbody6_y<=nbody5_y;
            nbody7_x<=nbody6_x;
            nbody7_y<=nbody6_y;
            nbody8_x<=nbody7_x;
            nbody8_y<=nbody7_y;
            nbody9_x<=nbody8_x;
            nbody9_y<=nbody8_y;
        end
        
        if(body_l==4'd10)
        begin
            nbody4_x<=nbody3_x;
            nbody4_y<=nbody3_y;
            nbody5_x<=nbody4_x;
            nbody5_y<=nbody4_y;
            nbody6_x<=nbody5_x;
            nbody6_y<=nbody5_y;
            nbody7_x<=nbody6_x;
            nbody7_y<=nbody6_y;
            nbody8_x<=nbody7_x;
            nbody8_y<=nbody7_y;
            nbody9_x<=nbody8_x;
            nbody9_y<=nbody8_y;
            nbody10_x<=nbody9_x;
            nbody10_y<=nbody9_y;
        end
        
        if(rst)
        begin
            nhead_x<=12'd900;
            nhead_y<=12'd500;
            nbody1_x<=12'd880;
            nbody1_y<=12'd500;
            nbody2_x<=12'd860;
            nbody2_y<=12'd500;
            nbody3_x<=12'd840;
            nbody3_y<=12'd500;
            nbody4_x<=12'd30;
            nbody4_y<=12'd30;
            nbody5_x<=12'd30;
            nbody5_y<=12'd30;  
            nbody6_x<=12'd30;
            nbody6_y<=12'd30; 
            nbody7_x<=12'd30;
            nbody7_y<=12'd30;  
            nbody8_x<=12'd30;
            nbody8_y<=12'd30;
            nbody9_x<=12'd30;
            nbody9_y<=12'd30;  
            nbody10_x<=12'd30;
            nbody10_y<=12'd30;
        end
    end
endmodule
