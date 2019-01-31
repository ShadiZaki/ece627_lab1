module dut_tb 
#(
	parameter	D_W = 32
)
();

reg	clk=1'b0;
reg	[1:0] rst;
reg	[D_W-1:0] a;
reg	[D_W-1:0] b;
wire initialize;
wire [2*D_W-1:0] result;

always #0.5 clk = ~clk;

initial begin
	rst = 2'b11;
end

assign  initialize = 0;

always@(posedge clk) begin
	rst <= rst >> 1;
	if(rst) begin
		a	<= 1;
		b	<= 9999;
	end else begin
		a	<= a + 1;
		b	<= b - 1;
		$monitor("Time=%0d,a=%0d,b=%0d,result=%0d",$time,a,b,result);
		if(a==10) begin
			$finish;
		end
	end
end

mac #(.D_W(D_W)) mac_dut
(
    	.clk		(clk),
    	.rst		(rst[0]),
    	.a		(a),
    	.b		(b),
        .initialize 	(initialize),
    	.result     	(result)
);

initial begin
	$dumpfile("lab1.vcd");
	$dumpvars;
end

endmodule
