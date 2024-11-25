module sys_top(
					input CLOCK_50,
					input [0:0] KEY,
					output [9:0] GPIO
				  );
		system sys_top(
							.clk_clk(CLOCK_50),  
							.reset_reset_n(KEY),							
				         .sine_wave_generator_0_conduit_end_export(GPIO)
						  );
endmodule
				 