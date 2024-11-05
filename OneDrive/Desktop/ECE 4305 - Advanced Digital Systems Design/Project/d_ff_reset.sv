module d_ff_reset(
	input logic d,
	input logic clk,
	input logic rst,
	output logic q
	);
	
	always_ff@(posedge clk, posedge rst)
	begin	
		if(rst)
			q<=0;
		else
			q<=d;
	end
endmodule