`timescale 1 ns / 1 ps



module mnist_nn_tb();


reg clk,reset;

wire [15:0] w_0, w_1;

wire [9:0] inp_count;
wire [9:0] inp_count_d;


initial
#1700 $stop;

//initial
//begin
//reset = 1'b1;
//#1 reset = 1'b0;
//end


initial
reset = 1'b0;

initial begin
	clk = 1'b1;
	forever #1 clk = ~clk;
end

mnist_nn mnist_dut(.clk(clk),
				   .reset(reset),
				   .inp_count(inp_count),
				   .weight_value_0(w_0),
				   .weight_value_1(w_1),
				   .inp_count_d(inp_count_d)
				   );


				   
				   
endmodule