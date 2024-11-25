module sine_wave_csr(
							//clock, RstN
							input          Clk,
							input          ResetN,
							//avalon interface
							input          ChipSelect,
							input          Write,
							input          Read,
							input  [1:0]   Address,
							input  [31:0]  WriteData,
							input  [9:0]   data_sin,
							output [31:0]  ReadData,
							output run,
							output [7:0] fcw
							);
	reg [31:0] data_reg;
	reg [7:0] fcw_reg;
	reg run_reg;
	assign run = run_reg;
	assign fcw = fcw_reg;
	assign ReadData = data_reg;
	
	always @(posedge Clk or negedge ResetN)
	begin
		if (~ResetN) begin
			fcw_reg  <= 8'h0;
			run_reg  <= 1'h0;
		end 
		else if (ChipSelect & Write & ~(|Address)) begin         
			fcw_reg    <= WriteData[7:0];    
		end 
		else if (ChipSelect & Write & Address == 1) begin         
			run_reg    <= WriteData[0];    
		end 
		else begin
			fcw_reg  <= fcw_reg;
			run_reg <= run_reg;
		end

	end

	always @(posedge Clk or negedge ResetN)
	begin
		if (~ResetN) begin
			data_reg  <= 32'h0;
		end else if (ChipSelect & Read) begin         
		case (Address)
		   	2'd0: data_reg <= {24'h0, fcw_reg};             
				2'd1: data_reg <= {31'h0, run_reg}; 
				2'd2: data_reg <= {22'h0, data_sin};   				
		   	default: data_reg <= data_reg;
		endcase
		end else begin
			data_reg <= data_reg;
		end
	end
	
endmodule
