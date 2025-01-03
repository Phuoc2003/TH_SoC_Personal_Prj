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
							output [7:0] fcw,
							output enable_irq,
							output clear_irq
							);
	reg [31:0] data_reg;
	reg [7:0] fcw_reg;
	reg [2:0] control;
	
	assign enable_irq = control[1];
	assign run = control[0];
	assign fcw = fcw_reg;
	assign clear_irq = ChipSelect && Write && (Address == 2);
	assign ReadData = data_reg;
	
	always @(posedge Clk or negedge ResetN)
	begin
		if (~ResetN) begin
			fcw_reg  <= 8'h0;
			control  <= 1'h0;
		end 
		else if (ChipSelect & Write & ~(|Address)) begin         
			fcw_reg    <= WriteData[7:0];    
		end 
		else if (ChipSelect & Write & Address == 1) begin         
			control    <= WriteData[1:0];    
		end 
		else begin
			fcw_reg  <= fcw_reg;
			control <= control;
		end

	end

	always @(posedge Clk or negedge ResetN)
	begin
		if (~ResetN) begin
			data_reg  <= 32'h0;
		end else if (ChipSelect & Read) begin         
		case (Address)
		   	2'd0: data_reg <= {24'h0, fcw_reg};             
				2'd1: data_reg <= {30'h0, control};
				2'd2: data_reg <= {32'h0};	
				2'd3: data_reg <= {22'h0, data_sin};   				
		   	default: data_reg <= data_reg;
		endcase
		end else begin
			data_reg <= data_reg;
		end
	end
	
endmodule
