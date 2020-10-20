`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 01:02:18 PM
// Design Name: 
// Module Name: sseg4
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


module sseg4(
    input [15:0] data,
    input hex_dec,
    input sign,
    input [1:0] digit_sel,
    output [6:0] seg,
    output dp,
    output [4:0] an
    );
    wire [15:0] in0;
    wire [3:0] m2out;
    wire [3:0] m4out;
    wire [6:0] out0; 
    wire [3:0] an_d_out;
   
    assign sel = sign & an_d_out[3]; 
   
    dd11b bcd11(
        .B(
    );
    
    mux2 #(.BITS(16)) m2_seg (
        .in1(data),
        .in0(in0),
        .sel(hex_dec),
        .out(m2out)
    );
    
    mux4 m4_seg (
        .in1(m2out[12:15]),
        .in2(m2out[8:11]),
        .in3(m2out[4:7]),
        .in4(m2out[0:3]),
        .sel(digit_sel),
        .out(m4out)
    );
    
    sseg_decoder s_seg(
        .in(m4out),
        .out(out0)
    );
    
    mux2 #(.BITS(7)) m2_seg2 (
        .in1(),
        .in0(out0),
        .sel(), 
        .out(seg)
    );
    
    an_decoder ad1 (
     .in(digit_sel),
     .out(an_d_out)
    );
    
    assign dp = 1;
    
endmodule
