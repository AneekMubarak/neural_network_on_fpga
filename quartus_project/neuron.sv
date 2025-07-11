module neuron(

	input clk,
	input reset,
	input inp_ready,
	input signed [15:0] inp_data, //normalized pixel intensity in Q8.8 fixed point form
	input signed [15:0] weight, bias,
	output reg [7:0] out,
	output reg out_ready
);



//weights and biases need to be accumulated over each input (28 x 28 pixels = 784)
// at least 10 bits required to store count


//Using 8.8 fixed notation for all pixel values, weights and biases


reg signed [31:0] product_q16_16;
reg signed [15:0] product;

reg signed [31:0] acc;
reg [9:0] count;



assign product_q16_16 = inp_data * weight; 

assign product = product_q16_16 [23:8]; //drop lower 8 fractional bits


always @ (posedge clk)
if(reset)
	acc <= 0;
else if (inp_ready)
	acc <= acc + product;


		

always @ (posedge clk)
if(reset)
	count <= 0;
else if (inp_ready)
	count <= count+1;

	

	
always @ (posedge clk)
if(reset)
	out_ready <= 0;
else if (inp_ready && count == 10'd783)
	out_ready <= 1;
else
	out_ready <= 0;
	

always @ (posedge clk)
if(reset)
	out<=0;
else if (inp_ready && count == 10'd783)
	out<=(acc + (bias <<< 8)) >>> 8; //acc is in 32 bit reg needs to be reduced to 16
	
	
	
	
endmodule