-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

-- DATE "03/24/2025 18:28:16"

-- 
-- Device: Altera 10M08SAE144C8G Package EQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LogicalStep_Lab4_top IS
    PORT (
	clkin_50 : IN std_logic;
	rst_n : IN std_logic;
	pb_n : IN std_logic_vector(3 DOWNTO 0);
	sw : IN std_logic_vector(7 DOWNTO 0);
	leds : BUFFER std_logic_vector(7 DOWNTO 0);
	seg7_data : BUFFER std_logic_vector(6 DOWNTO 0);
	seg7_char1 : BUFFER std_logic;
	seg7_char2 : BUFFER std_logic;
	sm_clken : BUFFER std_logic;
	blink_sig : BUFFER std_logic;
	NS_a : BUFFER std_logic;
	NS_g : BUFFER std_logic;
	NS_d : BUFFER std_logic;
	EW_a : BUFFER std_logic;
	EW_g : BUFFER std_logic;
	EW_d : BUFFER std_logic
	);
END LogicalStep_Lab4_top;

ARCHITECTURE structure OF LogicalStep_Lab4_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clkin_50 : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_pb_n : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sw : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_seg7_data : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg7_char1 : std_logic;
SIGNAL ww_seg7_char2 : std_logic;
SIGNAL ww_sm_clken : std_logic;
SIGNAL ww_blink_sig : std_logic;
SIGNAL ww_NS_a : std_logic;
SIGNAL ww_NS_g : std_logic;
SIGNAL ww_NS_d : std_logic;
SIGNAL ww_EW_a : std_logic;
SIGNAL ww_EW_g : std_logic;
SIGNAL ww_EW_d : std_logic;
SIGNAL \pb_n[2]~input_o\ : std_logic;
SIGNAL \pb_n[3]~input_o\ : std_logic;
SIGNAL \sw[0]~input_o\ : std_logic;
SIGNAL \sw[1]~input_o\ : std_logic;
SIGNAL \sw[2]~input_o\ : std_logic;
SIGNAL \sw[3]~input_o\ : std_logic;
SIGNAL \sw[4]~input_o\ : std_logic;
SIGNAL \sw[5]~input_o\ : std_logic;
SIGNAL \sw[6]~input_o\ : std_logic;
SIGNAL \sw[7]~input_o\ : std_logic;
SIGNAL \seg7_data[6]~output_o\ : std_logic;
SIGNAL \leds[0]~output_o\ : std_logic;
SIGNAL \leds[1]~output_o\ : std_logic;
SIGNAL \leds[2]~output_o\ : std_logic;
SIGNAL \leds[3]~output_o\ : std_logic;
SIGNAL \leds[4]~output_o\ : std_logic;
SIGNAL \leds[5]~output_o\ : std_logic;
SIGNAL \leds[6]~output_o\ : std_logic;
SIGNAL \leds[7]~output_o\ : std_logic;
SIGNAL \seg7_data[0]~output_o\ : std_logic;
SIGNAL \seg7_data[1]~output_o\ : std_logic;
SIGNAL \seg7_data[2]~output_o\ : std_logic;
SIGNAL \seg7_data[3]~output_o\ : std_logic;
SIGNAL \seg7_data[4]~output_o\ : std_logic;
SIGNAL \seg7_data[5]~output_o\ : std_logic;
SIGNAL \seg7_char1~output_o\ : std_logic;
SIGNAL \seg7_char2~output_o\ : std_logic;
SIGNAL \sm_clken~output_o\ : std_logic;
SIGNAL \blink_sig~output_o\ : std_logic;
SIGNAL \NS_a~output_o\ : std_logic;
SIGNAL \NS_g~output_o\ : std_logic;
SIGNAL \NS_d~output_o\ : std_logic;
SIGNAL \EW_a~output_o\ : std_logic;
SIGNAL \EW_g~output_o\ : std_logic;
SIGNAL \EW_d~output_o\ : std_logic;
SIGNAL \clkin_50~input_o\ : std_logic;
SIGNAL \pb_n[0]~input_o\ : std_logic;
SIGNAL \INST0|pb_n_filtered[0]~0_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \INST0|rst_n_filtered~0_combout\ : std_logic;
SIGNAL \INSTNSS|sreg~0_combout\ : std_logic;
SIGNAL \INSTNSHR|d~0_combout\ : std_logic;
SIGNAL \INSTNSHR|dout~q\ : std_logic;
SIGNAL \pb_n[1]~input_o\ : std_logic;
SIGNAL \INST0|pb_n_filtered[1]~1_combout\ : std_logic;
SIGNAL \INSTEWS|sreg~0_combout\ : std_logic;
SIGNAL \INSTEWHR|d~0_combout\ : std_logic;
SIGNAL \INSTEWHR|dout~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[4]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[4]~q\ : std_logic;
SIGNAL \INST3|clk_reg_extend~0_combout\ : std_logic;
SIGNAL \INST3|clk_reg_extend~1_combout\ : std_logic;
SIGNAL \INST3|sm_clken~combout\ : std_logic;
SIGNAL \INSTSM|current_state~48_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S15~q\ : std_logic;
SIGNAL \INSTSM|current_state~45_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S0~q\ : std_logic;
SIGNAL \INSTSM|next_state.S1~0_combout\ : std_logic;
SIGNAL \INSTSM|current_state~35_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S1~q\ : std_logic;
SIGNAL \INSTSM|next_state.S2~0_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S2~q\ : std_logic;
SIGNAL \INSTSM|current_state~34_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S3~q\ : std_logic;
SIGNAL \INSTSM|current_state~36_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S4~q\ : std_logic;
SIGNAL \INSTSM|current_state~37_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S5~q\ : std_logic;
SIGNAL \INSTSM|Selector2~2_combout\ : std_logic;
SIGNAL \INSTSM|current_state~41_combout\ : std_logic;
SIGNAL \INSTSM|current_state~42_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S6~q\ : std_logic;
SIGNAL \INSTSM|current_state~47_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S7~q\ : std_logic;
SIGNAL \INSTSM|current_state~46_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S8~q\ : std_logic;
SIGNAL \INSTSM|next_state.S9~0_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S9~q\ : std_logic;
SIGNAL \INSTSM|next_state.S10~0_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S10~q\ : std_logic;
SIGNAL \INSTSM|current_state~38_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S11~q\ : std_logic;
SIGNAL \INSTSM|current_state~39_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S12~q\ : std_logic;
SIGNAL \INSTSM|current_state~40_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S13~q\ : std_logic;
SIGNAL \INSTSM|WideOr7~0_combout\ : std_logic;
SIGNAL \INSTSM|current_state~43_combout\ : std_logic;
SIGNAL \INSTSM|current_state~44_combout\ : std_logic;
SIGNAL \INSTSM|current_state.S14~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[0]~0_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[0]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[1]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[1]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[1]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[2]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[2]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[2]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[3]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[3]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[3]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[4]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[4]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[4]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[5]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[5]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[5]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[6]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[6]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[6]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[7]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[7]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[7]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[8]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[8]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[8]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[9]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[9]~q\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[9]~2\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[10]~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|clk_proc:COUNT[10]~q\ : std_logic;
SIGNAL \INSTSM|WideOr2~1_combout\ : std_logic;
SIGNAL \INSTLIGHTS|DOUT_TEMP[6]~0_combout\ : std_logic;
SIGNAL \INSTSM|WideOr3~combout\ : std_logic;
SIGNAL \INSTSM|WideOr6~0_combout\ : std_logic;
SIGNAL \INSTSM|WideOr9~0_combout\ : std_logic;
SIGNAL \INSTSM|WideOr8~0_combout\ : std_logic;
SIGNAL \INSTSM|WideOr9~combout\ : std_logic;
SIGNAL \INSTSM|WideOr8~1_combout\ : std_logic;
SIGNAL \INSTSM|WideOr8~combout\ : std_logic;
SIGNAL \INSTSM|WideOr2~0_combout\ : std_logic;
SIGNAL \INSTSM|WideOr7~combout\ : std_logic;
SIGNAL \INSTSM|WideOr2~combout\ : std_logic;
SIGNAL \INSTLIGHTS|DOUT[0]~0_combout\ : std_logic;
SIGNAL \INST3|blink_sig~0_combout\ : std_logic;
SIGNAL \INST3|blink_sig~q\ : std_logic;
SIGNAL \INSTSM|Selector2~3_combout\ : std_logic;
SIGNAL \INSTSM|Selector3~2_combout\ : std_logic;
SIGNAL \INSTLIGHTS|DOUT[3]~1_combout\ : std_logic;
SIGNAL \INSTSM|ew_amber~combout\ : std_logic;
SIGNAL \INSTNSS|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INSTEWS|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST3|clk_reg_extend\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST0|sreg4\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INSTMID|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST0|sreg0\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INST0|sreg1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INSTSM|ALT_INV_WideOr2~combout\ : std_logic;
SIGNAL \INSTSM|ALT_INV_WideOr2~1_combout\ : std_logic;
SIGNAL \INSTSM|ALT_INV_WideOr7~combout\ : std_logic;
SIGNAL \INSTSM|ALT_INV_WideOr8~combout\ : std_logic;
SIGNAL \INSTSM|ALT_INV_WideOr9~combout\ : std_logic;
SIGNAL \INSTLIGHTS|ALT_INV_clk_proc:COUNT[10]~q\ : std_logic;

BEGIN

ww_clkin_50 <= clkin_50;
ww_rst_n <= rst_n;
ww_pb_n <= pb_n;
ww_sw <= sw;
leds <= ww_leds;
seg7_data <= ww_seg7_data;
seg7_char1 <= ww_seg7_char1;
seg7_char2 <= ww_seg7_char2;
sm_clken <= ww_sm_clken;
blink_sig <= ww_blink_sig;
NS_a <= ww_NS_a;
NS_g <= ww_NS_g;
NS_d <= ww_NS_d;
EW_a <= ww_EW_a;
EW_g <= ww_EW_g;
EW_d <= ww_EW_d;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\INSTSM|ALT_INV_WideOr2~combout\ <= NOT \INSTSM|WideOr2~combout\;
\INSTSM|ALT_INV_WideOr2~1_combout\ <= NOT \INSTSM|WideOr2~1_combout\;
\INSTSM|ALT_INV_WideOr7~combout\ <= NOT \INSTSM|WideOr7~combout\;
\INSTSM|ALT_INV_WideOr8~combout\ <= NOT \INSTSM|WideOr8~combout\;
\INSTSM|ALT_INV_WideOr9~combout\ <= NOT \INSTSM|WideOr9~combout\;
\INSTLIGHTS|ALT_INV_clk_proc:COUNT[10]~q\ <= NOT \INSTLIGHTS|clk_proc:COUNT[10]~q\;

\seg7_data[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \INSTLIGHTS|DOUT_TEMP[6]~0_combout\,
	devoe => ww_devoe,
	o => \seg7_data[6]~output_o\);

\leds[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|WideOr3~combout\,
	devoe => ww_devoe,
	o => \leds[0]~output_o\);

\leds[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTNSHR|dout~q\,
	devoe => ww_devoe,
	o => \leds[1]~output_o\);

\leds[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|WideOr6~0_combout\,
	devoe => ww_devoe,
	o => \leds[2]~output_o\);

\leds[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTEWHR|dout~q\,
	devoe => ww_devoe,
	o => \leds[3]~output_o\);

\leds[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|ALT_INV_WideOr9~combout\,
	devoe => ww_devoe,
	o => \leds[4]~output_o\);

\leds[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|ALT_INV_WideOr8~combout\,
	devoe => ww_devoe,
	o => \leds[5]~output_o\);

\leds[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|ALT_INV_WideOr7~combout\,
	devoe => ww_devoe,
	o => \leds[6]~output_o\);

\leds[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|ALT_INV_WideOr2~combout\,
	devoe => ww_devoe,
	o => \leds[7]~output_o\);

\seg7_data[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTLIGHTS|DOUT[0]~0_combout\,
	devoe => ww_devoe,
	o => \seg7_data[0]~output_o\);

\seg7_data[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[1]~output_o\);

\seg7_data[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[2]~output_o\);

\seg7_data[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTLIGHTS|DOUT[3]~1_combout\,
	devoe => ww_devoe,
	o => \seg7_data[3]~output_o\);

\seg7_data[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[4]~output_o\);

\seg7_data[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[5]~output_o\);

\seg7_char1~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTLIGHTS|ALT_INV_clk_proc:COUNT[10]~q\,
	devoe => ww_devoe,
	o => \seg7_char1~output_o\);

\seg7_char2~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTLIGHTS|clk_proc:COUNT[10]~q\,
	devoe => ww_devoe,
	o => \seg7_char2~output_o\);

\sm_clken~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|sm_clken~combout\,
	devoe => ww_devoe,
	o => \sm_clken~output_o\);

\blink_sig~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|blink_sig~q\,
	devoe => ww_devoe,
	o => \blink_sig~output_o\);

\NS_a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|ALT_INV_WideOr2~combout\,
	devoe => ww_devoe,
	o => \NS_a~output_o\);

\NS_g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|ALT_INV_WideOr2~1_combout\,
	devoe => ww_devoe,
	o => \NS_g~output_o\);

\NS_d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|Selector2~3_combout\,
	devoe => ww_devoe,
	o => \NS_d~output_o\);

\EW_a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|WideOr2~combout\,
	devoe => ww_devoe,
	o => \EW_a~output_o\);

\EW_g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|ew_amber~combout\,
	devoe => ww_devoe,
	o => \EW_g~output_o\);

\EW_d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INSTSM|Selector3~2_combout\,
	devoe => ww_devoe,
	o => \EW_d~output_o\);

\clkin_50~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clkin_50,
	o => \clkin_50~input_o\);

\pb_n[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(0),
	o => \pb_n[0]~input_o\);

\INST0|sreg0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \pb_n[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(0));

\INST0|sreg0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(1));

\INST0|sreg0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(2));

\INST0|sreg0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(3));

\INST0|pb_n_filtered[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST0|pb_n_filtered[0]~0_combout\ = (!\INST0|sreg0\(1) & (!\INST0|sreg0\(2) & !\INST0|sreg0\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST0|sreg0\(1),
	datab => \INST0|sreg0\(2),
	datac => \INST0|sreg0\(3),
	combout => \INST0|pb_n_filtered[0]~0_combout\);

\rst_n~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

\INST0|sreg4[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(0));

\INST0|sreg4[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(1));

\INST0|sreg4[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(2));

\INST0|sreg4[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(3));

\INST0|rst_n_filtered~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST0|rst_n_filtered~0_combout\ = (!\INST0|sreg4\(1) & (!\INST0|sreg4\(2) & !\INST0|sreg4\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST0|sreg4\(1),
	datab => \INST0|sreg4\(2),
	datac => \INST0|sreg4\(3),
	combout => \INST0|rst_n_filtered~0_combout\);

\INSTMID|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|rst_n_filtered~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTMID|sreg\(0));

\INSTMID|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTMID|sreg\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTMID|sreg\(1));

\INSTNSS|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|pb_n_filtered[0]~0_combout\,
	sclr => \INSTMID|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTNSS|sreg\(0));

\INSTNSS|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTNSS|sreg~0_combout\ = (\INSTNSS|sreg\(0) & !\INSTMID|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTNSS|sreg\(0),
	datad => \INSTMID|sreg\(1),
	combout => \INSTNSS|sreg~0_combout\);

\INSTNSS|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTNSS|sreg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTNSS|sreg\(1));

\INSTNSHR|d~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTNSHR|d~0_combout\ = (!\INSTSM|current_state.S6~q\ & (!\INSTMID|sreg\(1) & ((\INSTNSHR|dout~q\) # (\INSTNSS|sreg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTNSHR|dout~q\,
	datab => \INSTNSS|sreg\(1),
	datac => \INSTSM|current_state.S6~q\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTNSHR|d~0_combout\);

\INSTNSHR|dout\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTNSHR|d~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTNSHR|dout~q\);

\pb_n[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(1),
	o => \pb_n[1]~input_o\);

\INST0|sreg1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \pb_n[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(0));

\INST0|sreg1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(1));

\INST0|sreg1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(2));

\INST0|sreg1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(3));

\INST0|pb_n_filtered[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST0|pb_n_filtered[1]~1_combout\ = (!\INST0|sreg1\(1) & (!\INST0|sreg1\(2) & !\INST0|sreg1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST0|sreg1\(1),
	datab => \INST0|sreg1\(2),
	datac => \INST0|sreg1\(3),
	combout => \INST0|pb_n_filtered[1]~1_combout\);

\INSTEWS|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|pb_n_filtered[1]~1_combout\,
	sclr => \INSTMID|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTEWS|sreg\(0));

\INSTEWS|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTEWS|sreg~0_combout\ = (\INSTEWS|sreg\(0) & !\INSTMID|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTEWS|sreg\(0),
	datad => \INSTMID|sreg\(1),
	combout => \INSTEWS|sreg~0_combout\);

\INSTEWS|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTEWS|sreg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTEWS|sreg\(1));

\INSTEWHR|d~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTEWHR|d~0_combout\ = (!\INSTSM|current_state.S14~q\ & (!\INSTMID|sreg\(1) & ((\INSTEWHR|dout~q\) # (\INSTEWS|sreg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTEWHR|dout~q\,
	datab => \INSTEWS|sreg\(1),
	datac => \INSTSM|current_state.S14~q\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTEWHR|d~0_combout\);

\INSTEWHR|dout\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTEWHR|d~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTEWHR|dout~q\);

\INST3|clk_divider:counter[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[0]~1_combout\ = \INST3|clk_divider:counter[0]~q\ $ (VCC)
-- \INST3|clk_divider:counter[0]~2\ = CARRY(\INST3|clk_divider:counter[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[0]~q\,
	datad => VCC,
	combout => \INST3|clk_divider:counter[0]~1_combout\,
	cout => \INST3|clk_divider:counter[0]~2\);

\INST3|clk_divider:counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[0]~1_combout\,
	sclr => \INSTMID|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[0]~q\);

\INST3|clk_divider:counter[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[1]~1_combout\ = (\INST3|clk_divider:counter[1]~q\ & (!\INST3|clk_divider:counter[0]~2\)) # (!\INST3|clk_divider:counter[1]~q\ & ((\INST3|clk_divider:counter[0]~2\) # (GND)))
-- \INST3|clk_divider:counter[1]~2\ = CARRY((!\INST3|clk_divider:counter[0]~2\) # (!\INST3|clk_divider:counter[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[1]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[0]~2\,
	combout => \INST3|clk_divider:counter[1]~1_combout\,
	cout => \INST3|clk_divider:counter[1]~2\);

\INST3|clk_divider:counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[1]~1_combout\,
	sclr => \INSTMID|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[1]~q\);

\INST3|clk_divider:counter[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[2]~1_combout\ = (\INST3|clk_divider:counter[2]~q\ & (\INST3|clk_divider:counter[1]~2\ $ (GND))) # (!\INST3|clk_divider:counter[2]~q\ & (!\INST3|clk_divider:counter[1]~2\ & VCC))
-- \INST3|clk_divider:counter[2]~2\ = CARRY((\INST3|clk_divider:counter[2]~q\ & !\INST3|clk_divider:counter[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[2]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[1]~2\,
	combout => \INST3|clk_divider:counter[2]~1_combout\,
	cout => \INST3|clk_divider:counter[2]~2\);

\INST3|clk_divider:counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[2]~1_combout\,
	sclr => \INSTMID|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[2]~q\);

\INST3|clk_divider:counter[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[3]~1_combout\ = (\INST3|clk_divider:counter[3]~q\ & (!\INST3|clk_divider:counter[2]~2\)) # (!\INST3|clk_divider:counter[3]~q\ & ((\INST3|clk_divider:counter[2]~2\) # (GND)))
-- \INST3|clk_divider:counter[3]~2\ = CARRY((!\INST3|clk_divider:counter[2]~2\) # (!\INST3|clk_divider:counter[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[3]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[2]~2\,
	combout => \INST3|clk_divider:counter[3]~1_combout\,
	cout => \INST3|clk_divider:counter[3]~2\);

\INST3|clk_divider:counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[3]~1_combout\,
	sclr => \INSTMID|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[3]~q\);

\INST3|clk_divider:counter[4]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[4]~1_combout\ = \INST3|clk_divider:counter[4]~q\ $ (!\INST3|clk_divider:counter[3]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[4]~q\,
	cin => \INST3|clk_divider:counter[3]~2\,
	combout => \INST3|clk_divider:counter[4]~1_combout\);

\INST3|clk_divider:counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[4]~1_combout\,
	sclr => \INSTMID|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[4]~q\);

\INST3|clk_reg_extend~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_reg_extend~0_combout\ = (\INST3|clk_divider:counter[4]~q\ & !\INSTMID|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[4]~q\,
	datad => \INSTMID|sreg\(1),
	combout => \INST3|clk_reg_extend~0_combout\);

\INST3|clk_reg_extend[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_reg_extend~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_reg_extend\(0));

\INST3|clk_reg_extend~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_reg_extend~1_combout\ = (\INST3|clk_reg_extend\(0) & !\INSTMID|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_reg_extend\(0),
	datad => \INSTMID|sreg\(1),
	combout => \INST3|clk_reg_extend~1_combout\);

\INST3|clk_reg_extend[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_reg_extend~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_reg_extend\(1));

\INST3|sm_clken\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|sm_clken~combout\ = (\INST3|clk_reg_extend\(0) & !\INST3|clk_reg_extend\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_reg_extend\(0),
	datad => \INST3|clk_reg_extend\(1),
	combout => \INST3|sm_clken~combout\);

\INSTSM|current_state~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~48_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S14~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S15~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S14~q\,
	datab => \INSTSM|current_state.S15~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~48_combout\);

\INSTSM|current_state.S15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S15~q\);

\INSTSM|current_state~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~45_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (!\INSTSM|current_state.S15~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S0~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTMID|sreg\(1),
	datab => \INSTSM|current_state.S15~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTSM|current_state.S0~q\,
	combout => \INSTSM|current_state~45_combout\);

\INSTSM|current_state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S0~q\);

\INSTSM|next_state.S1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|next_state.S1~0_combout\ = (!\INSTSM|current_state.S0~q\ & ((\INSTNSHR|dout~q\) # (!\INSTEWHR|dout~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTNSHR|dout~q\,
	datac => \INSTEWHR|dout~q\,
	datad => \INSTSM|current_state.S0~q\,
	combout => \INSTSM|next_state.S1~0_combout\);

\INSTSM|current_state~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~35_combout\ = (\INSTMID|sreg\(1)) # ((\INST3|clk_reg_extend\(0) & !\INST3|clk_reg_extend\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTMID|sreg\(1),
	datab => \INST3|clk_reg_extend\(0),
	datad => \INST3|clk_reg_extend\(1),
	combout => \INSTSM|current_state~35_combout\);

\INSTSM|current_state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|next_state.S1~0_combout\,
	sclr => \INSTMID|sreg\(1),
	ena => \INSTSM|current_state~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S1~q\);

\INSTSM|next_state.S2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|next_state.S2~0_combout\ = (\INSTSM|current_state.S1~q\ & ((\INSTNSHR|dout~q\) # (!\INSTEWHR|dout~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S1~q\,
	datab => \INSTNSHR|dout~q\,
	datad => \INSTEWHR|dout~q\,
	combout => \INSTSM|next_state.S2~0_combout\);

\INSTSM|current_state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|next_state.S2~0_combout\,
	sclr => \INSTMID|sreg\(1),
	ena => \INSTSM|current_state~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S2~q\);

\INSTSM|current_state~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~34_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S2~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S3~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S2~q\,
	datab => \INSTSM|current_state.S3~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~34_combout\);

\INSTSM|current_state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S3~q\);

\INSTSM|current_state~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~36_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S3~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S4~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S3~q\,
	datab => \INSTSM|current_state.S4~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~36_combout\);

\INSTSM|current_state.S4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S4~q\);

\INSTSM|current_state~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~37_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S4~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S5~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S4~q\,
	datab => \INSTSM|current_state.S5~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~37_combout\);

\INSTSM|current_state.S5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S5~q\);

\INSTSM|Selector2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|Selector2~2_combout\ = (\INSTSM|current_state.S0~q\ & !\INSTSM|current_state.S1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S0~q\,
	datad => \INSTSM|current_state.S1~q\,
	combout => \INSTSM|Selector2~2_combout\);

\INSTSM|current_state~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~41_combout\ = (\INSTSM|current_state.S5~q\) # ((\INSTEWHR|dout~q\ & (!\INSTNSHR|dout~q\ & !\INSTSM|Selector2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S5~q\,
	datab => \INSTEWHR|dout~q\,
	datac => \INSTNSHR|dout~q\,
	datad => \INSTSM|Selector2~2_combout\,
	combout => \INSTSM|current_state~41_combout\);

\INSTSM|current_state~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~42_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state~41_combout\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S6~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state~41_combout\,
	datab => \INSTSM|current_state.S6~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~42_combout\);

\INSTSM|current_state.S6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S6~q\);

\INSTSM|current_state~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~47_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S6~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S7~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S6~q\,
	datab => \INSTSM|current_state.S7~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~47_combout\);

\INSTSM|current_state.S7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~47_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S7~q\);

\INSTSM|current_state~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~46_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S7~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S8~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S7~q\,
	datab => \INSTSM|current_state.S8~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~46_combout\);

\INSTSM|current_state.S8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S8~q\);

\INSTSM|next_state.S9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|next_state.S9~0_combout\ = (\INSTSM|current_state.S8~q\ & ((\INSTEWHR|dout~q\) # (!\INSTNSHR|dout~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S8~q\,
	datab => \INSTEWHR|dout~q\,
	datad => \INSTNSHR|dout~q\,
	combout => \INSTSM|next_state.S9~0_combout\);

\INSTSM|current_state.S9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|next_state.S9~0_combout\,
	sclr => \INSTMID|sreg\(1),
	ena => \INSTSM|current_state~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S9~q\);

\INSTSM|next_state.S10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|next_state.S10~0_combout\ = (\INSTSM|current_state.S9~q\ & ((\INSTEWHR|dout~q\) # (!\INSTNSHR|dout~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S9~q\,
	datab => \INSTEWHR|dout~q\,
	datad => \INSTNSHR|dout~q\,
	combout => \INSTSM|next_state.S10~0_combout\);

\INSTSM|current_state.S10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|next_state.S10~0_combout\,
	sclr => \INSTMID|sreg\(1),
	ena => \INSTSM|current_state~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S10~q\);

\INSTSM|current_state~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~38_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S10~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S11~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S10~q\,
	datab => \INSTSM|current_state.S11~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~38_combout\);

\INSTSM|current_state.S11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S11~q\);

\INSTSM|current_state~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~39_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S11~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S12~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S11~q\,
	datab => \INSTSM|current_state.S12~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~39_combout\);

\INSTSM|current_state.S12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S12~q\);

\INSTSM|current_state~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~40_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state.S12~q\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S13~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S12~q\,
	datab => \INSTSM|current_state.S13~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~40_combout\);

\INSTSM|current_state.S13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S13~q\);

\INSTSM|WideOr7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr7~0_combout\ = (!\INSTSM|current_state.S8~q\ & !\INSTSM|current_state.S9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INSTSM|current_state.S8~q\,
	datad => \INSTSM|current_state.S9~q\,
	combout => \INSTSM|WideOr7~0_combout\);

\INSTSM|current_state~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~43_combout\ = (\INSTSM|current_state.S13~q\) # ((\INSTNSHR|dout~q\ & (!\INSTEWHR|dout~q\ & !\INSTSM|WideOr7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S13~q\,
	datab => \INSTNSHR|dout~q\,
	datac => \INSTEWHR|dout~q\,
	datad => \INSTSM|WideOr7~0_combout\,
	combout => \INSTSM|current_state~43_combout\);

\INSTSM|current_state~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|current_state~44_combout\ = (!\INSTMID|sreg\(1) & ((\INST3|sm_clken~combout\ & (\INSTSM|current_state~43_combout\)) # (!\INST3|sm_clken~combout\ & ((\INSTSM|current_state.S14~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state~43_combout\,
	datab => \INSTSM|current_state.S14~q\,
	datac => \INST3|sm_clken~combout\,
	datad => \INSTMID|sreg\(1),
	combout => \INSTSM|current_state~44_combout\);

\INSTSM|current_state.S14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTSM|current_state~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTSM|current_state.S14~q\);

\INSTLIGHTS|clk_proc:COUNT[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[0]~0_combout\ = !\INSTLIGHTS|clk_proc:COUNT[0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[0]~q\,
	combout => \INSTLIGHTS|clk_proc:COUNT[0]~0_combout\);

\INSTLIGHTS|clk_proc:COUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[0]~q\);

\INSTLIGHTS|clk_proc:COUNT[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[1]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[1]~q\ & (\INSTLIGHTS|clk_proc:COUNT[0]~q\ $ (VCC))) # (!\INSTLIGHTS|clk_proc:COUNT[1]~q\ & (\INSTLIGHTS|clk_proc:COUNT[0]~q\ & VCC))
-- \INSTLIGHTS|clk_proc:COUNT[1]~2\ = CARRY((\INSTLIGHTS|clk_proc:COUNT[1]~q\ & \INSTLIGHTS|clk_proc:COUNT[0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[1]~q\,
	datab => \INSTLIGHTS|clk_proc:COUNT[0]~q\,
	datad => VCC,
	combout => \INSTLIGHTS|clk_proc:COUNT[1]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[1]~2\);

\INSTLIGHTS|clk_proc:COUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[1]~q\);

\INSTLIGHTS|clk_proc:COUNT[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[2]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[2]~q\ & (!\INSTLIGHTS|clk_proc:COUNT[1]~2\)) # (!\INSTLIGHTS|clk_proc:COUNT[2]~q\ & ((\INSTLIGHTS|clk_proc:COUNT[1]~2\) # (GND)))
-- \INSTLIGHTS|clk_proc:COUNT[2]~2\ = CARRY((!\INSTLIGHTS|clk_proc:COUNT[1]~2\) # (!\INSTLIGHTS|clk_proc:COUNT[2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[2]~q\,
	datad => VCC,
	cin => \INSTLIGHTS|clk_proc:COUNT[1]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[2]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[2]~2\);

\INSTLIGHTS|clk_proc:COUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[2]~q\);

\INSTLIGHTS|clk_proc:COUNT[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[3]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[3]~q\ & (\INSTLIGHTS|clk_proc:COUNT[2]~2\ $ (GND))) # (!\INSTLIGHTS|clk_proc:COUNT[3]~q\ & (!\INSTLIGHTS|clk_proc:COUNT[2]~2\ & VCC))
-- \INSTLIGHTS|clk_proc:COUNT[3]~2\ = CARRY((\INSTLIGHTS|clk_proc:COUNT[3]~q\ & !\INSTLIGHTS|clk_proc:COUNT[2]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[3]~q\,
	datad => VCC,
	cin => \INSTLIGHTS|clk_proc:COUNT[2]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[3]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[3]~2\);

\INSTLIGHTS|clk_proc:COUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[3]~q\);

\INSTLIGHTS|clk_proc:COUNT[4]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[4]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[4]~q\ & (!\INSTLIGHTS|clk_proc:COUNT[3]~2\)) # (!\INSTLIGHTS|clk_proc:COUNT[4]~q\ & ((\INSTLIGHTS|clk_proc:COUNT[3]~2\) # (GND)))
-- \INSTLIGHTS|clk_proc:COUNT[4]~2\ = CARRY((!\INSTLIGHTS|clk_proc:COUNT[3]~2\) # (!\INSTLIGHTS|clk_proc:COUNT[4]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[4]~q\,
	datad => VCC,
	cin => \INSTLIGHTS|clk_proc:COUNT[3]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[4]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[4]~2\);

\INSTLIGHTS|clk_proc:COUNT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[4]~q\);

\INSTLIGHTS|clk_proc:COUNT[5]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[5]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[5]~q\ & (\INSTLIGHTS|clk_proc:COUNT[4]~2\ $ (GND))) # (!\INSTLIGHTS|clk_proc:COUNT[5]~q\ & (!\INSTLIGHTS|clk_proc:COUNT[4]~2\ & VCC))
-- \INSTLIGHTS|clk_proc:COUNT[5]~2\ = CARRY((\INSTLIGHTS|clk_proc:COUNT[5]~q\ & !\INSTLIGHTS|clk_proc:COUNT[4]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[5]~q\,
	datad => VCC,
	cin => \INSTLIGHTS|clk_proc:COUNT[4]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[5]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[5]~2\);

\INSTLIGHTS|clk_proc:COUNT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[5]~q\);

\INSTLIGHTS|clk_proc:COUNT[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[6]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[6]~q\ & (!\INSTLIGHTS|clk_proc:COUNT[5]~2\)) # (!\INSTLIGHTS|clk_proc:COUNT[6]~q\ & ((\INSTLIGHTS|clk_proc:COUNT[5]~2\) # (GND)))
-- \INSTLIGHTS|clk_proc:COUNT[6]~2\ = CARRY((!\INSTLIGHTS|clk_proc:COUNT[5]~2\) # (!\INSTLIGHTS|clk_proc:COUNT[6]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[6]~q\,
	datad => VCC,
	cin => \INSTLIGHTS|clk_proc:COUNT[5]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[6]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[6]~2\);

\INSTLIGHTS|clk_proc:COUNT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[6]~q\);

\INSTLIGHTS|clk_proc:COUNT[7]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[7]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[7]~q\ & (\INSTLIGHTS|clk_proc:COUNT[6]~2\ $ (GND))) # (!\INSTLIGHTS|clk_proc:COUNT[7]~q\ & (!\INSTLIGHTS|clk_proc:COUNT[6]~2\ & VCC))
-- \INSTLIGHTS|clk_proc:COUNT[7]~2\ = CARRY((\INSTLIGHTS|clk_proc:COUNT[7]~q\ & !\INSTLIGHTS|clk_proc:COUNT[6]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[7]~q\,
	datad => VCC,
	cin => \INSTLIGHTS|clk_proc:COUNT[6]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[7]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[7]~2\);

\INSTLIGHTS|clk_proc:COUNT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[7]~q\);

\INSTLIGHTS|clk_proc:COUNT[8]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[8]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[8]~q\ & (!\INSTLIGHTS|clk_proc:COUNT[7]~2\)) # (!\INSTLIGHTS|clk_proc:COUNT[8]~q\ & ((\INSTLIGHTS|clk_proc:COUNT[7]~2\) # (GND)))
-- \INSTLIGHTS|clk_proc:COUNT[8]~2\ = CARRY((!\INSTLIGHTS|clk_proc:COUNT[7]~2\) # (!\INSTLIGHTS|clk_proc:COUNT[8]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[8]~q\,
	datad => VCC,
	cin => \INSTLIGHTS|clk_proc:COUNT[7]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[8]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[8]~2\);

\INSTLIGHTS|clk_proc:COUNT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[8]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[8]~q\);

\INSTLIGHTS|clk_proc:COUNT[9]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[9]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[9]~q\ & (\INSTLIGHTS|clk_proc:COUNT[8]~2\ $ (GND))) # (!\INSTLIGHTS|clk_proc:COUNT[9]~q\ & (!\INSTLIGHTS|clk_proc:COUNT[8]~2\ & VCC))
-- \INSTLIGHTS|clk_proc:COUNT[9]~2\ = CARRY((\INSTLIGHTS|clk_proc:COUNT[9]~q\ & !\INSTLIGHTS|clk_proc:COUNT[8]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[9]~q\,
	datad => VCC,
	cin => \INSTLIGHTS|clk_proc:COUNT[8]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[9]~1_combout\,
	cout => \INSTLIGHTS|clk_proc:COUNT[9]~2\);

\INSTLIGHTS|clk_proc:COUNT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[9]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[9]~q\);

\INSTLIGHTS|clk_proc:COUNT[10]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|clk_proc:COUNT[10]~1_combout\ = \INSTLIGHTS|clk_proc:COUNT[10]~q\ $ (\INSTLIGHTS|clk_proc:COUNT[9]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INSTLIGHTS|clk_proc:COUNT[10]~q\,
	cin => \INSTLIGHTS|clk_proc:COUNT[9]~2\,
	combout => \INSTLIGHTS|clk_proc:COUNT[10]~1_combout\);

\INSTLIGHTS|clk_proc:COUNT[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INSTLIGHTS|clk_proc:COUNT[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INSTLIGHTS|clk_proc:COUNT[10]~q\);

\INSTSM|WideOr2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr2~1_combout\ = (!\INSTSM|current_state.S6~q\ & !\INSTSM|current_state.S7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INSTSM|current_state.S6~q\,
	datad => \INSTSM|current_state.S7~q\,
	combout => \INSTSM|WideOr2~1_combout\);

\INSTLIGHTS|DOUT_TEMP[6]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|DOUT_TEMP[6]~0_combout\ = (\INSTLIGHTS|clk_proc:COUNT[10]~q\ & (((!\INSTSM|WideOr2~1_combout\)))) # (!\INSTLIGHTS|clk_proc:COUNT[10]~q\ & ((\INSTSM|current_state.S14~q\) # ((\INSTSM|current_state.S15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S14~q\,
	datab => \INSTSM|current_state.S15~q\,
	datac => \INSTLIGHTS|clk_proc:COUNT[10]~q\,
	datad => \INSTSM|WideOr2~1_combout\,
	combout => \INSTLIGHTS|DOUT_TEMP[6]~0_combout\);

\INSTSM|WideOr3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr3~combout\ = (\INSTSM|current_state.S3~q\) # ((\INSTSM|current_state.S2~q\) # ((\INSTSM|current_state.S4~q\) # (\INSTSM|current_state.S5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S3~q\,
	datab => \INSTSM|current_state.S2~q\,
	datac => \INSTSM|current_state.S4~q\,
	datad => \INSTSM|current_state.S5~q\,
	combout => \INSTSM|WideOr3~combout\);

\INSTSM|WideOr6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr6~0_combout\ = (\INSTSM|current_state.S11~q\) # ((\INSTSM|current_state.S10~q\) # ((\INSTSM|current_state.S12~q\) # (\INSTSM|current_state.S13~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S11~q\,
	datab => \INSTSM|current_state.S10~q\,
	datac => \INSTSM|current_state.S12~q\,
	datad => \INSTSM|current_state.S13~q\,
	combout => \INSTSM|WideOr6~0_combout\);

\INSTSM|WideOr9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr9~0_combout\ = (\INSTSM|current_state.S2~q\) # ((\INSTSM|current_state.S10~q\) # ((\INSTSM|current_state.S6~q\) # (\INSTSM|current_state.S14~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S2~q\,
	datab => \INSTSM|current_state.S10~q\,
	datac => \INSTSM|current_state.S6~q\,
	datad => \INSTSM|current_state.S14~q\,
	combout => \INSTSM|WideOr9~0_combout\);

\INSTSM|WideOr8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr8~0_combout\ = (\INSTSM|current_state.S0~q\ & (!\INSTSM|current_state.S4~q\ & (!\INSTSM|current_state.S12~q\ & !\INSTSM|current_state.S8~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S0~q\,
	datab => \INSTSM|current_state.S4~q\,
	datac => \INSTSM|current_state.S12~q\,
	datad => \INSTSM|current_state.S8~q\,
	combout => \INSTSM|WideOr8~0_combout\);

\INSTSM|WideOr9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr9~combout\ = (\INSTSM|WideOr9~0_combout\) # (!\INSTSM|WideOr8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|WideOr9~0_combout\,
	datad => \INSTSM|WideOr8~0_combout\,
	combout => \INSTSM|WideOr9~combout\);

\INSTSM|WideOr8~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr8~1_combout\ = (\INSTSM|current_state.S5~q\) # ((\INSTSM|current_state.S13~q\) # ((\INSTSM|current_state.S1~q\) # (\INSTSM|current_state.S9~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S5~q\,
	datab => \INSTSM|current_state.S13~q\,
	datac => \INSTSM|current_state.S1~q\,
	datad => \INSTSM|current_state.S9~q\,
	combout => \INSTSM|WideOr8~1_combout\);

\INSTSM|WideOr8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr8~combout\ = (\INSTSM|WideOr8~1_combout\) # (!\INSTSM|WideOr8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|WideOr8~1_combout\,
	datad => \INSTSM|WideOr8~0_combout\,
	combout => \INSTSM|WideOr8~combout\);

\INSTSM|WideOr2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr2~0_combout\ = (\INSTSM|current_state.S0~q\ & (!\INSTSM|current_state.S3~q\ & (!\INSTSM|current_state.S2~q\ & !\INSTSM|current_state.S1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S0~q\,
	datab => \INSTSM|current_state.S3~q\,
	datac => \INSTSM|current_state.S2~q\,
	datad => \INSTSM|current_state.S1~q\,
	combout => \INSTSM|WideOr2~0_combout\);

\INSTSM|WideOr7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr7~combout\ = (\INSTSM|current_state.S11~q\) # ((\INSTSM|current_state.S10~q\) # ((!\INSTSM|WideOr7~0_combout\) # (!\INSTSM|WideOr2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S11~q\,
	datab => \INSTSM|current_state.S10~q\,
	datac => \INSTSM|WideOr2~0_combout\,
	datad => \INSTSM|WideOr7~0_combout\,
	combout => \INSTSM|WideOr7~combout\);

\INSTSM|WideOr2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|WideOr2~combout\ = (\INSTSM|current_state.S4~q\) # ((\INSTSM|current_state.S5~q\) # ((!\INSTSM|WideOr2~1_combout\) # (!\INSTSM|WideOr2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S4~q\,
	datab => \INSTSM|current_state.S5~q\,
	datac => \INSTSM|WideOr2~0_combout\,
	datad => \INSTSM|WideOr2~1_combout\,
	combout => \INSTSM|WideOr2~combout\);

\INSTLIGHTS|DOUT[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|DOUT[0]~0_combout\ = \INSTSM|WideOr2~combout\ $ (\INSTLIGHTS|clk_proc:COUNT[10]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INSTSM|WideOr2~combout\,
	datad => \INSTLIGHTS|clk_proc:COUNT[10]~q\,
	combout => \INSTLIGHTS|DOUT[0]~0_combout\);

\INST3|blink_sig~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|blink_sig~0_combout\ = (\INST3|clk_divider:counter[2]~q\ & !\INSTMID|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[2]~q\,
	datad => \INSTMID|sreg\(1),
	combout => \INST3|blink_sig~0_combout\);

\INST3|blink_sig\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|blink_sig~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|blink_sig~q\);

\INSTSM|Selector2~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|Selector2~3_combout\ = (\INSTSM|WideOr3~combout\) # ((\INST3|blink_sig~q\ & ((\INSTSM|current_state.S1~q\) # (!\INSTSM|current_state.S0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S0~q\,
	datab => \INSTSM|current_state.S1~q\,
	datac => \INSTSM|WideOr3~combout\,
	datad => \INST3|blink_sig~q\,
	combout => \INSTSM|Selector2~3_combout\);

\INSTSM|Selector3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|Selector3~2_combout\ = (\INSTSM|WideOr6~0_combout\) # ((\INST3|blink_sig~q\ & ((\INSTSM|current_state.S8~q\) # (\INSTSM|current_state.S9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S8~q\,
	datab => \INSTSM|current_state.S9~q\,
	datac => \INSTSM|WideOr6~0_combout\,
	datad => \INST3|blink_sig~q\,
	combout => \INSTSM|Selector3~2_combout\);

\INSTLIGHTS|DOUT[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTLIGHTS|DOUT[3]~1_combout\ = (\INSTLIGHTS|clk_proc:COUNT[10]~q\ & (\INSTSM|Selector2~3_combout\)) # (!\INSTLIGHTS|clk_proc:COUNT[10]~q\ & ((\INSTSM|Selector3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|Selector2~3_combout\,
	datab => \INSTSM|Selector3~2_combout\,
	datad => \INSTLIGHTS|clk_proc:COUNT[10]~q\,
	combout => \INSTLIGHTS|DOUT[3]~1_combout\);

\INSTSM|ew_amber\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INSTSM|ew_amber~combout\ = (\INSTSM|current_state.S14~q\) # (\INSTSM|current_state.S15~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INSTSM|current_state.S14~q\,
	datab => \INSTSM|current_state.S15~q\,
	combout => \INSTSM|ew_amber~combout\);

\pb_n[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(2),
	o => \pb_n[2]~input_o\);

\pb_n[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(3),
	o => \pb_n[3]~input_o\);

\sw[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(0),
	o => \sw[0]~input_o\);

\sw[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(1),
	o => \sw[1]~input_o\);

\sw[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(2),
	o => \sw[2]~input_o\);

\sw[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(3),
	o => \sw[3]~input_o\);

\sw[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(4),
	o => \sw[4]~input_o\);

\sw[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(5),
	o => \sw[5]~input_o\);

\sw[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(6),
	o => \sw[6]~input_o\);

\sw[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(7),
	o => \sw[7]~input_o\);

ww_leds(0) <= \leds[0]~output_o\;

ww_leds(1) <= \leds[1]~output_o\;

ww_leds(2) <= \leds[2]~output_o\;

ww_leds(3) <= \leds[3]~output_o\;

ww_leds(4) <= \leds[4]~output_o\;

ww_leds(5) <= \leds[5]~output_o\;

ww_leds(6) <= \leds[6]~output_o\;

ww_leds(7) <= \leds[7]~output_o\;

ww_seg7_data(0) <= \seg7_data[0]~output_o\;

ww_seg7_data(1) <= \seg7_data[1]~output_o\;

ww_seg7_data(2) <= \seg7_data[2]~output_o\;

ww_seg7_data(3) <= \seg7_data[3]~output_o\;

ww_seg7_data(4) <= \seg7_data[4]~output_o\;

ww_seg7_data(5) <= \seg7_data[5]~output_o\;

ww_seg7_data(6) <= \seg7_data[6]~output_o\;

ww_seg7_char1 <= \seg7_char1~output_o\;

ww_seg7_char2 <= \seg7_char2~output_o\;

ww_sm_clken <= \sm_clken~output_o\;

ww_blink_sig <= \blink_sig~output_o\;

ww_NS_a <= \NS_a~output_o\;

ww_NS_g <= \NS_g~output_o\;

ww_NS_d <= \NS_d~output_o\;

ww_EW_a <= \EW_a~output_o\;

ww_EW_g <= \EW_g~output_o\;

ww_EW_d <= \EW_d~output_o\;
END structure;


