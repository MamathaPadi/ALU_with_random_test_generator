`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2026 08:17:31 AM
// Design Name: 
// Module Name: ALU_rtb
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


module ALU_rtb;
//ALU with srandom testbench generator
reg [7:0]a,b;
reg [2:0]sel;
wire [8:0]y;

reg [8:0]expected_y;
integer error;
integer i;

ALU dut(.a(a),.b(b),.sel(sel),.y(y));

initial begin
    error=0;
    for(i=0;i<30;i=i+1) begin
        #5
        a=$random;
        b=$random;
        sel=$random;
        //reference model
        #5 case(sel)
                3'b000:expected_y=a+b; //addition
                3'b001:expected_y=a-b; //subtraction
                3'b010:expected_y=a&b; //and
                3'b011:expected_y=a|b; //or
                3'b100:expected_y=a^b; //xor
                3'b101:expected_y=~a; //not
                3'b110:expected_y=a<<b; //shift left
                3'b111:expected_y=a>>b; //shift right
            endcase
         if(y!=expected_y) begin
            $display("%0t test case for a=%0d,b=%0d,sel=%d failed",$time,a,b,sel);
            error=error+1;
         end
         else
            $display("%0t test case for a=%0d,b=%0d,sel=%d success",$time,a,b,sel);
    end
end
endmodule
