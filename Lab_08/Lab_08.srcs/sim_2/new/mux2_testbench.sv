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


module mux2_testbench ();
localparam BITS=16; 
// instantiate wires 
    reg [BITS-1:0] in0_t;
    reg [BITS-1:0] in1_t;
    reg sel_t;
    wire [BITS-1:0] out_t;
// instantiate mux2 
    mux2 #(.BITS(BITS)) dut(
        .in0(in0_t), 
        .in1(in1_t), 
        .sel(sel_t), 
        .out(out_t)
    );
initial begin 
sel_t= 1;   in0_t= 16'hffff;      in1_t=16'h0000;       #10;
sel_t= 0;   #10;
sel_t= 1;   in0_t= 16'haaaa;      in1_t=16'h5555;       #10;
sel_t= 0;   #10;
sel_t= 1;   in0_t= 16'h0000;      in1_t=16'hffff;       #10;
sel_t= 0;   #10;
end 

endmodule 