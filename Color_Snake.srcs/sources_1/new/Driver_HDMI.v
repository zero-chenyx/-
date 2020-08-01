`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/27 16:56:59
// Design Name: 
// Module Name: Driver_HDMI
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


module Driver_HDMI(
    input clk,
    input rst,
    //input Video_Mode,
    input [23:0]RGB_In,
    output [23:0]RGB_Data,
    output reg RGB_HSync=0,   
    output reg RGB_VSync=0, //Field signal
    output reg RGB_VDE=0, //Data valid signal
    output reg [11:0]Set_X=0, //Image coordinate X
    output reg [11:0]Set_Y=0 //Image coordinate Y
    );
    
    localparam H_ACTIVE_1920_1080 = 16'd1920;
    localparam H_FP_1920_1080 = 16'd88;
    localparam H_SYNC_1920_1080 = 16'd44;
    localparam H_BP_1920_1080 = 16'd148;
    localparam V_ACTIVE_1920_1080 = 16'd1080;
    localparam V_FP_1920_1080 = 16'd4;
    localparam V_SYNC_1920_1080 = 16'd5;
    localparam V_BP_1920_1080 = 16'd36;
    localparam H_TOTAL_1920_1080 = H_ACTIVE_1920_1080 + H_FP_1920_1080 + H_SYNC_1920_1080 + H_BP_1920_1080;
    localparam V_TOTAL_1920_1080 = V_ACTIVE_1920_1080 + V_FP_1920_1080 + V_SYNC_1920_1080 + V_BP_1920_1080;
    wire [11:0]H_ACTIVE; //Line effective length (number of pixel clock cycles)
    wire [11:0]H_FP; //Line sync front shoulder length
    wire [11:0]H_SYNC; //Line sync length
    wire [11:0]H_BP; //Line sync shoulder length
    wire [11:0]V_ACTIVE; //Field effective length (number of rows)
    wire [11:0]V_FP; //Field sync front shoulder length
    wire [11:0]V_SYNC; //Field sync length
    wire [11:0]V_BP; //Field sync back shoulder length
    wire [11:0]H_TOTAL; //Total length of line
    wire [11:0]V_TOTAL; //Total length of field    
    
    reg [11:0]HSync_Cnt=0;
    reg [11:0]VSync_Cnt=0;    
    reg H_De=0;
    reg V_De=0;
    assign RGB_Data=RGB_In;
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                Set_X<=0;
                Set_Y<=0;
            end
        else
            begin
                if(HSync_Cnt>=H_FP_1920_1080 + H_SYNC_1920_1080 + H_BP_1920_1080 - 1)
                    Set_X <= HSync_Cnt - (H_FP_1920_1080 + H_SYNC_1920_1080 + H_BP_1920_1080 - 1);
                if(VSync_Cnt>=V_FP_1920_1080 + V_SYNC_1920_1080 + V_BP_1920_1080 - 1)
                    Set_Y<=VSync_Cnt-(V_FP_1920_1080 + V_SYNC_1920_1080 + V_BP_1920_1080 - 1);
            end
    end
        
    
        assign H_ACTIVE=H_ACTIVE_1920_1080; //Line effective length (number of pixel clock cycles)
        assign H_FP=H_FP_1920_1080; //Line sync front shoulder length
        assign H_SYNC=H_SYNC_1920_1080; //Line sync length
        assign H_BP=H_BP_1920_1080; //Line sync back shoulder length
        assign V_ACTIVE=V_ACTIVE_1920_1080; //Field effective length (number of rows)
        assign V_FP=V_FP_1920_1080; //Field sync front shoulder length
        assign V_SYNC=V_SYNC_1920_1080; //Field sync length
        assign V_BP=V_BP_1920_1080; //Field sync back shoulder length
        assign H_TOTAL=H_TOTAL_1920_1080; //Total length of line
        assign V_TOTAL=V_TOTAL_1920_1080; //Total length of field            
    

    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            HSync_Cnt<=0;
        else
            begin
                if(HSync_Cnt==H_TOTAL-1)
                    HSync_Cnt<=0;
                else
                    HSync_Cnt<=HSync_Cnt+1;
            end
    end

    always@(posedge clk or negedge rst)
    begin
        if(!rst) 
            VSync_Cnt<=0;
        else
            begin
                if(HSync_Cnt==H_FP-1)
                begin
                    if(VSync_Cnt==V_TOTAL-1)
                        VSync_Cnt<=0;
                    else
                        VSync_Cnt<=VSync_Cnt+1;
                end
            end
    end

    always@(posedge clk or negedge rst)
    begin
        if(!rst) 
            H_De<=0;
        else
            begin
                if(HSync_Cnt==H_FP + H_SYNC + H_BP - 1)
                    H_De<=1;
                else if(HSync_Cnt==H_TOTAL-1)
                    H_De<=0;
            end
    end
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            V_De<=0;
        else
            begin
                if(HSync_Cnt==H_FP-1)
                    begin
                        if(VSync_Cnt==V_FP + V_SYNC + V_BP - 1)
                            V_De<=1;
                        else if(VSync_Cnt==V_TOTAL-1)
                            V_De<=0;
                    end
            end
    end

    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            RGB_VDE<=0;
        else
            RGB_VDE<=H_De&V_De;
        end
        
    always@(posedge clk or negedge rst)
    begin
        if(!rst) 
            RGB_HSync<=0;
        else
            begin
                if(HSync_Cnt==H_FP-1)
                    RGB_HSync<=1;
                else if(HSync_Cnt==H_FP + H_SYNC - 1)
                    RGB_HSync<=0;
            end
    end
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            RGB_VSync<=0; 
        else
            begin
                if(HSync_Cnt==H_FP-1)
                begin
                    if(VSync_Cnt==V_FP-1)
                        RGB_VSync<=1;
                    else if(VSync_Cnt==V_FP + V_SYNC - 1)
                        RGB_VSync<=0;
                end
            end
    end
endmodule
