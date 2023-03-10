`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/24 10:25:05
// Design Name: 
// Module Name: Top_module
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


module Top_module(clk, rst, G1, Y1, R1, G2, Y2, R2);
input clk, rst;
output G1, Y1, R1, G2, Y2, R2;
wire clk_1hz;
frq_clk_1hz u0(clk, rst, clk_1hz);
traffic_light u1(clk_1hz, rst, G1, Y1, R1, G2, Y2, R2);
endmodule
