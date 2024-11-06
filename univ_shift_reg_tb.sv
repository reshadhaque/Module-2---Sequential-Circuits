timescale 1ns / 1ps

module univ_shift_reg_tb();
//Signal Declaration
localparam N = 8;
localparam T = 20; //Clock Period

logic clk, reset;
logic [1:0] ctrl;
logic [N-1:0] d;
logic [N-1:0] q;
//Unistantiace Design Under Test

univ_shift_reg #(.N(N)) dut0(.*);

//Generate Test Vectors

//Clock Genration
always
begin
    clk = 1'b1;
    #(T/2);
    clk = 1'b0;
    #(T/2);
end

//Reset for the first half of the cycle
initial
begin
    reset = 1'b1;
    #(T/2);
    reset = 1'b0;
end

//Generate Stimuli
initial
begin
    //initial input value
    d = 5;
    ctrl = 2'b11;
    //wait for 15 nanoseconds
    #15;
end


//Monitor Display
endmodule