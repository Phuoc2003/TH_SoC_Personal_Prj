`timescale 1ns / 1ps

module testbench();
    reg CLOCK_50, rst_n;
	 reg run;
	 wire clk_1Mhz;
          
    
    wire  [9:0] phase;     
    wire  [9:0] data_sin;
    
    clk_divider DUT1(
						  .CLOCK_50(CLOCK_50),
						  .run(run),
						  .clk_1Mhz(clk_1Mhz)
						 );
	 
    sine_wave_generator DUT2(
									 .clk(clk_1Mhz), 
									 .rst_n(rst_n), 
									 .phase(phase), 
									 .data_sin(data_sin));
    
    initial begin
        CLOCK_50 = 0;
        rst_n = 1'b0;
        run = 0;
        #1000
        rst_n = 1'b1;   
	
		  #100000;
		  run = 1;
		  
		  #100000;
		  run = 0;
		  
		  #100000;
		  run = 1;
    end
    
    always #10 CLOCK_50 = ~CLOCK_50;
    
    always @(posedge CLOCK_50) begin
        // output phase and data_sin values to the simulation logs
        $display("Time: %t, Phase: %d, Data_sin: %d", $time, phase, data_sin);
    end
    

	
	
endmodule