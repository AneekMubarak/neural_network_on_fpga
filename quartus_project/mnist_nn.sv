module mnist_nn (
	input clk,
	input reset,
	input inp_rdy,
	output reg [9:0] inp_count,
	output wire signed [15:0] weight_value_0, weight_value_1

);







//wire signed [7:0] weight_value_0, weight_value_1, weight_value_2, weight_value_3, weight_value_4, weight_value_5, weight_value_6, weight_value_7, weight_value_8, weight_value_9;
  
//reg [9:0] inp_count;


wire inp_rdy_d;
	
always @ (posedge clk)
	inp_rdy_d <= inp_rdy;
	
	

always @ (posedge clk)
if (reset) 
	inp_count <= 10'b0;
else if (inp_count == 10'd783) //reset in next cycle
	inp_count <= 10'd0;
else if (inp_rdy)
	inp_count <= inp_count + 1'b1;
else
	inp_count <= 10'b0;

	
//always @ (posedge clk)
//	inp_count_d <= inp_count;
//	
	


weight_mem0 neuron0_weights(.address(inp_count),
										.clock(~clk),
										.q(weight_value_0),
										.rden(inp_rdy)
										);
										
weight_mem1 neuron1_weights(.address(inp_count),
										.clock(~clk),
										.q(weight_value_1),
										.rden(inp_rdy)
										);
										


										


										

										

										
										
endmodule