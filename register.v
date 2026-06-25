module dFlipflop(
	input load,clk,
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

module memory #(
    parameter AD_LINES = 16,
    parameter DATA_LINES = 8
)(
    input rd_wr_bar,
    input [AD_LINES-1:0] addr,
    input [DATA_LINES-1:0] wd,
    output reg [DATA_LINES-1:0] rd,
    input clk,
    input cs
);

    reg [DATA_LINES-1:0] mem [0:(1<<AD_LINES)-1];

    always @(posedge clk) begin
        if (cs && rd_wr_bar)
            rd <= mem[addr];
        else if (cs && !rd_wr_bar)
            mem[addr] <= wd;
    end

endmodule
