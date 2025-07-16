`timescale 1 ns / 1 ps

module mnist_nn_tb();


reg clk,reset;
reg inp_ready;
reg signed [15:0] inp_data;

wire signed [15:0] w_0, w_1, w_2, w_3, w_4, w_5, w_6, w_7, w_8, w_9;

wire [9:0] inp_count;

wire [7:0] n0_out, n1_out, n2_out, n3_out, n4_out, n5_out, n6_out, n7_out, n8_out, n9_out;

wire n0_ready, n1_ready, n2_ready, n3_ready, n4_ready, n5_ready, n6_ready, n7_ready, n8_ready, n9_ready;

wire [7:0] prediction_confidence;
wire [3:0] predicted_digit;


initial
#2000 $stop;

//---------- Input Image ROM ----------------------

parameter IMG_SIZE = 784;
reg [15:0] pixel_mem[0:IMG_SIZE-1];


initial 
	begin
		$readmemh("img_9.hex",pixel_mem);
	end

// --------------------------------------



initial begin
	clk = 1'b1;
	forever #1 clk = ~clk;
end


//-----Drive stimulus--------

integer i;
initial 
	begin
		reset = 1;
		inp_ready = 0 ;
		inp_data = 0;
		
		#4 reset = 0 ;
		
		#2
		
		for(i=0;i<IMG_SIZE;i = i+1)
		begin
			@(posedge clk);
			inp_ready <= 1;
			inp_data <= pixel_mem[i];
		end
		
		@(posedge clk);
		inp_ready = 0;
		
	end

mnist_nn mnist_dut(
    .clk(clk),
    .reset(reset),
    .inp_rdy(inp_ready),
    .inp_data(inp_data),
    .inp_count(inp_count),

    .weight_value_0(w_0),
    .weight_value_1(w_1),
    .weight_value_2(w_2),
    .weight_value_3(w_3),
    .weight_value_4(w_4),
    .weight_value_5(w_5),
    .weight_value_6(w_6),
    .weight_value_7(w_7),
    .weight_value_8(w_8),
    .weight_value_9(w_9),

    .n0_out(n0_out),
    .n1_out(n1_out),
    .n2_out(n2_out),
    .n3_out(n3_out),
    .n4_out(n4_out),
    .n5_out(n5_out),
    .n6_out(n6_out),
    .n7_out(n7_out),
    .n8_out(n8_out),
    .n9_out(n9_out),

    .n0_ready(n0_ready),
    .n1_ready(n1_ready),
    .n2_ready(n2_ready),
    .n3_ready(n3_ready),
    .n4_ready(n4_ready),
    .n5_ready(n5_ready),
    .n6_ready(n6_ready),
    .n7_ready(n7_ready),
    .n8_ready(n8_ready),
    .n9_ready(n9_ready),
	
	.predicted_digit(predicted_digit),
	.prediction_confidence(prediction_confidence)
);

endmodule


// initial begin
        
        // reset = 1;
        // inp_ready = 0;
        // inp_data = 0;


        // #5 reset = 0; 

        // #5;
		
		// inp_ready = 1;
		
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h000b; #2
		// inp_data = 16'h0097; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00cb; #2
		// inp_data = 16'h001f; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0025; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h006b; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0015; #2
		// inp_data = 16'h00c6; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h006b; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h006e; #2
		// inp_data = 16'h00bf; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00aa; #2
		// inp_data = 16'h006d; #2
		// inp_data = 16'h003e; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00dd; #2
		// inp_data = 16'h0033; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h00b7; #2
		// inp_data = 16'h0100; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00eb; #2
		// inp_data = 16'h00df; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h003f; #2
		// inp_data = 16'h00de; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0094; #2
		// inp_data = 16'h004d; #2
		// inp_data = 16'h003e; #2
		// inp_data = 16'h0081; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0069; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0020; #2
		// inp_data = 16'h00e8; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00dd; #2
		// inp_data = 16'h008a; #2
		// inp_data = 16'h000a; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h001f; #2
		// inp_data = 16'h00e7; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00f4; #2
		// inp_data = 16'h0071; #2
		// inp_data = 16'h0005; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0025; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00bd; #2
		// inp_data = 16'h0014; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h006d; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0023; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0025; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00ca; #2
		// inp_data = 16'h001e; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h001f; #2
		// inp_data = 16'h00c9; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0023; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0025; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0020; #2
		// inp_data = 16'h00cb; #2
		// inp_data = 16'h0100; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00a5; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h008d; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h006d; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0023; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h00da; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0015; #2
		// inp_data = 16'h003f; #2
		// inp_data = 16'h00e8; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00e7; #2
		// inp_data = 16'h001e; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h00da; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0091; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00de; #2
		// inp_data = 16'h003d; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h00da; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h00b7; #2
		// inp_data = 16'h00de; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00b5; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h00db; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h0049; #2
		// inp_data = 16'h0049; #2
		// inp_data = 16'h00e5; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h0100; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0071; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h0094; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h001f; #2
		// inp_data = 16'h00e7; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00e7; #2
		// inp_data = 16'h00be; #2
		// inp_data = 16'h0023; #2
		// inp_data = 16'h000a; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h003e; #2
		// inp_data = 16'h008f; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00fe; #2
		// inp_data = 16'h006b; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0048; #2
		// inp_data = 16'h00af; #2
		// inp_data = 16'h00fc; #2
		// inp_data = 16'h00ae; #2
		// inp_data = 16'h0047; #2
		// inp_data = 16'h0048; #2
		// inp_data = 16'h001e; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		// inp_data = 16'h0000; #2
		
		// inp_ready = 0;


//end





				   
				   
