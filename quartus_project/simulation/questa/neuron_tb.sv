`timescale 1 ns / 1 ps


module neuron_tb();



	reg clk,reset,inp_ready;

	reg signed [15:0] inp_data, weight, bias;

	wire out_ready;

	wire signed [15:0] out, product;

	wire [31:0] product_q16_16, acc ;
	 
	wire [9:0] count;



	neuron neuron_dut(
					.clk(clk),
					.reset(reset),
					.inp_data(inp_data),
					.weight(weight),
					.bias(bias),
					.out_ready(out_ready),
					.out(out),
					.product(product),
					.product_q16_16(product_q16_16),
					.acc(acc),
					.count(count),
					.inp_ready(inp_ready)
					);
 
	initial
	#2000 $stop; 
	 
	initial 
		begin
			clk = 1'b1;
			forever #1 clk = ~clk;
		end
	
	
 
// test 1: check product calculation
// test 2: check output and format for mathematical accuracy
// test 3: check out_ready_signal
    initial begin
        
        reset = 1;
        inp_ready = 0;
        inp_data = 0;
        weight = 0;
        bias = 0;

        #5 reset = 0; 

        #5;

        // inp_data = 1.5 (in Q8.8) = 16'h0180
        // weight = -2.0 (Q8.8) = 16'hfe00
        inp_data = 16'h080; // 1.5
        weight = 16'hFE00;   // -2.0
        inp_ready = 1;
		

		#2 //full clk cyclr
		inp_data = 16'h00ff;
		weight   = 16'hffff;
		
		
		#2 
		inp_data = 16'h0012;
		weight   = 16'hffff;
		
		
		#2 
		inp_data = 16'h0000;
		weight   = 16'h0000;


 
    end

endmodule








// test 2: check output and format for mathematical accuracy

// test 3: check out_ready_signal