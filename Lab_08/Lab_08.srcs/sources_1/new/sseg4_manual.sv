`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 09:00:35 PM
// Design Name: 
// Module Name: sseg4_manual
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


module sseg4_manual(
    input [15:0] sw,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    
    sseg4 s4(
     .data({0, sw[11:0]}),
     .hex_dec(sw[15]),
     .sign(sw[14]),
     .digit_sel(sw[13:12]),
     .seg(seg),
     .dp(dp),
     .an(an)
    ); 
endmodule
