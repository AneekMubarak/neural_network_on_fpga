//======================================================================
//  Module:        mnist_nn
//  Description:   10-output single-layer neural network for MNIST inference
//                 - Streams 784 inputs (28x28)
//                 - Uses fixed-point weights & biases (Q8.8 format)
//                 - gets results of sigmoid activation and picks highest scoring digit and confidence 
//
//  Author:        Aneek Mohamed Ruksan
//  Date:          2025-07-15
//======================================================================


module mnist_nn (
	input clk,
	input reset,
	input inp_rdy, // set high when input is being fed in 
	input signed [15:0] inp_data, // normalized pixel intensities in the [0:1] range in q8.8 form
	
	output reg [9:0] inp_count, // count the no of pixel data received
	output wire signed [15:0] weight_value_0, weight_value_1, weight_value_2, weight_value_3, weight_value_4, weight_value_5, weight_value_6, weight_value_7, weight_value_8, weight_value_9, // q8.8 formatted weight values from the weight_memories
	output wire [7:0] n0_out,n1_out,n2_out,n3_out,n4_out,n5_out,n6_out,n7_out,n8_out,n9_out, // q0.8 sigmoid outputs of neurons
	output reg n0_ready, n1_ready,n2_ready, n3_ready,n4_ready, n5_ready, n6_ready, n7_ready, n8_ready, n9_ready, // will pulse when the neurons have produced a new output
	output reg [3:0] predicted_digit, // 0 to 9 for every label in MNST dataset
	output reg [7:0] prediction_confidence // confidence in Q0.8 format
	

);






//reg [7:0] n0_out,n1_out,n2_out,n3_out,n4_out,n5_out,n6_out,n7_out,n8_out,n9_out;

//reg n0_ready, n1_ready, n2_ready, n3_ready, n4_ready, n5_ready, n6_ready, n7_ready, n8_ready, n9_ready;




//q8.8 signed biases for 10 output neurons
localparam signed [15:0] bias_0 = 16'hFF4B;  
localparam signed [15:0] bias_1 = 16'h008C;
localparam signed [15:0] bias_2 = 16'h003D; 
localparam signed [15:0] bias_3 = 16'hFF8C;
localparam signed [15:0] bias_4 = 16'hFFFC;
localparam signed [15:0] bias_5 = 16'h020D;
localparam signed [15:0] bias_6 = 16'hFFC5;
localparam signed [15:0] bias_7 = 16'h0119;
localparam signed [15:0] bias_8 = 16'hFDE7;
localparam signed [15:0] bias_9 = 16'hFF96;



//keep track of the count of input pixels
always @ (posedge clk)
if (reset) 
	inp_count <= 10'b0;
else if (inp_count == 10'd783) //reset in next cycle
	inp_count <= 10'd0;
else if (inp_rdy)
	inp_count <= inp_count + 1'b1;
else
	inp_count <= 10'b0;

	


// weight memory instances to obtain weights
weight_mem0 neuron0_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_0),
                            .rden(inp_rdy));

weight_mem1 neuron1_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_1),
                            .rden(inp_rdy));

weight_mem2 neuron2_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_2),
                            .rden(inp_rdy));

weight_mem3 neuron3_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_3),
                            .rden(inp_rdy));

weight_mem4 neuron4_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_4),
                            .rden(inp_rdy));

weight_mem5 neuron5_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_5),
                            .rden(inp_rdy));

weight_mem6 neuron6_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_6),
                            .rden(inp_rdy));

weight_mem7 neuron7_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_7),
                            .rden(inp_rdy));

weight_mem8 neuron8_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_8),
                            .rden(inp_rdy));

weight_mem9 neuron9_weights(.address(inp_count),
                            .clock(~clk),
                            .q(weight_value_9),
                            .rden(inp_rdy));

									 
//neuron instances to get confidence values for each label
neuron n0 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_0), .bias(bias_0), .sigmoid_ready(n0_ready), .sigmoid_out(n0_out));

neuron n1 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_1), .bias(bias_1), .sigmoid_ready(n1_ready), .sigmoid_out(n1_out));

neuron n2 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_2), .bias(bias_2), .sigmoid_ready(n2_ready), .sigmoid_out(n2_out));

neuron n3 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_3), .bias(bias_3), .sigmoid_ready(n3_ready), .sigmoid_out(n3_out));

neuron n4 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_4), .bias(bias_4), .sigmoid_ready(n4_ready), .sigmoid_out(n4_out));

neuron n5 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_5), .bias(bias_5), .sigmoid_ready(n5_ready), .sigmoid_out(n5_out));

neuron n6 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_6), .bias(bias_6), .sigmoid_ready(n6_ready), .sigmoid_out(n6_out));

neuron n7 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_7), .bias(bias_7), .sigmoid_ready(n7_ready), .sigmoid_out(n7_out));

neuron n8 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_8), .bias(bias_8), .sigmoid_ready(n8_ready), .sigmoid_out(n8_out));

neuron n9 (.clk(clk), .reset(reset), .inp_ready(inp_rdy), .inp_data(inp_data),
           .weight(weight_value_9), .bias(bias_9), .sigmoid_ready(n9_ready), .sigmoid_out(n9_out));




// find the highest sigmoid value and label

always @ (*)
if( n0_ready & n1_ready & n2_ready & n3_ready & n4_ready & n5_ready & n6_ready & n7_ready & n8_ready & n9_ready) // if all neurons have released their confidence scores
	begin
		 prediction_confidence = n0_out;
		 predicted_digit = 4'd0;

		 if (n1_out > prediction_confidence) begin prediction_confidence = n1_out; predicted_digit = 4'd1; end
		 if (n2_out > prediction_confidence) begin prediction_confidence = n2_out; predicted_digit = 4'd2; end
		 if (n3_out > prediction_confidence) begin prediction_confidence = n3_out; predicted_digit = 4'd3; end
		 if (n4_out > prediction_confidence) begin prediction_confidence = n4_out; predicted_digit = 4'd4; end
		 if (n5_out > prediction_confidence) begin prediction_confidence = n5_out; predicted_digit = 4'd5; end
		 if (n6_out > prediction_confidence) begin prediction_confidence = n6_out; predicted_digit = 4'd6; end
		 
		 if (n7_out > prediction_confidence) begin prediction_confidence = n7_out; predicted_digit = 4'd7; end
		 if (n8_out > prediction_confidence) begin prediction_confidence = n8_out; predicted_digit = 4'd8; end
		 if (n9_out > prediction_confidence) begin prediction_confidence = n9_out; predicted_digit = 4'd9; end
	end
else
	begin
		 prediction_confidence = 8'd0;
		 predicted_digit = 4'd0;
	end


									
															
										
endmodule