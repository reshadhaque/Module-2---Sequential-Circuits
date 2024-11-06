
module binary_counter
    #(parameter N = 8)
    (
        input logic clk, reset,
        output logic max_tick,
        output logic [N-1:0] q
    );

    logic [N-1:0] r_next, r_reg;

    always_ff@(posedge clk)
    begin
        if (reset)
            r_reg <= 0;
        else 
            r_reg <= r_next;
    end
	 
    assign r_next = r_reg + 1;
	 
    assign q = r_reg;

    assign max_tick = (r_reg == 2**N-1) ? 1'b1 : 1'b0;
	 
endmodule