`timescale 1ps/1ps
module TB ();
    reg [3:0] A,B;
    reg start , clk , rst ;
    wire Done;
    wire [7:0] out ;
    Shift_Add_Multiplier_TOP uut(A,B,start,clk , rst , Done , out);
    always #5 clk = ~clk;


    initial begin
 
        clk = 0;
        rst = 1;
        start = 0;
        A = 4'b0101; // 11 in decimal
        B = 4'b0011; // 2 in decimal
        #22;

        rst = 0;
        start = 1;
        #10;
        start = 0;

        wait (Done);
        #50;


        rst = 1;
        #12
        rst = 0;

    
        A = 4'b1011; // 11 in decimal
        B = 4'b1101; // 13 in decimal
        start = 1;
        #10;
        start = 0;
        wait (Done);
        #50;

    
        $stop;
    end
endmodule
