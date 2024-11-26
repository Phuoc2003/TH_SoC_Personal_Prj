module sine_wave_wrapper(
								 input         Clk,
								 input         ResetN,
								 //avalon interface
								 input         ChipSelect,
								 input         Write,
								 input         Read,
								 input  [1:0]  Address,
								 input  [31:0] WriteData,
								 output [31:0] ReadData,
								 output [9:0]  oData_sin,
								 output irq
								 );

	wire run, clk_1Mhz, enable_irq, clear_irq;
	wire [7:0] fcw;
	wire [9:0] phase;
	wire [9:0] data_sin;
	
	assign data_sin = oData_sin;

	sine_wave_csr CSR(
							.Clk         (Clk        ),
							.ResetN      (ResetN     ),
							.ChipSelect  (ChipSelect ), 
							.Write       (Write      ),
							.Read        (Read       ),
							.Address     (Address    ),
							.WriteData   (WriteData  ),
							.ReadData 	 (ReadData   ),
							.run         (run        ),
							.fcw		    (fcw	 	    ),
							.data_sin	 (data_sin	 ),
							.enable_irq	 (enable_irq ),
							.clear_irq	 (clear_irq  )
						  );

	clk_divider clk_div(
								.Clk(Clk),
								.ResetN(ResetN),
								.run(run),
								.clk_1Mhz(clk_1Mhz),
								.irq(irq),
								.enable_irq(enable_irq),
								.clear_irq(clear_irq  )
							 );
							 
	sine_wave_generator sine_gen(
										  .clk(clk_1Mhz),     
										  .rst_n(ResetN),     
										  .phase(phase),    
										  .data_sin(oData_sin)
										 );
				
endmodule
								 