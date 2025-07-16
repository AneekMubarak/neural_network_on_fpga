//==============================================================================
//  Module:        neuron
//  Description:   Single fixed-point neuron for inference in an MNIST-like NN
//                 - Multiplies each pixel (Q8.8) with its corresponding weight (Q8.8)
//                 - Accumulates all products over 784 inputs (28x28)
//                 - Adds bias (q8.8 shifted to q16.16)
//                 - Applies sigmoid activation via LUT (sigmoid_mem rom)
//                 - Outputs 8-bit activation value with ready pulse
//
//  Data Format:   Q8.8 fixed-point signed for inputs, weights, and bias
//                 Q16.16 used internally for accumulation
//                 Q0.8 output from sigmoid LUT (8-bit unsigned)
//
//  Author:        Aneek Mohamed Ruksan
//  Date:          2025-07-15

module neuron(

	input clk,
	input reset,
	input inp_ready, // high when input is being fed in
	input signed [15:0] inp_data, //normalized pixel intensity in Q8.8 fixed point form
	input signed [15:0] weight, bias, // q8.8 
	output reg [7:0] sigmoid_out, // q0.8
	output reg sigmoid_ready,
	
	//debug outputs for testing module
	output reg signed [31:0] product_q16_16, // product of weights and biases for MAC in q_16.16
	output reg signed [31:0] acc, // running accumulator value
	output reg signed [31:0] acc_final, // final accumulator after adding biases
	output reg out_ready // high when all inputs have been processed (used internally)
);



//weights and biases need to be accumulated over each input (28 x 28 pixels = 784)
// at least 10 bits required to store count of 784
reg [9:0] count;


//Using 8.8 fixed notation for all pixel values, weights and biases


//reg signed [31:0] product_q16_16;


assign product_q16_16 = inp_data * weight;



//accumulate the product if input is being fed
always @ (posedge clk)
if(reset)
	acc <= 32'b0;
else if (inp_ready)
	acc <= acc + product_q16_16;


		
// increment count for all 784 pixel values
always @ (posedge clk)
if(reset)
	count <= 10'b0;
else if (count == 10'd783)
	count <= 10'b0;
else if (inp_ready)
	count <= count+1'b1;


	

//create out_ready pulse to access the sigmoid rom	
always @ (posedge clk)
if(reset)
	out_ready <= 0;
else if (inp_ready && count == 10'd783)
	out_ready <= 1;
else
	out_ready <= 0;


//add the bias to the final accumulator value
always @ (posedge clk)
if (reset)
	acc_final <= 32'd0;
else if (inp_ready && count == 10'd783)
	acc_final <= acc + (bias <<< 8); // bias is in q8_8 form needs to be added to q16_16 
else
	acc_final <= 0;
	

reg [11:0] sigmoid_address; //store the address where the sigmoid result is located

	
// if out_ready is high  pass accumulator to sigmoid and get result in the next clk cycle


wire signed [15:0] acc_hi = acc_final[31:16]; //the integer part of the accumulator (q_16.16)
wire signed [11:0] pre_addr = {acc_final[31],acc_final[19:9]}; // preserve sign bit and take  4 int bits and 7 fractional bits.


//check if value is greater than 15 or less than -16

//sigmoid peaks at +/- 1 when input is aroung +/- 15, values outside that range have to clamped to the respective value
always @ *
if(acc_hi > 16'sd15)
	sigmoid_address = 12'sd4095; //clamp to highest val (0xFF)
else if (acc_hi < -16'sd16)
	sigmoid_address = 12'd0; // clamp to lowest val (0x0)
else
	sigmoid_address = pre_addr + 12'd2048; //offset to get address from [0:4095] range



// contains q0.8 formatted sigmoid return values for set of inputs
sigmoid_mem sig_mem(.address(sigmoid_address),
							.clock(clk),
							.q(sigmoid_out),
							.rden(out_ready));
							
						  
reg out_ready_d; // delayed out_ready: required since the ROM takes one extra cycle to return the valu

// create a pulse to inform the main module that sigmoid_out_can be used 
always @ (posedge clk or posedge reset)
if(reset)
	begin
		out_ready_d <= 0;
		sigmoid_ready <= 0;
	end
else
	begin
		out_ready_d <= out_ready;
		sigmoid_ready <= out_ready_d;
	end

	
endmodule

