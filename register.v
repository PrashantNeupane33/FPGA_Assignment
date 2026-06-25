module dFlipflop(
	input load,clk
	input in,
	output reg out
);
	
	always @(posedge clk) begin 
		if (load)
			out <= in;
	end
endmodule
		
module register(
	input [7:0]data,
	input clk, operation,
	output [7:0] out
);
	dFlipflop df0(.clk(clk), .load(operation), .in(data[0]), .out(out[0]));
	dFlipflop df1(.clk(clk), .load(operation), .in(data[1]), .out(out[1]));
	dFlipflop df2(.clk(clk), .load(operation), .in(data[2]), .out(out[2]));
	dFlipflop df3(.clk(clk), .load(operation), .in(data[3]), .out(out[3]));
	dFlipflop df4(.clk(clk), .load(operation), .in(data[4]), .out(out[4]));
	dFlipflop df5(.clk(clk), .load(operation), .in(data[5]), .out(out[5]));
	dFlipflop df6(.clk(clk), .load(operation), .in(data[6]), .out(out[6]));
	dFlipflop df7(.clk(clk), .load(operation), .in(data[7]), .out(out[7]));
endmodule
