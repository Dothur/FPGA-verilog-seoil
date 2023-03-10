`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/24 10:22:47
// Design Name: 
// Module Name: frq_clk_1hz
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


module frq_clk_1hz(clk, reset, clk_out);
    parameter main_clk=100000000, output_freq=1;
    parameter clk_hilow_cnt_value=((main_clk/output_freq)/2)-1;
    input clk;
    input reset;
    output reg clk_out;
    
    integer clk_cnt;
    
    always@(negedge reset, posedge clk) begin
    if(reset == 1'b0) begin
        clk_cnt <= 0;
        clk_out <= 1'b0;
    end else begin
    if(clk_cnt== clk_hilow_cnt_value) begin
        clk_cnt <= 0;
        clk_out <= ~clk_out;
    end else
        clk_cnt <= clk_cnt+1;
    end
    end
endmodule
