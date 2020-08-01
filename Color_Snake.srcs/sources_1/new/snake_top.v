`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/27 14:32:14
// Design Name: 
// Module Name: snake_top
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


module snake_top(
    input clk_100MHz,
    input key_1,
    input key_2,
    output led_1,
    output led_2,
    output TMDS_Tx_Clk_N,
    output TMDS_Tx_Clk_P,
    output [2:0]TMDS_Tx_Data_N,
    output [2:0]TMDS_Tx_Data_P
    );
    
    wire clk_system;
    wire clk_100MHz_p;
    wire clk_2Hz;
    wire clk_10Hz;
    wire [23:0]RGB_Data;
    wire [23:0]RGB_In;
    wire RGB_HSync;
    wire RGB_VSync;
    wire RGB_VDE;
    wire [11:0]Set_X;
    wire [11:0]Set_Y;
    wire [23:0]C_Background;
    wire [23:0]C_body;
    wire apple_status;
    wire rst;
    
    wire [11:0]apple_x;
    wire [11:0]apple_y;
    wire [11:0]nhead_x;
    wire [11:0]nhead_y;
    wire [11:0]nbody1_x;
    wire [11:0]nbody1_y;
    wire [11:0]nbody2_x;
    wire [11:0]nbody2_y;
    wire [11:0]nbody3_x;
    wire [11:0]nbody3_y;
    wire [11:0]nbody4_x;
    wire [11:0]nbody4_y;
    wire [11:0]nbody5_x;
    wire [11:0]nbody5_y;
    wire [11:0]nbody6_x;
    wire [11:0]nbody6_y;
    wire [11:0]nbody7_x;
    wire [11:0]nbody7_y;
    wire [11:0]nbody8_x;
    wire [11:0]nbody8_y;
    wire [11:0]nbody9_x;
    wire [11:0]nbody9_y;
    wire [11:0]nbody10_x;
    wire [11:0]nbody10_y;
    
    wire [3:0]body_l;
//    wire [7:0]body_xl;
//    wire [7:0]body_yl;
    wire [1:0]direct;
    wire k1;
    wire k2;

    clk_wiz_0 clk_10(.clk_out2(clk_100MHz_p),.clk_out1(clk_system),.clk_in1(clk_100MHz));
    
    clk_div clk_div0(
        .clk_100MHz(clk_100MHz_p),
        .clk_2Hz(clk_2Hz),
        .clk_10Hz(clk_10Hz)
    );
    
    key_pro key_pro0(
      .clk_100MHz(clk_100MHz_p),
      .key_1(key_1),
      .key_2(key_2),
      .k1(k1),
      .k2(k2)  
    );
    
    die_judge die_judge0(
        .clk_2Hz(clk_2Hz),
        .nhead_x(nhead_x),
        .nhead_y(nhead_y),
        .nbody1_x(nbody1_x),
        .nbody1_y(nbody1_y),
        .nbody2_x(nbody2_x),
        .nbody2_y(nbody2_y),
        .nbody3_x(nbody3_x),
        .nbody3_y(nbody3_y),
        .nbody4_x(nbody4_x),
        .nbody4_y(nbody4_y),
        .nbody5_x(nbody5_x),
        .nbody5_y(nbody5_y),
        .nbody6_x(nbody6_x),
        .nbody6_y(nbody6_y),
        .nbody7_x(nbody7_x),
        .nbody7_y(nbody7_y),
        .nbody8_x(nbody8_x),
        .nbody8_y(nbody8_y),
        .nbody9_x(nbody9_x),
        .nbody9_y(nbody9_y),
        .nbody10_x(nbody10_x),
        .nbody10_y(nbody10_y),
        
        .rst(rst)
    );
    
    key_direct key_direct0(
        .clk_10Hz(clk_10Hz),
        .rst(rst),
        .k1(k1),
        .k2(k2),
        .direct(direct),
        .led_1(led_1),
        .led_2(led_2)
    );
    
    Change_ground Change_ground0(
        .clk_2Hz(clk_2Hz),
        .C_Background(C_Background)
    );
    
    create_apple create_apple0(
        .clk_100MHz(clk_100MHz_p),
        .clk_2Hz(clk_2Hz), 
        .apple_status(apple_status),
        .apple_x(apple_x),
        .apple_y(apple_y)
    );
    
    eat_apple eat_apple0(
        .clk_2Hz(clk_2Hz),
        .rst(rst),
        .nhead_x(nhead_x),
        .nhead_y(nhead_y),
        .apple_x(apple_x),
        .apple_y(apple_y),
        .apple_status(apple_status),
        .body_l(body_l),
        .C_body(C_body)
    );
    
    Snake_position Snake_position0(
        .clk_2Hz(clk_2Hz),
        .rst(rst),
        .direct(direct),
        .body_l(body_l),
        .nhead_x(nhead_x),
        .nhead_y(nhead_y),
        .nbody1_x(nbody1_x),
        .nbody1_y(nbody1_y),
        .nbody2_x(nbody2_x),
        .nbody2_y(nbody2_y),
        .nbody3_x(nbody3_x),
        .nbody3_y(nbody3_y),
        .nbody4_x(nbody4_x),
        .nbody4_y(nbody4_y),
        .nbody5_x(nbody5_x),
        .nbody5_y(nbody5_y),
        .nbody6_x(nbody6_x),
        .nbody6_y(nbody6_y),
        .nbody7_x(nbody7_x),
        .nbody7_y(nbody7_y),
        .nbody8_x(nbody8_x),
        .nbody8_y(nbody8_y),
        .nbody9_x(nbody9_x),
        .nbody9_y(nbody9_y),
        .nbody10_x(nbody10_x),
        .nbody10_y(nbody10_y)
    );
    
    rgb2dvi_0 rgb2dvi(
        .TMDS_Clk_p(TMDS_Tx_Clk_P),
        .TMDS_Clk_n(TMDS_Tx_Clk_N),
        .TMDS_Data_p(TMDS_Tx_Data_P),
        .TMDS_Data_n(TMDS_Tx_Data_N),
        .aRst_n(1),
        .vid_pData(RGB_Data),
        .vid_pVDE(RGB_VDE),
        .vid_pHSync(RGB_HSync),
        .vid_pVSync(RGB_VSync),
        .PixelClk(clk_system)
    );
    
    Driver_HDMI Driver_HDMI0(
        .clk(clk_system), //Clock
        .rst(1), //Reset signal, low reset
        //.Video_Mode(0), //Video format, 0 is 1920*1080@60Hz, 1 is 1280*720@60Hz
        .RGB_In(RGB_In), //Input data
        .RGB_Data(RGB_Data), //Output Data
        .RGB_HSync(RGB_HSync), //Line signal
        .RGB_VSync(RGB_VSync), //Field signal
        .RGB_VDE(RGB_VDE), //Data valid signal
        .Set_X(Set_X), //Image coordinate X
        .Set_Y(Set_Y) //Image coordinate Y
    );
    
    Video_Generator Video_Generator0(
        .clk(clk_system),       
        .RGB_VDE(RGB_VDE),
        .direct(direct),
        .apple_x(apple_x),
        .apple_y(apple_y),
        .nhead_x(nhead_x),
        .nhead_y(nhead_y),
        .nbody1_x(nbody1_x),
        .nbody1_y(nbody1_y),
        .nbody2_x(nbody2_x),
        .nbody2_y(nbody2_y),
        .nbody3_x(nbody3_x),
        .nbody3_y(nbody3_y),
        .nbody4_x(nbody4_x),
        .nbody4_y(nbody4_y),
        .nbody5_x(nbody5_x),
        .nbody5_y(nbody5_y),
        .nbody6_x(nbody6_x),
        .nbody6_y(nbody6_y),
        .nbody7_x(nbody7_x),
        .nbody7_y(nbody7_y),
        .nbody8_x(nbody8_x),
        .nbody8_y(nbody8_y),
        .nbody9_x(nbody9_x),
        .nbody9_y(nbody9_y),
        .nbody10_x(nbody10_x),
        .nbody10_y(nbody10_y),
        
        .C_Background(C_Background),
        .C_body(C_body),
        .Set_X(Set_X),
        .Set_Y(Set_Y),
        .RGB_Data(RGB_In) //RBG
    );
endmodule
