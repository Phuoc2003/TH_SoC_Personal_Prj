module sine_wave_wrapper(
								 input         Clk,
								 input         ResetN,
								 //avalon interface
								 input         ChipSelect,
								 input         Write,
								 input         Read,
								 input         [0:0] Address,
								 input [31:0] WriteData,
								 output [31:0] ReadData,
								 output [9:0] oData_sin
								 );

	wire run, clk_1Mhz;
	wire [7:0] fcw;
	wire [9:0] phase;

	sine_wave_csr CSR(
							.Clk         (Clk        ),
							.ResetN      (ResetN     ),
							.ChipSelect  (ChipSelect ), 
							.Write       (Write      ),
							.Read        (Read       ),
							.Address     (Address    ),
							.WriteData   (WriteData  ),
							.run         (run        ),
							.fcw		    (fcw	 	    )
						  );

	clk_divider clk_div(
								.Clk(Clk),
								.run(run),
								.clk_1Mhz(clk_1Mhz)
							 );
							 
	sine_wave_generator sine_gen(
										  .clk(clk_1Mhz),     
										  .rst_n(ResetN),     
										  .phase(phase),    
										  .data_sin(oData_sin)
										 );
				
endmodule
								 