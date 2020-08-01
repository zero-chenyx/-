`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 22:32:17
// Design Name: 
// Module Name: key_direct
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


module key_direct(
    input clk_10Hz,
    input rst,
    input k1,
    input k2,
    output reg [1:0]direct,
    output reg led_1,
    output reg led_2
    );
    
    reg [1:0]k;   
    reg [2:0]State_Next=3'b000;
    reg [2:0]State_Current=3'b000;
    reg all_key;
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b100;

//    assign all_key=k1&k2;
//    assign k={k1,k2};
    always@(*)
    begin
        all_key=k1&k2;
        k={k1,k2};
    end
    
    always@(posedge clk_10Hz or posedge rst)
    begin
        if (rst)
            State_Current <= s0;
        else
            State_Current <= State_Next;
    end

    always@(negedge all_key or posedge rst)
    begin
        if (rst)
            State_Next = s0;
        else
        case (State_Current)
            s0:
            begin
                if (k==2'b01)
                    State_Next = s1;
                else if (k==2'b10)   
                    State_Next = s3;
                else
                    State_Next = s0;     
            end
            s1:
            begin
                if (k==2'b01)
                    State_Next = s2;
                else if (k==2'b10)   
                    State_Next = s0;
                else
                    State_Next = s1;     
            end
            s2:
            begin
                if (k==2'b01)
                    State_Next = s3;
                else if (k==2'b10)   
                    State_Next = s1;
                else
                    State_Next = s2;     
            end
            s3:
            begin
                if (k==2'b01)
                    State_Next = s0;
                else if (k==2'b10)   
                    State_Next = s2;
                else
                    State_Next = s3;     
            end
            default: State_Next = 4'bxxxx;
        endcase
    end
    
    always@(State_Current)
    begin
        case(State_Current)
            s0: direct = 2'b00; //right
            s1: direct = 2'b01; //up
            s2: direct = 2'b10; //left
            s3: direct = 2'b11; //down
        endcase
        led_1 <= direct[0];
        led_2 <= direct[1];
    end
    
    
endmodule
