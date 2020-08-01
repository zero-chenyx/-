`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 15:28:28
// Design Name: 
// Module Name: eat_apple
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


module eat_apple(
    input clk_2Hz,
    input rst,
    input [11:0]nhead_x,
    input [11:0]nhead_y,
    input [11:0]apple_x,
    input [11:0]apple_y,
    output reg apple_status=0,
    output reg [3:0]body_l,
    output reg [23:0]C_body=24'hffff00
    );
    reg [3:0]ini_l=4'd3;
    
    always@(posedge clk_2Hz or posedge rst)
    begin
        if (rst)
        begin
            ini_l <= 4'd3;
            body_l <= 4'd3;
        end
        else
        begin
            if((nhead_x == apple_x) && (nhead_y == apple_y))
            begin
                apple_status <= 0;
                if(body_l < 10)
                begin
                    ini_l <= ini_l+1;
                    body_l <= ini_l+1;
                end
                C_body = C_body>>4;
                if(C_body==24'h0000ff)
                    C_body=24'hffff00;
            end
            else
            begin
                apple_status <= 1;
                body_l <= ini_l;
            end
        end
    end
    
endmodule
