module clk_divider(
						 input Clk,
						 input ResetN,
						 input run,
						 input enable_irq, 
						 input clear_irq,
						 output reg clk_1Mhz = 0,  
						 output irq  
						);
						
	reg [4:0] counter = 25-1;
	wire timeout_event;
	reg timeout_occurred;
	
	always@(posedge Clk or negedge ResetN)
	begin
		if(~ResetN)
		begin
			clk_1Mhz <= 0;
			counter <= 25-1;
		end
		else
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
			begin
				clk_1Mhz <= 0;
				counter <= 25-1;               
			end
		end
	end
	
	assign timeout_event = ~(|counter);
	
	always@(posedge Clk or negedge ResetN)
   begin
		if (~ResetN)
          timeout_occurred <= 0;
      else 
		begin
			if (clear_irq)
              timeout_occurred <= 0;
          else if (timeout_event)
              timeout_occurred <= 1;
		end
   end
	 
	assign irq = timeout_occurred && enable_irq;
	
endmodule
						 