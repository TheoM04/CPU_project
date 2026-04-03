-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "04/03/2026 15:27:09"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ff_combined IS
    PORT (
	d : IN std_logic_vector(15 DOWNTO 0);
	clk : IN std_logic;
	en : IN std_logic;
	rst : IN std_logic;
	sel : IN std_logic;
	q : BUFFER std_logic_vector(15 DOWNTO 0)
	);
END ff_combined;

-- Design Ports Information
-- q[0]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[1]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[2]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[3]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[4]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[5]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[6]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[7]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[8]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[9]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[10]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[11]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[12]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[13]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[14]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[15]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[0]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[1]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[3]	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[4]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[5]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[7]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[8]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[9]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[10]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[11]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[12]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[13]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[14]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[15]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ff_combined IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_d : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_sel : std_logic;
SIGNAL ww_q : std_logic_vector(15 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \sel~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \d[0]~input_o\ : std_logic;
SIGNAL \u2|q[0]~feeder_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \u2|q[8]~0_combout\ : std_logic;
SIGNAL \q~0_combout\ : std_logic;
SIGNAL \d[1]~input_o\ : std_logic;
SIGNAL \u2|q[1]~feeder_combout\ : std_logic;
SIGNAL \q~1_combout\ : std_logic;
SIGNAL \d[2]~input_o\ : std_logic;
SIGNAL \q~2_combout\ : std_logic;
SIGNAL \d[3]~input_o\ : std_logic;
SIGNAL \u2|q[3]~feeder_combout\ : std_logic;
SIGNAL \q~3_combout\ : std_logic;
SIGNAL \d[4]~input_o\ : std_logic;
SIGNAL \q~4_combout\ : std_logic;
SIGNAL \d[5]~input_o\ : std_logic;
SIGNAL \u2|q[5]~feeder_combout\ : std_logic;
SIGNAL \q~5_combout\ : std_logic;
SIGNAL \d[6]~input_o\ : std_logic;
SIGNAL \q~6_combout\ : std_logic;
SIGNAL \d[7]~input_o\ : std_logic;
SIGNAL \q~7_combout\ : std_logic;
SIGNAL \d[8]~input_o\ : std_logic;
SIGNAL \u2|q[8]~feeder_combout\ : std_logic;
SIGNAL \q~8_combout\ : std_logic;
SIGNAL \d[9]~input_o\ : std_logic;
SIGNAL \q~9_combout\ : std_logic;
SIGNAL \d[10]~input_o\ : std_logic;
SIGNAL \u2|q[10]~feeder_combout\ : std_logic;
SIGNAL \q~10_combout\ : std_logic;
SIGNAL \d[11]~input_o\ : std_logic;
SIGNAL \u2|q[11]~feeder_combout\ : std_logic;
SIGNAL \q~11_combout\ : std_logic;
SIGNAL \d[12]~input_o\ : std_logic;
SIGNAL \u2|q[12]~feeder_combout\ : std_logic;
SIGNAL \q~12_combout\ : std_logic;
SIGNAL \d[13]~input_o\ : std_logic;
SIGNAL \q~13_combout\ : std_logic;
SIGNAL \d[14]~input_o\ : std_logic;
SIGNAL \q~14_combout\ : std_logic;
SIGNAL \d[15]~input_o\ : std_logic;
SIGNAL \q~15_combout\ : std_logic;
SIGNAL \u2|q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u1|q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_d[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_d[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_en~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_d[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_sel~input_o\ : std_logic;
SIGNAL \u1|ALT_INV_q\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u2|ALT_INV_q\ : std_logic_vector(15 DOWNTO 0);

BEGIN

ww_d <= d;
ww_clk <= clk;
ww_en <= en;
ww_rst <= rst;
ww_sel <= sel;
q <= ww_q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_clk~inputCLKENA0_outclk\ <= NOT \clk~inputCLKENA0_outclk\;
\ALT_INV_d[12]~input_o\ <= NOT \d[12]~input_o\;
\ALT_INV_d[11]~input_o\ <= NOT \d[11]~input_o\;
\ALT_INV_d[10]~input_o\ <= NOT \d[10]~input_o\;
\ALT_INV_d[8]~input_o\ <= NOT \d[8]~input_o\;
\ALT_INV_d[5]~input_o\ <= NOT \d[5]~input_o\;
\ALT_INV_d[3]~input_o\ <= NOT \d[3]~input_o\;
\ALT_INV_d[1]~input_o\ <= NOT \d[1]~input_o\;
\ALT_INV_en~input_o\ <= NOT \en~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_d[0]~input_o\ <= NOT \d[0]~input_o\;
\ALT_INV_sel~input_o\ <= NOT \sel~input_o\;
\u1|ALT_INV_q\(15) <= NOT \u1|q\(15);
\u2|ALT_INV_q\(15) <= NOT \u2|q\(15);
\u1|ALT_INV_q\(14) <= NOT \u1|q\(14);
\u2|ALT_INV_q\(14) <= NOT \u2|q\(14);
\u1|ALT_INV_q\(13) <= NOT \u1|q\(13);
\u2|ALT_INV_q\(13) <= NOT \u2|q\(13);
\u1|ALT_INV_q\(12) <= NOT \u1|q\(12);
\u2|ALT_INV_q\(12) <= NOT \u2|q\(12);
\u1|ALT_INV_q\(11) <= NOT \u1|q\(11);
\u2|ALT_INV_q\(11) <= NOT \u2|q\(11);
\u1|ALT_INV_q\(10) <= NOT \u1|q\(10);
\u2|ALT_INV_q\(10) <= NOT \u2|q\(10);
\u1|ALT_INV_q\(9) <= NOT \u1|q\(9);
\u2|ALT_INV_q\(9) <= NOT \u2|q\(9);
\u1|ALT_INV_q\(8) <= NOT \u1|q\(8);
\u2|ALT_INV_q\(8) <= NOT \u2|q\(8);
\u1|ALT_INV_q\(7) <= NOT \u1|q\(7);
\u2|ALT_INV_q\(7) <= NOT \u2|q\(7);
\u1|ALT_INV_q\(6) <= NOT \u1|q\(6);
\u2|ALT_INV_q\(6) <= NOT \u2|q\(6);
\u1|ALT_INV_q\(5) <= NOT \u1|q\(5);
\u2|ALT_INV_q\(5) <= NOT \u2|q\(5);
\u1|ALT_INV_q\(4) <= NOT \u1|q\(4);
\u2|ALT_INV_q\(4) <= NOT \u2|q\(4);
\u1|ALT_INV_q\(3) <= NOT \u1|q\(3);
\u2|ALT_INV_q\(3) <= NOT \u2|q\(3);
\u1|ALT_INV_q\(2) <= NOT \u1|q\(2);
\u2|ALT_INV_q\(2) <= NOT \u2|q\(2);
\u1|ALT_INV_q\(1) <= NOT \u1|q\(1);
\u2|ALT_INV_q\(1) <= NOT \u2|q\(1);
\u1|ALT_INV_q\(0) <= NOT \u1|q\(0);
\u2|ALT_INV_q\(0) <= NOT \u2|q\(0);

-- Location: IOOBUF_X62_Y0_N53
\q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~0_combout\,
	devoe => ww_devoe,
	o => ww_q(0));

-- Location: IOOBUF_X70_Y0_N53
\q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~1_combout\,
	devoe => ww_devoe,
	o => ww_q(1));

-- Location: IOOBUF_X70_Y0_N2
\q[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~2_combout\,
	devoe => ww_devoe,
	o => ww_q(2));

-- Location: IOOBUF_X70_Y0_N36
\q[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~3_combout\,
	devoe => ww_devoe,
	o => ww_q(3));

-- Location: IOOBUF_X66_Y0_N59
\q[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~4_combout\,
	devoe => ww_devoe,
	o => ww_q(4));

-- Location: IOOBUF_X58_Y0_N42
\q[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~5_combout\,
	devoe => ww_devoe,
	o => ww_q(5));

-- Location: IOOBUF_X70_Y0_N19
\q[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~6_combout\,
	devoe => ww_devoe,
	o => ww_q(6));

-- Location: IOOBUF_X58_Y0_N59
\q[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~7_combout\,
	devoe => ww_devoe,
	o => ww_q(7));

-- Location: IOOBUF_X64_Y0_N53
\q[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~8_combout\,
	devoe => ww_devoe,
	o => ww_q(8));

-- Location: IOOBUF_X64_Y0_N2
\q[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~9_combout\,
	devoe => ww_devoe,
	o => ww_q(9));

-- Location: IOOBUF_X58_Y0_N93
\q[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~10_combout\,
	devoe => ww_devoe,
	o => ww_q(10));

-- Location: IOOBUF_X64_Y0_N36
\q[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~11_combout\,
	devoe => ww_devoe,
	o => ww_q(11));

-- Location: IOOBUF_X56_Y0_N2
\q[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~12_combout\,
	devoe => ww_devoe,
	o => ww_q(12));

-- Location: IOOBUF_X64_Y0_N19
\q[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~13_combout\,
	devoe => ww_devoe,
	o => ww_q(13));

-- Location: IOOBUF_X58_Y0_N76
\q[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~14_combout\,
	devoe => ww_devoe,
	o => ww_q(14));

-- Location: IOOBUF_X62_Y0_N19
\q[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \q~15_combout\,
	devoe => ww_devoe,
	o => ww_q(15));

-- Location: IOIBUF_X62_Y0_N1
\sel~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel,
	o => \sel~input_o\);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X66_Y0_N92
\d[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(0),
	o => \d[0]~input_o\);

-- Location: LABCELL_X67_Y1_N0
\u2|q[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[0]~feeder_combout\ = ( \d[0]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[0]~input_o\,
	combout => \u2|q[0]~feeder_combout\);

-- Location: IOIBUF_X62_Y0_N35
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X66_Y0_N75
\en~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: LABCELL_X67_Y1_N57
\u2|q[8]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[8]~0_combout\ = (!\rst~input_o\) # (\en~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010111110101111101011111010111110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_en~input_o\,
	datac => \ALT_INV_rst~input_o\,
	combout => \u2|q[8]~0_combout\);

-- Location: FF_X67_Y1_N1
\u2|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	d => \u2|q[0]~feeder_combout\,
	sclr => \ALT_INV_rst~input_o\,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(0));

-- Location: FF_X67_Y1_N38
\u1|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[0]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(0));

-- Location: LABCELL_X67_Y1_N36
\q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~0_combout\ = (!\sel~input_o\ & ((\u1|q\(0)))) # (\sel~input_o\ & (\u2|q\(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_sel~input_o\,
	datac => \u2|ALT_INV_q\(0),
	datad => \u1|ALT_INV_q\(0),
	combout => \q~0_combout\);

-- Location: IOIBUF_X72_Y0_N35
\d[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(1),
	o => \d[1]~input_o\);

-- Location: LABCELL_X67_Y1_N3
\u2|q[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[1]~feeder_combout\ = ( \d[1]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[1]~input_o\,
	combout => \u2|q[1]~feeder_combout\);

-- Location: FF_X67_Y1_N5
\u2|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	d => \u2|q[1]~feeder_combout\,
	sclr => \ALT_INV_rst~input_o\,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(1));

-- Location: FF_X67_Y1_N41
\u1|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[1]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(1));

-- Location: LABCELL_X67_Y1_N39
\q~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~1_combout\ = (!\sel~input_o\ & ((\u1|q\(1)))) # (\sel~input_o\ & (\u2|q\(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111011101000100011101110100010001110111010001000111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u2|ALT_INV_q\(1),
	datab => \ALT_INV_sel~input_o\,
	datad => \u1|ALT_INV_q\(1),
	combout => \q~1_combout\);

-- Location: IOIBUF_X68_Y0_N35
\d[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(2),
	o => \d[2]~input_o\);

-- Location: FF_X67_Y1_N20
\u1|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[2]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(2));

-- Location: FF_X67_Y1_N46
\u2|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	asdata => \d[2]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(2));

-- Location: LABCELL_X67_Y1_N18
\q~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~2_combout\ = ( \u2|q\(2) & ( (\u1|q\(2)) # (\sel~input_o\) ) ) # ( !\u2|q\(2) & ( (!\sel~input_o\ & \u1|q\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_sel~input_o\,
	datad => \u1|ALT_INV_q\(2),
	dataf => \u2|ALT_INV_q\(2),
	combout => \q~2_combout\);

-- Location: IOIBUF_X72_Y0_N1
\d[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(3),
	o => \d[3]~input_o\);

-- Location: LABCELL_X67_Y1_N27
\u2|q[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[3]~feeder_combout\ = ( \d[3]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[3]~input_o\,
	combout => \u2|q[3]~feeder_combout\);

-- Location: FF_X67_Y1_N29
\u2|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	d => \u2|q[3]~feeder_combout\,
	sclr => \ALT_INV_rst~input_o\,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(3));

-- Location: FF_X67_Y1_N32
\u1|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[3]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(3));

-- Location: LABCELL_X67_Y1_N30
\q~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~3_combout\ = (!\sel~input_o\ & ((\u1|q\(3)))) # (\sel~input_o\ & (\u2|q\(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_sel~input_o\,
	datac => \u2|ALT_INV_q\(3),
	datad => \u1|ALT_INV_q\(3),
	combout => \q~3_combout\);

-- Location: IOIBUF_X68_Y0_N18
\d[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(4),
	o => \d[4]~input_o\);

-- Location: FF_X67_Y1_N2
\u2|q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	asdata => \d[4]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(4));

-- Location: FF_X67_Y1_N23
\u1|q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[4]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(4));

-- Location: LABCELL_X67_Y1_N21
\q~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~4_combout\ = (!\sel~input_o\ & ((\u1|q\(4)))) # (\sel~input_o\ & (\u2|q\(4)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111011101000100011101110100010001110111010001000111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u2|ALT_INV_q\(4),
	datab => \ALT_INV_sel~input_o\,
	datad => \u1|ALT_INV_q\(4),
	combout => \q~4_combout\);

-- Location: IOIBUF_X56_Y0_N18
\d[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(5),
	o => \d[5]~input_o\);

-- Location: LABCELL_X60_Y1_N3
\u2|q[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[5]~feeder_combout\ = ( \d[5]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[5]~input_o\,
	combout => \u2|q[5]~feeder_combout\);

-- Location: FF_X60_Y1_N5
\u2|q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	d => \u2|q[5]~feeder_combout\,
	sclr => \ALT_INV_rst~input_o\,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(5));

-- Location: FF_X60_Y1_N11
\u1|q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[5]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(5));

-- Location: LABCELL_X60_Y1_N9
\q~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~5_combout\ = ( \u1|q\(5) & ( \sel~input_o\ & ( \u2|q\(5) ) ) ) # ( !\u1|q\(5) & ( \sel~input_o\ & ( \u2|q\(5) ) ) ) # ( \u1|q\(5) & ( !\sel~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u2|ALT_INV_q\(5),
	datae => \u1|ALT_INV_q\(5),
	dataf => \ALT_INV_sel~input_o\,
	combout => \q~5_combout\);

-- Location: IOIBUF_X66_Y0_N41
\d[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(6),
	o => \d[6]~input_o\);

-- Location: FF_X67_Y1_N17
\u1|q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[6]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(6));

-- Location: FF_X67_Y1_N11
\u2|q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	asdata => \d[6]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(6));

-- Location: LABCELL_X67_Y1_N15
\q~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~6_combout\ = ( \u2|q\(6) & ( (\u1|q\(6)) # (\sel~input_o\) ) ) # ( !\u2|q\(6) & ( (!\sel~input_o\ & \u1|q\(6)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_sel~input_o\,
	datad => \u1|ALT_INV_q\(6),
	dataf => \u2|ALT_INV_q\(6),
	combout => \q~6_combout\);

-- Location: IOIBUF_X60_Y0_N18
\d[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(7),
	o => \d[7]~input_o\);

-- Location: FF_X60_Y1_N14
\u2|q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	asdata => \d[7]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(7));

-- Location: FF_X60_Y1_N50
\u1|q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[7]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(7));

-- Location: LABCELL_X60_Y1_N48
\q~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~7_combout\ = ( \u1|q\(7) & ( \sel~input_o\ & ( \u2|q\(7) ) ) ) # ( !\u1|q\(7) & ( \sel~input_o\ & ( \u2|q\(7) ) ) ) # ( \u1|q\(7) & ( !\sel~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u2|ALT_INV_q\(7),
	datae => \u1|ALT_INV_q\(7),
	dataf => \ALT_INV_sel~input_o\,
	combout => \q~7_combout\);

-- Location: IOIBUF_X68_Y0_N1
\d[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(8),
	o => \d[8]~input_o\);

-- Location: LABCELL_X67_Y1_N24
\u2|q[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[8]~feeder_combout\ = ( \d[8]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[8]~input_o\,
	combout => \u2|q[8]~feeder_combout\);

-- Location: FF_X67_Y1_N26
\u2|q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	d => \u2|q[8]~feeder_combout\,
	sclr => \ALT_INV_rst~input_o\,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(8));

-- Location: FF_X67_Y1_N53
\u1|q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[8]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(8));

-- Location: LABCELL_X67_Y1_N51
\q~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~8_combout\ = (!\sel~input_o\ & ((\u1|q\(8)))) # (\sel~input_o\ & (\u2|q\(8)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111011101000100011101110100010001110111010001000111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u2|ALT_INV_q\(8),
	datab => \ALT_INV_sel~input_o\,
	datad => \u1|ALT_INV_q\(8),
	combout => \q~8_combout\);

-- Location: IOIBUF_X68_Y0_N52
\d[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(9),
	o => \d[9]~input_o\);

-- Location: FF_X67_Y1_N14
\u1|q[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[9]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(9));

-- Location: FF_X67_Y1_N8
\u2|q[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	asdata => \d[9]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(9));

-- Location: LABCELL_X67_Y1_N12
\q~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~9_combout\ = ( \u2|q\(9) & ( (\u1|q\(9)) # (\sel~input_o\) ) ) # ( !\u2|q\(9) & ( (!\sel~input_o\ & \u1|q\(9)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_sel~input_o\,
	datad => \u1|ALT_INV_q\(9),
	dataf => \u2|ALT_INV_q\(9),
	combout => \q~9_combout\);

-- Location: IOIBUF_X60_Y0_N52
\d[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(10),
	o => \d[10]~input_o\);

-- Location: LABCELL_X60_Y1_N54
\u2|q[10]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[10]~feeder_combout\ = ( \d[10]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[10]~input_o\,
	combout => \u2|q[10]~feeder_combout\);

-- Location: FF_X60_Y1_N56
\u2|q[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	d => \u2|q[10]~feeder_combout\,
	sclr => \ALT_INV_rst~input_o\,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(10));

-- Location: FF_X60_Y1_N32
\u1|q[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[10]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(10));

-- Location: LABCELL_X60_Y1_N30
\q~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~10_combout\ = ( \u1|q\(10) & ( \sel~input_o\ & ( \u2|q\(10) ) ) ) # ( !\u1|q\(10) & ( \sel~input_o\ & ( \u2|q\(10) ) ) ) # ( \u1|q\(10) & ( !\sel~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u2|ALT_INV_q\(10),
	datae => \u1|ALT_INV_q\(10),
	dataf => \ALT_INV_sel~input_o\,
	combout => \q~10_combout\);

-- Location: IOIBUF_X72_Y0_N52
\d[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(11),
	o => \d[11]~input_o\);

-- Location: LABCELL_X67_Y1_N42
\u2|q[11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[11]~feeder_combout\ = ( \d[11]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[11]~input_o\,
	combout => \u2|q[11]~feeder_combout\);

-- Location: FF_X67_Y1_N44
\u2|q[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	d => \u2|q[11]~feeder_combout\,
	sclr => \ALT_INV_rst~input_o\,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(11));

-- Location: FF_X67_Y1_N35
\u1|q[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[11]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(11));

-- Location: LABCELL_X67_Y1_N33
\q~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~11_combout\ = (!\sel~input_o\ & ((\u1|q\(11)))) # (\sel~input_o\ & (\u2|q\(11)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_sel~input_o\,
	datac => \u2|ALT_INV_q\(11),
	datad => \u1|ALT_INV_q\(11),
	combout => \q~11_combout\);

-- Location: IOIBUF_X60_Y0_N35
\d[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(12),
	o => \d[12]~input_o\);

-- Location: LABCELL_X60_Y1_N39
\u2|q[12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u2|q[12]~feeder_combout\ = ( \d[12]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_d[12]~input_o\,
	combout => \u2|q[12]~feeder_combout\);

-- Location: FF_X60_Y1_N41
\u2|q[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	d => \u2|q[12]~feeder_combout\,
	sclr => \ALT_INV_rst~input_o\,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(12));

-- Location: FF_X60_Y1_N47
\u1|q[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[12]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(12));

-- Location: LABCELL_X60_Y1_N45
\q~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~12_combout\ = ( \u1|q\(12) & ( \sel~input_o\ & ( \u2|q\(12) ) ) ) # ( !\u1|q\(12) & ( \sel~input_o\ & ( \u2|q\(12) ) ) ) # ( \u1|q\(12) & ( !\sel~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u2|ALT_INV_q\(12),
	datae => \u1|ALT_INV_q\(12),
	dataf => \ALT_INV_sel~input_o\,
	combout => \q~12_combout\);

-- Location: IOIBUF_X72_Y0_N18
\d[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(13),
	o => \d[13]~input_o\);

-- Location: FF_X67_Y1_N56
\u2|q[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	asdata => \d[13]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(13));

-- Location: FF_X67_Y1_N50
\u1|q[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[13]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(13));

-- Location: LABCELL_X67_Y1_N48
\q~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~13_combout\ = (!\sel~input_o\ & ((\u1|q\(13)))) # (\sel~input_o\ & (\u2|q\(13)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_sel~input_o\,
	datac => \u2|ALT_INV_q\(13),
	datad => \u1|ALT_INV_q\(13),
	combout => \q~13_combout\);

-- Location: IOIBUF_X56_Y0_N52
\d[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(14),
	o => \d[14]~input_o\);

-- Location: FF_X60_Y1_N20
\u2|q[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	asdata => \d[14]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(14));

-- Location: FF_X60_Y1_N26
\u1|q[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[14]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(14));

-- Location: LABCELL_X60_Y1_N24
\q~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~14_combout\ = (!\sel~input_o\ & ((\u1|q\(14)))) # (\sel~input_o\ & (\u2|q\(14)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111100000101101011110000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_sel~input_o\,
	datac => \u2|ALT_INV_q\(14),
	datad => \u1|ALT_INV_q\(14),
	combout => \q~14_combout\);

-- Location: IOIBUF_X60_Y0_N1
\d[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(15),
	o => \d[15]~input_o\);

-- Location: FF_X60_Y1_N22
\u2|q[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputCLKENA0_outclk\,
	asdata => \d[15]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u2|q\(15));

-- Location: FF_X60_Y1_N29
\u1|q[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \d[15]~input_o\,
	sclr => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \u2|q[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u1|q\(15));

-- Location: LABCELL_X60_Y1_N27
\q~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \q~15_combout\ = (!\sel~input_o\ & ((\u1|q\(15)))) # (\sel~input_o\ & (\u2|q\(15)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111100000101101011110000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_sel~input_o\,
	datac => \u2|ALT_INV_q\(15),
	datad => \u1|ALT_INV_q\(15),
	combout => \q~15_combout\);

-- Location: LABCELL_X60_Y14_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


