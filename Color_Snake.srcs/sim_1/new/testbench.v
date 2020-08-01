`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 09:19:53
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    reg clk_100MHz;
    initial
        begin
            clk_100MHz = 0;
        end
        
    always #10 clk_100MHz = ~clk_100MHz;
    snake_top test(
        .clk_100MHz(clk_100MHz)
    );
endmodule
