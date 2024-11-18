module clk_divider(
						 input CLOCK_50,
						 input run,
						 output reg clk_1Mhz = 0);
	reg [4:0] counter = 25-1;
	always@(posedge CLOCK_50)
	begin
		if(run)
		begin
			if(!counter)
			begin
				clk_1Mhz <= ~clk_1Mhz;
				counter <= 25-1;
			end
			else
			begin
				counter <= counter-1;
			end
		end
		else
			clk_1Mhz <= 0;
	end
endmodule
						 