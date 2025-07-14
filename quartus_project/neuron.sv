module neuron(

	input clk,
	input reset,
	input inp_ready,
	input signed [15:0] inp_data, //normalized pixel intensity in Q8.8 fixed point form
	input signed [15:0] weight, bias,
	
	output reg signed [31:0] acc_end,
	output reg out_ready,
	//temporary outputs for testing module
	output reg signed [31:0] product_q16_16,
	output reg signed [15:0] product,
	output reg signed [31:0] acc,
	output reg [9:0] count,
	output reg [11:0] sigmoid_out


);



//weights and biases need to be accumulated over each input (28 x 28 pixels = 784)
// at least 10 bits required to store count of 784


//Using 8.8 fixed notation for all pixel values, weights and biases


//reg signed [31:0] product_q16_16;
//reg signed [15:0] product;
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
	acc_end <= 32'd0;
else if (inp_ready && count == 10'd783)
	acc_end <= acc + (bias <<< 8); // bias is in q8_8 form needs to be added to q16_16 
	
//wire signed [15:0] acc_q8_8 = acc_end[23:8] // leave out top and bottom byte



	
// if out_ready pass to sigmoid and get result in next clk cycle


reg [11:0] sigmoid_address;

wire signed [11:0] pre_addr = {acc_end[31],acc_end[19:9]}; // preserve sign bit and take  4 int bits and 7 fractional bits.



//check if value is greater than 16 or less than -16
wire signed [15:0] acc_hi = acc_end[31:16];

always @ *
if(acc_hi > 16'sd15)
	sigmoid_address = 12'sd4095; //clamp to highest val 
else if (acc_hi < -16'sd16)
	sigmoid_address = 12'd0; // clamp to lowest val
else
	sigmoid_address = pre_addr + 12'd2048 //offset to get address from [0:4095]



sigmoid_mem sig_mem( .address(sigmoid_address),
						   .clock(clk),
						   .q(sigmoid_out),
							.rden(out_ready)
						  );
	
	
	
	
	
endmodule




//always @ (posedge clk)
//if(reset)
//	acc_out<=0;
//else if (inp_ready && count == 10'd783)
//	acc_out <= ((acc + (bias <<< 8)) >>> 8);  // //acc is in 32 bit reg needs to be reduced to 16
//else
//	acc_out <= acc_out;
	


//wire signed [31:0] acc_with_bias = acc + (bias <<< 8); // q16.16
//wire signed [15:0] acc_q8_8 = acc_with_bias[23:8];  	
//
//always @(posedge clk)
//if (reset)
//    acc_out <= 0;
//else if (inp_ready && count == 10'd783)
//    acc_out <= acc_q8_8;