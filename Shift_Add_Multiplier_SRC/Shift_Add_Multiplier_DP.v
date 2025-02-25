module Shift_Add_Multiplier_DP (
    input [3:0] A_BUS ,
    input [3:0] B_BUS ,
    input clk ,
    input rst ,
    input LOAD_A ,
    input LOAD_B ,
    input LOAD_P ,
    input init_P ,
    input SHIFT_A ,
    input select ,
    output A0 ,
    output [7:0] Resualt
);
    reg [3:0] A_REG , B_REG , P_REG ;
    wire [4:0] ADD ;
    wire [3:0] selected ;
    always @(posedge clk or posedge rst) begin
        if (rst)
            B_REG <= 4'b0000 ;
        else if (LOAD_B)
            B_REG <= B_BUS;
    end
    always @(posedge clk or posedge rst) begin
        if (rst)
            P_REG <= 4'b0000 ;
        else if (init_P)
            P_REG <= 4'b0000 ;
        else if (LOAD_P)
            P_REG <= ADD[4:1] ;
    end
    always @(posedge clk or posedge rst) begin
        if (rst)
            A_REG <= 4'b0000 ;
        else if (LOAD_A)
            A_REG <= A_BUS ;
        else if (SHIFT_A)
            A_REG <= {ADD[0], A_REG[3:1]};
    end
    assign selected = select ? B_REG : 4'b0000 ;
    assign ADD = {1'b0, P_REG} + {1'b0, selected} ;
    assign A0 = A_REG[0] ;
    assign Resualt = {P_REG,A_REG}; 
endmodule
