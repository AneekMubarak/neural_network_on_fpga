module neuron(

	input clk,
	input reset,
	input inp_ready,
	input [7:0] inp_data, //normalized pixel intensity in fixed point form
	input signed [7:0] weight, bias,
	output reg [7:0] out,
	output reg out_ready
);



//weights and biases need to be accumulated over each input (28 x 28 pixels = 784)
// at least 10 bits required to store count

reg [9:0] inp_count; // needs to be used to adress the memory to obtain the correct weights and  for the input value

wire signed [7:0] weight_value;


weight_memory weight_mem_inst(.address(inp_count),
										.clock(clk),
										.q(weight_value) 
										);


always @ (posedge clk)
	if (reset)
		inp_count <= 10'b0;
	else if (inp_ready)
		inp_count <= inp_count + 1'b1;
		

	

	

	
	
endmodule