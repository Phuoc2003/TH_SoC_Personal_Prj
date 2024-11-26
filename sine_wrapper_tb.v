`timescale 1ns / 1ps

module sine_wrapper_tb();
    reg         Clk;
	 reg         ResetN;
	 reg         ChipSelect;
	 reg         Write;
	 reg         Read;
	 reg  [1:0]  Address;
	 reg 	[31:0] WriteData;
	 wire [31:0] ReadData;
	 wire [9:0]  oData_sin;
	 wire irq;
	
    sine_wave_wrapper DUT(
									.Clk(Clk),
									.ResetN(ResetN),
									.ChipSelect(ChipSelect),
									.Write(Write),
									.Read(Read),
									.Address(Address),
									.WriteData(WriteData),
									.ReadData(ReadData),
									.oData_sin(oData_sin),
									.irq(irq)
								  );
	 
	 initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; 
    end
	 
	 initial begin
        ResetN = 0;
        ChipSelect = 0;
        Write = 0;
        Read = 0;
        WriteData = 0;
        Address = 0;
       
        #10;
        ResetN = 1;

        #10;
        ChipSelect = 1;
        Write = 1;
		  Read = 0;
        Address = 0; 
		  WriteData = 16;
      
      
		  #30;
        ChipSelect = 1;
        Write = 1;
		  Read = 0;
        Address = 1; 
        WriteData = 3;
		  
		  #30;
        ChipSelect = 0;
        Write = 0;
		  Read = 0;
        Address = 0; 
        WriteData = 0;
		  
//		  #20;
//        ChipSelect = 1;
//		  Write = 0;
//        Read = 1;
//        Address = 3; 
      
		  #10000000;
        ChipSelect = 1;
        Write = 1;
		  Read = 0;
        Address = 1; 
        WriteData = 0;
		  
		   
		  
		  #1000;
        ChipSelect = 1;
        Write = 1;
        Address = 1; 
        WriteData = 3;
		  
//		  #200;
//        ChipSelect = 1;
//        Read = 3;
//        Address = 3;
        
//        #1000 $finish;
    end
    	

	initial 
	begin
		forever
		begin
			wait(irq);
			begin
				@(posedge Clk)
				begin
					ChipSelect = 1;
					Write = 0;
					Read = 1;
					Address = 3; 
				end
				
				repeat(1) @(posedge Clk)
			
				@(posedge Clk)
				begin
					ChipSelect = 1;
					Write = 1;
					Read = 0;
					Address = 2;
					WriteData = 1;
				end
				
				@(posedge Clk)
				begin
					ChipSelect = 0;
					Write = 0;
					Read = 0;
					Address = 0;
					WriteData = 0;
				end
			end
		end
	end
	
endmodule
