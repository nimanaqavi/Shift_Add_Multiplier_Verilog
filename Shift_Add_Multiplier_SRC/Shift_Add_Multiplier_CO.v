module Shift_Add_Multiplier_Controler (
    input clk , rst, start, A0,
    output reg LOAD_A, SHIFT_A, LOAD_B, LOAD_P, init_P, Done, select
);
    reg [1:0] count; 
    reg init_counter, counter_en;
    wire co;
    reg [1:0] ns, ps;
    parameter IDLE = 2'b00, INIT = 2'b01, LOAD = 2'b10, ADDING = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 2'b00;
        else if (init_counter) 
            count <= 2'b00;
        else if (counter_en) 
            count <= count + 1;
    end
    assign co = (count == 2'b11);

    always @(posedge clk or posedge rst) begin
        if (rst) 
            ps <= IDLE;
        else 
            ps <= ns;
    end

    always @(*) begin
        ns = IDLE;
        {LOAD_A, SHIFT_A, LOAD_B, LOAD_P, init_P, Done, select, counter_en, init_counter} = 0;
        case (ps)
            IDLE: begin
                Done = 1;
                ns = start ? INIT : IDLE;
            end
            INIT: begin
                init_P = 1;
                init_counter = 1;
                ns = start ? INIT : LOAD;
            end
            LOAD: begin
                LOAD_A = 1;
                LOAD_B = 1;
                ns = ADDING;
            end
            ADDING: begin
                select = A0; 
                LOAD_P = 1;
                SHIFT_A = 1;
                counter_en = 1;
                ns = co ? IDLE : ADDING;
            end
        endcase
    end
endmodule