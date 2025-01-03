module sine_wave_generator(  
									input clk,     // clock @ 1MHz
									input rst_n,     // reset signal
									input [7:0] fcw,
									output [9:0] phase,     // phase accumulator
									output [9:0] data_sin   // output sine wave values
    );    
        
	 
    phase_accumulator            accumulator_inst (clk, rst_n, fcw, phase);
    phase_to_amplitude_converter converter_inst   (rst_n, phase, data_sin);
	 
endmodule
