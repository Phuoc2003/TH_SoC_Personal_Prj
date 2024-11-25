	component system is
		port (
			clk_clk                                  : in  std_logic                    := 'X'; -- clk
			reset_reset_n                            : in  std_logic                    := 'X'; -- reset_n
			sine_wave_generator_0_conduit_end_export : out std_logic_vector(9 downto 0)         -- export
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                                  => CONNECTED_TO_clk_clk,                                  --                               clk.clk
			reset_reset_n                            => CONNECTED_TO_reset_reset_n,                            --                             reset.reset_n
			sine_wave_generator_0_conduit_end_export => CONNECTED_TO_sine_wave_generator_0_conduit_end_export  -- sine_wave_generator_0_conduit_end.export
		);

