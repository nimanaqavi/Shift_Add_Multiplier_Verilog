module Shift_Add_Multiplier_TOP (
    input [3:0] A_BUS ,
    input [3:0] B_BUS ,
    input start ,
    input clk ,
    input rst ,
    output Done ,
    output [7:0] Resualt
);
wire LOAD_A , LOAD_B , LOAD_P , A0 , SHIFT_A , init_p , select ;
Shift_Add_Multiplier_Controler uut1( .clk(clk) , .rst(rst) , .start(start) , .A0(A0) , .LOAD_A(LOAD_A) , .LOAD_B(LOAD_B) ,.LOAD_P(LOAD_P) , .SHIFT_A(SHIFT_A) , .init_P(init_p) , .select(select) , .Done(Done));
Shift_Add_Multiplier_DP uut2( .A_BUS(A_BUS) , .B_BUS(B_BUS) , .clk(clk) , .rst(rst) , .A0(A0) , .LOAD_A(LOAD_A) , .LOAD_B(LOAD_B) ,.LOAD_P(LOAD_P) , .SHIFT_A(SHIFT_A) , .init_P(init_p) , .select(select) , .Resualt(Resualt));

endmodule
