module phase_accumulator(
								 input clk,  // clock @ 1MHz
								 input rst_n,  // reset signal
								 output reg [9:0] phase   // returns the 10-bit phase register   
    );
    
    parameter max_val = 1024;  // 2^10
    
    parameter fcw = 128 ; // (max_val * desired_frequency) / clk_frequency
    
    always @ (posedge clk or negedge rst_n) begin
              
        if (!rst_n) 
				phase <= 10'b00_0000_0000;
        
        else if (phase >= max_val)
            phase <= 10'b00_0000_0000;
            
        else 
            phase <= phase + fcw; 
        end
endmodule
