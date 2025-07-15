module neuron(

	input clk,
	input reset,
	input inp_ready,
	input signed [15:0] inp_data, //normalized pixel intensity in Q8.8 fixed point form
	input signed [15:0] weight, bias,
	output reg [7:0] sigmoid_out,
	output reg sigmoid_ready,
	
	//temporary outputs for testing module
	output reg signed [31:0] product_q16_16,
	output reg signed [31:0] acc,
	output reg signed [31:0] acc_final,
	
	output reg [9:0] count,
	output reg [11:0] sigmoid_address,
	output reg out_ready




);



//weights and biases need to be accumulated over each input (28 x 28 pixels = 784)
// at least 10 bits required to store count of 784


//Using 8.8 fixed notation for all pixel values, weights and biases


//reg signed [31:0] product_q16_16;
//
//reg signed [31:0] acc;
//reg [9:0] count;








assign product_q16_16 = inp_data * weight;

////assign product = product_q16_16 [23:8]; //drop lower 8 fractional bits


always @ (posedge clk)
if(reset)
	acc <= 32'b0;
else if (inp_ready)
	acc <= acc + product_q16_16;


		

always @ (posedge clk)
if(reset)
	count <= 10'b0;
else if (count == 10'd783)
	count <= 10'b0;
else if (inp_ready)
	count <= count+1'b1;


	

	
always @ (posedge clk)
if(reset)
	out_ready <= 0;
else if (inp_ready && count == 10'd783)
	out_ready <= 1;
else
	out_ready <= 0;



always @ (posedge clk)
if (reset)
	acc_final <= 32'd0;
else if (inp_ready && count == 10'd783)
	acc_final <= acc + (bias <<< 8); // bias is in q8_8 form needs to be added to q16_16 
else
	acc_final <= 0;
	



	
// if out_ready pass to sigmoid and get result in next clk cycle

//reg [11:0] sigmoid_address;

wire signed [11:0] pre_addr = {acc_final[31],acc_final[19:9]}; // preserve sign bit and take  4 int bits and 7 fractional bits.

wire signed [15:0] acc_hi = acc_final[31:16]; //the integer part of the accumulator



//check if value is greater than 15 or less than -16

// the sigmoid address will always have a value in it, but it is read only the count is reached
always @ *
if(acc_hi > 16'sd15)
	sigmoid_address = 12'sd4095; //clamp to highest val 
else if (acc_hi < -16'sd16)
	sigmoid_address = 12'd0; // clamp to lowest val
else
	sigmoid_address = pre_addr + 12'd2048; //offset to get address from [0:4095]



sigmoid_mem sig_mem(.address(sigmoid_address),
							.clock(clk),
							.q(sigmoid_out),
							.rden(out_ready));
							
						  
reg out_ready_d;

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

