module mnist_nn (
	input clk,
	input reset

);







wire signed [7:0] weight_value;

reg [9:0] inp_count;

weight_memory weight_mem_0(.address(inp_count),
										.clock(clk),
										.q(weight_value) 
										);
										

										
										
endmodule