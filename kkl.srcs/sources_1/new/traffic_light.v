`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/24 10:11:46
// Design Name: 
// Module Name: traffic_light
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


module traffic_light(clk,rst,G1,Y1,R1,G2,Y2,R2);
input clk,rst/*,test*/;
output G1 ,Y1,R1,G2,Y2,R2;

parameter YY=3'b000,RY = 3'b001, GR=3'b010, YR=3'b011, RG=3'b100;
reg[2:0]   state=YY;

parameter RGTime=10, RYTime=3, GRTime=15, YRTime=3;

integer    TimeCnt, onTime;

reg     G1=1'b0, Y1=1'b0, R1=1'b0;
reg     G2=1'b0, Y2=1'b0, R2=1'b0;
always@ (posedge clk or negedge rst) begin
    if(!rst) begin
        state <= YY;
        TimeCnt <= 0;
    end     else
        case(state)
            RG: begin
                onTime <= RGTime;
                TimeCnt <= TimeCnt + 1;
                if(TimeCnt == onTime) begin
                    state <= RY;
                    TimeCnt <= 0;
                end
           end
           
           RY: begin
                onTime <= RYTime;
                TimeCnt <= TimeCnt + 1;
                if(TimeCnt == onTime) begin
                    state <= GR;
                    TimeCnt <= 0;
                end
            end
            GR: begin
                onTime <= GRTime;
                TimeCnt <= TimeCnt + 1;
                if(TimeCnt == onTime) begin
                    state <= YR;
                    TimeCnt <= 0;
                end
            end
            YR: begin
                            onTime <= YRTime;
                            TimeCnt <= TimeCnt + 1;
                            if(TimeCnt == onTime) begin
                                state <= RG;
                                TimeCnt <= 0;
                            end
                        end
            YY:
                state <= RY;
            endcase
       end
       always@ (state) begin
            case(state)
                RG:begin
                    R1 <= 1'b1; Y1<= 1'b0; G1<= 1'b0;
                    R2 <= 1'b0; Y2<= 1'b0; G2<= 1'b1; 
                end
                RY:begin
                    R1 <= 1'b1; Y1<= 1'b0; G1<= 1'b0;
                    R2 <= 1'b0; Y2<= 1'b1; G2<= 1'b0;
                end
                 GR:begin
                    R1 <= 1'b0; Y1<= 1'b0; G1<= 1'b1;
                    R2 <= 1'b1; Y2<= 1'b0; G2<= 1'b0;
                end
                 YR:begin
                    R1 <= 1'b0; Y1<= 1'b1; G1<= 1'b00;
                    R2 <= 1'b1; Y2<= 1'b0; G2<= 1'b0;
                end
                 YY:begin
                    R1 <= 1'b0; Y1<= 1'b1; G1<= 1'b0;
                    R2 <= 1'b0; Y2<= 1'b1; G2<= 1'b0;
                end
           default:;
       endcase
   end                        
endmodule
