`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/24 10:23:49
// Design Name: 
// Module Name: tb_traffic_light
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


module tb_traffic_light;
    reg clk, rst;
    wire G1, Y1, R1, G2, Y2, R2;
    
    traffic_light U0 (clk, rst, G1, Y1, R1, G2, Y2, R2);
    initial begin
    clk = 1'b0;
    rst = 1'b0;
    #100;
    rst = 1'b1;
    #700;
    $finish;
    end
    always #5 clk = ~clk;
endmodule
