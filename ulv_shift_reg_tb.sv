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

//increment d every 2 clokc cycles
always
begin
    repeat(2) @(negedge clk); //Waits for every 2 clock cycles. Then at the negative edge of the 2nd Clock cycle the signal d increments by 1
    d = d + 1;
end

//Generate Stimuli
initial
begin
    //initial input value
    d = 5;
    ctrl = 2'b11;
    //wait for 15 nanoseconds
    #15;

    ctrl = 2'b00;

    wait (d == 10);

    ctrl == 2'b11;

    @(negedge clk);
    ctrl = 2'b01;

    #(5 * T); //Wait for 100 nanoseconds
    $stop;

end


//Monitor Display
endmodule