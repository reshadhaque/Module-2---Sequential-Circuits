module ulv_shift_reg
    #(parameter N = 8)
    (
        input logic clk, reset,
        input logic [1:0] ctrl,
        input logic [N-1:0] d,
        output logic [N-1:0] q
    );

    logic [N-1:0] r_next, r_reg;

    always_comb
    begin
        case(ctrl)
        2'b00: r_next = r_reg;
        2'b01:  r_next = {r_reg[N-2:0], d[0]};
        2'b10: r_next = {d[N-1], r_reg[N-1:1]};
        2'b11: r_next = d;
        endcase
    end

    always_ff@(posedge clk)
    begin
        if (reset)
            r_reg <= 0;
        else 
            r_reg <= r_next;
    end
    assign q = r_reg;
endmodule