// system_tb.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module system_tb (
	);

	wire        system_inst_clk_bfm_clk_clk;                          // system_inst_clk_bfm:clk -> [system_inst:clk_clk, system_inst_sine_wave_generator_0_conduit_end_bfm:clk]
	wire  [9:0] system_inst_sine_wave_generator_0_conduit_end_export; // system_inst:sine_wave_generator_0_conduit_end_export -> system_inst_sine_wave_generator_0_conduit_end_bfm:sig_export

	system system_inst (
		.clk_clk                                  (system_inst_clk_bfm_clk_clk),                          //                               clk.clk
		.sine_wave_generator_0_conduit_end_export (system_inst_sine_wave_generator_0_conduit_end_export)  // sine_wave_generator_0_conduit_end.export
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) system_inst_clk_bfm (
		.clk (system_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_conduit_bfm system_inst_sine_wave_generator_0_conduit_end_bfm (
		.clk        (system_inst_clk_bfm_clk_clk),                          //     clk.clk
		.sig_export (system_inst_sine_wave_generator_0_conduit_end_export), // conduit.export
		.reset      (1'b0)                                                  // (terminated)
	);

endmodule
