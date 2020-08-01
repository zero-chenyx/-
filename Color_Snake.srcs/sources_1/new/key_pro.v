`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 16:38:28
// Design Name: 
// Module Name: key_pro
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


module key_pro(
    input clk_100MHz,
    input key_1,
    input key_2,
    output reg k1,
    output reg k2
    );
    
    //reg [1:0]k_1=2'b11;
    //reg [1:0]k_2=2'b11;
    reg [24:0]cnt_1=0;
    reg [24:0]cnt_2=0;
    
    
    always@(posedge clk_100MHz)
    begin
        if(key_1==0)
        begin
            if(cnt_1==5000000)
            begin
                k1=0;
            end
            else
                cnt_1 = cnt_1+1;
        end
        else
        begin
            cnt_1=0;
            k1=1;
        end
        
        if(key_2==0)
        begin
            if(cnt_2==5000000)
            begin
                k2=0;                
            end
            else
                cnt_2 = cnt_2+1;
        end
        else
        begin
            cnt_2=0;
            k2=1;
        end
    end
endmodule
