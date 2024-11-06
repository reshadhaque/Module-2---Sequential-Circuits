`timescale 1ns / 1ps


module mod_m_counter_tb();

localparam M = 10;
localparam T = 20; //Clock period

logic clk, reset;
logic max_tick;
logic [$clog2(M)-1:0] q;

mod_m_counter #(.M(M)) dut1(
    .clk(clk),
    .reset(reset),
    .max_tick(max_tick),
    .q(q)
);

always
begin
    clk = 1'b0;
    #(T / 2);
    clk = 1'b1;
    #(T / 2);
end

//initial reset
initial
begin
    reset = 1'b1;
    @(negedge clk)
    reset = 1'b0;
end


endmodule

    
