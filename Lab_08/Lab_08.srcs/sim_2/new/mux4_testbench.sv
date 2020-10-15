`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 11:37:37 AM
// Design Name: 
// Module Name: mux2
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


module mux4_testbench #(localparam BITS =4) ();
    reg [BITS-1:0] in0_t;
    reg [BITS-1:0] in1_t;
    reg [BITS-1:0] in2_t;
    reg [BITS-1:0] in3_t;
    reg [1:0] sel_t;
    wire [BITS-1:0] out_t;

mux4 dut( 
    .in0(in0_t), 
    .in1(in1_t),
    .in2(in2_t),
    .in3(in3_t),
    .sel(sel_t),
    .out(out_t)
    );

initial begin 
    sel_t = 2'b00; in0_t = 4'b0000; in1_t = 4'b1111; in2_t = 4'b1010; in3_t = 4'b0101; #10;
    sel_t = 2'b01; #10;
    sel_t = 2'b10; #10;
    sel_t = 2'b11; #10; 
    sel_t = 2'b00; in0_t = 4'b1111; in1_t = 4'b0000; in2_t = 4'b0101; in3_t = 4'b1010; #10;
    sel_t = 2'b01; #10;
    sel_t = 2'b10; #10;
    sel_t = 2'b11; #10; 
end
endmodule 