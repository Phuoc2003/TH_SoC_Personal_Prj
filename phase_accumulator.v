module phase_accumulator(
								 input clk,  // clock @ 1MHz
								 input rst_n,  // reset signal
								 input [7:0] fcw,
								 output reg [9:0] phase   // returns the 10-bit phase register   
    );
    
    parameter max_val = 1024;  // 2^10
    
    always @ (posedge clk or negedge rst_n) begin
              
        if (!rst_n) 
				phase <= 10'b00_0000_0000;
        
        else if (phase >= max_val)
            phase <= 10'b00_0000_0000;
            
        else 
            phase <= phase + fcw; 
        end
endmodule
