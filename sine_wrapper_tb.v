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
   
	
    sine_wave_wrapper DUT(
									.Clk(Clk),
									.ResetN(ResetN),
									.ChipSelect(ChipSelect),
									.Write(Write),
									.Read(Read),
									.Address(Address),
									.WriteData(WriteData),
									.ReadData(ReadData),
									.oData_sin(oData_sin)
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
        Address = 0; 
		  WriteData = 16;
      
        #10;
        Write = 0;
        WriteData=0;
        Address = 0; 
      
		  #20;
        ChipSelect = 1;
        Write = 1;
        Address = 1; 
        WriteData = 1;
		  
		  #20;
        ChipSelect = 1;
        Read = 1;
        Address = 2; 
      
		  #10000000;
        ChipSelect = 1;
        Write = 1;
        Address = 1; 
        WriteData = 0;
		  
		  #20;
        ChipSelect = 1;
        Read = 0;
        Address = 2; 
		  
		  #1000;
        ChipSelect = 1;
        Write = 1;
        Address = 1; 
        WriteData = 1;
        
//        #1000 $finish;
    end
    	
	
endmodule
