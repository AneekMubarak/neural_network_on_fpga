module mnist_nn (
	input clk,
	input reset,
	output reg [9:0] inp_count,
	output reg [9:0] inp_count_d,
	output wire [15:0] weight_value_0, weight_value_1

);







//wire signed [7:0] weight_value_0, weight_value_1, weight_value_2, weight_value_3, weight_value_4, weight_value_5, weight_value_6, weight_value_7, weight_value_8, weight_value_9;
  
//reg [9:0] inp_count;

always @ (posedge clk)
if (reset) 
	inp_count <= 10'b0;
else if (inp_count == 10'd783) //reset in next cycle
	inp_count <= 10'd0;
else
	inp_count <= inp_count + 1'b1;

	
always @ (posedge clk)
	inp_count_d <= inp_count;

weight_mem0 neuron0_weights(.address(inp_count),
										.clock(~clk),
										.q(weight_value_0) 
										);
										
weight_mem1 neuron1_weights(.address(inp_count),
										.clock(~clk),
										.q(weight_value_1) 
										);
										


										


										

										

										
										
endmodule