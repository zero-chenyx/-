`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/27 16:57:25
// Design Name: 
// Module Name: Video_Generator
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


module Video_Generator(
    input clk,   
    input RGB_VDE,
    input [1:0]direct,
    input [11:0]apple_x,
    input [11:0]apple_y,
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
    
    input [11:0]Set_X,
    input [11:0]Set_Y,
    input [23:0]C_Background,
    input [23:0]C_body,
    output reg[23:0]RGB_Data=24'hffffff
    );
    reg [8:0]Address=0;
    reg [8:0]Address_1=0;
    wire [7:0]R_Data;
    wire [7:0]G_Data;
    wire [7:0]B_Data;
    wire [7:0]R_Data_1;
    wire [7:0]G_Data_1;
    wire [7:0]B_Data_1;
  
    
    always@(*)
        begin           
           if(Set_X>=120&&Set_X<1800)
                begin
                    if(Set_Y>=80&&Set_Y<1000)
                        begin
                            if(Set_Y<=nhead_y+9 && Set_Y>=nhead_y-10 && Set_X<=nhead_x+9 && Set_X>=nhead_x-10)
                            begin
                            case(direct)
                                2'b00:
                                    begin
                                        Address=(Set_X-nhead_x+10)*20+(Set_Y-nhead_y+10);
                                        RGB_Data<={R_Data,B_Data,G_Data};
                                    end
                                2'b10:
                                    begin
                                        Address=(nhead_x+9-Set_X)*20+(Set_Y-nhead_y+10);
                                        RGB_Data<={R_Data,B_Data,G_Data};
                                    end
                                2'b01:
                                    begin
                                        Address=(nhead_y+9-Set_Y)*20+(nhead_x+9-Set_X);
                                        RGB_Data<={R_Data,B_Data,G_Data};
                                    end        
                                2'b11:
                                    begin
                                        Address=(Set_Y-nhead_y+10)*20+(Set_X-nhead_x+10);
                                        RGB_Data<={R_Data,B_Data,G_Data};
                                    end
                                
                                endcase
                            end
                            else if((Set_Y<=nbody1_y+9 && Set_Y>=nbody1_y-10 && Set_X>=nbody1_x-10 && Set_X<=nbody1_x+9)||
                            (Set_Y<=nbody2_y+9 && Set_Y>=nbody2_y-10 && Set_X>=nbody2_x-10 && Set_X<=nbody2_x+9)||
                            (Set_Y<=nbody3_y+9 && Set_Y>=nbody3_y-10 && Set_X>=nbody3_x-10 && Set_X<=nbody3_x+9)||
                            (Set_Y<=nbody4_y+9 && Set_Y>=nbody4_y-10 && Set_X>=nbody4_x-10 && Set_X<=nbody4_x+9)||
                            (Set_Y<=nbody5_y+9 && Set_Y>=nbody5_y-10 && Set_X>=nbody5_x-10 && Set_X<=nbody5_x+9)||
                            (Set_Y<=nbody6_y+9 && Set_Y>=nbody6_y-10 && Set_X>=nbody6_x-10 && Set_X<=nbody6_x+9)||
                            (Set_Y<=nbody7_y+9 && Set_Y>=nbody7_y-10 && Set_X>=nbody7_x-10 && Set_X<=nbody7_x+9)||
                            (Set_Y<=nbody8_y+9 && Set_Y>=nbody8_y-10 && Set_X>=nbody8_x-10 && Set_X<=nbody8_x+9)||
                            (Set_Y<=nbody9_y+9 && Set_Y>=nbody9_y-10 && Set_X>=nbody9_x-10 && Set_X<=nbody9_x+9)||
                            (Set_Y<=nbody10_y+9 && Set_Y>=nbody10_y-10 && Set_X>=nbody10_x-10 && Set_X<=nbody10_x+9)
                            )
                                RGB_Data<=C_body;
                            
                            else if(Set_Y<=apple_y+9 && Set_Y>=apple_y-10 && Set_X<=apple_x+9 && Set_X>=apple_x-10)
                            begin
                                Address_1=(Set_X-apple_x+10)*20+(Set_Y-apple_y+10);
                                RGB_Data<={G_Data_1,B_Data_1,R_Data_1};
                            end
                            else
                                RGB_Data<=24'hffffff;
                        end
                    else
                        RGB_Data<=C_Background;
                end
            else
            RGB_Data<=C_Background;
        end

    R_ROM R_ROM (
        .clka(clk), // input wire clka
        .ena(1), // input wire ena
        .addra(Address), // input wire [13 : 0] addra
        .douta(R_Data) // output wire [7 : 0] douta
    );
    G_ROM G_ROM (
        .clka(clk), // input wire clka
        .ena(1), // input wire ena
        .addra(Address), // input wire [13 : 0] addra
        .douta(G_Data) // output wire [7 : 0] douta
    );
    B_ROM B_ROM (
        .clka(clk), // input wire clka
        .ena(1), // input wire ena
        .addra(Address), // input wire [13 : 0] addra
        .douta(B_Data) // output wire [7 : 0] douta
    );
    
    BODY_R_ROM BODY_R_ROM (
        .clka(clk), // input wire clka
        .ena(1), // input wire ena
        .addra(Address_1), // input wire [13 : 0] addra
        .douta(R_Data_1) // output wire [7 : 0] douta
    );
    BODY_G_ROM BODY_G_ROM (
        .clka(clk), // input wire clka
        .ena(1), // input wire ena
        .addra(Address_1), // input wire [13 : 0] addra
        .douta(G_Data_1) // output wire [7 : 0] douta
    );
    BODY_B_ROM BODY_B_ROM (
        .clka(clk), // input wire clka
        .ena(1), // input wire ena
        .addra(Address_1), // input wire [13 : 0] addra
        .douta(B_Data_1) // output wire [7 : 0] douta
    );
   
endmodule
