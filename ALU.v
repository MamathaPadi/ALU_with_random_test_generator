`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2026 04:13:17 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
input [7:0]a,b,
input [2:0]sel,
output reg [8:0]y
);
    
always@(*) begin
    case(sel)
        3'b000:y=a+b; //addition
        3'b001:y=a-b; //subtraction
        3'b010:y=a&b; //and
        3'b011:y=a|b; //or
        3'b100:y=a^b; //xor
        3'b101:y=~a; //not
        3'b110:y=a<<b; //shift left
        3'b111:y=a>>b; //shift right
    endcase
end
endmodule
