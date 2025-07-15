module mnist_nn (
	input clk,
	input reset,
	input inp_rdy,
	input signed [15:0] inp_data,
	
	output reg [9:0] inp_count,
	output wire signed [15:0] weight_value_0, weight_value_1,
	output wire [7:0] n0_out,n1_out,
	output reg n0_ready, n1_ready

);






//reg [7:0] n0_out,n1_out,n2_out,n3_out,n4_out,n5_out,n6_out,n7_out,n8_out,n9_out;

//reg n0_ready, n1_ready, n2_ready, n3_ready, n4_ready, n5_ready, n6_ready, n7_ready, n8_ready, n9_ready;




//q8.8 signed biases for 10 output neurons
localparam signed [15:0] bias_0 = 16'hFF4B;  // -0.796875
localparam signed [15:0] bias_1 = 16'h008C;  // 1.375000
localparam signed [15:0] bias_2 = 16'h003D;  // 0.238281
localparam signed [15:0] bias_3 = 16'hFF8C;  // -0.761719
localparam signed [15:0] bias_4 = 16'hFFFC;  // -0.015625
localparam signed [15:0] bias_5 = 16'h020D;  // 2.050781
localparam signed [15:0] bias_6 = 16'hFFC5;  // -0.187500
localparam signed [15:0] bias_7 = 16'h0119;  // 1.097656
localparam signed [15:0] bias_8 = 16'hFDE7;  // -2.089844
localparam signed [15:0] bias_9 = 16'hFF96;  // -0.406250


always @ (posedge clk)
if (reset) 
	inp_count <= 10'b0;
else if (inp_count == 10'd783) //reset in next cycle
	inp_count <= 10'd0;
else if (inp_rdy)
	inp_count <= inp_count + 1'b1;
else
	inp_count <= 10'b0;

	


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
										


neuron n0 (.clk(clk),
				.reset(reset),
				.inp_ready(inp_rdy),
				.inp_data(inp_data),
				.weight(weight_value_0),
				.bias(bias_0),
				.sigmoid_ready(n0_ready),
				.sigmoid_out(n0_out) 
				
				);
				

neuron n1 (.clk(clk),
				.reset(reset),
				.inp_ready(inp_rdy),
				.inp_data(inp_data),
				.weight(weight_value_1),
				.bias(bias_1),
				.sigmoid_ready(n1_ready),
				.sigmoid_out(n1_out) 
				
				);






										
		
															
										
endmodule