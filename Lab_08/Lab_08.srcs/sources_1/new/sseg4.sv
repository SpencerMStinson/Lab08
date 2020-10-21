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
    output [3:0] an
    );
    wire [15:0] in0;
    wire [15:0] m2out;
    wire [3:0] m4out;
    wire [6:0] out0; 
    wire [3:0] an_d_out;
   
    
   
    dd11b bcd11(
        .B(data[10:0]),
        .ones(in0[3:0]),
        .tens(in0[7:4]),
        .hundreds(in0[11:8]),
        .thousands(in0[15:12])
    );
    
    mux2 #(.BITS(16)) m2_seg (
        .in1(data),
        .in0(in0),
        .sel(hex_dec),
        .out(m2out)
    );
    
    mux4 m4_seg (
        .in0(m2out[3:0]),
        .in1(m2out[7:4]),
        .in2(m2out[11:8]),
        .in3(m2out[15:12]),
        .sel(digit_sel),
        .out(m4out)
    );
    
    sseg_decoder s_seg(
        .num(m4out),
        .sseg(out0)
    );
    
     an_decoder ad1 (
     .in(digit_sel),
     .out(an_d_out)
    );
     
    assign sel = sign & ~an_d_out[3]; 
    
    mux2 #(.BITS(7)) m2_seg2 (
        .in1(7'b0111111),
        .in0(out0),
        .sel(sel), 
        .out(seg)
    );
    
   
    
    assign dp = 1;
    assign an = an_d_out;

endmodule
